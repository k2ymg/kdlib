/** shlobj.d

Converted from 'shlobj.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.shlobj;


import c.windows.sdkddkver;
import c.windows.windef;
import c.windows.wtypes;
import c.windows.guiddef;
import c.windows.unknwn;
import c.windows.oleidl;
import c.windows.objidl;
import c.windows.shobjidl;
import c.windows.shtypes;
import c.windows.shellapi;
import c.windows.wincon;
import c.windows.wingdi;
import c.windows.winbase;
import c.windows.winuser;
import c.windows.wininet;
import c.windows.oaidl;
import c.windows.winnetwk;
import c.windows.commctrl;
import c.windows.prsht;
import c.windows.propidl;
import c.windows.urlmon;
import c.windows.mshtml;


extern(C){
align(1){

export extern(Windows){
	HRESULT SHGetMalloc(IMalloc* ppMalloc);
	void* SHAlloc(SIZE_T cb);
	void SHFree(void* pv);
}

enum {
	GIL_OPENICON      = 0x0001,
	GIL_FORSHELL      = 0x0002,
	GIL_ASYNC         = 0x0020,
	GIL_DEFAULTICON   = 0x0040,
	GIL_FORSHORTCUT   = 0x0080,
	GIL_CHECKSHIELD   = 0x0200,
	GIL_SIMULATEDOC   = 0x0001,
	GIL_PERINSTANCE   = 0x0002,
	GIL_PERCLASS      = 0x0004,
	GIL_NOTFILENAME   = 0x0008,
	GIL_DONTCACHE     = 0x0010,
	GIL_SHIELD        = 0x0200,
	GIL_FORCENOSHIELD = 0x0400,
}

interface IExtractIconA : IUnknown {
public extern(Windows):
	HRESULT GetIconLocation(UINT uFlags, LPSTR szIconFile, UINT cchMax, int* piIndex, UINT* pwFlags);
	HRESULT Extract(LPCSTR pszFile, UINT nIconIndex, HICON* phiconLarge, HICON* phiconSmall, UINT nIconSize);
}
mixin DEFINE_IID!(IExtractIconA, "000214eb-0000-0000-c000-000000000046");
alias IExtractIconA LPEXTRACTICONA;

interface IExtractIconW : IUnknown {
public extern(Windows):
	HRESULT GetIconLocation(UINT uFlags, LPWSTR pszIconFile, UINT cchMax, int* piIndex, UINT* pwFlags);
	HRESULT Extract(LPCWSTR pszFile, UINT nIconIndex, HICON* phiconLarge, HICON* phiconSmall, UINT nIconSize);
}
mixin DEFINE_IID!(IExtractIconW, "000214fa-0000-0000-c000-000000000046");
alias IExtractIconW LPEXTRACTICONW;

version(UNICODE){
	alias IExtractIconW IExtractIcon;
	alias LPEXTRACTICONW LPEXTRACTICON;
}else{
	alias IExtractIconA IExtractIcon;
	alias LPEXTRACTICONA LPEXTRACTICON;
}

interface IShellIconOverlayIdentifier : IUnknown {
public extern(Windows):
	HRESULT IsMemberOf(LPCWSTR pwszPath, DWORD dwAttrib);
	HRESULT GetOverlayInfo(LPWSTR pwszIconFile, int cchMax, int* pIndex, DWORD* pdwFlags);
	HRESULT GetPriority(int* pIPriority);
}
mixin DEFINE_IID!(IShellIconOverlayIdentifier, "0c6c4200-c589-11d0-999a-00c04fd655e1");

enum {
	ISIOI_ICONFILE  = 0x00000001,
	ISIOI_ICONINDEX = 0x00000002,
}

interface IShellIconOverlayManager : IUnknown {
public extern(Windows):
	HRESULT GetFileOverlayInfo(LPCWSTR pwszPath, DWORD dwAttrib, int* pIndex, DWORD dwflags);
	HRESULT GetReservedOverlayInfo(LPCWSTR pwszPath, DWORD dwAttrib, int* pIndex, DWORD dwflags, int iReservedID);
	HRESULT RefreshOverlayImages(DWORD dwFlags);
	HRESULT LoadNonloadedOverlayIdentifiers();
	HRESULT OverlayIndexFromImageIndex(int iImage, int* piIndex, BOOL fAdd);
}
mixin DEFINE_IID!(IShellIconOverlayManager, "f10b5e34-dd3b-42a7-aa7d-2f4ec54bb09b");

enum {
	SIOM_OVERLAYINDEX      = 1,
	SIOM_ICONINDEX         = 2,
	SIOM_RESERVED_SHARED   = 0,
	SIOM_RESERVED_LINK     = 1,
	SIOM_RESERVED_SLOWFILE = 2,
	SIOM_RESERVED_DEFAULT  = 3,
}

interface IShellIconOverlay : IUnknown {
public extern(Windows):
	HRESULT GetOverlayIndex(PCUITEMID_CHILD pidl, int* pIndex);
	HRESULT GetOverlayIconIndex(PCUITEMID_CHILD pidl, int* pIconIndex);
}
mixin DEFINE_IID!(IShellIconOverlay, "7d688a70-c613-11d0-999b-00c04fd655e1");

enum {
	OI_DEFAULT = 0x00000000,
	OI_ASYNC   = 0xFFFFEEEE,
}
enum {
	IDO_SHGIOI_SHARE    = 0x0FFFFFFF,
	IDO_SHGIOI_LINK     = 0x0FFFFFFE,
	IDO_SHGIOI_SLOWFILE = 0x0FFFFFFFD,
	IDO_SHGIOI_DEFAULT  = 0x0FFFFFFFC,
}

export extern(Windows){
	int SHGetIconOverlayIndexA(LPCSTR pszIconPath, int iIconIndex);
	int SHGetIconOverlayIndexW(LPCWSTR pszIconPath, int iIconIndex);
}
version(UNICODE)
	alias SHGetIconOverlayIndexW SHGetIconOverlayIndex;
else
	alias SHGetIconOverlayIndexA SHGetIconOverlayIndex;


enum {
	SLDF_DEFAULT            = 0x00000000,
	SLDF_HAS_ID_LIST        = 0x00000001,
	SLDF_HAS_LINK_INFO      = 0x00000002,
	SLDF_HAS_NAME           = 0x00000004,
	SLDF_HAS_RELPATH        = 0x00000008,
	SLDF_HAS_WORKINGDIR     = 0x00000010,
	SLDF_HAS_ARGS           = 0x00000020,
	SLDF_HAS_ICONLOCATION   = 0x00000040,
	SLDF_UNICODE            = 0x00000080,
	SLDF_FORCE_NO_LINKINFO  = 0x00000100,
	SLDF_HAS_EXP_SZ         = 0x00000200,
	SLDF_RUN_IN_SEPARATE    = 0x00000400,
	//(NTDDI_VERSION < NTDDI_VISTA)
		SLDF_HAS_LOGO3ID = 0x00000800,
	SLDF_HAS_DARWINID     = 0x00001000,
	SLDF_RUNAS_USER       = 0x00002000,
	SLDF_HAS_EXP_ICON_SZ  = 0x00004000,
	//(NTDDI_VERSION >= NTDDI_WINXP)
		SLDF_NO_PIDL_ALIAS       = 0x00008000,
		SLDF_FORCE_UNCNAME       = 0x00010000,
		SLDF_RUN_WITH_SHIMLAYER  = 0x00020000,
	//(NTDDI_VERSION >= NTDDI_VISTA)
		SLDF_FORCE_NO_LINKTRACK                     = 0x00040000,
		SLDF_ENABLE_TARGET_METADATA                 = 0x00080000,
		SLDF_DISABLE_LINK_PATH_TRACKING             = 0x00100000,
		SLDF_DISABLE_KNOWNFOLDER_RELATIVE_TRACKING  = 0x00200000,
	//(NTDDI_VERSION >= NTDDI_WIN7)
		SLDF_NO_KF_ALIAS                       = 0x00400000,
		SLDF_ALLOW_LINK_TO_LINK                = 0x00800000,
		SLDF_UNALIAS_ON_SAVE                   = 0x01000000,
		SLDF_PREFER_ENVIRONMENT_PATH           = 0x02000000,
		SLDF_KEEP_LOCAL_IDLIST_FOR_UNC_TARGET  = 0x04000000,
		SLDF_VALID                             = 0x07FFF7FF,
	//SLDF_VALID = 0x003FF7FF,
	SLDF_RESERVED = cast(int)0x80000000,
}
alias int SHELL_LINK_DATA_FLAGS;

struct DATABLOCK_HEADER {
	DWORD cbSize;
	DWORD dwSignature;
}
alias DATABLOCK_HEADER* LPDATABLOCK_HEADER;
alias DATABLOCK_HEADER* LPDBLIST;


struct NT_CONSOLE_PROPS {
	DATABLOCK_HEADER dbh;
	WORD wFillAttribute;
	WORD wPopupFillAttribute;
	COORD dwScreenBufferSize;
	COORD dwWindowSize;
	COORD dwWindowOrigin;
	DWORD nFont;
	DWORD nInputBufferSize;
	COORD dwFontSize;
	UINT uFontFamily;
	UINT uFontWeight;
	WCHAR[LF_FACESIZE] FaceName;
	UINT uCursorSize;
	BOOL bFullScreen;
	BOOL bQuickEdit;
	BOOL bInsertMode;
	BOOL bAutoPosition;
	UINT uHistoryBufferSize;
	UINT uNumberOfHistoryBuffers;
	BOOL bHistoryNoDup;
	COLORREF[16] ColorTable;
}
alias NT_CONSOLE_PROPS* LPNT_CONSOLE_PROPS;
enum NT_CONSOLE_PROPS_SIG = 0xA0000002;

struct NT_FE_CONSOLE_PROPS {
	DATABLOCK_HEADER dbh;
	UINT uCodePage;
}
alias NT_FE_CONSOLE_PROPS* LPNT_FE_CONSOLE_PROPS;
enum NT_FE_CONSOLE_PROPS_SIG = 0xA0000004;

struct EXP_DARWIN_LINK {
	DATABLOCK_HEADER dbh;
	CHAR[MAX_PATH] szDarwinID;
	WCHAR[MAX_PATH] szwDarwinID;
}
alias EXP_DARWIN_LINK* LPEXP_DARWIN_LINK;
enum EXP_DARWIN_ID_SIG = 0xA0000006;
enum EXP_SPECIAL_FOLDER_SIG = 0xA0000005;

struct EXP_SPECIAL_FOLDER {
	DWORD cbSize;
	DWORD dwSignature;
	DWORD idSpecialFolder;
	DWORD cbOffset;
}
alias EXP_SPECIAL_FOLDER* LPEXP_SPECIAL_FOLDER;

struct EXP_SZ_LINK {
	DWORD cbSize;
	DWORD dwSignature;
	CHAR[MAX_PATH] szTarget;
	WCHAR[MAX_PATH] swzTarget;
}
alias EXP_SZ_LINK* LPEXP_SZ_LINK;
enum {
	EXP_SZ_LINK_SIG = 0xA0000001,
	EXP_SZ_ICON_SIG = 0xA0000007,
}

//(NTDDI_VERSION >= NTDDI_VISTA)
	struct EXP_PROPERTYSTORAGE {
		DWORD cbSize;
		DWORD dwSignature;
		BYTE[1] abPropertyStorage;
	}
	enum EXP_PROPERTYSTORAGE_SIG = 0xA0000009;

interface IShellExecuteHookA : IUnknown {
public extern(Windows):
	HRESULT Execute(LPSHELLEXECUTEINFOA pei);
}
mixin DEFINE_IID!(IShellExecuteHookA, "000214f5-0000-0000-c000-000000000046");

interface IShellExecuteHookW : IUnknown {
public extern(Windows):
	HRESULT Execute(LPSHELLEXECUTEINFOW pei);
}
mixin DEFINE_IID!(IShellExecuteHookW, "000214fb-0000-0000-c000-000000000046");

version(UNICODE)
	alias IShellExecuteHookW IShellExecuteHook;
else
	alias IShellExecuteHookA IShellExecuteHook;

interface IURLSearchHook : IUnknown {
public extern(Windows):
	HRESULT Translate(LPWSTR lpwszSearchURL, DWORD cchBufferSize);
}
mixin DEFINE_IID!(IURLSearchHook, "ac60f6a0-0fd9-11d0-99cb-00c04fd64497");

interface ISearchContext : IUnknown {
public extern(Windows):
	HRESULT GetSearchUrl(BSTR* pbstrSearchUrl);
	HRESULT GetSearchText(BSTR* pbstrSearchText);
	HRESULT GetSearchStyle(DWORD* pdwSearchStyle);
}
mixin DEFINE_IID!(ISearchContext, "09F656A2-41AF-480C-88F7-16CC0D164615");

interface IURLSearchHook2 : IURLSearchHook {
public extern(Windows):
	HRESULT TranslateWithSearchContext(LPWSTR lpwszSearchURL, DWORD cchBufferSize, ISearchContext pSearchContext);
};
mixin DEFINE_IID!(IURLSearchHook2, "5ee44da4-6d32-46e3-86bc-07540dedd0e0");

interface INewShortcutHookA : IUnknown {
public extern(Windows):
	HRESULT SetReferent(LPCSTR pcszReferent, HWND hwnd);
	HRESULT GetReferent(LPSTR pszReferent, int cchReferent);
	HRESULT SetFolder(LPCSTR pcszFolder);
	HRESULT GetFolder(LPSTR pszFolder, int cchFolder);
	HRESULT GetName(LPSTR pszName, int cchName);
	HRESULT GetExtension(LPSTR pszExtension, int cchExtension);
}
mixin DEFINE_IID!(INewShortcutHookA, "000214e1-0000-0000-c000-000000000046");

interface INewShortcutHookW : IUnknown {
public extern(Windows):
	HRESULT SetReferent(LPCWSTR pcszReferent, HWND hwnd);
	HRESULT GetReferent(LPWSTR pszReferent, int cchReferent);
	HRESULT SetFolder(LPCWSTR pcszFolder);
	HRESULT GetFolder(LPWSTR pszFolder, int cchFolder);
	HRESULT GetName(LPWSTR pszName, int cchName);
	HRESULT GetExtension(LPWSTR pszExtension, int cchExtension);
}
mixin DEFINE_IID!(INewShortcutHookW, "000214f7-0000-0000-c000-000000000046");

version(UNICODE)
	alias INewShortcutHookW INewShortcutHook;
else
	alias INewShortcutHookA INewShortcutHook;

interface ICopyHookA : IUnknown {
public extern(Windows):
	UINT CopyCallback(HWND hwnd, UINT wFunc, UINT wFlags, LPCSTR pszSrcFile, DWORD dwSrcAttribs, LPCSTR pszDestFile, DWORD dwDestAttribs);
}
mixin DEFINE_IID!(ICopyHookA, "000214EF-0000-0000-c000-000000000046");
alias ICopyHookA LPCOPYHOOKA;

interface ICopyHookW : IUnknown {
public extern(Windows):
	UINT CopyCallback(HWND hwnd, UINT wFunc, UINT wFlags, LPCWSTR pszSrcFile, DWORD dwSrcAttribs, LPCWSTR pszDestFile, DWORD dwDestAttribs);
}
mixin DEFINE_IID!(ICopyHookW, "000214FC-0000-0000-c000-000000000046");
alias ICopyHookW LPCOPYHOOKW;

version(UNICODE){
	alias ICopyHookW ICopyHook;
	alias LPCOPYHOOKW LPCOPYHOOK;
}else{
	alias ICopyHookA ICopyHook;
	alias LPCOPYHOOKA LPCOPYHOOK;
}

interface IFileViewerSite : IUnknown {
public extern(Windows):
	HRESULT SetPinnedWindow(HWND hwnd);
	HRESULT GetPinnedWindow(HWND* phwnd);
}
mixin DEFINE_IID!(IFileViewerSite, "000214f3-0000-0000-c000-000000000046");
alias IFileViewerSite LPFILEVIEWERSITE;

align(8)
struct FVSHOWINFO {
	DWORD cbSize;
	HWND hwndOwner;
	int iShow;
	DWORD dwFlags;
	RECT rect;
	IUnknown punkRel;
	OLECHAR[MAX_PATH] strNewFile;
}
alias FVSHOWINFO* LPFVSHOWINFO;

enum {
	FVSIF_RECT      = 0x00000001,
	FVSIF_PINNED    = 0x00000002,
	FVSIF_NEWFAILED = 0x08000000,
	FVSIF_NEWFILE   = 0x80000000,
	FVSIF_CANVIEWIT = 0x40000000,
}

interface IFileViewerA : IUnknown {
public extern(Windows):
	HRESULT ShowInitialize(LPFILEVIEWERSITE lpfsi);
	HRESULT Show(LPFVSHOWINFO pvsi);
	HRESULT PrintTo(LPSTR pszDriver, BOOL fSuppressUI);
}
mixin DEFINE_IID!(IFileViewerA, "000214f0-0000-0000-c000-000000000046");
alias IFileViewerA LPFILEVIEWERA;

interface IFileViewerW : IUnknown {
public extern(Windows):
	HRESULT ShowInitialize(LPFILEVIEWERSITE lpfsi);
	HRESULT Show(LPFVSHOWINFO pvsi);
	HRESULT PrintTo(LPWSTR pszDriver, BOOL fSuppressUI);
}
mixin DEFINE_IID!(IFileViewerW, "000214f8-0000-0000-c000-000000000046");
alias IFileViewerW LPFILEVIEWERW;

version(UNICODE){
	alias IFileViewerW IFileViewer;
	alias LPFILEVIEWERW LPFILEVIEWER;
}else{
	alias IFileViewerA IFileViewer;
	alias LPFILEVIEWERA LPFILEVIEWER;
}

enum {
	FCIDM_SHVIEWFIRST  = 0x0000,
	FCIDM_SHVIEWLAST   = 0x7fff,
	FCIDM_BROWSERFIRST = 0xa000,
	FCIDM_BROWSERLAST  = 0xbf00,
	FCIDM_GLOBALFIRST  = 0x8000,
	FCIDM_GLOBALLAST   = 0x9fff,
}

enum {
	FCIDM_MENU_FILE             = FCIDM_GLOBALFIRST + 0x0000,
	FCIDM_MENU_EDIT             = FCIDM_GLOBALFIRST + 0x0040,
	FCIDM_MENU_VIEW             = FCIDM_GLOBALFIRST + 0x0080,
	FCIDM_MENU_VIEW_SEP_OPTIONS = FCIDM_GLOBALFIRST + 0x0081,
	FCIDM_MENU_TOOLS            = FCIDM_GLOBALFIRST + 0x00c0,
	FCIDM_MENU_TOOLS_SEP_GOTO   = FCIDM_GLOBALFIRST + 0x00c1,
	FCIDM_MENU_HELP             = FCIDM_GLOBALFIRST + 0x0100,
	FCIDM_MENU_FIND             = FCIDM_GLOBALFIRST + 0x0140,
	FCIDM_MENU_EXPLORE          = FCIDM_GLOBALFIRST + 0x0150,
	FCIDM_MENU_FAVORITES        = FCIDM_GLOBALFIRST + 0x0170,
	FCIDM_TOOLBAR               = FCIDM_BROWSERFIRST + 0,
	FCIDM_STATUS                = FCIDM_BROWSERFIRST + 1,
}

enum {
	IDC_OFFLINE_HAND = 103,
	//(_WIN32_IE >= _WIN32_IE_IE70)
		IDC_PANTOOL_HAND_OPEN   = 104,
		IDC_PANTOOL_HAND_CLOSED = 105,
}

enum {
	PANE_NONE       = cast(DWORD)-1,
	PANE_ZONE       = 1,
	PANE_OFFLINE    = 2,
	PANE_PRINTER    = 3,
	PANE_SSL        = 4,
	PANE_NAVIGATION = 5,
	PANE_PROGRESS   = 6,
	PANE_PRIVACY    = 7,
}

export extern(Windows){
	PIDLIST_RELATIVE ILClone(PCUIDLIST_RELATIVE pidl);
	PITEMID_CHILD ILCloneFirst(PCUIDLIST_RELATIVE pidl);
	PIDLIST_ABSOLUTE ILCombine(PCIDLIST_ABSOLUTE pidl1, PCUIDLIST_RELATIVE pidl2);
	void ILFree(PIDLIST_RELATIVE pidl);
	PUIDLIST_RELATIVE ILGetNext(PCUIDLIST_RELATIVE pidl);
	UINT ILGetSize(PCUIDLIST_RELATIVE pidl);
	PUIDLIST_RELATIVE ILFindChild(PIDLIST_ABSOLUTE pidlParent, PCIDLIST_ABSOLUTE pidlChild);
	PUITEMID_CHILD ILFindLastID(PCUIDLIST_RELATIVE pidl);
	BOOL ILRemoveLastID(PUIDLIST_RELATIVE pidl);
	BOOL ILIsEqual(PCIDLIST_ABSOLUTE pidl1, PCIDLIST_ABSOLUTE pidl2);
	BOOL ILIsParent(PCIDLIST_ABSOLUTE pidl1, PCIDLIST_ABSOLUTE pidl2, BOOL fImmediate);
	HRESULT ILSaveToStream(IStream pstm, PCUIDLIST_RELATIVE pidl);
	deprecated HRESULT ILLoadFromStream(IStream pstm, PIDLIST_RELATIVE* pidl);

	static if(NTDDI_VERSION >= NTDDI_VISTA)
		HRESULT ILLoadFromStreamEx(IStream pstm, PIDLIST_RELATIVE* pidl);

	PIDLIST_ABSOLUTE ILCreateFromPathA(LPCSTR pszPath);
	PIDLIST_ABSOLUTE ILCreateFromPathW(LPCWSTR pszPath);
	version(UNICODE)
		alias ILCreateFromPathW ILCreateFromPath;
	else
		alias ILCreateFromPathA ILCreateFromPath;

	HRESULT SHILCreateFromPath(LPCWSTR pszPath, PIDLIST_ABSOLUTE* ppidl, DWORD* rgfInOut);
}


private pure nothrow
void* VOID_OFFSET(void* pv, size_t cb)
{
	return cast(void*)(cast(BYTE*)pv + cb);
}

PIDLIST_ABSOLUTE ILCloneFull(PCUIDLIST_ABSOLUTE pidl)
{
	return cast(PIDLIST_ABSOLUTE)ILClone(cast(PCUIDLIST_RELATIVE)pidl);
}

PITEMID_CHILD ILCloneChild(PCUITEMID_CHILD pidl)
{
	return ILCloneFirst(cast(PCUIDLIST_RELATIVE)pidl);
}

static if(NTDDI_VERSION >= NTDDI_VISTA){
	extern(D) HRESULT ILLoadFromStreamEx(IStream pstm, PIDLIST_ABSOLUTE* ppidl)
	{
		return ILLoadFromStreamEx(pstm, cast(PIDLIST_RELATIVE*)ppidl);
	}

	extern(D) HRESULT ILLoadFromStreamEx(IStream pstm, PITEMID_CHILD* ppidl)
	{
		return ILLoadFromStreamEx(pstm, cast(PIDLIST_RELATIVE*)ppidl);
	}
}

extern(D) PCUIDLIST_RELATIVE ILSkip(PCUIDLIST_RELATIVE pidl, UINT cb)
{
	return cast(PCUIDLIST_RELATIVE)VOID_OFFSET(cast(void*)pidl, cb);
}

extern(D) PUIDLIST_RELATIVE ILSkip(PUIDLIST_RELATIVE pidl, UINT cb)
{
	return cast(PUIDLIST_RELATIVE)ILSkip(cast(PCUIDLIST_RELATIVE)pidl, cb);
}

extern(D) PCUIDLIST_RELATIVE ILNext(PCUIDLIST_RELATIVE pidl)
{
	return ILSkip(pidl, pidl.mkid.cb);
}

extern(D) PUIDLIST_RELATIVE ILNext(PUIDLIST_RELATIVE pidl)
{
	return cast(PUIDLIST_RELATIVE)ILNext(cast(PCUIDLIST_RELATIVE)pidl);
}

BOOL ILIsAligned(PCUIDLIST_RELATIVE pidl)
{
	return cast(BOOL)(((cast(DWORD_PTR)pidl) & ((void*).sizeof - 1)) == 0);
}

BOOL ILIsEmpty(PCUIDLIST_RELATIVE pidl)
{
	return cast(BOOL)((pidl == null) || (pidl.mkid.cb == 0));
}

BOOL ILIsChild(PCUIDLIST_RELATIVE pidl)
{
	return cast(BOOL)(ILIsEmpty(pidl) || ILIsEmpty(ILNext(pidl)));
}

PCUIDLIST_RELATIVE ILFindChild(PCIDLIST_ABSOLUTE pidlParent, PCIDLIST_ABSOLUTE pidlChild)
{
	return cast(PCUIDLIST_RELATIVE)(ILFindChild(cast(PIDLIST_ABSOLUTE)pidlParent, pidlChild));
}

export extern(Windows) PIDLIST_RELATIVE ILAppendID(PIDLIST_RELATIVE pidl, LPCSHITEMID pmkid, BOOL fAppend);
//(NTDDI_VERSION >= NTDDI_VISTA)
	enum {
		GPFIDL_DEFAULT    = 0x0000,
		GPFIDL_ALTNAME    = 0x0001,
		GPFIDL_UNCPRINTER = 0x0002,
	}
	alias int GPFIDL_FLAGS;
static if(NTDDI_VERSION >= NTDDI_VISTA)
	export extern(Windows) BOOL SHGetPathFromIDListEx(PCIDLIST_ABSOLUTE pidl, PWSTR pszPath, DWORD cchPath, GPFIDL_FLAGS uOpts);

export extern(Windows){
	BOOL SHGetPathFromIDListA(PCIDLIST_ABSOLUTE pidl, LPSTR pszPath);
	BOOL SHGetPathFromIDListW(PCIDLIST_ABSOLUTE pidl, LPWSTR pszPath);
	version(UNICODE)
		alias SHGetPathFromIDListW SHGetPathFromIDList;
	else
		alias SHGetPathFromIDListA SHGetPathFromIDList;

	int SHCreateDirectory(HWND hwnd, LPCWSTR pszPath);
	int SHCreateDirectoryExA(HWND hwnd, LPCSTR pszPath, const(SECURITY_ATTRIBUTES)* psa);
	int SHCreateDirectoryExW(HWND hwnd, LPCWSTR pszPath, const(SECURITY_ATTRIBUTES)* psa);
	version(UNICODE)
		alias SHCreateDirectoryExW SHCreateDirectoryEx;
	else
		alias SHCreateDirectoryExA SHCreateDirectoryEx;
}

//(NTDDI_VERSION >= NTDDI_VISTA)
	enum {
		OFASI_EDIT        = 0x0001,
		OFASI_OPENDESKTOP = 0x0002,
	}

static if(NTDDI_VERSION >= NTDDI_WINXP){
	export extern(Windows){
		HRESULT SHOpenFolderAndSelectItems(PCIDLIST_ABSOLUTE pidlFolder, UINT cidl, PCUITEMID_CHILD_ARRAY apidl, DWORD dwFlags);
		HRESULT SHCreateShellItem(PCIDLIST_ABSOLUTE pidlParent, IShellFolder psfParent, PCUITEMID_CHILD pidl, IShellItem* ppsi);
	}
}

//	REGSTR_PATH_SPECIAL_FOLDERS REGSTR_PATH_EXPLORER TEXT("\\Shell Folders")

enum {
	CSIDL_DESKTOP                 = 0x0000,
	CSIDL_INTERNET                = 0x0001,
	CSIDL_PROGRAMS                = 0x0002,
	CSIDL_CONTROLS                = 0x0003,
	CSIDL_PRINTERS                = 0x0004,
	CSIDL_PERSONAL                = 0x0005,
	CSIDL_FAVORITES               = 0x0006,
	CSIDL_STARTUP                 = 0x0007,
	CSIDL_RECENT                  = 0x0008,
	CSIDL_SENDTO                  = 0x0009,
	CSIDL_BITBUCKET               = 0x000a,
	CSIDL_STARTMENU               = 0x000b,
	CSIDL_MYDOCUMENTS             = CSIDL_PERSONAL,
	CSIDL_MYMUSIC                 = 0x000d,
	CSIDL_MYVIDEO                 = 0x000e,
	CSIDL_DESKTOPDIRECTORY        = 0x0010,
	CSIDL_DRIVES                  = 0x0011,
	CSIDL_NETWORK                 = 0x0012,
	CSIDL_NETHOOD                 = 0x0013,
	CSIDL_FONTS                   = 0x0014,
	CSIDL_TEMPLATES               = 0x0015,
	CSIDL_COMMON_STARTMENU        = 0x0016,
	CSIDL_COMMON_PROGRAMS         = 0X0017,
	CSIDL_COMMON_STARTUP          = 0x0018,
	CSIDL_COMMON_DESKTOPDIRECTORY = 0x0019,
	CSIDL_APPDATA                 = 0x001a,
	CSIDL_PRINTHOOD               = 0x001b,
	CSIDL_LOCAL_APPDATA           = 0x001c,
	CSIDL_ALTSTARTUP              = 0x001d,
	CSIDL_COMMON_ALTSTARTUP       = 0x001e,
	CSIDL_COMMON_FAVORITES        = 0x001f,
	CSIDL_INTERNET_CACHE          = 0x0020,
	CSIDL_COOKIES                 = 0x0021,
	CSIDL_HISTORY                 = 0x0022,
	CSIDL_COMMON_APPDATA          = 0x0023,
	CSIDL_WINDOWS                 = 0x0024,
	CSIDL_SYSTEM                  = 0x0025,
	CSIDL_PROGRAM_FILES           = 0x0026,
	CSIDL_MYPICTURES              = 0x0027,
	CSIDL_PROFILE                 = 0x0028,
	CSIDL_SYSTEMX86               = 0x0029,
	CSIDL_PROGRAM_FILESX86        = 0x002a,
	CSIDL_PROGRAM_FILES_COMMON    = 0x002b,
	CSIDL_PROGRAM_FILES_COMMONX86 = 0x002c,
	CSIDL_COMMON_TEMPLATES        = 0x002d,
	CSIDL_COMMON_DOCUMENTS        = 0x002e,
	CSIDL_COMMON_ADMINTOOLS       = 0x002f,
	CSIDL_ADMINTOOLS              = 0x0030,
	CSIDL_CONNECTIONS             = 0x0031,
	CSIDL_COMMON_MUSIC            = 0x0035,
	CSIDL_COMMON_PICTURES         = 0x0036,
	CSIDL_COMMON_VIDEO            = 0x0037,
	CSIDL_RESOURCES               = 0x0038,
	CSIDL_RESOURCES_LOCALIZED     = 0x0039,
	CSIDL_COMMON_OEM_LINKS        = 0x003a,
	CSIDL_CDBURN_AREA             = 0x003b,
	CSIDL_COMPUTERSNEARME         = 0x003d,
	CSIDL_FLAG_CREATE             = 0x8000,
	CSIDL_FLAG_DONT_VERIFY        = 0x4000,
	CSIDL_FLAG_DONT_UNEXPAND      = 0x2000,
	//(NTDDI_VERSION >= NTDDI_WINXP)
		CSIDL_FLAG_NO_ALIAS      = 0x1000,
		CSIDL_FLAG_PER_USER_INIT = 0x0800,
	CSIDL_FLAG_MASK = 0xFF00,
}
enum CSIDL_FLAG_PFTI_TRACKTARGET = CSIDL_FLAG_DONT_VERIFY; // from shobjidl.d

export extern(Windows){
	HRESULT SHGetSpecialFolderLocation(HWND hwnd, int csidl, PIDLIST_ABSOLUTE* ppidl);
	PIDLIST_ABSOLUTE SHCloneSpecialIDList(HWND hwnd, int csidl, BOOL fCreate);
	BOOL SHGetSpecialFolderPathA(HWND hwnd, LPSTR pszPath, int csidl, BOOL fCreate);
	BOOL SHGetSpecialFolderPathW(HWND hwnd, LPWSTR pszPath, int csidl, BOOL fCreate);
	version(UNICODE)
		alias SHGetSpecialFolderPathW SHGetSpecialFolderPath;
	else
		alias SHGetSpecialFolderPathA SHGetSpecialFolderPath;

	void SHFlushSFCache();
}

enum {
	SHGFP_TYPE_CURRENT = 0,
	SHGFP_TYPE_DEFAULT = 1,
}
alias int SHGFP_TYPE;

export extern(Windows){
	HRESULT SHGetFolderPathA(HWND hwnd, int csidl, HANDLE hToken, DWORD dwFlags, LPSTR pszPath);
	HRESULT SHGetFolderPathW(HWND hwnd, int csidl, HANDLE hToken, DWORD dwFlags, LPWSTR pszPath);
	version(UNICODE)
		alias SHGetFolderPathW SHGetFolderPath;
	else
		alias SHGetFolderPathA SHGetFolderPath;

	HRESULT SHGetFolderLocation(HWND hwnd, int csidl, HANDLE hToken, DWORD dwFlags, PIDLIST_ABSOLUTE* ppidl);

	static if(NTDDI_VERSION >= NTDDI_WINXP){
		HRESULT SHSetFolderPathA(int csidl, HANDLE hToken, DWORD dwFlags, LPCSTR pszPath);
		HRESULT SHSetFolderPathW(int csidl, HANDLE hToken, DWORD dwFlags, LPCWSTR pszPath);
		version(UNICODE)
			alias SHSetFolderPathW SHSetFolderPath;
		else
			alias SHSetFolderPathA SHSetFolderPath;

		HRESULT SHGetFolderPathAndSubDirA(HWND hwnd, int csidl, HANDLE hToken, DWORD dwFlags, LPCSTR pszSubDir, LPSTR pszPath);
		HRESULT SHGetFolderPathAndSubDirW(HWND hwnd, int csidl, HANDLE hToken, DWORD dwFlags, LPCWSTR pszSubDir, LPWSTR pszPath);
		version(UNICODE)
			alias SHGetFolderPathAndSubDirW SHGetFolderPathAndSubDir;
		else
			alias SHGetFolderPathAndSubDirA SHGetFolderPathAndSubDir;
	}
}

//(NTDDI_VERSION >= NTDDI_VISTA)
	enum {
		KF_FLAG_DEFAULT              = 0x00000000,
		KF_FLAG_CREATE               = 0x00008000,
		KF_FLAG_DONT_VERIFY          = 0x00004000,
		KF_FLAG_DONT_UNEXPAND        = 0x00002000,
		KF_FLAG_NO_ALIAS             = 0x00001000,
		KF_FLAG_INIT                 = 0x00000800,
		KF_FLAG_DEFAULT_PATH         = 0x00000400,
		KF_FLAG_NOT_PARENT_RELATIVE  = 0x00000200,
		KF_FLAG_SIMPLE_IDLIST        = 0x00000100,
		KF_FLAG_ALIAS_ONLY           = 0x80000000,
	}
	alias int KNOWN_FOLDER_FLAG;

static if(NTDDI_VERSION >= NTDDI_VISTA){
	export extern(Windows){
		HRESULT SHGetKnownFolderIDList(REFKNOWNFOLDERID rfid, DWORD dwFlags, HANDLE hToken, PIDLIST_ABSOLUTE* ppidl);
		HRESULT SHSetKnownFolderPath(REFKNOWNFOLDERID rfid, DWORD dwFlags, HANDLE hToken, PCWSTR pszPath);
		HRESULT SHGetKnownFolderPath(REFKNOWNFOLDERID rfid, DWORD dwFlags, HANDLE hToken, PWSTR* ppszPath);
	}
}

static if(NTDDI_VERSION >= NTDDI_WIN7){
	export extern(Windows){
		HRESULT SHGetKnownFolderItem(REFKNOWNFOLDERID rfid, KNOWN_FOLDER_FLAG flags, HANDLE hToken, REFIID riid, void** ppv);
	}
}


enum {
	FCS_READ       = 0x00000001,
	FCS_FORCEWRITE = 0x00000002,
	FCS_WRITE      = FCS_READ | FCS_FORCEWRITE,
}
enum FCS_FLAG_DRAGDROP = 2;

enum {
	FCSM_VIEWID          = 0x00000001,
	FCSM_WEBVIEWTEMPLATE = 0x00000002,
	FCSM_INFOTIP         = 0x00000004,
	FCSM_CLSID           = 0x00000008,
	FCSM_ICONFILE        = 0x00000010,
	FCSM_LOGO            = 0x00000020,
	FCSM_FLAGS           = 0x00000040,
}

//(NTDDI_VERSION >= NTDDI_VISTA)
	align(8)
	struct SHFOLDERCUSTOMSETTINGS {
		DWORD dwSize;
		DWORD dwMask;
		SHELLVIEWID* pvid;
		LPWSTR pszWebViewTemplate;
		DWORD cchWebViewTemplate;
		LPWSTR pszWebViewTemplateVersion;
		LPWSTR pszInfoTip;
		DWORD cchInfoTip;
		CLSID* pclsid;
		DWORD dwFlags;
		LPWSTR pszIconFile;
		DWORD cchIconFile;
		int iIconIndex;
		LPWSTR pszLogo;
		DWORD cchLogo;
	}
	alias SHFOLDERCUSTOMSETTINGS* LPSHFOLDERCUSTOMSETTINGS;

static if(NTDDI_VERSION >= NTDDI_VISTA){
	export extern(Windows) HRESULT SHGetSetFolderCustomSettings(LPSHFOLDERCUSTOMSETTINGS pfcs, LPCWSTR pszPath, DWORD dwReadWrite);
}

alias extern(Windows) int function(HWND hwnd, UINT uMsg, LPARAM lParam, LPARAM lpData) BFFCALLBACK;

align(8){
	struct BROWSEINFOA {
		HWND hwndOwner;
		PCIDLIST_ABSOLUTE pidlRoot;
		LPSTR pszDisplayName;
		LPCSTR lpszTitle;
		UINT ulFlags;
		BFFCALLBACK lpfn;
		LPARAM lParam;
		int iImage;
	}
	alias BROWSEINFOA* PBROWSEINFOA;
	alias BROWSEINFOW* LPBROWSEINFOA;

	struct BROWSEINFOW {
		HWND hwndOwner;
		PCIDLIST_ABSOLUTE pidlRoot;
		LPWSTR pszDisplayName;
		LPCWSTR lpszTitle;
		UINT ulFlags;
		BFFCALLBACK lpfn;
		LPARAM lParam;
		int iImage;
	}
	alias BROWSEINFOW* PBROWSEINFOW;
	alias BROWSEINFOW* LPBROWSEINFOW;
}

version(UNICODE){
	alias BROWSEINFOW BROWSEINFO;
	alias PBROWSEINFOW PBROWSEINFO;
	alias LPBROWSEINFOW LPBROWSEINFO;
}else{
	alias BROWSEINFOA BROWSEINFO;
	alias PBROWSEINFOA PBROWSEINFO;
	alias LPBROWSEINFOA LPBROWSEINFO;
}

enum {
	BIF_RETURNONLYFSDIRS    = 0x00000001,
	BIF_DONTGOBELOWDOMAIN   = 0x00000002,
	BIF_STATUSTEXT          = 0x00000004,
	BIF_RETURNFSANCESTORS   = 0x00000008,
	BIF_EDITBOX             = 0x00000010,
	BIF_VALIDATE            = 0x00000020,
	BIF_NEWDIALOGSTYLE      = 0x00000040,
	BIF_USENEWUI            = BIF_NEWDIALOGSTYLE | BIF_EDITBOX,
	BIF_BROWSEINCLUDEURLS   = 0x00000080,
	BIF_UAHINT              = 0x00000100,
	BIF_NONEWFOLDERBUTTON   = 0x00000200,
	BIF_NOTRANSLATETARGETS  = 0x00000400,
	BIF_BROWSEFORCOMPUTER   = 0x00001000,
	BIF_BROWSEFORPRINTER    = 0x00002000,
	BIF_BROWSEINCLUDEFILES  = 0x00004000,
	BIF_SHAREABLE           = 0x00008000,
	BIF_BROWSEFILEJUNCTIONS = 0x00010000,
	BFFM_INITIALIZED        = 1,
	BFFM_SELCHANGED         = 2,
	BFFM_VALIDATEFAILEDA    = 3,
	BFFM_VALIDATEFAILEDW    = 4,
	BFFM_IUNKNOWN           = 5,
	BFFM_SETSTATUSTEXTA     = WM_USER + 100,
	BFFM_ENABLEOK           = WM_USER + 101,
	BFFM_SETSELECTIONA      = WM_USER + 102,
	BFFM_SETSELECTIONW      = WM_USER + 103,
	BFFM_SETSTATUSTEXTW     = WM_USER + 104,
	BFFM_SETOKTEXT          = WM_USER + 105,
	BFFM_SETEXPANDED        = WM_USER + 106,
}

export extern(Windows){
	PIDLIST_ABSOLUTE SHBrowseForFolderA(LPBROWSEINFOA lpbi);
	PIDLIST_ABSOLUTE SHBrowseForFolderW(LPBROWSEINFOW lpbi);
}
version(UNICODE){
	alias SHBrowseForFolderW SHBrowseForFolder;
	alias BFFM_SETSTATUSTEXTW BFFM_SETSTATUSTEXT;
	alias BFFM_SETSELECTIONW BFFM_SETSELECTION;
	alias BFFM_VALIDATEFAILEDW BFFM_VALIDATEFAILED;
}else{
	alias SHBrowseForFolderA SHBrowseForFolder;
	alias BFFM_SETSTATUSTEXTA BFFM_SETSTATUSTEXT;
	alias BFFM_SETSELECTIONA BFFM_SETSELECTION;
	alias BFFM_VALIDATEFAILEDA BFFM_VALIDATEFAILED;
}

HRESULT SHLoadInProc(REFCLSID rclsid);

enum {
	ISHCUTCMDID_DOWNLOADICON      = 0,
	ISHCUTCMDID_INTSHORTCUTCREATE = 1,
	//(_WIN32_IE >= _WIN32_IE_IE70)
		ISHCUTCMDID_COMMITHISTORY = 2,
		ISHCUTCMDID_SETUSERAWURL  = 3,
}
alias ISHCUTCMDID_INTSHORTCUTCREATE CMDID_INTSHORTCUTCREATE;

const wchar* STR_PARSE_WITH_PROPERTIES = "ParseWithProperties";
const wchar* STR_PARSE_PARTIAL_IDLIST  = "ParseOriginalItem";

export extern(Windows) HRESULT SHGetDesktopFolder(IShellFolder* ppshf);

interface IShellDetails : IUnknown {
public extern(Windows):
	HRESULT GetDetailsOf(PCUITEMID_CHILD pidl, UINT iColumn, SHELLDETAILS* pDetails);
	HRESULT ColumnClick(UINT iColumn);
}
mixin DEFINE_IID!(IShellDetails, "000214EC-0000-0000-c000-000000000046");

interface IObjMgr : IUnknown {
public extern(Windows):
	HRESULT Append(IUnknown punk);
	HRESULT Remove(IUnknown punk);
}
mixin DEFINE_IID!(IObjMgr, "00BB2761-6A77-11D0-A535-00C04FD7D062");

interface ICurrentWorkingDirectory : IUnknown {
public extern(Windows):
	HRESULT GetDirectory(LPWSTR pwzPath, DWORD cchSize);
	HRESULT SetDirectory (LPCWSTR pwzPath);
}
mixin DEFINE_IID!(ICurrentWorkingDirectory, "91956D21-9276-11d1-921A-006097DF5BD4");

interface IACList : IUnknown {
public extern(Windows):
	HRESULT Expand(LPCWSTR pszExpand);
}
mixin DEFINE_IID!(IACList, "77A130B0-94FD-11D0-A544-00C04FD7d062");

enum {
	ACLO_NONE        = 0,
	ACLO_CURRENTDIR  = 1,
	ACLO_MYCOMPUTER  = 2,
	ACLO_DESKTOP     = 4,
	ACLO_FAVORITES   = 8,
	ACLO_FILESYSONLY = 16,
	ACLO_FILESYSDIRS = 32,
	//(_WIN32_IE >= _WIN32_IE_IE70)
		ACLO_VIRTUALNAMESPACE = 64,
}
alias int  AUTOCOMPLETELISTOPTIONS;

interface IACList2 : IACList {
public extern(Windows):
	HRESULT SetOptions(DWORD dwFlag);
	HRESULT GetOptions(DWORD* pdwFlag);
}
mixin DEFINE_IID!(IACList2, "470141a0-5186-11d2-bbb6-0060977b464c");

enum {
	PROGDLG_NORMAL        = 0x00000000,
	PROGDLG_MODAL         = 0x00000001,
	PROGDLG_AUTOTIME      = 0x00000002,
	PROGDLG_NOTIME        = 0x00000004,
	PROGDLG_NOMINIMIZE    = 0x00000008,
	PROGDLG_NOPROGRESSBAR = 0x00000010,
	//(_WIN32_IE >= _WIN32_IE_IE70)
		PROGDLG_MARQUEEPROGRESS = 0x00000020,
		PROGDLG_NOCANCEL        = 0x00000040,
}

enum {
	PDTIMER_RESET = 0x00000001,
	//(_WIN32_IE >= _WIN32_IE_IE70)
		PDTIMER_PAUSE  = 0x00000002,
		PDTIMER_RESUME = 0x00000003,
}

interface IProgressDialog : IUnknown {
public extern(Windows):
	HRESULT StartProgressDialog(HWND hwndParent, IUnknown punkEnableModless, DWORD dwFlags, LPCVOID pvResevered);
	HRESULT StopProgressDialog();
	HRESULT SetTitle(LPCWSTR pwzTitle);
	HRESULT SetAnimation(HINSTANCE hInstAnimation, UINT idAnimation);
	BOOL HasUserCancelled();
	HRESULT SetProgress(DWORD dwCompleted, DWORD dwTotal);
	HRESULT SetProgress64(ULONGLONG ullCompleted, ULONGLONG ullTotal);
	HRESULT SetLine(DWORD dwLineNum, LPCWSTR pwzString, BOOL fCompactPath, LPCVOID pvResevered);
	HRESULT SetCancelMsg(LPCWSTR pwzCancelMsg, LPCVOID pvResevered);
	HRESULT Timer(DWORD dwTimerAction, LPCVOID pvResevered);
}
mixin DEFINE_IID!(IProgressDialog, "EBBC7C04-315E-11d2-B62F-006097DF5BD4");

interface IDockingWindowSite : IOleWindow {
public extern(Windows):
	HRESULT GetBorderDW(IUnknown punkObj, LPRECT prcBorder);
	HRESULT RequestBorderSpaceDW(IUnknown punkObj, LPCBORDERWIDTHS pbw);
	HRESULT SetBorderSpaceDW(IUnknown punkObj, LPCBORDERWIDTHS pbw);
}
mixin DEFINE_IID!(IDockingWindowSite, "2a342fc2-7b26-11d0-8ca9-00a0c92dbfe8");

enum {
	DWFRF_NORMAL           = 0x0000,
	DWFRF_DELETECONFIGDATA = 0x0001,
	DWFAF_HIDDEN           = 0x0001,
	DWFAF_GROUP1           = 0x0002,
	DWFAF_GROUP2           = 0x0004,
	DWFAF_AUTOHIDE         = 0x0010,
}

interface IDockingWindowFrame : IOleWindow {
public extern(Windows):
	HRESULT AddToolbar(IUnknown punkSrc, LPCWSTR pwszItem, DWORD dwAddFlags);
	HRESULT RemoveToolbar(IUnknown punkSrc, DWORD dwRemoveFlags);
	HRESULT FindToolbar(LPCWSTR pwszItem, REFIID riid, void** ppv);
}
mixin DEFINE_IID!(IDockingWindowFrame, "47d2657a-7b27-11d0-8ca9-00a0c92dbfe8");

interface IThumbnailCapture : IUnknown {
public extern(Windows):
	HRESULT CaptureThumbnail(const(SIZE)* pMaxSize, IUnknown pHTMLDoc2, HBITMAP* phbmThumbnail);
}
mixin DEFINE_IID!(IThumbnailCapture, "4ea39266-7211-409f-b622-f63dbd16c533");
alias IThumbnailCapture LPTHUMBNAILCAPTURE;

align(8)
struct ENUMSHELLIMAGESTOREDATA {
	WCHAR[MAX_PATH] szPath;
	FILETIME ftTimeStamp;
}
alias ENUMSHELLIMAGESTOREDATA* PENUMSHELLIMAGESTOREDATA;

interface IEnumShellImageStore : IUnknown {
public extern(Windows):
	HRESULT Reset();
	HRESULT Next(ULONG celt, PENUMSHELLIMAGESTOREDATA* prgElt, ULONG* pceltFetched);
	HRESULT Skip(ULONG celt);
	HRESULT Clone(IEnumShellImageStore* ppEnum);
}
mixin DEFINE_IID!(IEnumShellImageStore, "6DFD582B-92E3-11D1-98A3-00C04FB687DA" );
alias IEnumShellImageStore LPENUMSHELLIMAGESTORE;

enum {
	SHIMSTCAPFLAG_LOCKABLE  = 0x0001,
	SHIMSTCAPFLAG_PURGEABLE = 0x0002,
}

interface IShellImageStore : IUnknown {
public extern(Windows):
	HRESULT Open(DWORD dwMode, DWORD* pdwLock);
	HRESULT Create(DWORD dwMode, DWORD* pdwLock);
	HRESULT ReleaseLock(DWORD* pdwLock);
	HRESULT Close(DWORD* pdwLock);
	HRESULT Commit(DWORD* pdwLock);
	HRESULT IsLocked();
	HRESULT GetMode(DWORD* pdwMode);
	HRESULT GetCapabilities(DWORD* pdwCapMask);
	HRESULT AddEntry(LPCWSTR pszName, const(FILETIME)* pftTimeStamp, DWORD dwMode, HBITMAP hImage);
	HRESULT GetEntry(LPCWSTR pszName, DWORD dwMode, HBITMAP* phImage);
	HRESULT DeleteEntry(LPCWSTR pszName);
	HRESULT IsEntryInStore(LPCWSTR pszName, FILETIME* pftTimeStamp);
	HRESULT Enum(LPENUMSHELLIMAGESTORE* ppEnum);
}
mixin DEFINE_IID!( IShellImageStore, "48C8118C-B924-11D1-98D5-00C04FB687DA" );
alias IShellImageStore LPSHELLIMAGESTORE;

enum {
	ISFB_MASK_STATE         = 0x00000001,
	ISFB_MASK_BKCOLOR       = 0x00000002,
	ISFB_MASK_VIEWMODE      = 0x00000004,
	ISFB_MASK_SHELLFOLDER   = 0x00000008,
	ISFB_MASK_IDLIST        = 0x00000010,
	ISFB_MASK_COLORS        = 0x00000020,
	ISFB_STATE_DEFAULT      = 0x00000000,
	ISFB_STATE_DEBOSSED     = 0x00000001,
	ISFB_STATE_ALLOWRENAME  = 0x00000002,
	ISFB_STATE_NOSHOWTEXT   = 0x00000004,
	ISFB_STATE_CHANNELBAR   = 0x00000010,
	ISFB_STATE_QLINKSMODE   = 0x00000020,
	ISFB_STATE_FULLOPEN     = 0x00000040,
	ISFB_STATE_NONAMESORT   = 0x00000080,
	ISFB_STATE_BTNMINSIZE   = 0x00000100,
	ISFBVIEWMODE_SMALLICONS = 0x0001,
	ISFBVIEWMODE_LARGEICONS = 0x0002,
	//(_WIN32_IE < _WIN32_IE_IE70)
		ISFBVIEWMODE_LOGOS = 0x0003,
}

align(8)
struct BANDINFOSFB {
	DWORD dwMask;
	DWORD dwStateMask;
	DWORD dwState;
	COLORREF crBkgnd;
	COLORREF crBtnLt;
	COLORREF crBtnDk;
	WORD wViewMode;
	WORD wAlign;
	IShellFolder psf;
	PIDLIST_ABSOLUTE pidl;
}
alias BANDINFOSFB* PBANDINFOSFB;

interface IShellFolderBand : IUnknown {
public extern(Windows):
	HRESULT InitializeSFB(IShellFolder psf, PCIDLIST_ABSOLUTE pidl);
	HRESULT SetBandInfoSFB(PBANDINFOSFB pbi);
	HRESULT GetBandInfoSFB(PBANDINFOSFB pbi);
}
mixin DEFINE_IID!(IShellFolderBand, "7FE80CC8-C247-11d0-B93A-00A0C90312E1");

enum {
	SFBID_PIDLCHANGED,
}

interface IDeskBarClient : IOleWindow {
public extern(Windows):
	HRESULT SetDeskBarSite(IUnknown punkSite);
	HRESULT SetModeDBC(DWORD dwMode);
	HRESULT UIActivateDBC(DWORD dwState);
	HRESULT GetSize(DWORD dwWhich, LPRECT prc);
}
mixin DEFINE_IID!(IDeskBarClient, "EB0FE175-1A3A-11D0-89B3-00A0C90A90AC");

enum {
	DBC_GS_IDEAL    = 0,
	DBC_GS_SIZEDOWN = 1,
	DBC_HIDE        = 0,
	DBC_SHOW        = 1,
	DBC_SHOWOBSCURE = 2,
}

enum {
	DBCID_EMPTY      = 0,
	DBCID_ONDRAG     = 1,
	DBCID_CLSIDOFBAR = 2,
	DBCID_RESIZE     = 3,
	DBCID_GETBAR     = 4,
}

struct WALLPAPEROPT {
	DWORD dwSize;
	DWORD dwStyle;
}
alias WALLPAPEROPT* LPWALLPAPEROPT;
alias const(WALLPAPEROPT)* LPCWALLPAPEROPT;

struct COMPONENTSOPT {
	DWORD dwSize;
	BOOL fEnableComponents;
	BOOL fActiveDesktop;
}
alias COMPONENTSOPT* LPCOMPONENTSOPT;
alias const(COMPONENTSOPT)* LPCCOMPONENTSOPT;

struct COMPPOS {
	DWORD dwSize;
	int iLeft;
	int iTop;
	DWORD dwWidth;
	DWORD dwHeight;
	int izIndex;
	BOOL fCanResize;
	BOOL fCanResizeX;
	BOOL fCanResizeY;
	int iPreferredLeftPercent;
	int iPreferredTopPercent;
}
alias COMPPOS* LPCOMPPOS;
alias const(COMPPOS)* LPCCOMPPOS;

struct COMPSTATEINFO {
	DWORD dwSize;
	int iLeft;
	int iTop;
	DWORD dwWidth;
	DWORD dwHeight;
	DWORD dwItemState;
}
alias COMPSTATEINFO* LPCOMPSTATEINFO;
alias const(COMPSTATEINFO)* LPCCOMPSTATEINFO;

enum COMPONENT_TOP = 0x3fffffff;

enum {
	COMP_TYPE_HTMLDOC = 0,
	COMP_TYPE_PICTURE = 1,
	COMP_TYPE_WEBSITE = 2,
	COMP_TYPE_CONTROL = 3,
	COMP_TYPE_CFHTML  = 4,
	COMP_TYPE_MAX     = 4,
}

struct IE4COMPONENT {
	DWORD dwSize;
	DWORD dwID;
	int iComponentType;
	BOOL fChecked;
	BOOL fDirty;
	BOOL fNoScroll;
	COMPPOS cpPos;
	WCHAR[MAX_PATH] wszFriendlyName;
	WCHAR[INTERNET_MAX_URL_LENGTH] wszSource;
	WCHAR[INTERNET_MAX_URL_LENGTH] wszSubscribedURL;
}
alias IE4COMPONENT* LPIE4COMPONENT;
alias const(IE4COMPONENT)* LPCIE4COMPONENT;

struct COMPONENT {
	DWORD dwSize;
	DWORD dwID;
	int iComponentType;
	BOOL fChecked;
	BOOL fDirty;
	BOOL fNoScroll;
	COMPPOS cpPos;
	WCHAR[MAX_PATH] wszFriendlyName;
	WCHAR[INTERNET_MAX_URL_LENGTH] wszSource;
	WCHAR[INTERNET_MAX_URL_LENGTH] wszSubscribedURL;
	DWORD dwCurItemState;
	COMPSTATEINFO csiOriginal;
	COMPSTATEINFO csiRestored;
}
alias COMPONENT* LPCOMPONENT;
alias const(COMPONENT)* LPCCOMPONENT;

enum {
	IS_NORMAL             = 0x00000001,
	IS_FULLSCREEN         = 0x00000002,
	IS_SPLIT              = 0x00000004,
	IS_VALIDSIZESTATEBITS = IS_NORMAL | IS_SPLIT | IS_FULLSCREEN,
	IS_VALIDSTATEBITS     = IS_NORMAL | IS_SPLIT | IS_FULLSCREEN | 0x80000000 | 0x40000000,
}

enum {
	AD_APPLY_SAVE             = 0x00000001,
	AD_APPLY_HTMLGEN          = 0x00000002,
	AD_APPLY_REFRESH          = 0x00000004,
	AD_APPLY_ALL              = AD_APPLY_SAVE | AD_APPLY_HTMLGEN | AD_APPLY_REFRESH,
	AD_APPLY_FORCE            = 0x00000008,
	AD_APPLY_BUFFERED_REFRESH = 0x00000010,
	AD_APPLY_DYNAMICREFRESH   = 0x00000020,
	//(NTDDI_VERSION >= NTDDI_VISTA)
		AD_GETWP_BMP          = 0x00000000,
		AD_GETWP_IMAGE        = 0x00000001,
		AD_GETWP_LAST_APPLIED = 0x00000002,
}

enum {
	WPSTYLE_CENTER  = 0,
	WPSTYLE_TILE    = 1,
	WPSTYLE_STRETCH = 2,
	//(NTDDI_VERSION >= NTDDI_WIN7)
		WPSTYLE_KEEPASPECT = 3,
		WPSTYLE_CROPTOFIT  = 4,
		WPSTYLE_MAX        = 5,
}

enum {
	COMP_ELEM_TYPE          = 0x00000001,
	COMP_ELEM_CHECKED       = 0x00000002,
	COMP_ELEM_DIRTY         = 0x00000004,
	COMP_ELEM_NOSCROLL      = 0x00000008,
	COMP_ELEM_POS_LEFT      = 0x00000010,
	COMP_ELEM_POS_TOP       = 0x00000020,
	COMP_ELEM_SIZE_WIDTH    = 0x00000040,
	COMP_ELEM_SIZE_HEIGHT   = 0x00000080,
	COMP_ELEM_POS_ZINDEX    = 0x00000100,
	COMP_ELEM_SOURCE        = 0x00000200,
	COMP_ELEM_FRIENDLYNAME  = 0x00000400,
	COMP_ELEM_SUBSCRIBEDURL = 0x00000800,
	COMP_ELEM_ORIGINAL_CSI  = 0x00001000,
	COMP_ELEM_RESTORED_CSI  = 0x00002000,
	COMP_ELEM_CURITEMSTATE  = 0x00004000,
	COMP_ELEM_ALL           = COMP_ELEM_TYPE | COMP_ELEM_CHECKED | COMP_ELEM_DIRTY | 		 COMP_ELEM_NOSCROLL | COMP_ELEM_POS_LEFT | COMP_ELEM_SIZE_WIDTH | 		 COMP_ELEM_SIZE_HEIGHT | COMP_ELEM_POS_ZINDEX | COMP_ELEM_SOURCE | 		 COMP_ELEM_FRIENDLYNAME | COMP_ELEM_POS_TOP | COMP_ELEM_SUBSCRIBEDURL | 		 COMP_ELEM_ORIGINAL_CSI | COMP_ELEM_RESTORED_CSI | COMP_ELEM_CURITEMSTATE,
}

enum {
	DTI_ADDUI_DEFAULT       = 0x00000000,
	DTI_ADDUI_DISPSUBWIZARD = 0x00000001,
	DTI_ADDUI_POSITIONITEM  = 0x00000002,
}

enum ADDURL_SILENT = 0X0001;
enum {
	COMPONENT_DEFAULT_LEFT = 0xFFFF,
	COMPONENT_DEFAULT_TOP  = 0xFFFF,
}

interface IActiveDesktop : IUnknown {
public extern(Windows):
	HRESULT ApplyChanges(DWORD dwFlags);
	HRESULT GetWallpaper(LPWSTR pwszWallpaper, UINT cchWallpaper, DWORD dwFlags);
	HRESULT SetWallpaper(LPCWSTR pwszWallpaper, DWORD dwReserved);
	HRESULT GetWallpaperOptions(LPWALLPAPEROPT pwpo, DWORD dwReserved);
	HRESULT SetWallpaperOptions(LPCWALLPAPEROPT pwpo, DWORD dwReserved);
	HRESULT GetPattern(LPWSTR pwszPattern, UINT cchPattern, DWORD dwReserved);
	HRESULT SetPattern(LPCWSTR pwszPattern, DWORD dwReserved);
	HRESULT GetDesktopItemOptions(LPCOMPONENTSOPT pco, DWORD dwReserved);
	HRESULT SetDesktopItemOptions(LPCCOMPONENTSOPT pco, DWORD dwReserved);
	HRESULT AddDesktopItem(LPCCOMPONENT pcomp, DWORD dwReserved);
	HRESULT AddDesktopItemWithUI(HWND hwnd, LPCOMPONENT pcomp, DWORD dwReserved);
	HRESULT ModifyDesktopItem(LPCCOMPONENT pcomp, DWORD dwFlags);
	HRESULT RemoveDesktopItem(LPCCOMPONENT pcomp, DWORD dwReserved);
	HRESULT GetDesktopItemCount(LPINT lpiCount, DWORD dwReserved);
	HRESULT GetDesktopItem(int nComponent, LPCOMPONENT pcomp, DWORD dwReserved);
	HRESULT GetDesktopItemByID(ULONG_PTR dwID, LPCOMPONENT pcomp, DWORD dwReserved);
	HRESULT GenerateDesktopItemHtml(LPCWSTR pwszFileName, LPCOMPONENT pcomp, DWORD dwReserved);
	HRESULT AddUrl(HWND hwnd, LPCWSTR pszSource, LPCOMPONENT pcomp, DWORD dwFlags);
	HRESULT GetDesktopItemBySource(LPCWSTR pwszSource, LPCOMPONENT pcomp, DWORD dwReserved);
}
mixin DEFINE_IID!(IActiveDesktop, "f490eb00-1240-11d1-9888-006097deacf9");
alias IActiveDesktop LPACTIVEDESKTOP;

enum {
	SSM_CLEAR   = 0x0000,
	SSM_SET     = 0x0001,
	SSM_REFRESH = 0x0002,
	SSM_UPDATE  = 0x0004,
}
enum {
	SCHEME_DISPLAY  = 0x0001,
	SCHEME_EDIT     = 0x0002,
	SCHEME_LOCAL    = 0x0004,
	SCHEME_GLOBAL   = 0x0008,
	SCHEME_REFRESH  = 0x0010,
	SCHEME_UPDATE   = 0x0020,
	SCHEME_DONOTUSE = 0x0040,
	SCHEME_CREATE   = 0x0080,
}

interface IActiveDesktopP : IUnknown {
public extern(Windows):
	HRESULT SetSafeMode(DWORD dwFlags);
	HRESULT EnsureUpdateHTML();
	HRESULT SetScheme(LPCWSTR pwszSchemeName, DWORD dwFlags);
	HRESULT GetScheme(LPWSTR pwszSchemeName, DWORD* lpdwcchBuffer, DWORD dwFlags);
}
mixin DEFINE_IID!(IActiveDesktopP, "52502EE0-EC80-11D0-89AB-00C04FC2972D");
alias IActiveDesktopP LPACTIVEDESKTOPP;

enum GADOF_DIRTY = 0x00000001;

interface IADesktopP2 : IUnknown {
public extern(Windows):
	HRESULT ReReadWallpaper();
	HRESULT GetADObjectFlags(DWORD* lpdwFlags, DWORD dwMask);
	HRESULT UpdateAllDesktopSubscriptions();
	HRESULT MakeDynamicChanges(IOleObject pOleObj);
}
mixin DEFINE_IID!(IADesktopP2, "B22754E2-4574-11d1-9888-006097DEACF9");
alias IADesktopP2 LPADESKTOPP2;

enum {
	MAX_COLUMN_NAME_LEN = 80,
	MAX_COLUMN_DESC_LEN = 128,
}

align(1)
struct SHCOLUMNINFO {
	SHCOLUMNID scid;
	VARTYPE vt;
	DWORD fmt;
	UINT cChars;
	DWORD csFlags;
	WCHAR[MAX_COLUMN_NAME_LEN] wszTitle;
	WCHAR[MAX_COLUMN_DESC_LEN] wszDescription;
}
alias SHCOLUMNINFO* LPSHCOLUMNINFO;
alias const(SHCOLUMNINFO)* LPCSHCOLUMNINFO;

align(8)
struct SHCOLUMNINIT {
	ULONG dwFlags;
	ULONG dwReserved;
	WCHAR[MAX_PATH] wszFolder;
}
alias SHCOLUMNINIT* LPSHCOLUMNINIT;
alias const(SHCOLUMNINIT)* LPCSHCOLUMNINIT;

enum SHCDF_UPDATEITEM = 0x00000001;

struct SHCOLUMNDATA {
	ULONG dwFlags;
	DWORD dwFileAttributes;
	ULONG dwReserved;
	WCHAR* pwszExt;
	WCHAR[MAX_PATH] wszFile;
}
alias SHCOLUMNDATA* LPSHCOLUMNDATA;
alias const(SHCOLUMNDATA)* LPCSHCOLUMNDATA;

interface IColumnProvider : IUnknown {
public extern(Windows):
	HRESULT Initialize(LPCSHCOLUMNINIT psci);
	HRESULT GetColumnInfo(DWORD dwIndex, SHCOLUMNINFO* psci);
	HRESULT GetItemData(LPCSHCOLUMNID pscid, LPCSHCOLUMNDATA pscd, VARIANT* pvarData);
}
mixin DEFINE_IID!(IColumnProvider, "E8025004-1C42-11d2-BE2C-00A0C9A83DA1");

const wchar* CFSTR_SHELLIDLIST = "Shell IDList Array";
const wchar* CFSTR_SHELLIDLISTOFFSET = "Shell Object Offsets";
const wchar* CFSTR_NETRESOURCES = "Net Resource";
const wchar* CFSTR_FILEDESCRIPTORA = "FileGroupDescriptor";
const wchar* CFSTR_FILEDESCRIPTORW = "FileGroupDescriptorW";
const wchar* CFSTR_FILECONTENTS = "FileContents";
const wchar* CFSTR_FILENAMEA = "FileName";
const wchar* CFSTR_FILENAMEW = "FileNameW";
const wchar* CFSTR_PRINTERGROUP = "PrinterFriendlyName";
const wchar* CFSTR_FILENAMEMAPA = "FileNameMap";
const wchar* CFSTR_FILENAMEMAPW = "FileNameMapW";
const wchar* CFSTR_SHELLURL = "UniformResourceLocator";
alias CFSTR_SHELLURL CFSTR_INETURLA;
const wchar* CFSTR_INETURLW = "UniformResourceLocatorW";
const wchar* CFSTR_PREFERREDDROPEFFECT = "Preferred DropEffect";
const wchar* CFSTR_PERFORMEDDROPEFFECT = "Performed DropEffect";
const wchar* CFSTR_PASTESUCCEEDED = "Paste Succeeded";
const wchar* CFSTR_INDRAGLOOP = "InShellDragLoop";
const wchar* CFSTR_MOUNTEDVOLUME = "MountedVolume";
const wchar* CFSTR_PERSISTEDDATAOBJECT = "PersistedDataObject";
const wchar* CFSTR_TARGETCLSID = "TargetCLSID";
const wchar* CFSTR_LOGICALPERFORMEDDROPEFFECT = "Logical Performed DropEffect";
const wchar* CFSTR_AUTOPLAY_SHELLIDLISTS = "Autoplay Enumerated IDList Array";
const wchar* CFSTR_UNTRUSTEDDRAGDROP = "UntrustedDragDrop";
const wchar* CFSTR_FILE_ATTRIBUTES_ARRAY = "File Attributes Array";
const wchar* CFSTR_INVOKECOMMAND_DROPPARAM = "InvokeCommand DropParam";
const wchar* CFSTR_SHELLDROPHANDLER = "DropHandlerCLSID";
const wchar* CFSTR_DROPDESCRIPTION = "DropDescription";

version(UNICODE){
	alias CFSTR_FILEDESCRIPTORW CFSTR_FILEDESCRIPTOR;
	alias CFSTR_FILENAMEW CFSTR_FILENAME;
	alias CFSTR_FILENAMEMAPW CFSTR_FILENAMEMAP;
	alias CFSTR_INETURLW CFSTR_INETURL;
}else{
	alias CFSTR_FILEDESCRIPTORA CFSTR_FILEDESCRIPTOR;
	alias CFSTR_FILENAMEA CFSTR_FILENAME;
	alias CFSTR_FILENAMEMAPA CFSTR_FILENAMEMAP;
	alias CFSTR_INETURLA CFSTR_INETURL;
}

enum {
	DVASPECT_SHORTNAME = 2,
	DVASPECT_COPY      = 3,
	DVASPECT_LINK      = 4,
}

align(8)
struct NRESARRAY {
	UINT cItems;
	NETRESOURCE[1] nr;
}
alias NRESARRAY* LPNRESARRAY;

struct CIDA {
	UINT cidl;
	UINT[1] aoffset;
}
alias CIDA* LPIDA;

enum {
	FD_CLSID      = 0x00000001,
	FD_SIZEPOINT  = 0x00000002,
	FD_ATTRIBUTES = 0x00000004,
	FD_CREATETIME = 0x00000008,
	FD_ACCESSTIME = 0x00000010,
	FD_WRITESTIME = 0x00000020,
	FD_FILESIZE   = 0x00000040,
	FD_PROGRESSUI = 0x00004000,
	FD_LINKUI     = 0x00008000,
	//(NTDDI_VERSION >= NTDDI_VISTA)
		FD_UNICODE = cast(int)0x80000000,
}
alias int FD_FLAGS;

struct FILEDESCRIPTORA {
	DWORD dwFlags;
	CLSID clsid;
	SIZEL sizel;
	POINTL pointl;
	DWORD dwFileAttributes;
	FILETIME ftCreationTime;
	FILETIME ftLastAccessTime;
	FILETIME ftLastWriteTime;
	DWORD nFileSizeHigh;
	DWORD nFileSizeLow;
	CHAR[MAX_PATH] cFileName;
}
alias FILEDESCRIPTORA* LPFILEDESCRIPTORA;

struct FILEDESCRIPTORW {
	DWORD dwFlags;
	CLSID clsid;
	SIZEL sizel;
	POINTL pointl;
	DWORD dwFileAttributes;
	FILETIME ftCreationTime;
	FILETIME ftLastAccessTime;
	FILETIME ftLastWriteTime;
	DWORD nFileSizeHigh;
	DWORD nFileSizeLow;
	WCHAR[MAX_PATH] cFileName;
}
alias FILEDESCRIPTORW* LPFILEDESCRIPTORW;

version(UNICODE){
	alias FILEDESCRIPTORW FILEDESCRIPTOR;
	alias LPFILEDESCRIPTORW LPFILEDESCRIPTOR;
}else{
	alias FILEDESCRIPTORA FILEDESCRIPTOR;
	alias LPFILEDESCRIPTORA LPFILEDESCRIPTOR;
}

struct FILEGROUPDESCRIPTORA {
	UINT cItems;
	FILEDESCRIPTORA[1] fgd;
}
alias FILEGROUPDESCRIPTORA* LPFILEGROUPDESCRIPTORA;

struct FILEGROUPDESCRIPTORW {
	UINT cItems;
	FILEDESCRIPTORW[1] fgd;
}
alias FILEGROUPDESCRIPTORW* LPFILEGROUPDESCRIPTORW;

version(UNICODE){
	alias FILEGROUPDESCRIPTORW FILEGROUPDESCRIPTOR;
	alias LPFILEGROUPDESCRIPTORW LPFILEGROUPDESCRIPTOR;
}else{
	alias FILEGROUPDESCRIPTORA FILEGROUPDESCRIPTOR;
	alias LPFILEGROUPDESCRIPTORA LPFILEGROUPDESCRIPTOR;
}

struct DROPFILES {
	DWORD pFiles;
	POINT pt;
	BOOL fNC;
	BOOL fWide;
}
alias DROPFILES* LPDROPFILES;

//(NTDDI_VERSION >= NTDDI_VISTA)
	struct FILE_ATTRIBUTES_ARRAY {
		UINT cItems;
		DWORD dwSumFileAttributes;
		DWORD dwProductFileAttributes;
		DWORD[1] rgdwFileAttributes;
	}

//(NTDDI_VERSION >= NTDDI_VISTA)
	enum {
		DROPIMAGE_INVALID = -1,
		DROPIMAGE_NONE    = 0,
		DROPIMAGE_COPY    = DROPEFFECT_COPY,
		DROPIMAGE_MOVE    = DROPEFFECT_MOVE,
		DROPIMAGE_LINK    = DROPEFFECT_LINK,
		DROPIMAGE_LABEL   = 6,
		DROPIMAGE_WARNING = 7,
		DROPIMAGE_NOIMAGE = 8,
	}
	alias int DROPIMAGETYPE;

	struct DROPDESCRIPTION {
		DROPIMAGETYPE type;
		WCHAR[MAX_PATH] szMessage;
		WCHAR[MAX_PATH] szInsert;
	}

struct SHChangeNotifyEntry {
	PCIDLIST_ABSOLUTE pidl;
	BOOL fRecursive;
}

enum {
	SHCNRF_InterruptLevel     = 0x0001,
	SHCNRF_ShellLevel         = 0x0002,
	SHCNRF_RecursiveInterrupt = 0x1000,
	SHCNRF_NewDelivery        = 0x8000,
}
enum {
	SHCNE_RENAMEITEM       = 0x00000001,
	SHCNE_CREATE           = 0x00000002,
	SHCNE_DELETE           = 0x00000004,
	SHCNE_MKDIR            = 0x00000008,
	SHCNE_RMDIR            = 0x00000010,
	SHCNE_MEDIAINSERTED    = 0x00000020,
	SHCNE_MEDIAREMOVED     = 0x00000040,
	SHCNE_DRIVEREMOVED     = 0x00000080,
	SHCNE_DRIVEADD         = 0x00000100,
	SHCNE_NETSHARE         = 0x00000200,
	SHCNE_NETUNSHARE       = 0x00000400,
	SHCNE_ATTRIBUTES       = 0x00000800,
	SHCNE_UPDATEDIR        = 0x00001000,
	SHCNE_UPDATEITEM       = 0x00002000,
	SHCNE_SERVERDISCONNECT = 0x00004000,
	SHCNE_UPDATEIMAGE      = 0x00008000,
	SHCNE_DRIVEADDGUI      = 0x00010000,
	SHCNE_RENAMEFOLDER     = 0x00020000,
	SHCNE_FREESPACE        = 0x00040000,
	SHCNE_EXTENDED_EVENT   = 0x04000000,
	SHCNE_ASSOCCHANGED     = 0x08000000,
	SHCNE_DISKEVENTS       = 0x0002381F,
	SHCNE_GLOBALEVENTS     = 0x0C0581E0,
	SHCNE_ALLEVENTS        = 0x7FFFFFFF,
	SHCNE_INTERRUPT        = 0x80000000,
	SHCNEE_ORDERCHANGED    = 2,
	SHCNEE_MSI_CHANGE      = 4,
	SHCNEE_MSI_UNINSTALL   = 5,
	SHCNF_IDLIST           = 0x0000,
	SHCNF_PATHA            = 0x0001,
	SHCNF_PRINTERA         = 0x0002,
	SHCNF_DWORD            = 0x0003,
	SHCNF_PATHW            = 0x0005,
	SHCNF_PRINTERW         = 0x0006,
	SHCNF_TYPE             = 0x00FF,
	SHCNF_FLUSH            = 0x1000,
	SHCNF_FLUSHNOWAIT      = 0x3000,
	SHCNF_NOTIFYRECURSIVE  = 0x10000,
}
version(UNICODE){
	alias SHCNF_PATHW SHCNF_PATH;
	alias SHCNF_PRINTERW SHCNF_PRINTER;
}else{
	alias SHCNF_PATHA SHCNF_PATH;
	alias SHCNF_PRINTERA SHCNF_PRINTER;
}

export extern(Windows) void SHChangeNotify(LONG wEventId, UINT uFlags, LPCVOID dwItem1, LPCVOID dwItem2);

interface IShellChangeNotify : IUnknown {
public extern(Windows):
	HRESULT OnChange(LONG lEvent, PCIDLIST_ABSOLUTE pidl1, PCIDLIST_ABSOLUTE pidl2);
}
mixin DEFINE_IID!(IShellChangeNotify, "D82BE2B1-5764-11D0-A96E-00C04FD705A2");

interface IQueryInfo : IUnknown {
public extern(Windows):
	HRESULT GetInfoTip(DWORD dwFlags, WCHAR** ppwszTip);
	HRESULT GetInfoFlags(DWORD* pdwFlags);
}
mixin DEFINE_IID!(IQueryInfo, "00021500-0000-0000-c000-000000000046");

enum {
	QITIPF_DEFAULT       = 0x00000000,
	QITIPF_USENAME       = 0x00000001,
	QITIPF_LINKNOTARGET  = 0x00000002,
	QITIPF_LINKUSETARGET = 0x00000004,
	//(NTDDI_VERSION >= NTDDI_WINXP)
		QITIPF_USESLOWTIP = 0x00000008,
	//(NTDDI_VERSION >= NTDDI_VISTA)
		QITIPF_SINGLELINE = 0x00000010,
}
enum {
	QIF_CACHED           = 0x00000001,
	QIF_DONTEXPANDFOLDER = 0x00000002,
}

enum {
	SHARD_PIDL  = 0x00000001,
	SHARD_PATHA = 0x00000002,
	SHARD_PATHW = 0x00000003,
	//(NTDDI_VERSION >= NTDDI_WIN7)
		SHARD_APPIDINFO       = 0x00000004,
		SHARD_APPIDINFOIDLIST = 0x00000005,
		SHARD_LINK            = 0x00000006,
		SHARD_APPIDINFOLINK   = 0x00000007,
		SHARD_SHELLITEM       = 0x00000008,
}
alias int SHARD;

//(NTDDI_VERSION >= NTDDI_WIN7)
	struct SHARDAPPIDINFO {
		IShellItem psi;
		PCWSTR pszAppID;
	}

	struct SHARDAPPIDINFOIDLIST {
		PCIDLIST_ABSOLUTE pidl;
		PCWSTR pszAppID;
	}

	struct SHARDAPPIDINFOLINK {
		IShellLink psl;
		PCWSTR pszAppID;
	}

version(UNICODE)
	alias SHARD_PATHW SHARD_PATH;
else
	alias SHARD_PATHA SHARD_PATH;

export extern(Windows) void SHAddToRecentDocs(UINT uFlags, LPCVOID pv);

struct SHChangeDWORDAsIDList {
	USHORT cb;
	DWORD dwItem1;
	DWORD dwItem2;
	USHORT cbZero;
}
alias SHChangeDWORDAsIDList* LPSHChangeDWORDAsIDList;

struct SHChangeUpdateImageIDList {
	USHORT cb;
	int iIconIndex;
	int iCurIndex;
	UINT uFlags;
	DWORD dwProcessID;
	WCHAR[MAX_PATH] szName;
	USHORT cbZero;
}
alias SHChangeUpdateImageIDList* LPSHChangeUpdateImageIDList;
export extern(Windows) int SHHandleUpdateImage(PCIDLIST_ABSOLUTE pidlExtra);

struct SHChangeProductKeyAsIDList {
	USHORT cb;
	WCHAR[39] wszProductKey;
	USHORT cbZero;
}
alias SHChangeProductKeyAsIDList* LPSHChangeProductKeyAsIDList;

export extern(Windows){
	void SHUpdateImageA(LPCSTR pszHashItem, int iIndex, UINT uFlags, int iImageIndex);
	void SHUpdateImageW(LPCWSTR pszHashItem, int iIndex, UINT uFlags, int iImageIndex);
}
version(UNICODE)
	alias SHUpdateImageW SHUpdateImage;
else
	alias SHUpdateImageA SHUpdateImage;

export extern(Windows){
	ULONG SHChangeNotifyRegister(HWND hwnd, int fSources, LONG fEvents, UINT wMsg, int cEntries, const(SHChangeNotifyEntry)* pshcne);
	BOOL SHChangeNotifyDeregister(uint ulID);
}

enum {
	SCNRT_ENABLE  = 0,
	SCNRT_DISABLE = 1,
}
alias int SCNRT_STATUS;

static if(NTDDI_VERSION >= NTDDI_VISTA){
	export extern(Windows) void SHChangeNotifyRegisterThread(SCNRT_STATUS status);
}

export extern(Windows){
	HANDLE SHChangeNotification_Lock(HANDLE hChange, DWORD dwProcId, PIDLIST_ABSOLUTE** pppidl, LONG* plEvent);
	BOOL SHChangeNotification_Unlock(HANDLE hLock);
	HRESULT SHGetRealIDL(IShellFolder psf, PCUITEMID_CHILD pidlSimple, PITEMID_CHILD* ppidlReal);
	HRESULT SHGetInstanceExplorer(IUnknown* ppunk);
}

enum {
	SHGDFIL_FINDDATA      = 1,
	SHGDFIL_NETRESOURCE   = 2,
	SHGDFIL_DESCRIPTIONID = 3,
}

enum {
	SHDID_ROOT_REGITEM       = 1,
	SHDID_FS_FILE            = 2,
	SHDID_FS_DIRECTORY       = 3,
	SHDID_FS_OTHER           = 4,
	SHDID_COMPUTER_DRIVE35   = 5,
	SHDID_COMPUTER_DRIVE525  = 6,
	SHDID_COMPUTER_REMOVABLE = 7,
	SHDID_COMPUTER_FIXED     = 8,
	SHDID_COMPUTER_NETDRIVE  = 9,
	SHDID_COMPUTER_CDROM     = 10,
	SHDID_COMPUTER_RAMDISK   = 11,
	SHDID_COMPUTER_OTHER     = 12,
	SHDID_NET_DOMAIN         = 13,
	SHDID_NET_SERVER         = 14,
	SHDID_NET_SHARE          = 15,
	SHDID_NET_RESTOFNET      = 16,
	SHDID_NET_OTHER          = 17,
	//(NTDDI_VERSION >= NTDDI_WINXP)
		SHDID_COMPUTER_IMAGING    = 18,
		SHDID_COMPUTER_AUDIO      = 19,
		SHDID_COMPUTER_SHAREDDOCS = 20,
	//(NTDDI_VERSION >= NTDDI_VISTA)
		SHDID_MOBILE_DEVICE = 21,
}

align(8)
struct SHDESCRIPTIONID {
	DWORD dwDescriptionId;
	CLSID clsid;
}
alias SHDESCRIPTIONID* LPSHDESCRIPTIONID;

export extern(Windows){
	HRESULT SHGetDataFromIDListA(IShellFolder psf, PCUITEMID_CHILD pidl, int nFormat, void* pv, int cb);
	HRESULT SHGetDataFromIDListW(IShellFolder psf, PCUITEMID_CHILD pidl, int nFormat, void* pv, int cb);
}
version(UNICODE)
	alias SHGetDataFromIDListW SHGetDataFromIDList;
else
	alias SHGetDataFromIDListA SHGetDataFromIDList;

enum {
	PRF_VERIFYEXISTS         = 0x0001,
	PRF_TRYPROGRAMEXTENSIONS = 0x0002 | PRF_VERIFYEXISTS,
	PRF_FIRSTDIRDEF          = 0x0004,
	PRF_DONTFINDLNK          = 0x0008,
	PRF_REQUIREABSOLUTE      = 0x0010,
}

export extern(Windows){
	int RestartDialog(HWND hwnd, LPCWSTR lpPrompt, DWORD dwReturn);
	static if(NTDDI_VERSION >= NTDDI_WINXP)
		int RestartDialogEx(HWND hwnd, LPCWSTR lpPrompt, DWORD dwReturn, DWORD dwReasonCode);

	HRESULT SHCoCreateInstance(LPCWSTR pszCLSID, const(CLSID)* pclsid, IUnknown pUnkOuter, REFIID riid, void** ppv);

	static if(NTDDI_VERSION >= NTDDI_VISTA)
		HRESULT SHCreateDataObject(PCIDLIST_ABSOLUTE pidlFolder, UINT cidl, PCUITEMID_CHILD_ARRAY apidl, IDataObject pdtInner, REFIID riid, void** ppv);

	HRESULT CIDLData_CreateFromIDArray(PCIDLIST_ABSOLUTE pidlFolder, UINT cidl, PCUIDLIST_RELATIVE_ARRAY apidl, IDataObject* ppdtobj);
	HRESULT SHCreateStdEnumFmtEtc(UINT cfmt, const(FORMATETC)* afmt, IEnumFORMATETC* ppenumFormatEtc);
	HRESULT SHDoDragDrop(HWND hwnd, IDataObject pdata, IDropSource pdsrc, DWORD dwEffect, DWORD* pdwEffect);
}

enum NUM_POINTS = 3;
struct AUTO_SCROLL_DATA {
	int iNextSample;
	DWORD dwLastScroll;
	BOOL bFull;
	POINT[NUM_POINTS] pts;
	DWORD[NUM_POINTS] dwTimes;
}

export extern(Windows){
	BOOL DAD_SetDragImage(HIMAGELIST him, POINT* pptOffset);
	BOOL DAD_DragEnterEx(HWND hwndTarget, const(POINT) ptStart);
	BOOL DAD_DragEnterEx2(HWND hwndTarget, const(POINT) ptStart, IDataObject pdtObject);
	BOOL DAD_ShowDragImage(BOOL fShow);
	BOOL DAD_DragMove(POINT pt);
	BOOL DAD_DragLeave();
	BOOL DAD_AutoScroll(HWND hwnd, AUTO_SCROLL_DATA* pad, const(POINT)* pptNow);
}

struct CABINETSTATE {
	WORD cLength;
	WORD nVersion;

	ushort dummy;

	/*BOOL fFullPathTitle : 1;
	BOOL fSaveLocalView : 1;
	BOOL fNotShell : 1;
	BOOL fSimpleDefault : 1;
	BOOL fDontShowDescBar : 1;
	BOOL fNewWindowMode : 1;
	BOOL fShowCompColor : 1;
	BOOL fDontPrettyNames : 1;
	BOOL fAdminsCreateCommonGroups : 1;
	UINT fUnusedFlags : 7;*/

	UINT fMenuEnumFilter;
}
alias CABINETSTATE* LPCABINETSTATE;

enum CABINETSTATE_VERSION = 2;

export extern(Windows){
	BOOL ReadCabinetState(CABINETSTATE* pcs, int cLength);
	BOOL WriteCabinetState(CABINETSTATE* pcs);
	BOOL PathMakeUniqueName(LPWSTR pszUniqueName, UINT cchMax, LPCWSTR pszTemplate, LPCWSTR pszLongPlate, LPCWSTR pszDir);
	void PathQualify(LPWSTR psz);
	BOOL PathIsExe(LPCWSTR pszPath);
	BOOL PathIsSlowA(LPCSTR pszFile, DWORD dwAttr);
	BOOL PathIsSlowW(LPCWSTR pszFile, DWORD dwAttr);
}
version(UNICODE)
	alias PathIsSlowW PathIsSlow;
else
	alias PathIsSlowA PathIsSlow;

enum {
	PCS_FATAL        = 0x80000000,
	PCS_REPLACEDCHAR = 0x00000001,
	PCS_REMOVEDCHAR  = 0x00000002,
	PCS_TRUNCATED    = 0x00000004,
	PCS_PATHTOOLONG  = 0x00000008,
}

export extern(Windows){
	int PathCleanupSpec(LPCWSTR pszDir, LPWSTR pszSpec);

	int PathResolve(LPWSTR lpszPath, PZPCWSTR dirs, UINT fFlags);
	BOOL GetFileNameFromBrowse(HWND hwnd, LPWSTR pszFilePath, UINT cchFilePath, LPCWSTR pszWorkingDir, LPCWSTR pszDefExt, LPCWSTR pszFilters, LPCWSTR pszTitle);
	int DriveType(int iDrive);

	int RealDriveType(int iDrive, BOOL fOKToHitNet);
	int IsNetDrive(int iDrive);
}

enum {
	MM_ADDSEPARATOR    = 0x00000001,
	MM_SUBMENUSHAVEIDS = 0x00000002,
	MM_DONTREMOVESEPS  = 0x00000004,
}

export extern(Windows){
	UINT Shell_MergeMenus(HMENU hmDst, HMENU hmSrc, UINT uInsert, UINT uIDAdjust, UINT uIDAdjustMax, ULONG uFlags);

	BOOL SHObjectProperties(HWND hwnd, DWORD shopObjectType, PCWSTR pszObjectName, PCWSTR pszPropertyPage);
}

enum {
	SHOP_PRINTERNAME = 0x00000001,
	SHOP_FILEPATH    = 0x00000002,
	SHOP_VOLUMEGUID  = 0x00000004,
}

export extern(Windows) DWORD SHFormatDrive(HWND hwnd, UINT drive, UINT fmtID, UINT options);

enum {
	SHFMT_ID_DEFAULT  = 0xFFFF,
	SHFMT_OPT_FULL    = 0x0001,
	SHFMT_OPT_SYSONLY = 0x0002,
	SHFMT_ERROR       = 0xFFFFFFFF,
	SHFMT_CANCEL      = 0xFFFFFFFE,
	SHFMT_NOFORMAT    = 0xFFFFFFFD,
}

enum HPSXA : HANDLE {init = (HANDLE).init}

export extern(Windows){
	HPSXA SHCreatePropSheetExtArray(HKEY hKey, LPCWSTR pszSubKey, UINT max_iface);
	void SHDestroyPropSheetExtArray(HPSXA hpsxa);
	UINT SHAddFromPropSheetExtArray(HPSXA hpsxa, LPFNADDPROPSHEETPAGE lpfnAddPage, LPARAM lParam);
	UINT SHReplaceFromPropSheetExtArray(HPSXA hpsxa, UINT uPageID, LPFNADDPROPSHEETPAGE lpfnReplaceWith, LPARAM lParam );
}

interface IDefViewFrame : IUnknown {
public extern(Windows):
	HRESULT GetWindowLV(HWND* phwnd);
	HRESULT ReleaseWindowLV();
	HRESULT GetShellFolder(IShellFolder* ppsf);
}
mixin DEFINE_IID!(IDefViewFrame,  "710EB7A0-45ED-11D0-924A-0020AFC7AC4D");

enum {
	REST_NONE                       = 0x00000000,
	REST_NORUN                      = 0x00000001,
	REST_NOCLOSE                    = 0x00000002,
	REST_NOSAVESET                  = 0x00000004,
	REST_NOFILEMENU                 = 0x00000008,
	REST_NOSETFOLDERS               = 0x00000010,
	REST_NOSETTASKBAR               = 0x00000020,
	REST_NODESKTOP                  = 0x00000040,
	REST_NOFIND                     = 0x00000080,
	REST_NODRIVES                   = 0x00000100,
	REST_NODRIVEAUTORUN             = 0x00000200,
	REST_NODRIVETYPEAUTORUN         = 0x00000400,
	REST_NONETHOOD                  = 0x00000800,
	REST_STARTBANNER                = 0x00001000,
	REST_RESTRICTRUN                = 0x00002000,
	REST_NOPRINTERTABS              = 0x00004000,
	REST_NOPRINTERDELETE            = 0x00008000,
	REST_NOPRINTERADD               = 0x00010000,
	REST_NOSTARTMENUSUBFOLDERS      = 0x00020000,
	REST_MYDOCSONNET                = 0x00040000,
	REST_NOEXITTODOS                = 0x00080000,
	REST_ENFORCESHELLEXTSECURITY    = 0x00100000,
	REST_LINKRESOLVEIGNORELINKINFO  = 0x00200000,
	REST_NOCOMMONGROUPS             = 0x00400000,
	REST_SEPARATEDESKTOPPROCESS     = 0x00800000,
	REST_NOWEB                      = 0x01000000,
	REST_NOTRAYCONTEXTMENU          = 0x02000000,
	REST_NOVIEWCONTEXTMENU          = 0x04000000,
	REST_NONETCONNECTDISCONNECT     = 0x08000000,
	REST_STARTMENULOGOFF            = 0x10000000,
	REST_NOSETTINGSASSIST           = 0x20000000,
	REST_NOINTERNETICON             = 0x40000001,
	REST_NORECENTDOCSHISTORY        = 0x40000002,
	REST_NORECENTDOCSMENU           = 0x40000003,
	REST_NOACTIVEDESKTOP            = 0x40000004,
	REST_NOACTIVEDESKTOPCHANGES     = 0x40000005,
	REST_NOFAVORITESMENU            = 0x40000006,
	REST_CLEARRECENTDOCSONEXIT      = 0x40000007,
	REST_CLASSICSHELL               = 0x40000008,
	REST_NOCUSTOMIZEWEBVIEW         = 0x40000009,
	REST_NOHTMLWALLPAPER            = 0x40000010,
	REST_NOCHANGINGWALLPAPER        = 0x40000011,
	REST_NODESKCOMP                 = 0x40000012,
	REST_NOADDDESKCOMP              = 0x40000013,
	REST_NODELDESKCOMP              = 0x40000014,
	REST_NOCLOSEDESKCOMP            = 0x40000015,
	REST_NOCLOSE_DRAGDROPBAND       = 0x40000016,
	REST_NOMOVINGBAND               = 0x40000017,
	REST_NOEDITDESKCOMP             = 0x40000018,
	REST_NORESOLVESEARCH            = 0x40000019,
	REST_NORESOLVETRACK             = 0x4000001A,
	REST_FORCECOPYACLWITHFILE       = 0x4000001B,
	//(NTDDI_VERSION < NTDDI_VISTA)
		REST_NOLOGO3CHANNELNOTIFY = 0x4000001C,
	REST_NOFORGETSOFTWAREUPDATE      = 0x4000001D,
	REST_NOSETACTIVEDESKTOP          = 0x4000001E,
	REST_NOUPDATEWINDOWS             = 0x4000001F,
	REST_NOCHANGESTARMENU            = 0x40000020,
	REST_NOFOLDEROPTIONS             = 0x40000021,
	REST_HASFINDCOMPUTERS            = 0x40000022,
	REST_INTELLIMENUS                = 0x40000023,
	REST_RUNDLGMEMCHECKBOX           = 0x40000024,
	REST_ARP_ShowPostSetup           = 0x40000025,
	REST_NOCSC                       = 0x40000026,
	REST_NOCONTROLPANEL              = 0x40000027,
	REST_ENUMWORKGROUP               = 0x40000028,
	REST_ARP_NOARP                   = 0x40000029,
	REST_ARP_NOREMOVEPAGE            = 0x4000002A,
	REST_ARP_NOADDPAGE               = 0x4000002B,
	REST_ARP_NOWINSETUPPAGE          = 0x4000002C,
	REST_GREYMSIADS                  = 0x4000002D,
	REST_NOCHANGEMAPPEDDRIVELABEL    = 0x4000002E,
	REST_NOCHANGEMAPPEDDRIVECOMMENT  = 0x4000002F,
	REST_MaxRecentDocs               = 0x40000030,
	REST_NONETWORKCONNECTIONS        = 0x40000031,
	REST_FORCESTARTMENULOGOFF        = 0x40000032,
	REST_NOWEBVIEW                   = 0x40000033,
	REST_NOCUSTOMIZETHISFOLDER       = 0x40000034,
	REST_NOENCRYPTION                = 0x40000035,
	REST_DONTSHOWSUPERHIDDEN         = 0x40000037,
	REST_NOSHELLSEARCHBUTTON         = 0x40000038,
	REST_NOHARDWARETAB               = 0x40000039,
	REST_NORUNASINSTALLPROMPT        = 0x4000003A,
	REST_PROMPTRUNASINSTALLNETPATH   = 0x4000003B,
	REST_NOMANAGEMYCOMPUTERVERB      = 0x4000003C,
	REST_DISALLOWRUN                 = 0x4000003E,
	REST_NOWELCOMESCREEN             = 0x4000003F,
	REST_RESTRICTCPL                 = 0x40000040,
	REST_DISALLOWCPL                 = 0x40000041,
	REST_NOSMBALLOONTIP              = 0x40000042,
	REST_NOSMHELP                    = 0x40000043,
	REST_NOWINKEYS                   = 0x40000044,
	REST_NOENCRYPTONMOVE             = 0x40000045,
	REST_NOLOCALMACHINERUN           = 0x40000046,
	REST_NOCURRENTUSERRUN            = 0x40000047,
	REST_NOLOCALMACHINERUNONCE       = 0x40000048,
	REST_NOCURRENTUSERRUNONCE        = 0x40000049,
	REST_FORCEACTIVEDESKTOPON        = 0x4000004A,
	REST_NOVIEWONDRIVE               = 0x4000004C,
	//(NTDDI_VERSION >= NTDDI_WINXP)
		REST_NONETCRAWL        = 0x4000004D,
		REST_NOSHAREDDOCUMENTS = 0x4000004E,
	REST_NOSMMYDOCS = 0x4000004F,
	//(NTDDI_VERSION >= NTDDI_WINXP)
		REST_NOSMMYPICS               = 0x40000050,
		REST_ALLOWBITBUCKDRIVES       = 0x40000051,
		REST_NONLEGACYSHELLMODE       = 0x40000052,
		REST_NOCONTROLPANELBARRICADE  = 0x40000053,
		REST_NOSTARTPAGE              = 0x40000054,
		REST_NOAUTOTRAYNOTIFY         = 0x40000055,
		REST_NOTASKGROUPING           = 0x40000056,
		REST_NOCDBURNING              = 0x40000057,
	REST_MYCOMPNOPROP = 0x40000058,
	REST_MYDOCSNOPROP = 0x40000059,
	//(NTDDI_VERSION >= NTDDI_WINXP)
		REST_NOSTARTPANEL             = 0x4000005A,
		REST_NODISPLAYAPPEARANCEPAGE  = 0x4000005B,
		REST_NOTHEMESTAB              = 0x4000005C,
		REST_NOVISUALSTYLECHOICE      = 0x4000005D,
		REST_NOSIZECHOICE             = 0x4000005E,
		REST_NOCOLORCHOICE            = 0x4000005F,
		REST_SETVISUALSTYLE           = 0x40000060,
	REST_STARTRUNNOHOMEPATH = 0x40000061,
	//(NTDDI_VERSION >= NTDDI_WINXP)
		REST_NOUSERNAMEINSTARTPANEL  = 0x40000062,
		REST_NOMYCOMPUTERICON        = 0x40000063,
		REST_NOSMNETWORKPLACES       = 0x40000064,
		REST_NOSMPINNEDLIST          = 0x40000065,
		REST_NOSMMYMUSIC             = 0x40000066,
		REST_NOSMEJECTPC             = 0x40000067,
		REST_NOSMMOREPROGRAMS        = 0x40000068,
		REST_NOSMMFUPROGRAMS         = 0x40000069,
		REST_NOTRAYITEMSDISPLAY      = 0x4000006A,
		REST_NOTOOLBARSONTASKBAR     = 0x4000006B,
	REST_NOSMCONFIGUREPROGRAMS = 0x4000006F,
	//(NTDDI_VERSION >= NTDDI_WINXP)
		REST_HIDECLOCK             = 0x40000070,
		REST_NOLOWDISKSPACECHECKS  = 0x40000071,
	REST_NOENTIRENETWORK = 0x40000072,
	//(NTDDI_VERSION >= NTDDI_WINXP)
		REST_NODESKTOPCLEANUP         = 0x40000073,
		REST_BITBUCKNUKEONDELETE      = 0x40000074,
		REST_BITBUCKCONFIRMDELETE     = 0x40000075,
		REST_BITBUCKNOPROP            = 0x40000076,
		REST_NODISPBACKGROUND         = 0x40000077,
		REST_NODISPSCREENSAVEPG       = 0x40000078,
		REST_NODISPSETTINGSPG         = 0x40000079,
		REST_NODISPSCREENSAVEPREVIEW  = 0x4000007A,
		REST_NODISPLAYCPL             = 0x4000007B,
		REST_HIDERUNASVERB            = 0x4000007C,
		REST_NOTHUMBNAILCACHE         = 0x4000007D,
	//(NTDDI_VERSION >= NTDDI_WINXPSP1)
		REST_NOSTRCMPLOGICAL       = 0x4000007E,
		REST_NOPUBLISHWIZARD       = 0x4000007F,
		REST_NOONLINEPRINTSWIZARD  = 0x40000080,
		REST_NOWEBSERVICES         = 0x40000081,
	REST_ALLOWUNHASHEDWEBVIEW = 0x40000082,
	REST_ALLOWLEGACYWEBVIEW = 0x40000083,
	REST_REVERTWEBVIEWSECURITY = 0x40000084,
	REST_INHERITCONSOLEHANDLES = 0x40000086,
	//(NTDDI_VERSION >= NTDDI_WINXPSP2 && NTDDI_VERSION < NTDDI_VISTA)
		REST_SORTMAXITEMCOUNT = 0x40000087,
	//(NTDDI_VERSION >= NTDDI_WINXPSP2)
		REST_NOREMOTERECURSIVEEVENTS = 0x40000089,
	//(NTDDI_VERSION >= NTDDI_WINXPSP2)
		REST_NOREMOTECHANGENOTIFY = 0x40000091,
		//(NTDDI_VERSION < NTDDI_VISTA)
			REST_NOSIMPLENETIDLIST = 0x40000092,
		REST_NOENUMENTIRENETWORK = 0x40000093,
		//(NTDDI_VERSION < NTDDI_VISTA)
			REST_NODETAILSTHUMBNAILONNETWORK= 0x40000094,
		REST_NOINTERNETOPENWITH = 0x40000095,
	//(NTDDI_VERSION >= NTDDI_WINXPSP2)
		REST_DONTRETRYBADNETNAME      = 0x4000009B,
		REST_ALLOWFILECLSIDJUNCTIONS  = 0x4000009C,
		REST_NOUPNPINSTALL            = 0x4000009D,
	REST_ARP_DONTGROUPPATCHES      = 0x400000AC,
	REST_ARP_NOCHOOSEPROGRAMSPAGE  = 0x400000AD,
	REST_NODISCONNECT              = 0x41000001,
	REST_NOSECURITY                = 0x41000002,
	REST_NOFILEASSOCIATE           = 0x41000003,
	//(NTDDI_VERSION >= NTDDI_WINXPSP2)
		REST_ALLOWCOMMENTTOGGLE = 0x41000004,
	//(NTDDI_VERSION < NTDDI_VISTA)
		REST_USEDESKTOPINICACHE = 0x41000005,
}
alias int  RESTRICTIONS;

export extern(Windows){
	IStream OpenRegStream(HKEY hkey, LPCWSTR pszSubkey, LPCWSTR pszValue, DWORD grfMode);
	BOOL SHFindFiles(PCIDLIST_ABSOLUTE pidlFolder, PCIDLIST_ABSOLUTE pidlSaveFile);
	void PathGetShortPath(LPWSTR pszLongPath);

	BOOL PathYetAnotherMakeUniqueName(LPWSTR pszUniqueName, LPCWSTR pszPath, LPCWSTR pszShort, LPCWSTR pszFileSpec);
	BOOL Win32DeleteFile(LPCWSTR pszPath);
}

//(NTDDI_VERSION < NTDDI_VISTA)
	enum {
		PPCF_ADDQUOTES       = 0x00000001,
		PPCF_ADDARGUMENTS    = 0x00000003,
		PPCF_NODIRECTORIES   = 0x00000010,
		PPCF_FORCEQUALIFY    = 0x00000040,
		PPCF_LONGESTPOSSIBLE = 0x00000080,
	}

export extern(Windows) LONG PathProcessCommand(LPCWSTR lpSrc, LPWSTR lpDest, int iMax, DWORD dwFlags);


export extern(Windows){
	DWORD SHRestricted(RESTRICTIONS rest);
	BOOL SignalFileOpen(PCIDLIST_ABSOLUTE pidl);

	static if(NTDDI_VERSION >= NTDDI_VISTA)
		HRESULT AssocGetDetailsOfPropKey(IShellFolder psf, PCUITEMID_CHILD pidl, const(PROPERTYKEY)* pkey, VARIANT* pv, BOOL* pfFoundPropKey);

	//(NTDDI_VERSION < NTDDI_VISTA)
		HRESULT SHLoadOLE(LPARAM lParam);

	HRESULT SHStartNetConnectionDialogA(HWND hwnd, LPCSTR pszRemoteName, DWORD dwType);
	HRESULT SHStartNetConnectionDialogW(HWND hwnd, LPCWSTR pszRemoteName, DWORD dwType);
	version(UNICODE)
		alias SHStartNetConnectionDialogW SHStartNetConnectionDialog;
	else
		alias SHStartNetConnectionDialogA SHStartNetConnectionDialog;

	HRESULT SHDefExtractIconA(LPCSTR pszIconFile, int iIndex, UINT uFlags, HICON* phiconLarge, HICON* phiconSmall, UINT nIconSize);
	HRESULT SHDefExtractIconW(LPCWSTR pszIconFile, int iIndex, UINT uFlags, HICON* phiconLarge, HICON* phiconSmall, UINT nIconSize);
	version(UNICODE)
		alias SHDefExtractIconW SHDefExtractIcon;
	else
		alias SHDefExtractIconA SHDefExtractIcon;
}

enum {
	OAIF_ALLOW_REGISTRATION = 0x00000001,
	OAIF_REGISTER_EXT       = 0x00000002,
	OAIF_EXEC               = 0x00000004,
	OAIF_FORCE_REGISTRATION = 0x00000008,
	//(NTDDI_VERSION >= NTDDI_VISTA)
		OAIF_HIDE_REGISTRATION = 0x00000020,
		OAIF_URL_PROTOCOL      = 0x00000040,
}
alias int OPEN_AS_INFO_FLAGS;

align(8)
struct OPENASINFO {
	LPCWSTR pcszFile;
	LPCWSTR pcszClass;
	OPEN_AS_INFO_FLAGS oaifInFlags;
}
alias OPENASINFO* POPENASINFO;

export extern(Windows){
	static if(NTDDI_VERSION >= NTDDI_VISTA)
		HRESULT SHOpenWithDialog(HWND hwndParent, const(OPENASINFO)* poainfo);

	BOOL Shell_GetImageLists(HIMAGELIST* phiml, HIMAGELIST* phimlSmall);
	int Shell_GetCachedImageIndex(LPCWSTR pwszIconPath, int iIconIndex, UINT uIconFlags);
	static if(NTDDI_VERSION >= NTDDI_VISTA){
		int Shell_GetCachedImageIndexA(LPCSTR pszIconPath, int iIconIndex, UINT uIconFlags);
		int Shell_GetCachedImageIndexW(LPCWSTR pszIconPath, int iIconIndex, UINT uIconFlags);
		version(UNICODE)
			alias Shell_GetCachedImageIndexW Shell_GetCachedImageIndex;
		else
			alias Shell_GetCachedImageIndexA Shell_GetCachedImageIndex;
	}
}

interface IDocViewSite : IUnknown {
public extern(Windows):
	HRESULT OnSetTitle(VARIANTARG* pvTitle);
}
mixin DEFINE_IID!(IDocViewSite, "87D605E0-C511-11CF-89A9-00A0C9054129");

enum {
	VALIDATEUNC_CONNECT = 0x0001,
	VALIDATEUNC_NOUI    = 0x0002,
	VALIDATEUNC_PRINT   = 0x0004,
	//(NTDDI_VERSION >= NTDDI_VISTA)
		VALIDATEUNC_PERSIST = 0x0008,
		VALIDATEUNC_VALID   = 0x000F,
}

export extern(Windows) BOOL SHValidateUNC(HWND hwndOwner, LPWSTR pszFile, UINT fConnect);

enum {
	OPENPROPS_NONE       = 0x0000,
	OPENPROPS_INHIBITPIF = 0x8000,
	GETPROPS_NONE        = 0x0000,
	SETPROPS_NONE        = 0x0000,
	CLOSEPROPS_NONE      = 0x0000,
	CLOSEPROPS_DISCARD   = 0x0001,
}

enum {
	PIFNAMESIZE     = 30,
	PIFSTARTLOCSIZE = 63,
	PIFDEFPATHSIZE  = 64,
	PIFPARAMSSIZE   = 64,
	PIFSHPROGSIZE   = 64,
	PIFSHDATASIZE   = 64,
	PIFDEFFILESIZE  = 80,
	PIFMAXFILEPATH  = 260,
}

struct PROPPRG {
	WORD flPrg;
	WORD flPrgInit;
	CHAR[PIFNAMESIZE] achTitle;
	CHAR[PIFSTARTLOCSIZE+PIFPARAMSSIZE+1] achCmdLine;
	CHAR[PIFDEFPATHSIZE] achWorkDir;
	WORD wHotKey;
	CHAR[PIFDEFFILESIZE] achIconFile;
	WORD wIconIndex;
	DWORD dwEnhModeFlags;
	DWORD dwRealModeFlags;
	CHAR[PIFDEFFILESIZE] achOtherFile;
	CHAR[PIFMAXFILEPATH] achPIFFile;
}
alias PROPPRG* PPROPPRG;
alias PROPPRG* LPPROPPRG;
alias const(PROPPRG)* LPCPROPPRG;

export extern(Windows){
	HANDLE PifMgr_OpenProperties(LPCWSTR pszApp, LPCWSTR pszPIF, UINT hInf, UINT flOpt);
	int PifMgr_GetProperties(HANDLE hProps, LPCSTR pszGroup, void* lpProps, int cbProps, UINT flOpt);
	int PifMgr_SetProperties(HANDLE hProps, LPCSTR pszGroup, const(void)* lpProps, int cbProps, UINT flOpt);
	HANDLE PifMgr_CloseProperties(HANDLE hProps, UINT flOpt);

	void SHSetInstanceExplorer(IUnknown punk);
	BOOL IsUserAnAdmin();
}

interface IInitializeObject : IUnknown {
public extern(Windows):
	HRESULT Initialize();
}
mixin DEFINE_IID!(IInitializeObject, "4622AD16-FF23-11d0-8D34-00A0C90F2719");

enum {
	BMICON_LARGE = 0,
	BMICON_SMALL
}

interface IBanneredBar : IUnknown {
public extern(Windows):
	HRESULT SetIconSize(DWORD iIcon);
	HRESULT GetIconSize(DWORD* piIcon);
	HRESULT SetBitmap(HBITMAP hBitmap);
	HRESULT GetBitmap(HBITMAP* phBitmap);
}
mixin DEFINE_IID!(IBanneredBar, "596A9A94-013E-11d1-8D34-00A0C90F2719");

export extern(Windows) LRESULT SHShellFolderView_Message(HWND hwndMain, UINT uMsg, LPARAM lParam);

interface IShellFolderViewCB : IUnknown {
public extern(Windows):
	HRESULT MessageSFVCB(UINT uMsg, WPARAM wParam, LPARAM lParam);
}
mixin DEFINE_IID!(IShellFolderViewCB, "2047E320-F2A9-11CE-AE65-08002B2E1262");

align(8){

enum {
	QCMINFO_PLACE_BEFORE = 0,
	QCMINFO_PLACE_AFTER  = 1,
}

struct QCMINFO_IDMAP_PLACEMENT {
	UINT id;
	UINT fFlags;
}

struct QCMINFO_IDMAP {
	UINT nMaxIds;
	QCMINFO_IDMAP_PLACEMENT[1] pIdList;
}

struct QCMINFO {
	HMENU hmenu;
	UINT indexMenu;
	UINT idCmdFirst;
	UINT idCmdLast;
	QCMINFO_IDMAP* pIdMap;
}
alias QCMINFO* LPQCMINFO;

enum {
	TBIF_APPEND          = 0,
	TBIF_PREPEND         = 1,
	TBIF_REPLACE         = 2,
	TBIF_DEFAULT         = 0x00000000,
	TBIF_INTERNETBAR     = 0x00010000,
	TBIF_STANDARDTOOLBAR = 0x00020000,
	TBIF_NOTOOLBAR       = 0x00030000,
}

struct TBINFO {
	UINT cbuttons;
	UINT uFlags;
}
alias TBINFO* LPTBINFO;

struct DETAILSINFO {
	PCUITEMID_CHILD pidl;
	int fmt;
	int cxChar;
	STRRET str;
	int iImage;
}
alias DETAILSINFO* PDETAILSINFO;

struct SFVM_PROPPAGE_DATA {
	DWORD dwReserved;
	LPFNADDPROPSHEETPAGE pfn;
	LPARAM lParam;
}

struct SFVM_HELPTOPIC_DATA {
	WCHAR[MAX_PATH] wszHelpFile;
	WCHAR[MAX_PATH] wszHelpTopic;
}

enum {
	SFVM_MERGEMENU          = 1,
	SFVM_INVOKECOMMAND      = 2,
	SFVM_GETHELPTEXT        = 3,
	SFVM_GETTOOLTIPTEXT     = 4,
	SFVM_GETBUTTONINFO      = 5,
	SFVM_GETBUTTONS         = 6,
	SFVM_INITMENUPOPUP      = 7,
	SFVM_FSNOTIFY           = 14,
	SFVM_WINDOWCREATED      = 15,
	SFVM_GETDETAILSOF       = 23,
	SFVM_COLUMNCLICK        = 24,
	SFVM_QUERYFSNOTIFY      = 25,
	SFVM_DEFITEMCOUNT       = 26,
	SFVM_DEFVIEWMODE        = 27,
	SFVM_UNMERGEMENU        = 28,
	SFVM_UPDATESTATUSBAR    = 31,
	SFVM_BACKGROUNDENUM     = 32,
	SFVM_DIDDRAGDROP        = 36,
	SFVM_SETISFV            = 39,
	SFVM_THISIDLIST         = 41,
	SFVM_ADDPROPERTYPAGES   = 47,
	SFVM_BACKGROUNDENUMDONE = 48,
	SFVM_GETNOTIFY          = 49,
	SFVM_GETSORTDEFAULTS    = 53,
	SFVM_SIZE               = 57,
	SFVM_GETZONE            = 58,
	SFVM_GETPANE            = 59,
	SFVM_GETHELPTOPIC       = 63,
	SFVM_GETANIMATION       = 68,
}

struct ITEMSPACING {
	int cxSmall;
	int cySmall;
	int cxLarge;
	int cyLarge;
}

enum {
	SFVSOC_INVALIDATE_ALL = 0x00000001,
	SFVSOC_NOSCROLL       = LVSICF_NOSCROLL,
}

enum {
	SFVS_SELECT_NONE     = 0x0,
	SFVS_SELECT_ALLITEMS = 0x1,
	SFVS_SELECT_INVERT   = 0x2,
}

interface IShellFolderView : IUnknown {
public extern(Windows):
	HRESULT Rearrange(LPARAM lParamSort);
	HRESULT GetArrangeParam(LPARAM* plParamSort);
	HRESULT ArrangeGrid();
	HRESULT AutoArrange();
	HRESULT GetAutoArrange();
	HRESULT AddObject(PUITEMID_CHILD pidl, UINT* puItem);
	HRESULT GetObject(PITEMID_CHILD* ppidl, UINT uItem);
	HRESULT RemoveObject(PUITEMID_CHILD pidl, UINT* puItem);
	HRESULT GetObjectCount(UINT* puCount);
	HRESULT SetObjectCount(UINT uCount, UINT dwFlags);
	HRESULT UpdateObject(PUITEMID_CHILD pidlOld, PUITEMID_CHILD pidlNew, UINT* puItem);
	HRESULT RefreshObject(PUITEMID_CHILD pidl, UINT* puItem);
	HRESULT SetRedraw(BOOL bRedraw);
	HRESULT GetSelectedCount(UINT* puSelected);

	HRESULT GetSelectedObjects(PCUITEMID_CHILD** pppidl, UINT* puItems);
	HRESULT IsDropOnSource(IDropTarget pDropTarget);
	HRESULT GetDragPoint(POINT* ppt);
	HRESULT GetDropPoint(POINT* ppt);
	HRESULT MoveIcons(IDataObject pDataObject);
	HRESULT SetItemPos(PCUITEMID_CHILD pidl, POINT* ppt);
	HRESULT IsBkDropTarget(IDropTarget pDropTarget);
	HRESULT SetClipboard(BOOL bMove);
	HRESULT SetPoints(IDataObject pDataObject);
	HRESULT GetItemSpacing(ITEMSPACING* pSpacing);
	HRESULT SetCallback(IShellFolderViewCB pNewCB, IShellFolderViewCB* ppOldCB);
	HRESULT Select(UINT dwFlags);
	HRESULT QuerySupport(UINT* pdwSupport );
	HRESULT SetAutomationObject(IDispatch pdisp);
}
mixin DEFINE_IID!(IShellFolderView, "37A378C0-F82D-11CE-AE65-08002B2E1262");

struct SFV_CREATE {
	UINT cbSize;
	IShellFolder pshf;
	IShellView psvOuter;
	IShellFolderViewCB psfvcb;
}

export extern(Windows) HRESULT SHCreateShellFolderView(const(SFV_CREATE)* pcsfv, IShellView* ppsv);

alias extern(Windows) HRESULT function(IShellFolder psf, HWND hwnd, IDataObject pdtobj, UINT uMsg, WPARAM wParam, LPARAM lParam) LPFNDFMCALLBACK;

export extern(Windows) HRESULT CDefFolderMenu_Create2(PCIDLIST_ABSOLUTE pidlFolder, HWND hwnd, UINT cidl, PCUITEMID_CHILD_ARRAY apidl, IShellFolder psf, LPFNDFMCALLBACK pfn, UINT nKeys, const(HKEY)* ahkeys, IContextMenu* ppcm);

struct DEFCONTEXTMENU {
	HWND hwnd;
	IContextMenuCB pcmcb;
	PCIDLIST_ABSOLUTE pidlFolder;
	IShellFolder psf;
	UINT cidl;
	PCUITEMID_CHILD_ARRAY apidl;
	IUnknown punkAssociationInfo;
	UINT cKeys;
	const(HKEY)* aKeys;
}

static if(NTDDI_VERSION >= NTDDI_VISTA)
	export extern(Windows) HRESULT SHCreateDefaultContextMenu(const(DEFCONTEXTMENU)* pdcm, REFIID riid, void** ppv);

export extern(Windows){
	BOOL SHOpenPropSheetA(LPCSTR pszCaption, HKEY* ahkeys, UINT cikeys, const(CLSID)* pclsidDefault, IDataObject pdtobj, IShellBrowser psb, LPCSTR pStartPage);
	BOOL SHOpenPropSheetW(LPCWSTR pszCaption, HKEY* ahkeys, UINT cikeys, const(CLSID)* pclsidDefault, IDataObject pdtobj, IShellBrowser psb, LPCWSTR pStartPage);
}
version(UNICODE)
	alias SHOpenPropSheetW SHOpenPropSheet;
else
	alias SHOpenPropSheetA SHOpenPropSheet;

struct DFMICS {
	DWORD cbSize;
	DWORD fMask;
	LPARAM lParam;
	UINT idCmdFirst;
	UINT idDefMax;
	LPCMINVOKECOMMANDINFO pici;
	//(NTDDI_VERSION >= NTDDI_VISTA)
		IUnknown punkSite;
}
alias DFMICS* PDFMICS;

enum {
	DFM_MERGECONTEXTMENU        = 1,
	DFM_INVOKECOMMAND           = 2,
	DFM_GETHELPTEXT             = 5,
	DFM_WM_MEASUREITEM          = 6,
	DFM_WM_DRAWITEM             = 7,
	DFM_WM_INITMENUPOPUP        = 8,
	DFM_VALIDATECMD             = 9,
	DFM_MERGECONTEXTMENU_TOP    = 10,
	DFM_GETHELPTEXTW            = 11,
	DFM_INVOKECOMMANDEX         = 12,
	DFM_MAPCOMMANDNAME          = 13,
	DFM_GETDEFSTATICID          = 14,
	DFM_GETVERBW                = 15,
	DFM_GETVERBA                = 16,
	DFM_MERGECONTEXTMENU_BOTTOM = 17,
	DFM_MODIFYQCMFLAGS          = 18,
}

enum {
	DFM_CMD_DELETE       = cast(UINT)-1,
	DFM_CMD_MOVE         = cast(UINT)-2,
	DFM_CMD_COPY         = cast(UINT)-3,
	DFM_CMD_LINK         = cast(UINT)-4,
	DFM_CMD_PROPERTIES   = cast(UINT)-5,
	DFM_CMD_NEWFOLDER    = cast(UINT)-6,
	DFM_CMD_PASTE        = cast(UINT)-7,
	DFM_CMD_VIEWLIST     = cast(UINT)-8,
	DFM_CMD_VIEWDETAILS  = cast(UINT)-9,
	DFM_CMD_PASTELINK    = cast(UINT)-10,
	DFM_CMD_PASTESPECIAL = cast(UINT)-11,
	DFM_CMD_MODALPROP    = cast(UINT)-12,
	DFM_CMD_RENAME       = cast(UINT)-13,
}

alias extern(Windows) HRESULT function(IShellView psvOuter, IShellFolder psf, HWND hwndMain, UINT uMsg, WPARAM wParam, LPARAM lParam) LPFNVIEWCALLBACK;

struct CSFV {
	UINT cbSize;
	IShellFolder pshf;
	IShellView psvOuter;
	PCIDLIST_ABSOLUTE pidl;
	LONG lEvents;
	LPFNVIEWCALLBACK pfnCallback;
	FOLDERVIEWMODE fvm;
}
alias CSFV* LPCSFV;

enum SFVM_REARRANGE = 0x00000001;
/*BOOL ShellFolderView_ReArrange(HWND _hwnd, LPARAM _lparam)
{
	return cast(BOOL)SHShellFolderView_Message(_hwnd, SFVM_REARRANGE, _lparam);
}*/

enum SFVM_ADDOBJECT = 0x00000003;
/*LPARAM ShellFolderView_AddObject(HWND _hwnd, PIDL* _pidl)
{
	return cast(LPARAM)SHShellFolderView_Message(_hwnd, SFVM_ADDOBJECT, cast(LPARAM)_pidl);
}*/

enum SFVM_REMOVEOBJECT = 0x00000006;
/*LPARAM ShellFolderView_RemoveObject(HWND _hwnd, PIDL* _pidl)
{
	return  cast(LPARAM)SHShellFolderView_Message(_hwnd, SFVM_REMOVEOBJECT, cast(LPARAM)_pidl);
}*/

enum SFVM_UPDATEOBJECT = 0x00000007;
/*LPARAM ShellFolderView_UpdateObject(HWND _hwnd, PIDL* _ppidl)
{
	return cast(LPARAM)SHShellFolderView_Message(_hwnd, SFVM_UPDATEOBJECT, (LPARAM)_ppidl);
}*/

enum SFVM_GETSELECTEDOBJECTS = 0x00000009;
/*LPARAM ShellFolderView_GetSelectedObjects(HWND _hwnd, PIDL* ppidl)
{
	return cast(LPARAM)SHShellFolderView_Message(_hwnd, SFVM_GETSELECTEDOBJECTS, (LPARAM)ppidl);
}*/

struct SFV_SETITEMPOS {
	PCUITEMID_CHILD pidl;
	POINT pt;
}
alias SFV_SETITEMPOS* LPSFV_SETITEMPOS;
alias const(SFV_SETITEMPOS)* PCSFV_SETITEMPOS;

enum SFVM_SETITEMPOS = 0x0000000e;
/*ShellFolderView_SetItemPos(HWND _hwnd, _pidl, _x, _y)
{
	SFV_SETITEMPOS _sip = {_pidl, {_x, _y}};

	SHShellFolderView_Message(_hwnd, SFVM_SETITEMPOS, cast(LPARAM)&_sip);
}*/

enum SFVM_SETCLIPBOARD = 0x00000010;
/*void ShellFolderView_SetClipboard(HWND _hwnd, DWORD _dwEffect)
{
	SHShellFolderView_Message(_hwnd, SFVM_SETCLIPBOARD, (LPARAM)_dwEffect);
}*/

enum SFVM_SETPOINTS = 0x00000017;
/*void ShellFolderView_SetPoints(HWND _hwnd, _pdtobj)
{
	SHShellFolderView_Message(_hwnd, SFVM_SETPOINTS, cast(LPARAM)_pdtobj);
}*/
} // align(8)

export extern(Windows){
	IContextMenu SHFind_InitMenuPopup(HMENU hmenu, HWND hwndOwner, UINT idCmdFirst, UINT idCmdLast);
	HRESULT SHCreateShellFolderViewEx(LPCSFV pcsfv, IShellView* ppsv);
}

enum {
	PID_IS_URL         = 2,
	PID_IS_NAME        = 4,
	PID_IS_WORKINGDIR  = 5,
	PID_IS_HOTKEY      = 6,
	PID_IS_SHOWCMD     = 7,
	PID_IS_ICONINDEX   = 8,
	PID_IS_ICONFILE    = 9,
	PID_IS_WHATSNEW    = 10,
	PID_IS_AUTHOR      = 11,
	PID_IS_DESCRIPTION = 12,
	PID_IS_COMMENT     = 13,
}

enum {
	PID_INTSITE_WHATSNEW     = 2,
	PID_INTSITE_AUTHOR       = 3,
	PID_INTSITE_LASTVISIT    = 4,
	PID_INTSITE_LASTMOD      = 5,
	PID_INTSITE_VISITCOUNT   = 6,
	PID_INTSITE_DESCRIPTION  = 7,
	PID_INTSITE_COMMENT      = 8,
	PID_INTSITE_FLAGS        = 9,
	PID_INTSITE_CONTENTLEN   = 10,
	PID_INTSITE_CONTENTCODE  = 11,
	PID_INTSITE_RECURSE      = 12,
	PID_INTSITE_WATCH        = 13,
	PID_INTSITE_SUBSCRIPTION = 14,
	PID_INTSITE_URL          = 15,
	PID_INTSITE_TITLE        = 16,
	PID_INTSITE_CODEPAGE     = 18,
	PID_INTSITE_TRACKING     = 19,
	PID_INTSITE_ICONINDEX    = 20,
	PID_INTSITE_ICONFILE     = 21,
}

enum {
	PIDISF_RECENTLYCHANGED = 0x00000001,
	PIDISF_CACHEDSTICKY    = 0x00000002,
	PIDISF_CACHEIMAGES     = 0x00000010,
	PIDISF_FOLLOWALLLINKS  = 0x00000020,
}

enum {
	PIDISM_GLOBAL    = 0,
	PIDISM_WATCH     = 1,
	PIDISM_DONTWATCH = 2,
}

struct SHELLSTATEA {
	/*
	BOOL fShowAllObjects : 1;
	BOOL fShowExtensions : 1;
	BOOL fNoConfirmRecycle : 1;
	BOOL fShowSysFiles : 1;
	BOOL fShowCompColor : 1;
	BOOL fDoubleClickInWebView : 1;
	BOOL fDesktopHTML : 1;
	BOOL fWin95Classic : 1;

	BOOL fDontPrettyPath : 1;
	BOOL fShowAttribCol : 1;
	BOOL fMapNetDrvBtn : 1;
	BOOL fShowInfoTip : 1;
	BOOL fHideIcons : 1;
	BOOL fWebView : 1;
	BOOL fFilter : 1;
	BOOL fShowSuperHidden : 1;

	BOOL fNoNetCrawling : 1;
	*/
	ubyte d1;
	ubyte d2;
	ubyte d3;

	DWORD dwWin95Unused;
	UINT uWin95Unused;
	LONG lParamSort;
	int iSortDirection;

	UINT version_;
	UINT uNotUsed;

	/*BOOL fSepProcess: 1;
	BOOL fStartPanelOn: 1;
	BOOL fShowStartPage: 1;
	BOOL fAutoCheckSelect: 1;
	BOOL fIconsOnly: 1;
	BOOL fShowTypeOverlay: 1;
	UINT fSpareFlags : 11;*/
	ubyte d4;
	ubyte d5;
	ubyte d6;
}
alias SHELLSTATEA* LPSHELLSTATEA;

struct SHELLSTATEW {
	/*BOOL fShowAllObjects : 1;
	BOOL fShowExtensions : 1;
	BOOL fNoConfirmRecycle : 1;
	BOOL fShowSysFiles : 1;
	BOOL fShowCompColor : 1;
	BOOL fDoubleClickInWebView : 1;
	BOOL fDesktopHTML : 1;
	BOOL fWin95Classic : 1;
	BOOL fDontPrettyPath : 1;
	BOOL fShowAttribCol : 1;
	BOOL fMapNetDrvBtn : 1;
	BOOL fShowInfoTip : 1;
	BOOL fHideIcons : 1;
	BOOL fWebView : 1;
	BOOL fFilter : 1;
	BOOL fShowSuperHidden : 1;
	BOOL fNoNetCrawling : 1;*/
	ubyte d1;
	ubyte d2;
	ubyte d3;

	DWORD dwWin95Unused;
	UINT uWin95Unused;
	LONG lParamSort;
	int iSortDirection;
	UINT version_;
	UINT uNotUsed;

	/*BOOL fSepProcess: 1;
	BOOL fStartPanelOn: 1;
	BOOL fShowStartPage: 1;
	BOOL fAutoCheckSelect: 1;
	BOOL fIconsOnly: 1;
	BOOL fShowTypeOverlay: 1;
	UINT fSpareFlags : 11;*/
	ubyte d4;
	ubyte d5;
	ubyte d6;
}
alias SHELLSTATEW* LPSHELLSTATEW;

enum {
	SHELLSTATEVERSION_IE4 = 9,
	SHELLSTATEVERSION_WIN2K = 10,
}

version(UNICODE){
	alias SHELLSTATEW SHELLSTATE;
	alias LPSHELLSTATEW LPSHELLSTATE;
}else{
	alias SHELLSTATEA SHELLSTATE;
	alias LPSHELLSTATEA LPSHELLSTATE;
}

enum SHELLSTATE_SIZE_WIN95 = SHELLSTATE.lParamSort.offsetof;
enum SHELLSTATE_SIZE_NT4 = SHELLSTATE.version_.offsetof;
enum SHELLSTATE_SIZE_IE4 = SHELLSTATE.uNotUsed.offsetof;
enum SHELLSTATE_SIZE_WIN2K = SHELLSTATE.sizeof;

export extern(Windows) void SHGetSetSettings(LPSHELLSTATE lpss, DWORD dwMask, BOOL bSet);

struct SHELLFLAGSTATE {
	/*BOOL fShowAllObjects : 1;
	BOOL fShowExtensions : 1;
	BOOL fNoConfirmRecycle : 1;
	BOOL fShowSysFiles : 1;
	BOOL fShowCompColor : 1;
	BOOL fDoubleClickInWebView : 1;
	BOOL fDesktopHTML : 1;
	BOOL fWin95Classic : 1;
	BOOL fDontPrettyPath : 1;
	BOOL fShowAttribCol : 1;
	BOOL fMapNetDrvBtn : 1;
	BOOL fShowInfoTip : 1;
	BOOL fHideIcons : 1;
	//(NTDDI_VERSION >= NTDDI_VISTA)
		BOOL fAutoCheckSelect: 1;
		BOOL fIconsOnly: 1;
		UINT fRestFlags : 1;*/
	ushort flags;
}
alias SHELLFLAGSTATE* LPSHELLFLAGSTATE;

enum {
	SSF_SHOWALLOBJECTS       = 0x00000001,
	SSF_SHOWEXTENSIONS       = 0x00000002,
	SSF_HIDDENFILEEXTS       = 0x00000004,
	SSF_SERVERADMINUI        = 0x00000004,
	SSF_SHOWCOMPCOLOR        = 0x00000008,
	SSF_SORTCOLUMNS          = 0x00000010,
	SSF_SHOWSYSFILES         = 0x00000020,
	SSF_DOUBLECLICKINWEBVIEW = 0x00000080,
	SSF_SHOWATTRIBCOL        = 0x00000100,
	SSF_DESKTOPHTML          = 0x00000200,
	SSF_WIN95CLASSIC         = 0x00000400,
	SSF_DONTPRETTYPATH       = 0x00000800,
	SSF_SHOWINFOTIP          = 0x00002000,
	SSF_MAPNETDRVBUTTON      = 0x00001000,
	SSF_NOCONFIRMRECYCLE     = 0x00008000,
	SSF_HIDEICONS            = 0x00004000,
	SSF_FILTER               = 0x00010000,
	SSF_WEBVIEW              = 0x00020000,
	SSF_SHOWSUPERHIDDEN      = 0x00040000,
	SSF_SEPPROCESS           = 0x00080000,
	//(NTDDI_VERSION >= NTDDI_WINXP)
		SSF_NONETCRAWLING = 0x00100000,
		SSF_STARTPANELON  = 0x00200000,
		SSF_SHOWSTARTPAGE = 0x00400000,
	//(NTDDI_VERSION >= NTDDI_VISTA)
		SSF_AUTOCHECKSELECT = 0x00800000,
		SSF_ICONSONLY       = 0x01000000,
		SSF_SHOWTYPEOVERLAY = 0x02000000,
}

export extern(Windows){
	void SHGetSettings(SHELLFLAGSTATE* psfs, DWORD dwMask);

	HRESULT SHBindToParent(PCIDLIST_ABSOLUTE pidl, REFIID riid, void** ppv, PCUITEMID_CHILD* ppidlLast);

	static if(NTDDI_VERSION >= NTDDI_VISTA){
		HRESULT SHBindToFolderIDListParent(IShellFolder psfRoot, PCUIDLIST_RELATIVE pidl, REFIID riid, void** ppv, PCUITEMID_CHILD* ppidlLast);
		HRESULT SHBindToFolderIDListParentEx(IShellFolder psfRoot, PCUIDLIST_RELATIVE pidl, IBindCtx ppbc, REFIID riid, void** ppv, PCUITEMID_CHILD* ppidlLast);
		HRESULT SHBindToObject(IShellFolder* psf, PCUIDLIST_RELATIVE pidl, IBindCtx pbc, REFIID riid, void** ppv);
	}

	static if(NTDDI_VERSION >= NTDDI_WINXP){
		HRESULT SHParseDisplayName(PCWSTR pszName, IBindCtx pbc, PIDLIST_ABSOLUTE* ppidl, SFGAOF sfgaoIn, SFGAOF* psfgaoOut);
	}
}

enum {
	SHPPFW_NONE           = 0x00000000,
	SHPPFW_DIRCREATE      = 0x00000001,
	SHPPFW_DEFAULT        = SHPPFW_DIRCREATE,
	SHPPFW_ASKDIRCREATE   = 0x00000002,
	SHPPFW_IGNOREFILENAME = 0x00000004,
	SHPPFW_NOWRITECHECK   = 0x00000008,
	//(NTDDI_VERSION >= NTDDI_WINXP)
		SHPPFW_MEDIACHECKONLY = 0x00000010,
}

export extern(Windows){
	HRESULT SHPathPrepareForWriteA(HWND hwnd, IUnknown punkEnableModless, LPCSTR pszPath, DWORD dwFlags);
	HRESULT SHPathPrepareForWriteW(HWND hwnd, IUnknown punkEnableModless, LPCWSTR pszPath, DWORD dwFlags);
}
version(UNICODE)
	alias SHPathPrepareForWriteW SHPathPrepareForWrite;
else
	alias SHPathPrepareForWriteA SHPathPrepareForWrite;

interface INamedPropertyBag : IUnknown {
public extern(Windows):
	HRESULT ReadPropertyNPB(LPCWSTR pszBagname, LPCWSTR pszPropName, PROPVARIANT* pVar);
	HRESULT WritePropertyNPB(LPCWSTR pszBagname, LPCWSTR pszPropName, PROPVARIANT* pVar);
	HRESULT RemovePropertyNPB(LPCWSTR pszBagname, LPCWSTR pszPropName);
}
mixin DEFINE_IID!(INamedPropertyBag, "FB700430-952C-11d1-946F-000000000000");

export extern(Windows){
	DWORD SoftwareUpdateMessageBox(HWND hWnd, LPCWSTR pszDistUnit, DWORD dwFlags, LPSOFTDISTINFO psdi);
	HRESULT SHPropStgCreate(IPropertySetStorage psstg, REFFMTID fmtid, const(CLSID)* pclsid, DWORD grfFlags, DWORD grfMode, DWORD dwDisposition, IPropertyStorage* ppstg, UINT* puCodePage);
	HRESULT SHPropStgReadMultiple(IPropertyStorage pps, UINT uCodePage, ULONG cpspec, PROPSPEC* rgpspec, PROPVARIANT* rgvar);
	HRESULT SHPropStgWriteMultiple(IPropertyStorage pps, UINT* puCodePage, ULONG cpspec, PROPSPEC* rgpspec, PROPVARIANT* rgvar, PROPID propidNameFirst);

	static if(NTDDI_VERSION >= NTDDI_WINXP){
		HRESULT SHCreateFileExtractIconA(LPCSTR pszFile, DWORD dwFileAttributes, REFIID riid, void** ppv);
		HRESULT SHCreateFileExtractIconW(LPCWSTR pszFile, DWORD dwFileAttributes, REFIID riid, void** ppv);
		version(UNICODE)
			alias SHCreateFileExtractIconW SHCreateFileExtractIcon;
		else
			alias SHCreateFileExtractIconA SHCreateFileExtractIcon;
	}

	HRESULT SHLimitInputEdit(HWND hwndEdit, IShellFolder psf);
	HRESULT SHGetAttributesFromDataObject(IDataObject pdo, DWORD dwAttributeMask, DWORD* pdwAttributes, UINT* pcItems);

	HRESULT SHMultiFileProperties(IDataObject pdtobj, DWORD dwFlags);

	int SHMapPIDLToSystemImageListIndex(IShellFolder pshf, PCUITEMID_CHILD pidl, int* piIndexSel);

	HRESULT SHCLSIDFromString(LPCWSTR psz, CLSID* pclsid);
	HRESULT SHCreateQueryCancelAutoPlayMoniker(IMoniker* ppmoniker);
	void PerUserInit();
	BOOL SHRunControlPanel(LPCWSTR lpcszCmdLine, HWND hwndMsgParent);

	int PickIconDlg(HWND hwnd, LPWSTR pszIconPath, UINT cchIconPath, int* piIconIndex);
}

align(8){

struct AASHELLMENUFILENAME {
	SHORT cbTotal;
	BYTE[12] rgbReserved;
	WCHAR[1] szFileName;
}
alias AASHELLMENUFILENAME* LPAASHELLMENUFILENAME;

struct AASHELLMENUITEM {
	void* lpReserved1;
	int iReserved;
	UINT uiReserved;
	LPAASHELLMENUFILENAME lpName;
	LPWSTR psz;
}
alias AASHELLMENUITEM* LPAASHELLMENUITEM;

}// align(8)

static if(NTDDI_VERSION >= NTDDI_WIN7)
	export extern(Windows) HRESULT StgMakeUniqueName(IStorage stgParent, PCWSTR pszFileSpec, DWORD grfMode, REFIID riid, void** ppv);

//(_WIN32_IE >= _WIN32_IE_IE70)
	enum {
		IESHORTCUT_NEWBROWSER    = 0x01,
		IESHORTCUT_OPENNEWTAB    = 0x02,
		IESHORTCUT_FORCENAVIGATE = 0x04,
		IESHORTCUT_BACKGROUNDTAB = 0x08,
	}
	alias int IESHORTCUTFLAGS;

static if(_WIN32_IE >= _WIN32_IE_XP){
	export extern(Windows){
		BOOL ImportPrivacySettings(LPCWSTR pszFilename, BOOL* pfParsePrivacyPreferences, BOOL* pfParsePerSiteRules);
		HRESULT DoPrivacyDlg(HWND hwndOwner, LPCWSTR pszUrl, IEnumPrivacyRecords pPrivacyEnum, BOOL fReportAllSites);
	}
}

}// align(1)
}// extern(C)
