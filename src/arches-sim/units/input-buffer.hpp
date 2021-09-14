#pragma once

#include "../stdafx.hpp"

#include "../work-item.hpp"


namespace Arches { namespace Units {


class UnitBase;


class InputBuffer final {
	public:
		UnitBase*const unit;

		class ArbitratorBase {
			protected:
				ArbitratorBase() = default;
			public:
				virtual ~ArbitratorBase() = default;

				virtual WorkItem* get_next(InputBuffer*const buffer) = 0;
		};
		class ArbitratorLowestIndex final : public ArbitratorBase {
			public:
				ArbitratorLowestIndex() = default;
				virtual ~ArbitratorLowestIndex() = default;

				virtual WorkItem* get_next(InputBuffer*const buffer) override 
				{
					assert(false);
					return nullptr;
					/*
					if (buffer->is_empty()) return nullptr;
					return buffer->_pop_from();
					*/
					/*
					for (struct _ConnDescr& conn_descr : buffer->_incoming_connections) {
						if (conn_descr.size>0) return buffer->_pop_from(conn_descr);
					}
					return nullptr;
					*/
				}
		};
		class ArbitratorRoundRobin final : public ArbitratorBase {
			private:
				size_t _next_index;

			public:
				ArbitratorRoundRobin() : ArbitratorBase(), _next_index(0) {}
				virtual ~ArbitratorRoundRobin() = default;

				virtual WorkItem* get_next(InputBuffer*const buffer) override {
					assert(false);
					return nullptr;

					//if (buffer->is_empty()) return nullptr;
					//return buffer->_pop_from();
					/*
					size_t next_index_orig = _next_index;
					do {
						struct _ConnDescr& conn_descr = buffer->_incoming_connections[_next_index];
						_next_index = (_next_index+1) % buffer->_incoming_connections.size();
						if (conn_descr.size>0) return buffer->_pop_from(conn_descr);
					} while (_next_index!=next_index_orig);
					return nullptr;
					*/
				}
		};

	private:
		//Flattened buffer storing the backing for a series of ring buffers: one for each incoming
		//	connection.

		WorkItem* _items_backing;
		
		struct _ConnDescr final 
		{
			size_t start_index_in_backing;
			size_t offset;
			size_t size;
			size_t max_size;
		};
		std::vector<struct _ConnDescr> _incoming_connections;
		
		size_t max_size{0};
		size_t _current_conn_descr{0};
		std::atomic_size_t offset{0};

	public:
		explicit InputBuffer(UnitBase* unit);
		InputBuffer(InputBuffer const& other);
		~InputBuffer();

		size_t add_connection(size_t max_size);
		void finalize();

	private:
		WorkItem* _pop_from(struct _ConnDescr& conn_descr) 
		{
			
			assert(conn_descr.size > 0);
			WorkItem* item = _items_backing + conn_descr.start_index_in_backing + conn_descr.offset;
			conn_descr.offset = (conn_descr.offset + 1) % conn_descr.max_size;
			--conn_descr.size;
			return item;
			
			//return &_items_backing[--offset];
		}

	public:

		
		bool is_empty()
		{
			//assert(false);
			return false;
		}

		WorkItem* get_next_work_item() 
		{
			for(;_current_conn_descr < _incoming_connections.size(); ++_current_conn_descr)
			{
				if(_incoming_connections[_current_conn_descr].size == 0) continue;
				return _pop_from(_incoming_connections[_current_conn_descr]);
			}

			_current_conn_descr = 0;
			return nullptr;
		}
		
		bool add_work_item_from(size_t conn_index, WorkItem const& item) 
		{
			struct _ConnDescr& conn_descr = _incoming_connections[conn_index];
			
			#if 1
			if (!(conn_descr.size < conn_descr.max_size))
			{
				for (uint i = 0; i < conn_descr.max_size; ++i)
					std::cout << "Existing: " << static_cast<int>(_items_backing[i].type) << "\n";

				std::cout << "Insert: " << static_cast<int>(item.type) << "\n";
				assert(false);
			}
			#endif		
			
			assert(conn_descr.size < conn_descr.max_size);
			_items_backing[conn_descr.start_index_in_backing + (conn_descr.offset + (conn_descr.size++)) % conn_descr.max_size] = item;
			return true;

			/*
			size_t index = offset.fetch_add(1);
			assert(index < max_size);
			_items_backing[index] = item;
			return true;
			*/
		}
};


}}
