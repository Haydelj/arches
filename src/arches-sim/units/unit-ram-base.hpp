#pragma once

#include "../stdafx.hpp"

#include "../elf.hpp"

#include "unit-memory-base.hpp"
#include "unit-base.hpp"

namespace Arches { namespace Units {


		class UnitRAMBase : public UnitMemoryBase {
		public:
			size_t size_bytes;

		public: //TODO: `private`
			union {
				uint8_t* _data_u8;
				uint16_t* _data_u16;
				uint32_t* _data_u32;
				uint64_t* _data_u64;
			};

		private:
			physical_address _end_of_heap;

		public:
			UnitRAMBase(Simulator* simulator, uint16_t num_clients, size_t size_bytes) : UnitMemoryBase(simulator, num_clients, 0), size_bytes(size_bytes)
			{
				_data_u64 = _new uint64_t[(size_bytes + 7ull) / 8ull];
			}

			virtual ~UnitRAMBase()
			{
				delete[] _data_u64;
			}

			void clear() 
			{
				memset(_data_u8, 0x00, size_bytes);
			}

			void direct_read(uint8_t* data, size_t size, physical_address paddr) const 
			{
				memcpy(data, _data_u8 + paddr, size);
			}

			void direct_read(std::vector<uint8_t>& data, size_t size, physical_address paddr) const 
			{
				data.resize(size);
				memcpy(data.data(), _data_u8 + paddr, size);
			}

			void direct_write(uint8_t        data, physical_address paddr) 
			{
				_data_u8[paddr] = data;
			}

			void direct_write(uint8_t const* data, size_t size, physical_address paddr) 
			{
				memcpy(_data_u8 + paddr, data, size);
			}

			void direct_write(std::vector<uint8_t> const& data, physical_address paddr) 
			{
				memcpy(_data_u8 + paddr, data.data(), data.size());
			}

			//return the physical address of the entry point
			physical_address load_buffer(std::vector<uint8_t> const& data)
			{
				direct_write(data, _end_of_heap);
				_end_of_heap += data.size();
			}

			//return the physical address of the entry point
			physical_address load_elf(ELF& elf)
			{
				for (ELF::LoadableSegment const* seg : elf.segments) 
				{
					direct_write(seg->data, seg->vaddr);
					_end_of_heap = seg->vaddr + seg->data.size();
				}
			}

			template<typename T>
			T direct_read(physical_address paddr)
			{
				return *reinterpret_cast<T*>(_data_u8 + paddr);
			}

			void dump_as_ppm(physical_address from_paddr, size_t width, size_t height, std::string const& path)
			{
				assert(from_paddr + width * height * 3 <= size_bytes);

				uint8_t const* src = _data_u8 + from_paddr;

				FILE* file = fopen(path.c_str(), "wb");
				fprintf(file, "P6\n%zu %zu\n255\n", width, height);
				for (size_t j = 0; j < height; ++j)
					for (size_t i = 0; i < width; ++i) 
					{
						size_t index = j * width + i;
						uint8_t rgb[3]; memcpy(rgb, src + 4 * index, 3 * sizeof(uint8_t));
						fwrite(rgb, sizeof(uint8_t), 3, file);
					}
				fclose(file);
			}

			void _print_data(uint8_t* data, int size) const
			{
				for (int i = 0; i < size; i++)
					printf("%d ", data[i]);
				printf("\n");
			}
		};


}}