#pragma once

#ifndef __riscv
#include <atomic>
#include <cassert>
#include <cmath>
#include <cstring>
#include <cstdio>
#include <fstream>
#include <iostream>
#include <sstream>
#include <string>
#include <thread>
#include <vector>
#include <algorithm>
#endif

#include <cfloat>
#include <cstdint>

#include "rtm/rtm.hpp"

typedef unsigned int uint;

#define WIDE_BVH_COMPRESSED
//#define WIDE_BVH
#define T_STACK_SZ 256