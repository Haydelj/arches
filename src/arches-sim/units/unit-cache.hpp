#pragma once

#include "../stdafx.hpp"

#include "../util/bit-manipulation.hpp"

#include "input-buffer.hpp"

#include "unit-memory-base.hpp"



namespace Arches { namespace Units {

class UnitCache final : public UnitMemoryBase
{
public:
	class Logger
	{
	public:
		const enum class Event
		{
			LOAD,
			LOAD_MISS,
			LOAD_HIT,
			STORE,
			NUM_EVENTS
		};

		const std::string event_messages[static_cast<size_t>(Event::NUM_EVENTS)] =
		{
			"Loads: ",
			"Load misses: ",
			"Load hits: ",
			"Store: ",
		};

	#ifdef ARCHES_LOGGING
		uint64_t event_counters[static_cast<uint32_t>(Event::NUM_EVENTS)]{0};
	#endif

		Logger() {}
		virtual ~Logger() {}

		void log_event(Event event_type)
		{
		#ifdef ARCHES_LOGGING
			++event_counters[static_cast<uint32_t>(event_type)];
		#endif
		}

		void accumulate(const Logger* other)
		{
		#ifdef ARCHES_LOGGING
			for(uint32_t i = 0; i < static_cast<uint32_t>(Event::NUM_EVENTS); ++i)
				this->event_counters[i] += other->event_counters[i];
		#endif
		}

		void print()
		{
		#ifdef ARCHES_LOGGING
			std::cout << "\tEvents:\n";
			for(size_t i = 0; i < static_cast<size_t>(Event::NUM_EVENTS); ++i)
				std::cout << "\t\t" << event_messages[i] << event_counters[i] << "\n";
			std::cout << "\n";

			std::cout << "\tStats:\n";
			std::cout << "\t\tHit rate: " << static_cast<float>(event_counters[static_cast<size_t>(Event::LOAD_HIT)]) / static_cast<float>(event_counters[static_cast<size_t>(Event::LOAD)]) * 100.0f << "%\n";
			std::cout << "\t\tMiss rate: " << static_cast<float>(event_counters[static_cast<size_t>(Event::LOAD_MISS)]) / static_cast<float>(event_counters[static_cast<size_t>(Event::LOAD)]) * 100.0f << "%\n";
			std::cout << "\n";
		#endif
		}
	};

	struct CacheConfiguration
	{
		uint cache_size{ 1024 };
		uint line_size{ 32 };
		uint associativity{ 1 };
		uint num_banks{ 1 };
		uint bank_stride{1};
		uint num_ports{ 1 };
		uint penalty{ 1 };
	};

private:
	struct _CacheLine
	{
		uint64_t tag;
		uint8_t lru;
		bool valid;
	};

	struct _Bank
	{
		int port{ -1 };
	};

	struct _Port
	{
		WorkItem work_item;
		WorkItem pending_work_item;
		uint load_offset{ 0 };
		bool pending_mem_higher{ false };
		bool open{ true };
	};

	InputBuffer::ArbitratorRoundRobin _arbitrator;

	CacheConfiguration _configuration;

	uint  _penalty;
	uint _offset_bits, _set_index_bits, _tag_bits, _bank_index_bits;
	uint64_t _offset_mask, _set_index_mask, _tag_mask, _bank_index_mask;
	uint _set_index_offset, _tag_offset, _bank_index_offset;

	uint _associativity, _line_size;
	std::vector<_CacheLine> _cache_state;
	std::vector<uint8_t> _data_u8; //backing data left seperate to reduce stride when updating lru

	uint _ports_open, _num_banks, _num_ports;
	std::vector<_Bank> _banks;
	std::vector<_Port> _ports;

	bool _waiting_on_mem_higher_to_accept_request{ false };
	int _port_to_release_on_ready{ -1 };

	Logger _logger;

public:
	UnitCache(Simulator* simulator, CacheConfiguration config, uint16_t num_clients, uint16_t id);
	virtual ~UnitCache();
	virtual void process(InputBuffer* buffer, cycles current_cycle) override;
	
	Logger* get_log() { return &_logger; }

private:
	uint64_t _get_offset(physical_address paddr) { return (paddr >> 0) & _offset_mask;}
	uint64_t _get_set_index(physical_address paddr) {return (paddr >> _set_index_offset)  & _set_index_mask;}
	uint64_t _get_tag(physical_address paddr) { return (paddr >> _tag_offset) & _tag_mask; }
	uint64_t _get_bank(physical_address paddr) { return (paddr >> _bank_index_offset) & _bank_index_mask; }

	uint64_t _get_cache_line_start_paddr(physical_address paddr) { return (paddr >> _set_index_offset) << _set_index_offset; }

	uint8_t* _get_cache_line_data_pointer(uint cache_index)
	{
		uint data_index = cache_index;
		data_index <<= _offset_bits;
		return _data_u8.data() + data_index;
	}

	uint8_t* _get_cache_line(physical_address paddr);
	void _insert_cache_line(physical_address paddr, uint8_t* data);

	int _accuire_port_and_banks(physical_address paddr, uint access_size);
	void _release_port_and_banks(int port);

	void _process_load(WorkItem* work_item, int port = -1);
	void _process_load_return(WorkItem* work_item);
	void _process_store(WorkItem* work_item);
};


}}