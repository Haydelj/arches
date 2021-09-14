#pragma once

#include "../stdafx.hpp"


namespace Arches { namespace Util {


//Count leading zero bits
inline int clz(uint32_t value) {
	//TODO: from Hacker's Delight?
	if (value>0u) {
		#if   defined BUILD_COMPILER_CLANG || defined BUILD_COMPILER_GNU
			return __builtin_clz(value);
		#elif defined BUILD_COMPILER_MSVC || defined BUILD_COMPILER_INTEL
			#ifdef BUILD_COMPILER_INTEL
				unsigned __int32 leading_zero = 0;
			#else
				unsigned long leading_zero = 0;
			#endif
			_BitScanReverse(&leading_zero,value);
			return 31 - leading_zero;
		#else
			#error "Not implemented!"
		#endif
	} else return 32;
}
inline int clz( uint8_t value) { return clz(static_cast<uint32_t>(value))-24; }
inline int clz(uint16_t value) { return clz(static_cast<uint32_t>(value))-16; }
inline int clz(uint64_t value) {
	#if   defined BUILD_COMPILER_CLANG || defined BUILD_COMPILER_GNU
		if (value>0LLU) {
			return __builtin_clzll(value);
		} else return 64;
	#elif defined BUILD_COMPILER_MSVC || defined BUILD_COMPILER_INTEL
		#ifdef BUILD_ARCH_32
			int result = clz(static_cast<uint32_t>(value>>32));
			if (result<32) return result;
			return 32 + clz(static_cast<uint32_t>(value));
		#else
			if (value>0ull) {
				#ifdef BUILD_COMPILER_INTEL
					unsigned __int32 leading_zero = 0;
				#else
					unsigned long leading_zero = 0;
				#endif
				_BitScanReverse64(&leading_zero,value);
				return 63 - leading_zero;
			} else return 64;
		#endif
	#else
		//TODO: faster!
		int i = 63;
		for (;i>=0;--i) {
			if (value&(1LLU<<i)) break;
		}
		int common_prefix = 63 - i;
		assert(common_prefix>=0&&common_prefix<=64);
		return common_prefix;
	#endif
}
//Count tailing zero bits
inline int ctz(uint32_t value) {
	if (value>0u) {
		#if   defined BUILD_COMPILER_CLANG || defined BUILD_COMPILER_GNU
			return __builtin_ctz(value);
		#elif defined BUILD_COMPILER_MSVC || defined BUILD_COMPILER_INTEL
			#ifdef BUILD_COMPILER_INTEL
				unsigned __int32 leading_zero = 0;
			#else
				unsigned long leading_zero = 0;
			#endif
			_BitScanForward(&leading_zero,value);
			return 31 - leading_zero;
		#else
			#error "Not implemented!"
		#endif
	} else return 32;
}
inline int ctz( uint8_t value) { return value>0?ctz(static_cast<uint32_t>(value)): 8; }
inline int ctz(uint16_t value) { return value>0?ctz(static_cast<uint32_t>(value)):16; }
inline int ctz(uint64_t value) {
	//TODO: from Hacker's Delight?
	#if   defined BUILD_COMPILER_CLANG || defined BUILD_COMPILER_GNU
		if (value>0LLU) {
			return __builtin_ctzll(value);
		} else return 64;
	#elif defined BUILD_COMPILER_MSVC || defined BUILD_COMPILER_INTEL
		#ifdef BUILD_ARCH_32
			int result = ctz(static_cast<uint32_t>(value>>32));
			if (result<32) return result;
			return 32 + ctz(static_cast<uint32_t>(value));
		#else
			if (value>0LLU) {
				#ifdef BUILD_COMPILER_INTEL
					unsigned __int32 leading_zero = 0;
				#else
					unsigned long leading_zero = 0;
				#endif
				_BitScanForward64(&leading_zero,value);
				return 63 - leading_zero;
			} else return 64;
		#endif
	#else
		#error "Not implemented!"
	#endif
}

//Base two logarithm, rounding down.
template <typename type_uint, typename=typename std::enable_if<std::is_unsigned<type_uint>::value>::type> constexpr type_uint log2_floor_constexpr(type_uint x) {
	//Note: assume `x` > 0, because there's no infinity for integral types.
	return x>1 ? 1+log2_floor_constexpr(x/2) : 0;
}


}}
