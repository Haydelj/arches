#pragma once

#include "stdafx.hpp"

#include "util/barrier.hpp"
#include "util/atomic-vector.hpp"
#include "USIMM/memory_controller.h"

#include "work-item.hpp"


namespace Arches {


namespace Units {
	class ConcatenatedBuffers;
	class InputBuffer;
	class UnitBase;
	class UnitDRAM;
}

class Barrier final {
private:
	std::mutex _mutex;
	std::condition_variable _cv;

	size_t _count;

public:
	Barrier() : _count(0) {}
	~Barrier() = default;

	void operator()(size_t num_threads) 
	{
		std::unique_lock<std::mutex> lock(_mutex);

		++_count;

		if(_count < num_threads) {
			_cv.wait(lock);
		}
		else {
			_count = 0;
			_cv.notify_all();
		}
	}
};


class Simulator final {
	private:
		//Backing store of units
		std::vector<Units::UnitBase*> _units;

		class State final {
			public:
				typedef uint64_t pass_id;

			private:
				//Concatenated buffers of all units at a particular pass
				struct _Pass final {
					cycles                      cycle        {0};
					Units::ConcatenatedBuffers* unit_buffers {nullptr};
				};

				#define MAX_CYCLES_IN_FUTURE 64ull
				bool _valid[MAX_CYCLES_IN_FUTURE]{ false }; //TODO: should this be atomic?
				Units::ConcatenatedBuffers* _buffers[MAX_CYCLES_IN_FUTURE];
				Units::ConcatenatedBuffers* _temp_buffer;
				size_t _mask;

				//std::stack<Units::ConcatenatedBuffers*> _unit_buffers_scratch; //Scratch space for recycling finished buffers.
				Units::ConcatenatedBuffers* _example_buffer;

			public:
				Units::UnitDRAM* dram;
				size_t static_block_size;
				std::atomic_size_t threads_ready{0};
				size_t num_buffers;
				std::vector<Units::InputBuffer*> active_buffers;
				std::atomic_size_t next_buffer{ 0 };

				_Pass current_pass{0, nullptr};
				//Units::ConcatenatedBuffers* current_pass_buffer {nullptr};
				//cycles current_pass_cycle {0ull};

			private:
				_Pass _pop_next_pass_unsafe();
				Units::ConcatenatedBuffers* _get_fresh_buffer_unsafe();

			public:
				explicit State(Simulator* simulator);
				~State();

				Units::ConcatenatedBuffers* get_or_add_buffer_for_pass(cycles in_future);
	
				void prepare_next_pass_unsafe();
				void finish_pass_unsafe();

				void thread_work(size_t thread_index, size_t num_threads);
		};
		State* _state;
		Units::UnitDRAM* _dram{ nullptr };//TODO: NOT THIS!!!

		//Threading
		std::atomic_bool _start, _continuing, _pause;
		
		Util::barrier _barrier0;
		Util::barrier _barrier1;
		std::vector<std::thread*> _thread_pool;

	public:
		Simulator() : _state(nullptr) {}
		~Simulator();

		void finalize_architecture();
		void prepare_units();

		//User will not need; called by units on construction.
		void add_new_unit(Units::UnitBase* new_unit) { _units.emplace_back(new_unit); }

		void set_dram_unit(Units::UnitDRAM* dram_unit) { this->_dram = dram_unit; }

		void add_work_item_to(Units::UnitBase* dst, size_t dst_port, WorkItem const& item, cycles in_future);

		Arches::cycles get_current_cycle_unsafe() { return _state->current_pass.cycle; }

	private:
		void _thread_work(size_t thread_index, size_t num_threads);
	public:
		void start  (size_t num_threads);
		void pause  (                  ) { _pause=true;  }
		void unpause(                  ) { _pause=false; }
		void abort  (                  );
		void wait   (                  );
};


}
