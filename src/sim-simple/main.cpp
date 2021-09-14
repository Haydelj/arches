#include <arches-sim/include.hpp>
#include <iostream>

//global verbosity flag
int arches_verbosity = 1;

int main(int /*argc*/, char* /*argv*/[]) {
	
	#ifdef BUILD_PLATFORM_WINDOWS
	_CrtSetDbgFlag(_CRTDBG_ALLOC_MEM_DF | _CRTDBG_LEAK_CHECK_DF);
	#endif

	{
		using namespace Arches;

		//construct units
		Simulator simulator;

		Units::UnitDRAM* unit_dram = new Units::UnitDRAM(&simulator, 1, 1024 * 1024 * 256);
		Units::UnitCacheSimple* unit_cache = new Units::UnitCacheSimple(&simulator, 3, 6, 5, 1, 1, 1, 1, 0);
		//Units::UnitCacheSimple* unit_cache2 = new Units::UnitCacheSimple(&simulator, 4, 32, 1024, 1);
		Units::UnitMMU<4 * 1024 * 1024>* unit_mmu = new Units::UnitMMU<4 * 1024 * 1024>(&simulator);

		Units::RISCV::IntegerRegisterFile			int_regs;
		Units::RISCV::FloatingPointRegisterFile		float_regs;
		Units::RISCV::UnitCoreSimple* unit_proc = new Units::RISCV::UnitCoreSimple(&simulator, &int_regs, &float_regs);

		//ELF elf("src/test-programs/RISC-V/cache"); virtual_address vaddr_framebuffer = 0x11dd0ull;
		//ELF elf("src/test-programs/RISC-V/simple-float"); virtual_address vaddr_framebuffer = 0x11dd0ull; //simple-float
		//ELF elf("src/test-programs/RISC-V/checkerboard"); virtual_address vaddr_framebuffer = 0x11dd8ull; //checkerboard
		//ELF elf("src/test-programs/RISC-V/gradient"); virtual_address vaddr_framebuffer = 0x11e20ull; //gradient
		// Exhibits high spatial reuse, low temporal reuse. 
		ELF elf("src/test-programs/RISC-V/gradient_cache"); virtual_address vaddr_framebuffer = 0x51e50ull; //gradient_cache

		physical_address paddr_framebuffer;


		//initilize simulation
		{
			unit_proc->add_output_to(unit_mmu, 1);
			unit_proc->mem_higher = unit_mmu;
			unit_proc->_cheat_dram = unit_dram;//TODO read correctly form memory
			unit_proc->int_regs->pc.u64 = elf.elf_header->e_entry.u64;
			unit_proc->int_regs->gp.u64 = elf.segments[1]->vaddr;

			unit_mmu->set_mem_higher(unit_cache);
			unit_mmu->add_mem_lower(unit_proc);

			unit_mmu->set_mem(unit_dram);
			unit_mmu->load_pagetables(64);
			unit_mmu->load_elf(&elf);
			paddr_framebuffer = unit_mmu->translate_allocate_as_necessary(vaddr_framebuffer);

			unit_cache->add_mem_lower(unit_mmu, 0);
			unit_cache->set_mem_higher(unit_dram);

			unit_dram->add_mem_lower(unit_cache);

			simulator.finalize_architecture();
		}


		//run simulation
		{
			auto start = std::chrono::high_resolution_clock::now();

			simulator.start(1);
			simulator.wait();

			auto stop = std::chrono::high_resolution_clock::now();
			auto duration = std::chrono::duration_cast<std::chrono::milliseconds>(stop - start);
			std::cout << "Runtime: " << duration.count() << " ms\n";
		}


		//logging
		{
			if(arches_verbosity) unit_dram->print_usimm_stats(32, 4, unit_dram->get_current_cycle());
			printf("L1 Cache misses: %d\nL1 Cache hits: %d\n", unit_cache->log.misses, unit_cache->log.hits);
			//printf("L2 Cache misses: %d\nL2 Cache hits: %d\n", unit_cache2->log.misses, unit_cache->log.hits);
		}


		//output
		{
			unit_dram->dump_as_ppm(paddr_framebuffer, 256, 256, "output.ppm");
			//std::vector<uint8_t> data;
			//unit_dram->direct_read(data, 4*4*4, paddr_framebuffer);
			//for (auto& i : data) printf("%x\n", i);
		}
	}

	#if 1
	printf("ENTER to exit.\n");
	getchar();
#endif

	return 0;
}
