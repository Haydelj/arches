#include "unit-base.hpp"

#include "../simulator-core.hpp"


namespace Arches { namespace Units {


UnitBase::UnitBase(Simulator* simulator) : simulator(simulator) {
	simulator->add_new_unit(this);
}

void UnitBase::add_output_to(UnitBase* other, size_t max_buffer_length) {
	//Filled in with the real value by concatenated buffers constructor
	_receiver_port_ids[other] = max_buffer_length;
}

void UnitBase::send_output_to(UnitBase* other, WorkItem const& item, cycles in_future) const {
	size_t port_id = _receiver_port_ids.at(other);
	simulator->add_work_item_to( other, port_id, item, in_future );
}


}}
