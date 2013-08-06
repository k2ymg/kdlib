/** rpcdce.d

Converted from 'rpcdce.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.rpcdce;


import c.windows.sdkddkver;
import c.windows.windef;
import c.windows.basetsd;
import c.windows.rpc;
import c.windows.guiddef;


extern(C){

alias char* RPC_CSTR;

alias wchar* RPC_WSTR;
alias const(wchar)* RPC_CWSTR;

alias I_RPC_HANDLE RPC_BINDING_HANDLE;
alias RPC_BINDING_HANDLE handle_t;
alias RPC_BINDING_HANDLE rpc_binding_handle_t;

alias GUID UUID;

struct RPC_BINDING_VECTOR {
	uint Count;
	RPC_BINDING_HANDLE[1] BindingH;
}
//alias RPC_BINDING_VECTOR rpc_binding_vector_t;

struct UUID_VECTOR {
  uint Count;
  UUID*[1] Uuid;
}
//alias UUID_VECTOR uuid_vector_t;
enum RPC_IF_HANDLE : void* {init = (void*).init}

struct RPC_IF_ID {
	UUID Uuid;
	ushort VersMajor;
	ushort VersMinor;
}

enum {
	RPC_C_BINDING_INFINITE_TIMEOUT = 10,
	RPC_C_BINDING_MIN_TIMEOUT      = 0,
	RPC_C_BINDING_DEFAULT_TIMEOUT  = 5,
	RPC_C_BINDING_MAX_TIMEOUT      = 9,
	RPC_C_CANCEL_INFINITE_TIMEOUT  = -1,
	RPC_C_LISTEN_MAX_CALLS_DEFAULT = 1234,
	RPC_C_PROTSEQ_MAX_REQS_DEFAULT = 10,
	RPC_C_BIND_TO_ALL_NICS         = 1,
	RPC_C_USE_INTERNET_PORT        = 0x1,
	RPC_C_USE_INTRANET_PORT        = 0x2,
	RPC_C_DONT_FAIL                = 0x4,
	RPC_C_RPCHTTP_USE_LOAD_BALANCE = 0x8,
}

enum {
	RPC_C_MQ_TEMPORARY                 = 0x0000,
	RPC_C_MQ_PERMANENT                 = 0x0001,
	RPC_C_MQ_CLEAR_ON_OPEN             = 0x0002,
	RPC_C_MQ_USE_EXISTING_SECURITY     = 0x0004,
	RPC_C_MQ_AUTHN_LEVEL_NONE          = 0x0000,
	RPC_C_MQ_AUTHN_LEVEL_PKT_INTEGRITY = 0x0008,
	RPC_C_MQ_AUTHN_LEVEL_PKT_PRIVACY   = 0x0010,
	RPC_C_MQ_EXPRESS                   = 0,
	RPC_C_MQ_RECOVERABLE               = 1,
	RPC_C_MQ_JOURNAL_NONE              = 0,
	RPC_C_MQ_JOURNAL_DEADLETTER        = 1,
	RPC_C_MQ_JOURNAL_ALWAYS            = 2,
	RPC_C_OPT_MQ_DELIVERY              = 1,
	RPC_C_OPT_MQ_PRIORITY              = 2,
	RPC_C_OPT_MQ_JOURNAL               = 3,
	RPC_C_OPT_MQ_ACKNOWLEDGE           = 4,
	RPC_C_OPT_MQ_AUTHN_SERVICE         = 5,
	RPC_C_OPT_MQ_AUTHN_LEVEL           = 6,
	RPC_C_OPT_MQ_TIME_TO_REACH_QUEUE   = 7,
	RPC_C_OPT_MQ_TIME_TO_BE_RECEIVED   = 8,
	RPC_C_OPT_BINDING_NONCAUSAL        = 9,
	RPC_C_OPT_SECURITY_CALLBACK        = 10,
	RPC_C_OPT_UNIQUE_BINDING           = 11,
	RPC_C_OPT_TRANS_SEND_BUFFER_SIZE   = 5,
	RPC_C_OPT_CALL_TIMEOUT             = 12,
	RPC_C_OPT_DONT_LINGER              = 13,
		//(NTDDI_VERSION >= NTDDI_WS03)
	RPC_C_OPT_TRUST_PEER               = 14,
	RPC_C_OPT_ASYNC_BLOCK              = 15,
	RPC_C_OPT_OPTIMIZE_TIME            = 16,
	RPC_C_OPT_MAX_OPTIONS              = 17,
}
enum RPC_C_FULL_CERT_CHAIN = 0x0001;

struct RPC_PROTSEQ_VECTORA {
	uint Count;
	ubyte*[1] Protseq;
}

struct RPC_PROTSEQ_VECTORW {
	uint Count;
	ushort*[1] Protseq;
} 

version(UNICODE)
	alias RPC_PROTSEQ_VECTORW RPC_PROTSEQ_VECTOR;
else
	alias RPC_PROTSEQ_VECTORA RPC_PROTSEQ_VECTOR;


struct RPC_POLICY {
	uint Length;
	uint EndpointFlags;
	uint NICFlags;
}
alias RPC_POLICY* PRPC_POLICY ;

alias extern(Windows) void function(UUID* ObjectUuid, UUID* TypeUuid, RPC_STATUS* Status) RPC_OBJECT_INQ_FN;
alias extern(Windows) RPC_STATUS function(RPC_IF_HANDLE InterfaceUuid, void* Context) RPC_IF_CALLBACK_FN;
alias extern(Windows) void function(void* Context) RPC_SECURITY_CALLBACK_FN;

alias void RPC_MGR_EPV;

struct RPC_STATS_VECTOR {
	uint Count;
	uint[1] Stats;
}

enum {
	RPC_C_STATS_CALLS_IN  = 0,
	RPC_C_STATS_CALLS_OUT = 1,
	RPC_C_STATS_PKTS_IN   = 2,
	RPC_C_STATS_PKTS_OUT  = 3,
}

struct RPC_IF_ID_VECTOR {
	uint Count;
	RPC_IF_ID*[1] IfId;
}

export extern(Windows) RPC_STATUS RpcBindingCopy(RPC_BINDING_HANDLE SourceBinding, RPC_BINDING_HANDLE* DestinationBinding);
export extern(Windows) RPC_STATUS RpcBindingFree(RPC_BINDING_HANDLE* Binding);
export extern(Windows) RPC_STATUS RpcBindingSetOption(RPC_BINDING_HANDLE hBinding, uint option, ULONG_PTR optionValue);
export extern(Windows) RPC_STATUS RpcBindingInqOption(RPC_BINDING_HANDLE hBinding, uint option, ULONG_PTR* pOptionValue);

export extern(Windows) RPC_STATUS RpcBindingFromStringBindingA(RPC_CSTR StringBinding, RPC_BINDING_HANDLE* Binding);
export extern(Windows) RPC_STATUS RpcBindingFromStringBindingW(RPC_WSTR StringBinding, RPC_BINDING_HANDLE* Binding);
version(UNICODE)
	alias RpcBindingFromStringBindingW RpcBindingFromStringBinding;
else
	alias RpcBindingFromStringBindingA RpcBindingFromStringBinding;


export extern(Windows) RPC_STATUS RpcSsGetContextBinding(void* ContextHandle, RPC_BINDING_HANDLE* Binding);
export extern(Windows) RPC_STATUS RpcBindingInqObject(RPC_BINDING_HANDLE Binding, UUID* ObjectUuid);
export extern(Windows) RPC_STATUS RpcBindingReset(RPC_BINDING_HANDLE Binding);

export extern(Windows) RPC_STATUS RpcBindingSetObject(RPC_BINDING_HANDLE Binding, UUID* ObjectUuid);
export extern(Windows) RPC_STATUS RpcMgmtInqDefaultProtectLevel(uint AuthnSvc, uint* AuthnLevel);

export extern(Windows) RPC_STATUS RpcBindingToStringBindingA(RPC_BINDING_HANDLE Binding, RPC_CSTR* StringBinding);
export extern(Windows) RPC_STATUS RpcBindingToStringBindingW(RPC_BINDING_HANDLE Binding, RPC_WSTR* StringBinding);
version(UNICODE)
	alias RpcBindingToStringBindingW RpcBindingToStringBinding;
else
	alias RpcBindingToStringBindingA RpcBindingToStringBinding;


export extern(Windows) RPC_STATUS RpcBindingVectorFree(RPC_BINDING_VECTOR** BindingVector);

export extern(Windows) RPC_STATUS RpcStringBindingComposeA(RPC_CSTR ObjUuid, RPC_CSTR ProtSeq, RPC_CSTR NetworkAddr, RPC_CSTR Endpoint, RPC_CSTR Options, RPC_CSTR* StringBinding);
export extern(Windows) RPC_STATUS RpcStringBindingComposeW(RPC_WSTR ObjUuid, RPC_WSTR ProtSeq, RPC_WSTR NetworkAddr, RPC_WSTR Endpoint, RPC_WSTR Options, RPC_WSTR* StringBinding);
version(UNICODE)
	alias RpcStringBindingComposeW RpcStringBindingCompose;
else
	alias RpcStringBindingComposeA RpcStringBindingCompose;

export extern(Windows) RPC_STATUS RpcStringBindingParseA(RPC_CSTR StringBinding, RPC_CSTR* ObjUuid, RPC_CSTR* Protseq, RPC_CSTR* NetworkAddr, RPC_CSTR* Endpoint, RPC_CSTR* NetworkOptions);
export extern(Windows) RPC_STATUS RpcStringBindingParseW(RPC_WSTR StringBinding, RPC_WSTR* ObjUuid, RPC_WSTR* Protseq, RPC_WSTR* NetworkAddr, RPC_WSTR* Endpoint, RPC_WSTR* NetworkOptions);
version(UNICODE)
	alias RpcStringBindingParseW RpcStringBindingParse;
else
	alias RpcStringBindingParseA RpcStringBindingParse;


export extern(Windows) RPC_STATUS RpcStringFreeA(RPC_CSTR* String);
export extern(Windows) RPC_STATUS RpcStringFreeW(RPC_WSTR* String);
version(UNICODE)
	alias RpcStringFreeW RpcStringFree;
else
	alias RpcStringFreeA RpcStringFree;


export extern(Windows) RPC_STATUS RpcIfInqId(RPC_IF_HANDLE RpcIfHandle, RPC_IF_ID* RpcIfId);

export extern(Windows) RPC_STATUS RpcNetworkIsProtseqValidA(RPC_CSTR Protseq);
export extern(Windows) RPC_STATUS RpcNetworkIsProtseqValidW(RPC_WSTR Protseq);
version(UNICODE)
	alias RpcNetworkIsProtseqValidW RpcNetworkIsProtseqValid;
else
	alias RpcNetworkIsProtseqValidA RpcNetworkIsProtseqValid;


export extern(Windows) RPC_STATUS RpcMgmtInqComTimeout(RPC_BINDING_HANDLE Binding, uint* Timeout);
export extern(Windows) RPC_STATUS RpcMgmtSetComTimeout(RPC_BINDING_HANDLE Binding, uint Timeout);
export extern(Windows) RPC_STATUS RpcMgmtSetCancelTimeout(int Timeout);

export extern(Windows) RPC_STATUS RpcNetworkInqProtseqsA(RPC_PROTSEQ_VECTORA** ProtseqVector);
export extern(Windows) RPC_STATUS RpcNetworkInqProtseqsW(RPC_PROTSEQ_VECTORW** ProtseqVector);
version(UNICODE)
	alias RpcNetworkInqProtseqsW RpcNetworkInqProtseqs;
else
	alias RpcNetworkInqProtseqsA RpcNetworkInqProtseqs;

export extern(Windows) RPC_STATUS RpcObjectInqType(UUID* ObjUuid, UUID* TypeUuid);
export extern(Windows) RPC_STATUS RpcObjectSetInqFn(RPC_OBJECT_INQ_FN* InquiryFn);
export extern(Windows) RPC_STATUS RpcObjectSetType(UUID* ObjUuid, UUID* TypeUuid);

export extern(Windows) RPC_STATUS RpcProtseqVectorFreeA(RPC_PROTSEQ_VECTORA** ProtseqVector);
export extern(Windows) RPC_STATUS RpcProtseqVectorFreeW(RPC_PROTSEQ_VECTORW** ProtseqVector);
version(UNICODE)
	alias RpcProtseqVectorFreeW RpcProtseqVectorFree;
else
	alias RpcProtseqVectorFreeA RpcProtseqVectorFree;


export extern(Windows) RPC_STATUS RpcServerInqBindings(RPC_BINDING_VECTOR** BindingVector);
export extern(Windows) RPC_STATUS RpcServerInqIf(RPC_IF_HANDLE IfSpec, UUID* MgrTypeUuid, RPC_MGR_EPV** MgrEpv);
export extern(Windows) RPC_STATUS RpcServerListen(uint MinimumCallThreads, uint MaxCalls, uint DontWait);
export extern(Windows) RPC_STATUS RpcServerRegisterIf(RPC_IF_HANDLE IfSpec, UUID* MgrTypeUuid, RPC_MGR_EPV* MgrEpv);
export extern(Windows) RPC_STATUS RpcServerRegisterIfEx(RPC_IF_HANDLE IfSpec, UUID* MgrTypeUuid, RPC_MGR_EPV* MgrEpv, uint Flags, uint MaxCalls, RPC_IF_CALLBACK_FN* IfCallback);
export extern(Windows) RPC_STATUS RpcServerRegisterIf2(RPC_IF_HANDLE IfSpec, UUID* MgrTypeUuid, RPC_MGR_EPV* MgrEpv, uint Flags, uint MaxCalls, uint MaxRpcSize, RPC_IF_CALLBACK_FN* IfCallbackFn);
export extern(Windows) RPC_STATUS RpcServerUnregisterIf(RPC_IF_HANDLE IfSpec, UUID* MgrTypeUuid, uint WaitForCallsToComplete);

static if(NTDDI_VERSION >= NTDDI_WINXP)
	export extern(Windows) RPC_STATUS RpcServerUnregisterIfEx(RPC_IF_HANDLE IfSpec, UUID* MgrTypeUuid, int RundownContextHandles);

export extern(Windows) RPC_STATUS RpcServerUseAllProtseqs(uint MaxCalls, void* SecurityDescriptor);
export extern(Windows) RPC_STATUS RpcServerUseAllProtseqsEx(uint MaxCalls, void* SecurityDescriptor, PRPC_POLICY Policy);
export extern(Windows) RPC_STATUS RpcServerUseAllProtseqsIf(uint MaxCalls, RPC_IF_HANDLE IfSpec, void* SecurityDescriptor);
export extern(Windows) RPC_STATUS RpcServerUseAllProtseqsIfEx(uint MaxCalls, RPC_IF_HANDLE IfSpec, void* SecurityDescriptor, PRPC_POLICY Policy);

export extern(Windows) RPC_STATUS RpcServerUseProtseqA(RPC_CSTR Protseq, uint MaxCalls, void* SecurityDescriptor);
export extern(Windows) RPC_STATUS RpcServerUseProtseqExA(RPC_CSTR Protseq, uint MaxCalls, void* SecurityDescriptor, PRPC_POLICY Policy);
export extern(Windows) RPC_STATUS RpcServerUseProtseqW(RPC_WSTR Protseq, uint MaxCalls, void* SecurityDescriptor);
export extern(Windows) RPC_STATUS RpcServerUseProtseqExW(RPC_WSTR Protseq, uint MaxCalls, void* SecurityDescriptor, PRPC_POLICY Policy);
version(UNICODE){
	alias RpcServerUseProtseqW RpcServerUseProtseq;
	alias RpcServerUseProtseqExW RpcServerUseProtseqEx;
}else{
	alias RpcServerUseProtseqA RpcServerUseProtseq;
	alias RpcServerUseProtseqExA RpcServerUseProtseqEx;
}

export extern(Windows) RPC_STATUS RpcServerUseProtseqEpA(RPC_CSTR Protseq, uint MaxCalls, RPC_CSTR Endpoint, void* SecurityDescriptor);
export extern(Windows) RPC_STATUS RpcServerUseProtseqEpExA(RPC_CSTR Protseq, uint MaxCalls, RPC_CSTR Endpoint, void* SecurityDescriptor, PRPC_POLICY Policy);
export extern(Windows) RPC_STATUS RpcServerUseProtseqEpW(RPC_WSTR Protseq, uint MaxCalls, RPC_WSTR Endpoint, void* SecurityDescriptor);
export extern(Windows) RPC_STATUS RpcServerUseProtseqEpExW(RPC_WSTR Protseq, uint MaxCalls, RPC_WSTR Endpoint, void* SecurityDescriptor, PRPC_POLICY Policy);
version(UNICODE){
	alias RpcServerUseProtseqEpW RpcServerUseProtseqEp;
	alias RpcServerUseProtseqEpExW RpcServerUseProtseqEpEx;
}else{
	alias RpcServerUseProtseqEpA RpcServerUseProtseqEp;
	alias RpcServerUseProtseqEpExA RpcServerUseProtseqEpEx;
}

export extern(Windows) RPC_STATUS RpcServerUseProtseqIfA(RPC_CSTR Protseq, uint MaxCalls, RPC_IF_HANDLE IfSpec, void* SecurityDescriptor);
export extern(Windows) RPC_STATUS RpcServerUseProtseqIfExA(RPC_CSTR Protseq, uint MaxCalls, RPC_IF_HANDLE IfSpec, void* SecurityDescriptor, PRPC_POLICY Policy);
export extern(Windows) RPC_STATUS RpcServerUseProtseqIfW(RPC_WSTR Protseq, uint MaxCalls, RPC_IF_HANDLE IfSpec, void* SecurityDescriptor);
export extern(Windows) RPC_STATUS RpcServerUseProtseqIfExW(RPC_WSTR Protseq, uint MaxCalls, RPC_IF_HANDLE IfSpec, void* SecurityDescriptor, PRPC_POLICY Policy);
version(UNICODE){
	alias RpcServerUseProtseqIfW RpcServerUseProtseqIf;
	alias RpcServerUseProtseqIfExW RpcServerUseProtseqIfEx;
}else{
	alias RpcServerUseProtseqIfA RpcServerUseProtseqIf;
	alias RpcServerUseProtseqIfExA RpcServerUseProtseqIfEx;
}

export extern(Windows) void RpcServerYield();
export extern(Windows) RPC_STATUS RpcMgmtStatsVectorFree(RPC_STATS_VECTOR** StatsVector);
export extern(Windows) RPC_STATUS RpcMgmtInqStats(RPC_BINDING_HANDLE Binding, RPC_STATS_VECTOR** Statistics);
export extern(Windows) RPC_STATUS RpcMgmtIsServerListening(RPC_BINDING_HANDLE Binding);
export extern(Windows) RPC_STATUS RpcMgmtStopServerListening(RPC_BINDING_HANDLE Binding);
export extern(Windows) RPC_STATUS RpcMgmtWaitServerListen();
export extern(Windows) RPC_STATUS RpcMgmtSetServerStackSize(uint ThreadStackSize);
export extern(Windows) void RpcSsDontSerializeContext();
export extern(Windows) RPC_STATUS RpcMgmtEnableIdleCleanup();
export extern(Windows) RPC_STATUS RpcMgmtInqIfIds(RPC_BINDING_HANDLE Binding, RPC_IF_ID_VECTOR** IfIdVector);
export extern(Windows) RPC_STATUS RpcIfIdVectorFree(RPC_IF_ID_VECTOR** IfIdVector);

export extern(Windows) RPC_STATUS RpcMgmtInqServerPrincNameA(RPC_BINDING_HANDLE Binding, uint AuthnSvc, RPC_CSTR* ServerPrincName);
export extern(Windows) RPC_STATUS RpcMgmtInqServerPrincNameW(RPC_BINDING_HANDLE Binding, uint AuthnSvc, RPC_WSTR* ServerPrincName);
version(UNICODE)
	alias RpcMgmtInqServerPrincNameW RpcMgmtInqServerPrincName;
else
	alias RpcMgmtInqServerPrincNameA RpcMgmtInqServerPrincName;


export extern(Windows) RPC_STATUS RpcServerInqDefaultPrincNameA(uint AuthnSvc, RPC_CSTR* PrincName);

export extern(Windows) RPC_STATUS RpcServerInqDefaultPrincNameW(uint AuthnSvc, RPC_WSTR* PrincName);
version(UNICODE)
	alias RpcServerInqDefaultPrincNameW RpcServerInqDefaultPrincName;
else
	alias RpcServerInqDefaultPrincNameA RpcServerInqDefaultPrincName;

export extern(Windows) RPC_STATUS RpcEpResolveBinding(RPC_BINDING_HANDLE Binding, RPC_IF_HANDLE IfSpec);

export extern(Windows) RPC_STATUS RpcNsBindingInqEntryNameA(RPC_BINDING_HANDLE Binding, uint EntryNameSyntax, RPC_CSTR* EntryName);
export extern(Windows) RPC_STATUS RpcNsBindingInqEntryNameW(RPC_BINDING_HANDLE Binding, uint EntryNameSyntax, RPC_WSTR* EntryName);
version(UNICODE)
	alias RpcNsBindingInqEntryNameW RpcNsBindingInqEntryName;
else
	alias RpcNsBindingInqEntryNameA RpcNsBindingInqEntryName;

enum RPC_AUTH_IDENTITY_HANDLE : void* {init = (void*).init}
enum RPC_AUTHZ_HANDLE : void* {init = (void*).init}

enum {
	RPC_C_AUTHN_LEVEL_DEFAULT            = 0,
	RPC_C_AUTHN_LEVEL_NONE               = 1,
	RPC_C_AUTHN_LEVEL_CONNECT            = 2,
	RPC_C_AUTHN_LEVEL_CALL               = 3,
	RPC_C_AUTHN_LEVEL_PKT                = 4,
	RPC_C_AUTHN_LEVEL_PKT_INTEGRITY      = 5,
	RPC_C_AUTHN_LEVEL_PKT_PRIVACY        = 6,
	RPC_C_IMP_LEVEL_DEFAULT              = 0,
	RPC_C_IMP_LEVEL_ANONYMOUS            = 1,
	RPC_C_IMP_LEVEL_IDENTIFY             = 2,
	RPC_C_IMP_LEVEL_IMPERSONATE          = 3,
	RPC_C_IMP_LEVEL_DELEGATE             = 4,
	RPC_C_QOS_IDENTITY_STATIC            = 0,
	RPC_C_QOS_IDENTITY_DYNAMIC           = 1,
	RPC_C_QOS_CAPABILITIES_DEFAULT       = 0x0,
	RPC_C_QOS_CAPABILITIES_MUTUAL_AUTH   = 0x1,
	RPC_C_QOS_CAPABILITIES_MAKE_FULLSIC  = 0x2,
	RPC_C_QOS_CAPABILITIES_ANY_AUTHORITY = 0x4,
	//(NTDDI_VERSION >= NTDDI_WS03)
		RPC_C_QOS_CAPABILITIES_IGNORE_DELEGATE_FAILURE = 0x8,
		RPC_C_QOS_CAPABILITIES_LOCAL_MA_HINT           = 0x10,
	//(NTDDI_VERSION >= NTDDI_VISTA)
		RPC_C_QOS_CAPABILITIES_SCHANNEL_FULL_AUTH_IDENTITY = 0x20,
}

enum {
	RPC_C_PROTECT_LEVEL_DEFAULT       = RPC_C_AUTHN_LEVEL_DEFAULT,
	RPC_C_PROTECT_LEVEL_NONE          = RPC_C_AUTHN_LEVEL_NONE,
	RPC_C_PROTECT_LEVEL_CONNECT       = RPC_C_AUTHN_LEVEL_CONNECT,
	RPC_C_PROTECT_LEVEL_CALL          = RPC_C_AUTHN_LEVEL_CALL,
	RPC_C_PROTECT_LEVEL_PKT           = RPC_C_AUTHN_LEVEL_PKT,
	RPC_C_PROTECT_LEVEL_PKT_INTEGRITY = RPC_C_AUTHN_LEVEL_PKT_INTEGRITY,
	RPC_C_PROTECT_LEVEL_PKT_PRIVACY   = RPC_C_AUTHN_LEVEL_PKT_PRIVACY,
}

enum {
	RPC_C_AUTHN_NONE          = 0,
	RPC_C_AUTHN_DCE_PRIVATE   = 1,
	RPC_C_AUTHN_DCE_PUBLIC    = 2,
	RPC_C_AUTHN_DEC_PUBLIC    = 4,
	RPC_C_AUTHN_GSS_NEGOTIATE = 9,
	RPC_C_AUTHN_WINNT         = 10,
	RPC_C_AUTHN_GSS_SCHANNEL  = 14,
	RPC_C_AUTHN_GSS_KERBEROS  = 16,
	RPC_C_AUTHN_DPA           = 17,
	RPC_C_AUTHN_MSN           = 18,
	//(NTDDI_VERSION >= NTDDI_WINXP)
		RPC_C_AUTHN_DIGEST = 21,
	//(NTDDI_VERSION >= NTDDI_WIN7)
		RPC_C_AUTHN_KERNEL = 20,
	RPC_C_AUTHN_NEGO_EXTENDER = 30,
	RPC_C_AUTHN_PKU2U         = 31,
	RPC_C_AUTHN_MQ            = 100,
	RPC_C_AUTHN_DEFAULT       = 0xFFFFFFFF,
}
enum RPC_C_NO_CREDENTIALS = cast(RPC_AUTH_IDENTITY_HANDLE)MAXUINT_PTR;
enum {
	RPC_C_SECURITY_QOS_VERSION   = 1,
	RPC_C_SECURITY_QOS_VERSION_1 = 1,
}

struct RPC_SECURITY_QOS {
	uint Version;
	uint Capabilities;
	uint IdentityTracking;
	uint ImpersonationType;
}
alias RPC_SECURITY_QOS* PRPC_SECURITY_QOS;

enum {
	SEC_WINNT_AUTH_IDENTITY_ANSI    = 0x1,
	SEC_WINNT_AUTH_IDENTITY_UNICODE = 0x2,
}

struct SEC_WINNT_AUTH_IDENTITY_W {
	ushort* User;
	uint UserLength;
	ushort* Domain;
	uint DomainLength;
	ushort* Password;
	uint PasswordLength;
	uint Flags;
}
alias SEC_WINNT_AUTH_IDENTITY_W* PSEC_WINNT_AUTH_IDENTITY_W;

struct SEC_WINNT_AUTH_IDENTITY_A {
	char* User;
	uint UserLength;
	char* Domain;
	uint DomainLength;
	char* Password;
	uint PasswordLength;
	uint Flags;
}
alias SEC_WINNT_AUTH_IDENTITY_A* PSEC_WINNT_AUTH_IDENTITY_A;

version(UNICODE){
	alias SEC_WINNT_AUTH_IDENTITY_W SEC_WINNT_AUTH_IDENTITY;
	alias PSEC_WINNT_AUTH_IDENTITY_W PSEC_WINNT_AUTH_IDENTITY;
	//alias _SEC_WINNT_AUTH_IDENTITY_W _SEC_WINNT_AUTH_IDENTITY;
}else{
	alias SEC_WINNT_AUTH_IDENTITY_A SEC_WINNT_AUTH_IDENTITY;
	alias PSEC_WINNT_AUTH_IDENTITY_A PSEC_WINNT_AUTH_IDENTITY;
	//alias _SEC_WINNT_AUTH_IDENTITY_A _SEC_WINNT_AUTH_IDENTITY;
}

//(NTDDI_VERSION >= NTDDI_WINXP)
	enum RPC_C_SECURITY_QOS_VERSION_2 = 2;
	enum RPC_C_AUTHN_INFO_TYPE_HTTP = 1;
	enum RPC_C_HTTP_AUTHN_TARGET_SERVER = 1;
	//(NTDDI_VERSION >= NTDDI_VISTA)
		enum RPC_C_HTTP_AUTHN_TARGET_PROXY = 2;

	enum {
		RPC_C_HTTP_AUTHN_SCHEME_BASIC     = 0x00000001,
		RPC_C_HTTP_AUTHN_SCHEME_NTLM      = 0x00000002,
		RPC_C_HTTP_AUTHN_SCHEME_PASSPORT  = 0x00000004,
		RPC_C_HTTP_AUTHN_SCHEME_DIGEST    = 0x00000008,
		RPC_C_HTTP_AUTHN_SCHEME_NEGOTIATE = 0x00000010,
		//(NTDDI_VERSION >= NTDDI_WS03)
			RPC_C_HTTP_AUTHN_SCHEME_CERT = 0x00010000,
	}

	enum {
		RPC_C_HTTP_FLAG_USE_SSL               = 1,
		RPC_C_HTTP_FLAG_USE_FIRST_AUTH_SCHEME = 2,
		//(NTDDI_VERSION >= NTDDI_WS03)
			RPC_C_HTTP_FLAG_IGNORE_CERT_CN_INVALID = 8,
		//(NTDDI_VERSION >= NTDDI_VISTASP1)
			RPC_C_HTTP_FLAG_ENABLE_CERT_REVOCATION_CHECK = 16,
	}

	struct RPC_HTTP_TRANSPORT_CREDENTIALS_W {
		SEC_WINNT_AUTH_IDENTITY_W* TransportCredentials;
		uint Flags;
		uint AuthenticationTarget;
		uint NumberOfAuthnSchemes;
		uint* AuthnSchemes;
		ushort* ServerCertificateSubject;
	}
	alias RPC_HTTP_TRANSPORT_CREDENTIALS_W* PRPC_HTTP_TRANSPORT_CREDENTIALS_W;

	struct RPC_HTTP_TRANSPORT_CREDENTIALS_A {
		SEC_WINNT_AUTH_IDENTITY_A* TransportCredentials;
		uint Flags;
		uint AuthenticationTarget;
		uint NumberOfAuthnSchemes;
		uint* AuthnSchemes;
		char* ServerCertificateSubject;
	}
	alias RPC_HTTP_TRANSPORT_CREDENTIALS_A* PRPC_HTTP_TRANSPORT_CREDENTIALS_A;

	//(NTDDI_VERSION >= NTDDI_VISTA)
		struct RPC_HTTP_TRANSPORT_CREDENTIALS_V2_W {
			SEC_WINNT_AUTH_IDENTITY_W* TransportCredentials;
			uint Flags;
			uint AuthenticationTarget;
			uint NumberOfAuthnSchemes;
			uint* AuthnSchemes;
			ushort* ServerCertificateSubject;
			SEC_WINNT_AUTH_IDENTITY_W* ProxyCredentials;
			uint NumberOfProxyAuthnSchemes;
			uint* ProxyAuthnSchemes;
		}
		alias RPC_HTTP_TRANSPORT_CREDENTIALS_V2_W* PRPC_HTTP_TRANSPORT_CREDENTIALS_V2_W;

		struct RPC_HTTP_TRANSPORT_CREDENTIALS_V2_A {
			SEC_WINNT_AUTH_IDENTITY_A* TransportCredentials;
			uint Flags;
			uint AuthenticationTarget;
			uint NumberOfAuthnSchemes;
			uint* AuthnSchemes;
			char* ServerCertificateSubject;
			SEC_WINNT_AUTH_IDENTITY_A* ProxyCredentials;
			uint NumberOfProxyAuthnSchemes;
			uint* ProxyAuthnSchemes;
		}
		alias RPC_HTTP_TRANSPORT_CREDENTIALS_V2_A* PRPC_HTTP_TRANSPORT_CREDENTIALS_V2_A;

	//(NTDDI_VERSION >= NTDDI_WIN7)
		struct RPC_HTTP_TRANSPORT_CREDENTIALS_V3_W {
			RPC_AUTH_IDENTITY_HANDLE TransportCredentials;
			uint Flags;
			uint AuthenticationTarget;
			uint NumberOfAuthnSchemes;
			uint* AuthnSchemes;
			ushort* ServerCertificateSubject;
			RPC_AUTH_IDENTITY_HANDLE ProxyCredentials;
			uint NumberOfProxyAuthnSchemes;
			uint* ProxyAuthnSchemes;
		}
		alias RPC_HTTP_TRANSPORT_CREDENTIALS_V3_W* PRPC_HTTP_TRANSPORT_CREDENTIALS_V3_W;

		struct RPC_HTTP_TRANSPORT_CREDENTIALS_V3_A {
			RPC_AUTH_IDENTITY_HANDLE TransportCredentials;
			uint Flags;
			uint AuthenticationTarget;
			uint NumberOfAuthnSchemes;
			uint* AuthnSchemes;
			char* ServerCertificateSubject;
			RPC_AUTH_IDENTITY_HANDLE ProxyCredentials;
			uint NumberOfProxyAuthnSchemes;
			uint* ProxyAuthnSchemes;
		}
		alias RPC_HTTP_TRANSPORT_CREDENTIALS_V3_A* PRPC_HTTP_TRANSPORT_CREDENTIALS_V3_A;

	struct RPC_SECURITY_QOS_V2_W {
		uint Version;
		uint Capabilities;
		uint IdentityTracking;
		uint ImpersonationType;
		uint AdditionalSecurityInfoType;
		union {
			RPC_HTTP_TRANSPORT_CREDENTIALS_W* HttpCredentials;
		}
	}
	alias RPC_SECURITY_QOS_V2_W* PRPC_SECURITY_QOS_V2_W;

	struct RPC_SECURITY_QOS_V2_A {
		uint Version;
		uint Capabilities;
		uint IdentityTracking;
		uint ImpersonationType;
		uint AdditionalSecurityInfoType;
		union {
			RPC_HTTP_TRANSPORT_CREDENTIALS_A* HttpCredentials;
		}
	}
	alias RPC_SECURITY_QOS_V2_A* PRPC_SECURITY_QOS_V2_A;

	//(NTDDI_VERSION >= NTDDI_WS03)
		enum RPC_C_SECURITY_QOS_VERSION_3 = 3;

		struct RPC_SECURITY_QOS_V3_W {
			uint Version;
			uint Capabilities;
			uint IdentityTracking;
			uint ImpersonationType;
			uint AdditionalSecurityInfoType;
			union {
				RPC_HTTP_TRANSPORT_CREDENTIALS_W* HttpCredentials;
			}
			void* Sid;
		}
		alias RPC_SECURITY_QOS_V3_W* PRPC_SECURITY_QOS_V3_W;

		struct RPC_SECURITY_QOS_V3_A {
			uint Version;
			uint Capabilities;
			uint IdentityTracking;
			uint ImpersonationType;
			uint AdditionalSecurityInfoType;
			union {
				RPC_HTTP_TRANSPORT_CREDENTIALS_A* HttpCredentials;
			}
			void* Sid;
		}
		alias RPC_SECURITY_QOS_V3_A* PRPC_SECURITY_QOS_V3_A;

	//(NTDDI_VERSION >= NTDDI_VISTA)
		struct RPC_SECURITY_QOS_V4_W {
			uint Version;
			uint Capabilities;
			uint IdentityTracking;
			uint ImpersonationType;
			uint AdditionalSecurityInfoType;
			union  {
				RPC_HTTP_TRANSPORT_CREDENTIALS_W* HttpCredentials;
			}
			void* Sid;
			uint EffectiveOnly;
		}
		alias RPC_SECURITY_QOS_V4_W* PRPC_SECURITY_QOS_V4_W;

		struct RPC_SECURITY_QOS_V4_A {
			uint Version;
			uint Capabilities;
			uint IdentityTracking;
			uint ImpersonationType;
			uint AdditionalSecurityInfoType;
			union {
				RPC_HTTP_TRANSPORT_CREDENTIALS_A* HttpCredentials;
			}
			void* Sid;
			uint EffectiveOnly;
		}
		alias RPC_SECURITY_QOS_V4_A* PRPC_SECURITY_QOS_V4_A;

//(NTDDI_VERSION >= NTDDI_WINXP)
	version(UNICODE){
		alias RPC_SECURITY_QOS_V2_W RPC_SECURITY_QOS_V2;
		alias PRPC_SECURITY_QOS_V2_W PRPC_SECURITY_QOS_V2;

		alias RPC_HTTP_TRANSPORT_CREDENTIALS_W RPC_HTTP_TRANSPORT_CREDENTIALS;
		alias PRPC_HTTP_TRANSPORT_CREDENTIALS_W PRPC_HTTP_TRANSPORT_CREDENTIALS;

		//(NTDDI_VERSION >= NTDDI_VISTA)
			alias RPC_HTTP_TRANSPORT_CREDENTIALS_V2_W RPC_HTTP_TRANSPORT_CREDENTIALS_V2;
			alias PRPC_HTTP_TRANSPORT_CREDENTIALS_V2_W PRPC_HTTP_TRANSPORT_CREDENTIALS_V2;

		//(NTDDI_VERSION >= NTDDI_WIN7)
			alias RPC_HTTP_TRANSPORT_CREDENTIALS_V3_W RPC_HTTP_TRANSPORT_CREDENTIALS_V3;
			alias PRPC_HTTP_TRANSPORT_CREDENTIALS_V3_W PRPC_HTTP_TRANSPORT_CREDENTIALS_V3;

		//(NTDDI_VERSION >= NTDDI_WS03)
			alias RPC_SECURITY_QOS_V3_W RPC_SECURITY_QOS_V3;
			alias PRPC_SECURITY_QOS_V3_W PRPC_SECURITY_QOS_V3;

		//(NTDDI_VERSION >= NTDDI_VISTA)
			alias RPC_SECURITY_QOS_V4_W RPC_SECURITY_QOS_V4;
			alias PRPC_SECURITY_QOS_V4_W PRPC_SECURITY_QOS_V4;
	}else{
		alias RPC_SECURITY_QOS_V2_A RPC_SECURITY_QOS_V2;
		alias PRPC_SECURITY_QOS_V2_A PRPC_SECURITY_QOS_V2;

		alias RPC_HTTP_TRANSPORT_CREDENTIALS_A RPC_HTTP_TRANSPORT_CREDENTIALS;
		alias PRPC_HTTP_TRANSPORT_CREDENTIALS_A PRPC_HTTP_TRANSPORT_CREDENTIALS;

		//(NTDDI_VERSION >= NTDDI_VISTA)
			alias RPC_HTTP_TRANSPORT_CREDENTIALS_V2_A RPC_HTTP_TRANSPORT_CREDENTIALS_V2;
			alias PRPC_HTTP_TRANSPORT_CREDENTIALS_V2_A PRPC_HTTP_TRANSPORT_CREDENTIALS_V2;

		//(NTDDI_VERSION >= NTDDI_WIN7)
			alias RPC_HTTP_TRANSPORT_CREDENTIALS_V3_A RPC_HTTP_TRANSPORT_CREDENTIALS_V3;
			alias PRPC_HTTP_TRANSPORT_CREDENTIALS_V3_A PRPC_HTTP_TRANSPORT_CREDENTIALS_V3;

		//(NTDDI_VERSION >= NTDDI_WS03)
			alias RPC_SECURITY_QOS_V3_A RPC_SECURITY_QOS_V3;
			alias PRPC_SECURITY_QOS_V3_A PRPC_SECURITY_QOS_V3;

		//(NTDDI_VERSION >= NTDDI_VISTA)
			alias RPC_SECURITY_QOS_V4_A RPC_SECURITY_QOS_V4;
			alias PRPC_SECURITY_QOS_V4_A PRPC_SECURITY_QOS_V4;
	}

	//(NTDDI_VERSION >= NTDDI_VISTA)
		enum {
			RPC_PROTSEQ_TCP                  = 0x1,
			RPC_PROTSEQ_NMP                  = 0x2,
			RPC_PROTSEQ_LRPC                 = 0x3,
			RPC_PROTSEQ_HTTP                 = 0x4,
			RPC_BHT_OBJECT_UUID_VALID        = 0x1,
			RPC_BHO_NONCAUSAL                = 0x1,
			RPC_BHO_DONTLINGER               = 0x2,
			RPC_BHO_EXCLUSIVE_AND_GUARANTEED = 0x4,
		}
		struct RPC_BINDING_HANDLE_TEMPLATE_V1_W {
			uint Version;
			uint Flags;
			uint ProtocolSequence;
			ushort* NetworkAddress;
			ushort* StringEndpoint;
			union {
				ushort* Reserved;
			}
			UUID ObjectUuid;
		}
		alias RPC_BINDING_HANDLE_TEMPLATE_V1_W* PRPC_BINDING_HANDLE_TEMPLATE_V1_W;

		struct RPC_BINDING_HANDLE_TEMPLATE_V1_A {
			uint Version;
			uint Flags;
			uint ProtocolSequence;
			char* NetworkAddress;
			char* StringEndpoint;
			union {
				char* Reserved;
			}
			UUID ObjectUuid;
		}
		alias RPC_BINDING_HANDLE_TEMPLATE_V1_A* PRPC_BINDING_HANDLE_TEMPLATE_V1_A;

		struct RPC_BINDING_HANDLE_SECURITY_V1_W {
			uint Version;
			ushort* ServerPrincName;
			uint AuthnLevel;
			uint AuthnSvc;
			SEC_WINNT_AUTH_IDENTITY_W* AuthIdentity;
			RPC_SECURITY_QOS* SecurityQos;
		}
		alias RPC_BINDING_HANDLE_SECURITY_V1_W* PRPC_BINDING_HANDLE_SECURITY_V1_W;

		struct RPC_BINDING_HANDLE_SECURITY_V1_A {
			uint Version;
			char* ServerPrincName;
			uint AuthnLevel;
			uint AuthnSvc;
			SEC_WINNT_AUTH_IDENTITY_A* AuthIdentity;
			RPC_SECURITY_QOS* SecurityQos;
		}
		alias RPC_BINDING_HANDLE_SECURITY_V1_A* PRPC_BINDING_HANDLE_SECURITY_V1_A;

		struct RPC_BINDING_HANDLE_OPTIONS_V1 {
			uint Version;
			uint Flags;
			uint ComTimeout;
			uint CallTimeout;
		}
		alias RPC_BINDING_HANDLE_OPTIONS_V1* PRPC_BINDING_HANDLE_OPTIONS_V1;

		version(UNICODE){
			alias RPC_BINDING_HANDLE_TEMPLATE_V1_W RPC_BINDING_HANDLE_TEMPLATE_V1;
			alias PRPC_BINDING_HANDLE_TEMPLATE_V1_W PRPC_BINDING_HANDLE_TEMPLATE_V1;
			alias RPC_BINDING_HANDLE_SECURITY_V1_W RPC_BINDING_HANDLE_SECURITY_V1;
			alias PRPC_BINDING_HANDLE_SECURITY_V1_W PRPC_BINDING_HANDLE_SECURITY_V1;
		}else{
			alias RPC_BINDING_HANDLE_TEMPLATE_V1_A RPC_BINDING_HANDLE_TEMPLATE_V1;
			alias PRPC_BINDING_HANDLE_TEMPLATE_V1_A PRPC_BINDING_HANDLE_TEMPLATE_V1;
			alias RPC_BINDING_HANDLE_SECURITY_V1_A RPC_BINDING_HANDLE_SECURITY_V1;
			alias PRPC_BINDING_HANDLE_SECURITY_V1_A PRPC_BINDING_HANDLE_SECURITY_V1;
		}

	static if(NTDDI_VERSION >= NTDDI_VISTA){
		export extern(Windows) RPC_STATUS RpcBindingCreateA(RPC_BINDING_HANDLE_TEMPLATE_V1_A* Template, RPC_BINDING_HANDLE_SECURITY_V1_A* Security, RPC_BINDING_HANDLE_OPTIONS_V1* Options, RPC_BINDING_HANDLE* Binding);
		export extern(Windows) RPC_STATUS RpcBindingCreateW(RPC_BINDING_HANDLE_TEMPLATE_V1_W* Template, RPC_BINDING_HANDLE_SECURITY_V1_W* Security, RPC_BINDING_HANDLE_OPTIONS_V1* Options, RPC_BINDING_HANDLE* Binding);
		version(UNICODE)
			alias RpcBindingCreateW RpcBindingCreate;
		else
			alias RpcBindingCreateA RpcBindingCreate;

		export extern(Windows) RPC_STATUS RpcBindingGetTrainingContextHandle(RPC_BINDING_HANDLE Binding, void** ContextHandle);
		export extern(Windows) RPC_STATUS RpcServerInqBindingHandle(RPC_BINDING_HANDLE* Binding);
	}

	//(NTDDI_VERSION >= NTDDI_WS03)
		enum {
			RPCHTTP_RS_REDIRECT = 1,
			RPCHTTP_RS_ACCESS_1,
			PCHTTP_RS_SESSION,
			RPCHTTP_RS_ACCESS_2,
			RPCHTTP_RS_INTERFACE
		}
		alias int RPC_HTTP_REDIRECTOR_STAGE;

	//(NTDDI_VERSION >= NTDDI_WS03)
		alias extern(Windows) RPC_STATUS function(RPC_HTTP_REDIRECTOR_STAGE RedirectorStage, RPC_WSTR ServerName, RPC_WSTR ServerPort, RPC_WSTR RemoteUser, RPC_WSTR AuthType, void* ResourceUuid, void* SessionId, void* Interface, void* Reserved, uint Flags, RPC_WSTR* NewServerName, RPC_WSTR* NewServerPort) RPC_NEW_HTTP_PROXY_CHANNEL;
	//else
	//	alias extern(Windows) RPC_STATUS function(ushort* ServerName, ushort* ServerPort, char* RemoteUser, ushort** NewServerName) RPC_NEW_HTTP_PROXY_CHANNEL;

	alias extern(Windows) void function(RPC_WSTR String) RPC_HTTP_PROXY_FREE_STRING;


enum {
	RPC_C_AUTHZ_NONE    = 0,
	RPC_C_AUTHZ_NAME    = 1,
	RPC_C_AUTHZ_DCE     = 2,
	RPC_C_AUTHZ_DEFAULT = 0xffffffff,
}

export extern(Windows) RPC_STATUS RpcImpersonateClient(RPC_BINDING_HANDLE BindingHandle);
export extern(Windows) RPC_STATUS RpcRevertToSelfEx(RPC_BINDING_HANDLE BindingHandle);
export extern(Windows) RPC_STATUS RpcRevertToSelf();

export extern(Windows) RPC_STATUS RpcBindingInqAuthClientA(RPC_BINDING_HANDLE ClientBinding, RPC_AUTHZ_HANDLE* Privs, RPC_CSTR* ServerPrincName, uint* AuthnLevel, uint* AuthnSvc, uint* AuthzSvc);
export extern(Windows) RPC_STATUS RpcBindingInqAuthClientW(RPC_BINDING_HANDLE ClientBinding, RPC_AUTHZ_HANDLE* Privs, RPC_WSTR* ServerPrincName, uint* AuthnLevel, uint* AuthnSvc, uint* AuthzSvc);
export extern(Windows) RPC_STATUS RpcBindingInqAuthClientExA(RPC_BINDING_HANDLE ClientBinding, RPC_AUTHZ_HANDLE* Privs, RPC_CSTR* ServerPrincName, uint* AuthnLevel, uint* AuthnSvc, uint* AuthzSvc, uint Flags);
export extern(Windows) RPC_STATUS RpcBindingInqAuthClientExW(RPC_BINDING_HANDLE ClientBinding, RPC_AUTHZ_HANDLE* Privs, RPC_WSTR* ServerPrincName, uint* AuthnLevel, uint* AuthnSvc, uint* AuthzSvc, uint Flags);
export extern(Windows) RPC_STATUS RpcBindingInqAuthInfoA(RPC_BINDING_HANDLE Binding, RPC_CSTR* ServerPrincName, uint* AuthnLevel, uint* AuthnSvc, RPC_AUTH_IDENTITY_HANDLE* AuthIdentity, uint* AuthzSvc);
export extern(Windows) RPC_STATUS RpcBindingInqAuthInfoW(RPC_BINDING_HANDLE Binding, RPC_WSTR* ServerPrincName, uint* AuthnLevel, uint* AuthnSvc, RPC_AUTH_IDENTITY_HANDLE* AuthIdentity, uint* AuthzSvc);
export extern(Windows) RPC_STATUS RpcBindingSetAuthInfoA(RPC_BINDING_HANDLE Binding, RPC_CSTR ServerPrincName, uint AuthnLevel, uint AuthnSvc, RPC_AUTH_IDENTITY_HANDLE AuthIdentity, uint AuthzSvc);
export extern(Windows) RPC_STATUS RpcBindingSetAuthInfoExA(RPC_BINDING_HANDLE Binding, RPC_CSTR ServerPrincName, uint AuthnLevel, uint AuthnSvc, RPC_AUTH_IDENTITY_HANDLE AuthIdentity, uint AuthzSvc, RPC_SECURITY_QOS* SecurityQos);
export extern(Windows) RPC_STATUS RpcBindingSetAuthInfoW(RPC_BINDING_HANDLE Binding, RPC_WSTR ServerPrincName, uint AuthnLevel, uint AuthnSvc, RPC_AUTH_IDENTITY_HANDLE AuthIdentity, uint AuthzSvc);
export extern(Windows) RPC_STATUS RpcBindingSetAuthInfoExW(RPC_BINDING_HANDLE Binding, RPC_WSTR ServerPrincName, uint AuthnLevel, uint AuthnSvc, RPC_AUTH_IDENTITY_HANDLE AuthIdentity, uint AuthzSvc, RPC_SECURITY_QOS* SecurityQOS);
export extern(Windows) RPC_STATUS RpcBindingInqAuthInfoExA(RPC_BINDING_HANDLE Binding, RPC_CSTR* ServerPrincName, uint* AuthnLevel, uint* AuthnSvc, RPC_AUTH_IDENTITY_HANDLE* AuthIdentity, uint* AuthzSvc, uint RpcQosVersion, RPC_SECURITY_QOS* SecurityQOS);
export extern(Windows) RPC_STATUS RpcBindingInqAuthInfoExW(RPC_BINDING_HANDLE Binding, RPC_WSTR* ServerPrincName, uint* AuthnLevel, uint* AuthnSvc, RPC_AUTH_IDENTITY_HANDLE* AuthIdentity, uint* AuthzSvc, uint RpcQosVersion, RPC_SECURITY_QOS* SecurityQOS);
alias extern(Windows) void function(void* Arg, RPC_WSTR ServerPrincName, uint KeyVer, void** Key, RPC_STATUS* Status) RPC_AUTH_KEY_RETRIEVAL_FN;
export extern(Windows) RPC_STATUS  RpcServerCompleteSecurityCallback(RPC_BINDING_HANDLE BindingHandle, RPC_STATUS Status);
export extern(Windows) RPC_STATUS RpcServerRegisterAuthInfoA(RPC_CSTR ServerPrincName, uint AuthnSvc, RPC_AUTH_KEY_RETRIEVAL_FN GetKeyFn, void* Arg);
export extern(Windows) RPC_STATUS RpcServerRegisterAuthInfoW(RPC_WSTR ServerPrincName, uint AuthnSvc, RPC_AUTH_KEY_RETRIEVAL_FN GetKeyFn, void* Arg);
version(UNICODE){
	alias RpcBindingInqAuthClientW RpcBindingInqAuthClient;
	alias RpcBindingInqAuthClientExW RpcBindingInqAuthClientEx;
	alias RpcBindingInqAuthInfoW RpcBindingInqAuthInfo;
	alias RpcBindingSetAuthInfoW RpcBindingSetAuthInfo;
	alias RpcServerRegisterAuthInfoW RpcServerRegisterAuthInfo;
	alias RpcBindingInqAuthInfoExW RpcBindingInqAuthInfoEx;
	alias RpcBindingSetAuthInfoExW RpcBindingSetAuthInfoEx;
}else{
	alias RpcBindingInqAuthClientA RpcBindingInqAuthClient;
	alias RpcBindingInqAuthClientExA RpcBindingInqAuthClientEx;
	alias RpcBindingInqAuthInfoA RpcBindingInqAuthInfo;
	alias RpcBindingSetAuthInfoA RpcBindingSetAuthInfo;
	alias RpcServerRegisterAuthInfoA RpcServerRegisterAuthInfo;
	alias RpcBindingInqAuthInfoExA RpcBindingInqAuthInfoEx;
	alias RpcBindingSetAuthInfoExA RpcBindingSetAuthInfoEx;
}

//(NTDDI_VERSION >= NTDDI_WINXP)
	version(all){//!_M_IA64)
		struct RPC_CLIENT_INFORMATION1 {
			char* UserName;
			char* ComputerName;
			ushort Privilege;
			uint AuthFlags;
		}
		alias RPC_CLIENT_INFORMATION1* PRPC_CLIENT_INFORMATION1;
	}

export extern(Windows) RPC_STATUS RpcBindingServerFromClient(RPC_BINDING_HANDLE ClientBinding, RPC_BINDING_HANDLE* ServerBinding);
export extern(Windows) void RpcRaiseException(RPC_STATUS exception);
export extern(Windows) RPC_STATUS RpcTestCancel();
export extern(Windows) RPC_STATUS RpcServerTestCancel(RPC_BINDING_HANDLE BindingHandle);
export extern(Windows) RPC_STATUS RpcCancelThread(void* Thread);
export extern(Windows) RPC_STATUS RpcCancelThreadEx(void* Thread, int Timeout);
export extern(Windows) RPC_STATUS UuidCreate(UUID* Uuid);
export extern(Windows) RPC_STATUS UuidCreateSequential(UUID* Uuid);
export extern(Windows) RPC_STATUS UuidToStringA(const(UUID)* Uuid, RPC_CSTR* StringUuid);
export extern(Windows) RPC_STATUS UuidFromStringA(RPC_CSTR StringUuid, UUID* Uuid);
export extern(Windows) RPC_STATUS UuidToStringW(const(UUID)* Uuid, RPC_WSTR* StringUuid);
export extern(Windows) RPC_STATUS UuidFromStringW(RPC_WSTR StringUuid, UUID* Uuid);
version(UNICODE){
	alias UuidFromStringW UuidFromString;
	alias UuidToStringW UuidToString;
}else{
	alias UuidFromStringA UuidFromString;
	alias UuidToStringA UuidToString;
}

export extern(Windows) int UuidCompare(UUID* Uuid1, UUID* Uuid2, RPC_STATUS* Status);
export extern(Windows) RPC_STATUS UuidCreateNil(UUID* NilUuid);
export extern(Windows) int UuidEqual(UUID* Uuid1, UUID* Uuid2, RPC_STATUS* Status);
export extern(Windows) ushort UuidHash(UUID* Uuid, RPC_STATUS* Status);
export extern(Windows) int UuidIsNil(UUID* Uuid, RPC_STATUS* Status);
export extern(Windows) RPC_STATUS RpcEpRegisterNoReplaceA(RPC_IF_HANDLE IfSpec, RPC_BINDING_VECTOR* BindingVector, UUID_VECTOR* UuidVector, RPC_CSTR Annotation);
export extern(Windows) RPC_STATUS RpcEpRegisterNoReplaceW(RPC_IF_HANDLE IfSpec, RPC_BINDING_VECTOR* BindingVector, UUID_VECTOR* UuidVector, RPC_WSTR Annotation);
export extern(Windows) RPC_STATUS RpcEpRegisterA(RPC_IF_HANDLE IfSpec, RPC_BINDING_VECTOR* BindingVector, UUID_VECTOR* UuidVector, RPC_CSTR Annotation);
export extern(Windows) RPC_STATUS RpcEpRegisterW(RPC_IF_HANDLE IfSpec, RPC_BINDING_VECTOR* BindingVector, UUID_VECTOR* UuidVector, RPC_WSTR Annotation);
version(UNICODE){
	alias RpcEpRegisterNoReplaceW RpcEpRegisterNoReplace;
	alias RpcEpRegisterW RpcEpRegister;
}else{
	alias RpcEpRegisterNoReplaceA RpcEpRegisterNoReplace;
	alias RpcEpRegisterA RpcEpRegister;
}

export extern(Windows) RPC_STATUS RpcEpUnregister(RPC_IF_HANDLE IfSpec, RPC_BINDING_VECTOR* BindingVector, UUID_VECTOR* UuidVector);

enum DCE_C_ERROR_STRING_LEN = 256;

export extern(Windows) RPC_STATUS DceErrorInqTextA(RPC_STATUS RpcStatus, RPC_CSTR ErrorText);
export extern(Windows) RPC_STATUS DceErrorInqTextW(RPC_STATUS RpcStatus, RPC_WSTR ErrorText);
version(UNICODE)
	alias DceErrorInqTextW DceErrorInqText;
else
	alias DceErrorInqTextA DceErrorInqText;

enum RPC_EP_INQ_HANDLE : I_RPC_HANDLE* {init = (I_RPC_HANDLE*).init}

enum {
	 RPC_C_EP_ALL_ELTS      = 0,
	 RPC_C_EP_MATCH_BY_IF   = 1,
	 RPC_C_EP_MATCH_BY_OBJ  = 2,
	 RPC_C_EP_MATCH_BY_BOTH = 3,
	 RPC_C_VERS_ALL         = 1,
	 RPC_C_VERS_COMPATIBLE  = 2,
	 RPC_C_VERS_EXACT       = 3,
	 RPC_C_VERS_MAJOR_ONLY  = 4,
	 RPC_C_VERS_UPTO        = 5,
}

export extern(Windows) RPC_STATUS RpcMgmtEpEltInqBegin(RPC_BINDING_HANDLE EpBinding, uint InquiryType, RPC_IF_ID* IfId, uint VersOption, UUID* ObjectUuid, RPC_EP_INQ_HANDLE* InquiryContext);
export extern(Windows) RPC_STATUS RpcMgmtEpEltInqDone (RPC_EP_INQ_HANDLE* InquiryContext);

export extern(Windows) RPC_STATUS RpcMgmtEpEltInqNextA(RPC_EP_INQ_HANDLE InquiryContext, RPC_IF_ID* IfId, RPC_BINDING_HANDLE* Binding, UUID* ObjectUuid, RPC_CSTR* Annotation);
export extern(Windows) RPC_STATUS RpcMgmtEpEltInqNextW(RPC_EP_INQ_HANDLE InquiryContext, RPC_IF_ID* IfId, RPC_BINDING_HANDLE* Binding, UUID* ObjectUuid, RPC_WSTR* Annotation);
version(UNICODE)
	alias RpcMgmtEpEltInqNextW RpcMgmtEpEltInqNext;
else
	alias RpcMgmtEpEltInqNextA RpcMgmtEpEltInqNext;

export extern(Windows) RPC_STATUS RpcMgmtEpUnregister(RPC_BINDING_HANDLE EpBinding, RPC_IF_ID* IfId, RPC_BINDING_HANDLE Binding, UUID* ObjectUuid);
alias extern(Windows) int function(RPC_BINDING_HANDLE ClientBinding, uint RequestedMgmtOperation, RPC_STATUS* Status) RPC_MGMT_AUTHORIZATION_FN;

enum {
	RPC_C_MGMT_INQ_IF_IDS         = 0,
	RPC_C_MGMT_INQ_PRINC_NAME     = 1,
	RPC_C_MGMT_INQ_STATS          = 2,
	RPC_C_MGMT_IS_SERVER_LISTEN   = 3,
	RPC_C_MGMT_STOP_SERVER_LISTEN = 4,
}

export extern(Windows) RPC_STATUS RpcMgmtSetAuthorizationFn(RPC_MGMT_AUTHORIZATION_FN AuthorizationFn);
static if(NTDDI_VERSION >= NTDDI_VISTA)
	export extern(Windows) int RpcExceptionFilter(uint ExceptionCode);

enum {
	RPC_C_PARM_MAX_PACKET_LENGTH = 1,
	RPC_C_PARM_BUFFER_LENGTH     = 2,
}

enum {
	RPC_IF_AUTOLISTEN                   = 0x0001,
	RPC_IF_OLE                          = 0x0002,
	RPC_IF_ALLOW_UNKNOWN_AUTHORITY      = 0x0004,
	RPC_IF_ALLOW_SECURE_ONLY            = 0x0008,
	RPC_IF_ALLOW_CALLBACKS_WITH_NO_AUTH = 0x0010,
	RPC_IF_ALLOW_LOCAL_ONLY             = 0x0020,
	RPC_IF_SEC_NO_CACHE                 = 0x0040,
	//(NTDDI_VERSION >= NTDDI_VISTA)
		RPC_IF_SEC_CACHE_PER_PROC = 0x0080,
		RPC_IF_ASYNC_CALLBACK     = 0x0100,
}

//(NTDDI_VERSION >= NTDDI_VISTA)
	enum RPC_FW_IF_FLAG_DCOM = 0x0001;

} // extern(C)
