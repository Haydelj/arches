#pragma once

#include "../stdafx.hpp"

#include "../../../dual-streaming-benchmark/src/work-item.hpp"

namespace Arches {

#define CACHE_BLOCK_SIZE 64
#define ROW_BUFFER_SIZE (8 * 1024)

struct MemoryRequest
{
public:
	enum class Type : uint8_t
	{
		NA,

		LOAD,
		STORE,
		
		STORE_HIT,

		AMO_ADD,
		AMO_XOR,
		AMO_OR,
		AMO_AND,
		AMO_MIN,
		AMO_MAX,
		AMO_MINU,
		AMO_MAXU,
	};

	//meta data 
	Type     type;
	uint8_t  size;
	uint16_t dst;
	uint16_t port;

	uint64_t write_mask;

	union
	{
		paddr_t paddr;
		vaddr_t vaddr;
	};

	union
	{
		uint8_t  data[CACHE_BLOCK_SIZE];
		uint8_t  data_u8;
		uint16_t data_u16;
		uint32_t data_u32;
		uint64_t data_u64;
	};

public:
	MemoryRequest() = default;

	MemoryRequest(const MemoryRequest& other) : type(other.type), size(other.size), dst(other.dst), port(other.port), write_mask(other.write_mask), paddr(other.paddr)
	{
		std::memcpy(data, other.data, size);
	}

	MemoryRequest& operator=(const MemoryRequest& other)
	{
		type = other.type;
		size = other.size;
		dst = other.dst;
		port = other.port;
		write_mask = other.write_mask;
		paddr = other.paddr;
		std::memcpy(data, other.data, size);
		return *this;
	}
};

struct MemoryReturn
{
public:
	enum class Type : uint8_t
	{
		NA,
		LOAD_RETURN,
	};

	//meta data 
	Type     type;
	uint8_t  size;
	uint16_t dst;
	uint16_t port;

	union
	{
		paddr_t paddr;
		vaddr_t vaddr;
	};

	union
	{
		uint8_t  data[CACHE_BLOCK_SIZE];
		uint8_t  data_u8;
		uint16_t data_u16;
		uint32_t data_u32;
		uint64_t data_u64;
	};

public:
	MemoryReturn() = default;

	MemoryReturn(const MemoryReturn& other) : type(other.type), size(other.size), port(other.port), dst(other.dst), paddr(other.paddr)
	{
		std::memcpy(data, other.data, size);
	}

	MemoryReturn(const MemoryRequest& request) : size(request.size), dst(request.dst), port(request.port), paddr(request.paddr)
	{
		type = Type::LOAD_RETURN;
	}

	MemoryReturn& operator=(const MemoryReturn& other)
	{
		type = other.type;
		size = other.size;
		dst = other.dst;
		port = other.port;
		paddr = other.paddr;
		std::memcpy(data, other.data, size);
		return *this;
	}
};

struct StreamSchedulerRequest
{
	enum class Type : uint8_t
	{
		NA,
		LOAD_BUCKET,
		STORE_WORKITEM,
	};

	Type type;
	uint     port;

	union
	{

		uint     last_segment;
		WorkItem work_item;
	};

	StreamSchedulerRequest()
	{

	}
};

struct HitRecordUpdateRequest
{
	uint     port;
	rtm::Hit hit;
};

struct SFURequest
{
	uint16_t dst;
	uint16_t port;
};

}
