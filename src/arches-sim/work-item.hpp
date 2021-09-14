#pragma once

#include "stdafx.hpp"


namespace Arches {

class WorkItem final 
{
public:
	enum class TYPE : uint32_t 
	{
		INVALID,

		LOAD,

		//Return information from DRAM
		LOAD_RETURN,

		STORE,

		REQUEST_ACCEPTED,
		UNIT_STALL,
		CONTINUE,

		INSTR_NEXT,

		INSTR_FETCH,  //converts to LOAD
		INSTR_DECODE, //converts from LOAD_RETURN
		INSTR_EXECUTE,//should only be sent to unit inheriting from UnitExecutionBase

		WRITE_BACK,
		MOCK_EXECUTE,

		PORT_READY,
		PORT_PENDING,
	};
	TYPE type;

	union 
	{
		//Payload for `LOAD_[width]` types.
		struct 
		{
			//Address for load. Setting these no a non union can be helpful for debuging but must be done for store, load, and load_return
			union 
			{
				virtual_address  vaddr;
				physical_address paddr;
			};

			//Data free for the destination unit to use to convey additional information about the load.
			union 
			{
				uint8_t  u8[4];  int8_t  s8[4];
				uint16_t u16[2]; int16_t s16[2];
				uint32_t u32;    int32_t s32;
			} 
			dst_unit_data;
			uint16_t size;

			//Used to store which of the units the load came from
			uint16_t dst_stack_index;
			uint16_t dst_stack[5];
		} 
		load;

		//Payload for `LOAD_RETURN`.  Note similar layout to `.load`, so that the DRAM doesn't
		//	need to do very much to convert it to a `.load_return` (these fields have the same
		//	meanings as in `.load`; refer to that).
		struct
		{
			union
			{
				virtual_address  vaddr;
				physical_address paddr;
			};

			//Data free for the destination unit to use to convey additional information about the load.
			union 
			{
				uint8_t  u8[4];  int8_t  s8[4];
				uint16_t u16[2]; int16_t s16[2];
				uint32_t u32;    int32_t s32;
			} 
			dst_unit_data;
			uint16_t size;

			uint16_t dst_stack_index;
			uint16_t dst_stack[5];

			//Data returned by load. TODO: maybe just pass a pointer to memory for preformance reasons or just directly read in the core
			union 
			{
				uint8_t  u8 [64];  int8_t  s8[64];
				uint16_t u16[32]; int16_t s16[32];
				uint32_t u32[16]; int32_t s32[16];
				uint64_t u64[ 8]; int64_t s64[ 8];
			} 
			data;
		} 
		load_return;

		//Payload for `STORE_[width]` types.  Again, note similar layout to `.load`.
		struct 
		{
			union 
			{
				virtual_address  vaddr;
				physical_address paddr;
			};

			uint16_t prev_id;
			uint16_t pad;
			uint16_t size;

			union 
			{
				uint8_t   u8[8];  int8_t  s8[8];
				uint16_t u16[4]; int16_t s16[4];
				uint32_t u32[2]; int32_t s32[2];
				uint64_t u64[1]; int64_t s64[1];
			} 
			data;
		} 
		store;

		//Payload for instruction-related work items, such as `NEXT_INSTR`.
		struct 
		{
			uint64_t instr_vaddr;
			uint32_t instruction;
			uint16_t thread_id;
			uint16_t core_id;
		} 
		instr;

		struct 
		{
			uint8_t dst_reg;
			uint8_t dst_reg_file;
			uint16_t thread_id;
		} 
		write_back;

		struct
		{
			uint8_t port;
		} 
		port_status;
	};
};

}
