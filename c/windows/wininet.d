/** wininet.d

Converted from 'wininet.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.wininet;


import c.windows.windef;
import c.windows.winbase;
//import c.windows.winineti;


enum { // from winineti.d
	INTERNET_FLAG_BGUPDATE        = 0x00000008,
	INTERNET_FLAG_FTP_FOLDER_VIEW = 0x00000004,
}

extern(C){

enum HINTERNET : LPVOID {init = (LPVOID).init}
alias HINTERNET* LPHINTERNET;

alias WORD INTERNET_PORT;
alias INTERNET_PORT* LPINTERNET_PORT;

enum {
	FTP_TRANSFER_TYPE_UNKNOWN = 0x00000000,
	FTP_TRANSFER_TYPE_ASCII   = 0x00000001,
	FTP_TRANSFER_TYPE_BINARY  = 0x00000002,
	FTP_TRANSFER_TYPE_MASK    = FTP_TRANSFER_TYPE_ASCII | FTP_TRANSFER_TYPE_BINARY,
}

enum {
	AUTH_FLAG_DISABLE_NEGOTIATE            = 0x00000001,
	AUTH_FLAG_ENABLE_NEGOTIATE             = 0x00000002,
	AUTH_FLAG_DISABLE_BASIC_CLEARCHANNEL   = 0x00000004,
	SECURITY_FLAG_SECURE                   = 0x00000001,
	SECURITY_FLAG_STRENGTH_WEAK            = 0x10000000,
	SECURITY_FLAG_STRENGTH_MEDIUM          = 0x40000000,
	SECURITY_FLAG_STRENGTH_STRONG          = 0x20000000,
	SECURITY_FLAG_UNKNOWNBIT               = 0x80000000,
	SECURITY_FLAG_FORTEZZA                 = 0x08000000,
	SECURITY_FLAG_NORMALBITNESS            = SECURITY_FLAG_STRENGTH_WEAK,
	SECURITY_FLAG_SSL                      = 0x00000002,
	SECURITY_FLAG_SSL3                     = 0x00000004,
	SECURITY_FLAG_PCT                      = 0x00000008,
	SECURITY_FLAG_PCT4                     = 0x00000010,
	SECURITY_FLAG_IETFSSL4                 = 0x00000020,
	SECURITY_FLAG_40BIT                    = SECURITY_FLAG_STRENGTH_WEAK,
	SECURITY_FLAG_128BIT                   = SECURITY_FLAG_STRENGTH_STRONG,
	SECURITY_FLAG_56BIT                    = SECURITY_FLAG_STRENGTH_MEDIUM,
	SECURITY_FLAG_IGNORE_REVOCATION        = 0x00000080,
	SECURITY_FLAG_IGNORE_UNKNOWN_CA        = 0x00000100,
	SECURITY_FLAG_IGNORE_WRONG_USAGE       = 0x00000200,
}

enum {
	INTERNET_INVALID_PORT_NUMBER                          = 0,
	INTERNET_DEFAULT_FTP_PORT                             = 21,
	INTERNET_DEFAULT_GOPHER_PORT                          = 70,
	INTERNET_DEFAULT_HTTP_PORT                            = 80,
	INTERNET_DEFAULT_HTTPS_PORT                           = 443,
	INTERNET_DEFAULT_SOCKS_PORT                           = 1080,
	INTERNET_MAX_HOST_NAME_LENGTH                         = 256,
	INTERNET_MAX_USER_NAME_LENGTH                         = 128,
	INTERNET_MAX_PASSWORD_LENGTH                          = 128,
	INTERNET_MAX_PORT_NUMBER_LENGTH                       = 5,
	INTERNET_MAX_PORT_NUMBER_VALUE                        = 65535,
	INTERNET_MAX_PATH_LENGTH                              = 2048,
	INTERNET_MAX_SCHEME_LENGTH                            = 32,
	INTERNET_MAX_URL_LENGTH                               = INTERNET_MAX_SCHEME_LENGTH  + 3  + INTERNET_MAX_PATH_LENGTH,
	INTERNET_KEEP_ALIVE_UNKNOWN                           = (DWORD)-1,
	INTERNET_KEEP_ALIVE_ENABLED                           = 1,
	INTERNET_KEEP_ALIVE_DISABLED                          = 0,
	INTERNET_REQFLAG_FROM_CACHE                           = 0x00000001,
	INTERNET_REQFLAG_ASYNC                                = 0x00000002,
	INTERNET_REQFLAG_VIA_PROXY                            = 0x00000004,
	INTERNET_REQFLAG_NO_HEADERS                           = 0x00000008,
	INTERNET_REQFLAG_PASSIVE                              = 0x00000010,
	INTERNET_REQFLAG_CACHE_WRITE_DISABLED                 = 0x00000040,
	INTERNET_REQFLAG_NET_TIMEOUT                          = 0x00000080,
	INTERNET_FLAG_IDN_DIRECT                              = 0x00000001,
	INTERNET_FLAG_IDN_PROXY                               = 0x00000002,
	INTERNET_FLAG_RELOAD                                  = 0x80000000,
	INTERNET_FLAG_RAW_DATA                                = 0x40000000,
	INTERNET_FLAG_EXISTING_CONNECT                        = 0x20000000,
	INTERNET_FLAG_ASYNC                                   = 0x10000000,
	INTERNET_FLAG_PASSIVE                                 = 0x08000000,
	INTERNET_FLAG_NO_CACHE_WRITE                          = 0x04000000,
	INTERNET_FLAG_DONT_CACHE                              = INTERNET_FLAG_NO_CACHE_WRITE,
	INTERNET_FLAG_MAKE_PERSISTENT                         = 0x02000000,
	INTERNET_FLAG_FROM_CACHE                              = 0x01000000,
	INTERNET_FLAG_OFFLINE                                 = INTERNET_FLAG_FROM_CACHE,
	INTERNET_FLAG_SECURE                                  = 0x00800000,
	INTERNET_FLAG_KEEP_CONNECTION                         = 0x00400000,
	INTERNET_FLAG_NO_AUTO_REDIRECT                        = 0x00200000,
	INTERNET_FLAG_READ_PREFETCH                           = 0x00100000,
	INTERNET_FLAG_NO_COOKIES                              = 0x00080000,
	INTERNET_FLAG_NO_AUTH                                 = 0x00040000,
	INTERNET_FLAG_RESTRICTED_ZONE                         = 0x00020000,
	INTERNET_FLAG_CACHE_IF_NET_FAIL                       = 0x00010000,
	INTERNET_FLAG_IGNORE_REDIRECT_TO_HTTP                 = 0x00008000,
	INTERNET_FLAG_IGNORE_REDIRECT_TO_HTTPS                = 0x00004000,
	INTERNET_FLAG_IGNORE_CERT_DATE_INVALID                = 0x00002000,
	INTERNET_FLAG_IGNORE_CERT_CN_INVALID                  = 0x00001000,
	INTERNET_FLAG_RESYNCHRONIZE                           = 0x00000800,
	INTERNET_FLAG_HYPERLINK                               = 0x00000400,
	INTERNET_FLAG_NO_UI                                   = 0x00000200,
	INTERNET_FLAG_PRAGMA_NOCACHE                          = 0x00000100,
	INTERNET_FLAG_CACHE_ASYNC                             = 0x00000080,
	INTERNET_FLAG_FORMS_SUBMIT                            = 0x00000040,
	INTERNET_FLAG_FWD_BACK                                = 0x00000020,
	INTERNET_FLAG_NEED_FILE                               = 0x00000010,
	INTERNET_FLAG_MUST_CACHE_REQUEST                      = INTERNET_FLAG_NEED_FILE,
	INTERNET_FLAG_TRANSFER_ASCII                          = FTP_TRANSFER_TYPE_ASCII,
	INTERNET_FLAG_TRANSFER_BINARY                         = FTP_TRANSFER_TYPE_BINARY,
	SECURITY_INTERNET_MASK                                = INTERNET_FLAG_IGNORE_CERT_CN_INVALID |  INTERNET_FLAG_IGNORE_CERT_DATE_INVALID |  INTERNET_FLAG_IGNORE_REDIRECT_TO_HTTPS |  INTERNET_FLAG_IGNORE_REDIRECT_TO_HTTP ,
	SECURITY_IGNORE_ERROR_MASK                            = INTERNET_FLAG_IGNORE_CERT_CN_INVALID |  INTERNET_FLAG_IGNORE_CERT_DATE_INVALID |  SECURITY_FLAG_IGNORE_UNKNOWN_CA |  SECURITY_FLAG_IGNORE_REVOCATION,
	INTERNET_FLAGS_MASK                                   = INTERNET_FLAG_RELOAD  | INTERNET_FLAG_RAW_DATA  | INTERNET_FLAG_EXISTING_CONNECT  | INTERNET_FLAG_ASYNC  | INTERNET_FLAG_PASSIVE  | INTERNET_FLAG_NO_CACHE_WRITE  | INTERNET_FLAG_MAKE_PERSISTENT  | INTERNET_FLAG_FROM_CACHE  | INTERNET_FLAG_SECURE  | INTERNET_FLAG_KEEP_CONNECTION  | INTERNET_FLAG_NO_AUTO_REDIRECT  | INTERNET_FLAG_READ_PREFETCH  | INTERNET_FLAG_NO_COOKIES  | INTERNET_FLAG_NO_AUTH  | INTERNET_FLAG_CACHE_IF_NET_FAIL  | SECURITY_INTERNET_MASK  | INTERNET_FLAG_RESYNCHRONIZE  | INTERNET_FLAG_HYPERLINK  | INTERNET_FLAG_NO_UI  | INTERNET_FLAG_PRAGMA_NOCACHE  | INTERNET_FLAG_CACHE_ASYNC  | INTERNET_FLAG_FORMS_SUBMIT  | INTERNET_FLAG_NEED_FILE  | INTERNET_FLAG_RESTRICTED_ZONE  | INTERNET_FLAG_TRANSFER_BINARY  | INTERNET_FLAG_TRANSFER_ASCII  | INTERNET_FLAG_FWD_BACK  | INTERNET_FLAG_BGUPDATE,
	INTERNET_ERROR_MASK_INSERT_CDROM                      = 0x1,
	INTERNET_ERROR_MASK_COMBINED_SEC_CERT                 = 0x2,
	INTERNET_ERROR_MASK_NEED_MSN_SSPI_PKG                 = 0X4,
	INTERNET_ERROR_MASK_LOGIN_FAILURE_DISPLAY_ENTITY_BODY = 0x8,
	INTERNET_OPTIONS_MASK                                 = ~INTERNET_FLAGS_MASK,
	WININET_API_FLAG_ASYNC                                = 0x00000001,
	WININET_API_FLAG_SYNC                                 = 0x00000004,
	WININET_API_FLAG_USE_CONTEXT                          = 0x00000008,
	INTERNET_NO_CALLBACK                                  = 0,
}
enum { // from winineti.d
	INTERNET_FLAGS_MASK_INTERNAL  = INTERNET_FLAGS_MASK |  INTERNET_FLAG_FTP_FOLDER_VIEW,
}
enum {
	SECURITY_FLAG_IGNORE_CERT_CN_INVALID   = INTERNET_FLAG_IGNORE_CERT_CN_INVALID,
	SECURITY_FLAG_IGNORE_CERT_DATE_INVALID = INTERNET_FLAG_IGNORE_CERT_DATE_INVALID,
	SECURITY_FLAG_IGNORE_REDIRECT_TO_HTTPS = INTERNET_FLAG_IGNORE_REDIRECT_TO_HTTPS,
	SECURITY_FLAG_IGNORE_REDIRECT_TO_HTTP  = INTERNET_FLAG_IGNORE_REDIRECT_TO_HTTP,
	SECURITY_SET_MASK                      = SECURITY_FLAG_IGNORE_REVOCATION | SECURITY_FLAG_IGNORE_UNKNOWN_CA | SECURITY_FLAG_IGNORE_CERT_CN_INVALID | SECURITY_FLAG_IGNORE_CERT_DATE_INVALID | SECURITY_FLAG_IGNORE_WRONG_USAGE,
}

enum {
	INTERNET_SCHEME_PARTIAL = -2,
	INTERNET_SCHEME_UNKNOWN = -1,
	INTERNET_SCHEME_DEFAULT = 0,
	INTERNET_SCHEME_FTP,
	INTERNET_SCHEME_GOPHER,
	INTERNET_SCHEME_HTTP,
	INTERNET_SCHEME_HTTPS,
	INTERNET_SCHEME_FILE,
	INTERNET_SCHEME_NEWS,
	INTERNET_SCHEME_MAILTO,
	INTERNET_SCHEME_SOCKS,
	INTERNET_SCHEME_JAVASCRIPT,
	INTERNET_SCHEME_VBSCRIPT,
	INTERNET_SCHEME_RES,
	INTERNET_SCHEME_FIRST = INTERNET_SCHEME_FTP,
	INTERNET_SCHEME_LAST = INTERNET_SCHEME_RES
}
alias int INTERNET_SCHEME;
alias INTERNET_SCHEME* LPINTERNET_SCHEME;

version(Win64){
	align(8)
	struct INTERNET_ASYNC_RESULT {
		DWORD_PTR dwResult;
		DWORD dwError;
	}
}else{
	align(4)
	struct INTERNET_ASYNC_RESULT {
		DWORD_PTR dwResult;
		DWORD dwError;
	}
}
alias INTERNET_ASYNC_RESULT* LPINTERNET_ASYNC_RESULT;

version(Win64){
	align(8)
	struct INTERNET_DIAGNOSTIC_SOCKET_INFO {
		DWORD_PTR Socket;
		DWORD SourcePort;
		DWORD DestPort;
		DWORD Flags;
	}
}else{
	align(4)
	struct INTERNET_DIAGNOSTIC_SOCKET_INFO {
		DWORD_PTR Socket;
		DWORD SourcePort;
		DWORD DestPort;
		DWORD Flags;
	}
}
alias INTERNET_DIAGNOSTIC_SOCKET_INFO* LPINTERNET_DIAGNOSTIC_SOCKET_INFO;

enum {
	IDSI_FLAG_KEEP_ALIVE = 0x00000001,
	IDSI_FLAG_SECURE     = 0x00000002,
	IDSI_FLAG_PROXY      = 0x00000004,
	IDSI_FLAG_TUNNEL     = 0x00000008,
}

version(Win64){
	align(8)
	struct INTERNET_PROXY_INFO {
		DWORD dwAccessType;
		LPCTSTR lpszProxy;
		LPCTSTR lpszProxyBypass;
	}
}else{
	align(4)
	struct INTERNET_PROXY_INFO {
		DWORD dwAccessType;
		LPCTSTR lpszProxy;
		LPCTSTR lpszProxyBypass;
	}
}
alias INTERNET_PROXY_INFO* LPINTERNET_PROXY_INFO;

version(Win64){
	align(8)
	struct INTERNET_PER_CONN_OPTIONA {
		DWORD dwOption;
		union {
			DWORD dwValue;
			LPSTR pszValue;
			FILETIME ftValue;
		}
	}
}else{
	align(4)
	struct INTERNET_PER_CONN_OPTIONA {
		DWORD dwOption;
		union {
			DWORD dwValue;
			LPSTR pszValue;
			FILETIME ftValue;
		}
	}
}
alias INTERNET_PER_CONN_OPTIONA* LPINTERNET_PER_CONN_OPTIONA;

version(Win64){
	align(8)
	struct INTERNET_PER_CONN_OPTIONW {
		DWORD dwOption;
		union {
			DWORD dwValue;
			LPWSTR pszValue;
			FILETIME ftValue;
		}
	}
}else{
	align(4)
	struct INTERNET_PER_CONN_OPTIONW {
		DWORD dwOption;
		union {
			DWORD dwValue;
			LPWSTR pszValue;
			FILETIME ftValue;
		}
	}
}
alias INTERNET_PER_CONN_OPTIONW* LPINTERNET_PER_CONN_OPTIONW;

version(UNICODE){
	alias INTERNET_PER_CONN_OPTIONW INTERNET_PER_CONN_OPTION;
	alias LPINTERNET_PER_CONN_OPTIONW LPINTERNET_PER_CONN_OPTION;
}else{
	alias INTERNET_PER_CONN_OPTIONA INTERNET_PER_CONN_OPTION;
	alias LPINTERNET_PER_CONN_OPTIONA LPINTERNET_PER_CONN_OPTION;
}

version(Win64){
	align(8)
	struct INTERNET_PER_CONN_OPTION_LISTA {
		DWORD dwSize;
		LPSTR pszConnection;
		DWORD dwOptionCount;
		DWORD dwOptionError;
		LPINTERNET_PER_CONN_OPTIONA pOptions;
	}
}else{
	align(4)
	struct INTERNET_PER_CONN_OPTION_LISTA {
		DWORD dwSize;
		LPSTR pszConnection;
		DWORD dwOptionCount;
		DWORD dwOptionError;
		LPINTERNET_PER_CONN_OPTIONA pOptions;
	}
}
alias INTERNET_PER_CONN_OPTION_LISTA* LPINTERNET_PER_CONN_OPTION_LISTA;

version(Win64){
	align(8)
	struct INTERNET_PER_CONN_OPTION_LISTW {
		DWORD dwSize;
		LPWSTR pszConnection;
		DWORD dwOptionCount;
		DWORD dwOptionError;
		LPINTERNET_PER_CONN_OPTIONW pOptions;
	}
}else{
	align(4)
	struct INTERNET_PER_CONN_OPTION_LISTW {
		DWORD dwSize;
		LPWSTR pszConnection;
		DWORD dwOptionCount;
		DWORD dwOptionError;
		LPINTERNET_PER_CONN_OPTIONW pOptions;
	}
}
alias INTERNET_PER_CONN_OPTION_LISTW* LPINTERNET_PER_CONN_OPTION_LISTW;

version(UNICODE){
	alias INTERNET_PER_CONN_OPTION_LISTW INTERNET_PER_CONN_OPTION_LIST;
	alias LPINTERNET_PER_CONN_OPTION_LISTW LPINTERNET_PER_CONN_OPTION_LIST;
}else{
	alias INTERNET_PER_CONN_OPTION_LISTA INTERNET_PER_CONN_OPTION_LIST;
	alias LPINTERNET_PER_CONN_OPTION_LISTA LPINTERNET_PER_CONN_OPTION_LIST;
}

enum {
	INTERNET_PER_CONN_FLAGS                        = 1,
	INTERNET_PER_CONN_PROXY_SERVER                 = 2,
	INTERNET_PER_CONN_PROXY_BYPASS                 = 3,
	INTERNET_PER_CONN_AUTOCONFIG_URL               = 4,
	INTERNET_PER_CONN_AUTODISCOVERY_FLAGS          = 5,
	INTERNET_PER_CONN_AUTOCONFIG_SECONDARY_URL     = 6,
	INTERNET_PER_CONN_AUTOCONFIG_RELOAD_DELAY_MINS = 7,
	INTERNET_PER_CONN_AUTOCONFIG_LAST_DETECT_TIME  = 8,
	INTERNET_PER_CONN_AUTOCONFIG_LAST_DETECT_URL   = 9,
	INTERNET_PER_CONN_FLAGS_UI                     = 10,
}
enum {
	PROXY_TYPE_DIRECT         = 0x00000001,
	PROXY_TYPE_PROXY          = 0x00000002,
	PROXY_TYPE_AUTO_PROXY_URL = 0x00000004,
	PROXY_TYPE_AUTO_DETECT    = 0x00000008,
}
enum {
	AUTO_PROXY_FLAG_USER_SET                = 0x00000001,
	AUTO_PROXY_FLAG_ALWAYS_DETECT           = 0x00000002,
	AUTO_PROXY_FLAG_DETECTION_RUN           = 0x00000004,
	AUTO_PROXY_FLAG_MIGRATED                = 0x00000008,
	AUTO_PROXY_FLAG_DONT_CACHE_PROXY_RESULT = 0x00000010,
	AUTO_PROXY_FLAG_CACHE_INIT_RUN          = 0x00000020,
	AUTO_PROXY_FLAG_DETECTION_SUSPECT       = 0x00000040,
}

version(Win64){
	align(8)
	struct INTERNET_VERSION_INFO {
		DWORD dwMajorVersion;
		DWORD dwMinorVersion;
	}
}else{
	align(4)
	struct INTERNET_VERSION_INFO {
		DWORD dwMajorVersion;
		DWORD dwMinorVersion;
	}
}
alias INTERNET_VERSION_INFO* LPINTERNET_VERSION_INFO;

version(Win64){
	align(8)
	struct HTTP_VERSION_INFO {
		DWORD dwMajorVersion;
		DWORD dwMinorVersion;
	}
}else{
	align(4)
	struct HTTP_VERSION_INFO {
		DWORD dwMajorVersion;
		DWORD dwMinorVersion;
	}
}
alias HTTP_VERSION_INFO* LPHTTP_VERSION_INFO;

version(Win64){
	align(8)
	struct INTERNET_CONNECTED_INFO {
		DWORD dwConnectedState;
		DWORD dwFlags;
	}
}else{
	align(4)
	struct INTERNET_CONNECTED_INFO {
		DWORD dwConnectedState;
		DWORD dwFlags;
	}
}
alias INTERNET_CONNECTED_INFO* LPINTERNET_CONNECTED_INFO;

enum ISO_FORCE_DISCONNECTED = 0x00000001;

version(Win64){
	align(8)
	struct URL_COMPONENTSA {
		DWORD dwStructSize;
		LPSTR lpszScheme;
		DWORD dwSchemeLength;
		INTERNET_SCHEME nScheme;
		LPSTR lpszHostName;
		DWORD dwHostNameLength;
		INTERNET_PORT nPort;
		LPSTR lpszUserName;
		DWORD dwUserNameLength;
		LPSTR lpszPassword;
		DWORD dwPasswordLength;
		LPSTR lpszUrlPath;
		DWORD dwUrlPathLength;
		LPSTR lpszExtraInfo;
		DWORD dwExtraInfoLength;
	}
}else{
	align(4)
	struct URL_COMPONENTSA {
		DWORD dwStructSize;
		LPSTR lpszScheme;
		DWORD dwSchemeLength;
		INTERNET_SCHEME nScheme;
		LPSTR lpszHostName;
		DWORD dwHostNameLength;
		INTERNET_PORT nPort;
		LPSTR lpszUserName;
		DWORD dwUserNameLength;
		LPSTR lpszPassword;
		DWORD dwPasswordLength;
		LPSTR lpszUrlPath;
		DWORD dwUrlPathLength;
		LPSTR lpszExtraInfo;
		DWORD dwExtraInfoLength;
	}
}
alias URL_COMPONENTSA* LPURL_COMPONENTSA;

version(Win64){
	align(8)
	struct URL_COMPONENTSW {
		DWORD dwStructSize;
		LPWSTR lpszScheme;
		DWORD dwSchemeLength;
		INTERNET_SCHEME nScheme;
		LPWSTR lpszHostName;
		DWORD dwHostNameLength;
		INTERNET_PORT nPort;
		LPWSTR lpszUserName;
		DWORD dwUserNameLength;
		LPWSTR lpszPassword;
		DWORD dwPasswordLength;
		LPWSTR lpszUrlPath;
		DWORD dwUrlPathLength;
		LPWSTR lpszExtraInfo;
		DWORD dwExtraInfoLength;
	}
}else{
	align(4)
	struct URL_COMPONENTSW {
		DWORD dwStructSize;
		LPWSTR lpszScheme;
		DWORD dwSchemeLength;
		INTERNET_SCHEME nScheme;
		LPWSTR lpszHostName;
		DWORD dwHostNameLength;
		INTERNET_PORT nPort;
		LPWSTR lpszUserName;
		DWORD dwUserNameLength;
		LPWSTR lpszPassword;
		DWORD dwPasswordLength;
		LPWSTR lpszUrlPath;
		DWORD dwUrlPathLength;
		LPWSTR lpszExtraInfo;
		DWORD dwExtraInfoLength;
	}
}
alias URL_COMPONENTSW* LPURL_COMPONENTSW;
version(UNICODE){
	alias URL_COMPONENTSW URL_COMPONENTS;
	alias LPURL_COMPONENTSW LPURL_COMPONENTS;
}else{
	alias URL_COMPONENTSA URL_COMPONENTS;
	alias LPURL_COMPONENTSA LPURL_COMPONENTS;
}

version(Win64){
	align(8)
	struct INTERNET_CERTIFICATE_INFO {
		FILETIME ftExpiry;
		FILETIME ftStart;
		LPTSTR lpszSubjectInfo;
		LPTSTR lpszIssuerInfo;
		LPTSTR lpszProtocolName;
		LPTSTR lpszSignatureAlgName;
		LPTSTR lpszEncryptionAlgName;
		DWORD dwKeySize;
	}
}else{
	align(4)
	struct INTERNET_CERTIFICATE_INFO {
		FILETIME ftExpiry;
		FILETIME ftStart;
		LPTSTR lpszSubjectInfo;
		LPTSTR lpszIssuerInfo;
		LPTSTR lpszProtocolName;
		LPTSTR lpszSignatureAlgName;
		LPTSTR lpszEncryptionAlgName;
		DWORD dwKeySize;
	}
}
alias INTERNET_CERTIFICATE_INFO* LPINTERNET_CERTIFICATE_INFO;

version(Win64){
	align(8)
	struct INTERNET_BUFFERSA {
		DWORD dwStructSize;
		INTERNET_BUFFERSA* Next;
		LPCSTR lpcszHeader;
		DWORD dwHeadersLength;
		DWORD dwHeadersTotal;
		LPVOID lpvBuffer;
		DWORD dwBufferLength;
		DWORD dwBufferTotal;
		DWORD dwOffsetLow;
		DWORD dwOffsetHigh;
	}
}else{
	align(4)
	struct INTERNET_BUFFERSA {
		DWORD dwStructSize;
		INTERNET_BUFFERSA* Next;
		LPCSTR lpcszHeader;
		DWORD dwHeadersLength;
		DWORD dwHeadersTotal;
		LPVOID lpvBuffer;
		DWORD dwBufferLength;
		DWORD dwBufferTotal;
		DWORD dwOffsetLow;
		DWORD dwOffsetHigh;
	}
}
alias INTERNET_BUFFERSA* LPINTERNET_BUFFERSA;

version(Win64){
	align(8)
	struct INTERNET_BUFFERSW {
		DWORD dwStructSize;
		INTERNET_BUFFERSW* Next;
		LPCWSTR lpcszHeader;
		DWORD dwHeadersLength;
		DWORD dwHeadersTotal;
		LPVOID lpvBuffer;
		DWORD dwBufferLength;
		DWORD dwBufferTotal;
		DWORD dwOffsetLow;
		DWORD dwOffsetHigh;
	}
}else{
	align(4)
	struct INTERNET_BUFFERSW {
		DWORD dwStructSize;
		INTERNET_BUFFERSW* Next;
		LPCWSTR lpcszHeader;
		DWORD dwHeadersLength;
		DWORD dwHeadersTotal;
		LPVOID lpvBuffer;
		DWORD dwBufferLength;
		DWORD dwBufferTotal;
		DWORD dwOffsetLow;
		DWORD dwOffsetHigh;
	}
}
alias INTERNET_BUFFERSW* LPINTERNET_BUFFERSW;
version(UNICODE){
	alias INTERNET_BUFFERSW INTERNET_BUFFERS;
	alias LPINTERNET_BUFFERSW LPINTERNET_BUFFERS;
}else{
	alias INTERNET_BUFFERSA INTERNET_BUFFERS;
	alias LPINTERNET_BUFFERSA LPINTERNET_BUFFERS;
}

export extern(Windows) BOOL InternetTimeFromSystemTimeA(const(SYSTEMTIME)* pst, DWORD dwRFC, LPSTR lpszTime, DWORD cbTime);
export extern(Windows) BOOL InternetTimeFromSystemTimeW(const(SYSTEMTIME)* pst, DWORD dwRFC, LPWSTR lpszTime, DWORD cbTime);
version(UNICODE)
	alias InternetTimeFromSystemTimeW InternetTimeFromSystemTime;
else
	alias InternetTimeFromSystemTimeA InternetTimeFromSystemTime;

enum {
	INTERNET_RFC1123_FORMAT  = 0,
	INTERNET_RFC1123_BUFSIZE = 30,
}

export extern(Windows) BOOL InternetTimeToSystemTimeA(LPCSTR lpszTime, SYSTEMTIME* pst, DWORD dwReserved);
export extern(Windows) BOOL InternetTimeToSystemTimeW(LPCWSTR lpszTime, SYSTEMTIME* pst, DWORD dwReserved);
version(UNICODE)
	alias InternetTimeToSystemTimeW InternetTimeToSystemTime;
else
	alias InternetTimeToSystemTimeA InternetTimeToSystemTime;

export extern(Windows) BOOL InternetCrackUrlA(LPCSTR lpszUrl, DWORD dwUrlLength, DWORD dwFlags, LPURL_COMPONENTSA lpUrlComponents);
export extern(Windows) BOOL InternetCrackUrlW(LPCWSTR lpszUrl, DWORD dwUrlLength, DWORD dwFlags, LPURL_COMPONENTSW lpUrlComponents);
version(UNICODE)
	alias InternetCrackUrlW InternetCrackUrl;
else
	alias InternetCrackUrlA InternetCrackUrl;

export extern(Windows) BOOL InternetCreateUrlA(LPURL_COMPONENTSA lpUrlComponents, DWORD dwFlags, LPSTR lpszUrl, LPDWORD lpdwUrlLength);
export extern(Windows) BOOL InternetCreateUrlW(LPURL_COMPONENTSW lpUrlComponents, DWORD dwFlags, LPWSTR lpszUrl, LPDWORD lpdwUrlLength);
version(UNICODE)
	alias InternetCreateUrlW InternetCreateUrl;
else
	alias InternetCreateUrlA InternetCreateUrl;

export extern(Windows) BOOL InternetCanonicalizeUrlA(LPCSTR lpszUrl, LPSTR lpszBuffer, LPDWORD lpdwBufferLength, DWORD dwFlags);
export extern(Windows) BOOL InternetCanonicalizeUrlW(LPCWSTR lpszUrl, LPWSTR lpszBuffer, LPDWORD lpdwBufferLength, DWORD dwFlags);
version(UNICODE)
	alias InternetCanonicalizeUrlW InternetCanonicalizeUrl;
else
	alias InternetCanonicalizeUrlA InternetCanonicalizeUrl;

export extern(Windows) BOOL InternetCombineUrlA(LPCSTR lpszBaseUrl, LPCSTR lpszRelativeUrl, LPSTR lpszBuffer, LPDWORD lpdwBufferLength, DWORD dwFlags);
export extern(Windows) BOOL InternetCombineUrlW(LPCWSTR lpszBaseUrl, LPCWSTR lpszRelativeUrl, LPWSTR lpszBuffer, LPDWORD lpdwBufferLength, DWORD dwFlags);
version(UNICODE)
	alias InternetCombineUrlW InternetCombineUrl;
else
	alias InternetCombineUrlA InternetCombineUrl;

enum {
	ICU_ESCAPE             = 0x80000000,
	ICU_USERNAME           = 0x40000000,
	ICU_NO_ENCODE          = 0x20000000,
	ICU_DECODE             = 0x10000000,
	ICU_NO_META            = 0x08000000,
	ICU_ENCODE_SPACES_ONLY = 0x04000000,
	ICU_BROWSER_MODE       = 0x02000000,
	ICU_ENCODE_PERCENT     = 0x00001000,
}

export extern(Windows) HINTERNET InternetOpenA(LPCSTR lpszAgent, DWORD dwAccessType, LPCSTR lpszProxy, LPCSTR lpszProxyBypass, DWORD dwFlags);
export extern(Windows) HINTERNET InternetOpenW(LPCWSTR lpszAgent, DWORD dwAccessType, LPCWSTR lpszProxy, LPCWSTR lpszProxyBypass, DWORD dwFlags);
version(UNICODE)
	alias InternetOpenW InternetOpen;
else
	alias InternetOpenA InternetOpen;

enum {
	INTERNET_OPEN_TYPE_PRECONFIG                   = 0,
	INTERNET_OPEN_TYPE_DIRECT                      = 1,
	INTERNET_OPEN_TYPE_PROXY                       = 3,
	INTERNET_OPEN_TYPE_PRECONFIG_WITH_NO_AUTOPROXY = 4,
}
enum {
	PRE_CONFIG_INTERNET_ACCESS = INTERNET_OPEN_TYPE_PRECONFIG,
	LOCAL_INTERNET_ACCESS      = INTERNET_OPEN_TYPE_DIRECT,
	CERN_PROXY_INTERNET_ACCESS = INTERNET_OPEN_TYPE_PROXY,
}

export extern(Windows) BOOL InternetCloseHandle(HINTERNET hInternet);

export extern(Windows) HINTERNET InternetConnectA(HINTERNET hInternet, LPCSTR lpszServerName, INTERNET_PORT nServerPort, LPCSTR lpszUserName, LPCSTR lpszPassword, DWORD dwService, DWORD dwFlags, DWORD_PTR dwContext);
export extern(Windows) HINTERNET InternetConnectW(HINTERNET hInternet, LPCWSTR lpszServerName, INTERNET_PORT nServerPort, LPCWSTR lpszUserName, LPCWSTR lpszPassword, DWORD dwService, DWORD dwFlags, DWORD_PTR dwContext);
version(UNICODE)
	alias InternetConnectW InternetConnect;
else
	alias InternetConnectA InternetConnect;

enum {
	INTERNET_SERVICE_FTP    = 1,
	INTERNET_SERVICE_GOPHER = 2,
	INTERNET_SERVICE_HTTP   = 3,
}

export extern(Windows) HINTERNET InternetOpenUrlA(HINTERNET hInternet, LPCSTR lpszUrl, LPCSTR lpszHeaders, DWORD dwHeadersLength, DWORD dwFlags, DWORD_PTR dwContext);
export extern(Windows) HINTERNET InternetOpenUrlW(HINTERNET hInternet, LPCWSTR lpszUrl, LPCWSTR lpszHeaders, DWORD dwHeadersLength, DWORD dwFlags, DWORD_PTR dwContext);
version(UNICODE)
	alias InternetOpenUrlW InternetOpenUrl;
else
	alias InternetOpenUrlA InternetOpenUrl;

export extern(Windows) BOOL InternetReadFile(HINTERNET hFile, LPVOID lpBuffer, DWORD dwNumberOfBytesToRead, LPDWORD lpdwNumberOfBytesRead);

export extern(Windows) BOOL InternetReadFileExA(HINTERNET hFile, LPINTERNET_BUFFERSA lpBuffersOut, DWORD dwFlags, DWORD_PTR dwContext);
export extern(Windows) BOOL InternetReadFileExW(HINTERNET hFile, LPINTERNET_BUFFERSW lpBuffersOut, DWORD dwFlags, DWORD_PTR dwContext);
version(UNICODE)
	alias InternetReadFileExW InternetReadFileEx;
else
	alias InternetReadFileExA InternetReadFileEx;

enum {
	IRF_ASYNC       = WININET_API_FLAG_ASYNC,
	IRF_SYNC        = WININET_API_FLAG_SYNC,
	IRF_USE_CONTEXT = WININET_API_FLAG_USE_CONTEXT,
	IRF_NO_WAIT     = 0x00000008,
}

export extern(Windows) DWORD InternetSetFilePointer(HINTERNET hFile, LONG lDistanceToMove, PLONG lpDistanceToMoveHigh, DWORD dwMoveMethod, DWORD_PTR dwContext);
export extern(Windows) BOOL InternetWriteFile(HINTERNET hFile, LPCVOID lpBuffer, DWORD dwNumberOfBytesToWrite, LPDWORD lpdwNumberOfBytesWritten);
export extern(Windows) BOOL InternetQueryDataAvailable(HINTERNET hFile, LPDWORD lpdwNumberOfBytesAvailable, DWORD dwFlags, DWORD_PTR dwContext);

export extern(Windows) BOOL InternetFindNextFileA(HINTERNET hFind, LPVOID lpvFindData);
export extern(Windows) BOOL InternetFindNextFileW(HINTERNET hFind, LPVOID lpvFindData);
version(UNICODE)
	alias InternetFindNextFileW InternetFindNextFile;
else
	alias InternetFindNextFileA InternetFindNextFile;

export extern(Windows) BOOL InternetQueryOptionA(HINTERNET hInternet, DWORD dwOption, LPVOID lpBuffer, LPDWORD lpdwBufferLength);
export extern(Windows) BOOL InternetQueryOptionW(HINTERNET hInternet, DWORD dwOption, LPVOID lpBuffer, LPDWORD lpdwBufferLength);
version(UNICODE)
	alias InternetQueryOptionW InternetQueryOption;
else
	alias InternetQueryOptionA InternetQueryOption;

export extern(Windows) BOOL InternetSetOptionA(HINTERNET hInternet, DWORD dwOption, LPVOID lpBuffer, DWORD dwBufferLength);
export extern(Windows) BOOL InternetSetOptionW(HINTERNET hInternet, DWORD dwOption, LPVOID lpBuffer, DWORD dwBufferLength);
version(UNICODE)
	alias InternetSetOptionW InternetSetOption;
else
	alias InternetSetOptionA InternetSetOption;

export extern(Windows) BOOL InternetSetOptionExA(HINTERNET hInternet, DWORD dwOption, LPVOID lpBuffer, DWORD dwBufferLength, DWORD dwFlags);
export extern(Windows) BOOL InternetSetOptionExW(HINTERNET hInternet, DWORD dwOption, LPVOID lpBuffer, DWORD dwBufferLength, DWORD dwFlags);
version(UNICODE)
	alias InternetSetOptionExW InternetSetOptionEx;
else
	alias InternetSetOptionExA InternetSetOptionEx;

export extern(Windows) BOOL InternetLockRequestFile(HINTERNET hInternet, HANDLE* lphLockRequestInfo);
export extern(Windows) BOOL InternetUnlockRequestFile(HANDLE hLockRequestInfo);

enum {
	ISO_GLOBAL      = 0x00000001,
	ISO_REGISTRY    = 0x00000002,
	ISO_VALID_FLAGS = ISO_GLOBAL | ISO_REGISTRY,
}

enum {
	INTERNET_OPTION_CALLBACK                          = 1,
	INTERNET_OPTION_CONNECT_TIMEOUT                   = 2,
	INTERNET_OPTION_CONNECT_RETRIES                   = 3,
	INTERNET_OPTION_CONNECT_BACKOFF                   = 4,
	INTERNET_OPTION_SEND_TIMEOUT                      = 5,
	INTERNET_OPTION_CONTROL_SEND_TIMEOUT              = INTERNET_OPTION_SEND_TIMEOUT,
	INTERNET_OPTION_RECEIVE_TIMEOUT                   = 6,
	INTERNET_OPTION_CONTROL_RECEIVE_TIMEOUT           = INTERNET_OPTION_RECEIVE_TIMEOUT,
	INTERNET_OPTION_DATA_SEND_TIMEOUT                 = 7,
	INTERNET_OPTION_DATA_RECEIVE_TIMEOUT              = 8,
	INTERNET_OPTION_HANDLE_TYPE                       = 9,
	INTERNET_OPTION_LISTEN_TIMEOUT                    = 11,
	INTERNET_OPTION_READ_BUFFER_SIZE                  = 12,
	INTERNET_OPTION_WRITE_BUFFER_SIZE                 = 13,
	INTERNET_OPTION_ASYNC_ID                          = 15,
	INTERNET_OPTION_ASYNC_PRIORITY                    = 16,
	INTERNET_OPTION_PARENT_HANDLE                     = 21,
	INTERNET_OPTION_KEEP_CONNECTION                   = 22,
	INTERNET_OPTION_REQUEST_FLAGS                     = 23,
	INTERNET_OPTION_EXTENDED_ERROR                    = 24,
	INTERNET_OPTION_OFFLINE_MODE                      = 26,
	INTERNET_OPTION_CACHE_STREAM_HANDLE               = 27,
	INTERNET_OPTION_USERNAME                          = 28,
	INTERNET_OPTION_PASSWORD                          = 29,
	INTERNET_OPTION_ASYNC                             = 30,
	INTERNET_OPTION_SECURITY_FLAGS                    = 31,
	INTERNET_OPTION_SECURITY_CERTIFICATE_STRUCT       = 32,
	INTERNET_OPTION_DATAFILE_NAME                     = 33,
	INTERNET_OPTION_URL                               = 34,
	INTERNET_OPTION_SECURITY_CERTIFICATE              = 35,
	INTERNET_OPTION_SECURITY_KEY_BITNESS              = 36,
	INTERNET_OPTION_REFRESH                           = 37,
	INTERNET_OPTION_PROXY                             = 38,
	INTERNET_OPTION_SETTINGS_CHANGED                  = 39,
	INTERNET_OPTION_VERSION                           = 40,
	INTERNET_OPTION_USER_AGENT                        = 41,
	INTERNET_OPTION_END_BROWSER_SESSION               = 42,
	INTERNET_OPTION_PROXY_USERNAME                    = 43,
	INTERNET_OPTION_PROXY_PASSWORD                    = 44,
	INTERNET_OPTION_CONTEXT_VALUE                     = 45,
	INTERNET_OPTION_CONNECT_LIMIT                     = 46,
	INTERNET_OPTION_SECURITY_SELECT_CLIENT_CERT       = 47,
	INTERNET_OPTION_POLICY                            = 48,
	INTERNET_OPTION_DISCONNECTED_TIMEOUT              = 49,
	INTERNET_OPTION_CONNECTED_STATE                   = 50,
	INTERNET_OPTION_IDLE_STATE                        = 51,
	INTERNET_OPTION_OFFLINE_SEMANTICS                 = 52,
	INTERNET_OPTION_SECONDARY_CACHE_KEY               = 53,
	INTERNET_OPTION_CALLBACK_FILTER                   = 54,
	INTERNET_OPTION_CONNECT_TIME                      = 55,
	INTERNET_OPTION_SEND_THROUGHPUT                   = 56,
	INTERNET_OPTION_RECEIVE_THROUGHPUT                = 57,
	INTERNET_OPTION_REQUEST_PRIORITY                  = 58,
	INTERNET_OPTION_HTTP_VERSION                      = 59,
	INTERNET_OPTION_RESET_URLCACHE_SESSION            = 60,
	INTERNET_OPTION_ERROR_MASK                        = 62,
	INTERNET_OPTION_FROM_CACHE_TIMEOUT                = 63,
	INTERNET_OPTION_BYPASS_EDITED_ENTRY               = 64,
	INTERNET_OPTION_HTTP_DECODING                     = 65,
	INTERNET_OPTION_DIAGNOSTIC_SOCKET_INFO            = 67,
	INTERNET_OPTION_CODEPAGE                          = 68,
	INTERNET_OPTION_CACHE_TIMESTAMPS                  = 69,
	INTERNET_OPTION_DISABLE_AUTODIAL                  = 70,
	INTERNET_OPTION_MAX_CONNS_PER_SERVER              = 73,
	INTERNET_OPTION_MAX_CONNS_PER_1_0_SERVER          = 74,
	INTERNET_OPTION_PER_CONNECTION_OPTION             = 75,
	INTERNET_OPTION_DIGEST_AUTH_UNLOAD                = 76,
	INTERNET_OPTION_IGNORE_OFFLINE                    = 77,
	INTERNET_OPTION_IDENTITY                          = 78,
	INTERNET_OPTION_REMOVE_IDENTITY                   = 79,
	INTERNET_OPTION_ALTER_IDENTITY                    = 80,
	INTERNET_OPTION_SUPPRESS_BEHAVIOR                 = 81,
	INTERNET_OPTION_AUTODIAL_MODE                     = 82,
	INTERNET_OPTION_AUTODIAL_CONNECTION               = 83,
	INTERNET_OPTION_CLIENT_CERT_CONTEXT               = 84,
	INTERNET_OPTION_AUTH_FLAGS                        = 85,
	INTERNET_OPTION_COOKIES_3RD_PARTY                 = 86,
	INTERNET_OPTION_DISABLE_PASSPORT_AUTH             = 87,
	INTERNET_OPTION_SEND_UTF8_SERVERNAME_TO_PROXY     = 88,
	INTERNET_OPTION_EXEMPT_CONNECTION_LIMIT           = 89,
	INTERNET_OPTION_ENABLE_PASSPORT_AUTH              = 90,
	INTERNET_OPTION_HIBERNATE_INACTIVE_WORKER_THREADS = 91,
	INTERNET_OPTION_ACTIVATE_WORKER_THREADS           = 92,
	INTERNET_OPTION_RESTORE_WORKER_THREAD_DEFAULTS    = 93,
	INTERNET_OPTION_SOCKET_SEND_BUFFER_LENGTH         = 94,
	INTERNET_OPTION_PROXY_SETTINGS_CHANGED            = 95,
	INTERNET_OPTION_DATAFILE_EXT                      = 96,
	INTERNET_OPTION_CODEPAGE_PATH                     = 100,
	INTERNET_OPTION_CODEPAGE_EXTRA                    = 101,
	INTERNET_OPTION_IDN                               = 102,
	INTERNET_OPTION_MAX_CONNS_PER_PROXY               = 103,
	INTERNET_OPTION_SUPPRESS_SERVER_AUTH              = 104,
	INTERNET_OPTION_SERVER_CERT_CHAIN_CONTEXT         = 105,
	INTERNET_FIRST_OPTION                             = INTERNET_OPTION_CALLBACK,
	INTERNET_LAST_OPTION                              = INTERNET_OPTION_SERVER_CERT_CHAIN_CONTEXT,
	INTERNET_PRIORITY_FOREGROUND                      = 1000,
}

enum {
	INTERNET_HANDLE_TYPE_INTERNET         = 1,
	INTERNET_HANDLE_TYPE_CONNECT_FTP      = 2,
	INTERNET_HANDLE_TYPE_CONNECT_GOPHER   = 3,
	INTERNET_HANDLE_TYPE_CONNECT_HTTP     = 4,
	INTERNET_HANDLE_TYPE_FTP_FIND         = 5,
	INTERNET_HANDLE_TYPE_FTP_FIND_HTML    = 6,
	INTERNET_HANDLE_TYPE_FTP_FILE         = 7,
	INTERNET_HANDLE_TYPE_FTP_FILE_HTML    = 8,
	INTERNET_HANDLE_TYPE_GOPHER_FIND      = 9,
	INTERNET_HANDLE_TYPE_GOPHER_FIND_HTML = 10,
	INTERNET_HANDLE_TYPE_GOPHER_FILE      = 11,
	INTERNET_HANDLE_TYPE_GOPHER_FILE_HTML = 12,
	INTERNET_HANDLE_TYPE_HTTP_REQUEST     = 13,
	INTERNET_HANDLE_TYPE_FILE_REQUEST     = 14,
}

/*enum { move to up
	AUTH_FLAG_DISABLE_NEGOTIATE            = 0x00000001,
	AUTH_FLAG_ENABLE_NEGOTIATE             = 0x00000002,
	AUTH_FLAG_DISABLE_BASIC_CLEARCHANNEL   = 0x00000004,
	SECURITY_FLAG_SECURE                   = 0x00000001,
	SECURITY_FLAG_STRENGTH_WEAK            = 0x10000000,
	SECURITY_FLAG_STRENGTH_MEDIUM          = 0x40000000,
	SECURITY_FLAG_STRENGTH_STRONG          = 0x20000000,
	SECURITY_FLAG_UNKNOWNBIT               = 0x80000000,
	SECURITY_FLAG_FORTEZZA                 = 0x08000000,
	SECURITY_FLAG_NORMALBITNESS            = SECURITY_FLAG_STRENGTH_WEAK,
	SECURITY_FLAG_SSL                      = 0x00000002,
	SECURITY_FLAG_SSL3                     = 0x00000004,
	SECURITY_FLAG_PCT                      = 0x00000008,
	SECURITY_FLAG_PCT4                     = 0x00000010,
	SECURITY_FLAG_IETFSSL4                 = 0x00000020,
	SECURITY_FLAG_40BIT                    = SECURITY_FLAG_STRENGTH_WEAK,
	SECURITY_FLAG_128BIT                   = SECURITY_FLAG_STRENGTH_STRONG,
	SECURITY_FLAG_56BIT                    = SECURITY_FLAG_STRENGTH_MEDIUM,
	SECURITY_FLAG_IGNORE_REVOCATION        = 0x00000080,
	SECURITY_FLAG_IGNORE_UNKNOWN_CA        = 0x00000100,
	SECURITY_FLAG_IGNORE_WRONG_USAGE       = 0x00000200,
	SECURITY_FLAG_IGNORE_CERT_CN_INVALID   = INTERNET_FLAG_IGNORE_CERT_CN_INVALID,
	SECURITY_FLAG_IGNORE_CERT_DATE_INVALID = INTERNET_FLAG_IGNORE_CERT_DATE_INVALID,
	SECURITY_FLAG_IGNORE_REDIRECT_TO_HTTPS = INTERNET_FLAG_IGNORE_REDIRECT_TO_HTTPS,
	SECURITY_FLAG_IGNORE_REDIRECT_TO_HTTP  = INTERNET_FLAG_IGNORE_REDIRECT_TO_HTTP,
	SECURITY_SET_MASK                      = SECURITY_FLAG_IGNORE_REVOCATION | SECURITY_FLAG_IGNORE_UNKNOWN_CA | SECURITY_FLAG_IGNORE_CERT_CN_INVALID | SECURITY_FLAG_IGNORE_CERT_DATE_INVALID | SECURITY_FLAG_IGNORE_WRONG_USAGE,
}*/

enum {
	AUTODIAL_MODE_NEVER              = 1,
	AUTODIAL_MODE_ALWAYS             = 2,
	AUTODIAL_MODE_NO_NETWORK_PRESENT = 4,
}

export extern(Windows) BOOL InternetGetLastResponseInfoA(LPDWORD lpdwError, LPSTR lpszBuffer, LPDWORD lpdwBufferLength);
export extern(Windows) BOOL InternetGetLastResponseInfoW(LPDWORD lpdwError, LPWSTR lpszBuffer, LPDWORD lpdwBufferLength);
version(UNICODE)
	alias InternetGetLastResponseInfoW InternetGetLastResponseInfo;
else
	alias InternetGetLastResponseInfoA InternetGetLastResponseInfo;

alias extern(Windows) VOID function(HINTERNET hInternet, DWORD_PTR dwContext, DWORD dwInternetStatus, LPVOID lpvStatusInformation, DWORD dwStatusInformationLength) INTERNET_STATUS_CALLBACK;
alias INTERNET_STATUS_CALLBACK LPINTERNET_STATUS_CALLBACK;

export extern(Windows) INTERNET_STATUS_CALLBACK InternetSetStatusCallbackA(HINTERNET hInternet, INTERNET_STATUS_CALLBACK lpfnInternetCallback);
export extern(Windows) INTERNET_STATUS_CALLBACK InternetSetStatusCallbackW(HINTERNET hInternet, INTERNET_STATUS_CALLBACK lpfnInternetCallback);

version(UNICODE)
	alias InternetSetStatusCallbackW InternetSetStatusCallback;
else
	alias InternetSetStatusCallbackA InternetSetStatusCallback;

enum {
	INTERNET_STATUS_RESOLVING_NAME        = 10,
	INTERNET_STATUS_NAME_RESOLVED         = 11,
	INTERNET_STATUS_CONNECTING_TO_SERVER  = 20,
	INTERNET_STATUS_CONNECTED_TO_SERVER   = 21,
	INTERNET_STATUS_SENDING_REQUEST       = 30,
	INTERNET_STATUS_REQUEST_SENT          = 31,
	INTERNET_STATUS_RECEIVING_RESPONSE    = 40,
	INTERNET_STATUS_RESPONSE_RECEIVED     = 41,
	INTERNET_STATUS_CTL_RESPONSE_RECEIVED = 42,
	INTERNET_STATUS_PREFETCH              = 43,
	INTERNET_STATUS_CLOSING_CONNECTION    = 50,
	INTERNET_STATUS_CONNECTION_CLOSED     = 51,
	INTERNET_STATUS_HANDLE_CREATED        = 60,
	INTERNET_STATUS_HANDLE_CLOSING        = 70,
	INTERNET_STATUS_DETECTING_PROXY       = 80,
	INTERNET_STATUS_REQUEST_COMPLETE      = 100,
	INTERNET_STATUS_REDIRECT              = 110,
	INTERNET_STATUS_INTERMEDIATE_RESPONSE = 120,
	INTERNET_STATUS_USER_INPUT_REQUIRED   = 140,
	INTERNET_STATUS_STATE_CHANGE          = 200,
	INTERNET_STATUS_COOKIE_SENT           = 320,
	INTERNET_STATUS_COOKIE_RECEIVED       = 321,
	INTERNET_STATUS_PRIVACY_IMPACTED      = 324,
	INTERNET_STATUS_P3P_HEADER            = 325,
	INTERNET_STATUS_P3P_POLICYREF         = 326,
	INTERNET_STATUS_COOKIE_HISTORY        = 327,
}
enum {
	INTERNET_STATE_CONNECTED            = 0x00000001,
	INTERNET_STATE_DISCONNECTED         = 0x00000002,
	INTERNET_STATE_DISCONNECTED_BY_USER = 0x00000010,
	INTERNET_STATE_IDLE                 = 0x00000100,
	INTERNET_STATE_BUSY                 = 0x00000200,
}

enum {
	COOKIE_STATE_UNKNOWN = 0x0,
	COOKIE_STATE_ACCEPT = 0x1,
	COOKIE_STATE_PROMPT = 0x2,
	COOKIE_STATE_LEASH = 0x3,
	COOKIE_STATE_DOWNGRADE = 0x4,
	COOKIE_STATE_REJECT = 0x5,
	COOKIE_STATE_MAX = COOKIE_STATE_REJECT,
}
alias int InternetCookieState;

version(Win64){
	align(8)
	struct IncomingCookieState {
		int cSession;
		int cPersistent;
		int cAccepted;
		int cLeashed;
		int cDowngraded;
		int cBlocked;
		const(char)* pszLocation;
	}
}else{
	align(4)
	struct IncomingCookieState {
		int cSession;
		int cPersistent;
		int cAccepted;
		int cLeashed;
		int cDowngraded;
		int cBlocked;
		const(char)* pszLocation;
	}
}

version(Win64){
	align(8)
	struct OutgoingCookieState {
		int cSent;
		int cSuppressed;
		const(char)* pszLocation;
	}
}else{
	align(4)
	struct OutgoingCookieState {
		int cSent;
		int cSuppressed;
		const(char)* pszLocation;
	}
}

version(Win64){
	align(8)
	struct InternetCookieHistory {
		BOOL fAccepted;
		BOOL fLeashed;
		BOOL fDowngraded;
		BOOL fRejected;
	}
}else{
	align(4)
	struct InternetCookieHistory {
		BOOL fAccepted;
		BOOL fLeashed;
		BOOL fDowngraded;
		BOOL fRejected;
	}
}

version(Win64){
	align(8)
	struct CookieDecision {
		DWORD dwCookieState;
		BOOL fAllowSession;
	}
}else{
	align(4)
	struct CookieDecision {
		DWORD dwCookieState;
		BOOL fAllowSession;
	}
}

enum INTERNET_INVALID_STATUS_CALLBACK = cast(INTERNET_STATUS_CALLBACK)-1;

/*enum { move to up
	FTP_TRANSFER_TYPE_UNKNOWN = 0x00000000,
	FTP_TRANSFER_TYPE_ASCII   = 0x00000001,
	FTP_TRANSFER_TYPE_BINARY  = 0x00000002,
	FTP_TRANSFER_TYPE_MASK    = FTP_TRANSFER_TYPE_ASCII | FTP_TRANSFER_TYPE_BINARY,
}*/

export extern(Windows) HINTERNET FtpFindFirstFileA(HINTERNET hConnect, LPCSTR lpszSearchFile, LPWIN32_FIND_DATAA lpFindFileData, DWORD dwFlags, DWORD_PTR dwContext);
export extern(Windows) HINTERNET FtpFindFirstFileW(HINTERNET hConnect, LPCWSTR lpszSearchFile, LPWIN32_FIND_DATAW lpFindFileData, DWORD dwFlags, DWORD_PTR dwContext);
version(UNICODE)
	alias FtpFindFirstFileW FtpFindFirstFile;
else
	alias FtpFindFirstFileA FtpFindFirstFile;

export extern(Windows) BOOL FtpGetFileA(HINTERNET hConnect, LPCSTR lpszRemoteFile, LPCSTR lpszNewFile, BOOL fFailIfExists, DWORD dwFlagsAndAttributes, DWORD dwFlags, DWORD_PTR dwContext);
export extern(Windows) BOOL FtpGetFileW(HINTERNET hConnect, LPCWSTR lpszRemoteFile, LPCWSTR lpszNewFile, BOOL fFailIfExists, DWORD dwFlagsAndAttributes, DWORD dwFlags, DWORD_PTR dwContext);
version(UNICODE)
	alias FtpGetFileW FtpGetFile;
else
	alias FtpGetFileA FtpGetFile;

export extern(Windows) BOOL FtpPutFileA(HINTERNET hConnect, LPCSTR lpszLocalFile, LPCSTR lpszNewRemoteFile, DWORD dwFlags, DWORD_PTR dwContext);
export extern(Windows) BOOL FtpPutFileW(HINTERNET hConnect, LPCWSTR lpszLocalFile, LPCWSTR lpszNewRemoteFile, DWORD dwFlags, DWORD_PTR dwContext);
version(UNICODE)
	alias FtpPutFileW FtpPutFile;
else
	alias FtpPutFileA FtpPutFile;

export extern(Windows) BOOL FtpGetFileEx(HINTERNET hFtpSession, LPCSTR lpszRemoteFile, LPCWSTR lpszNewFile, BOOL fFailIfExists, DWORD dwFlagsAndAttributes, DWORD dwFlags, DWORD_PTR dwContext);
export extern(Windows) BOOL FtpPutFileEx(HINTERNET hFtpSession, LPCWSTR lpszLocalFile, LPCSTR lpszNewRemoteFile, DWORD dwFlags, DWORD_PTR dwContext);

export extern(Windows) BOOL FtpDeleteFileA(HINTERNET hConnect, LPCSTR lpszFileName);
export extern(Windows) BOOL FtpDeleteFileW(HINTERNET hConnect, LPCWSTR lpszFileName);
version(UNICODE)
	alias FtpDeleteFileW FtpDeleteFile;
else
	alias FtpDeleteFileA FtpDeleteFile;

export extern(Windows) BOOL FtpRenameFileA(HINTERNET hConnect, LPCSTR lpszExisting, LPCSTR lpszNew);
export extern(Windows) BOOL FtpRenameFileW(HINTERNET hConnect, LPCWSTR lpszExisting, LPCWSTR lpszNew);
version(UNICODE)
	alias FtpRenameFileW FtpRenameFile;
else
	alias FtpRenameFileA FtpRenameFile;

export extern(Windows) HINTERNET FtpOpenFileA(HINTERNET hConnect, LPCSTR lpszFileName, DWORD dwAccess, DWORD dwFlags, DWORD_PTR dwContext);
export extern(Windows) HINTERNET FtpOpenFileW(HINTERNET hConnect, LPCWSTR lpszFileName, DWORD dwAccess, DWORD dwFlags, DWORD_PTR dwContext);
version(UNICODE)
	alias FtpOpenFileW FtpOpenFile;
else
	alias FtpOpenFileA FtpOpenFile;

export extern(Windows) BOOL FtpCreateDirectoryA(HINTERNET hConnect, LPCSTR lpszDirectory);
export extern(Windows) BOOL FtpCreateDirectoryW(HINTERNET hConnect, LPCWSTR lpszDirectory);
version(UNICODE)
	alias FtpCreateDirectoryW FtpCreateDirectory;
else
	alias FtpCreateDirectoryA FtpCreateDirectory;

export extern(Windows) BOOL FtpRemoveDirectoryA(HINTERNET hConnect, LPCSTR lpszDirectory);
export extern(Windows) BOOL FtpRemoveDirectoryW(HINTERNET hConnect, LPCWSTR lpszDirectory);
version(UNICODE)
	alias FtpRemoveDirectoryW FtpRemoveDirectory;
else
	alias FtpRemoveDirectoryA FtpRemoveDirectory;

export extern(Windows) BOOL FtpSetCurrentDirectoryA(HINTERNET hConnect, LPCSTR lpszDirectory);
export extern(Windows) BOOL FtpSetCurrentDirectoryW(HINTERNET hConnect, LPCWSTR lpszDirectory);
version(UNICODE)
	alias FtpSetCurrentDirectoryW FtpSetCurrentDirectory;
else
	alias FtpSetCurrentDirectoryA FtpSetCurrentDirectory;

export extern(Windows) BOOL FtpGetCurrentDirectoryA(HINTERNET hConnect, LPSTR lpszCurrentDirectory, LPDWORD lpdwCurrentDirectory);
export extern(Windows) BOOL FtpGetCurrentDirectoryW(HINTERNET hConnect, LPWSTR lpszCurrentDirectory, LPDWORD lpdwCurrentDirectory);
version(UNICODE)
	alias FtpGetCurrentDirectoryW FtpGetCurrentDirectory;
else
	alias FtpGetCurrentDirectoryA FtpGetCurrentDirectory;

export extern(Windows) BOOL FtpCommandA(HINTERNET hConnect, BOOL fExpectResponse, DWORD dwFlags, LPCSTR lpszCommand, DWORD_PTR dwContext, HINTERNET* phFtpCommand);
export extern(Windows) BOOL FtpCommandW(HINTERNET hConnect, BOOL fExpectResponse, DWORD dwFlags, LPCWSTR lpszCommand, DWORD_PTR dwContext, HINTERNET* phFtpCommand);
version(UNICODE)
	alias FtpCommandW FtpCommand;
else
	alias FtpCommandA FtpCommand;

export extern(Windows) DWORD FtpGetFileSize(HINTERNET hFile, LPDWORD lpdwFileSizeHigh);

enum {
	MAX_GOPHER_DISPLAY_TEXT   = 128,
	MAX_GOPHER_SELECTOR_TEXT  = 256,
	MAX_GOPHER_HOST_NAME      = INTERNET_MAX_HOST_NAME_LENGTH,
	MAX_GOPHER_LOCATOR_LENGTH = 1 + MAX_GOPHER_DISPLAY_TEXT + 1 + MAX_GOPHER_SELECTOR_TEXT + 1 + MAX_GOPHER_HOST_NAME + 1 + INTERNET_MAX_PORT_NUMBER_LENGTH + 1 + 1 + 2 ,
}

version(Win64){
	align(8)
	struct GOPHER_FIND_DATAA {
		CHAR[MAX_GOPHER_DISPLAY_TEXT + 1] DisplayString;
		DWORD GopherType;
		DWORD SizeLow;
		DWORD SizeHigh;
		FILETIME LastModificationTime;
		CHAR[MAX_GOPHER_LOCATOR_LENGTH+1] Locator;
	}
}else{
	align(4)
	struct GOPHER_FIND_DATAA {
		CHAR[MAX_GOPHER_DISPLAY_TEXT + 1] DisplayString;
		DWORD GopherType;
		DWORD SizeLow;
		DWORD SizeHigh;
		FILETIME LastModificationTime;
		CHAR[MAX_GOPHER_LOCATOR_LENGTH + 1] Locator;
	}
}
alias GOPHER_FIND_DATAA* LPGOPHER_FIND_DATAA;

version(Win64){
	align(8)
	struct GOPHER_FIND_DATAW {
		WCHAR[MAX_GOPHER_DISPLAY_TEXT + 1] DisplayString;
		DWORD GopherType;
		DWORD SizeLow;
		DWORD SizeHigh;
		FILETIME LastModificationTime;
		WCHAR[MAX_GOPHER_LOCATOR_LENGTH + 1] Locator;
	}
}else{
	align(4)
	struct GOPHER_FIND_DATAW {
		WCHAR[MAX_GOPHER_DISPLAY_TEXT + 1] DisplayString;
		DWORD GopherType;
		DWORD SizeLow;
		DWORD SizeHigh;
		FILETIME LastModificationTime;
		WCHAR[MAX_GOPHER_LOCATOR_LENGTH + 1] Locator;
	}
}
alias GOPHER_FIND_DATAW* LPGOPHER_FIND_DATAW;

version(UNICODE){
	alias GOPHER_FIND_DATAW GOPHER_FIND_DATA;
	alias LPGOPHER_FIND_DATAW LPGOPHER_FIND_DATA;
}else{
	alias GOPHER_FIND_DATAA GOPHER_FIND_DATA;
	alias LPGOPHER_FIND_DATAA LPGOPHER_FIND_DATA;
}

enum {
	GOPHER_TYPE_TEXT_FILE      = 0x00000001,
	GOPHER_TYPE_DIRECTORY      = 0x00000002,
	GOPHER_TYPE_CSO            = 0x00000004,
	GOPHER_TYPE_ERROR          = 0x00000008,
	GOPHER_TYPE_MAC_BINHEX     = 0x00000010,
	GOPHER_TYPE_DOS_ARCHIVE    = 0x00000020,
	GOPHER_TYPE_UNIX_UUENCODED = 0x00000040,
	GOPHER_TYPE_INDEX_SERVER   = 0x00000080,
	GOPHER_TYPE_TELNET         = 0x00000100,
	GOPHER_TYPE_BINARY         = 0x00000200,
	GOPHER_TYPE_REDUNDANT      = 0x00000400,
	GOPHER_TYPE_TN3270         = 0x00000800,
	GOPHER_TYPE_GIF            = 0x00001000,
	GOPHER_TYPE_IMAGE          = 0x00002000,
	GOPHER_TYPE_BITMAP         = 0x00004000,
	GOPHER_TYPE_MOVIE          = 0x00008000,
	GOPHER_TYPE_SOUND          = 0x00010000,
	GOPHER_TYPE_HTML           = 0x00020000,
	GOPHER_TYPE_PDF            = 0x00040000,
	GOPHER_TYPE_CALENDAR       = 0x00080000,
	GOPHER_TYPE_INLINE         = 0x00100000,
	GOPHER_TYPE_UNKNOWN        = 0x20000000,
	GOPHER_TYPE_ASK            = 0x40000000,
	GOPHER_TYPE_GOPHER_PLUS    = 0x80000000,
	GOPHER_TYPE_FILE_MASK      = GOPHER_TYPE_TEXT_FILE | GOPHER_TYPE_MAC_BINHEX | GOPHER_TYPE_DOS_ARCHIVE  | GOPHER_TYPE_UNIX_UUENCODED  | GOPHER_TYPE_BINARY  | GOPHER_TYPE_GIF  | GOPHER_TYPE_IMAGE  | GOPHER_TYPE_BITMAP  | GOPHER_TYPE_MOVIE | GOPHER_TYPE_SOUND | GOPHER_TYPE_HTML | GOPHER_TYPE_PDF | GOPHER_TYPE_CALENDAR | GOPHER_TYPE_INLINE,
}

/* not documents.
	IS_GOPHER_FILE(type) (BOOL)(((type) & GOPHER_TYPE_FILE_MASK) ? TRUE : FALSE)
	IS_GOPHER_DIRECTORY(type) (BOOL)(((type) & GOPHER_TYPE_DIRECTORY) ? TRUE : FALSE)
	IS_GOPHER_PHONE_SERVER(type) (BOOL)(((type) & GOPHER_TYPE_CSO) ? TRUE : FALSE)
	IS_GOPHER_ERROR(type) (BOOL)(((type) & GOPHER_TYPE_ERROR) ? TRUE : FALSE)
	IS_GOPHER_INDEX_SERVER(type) (BOOL)(((type) & GOPHER_TYPE_INDEX_SERVER) ? TRUE : FALSE)
	IS_GOPHER_TELNET_SESSION(type) (BOOL)(((type) & GOPHER_TYPE_TELNET) ? TRUE : FALSE)
	IS_GOPHER_BACKUP_SERVER(type) (BOOL)(((type) & GOPHER_TYPE_REDUNDANT) ? TRUE : FALSE)
	IS_GOPHER_TN3270_SESSION(type) (BOOL)(((type) & GOPHER_TYPE_TN3270) ? TRUE : FALSE)
	IS_GOPHER_ASK(type) (BOOL)(((type) & GOPHER_TYPE_ASK) ? TRUE : FALSE)
	IS_GOPHER_PLUS(type) (BOOL)(((type) & GOPHER_TYPE_GOPHER_PLUS) ? TRUE : FALSE)
	IS_GOPHER_TYPE_KNOWN(type) (BOOL)(((type) & GOPHER_TYPE_UNKNOWN) ? FALSE : TRUE)
*/

version(Win64){
	align(8)
	struct GOPHER_ADMIN_ATTRIBUTE_TYPE {
		LPCTSTR Comment;
		LPCTSTR EmailAddress;
	}
}else{
	align(4)
	struct GOPHER_ADMIN_ATTRIBUTE_TYPE {
		LPCTSTR Comment;
		LPCTSTR EmailAddress;
	}
}
alias GOPHER_ADMIN_ATTRIBUTE_TYPE* LPGOPHER_ADMIN_ATTRIBUTE_TYPE;

version(Win64){
	align(8)
	struct GOPHER_MOD_DATE_ATTRIBUTE_TYPE {
		FILETIME DateAndTime;
	}
}else{
	align(4)
	struct GOPHER_MOD_DATE_ATTRIBUTE_TYPE {
		FILETIME DateAndTime;
	}
}
alias GOPHER_MOD_DATE_ATTRIBUTE_TYPE* LPGOPHER_MOD_DATE_ATTRIBUTE_TYPE;

version(Win64){
	align(8)
	struct GOPHER_TTL_ATTRIBUTE_TYPE {
		DWORD Ttl;
	}
}else{
	align(4)
	struct GOPHER_TTL_ATTRIBUTE_TYPE {
		DWORD Ttl;
	}
}
alias GOPHER_TTL_ATTRIBUTE_TYPE* LPGOPHER_TTL_ATTRIBUTE_TYPE;

version(Win64){
	align(8)
	struct GOPHER_SCORE_ATTRIBUTE_TYPE {
		INT Score;
	}
}else{
	align(4)
	struct GOPHER_SCORE_ATTRIBUTE_TYPE {
		INT Score;
	}
}
alias GOPHER_SCORE_ATTRIBUTE_TYPE* LPGOPHER_SCORE_ATTRIBUTE_TYPE;

version(Win64){
	align(8)
	struct GOPHER_SCORE_RANGE_ATTRIBUTE_TYPE {
		INT LowerBound;
		INT UpperBound;
	}
}else{
	align(4)
	struct GOPHER_SCORE_RANGE_ATTRIBUTE_TYPE {
		INT LowerBound;
		INT UpperBound;
	}
}
alias GOPHER_SCORE_RANGE_ATTRIBUTE_TYPE* LPGOPHER_SCORE_RANGE_ATTRIBUTE_TYPE;

version(Win64){
	align(8)
	struct GOPHER_SITE_ATTRIBUTE_TYPE {
		LPCTSTR Site;
	}
}else{
	align(4)
	struct GOPHER_SITE_ATTRIBUTE_TYPE {
		LPCTSTR Site;
	}
}
alias GOPHER_SITE_ATTRIBUTE_TYPE* LPGOPHER_SITE_ATTRIBUTE_TYPE;

version(Win64){
	align(8)
	struct GOPHER_ORGANIZATION_ATTRIBUTE_TYPE {
		LPCTSTR Organization;
	}
}else{
	align(4)
	struct GOPHER_ORGANIZATION_ATTRIBUTE_TYPE {
		LPCTSTR Organization;
	}
}
alias GOPHER_ORGANIZATION_ATTRIBUTE_TYPE* LPGOPHER_ORGANIZATION_ATTRIBUTE_TYPE;

version(Win64){
	align(8)
	struct GOPHER_LOCATION_ATTRIBUTE_TYPE {
		LPCTSTR Location;
	}
}else{
	align(4)
	struct GOPHER_LOCATION_ATTRIBUTE_TYPE {
		LPCTSTR Location;
	}
}
alias GOPHER_LOCATION_ATTRIBUTE_TYPE* LPGOPHER_LOCATION_ATTRIBUTE_TYPE;

version(Win64){
	align(8)
	struct GOPHER_GEOGRAPHICAL_LOCATION_ATTRIBUTE_TYPE {
		INT DegreesNorth;
		INT MinutesNorth;
		INT SecondsNorth;
		INT DegreesEast;
		INT MinutesEast;
		INT SecondsEast;
	}
}else{
	align(4)
	struct GOPHER_GEOGRAPHICAL_LOCATION_ATTRIBUTE_TYPE {
		INT DegreesNorth;
		INT MinutesNorth;
		INT SecondsNorth;
		INT DegreesEast;
		INT MinutesEast;
		INT SecondsEast;
	}
}

alias GOPHER_GEOGRAPHICAL_LOCATION_ATTRIBUTE_TYPE* LPGOPHER_GEOGRAPHICAL_LOCATION_ATTRIBUTE_TYPE;

version(Win64){
	align(8)
	struct GOPHER_TIMEZONE_ATTRIBUTE_TYPE {
		INT Zone;
	}
}else{
	align(4)
	struct GOPHER_TIMEZONE_ATTRIBUTE_TYPE {
		INT Zone;
	}
}
alias GOPHER_TIMEZONE_ATTRIBUTE_TYPE* LPGOPHER_TIMEZONE_ATTRIBUTE_TYPE;

version(Win64){
	align(8)
	struct GOPHER_PROVIDER_ATTRIBUTE_TYPE {
		LPCTSTR Provider;
	}
}else{
	align(4)
	struct GOPHER_PROVIDER_ATTRIBUTE_TYPE {
		LPCTSTR Provider;
	}
}
alias GOPHER_PROVIDER_ATTRIBUTE_TYPE* LPGOPHER_PROVIDER_ATTRIBUTE_TYPE;

version(Win64){
	align(8)
	struct GOPHER_VERSION_ATTRIBUTE_TYPE {
		LPCTSTR Version;
	}
}else{
	align(4)
	struct GOPHER_VERSION_ATTRIBUTE_TYPE {
		LPCTSTR Version;
	}
}
alias GOPHER_VERSION_ATTRIBUTE_TYPE* LPGOPHER_VERSION_ATTRIBUTE_TYPE;

version(Win64){
	align(8)
	struct GOPHER_ABSTRACT_ATTRIBUTE_TYPE {
		LPCTSTR ShortAbstract;
		LPCTSTR AbstractFile;
	}
}else{
	align(4)
	struct GOPHER_ABSTRACT_ATTRIBUTE_TYPE {
		LPCTSTR ShortAbstract;
		LPCTSTR AbstractFile;
	}
}
alias GOPHER_ABSTRACT_ATTRIBUTE_TYPE* LPGOPHER_ABSTRACT_ATTRIBUTE_TYPE;

version(Win64){
	align(8)
	struct GOPHER_VIEW_ATTRIBUTE_TYPE {
		LPCTSTR ContentType;
		LPCTSTR Language;
		DWORD Size;
	}
}else{
	align(4)
	struct GOPHER_VIEW_ATTRIBUTE_TYPE {
		LPCTSTR ContentType;
		LPCTSTR Language;
		DWORD Size;
	}
}
alias GOPHER_VIEW_ATTRIBUTE_TYPE* LPGOPHER_VIEW_ATTRIBUTE_TYPE;

version(Win64){
	align(8)
	struct GOPHER_VERONICA_ATTRIBUTE_TYPE {
		BOOL TreeWalk;
	}
}else{
	align(4)
	struct GOPHER_VERONICA_ATTRIBUTE_TYPE {
		BOOL TreeWalk;
	}
}
alias GOPHER_VERONICA_ATTRIBUTE_TYPE* LPGOPHER_VERONICA_ATTRIBUTE_TYPE;

version(Win64){
	align(8)
	struct GOPHER_ASK_ATTRIBUTE_TYPE {
		LPCTSTR QuestionType;
		LPCTSTR QuestionText;
	}
}else{
	align(4)
	struct GOPHER_ASK_ATTRIBUTE_TYPE {
		LPCTSTR QuestionType;
		LPCTSTR QuestionText;
	}
}
alias GOPHER_ASK_ATTRIBUTE_TYPE* LPGOPHER_ASK_ATTRIBUTE_TYPE;

version(Win64){
	align(8)
	struct GOPHER_UNKNOWN_ATTRIBUTE_TYPE {
		LPCTSTR Text;
	}
}else{
	align(4)
	struct GOPHER_UNKNOWN_ATTRIBUTE_TYPE {
		LPCTSTR Text;
	}
}
alias GOPHER_UNKNOWN_ATTRIBUTE_TYPE* LPGOPHER_UNKNOWN_ATTRIBUTE_TYPE;

version(Win64){
	align(8)
	struct GOPHER_ATTRIBUTE_TYPE {
		DWORD CategoryId;
		DWORD AttributeId;
		union {
			GOPHER_ADMIN_ATTRIBUTE_TYPE Admin;
			GOPHER_MOD_DATE_ATTRIBUTE_TYPE ModDate;
			GOPHER_TTL_ATTRIBUTE_TYPE Ttl;
			GOPHER_SCORE_ATTRIBUTE_TYPE Score;
			GOPHER_SCORE_RANGE_ATTRIBUTE_TYPE ScoreRange;
			GOPHER_SITE_ATTRIBUTE_TYPE Site;
			GOPHER_ORGANIZATION_ATTRIBUTE_TYPE Organization;
			GOPHER_LOCATION_ATTRIBUTE_TYPE Location;
			GOPHER_GEOGRAPHICAL_LOCATION_ATTRIBUTE_TYPE GeographicalLocation;
			GOPHER_TIMEZONE_ATTRIBUTE_TYPE TimeZone;
			GOPHER_PROVIDER_ATTRIBUTE_TYPE Provider;
			GOPHER_VERSION_ATTRIBUTE_TYPE Version;
			GOPHER_ABSTRACT_ATTRIBUTE_TYPE Abstract;
			GOPHER_VIEW_ATTRIBUTE_TYPE View;
			GOPHER_VERONICA_ATTRIBUTE_TYPE Veronica;
			GOPHER_ASK_ATTRIBUTE_TYPE Ask;
			GOPHER_UNKNOWN_ATTRIBUTE_TYPE Unknown;
		}
	}
}else{
	align(4)
	struct GOPHER_ATTRIBUTE_TYPE {
		DWORD CategoryId;
		DWORD AttributeId;
		union {
			GOPHER_ADMIN_ATTRIBUTE_TYPE Admin;
			GOPHER_MOD_DATE_ATTRIBUTE_TYPE ModDate;
			GOPHER_TTL_ATTRIBUTE_TYPE Ttl;
			GOPHER_SCORE_ATTRIBUTE_TYPE Score;
			GOPHER_SCORE_RANGE_ATTRIBUTE_TYPE ScoreRange;
			GOPHER_SITE_ATTRIBUTE_TYPE Site;
			GOPHER_ORGANIZATION_ATTRIBUTE_TYPE Organization;
			GOPHER_LOCATION_ATTRIBUTE_TYPE Location;
			GOPHER_GEOGRAPHICAL_LOCATION_ATTRIBUTE_TYPE GeographicalLocation;
			GOPHER_TIMEZONE_ATTRIBUTE_TYPE TimeZone;
			GOPHER_PROVIDER_ATTRIBUTE_TYPE Provider;
			GOPHER_VERSION_ATTRIBUTE_TYPE Version;
			GOPHER_ABSTRACT_ATTRIBUTE_TYPE Abstract;
			GOPHER_VIEW_ATTRIBUTE_TYPE View;
			GOPHER_VERONICA_ATTRIBUTE_TYPE Veronica;
			GOPHER_ASK_ATTRIBUTE_TYPE Ask;
			GOPHER_UNKNOWN_ATTRIBUTE_TYPE Unknown;
		}
	}
}
alias GOPHER_ATTRIBUTE_TYPE* LPGOPHER_ATTRIBUTE_TYPE;

enum {
	MAX_GOPHER_CATEGORY_NAME    = 128,
	MAX_GOPHER_ATTRIBUTE_NAME   = 128,
	MIN_GOPHER_ATTRIBUTE_LENGTH = 256,
}

const TCHAR* GOPHER_INFO_CATEGORY = "+INFO";
const TCHAR* GOPHER_ADMIN_CATEGORY = "+ADMIN";
const TCHAR* GOPHER_VIEWS_CATEGORY = "+VIEWS";
const TCHAR* GOPHER_ABSTRACT_CATEGORY = "+ABSTRACT";
const TCHAR* GOPHER_VERONICA_CATEGORY = "+VERONICA";

const TCHAR* GOPHER_ADMIN_ATTRIBUTE = "Admin";
const TCHAR* GOPHER_MOD_DATE_ATTRIBUTE = "Mod-Date";
const TCHAR* GOPHER_TTL_ATTRIBUTE = "TTL";
const TCHAR* GOPHER_SCORE_ATTRIBUTE = "Score";
const TCHAR* GOPHER_RANGE_ATTRIBUTE = "Score-range";
const TCHAR* GOPHER_SITE_ATTRIBUTE = "Site";
const TCHAR* GOPHER_ORG_ATTRIBUTE = "Org";
const TCHAR* GOPHER_LOCATION_ATTRIBUTE = "Loc";
const TCHAR* GOPHER_GEOG_ATTRIBUTE = "Geog";
const TCHAR* GOPHER_TIMEZONE_ATTRIBUTE = "TZ";
const TCHAR* GOPHER_PROVIDER_ATTRIBUTE = "Provider";
const TCHAR* GOPHER_VERSION_ATTRIBUTE = "Version";
const TCHAR* GOPHER_ABSTRACT_ATTRIBUTE = "Abstract";
const TCHAR* GOPHER_VIEW_ATTRIBUTE = "View";
const TCHAR* GOPHER_TREEWALK_ATTRIBUTE = "treewalk";

enum {
	GOPHER_ATTRIBUTE_ID_BASE     = 0xabcccc00,
	GOPHER_CATEGORY_ID_ALL       = GOPHER_ATTRIBUTE_ID_BASE + 1,
	GOPHER_CATEGORY_ID_INFO      = GOPHER_ATTRIBUTE_ID_BASE + 2,
	GOPHER_CATEGORY_ID_ADMIN     = GOPHER_ATTRIBUTE_ID_BASE + 3,
	GOPHER_CATEGORY_ID_VIEWS     = GOPHER_ATTRIBUTE_ID_BASE + 4,
	GOPHER_CATEGORY_ID_ABSTRACT  = GOPHER_ATTRIBUTE_ID_BASE + 5,
	GOPHER_CATEGORY_ID_VERONICA  = GOPHER_ATTRIBUTE_ID_BASE + 6,
	GOPHER_CATEGORY_ID_ASK       = GOPHER_ATTRIBUTE_ID_BASE + 7,
	GOPHER_CATEGORY_ID_UNKNOWN   = GOPHER_ATTRIBUTE_ID_BASE + 8,
	GOPHER_ATTRIBUTE_ID_ALL      = GOPHER_ATTRIBUTE_ID_BASE + 9,
	GOPHER_ATTRIBUTE_ID_ADMIN    = GOPHER_ATTRIBUTE_ID_BASE + 10,
	GOPHER_ATTRIBUTE_ID_MOD_DATE = GOPHER_ATTRIBUTE_ID_BASE + 11,
	GOPHER_ATTRIBUTE_ID_TTL      = GOPHER_ATTRIBUTE_ID_BASE + 12,
	GOPHER_ATTRIBUTE_ID_SCORE    = GOPHER_ATTRIBUTE_ID_BASE + 13,
	GOPHER_ATTRIBUTE_ID_RANGE    = GOPHER_ATTRIBUTE_ID_BASE + 14,
	GOPHER_ATTRIBUTE_ID_SITE     = GOPHER_ATTRIBUTE_ID_BASE + 15,
	GOPHER_ATTRIBUTE_ID_ORG      = GOPHER_ATTRIBUTE_ID_BASE + 16,
	GOPHER_ATTRIBUTE_ID_LOCATION = GOPHER_ATTRIBUTE_ID_BASE + 17,
	GOPHER_ATTRIBUTE_ID_GEOG     = GOPHER_ATTRIBUTE_ID_BASE + 18,
	GOPHER_ATTRIBUTE_ID_TIMEZONE = GOPHER_ATTRIBUTE_ID_BASE + 19,
	GOPHER_ATTRIBUTE_ID_PROVIDER = GOPHER_ATTRIBUTE_ID_BASE + 20,
	GOPHER_ATTRIBUTE_ID_VERSION  = GOPHER_ATTRIBUTE_ID_BASE + 21,
	GOPHER_ATTRIBUTE_ID_ABSTRACT = GOPHER_ATTRIBUTE_ID_BASE + 22,
	GOPHER_ATTRIBUTE_ID_VIEW     = GOPHER_ATTRIBUTE_ID_BASE + 23,
	GOPHER_ATTRIBUTE_ID_TREEWALK = GOPHER_ATTRIBUTE_ID_BASE + 24,
	GOPHER_ATTRIBUTE_ID_UNKNOWN  = GOPHER_ATTRIBUTE_ID_BASE + 25,
}

export extern(Windows) BOOL GopherCreateLocatorA(LPCSTR lpszHost, INTERNET_PORT nServerPort, LPCSTR lpszDisplayString, LPCSTR lpszSelectorString, DWORD dwGopherType, LPSTR lpszLocator, LPDWORD lpdwBufferLength);
export extern(Windows) BOOL GopherCreateLocatorW(LPCWSTR lpszHost, INTERNET_PORT nServerPort, LPCWSTR lpszDisplayString, LPCWSTR lpszSelectorString, DWORD dwGopherType, LPWSTR lpszLocator, LPDWORD lpdwBufferLength);
version(UNICODE)
	alias GopherCreateLocatorW GopherCreateLocator;
else
	alias GopherCreateLocatorA GopherCreateLocator;

export extern(Windows) BOOL GopherGetLocatorTypeA(LPCSTR lpszLocator, LPDWORD lpdwGopherType);
export extern(Windows) BOOL GopherGetLocatorTypeW(LPCWSTR lpszLocator, LPDWORD lpdwGopherType);
version(UNICODE)
	alias GopherGetLocatorTypeW GopherGetLocatorType;
else
	alias GopherGetLocatorTypeA GopherGetLocatorType;

export extern(Windows) HINTERNET GopherFindFirstFileA(HINTERNET hConnect, LPCSTR lpszLocator, LPCSTR lpszSearchString, LPGOPHER_FIND_DATAA lpFindData, DWORD dwFlags, DWORD_PTR dwContext);
export extern(Windows) HINTERNET GopherFindFirstFileW(HINTERNET hConnect, LPCWSTR lpszLocator, LPCWSTR lpszSearchString, LPGOPHER_FIND_DATAW lpFindData, DWORD dwFlags, DWORD_PTR dwContext);
version(UNICODE)
	alias GopherFindFirstFileW GopherFindFirstFile;
else
	alias GopherFindFirstFileA GopherFindFirstFile;

export extern(Windows) HINTERNET GopherOpenFileA(HINTERNET hConnect, LPCSTR lpszLocator, LPCSTR lpszView, DWORD dwFlags, DWORD_PTR dwContext);
export extern(Windows) HINTERNET GopherOpenFileW(HINTERNET hConnect, LPCWSTR lpszLocator, LPCWSTR lpszView, DWORD dwFlags, DWORD_PTR dwContext);
version(UNICODE)
	alias GopherOpenFileW GopherOpenFile;
else
	alias GopherOpenFileA GopherOpenFile;

alias extern(Windows) BOOL function(LPGOPHER_ATTRIBUTE_TYPE lpAttributeInfo, DWORD dwError) GOPHER_ATTRIBUTE_ENUMERATOR;

export extern(Windows) BOOL GopherGetAttributeA(HINTERNET hConnect, LPCSTR lpszLocator, LPCSTR lpszAttributeName, LPBYTE lpBuffer, DWORD dwBufferLength, LPDWORD lpdwCharactersReturned, GOPHER_ATTRIBUTE_ENUMERATOR lpfnEnumerator, DWORD_PTR dwContext);
export extern(Windows) BOOL GopherGetAttributeW(HINTERNET hConnect, LPCWSTR lpszLocator, LPCWSTR lpszAttributeName, LPBYTE lpBuffer, DWORD dwBufferLength, LPDWORD lpdwCharactersReturned, GOPHER_ATTRIBUTE_ENUMERATOR lpfnEnumerator, DWORD_PTR dwContext);
version(UNICODE)
	alias GopherGetAttributeW GopherGetAttribute;
else
	alias GopherGetAttributeA GopherGetAttribute;

enum {
	HTTP_MAJOR_VERSION = 1,
	HTTP_MINOR_VERSION = 0,
}

const char* HTTP_VERSIONA = "HTTP/1.0";
const wchar* HTTP_VERSIONW = "HTTP/1.0";

version(UNICODE)
	alias HTTP_VERSIONW HTTP_VERSION;
else
	alias HTTP_VERSIONA HTTP_VERSION;

enum {
	HTTP_QUERY_MIME_VERSION              = 0,
	HTTP_QUERY_CONTENT_TYPE              = 1,
	HTTP_QUERY_CONTENT_TRANSFER_ENCODING = 2,
	HTTP_QUERY_CONTENT_ID                = 3,
	HTTP_QUERY_CONTENT_DESCRIPTION       = 4,
	HTTP_QUERY_CONTENT_LENGTH            = 5,
	HTTP_QUERY_CONTENT_LANGUAGE          = 6,
	HTTP_QUERY_ALLOW                     = 7,
	HTTP_QUERY_PUBLIC                    = 8,
	HTTP_QUERY_DATE                      = 9,
	HTTP_QUERY_EXPIRES                   = 10,
	HTTP_QUERY_LAST_MODIFIED             = 11,
	HTTP_QUERY_MESSAGE_ID                = 12,
	HTTP_QUERY_URI                       = 13,
	HTTP_QUERY_DERIVED_FROM              = 14,
	HTTP_QUERY_COST                      = 15,
	HTTP_QUERY_LINK                      = 16,
	HTTP_QUERY_PRAGMA                    = 17,
	HTTP_QUERY_VERSION                   = 18,
	HTTP_QUERY_STATUS_CODE               = 19,
	HTTP_QUERY_STATUS_TEXT               = 20,
	HTTP_QUERY_RAW_HEADERS               = 21,
	HTTP_QUERY_RAW_HEADERS_CRLF          = 22,
	HTTP_QUERY_CONNECTION                = 23,
	HTTP_QUERY_ACCEPT                    = 24,
	HTTP_QUERY_ACCEPT_CHARSET            = 25,
	HTTP_QUERY_ACCEPT_ENCODING           = 26,
	HTTP_QUERY_ACCEPT_LANGUAGE           = 27,
	HTTP_QUERY_AUTHORIZATION             = 28,
	HTTP_QUERY_CONTENT_ENCODING          = 29,
	HTTP_QUERY_FORWARDED                 = 30,
	HTTP_QUERY_FROM                      = 31,
	HTTP_QUERY_IF_MODIFIED_SINCE         = 32,
	HTTP_QUERY_LOCATION                  = 33,
	HTTP_QUERY_ORIG_URI                  = 34,
	HTTP_QUERY_REFERER                   = 35,
	HTTP_QUERY_RETRY_AFTER               = 36,
	HTTP_QUERY_SERVER                    = 37,
	HTTP_QUERY_TITLE                     = 38,
	HTTP_QUERY_USER_AGENT                = 39,
	HTTP_QUERY_WWW_AUTHENTICATE          = 40,
	HTTP_QUERY_PROXY_AUTHENTICATE        = 41,
	HTTP_QUERY_ACCEPT_RANGES             = 42,
	HTTP_QUERY_SET_COOKIE                = 43,
	HTTP_QUERY_COOKIE                    = 44,
	HTTP_QUERY_REQUEST_METHOD            = 45,
	HTTP_QUERY_REFRESH                   = 46,
	HTTP_QUERY_CONTENT_DISPOSITION       = 47,
	HTTP_QUERY_AGE                       = 48,
	HTTP_QUERY_CACHE_CONTROL             = 49,
	HTTP_QUERY_CONTENT_BASE              = 50,
	HTTP_QUERY_CONTENT_LOCATION          = 51,
	HTTP_QUERY_CONTENT_MD5               = 52,
	HTTP_QUERY_CONTENT_RANGE             = 53,
	HTTP_QUERY_ETAG                      = 54,
	HTTP_QUERY_HOST                      = 55,
	HTTP_QUERY_IF_MATCH                  = 56,
	HTTP_QUERY_IF_NONE_MATCH             = 57,
	HTTP_QUERY_IF_RANGE                  = 58,
	HTTP_QUERY_IF_UNMODIFIED_SINCE       = 59,
	HTTP_QUERY_MAX_FORWARDS              = 60,
	HTTP_QUERY_PROXY_AUTHORIZATION       = 61,
	HTTP_QUERY_RANGE                     = 62,
	HTTP_QUERY_TRANSFER_ENCODING         = 63,
	HTTP_QUERY_UPGRADE                   = 64,
	HTTP_QUERY_VARY                      = 65,
	HTTP_QUERY_VIA                       = 66,
	HTTP_QUERY_WARNING                   = 67,
	HTTP_QUERY_EXPECT                    = 68,
	HTTP_QUERY_PROXY_CONNECTION          = 69,
	HTTP_QUERY_UNLESS_MODIFIED_SINCE     = 70,
	HTTP_QUERY_ECHO_REQUEST              = 71,
	HTTP_QUERY_ECHO_REPLY                = 72,
	HTTP_QUERY_ECHO_HEADERS              = 73,
	HTTP_QUERY_ECHO_HEADERS_CRLF         = 74,
	HTTP_QUERY_PROXY_SUPPORT             = 75,
	HTTP_QUERY_AUTHENTICATION_INFO       = 76,
	HTTP_QUERY_PASSPORT_URLS             = 77,
	HTTP_QUERY_PASSPORT_CONFIG           = 78,
	HTTP_QUERY_MAX                       = 78,
	HTTP_QUERY_CUSTOM                    = 65535,
	HTTP_QUERY_FLAG_REQUEST_HEADERS      = 0x80000000,
	HTTP_QUERY_FLAG_SYSTEMTIME           = 0x40000000,
	HTTP_QUERY_FLAG_NUMBER               = 0x20000000,
	HTTP_QUERY_FLAG_COALESCE             = 0x10000000,
	HTTP_QUERY_FLAG_NUMBER64             = 0x08000000,
	HTTP_QUERY_MODIFIER_FLAGS_MASK       = HTTP_QUERY_FLAG_REQUEST_HEADERS  | HTTP_QUERY_FLAG_SYSTEMTIME  | HTTP_QUERY_FLAG_NUMBER  | HTTP_QUERY_FLAG_COALESCE  | HTTP_QUERY_FLAG_NUMBER64  ,
	HTTP_QUERY_HEADER_MASK               = ~HTTP_QUERY_MODIFIER_FLAGS_MASK,
}

enum {
	HTTP_STATUS_CONTINUE           = 100,
	HTTP_STATUS_SWITCH_PROTOCOLS   = 101,
	HTTP_STATUS_OK                 = 200,
	HTTP_STATUS_CREATED            = 201,
	HTTP_STATUS_ACCEPTED           = 202,
	HTTP_STATUS_PARTIAL            = 203,
	HTTP_STATUS_NO_CONTENT         = 204,
	HTTP_STATUS_RESET_CONTENT      = 205,
	HTTP_STATUS_PARTIAL_CONTENT    = 206,
	HTTP_STATUS_AMBIGUOUS          = 300,
	HTTP_STATUS_MOVED              = 301,
	HTTP_STATUS_REDIRECT           = 302,
	HTTP_STATUS_REDIRECT_METHOD    = 303,
	HTTP_STATUS_NOT_MODIFIED       = 304,
	HTTP_STATUS_USE_PROXY          = 305,
	HTTP_STATUS_REDIRECT_KEEP_VERB = 307,
	HTTP_STATUS_BAD_REQUEST        = 400,
	HTTP_STATUS_DENIED             = 401,
	HTTP_STATUS_PAYMENT_REQ        = 402,
	HTTP_STATUS_FORBIDDEN          = 403,
	HTTP_STATUS_NOT_FOUND          = 404,
	HTTP_STATUS_BAD_METHOD         = 405,
	HTTP_STATUS_NONE_ACCEPTABLE    = 406,
	HTTP_STATUS_PROXY_AUTH_REQ     = 407,
	HTTP_STATUS_REQUEST_TIMEOUT    = 408,
	HTTP_STATUS_CONFLICT           = 409,
	HTTP_STATUS_GONE               = 410,
	HTTP_STATUS_LENGTH_REQUIRED    = 411,
	HTTP_STATUS_PRECOND_FAILED     = 412,
	HTTP_STATUS_REQUEST_TOO_LARGE  = 413,
	HTTP_STATUS_URI_TOO_LONG       = 414,
	HTTP_STATUS_UNSUPPORTED_MEDIA  = 415,
	HTTP_STATUS_RETRY_WITH         = 449,
	HTTP_STATUS_SERVER_ERROR       = 500,
	HTTP_STATUS_NOT_SUPPORTED      = 501,
	HTTP_STATUS_BAD_GATEWAY        = 502,
	HTTP_STATUS_SERVICE_UNAVAIL    = 503,
	HTTP_STATUS_GATEWAY_TIMEOUT    = 504,
	HTTP_STATUS_VERSION_NOT_SUP    = 505,
	HTTP_STATUS_FIRST              = HTTP_STATUS_CONTINUE,
	HTTP_STATUS_LAST               = HTTP_STATUS_VERSION_NOT_SUP,
}

export extern(Windows) HINTERNET HttpOpenRequestA(HINTERNET hConnect, LPCSTR lpszVerb, LPCSTR lpszObjectName, LPCSTR lpszVersion, LPCSTR lpszReferrer, LPCSTR* lplpszAcceptTypes, DWORD dwFlags, DWORD_PTR dwContext);
export extern(Windows) HINTERNET HttpOpenRequestW(HINTERNET hConnect, LPCWSTR lpszVerb, LPCWSTR lpszObjectName, LPCWSTR lpszVersion, LPCWSTR lpszReferrer, LPCWSTR* lplpszAcceptTypes, DWORD dwFlags, DWORD_PTR dwContext);
version(UNICODE)
	alias HttpOpenRequestW HttpOpenRequest;
else
	alias HttpOpenRequestA HttpOpenRequest;

export extern(Windows) BOOL HttpAddRequestHeadersA(HINTERNET hRequest, LPCSTR lpszHeaders, DWORD dwHeadersLength, DWORD dwModifiers);
export extern(Windows) BOOL HttpAddRequestHeadersW(HINTERNET hRequest, LPCWSTR lpszHeaders, DWORD dwHeadersLength, DWORD dwModifiers);
version(UNICODE)
	alias HttpAddRequestHeadersW HttpAddRequestHeaders;
else
	alias HttpAddRequestHeadersA HttpAddRequestHeaders;

enum {
	HTTP_ADDREQ_INDEX_MASK                   = 0x0000FFFF,
	HTTP_ADDREQ_FLAGS_MASK                   = 0xFFFF0000,
	HTTP_ADDREQ_FLAG_ADD_IF_NEW              = 0x10000000,
	HTTP_ADDREQ_FLAG_ADD                     = 0x20000000,
	HTTP_ADDREQ_FLAG_COALESCE_WITH_COMMA     = 0x40000000,
	HTTP_ADDREQ_FLAG_COALESCE_WITH_SEMICOLON = 0x01000000,
	HTTP_ADDREQ_FLAG_COALESCE                = HTTP_ADDREQ_FLAG_COALESCE_WITH_COMMA,
	HTTP_ADDREQ_FLAG_REPLACE                 = 0x80000000,
}

export extern(Windows) BOOL HttpSendRequestA(HINTERNET hRequest, LPCSTR lpszHeaders, DWORD dwHeadersLength, LPVOID lpOptional, DWORD dwOptionalLength);
export extern(Windows) BOOL HttpSendRequestW(HINTERNET hRequest, LPCWSTR lpszHeaders, DWORD dwHeadersLength, LPVOID lpOptional, DWORD dwOptionalLength);
version(UNICODE)
	alias HttpSendRequestW HttpSendRequest;
else
	alias HttpSendRequestA HttpSendRequest;

export extern(Windows) BOOL HttpSendRequestExA(HINTERNET hRequest, LPINTERNET_BUFFERSA lpBuffersIn, LPINTERNET_BUFFERSA lpBuffersOut, DWORD dwFlags, DWORD_PTR dwContext);
export extern(Windows) BOOL HttpSendRequestExW(HINTERNET hRequest, LPINTERNET_BUFFERSW lpBuffersIn, LPINTERNET_BUFFERSW lpBuffersOut, DWORD dwFlags, DWORD_PTR dwContext);
version(UNICODE)
	alias HttpSendRequestExW HttpSendRequestEx;
else
	alias HttpSendRequestExA HttpSendRequestEx;

enum {
	HSR_ASYNC       = WININET_API_FLAG_ASYNC,
	HSR_SYNC        = WININET_API_FLAG_SYNC,
	HSR_USE_CONTEXT = WININET_API_FLAG_USE_CONTEXT,
	HSR_INITIATE    = 0x00000008,
	HSR_DOWNLOAD    = 0x00000010,
	HSR_CHUNKED     = 0x00000020,
}

export extern(Windows) BOOL HttpEndRequestA(HINTERNET hRequest, LPINTERNET_BUFFERSA lpBuffersOut, DWORD dwFlags, DWORD_PTR dwContext);
export extern(Windows) BOOL HttpEndRequestW(HINTERNET hRequest, LPINTERNET_BUFFERSW lpBuffersOut, DWORD dwFlags, DWORD_PTR dwContext);
version(UNICODE)
	alias HttpEndRequestW HttpEndRequest;
else
	alias HttpEndRequestA HttpEndRequest;

export extern(Windows) BOOL HttpQueryInfoA(HINTERNET hRequest, DWORD dwInfoLevel, LPVOID lpBuffer, LPDWORD lpdwBufferLength, LPDWORD lpdwIndex);
export extern(Windows) BOOL HttpQueryInfoW(HINTERNET hRequest, DWORD dwInfoLevel, LPVOID lpBuffer, LPDWORD lpdwBufferLength, LPDWORD lpdwIndex);
version(UNICODE)
	alias HttpQueryInfoW HttpQueryInfo;
else
	alias HttpQueryInfoA HttpQueryInfo;

enum {
	INTERNET_COOKIE_IS_SECURE       = 0x01,
	INTERNET_COOKIE_IS_SESSION      = 0x02,
	INTERNET_COOKIE_THIRD_PARTY     = 0x10,
	INTERNET_COOKIE_PROMPT_REQUIRED = 0x20,
	INTERNET_COOKIE_EVALUATE_P3P    = 0x40,
	INTERNET_COOKIE_APPLY_P3P       = 0x80,
	INTERNET_COOKIE_P3P_ENABLED     = 0x100,
	INTERNET_COOKIE_IS_RESTRICTED   = 0x200,
	INTERNET_COOKIE_IE6             = 0x400,
	INTERNET_COOKIE_IS_LEGACY       = 0x800,
	INTERNET_COOKIE_NON_SCRIPT      = 0x00001000,
	INTERNET_COOKIE_HTTPONLY        = 0x00002000,
}

export extern(Windows) BOOL InternetSetCookieA(LPCSTR lpszUrl, LPCSTR lpszCookieName, LPCSTR lpszCookieData);
export extern(Windows) BOOL InternetSetCookieW(LPCWSTR lpszUrl, LPCWSTR lpszCookieName, LPCWSTR lpszCookieData);
version(UNICODE)
	alias InternetSetCookieW InternetSetCookie;
else
	alias InternetSetCookieA InternetSetCookie;

export extern(Windows) BOOL InternetGetCookieA(LPCSTR lpszUrl, LPCSTR lpszCookieName, LPSTR lpszCookieData, LPDWORD lpdwSize);
export extern(Windows) BOOL InternetGetCookieW(LPCWSTR lpszUrl, LPCWSTR lpszCookieName, LPWSTR lpszCookieData, LPDWORD lpdwSize);
version(UNICODE)
	alias InternetGetCookieW InternetGetCookie;
else
	alias InternetGetCookieA InternetGetCookie;

export extern(Windows) DWORD InternetSetCookieExA(LPCSTR lpszUrl, LPCSTR lpszCookieName, LPCSTR lpszCookieData, DWORD dwFlags, DWORD_PTR dwReserved);
export extern(Windows) DWORD InternetSetCookieExW(LPCWSTR lpszUrl, LPCWSTR lpszCookieName, LPCWSTR lpszCookieData, DWORD dwFlags, DWORD_PTR dwReserved);
version(UNICODE)
	alias InternetSetCookieExW InternetSetCookieEx;
else
	alias InternetSetCookieExA InternetSetCookieEx;

export extern(Windows) BOOL InternetGetCookieExA(LPCSTR lpszUrl, LPCSTR lpszCookieName, LPSTR lpszCookieData, LPDWORD lpdwSize, DWORD dwFlags, LPVOID lpReserved);
export extern(Windows) BOOL InternetGetCookieExW(LPCWSTR lpszUrl, LPCWSTR lpszCookieName, LPWSTR lpszCookieData, LPDWORD lpdwSize, DWORD dwFlags, LPVOID lpReserved);
version(UNICODE)
	alias InternetGetCookieExW InternetGetCookieEx;
else
	alias InternetGetCookieExA InternetGetCookieEx;

export extern(Windows) DWORD InternetAttemptConnect(DWORD dwReserved);

export extern(Windows) BOOL InternetCheckConnectionA(LPCSTR lpszUrl, DWORD dwFlags, DWORD dwReserved);
export extern(Windows) BOOL InternetCheckConnectionW(LPCWSTR lpszUrl, DWORD dwFlags, DWORD dwReserved);
version(UNICODE)
	alias InternetCheckConnectionW InternetCheckConnection;
else
	alias InternetCheckConnectionA InternetCheckConnection;

enum FLAG_ICC_FORCE_CONNECTION = 0x00000001;

enum {
	FLAGS_ERROR_UI_FILTER_FOR_ERRORS    = 0x01,
	FLAGS_ERROR_UI_FLAGS_CHANGE_OPTIONS = 0x02,
	FLAGS_ERROR_UI_FLAGS_GENERATE_DATA  = 0x04,
	FLAGS_ERROR_UI_FLAGS_NO_UI          = 0x08,
	FLAGS_ERROR_UI_SERIALIZE_DIALOGS    = 0x10,
}

DWORD InternetAuthNotifyCallback(DWORD_PTR dwContext, DWORD dwReturn, LPVOID lpReserved);
alias extern(Windows) DWORD function(DWORD_PTR, DWORD, LPVOID) PFN_AUTH_NOTIFY;

version(Win64){
	align(8)
	struct INTERNET_AUTH_NOTIFY_DATA {
		DWORD cbStruct;
		DWORD dwOptions;
		PFN_AUTH_NOTIFY pfnNotify;
		DWORD_PTR dwContext;
	}
}else{
	align(4)
	struct INTERNET_AUTH_NOTIFY_DATA {
		DWORD cbStruct;
		DWORD dwOptions;
		PFN_AUTH_NOTIFY pfnNotify;
		DWORD_PTR dwContext;
	}
}

export extern(Windows) BOOL ResumeSuspendedDownload(HINTERNET hRequest, DWORD dwResultCode);

export extern(Windows) DWORD InternetErrorDlg(HWND hWnd, HINTERNET hRequest, DWORD dwError, DWORD dwFlags, LPVOID* lppvData);

export extern(Windows) DWORD InternetConfirmZoneCrossingA(HWND hWnd, LPSTR szUrlPrev, LPSTR szUrlNew, BOOL bPost);
export extern(Windows) DWORD InternetConfirmZoneCrossingW(HWND hWnd, LPWSTR szUrlPrev, LPWSTR szUrlNew, BOOL bPost);
version(UNICODE)
	alias InternetConfirmZoneCrossingW InternetConfirmZoneCrossing;
else
	alias InternetConfirmZoneCrossingA InternetConfirmZoneCrossing;

enum {
	INTERNET_ERROR_BASE                              = 12000,
	ERROR_INTERNET_OUT_OF_HANDLES                    = INTERNET_ERROR_BASE + 1,
	ERROR_INTERNET_TIMEOUT                           = INTERNET_ERROR_BASE + 2,
	ERROR_INTERNET_EXTENDED_ERROR                    = INTERNET_ERROR_BASE + 3,
	ERROR_INTERNET_INTERNAL_ERROR                    = INTERNET_ERROR_BASE + 4,
	ERROR_INTERNET_INVALID_URL                       = INTERNET_ERROR_BASE + 5,
	ERROR_INTERNET_UNRECOGNIZED_SCHEME               = INTERNET_ERROR_BASE + 6,
	ERROR_INTERNET_NAME_NOT_RESOLVED                 = INTERNET_ERROR_BASE + 7,
	ERROR_INTERNET_PROTOCOL_NOT_FOUND                = INTERNET_ERROR_BASE + 8,
	ERROR_INTERNET_INVALID_OPTION                    = INTERNET_ERROR_BASE + 9,
	ERROR_INTERNET_BAD_OPTION_LENGTH                 = INTERNET_ERROR_BASE + 10,
	ERROR_INTERNET_OPTION_NOT_SETTABLE               = INTERNET_ERROR_BASE + 11,
	ERROR_INTERNET_SHUTDOWN                          = INTERNET_ERROR_BASE + 12,
	ERROR_INTERNET_INCORRECT_USER_NAME               = INTERNET_ERROR_BASE + 13,
	ERROR_INTERNET_INCORRECT_PASSWORD                = INTERNET_ERROR_BASE + 14,
	ERROR_INTERNET_LOGIN_FAILURE                     = INTERNET_ERROR_BASE + 15,
	ERROR_INTERNET_INVALID_OPERATION                 = INTERNET_ERROR_BASE + 16,
	ERROR_INTERNET_OPERATION_CANCELLED               = INTERNET_ERROR_BASE + 17,
	ERROR_INTERNET_INCORRECT_HANDLE_TYPE             = INTERNET_ERROR_BASE + 18,
	ERROR_INTERNET_INCORRECT_HANDLE_STATE            = INTERNET_ERROR_BASE + 19,
	ERROR_INTERNET_NOT_PROXY_REQUEST                 = INTERNET_ERROR_BASE + 20,
	ERROR_INTERNET_REGISTRY_VALUE_NOT_FOUND          = INTERNET_ERROR_BASE + 21,
	ERROR_INTERNET_BAD_REGISTRY_PARAMETER            = INTERNET_ERROR_BASE + 22,
	ERROR_INTERNET_NO_DIRECT_ACCESS                  = INTERNET_ERROR_BASE + 23,
	ERROR_INTERNET_NO_CONTEXT                        = INTERNET_ERROR_BASE + 24,
	ERROR_INTERNET_NO_CALLBACK                       = INTERNET_ERROR_BASE + 25,
	ERROR_INTERNET_REQUEST_PENDING                   = INTERNET_ERROR_BASE + 26,
	ERROR_INTERNET_INCORRECT_FORMAT                  = INTERNET_ERROR_BASE + 27,
	ERROR_INTERNET_ITEM_NOT_FOUND                    = INTERNET_ERROR_BASE + 28,
	ERROR_INTERNET_CANNOT_CONNECT                    = INTERNET_ERROR_BASE + 29,
	ERROR_INTERNET_CONNECTION_ABORTED                = INTERNET_ERROR_BASE + 30,
	ERROR_INTERNET_CONNECTION_RESET                  = INTERNET_ERROR_BASE + 31,
	ERROR_INTERNET_FORCE_RETRY                       = INTERNET_ERROR_BASE + 32,
	ERROR_INTERNET_INVALID_PROXY_REQUEST             = INTERNET_ERROR_BASE + 33,
	ERROR_INTERNET_NEED_UI                           = INTERNET_ERROR_BASE + 34,
	ERROR_INTERNET_HANDLE_EXISTS                     = INTERNET_ERROR_BASE + 36,
	ERROR_INTERNET_SEC_CERT_DATE_INVALID             = INTERNET_ERROR_BASE + 37,
	ERROR_INTERNET_SEC_CERT_CN_INVALID               = INTERNET_ERROR_BASE + 38,
	ERROR_INTERNET_HTTP_TO_HTTPS_ON_REDIR            = INTERNET_ERROR_BASE + 39,
	ERROR_INTERNET_HTTPS_TO_HTTP_ON_REDIR            = INTERNET_ERROR_BASE + 40,
	ERROR_INTERNET_MIXED_SECURITY                    = INTERNET_ERROR_BASE + 41,
	ERROR_INTERNET_CHG_POST_IS_NON_SECURE            = INTERNET_ERROR_BASE + 42,
	ERROR_INTERNET_POST_IS_NON_SECURE                = INTERNET_ERROR_BASE + 43,
	ERROR_INTERNET_CLIENT_AUTH_CERT_NEEDED           = INTERNET_ERROR_BASE + 44,
	ERROR_INTERNET_INVALID_CA                        = INTERNET_ERROR_BASE + 45,
	ERROR_INTERNET_CLIENT_AUTH_NOT_SETUP             = INTERNET_ERROR_BASE + 46,
	ERROR_INTERNET_ASYNC_THREAD_FAILED               = INTERNET_ERROR_BASE + 47,
	ERROR_INTERNET_REDIRECT_SCHEME_CHANGE            = INTERNET_ERROR_BASE + 48,
	ERROR_INTERNET_DIALOG_PENDING                    = INTERNET_ERROR_BASE + 49,
	ERROR_INTERNET_RETRY_DIALOG                      = INTERNET_ERROR_BASE + 50,
	ERROR_INTERNET_HTTPS_HTTP_SUBMIT_REDIR           = INTERNET_ERROR_BASE + 52,
	ERROR_INTERNET_INSERT_CDROM                      = INTERNET_ERROR_BASE + 53,
	ERROR_INTERNET_FORTEZZA_LOGIN_NEEDED             = INTERNET_ERROR_BASE + 54,
	ERROR_INTERNET_SEC_CERT_ERRORS                   = INTERNET_ERROR_BASE + 55,
	ERROR_INTERNET_SEC_CERT_NO_REV                   = INTERNET_ERROR_BASE + 56,
	ERROR_INTERNET_SEC_CERT_REV_FAILED               = INTERNET_ERROR_BASE + 57,
	ERROR_FTP_TRANSFER_IN_PROGRESS                   = INTERNET_ERROR_BASE + 110,
	ERROR_FTP_DROPPED                                = INTERNET_ERROR_BASE + 111,
	ERROR_FTP_NO_PASSIVE_MODE                        = INTERNET_ERROR_BASE + 112,
	ERROR_GOPHER_PROTOCOL_ERROR                      = INTERNET_ERROR_BASE + 130,
	ERROR_GOPHER_NOT_FILE                            = INTERNET_ERROR_BASE + 131,
	ERROR_GOPHER_DATA_ERROR                          = INTERNET_ERROR_BASE + 132,
	ERROR_GOPHER_END_OF_DATA                         = INTERNET_ERROR_BASE + 133,
	ERROR_GOPHER_INVALID_LOCATOR                     = INTERNET_ERROR_BASE + 134,
	ERROR_GOPHER_INCORRECT_LOCATOR_TYPE              = INTERNET_ERROR_BASE + 135,
	ERROR_GOPHER_NOT_GOPHER_PLUS                     = INTERNET_ERROR_BASE + 136,
	ERROR_GOPHER_ATTRIBUTE_NOT_FOUND                 = INTERNET_ERROR_BASE + 137,
	ERROR_GOPHER_UNKNOWN_LOCATOR                     = INTERNET_ERROR_BASE + 138,
	ERROR_HTTP_HEADER_NOT_FOUND                      = INTERNET_ERROR_BASE + 150,
	ERROR_HTTP_DOWNLEVEL_SERVER                      = INTERNET_ERROR_BASE + 151,
	ERROR_HTTP_INVALID_SERVER_RESPONSE               = INTERNET_ERROR_BASE + 152,
	ERROR_HTTP_INVALID_HEADER                        = INTERNET_ERROR_BASE + 153,
	ERROR_HTTP_INVALID_QUERY_REQUEST                 = INTERNET_ERROR_BASE + 154,
	ERROR_HTTP_HEADER_ALREADY_EXISTS                 = INTERNET_ERROR_BASE + 155,
	ERROR_HTTP_REDIRECT_FAILED                       = INTERNET_ERROR_BASE + 156,
	ERROR_HTTP_NOT_REDIRECTED                        = INTERNET_ERROR_BASE + 160,
	ERROR_HTTP_COOKIE_NEEDS_CONFIRMATION             = INTERNET_ERROR_BASE + 161,
	ERROR_HTTP_COOKIE_DECLINED                       = INTERNET_ERROR_BASE + 162,
	ERROR_HTTP_REDIRECT_NEEDS_CONFIRMATION           = INTERNET_ERROR_BASE + 168,
	ERROR_INTERNET_SECURITY_CHANNEL_ERROR            = INTERNET_ERROR_BASE + 157,
	ERROR_INTERNET_UNABLE_TO_CACHE_FILE              = INTERNET_ERROR_BASE + 158,
	ERROR_INTERNET_TCPIP_NOT_INSTALLED               = INTERNET_ERROR_BASE + 159,
	ERROR_INTERNET_DISCONNECTED                      = INTERNET_ERROR_BASE + 163,
	ERROR_INTERNET_SERVER_UNREACHABLE                = INTERNET_ERROR_BASE + 164,
	ERROR_INTERNET_PROXY_SERVER_UNREACHABLE          = INTERNET_ERROR_BASE + 165,
	ERROR_INTERNET_BAD_AUTO_PROXY_SCRIPT             = INTERNET_ERROR_BASE + 166,
	ERROR_INTERNET_UNABLE_TO_DOWNLOAD_SCRIPT         = INTERNET_ERROR_BASE + 167,
	ERROR_INTERNET_SEC_INVALID_CERT                  = INTERNET_ERROR_BASE + 169,
	ERROR_INTERNET_SEC_CERT_REVOKED                  = INTERNET_ERROR_BASE + 170,
	ERROR_INTERNET_FAILED_DUETOSECURITYCHECK         = INTERNET_ERROR_BASE + 171,
	ERROR_INTERNET_NOT_INITIALIZED                   = INTERNET_ERROR_BASE + 172,
	ERROR_INTERNET_NEED_MSN_SSPI_PKG                 = INTERNET_ERROR_BASE + 173,
	ERROR_INTERNET_LOGIN_FAILURE_DISPLAY_ENTITY_BODY = INTERNET_ERROR_BASE + 174,
	ERROR_INTERNET_DECODING_FAILED                   = INTERNET_ERROR_BASE + 175,
	INTERNET_ERROR_LAST                              = ERROR_INTERNET_DECODING_FAILED,
}

enum {
	NORMAL_CACHE_ENTRY           = 0x00000001,
	STICKY_CACHE_ENTRY           = 0x00000004,
	EDITED_CACHE_ENTRY           = 0x00000008,
	TRACK_OFFLINE_CACHE_ENTRY    = 0x00000010,
	TRACK_ONLINE_CACHE_ENTRY     = 0x00000020,
	SPARSE_CACHE_ENTRY           = 0x00010000,
	COOKIE_CACHE_ENTRY           = 0x00100000,
	URLHISTORY_CACHE_ENTRY       = 0x00200000,
	URLCACHE_FIND_DEFAULT_FILTER = NORMAL_CACHE_ENTRY  | COOKIE_CACHE_ENTRY  | URLHISTORY_CACHE_ENTRY  | TRACK_OFFLINE_CACHE_ENTRY  | TRACK_ONLINE_CACHE_ENTRY  | STICKY_CACHE_ENTRY,
}

version(Win64){
	align(8)
	struct INTERNET_CACHE_ENTRY_INFOA {
		DWORD dwStructSize;
		LPSTR lpszSourceUrlName;
		LPSTR lpszLocalFileName;
		DWORD CacheEntryType;
		DWORD dwUseCount;
		DWORD dwHitRate;
		DWORD dwSizeLow;
		DWORD dwSizeHigh;
		FILETIME LastModifiedTime;
		FILETIME ExpireTime;
		FILETIME LastAccessTime;
		FILETIME LastSyncTime;
		LPSTR lpHeaderInfo;
		DWORD dwHeaderInfoSize;
		LPSTR lpszFileExtension;
		union {
			DWORD dwReserved;
			DWORD dwExemptDelta;
		}
	}
}else{
	align(4)
	struct INTERNET_CACHE_ENTRY_INFOA {
		DWORD dwStructSize;
		LPSTR lpszSourceUrlName;
		LPSTR lpszLocalFileName;
		DWORD CacheEntryType;
		DWORD dwUseCount;
		DWORD dwHitRate;
		DWORD dwSizeLow;
		DWORD dwSizeHigh;
		FILETIME LastModifiedTime;
		FILETIME ExpireTime;
		FILETIME LastAccessTime;
		FILETIME LastSyncTime;
		LPSTR lpHeaderInfo;
		DWORD dwHeaderInfoSize;
		LPSTR lpszFileExtension;
		union {
			DWORD dwReserved;
			DWORD dwExemptDelta;
		}
	}
}
alias INTERNET_CACHE_ENTRY_INFOA* LPINTERNET_CACHE_ENTRY_INFOA;

version(Win64){
	align(8)
	struct INTERNET_CACHE_ENTRY_INFOW {
		DWORD dwStructSize;
		LPWSTR lpszSourceUrlName;
		LPWSTR lpszLocalFileName;
		DWORD CacheEntryType;
		DWORD dwUseCount;
		DWORD dwHitRate;
		DWORD dwSizeLow;
		DWORD dwSizeHigh;
		FILETIME LastModifiedTime;
		FILETIME ExpireTime;
		FILETIME LastAccessTime;
		FILETIME LastSyncTime;
		LPWSTR lpHeaderInfo;
		DWORD dwHeaderInfoSize;
		LPWSTR lpszFileExtension;
		union {
			DWORD dwReserved;
			DWORD dwExemptDelta;
		}
	}
}else{
	align(4)
	struct INTERNET_CACHE_ENTRY_INFOW {
		DWORD dwStructSize;
		LPWSTR lpszSourceUrlName;
		LPWSTR lpszLocalFileName;
		DWORD CacheEntryType;
		DWORD dwUseCount;
		DWORD dwHitRate;
		DWORD dwSizeLow;
		DWORD dwSizeHigh;
		FILETIME LastModifiedTime;
		FILETIME ExpireTime;
		FILETIME LastAccessTime;
		FILETIME LastSyncTime;
		LPWSTR lpHeaderInfo;
		DWORD dwHeaderInfoSize;
		LPWSTR lpszFileExtension;
		union {
			DWORD dwReserved;
			DWORD dwExemptDelta;
		}
	}
}
alias INTERNET_CACHE_ENTRY_INFOW* LPINTERNET_CACHE_ENTRY_INFOW;
version(UNICODE){
	alias INTERNET_CACHE_ENTRY_INFOW INTERNET_CACHE_ENTRY_INFO;
	alias LPINTERNET_CACHE_ENTRY_INFOW LPINTERNET_CACHE_ENTRY_INFO;
}else{
	alias INTERNET_CACHE_ENTRY_INFOA INTERNET_CACHE_ENTRY_INFO;
	alias LPINTERNET_CACHE_ENTRY_INFOA LPINTERNET_CACHE_ENTRY_INFO;
}

version(Win64){
	align(8)
	struct INTERNET_CACHE_TIMESTAMPS {
		FILETIME ftExpires;
		FILETIME ftLastModified;
	}
}else{
	align(4)
	struct INTERNET_CACHE_TIMESTAMPS {
		FILETIME ftExpires;
		FILETIME ftLastModified;
	}
}
alias INTERNET_CACHE_TIMESTAMPS* LPINTERNET_CACHE_TIMESTAMPS;

alias LONGLONG GROUPID;

enum {
	CACHEGROUP_ATTRIBUTE_GET_ALL      = 0xffffffff,
	CACHEGROUP_ATTRIBUTE_BASIC        = 0x00000001,
	CACHEGROUP_ATTRIBUTE_FLAG         = 0x00000002,
	CACHEGROUP_ATTRIBUTE_TYPE         = 0x00000004,
	CACHEGROUP_ATTRIBUTE_QUOTA        = 0x00000008,
	CACHEGROUP_ATTRIBUTE_GROUPNAME    = 0x00000010,
	CACHEGROUP_ATTRIBUTE_STORAGE      = 0x00000020,
	CACHEGROUP_FLAG_NONPURGEABLE      = 0x00000001,
	CACHEGROUP_FLAG_GIDONLY           = 0x00000004,
	CACHEGROUP_FLAG_FLUSHURL_ONDELETE = 0x00000002,
	CACHEGROUP_SEARCH_ALL             = 0x00000000,
	CACHEGROUP_SEARCH_BYURL           = 0x00000001,
	CACHEGROUP_TYPE_INVALID           = 0x00000001,
	CACHEGROUP_READWRITE_MASK         = CACHEGROUP_ATTRIBUTE_TYPE  | CACHEGROUP_ATTRIBUTE_QUOTA  | CACHEGROUP_ATTRIBUTE_GROUPNAME  | CACHEGROUP_ATTRIBUTE_STORAGE,
}
enum {
	GROUPNAME_MAX_LENGTH     = 120,
	GROUP_OWNER_STORAGE_SIZE = 4,
}

version(Win64){
	align(8)
		struct INTERNET_CACHE_GROUP_INFOA {
		DWORD dwGroupSize;
		DWORD dwGroupFlags;
		DWORD dwGroupType;
		DWORD dwDiskUsage;
		DWORD dwDiskQuota;
		DWORD[GROUP_OWNER_STORAGE_SIZE] dwOwnerStorage;
		CHAR[GROUPNAME_MAX_LENGTH] szGroupName;
	}
}else{
	align(4)
		struct INTERNET_CACHE_GROUP_INFOA {
		DWORD dwGroupSize;
		DWORD dwGroupFlags;
		DWORD dwGroupType;
		DWORD dwDiskUsage;
		DWORD dwDiskQuota;
		DWORD[GROUP_OWNER_STORAGE_SIZE] dwOwnerStorage;
		CHAR[GROUPNAME_MAX_LENGTH] szGroupName;
	}
}
alias INTERNET_CACHE_GROUP_INFOA* LPINTERNET_CACHE_GROUP_INFOA;

version(Win64){
	align(8)
	struct INTERNET_CACHE_GROUP_INFOW {
		DWORD dwGroupSize;
		DWORD dwGroupFlags;
		DWORD dwGroupType;
		DWORD dwDiskUsage;
		DWORD dwDiskQuota;
		DWORD[GROUP_OWNER_STORAGE_SIZE] dwOwnerStorage;
		WCHAR[GROUPNAME_MAX_LENGTH] szGroupName;
	}
}else{
	align(4)
	struct INTERNET_CACHE_GROUP_INFOW {
		DWORD dwGroupSize;
		DWORD dwGroupFlags;
		DWORD dwGroupType;
		DWORD dwDiskUsage;
		DWORD dwDiskQuota;
		DWORD[GROUP_OWNER_STORAGE_SIZE] dwOwnerStorage;
		WCHAR[GROUPNAME_MAX_LENGTH] szGroupName;
	}
}


alias INTERNET_CACHE_GROUP_INFOW* LPINTERNET_CACHE_GROUP_INFOW;
version(UNICODE){
	alias INTERNET_CACHE_GROUP_INFOW INTERNET_CACHE_GROUP_INFO;
	alias LPINTERNET_CACHE_GROUP_INFOW LPINTERNET_CACHE_GROUP_INFO;
}else{
	alias INTERNET_CACHE_GROUP_INFOA INTERNET_CACHE_GROUP_INFO;
	alias  LPINTERNET_CACHE_GROUP_INFOA LPINTERNET_CACHE_GROUP_INFO;
}

export extern(Windows) BOOL CreateUrlCacheEntryA(LPCSTR lpszUrlName, DWORD dwExpectedFileSize, LPCSTR lpszFileExtension, LPSTR lpszFileName, DWORD dwReserved);
export extern(Windows) BOOL CreateUrlCacheEntryW(LPCWSTR lpszUrlName, DWORD dwExpectedFileSize, LPCWSTR lpszFileExtension, LPWSTR lpszFileName, DWORD dwReserved);
version(UNICODE)
	alias CreateUrlCacheEntryW CreateUrlCacheEntry;
else
	alias CreateUrlCacheEntryA CreateUrlCacheEntry;

export extern(Windows) BOOL CommitUrlCacheEntryA(LPCSTR lpszUrlName, LPCSTR lpszLocalFileName, FILETIME ExpireTime, FILETIME LastModifiedTime, DWORD CacheEntryType, LPBYTE lpHeaderInfo, DWORD dwHeaderSize, LPCSTR lpszFileExtension, LPCSTR lpszOriginalUrl);
export extern(Windows) BOOL CommitUrlCacheEntryW(LPCWSTR lpszUrlName, LPCWSTR lpszLocalFileName, FILETIME ExpireTime, FILETIME LastModifiedTime, DWORD CacheEntryType, LPWSTR lpszHeaderInfo, DWORD dwHeaders, LPCWSTR lpszFileExtension, LPCWSTR lpszOriginalUrl);
version(UNICODE)
	alias CommitUrlCacheEntryW CommitUrlCacheEntry;
else
	alias CommitUrlCacheEntryA CommitUrlCacheEntry;

export extern(Windows) BOOL RetrieveUrlCacheEntryFileA(LPCSTR lpszUrlName, LPINTERNET_CACHE_ENTRY_INFOA lpCacheEntryInfo, LPDWORD lpcbCacheEntryInfo, DWORD dwReserved);
export extern(Windows) BOOL RetrieveUrlCacheEntryFileW(LPCWSTR lpszUrlName, LPINTERNET_CACHE_ENTRY_INFOW lpCacheEntryInfo, LPDWORD lpcbCacheEntryInfo, DWORD dwReserved);
version(UNICODE)
	alias RetrieveUrlCacheEntryFileW RetrieveUrlCacheEntryFile;
else
	alias RetrieveUrlCacheEntryFileA RetrieveUrlCacheEntryFile;

export extern(Windows) BOOL UnlockUrlCacheEntryFileA(LPCSTR lpszUrlName, DWORD dwReserved);
export extern(Windows) BOOL UnlockUrlCacheEntryFileW(LPCWSTR lpszUrlName, DWORD dwReserved);

version(UNICODE)
	alias UnlockUrlCacheEntryFileW UnlockUrlCacheEntryFile;
else
	alias UnlockUrlCacheEntryFileA UnlockUrlCacheEntryFile;

export extern(Windows) HANDLE RetrieveUrlCacheEntryStreamA(LPCSTR lpszUrlName, LPINTERNET_CACHE_ENTRY_INFOA lpCacheEntryInfo,LPDWORD lpcbCacheEntryInfo, BOOL fRandomRead, DWORD dwReserved);
export extern(Windows) HANDLE RetrieveUrlCacheEntryStreamW(LPCWSTR lpszUrlName, LPINTERNET_CACHE_ENTRY_INFOW lpCacheEntryInfo, LPDWORD lpcbCacheEntryInfo, BOOL fRandomRead, DWORD dwReserved);
version(UNICODE)
	alias RetrieveUrlCacheEntryStreamW RetrieveUrlCacheEntryStream;
else
	alias RetrieveUrlCacheEntryStreamA RetrieveUrlCacheEntryStream;

export extern(Windows) BOOL ReadUrlCacheEntryStream(HANDLE hUrlCacheStream, DWORD dwLocation, LPVOID lpBuffer, LPDWORD lpdwLen, DWORD Reserved);
export extern(Windows) BOOL ReadUrlCacheEntryStreamEx(HANDLE hUrlCacheStream, DWORDLONG qwLocation, LPVOID lpBuffer, LPDWORD lpdwLen);
export extern(Windows) BOOL UnlockUrlCacheEntryStream(HANDLE hUrlCacheStream, DWORD Reserved);

export extern(Windows) BOOL GetUrlCacheEntryInfoA(LPCSTR lpszUrlName, LPINTERNET_CACHE_ENTRY_INFOA lpCacheEntryInfo, LPDWORD lpcbCacheEntryInfo);
export extern(Windows) BOOL GetUrlCacheEntryInfoW(LPCWSTR lpszUrlName, LPINTERNET_CACHE_ENTRY_INFOW lpCacheEntryInfo, LPDWORD lpcbCacheEntryInfo);
version(UNICODE)
	alias GetUrlCacheEntryInfoW GetUrlCacheEntryInfo;
else
	alias GetUrlCacheEntryInfoA GetUrlCacheEntryInfo;

export extern(Windows) HANDLE FindFirstUrlCacheGroup(DWORD dwFlags, DWORD dwFilter, LPVOID lpSearchCondition, DWORD dwSearchCondition, GROUPID* lpGroupId, LPVOID lpReserved);
export extern(Windows) BOOL FindNextUrlCacheGroup(HANDLE hFind, GROUPID* lpGroupId, LPVOID lpReserved);
export extern(Windows) BOOL GetUrlCacheGroupAttributeA(GROUPID gid, DWORD dwFlags, DWORD dwAttributes, LPINTERNET_CACHE_GROUP_INFOA lpGroupInfo, LPDWORD lpdwGroupInfo, LPVOID lpReserved);
export extern(Windows) BOOL GetUrlCacheGroupAttributeW(GROUPID gid, DWORD dwFlags, DWORD dwAttributes, LPINTERNET_CACHE_GROUP_INFOW lpGroupInfo, LPDWORD lpdwGroupInfo, LPVOID lpReserved);
version(UNICODE)
	alias GetUrlCacheGroupAttributeW GetUrlCacheGroupAttribute;
else
	alias GetUrlCacheGroupAttributeA GetUrlCacheGroupAttribute;


export extern(Windows) BOOL SetUrlCacheGroupAttributeA(GROUPID gid, DWORD dwFlags, DWORD dwAttributes, LPINTERNET_CACHE_GROUP_INFOA lpGroupInfo, LPVOID lpReserved);
export extern(Windows) BOOL SetUrlCacheGroupAttributeW(GROUPID gid, DWORD dwFlags, DWORD dwAttributes, LPINTERNET_CACHE_GROUP_INFOW lpGroupInfo, LPVOID lpReserved);
version(UNICODE)
	alias SetUrlCacheGroupAttributeW SetUrlCacheGroupAttribute;
else
	alias SetUrlCacheGroupAttributeA SetUrlCacheGroupAttribute;

export extern(Windows) BOOL GetUrlCacheEntryInfoExA(LPCSTR lpszUrl, LPINTERNET_CACHE_ENTRY_INFOA lpCacheEntryInfo, LPDWORD lpcbCacheEntryInfo, LPSTR lpszRedirectUrl, LPDWORD lpcbRedirectUrl, LPVOID lpReserved, DWORD dwFlags);
export extern(Windows) BOOL GetUrlCacheEntryInfoExW(LPCWSTR lpszUrl, LPINTERNET_CACHE_ENTRY_INFOW lpCacheEntryInfo, LPDWORD lpcbCacheEntryInfo, LPWSTR lpszRedirectUrl, LPDWORD lpcbRedirectUrl, LPVOID lpReserved, DWORD dwFlags);
version(UNICODE)
	alias GetUrlCacheEntryInfoExW GetUrlCacheEntryInfoEx;
else
	alias GetUrlCacheEntryInfoExA GetUrlCacheEntryInfoEx;

enum {
	CACHE_ENTRY_ATTRIBUTE_FC    = 0x00000004,
	CACHE_ENTRY_HITRATE_FC      = 0x00000010,
	CACHE_ENTRY_MODTIME_FC      = 0x00000040,
	CACHE_ENTRY_EXPTIME_FC      = 0x00000080,
	CACHE_ENTRY_ACCTIME_FC      = 0x00000100,
	CACHE_ENTRY_SYNCTIME_FC     = 0x00000200,
	CACHE_ENTRY_HEADERINFO_FC   = 0x00000400,
	CACHE_ENTRY_EXEMPT_DELTA_FC = 0x00000800,
}

export extern(Windows) BOOL SetUrlCacheEntryInfoA(LPCSTR lpszUrlName, LPINTERNET_CACHE_ENTRY_INFOA lpCacheEntryInfo, DWORD dwFieldControl);
export extern(Windows) BOOL SetUrlCacheEntryInfoW(LPCWSTR lpszUrlName, LPINTERNET_CACHE_ENTRY_INFOW lpCacheEntryInfo, DWORD dwFieldControl);
version(UNICODE)
	alias SetUrlCacheEntryInfoW SetUrlCacheEntryInfo;
else
	alias SetUrlCacheEntryInfoA SetUrlCacheEntryInfo;

export extern(Windows) GROUPID CreateUrlCacheGroup(DWORD dwFlags, LPVOID lpReserved);
export extern(Windows) BOOL DeleteUrlCacheGroup(GROUPID GroupId, DWORD dwFlags, LPVOID lpReserved);

enum {
	INTERNET_CACHE_GROUP_ADD    = 0,
	INTERNET_CACHE_GROUP_REMOVE = 1,
}

export extern(Windows) BOOL SetUrlCacheEntryGroupA(LPCSTR lpszUrlName, DWORD dwFlags, GROUPID GroupId, LPBYTE pbGroupAttributes, DWORD cbGroupAttributes, LPVOID lpReserved);
export extern(Windows) BOOL SetUrlCacheEntryGroupW( LPCWSTR lpszUrlName, DWORD dwFlags, GROUPID GroupId, LPBYTE pbGroupAttributes, DWORD cbGroupAttributes, LPVOID lpReserved);
version(UNICODE)
	alias SetUrlCacheEntryGroupW SetUrlCacheEntryGroup;
else
	alias SetUrlCacheEntryGroupA SetUrlCacheEntryGroup;

export extern(Windows) HANDLE FindFirstUrlCacheEntryExA(LPCSTR lpszUrlSearchPattern, DWORD dwFlags, DWORD dwFilter, GROUPID GroupId, LPINTERNET_CACHE_ENTRY_INFOA lpFirstCacheEntryInfo, LPDWORD lpcbEntryInfo, LPVOID lpGroupAttributes, LPDWORD lpcbGroupAttributes,  LPVOID lpReserved);
export extern(Windows) HANDLE FindFirstUrlCacheEntryExW(LPCWSTR lpszUrlSearchPattern, DWORD dwFlags, DWORD dwFilter, GROUPID GroupId, LPINTERNET_CACHE_ENTRY_INFOW lpFirstCacheEntryInfo, LPDWORD lpcbEntryInfo, LPVOID lpGroupAttributes, LPDWORD lpcbGroupAttributes, LPVOID lpReserved);
version(UNICODE)
	alias FindFirstUrlCacheEntryExW FindFirstUrlCacheEntryEx;
else
	alias FindFirstUrlCacheEntryExA FindFirstUrlCacheEntryEx;

export extern(Windows) BOOL FindNextUrlCacheEntryExA(HANDLE hEnumHandle, LPINTERNET_CACHE_ENTRY_INFOA lpNextCacheEntryInfo, LPDWORD lpcbEntryInfo, LPVOID lpGroupAttributes, LPDWORD lpcbGroupAttributes, LPVOID lpReserved);
export extern(Windows) BOOL FindNextUrlCacheEntryExW(HANDLE hEnumHandle, LPINTERNET_CACHE_ENTRY_INFOW lpNextCacheEntryInfo, LPDWORD lpcbEntryInfo, LPVOID lpGroupAttributes, LPDWORD lpcbGroupAttributes, LPVOID lpReserved);
version(UNICODE)
	alias FindNextUrlCacheEntryExW FindNextUrlCacheEntryEx;
else
	alias FindNextUrlCacheEntryExA FindNextUrlCacheEntryEx;


export extern(Windows) HANDLE FindFirstUrlCacheEntryA(LPCSTR lpszUrlSearchPattern, LPINTERNET_CACHE_ENTRY_INFOA lpFirstCacheEntryInfo, LPDWORD lpcbCacheEntryInfo);
export extern(Windows) HANDLE FindFirstUrlCacheEntryW(LPCWSTR lpszUrlSearchPattern, LPINTERNET_CACHE_ENTRY_INFOW lpFirstCacheEntryInfo, LPDWORD lpcbCacheEntryInfo);
version(UNICODE)
	alias FindFirstUrlCacheEntryW FindFirstUrlCacheEntry;
else
	alias FindFirstUrlCacheEntryA FindFirstUrlCacheEntry;

export extern(Windows) BOOL FindNextUrlCacheEntryA(HANDLE hEnumHandle, LPINTERNET_CACHE_ENTRY_INFOA lpNextCacheEntryInfo, LPDWORD lpcbCacheEntryInfo);
export extern(Windows) BOOL FindNextUrlCacheEntryW(HANDLE hEnumHandle, LPINTERNET_CACHE_ENTRY_INFOW lpNextCacheEntryInfo, LPDWORD lpcbCacheEntryInfo);
version(UNICODE)
	alias FindNextUrlCacheEntryW FindNextUrlCacheEntry;
else
	alias FindNextUrlCacheEntryA FindNextUrlCacheEntry;

export extern(Windows) BOOL FindCloseUrlCache(HANDLE hEnumHandle);
export extern(Windows) BOOL DeleteUrlCacheEntryA(LPCSTR lpszUrlName);
export extern(Windows) BOOL DeleteUrlCacheEntryW(LPCWSTR lpszUrlName);
version(UNICODE)
	alias DeleteUrlCacheEntryW DeleteUrlCacheEntry;
else
	alias DeleteUrlCacheEntryA DeleteUrlCacheEntry;

export extern(Windows) DWORD InternetDialA(HWND hwndParent, LPSTR lpszConnectoid, DWORD dwFlags, DWORD_PTR* lpdwConnection, DWORD dwReserved);
export extern(Windows) DWORD InternetDialW(HWND hwndParent, LPWSTR lpszConnectoid, DWORD dwFlags, DWORD_PTR* lpdwConnection,DWORD dwReserved);
version(UNICODE)
	alias InternetDialW InternetDial;
else
	alias InternetDialA InternetDial;

enum {
	INTERNET_DIAL_FORCE_PROMPT = 0x2000,
	INTERNET_DIAL_SHOW_OFFLINE = 0x4000,
	INTERNET_DIAL_UNATTENDED   = 0x8000,
}

export extern(Windows) DWORD InternetHangUp(DWORD_PTR dwConnection, DWORD dwReserved);

enum {
	INTERENT_GOONLINE_REFRESH = 0x00000001,
	INTERENT_GOONLINE_MASK    = 0x00000001,
}

export extern(Windows) BOOL InternetGoOnlineA(LPCSTR lpszURL, HWND hwndParent, DWORD dwFlags);

export extern(Windows) BOOL InternetGoOnlineW(LPCWSTR lpszURL, HWND hwndParent, DWORD dwFlags);

version(UNICODE)
	alias InternetGoOnlineW InternetGoOnline;
else
	alias InternetGoOnlineA InternetGoOnline;

export extern(Windows) BOOL InternetAutodial(DWORD dwFlags, HWND hwndParent);

enum {
	INTERNET_AUTODIAL_FORCE_ONLINE         = 1,
	INTERNET_AUTODIAL_FORCE_UNATTENDED     = 2,
	INTERNET_AUTODIAL_FAILIFSECURITYCHECK  = 4,
	INTERNET_AUTODIAL_OVERRIDE_NET_PRESENT = 8,
	INTERNET_AUTODIAL_FLAGS_MASK           = INTERNET_AUTODIAL_FORCE_ONLINE | INTERNET_AUTODIAL_FORCE_UNATTENDED | INTERNET_AUTODIAL_FAILIFSECURITYCHECK | INTERNET_AUTODIAL_OVERRIDE_NET_PRESENT,
}

export extern(Windows) BOOL InternetAutodialHangup(DWORD dwReserved);
export extern(Windows) BOOL InternetGetConnectedState(LPDWORD lpdwFlags, DWORD dwReserved);
export extern(Windows) BOOL InternetGetConnectedStateExA(LPDWORD lpdwFlags, LPSTR lpszConnectionName, DWORD dwBufLen, DWORD dwReserved);
export extern(Windows) BOOL InternetGetConnectedStateExW(LPDWORD lpdwFlags, LPWSTR lpszConnectionName, DWORD dwBufLen, DWORD dwReserved);

enum {
	PROXY_AUTO_DETECT_TYPE_DHCP  = 1,
	PROXY_AUTO_DETECT_TYPE_DNS_A = 2,
}

version(Win64){
	align(8)
	struct AutoProxyHelperVtbl {
	extern(Windows):
		BOOL function (LPSTR lpszHost) IsResolvable ;
		DWORD function(LPSTR lpszIPAddress, LPDWORD lpdwIPAddressSize) GetIPAddress;
		DWORD function(LPSTR lpszHostName, LPSTR lpszIPAddress, LPDWORD lpdwIPAddressSize) ResolveHostName ;
		BOOL function(LPSTR lpszIPAddress, LPSTR lpszDest, LPSTR lpszMask) IsInNet;
		BOOL function(LPSTR lpszHost) IsResolvableEx;
		DWORD function(LPSTR lpszIPAddress, LPDWORD lpdwIPAddressSize) GetIPAddressEx ;
		DWORD function(LPSTR lpszHostName, LPSTR lpszIPAddress, LPDWORD lpdwIPAddressSize) ResolveHostNameEx;
		BOOL function(LPSTR lpszIPAddress, LPSTR lpszIPPrefix) IsInNetEx;
		DWORD function(LPSTR lpszIPAddressList, LPSTR lpszIPSortedList, LPDWORD lpdwIPSortedListSize) SortIpList;
	}
}else{
	align(4)
	struct AutoProxyHelperVtbl {
	extern(Windows):
		BOOL function (LPSTR lpszHost) IsResolvable ;
		DWORD function(LPSTR lpszIPAddress, LPDWORD lpdwIPAddressSize) GetIPAddress;
		DWORD function(LPSTR lpszHostName, LPSTR lpszIPAddress, LPDWORD lpdwIPAddressSize) ResolveHostName ;
		BOOL function(LPSTR lpszIPAddress, LPSTR lpszDest, LPSTR lpszMask) IsInNet;
		BOOL function(LPSTR lpszHost) IsResolvableEx;
		DWORD function(LPSTR lpszIPAddress, LPDWORD lpdwIPAddressSize) GetIPAddressEx ;
		DWORD function(LPSTR lpszHostName, LPSTR lpszIPAddress, LPDWORD lpdwIPAddressSize) ResolveHostNameEx;
		BOOL function(LPSTR lpszIPAddress, LPSTR lpszIPPrefix) IsInNetEx;
		DWORD function(LPSTR lpszIPAddressList, LPSTR lpszIPSortedList, LPDWORD lpdwIPSortedListSize) SortIpList;
	}
}

version(Win64){
	align(8)
	struct AUTO_PROXY_SCRIPT_BUFFER {
		DWORD dwStructSize;
		LPSTR lpszScriptBuffer;
		DWORD dwScriptBufferSize;
	}
}else{
	align(4)
	struct AUTO_PROXY_SCRIPT_BUFFER {
		DWORD dwStructSize;
		LPSTR lpszScriptBuffer;
		DWORD dwScriptBufferSize;
	}
}
alias AUTO_PROXY_SCRIPT_BUFFER* LPAUTO_PROXY_SCRIPT_BUFFER;

version(Win64){
	align(8)
	struct AutoProxyHelperFunctions {
		const(AutoProxyHelperVtbl)* lpVtbl;
	}
}else{
	align(4)
	struct AutoProxyHelperFunctions {
		const(AutoProxyHelperVtbl)* lpVtbl;
	}
}

alias extern(Windows) BOOL function(DWORD dwVersion, LPSTR lpszDownloadedTempFile, LPSTR lpszMime, AutoProxyHelperFunctions* lpAutoProxyCallbacks, LPAUTO_PROXY_SCRIPT_BUFFER lpAutoProxyScriptBuffer) pfnInternetInitializeAutoProxyDll;
alias extern(Windows) BOOL function(LPSTR lpszMime, DWORD dwReserved) pfnInternetDeInitializeAutoProxyDll;
alias extern(Windows) BOOL function(LPCSTR lpszUrl, DWORD dwUrlLength, LPSTR lpszUrlHostName, DWORD dwUrlHostNameLength, LPSTR* lplpszProxyHostName, LPDWORD lpdwProxyHostNameLength) pfnInternetGetProxyInfo;

enum{
	WPAD_CACHE_DELETE_CURRENT = 0x0,
	WPAD_CACHE_DELETE_ALL     = 0x1
}
alias int WPAD_CACHE_DELETE;

export extern(Windows) BOOL DeleteWpadCacheForNetworks(WPAD_CACHE_DELETE);
export extern(Windows) BOOL InternetInitializeAutoProxyDll(DWORD dwReserved);
export extern(Windows) BOOL DetectAutoProxyUrl(LPSTR lpszAutoProxyUrl, DWORD dwAutoProxyUrlLength, DWORD dwDetectFlags);
export extern(Windows) BOOL CreateMD5SSOHash (PWSTR pszChallengeInfo, PWSTR pwszRealm, PWSTR pwszTarget, PBYTE pbHexHash);
version(UNICODE)
	alias InternetGetConnectedStateExW InternetGetConnectedStateEx;
else
	alias InternetGetConnectedStateExA InternetGetConnectedStateEx;

enum {
	INTERNET_CONNECTION_MODEM      = 0x01,
	INTERNET_CONNECTION_LAN        = 0x02,
	INTERNET_CONNECTION_PROXY      = 0x04,
	INTERNET_CONNECTION_MODEM_BUSY = 0x08,
	INTERNET_RAS_INSTALLED         = 0x10,
	INTERNET_CONNECTION_OFFLINE    = 0x20,
	INTERNET_CONNECTION_CONFIGURED = 0x40,
}

alias DWORD function(HWND, LPCSTR, DWORD, LPDWORD) PFN_DIAL_HANDLER;

enum {
	INTERNET_CUSTOMDIAL_CONNECT             = 0,
	INTERNET_CUSTOMDIAL_UNATTENDED          = 1,
	INTERNET_CUSTOMDIAL_DISCONNECT          = 2,
	INTERNET_CUSTOMDIAL_SHOWOFFLINE         = 4,
	INTERNET_CUSTOMDIAL_SAFE_FOR_UNATTENDED = 1,
	INTERNET_CUSTOMDIAL_WILL_SUPPLY_STATE   = 2,
	INTERNET_CUSTOMDIAL_CAN_HANGUP          = 4,
}

export extern(Windows) BOOL InternetSetDialStateA(LPCSTR lpszConnectoid, DWORD dwState, DWORD dwReserved);
export extern(Windows) BOOL InternetSetDialStateW(LPCWSTR lpszConnectoid, DWORD dwState, DWORD dwReserved);
version(UNICODE)
	alias InternetSetDialStateW InternetSetDialState;
else
	alias InternetSetDialStateA InternetSetDialState;

enum INTERNET_DIALSTATE_DISCONNECTED = 1;

export extern(Windows) BOOL InternetSetPerSiteCookieDecisionA(LPCSTR pchHostName, DWORD dwDecision);
export extern(Windows) BOOL InternetSetPerSiteCookieDecisionW(LPCWSTR pchHostName, DWORD dwDecision);
version(UNICODE)
	alias InternetSetPerSiteCookieDecisionW InternetSetPerSiteCookieDecision;
else
	alias InternetSetPerSiteCookieDecisionA InternetSetPerSiteCookieDecision;

export extern(Windows) BOOL InternetGetPerSiteCookieDecisionA(LPCSTR pchHostName, uint* pResult);
export extern(Windows) BOOL InternetGetPerSiteCookieDecisionW(LPCWSTR pchHostName, uint* pResult);
version(UNICODE)
	alias InternetGetPerSiteCookieDecisionW InternetGetPerSiteCookieDecision;
else
	alias InternetGetPerSiteCookieDecisionA InternetGetPerSiteCookieDecision;

export extern(Windows) BOOL InternetClearAllPerSiteCookieDecisions();

export extern(Windows) BOOL InternetEnumPerSiteCookieDecisionA(LPSTR pszSiteName, uint* pcSiteNameSize, uint* pdwDecision, uint dwIndex);
export extern(Windows) BOOL InternetEnumPerSiteCookieDecisionW(LPWSTR pszSiteName, uint* pcSiteNameSize, uint* pdwDecision, uint dwIndex);
version(UNICODE)
	alias InternetEnumPerSiteCookieDecisionW InternetEnumPerSiteCookieDecision;
else
	alias InternetEnumPerSiteCookieDecisionA InternetEnumPerSiteCookieDecision;

enum {
	INTERNET_IDENTITY_FLAG_PRIVATE_CACHE = 0x01,
	INTERNET_IDENTITY_FLAG_SHARED_CACHE  = 0x02,
	INTERNET_IDENTITY_FLAG_CLEAR_DATA    = 0x04,
	INTERNET_IDENTITY_FLAG_CLEAR_COOKIES = 0x08,
	INTERNET_IDENTITY_FLAG_CLEAR_HISTORY = 0x10,
	INTERNET_IDENTITY_FLAG_CLEAR_CONTENT = 0x20,
}
enum {
	INTERNET_SUPPRESS_RESET_ALL           = 0x00,
	INTERNET_SUPPRESS_COOKIE_POLICY       = 0x01,
	INTERNET_SUPPRESS_COOKIE_POLICY_RESET = 0x02,
}
enum {
	PRIVACY_TEMPLATE_NO_COOKIES  = 0,
	PRIVACY_TEMPLATE_HIGH        = 1,
	PRIVACY_TEMPLATE_MEDIUM_HIGH = 2,
	PRIVACY_TEMPLATE_MEDIUM      = 3,
	PRIVACY_TEMPLATE_MEDIUM_LOW  = 4,
	PRIVACY_TEMPLATE_LOW         = 5,
	PRIVACY_TEMPLATE_CUSTOM      = 100,
	PRIVACY_TEMPLATE_ADVANCED    = 101,
	PRIVACY_TEMPLATE_MAX         = PRIVACY_TEMPLATE_LOW,
}
enum {
	PRIVACY_TYPE_FIRST_PARTY = 0,
	PRIVACY_TYPE_THIRD_PARTY = 1,
}

export extern(Windows) DWORD PrivacySetZonePreferenceW(DWORD dwZone, DWORD dwType, DWORD dwTemplate, LPCWSTR pszPreference);
export extern(Windows) DWORD PrivacyGetZonePreferenceW(DWORD dwZone, DWORD dwType, LPDWORD pdwTemplate, LPWSTR pszBuffer, LPDWORD pdwBufferLength);


}// extern(C)
