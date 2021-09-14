#pragma once

#include "../../stdafx.hpp"

#include "../input-buffer.hpp"
#include "../unit-base.hpp"
#include "../../isa/riscv.hpp"

#include "registers.hpp"

namespace Arches { namespace Units { namespace RISCV {

	class UnitExecutionBase : public UnitBase 
	{
	public:
		IntegerRegisterFile*       int_regs;
		FloatingPointRegisterFile* float_regs;
		uint16_t                   id;

		bool branch_taken;
		Arches::virtual_address pc;

		struct
		{
			union
			{
				struct
				{
					int8_t signed_width_code;
					uint8_t dst_reg;
					uint8_t dst_reg_file;
				};
				union
				{
					uint64_t store_data;
					uint8_t store_data_u8[8];
				};
			};

			Arches::virtual_address vaddr;
			uint32_t size;
		}
		memory_access_data;	

		//TODO private with getters
		UnitBase* mem_higher;

	protected:
		explicit UnitExecutionBase(Simulator* simulator, uint16_t id) : UnitBase(simulator), id(id) {}

		void create_store_work_item(WorkItem& work_item) 
		{
			work_item.type = WorkItem::TYPE::STORE;
			work_item.store.vaddr = memory_access_data.vaddr;
			work_item.store.size = memory_access_data.size;

			work_item.store.data.u64[0] = memory_access_data.store_data;
			
			work_item.store.prev_id = id;
		}

		void create_load_work_item(WorkItem& work_item)
		{
			work_item.type = WorkItem::TYPE::LOAD;
			work_item.load.vaddr = memory_access_data.vaddr;
			work_item.load.size = memory_access_data.size;

			work_item.load.dst_unit_data.s8[0] = memory_access_data.signed_width_code;
			work_item.load.dst_unit_data.u8[1] = memory_access_data.dst_reg;
			work_item.load.dst_unit_data.u8[2] = memory_access_data.dst_reg_file;

			work_item.load.dst_stack_index = 0;
			work_item.load.dst_stack[0] = id;
		}

		bool _check_dependacies_and_set_valid_bit(const ISA::RISCV::Instruction instr, ISA::RISCV::InstructionData const& instr_data)
		{
			bool* dst_valid = (uint8_t)instr_data.dst_reg_file ? float_regs->valid : int_regs->valid;
			bool* src_valid = (uint8_t)instr_data.src_reg_file ? float_regs->valid : int_regs->valid;

			switch (instr_data.encoding)
			{
			case ISA::RISCV::Encoding::R:
				if (dst_valid[instr.rd] && src_valid[instr.rs1] && src_valid[instr.rs2])
				{
					dst_valid[instr.rd] = false;
					int_regs->valid[0] = true;
					return true;
				}
				break;

			case ISA::RISCV::Encoding::R4:
				if (dst_valid[instr.rd] && src_valid[instr.rs1] && src_valid[instr.rs2] && src_valid[instr.rs3])
				{
					dst_valid[instr.rd] = false;
					int_regs->valid[0] = true;
					return true;
				}
				break;

			case ISA::RISCV::Encoding::I:
				if (dst_valid[instr.rd] && src_valid[instr.rs1])
				{
					dst_valid[instr.rd] = false;
					int_regs->valid[0] = true;
					return true;
				}
				break;

			case ISA::RISCV::Encoding::S:
				if (dst_valid[instr.rs2] && src_valid[instr.rs1])
				{
					return true;
				}
				break;

			case ISA::RISCV::Encoding::B:
				if (src_valid[instr.rs1] && src_valid[instr.rs2])
				{
					return true;
				}
				break;

			case ISA::RISCV::Encoding::U:
				if (dst_valid[instr.rd])
				{
					dst_valid[instr.rd] = false;
					int_regs->valid[0] = true;
					return true;
				}
				break;

			case ISA::RISCV::Encoding::J:
				if (dst_valid[instr.rd])
				{
					dst_valid[instr.rd] = false;
					int_regs->valid[0] = true;
					return true;
				}
				break;
			}

			return false;
		}

	public:
		virtual ~UnitExecutionBase() = default;
		void set_mem_higher(UnitBase* unit)
		{
			mem_higher = unit;
			add_output_to(mem_higher, 1);
		}
	};

}}}
