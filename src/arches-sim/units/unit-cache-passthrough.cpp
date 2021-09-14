#include "unit-cache-passthrough.hpp"


namespace Arches { namespace Units {


void UnitPassthroughCache::process(InputBuffer* buffer, cycles current_cycle) /*override*/
{
LOOP:
	WorkItem* work_item = _arbitrator.get_next(buffer);
	if (work_item != nullptr)
	{
		switch (work_item->type) 
		{
		case WorkItem::TYPE::LOAD: //fallthrough
			send_load_to_mem_higher(*work_item, 1);
			break;

		case WorkItem::TYPE::LOAD_RETURN:
			send_load_return_to_mem_lower(*work_item, 1);
			break;

		case WorkItem::TYPE::STORE: //fallthrough
			send_store_to_mem_higher(*work_item, 1);
			break;

		nodefault;
		//default:
		//	send_output_to(_mem_lowers[0].unit, *work_item, 1);
		}

		goto LOOP;
	}
}


}}
