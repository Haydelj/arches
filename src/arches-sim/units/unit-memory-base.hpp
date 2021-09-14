#pragma once

#include "../stdafx.hpp"
#include "../work-item.hpp"

#include "unit-base.hpp"

namespace Arches { namespace Units {
	
	class UnitMemoryBase : public UnitBase 
	{
		public:
			uint16_t id;

		protected:
			struct _ClientData
			{
				UnitBase* unit      {nullptr};
				WorkItem  work_item {};
				//bool      pending   {false};
			};

			_ClientData* _mem_lowers; //Units below us in the memory hierarchy (probably another cache, a core, or an MMU).
			bool* _mem_lower_pending;
			UnitBase* _mem_higher;//Unit above us in the memory hierarchy (probably another cache or DRAM).
			uint16_t _num_clients;

			uint16_t _num_clients_skipped{0};
			uint16_t _num_clients_pending{0};

			uint16_t _start_client_id{0};
			uint16_t _current_client_id{0};
			uint16_t _previous_client_id{0};

		protected:
			void send_load_return_to_mem_lower(WorkItem work_item, cycles in_future) const
			{
				uint16_t lower_id = work_item.load_return.dst_stack[work_item.load_return.dst_stack_index];
				--work_item.load_return.dst_stack_index;
				send_output_to(_mem_lowers[lower_id].unit, work_item, in_future);
			}

			void send_load_to_mem_higher(WorkItem work_item, cycles in_future) const
			{
				++work_item.load.dst_stack_index;
				assert(work_item.load.dst_stack_index < 5);//cant have more than 5 levels of memory right now. This can be expanded later
				work_item.load.dst_stack[work_item.load.dst_stack_index] = id;
				send_output_to(_mem_higher, work_item, in_future);
			}

			void send_store_to_mem_higher(WorkItem work_item, cycles in_future) const
			{
				work_item.store.prev_id = this->id;
				send_output_to(_mem_higher, work_item, in_future);
			}

			void send_load_to_pending(const WorkItem& work_item)
			{
				uint16_t id = work_item.load.dst_stack[work_item.load.dst_stack_index];
				_mem_lowers[id].work_item = work_item;
				_mem_lower_pending[id] = true;
				++_num_clients_pending;
			}

			void send_store_to_pending(const WorkItem& work_item)
			{
				uint16_t id = work_item.store.prev_id;
				assert(_mem_lower_pending[id] == false);
				_mem_lowers[id].work_item = work_item;
				_mem_lower_pending[id] = true;
				++_num_clients_pending;

			}

			_ClientData* get_next_pending()
			{
				do
				{
					if (_num_clients_pending == _num_clients_skipped) return nullptr;
					if (_mem_lower_pending[_current_client_id])
					{
						_previous_client_id = _current_client_id;
						_current_client_id = (_current_client_id + 1) % _num_clients;
						++_num_clients_skipped; //skip unless we remove it form the pending list
						return &_mem_lowers[_previous_client_id];
					}
					_current_client_id = (_current_client_id + 1) % _num_clients;
				} while (_current_client_id != _start_client_id);

				return nullptr;
			}

			void remove_last_from_pending()
			{
				WorkItem item;
				item.type = WorkItem::TYPE::REQUEST_ACCEPTED;
				send_output_to(_mem_lowers[_previous_client_id].unit, item, 1);
				_mem_lower_pending[_previous_client_id] = false;

				--_num_clients_pending;
				--_num_clients_skipped;
			}

			void reset_pending()
			{
				_start_client_id = _current_client_id;
				_num_clients_skipped = 0;
			}

			bool has_pending() const { return _num_clients_pending > 0; }

		public:
			explicit UnitMemoryBase(Simulator* simulator, uint16_t num_clients, uint16_t id) : UnitBase(simulator)
			{
				_num_clients = num_clients;
				this->id = id;
				_mem_higher = nullptr;
				_mem_lowers = _new _ClientData[num_clients];
				_mem_lower_pending = _new bool[num_clients] {false};
			}

			virtual ~UnitMemoryBase() override
			{
				delete[] _mem_lowers;
				delete[] _mem_lower_pending;
			}

			void add_mem_lower(UnitBase* mem_lower, uint16_t id) 
			{
				assert(id < _num_clients);
				_mem_lowers[id].unit = mem_lower;
				add_output_to(mem_lower, 4);//todo change this to the number of messages that can be sent downstream in one cycle
			}

			void add_mem_lower(UnitMemoryBase* mem_lower)
			{
				add_mem_lower(mem_lower, mem_lower->id);
			}

			void add_mem_lower(UnitBase* mem_lower, uint16_t id, uint connection_width)
			{
				assert(id < _num_clients);
				_mem_lowers[id].unit = mem_lower;
				add_output_to(mem_lower, connection_width);//todo change this to the number of messages that can be sent downstream in one cycle
			}

			void set_mem_higher(UnitBase* mem_higher)
			{
				assert(_mem_higher == nullptr);
				_mem_higher = mem_higher;
				add_output_to(mem_higher, 1);//todo change this to the nubmer of messages that can be sent upstrem in one cycle
			}
	};


}}
