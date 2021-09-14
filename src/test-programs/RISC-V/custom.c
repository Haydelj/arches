#include "stdint.h"

//uint32_t frame_buffer[256];
uint32_t frame_buffer[4*1024] __attribute__((section (".trax")));

int main()
{
	int a = 4;
	int b = 2;
	int c = 0;

	asm volatile
	(
		"traxamoin %[z]\n\t"
    	: [z] "=r" (c)
	);

	frame_buffer[c] = 0xFF563412u;

	return 0;
}
