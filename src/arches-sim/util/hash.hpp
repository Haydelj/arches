#pragma once

#include "../stdafx.hpp"


namespace Arches { namespace Util {


template <typename type> inline size_t get_hashed(type const& item) {
	std::hash<type> hasher;
	return hasher(item);
}
template <typename type> inline size_t get_hashed(type const& item, size_t combine_with) {
	//http://stackoverflow.com/questions/2590677/how-do-i-combine-hash-values-in-c0x
	return combine_with^( get_hashed(item) + 0x9E3779B9 + (combine_with<<6) + (combine_with>>2) );
}


}}
