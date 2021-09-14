#include "unit-dram.hpp"

#include "../simulator-core.hpp"

#include "../USIMM/usimm.h"

namespace Arches { namespace Units {


UnitDRAM::UnitDRAM(Simulator* simulator, uint16_t num_clients, size_t size_bytes) : UnitRAMBase(simulator, num_clients, size_bytes)
{
	priority = 1;
	_simulator = simulator;
	simulator->set_dram_unit(this);

	char* usimm_config_file = (char*)REL_PATH_BIN_TO_SAMPLES"gddr5_8ch.cfg";
	char* usimm_vi_file = (char*)REL_PATH_BIN_TO_SAMPLES"1Gb_x16_amd2GHz.vi";

	if (usimm_setup(usimm_config_file, usimm_vi_file) < 0) assert(false); //usimm faild to initilize

	add_output_to(this, 2);

	_num_work_items = 0;
}
UnitDRAM::~UnitDRAM() /*override*/ 
{
	usimmDestroy();
}

bool UnitDRAM::usimm_busy() { 
	return usimmIsBusy(); 
}

void UnitDRAM::update_usimm(Arches::cycles curr_cycle)
{
	_current_cycle = curr_cycle;
	for (uint i = 0; i < DRAM_CLOCK_MULTIPLIER; ++i)
		usimmClock();
}

void UnitDRAM::print_usimm_stats(uint32_t const L2_line_size,
	uint32_t const word_size,
	Arches::cycles cycle_count)
{
	printUsimmStats(L2_line_size, word_size, cycle_count);
}

void UnitDRAM::UsimmNotifyEvent(Arches::physical_address const address, Arches::cycles write_cycle, uint32_t request_id)
{
	WorkItem work_item = request_map[request_id];
	//std::cout << write_cycle << "\n";
	assert((write_cycle - _current_cycle) >= 0);
	send_load_return_to_mem_lower(work_item, write_cycle - _current_cycle);
	//update instruction cycle count 
	request_map.erase(request_id);
}


void UnitDRAM::_load (WorkItem*       work_item)
{
	//Note: in this method, we reuse `work_item` as the new load-return work item we send back down the memory hierarchy.
	physical_address paddr = work_item->load.paddr;
	work_item->type = WorkItem::TYPE::LOAD_RETURN;

	//Note: `work_item->load_return.paddr`, `work_item->load_return.dst_unit_type`, and
	//`work_item->load_return.dst_unit_data` are in the same places as the corresponding fields in
	//`work_item->load`, therefore we do not need to copy these fields.
	static_assert(offsetof(WorkItem, load_return.paddr          ) == offsetof(WorkItem,load.paddr           ),"Implementation error!");
	static_assert(offsetof(WorkItem, load_return.dst_unit_data  ) == offsetof(WorkItem,load.dst_unit_data   ),"Implementation error!");
	static_assert(offsetof(WorkItem, load_return.dst_stack_index) == offsetof(WorkItem, load.dst_stack_index), "Implementation error!");

	//printf("DRAM load of size %d:\n\t", work_item->load_return.size);
	//_print_data(&_data_u8[paddr], work_item->load_return.size);

	std::memcpy(&work_item->load_return.data.u8[0], &_data_u8[paddr], work_item->load_return.size);

	//iterface with usimm
	dram_address_t const dram_addr = calcDramAddr(paddr);

	arches_request_t req;
	req.arches_addr = paddr;
	req.listener = this;
	req.id = _num_work_items;

	reqInsertRet_t request = insert_read(dram_addr, req, _current_cycle * DRAM_CLOCK_MULTIPLIER);

	if (request.retType == reqInsertRet_tt::RRT_READ_QUEUE_FULL) return;

	assert(request.retType == reqInsertRet_tt::RRT_WRITE_QUEUE || request.retType == reqInsertRet_tt::RRT_READ_QUEUE);
	
	if (request.retLatencyKnown)
	{
		//printf("%llu", request.completionTime / DRAM_CLOCK_MULTIPLIER - _current_cycle);
		send_load_return_to_mem_lower(*work_item, request.completionTime / DRAM_CLOCK_MULTIPLIER - _current_cycle);
	}
	else
	{
		request_map[req.id] = *work_item;
		++_num_work_items;
	}

	remove_last_from_pending();
}

void UnitDRAM::_store(WorkItem const* work_item) 
{
	physical_address paddr = work_item->store.paddr;
	std::memcpy(&_data_u8[paddr], &work_item->store.data.u8[0], work_item->store.size);

	//interface with usimm
	dram_address_t const dram_addr = calcDramAddr(paddr);

	arches_request_t req;
	req.arches_addr = paddr;
	req.listener = this;
	req.id = _num_work_items;

	reqInsertRet_t request = insert_write(dram_addr, req, _current_cycle);
	if (request.retType == reqInsertRet_tt::RRT_WRITE_QUEUE_FULL) return;

	if (request.retLatencyKnown)
	{
		assert(false);
		return;
	}

	assert(request.retType == reqInsertRet_tt::RRT_WRITE_QUEUE);
	remove_last_from_pending();
}

void UnitDRAM::process(InputBuffer* buffer, cycles current_cycle) /*override*/
{
	//_current_cycle = simulator->get_current_cycle();
	WorkItem* work_item = nullptr;
	assert(!buffer->is_empty());
	while (work_item = buffer->get_next_work_item())
	{
		switch (work_item->type)
		{
		case WorkItem::TYPE::LOAD: 
			send_load_to_pending(*work_item);
			break;

		case WorkItem::TYPE::STORE:
			send_store_to_pending(*work_item);
			break;

		case WorkItem::TYPE::CONTINUE: 
			break;
		
		nodefault;
		}
	}
	
	_ClientData* pending = nullptr;
	while (pending = get_next_pending())
	{
		work_item = &pending->work_item;
		switch (work_item->type)
		{
		case WorkItem::TYPE::LOAD:  
			_load(work_item); 
			break;

		case WorkItem::TYPE::STORE: 
			_store(work_item); 
			break;
		}
	}

	reset_pending();
	if (_last_execute_cycle < _current_cycle && has_pending())
	{
		WorkItem item;
		item.type = WorkItem::TYPE::CONTINUE;
		send_output_to(this, item, 1);
		_last_execute_cycle = _current_cycle;
	}
}

}}
