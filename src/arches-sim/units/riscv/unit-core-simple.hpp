#pragma once

#include "../../stdafx.hpp"

#include "../input-buffer.hpp"
#include "unit-execution-base.hpp"


namespace Arches { namespace Units {


class UnitRAMBase;


namespace RISCV {


class IntegerRegisterFile;
class FloatingPointRegisterFile;
class Unit_FPU64;


class UnitCoreSimple final : public UnitExecutionBase 
{
	public: //TODO: `private`

		//TODO: not this.
		UnitRAMBase* _cheat_dram;
		bool _stalled_for_store{ false };

		enum class STATE {
			NEXT,
			STALLED,
			FINISHED
		} state;

		union {
			uint32_t u32;
			int32_t  s32;
			uint64_t u64;
			int64_t  s64;
		} state_tmp[3];

	private:
		InputBuffer::ArbitratorRoundRobin _arbitrator;
		int instrCnt;

	public:
		explicit UnitCoreSimple(Simulator* simulator, IntegerRegisterFile* int_regs, FloatingPointRegisterFile* float_regs);
		virtual ~UnitCoreSimple() override;

		virtual void prepare() override;

	private:
		void _process_instruction(WorkItem* work_item);

	public:
		virtual void process(InputBuffer* buffer, cycles current_cycle) override;
};


}}}
