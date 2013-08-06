module c.windows.d3dcompiler;


invariant wchar[] = "d3dcompiler_42.dll";
invariant char[] = "d3dcompiler_42.dll";
version(UNICODE)
	alias D3DCOMPILER_DLL_W D3DCOMPILER_DLL;
else
	alias D3DCOMPILER_DLL_A D3DCOMPILER_DLL;

alias ID3D10Blob ID3DBlob;
alias ID3D10Include ID3DInclude;

extern(C){

extern(Windows) HRESULT D3DCompile(LPCVOID pSrcData, SIZE_T SrcDataSize, LPCSTR pSourceName, const(D3D_SHADER_MACRO)* pDefines, ID3DInclude pInclude, LPCSTR pEntrypoint, LPCSTR pTarget, UINT Flags1, UINT Flags2, ID3DBlob* ppCode, ID3DBlob* ppErrorMsgs);
alias extern(Windows) HRESULT function(LPCVOID pSrcData, SIZE_T SrcDataSize, LPCSTR pFileName, const(D3D10_SHADER_MACRO)* pDefines, LPD3D10INCLUDE pInclude, LPCSTR pEntrypoint, LPCSTR pTarget, UINT Flags1, UINT Flags2, LPD3D10BLOB* ppCode, LPD3D10BLOB* ppErrorMsgs) pD3DCompile;
extern(Windows) HRESULT D3DPreprocess(LPCVOID pSrcData, SIZE_T SrcDataSize, LPCSTR pSourceName, const(D3D_SHADER_MACRO)* pDefines, ID3DInclude pInclude, ID3DBlob* ppCodeText, ID3DBlob* ppErrorMsgs);
alias extern(Windows) HRESULT function(LPCVOID pSrcData, SIZE_T SrcDataSize, LPCSTR pFileName, const(D3D10_SHADER_MACRO)* pDefines, LPD3D10INCLUDE pInclude, LPD3D10BLOB* ppCodeText, LPD3D10BLOB* ppErrorMsgs) pD3DPreprocess;
extern(Windows) HRESULT D3DGetDebugInfo(LPCVOID pSrcData, SIZE_T SrcDataSize, ID3DBlob* ppDebugInfo);
extern(Windows) HRESULT  D3DReflect(LPCVOID pSrcData, SIZE_T SrcDataSize, REFIID pInterface, void** ppReflector);

enum {
	D3D_DISASM_ENABLE_COLOR_CODE = 0x00000001,
	D3D_DISASM_ENABLE_DEFAULT_VALUE_PRINTS = 0x00000002,
	D3D_DISASM_ENABLE_INSTRUCTION_NUMBERING = 0x00000004,
	D3D_DISASM_ENABLE_INSTRUCTION_CYCLE = 0x00000008,
}

extern(Windows) HRESULT D3DDisassemble(LPCVOID pSrcData, SIZE_T SrcDataSize, UINT Flags, LPCSTR szComments, ID3DBlob* ppDisassembly);
alias extern(Windows) HRESULT function(LPCVOID pSrcData, SIZE_T SrcDataSize, UINT Flags, LPCSTR szComments, ID3DBlob* ppDisassembly) pD3DDisassemble;

extern(Windows) HRESULT D3DDisassemble10Effect(ID3D10Effect* pEffect, UINT Flags, ID3DBlob* ppDisassembly);
extern(Windows) HRESULT D3DGetInputSignatureBlob(LPCVOID pSrcData, SIZE_T SrcDataSize, ID3DBlob* ppSignatureBlob);
extern(Windows) HRESULT D3DGetOutputSignatureBlob(LPCVOID pSrcData, SIZE_T SrcDataSize, ID3DBlob* ppSignatureBlob);
extern(Windows) HRESULT D3DGetInputAndOutputSignatureBlob(LPCVOID pSrcData, SIZE_T SrcDataSize, ID3DBlob* ppSignatureBlob);

enum D3DCOMPILER_STRIP_FLAGS {
	D3DCOMPILER_STRIP_REFLECTION_DATA = 1,
	D3DCOMPILER_STRIP_DEBUG_INFO = 2,
	D3DCOMPILER_STRIP_TEST_BLOBS = 4,
	D3DCOMPILER_STRIP_FORCE_DWORD = 0x7fffffff,
}
alias int D3DCOMPILER_STRIP_FLAGS;

extern(Windows) HRESULT D3DStripShader(LPCVOID pShaderBytecode, SIZE_T BytecodeLength, UINT uStripFlags, ID3DBlob* ppStrippedBlob);
}// extern(C)
