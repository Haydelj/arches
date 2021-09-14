#pragma once
#include "stdafx.hpp"

namespace rtm {

//vec4------------------------------------------------------------------------
class vec4
{
public:
	union
	{
		float e[4];
		struct
		{
			float x;
			float y;
			float z;
			float w;
		};
		struct
		{
			float r;
			float g;
			float b;
			float a;
		};
	};

	vec4() {}
	explicit vec4(float e0, float e1, float e2, float e3) { e[0] = e0; e[1] = e1; e[2] = e2; e[3] = e3; }
	explicit vec4(float e0) { e[0] = e0; e[1] = e0; e[2] = e0; e[3] = e0; }

	inline const vec4& operator+() const { return *this; }
	inline vec4 operator-() const { return vec4(-e[0], -e[1], -e[2], -e[3]); }
	inline float operator[](int i) const { return e[i]; }
	inline float& operator[](int i) { return e[i]; }

	inline vec4& operator+=(const vec4 &v2);
	inline vec4& operator-=(const vec4 &v2);
	inline vec4& operator*=(const vec4 &v2);
	inline vec4& operator/=(const vec4 &v2);
	inline vec4& operator*=(const float t);
	inline vec4& operator/=(const float t);
	inline vec4& operator=(const vec4 &v2);
};

inline float squared_length(const vec4 &v)
{
	return (v[0] * v[0] + v[1] * v[1] + v[2] * v[2] + v[3] * v[3]);
}

inline float inv_length(const vec4 &v)
{
	return fast_inv_sqrtf(squared_length(v));
}

inline float length(const vec4 &v)
{
	return fast_sqrtf(squared_length(v));
}

inline vec4 operator+(const vec4  &v1, const vec4 &v2)
{
	return vec4(v1.e[0] + v2.e[0], v1.e[1] + v2.e[1], v1.e[2] + v2.e[2], v1.e[3] + v2.e[3]);
}

inline vec4 operator-(const vec4 &v1, const vec4 &v2)
{
	return vec4(v1.e[0] - v2.e[0], v1.e[1] - v2.e[1], v1.e[2] - v2.e[2], v1.e[3] - v2.e[3]);
}

inline vec4 operator*(const vec4 &v1, const vec4 &v2)
{
	return vec4(v1.e[0] * v2.e[0], v1.e[1] * v2.e[1], v1.e[2] * v2.e[2], v1.e[3] * v2.e[3]);
}

inline vec4 operator/(const vec4 &v1, const vec4 &v2)
{
	return vec4(v1.e[0] / v2.e[0], v1.e[1] / v2.e[1], v1.e[2] / v2.e[2], v1.e[3] / v2.e[3]);
}

inline vec4 operator*(const vec4 &v, float t)
{
	return vec4(v.e[0] * t, v.e[1] * t, v.e[2] * t, v.e[3] * t);
}

inline vec4 operator*(float t, const vec4 &v)
{
	return vec4(v.e[0] * t, v.e[1] * t, v.e[2] * t, v.e[3] * t);
}

inline vec4 operator/(const vec4 &v, float t)
{
	return vec4(v.e[0] / t, v.e[1] / t, v.e[2] / t, v.e[3] / t);
}

inline float dot(const vec4 & v1, const vec4 &v2)
{
	return v1.e[0] * v2.e[0] + v1.e[1] * v2.e[1] + v1.e[2] * v2.e[2] + v1.e[3] * v2.e[3];
}

inline vec4 normalize(const vec4 &v)
{
	return v / length(v);
}

/*
inline vec4 pow(const vec4 & v1, const vec4 &v2)
{
	return vec4(std::pow(v1[0], v2[0]), std::pow(v1[1], v2[1]), std::pow(v1[2], v2[2]), std::pow(v1[3], v2[3]));
}
*/

inline vec4 reflect(const vec4 & I, const vec4 &N)
{
	return I - 2 * dot(I, I)*N;
}

inline vec4 clamp(const vec4 & v, const vec4 &min, const vec4 &max)
{
	vec4 vc;

	vc[0] = std::max(v[0], min[0]);
	vc[1] = std::max(v[1], min[1]);
	vc[2] = std::max(v[2], min[2]);
	vc[3] = std::max(v[3], min[3]);

	vc[0] = std::min(v[0], max[0]);
	vc[1] = std::min(v[1], max[1]);
	vc[2] = std::min(v[2], max[2]);
	vc[3] = std::min(v[3], max[3]);

	return vc;
}

inline vec4 clamp(const vec4 & v, const float min, const float max)
{
	vec4 vc;

	vc[0] = std::max(v[0], min);
	vc[1] = std::max(v[1], min);
	vc[2] = std::max(v[2], min);
	vc[3] = std::max(v[3], min);

	vc[0] = std::min(v[0], max);
	vc[1] = std::min(v[1], max);
	vc[2] = std::min(v[2], max);
	vc[3] = std::min(v[3], max);

	return vc;
}

inline vec4 max(const vec4 & v, const vec4 &t)
{
	vec4 vc;

	vc[0] = std::max(v[0], t[0]);
	vc[1] = std::max(v[1], t[1]);
	vc[2] = std::max(v[2], t[2]);
	vc[3] = std::max(v[3], t[3]);

	return vc;
}

inline vec4 max(const vec4 & v, const float t)
{
	vec4 vc;

	vc[0] = std::max(v[0], t);
	vc[1] = std::max(v[1], t);
	vc[2] = std::max(v[2], t);
	vc[3] = std::max(v[3], t);

	return vc;
}

inline vec4 min(const vec4 & v, const vec4 &t)
{
	vec4 vc;

	vc[0] = std::min(v[0], t[0]);
	vc[1] = std::min(v[1], t[1]);
	vc[2] = std::min(v[2], t[2]);
	vc[3] = std::min(v[3], t[3]);

	return vc;
}

inline vec4 min(const vec4 & v, const float t)
{
	vec4 vc;

	vc[0] = std::min(v[0], t);
	vc[1] = std::min(v[1], t);
	vc[2] = std::min(v[2], t);
	vc[3] = std::min(v[3], t);

	return vc;
}

inline vec4& vec4::operator+=(const vec4 &v)
{
	e[0] += v.e[0];
	e[1] += v.e[1];
	e[2] += v.e[2];
	e[3] += v.e[3];
	return *this;
}

inline vec4& vec4::operator-=(const vec4 &v)
{
	e[0] -= v.e[0];
	e[1] -= v.e[1];
	e[2] -= v.e[2];
	e[3] -= v.e[3];
	return *this;
}

inline vec4& vec4::operator*=(const vec4 &v) {
	e[0] *= v.e[0];
	e[1] *= v.e[1];
	e[2] *= v.e[2];
	e[3] *= v.e[3];
	return *this;
}

inline vec4& vec4::operator/=(const vec4 &v) {
	e[0] /= v.e[0];
	e[1] /= v.e[1];
	e[2] /= v.e[2];
	e[3] /= v.e[3];
	return *this;
}

inline vec4& vec4::operator*=(const float t) {
	e[0] *= t;
	e[1] *= t;
	e[2] *= t;
	e[3] *= t;
	return *this;
}

inline vec4& vec4::operator/=(const float t) {
	e[0] /= t;
	e[1] /= t;
	e[2] /= t;
	e[3] /= t;
	return *this;
}

inline vec4& vec4::operator=(const vec4 &v2) {
	e[0] = v2.x;
	e[1] = v2.y;
	e[2] = v2.z;
	e[3] = v2.w;
	return *this;
}

}
