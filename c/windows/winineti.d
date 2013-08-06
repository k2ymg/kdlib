/** winineti.d

Converted from 'winineti.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.winineti;


import c.windows.sdkddkver;
import c.windows.windef;
import c.windows.wtypes;
import c.windows.wininet;
import c.windows.winbase;
import c.windows.wincrypt;
import c.windows.schannel;
import c.windows.iedial;
import c.windows.sspi;


extern(C){


enum MAX_CACHE_ENTRY_INFO_SIZE = 4096;
/*enum { move to wininet
	INTERNET_FLAG_BGUPDATE        = 0x00000008,
	INTERNET_FLAG_FTP_FOLDER_VIEW = 0x00000004,
	INTERNET_FLAGS_MASK_INTERNAL  = INTERNET_FLAGS_MASK |  INTERNET_FLAG_FTP_FOLDER_VIEW,
}*/

struct INTERNET_PREFETCH_STATUS {
	DWORD dwStatus;
	DWORD dwSize;
}
alias INTERNET_PREFETCH_STATUS* LPINTERNET_PREFETCH_STATUS;

enum {
	INTERNET_PREFETCH_PROGRESS = 0,
	INTERNET_PREFETCH_COMPLETE = 1,
	INTERNET_PREFETCH_ABORTED  = 2,
}
enum {
	INTERNET_ONLINE_OFFLINE_INFO   = INTERNET_CONNECTED_INFO,
	LPINTERNET_ONLINE_OFFLINE_INFO = LPINTERNET_CONNECTED_INFO,
}
//	dwOfflineState dwConnectedState

enum ISO_FORCE_OFFLINE = ISO_FORCE_DISCONNECTED;
enum {
	DLG_FLAGS_INVALID_CA            = 0x01000000,
	DLG_FLAGS_SEC_CERT_CN_INVALID   = 0x02000000,
	DLG_FLAGS_SEC_CERT_DATE_INVALID = 0x04000000,
	DLG_FLAGS_SEC_CERT_REV_FAILED   = 0x00800000,
}

struct INTERNET_SECURITY_INFO {
	DWORD dwSize;
	PCCERT_CONTEXT pCertificate;
	PCCERT_CHAIN_CONTEXT pcCertChain;
	SecPkgContext_ConnectionInfo connectionInfo;
	SecPkgContext_CipherInfo cipherInfo;
	PCCERT_CHAIN_CONTEXT pcUnverifiedCertChain;
	SecPkgContext_Bindings channelBindingToken;
}
alias INTERNET_SECURITY_INFO* LPINTERNET_SECURITY_INFO;

struct INTERNET_SECURITY_CONNECTION_INFO {
	DWORD dwSize;
	BOOL fSecure;
	SecPkgContext_ConnectionInfo connectionInfo;
	SecPkgContext_CipherInfo cipherInfo;
}
alias INTERNET_SECURITY_CONNECTION_INFO* LPINTERNET_SECURITY_CONNECTION_INFO;

export extern(Windows) BOOL InternetAlgIdToStringA(ALG_ID ai, LPSTR lpstr, LPDWORD lpdwBufferLength, DWORD dwReserved);
export extern(Windows) BOOL InternetAlgIdToStringW(ALG_ID ai, LPWSTR lpstr, LPDWORD lpdwBufferLength, DWORD dwReserved);
version(UNICODE)
	alias InternetAlgIdToStringW InternetAlgIdToString;
else
	alias InternetAlgIdToStringA InternetAlgIdToString;

export extern(Windows) BOOL InternetSecurityProtocolToStringA(DWORD dwProtocol, LPSTR lpstr, LPDWORD lpdwBufferLength, DWORD dwReserved);
export extern(Windows) BOOL InternetSecurityProtocolToStringW(DWORD dwProtocol, LPWSTR lpstr, LPDWORD lpdwBufferLength, DWORD dwReserved);
version(UNICODE)
	alias InternetSecurityProtocolToStringW InternetSecurityProtocolToString;
else
	alias InternetSecurityProtocolToStringA InternetSecurityProtocolToString;

static if(_WIN32_IE >= _WIN32_IE_IE70){
	export extern(Windows) BOOL InternetGetSecurityInfoByURLA(LPSTR lpszURL, PCCERT_CHAIN_CONTEXT* ppCertChain, DWORD* pdwSecureFlags);
	export extern(Windows) BOOL InternetGetSecurityInfoByURLW(LPCWSTR lpszURL, PCCERT_CHAIN_CONTEXT* ppCertChain, DWORD* pdwSecureFlags);

	version(UNICODE)
		alias InternetGetSecurityInfoByURLW InternetGetSecurityInfoByURL;
	else
		alias InternetGetSecurityInfoByURLA InternetGetSecurityInfoByURL;
}

export extern(Windows) DWORD ShowSecurityInfo(HWND hWndParent, LPINTERNET_SECURITY_INFO pSecurityInfo);
export extern(Windows) DWORD ShowX509EncodedCertificate(HWND hWndParent, LPBYTE lpCert, DWORD cbCert);
export extern(Windows) DWORD ShowClientAuthCerts(HWND hWndParent);
export extern(Windows) DWORD ParseX509EncodedCertificateForListBoxEntry(LPBYTE lpCert, DWORD cbCert, LPSTR lpszListBoxEntry, LPDWORD lpdwListBoxEntry);
export extern(Windows) BOOL InternetShowSecurityInfoByURLA(LPSTR lpszURL, HWND hwndParent);
export extern(Windows) BOOL InternetShowSecurityInfoByURLW(LPCWSTR lpszURL, HWND hwndParent);

version(UNICODE)
	alias InternetShowSecurityInfoByURLW InternetShowSecurityInfoByURL;
else
	alias InternetShowSecurityInfoByURLA InternetShowSecurityInfoByURL;

enum {
	FORTCMD_LOGON = 1,
	FORTCMD_LOGOFF = 2,
	FORTCMD_CHG_PERSONALITY = 3,
}
alias int FORTCMD;

export extern(Windows) BOOL InternetFortezzaCommand(DWORD dwCommand, HWND hwnd, DWORD_PTR dwReserved);

enum {
	FORTSTAT_INSTALLED = 0x00000001,
	FORTSTAT_LOGGEDON  = 0x00000002,
}
alias int FORTSTAT;

export extern(Windows) BOOL InternetQueryFortezzaStatus(DWORD* pdwStatus, DWORD_PTR dwReserved);
export extern(Windows) BOOL InternetDebugGetLocalTime(SYSTEMTIME* pstLocalTime, DWORD* pdwReserved);

enum {
	ICU_ESCAPE_AUTHORITY = 0x00002000,
	INTERNET_SERVICE_URL = 0,
}

HINTERNET InternetConnectUrl(HINTERNET hInternet, LPCTSTR lpszUrl, DWORD dwFlags, DWORD_PTR dwContext)
{
	return InternetConnect(hInternet, lpszUrl, INTERNET_INVALID_PORT_NUMBER, null, null, INTERNET_SERVICE_URL, dwFlags, dwContext);
}

export extern(Windows) BOOL InternetWriteFileExA(HINTERNET hFile, LPINTERNET_BUFFERSA lpBuffersIn, DWORD dwFlags, DWORD_PTR dwContext);
export extern(Windows) BOOL InternetWriteFileExW(HINTERNET hFile, LPINTERNET_BUFFERSW lpBuffersIn, DWORD dwFlags, DWORD_PTR dwContext);
version(UNICODE)
	alias InternetWriteFileExW InternetWriteFileEx;
else
	alias InternetWriteFileExA InternetWriteFileEx;

enum {
	INTERNET_OPTION_CONTEXT_VALUE_OLD            = 10,
	INTERNET_OPTION_NET_SPEED                    = 61,
	INTERNET_OPTION_SECURITY_CONNECTION_INFO     = 66,
	INTERNET_OPTION_DETECT_POST_SEND             = 71,
	INTERNET_OPTION_DISABLE_NTLM_PREAUTH         = 72,
	INTERNET_OPTION_ORIGINAL_CONNECT_FLAGS       = 97,
	INTERNET_OPTION_CERT_ERROR_FLAGS             = 98,
	INTERNET_OPTION_IGNORE_CERT_ERROR_FLAGS      = 99,
	INTERNET_OPTION_SESSION_START_TIME           = 106,
	INTERNET_OPTION_PROXY_CREDENTIALS            = 107,
	INTERNET_OPTION_EXTENDED_CALLBACKS           = 108,
	INTERNET_OPTION_PROXY_FROM_REQUEST           = 109,
	INTERNET_OPTION_ALLOW_FAILED_CONNECT_CONTENT = 110,
	INTERNET_OPTION_CACHE_PARTITION              = 111,
	INTERNET_OPTION_AUTODIAL_HWND                = 112,
	INTERNET_OPTION_SERVER_CREDENTIALS           = 113,
	INTERNET_OPTION_WPAD_SLEEP                   = 114,
	INTERNET_LAST_OPTION_INTERNAL                = INTERNET_OPTION_WPAD_SLEEP,
	INTERNET_OPTION_OFFLINE_TIMEOUT              = INTERNET_OPTION_DISCONNECTED_TIMEOUT,
	INTERNET_OPTION_LINE_STATE                   = INTERNET_OPTION_CONNECTED_STATE,
}

enum AUTH_FLAG_RESET = 0x00000000;

enum {
	INTERNET_STATUS_PROXY_CREDENTIALS       = 400,
	INTERNET_STATUS_SERVER_CREDENTIALS      = 401,
	INTERNET_STATUS_SERVER_CONNECTION_STATE = 410,
	INTERNET_STATUS_END_BROWSER_SESSION     = 420,
	INTERNET_STATUS_COOKIE                  = 430,
}

struct INTERNET_SERVER_CONNECTION_STATE {
	LPCWSTR lpcwszHostName;
	BOOL fProxy;
	DWORD dwCounter;
	DWORD dwConnectionLimit;
	DWORD dwAvailableCreates;
	DWORD dwAvailableKeepAlives;
	DWORD dwActiveConnections;
	DWORD dwWaiters;
}
alias INTERNET_SERVER_CONNECTION_STATE* PINTERNET_SERVER_CONNECTION_STATE;

struct INTERNET_END_BROWSER_SESSION_DATA {
	LPVOID lpBuffer;
	DWORD dwBufferLength;
}
alias INTERNET_END_BROWSER_SESSION_DATA* PINTERNET_END_BROWSER_SESSION_DATA;

struct INTERNET_CALLBACK_COOKIE {
	PCWSTR pcwszName;
	PCWSTR pcwszValue;
	PCWSTR pcwszDomain;
	PCWSTR pcwszPath;
	FILETIME ftExpires;
	DWORD dwFlags;
}
alias INTERNET_CALLBACK_COOKIE* PINTERNET_CALLBACK_COOKIE;

struct INTERNET_CREDENTIALS {
	LPCWSTR lpcwszHostName;
	DWORD dwPort;
	DWORD dwScheme;
	LPCWSTR lpcwszUrl;
	LPCWSTR lpcwszRealm;
	BOOL fAuthIdentity;
	union {
		struct {
			LPCWSTR lpcwszUserName;
			LPCWSTR lpcwszPassword;
		}
		PVOID pAuthIdentityOpaque;
	}
}
alias INTERNET_CREDENTIALS* PINTERNET_CREDENTIALS;

enum {
	COOKIE_STATE_LB = 0,
	COOKIE_STATE_UB = 5,
}

enum MaxPrivacySettings = 0x4000;

export extern(Windows) int FindP3PPolicySymbol(const(char)* pszSymbol);

enum {
	INTERNET_STATE_ONLINE       = INTERNET_STATE_CONNECTED,
	INTERNET_STATE_OFFLINE      = INTERNET_STATE_DISCONNECTED,
	INTERNET_STATE_OFFLINE_USER = INTERNET_STATE_DISCONNECTED_BY_USER,
	INTERNET_LINE_STATE_MASK    = INTERNET_STATE_ONLINE | INTERNET_STATE_OFFLINE,
	INTERNET_BUSY_STATE_MASK    = INTERNET_STATE_IDLE | INTERNET_STATE_BUSY,
}

enum {
	INTERNET_STATUS_FILTER_RESOLVING      = 0x00000001,
	INTERNET_STATUS_FILTER_RESOLVED       = 0x00000002,
	INTERNET_STATUS_FILTER_CONNECTING     = 0x00000004,
	INTERNET_STATUS_FILTER_CONNECTED      = 0x00000008,
	INTERNET_STATUS_FILTER_SENDING        = 0x00000010,
	INTERNET_STATUS_FILTER_SENT           = 0x00000020,
	INTERNET_STATUS_FILTER_RECEIVING      = 0x00000040,
	INTERNET_STATUS_FILTER_RECEIVED       = 0x00000080,
	INTERNET_STATUS_FILTER_CLOSING        = 0x00000100,
	INTERNET_STATUS_FILTER_CLOSED         = 0x00000200,
	INTERNET_STATUS_FILTER_HANDLE_CREATED = 0x00000400,
	INTERNET_STATUS_FILTER_HANDLE_CLOSING = 0x00000800,
	INTERNET_STATUS_FILTER_PREFETCH       = 0x00001000,
	INTERNET_STATUS_FILTER_REDIRECT       = 0x00002000,
	INTERNET_STATUS_FILTER_STATE_CHANGE   = 0x00004000,
}

struct INTERNET_COOKIE {
	DWORD cbSize;
	LPSTR pszName;
	LPSTR pszData;
	LPSTR pszDomain;
	LPSTR pszPath;
	FILETIME* pftExpires;
	DWORD dwFlags;
	LPSTR pszUrl;
	LPSTR pszP3PPolicy;
}
alias INTERNET_COOKIE* PINTERNET_COOKIE;

struct COOKIE_DLG_INFO {
	LPWSTR pszServer;
	PINTERNET_COOKIE pic;
	DWORD dwStopWarning;
	INT cx;
	INT cy;
	LPWSTR pszHeader;
	DWORD dwOperation;
}
alias COOKIE_DLG_INFO* PCOOKIE_DLG_INFO;

enum {
	COOKIE_DONT_ALLOW     = 1,
	COOKIE_ALLOW          = 2,
	COOKIE_ALLOW_ALL      = 4,
	COOKIE_DONT_ALLOW_ALL = 8,
}

enum {
	COOKIE_OP_SET        = 0x01,
	COOKIE_OP_MODIFY     = 0x02,
	COOKIE_OP_GET        = 0x04,
	COOKIE_OP_SESSION    = 0x08,
	COOKIE_OP_PERSISTENT = 0x10,
	COOKIE_OP_3RD_PARTY  = 0x20,
}

enum {
	INTERNET_COOKIE_RESTRICTED_ZONE = 0x00020000,
	INTERNET_COOKIE_NO_CALLBACK     = 0x40000000,
	INTERNET_COOKIE_ECTX_3RDPARTY   = 0x80000000,
}

export extern(Windows) BOOL HttpCheckDavComplianceA(LPCSTR lpszUrl, LPCSTR lpszComplianceToken, LPBOOL lpfFound, HWND hWnd, LPVOID lpvReserved);
export extern(Windows) BOOL HttpCheckDavComplianceW(LPCWSTR lpszUrl, LPCWSTR lpszComplianceToken, LPBOOL lpfFound, HWND hWnd, LPVOID lpvReserved);
version(UNICODE)
	alias HttpCheckDavComplianceW HttpCheckDavCompliance;
else
	alias HttpCheckDavComplianceA HttpCheckDavCompliance;


export extern(Windows) BOOL HttpCheckCachedDavStatusA(LPCSTR lpszUrl, LPDWORD lpdwStatus);
export extern(Windows) BOOL HttpCheckCachedDavStatusW(LPCWSTR lpszUrl, LPDWORD lpdwStatus);
version(UNICODE)
	alias HttpCheckCachedDavStatusW HttpCheckCachedDavStatus;
else
	alias HttpCheckCachedDavStatusA HttpCheckCachedDavStatus;

export extern(Windows) BOOL HttpCheckDavCollectionA(LPCSTR lpszUrl, LPBOOL lpfFound, HWND hWnd, LPVOID lpvReserved);
export extern(Windows) BOOL HttpCheckDavCollectionW(LPCWSTR lpszUrl, LPBOOL lpfFound, HWND hWnd, LPVOID lpvReserved);
version(UNICODE)
	alias HttpCheckDavCollectionW HttpCheckDavCollection;
else
	alias HttpCheckDavCollectionA HttpCheckDavCollection;

enum {
	DAV_LEVEL1_STATUS                       = 0x00000001,
	DAV_COLLECTION_STATUS                   = 0x00004000,
	DAV_DETECTION_REQUIRED                  = 0x00008000,
	FLAGS_ERROR_UI_SHOW_IDN_HOSTNAME        = 0x20,
	ERROR_INTERNET_NO_NEW_CONTAINERS        = INTERNET_ERROR_BASE + 51,
	ERROR_INTERNET_OFFLINE                  = ERROR_INTERNET_DISCONNECTED,
	INTERNET_INTERNAL_ERROR_BASE            = INTERNET_ERROR_BASE + 900,
	ERROR_INTERNET_INTERNAL_SOCKET_ERROR    = INTERNET_INTERNAL_ERROR_BASE + 1,
	ERROR_INTERNET_CONNECTION_AVAILABLE     = INTERNET_INTERNAL_ERROR_BASE + 2,
	ERROR_INTERNET_NO_KNOWN_SERVERS         = INTERNET_INTERNAL_ERROR_BASE + 3,
	ERROR_INTERNET_PING_FAILED              = INTERNET_INTERNAL_ERROR_BASE + 4,
	ERROR_INTERNET_NO_PING_SUPPORT          = INTERNET_INTERNAL_ERROR_BASE + 5,
	ERROR_INTERNET_CACHE_SUCCESS            = INTERNET_INTERNAL_ERROR_BASE + 6,
	ERROR_HTTP_COOKIE_NEEDS_CONFIRMATION_EX = INTERNET_INTERNAL_ERROR_BASE + 7,
	HTTP_1_1_CACHE_ENTRY                    = 0x00000040,
	STATIC_CACHE_ENTRY                      = 0x00000080,
	MUST_REVALIDATE_CACHE_ENTRY             = 0x00000100,
	SHORTPATH_CACHE_ENTRY                   = 0x00000200,
	COOKIE_ACCEPTED_CACHE_ENTRY             = 0x00001000,
	COOKIE_LEASHED_CACHE_ENTRY              = 0x00002000,
	COOKIE_DOWNGRADED_CACHE_ENTRY           = 0x00004000,
	COOKIE_REJECTED_CACHE_ENTRY             = 0x00008000,
	PRIVACY_MODE_CACHE_ENTRY                = 0x00020000,
	XDR_CACHE_ENTRY                         = 0x00040000,
	PENDING_DELETE_CACHE_ENTRY              = 0x00400000,
	OTHER_USER_CACHE_ENTRY                  = 0x00800000,
	PRIVACY_IMPACTED_CACHE_ENTRY            = 0x02000000,
	POST_RESPONSE_CACHE_ENTRY               = 0x04000000,
	INSTALLED_CACHE_ENTRY                   = 0x10000000,
	POST_CHECK_CACHE_ENTRY                  = 0x20000000,
	IDENTITY_CACHE_ENTRY                    = 0x80000000,
	ANY_CACHE_ENTRY                         = 0xFFFFFFFF,
	INCLUDE_BY_DEFAULT_CACHE_ENTRY          =  HTTP_1_1_CACHE_ENTRY  | STATIC_CACHE_ENTRY  | MUST_REVALIDATE_CACHE_ENTRY  | PRIVACY_IMPACTED_CACHE_ENTRY  | POST_CHECK_CACHE_ENTRY  | COOKIE_ACCEPTED_CACHE_ENTRY  | COOKIE_LEASHED_CACHE_ENTRY  | COOKIE_DOWNGRADED_CACHE_ENTRY  | COOKIE_REJECTED_CACHE_ENTRY  | SHORTPATH_CACHE_ENTRY  ,
	CACHEGROUP_FLAG_VALID                   = 0x00000007,
	CACHEGROUP_ID_BUILTIN_STICKY            = 0x1000000000000007,
}

struct INTERNET_CACHE_CONFIG_PATH_ENTRYA {
	CHAR[MAX_PATH] CachePath;
	DWORD dwCacheSize;
}
alias INTERNET_CACHE_CONFIG_PATH_ENTRYA* LPINTERNET_CACHE_CONFIG_PATH_ENTRYA;

struct INTERNET_CACHE_CONFIG_PATH_ENTRYW {
	WCHAR[MAX_PATH] CachePath;
	DWORD dwCacheSize;
}
alias INTERNET_CACHE_CONFIG_PATH_ENTRYW* LPINTERNET_CACHE_CONFIG_PATH_ENTRYW;
version(UNICODE){
	alias INTERNET_CACHE_CONFIG_PATH_ENTRYW INTERNET_CACHE_CONFIG_PATH_ENTRY;
	alias LPINTERNET_CACHE_CONFIG_PATH_ENTRYW LPINTERNET_CACHE_CONFIG_PATH_ENTRY;
}else{
	alias INTERNET_CACHE_CONFIG_PATH_ENTRYA INTERNET_CACHE_CONFIG_PATH_ENTRY;
	alias LPINTERNET_CACHE_CONFIG_PATH_ENTRYA LPINTERNET_CACHE_CONFIG_PATH_ENTRY;
}

struct INTERNET_CACHE_CONFIG_INFOA {
	DWORD dwStructSize;
	DWORD dwContainer;
	DWORD dwQuota;
	DWORD dwReserved4;
	BOOL fPerUser;
	DWORD dwSyncMode;
	DWORD dwNumCachePaths;
	union {
		struct {
			CHAR[MAX_PATH] CachePath;
			DWORD dwCacheSize;
		}
		INTERNET_CACHE_CONFIG_PATH_ENTRYA[1] CachePaths;
	}
	DWORD dwNormalUsage;
	DWORD dwExemptUsage;
}
alias INTERNET_CACHE_CONFIG_INFOA* LPINTERNET_CACHE_CONFIG_INFOA;

struct INTERNET_CACHE_CONFIG_INFOW {
	DWORD dwStructSize;
	DWORD dwContainer;
	DWORD dwQuota;
	DWORD dwReserved4;
	BOOL fPerUser;
	DWORD dwSyncMode;
	DWORD dwNumCachePaths;
	union {
		struct {
			WCHAR[MAX_PATH] CachePath;
			DWORD dwCacheSize;
		}
		INTERNET_CACHE_CONFIG_PATH_ENTRYW[1] CachePaths;
	}
	DWORD dwNormalUsage;
	DWORD dwExemptUsage;
}
alias INTERNET_CACHE_CONFIG_INFOW* LPINTERNET_CACHE_CONFIG_INFOW;
version(UNICODE){
	alias INTERNET_CACHE_CONFIG_INFOW INTERNET_CACHE_CONFIG_INFO;
	alias LPINTERNET_CACHE_CONFIG_INFOW LPINTERNET_CACHE_CONFIG_INFO;
}else{
	alias INTERNET_CACHE_CONFIG_INFOA INTERNET_CACHE_CONFIG_INFO;
	alias LPINTERNET_CACHE_CONFIG_INFOA LPINTERNET_CACHE_CONFIG_INFO;
}

export extern(Windows) BOOL IsUrlCacheEntryExpiredA(LPCSTR lpszUrlName, DWORD dwFlags, FILETIME* pftLastModified);
export extern(Windows) BOOL IsUrlCacheEntryExpiredW(LPCWSTR lpszUrlName, DWORD dwFlags, FILETIME* pftLastModified);
version(UNICODE)
	alias IsUrlCacheEntryExpiredW IsUrlCacheEntryExpired;
else
	alias IsUrlCacheEntryExpiredA IsUrlCacheEntryExpired;

enum {
	INTERNET_CACHE_FLAG_ALLOW_COLLISIONS   = 0x00000100,
	INTERNET_CACHE_FLAG_INSTALLED_ENTRY    = 0x00000200,
	INTERNET_CACHE_FLAG_ENTRY_OR_MAPPING   = 0x00000400,
	INTERNET_CACHE_FLAG_ADD_FILENAME_ONLY  = 0x00000800,
	INTERNET_CACHE_FLAG_GET_STRUCT_ONLY    = 0x00001000,
	CACHE_ENTRY_TYPE_FC                    = 0x00001000,
	CACHE_ENTRY_MODIFY_DATA_FC             = 0x80000000,
	INTERNET_CACHE_CONTAINER_NOSUBDIRS     = 0x1,
	INTERNET_CACHE_CONTAINER_AUTODELETE    = 0x2,
	INTERNET_CACHE_CONTAINER_RESERVED1     = 0x4,
	INTERNET_CACHE_CONTAINER_NODESKTOPINIT = 0x8,
	INTERNET_CACHE_CONTAINER_MAP_ENABLED   = 0x10,
}

export extern(Windows) BOOL CreateUrlCacheContainerA(LPCSTR Name, LPCSTR lpCachePrefix, LPCSTR lpszCachePath, DWORD KBCacheLimit, DWORD dwContainerType, DWORD dwOptions, LPVOID pvBuffer, LPDWORD cbBuffer);
export extern(Windows) BOOL CreateUrlCacheContainerW(LPCWSTR Name, LPCWSTR lpCachePrefix, LPCWSTR lpszCachePath, DWORD KBCacheLimit, DWORD dwContainerType, DWORD dwOptions, LPVOID pvBuffer, LPDWORD cbBuffer);
version(UNICODE)
	alias CreateUrlCacheContainerW CreateUrlCacheContainer;
else
	alias CreateUrlCacheContainerA CreateUrlCacheContainer;

export extern(Windows) BOOL DeleteUrlCacheContainerA(LPCSTR Name, DWORD dwOptions);
export extern(Windows) BOOL DeleteUrlCacheContainerW(LPCWSTR Name, DWORD dwOptions);
version(UNICODE)
	alias DeleteUrlCacheContainerW DeleteUrlCacheContainer;
else
	alias DeleteUrlCacheContainerA DeleteUrlCacheContainer;

struct INTERNET_CACHE_CONTAINER_INFOA {
	DWORD dwCacheVersion;
	LPSTR lpszName;
	LPSTR lpszCachePrefix;
	LPSTR lpszVolumeLabel;
	LPSTR lpszVolumeTitle;
}
alias INTERNET_CACHE_CONTAINER_INFOA* LPINTERNET_CACHE_CONTAINER_INFOA;

struct INTERNET_CACHE_CONTAINER_INFOW {
	DWORD dwCacheVersion;
	LPWSTR lpszName;
	LPWSTR lpszCachePrefix;
	LPWSTR lpszVolumeLabel;
	LPWSTR lpszVolumeTitle;
}
alias INTERNET_CACHE_CONTAINER_INFOW* LPINTERNET_CACHE_CONTAINER_INFOW;
version(UNICODE){
	alias INTERNET_CACHE_CONTAINER_INFOW INTERNET_CACHE_CONTAINER_INFO;
	alias LPINTERNET_CACHE_CONTAINER_INFOW LPINTERNET_CACHE_CONTAINER_INFO;
}else{
	alias INTERNET_CACHE_CONTAINER_INFOA INTERNET_CACHE_CONTAINER_INFO;
	alias LPINTERNET_CACHE_CONTAINER_INFOA LPINTERNET_CACHE_CONTAINER_INFO;
}

enum CACHE_FIND_CONTAINER_RETURN_NOCHANGE = 0x1;

export extern(Windows) HANDLE FindFirstUrlCacheContainerA(LPDWORD pdwModified, LPINTERNET_CACHE_CONTAINER_INFOA lpContainerInfo, LPDWORD lpcbContainerInfo, DWORD dwOptions);
export extern(Windows) HANDLE FindFirstUrlCacheContainerW(LPDWORD pdwModified, LPINTERNET_CACHE_CONTAINER_INFOW lpContainerInfo, LPDWORD lpcbContainerInfo, DWORD dwOptions);
version(UNICODE)
	alias FindFirstUrlCacheContainerW FindFirstUrlCacheContainer;
else
	alias FindFirstUrlCacheContainerA FindFirstUrlCacheContainer;

export extern(Windows) BOOL FindNextUrlCacheContainerA(HANDLE hEnumHandle, LPINTERNET_CACHE_CONTAINER_INFOA lpContainerInfo, LPDWORD lpcbContainerInfo);
export extern(Windows) BOOL FindNextUrlCacheContainerW(HANDLE hEnumHandle, LPINTERNET_CACHE_CONTAINER_INFOW lpContainerInfo, LPDWORD lpcbContainerInfo);
version(UNICODE)
	alias FindNextUrlCacheContainerW FindNextUrlCacheContainer;
else
	alias FindNextUrlCacheContainerA FindNextUrlCacheContainer;

enum {
	WININET_SYNC_MODE_NEVER = 0,
	WININET_SYNC_MODE_ON_EXPIRY,
	WININET_SYNC_MODE_ONCE_PER_SESSION,
	WININET_SYNC_MODE_ALWAYS,
	WININET_SYNC_MODE_AUTOMATIC,
	WININET_SYNC_MODE_DEFAULT = WININET_SYNC_MODE_AUTOMATIC
}
alias int WININET_SYNC_MODE;

export extern(Windows) BOOL FreeUrlCacheSpaceA(LPCSTR lpszCachePath, DWORD dwSize, DWORD dwFilter);
export extern(Windows) BOOL FreeUrlCacheSpaceW(LPCWSTR lpszCachePath, DWORD dwSize, DWORD dwFilter);
version(UNICODE)
	alias FreeUrlCacheSpaceW FreeUrlCacheSpace;
else
	alias FreeUrlCacheSpaceA FreeUrlCacheSpace;

enum {
	CACHE_CONFIG_FORCE_CLEANUP_FC        = 0x00000020,
	CACHE_CONFIG_DISK_CACHE_PATHS_FC     = 0x00000040,
	CACHE_CONFIG_SYNC_MODE_FC            = 0x00000080,
	CACHE_CONFIG_CONTENT_PATHS_FC        = 0x00000100,
	CACHE_CONFIG_COOKIES_PATHS_FC        = 0x00000200,
	CACHE_CONFIG_HISTORY_PATHS_FC        = 0x00000400,
	CACHE_CONFIG_QUOTA_FC                = 0x00000800,
	CACHE_CONFIG_USER_MODE_FC            = 0x00001000,
	CACHE_CONFIG_CONTENT_USAGE_FC        = 0x00002000,
	CACHE_CONFIG_STICKY_CONTENT_USAGE_FC = 0x00004000,
}

export extern(Windows) BOOL GetUrlCacheConfigInfoA(LPINTERNET_CACHE_CONFIG_INFOA lpCacheConfigInfo, LPDWORD lpcbCacheConfigInfo, DWORD dwFieldControl);
export extern(Windows) BOOL GetUrlCacheConfigInfoW(LPINTERNET_CACHE_CONFIG_INFOW lpCacheConfigInfo, LPDWORD lpcbCacheConfigInfo, DWORD dwFieldControl);
version(UNICODE)
	alias GetUrlCacheConfigInfoW GetUrlCacheConfigInfo;
else
	alias GetUrlCacheConfigInfoA GetUrlCacheConfigInfo;

export extern(Windows) BOOL SetUrlCacheConfigInfoA(LPINTERNET_CACHE_CONFIG_INFOA lpCacheConfigInfo, DWORD dwFieldControl);
export extern(Windows) BOOL SetUrlCacheConfigInfoW(LPINTERNET_CACHE_CONFIG_INFOW lpCacheConfigInfo, DWORD dwFieldControl);
version(UNICODE)
	alias SetUrlCacheConfigInfoW SetUrlCacheConfigInfo;
else
	alias SetUrlCacheConfigInfoA SetUrlCacheConfigInfo;

export extern(Windows) DWORD RunOnceUrlCache(HWND hwnd, HINSTANCE hinst, LPSTR lpszCmd, int nCmdShow);
export extern(Windows) DWORD DeleteIE3Cache(HWND hwnd, HINSTANCE hinst, LPSTR lpszCmd, int nCmdShow);

export extern(Windows) BOOL UpdateUrlCacheContentPath(LPCSTR szNewPath);

enum {
	CACHE_HEADER_DATA_CURRENT_SETTINGS_VERSION = 0,
	CACHE_HEADER_DATA_CONLIST_CHANGE_COUNT     = 1,
	CACHE_HEADER_DATA_COOKIE_CHANGE_COUNT      = 2,
	CACHE_HEADER_DATA_NOTIFICATION_HWND        = 3,
	CACHE_HEADER_DATA_NOTIFICATION_MESG        = 4,
	CACHE_HEADER_DATA_ROOTGROUP_OFFSET         = 5,
	CACHE_HEADER_DATA_GID_LOW                  = 6,
	CACHE_HEADER_DATA_GID_HIGH                 = 7,
	CACHE_HEADER_DATA_CACHE_RESERVED_8         = 8,
	CACHE_HEADER_DATA_CACHE_RESERVED_9         = 9,
	CACHE_HEADER_DATA_CACHE_RESERVED_10        = 10,
	CACHE_HEADER_DATA_CACHE_RESERVED_11        = 11,
	CACHE_HEADER_DATA_CACHE_RESERVED_12        = 12,
	CACHE_HEADER_DATA_CACHE_RESERVED_13        = 13,
	CACHE_HEADER_DATA_SSL_STATE_COUNT          = 14,
	CACHE_HEADER_DATA_DOWNLOAD_PARTIAL         = CACHE_HEADER_DATA_SSL_STATE_COUNT,
	CACHE_HEADER_DATA_CACHE_RESERVED_15        = 15,
	CACHE_HEADER_DATA_CACHE_RESERVED_16        = 16,
	CACHE_HEADER_DATA_CACHE_RESERVED_17        = 17,
	CACHE_HEADER_DATA_CACHE_RESERVED_18        = 18,
	CACHE_HEADER_DATA_CACHE_RESERVED_19        = 19,
	CACHE_HEADER_DATA_CACHE_RESERVED_20        = 20,
	CACHE_HEADER_DATA_NOTIFICATION_FILTER      = 21,
	CACHE_HEADER_DATA_ROOT_LEAK_OFFSET         = 22,
	CACHE_HEADER_DATA_CACHE_RESERVED_23        = 23,
	CACHE_HEADER_DATA_CACHE_RESERVED_24        = 24,
	CACHE_HEADER_DATA_CACHE_RESERVED_25        = 25,
	CACHE_HEADER_DATA_CACHE_RESERVED_26        = 26,
	CACHE_HEADER_DATA_ROOT_GROUPLIST_OFFSET    = 27,
	CACHE_HEADER_DATA_CACHE_RESERVED_28        = 28,
	CACHE_HEADER_DATA_CACHE_RESERVED_29        = 29,
	CACHE_HEADER_DATA_CACHE_RESERVED_30        = 30,
	CACHE_HEADER_DATA_CACHE_RESERVED_31        = 31,
	CACHE_HEADER_DATA_LAST                     = 31,
	CACHE_NOTIFY_ADD_URL                       = 0x00000001,
	CACHE_NOTIFY_DELETE_URL                    = 0x00000002,
	CACHE_NOTIFY_UPDATE_URL                    = 0x00000004,
	CACHE_NOTIFY_DELETE_ALL                    = 0x00000008,
	CACHE_NOTIFY_URL_SET_STICKY                = 0x00000010,
	CACHE_NOTIFY_URL_UNSET_STICKY              = 0x00000020,
	CACHE_NOTIFY_SET_ONLINE                    = 0x00000100,
	CACHE_NOTIFY_SET_OFFLINE                   = 0x00000200,
	CACHE_NOTIFY_FILTER_CHANGED                = 0x10000000,
}

export extern(Windows) BOOL RegisterUrlCacheNotification(HWND hWnd, UINT uMsg, GROUPID gid, DWORD dwOpsFilter, DWORD dwReserved);
BOOL GetUrlCacheHeaderData(DWORD nIdx, LPDWORD lpdwData);
BOOL SetUrlCacheHeaderData(DWORD nIdx, DWORD dwData);
BOOL IncrementUrlCacheHeaderData(DWORD nIdx, LPDWORD lpdwData);
BOOL LoadUrlCacheContent();
BOOL GetUrlCacheContainerInfoA(LPSTR lpszUrlName, LPINTERNET_CACHE_CONTAINER_INFOA lpContainerInfo, LPDWORD lpdwContainerInfoBufferSize, DWORD dwOptions);
BOOL GetUrlCacheContainerInfoW(LPWSTR lpszUrlName, LPINTERNET_CACHE_CONTAINER_INFOW lpContainerInfo, LPDWORD lpdwContainerInfoBufferSize, DWORD dwOptions);
version(UNICODE)
	alias GetUrlCacheContainerInfoW GetUrlCacheContainerInfo;
else
	alias GetUrlCacheContainerInfoA GetUrlCacheContainerInfo;

export extern(Windows) DWORD InternetDialA(HWND hwndParent, LPSTR lpszConnectoid, DWORD dwFlags, DWORD_PTR* lpdwConnection, DWORD dwReserved);
export extern(Windows) DWORD InternetDialW(HWND hwndParent, LPWSTR lpszConnectoid, DWORD dwFlags, DWORD_PTR* lpdwConnection, DWORD dwReserved);
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
export extern(Windows) HRESULT InternetGetDialEngineW(LPWSTR pwzConnectoid, IDialEventSink pdes, IDialEngine* ppde);
export extern(Windows) HRESULT InternetGetDialBrandingW(LPWSTR pwzConnectoid, IDialBranding* ppdb);
export extern(Windows) BOOL ReadGuidsForConnectedNetworks(DWORD* pcNetworks, PWSTR** pppwszNetworkGuids, BSTR** pppbstrNetworkNames, PWSTR** pppwszGWMacs, DWORD* pcGatewayMacs, DWORD* pdwFlags);

enum {
	INTERNET_AUTOPROXY_INIT_DEFAULT      = 0x1,
	INTERNET_AUTOPROXY_INIT_DOWNLOADSYNC = 0x2,
	INTERNET_AUTOPROXY_INIT_QUERYSTATE   = 0x4,
	INTERNET_AUTOPROXY_INIT_ONLYQUERY    = 0x8,
	INTERNET_AUTOPROXY_INIT_MASK         = INTERNET_AUTOPROXY_INIT_DEFAULT|INTERNET_AUTOPROXY_INIT_DOWNLOADSYNC|INTERNET_AUTOPROXY_INIT_QUERYSTATE|INTERNET_AUTOPROXY_INIT_ONLYQUERY,
}

export extern(Windows) BOOL InternetInitializeAutoProxyDll(DWORD dwReserved);
export extern(Windows) BOOL DetectAutoProxyUrl(LPSTR lpszAutoProxyUrl, DWORD dwAutoProxyUrlLength, DWORD dwDetectFlags);
export extern(Windows) BOOL CreateMD5SSOHash(PWSTR pszChallengeInfo, PWSTR pwszRealm, PWSTR pwszTarget, PBYTE pbHexHash);
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

alias extern(Windows) DWORD function(HWND, LPCSTR, DWORD, LPDWORD) PFN_DIAL_HANDLER;

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

const wchar* REGSTR_DIAL_AUTOCONNECT = "AutoConnect";
const wchar* REGSTR_LEASH_LEGACY_COOKIES = "LeashLegacyCookies";

export extern(Windows) BOOL IsHostInProxyBypassList(INTERNET_SCHEME tScheme, LPCSTR lpszHost, DWORD cchHost);

//_WIN32_WINNT >= _WIN32_WINNT_WINXP
	const wchar* LOCAL_NAMESPACE_PREFIX = "Local\\";
const wchar* WININET_STARTUP_MUTEX = "Local\\WininetStartupMutex";

export extern(Windows) BOOL DoConnectoidsExist();

export extern(Windows) BOOL GetDiskInfoA(PCSTR pszPath, PDWORD pdwClusterSize, PDWORDLONG pdlAvail, PDWORDLONG pdlTotal);

alias extern(Windows) BOOL function(INTERNET_CACHE_ENTRY_INFO* pcei, PDWORD pcbcei, PVOID pOpData) CACHE_OPERATOR;

export extern(Windows) BOOL PerformOperationOverUrlCacheA(PCSTR pszUrlSearchPattern, DWORD dwFlags, DWORD dwFilter, GROUPID GroupId, PVOID pReserved1, PDWORD pdwReserved2, PVOID pReserved3, CACHE_OPERATOR op, PVOID pOperatorData);
export extern(Windows) BOOL IsProfilesEnabled();

export extern(Windows) DWORD _GetFileExtensionFromUrl(LPSTR lpszUrl, DWORD dwFlags, LPSTR lpszExt, DWORD* pcchExt);
export extern(Windows) DWORD InternalInternetGetCookie(LPCSTR lpszUrl, LPSTR lpszCookieData, DWORD* lpdwDataSize);

export extern(Windows) BOOL ImportCookieFileA(LPCSTR szFilename);
export extern(Windows) BOOL ImportCookieFileW(LPCWSTR szFilename);
version(UNICODE)
	alias ImportCookieFileW ImportCookieFile;
else
	alias ImportCookieFileA ImportCookieFile;

export extern(Windows) BOOL ExportCookieFileA(LPCSTR szFilename, BOOL fAppend);
export extern(Windows) BOOL ExportCookieFileW(LPCWSTR szFilename, BOOL fAppend);
version(UNICODE)
	alias ExportCookieFileW ExportCookieFile;
else
	alias ExportCookieFileA ExportCookieFile;

export extern(Windows) BOOL IsDomainLegalCookieDomainA(LPCSTR pchDomain, LPCSTR pchFullDomain);
export extern(Windows) BOOL IsDomainLegalCookieDomainW(LPCWSTR pchDomain, LPCWSTR pchFullDomain);
version(UNICODE)
	alias IsDomainLegalCookieDomainW IsDomainLegalCookieDomain;
else
	alias IsDomainLegalCookieDomainA IsDomainLegalCookieDomain;

export extern(Windows) BOOL InternetEnumPerSiteCookieDecisionA(LPSTR pszSiteName, uint* pcSiteNameSize, uint* pdwDecision, uint dwIndex);
export extern(Windows) BOOL InternetEnumPerSiteCookieDecisionW(LPWSTR pszSiteName, uint* pcSiteNameSize, uint* pdwDecision, uint dwIndex);
version(UNICODE)
	alias InternetEnumPerSiteCookieDecisionW InternetEnumPerSiteCookieDecision;
else
	alias InternetEnumPerSiteCookieDecisionA InternetEnumPerSiteCookieDecision;

enum {
	INTERNET_SUPPRESS_COOKIE_PERSIST       = 0x03,
	INTERNET_SUPPRESS_COOKIE_PERSIST_RESET = 0x04,
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
	PRIVACY_TYPE_FIRST_PARTY     = 0,
	PRIVACY_TYPE_THIRD_PARTY     = 1,
}

export extern(Windows) DWORD PrivacySetZonePreferenceW(DWORD dwZone, DWORD dwType, DWORD dwTemplate, LPCWSTR pszPreference);
export extern(Windows) DWORD PrivacyGetZonePreferenceW(DWORD dwZone, DWORD dwType, LPDWORD pdwTemplate, LPWSTR pszBuffer, LPDWORD pdwBufferLength);

alias char P3PCHAR;
alias char* P3PURL;
alias char* P3PVERB;
alias const(char)* P3PCURL;
alias BSTR P3PCXSL;
enum P3PHANDLE : void* {init = (void*).init}

enum URL_LIMIT = INTERNET_MAX_URL_LENGTH;

struct P3PResource {
	P3PCURL pszLocation;
	P3PVERB pszVerb;
	P3PCURL pszP3PHeaderRef;
	P3PCURL pszLinkTagRef;
	P3PResource* pContainer;
}

struct P3PSignal {
	HWND hwnd;
	uint message;
	HANDLE hEvent;
	void* pContext;
	P3PHANDLE hRequest;
}

enum {
	P3P_Done       = 0x0,
	P3P_Success    = 0x0,
	P3P_NoPolicy   = 0x2,
	P3P_InProgress = 0x3,
	P3P_Failed     = 0x4,
	P3P_NotFound   = 0x5,
	P3P_FormatErr  = 0x6,
	P3P_Cancelled  = 0x7,
	P3P_NotStarted = 0x8,
	P3P_XMLError   = 0x9,
	P3P_Expired    = 0xA,
	P3P_Error      = 0xFF,
}
alias int P3PStatus;

export extern(Windows) int MapResourceToPolicy(P3PResource* pResource, P3PURL pszPolicy, uint dwSize, P3PSignal* pSignal);
export extern(Windows) int GetP3PPolicy(P3PCURL pszPolicyURL, HANDLE hDestination, P3PCXSL pszXSLtransform, P3PSignal* pSignal);
export extern(Windows) int FreeP3PObject(P3PHANDLE hObject);
export extern(Windows) int GetP3PRequestStatus(P3PHANDLE hObject);

}// extern(C)
