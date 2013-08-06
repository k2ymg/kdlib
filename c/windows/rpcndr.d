/** rpcndr.d

Converted from 'rpcndr.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.rpcndr;


import c.windows.sdkddkver;
import c.windows.windef;
import c.windows.rpc;
import c.windows.rpcdce;
import c.windows.rpcdcep;
import c.windows.objidl;
import std.c.string;
import std.metastrings;


align(8){
extern(C){

enum {
	NDR_CHAR_REP_MASK  = 0x0000000F,
	NDR_INT_REP_MASK   = 0x000000F0,
	NDR_FLOAT_REP_MASK = 0x0000FF00,
	NDR_LITTLE_ENDIAN  = 0x00000010,
	NDR_BIG_ENDIAN     = 0x00000000,
	NDR_IEEE_FLOAT     = 0x00000000,
	NDR_VAX_FLOAT      = 0x00000100,
	NDR_IBM_FLOAT      = 0x00000300,
	NDR_ASCII_CHAR     = 0x00000000,
	NDR_EBCDIC_CHAR    = 0x00000001,
}
enum {
	NDR_LOCAL_DATA_REPRESENTATION = 0x00000010L,
	NDR_LOCAL_ENDIAN              = NDR_LITTLE_ENDIAN,
}

//(_WIN32_WINNT_WIN7 <= _WIN32_WINNT)
	enum TARGET_IS_NT61_OR_LATER = 1;
//(_WIN32_WINNT_VISTA <= _WIN32_WINNT)
	enum TARGET_IS_NT60_OR_LATER = 1;
//(_WIN32_WINNT_WINXP <= _WIN32_WINNT)
	enum TARGET_IS_NT51_OR_LATER = 1;
//(_WIN32_WINNT_WIN2K <= _WIN32_WINNT)
	enum TARGET_IS_NT50_OR_LATER = 1;
//(_WIN32_WINNT_NT4 <= _WIN32_WINNT)
	enum TARGET_IS_NT40_OR_LATER = 1;
//(_WIN32_WINNT_NT4 <= WINVER)
	enum TARGET_IS_NT351_OR_WIN95_OR_LATER = 1;

alias byte small;
alias ubyte cs_byte;
alias ubyte boolean;

alias long hyper;
alias long MIDL_uhyper;
alias wchar wchar_t;

alias MIDL_user_allocate midl_user_allocate;
alias MIDL_user_free midl_user_free;

export extern(Windows){
	void* MIDL_user_allocate(size_t size);
	void MIDL_user_free(void*);
	void* I_RpcDefaultAllocate(handle_t bh, size_t size, void* function(size_t));
	void I_RpcDefaultFree(handle_t bh, void*, void function(void*) RealFree);
}

enum NDR_CCONTEXT : void* {init = (void*).init}

struct _NDR_SCONTEXT {
	void*[2] pad;
	void* userContext;
}
alias _NDR_SCONTEXT* NDR_SCONTEXT;

void* NDRSContextValue(NDR_SCONTEXT hContext)
{
	return &hContext.userContext;
}

enum cbNDRContext = 20;

alias extern(Windows) void function(void* context) NDR_RUNDOWN;
alias extern(Windows) void function() NDR_NOTIFY_ROUTINE;
alias extern(Windows) void function(boolean flag) NDR_NOTIFY2_ROUTINE;

struct SCONTEXT_QUEUE {
	uint NumberOfObjects;
	NDR_SCONTEXT* ArrayOfObjects;
}
alias SCONTEXT_QUEUE* PSCONTEXT_QUEUE;

export extern(Windows){
	RPC_BINDING_HANDLE NDRCContextBinding(NDR_CCONTEXT CContext);
	void NDRCContextMarshall(NDR_CCONTEXT CContext, void* pBuff);
	void NDRCContextUnmarshall(NDR_CCONTEXT* pCContext, RPC_BINDING_HANDLE hBinding, void* pBuff, uint DataRepresentation);
	void NDRCContextUnmarshall2(NDR_CCONTEXT* pCContext, RPC_BINDING_HANDLE hBinding, void* pBuff, uint DataRepresentation);
	void NDRSContextMarshall(NDR_SCONTEXT CContext, void* pBuff, NDR_RUNDOWN userRunDownIn);
	NDR_SCONTEXT NDRSContextUnmarshall(void* pBuff, uint DataRepresentation);
	void NDRSContextMarshallEx(RPC_BINDING_HANDLE BindingHandle, NDR_SCONTEXT CContext, void* pBuff, NDR_RUNDOWN userRunDownIn);
	void NDRSContextMarshall2(RPC_BINDING_HANDLE BindingHandle, NDR_SCONTEXT CContext, void* pBuff, NDR_RUNDOWN userRunDownIn, void* CtxGuard, uint Flags);
	NDR_SCONTEXT NDRSContextUnmarshallEx(RPC_BINDING_HANDLE BindingHandle, void* pBuff, uint DataRepresentation);
	NDR_SCONTEXT NDRSContextUnmarshall2(RPC_BINDING_HANDLE BindingHandle, void* pBuff, uint DataRepresentation, void* CtxGuard, uint Flags);
	void RpcSsDestroyClientContext(void** ContextHandle);
}

alias strlen MIDL_ascii_strlen;
alias strcpy MIDL_ascii_strcpy;
alias memset MIDL_memset;

alias uint error_status_t;

struct _MIDL_STUB_MESSAGE {}
struct _MIDL_STUB_DESC {}
struct _FULL_PTR_XLAT_TABLES {}

alias char* RPC_BUFPTR;
alias uint RPC_LENGTH;

alias extern(Windows) void function(_MIDL_STUB_MESSAGE*) EXPR_EVAL;
alias const(char)* PFORMAT_STRING;

struct ARRAY_INFO {
	int Dimension;
	uint* BufferConformanceMark;
	uint* BufferVarianceMark;
	uint* MaxCountArray;
	uint* OffsetArray;
	uint* ActualCountArray;
}
alias ARRAY_INFO* PARRAY_INFO;

struct _NDR_ASYNC_MESSAGE {}
alias _NDR_ASYNC_MESSAGE* PNDR_ASYNC_MESSAGE;
struct _NDR_CORRELATION_INFO {}
alias _NDR_CORRELATION_INFO* PNDR_CORRELATION_INFO;

struct NDR_ALLOC_ALL_NODES_CONTEXT {}
struct NDR_POINTER_QUEUE_STATE {}
struct _NDR_PROC_CONTEXT {}

struct MIDL_STUB_MESSAGE {
	PRPC_MESSAGE RpcMsg;
	char* Buffer;
	char* BufferStart;
	char* BufferEnd;
	char* BufferMark;
	uint BufferLength;
	uint MemorySize;
	char* Memory;
	char IsClient;
	char Pad;
	ushort uFlags2;
	int ReuseBuffer;
	NDR_ALLOC_ALL_NODES_CONTEXT* pAllocAllNodesContext;
	NDR_POINTER_QUEUE_STATE* pPointerQueueState;
	int IgnoreEmbeddedPointers;
	char* PointerBufferMark;
	char CorrDespIncrement;
	char uFlags;
	ushort UniquePtrCount;
	ULONG_PTR MaxCount;
	uint Offset;
	uint ActualCount;
	extern(Windows) void* function(size_t) pfnAllocate;
	extern(Windows) void function(void*) pfnFree;
	char* StackTop;
	char* pPresentedType;
	char* pTransmitType;
	handle_t SavedHandle;
	const(_MIDL_STUB_DESC)* StubDesc;
	_FULL_PTR_XLAT_TABLES* FullPtrXlatTables;
	uint FullPtrRefId;
	uint PointerLength;
	uint fInDontFree; // !
	/*int                             fInDontFree       :1;
	int                             fDontCallFreeInst :1;
	int                             fInOnlyParam      :1;
	int                             fHasReturn        :1;
	int                             fHasExtensions    :1;
	int                             fHasNewCorrDesc   :1;
	int                             fIsIn             :1;
	int                             fIsOut            :1;
	int                             fIsOicf           :1;
	int                             fBufferValid      :1;
	int                             fHasMemoryValidateCallback: 1;
	int                             fInFree             :1;
	int                             fNeedMCCP         :1;
	int                             fUnused           :3;
	int                             fUnused2          :16;*/
	uint dwDestContext;
	void* pvDestContext;
	NDR_SCONTEXT* SavedContextHandles;
	int ParamNumber;

	IRpcChannelBuffer* pRpcChannelBuffer;
	PARRAY_INFO pArrayInfo;
	uint* SizePtrCountArray;
	uint* SizePtrOffsetArray;
	uint* SizePtrLengthArray;
	void* pArgQueue;
	uint dwStubPhase;
	void* LowStackMark;
	PNDR_ASYNC_MESSAGE pAsyncMsg;
	PNDR_CORRELATION_INFO pCorrInfo;
	char* pCorrMemory;
	void* pMemoryList;

	//(NTDDI_VERSION >= NTDDI_WIN2K )
		INT_PTR pCSInfo;
		char* ConformanceMark;
		char* VarianceMark;
		version(none) // IA64
			void* BackingStoreLowMark;
		else
			INT_PTR Unused;
		_NDR_PROC_CONTEXT* pContext;
		void* ContextHandleHash;
		void* pUserMarshalList;
		INT_PTR Reserved51_3;
		INT_PTR Reserved51_4;
		INT_PTR Reserved51_5;
}
alias MIDL_STUB_MESSAGE* PMIDL_STUB_MESSAGE;

alias extern(Windows) void* function(void*) GENERIC_BINDING_ROUTINE;
alias extern(Windows) void function(void*, char*) GENERIC_UNBIND_ROUTINE;

struct GENERIC_BINDING_ROUTINE_PAIR {
	GENERIC_BINDING_ROUTINE pfnBind;
	GENERIC_UNBIND_ROUTINE pfnUnbind;
}
alias GENERIC_BINDING_ROUTINE_PAIR* PGENERIC_BINDING_ROUTINE_PAIR;

struct GENERIC_BINDING_INFO {
	void* pObj;
	uint Size;
	GENERIC_BINDING_ROUTINE pfnBind;
	GENERIC_UNBIND_ROUTINE pfnUnbind;
}
alias GENERIC_BINDING_INFO* PGENERIC_BINDING_INFO;

alias extern(Windows) void function(PMIDL_STUB_MESSAGE) XMIT_HELPER_ROUTINE;

struct XMIT_ROUTINE_QUINTUPLE {
	XMIT_HELPER_ROUTINE pfnTranslateToXmit;
	XMIT_HELPER_ROUTINE pfnTranslateFromXmit;
	XMIT_HELPER_ROUTINE pfnFreeXmit;
	XMIT_HELPER_ROUTINE pfnFreeInst;
}
alias XMIT_ROUTINE_QUINTUPLE* PXMIT_ROUTINE_QUINTUPLE;

alias extern(Windows) uint function(uint*, uint, void*) USER_MARSHAL_SIZING_ROUTINE;
alias extern(Windows) char* function(uint*, char*, void*) USER_MARSHAL_MARSHALLING_ROUTINE;
alias extern(Windows) char* function(uint*, char*, void*) USER_MARSHAL_UNMARSHALLING_ROUTINE;
alias extern(Windows) void function(uint*, void*) USER_MARSHAL_FREEING_ROUTINE;

struct USER_MARSHAL_ROUTINE_QUADRUPLE {
	USER_MARSHAL_SIZING_ROUTINE pfnBufferSize;
	USER_MARSHAL_MARSHALLING_ROUTINE pfnMarshall;
	USER_MARSHAL_UNMARSHALLING_ROUTINE pfnUnmarshall;
	USER_MARSHAL_FREEING_ROUTINE pfnFree;
}

enum USER_MARSHAL_CB_SIGNATURE = ('U' << 24) | ('S' << 16) | ('R' << 8) | 'C';

enum {
	USER_MARSHAL_CB_BUFFER_SIZE,
	USER_MARSHAL_CB_MARSHALL,
	USER_MARSHAL_CB_UNMARSHALL,
	USER_MARSHAL_CB_FREE
}
alias int USER_MARSHAL_CB_TYPE;

struct USER_MARSHAL_CB {
	uint Flags;
	PMIDL_STUB_MESSAGE pStubMsg;
	PFORMAT_STRING pReserve;
	uint Signature;
	USER_MARSHAL_CB_TYPE CBType;
	PFORMAT_STRING pFormat;
	PFORMAT_STRING pTypeFormat;
}

pure nothrow
uint USER_CALL_CTXT_MASK(uint f)
{
	return f & 0x00ff;
}

pure nothrow
uint USER_CALL_AUX_MASK(uint f)
{
	return f & 0xff00;
}

pure nothrow
uint GET_USER_DATA_REP(uint f)
{
	return f >> 16;
}

enum {
	USER_CALL_IS_ASYNC             = 0x0100 ,
	USER_CALL_NEW_CORRELATION_DESC = 0x0200,
}

struct MALLOC_FREE_STRUCT {
	extern(Windows) void* function(size_t) pfnAllocate;
	extern(Windows) void function(void*) pfnFree;
}

struct COMM_FAULT_OFFSETS {
	short CommOffset;
	short FaultOffset;
}

enum {
	IDL_CS_NO_CONVERT,
	IDL_CS_IN_PLACE_CONVERT,
	IDL_CS_NEW_BUFFER_CONVERT
}
alias int IDL_CS_CONVERT;

alias extern(Windows) void function(RPC_BINDING_HANDLE hBinding, uint ulNetworkCodeSet, uint ulLocalBufferSize, IDL_CS_CONVERT* conversionType, uint* pulNetworkBufferSize, error_status_t* pStatus) CS_TYPE_NET_SIZE_ROUTINE;
alias extern(Windows) void function(RPC_BINDING_HANDLE hBinding, uint ulNetworkCodeSet, uint ulNetworkBufferSize, IDL_CS_CONVERT* conversionType, uint* pulLocalBufferSize, error_status_t* pStatus) CS_TYPE_LOCAL_SIZE_ROUTINE;
alias extern(Windows) void function(RPC_BINDING_HANDLE hBinding, uint ulNetworkCodeSet, void* pLocalData, uint ulLocalDataLength, byte* pNetworkData, uint* pulNetworkDataLength, error_status_t* pStatus) CS_TYPE_TO_NETCS_ROUTINE;
alias extern(Windows) void function(RPC_BINDING_HANDLE hBinding, uint ulNetworkCodeSet, byte* pNetworkData, uint ulNetworkDataLength, uint ulLocalBufferSize, void* pLocalData, uint* pulLocalDataLength, error_status_t* pStatus) CS_TYPE_FROM_NETCS_ROUTINE;
alias extern(Windows) void function(RPC_BINDING_HANDLE hBinding, int fServerSide, uint* pulSendingTag, uint* pulDesiredReceivingTag, uint* pulReceivingTag, error_status_t* pStatus) CS_TAG_GETTING_ROUTINE;

export extern(Windows) void RpcCsGetTags(RPC_BINDING_HANDLE hBinding, int fServerSide, uint* pulSendingTag, uint* pulDesiredReceivingTag, uint* pulReceivingTag, error_status_t* pStatus);

struct NDR_CS_SIZE_CONVERT_ROUTINES {
	CS_TYPE_NET_SIZE_ROUTINE pfnNetSize;
	CS_TYPE_TO_NETCS_ROUTINE pfnToNetCs;
	CS_TYPE_LOCAL_SIZE_ROUTINE pfnLocalSize;
	CS_TYPE_FROM_NETCS_ROUTINE pfnFromNetCs;
}

struct NDR_CS_ROUTINES {
	NDR_CS_SIZE_CONVERT_ROUTINES* pSizeConvertRoutines;
	CS_TAG_GETTING_ROUTINE* pTagGettingRoutines;
}

struct NDR_EXPR_DESC {
	const(ushort)* pOffset;
	PFORMAT_STRING pFormatExpr;
}

struct MIDL_STUB_DESC {
	void* RpcInterfaceInformation;
	extern(Windows) void* function(size_t) pfnAllocate;
	extern(Windows) void function(void*) pfnFree;
	union {
		handle_t* pAutoHandle;
		handle_t* pPrimitiveHandle;
		PGENERIC_BINDING_INFO pGenericBindingInfo;
	}
	const(NDR_RUNDOWN)* apfnNdrRundownRoutines;
	const(GENERIC_BINDING_ROUTINE_PAIR)* aGenericBindingRoutinePairs;
	const(EXPR_EVAL)* apfnExprEval;
	const(XMIT_ROUTINE_QUINTUPLE)* aXmitQuintuple;
	const(char)* pFormatTypes;
	int fCheckBounds;
	uint Version;
	MALLOC_FREE_STRUCT* pMallocFreeStruct;
	int MIDLVersion;
	const(COMM_FAULT_OFFSETS)* CommFaultOffsets;
	const(USER_MARSHAL_ROUTINE_QUADRUPLE)* aUserMarshalQuadruple;
	const(NDR_NOTIFY_ROUTINE)* NotifyRoutineTable;
	ULONG_PTR mFlags;
	const(NDR_CS_ROUTINES)* CsRoutineTables;
	void* ProxyServerInfo;
	const(NDR_EXPR_DESC)* pExprInfo;
}


alias const(MIDL_STUB_DESC)* PMIDL_STUB_DESC;
alias void* PMIDL_XMIT_TYPE;

struct MIDL_FORMAT_STRING {
	short Pad;
	char[1] Format;
}

alias extern(Windows) void function(PMIDL_STUB_MESSAGE) STUB_THUNK;
alias extern(Windows) int function() SERVER_ROUTINE;

struct  MIDL_SERVER_INFO {
	PMIDL_STUB_DESC pStubDesc;
	const(SERVER_ROUTINE)* DispatchTable;
	PFORMAT_STRING ProcString;
	const(ushort)* FmtStringOffset;
	const(STUB_THUNK)* ThunkTable;
	PRPC_SYNTAX_IDENTIFIER pTransferSyntax;
	ULONG_PTR nCount;
	PMIDL_SYNTAX_INFO pSyntaxInfo;
}
alias MIDL_SERVER_INFO* PMIDL_SERVER_INFO;

struct MIDL_STUBLESS_PROXY_INFO {
	PMIDL_STUB_DESC pStubDesc;
	PFORMAT_STRING ProcFormatString;
	const(ushort)* FormatStringOffset;
	PRPC_SYNTAX_IDENTIFIER pTransferSyntax;
	ULONG_PTR nCount;
	PMIDL_SYNTAX_INFO pSyntaxInfo;
}
alias MIDL_STUBLESS_PROXY_INFO* PMIDL_STUBLESS_PROXY_INFO;

struct MIDL_SYNTAX_INFO {
	RPC_SYNTAX_IDENTIFIER TransferSyntax;
	RPC_DISPATCH_TABLE* DispatchTable;
	PFORMAT_STRING ProcString;
	const(ushort)* FmtStringOffset;
	PFORMAT_STRING TypeString;
	const(void)* aUserMarshalQuadruple;
	ULONG_PTR pReserved1;
	ULONG_PTR pReserved2;
}
alias MIDL_SYNTAX_INFO* PMIDL_SYNTAX_INFO;

alias ushort* PARAM_OFFSETTABLE;
alias PARAM_OFFSETTABLE* PPARAM_OFFSETTABLE;

union CLIENT_CALL_RETURN {
	void* Pointer;
	LONG_PTR Simple;
}

enum {
	XLAT_SERVER = 1,
	XLAT_CLIENT
}
alias int XLAT_SIDE;

struct FULL_PTR_XLAT_TABLES {
	void* RefIdToPointer;
	void* PointerToRefId;
	uint NextRefId;
	XLAT_SIDE XlatSide;
}
alias FULL_PTR_XLAT_TABLES* PFULL_PTR_XLAT_TABLES;

export extern(Windows){
	RPC_STATUS NdrClientGetSupportedSyntaxes(RPC_CLIENT_INTERFACE* pInf, uint* pCount, MIDL_SYNTAX_INFO** pArr);
	RPC_STATUS NdrServerGetSupportedSyntaxes(RPC_SERVER_INTERFACE* pInf, uint* pCount, MIDL_SYNTAX_INFO** pArr, uint* pPreferSyntaxIndex);

	void NdrSimpleTypeMarshall(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, char FormatChar);
	char* NdrPointerMarshall(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	char* NdrCsArrayMarshall(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	char* NdrCsTagMarshall(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	char* NdrSimpleStructMarshall(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	char* NdrConformantStructMarshall(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	char* NdrConformantVaryingStructMarshall(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	char* NdrComplexStructMarshall(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	char* NdrFixedArrayMarshall(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	char* NdrConformantArrayMarshall(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	char* NdrConformantVaryingArrayMarshall(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	char* NdrVaryingArrayMarshall(PMIDL_STUB_MESSAGE pStubMsg, char pMemory, PFORMAT_STRING pFormat);
	char* NdrComplexArrayMarshall(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	char* NdrNonConformantStringMarshall(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	char* NdrConformantStringMarshall(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	char* NdrEncapsulatedUnionMarshall(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	char* NdrNonEncapsulatedUnionMarshall(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	char* NdrByteCountPointerMarshall(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	char* NdrXmitOrRepAsMarshall(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	char* NdrUserMarshalMarshall(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	char* NdrInterfacePointerMarshall(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrClientContextMarshall(PMIDL_STUB_MESSAGE pStubMsg, NDR_CCONTEXT ContextHandle, int fCheck);
	void NdrServerContextMarshall(PMIDL_STUB_MESSAGE pStubMsg, NDR_SCONTEXT ContextHandle, NDR_RUNDOWN RundownRoutine);
	void NdrServerContextNewMarshall(PMIDL_STUB_MESSAGE pStubMsg, NDR_SCONTEXT ContextHandle, NDR_RUNDOWN RundownRoutine, PFORMAT_STRING pFormat);
	void NdrSimpleTypeUnmarshall(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, char FormatChar);
	char* NdrCsArrayUnmarshall(PMIDL_STUB_MESSAGE pStubMsg, char** ppMemory, PFORMAT_STRING pFormat, char fMustAlloc);
	char* NdrCsTagUnmarshall(PMIDL_STUB_MESSAGE pStubMsg, char** ppMemory, PFORMAT_STRING pFormat, char fMustAlloc);
	char* NdrRangeUnmarshall(PMIDL_STUB_MESSAGE pStubMsg, char** ppMemory, PFORMAT_STRING pFormat, char fMustAlloc);
	void NdrCorrelationInitialize(PMIDL_STUB_MESSAGE pStubMsg, void* pMemory, uint CacheSize, uint flags);
	void NdrCorrelationPass(PMIDL_STUB_MESSAGE pStubMsg);
	void NdrCorrelationFree(PMIDL_STUB_MESSAGE pStubMsg);
	char* NdrPointerUnmarshall(PMIDL_STUB_MESSAGE pStubMsg, char** ppMemory, PFORMAT_STRING pFormat, char fMustAlloc);
	char* NdrSimpleStructUnmarshall(PMIDL_STUB_MESSAGE pStubMsg, char** ppMemory, PFORMAT_STRING pFormat, char fMustAlloc);
	char* NdrConformantStructUnmarshall(PMIDL_STUB_MESSAGE pStubMsg, char** ppMemory, PFORMAT_STRING pFormat, char fMustAlloc);
	char* NdrConformantVaryingStructUnmarshall(PMIDL_STUB_MESSAGE pStubMsg, char** ppMemory, PFORMAT_STRING pFormat, char fMustAlloc);
	char* NdrComplexStructUnmarshall(PMIDL_STUB_MESSAGE pStubMsg, char** ppMemory, PFORMAT_STRING pFormat, char fMustAlloc);
	char* NdrFixedArrayUnmarshall(PMIDL_STUB_MESSAGE pStubMsg, char** ppMemory, PFORMAT_STRING pFormat, char fMustAlloc);
	char* NdrConformantArrayUnmarshall(PMIDL_STUB_MESSAGE pStubMsg, char** ppMemory, PFORMAT_STRING pFormat, char fMustAlloc);
	char* NdrConformantVaryingArrayUnmarshall(PMIDL_STUB_MESSAGE pStubMsg, char** ppMemory, PFORMAT_STRING pFormat, char fMustAlloc);
	char* NdrVaryingArrayUnmarshall(PMIDL_STUB_MESSAGE pStubMsg, char** ppMemory, PFORMAT_STRING pFormat, char fMustAlloc);
	char* NdrComplexArrayUnmarshall(PMIDL_STUB_MESSAGE pStubMsg, char** ppMemory, PFORMAT_STRING pFormat, char fMustAlloc);
	char* NdrNonConformantStringUnmarshall(PMIDL_STUB_MESSAGE pStubMsg, char** ppMemory, PFORMAT_STRING pFormat, char fMustAlloc);
	char* NdrConformantStringUnmarshall(PMIDL_STUB_MESSAGE pStubMsg, char** ppMemory, PFORMAT_STRING pFormat, char fMustAlloc);
	char* NdrEncapsulatedUnionUnmarshall(PMIDL_STUB_MESSAGE pStubMsg, char** ppMemory, PFORMAT_STRING pFormat, char fMustAlloc);
	char* NdrNonEncapsulatedUnionUnmarshall(PMIDL_STUB_MESSAGE pStubMsg, char** ppMemory, PFORMAT_STRING pFormat, char fMustAlloc);
	char* NdrByteCountPointerUnmarshall(PMIDL_STUB_MESSAGE pStubMsg, char** ppMemory, PFORMAT_STRING pFormat, char fMustAlloc);
	char* NdrXmitOrRepAsUnmarshall(PMIDL_STUB_MESSAGE pStubMsg, char** ppMemory, PFORMAT_STRING pFormat, char fMustAlloc);
	char* NdrUserMarshalUnmarshall(PMIDL_STUB_MESSAGE pStubMsg, char** ppMemory, PFORMAT_STRING pFormat, char fMustAlloc);
	char* NdrInterfacePointerUnmarshall(PMIDL_STUB_MESSAGE pStubMsg, char** ppMemory, PFORMAT_STRING pFormat, char fMustAlloc);
	void NdrClientContextUnmarshall(PMIDL_STUB_MESSAGE pStubMsg, NDR_CCONTEXT* pContextHandle, RPC_BINDING_HANDLE BindHandle);
	NDR_SCONTEXT NdrServerContextUnmarshall(PMIDL_STUB_MESSAGE pStubMsg);
	NDR_SCONTEXT NdrContextHandleInitialize(PMIDL_STUB_MESSAGE pStubMsg, PFORMAT_STRING pFormat);
	NDR_SCONTEXT NdrServerContextNewUnmarshall(PMIDL_STUB_MESSAGE pStubMsg, PFORMAT_STRING pFormat);
	void NdrPointerBufferSize(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrCsArrayBufferSize(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrCsTagBufferSize(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrSimpleStructBufferSize(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrConformantStructBufferSize(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrConformantVaryingStructBufferSize(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrComplexStructBufferSize(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrFixedArrayBufferSize(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrConformantArrayBufferSize(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrConformantVaryingArrayBufferSize(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrVaryingArrayBufferSize(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrComplexArrayBufferSize(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrConformantStringBufferSize(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrNonConformantStringBufferSize(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrEncapsulatedUnionBufferSize(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrNonEncapsulatedUnionBufferSize(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrByteCountPointerBufferSize(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrXmitOrRepAsBufferSize(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrUserMarshalBufferSize(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrInterfacePointerBufferSize(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrContextHandleSize(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	uint NdrPointerMemorySize(PMIDL_STUB_MESSAGE pStubMsg, PFORMAT_STRING pFormat);
	uint NdrContextHandleMemorySize(PMIDL_STUB_MESSAGE pStubMsg, PFORMAT_STRING pFormat);
	uint NdrCsArrayMemorySize(PMIDL_STUB_MESSAGE pStubMsg, PFORMAT_STRING pFormat);
	uint NdrCsTagMemorySize(PMIDL_STUB_MESSAGE pStubMsg, PFORMAT_STRING pFormat);
	uint NdrSimpleStructMemorySize(PMIDL_STUB_MESSAGE pStubMsg, PFORMAT_STRING pFormat);
	uint NdrConformantStructMemorySize(PMIDL_STUB_MESSAGE pStubMsg, PFORMAT_STRING pFormat);
	uint NdrConformantVaryingStructMemorySize(PMIDL_STUB_MESSAGE pStubMsg, PFORMAT_STRING pFormat);
	uint NdrComplexStructMemorySize(PMIDL_STUB_MESSAGE pStubMsg, PFORMAT_STRING pFormat);
	uint NdrFixedArrayMemorySize(PMIDL_STUB_MESSAGE pStubMsg, PFORMAT_STRING pFormat);
	uint NdrConformantArrayMemorySize(PMIDL_STUB_MESSAGE pStubMsg, PFORMAT_STRING pFormat);
	uint NdrConformantVaryingArrayMemorySize(PMIDL_STUB_MESSAGE pStubMsg, PFORMAT_STRING pFormat);
	uint NdrVaryingArrayMemorySize(PMIDL_STUB_MESSAGE pStubMsg, PFORMAT_STRING pFormat);
	uint NdrComplexArrayMemorySize(PMIDL_STUB_MESSAGE pStubMsg, PFORMAT_STRING pFormat);
	uint NdrConformantStringMemorySize(PMIDL_STUB_MESSAGE pStubMsg, PFORMAT_STRING pFormat);
	uint NdrNonConformantStringMemorySize(PMIDL_STUB_MESSAGE pStubMsg, PFORMAT_STRING pFormat);
	uint NdrEncapsulatedUnionMemorySize(PMIDL_STUB_MESSAGE pStubMsg, PFORMAT_STRING pFormat);
	uint NdrNonEncapsulatedUnionMemorySize(PMIDL_STUB_MESSAGE pStubMsg, PFORMAT_STRING pFormat);
	uint NdrXmitOrRepAsMemorySize(PMIDL_STUB_MESSAGE pStubMsg, PFORMAT_STRING pFormat);
	uint NdrUserMarshalMemorySize(PMIDL_STUB_MESSAGE pStubMsg, PFORMAT_STRING pFormat);
	uint NdrInterfacePointerMemorySize(PMIDL_STUB_MESSAGE pStubMsg, PFORMAT_STRING pFormat);
	void NdrPointerFree(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrCsArrayFree(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrSimpleStructFree(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrConformantStructFree(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrConformantVaryingStructFree(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrComplexStructFree(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrFixedArrayFree(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrConformantArrayFree(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrConformantVaryingArrayFree(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrVaryingArrayFree(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrComplexArrayFree(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrEncapsulatedUnionFree(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrNonEncapsulatedUnionFree(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrByteCountPointerFree(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrXmitOrRepAsFree( PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrUserMarshalFree(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrInterfacePointerFree(PMIDL_STUB_MESSAGE pStubMsg, char* pMemory, PFORMAT_STRING pFormat);
	void NdrConvert2(PMIDL_STUB_MESSAGE pStubMsg, PFORMAT_STRING pFormat, int NumberParams);
	void NdrConvert(PMIDL_STUB_MESSAGE pStubMsg, PFORMAT_STRING pFormat);
}

enum {
	USER_MARSHAL_FC_BYTE   =  1,
	USER_MARSHAL_FC_CHAR   =  2,
	USER_MARSHAL_FC_SMALL  =  3,
	USER_MARSHAL_FC_USMALL =  4,
	USER_MARSHAL_FC_WCHAR  =  5,
	USER_MARSHAL_FC_SHORT  =  6,
	USER_MARSHAL_FC_USHORT =  7,
	USER_MARSHAL_FC_LONG   =  8,
	USER_MARSHAL_FC_ULONG  =  9,
	USER_MARSHAL_FC_FLOAT  = 10,
	USER_MARSHAL_FC_HYPER  = 11,
	USER_MARSHAL_FC_DOUBLE = 12,
}

export extern(Windows){
	char* NdrUserMarshalSimpleTypeConvert(uint* pFlags, char* pBuffer, char FormatChar);
	void NdrClientInitializeNew(PRPC_MESSAGE pRpcMsg, PMIDL_STUB_MESSAGE pStubMsg, PMIDL_STUB_DESC pStubDescriptor, uint ProcNum);
	char* NdrServerInitializeNew(PRPC_MESSAGE pRpcMsg, PMIDL_STUB_MESSAGE pStubMsg, PMIDL_STUB_DESC pStubDescriptor);
	void NdrServerInitializePartial(PRPC_MESSAGE pRpcMsg, PMIDL_STUB_MESSAGE pStubMsg, PMIDL_STUB_DESC pStubDescriptor, uint RequestedBufferSize);

	void NdrClientInitialize(PRPC_MESSAGE pRpcMsg, PMIDL_STUB_MESSAGE pStubMsg, PMIDL_STUB_DESC pStubDescriptor, uint ProcNum);
	char* NdrServerInitialize(PRPC_MESSAGE pRpcMsg, PMIDL_STUB_MESSAGE pStubMsg, PMIDL_STUB_DESC pStubDescriptor);
	char* NdrServerInitializeUnmarshall(PMIDL_STUB_MESSAGE pStubMsg, PMIDL_STUB_DESC pStubDescriptor, PRPC_MESSAGE pRpcMsg);
	void NdrServerInitializeMarshall(PRPC_MESSAGE pRpcMsg, PMIDL_STUB_MESSAGE pStubMsg);

	char* NdrGetBuffer(PMIDL_STUB_MESSAGE pStubMsg, uint BufferLength, RPC_BINDING_HANDLE Handle);
	char* NdrNsGetBuffer(PMIDL_STUB_MESSAGE pStubMsg, uint BufferLength, RPC_BINDING_HANDLE Handle);
	char* NdrSendReceive(PMIDL_STUB_MESSAGE pStubMsg, char* pBufferEnd);

	char* NdrNsSendReceive(PMIDL_STUB_MESSAGE pStubMsg, char* pBufferEnd, RPC_BINDING_HANDLE* pAutoHandle);
	void NdrFreeBuffer(PMIDL_STUB_MESSAGE pStubMsg);
	RPC_STATUS NdrGetDcomProtocolVersion(PMIDL_STUB_MESSAGE pStubMsg, RPC_VERSION* pVersion);
}

export extern(C) {
	export CLIENT_CALL_RETURN NdrClientCall2(PMIDL_STUB_DESC pStubDescriptor, PFORMAT_STRING pFormat, ...);
	export CLIENT_CALL_RETURN NdrClientCall(PMIDL_STUB_DESC pStubDescriptor, PFORMAT_STRING pFormat, ...);
	export CLIENT_CALL_RETURN NdrAsyncClientCall(PMIDL_STUB_DESC pStubDescriptor, PFORMAT_STRING pFormat, ...);
	export CLIENT_CALL_RETURN NdrDcomAsyncClientCall(PMIDL_STUB_DESC pStubDescriptor, PFORMAT_STRING pFormat, ...);
}

enum {
	STUB_UNMARSHAL,
	STUB_CALL_SERVER,
	STUB_MARSHAL,
	STUB_CALL_SERVER_NO_HRESULT
}
alias int STUB_PHASE;

enum {
	PROXY_CALCSIZE,
	PROXY_GETBUFFER,
	PROXY_MARSHAL,
	PROXY_SENDRECEIVE,
	PROXY_UNMARSHAL
}
alias int PROXY_PHASE;

export extern(Windows){
	void NdrAsyncServerCall(PRPC_MESSAGE pRpcMsg);
	int NdrAsyncStubCall(IRpcStubBuffer pThis, IRpcChannelBuffer  pChannel, PRPC_MESSAGE pRpcMsg, uint* pdwStubPhase);
	int NdrDcomAsyncStubCall(IRpcStubBuffer pThis, IRpcChannelBuffer pChannel, PRPC_MESSAGE pRpcMsg, uint* pdwStubPhase);
	int NdrStubCall2(void* pThis, void* pChannel, PRPC_MESSAGE pRpcMsg, uint* pdwStubPhase);
	void NdrServerCall2(PRPC_MESSAGE pRpcMsg);
	int NdrStubCall(void* pThis, void* pChannel, PRPC_MESSAGE pRpcMsg, uint* pdwStubPhase);
	void NdrServerCall(PRPC_MESSAGE pRpcMsg);
	int NdrServerUnmarshall(void* pChannel, PRPC_MESSAGE pRpcMsg, PMIDL_STUB_MESSAGE pStubMsg, PMIDL_STUB_DESC pStubDescriptor, PFORMAT_STRING pFormat, void* pParamList);
	void NdrServerMarshall(void* pThis, void* pChannel, PMIDL_STUB_MESSAGE pStubMsg, PFORMAT_STRING pFormat);
	RPC_STATUS NdrMapCommAndFaultStatus(PMIDL_STUB_MESSAGE pStubMsg, uint* pCommStatus, uint* pFaultStatus, RPC_STATUS Status);
}

alias void* RPC_SS_THREAD_HANDLE;

alias extern(Windows) void* function(size_t Size) RPC_CLIENT_ALLOC;
alias extern(Windows) void function(void* Ptr) RPC_CLIENT_FREE;

export extern(Windows){
	void* RpcSsAllocate(size_t Size);
	void RpcSsDisableAllocate();
	void RpcSsEnableAllocate();
	void RpcSsFree(void* NodeToFree);
	RPC_SS_THREAD_HANDLE RpcSsGetThreadHandle();
	void RpcSsSetClientAllocFree(RPC_CLIENT_ALLOC* ClientAlloc, RPC_CLIENT_FREE* ClientFree);
	void RpcSsSetThreadHandle(RPC_SS_THREAD_HANDLE Id);
	void RpcSsSwapClientAllocFree(RPC_CLIENT_ALLOC* ClientAlloc, RPC_CLIENT_FREE* ClientFree, RPC_CLIENT_ALLOC** OldClientAlloc, RPC_CLIENT_FREE** OldClientFree);
	void* RpcSmAllocate(size_t Size, RPC_STATUS* pStatus);
	RPC_STATUS RpcSmClientFree(void* pNodeToFree);
	RPC_STATUS RpcSmDestroyClientContext(void** ContextHandle);
	RPC_STATUS RpcSmDisableAllocate();
	RPC_STATUS RpcSmEnableAllocate();
	RPC_STATUS RpcSmFree(void* NodeToFree);
	RPC_SS_THREAD_HANDLE RpcSmGetThreadHandle(RPC_STATUS* pStatus);
	RPC_STATUS RpcSmSetClientAllocFree(RPC_CLIENT_ALLOC* ClientAlloc, RPC_CLIENT_FREE* ClientFree);
	RPC_STATUS RpcSmSetThreadHandle(RPC_SS_THREAD_HANDLE Id);
	RPC_STATUS RpcSmSwapClientAllocFree(RPC_CLIENT_ALLOC* ClientAlloc, RPC_CLIENT_FREE* ClientFree, RPC_CLIENT_ALLOC** OldClientAlloc, RPC_CLIENT_FREE** OldClientFree);
	void NdrRpcSsEnableAllocate(PMIDL_STUB_MESSAGE pMessage);
	void NdrRpcSsDisableAllocate(PMIDL_STUB_MESSAGE pMessage);
	void NdrRpcSmSetClientToOsf(PMIDL_STUB_MESSAGE pMessage);
	void* NdrRpcSmClientAllocate(size_t Size);
	void NdrRpcSmClientFree(void* NodeToFree);
	void* NdrRpcSsDefaultAllocate(size_t Size);
	void NdrRpcSsDefaultFree(void* NodeToFree);
	PFULL_PTR_XLAT_TABLES NdrFullPointerXlatInit(uint NumberOfPointers, XLAT_SIDE XlatSide);
	void NdrFullPointerXlatFree(PFULL_PTR_XLAT_TABLES pXlatTables);
	void* NdrAllocate(PMIDL_STUB_MESSAGE pStubMsg, size_t Len);
	void NdrClearOutParameters(PMIDL_STUB_MESSAGE pStubMsg, PFORMAT_STRING pFormat, void* ArgAddr);
	void* NdrOleAllocate(size_t Size);
	void NdrOleFree(void* NodeToFree);
}

template EXTERN_GUID(string name, uint l, ushort w1, ushort w2, ubyte b1, ubyte b2, ubyte b3, ubyte b4, ubyte b5, ubyte b6, ubyte b7, ubyte b8)
{
	mixin(std.metastrings.Format!("extern extern(C) const GUID %s;", name));
}

struct NDR_USER_MARSHAL_INFO_LEVEL1 {
	void* Buffer;
	uint BufferSize;
	extern(Windows) void* function(size_t) pfnAllocate;
	extern(Windows) void function(void*) pfnFree;
	IRpcChannelBuffer*  pRpcChannelBuffer;
	ULONG_PTR[5] Reserved;
}

struct NDR_USER_MARSHAL_INFO {
	uint InformationLevel;
	union {
		NDR_USER_MARSHAL_INFO_LEVEL1 Level1;
	}
}

export extern(Windows) RPC_STATUS NdrGetUserMarshalInfo(uint* pFlags, uint InformationLevel, NDR_USER_MARSHAL_INFO* pMarshalInfo);
export extern(Windows) RPC_STATUS NdrCreateServerInterfaceFromStub(IRpcStubBuffer pStub, RPC_SERVER_INTERFACE* pServerIf);
export extern(C) CLIENT_CALL_RETURN NdrClientCall3(MIDL_STUBLESS_PROXY_INFO* pProxyInfo, uint nProcNum, void* pReturnValue, ...);
export extern(C) CLIENT_CALL_RETURN Ndr64AsyncClientCall(MIDL_STUBLESS_PROXY_INFO* pProxyInfo, uint nProcNum, void* pReturnValue, ...);
export extern(C) CLIENT_CALL_RETURN Ndr64DcomAsyncClientCall(MIDL_STUBLESS_PROXY_INFO* pProxyInfo, uint nProcNum, void* pReturnValue, ...);
export extern(Windows) void Ndr64AsyncServerCall(PRPC_MESSAGE pRpcMsg);
export extern(Windows) void Ndr64AsyncServerCall64(PRPC_MESSAGE pRpcMsg);
export extern(Windows) void Ndr64AsyncServerCallAll(PRPC_MESSAGE pRpcMsg);
export extern(Windows) int Ndr64AsyncStubCall(IRpcStubBuffer pThis, IRpcChannelBuffer pChannel, PRPC_MESSAGE pRpcMsg, uint* pdwStubPhase);
export extern(Windows) int Ndr64DcomAsyncStubCall(IRpcStubBuffer pThis, IRpcChannelBuffer pChannel, PRPC_MESSAGE pRpcMsg, uint* pdwStubPhase);
export extern(Windows) int NdrStubCall3(void* pThis, void* pChannel, PRPC_MESSAGE pRpcMsg, uint* pdwStubPhase);
export extern(Windows) void NdrServerCallAll(PRPC_MESSAGE pRpcMsg);
export extern(Windows) void NdrServerCallNdr64(PRPC_MESSAGE pRpcMsg);
export extern(Windows) void NdrServerCall3(PRPC_MESSAGE pRpcMsg);
export extern(Windows) void NdrPartialIgnoreClientMarshall(PMIDL_STUB_MESSAGE pStubMsg, void* pMemory);
export extern(Windows) void NdrPartialIgnoreServerUnmarshall(PMIDL_STUB_MESSAGE pStubMsg, void** ppMemory);
export extern(Windows) void NdrPartialIgnoreClientBufferSize(PMIDL_STUB_MESSAGE pStubMsg, void* pMemory);
export extern(Windows) void NdrPartialIgnoreServerInitialize(PMIDL_STUB_MESSAGE pStubMsg, void** ppMemory, PFORMAT_STRING pFormat);
extern(Windows) void RpcUserFree(handle_t AsyncHandle, void* pBuffer);

} // extern(C)
} // align(8)
