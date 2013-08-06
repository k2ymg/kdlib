/** cl_platform.d

Converted from 'cl_platform.h'.

Version: 1.0
See_Also: http://www.khronos.org/opencl/
Authors: Koji Kishita
*/
module c.cl.cl_platform;


/**********************************************************************************
 * Copyright (c) 2008-2009 The Khronos Group Inc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and/or associated documentation files (the
 * "Materials"), to deal in the Materials without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Materials, and to
 * permit persons to whom the Materials are furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Materials.
 *
 * THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
 * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 * MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
 **********************************************************************************/


alias byte   cl_char;
alias ubyte  cl_uchar;
alias short  cl_short;
alias ushort cl_ushort;
alias int    cl_int;
alias uint   cl_uint;
alias long   cl_long;
alias ulong  cl_ulong;
alias ushort cl_half;
alias float  cl_float;
alias double cl_double;

enum CL_CHAR_BIT  = 8;
enum CL_SCHAR_MAX = 127;
enum CL_SCHAR_MIN = (-127-1);
enum CL_CHAR_MAX  = CL_SCHAR_MAX;
enum CL_CHAR_MIN  = CL_SCHAR_MIN;
enum CL_UCHAR_MAX = 255;
enum CL_SHRT_MAX  = 32767;
enum CL_SHRT_MIN  = (-32767-1);
enum CL_USHRT_MAX = 65535;
enum CL_INT_MAX   = 2147483647;
enum CL_INT_MIN   = (-2147483647-1);
enum CL_UINT_MAX  = 0xffffffffU;
enum CL_LONG_MAX  = (cast(cl_long) 0x7FFFFFFFFFFFFFFF);
enum CL_LONG_MIN  = (cast(cl_long) -0x7FFFFFFFFFFFFFFF - 1);
enum CL_ULONG_MAX = (cast(cl_ulong) 0xFFFFFFFFFFFFFFFF);

enum CL_FLT_DIG         = 6;
enum CL_FLT_MANT_DIG    = 24;
enum CL_FLT_MAX_10_EXP  = +38;
enum CL_FLT_MAX_EXP     = +128;
enum CL_FLT_MIN_10_EXP  = -37;
enum CL_FLT_MIN_EXP     = -125;
enum CL_FLT_RADIX       = 2;
const cl_float CL_FLT_MAX         = 340282346638528859811704183484516925440.0f;
const cl_float CL_FLT_MIN         = 1.175494350822287507969e-38f;
const cl_float CL_FLT_EPSILON     = 0x1.0p-23f;

enum CL_DBL_DIG         = 15;
enum CL_DBL_MANT_DIG    = 53;
enum CL_DBL_MAX_10_EXP  = +308;
enum CL_DBL_MAX_EXP     = +1024;
enum CL_DBL_MIN_10_EXP  = -307;
enum CL_DBL_MIN_EXP     = -1021;
enum CL_DBL_RADIX       = 2;
const cl_double CL_DBL_MAX         = 179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.0; //double.max
const cl_double CL_DBL_MIN         = 2.225073858507201383090e-308;
const cl_double CL_DBL_EPSILON     = 2.220446049250313080847e-16;

const cl_float  CL_HUGE_VALF       = cast(cl_float)1e50L;
const cl_double CL_HUGE_VAL        = cast(cl_double)1e500L;
alias CL_FLT_MAX CL_MAXFLOAT;
alias CL_HUGE_VALF CL_INFINITY;
const cl_double CL_NAN             = (CL_INFINITY - CL_INFINITY);

alias uint cl_GLuint;
alias int  cl_GLint;
alias uint cl_GLenum;

private
union cl_T(T, int V)
{
	static assert(V == 2 || V == 4 || V == 8 || V == 16);

	T[V] s;
	struct {
		T x;
		T y;
		static if (V >= 2){
			T z;
			T w;
		}
		static if (V >= 16){
			T __spacer4;
			T __spacer5;
			T __spacer6;
			T __spacer7;
			T __spacer8;
			T __spacer9;
			T sa;
			T sb;
			T sc;
			T sd;
			T se;
			T sf;
		}
	}
	struct {
		T s0;
		T s1;
		static if (V >= 4){
			T s2;
			T s3;
		}
		static if (V >= 8){
			T s4;
			T s5;
			T s6;
			T s7;
		}
		static if (V >= 16){
			T s8;
			T s9;
			T sA;
			T sB;
			T sC;
			T sD;
			T sE;
			T sF;
		}
	}
}

alias cl_T!(cl_char,  2) cl_char2;
alias cl_T!(cl_char,  4) cl_char4;
alias cl_T!(cl_char,  8) cl_char8;
alias cl_T!(cl_char, 16) cl_char16;

alias cl_T!(cl_uchar,  2) cl_uchar2;
alias cl_T!(cl_uchar,  4) cl_uchar4;
alias cl_T!(cl_uchar,  8) cl_uchar8;
alias cl_T!(cl_uchar, 16) cl_uchar16;

alias cl_T!(cl_short,  2) cl_short2;
alias cl_T!(cl_short,  4) cl_short4;
alias cl_T!(cl_short,  8) cl_short8;
alias cl_T!(cl_short, 16) cl_short16;

alias cl_T!(cl_ushort,  2) cl_ushort2;
alias cl_T!(cl_ushort,  4) cl_ushort4;
alias cl_T!(cl_ushort,  8) cl_ushort8;
alias cl_T!(cl_ushort, 16) cl_ushort16;

alias cl_T!(cl_int,  2) cl_int2;
alias cl_T!(cl_int,  4) cl_int4;
alias cl_T!(cl_int,  8) cl_int8;
alias cl_T!(cl_int, 16) cl_int16;

alias cl_T!(cl_uint,  2) cl_uint2;
alias cl_T!(cl_uint,  4) cl_uint4;
alias cl_T!(cl_uint,  8) cl_uint8;
alias cl_T!(cl_uint, 16) cl_uint16;

alias cl_T!(cl_long,  2) cl_long2;
alias cl_T!(cl_long,  4) cl_long4;
alias cl_T!(cl_long,  8) cl_long8;
alias cl_T!(cl_long, 16) cl_long16;

alias cl_T!(cl_ulong,  2) cl_ulong2;
alias cl_T!(cl_ulong,  4) cl_ulong4;
alias cl_T!(cl_ulong,  8) cl_ulong8;
alias cl_T!(cl_ulong, 16) cl_ulong16;

alias cl_T!(cl_float,  2) cl_float2;
alias cl_T!(cl_float,  4) cl_float4;
alias cl_T!(cl_float,  8) cl_float8;
alias cl_T!(cl_float, 16) cl_float16;

alias cl_T!(cl_double,  2) cl_double2;
alias cl_T!(cl_double,  4) cl_double4;
alias cl_T!(cl_double,  8) cl_double8;
alias cl_T!(cl_double, 16) cl_double16;
