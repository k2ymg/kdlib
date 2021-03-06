/** d3d10shader.d

Converted from 'd3d10shader.h'.

Version: DirectX 11 SDK February 2010
Authors: Koji Kishita
*/
module c.windows.d3d10shader;


import c.windows.windef;
import c.windows.guiddef;
import c.windows.unknwn;
import c.windows.d3d10;
import c.windows.d3d10misc;


/*
uint D3D10_TX_VERSION(_Major, _Minor)
{
	return (('T' << 24) | ('X' << 16) | ((_Major) << 8) | (_Minor));
}*/

enum {
	D3D10_SHADER_DEBUG                          = 1 << 0,
	D3D10_SHADER_SKIP_VALIDATION                = 1 << 1,
	D3D10_SHADER_SKIP_OPTIMIZATION              = 1 << 2,
	D3D10_SHADER_PACK_MATRIX_ROW_MAJOR          = 1 << 3,
	D3D10_SHADER_PACK_MATRIX_COLUMN_MAJOR       = 1 << 4,
	D3D10_SHADER_PARTIAL_PRECISION              = 1 << 5,
	D3D10_SHADER_FORCE_VS_SOFTWARE_NO_OPT       = 1 << 6,
	D3D10_SHADER_FORCE_PS_SOFTWARE_NO_OPT       = 1 << 7,
	D3D10_SHADER_NO_PRESHADER                   = 1 << 8,
	D3D10_SHADER_AVOID_FLOW_CONTROL             = 1 << 9,
	D3D10_SHADER_PREFER_FLOW_CONTROL            = 1 << 10,
	D3D10_SHADER_ENABLE_STRICTNESS              = 1 << 11,
	D3D10_SHADER_ENABLE_BACKWARDS_COMPATIBILITY = 1 << 12,
	D3D10_SHADER_IEEE_STRICTNESS                = 1 << 13,
	D3D10_SHADER_WARNINGS_ARE_ERRORS            = 1 << 18,
	D3D10_SHADER_OPTIMIZATION_LEVEL0            = 1 << 14,
	D3D10_SHADER_OPTIMIZATION_LEVEL1            = 0,
	D3D10_SHADER_OPTIMIZATION_LEVEL2            = (1 << 14) | (1 << 15),
	D3D10_SHADER_OPTIMIZATION_LEVEL3            = 1 << 15,
}

struct D3D10_SHADER_MACRO {
	LPCSTR Name;
	LPCSTR Definition;
}
alias D3D10_SHADER_MACRO* LPD3D10_SHADER_MACRO;

enum {
	D3D10_SVC_SCALAR,
	D3D10_SVC_VECTOR,
	D3D10_SVC_MATRIX_ROWS,
	D3D10_SVC_MATRIX_COLUMNS,
	D3D10_SVC_OBJECT,
	D3D10_SVC_STRUCT,
	D3D11_SVC_INTERFACE_CLASS,
	D3D11_SVC_INTERFACE_POINTER,
	D3D10_SVC_FORCE_DWORD = 0x7fffffff
}
alias int D3D10_SHADER_VARIABLE_CLASS;
alias D3D10_SHADER_VARIABLE_CLASS* LPD3D10_SHADER_VARIABLE_CLASS;

enum {
	D3D10_SVF_USERPACKED           = 1,
	D3D10_SVF_USED                 = 2,
	D3D11_SVF_INTERFACE_POINTER    = 4,
	D3D11_SVF_INTERFACE_PARAMETER  = 8,
	D3D10_SVF_FORCE_DWORD          = 0x7fffffff
}
alias int D3D10_SHADER_VARIABLE_FLAGS;
alias D3D10_SHADER_VARIABLE_FLAGS* LPD3D10_SHADER_VARIABLE_FLAGS;

enum {
	D3D10_SVT_VOID               = 0,
	D3D10_SVT_BOOL               = 1,
	D3D10_SVT_INT                = 2,
	D3D10_SVT_FLOAT              = 3,
	D3D10_SVT_STRING             = 4,
	D3D10_SVT_TEXTURE            = 5,
	D3D10_SVT_TEXTURE1D          = 6,
	D3D10_SVT_TEXTURE2D          = 7,
	D3D10_SVT_TEXTURE3D          = 8,
	D3D10_SVT_TEXTURECUBE        = 9,
	D3D10_SVT_SAMPLER            = 10,
	D3D10_SVT_PIXELSHADER        = 15,
	D3D10_SVT_VERTEXSHADER       = 16,
	D3D10_SVT_UINT               = 19,
	D3D10_SVT_UINT8              = 20,
	D3D10_SVT_GEOMETRYSHADER     = 21,
	D3D10_SVT_RASTERIZER         = 22,
	D3D10_SVT_DEPTHSTENCIL       = 23,
	D3D10_SVT_BLEND              = 24,
	D3D10_SVT_BUFFER             = 25,
	D3D10_SVT_CBUFFER            = 26,
	D3D10_SVT_TBUFFER            = 27,
	D3D10_SVT_TEXTURE1DARRAY     = 28,
	D3D10_SVT_TEXTURE2DARRAY     = 29,
	D3D10_SVT_RENDERTARGETVIEW   = 30,
	D3D10_SVT_DEPTHSTENCILVIEW   = 31,
	D3D10_SVT_TEXTURE2DMS        = 32,
	D3D10_SVT_TEXTURE2DMSARRAY   = 33,
	D3D10_SVT_TEXTURECUBEARRAY   = 34,
	D3D11_SVT_HULLSHADER         = 35,
	D3D11_SVT_DOMAINSHADER       = 36,
	D3D11_SVT_INTERFACE_POINTER  = 37,
	D3D11_SVT_COMPUTESHADER      = 38,
	D3D11_SVT_DOUBLE             = 39,
	D3D11_SVT_RWTEXTURE1D,
	D3D11_SVT_RWTEXTURE1DARRAY,
	D3D11_SVT_RWTEXTURE2D,
	D3D11_SVT_RWTEXTURE2DARRAY,
	D3D11_SVT_RWTEXTURE3D,
	D3D11_SVT_RWBUFFER,
	D3D11_SVT_BYTEADDRESS_BUFFER,
	D3D11_SVT_RWBYTEADDRESS_BUFFER,
	D3D11_SVT_STRUCTURED_BUFFER,
	D3D11_SVT_RWSTRUCTURED_BUFFER,
	D3D11_SVT_APPEND_STRUCTURED_BUFFER,
	D3D11_SVT_CONSUME_STRUCTURED_BUFFER,
	D3D10_SVT_FORCE_DWORD = 0x7fffffff
}
alias int D3D10_SHADER_VARIABLE_TYPE;
alias D3D10_SHADER_VARIABLE_TYPE* LPD3D10_SHADER_VARIABLE_TYPE;

enum {
	D3D10_SIF_USERPACKED           = 1,
	D3D10_SIF_COMPARISON_SAMPLER   = 2,
	D3D10_SIF_TEXTURE_COMPONENT_0  = 4,
	D3D10_SIF_TEXTURE_COMPONENT_1  = 8,
	D3D10_SIF_TEXTURE_COMPONENTS   = 12,
	D3D10_SIF_FORCE_DWORD          = 0x7fffffff
}
alias int D3D10_SHADER_INPUT_FLAGS;
alias D3D10_SHADER_INPUT_FLAGS* LPD3D10_SHADER_INPUT_FLAGS;

enum {
	D3D10_SIT_CBUFFER,
	D3D10_SIT_TBUFFER,
	D3D10_SIT_TEXTURE,
	D3D10_SIT_SAMPLER,
	D3D11_SIT_UAV_RWTYPED,
	D3D11_SIT_STRUCTURED,
	D3D11_SIT_UAV_RWSTRUCTURED,
	D3D11_SIT_BYTEADDRESS,
	D3D11_SIT_UAV_RWBYTEADDRESS,
	D3D11_SIT_UAV_APPEND_STRUCTURED,
	D3D11_SIT_UAV_CONSUME_STRUCTURED,
	D3D11_SIT_UAV_RWSTRUCTURED_WITH_COUNTER,
}
alias int D3D10_SHADER_INPUT_TYPE;
alias D3D10_SHADER_INPUT_TYPE* LPD3D10_SHADER_INPUT_TYPE;

enum {
	D3D10_CBF_USERPACKED = 1,
	D3D10_CBF_FORCE_DWORD = 0x7fffffff
}
alias int D3D10_SHADER_CBUFFER_FLAGS;
alias D3D10_SHADER_CBUFFER_FLAGS* LPD3D10_SHADER_CBUFFER_FLAGS;

enum {
	D3D10_CT_CBUFFER,
	D3D10_CT_TBUFFER,
}
alias int D3D10_CBUFFER_TYPE;
alias D3D10_CBUFFER_TYPE* LPD3D10_CBUFFER_TYPE;

enum {
	D3D10_NAME_UNDEFINED                      = 0,
	D3D10_NAME_POSITION                       = 1,
	D3D10_NAME_CLIP_DISTANCE                  = 2,
	D3D10_NAME_CULL_DISTANCE                  = 3,
	D3D10_NAME_RENDER_TARGET_ARRAY_INDEX      = 4,
	D3D10_NAME_VIEWPORT_ARRAY_INDEX           = 5,
	D3D10_NAME_VERTEX_ID                      = 6,
	D3D10_NAME_PRIMITIVE_ID                   = 7,
	D3D10_NAME_INSTANCE_ID                    = 8,
	D3D10_NAME_IS_FRONT_FACE                  = 9,
	D3D10_NAME_SAMPLE_INDEX                   = 10,
	D3D11_NAME_FINAL_QUAD_EDGE_TESSFACTOR     = 11,
	D3D11_NAME_FINAL_QUAD_INSIDE_TESSFACTOR   = 12,
	D3D11_NAME_FINAL_TRI_EDGE_TESSFACTOR      = 13,
	D3D11_NAME_FINAL_TRI_INSIDE_TESSFACTOR    = 14,
	D3D11_NAME_FINAL_LINE_DETAIL_TESSFACTOR   = 15,
	D3D11_NAME_FINAL_LINE_DENSITY_TESSFACTOR  = 16,
	D3D10_NAME_TARGET                         = 64,
	D3D10_NAME_DEPTH                          = 65,
	D3D10_NAME_COVERAGE                       = 66,
	D3D11_NAME_DEPTH_GREATER_EQUAL            = 67,
	D3D11_NAME_DEPTH_LESS_EQUAL               = 68,
}
alias int D3D10_NAME;

enum {
	D3D10_RETURN_TYPE_UNORM  = 1,
	D3D10_RETURN_TYPE_SNORM  = 2,
	D3D10_RETURN_TYPE_SINT   = 3,
	D3D10_RETURN_TYPE_UINT   = 4,
	D3D10_RETURN_TYPE_FLOAT  = 5,
	D3D10_RETURN_TYPE_MIXED  = 6,
}
alias int D3D10_RESOURCE_RETURN_TYPE;

enum  {
	D3D10_REGISTER_COMPONENT_UNKNOWN  = 0,
	D3D10_REGISTER_COMPONENT_UINT32   = 1,
	D3D10_REGISTER_COMPONENT_SINT32   = 2,
	D3D10_REGISTER_COMPONENT_FLOAT32  = 3
}
alias int D3D10_REGISTER_COMPONENT_TYPE;

enum {
	D3D10_INCLUDE_LOCAL,
	D3D10_INCLUDE_SYSTEM,
	D3D10_INCLUDE_FORCE_DWORD = 0x7fffffff
}
alias int D3D10_INCLUDE_TYPE;
alias D3D10_INCLUDE_TYPE* LPD3D10_INCLUDE_TYPE;

interface ID3D10Include {
public extern(Windows):
	HRESULT Open(D3D10_INCLUDE_TYPE IncludeType, LPCSTR pFileName, LPCVOID pParentData, LPCVOID* ppData, UINT* pBytes);
	HRESULT Close(LPCVOID pData);
}

struct D3D10_SHADER_DESC {
	UINT Version;
	LPCSTR Creator;
	UINT Flags;
	UINT ConstantBuffers;
	UINT BoundResources;
	UINT InputParameters;
	UINT OutputParameters;
	UINT InstructionCount;
	UINT TempRegisterCount;
	UINT TempArrayCount;
	UINT DefCount;
	UINT DclCount;
	UINT TextureNormalInstructions;
	UINT TextureLoadInstructions;
	UINT TextureCompInstructions;
	UINT TextureBiasInstructions;
	UINT TextureGradientInstructions;
	UINT FloatInstructionCount;
	UINT IntInstructionCount;
	UINT UintInstructionCount;
	UINT StaticFlowControlCount;
	UINT DynamicFlowControlCount;
	UINT MacroInstructionCount;
	UINT ArrayInstructionCount;
	UINT CutInstructionCount;
	UINT EmitInstructionCount;
	D3D10_PRIMITIVE_TOPOLOGY GSOutputTopology;
	UINT GSMaxOutputVertexCount;
}

struct D3D10_SHADER_BUFFER_DESC {
	LPCSTR Name;
	D3D10_CBUFFER_TYPE Type;
	UINT Variables;
	UINT Size;
	UINT uFlags;
}

struct D3D10_SHADER_VARIABLE_DESC {
	LPCSTR Name;
	UINT StartOffset;
	UINT Size;
	UINT uFlags;
	LPVOID DefaultValue;
}

struct D3D10_SHADER_TYPE_DESC {
	D3D10_SHADER_VARIABLE_CLASS Class;
	D3D10_SHADER_VARIABLE_TYPE Type;
	UINT Rows;
	UINT Columns;
	UINT Elements;
	UINT Members;
	UINT Offset;
}

struct D3D10_SHADER_INPUT_BIND_DESC {
	LPCSTR Name;
	D3D10_SHADER_INPUT_TYPE Type;
	UINT BindPoint;
	UINT BindCount;
	UINT uFlags;
	D3D10_RESOURCE_RETURN_TYPE ReturnType;
	D3D10_SRV_DIMENSION Dimension;
	UINT NumSamples;
}

struct D3D10_SIGNATURE_PARAMETER_DESC {
	LPCSTR SemanticName;
	UINT SemanticIndex;
	UINT Register;
	D3D10_NAME SystemValueType;
	D3D10_REGISTER_COMPONENT_TYPE ComponentType;
	BYTE Mask;
	BYTE ReadWriteMask;
}

mixin DEFINE_GUID!("IID_ID3D10ShaderReflectionType", 0xc530ad7d, 0x9b16, 0x4395, 0xa9, 0x79, 0xba, 0x2e, 0xcf, 0xf8, 0x3a, 0xdd);
interface ID3D10ShaderReflectionType {
public extern(Windows):
	HRESULT GetDesc(D3D10_SHADER_TYPE_DESC* pDesc);
	ID3D10ShaderReflectionType GetMemberTypeByIndex(UINT Index);
	ID3D10ShaderReflectionType GetMemberTypeByName(LPCSTR Name);
	LPCSTR GetMemberTypeName(UINT Index);
}

mixin DEFINE_GUID!("IID_ID3D10ShaderReflectionVariable", 0x1bf63c95, 0x2650, 0x405d, 0x99, 0xc1, 0x36, 0x36, 0xbd, 0x1d, 0xa0, 0xa1);
interface ID3D10ShaderReflectionVariable {
public extern(Windows):
	HRESULT GetDesc(D3D10_SHADER_VARIABLE_DESC* pDesc);
	ID3D10ShaderReflectionType GetType();
}

mixin DEFINE_GUID!("IID_ID3D10ShaderReflectionConstantBuffer", 0x66c66a94, 0xdddd, 0x4b62, 0xa6, 0x6a, 0xf0, 0xda, 0x33, 0xc2, 0xb4, 0xd0);

interface ID3D10ShaderReflectionConstantBuffer {
public extern(Windows):
	HRESULT GetDesc(D3D10_SHADER_BUFFER_DESC* pDesc);
	ID3D10ShaderReflectionVariable GetVariableByIndex(UINT Index);
	ID3D10ShaderReflectionVariable GetVariableByName(LPCSTR Name);
}

mixin DEFINE_GUID!("IID_ID3D10ShaderReflection", 0xd40e20b6, 0xf8f7, 0x42ad, 0xab, 0x20, 0x4b, 0xaf, 0x8f, 0x15, 0xdf, 0xaa);
interface ID3D10ShaderReflection : IUnknown {
public extern(Windows):
	HRESULT QueryInterface(REFIID iid, LPVOID* ppv);
	ULONG AddRef();
	ULONG Release();

	HRESULT GetDesc(D3D10_SHADER_DESC* pDesc);
	ID3D10ShaderReflectionConstantBuffer GetConstantBufferByIndex(UINT Index);
	ID3D10ShaderReflectionConstantBuffer GetConstantBufferByName(LPCSTR Name);
	HRESULT GetResourceBindingDesc(UINT ResourceIndex, D3D10_SHADER_INPUT_BIND_DESC* pDesc);
	HRESULT GetInputParameterDesc(UINT ParameterIndex, D3D10_SIGNATURE_PARAMETER_DESC* pDesc);
	HRESULT GetOutputParameterDesc(UINT ParameterIndex, D3D10_SIGNATURE_PARAMETER_DESC* pDesc);
}

extern(Windows){
HRESULT D3D10CompileShader(LPCSTR pSrcData, SIZE_T SrcDataLen, LPCSTR pFileName, const(D3D10_SHADER_MACRO)* pDefines, ID3D10Include pInclude, LPCSTR pFunctionName, LPCSTR pProfile, UINT Flags, ID3D10Blob* ppShader, ID3D10Blob* ppErrorMsgs);
HRESULT D3D10DisassembleShader(const(void)* pShader, SIZE_T BytecodeLength, BOOL EnableColorCode, LPCSTR pComments, ID3D10Blob* ppDisassembly);
LPCSTR D3D10GetPixelShaderProfile(ID3D10Device pDevice);
LPCSTR D3D10GetVertexShaderProfile(ID3D10Device pDevice);
LPCSTR D3D10GetGeometryShaderProfile(ID3D10Device pDevice);
HRESULT D3D10ReflectShader(const(void)* pShaderBytecode, SIZE_T BytecodeLength, ID3D10ShaderReflection* ppReflector);
HRESULT D3D10PreprocessShader(LPCSTR pSrcData, SIZE_T SrcDataSize, LPCSTR pFileName, const(D3D10_SHADER_MACRO)* pDefines, ID3D10Include pInclude, ID3D10Blob* ppShaderText, ID3D10Blob* ppErrorMsgs);
HRESULT D3D10GetInputSignatureBlob(const(void)* pShaderBytecode, SIZE_T BytecodeLength, ID3D10Blob* ppSignatureBlob);
HRESULT D3D10GetOutputSignatureBlob(const(void)* pShaderBytecode, SIZE_T BytecodeLength, ID3D10Blob* ppSignatureBlob);
HRESULT D3D10GetInputAndOutputSignatureBlob(const(void)* pShaderBytecode, SIZE_T BytecodeLength, ID3D10Blob* ppSignatureBlob);
HRESULT D3D10GetShaderDebugInfo(const(void)* pShaderBytecode, SIZE_T BytecodeLength, ID3D10Blob* ppDebugInfo);
}
