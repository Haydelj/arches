#include "unit-cache.hpp"


namespace Arches { namespace Units {

UnitCache::UnitCache(Simulator* simulator, CacheConfiguration config, uint16_t num_clients, uint16_t id) : UnitMemoryBase(simulator, num_clients, id)
{
	priority = 0;
	_configuration = config;

	_data_u8.resize(config.cache_size);
	_cache_state.resize(config.cache_size / config.line_size);
	_ports.resize(config.num_ports);
	_banks.resize(config.num_banks);

	_associativity = config.associativity;
	_line_size = config.line_size;
	_num_banks = config.num_banks;
	_num_ports = config.num_ports;
	_ports_open = _num_ports;
	_penalty = config.penalty;

	uint num_sets = config.cache_size / (config.line_size * config.associativity);

	_offset_bits = log2i(config.line_size);
	_set_index_bits = log2i(num_sets);
	_tag_bits = static_cast<uint>(sizeof(physical_address) * 8) - (_set_index_bits + _offset_bits);
	_bank_index_bits = log2i(config.num_banks);

	_offset_mask = generate_nbit_mask(_offset_bits);
	_set_index_mask = generate_nbit_mask(_set_index_bits);
	_tag_mask = generate_nbit_mask(_tag_bits);
	_bank_index_mask = generate_nbit_mask(_bank_index_bits);

	_set_index_offset = _offset_bits;
	_tag_offset = _offset_bits + _set_index_bits;
	_bank_index_offset = log2i(config.bank_stride * config.line_size);

	add_output_to(this, _num_ports);
}

UnitCache::~UnitCache()
{
	//delete[] _data_u8;
	//delete[] _cache_state;
	//delete[] _ports;
	//delete[] _banks;
}

//update lru and returns data pointer to cache line
uint8_t* UnitCache::_get_cache_line(physical_address paddr)
{
	uint64_t start = _get_set_index(paddr) * _associativity;
	uint64_t end = start + _associativity;

	uint64_t tag = _get_tag(paddr);

	uint found_index = ~0;
	uint found_lru = 0;
	for (uint i = start; i < end; ++i)
	{
		if (_cache_state[i].valid && _cache_state[i].tag == tag)
		{
			found_index = i;
			found_lru = _cache_state[i].lru;
			break;
		}
	}
	
	if (found_index == ~0) return nullptr; //didn't find line so we will eave lru alone and return nullptr

	for (uint i = start; i < end; ++i)
		if (_cache_state[i].lru < found_lru) _cache_state[i].lru++;

	_cache_state[found_index].lru = 0;

	return _get_cache_line_data_pointer(found_index);
}

//inserts cacheline associated with paddr replacing least recently used. Assumes cachline isn't already in cache if it is this has undefined behaviour
void UnitCache::_insert_cache_line(physical_address paddr, uint8_t* data)
{
	uint64_t start = _get_set_index(paddr) * _associativity;
	uint64_t end = start + _associativity;

	uint replacement_index = ~0;
	uint replacement_lru = 0;
	for (uint i = start; i < end; ++i)
	{
		if (!_cache_state[i].valid)
		{
			replacement_index = i;
			break;
		}

		if (_cache_state[i].lru >= replacement_lru)
		{
			replacement_lru = _cache_state[i].lru;
			replacement_index = i;
		}
	}

	for (uint i = start; i < end; ++i)
		_cache_state[i].lru++;

	_cache_state[replacement_index].lru = 0;
	_cache_state[replacement_index].valid = true;
	_cache_state[replacement_index].tag = _get_tag(paddr);

	uint8_t* dst = _get_cache_line_data_pointer(replacement_index);
	std::memcpy(dst, data, _line_size);
}

int UnitCache::_accuire_port_and_banks(physical_address paddr, uint access_size)
{
	if (_ports_open <= 0) return -1;

	physical_address aligned_paddr[2];
	aligned_paddr[0] = _get_cache_line_start_paddr(paddr);
	aligned_paddr[1] = _get_cache_line_start_paddr(paddr + (access_size - 1));

	uint selected_bank[2];
	for (uint i = 0; i < 2; ++i)
		selected_bank[i] = _get_bank(aligned_paddr[i]);

	assert(aligned_paddr[0] == aligned_paddr[1]);

	int port;
	if (_banks[selected_bank[0]].port >= 0 || _banks[selected_bank[1]].port >= 0) return -1; //we can't accept this request on this cycle since the bank is busy so we go on to the next
	else
	{
		//acquire port
		for (port = 0; port < _num_ports; ++port)
			if (_ports[port].open)
			{
				_ports[port].open = false;
				_ports[port].load_offset = 0;
				--_ports_open;

				//std::cout << "selected bank: " << selected_bank[0];
				for (uint i = 0; i < 2; ++i)
					_banks[selected_bank[i]].port = port;
				
				return port;
			}
	}
	return -1;
}

void UnitCache::_release_port_and_banks(int port)
{
	assert(port >= 0);
	for (uint i = 0; i < _num_banks; ++i)
		if (_banks[i].port == port) _banks[i].port = -1;

	_ports[port].open = true;
	++_ports_open;
}

void UnitCache::_process_load(WorkItem* work_item, int port)
{
	physical_address paddr = work_item->load.paddr;
	uint size = work_item->load.size;

	//if we don't have a port try to aquire one;
	bool assigned_port = false;

	if (port < 0)
	{
		port = _accuire_port_and_banks(paddr, size);
		if (port < 0) return; //if we cant aquire a port return

		assigned_port = true;
		remove_last_from_pending();
		_logger.log_event(Logger::Event::LOAD);
		_ports[port].work_item = *work_item; //for now we will always do this TODO: do only when we need too
	}
		
	uint load_data_offset = _ports[port].load_offset;
	while (load_data_offset < size)
	{
		physical_address current_address = paddr + load_data_offset;
		uint8_t* current_cache_line = _get_cache_line(current_address);
		if (!current_cache_line) //data not in cache load it from mem higher keeping the port locked
		{
			_logger.log_event(Logger::Event::LOAD_MISS);
			_ports[port].pending_work_item = _ports[port].work_item;
			_ports[port].pending_work_item.type = WorkItem::TYPE::LOAD;
			_ports[port].pending_work_item.load.paddr = _get_cache_line_start_paddr(current_address);
			_ports[port].pending_work_item.load.size = _line_size;
			work_item->type = WorkItem::TYPE::PORT_PENDING;
			work_item->port_status.port = port;
			send_output_to(this, *work_item, _penalty);
			return;
		}

		if(assigned_port) _logger.log_event(Logger::Event::LOAD_HIT);
		uint cache_line_offset = _get_offset(paddr + load_data_offset);
		uint bytes_to_next_cache_boundry = _line_size - cache_line_offset;
		uint copy_size = std::min(bytes_to_next_cache_boundry, size);
		std::memcpy(_ports[port].work_item.load_return.data.u8, current_cache_line + cache_line_offset, copy_size);
		load_data_offset += copy_size;
	}

	cycles remaining_pentalty = assigned_port ? _penalty : 0;
	_ports[port].work_item.type = WorkItem::TYPE::LOAD_RETURN;
	send_load_return_to_mem_lower(_ports[port].work_item, remaining_pentalty);

	work_item->type = WorkItem::TYPE::PORT_READY;
	work_item->port_status.port = port;
	send_output_to(this, *work_item, remaining_pentalty);//remaing pentalty + 1?
}

void UnitCache::_process_load_return(WorkItem* work_item)
{
	physical_address paddr = work_item->load.paddr;
	uint size = work_item->load.size;

	_insert_cache_line(paddr, work_item->load_return.data.u8);

	uint selected_bank = _get_bank(paddr);
	int port = _banks[selected_bank].port;
	assert(port > -1);

	//resume proccesing the corresponding load
	work_item = &(_ports[port].work_item);
	_process_load(work_item, port);
}

void UnitCache::_process_store(WorkItem* work_item)
{
	physical_address paddr = work_item->store.paddr;
	uint size = work_item-> store.size;

	int port = _accuire_port_and_banks(paddr, size);
	if (port < 0) return; //if we cant aquire a port return

	remove_last_from_pending();
	_logger.log_event(Logger::Event::STORE);
	_ports[port].pending_work_item = *work_item;

	//try to add our data to cache now that we have the port
	uint8_t* cache_line = _get_cache_line(paddr);
	assert((paddr & generate_nbit_mask(log2i(size))) == 0);
	if (cache_line) std::memcpy(cache_line + _get_offset(paddr), work_item->store.data.u8, size); //TODO: don't assume alignment

	work_item->type = WorkItem::TYPE::PORT_PENDING;
	work_item->port_status.port = port;
	send_output_to(this, *work_item, _penalty);
}

void UnitCache::process(InputBuffer* buffer, cycles current_cycle) /*override*/
{
	WorkItem* work_item = nullptr;
	assert(!buffer->is_empty());
	while (work_item = buffer->get_next_work_item())
	{
		switch (work_item->type)
		{
		case WorkItem::TYPE::LOAD:
			send_load_to_pending(*work_item);
			break;

		case WorkItem::TYPE::LOAD_RETURN:
			_process_load_return(work_item);
			break;

		case WorkItem::TYPE::STORE:
			send_store_to_pending(*work_item);
			break;
		
		case WorkItem::TYPE::PORT_READY:
			_release_port_and_banks(work_item->port_status.port);
			break;

		case WorkItem::TYPE::PORT_PENDING:
			_ports[work_item->port_status.port].pending_mem_higher = true;
			break;

		case WorkItem::TYPE::REQUEST_ACCEPTED:
			//release the port assiciate with that memory access if it was a store
			if (_port_to_release_on_ready >= 0) 
				_release_port_and_banks(_port_to_release_on_ready);
			_port_to_release_on_ready = -1;

			//We can issue more loads/stores now
			_waiting_on_mem_higher_to_accept_request = false;
			break;

		nodefault;
		}
	}

	if (!_waiting_on_mem_higher_to_accept_request)
	{
		for (uint port = 0; port < _num_ports; ++port)
		{
			if (_ports[port].pending_mem_higher)
			{
				_waiting_on_mem_higher_to_accept_request = true;
				_ports[port].pending_mem_higher = false;

				if      (_ports[port].pending_work_item.type == WorkItem::TYPE::LOAD)
					send_load_to_mem_higher(_ports[port].pending_work_item, 1); //TODO check latencey to make sure its should be 1 or 0
				else if (_ports[port].pending_work_item.type == WorkItem::TYPE::STORE)
				{
					_port_to_release_on_ready = port;
					send_store_to_mem_higher(_ports[port].pending_work_item, 1);
				}
				break;
			}
		}
	}

	_ClientData* pending = nullptr; work_item = nullptr;
	while ((_ports_open > 0) && (pending = get_next_pending()))
	{
		work_item = &pending->work_item;
		switch (work_item->type)
		{
		case WorkItem::TYPE::LOAD: // Load types - returns cache line (if found) or sends to mem_higher
			_process_load(work_item);
			break;

		case WorkItem::TYPE::STORE: // Store types - updates line (if found) and sends to mem_higher
			_process_store(work_item);
			break;
		}
	}

	reset_pending();
}

}}