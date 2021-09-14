#include "unit-shared-functional.hpp"

#include <arches-sim/isa/riscv.hpp>

using namespace TRaX;

using namespace Arches;
using namespace Arches::Units;
using namespace Arches::Units::RISCV;

UnitSharedFunctional::UnitSharedFunctional(Simulator* simulator, uint num_clients, uint issues_per_cycle, cycles latency) :
	UnitBase(simulator)
{
	priority = 1;

	_num_clients = std::max(num_clients, 1u);
	_cluster_size = issues_per_cycle;
	_latency = latency;

	add_output_to(this, 1);

	//_clients = new _ClientData[_num_clients];
	_clients.resize(_num_clients);
	_pending.resize(_num_clients, false);
}

UnitSharedFunctional::~UnitSharedFunctional()
{
	//delete[] _clients;
}

void UnitSharedFunctional::add_unit(UnitExecutionBase* unit)
{
	assert(unit->id < _num_clients);
	_clients[unit->id].unit = unit;
	if (_latency == 1) add_output_to(unit, 2);
	else               add_output_to(unit, 1);
	//add_output_to(unit, 1);
}

void UnitSharedFunctional::process(InputBuffer* buffer, cycles current_cycle) /*override*/
{
	Arches::WorkItem* work_item;
	while (work_item = buffer->get_next_work_item())
	{
		//assert(work_item->type == WorkItem::TYPE::MOCK_EXECUTE);
		switch (work_item->type)
		{
		case WorkItem::TYPE::MOCK_EXECUTE:
		{
			int client_id = work_item->write_back.thread_id;
			assert(!_pending[client_id]);
			_clients[client_id].dst_reg = work_item->write_back.dst_reg;
			_clients[client_id].dst_reg_file = work_item->write_back.dst_reg_file;
			_pending[client_id] = true;
			++_num_clients_pending;
		}
		break;

		case WorkItem::TYPE::CONTINUE:
		break;
		}
	}

	assert(work_item == nullptr);

	if (current_cycle != _previous_cycle) _instr_accepted_this_cycle = 0;
	uint i = _current_client_id;
	do
	{
		if (_pending[i])
		{
			_pending[i] = false;
			--_num_clients_pending;
			++_instr_accepted_this_cycle;

			WorkItem item;
			item.type = WorkItem::TYPE::REQUEST_ACCEPTED;
			send_output_to(_clients[i].unit, item, 0);

			item.type = WorkItem::TYPE::WRITE_BACK;
			item.write_back.dst_reg = _clients[i].dst_reg;
			item.write_back.dst_reg_file = _clients[i].dst_reg_file;
			send_output_to(_clients[i].unit, item, _latency-1);
			if(_instr_accepted_this_cycle >= _cluster_size  || _num_clients_pending == 0) break;
		}
		i = (i + 1) % _num_clients;
	} while (i != _current_client_id);

	_current_client_id = i;

	if (current_cycle != _previous_cycle && _num_clients_pending > 0)
	{
		WorkItem item;
		item.type = WorkItem::TYPE::CONTINUE;
		send_output_to(this, item, 1);
	}

	_previous_cycle = current_cycle;
}

