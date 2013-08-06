/** cl_ext.d

Converted from 'cl_ext.h'.

Version: 1.0
See_Also: http://www.khronos.org/opencl/
Authors: Koji Kishita
*/
module c.cl.cl_ext;


/*******************************************************************************
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
 ******************************************************************************/


import c.cl.cl;


enum CL_DEVICE_DOUBLE_FP_CONFIG = 0x1032;

enum CL_DEVICE_HALF_FP_CONFIG = 0x1033;

enum cl_khr_icd = 1;

enum CL_PLATFORM_ICD_SUFFIX_KHR = 0x0920;

enum CL_PLATFORM_NOT_FOUND_KHR = -1001;

extern(System)
cl_int clIcdGetPlatformIDsKHR(cl_uint, cl_platform_id*, cl_uint*);
