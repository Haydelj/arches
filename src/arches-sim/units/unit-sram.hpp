#pragma once

#include "../stdafx.hpp"

#include "input-buffer.hpp"
#include "unit-ram-base.hpp"

namespace Arches {


class WorkItem;


namespace Units {


class UnitSRAM final : public UnitRAMBase 
{
	private:
		InputBuffer::ArbitratorLowestIndex _arbitrator;
		Arches::cycles _latency;

	public:
		UnitSRAM(Simulator* simulator, uint latency, uint16_t num_clients, size_t size_bytes);
		virtual ~UnitSRAM() override;

		virtual void process(InputBuffer* buffer, cycles current_cycle) override;

	private:
		void _load (WorkItem*       work_item);
		void _store(WorkItem const* work_item);
};


}}
