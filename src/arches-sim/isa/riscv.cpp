#include "riscv.hpp"

#include "../units/riscv/unit-execution-base.hpp"

#include "../util/math.hpp"

#include "errors.hpp"

#include <intrin.h>

namespace Arches { namespace ISA { namespace RISCV {

inline static  int32_t sign_extend_16to32(uint16_t imm) {
	int16_t tmp; memcpy(&tmp,&imm,2);
	return static_cast<int32_t>(tmp);
}
inline static  int32_t sign_extend_16to32( int16_t imm) { return static_cast<int32_t>(imm); }

inline static  int64_t sign_extend_16to64(uint16_t imm) {
	int16_t tmp; memcpy(&tmp,&imm,2);
	return static_cast<int64_t>(tmp);
}
inline static  int64_t sign_extend_16to64( int16_t imm) { return static_cast< int64_t>(imm); }

inline static  int64_t sign_extend_32to64(uint32_t imm) {
	int32_t tmp; memcpy(&tmp,&imm,4);
	return static_cast<int64_t>(tmp);
}
inline static  int64_t sign_extend_32to64( int32_t imm) { return static_cast<int64_t>(imm); }

inline static uint32_t zero_extend_16to32(uint16_t imm) { return static_cast<uint32_t>(imm); }

inline static uint64_t zero_extend_32to64(uint32_t imm) { return static_cast<uint64_t>(imm); }

bool not_word_value(uint64_t val) 
{
	if (val & 0x80000000u) {
		return (val >> 32) != 0xFFFFFFFFu;
	}
	else {
		return (val >> 32) != 0x00000000u;
	}
}

int64_t get_immediate_I(Instruction instr)
{
	return	 sign_extend_32to64(((instr.i.imm < 0b1000'0000'0000) ? 0b0 : 0b1111'1111'1111'1111'1111'0000'0000'0000) | instr.i.imm);
}

inline static int64_t get_immediate_S(Instruction instr)
{
	return	 sign_extend_32to64(((instr.s.imm_11_5 < 0b100'0000) ? 0b0 : 0b1111'1111'1111'1111'1111'0000'0000'0000) |
		(instr.s.imm_11_5 << 5) |
		(instr.s.imm_4_0));
}

inline static int64_t get_immediate_B(Instruction instr)
{
	return sign_extend_32to64(instr.b.imm_12 ? 0b1111'1111'1111'1111'1111'0000'0000'0000 : 0b0) |
		(instr.b.imm_11 << 11) | (instr.b.imm_10_5 << 5) | (instr.b.imm_4_1 << 1);
}

inline static int64_t get_immediate_U(Instruction instr)
{
	return  sign_extend_32to64(instr.u.imm << 12);
}

inline int64_t get_immediate_J(Instruction instr)
{
	return  sign_extend_32to64(instr.j.imm_20 ? 0b1111'1111'1111'0000'0000'0000'0000'0000 : 0b0) |
		(instr.j.imm_19_12 << 12) | (instr.j.imm_11 << 11) | (instr.j.imm_10_1 << 1);
}

inline static int64_t div(int64_t op1, int64_t op2)
{
	if (op2 == 0)
		return 0xffff'ffff'ffff'ffff;
	else if (op1 == INT64_MIN && op2 == -1)
		return INT64_MIN;
	return op1 / op2;
}

inline static uint64_t divu(uint64_t op1, uint64_t op2)
{
	if (op2 == 0)
		return 0xffff'ffff'ffff'ffff;
	return op1 / op2;
}

inline static int64_t divw(int64_t op1, int64_t op2)
{
	int32_t dividend = static_cast<int32_t>(op1);
	int32_t divisor = static_cast<int32_t>(op2);
	if (divisor == 0)
		return 0xffff'ffff'ffff'ffff;
	else if (dividend == INT32_MIN && divisor == -1)
		return sign_extend_32to64(INT32_MIN);
	return sign_extend_32to64(dividend / divisor);
}

inline static uint64_t divuw(uint64_t op1, uint64_t op2)
{
	uint32_t dividend = static_cast<uint32_t>(op1);
	uint32_t divisor = static_cast<uint32_t>(op2);
	if (divisor == 0)
		return zero_extend_32to64(0xffff'ffff);
	return zero_extend_32to64(dividend / divisor);
}

inline static int64_t rem(int64_t op1, int64_t op2)
{
	if (op2 == 0)
		return op1;
	else if (op1 == INT64_MIN && op2 == -1)
		return 0;
	return op1 % op2;
}

inline static uint64_t remu(uint64_t op1, uint64_t op2)
{
	if (op2 == 0)
		return op1;
	return op1 % op2;
}

inline static int64_t remw(int64_t op1, int64_t op2)
{
	int32_t dividend = static_cast<int32_t>(op1);
	int32_t divisor = static_cast<int32_t>(op2);
	if (divisor == 0)
		return sign_extend_32to64(dividend);
	else if (dividend == INT32_MIN && divisor == -1)
		return 0;
	return sign_extend_32to64(dividend % divisor);
}

inline static uint64_t remuw(uint64_t op1, uint64_t op2)
{
	uint32_t dividend = static_cast<uint32_t>(op1);
	uint32_t divisor = static_cast<uint32_t>(op2);
	if (divisor == 0)
		return zero_extend_32to64(dividend);
	return zero_extend_32to64(dividend % divisor);
}

template <typename T> inline static void _issue_int_load (Units::RISCV::UnitExecutionBase* unit, Instruction const& instr) 
{
	WorkItem item;
	item.type = WorkItem::TYPE::LOAD;

	item.load.size = sizeof(T);
	item.load.vaddr = unit->int_regs->registers[instr.i.rs1].u64 + get_immediate_I(instr);

	//The sign of this value encodes whether the load should be sign-extended or not when it completes.  It also encodes the width of the load so that only one `switch`-statement is necessary to decide what to do.
	item.load.dst_unit_data.s8[0] = std::is_signed_v<T> ? -static_cast<int16_t>(sizeof(T)) : static_cast<int16_t>(sizeof(T));
	item.load.dst_unit_data.u8[1] = instr.i.rd; //Destination register.
	item.load.dst_unit_data.u8[2] = static_cast<uint8_t>(RegFile::INT); //Destination register file
	item.load.dst_stack_index = 0;
	item.load.dst_stack[item.load.dst_stack_index] = unit->id;

	unit->send_output_to(unit->mem_higher,item,1);
}

template <typename T> inline static void _issue_int_store(Units::RISCV::UnitExecutionBase* unit, Instruction const& instr)
{
	WorkItem item;
	item.type = WorkItem::TYPE::STORE;

	item.store.size = sizeof(T);
	item.store.vaddr = unit->int_regs->registers[instr.s.rs1].u64 + get_immediate_S(instr);
	item.store.data.u64[0] = unit->int_regs->registers[instr.s.rs2].u64;

	item.store.prev_id = unit->id;

	unit->send_output_to(unit->mem_higher, item, 1);
}

template <typename T> inline static void _prepare_load(Units::RISCV::UnitExecutionBase* unit, Instruction const& instr)
{
	unit->memory_access_data.size = sizeof(T);
	unit->memory_access_data.vaddr = unit->int_regs->registers[instr.i.rs1].u64 + get_immediate_I(instr);

	if(typeid(T) == typeid(float) || typeid(T) == typeid(double))
	{
		unit->memory_access_data.signed_width_code = sizeof(T);
		unit->memory_access_data.dst_reg_file = static_cast<uint8_t>(RegFile::FLOAT);
	}
	else
	{
		unit->memory_access_data.signed_width_code = std::is_signed_v<T> ? -static_cast<int16_t>(sizeof(T)) : static_cast<int16_t>(sizeof(T));
		unit->memory_access_data.dst_reg_file = static_cast<uint8_t>(RegFile::INT);
	}

	unit->memory_access_data.dst_reg = instr.i.rd;
}


template <typename T> inline static void _prepare_store(Units::RISCV::UnitExecutionBase* unit, Instruction const& instr)
{
	unit->memory_access_data.size = sizeof(T);
	unit->memory_access_data.vaddr = unit->int_regs->registers[instr.s.rs1].u64 + get_immediate_S(instr);

	if(typeid(T) == typeid(float) || typeid(T) == typeid(double))
	{
		unit->memory_access_data.store_data = unit->float_regs->registers[instr.s.rs2].u64;
	}
	else
	{
		unit->memory_access_data.store_data = unit->int_regs->registers[instr.s.rs2].u64;
	}
}


#define CALLBACK_GETSTR(STR) [](Instruction const& /*instr*/) { return STR; }
#define CALLBACK_SUBISA(TO_INSTR_INF) [](Instruction const& instr) -> const char* { return TO_INSTR_INF.get_mnemonic(instr); }

#define META_DECL [](Instruction const& instr) -> InstructionInfo const&
#define META_NOTI [](Instruction const& instr) -> InstructionInfo const& { throw ErrNotImplInstr(instr); }

#define IMPL_DECL [](Instruction const& instr,InstructionInfo const& /*instr_info*/, Units::RISCV::UnitExecutionBase*   unit  ) -> void
#define IMPL_NONE [](Instruction const& instr,InstructionInfo const& /*instr_info*/, Units::RISCV::UnitExecutionBase* /*unit*/) -> void { throw ErrNoSuchInstr (instr); }
#define IMPL_NOTI [](Instruction const& instr,InstructionInfo const& /*instr_info*/, Units::RISCV::UnitExecutionBase* /*unit*/) -> void { throw ErrNotImplInstr(instr); }

const InstructionInfo Instruction::get_info()
{
	return isa[opcode].get_direct_instr_info(*this);
}

InstructionInfo isa[32] = 
{
		InstructionInfo(0b00000, META_DECL { return isa_LOAD[instr.i.funct3]; }),//LOAD
		InstructionInfo(0b00001, META_DECL { return isa_LOAD_FP[instr.i.funct3]; }),//LOAD-FP
		/*
		InstructionInfo(0b00010, "traxamoin", TYP::TRAX, ENC::U, RGF::INT, IMPL_DECL
		{
			static uint64_t value = 0;
			//std::cout << "amoin: " << value << "\n";
			unit->int_regs->registers[instr.u.rd].u64 = value++;
		}),//TRAXAMOIN,
		*/
		InstructionInfo(0b00010, IMPL_NONE),//custom-0
		InstructionInfo(0b00011, IMPL_NOTI),//MISC-MEM
		InstructionInfo(0b00100, META_DECL { return isa_OP_IMM[instr.i.funct3]; }),//OP-IMM
		InstructionInfo(0b00101, "auipc", Type::IADD, Encoding::U, RegFile::INT, IMPL_DECL 
		{
			unit->int_regs->registers[instr.u.rd].s64 = unit->pc + get_immediate_U(instr);
		}),//AUIPC
		InstructionInfo(0b00110, META_DECL { return isa_OP_IMM_32[instr.i.funct3]; }),//OP-IMM-32
		InstructionInfo(0b00111, IMPL_NOTI),//48b

		InstructionInfo(0b01000, META_DECL { return isa_STORE[instr.s.funct3]; }),//STORE
		InstructionInfo(0b01001, META_DECL { return isa_STORE_FP[instr.r.funct3]; }),//STORE-FP
		InstructionInfo(0b01010, IMPL_NONE),//custom-1
		InstructionInfo(0b01011, IMPL_NOTI),//AMO
		InstructionInfo(0b01100, META_DECL { return isa_OP[instr.r.funct7 & 0b01 | instr.r.funct7 >> 4 & 0b10]; }),//OP
		InstructionInfo(0b01101, "lui", Type::MOVE, Encoding::U, RegFile::INT, IMPL_DECL 
		{
			unit->int_regs->registers[instr.u.rd].s64 = get_immediate_U(instr);
		}),//LUI
		InstructionInfo(0b01110, META_DECL { return isa_OP_32[instr.r.funct7 & 0b01 | instr.r.funct7 >> 4 & 0b10]; }),//OP-32
		InstructionInfo(0b01111, IMPL_NOTI),//64b

		InstructionInfo(0b10000, "fmadd", Type::FFUSED_MUL_ADD, Encoding::R4,  RegFile::FLOAT, IMPL_DECL
		{
			unit->float_regs->registers[instr.r4.rd].f32 = (unit->float_regs->registers[instr.r4.rs1].f32 * unit->float_regs->registers[instr.r4.rs2].f32) + unit->float_regs->registers[instr.r4.rs3].f32;
		}),//FMADD
		InstructionInfo(0b10001, "fmsub", Type::FFUSED_MUL_ADD, Encoding::R4,  RegFile::FLOAT, IMPL_DECL
		{
			unit->float_regs->registers[instr.r4.rd].f32 = (unit->float_regs->registers[instr.r4.rs1].f32 * unit->float_regs->registers[instr.r4.rs2].f32) - unit->float_regs->registers[instr.r4.rs3].f32;
		}),//FMSUB
		InstructionInfo(0b10010, "fnmsub", Type::FFUSED_MUL_ADD, Encoding::R4,  RegFile::FLOAT, IMPL_DECL
		{
			unit->float_regs->registers[instr.r4.rd].f32 = -(unit->float_regs->registers[instr.r4.rs1].f32 * unit->float_regs->registers[instr.r4.rs2].f32) + unit->float_regs->registers[instr.r4.rs3].f32;
		}),//FNMSUB
		InstructionInfo(0b10011, "fnmadd", Type::FFUSED_MUL_ADD, Encoding::R4,  RegFile::FLOAT, IMPL_DECL
		{
			unit->float_regs->registers[instr.r4.rd].f32 = -(unit->float_regs->registers[instr.r4.rs1].f32 * unit->float_regs->registers[instr.r4.rs2].f32) - unit->float_regs->registers[instr.r4.rs3].f32;
		}),//FNMADD
		InstructionInfo(0b10100, META_DECL { return isa_OP_FP[instr.r.funct5]; }),//OP-FP
		InstructionInfo(0b10101, IMPL_NOTI),//reserved
		InstructionInfo(0b10110, IMPL_NONE),//custom-2/rv128
		InstructionInfo(0b10111, IMPL_NOTI),//48b

		InstructionInfo(0b11000, META_DECL{ return isa_BRANCH[instr.b.funct3]; }),//BRANCH
		InstructionInfo(0b11001, "jalr", Type::JUMP, Encoding::I,  RegFile::INT, IMPL_DECL
		{
			int64_t next_PC = unit->pc + 4;
			unit->pc = ISA::RISCV::get_immediate_I(instr) + unit->int_regs->registers[instr.i.rs1].s64;
			unit->int_regs->registers[instr.i.rd].u64 = next_PC;
			unit->branch_taken = true;
		}),//JALR
		InstructionInfo(0b11010, IMPL_NOTI),//reserved
		InstructionInfo(0b11011, "jal", Type::JUMP, Encoding::J,  RegFile::INT, IMPL_DECL
		{
			unit->int_regs->registers[instr.j.rd].u64 = unit->pc + 4;
			unit->pc += ISA::RISCV::get_immediate_J(instr);
			unit->branch_taken = true;
		}),//JAL
		InstructionInfo(0b11100, "ecall", Type::SYS, Encoding::I, RegFile::INT, IMPL_DECL 
		{
			//actually handle system calls in the proccesor model
		}),//ECALL
		InstructionInfo(0b11101, IMPL_NOTI),//reserved
		InstructionInfo(0b11110, IMPL_NONE),//custom-3/rv128
		InstructionInfo(0b11111, IMPL_NOTI),//>=80b
};



//RV64I
InstructionInfo const isa_LOAD[7] =
{
	InstructionInfo(0b000, "lb", Type::LOAD, Encoding::I, RegFile::INT, IMPL_DECL{
		_prepare_load<int8_t >(unit,instr);
	}),//LB
	InstructionInfo(0b001, "lh", Type::LOAD, Encoding::I, RegFile::INT, IMPL_DECL{
		_prepare_load<int16_t>(unit,instr);
	}),//LH
	InstructionInfo(0b010, "lw", Type::LOAD, Encoding::I, RegFile::INT, IMPL_DECL{
		_prepare_load<int32_t>(unit,instr);
	}),//LW
	InstructionInfo(0b011, "ld", Type::LOAD, Encoding::I, RegFile::INT, IMPL_DECL{
		_prepare_load<int64_t>(unit,instr);
	}),//LD
	InstructionInfo(0b100, "lbu", Type::LOAD, Encoding::I, RegFile::INT, IMPL_DECL{
		_prepare_load<uint8_t >(unit,instr);
	}),//LBU
	InstructionInfo(0b101, "lhu", Type::LOAD, Encoding::I, RegFile::INT, IMPL_DECL{
		_prepare_load<uint16_t>(unit,instr);
	}),//LHU
	InstructionInfo(0b110, "lwu", Type::LOAD, Encoding::I, RegFile::INT, IMPL_DECL{
		_prepare_load<uint32_t>(unit,instr);
	}),//LWU
};

InstructionInfo const isa_STORE[4] =
{
	InstructionInfo(0b000, "sb", Type::STORE, Encoding::S, RegFile::INT, IMPL_DECL{
		_prepare_store<int8_t >(unit,instr);
	}),//SB
	InstructionInfo(0b001, "sh", Type::STORE, Encoding::S, RegFile::INT, IMPL_DECL{
		_prepare_store<int16_t>(unit,instr);
	}),//SH
	InstructionInfo(0b010, "sw", Type::STORE, Encoding::S, RegFile::INT, IMPL_DECL{
		_prepare_store<int32_t>(unit,instr);
	}),//SW
	InstructionInfo(0b011, "sd", Type::STORE, Encoding::S, RegFile::INT, IMPL_DECL{
		_prepare_store<int64_t>(unit,instr);
	}),//SD
};

InstructionInfo const isa_BRANCH[8] =
{
	InstructionInfo(0b000, "beq", Type::BRANCH, Encoding::B, RegFile::INT, IMPL_DECL{
		if (unit->int_regs->registers[instr.b.rs1].u64 == unit->int_regs->registers[instr.b.rs2].u64)
		{
			unit->pc += ISA::RISCV::get_immediate_B(instr);
			unit->branch_taken = true;
		} 
		else unit->branch_taken = false;
	}),//BEQ
	InstructionInfo(0b001, "bne", Type::BRANCH, Encoding::B, RegFile::INT, IMPL_DECL{
		if (unit->int_regs->registers[instr.b.rs1].u64 != unit->int_regs->registers[instr.b.rs2].u64)
		{
			unit->pc += ISA::RISCV::get_immediate_B(instr);
			unit->branch_taken = true;
		}
		else unit->branch_taken = false;
	}),//BNE
	InstructionInfo(0b010, IMPL_NONE),
	InstructionInfo(0b011, IMPL_NONE),
	InstructionInfo(0b100, "blt", Type::BRANCH, Encoding::B, RegFile::INT, IMPL_DECL{
		if (unit->int_regs->registers[instr.b.rs1].s64 < unit->int_regs->registers[instr.b.rs2].s64)
		{
			unit->pc += ISA::RISCV::get_immediate_B(instr);
			unit->branch_taken = true;
		}
		else unit->branch_taken = false;
	}),//BLT
	InstructionInfo(0b101, "bge", Type::BRANCH, Encoding::B, RegFile::INT, IMPL_DECL{
		if (unit->int_regs->registers[instr.b.rs1].s64 >= unit->int_regs->registers[instr.b.rs2].s64)
		{
			unit->pc += ISA::RISCV::get_immediate_B(instr);
			unit->branch_taken = true;
		}
		else unit->branch_taken = false;
	}),//BGE
	InstructionInfo(0b110, "bltu", Type::BRANCH, Encoding::B, RegFile::INT, IMPL_DECL{
		if (unit->int_regs->registers[instr.b.rs1].u64 < unit->int_regs->registers[instr.b.rs2].u64)
		{
			unit->pc += ISA::RISCV::get_immediate_B(instr);
			unit->branch_taken = true;
		}
		else unit->branch_taken = false;
	}),//BLTU
	InstructionInfo(0b111, "bgeu", Type::BRANCH, Encoding::B, RegFile::INT, IMPL_DECL{
		if (unit->int_regs->registers[instr.b.rs1].u64 >= unit->int_regs->registers[instr.b.rs2].u64)
		{
			unit->pc += ISA::RISCV::get_immediate_B(instr);
			unit->branch_taken = true;
		}
		else unit->branch_taken = false;
	}),//BGEU
};

InstructionInfo const isa_OP[3] =
{
	InstructionInfo(0b000'0000,	META_DECL { return isa_OP_0x00[instr.r.funct3]; }),//OP-0x00
	InstructionInfo(0b000'0001,	META_DECL { return isa_OP_MULDIV[instr.r.funct3]; }),//OP-MULDIV
	InstructionInfo(0b010'0000,	META_DECL { return isa_OP_0x30[instr.r.funct3]; }),//OP-0x30
};

InstructionInfo const isa_OP_0x00[8]
{
	InstructionInfo(0b000, "add", Type::IADD, Encoding::R, RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.r.rd].s64 = unit->int_regs->registers[instr.r.rs1].s64 + unit->int_regs->registers[instr.r.rs2].s64;
	}),//ADD
	InstructionInfo(0b001, "sll", Type::ILOGICAL, Encoding::R, RegFile::INT, IMPL_DECL{
		//take lowest 5 bits of register[r2] and shift by that ammount
		unit->int_regs->registers[instr.r.rd].s64 = unit->int_regs->registers[instr.r.rs1].s64 << (unit->int_regs->registers[instr.r.rs2].u8 & 0b11'1111);
	}),//SLL
	InstructionInfo(0b010, "slt", Type::ILOGICAL, Encoding::R, RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.r.rd].s64 = unit->int_regs->registers[instr.r.rs1].s64 < unit->int_regs->registers[instr.r.rs2].s64;
	}),//SLT
	InstructionInfo(0b011, "sltu", Type::ILOGICAL, Encoding::R, RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.r.rd].s64 = unit->int_regs->registers[instr.r.rs1].u64 < unit->int_regs->registers[instr.r.rs2].u64;
	}),//SLTU
	InstructionInfo(0b100, "xor", Type::ILOGICAL, Encoding::R, RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.r.rd].s64 = unit->int_regs->registers[instr.r.rs1].s64 ^ unit->int_regs->registers[instr.r.rs2].s64;
	}),//XOR
	InstructionInfo(0b101, "srl", Type::ILOGICAL, Encoding::R, RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.r.rd].u64 = unit->int_regs->registers[instr.r.rs1].u64 >> (unit->int_regs->registers[instr.r.rs2].u8 & 0b11'1111);
	}),//SRL
	InstructionInfo(0b110, "or", Type::ILOGICAL, Encoding::R, RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.r.rd].s64 = unit->int_regs->registers[instr.r.rs1].s64 | unit->int_regs->registers[instr.r.rs2].s64;
	}),//OR
	InstructionInfo(0b111, "and", Type::ILOGICAL, Encoding::R, RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.r.rd].s64 = unit->int_regs->registers[instr.r.rs1].s64 & unit->int_regs->registers[instr.r.rs2].s64;
	}),//AND
};

InstructionInfo const isa_OP_0x30[8] =
{
	InstructionInfo(0b000, "sub", Type::ISUB, Encoding::R, RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.r.rd].s64 = unit->int_regs->registers[instr.r.rs1].s64 - unit->int_regs->registers[instr.r.rs2].s64;
	}),//SUB
	InstructionInfo(0b001, IMPL_NONE),
	InstructionInfo(0b010, IMPL_NONE),
	InstructionInfo(0b011, IMPL_NONE),
	InstructionInfo(0b100, IMPL_NONE),
	InstructionInfo(0b101, "sra", Type::ILOGICAL, Encoding::R, RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.r.rd].s64 = unit->int_regs->registers[instr.r.rs1].s64 >> (unit->int_regs->registers[instr.r.rs2].u8 & 0b11'1111);
	}),//SRL
	InstructionInfo(0b110, IMPL_NONE),
	InstructionInfo(0b111, IMPL_NONE),
};

InstructionInfo const isa_OP_IMM[8] =
{
	InstructionInfo(0b000, "addi", Type::IADD, Encoding::I, RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.i.rd].s64 = unit->int_regs->registers[instr.i.rs1].s64 + get_immediate_I(instr);
	}),//ADDI
	InstructionInfo(0b001, "slli", Type::ILOGICAL, Encoding::I, RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.r.rd].s64 = unit->int_regs->registers[instr.i.rs1].s64 << instr.i.shamt6;
	}),//SLLI
	InstructionInfo(0b010, "slti", Type::ILOGICAL, Encoding::I, RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.i.rd].s64 = unit->int_regs->registers[instr.i.rs1].s64 < get_immediate_I(instr);
	}),//SLTI
	InstructionInfo(0b011, "sltui", Type::ILOGICAL, Encoding::I, RegFile::INT, IMPL_DECL{
		//TODO: verify that this should still use the regular I - Imediate conversion
		unit->int_regs->registers[instr.i.rd].s64 = unit->int_regs->registers[instr.i.rs1].u64 < static_cast<uint64_t>(get_immediate_I(instr));
	}),//SLTUI
	InstructionInfo(0b100, "xori", Type::ILOGICAL, Encoding::I, RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.i.rd].s64 = unit->int_regs->registers[instr.i.rs1].s64 ^ get_immediate_I(instr);
	}),//XORI
	InstructionInfo(0b101,	META_DECL { return isa_OP_IMM_SR[instr.i.imm_11_6 >> 4]; }),//OP-IMM-SR
	InstructionInfo(0b110, "ori", Type::ILOGICAL, Encoding::I, RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.i.rd].s64 = unit->int_regs->registers[instr.i.rs1].s64 | get_immediate_I(instr);
	}),//ORI
	InstructionInfo(0b111, "andi", Type::ILOGICAL, Encoding::I, RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.i.rd].s64 = unit->int_regs->registers[instr.i.rs1].s64 & get_immediate_I(instr);
	})//ANDI
};

InstructionInfo const isa_OP_IMM_SR[2] =
{
	InstructionInfo(0b00'0000'101, "srli", Type::ILOGICAL, Encoding::R, RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.r.rd].u64 = unit->int_regs->registers[instr.i.rs1].u64 >> instr.i.shamt6;
	}),//SRLI
	InstructionInfo(0b01'0000'101, "srai", Type::ILOGICAL, Encoding::R, RegFile::INT, IMPL_DECL{
			unit->int_regs->registers[instr.r.rd].s64 = unit->int_regs->registers[instr.i.rs1].s64 >> instr.i.shamt6;
	})//SRAI
};

InstructionInfo const isa_OP_32[3] =
{
	InstructionInfo(0b000'0000,	META_DECL { return isa_OP_32_0x00[instr.r.funct3]; }),//OP-32-0x00
	InstructionInfo(0b000'0001,	META_DECL { return isa_OP_32_MULDIV[instr.r.funct3]; }),//OP-32-MULDIV
	InstructionInfo(0b010'0000,	META_DECL { return isa_OP_32_0x30[instr.r.funct3]; }),//OP-32-0x30
};

InstructionInfo const isa_OP_32_0x00[8] =
{
	InstructionInfo(0b000, "addw", Type::IADD, Encoding::R, RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.r.rd].s32 = unit->int_regs->registers[instr.r.rs1].s32 + unit->int_regs->registers[instr.r.rs2].s32;
	}),//ADDW
	InstructionInfo(0b001, "sllw", Type::ILOGICAL, Encoding::R, RegFile::INT, IMPL_DECL{
		//take lowest 5 bits of register[r2] and shift by that ammount
		unit->int_regs->registers[instr.r.rd].s32 = unit->int_regs->registers[instr.r.rs1].s32 << (unit->int_regs->registers[instr.r.rs2].u8 & 0b1'1111);
	}),//SLLW
	InstructionInfo(0b010, IMPL_NONE),
	InstructionInfo(0b011, IMPL_NONE),
	InstructionInfo(0b100, IMPL_NONE),
	InstructionInfo(0b101, "srlw", Type::ILOGICAL, Encoding::R, RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.r.rd].u32 = unit->int_regs->registers[instr.r.rs1].u32 >> (unit->int_regs->registers[instr.r.rs2].u8 & 0b1'1111);
	}),//SRLWint_regs
	InstructionInfo(0b110, IMPL_NONE),
	InstructionInfo(0b111, IMPL_NONE),
};

InstructionInfo const isa_OP_32_0x30[8] =
{
	InstructionInfo(0b000, "subw", Type::ISUB, Encoding::R, RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.r.rd].s32 = unit->int_regs->registers[instr.r.rs1].s32 - unit->int_regs->registers[instr.r.rs2].s32;
	}),//SUBW
	InstructionInfo(0b001, IMPL_NONE),
	InstructionInfo(0b010, IMPL_NONE),
	InstructionInfo(0b011, IMPL_NONE),
	InstructionInfo(0b100, IMPL_NONE),
	InstructionInfo(0b101, "sraw", Type::ILOGICAL, Encoding::R,  RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.r.rd].s32 = unit->int_regs->registers[instr.r.rs1].s32 >> (unit->int_regs->registers[instr.r.rs2].u8 & 0b1'1111);
	}),//SRLW
	InstructionInfo(0b110, IMPL_NONE),
	InstructionInfo(0b111, IMPL_NONE),
};

InstructionInfo const isa_OP_IMM_32[8] =
{
	InstructionInfo(0b000, "addiw", Type::IADD, Encoding::I, RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.i.rd].s64 = sign_extend_32to64(unit->int_regs->registers[instr.i.rs1].s32 + static_cast<int32_t>(get_immediate_I(instr)));
	}),//ADDIW
	InstructionInfo(0b00'0000'001, "slliw", Type::ILOGICAL, Encoding::I, RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.i.rd].s32 = unit->int_regs->registers[instr.i.rs1].s32 << instr.i.shamt;
	}),//SLLIW
	InstructionInfo(0b010, IMPL_NONE),
	InstructionInfo(0b011, IMPL_NONE),
	InstructionInfo(0b100, IMPL_NONE),
	InstructionInfo(0b101,	META_DECL { return isa_OP_IMM_32_SR[instr.i.imm_11_5 >> 5]; }),//OP-32-IMM-SR
	InstructionInfo(0b110, IMPL_NONE),
	InstructionInfo(0b111, IMPL_NONE),
};

InstructionInfo const isa_OP_IMM_32_SR[2] =
{
	InstructionInfo(0b00'0000'101, "srliw", Type::ILOGICAL, Encoding::R, RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.r.rd].u32 = unit->int_regs->registers[instr.i.rs1].u32 >> instr.i.shamt;
	}),//SRLIW
	InstructionInfo(0b01'0000'101, "sraiw", Type::ILOGICAL, Encoding::R, RegFile::INT, IMPL_DECL{
			unit->int_regs->registers[instr.r.rd].s32 = unit->int_regs->registers[instr.i.rs1].s32 >> instr.i.shamt;
	}),//SRAIW
};

//RV64M
InstructionInfo const isa_OP_MULDIV[8] =
{
	InstructionInfo(0b000, "mul", Type::IMUL, Encoding::R, RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.r.rd].s64 = unit->int_regs->registers[instr.r.rs1].s64 * unit->int_regs->registers[instr.r.rs2].s64;
	}),//MUL
	InstructionInfo(0b001, "mulh", Type::IMUL, Encoding::R, RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.r.rd].s64 = __mulh(unit->int_regs->registers[instr.r.rs1].s64, unit->int_regs->registers[instr.r.rs2].s64);
	}),//MULH
	InstructionInfo(0b010, IMPL_NOTI), //MULHSU
	InstructionInfo(0b011, "mulhu", Type::IMUL, Encoding::R, RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.r.rd].u64 = __umulh(unit->int_regs->registers[instr.r.rs1].u64, unit->int_regs->registers[instr.r.rs2].u64);
	}),//MULHU
	InstructionInfo(0b100, "div", Type::IDIV, Encoding::R, RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.r.rd].s64 = div(unit->int_regs->registers[instr.r.rs1].s64 ,unit->int_regs->registers[instr.r.rs2].s64);
	}),//DIV
	InstructionInfo(0b101, "divu", Type::IDIV, Encoding::R, RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.r.rd].u64 = divu(unit->int_regs->registers[instr.r.rs1].u64, unit->int_regs->registers[instr.r.rs2].u64);
	}),//DIVU
	InstructionInfo(0b110, "rem", Type::IDIV, Encoding::R, RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.r.rd].s64 = rem(unit->int_regs->registers[instr.r.rs1].s64, unit->int_regs->registers[instr.r.rs2].s64);
	}),//REM
	InstructionInfo(0b111, "remu", Type::IDIV, Encoding::R, RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.r.rd].u64 = remu(unit->int_regs->registers[instr.r.rs1].u64, unit->int_regs->registers[instr.r.rs2].u64);
	}),//REMU
};

InstructionInfo const isa_OP_32_MULDIV[8] =
{
	InstructionInfo(0b000, "mulw", Type::IMUL, Encoding::R, RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.r.rd].s64 = sign_extend_32to64(static_cast<int32_t>(unit->int_regs->registers[instr.r.rs1].s64) * static_cast<int32_t>(unit->int_regs->registers[instr.r.rs2].s64));
	}),//MULW
	InstructionInfo(0b001, IMPL_NONE),
	InstructionInfo(0b010, IMPL_NONE),
	InstructionInfo(0b011, IMPL_NONE),
	InstructionInfo(0b100, "divw", Type::IDIV, Encoding::R, RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.r.rd].s64 = divw(unit->int_regs->registers[instr.r.rs1].s64, unit->int_regs->registers[instr.r.rs2].s64);
	}),//DIVW
	InstructionInfo(0b101, "divuw", Type::IDIV, Encoding::R, RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.r.rd].u64 = divuw(unit->int_regs->registers[instr.r.rs1].u64, unit->int_regs->registers[instr.r.rs2].u64);
	}),//DIVUW
	InstructionInfo(0b110, "remw", Type::IDIV, Encoding::R, RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.r.rd].s64 = remw(unit->int_regs->registers[instr.r.rs1].s64, unit->int_regs->registers[instr.r.rs2].s64);
	}),//REMW
	InstructionInfo(0b111, "remuw", Type::IDIV, Encoding::R, RegFile::INT, IMPL_DECL{
		unit->int_regs->registers[instr.r.rd].u64 = remuw(unit->int_regs->registers[instr.r.rs1].u64, unit->int_regs->registers[instr.r.rs2].u64);
	}),//REMUW
};





//RV64F
template <typename T> inline static void _issue_float_load(Units::RISCV::UnitExecutionBase* unit, Instruction const& instr) 
{
	WorkItem item;
	item.type = WorkItem::TYPE::LOAD;

	item.load.size = item.load.size = sizeof(T);
	item.load.vaddr = unit->int_regs->registers[instr.i.rs1].u64 + get_immediate_I(instr);

	//The sign of this value encodes whether the load should be sign-extended or not when it completes.  It also encodes the width of the load so that only one `switch`-statement is necessary to decide what to do.
	item.load.dst_unit_data.s8[0] = std::is_signed_v<T> ? -static_cast<int16_t>(sizeof(T)) : static_cast<int16_t>(sizeof(T));
	item.load.dst_unit_data.u8[1] = instr.i.rd; //Destination register.
	item.load.dst_unit_data.u8[2] = static_cast<uint8_t>(RegFile::FLOAT); //Destination register file
	
	item.load.dst_stack_index = 0;
	item.load.dst_stack[item.load.dst_stack_index] = unit->id;

	unit->send_output_to(unit->mem_higher, item, 1);
}

template <typename T> inline static void _issue_float_store(Units::RISCV::UnitExecutionBase* unit, Instruction const& instr) 
{
	WorkItem item;
	item.type = WorkItem::TYPE::STORE;

	item.store.size = sizeof(T);
	item.store.vaddr = unit->int_regs->registers[instr.s.rs1].u64 + get_immediate_S(instr);
	item.store.data.u64[0] = unit->float_regs->registers[instr.s.rs2].u64;

	item.store.prev_id = unit->id;

	unit->send_output_to(unit->mem_higher, item, 1);
}

InstructionInfo const isa_LOAD_FP[4] = //i.funct3
{
	InstructionInfo(0b000, "flb", Type::LOAD, Encoding::I, RegFile::FLOAT, RegFile::INT, IMPL_DECL{
		assert(false);
		//_issue_float_load<uint8_t >(unit,instr);
	}),//LB
	InstructionInfo(0b001, "flh", Type::LOAD, Encoding::I, RegFile::FLOAT, RegFile::INT, IMPL_DECL{
		assert(false);
		//_issue_float_load<uint16_t >(unit,instr);
	}),//LH
	InstructionInfo(0b010, "flw", Type::LOAD, Encoding::I, RegFile::FLOAT, RegFile::INT, IMPL_DECL{
		_prepare_load<float> (unit,instr);
	}),//LW
	InstructionInfo(0b011, "fld", Type::LOAD, Encoding::I, RegFile::FLOAT, RegFile::INT, IMPL_DECL{
		assert(false);
		//_issue_float_load<uint64_t >(unit,instr);
	})//LD
};

InstructionInfo const isa_STORE_FP[4] = //r.funct3
{
	InstructionInfo(0b000, "fsb", Type::STORE, Encoding::S, RegFile::FLOAT, RegFile::INT, IMPL_DECL{
		assert(false);
		//_issue_float_store<uint8_t >(unit,instr);
	}),//SB
	InstructionInfo(0b001, "fsh", Type::STORE, Encoding::S, RegFile::FLOAT, RegFile::INT, IMPL_DECL{
		assert(false);
		//_issue_float_store<uint16_t >(unit,instr);
	}),//SH
	InstructionInfo(0b010, "fsw", Type::STORE, Encoding::S, RegFile::FLOAT, RegFile::INT, IMPL_DECL{
		 _prepare_store<float>(unit,instr);
	}),//SW
	InstructionInfo(0b011, "fsd", Type::STORE, Encoding::S, RegFile::FLOAT, RegFile::INT, IMPL_DECL{
		assert(false);
		//_issue_float_store<uint64_t >(unit,instr);
	}),//SD
};



InstructionInfo const isa_OP_FP[32] = //r.funct5
{
	InstructionInfo(0b000'0000, "fadd", Type::FADD, Encoding::R, RegFile::FLOAT, IMPL_DECL {
		unit->float_regs->registers[instr.r.rd].f32 = unit->float_regs->registers[instr.r.rs1].f32 + unit->float_regs->registers[instr.r.rs2].f32;
	}),//FADD
	InstructionInfo(0b000'0100, "fsub", Type::FSUB, Encoding::R, RegFile::FLOAT, IMPL_DECL {
		unit->float_regs->registers[instr.r.rd].f32 = unit->float_regs->registers[instr.r.rs1].f32 - unit->float_regs->registers[instr.r.rs2].f32;
	}),//FSUB
	InstructionInfo(0b000'1000, "fmul", Type::FMUL, Encoding::R, RegFile::FLOAT, IMPL_DECL {
		unit->float_regs->registers[instr.r.rd].f32 = unit->float_regs->registers[instr.r.rs1].f32 * unit->float_regs->registers[instr.r.rs2].f32;
	}),//FMUL
	InstructionInfo(0b000'1100, "fdiv", Type::FDIV, Encoding::R, RegFile::FLOAT, IMPL_DECL {
		unit->float_regs->registers[instr.r.rd].f32 = unit->float_regs->registers[instr.r.rs1].f32 / unit->float_regs->registers[instr.r.rs2].f32;
	}),//FDIV
	InstructionInfo(0b001'0000, META_DECL {return isa_OP_FSGNJ_FP[instr.r.funct3]; }),//FSGNJ
	InstructionInfo(0b001'0100, META_DECL {return isa_OP_0x14_FP[instr.r.funct3]; }),//0x14
	InstructionInfo(0b001'1000, IMPL_NOTI),
	InstructionInfo(0b001'1100, IMPL_NOTI),

	InstructionInfo(0b010'0000, IMPL_NOTI),
	InstructionInfo(0b010'0100, IMPL_NOTI),
	InstructionInfo(0b010'1000, IMPL_NOTI),
	InstructionInfo(0b010'1100, "fsqrt", Type::FSQRT, Encoding::R, RegFile::FLOAT, IMPL_DECL {
		unit->float_regs->registers[instr.r.rd].f32 = _mm_cvtss_f32(_mm_sqrt_ss(_mm_set_ps1(unit->float_regs->registers[instr.r.rs1].f32)));
	}),//FMUL

	InstructionInfo(0b011'0000, IMPL_NOTI),
	InstructionInfo(0b011'0100, IMPL_NOTI),
	InstructionInfo(0b011'1000, IMPL_NOTI),
	InstructionInfo(0b011'1100, IMPL_NOTI),

	InstructionInfo(0b100'0000, IMPL_NOTI),
	InstructionInfo(0b100'0100, IMPL_NOTI),
	InstructionInfo(0b100'1000, IMPL_NOTI),
	InstructionInfo(0b100'1100, IMPL_NOTI),

	InstructionInfo(0b101'0000, META_DECL {return isa_OP_FCMP_FP[instr.r.funct3]; }),//0x50
	InstructionInfo(0b101'0100, IMPL_NOTI),
	InstructionInfo(0b101'1000, IMPL_NOTI),
	InstructionInfo(0b101'1100, IMPL_NOTI),

	InstructionInfo(0b110'0000, META_DECL {return isa_OP_0x60_FP[instr.r.rs2]; }),//0x60
	InstructionInfo(0b110'0100, IMPL_NOTI),
	InstructionInfo(0b110'1000, META_DECL {return isa_OP_0x68_FP[instr.r.rs2]; }),//0x68
	InstructionInfo(0b110'1100, IMPL_NOTI),

	InstructionInfo(0b111'0000, "fmv.s.w", Type::MOVE, Encoding::R, RegFile::FLOAT, IMPL_DECL {
		unit->int_regs->registers[instr.r.rd].s64 = unit->float_regs->registers[instr.r.rs1].s32;
	}),//FMV.S.W
	InstructionInfo(0b111'0100, IMPL_NOTI),
	InstructionInfo(0b111'1000, "fmv.w.s", Type::MOVE, Encoding::R, RegFile::FLOAT, IMPL_DECL {
		unit->float_regs->registers[instr.r.rd].u32 = unit->int_regs->registers[instr.r.rs1].u32;
	}),//FMV.W.S
	InstructionInfo(0b111'1100, IMPL_NOTI),
};

InstructionInfo const isa_OP_FSGNJ_FP[3] = //r.funct3
{
	InstructionInfo(0b0'0000, "fsgnj.s", Type::FSIGN, Encoding::R, RegFile::FLOAT, IMPL_DECL {
		unit->float_regs->registers[instr.r.rd].f32 = copysignf(unit->float_regs->registers[instr.r.rs1].f32, unit->float_regs->registers[instr.r.rs2].f32);
	}),//FSGNJ.S
	InstructionInfo(0b0'0001, "fsgnjn.s", Type::FSIGN, Encoding::R, RegFile::FLOAT, IMPL_DECL {
		unit->float_regs->registers[instr.r.rd].f32 = copysignf(unit->float_regs->registers[instr.r.rs1].f32, -unit->float_regs->registers[instr.r.rs2].f32);
	}),//FSGNJN.S
	InstructionInfo(0b0'0010, "fsgnjx.s", Type::FSIGN, Encoding::R, RegFile::FLOAT, IMPL_DECL {
		float rs1 = unit->float_regs->registers[instr.r.rs1].f32; 
		float rs2 = unit->float_regs->registers[instr.r.rs2].f32;
		unit->float_regs->registers[instr.r.rd].f32 = copysignf(rs1, (signbit(rs1) ^ signbit(rs2)) ? -1.0f : 1.0f);
	}),//FSGNJX.S
};

InstructionInfo const isa_OP_0x14_FP[2] = //r.funct3
{
	InstructionInfo(0b0'0000, "fmin", Type::FMIN_MAX, Encoding::R, RegFile::FLOAT, IMPL_DECL {
		unit->float_regs->registers[instr.r.rd].f32 = std::min(unit->float_regs->registers[instr.r.rs1].f32, unit->float_regs->registers[instr.r.rs2].f32);
	}),//FMIN
	InstructionInfo(0b0'0001, "fmax", Type::FMIN_MAX, Encoding::R, RegFile::FLOAT, IMPL_DECL {
		unit->float_regs->registers[instr.r.rd].f32 = std::max(unit->float_regs->registers[instr.r.rs1].f32, unit->float_regs->registers[instr.r.rs2].f32);
	}),//FMAX
};

InstructionInfo const isa_OP_FCMP_FP[3] = //r.funct3
{
	InstructionInfo(0b0'0000, "fle", Type::FCMP, Encoding::R, RegFile::INT, RegFile::FLOAT, IMPL_DECL {
		unit->int_regs->registers[instr.r.rd].u64 = (unit->float_regs->registers[instr.r.rs1].f32 <= unit->float_regs->registers[instr.r.rs2].f32);
	}),//FLE
	InstructionInfo(0b0'0001, "flt", Type::FCMP, Encoding::R, RegFile::INT, RegFile::FLOAT, IMPL_DECL {
		unit->int_regs->registers[instr.r.rd].u64 = (unit->float_regs->registers[instr.r.rs1].f32 <  unit->float_regs->registers[instr.r.rs2].f32);
	}),//FLT
	InstructionInfo(0b0'0010, "feq", Type::FCMP, Encoding::R, RegFile::INT, RegFile::FLOAT, IMPL_DECL {
		unit->int_regs->registers[instr.r.rd].u64 = (unit->float_regs->registers[instr.r.rs1].f32 == unit->float_regs->registers[instr.r.rs2].f32);
	}),//FEQ
};

InstructionInfo const isa_OP_0x60_FP[4] = //r.rs2
{
	InstructionInfo(0b0'0000, "fcvt.w.s", Type::CONVERT, Encoding::R, RegFile::INT, RegFile::FLOAT, IMPL_DECL {
		unit->int_regs->registers[instr.r.rd].s32 = static_cast<int32_t>(unit->float_regs->registers[instr.r.rs1].f32);
	}),//FCVT.S.W
	InstructionInfo(0b0'0001, "fcvt.wu.s", Type::CONVERT, Encoding::R, RegFile::INT, RegFile::FLOAT, IMPL_DECL {
		unit->int_regs->registers[instr.r.rd].u32 = static_cast<uint32_t>(unit->float_regs->registers[instr.r.rs1].f32);
	}),//FCVT.S.WU
	InstructionInfo(0b0'0010, "fcvt.l.s", Type::CONVERT, Encoding::R, RegFile::INT, RegFile::FLOAT, IMPL_DECL {
		unit->int_regs->registers[instr.r.rd].s64 = static_cast<int64_t>(unit->float_regs->registers[instr.r.rs1].f32);
	}),//FCVT.S.L
	InstructionInfo(0b0'0011, "fcvt.lu.s", Type::CONVERT, Encoding::R, RegFile::INT, RegFile::FLOAT, IMPL_DECL {
		unit->int_regs->registers[instr.r.rd].u64 = static_cast<uint64_t>(unit->float_regs->registers[instr.r.rs1].f32);
	}),//FCVT.S.LU
};

InstructionInfo const isa_OP_0x68_FP[4] = //r.rs2
{
	InstructionInfo(0b0'0000, "fcvt.s.w", Type::CONVERT, Encoding::R, RegFile::FLOAT, RegFile::INT, IMPL_DECL {
		unit->float_regs->registers[instr.r.rd].f32 = static_cast<float>(unit->int_regs->registers[instr.r.rs1].s32);
	}),//FCVT.W.S
	InstructionInfo(0b0'0001, "fcvt.s.wu", Type::CONVERT, Encoding::R, RegFile::FLOAT, RegFile::INT, IMPL_DECL {
		unit->float_regs->registers[instr.r.rd].f32 = static_cast<float>(unit->int_regs->registers[instr.r.rs1].u32);
	}),//FCVT.WU.S
	InstructionInfo(0b0'0010, "fcvt.s.l", Type::CONVERT, Encoding::R, RegFile::FLOAT, RegFile::INT, IMPL_DECL {
		unit->float_regs->registers[instr.r.rd].f32 = static_cast<float>(unit->int_regs->registers[instr.r.rs1].s64);
	}),//FCVT.L.S
	InstructionInfo(0b0'0011, "fcvt.s.lu", Type::CONVERT, Encoding::R, RegFile::FLOAT, RegFile::INT, IMPL_DECL {
		unit->float_regs->registers[instr.r.rd].f32 = static_cast<float>(unit->int_regs->registers[instr.r.rs1].u64);
	}),//FCVT.LU.S
};


}}}
