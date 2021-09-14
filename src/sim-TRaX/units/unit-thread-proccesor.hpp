#pragma once
#include <arches-sim/include.hpp>

namespace Arches { namespace Units {

		class UnitRAMBase;

}}

namespace TRaX {
	#define LOCAL_MEM_SIZE 1024u

	class UnitSharedFunctional;

	class UnitThreadProccesor final : public Arches::Units::RISCV::UnitExecutionBase
	{
	public:
		class Logger
		{
		public:
			const enum class Event
			{
				STALL_FOR_LOAD,
				STALL_FOR_DATA,
				STALL_FOR_FU,
				STALL_FOR_INT_MUL_FU,
				STALL_FOR_FLOAT_ADD_FU,
				STALL_FOR_FLOAT_MUL_FU,
				STALL_FOR_FLOAT_INV_SQRT_FU,
				JUMP,
				INSTR_EXECTUE,
				NUM_EVENTS,
			};

			const std::string event_messages[static_cast<size_t>(Event::NUM_EVENTS)] =
			{
				"Stalls for load: ",
				"Stalls for data: ",
				"Stalls for FU: ",
				"Stalls for int   multiply FU: ",
				"Stalls for float addition FU: ",
				"Stalls for float multiply FU: ",
				"Stalls for float inv/sqrt FU: ",
				"Jumps: ",
				"Instructions Executed: ",
			};

			#ifdef ARCHES_LOGGING
			uint64_t event_counters[static_cast<uint32_t>(Event::NUM_EVENTS)]{0};
			//uint64_t instr_opcode_counters[Arches::ISA::RISCV::NUM_OPCODES]{0};
			uint64_t instr_type_counters[static_cast<uint32_t>(Arches::ISA::RISCV::Type::NUM_TYPES)]{0};
			#endif

			Logger() {}

			virtual ~Logger() {}

			void log(Event event_type)
			{
			#ifdef ARCHES_LOGGING
				++event_counters[static_cast<uint32_t>(event_type)];
			#endif
			}

			void log_instr(const Arches::ISA::RISCV::Instruction& instr, const Arches::ISA::RISCV::InstructionData& instr_data)
			{
			#ifdef ARCHES_LOGGING
				log(Event::INSTR_EXECTUE);
				//++instr_opcode_counters[instr.opcode];
				++instr_type_counters[static_cast<size_t>(instr_data.type)];
			#endif
			}

			void accumulate(const Logger* other)
			{
			#ifdef ARCHES_LOGGING
				for (uint32_t i = 0; i < static_cast<uint32_t>(Event::NUM_EVENTS); ++i)
					this->event_counters[i] += other->event_counters[i];

				/*
				for(size_t i = 0; i < static_cast<size_t>(Arches::ISA::RISCV::NUM_OPCODES); ++i)
					this->instr_opcode_counters[i] += other->instr_opcode_counters[i];
				*/

				for(size_t i = 0; i < static_cast<size_t>(Arches::ISA::RISCV::Type::NUM_TYPES); ++i)
					this->instr_type_counters[i] += other->instr_type_counters[i];
			#endif
			}

			void print()
			{
			#ifdef ARCHES_LOGGING
				//std::cout << "Thread Proccesor:\n";

				std::cout << "\tEvents:\n";
				for (size_t i = 0; i < static_cast<size_t>(Event::NUM_EVENTS); ++i)
					std::cout << "\t\t" << event_messages[i] << event_counters[i] << "\n";
				std::cout << "\n";

				/*
				std::cout << "\tInstructions by opcode:\n";
				for(size_t i = 0; i < static_cast<size_t>(Arches::ISA::RISCV::NUM_OPCODES); ++i)
					std::cout << "\t\t" << Arches::ISA::RISCV::instr_opcode_names[i] << ": " << instr_opcode_counters[i] << "\n";
				std::cout << "\n";
				*/

				std::cout << "\tInstructions by type:\n";
				for(size_t i = 0; i < static_cast<size_t>(Arches::ISA::RISCV::Type::NUM_TYPES); ++i)
					std::cout << "\t\t" << Arches::ISA::RISCV::instr_type_names[i] << ": " << instr_type_counters[i] << "\n";
				std::cout << "\n";

				std::cout << "\n";
			#endif
			}
		};

	public: //TODO: `private`		
		Arches::Units::UnitBase* instr_mem;
		Arches::Units::UnitRAMBase* cheat_ram;
		bool print {false};

	private:
		Logger _logger{};

		Arches::Units::RISCV::IntegerRegisterFile       _int_regs;
		Arches::Units::RISCV::FloatingPointRegisterFile _float_regs;

		UnitSharedFunctional* _int_mul;    
		UnitSharedFunctional* _float_add;
		UnitSharedFunctional* _float_mul; 
		UnitSharedFunctional* _float_inv_sqrt;

		struct _InstructionFetchState
		{
			Arches::virtual_address pc;
			Arches::cycles last_execute_cycle{ 0 };
			bool valid{ false };
		}_if_state;

		struct _InstructionDecodeState
		{
			Arches::virtual_address pc;
			Arches::cycles last_execute_cycle{ 0 };
			Arches::ISA::RISCV::Instruction instr;
			bool valid{ false };
		}_id_state;

		bool _stalled_for_fu{ false };
		Arches::cycles _stall_for_fu_cycle {0};

		bool _stalled_for_data{ false };
		Arches::cycles _stall_for_data_cycle {0};

		Arches::cycles _current_cycle{0};
		Arches::cycles _next_cycle{0};

		bool _execution_complete{ false };

		uint8_t local_stack_mem[LOCAL_MEM_SIZE];
		uint64_t local_stack_mask {generate_nbit_mask(log2i(LOCAL_MEM_SIZE))};

	public:
		explicit UnitThreadProccesor(Arches::Simulator* simulator, UnitSharedFunctional* int_mul, UnitSharedFunctional* float_add, UnitSharedFunctional* float_mul, UnitSharedFunctional* float_sqrt, uint16_t ID);
		virtual ~UnitThreadProccesor() override;

		virtual void prepare() override;
		virtual void process(Arches::Units::InputBuffer* buffer, Arches::cycles current_cycle) override;

		Logger* get_log() { return &_logger; }

	private:
		void _stall_for_fu();
		void _try_stall_for_data();
		void _unstall_for_fu();
		void _try_unstall_for_data();
		bool _stalled() { return _stalled_for_fu || _stalled_for_data; }

		void _process_instruction_fetch();
		void _process_instruction_decode();
		void _process_instruction_write_back(Arches::WorkItem* work_item);
		void _process_load_return(Arches::WorkItem* work_item);

	};

}