#include "input-buffer.hpp"


namespace Arches { namespace Units {


InputBuffer::InputBuffer(UnitBase* unit) :
	unit(unit),
	_items_backing(nullptr)
{}

InputBuffer::InputBuffer(InputBuffer const& other) :
	unit(other.unit),
	_items_backing(nullptr),
	_incoming_connections(other._incoming_connections)
{
	assert(other._items_backing!=nullptr);
	finalize();
}

InputBuffer::~InputBuffer() 
{
	delete[] _items_backing;
}

size_t InputBuffer::add_connection(size_t max_size) 
{
	assert(max_size > 0);
	size_t index = _incoming_connections.size();
	_incoming_connections.push_back({ ~size_t(0), 0, 0, max_size });
	return index;
}

void InputBuffer::finalize() 
{
	_incoming_connections.shrink_to_fit();

	size_t total_size = 0;
	for (auto const& iter : _incoming_connections) {
		total_size += iter.max_size;
	}

	assert(_items_backing==nullptr);
	_items_backing = _new WorkItem[total_size];
	max_size = total_size;

	size_t index = 0;
	for (auto& iter : _incoming_connections) {
		iter.start_index_in_backing = index;
		index += iter.max_size;
	}
}

}}
