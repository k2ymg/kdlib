/** winnetwk.d

Converted from 'winnetwk.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.winnetwk;


import c.windows.sdkddkver;
import c.windows.windef;
import c.windows.winerror;


extern(C){

enum {
	RESOURCE_CONNECTED               = 0x00000001,
	RESOURCE_GLOBALNET               = 0x00000002,
	RESOURCE_REMEMBERED              = 0x00000003,
	RESOURCE_RECENT                  = 0x00000004,
	RESOURCE_CONTEXT                 = 0x00000005,
	RESOURCETYPE_ANY                 = 0x00000000,
	RESOURCETYPE_DISK                = 0x00000001,
	RESOURCETYPE_PRINT               = 0x00000002,
	RESOURCETYPE_RESERVED            = 0x00000008,
	RESOURCETYPE_UNKNOWN             = 0xFFFFFFFF,
	RESOURCEUSAGE_CONNECTABLE        = 0x00000001,
	RESOURCEUSAGE_CONTAINER          = 0x00000002,
	RESOURCEUSAGE_NOLOCALDEVICE      = 0x00000004,
	RESOURCEUSAGE_SIBLING            = 0x00000008,
	RESOURCEUSAGE_ATTACHED           = 0x00000010,
	RESOURCEUSAGE_ALL                = RESOURCEUSAGE_CONNECTABLE | RESOURCEUSAGE_CONTAINER | RESOURCEUSAGE_ATTACHED,
	RESOURCEUSAGE_RESERVED           = 0x80000000,
	RESOURCEDISPLAYTYPE_GENERIC      = 0x00000000,
	RESOURCEDISPLAYTYPE_DOMAIN       = 0x00000001,
	RESOURCEDISPLAYTYPE_SERVER       = 0x00000002,
	RESOURCEDISPLAYTYPE_SHARE        = 0x00000003,
	RESOURCEDISPLAYTYPE_FILE         = 0x00000004,
	RESOURCEDISPLAYTYPE_GROUP        = 0x00000005,
	RESOURCEDISPLAYTYPE_NETWORK      = 0x00000006,
	RESOURCEDISPLAYTYPE_ROOT         = 0x00000007,
	RESOURCEDISPLAYTYPE_SHAREADMIN   = 0x00000008,
	RESOURCEDISPLAYTYPE_DIRECTORY    = 0x00000009,
	RESOURCEDISPLAYTYPE_TREE         = 0x0000000A,
	RESOURCEDISPLAYTYPE_NDSCONTAINER = 0x0000000B,
}

struct NETRESOURCEA {
	DWORD dwScope;
	DWORD dwType;
	DWORD dwDisplayType;
	DWORD dwUsage;
	LPSTR lpLocalName;
	LPSTR lpRemoteName;
	LPSTR lpComment ;
	LPSTR lpProvider;
}
alias NETRESOURCEA* LPNETRESOURCEA;
struct NETRESOURCEW {
	DWORD dwScope;
	DWORD dwType;
	DWORD dwDisplayType;
	DWORD dwUsage;
	LPWSTR lpLocalName;
	LPWSTR lpRemoteName;
	LPWSTR lpComment ;
	LPWSTR lpProvider;
}
alias NETRESOURCEW* LPNETRESOURCEW;
version(UNICODE){
	alias NETRESOURCEW NETRESOURCE;
	alias LPNETRESOURCEW LPNETRESOURCE;
}else{
	alias NETRESOURCEA NETRESOURCE;
	alias LPNETRESOURCEA LPNETRESOURCE;
}

enum NETPROPERTY_PERSISTENT = 1;

enum {
	CONNECT_UPDATE_PROFILE = 0x00000001,
	CONNECT_UPDATE_RECENT  = 0x00000002,
	CONNECT_TEMPORARY      = 0x00000004,
	CONNECT_INTERACTIVE    = 0x00000008,
	CONNECT_PROMPT         = 0x00000010,
	CONNECT_NEED_DRIVE     = 0x00000020,
	CONNECT_REFCOUNT       = 0x00000040,
	CONNECT_REDIRECT       = 0x00000080,
	CONNECT_LOCALDRIVE     = 0x00000100,
	CONNECT_CURRENT_MEDIA  = 0x00000200,
	CONNECT_DEFERRED       = 0x00000400,
	CONNECT_RESERVED       = 0xFF000000,
	CONNECT_COMMANDLINE    = 0x00000800,
	CONNECT_CMD_SAVECRED   = 0x00001000,
	//(WINVER >= _WIN32_WINNT_VISTA)
		CONNECT_CRED_RESET = 0x00002000,
}

export extern(Windows) DWORD WNetAddConnectionA(LPCSTR lpRemoteName, LPCSTR lpPassword, LPCSTR lpLocalName);
export extern(Windows) DWORD WNetAddConnectionW(LPCWSTR lpRemoteName, LPCWSTR lpPassword, LPCWSTR lpLocalName);
version(UNICODE)
	alias WNetAddConnectionW WNetAddConnection;
else
	alias WNetAddConnectionA WNetAddConnection;


export extern(Windows) DWORD WNetAddConnection2A(LPNETRESOURCEA lpNetResource, LPCSTR lpPassword, LPCSTR lpUserName, DWORD dwFlags);
export extern(Windows) DWORD WNetAddConnection2W(LPNETRESOURCEW lpNetResource, LPCWSTR lpPassword, LPCWSTR lpUserName, DWORD dwFlags);
version(UNICODE)
	alias WNetAddConnection2W WNetAddConnection2;
else
	alias WNetAddConnection2A WNetAddConnection2;

export extern(Windows) DWORD WNetAddConnection3A(HWND hwndOwner, LPNETRESOURCEA lpNetResource, LPCSTR lpPassword, LPCSTR lpUserName, DWORD dwFlags);
export extern(Windows) DWORD WNetAddConnection3W(HWND hwndOwner, LPNETRESOURCEW lpNetResource, LPCWSTR lpPassword, LPCWSTR lpUserName, DWORD dwFlags);
version(UNICODE)
	alias WNetAddConnection3W WNetAddConnection3;
else
	alias WNetAddConnection3A WNetAddConnection3;

export extern(Windows) DWORD WNetCancelConnectionA(LPCSTR lpName, BOOL fForce);
export extern(Windows) DWORD WNetCancelConnectionW(LPCWSTR lpName, BOOL fForce);
version(UNICODE)
	alias WNetCancelConnectionW WNetCancelConnection;
else
	alias WNetCancelConnectionA WNetCancelConnection;

export extern(Windows) DWORD WNetCancelConnection2A(LPCSTR lpName, DWORD dwFlags, BOOL fForce);
export extern(Windows) DWORD WNetCancelConnection2W(LPCWSTR lpName, DWORD dwFlags, BOOL fForce);
version(UNICODE)
	alias WNetCancelConnection2W WNetCancelConnection2;
else
	alias WNetCancelConnection2A WNetCancelConnection2;

export extern(Windows) DWORD WNetGetConnectionA(LPCSTR lpLocalName, LPSTR lpRemoteName, LPDWORD lpnLength);
export extern(Windows) DWORD WNetGetConnectionW(LPCWSTR lpLocalName, LPWSTR lpRemoteName, LPDWORD lpnLength);
version(UNICODE)
	alias WNetGetConnectionW WNetGetConnection;
else
	alias WNetGetConnectionA WNetGetConnection;

static if(_WIN32_WINNT >= _WIN32_WINNT_LONGHORN)
	export extern(Windows) DWORD WNetRestoreSingleConnectionW(HWND hwndParent, LPCWSTR lpDevice, BOOL fUseUI);
else
	export extern(Windows) DWORD WNetRestoreConnectionW(HWND hWnd, LPCWSTR lpDevice);

export extern(Windows) DWORD WNetUseConnectionA(HWND hwndOwner, LPNETRESOURCEA lpNetResource, LPCSTR lpPassword, LPCSTR lpUserId, DWORD dwFlags, LPSTR lpAccessName, LPDWORD lpBufferSize, LPDWORD lpResult);
export extern(Windows) DWORD WNetUseConnectionW(HWND hwndOwner, LPNETRESOURCEW lpNetResource, LPCWSTR lpPassword, LPCWSTR lpUserId, DWORD dwFlags, LPWSTR lpAccessName, LPDWORD lpBufferSize, LPDWORD lpResult);
version(UNICODE)
	alias WNetUseConnectionW WNetUseConnection;
else
	alias WNetUseConnectionA WNetUseConnection;

export extern(Windows) DWORD WNetConnectionDialog(HWND hwnd, DWORD dwType);
export extern(Windows) DWORD WNetDisconnectDialog(HWND hwnd, DWORD dwType);

struct CONNECTDLGSTRUCTA {
	DWORD cbStructure;
	HWND hwndOwner;
	LPNETRESOURCEA lpConnRes;
	DWORD dwFlags;
	DWORD dwDevNum;
}
alias CONNECTDLGSTRUCTA* LPCONNECTDLGSTRUCTA;
struct CONNECTDLGSTRUCTW {
	DWORD cbStructure;
	HWND hwndOwner;
	LPNETRESOURCEW lpConnRes;
	DWORD dwFlags;
	DWORD dwDevNum;
}
alias CONNECTDLGSTRUCTW* LPCONNECTDLGSTRUCTW;
version(UNICODE){
	alias CONNECTDLGSTRUCTW CONNECTDLGSTRUCT;
	alias LPCONNECTDLGSTRUCTW LPCONNECTDLGSTRUCT;
}else{
	alias CONNECTDLGSTRUCTA CONNECTDLGSTRUCT;
	alias LPCONNECTDLGSTRUCTA LPCONNECTDLGSTRUCT;
}

enum {
	CONNDLG_RO_PATH     = 0x00000001,
	CONNDLG_CONN_POINT  = 0x00000002,
	CONNDLG_USE_MRU     = 0x00000004,
	CONNDLG_HIDE_BOX    = 0x00000008,
	CONNDLG_PERSIST     = 0x00000010,
	CONNDLG_NOT_PERSIST = 0x00000020,
}

export extern(Windows) DWORD WNetConnectionDialog1A(LPCONNECTDLGSTRUCTA lpConnDlgStruct);
export extern(Windows) DWORD WNetConnectionDialog1W(LPCONNECTDLGSTRUCTW lpConnDlgStruct);
version(UNICODE)
	alias WNetConnectionDialog1W WNetConnectionDialog1;
else
	alias WNetConnectionDialog1A WNetConnectionDialog1;

struct DISCDLGSTRUCTA {
	DWORD cbStructure;
	HWND hwndOwner;
	LPSTR lpLocalName;
	LPSTR lpRemoteName;
	DWORD dwFlags;
}
alias DISCDLGSTRUCTA* LPDISCDLGSTRUCTA;

struct DISCDLGSTRUCTW {
	DWORD cbStructure;
	HWND hwndOwner;
	LPWSTR lpLocalName;
	LPWSTR lpRemoteName;
	DWORD dwFlags;
}
alias DISCDLGSTRUCTW* LPDISCDLGSTRUCTW;
version(UNICODE){
	alias DISCDLGSTRUCTW DISCDLGSTRUCT;
	alias LPDISCDLGSTRUCTW LPDISCDLGSTRUCT;
}else{
	alias DISCDLGSTRUCTA DISCDLGSTRUCT;
	alias LPDISCDLGSTRUCTA LPDISCDLGSTRUCT;
}

enum {
	DISC_UPDATE_PROFILE = 0x00000001,
	DISC_NO_FORCE       = 0x00000040,
}

export extern(Windows) DWORD WNetDisconnectDialog1A(LPDISCDLGSTRUCTA lpConnDlgStruct);
export extern(Windows) DWORD WNetDisconnectDialog1W(LPDISCDLGSTRUCTW lpConnDlgStruct);
version(UNICODE)
	alias WNetDisconnectDialog1W WNetDisconnectDialog1;
else
	alias WNetDisconnectDialog1A WNetDisconnectDialog1;

export extern(Windows) DWORD WNetOpenEnumA(DWORD dwScope, DWORD dwType, DWORD dwUsage, LPNETRESOURCEA lpNetResource, LPHANDLE lphEnum);
export extern(Windows) DWORD WNetOpenEnumW(DWORD dwScope, DWORD dwType, DWORD dwUsage, LPNETRESOURCEW lpNetResource, LPHANDLE lphEnum);
version(UNICODE)
	alias WNetOpenEnumW WNetOpenEnum;
else
	alias WNetOpenEnumA WNetOpenEnum;

export extern(Windows) DWORD WNetEnumResourceA(HANDLE hEnum, LPDWORD lpcCount, LPVOID lpBuffer, LPDWORD lpBufferSize);
export extern(Windows) DWORD WNetEnumResourceW(HANDLE hEnum, LPDWORD lpcCount, LPVOID lpBuffer, LPDWORD lpBufferSize);
version(UNICODE)
	alias WNetEnumResourceW WNetEnumResource;
else
	alias WNetEnumResourceA WNetEnumResource;

export extern(Windows) DWORD WNetCloseEnum(HANDLE hEnum);

export extern(Windows) DWORD WNetGetResourceParentA(LPNETRESOURCEA lpNetResource, LPVOID lpBuffer, LPDWORD lpcbBuffer);
export extern(Windows) DWORD WNetGetResourceParentW(LPNETRESOURCEW lpNetResource, LPVOID lpBuffer, LPDWORD lpcbBuffer);
version(UNICODE)
	alias WNetGetResourceParentW WNetGetResourceParent;
else
	alias WNetGetResourceParentA WNetGetResourceParent;


export extern(Windows) DWORD WNetGetResourceInformationA(LPNETRESOURCEA lpNetResource, LPVOID lpBuffer, LPDWORD lpcbBuffer, LPSTR* lplpSystem);
export extern(Windows) DWORD WNetGetResourceInformationW(LPNETRESOURCEW lpNetResource, LPVOID lpBuffer, LPDWORD lpcbBuffer, LPWSTR* lplpSystem);
version(UNICODE)
	alias WNetGetResourceInformationW WNetGetResourceInformation;
else
	alias WNetGetResourceInformationA WNetGetResourceInformation;

enum {
	UNIVERSAL_NAME_INFO_LEVEL = 0x00000001,
	REMOTE_NAME_INFO_LEVEL    = 0x00000002,
}

struct UNIVERSAL_NAME_INFOA {
	LPSTR lpUniversalName;
}
alias UNIVERSAL_NAME_INFOA* LPUNIVERSAL_NAME_INFOA;

struct UNIVERSAL_NAME_INFOW {
	LPWSTR lpUniversalName;
}
alias UNIVERSAL_NAME_INFOW* LPUNIVERSAL_NAME_INFOW;
version(UNICODE){
	alias UNIVERSAL_NAME_INFOW UNIVERSAL_NAME_INFO;
	alias LPUNIVERSAL_NAME_INFOW LPUNIVERSAL_NAME_INFO;
}else{
	alias UNIVERSAL_NAME_INFOA UNIVERSAL_NAME_INFO;
	alias LPUNIVERSAL_NAME_INFOA LPUNIVERSAL_NAME_INFO;
}

struct REMOTE_NAME_INFOA {
	LPSTR lpUniversalName;
	LPSTR lpConnectionName;
	LPSTR lpRemainingPath;
}
alias REMOTE_NAME_INFOA* LPREMOTE_NAME_INFOA;

struct REMOTE_NAME_INFOW {
	LPWSTR lpUniversalName;
	LPWSTR lpConnectionName;
	LPWSTR lpRemainingPath;
}
alias REMOTE_NAME_INFOW* LPREMOTE_NAME_INFOW;
version(UNICODE){
	alias REMOTE_NAME_INFOW REMOTE_NAME_INFO;
	alias LPREMOTE_NAME_INFOW LPREMOTE_NAME_INFO;
}else{
	alias REMOTE_NAME_INFOA REMOTE_NAME_INFO;
	alias LPREMOTE_NAME_INFOA LPREMOTE_NAME_INFO;
}

export extern(Windows) DWORD WNetGetUniversalNameA(LPCSTR lpLocalPath, DWORD dwInfoLevel, LPVOID lpBuffer, LPDWORD lpBufferSize);
export extern(Windows) DWORD WNetGetUniversalNameW(LPCWSTR lpLocalPath, DWORD dwInfoLevel, LPVOID lpBuffer, LPDWORD lpBufferSize);
version(UNICODE)
	alias WNetGetUniversalNameW WNetGetUniversalName;
else
	alias WNetGetUniversalNameA WNetGetUniversalName;

export extern(Windows) DWORD WNetGetUserA(LPCSTR lpName, LPSTR lpUserName, LPDWORD lpnLength);
export extern(Windows) DWORD WNetGetUserW(LPCWSTR lpName, LPWSTR lpUserName, LPDWORD lpnLength);
version(UNICODE)
	alias WNetGetUserW WNetGetUser;
else
	alias WNetGetUserA WNetGetUser;

enum {
	WNFMT_MULTILINE   = 0x01,
	WNFMT_ABBREVIATED = 0x02,
	WNFMT_INENUM      = 0x10,
	WNFMT_CONNECTION  = 0x20,
}

export extern(Windows) DWORD WNetGetProviderNameA(DWORD dwNetType, LPSTR lpProviderName, LPDWORD lpBufferSize);
export extern(Windows) DWORD WNetGetProviderNameW(DWORD dwNetType, LPWSTR lpProviderName, LPDWORD lpBufferSize);
version(UNICODE)
	alias WNetGetProviderNameW WNetGetProviderName;
else
	alias WNetGetProviderNameA WNetGetProviderName;

struct NETINFOSTRUCT {
	DWORD cbStructure;
	DWORD dwProviderVersion;
	DWORD dwStatus;
	DWORD dwCharacteristics;
	ULONG_PTR dwHandle;
	WORD wNetType;
	DWORD dwPrinters;
	DWORD dwDrives;
}
alias NETINFOSTRUCT* LPNETINFOSTRUCT;

enum {
	NETINFO_DLL16      = 0x00000001,
	NETINFO_DISKRED    = 0x00000004,
	NETINFO_PRINTERRED = 0x00000008,
}

export extern(Windows) DWORD WNetGetNetworkInformationA(LPCSTR lpProvider, LPNETINFOSTRUCT lpNetInfoStruct);
export extern(Windows) DWORD WNetGetNetworkInformationW(LPCWSTR lpProvider, LPNETINFOSTRUCT lpNetInfoStruct);
version(UNICODE)
	alias WNetGetNetworkInformationW WNetGetNetworkInformation;
else
	alias WNetGetNetworkInformationA WNetGetNetworkInformation;

export extern(Windows) DWORD WNetGetLastErrorA(LPDWORD lpError, LPSTR lpErrorBuf, DWORD nErrorBufSize, LPSTR lpNameBuf, DWORD nNameBufSize);
export extern(Windows) DWORD WNetGetLastErrorW(LPDWORD lpError, LPWSTR lpErrorBuf, DWORD nErrorBufSize, LPWSTR lpNameBuf, DWORD nNameBufSize);
version(UNICODE)
	alias WNetGetLastErrorW WNetGetLastError;
else
	alias WNetGetLastErrorA WNetGetLastError;

enum {
	WN_SUCCESS                   = NO_ERROR,
	WN_NO_ERROR                  = NO_ERROR,
	WN_NOT_SUPPORTED             = ERROR_NOT_SUPPORTED,
	WN_CANCEL                    = ERROR_CANCELLED,
	WN_RETRY                     = ERROR_RETRY,
	WN_NET_ERROR                 = ERROR_UNEXP_NET_ERR,
	WN_MORE_DATA                 = ERROR_MORE_DATA,
	WN_BAD_POINTER               = ERROR_INVALID_ADDRESS,
	WN_BAD_VALUE                 = ERROR_INVALID_PARAMETER,
	WN_BAD_USER                  = ERROR_BAD_USERNAME,
	WN_BAD_PASSWORD              = ERROR_INVALID_PASSWORD,
	WN_ACCESS_DENIED             = ERROR_ACCESS_DENIED,
	WN_FUNCTION_BUSY             = ERROR_BUSY,
	WN_WINDOWS_ERROR             = ERROR_UNEXP_NET_ERR,
	WN_OUT_OF_MEMORY             = ERROR_NOT_ENOUGH_MEMORY,
	WN_NO_NETWORK                = ERROR_NO_NETWORK,
	WN_EXTENDED_ERROR            = ERROR_EXTENDED_ERROR,
	WN_BAD_LEVEL                 = ERROR_INVALID_LEVEL,
	WN_BAD_HANDLE                = ERROR_INVALID_HANDLE,
	WN_NOT_INITIALIZING          = ERROR_ALREADY_INITIALIZED,
	WN_NO_MORE_DEVICES           = ERROR_NO_MORE_DEVICES,
	WN_NOT_CONNECTED             = ERROR_NOT_CONNECTED,
	WN_OPEN_FILES                = ERROR_OPEN_FILES,
	WN_DEVICE_IN_USE             = ERROR_DEVICE_IN_USE,
	WN_BAD_NETNAME               = ERROR_BAD_NET_NAME,
	WN_BAD_LOCALNAME             = ERROR_BAD_DEVICE,
	WN_ALREADY_CONNECTED         = ERROR_ALREADY_ASSIGNED,
	WN_DEVICE_ERROR              = ERROR_GEN_FAILURE,
	WN_CONNECTION_CLOSED         = ERROR_CONNECTION_UNAVAIL,
	WN_NO_NET_OR_BAD_PATH        = ERROR_NO_NET_OR_BAD_PATH,
	WN_BAD_PROVIDER              = ERROR_BAD_PROVIDER,
	WN_CANNOT_OPEN_PROFILE       = ERROR_CANNOT_OPEN_PROFILE,
	WN_BAD_PROFILE               = ERROR_BAD_PROFILE,
	WN_BAD_DEV_TYPE              = ERROR_BAD_DEV_TYPE,
	WN_DEVICE_ALREADY_REMEMBERED = ERROR_DEVICE_ALREADY_REMEMBERED,
	WN_CONNECTED_OTHER_PASSWORD  = ERROR_CONNECTED_OTHER_PASSWORD,
	//(WINVER >= _WIN32_WINNT_WINXP)
		WN_CONNECTED_OTHER_PASSWORD_DEFAULT = ERROR_CONNECTED_OTHER_PASSWORD_DEFAULT,
}

enum {
	WN_NO_MORE_ENTRIES   = ERROR_NO_MORE_ITEMS,
	WN_NOT_CONTAINER     = ERROR_NOT_CONTAINER,
	WN_NOT_AUTHENTICATED = ERROR_NOT_AUTHENTICATED,
	WN_NOT_LOGGED_ON     = ERROR_NOT_LOGGED_ON,
	WN_NOT_VALIDATED     = ERROR_NO_LOGON_SERVERS,
}

struct NETCONNECTINFOSTRUCT {
	DWORD cbStructure;
	DWORD dwFlags;
	DWORD dwSpeed;
	DWORD dwDelay;
	DWORD dwOptDataSize;
}
alias NETCONNECTINFOSTRUCT* LPNETCONNECTINFOSTRUCT;

enum {
	WNCON_FORNETCARD = 0x00000001,
	WNCON_NOTROUTED  = 0x00000002,
	WNCON_SLOWLINK   = 0x00000004,
	WNCON_DYNAMIC    = 0x00000008,
}

export extern(Windows) DWORD MultinetGetConnectionPerformanceA(LPNETRESOURCEA lpNetResource, LPNETCONNECTINFOSTRUCT lpNetConnectInfoStruct);
export extern(Windows) DWORD MultinetGetConnectionPerformanceW(LPNETRESOURCEW lpNetResource, LPNETCONNECTINFOSTRUCT lpNetConnectInfoStruct);
version(UNICODE)
	alias MultinetGetConnectionPerformanceW MultinetGetConnectionPerformance;
else
	alias MultinetGetConnectionPerformanceA MultinetGetConnectionPerformance;

}// extern(C)
