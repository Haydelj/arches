#include "../stdafx.hpp"

inline uint log2i(uint in)
{
	uint i = 0;
	while (in >>= 1) ++i;
	return i;
}

inline uint64_t generate_nbit_mask(uint n)
{
	return ~(~0ull << n);
}
