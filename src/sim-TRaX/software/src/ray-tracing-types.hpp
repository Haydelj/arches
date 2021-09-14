#pragma once
#include "stdafx.hpp"

#include "uvec3.hpp"
#include "vec2.hpp"
#include "vec3.hpp"
#include "vec4.hpp"

#define PI 3.14159265358f

#define T_MAX 4294967296.0f
#define T_MIN 0.0015f

//#define FLT_MAX 3.402823466e+38f

class RNG
{
private:
	uint32_t rng_state{ 2147483647u };
	//the basis for this rng system came from https://stackoverflow.com/questions/4200224/random-noise-functions-for-glsl
	//A integer hash function outlined here https://gist.github.com/badboy/6267743
	uint32_t hash(uint32_t u)
	{
		u = (u + 0x7ed55d16u) + (u << 12u);
		u = (u ^ 0xc761c23cu) ^ (u >> 19u);
		u = (u + 0x165667b1u) + (u << 5u);
		u = (u + 0xd3a2646cu) ^ (u << 9u);
		u = (u + 0xfd7046c5u) + (u << 3u);
		u = (u ^ 0xb55a4f09u) ^ (u >> 16u);
		return u;
	}

	//Robert Jenkins' one a time hash funcion for size 1 https://en.wikipedia.org/wiki/Jenkins_hash_function
	uint32_t hashf(uint32_t u)
	{
		u += u << 10;
		u ^= u >> 6;
		u += u << 3;
		u ^= u >> 11;
		u += u << 15;
		return u;
	}

	//Mask off the lower 21 bits of u to make a mantisa then OR it with the bit pattern for 1.0
	//then make a float from these bit and substract 1.0 to give a number betweeon 0.0 and 1.0
	float build_float(uint32_t u)
	{
		uint32_t bits = u & 0x007FFFFFu | 0x3F800000u;
		return *((float*)(&bits)) - 1.0f;
	}

public:
	RNG(uint32_t seed = 0)
	{
		this->seed(seed);
	}

	void seed(uint32_t seed)
	{
		rng_state = hash((seed + 1u) * 2147483647u);
	}

	float randf()
	{
		uint32_t r = rng_state;
		rng_state = hashf(rng_state);
		return build_float(r);
	}

	rtm::vec2 randv2() { return rtm::vec2(randf(), randf()); }
	rtm::vec3 randv3() { return rtm::vec3(randf(), randf(), randf()); }
	rtm::vec4 randv4() { return rtm::vec4(randf(), randf(), randf(), randf()); }

	uint32_t randi()
	{
		uint32_t r = rng_state;
		rng_state = hashf(rng_state);
		return r;
	}
};

struct Ray
{
	rtm::vec3 o, d, inv_d;

	Ray() {};
	Ray(rtm::vec3 o, rtm::vec3 d) : o(o), d(d) {};
};

struct Hit
{
	float t {T_MAX};
	bool front_face {true};

	rtm::vec3 normal;
	//rtm::vec2 texCoords{0.0f};

	//Material* material;
};

struct Path
{
	Ray ray {};
	Hit hit {};

	uint depth{ 0 };

	rtm::vec3 throughput{ 1.0f };
	rtm::vec3 radiance{ 0.0f };
};

/*
class Intersectable
{
public:
	Intersectable() {}
	virtual void intersect(const Ray& ray, Hit& hit) {}
	//virtual AABB get_bounding_box() { return AABB(); }
};
*/
