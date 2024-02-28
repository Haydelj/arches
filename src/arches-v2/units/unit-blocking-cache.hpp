#pragma once 
#include "stdafx.hpp"

#include "unit-cache-base.hpp"

namespace Arches { namespace Units {

class UnitBlockingCache : public UnitCacheBase
{
public:
	struct Configuration
	{
		uint size{1024};
		uint associativity{1};

		uint latency{1};
		uint cycle_time{1};

		uint num_ports{1};
		uint num_banks{1};
		uint cross_bar_width{1};
		uint64_t bank_select_mask{0};

		UnitMemoryBase* mem_higher{nullptr};
		uint            mem_higher_port_offset{0};
		uint            mem_higher_port_stride{1};
	};

	UnitBlockingCache(Configuration config);
	virtual ~UnitBlockingCache();

	void clock_rise() override;
	void clock_fall() override;

	bool request_port_write_valid(uint port_index) override;
	void write_request(const MemoryRequest& request) override;

	bool return_port_read_valid(uint port_index) override;
	const MemoryReturn& peek_return(uint port_index) override;
	const MemoryReturn read_return(uint port_index) override;

private:
	struct Bank
	{
		enum class State : uint8_t
		{
			IDLE,
			MISSED,
			ISSUED,
			FILLED,
		}
		state{State::IDLE};
		MemoryRequest current_request{};
		Pipline<MemoryRequest> tag_array_pipline;
		Pipline<MemoryReturn> data_array_pipline;
		Bank(uint latency, uint cycle_time) : tag_array_pipline(cycle_time, cycle_time), data_array_pipline(latency, cycle_time) {}
	};

	std::vector<Bank> _banks;
	RequestCrossBar _request_cross_bar;
	ReturnCrossBar _return_cross_bar;

	UnitMemoryBase* _mem_higher;
	uint _mem_higher_port_offset;
	uint _mem_higher_port_stride;

	void _clock_rise(uint bank_index);
	void _clock_fall(uint bank_index);

public:
	class Log
	{
	public:
		union
		{
			struct
			{
				uint64_t _total;
				uint64_t _hits;
				uint64_t _misses;
				uint64_t _uncached_writes;
				uint64_t _bytes_read;
				uint64_t _tag_array_access;
				uint64_t _data_array_reads;
				uint64_t _data_array_writes;
			};
			uint64_t counters[8];
		};

		Log() { reset(); }

		void reset()
		{
			for(uint i = 0; i < 8; ++i)
				counters[i] = 0;
		}

		void accumulate(const Log& other)
		{
			for(uint i = 0; i < 8; ++i)
				counters[i] += other.counters[i];
		}

		void log_requests(uint n = 1) { _total += n; } //TODO hit under miss logging

		void log_hit(uint n = 1) { _hits += n; } //TODO hit under miss logging
		void log_miss(uint n = 1) { _misses += n; }

		void log_uncached_write(uint n = 1) { _uncached_writes += n; }

		void log_bytes_read(uint bytes) { _bytes_read += bytes; }

		void log_tag_array_access() { _tag_array_access++; }
		void log_data_array_read() { _data_array_reads++; }
		void log_data_array_write() { _data_array_writes++; }

		uint64_t get_total() { return _hits + _misses; }
		uint64_t get_total_data_array_accesses() { return _data_array_reads + _data_array_writes; }

		void print_log(cycles_t cycles, uint units = 1)
		{
			uint64_t total = get_total();
			float ft = total / 100.0f;

			uint64_t da_total = get_total_data_array_accesses();

			printf("Total: %lld\n", total / units);
			printf("Hits: %lld(%.2f%%)\n", _hits / units, _hits / ft);
			printf("Misses: %lld(%.2f%%)\n", _misses / units, _misses / ft);
			printf("Tag Array Total: %lld\n", _tag_array_access);
			printf("Data Array Total: %lld\n", da_total);
			printf("Data Array Reads: %lld\n", _data_array_reads);
			printf("Data Array Writes: %lld\n", _data_array_writes);
			printf("Data Array Writes: %lld\n", _data_array_writes);
			printf("Bandwidth: %.2f Bytes/Cycle\n", (double)_bytes_read / units / cycles);
		}
	}log;
};

}}