#pragma once

#include "../stdafx.hpp"

#include "../util/math.hpp"

#include "input-buffer.hpp"

#include "unit-base.hpp"

#define GLOBAL_PAGE_SIZE 4 * 1024 * 1024

namespace Arches {


class ELF;


namespace Units {


class UnitRAMBase;


/*
*/
template <size_t page_size>
class UnitMMU final : public UnitBase {
	//Not necessarily sensible, but . . .
	//	Note: MIPS additionally requires a size in the range 1KiB to 256MiB in multiples of 4.
	static_assert(page_size>=1&&page_size<=~uint64_t(0),"Invalid page size!");

	public:
		enum : size_t {
			PAGE_SIZE = page_size,
			BITS_PAGE_OFFSET = Util::log2_floor_constexpr(page_size),
			BITS_PAGE_NUMBER = 64 - BITS_PAGE_OFFSET
		};
		static_assert((1<<BITS_PAGE_OFFSET)==PAGE_SIZE,"Page size must be a power of two!");
		//static_assert(BITS_PAGE_OFFSET,"");
		static_assert(BITS_PAGE_NUMBER<=62,"Too many pages!");
		static_assert(BITS_PAGE_OFFSET>0&&BITS_PAGE_OFFSET<64,"Implementation error!");

	private:
		enum : virtual_address {
			MASK_PAGE_OFFSET = ~( ~virtual_address(0) << BITS_PAGE_OFFSET ),
			MASK_PAGE_NUMBER =    ~virtual_address(0) << BITS_PAGE_OFFSET
		};
		static_assert(sizeof(virtual_address)==sizeof(uint64_t),"Implementation error!");

		#if 0
		class _TLB final {
			private:
				class _Entry final {
					public:
						struct {
							page_number  page_num;
							frame_number frame_num;

							bool is_valid;

							//Note: 64-bits so that we don't overflow.  `~uint64_t(0)` is invalid.
							uint64_t time_since_last_hit;
						};

					public:
						_Entry() { memset(this,0x00,sizeof(_Entry)); }
						~_Entry() = default;

						void set(page_number page_num, frame_number frame_num);
				};
				std::vector<_Entry> _entries;

			public:
				explicit _TLB(size_t num_entries) : _entries(num_entries) {
					//Note: MIPS additionally requires `<=64`.
					assert(num_entries>=1);
				}
				~_TLB() = default;

				bool lookup(page_number page_num, frame_number* frame_num_result);

				void insert(page_number page_num, frame_number frame_num);
		} _tlb;
		#endif

		std::set<frame_number> _free_frames;
		#if 0
			class _PageTableEntry final {
				public:
					page_number  page_num;
					frame_number frame_num;

					bool is_valid;
					bool has_next;
					size_t index_next;

				public:
					_PageTableEntry() = default;
					_PageTableEntry(frame_number frame_num) : frame_num(frame_num), is_valid(false) {}
					~_PageTableEntry() = default;
			};
			std::vector<physical_address> _hash_anchor_table;
		#else
			std::unordered_map<page_number,frame_number> _page_table;
		#endif

		//std::list<WorkItem> _translations_in_progress;

		//Units below us in the memory hierarchy (probably a core).
		UnitBase* _mem_lower;
		//Unit above us in the memory hierarchy (probably a cache or DRAM).
		UnitBase* _mem_higher;
		//Memory unit.  Used for initialization of the page table data structure.
		UnitRAMBase* _mem;

		virtual_address _end_of_heap;

		InputBuffer::ArbitratorLowestIndex _arbitrator;
		//InputBuffer::ArbitratorRoundRobin _arbitrator;

	public:
		explicit UnitMMU(Simulator* simulator);
		explicit UnitMMU(UnitMMU* other, Simulator* simulator);
		virtual ~UnitMMU() override = default;

	private:
		frame_number _allocate_as_necessary(page_number page_num);

	public:
		void load_pagetables(size_t num_entries_hash_anchor_table);
		void load_raw(std::vector<uint8_t> const& data, virtual_address vaddr);
		void load_elf(ELF const* elf);
		virtual_address load_buffer(std::vector<uint8_t> const& data, uint alignment = 8);
		void map_new_stack();


		void set_mem(UnitRAMBase* mem);
		void set_mem_higher(UnitBase* mem_higher);
		void add_mem_lower(UnitBase* mem_lower);

		//TODO: `translate_allocate_as_necessary(...)` should be `private`; no need to expose the
		//	functionality of address-translation.
		physical_address translate_allocate_as_necessary(virtual_address vaddr);
		virtual void process(InputBuffer* buffer, cycles current_cycle) override;
};


}}
