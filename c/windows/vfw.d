/** vfw.d

Converted from 'vfw.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.vfw;


import c.windows.windef;
import c.windows.wtypes;
import c.windows.winerror;
import c.windows.mmsystem;
import c.windows.guiddef;
import c.windows.unknwn;
import c.windows.objidl;
import c.windows.winuser;
import c.windows.commdlg;
import c.windows.wingdi;



extern(C){

export extern(Windows){
	DWORD VideoForWindowsVersion();
	LONG InitVFW();
	LONG TermVFW();
}


//DWORD MKFOURCC(BYTE ch0, BYTE ch1, BYTE ch2, BYTE ch3)((DWORD)(BYTE)(ch0) | ((DWORD)(BYTE)(ch1) << 8 ) |( (DWORD)(BYTE)(ch2) << 16 ) | ( (DWORD)(BYTE)(ch3) << 24 ) )

enum ICVERSION = 0x0104;
enum HIC : HANDLE {init = (HANDLE).init}
enum BI_1632 = 0x32333631;

enum ICTYPE_VIDEO = mmioFOURCC('v', 'i', 'd', 'c');
enum ICTYPE_AUDIO = mmioFOURCC('a', 'u', 'd', 'c');


enum {
	ICERR_OK           = 0,
	ICERR_DONTDRAW     = 1,
	ICERR_NEWPALETTE   = 2,
	ICERR_GOTOKEYFRAME = 3,
	ICERR_STOPDRAWING  = 4,
	ICERR_UNSUPPORTED  = -1,
	ICERR_BADFORMAT    = -2,
	ICERR_MEMORY       = -3,
	ICERR_INTERNAL     = -4,
	ICERR_BADFLAGS     = -5,
	ICERR_BADPARAM     = -6,
	ICERR_BADSIZE      = -7,
	ICERR_BADHANDLE    = -8,
	ICERR_CANTUPDATE   = -9,
	ICERR_ABORT	       = -10,
	ICERR_ERROR        = -100,
	ICERR_BADBITDEPTH  = -200,
	ICERR_BADIMAGESIZE = -201,
	ICERR_CUSTOM       = -400,
}

enum {
	ICMODE_COMPRESS       = 1,
	ICMODE_DECOMPRESS     = 2,
	ICMODE_FASTDECOMPRESS = 3,
	ICMODE_QUERY          = 4,
	ICMODE_FASTCOMPRESS   = 5,
	ICMODE_DRAW           = 8,
}

enum {
	AVIIF_LIST     = 0x00000001,
	AVIIF_TWOCC    = 0x00000002,
	AVIIF_KEYFRAME = 0x00000010,
}

enum {
	ICQUALITY_LOW     = 0,
	ICQUALITY_HIGH    = 10000,
	ICQUALITY_DEFAULT = -1,
}

enum {
	ICM_USER              = DRV_USER + 0x0000,
	ICM_RESERVED_LOW      = DRV_USER + 0x1000,
	ICM_RESERVED_HIGH     = DRV_USER + 0x2000,
	ICM_RESERVED          = ICM_RESERVED_LOW,
	ICM_GETSTATE          = ICM_RESERVED + 0,
	ICM_SETSTATE          = ICM_RESERVED + 1,
	ICM_GETINFO           = ICM_RESERVED + 2,
	ICM_CONFIGURE         = ICM_RESERVED + 10,
	ICM_ABOUT             = ICM_RESERVED + 11,
	ICM_GETERRORTEXT      = ICM_RESERVED + 12,
	ICM_GETFORMATNAME     = ICM_RESERVED + 20,
	ICM_ENUMFORMATS       = ICM_RESERVED + 21,
	ICM_GETDEFAULTQUALITY = ICM_RESERVED + 30,
	ICM_GETQUALITY        = ICM_RESERVED + 31,
	ICM_SETQUALITY        = ICM_RESERVED + 32,
	ICM_SET               = ICM_RESERVED + 40,
	ICM_GET               = ICM_RESERVED + 41,
}
enum {
	ICM_FRAMERATE    = mmioFOURCC('F', 'r', 'm', 'R'),
	ICM_KEYFRAMERATE = mmioFOURCC('K', 'e', 'y', 'R'),
}
enum {
	ICM_COMPRESS_GET_FORMAT    = ICM_USER + 4,
	ICM_COMPRESS_GET_SIZE      = ICM_USER + 5,
	ICM_COMPRESS_QUERY         = ICM_USER + 6,
	ICM_COMPRESS_BEGIN         = ICM_USER + 7,
	ICM_COMPRESS               = ICM_USER + 8,
	ICM_COMPRESS_END           = ICM_USER + 9,
	ICM_DECOMPRESS_GET_FORMAT  = ICM_USER + 10,
	ICM_DECOMPRESS_QUERY       = ICM_USER + 11,
	ICM_DECOMPRESS_BEGIN       = ICM_USER + 12,
	ICM_DECOMPRESS             = ICM_USER + 13,
	ICM_DECOMPRESS_END         = ICM_USER + 14,
	ICM_DECOMPRESS_SET_PALETTE = ICM_USER + 29,
	ICM_DECOMPRESS_GET_PALETTE = ICM_USER + 30,
	ICM_DRAW_QUERY             = ICM_USER + 31,
	ICM_DRAW_BEGIN             = ICM_USER + 15,
	ICM_DRAW_GET_PALETTE       = ICM_USER + 16,
	ICM_DRAW_UPDATE            = ICM_USER + 17,
	ICM_DRAW_START             = ICM_USER + 18,
	ICM_DRAW_STOP              = ICM_USER + 19,
	ICM_DRAW_BITS              = ICM_USER + 20,
	ICM_DRAW_END               = ICM_USER + 21,
	ICM_DRAW_GETTIME           = ICM_USER + 32,
	ICM_DRAW                   = ICM_USER + 33,
	ICM_DRAW_WINDOW            = ICM_USER + 34,
	ICM_DRAW_SETTIME           = ICM_USER + 35,
	ICM_DRAW_REALIZE           = ICM_USER + 36,
	ICM_DRAW_FLUSH             = ICM_USER + 37,
	ICM_DRAW_RENDERBUFFER      = ICM_USER + 38,
	ICM_DRAW_START_PLAY        = ICM_USER + 39,
	ICM_DRAW_STOP_PLAY         = ICM_USER + 40,
	ICM_DRAW_SUGGESTFORMAT     = ICM_USER + 50,
	ICM_DRAW_CHANGEPALETTE     = ICM_USER + 51,
	ICM_DRAW_IDLE              = ICM_USER + 52,
	ICM_GETBUFFERSWANTED       = ICM_USER + 41,
	ICM_GETDEFAULTKEYFRAMERATE = ICM_USER + 42,
	ICM_DECOMPRESSEX_BEGIN     = ICM_USER + 60,
	ICM_DECOMPRESSEX_QUERY     = ICM_USER + 61,
	ICM_DECOMPRESSEX           = ICM_USER + 62,
	ICM_DECOMPRESSEX_END       = ICM_USER + 63,
	ICM_COMPRESS_FRAMES_INFO   = ICM_USER + 70,
	ICM_COMPRESS_FRAMES        = ICM_USER + 71,
	ICM_SET_STATUS_PROC        = ICM_USER + 72,
}

struct ICOPEN {
	DWORD dwSize;
	DWORD fccType;
	DWORD fccHandler;
	DWORD dwVersion;
	DWORD dwFlags;
	LRESULT dwError;
	LPVOID pV1Reserved;
	LPVOID pV2Reserved;
	DWORD dnDevNode;
}

struct ICINFO {
	DWORD dwSize;
	DWORD fccType;
	DWORD fccHandler;
	DWORD dwFlags;
	DWORD dwVersion;
	DWORD dwVersionICM;
	WCHAR[16] szName;
	WCHAR[128] szDescription;
	WCHAR[128] szDriver;
}

enum {
	VIDCF_QUALITY        = 0x0001,
	VIDCF_CRUNCH         = 0x0002,
	VIDCF_TEMPORAL       = 0x0004,
	VIDCF_COMPRESSFRAMES = 0x0008,
	VIDCF_DRAW           = 0x0010,
	VIDCF_FASTTEMPORALC  = 0x0020,
	VIDCF_FASTTEMPORALD  = 0x0080,
}

enum ICCOMPRESS_KEYFRAME = 0x00000001;

struct ICCOMPRESS {
	DWORD dwFlags;
	LPBITMAPINFOHEADER lpbiOutput;
	LPVOID lpOutput;
	LPBITMAPINFOHEADER lpbiInput;
	LPVOID lpInput;
	LPDWORD lpckid;
	LPDWORD lpdwFlags;
	LONG lFrameNum;
	DWORD dwFrameSize;
	DWORD dwQuality;
	LPBITMAPINFOHEADER lpbiPrev;
	LPVOID lpPrev;
}

enum ICCOMPRESSFRAMES_PADDING = 0x00000001;

struct ICCOMPRESSFRAMES {
	DWORD dwFlags;
	LPBITMAPINFOHEADER lpbiOutput;
	LPARAM lOutput;
	LPBITMAPINFOHEADER lpbiInput;
	LPARAM lInput;
	LONG lStartFrame;
	LONG lFrameCount;
	LONG lQuality;
	LONG lDataRate;
	LONG lKeyRate;
	DWORD dwRate;
	DWORD dwScale;
	DWORD dwOverheadPerFrame;
	DWORD dwReserved2;
	extern(Windows){
	LONG function(LPARAM lInput, LONG lFrame, LPVOID lpBits, LONG len) GetData;
	LONG function(LPARAM lOutput, LONG lFrame, LPVOID lpBits, LONG len) PutData;
	}
}

enum {
	ICSTATUS_START  = 0,
	ICSTATUS_STATUS = 1,
	ICSTATUS_END    = 2,
	ICSTATUS_ERROR  = 3,
	ICSTATUS_YIELD  = 4,
}

struct ICSETSTATUSPROC {
	DWORD dwFlags;
	LPARAM lParam;
	extern(Windows) LONG function(LPARAM lParam, UINT message, LONG l) Status;
}

enum {
	ICDECOMPRESS_HURRYUP     = 0x80000000,
	ICDECOMPRESS_UPDATE      = 0x40000000,
	ICDECOMPRESS_PREROLL     = 0x20000000,
	ICDECOMPRESS_NULLFRAME   = 0x10000000,
	ICDECOMPRESS_NOTKEYFRAME = 0x08000000,
}

struct ICDECOMPRESS {
	DWORD dwFlags;
	LPBITMAPINFOHEADER lpbiInput;
	LPVOID lpInput;
	LPBITMAPINFOHEADER lpbiOutput;
	LPVOID lpOutput;
	DWORD ckid;
}

struct ICDECOMPRESSEX {
	DWORD dwFlags;
	LPBITMAPINFOHEADER lpbiSrc;
	LPVOID lpSrc;
	LPBITMAPINFOHEADER lpbiDst;
	LPVOID lpDst;
	int xDst;
	int yDst;
	int dxDst;
	int dyDst;
	int xSrc;
	int ySrc;
	int dxSrc;
	int dySrc;
}

enum {
	ICDRAW_QUERY      = 0x00000001,
	ICDRAW_FULLSCREEN = 0x00000002,
	ICDRAW_HDC        = 0x00000004,
	ICDRAW_ANIMATE    = 0x00000008,
	ICDRAW_CONTINUE   = 0x00000010,
	ICDRAW_MEMORYDC   = 0x00000020,
	ICDRAW_UPDATING   = 0x00000040,
	ICDRAW_RENDER     = 0x00000080,
	ICDRAW_BUFFER     = 0x00000100,
}

struct ICDRAWBEGIN {
	DWORD dwFlags;
	HPALETTE hpal;
	HWND hwnd;
	HDC hdc;
	int xDst;
	int yDst;
	int dxDst;
	int dyDst;
	LPBITMAPINFOHEADER lpbi;
	int xSrc;
	int ySrc;
	int dxSrc;
	int dySrc;
	DWORD dwRate;
	DWORD dwScale;
}

enum {
	ICDRAW_HURRYUP     = 0x80000000,
	ICDRAW_UPDATE      = 0x40000000,
	ICDRAW_PREROLL     = 0x20000000,
	ICDRAW_NULLFRAME   = 0x10000000,
	ICDRAW_NOTKEYFRAME = 0x08000000,
}

struct ICDRAW {
	DWORD dwFlags;
	LPVOID lpFormat;
	LPVOID lpData;
	DWORD cbData;
	LONG lTime;
}

struct ICDRAWSUGGEST {
	LPBITMAPINFOHEADER lpbiIn;
	LPBITMAPINFOHEADER lpbiSuggest;
	int dxSrc;
	int dySrc;
	int dxDst;
	int dyDst;
	HIC hicDecompressor;
}

struct ICPALETTE {
	DWORD dwFlags;
	int iStart;
	int iLen;
	LPPALETTEENTRY lppe;
}

export extern(Windows){
	BOOL ICInfo(DWORD fccType, DWORD fccHandler, ICINFO* lpicinfo);
	BOOL ICInstall(DWORD fccType, DWORD fccHandler, LPARAM lParam, LPSTR szDesc, UINT wFlags);
	BOOL ICRemove(DWORD fccType, DWORD fccHandler, UINT wFlags);
	LRESULT ICGetInfo(HIC hic, ICINFO* picinfo, DWORD cb);
	HIC ICOpen(DWORD fccType, DWORD fccHandler, UINT wMode);
	HIC ICOpenFunction(DWORD fccType, DWORD fccHandler, UINT wMode, FARPROC lpfnHandler);
	LRESULT ICClose(HIC hic);
	LRESULT ICSendMessage(HIC hic, UINT msg, DWORD_PTR dw1, DWORD_PTR dw2);
}

enum {
	ICINSTALL_UNICODE    = 0x8000,
	ICINSTALL_FUNCTION   = 0x0001,
	ICINSTALL_DRIVER     = 0x0002,
	ICINSTALL_HDRV       = 0x0004,
	ICINSTALL_DRIVERW    = 0x8002,
	ICMF_CONFIGURE_QUERY = 0x00000001,
	ICMF_ABOUT_QUERY     = 0x00000001,
}

export extern(C) DWORD ICCompress(HIC hic, DWORD dwFlags, LPBITMAPINFOHEADER lpbiOutput, LPVOID lpData, LPBITMAPINFOHEADER lpbiInput, LPVOID lpBits, LPDWORD lpckid, LPDWORD lpdwFlags, LONG lFrameNum, DWORD dwFrameSize, DWORD dwQuality, LPBITMAPINFOHEADER lpbiPrev, LPVOID lpPrev);

//enum ICDECOMPRESS_HURRYUP = 0x80000000; conflict

export extern(C) DWORD ICDecompress(HIC hic, DWORD dwFlags, LPBITMAPINFOHEADER lpbiFormat, LPVOID lpData, LPBITMAPINFOHEADER lpbi, LPVOID lpBits);

LRESULT ICDecompressEx(HIC hic, DWORD dwFlags, LPBITMAPINFOHEADER lpbiSrc, LPVOID lpSrc, int xSrc, int ySrc, int dxSrc, int dySrc, LPBITMAPINFOHEADER lpbiDst, LPVOID lpDst, int xDst, int yDst, int dxDst, int dyDst)
{
	ICDECOMPRESSEX ic;

	ic.dwFlags = dwFlags;
	ic.lpbiSrc = lpbiSrc;
	ic.lpSrc = lpSrc;
	ic.xSrc = xSrc;
	ic.ySrc = ySrc;
	ic.dxSrc = dxSrc;
	ic.dySrc = dySrc;
	ic.lpbiDst = lpbiDst;
	ic.lpDst = lpDst;
	ic.xDst = xDst;
	ic.yDst = yDst;
	ic.dxDst = dxDst;
	ic.dyDst = dyDst;

	return ICSendMessage(hic, ICM_DECOMPRESSEX, cast(DWORD_PTR)&ic, ic.sizeof);
}

LRESULT ICDecompressExBegin(HIC hic, DWORD dwFlags, LPBITMAPINFOHEADER lpbiSrc, LPVOID lpSrc, int xSrc, int ySrc, int dxSrc, int dySrc, LPBITMAPINFOHEADER lpbiDst, LPVOID lpDst, int xDst, int yDst, int dxDst, int dyDst)
{
	ICDECOMPRESSEX ic;

	ic.dwFlags = dwFlags;
	ic.lpbiSrc = lpbiSrc;
	ic.lpSrc = lpSrc;
	ic.xSrc = xSrc;
	ic.ySrc = ySrc;
	ic.dxSrc = dxSrc;
	ic.dySrc = dySrc;
	ic.lpbiDst = lpbiDst;
	ic.lpDst = lpDst;
	ic.xDst = xDst;
	ic.yDst = yDst;
	ic.dxDst = dxDst;
	ic.dyDst = dyDst;

	return ICSendMessage(hic, ICM_DECOMPRESSEX_BEGIN, cast(DWORD_PTR)&ic, ic.sizeof);
}

LRESULT ICDecompressExQuery(HIC hic, DWORD dwFlags, LPBITMAPINFOHEADER lpbiSrc, LPVOID lpSrc, int xSrc, int ySrc, int dxSrc, int dySrc, LPBITMAPINFOHEADER lpbiDst, LPVOID lpDst, int xDst, int yDst, int dxDst, int dyDst)
{
	ICDECOMPRESSEX ic;

	ic.dwFlags = dwFlags;
	ic.lpbiSrc = lpbiSrc;
	ic.lpSrc = lpSrc;
	ic.xSrc = xSrc;
	ic.ySrc = ySrc;
	ic.dxSrc = dxSrc;
	ic.dySrc = dySrc;
	ic.lpbiDst = lpbiDst;
	ic.lpDst = lpDst;
	ic.xDst = xDst;
	ic.yDst = yDst;
	ic.dxDst = dxDst;
	ic.dyDst = dyDst;

	return ICSendMessage(hic, ICM_DECOMPRESSEX_QUERY, cast(DWORD_PTR)&ic, ic.sizeof);
}

//enum {
//	ICDRAW_QUERY      = 0x00000001, conflict
//	ICDRAW_FULLSCREEN = 0x00000002, conflict
//	ICDRAW_HDC        = 0x00000004, conflict
//	ICDRAW_HURRYUP    = 0x80000000, conflict
//	ICDRAW_UPDATE     = 0x40000000, conflict
//}

export extern(C) DWORD ICDrawBegin(HIC hic, DWORD dwFlags, HPALETTE hpal, HWND hwnd, HDC hdc, int xDst, int yDst, int dxDst, int dyDst, LPBITMAPINFOHEADER lpbi, int xSrc, int ySrc, int dxSrc, int dySrc, DWORD dwRate, DWORD dwScale);
export extern(C) DWORD ICDraw(HIC hic, DWORD dwFlags, LPVOID lpFormat, LPVOID lpData, DWORD cbData, LONG lTime);

LRESULT ICDrawSuggestFormat(HIC hic, LPBITMAPINFOHEADER lpbiIn, LPBITMAPINFOHEADER lpbiOut, int dxSrc, int dySrc, int dxDst, int dyDst, HIC hicDecomp)
{
	ICDRAWSUGGEST ic;

	ic.lpbiIn = lpbiIn;
	ic.lpbiSuggest = lpbiOut;
	ic.dxSrc = dxSrc;
	ic.dySrc = dySrc;
	ic.dxDst = dxDst;
	ic.dyDst = dyDst;
	ic.hicDecompressor = hicDecomp;

	return ICSendMessage(hic, ICM_DRAW_SUGGESTFORMAT, cast(DWORD_PTR)&ic, ic.sizeof);
}

alias extern(Windows) LONG function(LPARAM, UINT, LONG) ICSETSTATUSPROC_FUNC;
LRESULT ICSetStatusProc(HIC hic, DWORD dwFlags, LRESULT lParam,  ICSETSTATUSPROC_FUNC fpfnStatus)
{
	ICSETSTATUSPROC ic;

	ic.dwFlags = dwFlags;
	ic.lParam = lParam;
	ic.Status = fpfnStatus;

	return ICSendMessage(hic, ICM_SET_STATUS_PROC, cast(DWORD_PTR)&ic, ic.sizeof);
}

export extern(Windows) HIC ICLocate(DWORD fccType, DWORD fccHandler, LPBITMAPINFOHEADER lpbiIn, LPBITMAPINFOHEADER lpbiOut, WORD wFlags);
export extern(Windows) HIC ICGetDisplayFormat(HIC hic, LPBITMAPINFOHEADER lpbiIn, LPBITMAPINFOHEADER lpbiOut, int BitDepth, int dx, int dy);
export extern(Windows) HANDLE ICImageCompress(HIC hic, UINT uiFlags, LPBITMAPINFO lpbiIn, LPVOID lpBits, LPBITMAPINFO lpbiOut, LONG lQuality, LONG* plSize);
export extern(Windows) HANDLE ICImageDecompress(HIC hic, UINT uiFlags, LPBITMAPINFO lpbiIn, LPVOID lpBits, LPBITMAPINFO lpbiOut);

struct COMPVARS {
	LONG cbSize;
	DWORD dwFlags;
	HIC hic;
	DWORD fccType;
	DWORD fccHandler;
	LPBITMAPINFO lpbiIn;
	LPBITMAPINFO lpbiOut;
	LPVOID lpBitsOut;
	LPVOID lpBitsPrev;
	LONG lFrame;
	LONG lKey;
	LONG lDataRate;
	LONG lQ;
	LONG lKeyCount;
	LPVOID lpState;
	LONG cbState;
}
alias COMPVARS* PCOMPVARS;

enum ICMF_COMPVARS_VALID = 0x00000001;

export extern(Windows) BOOL ICCompressorChoose(HWND hwnd, UINT uiFlags, LPVOID pvIn, LPVOID lpData, PCOMPVARS pc, LPSTR lpszTitle);

enum {
	ICMF_CHOOSE_KEYFRAME       = 0x0001,
	ICMF_CHOOSE_DATARATE       = 0x0002,
	ICMF_CHOOSE_PREVIEW        = 0x0004,
	ICMF_CHOOSE_ALLCOMPRESSORS = 0x0008,
}

export extern(Windows){
	BOOL ICSeqCompressFrameStart(PCOMPVARS pc, LPBITMAPINFO lpbiIn);
	void ICSeqCompressFrameEnd(PCOMPVARS pc);
	LPVOID ICSeqCompressFrame(PCOMPVARS pc, UINT uiFlags, LPVOID lpBits, BOOL* pfKey, LONG* plSize);
	void ICCompressorFree(PCOMPVARS pc);
}

enum HDRAWDIB : HANDLE {init = (HANDLE).init}

enum {
	DDF_0001          = 0x0001,
	DDF_UPDATE        = 0x0002,
	DDF_SAME_HDC      = 0x0004,
	DDF_SAME_DRAW     = 0x0008,
	DDF_DONTDRAW      = 0x0010,
	DDF_ANIMATE       = 0x0020,
	DDF_BUFFER        = 0x0040,
	DDF_JUSTDRAWIT    = 0x0080,
	DDF_FULLSCREEN    = 0x0100,
	DDF_BACKGROUNDPAL = 0x0200,
	DDF_NOTKEYFRAME   = 0x0400,
	DDF_HURRYUP       = 0x0800,
	DDF_HALFTONE      = 0x1000,
	DDF_2000          = 0x2000,
	DDF_PREROLL       = DDF_DONTDRAW,
	DDF_SAME_DIB      = DDF_SAME_DRAW,
	DDF_SAME_SIZE     = DDF_SAME_DRAW,
}

export extern(Windows){
	BOOL  DrawDibInit();
	HDRAWDIB DrawDibOpen();
	BOOL DrawDibClose(HDRAWDIB hdd);
	LPVOID DrawDibGetBuffer(HDRAWDIB hdd, LPBITMAPINFOHEADER lpbi, DWORD dwSize, DWORD dwFlags);
	UINT DrawDibError(HDRAWDIB hdd);
	HPALETTE DrawDibGetPalette(HDRAWDIB hdd);
	BOOL DrawDibSetPalette(HDRAWDIB hdd, HPALETTE hpal);
	BOOL DrawDibChangePalette(HDRAWDIB hdd, int iStart, int iLen, LPPALETTEENTRY lppe);
	UINT DrawDibRealize(HDRAWDIB hdd, HDC hdc, BOOL fBackground);
	BOOL DrawDibStart(HDRAWDIB hdd, DWORD rate);
	BOOL DrawDibStop(HDRAWDIB hdd);
	BOOL DrawDibBegin(HDRAWDIB hdd, HDC hdc, int dxDst, int dyDst, LPBITMAPINFOHEADER lpbi, int dxSrc, int dySrc, UINT wFlags);
	BOOL DrawDibDraw(HDRAWDIB hdd, HDC hdc, int xDst, int yDst, int dxDst, int dyDst, LPBITMAPINFOHEADER lpbi, LPVOID lpBits, int xSrc, int ySrc, int dxSrc, int dySrc, UINT wFlags);
	BOOL DrawDibEnd(HDRAWDIB hdd);
}

struct DRAWDIBTIME {
	LONG timeCount;
	LONG timeDraw;
	LONG timeDecompress;
	LONG timeDither;
	LONG timeStretch;
	LONG timeBlt;
	LONG timeSetDIBits;
}
alias DRAWDIBTIME* LPDRAWDIBTIME;

export extern(Windows) BOOL DrawDibTime(HDRAWDIB hdd, LPDRAWDIBTIME lpddtime);

enum {
	PD_CAN_DRAW_DIB      = 0x0001,
	PD_CAN_STRETCHDIB    = 0x0002,
	PD_STRETCHDIB_1_1_OK = 0x0004,
	PD_STRETCHDIB_1_2_OK = 0x0008,
	PD_STRETCHDIB_1_N_OK = 0x0010,
}

export extern(Windows){
	LRESULT DrawDibProfileDisplay(LPBITMAPINFOHEADER lpbi);
	void StretchDIB(LPBITMAPINFOHEADER biDst, LPVOID lpDst, int DstX, int DstY, int DstXE, int DstYE, LPBITMAPINFOHEADER biSrc, LPVOID lpSrc, int SrcX, int SrcY, int SrcXE, int SrcYE);
}

pure nothrow
WORD aviTWOCC(BYTE ch0, BYTE ch1)
{
	return cast(WORD)ch0 | (cast(WORD)ch1) << 8;
}

alias WORD TWOCC;

enum {
	formtypeAVI           = mmioFOURCC('A', 'V', 'I', ' '),
	listtypeAVIHEADER     = mmioFOURCC('h', 'd', 'r', 'l'),
	ckidAVIMAINHDR        = mmioFOURCC('a', 'v', 'i', 'h'),
	listtypeSTREAMHEADER  = mmioFOURCC('s', 't', 'r', 'l'),
	ckidSTREAMHEADER      = mmioFOURCC('s', 't', 'r', 'h'),
	ckidSTREAMFORMAT      = mmioFOURCC('s', 't', 'r', 'f'),
	ckidSTREAMHANDLERDATA = mmioFOURCC('s', 't', 'r', 'd'),
	ckidSTREAMNAME        = mmioFOURCC('s', 't', 'r', 'n'),
	listtypeAVIMOVIE      = mmioFOURCC('m', 'o', 'v', 'i'),
	listtypeAVIRECORD     = mmioFOURCC('r', 'e', 'c', ' '),
	ckidAVINEWINDEX       = mmioFOURCC('i', 'd', 'x', '1'),
	streamtypeVIDEO       = mmioFOURCC('v', 'i', 'd', 's'),
	streamtypeAUDIO       = mmioFOURCC('a', 'u', 'd', 's'),
	streamtypeMIDI        = mmioFOURCC('m', 'i', 'd', 's'),
	streamtypeTEXT        = mmioFOURCC('t', 'x', 't', 's'),
	cktypeDIBbits         = aviTWOCC('d', 'b'),
	cktypeDIBcompressed   = aviTWOCC('d', 'c'),
	cktypePALchange       = aviTWOCC('p', 'c'),
	cktypeWAVEbytes       = aviTWOCC('w', 'b'),
	ckidAVIPADDING        = mmioFOURCC('J', 'U', 'N', 'K'),
}

//FromHex(n)	(((n) >= 'A') ? ((n) + 10 - 'A') : ((n) - '0'))
//StreamFromFOURCC(fcc) ((WORD) ((FromHex(LOBYTE(LOWORD(fcc))) << 4) + 	 (FromHex(HIBYTE(LOWORD(fcc))))))
//TWOCCFromFOURCC(fcc) HIWORD(fcc)
//ToHex(n)	((BYTE) (((n) > 9) ? ((n) - 10 + 'A') : ((n) + '0')))
//MAKEAVICKID(tcc, stream) 	 MAKELONG((ToHex((stream) & 0x0f) << 8) |  (ToHex(((stream) & 0xf0) >> 4)), tcc)

enum {
	AVIF_HASINDEX       = 0x00000010,
	AVIF_MUSTUSEINDEX   = 0x00000020,
	AVIF_ISINTERLEAVED  = 0x00000100,
	AVIF_WASCAPTUREFILE = 0x00010000,
	AVIF_COPYRIGHTED    = 0x00020000,
}

enum AVI_HEADERSIZE = 2048;

struct MainAVIHeader {
	DWORD dwMicroSecPerFrame;
	DWORD dwMaxBytesPerSec;
	DWORD dwPaddingGranularity;
	DWORD dwFlags;
	DWORD dwTotalFrames;
	DWORD dwInitialFrames;
	DWORD dwStreams;
	DWORD dwSuggestedBufferSize;
	DWORD dwWidth;
	DWORD dwHeight;
	DWORD[4] dwReserved;
}

enum {
	AVISF_DISABLED         = 0x00000001,
	AVISF_VIDEO_PALCHANGES = 0x00010000,
}

struct AVIStreamHeader {
	FOURCC fccType;
	FOURCC fccHandler;
	DWORD dwFlags;
	WORD wPriority;
	WORD wLanguage;
	DWORD dwInitialFrames;
	DWORD dwScale;
	DWORD dwRate;
	DWORD dwStart;
	DWORD dwLength;
	DWORD dwSuggestedBufferSize;
	DWORD dwQuality;
	DWORD dwSampleSize;
	RECT rcFrame;
}

enum {
//	AVIIF_LIST      = 0x00000001, conflict
//	AVIIF_KEYFRAME  = 0x00000010, conflict
	AVIIF_FIRSTPART = 0x00000020,
	AVIIF_LASTPART  = 0x00000040,
	AVIIF_MIDPART   = AVIIF_LASTPART|AVIIF_FIRSTPART,
	AVIIF_NOTIME    = 0x00000100,
	AVIIF_COMPUSE   = 0x0FFF0000,
}

struct AVIINDEXENTRY {
	DWORD ckid;
	DWORD dwFlags;
	DWORD dwChunkOffset;
	DWORD dwChunkLength;
}

struct AVIPALCHANGE {
	BYTE bFirstEntry;
	BYTE bNumEntries;
	WORD wFlags;
	PALETTEENTRY* peNew;
}


align(8){

//enum {
//	streamtypeVIDEO = mmioFOURCC('v', 'i', 'd', 's'), conflict
//	streamtypeAUDIO = mmioFOURCC('a', 'u', 'd', 's'), conflict
//	streamtypeMIDI  = mmioFOURCC('m', 'i', 'd', 's'), conflict
//	streamtypeTEXT  = mmioFOURCC('t', 'x', 't', 's'), confilct
//}

//enum AVIIF_KEYFRAME = 0x00000010; conflict
enum AVIGETFRAMEF_BESTDISPLAYFMT = 1;

struct AVISTREAMINFOW {
	DWORD fccType;
	DWORD fccHandler;
	DWORD dwFlags;
	DWORD dwCaps;
	WORD wPriority;
	WORD wLanguage;
	DWORD dwScale;
	DWORD dwRate;
	DWORD dwStart;
	DWORD dwLength;
	DWORD dwInitialFrames;
	DWORD dwSuggestedBufferSize;
	DWORD dwQuality;
	DWORD dwSampleSize;
	RECT rcFrame;
	DWORD dwEditCount;
	DWORD dwFormatChangeCount;
	WCHAR[64] szName;
}
alias AVISTREAMINFOW* LPAVISTREAMINFOW;

struct AVISTREAMINFOA {
	DWORD fccType;
	DWORD fccHandler;
	DWORD dwFlags;
	DWORD dwCaps;
	WORD wPriority;
	WORD wLanguage;
	DWORD dwScale;
	DWORD dwRate;
	DWORD dwStart;
	DWORD dwLength;
	DWORD dwInitialFrames;
	DWORD dwSuggestedBufferSize;
	DWORD dwQuality;
	DWORD dwSampleSize;
	RECT rcFrame;
	DWORD dwEditCount;
	DWORD dwFormatChangeCount;
	char[64] szName;
}
alias AVISTREAMINFOA* LPAVISTREAMINFOA;
version(UNICODE){
	alias AVISTREAMINFOW AVISTREAMINFO;
	alias LPAVISTREAMINFOW LPAVISTREAMINFO;
}else{
	alias AVISTREAMINFOA AVISTREAMINFO;
	alias LPAVISTREAMINFOA LPAVISTREAMINFO;
}

enum {
	AVISTREAMINFO_DISABLED      = 0x00000001,
	AVISTREAMINFO_FORMATCHANGES = 0x00010000,
}

struct AVIFILEINFOW {
	DWORD dwMaxBytesPerSec;
	DWORD dwFlags;
	DWORD dwCaps;
	DWORD dwStreams;
	DWORD dwSuggestedBufferSize;
	DWORD dwWidth;
	DWORD dwHeight;
	DWORD dwScale;
	DWORD dwRate;
	DWORD dwLength;
	DWORD dwEditCount;
	WCHAR[64] szFileType;
}
alias AVIFILEINFOW* LPAVIFILEINFOW;

struct AVIFILEINFOA {
	DWORD dwMaxBytesPerSec;
	DWORD dwFlags;
	DWORD dwCaps;
	DWORD dwStreams;
	DWORD dwSuggestedBufferSize;
	DWORD dwWidth;
	DWORD dwHeight;
	DWORD dwScale;
	DWORD dwRate;
	DWORD dwLength;
	DWORD dwEditCount;
	char[64] szFileType;
}
alias AVIFILEINFOA* LPAVIFILEINFOA;

version(UNICODE){
	alias AVIFILEINFOW AVIFILEINFO;
	alias LPAVIFILEINFOW LPAVIFILEINFO;
}else{
	alias AVIFILEINFOA AVIFILEINFO;
	alias LPAVIFILEINFOA LPAVIFILEINFO;
}

enum {
	AVIFILEINFO_HASINDEX       = 0x00000010,
	AVIFILEINFO_MUSTUSEINDEX   = 0x00000020,
	AVIFILEINFO_ISINTERLEAVED  = 0x00000100,
	AVIFILEINFO_WASCAPTUREFILE = 0x00010000,
	AVIFILEINFO_COPYRIGHTED    = 0x00020000,
}

enum {
	AVIFILECAPS_CANREAD       = 0x00000001,
	AVIFILECAPS_CANWRITE      = 0x00000002,
	AVIFILECAPS_ALLKEYFRAMES  = 0x00000010,
	AVIFILECAPS_NOCOMPRESSION = 0x00000020,
}

alias extern(Windows) BOOL function(int) AVISAVECALLBACK;

struct AVICOMPRESSOPTIONS {
	DWORD	fccType;
	DWORD fccHandler;
	DWORD dwKeyFrameEvery;
	DWORD dwQuality;
	DWORD dwBytesPerSecond;
	DWORD dwFlags;
	LPVOID lpFormat;
	DWORD cbFormat;
	LPVOID lpParms;
	DWORD cbParms;
	DWORD dwInterleaveEvery;
}
alias AVICOMPRESSOPTIONS* LPAVICOMPRESSOPTIONS;

enum{
	AVICOMPRESSF_INTERLEAVE = 0x00000001,
	AVICOMPRESSF_DATARATE   = 0x00000002,
	AVICOMPRESSF_KEYFRAMES  = 0x00000004,
	AVICOMPRESSF_VALID      = 0x00000008,
}

interface IAVIStream : IUnknown {
public extern(Windows):
	HRESULT Create(LPARAM lParam1, LPARAM lParam2);
	HRESULT Info(AVISTREAMINFOW* psi, LONG lSize);
	LONG FindSample(LONG lPos, LONG lFlags);
	HRESULT ReadFormat(LONG lPos, LPVOID lpFormat, LONG* lpcbFormat);
	HRESULT SetFormat(LONG lPos, LPVOID lpFormat, LONG cbFormat);
	HRESULT Read(LONG lStart, LONG lSamples, LPVOID lpBuffer, LONG cbBuffer, LONG* plBytes, LONG* plSamples);
	HRESULT Write(LONG lStart, LONG lSamples, LPVOID lpBuffer, LONG cbBuffer, DWORD dwFlags, LONG* plSampWritten, LONG* plBytesWritten);
	HRESULT Delete(LONG lStart, LONG lSamples);
	HRESULT ReadData(DWORD fcc, LPVOID lp, LONG* lpcb);
	HRESULT WriteData(DWORD fcc,LPVOID lp, LONG cb);
	HRESULT SetInfo(AVISTREAMINFOW* lpInfo, LONG cbInfo);
}
alias IAVIStream PAVISTREAM;

interface IAVIStreaming : IUnknown {
public extern(Windows):
	HRESULT Begin(LONG lStart, LONG lEnd, LONG lRate);
	HRESULT End();
}
alias IAVIStreaming PAVISTREAMING;

interface IAVIEditStream : IUnknown {
public extern(Windows):
	HRESULT Cut(LONG*plStart, LONG* plLength, PAVISTREAM* ppResult);
	HRESULT Copy(LONG* plStart, LONG* plLength, PAVISTREAM* ppResult);
	HRESULT Paste(LONG* plPos, LONG* plLength, PAVISTREAM pstream, LONG lStart, LONG lEnd);
	HRESULT Clone(PAVISTREAM* ppResult);
	HRESULT SetInfo(AVISTREAMINFOW* lpInfo, LONG cbInfo);
}
alias IAVIEditStream PAVIEDITSTREAM;

interface IAVIPersistFile : IPersistFile {
public extern(Windows):
	HRESULT Reserved1();
}
alias IAVIPersistFile PAVIPERSISTFILE;

interface IAVIFile : IUnknown {
public extern(Windows):
	HRESULT Info(AVIFILEINFOW* pfi, LONG lSize);
	HRESULT GetStream(PAVISTREAM* ppStream, DWORD fccType, LONG lParam);
	HRESULT CreateStream(PAVISTREAM* ppStream, AVISTREAMINFOW* psi);
	HRESULT WriteData(DWORD ckid, LPVOID lpData, LONG cbData);
	HRESULT ReadData(DWORD ckid, LPVOID lpData, LONG* lpcbData);
	HRESULT EndRecord();
	HRESULT DeleteStream(DWORD fccType, LONG lParam);
}
alias IAVIFile PAVIFILE;

interface IGetFrame : IUnknown {
public extern(Windows):
	LPVOID GetFrame(LONG lPos);
	HRESULT Begin(LONG lStart, LONG lEnd, LONG lRate);
	HRESULT End();
	HRESULT SetFormat(LPBITMAPINFOHEADER lpbi, LPVOID lpBits, int x, int y, int dx, int dy);
}
alias IGetFrame PGETFRAME;

template DEFINE_AVIGUID(string name, uint l, int w1, int w2)
{
	mixin  DEFINE_GUID!(name, l, w1, w2, 0xC0, 0, 0, 0, 0, 0, 0, 0x46);
}

mixin DEFINE_AVIGUID!("IID_IAVIFile", 0x00020020, 0, 0);
mixin DEFINE_AVIGUID!("IID_IAVIStream", 0x00020021, 0, 0);
mixin DEFINE_AVIGUID!("IID_IAVIStreaming", 0x00020022, 0, 0);
mixin DEFINE_AVIGUID!("IID_IGetFrame", 0x00020023, 0, 0);
mixin DEFINE_AVIGUID!("IID_IAVIEditStream", 0x00020024, 0, 0);
mixin DEFINE_AVIGUID!("IID_IAVIPersistFile", 0x00020025, 0, 0);
version(UNICODE){
}else{
	mixin DEFINE_AVIGUID!("CLSID_AVISimpleUnMarshal", 0x00020009, 0, 0);
}
mixin DEFINE_AVIGUID!("CLSID_AVIFile", 0x00020000, 0, 0);

enum {
	AVIFILEHANDLER_CANREAD         = 0x0001,
	AVIFILEHANDLER_CANWRITE        = 0x0002,
	AVIFILEHANDLER_CANACCEPTNONRGB = 0x0004,
}

export extern(Windows){
	void AVIFileInit();
	void AVIFileExit();
	ULONG AVIFileAddRef(PAVIFILE pfile);
	ULONG AVIFileRelease(PAVIFILE pfile);

	HRESULT AVIFileOpenA(PAVIFILE* ppfile, LPCSTR szFile, UINT uMode, LPCLSID lpHandler);
	HRESULT AVIFileOpenW(PAVIFILE* ppfile, LPCWSTR szFile, UINT uMode, LPCLSID lpHandler);
	version(UNICODE)
		alias AVIFileOpenW AVIFileOpen;
	else
		alias AVIFileOpenA AVIFileOpen;

	HRESULT AVIFileInfoW(PAVIFILE pfile, LPAVIFILEINFOW pfi, LONG lSize);
	HRESULT AVIFileInfoA(PAVIFILE pfile, LPAVIFILEINFOA pfi, LONG lSize);
	version(UNICODE)
		alias AVIFileInfoW AVIFileInfo;
	else
		alias AVIFileInfoA AVIFileInfo;

	HRESULT AVIFileGetStream(PAVIFILE pfile, PAVISTREAM* ppavi, DWORD fccType, LONG lParam);

	HRESULT AVIFileCreateStreamW(PAVIFILE pfile, PAVISTREAM* ppavi, AVISTREAMINFOW* psi);
	HRESULT AVIFileCreateStreamA(PAVIFILE pfile, PAVISTREAM* ppavi, AVISTREAMINFOA* psi);
	version(UNICODE)
		alias AVIFileCreateStreamW AVIFileCreateStream;
	else
		alias AVIFileCreateStreamA AVIFileCreateStream;

	HRESULT AVIFileWriteData(PAVIFILE pfile, DWORD ckid, LPVOID lpData, LONG cbData);
	HRESULT AVIFileReadData(PAVIFILE pfile, DWORD ckid, LPVOID lpData, LONG* lpcbData);
	HRESULT AVIFileEndRecord(PAVIFILE pfile);

	ULONG AVIStreamAddRef(PAVISTREAM pavi);
	ULONG AVIStreamRelease(PAVISTREAM pavi);

	HRESULT AVIStreamInfoW(PAVISTREAM pavi, LPAVISTREAMINFOW psi, LONG lSize);
	HRESULT AVIStreamInfoA(PAVISTREAM pavi, LPAVISTREAMINFOA psi, LONG lSize);
	version(UNICODE)
		alias AVIStreamInfoW AVIStreamInfo;
	else
		alias AVIStreamInfoA AVIStreamInfo;

	LONG AVIStreamFindSample(PAVISTREAM pavi, LONG lPos, LONG lFlags);
	HRESULT AVIStreamReadFormat(PAVISTREAM pavi, LONG lPos,LPVOID lpFormat, LONG* lpcbFormat);
	HRESULT AVIStreamSetFormat(PAVISTREAM pavi, LONG lPos, LPVOID lpFormat, LONG cbFormat);
	HRESULT AVIStreamReadData(PAVISTREAM pavi, DWORD fcc, LPVOID lp, LONG* lpcb);
	HRESULT AVIStreamWriteData(PAVISTREAM pavi, DWORD fcc, LPVOID lp, LONG cb);

	HRESULT AVIStreamRead(PAVISTREAM pavi, LONG lStart, LONG lSamples, LPVOID lpBuffer, LONG cbBuffer, LONG* plBytes, LONG* plSamples);
}

enum AVISTREAMREAD_CONVENIENT = -1;

export extern(Windows){
	HRESULT AVIStreamWrite(PAVISTREAM pavi, LONG lStart, LONG lSamples, LPVOID lpBuffer, LONG cbBuffer, DWORD dwFlags, LONG* plSampWritten, LONG* plBytesWritten);
	LONG AVIStreamStart(PAVISTREAM pavi);
	LONG AVIStreamLength(PAVISTREAM pavi);
	LONG AVIStreamTimeToSample(PAVISTREAM pavi, LONG lTime);
	LONG AVIStreamSampleToTime(PAVISTREAM pavi, LONG lSample);
	HRESULT AVIStreamBeginStreaming(PAVISTREAM pavi, LONG lStart, LONG lEnd, LONG lRate);
	HRESULT AVIStreamEndStreaming(PAVISTREAM pavi);
	PGETFRAME AVIStreamGetFrameOpen(PAVISTREAM pavi, LPBITMAPINFOHEADER lpbiWanted);
	LPVOID AVIStreamGetFrame(PGETFRAME pg, LONG lPos);
	HRESULT AVIStreamGetFrameClose(PGETFRAME pg);
	HRESULT AVIStreamOpenFromFileA(PAVISTREAM* ppavi, LPCSTR szFile, DWORD fccType, LONG lParam, UINT mode, CLSID* pclsidHandler);
	HRESULT AVIStreamOpenFromFileW(PAVISTREAM* ppavi, LPCWSTR szFile, DWORD fccType, LONG lParam, UINT mode, CLSID* pclsidHandler);
	version(UNICODE)
		alias AVIStreamOpenFromFileW AVIStreamOpenFromFile;
	else
		alias AVIStreamOpenFromFileA AVIStreamOpenFromFile;

	HRESULT AVIStreamCreate(PAVISTREAM* ppavi, LONG lParam1, LONG lParam2, CLSID* pclsidHandler);
}

enum {
	FIND_DIR        = 0x0000000F,
	FIND_NEXT       = 0x00000001,
	FIND_PREV       = 0x00000004,
	FIND_FROM_START = 0x00000008,
	FIND_TYPE       = 0x000000F0,
	FIND_KEY        = 0x00000010,
	FIND_ANY        = 0x00000020,
	FIND_FORMAT     = 0x00000040,
	FIND_RET        = 0x0000F000,
	FIND_POS        = 0x00000000,
	FIND_LENGTH     = 0x00001000,
	FIND_OFFSET     = 0x00002000,
	FIND_SIZE       = 0x00003000,
	FIND_INDEX      = 0x00004000,
}

alias AVIStreamFindSample AVIStreamFindKeyFrame;
//alias FindSample FindKeyFrame;
alias AVIStreamRelease AVIStreamClose;
alias AVIFileRelease AVIFileClose;
alias AVIFileInit AVIStreamInit;
alias AVIFileExit AVIStreamExit;

enum {
	SEARCH_NEAREST  = FIND_PREV,
	SEARCH_BACKWARD = FIND_PREV,
	SEARCH_FORWARD  = FIND_NEXT,
	SEARCH_KEY      = FIND_KEY,
	SEARCH_ANY      = FIND_ANY,
}

enum comptypeDIB = mmioFOURCC('D', 'I', 'B', ' ');

export extern(Windows) HRESULT AVIMakeCompressedStream(PAVISTREAM* ppsCompressed, PAVISTREAM ppsSource, AVICOMPRESSOPTIONS* lpOptions, CLSID* pclsidHandler);
export extern(C) HRESULT AVISaveA (LPCSTR szFile, CLSID* pclsidHandler, AVISAVECALLBACK lpfnCallback, int nStreams, PAVISTREAM pfile, LPAVICOMPRESSOPTIONS lpOptions, ...);
export extern(Windows) HRESULT AVISaveVA(LPCSTR szFile, CLSID* pclsidHandler, AVISAVECALLBACK lpfnCallback, int nStreams, PAVISTREAM* ppavi, LPAVICOMPRESSOPTIONS* plpOptions);
export extern(C) HRESULT AVISaveW(LPCWSTR szFile, CLSID* pclsidHandler, AVISAVECALLBACK lpfnCallback, int nStreams, PAVISTREAM pfile, LPAVICOMPRESSOPTIONS lpOptions, ...);
export extern(Windows) HRESULT AVISaveVW(LPCWSTR szFile, CLSID* pclsidHandler, AVISAVECALLBACK lpfnCallback, int nStreams, PAVISTREAM* ppavi, LPAVICOMPRESSOPTIONS* plpOptions);
version(UNICODE){
	alias AVISaveW AVISave;
	alias AVISaveVW AVISaveV;
}else{
	alias AVISaveA AVISave;
	alias AVISaveVA AVISaveV;
}

export extern(Windows){
	INT_PTR AVISaveOptions(HWND hwnd, UINT uiFlags, int nStreams, PAVISTREAM* ppavi, LPAVICOMPRESSOPTIONS* plpOptions);
	HRESULT AVISaveOptionsFree(int nStreams, LPAVICOMPRESSOPTIONS* plpOptions);
	HRESULT AVIBuildFilterW(LPWSTR lpszFilter, LONG cbFilter, BOOL fSaving);
	HRESULT AVIBuildFilterA(LPSTR lpszFilter, LONG cbFilter, BOOL fSaving);
	version(UNICODE)
		alias AVIBuildFilterW AVIBuildFilter;
	else
		alias AVIBuildFilterA AVIBuildFilter;

	HRESULT AVIMakeFileFromStreams(PAVIFILE* ppfile, int nStreams, PAVISTREAM* papStreams);
	HRESULT AVIMakeStreamFromClipboard(UINT cfFormat, HANDLE hGlobal, PAVISTREAM* ppstream);
	HRESULT AVIPutFileOnClipboard(PAVIFILE pf);
	HRESULT AVIGetFromClipboard(PAVIFILE* lppf);
	HRESULT AVIClearClipboard();
	HRESULT CreateEditableStream(PAVISTREAM* ppsEditable, PAVISTREAM psSource);
	HRESULT EditStreamCut(PAVISTREAM pavi, LONG* plStart, LONG* plLength, PAVISTREAM* ppResult);
	HRESULT EditStreamCopy(PAVISTREAM pavi, LONG* plStart, LONG* plLength, PAVISTREAM* ppResult);
	HRESULT EditStreamPaste(PAVISTREAM pavi, LONG* plPos, LONG* plLength, PAVISTREAM pstream, LONG lStart, LONG lEnd);
	HRESULT EditStreamClone(PAVISTREAM pavi, PAVISTREAM* ppResult);
	HRESULT EditStreamSetNameA(PAVISTREAM pavi, LPCSTR lpszName);
	HRESULT EditStreamSetNameW(PAVISTREAM pavi, LPCWSTR lpszName);
	HRESULT EditStreamSetInfoW(PAVISTREAM pavi, LPAVISTREAMINFOW lpInfo, LONG cbInfo);
	HRESULT EditStreamSetInfoA(PAVISTREAM pavi, LPAVISTREAMINFOA lpInfo, LONG cbInfo);
	version(UNICODE){
		alias EditStreamSetInfoW EditStreamSetInfo;
		alias EditStreamSetNameW EditStreamSetName;
	}else{
		alias EditStreamSetInfoA EditStreamSetInfo;
		alias EditStreamSetNameA EditStreamSetName;
	}
}

enum AVIERR_OK = 0;

pure nothrow
SCODE MAKE_AVIERR(WORD error)
{
	return MAKE_SCODE(cast(WORD)SEVERITY_ERROR, cast(WORD)FACILITY_ITF, cast(WORD)(0x4000 + error));
}

enum {
	AVIERR_UNSUPPORTED    = MAKE_AVIERR(101),
	AVIERR_BADFORMAT      = MAKE_AVIERR(102),
	AVIERR_MEMORY         = MAKE_AVIERR(103),
	AVIERR_INTERNAL       = MAKE_AVIERR(104),
	AVIERR_BADFLAGS       = MAKE_AVIERR(105),
	AVIERR_BADPARAM       = MAKE_AVIERR(106),
	AVIERR_BADSIZE        = MAKE_AVIERR(107),
	AVIERR_BADHANDLE      = MAKE_AVIERR(108),
	AVIERR_FILEREAD       = MAKE_AVIERR(109),
	AVIERR_FILEWRITE      = MAKE_AVIERR(110),
	AVIERR_FILEOPEN       = MAKE_AVIERR(111),
	AVIERR_COMPRESSOR     = MAKE_AVIERR(112),
	AVIERR_NOCOMPRESSOR   = MAKE_AVIERR(113),
	AVIERR_READONLY       = MAKE_AVIERR(114),
	AVIERR_NODATA         = MAKE_AVIERR(115),
	AVIERR_BUFFERTOOSMALL = MAKE_AVIERR(116),
	AVIERR_CANTCOMPRESS   = MAKE_AVIERR(117),
	AVIERR_USERABORT      = MAKE_AVIERR(198),
	AVIERR_ERROR          = MAKE_AVIERR(199),
}

const TCHAR* MCIWND_WINDOW_CLASS = "MCIWndClass";

export extern(C) HWND MCIWndCreateA(HWND hwndParent, HINSTANCE hInstance, DWORD dwStyle, LPCSTR szFile);
export extern(C) HWND MCIWndCreateW(HWND hwndParent, HINSTANCE hInstance, DWORD dwStyle, LPCWSTR szFile);
version(UNICODE)
	alias MCIWndCreateW MCIWndCreate;
else
	alias MCIWndCreateA MCIWndCreate;

export extern(C) BOOL MCIWndRegisterClass();

enum {
	MCIWNDOPENF_NEW          = 0x0001,
	MCIWNDF_NOAUTOSIZEWINDOW = 0x0001,
	MCIWNDF_NOPLAYBAR        = 0x0002,
	MCIWNDF_NOAUTOSIZEMOVIE  = 0x0004,
	MCIWNDF_NOMENU           = 0x0008,
	MCIWNDF_SHOWNAME         = 0x0010,
	MCIWNDF_SHOWPOS          = 0x0020,
	MCIWNDF_SHOWMODE         = 0x0040,
	MCIWNDF_SHOWALL          = 0x0070,
	MCIWNDF_NOTIFYMODE       = 0x0100,
	MCIWNDF_NOTIFYPOS        = 0x0200,
	MCIWNDF_NOTIFYSIZE       = 0x0400,
	MCIWNDF_NOTIFYERROR      = 0x1000,
	MCIWNDF_NOTIFYALL        = 0x1F00,
	MCIWNDF_NOTIFYANSI       = 0x0080,
	MCIWNDF_NOTIFYMEDIAA     = 0x0880,
	MCIWNDF_NOTIFYMEDIAW     = 0x0800,
}
version(UNICODE)
	enum MCIWNDF_NOTIFYMEDIA = MCIWNDF_NOTIFYMEDIAW;
else
	enum MCIWNDF_NOTIFYMEDIA = MCIWNDF_NOTIFYMEDIAA;

enum {
	MCIWNDF_RECORD     = 0x2000,
	MCIWNDF_NOERRORDLG = 0x4000,
	MCIWNDF_NOOPEN     = 0x8000,
}

enum {
	MCIWNDM_GETDEVICEID      = WM_USER + 100,
	MCIWNDM_GETSTART         = WM_USER + 103,
	MCIWNDM_GETLENGTH        = WM_USER + 104,
	MCIWNDM_GETEND           = WM_USER + 105,
	MCIWNDM_EJECT            = WM_USER + 107,
	MCIWNDM_SETZOOM          = WM_USER + 108,
	MCIWNDM_GETZOOM          = WM_USER + 109,
	MCIWNDM_SETVOLUME        = WM_USER + 110,
	MCIWNDM_GETVOLUME        = WM_USER + 111,
	MCIWNDM_SETSPEED         = WM_USER + 112,
	MCIWNDM_GETSPEED         = WM_USER + 113,
	MCIWNDM_SETREPEAT        = WM_USER + 114,
	MCIWNDM_GETREPEAT        = WM_USER + 115,
	MCIWNDM_REALIZE          = WM_USER + 118,
	MCIWNDM_VALIDATEMEDIA    = WM_USER + 121,
	MCIWNDM_PLAYFROM         = WM_USER + 122,
	MCIWNDM_PLAYTO           = WM_USER + 123,
	MCIWNDM_GETPALETTE       = WM_USER + 126,
	MCIWNDM_SETPALETTE       = WM_USER + 127,
	MCIWNDM_SETTIMERS        = WM_USER + 129,
	MCIWNDM_SETACTIVETIMER   = WM_USER + 130,
	MCIWNDM_SETINACTIVETIMER = WM_USER + 131,
	MCIWNDM_GETACTIVETIMER   = WM_USER + 132,
	MCIWNDM_GETINACTIVETIMER = WM_USER + 133,
	MCIWNDM_CHANGESTYLES     = WM_USER + 135,
	MCIWNDM_GETSTYLES        = WM_USER + 136,
	MCIWNDM_GETALIAS         = WM_USER + 137,
	MCIWNDM_PLAYREVERSE      = WM_USER + 139,
	MCIWNDM_GET_SOURCE       = WM_USER + 140,
	MCIWNDM_PUT_SOURCE       = WM_USER + 141,
	MCIWNDM_GET_DEST         = WM_USER + 142,
	MCIWNDM_PUT_DEST         = WM_USER + 143,
	MCIWNDM_CAN_PLAY         = WM_USER + 144,
	MCIWNDM_CAN_WINDOW       = WM_USER + 145,
	MCIWNDM_CAN_RECORD       = WM_USER + 146,
	MCIWNDM_CAN_SAVE         = WM_USER + 147,
	MCIWNDM_CAN_EJECT        = WM_USER + 148,
	MCIWNDM_CAN_CONFIG       = WM_USER + 149,
	MCIWNDM_PALETTEKICK      = WM_USER + 150,
	MCIWNDM_OPENINTERFACE    = WM_USER + 151,
	MCIWNDM_SETOWNER         = WM_USER + 152,
	MCIWNDM_SENDSTRINGA      = WM_USER + 101,
	MCIWNDM_GETPOSITIONA     = WM_USER + 102,
	MCIWNDM_GETMODEA         = WM_USER + 106,
	MCIWNDM_SETTIMEFORMATA   = WM_USER + 119,
	MCIWNDM_GETTIMEFORMATA   = WM_USER + 120,
	MCIWNDM_GETFILENAMEA     = WM_USER + 124,
	MCIWNDM_GETDEVICEA       = WM_USER + 125,
	MCIWNDM_GETERRORA        = WM_USER + 128,
	MCIWNDM_NEWA             = WM_USER + 134,
	MCIWNDM_RETURNSTRINGA    = WM_USER + 138,
	MCIWNDM_OPENA            = WM_USER + 153,
	MCIWNDM_SENDSTRINGW      = WM_USER + 201,
	MCIWNDM_GETPOSITIONW     = WM_USER + 202,
	MCIWNDM_GETMODEW         = WM_USER + 206,
	MCIWNDM_SETTIMEFORMATW   = WM_USER + 219,
	MCIWNDM_GETTIMEFORMATW   = WM_USER + 220,
	MCIWNDM_GETFILENAMEW     = WM_USER + 224,
	MCIWNDM_GETDEVICEW       = WM_USER + 225,
	MCIWNDM_GETERRORW        = WM_USER + 228,
	MCIWNDM_NEWW             = WM_USER + 234,
	MCIWNDM_RETURNSTRINGW    = WM_USER + 238,
	MCIWNDM_OPENW            = WM_USER + 252,
}

version(UNICODE){
	alias MCIWNDM_SENDSTRINGW MCIWNDM_SENDSTRING;
	alias MCIWNDM_GETPOSITIONW MCIWNDM_GETPOSITION;
	alias MCIWNDM_GETMODEW MCIWNDM_GETMODE;
	alias MCIWNDM_SETTIMEFORMATW MCIWNDM_SETTIMEFORMAT;
	alias MCIWNDM_GETTIMEFORMATW MCIWNDM_GETTIMEFORMAT;
	alias MCIWNDM_GETFILENAMEW MCIWNDM_GETFILENAME;
	alias MCIWNDM_GETDEVICEW MCIWNDM_GETDEVICE;
	alias MCIWNDM_GETERRORW MCIWNDM_GETERROR;
	alias MCIWNDM_NEWW MCIWNDM_NEW;
	alias MCIWNDM_RETURNSTRINGW MCIWNDM_RETURNSTRING;
	alias MCIWNDM_OPENW MCIWNDM_OPEN;
}else{
	alias MCIWNDM_SENDSTRINGA MCIWNDM_SENDSTRING;
	alias MCIWNDM_GETPOSITIONA MCIWNDM_GETPOSITION;
	alias MCIWNDM_GETMODEA MCIWNDM_GETMODE;
	alias MCIWNDM_SETTIMEFORMATA MCIWNDM_SETTIMEFORMAT;
	alias MCIWNDM_GETTIMEFORMATA MCIWNDM_GETTIMEFORMAT;
	alias MCIWNDM_GETFILENAMEA MCIWNDM_GETFILENAME;
	alias MCIWNDM_GETDEVICEA MCIWNDM_GETDEVICE;
	alias MCIWNDM_GETERRORA MCIWNDM_GETERROR;
	alias MCIWNDM_NEWA MCIWNDM_NEW;
	alias MCIWNDM_RETURNSTRINGA MCIWNDM_RETURNSTRING;
	alias MCIWNDM_OPENA MCIWNDM_OPEN;
}

enum {
	MCIWNDM_NOTIFYMODE  = WM_USER + 200,
	MCIWNDM_NOTIFYPOS   = WM_USER + 201,
	MCIWNDM_NOTIFYSIZE  = WM_USER + 202,
	MCIWNDM_NOTIFYMEDIA = WM_USER + 203,
	MCIWNDM_NOTIFYERROR = WM_USER + 205,
}
enum {
	MCIWND_START = -1,
	MCIWND_END   = -2,
}

enum {
	MCI_CLOSE  = 0x0804,
	MCI_PLAY   = 0x0806,
	MCI_SEEK   = 0x0807,
	MCI_STOP   = 0x0808,
	MCI_PAUSE  = 0x0809,
	MCI_STEP   = 0x080E,
	MCI_RECORD = 0x080F,
	MCI_SAVE   = 0x0813,
	MCI_CUT    = 0x0851,
	MCI_COPY   = 0x0852,
	MCI_PASTE  = 0x0853,
	MCI_RESUME = 0x0855,
	MCI_DELETE = 0x0856,
}

enum {
	MCI_MODE_NOT_READY = 524,
	MCI_MODE_STOP      = 525,
	MCI_MODE_PLAY      = 526,
	MCI_MODE_RECORD    = 527,
	MCI_MODE_SEEK      = 528,
	MCI_MODE_PAUSE     = 529,
	MCI_MODE_OPEN      = 530,
}

enum HVIDEO : HANDLE {init = (HANDLE).init}
alias HVIDEO* LPHVIDEO;

export extern(Windows) DWORD VideoForWindowsVersion();

enum {
	DV_ERR_OK                         = 0,
	DV_ERR_BASE                       = 1,
	DV_ERR_NONSPECIFIC                = DV_ERR_BASE,
	DV_ERR_BADFORMAT                  = DV_ERR_BASE + 1,
	DV_ERR_STILLPLAYING               = DV_ERR_BASE + 2,
	DV_ERR_UNPREPARED                 = DV_ERR_BASE + 3,
	DV_ERR_SYNC                       = DV_ERR_BASE + 4,
	DV_ERR_TOOMANYCHANNELS            = DV_ERR_BASE + 5,
	DV_ERR_NOTDETECTED                = DV_ERR_BASE + 6,
	DV_ERR_BADINSTALL                 = DV_ERR_BASE + 7,
	DV_ERR_CREATEPALETTE              = DV_ERR_BASE + 8,
	DV_ERR_SIZEFIELD                  = DV_ERR_BASE + 9,
	DV_ERR_PARAM1                     = DV_ERR_BASE + 10,
	DV_ERR_PARAM2                     = DV_ERR_BASE + 11,
	DV_ERR_CONFIG1                    = DV_ERR_BASE + 12,
	DV_ERR_CONFIG2                    = DV_ERR_BASE + 13,
	DV_ERR_FLAGS                      = DV_ERR_BASE + 14,
	DV_ERR_13                         = DV_ERR_BASE + 15,
	DV_ERR_NOTSUPPORTED               = DV_ERR_BASE + 16,
	DV_ERR_NOMEM                      = DV_ERR_BASE + 17,
	DV_ERR_ALLOCATED                  = DV_ERR_BASE + 18,
	DV_ERR_BADDEVICEID                = DV_ERR_BASE + 19,
	DV_ERR_INVALHANDLE                = DV_ERR_BASE + 20,
	DV_ERR_BADERRNUM                  = DV_ERR_BASE + 21,
	DV_ERR_NO_BUFFERS                 = DV_ERR_BASE + 22,
	DV_ERR_MEM_CONFLICT               = DV_ERR_BASE + 23,
	DV_ERR_IO_CONFLICT                = DV_ERR_BASE + 24,
	DV_ERR_DMA_CONFLICT               = DV_ERR_BASE + 25,
	DV_ERR_INT_CONFLICT               = DV_ERR_BASE + 26,
	DV_ERR_PROTECT_ONLY               = DV_ERR_BASE + 27,
	DV_ERR_LASTERROR                  = DV_ERR_BASE + 27,
	DV_ERR_USER_MSG                   = DV_ERR_BASE + 1000,
}

enum {
	MM_DRVM_OPEN  = 0x3D0,
	MM_DRVM_CLOSE = 0x3D1,
	MM_DRVM_DATA  = 0x3D2,
	MM_DRVM_ERROR = 0x3D3,
}
enum {
	DV_VM_OPEN  = MM_DRVM_OPEN,
	DV_VM_CLOSE = MM_DRVM_CLOSE,
	DV_VM_DATA  = MM_DRVM_DATA,
	DV_VM_ERROR = MM_DRVM_ERROR,
}

struct VIDEOHDR {
	LPBYTE lpData;
	DWORD dwBufferLength;
	DWORD dwBytesUsed;
	DWORD dwTimeCaptured;
	DWORD_PTR dwUser;
	DWORD dwFlags;
	DWORD_PTR[4] dwReserved;
}
alias VIDEOHDR* PVIDEOHDR;
alias VIDEOHDR* LPVIDEOHDR;

enum {
	VHDR_DONE     = 0x00000001,
	VHDR_PREPARED = 0x00000002,
	VHDR_INQUEUE  = 0x00000004,
	VHDR_KEYFRAME = 0x00000008,
	VHDR_VALID    = 0x0000000F,
}

struct CHANNEL_CAPS {
	DWORD dwFlags;
	DWORD dwSrcRectXMod;
	DWORD dwSrcRectYMod;
	DWORD dwSrcRectWidthMod;
	DWORD dwSrcRectHeightMod;
	DWORD dwDstRectXMod;
	DWORD dwDstRectYMod;
	DWORD dwDstRectWidthMod;
	DWORD dwDstRectHeightMod;
}
alias CHANNEL_CAPS* PCHANNEL_CAPS;
alias CHANNEL_CAPS* LPCHANNEL_CAPS;

enum {
	VCAPS_OVERLAY      = 0x00000001,
	VCAPS_SRC_CAN_CLIP = 0x00000002,
	VCAPS_DST_CAN_CLIP = 0x00000004,
	VCAPS_CAN_SCALE    = 0x00000008,
}

enum {
	VIDEO_EXTERNALIN          = 0x0001,
	VIDEO_EXTERNALOUT         = 0x0002,
	VIDEO_IN                  = 0x0004,
	VIDEO_OUT                 = 0x0008,
	VIDEO_DLG_QUERY           = 0x0010,
	VIDEO_CONFIGURE_QUERY     = 0x8000,
	VIDEO_CONFIGURE_SET       = 0x1000,
	VIDEO_CONFIGURE_GET       = 0x2000,
	VIDEO_CONFIGURE_QUERYSIZE = 0x0001,
	VIDEO_CONFIGURE_CURRENT   = 0x0010,
	VIDEO_CONFIGURE_NOMINAL   = 0x0020,
	VIDEO_CONFIGURE_MIN       = 0x0040,
	VIDEO_CONFIGURE_MAX       = 0x0080,
}
enum {
	DVM_USER            = 0x4000,
	DVM_CONFIGURE_START = 0x1000,
	DVM_CONFIGURE_END   = 0x1FFF,
	DVM_PALETTE         = DVM_CONFIGURE_START + 1,
	DVM_FORMAT          = DVM_CONFIGURE_START + 2,
	DVM_PALETTERGB555   = DVM_CONFIGURE_START + 3,
	DVM_SRC_RECT        = DVM_CONFIGURE_START + 4,
	DVM_DST_RECT        = DVM_CONFIGURE_START + 5,
}

enum {
	WM_CAP_START                = WM_USER,
	WM_CAP_UNICODE_START        = WM_USER + 100,
	WM_CAP_GET_CAPSTREAMPTR     = WM_CAP_START + 1,
	WM_CAP_SET_CALLBACK_ERRORW  = WM_CAP_UNICODE_START + 2,
	WM_CAP_SET_CALLBACK_STATUSW = WM_CAP_UNICODE_START + 3,
	WM_CAP_SET_CALLBACK_ERRORA  = WM_CAP_START + 2,
	WM_CAP_SET_CALLBACK_STATUSA = WM_CAP_START + 3,
}
version(UNICODE){
	enum WM_CAP_SET_CALLBACK_ERROR = WM_CAP_SET_CALLBACK_ERRORW;
	enum WM_CAP_SET_CALLBACK_STATUS = WM_CAP_SET_CALLBACK_STATUSW;
}else{
	enum WM_CAP_SET_CALLBACK_ERROR = WM_CAP_SET_CALLBACK_ERRORA;
	enum WM_CAP_SET_CALLBACK_STATUS = WM_CAP_SET_CALLBACK_STATUSA;
}

enum {
	WM_CAP_SET_CALLBACK_YIELD            = WM_CAP_START + 4,
	WM_CAP_SET_CALLBACK_FRAME            = WM_CAP_START + 5,
	WM_CAP_SET_CALLBACK_VIDEOSTREAM      = WM_CAP_START + 6,
	WM_CAP_SET_CALLBACK_WAVESTREAM       = WM_CAP_START + 7,
	WM_CAP_GET_USER_DATA                 = WM_CAP_START + 8,
	WM_CAP_SET_USER_DATA                 = WM_CAP_START + 9,
	WM_CAP_DRIVER_CONNECT                = WM_CAP_START + 10,
	WM_CAP_DRIVER_DISCONNECT             = WM_CAP_START + 11,
	WM_CAP_DRIVER_GET_NAMEA              = WM_CAP_START + 12,
	WM_CAP_DRIVER_GET_VERSIONA           = WM_CAP_START + 13,
	WM_CAP_DRIVER_GET_NAMEW              = WM_CAP_UNICODE_START + 12,
	WM_CAP_DRIVER_GET_VERSIONW           = WM_CAP_UNICODE_START + 13,
}
version(UNICODE){
	enum WM_CAP_DRIVER_GET_NAME = WM_CAP_DRIVER_GET_NAMEW;
	enum WM_CAP_DRIVER_GET_VERSION = WM_CAP_DRIVER_GET_VERSIONW;
}else{
	enum WM_CAP_DRIVER_GET_NAME = WM_CAP_DRIVER_GET_NAMEA;
	enum WM_CAP_DRIVER_GET_VERSION = WM_CAP_DRIVER_GET_VERSIONA;
}

enum {
	WM_CAP_DRIVER_GET_CAPS        = WM_CAP_START + 14,
	WM_CAP_FILE_SET_CAPTURE_FILEA = WM_CAP_START + 20,
	WM_CAP_FILE_GET_CAPTURE_FILEA = WM_CAP_START + 21,
	WM_CAP_FILE_SAVEASA           = WM_CAP_START + 23,
	WM_CAP_FILE_SAVEDIBA          = WM_CAP_START + 25,
	WM_CAP_FILE_SET_CAPTURE_FILEW = WM_CAP_UNICODE_START + 20,
	WM_CAP_FILE_GET_CAPTURE_FILEW = WM_CAP_UNICODE_START + 21,
	WM_CAP_FILE_SAVEASW           = WM_CAP_UNICODE_START + 23,
	WM_CAP_FILE_SAVEDIBW          = WM_CAP_UNICODE_START + 25,
}
version(UNICODE){
	enum WM_CAP_FILE_SET_CAPTURE_FILE = WM_CAP_FILE_SET_CAPTURE_FILEW;
	enum WM_CAP_FILE_GET_CAPTURE_FILE = WM_CAP_FILE_GET_CAPTURE_FILEW;
	enum WM_CAP_FILE_SAVEAS = WM_CAP_FILE_SAVEASW;
	enum WM_CAP_FILE_SAVEDIB = WM_CAP_FILE_SAVEDIBW;
}else{
	enum WM_CAP_FILE_SET_CAPTURE_FILE = WM_CAP_FILE_SET_CAPTURE_FILEA;
	enum WM_CAP_FILE_GET_CAPTURE_FILE = WM_CAP_FILE_GET_CAPTURE_FILEA;
	enum WM_CAP_FILE_SAVEAS = WM_CAP_FILE_SAVEASA;
	enum WM_CAP_FILE_SAVEDIB = WM_CAP_FILE_SAVEDIBA;
}
enum {
	WM_CAP_FILE_ALLOCATE        = WM_CAP_START + 22,
	WM_CAP_FILE_SET_INFOCHUNK   = WM_CAP_START + 24,
	WM_CAP_EDIT_COPY            = WM_CAP_START + 30,
	WM_CAP_SET_AUDIOFORMAT      = WM_CAP_START + 35,
	WM_CAP_GET_AUDIOFORMAT      = WM_CAP_START + 36,
	WM_CAP_DLG_VIDEOFORMAT      = WM_CAP_START + 41,
	WM_CAP_DLG_VIDEOSOURCE      = WM_CAP_START + 42,
	WM_CAP_DLG_VIDEODISPLAY     = WM_CAP_START + 43,
	WM_CAP_GET_VIDEOFORMAT      = WM_CAP_START + 44,
	WM_CAP_SET_VIDEOFORMAT      = WM_CAP_START + 45,
	WM_CAP_DLG_VIDEOCOMPRESSION = WM_CAP_START + 46,
	WM_CAP_SET_PREVIEW          = WM_CAP_START + 50,
	WM_CAP_SET_OVERLAY          = WM_CAP_START + 51,
	WM_CAP_SET_PREVIEWRATE      = WM_CAP_START + 52,
	WM_CAP_SET_SCALE            = WM_CAP_START + 53,
	WM_CAP_GET_STATUS           = WM_CAP_START + 54,
	WM_CAP_SET_SCROLL           = WM_CAP_START + 55,
	WM_CAP_GRAB_FRAME           = WM_CAP_START + 60,
	WM_CAP_GRAB_FRAME_NOSTOP    = WM_CAP_START + 61,
	WM_CAP_SEQUENCE             = WM_CAP_START + 62,
	WM_CAP_SEQUENCE_NOFILE      = WM_CAP_START + 63,
	WM_CAP_SET_SEQUENCE_SETUP   = WM_CAP_START + 64,
	WM_CAP_GET_SEQUENCE_SETUP   = WM_CAP_START + 65,
	WM_CAP_SET_MCI_DEVICEA      = WM_CAP_START + 66,
	WM_CAP_GET_MCI_DEVICEA      = WM_CAP_START + 67,
	WM_CAP_SET_MCI_DEVICEW      = WM_CAP_UNICODE_START + 66,
	WM_CAP_GET_MCI_DEVICEW      = WM_CAP_UNICODE_START + 67,
}
version(UNICODE){
	enum WM_CAP_SET_MCI_DEVICE = WM_CAP_SET_MCI_DEVICEW;
	enum WM_CAP_GET_MCI_DEVICE = WM_CAP_GET_MCI_DEVICEW;
}else{
	enum WM_CAP_SET_MCI_DEVICE = WM_CAP_SET_MCI_DEVICEA;
	enum WM_CAP_GET_MCI_DEVICE = WM_CAP_GET_MCI_DEVICEA;
}
enum {
	WM_CAP_STOP               = WM_CAP_START + 68,
	WM_CAP_ABORT              = WM_CAP_START + 69,
	WM_CAP_SINGLE_FRAME_OPEN  = WM_CAP_START + 70,
	WM_CAP_SINGLE_FRAME_CLOSE = WM_CAP_START + 71,
	WM_CAP_SINGLE_FRAME       = WM_CAP_START + 72,
	WM_CAP_PAL_OPENA          = WM_CAP_START + 80,
	WM_CAP_PAL_SAVEA          = WM_CAP_START + 81,
	WM_CAP_PAL_OPENW          = WM_CAP_UNICODE_START + 80,
	WM_CAP_PAL_SAVEW          = WM_CAP_UNICODE_START + 81,
}
version(UNICODE){
	enum WM_CAP_PAL_OPEN = WM_CAP_PAL_OPENW;
	enum WM_CAP_PAL_SAVE = WM_CAP_PAL_SAVEW;
}else{
	enum WM_CAP_PAL_OPEN = WM_CAP_PAL_OPENA;
	enum WM_CAP_PAL_SAVE = WM_CAP_PAL_SAVEA;
}
enum {
	WM_CAP_PAL_PASTE               = WM_CAP_START + 82,
	WM_CAP_PAL_AUTOCREATE          = WM_CAP_START + 83,
	WM_CAP_PAL_MANUALCREATE        = WM_CAP_START + 84,
	WM_CAP_SET_CALLBACK_CAPCONTROL = WM_CAP_START + 85,
	WM_CAP_UNICODE_END             = WM_CAP_PAL_SAVEW,
	WM_CAP_END                     = WM_CAP_UNICODE_END,
}

struct CAPDRIVERCAPS {
	UINT wDeviceIndex;
	BOOL fHasOverlay;
	BOOL fHasDlgVideoSource;
	BOOL fHasDlgVideoFormat;
	BOOL fHasDlgVideoDisplay;
	BOOL fCaptureInitialized;
	BOOL fDriverSuppliesPalettes;
	HANDLE hVideoIn;
	HANDLE hVideoOut;
	HANDLE hVideoExtIn;
	HANDLE hVideoExtOut;
}
alias CAPDRIVERCAPS* PCAPDRIVERCAPS;
alias CAPDRIVERCAPS* LPCAPDRIVERCAPS;

struct CAPSTATUS {
	UINT uiImageWidth;
	UINT uiImageHeight;
	BOOL fLiveWindow;
	BOOL fOverlayWindow;
	BOOL fScale;
	POINT ptScroll;
	BOOL fUsingDefaultPalette;
	BOOL fAudioHardware;
	BOOL fCapFileExists;
	DWORD dwCurrentVideoFrame;
	DWORD dwCurrentVideoFramesDropped;
	DWORD dwCurrentWaveSamples;
	DWORD dwCurrentTimeElapsedMS;
	HPALETTE hPalCurrent;
	BOOL fCapturingNow;
	DWORD dwReturn;
	UINT wNumVideoAllocated;
	UINT wNumAudioAllocated;
}
alias CAPSTATUS* PCAPSTATUS;
alias CAPSTATUS* LPCAPSTATUS;

struct CAPTUREPARMS {
	DWORD dwRequestMicroSecPerFrame;
	BOOL fMakeUserHitOKToCapture;
	UINT wPercentDropForError;
	BOOL fYield;
	DWORD dwIndexSize;
	UINT wChunkGranularity;
	BOOL fUsingDOSMemory;
	UINT wNumVideoRequested;
	BOOL fCaptureAudio;
	UINT wNumAudioRequested;
	UINT vKeyAbort;
	BOOL fAbortLeftMouse;
	BOOL fAbortRightMouse;
	BOOL fLimitEnabled;
	UINT wTimeLimit;
	BOOL fMCIControl;
	BOOL fStepMCIDevice;
	DWORD dwMCIStartTime;
	DWORD dwMCIStopTime;
	BOOL fStepCaptureAt2x;
	UINT wStepCaptureAverageFrames;
	DWORD dwAudioBufferSize;
	BOOL fDisableWriteCache;
	UINT AVStreamMaster;
}
alias CAPTUREPARMS* PCAPTUREPARMS;
alias CAPTUREPARMS* LPCAPTUREPARMS;

enum {
	AVSTREAMMASTER_AUDIO = 0,
	AVSTREAMMASTER_NONE  = 1,
}

struct CAPINFOCHUNK {
	FOURCC fccInfoID;
	LPVOID lpData;
	LONG cbData;
}
alias CAPINFOCHUNK* PCAPINFOCHUNK;
alias CAPINFOCHUNK* LPCAPINFOCHUNK;

alias extern(Windows) LRESULT function(HWND hWnd) CAPYIELDCALLBACK;
alias extern(Windows) LRESULT function(HWND hWnd, int nID, LPCWSTR lpsz) CAPSTATUSCALLBACKW;
alias extern(Windows) LRESULT function(HWND hWnd, int nID, LPCWSTR lpsz) CAPERRORCALLBACKW;
alias extern(Windows) LRESULT function(HWND hWnd, int nID, LPCSTR lpsz) CAPSTATUSCALLBACKA;
alias extern(Windows) LRESULT function(HWND hWnd, int nID, LPCSTR lpsz) CAPERRORCALLBACKA;
version(UNICODE){
	alias CAPSTATUSCALLBACKW CAPSTATUSCALLBACK;
	alias CAPERRORCALLBACKW CAPERRORCALLBACK;
}else{
	alias CAPSTATUSCALLBACKA CAPSTATUSCALLBACK;
	alias CAPERRORCALLBACKA CAPERRORCALLBACK;
}
alias extern(Windows) LRESULT function(HWND hWnd, LPVIDEOHDR lpVHdr) CAPVIDEOCALLBACK;
alias extern(Windows) LRESULT function(HWND hWnd, LPWAVEHDR lpWHdr) CAPWAVECALLBACK;
alias extern(Windows) LRESULT function(HWND hWnd, int nState) CAPCONTROLCALLBACK;

enum {
	CONTROLCALLBACK_PREROLL   = 1,
	CONTROLCALLBACK_CAPTURING = 2,
}

export extern(Windows){
	HWND capCreateCaptureWindowA(LPCSTR lpszWindowName, DWORD dwStyle, int x, int y, int nWidth, int nHeight, HWND hwndParent, int nID);
	BOOL capGetDriverDescriptionA(UINT wDriverIndex, LPSTR lpszName, int cbName, LPSTR lpszVer, int cbVer);
	HWND capCreateCaptureWindowW(LPCWSTR lpszWindowName, DWORD dwStyle, int x, int y, int nWidth, int nHeight, HWND hwndParent, int nID);
	BOOL capGetDriverDescriptionW (UINT wDriverIndex, LPWSTR lpszName, int cbName, LPWSTR lpszVer, int cbVer);
}
version(UNICODE){
	alias capCreateCaptureWindowW capCreateCaptureWindow;
	alias capGetDriverDescriptionW capGetDriverDescription;
}else{
	alias capCreateCaptureWindowA capCreateCaptureWindow;
	alias capGetDriverDescriptionA capGetDriverDescription;
}

enum infotypeDIGITIZATION_TIME = mmioFOURCC ('I','D','I','T');
enum infotypeSMPTE_TIME        = mmioFOURCC ('I','S','M','P');

enum {
	IDS_CAP_BEGIN                = 300,
	IDS_CAP_END                  = 301,
	IDS_CAP_INFO                 = 401,
	IDS_CAP_OUTOFMEM             = 402,
	IDS_CAP_FILEEXISTS           = 403,
	IDS_CAP_ERRORPALOPEN         = 404,
	IDS_CAP_ERRORPALSAVE         = 405,
	IDS_CAP_ERRORDIBSAVE         = 406,
	IDS_CAP_DEFAVIEXT            = 407,
	IDS_CAP_DEFPALEXT            = 408,
	IDS_CAP_CANTOPEN             = 409,
	IDS_CAP_SEQ_MSGSTART         = 410,
	IDS_CAP_SEQ_MSGSTOP          = 411,
	IDS_CAP_VIDEDITERR           = 412,
	IDS_CAP_READONLYFILE         = 413,
	IDS_CAP_WRITEERROR           = 414,
	IDS_CAP_NODISKSPACE          = 415,
	IDS_CAP_SETFILESIZE          = 416,
	IDS_CAP_SAVEASPERCENT        = 417,
	IDS_CAP_DRIVER_ERROR         = 418,
	IDS_CAP_WAVE_OPEN_ERROR      = 419,
	IDS_CAP_WAVE_ALLOC_ERROR     = 420,
	IDS_CAP_WAVE_PREPARE_ERROR   = 421,
	IDS_CAP_WAVE_ADD_ERROR       = 422,
	IDS_CAP_WAVE_SIZE_ERROR      = 423,
	IDS_CAP_VIDEO_OPEN_ERROR     = 424,
	IDS_CAP_VIDEO_ALLOC_ERROR    = 425,
	IDS_CAP_VIDEO_PREPARE_ERROR  = 426,
	IDS_CAP_VIDEO_ADD_ERROR      = 427,
	IDS_CAP_VIDEO_SIZE_ERROR     = 428,
	IDS_CAP_FILE_OPEN_ERROR      = 429,
	IDS_CAP_FILE_WRITE_ERROR     = 430,
	IDS_CAP_RECORDING_ERROR      = 431,
	IDS_CAP_RECORDING_ERROR2     = 432,
	IDS_CAP_AVI_INIT_ERROR       = 433,
	IDS_CAP_NO_FRAME_CAP_ERROR   = 434,
	IDS_CAP_NO_PALETTE_WARN      = 435,
	IDS_CAP_MCI_CONTROL_ERROR    = 436,
	IDS_CAP_MCI_CANT_STEP_ERROR  = 437,
	IDS_CAP_NO_AUDIO_CAP_ERROR   = 438,
	IDS_CAP_AVI_DRAWDIB_ERROR    = 439,
	IDS_CAP_COMPRESSOR_ERROR     = 440,
	IDS_CAP_AUDIO_DROP_ERROR     = 441,
	IDS_CAP_AUDIO_DROP_COMPERROR = 442,
	IDS_CAP_STAT_LIVE_MODE       = 500,
	IDS_CAP_STAT_OVERLAY_MODE    = 501,
	IDS_CAP_STAT_CAP_INIT        = 502,
	IDS_CAP_STAT_CAP_FINI        = 503,
	IDS_CAP_STAT_PALETTE_BUILD   = 504,
	IDS_CAP_STAT_OPTPAL_BUILD    = 505,
	IDS_CAP_STAT_I_FRAMES        = 506,
	IDS_CAP_STAT_L_FRAMES        = 507,
	IDS_CAP_STAT_CAP_L_FRAMES    = 508,
	IDS_CAP_STAT_CAP_AUDIO       = 509,
	IDS_CAP_STAT_VIDEOCURRENT    = 510,
	IDS_CAP_STAT_VIDEOAUDIO      = 511,
	IDS_CAP_STAT_VIDEOONLY       = 512,
	IDS_CAP_STAT_FRAMESDROPPED   = 513,
}

export extern(Windows){
	 BOOL GetOpenFileNamePreviewA(LPOPENFILENAMEA lpofn);
	 BOOL GetSaveFileNamePreviewA(LPOPENFILENAMEA lpofn);
	 BOOL GetOpenFileNamePreviewW(LPOPENFILENAMEW lpofn);
	 BOOL GetSaveFileNamePreviewW(LPOPENFILENAMEW lpofn);
	 version(UNICODE){
		 alias GetOpenFileNamePreviewW GetOpenFileNamePreview;
		 alias GetSaveFileNamePreviewW GetSaveFileNamePreview;
	 }else{
		 alias GetOpenFileNamePreviewA GetOpenFileNamePreview;
		 alias GetSaveFileNamePreviewA GetSaveFileNamePreview;
	 }
}

}// align(8)

version(HelperFunctions){
	BOOL DrawDibUpdate(HDRAWDIB hdd, HDC hdc, int x, int y)
	{
		return DrawDibDraw(hdd, hdc, x, y, 0, 0, null, null, 0, 0, 0, 0, DDF_UPDATE);
	}

	DWORD ICQueryAbout(HIC hic)
	{
		return ICSendMessage(hic, ICM_ABOUT, cast(DWORD_PTR)-1, ICMF_ABOUT_QUERY) == ICERR_OK;
	}

	DWORD ICAbout(HIC hic, HWND hwnd)
	{
		return  ICSendMessage(hic, ICM_ABOUT, cast(DWORD_PTR)cast(UINT_PTR)hwnd, 0);
	}

	DWORD ICQueryConfigure(HIC hic)
	{
		return ICSendMessage(hic, ICM_CONFIGURE, cast(DWORD_PTR)-1, ICMF_CONFIGURE_QUERY) == ICERR_OK;
	}

	DWORD ICConfigure(HIC hic, HWND hwnd)
	{
		return ICSendMessage(hic, ICM_CONFIGURE, cast(DWORD_PTR)cast(UINT_PTR)hwnd, 0);
	}

	DWORD ICGetState(HIC hic, void* pv, uint cb)
	{
		return ICSendMessage(hic, ICM_GETSTATE, cast(DWORD_PTR)cast(LPVOID)pv, cast(DWORD_PTR)cb);
	}

	DWORD ICSetState(HIC hic, void* pv, uint cb)
	{
		return ICSendMessage(hic, ICM_SETSTATE, cast(DWORD_PTR)cast(LPVOID)pv, cast(DWORD_PTR)cb);
	}

	DWORD ICGetStateSize(HIC hic)
	{
		return cast(DWORD)ICGetState(hic, null, 0);
	}

	DWORD ICGetDefaultQuality(HIC hic)
	{
		DWORD dwICValue;

		ICSendMessage(hic, ICM_GETDEFAULTQUALITY, cast(DWORD_PTR)cast(LPVOID)&dwICValue, DWORD.sizeof);
		return dwICValue;
	}

	DWORD ICGetDefaultKeyFrameRate(HIC hic)
	{
		DWORD dwICValue;

		ICSendMessage(hic, ICM_GETDEFAULTKEYFRAMERATE, cast(DWORD_PTR)cast(LPVOID)&dwICValue, DWORD.sizeof);
		return dwICValue;
	}

	DWORD ICDrawWindow(HIC hic, RECT* prc)
	{
		return ICSendMessage(hic, ICM_DRAW_WINDOW, cast(DWORD_PTR)prc, RECT.sizeof);
	}

	DWORD ICCompressBegin(HIC hic, BITMAPINFO* lpbiInput, BITMAPINFO* lpbiOutput)
	{
		return ICSendMessage(hic, ICM_COMPRESS_BEGIN, cast(DWORD_PTR)lpbiInput, cast(DWORD_PTR)lpbiOutput);
	}

	DWORD ICCompressQuery(HIC hic, BITMAPINFO* lpbiInput, BITMAPINFO* lpbiOutput)
	{
		return ICSendMessage(hic, ICM_COMPRESS_QUERY, cast(DWORD_PTR)cast(LPVOID)lpbiInput, cast(DWORD_PTR)cast(LPVOID)lpbiOutput);
	}

	DWORD ICCompressGetFormat(HIC hic, BITMAPINFO* lpbiInput, BITMAPINFO* lpbiOutput)
	{
		return ICSendMessage(hic, ICM_COMPRESS_GET_FORMAT, cast(DWORD_PTR)cast(LPVOID)lpbiInput, cast(DWORD_PTR)cast(LPVOID)lpbiOutput);
	}

	DWORD ICCompressGetFormatSize(HIC hic, BITMAPINFO* lpbi)
	{
		return cast(DWORD)ICCompressGetFormat(hic, lpbi, null);
	}

	DWORD ICCompressGetSize(HIC hic, BITMAPINFO* lpbiInput, BITMAPINFO* lpbiOutput)
	{
		return cast(DWORD)ICSendMessage(hic, ICM_COMPRESS_GET_SIZE, cast(DWORD_PTR)cast(LPVOID)lpbiInput, cast(DWORD_PTR)cast(LPVOID)lpbiOutput);
	}

	DWORD ICCompressEnd(HIC hic)
	{
		return ICSendMessage(hic, ICM_COMPRESS_END, 0, 0);
	}

	DWORD ICDecompressBegin(HIC hic, BITMAPINFO*  lpbiInput, BITMAPINFO* lpbiOutput)
	{
		return ICSendMessage(hic, ICM_DECOMPRESS_BEGIN, cast(DWORD_PTR)cast(LPVOID)lpbiInput, cast(DWORD_PTR)cast(LPVOID)lpbiOutput);
	}

	DWORD ICDecompressQuery(HIC hic, BITMAPINFO* lpbiInput, BITMAPINFO* lpbiOutput)
	{
		return ICSendMessage(hic, ICM_DECOMPRESS_QUERY, cast(DWORD_PTR)cast(LPVOID)lpbiInput, cast(DWORD_PTR)cast(LPVOID)lpbiOutput);
	}

	DWORD ICDecompressGetFormat(HIC hic, BITMAPINFO* lpbiInput, BITMAPINFO* lpbiOutput)
	{
		return cast(LONG)ICSendMessage(hic, ICM_DECOMPRESS_GET_FORMAT, cast(DWORD_PTR)cast(LPVOID)lpbiInput, cast(DWORD_PTR)cast(LPVOID)lpbiOutput);
	}

	DWORD ICDecompressGetFormatSize(HIC hic, BITMAPINFO* lpbi)
	{
		return ICDecompressGetFormat(hic, lpbi, null);
	}

	DWORD ICDecompressGetPalette(HIC hic, BITMAPINFOHEADER* lpbiInput, BITMAPINFOHEADER* lpbiOutput)
	{
		return ICSendMessage(hic, ICM_DECOMPRESS_GET_PALETTE, cast(DWORD_PTR)cast(LPVOID)lpbiInput, cast(DWORD_PTR)cast(LPVOID)lpbiOutput);
	}

	DWORD ICDecompressSetPalette(HIC hic, BITMAPINFOHEADER* lpbiPalette)
	{
		return ICSendMessage(hic, ICM_DECOMPRESS_SET_PALETTE, cast(DWORD_PTR)cast(LPVOID)lpbiPalette, 0);
	}

	DWORD ICDecompressEnd(HIC hic)
	{
		return ICSendMessage(hic, ICM_DECOMPRESS_END, 0, 0);
	}

	DWORD ICDecompressExEnd(HIC hic)
	{
		return ICSendMessage(hic, ICM_DECOMPRESSEX_END, 0, 0);
	}

	DWORD ICDrawQuery(HIC hic, BITMAPINFO* lpbiInput)
	{
		return ICSendMessage(hic, ICM_DRAW_QUERY, cast(DWORD_PTR)cast(LPVOID)lpbiInput, 0);
	}

	DWORD ICDrawChangePalette(HIC hic, BITMAPINFO* lpbiInput)
	{
		return ICSendMessage(hic, ICM_DRAW_CHANGEPALETTE, cast(DWORD_PTR)cast(LPVOID)lpbiInput, 0);
	}

	DWORD ICGetBuffersWanted(HIC hic, DWORD* lpdwBuffers)
	{
		return ICSendMessage(hic, ICM_GETBUFFERSWANTED, cast(DWORD_PTR)cast(LPVOID)lpdwBuffers, 0);
	}

	DWORD ICDrawEnd(HIC hic)
	{
		return ICSendMessage(hic, ICM_DRAW_END, 0, 0);
	}

	void ICDrawStart(HIC hic)
	{
		ICSendMessage(hic, ICM_DRAW_START, 0, 0);
	}

	void ICDrawStartPlay(HIC hic, LONG lFrom, LONG lTo)
	{
		return ICSendMessage(hic, ICM_DRAW_START_PLAY, cast(DWORD_PTR)lFrom, cast(DWORD_PTR)lTo);
	}

	void ICDrawStop(HIC hic)
	{
		ICSendMessage(hic, ICM_DRAW_STOP, 0, 0);
	}

	void ICDrawStopPlay(HIC hic)
	{
		ICSendMessage(hic, ICM_DRAW_STOP_PLAY, 0, 0);
	}

	DWORD ICDrawGetTime(HIC hic, LONG* lplTime)
	{
		return ICSendMessage(hic, ICM_DRAW_GETTIME, cast(DWORD_PTR)cast(LPVOID)lplTime, 0);
	}

	DWORD ICDrawSetTime(HIC hic, LONG lTime)
	{
		return ICSendMessage(hic, ICM_DRAW_SETTIME, cast(DWORD_PTR)lTime, 0);
	}

	DWORD ICDrawRealize(HIC hic, HDC hdc, BOOL fBackground)
	{
		return ICSendMessage(hic, ICM_DRAW_REALIZE, cast(DWORD_PTR)cast(UINT_PTR)hdc, cast(DWORD_PTR)fBackground);
	}

	DWORD ICDrawFlush(HIC hic)
	{
		return ICSendMessage(hic, ICM_DRAW_FLUSH, 0, 0);
	}

	void ICDrawRenderBuffer(HIC hic)
	{
		return ICSendMessage(hic, ICM_DRAW_RENDERBUFFER, 0, 0);
	}

	HIC ICDecompressOpen(DWORD fccType, DWORD fccHandler, LPBITMAPINFOHEADER lpbiIn, LPBITMAPINFOHEADER lpbiOut)
	{
		return ICLocate(fccType, fccHandler, lpbiIn, lpbiOut, ICMODE_DECOMPRESS);
	}

	HIC ICDrawOpen(DWORD fccType, DWORD fccHandler, LPBITMAPINFOHEADER lpbiIn)
	{
		return ICLocate(fccType, fccHandler, lpbiIn, null, ICMODE_DRAW);
	}

	private
	LRESULT AVICapSM(HWND hwnd, UINT m, WPARAM w, LPARAM l)
	{
		return IsWindow(hwnd) ? SendMessage(hwnd, m, w, l) : 0;
	}

	LONG AVIStreamSampleToSample(PAVISTREAM pavi1, PAVISTREAM pavi2, LONG l)
	{
		return AVIStreamTimeToSample(pavi1, AVIStreamSampleToTime(pavi2, l));
	}

	LONG AVIStreamNextSample(PAVISTREAM pavi, LONG l)
	{
		return AVIStreamFindSample(pavi, l + 1, FIND_NEXT|FIND_ANY);
	}

	LONG AVIStreamPrevSample(PAVISTREAM pavi, LONG l)
	{
		return AVIStreamFindSample(pavi, l - 1, FIND_PREV|FIND_ANY);
	}

	LONG AVIStreamNearestSample(PAVISTREAM pavi, LONG l)
	{
		return AVIStreamFindSample(pavi, l, FIND_PREV|FIND_ANY);
	}

	LONG AVIStreamNextKeyFrame(PAVISTREAM pavi, LONG l)
	{
		return AVIStreamFindSample(pavi, l + 1, FIND_NEXT|FIND_KEY);
	}

	LONG AVIStreamPrevKeyFrame(PAVISTREAM pavi, LONG l)
	{
		return AVIStreamFindSample(pavi, l - 1, FIND_PREV|FIND_KEY);
	}

	LONG AVIStreamNearestKeyFrame(PAVISTREAM pavi, LONG l)
	{
		return AVIStreamFindSample(pavi, l, FIND_PREV|FIND_KEY);
	}

	BOOL AVIStreamIsKeyFrame(PAVISTREAM pavi, LONG l)
	{
		return (AVIStreamNearestKeyFrame(pavi, l) == l) ? TRUE : FALSE;
	}

	LONG AVIStreamPrevSampleTime(PAVISTREAM pavi, LONG t)
	{
		return AVIStreamSampleToTime(pavi, AVIStreamPrevSample(pavi, AVIStreamTimeToSample(pavi, t)));
	}

	LONG AVIStreamNextSampleTime(PAVISTREAM pavi, LONG t)
	{
		return AVIStreamSampleToTime(pavi, AVIStreamNextSample(pavi, AVIStreamTimeToSample(pavi, t)));
	}

	LONG AVIStreamNearestSampleTime(PAVISTREAM pavi, LONG t)
	{
		return AVIStreamSampleToTime(pavi, AVIStreamNearestSample(pavi, AVIStreamTimeToSample(pavi, t)));
	}

	LONG AVIStreamNextKeyFrameTime(PAVISTREAM pavi, LONG t)
	{
		return AVIStreamSampleToTime(pavi, AVIStreamNextKeyFrame(pavi, AVIStreamTimeToSample(pavi, t)));
	}

	LONG AVIStreamPrevKeyFrameTime(PAVISTREAM pavi, LONG t)
	{
		return AVIStreamSampleToTime(pavi, AVIStreamPrevKeyFrame(pavi, AVIStreamTimeToSample(pavi, t)));
	}

	LONG AVIStreamNearestKeyFrameTime(PAVISTREAM pavi, LONG t)
	{
		return AVIStreamSampleToTime(pavi, AVIStreamNearestKeyFrame(pavi, AVIStreamTimeToSample(pavi, t)));
	}

	LONG AVIStreamStartTime(PAVISTREAM pavi)
	{
		return AVIStreamSampleToTime(pavi, AVIStreamStart(pavi));
	}

	LONG AVIStreamLengthTime(PAVISTREAM pavi)
	{
		return AVIStreamSampleToTime(pavi, AVIStreamLength(pavi));
	}

	LONG AVIStreamEnd(PAVISTREAM pavi)
	{
		return AVIStreamStart(pavi) + AVIStreamLength(pavi);
	}

	LONG AVIStreamEndTime(PAVISTREAM pavi)
	{
		return AVIStreamSampleToTime(pavi, AVIStreamEnd(pavi));
	}

	HRESULT AVIStreamSampleSize(PAVISTREAM pavi, LONG lPos, LONG* plSize)
	{
		return AVIStreamRead(pavi, lPos, 1, null, 0, plSize, null);
	}

	HRESULT AVIStreamFormatSize(PAVISTREAM pavi, LONG lPos, LONG* plSize)
	{
		return AVIStreamReadFormat(pavi, lPos, null, plSize);
	}

	HRESULT AVIStreamDataSize(PAVISTREAM pavi, DWORD fcc, LONG* plSize)
	{
		return AVIStreamReadData(pavi, fcc, null, plSize);
	}


	BOOL MCIWndCanPlay(HWND hwnd)
	{
		return cast(BOOL)SendMessage(hwnd, MCIWNDM_CAN_PLAY, 0, 0);
	}

	BOOL MCIWndCanRecord(HWND hwnd)
	{
		return cast(BOOL)SendMessage(hwnd, MCIWNDM_CAN_RECORD, 0, 0);
	}

	BOOL MCIWndCanSave(HWND hwnd)
	{
		return cast(BOOL)SendMessage(hwnd, MCIWNDM_CAN_SAVE, 0, 0);
	}

	BOOL MCIWndCanWindow(HWND hwnd)
	{
		return cast(BOOL)SendMessage(hwnd, MCIWNDM_CAN_WINDOW, 0, 0);
	}

	BOOL MCIWndCanEject(HWND hwnd)
	{
		return cast(BOOL)SendMessage(hwnd, MCIWNDM_CAN_EJECT, 0, 0);
	}

	BOOL MCIWndCanConfig(HWND hwnd)
	{
		return cast(BOOL)SendMessage(hwnd, MCIWNDM_CAN_CONFIG, 0, 0);
	}

	BOOL MCIWndPaletteKick(HWND hwnd)
	{
		return cast(BOOL)SendMessage(hwnd, MCIWNDM_PALETTEKICK, 0, 0);
	}

	LONG MCIWndSave(HWND hwnd, LPCTSTR szFile)
	{
		return cast(LONG)SendMessage(hwnd, MCI_SAVE, 0, cast(LPARAM)cast(LPVOID)szFile);
	}

	LONG MCIWndSaveDialog(HWND hwnd)
	{
		return MCIWndSave(hwnd, cast(const(wchar)*)-1);
	}

	LONG MCIWndNew(HWND hwnd, void* lp)
	{
		return cast(LONG)SendMessage(hwnd, MCIWNDM_NEW, 0, cast(LPARAM)lp);
	}

	LONG MCIWndRecord(HWND hwnd)
	{
		return cast(LONG)SendMessage(hwnd, MCI_RECORD, 0, 0);
	}

	LONG MCIWndOpen(HWND hwnd, LPCTSTR sz, UINT f)
	{
		return cast(LONG)SendMessage(hwnd, MCIWNDM_OPEN, cast(WPARAM)cast(UINT)f, cast(LPARAM)cast(LPVOID)sz);
	}

	LONG MCIWndOpenDialog(HWND hwnd)
	{
		return MCIWndOpen(hwnd, cast(const(wchar)*)-1, 0);
	}

	LONG MCIWndClose(HWND hwnd)
	{
		return cast(LONG)SendMessage(hwnd, MCI_CLOSE, 0, 0);
	}

	LONG MCIWndPlay(HWND hwnd)
	{
		return cast(LONG)SendMessage(hwnd, MCI_PLAY, 0, 0);
	}

	LONG MCIWndStop(HWND hwnd)
	{
		return cast(LONG)SendMessage(hwnd, MCI_STOP, 0, 0);
	}

	LONG MCIWndPause(HWND hwnd)
	{
		return cast(LONG)SendMessage(hwnd, MCI_PAUSE, 0, 0);
	}

	LONG MCIWndResume(HWND hwnd)
	{
		return cast(LONG)SendMessage(hwnd, MCI_RESUME, 0, 0);
	}

	LONG MCIWndSeek(HWND hwnd, LONG lPos)
	{
		return cast(LONG)SendMessage(hwnd, MCI_SEEK, 0, cast(LPARAM)cast(LONG)lPos);
	}

	LONG MCIWndEject(HWND hwnd)
	{
		return cast(LONG)SendMessage(hwnd, MCIWNDM_EJECT, 0, 0);
	}

	LONG MCIWndHome(HWND hwnd)
	{
		return MCIWndSeek(hwnd, MCIWND_START);
	}

	LONG MCIWndEnd(HWND hwnd)
	{
		return MCIWndSeek(hwnd, MCIWND_END);
	}

	LONG MCIWndGetSource(HWND hwnd, RECT* prc)
	{
		return cast(LONG)SendMessage(hwnd, MCIWNDM_GET_SOURCE, 0, cast(LPARAM)prc);
	}

	LONG MCIWndPutSource(HWND hwnd, RECT* prc)
	{
		return cast(LONG)SendMessage(hwnd, MCIWNDM_PUT_SOURCE, 0, cast(LPARAM)prc);
	}

	LONG MCIWndGetDest(HWND hwnd, RECT* prc)
	{
		return cast(LONG)SendMessage(hwnd, MCIWNDM_GET_DEST, 0, cast(LPARAM)prc);
	}

	LONG MCIWndPutDest(HWND hwnd, RECT* prc)
	{
		return cast(LONG)SendMessage(hwnd, MCIWNDM_PUT_DEST, 0, cast(LPARAM)prc);
	}

	LONG MCIWndPlayReverse(HWND hwnd)
	{
		return cast(LONG)SendMessage(hwnd, MCIWNDM_PLAYREVERSE, 0, 0);
	}

	LONG MCIWndPlayFrom(HWND hwnd, LONG lPos)
	{
		return cast(LONG)SendMessage(hwnd, MCIWNDM_PLAYFROM, 0, cast(LPARAM)lPos);
	}

	LONG MCIWndPlayTo(HWND hwnd, LONG lPos)
	{
		return cast(LONG)SendMessage(hwnd, MCIWNDM_PLAYTO, 0, cast(LPARAM)lPos);
	}

	LONG MCIWndPlayFromTo(HWND hwnd, LONG lStart, LONG lEnd)
	{
		MCIWndSeek(hwnd, lStart);
		return MCIWndPlayTo(hwnd, lEnd);
	}

	UINT MCIWndGetDeviceID(HWND hwnd)
	{
		return cast(UINT)SendMessage(hwnd, MCIWNDM_GETDEVICEID, 0, 0);
	}

	UINT MCIWndGetAlias(HWND hwnd)
	{
		return cast(UINT)SendMessage(hwnd, MCIWNDM_GETALIAS, 0, 0);
	}

	LONG MCIWndGetMode(HWND hwnd, LPTSTR lp, UINT len)
	{
		return cast(LONG)SendMessage(hwnd, MCIWNDM_GETMODE, cast(WPARAM)len, cast(LPARAM)lp);
	}

	LONG MCIWndGetPosition(HWND hwnd)
	{
		return cast(LONG)SendMessage(hwnd, MCIWNDM_GETPOSITION, 0, 0);
	}

	LONG MCIWndGetPositionString(HWND hwnd, LPTSTR lp, UINT len)
	{
		return cast(LONG)SendMessage(hwnd, MCIWNDM_GETPOSITION, cast(WPARAM)len, cast(LPARAM)lp);
	}

	LONG MCIWndGetStart(HWND hwnd)
	{
		return cast(LONG)SendMessage(hwnd, MCIWNDM_GETSTART, 0, 0);
	}

	LONG MCIWndGetLength(HWND hwnd)
	{
		return cast(LONG)SendMessage(hwnd, MCIWNDM_GETLENGTH, 0, 0);
	}

	LONG MCIWndGetEnd(HWND hwnd)
	{
		return cast(LONG)SendMessage(hwnd, MCIWNDM_GETEND, 0, 0);
	}

	LONG MCIWndStep(HWND hwnd, int n)
	{
		return cast(LONG)SendMessage(hwnd, MCI_STEP, 0, cast(LPARAM)n);
	}

	void MCIWndDestroy(HWND hwnd)
	{
		SendMessage(hwnd, WM_CLOSE, 0, 0);
	}

	void MCIWndSetZoom(HWND hwnd, UINT iZoom)
	{
		SendMessage(hwnd, MCIWNDM_SETZOOM, 0, cast(LPARAM)iZoom);
	}

	UINT MCIWndGetZoom(HWND hwnd)
	{
		return cast(UINT)SendMessage(hwnd, MCIWNDM_GETZOOM, 0, 0);
	}

	LONG MCIWndSetVolume(HWND hwnd, UINT iVol)
	{
		return cast(LONG)SendMessage(hwnd, MCIWNDM_SETVOLUME, 0, cast(LPARAM)iVol);
	}

	LONG MCIWndGetVolume(HWND hwnd)
	{
		return cast(LONG)SendMessage(hwnd, MCIWNDM_GETVOLUME, 0, 0);
	}

	LONG MCIWndSetSpeed(HWND hwnd, UINT iSpeed)
	{
		return cast(LONG)SendMessage(hwnd, MCIWNDM_SETSPEED, 0, cast(LPARAM)iSpeed);
	}

	LONG MCIWndGetSpeed(HWND hwnd)
	{
		return cast(LONG)SendMessage(hwnd, MCIWNDM_GETSPEED, 0, 0);
	}

	LONG MCIWndSetTimeFormat(HWND hwnd, LPCTSTR lp)
	{
		return cast(LONG)SendMessage(hwnd, MCIWNDM_SETTIMEFORMAT, 0, cast(LPARAM)lp);
	}

	LONG MCIWndGetTimeFormat(HWND hwnd, LPTSTR lp, UINT len)
	{
		return cast(LONG)SendMessage(hwnd, MCIWNDM_GETTIMEFORMAT, cast(WPARAM)len, cast(LPARAM)lp);
	}

	void MCIWndValidateMedia(HWND hwnd)
	{
		SendMessage(hwnd, MCIWNDM_VALIDATEMEDIA, 0, 0);
	}

	void MCIWndSetRepeat(HWND hwnd, BOOL f)
	{
		SendMessage(hwnd, MCIWNDM_SETREPEAT, 0, cast(LPARAM)f);
	}

	BOOL MCIWndGetRepeat(HWND hwnd)
	{
		return cast(BOOL)SendMessage(hwnd, MCIWNDM_GETREPEAT, 0, 0);
	}

	LONG MCIWndUseFrames(HWND hwnd)
	{
		return MCIWndSetTimeFormat(hwnd, "frames");
	}

	LONG MCIWndUseTime(HWND hwnd)
	{
		return MCIWndSetTimeFormat(hwnd, "ms");
	}

	void MCIWndSetActiveTimer(HWND hwnd, UINT active)
	{
		SendMessage(hwnd, MCIWNDM_SETACTIVETIMER, cast(WPARAM)active, 0);
	}

	void MCIWndSetInactiveTimer(HWND hwnd, UINT inactive)
	{
		SendMessage(hwnd, MCIWNDM_SETINACTIVETIMER, cast(WPARAM)inactive, 0);
	}

	void MCIWndSetTimers(HWND hwnd, UINT active, UINT inactive)
	{
		SendMessage(hwnd, MCIWNDM_SETTIMERS, cast(WPARAM)active, cast(LPARAM)inactive);
	}

	UINT MCIWndGetActiveTimer(HWND hwnd)
	{
		return cast(UINT)SendMessage(hwnd, MCIWNDM_GETACTIVETIMER, 0, 0);
	}

	UINT MCIWndGetInactiveTimer(HWND hwnd)
	{
		return cast(UINT)SendMessage(hwnd, MCIWNDM_GETINACTIVETIMER, 0, 0);
	}

	LONG MCIWndRealize(HWND hwnd, BOOL fBkgnd)
	{
		return cast(LONG)SendMessage(hwnd, MCIWNDM_REALIZE, cast(WPARAM)fBkgnd, 0);
	}

	LONG MCIWndSendString(HWND hwnd, LPTSTR sz)
	{
		return cast(LONG)SendMessage(hwnd, MCIWNDM_SENDSTRING, 0, cast(LPARAM)sz);
	}

	LONG MCIWndReturnString(HWND hwnd, void* lp, UINT len)
	{
		return cast(LONG)SendMessage(hwnd, MCIWNDM_RETURNSTRING, cast(WPARAM)len, cast(LPARAM)lp);
	}

	LONG MCIWndGetError(HWND hwnd, void* lp, UINT len)
	{
		return cast(LONG)SendMessage(hwnd, MCIWNDM_GETERROR, cast(WPARAM)len, cast(LPARAM)lp);
	}

	HPALETTE MCIWndGetPalette(HWND hwnd)
	{
		return cast(HPALETTE)SendMessage(hwnd, MCIWNDM_GETPALETTE, 0, 0);
	}

	LONG MCIWndSetPalette(HWND hwnd, HPALETTE hpal)
	{
		return cast(LONG)SendMessage(hwnd, MCIWNDM_SETPALETTE, cast(WPARAM)hpal, 0);
	}

	LONG MCIWndGetFileName(HWND hwnd, void* lp, UINT len)
	{
		return cast(LONG)SendMessage(hwnd, MCIWNDM_GETFILENAME, cast(WPARAM)len, cast(LPARAM)lp);
	}

	LONG MCIWndGetDevice(HWND hwnd, void* lp, UINT len)
	{
		return cast(LONG)SendMessage(hwnd, MCIWNDM_GETDEVICE, cast(WPARAM)len, cast(LPARAM)lp);
	}

	UINT MCIWndGetStyles(HWND hwnd)
	{
		return cast(UINT)SendMessage(hwnd, MCIWNDM_GETSTYLES, 0, 0);
	}

	LONG MCIWndChangeStyles(HWND hwnd, UINT mask, LONG value)
	{
		 return cast(LONG)SendMessage(hwnd, MCIWNDM_CHANGESTYLES, cast(WPARAM)mask, cast(LPARAM)value);
	}

	LONG MCIWndOpenInterface(HWND hwnd, LPUNKNOWN pUnk)
	{
		return cast(LONG)SendMessage(hwnd, MCIWNDM_OPENINTERFACE, 0, cast(LPARAM)cast(void*)pUnk);
	}

	LONG MCIWndSetOwner(HWND hwnd, HWND hwndP)
	{
		return cast(LONG)SendMessage(hwnd, MCIWNDM_SETOWNER, cast(WPARAM)hwndP, 0);
	}


	BOOL capSetCallbackOnError(HWND hwnd, LRESULT function(HWND, int, LPCTSTR) fpProc)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_SET_CALLBACK_ERROR, 0, cast(LPARAM)fpProc);
	}

	BOOL capSetCallbackOnStatus(HWND hwnd, LRESULT function(HWND, int, LPCTSTR) fpProc)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_SET_CALLBACK_STATUS, 0, cast(LPARAM)fpProc);
	}

	BOOL capSetCallbackOnYield(HWND hwnd, LRESULT function(HWND) fpProc)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_SET_CALLBACK_YIELD, 0, cast(LPARAM)fpProc);
	}

	BOOL capSetCallbackOnFrame(HWND hwnd, LRESULT function(HWND, LPVIDEOHDR) fpProc)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_SET_CALLBACK_FRAME, 0, cast(LPARAM)fpProc);
	}

	BOOL capSetCallbackOnVideoStream(HWND hwnd, LRESULT function(HWND, LPVIDEOHDR) fpProc)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_SET_CALLBACK_VIDEOSTREAM, 0, cast(LPARAM)fpProc);
	}

	BOOL capSetCallbackOnWaveStream(HWND hwnd, LRESULT function(HWND, LPWAVEHDR) fpProc)
	{
		 return cast(BOOL)AVICapSM(hwnd, WM_CAP_SET_CALLBACK_WAVESTREAM, 0, cast(LPARAM)fpProc);
	}

	BOOL capSetCallbackOnCapControl(HWND hwnd, LRESULT function(HWND, int) fpProc)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_SET_CALLBACK_CAPCONTROL, 0, cast(LPARAM)fpProc);
	}

	BOOL capSetUserData(HWND hwnd, LPARAM lUser)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_SET_USER_DATA, 0, lUser);
	}

	LPARAM capGetUserData(HWND hwnd)
	{
		return AVICapSM(hwnd, WM_CAP_GET_USER_DATA, 0, 0);
	}

	BOOL capDriverConnect(HWND hwnd, int i)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_DRIVER_CONNECT, cast(WPARAM)i, 0);
	}

	BOOL capDriverDisconnect(HWND hwnd)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_DRIVER_DISCONNECT, 0, 0);
	}

	BOOL capDriverGetName(HWND hwnd, LPTSTR szName, WPARAM wSize)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_DRIVER_GET_NAME, wSize, cast(LPARAM)cast(LPVOID)szName);
	}

	BOOL capDriverGetVersion(HWND hwnd, LPTSTR szVer, WPARAM wSize)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_DRIVER_GET_VERSION, wSize, cast(LPARAM)cast(LPVOID)szVer);
	}

	BOOL capDriverGetCaps(HWND hwnd, LPCAPDRIVERCAPS s, WPARAM wSize)
	{
		 return cast(BOOL)AVICapSM(hwnd, WM_CAP_DRIVER_GET_CAPS, wSize, cast(LPARAM)cast(LPVOID)s);
	}

	BOOL capFileSetCaptureFile(HWND hwnd, LPTSTR szName)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_FILE_SET_CAPTURE_FILE, 0, cast(LPARAM)cast(LPVOID)szName);
	}

	BOOL capFileGetCaptureFile(HWND hwnd, LPTSTR szName, WPARAM wSize)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_FILE_GET_CAPTURE_FILE, wSize, cast(LPARAM)cast(LPVOID)szName);
	}

	BOOL capFileAlloc(HWND hwnd, DWORD dwSize)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_FILE_ALLOCATE, 0, cast(LPARAM)dwSize);
	}

	BOOL capFileSaveAs(HWND hwnd, LPTSTR szName)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_FILE_SAVEAS, 0, cast(LPARAM)cast(LPVOID)szName);
	}

	BOOL capFileSetInfoChunk(HWND hwnd, LPCAPINFOCHUNK lpInfoChunk)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_FILE_SET_INFOCHUNK, 0, cast(LPARAM)lpInfoChunk);
	}

	BOOL capFileSaveDIB(HWND hwnd, LPTSTR szName)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_FILE_SAVEDIB, 0, cast(LPARAM)cast(LPVOID)szName);
	}

	BOOL capEditCopy(HWND hwnd)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_EDIT_COPY, 0, 0);
	}

	BOOL capSetAudioFormat(HWND hwnd, LPWAVEFORMATEX s, WPARAM wSize)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_SET_AUDIOFORMAT, (wSize), cast(LPARAM)cast(LPVOID)s);
	}

	DWORD capGetAudioFormat(HWND hwnd, LPWAVEFORMATEX s, WPARAM wSize)
	{
		return cast(DWORD)AVICapSM(hwnd, WM_CAP_GET_AUDIOFORMAT, wSize, cast(LPARAM)cast(LPVOID)s);
	}

	DWORD capGetAudioFormatSize(HWND hwnd)
	{
		return cast(DWORD)AVICapSM(hwnd, WM_CAP_GET_AUDIOFORMAT, 0, 0);
	}

	BOOL capDlgVideoFormat(HWND hwnd)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_DLG_VIDEOFORMAT, 0, 0);
	}

	BOOL capDlgVideoSource(HWND hwnd)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_DLG_VIDEOSOURCE, 0, 0);
	}

	BOOL capDlgVideoDisplay(HWND hwnd)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_DLG_VIDEODISPLAY, 0, 0);
	}

	BOOL capDlgVideoCompression(HWND hwnd)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_DLG_VIDEOCOMPRESSION, 0, 0);
	}

	DWORD capGetVideoFormat(HWND hwnd, BITMAPINFO* s, WPARAM wSize)
	{
		return cast(DWORD)AVICapSM(hwnd, WM_CAP_GET_VIDEOFORMAT, wSize, cast(LPARAM)s);
	}

	DWORD capGetVideoFormatSize(HWND hwnd)
	{
		return cast(DWORD)AVICapSM(hwnd, WM_CAP_GET_VIDEOFORMAT, 0, 0);
	}

	BOOL capSetVideoFormat(HWND hwnd, BITMAPINFO* s, WPARAM wSize)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_SET_VIDEOFORMAT, wSize, cast(LPARAM)s);
	}

	BOOL capPreview(HWND hwnd, BOOL f)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_SET_PREVIEW, cast(WPARAM)f, 0);
	}

	BOOL capPreviewRate(HWND hwnd, WPARAM wMS)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_SET_PREVIEWRATE, cast(WPARAM)wMS, 0);
	}

	BOOL capOverlay(HWND hwnd, BOOL f)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_SET_OVERLAY, cast(WPARAM)f, 0);
	}

	BOOL capPreviewScale(HWND hwnd, BOOL f)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_SET_SCALE, cast(WPARAM)f, 0);
	}

	BOOL capGetStatus(HWND hwnd, LPCAPSTATUS s, WPARAM wSize)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_GET_STATUS, wSize, cast(LPARAM)cast(LPVOID)s);
	}

	BOOL capSetScrollPos(HWND hwnd, LPPOINT lpP)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_SET_SCROLL, 0, cast(LPARAM)lpP);
	}

	BOOL capGrabFrame(HWND hwnd)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_GRAB_FRAME, 0, 0);
	}


	BOOL capGrabFrameNoStop(HWND hwnd)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_GRAB_FRAME_NOSTOP, 0, 0);
	}

	BOOL capCaptureSequence(HWND hwnd)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_SEQUENCE, 0, 0);
	}

	BOOL capCaptureSequenceNoFile(HWND hwnd)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_SEQUENCE_NOFILE, 0, 0);
	}

	BOOL capCaptureStop(HWND hwnd)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_STOP, 0, 0);
	}

	BOOL capCaptureAbort(HWND hwnd)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_ABORT, 0, 0);
	}

	BOOL capCaptureSingleFrameOpen(HWND hwnd)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_SINGLE_FRAME_OPEN, 0, 0);
	}

	BOOL capCaptureSingleFrameClose(HWND hwnd)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_SINGLE_FRAME_CLOSE, 0, 0);
	}

	BOOL capCaptureSingleFrame(HWND hwnd)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_SINGLE_FRAME, 0, 0);
	}

	BOOL capCaptureGetSetup(HWND hwnd, LPCAPTUREPARMS s, WPARAM wSize)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_GET_SEQUENCE_SETUP, wSize, cast(LPARAM)cast(LPVOID)s);
	}

	BOOL capCaptureSetSetup(HWND hwnd, LPCAPTUREPARMS s, WPARAM wSize)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_SET_SEQUENCE_SETUP, wSize, cast(LPARAM)cast(LPVOID)s);
	}

	BOOL capSetMCIDeviceName(HWND hwnd, LPTSTR szName)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_SET_MCI_DEVICE, 0, cast(LPARAM)cast(LPVOID)szName);
	}

	BOOL capGetMCIDeviceName(HWND hwnd, LPTSTR szName, WPARAM wSize)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_GET_MCI_DEVICE, wSize, cast(LPARAM)cast(LPVOID)szName);
	}

	BOOL capPaletteOpen(HWND hwnd, LPTSTR szName)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_PAL_OPEN, 0, cast(LPARAM)cast(LPVOID)szName);
	}

	BOOL capPaletteSave(HWND hwnd, LPTSTR szName)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_PAL_SAVE, 0, cast(LPARAM)cast(LPVOID)szName);
	}

	BOOL capPalettePaste(HWND hwnd)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_PAL_PASTE, 0, 0);
	}

	BOOL capPaletteAuto(HWND hwnd, int iFrames, DWORD iColors)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_PAL_AUTOCREATE, cast(WPARAM)iFrames, cast(LPARAM)iColors);
	}

	BOOL capPaletteManual(HWND hwnd, BOOL fGrab, DWORD iColors)
	{
		return cast(BOOL)AVICapSM(hwnd, WM_CAP_PAL_MANUALCREATE, cast(WPARAM)fGrab, cast(LPARAM)iColors);
	}
}

}// extern(C)