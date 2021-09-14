#include <stdint.h>

#define WIDTH 256u
#define HEIGHT 256u

//uint32_t frame_buffer[WIDTH * HEIGHT];
//we'll create a new section to prevent intitilization
uint32_t frame_buffer[WIDTH * HEIGHT];// __attribute__((section (".trax")));
//uint32_t values[WIDTH * HEIGHT];


uint32_t trax_amoin()
{
  int value = 0;
  asm volatile("traxamoin %[z]\n\t" : [z] "=r" (value));
  return value;
}

int main()
{
    uint32_t i;
    uint32_t buffer[8];
    while((i = trax_amoin()) < WIDTH * HEIGHT / 8)
    {
        for(uint32_t j = 0; j < 8; ++j)
        {
            uint32_t k = i * 8 + j;
            float r = ((float)(k / WIDTH)) / HEIGHT;
            float g = ((float)(k % WIDTH)) / WIDTH;
            float b = 0.5f;
            float a = 1.0f;

            uint32_t color = 0;
            color |= (uint8_t)(a * 255.99f); color <<= 8;
            color |= (uint8_t)(b * 255.99f); color <<= 8;
            color |= (uint8_t)(g * 255.99f); color <<= 8;
            color |= (uint8_t)(r * 255.99f);
            buffer[j] = color;

        }

        for(uint32_t j = 0; j < 8; ++j)
        {
            uint32_t k = i * 8 + j;
            frame_buffer[k] = buffer[j];
        }
    }

    return 0;
}
