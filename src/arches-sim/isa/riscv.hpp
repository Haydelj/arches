#pragma once

#include "../stdafx.hpp"


namespace Arches {

namespace Units { namespace RISCV {
		class UnitExecutionBase;
}}

namespace ISA { namespace RISCV {
enum : uint32_t
{
	CUSTOM_OPCODE0 = 0b00010,
	CUSTOM_OPCODE1 = 0b01010,
	CUSTOM_OPCODE2 = 0b10110,
	CUSTOM_OPCODE3 = 0b11110,
};

constexpr size_t NUM_OPCODES = 32;

const std::string instr_opcode_names[NUM_OPCODES] =
{
	"LOAD",
	"LOAD-FP",
	"custom-0",
	"MISC-MEM",
	"OP-IMM",
	"AUIPC",
	"OP-IMM-32",
	"48b",
	"STORE",
	"STORE-FP",
	"custom-1",
	"AMO",
	"OP",
	"LUI",
	"OP-32",
	"64b",
	"FMADD",
	"FMSUB",
	"FNMSUB",
	"FNMADD",
	"OP-FP",
	"reserved",
	"custom-2/rv128",
	"48b",
	"BRANCH",
	"JALR",
	"reserved",
	"JAL",
	"ECALL",
	"reserved",
	"custom-3/rv128"
	">=80b"
};

const std::string instr_type_names[NUM_OPCODES] =
{
	"NA",

	"SYS",

	"STORE",
	"LOAD",

	"JUMP",
	"BRANCH",

	"MOVE",
	"CONVERT",

	"ILOGICAL",
	"IADD",
	"ISUB",
	"IMUL",
	"IDIV",

	"FCMP",
	"FSIGN",
	"FMIN_MAX",
	"FADD",
	"FSUB",
	"FMUL",
	"FFUSED_MUL_ADD",
	"FDIV",
	"FSQRT",

	"CUSTOM",
};

//TODO make these class enums
enum class Type : uint8_t
{
	NA,

	SYS,

	STORE,
	LOAD,

	JUMP,
	BRANCH,

	MOVE,
	CONVERT,

	ILOGICAL,
	IADD,
	ISUB,
	IMUL,
	IDIV,

	FCMP,
	FSIGN,
	FMIN_MAX,
	FADD,
	FSUB,
	FMUL,
	FFUSED_MUL_ADD,
	FDIV,
	FSQRT,

	CUSTOM,

	NUM_TYPES,
};

enum class Encoding : uint8_t
{
	NA,
	R,
	R4,
	I,
	S,
	B,
	U,
	J
};

enum class RegFile : uint8_t
{
	INT,
	FLOAT,
};

class InstructionInfo;

class Instruction final {
	public:
		union {
			#ifdef BUILD_ARCH_ENDIAN_LITTLE
				struct {
					uint32_t compressed_opcode : 2;
					uint32_t opcode : 5;
					uint32_t rd     : 5;
					uint32_t        : 3;
					uint32_t rs1    : 5;
					uint32_t rs2    : 5;
					uint32_t        : 2;
					uint32_t rs3    : 5;
				};

				union {
					struct 
					{
						uint32_t        : 7;
						uint32_t rd     : 5;
						uint32_t funct3 : 3;
						uint32_t rs1    : 5;
						uint32_t rs2    : 5;
						uint32_t funct7 : 7;
					};
					struct
					{
						uint32_t        : 7;
						uint32_t        : 5;
						uint32_t rm     : 3;
						uint32_t        : 5;
						uint32_t        : 5;
						uint32_t fmt    : 2;
						uint32_t funct5 : 5;
					};
				}r;

				struct {
					uint32_t         	: 7;
					uint32_t rd			: 5;
					uint32_t funct3		: 3;
					uint32_t rs1		: 5;
					uint32_t rs2		: 5;
					uint32_t funct2		: 2;
					uint32_t rs3		: 5;
				}r4;

				union {
					struct {
						uint32_t            : 7;
						uint32_t rd			: 5;
						uint32_t funct3		: 3;
						uint32_t rs1		: 5;
						uint32_t imm		: 12;
					};
					struct {	
						uint32_t			: 20;
						uint32_t shamt		: 5;
						uint32_t imm_11_5	: 7;
					};
					struct {
						uint32_t			: 20;
						uint32_t shamt6		: 6;
						uint32_t imm_11_6	: 6;
					};
				}i;

				struct {
					uint32_t            : 7;
					uint32_t imm_4_0	: 5;
					uint32_t funct3		: 3;
					uint32_t rs1		: 5;
					uint32_t rs2		: 5;
					uint32_t imm_11_5	: 7;
	
				}s;

				struct {
					uint32_t            : 7;
					uint32_t imm_11     : 1;
					uint32_t imm_4_1	: 4;
					uint32_t funct3		: 3;
					uint32_t rs1		: 5;
					uint32_t rs2		: 5;
					uint32_t imm_10_5	: 6;
					uint32_t imm_12     : 1;
				}b;

				struct {
					uint32_t            : 7;
					uint32_t rd			: 5;
					uint32_t imm		: 20;
				}u;

				struct {
					uint32_t            : 7;
					uint32_t rd			: 5;
					uint32_t imm_19_12	: 8;
					uint32_t imm_11		: 1;
					uint32_t imm_10_1	: 10;
					uint32_t imm_20		: 1;
				}j;
			#else
				#error "Not Implemented"
			#endif

			uint32_t data;

		};

		//use this to get the info for a given instruction
		const InstructionInfo get_info();
};
static_assert(sizeof(Instruction)==sizeof(uint32_t),"Implementation error!");

struct InstructionData {
	uint32_t op_code;
	Type type;
	Encoding encoding;
	RegFile dst_reg_file; //for stores this is the register file for the payload
	RegFile src_reg_file;
	char const* mnemonic;
};

class InstructionInfo final {

	public:
		typedef InstructionInfo const&(*FunctionGetSubOp)( Instruction const& );
		typedef void(*FunctionProcessor)(Instruction const&, InstructionInfo const&, Units::RISCV::UnitExecutionBase*);

	private:
		FunctionProcessor _impl_fn;
		bool _is_meta;
		union {
			InstructionData _data;
			struct {
				uint32_t _func_code;
				FunctionGetSubOp _resolve_fn;
			} _meta;
		};

	public:
		InstructionInfo(uint32_t opcode, FunctionProcessor impl_fn) :
			_impl_fn(impl_fn), _is_meta(false), _data({opcode,Type::NA,Encoding::NA,RegFile::INT,RegFile::INT,nullptr})
		{}

		InstructionInfo(uint32_t opcode, char const* mnemonic, FunctionProcessor impl_fn) :
			_impl_fn(impl_fn), _is_meta(false), _data({opcode,Type::NA,Encoding::NA,RegFile::INT,RegFile::INT,mnemonic})
		{}

		InstructionInfo(uint32_t opcode, char const* mnemonic, Type type, Encoding encoding, RegFile reg_file, FunctionProcessor impl_fn) :
			_impl_fn(impl_fn), _is_meta(false), _data({opcode,type,encoding,reg_file,reg_file,mnemonic})
		{}

		InstructionInfo(uint32_t opcode, char const* mnemonic, Type type, Encoding encoding, RegFile dst_reg_file, RegFile src_reg_file, FunctionProcessor impl_fn) :
			_impl_fn(impl_fn), _is_meta(false), _data({opcode,type,encoding,dst_reg_file,src_reg_file,mnemonic})
		{}

		InstructionInfo(uint32_t func_code, FunctionGetSubOp resolve_fn) :
			_is_meta(true)
		{
			_impl_fn = []( Instruction const& instr,InstructionInfo const& instr_info, Units::RISCV::UnitExecutionBase* unit ) -> void {
				InstructionInfo const& sub_instr = instr_info._meta._resolve_fn(instr);
				sub_instr.execute(unit,instr);
			};

			_meta._func_code = func_code;
			_meta._resolve_fn = resolve_fn;
		}
		~InstructionInfo() = default;

		const InstructionData get_data() const
		{
			//can only be accesed on not meta instr info
			assert(!_is_meta);
			return _data;
		}

		const InstructionInfo get_direct_instr_info(Instruction const& instr) const
		{
			if (!_is_meta) return *this;
			else           return _meta._resolve_fn(instr).get_direct_instr_info(instr);
		}

		void execute(Units::RISCV::UnitExecutionBase* unit, Instruction const& instr) const { _impl_fn( instr,*this, unit ); }
};

int64_t get_immediate_I(Instruction instr);

//RVC
//extern InstructionInfo const compressed_isa[4]; //TODO this



//RV64I
extern InstructionInfo isa[32];

extern InstructionInfo const isa_LOAD[7];
extern InstructionInfo const isa_STORE[4];

extern InstructionInfo const isa_BRANCH[8];

extern InstructionInfo const isa_OP[3];
extern InstructionInfo const isa_OP_0x00[8];
extern InstructionInfo const isa_OP_0x30[8];

extern InstructionInfo const isa_OP_IMM[8];
extern InstructionInfo const isa_OP_IMM_SR[2];

extern InstructionInfo const isa_OP_32[3];
extern InstructionInfo const isa_OP_32_0x00[8];
extern InstructionInfo const isa_OP_32_0x30[8];

extern InstructionInfo const isa_OP_IMM_32[8];
extern InstructionInfo const isa_OP_IMM_32_SR[2];



//RV64M
extern InstructionInfo const isa_OP_MULDIV[8];
extern InstructionInfo const isa_OP_32_MULDIV[8];



//RV64A
//extern InstructionInfo const isa_AMO[8]; //TODO this



//RV64F
extern InstructionInfo const isa_LOAD_FP[4];
extern InstructionInfo const isa_STORE_FP[4];
extern InstructionInfo const isa_OP_FP[32];

extern InstructionInfo const isa_OP_FSGNJ_FP[3];
extern InstructionInfo const isa_OP_0x14_FP[2];
extern InstructionInfo const isa_OP_FCMP_FP[3];
extern InstructionInfo const isa_OP_0x60_FP[4];
extern InstructionInfo const isa_OP_0x68_FP[4];



//RV64L



//RV64Q

#define META_DECL [](Instruction const& instr) -> InstructionInfo const&
#define IMPL_DECL [](Instruction const& instr, InstructionInfo const& /*instr_info*/, UnitExecutionBase* unit) -> void

}}}
