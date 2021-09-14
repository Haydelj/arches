#pragma once

#include "../../stdafx.hpp"


namespace Arches { namespace Units { namespace RISCV {

class Register32 final {
public:
	union {
		uint8_t  u8;  int8_t  s8;
		uint16_t u16; int16_t s16;
		uint32_t u32; int32_t s32;
		float f32;
	};
};

class Register64 final {
public:
	union {
		uint8_t  u8;  int8_t  s8;
		uint16_t u16; int16_t s16;
		uint32_t u32; int32_t s32;
		uint64_t u64; int64_t s64;
		float f32; double f64;
	};
};

class FloatingPointControlStatusRegister final {
public:
	union {
		uint32_t data;
		struct {
			uint32_t NX		: 1;
			uint32_t UF		: 1;
			uint32_t OF		: 1;
			uint32_t DZ		: 1;
			uint32_t NV		: 1;
			uint32_t frm	: 3;
			uint32_t		: 24;
		};
	};
};


class IntegerRegisterFile final 
{
	public:
		//See table of conventional uses for these registers here:
		//	http://www.cs.uwm.edu/classes/cs315/Bacon/Lecture/HTML/ch05s03.html
		union 
		{
			Register64 registers[32];
			struct
			{
				Register64 zero;
				Register64 ra;
				Register64 sp;
				Register64 gp;
				Register64 tp;
				Register64 t0;
				Register64 t1;
				Register64 t2;
				Register64 s0;
				Register64 s1;
				Register64 a0;
				Register64 a1;
				Register64 a2;
				Register64 a3;
				Register64 a4;
				Register64 a5;
				Register64 a6;
				Register64 a7;
				Register64 s2;
				Register64 s3;
				Register64 s4;
				Register64 s5;
				Register64 s6;
				Register64 s7;
				Register64 s8;
				Register64 s9;
				Register64 s10;
				Register64 s11;
				Register64 t3;
				Register64 t4;
				Register64 t5;
				Register64 t6;
			};
			struct
			{
				Register64 _[8];
				Register64 fp;
			};
			struct 
			{
				Register64  x0;
				Register64  x1; 
				Register64  x2; 
				Register64  x3; 
				Register64  x4; 
				Register64  x5; 
				Register64  x6; 
				Register64  x7; 
				Register64  x8;   
				Register64  x9; 
				Register64 x10; 
				Register64 x11; 
				Register64 x12; 
				Register64 x13; 
				Register64 x14; 
				Register64 x15; 
				Register64 x16; 
				Register64 x17; 
				Register64 x18; 
				Register64 x19; 
				Register64 x20; 
				Register64 x21; 
				Register64 x22; 
				Register64 x23; 
				Register64 x24; 
				Register64 x25; 
				Register64 x26; ;
				Register64 x27; ;
				Register64 x28; 
				Register64 x29; 
				Register64 x30; 
				Register64 x31; 
			};
		};
		bool valid[32];

		//Register64 pc;
		//bool pc_changed;

	public:
		IntegerRegisterFile();
		~IntegerRegisterFile() = default;
		void print()
		{
			for (uint i = 0; i < 32u; ++i)
				printf("Register%d: %lld\n", i, registers[i].u64);
		}
};

class FloatingPointRegisterFile final {
public:
	union {
		Register64 registers[32];
		struct
		{
			Register64 ft0;
			Register64 ft1;
			Register64 ft2;
			Register64 ft3;
			Register64 ft4;
			Register64 ft5;
			Register64 ft6;
			Register64 ft7;
			Register64 fs0;
			Register64 fs1;
			Register64 fa0;
			Register64 fa1;
			Register64 fa2;
			Register64 fa3;
			Register64 fa4;
			Register64 fa5;
			Register64 fa6;
			Register64 fa7;
			Register64 fs2;
			Register64 fs3;
			Register64 fs4;
			Register64 fs5;
			Register64 fs6;
			Register64 fs7;
			Register64 fs8;
			Register64 fs9;
			Register64 fs10;
			Register64 fs11;
			Register64 ft8;
			Register64 ft9;
			Register64 ft10;
			Register64 ft11;
		};
		struct 
		{
			Register64  f0;
			Register64  f1;
			Register64  f2;
			Register64  f3;
			Register64  f4;
			Register64  f5;
			Register64  f6;
			Register64  f7;
			Register64  f8;
			Register64  f9;
			Register64 f10;
			Register64 f11;
			Register64 f12;
			Register64 f13;
			Register64 f14;
			Register64 f15;
			Register64 f16;
			Register64 f17;
			Register64 f18;
			Register64 f19;
			Register64 f20;
			Register64 f21;
			Register64 f22;
			Register64 f23;
			Register64 f24;
			Register64 f25;
			Register64 f26;
			Register64 f27;
			Register64 f28;
			Register64 f29;
			Register64 f30;
			Register64 f31;
		};
	};
	bool valid[32];

	FloatingPointControlStatusRegister fcsr;

public:
	FloatingPointRegisterFile();
	~FloatingPointRegisterFile() = default;
};

}}}
