/** mediaobj.d

Converted from 'midles.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.midles;


import c.windows.windef;
import c.windows.rpc;
import c.windows.rpcdce;
import c.windows.rpcdcep;
import c.windows.rpcndr;


extern(C){

enum {
	MES_ENCODE,
	MES_DECODE,
	MES_ENCODE_NDR64
}
alias int MIDL_ES_CODE;

enum {
	MES_INCREMENTAL_HANDLE,
	MES_FIXED_BUFFER_HANDLE,
	MES_DYNAMIC_BUFFER_HANDLE
}
alias int MIDL_ES_HANDLE_STYLE;

alias extern(Windows) void function(void* state, char**  pbuffer, uint* psize) MIDL_ES_ALLOC;
alias extern(Windows) void function(void* state, char* buffer, uint size) MIDL_ES_WRITE;
alias extern(Windows) void function(void* state, char**  pbuffer, uint* psize) MIDL_ES_READ;

alias handle_t MIDL_ES_HANDLE;

struct MIDL_TYPE_PICKLING_INFO {
	uint Version;
	uint Flags;
	UINT_PTR[3] Reserved;
}
alias MIDL_TYPE_PICKLING_INFO* PMIDL_TYPE_PICKLING_INFO;

export extern(Windows){
	RPC_STATUS MesEncodeIncrementalHandleCreate(void* UserState, MIDL_ES_ALLOC AllocFn, MIDL_ES_WRITE WriteFn, handle_t* pHandle);
	RPC_STATUS MesDecodeIncrementalHandleCreate(void* UserState, MIDL_ES_READ ReadFn, handle_t* pHandle);
	RPC_STATUS MesIncrementalHandleReset(handle_t Handle, void* UserState, MIDL_ES_ALLOC AllocFn, MIDL_ES_WRITE WriteFn, MIDL_ES_READ ReadFn, MIDL_ES_CODE Operation);
	RPC_STATUS MesEncodeFixedBufferHandleCreate(char* pBuffer, uint BufferSize, uint* pEncodedSize, handle_t* pHandle);
	RPC_STATUS MesEncodeDynBufferHandleCreate(char** pBuffer, uint* pEncodedSize, handle_t* pHandle);
	RPC_STATUS MesDecodeBufferHandleCreate(char* pBuffer, uint BufferSize, handle_t* pHandle);
	RPC_STATUS MesBufferHandleReset(handle_t Handle, uint HandleStyle, MIDL_ES_CODE Operation, char** pBuffer, uint BufferSize, uint* pEncodedSize);
	RPC_STATUS MesHandleFree(handle_t Handle);
	RPC_STATUS MesInqProcEncodingId(handle_t Handle, PRPC_SYNTAX_IDENTIFIER pInterfaceId, uint* pProcNum);
	size_t NdrMesSimpleTypeAlignSize (handle_t);
	void NdrMesSimpleTypeDecode(handle_t Handle, void* pObject, short Size);
	void NdrMesSimpleTypeEncode(handle_t Handle, const(MIDL_STUB_DESC)* pStubDesc, const(void)* pObject, short Size);
	size_t NdrMesTypeAlignSize(handle_t Handle, const(MIDL_STUB_DESC)* pStubDesc, PFORMAT_STRING pFormatString, const(void)* pObject);
	void NdrMesTypeEncode(handle_t Handle, const(MIDL_STUB_DESC)* pStubDesc, PFORMAT_STRING pFormatString, const(void)* pObject);
	void NdrMesTypeDecode(handle_t Handle, const(MIDL_STUB_DESC)* pStubDesc, PFORMAT_STRING pFormatString, void* pObjec);
	size_t NdrMesTypeAlignSize2(handle_t Handle, const(MIDL_TYPE_PICKLING_INFO)* pPicklingInfo, const(MIDL_STUB_DESC)* pStubDesc, PFORMAT_STRING pFormatString, const(void)* pObject);
	void NdrMesTypeEncode2(handle_t Handle, const(MIDL_TYPE_PICKLING_INFO)* pPicklingInfo, const(MIDL_STUB_DESC)* pStubDesc, PFORMAT_STRING pFormatString, const(void)* pObject);
	void NdrMesTypeDecode2(handle_t Handle, const(MIDL_TYPE_PICKLING_INFO)* pPicklingInfo, const(MIDL_STUB_DESC)* pStubDesc, PFORMAT_STRING pFormatString, void* pObject);
	void NdrMesTypeFree2(handle_t Handle, const(MIDL_TYPE_PICKLING_INFO)* pPicklingInfo, const(MIDL_STUB_DESC)* pStubDesc, PFORMAT_STRING pFormatString, void* pObject);
	extern(C) void NdrMesProcEncodeDecode(handle_t Handle, const(MIDL_STUB_DESC)* pStubDesc, PFORMAT_STRING pFormatString, ... );
	extern(C) CLIENT_CALL_RETURN NdrMesProcEncodeDecode2(handle_t Handle, const(MIDL_STUB_DESC)* pStubDesc, PFORMAT_STRING pFormatString, ...);
	size_t  NdrMesTypeAlignSize3(handle_t Handle, const(MIDL_TYPE_PICKLING_INFO)* pPicklingInfo, const(MIDL_STUBLESS_PROXY_INFO)* pProxyInfo, const(uint*)* ArrTypeOffset, uint nTypeIndex, const(void)* pObject);
	void NdrMesTypeEncode3(handle_t Handle, const(MIDL_TYPE_PICKLING_INFO)* pPicklingInfo, const(MIDL_STUBLESS_PROXY_INFO)* pProxyInfo, const(uint*)* ArrTypeOffset, uint nTypeIndex, const(void)* pObject);
	void NdrMesTypeDecode3(handle_t Handle, const(MIDL_TYPE_PICKLING_INFO)* pPicklingInfo, const(MIDL_STUBLESS_PROXY_INFO)* pProxyInfo, const(uint*)* ArrTypeOffset, uint nTypeIndex, void* pObject);
	void NdrMesTypeFree3(handle_t Handle, const(MIDL_TYPE_PICKLING_INFO)* pPicklingInfo, const(MIDL_STUBLESS_PROXY_INFO)* pProxyInfo, const(uint*)* ArrTypeOffset, uint nTypeIndex, void* pObject);
	extern(C) CLIENT_CALL_RETURN NdrMesProcEncodeDecode3(handle_t Handle, const(MIDL_STUBLESS_PROXY_INFO)* pProxyInfo, uint nProcNum, void* pReturnValue, ... );
	void NdrMesSimpleTypeDecodeAll(handle_t Handle, const(MIDL_STUBLESS_PROXY_INFO)* pProxyInfo, void* pObject, short Size);
	void NdrMesSimpleTypeEncodeAll(handle_t Handle, const(MIDL_STUBLESS_PROXY_INFO)* pProxyInfo, const(void)* pObject, short Size);
	size_t NdrMesSimpleTypeAlignSizeAll (handle_t Handle, const(MIDL_STUBLESS_PROXY_INFO)*  pProxyInfo);
}

} // extern(C)
