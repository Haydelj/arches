#include "unit-sram.hpp"

#include "unit-memory-base.hpp"

namespace Arches { namespace Units {


UnitSRAM::UnitSRAM(Simulator* simulator, uint latency, uint16_t num_clients, size_t size_bytes) : UnitRAMBase(simulator, num_clients, size_bytes)
{
	_latency = latency;
}
UnitSRAM::~UnitSRAM() /*override*/ 
{
	
}

void UnitSRAM::_load (WorkItem*       work_item) 
{
	//Note: in this method, we reuse `work_item` as the new load-return work item we send back down the memory hierarchy.
	physical_address paddr = work_item->load.paddr;
	work_item->type = WorkItem::TYPE::LOAD_RETURN;

	//Note: `work_item->load_return.paddr`, `work_item->load_return.dst_unit_type`, and
	//	`work_item->load_return.dst_unit_data` are in the same places as the corresponding fields in
	//	`work_item->load`, therefore we do not need to copy these fields.
	static_assert(offsetof(WorkItem,load_return.paddr        )==offsetof(WorkItem,load.paddr        ),"Implementation error!");
	static_assert(offsetof(WorkItem,load_return.dst_unit_data)==offsetof(WorkItem,load.dst_unit_data),"Implementation error!");
	
	std::memcpy(work_item->load_return.data.u8, _data_u8 + paddr, work_item->load_return.size);

	remove_last_from_pending();
	send_load_return_to_mem_lower(*work_item, _latency);
}

void UnitSRAM::_store(WorkItem const* work_item) 
{
	physical_address paddr = work_item->store.paddr;
	std::memcpy(_data_u8 + paddr, work_item->store.data.u8, work_item->store.size);
	remove_last_from_pending();
}
void UnitSRAM::process(InputBuffer* buffer, cycles current_cycle) /*override*/
{
	WorkItem* work_item;
	while (work_item = _arbitrator.get_next(buffer))
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
		WorkItem* work_item = &pending->work_item;
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
	if (has_pending())
	{
		WorkItem item;
		item.type = WorkItem::TYPE::CONTINUE;
		send_output_to(this, item, 1);
	}
}


}}
