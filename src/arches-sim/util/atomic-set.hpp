#pragma once

#include "../stdafx.hpp"


namespace Arches { namespace Util {


template <typename T>
class atomic_set final {
	public:
		std::set<T> _backing;

		std::mutex _mutex;

	public:
		atomic_set() = default;
		~atomic_set() = default;

		void acquire() { _mutex.lock  (); }
		void release() { _mutex.unlock(); }

		size_t get_size() const { return _backing.size(); }
		bool is_empty() const { return _backing.size()==0; }

		void clear_unsafe() {
			_backing.clear();
		}

		void insert(T const& item) {
			acquire();
			_backing.insert(item);
			release();
		}
		T pop_unsafe() {
			assert(!is_empty());
			auto iter = _backing.begin();
			T result = *iter;
			_backing.erase(iter);
			return result;
		}
		T pop() {
			acquire();
			pop_unsafe();
			release();
			return result;
		}
};


}}
