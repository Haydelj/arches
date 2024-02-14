#include "stdafx.hpp"

#include "include.hpp"
#include "intersect.hpp"
#include "custom-instr.hpp"

inline static uint32_t encode_pixel(rtm::vec3 in)
{
	in = rtm::clamp(in, 0.0f, 1.0f);
	uint32_t out = 0u;
	out |= static_cast<uint32_t>(in.r * 255.0f + 0.5f) << 0;
	out |= static_cast<uint32_t>(in.g * 255.0f + 0.5f) << 8;
	out |= static_cast<uint32_t>(in.b * 255.0f + 0.5f) << 16;
	out |= 0xff                                        << 24;
	return out;
}

#if __riscv
//#define USE_TRACERAY
#endif

inline static void kernel(const KernelArgs& args)
{
#if 0
	for(uint index = fchthrd(); index < args.framebuffer_size; index = fchthrd())
	{
		uint32_t x = index % args.framebuffer_width;
		uint32_t y = index / args.framebuffer_width;	

		rtm::RNG rng(index);
		rtm::vec3 output(0.0f);
		
		for(uint i = 0; i < args.samples_per_pixel; ++i)
		{
			rtm::Ray ray; rtm::Hit hit; rtm::vec3 normal;

			if(args.samples_per_pixel > 1)  ray = args.camera.generate_ray_through_pixel(x, y, &rng);
			else                            ray = args.camera.generate_ray_through_pixel(x, y);
		
			rtm::vec3 attenuation(1.0f);
			for(uint j = 0; j < args.max_depth; ++j)
			{
				if(j != 0)
				{
					ray.o = ray.o + ray.d * hit.t;
					ray.d = cosine_sample_hemisphere(normal, rng);
					hit.t = ray.t_max;
					attenuation *= 0.8f;
				}

				hit.t = ray.t_max; hit.id = ~0u;
			#ifdef USE_TRACERAY
				_traceray<0x0u>(index, ray, hit);
			#else
				intersect(args.mesh, ray, hit);
			#endif
				if(hit.id != ~0u)
				{
					normal = args.mesh.tris[hit.id].normal();
					float ndotl = rtm::max(0.0f, rtm::dot(normal, args.light_dir));
					if(ndotl > 0.0f)
					{
						rtm::Ray sray = ray;
						sray.o = ray.o + ray.d * hit.t;
						sray.d = args.light_dir;
						rtm::Hit shit;
						shit.t = sray.t_max; shit.id = ~0u;
					#ifdef USE_TRACERAY
						_traceray<0x1u>(index, sray, shit);
					#else
						intersect(args.mesh, sray, shit, true);
					#endif
						if(shit.id != ~0u)
							ndotl = 0.0f;
					}
					output += attenuation * ndotl * 0.8f * rtm::vec3(1.0f, 0.9f, 0.8f);
				}
				else
				{
					output += attenuation * rtm::vec3(0.5f, 0.7f, 0.9f);
					break;
				}
			}
		}

		args.framebuffer[index] = encode_pixel(output * (1.0f / args.samples_per_pixel));
	}

#elif 0
	for(uint index = fchthrd(); index < args.framebuffer_size; index = fchthrd())
	{
		uint32_t x = index % args.framebuffer_width;
		uint32_t y = index / args.framebuffer_width;

		rtm::Ray ray = args.camera.generate_ray_through_pixel(x, y);
		rtm::Hit hit; hit.t = ray.t_max; hit.id = ~0u;
#ifdef USE_TRACERAY
		_traceray<0x0u>(index, ray, hit);
#else
		intersect(args.mesh, ray, hit);
#endif
		if(hit.id != ~0u)
		{
			args.framebuffer[index] = rtm::RNG::hash(hit.id) | 0xff000000;
		}
		else
		{
			args.framebuffer[index] = 0xff000000;
		}
	}

#else
	uint num_tiles_x = args.framebuffer_width / args.tile_width;
	uint num_tiles_y = args.framebuffer_height / args.tile_height;
	for(uint index = fchthrd(); index < args.framebuffer_size / args.tile_size; index = fchthrd())
	{
		uint32_t x = (index % num_tiles_x) * args.tile_width;
		uint32_t y = (index / num_tiles_x) * args.tile_height;

		rtm::Frustrum frustrum;
		{
			rtm::Ray ray = args.camera.generate_ray_through_pixel(x, y);
			rtm::vec3 rdx = args.camera.generate_ray_through_pixel(x + args.tile_width - 1, y).d;
			rtm::vec3 rdy = args.camera.generate_ray_through_pixel(x, y + args.tile_height - 1).d;
			frustrum.o = ray.o;
			frustrum.t_min = ray.t_min;
			frustrum.d = ray.d;
			frustrum.t_max = ray.t_max;
			frustrum.dx = rdx - ray.d;
			frustrum.dy = rdy - ray.d; 
		}

		rtm::Hit hits[16];
		for(uint i = 0; i < args.tile_size; ++i)
		{
			hits[i].t = frustrum.t_max; 
			hits[i].id = ~0u;
		}

		uint steps = 0;
		intersect(args.mesh, frustrum, args.tile_width, hits, steps);

		bool hit = rtm::intersect(args.mesh.blas[0].aabb, frustrum) < frustrum.t_max;

		for(uint i = 0; i < args.tile_size; ++i)
		{
			uint x2 = x + i % args.tile_width;
			uint y2 = y + i / args.tile_width;
			uint index2 = y2 * args.framebuffer_width + x2;
			if(hits[i].id != ~0u)
			{	
				args.framebuffer[index2] = rtm::RNG::hash(hits[i].id) | 0xff000000;
			}
			else
			{
				args.framebuffer[index2] = 0xff000000;
			}
			args.framebuffer[index2] = encode_pixel(steps / 128.0f);
		}
	}
#endif
}

#ifdef __riscv 
int main()
{
	kernel(*(const KernelArgs*)KERNEL_ARGS_ADDRESS);
	return 0;
}

#else
#define STB_IMAGE_IMPLEMENTATION
#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stbi/stb_image.h"
#include "stbi/stb_image_write.h"
int main(int argc, char* argv[])
{
	KernelArgs args;
	args.framebuffer_width = 1024;
	args.framebuffer_height = 1024;
	args.framebuffer_size = args.framebuffer_width * args.framebuffer_height;
	args.framebuffer = new uint32_t[args.framebuffer_size];

	args.tile_width = 4;
	args.tile_height = 4;
	args.tile_size = args.tile_width * args.tile_height;

	args.samples_per_pixel = 16;
	args.max_depth = 16;

	args.light_dir = rtm::normalize(rtm::vec3(4.5f, 42.5f, 5.0f));

	args.camera = rtm::Camera(args.framebuffer_width, args.framebuffer_height, 12.0f, rtm::vec3(-900.6f, 150.8f, 120.74f), rtm::vec3(79.7f, 14.0f, -17.4f));
	//args.camera = Camera(args.framebuffer_width, args.framebuffer_height, 24.0f, rtm::vec3(0.0f, 0.0f, 5.0f));
	
	rtm::Mesh mesh(argv[1]);
	rtm::BVH mesh_blas;
	std::vector<rtm::Triangle> tris;
	std::vector<rtm::BVH::BuildObject> build_objects;
	for(uint i = 0; i < mesh.size(); ++i)
		build_objects.push_back(mesh.get_build_object(i));
	mesh_blas.build(build_objects);
	mesh.reorder(build_objects);
	mesh.get_triangles(tris);

	args.mesh.blas = mesh_blas.nodes.data();
	args.mesh.tris = tris.data();

	auto start = std::chrono::high_resolution_clock::now();

	std::vector<std::thread> threads;
	uint thread_count = std::max(std::thread::hardware_concurrency() - 2u, 0u);
	for(uint i = 0; i < thread_count; ++i) threads.emplace_back(kernel, args);
	kernel(args);
	for(uint i = 0; i < thread_count; ++i) threads[i].join();

	auto stop = std::chrono::high_resolution_clock::now();
	auto duration = std::chrono::duration_cast<std::chrono::milliseconds>(stop - start);
	std::cout << "Runtime: " << duration.count() << " ms\n\n";

	stbi_flip_vertically_on_write(true);
	stbi_write_png("./out.png", args.framebuffer_width, args.framebuffer_height, 4, args.framebuffer, 0);

	delete[] args.framebuffer;
	return 0;
}
#endif
