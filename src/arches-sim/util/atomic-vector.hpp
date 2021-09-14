#pragma once

#include "../stdafx.hpp"


namespace Arches { namespace Util {


template <typename T>
class atomic_vector final {
	private:
		size_t _capacity;
		size_t _size;

		T* _data;

		std::mutex _mutex;

	public:
		atomic_vector() : _capacity(8),_size(0), _data(_new T[8]) {}
		~atomic_vector() { delete[] _data; }

		void acquire() { _mutex.lock  (); }
		void release() { _mutex.unlock(); }

		size_t get_capacity() const { return _capacity; }
		size_t get_size    () const { return _size;     }
		bool is_empty() const { return _size==0; }

		void realloc_unsafe(size_t min_size) {
			if (min_size>_capacity) {
				T* tmp = _new T[min_size];
				memcpy(tmp,_data,sizeof(T)*_size);
				delete[] _data;
				_data = tmp;
				_capacity = min_size;
			}
		}

		void push_back(T const& item) {
			acquire();
			if (_size<_capacity); else realloc_unsafe(_capacity*2);
			assert(_size<_capacity);
			_data[_size++] = item;
			release();
		}

		T pop_back() {
			acquire();
			assert(_size>0);
			T result = _data[--_size];
			release();
			return result;
		}
};


}}
