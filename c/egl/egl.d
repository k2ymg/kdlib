/** egl.d

Converted from 'egl.h'.

Version: 1.4
See_Also: http://www.khronos.org/egl/
Authors: Koji Kishita
*/
module c.egl.egl;


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


public import c.egl.eglplatform;


alias uint EGLBoolean;
alias uint EGLenum;
alias void* EGLConfig;
alias void* EGLContext;
alias void* EGLDisplay;
alias void* EGLSurface;
alias void* EGLClientBuffer;

version = EGL_VERSION_1_0;
version = EGL_VERSION_1_1;
version = EGL_VERSION_1_2;
version = EGL_VERSION_1_3;
version = EGL_VERSION_1_4;

enum {
	EGL_FALSE = 0,
	EGL_TRUE  = 1,
}

const EGLDisplay EGL_DEFAULT_DISPLAY = null;
const EGLContext EGL_NO_CONTEXT = null;
const EGLDisplay EGL_NO_DISPLAY = null;
const EGLSurface EGL_NO_SURFACE = null;

enum EGL_DONT_CARE = -1;

enum {
	EGL_SUCCESS             = 0x3000,
	EGL_NOT_INITIALIZED     = 0x3001,
	EGL_BAD_ACCESS          = 0x3002,
	EGL_BAD_ALLOC           = 0x3003,
	EGL_BAD_ATTRIBUTE       = 0x3004,
	EGL_BAD_CONFIG          = 0x3005,
	EGL_BAD_CONTEXT         = 0x3006,
	EGL_BAD_CURRENT_SURFACE = 0x3007,
	EGL_BAD_DISPLAY         = 0x3008,
	EGL_BAD_MATCH           = 0x3009,
	EGL_BAD_NATIVE_PIXMAP   = 0x300A,
	EGL_BAD_NATIVE_WINDOW   = 0x300B,
	EGL_BAD_PARAMETER       = 0x300C,
	EGL_BAD_SURFACE         = 0x300D,
	EGL_CONTEXT_LOST        = 0x300E,
}

enum {
	EGL_BUFFER_SIZE             = 0x3020,
	EGL_ALPHA_SIZE              = 0x3021,
	EGL_BLUE_SIZE               = 0x3022,
	EGL_GREEN_SIZE              = 0x3023,
	EGL_RED_SIZE                = 0x3024,
	EGL_DEPTH_SIZE              = 0x3025,
	EGL_STENCIL_SIZE            = 0x3026,
	EGL_CONFIG_CAVEAT           = 0x3027,
	EGL_CONFIG_ID               = 0x3028,
	EGL_LEVEL                   = 0x3029,
	EGL_MAX_PBUFFER_HEIGHT      = 0x302A,
	EGL_MAX_PBUFFER_PIXELS      = 0x302B,
	EGL_MAX_PBUFFER_WIDTH       = 0x302C,
	EGL_NATIVE_RENDERABLE       = 0x302D,
	EGL_NATIVE_VISUAL_ID        = 0x302E,
	EGL_NATIVE_VISUAL_TYPE      = 0x302F,
	EGL_SAMPLES                 = 0x3031,
	EGL_SAMPLE_BUFFERS          = 0x3032,
	EGL_SURFACE_TYPE            = 0x3033,
	EGL_TRANSPARENT_TYPE        = 0x3034,
	EGL_TRANSPARENT_BLUE_VALUE  = 0x3035,
	EGL_TRANSPARENT_GREEN_VALUE = 0x3036,
	EGL_TRANSPARENT_RED_VALUE   = 0x3037,
	EGL_NONE                    = 0x3038,
	EGL_BIND_TO_TEXTURE_RGB     = 0x3039,
	EGL_BIND_TO_TEXTURE_RGBA    = 0x303A,
	EGL_MIN_SWAP_INTERVAL       = 0x303B,
	EGL_MAX_SWAP_INTERVAL       = 0x303C,
	EGL_LUMINANCE_SIZE          = 0x303D,
	EGL_ALPHA_MASK_SIZE         = 0x303E,
	EGL_COLOR_BUFFER_TYPE       = 0x303F,
	EGL_RENDERABLE_TYPE         = 0x3040,
	EGL_MATCH_NATIVE_PIXMAP     = 0x3041,
	EGL_CONFORMANT              = 0x3042,
}

enum {
	EGL_SLOW_CONFIG           = 0x3050,
	EGL_NON_CONFORMANT_CONFIG = 0x3051,
	EGL_TRANSPARENT_RGB       = 0x3052,
	EGL_RGB_BUFFER            = 0x308E,
	EGL_LUMINANCE_BUFFER      = 0x308F,
}

enum {
	EGL_NO_TEXTURE   = 0x305C,
	EGL_TEXTURE_RGB  = 0x305D,
	EGL_TEXTURE_RGBA = 0x305E,
	EGL_TEXTURE_2D   = 0x305F,
}

enum {
	EGL_PBUFFER_BIT                 = 0x0001,
	EGL_PIXMAP_BIT                  = 0x0002,
	EGL_WINDOW_BIT                  = 0x0004,
	EGL_VG_COLORSPACE_LINEAR_BIT    = 0x0020,
	EGL_VG_ALPHA_FORMAT_PRE_BIT     = 0x0040,
	EGL_MULTISAMPLE_RESOLVE_BOX_BIT = 0x0200,
	EGL_SWAP_BEHAVIOR_PRESERVED_BIT = 0x0400,
}

enum {
	EGL_OPENGL_ES_BIT  = 0x0001,
	EGL_OPENVG_BIT     = 0x0002,
	EGL_OPENGL_ES2_BIT = 0x0004,
	EGL_OPENGL_BIT     = 0x0008,
}

enum {
	EGL_VENDOR      = 0x3053,
	EGL_VERSION     = 0x3054,
	EGL_EXTENSIONS  = 0x3055,
	EGL_CLIENT_APIS = 0x308D,
}

enum {
	EGL_HEIGHT                = 0x3056,
	EGL_WIDTH                 = 0x3057,
	EGL_LARGEST_PBUFFER       = 0x3058,
	EGL_TEXTURE_FORMAT        = 0x3080,
	EGL_TEXTURE_TARGET        = 0x3081,
	EGL_MIPMAP_TEXTURE        = 0x3082,
	EGL_MIPMAP_LEVEL          = 0x3083,
	EGL_RENDER_BUFFER         = 0x3086,
	EGL_VG_COLORSPACE         = 0x3087,
	EGL_VG_ALPHA_FORMAT       = 0x3088,
	EGL_HORIZONTAL_RESOLUTION = 0x3090,
	EGL_VERTICAL_RESOLUTION   = 0x3091,
	EGL_PIXEL_ASPECT_RATIO    = 0x3092,
	EGL_SWAP_BEHAVIOR         = 0x3093,
	EGL_MULTISAMPLE_RESOLVE   = 0x3099,
}

enum {
	EGL_BACK_BUFFER   = 0x3084,
	EGL_SINGLE_BUFFER = 0x3085,
}

enum {
	EGL_VG_COLORSPACE_sRGB   = 0x3089,
	EGL_VG_COLORSPACE_LINEAR = 0x308A,
}

enum {
	EGL_VG_ALPHA_FORMAT_NONPRE = 0x308B,
	EGL_VG_ALPHA_FORMAT_PRE    = 0x308C,
}

enum {
	EGL_DISPLAY_SCALING = 10000,
}

enum {
	EGL_UNKNOWN = ((EGLint)-1),
}

enum {
	EGL_BUFFER_PRESERVED = 0x3094,
	EGL_BUFFER_DESTROYED = 0x3095,
}

enum {
	EGL_OPENVG_IMAGE = 0x3096,
}

enum {
	EGL_CONTEXT_CLIENT_TYPE = 0x3097,
}

enum {
	EGL_CONTEXT_CLIENT_VERSION = 0x3098,
}

enum {
	EGL_MULTISAMPLE_RESOLVE_DEFAULT = 0x309A,
	EGL_MULTISAMPLE_RESOLVE_BOX     = 0x309B,
}

enum {
	EGL_OPENGL_ES_API = 0x30A0,
	EGL_OPENVG_API    = 0x30A1,
	EGL_OPENGL_API    = 0x30A2,
}

enum {
	EGL_DRAW = 0x3059,
	EGL_READ = 0x305A,
}

enum {
	EGL_CORE_NATIVE_ENGINE = 0x305B,
}

alias EGL_VG_COLORSPACE EGL_COLORSPACE;
alias EGL_VG_ALPHA_FORMAT EGL_ALPHA_FORMAT;
alias EGL_VG_COLORSPACE_sRGB EGL_COLORSPACE_sRGB;
alias EGL_VG_COLORSPACE_LINEAR EGL_COLORSPACE_LINEAR;
alias EGL_VG_ALPHA_FORMAT_NONPRE EGL_ALPHA_FORMAT_NONPRE;
alias EGL_VG_ALPHA_FORMAT_PRE EGL_ALPHA_FORMAT_PRE;

export extern(System) {
EGLint eglGetError();
EGLDisplay eglGetDisplay(EGLNativeDisplayType display_id);
EGLBoolean eglInitialize(EGLDisplay dpy, EGLint* major, EGLint* minor);
EGLBoolean eglTerminate(EGLDisplay dpy);
const(char)* eglQueryString(EGLDisplay dpy, EGLint name);
EGLBoolean eglGetConfigs(EGLDisplay dpy, EGLConfig* configs, EGLint config_size, EGLint* num_config);
EGLBoolean eglChooseConfig(EGLDisplay dpy, const(EGLint)* attrib_list, EGLConfig* configs, EGLint config_size, EGLint* num_config);
EGLBoolean eglGetConfigAttrib(EGLDisplay dpy, EGLConfig config, EGLint attribute, EGLint* value);
EGLSurface eglCreateWindowSurface(EGLDisplay dpy, EGLConfig config, EGLNativeWindowType win, const(EGLint)* attrib_list);
EGLSurface eglCreatePbufferSurface(EGLDisplay dpy, EGLConfig config, const(EGLint)* attrib_list);
EGLSurface eglCreatePixmapSurface(EGLDisplay dpy, EGLConfig config, EGLNativePixmapType pixmap, const(EGLint)* attrib_list);
EGLBoolean eglDestroySurface(EGLDisplay dpy, EGLSurface surface);
EGLBoolean eglQuerySurface(EGLDisplay dpy, EGLSurface surface, EGLint attribute, EGLint* value);
EGLBoolean eglBindAPI(EGLenum api);
EGLenum eglQueryAPI();
EGLBoolean eglWaitClient();
EGLBoolean eglReleaseThread();
EGLSurface eglCreatePbufferFromClientBuffer(EGLDisplay dpy, EGLenum buftype, EGLClientBuffer buffer, EGLConfig config, const(EGLint)* attrib_list);
EGLBoolean eglSurfaceAttrib(EGLDisplay dpy, EGLSurface surface, EGLint attribute, EGLint value);
EGLBoolean eglBindTexImage(EGLDisplay dpy, EGLSurface surface, EGLint buffer);
EGLBoolean eglReleaseTexImage(EGLDisplay dpy, EGLSurface surface, EGLint buffer);
EGLBoolean eglSwapInterval(EGLDisplay dpy, EGLint interval);
EGLContext eglCreateContext(EGLDisplay dpy, EGLConfig config, EGLContext share_context, const(EGLint)* attrib_list);
EGLBoolean eglDestroyContext(EGLDisplay dpy, EGLContext ctx);
EGLBoolean eglMakeCurrent(EGLDisplay dpy, EGLSurface draw, EGLSurface read, EGLContext ctx);
EGLContext eglGetCurrentContext();
EGLSurface eglGetCurrentSurface(EGLint readdraw);
EGLDisplay eglGetCurrentDisplay();
EGLBoolean eglQueryContext(EGLDisplay dpy, EGLContext ctx, EGLint attribute, EGLint* value);
EGLBoolean eglWaitGL();
EGLBoolean eglWaitNative(EGLint engine);
EGLBoolean eglSwapBuffers(EGLDisplay dpy, EGLSurface surface);
EGLBoolean eglCopyBuffers(EGLDisplay dpy, EGLSurface surface, EGLNativePixmapType target);

alias void function() __eglMustCastToProperFunctionPointerType;
__eglMustCastToProperFunctionPointerType eglGetProcAddress(const(char)* procname);
} // extern
