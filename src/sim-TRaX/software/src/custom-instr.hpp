#pragma once
#include "stdafx.hpp"

#include "ray-tracing-include.hpp"

#ifdef ARCH_X86
static std::atomic_uint atomicinc_i;
#endif

#ifdef ARCH_RISCV
//must use tempalte so ID is known at compile time
template <int ID> void* lpfba()
{
	#ifdef ARCH_RISCV
	void* value = nullptr;
	asm volatile("lpfba %[rd], %[imm]\n\t" : [rd] "=r"(value) : [imm] "I" (ID));
	return value;
	#endif

	return nullptr;
}
#endif

uint32_t atomicinc()
{
	#ifdef ARCH_RISCV
	uint32_t value = 0;
	asm volatile("traxamoin %[rd]\n\t" : [rd] "=r" (value));
	return value;
	#endif

	#ifdef ARCH_X86
	return atomicinc_i++;
	#endif

	return 0;
}

void write_to_framebuffer_address(uint32_t* framebuffer_address, uint index, rtm::vec3& in)
{
	in = rtm::clamp(in, 0.0f, 1.0f);

	uint32_t out = 0x0;
	out |= static_cast<uint32_t>(in.r * 255.99f) << 0;
	out |= static_cast<uint32_t>(in.g * 255.99f) << 8;
	out |= static_cast<uint32_t>(in.b * 255.99f) << 16;
	out |= 0xff                                  << 24;

	framebuffer_address[index] = out;
}

#ifdef ARCH_X86
void dump_framebuffer_address(uint32_t* framebuffer_address, const char* path, uint width, uint height)
{
	uint8_t const* src = reinterpret_cast<uint8_t*>(framebuffer_address);
	FILE* file = fopen(path, "wb");
	fprintf(file,"P6\n%u %u\n255\n", width, height);
	for (size_t j = 0; j < height; ++j)
	{
		for (size_t i = 0; i < width; ++i)
		{
			size_t index = j * width + i;
			fwrite(src + 4 * index, sizeof(uint8_t), 3, file);
		}
	}
	fclose(file);

}
#endif
