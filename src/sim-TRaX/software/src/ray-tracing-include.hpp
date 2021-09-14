#pragma once
#include "stdafx.hpp"

#include "sampling.hpp"
#include "ray-tracing-types.hpp"
#include "mesh-bvh.hpp"
#include "camera.hpp"

#define STARTUP_DATA_ADDRESS 256ull

struct StartupData
{
	uint32_t framebuffer_width;
	uint32_t framebuffer_height;
	uint32_t framebuffer_size;
	uint32_t* framebuffer_address;

	uint32_t samples_per_pixel;
	uint32_t max_path_depth;

	Camera camera;
	rtm::vec3 light_pos;
	rtm::vec3 light_dir;

	rtm::uvec3* vertex_indices;
	rtm::uvec3* normal_indices;
	rtm::vec3* vertices;
	rtm::vec3* normals;
	MeshBVH::Node* nodes;

	StartupData() {}
};
