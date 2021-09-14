#pragma once

#include "../stdafx.hpp"


namespace Arches { namespace Util {

//you need two
class barrier final {
	private:
		std::atomic_size_t _count;


	public:
		barrier() : _count(0) {}
		~barrier() = default;

		void operator()(size_t num_threads);
};

}}
