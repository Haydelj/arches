#pragma once
#include "stdafx.hpp"

namespace rtm {

class vec2
{
public:
	union
	{
		float e[2];
		struct
		{
			float x;
			float y;
		};
		struct
		{
			float u;
			float v;
		};
	};
	vec2() {}
	explicit vec2(float e0, float e1) { e[0] = e0; e[1] = e1; }
	explicit vec2(float e0) { e[0] = e0; e[1] = e0; }

	inline const vec2& operator+() const { return *this; }
	inline vec2 operator-() const { return vec2(-e[0], -e[1]); }
	inline float operator[](int i) const { return e[i]; }
	inline float& operator[](int i) { return e[i]; }

	inline vec2& operator=(const vec2 &v2);
	inline vec2& operator+=(const vec2 &v2);
	inline vec2& operator-=(const vec2 &v2);
	inline vec2& operator*=(const vec2 &v2);
	inline vec2& operator/=(const vec2 &v2);
	inline vec2& operator*=(const float t);
	inline vec2& operator/=(const float t);
};

inline float squared_length(const vec2 &v)
{
	return (v[0] * v[0] + v[1] * v[1]);
}

inline float inv_length(const vec2 &v)
{
	return fast_inv_sqrtf(squared_length(v));
}

inline float length(const vec2 &v)
{
	return fast_sqrtf(squared_length(v));
}

inline vec2 operator+(const vec2 &v1, const vec2 &v2)
{
	return vec2(v1.e[0] + v2.e[0], v1.e[1] + v2.e[1]);
}

inline vec2 operator-(const vec2 &v1, const vec2 &v2)
{
	return vec2(v1.e[0] - v2.e[0], v1.e[1] - v2.e[1]);
}

inline vec2 operator*(const vec2 &v1, const vec2 &v2)
{
	return vec2(v1.e[0] * v2.e[0], v1.e[1] * v2.e[1]);
}

inline vec2 operator/(const vec2 &v1, const vec2 &v2)
{
	return vec2(v1.e[0] / v2.e[0], v1.e[1] / v2.e[1]);
}

inline vec2 operator*(const vec2& v, float t)
{
	return vec2(v.e[0] * t, v.e[1] * t);
}

inline vec2 operator*(float t, const vec2& v)
{
	return vec2(v.e[0] * t, v.e[1] * t);
}

inline vec2 operator/(const vec2& v, float t)
{
	return vec2(v.e[0] / t, v.e[1] / t);
}

inline float dot(const vec2& v1, const vec2 &v2)
{
	return v1.e[0] * v2.e[0] + v1.e[1] * v2.e[1];
}

inline float cross(const vec2& a, const vec2& b)
{
	return a.x * b.y - b.x * a.y;
}

inline vec2 normalize(const vec2 &v)
{
	return v / length(v);
}

/*
inline vec2 pow(const vec2 & v1, const vec2 &v2)
{
	return vec2(std::pow(v1[0], v2[0]), std::pow(v1[1], v2[1]));
}

inline vec2 pow(const vec2 & v1, const float t)
{
	return vec2(std::pow(v1[0], t), std::pow(v1[1], t));
}
*/

inline vec2 clamp(const vec2 & v, const vec2 &min, const vec2 &max)
{
	vec2 vc;

	vc[0] = std::max(v[0], min[0]);
	vc[1] = std::max(v[1], min[1]);

	vc[0] = std::min(v[0], max[0]);
	vc[1] = std::min(v[1], max[1]);

	return vc;
}

inline vec2& vec2::operator+=(const vec2 &v)
{
	e[0] += v.e[0];
	e[1] += v.e[1];
	return *this;
}

inline vec2& vec2::operator-=(const vec2 &v)
{
	e[0] -= v.e[0];
	e[1] -= v.e[1];
	return *this;
}

inline vec2& vec2::operator*=(const vec2 &v)
{
	e[0] *= v.e[0];
	e[1] *= v.e[1];
	return *this;
}

inline vec2& vec2::operator/=(const vec2 &v)
{
	e[0] /= v.e[0];
	e[1] /= v.e[1];
	return *this;
}

inline vec2& vec2::operator*=(const float t)
{
	e[0] *= t;
	e[1] *= t;
	return *this;
}

inline vec2& vec2::operator/=(const float t)
{
	e[0] /= t;
	e[1] /= t;
	return *this;
}

inline vec2& vec2::operator=(const vec2 &v2)
{
	e[0] = v2.x;
	e[1] = v2.y;
	return *this;
}

}
