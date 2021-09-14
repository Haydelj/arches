#pragma once
#include <arches-sim/include.hpp>

namespace TRaX 
{
	class UnitSharedFunctional : public Arches::Units::UnitBase
	{
	private:
		Arches::cycles _latency;
		Arches::Units::InputBuffer::ArbitratorRoundRobin _arbitrator;

		uint32_t _cluster_size;
		uint32_t _num_clients{0};
		uint32_t _num_clients_pending{0};
		uint32_t _current_client_id{0};
		uint32_t _instr_accepted_this_cycle = 0;
		Arches::cycles _previous_cycle = 0;

		struct _ClientData
		{
			Arches::Units::UnitBase* unit{nullptr};
			uint8_t dst_reg;
			uint8_t dst_reg_file;
			//bool pending{false};
			//bool stalled{false};
		};

		std::vector<_ClientData> _clients;
		std::vector<bool> _pending;

	public:
		UnitSharedFunctional(Arches::Simulator* simulator, uint num_clients, uint issues_per_cycle, Arches::cycles latency);
		virtual ~UnitSharedFunctional() override;

		void add_unit(Arches::Units::RISCV::UnitExecutionBase* unit);

		virtual void process(Arches::Units::InputBuffer* buffer, Arches::cycles current_cycle) override;
	};

}