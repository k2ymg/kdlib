/** d2dbasetypes.d

Converted from 'd2dbasetypes.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.d2dbasetypes;


import c.windows.windef;


struct D3DCOLORVALUE { // in d3d?
	FLOAT r;
	FLOAT g;
	FLOAT b;
	FLOAT a;
}

struct D2D_POINT_2U{
	UINT32 x;
	UINT32 y;
}

struct D2D_POINT_2F {
	FLOAT x;
	FLOAT y;
}

struct D2D_RECT_F {
	FLOAT left;
	FLOAT top;
	FLOAT right;
	FLOAT bottom;
}

struct D2D_RECT_U {
	UINT32 left;
	UINT32 top;
	UINT32 right;
	UINT32 bottom;
}

struct D2D_SIZE_F {
	FLOAT width;
	FLOAT height;
}

struct D2D_SIZE_U {
	UINT32 width;
	UINT32 height;
}

alias D3DCOLORVALUE D2D_COLOR_F;

struct  D2D_MATRIX_3X2_F {
	FLOAT _11;
	FLOAT _12;
	FLOAT _21;
	FLOAT _22;
	FLOAT _31;
	FLOAT _32;
}
