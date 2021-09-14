#pragma once
#include "stdafx.hpp"

namespace rtm {

//vec3------------------------------------------------------------------------
class vec3
{
public:
	union
	{
		float e[3];
		struct
		{
			float x;
			float y;
			float z;
		};
		struct
		{
			float r;
			float g;
			float b;
		};
	};

	vec3() {}
	explicit vec3(float e0, float e1, float e2) { e[0] = e0; e[1] = e1; e[2] = e2; }
	explicit vec3(float e0) { e[0] = e0; e[1] = e0; e[2] = e0; }

	inline const vec3& operator+() const { return *this; }
	inline vec3 operator-() const { return vec3(-e[0], -e[1], -e[2]); }
	inline float operator[](int i) const { return e[i]; }
	inline float& operator[](int i) { return e[i]; }

	inline vec3& operator+=(const vec3 &v2);
	inline vec3& operator-=(const vec3 &v2);
	inline vec3& operator*=(const vec3 &v2);
	inline vec3& operator/=(const vec3 &v2);
	inline vec3& operator*=(const float t);
	inline vec3& operator/=(const float t);
	inline vec3& operator=(const vec3 &v2);
};

inline float squared_length(const vec3 &v)
{
	return (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]);
}

inline float inv_length(const vec3 &v)
{
	return fast_inv_sqrtf(squared_length(v));
}

inline float length(const vec3 &v)
{
	return fast_sqrtf(squared_length(v));
}

inline vec3 operator+(const vec3  &v1, const vec3 &v2)
{
	return vec3(v1.e[0] + v2.e[0], v1.e[1] + v2.e[1], v1.e[2] + v2.e[2]);
}

inline vec3 operator-(const vec3 &v1, const vec3 &v2)
{
	return vec3(v1.e[0] - v2.e[0], v1.e[1] - v2.e[1], v1.e[2] - v2.e[2]);
}

inline vec3 operator*(const vec3 &v1, const vec3 &v2)
{
	return vec3(v1.e[0] * v2.e[0], v1.e[1] * v2.e[1], v1.e[2] * v2.e[2]);
}

inline vec3 operator/(const vec3 &v1, const vec3 &v2)
{
	return vec3(v1.e[0] / v2.e[0], v1.e[1] / v2.e[1], v1.e[2] / v2.e[2]);
}

inline vec3 operator*(const vec3 &v, float t)
{
	return vec3(v.e[0] * t, v.e[1] * t, v.e[2] * t);
}

inline vec3 operator*(float t, const vec3 &v)
{
	return vec3(v.e[0] * t, v.e[1] * t, v.e[2] * t);
}

inline vec3 operator/(const vec3 &v, float t)
{
	return vec3(v.e[0] / t, v.e[1] / t, v.e[2] / t);
}

inline float dot(const vec3 & v1, const vec3 &v2)
{
	return v1.e[0] * v2.e[0] + v1.e[1] * v2.e[1] + v1.e[2] * v2.e[2];
}

inline vec3 cross(const vec3 & v1, const vec3 &v2)
{
	return vec3(v1.e[1] * v2.e[2] - v1.e[2] * v2.e[1],
		(-(v1.e[0] * v2.e[2] - v1.e[2] * v2.e[0])),
		v1.e[0] * v2.e[1] - v1.e[1] * v2.e[0]);
}

inline vec3 normalize(const vec3 &v)
{
	return v / length(v);
}

/*
inline vec3 pow(const vec3 & v1, const vec3 &v2)
{
	return vec3(std::pow(v1[0], v2[0]), std::pow(v1[1], v2[1]), std::pow(v1[2], v2[2]));
}

inline vec3 pow(const vec3 & v1, const float t)
{
	return vec3(std::pow(v1[0], t), std::pow(v1[1], t), std::pow(v1[2], t));
}
*/

inline vec3 reflect(const vec3 & I, const vec3 &N)
{
	return 2 * dot(I, I)*N - I;
}

inline vec3 clamp(const vec3 & v, const vec3 &min, const vec3 &max)
{
	vec3 vc;

	vc[0] = std::max(v[0], min[0]);
	vc[1] = std::max(v[1], min[1]);
	vc[2] = std::max(v[2], min[2]);

	vc[0] = std::min(v[0], max[0]);
	vc[1] = std::min(v[1], max[1]);
	vc[2] = std::min(v[2], max[2]);

	return vc;
}

inline vec3 clamp(const vec3 & v, const float min, const float max)
{
	vec3 vc;

	vc[0] = std::max(v[0], min);
	vc[1] = std::max(v[1], min);
	vc[2] = std::max(v[2], min);

	vc[0] = std::min(v[0], max);
	vc[1] = std::min(v[1], max);
	vc[2] = std::min(v[2], max);

	return vc;
}

inline vec3 max(const vec3 & v, const vec3 &t)
{
	vec3 vc;

	vc[0] = std::max(v[0], t[0]);
	vc[1] = std::max(v[1], t[1]);
	vc[2] = std::max(v[2], t[2]);

	return vc;
}

inline vec3 max(const vec3 & v, const float t)
{
	vec3 vc;

	vc[0] = std::max(v[0], t);
	vc[1] = std::max(v[1], t);
	vc[2] = std::max(v[2], t);

	return vc;
}

inline vec3 min(const vec3 & v, const vec3 &t)
{
	vec3 vc;

	vc[0] = std::min(v[0], t[0]);
	vc[1] = std::min(v[1], t[1]);
	vc[2] = std::min(v[2], t[2]);

	return vc;
}

inline vec3 min(const vec3 & v, const float t)
{
	vec3 vc;

	vc[0] = std::min(v[0], t);
	vc[1] = std::min(v[1], t);
	vc[2] = std::min(v[2], t);

	return vc;
}

inline vec3& vec3::operator+=(const vec3 &v)
{
	e[0] += v.e[0];
	e[1] += v.e[1];
	e[2] += v.e[2];
	return *this;
}

inline vec3& vec3::operator-=(const vec3 &v)
{
	e[0] -= v.e[0];
	e[1] -= v.e[1];
	e[2] -= v.e[2];
	return *this;
}

inline vec3& vec3::operator*=(const vec3 &v) {
	e[0] *= v.e[0];
	e[1] *= v.e[1];
	e[2] *= v.e[2];
	return *this;
}

inline vec3& vec3::operator/=(const vec3 &v) {
	e[0] /= v.e[0];
	e[1] /= v.e[1];
	e[2] /= v.e[2];
	return *this;
}

inline vec3& vec3::operator*=(const float t) {
	e[0] *= t;
	e[1] *= t;
	e[2] *= t;
	return *this;
}

inline vec3& vec3::operator/=(const float t) {
	e[0] /= t;
	e[1] /= t;
	e[2] /= t;
	return *this;
}

inline vec3& vec3::operator=(const vec3 &v2) {
	e[0] = v2.x;
	e[1] = v2.y;
	e[2] = v2.z;
	return *this;
}

}
