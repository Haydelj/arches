#include "unit-core-simple.hpp"

#include "../../isa/riscv.hpp"

#include "../../util/endian.hpp"

#include "../../simulator-core.hpp"

#include "../unit-ram-base.hpp"
#include "../unit-mmu.hpp"

#include "registers.hpp"


namespace Arches { namespace Units { namespace RISCV {

#ifdef BUILD_DEBUG
//#define PRINT_INSTR
#else
#undef PRINT_INSTR
#endif

//(r,g,b,a) = (0x12,0x34,0x56,0xFF)
uint32_t program_math[] = {
	0b0'0000000100'000000000'00000'1101111,		//JAL x0 
	0b000000000101'00000'000'00101'0010011,		//addi x5 x0 5
	0b0000000'00000'00101'000'00110'0110011,	//add x6 x5 x0 
};

uint32_t program_fib[] = {
	0b000000000000'00000'000'00101'0010011,		//addi t0, x0, 0x0
	0b000000000001'00000'000'00110'0010011,		//addi t1, x0, 0x1
	0b000000000000'00000'000'11100'0010011,		//addi t3, x0, 0x0
	0b010000000000'00000'000'11101'0010011,		//addi t4, x0, 0x400
	//0b000000001000'11101'001'11101'0010011,	//slli t4, t4, 0x1
	0b0000000'00101'11100'010'00000'0100011,	//sw t0, 0x0(t3)
	0b000000000100'11100'000'11100'0010011,		//addi t3, t3, 0x4
	0b0000000'00110'00101'000'00111'0110011,	//add t2, t0, t1
	0b0000000'00110'00000'000'00101'0110011,	//add t0, x0, t1
	0b0000000'00111'00000'000'00110'0110011,	//add t1, x0, t2
	0b1'111111'11101'11100'100'0110'1'1100011,	//blt t3, t4, 0xc
	0b000000000000'00001'000'00000'1100111,		//jr ra
};

#define PROGRAM program_fib

UnitCoreSimple::UnitCoreSimple(Simulator* simulator, IntegerRegisterFile* int_regs, FloatingPointRegisterFile* float_regs) : UnitExecutionBase(simulator, 0) {
	UnitBase::add_output_to(this, 1); //Add output to ourself

	this->float_regs = float_regs;
	this->int_regs = int_regs;
	this->int_regs->ra.u64 = ~uint64_t(0);

	//_program = parse_new_program_from_builtin_checkerboard();
	//_program->print();
}

UnitCoreSimple::~UnitCoreSimple() /*override*/ {
	//delete _program;
}

void UnitCoreSimple::prepare() /*override*/ {
	UnitBase::prepare();

	WorkItem item;
	item.type = WorkItem::TYPE::INSTR_NEXT;
	simulator->add_work_item_to(this, 0, item, 1);
}

void UnitCoreSimple::_process_instruction(WorkItem* work_item) {
	ISA::RISCV::Instruction instr;

	if (pc != 0ull && state != STATE::FINISHED) {
		#if 0 //Instruction from pre-written assembly, above
			assert(regs->PC.u64<sizeof(PROGRAM));
			instr.data = PROGRAM[regs->PC.u64/4];
		#else //Instruction from loaded binary.
			//TODO: load it like any other data!  Currently, hackishly just loading it from memory
			//	ourselves right here.
			virtual_address  instr_vaddr = pc;
			physical_address instr_paddr = static_cast<UnitMMU<4*1024*1024>*>(mem_higher)->translate_allocate_as_necessary(instr_vaddr);
			instr.data = (*reinterpret_cast<uint32_t const*>(_cheat_dram->_data_u8 + instr_paddr));
		#endif

	#ifdef PRINT_INSTR
		printf("Executing %07I64x: %08x", int_regs->PC.u64, instr.data);
	#endif

		ISA::RISCV::InstructionInfo const& instr_info = instr.get_info();
		ISA::RISCV::InstructionData const& instr_data = instr_info.get_data();

	#ifdef PRINT_INSTR
		printf(" \trd: %d", instr.rd);
		printf(" \t(%s)", instr_info.get_data().mnemonic);
	#endif

		instr_info.execute(this, instr);
	

	switch(instr_data.type)
	{
		case ISA::RISCV::Type::LOAD: state = STATE::STALLED; break;
		case ISA::RISCV::Type::STORE: state = STATE::STALLED; _stalled_for_store = true; break;
		case ISA::RISCV::Type::SYS: state = STATE::FINISHED; break;
		default: break;
	}

	#ifdef PRINT_INSTR
		printf("\tExecuted");
		printf("\n");
	#endif
	} else {
		//Instruction pointer invalid.  Returned to final return address `~(0ull)`, so we're now done.
		printf("Program complete!\n");
		state = STATE::FINISHED;
	}

	if (state!=STATE::STALLED && state!=STATE::FINISHED) {
		//So we'll do work on the next cycle
		send_output_to(this,*work_item,1);
	} else {
		//Don't send anything so that on the next cycle, we'll instead wait to be un-stalled.
	}
}

void UnitCoreSimple::process(InputBuffer* buffer, cycles current_cycle) /*override*/
{
	while (WorkItem* work_item = _arbitrator.get_next(buffer)) 
	{
		switch (work_item->type) 
		{
		
		//A load came back from the memory subsystem.  Un-stalls us.
		case WorkItem::TYPE::LOAD_RETURN: 
		{
			int8_t  signed_width_code = work_item->load_return.dst_unit_data.s8[0];
			uint8_t dst_reg_ind = work_item->load_return.dst_unit_data.u8[1];
			uint8_t dst_reg_file = work_item->load_return.dst_unit_data.u8[2];

			Register64* registers = dst_reg_file == 0 ? int_regs->registers : float_regs->registers;

			switch (signed_width_code) 
			{
			case -1: registers[dst_reg_ind].s64 = static_cast<int64_t>(work_item->load_return.data.s8[0]); break;
			case  1: registers[dst_reg_ind].u64 = static_cast<uint64_t>(work_item->load_return.data.u8[0]); break;
			case -2: registers[dst_reg_ind].s64 = static_cast<int64_t>(work_item->load_return.data.s16[0]); break;
			case  2: registers[dst_reg_ind].u64 = static_cast<uint64_t>(work_item->load_return.data.u16[0]); break;
			case -4: registers[dst_reg_ind].s64 = static_cast<int64_t>(work_item->load_return.data.s32[0]); break;
			case  4: registers[dst_reg_ind].u64 = static_cast<uint64_t>(work_item->load_return.data.u32[0]); break;
			case -8: registers[dst_reg_ind].s64 = work_item->load_return.data.s64[0];  break;
			case  8: registers[dst_reg_ind].u64 = work_item->load_return.data.u64[0];  break;
			}

			state = STATE::NEXT;
			work_item->type = WorkItem::TYPE::INSTR_NEXT;
			send_output_to(this, *work_item, 1);

			break;
		}

		case WorkItem::TYPE::REQUEST_ACCEPTED:
			//told to unstall from excute
			if (_stalled_for_store)
			{
				_stalled_for_store = false;
				state = STATE::NEXT;
				work_item->type = WorkItem::TYPE::INSTR_NEXT;
				send_output_to(this, *work_item, 1);
			}
			break;

		//We told ourself to do another instruction
		case WorkItem::TYPE::INSTR_NEXT:
			if (state == STATE::STALLED)
			{
				//printf("Aborted instruction\n");
			}
			else 
			{
				//Execute instruction
				_process_instruction(work_item);
				if (branch_taken) branch_taken = false;
				else pc += 4;
			}
			break;

		nodefault;
		}

		//The zero register is hardwired to be zero.  We have to explicitly set it, because e.g. GCC
		//	writes into it for no reason.
		int_regs->zero.u64 = 0;

	}
}

}}}
