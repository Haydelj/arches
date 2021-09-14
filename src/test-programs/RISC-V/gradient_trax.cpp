#include <cstdint>

#define WIDTH 256u
#define HEIGHT 256u

uint32_t trax_amoin()
{
	int value = 0;
	asm volatile("traxamoin %[z]\n\t" : [z] "=r" (value));
	return value;
}

//must use tempalte so ID is known at compile time
template <int ID> void* lpfba()
{
	void* value = nullptr;
	asm volatile("lpfba %[rd], %[imm]\n\t" : [rd] "=r"(value) : [imm] "I" (ID));
	return value;
}

int main()
{
	uint32_t* frame_buffer = reinterpret_cast<uint32_t*>(lpfba<0>());
	uint32_t i = trax_amoin();
	while(i <  WIDTH * HEIGHT)
	{
		float r = ((float)(i / WIDTH)) / HEIGHT;
		float g = ((float)(i % WIDTH)) / WIDTH;
		float b = 0.5f;
		float a = 1.0f;

		uint32_t color = 0;
		color |= (uint8_t)(a * 255.99f); color <<= 8;
		color |= (uint8_t)(b * 255.99f); color <<= 8;
		color |= (uint8_t)(g * 255.99f); color <<= 8;
		color |= (uint8_t)(r * 255.99f);

		frame_buffer[i] = color;
		i = trax_amoin();
	}

	return 0;
}
