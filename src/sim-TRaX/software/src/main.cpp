#include "stdafx.hpp"

#include "pixel-programs.hpp"

#ifdef ARCH_RISCV
int main()
{
	StartupData& start_data = *reinterpret_cast<StartupData*>(STARTUP_DATA_ADDRESS);
	Mesh mesh(start_data.vertex_indices, start_data.normal_indices, start_data.vertices, start_data.normals);
	MeshBVH bvh(&mesh, start_data.nodes);

	uint index;
	while((index = atomicinc()) < start_data.framebuffer_size)
	{
		rtm::vec3 output = path_tracer(index, bvh, start_data);
		//rtm::vec3 output = mandelbrot(index, start_data);
		write_to_framebuffer_address(start_data.framebuffer_address, index, output);
	}

	return 0;
}
#endif

#ifdef ARCH_X86
void thread_work(StartupData start_data, MeshBVH bvh)
{
	uint index;
	while((index = atomicinc()) < start_data.framebuffer_size)
	{
		rtm::vec3 output = path_tracer(index, bvh, start_data);
		//rtm::vec3 output = mandelbrot(index, start_data);
		write_to_framebuffer_address(start_data.framebuffer_address, index, output);
	}
}

int main()
{
	StartupData start_data;

	uint32_t framebuffer_address[1024*1024];
	start_data.framebuffer_width = 1024;
	start_data.framebuffer_height = 1024;
	start_data.framebuffer_size = start_data.framebuffer_width * start_data.framebuffer_height;
	start_data.framebuffer_address = framebuffer_address;

	start_data.samples_per_pixel = 16;
	start_data.max_path_depth = 4;

	//start_data.camera = Camera(start_data.framebuffer_width, start_data.framebuffer_height, 60.0f, rtm::vec3(0.0f, 0.0f, 2.0f), rtm::vec3(0.0, 0.0, 0.0));
	start_data.camera = Camera(start_data.framebuffer_width, start_data.framebuffer_height, 90.0f, rtm::vec3(-900.6, 150.8, 120.74), rtm::vec3(79.7, 14.0, -17.4));
	start_data.light_dir = rtm::vec3(4.5, 42.5, 5.0);

	Mesh mesh("./res/sponza.obj");
	MeshBVH bvh(&mesh);
	bvh.build();

	atomicinc_i = 0u;
	std::vector<std::thread*> threads(std::thread::hardware_concurrency(), nullptr);

	auto start = std::chrono::high_resolution_clock::now();

	for(auto& thread : threads)
		thread = new std::thread(thread_work, start_data, bvh);

	for(std::thread* thread : threads)
	{
		thread->join();
		delete thread;
	}

	auto stop = std::chrono::high_resolution_clock::now();
	auto duration = std::chrono::duration_cast<std::chrono::milliseconds>(stop - start);
	std::cout << "Runtime: " << duration.count() << " ms\n\n";

	dump_framebuffer_address(start_data.framebuffer_address, "./out.ppm", start_data.framebuffer_width, start_data.framebuffer_height);

	return 0;
}
#endif
