#pragma once
#include "stdafx.hpp"

#include "custom-instr.hpp"
#include "ray-tracing-include.hpp"

rtm::vec3 INLINE path_tracer(uint index, MeshBVH& bvh, StartupData& start_data)
{
	uint x = index % start_data.framebuffer_width;
	uint y = index / start_data.framebuffer_width;
	RNG rng(index);

	rtm::vec3 output(0.0f);
	for(uint i = 0; i < start_data.samples_per_pixel; ++i)
	{
		Path path;
		start_data.camera.generate_ray_through_pixel(x, y, path.ray, rng);

		for(uint j = 0; j < start_data.max_path_depth; ++j)
		{
			path.ray.inv_d = rtm::vec3(1.0f) / path.ray.d;
			bvh.intersect(path.ray, path.hit, false);
			if(path.hit.t < T_MAX)
			{
				path.ray.o += path.ray.d * path.hit.t;
				path.ray.d = cosine_sample_hemisphere(path.hit.normal, rng);
				path.hit.t = T_MAX;
				path.throughput *= rtm::vec3(0.8f);

				//directional light
				Ray shadow_ray; Hit shadow_hit;
				shadow_ray.o = path.ray.o;
				shadow_ray.d = start_data.light_dir;
				shadow_ray.inv_d = rtm::vec3(1.0f) / shadow_ray.d;
				bvh.intersect(shadow_ray, shadow_hit, true);
				if(shadow_hit.t >= T_MAX)
					path.radiance += path.throughput * rtm::vec3(0.8f, 0.75f, 0.7f) * rtm::max(rtm::vec3(0.0f), rtm::dot(rtm::normalize(shadow_ray.d), path.hit.normal));
			}
			else
			{
				path.radiance += path.throughput * rtm::vec3(0.6f, 0.8f, 1.0f) * rtm::vec3(1.0f);
				break;
			}
		}
		output += path.radiance;
	}

	return output / rtm::vec3(static_cast<float>(start_data.samples_per_pixel));
}


#if 0
rtm::vec3 sample_color_procedural(float t)
{
    //float r = (Ar + Br * cosf(2.0f * 3.1415f * (Cr * t + Dr)));
	//float g = (Ag + Bg * cosf(2.0f * 3.1415f * (Cg * t + Dg)));
	//float b = (Ab + Bb * cosf(2.0f * 3.1415f * (Cb * t + Db)));
	//t = t < 1.0f ? 0.0f : 1.0f;

	return rtm::vec3(t);
}

static float fractal(float pcx, float pcy, uint32_t max_iter)
{
	float px = 0.0f;
	float py = 0.0f;

    for(uint32_t it = 0; it < max_iter; ++it)
    {
		float dot = px * px + py * py;
     	if(dot > 3.1f * 3.1f) return static_cast<float>(it); //return (float)it - log2f(log2f(sqrtf(dot)));

     	float x = px * px - py * py + pcx;
     	py = 2.0f * py * px + pcy;
     	px = x;
    }

    return static_cast<float>(max_iter);
}

rtm::vec3 mandelbrot(uint index, StartupData& start_data)
{
	float y = ((static_cast<float>(index / start_data.framebuffer_width)) / start_data.framebuffer_height * 2.0f - 1.0f) * 2.0f;
	float x = ((static_cast<float>(index % start_data.framebuffer_width)) / start_data.framebuffer_width *  2.0f - 1.0f) * 2.0f - 0.5f;

	float t = fractal(x, y, 64) / static_cast<float>(64);
	return sample_color_procedural(t);
}
#endif
