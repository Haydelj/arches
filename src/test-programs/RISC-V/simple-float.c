#include <stdint.h>

uint32_t mem[4];

int main(int argc,char* argv[])
{
	//Must be `volatile` to disable loop unrolling (GCC erroneously and silently ignores
	//	`-fno-unroll-loops`).
	uint32_t volatile i;

	for (i = 0u; i < 4u; ++i)
	{
		float a = 1.0f;
		mem[i] = 0xFF563412u * (int)a;
	}

	return 0;
}
