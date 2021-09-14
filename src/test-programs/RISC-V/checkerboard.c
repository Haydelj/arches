#include <stdint.h>

uint32_t frame_buffer[256 * 256];

int main()
{
	uint32_t w = 256u;
	uint32_t h = 256u;
	for (uint32_t j = 0u; j < h; ++j)
	{
		for (uint32_t i = 0u; i < w; ++i)
		{
			uint32_t color = 0x00000000u;
			if((i % 2 == 0) ^ (j % 2 == 0)) color = 0xFFFFFFFFu;
			frame_buffer[j * w + i] = color;
		}
	}

	return 0;
}
