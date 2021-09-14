
#include "unit-thread-proccesor.hpp"
#include "unit-shared-functional.hpp"

#ifdef BUILD_DEBUG
//#define PRINT_INSTR
#else
#undef PRINT_INSTR
#endif

using namespace TRaX;

using namespace Arches;
using namespace Arches::Units;
using namespace Arches::Units::RISCV;

using namespace Arches::ISA::RISCV;

//TRAXAMOIN
const static InstructionInfo traxamoin(0b00010, "traxamoin", Type::CUSTOM, Encoding::U, RegFile::INT, IMPL_DECL
{
	static std::atomic_uint64_t value = 0;
	//std::cout << "amoin: " << value << "\n";
	unit->int_regs->registers[instr.u.rd].u64 = value++;
	//printf("%d\n", unit->int_regs->registers[instr.u.rd].u32);
});

UnitThreadProccesor::UnitThreadProccesor(Simulator* simulator, UnitSharedFunctional* int_mul, UnitSharedFunctional* float_add, UnitSharedFunctional* float_mul, UnitSharedFunctional* float_inv_sqrt, uint16_t id) : UnitExecutionBase(simulator, id)
{
	priority = 2;

	isa[CUSTOM_OPCODE0] = traxamoin;

	add_output_to(this, 4); //Add output to ourself for pipelining
	
	this->int_regs = &_int_regs;
	this->float_regs = &_float_regs;

	this->int_regs->ra.u64 = 0ull;
	//this->int_regs->sp.u64 = 0ull;
	//this->int_regs->fp.u64 = 0ull;

	_int_mul = int_mul;
	_float_add = float_add;
	_float_mul = float_mul;
	_float_inv_sqrt = float_inv_sqrt;

	add_output_to(_int_mul, 1);
	add_output_to(_float_add, 1);
	add_output_to(_float_mul, 1);
	add_output_to(_float_inv_sqrt, 1);

	_int_mul->add_unit(this);
	_float_add->add_unit(this);
	_float_mul->add_unit(this);
	_float_inv_sqrt->add_unit(this);
}

UnitThreadProccesor::~UnitThreadProccesor() /*override*/
{

}

void UnitThreadProccesor::prepare() /*override*/
{
	UnitBase::prepare();

	_if_state.pc = pc;
	_if_state.valid = true;

	WorkItem item;
	item.type = WorkItem::TYPE::CONTINUE;
	send_output_to(this, item, 1);
}

void UnitThreadProccesor::_stall_for_fu()
{
	_stall_for_fu_cycle = _current_cycle;
	_stalled_for_fu = true;
}

void UnitThreadProccesor::_unstall_for_fu()
{
	if(_current_cycle - _stall_for_fu_cycle > 1) _logger.log(Logger::Event::STALL_FOR_FU);
	_stalled_for_fu = false;
}

void UnitThreadProccesor::_try_stall_for_data()
{
	if (!_stalled_for_data)
	{
		_stall_for_data_cycle = _current_cycle;
		_stalled_for_data = true;
	}
}

void UnitThreadProccesor::_try_unstall_for_data()
{
	if (_stalled_for_data)
	{
		if(_current_cycle - _stall_for_data_cycle > 1) _logger.log(Logger::Event::STALL_FOR_DATA);
		_stalled_for_data = false;
	}
}

void UnitThreadProccesor::_process_instruction_fetch()
{
	//if we invalidated this if then we skip this cycle and resume next
	if (_execution_complete || _current_cycle == _if_state.last_execute_cycle) return;
	
	_if_state.last_execute_cycle = _current_cycle;

	if (!_if_state.valid) 
	{
		_if_state.valid = true;
		return;
	}

	//we can't issue new instructions to the decode unit while it's stalled
	if (_stalled()) return;
	
	virtual_address  instr_vaddr = _if_state.pc; _if_state.pc += 4;
	physical_address instr_paddr = static_cast<UnitMMU<GLOBAL_PAGE_SIZE>*>(mem_higher)->translate_allocate_as_necessary(instr_vaddr);

	if (instr_vaddr == 0ull) 
	{
		_if_state.valid = false;
		_execution_complete = true;
		return;
	}

	//TODO actually do a memory access to I-cache instead of this hack
	_id_state.instr.data = (*reinterpret_cast<uint32_t const*>(cheat_ram->_data_u8 + instr_paddr));
	_id_state.pc = instr_vaddr;
	_id_state.valid = true;
}

void UnitThreadProccesor::_process_instruction_decode()
{
	if (_current_cycle == _id_state.last_execute_cycle || _stalled_for_fu) return;
	if (!_id_state.valid) return;

	ISA::RISCV::Instruction instr; instr.data = _id_state.instr.data;
	ISA::RISCV::InstructionInfo const& instr_info = instr.get_info();
	ISA::RISCV::InstructionData const& instr_data = instr_info.get_data();

	//dependency check
	if (!_check_dependacies_and_set_valid_bit(instr, instr_data))
	{
		_try_stall_for_data();
		return;
	}
	_try_unstall_for_data();

	_id_state.last_execute_cycle = _current_cycle;
	_logger.log_instr(instr, instr_data);

	#ifdef PRINT_INSTR
	if (print)
	{
		printf("Executing %07I64x: %08x", _id_state.pc, instr.data);
		printf(" \t(%s)", instr_data.mnemonic);
		printf("\n");
	}
	#endif

	WorkItem item;
	item.type = WorkItem::TYPE::MOCK_EXECUTE;
	item.write_back.dst_reg = instr.rd;
	item.write_back.dst_reg_file = static_cast<uint8_t>(instr_data.dst_reg_file);
	item.write_back.thread_id = id;

	bool write_back = true;
	bool execute_normaly = true;
	int latency = 1;

	pc = _id_state.pc;

	switch (instr_data.type)
	{
	case ISA::RISCV::Type::NA:
	case ISA::RISCV::Type::SYS:
		assert(false);
	break;
	
	case ISA::RISCV::Type::STORE:
		write_back = false;
		execute_normaly = false;
		instr_info.execute(this, instr);

		if (memory_access_data.vaddr > (0ull - STACK_SIZE))
		{
			assert((memory_access_data.vaddr & ~local_stack_mask) == ~local_stack_mask);

			uint offset = memory_access_data.vaddr & local_stack_mask;
			std::memcpy(local_stack_mem + offset, memory_access_data.store_data_u8, memory_access_data.size);
		}
		else
		{
			create_store_work_item(item);
			send_output_to(mem_higher, item, 2);//decode->address translation->memory access
			_stall_for_fu();
		}
	break;

	case ISA::RISCV::Type::LOAD:
		write_back = false;
		execute_normaly = false;
		instr_info.execute(this, instr);

		if (memory_access_data.vaddr > (0ull - STACK_SIZE))
		{
			assert((memory_access_data.vaddr & ~local_stack_mask) == ~local_stack_mask);

			uint offset = memory_access_data.vaddr & local_stack_mask;
			create_load_work_item(item);
			item.type = WorkItem::TYPE::LOAD_RETURN;
			std::memcpy(item.load_return.data.u8, local_stack_mem + offset, memory_access_data.size);
			send_output_to(this, item, 3);//decode->address translation->memory access->wb
		}
		else
		{
			create_load_work_item(item);
			send_output_to(mem_higher, item, 2);//decode->address translation->memory access
			_stall_for_fu();
		}
	break;

	case ISA::RISCV::Type::JUMP:
		execute_normaly = false;

		instr_info.execute(this, instr);

		_if_state.valid = false;
		_if_state.pc = pc;

		_logger.log(Logger::Event::JUMP);

		#ifdef PRINT_INSTR
		#if 0
		std::cout << "\n\n!!!!!!!!!!!!! STACK STATE !!!!!!!!!!!!!!\n\n";

		std::cout << "a0-sp: " << int_regs->a0.u64 - int_regs->sp.u64 << " \ta0:" << int_regs->a0.u64 << "\n";
		std::cout << "a1-sp: " << int_regs->a1.u64 - int_regs->sp.u64 << " \ta1:" << int_regs->a1.u64 << "\n";
		std::cout << "a2-sp: " << int_regs->a2.u64 - int_regs->sp.u64 << " \ta2:" << int_regs->a2.u64 << "\n";
		std::cout << "a3-sp: " << int_regs->a3.u64 - int_regs->sp.u64 << " \ta3:" << int_regs->a3.u64 << "\n";
		std::cout << "a4-sp: " << int_regs->a4.u64 - int_regs->sp.u64 << " \ta4:" << int_regs->a4.u64 << "\n";
		std::cout << "a5-sp: " << int_regs->a5.u64 - int_regs->sp.u64 << " \ta5:" << int_regs->a5.u64 << "\n";
		std::cout << "a6-sp: " << int_regs->a6.u64 - int_regs->sp.u64 << " \ta6:" << int_regs->a6.u64 << "\n";
		std::cout << "a7-sp: " << int_regs->a7.u64 - int_regs->sp.u64 << " \ta7:" << int_regs->a7.u64 << "\n";

		std::cout << "\n";

		std::cout << "fa0: " << float_regs->fa0.f32 << "\n";
		std::cout << "fa1: " << float_regs->fa1.f32 << "\n";
		std::cout << "fa2: " << float_regs->fa2.f32 << "\n";
		std::cout << "fa3: " << float_regs->fa3.f32 << "\n";
		std::cout << "fa4: " << float_regs->fa4.f32 << "\n";
		std::cout << "fa5: " << float_regs->fa5.f32 << "\n";
		std::cout << "fa6: " << float_regs->fa6.f32 << "\n";
		std::cout << "fa7: " << float_regs->fa7.f32 << "\n";

		std::cout << "\n";

		for (virtual_address a = int_regs->sp.u64; a != 0ull; a += 4)
		{
			uint64_t offset = a - int_regs->sp.u64;
			physical_address paddr = static_cast<UnitMMU<PAGE_SIZE>*>(mem_higher)->translate_allocate_as_necessary(a);
			std::cout << "sp offset: " << offset /*<< " \physical address: " << paddr*/ << " \t float: " << cheat_ram->direct_read<float>(paddr) << " \t uint32_t: " << cheat_ram->direct_read<uint32_t>(paddr) << "\n";
		}

		std::cout << "\n";
		#endif		
		#endif
	break;

	case ISA::RISCV::Type::BRANCH:
		execute_normaly = false;
		write_back = false;

		instr_info.execute(this, instr);

		if (branch_taken)
		{
			_if_state.valid = false;
			_if_state.pc = pc;
			_logger.log(Logger::Event::JUMP);
		}
	break;

	case ISA::RISCV::Type::MOVE:
	case ISA::RISCV::Type::CONVERT:
	case ISA::RISCV::Type::ILOGICAL:
	case ISA::RISCV::Type::IADD:
	case ISA::RISCV::Type::ISUB:
		break;

	case ISA::RISCV::Type::IMUL:
	case ISA::RISCV::Type::IDIV:
		_stall_for_fu();
		send_output_to(_int_mul, item, 1); 
		write_back = false;
		break;

	case ISA::RISCV::Type::FCMP:
	case ISA::RISCV::Type::FSIGN:
	case ISA::RISCV::Type::FMIN_MAX:
		break;

	case ISA::RISCV::Type::FADD:
	case ISA::RISCV::Type::FSUB:
		_stall_for_fu();
		send_output_to(_float_add, item, 1);
		write_back = false;
		break;

	case ISA::RISCV::Type::FMUL:
	case ISA::RISCV::Type::FFUSED_MUL_ADD:
		_stall_for_fu();
		send_output_to(_float_mul, item, 1);
		write_back = false;
		break;

	case ISA::RISCV::Type::FDIV:
	case ISA::RISCV::Type::FSQRT:
		_stall_for_fu();
		send_output_to(_float_inv_sqrt, item, 1);
		write_back = false;
		break;

	case ISA::RISCV::Type::CUSTOM:
		break;

		nodefault;
	}

	if (execute_normaly) instr_info.execute(this, instr);
	int_regs->zero.u64 = 0ull;

	if (write_back)
	{
		item.type = WorkItem::TYPE::WRITE_BACK;
		item.write_back.dst_reg = instr.rd;
		item.write_back.dst_reg_file = static_cast<uint8_t>(instr_data.dst_reg_file);
		//implicetly do reg file fowarding because if latency is 1 this will be avalible on the next cycle
		if (latency <= 1) _process_instruction_write_back(&item);
		else              send_output_to(this, item, static_cast<cycles>(latency));
	}

	_id_state.valid = false;
}

void UnitThreadProccesor::_process_instruction_write_back(WorkItem* work_item)
{
	bool* dst_valid = static_cast<uint8_t>(work_item->write_back.dst_reg_file) ? float_regs->valid : int_regs->valid;

	assert((work_item->write_back.dst_reg_file == 0 && work_item->write_back.dst_reg == 0) || dst_valid[work_item->write_back.dst_reg] == false);
	dst_valid[work_item->write_back.dst_reg] = true;
}

void UnitThreadProccesor::_process_load_return(WorkItem* work_item)
{
	int8_t  signed_width_code = work_item->load_return.dst_unit_data.s8[0];
	uint8_t dst_reg_index = work_item->load_return.dst_unit_data.u8[1];
	uint8_t dst_reg_file = work_item->load_return.dst_unit_data.u8[2];

	Register64* registers = dst_reg_file == 0 ? int_regs->registers : float_regs->registers;
	bool* dst_valid = dst_reg_file == 0 ?       int_regs->valid     : float_regs->valid;

	assert(dst_valid[dst_reg_index] == false);
	dst_valid[dst_reg_index] = true;

	switch (signed_width_code)
	{
	case -1: registers[dst_reg_index].s64 = static_cast<int64_t>(work_item->load_return.data.s8[0]); break;
	case  1: registers[dst_reg_index].u64 = static_cast<uint64_t>(work_item->load_return.data.u8[0]); break;
	case -2: registers[dst_reg_index].s64 = static_cast<int64_t>(work_item->load_return.data.s16[0]); break;
	case  2: registers[dst_reg_index].u64 = static_cast<uint64_t>(work_item->load_return.data.u16[0]); break;
	case -4: registers[dst_reg_index].s64 = static_cast<int64_t>(work_item->load_return.data.s32[0]); break;
	case  4: registers[dst_reg_index].u64 = static_cast<uint64_t>(work_item->load_return.data.u32[0]); break;
	case -8: registers[dst_reg_index].s64 = work_item->load_return.data.s64[0];  break;
	case  8: registers[dst_reg_index].u64 = work_item->load_return.data.u64[0];  break;
	}
}

void UnitThreadProccesor::process(InputBuffer* buffer, cycles current_cycle) /*override*/
{
	WorkItem* execute_item = nullptr;
	assert(!buffer->is_empty());
	while (WorkItem* work_item = buffer->get_next_work_item())
	{
		#if 0
		if (work_item->type == WorkItem::TYPE::LOAD_RETURN && !~work_item->load_return.dst_unit_data.s8[2])
		{
			assert(false); //for now this shouldnt be used
			//convert load return for instruction to a decode workitem
			work_item->type = WorkItem::TYPE::INSTR_DECODE;
			work_item->instr.instruction = work_item->load_return.data.u32[0];
			//todo firgure out how to get the vaddr of the instruction
		}
		#endif

		switch (work_item->type)
		{
		case WorkItem::TYPE::LOAD_RETURN:
			_process_load_return(work_item);
			break;

		case WorkItem::TYPE::REQUEST_ACCEPTED:
			_unstall_for_fu();
			break;

		case WorkItem::TYPE::CONTINUE:
			break;

		case WorkItem::TYPE::WRITE_BACK:
			_process_instruction_write_back(work_item);
			break;

		nodefault;
		}
	}

	_current_cycle = current_cycle;

	_process_instruction_decode();
	_process_instruction_fetch();

	if (!_stalled() && !_execution_complete && (_next_cycle <= _current_cycle))
	{
		WorkItem item;
		item.type = WorkItem::TYPE::CONTINUE;
		send_output_to(this, item, 1);
		_next_cycle = _current_cycle + 1;
	}
}
