#include "unit-mmu.hpp"

#include "../elf.hpp"

#include "unit-ram-base.hpp"


namespace Arches { namespace Units {


#if 0
template <size_t page_size>
void UnitMMU<page_size>::_TLB::_Entry::set(page_number page_num, frame_number frame_num) {
	this->page_num  = page_num;
	this->frame_num = frame_num;

	is_valid = true;

	time_since_last_hit = 0u;
}

template <size_t page_size>
bool UnitMMU<page_size>::_TLB::_Entry::lookup(page_number page_num, frame_number* frame_num_result) {
	//Age all TLB entries.
	for (_Entry& entry : _entries) {
		++entry.time_since_last_hit;
	}

	//Attempt to find entry matching `page_num`.  If found, set its age to zero and return
	//	the frame number.
	for (_Entry& entry : _entries) {
		if (entry.is_valid) {
			if (entry.page_num!=page_num);
			else {
				entry.time_since_last_hit = 0u;
				*frame_num_result = entry.frame_num;
				return true;
			}
		}
	}

	//We didn't find a matching entry.
	return false;
}

template <size_t page_size>
void UnitMMU<page_size>::_TLB::_Entry::insert(page_number page_num, frame_number frame_num) {
	uint64_t oldest_time = ~uint64_t(0);
	size_t oldest_index;
	for (size_t i=0;i<_entries.size();++i) {
		_Entry& entry = _entries[i];

		if (entry.is_valid);
		else {
			//There was an TLB entry free.  Allocate it!
			entry.set(page_num,frame_num);
			return;
		}

		if ( entry.time_since_last_hit>oldest_time || oldest_time==~uint64_t(0) ) {
			oldest_time = entry.time_since_last_hit;
			oldest_index = i;
		}
	}

	//All TLB entries are used.  Insert over the oldest one.
	assert(oldest_time!=~size_t(0));
	_entries[oldest_index].set(page_num,frame_num);
}
#endif


template <size_t page_size>
UnitMMU<page_size>::UnitMMU(Simulator* simulator) : UnitBase(simulator) {
	UnitBase::add_output_to(this,1); //Add output to ourself
	

}

template <size_t page_size>
UnitMMU<page_size>::UnitMMU(UnitMMU* other, Simulator* simulator) : UnitBase(simulator) 
{
	priority = 1;

	UnitBase::add_output_to(this, 1); //Add output to ourself

	_free_frames = other->_free_frames;
	_page_table = other->_page_table;
}

template <size_t page_size>
frame_number UnitMMU<page_size>::_allocate_as_necessary(page_number page_num) 
{
	auto iter = _page_table.find(page_num);
	if (iter!=_page_table.cend()) {
		return iter->second;
	} else {
		assert(!_free_frames.empty()); //Failure probably means you haven't allocated enough DRAM.

		auto alloced_frame = _free_frames.cbegin();
		frame_number frame_num = *alloced_frame;
		_free_frames.erase(alloced_frame);

		_page_table.insert({page_num,frame_num});

		return frame_num;
	}
}
template <size_t page_size>
void UnitMMU<page_size>::load_pagetables(size_t num_entries_hash_anchor_table) 
{
	size_t num_frames = _mem->size_bytes / PAGE_SIZE;

	//std::cout << "stack_frame: " << stack_frame << "\n";

	for (size_t i = num_frames/2; i < num_frames; ++i)
		_free_frames.insert(i);

	#if 0
		_hash_anchor_table.resize(num_entries_hash_anchor_table);
		for (size_t i=0;i<num_frames;++i) {
			_hash_anchor_table[i%num_entries_hash_anchor_table].push_back(_PageTableEntry(i));
		}
	#endif
}
template <size_t page_size>
void UnitMMU<page_size>::load_raw(std::vector<uint8_t> const& data, virtual_address vaddr) {
	page_number page_num_range[2] = {
		( vaddr             &MASK_PAGE_NUMBER) >> BITS_PAGE_OFFSET,
		((vaddr+data.size())&MASK_PAGE_NUMBER) >> BITS_PAGE_OFFSET
	};
	assert(page_num_range[1]>=page_num_range[0]);

	for (page_number pn=page_num_range[0];pn<=page_num_range[1];++pn) {
		_allocate_as_necessary(pn);
	}

	#define IMPL 2
	#if IMPL == 0
		for (size_t i=0;i<size;++i) {
			virtual_address vaddr_i = vaddr + i;

			page_number page_num = (vaddr_i&MASK_PAGE_NUMBER) >> BITS_PAGE_OFFSET;
			uint64_t offset = vaddr_i & MASK_PAGE_OFFSET;

			frame_number frame_num = _page_table[page_num];

			physical_address paddr = (frame_num << BITS_PAGE_OFFSET) | offset;

			_mem->direct_write(data[i],paddr);
		}
	#elif IMPL == 1
		struct Write final {
			physical_address paddr_start;
			std::vector<uint8_t> data;
		};
		std::vector<struct Write> writes(page_num_range[1]-page_num_range[0]+1);
		for (size_t i=0;i<size;++i) {
			virtual_address vaddr_i = vaddr + i;
			page_number page_num = (vaddr_i&MASK_PAGE_NUMBER) >> BITS_PAGE_OFFSET;

			struct Write& write = writes[ page_num - page_num_range[0] ];
			if (!write.data.empty());
			else {
				uint64_t offset = vaddr_i & MASK_PAGE_OFFSET;

				frame_number frame_num = _page_table[page_num];

				write.paddr_start = (frame_num << BITS_PAGE_OFFSET) | offset;
			}
			write.data.push_back(data[i]);
		}
		for (Write const& write : writes) {
			_mem->direct_write(write.data,write.paddr_start);
		}
	#elif IMPL == 2
		struct PageFrame final {
			uint8_t data[PAGE_SIZE];
		};
		page_number num_pages = page_num_range[1] - page_num_range[0] + 1;
		assert(static_cast<uint64_t>(static_cast<size_t>(num_pages))==num_pages);
		std::vector<struct PageFrame> frames(static_cast<size_t>(num_pages));

		//Read existing data
		for (size_t i=0;i<frames.size();++i) {
			page_number page_num = page_num_range[0] + i;

			frame_number frame_num = _page_table[page_num];

			physical_address paddr = frame_num << BITS_PAGE_OFFSET; //Note: offset is zero.

			_mem->direct_read( frames[i].data,PAGE_SIZE, paddr );
		}

		//Add in the new segment data
		uint64_t offset = vaddr & MASK_PAGE_OFFSET;
		uint8_t* dst = reinterpret_cast<uint8_t*>(frames.data());
		memcpy(dst+offset,data.data(),data.size());

		//Write it back
		for (size_t i=0;i<frames.size();++i) {
			page_number page_num = page_num_range[0] + i;

			frame_number frame_num = _page_table[page_num];

			physical_address paddr = frame_num << BITS_PAGE_OFFSET; //Note: offset is zero.

			_mem->direct_write( frames[i].data, PAGE_SIZE, paddr );
		}
	#endif
	#undef IMPL
}

template <size_t page_size>
void UnitMMU<page_size>::load_elf(ELF const* elf) {
	for (ELF::LoadableSegment const* seg : elf->segments) {
		load_raw( seg->data, seg->vaddr );
		_end_of_heap = seg->vaddr + seg->data.size();
	}
}

static uint log2i(uint in)
{
	uint i = 0;
	while (in >>= 1) ++i;
	return i;
}

static uint64_t generate_nbit_mask(uint n)
{
	return ~(~0ull << n);
}

template <size_t page_size>
virtual_address UnitMMU<page_size>::load_buffer(std::vector<uint8_t> const& data, uint alignment)
{
	uint mask = generate_nbit_mask(log2i(alignment));
	virtual_address vaddr = _end_of_heap;
	while ((vaddr & mask) != 0) ++vaddr;

	load_raw(data, vaddr);

	_end_of_heap = vaddr + data.size();
	return vaddr;
}

template <size_t page_size>
void  UnitMMU<page_size>::map_new_stack()
{
	static size_t stack_frame = 0;
	_free_frames.insert(stack_frame++);
	translate_allocate_as_necessary(!0ull);
}


template <size_t page_size>
void UnitMMU<page_size>::set_mem(UnitRAMBase* mem)
{
	_mem = mem;
}

template <size_t page_size>
void UnitMMU<page_size>::set_mem_higher(UnitBase* mem_higher)
{
	_mem_higher = mem_higher;
	add_output_to(mem_higher, 1);
}

template <size_t page_size>
void  UnitMMU<page_size>::add_mem_lower(UnitBase* mem_lower)
{
	_mem_lower = mem_lower;
	add_output_to(mem_lower, 2);
}

template <size_t page_size>
physical_address UnitMMU<page_size>::translate_allocate_as_necessary(virtual_address vaddr) 
{
	//Extract page number and intra-page offset from virtual address.
	page_number page_num = (vaddr&MASK_PAGE_NUMBER) >> BITS_PAGE_OFFSET;
	uint64_t offset = vaddr & MASK_PAGE_OFFSET;

	//Find the frame number this maps to (possibly allocating the frame if it hasn't been touched
	//	before).
	frame_number frame_num = _allocate_as_necessary(page_num);

	//Construct the physical address
	physical_address paddr = (frame_num << BITS_PAGE_OFFSET) | offset;

	return paddr;
}
template <size_t page_size>
void UnitMMU<page_size>::process(InputBuffer* buffer, cycles current_cycle) /*override*/ {
	WorkItem* work_item;
	assert(!buffer->is_empty());
	while(work_item = buffer->get_next_work_item())
	{
		switch (work_item->type) 
		{
			#if 0
			case WorkItem::TYPE::LOAD:  //fallthrough
			case WorkItem::TYPE::STORE: //fallthrough
			{
				//Translate the address of the load or store work item.

				//	Get virtual address.  Note `work_item->load.vaddr` is the same as
				//		`work_item->store.vaddr`, so this works for either kind of work item.
				virtual_address vaddr = work_item->load.vaddr;
				static_assert(offsetof(WorkItem,load.vaddr)==offsetof(WorkItem,store.vaddr),"Implementation error!");

				//	Extract page number from virtual address
				page_number page_num = (vaddr&MASK_PAGE_NUMBER) >> BITS_PAGE_OFFSET;

				//	See if the frame number for this page number is cached in the TLB.
				frame_number frame_num;
				bool tlb_hit = tlb.lookup(page_num,&frame_num);

				if (tlb_hit) {
					//	If TLB hit, we're done; issue the work item up the memory hierarchy with a
					//	translated address.
					uint64_t offset = vaddr & MASK_PAGE_OFFSET;
					physical_address paddr = (frame_num << BITS_PAGE_OFFSET) | offset;

					//		Translate the address.  Note similarly that `work_item->load.paddr` and
					//			`work_item->store.paddr` are also in the same place.
					work_item->load.paddr = paddr;
					static_assert(offsetof(WorkItem,load.paddr)==offsetof(WorkItem,store.paddr),"Implementation error!");

					send_output_to(_mem_higher,*work_item,1);
				} else {
					//	If TLB miss, we need to look up the address translation in the page table.

					//		Hash page number (with process ID, if we had that) to get an index into
					//			the hash anchor table.
					size_t index = Util::get_hashed(page_num) % NUM_ENTRIES_HASH_ANCHOR_TABLE;

					//		Hash anchor table entry tells us the physical address where the linked-
					//			list of pages starts.
					physical_address paddr_next_pte = hash_anchor_table[index];

					//		Initiate walk of this list to find the frame number.
					_translations_in_progress.push_back(work_item);
					WorkItem walk_item;
					walk_item.type = WorkItem::TYPE::LOAD_8;
					static_assert(sizeof(PageTableEntry)==8,"Implementation error!");
					walk_item.load.paddr = paddr_next_pte;
					walk_item.load.dst_unit_type = WorkItem::UNIT_TYPE::MMU;
					walk_item.load.dst_unit_data.u64 = page_num;
					send_output_to(_mem_higher,walk_item,1);
				}
				break;
			}

			case WorkItem::TYPE::LOAD_RETURN: {
				if (work_item->load_return.dst_unit_type!=WorkItem::UNIT_TYPE::MMU) {
					//Got a normal return from the higher-level memory hierarchy.  Pass it down.
					send_output_to(_mem_lower,*work_item,1);
				} else {
					//We got a page table entry back from the memory hierarchy needed for an
					//	in-progress traversal.

					PageTableEntry entry;
					static_assert(sizeof(PageTableEntry)==8,"Implementation error!");
					memcpy(&entry,work_item->load_return.data.u64,8);

					if (entry.is_valid) {
						if (entry.page_num==page_num) {
							//The page table entry matches our desired page number.  Translate the
							//	address and then re-issue the originating work item up the memory
							//	hierarchy.
							frame_num = entry.frame_num;
							break;
						} else {
							//This page table entry does not match our page number.

							if (entry.has_next) {
								//Try again by loading the next page table entry in the linked list.

								physical_address paddr_next_pte = entry.index_next * sizeof(PageTableEntry);

								work_item->type = WorkItem::TYPE::LOAD_8;
								static_assert(sizeof(PageTableEntry)==8,"Implementation error!");
								walk_item.load.paddr = paddr_next_pte;
								walk_item.load.dst_unit_type = WorkItem::UNIT_TYPE::MMU;
								send_output_to(_mem_higher,*work_item,1);
							} else {
								//There is no next page table entry in the linked list.  Therefore,
								//	the page number is invalid.
							}
						}
					} else {
						throw TranslationFailed;
					}
				}
				break;
			}
			#endif

			case WorkItem::TYPE::LOAD:  //fallthrough
			case WorkItem::TYPE::STORE: //fallthrough
			{
				//Translate the address of the load or store work item.

				//	Get virtual address.  Note `work_item->load.vaddr` is the same as
				//		`work_item->store.vaddr`, so this works for either kind of work item.
				virtual_address vaddr = work_item->load.vaddr;
				static_assert(offsetof(WorkItem,load.vaddr)==offsetof(WorkItem,store.vaddr),"Implementation error!");

				//	Check memory operation only touches a single page.
				#ifdef BUILD_DEBUG
				{
					size_t width = static_cast<uint32_t>(work_item->type) & 0x0000FFFFu;
					page_number page_num0 = ( vaddr       &MASK_PAGE_NUMBER) >> BITS_PAGE_OFFSET;
					page_number page_num1 = ((vaddr+width-1)&MASK_PAGE_NUMBER) >> BITS_PAGE_OFFSET;

					if (page_num0 != page_num1)
					{
						std::cout << "vadder: " << vaddr << "\n";
						std::cout << "page#0: " << page_num0 << ", page#1: " << page_num1 << "\n";
					}
					assert(page_num0 == page_num1);
				}
				#endif

				//	Translate address.  TODO: this is over-simplistic!
				physical_address paddr = translate_allocate_as_necessary(vaddr);

				//	Issue the original work item up the memory hierarchy with the translated
				//		address.  Note similarly that `work_item->load.paddr` and
				//		`work_item->store.paddr` are also in the same place.
				work_item->load.paddr = paddr;
				static_assert(offsetof(WorkItem,load.paddr)==offsetof(WorkItem,store.paddr),"Implementation error!");

				send_output_to(_mem_higher, *work_item, 0);
				break;
			}

			case WorkItem::TYPE::LOAD_RETURN:
				//TODO: handle multiple mem lower
				send_output_to(_mem_lower, *work_item, 0);
				break;

			case WorkItem::TYPE::REQUEST_ACCEPTED:
				send_output_to(_mem_lower, *work_item, 0);
				break;

			nodefault;
		}
	}
}

template class UnitMMU<GLOBAL_PAGE_SIZE>;

}}
