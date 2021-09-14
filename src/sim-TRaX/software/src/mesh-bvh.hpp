#pragma once
#include "stdafx.hpp"

#include "ray-tracing-include.hpp"

#include "mesh.hpp"

class MeshBVH
{
public:
	struct Node
	{
		AABB aabb;

		//uint32_t leaf : 1;
		//uint32_t last_child_offset : 3; //num_children - 1
		//uint32_t child_index : 28;
		//uint8_t pad[4];

		uint32_t child_index;
		uint8_t leaf;
		uint8_t last_child_offset; //num_children - 1
		uint8_t pad[2];
	};


#ifdef ARCH_RISCV
	Node* nodes;
#endif

	Mesh* mesh;

public:
#ifdef ARCH_RISCV
	MeshBVH(Mesh* mesh, Node* nodes)
	{
		this->mesh = mesh;
		this->nodes = nodes;
	}
#endif

	void INLINE intersect(const Ray& ray, Hit& hit, bool is_shadow = false)
	{
		const uint root_index = 0;
		const uint stack_size = 32;

		float root_hit_t = nodes[root_index].aabb.intersect(ray);
		if (root_hit_t >= hit.t) return;

		struct NodeStackEntry
		{
			float t;
			uint  index;
		};

		uint node_stack_index = ~0u; NodeStackEntry node_stack[stack_size];
		node_stack[++node_stack_index] = { root_hit_t, root_index };

		while (node_stack_index != ~0u)
		{
			NodeStackEntry current_stack_entry = node_stack[node_stack_index--];
			if(current_stack_entry.t >= hit.t) continue;
			Node& current_node = nodes[current_stack_entry.index];
			if (current_node.leaf)
			{
				if(!is_shadow)
				{
					for (uint i = 0; i <= current_node.last_child_offset; ++i)
						mesh->intersect_triangle(current_node.child_index + i, ray, hit);
				}
				else
				{
					for (uint i = 0; i <= current_node.last_child_offset; ++i)
					{
						mesh->intersect_triangle(current_node.child_index + i, ray, hit);
						if(hit.t < T_MAX) return;
					}
				}
			}
			else
			{
				uint children[2]{ current_node.child_index, current_node.child_index + 1u };
				float hit_ts[2]{ nodes[children[0]].aabb.intersect(ray), nodes[children[1]].aabb.intersect(ray) };
				if (hit_ts[0] < hit_ts[1])
				{
					node_stack[++node_stack_index] = {hit_ts[1], children[1]};
					node_stack[++node_stack_index] = {hit_ts[0], children[0]};
				}
				else
				{
					node_stack[++node_stack_index] = {hit_ts[0], children[0]};
					node_stack[++node_stack_index] = {hit_ts[1], children[1]};
				}
			}
		}
	}

#ifdef ARCH_X86
	MeshBVH(Mesh* mesh) : mesh(mesh)
	{

	}

	struct Centroid
	{
		uint index;
		rtm::vec3 pos;
		AABB aabb;
		//uint64_t mortson_code;
	};

	std::vector<Node> nodes;

	struct Triangle
	{
		rtm::uvec3 vi;
		rtm::uvec3 ni;
		//rtm::uvec3 ti;
	};

	std::vector<Triangle> temp_triangles; //used for sorting the index buffer to reduce node size

	void build()
	{
		std::vector<Centroid> centroids(mesh->vertex_indices.size());
		for (uint i = 0; i < mesh->vertex_indices.size(); ++i)
		{
			centroids[i].index = i;
			centroids[i].pos = mesh->get_triangle_bounding_box(i).get_center();
			centroids[i].aabb = mesh->get_triangle_bounding_box(i);
			//centroids[i].pos = mesh->get_triangle_centroid(i);

			/*
			uint64_t x = (*reinterpret_cast<uint*>(&centroids[i].pos.x)) & 0x001fffff;
			uint64_t y = (*reinterpret_cast<uint*>(&centroids[i].pos.x)) & 0x001fffff;
			uint64_t z = (*reinterpret_cast<uint*>(&centroids[i].pos.x)) & 0x001fffff;

			uint64_t id = 0u;
			for (int i = 0; i < 21; ++i)
			{
				id |= (x & (1u << i)) << (i * 2);
				id |= (y & (1u << i)) << (i * 2 + 1);
				id |= (z & (1u << i)) << (i * 2 + 2);
			}
			*/
		}
		nodes.push_back({});
		_build(0, centroids, 0);

		for (uint i = 0; i < temp_triangles.size(); ++i)
		{
			mesh->vertex_indices[i] = temp_triangles[i].vi;
			mesh->normal_indices[i] = temp_triangles[i].ni;
			//mesh->tex_coord_indices[i] = temp_triangles[i].ti;
		}
		temp_triangles.clear();

		std::cout << "BVH built\n";
	}

	void _split_centroids_sah(std::vector<Centroid>& centroids, std::vector<Centroid> sub_centroids[2]) const
	{
		AABB parent{};
		AABB centroid_bounds{};
		for (uint i = 0; i < centroids.size(); ++i)
		{
			centroid_bounds.min = rtm::min(centroids[i].pos, centroid_bounds.min);
			centroid_bounds.max = rtm::max(centroids[i].pos, centroid_bounds.max);
			parent.add_aabb(centroids[i].aabb);
		}

		bool has_valid_spliting_plane = false;
		uint best_spliting_axis = 0;
		float best_spliting_plane = 0.0f;
		float best_spliting_cost = FLT_MAX;

		constexpr uint MAX_BINS = 32;
		uint bins = std::min(MAX_BINS, static_cast<uint>(centroids.size()));
		for (uint spliting_axis = 0; spliting_axis < 3; ++spliting_axis)
		{
			float width_about_axis = centroid_bounds.max[spliting_axis] - centroid_bounds.min[spliting_axis];
			if (width_about_axis <= 0.0f) continue;

			for (uint i = 0; i < bins; ++i)
			{
				AABB sub_aabbs[2] = { {}, {} };
				uint sub_triangle_cont[2] = { 0, 0 };

				float spliting_plane;
				if (bins < centroids.size())
				{
					float spliting_shift = i / float((MAX_BINS - 1));
					spliting_plane = centroid_bounds.min[spliting_axis] * (1.0f - spliting_shift) + centroid_bounds.max[spliting_axis] * spliting_shift;
				}
				else
				{
					spliting_plane = centroids[i].pos[spliting_axis];
				}

				if (spliting_plane > centroid_bounds.min[spliting_axis] && spliting_plane <= centroid_bounds.max[spliting_axis])
				{
					for (uint j = 0; j < centroids.size(); ++j)
					{
						if (centroids[j].pos[spliting_axis] < spliting_plane)
						{
							sub_aabbs[0].add_aabb(centroids[j].aabb);
							sub_triangle_cont[0]++;
						}
						else
						{
							sub_aabbs[1].add_aabb(centroids[j].aabb);
							sub_triangle_cont[1]++;
						}
					}
				}

				constexpr float t_traversal = 1.0f, t_intersect = 2.0f;
				float cost = t_traversal + (sub_aabbs[0].surface_area() / parent.surface_area() * sub_triangle_cont[0] * t_intersect) + (sub_aabbs[1].surface_area() / parent.surface_area() * sub_triangle_cont[1] * t_intersect);
				//float cost = (sub_aabbs[0].surface_area() * sub_triangle_cont[0]) + (sub_aabbs[1].surface_area() * sub_triangle_cont[1]);
				if (cost < best_spliting_cost)
				{
					best_spliting_cost = cost;
					best_spliting_plane = spliting_plane;
					best_spliting_axis = spliting_axis;
					has_valid_spliting_plane = true;
				}
			}
		}

		if (has_valid_spliting_plane)
		{
			assert(best_spliting_plane < FLT_MAX);
			for (uint i = 0; i < centroids.size(); ++i)
				if (centroids[i].pos[best_spliting_axis] < best_spliting_plane) sub_centroids[0].push_back(centroids[i]);
				else                                                            sub_centroids[1].push_back(centroids[i]);
		}
		else
		{
			for (uint i = 0; i < centroids.size(); ++i)
				if (i < centroids.size() / 2.0f) sub_centroids[0].push_back(centroids[i]);
				else                             sub_centroids[1].push_back(centroids[i]);
		}
	}

	void _split_centroids(std::vector<Centroid>& centroids, std::vector<Centroid> sub_centroids[2]) const
	{
		rtm::vec3 min(FLT_MAX); rtm::vec3 max(-FLT_MAX);
		for (uint i = 0; i < centroids.size(); ++i)
		{
			min = rtm::min(centroids[i].pos, min);
			max = rtm::max(centroids[i].pos, max);
		}

		uint spliting_axis = 0;
		float width_about_axis = 0.0f;
		for (uint i = 0; i < 3; ++i)
		{
			float width = max[i] - min[i];
			if (width > width_about_axis)
			{
				width_about_axis = width;
				spliting_axis = i;
			}
		}

		if (width_about_axis > 0.0f)
		{
			float spliting_plane = (max[spliting_axis] + min[spliting_axis]) * 0.5f;
			for (uint i = 0; i < centroids.size(); ++i)
				if (centroids[i].pos[spliting_axis] < spliting_plane) sub_centroids[0].push_back(centroids[i]);
				else                                                  sub_centroids[1].push_back(centroids[i]);
		}
		else
		{
			for (uint i = 0; i < centroids.size(); ++i)
				if (i < centroids.size() / 2.0f) sub_centroids[0].push_back(centroids[i]);
				else                             sub_centroids[1].push_back(centroids[i]);
		}
	}

	void _build(uint node_index, std::vector<Centroid>& centroids, uint spliting_axis)
	{
		for (uint i = 0; i < centroids.size(); ++i)
			nodes[node_index].aabb.add_aabb(centroids[i].aabb);

		if (centroids.size() <= 8)
		{
			nodes[node_index].leaf = 1;
			nodes[node_index].child_index = static_cast<uint32_t>(temp_triangles.size());
			nodes[node_index].last_child_offset = static_cast<uint32_t>(centroids.size() - 1);

			for (uint i = 0; i < centroids.size(); ++i)
			{
				temp_triangles.push_back({});
				temp_triangles.back().vi = mesh->vertex_indices[centroids[i].index];
				temp_triangles.back().ni = mesh->normal_indices[centroids[i].index];
				//temp_triangles.back().ti = mesh->tex_coord_indices[centroids[i].index];
			}
		}
		else
		{
			std::vector<Centroid> sub_centroids[2];
			_split_centroids_sah(centroids, sub_centroids);
			//_split_centroids(centroids, sub_centroids);
			centroids.clear();

			uint next_index = nodes[node_index].child_index = nodes.size();
			for (uint i = 0; i < 2; ++i)
			{
				assert(!sub_centroids[i].empty());
				nodes.push_back({});
			}

			nodes[node_index].last_child_offset = (2 - 1);
			for (uint i = 0; i < 2; ++i)
				_build(next_index++, sub_centroids[i], spliting_axis);
		}
	}
#endif // ARCH_X86
};
