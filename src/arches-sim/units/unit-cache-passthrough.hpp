#pragma once

#include "../stdafx.hpp"

#include "input-buffer.hpp"

#include "unit-memory-base.hpp"

namespace Arches { namespace Units {

class UnitPassthroughCache final : public UnitMemoryBase {
	private:
		InputBuffer::ArbitratorRoundRobin _arbitrator;

	public:
		explicit UnitPassthroughCache(Simulator* simulator, uint16_t num_clients, uint16_t id) : UnitMemoryBase(simulator, num_clients, id) {}
		virtual ~UnitPassthroughCache() override = default;

		virtual void process(InputBuffer* buffer, cycles current_cycle) override;
};


}}
