#pragma once

#include "../stdafx.hpp"

#include "../USIMM/memory_controller.h"

#include "input-buffer.hpp"
#include "unit-ram-base.hpp"


namespace Arches {


class WorkItem;


namespace Units {


class UnitDRAM final : public UnitRAMBase, public UsimmListener 
{
	private:
		InputBuffer::ArbitratorLowestIndex _arbitrator;
		Simulator* _simulator;//used to get the current cycle

		std::unordered_map<uint32_t, WorkItem> request_map;
		uint32_t _num_work_items;
		Arches::cycles _current_cycle{ 0 };
		Arches::cycles _last_execute_cycle{ 0 };

	public:
		UnitDRAM(Simulator* simulator, uint16_t clients, size_t size_bytes);
		virtual ~UnitDRAM() override;

		virtual void process(InputBuffer* buffer, cycles current_cycle) override;

		void update_usimm(Arches::cycles curr_cycle);
		bool usimm_busy();
		void print_usimm_stats(uint32_t const L2_line_size, uint32_t const word_size, Arches::cycles cycle_count);
		
		virtual void UsimmNotifyEvent(Arches::physical_address const address, Arches::cycles write_cycle, uint32_t request_id);

	private:
		void _load (WorkItem*       work_item);
		void _store(WorkItem const* work_item);
};


}}
