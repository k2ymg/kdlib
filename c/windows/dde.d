/** dde.d

Converted from 'dde.h'.

Version: V7.1
Authors: Koji Kishita
*/
module c.windows.dde;


import c.windows.windef;
import c.windows.winnt;


extern(C){

enum {
	WM_DDE_FIRST     = 0x03E0,
	WM_DDE_INITIATE  = WM_DDE_FIRST,
	WM_DDE_TERMINATE = WM_DDE_FIRST + 1,
	WM_DDE_ADVISE    = WM_DDE_FIRST + 2,
	WM_DDE_UNADVISE  = WM_DDE_FIRST + 3,
	WM_DDE_ACK       = WM_DDE_FIRST + 4,
	WM_DDE_DATA      = WM_DDE_FIRST + 5,
	WM_DDE_REQUEST   = WM_DDE_FIRST + 6,
	WM_DDE_POKE      = WM_DDE_FIRST + 7,
	WM_DDE_EXECUTE   = WM_DDE_FIRST + 8,
	WM_DDE_LAST      = WM_DDE_FIRST + 8,
}

struct DDEACK {
	ushort usFlags;
}

struct DDEADVISE {
	ushort usFlags;
	short cfFormat;
}

struct DDEDATA {
	ushort usFlags;
	short cfFormat;
	BYTE[1] Value;
}

struct DDEPOKE {
	ushort usFlags;
	short cfFormat;
	BYTE[1] Value;
}

struct DDELN {
	ushort usFlags;
	short cfFormat;
}

struct DDEUP {
	ushort usFlags;
	short cfFormat;
	BYTE[1] rgb;
}

export extern(Windows){
	BOOL DdeSetQualityOfService(HWND hwndClient, const(SECURITY_QUALITY_OF_SERVICE)* pqosNew, PSECURITY_QUALITY_OF_SERVICE pqosPrev);
	BOOL ImpersonateDdeClientWindow(HWND hWndClient, HWND hWndServer);

	LPARAM PackDDElParam(UINT msg, UINT_PTR uiLo, UINT_PTR uiHi);
	BOOL UnpackDDElParam(UINT msg, LPARAM lParam, PUINT_PTR puiLo, PUINT_PTR puiHi);
	BOOL FreeDDElParam(UINT msg, LPARAM lParam);
	LPARAM ReuseDDElParam(LPARAM lParam, UINT msgIn, UINT msgOut, UINT_PTR uiLo, UINT_PTR uiHi);
}

}// extern(C)
