/** sspi.d

Converted from 'sspi.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.winodws.sspi;


import c.windows.sdkddkver;
import c.windows.windef;
import c.windows.winternl;
import c.windows.guiddef;


extern(C){

enum ISSP_LEVEL = 32;
enum ISSP_MODE = 1;


alias WCHAR SEC_WCHAR;
alias CHAR SEC_CHAR;

alias LONG SECURITY_STATUS;

version(UNICODE){
	alias SEC_WCHAR* SECURITY_PSTR;
	alias const(SEC_WCHAR)* SECURITY_PCSTR;
}else{
	alias SEC_CHAR* SECURITY_PSTR;
	alias const(SEC_CHAR)* SECURITY_PCSTR;
}

struct SecHandle {
	ULONG_PTR dwLower;
	ULONG_PTR dwUpper;
}
alias SecHandle* PSecHandle;


//	SecInvalidateHandle( x )  ((PSecHandle) (x))->dwLower = ((PSecHandle) (x))->dwUpper = ((ULONG_PTR) ((INT_PTR)-1)) ;
//	SecIsValidHandle( x )  ( ( ((PSecHandle) (x))->dwLower != ((ULONG_PTR) ((INT_PTR) -1 ))) &&  ( ((PSecHandle) (x))->dwUpper != ((ULONG_PTR) ((INT_PTR) -1 ))) )

enum SEC_DELETED_HANDLE = cast(ULONG_PTR)-2;

enum CredHandle : SecHandle {init = (SecHandle).init}
enum PCredHandle : PSecHandle {init = (PSecHandle).init}

enum CtxtHandle : SecHandle {init = (SecHandle).init}
enum PCtxtHandle : PSecHandle {init = (PSecHandle).init}

//alias ulong QWORD; to windef
alias QWORD SECURITY_INTEGER;
alias SECURITY_INTEGER* PSECURITY_INTEGER;

alias SECURITY_INTEGER TimeStamp;
alias SECURITY_INTEGER* PTimeStamp;


/*struct SECURITY_STRING {
	ushort Length;
	ushort MaximumLength;
	ushort* Buffer;
}
alias SECURITY_STRING* PSECURITY_STRING;*/
alias UNICODE_STRING SECURITY_STRING;
alias SECURITY_STRING* PSECURITY_STRING;

struct SecPkgInfoW {
	uint fCapabilities;
	ushort wVersion;
	ushort wRPCID;
	uint cbMaxToken;
	SEC_WCHAR* Name;
	SEC_WCHAR* Comment;
}
alias SecPkgInfoW* PSecPkgInfoW;

struct SecPkgInfoA {
	uint fCapabilities;
	ushort wVersion;
	ushort wRPCID;
	uint cbMaxToken;
	SEC_CHAR* Name;
	SEC_CHAR* Comment;
}
alias SecPkgInfoA* PSecPkgInfoA;

version(UNICODE){
	alias SecPkgInfoW SecPkgInfo;
	alias PSecPkgInfoW PSecPkgInfo;
}else{
	alias SecPkgInfoA SecPkgInfo;
	alias PSecPkgInfoA PSecPkgInfo;
}

enum {
	SECPKG_FLAG_INTEGRITY              = 0x00000001,
	SECPKG_FLAG_PRIVACY                = 0x00000002,
	SECPKG_FLAG_TOKEN_ONLY             = 0x00000004,
	SECPKG_FLAG_DATAGRAM               = 0x00000008,
	SECPKG_FLAG_CONNECTION             = 0x00000010,
	SECPKG_FLAG_MULTI_REQUIRED         = 0x00000020,
	SECPKG_FLAG_CLIENT_ONLY            = 0x00000040,
	SECPKG_FLAG_EXTENDED_ERROR         = 0x00000080,
	SECPKG_FLAG_IMPERSONATION          = 0x00000100,
	SECPKG_FLAG_ACCEPT_WIN32_NAME      = 0x00000200,
	SECPKG_FLAG_STREAM                 = 0x00000400,
	SECPKG_FLAG_NEGOTIABLE             = 0x00000800,
	SECPKG_FLAG_GSS_COMPATIBLE         = 0x00001000,
	SECPKG_FLAG_LOGON                  = 0x00002000,
	SECPKG_FLAG_ASCII_BUFFERS          = 0x00004000,
	SECPKG_FLAG_FRAGMENT               = 0x00008000,
	SECPKG_FLAG_MUTUAL_AUTH            = 0x00010000,
	SECPKG_FLAG_DELEGATION             = 0x00020000,
	SECPKG_FLAG_READONLY_WITH_CHECKSUM = 0x00040000,
	SECPKG_FLAG_RESTRICTED_TOKENS      = 0x00080000,
	SECPKG_FLAG_NEGO_EXTENDER          = 0x00100000,
	SECPKG_FLAG_NEGOTIABLE2            = 0x00200000,
}

enum SECPKG_ID_NONE = 0xFFFF;

struct SecBuffer {
	uint cbBuffer;
	uint BufferType;
	void* pvBuffer;
}
alias SecBuffer* PSecBuffer;

struct SecBufferDesc {
	uint ulVersion;
	uint cBuffers;
	PSecBuffer pBuffers;
}
alias SecBufferDesc* PSecBufferDesc;

enum {
	SECBUFFER_VERSION              = 0,
	SECBUFFER_EMPTY                = 0,
	SECBUFFER_DATA                 = 1,
	SECBUFFER_TOKEN                = 2,
	SECBUFFER_PKG_PARAMS           = 3,
	SECBUFFER_MISSING              = 4,
	SECBUFFER_EXTRA                = 5,
	SECBUFFER_STREAM_TRAILER       = 6,
	SECBUFFER_STREAM_HEADER        = 7,
	SECBUFFER_NEGOTIATION_INFO     = 8,
	SECBUFFER_PADDING              = 9,
	SECBUFFER_STREAM               = 10,
	SECBUFFER_MECHLIST             = 11,
	SECBUFFER_MECHLIST_SIGNATURE   = 12,
	SECBUFFER_TARGET               = 13,
	SECBUFFER_CHANNEL_BINDINGS     = 14,
	SECBUFFER_CHANGE_PASS_RESPONSE = 15,
	SECBUFFER_TARGET_HOST          = 16,
	SECBUFFER_ALERT                = 17,
}

enum {
	SECBUFFER_ATTRMASK               = 0xF0000000,
	SECBUFFER_READONLY               = 0x80000000,
	SECBUFFER_READONLY_WITH_CHECKSUM = 0x10000000,
	SECBUFFER_RESERVED               = 0x60000000,
}

struct SEC_NEGOTIATION_INFO {
	uint Size;
	uint NameLength;
	SEC_WCHAR* Name;
	void* Reserved;
}
alias SEC_NEGOTIATION_INFO* PSEC_NEGOTIATION_INFO ;

struct SEC_CHANNEL_BINDINGS {
	uint dwInitiatorAddrType;
	uint cbInitiatorLength;
	uint dwInitiatorOffset;
	uint dwAcceptorAddrType;
	uint cbAcceptorLength;
	uint dwAcceptorOffset;
	uint cbApplicationDataLength;
	uint dwApplicationDataOffset;
}
alias SEC_CHANNEL_BINDINGS* PSEC_CHANNEL_BINDINGS ;

enum {
	SECURITY_NATIVE_DREP             = 0x00000010,
	SECURITY_NETWORK_DREP            = 0x00000000,
	SECPKG_CRED_INBOUND              = 0x00000001,
	SECPKG_CRED_OUTBOUND             = 0x00000002,
	SECPKG_CRED_BOTH                 = 0x00000003,
	SECPKG_CRED_DEFAULT              = 0x00000004,
	SECPKG_CRED_RESERVED             = 0xF0000000,
	SECPKG_CRED_AUTOLOGON_RESTRICTED = 0x00000010,
	SECPKG_CRED_PROCESS_POLICY_ONLY  = 0x00000020,
	ISC_REQ_DELEGATE                 = 0x00000001,
	ISC_REQ_MUTUAL_AUTH              = 0x00000002,
	ISC_REQ_REPLAY_DETECT            = 0x00000004,
	ISC_REQ_SEQUENCE_DETECT          = 0x00000008,
	ISC_REQ_CONFIDENTIALITY          = 0x00000010,
	ISC_REQ_USE_SESSION_KEY          = 0x00000020,
	ISC_REQ_PROMPT_FOR_CREDS         = 0x00000040,
	ISC_REQ_USE_SUPPLIED_CREDS       = 0x00000080,
	ISC_REQ_ALLOCATE_MEMORY          = 0x00000100,
	ISC_REQ_USE_DCE_STYLE            = 0x00000200,
	ISC_REQ_DATAGRAM                 = 0x00000400,
	ISC_REQ_CONNECTION               = 0x00000800,
	ISC_REQ_CALL_LEVEL               = 0x00001000,
	ISC_REQ_FRAGMENT_SUPPLIED        = 0x00002000,
	ISC_REQ_EXTENDED_ERROR           = 0x00004000,
	ISC_REQ_STREAM                   = 0x00008000,
	ISC_REQ_INTEGRITY                = 0x00010000,
	ISC_REQ_IDENTIFY                 = 0x00020000,
	ISC_REQ_NULL_SESSION             = 0x00040000,
	ISC_REQ_MANUAL_CRED_VALIDATION   = 0x00080000,
	ISC_REQ_RESERVED1                = 0x00100000,
	ISC_REQ_FRAGMENT_TO_FIT          = 0x00200000,
	ISC_REQ_FORWARD_CREDENTIALS      = 0x00400000,
	ISC_REQ_NO_INTEGRITY             = 0x00800000,
	ISC_REQ_USE_HTTP_STYLE           = 0x01000000,
	ISC_RET_DELEGATE                 = 0x00000001,
	ISC_RET_MUTUAL_AUTH              = 0x00000002,
	ISC_RET_REPLAY_DETECT            = 0x00000004,
	ISC_RET_SEQUENCE_DETECT          = 0x00000008,
	ISC_RET_CONFIDENTIALITY          = 0x00000010,
	ISC_RET_USE_SESSION_KEY          = 0x00000020,
	ISC_RET_USED_COLLECTED_CREDS     = 0x00000040,
	ISC_RET_USED_SUPPLIED_CREDS      = 0x00000080,
	ISC_RET_ALLOCATED_MEMORY         = 0x00000100,
	ISC_RET_USED_DCE_STYLE           = 0x00000200,
	ISC_RET_DATAGRAM                 = 0x00000400,
	ISC_RET_CONNECTION               = 0x00000800,
	ISC_RET_INTERMEDIATE_RETURN      = 0x00001000,
	ISC_RET_CALL_LEVEL               = 0x00002000,
	ISC_RET_EXTENDED_ERROR           = 0x00004000,
	ISC_RET_STREAM                   = 0x00008000,
	ISC_RET_INTEGRITY                = 0x00010000,
	ISC_RET_IDENTIFY                 = 0x00020000,
	ISC_RET_NULL_SESSION             = 0x00040000,
	ISC_RET_MANUAL_CRED_VALIDATION   = 0x00080000,
	ISC_RET_RESERVED1                = 0x00100000,
	ISC_RET_FRAGMENT_ONLY            = 0x00200000,
	ISC_RET_FORWARD_CREDENTIALS      = 0x00400000,
	ISC_RET_USED_HTTP_STYLE          = 0x01000000,
	ISC_RET_NO_ADDITIONAL_TOKEN      = 0x02000000,
	ISC_RET_REAUTHENTICATION         = 0x08000000,
	ASC_REQ_DELEGATE                 = 0x00000001,
	ASC_REQ_MUTUAL_AUTH              = 0x00000002,
	ASC_REQ_REPLAY_DETECT            = 0x00000004,
	ASC_REQ_SEQUENCE_DETECT          = 0x00000008,
	ASC_REQ_CONFIDENTIALITY          = 0x00000010,
	ASC_REQ_USE_SESSION_KEY          = 0x00000020,
	ASC_REQ_ALLOCATE_MEMORY          = 0x00000100,
	ASC_REQ_USE_DCE_STYLE            = 0x00000200,
	ASC_REQ_DATAGRAM                 = 0x00000400,
	ASC_REQ_CONNECTION               = 0x00000800,
	ASC_REQ_CALL_LEVEL               = 0x00001000,
	ASC_REQ_EXTENDED_ERROR           = 0x00008000,
	ASC_REQ_STREAM                   = 0x00010000,
	ASC_REQ_INTEGRITY                = 0x00020000,
	ASC_REQ_LICENSING                = 0x00040000,
	ASC_REQ_IDENTIFY                 = 0x00080000,
	ASC_REQ_ALLOW_NULL_SESSION       = 0x00100000,
	ASC_REQ_ALLOW_NON_USER_LOGONS    = 0x00200000,
	ASC_REQ_ALLOW_CONTEXT_REPLAY     = 0x00400000,
	ASC_REQ_FRAGMENT_TO_FIT          = 0x00800000,
	ASC_REQ_FRAGMENT_SUPPLIED        = 0x00002000,
	ASC_REQ_NO_TOKEN                 = 0x01000000,
	ASC_REQ_PROXY_BINDINGS           = 0x04000000,
	ASC_REQ_ALLOW_MISSING_BINDINGS   = 0x10000000,
	ASC_RET_DELEGATE                 = 0x00000001,
	ASC_RET_MUTUAL_AUTH              = 0x00000002,
	ASC_RET_REPLAY_DETECT            = 0x00000004,
	ASC_RET_SEQUENCE_DETECT          = 0x00000008,
	ASC_RET_CONFIDENTIALITY          = 0x00000010,
	ASC_RET_USE_SESSION_KEY          = 0x00000020,
	ASC_RET_ALLOCATED_MEMORY         = 0x00000100,
	ASC_RET_USED_DCE_STYLE           = 0x00000200,
	ASC_RET_DATAGRAM                 = 0x00000400,
	ASC_RET_CONNECTION               = 0x00000800,
	ASC_RET_CALL_LEVEL               = 0x00002000,
	ASC_RET_THIRD_LEG_FAILED         = 0x00004000,
	ASC_RET_EXTENDED_ERROR           = 0x00008000,
	ASC_RET_STREAM                   = 0x00010000,
	ASC_RET_INTEGRITY                = 0x00020000,
	ASC_RET_LICENSING                = 0x00040000,
	ASC_RET_IDENTIFY                 = 0x00080000,
	ASC_RET_NULL_SESSION             = 0x00100000,
	ASC_RET_ALLOW_NON_USER_LOGONS    = 0x00200000,
	ASC_RET_ALLOW_CONTEXT_REPLAY     = 0x00400000,
	ASC_RET_FRAGMENT_ONLY            = 0x00800000,
	ASC_RET_NO_TOKEN                 = 0x01000000,
	ASC_RET_NO_ADDITIONAL_TOKEN      = 0x02000000,
	ASC_RET_NO_PROXY_BINDINGS        = 0x04000000,
	ASC_RET_MISSING_BINDINGS         = 0x10000000,
}

enum {
	SECPKG_CRED_ATTR_NAMES        = 1,
	SECPKG_CRED_ATTR_SSI_PROVIDER = 2,
}

struct SecPkgCredentials_NamesW {
	SEC_WCHAR* sUserName;
}
alias SecPkgCredentials_NamesW* PSecPkgCredentials_NamesW;

struct SecPkgCredentials_NamesA {
	SEC_CHAR* sUserName;
}
alias SecPkgCredentials_NamesA* PSecPkgCredentials_NamesA;

version(UNICODE){
	alias SecPkgCredentials_NamesW SecPkgCredentials_Names;
	alias PSecPkgCredentials_NamesW PSecPkgCredentials_Names;
}else{
	alias SecPkgCredentials_NamesA SecPkgCredentials_Names;
	alias PSecPkgCredentials_NamesA PSecPkgCredentials_Names;
}

//NTDDI_VERSION > NTDDI_WS03
	struct SecPkgCredentials_SSIProviderW {
		SEC_WCHAR* sProviderName;
		uint ProviderInfoLength;
		char* ProviderInfo;
	}
	alias SecPkgCredentials_SSIProviderW* PSecPkgCredentials_SSIProviderW;

struct SecPkgCredentials_SSIProviderA {
	SEC_CHAR* sProviderName;
	uint ProviderInfoLength;
	char* ProviderInfo;
}
alias SecPkgCredentials_SSIProviderA* PSecPkgCredentials_SSIProviderA;

version(UNICODE){
	alias SecPkgCredentials_SSIProviderW SecPkgCredentials_SSIProvider;
	alias PSecPkgCredentials_SSIProviderW PSecPkgCredentials_SSIProvider;
}else{
	alias SecPkgCredentials_SSIProviderA SecPkgCredentials_SSIProvider;
	alias PSecPkgCredentials_SSIProviderA PSecPkgCredentials_SSIProvider;
}

enum {
	SECPKG_ATTR_SIZES                       = 0,
	SECPKG_ATTR_NAMES                       = 1,
	SECPKG_ATTR_LIFESPAN                    = 2,
	SECPKG_ATTR_DCE_INFO                    = 3,
	SECPKG_ATTR_STREAM_SIZES                = 4,
	SECPKG_ATTR_KEY_INFO                    = 5,
	SECPKG_ATTR_AUTHORITY                   = 6,
	SECPKG_ATTR_PROTO_INFO                  = 7,
	SECPKG_ATTR_PASSWORD_EXPIRY             = 8,
	SECPKG_ATTR_SESSION_KEY                 = 9,
	SECPKG_ATTR_PACKAGE_INFO                = 10,
	SECPKG_ATTR_USER_FLAGS                  = 11,
	SECPKG_ATTR_NEGOTIATION_INFO            = 12,
	SECPKG_ATTR_NATIVE_NAMES                = 13,
	SECPKG_ATTR_FLAGS                       = 14,
	SECPKG_ATTR_USE_VALIDATED               = 15,
	SECPKG_ATTR_CREDENTIAL_NAME             = 16,
	SECPKG_ATTR_TARGET_INFORMATION          = 17,
	SECPKG_ATTR_ACCESS_TOKEN                = 18,
	SECPKG_ATTR_TARGET                      = 19,
	SECPKG_ATTR_AUTHENTICATION_ID           = 20,
	SECPKG_ATTR_LOGOFF_TIME                 = 21,
	SECPKG_ATTR_NEGO_KEYS                   = 22,
	SECPKG_ATTR_PROMPTING_NEEDED            = 24,
	SECPKG_ATTR_UNIQUE_BINDINGS             = 25,
	SECPKG_ATTR_ENDPOINT_BINDINGS           = 26,
	SECPKG_ATTR_CLIENT_SPECIFIED_TARGET     = 27,
	SECPKG_ATTR_LAST_CLIENT_TOKEN_STATUS    = 30,
	SECPKG_ATTR_NEGO_PKG_INFO               = 31,
	SECPKG_ATTR_NEGO_STATUS                 = 32,
	SECPKG_ATTR_CONTEXT_DELETED             = 33,
	SECPKG_ATTR_SUBJECT_SECURITY_ATTRIBUTES = 128,
}

struct SecPkgContext_SubjectAttributes {
	void* AttributeInfo;
}
alias SecPkgContext_SubjectAttributes* PSecPkgContext_SubjectAttributes;

enum {
	SECPKG_ATTR_NEGO_INFO_FLAG_NO_KERBEROS = 0x1,
	SECPKG_ATTR_NEGO_INFO_FLAG_NO_NTLM     = 0x2,
}

enum {
	SecPkgCredClass_None              = 0,
	SecPkgCredClass_Ephemeral         = 10,
	SecPkgCredClass_PersistedGeneric  = 20,
	SecPkgCredClass_PersistedSpecific = 30,
	SecPkgCredClass_Explicit          = 40,
}
alias int SECPKG_CRED_CLASS;
alias SECPKG_CRED_CLASS* PSECPKG_CRED_CLASS;

struct SecPkgContext_CredInfo {
	SECPKG_CRED_CLASS CredClass;
	uint IsPromptingNeeded;
}
alias SecPkgContext_CredInfo* PSecPkgContext_CredInfo;

struct SecPkgContext_NegoPackageInfo {
	uint PackageMask;
}
alias SecPkgContext_NegoPackageInfo* PSecPkgContext_NegoPackageInfo;

struct SecPkgContext_NegoStatus {
	uint LastStatus;
}
alias SecPkgContext_NegoStatus* PSecPkgContext_NegoStatus;

struct SecPkgContext_Sizes {
	uint cbMaxToken;
	uint cbMaxSignature;
	uint cbBlockSize;
	uint cbSecurityTrailer;
}
alias SecPkgContext_Sizes* PSecPkgContext_Sizes;

struct SecPkgContext_StreamSizes {
	uint cbHeader;
	uint cbTrailer;
	uint cbMaximumMessage;
	uint cBuffers;
	uint cbBlockSize;
}
alias SecPkgContext_StreamSizes* PSecPkgContext_StreamSizes;

struct SecPkgContext_NamesW {
	SEC_WCHAR* sUserName;
}
alias SecPkgContext_NamesW* PSecPkgContext_NamesW;

enum {
	SecPkgAttrLastClientTokenYes,
	SecPkgAttrLastClientTokenNo,
	SecPkgAttrLastClientTokenMaybe
}
alias int SECPKG_ATTR_LCT_STATUS;
alias SECPKG_ATTR_LCT_STATUS* PSECPKG_ATTR_LCT_STATUS;

struct SecPkgContext_LastClientTokenStatus {
	SECPKG_ATTR_LCT_STATUS LastClientTokenStatus;
}
alias SecPkgContext_LastClientTokenStatus* PSecPkgContext_LastClientTokenStatus;

struct SecPkgContext_NamesA {
	SEC_CHAR* sUserName;
}
alias SecPkgContext_NamesA* PSecPkgContext_NamesA;

version(UNICODE){
	alias SecPkgContext_NamesW SecPkgContext_Names;
	alias PSecPkgContext_NamesW PSecPkgContext_Names;
}else{
	alias SecPkgContext_NamesA SecPkgContext_Names;
	alias PSecPkgContext_NamesA PSecPkgContext_Names;
}

struct SecPkgContext_Lifespan {
	TimeStamp tsStart;
	TimeStamp tsExpiry;
}
alias SecPkgContext_Lifespan* PSecPkgContext_Lifespan;

struct SecPkgContext_DceInfo {
	uint AuthzSvc;
	void* pPac;
}
alias SecPkgContext_DceInfo* PSecPkgContext_DceInfo;

struct SecPkgContext_KeyInfoA {
	SEC_CHAR* sSignatureAlgorithmName;
	SEC_CHAR* sEncryptAlgorithmName;
	uint KeySize;
	uint SignatureAlgorithm;
	uint EncryptAlgorithm;
}
alias SecPkgContext_KeyInfoA* PSecPkgContext_KeyInfoA;

struct SecPkgContext_KeyInfoW {
	SEC_WCHAR* sSignatureAlgorithmName;
	SEC_WCHAR* sEncryptAlgorithmName;
	uint KeySize;
	uint SignatureAlgorithm;
	uint EncryptAlgorithm;
}
alias SecPkgContext_KeyInfoW* PSecPkgContext_KeyInfoW;

version(UNICODE){
	alias SecPkgContext_KeyInfoW SecPkgContext_KeyInfo;
	alias PSecPkgContext_KeyInfoW PSecPkgContext_KeyInfo;
}else{
	alias SecPkgContext_KeyInfoA SecPkgContext_KeyInfo;
	alias PSecPkgContext_KeyInfoA PSecPkgContext_KeyInfo;
}

struct SecPkgContext_AuthorityA {
	SEC_CHAR* sAuthorityName;
}
alias SecPkgContext_AuthorityA* PSecPkgContext_AuthorityA;

struct SecPkgContext_AuthorityW {
	SEC_WCHAR* sAuthorityName;
}
alias SecPkgContext_AuthorityW* PSecPkgContext_AuthorityW;

version(UNICODE){
	alias SecPkgContext_AuthorityW SecPkgContext_Authority;
	alias PSecPkgContext_AuthorityW PSecPkgContext_Authority;
}else{
	alias SecPkgContext_AuthorityA SecPkgContext_Authority;
	alias PSecPkgContext_AuthorityA PSecPkgContext_Authority;
}

struct SecPkgContext_ProtoInfoA {
	SEC_CHAR* sProtocolName;
	uint majorVersion;
	uint minorVersion;
}
alias SecPkgContext_ProtoInfoA* PSecPkgContext_ProtoInfoA;

struct SecPkgContext_ProtoInfoW {
	SEC_WCHAR* sProtocolName;
	uint majorVersion;
	uint minorVersion;
}
alias SecPkgContext_ProtoInfoW* PSecPkgContext_ProtoInfoW;

version(UNICODE){
	alias SecPkgContext_ProtoInfoW SecPkgContext_ProtoInfo;
	alias PSecPkgContext_ProtoInfoW PSecPkgContext_ProtoInfo;
}else{
	alias SecPkgContext_ProtoInfoA SecPkgContext_ProtoInfo;
	alias PSecPkgContext_ProtoInfoA PSecPkgContext_ProtoInfo;
}

struct SecPkgContext_PasswordExpiry {
	TimeStamp tsPasswordExpires;
}
alias SecPkgContext_PasswordExpiry* PSecPkgContext_PasswordExpiry;

//NTDDI_VERSION > NTDDI_WS03
	struct SecPkgContext_LogoffTime {
		TimeStamp tsLogoffTime;
	}
	alias SecPkgContext_LogoffTime* PSecPkgContext_LogoffTime;

struct SecPkgContext_SessionKey {
	uint SessionKeyLength;
	ubyte* SessionKey;
}
alias SecPkgContext_SessionKey* PSecPkgContext_SessionKey;

struct SecPkgContext_NegoKeys {
	uint KeyType;
	ushort KeyLength;
	ubyte* KeyValue;
	uint VerifyKeyType;
	ushort VerifyKeyLength;
	ubyte* VerifyKeyValue;
}
alias SecPkgContext_NegoKeys* PSecPkgContext_NegoKeys;

struct SecPkgContext_PackageInfoW {
	PSecPkgInfoW PackageInfo;
}
alias SecPkgContext_PackageInfoW* PSecPkgContext_PackageInfoW;

struct SecPkgContext_PackageInfoA {
	PSecPkgInfoA PackageInfo;
}
alias SecPkgContext_PackageInfoA* PSecPkgContext_PackageInfoA;

struct SecPkgContext_UserFlags {
	uint UserFlags;
}
alias SecPkgContext_UserFlags* PSecPkgContext_UserFlags;

struct SecPkgContext_Flags {
	uint Flags;
}
alias SecPkgContext_Flags* PSecPkgContext_Flags;

version(UNICODE){
	alias SecPkgContext_PackageInfoW SecPkgContext_PackageInfo;
	alias PSecPkgContext_PackageInfoW PSecPkgContext_PackageInfo;
}else{
	alias SecPkgContext_PackageInfoA SecPkgContext_PackageInfo;
	alias PSecPkgContext_PackageInfoA PSecPkgContext_PackageInfo;
}

struct SecPkgContext_NegotiationInfoA {
	PSecPkgInfoA PackageInfo;
	uint NegotiationState;
}
alias SecPkgContext_NegotiationInfoA* PSecPkgContext_NegotiationInfoA ;

struct SecPkgContext_NegotiationInfoW {
	PSecPkgInfoW PackageInfo;
	uint NegotiationState;
}
alias SecPkgContext_NegotiationInfoW* PSecPkgContext_NegotiationInfoW ;

version(UNICODE){
	alias SecPkgContext_NegotiationInfoW SecPkgContext_NegotiationInfo;
	alias PSecPkgContext_NegotiationInfoW PSecPkgContext_NegotiationInfo;
}else{
	alias SecPkgContext_NegotiationInfoA SecPkgContext_NegotiationInfo;
	alias PSecPkgContext_NegotiationInfoA PSecPkgContext_NegotiationInfo;
}

enum {
	SECPKG_NEGOTIATION_COMPLETE      = 0,
	SECPKG_NEGOTIATION_OPTIMISTIC    = 1,
	SECPKG_NEGOTIATION_IN_PROGRESS   = 2,
	SECPKG_NEGOTIATION_DIRECT        = 3,
	SECPKG_NEGOTIATION_TRY_MULTICRED = 4,
}

struct SecPkgContext_NativeNamesW {
	SEC_WCHAR* sClientName;
	SEC_WCHAR* sServerName;
}
alias SecPkgContext_NativeNamesW* PSecPkgContext_NativeNamesW;

struct SecPkgContext_NativeNamesA {
	SEC_CHAR* sClientName;
	SEC_CHAR* sServerName;
}
alias SecPkgContext_NativeNamesA* PSecPkgContext_NativeNamesA;

version(UNICODE){
	alias SecPkgContext_NativeNamesW SecPkgContext_NativeNames;
	alias PSecPkgContext_NativeNamesW PSecPkgContext_NativeNames;
}else{
	alias SecPkgContext_NativeNamesA SecPkgContext_NativeNames;
	alias PSecPkgContext_NativeNamesA PSecPkgContext_NativeNames;
}

struct SecPkgContext_CredentialNameW {
	uint CredentialType;
	SEC_WCHAR* sCredentialName;
}
alias SecPkgContext_CredentialNameW* PSecPkgContext_CredentialNameW;

struct SecPkgContext_CredentialNameA {
	uint CredentialType;
	SEC_CHAR* sCredentialName;
}
alias SecPkgContext_CredentialNameA* PSecPkgContext_CredentialNameA;

version(UNICODE){
	alias SecPkgContext_CredentialNameW SecPkgContext_CredentialName;
	alias PSecPkgContext_CredentialNameW PSecPkgContext_CredentialName;
}else{
	alias SecPkgContext_CredentialNameA SecPkgContext_CredentialName;
	alias PSecPkgContext_CredentialNameA PSecPkgContext_CredentialName;
}

struct SecPkgContext_AccessToken {
	void* AccessToken;
}
alias SecPkgContext_AccessToken* PSecPkgContext_AccessToken;

struct SecPkgContext_TargetInformation {
	uint MarshalledTargetInfoLength;
	ubyte* MarshalledTargetInfo;
}
alias SecPkgContext_TargetInformation* PSecPkgContext_TargetInformation;

struct SecPkgContext_AuthzID {
	uint AuthzIDLength;
	char* AuthzID;
}
alias SecPkgContext_AuthzID* PSecPkgContext_AuthzID;

struct SecPkgContext_Target {
	uint TargetLength;
	char* Target;
}
alias SecPkgContext_Target* PSecPkgContext_Target;

struct SecPkgContext_ClientSpecifiedTarget {
	SEC_WCHAR* sTargetName;
}
alias SecPkgContext_ClientSpecifiedTarget* PSecPkgContext_ClientSpecifiedTarget;

struct SecPkgContext_Bindings {
	uint BindingsLength;
	SEC_CHANNEL_BINDINGS* Bindings;
}
alias SecPkgContext_Bindings* PSecPkgContext_Bindings;

alias void function(void* Arg,void* Principal, uint KeyVer, void** Key, SECURITY_STATUS* Status) SEC_GET_KEY_FN;

enum {
	SECPKG_CONTEXT_EXPORT_RESET_NEW  = 0x00000001,
	SECPKG_CONTEXT_EXPORT_DELETE_OLD = 0x00000002,
	SECPKG_CONTEXT_EXPORT_TO_KERNEL  = 0x00000004,
}

export extern(Windows)export extern(Windows) SECURITY_STATUS AcquireCredentialsHandleW(LPWSTR pszPrincipal, LPWSTR pszPackage, uint fCredentialUse, void* pvLogonId, void* pAuthData, SEC_GET_KEY_FN pGetKeyFn, void* pvGetKeyArgument, PCredHandle phCredential, PTimeStamp ptsExpiry);
alias SECURITY_STATUS function(SEC_WCHAR*, SEC_WCHAR*, uint, void*, void*, SEC_GET_KEY_FN, void*, PCredHandle, PTimeStamp) ACQUIRE_CREDENTIALS_HANDLE_FN_W;
export extern(Windows) SECURITY_STATUS AcquireCredentialsHandleA(LPSTR pszPrincipal, LPSTR pszPackage, uint fCredentialUse, void* pvLogonId, void* pAuthData, SEC_GET_KEY_FN pGetKeyFn, void* pvGetKeyArgument, PCredHandle phCredential, PTimeStamp ptsExpiry);
alias SECURITY_STATUS function(SEC_CHAR*, SEC_CHAR*, uint, void*, void*, SEC_GET_KEY_FN, void*, PCredHandle, PTimeStamp) ACQUIRE_CREDENTIALS_HANDLE_FN_A;

version(UNICODE){
	alias AcquireCredentialsHandleW AcquireCredentialsHandle;
	alias ACQUIRE_CREDENTIALS_HANDLE_FN_W ACQUIRE_CREDENTIALS_HANDLE_FN;
}else{
	alias AcquireCredentialsHandleA AcquireCredentialsHandle;
	alias ACQUIRE_CREDENTIALS_HANDLE_FN_A ACQUIRE_CREDENTIALS_HANDLE_FN;
}

export extern(Windows)export extern(Windows) SECURITY_STATUS FreeCredentialsHandle(PCredHandle phCredential);
alias SECURITY_STATUS function(PCredHandle) FREE_CREDENTIALS_HANDLE_FN;
export extern(Windows)export extern(Windows) SECURITY_STATUS AddCredentialsW(PCredHandle hCredentials, LPWSTR pszPrincipal, LPWSTR pszPackage, uint fCredentialUse, void* pAuthData, SEC_GET_KEY_FN pGetKeyFn, void* pvGetKeyArgument, PTimeStamp ptsExpiry);
alias SECURITY_STATUS function(PCredHandle, SEC_WCHAR*, SEC_WCHAR*, uint, void*, SEC_GET_KEY_FN, void*, PTimeStamp) ADD_CREDENTIALS_FN_W;
export extern(Windows) SECURITY_STATUS AddCredentialsA(PCredHandle hCredentials, LPSTR pszPrincipal,LPSTR pszPackage, uint fCredentialUse, void* pAuthData, SEC_GET_KEY_FN pGetKeyFn, void* pvGetKeyArgument, PTimeStamp ptsExpiry);
alias SECURITY_STATUS function(PCredHandle, SEC_CHAR*, SEC_CHAR*, uint, void*, SEC_GET_KEY_FN, void*, PTimeStamp) ADD_CREDENTIALS_FN_A;

version(UNICODE){
	alias AddCredentialsW AddCredentials;
	alias ADD_CREDENTIALS_FN_W ADD_CREDENTIALS_FN;
}else{
	alias AddCredentialsA AddCredentials;
	alias ADD_CREDENTIALS_FN_A ADD_CREDENTIALS_FN;
}

export extern(Windows) SECURITY_STATUS ChangeAccountPasswordW(SEC_WCHAR* pszPackageName, SEC_WCHAR* pszDomainName, SEC_WCHAR* pszAccountName, SEC_WCHAR* pszOldPassword, SEC_WCHAR* pszNewPassword, BOOLEAN bImpersonating, uint dwReserved, PSecBufferDesc pOutput);
alias SECURITY_STATUS function(SEC_WCHAR*, SEC_WCHAR*, SEC_WCHAR*, SEC_WCHAR*, SEC_WCHAR*, BOOLEAN, uint, PSecBufferDesc) CHANGE_PASSWORD_FN_W;
export extern(Windows) SECURITY_STATUS ChangeAccountPasswordA(SEC_CHAR* pszPackageName, SEC_CHAR* pszDomainName, SEC_CHAR* pszAccountName, SEC_CHAR* pszOldPassword, SEC_CHAR* pszNewPassword, BOOLEAN bImpersonating, uint dwReserved, PSecBufferDesc pOutput);
alias SECURITY_STATUS function(SEC_CHAR*, SEC_CHAR*, SEC_CHAR*, SEC_CHAR*, SEC_CHAR*, BOOLEAN, uint, PSecBufferDesc) CHANGE_PASSWORD_FN_A;

version(UNICODE){
	alias ChangeAccountPasswordW ChangeAccountPassword;
	alias CHANGE_PASSWORD_FN_W CHANGE_PASSWORD_FN;
}else{
	alias ChangeAccountPasswordA ChangeAccountPassword;
	alias CHANGE_PASSWORD_FN_A CHANGE_PASSWORD_FN;
}

export extern(Windows)export extern(Windows) SECURITY_STATUS InitializeSecurityContextW(PCredHandle phCredential, PCtxtHandle phContext, SEC_WCHAR* pszTargetName, uint fContextReq, uint Reserved1, uint TargetDataRep, PSecBufferDesc pInput, uint Reserved2, PCtxtHandle phNewContext, PSecBufferDesc pOutput, uint* pfContextAttr, PTimeStamp ptsExpiry);
alias SECURITY_STATUS function(PCredHandle, PCtxtHandle, SEC_WCHAR*, uint, uint, uint, PSecBufferDesc, uint, PCtxtHandle, PSecBufferDesc, uint*, PTimeStamp) INITIALIZE_SECURITY_CONTEXT_FN_W;
export extern(Windows) SECURITY_STATUS InitializeSecurityContextA(PCredHandle phCredential, PCtxtHandle phContext, SEC_CHAR* pszTargetName, uint fContextReq, uint Reserved1, uint TargetDataRep, PSecBufferDesc pInput, uint Reserved2, PCtxtHandle phNewContext, PSecBufferDesc pOutput, uint* pfContextAttr, PTimeStamp ptsExpiry);
alias SECURITY_STATUS function(PCredHandle, PCtxtHandle, SEC_CHAR*, uint, uint, uint, PSecBufferDesc, uint, PCtxtHandle, PSecBufferDesc, uint*, PTimeStamp) INITIALIZE_SECURITY_CONTEXT_FN_A;

version(UNICODE){
	alias InitializeSecurityContextW InitializeSecurityContext;
	alias INITIALIZE_SECURITY_CONTEXT_FN_W INITIALIZE_SECURITY_CONTEXT_FN;
}else{
	alias InitializeSecurityContextA InitializeSecurityContext;
	alias INITIALIZE_SECURITY_CONTEXT_FN_A INITIALIZE_SECURITY_CONTEXT_FN;
}

export extern(Windows)export extern(Windows) SECURITY_STATUS AcceptSecurityContext(PCredHandle phCredential, PCtxtHandle phContext, PSecBufferDesc pInput, uint fContextReq, uint TargetDataRep, PCtxtHandle phNewContext, PSecBufferDesc pOutput, uint* pfContextAttr, PTimeStamp ptsExpiry);
alias SECURITY_STATUS function(PCredHandle, PCtxtHandle, PSecBufferDesc, uint, uint, PCtxtHandle, PSecBufferDesc, uint*, PTimeStamp) ACCEPT_SECURITY_CONTEXT_FN;
export extern(Windows) SECURITY_STATUS CompleteAuthToken(PCtxtHandle phContext, PSecBufferDesc pToken);
alias SECURITY_STATUS function(PCtxtHandle, PSecBufferDesc) COMPLETE_AUTH_TOKEN_FN;
export extern(Windows)export extern(Windows) SECURITY_STATUS ImpersonateSecurityContext(PCtxtHandle phContext);
alias SECURITY_STATUS function(PCtxtHandle) IMPERSONATE_SECURITY_CONTEXT_FN;
export extern(Windows)export extern(Windows) SECURITY_STATUS RevertSecurityContext(PCtxtHandle phContext);
alias SECURITY_STATUS function(PCtxtHandle) REVERT_SECURITY_CONTEXT_FN;
export extern(Windows)export extern(Windows) SECURITY_STATUS QuerySecurityContextToken(PCtxtHandle phContext, void** Token);
alias SECURITY_STATUS function(PCtxtHandle, void**) QUERY_SECURITY_CONTEXT_TOKEN_FN;
export extern(Windows)export extern(Windows) SECURITY_STATUS DeleteSecurityContext(PCtxtHandle phContext);
alias SECURITY_STATUS function(PCtxtHandle) DELETE_SECURITY_CONTEXT_FN;
export extern(Windows)export extern(Windows) SECURITY_STATUS ApplyControlToken(PCtxtHandle phContext, PSecBufferDesc pInput);
alias SECURITY_STATUS function(PCtxtHandle, PSecBufferDesc) APPLY_CONTROL_TOKEN_FN;
export extern(Windows)export extern(Windows) SECURITY_STATUS QueryContextAttributesW(PCtxtHandle phContext, uint ulAttribute, void* pBuffer);
alias SECURITY_STATUS function(PCtxtHandle, uint, void*) QUERY_CONTEXT_ATTRIBUTES_FN_W;
export extern(Windows) SECURITY_STATUS QueryContextAttributesA(PCtxtHandle phContext, uint ulAttribute, void* pBuffer);
alias SECURITY_STATUS function(PCtxtHandle, uint, void*) QUERY_CONTEXT_ATTRIBUTES_FN_A;

version(UNICODE){
	alias QueryContextAttributesW QueryContextAttributes;
	alias QUERY_CONTEXT_ATTRIBUTES_FN_W QUERY_CONTEXT_ATTRIBUTES_FN;
}else{
	alias QueryContextAttributesA QueryContextAttributes;
	alias QUERY_CONTEXT_ATTRIBUTES_FN_A QUERY_CONTEXT_ATTRIBUTES_FN;
}

export extern(Windows) SECURITY_STATUS SetContextAttributesW(PCtxtHandle phContext, uint ulAttribute, void* pBuffer, uint cbBuffer);
alias SECURITY_STATUS function(PCtxtHandle, uint, void*, uint) SET_CONTEXT_ATTRIBUTES_FN_W;

export extern(Windows) SECURITY_STATUS SetContextAttributesA(PCtxtHandle phContext, uint ulAttribute, void* pBuffer, uint cbBuffer);
alias SECURITY_STATUS function(PCtxtHandle, uint, void*, uint) SET_CONTEXT_ATTRIBUTES_FN_A;

version(UNICODE){
	alias SetContextAttributesW SetContextAttributes;
	alias SET_CONTEXT_ATTRIBUTES_FN_W SET_CONTEXT_ATTRIBUTES_FN;
}else{
	alias SetContextAttributesA SetContextAttributes;
	alias SET_CONTEXT_ATTRIBUTES_FN_A SET_CONTEXT_ATTRIBUTES_FN;
}

export extern(Windows)export extern(Windows) SECURITY_STATUS QueryCredentialsAttributesW(PCredHandle phCredential, uint ulAttribute, void* pBuffer);
alias SECURITY_STATUS function(PCredHandle, uint, void*) QUERY_CREDENTIALS_ATTRIBUTES_FN_W;
export extern(Windows) SECURITY_STATUS QueryCredentialsAttributesA(PCredHandle phCredential, uint ulAttribute, void* pBuffer);
alias SECURITY_STATUS function(PCredHandle, uint, void*) QUERY_CREDENTIALS_ATTRIBUTES_FN_A;

version(UNICODE){
	alias QueryCredentialsAttributesW QueryCredentialsAttributes;
	alias QUERY_CREDENTIALS_ATTRIBUTES_FN_W QUERY_CREDENTIALS_ATTRIBUTES_FN;
}else{
	alias QueryCredentialsAttributesA QueryCredentialsAttributes;
	alias QUERY_CREDENTIALS_ATTRIBUTES_FN_A QUERY_CREDENTIALS_ATTRIBUTES_FN;
}

static if(NTDDI_VERSION > NTDDI_WS03){
	export extern(Windows)export extern(Windows) SECURITY_STATUS SetCredentialsAttributesW(PCredHandle phCredential, uint ulAttribute, void* pBuffer, uint cbBuffer);
//
	alias SECURITY_STATUS function(PCredHandle, uint, void*, uint) SET_CREDENTIALS_ATTRIBUTES_FN_W;

export extern(Windows) SECURITY_STATUS SetCredentialsAttributesA(PCredHandle phCredential, uint ulAttribute, void* pBuffer, uint cbBuffer);
alias SECURITY_STATUS function(PCredHandle, uint, void*, uint) SET_CREDENTIALS_ATTRIBUTES_FN_A;

version(UNICODE){
	alias SetCredentialsAttributesW SetCredentialsAttributes;
	alias SET_CREDENTIALS_ATTRIBUTES_FN_W SET_CREDENTIALS_ATTRIBUTES_FN;
}else{
	alias SetCredentialsAttributesA SetCredentialsAttributes;
	alias SET_CREDENTIALS_ATTRIBUTES_FN_A SET_CREDENTIALS_ATTRIBUTES_FN;
}

export extern(Windows) SECURITY_STATUS FreeContextBuffer(PVOID pvContextBuffer);
alias SECURITY_STATUS function(PVOID) FREE_CONTEXT_BUFFER_FN;
export extern(Windows)export extern(Windows) SECURITY_STATUS MakeSignature(PCtxtHandle phContext, uint fQOP, PSecBufferDesc pMessage, uint MessageSeqNo);
alias SECURITY_STATUS function(PCtxtHandle, uint, PSecBufferDesc, uint) MAKE_SIGNATURE_FN;
export extern(Windows)export extern(Windows) SECURITY_STATUS VerifySignature(PCtxtHandle phContext, PSecBufferDesc pMessage, uint MessageSeqNo, uint* pfQOP);
alias SECURITY_STATUS function(PCtxtHandle, PSecBufferDesc, uint, uint*) VERIFY_SIGNATURE_FN;

enum {
	SECQOP_WRAP_NO_ENCRYPT = 0x80000001,
	SECQOP_WRAP_OOB_DATA   = 0x40000000,
}

export extern(Windows) SECURITY_STATUS EncryptMessage(PCtxtHandle phContext, uint fQOP, PSecBufferDesc pMessage, uint MessageSeqNo);
alias SECURITY_STATUS function(PCtxtHandle, uint, PSecBufferDesc, uint) ENCRYPT_MESSAGE_FN;
export extern(Windows) SECURITY_STATUS DecryptMessage(PCtxtHandle phContext, PSecBufferDesc pMessage, uint MessageSeqNo, uint* pfQOP);
alias SECURITY_STATUS function(PCtxtHandle, PSecBufferDesc, uint, uint*) DECRYPT_MESSAGE_FN;

export extern(Windows)export extern(Windows) SECURITY_STATUS EnumerateSecurityPackagesW(uint* pcPackages, PSecPkgInfoW* ppPackageInfo);
alias SECURITY_STATUS function(uint*, PSecPkgInfoW*) ENUMERATE_SECURITY_PACKAGES_FN_W;
export extern(Windows) SECURITY_STATUS EnumerateSecurityPackagesA(uint* pcPackages, PSecPkgInfoA* ppPackageInfo);
alias SECURITY_STATUS function(uint*, PSecPkgInfoA*) ENUMERATE_SECURITY_PACKAGES_FN_A;

version(UNICODE){
	alias EnumerateSecurityPackagesW EnumerateSecurityPackages;
	alias ENUMERATE_SECURITY_PACKAGES_FN_W ENUMERATE_SECURITY_PACKAGES_FN;
}else{
	alias EnumerateSecurityPackagesA EnumerateSecurityPackages;
	alias ENUMERATE_SECURITY_PACKAGES_FN_A ENUMERATE_SECURITY_PACKAGES_FN;
}

export extern(Windows)export extern(Windows) SECURITY_STATUS QuerySecurityPackageInfoW(LPWSTR pszPackageName, PSecPkgInfoW* ppPackageInfo);
alias SECURITY_STATUS function(SEC_WCHAR*, PSecPkgInfoW*) QUERY_SECURITY_PACKAGE_INFO_FN_W;
export extern(Windows) SECURITY_STATUS QuerySecurityPackageInfoA(LPSTR pszPackageName, PSecPkgInfoA* ppPackageInfo);
alias SECURITY_STATUS function(SEC_CHAR*, PSecPkgInfoA*) QUERY_SECURITY_PACKAGE_INFO_FN_A;

version(UNICODE){
	alias QuerySecurityPackageInfoW QuerySecurityPackageInfo;
	alias QUERY_SECURITY_PACKAGE_INFO_FN_W QUERY_SECURITY_PACKAGE_INFO_FN;
}else{
	alias QuerySecurityPackageInfoA QuerySecurityPackageInfo;
	alias QUERY_SECURITY_PACKAGE_INFO_FN_A QUERY_SECURITY_PACKAGE_INFO_FN;
}

enum {
	SecFull,
	SecService,
	SecTree,
	SecDirectory,
	SecObject
}
alias int SecDelegationType;
alias SecDelegationType* PSecDelegationType;

export extern(Windows) SECURITY_STATUS DelegateSecurityContext( PCtxtHandle phContext, LPSTR pszTarget, SecDelegationType DelegationType, PTimeStamp pExpiry, PSecBuffer pPackageParameters, PSecBufferDesc pOutput);
export extern(Windows)export extern(Windows) SECURITY_STATUS ExportSecurityContext(PCtxtHandle phContext, ULONG fFlags, PSecBuffer pPackedContext, void** pToken);
alias SECURITY_STATUS function(PCtxtHandle, ULONG, PSecBuffer, void**) EXPORT_SECURITY_CONTEXT_FN;

export extern(Windows)export extern(Windows) SECURITY_STATUS ImportSecurityContextW(LPWSTR pszPackage, PSecBuffer pPackedContext, void* Token, PCtxtHandle phContext);
alias SECURITY_STATUS function(SEC_WCHAR*, PSecBuffer, VOID*, PCtxtHandle) IMPORT_SECURITY_CONTEXT_FN_W;
export extern(Windows) SECURITY_STATUS ImportSecurityContextA(LPSTR pszPackage, PSecBuffer pPackedContext, VOID* Token, PCtxtHandle phContext);

alias SECURITY_STATUS function(SEC_CHAR*, PSecBuffer, void*, PCtxtHandle) IMPORT_SECURITY_CONTEXT_FN_A;

version(UNICODE){
	alias ImportSecurityContextW ImportSecurityContext;
	alias IMPORT_SECURITY_CONTEXT_FN_W IMPORT_SECURITY_CONTEXT_FN;
}else{
	alias ImportSecurityContextA ImportSecurityContext;
	alias IMPORT_SECURITY_CONTEXT_FN_A IMPORT_SECURITY_CONTEXT_FN;
}

version(none){ // ISSP_MODE == 0
	export extern(Windows) NTSTATUS SecMakeSPN(PUNICODE_STRING ServiceClass, PUNICODE_STRING ServiceName, PUNICODE_STRING InstanceName, USHORT InstancePort, PUNICODE_STRING Referrer, PUNICODE_STRING Spn, PULONG Length, BOOLEAN Allocate);
	export extern(Windows) NTSTATUS SecMakeSPNEx(PUNICODE_STRING ServiceClass, PUNICODE_STRING ServiceName, PUNICODE_STRING InstanceName, USHORT InstancePort, PUNICODE_STRING Referrer, PUNICODE_STRING TargetInfo, PUNICODE_STRING Spn, PULONG Length, BOOLEAN Allocate);

	static if(OSVER(NTDDI_VERSION) > NTDDI_WS03){
		export extern(Windows) NTSTATUS SecMakeSPNEx2(PUNICODE_STRING ServiceClass, PUNICODE_STRING ServiceName, PUNICODE_STRING InstanceName, USHORT InstancePort, PUNICODE_STRING Referrer, PUNICODE_STRING InTargetInfo, PUNICODE_STRING Spn, PULONG TotalSize, BOOLEAN Allocate, BOOLEAN IsTargetInfoMarshaled);
	}

	export extern(Windows) NTSTATUS SecLookupAccountSid(PSID Sid, PULONG NameSize, PUNICODE_STRING NameBuffer, PULONG DomainSize, PUNICODE_STRING DomainBuffer, PSID_NAME_USE NameUse);
	export extern(Windows) NTSTATUS SecLookupAccountName(PUNICODE_STRING Name, PULONG SidSize, PSID Sid, PSID_NAME_USE NameUse, PULONG DomainSize, PUNICODE_STRING ReferencedDomain);

	static if(OSVER(NTDDI_VERSION) > NTDDI_WINXP)
		export extern(Windows) NTSTATUS SecLookupWellKnownSid(WELL_KNOWN_SID_TYPE SidType, PSID Sid, ULONG SidBufferSize, PULONG SidSize);
}

const char* SECURITY_ENTRYPOINT_ANSIW = "InitSecurityInterfaceW";
const char* SECURITY_ENTRYPOINT_ANSIA = "InitSecurityInterfaceA";
const wchar* SECURITY_ENTRYPOINTW = "InitSecurityInterfaceW";
const char* SECURITY_ENTRYPOINTA = "InitSecurityInterfaceA";
const char* SECURITY_ENTRYPOINT16 = "INITSECURITYINTERFACEA";

version(UNICODE){
	alias SECURITY_ENTRYPOINTW SECURITY_ENTRYPOINT;
	alias SECURITY_ENTRYPOINT_ANSIW SECURITY_ENTRYPOINT_ANSI;
}else{
	alias SECURITY_ENTRYPOINTA SECURITY_ENTRYPOINT;
	alias SECURITY_ENTRYPOINT_ANSIA SECURITY_ENTRYPOINT_ANSI;
}

struct SecurityFunctionTableW {
	uint dwVersion;
	ENUMERATE_SECURITY_PACKAGES_FN_W EnumerateSecurityPackagesW;
	QUERY_CREDENTIALS_ATTRIBUTES_FN_W QueryCredentialsAttributesW;
	ACQUIRE_CREDENTIALS_HANDLE_FN_W AcquireCredentialsHandleW;
	FREE_CREDENTIALS_HANDLE_FN FreeCredentialsHandle;
	void* Reserved2;
	INITIALIZE_SECURITY_CONTEXT_FN_W InitializeSecurityContextW;
	ACCEPT_SECURITY_CONTEXT_FN AcceptSecurityContext;
	COMPLETE_AUTH_TOKEN_FN CompleteAuthToken;
	DELETE_SECURITY_CONTEXT_FN DeleteSecurityContext;
	APPLY_CONTROL_TOKEN_FN ApplyControlToken;
	QUERY_CONTEXT_ATTRIBUTES_FN_W QueryContextAttributesW;
	IMPERSONATE_SECURITY_CONTEXT_FN ImpersonateSecurityContext;
	REVERT_SECURITY_CONTEXT_FN RevertSecurityContext;
	MAKE_SIGNATURE_FN MakeSignature;
	VERIFY_SIGNATURE_FN VerifySignature;
	FREE_CONTEXT_BUFFER_FN FreeContextBuffer;
	QUERY_SECURITY_PACKAGE_INFO_FN_W QuerySecurityPackageInfoW;
	void* Reserved3;
	void* Reserved4;
	EXPORT_SECURITY_CONTEXT_FN ExportSecurityContext;
	IMPORT_SECURITY_CONTEXT_FN_W ImportSecurityContextW;
	ADD_CREDENTIALS_FN_W AddCredentialsW ;
	void* Reserved8;
	QUERY_SECURITY_CONTEXT_TOKEN_FN QuerySecurityContextToken;
	ENCRYPT_MESSAGE_FN EncryptMessage;
	DECRYPT_MESSAGE_FN DecryptMessage;
	SET_CONTEXT_ATTRIBUTES_FN_W SetContextAttributesW;
	//NTDDI_VERSION > NTDDI_WS03SP1
		SET_CREDENTIALS_ATTRIBUTES_FN_W SetCredentialsAttributesW;
	CHANGE_PASSWORD_FN_W ChangeAccountPasswordW;
}
alias SecurityFunctionTableW* PSecurityFunctionTableW;

struct SecurityFunctionTableA {
	uint dwVersion;
	ENUMERATE_SECURITY_PACKAGES_FN_A EnumerateSecurityPackagesA;
	QUERY_CREDENTIALS_ATTRIBUTES_FN_A QueryCredentialsAttributesA;
	ACQUIRE_CREDENTIALS_HANDLE_FN_A AcquireCredentialsHandleA;
	FREE_CREDENTIALS_HANDLE_FN FreeCredentialHandle;
	void* Reserved2;
	INITIALIZE_SECURITY_CONTEXT_FN_A InitializeSecurityContextA;
	ACCEPT_SECURITY_CONTEXT_FN AcceptSecurityContext;
	COMPLETE_AUTH_TOKEN_FN CompleteAuthToken;
	DELETE_SECURITY_CONTEXT_FN DeleteSecurityContext;
	APPLY_CONTROL_TOKEN_FN ApplyControlToken;
	QUERY_CONTEXT_ATTRIBUTES_FN_A QueryContextAttributesA;
	IMPERSONATE_SECURITY_CONTEXT_FN ImpersonateSecurityContext;
	REVERT_SECURITY_CONTEXT_FN RevertSecurityContext;
	MAKE_SIGNATURE_FN MakeSignature;
	VERIFY_SIGNATURE_FN VerifySignature;
	FREE_CONTEXT_BUFFER_FN FreeContextBuffer;
	QUERY_SECURITY_PACKAGE_INFO_FN_A QuerySecurityPackageInfoA;
	void* Reserved3;
	void* Reserved4;
	EXPORT_SECURITY_CONTEXT_FN ExportSecurityContext;
	IMPORT_SECURITY_CONTEXT_FN_A ImportSecurityContextA;
	ADD_CREDENTIALS_FN_A AddCredentialsA ;
	void* Reserved8;
	QUERY_SECURITY_CONTEXT_TOKEN_FN QuerySecurityContextToken;
	ENCRYPT_MESSAGE_FN EncryptMessage;
	DECRYPT_MESSAGE_FN DecryptMessage;
	SET_CONTEXT_ATTRIBUTES_FN_A SetContextAttributesA;
	SET_CREDENTIALS_ATTRIBUTES_FN_A SetCredentialsAttributesA;
	CHANGE_PASSWORD_FN_A ChangeAccountPasswordA;
}
alias SecurityFunctionTableA* PSecurityFunctionTableA;

version(UNICODE){
	alias SecurityFunctionTableW SecurityFunctionTable;
	alias PSecurityFunctionTableW PSecurityFunctionTable;
}else{
	alias SecurityFunctionTableA SecurityFunctionTable;
	alias PSecurityFunctionTableA PSecurityFunctionTable;
}

enum {
	SECURITY_SUPPORT_PROVIDER_INTERFACE_VERSION   = 1,
	SECURITY_SUPPORT_PROVIDER_INTERFACE_VERSION_2 = 2,
	SECURITY_SUPPORT_PROVIDER_INTERFACE_VERSION_3 = 3,
	SECURITY_SUPPORT_PROVIDER_INTERFACE_VERSION_4 = 4,
}

export extern(Windows) PSecurityFunctionTableA InitSecurityInterfaceA();
alias PSecurityFunctionTableA function() INIT_SECURITY_INTERFACE_A;
export extern(Windows) PSecurityFunctionTableW InitSecurityInterfaceW();
alias PSecurityFunctionTableW function() INIT_SECURITY_INTERFACE_W;

version(UNICODE){
	alias InitSecurityInterfaceW InitSecurityInterface;
	alias INIT_SECURITY_INTERFACE_W INIT_SECURITY_INTERFACE;
}else{
	alias InitSecurityInterfaceA InitSecurityInterface;
	alias INIT_SECURITY_INTERFACE_A INIT_SECURITY_INTERFACE;
}

export extern(Windows) SECURITY_STATUS SaslEnumerateProfilesA(LPSTR* ProfileList, ULONG* ProfileCount);
export extern(Windows) SECURITY_STATUS SaslEnumerateProfilesW(LPWSTR* ProfileList, ULONG* ProfileCount);
version(UNICODE)
	alias SaslEnumerateProfilesW SaslEnumerateProfiles;
else
	alias SaslEnumerateProfilesA SaslEnumerateProfiles;


export extern(Windows) SECURITY_STATUS SaslGetProfilePackageA(LPSTR ProfileName, PSecPkgInfoA* PackageInfo);
export extern(Windows) SECURITY_STATUS SaslGetProfilePackageW(LPWSTR ProfileName, PSecPkgInfoW* PackageInfo);
version(UNICODE)
	alias SaslGetProfilePackageW SaslGetProfilePackage;
else
	alias SaslGetProfilePackageA SaslGetProfilePackage;

export extern(Windows) SECURITY_STATUS SaslIdentifyPackageA(PSecBufferDesc pInput, PSecPkgInfoA* PackageInfo);
export extern(Windows) SECURITY_STATUS SaslIdentifyPackageW(PSecBufferDesc pInput, PSecPkgInfoW* PackageInfo);
version(UNICODE)
	alias SaslIdentifyPackageW SaslIdentifyPackage;
else
	alias SaslIdentifyPackageA SaslIdentifyPackage;

export extern(Windows) SECURITY_STATUS SaslInitializeSecurityContextW(PCredHandle phCredential, PCtxtHandle phContext, LPWSTR pszTargetName, uint fContextReq, uint Reserved1, uint TargetDataRep, PSecBufferDesc pInput, uint Reserved2, PCtxtHandle phNewContext, PSecBufferDesc pOutput, uint* pfContextAttr, PTimeStamp ptsExpiry);
export extern(Windows) SECURITY_STATUS SaslInitializeSecurityContextA(PCredHandle phCredential, PCtxtHandle phContext, LPSTR pszTargetName, uint fContextReq, uint Reserved1, uint TargetDataRep, PSecBufferDesc pInput, uint Reserved2, PCtxtHandle phNewContext, PSecBufferDesc pOutput, uint* pfContextAttr, PTimeStamp ptsExpiry);
version(UNICODE)
	alias SaslInitializeSecurityContextW SaslInitializeSecurityContext;
else
	alias SaslInitializeSecurityContextA SaslInitializeSecurityContext;

export extern(Windows) SECURITY_STATUS SaslAcceptSecurityContext(PCredHandle phCredential, PCtxtHandle phContext, PSecBufferDesc pInput, uint fContextReq, uint TargetDataRep, PCtxtHandle phNewContext, PSecBufferDesc pOutput, uint* pfContextAttr, PTimeStamp ptsExpiry);

enum {
	SASL_OPTION_SEND_SIZE        = 1,
	SASL_OPTION_RECV_SIZE        = 2,
	SASL_OPTION_AUTHZ_STRING     = 3,
	SASL_OPTION_AUTHZ_PROCESSING = 4,
}

enum {
	Sasl_AuthZIDForbidden,
	Sasl_AuthZIDProcessed
}
alias int SASL_AUTHZID_STATE ;

export extern(Windows) SECURITY_STATUS SaslSetContextOption(PCtxtHandle ContextHandle, ULONG Option, PVOID Value, ULONG Size);
export extern(Windows) SECURITY_STATUS SaslGetContextOption(PCtxtHandle ContextHandle, ULONG Option, PVOID Value, ULONG Size, PULONG Needed);

enum SEC_WINNT_AUTH_IDENTITY_VERSION_2 = 0x201;

struct SEC_WINNT_AUTH_IDENTITY_EX2 {
	uint Version;
	ushort cbHeaderLength;
	uint cbStructureLength;
	uint UserOffset;
	ushort UserLength;
	uint DomainOffset;
	ushort DomainLength;
	uint PackedCredentialsOffset;
	ushort PackedCredentialsLength;
	uint Flags;
	uint PackageListOffset;
	ushort PackageListLength;
}
alias SEC_WINNT_AUTH_IDENTITY_EX2* PSEC_WINNT_AUTH_IDENTITY_EX2;

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
	ubyte* User;
	uint UserLength;
	ubyte* Domain;
	uint DomainLength;
	ubyte* Password;
	uint PasswordLength;
	uint Flags;
}
alias SEC_WINNT_AUTH_IDENTITY_A* PSEC_WINNT_AUTH_IDENTITY_A;

version(UNICODE)
	alias SEC_WINNT_AUTH_IDENTITY_W SEC_WINNT_AUTH_IDENTITY;
	alias PSEC_WINNT_AUTH_IDENTITY_W PSEC_WINNT_AUTH_IDENTITY;
}else{
	alias SEC_WINNT_AUTH_IDENTITY_A SEC_WINNT_AUTH_IDENTITY;
	alias PSEC_WINNT_AUTH_IDENTITY_A PSEC_WINNT_AUTH_IDENTITY;
}

enum SEC_WINNT_AUTH_IDENTITY_VERSION = 0x200;

struct SEC_WINNT_AUTH_IDENTITY_EXW {
	uint Version;
	uint Length;
	ushort* User;
	uint UserLength;
	ushort*Domain;
	uint DomainLength;
	ushort* Password;
	uint PasswordLength;
	uint Flags;
	ushort* PackageList;
	uint PackageListLength;
}
alias SEC_WINNT_AUTH_IDENTITY_EXW* PSEC_WINNT_AUTH_IDENTITY_EXW;

struct SEC_WINNT_AUTH_IDENTITY_EXA {
	uint Version;
	uint Length;
	ubyte* User;
	uint UserLength;
	ubyte* Domain;
	uint DomainLength;
	ubyte* Password;
	uint PasswordLength;
	uint Flags;
	ubyte* PackageList;
	uint PackageListLength;
}
alias SEC_WINNT_AUTH_IDENTITY_EXA* PSEC_WINNT_AUTH_IDENTITY_EXA;

version(UNICODE){
	alias SEC_WINNT_AUTH_IDENTITY_EXW SEC_WINNT_AUTH_IDENTITY_EX;
	alias PSEC_WINNT_AUTH_IDENTITY_EXW PSEC_WINNT_AUTH_IDENTITY_EX;
}else{
	alias SEC_WINNT_AUTH_IDENTITY_EXA SEC_WINNT_AUTH_IDENTITY_EX;
}

union SEC_WINNT_AUTH_IDENTITY_INFO {
	SEC_WINNT_AUTH_IDENTITY_EXW AuthIdExw;
	SEC_WINNT_AUTH_IDENTITY_EXA AuthIdExa;
	SEC_WINNT_AUTH_IDENTITY_A AuthId_a;
	SEC_WINNT_AUTH_IDENTITY_W AuthId_w;
	SEC_WINNT_AUTH_IDENTITY_EX2 AuthIdEx2;
}
alias SEC_WINNT_AUTH_IDENTITY_INFO* PSEC_WINNT_AUTH_IDENTITY_INFO;

enum {
	SEC_WINNT_AUTH_IDENTITY_FLAGS_PROCESS_ENCRYPTED           = 0x10,
	SEC_WINNT_AUTH_IDENTITY_FLAGS_SYSTEM_PROTECTED            = 0x20,
	SEC_WINNT_AUTH_IDENTITY_FLAGS_RESERVED                    = 0x10000,
	SEC_WINNT_AUTH_IDENTITY_FLAGS_NULL_USER                   = 0x20000,
	SEC_WINNT_AUTH_IDENTITY_FLAGS_NULL_DOMAIN                 = 0x40000,
	SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_USE_MASK            = 0xFF000000,
	SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_SAVE_CRED_BY_CALLER = 0x80000000,
	SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_SAVE_CRED_CHECKED   = 0x40000000,
	SEC_WINNT_AUTH_IDENTITY_FLAGS_VALID_SSPIPFC_FLAGS         = SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_SAVE_CRED_BY_CALLER |  SEC_WINNT_AUTH_IDENTITY_FLAGS_SSPIPFC_SAVE_CRED_CHECKED,
}

alias PSEC_WINNT_AUTH_IDENTITY_INFO PSEC_WINNT_AUTH_IDENTITY_OPAQUE;

enum {
	SSPIPFC_SAVE_CRED_BY_CALLER = 0x00000001,
	SSPIPFC_VALID_FLAGS         = SSPIPFC_SAVE_CRED_BY_CALLER,
}

uint SspiPromptForCredentialsW(PCWSTR pszTargetName, PCREDUI_INFOW pUiInfo, uint dwAuthError, PCWSTR pszPackage, PSEC_WINNT_AUTH_IDENTITY_OPAQUE pInputAuthIdentity, PSEC_WINNT_AUTH_IDENTITY_OPAQUE* ppAuthIdentity, int* pfSave, uint dwFlags);
uint SspiPromptForCredentialsA(PCSTR pszTargetName, PCREDUI_INFOA pUiInfo, uint dwAuthError, PCSTR pszPackage, PSEC_WINNT_AUTH_IDENTITY_OPAQUE pInputAuthIdentity, PSEC_WINNT_AUTH_IDENTITY_OPAQUE* ppAuthIdentity, int* pfSave, uint dwFlags);
version(UNICODE)
	alias SspiPromptForCredentialsW SspiPromptForCredentials;
else
	alias SspiPromptForCredentialsA SspiPromptForCredentials;

struct SEC_WINNT_AUTH_BYTE_VECTOR {
	uint ByteArrayOffset;
	ushort ByteArrayLength;
}
alias SEC_WINNT_AUTH_BYTE_VECTOR* PSEC_WINNT_AUTH_BYTE_VECTOR;

struct SEC_WINNT_AUTH_DATA {
	GUID CredType;
	SEC_WINNT_AUTH_BYTE_VECTOR CredData;
}
alias SEC_WINNT_AUTH_DATA* PSEC_WINNT_AUTH_DATA;

struct SEC_WINNT_AUTH_PACKED_CREDENTIALS {
	ushort cbHeaderLength;
	ushort cbStructureLength;
	SEC_WINNT_AUTH_DATA AuthData;
}
alias SEC_WINNT_AUTH_PACKED_CREDENTIALS* PSEC_WINNT_AUTH_PACKED_CREDENTIALS;

static const GUID SEC_WINNT_AUTH_DATA_TYPE_PASSWORD =
{0x28bfc32f, 0x10f6, 0x4738, [0x98, 0xd1, 0x1a, 0xc0, 0x61, 0xdf, 0x71, 0x6a]};

static const GUID SEC_WINNT_AUTH_DATA_TYPE_CERT =
{0x235f69ad, 0x73fb, 0x4dbc, [0x82, 0x3, 0x6, 0x29, 0xe7, 0x39, 0x33, 0x9b]};

struct SEC_WINNT_AUTH_DATA_PASSWORD  {
	SEC_WINNT_AUTH_BYTE_VECTOR UnicodePassword;
}
alias SEC_WINNT_AUTH_DATA_PASSWORD PSEC_WINNT_AUTH_DATA_PASSWORD;

static const GUID SEC_WINNT_AUTH_DATA_TYPE_CSP_DATA =
{0x68fd9879, 0x79c, 0x4dfe, [0x82, 0x81, 0x57, 0x8a, 0xad, 0xc1, 0xc1, 0x0]};

struct SEC_WINNT_AUTH_CERTIFICATE_DATA {
	ushort cbHeaderLength;
	ushort cbStructureLength;
	SEC_WINNT_AUTH_BYTE_VECTOR Certificate;
}
alias SEC_WINNT_AUTH_CERTIFICATE_DATA* PSEC_WINNT_AUTH_CERTIFICATE_DATA;

struct SEC_WINNT_CREDUI_CONTEXT_VECTOR {
	ULONG CredUIContextArrayOffset;
	USHORT CredUIContextCount;
}
alias SEC_WINNT_CREDUI_CONTEXT_VECTOR* PSEC_WINNT_CREDUI_CONTEXT_VECTOR;

struct SEC_WINNT_AUTH_SHORT_VECTOR {
	ULONG ShortArrayOffset;
	USHORT ShortArrayCount;
}
alias SEC_WINNT_AUTH_SHORT_VECTOR* PSEC_WINNT_AUTH_SHORT_VECTOR;

export extern(Windows) SECURITY_STATUS SspiGetCredUIContext(HANDLE ContextHandle, GUID* CredType, LUID* LogonId, PSEC_WINNT_CREDUI_CONTEXT_VECTOR* CredUIContexts, HANDLE* TokenHandle);
export extern(Windows) SECURITY_STATUS SspiUpdateCredentials(HANDLE ContextHandle, GUID* CredType, ULONG FlatCredUIContextLength, PUCHAR FlatCredUIContext);

struct CREDUIWIN_MARSHALED_CONTEXT {
	GUID StructureType;
	USHORT cbHeaderLength;
	LUID LogonId;
	GUID MarshaledDataType;
	ULONG MarshaledDataOffset;
	USHORT MarshaledDataLength;
}
alias CREDUIWIN_MARSHALED_CONTEXT* PCREDUIWIN_MARSHALED_CONTEXT;

struct SEC_WINNT_CREDUI_CONTEXT {
	USHORT cbHeaderLength;
	HANDLE CredUIContextHandle;
	PCREDUI_INFOW UIInfo;
	ULONG dwAuthError;
	PSEC_WINNT_AUTH_IDENTITY_OPAQUE pInputAuthIdentity;
	PUNICODE_STRING TargetName;
}
alias SEC_WINNT_CREDUI_CONTEXT* PSEC_WINNT_CREDUI_CONTEXT;

static const GUID CREDUIWIN_STRUCTURE_TYPE_SSPIPFC =
{0x3c3e93d9, 0xd96b, 0x49b5, [0x94, 0xa7, 0x45, 0x85, 0x92, 0x8, 0x83, 0x37]};

const GUID SSPIPFC_STRUCTURE_TYPE_CREDUI_CONTEXT =
{0xc2fffe6f, 0x503d, 0x4c3d, [0xa9, 0x5e, 0xbc, 0xe8, 0x21, 0x21, 0x3d, 0x44]};

struct SEC_WINNT_AUTH_PACKED_CREDENTIALS_EX {
	ushort cbHeaderLength;
	uint Flags;
	SEC_WINNT_AUTH_BYTE_VECTOR PackedCredentials;
	SEC_WINNT_AUTH_SHORT_VECTOR PackageList;
}
alias SEC_WINNT_AUTH_PACKED_CREDENTIALS_EX* PSEC_WINNT_AUTH_PACKED_CREDENTIALS_EX;

export extern(Windows) SECURITY_STATUS SspiUnmarshalCredUIContext(PUCHAR MarshaledCredUIContext, ULONG MarshaledCredUIContextLength, PSEC_WINNT_CREDUI_CONTEXT* CredUIContext);

export extern(Windows) SECURITY_STATUS SspiPrepareForCredRead(PSEC_WINNT_AUTH_IDENTITY_OPAQUE AuthIdentity, PCWSTR pszTargetName, PULONG pCredmanCredentialType, PCWSTR* ppszCredmanTargetName);
export extern(Windows) SECURITY_STATUS SspiPrepareForCredWrite(PSEC_WINNT_AUTH_IDENTITY_OPAQUE AuthIdentity, PCWSTR pszTargetName, PULONG pCredmanCredentialType, PCWSTR* ppszCredmanTargetName, PCWSTR* ppszCredmanUserName, PUCHAR* ppCredentialBlob, PULONG pCredentialBlobSize);
export extern(Windows) SECURITY_STATUS SspiEncryptAuthIdentity(PSEC_WINNT_AUTH_IDENTITY_OPAQUE AuthData);
export extern(Windows) SECURITY_STATUS SspiDecryptAuthIdentity(PSEC_WINNT_AUTH_IDENTITY_OPAQUE EncryptedAuthData);
export extern(Windows) BOOLEAN SspiIsAuthIdentityEncrypted(PSEC_WINNT_AUTH_IDENTITY_OPAQUE EncryptedAuthData);

static if(NTDDI_VERSION >= NTDDI_WIN7){
	export extern(Windows) SECURITY_STATUS SspiEncodeAuthIdentityAsStrings(PSEC_WINNT_AUTH_IDENTITY_OPAQUE pAuthIdentity, PCWSTR* ppszUserName, PCWSTR* ppszDomainName, PCWSTR* ppszPackedCredentialsString);
	export extern(Windows) SECURITY_STATUS SspiValidateAuthIdentity(PSEC_WINNT_AUTH_IDENTITY_OPAQUE AuthData);
	export extern(Windows) SECURITY_STATUS SspiCopyAuthIdentity(PSEC_WINNT_AUTH_IDENTITY_OPAQUE AuthData, PSEC_WINNT_AUTH_IDENTITY_OPAQUE* AuthDataCopy);
	export extern(Windows) VOID SspiFreeAuthIdentity(PSEC_WINNT_AUTH_IDENTITY_OPAQUE AuthData);
	export extern(Windows) VOID SspiZeroAuthIdentity(PSEC_WINNT_AUTH_IDENTITY_OPAQUE AuthData);
	export extern(Windows) VOID SspiLocalFree(PVOID DataBuffer);
	export extern(Windows) SECURITY_STATUS SspiEncodeStringsAsAuthIdentity(PCWSTR pszUserName, PCWSTR pszDomainName, PCWSTR pszPackedCredentialsString, PSEC_WINNT_AUTH_IDENTITY_OPAQUE* ppAuthIdentity);
	export extern(Windows) SECURITY_STATUS SspiCompareAuthIdentities(PSEC_WINNT_AUTH_IDENTITY_OPAQUE AuthIdentity1, PSEC_WINNT_AUTH_IDENTITY_OPAQUE AuthIdentity2, PBOOLEAN SameSuppliedUser, PBOOLEAN SameSuppliedIdentity);
	export extern(Windows) SECURITY_STATUS SspiMarshalAuthIdentity(PSEC_WINNT_AUTH_IDENTITY_OPAQUE AuthIdentity, uint* AuthIdentityLength, char** AuthIdentityByteArray);
	export extern(Windows) SECURITY_STATUS SspiUnmarshalAuthIdentity(uint AuthIdentityLength, char* AuthIdentityByteArray, PSEC_WINNT_AUTH_IDENTITY_OPAQUE* ppAuthIdentity);
	export extern(Windows) BOOLEAN SspiIsPromptingNeeded(uint ErrorOrNtStatus);
	export extern(Windows) SECURITY_STATUS SspiGetTargetHostName(PCWSTR pszTargetName, PWSTR* pszHostName);
	export extern(Windows) SECURITY_STATUS SspiExcludePackage(PSEC_WINNT_AUTH_IDENTITY_OPAQUE AuthIdentity, PCWSTR pszPackageName, PSEC_WINNT_AUTH_IDENTITY_OPAQUE* ppNewAuthIdentity);
}
//(NTDDI_VERSION >= NTDDI_WIN7)
	enum {
		SEC_WINNT_AUTH_IDENTITY_MARSHALLED = 0x4,
		SEC_WINNT_AUTH_IDENTITY_ONLY = 0x8,
	}

struct SECURITY_PACKAGE_OPTIONS {
	uint Size;
	uint Type;
	uint Flags;
	uint SignatureSize;
	void* Signature;
}
alias SECURITY_PACKAGE_OPTIONS* PSECURITY_PACKAGE_OPTIONS;

enum {
	SECPKG_OPTIONS_TYPE_UNKNOWN = 0,
	SECPKG_OPTIONS_TYPE_LSA     = 1,
	SECPKG_OPTIONS_TYPE_SSPI    = 2,
}

enum SECPKG_OPTIONS_PERMANENT = 0x00000001;

export extern(Windows) SECURITY_STATUS AddSecurityPackageA(LPSTR pszPackageName, PSECURITY_PACKAGE_OPTIONS pOptions);
export extern(Windows) SECURITY_STATUS AddSecurityPackageW(LPWSTR pszPackageName, PSECURITY_PACKAGE_OPTIONS pOptions);
version(UNICODE)
	alias AddSecurityPackageW AddSecurityPackage;
else
	alias AddSecurityPackageA AddSecurityPackage;

export extern(Windows) SECURITY_STATUS DeleteSecurityPackageA(LPSTR pszPackageName);
export extern(Windows) SECURITY_STATUS DeleteSecurityPackageW(LPWSTR pszPackageName);
version(UNICODE)
	alias DeleteSecurityPackageW DeleteSecurityPackage;
else
	alias DeleteSecurityPackageA DeleteSecurityPackage;

}// extern(C)
