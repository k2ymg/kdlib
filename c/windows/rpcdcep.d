/** rpcdcep.d

Converted from 'rpcdcep.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.rpcdcep;


import c.windows.sdkddkver;
import c.windows.windef;
import c.windows.rpc;
import c.windows.rpcdce;
import c.windows.guiddef;


extern(C){
struct RPC_VERSION {
	ushort MajorVersion;
	ushort MinorVersion;
}

struct RPC_SYNTAX_IDENTIFIER {
	GUID SyntaxGUID;
	RPC_VERSION SyntaxVersion;
}
alias RPC_SYNTAX_IDENTIFIER* PRPC_SYNTAX_IDENTIFIER;

struct RPC_MESSAGE {
	RPC_BINDING_HANDLE Handle;
	uint DataRepresentation;
	void* Buffer;
	uint BufferLength;
	uint ProcNum;
	PRPC_SYNTAX_IDENTIFIER TransferSyntax;
	void* RpcInterfaceInformation;
	void* ReservedForRuntime;
	RPC_MGR_EPV* ManagerEpv;
	void* ImportContext;
	uint RpcFlags;
}
alias RPC_MESSAGE* PRPC_MESSAGE;

alias extern(Windows) RPC_STATUS function(UUID* InterfaceId, RPC_VERSION* InterfaceVersion, UUID* ObjectId, ubyte* Rpcpro, void** ppDestEndpoint) RPC_FORWARD_FUNCTION;

enum  {
	PROTOCOL_NOT_LOADED = 1,
	PROTOCOL_LOADED,
	PROTOCOL_ADDRESS_CHANGE
}
alias int RPC_ADDRESS_CHANGE_TYPE;

alias extern(Windows) void function(void* arg) RPC_ADDRESS_CHANGE_FN;

/*
RPC_CONTEXT_HANDLE_DEFAULT_GUARD  = cast(void*)cast(ULONG_PTR)0xFFFFF00D;
RPC_CONTEXT_HANDLE_DEFAULT_FLAGS  = 0x00000000;
RPC_CONTEXT_HANDLE_FLAGS          = 0x30000000;
RPC_CONTEXT_HANDLE_SERIALIZE      = 0x10000000;
RPC_CONTEXT_HANDLE_DONT_SERIALIZE = 0x20000000;
//(NTDDI_VERSION >= NTDDI_VISTA)
	RPC_TYPE_STRICT_CONTEXT_HANDLE = 0x40000000;
*/

enum {
	RPC_NCA_FLAGS_DEFAULT    = 0x00000000,
	RPC_NCA_FLAGS_IDEMPOTENT = 0x00000001,
	RPC_NCA_FLAGS_BROADCAST  = 0x00000002,
	RPC_NCA_FLAGS_MAYBE      = 0x00000004,
}
//(NTDDI_VERSION >= NTDDI_VISTA)
	enum RPCFLG_HAS_GUARANTEE = 0x00000010u;
enum {
	RPC_BUFFER_COMPLETE = 0x00001000,
	RPC_BUFFER_PARTIAL  = 0x00002000,
	RPC_BUFFER_EXTRA    = 0x00004000,
	RPC_BUFFER_ASYNC    = 0x00008000,
	RPC_BUFFER_NONOTIFY = 0x00010000,
}
enum {
	RPCFLG_MESSAGE           = 0x01000000u,
	RPCFLG_AUTO_COMPLETE     = 0x08000000u,
	RPCFLG_LOCAL_CALL        = 0x10000000u,
	RPCFLG_INPUT_SYNCHRONOUS = 0x20000000u,
	RPCFLG_ASYNCHRONOUS      = 0x40000000u,
	RPCFLG_NON_NDR           = 0x80000000u,
}
//(NTDDI_VERSION >= NTDDI_WINXP)
	enum {
		RPCFLG_HAS_MULTI_SYNTAXES = 0x02000000u,
		RPCFLG_HAS_CALLBACK       = 0x04000000u,
	}


//(NTDDI_VERSION >= NTDDI_VISTA)
	enum {
		RPCFLG_ACCESSIBILITY_BIT1       = 0x00100000u,
		RPCFLG_ACCESSIBILITY_BIT2       = 0x00200000u,
		RPCFLG_ACCESS_LOCAL             = 0x00400000u,
		NDR_CUSTOM_OR_DEFAULT_ALLOCATOR = 0x10000000u,
		NDR_DEFAULT_ALLOCATOR           = 0x20000000u,
	}

enum RPC_FLAGS_VALID_BIT = 0x00008000;

alias extern(Windows) void function(PRPC_MESSAGE Message) RPC_DISPATCH_FUNCTION;

struct RPC_DISPATCH_TABLE {
	uint DispatchTableCount;
	RPC_DISPATCH_FUNCTION* DispatchTable;
	LONG_PTR Reserved;
}
alias RPC_DISPATCH_TABLE* PRPC_DISPATCH_TABLE;

struct RPC_PROTSEQ_ENDPOINT {
	char* RpcProtocolSequence;
	char* Endpoint;
}
alias RPC_PROTSEQ_ENDPOINT* PRPC_PROTSEQ_ENDPOINT;


enum NT351_INTERFACE_SIZE = 0x40;
enum RPC_INTERFACE_HAS_PIPES = 0x0001;

struct RPC_SERVER_INTERFACE {
	uint Length;
	RPC_SYNTAX_IDENTIFIER InterfaceId;
	RPC_SYNTAX_IDENTIFIER TransferSyntax;
	PRPC_DISPATCH_TABLE DispatchTable;
	uint RpcProtseqEndpointCount;
	PRPC_PROTSEQ_ENDPOINT RpcProtseqEndpoint;
	RPC_MGR_EPV* DefaultManagerEpv;
	void* InterpreterInfo;
	uint Flags;
}
alias RPC_SERVER_INTERFACE* PRPC_SERVER_INTERFACE;

struct RPC_CLIENT_INTERFACE {
	uint Length;
	RPC_SYNTAX_IDENTIFIER InterfaceId;
	RPC_SYNTAX_IDENTIFIER TransferSyntax;
	PRPC_DISPATCH_TABLE DispatchTable;
	uint RpcProtseqEndpointCount;
	PRPC_PROTSEQ_ENDPOINT RpcProtseqEndpoint;
	ULONG_PTR Reserved;
	void* InterpreterInfo;
	uint Flags;
}
alias RPC_CLIENT_INTERFACE* PRPC_CLIENT_INTERFACE;


static if(NTDDI_VERSION >= NTDDI_WINXP)
	export extern(Windows) RPC_STATUS I_RpcNegotiateTransferSyntax(RPC_MESSAGE* Message);

export extern(Windows) RPC_STATUS I_RpcGetBuffer(RPC_MESSAGE* Message);
export extern(Windows) RPC_STATUS I_RpcGetBufferWithObject(RPC_MESSAGE* Message, UUID* ObjectUuid);
export extern(Windows) RPC_STATUS I_RpcSendReceive(RPC_MESSAGE* Message);
export extern(Windows) RPC_STATUS I_RpcFreeBuffer(RPC_MESSAGE* Message);
export extern(Windows) RPC_STATUS I_RpcSend(PRPC_MESSAGE Message);
export extern(Windows) RPC_STATUS I_RpcReceive(PRPC_MESSAGE Message, uint Size);
export extern(Windows) RPC_STATUS I_RpcFreePipeBuffer(RPC_MESSAGE* Message);
export extern(Windows) RPC_STATUS I_RpcReallocPipeBuffer(PRPC_MESSAGE Message, uint NewSize);

enum I_RPC_MUTEX : void* {init = (void*).init}

export extern(Windows) void I_RpcRequestMutex(I_RPC_MUTEX* Mutex);
export extern(Windows) void I_RpcClearMutex(I_RPC_MUTEX Mutex);
export extern(Windows) void I_RpcDeleteMutex(I_RPC_MUTEX Mutex);
export extern(Windows) void* I_RpcAllocate(uint Size);
export extern(Windows) void I_RpcFree(void* Object);
export extern(Windows) void I_RpcPauseExecution(uint Milliseconds);
export extern(Windows) RPC_STATUS I_RpcGetExtendedError();

alias  extern(Windows) void function(void* AssociationContext) PRPC_RUNDOWN;

export extern(Windows) RPC_STATUS I_RpcMonitorAssociation(RPC_BINDING_HANDLE Handle, PRPC_RUNDOWN RundownRoutine, void* Context);
export extern(Windows) RPC_STATUS I_RpcStopMonitorAssociation(RPC_BINDING_HANDLE Handle);
export extern(Windows) RPC_BINDING_HANDLE I_RpcGetCurrentCallHandle();
export extern(Windows) RPC_STATUS I_RpcGetAssociationContext (RPC_BINDING_HANDLE BindingHandle, void** AssociationContext);
export extern(Windows) void* I_RpcGetServerContextList(RPC_BINDING_HANDLE BindingHandle);
export extern(Windows) void I_RpcSetServerContextList(RPC_BINDING_HANDLE BindingHandle, void* ServerContextList);
export extern(Windows) RPC_STATUS I_RpcNsInterfaceExported(uint EntryNameSyntax, ushort* EntryName, RPC_SERVER_INTERFACE* RpcInterfaceInformation);
export extern(Windows) RPC_STATUS I_RpcNsInterfaceUnexported(uint EntryNameSyntax, ushort* EntryName, RPC_SERVER_INTERFACE* RpcInterfaceInformation);
export extern(Windows) RPC_STATUS I_RpcBindingToStaticStringBindingW(RPC_BINDING_HANDLE Binding, ushort** StringBinding );
export extern(Windows) RPC_STATUS I_RpcBindingInqSecurityContext(RPC_BINDING_HANDLE Binding, void** SecurityContextHandle);
static if(NTDDI_VERSION >= NTDDI_VISTA)
	export extern(Windows) RPC_STATUS I_RpcBindingInqSecurityContextKeyInfo(RPC_BINDING_HANDLE Binding, void* KeyInfo);
export extern(Windows) RPC_STATUS I_RpcBindingInqWireIdForSnego(RPC_BINDING_HANDLE Binding, RPC_CSTR WireId);
static if(NTDDI_VERSION >= NTDDI_WS03)
	export extern(Windows) RPC_STATUS I_RpcBindingInqMarshalledTargetInfo(RPC_BINDING_HANDLE Binding, uint* MarshalledTargetInfoSize, RPC_CSTR* MarshalledTargetInfo);
static if(NTDDI_VERSION >= NTDDI_WINXP){
	export extern(Windows) RPC_STATUS I_RpcBindingInqLocalClientPID(RPC_BINDING_HANDLE Binding, uint* Pid);
	export extern(Windows) RPC_STATUS I_RpcBindingHandleToAsyncHandle(RPC_BINDING_HANDLE Binding, void** AsyncHandle);
}

export extern(Windows) RPC_STATUS I_RpcNsBindingSetEntryNameW(RPC_BINDING_HANDLE Binding, uint EntryNameSyntax, RPC_WSTR EntryName);
export extern(Windows) RPC_STATUS I_RpcNsBindingSetEntryNameA(RPC_BINDING_HANDLE Binding, uint EntryNameSyntax, RPC_CSTR EntryName);
export extern(Windows) RPC_STATUS I_RpcServerUseProtseqEp2A(RPC_CSTR NetworkAddress, RPC_CSTR Protseq, uint MaxCalls, RPC_CSTR Endpoint, void* SecurityDescriptor, void* Policy);
export extern(Windows) RPC_STATUS I_RpcServerUseProtseqEp2W(RPC_WSTR NetworkAddress, RPC_WSTR Protseq, uint MaxCalls, RPC_WSTR Endpoint, void* SecurityDescriptor, void* Policy);
export extern(Windows) RPC_STATUS I_RpcServerUseProtseq2W(RPC_WSTR NetworkAddress, RPC_WSTR Protseq, uint MaxCalls, void* SecurityDescriptor, void* Policy);
export extern(Windows) RPC_STATUS I_RpcServerUseProtseq2A(RPC_CSTR NetworkAddress, RPC_CSTR Protseq, uint MaxCalls, void* SecurityDescriptor, void* Policy);
version(UNICODE){
	alias I_RpcNsBindingSetEntryNameW I_RpcNsBindingSetEntryName;
	alias I_RpcServerUseProtseqEp2W I_RpcServerUseProtseqEp2;
	alias I_RpcServerUseProtseq2W I_RpcServerUseProtseq2;
}else{
	alias I_RpcNsBindingSetEntryNameA I_RpcNsBindingSetEntryName;
	alias I_RpcServerUseProtseqEp2A I_RpcServerUseProtseqEp2;
	alias I_RpcServerUseProtseq2A I_RpcServerUseProtseq2;
}

export extern(Windows) RPC_STATUS I_RpcServerStartService(RPC_WSTR Protseq, RPC_WSTR Endpoint, RPC_IF_HANDLE IfSpec);

export extern(Windows) RPC_STATUS I_RpcBindingInqDynamicEndpointW(RPC_BINDING_HANDLE Binding, RPC_WSTR* DynamicEndpoint);
export extern(Windows) RPC_STATUS I_RpcBindingInqDynamicEndpointA(RPC_BINDING_HANDLE Binding, RPC_CSTR* DynamicEndpoint);

version(UNICODE)
	alias I_RpcBindingInqDynamicEndpointW I_RpcBindingInqDynamicEndpoint;
else
	alias I_RpcBindingInqDynamicEndpointA I_RpcBindingInqDynamicEndpoint;

static if(NTDDI_VERSION >= NTDDI_WINXP)
	export extern(Windows) RPC_STATUS I_RpcServerCheckClientRestriction(RPC_BINDING_HANDLE Context);

enum {
	TRANSPORT_TYPE_CN   = 0x01,
	TRANSPORT_TYPE_DG   = 0x02,
	TRANSPORT_TYPE_LPC  = 0x04,
	TRANSPORT_TYPE_WMSG = 0x08,
}

export extern(Windows) RPC_STATUS I_RpcBindingInqTransportType(RPC_BINDING_HANDLE Binding, uint* Type);

struct RPC_TRANSFER_SYNTAX {
	UUID Uuid;
	ushort VersMajor;
	ushort VersMinor;
}

export extern(Windows) RPC_STATUS I_RpcIfInqTransferSyntaxes(RPC_IF_HANDLE RpcIfHandle, RPC_TRANSFER_SYNTAX* TransferSyntaxes, uint TransferSyntaxSize, uint* TransferSyntaxCount);
export extern(Windows) RPC_STATUS I_UuidCreate(UUID* Uuid);
export extern(Windows) RPC_STATUS I_RpcBindingCopy(RPC_BINDING_HANDLE SourceBinding, RPC_BINDING_HANDLE* DestinationBinding);
export extern(Windows) RPC_STATUS I_RpcBindingIsClientLocal(RPC_BINDING_HANDLE BindingHandle, uint* ClientLocalFlag);
export extern(Windows) RPC_STATUS I_RpcBindingInqConnId(RPC_BINDING_HANDLE Binding, void** ConnId, int* pfFirstCall);
export extern(Windows) RPC_STATUS I_RpcBindingCreateNP(RPC_WSTR ServerName, RPC_WSTR ServiceName, RPC_WSTR NetworkOptions, RPC_BINDING_HANDLE* Binding);
export extern(Windows) void I_RpcSsDontSerializeContext();
export extern(Windows) RPC_STATUS I_RpcLaunchDatagramReceiveThread(void* pAddress);
export extern(Windows) RPC_STATUS I_RpcServerRegisterForwardFunction(RPC_FORWARD_FUNCTION* pForwardFunction);
RPC_ADDRESS_CHANGE_FN* I_RpcServerInqAddressChangeFn();
RPC_STATUS I_RpcServerSetAddressChangeFn(RPC_ADDRESS_CHANGE_FN* pAddressChangeFn);

//(NTDDI_VERSION >= NTDDI_WINXP)
	enum {
		RPC_P_ADDR_FORMAT_TCP_IPV4 = 1,
		RPC_P_ADDR_FORMAT_TCP_IPV6 = 2,
	}

static if(NTDDI_VERSION >= NTDDI_WINXP){
	export extern(Windows) RPC_STATUS I_RpcServerInqLocalConnAddress(RPC_BINDING_HANDLE Binding, void* Buffer, uint* BufferSize, uint* AddressFormat);
	export extern(Windows) RPC_STATUS I_RpcServerInqRemoteConnAddress(RPC_BINDING_HANDLE Binding, void* Buffer, uint* BufferSize, uint* AddressFormat);
	export extern(Windows) void I_RpcSessionStrictContextHandle();
	export extern(Windows) RPC_STATUS I_RpcTurnOnEEInfoPropagation();
}

export extern(Windows) RPC_STATUS I_RpcConnectionInqSockBuffSize(uint* RecvBuffSize, uint* SendBuffSize);
export extern(Windows) RPC_STATUS I_RpcConnectionSetSockBuffSize(uint RecvBuffSize, uint SendBuffSize);
alias extern(Windows) void function(void* Buffer, uint BufferLength, int fDatagram) RPCLT_PDU_FILTER_FUNC;
alias extern(C) void function(RPCLT_PDU_FILTER_FUNC pfnFilter) RPC_SETFILTER_FUNC;


/*
//!WINNT
export extern(Windows) RPC_STATUS I_RpcServerStartListening(void* hWnd);
export extern(Windows) RPC_STATUS I_RpcServerStopListening();
alias extern(Windows) RPC_STATUS function(void* hWnd, void* Context, void* hSyncEvent) RPC_BLOCKING_FN;
export extern(Windows) RPC_STATUS I_RpcBindingSetAsync(RPC_BINDING_HANDLE Binding, RPC_BLOCKING_FN BlockingFn, uint ServerTid);
export extern(Windows) RPC_STATUS I_RpcSetThreadParams(int fClientFree, void* Context, void* hWndClient);
export extern(Windows) uint I_RpcWindowProc(void* hWnd, uint Message, uint wParam, uint lParam);
export extern(Windows) RPC_STATUS I_RpcServerUnregisterEndpointA(RPC_CSTR Protseq, RPC_CSTR Endpoint);
export extern(Windows) RPC_STATUS I_RpcServerUnregisterEndpointW(RPC_WSTR Protseq, RPC_WSTR Endpoint);
version(UNICODE)
	alias I_RpcServerUnregisterEndpointW I_RpcServerUnregisterEndpoint;
else
	alias I_RpcServerUnregisterEndpointA I_RpcServerUnregisterEndpoint;

*/

export extern(Windows) RPC_STATUS I_RpcServerInqTransportType(uint* Type);
export extern(Windows) int I_RpcMapWin32Status(RPC_STATUS Status);

//(NTDDI_VERSION >= NTDDI_WS03)
	enum {
		RPC_C_OPT_SESSION_ID         = 6,
		RPC_C_OPT_COOKIE_AUTH        = 7,
		RPC_C_OPT_RESOURCE_TYPE_UUID = 8,
	}

	struct RPC_C_OPT_COOKIE_AUTH_DESCRIPTOR {
		uint BufferSize;
		char* Buffer;
	}

	struct RDR_CALLOUT_STATE {
		RPC_STATUS LastError;
		void* LastEEInfo;
		RPC_HTTP_REDIRECTOR_STAGE LastCalledStage;
		ushort* ServerName;
		ushort* ServerPort;
		ushort* RemoteUser;
		ushort* AuthType;
		ubyte  ResourceTypePresent;
		ubyte SessionIdPresent;
		ubyte InterfacePresent;
		UUID ResourceType;
		UUID SessionId;
		RPC_SYNTAX_IDENTIFIER Interface;
		void* CertContext;
	}


//(NTDDI_VERSION >= NTDDI_WINXP)
	alias RPC_STATUS function(RPC_WSTR Machine, RPC_WSTR DotMachine, uint PortNumber) I_RpcProxyIsValidMachineFn;
	alias RPC_STATUS function(void* Context, char* Buffer, uint* BufferLength) I_RpcProxyGetClientAddressFn;
	alias RPC_STATUS function(uint* ConnectionTimeout) I_RpcProxyGetConnectionTimeoutFn;

//(NTDDI_VERSION >= NTDDI_WS03)
	alias RPC_STATUS function(void* Context, RDR_CALLOUT_STATE* CallOutState, RPC_HTTP_REDIRECTOR_STAGE Stage) I_RpcPerformCalloutFn;
	alias void function(RDR_CALLOUT_STATE* CallOutState) I_RpcFreeCalloutStateFn;
	alias RPC_STATUS function(void* Context, int* SessionIdPresent, UUID* SessionId, int* ResourceIdPresent, UUID* ResourceId) I_RpcProxyGetClientSessionAndResourceUUID;

//(NTDDI_VERSION >= NTDDI_VISTA)
	alias  RPC_STATUS function(void* Context, UUID* IfUuid, ushort IfMajorVersion, int* fAllow) I_RpcProxyFilterIfFn;

	enum {
		RpcCurrentUniqueUser = 1,
		RpcBackEndConnectionAttempts,
		RpcBackEndConnectionFailed,
		RpcRequestsPerSecond,
		RpcIncomingConnections,
		RpcIncomingBandwidth,
		RpcOutgoingBandwidth,
		RpcAttemptedLbsDecisions,
		RpcFailedLbsDecisions,
		RpcAttemptedLbsMessages,
		RpcFailedLbsMessages,
		RpcLastCounter
	} 
	alias int RpcPerfCounters;

	alias void function(RpcPerfCounters Counter, int ModifyTrend, uint Size) I_RpcProxyUpdatePerfCounterFn;
	alias void function(ushort* MachineName, int IsConnectEvent) I_RpcProxyUpdatePerfCounterBackendServerFn;

//(NTDDI_VERSION >= NTDDI_WINXP)
	enum {
		RPC_PROXY_CONNECTION_TYPE_IN_PROXY  = 0,
		RPC_PROXY_CONNECTION_TYPE_OUT_PROXY = 1,
	}

	//(NTDDI_VERSION >= NTDDI_WS03)
		struct I_RpcProxyCallbackInterface {
			I_RpcProxyIsValidMachineFn IsValidMachineFn;
			I_RpcProxyGetClientAddressFn GetClientAddressFn;
			I_RpcProxyGetConnectionTimeoutFn GetConnectionTimeoutFn;
			I_RpcPerformCalloutFn PerformCalloutFn;
			I_RpcFreeCalloutStateFn FreeCalloutStateFn;
			I_RpcProxyGetClientSessionAndResourceUUID GetClientSessionAndResourceUUIDFn;
			//(NTDDI_VERSION >= NTDDI_VISTA)
				I_RpcProxyFilterIfFn ProxyFilterIfFn;
				I_RpcProxyUpdatePerfCounterFn RpcProxyUpdatePerfCounterFn;
				I_RpcProxyUpdatePerfCounterBackendServerFn RpcProxyUpdatePerfCounterBackendServerFn;
		}
	static if(NTDDI_VERSION >= NTDDI_WS03)
		export extern(Windows) RPC_STATUS I_RpcProxyNewConnection(uint ConnectionType, ushort* ServerAddress, ushort* ServerPort, ushort* MinConnTimeout, void* ConnectionParameter, RDR_CALLOUT_STATE* CallOutState,  I_RpcProxyCallbackInterface* ProxyCallbackInterface);
	/*}else{
		struct I_RpcProxyCallbackInterface {
			I_RpcProxyIsValidMachineFn IsValidMachineFn;
			I_RpcProxyGetClientAddressFn GetClientAddressFn;
			I_RpcProxyGetConnectionTimeoutFn GetConnectionTimeoutFn;
		} 
		export extern(Windows) RPC_STATUS I_RpcProxyNewConnection(uint ConnectionType, ushort* ServerAddress, ushort* ServerPort, void* ConnectionParameter, I_RpcProxyCallbackInterface* ProxyCallbackInterface);
	}*/


static if(NTDDI_VERSION >= NTDDI_WS03){
	export extern(Windows) RPC_STATUS I_RpcReplyToClientWithStatus(void* ConnectionParameter, RPC_STATUS RpcStatus);
	export extern(Windows) void I_RpcRecordCalloutFailure(RPC_STATUS RpcStatus,RDR_CALLOUT_STATE* CallOutState, ushort* DllName);
}

static if(NTDDI_VERSION >= NTDDI_WIN7)
	export extern(Windows) RPC_STATUS I_RpcMgmtEnableDedicatedThreadPool();


} // extern(C)
