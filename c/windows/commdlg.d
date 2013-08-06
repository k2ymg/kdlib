/** commdlg.d

Converted from 'commdlg.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.commdlg;


import c.windows.sdkddkver;
import c.windows.windef;
import c.windows.guiddef;
import c.windows.winuser;
import c.windows.wingdi;
import c.windows.unknwn;
import c.windows.prsht;


mixin DEFINE_GUID!("IID_IPrintDialogCallback", 0x5852a2c3, 0x6530, 0x11d1, 0xb6, 0xa3, 0x0, 0x0, 0xf8, 0x75, 0x7b, 0xf9);
mixin DEFINE_GUID!("IID_IPrintDialogServices", 0x509aaeda, 0x5639, 0x11d1, 0xb6, 0xa1, 0x0, 0x0, 0xf8, 0x75, 0x7b, 0xf9);

extern(C){

alias extern(Windows) UINT_PTR function(HWND, UINT, WPARAM, LPARAM) LPOFNHOOKPROC;

struct OPENFILENAME_NT4T(T) {
	DWORD lStructSize;
	HWND hwndOwner;
	HINSTANCE hInstance;
	const(T)* lpstrFilter;
	T* lpstrCustomFilter;
	DWORD nMaxCustFilter;
	DWORD nFilterIndex;
	T* lpstrFile;
	DWORD nMaxFile;
	T* lpstrFileTitle;
	DWORD nMaxFileTitle;
	const(T)* lpstrInitialDir;
	const(T)* lpstrTitle;
	DWORD Flags;
	WORD nFileOffset;
	WORD nFileExtension;
	const(T)* lpstrDefExt;
	LPARAM lCustData;
	LPOFNHOOKPROC lpfnHook;
	const(T)* lpTemplateName;
}
version(Win32){
	align(1){
		alias OPENFILENAME_NT4T!(char) OPENFILENAME_NT4A;
		alias OPENFILENAME_NT4T!(wchar) OPENFILENAME_NT4W;
	}
}else{
	alias OPENFILENAME_NT4T!(char) OPENFILENAME_NT4A;
	alias OPENFILENAME_NT4T!(wchar) OPENFILENAME_NT4W;
}
alias OPENFILENAME_NT4A* LPOPENFILENAME_NT4A;
alias OPENFILENAME_NT4W* LPOPENFILENAME_NT4W;
version(UNICODE){
	alias OPENFILENAME_NT4W OPENFILENAME_NT4;
	alias LPOPENFILENAME_NT4W LPOPENFILENAME_NT4;
}else{
	alias OPENFILENAME_NT4A OPENFILENAME_NT4;
	alias LPOPENFILENAME_NT4A LPOPENFILENAME_NT4;
}

struct OPENFILENAMET(T) {
	DWORD lStructSize;
	HWND hwndOwner;
	HINSTANCE hInstance;
	const(T)* lpstrFilter;
	T* lpstrCustomFilter;
	DWORD nMaxCustFilter;
	DWORD nFilterIndex;
	T* lpstrFile;
	DWORD nMaxFile;
	T* lpstrFileTitle;
	DWORD nMaxFileTitle;
	const(T)* lpstrInitialDir;
	const(T)* lpstrTitle;
	DWORD Flags;
	WORD nFileOffset;
	WORD nFileExtension;
	const(T)* lpstrDefExt;
	LPARAM lCustData;
	LPOFNHOOKPROC lpfnHook;
	const(T)* lpTemplateName;
	void* pvReserved;
	DWORD dwReserved;
	DWORD FlagsEx;
}
version(Win32){
	align(1){
		alias OPENFILENAMET!(char) OPENFILENAMEA;
		alias OPENFILENAMET!(wchar) OPENFILENAMEW;
	}
}else{
	alias OPENFILENAMET!(char) OPENFILENAMEA;
	alias OPENFILENAMET!(wchar) OPENFILENAMEW;
}
alias OPENFILENAMEA* LPOPENFILENAMEA;
alias OPENFILENAMEW* LPOPENFILENAMEW;
version(UNICODE){
	alias OPENFILENAMEW OPENFILENAME;
	alias LPOPENFILENAMEW LPOPENFILENAME;
}else{
	alias OPENFILENAMEA OPENFILENAME;
	alias LPOPENFILENAMEA LPOPENFILENAME;
}

enum {
	OPENFILENAME_SIZE_VERSION_400A = OPENFILENAMEA.lpTemplateName.offsetof + OPENFILENAMEA.lpTemplateName.sizeof,
	OPENFILENAME_SIZE_VERSION_400W = OPENFILENAMEW.lpTemplateName.offsetof + OPENFILENAMEW.lpTemplateName.sizeof,
}
version(UNICODE)
	enum OPENFILENAME_SIZE_VERSION_400 = OPENFILENAME_SIZE_VERSION_400W;
else
	enum OPENFILENAME_SIZE_VERSION_400 = OPENFILENAME_SIZE_VERSION_400A;

export extern(Windows) BOOL GetOpenFileNameA(LPOPENFILENAMEA);
export extern(Windows) BOOL GetOpenFileNameW(LPOPENFILENAMEW);
version(UNICODE)
	alias GetOpenFileNameW GetOpenFileName;
else
	alias GetOpenFileNameA GetOpenFileName;

export extern(Windows) BOOL GetSaveFileNameA(LPOPENFILENAMEA);
export extern(Windows) BOOL GetSaveFileNameW(LPOPENFILENAMEW);
version(UNICODE)
	alias GetSaveFileNameW GetSaveFileName;
else
	alias GetSaveFileNameA GetSaveFileName;

export extern(Windows) short GetFileTitleA(LPCSTR, LPSTR Buf, WORD cchSize);
export extern(Windows) short GetFileTitleW(LPCWSTR, LPWSTR Buf, WORD cchSize);
version(UNICODE)
	alias GetFileTitleW GetFileTitle;
else
	alias GetFileTitleA GetFileTitle;

enum {
	OFN_READONLY             = 0x00000001,
	OFN_OVERWRITEPROMPT      = 0x00000002,
	OFN_HIDEREADONLY         = 0x00000004,
	OFN_NOCHANGEDIR          = 0x00000008,
	OFN_SHOWHELP             = 0x00000010,
	OFN_ENABLEHOOK           = 0x00000020,
	OFN_ENABLETEMPLATE       = 0x00000040,
	OFN_ENABLETEMPLATEHANDLE = 0x00000080,
	OFN_NOVALIDATE           = 0x00000100,
	OFN_ALLOWMULTISELECT     = 0x00000200,
	OFN_EXTENSIONDIFFERENT   = 0x00000400,
	OFN_PATHMUSTEXIST        = 0x00000800,
	OFN_FILEMUSTEXIST        = 0x00001000,
	OFN_CREATEPROMPT         = 0x00002000,
	OFN_SHAREAWARE           = 0x00004000,
	OFN_NOREADONLYRETURN     = 0x00008000,
	OFN_NOTESTFILECREATE     = 0x00010000,
	OFN_NONETWORKBUTTON      = 0x00020000,
	OFN_NOLONGNAMES          = 0x00040000,
	OFN_EXPLORER             = 0x00080000,
	OFN_NODEREFERENCELINKS   = 0x00100000,
	OFN_LONGNAMES            = 0x00200000,
	OFN_ENABLEINCLUDENOTIFY  = 0x00400000,
	OFN_ENABLESIZING         = 0x00800000,
	OFN_DONTADDTORECENT      = 0x02000000,
	OFN_FORCESHOWHIDDEN      = 0x10000000,
	OFN_EX_NOPLACESBAR       = 0x00000001,
	OFN_SHAREFALLTHROUGH     = 2,
	OFN_SHARENOWARN          = 1,
	OFN_SHAREWARN            = 0,
}
alias extern(Windows) UINT_PTR function(HWND, UINT, WPARAM, LPARAM) LPCCHOOKPROC;

version(Win32){
	align(1){
		struct OFNOTIFYA {
			NMHDR hdr;
			LPOPENFILENAMEA lpOFN;
			LPSTR pszFile;
		}
		struct OFNOTIFYW {
			NMHDR hdr;
			LPOPENFILENAMEW lpOFN;
			LPWSTR pszFile;
		}
	}
}else{
	struct OFNOTIFYA {
		NMHDR hdr;
		LPOPENFILENAMEA lpOFN;
		LPSTR pszFile;
	}
	struct OFNOTIFYW {
		NMHDR hdr;
		LPOPENFILENAMEW lpOFN;
		LPWSTR pszFile;
	}
}
alias OFNOTIFYA* LPOFNOTIFYA;
alias OFNOTIFYW* LPOFNOTIFYW;
version(UNICODE){
	alias OFNOTIFYW OFNOTIFY;
	alias LPOFNOTIFYW LPOFNOTIFY;
}else{
	alias OFNOTIFYA OFNOTIFY;
	alias LPOFNOTIFYA LPOFNOTIFY;
}

version(Win32){
	align(1){
		struct OFNOTIFYEXA {
			NMHDR hdr;
			LPOPENFILENAMEA lpOFN;
			LPVOID psf;
			LPVOID pidl;
		}
		struct OFNOTIFYEXW {
			NMHDR hdr;
			LPOPENFILENAMEW lpOFN;
			LPVOID psf;
			LPVOID pidl;
		}
	}
}else{
	struct OFNOTIFYEXA {
		NMHDR hdr;
		LPOPENFILENAMEA lpOFN;
		LPVOID psf;
		LPVOID pidl;
	}
	struct OFNOTIFYEXW {
		NMHDR hdr;
		LPOPENFILENAMEW lpOFN;
		LPVOID psf;
		LPVOID pidl;
	}
}
alias OFNOTIFYEXA* LPOFNOTIFYEXA;
alias OFNOTIFYEXW* LPOFNOTIFYEXW;
version(UNICODE){
	alias OFNOTIFYEXW OFNOTIFYEX;
	alias LPOFNOTIFYEXW LPOFNOTIFYEX;
}else{
	alias OFNOTIFYEXA OFNOTIFYEX;
	alias LPOFNOTIFYEXA LPOFNOTIFYEX;
}

enum {
	CDN_FIRST          = 0 - 601,
	CDN_LAST           = 0 - 699,
	CDN_INITDONE       = CDN_FIRST - 0x0000,
	CDN_SELCHANGE      = CDN_FIRST - 0x0001,
	CDN_FOLDERCHANGE   = CDN_FIRST - 0x0002,
	CDN_SHAREVIOLATION = CDN_FIRST - 0x0003,
	CDN_HELP           = CDN_FIRST - 0x0004,
	CDN_FILEOK         = CDN_FIRST - 0x0005,
	CDN_TYPECHANGE     = CDN_FIRST - 0x0006,
	CDN_INCLUDEITEM    = CDN_FIRST - 0x0007,
}
enum {
	CDM_FIRST           = WM_USER + 100,
	CDM_LAST            = WM_USER + 200,
	CDM_GETSPEC         = CDM_FIRST + 0x0000,
	CDM_GETFILEPATH     = CDM_FIRST + 0x0001,
	CDM_GETFOLDERPATH   = CDM_FIRST + 0x0002,
	CDM_GETFOLDERIDLIST = CDM_FIRST + 0x0003,
	CDM_SETCONTROLTEXT  = CDM_FIRST + 0x0004,
	CDM_HIDECONTROL     = CDM_FIRST + 0x0005,
	CDM_SETDEFEXT       = CDM_FIRST + 0x0006,
}

version(HelperFunctions){
	int CommDlg_OpenSave_GetSpecA(HWND _hdlg, int _psz, LPSTR _cbmax)
	{
		return cast(int)SendMessage(_hdlg, CDM_GETSPEC, cast(WPARAM)_cbmax, cast(LPARAM)_psz);
	}
	int CommDlg_OpenSave_GetSpecW(HWND _hdlg, int _psz, LPWSTR _cbmax)
	{
		return cast(int)SendMessage(_hdlg, CDM_GETSPEC, cast(WPARAM)_cbmax, cast(LPARAM)_psz);
	}
	version(UNICODE)
		alias CommDlg_OpenSave_GetSpecW CommDlg_OpenSave_GetSpec;
	else
		alias CommDlg_OpenSave_GetSpecA CommDlg_OpenSave_GetSpec;

	int CommDlg_OpenSave_GetFilePathA(HWND _hdlg, LPSTR _psz, int _cbmax)
	{
		return cast(int)SendMessage(_hdlg, CDM_GETFILEPATH, cast(WPARAM)_cbmax, cast(LPARAM)_psz);
	}
	int CommDlg_OpenSave_GetFilePathW(HWND _hdlg, LPWSTR _psz, int _cbmax)
	{
		return cast(int)SendMessage(_hdlg, CDM_GETFILEPATH, cast(WPARAM)_cbmax, cast(LPARAM)_psz);
	}
	version(UNICODE)
		alias CommDlg_OpenSave_GetFilePathW CommDlg_OpenSave_GetFilePath;
	else
		alias CommDlg_OpenSave_GetFilePathA CommDlg_OpenSave_GetFilePath;

	int CommDlg_OpenSave_GetFolderPathA(HWND _hdlg, LPSTR _psz, int _cbmax)
	{
		return cast(int)SendMessage(_hdlg, CDM_GETFOLDERPATH, cast(WPARAM)_cbmax, cast(LPARAM)_psz);
	}
	int CommDlg_OpenSave_GetFolderPathW(HWND _hdlg, LPWSTR _psz, int _cbmax)
	{
		return cast(int)SendMessage(_hdlg, CDM_GETFOLDERPATH, cast(WPARAM)_cbmax, cast(LPARAM)_psz);
	}
	version(UNICODE)
		alias CommDlg_OpenSave_GetFolderPathW CommDlg_OpenSave_GetFolderPath;
	else
		alias CommDlg_OpenSave_GetFolderPathA CommDlg_OpenSave_GetFolderPath;

	int CommDlg_OpenSave_GetFolderIDList(HWND _hdlg, void* _pidl, int _cbmax)
	{
		return cast(int)SendMessage(_hdlg, CDM_GETFOLDERIDLIST, cast(WPARAM)_cbmax, cast(LPARAM)_pidl);
	}

	void CommDlg_OpenSave_SetControlText(HWND _hdlg, uint _id, LPSTR _text)
	{
		SendMessage(_hdlg, CDM_SETCONTROLTEXT, cast(WPARAM)_id, cast(LPARAM)_text);
	}

	void CommDlg_OpenSave_HideControl(HWND _hdlg, uint _id)
	{
		SendMessage(_hdlg, CDM_HIDECONTROL, cast(WPARAM)_id, 0);
	}

	void CommDlg_OpenSave_SetDefExt(HWND _hdlg, LPSTR _pszext)
	{
		SendMessage(_hdlg, CDM_SETDEFEXT, 0, cast(LPARAM)_pszext);
	}
}



struct CHOOSECOLORT(T) {
	DWORD lStructSize;
	HWND hwndOwner;
	HWND hInstance;
	COLORREF rgbResult;
	COLORREF* lpCustColors;
	DWORD Flags;
	LPARAM lCustData;
	LPCCHOOKPROC lpfnHook;
	const(T)* lpTemplateName;
}
version(Win32){
	align(1){
		alias CHOOSECOLORT!(char) CHOOSECOLORA;
		alias CHOOSECOLORT!(wchar) CHOOSECOLORW;
	}
}else{
	alias CHOOSECOLORT!(char) CHOOSECOLORA;
	alias CHOOSECOLORT!(wchar) CHOOSECOLORW;
}
alias CHOOSECOLORA* LPCHOOSECOLORA;
alias CHOOSECOLORW* LPCHOOSECOLORW;
version(UNICODE){
	alias CHOOSECOLORW CHOOSECOLOR;
	alias LPCHOOSECOLORW LPCHOOSECOLOR;
}else{
	alias CHOOSECOLORA CHOOSECOLOR;
	alias LPCHOOSECOLORA LPCHOOSECOLOR;
}

export extern(Windows) BOOL ChooseColorA(LPCHOOSECOLORA);
export extern(Windows) BOOL ChooseColorW(LPCHOOSECOLORW);
version(UNICODE)
	alias ChooseColorW ChooseColor;
else
	alias ChooseColorA ChooseColor;

enum {
	CC_RGBINIT              = 0x00000001,
	CC_FULLOPEN             = 0x00000002,
	CC_PREVENTFULLOPEN      = 0x00000004,
	CC_SHOWHELP             = 0x00000008,
	CC_ENABLEHOOK           = 0x00000010,
	CC_ENABLETEMPLATE       = 0x00000020,
	CC_ENABLETEMPLATEHANDLE = 0x00000040,
	CC_SOLIDCOLOR           = 0x00000080,
	CC_ANYCOLOR             = 0x00000100,
}

alias extern(Windows) UINT_PTR function(HWND, UINT, WPARAM, LPARAM) LPFRHOOKPROC;

struct FINDREPLACET(T) {
	DWORD lStructSize;
	HWND hwndOwner;
	HINSTANCE hInstance;
	DWORD Flags;
	T* lpstrFindWhat;
	T* lpstrReplaceWith;
	WORD wFindWhatLen;
	WORD wReplaceWithLen;
	LPARAM lCustData;
	LPFRHOOKPROC lpfnHook;
	const(T)* lpTemplateName;
}
version(Win32){
	align(1){
		alias FINDREPLACET!(char) FINDREPLACEA;
		alias FINDREPLACET!(wchar) FINDREPLACEW;
	}
}else{
	alias FINDREPLACET!(char) FINDREPLACEA;
	alias FINDREPLACET!(wchar) FINDREPLACEW;
}
alias FINDREPLACEA* LPFINDREPLACEA;
alias FINDREPLACEW* LPFINDREPLACEW;
version(UNICODE){
	alias FINDREPLACEW FINDREPLACE;
	alias LPFINDREPLACEW LPFINDREPLACE;
}else{
	alias FINDREPLACEA FINDREPLACE;
	alias LPFINDREPLACEA LPFINDREPLACE;
}

enum {
	FR_DOWN                 = 0x00000001,
	FR_WHOLEWORD            = 0x00000002,
	FR_MATCHCASE            = 0x00000004,
	FR_FINDNEXT             = 0x00000008,
	FR_REPLACE              = 0x00000010,
	FR_REPLACEALL           = 0x00000020,
	FR_DIALOGTERM           = 0x00000040,
	FR_SHOWHELP             = 0x00000080,
	FR_ENABLEHOOK           = 0x00000100,
	FR_ENABLETEMPLATE       = 0x00000200,
	FR_NOUPDOWN             = 0x00000400,
	FR_NOMATCHCASE          = 0x00000800,
	FR_NOWHOLEWORD          = 0x00001000,
	FR_ENABLETEMPLATEHANDLE = 0x00002000,
	FR_HIDEUPDOWN           = 0x00004000,
	FR_HIDEMATCHCASE        = 0x00008000,
	FR_HIDEWHOLEWORD        = 0x00010000,
	FR_RAW                  = 0x00020000,
	FR_MATCHDIAC            = 0x20000000,
	FR_MATCHKASHIDA         = 0x40000000,
	FR_MATCHALEFHAMZA       = 0x80000000,
}

export extern(Windows) HWND FindTextA(LPFINDREPLACEA);
export extern(Windows) HWND FindTextW(LPFINDREPLACEW);
version(UNICODE)
	alias FindTextW FindText;
else
	alias FindTextA FindText;

export extern(Windows) HWND ReplaceTextA(LPFINDREPLACEA);
export extern(Windows) HWND ReplaceTextW(LPFINDREPLACEW);
version(UNICODE)
	alias ReplaceTextW ReplaceText;
else
	alias ReplaceTextA ReplaceText;

alias extern(Windows) UINT_PTR function(HWND, UINT, WPARAM, LPARAM) LPCFHOOKPROC;

struct CHOOSEFONTT(T) {
	DWORD lStructSize;
	HWND hwndOwner;
	HDC hDC;
	static if(is(T == char))
		LPLOGFONTA lpLogFont;
	else
		LPLOGFONTW lpLogFont;
	INT iPointSize;
	DWORD Flags;
	COLORREF rgbColors;
	LPARAM lCustData;
	LPCFHOOKPROC lpfnHook;
	const(T)* lpTemplateName;
	HINSTANCE hInstance;
	T* lpszStyle;
	WORD nFontType;
	WORD ___MISSING_ALIGNMENT__;
	INT nSizeMin;
	INT nSizeMax;
}
version(Win32){
	align(1){
		alias CHOOSEFONTT!(char) CHOOSEFONTA;
		alias CHOOSEFONTT!(wchar) CHOOSEFONTW;
	}
}else{
	alias CHOOSEFONTT!(char) CHOOSEFONTA;
	alias CHOOSEFONTT!(wchar) CHOOSEFONTW;
}
alias CHOOSEFONTA* LPCHOOSEFONTA;
alias CHOOSEFONTW* LPCHOOSEFONTW;
version(UNICODE)
	alias LPCHOOSEFONTW LPCHOOSEFONT;
else
	alias LPCHOOSEFONTA LPCHOOSEFONT;

alias const(CHOOSEFONTA)* PCCHOOSEFONTA;
alias const(CHOOSEFONTW)* PCCHOOSEFONTW;
version(UNICODE){
	alias CHOOSEFONTW CHOOSEFONT;
	alias PCCHOOSEFONTW PCCHOOSEFONT;
}else{
	alias CHOOSEFONTA CHOOSEFONT;
	alias PCCHOOSEFONTA PCCHOOSEFONT;
}

export extern(Windows) BOOL ChooseFontA(LPCHOOSEFONTA);
export extern(Windows) BOOL ChooseFontW(LPCHOOSEFONTW);
version(UNICODE)
	alias ChooseFontW ChooseFont;
else
	alias ChooseFontA ChooseFont;

enum {
	CF_SCREENFONTS          = 0x00000001,
	CF_PRINTERFONTS         = 0x00000002,
	CF_BOTH                 = CF_SCREENFONTS | CF_PRINTERFONTS,
	CF_SHOWHELP             = 0x00000004,
	CF_ENABLEHOOK           = 0x00000008,
	CF_ENABLETEMPLATE       = 0x00000010,
	CF_ENABLETEMPLATEHANDLE = 0x00000020,
	CF_INITTOLOGFONTSTRUCT  = 0x00000040,
	CF_USESTYLE             = 0x00000080,
	CF_EFFECTS              = 0x00000100,
	CF_APPLY                = 0x00000200,
	CF_ANSIONLY             = 0x00000400,
	CF_SCRIPTSONLY          = CF_ANSIONLY,
	CF_NOVECTORFONTS        = 0x00000800,
	CF_NOOEMFONTS           = CF_NOVECTORFONTS,
	CF_NOSIMULATIONS        = 0x00001000,
	CF_LIMITSIZE            = 0x00002000,
	CF_FIXEDPITCHONLY       = 0x00004000,
	CF_WYSIWYG              = 0x00008000,
	CF_FORCEFONTEXIST       = 0x00010000,
	CF_SCALABLEONLY         = 0x00020000,
	CF_TTONLY               = 0x00040000,
	CF_NOFACESEL            = 0x00080000,
	CF_NOSTYLESEL           = 0x00100000,
	CF_NOSIZESEL            = 0x00200000,
	CF_SELECTSCRIPT         = 0x00400000,
	CF_NOSCRIPTSEL          = 0x00800000,
	CF_NOVERTFONTS          = 0x01000000,
	//(WINVER >= _WIN32_WINNT_WIN7)
		CF_INACTIVEFONTS = 0x02000000,
}
enum{
	SIMULATED_FONTTYPE   = 0x8000,
	PRINTER_FONTTYPE     = 0x4000,
	SCREEN_FONTTYPE      = 0x2000,
	BOLD_FONTTYPE        = 0x0100,
	ITALIC_FONTTYPE      = 0x0200,
	REGULAR_FONTTYPE     = 0x0400,
	PS_OPENTYPE_FONTTYPE = 0x10000,
	TT_OPENTYPE_FONTTYPE = 0x20000,
	TYPE1_FONTTYPE       = 0x40000,
	//(WINVER >= _WIN32_WINNT_WIN7)
		SYMBOL_FONTTYPE = 0x80000,
}

enum {
	WM_CHOOSEFONT_GETLOGFONT = WM_USER + 1,
	WM_CHOOSEFONT_SETLOGFONT = WM_USER + 101,
	WM_CHOOSEFONT_SETFLAGS   = WM_USER + 102,
}

const char* LBSELCHSTRINGA = "commdlg_LBSelChangedNotify";
const char* SHAREVISTRINGA = "commdlg_ShareViolation";
const char* FILEOKSTRINGA = "commdlg_FileNameOK";
const char* COLOROKSTRINGA = "commdlg_ColorOK";
const char* SETRGBSTRINGA = "commdlg_SetRGBColor";
const char* HELPMSGSTRINGA = "commdlg_help";
const char* FINDMSGSTRINGA = "commdlg_FindReplace";

const wchar* LBSELCHSTRINGW = "commdlg_LBSelChangedNotify";
const wchar* SHAREVISTRINGW = "commdlg_ShareViolation";
const wchar* FILEOKSTRINGW = "commdlg_FileNameOK";
const wchar* COLOROKSTRINGW = "commdlg_ColorOK";
const wchar* SETRGBSTRINGW = "commdlg_SetRGBColor";
const wchar* HELPMSGSTRINGW = "commdlg_help";
const wchar* FINDMSGSTRINGW = "commdlg_FindReplace";

version(UNICODE){
	alias LBSELCHSTRINGW LBSELCHSTRING;
	alias SHAREVISTRINGW SHAREVISTRING;
	alias FILEOKSTRINGW FILEOKSTRING;
	alias COLOROKSTRINGW COLOROKSTRING;
	alias SETRGBSTRINGW SETRGBSTRING;
	alias HELPMSGSTRINGW HELPMSGSTRING;
	alias FINDMSGSTRINGW FINDMSGSTRING;
}else{
	alias LBSELCHSTRINGA LBSELCHSTRING;
	alias SHAREVISTRINGA SHAREVISTRING;
	alias FILEOKSTRINGA FILEOKSTRING;
	alias COLOROKSTRINGA COLOROKSTRING;
	alias SETRGBSTRINGA SETRGBSTRING;
	alias HELPMSGSTRINGA HELPMSGSTRING;
	alias FINDMSGSTRINGA FINDMSGSTRING;
}
enum {
	CD_LBSELNOITEMS = -1,
	CD_LBSELCHANGE  = 0,
	CD_LBSELSUB     = 1,
	CD_LBSELADD     = 2,
}

alias extern(Windows) UINT_PTR function(HWND, UINT, WPARAM, LPARAM) LPPRINTHOOKPROC;
alias extern(Windows) UINT_PTR function(HWND, UINT, WPARAM, LPARAM) LPSETUPHOOKPROC;

struct PRINTDLGT(T) {
	DWORD lStructSize;
	HWND hwndOwner;
	HGLOBAL hDevMode;
	HGLOBAL hDevNames;
	HDC hDC;
	DWORD Flags;
	WORD nFromPage;
	WORD nToPage;
	WORD nMinPage;
	WORD nMaxPage;
	WORD nCopies;
	HINSTANCE hInstance;
	LPARAM lCustData;
	LPPRINTHOOKPROC lpfnPrintHook;
	LPSETUPHOOKPROC lpfnSetupHook;
	const(T)* lpPrintTemplateName;
	const(T)* lpSetupTemplateName;
	HGLOBAL hPrintTemplate;
	HGLOBAL hSetupTemplate;
}
version(Win32){
	align(1){
		alias PRINTDLGT!(char) PRINTDLGA;
		alias PRINTDLGT!(wchar) PRINTDLGW;
	}
}else{
	alias PRINTDLGT!(char) PRINTDLGA;
	alias PRINTDLGT!(wchar) PRINTDLGW;
}
alias PRINTDLGA* LPPRINTDLGA;
alias PRINTDLGW* LPPRINTDLGW;
version(UNICODE){
	alias PRINTDLGW PRINTDLG;
	alias LPPRINTDLGW LPPRINTDLG;
}else{
	alias PRINTDLGA PRINTDLG;
	alias LPPRINTDLGA LPPRINTDLG;
}

export extern(Windows) BOOL PrintDlgA(LPPRINTDLGA pPD);
export extern(Windows) BOOL PrintDlgW(LPPRINTDLGW pPD);
version(UNICODE)
	alias PrintDlgW PrintDlg;
else
	alias PrintDlgA PrintDlg;

interface IPrintDialogCallback : IUnknown {
public extern(Windows):
	HRESULT QueryInterface(REFIID riid, LPVOID* ppvObj);
	ULONG AddRef();
	ULONG Release();
	HRESULT InitDone();
	HRESULT SelectionChange();
	HRESULT HandleMessage(HWND hDlg, UINT uMsg, WPARAM wParam, LPARAM lParam, LRESULT* pResult);
}

interface IPrintDialogServices : IUnknown {
public extern(Windows):
	HRESULT QueryInterface(REFIID riid, LPVOID* ppvObj);
	ULONG AddRef();
	ULONG Release();
	HRESULT GetCurrentDevMode(LPDEVMODE pDevMode, UINT* pcbSize);
	HRESULT GetCurrentPrinterName(LPWSTR pPrinterName, UINT* pcchSize);
	HRESULT GetCurrentPortName(LPWSTR pPortName, UINT* pcchSize);
}

version(Win32){
	align(1)
	struct PRINTPAGERANGE {
		DWORD nFromPage;
		DWORD nToPage;
	}
}else{
	struct PRINTPAGERANGE {
		DWORD nFromPage;
		DWORD nToPage;
	}
}
alias PRINTPAGERANGE* LPPRINTPAGERANGE;
alias const(PRINTPAGERANGE)* PCPRINTPAGERANGE;

struct PRINTDLGEXT(T) {
	DWORD lStructSize;
	HWND hwndOwner;
	HGLOBAL hDevMode;
	HGLOBAL hDevNames;
	HDC hDC;
	DWORD Flags;
	DWORD Flags2;
	DWORD ExclusionFlags;
	DWORD nPageRanges;
	DWORD nMaxPageRanges;
	LPPRINTPAGERANGE lpPageRanges;
	DWORD nMinPage;
	DWORD nMaxPage;
	DWORD nCopies;
	HINSTANCE hInstance;
	const(char)* lpPrintTemplateName;
	LPUNKNOWN lpCallback;
	DWORD nPropertyPages;
	HPROPSHEETPAGE* lphPropertyPages;
	DWORD nStartPage;
	DWORD dwResultAction;
}
version(Win32){
	align(1){
		alias PRINTDLGEXT!(char) PRINTDLGEXA;
		alias PRINTDLGEXT!(wchar) PRINTDLGEXW;
	}
}else{
	alias PRINTDLGEXT!(char) PRINTDLGEXA;
	alias PRINTDLGEXT!(wchar) PRINTDLGEXW;
}
alias PRINTDLGEXA* LPPRINTDLGEXA;
alias PRINTDLGEXW* LPPRINTDLGEXW;
version(UNICODE){
	alias PRINTDLGEXW PRINTDLGEX;
	alias LPPRINTDLGEXW LPPRINTDLGEX;
}else{
	alias PRINTDLGEXA PRINTDLGEX;
	alias LPPRINTDLGEXA LPPRINTDLGEX;
}
export extern(Windows) HRESULT PrintDlgExA(LPPRINTDLGEXA pPD);
export extern(Windows) HRESULT PrintDlgExW(LPPRINTDLGEXW pPD);
version(UNICODE)
	alias PrintDlgExW PrintDlgEx;
else
	alias PrintDlgExA PrintDlgEx;

enum {
	PD_ALLPAGES                   = 0x00000000,
	PD_SELECTION                  = 0x00000001,
	PD_PAGENUMS                   = 0x00000002,
	PD_NOSELECTION                = 0x00000004,
	PD_NOPAGENUMS                 = 0x00000008,
	PD_COLLATE                    = 0x00000010,
	PD_PRINTTOFILE                = 0x00000020,
	PD_PRINTSETUP                 = 0x00000040,
	PD_NOWARNING                  = 0x00000080,
	PD_RETURNDC                   = 0x00000100,
	PD_RETURNIC                   = 0x00000200,
	PD_RETURNDEFAULT              = 0x00000400,
	PD_SHOWHELP                   = 0x00000800,
	PD_ENABLEPRINTHOOK            = 0x00001000,
	PD_ENABLESETUPHOOK            = 0x00002000,
	PD_ENABLEPRINTTEMPLATE        = 0x00004000,
	PD_ENABLESETUPTEMPLATE        = 0x00008000,
	PD_ENABLEPRINTTEMPLATEHANDLE  = 0x00010000,
	PD_ENABLESETUPTEMPLATEHANDLE  = 0x00020000,
	PD_USEDEVMODECOPIES           = 0x00040000,
	PD_USEDEVMODECOPIESANDCOLLATE = 0x00040000,
	PD_DISABLEPRINTTOFILE         = 0x00080000,
	PD_HIDEPRINTTOFILE            = 0x00100000,
	PD_NONETWORKBUTTON            = 0x00200000,
	PD_CURRENTPAGE                = 0x00400000,
	PD_NOCURRENTPAGE              = 0x00800000,
	PD_EXCLUSIONFLAGS             = 0x01000000,
	PD_USELARGETEMPLATE           = 0x10000000,
	PD_EXCL_COPIESANDCOLLATE      = DM_COPIES | DM_COLLATE,
	START_PAGE_GENERAL            = 0xffffffff,
	PD_RESULT_CANCEL              = 0,
	PD_RESULT_PRINT               = 1,
	PD_RESULT_APPLY               = 2,
}

version(Win32){
	align(1)
	struct DEVNAMES {
		WORD wDriverOffset;
		WORD wDeviceOffset;
		WORD wOutputOffset;
		WORD wDefault;
	}
}else{
	struct DEVNAMES {
		WORD wDriverOffset;
		WORD wDeviceOffset;
		WORD wOutputOffset;
		WORD wDefault;
	}
}
alias DEVNAMES* LPDEVNAMES;
alias const(DEVNAMES)* PCDEVNAMES;

enum DN_DEFAULTPRN = 0x0001;

export extern(Windows) DWORD CommDlgExtendedError();

enum {
	WM_PSD_PAGESETUPDLG   = WM_USER ,
	WM_PSD_FULLPAGERECT   = WM_USER+1,
	WM_PSD_MINMARGINRECT  = WM_USER+2,
	WM_PSD_MARGINRECT     = WM_USER+3,
	WM_PSD_GREEKTEXTRECT  = WM_USER+4,
	WM_PSD_ENVSTAMPRECT   = WM_USER+5,
	WM_PSD_YAFULLPAGERECT = WM_USER+6,
}

alias extern(Windows) UINT_PTR function(HWND, UINT, WPARAM, LPARAM) LPPAGEPAINTHOOK;
alias extern(Windows) UINT_PTR function(HWND, UINT, WPARAM, LPARAM) LPPAGESETUPHOOK;

struct PAGESETUPDLGT(T) {
	DWORD lStructSize;
	HWND hwndOwner;
	HGLOBAL hDevMode;
	HGLOBAL hDevNames;
	DWORD Flags;
	POINT ptPaperSize;
	RECT rtMinMargin;
	RECT rtMargin;
	HINSTANCE hInstance;
	LPARAM lCustData;
	LPPAGESETUPHOOK lpfnPageSetupHook;
	LPPAGEPAINTHOOK lpfnPagePaintHook;
	const(char)* lpPageSetupTemplateName;
	HGLOBAL hPageSetupTemplate;
}
version(Win32){
	align(1){
		alias PAGESETUPDLGT!(char) PAGESETUPDLGA;
		alias PAGESETUPDLGT!(wchar) PAGESETUPDLGW;
	}
}else{
	alias PAGESETUPDLGT!(char) PAGESETUPDLGA;
	alias PAGESETUPDLGT!(wchar) PAGESETUPDLGW;
}
alias PAGESETUPDLGA* LPPAGESETUPDLGA;
alias PAGESETUPDLGW* LPPAGESETUPDLGW;
version(UNICODE){
	alias PAGESETUPDLGW PAGESETUPDLG;
	alias LPPAGESETUPDLGW LPPAGESETUPDLG;
}else{
	alias PAGESETUPDLGA PAGESETUPDLG;
	alias LPPAGESETUPDLGA LPPAGESETUPDLG;
}

export extern(Windows) BOOL PageSetupDlgA(LPPAGESETUPDLGA);
export extern(Windows) BOOL PageSetupDlgW(LPPAGESETUPDLGW);
version(UNICODE)
	alias PageSetupDlgW PageSetupDlg;
else
	alias PageSetupDlgA PageSetupDlg;

enum{ 
	PSD_DEFAULTMINMARGINS             = 0x00000000,
	PSD_INWININIINTLMEASURE           = 0x00000000,
	PSD_MINMARGINS                    = 0x00000001,
	PSD_MARGINS                       = 0x00000002,
	PSD_INTHOUSANDTHSOFINCHES         = 0x00000004,
	PSD_INHUNDREDTHSOFMILLIMETERS     = 0x00000008,
	PSD_DISABLEMARGINS                = 0x00000010,
	PSD_DISABLEPRINTER                = 0x00000020,
	PSD_NOWARNING                     = 0x00000080,
	PSD_DISABLEORIENTATION            = 0x00000100,
	PSD_RETURNDEFAULT                 = 0x00000400,
	PSD_DISABLEPAPER                  = 0x00000200,
	PSD_SHOWHELP                      = 0x00000800,
	PSD_ENABLEPAGESETUPHOOK           = 0x00002000,
	PSD_ENABLEPAGESETUPTEMPLATE       = 0x00008000,
	PSD_ENABLEPAGESETUPTEMPLATEHANDLE = 0x00020000,
	PSD_ENABLEPAGEPAINTHOOK           = 0x00040000,
	PSD_DISABLEPAGEPAINTING           = 0x00080000,
	PSD_NONETWORKBUTTON               = 0x00200000,
}

} // extern(C)
