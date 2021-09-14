#include <stdint.h>

uint8_t frame_buffer[256*256*4];

uint32_t __attribute__ ((noinline)) foo(uint32_t in)
{
	asm ("");
	return in << 1;
}

int main()
{
	uint8_t x = 64;
	x = x + foo(x);
	frame_buffer[0] = x;
	return 0;
}
