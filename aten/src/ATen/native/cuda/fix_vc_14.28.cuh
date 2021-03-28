#pragma once

#include <cmath>
#include <type_traits>

#if defined(_MSC_VER) && _MSC_VER >= 1928
template <typename scalar_t>
static inline __host__ __device__ typename std::enable_if<!std::is_same<scalar_t, double>::value, scalar_t>::type
ceil_(scalar_t a) {
  return std::ceilf(static_cast<float>(a));
}
template <typename scalar_t>
static inline __host__ __device__ typename std::enable_if<std::is_same<scalar_t, double>::value, scalar_t>::type
ceil_(scalar_t a) {
  return std::ceil(a);
}
template <typename scalar_t>
static inline __host__ __device__ typename std::enable_if<!std::is_same<scalar_t, double>::value, scalar_t>::type
floor_(scalar_t a) {
  return std::floorf(static_cast<float>(a));
}
template <typename scalar_t>
static inline __host__ __device__ typename std::enable_if<std::is_same<scalar_t, double>::value, scalar_t>::type
floor_(scalar_t a) {
  return std::floor(a);
}
template <typename scalar_t>
static inline __host__ __device__ typename std::enable_if<!std::is_same<scalar_t, double>::value, scalar_t>::type
trunc_(scalar_t a) {
  return std::truncf(static_cast<float>(a));
}
template <typename scalar_t>
static inline __host__ __device__ typename std::enable_if<std::is_same<scalar_t, double>::value, scalar_t>::type
trunc_(scalar_t a) {
  return std::trunc(a);
}
template <typename scalar_t1, typename scalar_t2>
static inline __host__ __device__ typename std::enable_if<!std::is_same<scalar_t1, double>::value && !std::is_same<scalar_t2, double>::value, scalar_t1>::type
copysign_(scalar_t1 a, scalar_t2 b) {
  return std::copysignf(static_cast<float>(a), static_cast<float>(b));
}
template <typename scalar_t1, typename scalar_t2>
static inline __host__ __device__ typename std::enable_if<std::is_same<scalar_t1, double>::value || std::is_same<scalar_t2, double>::value, scalar_t1>::type
copysign_(scalar_t1 a, scalar_t2 b) {
  return std::copysign(static_cast<double>(a), static_cast<double>(b));
}
#else
#define ceil_ std::ceil
#define floor_ std::floor
#define trunc_ std::trunc
#define copysign_ std::copysign
#endif
