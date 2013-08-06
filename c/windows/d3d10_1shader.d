/** d3d10_1shader.d

Converted from 'd3d10_1shader.h'.

Version: DirectX 11 SDK February 2010
Authors: Koji Kishita
*/
module c.windows.d3d10_1shader;


import c.windows.windef;
import c.windows.guiddef;
import c.windows.unknwn;
import c.windows.d3d10;
import c.windows.d3d10shader;


enum {
	D3D10_SHADER_DEBUG_REG_INPUT,
	D3D10_SHADER_DEBUG_REG_OUTPUT,
	D3D10_SHADER_DEBUG_REG_CBUFFER,
	D3D10_SHADER_DEBUG_REG_TBUFFER,
	D3D10_SHADER_DEBUG_REG_TEMP,
	D3D10_SHADER_DEBUG_REG_TEMPARRAY,
	D3D10_SHADER_DEBUG_REG_TEXTURE,
	D3D10_SHADER_DEBUG_REG_SAMPLER,
	D3D10_SHADER_DEBUG_REG_IMMEDIATECBUFFER,
	D3D10_SHADER_DEBUG_REG_LITERAL,
	D3D10_SHADER_DEBUG_REG_UNUSED,
	D3D11_SHADER_DEBUG_REG_INTERFACE_POINTERS,
	D3D10_SHADER_DEBUG_REG_FORCE_DWORD = 0x7fffffff,
}
alias int D3D10_SHADER_DEBUG_REGTYPE;

enum {
	D3D10_SHADER_DEBUG_SCOPE_GLOBAL,
	D3D10_SHADER_DEBUG_SCOPE_BLOCK,
	D3D10_SHADER_DEBUG_SCOPE_FORLOOP,
	D3D10_SHADER_DEBUG_SCOPE_STRUCT,
	D3D10_SHADER_DEBUG_SCOPE_FUNC_PARAMS,
	D3D10_SHADER_DEBUG_SCOPE_STATEBLOCK,
	D3D10_SHADER_DEBUG_SCOPE_NAMESPACE,
	D3D10_SHADER_DEBUG_SCOPE_ANNOTATION,
	D3D10_SHADER_DEBUG_SCOPE_FORCE_DWORD = 0x7fffffff,
}
alias int D3D10_SHADER_DEBUG_SCOPETYPE;

enum {
	D3D10_SHADER_DEBUG_VAR_VARIABLE,
	D3D10_SHADER_DEBUG_VAR_FUNCTION,
	D3D10_SHADER_DEBUG_VAR_FORCE_DWORD = 0x7fffffff,
}
alias int D3D10_SHADER_DEBUG_VARTYPE;

struct D3D10_SHADER_DEBUG_TOKEN_INFO {
	UINT File;
	UINT Line;
	UINT Column;
	UINT TokenLength;
	UINT TokenId;
}

struct D3D10_SHADER_DEBUG_VAR_INFO {
	UINT TokenId;
	D3D10_SHADER_VARIABLE_TYPE Type;
	UINT Register;
	UINT Component;
	UINT ScopeVar;
	UINT ScopeVarOffset;
}

struct D3D10_SHADER_DEBUG_INPUT_INFO {
	UINT Var;
	D3D10_SHADER_DEBUG_REGTYPE InitialRegisterSet;
	UINT InitialBank;
	UINT InitialRegister;
	UINT InitialComponent;
	UINT InitialValue;
}

struct D3D10_SHADER_DEBUG_SCOPEVAR_INFO {
	UINT TokenId;
	D3D10_SHADER_DEBUG_VARTYPE VarType;
	D3D10_SHADER_VARIABLE_CLASS Class;
	UINT Rows;
	UINT Columns;
	UINT StructMemberScope;
	UINT uArrayIndices;
	UINT ArrayElements;
	UINT ArrayStrides;
	UINT uVariables;
	UINT uFirstVariable;
}

struct D3D10_SHADER_DEBUG_SCOPE_INFO {
	D3D10_SHADER_DEBUG_SCOPETYPE ScopeType;
	UINT Name;
	UINT uNameLen;
	UINT uVariables;
	UINT VariableData;
}

struct D3D10_SHADER_DEBUG_OUTPUTVAR {
	UINT Var;
	UINT uValueMin, uValueMax;
	INT iValueMin, iValueMax;
	FLOAT fValueMin, fValueMax;
	BOOL bNaNPossible, bInfPossible;
}

struct D3D10_SHADER_DEBUG_OUTPUTREG_INFO {
	D3D10_SHADER_DEBUG_REGTYPE OutputRegisterSet;
	UINT OutputReg;
	UINT TempArrayReg;
	UINT[4] OutputComponents;
	D3D10_SHADER_DEBUG_OUTPUTVAR[4] OutputVars;
	UINT IndexReg;
	UINT IndexComp;
}

struct D3D10_SHADER_DEBUG_INST_INFO {
	UINT Id;
	UINT Opcode;
	UINT uOutputs;
	D3D10_SHADER_DEBUG_OUTPUTREG_INFO pOutputs[2];
	UINT TokenId;
	UINT NestingLevel;
	UINT Scopes;
	UINT ScopeInfo;
	UINT AccessedVars;
	UINT AccessedVarsInfo;
}

struct D3D10_SHADER_DEBUG_FILE_INFO {
	UINT FileName;
	UINT FileNameLen;
	UINT FileData;
	UINT FileLen;
}

struct D3D10_SHADER_DEBUG_INFO {
	UINT Size;
	UINT Creator;
	UINT EntrypointName;
	UINT ShaderTarget;
	UINT CompileFlags;
	UINT Files;
	UINT FileInfo;
	UINT Instructions;
	UINT InstructionInfo;
	UINT Variables;
	UINT VariableInfo;
	UINT InputVariables;
	UINT InputVariableInfo;
	UINT Tokens;
	UINT TokenInfo;
	UINT Scopes;
	UINT ScopeInfo;
	UINT ScopeVariables;
	UINT ScopeVariableInfo;
	UINT UintOffset;
	UINT StringOffset;
}

mixin DEFINE_GUID!("IID_ID3D10ShaderReflection1", 0xc3457783, 0xa846, 0x47ce, 0x95, 0x20, 0xce, 0xa6, 0xf6, 0x6e, 0x74, 0x47);
interface ID3D10ShaderReflection1 : IUnknown {
public extern(Windows):
	HRESULT QueryInterface(REFIID iid, void** ppv);
	ULONG AddRef();
	ULONG Release();

	HRESULT GetDesc(D3D10_SHADER_DESC* pDesc);
	ID3D10ShaderReflectionConstantBuffer GetConstantBufferByIndex(UINT Index);
	ID3D10ShaderReflectionConstantBuffer GetConstantBufferByName(LPCSTR Name);
	HRESULT GetResourceBindingDesc(UINT ResourceIndex, D3D10_SHADER_INPUT_BIND_DESC* pDesc);
	HRESULT GetInputParameterDesc(UINT ParameterIndex, D3D10_SIGNATURE_PARAMETER_DESC* pDesc);
	HRESULT GetOutputParameterDesc(UINT ParameterIndex, D3D10_SIGNATURE_PARAMETER_DESC* pDesc);
	ID3D10ShaderReflectionVariable GetVariableByName(LPCSTR Name);
	HRESULT GetResourceBindingDescByName(LPCSTR Name, D3D10_SHADER_INPUT_BIND_DESC* pDesc);
	HRESULT GetMovInstructionCount(UINT* pCount);
	HRESULT GetMovcInstructionCount(UINT* pCount);
	HRESULT GetConversionInstructionCount(UINT* pCount);
	HRESULT GetBitwiseInstructionCount(UINT* pCount);
	HRESULT GetGSInputPrimitive(D3D10_PRIMITIVE* pPrim);
	HRESULT IsLevel9Shader(BOOL* pbLevel9Shader);
	HRESULT IsSampleFrequencyShader(BOOL* pbSampleFrequency);
}
