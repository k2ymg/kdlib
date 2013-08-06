/** dxgi.d

Converted from 'dxgi.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.dxgi;


import c.windows.windef;
import c.windows.guiddef;
import c.windows.unknwn;
import c.windows.dxgitype;
import c.windows.dxgiformat;


extern(C){

enum {
	DXGI_CPU_ACCESS_NONE            =  0 ,
	DXGI_CPU_ACCESS_DYNAMIC         =  1 ,
	DXGI_CPU_ACCESS_READ_WRITE      =  2 ,
	DXGI_CPU_ACCESS_SCRATCH         =  3 ,
	DXGI_CPU_ACCESS_FIELD           = 15,
	DXGI_USAGE_SHADER_INPUT         =  1 << (0 + 4),
	DXGI_USAGE_RENDER_TARGET_OUTPUT =  1 << (1 + 4),
	DXGI_USAGE_BACK_BUFFER          =  1 << (2 + 4),
	DXGI_USAGE_SHARED               =  1 << (3 + 4),
	DXGI_USAGE_READ_ONLY            =  1 << (4 + 4),
	DXGI_USAGE_DISCARD_ON_PRESENT   =  1 << (5 + 4),
	DXGI_USAGE_UNORDERED_ACCESS     =  1 << (6 + 4),
}
alias UINT DXGI_USAGE;

struct DXGI_FRAME_STATISTICS {
	UINT PresentCount;
	UINT PresentRefreshCount;
	UINT SyncRefreshCount;
	LARGE_INTEGER SyncQPCTime;
	LARGE_INTEGER SyncGPUTime;
}

struct DXGI_MAPPED_RECT {
	INT Pitch;
	BYTE* pBits;
}

struct DXGI_ADAPTER_DESC {
	WCHAR[128] Description;
	UINT VendorId;
	UINT DeviceId;
	UINT SubSysId;
	UINT Revision;
	SIZE_T DedicatedVideoMemory;
	SIZE_T DedicatedSystemMemory;
	SIZE_T SharedSystemMemory;
	LUID AdapterLuid;
}

struct DXGI_OUTPUT_DESC {
	WCHAR[32] DeviceName;
	RECT DesktopCoordinates;
	BOOL AttachedToDesktop;
	DXGI_MODE_ROTATION Rotation;
	HMONITOR Monitor;
}

struct DXGI_SHARED_RESOURCE {
	HANDLE Handle;
}

enum {
	DXGI_RESOURCE_PRIORITY_MINIMUM = 0x28000000,
	DXGI_RESOURCE_PRIORITY_LOW     = 0x50000000,
	DXGI_RESOURCE_PRIORITY_NORMAL  = 0x78000000,
	DXGI_RESOURCE_PRIORITY_HIGH    = 0xa0000000,
	DXGI_RESOURCE_PRIORITY_MAXIMUM = 0xc8000000,
}

enum {
	DXGI_RESIDENCY_FULLY_RESIDENT            = 1,
	DXGI_RESIDENCY_RESIDENT_IN_SHARED_MEMORY = 2,
	DXGI_RESIDENCY_EVICTED_TO_DISK           = 3
}
alias int DXGI_RESIDENCY;

struct DXGI_SURFACE_DESC {
	UINT Width;
	UINT Height;
	DXGI_FORMAT Format;
	DXGI_SAMPLE_DESC SampleDesc;
}

enum {
	DXGI_SWAP_EFFECT_DISCARD    = 0,
	DXGI_SWAP_EFFECT_SEQUENTIAL = 1
}
alias int DXGI_SWAP_EFFECT;

enum {
	DXGI_SWAP_CHAIN_FLAG_NONPREROTATED     = 1,
	DXGI_SWAP_CHAIN_FLAG_ALLOW_MODE_SWITCH = 2,
	DXGI_SWAP_CHAIN_FLAG_GDI_COMPATIBLE    = 4
}
alias int DXGI_SWAP_CHAIN_FLAG;

struct DXGI_SWAP_CHAIN_DESC {
	DXGI_MODE_DESC BufferDesc;
	DXGI_SAMPLE_DESC SampleDesc;
	DXGI_USAGE BufferUsage;
	UINT BufferCount;
	HWND OutputWindow;
	BOOL Windowed;
	DXGI_SWAP_EFFECT SwapEffect;
	UINT Flags;
}

//MIDL_INTERFACE("aec22fb8-76f3-4639-9be0-28eb43a67a2e")
interface IDXGIObject : IUnknown {
public extern(Windows):
	HRESULT SetPrivateData(REFGUID Name, UINT DataSize, const(void)* pData);
	HRESULT SetPrivateDataInterface(REFGUID Name, const(IUnknown) pUnknown);
	HRESULT GetPrivateData(REFGUID Name, UINT* pDataSize, void* pData);
	HRESULT GetParent(REFIID riid, void** ppParent);
}

//MIDL_INTERFACE("3d3e0379-f9de-4d58-bb6c-18d62992f1a6")
interface IDXGIDeviceSubObject : IDXGIObject {
public extern(Windows):
	HRESULT GetDevice(REFIID riid, void** ppDevice);
}

//MIDL_INTERFACE("035f3ab4-482e-4e50-b41f-8a7f8bd8960b")
interface IDXGIResource : IDXGIDeviceSubObject {
public extern(Windows):
	HRESULT GetSharedHandle(HANDLE* pSharedHandle);
	HRESULT GetUsage(DXGI_USAGE* pUsage);
	HRESULT SetEvictionPriority(UINT EvictionPriority);
	HRESULT GetEvictionPriority(UINT* pEvictionPriority);
}

//MIDL_INTERFACE("9d8e1289-d7b3-465f-8126-250e349af85d")
interface IDXGIKeyedMutex : IDXGIDeviceSubObject {
public extern(Windows):
	HRESULT AcquireSync(UINT64 Key, DWORD dwMilliseconds);
	HRESULT ReleaseSync(UINT64 Key);
}

enum {
	DXGI_MAP_READ    = 1U,
	DXGI_MAP_WRITE   = 2U,
	DXGI_MAP_DISCARD = 4U,
}

//MIDL_INTERFACE("cafcb56c-6ac3-4889-bf47-9e23bbd260ec")
interface IDXGISurface : IDXGIDeviceSubObject {
public extern(Windows):
	HRESULT GetDesc(DXGI_SURFACE_DESC* pDesc);
	HRESULT Map(DXGI_MAPPED_RECT* pLockedRect, UINT MapFlags);
	HRESULT Unmap();
}

//MIDL_INTERFACE("4AE63092-6327-4c1b-80AE-BFE12EA32B86")
interface IDXGISurface1 : IDXGISurface {
public extern(Windows):
	HRESULT GetDC(BOOL Discard, HDC* phdc);
	HRESULT ReleaseDC(RECT* pDirtyRect);
}

//MIDL_INTERFACE("2411e7e1-12ac-4ccf-bd14-9798e8534dc0")
interface IDXGIAdapter : IDXGIObject {
public extern(Windows):
	HRESULT EnumOutputs(UINT Output, IDXGIOutput* ppOutput);
	HRESULT GetDesc(DXGI_ADAPTER_DESC* pDesc);
	HRESULT CheckInterfaceSupport(REFGUID InterfaceName, LARGE_INTEGER* pUMDVersion);
}

enum {
	DXGI_ENUM_MODES_INTERLACED = 1U,
	DXGI_ENUM_MODES_SCALING    = 2U,
}

//MIDL_INTERFACE("ae02eedb-c735-4690-8d52-5a8dc20213aa")
interface IDXGIOutput : IDXGIObject {
public extern(Windows):
	HRESULT GetDesc(DXGI_OUTPUT_DESC* pDesc);
	HRESULT GetDisplayModeList(DXGI_FORMAT EnumFormat, UINT Flags, UINT* pNumModes, DXGI_MODE_DESC* pDesc);
	HRESULT FindClosestMatchingMode(const(DXGI_MODE_DESC)* pModeToMatch, DXGI_MODE_DESC* pClosestMatch, IUnknown pConcernedDevice);
	HRESULT WaitForVBlank();
	HRESULT TakeOwnership(IUnknown pDevice, BOOL Exclusive);
	void ReleaseOwnership();
	HRESULT GetGammaControlCapabilities(DXGI_GAMMA_CONTROL_CAPABILITIES* pGammaCaps);
	HRESULT SetGammaControl(const(DXGI_GAMMA_CONTROL)* pArray);
	HRESULT GetGammaControl(DXGI_GAMMA_CONTROL pArray);
	HRESULT SetDisplaySurface(IDXGISurface pScanoutSurface);
	HRESULT GetDisplaySurfaceData(IDXGISurface pDestination);
	HRESULT GetFrameStatistics(DXGI_FRAME_STATISTICS* pStats);
}

enum {
	DXGI_MAX_SWAP_CHAIN_BUFFERS  = 16,
	DXGI_PRESENT_TEST            = 0x00000001U,
	DXGI_PRESENT_DO_NOT_SEQUENCE = 0x00000002U,
	DXGI_PRESENT_RESTART         = 0x00000004U,
}

//MIDL_INTERFACE("310d36a0-d2e7-4c0a-aa04-6a9d23b8886a")
interface IDXGISwapChain : IDXGIDeviceSubObject {
public extern(Windows):
	HRESULT Present(UINT SyncInterval, UINT Flags);
	HRESULT GetBuffer(UINT Buffer, REFIID riid, void** ppSurface);
	HRESULT SetFullscreenState(BOOL Fullscreen, IDXGIOutput pTarget);
	HRESULT GetFullscreenState(BOOL* pFullscreen, IDXGIOutput* ppTarget);
	HRESULT GetDesc(DXGI_SWAP_CHAIN_DESC* pDesc);
	HRESULT ResizeBuffers(UINT BufferCount, UINT Width, UINT Height, DXGI_FORMAT NewFormat, UINT SwapChainFlags);
	HRESULT ResizeTarget(const(DXGI_MODE_DESC)* pNewTargetParameters);
	HRESULT GetContainingOutput(IDXGIOutput* ppOutput);
	HRESULT GetFrameStatistics(DXGI_FRAME_STATISTICS* pStats);
	HRESULT GetLastPresentCount(UINT* pLastPresentCount);
}

enum {
	DXGI_MWA_NO_WINDOW_CHANGES = 1 << 0,
	DXGI_MWA_NO_ALT_ENTER      = 1 << 1,
	DXGI_MWA_NO_PRINT_SCREEN   = 1 << 2,
	DXGI_MWA_VALID             = 0x7,
}

//MIDL_INTERFACE("7b7166ec-21c7-44ae-b21a-c9ae321ae369")
interface IDXGIFactory : IDXGIObject {
public extern(Windows):
	HRESULT EnumAdapters(UINT Adapter, IDXGIAdapter* ppAdapter);
	HRESULT MakeWindowAssociation(HWND WindowHandle, UINT Flags);
	HRESULT GetWindowAssociation(HWND* pWindowHandle);
	HRESULT CreateSwapChain(IUnknown pDevice, DXGI_SWAP_CHAIN_DESC* pDesc, IDXGISwapChain* ppSwapChain);
	HRESULT CreateSoftwareAdapter(HMODULE Module, IDXGIAdapter* ppAdapter);
}

export extern(Windows) HRESULT CreateDXGIFactory(REFIID riid, void** ppFactory);
export extern(Windows) HRESULT CreateDXGIFactory1(REFIID riid, void** ppFactory);

//MIDL_INTERFACE("54ec77fa-1377-44e6-8c32-88fd5f44c84c")
interface IDXGIDevice : IDXGIObject {
public extern(Windows):
	HRESULT GetAdapter(IDXGIAdapter* pAdapter);
	HRESULT CreateSurface(const(DXGI_SURFACE_DESC)* pDesc, UINT NumSurfaces, DXGI_USAGE Usage, const(DXGI_SHARED_RESOURCE)* pSharedResource, IDXGISurface* ppSurface);
	HRESULT QueryResourceResidency(const(IUnknown)* ppResources, DXGI_RESIDENCY* pResidencyStatus, UINT NumResources);
	HRESULT SetGPUThreadPriority(INT Priority);
	HRESULT GetGPUThreadPriority(INT* pPriority);
}

enum {
	DXGI_ADAPTER_FLAG_NONE        = 0,
	DXGI_ADAPTER_FLAG_REMOTE      = 1,
	DXGI_ADAPTER_FLAG_FORCE_DWORD = 0xffffffff
}
alias int DXGI_ADAPTER_FLAG;

struct DXGI_ADAPTER_DESC1 {
	WCHAR[128] Description;
	UINT VendorId;
	UINT DeviceId;
	UINT SubSysId;
	UINT Revision;
	SIZE_T DedicatedVideoMemory;
	SIZE_T DedicatedSystemMemory;
	SIZE_T SharedSystemMemory;
	LUID AdapterLuid;
	UINT Flags;
}

struct DXGI_DISPLAY_COLOR_SPACE {
	FLOAT[8][2] PrimaryCoordinates;
	FLOAT[16][2] WhitePoints;
}

//MIDL_INTERFACE("770aae78-f26f-4dba-a829-253c83d1b387")
interface IDXGIFactory1 : IDXGIFactory {
public extern(Windows):
	HRESULT EnumAdapters1(UINT Adapter, IDXGIAdapter1* ppAdapter);
	BOOL IsCurrent();
}

//MIDL_INTERFACE("29038f61-3839-4626-91fd-086879011a05")
interface IDXGIAdapter1 : IDXGIAdapter {
public extern(Windows):
	HRESULT GetDesc1(DXGI_ADAPTER_DESC1* pDesc);
}

//MIDL_INTERFACE("77db970f-6276-48ba-ba28-070143b4392c")
interface IDXGIDevice1 : IDXGIDevice {
public extern(Windows):
	HRESULT SetMaximumFrameLatency(UINT MaxLatency);
	HRESULT GetMaximumFrameLatency(UINT* pMaxLatency);
}

mixin DEFINE_GUID!("IID_IDXGIObject", 0xaec22fb8, 0x76f3, 0x4639, 0x9b, 0xe0, 0x28, 0xeb, 0x43, 0xa6, 0x7a, 0x2e);
mixin DEFINE_GUID!("IID_IDXGIDeviceSubObject", 0x3d3e0379, 0xf9de, 0x4d58, 0xbb, 0x6c, 0x18, 0xd6, 0x29, 0x92, 0xf1, 0xa6);
mixin DEFINE_GUID!("IID_IDXGIResource", 0x035f3ab4, 0x482e, 0x4e50, 0xb4, 0x1f, 0x8a, 0x7f, 0x8b, 0xd8, 0x96, 0x0b);
mixin DEFINE_GUID!("IID_IDXGIKeyedMutex", 0x9d8e1289, 0xd7b3, 0x465f, 0x81, 0x26, 0x25, 0x0e, 0x34, 0x9a, 0xf8, 0x5d);
mixin DEFINE_GUID!("IID_IDXGISurface", 0xcafcb56c, 0x6ac3, 0x4889, 0xbf, 0x47, 0x9e, 0x23, 0xbb, 0xd2, 0x60, 0xec);
mixin DEFINE_GUID!("IID_IDXGISurface1", 0x4AE63092, 0x6327, 0x4c1b, 0x80, 0xAE, 0xBF, 0xE1, 0x2E, 0xA3, 0x2B, 0x86);
mixin DEFINE_GUID!("IID_IDXGIAdapter", 0x2411e7e1, 0x12ac, 0x4ccf, 0xbd, 0x14, 0x97, 0x98, 0xe8, 0x53, 0x4d, 0xc0);
mixin DEFINE_GUID!("IID_IDXGIOutput", 0xae02eedb, 0xc735, 0x4690, 0x8d, 0x52, 0x5a, 0x8d, 0xc2, 0x02, 0x13, 0xaa);
mixin DEFINE_GUID!("IID_IDXGISwapChain", 0x310d36a0, 0xd2e7, 0x4c0a, 0xaa, 0x04, 0x6a, 0x9d, 0x23, 0xb8, 0x88, 0x6a);
mixin DEFINE_GUID!("IID_IDXGIFactory", 0x7b7166ec, 0x21c7, 0x44ae, 0xb2, 0x1a, 0xc9, 0xae, 0x32, 0x1a, 0xe3, 0x69);
mixin DEFINE_GUID!("IID_IDXGIDevice", 0x54ec77fa, 0x1377, 0x44e6, 0x8c, 0x32, 0x88, 0xfd, 0x5f, 0x44, 0xc8, 0x4c);
mixin DEFINE_GUID!("IID_IDXGIFactory1", 0x770aae78, 0xf26f, 0x4dba, 0xa8, 0x29, 0x25, 0x3c, 0x83, 0xd1, 0xb3, 0x87);
mixin DEFINE_GUID!("IID_IDXGIAdapter1", 0x29038f61, 0x3839, 0x4626, 0x91, 0xfd, 0x08, 0x68, 0x79, 0x01, 0x1a, 0x05);
mixin DEFINE_GUID!("IID_IDXGIDevice1", 0x77db970f, 0x6276, 0x48ba, 0xba, 0x28, 0x07, 0x01, 0x43, 0xb4, 0x39, 0x2c);

} // extern(C)
