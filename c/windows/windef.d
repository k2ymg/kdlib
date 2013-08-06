/** windef.d

Converted from 'windef.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.windef;


import c.windows.sdkddkver;

alias ulong QWORD;
alias QWORD* PQWORD;

// from basetsd.d -->
alias byte    INT8;
alias INT8*   PINT8;
alias short   INT16;
alias INT16*  PINT16;
alias int     INT32;
alias INT32*  PINT32;
alias long    INT64;
alias INT64*  PINT64;
alias ubyte   UINT8;
alias UINT8*  PUINT8;
alias ushort  UINT16;
alias UINT16* PUINT16;
alias uint    UINT32;
alias UINT32* PUINT32;
alias ulong   UINT64;
alias UINT64* PUINT64;

alias int     LONG32;
alias LONG32* PLONG32;

alias uint     ULONG32;
alias ULONG32* PULONG32;
alias uint     DWORD32;
alias DWORD32* PDWORD32;

version(Win64){
	alias long       INT_PTR;
	alias INT_PTR*   PINT_PTR;
	alias ulong      UINT_PTR;
	alias UINT_PTR*  PUINT_PTR;
	alias long       LONG_PTR;
	alias LONG_PTR*  PLONG_PTR;
	alias ulong      ULONG_PTR;
	alias ULONG_PTR* PULONG_PTR;
}else{
	alias int         INT_PTR;
	alias INT_PTR*    PINT_PTR;
	alias uint        UINT_PTR;
	alias UINT_PTR*   PUINT_PTR;
	alias int         LONG_PTR;
	alias LONG_PTR*   PLONG_PTR;
	alias uint        ULONG_PTR;
	alias ULONG_PTR*  PULONG_PTR;
}

alias ULONG_PTR SIZE_T;
alias SIZE_T*   PSIZE_T;
alias LONG_PTR  SSIZE_T;
alias SSIZE_T*  PSSIZE_T;

alias ULONG_PTR  DWORD_PTR;
alias DWORD_PTR* PDWORD_PTR;

alias long     LONG64;
alias LONG64*  PLONG64;
alias ulong    ULONG64;
alias ULONG64* PULONG64;
alias ulong    DWORD64;
alias DWORD64* PDWORD64;

alias ULONG_PTR  KAFFINITY;
alias KAFFINITY* PKAFFINITY;

// <--

// from winnt.d -->
alias BYTE   FCHAR;
alias WORD   FSHORT;
alias DWORD  FLONG;

alias LONG HRESULT;

alias char CCHAR;
alias DWORD LCID;
alias PDWORD PLCID;
alias WORD LANGID;

alias void* PVOID;
alias void* POINTER_64;
alias void* PVOID64;

alias void VOID;
alias char CHAR;
alias short SHORT;
alias int LONG;
//alias int INT;


alias wchar WCHAR;
alias WCHAR* PWCHAR;
alias WCHAR* LPWCH;
alias WCHAR* PWCH;
alias const(WCHAR)* LPCWCH;
alias const(WCHAR)* PCWCH;

alias WCHAR* NWPSTR;
alias WCHAR* LPWSTR;
alias WCHAR* PWSTR;
alias PWSTR* PZPWSTR;
alias const(PWSTR)* PCZPWSTR;
alias WCHAR* LPUWSTR;
alias WCHAR* PUWSTR;
alias const(WCHAR)* LPCWSTR;
alias const(WCHAR)* PCWSTR;
alias PCWSTR* PZPCWSTR;
alias const(WCHAR)* LPCUWSTR;
alias const(WCHAR)* PCUWSTR;

alias WCHAR* PZZWSTR;
alias const(WCHAR)* PCZZWSTR;
alias WCHAR* PUZZWSTR;
alias const(WCHAR)* PCUZZWSTR;

alias WCHAR* PNZWCH;
alias const(WCHAR)* PCNZWCH;
alias WCHAR* PUNZWCH;
alias const(WCHAR)* PCUNZWCH;

//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	alias const(WCHAR)* LPCWCHAR;
	alias const(WCHAR)* PCWCHAR;
	alias const(WCHAR)* LPCUWCHAR;
	alias const(WCHAR)* PCUWCHAR;

	alias uint UCSCHAR;
	enum  UCSCHAR_INVALID_CHARACTER = 0xffffffff;
	enum MIN_UCSCHAR = 0;
	enum MAX_UCSCHAR = 0x0010FFFF;

	alias UCSCHAR* PUCSCHAR;
	alias const(UCSCHAR)* PCUCSCHAR;

	alias UCSCHAR*PUCSSTR;
	alias UCSCHAR* PUUCSSTR;

	alias const(UCSCHAR)* PCUCSSTR;
	alias const(UCSCHAR)* PCUUCSSTR;

	alias UCSCHAR* PUUCSCHAR;
	alias const(UCSCHAR)* PCUUCSCHAR;

alias CHAR* PCHAR;
alias CHAR* LPCH;
alias CHAR* PCH;
alias const(CHAR)* LPCCH;
alias const(CHAR)* PCCH;

alias CHAR* NPSTR;
alias CHAR* LPSTR;
alias CHAR* PSTR;
alias PSTR* PZPSTR;
alias const(PSTR)* PCZPSTR;
alias const(CHAR)* LPCSTR;
alias const(CHAR)* PCSTR;
alias PCSTR* PZPCSTR;

alias CHAR* PZZSTR;
alias const(CHAR)* PCZZSTR;

alias CHAR* PNZCH;
alias const(CHAR)* PCNZCH;

version(UNICODE){
	alias WCHAR TCHAR;
	alias WCHAR* PTCHAR;
	alias WCHAR TBYTE;
	alias WCHAR* PTBYTE ;

	alias LPWCH LPTCH;
	alias LPWCH PTCH;
	alias LPCWCH LPCTCH;
	alias LPCWCH PCTCH;
	alias LPWSTR PTSTR;
	alias LPWSTR LPTSTR;
	alias LPCWSTR PCTSTR;
	alias LPCWSTR LPCTSTR;
	alias LPUWSTR PUTSTR;
	alias LPUWSTR LPUTSTR;
	alias LPCUWSTR PCUTSTR;
	alias LPCUWSTR LPCUTSTR;
	alias LPWSTR LP;
	alias PZZWSTR PZZTSTR;
	alias PCZZWSTR PCZZTSTR;
	alias PUZZWSTR PUZZTSTR;
	alias PCUZZWSTR PCUZZTSTR;
	alias PNZWCH PNZTCH;
	alias PCNZWCH PCNZTCH;
	alias PUNZWCH PUNZTCH;
	alias PCUNZWCH PCUNZTCH;
}else{
	alias char TCHAR;
	alias char* PTCHAR;
	alias ubyte TBYTE;
	alias ubyte* PTBYTE ;

	alias LPCH LPTCH;
	alias LPCH PTCH;
	alias LPCCH LPCTCH;
	alias LPCCH PCTCH;
	alias LPSTR PTSTR;
	alias LPSTR LPTSTR;
	alias LPSTR PUTSTR;
	alias LPSTR LPUTSTR;
	alias LPCSTR PCTSTR;
	alias LPCSTR LPCTSTR;
	alias LPCSTR PCUTSTR;
	alias LPCSTR LPCUTSTR;
	alias PZZSTR PZZTSTR;
	alias PZZSTR PUZZTSTR;
	alias PCZZSTR PCZZTSTR;
	alias PCZZSTR PCUZZTSTR;
	alias PNZCH PNZTCH;
	alias PNZCH PUNZTCH;
	alias PCNZCH PCNZTCH;
	alias PCNZCH PCUNZTCH;
}

alias SHORT* PSHORT;
alias LONG* PLONG;

enum HANDLE : void* {init = (void*).init}
alias HANDLE* PHANDLE;

alias long LONGLONG;
alias ulong ULONGLONG;

enum MAXLONGLONG = 0x7fffffffffffffff;
alias LONGLONG* PLONGLONG;
alias ULONGLONG* PULONGLONG;

alias BYTE BOOLEAN;
alias BOOLEAN* PBOOLEAN;

struct LIST_ENTRY {
	LIST_ENTRY* Flink;
	LIST_ENTRY* Blink;
}
alias LIST_ENTRY* PLIST_ENTRY;
alias LIST_ENTRY* RESTRICTED_POINTER;
alias LIST_ENTRY* PRLIST_ENTRY;

struct SINGLE_LIST_ENTRY {
	SINGLE_LIST_ENTRY* Next;
}
alias SINGLE_LIST_ENTRY* PSINGLE_LIST_ENTRY;

struct LIST_ENTRY32 {
	DWORD Flink;
	DWORD Blink;
}
alias LIST_ENTRY32* PLIST_ENTRY32;

struct LIST_ENTRY64 {
	ULONGLONG Flink;
	ULONGLONG Blink;
}
alias LIST_ENTRY64* PLIST_ENTRY64;

union LARGE_INTEGER {
	struct {
		DWORD LowPart;
		LONG HighPart;
	}
	LONGLONG QuadPart;
}
alias LARGE_INTEGER* PLARGE_INTEGER;

struct ULARGE_INTEGER {
	struct {
		DWORD LowPart;
		DWORD HighPart;
	}
	ULONGLONG QuadPart;
}
alias ULARGE_INTEGER* PULARGE_INTEGER;

struct LUID {
	DWORD LowPart;
	LONG HighPart;
}
alias LUID* PLUID;

alias ULONGLONG DWORDLONG;
alias DWORDLONG* PDWORDLONG;

alias PVOID PACCESS_TOKEN;
alias PVOID PSECURITY_DESCRIPTOR;
alias PVOID PSID;

alias DWORD ACCESS_MASK;
alias ACCESS_MASK* PACCESS_MASK;

// <-- winnt

// from intsafe -->
enum {
	UINT_MAX = 0xffffffff,
}
enum ULONGLONG_MAX = 0xffffffffffffffffUL;

enum INTSAFE_E_ARITHMETIC_OVERFLOW = cast(HRESULT)0x80070216;

// <-- intsafe

alias uint    ULONG;
alias ULONG*  PULONG;
alias ushort  USHORT;
alias USHORT* PUSHORT;
alias ubyte   UCHAR;
alias UCHAR*  PUCHAR;
alias byte*   PSZ;

enum MAX_PATH = 260;

// NULL -> null
enum : BOOL {
	FALSE = 0,
	TRUE  = 1,
}

alias uint         DWORD;
alias int          BOOL;
alias ubyte        BYTE;
alias ushort       WORD;
alias float        FLOAT;
alias FLOAT*       PFLOAT;
alias BOOL*        PBOOL;
alias BOOL*        LPBOOL;
alias BYTE*        PBYTE;
alias BYTE*        LPBYTE;
alias int*         PINT;
alias int*         LPINT;
alias WORD*        PWORD;
alias WORD*        LPWORD;
alias int*         LPLONG;
alias DWORD*       PDWORD;
alias DWORD*       LPDWORD;
alias void*        LPVOID;
alias const(void)* LPCVOID;

alias int          INT;
alias uint         UINT;
alias UINT*        PUINT;
alias UINT*        LPUINT;

alias UINT_PTR WPARAM;
alias LONG_PTR LPARAM;
alias LONG_PTR LRESULT;

pure nothrow
WORD MAKEWORD(DWORD_PTR a, DWORD_PTR b)
{
	return cast(WORD)((cast(BYTE)(a & 0xff)) | ((cast(WORD)(cast(BYTE)(b & 0xff))) << 8));
}

pure nothrow
LONG MAKELONG(DWORD_PTR a, DWORD_PTR b)
{
	return cast(LONG)((cast(WORD)(a & 0xffff)) | ((cast(DWORD)(cast(WORD)(b & 0xffff))) << 16));
}

pure nothrow
WORD LOWORD(DWORD_PTR l)
{
	return cast(WORD)(l & 0xffff);
}

pure nothrow
WORD HIWORD(DWORD_PTR l)
{
	return cast(WORD)((l >> 16) & 0xffff);
}

pure nothrow
BYTE LOBYTE(DWORD_PTR w)
{
	return cast(BYTE)(w & 0xff);
}

pure nothrow
BYTE HIBYTE(DWORD_PTR w)
{
	return cast(BYTE)((w >> 8) & 0xff);
}

enum HWND : void* {init = (void*).init}
enum HHOOK : void* {init = (void*).init}
enum HEVENT : void* {init = (void*).init}

alias WORD ATOM;

alias HANDLE* SPHANDLE;
alias HANDLE* LPHANDLE;
alias HANDLE  HGLOBAL;
alias HANDLE  HLOCAL;
alias HANDLE  GLOBALHANDLE;
alias HANDLE  LOCALHANDLE;

extern(Windows){
	alias INT_PTR function() FARPROC;
	alias INT_PTR function() NEARPROC;
	alias INT_PTR function() PROC;
}

enum HGDIOBJ : void* {init = (void*).init}
enum HKEY : void* {init = (void*).init}
alias HKEY* PHKEY;
enum HACCEL : void* {init = (void*).init}
enum HBITMAP : void* {init = (void*).init}
enum HBRUSH : void* {init = (void*).init}
enum HCOLORSPACE : void* {init = (void*).init}
enum HDC : void* {init = (void*).init}
enum HGLRC : void* {init = (void*).init}
enum HDESK : void* {init = (void*).init}
enum HENHMETAFILE : void* {init = (void*).init}
enum HFONT : void* {init = (void*).init}
enum HICON : void* {init = (void*).init}
enum HMENU : void* {init = (void*).init}
enum HMETAFILE : void* {init = (void*).init}
enum HINSTANCE : void* {init = (void*).init}
alias HINSTANCE HMODULE;
enum HPALETTE : void* {init = (void*).init}
enum HPEN : void* {init = (void*).init}
enum HRGN : void* {init = (void*).init}
enum HRSRC : void* {init = (void*).init}
enum HSPRITE : void* {init = (void*).init}
enum HLSURF : void* {init = (void*).init}
enum HSTR : void* {init = (void*).init}
enum HTASK : void* {init = (void*).init}
enum HWINSTA : void* {init = (void*).init}
enum HKL : void* {init = (void*).init}
enum HWINEVENTHOOK : void* {init = (void*).init}
enum HMONITOR : void* {init = (void*).init}
enum HUMPD : void* {init = (void*).init}

alias int HFILE;
alias HICON HCURSOR;

alias DWORD COLORREF;
alias DWORD* LPCOLORREF;

const HFILE HFILE_ERROR = cast(HFILE)-1;

struct RECT {
	LONG left;
	LONG top;
	LONG right;
	LONG bottom;
}
alias RECT* PRECT;
alias RECT* NPRECT;
alias RECT* LPRECT;
alias const(RECT)* LPCRECT;

struct RECTL {
	LONG left;
	LONG top;
	LONG right;
	LONG bottom;
}
alias RECTL* PRECTL;
alias RECTL* LPRECTL;
alias const(RECTL)* LPCRECTL;

struct POINT {
	LONG x;
	LONG y;
}
alias POINT* PPOINT;
alias POINT* NPPOINT;
alias POINT* LPPOINT;

struct POINTL {
	LONG x;
	LONG y;
}
alias POINTL* PPOINTL;

struct SIZEL {
	LONG cx;
	LONG cy;
}
alias SIZEL* PSIZEL;
alias SIZEL* LPSIZEL;

struct SIZE {
	INT cx;
	INT cy;
}
alias SIZE* PSIZE;
alias SIZE* LPSIZE;

struct POINTS {
	SHORT   x;
	SHORT   y;
}
alias POINTS* PPOINTS;
alias POINTS* LPPOINTS;

struct FILETIME {
	DWORD dwLowDateTime;
	DWORD dwHighDateTime;
}
alias FILETIME* PFILETIME;
alias FILETIME* LPFILETIME;

enum {
	DM_UPDATE      = 1,
	DM_COPY        = 2,
	DM_PROMPT      = 4,
	DM_MODIFY      = 8,
	DM_IN_BUFFER   = DM_MODIFY,
	DM_IN_PROMPT   = DM_PROMPT,
	DM_OUT_BUFFER  = DM_COPY,
	DM_OUT_DEFAULT = DM_UPDATE,
}

enum {
	DC_FIELDS           = 1,
	DC_PAPERS           = 2,
	DC_PAPERSIZE        = 3,
	DC_MINEXTENT        = 4,
	DC_MAXEXTENT        = 5,
	DC_BINS             = 6,
	DC_DUPLEX           = 7,
	DC_SIZE             = 8,
	DC_EXTRA            = 9,
	DC_VERSION          = 10,
	DC_DRIVER           = 11,
	DC_BINNAMES         = 12,
	DC_ENUMRESOLUTIONS  = 13,
	DC_FILEDEPENDENCIES = 14,
	DC_TRUETYPE         = 15,
	DC_PAPERNAMES       = 16,
	DC_ORIENTATION      = 17,
	DC_COPIES           = 18,
}

// from wincrypt.d
alias ULONG_PTR HCRYPTPROV;
alias ULONG_PTR HCRYPTKEY;
alias ULONG_PTR HCRYPTHASH;

// from wincred
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
