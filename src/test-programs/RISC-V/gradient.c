#include <stdint.h>

#define WIDTH 64u
#define HEIGHT 64u

uint32_t frame_buffer[WIDTH * HEIGHT];

int main()
{
	float a = 1.0f;
	float b = 0.5f;
	for(uint32_t j = 0; j < HEIGHT; ++j)
	{
		float r = ((float)j) / HEIGHT;
		for(uint32_t i = 0; i < WIDTH; ++i)
		{
			float g = ((float)i) / WIDTH;

			uint32_t color = 0;
			color |= (uint8_t)(a * 255.99f); color <<= 8;
			color |= (uint8_t)(b * 255.99f); color <<= 8;
			color |= (uint8_t)(g * 255.99f); color <<= 8;
			color |= (uint8_t)(r * 255.99f);

			frame_buffer[j * WIDTH + i] = color;
		}
	}

	return 0;
}
