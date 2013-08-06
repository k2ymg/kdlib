/** eglext.d

Converted from 'eglext.h'.

Version: 1.4
See_Also: http://www.khronos.org/egl/
Authors: Koji Kishita
*/
module kdlib.c.egl.eglext;


/*
** Copyright (c) 2007-2009 The Khronos Group Inc.
**
** Permission is hereby granted, free of charge, to any person obtaining a
** copy of this software and/or associated documentation files (the
** "Materials"), to deal in the Materials without restriction, including
** without limitation the rights to use, copy, modify, merge, publish,
** distribute, sublicense, and/or sell copies of the Materials, and to
** permit persons to whom the Materials are furnished to do so, subject to
** the following conditions:
**
** The above copyright notice and this permission notice shall be included
** in all copies or substantial portions of the Materials.
**
** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
*/


public import kdlib.c.egl.eglplatform;


enum EGL_EGLEXT_VERSION = 5;

enum EGL_CONFORMANT_KHR = 0x3042
enum EGL_VG_COLORSPACE_LINEAR_BIT_KHR = 0x0020;
enum EGL_VG_ALPHA_FORMAT_PRE_BIT_KHR = 0x0040;

enum {
	EGL_READ_SURFACE_BIT_KHR              = 0x0001,
	EGL_WRITE_SURFACE_BIT_KHR             = 0x0002,
	EGL_LOCK_SURFACE_BIT_KHR              = 0x0080,
	EGL_OPTIMAL_FORMAT_BIT_KHR            = 0x0100,
	EGL_MATCH_FORMAT_KHR                  = 0x3043,
	EGL_FORMAT_RGB_565_EXACT_KHR          = 0x30C0,
	EGL_FORMAT_RGB_565_KHR                = 0x30C1,
	EGL_FORMAT_RGBA_8888_EXACT_KHR        = 0x30C2,
	EGL_FORMAT_RGBA_8888_KHR              = 0x30C3,
	EGL_MAP_PRESERVE_PIXELS_KHR           = 0x30C4,
	EGL_LOCK_USAGE_HINT_KHR               = 0x30C5,
	EGL_BITMAP_POINTER_KHR                = 0x30C6,
	EGL_BITMAP_PITCH_KHR                  = 0x30C7,
	EGL_BITMAP_ORIGIN_KHR                 = 0x30C8,
	EGL_BITMAP_PIXEL_RED_OFFSET_KHR       = 0x30C9,
	EGL_BITMAP_PIXEL_GREEN_OFFSET_KHR     = 0x30CA,
	EGL_BITMAP_PIXEL_BLUE_OFFSET_KHR      = 0x30CB,
	EGL_BITMAP_PIXEL_ALPHA_OFFSET_KHR     = 0x30CC,
	EGL_BITMAP_PIXEL_LUMINANCE_OFFSET_KHR = 0x30CD,
	EGL_LOWER_LEFT_KHR                    = 0x30CE,
	EGL_UPPER_LEFT_KHR                    = 0x30CF,
}
version(EGL_EGLEXT_PROTOTYPES){
	extern(Sysgtem) import EGLBoolean eglLockSurfaceKHR(EGLDisplay display, EGLSurface surface, const(EGLint)* attrib_list);
	extern(Sysgtem) import EGLBoolean eglUnlockSurfaceKHR(EGLDisplay display, EGLSurface surface);
}else{
	alias extern(System) EGLBoolean function(EGLDisplay display, EGLSurface surface, const(EGLint)* attrib_list) PFNEGLLOCKSURFACEKHRPROC;
	alias extern(System) EGLBoolean function(EGLDisplay display, EGLSurface surface) PFNEGLUNLOCKSURFACEKHRPROC;
}

enum EGL_NATIVE_PIXMAP_KHR = 0x30B0;
alias void *EGLImageKHR;
alias null EGL_NO_IMAGE_KHR;
version(EGL_EGLEXT_PROTOTYPES){
	export extern(System) EGLImageKHR eglCreateImageKHR(EGLDisplay dpy, EGLContext ctx, EGLenum target, EGLClientBuffer buffer, const(EGLint)* attrib_list);
	export extern(System) EGLBoolean eglDestroyImageKHR(EGLDisplay dpy, EGLImageKHR image);
}else
	alias extern(System) EGLImageKHR function(EGLDisplay dpy, EGLContext ctx, EGLenum target, EGLClientBuffer buffer, const(EGLint)* attrib_list) PFNEGLCREATEIMAGEKHRPROC;
	alias extern(System) EGLBoolean function(EGLDisplay dpy, EGLImageKHR image) PFNEGLDESTROYIMAGEKHRPROC;
}

enum EGL_VG_PARENT_IMAGE_KHR = 0x30BA;

enum EGL_GL_TEXTURE_2D_KHR    = 0x30B1;
enum EGL_GL_TEXTURE_LEVEL_KHR = 0x30BC;

enum EGL_GL_TEXTURE_CUBE_MAP_POSITIVE_X_KHR = 0x30B3;
enum EGL_GL_TEXTURE_CUBE_MAP_NEGATIVE_X_KHR = 0x30B4;
enum EGL_GL_TEXTURE_CUBE_MAP_POSITIVE_Y_KHR = 0x30B5;
enum EGL_GL_TEXTURE_CUBE_MAP_NEGATIVE_Y_KHR = 0x30B6;
enum EGL_GL_TEXTURE_CUBE_MAP_POSITIVE_Z_KHR = 0x30B7;
enum EGL_GL_TEXTURE_CUBE_MAP_NEGATIVE_Z_KHR = 0x30B8;

enum EGL_GL_TEXTURE_3D_KHR      = 0x30B2;
enum EGL_GL_TEXTURE_ZOFFSET_KHR = 0x30BD;

enum EGL_GL_RENDERBUFFER_KHR = 0x30B9;

alias void* EGLSyncKHR;
alias khronos_utime_nanoseconds_t EGLTimeKHR;

enum EGL_SYNC_STATUS_KHR         = 0x30F1,
enum EGL_SIGNALED_KHR            = 0x30F2,
enum EGL_UNSIGNALED_KHR          = 0x30F3,
enum EGL_TIMEOUT_EXPIRED_KHR     = 0x30F5,
enum EGL_CONDITION_SATISFIED_KHR = 0x30F6,
enum EGL_SYNC_TYPE_KHR           = 0x30F7,
enum EGL_SYNC_REUSABLE_KHR       = 0x30FA,
enum EGL_SYNC_FLUSH_COMMANDS_BIT_KHR = 0x0001;
enum EGL_FOREVER_KHR             = 0xFFFFFFFFFFFFFFFF;
alias null EGL_NO_SYNC_KHR;
version(EGL_EGLEXT_PROTOTYPES){
	export extern(System) EGLSyncKHR eglCreateSyncKHR(EGLDisplay dpy, EGLenum type, const(EGLint)* attrib_list);
	export extern(System) EGLBoolean eglDestroySyncKHR(EGLDisplay dpy, EGLSyncKHR sync);
	export extern(System) EGLint eglClientWaitSyncKHR(EGLDisplay dpy, EGLSyncKHR sync, EGLint flags, EGLTimeKHR timeout);
	export extern(System) EGLBoolean eglSignalSyncKHR(EGLDisplay dpy, EGLSyncKHR sync, EGLenum mode);
	export extern(System) EGLBoolean eglGetSyncAttribKHR(EGLDisplay dpy, EGLSyncKHR sync, EGLint attribute, EGLint* value);
}else{
	alias extern(System) EGLSyncKHR function(EGLDisplay dpy, EGLenum type, const(EGLint)* attrib_list) PFNEGLCREATESYNCKHRPROC;
	alias extern(System) EGLBoolean function(EGLDisplay dpy, EGLSyncKHR sync) PFNEGLDESTROYSYNCKHRPROC;
	alias extern(System) EGLint function(EGLDisplay dpy, EGLSyncKHR sync, EGLint flags, EGLTimeKHR timeout) PFNEGLCLIENTWAITSYNCKHRPROC;
	alias extern(System) EGLBoolean function(EGLDisplay dpy, EGLSyncKHR sync, EGLenum mode) PFNEGLSIGNALSYNCKHRPROC;
	alias extern(System) EGLBoolean function(EGLDisplay dpy, EGLSyncKHR sync, EGLint attribute, EGLint* value) PFNEGLGETSYNCATTRIBKHRPROC;
}

enum EGL_IMAGE_PRESERVED_KHR = 0x30D2;

enum {
	EGL_CONTEXT_PRIORITY_LEVEL_IMG  = 0x3100,
	EGL_CONTEXT_PRIORITY_HIGH_IMG   = 0x3101,
	EGL_CONTEXT_PRIORITY_MEDIUM_IMG = 0x3102,
	EGL_CONTEXT_PRIORITY_LOW_IMG    = 0x3103,
}
