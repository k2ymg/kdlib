/** shellapi.d

Converted from 'shellapi.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.shellapi;


import c.windows.sdkddkver;
import c.windows.windef;
import c.windows.winbase;
import c.windows.guiddef;
import c.windows.winuser;
import c.windows.iphlpapi;


extern(C){

enum HDROP : HANDLE {init = (HANDLE).init}
export extern(Windows) UINT DragQueryFileA(HDROP hDrop, UINT iFile, LPSTR lpszFile, UINT cch);
export extern(Windows) UINT DragQueryFileW(HDROP hDrop, UINT iFile, LPWSTR lpszFile, UINT cch);
version(UNICODE)
	alias DragQueryFileW DragQueryFile;
else
	alias DragQueryFileA DragQueryFile;
export extern(Windows) BOOL DragQueryPoint(HDROP hDrop, LPPOINT lppt);
export extern(Windows) void DragFinish(HDROP hDrop);
export extern(Windows) void DragAcceptFiles(HWND hWnd, BOOL fAccept);
export extern(Windows) HINSTANCE ShellExecuteA(HWND hwnd, LPCSTR lpOperation, LPCSTR lpFile, LPCSTR lpParameters, LPCSTR lpDirectory, INT nShowCmd);
export extern(Windows) HINSTANCE ShellExecuteW(HWND hwnd, LPCWSTR lpOperation, LPCWSTR lpFile, LPCWSTR lpParameters, LPCWSTR lpDirectory, INT nShowCmd);
version(UNICODE)
	alias ShellExecuteW ShellExecute;
else
	alias ShellExecuteA ShellExecute;
export extern(Windows) HINSTANCE FindExecutableA(LPCSTR lpFile, LPCSTR lpDirectory, LPSTR lpResult);
export extern(Windows) HINSTANCE FindExecutableW(LPCWSTR lpFile, LPCWSTR lpDirectory, LPWSTR lpResult);
version(UNICODE)
	alias FindExecutableW FindExecutable;
else
	alias FindExecutableA FindExecutable;
export extern(Windows) LPWSTR* CommandLineToArgvW(LPCWSTR lpCmdLine,int* pNumArgs);
export extern(Windows) INT ShellAboutA(HWND hWnd, LPCSTR szApp, LPCSTR szOtherStuff, HICON hIcon);
export extern(Windows) INT ShellAboutW(HWND hWnd, LPCWSTR szApp, LPCWSTR szOtherStuff, HICON hIcon);
version(UNICODE)
	alias ShellAboutW ShellAbout;
else
	alias ShellAboutA ShellAbout;
export extern(Windows) HICON DuplicateIcon(HINSTANCE hInst, HICON hIcon);
export extern(Windows) HICON ExtractAssociatedIconA(HINSTANCE hInst, LPSTR pszIconPath, WORD* piIcon);
export extern(Windows) HICON ExtractAssociatedIconW(HINSTANCE hInst, LPWSTR pszIconPath, WORD* piIcon);
version(UNICODE)
	alias ExtractAssociatedIconW ExtractAssociatedIcon;
else
	alias ExtractAssociatedIconA ExtractAssociatedIcon;
export extern(Windows) HICON ExtractAssociatedIconExA(HINSTANCE hInst, LPSTR pszIconPath, WORD* piIconIndex, WORD* piIconId);
export extern(Windows) HICON ExtractAssociatedIconExW(HINSTANCE hInst, LPWSTR pszIconPath, WORD* piIconIndex, WORD* piIconId);
version(UNICODE)
	alias ExtractAssociatedIconExW ExtractAssociatedIconEx;
else
	alias ExtractAssociatedIconExA ExtractAssociatedIconEx;
export extern(Windows) HICON ExtractIconA(HINSTANCE hInst, LPCSTR lpszExeFileName, UINT nIconIndex);
export extern(Windows) HICON ExtractIconW(HINSTANCE hInst, LPCWSTR lpszExeFileName, UINT nIconIndex);
version(UNICODE)
	alias ExtractIconW ExtractIcon;
else
	alias ExtractIconA ExtractIcon;

private struct DRAGINFOT(T) {
	UINT uSize;
	POINT pt;
	BOOL fNC;
	T* lpFileList;
	DWORD grfKeyState;
}
version(Win32){
	align(1){
		alias DRAGINFOT!(char) DRAGINFOA;
		alias DRAGINFOT!(wchar) DRAGINFOW;
	}
}else{
	alias DRAGINFOT!(char) DRAGINFOA;
	alias DRAGINFOT!(wchar) DRAGINFOW;
}
alias DRAGINFOA* LPDRAGINFOA;
alias DRAGINFOW* LPDRAGINFOW;
version(UNICODE){
	alias DRAGINFOW DRAGINFO;
	alias LPDRAGINFOW LPDRAGINFO;
}else{
	alias DRAGINFOA DRAGINFO;
	alias LPDRAGINFOA LPDRAGINFO;
}

enum {
	ABM_NEW              = 0x00000000,
	ABM_REMOVE           = 0x00000001,
	ABM_QUERYPOS         = 0x00000002,
	ABM_SETPOS           = 0x00000003,
	ABM_GETSTATE         = 0x00000004,
	ABM_GETTASKBARPOS    = 0x00000005,
	ABM_ACTIVATE         = 0x00000006,
	ABM_GETAUTOHIDEBAR   = 0x00000007,
	ABM_SETAUTOHIDEBAR   = 0x00000008,
	ABM_WINDOWPOSCHANGED = 0x0000009,
	//(NTDDI_VERSION >= NTDDI_WINXP)
		ABM_SETSTATE = 0x0000000a,
}
enum {
	ABN_STATECHANGE   = 0x0000000,
	ABN_POSCHANGED    = 0x0000001,
	ABN_FULLSCREENAPP = 0x0000002,
	ABN_WINDOWARRANGE = 0x0000003,
}
enum {
	ABS_AUTOHIDE    = 0x0000001,
	ABS_ALWAYSONTOP = 0x0000002,
}
enum {
	ABE_LEFT   = 0,
	ABE_TOP    = 1,
	ABE_RIGHT  = 2,
	ABE_BOTTOM = 3,
}

version(Win32){
	align(1)
	struct APPBARDATA {
		DWORD cbSize;
		HWND hWnd;
		UINT uCallbackMessage;
		UINT uEdge;
		RECT rc;
		LPARAM lParam;
	}
}else{
	struct APPBARDATA {
		DWORD cbSize;
		HWND hWnd;
		UINT uCallbackMessage;
		UINT uEdge;
		RECT rc;
		LPARAM lParam;
	}
}
alias APPBARDATA* PAPPBARDATA;

export extern(Windows) UINT_PTR SHAppBarMessage(DWORD dwMessage,PAPPBARDATA pData);
export extern(Windows) DWORD DoEnvironmentSubstA(LPSTR szString, UINT cchString);
export extern(Windows) DWORD DoEnvironmentSubstW(LPWSTR szString, UINT cchString);
version(UNICODE)
	alias DoEnvironmentSubstW DoEnvironmentSubst;
else
	alias DoEnvironmentSubstA DoEnvironmentSubst;

//	EIRESID(x) (-1 * (int)(x))
export extern(Windows) UINT ExtractIconExA(LPCSTR lpszFile,int nIconIndex, HICON* phiconLarge, HICON* phiconSmall, UINT nIcons);
export extern(Windows) UINT ExtractIconExW(LPCWSTR lpszFile, int nIconIndex, HICON* phiconLarge, HICON* phiconSmall, UINT nIcons);
version(UNICODE)
	alias ExtractIconExW ExtractIconEx;
else
	alias ExtractIconExA ExtractIconEx;

enum {
	FO_MOVE   = 0x0001,
	FO_COPY   = 0x0002,
	FO_DELETE = 0x0003,
	FO_RENAME = 0x0004,
}
enum {
	FOF_MULTIDESTFILES        = 0x0001,
	FOF_CONFIRMMOUSE          = 0x0002,
	FOF_SILENT                = 0x0004,
	FOF_RENAMEONCOLLISION     = 0x0008,
	FOF_NOCONFIRMATION        = 0x0010,
	FOF_WANTMAPPINGHANDLE     = 0x0020,
	FOF_ALLOWUNDO             = 0x0040,
	FOF_FILESONLY             = 0x0080,
	FOF_SIMPLEPROGRESS        = 0x0100,
	FOF_NOCONFIRMMKDIR        = 0x0200,
	FOF_NOERRORUI             = 0x0400,
	FOF_NOCOPYSECURITYATTRIBS = 0x0800,
	FOF_NORECURSION           = 0x1000,
	FOF_NO_CONNECTED_ELEMENTS = 0x2000,
	FOF_WANTNUKEWARNING       = 0x4000,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		FOF_NORECURSEREPARSE = 0x8000,
	FOF_NO_UI                 = FOF_SILENT | FOF_NOCONFIRMATION | FOF_NOERRORUI | FOF_NOCONFIRMMKDIR,
}

alias WORD FILEOP_FLAGS;
enum {
	PO_DELETE     = 0x0013,
	PO_RENAME     = 0x0014,
	PO_PORTCHANGE = 0x0020,
	PO_REN_PORT   = 0x0034,
}

alias WORD PRINTEROP_FLAGS;

private struct SHFILEOPSTRUCTT(T) {
	HWND hwnd;
	UINT wFunc;
	const(T)* pFrom;
	const(T)* pTo;
	FILEOP_FLAGS fFlags;
	BOOL fAnyOperationsAborted;
	LPVOID hNameMappings;
	const(T)* lpszProgressTitle;
}
version(Win32){
	align(1){
		alias SHFILEOPSTRUCTT!(char) SHFILEOPSTRUCTA;
		alias SHFILEOPSTRUCTT!(wchar) SHFILEOPSTRUCTW;
	}
}else{
	alias SHFILEOPSTRUCTT!(char) SHFILEOPSTRUCTA;
	alias SHFILEOPSTRUCTT!(wchar) SHFILEOPSTRUCTW;
}
alias SHFILEOPSTRUCTA* LPSHFILEOPSTRUCTA;
alias SHFILEOPSTRUCTW* LPSHFILEOPSTRUCTW;
version(UNICODE){
	alias SHFILEOPSTRUCTW SHFILEOPSTRUCT;
	alias LPSHFILEOPSTRUCTW LPSHFILEOPSTRUCT;
}else{
	alias SHFILEOPSTRUCTA SHFILEOPSTRUCT;
	alias LPSHFILEOPSTRUCTA LPSHFILEOPSTRUCT;
}

export extern(Windows) int SHFileOperationA(LPSHFILEOPSTRUCTA lpFileOp);
export extern(Windows) int SHFileOperationW(LPSHFILEOPSTRUCTW lpFileOp);
version(UNICODE)
	alias SHFileOperationW SHFileOperation;
else
	alias SHFileOperationA SHFileOperation;
export extern(Windows) void SHFreeNameMappings(HANDLE hNameMappings);

private struct SHNAMEMAPPINGT(T) {
	T* pszOldPath;
	T* pszNewPath;
	int cchOldPath;
	int cchNewPath;
}
version(Win32){
	align(1){
		alias SHNAMEMAPPINGT!(char) SHNAMEMAPPINGA;
		alias SHNAMEMAPPINGT!(wchar) SHNAMEMAPPINGW;
	}
}else{
	alias SHNAMEMAPPINGT!(char) SHNAMEMAPPINGA;
	alias SHNAMEMAPPINGT!(wchar) SHNAMEMAPPINGW;
}
alias SHNAMEMAPPINGA* LPSHNAMEMAPPINGA;
alias SHNAMEMAPPINGW* LPSHNAMEMAPPINGW;
version(UNICODE){
	alias SHNAMEMAPPINGW SHNAMEMAPPING;
	alias LPSHNAMEMAPPINGW LPSHNAMEMAPPING;
}else{
	alias SHNAMEMAPPINGA SHNAMEMAPPING;
	alias LPSHNAMEMAPPINGA LPSHNAMEMAPPING;
}
enum {
	SE_ERR_FNF          = 2,
	SE_ERR_PNF          = 3,
	SE_ERR_ACCESSDENIED = 5,
	SE_ERR_OOM          = 8,
	SE_ERR_DLLNOTFOUND  = 32,
}


enum {
	SE_ERR_SHARE           = 26,
	SE_ERR_ASSOCINCOMPLETE = 27,
	SE_ERR_DDETIMEOUT      = 28,
	SE_ERR_DDEFAIL         = 29,
	SE_ERR_DDEBUSY         = 30,
	SE_ERR_NOASSOC         = 31,
}

enum {
	SEE_MASK_DEFAULT      = 0x00000000,
	SEE_MASK_CLASSNAME    = 0x00000001,
	SEE_MASK_CLASSKEY     = 0x00000003,
	SEE_MASK_IDLIST       = 0x00000004,
	SEE_MASK_INVOKEIDLIST = 0x0000000c,
	//(NTDDI_VERSION < NTDDI_VISTA)
		SEE_MASK_ICON = 0x00000010,
	SEE_MASK_HOTKEY         = 0x00000020,
	SEE_MASK_NOCLOSEPROCESS = 0x00000040,
	SEE_MASK_CONNECTNETDRV  = 0x00000080,
	SEE_MASK_NOASYNC        = 0x00000100,
	SEE_MASK_FLAG_DDEWAIT   = SEE_MASK_NOASYNC,
	SEE_MASK_DOENVSUBST     = 0x00000200,
	SEE_MASK_FLAG_NO_UI     = 0x00000400,
	SEE_MASK_UNICODE        = 0x00004000,
	SEE_MASK_NO_CONSOLE     = 0x00008000,
	SEE_MASK_ASYNCOK        = 0x00100000,
	SEE_MASK_HMONITOR       = 0x00200000,
	//(NTDDI_VERSION >= NTDDI_WINXPSP1)
		SEE_MASK_NOZONECHECKS = 0x00800000,
	SEE_MASK_NOQUERYCLASSSTORE = 0x01000000,
	SEE_MASK_WAITFORINPUTIDLE  = 0x02000000,
	//(NTDDI_VERSION >= NTDDI_WINXP)
		SEE_MASK_FLAG_LOG_USAGE = 0x04000000,
}

private
struct SHELLEXECUTEINFOT(T) {
	DWORD cbSize;
	ULONG fMask;
	HWND hwnd;
	const(T)* lpVerb;
	const(T)* lpFile;
	const(T)* lpParameters;
	const(T)* lpDirectory;
	int nShow;
	HINSTANCE hInstApp;
	void* lpIDList;
	const(T)* lpClass;
	HKEY hkeyClass;
	DWORD dwHotKey;
	union {
		HANDLE hIcon;
		HANDLE hMonitor;
 	}
	HANDLE hProcess;
}
version(Win32){
	align(1){
		alias SHELLEXECUTEINFOT!(char) SHELLEXECUTEINFOA;
		alias SHELLEXECUTEINFOT!(wchar) SHELLEXECUTEINFOW;
	}
}else{
	alias SHELLEXECUTEINFOT!(char) SHELLEXECUTEINFOA;
	alias SHELLEXECUTEINFOT!(wchar) SHELLEXECUTEINFOW;
}
alias SHELLEXECUTEINFOA* LPSHELLEXECUTEINFOA;
alias SHELLEXECUTEINFOW* LPSHELLEXECUTEINFOW;
version(UNICODE){
	alias SHELLEXECUTEINFOW SHELLEXECUTEINFO;
	alias LPSHELLEXECUTEINFOW LPSHELLEXECUTEINFO;
}else{
	alias SHELLEXECUTEINFOA SHELLEXECUTEINFO;
	alias LPSHELLEXECUTEINFOA LPSHELLEXECUTEINFO;
}

export extern(Windows) BOOL ShellExecuteExA(SHELLEXECUTEINFOA* pExecInfo);
export extern(Windows) BOOL ShellExecuteExW(SHELLEXECUTEINFOW* pExecInfo);
version(UNICODE)
	alias ShellExecuteExW ShellExecuteEx;
else
	alias ShellExecuteExA ShellExecuteEx;

version(Win32){
	align(1)
	struct SHCREATEPROCESSINFOW {
		DWORD cbSize;
		ULONG fMask;
		HWND hwnd;
		LPCWSTR pszFile;
		LPCWSTR pszParameters;
		LPCWSTR pszCurrentDirectory;
		HANDLE hUserToken;
		LPSECURITY_ATTRIBUTES lpProcessAttributes;
		LPSECURITY_ATTRIBUTES lpThreadAttributes;
		BOOL bInheritHandles;
		DWORD dwCreationFlags;
		LPSTARTUPINFOW lpStartupInfo;
		LPPROCESS_INFORMATION lpProcessInformation;
	}
}else{
	struct SHCREATEPROCESSINFOW {
		DWORD cbSize;
		ULONG fMask;
		HWND hwnd;
		LPCWSTR pszFile;
		LPCWSTR pszParameters;
		LPCWSTR pszCurrentDirectory;
		HANDLE hUserToken;
		LPSECURITY_ATTRIBUTES lpProcessAttributes;
		LPSECURITY_ATTRIBUTES lpThreadAttributes;
		BOOL bInheritHandles;
		DWORD dwCreationFlags;
		LPSTARTUPINFOW lpStartupInfo;
		LPPROCESS_INFORMATION lpProcessInformation;
	}
}
alias SHCREATEPROCESSINFOW* PSHCREATEPROCESSINFOW;

export extern(Windows) BOOL SHCreateProcessAsUserW(PSHCREATEPROCESSINFOW pscpi);

static if(NTDDI_VERSION >= NTDDI_VISTA)
	export extern(Windows) HRESULT SHEvaluateSystemCommandTemplate(PCWSTR pszCmdTemplate, PWSTR* ppszApplication, PWSTR* ppszCommandLine, PWSTR* ppszParameters);

//(NTDDI_VERSION >= NTDDI_VISTA)
	enum {
		ASSOCCLASS_SHELL_KEY = 0,
		ASSOCCLASS_PROGID_KEY,
		ASSOCCLASS_PROGID_STR,
		ASSOCCLASS_CLSID_KEY,
		ASSOCCLASS_CLSID_STR,
		ASSOCCLASS_APP_KEY,
		ASSOCCLASS_APP_STR,
		ASSOCCLASS_SYSTEM_STR,
		ASSOCCLASS_FOLDER,
		ASSOCCLASS_STAR,
	}
	alias int ASSOCCLASS;
	version(Win32){
		align(1)
		struct ASSOCIATIONELEMENT {
			ASSOCCLASS ac;
			HKEY hkClass;
			PCWSTR pszClass;
		}
	}else{
		struct ASSOCIATIONELEMENT {
			ASSOCCLASS ac;
			HKEY hkClass;
			PCWSTR pszClass;
		}
	}

static if(NTDDI_VERSION >= NTDDI_VISTA)
	export extern(Windows) HRESULT AssocCreateForClasses(const(ASSOCIATIONELEMENT)* rgClasses, ULONG cClasses, REFIID riid, void** ppv);


version(Win32){
	struct SHQUERYRBINFO {
		DWORD cbSize;
		long i64Size;
		long i64NumItems;
	}
}else{
	struct SHQUERYRBINFO {
		DWORD cbSize;
		long i64Size;
		long i64NumItems;
	}
}
alias SHQUERYRBINFO* LPSHQUERYRBINFO;

enum {
	SHERB_NOCONFIRMATION = 0x00000001,
	SHERB_NOPROGRESSUI   = 0x00000002,
	SHERB_NOSOUND        = 0x00000004,
}

export extern(Windows) HRESULT SHQueryRecycleBinA(LPCSTR pszRootPath, LPSHQUERYRBINFO pSHQueryRBInfo);
export extern(Windows) HRESULT SHQueryRecycleBinW(LPCWSTR pszRootPath, LPSHQUERYRBINFO pSHQueryRBInfo);
version(UNICODE)
	alias SHQueryRecycleBinW SHQueryRecycleBin;
else
	alias SHQueryRecycleBinA SHQueryRecycleBin;
export extern(Windows) HRESULT SHEmptyRecycleBinA(HWND hwnd, LPCSTR pszRootPath, DWORD dwFlags);
export extern(Windows) HRESULT SHEmptyRecycleBinW(HWND hwnd, LPCWSTR pszRootPath, DWORD dwFlags);
version(UNICODE)
	alias SHEmptyRecycleBinW SHEmptyRecycleBin;
else
	alias SHEmptyRecycleBinA SHEmptyRecycleBin;

//(NTDDI_VERSION >= NTDDI_VISTA)
	enum {
		QUNS_NOT_PRESENT             = 1,
		QUNS_BUSY                    = 2,
		QUNS_RUNNING_D3D_FULL_SCREEN = 3,
		QUNS_PRESENTATION_MODE       = 4,
		QUNS_ACCEPTS_NOTIFICATIONS   = 5,
			//(NTDDI_VERSION >= NTDDI_WIN7)
		QUNS_QUIET_TIME              = 6,
	}
	alias int QUERY_USER_NOTIFICATION_STATE;
static if(NTDDI_VERSION >= NTDDI_VISTA)
	export extern(Windows) HRESULT SHQueryUserNotificationState(QUERY_USER_NOTIFICATION_STATE* pquns);


static if(NTDDI_VERSION >= NTDDI_WIN7)
	export extern(Windows) HRESULT SHGetPropertyStoreForWindow(HWND hwnd, REFIID riid, void** ppv);

private
struct NOTIFYICONDATAT(T) {
	DWORD cbSize;
	HWND hWnd;
	UINT uID;
	UINT uFlags;
	UINT uCallbackMessage;
	HICON hIcon;
	CHAR[128] szTip;
	DWORD dwState;
	DWORD dwStateMask;
	CHAR[256] szInfo;
	union {
		UINT uTimeout;
		UINT uVersion;
	}
	CHAR[64] szInfoTitle;
	DWORD dwInfoFlags;
	//(NTDDI_VERSION >= NTDDI_WINXP)
		GUID guidItem;
	//(NTDDI_VERSION >= NTDDI_VISTA)
		HICON hBalloonIcon;
}
version(Win32){
	align(1){
		alias NOTIFYICONDATAT!(char) NOTIFYICONDATAA;
		alias NOTIFYICONDATAT!(wchar) NOTIFYICONDATAW;
	}
}else{
	alias NOTIFYICONDATAT!(char) NOTIFYICONDATAA;
	alias NOTIFYICONDATAT!(wchar) NOTIFYICONDATAW;
}
alias NOTIFYICONDATAA* PNOTIFYICONDATAA;
alias NOTIFYICONDATAW* PNOTIFYICONDATAW;
version(UNICODE){
	alias NOTIFYICONDATAW NOTIFYICONDATA;
	alias PNOTIFYICONDATAW PNOTIFYICONDATA;
}else{
	alias NOTIFYICONDATAA NOTIFYICONDATA;
	alias PNOTIFYICONDATAA PNOTIFYICONDATA;
}

enum {
	NOTIFYICONDATAA_V1_SIZE = NOTIFYICONDATAA.szTip.offsetof + NOTIFYICONDATAA.szTip.sizeof,
	NOTIFYICONDATAW_V1_SIZE = NOTIFYICONDATAW.szTip.offsetof + NOTIFYICONDATAW.szTip.sizeof,
	NOTIFYICONDATAA_V2_SIZE = NOTIFYICONDATAA.guidItem.offsetof + NOTIFYICONDATAA.guidItem.sizeof,
	NOTIFYICONDATAW_V2_SIZE = NOTIFYICONDATAW.guidItem.offsetof + NOTIFYICONDATAW.guidItem.sizeof,
	NOTIFYICONDATAA_V3_SIZE = NOTIFYICONDATAA.hBalloonIcon.offsetof + NOTIFYICONDATAA.hBalloonIcon.sizeof,
	NOTIFYICONDATAW_V3_SIZE = NOTIFYICONDATAW.hBalloonIcon.offsetof + NOTIFYICONDATAW.hBalloonIcon.sizeof,
}

version(UNICODE){
	enum {
		NOTIFYICONDATA_V1_SIZE = NOTIFYICONDATAW_V1_SIZE,
		NOTIFYICONDATA_V2_SIZE = NOTIFYICONDATAW_V2_SIZE,
		NOTIFYICONDATA_V3_SIZE = NOTIFYICONDATAW_V3_SIZE,
	}
}else{
	enum {
		NOTIFYICONDATA_V1_SIZE = NOTIFYICONDATAA_V1_SIZE,
		NOTIFYICONDATA_V2_SIZE = NOTIFYICONDATAA_V2_SIZE,
		NOTIFYICONDATA_V3_SIZE = NOTIFYICONDATAA_V3_SIZE,
	}
}

enum {
	NIN_SELECT           = WM_USER + 0,
	NINF_KEY             = 0x1,
	NIN_KEYSELECT        = NIN_SELECT | NINF_KEY,
	NIN_BALLOONSHOW      = WM_USER + 2,
	NIN_BALLOONHIDE      = WM_USER + 3,
	NIN_BALLOONTIMEOUT   = WM_USER + 4,
	NIN_BALLOONUSERCLICK = WM_USER + 5,
	//(NTDDI_VERSION >= NTDDI_VISTA)
		NIN_POPUPOPEN  = WM_USER + 6,
		NIN_POPUPCLOSE = WM_USER + 7,
}

enum {
	NIM_ADD            = 0x00000000,
	NIM_MODIFY         = 0x00000001,
	NIM_DELETE         = 0x00000002,
	NIM_SETFOCUS       = 0x00000003,
	NIM_SETVERSION     = 0x00000004,
	NOTIFYICON_VERSION = 3,
	//(NTDDI_VERSION >= NTDDI_VISTA)
		NOTIFYICON_VERSION_4 = 4,
}

enum {
	NIF_MESSAGE = 0x00000001,
	NIF_ICON    = 0x00000002,
	NIF_TIP     = 0x00000004,
	NIF_STATE   = 0x00000008,
	NIF_INFO    = 0x00000010,
	NIF_GUID    = 0x00000020,
	//(NTDDI_VERSION >= NTDDI_VISTA)
		NIF_REALTIME = 0x00000040,
		NIF_SHOWTIP  = 0x00000080,
}

enum {
	NIS_HIDDEN     = 0x00000001,
	NIS_SHAREDICON = 0x00000002,
	NIIF_NONE      = 0x00000000,
	NIIF_INFO      = 0x00000001,
	NIIF_WARNING   = 0x00000002,
	NIIF_ERROR     = 0x00000003,
	//(NTDDI_VERSION >= NTDDI_WINXPSP2)
		NIIF_USER = 0x00000004,
	NIIF_ICON_MASK = 0x0000000F,
	NIIF_NOSOUND   = 0x00000010,
	//(NTDDI_VERSION >= NTDDI_VISTA)
		NIIF_LARGE_ICON = 0x00000020,
	//(NTDDI_VERSION >= NTDDI_WIN7)
		NIIF_RESPECT_QUIET_TIME = 0x00000080,
}

version(Win32){
	align(1)
	struct NOTIFYICONIDENTIFIER {
		DWORD cbSize;
		HWND hWnd;
		UINT uID;
		GUID guidItem;
	}
}else{
	struct NOTIFYICONIDENTIFIER {
		DWORD cbSize;
		HWND hWnd;
		UINT uID;
		GUID guidItem;
	}
}
alias NOTIFYICONIDENTIFIER* PNOTIFYICONIDENTIFIER;

export extern(Windows) BOOL Shell_NotifyIconA(DWORD dwMessage, PNOTIFYICONDATAA lpData);
export extern(Windows) BOOL Shell_NotifyIconW(DWORD dwMessage, PNOTIFYICONDATAW lpData);
version(UNICODE)
	alias Shell_NotifyIconW Shell_NotifyIcon;
else
	alias Shell_NotifyIconA Shell_NotifyIcon;

export extern(Windows) HRESULT Shell_NotifyIconGetRect(const(NOTIFYICONIDENTIFIER)* identifier, RECT* iconLocation);

private
struct SHFILEINFOT(T) {
	HICON hIcon;
	int iIcon;
	DWORD dwAttributes;
	T[MAX_PATH] szDisplayName;
	T[80] szTypeName;
}
version(Win32){
	align(1){
		alias SHFILEINFOT!(char) SHFILEINFOA;
		alias SHFILEINFOT!(wchar) SHFILEINFOW;
	}
}else{
	alias SHFILEINFOT!(char) SHFILEINFOA;
	alias SHFILEINFOT!(wchar) SHFILEINFOW;
}
version(UNICODE)
	alias SHFILEINFOW SHFILEINFO;
else
	alias SHFILEINFOA SHFILEINFO;

enum {
	SHGFI_ICON              = 0x000000100,
	SHGFI_DISPLAYNAME       = 0x000000200,
	SHGFI_TYPENAME          = 0x000000400,
	SHGFI_ATTRIBUTES        = 0x000000800,
	SHGFI_ICONLOCATION      = 0x000001000,
	SHGFI_EXETYPE           = 0x000002000,
	SHGFI_SYSICONINDEX      = 0x000004000,
	SHGFI_LINKOVERLAY       = 0x000008000,
	SHGFI_SELECTED          = 0x000010000,
	SHGFI_ATTR_SPECIFIED    = 0x000020000,
	SHGFI_LARGEICON         = 0x000000000,
	SHGFI_SMALLICON         = 0x000000001,
	SHGFI_OPENICON          = 0x000000002,
	SHGFI_SHELLICONSIZE     = 0x000000004,
	SHGFI_PIDL              = 0x000000008,
	SHGFI_USEFILEATTRIBUTES = 0x000000010,
	SHGFI_ADDOVERLAYS       = 0x000000020,
	SHGFI_OVERLAYINDEX      = 0x000000040,
}

export extern(Windows) DWORD_PTR SHGetFileInfoA(LPCSTR pszPath, DWORD dwFileAttributes, SHFILEINFOA* psfi, UINT cbFileInfo, UINT uFlags);
export extern(Windows) DWORD_PTR SHGetFileInfoW(LPCWSTR pszPath, DWORD dwFileAttributes, SHFILEINFOW* psfi, UINT cbFileInfo, UINT uFlags);
version(UNICODE)
	alias SHGetFileInfoW SHGetFileInfo;
else
	alias SHGetFileInfoA SHGetFileInfo;

//(NTDDI_VERSION >= NTDDI_VISTA)
	version(Win32){
		align(1)
		struct SHSTOCKICONINFO {
			DWORD cbSize;
			HICON hIcon;
			int iSysImageIndex;
			int iIcon;
			WCHAR[MAX_PATH] szPath;
		}
	}else{
		struct SHSTOCKICONINFO {
			DWORD cbSize;
			HICON hIcon;
			int iSysImageIndex;
			int iIcon;
			WCHAR[MAX_PATH] szPath;
		}
	}

	enum {
		SHGSI_ICONLOCATION  = 0,
		SHGSI_ICON          = SHGFI_ICON,
		SHGSI_SYSICONINDEX  = SHGFI_SYSICONINDEX,
		SHGSI_LINKOVERLAY   = SHGFI_LINKOVERLAY,
		SHGSI_SELECTED      = SHGFI_SELECTED,
		SHGSI_LARGEICON     = SHGFI_LARGEICON,
		SHGSI_SMALLICON     = SHGFI_SMALLICON,
		SHGSI_SHELLICONSIZE = SHGFI_SHELLICONSIZE,
	}

	enum SHSTOCKICONID {
		SIID_DOCNOASSOC        = 0,
		SIID_DOCASSOC          = 1,
		SIID_APPLICATION       = 2,
		SIID_FOLDER            = 3,
		SIID_FOLDEROPEN        = 4,
		SIID_DRIVE525          = 5,
		SIID_DRIVE35           = 6,
		SIID_DRIVEREMOVE       = 7,
		SIID_DRIVEFIXED        = 8,
		SIID_DRIVENET          = 9,
		SIID_DRIVENETDISABLED  = 10,
		SIID_DRIVECD           = 11,
		SIID_DRIVERAM          = 12,
		SIID_WORLD             = 13,
		SIID_SERVER            = 15,
		SIID_PRINTER           = 16,
		SIID_MYNETWORK         = 17,
		SIID_FIND              = 22,
		SIID_HELP              = 23,
		SIID_SHARE             = 28,
		SIID_LINK              = 29,
		SIID_SLOWFILE          = 30,
		SIID_RECYCLER          = 31,
		SIID_RECYCLERFULL      = 32,
		SIID_MEDIACDAUDIO      = 40,
		SIID_LOCK              = 47,
		SIID_AUTOLIST          = 49,
		SIID_PRINTERNET        = 50,
		SIID_SERVERSHARE       = 51,
		SIID_PRINTERFAX        = 52,
		SIID_PRINTERFAXNET     = 53,
		SIID_PRINTERFILE       = 54,
		SIID_STACK             = 55,
		SIID_MEDIASVCD         = 56,
		SIID_STUFFEDFOLDER     = 57,
		SIID_DRIVEUNKNOWN      = 58,
		SIID_DRIVEDVD          = 59,
		SIID_MEDIADVD          = 60,
		SIID_MEDIADVDRAM       = 61,
		SIID_MEDIADVDRW        = 62,
		SIID_MEDIADVDR         = 63,
		SIID_MEDIADVDROM       = 64,
		SIID_MEDIACDAUDIOPLUS  = 65,
		SIID_MEDIACDRW         = 66,
		SIID_MEDIACDR          = 67,
		SIID_MEDIACDBURN       = 68,
		SIID_MEDIABLANKCD      = 69,
		SIID_MEDIACDROM        = 70,
		SIID_AUDIOFILES        = 71,
		SIID_IMAGEFILES        = 72,
		SIID_VIDEOFILES        = 73,
		SIID_MIXEDFILES        = 74,
		SIID_FOLDERBACK        = 75,
		SIID_FOLDERFRONT       = 76,
		SIID_SHIELD            = 77,
		SIID_WARNING           = 78,
		SIID_INFO              = 79,
		SIID_ERROR             = 80,
		SIID_KEY               = 81,
		SIID_SOFTWARE          = 82,
		SIID_RENAME            = 83,
		SIID_DELETE            = 84,
		SIID_MEDIAAUDIODVD     = 85,
		SIID_MEDIAMOVIEDVD     = 86,
		SIID_MEDIAENHANCEDCD   = 87,
		SIID_MEDIAENHANCEDDVD  = 88,
		SIID_MEDIAHDDVD        = 89,
		SIID_MEDIABLURAY       = 90,
		SIID_MEDIAVCD          = 91,
		SIID_MEDIADVDPLUSR     = 92,
		SIID_MEDIADVDPLUSRW    = 93,
		SIID_DESKTOPPC         = 94,
		SIID_MOBILEPC          = 95,
		SIID_USERS             = 96,
		SIID_MEDIASMARTMEDIA   = 97,
		SIID_MEDIACOMPACTFLASH = 98,
		SIID_DEVICECELLPHONE   = 99,
		SIID_DEVICECAMERA      = 100,
		SIID_DEVICEVIDEOCAMERA = 101,
		SIID_DEVICEAUDIOPLAYER = 102,
		SIID_NETWORKCONNECT    = 103,
		SIID_INTERNET          = 104,
		SIID_ZIPFILE           = 105,
		SIID_SETTINGS          = 106,
		SIID_DRIVEHDDVD        = 132,
		SIID_DRIVEBD           = 133,
		SIID_MEDIAHDDVDROM     = 134,
		SIID_MEDIAHDDVDR       = 135,
		SIID_MEDIAHDDVDRAM     = 136,
		SIID_MEDIABDROM        = 137,
		SIID_MEDIABDR          = 138,
		SIID_MEDIABDRE         = 139,
		SIID_CLUSTEREDDRIVE    = 140,
		SIID_MAX_ICONS         = 174,
	}
	enum SIID_INVALID = cast(SHSTOCKICONID)-1;
static if(NTDDI_VERSION >= NTDDI_VISTA)
	export extern(Windows) HRESULT SHGetStockIconInfo(SHSTOCKICONID siid, UINT uFlags, SHSTOCKICONINFO* psii);


export extern(Windows) BOOL SHGetDiskFreeSpaceExA(LPCSTR pszDirectoryName, ULARGE_INTEGER* pulFreeBytesAvailableToCaller, ULARGE_INTEGER* pulTotalNumberOfBytes, ULARGE_INTEGER* pulTotalNumberOfFreeBytes);
export extern(Windows) BOOL SHGetDiskFreeSpaceExW(LPCWSTR pszDirectoryName, ULARGE_INTEGER* pulFreeBytesAvailableToCaller, ULARGE_INTEGER* pulTotalNumberOfBytes, ULARGE_INTEGER* pulTotalNumberOfFreeBytes);
version(UNICODE)
	alias SHGetDiskFreeSpaceExW SHGetDiskFreeSpaceEx;
else
	alias SHGetDiskFreeSpaceExA SHGetDiskFreeSpaceEx;
alias SHGetDiskFreeSpaceEx SHGetDiskFreeSpace;

export extern(Windows) BOOL SHGetNewLinkInfoA(LPCSTR pszLinkTo, LPCSTR pszDir, LPSTR pszName, BOOL* pfMustCopy, UINT uFlags);
export extern(Windows) BOOL SHGetNewLinkInfoW(LPCWSTR pszLinkTo, LPCWSTR pszDir, LPWSTR pszName, BOOL* pfMustCopy, UINT uFlags);
version(UNICODE)
	alias SHGetNewLinkInfoW SHGetNewLinkInfo;
else
	alias SHGetNewLinkInfoA SHGetNewLinkInfo;

enum {
	SHGNLI_PIDL       = 0x000000001,
	SHGNLI_PREFIXNAME = 0x000000002,
	SHGNLI_NOUNIQUE   = 0x000000004,
	//(_WIN32_IE >= _WIN32_WINNT_WINXP)
		SHGNLI_NOLNK = 0x000000008,
	//(_WIN32_IE >= _WIN32_WINNT_WIN6)
		SHGNLI_NOLOCNAME = 0x000000010,
	//(NTDDI_VERSION >= NTDDI_WIN7)
		SHGNLI_USEURLEXT = 0x000000020,
}

enum {
	PRINTACTION_OPEN             = 0,
	PRINTACTION_PROPERTIES       = 1,
	PRINTACTION_NETINSTALL       = 2,
	PRINTACTION_NETINSTALLLINK   = 3,
	PRINTACTION_TESTPAGE         = 4,
	PRINTACTION_OPENNETPRN       = 5,
	PRINTACTION_DOCUMENTDEFAULTS = 6,
	PRINTACTION_SERVERPROPERTIES = 7,
}

export extern(Windows) BOOL SHInvokePrinterCommandA(HWND hwnd, UINT uAction, LPCSTR lpBuf1, LPCSTR lpBuf2, BOOL fModal);
export extern(Windows) BOOL SHInvokePrinterCommandW(HWND hwnd, UINT uAction, LPCWSTR lpBuf1, LPCWSTR lpBuf2, BOOL fModal);
version(UNICODE)
	alias SHInvokePrinterCommandW SHInvokePrinterCommand;
else
	alias SHInvokePrinterCommandA SHInvokePrinterCommand;

//(NTDDI_VERSION >= NTDDI_VISTA)
	struct OPEN_PRINTER_PROPS_INFOT(T) {
		DWORD dwSize;
		T* pszSheetName;
		UINT uSheetIndex;
		DWORD dwFlags;
		BOOL bModal;
	}
	version(Win32){
		align(1){
			alias OPEN_PRINTER_PROPS_INFOT!(char) OPEN_PRINTER_PROPS_INFOA;
			alias OPEN_PRINTER_PROPS_INFOT!(wchar) OPEN_PRINTER_PROPS_INFOW;
		}
	}else{
		alias OPEN_PRINTER_PROPS_INFOT!(char) OPEN_PRINTER_PROPS_INFOA;
		alias OPEN_PRINTER_PROPS_INFOT!(wchar) OPEN_PRINTER_PROPS_INFOW;
	}
	alias OPEN_PRINTER_PROPS_INFOA* POPEN_PRINTER_PROPS_INFOA;
	alias OPEN_PRINTER_PROPS_INFOW* POPEN_PRINTER_PROPS_INFOW;
	version(UNICODE){
		alias OPEN_PRINTER_PROPS_INFOW OPEN_PRINTER_PROPS_INFO;
		alias POPEN_PRINTER_PROPS_INFOW POPEN_PRINTER_PROPS_INFO;
	}else{
		alias OPEN_PRINTER_PROPS_INFOA OPEN_PRINTER_PROPS_INFO;
		alias POPEN_PRINTER_PROPS_INFOA POPEN_PRINTER_PROPS_INFO;
	}
	enum PRINT_PROP_FORCE_NAME = 0x01;

export extern(Windows) HRESULT SHLoadNonloadedIconOverlayIdentifiers();
export extern(Windows) HRESULT SHIsFileAvailableOffline(LPCWSTR pwszPath, LPDWORD pdwStatus);
enum {
	OFFLINE_STATUS_LOCAL      = 0x0001,
	OFFLINE_STATUS_REMOTE     = 0x0002,
	OFFLINE_STATUS_INCOMPLETE = 0x0004,
}

static if(NTDDI_VERSION >= NTDDI_WINXP)
	export extern(Windows) HRESULT SHSetLocalizedName(LPCWSTR pszPath, LPCWSTR pszResModule, int idsRes);

static if(NTDDI_VERSION >= NTDDI_VISTA){
	export extern(Windows) HRESULT SHRemoveLocalizedName(LPCWSTR pszPath);
	export extern(Windows) HRESULT SHGetLocalizedName(LPCWSTR pszPath, LPWSTR pszResModule, UINT cch, int* pidsRes);
}

export extern(C) int ShellMessageBoxA(HINSTANCE hAppInst, HWND hWnd, LPCSTR lpcText, LPCSTR lpcTitle, UINT fuStyle, ...);
export extern(C) int ShellMessageBoxW(HINSTANCE hAppInst, HWND hWnd, LPCWSTR lpcText, LPCWSTR lpcTitle, UINT fuStyle, ...);
version(UNICODE)
	alias ShellMessageBoxW ShellMessageBox;
else
	alias ShellMessageBoxA ShellMessageBox;

export extern(Windows) BOOL IsLFNDriveA(LPCSTR pszPath);
export extern(Windows) BOOL IsLFNDriveW(LPCWSTR pszPath);
version(UNICODE)
	alias IsLFNDriveW IsLFNDrive;
else
	alias IsLFNDriveA IsLFNDrive;

export extern(Windows) HRESULT SHEnumerateUnreadMailAccountsA(HKEY hKeyUser, DWORD dwIndex, LPSTR pszMailAddress, int cchMailAddress);
export extern(Windows) HRESULT SHEnumerateUnreadMailAccountsW(HKEY hKeyUser, DWORD dwIndex, LPWSTR pszMailAddress, int cchMailAddress);
version(UNICODE)
	alias SHEnumerateUnreadMailAccountsW SHEnumerateUnreadMailAccounts;
else
	alias SHEnumerateUnreadMailAccountsA SHEnumerateUnreadMailAccounts;

export extern(Windows) HRESULT SHGetUnreadMailCountA(HKEY hKeyUser, LPCSTR pszMailAddress, DWORD* pdwCount, FILETIME* pFileTime, LPSTR pszShellExecuteCommand, int cchShellExecuteCommand);
export extern(Windows) HRESULT SHGetUnreadMailCountW(HKEY hKeyUser, LPCWSTR pszMailAddress, DWORD* pdwCount, FILETIME* pFileTime, LPWSTR pszShellExecuteCommand, int cchShellExecuteCommand);
version(UNICODE)
	alias SHGetUnreadMailCountW SHGetUnreadMailCount;
else
	alias SHGetUnreadMailCountA SHGetUnreadMailCount;

export extern(Windows) HRESULT SHSetUnreadMailCountA(LPCSTR pszMailAddress, DWORD dwCount, LPCSTR pszShellExecuteCommand);
export extern(Windows) HRESULT SHSetUnreadMailCountW(LPCWSTR pszMailAddress, DWORD dwCount, LPCWSTR pszShellExecuteCommand);
version(UNICODE)
	alias SHSetUnreadMailCountW SHSetUnreadMailCount;
else
	alias SHSetUnreadMailCountA SHSetUnreadMailCount;

export extern(Windows) BOOL SHTestTokenMembership(HANDLE hToken, ULONG ulRID);

static if(NTDDI_VERSION >= NTDDI_WINXP)
	export extern(Windows) HRESULT SHGetImageList(int iImageList, REFIID riid, void** ppvObj);

//(NTDDI_VERSION >= NTDDI_WINXP)
	enum {
		SHIL_LARGE      = 0,
		SHIL_SMALL      = 1,
		SHIL_EXTRALARGE = 2,
		SHIL_SYSSMALL   = 3,
	//(NTDDI_VERSION >= NTDDI_VISTA)
		SHIL_JUMBO      = 4,
		SHIL_LAST       = SHIL_JUMBO,
	}

alias extern(Windows) HRESULT function(LPCWSTR pszPath) PFNCANSHAREFOLDERW;
alias extern(Windows) HRESULT function(HWND hwndParent, LPCWSTR pszPath) PFNSHOWSHAREFOLDERUIW;


} // extern(C)

//(NTDDI_VERSION >= NTDDI_VISTA)
	const wchar* WC_NETADDRESS = "msctls_netaddress";
static if(NTDDI_VERSION >= NTDDI_VISTA)
	export extern(Windows) BOOL InitNetworkAddressControl();
//(NTDDI_VERSION >= NTDDI_VISTA)
	enum {
		NCM_GETADDRESS      = WM_USER+1,
		NCM_SETALLOWTYPE    = WM_USER+2,
		NCM_GETALLOWTYPE    = WM_USER+3,
		NCM_DISPLAYERRORTIP = WM_USER+4,
	}

	struct NC_ADDRESS {
		NET_ADDRESS_INFO* pAddrInfo;
		USHORT PortNumber;
		BYTE PrefixLength;
	}
	alias NC_ADDRESS* PNC_ADDRESS;

	version(HelperFunctions){
		HRESULT NetAddr_GetAddress(HWND hwnd, LPARAM pv)
		{
			return cast(HRESULT)SendMessage(hwnd, NCM_GETADDRESS, 0, pv);
		}

		HRESULT NetAddr_SetAllowType(HWND hwnd, WPARAM addrMask)
		{
			return cast(HRESULT)SendMessage(hwnd, NCM_SETALLOWTYPE, addrMask, 0);
		}

		DWORD NetAddr_GetAllowType(HWND hwnd)
		{
			return cast(DWORD)SendMessage(hwnd, NCM_GETALLOWTYPE, 0, 0);
		}

		HRESULT NetAddr_DisplayErrorTip(HWND hwnd)
		{
			return cast(HRESULT)SendMessage(hwnd, NCM_DISPLAYERRORTIP, 0, 0);
		}
	}

static if(NTDDI_VERSION >= NTDDI_VISTA)
	export extern(Windows) HRESULT SHGetDriveMedia(LPCWSTR pszDrive, DWORD* pdwMediaContent);
