#pragma once
#include "stdafx.hpp"

#include "ray-tracing-types.hpp"

#include "aabb.hpp"

class Mesh
{
public:
#ifdef ARCH_RISCV
	rtm::uvec3* vertex_indices;
	rtm::uvec3* normal_indices;
	//rtm::uvec3* tex_coord_indices;

	rtm::vec3* vertices;
	rtm::vec3* normals;
	//rtm::vec2* tex_coords;
#endif

#ifdef ARCH_X86
	std::vector<rtm::uvec3> vertex_indices;
	std::vector<rtm::uvec3> normal_indices;
	std::vector<rtm::uvec3> tex_coord_indices;

	std::vector<rtm::vec3> vertices;
	std::vector<rtm::vec3> normals;
	std::vector<rtm::vec2> tex_coords;
#endif

public:
#ifdef ARCH_RISCV
	Mesh(rtm::uvec3* vertex_indices, rtm::uvec3* normal_indices, rtm::vec3* vertices, rtm::vec3* normals)
	{
		this->vertex_indices = vertex_indices;
		this->normal_indices = normal_indices;
		this->vertices = vertices;
		this->normals = normals;
	}
#endif

#ifdef ARCH_X86
	Mesh(const char* file_path)
	{
		load_obj(file_path);
	}

	bool load_obj(const char* file_path)
	{
		bool has_v = false;
		bool has_n = false;
		bool has_t = false;

		std::ifstream file(file_path);

		rtm::vec3 min(FLT_MAX);
		rtm::vec3 max(-FLT_MAX);

		if (file.is_open())
		{
			std::string line;
			while (std::getline(file, line))
			{
				std::istringstream lineStream(line);
				std::string type;
				lineStream >> type;

				if (type == "v")
				{
					has_v = true;
					float v0, v1, v2;
					lineStream >> v0 >> v1 >> v2;
					vertices.push_back(rtm::vec3(v0, v1, v2));
				}
				else if (type == "vn")
				{
					has_n = true;
					float n0, n1, n2;
					lineStream >> n0 >> n1 >> n2;
					normals.push_back(rtm::vec3(n0, n1, n2));
				}
				else if (type == "vt")
				{
					has_t = true;
					float t0, t1;
					lineStream >> t0 >> t1;
					tex_coords.push_back(rtm::vec2(t0, t1));
				}
				else if (type == "f")
				{
					vertex_indices.push_back({});
					if (has_t) tex_coord_indices.push_back({});
					if (has_n) normal_indices.push_back({});

					char c; uint ib;
					for (uint i = 0; i < 3; ++i)
					{
						lineStream >> ib;
						vertex_indices.back()[i] = ib - 1;
						if (has_t)
						{
							lineStream >> c;
							lineStream >> ib;
							tex_coord_indices.back()[i] = ib - 1;
							if (has_n)
							{
								lineStream >> c;
								lineStream >> ib;
								normal_indices.back()[i] = ib - 1;
							}
						}
						else if (has_n)
						{
							lineStream >> c >> c;
							lineStream >> ib;
							normal_indices.back()[i] = ib - 1;
						}
					}
				}
			}
		}
		else return false;

		if (!has_t)
		{
			tex_coords.push_back(rtm::vec2(0.0f));

			for (size_t i = 0; i < vertex_indices.size(); ++i)
				tex_coord_indices.push_back(rtm::uvec3(0));
		}

		if (!has_n)
		{
			for (size_t i = 0; i < vertices.size(); ++i)
				normals.push_back(rtm::vec3(0.0f));

			for (size_t i = 0; i < vertex_indices.size(); ++i)
				normal_indices.push_back(vertex_indices[i]);

			for (size_t i = 0; i < vertex_indices.size(); ++i)
			{
				rtm::vec3 edge1 = vertices[vertex_indices[i][1]] - vertices[vertex_indices[i][0]];
				rtm::vec3 edge2 = vertices[vertex_indices[i][2]] - vertices[vertex_indices[i][0]];

				rtm::vec3 normal = rtm::normalize(rtm::cross(edge1, edge2));

				for (uint j = 0; j < 3; ++j)
					normals[vertex_indices[i][j]] += normal;
			}

			for (size_t i = 0; i < vertices.size(); ++i)
				normals[i] = rtm::normalize(normals[i]);
		}

		std::cout << "Loaded: " << file_path << ", " << has_v << ", " << has_t << ", " << has_n << "\n";
		return true;
	};

	rtm::vec3 get_triangle_centroid(uint triangle_index)
	{
		return (vertices[vertex_indices[triangle_index][0]] + vertices[vertex_indices[triangle_index][1]] + vertices[vertex_indices[triangle_index][2]]) / 3.0f;
	}

	float get_triangle_surface_area(uint triangle_index)
	{
		rtm::vec3 a = vertices[vertex_indices[triangle_index][0]];
		rtm::vec3 b = vertices[vertex_indices[triangle_index][1]];
		rtm::vec3 c = vertices[vertex_indices[triangle_index][2]];

		rtm::vec3 ab = b - a;
		rtm::vec3 ac = c - a;

		return rtm::length(rtm::cross(ab, ac)) / 2.0f;
	}

	AABB get_triangle_bounding_box(uint triangle_index)
	{
		AABB aabb;
		for (uint i = 0; i < 3; ++i)
		{
			aabb.min = min(aabb.min, vertices[vertex_indices[triangle_index][i]]);
			aabb.max = max(aabb.max, vertices[vertex_indices[triangle_index][i]]);
		}
		return aabb;
	}
#endif

	bool INLINE intersect_triangle(uint triangle_index, const Ray& ray, Hit& hit)
	{
		rtm::vec3 vs[3];
		vs[0] = vertices[vertex_indices[triangle_index][0]];
		vs[1] = vertices[vertex_indices[triangle_index][1]];
		vs[2] = vertices[vertex_indices[triangle_index][2]];

		rtm::vec3 gn = cross(vs[1] - vs[0], vs[2] - vs[0]);

		float gn_dot_d = dot(gn, ray.d);
		float t = dot(gn, vs[0] - ray.o) / gn_dot_d;

		if (t > T_MIN && t < hit.t)
		{
			rtm::vec3 hit_pos = t * ray.d + ray.o;
			rtm::vec2 vs2d[3], hp2d;
			float abs_gnx = abs(gn.x), abs_gny = abs(gn.y), abs_gnz = abs(gn.z);
			if (abs_gnx > abs_gny && abs_gnx > abs_gnz)
			{
				vs2d[0] = rtm::vec2(vs[0].y, vs[0].z);
				vs2d[1] = rtm::vec2(vs[1].y, vs[1].z);
				vs2d[2] = rtm::vec2(vs[2].y, vs[2].z);
				hp2d = rtm::vec2(hit_pos.y, hit_pos.z);
			}
			else if (abs_gny > abs_gnz)
			{
				vs2d[0] = rtm::vec2(vs[0].x, vs[0].z);
				vs2d[1] = rtm::vec2(vs[1].x, vs[1].z);
				vs2d[2] = rtm::vec2(vs[2].x, vs[2].z);
				hp2d = rtm::vec2(hit_pos.x, hit_pos.z);
			}
			else
			{
				vs2d[0] = rtm::vec2(vs[0].x, vs[0].y);
				vs2d[1] = rtm::vec2(vs[1].x, vs[1].y);
				vs2d[2] = rtm::vec2(vs[2].x, vs[2].y);
				hp2d = rtm::vec2(hit_pos.x, hit_pos.y);
			}

			float bary_coords[3];
			float a = rtm::cross(vs2d[1] - vs2d[0], vs2d[2] - vs2d[0]);
			bary_coords[0] = rtm::cross(vs2d[1] - hp2d, vs2d[2] - hp2d) / a;
			bary_coords[1] = rtm::cross(vs2d[2] - hp2d, vs2d[0] - hp2d) / a;
			bary_coords[2] = rtm::cross(vs2d[0] - hp2d, vs2d[1] - hp2d) / a;

			if (bary_coords[0] >= 0.0f && bary_coords[1] >= 0.0f && bary_coords[2] >= 0.0f)
			{
				hit.t = t;
				hit.front_face = (gn_dot_d < 0.0f);
				//hit.material = material;

				//hit.normal = rtm::normalize(bary_coords[0] * normals[normal_indices[triangle_index][0]] +
				//	                        bary_coords[1] * normals[normal_indices[triangle_index][1]] +
				//	                        bary_coords[2] * normals[normal_indices[triangle_index][2]]);

				hit.normal = rtm::normalize(gn);

				//hit.tex_coord = (bary_coords[0] * tex_coords[tex_coord_indices[triangle_index][0]] +
				//	bary_coords[1] * tex_coords[tex_coord_indices[triangle_index][1]] +
				//	bary_coords[2] * tex_coords[tex_coord_indices[triangle_index][2]]);

				if (!hit.front_face) hit.normal = -hit.normal;
				return true;
			}
		}
		return false;
	}
};
