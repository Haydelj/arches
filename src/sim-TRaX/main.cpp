#include <arches-sim/include.hpp>
#include <iostream>

#include "units/unit-thread-proccesor.hpp"
#include "units/unit-shared-functional.hpp"

#include "software/src/ray-tracing-include.hpp"

//global verbosity flag
int arches_verbosity = 1;

uint num_threads = 6;

uint NUM_TMs = 32;
uint NUM_L2s = 4;
uint NUM_TPs = 32;

uint frame_buffer_width = 32;
uint frame_buffer_height = frame_buffer_width;

template <typename T>
std::vector<uint8_t> convert_vector(const std::vector<T>& in)
{
	size_t size = in.size() * sizeof(T);
	std::vector<uint8_t> out(size);
	std::memcpy(out.data(), in.data(), size);
	return out;
}

template <typename T>
std::vector<uint8_t> convert_array(T* data, uint elements)
{
	size_t size = elements * sizeof(T);
	std::vector<uint8_t> out(size);
	std::memcpy(out.data(), data, size);
	return out;
}

template <typename T>
std::vector<uint8_t> convert_class(T data)
{
	size_t size = sizeof(T);
	std::vector<uint8_t> out(size);
	std::memcpy(out.data(), &data, size);
	return out;
}

StartupData initilize_startup_data(Arches::Units::UnitMMU<GLOBAL_PAGE_SIZE>* mmu)
{
	StartupData startup_data;
	startup_data.framebuffer_width = frame_buffer_width;
	startup_data.framebuffer_height = frame_buffer_height;
	startup_data.framebuffer_size = startup_data.framebuffer_width * startup_data.framebuffer_height;
	startup_data.framebuffer_address = reinterpret_cast<uint32_t*>(mmu->load_buffer(std::vector<uint8_t>(startup_data.framebuffer_size * sizeof(uint32_t))));

	startup_data.samples_per_pixel = 1;
	startup_data.max_path_depth = 1;

	//rt_data.camera = Camera(rt_data.frame_buffer_width, rt_data.frame_buffer_height, 10.0f, rtm::vec3(-10.56f, 3.28f, 1.674), rtm::vec3(7.97f, 1.4f, -1.74f));
	startup_data.camera = Camera(startup_data.framebuffer_width, startup_data.framebuffer_height, 90.0f, rtm::vec3(-900.6, 150.8, 120.74), rtm::vec3(79.7, 14.0, -17.4));
	startup_data.light_dir = rtm::vec3(4.5, 42.5, 5.0);


	Mesh mesh("src/sim-TRaX/software/res/sponza.obj");
	MeshBVH bvh(&mesh);
	bvh.build();

	startup_data.vertex_indices = reinterpret_cast<rtm::uvec3*>(mmu->load_buffer(convert_vector(mesh.vertex_indices)));
	startup_data.normal_indices = reinterpret_cast<rtm::uvec3*>(mmu->load_buffer(convert_vector(mesh.normal_indices)));
	startup_data.vertices = reinterpret_cast<rtm::vec3*>(mmu->load_buffer(convert_vector(mesh.vertices)));
	startup_data.normals = reinterpret_cast<rtm::vec3*>(mmu->load_buffer(convert_vector(mesh.normals)));
	startup_data.nodes = reinterpret_cast<MeshBVH::Node*>(mmu->load_buffer(convert_vector(bvh.nodes), sizeof(MeshBVH::Node)));
	
	mmu->load_raw(convert_class(startup_data), STARTUP_DATA_ADDRESS);
	return startup_data;
}

int main(int /*argc*/, char* /*argv*/[]) 
{
	#ifdef BUILD_PLATFORM_WINDOWS
	_CrtSetDbgFlag(_CRTDBG_ALLOC_MEM_DF | _CRTDBG_LEAK_CHECK_DF);
	#endif

	{
		using namespace Arches;

		Simulator simulator;
		ELF elf("src/sim-TRaX/software/bin/riscv/trax"); //trax
#if 1
		//real TRaX
		Units::UnitCache::CacheConfiguration l2_config;
		l2_config.cache_size = 512 * 1024;
		l2_config.line_size = 32;
		l2_config.associativity = 1;
		l2_config.num_banks = 16;
		l2_config.num_ports = 16;
		l2_config.bank_stride = 1;
		l2_config.penalty = 3;

		Units::UnitCache::CacheConfiguration l1_config;
		l1_config.cache_size = 32 * 1024;
		l1_config.line_size = 32;
		l1_config.associativity = 1;
		l1_config.num_banks = 8;
		l1_config.num_ports = 8;
		l1_config.bank_stride = 1;
		l1_config.penalty = 1;

		std::vector<TRaX::UnitThreadProccesor*> uint_tps;
		std::vector<Units::UnitCache*> unit_l1s;
		std::vector<Units::UnitCache*> unit_l2s;

		Units::UnitDRAM* unit_main_memory = _new Units::UnitDRAM(&simulator, NUM_L2s, 1 * 1024 * 1024 * 1024);
		//Units::UnitSRAM* unit_main_memory = _new Units::UnitSRAM(&simulator, 300, NUM_L2s, 1 * 1024 * 1024 * 1024);
		unit_main_memory->clear();

		Units::UnitMMU<GLOBAL_PAGE_SIZE>* refrence_mmu = _new Units::UnitMMU<GLOBAL_PAGE_SIZE>(&simulator);
		refrence_mmu->set_mem(unit_main_memory);
		refrence_mmu->load_pagetables(0);
		refrence_mmu->load_elf(&elf);
		StartupData startup_data = initilize_startup_data(refrence_mmu);

		virtual_address  vaddr_framebuffer = reinterpret_cast<virtual_address>(startup_data.framebuffer_address);
		physical_address paddr_framebuffer = refrence_mmu->translate_allocate_as_necessary(vaddr_framebuffer);

		uint num_tps = 0;

		for (uint k = 0; k < NUM_L2s; ++k)//TMs
		{
			//Units::UnitPassthroughCache* unit_L2 = _new Units::UnitPassthroughCache(&simulator, NUM_TMs, 0);
			Units::UnitCache* unit_l2 = _new Units::UnitCache(&simulator, l2_config, NUM_TMs / NUM_L2s, k);
			unit_l2s.push_back(unit_l2);
			unit_main_memory->add_mem_lower(unit_l2, unit_l2->id, 8);
			unit_l2->set_mem_higher(unit_main_memory);

			for (uint i = 0; i < NUM_TMs / NUM_L2s; ++i)//TMs
			{
				//Units::UnitPassthroughCache* unit_L1 = new Units::UnitPassthroughCache(&simulator, NUM_TPs, i);
				Units::UnitCache* unit_l1 = _new Units::UnitCache(&simulator, l1_config, NUM_TPs, i);
				unit_l1s.push_back(unit_l1);
				unit_l2->add_mem_lower(unit_l1);
				unit_l1->set_mem_higher(unit_l2);
				//unit_dram->add_mem_lower(unit_L1);
				//unit_L1->set_mem_higher(unit_dram);

				//TRaX::UnitSharedFunctional* int_mul = _new TRaX::UnitSharedFunctional(&simulator, NUM_TPs, NUM_TPs / 8, 2);//2, /8
				//TRaX::UnitSharedFunctional* float_mul = _new TRaX::UnitSharedFunctional(&simulator, NUM_TPs, NUM_TPs / 8, 3);//3, /8
				//TRaX::UnitSharedFunctional* float_sqrt = _new TRaX::UnitSharedFunctional(&simulator, NUM_TPs, NUM_TPs / 16, 15);//15, /16

				TRaX::UnitSharedFunctional* int_mul = _new TRaX::UnitSharedFunctional(&simulator, NUM_TPs, 2, 1);//2, /8
				TRaX::UnitSharedFunctional* float_add = _new TRaX::UnitSharedFunctional(&simulator, NUM_TPs, 8, 2);//3, /8
				TRaX::UnitSharedFunctional* float_mul = _new TRaX::UnitSharedFunctional(&simulator, NUM_TPs, 8, 2);//3, /8
				TRaX::UnitSharedFunctional* float_sqrt = _new TRaX::UnitSharedFunctional(&simulator, NUM_TPs, 1, 20);//15, /16

				for (uint j = 0; j < NUM_TPs; ++j)//TPs
				{
					//TODO make mmu a shared memory unit for now we just use the core id
					Units::UnitMMU<GLOBAL_PAGE_SIZE>* unit_mmu = _new Units::UnitMMU<GLOBAL_PAGE_SIZE>(refrence_mmu, &simulator);
					unit_l1->add_mem_lower(unit_mmu, j);
					unit_mmu->set_mem_higher(unit_l1);
					unit_mmu->set_mem(unit_main_memory);
					//unit_mmu->map_new_stack();

					TRaX::UnitThreadProccesor* unit_tp = _new TRaX::UnitThreadProccesor(&simulator, int_mul, float_add, float_mul, float_sqrt, j);
					uint_tps.push_back(unit_tp);
					unit_mmu->add_mem_lower(unit_tp);
					unit_tp->set_mem_higher(unit_mmu);

					//TODO load instructions like normal data
					unit_tp->cheat_ram = unit_main_memory;
					unit_tp->pc = elf.elf_header->e_entry.u64;
					//unit_tp->int_regs->gp.u64 = elf.segments[1]->vaddr;

					if (i == 0 && j == 0) unit_tp->print = true;
				}
			}
		}
#else
		//single TP TRaX
		Units::UnitDRAM* unit_dram = _new Units::UnitDRAM(&simulator, 1, 1024 * 1024 * 256); unit_dram->clear();
		Units::UnitMMU<4 * 1024 * 1024>* unit_mmu = _new Units::UnitMMU<4 * 1024 * 1024>(&simulator);
		TRaX::UnitSharedFunctional* int_mul = _new TRaX::UnitSharedFunctional(&simulator, 1, 1, 2);//2
		TRaX::UnitSharedFunctional* float_mul = _new TRaX::UnitSharedFunctional(&simulator, 1, 1, 3);//3
		TRaX::UnitSharedFunctional* float_sqrt = _new TRaX::UnitSharedFunctional(&simulator, 1, 1, 15);//15
		TRaX::UnitThreadProccesor* unit_tp = _new TRaX::UnitThreadProccesor(&simulator, int_mul, float_mul, float_sqrt, 0);

		unit_dram->add_mem_lower(unit_mmu, 0);

		unit_mmu->set_mem_higher(unit_dram);
		unit_mmu->add_mem_lower(unit_tp);
		unit_mmu->set_mem(unit_dram);
		unit_mmu->load_pagetables(64);
		unit_mmu->load_elf(&elf);
		paddr_framebuffer = unit_mmu->translate_allocate_as_necessary(vaddr_framebuffer);

		unit_tp->mem_higher = unit_mmu;
		unit_tp->add_output_to(unit_mmu, 1);
		unit_tp->cheat_dram = unit_dram;//TODO not this
		unit_tp->int_regs->PC.u64 = elf.elf_header->e_entry.u64;
		unit_tp->int_regs->gp.u64 = elf.segments[1]->vaddr;
#endif
		simulator.finalize_architecture();

		#if 0
		printf("ENTER to start.\n");
		getchar();
		#endif

		auto start = std::chrono::high_resolution_clock::now();

		simulator.start(num_threads);
		//std::this_thread::sleep_for(std::chrono::milliseconds(20000));
		//simulator.abort();
		simulator.wait();

		auto stop = std::chrono::high_resolution_clock::now();
		auto duration = std::chrono::duration_cast<std::chrono::milliseconds>(stop - start);
		std::cout << "Runtime: " << duration.count() << " ms\n\n";

		//std::cout << "Single TP: \n";
		//uint_tps[0]->get_log()->print();

		std::cout << "\nAll TP: \n";
		TRaX::UnitThreadProccesor::Logger tp_log;
		for (TRaX::UnitThreadProccesor* tp : uint_tps)
			tp_log.accumulate(tp->get_log());
		tp_log.print();
		std::cout << "\n";

		std::cout << "\nAll L1 Caches: \n";
		Units::UnitCache::Logger l1_log;
		for(Units::UnitCache* cache : unit_l1s)
			l1_log.accumulate(cache->get_log());
		l1_log.print();
		std::cout << "\n";

		std::cout << "\nAll L2 Caches: \n";
		Units::UnitCache::Logger l2_log;
		for(Units::UnitCache* cache : unit_l2s)
			l2_log.accumulate(cache->get_log());
		l2_log.print();
		std::cout << "\n";

		unit_main_memory->print_usimm_stats(l2_config.line_size, 4, simulator.get_current_cycle_unsafe());
		unit_main_memory->dump_as_ppm(paddr_framebuffer, frame_buffer_width, frame_buffer_height, "output.ppm");
	}

	#if 0
	printf("ENTER to exit.\n");
	getchar();
	#endif

	return 0;
}
