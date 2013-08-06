/** wincred.d

Converted from 'wincred.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.wincred;


import c.windows.windef;
import c.windows.winternl; // NTSTATUS
import c.windows.sspi;


extern(C){


enum {
	STATUS_LOGON_FAILURE                  = cast(NTSTATUS)0xC000006D,
	STATUS_WRONG_PASSWORD                 = cast(NTSTATUS)0xC000006A,
	STATUS_PASSWORD_EXPIRED               = cast(NTSTATUS)0xC0000071,
	STATUS_PASSWORD_MUST_CHANGE           = cast(NTSTATUS)0xC0000224,
	STATUS_ACCESS_DENIED                  = cast(NTSTATUS)0xC0000022,
	STATUS_DOWNGRADE_DETECTED             = cast(NTSTATUS)0xC0000388,
	STATUS_AUTHENTICATION_FIREWALL_FAILED = cast(NTSTATUS)0xC0000413,
	STATUS_ACCOUNT_DISABLED               = cast(NTSTATUS)0xC0000072,
	STATUS_ACCOUNT_RESTRICTION            = cast(NTSTATUS)0xC000006E,
	STATUS_ACCOUNT_LOCKED_OUT             = cast(NTSTATUS)0xC0000234,
	STATUS_ACCOUNT_EXPIRED                = cast(NTSTATUS)0xC0000193,
	STATUS_LOGON_TYPE_NOT_GRANTED         = cast(NTSTATUS)0xC000015B,
}

enum {
	NERR_BASE            = 2100,
	NERR_PasswordExpired = NERR_BASE+142,
}

//	CREDUIP_IS_USER_PASSWORD_ERROR( _Status ) (  (_Status) == ERROR_LOGON_FAILURE ||  (_Status) == __HRESULT_FROM_WIN32( ERROR_LOGON_FAILURE ) ||  (_Status) == STATUS_LOGON_FAILURE ||  (_Status) == HRESULT_FROM_NT( STATUS_LOGON_FAILURE ) ||  (_Status) == ERROR_ACCESS_DENIED ||  (_Status) == __HRESULT_FROM_WIN32( ERROR_ACCESS_DENIED ) ||  (_Status) == STATUS_ACCESS_DENIED ||  (_Status) == HRESULT_FROM_NT( STATUS_ACCESS_DENIED ) ||  (_Status) == ERROR_INVALID_PASSWORD ||  (_Status) == __HRESULT_FROM_WIN32( ERROR_INVALID_PASSWORD ) ||  (_Status) == STATUS_WRONG_PASSWORD ||  (_Status) == HRESULT_FROM_NT( STATUS_WRONG_PASSWORD ) ||  (_Status) == SEC_E_NO_CREDENTIALS ||  (_Status) == SEC_E_LOGON_DENIED ||  (_Status) == SEC_E_NO_CONTEXT ||  (_Status) == STATUS_NO_SECURITY_CONTEXT )
//	CREDUIP_IS_DOWNGRADE_ERROR( _Status ) (  (_Status) == ERROR_DOWNGRADE_DETECTED ||  (_Status) == __HRESULT_FROM_WIN32( ERROR_DOWNGRADE_DETECTED ) ||  (_Status) == STATUS_DOWNGRADE_DETECTED ||  (_Status) == HRESULT_FROM_NT( STATUS_DOWNGRADE_DETECTED )  )
//	CREDUIP_IS_EXPIRED_ERROR( _Status ) (  (_Status) == ERROR_PASSWORD_EXPIRED ||  (_Status) == __HRESULT_FROM_WIN32( ERROR_PASSWORD_EXPIRED ) ||  (_Status) == STATUS_PASSWORD_EXPIRED ||  (_Status) == HRESULT_FROM_NT( STATUS_PASSWORD_EXPIRED ) ||  (_Status) == ERROR_PASSWORD_MUST_CHANGE ||  (_Status) == __HRESULT_FROM_WIN32( ERROR_PASSWORD_MUST_CHANGE ) ||  (_Status) == STATUS_PASSWORD_MUST_CHANGE ||  (_Status) == HRESULT_FROM_NT( STATUS_PASSWORD_MUST_CHANGE ) ||  (_Status) == NERR_PasswordExpired ||  (_Status) == __HRESULT_FROM_WIN32( NERR_PasswordExpired )  )
//	CREDUI_IS_AUTHENTICATION_ERROR( _Status ) (  CREDUIP_IS_USER_PASSWORD_ERROR( _Status ) ||  CREDUIP_IS_DOWNGRADE_ERROR( _Status ) ||  CREDUIP_IS_EXPIRED_ERROR( _Status )  )
//	CREDUI_NO_PROMPT_AUTHENTICATION_ERROR( _Status ) (  (_Status) == ERROR_AUTHENTICATION_FIREWALL_FAILED ||  (_Status) == __HRESULT_FROM_WIN32( ERROR_AUTHENTICATION_FIREWALL_FAILED ) ||  (_Status) == STATUS_AUTHENTICATION_FIREWALL_FAILED ||  (_Status) == HRESULT_FROM_NT( STATUS_AUTHENTICATION_FIREWALL_FAILED ) ||  (_Status) == ERROR_ACCOUNT_DISABLED ||  (_Status) == __HRESULT_FROM_WIN32( ERROR_ACCOUNT_DISABLED ) ||  (_Status) == STATUS_ACCOUNT_DISABLED ||  (_Status) == HRESULT_FROM_NT( STATUS_ACCOUNT_DISABLED ) ||  (_Status) == ERROR_ACCOUNT_RESTRICTION ||  (_Status) == __HRESULT_FROM_WIN32( ERROR_ACCOUNT_RESTRICTION ) ||  (_Status) == STATUS_ACCOUNT_RESTRICTION ||  (_Status) == HRESULT_FROM_NT( STATUS_ACCOUNT_RESTRICTION ) ||  (_Status) == ERROR_ACCOUNT_LOCKED_OUT ||  (_Status) == __HRESULT_FROM_WIN32( ERROR_ACCOUNT_LOCKED_OUT ) ||  (_Status) == STATUS_ACCOUNT_LOCKED_OUT ||  (_Status) == HRESULT_FROM_NT( STATUS_ACCOUNT_LOCKED_OUT ) ||  (_Status) == ERROR_ACCOUNT_EXPIRED ||  (_Status) == __HRESULT_FROM_WIN32( ERROR_ACCOUNT_EXPIRED ) ||  (_Status) == STATUS_ACCOUNT_EXPIRED ||  (_Status) == HRESULT_FROM_NT( STATUS_ACCOUNT_EXPIRED ) ||  (_Status) == ERROR_LOGON_TYPE_NOT_GRANTED ||  (_Status) == __HRESULT_FROM_WIN32( ERROR_LOGON_TYPE_NOT_GRANTED ) ||  (_Status) == STATUS_LOGON_TYPE_NOT_GRANTED ||  (_Status) == HRESULT_FROM_NT( STATUS_LOGON_TYPE_NOT_GRANTED )  )

enum {
	CRED_MAX_STRING_LENGTH               = 256,
	CRED_MAX_USERNAME_LENGTH             = 256+1+256,
	CRED_MAX_GENERIC_TARGET_NAME_LENGTH  = 32767,
	CRED_MAX_DOMAIN_TARGET_NAME_LENGTH   = 256+1+80,
	CRED_MAX_TARGETNAME_NAMESPACE_LENGTH = 256,
	CRED_MAX_TARGETNAME_ATTRIBUTE_LENGTH = 256,
	CRED_MAX_VALUE_SIZE                  = 256,
	CRED_MAX_ATTRIBUTES                  = 64,
}

struct CREDENTIAL_ATTRIBUTEA  {
	LPSTR Keyword;
	DWORD Flags;
	DWORD ValueSize;
	LPBYTE Value;
}
alias CREDENTIAL_ATTRIBUTEA* PCREDENTIAL_ATTRIBUTEA;

struct CREDENTIAL_ATTRIBUTEW {
	LPWSTR Keyword;
	DWORD Flags;
	DWORD ValueSize;
	LPBYTE Value;
}
alias CREDENTIAL_ATTRIBUTEW* PCREDENTIAL_ATTRIBUTEW;

version(UNICODE){
	alias CREDENTIAL_ATTRIBUTEW CREDENTIAL_ATTRIBUTE;
	alias PCREDENTIAL_ATTRIBUTEW PCREDENTIAL_ATTRIBUTE;
}else{
	alias CREDENTIAL_ATTRIBUTEA CREDENTIAL_ATTRIBUTE;
	alias PCREDENTIAL_ATTRIBUTEA PCREDENTIAL_ATTRIBUTE;
}

const wchar* CRED_SESSION_WILDCARD_NAME_W = "*Session";
const char* CRED_SESSION_WILDCARD_NAME_A = "*Session";
const wchar CRED_UNIVERSAL_WILDCARD_W = '*';
const char CRED_UNIVERSAL_WILDCARD_A = '*';
enum CRED_SESSION_WILDCARD_NAME_LENGTH = CRED_SESSION_WILDCARD_NAME_A.sizeof - 1;
const wchar* CRED_TARGETNAME_DOMAIN_NAMESPACE_W = "Domain";
const char* CRED_TARGETNAME_DOMAIN_NAMESPACE_A = "Domain";
enum CRED_TARGETNAME_DOMAIN_NAMESPACE_LENGTH = CRED_TARGETNAME_DOMAIN_NAMESPACE_A.sizeof - 1;
//const wchar CRED_UNIVERSAL_WILDCARD_W = '*';
//const char CRED_UNIVERSAL_WILDCARD_A = '*';
const wchar* CRED_TARGETNAME_LEGACYGENERIC_NAMESPACE_W = "LegacyGeneric";
const char* CRED_TARGETNAME_LEGACYGENERIC_NAMESPACE_A = "LegacyGeneric";
enum CRED_TARGETNAME_LEGACYGENERIC_NAMESPACE_LENGTH = CRED_TARGETNAME_LEGACYGENERIC_NAMESPACE_A.sizeof - 1;
const wchar CRED_TARGETNAME_NAMESPACE_SEPERATOR_W = ':';
const char CRED_TARGETNAME_NAMESPACE_SEPERATOR_A = ':';
const wchar CRED_TARGETNAME_ATTRIBUTE_SEPERATOR_W  = '=';
const char CRED_TARGETNAME_ATTRIBUTE_SEPERATOR_A = '=';
const wchar CRED_TARGETNAME_DOMAIN_EXTENDED_USERNAME_SEPARATOR_W  = '|';
const char CRED_TARGETNAME_DOMAIN_EXTENDED_USERNAME_SEPARATOR_A = '|';
const wchar* CRED_TARGETNAME_ATTRIBUTE_TARGET_W = "target";
const char* CRED_TARGETNAME_ATTRIBUTE_TARGET_A = "target";
enum CRED_TARGETNAME_ATTRIBUTE_TARGET_LENGTH = CRED_TARGETNAME_ATTRIBUTE_TARGET_A.sizeof - 1;
const wchar* CRED_TARGETNAME_ATTRIBUTE_NAME_W = "name";
const char* CRED_TARGETNAME_ATTRIBUTE_NAME_A = "name";
enum CRED_TARGETNAME_ATTRIBUTE_NAME_LENGTH = CRED_TARGETNAME_ATTRIBUTE_NAME_A.sizeof - 1;
const wchar* CRED_TARGETNAME_ATTRIBUTE_BATCH_W = "batch";
const char* CRED_TARGETNAME_ATTRIBUTE_BATCH_A = "batch";
enum CRED_TARGETNAME_ATTRIBUTE_BATCH_LENGTH = CRED_TARGETNAME_ATTRIBUTE_BATCH_A.sizeof - 1;
const wchar* CRED_TARGETNAME_ATTRIBUTE_INTERACTIVE_W = "interactive";
const char* CRED_TARGETNAME_ATTRIBUTE_INTERACTIVE_A = "interactive";
enum CRED_TARGETNAME_ATTRIBUTE_INTERACTIVE_LENGTH = CRED_TARGETNAME_ATTRIBUTE_INTERACTIVE_A.sizeof -1;
const wchar* CRED_TARGETNAME_ATTRIBUTE_SERVICE_W = "service";
const char* CRED_TARGETNAME_ATTRIBUTE_SERVICE_A = "service";
enum CRED_TARGETNAME_ATTRIBUTE_SERVICE_LENGTH = CRED_TARGETNAME_ATTRIBUTE_SERVICE_A.sizeof - 1;
const wchar* CRED_TARGETNAME_ATTRIBUTE_NETWORK_W = "network";
const char* CRED_TARGETNAME_ATTRIBUTE_NETWORK_A = "network";
enum CRED_TARGETNAME_ATTRIBUTE_NETWORK_LENGTH = CRED_TARGETNAME_ATTRIBUTE_NETWORK_A.sizeof - 1;
const wchar* CRED_TARGETNAME_ATTRIBUTE_NETWORKCLEARTEXT_W = "networkcleartext";
const char* CRED_TARGETNAME_ATTRIBUTE_NETWORKCLEARTEXT_A = "networkcleartext";
enum CRED_TARGETNAME_ATTRIBUTE_NETWORKCLEARTEXT_LENGTH = CRED_TARGETNAME_ATTRIBUTE_NETWORKCLEARTEXT_A.sizeof - 1;
const wchar* CRED_TARGETNAME_ATTRIBUTE_REMOTEINTERACTIVE_W = "remoteinteractive";
const char* CRED_TARGETNAME_ATTRIBUTE_REMOTEINTERACTIVE_A = "remoteinteractive";
enum CRED_TARGETNAME_ATTRIBUTE_REMOTEINTERACTIVE_LENGTH = CRED_TARGETNAME_ATTRIBUTE_REMOTEINTERACTIVE_A.sizeof - 1;
const wchar* CRED_TARGETNAME_ATTRIBUTE_CACHEDINTERACTIVE_W = "cachedinteractive";
const char* CRED_TARGETNAME_ATTRIBUTE_CACHEDINTERACTIVE_A = "cachedinteractive";
enum CRED_TARGETNAME_ATTRIBUTE_CACHEDINTERACTIVE_LENGTH = CRED_TARGETNAME_ATTRIBUTE_CACHEDINTERACTIVE_A.sizeof - 1;

version(UNICODE){
	alias CRED_SESSION_WILDCARD_NAME_W CRED_SESSION_WILDCARD_NAME;
	alias CRED_TARGETNAME_DOMAIN_NAMESPACE_W CRED_TARGETNAME_DOMAIN_NAMESPACE;
	//alias CRED_UNIVERSAL_WILDCARD_W CRED_UNIVERSAL_WILDCARD;
	//alias CRED_TARGETNAME_NAMESPACE_SEPERATOR_W CRED_TARGETNAME_NAMESPACE_SEPERATOR;
	//alias CRED_TARGETNAME_ATTRIBUTE_SEPERATOR_W CRED_TARGETNAME_ATTRIBUTE_SEPERATOR;
	alias CRED_TARGETNAME_ATTRIBUTE_NAME_W CRED_TARGETNAME_ATTRIBUTE_NAME;
	alias CRED_TARGETNAME_ATTRIBUTE_TARGET_W CRED_TARGETNAME_ATTRIBUTE_TARGET;
	alias CRED_TARGETNAME_ATTRIBUTE_BATCH_W CRED_TARGETNAME_ATTRIBUTE_BATCH;
	alias CRED_TARGETNAME_ATTRIBUTE_INTERACTIVE_W CRED_TARGETNAME_ATTRIBUTE_INTERACTIVE;
	alias CRED_TARGETNAME_ATTRIBUTE_SERVICE_W CRED_TARGETNAME_ATTRIBUTE_SERVICE;
	alias CRED_TARGETNAME_ATTRIBUTE_NETWORK_W CRED_TARGETNAME_ATTRIBUTE_NETWORK;
	alias CRED_TARGETNAME_ATTRIBUTE_NETWORKCLEARTEXT_W CRED_TARGETNAME_ATTRIBUTE_NETWORKCLEARTEXT;
	alias CRED_TARGETNAME_ATTRIBUTE_REMOTEINTERACTIVE_W CRED_TARGETNAME_ATTRIBUTE_REMOTEINTERACTIVE;
	alias CRED_TARGETNAME_ATTRIBUTE_CACHEDINTERACTIVE_W CRED_TARGETNAME_ATTRIBUTE_CACHEDINTERACTIVE;
}else{
	alias CRED_SESSION_WILDCARD_NAME_A CRED_SESSION_WILDCARD_NAME;
	alias CRED_TARGETNAME_DOMAIN_NAMESPACE_A CRED_TARGETNAME_DOMAIN_NAMESPACE;
	//alias CRED_UNIVERSAL_WILDCARD_A CRED_UNIVERSAL_WILDCARD;
	//alias CRED_TARGETNAME_NAMESPACE_SEPERATOR_A CRED_TARGETNAME_NAMESPACE_SEPERATOR;
	//alias CRED_TARGETNAME_ATTRIBUTE_SEPERATOR_A CRED_TARGETNAME_ATTRIBUTE_SEPERATOR;
	alias CRED_TARGETNAME_ATTRIBUTE_NAME_A CRED_TARGETNAME_ATTRIBUTE_NAME;
	alias CRED_TARGETNAME_ATTRIBUTE_TARGET_A CRED_TARGETNAME_ATTRIBUTE_TARGET;
	alias CRED_TARGETNAME_ATTRIBUTE_BATCH_A CRED_TARGETNAME_ATTRIBUTE_BATCH;
	alias CRED_TARGETNAME_ATTRIBUTE_INTERACTIVE_A CRED_TARGETNAME_ATTRIBUTE_INTERACTIVE;
	alias CRED_TARGETNAME_ATTRIBUTE_SERVICE_A CRED_TARGETNAME_ATTRIBUTE_SERVICE;
	alias CRED_TARGETNAME_ATTRIBUTE_NETWORK_A CRED_TARGETNAME_ATTRIBUTE_NETWORK;
	alias CRED_TARGETNAME_ATTRIBUTE_NETWORKCLEARTEXT_A CRED_TARGETNAME_ATTRIBUTE_NETWORKCLEARTEXT;
	alias CRED_TARGETNAME_ATTRIBUTE_REMOTEINTERACTIVE_A CRED_TARGETNAME_ATTRIBUTE_REMOTEINTERACTIVE;
	alias CRED_TARGETNAME_ATTRIBUTE_CACHEDINTERACTIVE_A CRED_TARGETNAME_ATTRIBUTE_CACHEDINTERACTIVE;
}

enum CRED_LOGON_TYPES_MASK = 0xF000;

//	CredAppendLogonTypeToFlags(Flags, LogonType) (Flags) |= ((LogonType) << 12)
//	CredGetLogonTypeFromFlags(Flags) ((SECURITY_LOGON_TYPE)(((Flags) & CRED_LOGON_TYPES_MASK) >> 12))
//	CredRemoveLogonTypeFromFlags(Flags) (Flags) &= ~CRED_LOGON_TYPES_MASK

enum {
	CRED_FLAGS_PASSWORD_FOR_CERT      = 0x0001,
	CRED_FLAGS_PROMPT_NOW             = 0x0002,
	CRED_FLAGS_USERNAME_TARGET        = 0x0004,
	CRED_FLAGS_OWF_CRED_BLOB          = 0x0008,
	CRED_FLAGS_REQUIRE_CONFIRMATION   = 0x0010,
	CRED_FLAGS_WILDCARD_MATCH         = 0x0020,
	CRED_FLAGS_VALID_FLAGS            = 0xF03F,
	CRED_FLAGS_VALID_INPUT_FLAGS      = 0xF01F,
	CRED_TYPE_GENERIC                 = 1,
	CRED_TYPE_DOMAIN_PASSWORD         = 2,
	CRED_TYPE_DOMAIN_CERTIFICATE      = 3,
	CRED_TYPE_DOMAIN_VISIBLE_PASSWORD = 4,
	CRED_TYPE_GENERIC_CERTIFICATE     = 5,
	CRED_TYPE_DOMAIN_EXTENDED         = 6,
	CRED_TYPE_MAXIMUM                 = 7,
	CRED_TYPE_MAXIMUM_EX              = CRED_TYPE_MAXIMUM+1000,
	CRED_MAX_CREDENTIAL_BLOB_SIZE     = 5*512,
}

enum {
	CRED_PERSIST_NONE          = 0,
	CRED_PERSIST_SESSION       = 1,
	CRED_PERSIST_LOCAL_MACHINE = 2,
	CRED_PERSIST_ENTERPRISE    = 3,
}

struct CREDENTIALA {
	DWORD Flags;
	DWORD Type;
	LPSTR TargetName;
	LPSTR Comment;
	FILETIME LastWritten;
	DWORD CredentialBlobSize;
	LPBYTE CredentialBlob;
	DWORD Persist;
	DWORD AttributeCount;
	PCREDENTIAL_ATTRIBUTEA Attributes;
	LPSTR TargetAlias;
	LPSTR UserName;
}
alias CREDENTIALA* PCREDENTIALA;

struct CREDENTIALW {
	DWORD Flags;
	DWORD Type;
	LPWSTR TargetName;
	LPWSTR Comment;
	FILETIME LastWritten;
	DWORD CredentialBlobSize;
	LPBYTE CredentialBlob;
	DWORD Persist;
	DWORD AttributeCount;
	PCREDENTIAL_ATTRIBUTEW Attributes;
	LPWSTR TargetAlias;
	LPWSTR UserName;
}
alias CREDENTIALW* PCREDENTIALW;

version(UNICODE){
	alias CREDENTIALW CREDENTIAL;
	alias PCREDENTIALW PCREDENTIAL;
}else{
	alias CREDENTIALA CREDENTIAL;
	alias PCREDENTIALA PCREDENTIAL;
}

enum {
	CRED_TI_SERVER_FORMAT_UNKNOWN  = 0x0001,
	CRED_TI_DOMAIN_FORMAT_UNKNOWN  = 0x0002,
	CRED_TI_ONLY_PASSWORD_REQUIRED = 0x0004,
	CRED_TI_USERNAME_TARGET        = 0x0008,
	CRED_TI_CREATE_EXPLICIT_CRED   = 0x0010,
	CRED_TI_WORKGROUP_MEMBER       = 0x0020,
	CRED_TI_VALID_FLAGS            = 0xF07F,
}

struct CREDENTIAL_TARGET_INFORMATIONA {
	LPSTR TargetName;
	LPSTR NetbiosServerName;
	LPSTR DnsServerName;
	LPSTR NetbiosDomainName;
	LPSTR DnsDomainName;
	LPSTR DnsTreeName;
	LPSTR PackageName;
	ULONG Flags;
	DWORD CredTypeCount;
	LPDWORD CredTypes;
}
alias CREDENTIAL_TARGET_INFORMATIONA* PCREDENTIAL_TARGET_INFORMATIONA;

struct CREDENTIAL_TARGET_INFORMATIONW {
	LPWSTR TargetName;
	LPWSTR NetbiosServerName;
	LPWSTR DnsServerName;
	LPWSTR NetbiosDomainName;
	LPWSTR DnsDomainName;
	LPWSTR DnsTreeName;
	LPWSTR PackageName;
	ULONG Flags;
	DWORD CredTypeCount;
	LPDWORD CredTypes;
}
alias CREDENTIAL_TARGET_INFORMATIONW* PCREDENTIAL_TARGET_INFORMATIONW;

version(UNICODE){
	alias CREDENTIAL_TARGET_INFORMATIONW CREDENTIAL_TARGET_INFORMATION;
	alias PCREDENTIAL_TARGET_INFORMATIONW PCREDENTIAL_TARGET_INFORMATION;
}else{
	alias CREDENTIAL_TARGET_INFORMATIONA CREDENTIAL_TARGET_INFORMATION;
	alias PCREDENTIAL_TARGET_INFORMATIONA PCREDENTIAL_TARGET_INFORMATION;
}

enum CERT_HASH_LENGTH = 20;

struct CERT_CREDENTIAL_INFO {
	ULONG cbSize;
	UCHAR[CERT_HASH_LENGTH] rgbHashOfCert;
}
alias CERT_CREDENTIAL_INFO* PCERT_CREDENTIAL_INFO;

struct USERNAME_TARGET_CREDENTIAL_INFO {
	LPWSTR UserName;
}
alias USERNAME_TARGET_CREDENTIAL_INFO* PUSERNAME_TARGET_CREDENTIAL_INFO;

struct BINARY_BLOB_CREDENTIAL_INFO {
	ULONG cbBlob;
	LPBYTE pbBlob;
}
alias BINARY_BLOB_CREDENTIAL_INFO* PBINARY_BLOB_CREDENTIAL_INFO;

enum {
	CertCredential = 1,
	UsernameTargetCredential,
	BinaryBlobCredential,
	UsernameForPackedCredentials,
}
alias int CRED_MARSHAL_TYPE;
alias CRED_MARSHAL_TYPE* PCRED_MARSHAL_TYPE;

enum {
	CredUnprotected,
	CredUserProtection,
	CredTrustedProtection
}
alias int CRED_PROTECTION_TYPE;
alias CRED_PROTECTION_TYPE* PCRED_PROTECTION_TYPE;

enum {
	CRED_PACK_PROTECTED_CREDENTIALS = 0x1,
	CRED_PACK_WOW_BUFFER            = 0x2,
	CRED_PACK_GENERIC_CREDENTIALS   = 0x4,
}

/* moved to windef
struct CREDUI_INFOA {
	DWORD cbSize;
	HWND hwndParent;
	PCSTR pszMessageText;
	PCSTR pszCaptionText;
	HBITMAP hbmBanner;
}
alias CREDUI_INFOA* PCREDUI_INFOA;

struct CREDUI_INFOW {
	DWORD cbSize;
	HWND hwndParent;
	PCWSTR pszMessageText;
	PCWSTR pszCaptionText;
	HBITMAP hbmBanner;
}
alias CREDUI_INFOW* PCREDUI_INFOW;

version(UNICODE){
	alias CREDUI_INFOW CREDUI_INF;
	alias PCREDUI_INFOW PCREDUI_INFO;
}else{
	alias CREDUI_INFOA CREDUI_INFO;
	alias PCREDUI_INFOA PCREDUI_INFO;
}
*/

enum {
	CREDUI_MAX_MESSAGE_LENGTH            = 32767,
	CREDUI_MAX_CAPTION_LENGTH            = 128,
	CREDUI_MAX_GENERIC_TARGET_LENGTH     = CRED_MAX_GENERIC_TARGET_NAME_LENGTH,
	CREDUI_MAX_DOMAIN_TARGET_LENGTH      = CRED_MAX_DOMAIN_TARGET_NAME_LENGTH,
	CREDUI_MAX_USERNAME_LENGTH           = CRED_MAX_USERNAME_LENGTH,
	CREDUI_MAX_PASSWORD_LENGTH           = 512 / 2,
//	CREDUI_MAX_PACKED_CREDENTIALS_LENGTH = (MAXUSHORT / 2) - 2,
//	CREDUI_MAX_CREDENTIALS_BLOB_SIZE     = MAXUSHORT,
}

enum {
	CREDUI_FLAGS_INCORRECT_PASSWORD          = 0x00001,
	CREDUI_FLAGS_DO_NOT_PERSIST              = 0x00002,
	CREDUI_FLAGS_REQUEST_ADMINISTRATOR       = 0x00004,
	CREDUI_FLAGS_EXCLUDE_CERTIFICATES        = 0x00008,
	CREDUI_FLAGS_REQUIRE_CERTIFICATE         = 0x00010,
	CREDUI_FLAGS_SHOW_SAVE_CHECK_BOX         = 0x00040,
	CREDUI_FLAGS_ALWAYS_SHOW_UI              = 0x00080,
	CREDUI_FLAGS_REQUIRE_SMARTCARD           = 0x00100,
	CREDUI_FLAGS_PASSWORD_ONLY_OK            = 0x00200,
	CREDUI_FLAGS_VALIDATE_USERNAME           = 0x00400,
	CREDUI_FLAGS_COMPLETE_USERNAME           = 0x00800,
	CREDUI_FLAGS_PERSIST                     = 0x01000,
	CREDUI_FLAGS_SERVER_CREDENTIAL           = 0x04000,
	CREDUI_FLAGS_EXPECT_CONFIRMATION         = 0x20000,
	CREDUI_FLAGS_GENERIC_CREDENTIALS         = 0x40000,
	CREDUI_FLAGS_USERNAME_TARGET_CREDENTIALS = 0x80000,
	CREDUI_FLAGS_KEEP_USERNAME               = 0x100000,
	CREDUI_FLAGS_PROMPT_VALID                =   CREDUI_FLAGS_INCORRECT_PASSWORD |  CREDUI_FLAGS_DO_NOT_PERSIST |  CREDUI_FLAGS_REQUEST_ADMINISTRATOR |  CREDUI_FLAGS_EXCLUDE_CERTIFICATES |  CREDUI_FLAGS_REQUIRE_CERTIFICATE |  CREDUI_FLAGS_SHOW_SAVE_CHECK_BOX |  CREDUI_FLAGS_ALWAYS_SHOW_UI |  CREDUI_FLAGS_REQUIRE_SMARTCARD |  CREDUI_FLAGS_PASSWORD_ONLY_OK |  CREDUI_FLAGS_VALIDATE_USERNAME |  CREDUI_FLAGS_COMPLETE_USERNAME |  CREDUI_FLAGS_PERSIST |  CREDUI_FLAGS_SERVER_CREDENTIAL |  CREDUI_FLAGS_EXPECT_CONFIRMATION |  CREDUI_FLAGS_GENERIC_CREDENTIALS |  CREDUI_FLAGS_USERNAME_TARGET_CREDENTIALS |  CREDUI_FLAGS_KEEP_USERNAME ,
}

enum {
	CREDUIWIN_GENERIC                = 0x00000001,
	CREDUIWIN_CHECKBOX               = 0x00000002,
	CREDUIWIN_AUTHPACKAGE_ONLY       = 0x00000010,
	CREDUIWIN_IN_CRED_ONLY           = 0x00000020,
	CREDUIWIN_ENUMERATE_ADMINS       = 0x00000100,
	CREDUIWIN_ENUMERATE_CURRENT_USER = 0x00000200,
	CREDUIWIN_SECURE_PROMPT          = 0x00001000,
	CREDUIWIN_PACK_32_WOW            = 0x10000000,
	CREDUIWIN_VALID_FLAGS            = CREDUIWIN_GENERIC |  CREDUIWIN_CHECKBOX |  CREDUIWIN_AUTHPACKAGE_ONLY |  CREDUIWIN_IN_CRED_ONLY |  CREDUIWIN_ENUMERATE_ADMINS |  CREDUIWIN_ENUMERATE_CURRENT_USER |  CREDUIWIN_SECURE_PROMPT |  CREDUIWIN_PACK_32_WOW ,
}

enum CRED_PRESERVE_CREDENTIAL_BLOB = 0x1;

export extern(Windows) BOOL CredWriteW(PCREDENTIALW Credential, DWORD Flags);
export extern(Windows) BOOL CredWriteA(PCREDENTIALA Credential, DWORD Flags);
version(UNICODE)
	alias CredWriteW CredWrite;
else
	alias CredWriteA CredWrite;

export extern(Windows) BOOL CredReadW(LPCWSTR TargetName, DWORD Type, DWORD Flags, PCREDENTIALW* Credential);
export extern(Windows) BOOL CredReadA(LPCSTR TargetName, DWORD Type, DWORD Flags, PCREDENTIALA* Credential);
version(UNICODE)
	alias CredReadW CredRead;
else
	alias CredReadA CredRead;

enum CRED_ENUMERATE_ALL_CREDENTIALS = 0x1;

export extern(Windows) BOOL CredEnumerateW(LPCWSTR Filter, DWORD Flags, DWORD* Count, PCREDENTIALW** Credential);
export extern(Windows) BOOL CredEnumerateA(LPCSTR Filter, DWORD Flags, DWORD* Count, PCREDENTIALA** Credential);
version(UNICODE)
	alias CredEnumerateW CredEnumerate;
else
	alias CredEnumerateA CredEnumerate;

export extern(Windows) BOOL CredWriteDomainCredentialsW(PCREDENTIAL_TARGET_INFORMATIONW TargetInfo, PCREDENTIALW Credential, DWORD Flags);
export extern(Windows) BOOL CredWriteDomainCredentialsA(PCREDENTIAL_TARGET_INFORMATIONA TargetInfo, PCREDENTIALA Credential, DWORD Flags);
version(UNICODE)
	alias CredWriteDomainCredentialsW CredWriteDomainCredentials;
else
	alias CredWriteDomainCredentialsA CredWriteDomainCredentials;

enum CRED_CACHE_TARGET_INFORMATION = 0x1;

export extern(Windows) BOOL CredReadDomainCredentialsW(PCREDENTIAL_TARGET_INFORMATIONW TargetInfo, DWORD Flags, DWORD* Count, PCREDENTIALW** Credential);
export extern(Windows) BOOL CredReadDomainCredentialsA(PCREDENTIAL_TARGET_INFORMATIONA TargetInfo, DWORD Flags, DWORD* Count, PCREDENTIALA** Credential);
version(UNICODE)
	alias CredReadDomainCredentialsW CredReadDomainCredentials;
else
	alias CredReadDomainCredentialsA CredReadDomainCredentials;

export extern(Windows) BOOL CredDeleteW(LPCWSTR TargetName, DWORD Type, DWORD Flags);
export extern(Windows) BOOL CredDeleteA(LPCSTR TargetName, DWORD Type, DWORD Flags);
version(UNICODE)
	alias CredDeleteW CredDelete;
else
	alias CredDeleteA CredDelete;

export extern(Windows) BOOL CredRenameW(LPCWSTR OldTargetName, LPCWSTR NewTargetName, DWORD Type, DWORD Flags);
export extern(Windows) BOOL CredRenameA(LPCSTR OldTargetName, LPCSTR NewTargetName, DWORD Type, DWORD Flags);
version(UNICODE)
	alias CredRenameW CredRename;
else
	alias CredRenameA CredRename;

enum CRED_ALLOW_NAME_RESOLUTION = 0x1;

export extern(Windows) BOOL CredGetTargetInfoW(LPCWSTR TargetName, DWORD Flags, PCREDENTIAL_TARGET_INFORMATIONW* TargetInfo);
export extern(Windows) BOOL CredGetTargetInfoA(LPCSTR TargetName, DWORD Flags, PCREDENTIAL_TARGET_INFORMATIONA* TargetInfo);
version(UNICODE)
	alias CredGetTargetInfoW CredGetTargetInfo;
else
	alias CredGetTargetInfoA CredGetTargetInfo;

export extern(Windows) BOOL CredMarshalCredentialW(CRED_MARSHAL_TYPE CredType, PVOID Credential, LPWSTR* MarshaledCredential);
export extern(Windows) BOOL CredMarshalCredentialA(CRED_MARSHAL_TYPE CredType, PVOID Credential, LPSTR* MarshaledCredential);
version(UNICODE)
	alias CredMarshalCredentialW CredMarshalCredential;
else
	alias CredMarshalCredentialA CredMarshalCredential;

export extern(Windows) BOOL CredUnmarshalCredentialW(LPCWSTR MarshaledCredential, PCRED_MARSHAL_TYPE CredType, PVOID* Credential);
export extern(Windows) BOOL CredUnmarshalCredentialA(LPCSTR MarshaledCredential, PCRED_MARSHAL_TYPE CredType, PVOID* Credential);
version(UNICODE)
	alias CredUnmarshalCredentialW CredUnmarshalCredential;
else
	alias CredUnmarshalCredentialA CredUnmarshalCredential;

export extern(Windows) BOOL CredIsMarshaledCredentialW(LPCWSTR MarshaledCredential);
export extern(Windows) BOOL CredIsMarshaledCredentialA(LPCSTR MarshaledCredential);
version(UNICODE)
	alias CredIsMarshaledCredentialW CredIsMarshaledCredential;
else
	alias CredIsMarshaledCredentialA CredIsMarshaledCredential;

export extern(Windows) BOOL CredUnPackAuthenticationBufferW(DWORD dwFlags, PVOID pAuthBuffer, DWORD cbAuthBuffer, LPWSTR pszUserName, DWORD* pcchMaxUserName, LPWSTR pszDomainName, DWORD* pcchMaxDomainName, LPWSTR pszPassword, DWORD* pcchMaxPassword);
export extern(Windows) BOOL CredUnPackAuthenticationBufferA(DWORD dwFlags, PVOID pAuthBuffer, DWORD cbAuthBuffer, LPSTR pszUserName, DWORD* pcchlMaxUserName, LPSTR pszDomainName, DWORD* pcchMaxDomainName, LPSTR pszPassword, DWORD* pcchMaxPassword);
version(UNICODE)
	alias CredUnPackAuthenticationBufferW CredUnPackAuthenticationBuffer;
else
	alias CredUnPackAuthenticationBufferA CredUnPackAuthenticationBuffer;

export extern(Windows) BOOL CredPackAuthenticationBufferW(DWORD dwFlags, LPWSTR pszUserName, LPWSTR pszPassword, PBYTE pPackedCredentials, DWORD* pcbPackedCredentials);
export extern(Windows) BOOL CredPackAuthenticationBufferA(DWORD dwFlags, LPSTR pszUserName, LPSTR pszPassword, PBYTE pPackedCredentials, DWORD* pcbPackedCredentials);
version(UNICODE)
	alias CredPackAuthenticationBufferW CredPackAuthenticationBuffer;
else
	alias CredPackAuthenticationBufferA CredPackAuthenticationBuffer;

export extern(Windows) BOOL CredProtectW(BOOL fAsSelf, LPWSTR pszCredentials, DWORD cchCredentials, LPWSTR pszProtectedCredentials, DWORD* pcchMaxChars, CRED_PROTECTION_TYPE* ProtectionType);
export extern(Windows) BOOL CredProtectA(BOOL fAsSelf, LPSTR pszCredentials, DWORD cchCredentials, LPSTR pszProtectedCredentials, DWORD* pcchMaxChars, CRED_PROTECTION_TYPE* ProtectionType);
version(UNICODE)
	alias CredProtectW CredProtect;
else
	alias CredProtectA CredProtect;


export extern(Windows) BOOL CredUnprotectW(BOOL fAsSelf, LPWSTR pszProtectedCredentials, DWORD cchProtectedCredentials, LPWSTR pszCredentials, DWORD* pcchMaxChars);
export extern(Windows) BOOL CredUnprotectA(BOOL fAsSelf, LPSTR pszProtectedCredentials, DWORD cchProtectedCredentials, LPSTR pszCredentials, DWORD* pcchMaxChars);
version(UNICODE)
	alias CredUnprotectW CredUnprotect;
else
	alias CredUnprotectA CredUnprotect;

export extern(Windows) BOOL CredIsProtectedW(LPWSTR pszProtectedCredentials, CRED_PROTECTION_TYPE* pProtectionType);
export extern(Windows) BOOL CredIsProtectedA(LPSTR pszProtectedCredentials, CRED_PROTECTION_TYPE* pProtectionType);
version(UNICODE)
	alias CredIsProtectedW CredIsProtected;
else
	alias CredIsProtectedA CredIsProtected;

export extern(Windows) BOOL CredFindBestCredentialW(LPCWSTR TargetName, DWORD Type, DWORD Flags, PCREDENTIALW* Credential);
export extern(Windows) BOOL CredFindBestCredentialA(LPCSTR TargetName, DWORD Type, DWORD Flags, PCREDENTIALA* Credential);
version(UNICODE)
	alias CredFindBestCredentialW CredFindBestCredential;
else
	alias CredFindBestCredentialA CredFindBestCredential;

export extern(Windows) BOOL CredGetSessionTypes(DWORD MaximumPersistCount, LPDWORD MaximumPersist);
export extern(Windows) VOID CredFree(PVOID Buffer);

export extern(Windows) DWORD CredUIPromptForCredentialsW(PCREDUI_INFOW pUiInfo, PCWSTR pszTargetName, PCtxtHandle pContext, DWORD dwAuthError, PWSTR pszUserName, ULONG ulUserNameBufferSize, PWSTR pszPassword, ULONG ulPasswordBufferSize, BOOL* save, DWORD dwFlags);
export extern(Windows) DWORD CredUIPromptForCredentialsA(PCREDUI_INFOA pUiInfo, PCSTR pszTargetName, PCtxtHandle pContext, DWORD dwAuthError, PSTR pszUserName, ULONG ulUserNameBufferSize, PSTR pszPassword, ULONG ulPasswordBufferSize, BOOL* save, DWORD dwFlags);
version(UNICODE)
	alias CredUIPromptForCredentialsW CredUIPromptForCredentials;
else
	alias CredUIPromptForCredentialsA CredUIPromptForCredentials;

export extern(Windows) DWORD CredUIPromptForWindowsCredentialsW(PCREDUI_INFOW pUiInfo, DWORD dwAuthError, ULONG* pulAuthPackage, LPCVOID pvInAuthBuffer, ULONG ulInAuthBufferSize, LPVOID* ppvOutAuthBuffer, ULONG* pulOutAuthBufferSize, BOOL* pfSave, DWORD dwFlags);
export extern(Windows) DWORD CredUIPromptForWindowsCredentialsA(PCREDUI_INFOA pUiInfo, DWORD dwAuthError, ULONG* pulAuthPackage, LPCVOID pvInAuthBuffer, ULONG ulInAuthBufferSize, LPVOID* ppvOutAuthBuffer, ULONG* pulOutAuthBufferSize, BOOL* pfSave, DWORD dwFlags);
version(UNICODE)
	alias CredUIPromptForWindowsCredentialsW CredUIPromptForWindowsCredentials;
else
	alias CredUIPromptForWindowsCredentialsA CredUIPromptForWindowsCredentials;

export extern(Windows) DWORD CredUIParseUserNameW(const(WCHAR)* UserName, WCHAR* user, ULONG userBufferSize, WCHAR* domain, ULONG domainBufferSize);
export extern(Windows) DWORD CredUIParseUserNameA(const(CHAR)* userName, CHAR* user, ULONG userBufferSize, CHAR* domain, ULONG domainBufferSize);
version(UNICODE)
	alias CredUIParseUserNameW CredUIParseUserName;
else
	alias CredUIParseUserNameA CredUIParseUserName;

export extern(Windows) DWORD CredUICmdLinePromptForCredentialsW(PCWSTR pszTargetName, PCtxtHandle pContext, DWORD dwAuthError, PWSTR UserName, ULONG ulUserBufferSize, PWSTR pszPassword, ULONG ulPasswordBufferSize, PBOOL pfSave, DWORD dwFlags);
export extern(Windows) DWORD CredUICmdLinePromptForCredentialsA(PCSTR pszTargetName, PCtxtHandle pContext, DWORD dwAuthError, PSTR UserName, ULONG ulUserBufferSize, PSTR pszPassword, ULONG ulPasswordBufferSize, PBOOL pfSave, DWORD dwFlags);
version(UNICODE)
	alias CredUICmdLinePromptForCredentialsW CredUICmdLinePromptForCredentials;
else
	alias CredUICmdLinePromptForCredentialsA CredUICmdLinePromptForCredentials;

export extern(Windows) DWORD CredUIConfirmCredentialsW(PCWSTR pszTargetName, BOOL bConfirm);
export extern(Windows) DWORD CredUIConfirmCredentialsA(PCSTR pszTargetName, BOOL bConfirm);

version(UNICODE)
	alias CredUIConfirmCredentialsW CredUIConfirmCredentials;
else
	alias CredUIConfirmCredentialsA CredUIConfirmCredentials;

export extern(Windows) DWORD CredUIStoreSSOCredW(PCWSTR pszRealm, PCWSTR pszUsername, PCWSTR pszPassword, BOOL bPersist);
export extern(Windows) DWORD CredUIReadSSOCredW(PCWSTR pszRealm, PWSTR* ppszUsername);

}// extern(C)
