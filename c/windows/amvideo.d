/** amvideo.d

Converted from 'amvideo.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.amvideo;


import c.windows.windef;
import c.windows.wtypes;
import c.windows.unknwn;
import c.windows.ddraw;
import c.windows.wingdi;
import c.windows.winbase;


extern(C){

alias LONGLONG REFERENCE_TIME;

enum {
	AMDDS_NONE    = 0x00,
	AMDDS_DCIPS   = 0x01,
	AMDDS_PS      = 0x02,
	AMDDS_RGBOVR  = 0x04,
	AMDDS_YUVOVR  = 0x08,
	AMDDS_RGBOFF  = 0x10,
	AMDDS_YUVOFF  = 0x20,
	AMDDS_RGBFLP  = 0x40,
	AMDDS_YUVFLP  = 0x80,
	AMDDS_ALL     = 0xFF,
	AMDDS_DEFAULT = AMDDS_ALL,
	AMDDS_YUV     = AMDDS_YUVOFF | AMDDS_YUVOVR | AMDDS_YUVFLP,
	AMDDS_RGB     = AMDDS_RGBOFF | AMDDS_RGBOVR | AMDDS_RGBFLP,
	AMDDS_PRIMARY = AMDDS_DCIPS | AMDDS_PS,
}

interface IDirectDrawVideo : IUnknown {
public extern(Windows):
	HRESULT GetSwitches(DWORD* pSwitches);
	HRESULT SetSwitches(DWORD Switches);
	HRESULT GetCaps(DDCAPS* pCaps);
	HRESULT GetEmulatedCaps(DDCAPS* pCaps);
	HRESULT GetSurfaceDesc(DDSURFACEDESC* pSurfaceDesc);
	HRESULT GetFourCCCodes(DWORD* pCount, DWORD* pCodes);
	HRESULT SetDirectDraw(LPDIRECTDRAW pDirectDraw);
	HRESULT GetDirectDraw(LPDIRECTDRAW* ppDirectDraw);
	HRESULT GetSurfaceType(DWORD* pSurfaceType);
	HRESULT SetDefault();
	HRESULT UseScanLine(int UseScanLine);
	HRESULT CanUseScanLine(int* UseScanLine);
	HRESULT UseOverlayStretch(int UseOverlayStretch);
	HRESULT CanUseOverlayStretch(int* UseOverlayStretch);
	HRESULT UseWhenFullScreen(int UseWhenFullScreen);
	HRESULT WillUseFullScreen(int* UseWhenFullScreen);
}

interface IQualProp : IUnknown {
public extern(Windows):
	HRESULT get_FramesDroppedInRenderer(int* pcFrames);
	HRESULT get_FramesDrawn(int* pcFramesDrawn);
	HRESULT get_AvgFrameRate(int* piAvgFrameRate);
	HRESULT get_Jitter(int* iJitter);
	HRESULT get_AvgSyncOffset(int* piAvg);
	HRESULT get_DevSyncOffset(int* piDev);
}

interface IFullScreenVideo : IUnknown {
public extern(Windows):
	HRESULT CountModes(int* pModes);
	HRESULT GetModeInfo(int Mode, int* pWidth, int* pHeight, int* pDepth);
	HRESULT GetCurrentMode(int* pMode);
	HRESULT IsModeAvailable(int Mode);
	HRESULT IsModeEnabled(int Mode);
	HRESULT SetEnabled(int Mode, int bEnabled);
	HRESULT GetClipFactor(int* pClipFactor);
	HRESULT SetClipFactor(int ClipFactor);
	HRESULT SetMessageDrain(HWND hwnd);
	HRESULT GetMessageDrain(HWND* hwnd);
	HRESULT SetMonitor(int Monitor);
	HRESULT GetMonitor(int* Monitor);
	HRESULT HideOnDeactivate(int Hide);
	HRESULT IsHideOnDeactivate();
	HRESULT SetCaption(BSTR strCaption);
	HRESULT GetCaption(BSTR* pstrCaption);
	HRESULT SetDefault();
}

interface IFullScreenVideoEx : IFullScreenVideo {
public extern(Windows):
	HRESULT SetAcceleratorTable(HWND hwnd, HACCEL hAccel);
	HRESULT GetAcceleratorTable(HWND* phwnd, HACCEL* phAccel);
	HRESULT KeepPixelAspectRatio(int KeepAspect);
	HRESULT IsKeepPixelAspectRatio(int* pKeepAspect);
}

interface IBaseVideoMixer : IUnknown {
public extern(Windows):
	HRESULT SetLeadPin(int iPin);
	HRESULT GetLeadPin(int* piPin);
	HRESULT GetInputPinCount(int* piPinCount);
	HRESULT IsUsingClock(int* pbValue);
	HRESULT SetUsingClock(int bValue);
	HRESULT GetClockPeriod(int* pbValue);
	HRESULT SetClockPeriod(int bValue);
}

enum {
	iPALETTE_COLORS = 256,
	iEGA_COLORS     = 16,
	iMASK_COLORS    = 3,
	iTRUECOLOR      = 16,
	iRED            = 0,
	iGREEN          = 1,
	iBLUE           = 2,
	iPALETTE        = 8,
	iMAXBITS        = 8,
}

struct TRUECOLORINFO {
	DWORD[iMASK_COLORS] dwBitMasks;
	RGBQUAD[iPALETTE_COLORS] bmiColors;
}

struct VIDEOINFOHEADER {
	RECT rcSource;
	RECT rcTarget;
	DWORD dwBitRate;
	DWORD dwBitErrorRate;
	REFERENCE_TIME AvgTimePerFrame;
	BITMAPINFOHEADER bmiHeader;
}

struct VIDEOINFO {
	RECT rcSource;
	RECT rcTarget;
	DWORD dwBitRate;
	DWORD dwBitErrorRate;
	REFERENCE_TIME AvgTimePerFrame;
	BITMAPINFOHEADER bmiHeader;
	union {
		RGBQUAD[iPALETTE_COLORS] bmiColors;
		DWORD[iMASK_COLORS] dwBitMasks;
		TRUECOLORINFO TrueColorInfo;
	}
}

pure nothrow
TRUECOLORINFO* TRUECOLOR(VIDEOINFO* pbmi)
{
	return cast(TRUECOLORINFO*)((cast(LPBYTE)&pbmi.bmiHeader) + pbmi.bmiHeader.biSize);
}

pure nothrow
RGBQUAD* COLORS(VIDEOINFO* pbmi)
{
	return cast(RGBQUAD*)((cast(LPBYTE)&pbmi.bmiHeader) + pbmi.bmiHeader.biSize);
}

pure nothrow
DWORD* BITMASKS(VIDEOINFO* pbmi)
{
	return cast(DWORD*)((cast(LPBYTE)&pbmi.bmiHeader) + pbmi.bmiHeader.biSize);
}

enum {
	SIZE_EGA_PALETTE = iEGA_COLORS * RGBQUAD.sizeof,
	SIZE_PALETTE     = iPALETTE_COLORS * RGBQUAD.sizeof,
	SIZE_MASKS       = iMASK_COLORS * DWORD.sizeof,
	SIZE_PREHEADER   = VIDEOINFOHEADER.bmiHeader.offsetof,
	SIZE_VIDEOHEADER = BITMAPINFOHEADER.sizeof + SIZE_PREHEADER,
}

//DWORD WIDTHBYTES(bits) ((DWORD)(((bits)+31) & (~31)) / 8) private
//DWORD DIBWIDTHBYTES(bi) (DWORD)WIDTHBYTES((DWORD)(bi).biWidth * (DWORD)(bi).biBitCount) private
/*DWORD _DIBSIZE(bi) (DIBWIDTHBYTES(bi) * (DWORD)(bi).biHeight) private
DWORD DIBSIZE(BITMAPINFOHEADER bi) // this is not pointer...
{
	((bi).biHeight < 0 ? (-1)*(_DIBSIZE(bi)) : _DIBSIZE(bi))
}*/

/* _INTSAFE_H_INCLUDED_
	__inline HRESULT SAFE_DIBWIDTHBYTES(__in const BITMAPINFOHEADER *pbi, DWORD *pcbWidth)
	{
	DWORD dw;
	HRESULT hr;
	if (pbi->biWidth < 0 || pbi->biBitCount <= 0) {
	return E_INVALIDARG;
	}

	hr = DWordMult((DWORD)pbi->biWidth, (DWORD)pbi->biBitCount, &dw);
	if (FAILED(hr)) {
	return hr;
	}

	dw = (dw & 7) ? dw / 8 + 1: dw / 8;

	if (dw & 3) {
	dw += 4 - (dw & 3);
	}

	*pcbWidth = dw;
	return S_OK;
	}

	__inline HRESULT SAFE_DIBSIZE(__in const BITMAPINFOHEADER *pbi, DWORD *pcbSize)
	{
	DWORD dw;
	DWORD dwWidthBytes;
	HRESULT hr;
	if (pbi->biHeight == 0x80000000) {
	return E_INVALIDARG;
	}
	hr = SAFE_DIBWIDTHBYTES(pbi, &dwWidthBytes);
	if (FAILED(hr)) {
	return hr;
	}
	dw = abs(pbi->biHeight);
	hr = DWordMult(dw, dwWidthBytes, &dw);
	if (FAILED(hr)) {
	return hr;
	}
	*pcbSize = dw;
	return S_OK;
	}

*/

BOOL BIT_MASKS_MATCH(VIDEOINFO* pbmi1, VIDEOINFO* pbmi2)
{
	return ((pbmi1.dwBitMasks[iRED] == pbmi2.dwBitMasks[iRED]) && (pbmi1.dwBitMasks[iGREEN] == pbmi2.dwBitMasks[iGREEN]) && (pbmi1.dwBitMasks[iBLUE] == pbmi2.dwBitMasks[iBLUE]));
}

void RESET_MASKS(VIDEOINFO* pbmi)
{
	//ZeroMemory(pbmi.dwBitFields, SIZE_MASKS); see document. this is Microsoft's mistake
	ZeroMemory(pbmi.dwBitMasks.ptr, SIZE_MASKS);
}

void RESET_HEADER(VIDEOINFOHEADER* pbmi)
{
	ZeroMemory(pbmi, SIZE_VIDEOHEADER);
}

void RESET_PALETTE(VIDEOINFO* pbmi)
{
	ZeroMemory(pbmi.bmiColors.ptr, SIZE_PALETTE);
}


BOOL PALETTISED(VIDEOINFOHEADER* pbmi)
{
	return pbmi.bmiHeader.biBitCount <= iPALETTE ? TRUE : FALSE;
}

DWORD PALETTE_ENTRIES(VIDEOINFOHEADER* pbmi)
{
	return (cast(DWORD)1) << pbmi.bmiHeader.biBitCount;
}

BITMAPINFOHEADER* HEADER(VIDEOINFOHEADER* pVideoInfo)
{
	return &pVideoInfo.bmiHeader;
}

struct MPEG1VIDEOINFO {
	VIDEOINFOHEADER hdr;
	DWORD dwStartTimeCode;
	DWORD cbSequenceHeader;
	BYTE[1] bSequenceHeader;
}

enum MAX_SIZE_MPEG1_SEQUENCE_INFO = 140;
LONG SIZE_MPEG1VIDEOINFO(MPEG1VIDEOINFO* pv)
{
	return cast(LONG)MPEG1VIDEOINFO.bSequenceHeader.offsetof + pv.cbSequenceHeader;
}

const(BYTE)* MPEG1_SEQUENCE_INFO(MPEG1VIDEOINFO* pv)
{
	return cast(const(BYTE)*)pv.bSequenceHeader;
}

struct ANALOGVIDEOINFO {
	RECT rcSource;
	RECT rcTarget;
	DWORD dwActiveWidth;
	DWORD dwActiveHeight;
	REFERENCE_TIME AvgTimePerFrame;
}

enum {
	AM_PROPERTY_FRAMESTEP_STEP            = 0x01,
	AM_PROPERTY_FRAMESTEP_CANCEL          = 0x02,
	AM_PROPERTY_FRAMESTEP_CANSTEP         = 0x03,
	AM_PROPERTY_FRAMESTEP_CANSTEPMULTIPLE = 0x04
}
alias int AM_PROPERTY_FRAMESTEP;

struct AM_FRAMESTEP_STEP {
	DWORD dwFramesToStep;
}

}// extern(C)
