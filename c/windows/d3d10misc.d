/** d3d10misc.d

Converted from 'd3d10misc.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.d3d10misc;


import c.windows.windef;
import c.windows.guiddef;
import c.windows.unknwn;
import c.windows.dxgi;
import c.windows.d3d10;


alias ID3D10Blob LPD3D10BLOB;
mixin DEFINE_GUID!("IID_ID3D10Blob", 0x8ba5fb08, 0x5195, 0x40e2, 0xac, 0x58, 0xd, 0x98, 0x9c, 0x3a, 0x1, 0x2);
interface ID3D10Blob : IUnknown {
public extern(Windows):
	LPVOID GetBufferPointer();
	SIZE_T GetBufferSize();
}

extern(C){

enum {
	D3D10_DRIVER_TYPE_HARDWARE  = 0,
	D3D10_DRIVER_TYPE_REFERENCE = 1,
	D3D10_DRIVER_TYPE_NULL      = 2,
	D3D10_DRIVER_TYPE_SOFTWARE  = 3,
	D3D10_DRIVER_TYPE_WARP      = 5,
}
alias int D3D10_DRIVER_TYPE;

mixin DEFINE_GUID!("GUID_DeviceType", 0xd722fb4d, 0x7a68, 0x437a, 0xb2, 0x0c, 0x58, 0x04, 0xee, 0x24, 0x94, 0xa6);

export extern(Windows) HRESULT D3D10CreateDevice(IDXGIAdapter pAdapter, D3D10_DRIVER_TYPE DriverType, HMODULE Software, UINT Flags, UINT SDKVersion, ID3D10Device* ppDevice);
export extern(Windows) HRESULT D3D10CreateDeviceAndSwapChain(IDXGIAdapter pAdapter, D3D10_DRIVER_TYPE DriverType, HMODULE Software, UINT Flags, UINT SDKVersion, DXGI_SWAP_CHAIN_DESC* pSwapChainDesc, IDXGISwapChain* ppSwapChain, ID3D10Device* ppDevice);
export extern(Windows) HRESULT D3D10CreateBlob(SIZE_T NumBytes, LPD3D10BLOB* ppBuffer);

} // extern(C)

