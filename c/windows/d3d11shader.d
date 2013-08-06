/** d3d11shader.d

Converted from 'd3d11shader.h'.

Version: DirectX 11 SDK February 2010
Authors: Koji Kishita
*/
module c.windows.d3d11shader;


import c.windows.windef;
import c.windows.guiddef;
import c.windows.unknwn;
import c.windows.d3dcommon;
import c.windows.d3d10;
import c.windows.d3d10shader;
import c.windows.d3d11;


enum {
	D3D11_SHVER_PIXEL_SHADER = 0,
	D3D11_SHVER_VERTEX_SHADER = 1,
	D3D11_SHVER_GEOMETRY_SHADER = 2,
	D3D11_SHVER_HULL_SHADER = 3,
	D3D11_SHVER_DOMAIN_SHADER = 4,
	D3D11_SHVER_COMPUTE_SHADER = 5,
}
alias int D3D11_SHADER_VERSION_TYPE;

//D3D11_SHVER_GET_TYPE(_Version)  (((_Version) >> 16) & 0xffff)
//D3D11_SHVER_GET_MAJOR(_Version)  (((_Version) >> 4) & 0xf)
//D3D11_SHVER_GET_MINOR(_Version)  (((_Version) >> 0) & 0xf)

enum {
	D3D11_RETURN_TYPE_UNORM = 1,
	D3D11_RETURN_TYPE_SNORM = 2,
	D3D11_RETURN_TYPE_SINT = 3,
	D3D11_RETURN_TYPE_UINT = 4,
	D3D11_RETURN_TYPE_FLOAT = 5,
	D3D11_RETURN_TYPE_MIXED = 6,
	D3D11_RETURN_TYPE_DOUBLE = 7,
	D3D11_RETURN_TYPE_CONTINUED = 8,
}
alias int D3D11_RESOURCE_RETURN_TYPE;

enum {
	D3D11_CT_CBUFFER,
	D3D11_CT_TBUFFER,
	D3D11_CT_INTERFACE_POINTERS,
	D3D11_CT_RESOURCE_BIND_INFO,
}
alias int D3D11_CBUFFER_TYPE;
alias D3D11_CBUFFER_TYPE* LPD3D11_CBUFFER_TYPE;

struct D3D11_SIGNATURE_PARAMETER_DESC {
	LPCSTR SemanticName;
	UINT SemanticIndex;
	UINT Register;
	D3D10_NAME SystemValueType;
	D3D10_REGISTER_COMPONENT_TYPE ComponentType;
	BYTE Mask;
	BYTE ReadWriteMask;
	UINT Stream;
}

struct D3D11_SHADER_BUFFER_DESC {
	LPCSTR Name;
	D3D11_CBUFFER_TYPE Type;
	UINT Variables;
	UINT Size;
	UINT uFlags;
}

struct D3D11_SHADER_VARIABLE_DESC {
	LPCSTR Name;
	UINT StartOffset;
	UINT Size;
	UINT uFlags;
	LPVOID DefaultValue;
	UINT StartTexture;
	UINT TextureSize;
	UINT StartSampler;
	UINT SamplerSize;
}

struct D3D11_SHADER_TYPE_DESC {
	D3D10_SHADER_VARIABLE_CLASS Class;
	D3D10_SHADER_VARIABLE_TYPE Type;
	UINT Rows;
	UINT Columns;
	UINT Elements;
	UINT Members;
	UINT Offset;
	LPCSTR Name;
}

enum {
	D3D11_TESSELLATOR_DOMAIN_UNDEFINED = 0,
	D3D11_TESSELLATOR_DOMAIN_ISOLINE = 1,
	D3D11_TESSELLATOR_DOMAIN_TRI = 2,
	D3D11_TESSELLATOR_DOMAIN_QUAD = 3
}
alias int D3D11_TESSELLATOR_DOMAIN;

enum {
	D3D11_TESSELLATOR_PARTITIONING_UNDEFINED = 0,
	D3D11_TESSELLATOR_PARTITIONING_INTEGER = 1,
	D3D11_TESSELLATOR_PARTITIONING_POW2 = 2,
	D3D11_TESSELLATOR_PARTITIONING_FRACTIONAL_ODD = 3,
	D3D11_TESSELLATOR_PARTITIONING_FRACTIONAL_EVEN = 4
}
alias int D3D11_TESSELLATOR_PARTITIONING;

enum {
	D3D11_TESSELLATOR_OUTPUT_UNDEFINED = 0,
	D3D11_TESSELLATOR_OUTPUT_POINT = 1,
	D3D11_TESSELLATOR_OUTPUT_LINE = 2,
	D3D11_TESSELLATOR_OUTPUT_TRIANGLE_CW = 3,
	D3D11_TESSELLATOR_OUTPUT_TRIANGLE_CCW = 4
}
alias int D3D11_TESSELLATOR_OUTPUT_PRIMITIVE;

struct D3D11_SHADER_DESC {
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
	D3D11_PRIMITIVE InputPrimitive;
	UINT PatchConstantParameters;
	UINT cGSInstanceCount;
	UINT cControlPoints;
	D3D11_TESSELLATOR_OUTPUT_PRIMITIVE HSOutputPrimitive;
	D3D11_TESSELLATOR_PARTITIONING HSPartitioning;
	D3D11_TESSELLATOR_DOMAIN TessellatorDomain;
	UINT cBarrierInstructions;
	UINT cInterlockedInstructions;
	UINT cTextureStoreInstructions;
}

struct D3D11_SHADER_INPUT_BIND_DESC {
	LPCSTR Name;
	D3D10_SHADER_INPUT_TYPE Type;
	UINT BindPoint;
	UINT BindCount;
	UINT uFlags;
	D3D11_RESOURCE_RETURN_TYPE ReturnType;
	D3D10_SRV_DIMENSION Dimension;
	UINT NumSamples;
}

mixin DEFINE_GUID!("IID_ID3D11ShaderReflectionType", 0x6e6ffa6a, 0x9bae, 0x4613, 0xa5, 0x1e, 0x91, 0x65, 0x2d, 0x50, 0x8c, 0x21);
interface ID3D11ShaderReflectionType {
public extern(Windows):
	HRESULT GetDesc(D3D11_SHADER_TYPE_DESC* pDesc);
	ID3D11ShaderReflectionType GetMemberTypeByIndex(UINT Index);
	ID3D11ShaderReflectionType GetMemberTypeByName(LPCSTR Name);
	LPCSTR GetMemberTypeName(UINT Index);
	HRESULT IsEqual(ID3D11ShaderReflectionType pType);
	ID3D11ShaderReflectionType GetSubType();
	ID3D11ShaderReflectionType GetBaseClass();
	UINT GetNumInterfaces();
	ID3D11ShaderReflectionType GetInterfaceByIndex(UINT uIndex);
	HRESULT IsOfType(ID3D11ShaderReflectionType pType);
	HRESULT ImplementsInterface(ID3D11ShaderReflectionType pBase);
}

mixin DEFINE_GUID!("IID_ID3D11ShaderReflectionVariable", 0x51f23923, 0xf3e5, 0x4bd1, 0x91, 0xcb, 0x60, 0x61, 0x77, 0xd8, 0xdb, 0x4c);
interface ID3D11ShaderReflectionVariable {
public extern(Windows):
	HRESULT GetDesc(D3D11_SHADER_VARIABLE_DESC* pDesc);
	ID3D11ShaderReflectionType GetType();
	ID3D11ShaderReflectionConstantBuffer GetBuffer();
	UINT GetInterfaceSlot(UINT uArrayIndex);
}

mixin DEFINE_GUID!("IID_ID3D11ShaderReflectionConstantBuffer", 0xeb62d63d, 0x93dd, 0x4318, 0x8a, 0xe8, 0xc6, 0xf8, 0x3a, 0xd3, 0x71, 0xb8);

interface ID3D11ShaderReflectionConstantBuffer {
public extern(Windows):
	HRESULT GetDesc(D3D11_SHADER_BUFFER_DESC* pDesc);
	ID3D11ShaderReflectionVariable GetVariableByIndex(UINT Index);
	ID3D11ShaderReflectionVariable GetVariableByName(LPCSTR Name);
}

mixin DEFINE_GUID!("IID_ID3D11ShaderReflection", 0x17f27486, 0xa342, 0x4d10, 0x88, 0x42, 0xab, 0x08, 0x74, 0xe7, 0xf6, 0x70);
interface ID3D11ShaderReflection : IUnknown {
public extern(Windows):
	HRESULT QueryInterface(REFIID iid, void** ppv);
	ULONG AddRef();
	ULONG Release();

	HRESULT GetDesc(D3D11_SHADER_DESC* pDesc);
	ID3D11ShaderReflectionConstantBuffer GetConstantBufferByIndex(UINT Index);
	ID3D11ShaderReflectionConstantBuffer GetConstantBufferByName(LPCSTR Name);
	HRESULT GetResourceBindingDesc(UINT ResourceIndex, D3D11_SHADER_INPUT_BIND_DESC* pDesc);
	HRESULT GetInputParameterDesc(UINT ParameterIndex, D3D11_SIGNATURE_PARAMETER_DESC* pDesc);
	HRESULT GetOutputParameterDesc(UINT ParameterIndex, D3D11_SIGNATURE_PARAMETER_DESC* pDesc);
	HRESULT GetPatchConstantParameterDesc(UINT ParameterIndex, D3D11_SIGNATURE_PARAMETER_DESC* pDesc);
	ID3D11ShaderReflectionVariable GetVariableByName(LPCSTR Name);
	HRESULT GetResourceBindingDescByName(LPCSTR Name, D3D11_SHADER_INPUT_BIND_DESC* pDesc);
	UINT GetMovInstructionCount();
	UINT GetMovcInstructionCount();
	UINT GetConversionInstructionCount();
	UINT GetBitwiseInstructionCount();
	D3D10_PRIMITIVE GetGSInputPrimitive();
	BOOL IsSampleFrequencyShader();
	UINT GetNumInterfaceSlots();
	HRESULT GetMinFeatureLevel(D3D_FEATURE_LEVEL* pLevel);
}
