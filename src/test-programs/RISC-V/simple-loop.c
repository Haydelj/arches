#include <stdint.h>

uint32_t frame_buffer[4];

int main()
{
	//Must be `volatile` to disable loop unrolling (GCC erroneously and silently ignores `-fno-unroll-loops`).
	uint32_t volatile i;
	for (i = 0u; i < 4u; ++i) frame_buffer[i] = 0xFF563412u;

	return 0;
}
