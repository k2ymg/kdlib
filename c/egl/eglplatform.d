/** eglplatform.d

Converted from 'eglplatform.h'.

Version: 1.4
See_Also: http://www.khronos.org/egl/
Authors: Koji Kishita
*/
module kdlib.c.egl.eglplatform;


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


import c.khr.khrplatform;


version(Windows){
	import windows.windows; // todo: change to new windows.

	alias HDC     EGLNativeDisplayType;
	alias HBITMAP EGLNativePixmapType;
	alias HWND    EGLNativeWindowType;

}else version(Linux){
	//#include <X11/Xlib.h>
	//#include <X11/Xutil.h>

	alias Display* EGLNativeDisplayType;
	alias Pixmap   EGLNativePixmapType;
	alias Window   EGLNativeWindowType;

}else{
	static assert("Platform not recognized");
}

alias EGLNativeDisplayType NativeDisplayType;
alias EGLNativePixmapType  NativePixmapType;
alias EGLNativeWindowType  NativeWindowType;

alias khronos_int32_t EGLint;
