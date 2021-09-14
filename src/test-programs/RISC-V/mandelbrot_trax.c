#include <stdint.h>
#include <math.h>

#ifdef __x86_64__
#define ARCH_X86
#else
#define ARCH_RISCV
#endif

#ifdef ARCH_X86
#include <stdio.h>
#endif

#define WIDTH 256u
#define HEIGHT 256u

#define MAX_ITER 64u
#define ESCAPE_RADIUS 3.1f

#define Ar 0.5f
#define Ag 0.5f
#define Ab 0.5f

#define Br 0.5f
#define Bg 0.5f
#define Bb 0.5f

#define Cr 1.0f
#define Cg 1.0f
#define Cb 1.0f

#define Dr 0.45f
#define Dg 0.55f
#define Db 0.65f

//uint32_t frame_buffer[WIDTH * HEIGHT];
//we'll create a new section to prevent intitilization
uint32_t frame_buffer[WIDTH * HEIGHT] __attribute__((section (".trax")));

float fsqrt(float input)
{
	#ifdef ARCH_X86
	return sqrtf(input);
	#else
	//float output = 0;
	//asm volatile ("fsqrt.s %[rd], %[rs1]\n\t" : [rd] "=r" (output) : [rs1] "r" (input));
	//return output;
	return sqrtf(input);
	#endif
}

uint32_t trax_amoin()
{
	#ifdef ARCH_X86
	static uint32_t value = 0;
	return value++;
	#else
	uint32_t value = 0;
	asm volatile("traxamoin %[rd]\n\t" : [rd] "=r" (value));
	return value;
	#endif
}

uint32_t sample_color_procedural(float t)
{
    //float r = (Ar + Br * cosf(2.0f * 3.1415f * (Cr * t + Dr)));
	//float g = (Ag + Bg * cosf(2.0f * 3.1415f * (Cg * t + Dg)));
	//float b = (Ab + Bb * cosf(2.0f * 3.1415f * (Cb * t + Db)));
	//t = t < 1.0f ? 0.0f : 1.0f;
	float r = t;
	float g = t;
	float b = t;

	uint32_t color = 0u; float a = 1.0f;
	color |= (uint8_t)(a * 255.99f); color <<= 8u;
	color |= (uint8_t)(b * 255.99f); color <<= 8u;
	color |= (uint8_t)(g * 255.99f); color <<= 8u;
	color |= (uint8_t)(r * 255.99f);

	return color;
	//return t < ((float)2.0f/MAX_ITER) ? 0u : ~0u;
}

float fractal(float pcx, float pcy, uint32_t max_iter)
{
	float px = 0.0f;
	float py = 0.0f;

    for(uint32_t it = 0; it < max_iter; ++it)
    {
		float dot = px * px + py * py;
     	if(dot > ESCAPE_RADIUS * ESCAPE_RADIUS) return (float)it; //return (float)it - log2f(log2f(sqrtf(dot)));

     	float x = px * px - py * py + pcx;
     	py = 2.0f * py * px + pcy;
     	px = x;
    }

    return (float)max_iter;
}

void dump_frame_buffer(const char* path, uint32_t width, uint32_t height, uint32_t* fb)
{
	#ifdef ARCH_X86 //this will dump the frame buffer to a ppm in x86 mode
	uint8_t const* src = (uint8_t*)(fb);
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
	#endif
}

int main()
{
	uint32_t i;
	while((i = trax_amoin()) <  WIDTH * HEIGHT)
	{
		float y = (((float)(i / WIDTH)) / HEIGHT * 2.0f - 1.0f) * 2.0f;
		float x = (((float)(i % WIDTH)) / WIDTH *  2.0f - 1.0f) * 2.0f - 0.5;

		float t = fractal(x, y, MAX_ITER) / (float)MAX_ITER;
		frame_buffer[i] = sample_color_procedural(t);
	}

	dump_frame_buffer("./out.ppm", WIDTH, HEIGHT, frame_buffer);

	return 0;
}
