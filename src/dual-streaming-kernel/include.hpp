#pragma once
#include "stdafx.hpp"

#include "treelet-bvh.hpp"
#define KERNEL_ARGS_ADDRESS 256ull

struct DualStreamingKernelArgs
{
	uint32_t framebuffer_width;
	uint32_t framebuffer_height;
	uint32_t framebuffer_size;

	uint32_t samples_per_pixel;
	float inverse_samples_per_pixel;
	uint32_t max_path_depth;

	bool use_early;
	bool hit_delay;
	bool use_secondary_rays;
	uint weight_scheme;

	rtm::Camera camera;
	rtm::vec3 light_dir;

	//heap data pointers
	uint32_t* framebuffer;
	rtm::Hit* hit_records;
	Treelet* treelets;
	rtm::Triangle* triangles;
	
	rtm::Hit* primary_hits;
	rtm::Ray* secondary_rays;
};
