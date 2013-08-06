/** vptype.d

Converted from 'vptype.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.vptype;


import c.windows.windef;


extern(C){

enum {
	AMVP_DO_NOT_CARE,
	AMVP_BEST_BANDWIDTH,
	AMVP_INPUT_SAME_AS_OUTPUT
}
alias int AMVP_SELECT_FORMAT_BY;

enum {
	AMVP_MODE_WEAVE,
	AMVP_MODE_BOBINTERLEAVED,
	AMVP_MODE_BOBNONINTERLEAVED,
	AMVP_MODE_SKIPEVEN,
	AMVP_MODE_SKIPODD
}
alias int AMVP_MODE;

struct AMVPSIZE {
	DWORD dwWidth;
	DWORD dwHeight;
}
alias AMVPSIZE* LPAMVPSIZE;

struct AMVPDIMINFO {
	DWORD dwFieldWidth;
	DWORD dwFieldHeight;
	DWORD dwVBIWidth;
	DWORD dwVBIHeight;
	RECT rcValidRegion;
}
alias AMVPDIMINFO* LPAMVPDIMINFO;

struct  AMVPDATAINFO {
	DWORD dwSize;
	DWORD dwMicrosecondsPerField;
	AMVPDIMINFO amvpDimInfo;
	DWORD dwPictAspectRatioX;
	DWORD dwPictAspectRatioY;
	BOOL bEnableDoubleClock;
	BOOL bEnableVACT;
	BOOL bDataIsInterlaced;
	LONG lHalfLinesOdd;
	BOOL bFieldPolarityInverted;
	DWORD dwNumLinesInVREF;
	LONG lHalfLinesEven;
	DWORD dwReserved1;
}
alias AMVPDATAINFO* LPAMVPDATAINFO;

}// extern(C)
