#include "input-buffers-concat.hpp"

#include "input-buffer.hpp"
#include "unit-base.hpp"


namespace Arches { namespace Units {

ConcatenatedBuffers::ConcatenatedBuffers(std::vector<UnitBase*> const& units) {
	for(UnitBase* unit : units)
	{
		_buffers.emplace_back(_new InputBuffer(unit));
		//_active.emplace_back(false);
	}
	_buffers.shrink_to_fit();
	//_active.shrink_to_fit();

	for (UnitBase* unit : units)
	{
		for (auto& conn : unit->_receiver_port_ids)
		{
			conn.second = _buffers[conn.first->index]->add_connection(conn.second);
		}
	}

	for (InputBuffer* input_buffer : _buffers)
		input_buffer->finalize();

	assert(_buffers.size() < 32 * 1024);

	//_active = _new (volatile bool)[_buffers.size()]{ false };
}

ConcatenatedBuffers::ConcatenatedBuffers(ConcatenatedBuffers const& other) 
{
	for(InputBuffer* input_buffer : other._buffers)
	{
		_buffers.emplace_back(_new InputBuffer(*input_buffer));
		//_active.emplace_back(false);
	}
	_buffers.shrink_to_fit();
	//_active.shrink_to_fit();

	//_active = _new bool[_buffers.size()]{ false };	
}

ConcatenatedBuffers::~ConcatenatedBuffers() 
{
	for (InputBuffer* input_buffer : _buffers) delete input_buffer;
	//delete[] _active;
}

/*
InputBuffer* ConcatenatedBuffers::get_next_buffer() {
	_active_buffers.acquire();
	if (!_active_buffers.is_empty()) {
		size_t index = _active_buffers.pop_unsafe();
		_active_buffers.release();
		return _buffers[index];
	} else {
		_active_buffers.release();
		return nullptr;
	}
}
*/

void ConcatenatedBuffers::add_work_item_to(UnitBase* dst, size_t dst_port, WorkItem const& item)
{
	_active[dst->index] = true;
	//_active_buffers.insert(dst->index);
	_buffers[dst->index]->add_work_item_from(dst_port, item);
}

bool ConcatenatedBuffers::is_buffer_active(size_t buffer_index)
{
	//return false;
	return _active[buffer_index];
}
InputBuffer* ConcatenatedBuffers::get_next_buffer()
{
	/*
	InputBuffer* return_value;
	_active_buffers.acquire();
	if (!_active_buffers.is_empty()) return_value = _buffers[_active_buffers.pop_unsafe()];
	else                             return_value = nullptr;
	_active_buffers.release();
	return return_value;
	*/
	return nullptr;
}

InputBuffer* ConcatenatedBuffers::get_buffer(size_t buffer_index)
{
	return _buffers[buffer_index];
}

void ConcatenatedBuffers::clear_unsafe() {
	//assert(false);
	for (uint i = 0; i < _buffers.size(); ++i) _active[i] = false;
	//_active_buffers.clear_unsafe();
}

void ConcatenatedBuffers::mark_active(size_t buffer_index) {
	_active[buffer_index] = true;
	//_active_buffers.insert(buffer_index);
}

void ConcatenatedBuffers::mark_inactive(size_t buffer_index) {
	_active[buffer_index] = false;
	//_active_buffers. (buffer_index);
}


}}
