#include "simulator-core.hpp"

#include "units/input-buffer.hpp"
#include "units/input-buffers-concat.hpp"
#include "units/unit-base.hpp"
#include "units/unit-dram.hpp"

#include "util/bit-manipulation.hpp"

namespace Arches {


Simulator::State::State(Simulator* simulator)
{
	_example_buffer = _new Units::ConcatenatedBuffers(simulator->_units);
	_mask = generate_nbit_mask(log_base2(MAX_CYCLES_IN_FUTURE));
	num_buffers = _example_buffer->get_num_buffers();

	for(uint i = 0; i < MAX_CYCLES_IN_FUTURE; ++i)
		_buffers[i] = _new Units::ConcatenatedBuffers(*_example_buffer);

	_temp_buffer = _new Units::ConcatenatedBuffers(*_example_buffer);
}

Simulator::State::~State() 
{
	for(uint i = 0; i < MAX_CYCLES_IN_FUTURE; ++i)
		delete _buffers[i];

	/*
	while (!_unit_buffers_scratch.empty())
	{
		delete _unit_buffers_scratch.top();
		_unit_buffers_scratch.pop();
	}
	*/

	delete _temp_buffer;
	delete _example_buffer;
}

Simulator::State::_Pass Simulator::State::_pop_next_pass_unsafe()
{
	for(cycles cycle = current_pass.cycle; cycle < (current_pass.cycle + MAX_CYCLES_IN_FUTURE); ++cycle)
	{
		size_t index = cycle & _mask;
		if(_valid[index])
		{
			_valid[index] = false;
			std::swap(_buffers[index], _temp_buffer);
			return {cycle, _temp_buffer};
		}
	}
	return {current_pass.cycle, nullptr};
}

Units::ConcatenatedBuffers* Simulator::State::_get_fresh_buffer_unsafe()
{
	assert(false);
	/*
	Units::ConcatenatedBuffers* buffer;
	if (_unit_buffers_scratch.empty())
	{
		buffer = _new Units::ConcatenatedBuffers(*_example_buffer);
	}
	else
	{
		buffer = _unit_buffers_scratch.top();
		_unit_buffers_scratch.pop();
	}
	return buffer;
	*/
	return nullptr;
}

Units::ConcatenatedBuffers* Simulator::State::get_or_add_buffer_for_pass(cycles in_future)
{
	cycles cycle = current_pass.cycle + in_future;
	assert(cycle >= current_pass.cycle);
	assert(in_future < MAX_CYCLES_IN_FUTURE);

	size_t index = cycle & _mask;
	_valid[index] = true;
	return _buffers[index];

	/*
	assert(in_future < MAX_CYCLES_IN_FUTURE);

	cycles cycle = current_pass.cycle + in_future;
	assert(cycle >= current_pass.cycle);
	size_t index = cycle & _mask;
	if (_valid[index])
	{
		assert(cycle == _passes[index].cycle);
		return _passes[index].unit_buffers;
	}

	_mutex.lock();
	if (_valid[index])
	{
		_mutex.unlock();
		assert(cycle == _passes[index].cycle);
		return _passes[index].unit_buffers;
	}

	Units::ConcatenatedBuffers* buffer = _get_fresh_buffer_unsafe();
	_passes[index].unit_buffers = buffer;
	_passes[index].cycle = cycle;
	_valid[index] = true;
	_num_valid_passes++;
	_mutex.unlock();
	
	return buffer;
	*/
}

void Simulator::State::prepare_next_pass_unsafe() 
{
	next_buffer = 0;

TOP:
	cycles last_cycle = current_pass.cycle;
	_Pass pass_next = _pop_next_pass_unsafe();
	if (pass_next.unit_buffers != nullptr)
	{	
		if (dram)
			for (current_pass.cycle++; current_pass.cycle <= pass_next.cycle; ++current_pass.cycle)
				dram->update_usimm(current_pass.cycle);

		assert(current_pass.cycle == (pass_next.cycle + 1));
		current_pass = pass_next;
	}
	else if(dram && dram->usimm_busy())
	{
		current_pass.cycle++;
		dram->update_usimm(current_pass.cycle);
		goto TOP;
	}
	else 
	{
		current_pass.unit_buffers = nullptr;
		active_buffers.clear();
		return;
	}

	/*
	//proccess zero cycle intuctions single threaded (more efficient I think)
	if(current_pass.cycle == last_cycle) 
	{
		for(uint i = 0; i < current_pass.unit_buffers->get_num_buffers(); ++i)
		{
			if(current_pass.unit_buffers->is_buffer_active(i))
			{
				Units::InputBuffer* buffer = current_pass.unit_buffers->get_buffer(i);
				buffer->unit->process(buffer, current_pass.cycle);
				current_pass.unit_buffers->mark_inactive(i);
			}
		}
		goto TOP;
	}
	*/

	active_buffers.clear();
	for(uint i = 0; i < current_pass.unit_buffers->get_num_buffers(); ++i)
	{
		if(current_pass.unit_buffers->is_buffer_active(i))
		{
			active_buffers.push_back(current_pass.unit_buffers->get_buffer(i));
			current_pass.unit_buffers->mark_inactive(i);
		}
	}

	if(active_buffers.size() < 12)
	{
		for(uint i = 0; i < active_buffers.size(); ++i)
		{
			Units::InputBuffer* buffer = active_buffers[i];
			buffer->unit->process(buffer, current_pass.cycle);
		}
		goto TOP;
	}
}

void Simulator::State::finish_pass_unsafe() 
{
	//_unit_buffers_scratch.push(current_pass.unit_buffers);
}

void Simulator::State::thread_work(size_t thread_index, size_t num_threads)
{
	/*
	size_t start = thread_index * block_size;
	size_t end = std::min(start + block_size, num_buffers);

	Units::InputBuffer* buffer;
	for (size_t i = start; i < end; ++i)
		if (current_pass.unit_buffers->is_buffer_active(i))
		{
			Units::InputBuffer* buffer = current_pass.unit_buffers->get_buffer(i);
			buffer->unit->process(buffer, current_pass.cycle);
			current_pass.unit_buffers->mark_inactive(i);
		}
	*/

	/*
	for (uint i = next_buffer.fetch_add(1); i < num_buffers; i = next_buffer.fetch_add(1))
		if (current_pass.unit_buffers->is_buffer_active(i))
		{
			Units::InputBuffer* buffer = current_pass.unit_buffers->get_buffer(i);
			buffer->unit->process(buffer, current_pass.cycle);
			current_pass.unit_buffers->mark_inactive(i);
		}
	*/

	/*
	size_t block_size = ((active_buffers.size() - 1) / num_threads) + 1;
	size_t start = thread_index * block_size;
	size_t end = std::min(start + block_size, active_buffers.size());
	for(uint i = start; i < end; ++i)
	{
		Units::InputBuffer* buffer = active_buffers[i];
		buffer->unit->process(buffer, current_pass.cycle);
	}
	*/

	//printf("%d\n", active_buffers.size());

	size_t size = active_buffers.size();
	for(size_t i = next_buffer.fetch_add(1); i < size; i = next_buffer.fetch_add(1))
	{
		Units::InputBuffer* buffer = active_buffers[i];
		buffer->unit->process(buffer, current_pass.cycle);
	}
}


Simulator::~Simulator() 
{
	for (std::thread* thread : _thread_pool) delete thread;

	delete _state;

	for (Units::UnitBase* unit : _units) delete unit;
}

void Simulator::finalize_architecture() 
{
	//std::sort(_units.begin(), _units.end());
	
	size_t index = 0;
	for (Units::UnitBase* unit : _units) 
	{
		unit->finalize_architecture(index);
		++index;
	}
}

void Simulator::prepare_units() 
{
	for (Units::UnitBase* unit : _units) 
	{
		unit->prepare();
	}
}

void Simulator::add_work_item_to(Units::UnitBase* dst, size_t dst_port, WorkItem const& item, cycles in_future) 
{
	Units::ConcatenatedBuffers* buffer = _state->get_or_add_buffer_for_pass(in_future);
	assert(in_future >= 0 && in_future <= MAX_CYCLES_IN_FUTURE);
	buffer->add_work_item_to(dst, dst_port, item);
}

void Simulator::_thread_work(size_t thread_index, size_t num_threads) 
{
	while(!_start) std::this_thread::yield();

	while(_continuing)
	{
		while(_pause) std::this_thread::yield();

		if(thread_index != 0);
		else _state->prepare_next_pass_unsafe();

		_barrier0(num_threads);

		if(!_state->current_pass.unit_buffers) return;
		_state->thread_work(thread_index, num_threads);

		_barrier1(num_threads);
	}

	return;

	while (!_start) std::this_thread::yield();

	while (_continuing)
	{
		while (_pause) std::this_thread::yield();

		if (thread_index != 0); 
		else _state->prepare_next_pass_unsafe();

		_barrier0(num_threads);

		if(!_state->current_pass.unit_buffers) return;
		_state->thread_work(thread_index, num_threads);
		
		_barrier1(num_threads);
	}

	return;
}

void Simulator::start(size_t num_threads) 
{
	delete _state;
	_state = _new State(this);
	_state->dram = _dram;
	_state->static_block_size = ((_state->num_buffers - 1) / num_threads) + 1;

	prepare_units();

	_start      = false;
	_continuing = true;
	_pause      = false;
	for (size_t i = 0; i < num_threads; ++i) 
	{
		_thread_pool.emplace_back(_new std::thread(&Simulator::_thread_work,this,i,num_threads));
	}

	_start = true;
}

void Simulator::abort  (                  ) 
{
	_continuing = false;
	wait();
}

void Simulator::wait   (                  ) 
{
	for (std::thread* thread : _thread_pool) 
	{
		thread->join();
		delete thread;
	}
	_thread_pool.clear();
	
	printf("Simulation Took: %lld cycles\n", _state->current_pass.cycle);

	delete _state;
	_state = nullptr;
}


}
