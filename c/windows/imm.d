/** imm.d

Converted from 'imm.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.imm;


import c.windows.windef;
import c.windows.ime_cmodes;
import c.windows.wingdi;
import c.windows.winuser;


extern(C){


enum HIMC : HANDLE {init = (HANDLE).init}
enum HIMCC : HANDLE {init = (HANDLE).init}

//alias HKL* LPHKL; move to windef
//alias UINT* LPUINT; move to windef

struct COMPOSITIONFORM {
	DWORD dwStyle;
	POINT ptCurrentPos;
	RECT rcArea;
}
alias COMPOSITIONFORM* PCOMPOSITIONFORM;
alias COMPOSITIONFORM* NPCOMPOSITIONFORM;
alias COMPOSITIONFORM* LPCOMPOSITIONFORM;

struct CANDIDATEFORM {
	DWORD dwIndex;
	DWORD dwStyle;
	POINT ptCurrentPos;
	RECT rcArea;
}
alias CANDIDATEFORM* PCANDIDATEFORM;
alias CANDIDATEFORM* NPCANDIDATEFORM;
alias CANDIDATEFORM* LPCANDIDATEFORM;

struct CANDIDATELIST {
	DWORD dwSize;
	DWORD dwStyle;
	DWORD dwCount;
	DWORD dwSelection;
	DWORD dwPageStart;
	DWORD dwPageSize;
	DWORD[1] dwOffset;
}
alias CANDIDATELIST* PCANDIDATELIST;
alias CANDIDATELIST* NPCANDIDATELIST;
alias CANDIDATELIST* LPCANDIDATELIST;

struct REGISTERWORDA {
	LPSTR lpReading;
	LPSTR lpWord;
}
alias REGISTERWORDA* PREGISTERWORDA;
alias REGISTERWORDA* NPREGISTERWORDA;
alias REGISTERWORDA* LPREGISTERWORDA;

struct REGISTERWORDW {
	LPWSTR lpReading;
	LPWSTR lpWord;
}
alias REGISTERWORDW* PREGISTERWORDW;
alias REGISTERWORDW* NPREGISTERWORDW;
alias REGISTERWORDW* LPREGISTERWORDW;

version(UNICODE){
	alias REGISTERWORDW REGISTERWORD;
	alias PREGISTERWORDW PREGISTERWORD;
	alias NPREGISTERWORDW NPREGISTERWORD;
	alias LPREGISTERWORDW LPREGISTERWORD;
}else{
	alias REGISTERWORDA REGISTERWORD;
	alias PREGISTERWORDA PREGISTERWORD;
	alias NPREGISTERWORDA NPREGISTERWORD;
	alias LPREGISTERWORDA LPREGISTERWORD;
}

struct RECONVERTSTRING {
	DWORD dwSize;
	DWORD dwVersion;
	DWORD dwStrLen;
	DWORD dwStrOffset;
	DWORD dwCompStrLen;
	DWORD dwCompStrOffset;
	DWORD dwTargetStrLen;
	DWORD dwTargetStrOffset;
}
alias RECONVERTSTRING* PRECONVERTSTRING;
alias RECONVERTSTRING* NPRECONVERTSTRING;
alias RECONVERTSTRING* LPRECONVERTSTRING;


enum STYLE_DESCRIPTION_SIZE = 32;

struct STYLEBUFA {
	DWORD dwStyle;
	CHAR[STYLE_DESCRIPTION_SIZE] szDescription;
}
alias STYLEBUFA* PSTYLEBUFA;
alias STYLEBUFA* NPSTYLEBUFA;
alias STYLEBUFA* LPSTYLEBUFA;

struct STYLEBUFW {
	DWORD dwStyle;
	WCHAR[STYLE_DESCRIPTION_SIZE] szDescription;
}
alias STYLEBUFW* PSTYLEBUFW;
alias STYLEBUFW* NPSTYLEBUFW;
alias STYLEBUFW* LPSTYLEBUFW;

version(UNICODE){
	alias STYLEBUFW STYLEBUF;
	alias PSTYLEBUFW PSTYLEBUF;
	alias NPSTYLEBUFW NPSTYLEBUF;
	alias LPSTYLEBUFW LPSTYLEBUF;
}else{
	alias STYLEBUFA STYLEBUF;
	alias PSTYLEBUFA PSTYLEBUF;
	alias NPSTYLEBUFA NPSTYLEBUF;
	alias LPSTYLEBUFA LPSTYLEBUF;
}

enum IMEMENUITEM_STRING_SIZE = 80;

struct IMEMENUITEMINFOA {
	UINT cbSize;
	UINT fType;
	UINT fState;
	UINT wID;
	HBITMAP hbmpChecked;
	HBITMAP hbmpUnchecked;
	DWORD dwItemData;
	CHAR[IMEMENUITEM_STRING_SIZE] szString;
	HBITMAP hbmpItem;
}
alias IMEMENUITEMINFOA* PIMEMENUITEMINFOA;
alias IMEMENUITEMINFOA* NPIMEMENUITEMINFOA;
alias IMEMENUITEMINFOA* LPIMEMENUITEMINFOA;

struct IMEMENUITEMINFOW {
	UINT cbSize;
	UINT fType;
	UINT fState;
	UINT wID;
	HBITMAP hbmpChecked;
	HBITMAP hbmpUnchecked;
	DWORD dwItemData;
	WCHAR[IMEMENUITEM_STRING_SIZE] szString;
	HBITMAP hbmpItem;
}
alias IMEMENUITEMINFOW* PIMEMENUITEMINFOW;
alias IMEMENUITEMINFOW* NPIMEMENUITEMINFOW;
alias IMEMENUITEMINFOW* LPIMEMENUITEMINFOW;

version(UNICODE){
	alias IMEMENUITEMINFOW IMEMENUITEMINFO;
	alias PIMEMENUITEMINFOW PIMEMENUITEMINFO;
	alias NPIMEMENUITEMINFOW NPIMEMENUITEMINFO;
	alias LPIMEMENUITEMINFOW LPIMEMENUITEMINFO;
}else{
	alias IMEMENUITEMINFOA IMEMENUITEMINFO;
	alias PIMEMENUITEMINFOA PIMEMENUITEMINFO;
	alias NPIMEMENUITEMINFOA NPIMEMENUITEMINFO;
	alias LPIMEMENUITEMINFOA LPIMEMENUITEMINFO;
}

struct IMECHARPOSITION {
	DWORD dwSize;
	DWORD dwCharPos;
	POINT pt;
	UINT cLineHeight;
	RECT rcDocument;
}
alias IMECHARPOSITION* PIMECHARPOSITION;
alias IMECHARPOSITION* NPIMECHARPOSITION;
alias IMECHARPOSITION* LPIMECHARPOSITION;

alias extern(Windows) BOOL function(HIMC, LPARAM) IMCENUMPROC;

export extern(Windows) HKL ImmInstallIMEA(LPCSTR lpszIMEFileName, LPCSTR lpszLayoutText);
export extern(Windows) HKL ImmInstallIMEW(LPCWSTR lpszIMEFileName, LPCWSTR lpszLayoutText);
version(UNICODE)
	alias ImmInstallIMEW ImmInstallIME;
else
	alias ImmInstallIMEA ImmInstallIME;

export extern(Windows) HWND ImmGetDefaultIMEWnd(HWND);

export extern(Windows) UINT ImmGetDescriptionA(HKL, LPSTR lpszDescription, UINT uBufLen);
export extern(Windows) UINT ImmGetDescriptionW(HKL, LPWSTR lpszDescription, UINT uBufLen);
version(UNICODE)
	alias ImmGetDescriptionW ImmGetDescription;
else
	alias ImmGetDescriptionA ImmGetDescription;

export extern(Windows) UINT ImmGetIMEFileNameA(HKL, LPSTR lpszFileName, UINT uBufLen);
export extern(Windows) UINT ImmGetIMEFileNameW(HKL, LPWSTR lpszFileName, UINT uBufLen);
version(UNICODE)
	alias ImmGetIMEFileNameW ImmGetIMEFileName;
else
	alias ImmGetIMEFileNameA ImmGetIMEFileName;

export extern(Windows) DWORD ImmGetProperty(HKL, DWORD);

export extern(Windows) BOOL ImmIsIME(HKL);

export extern(Windows) BOOL ImmSimulateHotKey(HWND, DWORD);

export extern(Windows) HIMC ImmCreateContext();
export extern(Windows) BOOL ImmDestroyContext(HIMC);
export extern(Windows) HIMC ImmGetContext(HWND);
export extern(Windows) BOOL ImmReleaseContext(HWND, HIMC);
export extern(Windows) HIMC ImmAssociateContext(HWND, HIMC);
export extern(Windows) BOOL ImmAssociateContextEx(HWND, HIMC, DWORD);

export extern(Windows) LONG ImmGetCompositionStringA(HIMC, DWORD, LPVOID lpBuf, DWORD dwBufLen);
export extern(Windows) LONG ImmGetCompositionStringW(HIMC, DWORD, LPVOID lpBuf, DWORD dwBufLen);
version(UNICODE)
	alias ImmGetCompositionStringW ImmGetCompositionString;
else
	alias ImmGetCompositionStringA ImmGetCompositionString;

export extern(Windows) BOOL ImmSetCompositionStringA(HIMC, DWORD dwIndex, LPVOID lpComp, DWORD dwCompLen, LPVOID lpRead, DWORD dwReadLen);
export extern(Windows) BOOL ImmSetCompositionStringW(HIMC, DWORD dwIndex, LPVOID lpComp, DWORD dwCompLen, LPVOID lpRead, DWORD dwReadLen);
version(UNICODE)
	alias ImmSetCompositionStringW ImmSetCompositionString;
else
	alias ImmSetCompositionStringA ImmSetCompositionString;

export extern(Windows) DWORD ImmGetCandidateListCountA(HIMC, LPDWORD lpdwListCount);
export extern(Windows) DWORD ImmGetCandidateListCountW(HIMC, LPDWORD lpdwListCount);
version(UNICODE)
	alias ImmGetCandidateListCountW ImmGetCandidateListCount;
else
	alias ImmGetCandidateListCountA ImmGetCandidateListCount;

export extern(Windows) DWORD ImmGetCandidateListA(HIMC, DWORD deIndex, LPCANDIDATELIST lpCandList, DWORD dwBufLen);
export extern(Windows) DWORD ImmGetCandidateListW(HIMC, DWORD deIndex, LPCANDIDATELIST lpCandList, DWORD dwBufLen);
version(UNICODE)
	alias ImmGetCandidateListW ImmGetCandidateList;
else
	alias ImmGetCandidateListA ImmGetCandidateList;

export extern(Windows) DWORD ImmGetGuideLineA(HIMC, DWORD dwIndex, LPSTR lpBuf, DWORD dwBufLen);
export extern(Windows) DWORD ImmGetGuideLineW(HIMC, DWORD dwIndex, LPWSTR lpBuf, DWORD dwBufLen);
version(UNICODE)
	alias ImmGetGuideLineW ImmGetGuideLine;
else
	alias ImmGetGuideLineA ImmGetGuideLine;

export extern(Windows) BOOL ImmGetConversionStatus(HIMC, LPDWORD lpfdwConversion, LPDWORD lpfdwSentence);
export extern(Windows) BOOL ImmSetConversionStatus(HIMC, DWORD, DWORD);
export extern(Windows) BOOL ImmGetOpenStatus(HIMC);
export extern(Windows) BOOL ImmSetOpenStatus(HIMC, BOOL);

export extern(Windows) BOOL ImmGetCompositionFontA(HIMC, LPLOGFONTA lplf);
export extern(Windows) BOOL ImmGetCompositionFontW(HIMC, LPLOGFONTW lplf);
version(UNICODE)
	alias ImmGetCompositionFontW ImmGetCompositionFont;
else
	alias ImmGetCompositionFontA ImmGetCompositionFont;

export extern(Windows) BOOL ImmSetCompositionFontA(HIMC, LPLOGFONTA lplf);
export extern(Windows) BOOL ImmSetCompositionFontW(HIMC, LPLOGFONTW lplf);
version(UNICODE)
	alias ImmSetCompositionFontW ImmSetCompositionFont;
else
	alias ImmSetCompositionFontA ImmSetCompositionFont;

export extern(Windows) BOOL ImmConfigureIMEA(HKL, HWND, DWORD, LPVOID);
export extern(Windows) BOOL ImmConfigureIMEW(HKL, HWND, DWORD, LPVOID);
version(UNICODE)
	alias ImmConfigureIMEW ImmConfigureIME;
else
	alias ImmConfigureIMEA ImmConfigureIME;

export extern(Windows) LRESULT ImmEscapeA(HKL, HIMC, UINT, LPVOID);
export extern(Windows) LRESULT ImmEscapeW(HKL, HIMC, UINT, LPVOID);
version(UNICODE)
	alias ImmEscapeW ImmEscape;
else
	alias ImmEscapeA ImmEscape;

export extern(Windows) DWORD ImmGetConversionListA(HKL, HIMC, LPCSTR lpSrc, LPCANDIDATELIST lpDst, DWORD dwBufLen, UINT uFlag);
export extern(Windows) DWORD ImmGetConversionListW(HKL, HIMC, LPCWSTR lpSrc, LPCANDIDATELIST lpDst, DWORD dwBufLen, UINT uFlag);
version(UNICODE)
	alias ImmGetConversionListW ImmGetConversionList;
else
	alias ImmGetConversionListA ImmGetConversionList;

export extern(Windows) BOOL ImmNotifyIME(HIMC, DWORD dwAction, DWORD dwIndex, DWORD dwValue);

export extern(Windows) BOOL ImmGetStatusWindowPos(HIMC, LPPOINT lpptPos);
export extern(Windows) BOOL ImmSetStatusWindowPos(HIMC, LPPOINT lpptPos);
export extern(Windows) BOOL ImmGetCompositionWindow(HIMC, LPCOMPOSITIONFORM lpCompForm);
export extern(Windows) BOOL ImmSetCompositionWindow(HIMC, LPCOMPOSITIONFORM lpCompForm);
export extern(Windows) BOOL ImmGetCandidateWindow(HIMC, DWORD, LPCANDIDATEFORM lpCandidate);
export extern(Windows) BOOL ImmSetCandidateWindow(HIMC, LPCANDIDATEFORM lpCandidate);

export extern(Windows) BOOL ImmIsUIMessageA(HWND, UINT, WPARAM, LPARAM);
export extern(Windows) BOOL ImmIsUIMessageW(HWND, UINT, WPARAM, LPARAM);
version(UNICODE)
	alias ImmIsUIMessageW ImmIsUIMessage;
else
	alias ImmIsUIMessageA ImmIsUIMessage;

export extern(Windows) UINT ImmGetVirtualKey(HWND);

alias extern(Windows) int function(LPCSTR lpszReading, DWORD, LPCSTR lpszString, LPVOID) REGISTERWORDENUMPROCA;
alias extern(Windows) int function(LPCWSTR lpszReading, DWORD, LPCWSTR lpszString, LPVOID) REGISTERWORDENUMPROCW;
version(UNICODE)
	alias REGISTERWORDENUMPROCW REGISTERWORDENUMPROC;
else
	alias REGISTERWORDENUMPROCA REGISTERWORDENUMPROC;

export extern(Windows) BOOL ImmRegisterWordA(HKL, LPCSTR lpszReading, DWORD, LPCSTR lpszRegister);
export extern(Windows) BOOL ImmRegisterWordW(HKL, LPCWSTR lpszReading, DWORD, LPCWSTR lpszRegister);
version(UNICODE)
	alias ImmRegisterWordW ImmRegisterWord;
else
	alias ImmRegisterWordA ImmRegisterWord;

export extern(Windows) BOOL ImmUnregisterWordA(HKL, LPCSTR lpszReading, DWORD, LPCSTR lpszUnregister);
export extern(Windows) BOOL ImmUnregisterWordW(HKL, LPCWSTR lpszReading, DWORD, LPCWSTR lpszUnregister);
version(UNICODE)
	alias ImmUnregisterWordW ImmUnregisterWord;
else
	alias ImmUnregisterWordA ImmUnregisterWord;

export extern(Windows) UINT ImmGetRegisterWordStyleA(HKL, UINT nItem,LPSTYLEBUFA lpStyleBuf);
export extern(Windows) UINT ImmGetRegisterWordStyleW(HKL, UINT nItem,LPSTYLEBUFW lpStyleBuf);
version(UNICODE)
	alias ImmGetRegisterWordStyleW ImmGetRegisterWordStyle;
else
	alias ImmGetRegisterWordStyleA ImmGetRegisterWordStyle;

export extern(Windows) UINT ImmEnumRegisterWordA(HKL, REGISTERWORDENUMPROCA, LPCSTR lpszReading, DWORD, LPCSTR lpszRegister, LPVOID);
export extern(Windows) UINT ImmEnumRegisterWordW(HKL, REGISTERWORDENUMPROCW, LPCWSTR lpszReading, DWORD, LPCWSTR lpszRegister, LPVOID);
version(UNICODE)
	alias ImmEnumRegisterWordW ImmEnumRegisterWord;
else
	alias ImmEnumRegisterWordA ImmEnumRegisterWord;

export extern(Windows) BOOL ImmDisableIME(DWORD);
export extern(Windows) BOOL ImmEnumInputContext(DWORD idThread, IMCENUMPROC lpfn, LPARAM lParam);
export extern(Windows) DWORD ImmGetImeMenuItemsA(HIMC, DWORD, DWORD, LPIMEMENUITEMINFOA lpImeParentMenu, LPIMEMENUITEMINFOA lpImeMenu, DWORD dwSize);
export extern(Windows) DWORD ImmGetImeMenuItemsW(HIMC, DWORD, DWORD, LPIMEMENUITEMINFOW lpImeParentMenu, LPIMEMENUITEMINFOW lpImeMenu, DWORD dwSize);
version(UNICODE)
	alias ImmGetImeMenuItemsW ImmGetImeMenuItems;
else
	alias ImmGetImeMenuItemsA ImmGetImeMenuItems;

export extern(Windows) BOOL ImmDisableTextFrameService(DWORD idThread);

enum {
	IMC_GETCANDIDATEPOS      = 0x0007,
	IMC_SETCANDIDATEPOS      = 0x0008,
	IMC_GETCOMPOSITIONFONT   = 0x0009,
	IMC_SETCOMPOSITIONFONT   = 0x000A,
	IMC_GETCOMPOSITIONWINDOW = 0x000B,
	IMC_SETCOMPOSITIONWINDOW = 0x000C,
	IMC_GETSTATUSWINDOWPOS   = 0x000F,
	IMC_SETSTATUSWINDOWPOS   = 0x0010,
	IMC_CLOSESTATUSWINDOW    = 0x0021,
	IMC_OPENSTATUSWINDOW     = 0x0022,
}

enum {
	NI_OPENCANDIDATE            = 0x0010,
	NI_CLOSECANDIDATE           = 0x0011,
	NI_SELECTCANDIDATESTR       = 0x0012,
	NI_CHANGECANDIDATELIST      = 0x0013,
	NI_FINALIZECONVERSIONRESULT = 0x0014,
	NI_COMPOSITIONSTR           = 0x0015,
	NI_SETCANDIDATE_PAGESTART   = 0x0016,
	NI_SETCANDIDATE_PAGESIZE    = 0x0017,
	NI_IMEMENUSELECTED          = 0x0018,
}

enum {
	ISC_SHOWUICANDIDATEWINDOW    = 0x00000001,
	ISC_SHOWUICOMPOSITIONWINDOW  = 0x80000000,
	ISC_SHOWUIGUIDELINE          = 0x40000000,
	ISC_SHOWUIALLCANDIDATEWINDOW = 0x0000000F,
	ISC_SHOWUIALL                = 0xC000000F,
}

enum {
	CPS_COMPLETE = 0x0001,
	CPS_CONVERT  = 0x0002,
	CPS_REVERT   = 0x0003,
	CPS_CANCEL   = 0x0004,
}

enum {
	MOD_ALT                 = 0x0001,
	MOD_CONTROL             = 0x0002,
	MOD_SHIFT               = 0x0004,
	MOD_LEFT                = 0x8000,
	MOD_RIGHT               = 0x4000,
	MOD_ON_KEYUP            = 0x0800,
	MOD_IGNORE_ALL_MODIFIER = 0x0400,
}

enum {
	IME_CHOTKEY_IME_NONIME_TOGGLE     = 0x10,
	IME_CHOTKEY_SHAPE_TOGGLE          = 0x11,
	IME_CHOTKEY_SYMBOL_TOGGLE         = 0x12,
	IME_JHOTKEY_CLOSE_OPEN            = 0x30,
	IME_KHOTKEY_SHAPE_TOGGLE          = 0x50,
	IME_KHOTKEY_HANJACONVERT          = 0x51,
	IME_KHOTKEY_ENGLISH               = 0x52,
	IME_THOTKEY_IME_NONIME_TOGGLE     = 0x70,
	IME_THOTKEY_SHAPE_TOGGLE          = 0x71,
	IME_THOTKEY_SYMBOL_TOGGLE         = 0x72,
	IME_HOTKEY_DSWITCH_FIRST          = 0x100,
	IME_HOTKEY_DSWITCH_LAST           = 0x11F,
	IME_HOTKEY_PRIVATE_FIRST          = 0x200,
	IME_ITHOTKEY_RESEND_RESULTSTR     = 0x200,
	IME_ITHOTKEY_PREVIOUS_COMPOSITION = 0x201,
	IME_ITHOTKEY_UISTYLE_TOGGLE       = 0x202,
	IME_ITHOTKEY_RECONVERTSTRING      = 0x203,
	IME_HOTKEY_PRIVATE_LAST           = 0x21F,
}

enum {
	GCS_COMPREADSTR      = 0x0001,
	GCS_COMPREADATTR     = 0x0002,
	GCS_COMPREADCLAUSE   = 0x0004,
	GCS_COMPSTR          = 0x0008,
	GCS_COMPATTR         = 0x0010,
	GCS_COMPCLAUSE       = 0x0020,
	GCS_CURSORPOS        = 0x0080,
	GCS_DELTASTART       = 0x0100,
	GCS_RESULTREADSTR    = 0x0200,
	GCS_RESULTREADCLAUSE = 0x0400,
	GCS_RESULTSTR        = 0x0800,
	GCS_RESULTCLAUSE     = 0x1000,
}

enum {
	CS_INSERTCHAR  = 0x2000,
	CS_NOMOVECARET = 0x4000,
}

enum {
	IMEVER_0310 = 0x0003000A,
	IMEVER_0400 = 0x00040000,
}

enum {
	IME_PROP_AT_CARET              = 0x00010000,
	IME_PROP_SPECIAL_UI            = 0x00020000,
	IME_PROP_CANDLIST_START_FROM_1 = 0x00040000,
	IME_PROP_UNICODE               = 0x00080000,
	IME_PROP_COMPLETE_ON_UNSELECT  = 0x00100000,
}

enum {
	UI_CAP_2700   = 0x00000001,
	UI_CAP_ROT90  = 0x00000002,
	UI_CAP_ROTANY = 0x00000004,
}

enum {
	SCS_CAP_COMPSTR            = 0x00000001,
	SCS_CAP_MAKEREAD           = 0x00000002,
	SCS_CAP_SETRECONVERTSTRING = 0x00000004,
}

enum {
	SELECT_CAP_CONVERSION = 0x00000001,
	SELECT_CAP_SENTENCE   = 0x00000002,
}

enum {
	GGL_LEVEL   = 0x00000001,
	GGL_INDEX   = 0x00000002,
	GGL_STRING  = 0x00000003,
	GGL_PRIVATE = 0x00000004,
}

enum {
	GL_LEVEL_NOGUIDELINE = 0x00000000,
	GL_LEVEL_FATAL       = 0x00000001,
	GL_LEVEL_ERROR       = 0x00000002,
	GL_LEVEL_WARNING     = 0x00000003,
	GL_LEVEL_INFORMATION = 0x00000004,
}

enum {
	GL_ID_UNKNOWN           = 0x00000000,
	GL_ID_NOMODULE          = 0x00000001,
	GL_ID_NODICTIONARY      = 0x00000010,
	GL_ID_CANNOTSAVE        = 0x00000011,
	GL_ID_NOCONVERT         = 0x00000020,
	GL_ID_TYPINGERROR       = 0x00000021,
	GL_ID_TOOMANYSTROKE     = 0x00000022,
	GL_ID_READINGCONFLICT   = 0x00000023,
	GL_ID_INPUTREADING      = 0x00000024,
	GL_ID_INPUTRADICAL      = 0x00000025,
	GL_ID_INPUTCODE         = 0x00000026,
	GL_ID_INPUTSYMBOL       = 0x00000027,
	GL_ID_CHOOSECANDIDATE   = 0x00000028,
	GL_ID_REVERSECONVERSION = 0x00000029,
	GL_ID_PRIVATE_FIRST     = 0x00008000,
	GL_ID_PRIVATE_LAST      = 0x0000FFFF,
}

enum {
	IGP_GETIMEVERSION = cast(DWORD)-4,
	IGP_PROPERTY      = 0x00000004,
	IGP_CONVERSION    = 0x00000008,
	IGP_SENTENCE      = 0x0000000c,
	IGP_UI            = 0x00000010,
	IGP_SETCOMPSTR    = 0x00000014,
	IGP_SELECT        = 0x00000018,
}

enum {
	SCS_SETSTR               = GCS_COMPREADSTR | GCS_COMPSTR,
	SCS_CHANGEATTR           = GCS_COMPREADATTR | GCS_COMPATTR,
	SCS_CHANGECLAUSE         = GCS_COMPREADCLAUSE | GCS_COMPCLAUSE,
	SCS_SETRECONVERTSTRING   = 0x00010000,
	SCS_QUERYRECONVERTSTRING = 0x00020000,
}

enum {
	ATTR_INPUT               = 0x00,
	ATTR_TARGET_CONVERTED    = 0x01,
	ATTR_CONVERTED           = 0x02,
	ATTR_TARGET_NOTCONVERTED = 0x03,
	ATTR_INPUT_ERROR         = 0x04,
	ATTR_FIXEDCONVERTED      = 0x05,
}

enum {
	CFS_DEFAULT        = 0x0000,
	CFS_RECT           = 0x0001,
	CFS_POINT          = 0x0002,
	CFS_FORCE_POSITION = 0x0020,
	CFS_CANDIDATEPOS   = 0x0040,
	CFS_EXCLUDE        = 0x0080,
}

enum {
	GCL_CONVERSION        = 0x0001,
	GCL_REVERSECONVERSION = 0x0002,
	GCL_REVERSE_LENGTH    = 0x0003,
}

enum {
	IME_CMODE_HANGEUL       = IME_CMODE_NATIVE,
	IME_CMODE_SOFTKBD       = 0x0080,
	IME_CMODE_NOCONVERSION  = 0x0100,
	IME_CMODE_EUDC          = 0x0200,
	IME_CMODE_SYMBOL        = 0x0400,
	IME_CMODE_FIXED         = 0x0800,
	IME_CMODE_RESERVED      = 0xF0000000,
	IME_SMODE_NONE          = 0x0000,
	IME_SMODE_PLAURALCLAUSE = 0x0001,
	IME_SMODE_SINGLECONVERT = 0x0002,
	IME_SMODE_AUTOMATIC     = 0x0004,
	IME_SMODE_PHRASEPREDICT = 0x0008,
	IME_SMODE_CONVERSATION  = 0x0010,
	IME_SMODE_RESERVED      = 0x0000F000,
	IME_CAND_UNKNOWN        = 0x0000,
	IME_CAND_READ           = 0x0001,
	IME_CAND_CODE           = 0x0002,
	IME_CAND_MEANING        = 0x0003,
	IME_CAND_RADICAL        = 0x0004,
	IME_CAND_STROKE         = 0x0005,
}

enum {
	IMN_CLOSESTATUSWINDOW    = 0x0001,
	IMN_OPENSTATUSWINDOW     = 0x0002,
	IMN_CHANGECANDIDATE      = 0x0003,
	IMN_CLOSECANDIDATE       = 0x0004,
	IMN_OPENCANDIDATE        = 0x0005,
	IMN_SETCONVERSIONMODE    = 0x0006,
	IMN_SETSENTENCEMODE      = 0x0007,
	IMN_SETOPENSTATUS        = 0x0008,
	IMN_SETCANDIDATEPOS      = 0x0009,
	IMN_SETCOMPOSITIONFONT   = 0x000A,
	IMN_SETCOMPOSITIONWINDOW = 0x000B,
	IMN_SETSTATUSWINDOWPOS   = 0x000C,
	IMN_GUIDELINE            = 0x000D,
	IMN_PRIVATE              = 0x000E,
}

enum {
	IMR_COMPOSITIONWINDOW      = 0x0001,
	IMR_CANDIDATEWINDOW        = 0x0002,
	IMR_COMPOSITIONFONT        = 0x0003,
	IMR_RECONVERTSTRING        = 0x0004,
	IMR_CONFIRMRECONVERTSTRING = 0x0005,
	IMR_QUERYCHARPOSITION      = 0x0006,
	IMR_DOCUMENTFEED           = 0x0007,
}

enum {
	IMM_ERROR_NODATA  = -1,
	IMM_ERROR_GENERAL = -2,
}

enum {
	IME_CONFIG_GENERAL          = 1,
	IME_CONFIG_REGISTERWORD     = 2,
	IME_CONFIG_SELECTDICTIONARY = 3,
}

enum {
	IME_ESC_QUERY_SUPPORT        = 0x0003,
	IME_ESC_RESERVED_FIRST       = 0x0004,
	IME_ESC_RESERVED_LAST        = 0x07FF,
	IME_ESC_PRIVATE_FIRST        = 0x0800,
	IME_ESC_PRIVATE_LAST         = 0x0FFF,
	IME_ESC_SEQUENCE_TO_INTERNAL = 0x1001,
	IME_ESC_GET_EUDC_DICTIONARY  = 0x1003,
	IME_ESC_SET_EUDC_DICTIONARY  = 0x1004,
	IME_ESC_MAX_KEY              = 0x1005,
	IME_ESC_IME_NAME             = 0x1006,
	IME_ESC_SYNC_HOTKEY          = 0x1007,
	IME_ESC_HANJA_MODE           = 0x1008,
	IME_ESC_AUTOMATA             = 0x1009,
	IME_ESC_PRIVATE_HOTKEY       = 0x100a,
	IME_ESC_GETHELPFILENAME      = 0x100b,
}

enum {
	IME_REGWORD_STYLE_EUDC       = 0x00000001,
	IME_REGWORD_STYLE_USER_FIRST = 0x80000000,
	IME_REGWORD_STYLE_USER_LAST  = 0xFFFFFFFF,
}

enum {
	IACE_CHILDREN        = 0x0001,
	IACE_DEFAULT         = 0x0010,
	IACE_IGNORENOCONTEXT = 0x0020,
}

enum {
	IGIMIF_RIGHTMENU  = 0x0001,
	IGIMII_CMODE      = 0x0001,
	IGIMII_SMODE      = 0x0002,
	IGIMII_CONFIGURE  = 0x0004,
	IGIMII_TOOLS      = 0x0008,
	IGIMII_HELP       = 0x0010,
	IGIMII_OTHER      = 0x0020,
	IGIMII_INPUTTOOLS = 0x0040,
}

enum {
	IMFT_RADIOCHECK = 0x00001,
	IMFT_SEPARATOR  = 0x00002,
	IMFT_SUBMENU    = 0x00004,
}

enum {
	IMFS_GRAYED    = MFS_GRAYED,
	IMFS_DISABLED  = MFS_DISABLED,
	IMFS_CHECKED   = MFS_CHECKED,
	IMFS_HILITE    = MFS_HILITE,
	IMFS_ENABLED   = MFS_ENABLED,
	IMFS_UNCHECKED = MFS_UNCHECKED,
	IMFS_UNHILITE  = MFS_UNHILITE,
	IMFS_DEFAULT   = MFS_DEFAULT,
}

enum {
	SOFTKEYBOARD_TYPE_T1 = 0x0001,
	SOFTKEYBOARD_TYPE_C1 = 0x0002,
}

}// extern(C)
