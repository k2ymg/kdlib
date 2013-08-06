/** winreg.d

Converted from 'winreg.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.winreg;


import c.windows.sdkddkver;
import c.windows.windef;
import c.windows.winbase;
import c.windows.winnt;
import c.windows.reason;


extern(C){

enum {
	RRF_RT_REG_NONE         = 0x00000001,
	RRF_RT_REG_SZ           = 0x00000002,
	RRF_RT_REG_EXPAND_SZ    = 0x00000004,
	RRF_RT_REG_BINARY       = 0x00000008,
	RRF_RT_REG_DWORD        = 0x00000010,
	RRF_RT_REG_MULTI_SZ     = 0x00000020,
	RRF_RT_REG_QWORD        = 0x00000040,
	RRF_RT_DWORD            = RRF_RT_REG_BINARY | RRF_RT_REG_DWORD,
	RRF_RT_QWORD            = RRF_RT_REG_BINARY | RRF_RT_REG_QWORD,
	RRF_RT_ANY              = 0x0000ffff,
	RRF_NOEXPAND            = 0x10000000,
	RRF_ZEROONFAILURE       = 0x20000000,
	REG_PROCESS_APPKEY      = 0x00000001,
	REG_MUI_STRING_TRUNCATE = 0x00000001,
}
alias ACCESS_MASK REGSAM;

const HKEY HKEY_CLASSES_ROOT        = cast(HKEY)cast(ULONG_PTR)cast(LONG)0x80000000;
const HKEY HKEY_CURRENT_USER        = cast(HKEY)cast(ULONG_PTR)cast(LONG)0x80000001;
const HKEY HKEY_LOCAL_MACHINE       = cast(HKEY)cast(ULONG_PTR)cast(LONG)0x80000002;
const HKEY HKEY_USERS               = cast(HKEY)cast(ULONG_PTR)cast(LONG)0x80000003;
const HKEY HKEY_PERFORMANCE_DATA    = cast(HKEY)cast(ULONG_PTR)cast(LONG)0x80000004;
const HKEY HKEY_PERFORMANCE_TEXT    = cast(HKEY)cast(ULONG_PTR)cast(LONG)0x80000050;
const HKEY HKEY_PERFORMANCE_NLSTEXT = cast(HKEY)cast(ULONG_PTR)cast(LONG)0x80000060;

const HKEY HKEY_CURRENT_CONFIG              = cast(HKEY)cast(ULONG_PTR)cast(LONG)0x80000005;
const HKEY HKEY_DYN_DATA                    = cast(HKEY)cast(ULONG_PTR)cast(LONG)0x80000006;
const HKEY HKEY_CURRENT_USER_LOCAL_SETTINGS = cast(HKEY)cast(ULONG_PTR)cast(LONG)0x80000007;

enum REG_SECURE_CONNECTION = 1;

enum PROVIDER_KEEPS_VALUE_LENGTH = 0x1;
struct val_context {
	int valuelen;
	LPVOID value_context;
	LPVOID val_buff_ptr;
}
alias val_context* PVALCONTEXT;

struct PVALUEA {
	LPSTR pv_valuename;
	int pv_valuelen;
	LPVOID pv_value_context;
	DWORD pv_type;
}
alias PVALUEA* PPVALUEA;
struct PVALUEW {
	LPWSTR pv_valuename;
	int pv_valuelen;
	LPVOID pv_value_context;
	DWORD pv_type;
}
alias PVALUEW* PPVALUEW;
version(UNICODE){
	alias PVALUEW PVALUE;
	alias PPVALUEW PPVALUE;
}else{
	alias PVALUEA PVALUE;
	alias PPVALUEA PPVALUE;
}

alias extern(C) DWORD function(LPVOID keycontext, PVALCONTEXT val_list, DWORD num_vals, LPVOID outputbuffer, DWORD* total_outlen, DWORD input_blen) QUERYHANDLER;
alias QUERYHANDLER PQUERYHANDLER;

struct REG_PROVIDER {
	PQUERYHANDLER pi_R0_1val;
	PQUERYHANDLER pi_R0_allvals;
	PQUERYHANDLER pi_R3_1val;
	PQUERYHANDLER pi_R3_allvals;
	DWORD pi_flags;
	LPVOID pi_key_context;
}
alias REG_PROVIDER* PPROVIDER;

struct VALENTA {
	LPSTR ve_valuename;
	DWORD ve_valuelen;
	DWORD_PTR ve_valueptr;
	DWORD ve_type;
}
alias VALENTA* PVALENTA;
struct VALENTW {
	LPWSTR ve_valuename;
	DWORD ve_valuelen;
	DWORD_PTR ve_valueptr;
	DWORD ve_type;
}
alias VALENTW* PVALENTW;
version(UNICODE){
	alias VALENTW VALENT;
	alias  PVALENTW PVALENT;
}else{
	alias VALENTA VALENT;
	alias PVALENTA PVALENT;
}

//	WIN31_CLASS NULL

alias LONG LSTATUS;

export extern(Windows) LSTATUS RegCloseKey(HKEY hKey);
export extern(Windows) LSTATUS RegOverridePredefKey(HKEY hKey, HKEY hNewHKey);
export extern(Windows) LSTATUS RegOpenUserClassesRoot(HANDLE hToken, DWORD dwOptions, REGSAM samDesired, PHKEY phkResult);
export extern(Windows) LSTATUS RegOpenCurrentUser(REGSAM samDesired, PHKEY phkResult);
export extern(Windows) LSTATUS RegDisablePredefinedCache();
export extern(Windows) LSTATUS RegDisablePredefinedCacheEx();
export extern(Windows) LSTATUS RegConnectRegistryA(LPCSTR lpMachineName, HKEY hKey, PHKEY phkResult);
export extern(Windows) LSTATUS RegConnectRegistryW(LPCWSTR lpMachineName, HKEY hKey, PHKEY phkResult);
version(UNICODE)
	alias RegConnectRegistryW RegConnectRegistry;
else
	alias RegConnectRegistryA RegConnectRegistry;

export extern(Windows) LSTATUS RegConnectRegistryExA(LPCSTR lpMachineName, HKEY hKey, ULONG Flags, PHKEY phkResult);
export extern(Windows) LSTATUS RegConnectRegistryExW(LPCWSTR lpMachineName, HKEY hKey, ULONG Flags, PHKEY phkResult);
version(UNICODE)
	alias RegConnectRegistryExW RegConnectRegistryEx;
else
	alias RegConnectRegistryExA RegConnectRegistryEx;

export extern(Windows) LSTATUS RegCreateKeyA(HKEY hKey, LPCSTR lpSubKey, PHKEY phkResult);
export extern(Windows) LSTATUS RegCreateKeyW(HKEY hKey, LPCWSTR lpSubKey, PHKEY phkResult);
version(UNICODE)
	alias RegCreateKeyW RegCreateKey;
else
	alias RegCreateKeyA RegCreateKey;

export extern(Windows) LSTATUS RegCreateKeyExA(HKEY hKey, LPCSTR lpSubKey, DWORD Reserved, LPSTR lpClass, DWORD dwOptions, REGSAM samDesired, const(SECURITY_ATTRIBUTES)* lpSecurityAttributes, PHKEY phkResult, LPDWORD lpdwDisposition);
export extern(Windows) LSTATUS RegCreateKeyExW(HKEY hKey, LPCWSTR lpSubKey, DWORD Reserved, LPWSTR lpClass, DWORD dwOptions, REGSAM samDesired, const(SECURITY_ATTRIBUTES)* lpSecurityAttributes, PHKEY phkResult, LPDWORD lpdwDisposition);
version(UNICODE)
	alias RegCreateKeyExW RegCreateKeyEx;
else
	alias RegCreateKeyExA RegCreateKeyEx;

export extern(Windows) LSTATUS RegCreateKeyTransactedA(HKEY hKey, LPCSTR lpSubKey, DWORD Reserved, LPSTR lpClass, DWORD dwOptions, REGSAM samDesired, const(SECURITY_ATTRIBUTES)* lpSecurityAttributes, PHKEY phkResult, LPDWORD lpdwDisposition, HANDLE hTransaction, PVOID pExtendedParemeter);
export extern(Windows) LSTATUS RegCreateKeyTransactedW(HKEY hKey, LPCWSTR lpSubKey, DWORD Reserved, LPWSTR lpClass, DWORD dwOptions, REGSAM samDesired, const(SECURITY_ATTRIBUTES)* lpSecurityAttributes, PHKEY phkResult, LPDWORD lpdwDisposition, HANDLE hTransaction, PVOID pExtendedParemeter);
version(UNICODE)
	alias RegCreateKeyTransactedW RegCreateKeyTransacted;
else
	alias RegCreateKeyTransactedA RegCreateKeyTransacted;

export extern(Windows) LSTATUS RegDeleteKeyA(HKEY hKey, LPCSTR lpSubKey);
export extern(Windows) LSTATUS RegDeleteKeyW(HKEY hKey, LPCWSTR lpSubKey);
version(UNICODE)
	alias RegDeleteKeyW RegDeleteKey;
else
	alias RegDeleteKeyA RegDeleteKey;

export extern(Windows) LSTATUS RegDeleteKeyExA(HKEY hKey, LPCSTR lpSubKey, REGSAM samDesired, DWORD Reserved);
export extern(Windows) LSTATUS RegDeleteKeyExW(HKEY hKey, LPCWSTR lpSubKey, REGSAM samDesired, DWORD Reserved);
version(UNICODE)
	alias RegDeleteKeyExW RegDeleteKeyEx;
else
	alias RegDeleteKeyExA RegDeleteKeyEx;

export extern(Windows) LSTATUS RegDeleteKeyTransactedA(HKEY hKey, LPCSTR lpSubKey, REGSAM samDesired, DWORD Reserved, HANDLE hTransaction, PVOID pExtendedParameter);
export extern(Windows) LSTATUS RegDeleteKeyTransactedW(HKEY hKey, LPCWSTR lpSubKey, REGSAM samDesired, DWORD Reserved, HANDLE hTransaction, PVOID pExtendedParameter);
version(UNICODE)
	alias RegDeleteKeyTransactedW RegDeleteKeyTransacted;
else
	alias RegDeleteKeyTransactedA RegDeleteKeyTransacted;

export extern(Windows) LONG RegDisableReflectionKey(HKEY hBase);
export extern(Windows) LONG RegEnableReflectionKey(HKEY hBase);
export extern(Windows) LONG RegQueryReflectionKey(HKEY hBase, BOOL* bIsReflectionDisabled);
export extern(Windows) LSTATUS RegDeleteValueA(HKEY hKey, LPCSTR lpValueName);
export extern(Windows) LSTATUS RegDeleteValueW(HKEY hKey, LPCWSTR lpValueName);
version(UNICODE)
	alias RegDeleteValueW RegDeleteValue;
else
	alias RegDeleteValueA RegDeleteValue;

export extern(Windows) LSTATUS RegEnumKeyA(HKEY hKey, DWORD dwIndex, LPSTR lpName, DWORD cchName);
export extern(Windows) LSTATUS RegEnumKeyW(HKEY hKey, DWORD dwIndex, LPWSTR lpName, DWORD cchName);
version(UNICODE)
	alias RegEnumKeyW RegEnumKey;
else
	alias RegEnumKeyA RegEnumKey;

export extern(Windows) LSTATUS RegEnumKeyExA(HKEY hKey, DWORD dwIndex, LPSTR lpName, LPDWORD lpcchName, LPDWORD lpReserved, LPSTR lpClass, LPDWORD lpcchClass, PFILETIME lpftLastWriteTime);
export extern(Windows) LSTATUS RegEnumKeyExW(HKEY hKey, DWORD dwIndex, LPWSTR lpName, LPDWORD lpcchName, LPDWORD lpReserved, LPWSTR lpClass, LPDWORD lpcchClass, PFILETIME lpftLastWriteTime);
version(UNICODE)
	alias RegEnumKeyExW RegEnumKeyEx;
else
	alias RegEnumKeyExA RegEnumKeyEx;

export extern(Windows) LSTATUS RegEnumValueA(HKEY hKey, DWORD dwIndex, LPSTR lpValueName, LPDWORD lpcchValueName, LPDWORD lpReserved, LPDWORD lpType, LPBYTE lpData, LPDWORD lpcbData);
export extern(Windows) LSTATUS RegEnumValueW(HKEY hKey, DWORD dwIndex, LPWSTR lpValueName, LPDWORD lpcchValueName, LPDWORD lpReserved, LPDWORD lpType, LPBYTE lpData, LPDWORD lpcbData);
version(UNICODE)
	alias RegEnumValueW RegEnumValue;
else
	alias RegEnumValueA RegEnumValue;

export extern(Windows) LSTATUS RegFlushKey(HKEY hKey);
export extern(Windows) LSTATUS RegGetKeySecurity(HKEY hKey, SECURITY_INFORMATION SecurityInformation, PSECURITY_DESCRIPTOR pSecurityDescriptor, LPDWORD lpcbSecurityDescriptor);
export extern(Windows) LSTATUS RegLoadKeyA(HKEY hKey, LPCSTR lpSubKey, LPCSTR lpFile);
export extern(Windows) LSTATUS RegLoadKeyW(HKEY hKey, LPCWSTR lpSubKey, LPCWSTR lpFile);
version(UNICODE)
	alias RegLoadKeyW RegLoadKey;
else
	alias RegLoadKeyA RegLoadKey;

export extern(Windows) LSTATUS RegNotifyChangeKeyValue(HKEY hKey, BOOL bWatchSubtree, DWORD dwNotifyFilter, HANDLE hEvent, BOOL fAsynchronous);
export extern(Windows) LSTATUS RegOpenKeyA(HKEY hKey, LPCSTR lpSubKey, PHKEY phkResult);
export extern(Windows) LSTATUS RegOpenKeyW(HKEY hKey, LPCWSTR lpSubKey, PHKEY phkResult);
version(UNICODE)
	alias RegOpenKeyW RegOpenKey;
else
	alias RegOpenKeyA RegOpenKey;

export extern(Windows) LSTATUS RegOpenKeyExA(HKEY hKey, LPCSTR lpSubKey, DWORD ulOptions, REGSAM samDesired, PHKEY phkResult);
export extern(Windows) LSTATUS RegOpenKeyExW(HKEY hKey, LPCWSTR lpSubKey, DWORD ulOptions, REGSAM samDesired, PHKEY phkResult);
version(UNICODE)
	alias RegOpenKeyExW RegOpenKeyEx;
else
	alias RegOpenKeyExA RegOpenKeyEx;

export extern(Windows) LSTATUS RegOpenKeyTransactedA(HKEY hKey, LPCSTR lpSubKey, DWORD ulOptions, REGSAM samDesired, PHKEY phkResult, HANDLE hTransaction, PVOID pExtendedParemeter);
export extern(Windows) LSTATUS RegOpenKeyTransactedW(HKEY hKey, LPCWSTR lpSubKey, DWORD ulOptions, REGSAM samDesired, PHKEY phkResult, HANDLE hTransaction, PVOID pExtendedParemeter);
version(UNICODE)
	alias RegOpenKeyTransactedW RegOpenKeyTransacted;
else
	alias RegOpenKeyTransactedA RegOpenKeyTransacted;

export extern(Windows) LSTATUS RegQueryInfoKeyA(HKEY hKey, LPSTR lpClass, LPDWORD lpcchClass, LPDWORD lpReserved, LPDWORD lpcSubKeys, LPDWORD lpcbMaxSubKeyLen, LPDWORD lpcbMaxClassLen, LPDWORD lpcValues, LPDWORD lpcbMaxValueNameLen, LPDWORD lpcbMaxValueLen, LPDWORD lpcbSecurityDescriptor, PFILETIME lpftLastWriteTime);
export extern(Windows) LSTATUS RegQueryInfoKeyW(HKEY hKey, LPWSTR lpClass, LPDWORD lpcchClass, LPDWORD lpReserved, LPDWORD lpcSubKeys, LPDWORD lpcbMaxSubKeyLen, LPDWORD lpcbMaxClassLen, LPDWORD lpcValues, LPDWORD lpcbMaxValueNameLen, LPDWORD lpcbMaxValueLen, LPDWORD lpcbSecurityDescriptor, PFILETIME lpftLastWriteTime);
version(UNICODE)
	alias RegQueryInfoKeyW RegQueryInfoKey;
else
	alias RegQueryInfoKeyA RegQueryInfoKey;

export extern(Windows) LSTATUS RegQueryValueA(HKEY hKey, LPCSTR lpSubKey, LPSTR lpData, PLONG lpcbData);
export extern(Windows) LSTATUS RegQueryValueW(HKEY hKey, LPCWSTR lpSubKey, LPWSTR lpData, PLONG lpcbData);
version(UNICODE)
	alias RegQueryValueW RegQueryValue;
else
	alias RegQueryValueA RegQueryValue;

export extern(Windows) LSTATUS RegQueryMultipleValuesA(HKEY hKey, PVALENTA val_list, DWORD num_vals, LPSTR lpValueBuf, LPDWORD ldwTotsize);
export extern(Windows) LSTATUS RegQueryMultipleValuesW(HKEY hKey, PVALENTW val_list, DWORD num_vals, LPWSTR lpValueBuf, LPDWORD ldwTotsize);
version(UNICODE)
	alias RegQueryMultipleValuesW RegQueryMultipleValues;
else
	alias RegQueryMultipleValuesA RegQueryMultipleValues;

export extern(Windows) LSTATUS RegQueryValueExA(HKEY hKey, LPCSTR lpValueName, LPDWORD lpReserved, LPDWORD lpType, LPBYTE lpData, LPDWORD lpcbData);
export extern(Windows) LSTATUS RegQueryValueExW(HKEY hKey, LPCWSTR lpValueName, LPDWORD lpReserved, LPDWORD lpType, LPBYTE lpData, LPDWORD lpcbData);
version(UNICODE)
	alias RegQueryValueExW RegQueryValueEx;
else
	alias RegQueryValueExA RegQueryValueEx;

export extern(Windows) LSTATUS RegReplaceKeyA(HKEY hKey, LPCSTR lpSubKey, LPCSTR lpNewFile, LPCSTR lpOldFile);
export extern(Windows) LSTATUS RegReplaceKeyW(HKEY hKey, LPCWSTR lpSubKey, LPCWSTR lpNewFile, LPCWSTR lpOldFile);
version(UNICODE)
	alias RegReplaceKeyW RegReplaceKey;
else
	alias RegReplaceKeyA RegReplaceKey;

export extern(Windows) LSTATUS RegRestoreKeyA(HKEY hKey, LPCSTR lpFile, DWORD dwFlags);
export extern(Windows) LSTATUS RegRestoreKeyW(HKEY hKey, LPCWSTR lpFile, DWORD dwFlags);
version(UNICODE)
	alias RegRestoreKeyW RegRestoreKey;
else
	alias RegRestoreKeyA RegRestoreKey;

static if(WINVER >= _WIN32_WINNT_VISTA)
	export extern(Windows) LSTATUS RegRenameKey(HKEY hKey, LPCWSTR lpSubKeyName, LPCWSTR lpNewKeyName);

export extern(Windows) LSTATUS RegSaveKeyA(HKEY hKey, LPCSTR lpFile, const(SECURITY_ATTRIBUTES)* lpSecurityAttributes);
export extern(Windows) LSTATUS RegSaveKeyW(HKEY hKey, LPCWSTR lpFile, const(SECURITY_ATTRIBUTES)* lpSecurityAttributes);
version(UNICODE)
	alias RegSaveKeyW RegSaveKey;
else
	alias RegSaveKeyA RegSaveKey;

export extern(Windows) LSTATUS RegSetKeySecurity(HKEY hKey, SECURITY_INFORMATION SecurityInformation, PSECURITY_DESCRIPTOR pSecurityDescriptor);
export extern(Windows) LSTATUS RegSetValueA(HKEY hKey, LPCSTR lpSubKey, DWORD dwType, LPCSTR lpData, DWORD cbData);
export extern(Windows) LSTATUS RegSetValueW(HKEY hKey, LPCWSTR lpSubKey, DWORD dwType, LPCWSTR lpData, DWORD cbData);
version(UNICODE)
	alias RegSetValueW RegSetValue;
else
	alias RegSetValueA RegSetValue;

export extern(Windows) LSTATUS RegSetValueExA(HKEY hKey, LPCSTR lpValueName, DWORD Reserved, DWORD dwType, const(BYTE)* lpData,DWORD cbData);
export extern(Windows) LSTATUS RegSetValueExW(HKEY hKey, LPCWSTR lpValueName, DWORD Reserved, DWORD dwType, const(BYTE)* lpData, DWORD cbData);
version(UNICODE)
	alias RegSetValueExW RegSetValueEx;
else
	alias RegSetValueExA RegSetValueEx;

export extern(Windows) LSTATUS RegUnLoadKeyA(HKEY hKey, LPCSTR lpSubKey);
export extern(Windows) LSTATUS RegUnLoadKeyW(HKEY hKey, LPCWSTR lpSubKey);
version(UNICODE)
	alias RegUnLoadKeyW RegUnLoadKey;
else
	alias RegUnLoadKeyA RegUnLoadKey;

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	export extern(Windows) LSTATUS RegDeleteKeyValueA(HKEY hKey, LPCSTR lpSubKey, LPCSTR lpValueName);
	export extern(Windows) LSTATUS RegDeleteKeyValueW(HKEY hKey, LPCWSTR lpSubKey, LPCWSTR lpValueName);
	version(UNICODE)
		alias RegDeleteKeyValueW RegDeleteKeyValue;
	else
		alias RegDeleteKeyValueA RegDeleteKeyValue;
	
	export extern(Windows) LSTATUS RegSetKeyValueA(HKEY hKey, LPCSTR lpSubKey, LPCSTR lpValueName, DWORD dwType, LPCVOID lpData, DWORD cbData);
	export extern(Windows) LSTATUS RegSetKeyValueW(HKEY hKey, LPCWSTR lpSubKey, LPCWSTR lpValueName, DWORD dwType, LPCVOID lpData, DWORD cbData);
	version(UNICODE)
		alias RegSetKeyValueW RegSetKeyValue;
	else
		alias RegSetKeyValueA RegSetKeyValue;
	
	export extern(Windows) LSTATUS RegDeleteTreeA(HKEY hKey, LPCSTR lpSubKey);
	export extern(Windows) LSTATUS RegDeleteTreeW(HKEY hKey, LPCWSTR lpSubKey);
	version(UNICODE)
		alias RegDeleteTreeW RegDeleteTree;
	else
		alias RegDeleteTreeA RegDeleteTree;

	export extern(Windows) LSTATUS RegCopyTreeA(HKEY hKeySrc, LPCSTR lpSubKey, HKEY hKeyDest);
	export extern(Windows) LSTATUS RegCopyTreeW(HKEY hKeySrc, LPCWSTR lpSubKey, HKEY hKeyDest);
	version(UNICODE)
		alias RegCopyTreeW RegCopyTree;
	else
		alias RegCopyTreeA RegCopyTree;

	export extern(Windows) LSTATUS RegGetValueA(HKEY hkey, LPCSTR lpSubKey, LPCSTR lpValue, DWORD dwFlags, LPDWORD pdwType, PVOID pvData, LPDWORD pcbData);
	export extern(Windows) LSTATUS RegGetValueW(HKEY hkey, LPCWSTR lpSubKey, LPCWSTR lpValue, DWORD dwFlags, LPDWORD pdwType, PVOID pvData, LPDWORD pcbData);
	version(UNICODE)
		alias RegGetValueW RegGetValue;
	else
		alias RegGetValueA RegGetValue;

	export extern(Windows) LSTATUS RegLoadMUIStringA(HKEY hKey, LPCSTR pszValue, LPSTR pszOutBuf, DWORD cbOutBuf, LPDWORD pcbData, DWORD Flags, LPCSTR pszDirectory);
	export extern(Windows) LSTATUS RegLoadMUIStringW(HKEY hKey, LPCWSTR pszValue, LPWSTR pszOutBuf, DWORD cbOutBuf, LPDWORD pcbData, DWORD Flags, LPCWSTR pszDirectory);
	version(UNICODE)
		alias RegLoadMUIStringW RegLoadMUIString;
	else
		alias RegLoadMUIStringA RegLoadMUIString;

	export extern(Windows) LSTATUS RegLoadAppKeyA(LPCSTR lpFile, PHKEY phkResult, REGSAM samDesired, DWORD dwOptions, DWORD Reserved);
	export extern(Windows) LSTATUS RegLoadAppKeyW(LPCWSTR lpFile, PHKEY phkResult, REGSAM samDesired, DWORD dwOptions, DWORD Reserved);
	version(UNICODE)
		alias RegLoadAppKeyW RegLoadAppKey;
	else
		alias RegLoadAppKeyA RegLoadAppKey;
}

export extern(Windows) BOOL InitiateSystemShutdownA(LPSTR lpMachineName, LPSTR lpMessage, DWORD dwTimeout, BOOL bForceAppsClosed, BOOL bRebootAfterShutdown);
export extern(Windows) BOOL InitiateSystemShutdownW(LPWSTR lpMachineName, LPWSTR lpMessage, DWORD dwTimeout, BOOL bForceAppsClosed, BOOL bRebootAfterShutdown);
version(UNICODE)
	alias InitiateSystemShutdownW InitiateSystemShutdown;
else
	alias InitiateSystemShutdownA InitiateSystemShutdown;

export extern(Windows) BOOL AbortSystemShutdownA(LPSTR lpMachineName);
export extern(Windows) BOOL AbortSystemShutdownW(LPWSTR lpMachineName);
version(UNICODE)
	alias AbortSystemShutdownW AbortSystemShutdown;
else
	alias AbortSystemShutdownA AbortSystemShutdown;


enum {
	REASON_SWINSTALL    = SHTDN_REASON_MAJOR_SOFTWARE | SHTDN_REASON_MINOR_INSTALLATION,
	REASON_HWINSTALL    = SHTDN_REASON_MAJOR_HARDWARE | SHTDN_REASON_MINOR_INSTALLATION,
	REASON_SERVICEHANG  = SHTDN_REASON_MAJOR_SOFTWARE | SHTDN_REASON_MINOR_HUNG,
	REASON_UNSTABLE     = SHTDN_REASON_MAJOR_SYSTEM | SHTDN_REASON_MINOR_UNSTABLE,
	REASON_SWHWRECONF   = SHTDN_REASON_MAJOR_SOFTWARE | SHTDN_REASON_MINOR_RECONFIG,
	REASON_OTHER        = SHTDN_REASON_MAJOR_OTHER | SHTDN_REASON_MINOR_OTHER,
	REASON_UNKNOWN      = SHTDN_REASON_UNKNOWN,
	REASON_LEGACY_API   = SHTDN_REASON_LEGACY_API,
	REASON_PLANNED_FLAG = SHTDN_REASON_FLAG_PLANNED,
}

enum MAX_SHUTDOWN_TIMEOUT = 10 * 365 * 24 * 60 * 60;

export extern(Windows) BOOL InitiateSystemShutdownExA(LPSTR lpMachineName, LPSTR lpMessage, DWORD dwTimeout, BOOL bForceAppsClosed, BOOL bRebootAfterShutdown, DWORD dwReason);
export extern(Windows) BOOL InitiateSystemShutdownExW(LPWSTR lpMachineName, LPWSTR lpMessage, BOOL bForceAppsClosed, BOOL bRebootAfterShutdown, DWORD dwReason);
version(UNICODE)
	alias InitiateSystemShutdownExW InitiateSystemShutdownEx;
else
	alias InitiateSystemShutdownExA InitiateSystemShutdownEx;

enum {
	SHUTDOWN_FORCE_OTHERS         = 0x00000001,
	SHUTDOWN_FORCE_SELF           = 0x00000002,
	SHUTDOWN_RESTART              = 0x00000004,
	SHUTDOWN_POWEROFF             = 0x00000008,
	SHUTDOWN_NOREBOOT             = 0x00000010,
	SHUTDOWN_GRACE_OVERRIDE       = 0x00000020,
	SHUTDOWN_INSTALL_UPDATES      = 0x00000040,
	SHUTDOWN_RESTARTAPPS          = 0x00000080,
	SHUTDOWN_SKIP_SVC_PRESHUTDOWN = 0x00000100,
}

export extern(Windows) DWORD InitiateShutdownA(LPSTR lpMachineName, LPSTR lpMessage, DWORD dwGracePeriod, DWORD dwShutdownFlags, DWORD dwReason);
export extern(Windows) DWORD InitiateShutdownW(LPWSTR lpMachineName, LPWSTR lpMessage, DWORD dwGracePeriod, DWORD dwShutdownFlags, DWORD dwReason);
version(UNICODE)
	alias InitiateShutdownW InitiateShutdown;
else
	alias InitiateShutdownA InitiateShutdown;

export extern(Windows) LSTATUS RegSaveKeyExA(HKEY hKey, LPCSTR lpFile, const(LPSECURITY_ATTRIBUTES) lpSecurityAttributes, DWORD Flags);
export extern(Windows) LSTATUS RegSaveKeyExW(HKEY hKey, LPCWSTR lpFile, const(LPSECURITY_ATTRIBUTES) lpSecurityAttributes, DWORD Flags);
version(UNICODE)
	alias RegSaveKeyExW RegSaveKeyEx;
else
	alias RegSaveKeyExA RegSaveKeyEx;

} // extern(C)
