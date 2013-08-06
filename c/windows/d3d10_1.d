/** d3d10_1.d

Converted from 'd3d10_1.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.d3d10_1;


import c.windows.windef;
import c.windows.guiddef;
import c.windows.d3d10;
import c.windows.d3d10misc;
import c.windows.dxgiformat;
import c.windows.dxgi;


extern(C){

enum D3D10_1_DEFAULT_SAMPLE_MASK = 0xffffffff;
const float D3D10_1_FLOAT16_FUSED_TOLERANCE_IN_ULP = 0.6;
const float D3D10_1_FLOAT32_TO_INTEGER_TOLERANCE_IN_ULP = 0.6f;
enum {
	D3D10_1_GS_INPUT_REGISTER_COUNT                       = 32,
	D3D10_1_IA_VERTEX_INPUT_RESOURCE_SLOT_COUNT           = 32,
	D3D10_1_IA_VERTEX_INPUT_STRUCTURE_ELEMENTS_COMPONENTS = 128,
	D3D10_1_IA_VERTEX_INPUT_STRUCTURE_ELEMENT_COUNT       = 32,
	D3D10_1_PS_OUTPUT_MASK_REGISTER_COMPONENTS          = 1,
	D3D10_1_PS_OUTPUT_MASK_REGISTER_COMPONENT_BIT_COUNT = 32,
	D3D10_1_PS_OUTPUT_MASK_REGISTER_COUNT               = 1,
	D3D10_1_SHADER_MAJOR_VERSION = 4,
	D3D10_1_SHADER_MINOR_VERSION = 1,
	D3D10_1_SO_BUFFER_MAX_STRIDE_IN_BYTES       = 2048,
	D3D10_1_SO_BUFFER_MAX_WRITE_WINDOW_IN_BYTES = 256,
	D3D10_1_SO_BUFFER_SLOT_COUNT                = 4,
	D3D10_1_SO_MULTIPLE_BUFFER_ELEMENTS_PER_BUFFER = 1,
	D3D10_1_SO_SINGLE_BUFFER_COMPONENT_LIMIT = 64,
	D3D10_1_STANDARD_VERTEX_ELEMENT_COUNT = 32,
	D3D10_1_SUBPIXEL_FRACTIONAL_BIT_COUNT = 8,
	D3D10_1_VS_INPUT_REGISTER_COUNT = 32,
	D3D10_1_VS_OUTPUT_REGISTER_COUNT = 32,
}

enum {
	D3D10_FEATURE_LEVEL_10_0 = 0xa000,
	D3D10_FEATURE_LEVEL_10_1 = 0xa100,
	D3D10_FEATURE_LEVEL_9_1  = 0x9100,
	D3D10_FEATURE_LEVEL_9_2  = 0x9200,
	D3D10_FEATURE_LEVEL_9_3  = 0x9300
}
alias int D3D10_FEATURE_LEVEL1;

struct D3D10_RENDER_TARGET_BLEND_DESC1 {
	BOOL BlendEnable;
	D3D10_BLEND SrcBlend;
	D3D10_BLEND DestBlend;
	D3D10_BLEND_OP BlendOp;
	D3D10_BLEND SrcBlendAlpha;
	D3D10_BLEND DestBlendAlpha;
	D3D10_BLEND_OP BlendOpAlpha;
	UINT8 RenderTargetWriteMask;
}

struct D3D10_BLEND_DESC1 {
	BOOL AlphaToCoverageEnable;
	BOOL IndependentBlendEnable;
	D3D10_RENDER_TARGET_BLEND_DESC1[8] RenderTarget;
}

//MIDL_INTERFACE("EDAD8D99-8A35-4d6d-8566-2EA276CDE161")
interface ID3D10BlendState1 : ID3D10BlendState {
public extern(Windows):
	void GetDesc1(D3D10_BLEND_DESC1* pDesc);
}

struct D3D10_TEXCUBE_ARRAY_SRV1 {
	UINT MostDetailedMip;
	UINT MipLevels;
	UINT First2DArrayFace;
	UINT NumCubes;
}

enum {
	D3D10_1_SRV_DIMENSION_UNKNOWN          = 0,
	D3D10_1_SRV_DIMENSION_BUFFER           = 1,
	D3D10_1_SRV_DIMENSION_TEXTURE1D        = 2,
	D3D10_1_SRV_DIMENSION_TEXTURE1DARRAY   = 3,
	D3D10_1_SRV_DIMENSION_TEXTURE2D        = 4,
	D3D10_1_SRV_DIMENSION_TEXTURE2DARRAY   = 5,
	D3D10_1_SRV_DIMENSION_TEXTURE2DMS      = 6,
	D3D10_1_SRV_DIMENSION_TEXTURE2DMSARRAY = 7,
	D3D10_1_SRV_DIMENSION_TEXTURE3D        = 8,
	D3D10_1_SRV_DIMENSION_TEXTURECUBE      = 9,
	D3D10_1_SRV_DIMENSION_TEXTURECUBEARRAY = 10
}
alias int D3D10_SRV_DIMENSION1;

struct D3D10_SHADER_RESOURCE_VIEW_DESC1 {
	DXGI_FORMAT Format;
	D3D10_SRV_DIMENSION1 ViewDimension;
	union {
		D3D10_BUFFER_SRV Buffer;
		D3D10_TEX1D_SRV Texture1D;
		D3D10_TEX1D_ARRAY_SRV Texture1DArray;
		D3D10_TEX2D_SRV Texture2D;
		D3D10_TEX2D_ARRAY_SRV Texture2DArray;
		D3D10_TEX2DMS_SRV Texture2DMS;
		D3D10_TEX2DMS_ARRAY_SRV Texture2DMSArray;
		D3D10_TEX3D_SRV Texture3D;
		D3D10_TEXCUBE_SRV TextureCube;
		D3D10_TEXCUBE_ARRAY_SRV1 TextureCubeArray;
	}
}

//MIDL_INTERFACE("9B7E4C87-342C-4106-A19F-4F2704F689F0")
interface ID3D10ShaderResourceView1 : ID3D10ShaderResourceView {
public extern(Windows):
	void GetDesc1(D3D10_SHADER_RESOURCE_VIEW_DESC1* pDesc);
}

enum {
	D3D10_STANDARD_MULTISAMPLE_PATTERN = 0xffffffff,
	D3D10_CENTER_MULTISAMPLE_PATTERN   = 0xfffffffe
}
alias int D3D10_STANDARD_MULTISAMPLE_QUALITY_LEVELS;

//MIDL_INTERFACE("9B7E4C8F-342C-4106-A19F-4F2704F689F0")
interface ID3D10Device1 : ID3D10Device {
public extern(Windows):
	HRESULT SCreateShaderResourceView1(ID3D10Resource pResource, const(D3D10_SHADER_RESOURCE_VIEW_DESC1)* pDesc, ID3D10ShaderResourceView1* ppSRView);
	HRESULT CreateBlendState1(const(D3D10_BLEND_DESC1)* pBlendStateDesc, ID3D10BlendState1* ppBlendState);
	D3D10_FEATURE_LEVEL1 GetFeatureLevel();
}

enum D3D10_1_SDK_VERSION = 0 + 0x20;

alias extern(Windows) HRESULT function(IDXGIAdapter, D3D10_DRIVER_TYPE, HMODULE, UINT, D3D10_FEATURE_LEVEL1, UINT, ID3D10Device1*) PFN_D3D10_CREATE_DEVICE1;
export extern(Windows) HRESULT D3D10CreateDevice1(IDXGIAdapter pAdapter, D3D10_DRIVER_TYPE DriverType, HMODULE Software, UINT Flags, D3D10_FEATURE_LEVEL1 HardwareLevel, UINT SDKVersion, ID3D10Device1* ppDevice);
alias extern(Windows) HRESULT function(IDXGIAdapter, D3D10_DRIVER_TYPE, HMODULE, UINT, D3D10_FEATURE_LEVEL1, UINT, DXGI_SWAP_CHAIN_DESC*, IDXGISwapChain*, ID3D10Device1*) PFN_D3D10_CREATE_DEVICE_AND_SWAP_CHAIN1;
export extern(Windows) HRESULT D3D10CreateDeviceAndSwapChain1(IDXGIAdapter* pAdapter, D3D10_DRIVER_TYPE DriverType, HMODULE Software, UINT Flags, D3D10_FEATURE_LEVEL1 HardwareLevel, UINT SDKVersion, DXGI_SWAP_CHAIN_DESC* pSwapChainDesc, IDXGISwapChain* ppSwapChain, ID3D10Device1* ppDevice);

mixin DEFINE_GUID!("IID_ID3D10BlendState1" , 0xEDAD8D99, 0x8A35, 0x4d6d, 0x85, 0x66, 0x2E, 0xA2, 0x76, 0xCD, 0xE1, 0x61);
mixin DEFINE_GUID!("IID_ID3D10ShaderResourceView1", 0x9B7E4C87, 0x342C, 0x4106, 0xA1, 0x9F, 0x4F, 0x27, 0x04, 0xF6, 0x89, 0xF0);
mixin DEFINE_GUID!("IID_ID3D10Device1", 0x9B7E4C8F, 0x342C, 0x4106, 0xA1, 0x9F, 0x4F, 0x27, 0x04, 0xF6, 0x89, 0xF0);


} // extern(C)
