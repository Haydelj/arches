#pragma once

#include "../stdafx.hpp"

#include "../util/atomic-set.hpp"

#include "../work-item.hpp"


namespace Arches { namespace Units {


class InputBuffer;
class UnitBase;


class ConcatenatedBuffers final {
	private:
		//Util::atomic_set<size_t> _active_buffers;
		std::vector<InputBuffer*> _buffers;
		bool _active[1024 * 32]{false};
		//std::vector<bool> _active;

	public:
		explicit ConcatenatedBuffers(std::vector<UnitBase*> const& units);
		ConcatenatedBuffers(ConcatenatedBuffers const& other);
		~ConcatenatedBuffers();

		size_t get_num_buffers() const { return _buffers.size(); }
		//size_t get_num_active_buffers() const { return _active_buffers.get_size(); }

		//InputBuffer* get_next_buffer();
		bool is_buffer_active(size_t buffer_index);
		InputBuffer* get_buffer(size_t buffer_index);
		InputBuffer* get_next_buffer();

		void add_work_item_to(UnitBase* dst,size_t dst_port, WorkItem const& item);

		void clear_unsafe();
		void mark_inactive(size_t buffer_index);
		void mark_active(size_t buffer_index);
};


}}
