#pragma once

#include "../stdafx.hpp"

#include "../work-item.hpp"


namespace Arches {


class Simulator;


namespace Units {


class InputBuffer;


class UnitBase {
	friend class ConcatenatedBuffers;
	public:
		Simulator*const simulator;

		//Index in simulator and concatenated buffers ordering of units.
		//	Note: not necessarily the order added in!
		size_t index;
		size_t priority{1}; //high = 0, medium = 1, low = 2

	protected:
		std::map<UnitBase*,size_t> _receiver_port_ids;

	protected:
		explicit UnitBase(Simulator* simulator);
	public:
		virtual ~UnitBase() = default;

		/*InputBuffer* get_curr_pass_input_buffer() const {
			return simulator->get_curr_pass_input_buffer(this);
		}*/

		bool operator<(UnitBase& other) { return priority < other.priority; }

		void add_output_to(UnitBase* other, size_t max_buffer_length);
		void send_output_to(UnitBase* other, WorkItem const& item, cycles in_future) const;

		void finalize_architecture(size_t index) { this->index=index; }
		virtual void prepare() {}
		virtual void process_per_cycle(){}

		virtual void process(InputBuffer* buffer, cycles current_cycle) = 0;
};


}}
