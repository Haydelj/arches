#pragma once

#if defined __x86_64__ || defined _M_X64
#define ARCH_X86
#else
#define ARCH_RISCV
#endif

#ifdef ARCH_RISCV
//#define INLINE __attribute__((always_inline))
#define INLINE inline
#endif

#ifdef ARCH_X86
#define INLINE inline
#include <atomic>
#include <cassert>
#include <cstring>
#include <fstream>
#include <iostream>
#include <sstream>
#include <string>
#include <thread>
#include <vector>
#endif

#include <algorithm>
#include <cfloat>
#include <cmath>
#include <cstdint>

typedef unsigned int uint;

float fast_sqrtf(float input)
{
	#ifdef ARCH_X86
	return sqrtf(input);
	#endif

	#ifdef ARCH_RISCV
	float output = 0.0f;
	asm volatile ("fsqrt.s %[rd], %[rs1]\n\t" : [rd] "=f" (output) : [rs1] "f" (input));
	return output;
	#endif

	return 0;
}

float fast_inv_sqrtf(float input)
{
	#ifdef ARCH_X86
	return 1.0f / fast_sqrtf(input);
	#endif

	#ifdef ARCH_RISCV
	float output = 0.0f;

	#if 0
	asm volatile ("finvsqrt.s %[rd], %[rs1]\n\t" : [rd] "=f" (output) : [rs1] "f" (input));
	#else
	output = 1.0f / fast_sqrtf(input);
	#endif

	return output;
	#endif

	return 0;
}
