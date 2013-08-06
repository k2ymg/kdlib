/** winuser.d

Converted from 'winuser.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.winuser;


import c.windows.sdkddkver;
import c.windows.windef;
import c.windows.wingdi;
import c.windows.guiddef;
import c.windows.winbase;
import c.windows.winnt;
import std.c.stdarg;


extern(C){

enum HDWP : HANDLE {init = (HANDLE).init}
alias void MENUTEMPLATEA;
alias void MENUTEMPLATEW;
version(UNICODE)
	alias MENUTEMPLATEW MENUTEMPLATE;
else
	alias MENUTEMPLATEA MENUTEMPLATE;

enum LPMENUTEMPLATEA : PVOID {init = (PVOID).init}
enum LPMENUTEMPLATEW : PVOID {init = (PVOID).init}
version(UNICODE)
	alias LPMENUTEMPLATEW LPMENUTEMPLATE;
else
	alias LPMENUTEMPLATEA LPMENUTEMPLATE;

alias extern(Windows) LRESULT function(HWND, UINT, WPARAM, LPARAM) WNDPROC;
alias extern(Windows) INT_PTR function(HWND, UINT, WPARAM, LPARAM) DLGPROC;
alias extern(Windows) VOID function(HWND, UINT, UINT_PTR, DWORD) TIMERPROC;
alias extern(Windows) BOOL function(HDC, LPARAM, int) GRAYSTRINGPROC;
alias extern(Windows) BOOL function(HWND, LPARAM) WNDENUMPROC;
alias extern(Windows) LRESULT function(int code, WPARAM wParam, LPARAM lParam) HOOKPROC;
alias extern(Windows) VOID function(HWND, UINT, ULONG_PTR, LRESULT)  SENDASYNCPROC;
alias extern(Windows) BOOL function(HWND, LPCSTR, HANDLE) PROPENUMPROCA;
alias extern(Windows) BOOL function(HWND, LPCWSTR, HANDLE) PROPENUMPROCW;
alias extern(Windows) BOOL function(HWND, LPSTR, HANDLE, ULONG_PTR) PROPENUMPROCEXA;
alias extern(Windows) BOOL function(HWND, LPWSTR, HANDLE, ULONG_PTR) PROPENUMPROCEXW;
alias extern(Windows) int function(LPSTR lpch, int ichCurrent, int cch, int code) EDITWORDBREAKPROCA;
alias extern(Windows) int function(LPWSTR lpch, int ichCurrent, int cch, int code) EDITWORDBREAKPROCW;
alias extern(Windows) BOOL function(HDC hdc, LPARAM lData, WPARAM wData, int cx, int cy) DRAWSTATEPROC;

version(UNICODE){
	alias PROPENUMPROCW PROPENUMPROC;
	alias PROPENUMPROCEXW PROPENUMPROCEX;
	alias EDITWORDBREAKPROCW EDITWORDBREAKPROC;
}else{
	alias PROPENUMPROCA PROPENUMPROC;
	alias PROPENUMPROCEXA PROPENUMPROCEX;
	alias EDITWORDBREAKPROCA EDITWORDBREAKPROC;
}

alias extern(Windows) BOOL function(LPSTR, LPARAM) NAMEENUMPROCA;
alias extern(Windows) BOOL function(LPWSTR, LPARAM) NAMEENUMPROCW;

alias NAMEENUMPROCA WINSTAENUMPROCA;
alias NAMEENUMPROCA DESKTOPENUMPROCA;
alias NAMEENUMPROCW WINSTAENUMPROCW;
alias NAMEENUMPROCW DESKTOPENUMPROCW;

version(UNICODE){
	alias WINSTAENUMPROCW WINSTAENUMPROC;
	alias DESKTOPENUMPROCW DESKTOPENUMPROC;
}else{
	alias WINSTAENUMPROCA WINSTAENUMPROC;
	alias DESKTOPENUMPROCA  DESKTOPENUMPROC;
}

pure nothrow
BOOL IS_INTRESOURCE(WORD _r)
{
	return ((cast(ULONG_PTR)_r) >> 16) == 0 ? TRUE : FALSE;
}

pure nothrow
LPSTR MAKEINTRESOURCEA(WORD i)
{
	return cast(LPSTR)cast(ULONG_PTR)i;
}

pure nothrow
LPWSTR MAKEINTRESOURCEW(WORD i)
{
	return cast(LPWSTR)cast(ULONG_PTR)i;
}

version(UNICODE)
	alias MAKEINTRESOURCEW MAKEINTRESOURCE;
else
	alias MAKEINTRESOURCEA MAKEINTRESOURCE;

const LPTSTR RT_CURSOR       = MAKEINTRESOURCE(1);
const LPTSTR RT_BITMAP       = MAKEINTRESOURCE(2);
const LPTSTR RT_ICON         = MAKEINTRESOURCE(3);
const LPTSTR RT_MENU         = MAKEINTRESOURCE(4);
const LPTSTR RT_DIALOG       = MAKEINTRESOURCE(5);
const LPTSTR RT_STRING       = MAKEINTRESOURCE(6);
const LPTSTR RT_FONTDIR      = MAKEINTRESOURCE(7);
const LPTSTR RT_FONT         = MAKEINTRESOURCE(8);
const LPTSTR RT_ACCELERATOR  = MAKEINTRESOURCE(9);
const LPTSTR RT_RCDATA       = MAKEINTRESOURCE(10);
const LPTSTR RT_MESSAGETABLE = MAKEINTRESOURCE(11);

enum DIFFERENCE = 11;
const LPTSTR RT_GROUP_CURSOR = MAKEINTRESOURCE(cast(WORD)(cast(ULONG_PTR)RT_CURSOR + DIFFERENCE));
const LPTSTR RT_GROUP_ICON   = MAKEINTRESOURCE(cast(WORD)(cast(ULONG_PTR)RT_ICON + DIFFERENCE));
const LPTSTR RT_VERSION      = MAKEINTRESOURCE(16);
const LPTSTR RT_DLGINCLUDE   = MAKEINTRESOURCE(17);
const LPTSTR RT_PLUGPLAY  = MAKEINTRESOURCE(19);
const LPTSTR RT_VXD       = MAKEINTRESOURCE(20);
const LPTSTR RT_ANICURSOR = MAKEINTRESOURCE(21);
const LPTSTR RT_ANIICON   = MAKEINTRESOURCE(22);
const LPTSTR RT_HTML = MAKEINTRESOURCE(23);
const LPTSTR RT_MANIFEST = MAKEINTRESOURCE(24);
const LPTSTR CREATEPROCESS_MANIFEST_RESOURCE_ID = MAKEINTRESOURCE(1);
const LPTSTR ISOLATIONAWARE_MANIFEST_RESOURCE_ID = MAKEINTRESOURCE(2);
const LPTSTR ISOLATIONAWARE_NOSTATICIMPORT_MANIFEST_RESOURCE_ID = MAKEINTRESOURCE(3);
const LPTSTR MINIMUM_RESERVED_MANIFEST_RESOURCE_ID = MAKEINTRESOURCE(1);
const LPTSTR MAXIMUM_RESERVED_MANIFEST_RESOURCE_ID = MAKEINTRESOURCE(16);

export extern(Windows) int wvsprintfA(LPSTR, LPCSTR, va_list arglist);
export extern(Windows) int wvsprintfW(LPWSTR, LPCWSTR, va_list arglist);
version(UNICODE)
	alias wvsprintfW wvsprintf;
else
	alias wvsprintfA wvsprintf;

export extern(C) int wsprintfA(LPSTR, LPCSTR, ...);
export extern(C) int wsprintfW(LPWSTR, LPCWSTR, ...);
version(UNICODE)
	alias wsprintfW wsprintf;
else
	alias wsprintfA wsprintf;

const(LPWSTR) SETWALLPAPER_DEFAULT = cast(LPWSTR)-1;

enum {
	SB_HORZ          = 0,
	SB_VERT          = 1,
	SB_CTL           = 2,
	SB_BOTH          = 3,
	SB_LINEUP        = 0,
	SB_LINELEFT      = 0,
	SB_LINEDOWN      = 1,
	SB_LINERIGHT     = 1,
	SB_PAGEUP        = 2,
	SB_PAGELEFT      = 2,
	SB_PAGEDOWN      = 3,
	SB_PAGERIGHT     = 3,
	SB_THUMBPOSITION = 4,
	SB_THUMBTRACK    = 5,
	SB_TOP           = 6,
	SB_LEFT          = 6,
	SB_BOTTOM        = 7,
	SB_RIGHT         = 7,
	SB_ENDSCROLL     = 8,
}

enum {
	SW_HIDE            = 0,
	SW_SHOWNORMAL      = 1,
	SW_NORMAL          = 1,
	SW_SHOWMINIMIZED   = 2,
	SW_SHOWMAXIMIZED   = 3,
	SW_MAXIMIZE        = 3,
	SW_SHOWNOACTIVATE  = 4,
	SW_SHOW            = 5,
	SW_MINIMIZE        = 6,
	SW_SHOWMINNOACTIVE = 7,
	SW_SHOWNA          = 8,
	SW_RESTORE         = 9,
	SW_SHOWDEFAULT     = 10,
	SW_FORCEMINIMIZE   = 11,
	SW_MAX             = 11,
}

enum {
	HIDE_WINDOW         = 0,
	SHOW_OPENWINDOW     = 1,
	SHOW_ICONWINDOW     = 2,
	SHOW_FULLSCREEN     = 3,
	SHOW_OPENNOACTIVATE = 4,
	SW_PARENTCLOSING    = 1,
	SW_OTHERZOOM        = 2,
	SW_PARENTOPENING    = 3,
	SW_OTHERUNZOOM      = 4,
}

enum {
	AW_HOR_POSITIVE = 0x00000001,
	AW_HOR_NEGATIVE = 0x00000002,
	AW_VER_POSITIVE = 0x00000004,
	AW_VER_NEGATIVE = 0x00000008,
	AW_CENTER       = 0x00000010,
	AW_HIDE         = 0x00010000,
	AW_ACTIVATE     = 0x00020000,
	AW_SLIDE        = 0x00040000,
	AW_BLEND        = 0x00080000,
}

enum {
	KF_EXTENDED = 0x0100,
	KF_DLGMODE  = 0x0800,
	KF_MENUMODE = 0x1000,
	KF_ALTDOWN  = 0x2000,
	KF_REPEAT   = 0x4000,
	KF_UP       = 0x8000,
}

enum {
	VK_LBUTTON  = 0x01,
	VK_RBUTTON  = 0x02,
	VK_CANCEL   = 0x03,
	VK_MBUTTON  = 0x04,
	VK_XBUTTON1 = 0x05,
	VK_XBUTTON2 = 0x06,
	VK_BACK     = 0x08,
	VK_TAB      = 0x09,
	VK_CLEAR    = 0x0C,
	VK_RETURN   = 0x0D,
	VK_SHIFT    = 0x10,
	VK_CONTROL  = 0x11,
	VK_MENU     = 0x12,
	VK_PAUSE    = 0x13,
	VK_CAPITAL  = 0x14,
	VK_KANA     = 0x15,
}

deprecated enum VK_HANGEUL = 0x15;

enum {
	VK_HANGUL         = 0x15,
	VK_JUNJA          = 0x17,
	VK_FINAL          = 0x18,
	VK_HANJA          = 0x19,
	VK_KANJI          = 0x19,
	VK_ESCAPE         = 0x1B,
	VK_CONVERT        = 0x1C,
	VK_NONCONVERT     = 0x1D,
	VK_ACCEPT         = 0x1E,
	VK_MODECHANGE     = 0x1F,
	VK_SPACE          = 0x20,
	VK_PRIOR          = 0x21,
	VK_NEXT           = 0x22,
	VK_END            = 0x23,
	VK_HOME           = 0x24,
	VK_LEFT           = 0x25,
	VK_UP             = 0x26,
	VK_RIGHT          = 0x27,
	VK_DOWN           = 0x28,
	VK_SELECT         = 0x29,
	VK_PRINT          = 0x2A,
	VK_EXECUTE        = 0x2B,
	VK_SNAPSHOT       = 0x2C,
	VK_INSERT         = 0x2D,
	VK_DELETE         = 0x2E,
	VK_HELP           = 0x2F,
	VK_LWIN           = 0x5B,
	VK_RWIN           = 0x5C,
	VK_APPS           = 0x5D,
	VK_SLEEP          = 0x5F,
	VK_NUMPAD0        = 0x60,
	VK_NUMPAD1        = 0x61,
	VK_NUMPAD2        = 0x62,
	VK_NUMPAD3        = 0x63,
	VK_NUMPAD4        = 0x64,
	VK_NUMPAD5        = 0x65,
	VK_NUMPAD6        = 0x66,
	VK_NUMPAD7        = 0x67,
	VK_NUMPAD8        = 0x68,
	VK_NUMPAD9        = 0x69,
	VK_MULTIPLY       = 0x6A,
	VK_ADD            = 0x6B,
	VK_SEPARATOR      = 0x6C,
	VK_SUBTRACT       = 0x6D,
	VK_DECIMAL        = 0x6E,
	VK_DIVIDE         = 0x6F,
	VK_F1             = 0x70,
	VK_F2             = 0x71,
	VK_F3             = 0x72,
	VK_F4             = 0x73,
	VK_F5             = 0x74,
	VK_F6             = 0x75,
	VK_F7             = 0x76,
	VK_F8             = 0x77,
	VK_F9             = 0x78,
	VK_F10            = 0x79,
	VK_F11            = 0x7A,
	VK_F12            = 0x7B,
	VK_F13            = 0x7C,
	VK_F14            = 0x7D,
	VK_F15            = 0x7E,
	VK_F16            = 0x7F,
	VK_F17            = 0x80,
	VK_F18            = 0x81,
	VK_F19            = 0x82,
	VK_F20            = 0x83,
	VK_F21            = 0x84,
	VK_F22            = 0x85,
	VK_F23            = 0x86,
	VK_F24            = 0x87,
	VK_NUMLOCK        = 0x90,
	VK_SCROLL         = 0x91,
	VK_OEM_NEC_EQUAL  = 0x92,
	VK_OEM_FJ_JISHO   = 0x92,
	VK_OEM_FJ_MASSHOU = 0x93,
	VK_OEM_FJ_TOUROKU = 0x94,
	VK_OEM_FJ_LOYA    = 0x95,
	VK_OEM_FJ_ROYA    = 0x96,
	VK_LSHIFT         = 0xA0,
	VK_RSHIFT         = 0xA1,
	VK_LCONTROL       = 0xA2,
	VK_RCONTROL       = 0xA3,
	VK_LMENU          = 0xA4,
	VK_RMENU          = 0xA5,
	VK_BROWSER_BACK        = 0xA6,
	VK_BROWSER_FORWARD     = 0xA7,
	VK_BROWSER_REFRESH     = 0xA8,
	VK_BROWSER_STOP        = 0xA9,
	VK_BROWSER_SEARCH      = 0xAA,
	VK_BROWSER_FAVORITES   = 0xAB,
	VK_BROWSER_HOME        = 0xAC,
	VK_VOLUME_MUTE         = 0xAD,
	VK_VOLUME_DOWN         = 0xAE,
	VK_VOLUME_UP           = 0xAF,
	VK_MEDIA_NEXT_TRACK    = 0xB0,
	VK_MEDIA_PREV_TRACK    = 0xB1,
	VK_MEDIA_STOP          = 0xB2,
	VK_MEDIA_PLAY_PAUSE    = 0xB3,
	VK_LAUNCH_MAIL         = 0xB4,
	VK_LAUNCH_MEDIA_SELECT = 0xB5,
	VK_LAUNCH_APP1         = 0xB6,
	VK_LAUNCH_APP2         = 0xB7,
	VK_OEM_1      = 0xBA,
	VK_OEM_PLUS   = 0xBB,
	VK_OEM_COMMA  = 0xBC,
	VK_OEM_MINUS  = 0xBD,
	VK_OEM_PERIOD = 0xBE,
	VK_OEM_2      = 0xBF,
	VK_OEM_3      = 0xC0,
	VK_OEM_4      = 0xDB,
	VK_OEM_5      = 0xDC,
	VK_OEM_6      = 0xDD,
	VK_OEM_7      = 0xDE,
	VK_OEM_8      = 0xDF,
	VK_OEM_AX     = 0xE1,
	VK_OEM_102    = 0xE2,
	VK_ICO_HELP   = 0xE3,
	VK_ICO_00     = 0xE4,
	VK_PROCESSKEY = 0xE5,
	VK_ICO_CLEAR = 0xE6,
	VK_PACKET = 0xE7,
	VK_OEM_RESET   = 0xE9,
	VK_OEM_JUMP    = 0xEA,
	VK_OEM_PA1     = 0xEB,
	VK_OEM_PA2     = 0xEC,
	VK_OEM_PA3     = 0xED,
	VK_OEM_WSCTRL  = 0xEE,
	VK_OEM_CUSEL   = 0xEF,
	VK_OEM_ATTN    = 0xF0,
	VK_OEM_FINISH  = 0xF1,
	VK_OEM_COPY    = 0xF2,
	VK_OEM_AUTO    = 0xF3,
	VK_OEM_ENLW    = 0xF4,
	VK_OEM_BACKTAB = 0xF5,
	VK_ATTN        = 0xF6,
	VK_CRSEL       = 0xF7,
	VK_EXSEL       = 0xF8,
	VK_EREOF       = 0xF9,
	VK_PLAY        = 0xFA,
	VK_ZOOM        = 0xFB,
	VK_NONAME      = 0xFC,
	VK_PA1         = 0xFD,
	VK_OEM_CLEAR   = 0xFE,
}

enum {
	WH_MIN             = -1,
	WH_MSGFILTER       = -1,
	WH_JOURNALRECORD   = 0,
	WH_JOURNALPLAYBACK = 1,
	WH_KEYBOARD        = 2,
	WH_GETMESSAGE      = 3,
	WH_CALLWNDPROC     = 4,
	WH_CBT             = 5,
	WH_SYSMSGFILTER    = 6,
	WH_MOUSE           = 7,
	WH_HARDWARE        = 8,
	WH_DEBUG           = 9,
	WH_SHELL           = 10,
	WH_FOREGROUNDIDLE  = 11,
	WH_CALLWNDPROCRET  = 12,
	WH_KEYBOARD_LL     = 13,
	WH_MOUSE_LL        = 14,
}
enum WH_MAX = 14;

enum {
	WH_MINHOOK = WH_MIN,
	WH_MAXHOOK = WH_MAX,
}

enum {
	HC_ACTION      = 0,
	HC_GETNEXT     = 1,
	HC_SKIP        = 2,
	HC_NOREMOVE    = 3,
	HC_NOREM       = HC_NOREMOVE,
	HC_SYSMODALON  = 4,
	HC_SYSMODALOFF = 5,
}

enum {
	HCBT_MOVESIZE     = 0,
	HCBT_MINMAX       = 1,
	HCBT_QS           = 2,
	HCBT_CREATEWND    = 3,
	HCBT_DESTROYWND   = 4,
	HCBT_ACTIVATE     = 5,
	HCBT_CLICKSKIPPED = 6,
	HCBT_KEYSKIPPED   = 7,
	HCBT_SYSCOMMAND   = 8,
	HCBT_SETFOCUS     = 9,
}

struct CBT_CREATEWNDA {
	CREATESTRUCTA* lpcs;
	HWND hwndInsertAfter;
}
alias CBT_CREATEWNDA* LPCBT_CREATEWNDA;

struct CBT_CREATEWNDW {
	CREATESTRUCTW* lpcs;
	HWND hwndInsertAfter;
}
alias CBT_CREATEWNDW* LPCBT_CREATEWNDW;
version(UNICODE){
	alias CBT_CREATEWNDW CBT_CREATEWND;
	alias LPCBT_CREATEWNDW LPCBT_CREATEWND;
}else{
	alias CBT_CREATEWNDA CBT_CREATEWND;
	alias LPCBT_CREATEWNDA LPCBT_CREATEWND;
}

struct CBTACTIVATESTRUCT {
	BOOL fMouse;
	HWND hWndActive;
}
alias CBTACTIVATESTRUCT* LPCBTACTIVATESTRUCT;

//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	struct WTSSESSION_NOTIFICATION {
		DWORD cbSize;
		DWORD dwSessionId;
	}
	alias WTSSESSION_NOTIFICATION* PWTSSESSION_NOTIFICATION;

	enum {
		WTS_CONSOLE_CONNECT        = 0x1,
		WTS_CONSOLE_DISCONNECT     = 0x2,
		WTS_REMOTE_CONNECT         = 0x3,
		WTS_REMOTE_DISCONNECT      = 0x4,
		WTS_SESSION_LOGON          = 0x5,
		WTS_SESSION_LOGOFF         = 0x6,
		WTS_SESSION_LOCK           = 0x7,
		WTS_SESSION_UNLOCK         = 0x8,
		WTS_SESSION_REMOTE_CONTROL = 0x9,
	}


enum {
	MSGF_DIALOGBOX  = 0,
	MSGF_MESSAGEBOX = 1,
	MSGF_MENU       = 2,
	MSGF_SCROLLBAR  = 5,
	MSGF_NEXTWINDOW = 6,
	MSGF_MAX        = 8,
	MSGF_USER       = 4096,
}

enum {
	HSHELL_WINDOWCREATED       = 1,
	HSHELL_WINDOWDESTROYED     = 2,
	HSHELL_ACTIVATESHELLWINDOW = 3,
}

enum {
	HSHELL_WINDOWACTIVATED = 4,
	HSHELL_GETMINRECT      = 5,
	HSHELL_REDRAW          = 6,
	HSHELL_TASKMAN         = 7,
	HSHELL_LANGUAGE        = 8,
	HSHELL_SYSMENU         = 9,
	HSHELL_ENDTASK         = 10,
	HSHELL_ACCESSIBILITYSTATE = 11,
	HSHELL_APPCOMMAND         = 12,
	//(_WIN32_WINNT >= 0x0501)
		HSHELL_WINDOWREPLACED  = 13,
		HSHELL_WINDOWREPLACING = 14,
}
enum {
	HSHELL_HIGHBIT          = 0x8000,
	HSHELL_FLASH            = HSHELL_REDRAW|HSHELL_HIGHBIT,
	HSHELL_RUDEAPPACTIVATED = HSHELL_WINDOWACTIVATED | HSHELL_HIGHBIT,
}

enum {
	APPCOMMAND_BROWSER_BACKWARD    = 1,
	APPCOMMAND_BROWSER_FORWARD     = 2,
	APPCOMMAND_BROWSER_REFRESH     = 3,
	APPCOMMAND_BROWSER_STOP        = 4,
	APPCOMMAND_BROWSER_SEARCH      = 5,
	APPCOMMAND_BROWSER_FAVORITES   = 6,
	APPCOMMAND_BROWSER_HOME        = 7,
	APPCOMMAND_VOLUME_MUTE         = 8,
	APPCOMMAND_VOLUME_DOWN         = 9,
	APPCOMMAND_VOLUME_UP           = 10,
	APPCOMMAND_MEDIA_NEXTTRACK     = 11,
	APPCOMMAND_MEDIA_PREVIOUSTRACK = 12,
	APPCOMMAND_MEDIA_STOP          = 13,
	APPCOMMAND_MEDIA_PLAY_PAUSE    = 14,
	APPCOMMAND_LAUNCH_MAIL         = 15,
	APPCOMMAND_LAUNCH_MEDIA_SELECT = 16,
	APPCOMMAND_LAUNCH_APP1         = 17,
	APPCOMMAND_LAUNCH_APP2         = 18,
	APPCOMMAND_BASS_DOWN           = 19,
	APPCOMMAND_BASS_BOOST          = 20,
	APPCOMMAND_BASS_UP             = 21,
	APPCOMMAND_TREBLE_DOWN         = 22,
	APPCOMMAND_TREBLE_UP           = 23,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		APPCOMMAND_MICROPHONE_VOLUME_MUTE            = 24,
		APPCOMMAND_MICROPHONE_VOLUME_DOWN            = 25,
		APPCOMMAND_MICROPHONE_VOLUME_UP              = 26,
		APPCOMMAND_HELP                              = 27,
		APPCOMMAND_FIND                              = 28,
		APPCOMMAND_NEW                               = 29,
		APPCOMMAND_OPEN                              = 30,
		APPCOMMAND_CLOSE                             = 31,
		APPCOMMAND_SAVE                              = 32,
		APPCOMMAND_PRINT                             = 33,
		APPCOMMAND_UNDO                              = 34,
		APPCOMMAND_REDO                              = 35,
		APPCOMMAND_COPY                              = 36,
		APPCOMMAND_CUT                               = 37,
		APPCOMMAND_PASTE                             = 38,
		APPCOMMAND_REPLY_TO_MAIL                     = 39,
		APPCOMMAND_FORWARD_MAIL                      = 40,
		APPCOMMAND_SEND_MAIL                         = 41,
		APPCOMMAND_SPELL_CHECK                       = 42,
		APPCOMMAND_DICTATE_OR_COMMAND_CONTROL_TOGGLE = 43,
		APPCOMMAND_MIC_ON_OFF_TOGGLE                 = 44,
		APPCOMMAND_CORRECTION_LIST                   = 45,
		APPCOMMAND_MEDIA_PLAY                        = 46,
		APPCOMMAND_MEDIA_PAUSE                       = 47,
		APPCOMMAND_MEDIA_RECORD                      = 48,
		APPCOMMAND_MEDIA_FAST_FORWARD                = 49,
		APPCOMMAND_MEDIA_REWIND                      = 50,
		APPCOMMAND_MEDIA_CHANNEL_UP                  = 51,
		APPCOMMAND_MEDIA_CHANNEL_DOWN                = 52,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
		APPCOMMAND_DELETE     = 53,
		APPCOMMAND_DWM_FLIP3D = 54,
}
enum {
	FAPPCOMMAND_MOUSE = 0x8000,
	FAPPCOMMAND_KEY   = 0,
	FAPPCOMMAND_OEM   = 0x1000,
	FAPPCOMMAND_MASK  = 0xF000,
}

pure nothrow
short GET_APPCOMMAND_LPARAM(LPARAM lParam)
{
	return cast(short)(HIWORD(lParam) & ~FAPPCOMMAND_MASK);
}

pure nothrow
WORD GET_DEVICE_LPARAM(LPARAM lParam)
{
	return cast(WORD)(HIWORD(lParam) & FAPPCOMMAND_MASK);
}

alias GET_DEVICE_LPARAM GET_MOUSEORKEY_LPARAM;

pure nothrow
int GET_FLAGS_LPARAM(LPARAM lParam)
{
	return LOWORD(lParam);
}

pure nothrow
int GET_KEYSTATE_LPARAM(LPARAM lParam)
{
	return GET_FLAGS_LPARAM(lParam);
}

struct SHELLHOOKINFO {
	HWND hwnd;
	RECT rc;
}
alias SHELLHOOKINFO* LPSHELLHOOKINFO;

struct EVENTMSG {
	UINT message;
	UINT paramL;
	UINT paramH;
	DWORD time;
	HWND hwnd;
}
alias EVENTMSG* PEVENTMSGMSG;
alias EVENTMSG* NPEVENTMSGMSG;
alias EVENTMSG* LPEVENTMSGMSG;
alias EVENTMSG* PEVENTMSG;
alias EVENTMSG* NPEVENTMSG;
alias EVENTMSG* LPEVENTMSG;

struct CWPSTRUCT {
	LPARAM lParam;
	WPARAM wParam;
	UINT message;
	HWND hwnd;
}
alias CWPSTRUCT* PCWPSTRUCT;
alias CWPSTRUCT* NPCWPSTRUCT;
alias CWPSTRUCT* LPCWPSTRUCT;

struct CWPRETSTRUCT {
	LRESULT lResult;
	LPARAM lParam;
	WPARAM wParam;
	UINT message;
	HWND hwnd;
}
alias CWPRETSTRUCT* PCWPRETSTRUCT;
alias CWPRETSTRUCT* NPCWPRETSTRUCT;
alias CWPRETSTRUCT* LPCWPRETSTRUCT;

enum {
	LLKHF_EXTENDED  = KF_EXTENDED >> 8,
	LLKHF_INJECTED  = 0x00000010,
	LLKHF_ALTDOWN   = KF_ALTDOWN >> 8,
	LLKHF_UP        = KF_UP >> 8,
}
enum LLMHF_INJECTED = 0x00000001;

struct KBDLLHOOKSTRUCT {
	DWORD vkCode;
	DWORD scanCode;
	DWORD flags;
	DWORD time;
	ULONG_PTR dwExtraInfo;
}
alias KBDLLHOOKSTRUCT* LPKBDLLHOOKSTRUCT;
alias KBDLLHOOKSTRUCT* PKBDLLHOOKSTRUCT;

struct MSLLHOOKSTRUCT {
	POINT pt;
	DWORD mouseData;
	DWORD flags;
	DWORD time;
	ULONG_PTR dwExtraInfo;
}
alias MSLLHOOKSTRUCT* LPMSLLHOOKSTRUCT;
alias MSLLHOOKSTRUCT* PMSLLHOOKSTRUCT;

struct DEBUGHOOKINFO {
	DWORD idThread;
	DWORD idThreadInstaller;
	LPARAM lParam;
	WPARAM wParam;
	int code;
}
alias DEBUGHOOKINFO* PDEBUGHOOKINFO;
alias DEBUGHOOKINFO* NPDEBUGHOOKINFO;
alias DEBUGHOOKINFO* LPDEBUGHOOKINFO;

struct MOUSEHOOKSTRUCT {
	POINT pt;
	HWND hwnd;
	UINT wHitTestCode;
	ULONG_PTR dwExtraInfo;
}
alias MOUSEHOOKSTRUCT* LPMOUSEHOOKSTRUCT;
alias MOUSEHOOKSTRUCT* PMOUSEHOOKSTRUCT;

struct MOUSEHOOKSTRUCTEX {
	MOUSEHOOKSTRUCT dummy_;
	DWORD mouseData;
}
alias MOUSEHOOKSTRUCTEX* LPMOUSEHOOKSTRUCTEX;
alias MOUSEHOOKSTRUCTEX* PMOUSEHOOKSTRUCTEX;

struct HARDWAREHOOKSTRUCT {
	HWND hwnd;
	UINT message;
	WPARAM wParam;
	LPARAM lParam;
}
alias HARDWAREHOOKSTRUCT* LPHARDWAREHOOKSTRUCT;
alias HARDWAREHOOKSTRUCT* PHARDWAREHOOKSTRUCT;

enum {
	HKL_PREV  = 0,
	HKL_NEXT  = 1,
}

enum {
	KLF_ACTIVATE      = 0x00000001,
	KLF_SUBSTITUTE_OK = 0x00000002,
	KLF_REORDER       = 0x00000008,
	KLF_REPLACELANG   = 0x00000010,
	KLF_NOTELLSHELL   = 0x00000080,
	KLF_SETFORPROCESS = 0x00000100,
	KLF_SHIFTLOCK     = 0x00010000,
	KLF_RESET         = 0x40000000,
}

enum {
	INPUTLANGCHANGE_SYSCHARSET  = 0x0001,
	INPUTLANGCHANGE_FORWARD     = 0x0002,
	INPUTLANGCHANGE_BACKWARD    = 0x0004,
}

enum KL_NAMELENGTH = 9;

export extern(Windows) HKL LoadKeyboardLayoutA(LPCSTR pwszKLID, UINT Flags);
export extern(Windows) HKL LoadKeyboardLayoutW(LPCWSTR pwszKLID, UINT Flags);
version(UNICODE)
	alias LoadKeyboardLayoutW LoadKeyboardLayout;
else
	alias LoadKeyboardLayoutA LoadKeyboardLayout;

export extern(Windows) HKL ActivateKeyboardLayout(HKL hkl, UINT Flags);

export extern(Windows) int ToUnicodeEx(UINT wVirtKey, UINT wScanCode, const(BYTE)* lpKeyState, LPWSTR pwszBuff, int cchBuff, UINT wFlags, HKL dwhkl);

export extern(Windows) BOOL UnloadKeyboardLayout(HKL hkl);
export extern(Windows) BOOL GetKeyboardLayoutNameA(LPSTR pwszKLID);
export extern(Windows) BOOL GetKeyboardLayoutNameW(LPWSTR pwszKLID);
version(UNICODE)
	alias GetKeyboardLayoutNameW GetKeyboardLayoutName;
else
	alias GetKeyboardLayoutNameA GetKeyboardLayoutName;

export extern(Windows) int GetKeyboardLayoutList(int nBuff, HKL* lpList);
export extern(Windows) HKL GetKeyboardLayout(DWORD idThread);

struct MOUSEMOVEPOINT {
	int x;
	int y;
	DWORD time;
	ULONG_PTR dwExtraInfo;
}
alias MOUSEMOVEPOINT* PMOUSEMOVEPOINT;
alias MOUSEMOVEPOINT* LPMOUSEMOVEPOINT;

enum {
	GMMP_USE_DISPLAY_POINTS          = 1,
	GMMP_USE_HIGH_RESOLUTION_POINTS  = 2,
}
export extern(Windows) int GetMouseMovePointsEx(UINT cbSize, LPMOUSEMOVEPOINT lppt, LPMOUSEMOVEPOINT lpptBuf, int nBufPoints, DWORD resolution);

enum {
	DESKTOP_READOBJECTS      = 0x0001,
	DESKTOP_CREATEWINDOW     = 0x0002,
	DESKTOP_CREATEMENU       = 0x0004,
	DESKTOP_HOOKCONTROL      = 0x0008,
	DESKTOP_JOURNALRECORD    = 0x0010,
	DESKTOP_JOURNALPLAYBACK  = 0x0020,
	DESKTOP_ENUMERATE        = 0x0040,
	DESKTOP_WRITEOBJECTS     = 0x0080,
	DESKTOP_SWITCHDESKTOP    = 0x0100,
}
enum DF_ALLOWOTHERACCOUNTHOOK = 0x0001;

export extern(Windows) HDESK CreateDesktopA(LPCSTR lpszDesktop, LPCSTR lpszDevice, DEVMODEA* pDevmode, DWORD dwFlags, ACCESS_MASK dwDesiredAccess, LPSECURITY_ATTRIBUTES lpsa);
export extern(Windows) HDESK CreateDesktopW(LPCWSTR lpszDesktop, LPCWSTR lpszDevice, DEVMODEW* pDevmode, DWORD dwFlags, ACCESS_MASK dwDesiredAccess, LPSECURITY_ATTRIBUTES lpsa);
version(UNICODE)
	alias CreateDesktopW CreateDesktop;
else
	alias CreateDesktopA CreateDesktop;

export extern(Windows) HDESK CreateDesktopExA(LPCSTR lpszDesktop, LPCSTR lpszDevice, DEVMODEA* pDevmode, DWORD dwFlags, ACCESS_MASK dwDesiredAccess, LPSECURITY_ATTRIBUTES lpsa, ULONG ulHeapSize, PVOID pvoid);
export extern(Windows) HDESK CreateDesktopExW(LPCWSTR lpszDesktop, LPCWSTR lpszDevice, DEVMODEW* pDevmode, DWORD dwFlags, ACCESS_MASK dwDesiredAccess, LPSECURITY_ATTRIBUTES lpsa, ULONG ulHeapSize, PVOID pvoid);
version(UNICODE)
	alias CreateDesktopExW CreateDesktopEx;
else
	alias CreateDesktopExA CreateDesktopEx;

export extern(Windows) HDESK OpenDesktopA(LPCSTR lpszDesktop, DWORD dwFlags, BOOL fInherit, ACCESS_MASK dwDesiredAccess);
export extern(Windows) HDESK OpenDesktopW(LPCWSTR lpszDesktop, DWORD dwFlags, BOOL fInherit, ACCESS_MASK dwDesiredAccess);
version(UNICODE)
	alias OpenDesktopW OpenDesktop;
else
	alias OpenDesktopA OpenDesktop;

export extern(Windows) HDESK OpenInputDesktop(DWORD dwFlags, BOOL fInherit, ACCESS_MASK dwDesiredAccess);
export extern(Windows) BOOL EnumDesktopsA(HWINSTA hwinsta, DESKTOPENUMPROCA lpEnumFunc, LPARAM lParam);
export extern(Windows) BOOL EnumDesktopsW(HWINSTA hwinsta, DESKTOPENUMPROCW lpEnumFunc, LPARAM lParam);
version(UNICODE)
	alias EnumDesktopsW EnumDesktops;
else
	alias EnumDesktopsA EnumDesktops;

export extern(Windows) BOOL EnumDesktopWindows(HDESK hDesktop, WNDENUMPROC lpfn, LPARAM lParam);
export extern(Windows) BOOL SwitchDesktop(HDESK hDesktop);
export extern(Windows) BOOL SetThreadDesktop(HDESK hDesktop);
export extern(Windows) BOOL CloseDesktop(HDESK hDesktop);
export extern(Windows) HDESK GetThreadDesktop(DWORD dwThreadId);

enum {
	WINSTA_ENUMDESKTOPS       = 0x0001,
	WINSTA_READATTRIBUTES     = 0x0002,
	WINSTA_ACCESSCLIPBOARD    = 0x0004,
	WINSTA_CREATEDESKTOP      = 0x0008,
	WINSTA_WRITEATTRIBUTES    = 0x0010,
	WINSTA_ACCESSGLOBALATOMS  = 0x0020,
	WINSTA_EXITWINDOWS        = 0x0040,
	WINSTA_ENUMERATE          = 0x0100,
	WINSTA_READSCREEN         = 0x0200,
	WINSTA_ALL_ACCESS         = WINSTA_ENUMDESKTOPS | WINSTA_READATTRIBUTES | WINSTA_ACCESSCLIPBOARD | WINSTA_CREATEDESKTOP | WINSTA_WRITEATTRIBUTES | WINSTA_ACCESSGLOBALATOMS | WINSTA_EXITWINDOWS | WINSTA_ENUMERATE | WINSTA_READSCREEN,
}

enum CWF_CREATE_ONLY = 0x00000001;

enum WSF_VISIBLE = 0x0001;

export extern(Windows) HWINSTA CreateWindowStationA(LPCSTR lpwinsta, DWORD dwFlags, ACCESS_MASK dwDesiredAccess, LPSECURITY_ATTRIBUTES lpsa);
export extern(Windows) HWINSTA CreateWindowStationW(LPCWSTR lpwinsta, DWORD dwFlags, ACCESS_MASK dwDesiredAccess, LPSECURITY_ATTRIBUTES lpsa);
version(UNICODE)
	alias CreateWindowStationW CreateWindowStation;
else
	alias CreateWindowStationA CreateWindowStation;

export extern(Windows) HWINSTA OpenWindowStationA(LPCSTR lpszWinSta, BOOL fInherit, ACCESS_MASK dwDesiredAccess);
export extern(Windows) HWINSTA OpenWindowStationW(LPCWSTR lpszWinSta, BOOL fInherit, ACCESS_MASK dwDesiredAccess);
version(UNICODE)
	alias OpenWindowStationW OpenWindowStation;
else
	alias OpenWindowStationA OpenWindowStation;

export extern(Windows) BOOL EnumWindowStationsA(WINSTAENUMPROCA lpEnumFunc, LPARAM lParam);
export extern(Windows) BOOL EnumWindowStationsW(WINSTAENUMPROCW lpEnumFunc, LPARAM lParam);
version(UNICODE)
	alias EnumWindowStationsW EnumWindowStations;
else
	alias EnumWindowStationsA EnumWindowStations;

export extern(Windows) BOOL CloseWindowStation(HWINSTA hWinSta);
export extern(Windows) BOOL SetProcessWindowStation(HWINSTA hWinSta);
export extern(Windows) HWINSTA GetProcessWindowStation();
export extern(Windows) BOOL SetUserObjectSecurity(HANDLE hObj, PSECURITY_INFORMATION pSIRequested, PSECURITY_DESCRIPTOR pSID);
export extern(Windows) BOOL GetUserObjectSecurity(HANDLE hObj, PSECURITY_INFORMATION pSIRequested, PSECURITY_DESCRIPTOR pSID, DWORD nLength, LPDWORD lpnLengthNeeded);

enum {
	UOI_FLAGS    = 1,
	UOI_NAME     = 2,
	UOI_TYPE     = 3,
	UOI_USER_SID = 4,
	//(WINVER >= _WIN32_WINNT_VISTA)
		UOI_HEAPSIZE = 5,
		UOI_IO       = 6,
}

struct USEROBJECTFLAGS {
	BOOL fInherit;
	BOOL fReserved;
	DWORD dwFlags;
}
alias USEROBJECTFLAGS* PUSEROBJECTFLAGS;

export extern(Windows) BOOL GetUserObjectInformationA(HANDLE hObj, int nIndex, PVOID pvInfo, DWORD nLength, LPDWORD lpnLengthNeeded);
export extern(Windows) BOOL GetUserObjectInformationW(HANDLE hObj, int nIndex, PVOID pvInfo, DWORD nLength, LPDWORD lpnLengthNeeded);
version(UNICODE)
	alias GetUserObjectInformationW GetUserObjectInformation;
else
	alias GetUserObjectInformationA GetUserObjectInformation;

export extern(Windows) BOOL SetUserObjectInformationA(HANDLE hObj, int nIndex, PVOID pvInfo, DWORD nLength);
export extern(Windows) BOOL SetUserObjectInformationW(HANDLE hObj, int nIndex, PVOID pvInfo, DWORD nLength);
version(UNICODE)
	alias SetUserObjectInformationW SetUserObjectInformation;
else
	alias SetUserObjectInformationA SetUserObjectInformation;

struct WNDCLASSEXA {
	UINT cbSize;
	UINT style;
	WNDPROC lpfnWndProc;
	int cbClsExtra;
	int cbWndExtra;
	HINSTANCE hInstance;
	HICON hIcon;
	HCURSOR hCursor;
	HBRUSH hbrBackground;
	LPCSTR lpszMenuName;
	LPCSTR lpszClassName;
	HICON hIconSm;
}
alias WNDCLASSEXA* PWNDCLASSEXA;
alias WNDCLASSEXA* NPWNDCLASSEXA;
alias WNDCLASSEXA* LPWNDCLASSEXA;

struct WNDCLASSEXW {
	UINT cbSize;
	UINT style;
	WNDPROC lpfnWndProc;
	int cbClsExtra;
	int cbWndExtra;
	HINSTANCE hInstance;
	HICON hIcon;
	HCURSOR hCursor;
	HBRUSH hbrBackground;
	LPCWSTR lpszMenuName;
	LPCWSTR lpszClassName;
	HICON hIconSm;
}
alias WNDCLASSEXW* PWNDCLASSEXW;
alias WNDCLASSEXW* NPWNDCLASSEXW;
alias WNDCLASSEXW* LPWNDCLASSEXW;
version(UNICODE){
	alias WNDCLASSEXW WNDCLASSEX;
	alias PWNDCLASSEXW PWNDCLASSEX;
	alias NPWNDCLASSEXW NPWNDCLASSEX;
	alias LPWNDCLASSEXW LPWNDCLASSEX;
}else{
	alias WNDCLASSEXA WNDCLASSEX;
	alias PWNDCLASSEXA PWNDCLASSEX;
	alias NPWNDCLASSEXA NPWNDCLASSEX;
	alias LPWNDCLASSEXA LPWNDCLASSEX;
}

struct WNDCLASSA {
	UINT style;
	WNDPROC lpfnWndProc;
	int cbClsExtra;
	int cbWndExtra;
	HINSTANCE hInstance;
	HICON hIcon;
	HCURSOR hCursor;
	HBRUSH hbrBackground;
	LPCSTR lpszMenuName;
	LPCSTR lpszClassName;
}
alias WNDCLASSA* PWNDCLASSA;
alias WNDCLASSA* NPWNDCLASSA;
alias WNDCLASSA* LPWNDCLASSA;

struct WNDCLASSW {
	UINT style;
	WNDPROC lpfnWndProc;
	int cbClsExtra;
	int cbWndExtra;
	HINSTANCE hInstance;
	HICON hIcon;
	HCURSOR hCursor;
	HBRUSH hbrBackground;
	LPCWSTR lpszMenuName;
	LPCWSTR lpszClassName;
}
alias WNDCLASSW* PWNDCLASSW;
alias WNDCLASSW* NPWNDCLASSW;
alias WNDCLASSW* LPWNDCLASSW;
version(UNICODE){
	alias WNDCLASSW WNDCLASS;
	alias PWNDCLASSW PWNDCLASS;
	alias NPWNDCLASSW NPWNDCLASS;
	alias LPWNDCLASSW LPWNDCLASS;
}else{
	alias WNDCLASSA WNDCLASS;
	alias PWNDCLASSA PWNDCLASS;
	alias NPWNDCLASSA NPWNDCLASS;
	alias LPWNDCLASSA LPWNDCLASS;
}

export extern(Windows) BOOL IsHungAppWindow(HWND hwnd);
static if(WINVER >= _WIN32_WINNT_WINXP)
	export extern(Windows) VOID DisableProcessWindowsGhosting();

struct MSG {
	HWND hwnd;
	UINT message;
	WPARAM wParam;
	LPARAM lParam;
	DWORD time;
	POINT pt;
}
alias MSG* PMSG;
alias MSG* NPMSG;
alias MSG* LPMSG;

/*template POINTSTOPOINT(alias pt, alias pts)
{
	pt.x = (LONG)(SHORT)LOWORD(*(LONG*)&pts);
	pt.y = (LONG)(SHORT)HIWORD(*(LONG*)&pts);
}*/

/*pure nothrow
POINTS POINTTOPOINTS(POINT pt)
{
	return cast(POINTS)MAKELONG(cast(short)pt.x, cast(short)pt.y);
}*/

pure nothrow
WPARAM MAKEWPARAM(WORD l, WORD h)
{
	return cast(WPARAM)cast(DWORD)MAKELONG(l, h);
}

pure nothrow
LPARAM MAKELPARAM(WORD l, WORD h)
{
	return cast(LPARAM)cast(DWORD)MAKELONG(l, h);
}

pure nothrow
LRESULT MAKELRESULT(WORD l, WORD h)
{
	return cast(LRESULT)cast(DWORD)MAKELONG(l, h);
}

enum {
	GWL_STYLE       = -16,
	GWL_EXSTYLE     = -20,
	GWL_ID          = -12,
	GWL_WNDPROC     = -4,
	GWL_HINSTANCE   = -6,
	GWL_HWNDPARENT  = -8,
	GWL_USERDATA    = -21,
	GWLP_WNDPROC    = -4,
	GWLP_HINSTANCE  = -6,
	GWLP_HWNDPARENT = -8,
	GWLP_USERDATA   = -21,
	GWLP_ID         = -12,
}

enum {
	GCL_CBWNDEXTRA     = -18,
	GCL_CBCLSEXTRA     = -20,
	GCL_STYLE          = -26,
	GCW_ATOM           = -32,
	GCL_MENUNAME       = -8,
	GCL_HBRBACKGROUND  = -10,
	GCL_HCURSOR        = -12,
	GCL_HICON          = -14,
	GCL_HMODULE        = -16,
	GCL_WNDPROC        = -24,
	GCL_HICONSM        = -34,
	GCLP_MENUNAME      = -8,
	GCLP_HBRBACKGROUND = -10,
	GCLP_HCURSOR       = -12,
	GCLP_HICON         = -14,
	GCLP_HMODULE       = -16,
	GCLP_WNDPROC       = -24,
	GCLP_HICONSM       = -34,
}

enum {
	WM_NULL     = 0x0000,
	WM_CREATE   = 0x0001,
	WM_DESTROY  = 0x0002,
	WM_MOVE     = 0x0003,
	WM_SIZE     = 0x0005,
	WM_ACTIVATE = 0x0006,
}
enum {
	WA_INACTIVE    = 0,
	WA_ACTIVE      = 1,
	WA_CLICKACTIVE = 2,
}
enum {
	WM_SETFOCUS      = 0x0007,
	WM_KILLFOCUS     = 0x0008,
	WM_ENABLE        = 0x000A,
	WM_SETREDRAW     = 0x000B,
	WM_SETTEXT       = 0x000C,
	WM_GETTEXT       = 0x000D,
	WM_GETTEXTLENGTH = 0x000E,
	WM_PAINT         = 0x000F,
	WM_CLOSE         = 0x0010,
}
version(all){ // !_WIN32_WCE
	enum {
		WM_QUERYENDSESSION = 0x0011,
		WM_QUERYOPEN       = 0x0013,
		WM_ENDSESSION      = 0x0016,
	}
}
enum {
	WM_QUIT           = 0x0012,
	WM_ERASEBKGND     = 0x0014,
	WM_SYSCOLORCHANGE = 0x0015,
	WM_SHOWWINDOW     = 0x0018,
	WM_WININICHANGE   = 0x001A,
	WM_SETTINGCHANGE  = WM_WININICHANGE,
	WM_DEVMODECHANGE  = 0x001B,
	WM_ACTIVATEAPP    = 0x001C,
	WM_FONTCHANGE     = 0x001D,
	WM_TIMECHANGE     = 0x001E,
	WM_CANCELMODE     = 0x001F,
	WM_SETCURSOR      = 0x0020,
	WM_MOUSEACTIVATE  = 0x0021,
	WM_CHILDACTIVATE  = 0x0022,
	WM_QUEUESYNC      = 0x0023,
	WM_GETMINMAXINFO  = 0x0024,
}
struct MINMAXINFO {
	POINT ptReserved;
	POINT ptMaxSize;
	POINT ptMaxPosition;
	POINT ptMinTrackSize;
	POINT ptMaxTrackSize;
}
alias MINMAXINFO* PMINMAXINFO;
alias MINMAXINFO* LPMINMAXINFO;

enum {
	WM_PAINTICON      = 0x0026,
	WM_ICONERASEBKGND = 0x0027,
	WM_NEXTDLGCTL     = 0x0028,
	WM_SPOOLERSTATUS  = 0x002A,
	WM_DRAWITEM       = 0x002B,
	WM_MEASUREITEM    = 0x002C,
	WM_DELETEITEM     = 0x002D,
	WM_VKEYTOITEM     = 0x002E,
	WM_CHARTOITEM     = 0x002F,
	WM_SETFONT        = 0x0030,
	WM_GETFONT        = 0x0031,
	WM_SETHOTKEY      = 0x0032,
	WM_GETHOTKEY      = 0x0033,
	WM_QUERYDRAGICON  = 0x0037,
	WM_COMPAREITEM    = 0x0039,
}
version(all) // !_WIN32_WCE
		enum WM_GETOBJECT = 0x003D;
enum {
	WM_COMPACTING        = 0x0041,
	WM_COMMNOTIFY        = 0x0044,
	WM_WINDOWPOSCHANGING = 0x0046,
	WM_WINDOWPOSCHANGED  = 0x0047,
	WM_POWER             = 0x0048,
}
enum {
	PWR_OK             = 1,
	PWR_FAIL           = -1,
	PWR_SUSPENDREQUEST = 1,
	PWR_SUSPENDRESUME  = 2,
	PWR_CRITICALRESUME = 3,
}
enum {
	WM_COPYDATA      = 0x004A,
	WM_CANCELJOURNAL = 0x004B,
}

struct COPYDATASTRUCT {
	ULONG_PTR dwData;
	DWORD cbData;
	PVOID lpData;
}
alias COPYDATASTRUCT* PCOPYDATASTRUCT;

struct MDINEXTMENU{
	HMENU hmenuIn;
	HMENU hmenuNext;
	HWND hwndNext;
}
alias MDINEXTMENU* PMDINEXTMENU;
alias MDINEXTMENU* LPMDINEXTMENU;

enum {
	WM_NOTIFY                 = 0x004E,
	WM_INPUTLANGCHANGEREQUEST = 0x0050,
	WM_INPUTLANGCHANGE        = 0x0051,
	WM_TCARD                  = 0x0052,
	WM_HELP                   = 0x0053,
	WM_USERCHANGED            = 0x0054,
	WM_NOTIFYFORMAT           = 0x0055,
}
enum {
	NFR_ANSI    = 1,
	NFR_UNICODE = 2,
	NF_QUERY    = 3,
	NF_REQUERY  = 4,
}
enum {
	WM_CONTEXTMENU   = 0x007B,
	WM_STYLECHANGING = 0x007C,
	WM_STYLECHANGED  = 0x007D,
	WM_DISPLAYCHANGE = 0x007E,
	WM_GETICON       = 0x007F,
	WM_SETICON       = 0x0080,
	WM_NCCREATE      = 0x0081,
	WM_NCDESTROY     = 0x0082,
	WM_NCCALCSIZE    = 0x0083,
	WM_NCHITTEST     = 0x0084,
	WM_NCPAINT       = 0x0085,
	WM_NCACTIVATE    = 0x0086,
	WM_GETDLGCODE    = 0x0087,
}
version(all) // !_WIN32_WCE
	enum WM_SYNCPAINT = 0x0088;
enum {
	WM_NCMOUSEMOVE     = 0x00A0,
	WM_NCLBUTTONDOWN   = 0x00A1,
	WM_NCLBUTTONUP     = 0x00A2,
	WM_NCLBUTTONDBLCLK = 0x00A3,
	WM_NCRBUTTONDOWN   = 0x00A4,
	WM_NCRBUTTONUP     = 0x00A5,
	WM_NCRBUTTONDBLCLK = 0x00A6,
	WM_NCMBUTTONDOWN   = 0x00A7,
	WM_NCMBUTTONUP     = 0x00A8,
	WM_NCMBUTTONDBLCLK = 0x00A9,
	WM_NCXBUTTONDOWN   = 0x00AB,
	WM_NCXBUTTONUP     = 0x00AC,
	WM_NCXBUTTONDBLCLK = 0x00AD,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		WM_INPUT_DEVICE_CHANGE = 0x00FE,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		WM_INPUT = 0x00FF,
	WM_KEYFIRST    = 0x0100,
	WM_KEYDOWN     = 0x0100,
	WM_KEYUP       = 0x0101,
	WM_CHAR        = 0x0102,
	WM_DEADCHAR    = 0x0103,
	WM_SYSKEYDOWN  = 0x0104,
	WM_SYSKEYUP    = 0x0105,
	WM_SYSCHAR     = 0x0106,
	WM_SYSDEADCHAR = 0x0107,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		WM_UNICHAR     = 0x0109,
		WM_KEYLAST     = 0x0109,
		UNICODE_NOCHAR = 0xFFFF,

	WM_IME_STARTCOMPOSITION = 0x010D,
	WM_IME_ENDCOMPOSITION   = 0x010E,
	WM_IME_COMPOSITION      = 0x010F,
	WM_IME_KEYLAST          = 0x010F,
	WM_INITDIALOG    = 0x0110,
	WM_COMMAND       = 0x0111,
	WM_SYSCOMMAND    = 0x0112,
	WM_TIMER         = 0x0113,
	WM_HSCROLL       = 0x0114,
	WM_VSCROLL       = 0x0115,
	WM_INITMENU      = 0x0116,
	WM_INITMENUPOPUP = 0x0117,
	//(WINVER >= _WIN32_WINNT_WIN7)
		WM_GESTURE       = 0x0119,
		WM_GESTURENOTIFY = 0x011A,
	WM_MENUSELECT = 0x011F,
	WM_MENUCHAR   = 0x0120,
	WM_ENTERIDLE  = 0x0121,
}

version(all){ // !_WIN32_WCE
	enum {
		WM_MENURBUTTONUP   = 0x0122,
		WM_MENUDRAG        = 0x0123,
		WM_MENUGETOBJECT   = 0x0124,
		WM_UNINITMENUPOPUP = 0x0125,
		WM_MENUCOMMAND     = 0x0126,
		WM_CHANGEUISTATE   = 0x0127,
		WM_UPDATEUISTATE   = 0x0128,
		WM_QUERYUISTATE    = 0x0129,
	}
	enum {
		UIS_SET        = 1,
		UIS_CLEAR      = 2,
		UIS_INITIALIZE = 3,
	}
	enum {
		UISF_HIDEFOCUS = 0x1,
		UISF_HIDEACCEL = 0x2,
		//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		UISF_ACTIVE    = 0x4,
	}
}

enum {
	WM_CTLCOLORMSGBOX    = 0x0132,
	WM_CTLCOLOREDIT      = 0x0133,
	WM_CTLCOLORLISTBOX   = 0x0134,
	WM_CTLCOLORBTN       = 0x0135,
	WM_CTLCOLORDLG       = 0x0136,
	WM_CTLCOLORSCROLLBAR = 0x0137,
	WM_CTLCOLORSTATIC    = 0x0138,
	MN_GETHMENU          = 0x01E1,
	WM_MOUSEFIRST        = 0x0200,
	WM_MOUSEMOVE         = 0x0200,
	WM_LBUTTONDOWN       = 0x0201,
	WM_LBUTTONUP         = 0x0202,
	WM_LBUTTONDBLCLK     = 0x0203,
	WM_RBUTTONDOWN       = 0x0204,
	WM_RBUTTONUP         = 0x0205,
	WM_RBUTTONDBLCLK     = 0x0206,
	WM_MBUTTONDOWN       = 0x0207,
	WM_MBUTTONUP         = 0x0208,
	WM_MBUTTONDBLCLK     = 0x0209,
	WM_MOUSEWHEEL        = 0x020A,
	WM_XBUTTONDOWN       = 0x020B,
	WM_XBUTTONUP         = 0x020C,
	WM_XBUTTONDBLCLK     = 0x020D,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		WM_MOUSEHWHEEL = 0x020E,
}
enum WM_MOUSELAST = 0x020E;

enum WHEEL_DELTA = 120;

pure nothrow
short GET_WHEEL_DELTA_WPARAM(WPARAM wParam)
{
	return cast(short)HIWORD(wParam);
}
enum WHEEL_PAGESCROLL = UINT_MAX;

pure nothrow
int GET_KEYSTATE_WPARAM(WPARAM wParam)
{
	return LOWORD(wParam);
}

pure nothrow
short GET_NCHITTEST_WPARAM(WPARAM wParam)
{
	return cast(short)LOWORD(wParam);
}

pure nothrow
int GET_XBUTTON_WPARAM(WPARAM wParam)
{
	return HIWORD(wParam);
}
enum {
	XBUTTON1 = 0x0001,
	XBUTTON2 = 0x0002,
}

enum {
	WM_PARENTNOTIFY   = 0x0210,
	WM_ENTERMENULOOP  = 0x0211,
	WM_EXITMENULOOP   = 0x0212,
	WM_NEXTMENU       = 0x0213,
	WM_SIZING         = 0x0214,
	WM_CAPTURECHANGED = 0x0215,
	WM_MOVING         = 0x0216,
}

enum WM_POWERBROADCAST = 0x0218;

version(all){ // !_WIN32_WCE
	enum {
		PBT_APMQUERYSUSPEND       = 0x0000,
		PBT_APMQUERYSTANDBY       = 0x0001,
		PBT_APMQUERYSUSPENDFAILED = 0x0002,
		PBT_APMQUERYSTANDBYFAILED = 0x0003,
		PBT_APMSUSPEND            = 0x0004,
		PBT_APMSTANDBY            = 0x0005,
		PBT_APMRESUMECRITICAL     = 0x0006,
		PBT_APMRESUMESUSPEND      = 0x0007,
		PBT_APMRESUMESTANDBY      = 0x0008,
		PBTF_APMRESUMEFROMFAILURE = 0x00000001,
		PBT_APMBATTERYLOW         = 0x0009,
		PBT_APMPOWERSTATUSCHANGE  = 0x000A,
		PBT_APMOEMEVENT           = 0x000B,
		PBT_APMRESUMEAUTOMATIC    = 0x0012,
	}
	//(_WIN32_WINNT >= 0x0502)
		enum PBT_POWERSETTINGCHANGE = 0x8013;
		struct POWERBROADCAST_SETTING {
			GUID PowerSetting;
			DWORD DataLength;
			UCHAR[1] Data;
		}
		alias POWERBROADCAST_SETTING* PPOWERBROADCAST_SETTING;
}

enum WM_DEVICECHANGE = 0x0219;
enum {
	WM_MDICREATE      = 0x0220,
	WM_MDIDESTROY     = 0x0221,
	WM_MDIACTIVATE    = 0x0222,
	WM_MDIRESTORE     = 0x0223,
	WM_MDINEXT        = 0x0224,
	WM_MDIMAXIMIZE    = 0x0225,
	WM_MDITILE        = 0x0226,
	WM_MDICASCADE     = 0x0227,
	WM_MDIICONARRANGE = 0x0228,
	WM_MDIGETACTIVE   = 0x0229,
	WM_MDISETMENU     = 0x0230,
	WM_ENTERSIZEMOVE  = 0x0231,
	WM_EXITSIZEMOVE   = 0x0232,
	WM_DROPFILES      = 0x0233,
	WM_MDIREFRESHMENU = 0x0234,
}
//(WINVER >= _WIN32_WINNT_WIN7)
	enum WM_TOUCH = 0x0240;

enum {
	WM_IME_SETCONTEXT      = 0x0281,
	WM_IME_NOTIFY          = 0x0282,
	WM_IME_CONTROL         = 0x0283,
	WM_IME_COMPOSITIONFULL = 0x0284,
	WM_IME_SELECT          = 0x0285,
	WM_IME_CHAR            = 0x0286,
	WM_IME_REQUEST         = 0x0288,
	WM_IME_KEYDOWN         = 0x0290,
	WM_IME_KEYUP           = 0x0291,
	WM_MOUSEHOVER          = 0x02A1,
	WM_MOUSELEAVE          = 0x02A3,
	WM_NCMOUSEHOVER        = 0x02A0,
	WM_NCMOUSELEAVE        = 0x02A2,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		WM_WTSSESSION_CHANGE = 0x02B1,
		WM_TABLET_FIRST      = 0x02c0,
		WM_TABLET_LAST       = 0x02df,
	WM_CUT               = 0x0300,
	WM_COPY              = 0x0301,
	WM_PASTE             = 0x0302,
	WM_CLEAR             = 0x0303,
	WM_UNDO              = 0x0304,
	WM_RENDERFORMAT      = 0x0305,
	WM_RENDERALLFORMATS  = 0x0306,
	WM_DESTROYCLIPBOARD  = 0x0307,
	WM_DRAWCLIPBOARD     = 0x0308,
	WM_PAINTCLIPBOARD    = 0x0309,
	WM_VSCROLLCLIPBOARD  = 0x030A,
	WM_SIZECLIPBOARD     = 0x030B,
	WM_ASKCBFORMATNAME   = 0x030C,
	WM_CHANGECBCHAIN     = 0x030D,
	WM_HSCROLLCLIPBOARD  = 0x030E,
	WM_QUERYNEWPALETTE   = 0x030F,
	WM_PALETTEISCHANGING = 0x0310,
	WM_PALETTECHANGED    = 0x0311,
	WM_HOTKEY            = 0x0312,
	WM_PRINT             = 0x0317,
	WM_PRINTCLIENT       = 0x0318,
	WM_APPCOMMAND        = 0x0319,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		WM_THEMECHANGED = 0x031A,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		WM_CLIPBOARDUPDATE = 0x031D,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		WM_DWMCOMPOSITIONCHANGED       = 0x031E,
		WM_DWMNCRENDERINGCHANGED       = 0x031F,
		WM_DWMCOLORIZATIONCOLORCHANGED = 0x0320,
		WM_DWMWINDOWMAXIMIZEDCHANGE    = 0x0321,
	//(_WIN32_WINNT >= _WIN32_WINNT_WIN7)
		WM_DWMSENDICONICTHUMBNAIL         = 0x0323,
		WM_DWMSENDICONICLIVEPREVIEWBITMAP = 0x0326,
	//(WINVER >= _WIN32_WINNT_VISTA)
		WM_GETTITLEBARINFOEX = 0x033F,

	WM_HANDHELDFIRST = 0x0358,
	WM_HANDHELDLAST  = 0x035F,
	WM_AFXFIRST      = 0x0360,
	WM_AFXLAST       = 0x037F,
	WM_PENWINFIRST = 0x0380,
	WM_PENWINLAST  = 0x038F,
	WM_APP = 0x8000,
	WM_USER = 0x0400,
}

enum {
	WMSZ_LEFT        = 1,
	WMSZ_RIGHT       = 2,
	WMSZ_TOP         = 3,
	WMSZ_TOPLEFT     = 4,
	WMSZ_TOPRIGHT    = 5,
	WMSZ_BOTTOM      = 6,
	WMSZ_BOTTOMLEFT  = 7,
	WMSZ_BOTTOMRIGHT = 8,
}

enum {
	HTERROR       = -2,
	HTTRANSPARENT = -1,
	HTNOWHERE     = 0,
	HTCLIENT      = 1,
	HTCAPTION     = 2,
	HTSYSMENU     = 3,
	HTGROWBOX     = 4,
	HTSIZE        = HTGROWBOX,
	HTMENU        = 5,
	HTHSCROLL     = 6,
	HTVSCROLL     = 7,
	HTMINBUTTON   = 8,
	HTMAXBUTTON   = 9,
	HTLEFT        = 10,
	HTRIGHT       = 11,
	HTTOP         = 12,
	HTTOPLEFT     = 13,
	HTTOPRIGHT    = 14,
	HTBOTTOM      = 15,
	HTBOTTOMLEFT  = 16,
	HTBOTTOMRIGHT = 17,
	HTBORDER      = 18,
	HTREDUCE      = HTMINBUTTON,
	HTZOOM        = HTMAXBUTTON,
	HTSIZEFIRST   = HTLEFT,
	HTSIZELAST    = HTBOTTOMRIGHT,
	HTOBJECT      = 19,
	HTCLOSE       = 20,
	HTHELP        = 21,
}

enum {
	SMTO_NORMAL             = 0x0000,
	SMTO_BLOCK              = 0x0001,
	SMTO_ABORTIFHUNG        = 0x0002,
	SMTO_NOTIMEOUTIFNOTHUNG = 0x0008,
	//(WINVER >= _WIN32_WINNT_VISTA)
		SMTO_ERRORONEXIT = 0x0020,
}
enum {
	MA_ACTIVATE         = 1,
	MA_ACTIVATEANDEAT   = 2,
	MA_NOACTIVATE       = 3,
	MA_NOACTIVATEANDEAT = 4,
}
enum {
	ICON_SMALL = 0,
	ICON_BIG   = 1,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		ICON_SMALL2 = 2,
}

export extern(Windows) UINT RegisterWindowMessageA(LPCSTR lpString);
export extern(Windows) UINT RegisterWindowMessageW(LPCWSTR lpString);
version(UNICODE)
	alias RegisterWindowMessageW RegisterWindowMessage;
else
	alias RegisterWindowMessageA RegisterWindowMessage;

enum {
	SIZE_RESTORED  = 0,
	SIZE_MINIMIZED = 1,
	SIZE_MAXIMIZED = 2,
	SIZE_MAXSHOW   = 3,
	SIZE_MAXHIDE   = 4,
}

enum {
	SIZENORMAL     = SIZE_RESTORED,
	SIZEICONIC     = SIZE_MINIMIZED,
	SIZEFULLSCREEN = SIZE_MAXIMIZED,
	SIZEZOOMSHOW   = SIZE_MAXSHOW,
	SIZEZOOMHIDE   = SIZE_MAXHIDE,
}

struct WINDOWPOS {
	HWND hwnd;
	HWND hwndInsertAfter;
	int x;
	int y;
	int cx;
	int cy;
	UINT flags;
}
alias WINDOWPOS* LPWINDOWPOS;
alias WINDOWPOS* PWINDOWPOS;

struct NCCALCSIZE_PARAMS {
	RECT[3] rgrc;
	PWINDOWPOS lppos;
}
alias NCCALCSIZE_PARAMS* LPNCCALCSIZE_PARAMS;

enum {
	WVR_ALIGNTOP    = 0x0010,
	WVR_ALIGNLEFT   = 0x0020,
	WVR_ALIGNBOTTOM = 0x0040,
	WVR_ALIGNRIGHT  = 0x0080,
	WVR_HREDRAW     = 0x0100,
	WVR_VREDRAW     = 0x0200,
	WVR_REDRAW      = WVR_HREDRAW | WVR_VREDRAW,
	WVR_VALIDRECTS  = 0x0400,
}

enum {
	MK_LBUTTON  = 0x0001,
	MK_RBUTTON  = 0x0002,
	MK_SHIFT    = 0x0004,
	MK_CONTROL  = 0x0008,
	MK_MBUTTON  = 0x0010,
	MK_XBUTTON1 = 0x0020,
	MK_XBUTTON2 = 0x0040,
}

enum {
	TME_HOVER     = 0x00000001,
	TME_LEAVE     = 0x00000002,
	TME_NONCLIENT = 0x00000010,
	TME_QUERY     = 0x40000000,
	TME_CANCEL    = 0x80000000,
	HOVER_DEFAULT = 0xFFFFFFFF,
}

struct TRACKMOUSEEVENT {
	DWORD cbSize;
	DWORD dwFlags;
	HWND hwndTrack;
	DWORD dwHoverTime;
}
alias TRACKMOUSEEVENT* LPTRACKMOUSEEVENT;

export extern(Windows) BOOL TrackMouseEvent(LPTRACKMOUSEEVENT lpEventTrack);

enum {
	WS_OVERLAPPED   = 0x00000000,
	WS_POPUP        = 0x80000000,
	WS_CHILD        = 0x40000000,
	WS_MINIMIZE     = 0x20000000,
	WS_VISIBLE      = 0x10000000,
	WS_DISABLED     = 0x08000000,
	WS_CLIPSIBLINGS = 0x04000000,
	WS_CLIPCHILDREN = 0x02000000,
	WS_MAXIMIZE     = 0x01000000,
	WS_CAPTION      = 0x00C00000,
	WS_BORDER       = 0x00800000,
	WS_DLGFRAME     = 0x00400000,
	WS_VSCROLL      = 0x00200000,
	WS_HSCROLL      = 0x00100000,
	WS_SYSMENU      = 0x00080000,
	WS_THICKFRAME   = 0x00040000,
	WS_GROUP        = 0x00020000,
	WS_TABSTOP      = 0x00010000,
	WS_MINIMIZEBOX  = 0x00020000,
	WS_MAXIMIZEBOX  = 0x00010000,
}

enum {
	WS_TILED               = WS_OVERLAPPED,
	WS_ICONIC              = WS_MINIMIZE,
	WS_SIZEBOX             = WS_THICKFRAME,
	WS_OVERLAPPEDWINDOW    = WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU | WS_THICKFRAME | WS_MINIMIZEBOX | WS_MAXIMIZEBOX,
	WS_TILEDWINDOW         = WS_OVERLAPPEDWINDOW,
	WS_POPUPWINDOW         = WS_POPUP | WS_BORDER | WS_SYSMENU,
	WS_CHILDWINDOW         = WS_CHILD,
	WS_EX_DLGMODALFRAME    = 0x00000001,
	WS_EX_NOPARENTNOTIFY   = 0x00000004,
	WS_EX_TOPMOST          = 0x00000008,
	WS_EX_ACCEPTFILES      = 0x00000010,
	WS_EX_TRANSPARENT      = 0x00000020,
	WS_EX_MDICHILD         = 0x00000040,
	WS_EX_TOOLWINDOW       = 0x00000080,
	WS_EX_WINDOWEDGE       = 0x00000100,
	WS_EX_CLIENTEDGE       = 0x00000200,
	WS_EX_CONTEXTHELP      = 0x00000400,
	WS_EX_RIGHT            = 0x00001000,
	WS_EX_LEFT             = 0x00000000,
	WS_EX_RTLREADING       = 0x00002000,
	WS_EX_LTRREADING       = 0x00000000,
	WS_EX_LEFTSCROLLBAR    = 0x00004000,
	WS_EX_RIGHTSCROLLBAR   = 0x00000000,
	WS_EX_CONTROLPARENT    = 0x00010000,
	WS_EX_STATICEDGE       = 0x00020000,
	WS_EX_APPWINDOW        = 0x00040000,
	WS_EX_OVERLAPPEDWINDOW = WS_EX_WINDOWEDGE | WS_EX_CLIENTEDGE,
	WS_EX_PALETTEWINDOW    = WS_EX_WINDOWEDGE | WS_EX_TOOLWINDOW | WS_EX_TOPMOST,
	WS_EX_LAYERED          = 0x00080000,
	WS_EX_NOINHERITLAYOUT  = 0x00100000,
	WS_EX_LAYOUTRTL        = 0x00400000,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		WS_EX_COMPOSITED = 0x02000000L,
		WS_EX_NOACTIVATE = 0x08000000L,
}

enum {
	CS_VREDRAW         = 0x0001,
	CS_HREDRAW         = 0x0002,
	CS_DBLCLKS         = 0x0008,
	CS_OWNDC           = 0x0020,
	CS_CLASSDC         = 0x0040,
	CS_PARENTDC        = 0x0080,
	CS_NOCLOSE         = 0x0200,
	CS_SAVEBITS        = 0x0800,
	CS_BYTEALIGNCLIENT = 0x1000,
	CS_BYTEALIGNWINDOW = 0x2000,
	CS_GLOBALCLASS     = 0x4000,
	CS_IME             = 0x00010000,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		CS_DROPSHADOW = 0x00020000,
}

enum {
	PRF_CHECKVISIBLE = 0x00000001,
	PRF_NONCLIENT    = 0x00000002,
	PRF_CLIENT       = 0x00000004,
	PRF_ERASEBKGND   = 0x00000008,
	PRF_CHILDREN     = 0x00000010,
	PRF_OWNED        = 0x00000020,
}

enum {
	BDR_RAISEDOUTER = 0x0001,
	BDR_SUNKENOUTER = 0x0002,
	BDR_RAISEDINNER = 0x0004,
	BDR_SUNKENINNER = 0x0008,
	BDR_OUTER       = BDR_RAISEDOUTER | BDR_SUNKENOUTER,
	BDR_INNER       = BDR_RAISEDINNER | BDR_SUNKENINNER,
	BDR_RAISED      = BDR_RAISEDOUTER | BDR_RAISEDINNER,
	BDR_SUNKEN      = BDR_SUNKENOUTER | BDR_SUNKENINNER,
}

enum {
	EDGE_RAISED = BDR_RAISEDOUTER | BDR_RAISEDINNER,
	EDGE_SUNKEN = BDR_SUNKENOUTER | BDR_SUNKENINNER,
	EDGE_ETCHED = BDR_SUNKENOUTER | BDR_RAISEDINNER,
	EDGE_BUMP   = BDR_RAISEDOUTER | BDR_SUNKENINNER,
}

enum {
	BF_LEFT                    = 0x0001,
	BF_TOP                     = 0x0002,
	BF_RIGHT                   = 0x0004,
	BF_BOTTOM                  = 0x0008,
	BF_TOPLEFT                 = BF_TOP | BF_LEFT,
	BF_TOPRIGHT                = BF_TOP | BF_RIGHT,
	BF_BOTTOMLEFT              = BF_BOTTOM | BF_LEFT,
	BF_BOTTOMRIGHT             = BF_BOTTOM | BF_RIGHT,
	BF_RECT                    = BF_LEFT | BF_TOP | BF_RIGHT | BF_BOTTOM,
	BF_DIAGONAL                = 0x0010,
	BF_DIAGONAL_ENDTOPRIGHT    = BF_DIAGONAL | BF_TOP | BF_RIGHT,
	BF_DIAGONAL_ENDTOPLEFT     = BF_DIAGONAL | BF_TOP | BF_LEFT,
	BF_DIAGONAL_ENDBOTTOMLEFT  = BF_DIAGONAL | BF_BOTTOM | BF_LEFT,
	BF_DIAGONAL_ENDBOTTOMRIGHT = BF_DIAGONAL | BF_BOTTOM | BF_RIGHT,
	BF_MIDDLE                  = 0x0800,
	BF_SOFT                    = 0x1000,
	BF_ADJUST                  = 0x2000,
	BF_FLAT                    = 0x4000,
	BF_MONO                    = 0x8000,
}

export extern(Windows) BOOL DrawEdge(HDC hdc, LPRECT qrc, UINT edge, UINT grfFlags);

enum {
	DFC_CAPTION   = 1,
	DFC_MENU      = 2,
	DFC_SCROLL    = 3,
	DFC_BUTTON    = 4,
	DFC_POPUPMENU = 5,
}

enum {
	DFCS_CAPTIONCLOSE        = 0x0000,
	DFCS_CAPTIONMIN          = 0x0001,
	DFCS_CAPTIONMAX          = 0x0002,
	DFCS_CAPTIONRESTORE      = 0x0003,
	DFCS_CAPTIONHELP         = 0x0004,
	DFCS_MENUARROW           = 0x0000,
	DFCS_MENUCHECK           = 0x0001,
	DFCS_MENUBULLET          = 0x0002,
	DFCS_MENUARROWRIGHT      = 0x0004,
	DFCS_SCROLLUP            = 0x0000,
	DFCS_SCROLLDOWN          = 0x0001,
	DFCS_SCROLLLEFT          = 0x0002,
	DFCS_SCROLLRIGHT         = 0x0003,
	DFCS_SCROLLCOMBOBOX      = 0x0005,
	DFCS_SCROLLSIZEGRIP      = 0x0008,
	DFCS_SCROLLSIZEGRIPRIGHT = 0x0010,
	DFCS_BUTTONCHECK         = 0x0000,
	DFCS_BUTTONRADIOIMAGE    = 0x0001,
	DFCS_BUTTONRADIOMASK     = 0x0002,
	DFCS_BUTTONRADIO         = 0x0004,
	DFCS_BUTTON3STATE        = 0x0008,
	DFCS_BUTTONPUSH          = 0x0010,
	DFCS_INACTIVE            = 0x0100,
	DFCS_PUSHED              = 0x0200,
	DFCS_CHECKED             = 0x0400,
	DFCS_TRANSPARENT         = 0x0800,
	DFCS_HOT                 = 0x1000,
	DFCS_ADJUSTRECT          = 0x2000,
	DFCS_FLAT                = 0x4000,
	DFCS_MONO                = 0x8000,
}

export extern(Windows) BOOL DrawFrameControl(HDC, LPRECT, UINT, UINT);

enum {
	DC_ACTIVE   = 0x0001,
	DC_SMALLCAP = 0x0002,
	DC_ICON     = 0x0004,
	DC_TEXT     = 0x0008,
	DC_INBUTTON = 0x0010,
	DC_GRADIENT = 0x0020,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		DC_BUTTONS = 0x1000,
}

export extern(Windows) BOOL DrawCaption(HWND hwnd, HDC hdc, const(RECT)* lprect, UINT flags);

enum {
	IDANI_OPEN    = 1,
	IDANI_CAPTION = 3,
}

export extern(Windows) BOOL DrawAnimatedRects(HWND hwnd, int idAni, const(RECT)* lprcFrom, const(RECT)* lprcTo);

enum {
	CF_TEXT         = 1,
	CF_BITMAP       = 2,
	CF_METAFILEPICT = 3,
	CF_SYLK         = 4,
	CF_DIF          = 5,
	CF_TIFF         = 6,
	CF_OEMTEXT      = 7,
	CF_DIB          = 8,
	CF_PALETTE      = 9,
	CF_PENDATA      = 10,
	CF_RIFF         = 11,
	CF_WAVE         = 12,
	CF_UNICODETEXT  = 13,
	CF_ENHMETAFILE  = 14,
	CF_HDROP        = 15,
	CF_LOCALE       = 16,
	CF_DIBV5        = 17,
}
enum CF_MAX = 18;

enum {
	CF_OWNERDISPLAY    = 0x0080,
	CF_DSPTEXT         = 0x0081,
	CF_DSPBITMAP       = 0x0082,
	CF_DSPMETAFILEPICT = 0x0083,
	CF_DSPENHMETAFILE  = 0x008E,
	CF_PRIVATEFIRST    = 0x0200,
	CF_PRIVATELAST     = 0x02FF,
	CF_GDIOBJFIRST     = 0x0300,
	CF_GDIOBJLAST      = 0x03FF,
}

enum {
	FVIRTKEY  = TRUE,
	FNOINVERT = 0x02,
	FSHIFT    = 0x04,
	FCONTROL  = 0x08,
	FALT      = 0x10,
}

struct ACCEL {
	BYTE fVirt;
	WORD key;
	WORD cmd;
}
alias ACCEL* LPACCEL;

struct PAINTSTRUCT {
	HDC hdc;
	BOOL fErase;
	RECT rcPaint;
	BOOL fRestore;
	BOOL fIncUpdate;
	BYTE[32] rgbReserved;
}
alias PAINTSTRUCT* PPAINTSTRUCT;
alias PAINTSTRUCT* NPPAINTSTRUCT;
alias PAINTSTRUCT* LPPAINTSTRUCT;

struct CREATESTRUCTA {
	LPVOID lpCreateParams;
	HINSTANCE hInstance;
	HMENU hMenu;
	HWND hwndParent;
	int cy;
	int cx;
	int y;
	int x;
	LONG style;
	LPCSTR lpszName;
	LPCSTR lpszClass;
	DWORD dwExStyle;
}
alias CREATESTRUCTA* LPCREATESTRUCTA;
struct CREATESTRUCTW {
	LPVOID lpCreateParams;
	HINSTANCE hInstance;
	HMENU hMenu;
	HWND hwndParent;
	int cy;
	int cx;
	int y;
	int x;
	LONG style;
	LPCWSTR lpszName;
	LPCWSTR lpszClass;
	DWORD dwExStyle;
}
alias CREATESTRUCTW* LPCREATESTRUCTW;
version(UNICODE){
	alias CREATESTRUCTW CREATESTRUCT;
	alias LPCREATESTRUCTW LPCREATESTRUCT;
}else{
	alias CREATESTRUCTA CREATESTRUCT;
	alias LPCREATESTRUCTA LPCREATESTRUCT;
}

struct WINDOWPLACEMENT {
	UINT length;
	UINT flags;
	UINT showCmd;
	POINT ptMinPosition;
	POINT ptMaxPosition;
	RECT rcNormalPosition;
}
alias WINDOWPLACEMENT* PWINDOWPLACEMENT;
alias WINDOWPLACEMENT* LPWINDOWPLACEMENT;
enum {
	WPF_SETMINPOSITION       = 0x0001,
	WPF_RESTORETOMAXIMIZED   = 0x0002,
	WPF_ASYNCWINDOWPLACEMENT = 0x0004,
}

struct NMHDR {
	HWND hwndFrom;
	UINT_PTR idFrom;
	UINT code;
}
alias NMHDR* LPNMHDR;

struct STYLESTRUCT {
	DWORD styleOld;
	DWORD styleNew;
}
alias STYLESTRUCT* LPSTYLESTRUCT;

enum {
	ODT_MENU     = 1,
	ODT_LISTBOX  = 2,
	ODT_COMBOBOX = 3,
	ODT_BUTTON   = 4,
	ODT_STATIC   = 5,
}
enum {
	ODA_DRAWENTIRE = 0x0001,
	ODA_SELECT     = 0x0002,
	ODA_FOCUS      = 0x0004,
}
enum {
	ODS_SELECTED     = 0x0001,
	ODS_GRAYED       = 0x0002,
	ODS_DISABLED     = 0x0004,
	ODS_CHECKED      = 0x0008,
	ODS_FOCUS        = 0x0010,
	ODS_DEFAULT      = 0x0020,
	ODS_COMBOBOXEDIT = 0x1000,
	ODS_HOTLIGHT     = 0x0040,
	ODS_INACTIVE     = 0x0080,
	ODS_NOACCEL      = 0x0100,
	ODS_NOFOCUSRECT  = 0x0200,
}

struct MEASUREITEMSTRUCT {
	UINT CtlType;
	UINT CtlID;
	UINT itemID;
	UINT itemWidth;
	UINT itemHeight;
	ULONG_PTR itemData;
}
alias MEASUREITEMSTRUCT* PMEASUREITEMSTRUCT;
alias MEASUREITEMSTRUCT* LPMEASUREITEMSTRUCT;

struct DRAWITEMSTRUCT {
	UINT CtlType;
	UINT CtlID;
	UINT itemID;
	UINT itemAction;
	UINT itemState;
	HWND hwndItem;
	HDC hDC;
	RECT rcItem;
	ULONG_PTR itemData;
}
alias DRAWITEMSTRUCT* PDRAWITEMSTRUCT;
alias DRAWITEMSTRUCT* LPDRAWITEMSTRUCT;

struct DELETEITEMSTRUCT {
	UINT CtlType;
	UINT CtlID;
	UINT itemID;
	HWND hwndItem;
	ULONG_PTR itemData;
}
alias DELETEITEMSTRUCT* PDELETEITEMSTRUCT;
alias DELETEITEMSTRUCT* LPDELETEITEMSTRUCT;

struct COMPAREITEMSTRUCT {
	UINT CtlType;
	UINT CtlID;
	HWND hwndItem;
	UINT itemID1;
	ULONG_PTR itemData1;
	UINT itemID2;
	ULONG_PTR itemData2;
	DWORD dwLocaleId;
}
alias COMPAREITEMSTRUCT* PCOMPAREITEMSTRUCT;
alias COMPAREITEMSTRUCT* LPCOMPAREITEMSTRUCT;

export extern(Windows) BOOL GetMessageA(LPMSG lpMsg, HWND hWnd, UINT wMsgFilterMin, UINT wMsgFilterMax);
export extern(Windows) BOOL GetMessageW(LPMSG lpMsg, HWND hWnd, UINT wMsgFilterMin, UINT wMsgFilterMax);
version(UNICODE)
	alias GetMessageW GetMessage;
else
	alias GetMessageA GetMessage;

export extern(Windows) BOOL TranslateMessage(const(MSG)* lpMsg);
export extern(Windows) LRESULT DispatchMessageA(const(MSG)* lpMsg);
export extern(Windows) LRESULT DispatchMessageW(const(MSG)* lpMsg);
version(UNICODE)
	alias DispatchMessageW DispatchMessage;
else
	alias DispatchMessageA DispatchMessage;

export extern(Windows) BOOL SetMessageQueue(int cMessagesMax);
export extern(Windows) BOOL PeekMessageA(LPMSG lpMsg, HWND hWnd, UINT wMsgFilterMin, UINT wMsgFilterMax, UINT wRemoveMsg);
export extern(Windows) BOOL PeekMessageW(LPMSG lpMsg, HWND hWnd, UINT wMsgFilterMin, UINT wMsgFilterMax, UINT wRemoveMsg);
version(UNICODE)
	alias PeekMessageW PeekMessage;
else
	alias PeekMessageA PeekMessage;

enum {
	PM_NOREMOVE = 0x0000,
	PM_REMOVE   = 0x0001,
	PM_NOYIELD  = 0x0002,
}

export extern(Windows) BOOL RegisterHotKey(HWND hWnd, int id, UINT fsModifiers, UINT vk);
export extern(Windows) BOOL UnregisterHotKey(HWND hWnd, int id);
enum {
	MOD_ALT     = 0x0001,
	MOD_CONTROL = 0x0002,
	MOD_SHIFT   = 0x0004,
	MOD_WIN     = 0x0008,
	//(WINVER >= _WIN32_WINNT_WIN7)
		MOD_NOREPEAT = 0x4000,
}
enum {
	IDHOT_SNAPWINDOW  = -1,
	IDHOT_SNAPDESKTOP = -2,
}

enum {
	ENDSESSION_LOGOFF   = 0x80000000,
	ENDSESSION_CRITICAL = 0x40000000,
	ENDSESSION_CLOSEAPP = 0x00000001,
}

enum {
	EWX_LOGOFF       = 0,
	EWX_SHUTDOWN     = 0x00000001,
	EWX_REBOOT       = 0x00000002,
	EWX_FORCE        = 0x00000004,
	EWX_POWEROFF     = 0x00000008,
	EWX_FORCEIFHUNG  = 0x00000010,
	EWX_QUICKRESOLVE = 0x00000020,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		EWX_RESTARTAPPS = 0x00000040,
}

BOOL ExitWindows(DWORD dwReserved, UINT Code)
{
	return ExitWindowsEx(EWX_LOGOFF, 0xFFFFFFFF);
}

export extern(Windows) BOOL ExitWindowsEx(UINT uFlags, DWORD dwReason);
export extern(Windows) BOOL SwapMouseButton(BOOL fSwap);
export extern(Windows) DWORD GetMessagePos();
export extern(Windows) LONG GetMessageTime();
export extern(Windows) LPARAM GetMessageExtraInfo();
static if(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	export extern(Windows) BOOL IsWow64Message();
export extern(Windows) LPARAM SetMessageExtraInfo(LPARAM lParam);
export extern(Windows) LRESULT SendMessageA(HWND hWnd, UINT Msg, WPARAM wParam, LPARAM lParam);
export extern(Windows) LRESULT SendMessageW(HWND hWnd, UINT Msg, WPARAM wParam, LPARAM lParam);
version(UNICODE)
	alias SendMessageW SendMessage;
else
	alias SendMessageA SendMessage;

export extern(Windows) LRESULT SendMessageTimeoutA(HWND hWnd, UINT Msg, WPARAM wParam, LPARAM lParam, UINT fuFlags, UINT uTimeout, PDWORD_PTR lpdwResult);
export extern(Windows) LRESULT SendMessageTimeoutW(HWND hWnd, UINT Msg, WPARAM wParam, LPARAM lParam, UINT fuFlags, UINT uTimeout, PDWORD_PTR lpdwResult);
version(UNICODE)
	alias SendMessageTimeoutW SendMessageTimeout;
else
	alias SendMessageTimeoutA SendMessageTimeout;

export extern(Windows) BOOL SendNotifyMessageA(HWND hWnd, UINT Msg, WPARAM wParam, LPARAM lParam);
export extern(Windows) BOOL SendNotifyMessageW(HWND hWnd, UINT Msg, WPARAM wParam, LPARAM lParam);
version(UNICODE)
	alias SendNotifyMessageW SendNotifyMessage;
else
	alias SendNotifyMessageA SendNotifyMessage;

export extern(Windows) BOOL SendMessageCallbackA(HWND hWnd, UINT Msg, WPARAM wParam, LPARAM lParam, SENDASYNCPROC lpResultCallBack, ULONG_PTR dwData);
export extern(Windows) BOOL SendMessageCallbackW(HWND hWnd, UINT Msg, WPARAM wParam, LPARAM lParam, SENDASYNCPROC lpResultCallBack, ULONG_PTR dwData);
version(UNICODE)
	alias SendMessageCallbackW SendMessageCallback;
else
	alias SendMessageCallbackA SendMessageCallback;

//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	struct BSMINFO {
		UINT cbSize;
		HDESK hdesk;
		HWND hwnd;
		LUID luid;
	}
	alias BSMINFO* PBSMINFO;

static if(_WIN32_WINNT >= _WIN32_WINNT_WINXP){
	export extern(Windows) int BroadcastSystemMessageExA(DWORD flags, LPDWORD lpInfo, UINT Msg, WPARAM wParam, LPARAM lParam, PBSMINFO pbsmInfo);
	export extern(Windows) int BroadcastSystemMessageExW(DWORD flags, LPDWORD lpInfo, UINT Msg, WPARAM wParam, LPARAM lParam, PBSMINFO pbsmInfo);
	version(UNICODE)
		alias BroadcastSystemMessageExW BroadcastSystemMessageEx;
	else
		alias BroadcastSystemMessageExA BroadcastSystemMessageEx;
}

export extern(Windows) int BroadcastSystemMessageA(DWORD flags, LPDWORD lpInfo, UINT Msg, WPARAM wParam, LPARAM lParam);
export extern(Windows) int BroadcastSystemMessageW(DWORD flags, LPDWORD lpInfo, UINT Msg, WPARAM wParam, LPARAM lParam);
version(UNICODE)
	alias BroadcastSystemMessageW BroadcastSystemMessage;
else
	alias BroadcastSystemMessageA BroadcastSystemMessage;

enum {
	BSM_ALLCOMPONENTS      = 0x00000000,
	BSM_VXDS               = 0x00000001,
	BSM_NETDRIVER          = 0x00000002,
	BSM_INSTALLABLEDRIVERS = 0x00000004,
	BSM_APPLICATIONS       = 0x00000008,
	BSM_ALLDESKTOPS        = 0x00000010,
}
enum {
	BSF_QUERY              = 0x00000001,
	BSF_IGNORECURRENTTASK  = 0x00000002,
	BSF_FLUSHDISK          = 0x00000004,
	BSF_NOHANG             = 0x00000008,
	BSF_POSTMESSAGE        = 0x00000010,
	BSF_FORCEIFHUNG        = 0x00000020,
	BSF_NOTIMEOUTIFNOTHUNG = 0x00000040,
	BSF_ALLOWSFW           = 0x00000080,
	BSF_SENDNOTIFYMESSAGE  = 0x00000100,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP){
		BSF_RETURNHDESK = 0x00000200,
		BSF_LUID        = 0x00000400,
}
enum BROADCAST_QUERY_DENY = 0x424D5144;

enum HDEVNOTIFY : PVOID {init = (PVOID).init}
alias HDEVNOTIFY* PHDEVNOTIFY;

enum {
	DEVICE_NOTIFY_WINDOW_HANDLE  = 0x00000000,
	DEVICE_NOTIFY_SERVICE_HANDLE = 0x00000001,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		DEVICE_NOTIFY_ALL_INTERFACE_CLASSES = 0x00000004,
}

export extern(Windows) HDEVNOTIFY RegisterDeviceNotificationA(HANDLE hRecipient, LPVOID NotificationFilter, DWORD Flags);
export extern(Windows) HDEVNOTIFY RegisterDeviceNotificationW(HANDLE hRecipient, LPVOID NotificationFilter, DWORD Flags);
version(UNICODE)
	alias RegisterDeviceNotificationW RegisterDeviceNotification;
else
	alias RegisterDeviceNotificationA RegisterDeviceNotification;

export extern(Windows) BOOL UnregisterDeviceNotification(HDEVNOTIFY Handle);

//(_WIN32_WINNT >= _WIN32_WINNT_WS03)
	enum HPOWERNOTIFY : PVOID {init = (PVOID).init}
	alias HPOWERNOTIFY* PHPOWERNOTIFY;
static if(_WIN32_WINNT >= _WIN32_WINNT_WS03){
	export extern(Windows) HPOWERNOTIFY RegisterPowerSettingNotification(HANDLE hRecipient, LPCGUID PowerSettingGuid, DWORD Flags);
	export extern(Windows) BOOL UnregisterPowerSettingNotification(HPOWERNOTIFY Handle);
}


export extern(Windows) BOOL PostMessageA(HWND hWnd, UINT Msg, WPARAM wParam, LPARAM lParam);
export extern(Windows) BOOL PostMessageW(HWND hWnd, UINT Msg, WPARAM wParam, LPARAM lParam);
version(UNICODE)
	alias PostMessageW PostMessage;
else
	alias PostMessageA PostMessage;

export extern(Windows) BOOL PostThreadMessageA(DWORD idThread, UINT Msg, WPARAM wParam, LPARAM lParam);
export extern(Windows) BOOL PostThreadMessageW(DWORD idThread, UINT Msg, WPARAM wParam, LPARAM lParam);
version(UNICODE)
	alias PostThreadMessageW PostThreadMessage;
else
	alias PostThreadMessageA PostThreadMessage;

alias PostThreadMessageA PostAppMessageA;
alias PostThreadMessageW PostAppMessageW;
version(UNICODE)
	alias PostAppMessageW PostAppMessage;
else
	alias PostAppMessageA PostAppMessage;

const HWND HWND_BROADCAST = cast(HWND)0xffff;
const HWND HWND_MESSAGE = cast(HWND)-3;

export extern(Windows) BOOL AttachThreadInput(DWORD idAttach, DWORD idAttachTo, BOOL fAttach);
export extern(Windows) BOOL ReplyMessage(LRESULT lResult);
export extern(Windows) BOOL WaitMessage();
export extern(Windows) DWORD WaitForInputIdle(HANDLE hProcess, DWORD dwMilliseconds);
export extern(Windows) LRESULT DefWindowProcA(HWND hWnd, UINT Msg, WPARAM wParam, LPARAM lParam);
export extern(Windows) LRESULT DefWindowProcW(HWND hWnd, UINT Msg, WPARAM wParam, LPARAM lParam);
version(UNICODE)
	alias DefWindowProcW DefWindowProc;
else
	alias DefWindowProcA DefWindowProc;

export extern(Windows) VOID PostQuitMessage(int nExitCode);
export extern(Windows) LRESULT CallWindowProcA(WNDPROC lpPrevWndFunc, HWND hWnd, UINT Msg, WPARAM wParam, LPARAM lParam);
export extern(Windows) LRESULT CallWindowProcW(WNDPROC lpPrevWndFunc, HWND hWnd, UINT Msg, WPARAM wParam, LPARAM lParam);
version(UNICODE)
	alias CallWindowProcW CallWindowProc;
else
	alias CallWindowProcA CallWindowProc;

export extern(Windows) BOOL InSendMessage();

export extern(Windows) DWORD InSendMessageEx(LPVOID lpReserved);
enum {
	ISMEX_NOSEND   = 0x00000000,
	ISMEX_SEND     = 0x00000001,
	ISMEX_NOTIFY   = 0x00000002,
	ISMEX_CALLBACK = 0x00000004,
	ISMEX_REPLIED  = 0x00000008,
}


export extern(Windows) UINT GetDoubleClickTime();
export extern(Windows) BOOL SetDoubleClickTime(UINT);
export extern(Windows) ATOM RegisterClassA(const(WNDCLASSA)* lpWndClass);
export extern(Windows) ATOM RegisterClassW(const(WNDCLASSW)* lpWndClass);
version(UNICODE)
	alias RegisterClassW RegisterClass;
else
	alias RegisterClassA RegisterClass;

export extern(Windows) BOOL UnregisterClassA(LPCSTR lpClassName, HINSTANCE hInstance);
export extern(Windows) BOOL UnregisterClassW(LPCWSTR lpClassName, HINSTANCE hInstance);
version(UNICODE)
	alias UnregisterClassW UnregisterClass;
else
	alias UnregisterClassA UnregisterClass;

export extern(Windows) BOOL GetClassInfoA(HINSTANCE hInstance, LPCSTR lpClassName, LPWNDCLASSA lpWndClass);
export extern(Windows) BOOL GetClassInfoW(HINSTANCE hInstance, LPCWSTR lpClassName, LPWNDCLASSW lpWndClass);
version(UNICODE)
	alias GetClassInfoW GetClassInfo;
else
	alias GetClassInfoA GetClassInfo;

export extern(Windows) ATOM RegisterClassExA(const(WNDCLASSEXA)*);
export extern(Windows) ATOM RegisterClassExW(const(WNDCLASSEXW)*);
version(UNICODE)
	alias RegisterClassExW RegisterClassEx;
else
	alias RegisterClassExA RegisterClassEx;
export extern(Windows) BOOL GetClassInfoExA(HINSTANCE hInstance, LPCSTR lpszClass, LPWNDCLASSEXA lpwcx);
export extern(Windows) BOOL GetClassInfoExW(HINSTANCE hInstance, LPCWSTR lpszClass, LPWNDCLASSEXW lpwcx);
version(UNICODE)
	alias GetClassInfoExW GetClassInfoEx;
else
	alias GetClassInfoExA GetClassInfoEx;

enum CW_USEDEFAULT = 0x80000000;

const HWND HWND_DESKTOP = cast(HWND)0;

static if(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	alias extern(Windows) BOOLEAN function(LPCWSTR) PREGISTERCLASSNAMEW;

export extern(Windows) HWND CreateWindowExA(DWORD dwExStyle, LPCSTR lpClassName, LPCSTR lpWindowName, DWORD dwStyle, int X, int Y, int nWidth, int nHeight, HWND hWndParent, HMENU hMenu, HINSTANCE hInstance, LPVOID lpParam);
export extern(Windows) HWND CreateWindowExW(DWORD dwExStyle, LPCWSTR lpClassName, LPCWSTR lpWindowName, DWORD dwStyle, int X, int Y, int nWidth, int nHeight, HWND hWndParent, HMENU hMenu, HINSTANCE hInstance, LPVOID lpParam);
version(UNICODE)
	alias CreateWindowExW CreateWindowEx;
else
	alias CreateWindowExA CreateWindowEx;

export extern(Windows) BOOL IsWindow(HWND hWnd);
export extern(Windows) BOOL IsMenu(HMENU hMenu);

export extern(Windows) BOOL IsChild(HWND hWndParent, HWND hWnd);
export extern(Windows) BOOL DestroyWindow(HWND hWnd);

export extern(Windows) BOOL ShowWindow(HWND hWnd, int nCmdShow);

export extern(Windows) BOOL AnimateWindow(HWND hWnd, DWORD dwTime, DWORD dwFlags);

export extern(Windows) BOOL UpdateLayeredWindow(HWND hWnd, HDC hdcDst, POINT* pptDst, SIZE* psize, HDC hdcSrc, POINT* pptSrc, COLORREF crKey, BLENDFUNCTION* pblend, DWORD dwFlags);

struct UPDATELAYEREDWINDOWINFO {
	DWORD cbSize;
	HDC hdcDst;
	const(POINT)* pptDst;
	const(SIZE)* psize;
	HDC hdcSrc;
	const(POINT)* pptSrc;
	COLORREF crKey;
	const(BLENDFUNCTION)* pblend;
	DWORD dwFlags;
	const(RECT)* prcDirty;
}
alias UPDATELAYEREDWINDOWINFO* PUPDATELAYEREDWINDOWINFO;

static if(_WIN32_WINNT < _WIN32_WINNT_WS03)
	alias extern(Windows) BOOL function(HWND hWnd, const(UPDATELAYEREDWINDOWINFO)* pULWInfo) UpdateLayeredWindowIndirect;
else
	export extern(Windows) BOOL UpdateLayeredWindowIndirect(HWND hWnd, const(UPDATELAYEREDWINDOWINFO)* pULWInfo);

static if(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	export extern(Windows) BOOL GetLayeredWindowAttributes(HWND hwnd, COLORREF* pcrKey, BYTE* pbAlpha, DWORD* pdwFlags);

//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	enum PW_CLIENTONLY = 0x00000001;

static if(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	export extern(Windows) BOOL PrintWindow(HWND hwnd, HDC hdcBlt, UINT nFlags);

export extern(Windows) BOOL SetLayeredWindowAttributes(HWND hwnd, COLORREF crKey, BYTE bAlpha, DWORD dwFlags);

enum {
	LWA_COLORKEY = 0x00000001,
	LWA_ALPHA    = 0x00000002,
}

enum {
	ULW_COLORKEY    = 0x00000001,
	ULW_ALPHA       = 0x00000002,
	ULW_OPAQUE      = 0x00000004,
	ULW_EX_NORESIZE = 0x00000008,
}

export extern(Windows) BOOL ShowWindowAsync(HWND hWnd, int nCmdShow);

export extern(Windows) BOOL FlashWindow(HWND hWnd, BOOL bInvert);

struct FLASHWINFO {
	UINT cbSize;
	HWND hwnd;
	DWORD dwFlags;
	UINT uCount;
	DWORD dwTimeout;
}
alias FLASHWINFO* PFLASHWINFO;

export extern(Windows) BOOL FlashWindowEx(PFLASHWINFO pfwi);

enum {
	FLASHW_STOP      = 0,
	FLASHW_CAPTION   = 0x00000001,
	FLASHW_TRAY      = 0x00000002,
	FLASHW_ALL       = FLASHW_CAPTION | FLASHW_TRAY,
	FLASHW_TIMER     = 0x00000004,
	FLASHW_TIMERNOFG = 0x0000000C,
}

export extern(Windows) BOOL ShowOwnedPopups(HWND hWnd, BOOL fShow);
export extern(Windows) BOOL OpenIcon(HWND hWnd);
export extern(Windows) BOOL CloseWindow(HWND hWnd);
export extern(Windows) BOOL MoveWindow(HWND hWnd, int X, int Y, int nWidth, int nHeight, BOOL bRepaint);
export extern(Windows) BOOL SetWindowPos(HWND hWnd, HWND hWndInsertAfter, int X, int Y, int cx, int cy, UINT uFlags);
export extern(Windows) BOOL GetWindowPlacement(HWND hWnd, WINDOWPLACEMENT* lpwndpl);
export extern(Windows) BOOL SetWindowPlacement(HWND hWnd, const(WINDOWPLACEMENT)* lpwndpl);

//(_WIN32_WINNT >= _WIN32_WINNT_WIN7)
	enum {
		WDA_NONE    = 0x00000000,
		WDA_MONITOR = 0x00000001,
	}
static if(_WIN32_WINNT >= _WIN32_WINNT_WIN7){
	export extern(Windows) BOOL GetWindowDisplayAffinity(HWND hWnd, DWORD* pdwAffinity);
	export extern(Windows) BOOL SetWindowDisplayAffinity(HWND hWnd, DWORD dwAffinity);
}

export extern(Windows) HDWP BeginDeferWindowPos(int nNumWindows);
export extern(Windows) HDWP DeferWindowPos(HDWP hWinPosInfo, HWND hWnd, HWND hWndInsertAfter, int x, int y, int cx, int cy, UINT uFlags);
export extern(Windows) BOOL EndDeferWindowPos(HDWP hWinPosInfo);
export extern(Windows) BOOL IsWindowVisible(HWND hWnd);
export extern(Windows) BOOL IsIconic(HWND hWnd);
export extern(Windows) BOOL AnyPopup();
export extern(Windows) BOOL BringWindowToTop(HWND hWnd);
export extern(Windows) BOOL IsZoomed(HWND hWnd);

enum {
	SWP_NOSIZE         = 0x0001,
	SWP_NOMOVE         = 0x0002,
	SWP_NOZORDER       = 0x0004,
	SWP_NOREDRAW       = 0x0008,
	SWP_NOACTIVATE     = 0x0010,
	SWP_FRAMECHANGED   = 0x0020,
	SWP_SHOWWINDOW     = 0x0040,
	SWP_HIDEWINDOW     = 0x0080,
	SWP_NOCOPYBITS     = 0x0100,
	SWP_NOOWNERZORDER  = 0x0200,
	SWP_NOSENDCHANGING = 0x0400,
	SWP_DRAWFRAME      = SWP_FRAMECHANGED,
	SWP_NOREPOSITION   = SWP_NOOWNERZORDER,
	SWP_DEFERERASE     = 0x2000,
	SWP_ASYNCWINDOWPOS = 0x4000,
}

const HWND HWND_TOP       = cast(HWND)0;
const HWND HWND_BOTTOM    = cast(HWND)1;
const HWND HWND_TOPMOST   = cast(HWND)-1;
const HWND HWND_NOTOPMOST = cast(HWND)-2;

align(2){
	struct DLGTEMPLATE {
		DWORD style;
		DWORD dwExtendedStyle;
		WORD cdit;
		short x;
		short y;
		short cx;
		short cy;
	}
	alias DLGTEMPLATE* LPDLGTEMPLATEA;
	alias DLGTEMPLATE* LPDLGTEMPLATEW;
	version(UNICODE)
		alias LPDLGTEMPLATEW LPDLGTEMPLATE;
	else
		alias LPDLGTEMPLATEA LPDLGTEMPLATE;

	alias const(DLGTEMPLATE)* LPCDLGTEMPLATEA;
	alias const(DLGTEMPLATE)* LPCDLGTEMPLATEW;
	version(UNICODE)
		alias LPCDLGTEMPLATEW LPCDLGTEMPLATE;
	else
		alias LPCDLGTEMPLATEA LPCDLGTEMPLATE;

	struct DLGITEMTEMPLATE {
		DWORD style;
		DWORD dwExtendedStyle;
		short x;
		short y;
		short cx;
		short cy;
		WORD id;
	}
	alias DLGITEMTEMPLATE* PDLGITEMTEMPLATEA;
	alias DLGITEMTEMPLATE* PDLGITEMTEMPLATEW;
	version(UNICODE)
		alias PDLGITEMTEMPLATEW PDLGITEMTEMPLATE;
	else
		alias PDLGITEMTEMPLATEA PDLGITEMTEMPLATE;
	alias DLGITEMTEMPLATE* LPDLGITEMTEMPLATEA;
	alias DLGITEMTEMPLATE* LPDLGITEMTEMPLATEW;
	version(UNICODE)
		alias LPDLGITEMTEMPLATEW LPDLGITEMTEMPLATE;
	else
		alias LPDLGITEMTEMPLATEA LPDLGITEMTEMPLATE;
}

export extern(Windows) HWND CreateDialogParamA(HINSTANCE hInstance, LPCSTR lpTemplateName, HWND hWndParent, DLGPROC lpDialogFunc, LPARAM dwInitParam);
export extern(Windows) HWND CreateDialogParamW(HINSTANCE hInstance, LPCWSTR lpTemplateName, HWND hWndParent, DLGPROC lpDialogFunc, LPARAM dwInitParam);
version(UNICODE)
	alias CreateDialogParamW CreateDialogParam;
else
	alias CreateDialogParamA CreateDialogParam;

export extern(Windows) HWND CreateDialogIndirectParamA(HINSTANCE hInstance, LPCDLGTEMPLATEA lpTemplate, HWND hWndParent, DLGPROC lpDialogFunc, LPARAM dwInitParam);
export extern(Windows) HWND CreateDialogIndirectParamW(HINSTANCE hInstance, LPCDLGTEMPLATEW lpTemplate, HWND hWndParent, DLGPROC lpDialogFunc, LPARAM dwInitParam);
version(UNICODE)
	alias CreateDialogIndirectParamW CreateDialogIndirectParam;
else
	alias CreateDialogIndirectParamA CreateDialogIndirectParam;

export extern(Windows) INT_PTR DialogBoxParamA(HINSTANCE hInstance, LPCSTR lpTemplateName, HWND hWndParent, DLGPROC lpDialogFunc, LPARAM dwInitParam);
export extern(Windows) INT_PTR DialogBoxParamW(HINSTANCE hInstance, LPCWSTR lpTemplateName, HWND hWndParent, DLGPROC lpDialogFunc, LPARAM dwInitParam);
version(UNICODE)
	alias DialogBoxParamW DialogBoxParam;
else
	alias DialogBoxParamA DialogBoxParam;

export extern(Windows) INT_PTR DialogBoxIndirectParamA(HINSTANCE hInstance, LPCDLGTEMPLATEA hDialogTemplate, HWND hWndParent, DLGPROC lpDialogFunc, LPARAM dwInitParam);
export extern(Windows) INT_PTR DialogBoxIndirectParamW(HINSTANCE hInstance, LPCDLGTEMPLATEW hDialogTemplate, HWND hWndParent, DLGPROC lpDialogFunc, LPARAM dwInitParam);
version(UNICODE)
	alias DialogBoxIndirectParamW DialogBoxIndirectParam;
else
	alias DialogBoxIndirectParamA DialogBoxIndirectParam;

export extern(Windows) BOOL EndDialog(HWND hDlg, INT_PTR nResult);
export extern(Windows) HWND GetDlgItem(HWND hDlg, int nIDDlgItem);
export extern(Windows) BOOL SetDlgItemInt(HWND hDlg, int nIDDlgItem, UINT uValue, BOOL bSigned);
export extern(Windows) UINT GetDlgItemInt(HWND hDlg, int nIDDlgItem, BOOL* lpTranslated, BOOL bSigned);
export extern(Windows) BOOL SetDlgItemTextA(HWND hDlg, int nIDDlgItem, LPCSTR lpString);
export extern(Windows) BOOL SetDlgItemTextW(HWND hDlg, int nIDDlgItem, LPCWSTR lpString);
version(UNICODE)
	alias SetDlgItemTextW SetDlgItemText;
else
	alias SetDlgItemTextA SetDlgItemText;

export extern(Windows) UINT GetDlgItemTextA(HWND hDlg, int nIDDlgItem, LPSTR lpString, int cchMax);
export extern(Windows) UINT GetDlgItemTextW(HWND hDlg, int nIDDlgItem, LPWSTR lpString, int cchMax);
version(UNICODE)
	alias GetDlgItemTextW GetDlgItemText;
else
	alias GetDlgItemTextA GetDlgItemText;

export extern(Windows) BOOL CheckDlgButton(HWND hDlg, int nIDButton, UINT uCheck);
export extern(Windows) BOOL CheckRadioButton(HWND hDlg, int nIDFirstButton, int nIDLastButton, int nIDCheckButton);
export extern(Windows) UINT IsDlgButtonChecked(HWND hDlg, int nIDButton);
export extern(Windows) LRESULT SendDlgItemMessageA(HWND hDlg, int nIDDlgItem, UINT Msg, WPARAM wParam, LPARAM lParam);
export extern(Windows) LRESULT SendDlgItemMessageW(HWND hDlg, int nIDDlgItem, UINT Msg, WPARAM wParam, LPARAM lParam);
version(UNICODE)
	alias SendDlgItemMessageW SendDlgItemMessage;
else
	alias SendDlgItemMessageA SendDlgItemMessage;

export extern(Windows) HWND GetNextDlgGroupItem(HWND hDlg, HWND hCtl, BOOL bPrevious);
export extern(Windows) HWND GetNextDlgTabItem(HWND hDlg, HWND hCtl, BOOL bPrevious);

export extern(Windows) int GetDlgCtrlID(HWND hWnd);
export extern(Windows) int GetDialogBaseUnits();

export extern(Windows) LRESULT DefDlgProcA(HWND hDlg, UINT Msg, WPARAM wParam, LPARAM lParam);
export extern(Windows) LRESULT DefDlgProcW(HWND hDlg, UINT Msg, WPARAM wParam, LPARAM lParam);
version(UNICODE)
	alias DefDlgProcW DefDlgProc;
else
	alias DefDlgProcA DefDlgProc;

enum DLGWINDOWEXTRA = 30;

export extern(Windows) BOOL CallMsgFilterA(LPMSG lpMsg, int nCode);
export extern(Windows) BOOL CallMsgFilterW(LPMSG lpMsg, int nCode);
version(UNICODE)
	alias CallMsgFilterW CallMsgFilter;
else
	alias CallMsgFilterA CallMsgFilter;

export extern(Windows) BOOL OpenClipboard(HWND hWndNewOwner);
export extern(Windows) BOOL CloseClipboard();

export extern(Windows) DWORD GetClipboardSequenceNumber();
export extern(Windows) HWND GetClipboardOwner();
export extern(Windows) HWND SetClipboardViewer(HWND hWndNewViewer);
export extern(Windows) HWND GetClipboardViewer();
export extern(Windows) BOOL ChangeClipboardChain(HWND hWndRemove, HWND hWndNewNext);
export extern(Windows) HANDLE SetClipboardData(UINT uFormat, HANDLE hMem);
export extern(Windows) HANDLE GetClipboardData(UINT uFormat);
export extern(Windows) UINT RegisterClipboardFormatA(LPCSTR lpszFormat);
export extern(Windows) UINT RegisterClipboardFormatW(LPCWSTR lpszFormat);
version(UNICODE)
	alias RegisterClipboardFormatW RegisterClipboardFormat;
else
	alias RegisterClipboardFormatA RegisterClipboardFormat;

export extern(Windows) int CountClipboardFormats();
export extern(Windows) UINT EnumClipboardFormats(UINT format);
export extern(Windows) int GetClipboardFormatNameA(UINT format, LPSTR lpszFormatName, int cchMaxCount);
export extern(Windows) int GetClipboardFormatNameW(UINT format, LPWSTR lpszFormatName, int cchMaxCount);
version(UNICODE)
	alias GetClipboardFormatNameW GetClipboardFormatName;
else
	alias GetClipboardFormatNameA GetClipboardFormatName;

export extern(Windows) BOOL EmptyClipboard();
export extern(Windows) BOOL IsClipboardFormatAvailable(UINT format);

export extern(Windows) int GetPriorityClipboardFormat(UINT* paFormatPriorityList, int cFormats);
export extern(Windows) HWND GetOpenClipboardWindow();

static if(WINVER >= _WIN32_WINNT_VISTA){
	export extern(Windows) BOOL AddClipboardFormatListener(HWND hwnd);
	export extern(Windows) BOOL RemoveClipboardFormatListener(HWND hwnd);
	export extern(Windows) BOOL GetUpdatedClipboardFormats(PUINT lpuiFormats, UINT cFormats, PUINT pcFormatsOut);
}

export extern(Windows) BOOL CharToOemA(LPCSTR pSrc, LPSTR pDst);
export extern(Windows) BOOL CharToOemW(LPCWSTR pSrc, LPSTR pDst);
version(UNICODE)
	alias CharToOemW CharToOem;
else
	alias CharToOemA CharToOem;

export extern(Windows) BOOL OemToCharA(LPCSTR pSrc, LPSTR pDst);
export extern(Windows) BOOL OemToCharW(LPCSTR pSrc, LPWSTR pDst);
version(UNICODE)
	alias OemToCharW OemToChar;
else
	alias OemToCharA OemToChar;

export extern(Windows) BOOL CharToOemBuffA(LPCSTR lpszSrc, LPSTR lpszDst, DWORD cchDstLength);
export extern(Windows) BOOL CharToOemBuffW(LPCWSTR lpszSrc, LPSTR lpszDst, DWORD cchDstLength);
version(UNICODE)
	alias CharToOemBuffW CharToOemBuff;
else
	alias CharToOemBuffA CharToOemBuff;

export extern(Windows) BOOL OemToCharBuffA(LPCSTR lpszSrc, LPSTR lpszDst, DWORD cchDstLength);
export extern(Windows) BOOL OemToCharBuffW(LPCSTR lpszSrc, LPWSTR lpszDst, DWORD cchDstLength);
version(UNICODE)
	alias OemToCharBuffW OemToCharBuff;
else
	alias OemToCharBuffA OemToCharBuff;

export extern(Windows) LPSTR CharUpperA(LPSTR lpsz);
export extern(Windows) LPWSTR CharUpperW(LPWSTR lpsz);
version(UNICODE)
	alias CharUpperW CharUpper;
else
	alias CharUpperA CharUpper;

export extern(Windows) DWORD CharUpperBuffA(LPSTR lpsz, DWORD cchLength);
export extern(Windows) DWORD CharUpperBuffW(LPWSTR lpsz, DWORD cchLength);
version(UNICODE)
	alias CharUpperBuffW CharUpperBuff;
else
	alias CharUpperBuffA CharUpperBuff;

export extern(Windows) LPSTR CharLowerA(LPSTR lpsz);
export extern(Windows) LPWSTR CharLowerW(LPWSTR lpsz);
version(UNICODE)
	alias CharLowerW CharLower;
else
	alias CharLowerA CharLower;

export extern(Windows) DWORD CharLowerBuffA(LPSTR lpsz, DWORD cchLength);
export extern(Windows) DWORD CharLowerBuffW(LPWSTR lpsz, DWORD cchLength);
version(UNICODE)
	alias CharLowerBuffW CharLowerBuff;
else
	alias CharLowerBuffA CharLowerBuff;

export extern(Windows) LPSTR CharNextA(LPCSTR lpsz);
export extern(Windows) LPWSTR CharNextW(LPCWSTR lpsz);
version(UNICODE)
	alias CharNextW CharNext;
else
	alias CharNextA CharNext;

export extern(Windows) LPSTR CharPrevA(LPCSTR lpszStart, LPCSTR lpszCurrent);
export extern(Windows) LPWSTR CharPrevW(LPCWSTR lpszStart, LPCWSTR lpszCurrent);
version(UNICODE)
	alias CharPrevW CharPrev;
else
	alias CharPrevA CharPrev;

export extern(Windows) LPSTR CharNextExA(WORD CodePage, LPCSTR lpCurrentChar, DWORD dwFlags);
export extern(Windows) LPSTR CharPrevExA(WORD CodePage, LPCSTR lpStart, LPCSTR lpCurrentChar, DWORD dwFlags);

alias CharToOemA AnsiToOem;
alias OemToCharA OemToAnsi;
alias CharToOemBuffA AnsiToOemBuff;
alias OemToCharBuffA OemToAnsiBuff;
alias CharUpperA AnsiUpper;
alias CharUpperBuffA AnsiUpperBuff;
alias CharLowerA AnsiLower;
alias CharLowerBuffA AnsiLowerBuff;
alias CharNextA AnsiNext;
alias CharPrevA AnsiPrev;

export extern(Windows) BOOL IsCharAlphaA(CHAR ch);
export extern(Windows) BOOL IsCharAlphaW(WCHAR ch);
version(UNICODE)
	alias IsCharAlphaW IsCharAlpha;
else
	alias IsCharAlphaA IsCharAlpha;

export extern(Windows) BOOL IsCharAlphaNumericA(CHAR ch);
export extern(Windows) BOOL IsCharAlphaNumericW(WCHAR ch);
version(UNICODE)
	alias IsCharAlphaNumericW IsCharAlphaNumeric;
else
	alias IsCharAlphaNumericA IsCharAlphaNumeric;

export extern(Windows) BOOL IsCharUpperA(CHAR ch);
export extern(Windows) BOOL IsCharUpperW(WCHAR ch);
version(UNICODE)
	alias IsCharUpperW IsCharUpper;
else
	alias IsCharUpperA IsCharUpper;

export extern(Windows) BOOL IsCharLowerA(CHAR ch);
export extern(Windows) BOOL IsCharLowerW(WCHAR ch);
version(UNICODE)
	alias IsCharLowerW IsCharLower;
else
	alias IsCharLowerA IsCharLower;

export extern(Windows) HWND SetFocus(HWND hWnd);
export extern(Windows) HWND GetActiveWindow();
export extern(Windows) HWND GetFocus();
export extern(Windows) UINT GetKBCodePage();
export extern(Windows) SHORT GetKeyState(int nVirtKey);
export extern(Windows) SHORT GetAsyncKeyState(int vKey);
export extern(Windows) BOOL GetKeyboardState(PBYTE lpKeyState);
export extern(Windows) BOOL SetKeyboardState(LPBYTE lpKeyState);
export extern(Windows) int GetKeyNameTextA(LONG lParam, LPSTR lpString, int cchSize);
export extern(Windows) int GetKeyNameTextW(LONG lParam, LPWSTR lpString, int cchSize);
version(UNICODE)
	alias GetKeyNameTextW GetKeyNameText;
else
	alias GetKeyNameTextA GetKeyNameText;

export extern(Windows) int GetKeyboardType(int nTypeFlag);
export extern(Windows) int ToAscii(UINT uVirtKey, UINT uScanCode, const(BYTE)* lpKeyState, LPWORD lpChar, UINT uFlags);

export extern(Windows) int ToAsciiEx(UINT uVirtKey, UINT uScanCode, const(BYTE)* lpKeyState, LPWORD lpChar, UINT uFlags, HKL dwhkl);

export extern(Windows) int ToUnicode(UINT wVirtKey, UINT wScanCode, const(BYTE)* lpKeyState, LPWSTR pwszBuff, int cchBuff, UINT wFlags);
export extern(Windows) DWORD OemKeyScan(WORD wOemChar);

export extern(Windows) SHORT VkKeyScanA(CHAR ch);
export extern(Windows) SHORT VkKeyScanW(WCHAR ch);
version(UNICODE)
	alias VkKeyScanW VkKeyScan;
else
	alias VkKeyScanA VkKeyScan;

export extern(Windows) SHORT VkKeyScanExA(CHAR ch, HKL dwhkl);
export extern(Windows) SHORT VkKeyScanExW(WCHAR ch, HKL dwhkl);
version(UNICODE)
	alias VkKeyScanExW VkKeyScanEx;
else
	alias VkKeyScanExA VkKeyScanEx;

enum {
	KEYEVENTF_EXTENDEDKEY = 0x0001,
	KEYEVENTF_KEYUP       = 0x0002,
	KEYEVENTF_UNICODE     = 0x0004,
	KEYEVENTF_SCANCODE    = 0x0008,
}

export extern(Windows) VOID keybd_event(BYTE bVk, BYTE bScan, DWORD dwFlags, ULONG_PTR dwExtraInfo);
enum {
	MOUSEEVENTF_MOVE       = 0x0001,
	MOUSEEVENTF_LEFTDOWN   = 0x0002,
	MOUSEEVENTF_LEFTUP     = 0x0004,
	MOUSEEVENTF_RIGHTDOWN  = 0x0008,
	MOUSEEVENTF_RIGHTUP    = 0x0010,
	MOUSEEVENTF_MIDDLEDOWN = 0x0020,
	MOUSEEVENTF_MIDDLEUP   = 0x0040,
	MOUSEEVENTF_XDOWN      = 0x0080,
	MOUSEEVENTF_XUP        = 0x0100,
	MOUSEEVENTF_WHEEL      = 0x0800,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		MOUSEEVENTF_HWHEEL = 0x01000,
	//(WINVER >= _WIN32_WINNT_VISTA)
		MOUSEEVENTF_MOVE_NOCOALESCE = 0x2000,
	MOUSEEVENTF_VIRTUALDESK = 0x4000,
	MOUSEEVENTF_ABSOLUTE    = 0x8000,
}
export extern(Windows) VOID mouse_event(DWORD dwFlags, DWORD dx, DWORD dy, DWORD dwData, ULONG_PTR dwExtraInfo);

struct MOUSEINPUT {
	LONG dx;
	LONG dy;
	DWORD mouseData;
	DWORD dwFlags;
	DWORD time;
	ULONG_PTR dwExtraInfo;
}
alias MOUSEINPUT* PMOUSEINPUT;
alias MOUSEINPUT* LPMOUSEINPUT;

struct KEYBDINPUT {
	WORD wVk;
	WORD wScan;
	DWORD dwFlags;
	DWORD time;
	ULONG_PTR dwExtraInfo;
}
alias KEYBDINPUT* PKEYBDINPUT;
alias KEYBDINPUT* LPKEYBDINPUT;

struct HARDWAREINPUT {
	DWORD uMsg;
	WORD wParamL;
	WORD wParamH;
}
alias HARDWAREINPUT* PHARDWAREINPUT;
alias HARDWAREINPUT* LPHARDWAREINPUT;

enum {
	INPUT_MOUSE    = 0,
	INPUT_KEYBOARD = 1,
	INPUT_HARDWARE = 2,
}
struct INPUT {
	DWORD type;
	union {
		MOUSEINPUT mi;
		KEYBDINPUT ki;
		HARDWAREINPUT hi;
	}
}
alias INPUT* PINPUT;
alias INPUT* LPINPUT;

export extern(Windows) UINT SendInput(UINT cInputs, LPINPUT pInputs, int cbSize);

//(WINVER >= _WIN32_WINNT_WIN7)
	enum HTOUCHINPUT : HANDLE {init = (HANDLE).init}

	struct TOUCHINPUT {
		LONG x;
		LONG y;
		HANDLE hSource;
		DWORD dwID;
		DWORD dwFlags;
		DWORD dwMask;
		DWORD dwTime;
		ULONG_PTR dwExtraInfo;
		DWORD cxContact;
		DWORD cyContact;
	}
	alias TOUCHINPUT* PTOUCHINPUT;
	alias TOUCHINPUT* PCTOUCHINPUT;

	pure nothrow
	int TOUCH_COORD_TO_PIXEL(int l)
	{
		return l / 100;
	}

	enum {
		TOUCHEVENTF_MOVE       = 0x0001,
		TOUCHEVENTF_DOWN       = 0x0002,
		TOUCHEVENTF_UP         = 0x0004,
		TOUCHEVENTF_INRANGE    = 0x0008,
		TOUCHEVENTF_PRIMARY    = 0x0010,
		TOUCHEVENTF_NOCOALESCE = 0x0020,
		TOUCHEVENTF_PEN        = 0x0040,
		TOUCHEVENTF_PALM       = 0x0080,
	}

	enum {
		TOUCHINPUTMASKF_TIMEFROMSYSTEM = 0x0001,
		TOUCHINPUTMASKF_EXTRAINFO      = 0x0002,
		TOUCHINPUTMASKF_CONTACTAREA    = 0x0004,
	}

static if(WINVER >= _WIN32_WINNT_WIN7){
	export extern(Windows) BOOL GetTouchInputInfo(HTOUCHINPUT hTouchInput, UINT cInputs, PTOUCHINPUT pInputs, int cbSize);
	export extern(Windows) BOOL CloseTouchInputHandle(HTOUCHINPUT hTouchInput);
}

//(WINVER >= _WIN32_WINNT_WIN7)
	enum {
		TWF_FINETOUCH = 0x00000001,
		TWF_WANTPALM  = 0x00000002,
	}

static if(WINVER >= _WIN32_WINNT_WIN7){
	export extern(Windows) BOOL RegisterTouchWindow(HWND hwnd, ULONG ulFlags);
	export extern(Windows) BOOL UnregisterTouchWindow(HWND hwnd);
	export extern(Windows) BOOL IsTouchWindow(HWND hwnd, PULONG pulFlags);
}

struct LASTINPUTINFO {
	UINT cbSize;
	DWORD dwTime;
}
alias LASTINPUTINFO* PLASTINPUTINFO;

export extern(Windows) BOOL GetLastInputInfo(PLASTINPUTINFO plii);

export extern(Windows) UINT MapVirtualKeyA(UINT uCode, UINT uMapType);
export extern(Windows) UINT MapVirtualKeyW(UINT uCode, UINT uMapType);
version(UNICODE)
	alias MapVirtualKeyW MapVirtualKey;
else
	alias MapVirtualKeyA MapVirtualKey;

export extern(Windows) UINT MapVirtualKeyExA(UINT uCode, UINT uMapType, HKL dwhkl);
export extern(Windows) UINT MapVirtualKeyExW(UINT uCode, UINT uMapType, HKL dwhkl);
version(UNICODE)
	alias MapVirtualKeyExW MapVirtualKeyEx;
else
	alias MapVirtualKeyExA MapVirtualKeyEx;

enum {
	MAPVK_VK_TO_VSC    = 0,
	MAPVK_VSC_TO_VK    = 1,
	MAPVK_VK_TO_CHAR   = 2,
	MAPVK_VSC_TO_VK_EX = 3,
	//(WINVER >= _WIN32_WINNT_VISTA)
		MAPVK_VK_TO_VSC_EX = 4,
}

export extern(Windows) BOOL GetInputState();
export extern(Windows) DWORD GetQueueStatus(UINT flags);
export extern(Windows) HWND GetCapture();
export extern(Windows) HWND SetCapture(HWND hWnd);
export extern(Windows) BOOL ReleaseCapture();
export extern(Windows) DWORD MsgWaitForMultipleObjects(DWORD nCount, const(HANDLE)* pHandles, BOOL fWaitAll, DWORD dwMilliseconds, DWORD dwWakeMask);
export extern(Windows) DWORD MsgWaitForMultipleObjectsEx(DWORD nCount, const(HANDLE)* pHandles, DWORD dwMilliseconds, DWORD dwWakeMask, DWORD dwFlags);

enum {
	MWMO_WAITALL        = 0x0001,
	MWMO_ALERTABLE      = 0x0002,
	MWMO_INPUTAVAILABLE = 0x0004,
}

enum {
	QS_KEY            = 0x0001,
	QS_MOUSEMOVE      = 0x0002,
	QS_MOUSEBUTTON    = 0x0004,
	QS_POSTMESSAGE    = 0x0008,
	QS_TIMER          = 0x0010,
	QS_PAINT          = 0x0020,
	QS_SENDMESSAGE    = 0x0040,
	QS_HOTKEY         = 0x0080,
	QS_ALLPOSTMESSAGE = 0x0100,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		QS_RAWINPUT =  0x0400,
	QS_MOUSE          = QS_MOUSEMOVE | QS_MOUSEBUTTON,
	QS_INPUT          = QS_MOUSE | QS_KEY | QS_RAWINPUT,
	QS_ALLEVENTS      = QS_INPUT | QS_POSTMESSAGE | QS_TIMER | QS_PAINT | QS_HOTKEY,
	QS_ALLINPUT       = QS_INPUT | QS_POSTMESSAGE | QS_TIMER | QS_PAINT | QS_HOTKEY | QS_SENDMESSAGE,
}

enum {
	PM_QS_INPUT       = QS_INPUT << 16,
	PM_QS_POSTMESSAGE = (QS_POSTMESSAGE | QS_HOTKEY | QS_TIMER) << 16,
	PM_QS_PAINT       = QS_PAINT << 16,
	PM_QS_SENDMESSAGE = QS_SENDMESSAGE << 16,
}

enum {
	USER_TIMER_MAXIMUM = 0x7FFFFFFF,
	USER_TIMER_MINIMUM = 0x0000000A,
}

export extern(Windows) UINT_PTR SetTimer(HWND hWnd, UINT_PTR nIDEvent, UINT uElapse, TIMERPROC lpTimerFunc);
export extern(Windows) BOOL KillTimer(HWND hWnd, UINT_PTR uIDEvent);
export extern(Windows) BOOL IsWindowUnicode(HWND hWnd);
export extern(Windows) BOOL EnableWindow(HWND hWnd, BOOL bEnable);
export extern(Windows) BOOL IsWindowEnabled(HWND hWnd);
export extern(Windows) HACCEL LoadAcceleratorsA(HINSTANCE hInstance, LPCSTR lpTableName);
export extern(Windows) HACCEL LoadAcceleratorsW(HINSTANCE hInstance, LPCWSTR lpTableName);
version(UNICODE)
	alias LoadAcceleratorsW LoadAccelerators;
else
	alias LoadAcceleratorsA LoadAccelerators;

export extern(Windows) HACCEL CreateAcceleratorTableA(LPACCEL paccel, int cAccel);
export extern(Windows) HACCEL CreateAcceleratorTableW(LPACCEL paccel, int cAccel);
version(UNICODE)
	alias CreateAcceleratorTableW CreateAcceleratorTable;
else
	alias CreateAcceleratorTableA CreateAcceleratorTable;

export extern(Windows) BOOL DestroyAcceleratorTable(HACCEL hAccel);
export extern(Windows) int CopyAcceleratorTableA(HACCEL hAccelSrc, LPACCEL lpAccelDst, int cAccelEntries);
export extern(Windows) int CopyAcceleratorTableW(HACCEL hAccelSrc, LPACCEL lpAccelDst, int cAccelEntries);
version(UNICODE)
	alias CopyAcceleratorTableW CopyAcceleratorTable;
else
	alias CopyAcceleratorTableA CopyAcceleratorTable;

export extern(Windows) int TranslateAcceleratorA(HWND hWnd, HACCEL hAccTable, LPMSG lpMsg);
export extern(Windows) int TranslateAcceleratorW(HWND hWnd, HACCEL hAccTable, LPMSG lpMsg);
version(UNICODE)
	alias TranslateAcceleratorW TranslateAccelerator;
else
	alias TranslateAcceleratorA TranslateAccelerator;

enum {
	SM_CXSCREEN          = 0,
	SM_CYSCREEN          = 1,
	SM_CXVSCROLL         = 2,
	SM_CYHSCROLL         = 3,
	SM_CYCAPTION         = 4,
	SM_CXBORDER          = 5,
	SM_CYBORDER          = 6,
	SM_CXDLGFRAME        = 7,
	SM_CYDLGFRAME        = 8,
	SM_CYVTHUMB          = 9,
	SM_CXHTHUMB          = 10,
	SM_CXICON            = 11,
	SM_CYICON            = 12,
	SM_CXCURSOR          = 13,
	SM_CYCURSOR          = 14,
	SM_CYMENU            = 15,
	SM_CXFULLSCREEN      = 16,
	SM_CYFULLSCREEN      = 17,
	SM_CYKANJIWINDOW     = 18,
	SM_MOUSEPRESENT      = 19,
	SM_CYVSCROLL         = 20,
	SM_CXHSCROLL         = 21,
	SM_DEBUG             = 22,
	SM_SWAPBUTTON        = 23,
	SM_RESERVED1         = 24,
	SM_RESERVED2         = 25,
	SM_RESERVED3         = 26,
	SM_RESERVED4         = 27,
	SM_CXMIN             = 28,
	SM_CYMIN             = 29,
	SM_CXSIZE            = 30,
	SM_CYSIZE            = 31,
	SM_CXFRAME           = 32,
	SM_CYFRAME           = 33,
	SM_CXMINTRACK        = 34,
	SM_CYMINTRACK        = 35,
	SM_CXDOUBLECLK       = 36,
	SM_CYDOUBLECLK       = 37,
	SM_CXICONSPACING     = 38,
	SM_CYICONSPACING     = 39,
	SM_MENUDROPALIGNMENT = 40,
	SM_PENWINDOWS        = 41,
	SM_DBCSENABLED       = 42,
	SM_CMOUSEBUTTONS     = 43,
	SM_CXFIXEDFRAME = SM_CXDLGFRAME,
	SM_CYFIXEDFRAME = SM_CYDLGFRAME,
	SM_CXSIZEFRAME  = SM_CXFRAME,
	SM_CYSIZEFRAME  = SM_CYFRAME,
	SM_SECURE       = 44,
	SM_CXEDGE       = 45,
	SM_CYEDGE       = 46,
	SM_CXMINSPACING = 47,
	SM_CYMINSPACING = 48,
	SM_CXSMICON     = 49,
	SM_CYSMICON     = 50,
	SM_CYSMCAPTION  = 51,
	SM_CXSMSIZE     = 52,
	SM_CYSMSIZE     = 53,
	SM_CXMENUSIZE   = 54,
	SM_CYMENUSIZE   = 55,
	SM_ARRANGE      = 56,
	SM_CXMINIMIZED  = 57,
	SM_CYMINIMIZED  = 58,
	SM_CXMAXTRACK   = 59,
	SM_CYMAXTRACK   = 60,
	SM_CXMAXIMIZED  = 61,
	SM_CYMAXIMIZED  = 62,
	SM_NETWORK      = 63,
	SM_CLEANBOOT    = 67,
	SM_CXDRAG       = 68,
	SM_CYDRAG       = 69,
	SM_SHOWSOUNDS   = 70,
	SM_CXMENUCHECK    = 71,
	SM_CYMENUCHECK    = 72,
	SM_SLOWMACHINE    = 73,
	SM_MIDEASTENABLED = 74,
	SM_MOUSEWHEELPRESENT = 75,
	SM_XVIRTUALSCREEN    = 76,
	SM_YVIRTUALSCREEN    = 77,
	SM_CXVIRTUALSCREEN   = 78,
	SM_CYVIRTUALSCREEN   = 79,
	SM_CMONITORS         = 80,
	SM_SAMEDISPLAYFORMAT = 81,
	SM_IMMENABLED = 82,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		SM_CXFOCUSBORDER = 83,
		SM_CYFOCUSBORDER = 84,
		SM_TABLETPC    = 86,
		SM_MEDIACENTER = 87,
		SM_STARTER     = 88,
		SM_SERVERR2    = 89,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		SM_MOUSEHORIZONTALWHEELPRESENT = 91,
		SM_CXPADDEDBORDER              = 92,
	//(WINVER >= _WIN32_WINNT_WIN7)
		SM_DIGITIZER      = 94,
		SM_MAXIMUMTOUCHES = 95,
	SM_CMETRICS = 97,
	SM_REMOTESESSION = 0x1000,
	SM_SHUTTINGDOWN = 0x2000,
	SM_REMOTECONTROL = 0x2001,
	SM_CARETBLINKINGENABLED = 0x2002,
}

export extern(Windows) int GetSystemMetrics(int nIndex);
export extern(Windows) HMENU LoadMenuA(HINSTANCE hInstance, LPCSTR lpMenuName);
export extern(Windows) HMENU LoadMenuW(HINSTANCE hInstance, LPCWSTR lpMenuName);
version(UNICODE)
	alias LoadMenuW LoadMenu;
else
	alias LoadMenuA LoadMenu;

export extern(Windows) HMENU LoadMenuIndirectA(const(MENUTEMPLATEA)* lpMenuTemplate);
export extern(Windows) HMENU LoadMenuIndirectW(const(MENUTEMPLATEW)* lpMenuTemplate);
version(UNICODE)
	alias LoadMenuIndirectW LoadMenuIndirect;
else
	alias LoadMenuIndirectA LoadMenuIndirect;

export extern(Windows) HMENU GetMenu(HWND hWnd);
export extern(Windows) BOOL SetMenu(HWND hWnd, HMENU hMenu);
export extern(Windows) BOOL ChangeMenuA(HMENU hMenu, UINT cmd, LPCSTR lpszNewItem, UINT cmdInsert, UINT flags);
export extern(Windows) BOOL ChangeMenuW(HMENU hMenu, UINT cmd, LPCWSTR lpszNewItem, UINT cmdInsert, UINT flags);
version(UNICODE)
	alias ChangeMenuW ChangeMenu;
else
	alias ChangeMenuA ChangeMenu;

export extern(Windows) BOOL HiliteMenuItem(HWND hWnd, HMENU hMenu, UINT uIDHiliteItem, UINT uHilite);
export extern(Windows) int GetMenuStringA(HMENU hMenu, UINT uIDItem, LPSTR lpString, int cchMax, UINT flags);
export extern(Windows) int GetMenuStringW(HMENU hMenu, UINT uIDItem, LPWSTR lpString, int cchMax, UINT flags);
version(UNICODE)
	alias GetMenuStringW GetMenuString;
else
	alias GetMenuStringA GetMenuString;

export extern(Windows) UINT GetMenuState(HMENU hMenu, UINT uId, UINT uFlags);
export extern(Windows) BOOL DrawMenuBar(HWND hWnd);

//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	enum PMB_ACTIVE = 0x00000001;

export extern(Windows) HMENU GetSystemMenu(HWND hWnd, BOOL bRevert);
export extern(Windows) HMENU CreateMenu();
export extern(Windows) HMENU CreatePopupMenu();
export extern(Windows) BOOL DestroyMenu(HMENU hMenu);
export extern(Windows) DWORD CheckMenuItem(HMENU hMenu, UINT uIDCheckItem, UINT uCheck);
export extern(Windows) BOOL EnableMenuItem(HMENU hMenu, UINT uIDEnableItem, UINT uEnable);
export extern(Windows) HMENU GetSubMenu(HMENU hMenu, int nPos);
export extern(Windows) UINT GetMenuItemID(HMENU hMenu, int nPos);
export extern(Windows) int GetMenuItemCount(HMENU hMenu);
export extern(Windows) BOOL InsertMenuA(HMENU hMenu, UINT uPosition, UINT uFlags, UINT_PTR uIDNewItem, LPCSTR lpNewItem);
export extern(Windows) BOOL InsertMenuW(HMENU hMenu, UINT uPosition, UINT uFlags, UINT_PTR uIDNewItem, LPCWSTR lpNewItem);
version(UNICODE)
	alias InsertMenuW InsertMenu;
else
	alias InsertMenuA InsertMenu;

export extern(Windows) BOOL AppendMenuA(HMENU hMenu, UINT uFlags, UINT_PTR uIDNewItem, LPCSTR lpNewItem);
export extern(Windows) BOOL AppendMenuW(HMENU hMenu, UINT uFlags, UINT_PTR uIDNewItem, LPCWSTR lpNewItem);
version(UNICODE)
	alias AppendMenuW AppendMenu;
else
	alias AppendMenuA AppendMenu;

export extern(Windows) BOOL ModifyMenuA(HMENU hMnu, UINT uPosition, UINT uFlags, UINT_PTR uIDNewItem, LPCSTR lpNewItem);
export extern(Windows) BOOL ModifyMenuW(HMENU hMnu, UINT uPosition, UINT uFlags, UINT_PTR uIDNewItem, LPCWSTR lpNewItem);
version(UNICODE)
	alias ModifyMenuW ModifyMenu;
else
	alias ModifyMenuA ModifyMenu;

export extern(Windows) BOOL RemoveMenu(HMENU hMenu, UINT uPosition, UINT uFlags);
export extern(Windows) BOOL DeleteMenu(HMENU hMenu, UINT uPosition, UINT uFlags);
export extern(Windows) BOOL SetMenuItemBitmaps(HMENU hMenu, UINT uPosition, UINT uFlags, HBITMAP hBitmapUnchecked, HBITMAP hBitmapChecked);
export extern(Windows) LONG GetMenuCheckMarkDimensions();
export extern(Windows) BOOL TrackPopupMenu(HMENU hMenu, UINT uFlags, int x, int y, int nReserved, HWND hWnd, const(RECT)* prcRect);

enum {
	MNC_IGNORE  = 0,
	MNC_CLOSE   = 1,
	MNC_EXECUTE = 2,
	MNC_SELECT  = 3,
}

struct TPMPARAMS {
	UINT cbSize;
	RECT rcExclude;
}
alias TPMPARAMS* LPTPMPARAMS;

export extern(Windows) BOOL TrackPopupMenuEx(HMENU, UINT, int, int, HWND, LPTPMPARAMS);


static if(_WIN32_WINNT >= _WIN32_WINNT_WIN7)
	export extern(Windows) BOOL CalculatePopupWindowPosition(const(POINT)* anchorPoint, const(SIZE)* windowSize, UINT flags, RECT* excludeRect, RECT* popupWindowPosition);

enum {
	MNS_NOCHECK     = 0x80000000,
	MNS_MODELESS    = 0x40000000,
	MNS_DRAGDROP    = 0x20000000,
	MNS_AUTODISMISS = 0x10000000,
	MNS_NOTIFYBYPOS = 0x08000000,
	MNS_CHECKORBMP  = 0x04000000,
}

enum {
	MIM_MAXHEIGHT       = 0x00000001,
	MIM_BACKGROUND      = 0x00000002,
	MIM_HELPID          = 0x00000004,
	MIM_MENUDATA        = 0x00000008,
	MIM_STYLE           = 0x00000010,
	MIM_APPLYTOSUBMENUS = 0x80000000,
}

struct MENUINFO {
	DWORD cbSize;
	DWORD fMask;
	DWORD dwStyle;
	UINT cyMax;
	HBRUSH hbrBack;
	DWORD dwContextHelpID;
	ULONG_PTR dwMenuData;
}
alias MENUINFO* LPMENUINFO;
alias MENUINFO* LPCMENUINFO;

export extern(Windows) BOOL GetMenuInfo(HMENU, LPMENUINFO);
export extern(Windows) BOOL SetMenuInfo(HMENU, LPCMENUINFO);
export extern(Windows) BOOL EndMenu();

enum {
	MND_CONTINUE = 0,
	MND_ENDMENU  = 1,
}

struct MENUGETOBJECTINFO {
	DWORD dwFlags;
	UINT uPos;
	HMENU hmenu;
	PVOID riid;
	PVOID pvObj;
}
alias MENUGETOBJECTINFO* PMENUGETOBJECTINFO;

enum {
	MNGOF_TOPGAP    = 0x00000001,
	MNGOF_BOTTOMGAP = 0x00000002,
}

enum {
	MNGO_NOINTERFACE = 0x00000000,
	MNGO_NOERROR     = 0x00000001,
}

enum {
	MIIM_STATE      = 0x00000001,
	MIIM_ID         = 0x00000002,
	MIIM_SUBMENU    = 0x00000004,
	MIIM_CHECKMARKS = 0x00000008,
	MIIM_TYPE       = 0x00000010,
	MIIM_DATA       = 0x00000020,
}

enum {
	MIIM_STRING = 0x00000040,
	MIIM_BITMAP = 0x00000080,
	MIIM_FTYPE  = 0x00000100,
}

const HBITMAP HBMMENU_CALLBACK        = cast(HBITMAP) -1;
const HBITMAP HBMMENU_SYSTEM          = cast(HBITMAP)  1;
const HBITMAP HBMMENU_MBAR_RESTORE    = cast(HBITMAP)  2;
const HBITMAP HBMMENU_MBAR_MINIMIZE   = cast(HBITMAP)  3;
const HBITMAP HBMMENU_MBAR_CLOSE      = cast(HBITMAP)  5;
const HBITMAP HBMMENU_MBAR_CLOSE_D    = cast(HBITMAP)  6;
const HBITMAP HBMMENU_MBAR_MINIMIZE_D = cast(HBITMAP)  7;
const HBITMAP HBMMENU_POPUP_CLOSE     = cast(HBITMAP)  8;
const HBITMAP HBMMENU_POPUP_RESTORE   = cast(HBITMAP)  9;
const HBITMAP HBMMENU_POPUP_MAXIMIZE  = cast(HBITMAP) 10;
const HBITMAP HBMMENU_POPUP_MINIMIZE  = cast(HBITMAP) 11;

struct MENUITEMINFOA {
	UINT cbSize;
	UINT fMask;
	UINT fType;
	UINT fState;
	UINT wID;
	HMENU hSubMenu;
	HBITMAP hbmpChecked;
	HBITMAP hbmpUnchecked;
	ULONG_PTR dwItemData;
	LPSTR dwTypeData;
	UINT cch;
	HBITMAP hbmpItem;
}
alias MENUITEMINFOA* LPMENUITEMINFOA;
struct MENUITEMINFOW {
	UINT cbSize;
	UINT fMask;
	UINT fType;
	UINT fState;
	UINT wID;
	HMENU hSubMenu;
	HBITMAP hbmpChecked;
	HBITMAP hbmpUnchecked;
	ULONG_PTR dwItemData;
	LPWSTR dwTypeData;
    UINT cch;
	HBITMAP hbmpItem;
}
alias MENUITEMINFOW* LPMENUITEMINFOW;
version(UNICODE){
	alias MENUITEMINFOW MENUITEMINFO;
	alias LPMENUITEMINFOW LPMENUITEMINFO;
}else{
	alias MENUITEMINFOA MENUITEMINFO;
	alias LPMENUITEMINFOA LPMENUITEMINFO;
}
alias MENUITEMINFOA* LPCMENUITEMINFOA;
alias MENUITEMINFOW* LPCMENUITEMINFOW;
version(UNICODE)
	alias LPCMENUITEMINFOW LPCMENUITEMINFO;
else
	alias LPCMENUITEMINFOA LPCMENUITEMINFO;

export extern(Windows) BOOL InsertMenuItemA(HMENU hmenu, UINT item, BOOL fByPosition, LPCMENUITEMINFOA lpmi);
export extern(Windows) BOOL InsertMenuItemW(HMENU hmenu, UINT item, BOOL fByPosition, LPCMENUITEMINFOW lpmi);
version(UNICODE)
	alias InsertMenuItemW InsertMenuItem;
else
	alias InsertMenuItemA InsertMenuItem;

export extern(Windows) BOOL GetMenuItemInfoA(HMENU hmenu, UINT item, BOOL fByPosition, LPMENUITEMINFOA lpmii);
export extern(Windows) BOOL GetMenuItemInfoW(HMENU hmenu, UINT item, BOOL fByPosition, LPMENUITEMINFOW lpmii);
version(UNICODE)
	alias GetMenuItemInfoW GetMenuItemInfo;
else
	alias GetMenuItemInfoA GetMenuItemInfo;

export extern(Windows) BOOL SetMenuItemInfoA(HMENU hmenu, UINT item, BOOL fByPositon, LPCMENUITEMINFOA lpmii);
export extern(Windows) BOOL SetMenuItemInfoW(HMENU hmenu, UINT item, BOOL fByPositon, LPCMENUITEMINFOW lpmii);
version(UNICODE)
	alias SetMenuItemInfoW SetMenuItemInfo;
else
	alias SetMenuItemInfoA SetMenuItemInfo;

enum {
	GMDI_USEDISABLED  = 0x0001,
	GMDI_GOINTOPOPUPS = 0x0002,
}

export extern(Windows) UINT GetMenuDefaultItem(HMENU hMenu, UINT fByPos, UINT gmdiFlags);
export extern(Windows) BOOL SetMenuDefaultItem(HMENU hMenu, UINT uItem, UINT fByPos);
export extern(Windows) BOOL GetMenuItemRect(HWND hWnd, HMENU hMenu, UINT uItem, LPRECT lprcItem);
export extern(Windows) int MenuItemFromPoint(HWND hWnd, HMENU hMenu, POINT ptScreen);

enum {
	TPM_LEFTBUTTON  = 0x0000,
	TPM_RIGHTBUTTON = 0x0002,
	TPM_LEFTALIGN   = 0x0000,
	TPM_CENTERALIGN = 0x0004,
	TPM_RIGHTALIGN  = 0x0008,
	TPM_TOPALIGN     = 0x0000,
	TPM_VCENTERALIGN = 0x0010,
	TPM_BOTTOMALIGN  = 0x0020,
	TPM_HORIZONTAL   = 0x0000,
	TPM_VERTICAL     = 0x0040,
	TPM_NONOTIFY     = 0x0080,
	TPM_RETURNCMD    = 0x0100,
	TPM_RECURSE         = 0x0001,
	TPM_HORPOSANIMATION = 0x0400,
	TPM_HORNEGANIMATION = 0x0800,
	TPM_VERPOSANIMATION = 0x1000,
	TPM_VERNEGANIMATION = 0x2000,
	TPM_NOANIMATION = 0x4000,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		TPM_LAYOUTRTL = 0x8000,
	//(_WIN32_WINNT >= _WIN32_WINNT_WIN7)
		TPM_WORKAREA = 0x10000,
}

struct DROPSTRUCT {
	HWND hwndSource;
	HWND hwndSink;
	DWORD wFmt;
	ULONG_PTR dwData;
	POINT ptDrop;
	DWORD dwControlData;
}
alias DROPSTRUCT* PDROPSTRUCT;
alias DROPSTRUCT* LPDROPSTRUCT;

enum {
	DOF_EXECUTABLE = 0x8001,
	DOF_DOCUMENT   = 0x8002,
	DOF_DIRECTORY  = 0x8003,
	DOF_MULTIPLE   = 0x8004,
	DOF_PROGMAN    = 0x0001,
	DOF_SHELLDATA  = 0x0002,
}
enum {
	DO_DROPFILE  = 0x454C4946,
	DO_PRINTFILE = 0x544E5250,
}

export extern(Windows) DWORD DragObject(HWND hwndParent, HWND hwndFrom, UINT fmt, ULONG_PTR data, HCURSOR hcur);
export extern(Windows) BOOL DragDetect(HWND hwnd, POINT pt);

export extern(Windows) BOOL DrawIcon(HDC hDC, int X, int Y, HICON hIcon);

enum {
	DT_TOP                  = 0x00000000,
	DT_LEFT                 = 0x00000000,
	DT_CENTER               = 0x00000001,
	DT_RIGHT                = 0x00000002,
	DT_VCENTER              = 0x00000004,
	DT_BOTTOM               = 0x00000008,
	DT_WORDBREAK            = 0x00000010,
	DT_SINGLELINE           = 0x00000020,
	DT_EXPANDTABS           = 0x00000040,
	DT_TABSTOP              = 0x00000080,
	DT_NOCLIP               = 0x00000100,
	DT_EXTERNALLEADING      = 0x00000200,
	DT_CALCRECT             = 0x00000400,
	DT_NOPREFIX             = 0x00000800,
	DT_INTERNAL             = 0x00001000,
	DT_EDITCONTROL          = 0x00002000,
	DT_PATH_ELLIPSIS        = 0x00004000,
	DT_END_ELLIPSIS         = 0x00008000,
	DT_MODIFYSTRING         = 0x00010000,
	DT_RTLREADING           = 0x00020000,
	DT_WORD_ELLIPSIS        = 0x00040000,
	DT_NOFULLWIDTHCHARBREAK = 0x00080000,
	DT_HIDEPREFIX           = 0x00100000,
	DT_PREFIXONLY           = 0x00200000,
}

struct DRAWTEXTPARAMS {
	UINT cbSize;
	int iTabLength;
	int iLeftMargin;
	int iRightMargin;
	UINT uiLengthDrawn;
}
alias DRAWTEXTPARAMS* LPDRAWTEXTPARAMS;

export extern(Windows) int DrawTextA(HDC hdc, LPCSTR lpchText, int cchText, LPRECT lprc, UINT format);
export extern(Windows) int DrawTextW(HDC hdc, LPCWSTR lpchText, int cchText, LPRECT lprc, UINT format);
version(UNICODE)
	alias DrawTextW DrawText;
else
	alias DrawTextA DrawText;

export extern(Windows) int DrawTextExA(HDC hdc, LPSTR lpchText, int cchText, LPRECT lprc, UINT format, LPDRAWTEXTPARAMS lpdtp);
export extern(Windows) int DrawTextExW(HDC hdc, LPWSTR lpchText, int cchText, LPRECT lprc, UINT format, LPDRAWTEXTPARAMS lpdtp);
version(UNICODE)
	alias DrawTextExW DrawTextEx;
else
	alias DrawTextExA DrawTextEx;

export extern(Windows) BOOL GrayStringA(HDC hDC, HBRUSH hBrush, GRAYSTRINGPROC lpOutputFunc, LPARAM lpData, int nCount, int X, int Y, int nWidth, int nHeight);
export extern(Windows) BOOL GrayStringW(HDC hDC, HBRUSH hBrush, GRAYSTRINGPROC lpOutputFunc, LPARAM lpData, int nCount, int X, int Y, int nWidth, int nHeight);
version(UNICODE)
	alias GrayStringW GrayString;
else
	alias GrayStringA GrayString;


enum {
	DST_COMPLEX    = 0x0000,
	DST_TEXT       = 0x0001,
	DST_PREFIXTEXT = 0x0002,
	DST_ICON       = 0x0003,
	DST_BITMAP     = 0x0004,
}
enum {
	DSS_NORMAL     = 0x0000,
	DSS_UNION      = 0x0010,
	DSS_DISABLED   = 0x0020,
	DSS_MONO       = 0x0080,
	DSS_HIDEPREFIX = 0x0200,
	DSS_PREFIXONLY = 0x0400,
	DSS_RIGHT      = 0x8000,
}

export extern(Windows) BOOL DrawStateA(HDC hdc, HBRUSH hbrFore, DRAWSTATEPROC qfnCallBack, LPARAM lData, WPARAM wData, int x, int y, int cx, int cy, UINT uFlags);
export extern(Windows) BOOL DrawStateW(HDC hdc, HBRUSH hbrFore, DRAWSTATEPROC qfnCallBack, LPARAM lData, WPARAM wData, int x, int y, int cx, int cy, UINT uFlags);
version(UNICODE)
	alias DrawStateW DrawState;
else
	alias DrawStateA DrawState;

export extern(Windows) LONG TabbedTextOutA(HDC hdc, int x, int y, LPCSTR lpString, int chCount, int nTabPositions, const(INT)* lpnTabStopPositions, int nTabOrigin);
export extern(Windows) LONG TabbedTextOutW(HDC hdc, int x, int y, LPCWSTR lpString, int chCount, int nTabPositions, const(INT)* lpnTabStopPositions, int nTabOrigin);
version(UNICODE)
	alias TabbedTextOutW TabbedTextOut;
else
	alias TabbedTextOutA TabbedTextOut;

export extern(Windows) DWORD GetTabbedTextExtentA(HDC hdc, LPCSTR lpString, int chCount, int nTabPositions, const(INT)* lpnTabStopPositions);
export extern(Windows) DWORD GetTabbedTextExtentW(HDC hdc, LPCWSTR lpString, int chCount, int nTabPositions, const(INT)* lpnTabStopPositions);
version(UNICODE)
	alias GetTabbedTextExtentW GetTabbedTextExtent;
else
	alias GetTabbedTextExtentA GetTabbedTextExtent;

export extern(Windows) BOOL UpdateWindow(HWND hWnd);
export extern(Windows) HWND SetActiveWindow(HWND hWnd);

export extern(Windows) HWND GetForegroundWindow();

export extern(Windows) BOOL PaintDesktop(HDC hdc);
export extern(Windows) VOID SwitchToThisWindow(HWND hwnd, BOOL fUnknown);

export extern(Windows) BOOL SetForegroundWindow(HWND hWnd);

export extern(Windows) BOOL AllowSetForegroundWindow(DWORD dwProcessId);
enum ASFW_ANY = cast(DWORD)-1;
export extern(Windows) BOOL LockSetForegroundWindow(UINT uLockCode);
enum {
	LSFW_LOCK   = 1,
	LSFW_UNLOCK = 2,
}

export extern(Windows) HWND WindowFromDC(HDC hDC);
export extern(Windows) HDC GetDC(HWND hWnd);

export extern(Windows) HDC GetDCEx(HWND hWnd, HRGN hrgnClip, DWORD flags);

enum {
	DCX_WINDOW           = 0x00000001,
	DCX_CACHE            = 0x00000002,
	DCX_NORESETATTRS     = 0x00000004,
	DCX_CLIPCHILDREN     = 0x00000008,
	DCX_CLIPSIBLINGS     = 0x00000010,
	DCX_PARENTCLIP       = 0x00000020,
	DCX_EXCLUDERGN       = 0x00000040,
	DCX_INTERSECTRGN     = 0x00000080,
	DCX_EXCLUDEUPDATE    = 0x00000100,
	DCX_INTERSECTUPDATE  = 0x00000200,
	DCX_LOCKWINDOWUPDATE = 0x00000400,
	DCX_VALIDATE         = 0x00200000,
}

export extern(Windows) HDC GetWindowDC(HWND hWnd);
export extern(Windows) int ReleaseDC(HWND hWnd, HDC hDC);

export extern(Windows) HDC BeginPaint(HWND hWnd, LPPAINTSTRUCT lpPaint);
export extern(Windows) BOOL EndPaint(HWND hWnd, const(PAINTSTRUCT)* lpPaint);
export extern(Windows) BOOL GetUpdateRect(HWND hWnd, LPRECT lpRect, BOOL bErase);
export extern(Windows) int GetUpdateRgn(HWND hWnd, HRGN hRgn, BOOL bErase);
export extern(Windows) int SetWindowRgn(HWND hWnd, HRGN hRgn, BOOL bRedraw);
export extern(Windows) int GetWindowRgn(HWND hWnd, HRGN hRgn);
static if(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	export extern(Windows) int GetWindowRgnBox(HWND hWnd, LPRECT lprc);
export extern(Windows) int ExcludeUpdateRgn(HDC hDC, HWND hWnd);
export extern(Windows) BOOL InvalidateRect(HWND hWnd, const(RECT)* lpRect, BOOL bErase);
export extern(Windows) BOOL ValidateRect(HWND hWnd, const(RECT)* lpRect);
export extern(Windows) BOOL InvalidateRgn(HWND hWnd, HRGN hRgn, BOOL bErase);
export extern(Windows) BOOL ValidateRgn(HWND hWnd, HRGN hRgn);
export extern(Windows) BOOL RedrawWindow(HWND hWnd, const(RECT)* lprcUpdate, HRGN hrgnUpdate, UINT flags);

enum {
	RDW_INVALIDATE      = 0x0001,
	RDW_INTERNALPAINT   = 0x0002,
	RDW_ERASE           = 0x0004,
	RDW_VALIDATE        = 0x0008,
	RDW_NOINTERNALPAINT = 0x0010,
	RDW_NOERASE         = 0x0020,
	RDW_NOCHILDREN      = 0x0040,
	RDW_ALLCHILDREN     = 0x0080,
	RDW_UPDATENOW       = 0x0100,
	RDW_ERASENOW        = 0x0200,
	RDW_FRAME           = 0x0400,
	RDW_NOFRAME         = 0x0800,
}

export extern(Windows) BOOL LockWindowUpdate(HWND hWndLock);
export extern(Windows) BOOL ScrollWindow(HWND hWnd, int XAmount, int YAmount, const(RECT)* lpRect, const(RECT)* lpClipRect);
export extern(Windows) BOOL ScrollDC(HDC hDC, int dx, int dy, const(RECT)* lprcScroll, const(RECT)* lprcClip, HRGN hrgnUpdate, LPRECT lprcUpdate);
export extern(Windows) int ScrollWindowEx(HWND hWnd, int dx, int dy, const(RECT)* prcScroll, const(RECT)* prcClip, HRGN hrgnUpdate, LPRECT prcUpdate, UINT flags);
enum {
	SW_SCROLLCHILDREN = 0x0001,
	SW_INVALIDATE     = 0x0002,
	SW_ERASE          = 0x0004,
	SW_SMOOTHSCROLL   = 0x0010,
}

export extern(Windows) int SetScrollPos(HWND hWnd, int nBar, int nPos, BOOL bRedraw);
export extern(Windows) int GetScrollPos(HWND hWnd, int nBar);
export extern(Windows) BOOL SetScrollRange(HWND hWnd, int nBar, int nMinPos, int nMaxPos, BOOL bRedraw);
export extern(Windows) BOOL GetScrollRange(HWND hWnd, int nBar, LPINT lpMinPos, LPINT lpMaxPos);
export extern(Windows) BOOL ShowScrollBar(HWND hWnd, int wBar, BOOL bShow);
export extern(Windows) BOOL EnableScrollBar(HWND hWnd, UINT wSBflags, UINT wArrows);

enum {
	ESB_ENABLE_BOTH   = 0x0000,
	ESB_DISABLE_BOTH  = 0x0003,
	ESB_DISABLE_LEFT  = 0x0001,
	ESB_DISABLE_RIGHT = 0x0002,
	ESB_DISABLE_UP    = 0x0001,
	ESB_DISABLE_DOWN  = 0x0002,
	ESB_DISABLE_LTUP  = ESB_DISABLE_LEFT,
	ESB_DISABLE_RTDN  = ESB_DISABLE_RIGHT,
}

export extern(Windows) BOOL SetPropA(HWND hWnd, LPCSTR lpString, HANDLE hData);
export extern(Windows) BOOL SetPropW(HWND hWnd, LPCWSTR lpString, HANDLE hData);
version(UNICODE)
	alias SetPropW SetProp;
else
	alias SetPropA SetProp;

export extern(Windows) HANDLE GetPropA(HWND hWnd, LPCSTR lpString);
export extern(Windows) HANDLE GetPropW(HWND hWnd, LPCWSTR lpString);
version(UNICODE)
	alias GetPropW GetProp;
else
	alias GetPropA GetProp;

export extern(Windows) HANDLE RemovePropA(HWND hWnd, LPCSTR lpString);
export extern(Windows) HANDLE RemovePropW(HWND hWnd, LPCWSTR lpString);
version(UNICODE)
	alias RemovePropW RemoveProp;
else
	alias RemovePropA RemoveProp;

export extern(Windows) int EnumPropsExA(HWND hWnd, PROPENUMPROCEXA lpEnumFunc, LPARAM lParam);
export extern(Windows) int EnumPropsExW(HWND hWnd, PROPENUMPROCEXW lpEnumFunc, LPARAM lParam);
version(UNICODE)
	alias EnumPropsExW EnumPropsEx;
else
	alias EnumPropsExA EnumPropsEx;

export extern(Windows) int EnumPropsA(HWND hWnd, PROPENUMPROCA lpEnumFunc);
export extern(Windows) int EnumPropsW(HWND hWnd, PROPENUMPROCW lpEnumFunc);
version(UNICODE)
	alias EnumPropsW EnumProps;
else
	alias EnumPropsA EnumProps;

export extern(Windows) BOOL SetWindowTextA(HWND hWnd, LPCSTR lpString);
export extern(Windows) BOOL SetWindowTextW(HWND hWnd, LPCWSTR lpString);
version(UNICODE)
	alias SetWindowTextW SetWindowText;
else
	alias SetWindowTextA SetWindowText;

export extern(Windows) int GetWindowTextA(HWND hWnd, LPSTR lpString, int nMaxCount);
export extern(Windows) int GetWindowTextW(HWND hWnd, LPWSTR lpString, int nMaxCount);
version(UNICODE)
	alias GetWindowTextW GetWindowText;
else
	alias GetWindowTextA GetWindowText;

export extern(Windows) int GetWindowTextLengthA(HWND hWnd);
export extern(Windows) int GetWindowTextLengthW(HWND hWnd);
version(UNICODE)
	alias GetWindowTextLengthW GetWindowTextLength;
else
	alias GetWindowTextLengthA GetWindowTextLength;

export extern(Windows) BOOL GetClientRect(HWND hWnd, LPRECT lpRect);
export extern(Windows) BOOL GetWindowRect(HWND hWnd, LPRECT lpRect);
export extern(Windows) BOOL AdjustWindowRect(LPRECT lpRect, DWORD dwStyle, BOOL bMenu);
export extern(Windows) BOOL AdjustWindowRectEx(LPRECT lpRect, DWORD dwStyle, BOOL bMenu, DWORD dwExStyle);

enum {
	HELPINFO_WINDOW   = 0x0001,
	HELPINFO_MENUITEM = 0x0002,
}
struct HELPINFO {
	UINT cbSize;
	int iContextType;
	int iCtrlId;
	HANDLE hItemHandle;
	DWORD_PTR dwContextId;
	POINT MousePos;
}
alias HELPINFO* LPHELPINFO;

export extern(Windows) BOOL SetWindowContextHelpId(HWND, DWORD);
export extern(Windows) DWORD GetWindowContextHelpId(HWND);
export extern(Windows) BOOL SetMenuContextHelpId(HMENU, DWORD);
export extern(Windows) DWORD GetMenuContextHelpId(HMENU);

enum {
	MB_OK                        = 0x00000000,
	MB_OKCANCEL                  = 0x00000001,
	MB_ABORTRETRYIGNORE          = 0x00000002,
	MB_YESNOCANCEL               = 0x00000003,
	MB_YESNO                     = 0x00000004,
	MB_RETRYCANCEL               = 0x00000005,
	MB_CANCELTRYCONTINUE         = 0x00000006,
	MB_ICONHAND                  = 0x00000010,
	MB_ICONQUESTION              = 0x00000020,
	MB_ICONEXCLAMATION           = 0x00000030,
	MB_ICONASTERISK              = 0x00000040,
	MB_USERICON                  = 0x00000080,
	MB_ICONWARNING               = MB_ICONEXCLAMATION,
	MB_ICONERROR                 = MB_ICONHAND,
	MB_ICONINFORMATION           = MB_ICONASTERISK,
	MB_ICONSTOP                  = MB_ICONHAND,
	MB_DEFBUTTON1                = 0x00000000,
	MB_DEFBUTTON2                = 0x00000100,
	MB_DEFBUTTON3                = 0x00000200,
	MB_DEFBUTTON4                = 0x00000300,
	MB_APPLMODAL                 = 0x00000000,
	MB_SYSTEMMODAL               = 0x00001000,
	MB_TASKMODAL                 = 0x00002000,
	MB_HELP                      = 0x00004000,
	MB_NOFOCUS                   = 0x00008000,
	MB_SETFOREGROUND             = 0x00010000,
	MB_DEFAULT_DESKTOP_ONLY      = 0x00020000,
	MB_TOPMOST                   = 0x00040000,
	MB_RIGHT                     = 0x00080000,
	MB_RTLREADING                = 0x00100000,
	MB_SERVICE_NOTIFICATION      = 0x00200000,
	MB_SERVICE_NOTIFICATION_NT3X = 0x00040000,
	MB_TYPEMASK                  = 0x0000000F,
	MB_ICONMASK                  = 0x000000F0,
	MB_DEFMASK                   = 0x00000F00,
	MB_MODEMASK                  = 0x00003000,
	MB_MISCMASK                  = 0x0000C000,
}

export extern(Windows) int MessageBoxA(HWND hWnd, LPCSTR lpText, LPCSTR lpCaption, UINT uType);
export extern(Windows) int MessageBoxW(HWND hWnd, LPCWSTR lpText, LPCWSTR lpCaption, UINT uType);
version(UNICODE)
	alias MessageBoxW MessageBox;
else
	alias MessageBoxA MessageBox;

export extern(Windows) int MessageBoxExA(HWND hWnd, LPCSTR lpText, LPCSTR lpCaption, UINT uType, WORD wLanguageId);
export extern(Windows) int MessageBoxExW(HWND hWnd, LPCWSTR lpText, LPCWSTR lpCaption, UINT uType, WORD wLanguageId);
version(UNICODE)
	alias MessageBoxExW MessageBoxEx;
else
	alias MessageBoxExA MessageBoxEx;

alias extern(Windows) VOID function(LPHELPINFO lpHelpInfo) MSGBOXCALLBACK;

struct MSGBOXPARAMSA {
	UINT cbSize;
	HWND hwndOwner;
	HINSTANCE hInstance;
	LPCSTR lpszText;
	LPCSTR lpszCaption;
	DWORD dwStyle;
	LPCSTR lpszIcon;
	DWORD_PTR dwContextHelpId;
	MSGBOXCALLBACK lpfnMsgBoxCallback;
	DWORD dwLanguageId;
}
alias MSGBOXPARAMSA* PMSGBOXPARAMSA;
alias MSGBOXPARAMSA* LPMSGBOXPARAMSA;
struct MSGBOXPARAMSW {
	UINT cbSize;
	HWND hwndOwner;
	HINSTANCE hInstance;
	LPCWSTR lpszText;
	LPCWSTR lpszCaption;
	DWORD dwStyle;
	LPCWSTR lpszIcon;
	DWORD_PTR dwContextHelpId;
	MSGBOXCALLBACK lpfnMsgBoxCallback;
	DWORD dwLanguageId;
}
alias MSGBOXPARAMSW* PMSGBOXPARAMSW;
alias MSGBOXPARAMSW* LPMSGBOXPARAMSW;
version(UNICODE){
	alias MSGBOXPARAMSW MSGBOXPARAMS;
	alias PMSGBOXPARAMSW PMSGBOXPARAMS;
	alias LPMSGBOXPARAMSW LPMSGBOXPARAMS;
}else{
	alias MSGBOXPARAMSA MSGBOXPARAMS;
	alias PMSGBOXPARAMSA PMSGBOXPARAMS;
	alias LPMSGBOXPARAMSA LPMSGBOXPARAMS;
}

export extern(Windows) int MessageBoxIndirectA(const(MSGBOXPARAMSA)* lpmbp);
export extern(Windows) int MessageBoxIndirectW(const(MSGBOXPARAMSW)* lpmbp);
version(UNICODE)
	alias MessageBoxIndirectW MessageBoxIndirect;
else
	alias MessageBoxIndirectA MessageBoxIndirect;

export extern(Windows) BOOL MessageBeep(UINT uType);
export extern(Windows) int ShowCursor(BOOL bShow);
export extern(Windows) BOOL SetCursorPos(int X, int Y);
static if(WINVER >= _WIN32_WINNT_VISTA)
	export extern(Windows) BOOL SetPhysicalCursorPos(int X, int Y);
export extern(Windows) HCURSOR SetCursor(HCURSOR hCursor);
export extern(Windows) BOOL GetCursorPos(LPPOINT lpPoint);
static if(WINVER >= _WIN32_WINNT_VISTA)
	export extern(Windows) BOOL GetPhysicalCursorPos(LPPOINT lpPoint);
export extern(Windows) BOOL ClipCursor(const(RECT)* lpRect);
export extern(Windows) BOOL GetClipCursor(LPRECT lpRect);
export extern(Windows) HCURSOR GetCursor();
export extern(Windows) BOOL CreateCaret(HWND hWnd, HBITMAP hBitmap, int nWidth, int nHeight);
export extern(Windows) UINT GetCaretBlinkTime();
export extern(Windows) BOOL SetCaretBlinkTime(UINT uMSeconds);
export extern(Windows) BOOL DestroyCaret();
export extern(Windows) BOOL HideCaret(HWND hWnd);
export extern(Windows) BOOL ShowCaret(HWND hWnd);
export extern(Windows) BOOL SetCaretPos(int X, int Y);
export extern(Windows) BOOL GetCaretPos(LPPOINT lpPoint);
export extern(Windows) BOOL ClientToScreen(HWND hWnd, LPPOINT lpPoint);
export extern(Windows) BOOL ScreenToClient(HWND hWnd, LPPOINT lpPoint);
static if(WINVER >= _WIN32_WINNT_VISTA){
	export extern(Windows) BOOL LogicalToPhysicalPoint(HWND hWnd, LPPOINT lpPoint);
	export extern(Windows) BOOL PhysicalToLogicalPoint(HWND hWnd, LPPOINT lpPoint);
}
export extern(Windows) int MapWindowPoints(HWND hWndFrom, HWND hWndTo, LPPOINT lpPoints, UINT cPoints);
export extern(Windows) HWND WindowFromPoint(POINT Point);
static if(WINVER >= _WIN32_WINNT_VISTA)
	export extern(Windows) HWND WindowFromPhysicalPoint(POINT Point);
export extern(Windows) HWND ChildWindowFromPoint(HWND hWndParent, POINT Point);

enum {
	CWP_ALL             = 0x0000,
	CWP_SKIPINVISIBLE   = 0x0001,
	CWP_SKIPDISABLED    = 0x0002,
	CWP_SKIPTRANSPARENT = 0x0004,
}
export extern(Windows) HWND ChildWindowFromPointEx(HWND hwnd, POINT pt, UINT flags);

enum {
	CTLCOLOR_MSGBOX    = 0,
	CTLCOLOR_EDIT      = 1,
	CTLCOLOR_LISTBOX   = 2,
	CTLCOLOR_BTN       = 3,
	CTLCOLOR_DLG       = 4,
	CTLCOLOR_SCROLLBAR = 5,
	CTLCOLOR_STATIC    = 6,
	CTLCOLOR_MAX       = 7,
}
enum {
	COLOR_SCROLLBAR               = 0,
	COLOR_BACKGROUND              = 1,
	COLOR_ACTIVECAPTION           = 2,
	COLOR_INACTIVECAPTION         = 3,
	COLOR_MENU                    = 4,
	COLOR_WINDOW                  = 5,
	COLOR_WINDOWFRAME             = 6,
	COLOR_MENUTEXT                = 7,
	COLOR_WINDOWTEXT              = 8,
	COLOR_CAPTIONTEXT             = 9,
	COLOR_ACTIVEBORDER            = 10,
	COLOR_INACTIVEBORDER          = 11,
	COLOR_APPWORKSPACE            = 12,
	COLOR_HIGHLIGHT               = 13,
	COLOR_HIGHLIGHTTEXT           = 14,
	COLOR_BTNFACE                 = 15,
	COLOR_BTNSHADOW               = 16,
	COLOR_GRAYTEXT                = 17,
	COLOR_BTNTEXT                 = 18,
	COLOR_INACTIVECAPTIONTEXT     = 19,
	COLOR_BTNHIGHLIGHT            = 20,
	COLOR_3DDKSHADOW              = 21,
	COLOR_3DLIGHT                 = 22,
	COLOR_INFOTEXT                = 23,
	COLOR_INFOBK                  = 24,
	COLOR_HOTLIGHT                = 26,
	COLOR_GRADIENTACTIVECAPTION   = 27,
	COLOR_GRADIENTINACTIVECAPTION = 28,
	//(WINVER >= _WIN32_WINNT_WINXP)
		COLOR_MENUHILIGHT = 29,
		COLOR_MENUBAR     = 30,
	COLOR_DESKTOP                 = COLOR_BACKGROUND,
	COLOR_3DFACE                  = COLOR_BTNFACE,
	COLOR_3DSHADOW                = COLOR_BTNSHADOW,
	COLOR_3DHIGHLIGHT             = COLOR_BTNHIGHLIGHT,
	COLOR_3DHILIGHT               = COLOR_BTNHIGHLIGHT,
	COLOR_BTNHILIGHT              = COLOR_BTNHIGHLIGHT,
}

export extern(Windows) DWORD GetSysColor(int nIndex);
export extern(Windows) HBRUSH GetSysColorBrush(int nIndex);
export extern(Windows) BOOL SetSysColors(int cElements, const(INT)* lpaElements, const(COLORREF)* lpaRgbValues);
export extern(Windows) BOOL DrawFocusRect(HDC hDC, const(RECT)* lprc);
export extern(Windows) int FillRect(HDC hDC, const(RECT)* lprc, HBRUSH hbr);
export extern(Windows) int FrameRect(HDC hDC, const(RECT)* lprc, HBRUSH hbr);
export extern(Windows) BOOL InvertRect(HDC hDC, const(RECT)* lprc);
export extern(Windows) BOOL SetRect(LPRECT lprc, int xLeft, int yTop, int xRight, int yBottom);
export extern(Windows) BOOL SetRectEmpty(LPRECT lprc);
export extern(Windows) BOOL CopyRect(LPRECT lprcDst, const(RECT)* lprcSrc);
export extern(Windows) BOOL InflateRect(LPRECT lprc, int dx, int dy);
export extern(Windows) BOOL IntersectRect(LPRECT lprcDst, const(RECT)* lprcSrc1, const(RECT)* lprcSrc2);
export extern(Windows) BOOL UnionRect(LPRECT lprcDst, const(RECT)* lprcSrc1, const(RECT)* lprcSrc2);
export extern(Windows) BOOL SubtractRect(LPRECT lprcDst, const(RECT)* lprcSrc1, const(RECT)* lprcSrc2);
export extern(Windows) BOOL OffsetRect(LPRECT lprc, int dx, int dy);
export extern(Windows) BOOL IsRectEmpty(const(RECT)* lprc);
export extern(Windows) BOOL EqualRect(const(RECT)* lprc1, const(RECT)* lprc2);
export extern(Windows) BOOL PtInRect(const(RECT)* lprc, POINT pt);
export extern(Windows) WORD GetWindowWord(HWND hWnd, int nIndex);
export extern(Windows) WORD SetWindowWord(HWND hWnd, int nIndex, WORD wNewWord);
export extern(Windows) LONG GetWindowLongA(HWND hWnd, int nIndex);
export extern(Windows) LONG GetWindowLongW( HWND hWnd, int nIndex);
version(UNICODE)
	alias GetWindowLongW GetWindowLong;
else
	alias GetWindowLongA GetWindowLong;
export extern(Windows) LONG SetWindowLongA(HWND hWnd, int nIndex, LONG dwNewLong);
export extern(Windows) LONG SetWindowLongW(HWND hWnd, int nIndex, LONG dwNewLong);
version(UNICODE)
	alias SetWindowLongW SetWindowLong;
else
	alias SetWindowLongA SetWindowLong;

version(Win64){
	export extern(Windows) LONG_PTR GetWindowLongPtrA(HWND hWnd, int nIndex);
	export extern(Windows) LONG_PTR GetWindowLongPtrW(HWND hWnd, int nIndex);
	version(UNICODE)
		alias GetWindowLongPtrW GetWindowLongPtr;
	else
		alias GetWindowLongPtrA GetWindowLongPtr;
	export extern(Windows) LONG_PTR SetWindowLongPtrA(HWND hWnd, int nIndex, LONG_PTR dwNewLong);
	export extern(Windows) LONG_PTR SetWindowLongPtrW(HWND hWnd, int nIndex, LONG_PTR dwNewLong);
	version(UNICODE)
		alias SetWindowLongPtrW SetWindowLongPtr;
	else
		alias SetWindowLongPtrA SetWindowLongPtr;
}else{
	alias GetWindowLongA GetWindowLongPtrA;
	alias GetWindowLongW GetWindowLongPtrW;
	version(UNICODE)
		alias GetWindowLongPtrW GetWindowLongPtr;
	else
		alias GetWindowLongPtrA GetWindowLongPtr;
	alias SetWindowLongA SetWindowLongPtrA;
	alias SetWindowLongW SetWindowLongPtrW;
	version(UNICODE)
		alias SetWindowLongPtrW SetWindowLongPtr;
	else
		alias SetWindowLongPtrA SetWindowLongPtr;
}

export extern(Windows) WORD GetClassWord(HWND hWnd, int nIndex);
export extern(Windows) WORD SetClassWord(HWND hWnd, int nIndex, WORD wNewWord);
export extern(Windows) DWORD GetClassLongA(HWND hWnd, int nIndex);
export extern(Windows) DWORD GetClassLongW(HWND hWnd, int nIndex);
version(UNICODE)
	alias GetClassLongW GetClassLong;
else
	alias GetClassLongA GetClassLong;

export extern(Windows) DWORD SetClassLongA(HWND hWnd, int nIndex, LONG dwNewLong);
export extern(Windows) DWORD SetClassLongW(HWND hWnd, int nIndex, LONG dwNewLong);
version(UNICODE)
	alias SetClassLongW SetClassLong;
else
	alias SetClassLongA SetClassLong;

version(Win64){
	export extern(Windows) ULONG_PTR GetClassLongPtrA(HWND hWnd, int nIndex);
	export extern(Windows) ULONG_PTR GetClassLongPtrW(HWND hWnd, int nIndex);
	version(UNICODE)
		alias GetClassLongPtrW GetClassLongPtr;
	else
		alias GetClassLongPtrA GetClassLongPtr;

	export extern(Windows) ULONG_PTR SetClassLongPtrA(HWND hWnd, int nIndex, LONG_PTR dwNewLong);
	export extern(Windows) ULONG_PTR SetClassLongPtrW(HWND hWnd, int nIndex, LONG_PTR dwNewLong);
	version(UNICODE)
		alias SetClassLongPtrW SetClassLongPtr;
	else
		alias SetClassLongPtrA SetClassLongPtr;
}else{
	alias GetClassLongA GetClassLongPtrA;
	alias GetClassLongW GetClassLongPtrW;
	version(UNICODE)
		alias GetClassLongPtrW GetClassLongPtr;
	else
		alias GetClassLongPtrA GetClassLongPtr;

	alias SetClassLongA SetClassLongPtrA;
	alias SetClassLongW SetClassLongPtrW;
	version(UNICODE)
		alias SetClassLongPtrW SetClassLongPtr;
	else
		alias SetClassLongPtrA SetClassLongPtr;
}

export extern(Windows) BOOL GetProcessDefaultLayout(DWORD* pdwDefaultLayout);
export extern(Windows) BOOL SetProcessDefaultLayout(DWORD dwDefaultLayout);

export extern(Windows) HWND GetDesktopWindow();
export extern(Windows) HWND GetParent(HWND hWnd);
export extern(Windows) HWND SetParent(HWND hWndChild, HWND hWndNewParent);
export extern(Windows) BOOL EnumChildWindows(HWND hWndParent, WNDENUMPROC lpEnumFunc, LPARAM lParam);
export extern(Windows) HWND FindWindowA(LPCSTR lpClassName, LPCSTR lpWindowName);
export extern(Windows) HWND FindWindowW(LPCWSTR lpClassName, LPCWSTR lpWindowName);
version(UNICODE)
	alias FindWindowW FindWindow;
else
	alias FindWindowA FindWindow;

export extern(Windows) HWND FindWindowExA(HWND hWndParent, HWND hWndChildAfter, LPCSTR lpszClass, LPCSTR lpszWindow);
export extern(Windows) HWND FindWindowExW(HWND hWndParent, HWND hWndChildAfter, LPCWSTR lpszClass, LPCWSTR lpszWindow);
version(UNICODE)
	alias FindWindowExW FindWindowEx;
else
	alias FindWindowExA FindWindowEx;

export extern(Windows) HWND GetShellWindow();

export extern(Windows) BOOL RegisterShellHookWindow(HWND hwnd);
export extern(Windows) BOOL DeregisterShellHookWindow(HWND hwnd);
export extern(Windows) BOOL EnumWindows(WNDENUMPROC lpEnumFunc, LPARAM lParam);
export extern(Windows) BOOL EnumThreadWindows(DWORD dwThreadId, WNDENUMPROC lpfn, LPARAM lParam);
export extern(Windows) int GetClassNameA(HWND hWnd, LPSTR lpClassName, int nMaxCount);
export extern(Windows) int GetClassNameW(HWND hWnd, LPWSTR lpClassName, int nMaxCount);
version(UNICODE)
	alias GetClassNameW GetClassName;
else
	alias GetClassNameA GetClassName;

export extern(Windows) HWND GetTopWindow(HWND hWnd);

export extern(Windows) DWORD GetWindowThreadProcessId(HWND hWnd, LPDWORD lpdwProcessId);
static if(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	export extern(Windows) BOOL IsGUIThread(BOOL bConvert);

export extern(Windows) HWND GetLastActivePopup(HWND hWnd);

enum {
	GW_HWNDFIRST    = 0,
	GW_HWNDLAST     = 1,
	GW_HWNDNEXT     = 2,
	GW_HWNDPREV     = 3,
	GW_OWNER        = 4,
	GW_CHILD        = 5,
	GW_ENABLEDPOPUP = 6,
	GW_MAX          = 6,
}

export extern(Windows) HWND GetWindow(HWND hWnd, UINT uCmd);
export extern(Windows) HHOOK SetWindowsHookA(int nFilterType, HOOKPROC pfnFilterProc);
export extern(Windows) HHOOK SetWindowsHookW(int nFilterType, HOOKPROC pfnFilterProc);
version(UNICODE)
	alias SetWindowsHookW SetWindowsHook;
else
	alias SetWindowsHookA SetWindowsHook;

export extern(Windows) BOOL UnhookWindowsHook(int nCode, HOOKPROC pfnFilterProc);
export extern(Windows) HHOOK SetWindowsHookExA(int idHook, HOOKPROC lpfn, HINSTANCE hmod, DWORD dwThreadId);
export extern(Windows) HHOOK SetWindowsHookExW(int idHook, HOOKPROC lpfn, HINSTANCE hmod, DWORD dwThreadId);
version(UNICODE)
	alias SetWindowsHookExW SetWindowsHookEx;
else
	alias SetWindowsHookExA SetWindowsHookEx;
export extern(Windows) BOOL UnhookWindowsHookEx(HHOOK hhk);
export extern(Windows) LRESULT CallNextHookEx(HHOOK hhk, int nCode, WPARAM wParam, LPARAM lParam);
enum {
	MF_INSERT          = 0x00000000,
	MF_CHANGE          = 0x00000080,
	MF_APPEND          = 0x00000100,
	MF_DELETE          = 0x00000200,
	MF_REMOVE          = 0x00001000,
	MF_BYCOMMAND       = 0x00000000,
	MF_BYPOSITION      = 0x00000400,
	MF_SEPARATOR       = 0x00000800,
	MF_ENABLED         = 0x00000000,
	MF_GRAYED          = 0x00000001,
	MF_DISABLED        = 0x00000002,
	MF_UNCHECKED       = 0x00000000,
	MF_CHECKED         = 0x00000008,
	MF_USECHECKBITMAPS = 0x00000200,
	MF_STRING          = 0x00000000,
	MF_BITMAP          = 0x00000004,
	MF_OWNERDRAW       = 0x00000100,
	MF_POPUP           = 0x00000010,
	MF_MENUBARBREAK    = 0x00000020,
	MF_MENUBREAK       = 0x00000040,
	MF_UNHILITE        = 0x00000000,
	MF_HILITE          = 0x00000080,
	MF_DEFAULT         = 0x00001000,
	MF_SYSMENU         = 0x00002000,
	MF_HELP            = 0x00004000,
	MF_RIGHTJUSTIFY    = 0x00004000,
	MF_MOUSESELECT     = 0x00008000,
	MF_END             = 0x00000080,
}

enum {
	MFT_STRING       = MF_STRING,
	MFT_BITMAP       = MF_BITMAP,
	MFT_MENUBARBREAK = MF_MENUBARBREAK,
	MFT_MENUBREAK    = MF_MENUBREAK,
	MFT_OWNERDRAW    = MF_OWNERDRAW,
	MFT_RADIOCHECK   = 0x00000200,
	MFT_SEPARATOR    = MF_SEPARATOR,
	MFT_RIGHTORDER   = 0x00002000,
	MFT_RIGHTJUSTIFY = MF_RIGHTJUSTIFY,
}
enum {
	MFS_GRAYED    = 0x00000003,
	MFS_DISABLED  = MFS_GRAYED,
	MFS_CHECKED   = MF_CHECKED,
	MFS_HILITE    = MF_HILITE,
	MFS_ENABLED   = MF_ENABLED,
	MFS_UNCHECKED = MF_UNCHECKED,
	MFS_UNHILITE  = MF_UNHILITE,
	MFS_DEFAULT   = MF_DEFAULT,
}

export extern(Windows) BOOL CheckMenuRadioItem(HMENU hmenu, UINT first, UINT last, UINT check, UINT flags);

struct MENUITEMTEMPLATEHEADER {
	WORD versionNumber;
	WORD offset;
}
alias MENUITEMTEMPLATEHEADER* PMENUITEMTEMPLATEHEADER;

struct MENUITEMTEMPLATE {
	WORD mtOption;
	WORD mtID;
	WCHAR[1] mtString;
}
alias MENUITEMTEMPLATE* PMENUITEMTEMPLATE;
//enum MF_END = 0x00000080;

enum {
	SC_SIZE         = 0xF000,
	SC_MOVE         = 0xF010,
	SC_MINIMIZE     = 0xF020,
	SC_MAXIMIZE     = 0xF030,
	SC_NEXTWINDOW   = 0xF040,
	SC_PREVWINDOW   = 0xF050,
	SC_CLOSE        = 0xF060,
	SC_VSCROLL      = 0xF070,
	SC_HSCROLL      = 0xF080,
	SC_MOUSEMENU    = 0xF090,
	SC_KEYMENU      = 0xF100,
	SC_ARRANGE      = 0xF110,
	SC_RESTORE      = 0xF120,
	SC_TASKLIST     = 0xF130,
	SC_SCREENSAVE   = 0xF140,
	SC_HOTKEY       = 0xF150,
	SC_DEFAULT      = 0xF160,
	SC_MONITORPOWER = 0xF170,
	SC_CONTEXTHELP  = 0xF180,
	SC_SEPARATOR    = 0xF00F,
}

//(WINVER >= _WIN32_WINNT_VISTA)
enum {
	SCF_ISSECURE = 0x00000001,
}

pure nothrow
int GET_SC_WPARAM(WPARAM wParam)
{
	return cast(int)(wParam & 0xFFF0);
}

enum {
	SC_ICON = SC_MINIMIZE,
	SC_ZOOM = SC_MAXIMIZE,
}

export extern(Windows) HBITMAP LoadBitmapA(HINSTANCE hInstance, LPCSTR lpBitmapName);
export extern(Windows) HBITMAP LoadBitmapW(HINSTANCE hInstance, LPCWSTR lpBitmapName);
version(UNICODE)
	alias LoadBitmapW LoadBitmap;
else
	alias LoadBitmapA LoadBitmap;

export extern(Windows) HCURSOR LoadCursorA(HINSTANCE hInstance, LPCSTR lpCursorName);
export extern(Windows) HCURSOR LoadCursorW(HINSTANCE hInstance, LPCWSTR lpCursorName);
version(UNICODE)
	alias LoadCursorW LoadCursor;
else
	alias LoadCursorA LoadCursor;

export extern(Windows) HCURSOR LoadCursorFromFileA(LPCSTR lpFileName);
export extern(Windows) HCURSOR LoadCursorFromFileW(LPCWSTR lpFileName);
version(UNICODE)
	alias LoadCursorFromFileW LoadCursorFromFile;
else
	alias LoadCursorFromFileA LoadCursorFromFile;

export extern(Windows) HCURSOR CreateCursor(HINSTANCE hInst, int xHotSpot, int yHotSpot, int nWidth, int nHeight, const(VOID)* pvANDPlane, const(VOID)* pvXORPlane);
export extern(Windows) BOOL DestroyCursor(HCURSOR hCursor);
alias CopyIcon CopyCursor;

const LPTSTR IDC_ARROW       = MAKEINTRESOURCE(32512);
const LPTSTR IDC_IBEAM       = MAKEINTRESOURCE(32513);
const LPTSTR IDC_WAIT        = MAKEINTRESOURCE(32514);
const LPTSTR IDC_CROSS       = MAKEINTRESOURCE(32515);
const LPTSTR IDC_UPARROW     = MAKEINTRESOURCE(32516);
const LPTSTR IDC_SIZE        = MAKEINTRESOURCE(32640);
const LPTSTR IDC_ICON        = MAKEINTRESOURCE(32641);
const LPTSTR IDC_SIZENWSE    = MAKEINTRESOURCE(32642);
const LPTSTR IDC_SIZENESW    = MAKEINTRESOURCE(32643);
const LPTSTR IDC_SIZEWE      = MAKEINTRESOURCE(32644);
const LPTSTR IDC_SIZENS      = MAKEINTRESOURCE(32645);
const LPTSTR IDC_SIZEALL     = MAKEINTRESOURCE(32646);
const LPTSTR IDC_NO          = MAKEINTRESOURCE(32648);
const LPTSTR IDC_HAND        = MAKEINTRESOURCE(32649);
const LPTSTR IDC_APPSTARTING = MAKEINTRESOURCE(32650);
const LPTSTR IDC_HELP        = MAKEINTRESOURCE(32651);

export extern(Windows) BOOL SetSystemCursor(HCURSOR hcur, DWORD id);

struct ICONINFO {
	BOOL fIcon;
	DWORD xHotspot;
	DWORD yHotspot;
	HBITMAP hbmMask;
	HBITMAP hbmColor;
}
alias ICONINFO* PICONINFO;

export extern(Windows) HICON LoadIconA(HINSTANCE hInstance, LPCSTR lpIconName);
export extern(Windows) HICON LoadIconW(HINSTANCE hInstance, LPCWSTR lpIconName);
version(UNICODE)
	alias LoadIconW LoadIcon;
else
	alias LoadIconA LoadIcon;

export extern(Windows) UINT PrivateExtractIconsA(LPCSTR szFileName, int nIconIndex, int cxIcon, int cyIcon, HICON* phicon, UINT* piconid, UINT nIcons, UINT flags);
export extern(Windows) UINT PrivateExtractIconsW(LPCWSTR szFileName, int nIconIndex, int cxIcon, int cyIcon, HICON* phicon, UINT* piconid, UINT nIcons, UINT flags);
version(UNICODE)
	alias PrivateExtractIconsW PrivateExtractIcons;
else
	alias PrivateExtractIconsA PrivateExtractIcons;

export extern(Windows) HICON CreateIcon(HINSTANCE hInstance, int nWidth, int nHeight, BYTE cPlanes, BYTE cBitsPixel, const(BYTE)* lpbANDbits, const(BYTE)* lpbXORbits);
export extern(Windows) BOOL DestroyIcon(HICON hIcon);
export extern(Windows) int LookupIconIdFromDirectory(PBYTE presbits, BOOL fIcon);
export extern(Windows) int LookupIconIdFromDirectoryEx(PBYTE presbits, BOOL fIcon, int cxDesired, int cyDesired, UINT Flags);
export extern(Windows) HICON CreateIconFromResource(PBYTE presbits, DWORD dwResSize, BOOL fIcon, DWORD dwVer);

export extern(Windows) HICON CreateIconFromResourceEx(PBYTE presbits, DWORD dwResSize, BOOL fIcon, DWORD dwVer, int cxDesired, int cyDesired, UINT Flags);
struct CURSORSHAPE {
	int xHotSpot;
	int yHotSpot;
	int cx;
	int cy;
	int cbWidth;
	BYTE Planes;
	BYTE BitsPixel;
}
alias CURSORSHAPE* LPCURSORSHAPE;

enum {
	IMAGE_BITMAP = 0,
	IMAGE_ICON   = 1,
	IMAGE_CURSOR = 2,
}

enum IMAGE_ENHMETAFILE = 3;

enum {
	LR_DEFAULTCOLOR     = 0x00000000,
	LR_MONOCHROME       = 0x00000001,
	LR_COLOR            = 0x00000002,
	LR_COPYRETURNORG    = 0x00000004,
	LR_COPYDELETEORG    = 0x00000008,
	LR_LOADFROMFILE     = 0x00000010,
	LR_LOADTRANSPARENT  = 0x00000020,
	LR_DEFAULTSIZE      = 0x00000040,
	LR_VGACOLOR         = 0x00000080,
	LR_LOADMAP3DCOLORS  = 0x00001000,
	LR_CREATEDIBSECTION = 0x00002000,
	LR_COPYFROMRESOURCE = 0x00004000,
	LR_SHARED           = 0x00008000,
}

export extern(Windows) HANDLE LoadImageA(HINSTANCE hInst, LPCSTR name, UINT type, int cx, int cy, UINT fuLoad);
export extern(Windows) HANDLE LoadImageW(HINSTANCE hInst, LPCWSTR name, UINT type, int cx, int cy, UINT fuLoad);
version(UNICODE)
	alias LoadImageW LoadImage;
else
	alias LoadImageA LoadImage;

export extern(Windows) HANDLE CopyImage(HANDLE h, UINT type, int cx, int cy, UINT flags);

enum {
	DI_MASK        = 0x0001,
	DI_IMAGE       = 0x0002,
	DI_NORMAL      = 0x0003,
	DI_COMPAT      = 0x0004,
	DI_DEFAULTSIZE = 0x0008,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		DI_NOMIRROR = 0x0010,
}

export extern(Windows) BOOL DrawIconEx(HDC hdc, int xLeft, int yTop, HICON hIcon, int cxWidth, int cyWidth, UINT istepIfAniCur, HBRUSH hbrFlickerFreeDraw, UINT diFlags);


export extern(Windows) HICON CreateIconIndirect(PICONINFO piconinfo);
export extern(Windows) HICON CopyIcon(HICON hIcon);
export extern(Windows) BOOL GetIconInfo(HICON hIcon, PICONINFO piconinfo);

//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	struct ICONINFOEXA {
		DWORD cbSize;
		BOOL fIcon;
		DWORD xHotspot;
		DWORD yHotspot;
		HBITMAP hbmMask;
		HBITMAP hbmColor;
		WORD wResID;
		CHAR[MAX_PATH] szModName;
		CHAR[MAX_PATH] szResName;
	}
	alias ICONINFOEXA* PICONINFOEXA;
	struct ICONINFOEXW {
		DWORD cbSize;
		BOOL fIcon;
		DWORD xHotspot;
		DWORD yHotspot;
		HBITMAP hbmMask;
		HBITMAP hbmColor;
		WORD wResID;
		WCHAR[MAX_PATH] szModName;
		WCHAR[MAX_PATH] szResName;
	}
	alias ICONINFOEXW* PICONINFOEXW;
	version(UNICODE){
		alias ICONINFOEXW ICONINFOEX;
		alias PICONINFOEXW PICONINFOEX;
	}else{
		alias ICONINFOEXA ICONINFOEX;
		alias PICONINFOEXA PICONINFOEX;
	}

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	export extern(Windows) BOOL GetIconInfoExA(HICON hicon, PICONINFOEXA piconinfo);
	export extern(Windows) BOOL GetIconInfoExW(HICON hicon, PICONINFOEXW piconinfo);
	version(UNICODE)
		alias GetIconInfoExW GetIconInfoEx;
	else
		alias GetIconInfoExA GetIconInfoEx;
}

enum {
	RES_ICON   = 1,
	RES_CURSOR = 2,
}

enum {
	OBM_CLOSE       = 32754,
	OBM_UPARROW     = 32753,
	OBM_DNARROW     = 32752,
	OBM_RGARROW     = 32751,
	OBM_LFARROW     = 32750,
	OBM_REDUCE      = 32749,
	OBM_ZOOM        = 32748,
	OBM_RESTORE     = 32747,
	OBM_REDUCED     = 32746,
	OBM_ZOOMD       = 32745,
	OBM_RESTORED    = 32744,
	OBM_UPARROWD    = 32743,
	OBM_DNARROWD    = 32742,
	OBM_RGARROWD    = 32741,
	OBM_LFARROWD    = 32740,
	OBM_MNARROW     = 32739,
	OBM_COMBO       = 32738,
	OBM_UPARROWI    = 32737,
	OBM_DNARROWI    = 32736,
	OBM_RGARROWI    = 32735,
	OBM_LFARROWI    = 32734,
	OBM_OLD_CLOSE   = 32767,
	OBM_SIZE        = 32766,
	OBM_OLD_UPARROW = 32765,
	OBM_OLD_DNARROW = 32764,
	OBM_OLD_RGARROW = 32763,
	OBM_OLD_LFARROW = 32762,
	OBM_BTSIZE      = 32761,
	OBM_CHECK       = 32760,
	OBM_CHECKBOXES  = 32759,
	OBM_BTNCORNERS  = 32758,
	OBM_OLD_REDUCE  = 32757,
	OBM_OLD_ZOOM    = 32756,
	OBM_OLD_RESTORE = 32755,
}

enum {
	OCR_NORMAL      = 32512,
	OCR_IBEAM       = 32513,
	OCR_WAIT        = 32514,
	OCR_CROSS       = 32515,
	OCR_UP          = 32516,
	OCR_SIZE        = 32640,
	OCR_ICON        = 32641,
	OCR_SIZENWSE    = 32642,
	OCR_SIZENESW    = 32643,
	OCR_SIZEWE      = 32644,
	OCR_SIZENS      = 32645,
	OCR_SIZEALL     = 32646,
	OCR_ICOCUR      = 32647,
	OCR_NO          = 32648,
	OCR_HAND        = 32649,
	OCR_APPSTARTING = 32650,
}

enum {
	OIC_SAMPLE      = 32512,
	OIC_HAND        = 32513,
	OIC_QUES        = 32514,
	OIC_BANG        = 32515,
	OIC_NOTE        = 32516,
	OIC_WINLOGO     = 32517,
	OIC_WARNING     = OIC_BANG,
	OIC_ERROR       = OIC_HAND,
	OIC_INFORMATION = OIC_NOTE,
	//(WINVER >= _WIN32_WINNT_VISTA)
		OIC_SHIELD = 32518,
}

enum ORD_LANGDRIVER = 1;

const LPTSTR IDI_APPLICATION = MAKEINTRESOURCE(32512);
const LPTSTR IDI_HAND        = MAKEINTRESOURCE(32513);
const LPTSTR IDI_QUESTION    = MAKEINTRESOURCE(32514);
const LPTSTR IDI_EXCLAMATION = MAKEINTRESOURCE(32515);
const LPTSTR IDI_ASTERISK    = MAKEINTRESOURCE(32516);
const LPTSTR IDI_WINLOGO = MAKEINTRESOURCE(32517);
//(WINVER >= _WIN32_WINNT_VISTA)
	const LPTSTR IDI_SHIELD = MAKEINTRESOURCE(32518);

alias IDI_EXCLAMATION IDI_WARNING;
alias IDI_HAND IDI_ERROR;
alias IDI_ASTERISK IDI_INFORMATION;

export extern(Windows) int LoadStringA(HINSTANCE hInstance, UINT uID, LPSTR lpBuffer, int cchBufferMax);
export extern(Windows) int LoadStringW(HINSTANCE hInstance, UINT uID, LPWSTR lpBuffer, int cchBufferMax);
version(UNICODE)
	alias LoadStringW LoadString;
else
	alias LoadStringA LoadString;

enum {
	IDOK       = 1,
	IDCANCEL   = 2,
	IDABORT    = 3,
	IDRETRY    = 4,
	IDIGNORE   = 5,
	IDYES      = 6,
	IDNO       = 7,
	IDCLOSE    = 8,
	IDHELP     = 9,
	IDTRYAGAIN = 10,
	IDCONTINUE = 11,
	//(WINVER >= _WIN32_WINNT_WINXP)
		IDTIMEOUT = 32000,
}

enum {
	ES_LEFT        = 0x0000,
	ES_CENTER      = 0x0001,
	ES_RIGHT       = 0x0002,
	ES_MULTILINE   = 0x0004,
	ES_UPPERCASE   = 0x0008,
	ES_LOWERCASE   = 0x0010,
	ES_PASSWORD    = 0x0020,
	ES_AUTOVSCROLL = 0x0040,
	ES_AUTOHSCROLL = 0x0080,
	ES_NOHIDESEL   = 0x0100,
	ES_OEMCONVERT  = 0x0400,
	ES_READONLY    = 0x0800,
	ES_WANTRETURN  = 0x1000,
	ES_NUMBER      = 0x2000,
}

enum {
	EN_SETFOCUS     = 0x0100,
	EN_KILLFOCUS    = 0x0200,
	EN_CHANGE       = 0x0300,
	EN_UPDATE       = 0x0400,
	EN_ERRSPACE     = 0x0500,
	EN_MAXTEXT      = 0x0501,
	EN_HSCROLL      = 0x0601,
	EN_VSCROLL      = 0x0602,
	EN_ALIGN_LTR_EC = 0x0700,
	EN_ALIGN_RTL_EC = 0x0701,
}

enum {
	EC_LEFTMARGIN  = 0x0001,
	EC_RIGHTMARGIN = 0x0002,
	EC_USEFONTINFO = 0xffff,
}

enum {
	EMSIS_COMPOSITIONSTRING        = 0x0001,
	EIMES_GETCOMPSTRATONCE         = 0x0001,
	EIMES_CANCELCOMPSTRINFOCUS     = 0x0002,
	EIMES_COMPLETECOMPSTRKILLFOCUS = 0x0004,
}

enum {
	EM_GETSEL              = 0x00B0,
	EM_SETSEL              = 0x00B1,
	EM_GETRECT             = 0x00B2,
	EM_SETRECT             = 0x00B3,
	EM_SETRECTNP           = 0x00B4,
	EM_SCROLL              = 0x00B5,
	EM_LINESCROLL          = 0x00B6,
	EM_SCROLLCARET         = 0x00B7,
	EM_GETMODIFY           = 0x00B8,
	EM_SETMODIFY           = 0x00B9,
	EM_GETLINECOUNT        = 0x00BA,
	EM_LINEINDEX           = 0x00BB,
	EM_SETHANDLE           = 0x00BC,
	EM_GETHANDLE           = 0x00BD,
	EM_GETTHUMB            = 0x00BE,
	EM_LINELENGTH          = 0x00C1,
	EM_REPLACESEL          = 0x00C2,
	EM_GETLINE             = 0x00C4,
	EM_LIMITTEXT           = 0x00C5,
	EM_CANUNDO             = 0x00C6,
	EM_UNDO                = 0x00C7,
	EM_FMTLINES            = 0x00C8,
	EM_LINEFROMCHAR        = 0x00C9,
	EM_SETTABSTOPS         = 0x00CB,
	EM_SETPASSWORDCHAR     = 0x00CC,
	EM_EMPTYUNDOBUFFER     = 0x00CD,
	EM_GETFIRSTVISIBLELINE = 0x00CE,
	EM_SETREADONLY         = 0x00CF,
	EM_SETWORDBREAKPROC    = 0x00D0,
	EM_GETWORDBREAKPROC    = 0x00D1,
	EM_GETPASSWORDCHAR     = 0x00D2,
	EM_SETMARGINS          = 0x00D3,
	EM_GETMARGINS          = 0x00D4,
	EM_SETLIMITTEXT        = EM_LIMITTEXT,
	EM_GETLIMITTEXT        = 0x00D5,
	EM_POSFROMCHAR         = 0x00D6,
	EM_CHARFROMPOS         = 0x00D7,
	EM_SETIMESTATUS        = 0x00D8,
	EM_GETIMESTATUS        = 0x00D9,
}

enum {
	WB_LEFT        = 0,
	WB_RIGHT       = 1,
	WB_ISDELIMITER = 2,
}

enum {
	BS_PUSHBUTTON      = 0x00000000,
	BS_DEFPUSHBUTTON   = 0x00000001,
	BS_CHECKBOX        = 0x00000002,
	BS_AUTOCHECKBOX    = 0x00000003,
	BS_RADIOBUTTON     = 0x00000004,
	BS_3STATE          = 0x00000005,
	BS_AUTO3STATE      = 0x00000006,
	BS_GROUPBOX        = 0x00000007,
	BS_USERBUTTON      = 0x00000008,
	BS_AUTORADIOBUTTON = 0x00000009,
	BS_PUSHBOX         = 0x0000000A,
	BS_OWNERDRAW       = 0x0000000B,
	BS_TYPEMASK        = 0x0000000F,
	BS_LEFTTEXT        = 0x00000020,
	BS_TEXT            = 0x00000000,
	BS_ICON            = 0x00000040,
	BS_BITMAP          = 0x00000080,
	BS_LEFT            = 0x00000100,
	BS_RIGHT           = 0x00000200,
	BS_CENTER          = 0x00000300,
	BS_TOP             = 0x00000400,
	BS_BOTTOM          = 0x00000800,
	BS_VCENTER         = 0x00000C00,
	BS_PUSHLIKE        = 0x00001000,
	BS_MULTILINE       = 0x00002000,
	BS_NOTIFY          = 0x00004000,
	BS_FLAT            = 0x00008000,
	BS_RIGHTBUTTON     = BS_LEFTTEXT,
}

enum {
	BN_CLICKED       = 0,
	BN_PAINT         = 1,
	BN_HILITE        = 2,
	BN_UNHILITE      = 3,
	BN_DISABLE       = 4,
	BN_DOUBLECLICKED = 5,
	BN_PUSHED        = BN_HILITE,
	BN_UNPUSHED      = BN_UNHILITE,
	BN_DBLCLK        = BN_DOUBLECLICKED,
	BN_SETFOCUS      = 6,
	BN_KILLFOCUS     = 7,
}

enum {
	BM_GETCHECK = 0x00F0,
	BM_SETCHECK = 0x00F1,
	BM_GETSTATE = 0x00F2,
	BM_SETSTATE = 0x00F3,
	BM_SETSTYLE = 0x00F4,
	BM_CLICK    = 0x00F5,
	BM_GETIMAGE = 0x00F6,
	BM_SETIMAGE = 0x00F7,
	//(WINVER >= _WIN32_WINNT_VISTA)
		BM_SETDONTCLICK = 0x00F8,
}

enum {
	BST_UNCHECKED     = 0x0000,
	BST_CHECKED       = 0x0001,
	BST_INDETERMINATE = 0x0002,
	BST_PUSHED        = 0x0004,
	BST_FOCUS         = 0x0008,
}

enum {
	SS_LEFT           = 0x00000000,
	SS_CENTER         = 0x00000001,
	SS_RIGHT          = 0x00000002,
	SS_ICON           = 0x00000003,
	SS_BLACKRECT      = 0x00000004,
	SS_GRAYRECT       = 0x00000005,
	SS_WHITERECT      = 0x00000006,
	SS_BLACKFRAME     = 0x00000007,
	SS_GRAYFRAME      = 0x00000008,
	SS_WHITEFRAME     = 0x00000009,
	SS_USERITEM       = 0x0000000A,
	SS_SIMPLE         = 0x0000000B,
	SS_LEFTNOWORDWRAP = 0x0000000C,
	SS_OWNERDRAW      = 0x0000000D,
	SS_BITMAP         = 0x0000000E,
	SS_ENHMETAFILE    = 0x0000000F,
	SS_ETCHEDHORZ     = 0x00000010,
	SS_ETCHEDVERT     = 0x00000011,
	SS_ETCHEDFRAME    = 0x00000012,
	SS_TYPEMASK       = 0x0000001F,
	//(WINVER >= _WIN32_WINNT_WINXP)
		SS_REALSIZECONTROL = 0x00000040,
	SS_NOPREFIX       = 0x00000080,
	SS_NOTIFY         = 0x00000100,
	SS_CENTERIMAGE    = 0x00000200,
	SS_RIGHTJUST      = 0x00000400,
	SS_REALSIZEIMAGE  = 0x00000800,
	SS_SUNKEN         = 0x00001000,
	SS_EDITCONTROL    = 0x00002000,
	SS_ENDELLIPSIS    = 0x00004000,
	SS_PATHELLIPSIS   = 0x00008000,
	SS_WORDELLIPSIS   = 0x0000C000,
	SS_ELLIPSISMASK   = 0x0000C000,
}

enum {
	STM_SETICON  = 0x0170,
	STM_GETICON  = 0x0171,
	STM_SETIMAGE = 0x0172,
}
enum {
	STM_GETIMAGE = 0x0173,
	STN_CLICKED  = 0,
	STN_DBLCLK   = 1,
	STN_ENABLE   = 2,
	STN_DISABLE  = 3,
}
enum STM_MSGMAX = 0x0174;

enum WC_DIALOG = MAKEINTATOM(0x8002);

enum {
	DWL_MSGRESULT = 0,
	DWL_DLGPROC   = 4,
	DWL_USER      = 8,
}
enum {
	DWLP_MSGRESULT  = 0,
	DWLP_DLGPROC    = DWLP_MSGRESULT + LRESULT.sizeof,
	DWLP_USER       = DWLP_DLGPROC + DLGPROC.sizeof,
}

export extern(Windows) BOOL IsDialogMessageA(HWND hDlg, LPMSG lpMsg);
export extern(Windows) BOOL IsDialogMessageW(HWND hDlg, LPMSG lpMsg);
version(UNICODE)
	alias IsDialogMessageW IsDialogMessage;
else
	alias IsDialogMessageA IsDialogMessage;

export extern(Windows) BOOL MapDialogRect(HWND hDlg, LPRECT lpRect);
export extern(Windows) int DlgDirListA(HWND hDlg, LPSTR lpPathSpec, int nIDListBox, int nIDStaticPath, UINT uFileType);
export extern(Windows) int DlgDirListW(HWND hDlg, LPWSTR lpPathSpec, int nIDListBox, int nIDStaticPath, UINT uFileType);
version(UNICODE)
	alias DlgDirListW DlgDirList;
else
	alias DlgDirListA DlgDirList;

enum {
	DDL_READWRITE  = 0x0000,
	DDL_READONLY   = 0x0001,
	DDL_HIDDEN     = 0x0002,
	DDL_SYSTEM     = 0x0004,
	DDL_DIRECTORY  = 0x0010,
	DDL_ARCHIVE    = 0x0020,
	DDL_POSTMSGS   = 0x2000,
	DDL_DRIVES     = 0x4000,
	DDL_EXCLUSIVE  = 0x8000,
}

export extern(Windows) BOOL DlgDirSelectExA(HWND hwndDlg, LPSTR lpString, int chCount, int idListBox);
export extern(Windows) BOOL DlgDirSelectExW(HWND hwndDlg, LPWSTR lpString, int chCount, int idListBox);
version(UNICODE)
	alias DlgDirSelectExW DlgDirSelectEx;
else
	alias DlgDirSelectExA DlgDirSelectEx;

export extern(Windows) int DlgDirListComboBoxA(HWND hDlg, LPSTR lpPathSpec, int nIDComboBox, int nIDStaticPath, UINT uFiletype);
export extern(Windows) int DlgDirListComboBoxW(HWND hDlg, LPWSTR lpPathSpec, int nIDComboBox, int nIDStaticPath, UINT uFiletype);
version(UNICODE)
	alias DlgDirListComboBoxW DlgDirListComboBox;
else
	alias DlgDirListComboBoxA DlgDirListComboBox;

export extern(Windows) BOOL DlgDirSelectComboBoxExA(HWND hwndDlg, LPSTR lpString, int cchOut, int idComboBox);
export extern(Windows) BOOL DlgDirSelectComboBoxExW(HWND hwndDlg, LPWSTR lpString, int cchOut, int idComboBox);
version(UNICODE)
	alias DlgDirSelectComboBoxExW DlgDirSelectComboBoxEx;
else
	alias DlgDirSelectComboBoxExA DlgDirSelectComboBoxEx;

enum {
	DS_ABSALIGN       = 0x01,
	DS_SYSMODAL       = 0x02,
	DS_LOCALEDIT      = 0x20,
	DS_SETFONT        = 0x40,
	DS_MODALFRAME     = 0x80,
	DS_NOIDLEMSG      = 0x100,
	DS_SETFOREGROUND  = 0x200,
	DS_3DLOOK        = 0x0004,
	DS_FIXEDSYS      = 0x0008,
	DS_NOFAILCREATE  = 0x0010,
	DS_CONTROL       = 0x0400,
	DS_CENTER        = 0x0800,
	DS_CENTERMOUSE   = 0x1000,
	DS_CONTEXTHELP   = 0x2000,
	DS_SHELLFONT     = DS_SETFONT | DS_FIXEDSYS,
}

//(_WIN32_WCE >= 0x0500)
//	enum DS_USEPIXELS = 0x8000;

enum {
	DM_GETDEFID   = WM_USER + 0,
	DM_SETDEFID   = WM_USER + 1,
	DM_REPOSITION = WM_USER + 2,
}

enum DC_HASDEFID = 0x534B;

enum {
	DLGC_WANTARROWS       = 0x0001,
	DLGC_WANTTAB          = 0x0002,
	DLGC_WANTALLKEYS      = 0x0004,
	DLGC_WANTMESSAGE      = 0x0004,
	DLGC_HASSETSEL        = 0x0008,
	DLGC_DEFPUSHBUTTON    = 0x0010,
	DLGC_UNDEFPUSHBUTTON  = 0x0020,
	DLGC_RADIOBUTTON      = 0x0040,
	DLGC_WANTCHARS        = 0x0080,
	DLGC_STATIC           = 0x0100,
	DLGC_BUTTON           = 0x2000,
}
enum {
	LB_CTLCODE     = 0,
	LB_OKAY        = 0,
	LB_ERR         = -1,
	LB_ERRSPACE    = -2,
	LBN_ERRSPACE   = -2,
	LBN_SELCHANGE  = 1,
	LBN_DBLCLK     = 2,
	LBN_SELCANCEL  = 3,
	LBN_SETFOCUS   = 4,
	LBN_KILLFOCUS  = 5,
}

enum {
	LB_ADDSTRING           = 0x0180,
	LB_INSERTSTRING        = 0x0181,
	LB_DELETESTRING        = 0x0182,
	LB_SELITEMRANGEEX      = 0x0183,
	LB_RESETCONTENT        = 0x0184,
	LB_SETSEL              = 0x0185,
	LB_SETCURSEL           = 0x0186,
	LB_GETSEL              = 0x0187,
	LB_GETCURSEL           = 0x0188,
	LB_GETTEXT             = 0x0189,
	LB_GETTEXTLEN          = 0x018A,
	LB_GETCOUNT            = 0x018B,
	LB_SELECTSTRING        = 0x018C,
	LB_DIR                 = 0x018D,
	LB_GETTOPINDEX         = 0x018E,
	LB_FINDSTRING          = 0x018F,
	LB_GETSELCOUNT         = 0x0190,
	LB_GETSELITEMS         = 0x0191,
	LB_SETTABSTOPS         = 0x0192,
	LB_GETHORIZONTALEXTENT = 0x0193,
	LB_SETHORIZONTALEXTENT = 0x0194,
	LB_SETCOLUMNWIDTH      = 0x0195,
	LB_ADDFILE             = 0x0196,
	LB_SETTOPINDEX         = 0x0197,
	LB_GETITEMRECT         = 0x0198,
	LB_GETITEMDATA         = 0x0199,
	LB_SETITEMDATA         = 0x019A,
	LB_SELITEMRANGE        = 0x019B,
	LB_SETANCHORINDEX      = 0x019C,
	LB_GETANCHORINDEX      = 0x019D,
	LB_SETCARETINDEX       = 0x019E,
	LB_GETCARETINDEX       = 0x019F,
	LB_SETITEMHEIGHT       = 0x01A0,
	LB_GETITEMHEIGHT       = 0x01A1,
	LB_FINDSTRINGEXACT     = 0x01A2,
	LB_SETLOCALE           = 0x01A5,
	LB_GETLOCALE           = 0x01A6,
	LB_SETCOUNT            = 0x01A7,
	LB_INITSTORAGE         = 0x01A8,
	LB_ITEMFROMPOINT       = 0x01A9,
}
//(_WIN32_WCE >= 0x0400)
	//enum LB_MULTIPLEADDSTRING = 0x01B1;
//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	enum LB_GETLISTBOXINFO    = 0x01B2;
//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	enum LB_MSGMAX            = 0x01B3;
//else if(_WIN32_WCE >= 0x0400)
//	enum LB_MSGMAX            = 0x01B1;
//else if(WINVER >= 0x0400)
//	enum LB_MSGMAX         = 0x01B0;
//else
//	enum LB_MSGMAX         = 0x01A8;

enum {
	LBS_NOTIFY            = 0x0001,
	LBS_SORT              = 0x0002,
	LBS_NOREDRAW          = 0x0004,
	LBS_MULTIPLESEL       = 0x0008,
	LBS_OWNERDRAWFIXED    = 0x0010,
	LBS_OWNERDRAWVARIABLE = 0x0020,
	LBS_HASSTRINGS        = 0x0040,
	LBS_USETABSTOPS       = 0x0080,
	LBS_NOINTEGRALHEIGHT  = 0x0100,
	LBS_MULTICOLUMN       = 0x0200,
	LBS_WANTKEYBOARDINPUT = 0x0400,
	LBS_EXTENDEDSEL       = 0x0800,
	LBS_DISABLENOSCROLL   = 0x1000,
	LBS_NODATA            = 0x2000,
	LBS_NOSEL             = 0x4000,
	LBS_COMBOBOX          = 0x8000,
	LBS_STANDARD          = LBS_NOTIFY | LBS_SORT | WS_VSCROLL | WS_BORDER,
}

enum {
	CB_OKAY     = 0,
	CB_ERR      = -1,
	CB_ERRSPACE = -2,
}

enum {
	CBN_ERRSPACE     = -1,
	CBN_SELCHANGE    = 1,
	CBN_DBLCLK       = 2,
	CBN_SETFOCUS     = 3,
	CBN_KILLFOCUS    = 4,
	CBN_EDITCHANGE   = 5,
	CBN_EDITUPDATE   = 6,
	CBN_DROPDOWN     = 7,
	CBN_CLOSEUP      = 8,
	CBN_SELENDOK     = 9,
	CBN_SELENDCANCEL = 10,
}

enum {
	CBS_SIMPLE            = 0x0001,
	CBS_DROPDOWN          = 0x0002,
	CBS_DROPDOWNLIST      = 0x0003,
	CBS_OWNERDRAWFIXED    = 0x0010,
	CBS_OWNERDRAWVARIABLE = 0x0020,
	CBS_AUTOHSCROLL       = 0x0040,
	CBS_OEMCONVERT        = 0x0080,
	CBS_SORT              = 0x0100,
	CBS_HASSTRINGS        = 0x0200,
	CBS_NOINTEGRALHEIGHT  = 0x0400,
	CBS_DISABLENOSCROLL   = 0x0800,
	CBS_UPPERCASE         = 0x2000,
	CBS_LOWERCASE         = 0x4000,
}

enum {
	CB_GETEDITSEL            = 0x0140,
	CB_LIMITTEXT             = 0x0141,
	CB_SETEDITSEL            = 0x0142,
	CB_ADDSTRING             = 0x0143,
	CB_DELETESTRING          = 0x0144,
	CB_DIR                   = 0x0145,
	CB_GETCOUNT              = 0x0146,
	CB_GETCURSEL             = 0x0147,
	CB_GETLBTEXT             = 0x0148,
	CB_GETLBTEXTLEN          = 0x0149,
	CB_INSERTSTRING          = 0x014A,
	CB_RESETCONTENT          = 0x014B,
	CB_FINDSTRING            = 0x014C,
	CB_SELECTSTRING          = 0x014D,
	CB_SETCURSEL             = 0x014E,
	CB_SHOWDROPDOWN          = 0x014F,
	CB_GETITEMDATA           = 0x0150,
	CB_SETITEMDATA           = 0x0151,
	CB_GETDROPPEDCONTROLRECT = 0x0152,
	CB_SETITEMHEIGHT         = 0x0153,
	CB_GETITEMHEIGHT         = 0x0154,
	CB_SETEXTENDEDUI         = 0x0155,
	CB_GETEXTENDEDUI         = 0x0156,
	CB_GETDROPPEDSTATE       = 0x0157,
	CB_FINDSTRINGEXACT       = 0x0158,
	CB_SETLOCALE             = 0x0159,
	CB_GETLOCALE             = 0x015A,
	CB_GETTOPINDEX         = 0x015b,
	CB_SETTOPINDEX         = 0x015c,
	CB_GETHORIZONTALEXTENT = 0x015d,
	CB_SETHORIZONTALEXTENT = 0x015e,
	CB_GETDROPPEDWIDTH     = 0x015f,
	CB_SETDROPPEDWIDTH     = 0x0160,
	CB_INITSTORAGE         = 0x0161,
}
//(_WIN32_WCE >= 0x0400)
	//enum CB_MULTIPLEADDSTRING = 0x0163;

//(_WIN32_WINNT >= 0x0501)
	enum CB_GETCOMBOBOXINFO = 0x0164;

//(_WIN32_WINNT >= 0x0501)
	enum CB_MSGMAX = 0x0165;
/*else(_WIN32_WCE >= 0x0400)
	enum CB_MSGMAX = 0x0163;
else(WINVER >= 0x0400)
	enum CB_MSGMAX = 0x0162;
else
	enum CB_MSGMAX = 0x015B;*/

enum {
	SBS_HORZ                    = 0x0000,
	SBS_VERT                    = 0x0001,
	SBS_TOPALIGN                = 0x0002,
	SBS_LEFTALIGN               = 0x0002,
	SBS_BOTTOMALIGN             = 0x0004,
	SBS_RIGHTALIGN              = 0x0004,
	SBS_SIZEBOXTOPLEFTALIGN     = 0x0002,
	SBS_SIZEBOXBOTTOMRIGHTALIGN = 0x0004,
	SBS_SIZEBOX                 = 0x0008,
	SBS_SIZEGRIP                = 0x0010,
}

enum {
	SBM_SETPOS         = 0x00E0,
	SBM_GETPOS         = 0x00E1,
	SBM_SETRANGE       = 0x00E2,
	SBM_SETRANGEREDRAW = 0x00E6,
	SBM_GETRANGE       = 0x00E3,
	SBM_ENABLE_ARROWS  = 0x00E4,
	SBM_SETSCROLLINFO = 0x00E9,
	SBM_GETSCROLLINFO = 0x00EA,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		SBM_GETSCROLLBARINFO = 0x00EB,
}

enum {
	SIF_RANGE           = 0x0001,
	SIF_PAGE            = 0x0002,
	SIF_POS             = 0x0004,
	SIF_DISABLENOSCROLL = 0x0008,
	SIF_TRACKPOS        = 0x0010,
	SIF_ALL             = SIF_RANGE | SIF_PAGE | SIF_POS | SIF_TRACKPOS,
}

struct SCROLLINFO {
	UINT cbSize;
	UINT fMask;
	int nMin;
	int nMax;
	UINT nPage;
	int nPos;
	int nTrackPos;
}
alias SCROLLINFO* LPSCROLLINFO;
alias SCROLLINFO* LPCSCROLLINFO;

export extern(Windows) int SetScrollInfo(HWND hwnd, int nBar, LPCSCROLLINFO lpsi, BOOL redraw);
export extern(Windows) BOOL GetScrollInfo(HWND hwnd, int nBar, LPSCROLLINFO lpsi);

enum MDIS_ALLCHILDSTYLES = 0x0001;
enum {
	MDITILE_VERTICAL     = 0x0000,
	MDITILE_HORIZONTAL   = 0x0001,
	MDITILE_SKIPDISABLED = 0x0002,
	MDITILE_ZORDER       = 0x0004,
}

struct MDICREATESTRUCTA {
	LPCSTR szClass;
	LPCSTR szTitle;
	HANDLE hOwner;
	int x;
	int y;
	int cx;
	int cy;
	DWORD style;
	LPARAM lParam;
}
alias MDICREATESTRUCTA* LPMDICREATESTRUCTA;
struct MDICREATESTRUCTW {
	LPCWSTR szClass;
	LPCWSTR szTitle;
	HANDLE hOwner;
	int x;
	int y;
	int cx;
	int cy;
	DWORD style;
	LPARAM lParam;
}
alias MDICREATESTRUCTW* LPMDICREATESTRUCTW;
version(UNICODE){
	alias MDICREATESTRUCTW MDICREATESTRUCT;
	alias LPMDICREATESTRUCTW LPMDICREATESTRUCT;
}else{
	alias MDICREATESTRUCTA MDICREATESTRUCT;
	alias LPMDICREATESTRUCTA LPMDICREATESTRUCT;
}

struct CLIENTCREATESTRUCT {
	HANDLE hWindowMenu;
	UINT idFirstChild;
}
alias CLIENTCREATESTRUCT* LPCLIENTCREATESTRUCT;

export extern(Windows) LRESULT DefFrameProcA(HWND hWnd, HWND hWndMDIClient, UINT uMsg, WPARAM wParam, LPARAM lParam);
export extern(Windows) LRESULT DefFrameProcW(HWND hWnd, HWND hWndMDIClient, UINT uMsg, WPARAM wParam, LPARAM lParam);
version(UNICODE)
	alias DefFrameProcW DefFrameProc;
else
	alias DefFrameProcA DefFrameProc;

export extern(Windows) LRESULT DefMDIChildProcA(HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam);
export extern(Windows) LRESULT DefMDIChildProcW(HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam);
version(UNICODE)
	alias DefMDIChildProcW DefMDIChildProc;
else
	alias DefMDIChildProcA DefMDIChildProc;

export extern(Windows) BOOL TranslateMDISysAccel(HWND hWndClient, LPMSG lpMsg);
export extern(Windows) UINT ArrangeIconicWindows(HWND hWnd);

export extern(Windows) HWND CreateMDIWindowA(LPCSTR lpClassName, LPCSTR lpWindowName, DWORD dwStyle, int X, int Y, int nWidth, int nHeight, HWND hWndParent, HINSTANCE hInstance, LPARAM lParam);
export extern(Windows) HWND CreateMDIWindowW(LPCWSTR lpClassName, LPCWSTR lpWindowName, DWORD dwStyle, int X, int Y, int nWidth, int nHeight, HWND hWndParent, HINSTANCE hInstance, LPARAM lParam);
version(UNICODE)
	alias CreateMDIWindowW CreateMDIWindow;
else
	alias CreateMDIWindowA CreateMDIWindow;

export extern(Windows) WORD TileWindows(HWND hwndParent, UINT wHow, const(RECT)* lpRect, UINT cKids, const(HWND)* lpKids);
export extern(Windows) WORD CascadeWindows(HWND hwndParent, UINT wHow, const(RECT)* lpRect, UINT cKids, const(HWND)* lpKids);

alias DWORD HELPPOLY;
struct MULTIKEYHELPA {
	DWORD mkSize;
	CHAR mkKeylist;
	CHAR[1] szKeyphrase;
}
alias MULTIKEYHELPA* PMULTIKEYHELPA;
alias MULTIKEYHELPA* LPMULTIKEYHELPA;
struct MULTIKEYHELPW {
	DWORD mkSize;
	WCHAR mkKeylist;
	WCHAR[1] szKeyphrase;
}
alias MULTIKEYHELPW* PMULTIKEYHELPW;
alias MULTIKEYHELPW* LPMULTIKEYHELPW;
version(UNICODE){
	alias MULTIKEYHELPW MULTIKEYHELP;
	alias PMULTIKEYHELPW PMULTIKEYHELP;
	alias LPMULTIKEYHELPW LPMULTIKEYHELP;
}else{
	alias MULTIKEYHELPA MULTIKEYHELP;
	alias PMULTIKEYHELPA PMULTIKEYHELP;
	alias LPMULTIKEYHELPA LPMULTIKEYHELP;
}

struct HELPWININFOA {
	int wStructSize;
	int x;
	int y;
	int dx;
	int dy;
	int wMax;
	CHAR[2] rgchMember;
}
alias HELPWININFOA* PHELPWININFOA;
alias HELPWININFOA* LPHELPWININFOA;
struct HELPWININFOW {
	int wStructSize;
	int x;
	int y;
	int dx;
	int dy;
	int wMax;
	WCHAR[2] rgchMember;
}
alias HELPWININFOW* PHELPWININFOW;
alias HELPWININFOW* LPHELPWININFOW;
version(UNICODE){
	alias HELPWININFOW HELPWININFO;
	alias PHELPWININFOW PHELPWININFO;
	alias LPHELPWININFOW LPHELPWININFO;
}else{
	alias HELPWININFOA HELPWININFO;
	alias PHELPWININFOA PHELPWININFO;
	alias LPHELPWININFOA LPHELPWININFO;
}

enum {
	HELP_CONTEXT            = 0x0001,
	HELP_QUIT               = 0x0002,
	HELP_INDEX              = 0x0003,
	HELP_CONTENTS           = 0x0003,
	HELP_HELPONHELP         = 0x0004,
	HELP_SETINDEX           = 0x0005,
	HELP_SETCONTENTS        = 0x0005,
	HELP_CONTEXTPOPUP       = 0x0008,
	HELP_FORCEFILE          = 0x0009,
	HELP_KEY                = 0x0101,
	HELP_COMMAND            = 0x0102,
	HELP_PARTIALKEY         = 0x0105,
	HELP_MULTIKEY           = 0x0201,
	HELP_SETWINPOS          = 0x0203,
	HELP_CONTEXTMENU        = 0x000a,
	HELP_FINDER             = 0x000b,
	HELP_WM_HELP            = 0x000c,
	HELP_SETPOPUP_POS       = 0x000d,
	HELP_TCARD              = 0x8000,
	HELP_TCARD_DATA         = 0x0010,
	HELP_TCARD_OTHER_CALLER = 0x0011,
}

enum {
	IDH_NO_HELP             = 28440,
	IDH_MISSING_CONTEXT     = 28441,
	IDH_GENERIC_HELP_BUTTON = 28442,
	IDH_OK                  = 28443,
	IDH_CANCEL              = 28444,
	IDH_HELP                = 28445,
}

export extern(Windows) BOOL WinHelpA(HWND hWndMain, LPCSTR lpszHelp, UINT uCommand, ULONG_PTR dwData);
export extern(Windows) BOOL WinHelpW(HWND hWndMain, LPCWSTR lpszHelp, UINT uCommand, ULONG_PTR dwData);
version(UNICODE)
	alias WinHelpW WinHelp;
else
	alias WinHelpA WinHelp;

enum {
	GR_GDIOBJECTS  = 0,
	GR_USEROBJECTS = 1,
	//(WINVER >= _WIN32_WINNT_WIN7)
		GR_GDIOBJECTS_PEAK  = 2,
		GR_USEROBJECTS_PEAK = 4,
	//(WINVER >= _WIN32_WINNT_WIN7)
		GR_GLOBAL = (HANDLE)-2,
}

export extern(Windows) DWORD GetGuiResources(HANDLE hProcess, DWORD uiFlags);

enum {
	SPI_GETBEEP               = 0x0001,
	SPI_SETBEEP               = 0x0002,
	SPI_GETMOUSE              = 0x0003,
	SPI_SETMOUSE              = 0x0004,
	SPI_GETBORDER             = 0x0005,
	SPI_SETBORDER             = 0x0006,
	SPI_GETKEYBOARDSPEED      = 0x000A,
	SPI_SETKEYBOARDSPEED      = 0x000B,
	SPI_LANGDRIVER            = 0x000C,
	SPI_ICONHORIZONTALSPACING = 0x000D,
	SPI_GETSCREENSAVETIMEOUT  = 0x000E,
	SPI_SETSCREENSAVETIMEOUT  = 0x000F,
	SPI_GETSCREENSAVEACTIVE   = 0x0010,
	SPI_SETSCREENSAVEACTIVE   = 0x0011,
	SPI_GETGRIDGRANULARITY    = 0x0012,
	SPI_SETGRIDGRANULARITY    = 0x0013,
	SPI_SETDESKWALLPAPER      = 0x0014,
	SPI_SETDESKPATTERN        = 0x0015,
	SPI_GETKEYBOARDDELAY      = 0x0016,
	SPI_SETKEYBOARDDELAY      = 0x0017,
	SPI_ICONVERTICALSPACING   = 0x0018,
	SPI_GETICONTITLEWRAP      = 0x0019,
	SPI_SETICONTITLEWRAP      = 0x001A,
	SPI_GETMENUDROPALIGNMENT  = 0x001B,
	SPI_SETMENUDROPALIGNMENT  = 0x001C,
	SPI_SETDOUBLECLKWIDTH     = 0x001D,
	SPI_SETDOUBLECLKHEIGHT    = 0x001E,
	SPI_GETICONTITLELOGFONT   = 0x001F,
	SPI_SETDOUBLECLICKTIME    = 0x0020,
	SPI_SETMOUSEBUTTONSWAP    = 0x0021,
	SPI_SETICONTITLELOGFONT   = 0x0022,
	SPI_GETFASTTASKSWITCH     = 0x0023,
	SPI_SETFASTTASKSWITCH     = 0x0024,
	SPI_SETDRAGFULLWINDOWS    = 0x0025,
	SPI_GETDRAGFULLWINDOWS    = 0x0026,
	SPI_GETNONCLIENTMETRICS   = 0x0029,
	SPI_SETNONCLIENTMETRICS   = 0x002A,
	SPI_GETMINIMIZEDMETRICS   = 0x002B,
	SPI_SETMINIMIZEDMETRICS   = 0x002C,
	SPI_GETICONMETRICS        = 0x002D,
	SPI_SETICONMETRICS        = 0x002E,
	SPI_SETWORKAREA           = 0x002F,
	SPI_GETWORKAREA           = 0x0030,
	SPI_SETPENWINDOWS         = 0x0031,
	SPI_GETHIGHCONTRAST       = 0x0042,
	SPI_SETHIGHCONTRAST       = 0x0043,
	SPI_GETKEYBOARDPREF       = 0x0044,
	SPI_SETKEYBOARDPREF       = 0x0045,
	SPI_GETSCREENREADER       = 0x0046,
	SPI_SETSCREENREADER       = 0x0047,
	SPI_GETANIMATION          = 0x0048,
	SPI_SETANIMATION          = 0x0049,
	SPI_GETFONTSMOOTHING      = 0x004A,
	SPI_SETFONTSMOOTHING      = 0x004B,
	SPI_SETDRAGWIDTH          = 0x004C,
	SPI_SETDRAGHEIGHT         = 0x004D,
	SPI_SETHANDHELD           = 0x004E,
	SPI_GETLOWPOWERTIMEOUT    = 0x004F,
	SPI_GETPOWEROFFTIMEOUT    = 0x0050,
	SPI_SETLOWPOWERTIMEOUT    = 0x0051,
	SPI_SETPOWEROFFTIMEOUT    = 0x0052,
	SPI_GETLOWPOWERACTIVE     = 0x0053,
	SPI_GETPOWEROFFACTIVE     = 0x0054,
	SPI_SETLOWPOWERACTIVE     = 0x0055,
	SPI_SETPOWEROFFACTIVE     = 0x0056,
	SPI_SETCURSORS            = 0x0057,
	SPI_SETICONS              = 0x0058,
	SPI_GETDEFAULTINPUTLANG   = 0x0059,
	SPI_SETDEFAULTINPUTLANG   = 0x005A,
	SPI_SETLANGTOGGLE         = 0x005B,
	SPI_GETWINDOWSEXTENSION   = 0x005C,
	SPI_SETMOUSETRAILS        = 0x005D,
	SPI_GETMOUSETRAILS        = 0x005E,
	SPI_SETSCREENSAVERRUNNING = 0x0061,
	SPI_SCREENSAVERRUNNING    = SPI_SETSCREENSAVERRUNNING,
	SPI_GETFILTERKEYS    = 0x0032,
	SPI_SETFILTERKEYS    = 0x0033,
	SPI_GETTOGGLEKEYS    = 0x0034,
	SPI_SETTOGGLEKEYS    = 0x0035,
	SPI_GETMOUSEKEYS     = 0x0036,
	SPI_SETMOUSEKEYS     = 0x0037,
	SPI_GETSHOWSOUNDS    = 0x0038,
	SPI_SETSHOWSOUNDS    = 0x0039,
	SPI_GETSTICKYKEYS    = 0x003A,
	SPI_SETSTICKYKEYS    = 0x003B,
	SPI_GETACCESSTIMEOUT = 0x003C,
	SPI_SETACCESSTIMEOUT = 0x003D,
	SPI_GETSERIALKEYS = 0x003E,
	SPI_SETSERIALKEYS = 0x003F,
	SPI_GETSOUNDSENTRY = 0x0040,
	SPI_SETSOUNDSENTRY = 0x0041,
	SPI_GETSNAPTODEFBUTTON = 0x005F,
	SPI_SETSNAPTODEFBUTTON = 0x0060,
	SPI_GETMOUSEHOVERWIDTH  = 0x0062,
	SPI_SETMOUSEHOVERWIDTH  = 0x0063,
	SPI_GETMOUSEHOVERHEIGHT = 0x0064,
	SPI_SETMOUSEHOVERHEIGHT = 0x0065,
	SPI_GETMOUSEHOVERTIME   = 0x0066,
	SPI_SETMOUSEHOVERTIME   = 0x0067,
	SPI_GETWHEELSCROLLLINES = 0x0068,
	SPI_SETWHEELSCROLLLINES = 0x0069,
	SPI_GETMENUSHOWDELAY    = 0x006A,
	SPI_SETMENUSHOWDELAY    = 0x006B,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		SPI_GETWHEELSCROLLCHARS = 0x006C,
		SPI_SETWHEELSCROLLCHARS = 0x006D,
	SPI_GETSHOWIMEUI = 0x006E,
	SPI_SETSHOWIMEUI = 0x006F,
	SPI_GETMOUSESPEED         = 0x0070,
	SPI_SETMOUSESPEED         = 0x0071,
	SPI_GETSCREENSAVERRUNNING = 0x0072,
	SPI_GETDESKWALLPAPER      = 0x0073,
	//(WINVER >= _WIN32_WINNT_VISTA)
		SPI_GETAUDIODESCRIPTION = 0x0074,
		SPI_SETAUDIODESCRIPTION = 0x0075,
		SPI_GETSCREENSAVESECURE = 0x0076,
		SPI_SETSCREENSAVESECURE = 0x0077,
	//(_WIN32_WINNT >= _WIN32_WINNT_WIN7)
		SPI_GETHUNGAPPTIMEOUT           = 0x0078,
		SPI_SETHUNGAPPTIMEOUT           = 0x0079,
		SPI_GETWAITTOKILLTIMEOUT        = 0x007A,
		SPI_SETWAITTOKILLTIMEOUT        = 0x007B,
		SPI_GETWAITTOKILLSERVICETIMEOUT = 0x007C,
		SPI_SETWAITTOKILLSERVICETIMEOUT = 0x007D,
		SPI_GETMOUSEDOCKTHRESHOLD       = 0x007E,
		SPI_SETMOUSEDOCKTHRESHOLD       = 0x007F,
		SPI_GETPENDOCKTHRESHOLD         = 0x0080,
		SPI_SETPENDOCKTHRESHOLD         = 0x0081,
		SPI_GETWINARRANGING             = 0x0082,
		SPI_SETWINARRANGING             = 0x0083,
		SPI_GETMOUSEDRAGOUTTHRESHOLD    = 0x0084,
		SPI_SETMOUSEDRAGOUTTHRESHOLD    = 0x0085,
		SPI_GETPENDRAGOUTTHRESHOLD      = 0x0086,
		SPI_SETPENDRAGOUTTHRESHOLD      = 0x0087,
		SPI_GETMOUSESIDEMOVETHRESHOLD   = 0x0088,
		SPI_SETMOUSESIDEMOVETHRESHOLD   = 0x0089,
		SPI_GETPENSIDEMOVETHRESHOLD     = 0x008A,
		SPI_SETPENSIDEMOVETHRESHOLD     = 0x008B,
		SPI_GETDRAGFROMMAXIMIZE         = 0x008C,
		SPI_SETDRAGFROMMAXIMIZE         = 0x008D,
		SPI_GETSNAPSIZING               = 0x008E,
		SPI_SETSNAPSIZING               = 0x008F,
		SPI_GETDOCKMOVING               = 0x0090,
		SPI_SETDOCKMOVING               = 0x0091,
	SPI_GETACTIVEWINDOWTRACKING   = 0x1000,
	SPI_SETACTIVEWINDOWTRACKING   = 0x1001,
	SPI_GETMENUANIMATION          = 0x1002,
	SPI_SETMENUANIMATION          = 0x1003,
	SPI_GETCOMBOBOXANIMATION      = 0x1004,
	SPI_SETCOMBOBOXANIMATION      = 0x1005,
	SPI_GETLISTBOXSMOOTHSCROLLING = 0x1006,
	SPI_SETLISTBOXSMOOTHSCROLLING = 0x1007,
	SPI_GETGRADIENTCAPTIONS       = 0x1008,
	SPI_SETGRADIENTCAPTIONS       = 0x1009,
	SPI_GETKEYBOARDCUES           = 0x100A,
	SPI_SETKEYBOARDCUES           = 0x100B,
	SPI_GETMENUUNDERLINES         = SPI_GETKEYBOARDCUES,
	SPI_SETMENUUNDERLINES         = SPI_SETKEYBOARDCUES,
	SPI_GETACTIVEWNDTRKZORDER     = 0x100C,
	SPI_SETACTIVEWNDTRKZORDER     = 0x100D,
	SPI_GETHOTTRACKING            = 0x100E,
	SPI_SETHOTTRACKING            = 0x100F,
	SPI_GETMENUFADE               = 0x1012,
	SPI_SETMENUFADE               = 0x1013,
	SPI_GETSELECTIONFADE          = 0x1014,
	SPI_SETSELECTIONFADE          = 0x1015,
	SPI_GETTOOLTIPANIMATION       = 0x1016,
	SPI_SETTOOLTIPANIMATION       = 0x1017,
	SPI_GETTOOLTIPFADE            = 0x1018,
	SPI_SETTOOLTIPFADE            = 0x1019,
	SPI_GETCURSORSHADOW           = 0x101A,
	SPI_SETCURSORSHADOW           = 0x101B,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		SPI_GETMOUSESONAR           = 0x101C,
		SPI_SETMOUSESONAR           = 0x101D,
		SPI_GETMOUSECLICKLOCK       = 0x101E,
		SPI_SETMOUSECLICKLOCK       = 0x101F,
		SPI_GETMOUSEVANISH          = 0x1020,
		SPI_SETMOUSEVANISH          = 0x1021,
		SPI_GETFLATMENU             = 0x1022,
		SPI_SETFLATMENU             = 0x1023,
		SPI_GETDROPSHADOW           = 0x1024,
		SPI_SETDROPSHADOW           = 0x1025,
		SPI_GETBLOCKSENDINPUTRESETS = 0x1026,
		SPI_SETBLOCKSENDINPUTRESETS = 0x1027,
	SPI_GETUIEFFECTS = 0x103E,
	SPI_SETUIEFFECTS = 0x103F,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		SPI_GETDISABLEOVERLAPPEDCONTENT = 0x1040,
		SPI_SETDISABLEOVERLAPPEDCONTENT = 0x1041,
		SPI_GETCLIENTAREAANIMATION      = 0x1042,
		SPI_SETCLIENTAREAANIMATION      = 0x1043,
		SPI_GETCLEARTYPE                = 0x1048,
		SPI_SETCLEARTYPE                = 0x1049,
		SPI_GETSPEECHRECOGNITION        = 0x104A,
		SPI_SETSPEECHRECOGNITION        = 0x104B,
	SPI_GETFOREGROUNDLOCKTIMEOUT = 0x2000,
	SPI_SETFOREGROUNDLOCKTIMEOUT = 0x2001,
	SPI_GETACTIVEWNDTRKTIMEOUT   = 0x2002,
	SPI_SETACTIVEWNDTRKTIMEOUT   = 0x2003,
	SPI_GETFOREGROUNDFLASHCOUNT  = 0x2004,
	SPI_SETFOREGROUNDFLASHCOUNT  = 0x2005,
	SPI_GETCARETWIDTH            = 0x2006,
	SPI_SETCARETWIDTH            = 0x2007,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		SPI_GETMOUSECLICKLOCKTIME       = 0x2008,
		SPI_SETMOUSECLICKLOCKTIME       = 0x2009,
		SPI_GETFONTSMOOTHINGTYPE        = 0x200A,
		SPI_SETFONTSMOOTHINGTYPE        = 0x200B,
		FE_FONTSMOOTHINGSTANDARD        = 0x0001,
		FE_FONTSMOOTHINGCLEARTYPE       = 0x0002,
		SPI_GETFONTSMOOTHINGCONTRAST    = 0x200C,
		SPI_SETFONTSMOOTHINGCONTRAST    = 0x200D,
		SPI_GETFOCUSBORDERWIDTH         = 0x200E,
		SPI_SETFOCUSBORDERWIDTH         = 0x200F,
		SPI_GETFOCUSBORDERHEIGHT        = 0x2010,
		SPI_SETFOCUSBORDERHEIGHT        = 0x2011,
		SPI_GETFONTSMOOTHINGORIENTATION = 0x2012,
		SPI_SETFONTSMOOTHINGORIENTATION = 0x2013,
		FE_FONTSMOOTHINGORIENTATIONBGR  = 0x0000,
		FE_FONTSMOOTHINGORIENTATIONRGB  = 0x0001,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		SPI_GETMINIMUMHITRADIUS = 0x2014,
		SPI_SETMINIMUMHITRADIUS = 0x2015,
		SPI_GETMESSAGEDURATION  = 0x2016,
		SPI_SETMESSAGEDURATION  = 0x2017,
}

enum {
	SPIF_UPDATEINIFILE    = 0x0001,
	SPIF_SENDWININICHANGE = 0x0002,
	SPIF_SENDCHANGE       = SPIF_SENDWININICHANGE,
}

enum METRICS_USEDEFAULT = -1;

struct NONCLIENTMETRICSA {
	UINT cbSize;
	int iBorderWidth;
	int iScrollWidth;
	int iScrollHeight;
	int iCaptionWidth;
	int iCaptionHeight;
	LOGFONTA lfCaptionFont;
	int iSmCaptionWidth;
	int iSmCaptionHeight;
	LOGFONTA lfSmCaptionFont;
	int iMenuWidth;
	int iMenuHeight;
	LOGFONTA lfMenuFont;
	LOGFONTA lfStatusFont;
	LOGFONTA lfMessageFont;
	//(WINVER >= _WIN32_WINNT_VISTA)
		int iPaddedBorderWidth;
}
alias NONCLIENTMETRICSA* PNONCLIENTMETRICSA;
alias NONCLIENTMETRICSA* LPNONCLIENTMETRICSA;
struct NONCLIENTMETRICSW {
	UINT cbSize;
	int iBorderWidth;
	int iScrollWidth;
	int iScrollHeight;
	int iCaptionWidth;
	int iCaptionHeight;
	LOGFONTW lfCaptionFont;
	int iSmCaptionWidth;
	int iSmCaptionHeight;
	LOGFONTW lfSmCaptionFont;
	int iMenuWidth;
	int iMenuHeight;
	LOGFONTW lfMenuFont;
	LOGFONTW lfStatusFont;
	LOGFONTW lfMessageFont;
	//(WINVER >= _WIN32_WINNT_VISTA)
		int iPaddedBorderWidth;

}
alias NONCLIENTMETRICSW* PNONCLIENTMETRICSW;
alias NONCLIENTMETRICSW* LPNONCLIENTMETRICSW;

version(UNICODE){
	alias NONCLIENTMETRICSW NONCLIENTMETRICS;
	alias PNONCLIENTMETRICSW PNONCLIENTMETRICS;
	alias LPNONCLIENTMETRICSW LPNONCLIENTMETRICS;
}else{
	alias NONCLIENTMETRICSA NONCLIENTMETRICS;
	alias PNONCLIENTMETRICSA PNONCLIENTMETRICS;
	alias LPNONCLIENTMETRICSA LPNONCLIENTMETRICS;
}
enum {
	ARW_BOTTOMLEFT   = 0x0000,
	ARW_BOTTOMRIGHT  = 0x0001,
	ARW_TOPLEFT      = 0x0002,
	ARW_TOPRIGHT     = 0x0003,
	ARW_STARTMASK    = 0x0003,
	ARW_STARTRIGHT   = 0x0001,
	ARW_STARTTOP     = 0x0002,
	ARW_LEFT         = 0x0000,
	ARW_RIGHT        = 0x0000,
	ARW_UP           = 0x0004,
	ARW_DOWN         = 0x0004,
	ARW_HIDE         = 0x0008,
}

struct MINIMIZEDMETRICS {
	UINT cbSize;
	int iWidth;
	int iHorzGap;
	int iVertGap;
	int iArrange;
}
alias MINIMIZEDMETRICS* PMINIMIZEDMETRICS;
alias MINIMIZEDMETRICS* LPMINIMIZEDMETRICS;

struct ICONMETRICSA {
	UINT cbSize;
	int iHorzSpacing;
	int iVertSpacing;
	int iTitleWrap;
	LOGFONTA lfFont;
}
alias ICONMETRICSA* PICONMETRICSA;
alias ICONMETRICSA* LPICONMETRICSA;

struct ICONMETRICSW {
	UINT cbSize;
	int iHorzSpacing;
	int iVertSpacing;
	int iTitleWrap;
	LOGFONTW lfFont;
}
alias ICONMETRICSW* PICONMETRICSW;
alias ICONMETRICSW* LPICONMETRICSW;
version(UNICODE){
	alias ICONMETRICSW ICONMETRICS;
	alias PICONMETRICSW PICONMETRICS;
	alias LPICONMETRICSW LPICONMETRICS;
}else{
	alias ICONMETRICSA ICONMETRICS;
	alias PICONMETRICSA PICONMETRICS;
	alias LPICONMETRICSA LPICONMETRICS;
}

struct ANIMATIONINFO {
	UINT cbSize;
	int iMinAnimate;
}
alias ANIMATIONINFO* LPANIMATIONINFO;

struct SERIALKEYSA {
	UINT cbSize;
	DWORD dwFlags;
	LPSTR lpszActivePort;
	LPSTR lpszPort;
	UINT iBaudRate;
	UINT iPortState;
	UINT iActive;
}
alias SERIALKEYSA* LPSERIALKEYSA;

struct SERIALKEYSW {
	UINT cbSize;
	DWORD dwFlags;
	LPWSTR lpszActivePort;
	LPWSTR lpszPort;
	UINT iBaudRate;
	UINT iPortState;
	UINT iActive;
}
alias SERIALKEYSW* LPSERIALKEYSW;
version(UNICODE){
	alias SERIALKEYSW SERIALKEYS;
	alias LPSERIALKEYSW LPSERIALKEYS;
}else{
	alias SERIALKEYSA SERIALKEYS;
	alias LPSERIALKEYSA LPSERIALKEYS;
}

enum {
	SERKF_SERIALKEYSON  = 0x00000001,
	SERKF_AVAILABLE     = 0x00000002,
	SERKF_INDICATOR     = 0x00000004,
}

struct HIGHCONTRASTA {
	UINT cbSize;
	DWORD dwFlags;
	LPSTR lpszDefaultScheme;
}
alias HIGHCONTRASTA* LPHIGHCONTRASTA;
struct HIGHCONTRASTW {
	UINT cbSize;
	DWORD dwFlags;
	LPWSTR lpszDefaultScheme;
}
alias HIGHCONTRASTW* LPHIGHCONTRASTW;
version(UNICODE){
	alias HIGHCONTRASTW HIGHCONTRAST;
	alias LPHIGHCONTRASTW LPHIGHCONTRAST;
}else{
	alias HIGHCONTRASTA HIGHCONTRAST;
	alias LPHIGHCONTRASTA LPHIGHCONTRAST;
}

enum {
	HCF_HIGHCONTRASTON   = 0x00000001,
	HCF_AVAILABLE        = 0x00000002,
	HCF_HOTKEYACTIVE     = 0x00000004,
	HCF_CONFIRMHOTKEY    = 0x00000008,
	HCF_HOTKEYSOUND      = 0x00000010,
	HCF_INDICATOR        = 0x00000020,
	HCF_HOTKEYAVAILABLE  = 0x00000040,
	HCF_LOGONDESKTOP     = 0x00000100,
	HCF_DEFAULTDESKTOP   = 0x00000200,
}

enum {
	CDS_UPDATEREGISTRY   = 0x00000001,
	CDS_TEST             = 0x00000002,
	CDS_FULLSCREEN       = 0x00000004,
	CDS_GLOBAL           = 0x00000008,
	CDS_SET_PRIMARY      = 0x00000010,
	CDS_VIDEOPARAMETERS  = 0x00000020,
	//(WINVER >= _WIN32_WINNT_VISTA)
		CDS_ENABLE_UNSAFE_MODES   = 0x00000100,
		CDS_DISABLE_UNSAFE_MODES  = 0x00000200,
	CDS_RESET            = 0x40000000,
	CDS_RESET_EX         = 0x20000000,
	CDS_NORESET          = 0x10000000,
}

enum {
	DISP_CHANGE_SUCCESSFUL  = 0,
	DISP_CHANGE_RESTART     = 1,
	DISP_CHANGE_FAILED      = -1,
	DISP_CHANGE_BADMODE     = -2,
	DISP_CHANGE_NOTUPDATED  = -3,
	DISP_CHANGE_BADFLAGS    = -4,
	DISP_CHANGE_BADPARAM    = -5,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		DISP_CHANGE_BADDUALVIEW = -6,
}

export extern(Windows) LONG ChangeDisplaySettingsA(DEVMODEA* lpDevMode, DWORD dwFlags);
export extern(Windows) LONG ChangeDisplaySettingsW(DEVMODEW* lpDevMode, DWORD dwFlags);
version(UNICODE)
	alias ChangeDisplaySettingsW ChangeDisplaySettings;
else
	alias ChangeDisplaySettingsA ChangeDisplaySettings;

export extern(Windows) LONG ChangeDisplaySettingsExA(LPCSTR lpszDeviceName, DEVMODEA* lpDevMode, HWND hwnd, DWORD dwflags, LPVOID lParam);
export extern(Windows) LONG ChangeDisplaySettingsExW(LPCWSTR lpszDeviceName, DEVMODEW* lpDevMode, HWND hwnd, DWORD dwflags, LPVOID lParam);
version(UNICODE)
	alias ChangeDisplaySettingsExW ChangeDisplaySettingsEx;
else
	alias ChangeDisplaySettingsExA ChangeDisplaySettingsEx;

enum {
	ENUM_CURRENT_SETTINGS  = cast(DWORD)-1,
	ENUM_REGISTRY_SETTINGS = cast(DWORD)-2,
}

export extern(Windows) BOOL EnumDisplaySettingsA(LPCSTR lpszDeviceName, DWORD iModeNum, DEVMODEA* lpDevMode);
export extern(Windows) BOOL EnumDisplaySettingsW(LPCWSTR lpszDeviceName, DWORD iModeNum, DEVMODEW* lpDevMode);
version(UNICODE)
	alias EnumDisplaySettingsW EnumDisplaySettings;
else
	alias EnumDisplaySettingsA EnumDisplaySettings;

export extern(Windows) BOOL EnumDisplaySettingsExA(LPCSTR lpszDeviceName, DWORD iModeNum, DEVMODEA* lpDevMode, DWORD dwFlags);
export extern(Windows) BOOL EnumDisplaySettingsExW(LPCWSTR lpszDeviceName, DWORD iModeNum, DEVMODEW* lpDevMode, DWORD dwFlags);
version(UNICODE)
	alias EnumDisplaySettingsExW EnumDisplaySettingsEx;
else
	alias EnumDisplaySettingsExA EnumDisplaySettingsEx;

enum {
	EDS_RAWMODE     = 0x00000002,
	EDS_ROTATEDMODE = 0x00000004,
}

export extern(Windows) BOOL EnumDisplayDevicesA(LPCSTR lpDevice, DWORD iDevNum, PDISPLAY_DEVICEA lpDisplayDevice, DWORD dwFlags);
export extern(Windows) BOOL EnumDisplayDevicesW(LPCWSTR lpDevice, DWORD iDevNum, PDISPLAY_DEVICEW lpDisplayDevice, DWORD dwFlags);
version(UNICODE)
	alias EnumDisplayDevicesW EnumDisplayDevices;
else
	alias EnumDisplayDevicesA EnumDisplayDevices;

enum EDD_GET_DEVICE_INTERFACE_NAME = 0x00000001;

static if(WINVER >= _WIN32_WINNT_WIN7){
	export extern(Windows) LONG GetDisplayConfigBufferSizes(UINT32 flags, UINT32* numPathArrayElements, UINT32* numModeInfoArrayElements);
	export extern(Windows) LONG SetDisplayConfig(UINT32 numPathArrayElements, DISPLAYCONFIG_PATH_INFO* pathArray, UINT32 numModeInfoArrayElements, DISPLAYCONFIG_MODE_INFO* modeInfoArray, UINT32 flags);
	export extern(Windows) LONG QueryDisplayConfig(UINT32 flags, UINT32* numPathArrayElements, DISPLAYCONFIG_PATH_INFO* pathArray, UINT32* numModeInfoArrayElements, DISPLAYCONFIG_MODE_INFO* modeInfoArray, DISPLAYCONFIG_TOPOLOGY_ID* currentTopologyId);
	export extern(Windows) LONG DisplayConfigGetDeviceInfo( DISPLAYCONFIG_DEVICE_INFO_HEADER* requestPacket);
	export extern(Windows) LONG DisplayConfigSetDeviceInfo(DISPLAYCONFIG_DEVICE_INFO_HEADER* setPacket);
}

export extern(Windows) BOOL SystemParametersInfoA(UINT uiAction, UINT uiParam, PVOID pvParam, UINT fWinIni);
export extern(Windows) BOOL SystemParametersInfoW(UINT uiAction, UINT uiParam, PVOID pvParam, UINT fWinIni);
version(UNICODE)
	alias SystemParametersInfoW SystemParametersInfo;
else
	alias SystemParametersInfoA SystemParametersInfo;

struct FILTERKEYS {
	UINT cbSize;
	DWORD dwFlags;
	DWORD iWaitMSec;
	DWORD iDelayMSec;
	DWORD iRepeatMSec;
	DWORD iBounceMSec;
}
alias FILTERKEYS* LPFILTERKEYS;

enum {
	FKF_FILTERKEYSON  = 0x00000001,
	FKF_AVAILABLE     = 0x00000002,
	FKF_HOTKEYACTIVE  = 0x00000004,
	FKF_CONFIRMHOTKEY = 0x00000008,
	FKF_HOTKEYSOUND   = 0x00000010,
	FKF_INDICATOR     = 0x00000020,
	FKF_CLICKON       = 0x00000040,
}

struct STICKYKEYS {
	UINT  cbSize;
	DWORD dwFlags;
}
alias STICKYKEYS* LPSTICKYKEYS;

enum {
	SKF_STICKYKEYSON    = 0x00000001,
	SKF_AVAILABLE       = 0x00000002,
	SKF_HOTKEYACTIVE    = 0x00000004,
	SKF_CONFIRMHOTKEY   = 0x00000008,
	SKF_HOTKEYSOUND     = 0x00000010,
	SKF_INDICATOR       = 0x00000020,
	SKF_AUDIBLEFEEDBACK = 0x00000040,
	SKF_TRISTATE        = 0x00000080,
	SKF_TWOKEYSOFF      = 0x00000100,
	SKF_LALTLATCHED     = 0x10000000,
	SKF_LCTLLATCHED     = 0x04000000,
	SKF_LSHIFTLATCHED   = 0x01000000,
	SKF_RALTLATCHED     = 0x20000000,
	SKF_RCTLLATCHED     = 0x08000000,
	SKF_RSHIFTLATCHED   = 0x02000000,
	SKF_LWINLATCHED     = 0x40000000,
	SKF_RWINLATCHED     = 0x80000000,
	SKF_LALTLOCKED      = 0x00100000,
	SKF_LCTLLOCKED      = 0x00040000,
	SKF_LSHIFTLOCKED    = 0x00010000,
	SKF_RALTLOCKED      = 0x00200000,
	SKF_RCTLLOCKED      = 0x00080000,
	SKF_RSHIFTLOCKED    = 0x00020000,
	SKF_LWINLOCKED      = 0x00400000,
	SKF_RWINLOCKED      = 0x00800000,
}

struct MOUSEKEYS {
	UINT cbSize;
	DWORD dwFlags;
	DWORD iMaxSpeed;
	DWORD iTimeToMaxSpeed;
	DWORD iCtrlSpeed;
	DWORD dwReserved1;
	DWORD dwReserved2;
}
alias MOUSEKEYS* LPMOUSEKEYS;

enum {
	MKF_MOUSEKEYSON     = 0x00000001,
	MKF_AVAILABLE       = 0x00000002,
	MKF_HOTKEYACTIVE    = 0x00000004,
	MKF_CONFIRMHOTKEY   = 0x00000008,
	MKF_HOTKEYSOUND     = 0x00000010,
	MKF_INDICATOR       = 0x00000020,
	MKF_MODIFIERS       = 0x00000040,
	MKF_REPLACENUMBERS  = 0x00000080,
	MKF_LEFTBUTTONSEL   = 0x10000000,
	MKF_RIGHTBUTTONSEL  = 0x20000000,
	MKF_LEFTBUTTONDOWN  = 0x01000000,
	MKF_RIGHTBUTTONDOWN = 0x02000000,
	MKF_MOUSEMODE       = 0x80000000,
}

struct ACCESSTIMEOUT {
	UINT cbSize;
	DWORD dwFlags;
	DWORD iTimeOutMSec;
}
alias ACCESSTIMEOUT* LPACCESSTIMEOUT;

enum {
	ATF_TIMEOUTON     = 0x00000001,
	ATF_ONOFFFEEDBACK = 0x00000002,
}

enum {
	SSGF_NONE    = 0,
	SSGF_DISPLAY = 3,
}

enum {
	SSTF_NONE    = 0,
	SSTF_CHARS   = 1,
	SSTF_BORDER  = 2,
	SSTF_DISPLAY = 3,
}

enum {
	SSWF_NONE    = 0,
	SSWF_TITLE   = 1,
	SSWF_WINDOW  = 2,
	SSWF_DISPLAY = 3,
	SSWF_CUSTOM  = 4,
}

struct SOUNDSENTRYA {
	UINT cbSize;
	DWORD dwFlags;
	DWORD iFSTextEffect;
	DWORD iFSTextEffectMSec;
	DWORD iFSTextEffectColorBits;
	DWORD iFSGrafEffect;
	DWORD iFSGrafEffectMSec;
	DWORD iFSGrafEffectColor;
	DWORD iWindowsEffect;
	DWORD iWindowsEffectMSec;
	LPSTR lpszWindowsEffectDLL;
	DWORD iWindowsEffectOrdinal;
}
alias SOUNDSENTRYA* LPSOUNDSENTRYA;
struct SOUNDSENTRYW {
	UINT cbSize;
	DWORD dwFlags;
	DWORD iFSTextEffect;
	DWORD iFSTextEffectMSec;
	DWORD iFSTextEffectColorBits;
	DWORD iFSGrafEffect;
	DWORD iFSGrafEffectMSec;
	DWORD iFSGrafEffectColor;
	DWORD iWindowsEffect;
	DWORD iWindowsEffectMSec;
	LPWSTR lpszWindowsEffectDLL;
	DWORD iWindowsEffectOrdinal;
}
alias SOUNDSENTRYW* LPSOUNDSENTRYW;
version(UNICODE){
	alias SOUNDSENTRYW SOUNDSENTRY;
	alias LPSOUNDSENTRYW LPSOUNDSENTRY;
}else{
	alias SOUNDSENTRYA SOUNDSENTRY;
	alias LPSOUNDSENTRYA LPSOUNDSENTRY;
}

enum {
	SSF_SOUNDSENTRYON = 0x00000001,
	SSF_AVAILABLE     = 0x00000002,
	SSF_INDICATOR     = 0x00000004,
}
static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	export extern(Windows) BOOL SoundSentry();

struct TOGGLEKEYS {
	UINT cbSize;
	DWORD dwFlags;
}
alias TOGGLEKEYS* LPTOGGLEKEYS;

enum {
	TKF_TOGGLEKEYSON  = 0x00000001,
	TKF_AVAILABLE     = 0x00000002,
	TKF_HOTKEYACTIVE  = 0x00000004,
	TKF_CONFIRMHOTKEY = 0x00000008,
	TKF_HOTKEYSOUND   = 0x00000010,
	TKF_INDICATOR     = 0x00000020,
}
//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	struct AUDIODESCRIPTION {
		UINT cbSize;
		BOOL Enabled;
		LCID Locale;
	}
	alias AUDIODESCRIPTION* LPAUDIODESCRIPTION;

export extern(Windows) VOID SetDebugErrorLevel(DWORD dwLevel);

enum {
	SLE_ERROR      = 0x00000001,
	SLE_MINORERROR = 0x00000002,
	SLE_WARNING    = 0x00000003,
}

export extern(Windows) VOID SetLastErrorEx(DWORD dwErrCode, DWORD dwType);
export extern(Windows) int InternalGetWindowText(HWND hWnd, LPWSTR pString, int cchMaxCount);
export extern(Windows) BOOL EndTask(HWND hWnd, BOOL fShutDown, BOOL fForce);
export extern(Windows) BOOL CancelShutdown();

enum {
	MONITOR_DEFAULTTONULL    = 0x00000000,
	MONITOR_DEFAULTTOPRIMARY = 0x00000001,
	MONITOR_DEFAULTTONEAREST = 0x00000002,
}

export extern(Windows) HMONITOR MonitorFromPoint(POINT pt, DWORD dwFlags);
export extern(Windows) HMONITOR MonitorFromRect(LPCRECT lprc, DWORD dwFlags);
export extern(Windows) HMONITOR MonitorFromWindow(HWND hwnd, DWORD dwFlags);

enum MONITORINFOF_PRIMARY = 0x00000001;

enum CCHDEVICENAME = 32;

struct MONITORINFO {
	DWORD cbSize;
	RECT rcMonitor;
	RECT rcWork;
	DWORD dwFlags;
}
alias MONITORINFO* LPMONITORINFO;

struct MONITORINFOEXA {
	MONITORINFO dummy_;
	CHAR[CCHDEVICENAME] szDevice;
}
alias MONITORINFOEXA* LPMONITORINFOEXA;
struct MONITORINFOEXW {
	MONITORINFO dummy_;
	WCHAR[CCHDEVICENAME] szDevice;
}
alias MONITORINFOEXW* LPMONITORINFOEXW;
version(UNICODE){
	alias MONITORINFOEXW MONITORINFOEX;
	alias LPMONITORINFOEXW LPMONITORINFOEX;
}else{
	alias MONITORINFOEXA MONITORINFOEX;
	alias LPMONITORINFOEXA LPMONITORINFOEX;
}

export extern(Windows) BOOL GetMonitorInfoA(HMONITOR hMonitor, LPMONITORINFO lpmi);
export extern(Windows) BOOL GetMonitorInfoW(HMONITOR hMonitor, LPMONITORINFO lpmi);
version(UNICODE)
	alias GetMonitorInfoW GetMonitorInfo;
else
	alias GetMonitorInfoA GetMonitorInfo;

alias extern(Windows) BOOL function(HMONITOR, HDC, LPRECT, LPARAM) MONITORENUMPROC;

export extern(Windows) BOOL EnumDisplayMonitors(HDC hdc, LPCRECT lprcClip, MONITORENUMPROC lpfnEnum, LPARAM dwData);

export extern(Windows) VOID NotifyWinEvent(DWORD event, HWND hwnd, LONG idObject, LONG idChild);

alias extern(Windows) VOID function(HWINEVENTHOOK hWinEventHook, DWORD event, HWND hwnd, LONG idObject, LONG idChild, DWORD idEventThread, DWORD dwmsEventTime) WINEVENTPROC;
export extern(Windows) HWINEVENTHOOK SetWinEventHook(DWORD eventMin, DWORD eventMax, HMODULE hmodWinEventProc, WINEVENTPROC pfnWinEventProc, DWORD idProcess, DWORD idThread, DWORD dwFlags);
static if(_WIN32_WINNT >= 0x0501)
	export extern(Windows) BOOL IsWinEventHookInstalled(DWORD event);

enum {
	WINEVENT_OUTOFCONTEXT   = 0x0000,
	WINEVENT_SKIPOWNTHREAD  = 0x0001,
	WINEVENT_SKIPOWNPROCESS = 0x0002,
	WINEVENT_INCONTEXT      = 0x0004,
}

export extern(Windows) BOOL UnhookWinEvent(HWINEVENTHOOK hWinEventHook);

enum {
	CHILDID_SELF      = 0,
	INDEXID_OBJECT    = 0,
	INDEXID_CONTAINER = 0,
}

enum {
	OBJID_WINDOW            = cast(LONG)0x00000000,
	OBJID_SYSMENU           = cast(LONG)0xFFFFFFFF,
	OBJID_TITLEBAR          = cast(LONG)0xFFFFFFFE,
	OBJID_MENU              = cast(LONG)0xFFFFFFFD,
	OBJID_CLIENT            = cast(LONG)0xFFFFFFFC,
	OBJID_VSCROLL           = cast(LONG)0xFFFFFFFB,
	OBJID_HSCROLL           = cast(LONG)0xFFFFFFFA,
	OBJID_SIZEGRIP          = cast(LONG)0xFFFFFFF9,
	OBJID_CARET             = cast(LONG)0xFFFFFFF8,
	OBJID_CURSOR            = cast(LONG)0xFFFFFFF7,
	OBJID_ALERT             = cast(LONG)0xFFFFFFF6,
	OBJID_SOUND             = cast(LONG)0xFFFFFFF5,
	OBJID_QUERYCLASSNAMEIDX = cast(LONG)0xFFFFFFF4,
	OBJID_NATIVEOM          = cast(LONG)0xFFFFFFF0,
}

enum {
	EVENT_MIN = 0x00000001,
	EVENT_MAX = 0x7FFFFFFF,
}
enum {
	EVENT_SYSTEM_SOUND            = 0x0001,
	EVENT_SYSTEM_ALERT            = 0x0002,
	EVENT_SYSTEM_FOREGROUND       = 0x0003,
	EVENT_SYSTEM_MENUSTART        = 0x0004,
	EVENT_SYSTEM_MENUEND          = 0x0005,
	EVENT_SYSTEM_MENUPOPUPSTART   = 0x0006,
	EVENT_SYSTEM_MENUPOPUPEND     = 0x0007,
	EVENT_SYSTEM_CAPTURESTART     = 0x0008,
	EVENT_SYSTEM_CAPTUREEND       = 0x0009,
	EVENT_SYSTEM_MOVESIZESTART    = 0x000A,
	EVENT_SYSTEM_MOVESIZEEND      = 0x000B,
	EVENT_SYSTEM_CONTEXTHELPSTART = 0x000C,
	EVENT_SYSTEM_CONTEXTHELPEND   = 0x000D,
	EVENT_SYSTEM_DRAGDROPSTART    = 0x000E,
	EVENT_SYSTEM_DRAGDROPEND      = 0x000F,
	EVENT_SYSTEM_DIALOGSTART      = 0x0010,
	EVENT_SYSTEM_DIALOGEND        = 0x0011,
	EVENT_SYSTEM_SCROLLINGSTART   = 0x0012,
	EVENT_SYSTEM_SCROLLINGEND     = 0x0013,
	EVENT_SYSTEM_SWITCHSTART      = 0x0014,
	EVENT_SYSTEM_SWITCHEND        = 0x0015,
	EVENT_SYSTEM_MINIMIZESTART    = 0x0016,
	EVENT_SYSTEM_MINIMIZEEND      = 0x0017,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		EVENT_SYSTEM_DESKTOPSWITCH = 0x0020,
	//(_WIN32_WINNT >= _WIN32_WINNT_WIN7)
		EVENT_SYSTEM_END        = 0x00FF,
		EVENT_OEM_DEFINED_START = 0x0101,
		EVENT_OEM_DEFINED_END   = 0x01FF,
		EVENT_UIA_EVENTID_START = 0x4E00,
		EVENT_UIA_EVENTID_END   = 0x4EFF,
		EVENT_UIA_PROPID_START  = 0x7500,
		EVENT_UIA_PROPID_END    = 0x75FF,
}

//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	enum {
		EVENT_CONSOLE_CARET             = 0x4001,
		EVENT_CONSOLE_UPDATE_REGION     = 0x4002,
		EVENT_CONSOLE_UPDATE_SIMPLE     = 0x4003,
		EVENT_CONSOLE_UPDATE_SCROLL     = 0x4004,
		EVENT_CONSOLE_LAYOUT            = 0x4005,
		EVENT_CONSOLE_START_APPLICATION = 0x4006,
		EVENT_CONSOLE_END_APPLICATION   = 0x4007,
	}

	version(Win64)
		enum CONSOLE_APPLICATION_16BIT = 0x0000;
	else
		enum CONSOLE_APPLICATION_16BIT = 0x0001;
	enum {
		CONSOLE_CARET_SELECTION = 0x0001,
		CONSOLE_CARET_VISIBLE   = 0x0002,
	}

//(_WIN32_WINNT >= _WIN32_WINNT_WIN7)
	enum EVENT_CONSOLE_END = 0x40FF;

enum {
	EVENT_OBJECT_CREATE            = 0x8000,
	EVENT_OBJECT_DESTROY           = 0x8001,
	EVENT_OBJECT_SHOW              = 0x8002,
	EVENT_OBJECT_HIDE              = 0x8003,
	EVENT_OBJECT_REORDER           = 0x8004,
	EVENT_OBJECT_FOCUS             = 0x8005,
	EVENT_OBJECT_SELECTION         = 0x8006,
	EVENT_OBJECT_SELECTIONADD      = 0x8007,
	EVENT_OBJECT_SELECTIONREMOVE   = 0x8008,
	EVENT_OBJECT_SELECTIONWITHIN   = 0x8009,
	EVENT_OBJECT_STATECHANGE       = 0x800A,
	EVENT_OBJECT_LOCATIONCHANGE    = 0x800B,
	EVENT_OBJECT_NAMECHANGE        = 0x800C,
	EVENT_OBJECT_DESCRIPTIONCHANGE = 0x800D,
	EVENT_OBJECT_VALUECHANGE       = 0x800E,
	EVENT_OBJECT_PARENTCHANGE      = 0x800F,
	EVENT_OBJECT_HELPCHANGE        = 0x8010,
	EVENT_OBJECT_DEFACTIONCHANGE   = 0x8011,
	EVENT_OBJECT_ACCELERATORCHANGE = 0x8012,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		EVENT_OBJECT_INVOKED              = 0x8013,
		EVENT_OBJECT_TEXTSELECTIONCHANGED = 0x8014,
		EVENT_OBJECT_CONTENTSCROLLED      = 0x8015,
}
//(_WIN32_WINNT >= _WIN32_WINNT_WIN7)
	enum EVENT_SYSTEM_ARRANGMENTPREVIEW = 0x8016;
//(_WIN32_WINNT >= _WIN32_WINNT_WIN7)
	enum {
		EVENT_OBJECT_END = 0x80FF,
		EVENT_AIA_START  = 0xA000,
		EVENT_AIA_END    = 0xAFFF,
	}

enum {
	SOUND_SYSTEM_STARTUP     = 1,
	SOUND_SYSTEM_SHUTDOWN    = 2,
	SOUND_SYSTEM_BEEP        = 3,
	SOUND_SYSTEM_ERROR       = 4,
	SOUND_SYSTEM_QUESTION    = 5,
	SOUND_SYSTEM_WARNING     = 6,
	SOUND_SYSTEM_INFORMATION = 7,
	SOUND_SYSTEM_MAXIMIZE    = 8,
	SOUND_SYSTEM_MINIMIZE    = 9,
	SOUND_SYSTEM_RESTOREUP   = 10,
	SOUND_SYSTEM_RESTOREDOWN = 11,
	SOUND_SYSTEM_APPSTART    = 12,
	SOUND_SYSTEM_FAULT       = 13,
	SOUND_SYSTEM_APPEND      = 14,
	SOUND_SYSTEM_MENUCOMMAND = 15,
	SOUND_SYSTEM_MENUPOPUP   = 16,
	CSOUND_SYSTEM            = 16,
}

enum {
	ALERT_SYSTEM_INFORMATIONAL = 1,
	ALERT_SYSTEM_WARNING       = 2,
	ALERT_SYSTEM_ERROR         = 3,
	ALERT_SYSTEM_QUERY         = 4,
	ALERT_SYSTEM_CRITICAL      = 5,
	CALERT_SYSTEM              = 6,
}

struct GUITHREADINFO {
	DWORD cbSize;
	DWORD flags;
	HWND hwndActive;
	HWND hwndFocus;
	HWND hwndCapture;
	HWND hwndMenuOwner;
	HWND hwndMoveSize;
	HWND hwndCaret;
	RECT rcCaret;
}
alias GUITHREADINFO* PGUITHREADINFO;
alias GUITHREADINFO* LPGUITHREADINFO;

enum {
	GUI_CARETBLINKING  = 0x00000001,
	GUI_INMOVESIZE     = 0x00000002,
	GUI_INMENUMODE     = 0x00000004,
	GUI_SYSTEMMENUMODE = 0x00000008,
	GUI_POPUPMENUMODE  = 0x00000010,
}
//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	version(Win64)
		enum GUI_16BITTASK = 0x00000000;
	else
		enum GUI_16BITTASK = 0x00000020;

export extern(Windows) BOOL GetGUIThreadInfo(DWORD idThread, PGUITHREADINFO pgui);
export extern(Windows) BOOL BlockInput(BOOL fBlockIt);

//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	enum USER_DEFAULT_SCREEN_DPI = 96;

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	export extern(Windows) BOOL SetProcessDPIAware();
	export extern(Windows) BOOL IsProcessDPIAware();
}

export extern(Windows) UINT GetWindowModuleFileNameA(HWND hwnd, LPSTR pszFileName, UINT cchFileNameMax);
export extern(Windows) UINT GetWindowModuleFileNameW(HWND hwnd, LPWSTR pszFileName, UINT cchFileNameMax);
version(UNICODE)
	alias GetWindowModuleFileNameW GetWindowModuleFileName;
else
	alias GetWindowModuleFileNameA GetWindowModuleFileName;

enum {
	STATE_SYSTEM_UNAVAILABLE     = 0x00000001,
	STATE_SYSTEM_SELECTED        = 0x00000002,
	STATE_SYSTEM_FOCUSED         = 0x00000004,
	STATE_SYSTEM_PRESSED         = 0x00000008,
	STATE_SYSTEM_CHECKED         = 0x00000010,
	STATE_SYSTEM_MIXED           = 0x00000020,
	STATE_SYSTEM_INDETERMINATE   = STATE_SYSTEM_MIXED,
	STATE_SYSTEM_READONLY        = 0x00000040,
	STATE_SYSTEM_HOTTRACKED      = 0x00000080,
	STATE_SYSTEM_DEFAULT         = 0x00000100,
	STATE_SYSTEM_EXPANDED        = 0x00000200,
	STATE_SYSTEM_COLLAPSED       = 0x00000400,
	STATE_SYSTEM_BUSY            = 0x00000800,
	STATE_SYSTEM_FLOATING        = 0x00001000,
	STATE_SYSTEM_MARQUEED        = 0x00002000,
	STATE_SYSTEM_ANIMATED        = 0x00004000,
	STATE_SYSTEM_INVISIBLE       = 0x00008000,
	STATE_SYSTEM_OFFSCREEN       = 0x00010000,
	STATE_SYSTEM_SIZEABLE        = 0x00020000,
	STATE_SYSTEM_MOVEABLE        = 0x00040000,
	STATE_SYSTEM_SELFVOICING     = 0x00080000,
	STATE_SYSTEM_FOCUSABLE       = 0x00100000,
	STATE_SYSTEM_SELECTABLE      = 0x00200000,
	STATE_SYSTEM_LINKED          = 0x00400000,
	STATE_SYSTEM_TRAVERSED       = 0x00800000,
	STATE_SYSTEM_MULTISELECTABLE = 0x01000000,
	STATE_SYSTEM_EXTSELECTABLE   = 0x02000000,
	STATE_SYSTEM_ALERT_LOW       = 0x04000000,
	STATE_SYSTEM_ALERT_MEDIUM    = 0x08000000,
	STATE_SYSTEM_ALERT_HIGH      = 0x10000000,
	STATE_SYSTEM_PROTECTED       = 0x20000000,
	STATE_SYSTEM_VALID           = 0x3FFFFFFF,
}

enum {
	CCHILDREN_TITLEBAR  = 5,
	CCHILDREN_SCROLLBAR = 5,
}

struct CURSORINFO {
	DWORD cbSize;
	DWORD flags;
	HCURSOR hCursor;
	POINT ptScreenPos;
}
alias CURSORINFO* PCURSORINFO;
alias CURSORINFO* LPCURSORINFO;

enum CURSOR_SHOWING = 0x00000001;

export extern(Windows) BOOL GetCursorInfo(PCURSORINFO pci);

struct WINDOWINFO {
	DWORD cbSize;
	RECT rcWindow;
	RECT rcClient;
	DWORD dwStyle;
	DWORD dwExStyle;
	DWORD dwWindowStatus;
	UINT cxWindowBorders;
	UINT cyWindowBorders;
	ATOM atomWindowType;
	WORD wCreatorVersion;
}
alias WINDOWINFO* PWINDOWINFO;
alias WINDOWINFO* LPWINDOWINFO;

enum WS_ACTIVECAPTION = 0x0001;

export extern(Windows) BOOL GetWindowInfo(HWND hwnd, PWINDOWINFO pwi);

struct TITLEBARINFO {
	DWORD cbSize;
	RECT rcTitleBar;
	DWORD[CCHILDREN_TITLEBAR + 1] rgstate;
}
alias TITLEBARINFO* PTITLEBARINFO;
alias TITLEBARINFO* LPTITLEBARINFO;

export extern(Windows) BOOL GetTitleBarInfo(HWND hwnd, PTITLEBARINFO pti);

//(WINVER >= _WIN32_WINNT_VISTA)
	struct TITLEBARINFOEX {
		DWORD cbSize;
		RECT rcTitleBar;
		DWORD[CCHILDREN_TITLEBAR + 1] rgstate;
		RECT[CCHILDREN_TITLEBAR + 1] rgrect;
	}
	alias TITLEBARINFOEX* PTITLEBARINFOEX;
	alias TITLEBARINFOEX* LPTITLEBARINFOEX;

struct MENUBARINFO {
	DWORD cbSize;
	RECT rcBar;
	HMENU hMenu;
	HWND hwndMenu;
	BOOL fBarFocused1fFocused1;
}
alias MENUBARINFO* PMENUBARINFO;
alias MENUBARINFO* LPMENUBARINFO;

export extern(Windows) BOOL GetMenuBarInfo(HWND hwnd, LONG idObject, LONG idItem, PMENUBARINFO pmbi);
struct SCROLLBARINFO {
	DWORD cbSize;
	RECT rcScrollBar;
	int dxyLineButton;
	int xyThumbTop;
	int xyThumbBottom;
	int reserved;
	DWORD[CCHILDREN_SCROLLBAR + 1] rgstate;
}
alias SCROLLBARINFO* PSCROLLBARINFO;
alias SCROLLBARINFO* LPSCROLLBARINFO;

export extern(Windows) BOOL GetScrollBarInfo(HWND hwnd, LONG idObject, PSCROLLBARINFO psbi);

struct COMBOBOXINFO {
	DWORD cbSize;
	RECT rcItem;
	RECT rcButton;
	DWORD stateButton;
	HWND hwndCombo;
	HWND hwndItem;
	HWND hwndList;
}
alias COMBOBOXINFO* PCOMBOBOXINFO;
alias COMBOBOXINFO* LPCOMBOBOXINFO;

export extern(Windows) BOOL GetComboBoxInfo(HWND hwndCombo, PCOMBOBOXINFO pcbi);

enum {
	GA_PARENT    = 1,
	GA_ROOT      = 2,
	GA_ROOTOWNER = 3,
}

export extern(Windows) HWND GetAncestor(HWND hwnd, UINT gaFlags);
export extern(Windows) HWND RealChildWindowFromPoint(HWND hwndParent, POINT ptParentClientCoords);

export extern(Windows) UINT RealGetWindowClassA(HWND hwnd, LPSTR ptszClassName, UINT cchClassNameMax);

export extern(Windows) UINT RealGetWindowClassW(HWND hwnd, LPWSTR ptszClassName, UINT cchClassNameMax);
version(UNICODE)
	alias RealGetWindowClassW RealGetWindowClass;
else
	alias RealGetWindowClassA RealGetWindowClass;

struct ALTTABINFO {
	DWORD cbSize;
	int cItems;
	int cColumns;
	int cRows;
	int iColFocus;
	int iRowFocus;
	int cxItem;
	int cyItem;
	POINT ptStart;
}
alias ALTTABINFO* PALTTABINFO;
alias ALTTABINFO* LPALTTABINFO;

export extern(Windows) BOOL GetAltTabInfoA(HWND hwnd, int iItem, PALTTABINFO pati, LPSTR pszItemText, UINT cchItemText);
export extern(Windows) BOOL GetAltTabInfoW(HWND hwnd, int iItem, PALTTABINFO pati, LPWSTR pszItemText, UINT cchItemText);
version(UNICODE)
	alias GetAltTabInfoW GetAltTabInfo;
else
	alias GetAltTabInfoA GetAltTabInfo;

export extern(Windows) DWORD GetListBoxInfo(HWND hwnd);

export extern(Windows) BOOL LockWorkStation();
export extern(Windows) BOOL UserHandleGrantAccess(HANDLE hUserHandle, HANDLE hJob, BOOL bGrant);

//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	enum HRAWINPUT : HANDLE {init = (HANDLE).init}

	pure nothrow
	WPARAM GET_RAWINPUT_CODE_WPARAM(WPARAM wParam)
	{
		return wParam & 0xff;
	}

	enum {
		RIM_INPUT     = 0,
		RIM_INPUTSINK = 1,
	}

	struct RAWINPUTHEADER {
		DWORD dwType;
		DWORD dwSize;
		HANDLE hDevice;
		WPARAM wParam;
	}
	alias RAWINPUTHEADER* PRAWINPUTHEADER;
	alias RAWINPUTHEADER* LPRAWINPUTHEADER;

	enum {
		RIM_TYPEMOUSE    = 0,
		RIM_TYPEKEYBOARD = 1,
		RIM_TYPEHID      = 2,
	}

	struct RAWMOUSE {
		USHORT usFlags;
		union {
			ULONG ulButtons;
			struct {
				USHORT usButtonFlags;
				USHORT usButtonData;
			}
		}
		ULONG ulRawButtons;
		LONG lLastX;
		LONG lLastY;
		ULONG ulExtraInformation;
	}
	alias RAWMOUSE* PRAWMOUSE;
	alias RAWMOUSE* LPRAWMOUSE;

	enum {
		RI_MOUSE_LEFT_BUTTON_DOWN   = 0x0001,
		RI_MOUSE_LEFT_BUTTON_UP     = 0x0002,
		RI_MOUSE_RIGHT_BUTTON_DOWN  = 0x0004,
		RI_MOUSE_RIGHT_BUTTON_UP    = 0x0008,
		RI_MOUSE_MIDDLE_BUTTON_DOWN = 0x0010,
		RI_MOUSE_MIDDLE_BUTTON_UP   = 0x0020,
		RI_MOUSE_BUTTON_1_DOWN      = RI_MOUSE_LEFT_BUTTON_DOWN,
		RI_MOUSE_BUTTON_1_UP        = RI_MOUSE_LEFT_BUTTON_UP,
		RI_MOUSE_BUTTON_2_DOWN      = RI_MOUSE_RIGHT_BUTTON_DOWN,
		RI_MOUSE_BUTTON_2_UP        = RI_MOUSE_RIGHT_BUTTON_UP,
		RI_MOUSE_BUTTON_3_DOWN      = RI_MOUSE_MIDDLE_BUTTON_DOWN,
		RI_MOUSE_BUTTON_3_UP        = RI_MOUSE_MIDDLE_BUTTON_UP,
		RI_MOUSE_BUTTON_4_DOWN      = 0x0040,
		RI_MOUSE_BUTTON_4_UP        = 0x0080,
		RI_MOUSE_BUTTON_5_DOWN      = 0x0100,
		RI_MOUSE_BUTTON_5_UP        = 0x0200,
		RI_MOUSE_WHEEL              = 0x0400,
	}
	enum {
		MOUSE_MOVE_RELATIVE      = 0,
		MOUSE_MOVE_ABSOLUTE      = 1,
		MOUSE_VIRTUAL_DESKTOP    = 0x02,
		MOUSE_ATTRIBUTES_CHANGED = 0x04,
		//(WINVER >= _WIN32_WINNT_VISTA)
			MOUSE_MOVE_NOCOALESCE = 0x08,
	}

	struct RAWKEYBOARD {
		USHORT MakeCode;
		USHORT Flags;
		USHORT Reserved;
		USHORT VKey;
		UINT Message;
		ULONG ExtraInformation;
	}
	alias RAWKEYBOARD* PRAWKEYBOARD;
	alias RAWKEYBOARD* LPRAWKEYBOARD;

	enum KEYBOARD_OVERRUN_MAKE_CODE = 0xFF;

	enum {
		RI_KEY_MAKE            = 0,
		RI_KEY_BREAK           = 1,
		RI_KEY_E0              = 2,
		RI_KEY_E1              = 4,
		RI_KEY_TERMSRV_SET_LED = 8,
		RI_KEY_TERMSRV_SHADOW  = 0x10,
	}

	struct RAWHID {
		DWORD dwSizeHid;
		DWORD dwCount;
		BYTE[1] bRawData;
	}
	alias RAWHID* PRAWHID;
	alias RAWHID* LPRAWHID;

	struct RAWINPUT {
		RAWINPUTHEADER header;
		union {
			RAWMOUSE mouse;
			RAWKEYBOARD keyboard;
			RAWHID hid;
	    }
	}
	alias RAWINPUT* PRAWINPUT;
	alias RAWINPUT* LPRAWINPUT;

	version(Win64){
		pure nothrow
		size_t RAWINPUT_ALIGN(size_t x)
		{
			return (x + QWORD.sizeof - 1) & ~(QWORD.sizeof - 1);
		}
	}else{
		pure nothrow
		size_t RAWINPUT_ALIGN(size_t x)
		{
			return (x + DWORD.sizeof - 1) & ~(DWORD.sizeof - 1);
		}
	}

	pure nothrow
	PRAWINPUT NEXTRAWINPUTBLOCK(PRAWINPUT ptr)
	{
		return cast(PRAWINPUT)RAWINPUT_ALIGN(cast(ULONG_PTR)(cast(PBYTE)ptr + ptr.header.dwSize));
	}

	enum {
		RID_INPUT  = 0x10000003,
		RID_HEADER = 0x10000005,
	}

static if(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	export extern(Windows) UINT GetRawInputData(HRAWINPUT hRawInput, UINT uiCommand, LPVOID pData, PUINT pcbSize, UINT cbSizeHeader);

//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	enum {
		RIDI_PREPARSEDDATA = 0x20000005,
		RIDI_DEVICENAME    = 0x20000007,
		RIDI_DEVICEINFO    = 0x2000000b,
	}

	struct RID_DEVICE_INFO_MOUSE {
		DWORD dwId;
		DWORD dwNumberOfButtons;
		DWORD dwSampleRate;
		BOOL fHasHorizontalWheel;
	}
	alias RID_DEVICE_INFO_MOUSE* PRID_DEVICE_INFO_MOUSE;

	struct RID_DEVICE_INFO_KEYBOARD {
		DWORD dwType;
		DWORD dwSubType;
		DWORD dwKeyboardMode;
		DWORD dwNumberOfFunctionKeys;
		DWORD dwNumberOfIndicators;
		DWORD dwNumberOfKeysTotal;
	}
	alias RID_DEVICE_INFO_KEYBOARD* PRID_DEVICE_INFO_KEYBOARD;

	struct RID_DEVICE_INFO_HID {
		DWORD dwVendorId;
		DWORD dwProductId;
		DWORD dwVersionNumber;
		USHORT usUsagePage;
		USHORT usUsage;
	}
	alias RID_DEVICE_INFO_HID* PRID_DEVICE_INFO_HID;

	struct RID_DEVICE_INFO {
		DWORD cbSize;
		DWORD dwType;
		union {
			RID_DEVICE_INFO_MOUSE mouse;
			RID_DEVICE_INFO_KEYBOARD keyboard;
			RID_DEVICE_INFO_HID hid;
		}
	}
	alias RID_DEVICE_INFO* PRID_DEVICE_INFO;
	alias RID_DEVICE_INFO* LPRID_DEVICE_INFO;

static if(_WIN32_WINNT >= _WIN32_WINNT_WINXP){
	export extern(Windows) UINT GetRawInputDeviceInfoA(HANDLE hDevice, UINT uiCommand, LPVOID pData, PUINT pcbSize);
	export extern(Windows) UINT GetRawInputDeviceInfoW(HANDLE hDevice, UINT uiCommand, LPVOID pData, PUINT pcbSize);
	version(UNICODE)
		alias GetRawInputDeviceInfoW GetRawInputDeviceInfo;
	else
		alias GetRawInputDeviceInfoA GetRawInputDeviceInfo;

	export extern(Windows) UINT GetRawInputBuffer(PRAWINPUT pData, PUINT pcbSize, UINT cbSizeHeader);
}

//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	struct RAWINPUTDEVICE {
		USHORT usUsagePage;
		USHORT usUsage;
		DWORD dwFlags;
		HWND hwndTarget;
	}
	alias RAWINPUTDEVICE* PRAWINPUTDEVICE;
	alias RAWINPUTDEVICE* LPRAWINPUTDEVICE;

	alias const(RAWINPUTDEVICE)* PCRAWINPUTDEVICE;

	enum {
		RIDEV_REMOVE       = 0x00000001,
		RIDEV_EXCLUDE      = 0x00000010,
		RIDEV_PAGEONLY     = 0x00000020,
		RIDEV_NOLEGACY     = 0x00000030,
		RIDEV_INPUTSINK    = 0x00000100,
		RIDEV_CAPTUREMOUSE = 0x00000200,
		RIDEV_NOHOTKEYS    = 0x00000200,
		RIDEV_APPKEYS      = 0x00000400,
		//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
			RIDEV_EXINPUTSINK = 0x00001000,
			RIDEV_DEVNOTIFY   = 0x00002000,
	}
	enum RIDEV_EXMODEMASK = 0x000000F0;

	//RIDEV_EXMODE(mode)  ((mode) & RIDEV_EXMODEMASK)

	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		enum {
			GIDC_ARRIVAL = 1,
			GIDC_REMOVAL = 2,
		}

	//(_WIN32_WINNT >= _WIN32_WINNT_WIN7)
		pure nothrow
		WORD GET_DEVICE_CHANGE_WPARAM(WPARAM wParam)
		{
			return LOWORD(wParam);
		}
	/*else (_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		pure nothrow
		WORD GET_DEVICE_CHANGE_LPARAM(LPARAM lParam)
		{
			return LOWORD(lParam);
		}*/

static if(_WIN32_WINNT >= _WIN32_WINNT_WINXP){
	export extern(Windows) BOOL RegisterRawInputDevices(PCRAWINPUTDEVICE pRawInputDevices, UINT uiNumDevices, UINT cbSize);
	export extern(Windows) UINT GetRegisteredRawInputDevices(PRAWINPUTDEVICE pRawInputDevices, PUINT puiNumDevices, UINT cbSize);
}

//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	struct RAWINPUTDEVICELIST {
		HANDLE hDevice;
		DWORD dwType;
	}
	alias RAWINPUTDEVICELIST* PRAWINPUTDEVICELIST;

static if(_WIN32_WINNT >= _WIN32_WINNT_WINXP){
	export extern(Windows) UINT GetRawInputDeviceList(PRAWINPUTDEVICELIST pRawInputDeviceList, PUINT puiNumDevices, UINT cbSize);
	export extern(Windows) LRESULT DefRawInputProc(PRAWINPUT* paRawInput, INT nInput, UINT cbSizeHeader);
}

//(WINVER >= _WIN32_WINNT_VISTA)
	enum {
		MSGFLT_ADD    = 1,
		MSGFLT_REMOVE = 2,
	}
static if(WINVER >= _WIN32_WINNT_VISTA)
	export extern(Windows) BOOL ChangeWindowMessageFilter(UINT message, DWORD dwFlag);

//(WINVER >= _WIN32_WINNT_WIN7)
	enum {
		MSGFLTINFO_NONE                     = 0,
		MSGFLTINFO_ALREADYALLOWED_FORWND    = 1,
		MSGFLTINFO_ALREADYDISALLOWED_FORWND = 2,
		MSGFLTINFO_ALLOWED_HIGHER           = 3,
	}

	struct CHANGEFILTERSTRUCT {
		DWORD cbSize;
		DWORD ExtStatus;
	}
	alias CHANGEFILTERSTRUCT* PCHANGEFILTERSTRUCT;

	enum {
		MSGFLT_RESET    = 0,
		MSGFLT_ALLOW    = 1,
		MSGFLT_DISALLOW = 2,
	}

static if(WINVER >= _WIN32_WINNT_WIN7)
	export extern(Windows) BOOL ChangeWindowMessageFilterEx(HWND hwnd, UINT message, DWORD action, PCHANGEFILTERSTRUCT pChangeFilterStruct);

//(WINVER >= _WIN32_WINNT_WIN7)
	enum HGESTUREINFO : HANDLE {init = (HANDLE).init}

	enum {
		GF_BEGIN   = 0x00000001,
		GF_INERTIA = 0x00000002,
		GF_END     = 0x00000004,
	}

	enum {
		GID_BEGIN        = 1,
		GID_END          = 2,
		GID_ZOOM         = 3,
		GID_PAN          = 4,
		GID_ROTATE       = 5,
		GID_TWOFINGERTAP = 6,
		GID_PRESSANDTAP  = 7,
		GID_ROLLOVER     = GID_PRESSANDTAP,
	}

	struct GESTUREINFO {
		UINT cbSize;
		DWORD dwFlags;
		DWORD dwID;
		HWND hwndTarget;
		POINTS ptsLocation;
		DWORD dwInstanceID;
		DWORD dwSequenceID;
		ULONGLONG ullArguments;
		UINT cbExtraArgs;
	}
	alias GESTUREINFO* PGESTUREINFO;
	alias GESTUREINFO* PCGESTUREINFO;

	struct GESTURENOTIFYSTRUCT {
		UINT cbSize;
		DWORD dwFlags;
		HWND hwndTarget;
		POINTS ptsLocation;
		DWORD dwInstanceID;
	}
	alias GESTURENOTIFYSTRUCT* PGESTURENOTIFYSTRUCT;

	pure nothrow
	USHORT GID_ROTATE_ANGLE_TO_ARGUMENT(double _arg_)
	{
		return cast(USHORT)(((_arg_ + 2.0 * 3.14159265) / (4.0 * 3.14159265)) * 65535.0);
	}

	pure nothrow
	double GID_ROTATE_ANGLE_FROM_ARGUMENT(USHORT _arg_)
	{
		return cast(double)(_arg_ / 65535.0 * 4.0 * 3.14159265) - 2.0 * 3.14159265;
	}

static if(WINVER >= _WIN32_WINNT_WIN7){
	export extern(Windows) BOOL GetGestureInfo(HGESTUREINFO hGestureInfo, PGESTUREINFO pGestureInfo);
	export extern(Windows) BOOL GetGestureExtraArgs(HGESTUREINFO hGestureInfo, UINT cbExtraArgs, PBYTE pExtraArgs);
	export extern(Windows) BOOL CloseGestureInfoHandle(HGESTUREINFO hGestureInfo);
}

//(WINVER >= _WIN32_WINNT_WIN7)
	struct GESTURECONFIG {
		DWORD dwID;
		DWORD dwWant;
		DWORD dwBlock;
	}
	alias GESTURECONFIG* PGESTURECONFIG;

	enum {
		GC_ALLGESTURES                         = 0x00000001,
		GC_ZOOM                                = 0x00000001,
		GC_PAN                                 = 0x00000001,
		GC_PAN_WITH_SINGLE_FINGER_VERTICALLY   = 0x00000002,
		GC_PAN_WITH_SINGLE_FINGER_HORIZONTALLY = 0x00000004,
		GC_PAN_WITH_GUTTER                     = 0x00000008,
		GC_PAN_WITH_INERTIA                    = 0x00000010,
		GC_ROTATE                              = 0x00000001,
		GC_TWOFINGERTAP                        = 0x00000001,
		GC_PRESSANDTAP                         = 0x00000001,
		GC_ROLLOVER                            = GC_PRESSANDTAP,
		GESTURECONFIGMAXCOUNT                  = 256,
	}
static if(WINVER >= _WIN32_WINNT_WIN7)
	export extern(Windows) BOOL SetGestureConfig(HWND hwnd, DWORD dwReserved, UINT cIDs, PGESTURECONFIG pGestureConfig, UINT cbSize);
//(WINVER >= _WIN32_WINNT_WIN7)
	enum GCF_INCLUDE_ANCESTORS = 0x00000001;
static if(WINVER >= _WIN32_WINNT_WIN7)
	export extern(Windows) BOOL GetGestureConfig(HWND hwnd, DWORD dwReserved, DWORD dwFlags, PUINT pcIDs, PGESTURECONFIG pGestureConfig, UINT cbSize);

//(WINVER >= _WIN32_WINNT_WIN7)
	enum {
		NID_INTEGRATED_TOUCH = 0x00000001,
		NID_EXTERNAL_TOUCH   = 0x00000002,
		NID_INTEGRATED_PEN   = 0x00000004,
		NID_EXTERNAL_PEN     = 0x00000008,
		NID_MULTI_INPUT      = 0x00000040,
		NID_READY            = 0x00000080,
	}

enum MAX_STR_BLOCKREASON = 256;

export extern(Windows) BOOL ShutdownBlockReasonCreate(HWND hWnd, LPCWSTR pwszReason);
export extern(Windows) BOOL ShutdownBlockReasonQuery(HWND hWnd, LPWSTR pwszBuff, DWORD* pcchBuff);
export extern(Windows) BOOL ShutdownBlockReasonDestroy(HWND hWnd);

} // extern(C)
