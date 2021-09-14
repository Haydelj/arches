#include "barrier.hpp"


namespace Arches { namespace Util {


void barrier::operator()(size_t num_threads) 
{
	++_count;
	while(_count < num_threads);
	++_count;
	if(_count == (num_threads * 2)) _count = 0;
}

}}
