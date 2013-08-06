/** cl_gl.d

Converted from 'cl_gl.h'.

Version: 1.0
See_Also: http://www.khronos.org/opencl/
Authors: Koji Kishita
*/
module c.cl.cl_gl;


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


import c.cl.cl;


alias cl_uint cl_gl_object_type;
alias cl_uint cl_gl_texture_info;
alias cl_uint cl_gl_platform_info;

enum CL_GL_OBJECT_BUFFER       = 0x2000;
enum CL_GL_OBJECT_TEXTURE2D    = 0x2001;
enum CL_GL_OBJECT_TEXTURE3D    = 0x2002;
enum CL_GL_OBJECT_RENDERBUFFER = 0x2003;

enum CL_GL_TEXTURE_TARGET = 0x2004;
enum CL_GL_MIPMAP_LEVEL   = 0x2005;

extern(System) export {
cl_mem clCreateFromGLBuffer(cl_context, cl_mem_flags, cl_GLuint, int*);
cl_mem clCreateFromGLTexture2D(cl_context, cl_mem_flags, cl_GLenum, cl_GLint, cl_GLuint, cl_int*);
cl_mem clCreateFromGLTexture3D(cl_context, cl_mem_flags, cl_GLenum, cl_GLint, cl_GLuint, cl_int*);
cl_mem clCreateFromGLRenderbuffer(cl_context, cl_mem_flags, cl_GLuint, cl_int*);
cl_int clGetGLObjectInfo(cl_mem, cl_gl_object_type*, cl_GLuint*);
cl_int clGetGLTextureInfo(cl_mem, cl_gl_texture_info, size_t, void*, size_t*);
cl_int clEnqueueAcquireGLObjects(cl_command_queue, cl_uint, const(cl_mem)*, cl_uint, const(cl_event)*, cl_event*);
cl_int clEnqueueReleaseGLObjects(cl_command_queue, cl_uint, const(cl_mem)*, cl_uint, const(cl_event)*, cl_event*);
} // extern

enum cl_khr_gl_sharing = 1;

alias cl_uint cl_gl_context_info;

enum CL_INVALID_GL_SHAREGROUP_REFERENCE_KHR = -1000;

enum {
	CL_CURRENT_DEVICE_FOR_GL_CONTEXT_KHR = 0x2006,
	CL_DEVICES_FOR_GL_CONTEXT_KHR        = 0x2007,
}

enum {
	CL_GL_CONTEXT_KHR     = 0x2008,
	CL_EGL_DISPLAY_KHR    = 0x2009,
	CL_GLX_DISPLAY_KHR    = 0x200A,
	CL_WGL_HDC_KHR        = 0x200B,
	CL_CGL_SHAREGROUP_KHR = 0x200C,
}

extern(System) export
cl_int clGetGLContextInfoKHR(const(cl_context_properties)*, cl_gl_context_info, size_t, void*, size_t*);
