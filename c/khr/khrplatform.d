/** khrplatform.d

Converted from 'khrplatform.h'.

See_Also: http://www.khronos.org/
Authors: Koji Kishita
*/
module c.khr.khrplatform;


/*
** Copyright (c) 2008-2009 The Khronos Group Inc.
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


alias int   khronos_int32_t;
alias uint  khronos_uint32_t;
alias long  khronos_int64_t;
alias ulong khronos_uint64_t;

alias  byte   khronos_int8_t;
alias  ubyte  khronos_uint8_t;
alias  short  khronos_int16_t;
alias  ushort khronos_uint16_t;
alias  int    khronos_intptr_t;
alias  uint   khronos_uintptr_t;
alias  int    khronos_ssize_t;
alias  uint   khronos_usize_t;

alias float   khronos_float_t;

alias khronos_uint64_t khronos_utime_nanoseconds_t;
alias khronos_int64_t  khronos_stime_nanoseconds_t;

enum KHRONOS_MAX_ENUM = 0x7FFFFFFF;

enum {
    KHRONOS_FALSE                   = 0,
    KHRONOS_TRUE                    = 1,
    KHRONOS_BOOLEAN_ENUM_FORCE_SIZE = KHRONOS_MAX_ENUM
}
