/** msr_nuiprops.d

Converted from 'MSR_NuiProps.h'.

Version: Beta
Authors: Koji Kishita
*/
module c.windows.kinect.msr_nuiprops;


import c.windows.windef;


enum {
	INDEX_UNIQUE_DEVICE_NAME = 0,
	INDEX_LAST
}
alias int NUI_PROPSINDEX;

enum {
	PROPTYPE_UNKNOWN = 0,
	PROPTYPE_UINT,
	PROPTYPE_FLOAT,
	PROPTYPE_BSTR,
	PROPTYPE_BLOB
}
alias int NUI_PROPSTYPE;

align(8)
struct NUI_PROPTYPEANDSIZE {
	NUI_PROPSINDEX index;
	NUI_PROPSTYPE type;
	size_t size;
}

immutable(NUI_PROPTYPEANDSIZE[]) g_spNuiPropsType = [
	{INDEX_UNIQUE_DEVICE_NAME, PROPTYPE_BSTR, HANDLE.sizeof},
];
