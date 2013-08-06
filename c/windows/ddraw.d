/** ddraw.d

Converted from 'ddraw.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.ddraw;


import c.windows.windef;
import c.windows.guiddef;
import c.windows.unknwn;
import c.windows.mmsystem;
import c.windows.winerror;
import c.windows.wingdi;


enum DIRECTDRAW_VERSION = 0x0700;

enum _FACDD = 0x876;
private pure nothrow
HRESULT MAKE_DDHRESULT(WORD code)
{
	return MAKE_HRESULT(1, _FACDD, code);
}

extern(C){

//MAKEFOURCC(ch0, ch1, ch2, ch3)  ((DWORD)(BYTE)(ch0) | ((DWORD)(BYTE)(ch1) << 8) |  ((DWORD)(BYTE)(ch2) << 16) | ((DWORD)(BYTE)(ch3) << 24 ))

enum FOURCC_DXT1 = MAKEFOURCC('D','X','T','1');
enum FOURCC_DXT2 = MAKEFOURCC('D','X','T','2');
enum FOURCC_DXT3 = MAKEFOURCC('D','X','T','3');
enum FOURCC_DXT4 = MAKEFOURCC('D','X','T','4');
enum FOURCC_DXT5 = MAKEFOURCC('D','X','T','5');

mixin DEFINE_GUID!("CLSID_DirectDraw", 0xD7B70EE0, 0x4340, 0x11CF, 0xB0, 0x63, 0x00, 0x20, 0xAF, 0xC2, 0xCD, 0x35);
mixin DEFINE_GUID!("CLSID_DirectDraw7", 0x3c305196, 0x50db, 0x11d3, 0x9c, 0xfe, 0x00, 0xc0, 0x4f, 0xd9, 0x30, 0xc5);
mixin DEFINE_GUID!("CLSID_DirectDrawClipper", 0x593817A0, 0x7DB3, 0x11CF, 0xA2, 0xDE, 0x00, 0xAA, 0x00, 0xb9, 0x33, 0x56);
mixin DEFINE_GUID!("IID_IDirectDraw", 0x6C14DB80, 0xA733, 0x11CE, 0xA5, 0x21, 0x00, 0x20, 0xAF, 0x0B, 0xE5, 0x60);
mixin DEFINE_GUID!("IID_IDirectDraw2", 0xB3A6F3E0, 0x2B43, 0x11CF, 0xA2, 0xDE, 0x00, 0xAA, 0x00, 0xB9, 0x33, 0x56);
mixin DEFINE_GUID!("IID_IDirectDraw4", 0x9c59509a, 0x39bd, 0x11d1, 0x8c, 0x4a, 0x00, 0xc0, 0x4f, 0xd9, 0x30, 0xc5);
mixin DEFINE_GUID!("IID_IDirectDraw7", 0x15e65ec0, 0x3b9c, 0x11d2, 0xb9, 0x2f, 0x00, 0x60, 0x97, 0x97, 0xea, 0x5b);
mixin DEFINE_GUID!("IID_IDirectDrawSurface", 0x6C14DB81, 0xA733, 0x11CE, 0xA5, 0x21, 0x00, 0x20, 0xAF, 0x0B, 0xE5, 0x60);
mixin DEFINE_GUID!("IID_IDirectDrawSurface2", 0x57805885, 0x6eec, 0x11cf, 0x94, 0x41, 0xa8, 0x23, 0x03, 0xc1, 0x0e, 0x27);
mixin DEFINE_GUID!("IID_IDirectDrawSurface3", 0xDA044E00, 0x69B2, 0x11D0, 0xA1, 0xD5, 0x00, 0xAA, 0x00, 0xB8, 0xDF, 0xBB);
mixin DEFINE_GUID!("IID_IDirectDrawSurface4", 0x0B2B8630, 0xAD35, 0x11D0, 0x8E, 0xA6, 0x00, 0x60, 0x97, 0x97, 0xEA, 0x5B);
mixin DEFINE_GUID!("IID_IDirectDrawSurface7", 0x06675a80, 0x3b9b, 0x11d2, 0xb9, 0x2f, 0x00, 0x60, 0x97, 0x97, 0xea, 0x5b);
mixin DEFINE_GUID!("IID_IDirectDrawPalette", 0x6C14DB84, 0xA733, 0x11CE, 0xA5, 0x21, 0x00, 0x20, 0xAF, 0x0B, 0xE5, 0x60);
mixin DEFINE_GUID!("IID_IDirectDrawClipper", 0x6C14DB85, 0xA733, 0x11CE, 0xA5, 0x21, 0x00, 0x20, 0xAF, 0x0B, 0xE5, 0x60);
mixin DEFINE_GUID!("IID_IDirectDrawColorControl", 0x4B9F0EE0, 0x0D7E, 0x11D0, 0x9B, 0x06, 0x00, 0xA0, 0xC9, 0x03, 0xA3, 0xB8);
mixin DEFINE_GUID!("IID_IDirectDrawGammaControl", 0x69C11C3E, 0xB46B, 0x11D1, 0xAD, 0x7A, 0x00, 0xC0, 0x4F, 0xC2, 0x9B, 0x4E);

alias IDirectDraw LPDIRECTDRAW;
alias IDirectDraw2 LPDIRECTDRAW2;
alias IDirectDraw4 LPDIRECTDRAW4;
alias IDirectDraw7 LPDIRECTDRAW7;
alias IDirectDrawSurface LPDIRECTDRAWSURFACE;
alias IDirectDrawSurface2 LPDIRECTDRAWSURFACE2;
alias IDirectDrawSurface3 LPDIRECTDRAWSURFACE3;
alias IDirectDrawSurface4 LPDIRECTDRAWSURFACE4;
alias IDirectDrawSurface7 LPDIRECTDRAWSURFACE7;
alias IDirectDrawPalette LPDIRECTDRAWPALETTE;
alias IDirectDrawClipper LPDIRECTDRAWCLIPPER;
alias IDirectDrawColorControl LPDIRECTDRAWCOLORCONTROL;
alias IDirectDrawGammaControl LPDIRECTDRAWGAMMACONTROL;

//alias _DDFXROP* LPDDFXROP;
alias DDSURFACEDESC* LPDDSURFACEDESC;
alias DDSURFACEDESC2* LPDDSURFACEDESC2;
alias DDCOLORCONTROL* LPDDCOLORCONTROL;

alias extern(Windows) BOOL function(GUID*, LPSTR, LPSTR, LPVOID) LPDDENUMCALLBACKA;
alias extern(Windows) BOOL function(GUID*, LPWSTR, LPWSTR, LPVOID) LPDDENUMCALLBACKW;
extern extern(Windows) HRESULT DirectDrawEnumerateW(LPDDENUMCALLBACKW lpCallback, LPVOID lpContext);
extern extern(Windows) HRESULT DirectDrawEnumerateA(LPDDENUMCALLBACKA lpCallback, LPVOID lpContext);

alias extern(Windows) BOOL function(GUID*, LPSTR, LPSTR, LPVOID, HMONITOR) LPDDENUMCALLBACKEXA;
alias extern(Windows) BOOL function(GUID*, LPWSTR, LPWSTR, LPVOID, HMONITOR) LPDDENUMCALLBACKEXW;
extern extern(Windows) HRESULT DirectDrawEnumerateExW(LPDDENUMCALLBACKEXW lpCallback, LPVOID lpContext, DWORD dwFlags);
extern extern(Windows) HRESULT DirectDrawEnumerateExA(LPDDENUMCALLBACKEXA lpCallback, LPVOID lpContext, DWORD dwFlags);
alias extern(Windows) HRESULT function( LPDDENUMCALLBACKEXA lpCallback, LPVOID lpContext, DWORD dwFlags) LPDIRECTDRAWENUMERATEEXA;
alias extern(Windows) HRESULT function( LPDDENUMCALLBACKEXW lpCallback, LPVOID lpContext, DWORD dwFlags) LPDIRECTDRAWENUMERATEEXW;

version(UNICODE){
	alias LPDDENUMCALLBACKW LPDDENUMCALLBACK;
	alias DirectDrawEnumerateW DirectDrawEnumerate;
	alias LPDDENUMCALLBACKEXW LPDDENUMCALLBACKEX;
	alias LPDIRECTDRAWENUMERATEEXW LPDIRECTDRAWENUMERATEEX;
	alias DirectDrawEnumerateExW DirectDrawEnumerateEx;
}else{
	alias LPDDENUMCALLBACKA LPDDENUMCALLBACK;
	alias DirectDrawEnumerateA DirectDrawEnumerate;
	alias LPDDENUMCALLBACKEXA LPDDENUMCALLBACKEX;
	alias LPDIRECTDRAWENUMERATEEXA LPDIRECTDRAWENUMERATEEX;
	alias DirectDrawEnumerateExA DirectDrawEnumerateEx;
}
extern extern(Windows) HRESULT DirectDrawCreate(GUID* lpGUID, LPDIRECTDRAW* lplpDD, IUnknown  pUnkOuter);
extern extern(Windows) HRESULT DirectDrawCreateEx(GUID* lpGuid, LPVOID* lplpDD, REFIID iid, IUnknown pUnkOuter);
extern extern(Windows) HRESULT DirectDrawCreateClipper(DWORD dwFlags, LPDIRECTDRAWCLIPPER* lplpDDClipper, IUnknown  pUnkOuter);


enum {
	DDENUM_ATTACHEDSECONDARYDEVICES = 0x00000001,
	DDENUM_DETACHEDSECONDARYDEVICES = 0x00000002,
	DDENUM_NONDISPLAYDEVICES        = 0x00000004,
}

const char* REGSTR_KEY_DDHW_DESCRIPTION = "Description";
const char* REGSTR_KEY_DDHW_DRIVERNAME = "DriverName";
const char* REGSTR_PATH_DDHW = "Hardware\\DirectDrawDrivers";

enum {
	DDCREATE_HARDWAREONLY  = 0x00000001,
	DDCREATE_EMULATIONONLY = 0x00000002,
}

alias extern(Windows) HRESULT function(LPDDSURFACEDESC, LPVOID) LPDDENUMMODESCALLBACK;
alias extern(Windows) HRESULT function(LPDDSURFACEDESC2, LPVOID) LPDDENUMMODESCALLBACK2;
alias extern(Windows) HRESULT function(LPDIRECTDRAWSURFACE, LPDDSURFACEDESC, LPVOID) LPDDENUMSURFACESCALLBACK;
alias extern(Windows) HRESULT function(LPDIRECTDRAWSURFACE4, LPDDSURFACEDESC2, LPVOID) LPDDENUMSURFACESCALLBACK2;
alias extern(Windows) HRESULT function(LPDIRECTDRAWSURFACE7, LPDDSURFACEDESC2, LPVOID) LPDDENUMSURFACESCALLBACK7;

struct DDARGB {
	BYTE blue;
	BYTE green;
	BYTE red;
	BYTE alpha;
}
alias DDARGB* LPDDARGB;

struct DDRGBA {
	BYTE red;
	BYTE green;
	BYTE blue;
	BYTE alpha;
}
alias DDRGBA* LPDDRGBA;

struct DDCOLORKEY {
	DWORD dwColorSpaceLowValue;
	DWORD dwColorSpaceHighValue;
}
alias DDCOLORKEY* LPDDCOLORKEY;

struct DDBLTFX {
	DWORD dwSize;
	DWORD dwDDFX;
	DWORD dwROP;
	DWORD dwDDROP;
	DWORD dwRotationAngle;
	DWORD dwZBufferOpCode;
	DWORD dwZBufferLow;
	DWORD dwZBufferHigh;
	DWORD dwZBufferBaseDest;
	DWORD dwZDestConstBitDepth;
	union {
		DWORD dwZDestConst;
		LPDIRECTDRAWSURFACE lpDDSZBufferDest;
	}
	DWORD dwZSrcConstBitDepth;
	union {
		DWORD dwZSrcConst;
		LPDIRECTDRAWSURFACE lpDDSZBufferSrc;
	}
	DWORD dwAlphaEdgeBlendBitDepth;
	DWORD dwAlphaEdgeBlend;
	DWORD dwReserved;
	DWORD dwAlphaDestConstBitDepth;
	union {
		DWORD dwAlphaDestConst;
		LPDIRECTDRAWSURFACE lpDDSAlphaDest;
	}
	DWORD dwAlphaSrcConstBitDepth;
	union {
		DWORD dwAlphaSrcConst;
		LPDIRECTDRAWSURFACE lpDDSAlphaSrc;
	}
	union {
		DWORD dwFillColor;
		DWORD dwFillDepth;
		DWORD dwFillPixel;
		LPDIRECTDRAWSURFACE lpDDSPattern;
	}
	DDCOLORKEY ddckDestColorkey;
	DDCOLORKEY ddckSrcColorkey;
}
alias DDBLTFX* LPDDBLTFX;

struct DDSCAPS {
	DWORD dwCaps;
}
alias DDSCAPS* LPDDSCAPS;

struct DDOSCAPS {
	DWORD dwCaps;
}
alias DDOSCAPS* LPDDOSCAPS;

struct DDSCAPSEX {
	DWORD dwCaps2;
	DWORD dwCaps3;
	union {
		DWORD dwCaps4;
		DWORD dwVolumeDepth;
	}
}
alias DDSCAPSEX* LPDDSCAPSEX;

struct DDSCAPS2 {
	DWORD dwCaps;
	DWORD dwCaps2;
	DWORD dwCaps3;
	union {
		DWORD dwCaps4;
		DWORD dwVolumeDepth;
	}
}
alias DDSCAPS2* LPDDSCAPS2;

enum DD_ROP_SPACE = 256/32;

struct DDCAPS_DX1 {
	DWORD dwSize;
	DWORD dwCaps;
	DWORD dwCaps2;
	DWORD dwCKeyCaps;
	DWORD dwFXCaps;
	DWORD dwFXAlphaCaps;
	DWORD dwPalCaps;
	DWORD dwSVCaps;
	DWORD dwAlphaBltConstBitDepths;
	DWORD dwAlphaBltPixelBitDepths;
	DWORD dwAlphaBltSurfaceBitDepths;
	DWORD dwAlphaOverlayConstBitDepths;
	DWORD dwAlphaOverlayPixelBitDepths;
	DWORD dwAlphaOverlaySurfaceBitDepths;
	DWORD dwZBufferBitDepths;
	DWORD dwVidMemTotal;
	DWORD dwVidMemFree;
	DWORD dwMaxVisibleOverlays;
	DWORD dwCurrVisibleOverlays;
	DWORD dwNumFourCCCodes;
	DWORD dwAlignBoundarySrc;
	DWORD dwAlignSizeSrc;
	DWORD dwAlignBoundaryDest;
	DWORD dwAlignSizeDest;
	DWORD dwAlignStrideAlign;
	DWORD[DD_ROP_SPACE] dwRops;
	DDSCAPS ddsCaps;
	DWORD dwMinOverlayStretch;
	DWORD dwMaxOverlayStretch;
	DWORD dwMinLiveVideoStretch;
	DWORD dwMaxLiveVideoStretch;
	DWORD dwMinHwCodecStretch;
	DWORD dwMaxHwCodecStretch;
	DWORD dwReserved1;
	DWORD dwReserved2;
	DWORD dwReserved3;
}
alias DDCAPS_DX1* LPDDCAPS_DX1;

struct DDCAPS_DX3 {
	DWORD dwSize;
	DWORD dwCaps;
	DWORD dwCaps2;
	DWORD dwCKeyCaps;
	DWORD dwFXCaps;
	DWORD dwFXAlphaCaps;
	DWORD dwPalCaps;
	DWORD dwSVCaps;
	DWORD dwAlphaBltConstBitDepths;
	DWORD dwAlphaBltPixelBitDepths;
	DWORD dwAlphaBltSurfaceBitDepths;
	DWORD dwAlphaOverlayConstBitDepths;
	DWORD dwAlphaOverlayPixelBitDepths;
	DWORD dwAlphaOverlaySurfaceBitDepths;
	DWORD dwZBufferBitDepths;
	DWORD dwVidMemTotal;
	DWORD dwVidMemFree;
	DWORD dwMaxVisibleOverlays;
	DWORD dwCurrVisibleOverlays;
	DWORD dwNumFourCCCodes;
	DWORD dwAlignBoundarySrc;
	DWORD dwAlignSizeSrc;
	DWORD dwAlignBoundaryDest;
	DWORD dwAlignSizeDest;
	DWORD dwAlignStrideAlign;
	DWORD[DD_ROP_SPACE] dwRops;
	DDSCAPS ddsCaps;
	DWORD dwMinOverlayStretch;
	DWORD dwMaxOverlayStretch;
	DWORD dwMinLiveVideoStretch;
	DWORD dwMaxLiveVideoStretch;
	DWORD dwMinHwCodecStretch;
	DWORD dwMaxHwCodecStretch;
	DWORD dwReserved1;
	DWORD dwReserved2;
	DWORD dwReserved3;
	DWORD dwSVBCaps;
	DWORD dwSVBCKeyCaps;
	DWORD dwSVBFXCaps;
	DWORD[DD_ROP_SPACE] dwSVBRops;
	DWORD dwVSBCaps;
	DWORD dwVSBCKeyCaps;
	DWORD dwVSBFXCaps;
	DWORD[DD_ROP_SPACE] dwVSBRops;
	DWORD dwSSBCaps;
	DWORD dwSSBCKeyCaps;
	DWORD dwSSBFXCaps;
	DWORD[DD_ROP_SPACE] dwSSBRops;
	DWORD dwReserved4;
	DWORD dwReserved5;
	DWORD dwReserved6;
}
alias DDCAPS_DX3* LPDDCAPS_DX3;

struct DDCAPS_DX5 {
	DWORD dwSize;
	DWORD dwCaps;
	DWORD dwCaps2;
	DWORD dwCKeyCaps;
	DWORD dwFXCaps;
	DWORD dwFXAlphaCaps;
	DWORD dwPalCaps;
	DWORD dwSVCaps;
	DWORD dwAlphaBltConstBitDepths;
	DWORD dwAlphaBltPixelBitDepths;
	DWORD dwAlphaBltSurfaceBitDepths;
	DWORD dwAlphaOverlayConstBitDepths;
	DWORD dwAlphaOverlayPixelBitDepths;
	DWORD dwAlphaOverlaySurfaceBitDepths;
	DWORD dwZBufferBitDepths;
	DWORD dwVidMemTotal;
	DWORD dwVidMemFree;
	DWORD dwMaxVisibleOverlays;
	DWORD dwCurrVisibleOverlays;
	DWORD dwNumFourCCCodes;
	DWORD dwAlignBoundarySrc;
	DWORD dwAlignSizeSrc;
	DWORD dwAlignBoundaryDest;
	DWORD dwAlignSizeDest;
	DWORD dwAlignStrideAlign;
	DWORD dwRops[DD_ROP_SPACE];
	DDSCAPS ddsCaps;
	DWORD dwMinOverlayStretch;
	DWORD dwMaxOverlayStretch;
	DWORD dwMinLiveVideoStretch;
	DWORD dwMaxLiveVideoStretch;
	DWORD dwMinHwCodecStretch;
	DWORD dwMaxHwCodecStretch;
	DWORD dwReserved1;
	DWORD dwReserved2;
	DWORD dwReserved3;
	DWORD dwSVBCaps;
	DWORD dwSVBCKeyCaps;
	DWORD dwSVBFXCaps;
	DWORD[DD_ROP_SPACE] dwSVBRops;
	DWORD dwVSBCaps;
	DWORD dwVSBCKeyCaps;
	DWORD dwVSBFXCaps;
	DWORD[DD_ROP_SPACE] dwVSBRops;
	DWORD dwSSBCaps;
	DWORD dwSSBCKeyCaps;
	DWORD dwSSBFXCaps;
	DWORD[DD_ROP_SPACE] dwSSBRops;
	DWORD dwMaxVideoPorts;
	DWORD dwCurrVideoPorts;
	DWORD dwSVBCaps2;
	DWORD dwNLVBCaps;
	DWORD dwNLVBCaps2;
	DWORD dwNLVBCKeyCaps;
	DWORD dwNLVBFXCaps;
	DWORD[DD_ROP_SPACE] dwNLVBRops;
}
alias DDCAPS_DX5* LPDDCAPS_DX5;

struct DDCAPS_DX6 {
	DWORD dwSize;
	DWORD dwCaps;
	DWORD dwCaps2;
	DWORD dwCKeyCaps;
	DWORD dwFXCaps;
	DWORD dwFXAlphaCaps;
	DWORD dwPalCaps;
	DWORD dwSVCaps;
	DWORD dwAlphaBltConstBitDepths;
	DWORD dwAlphaBltPixelBitDepths;
	DWORD dwAlphaBltSurfaceBitDepths;
	DWORD dwAlphaOverlayConstBitDepths;
	DWORD dwAlphaOverlayPixelBitDepths;
	DWORD dwAlphaOverlaySurfaceBitDepths;
	DWORD dwZBufferBitDepths;
	DWORD dwVidMemTotal;
	DWORD dwVidMemFree;
	DWORD dwMaxVisibleOverlays;
	DWORD dwCurrVisibleOverlays;
	DWORD dwNumFourCCCodes;
	DWORD dwAlignBoundarySrc;
	DWORD dwAlignSizeSrc;
	DWORD dwAlignBoundaryDest;
	DWORD dwAlignSizeDest;
	DWORD dwAlignStrideAlign;
	DWORD[DD_ROP_SPACE] dwRops;
	DDSCAPS ddsOldCaps;
	DWORD dwMinOverlayStretch;
	DWORD dwMaxOverlayStretch;
	DWORD dwMinLiveVideoStretch;
	DWORD dwMaxLiveVideoStretch;
	DWORD dwMinHwCodecStretch;
	DWORD dwMaxHwCodecStretch;
	DWORD dwReserved1;
	DWORD dwReserved2;
	DWORD dwReserved3;
	DWORD dwSVBCaps;
	DWORD dwSVBCKeyCaps;
	DWORD dwSVBFXCaps;
	DWORD[DD_ROP_SPACE] dwSVBRops;
	DWORD dwVSBCaps;
	DWORD dwVSBCKeyCaps;
	DWORD dwVSBFXCaps;
	DWORD[DD_ROP_SPACE] dwVSBRops;
	DWORD dwSSBCaps;
	DWORD dwSSBCKeyCaps;
	DWORD dwSSBFXCaps;
	DWORD[DD_ROP_SPACE] dwSSBRops;
	DWORD dwMaxVideoPorts;
	DWORD dwCurrVideoPorts;
	DWORD dwSVBCaps2;
	DWORD dwNLVBCaps;
	DWORD dwNLVBCaps2;
	DWORD dwNLVBCKeyCaps;
	DWORD dwNLVBFXCaps;
	DWORD[DD_ROP_SPACE] dwNLVBRops;
	DDSCAPS2 ddsCaps;
}
alias DDCAPS_DX6* LPDDCAPS_DX6;

struct DDCAPS_DX7 {
	DWORD dwSize;
	DWORD dwCaps;
	DWORD dwCaps2;
	DWORD dwCKeyCaps;
	DWORD dwFXCaps;
	DWORD dwFXAlphaCaps;
	DWORD dwPalCaps;
	DWORD dwSVCaps;
	DWORD dwAlphaBltConstBitDepths;
	DWORD dwAlphaBltPixelBitDepths;
	DWORD dwAlphaBltSurfaceBitDepths;
	DWORD dwAlphaOverlayConstBitDepths;
	DWORD dwAlphaOverlayPixelBitDepths;
	DWORD dwAlphaOverlaySurfaceBitDepths;
	DWORD dwZBufferBitDepths;
	DWORD dwVidMemTotal;
	DWORD dwVidMemFree;
	DWORD dwMaxVisibleOverlays;
	DWORD dwCurrVisibleOverlays;
	DWORD dwNumFourCCCodes;
	DWORD dwAlignBoundarySrc;
	DWORD dwAlignSizeSrc;
	DWORD dwAlignBoundaryDest;
	DWORD dwAlignSizeDest;
	DWORD dwAlignStrideAlign;
	DWORD[DD_ROP_SPACE] dwRops;
	DDSCAPS ddsOldCaps;
	DWORD dwMinOverlayStretch;
	DWORD dwMaxOverlayStretch;
	DWORD dwMinLiveVideoStretch;
	DWORD dwMaxLiveVideoStretch;
	DWORD dwMinHwCodecStretch;
	DWORD dwMaxHwCodecStretch;
	DWORD dwReserved1;
	DWORD dwReserved2;
	DWORD dwReserved3;
	DWORD dwSVBCaps;
	DWORD dwSVBCKeyCaps;
	DWORD dwSVBFXCaps;
	DWORD[DD_ROP_SPACE] dwSVBRops;
	DWORD dwVSBCaps;
	DWORD dwVSBCKeyCaps;
	DWORD dwVSBFXCaps;
	DWORD[DD_ROP_SPACE] dwVSBRops;
	DWORD dwSSBCaps;
	DWORD dwSSBCKeyCaps;
	DWORD dwSSBFXCaps;
	DWORD[DD_ROP_SPACE] dwSSBRops;
	DWORD dwMaxVideoPorts;
	DWORD dwCurrVideoPorts;
	DWORD dwSVBCaps2;
	DWORD dwNLVBCaps;
	DWORD dwNLVBCaps2;
	DWORD dwNLVBCKeyCaps;
	DWORD dwNLVBFXCaps;
	DWORD[DD_ROP_SPACE] dwNLVBRops;
	DDSCAPS2 ddsCaps;
}
alias DDCAPS_DX7* LPDDCAPS_DX7;

alias DDCAPS_DX7 DDCAPS;

alias DDCAPS* LPDDCAPS;

struct DDPIXELFORMAT {
	DWORD dwSize;
	DWORD dwFlags;
	DWORD dwFourCC;
	union {
		DWORD dwRGBBitCount;
		DWORD dwYUVBitCount;
		DWORD dwZBufferBitDepth;
		DWORD dwAlphaBitDepth;
		DWORD dwLuminanceBitCount;
		DWORD dwBumpBitCount;
		DWORD dwPrivateFormatBitCount;
	}
	union {
		DWORD dwRBitMask;
		DWORD dwYBitMask;
		DWORD dwStencilBitDepth;
		DWORD dwLuminanceBitMask;
		DWORD dwBumpDuBitMask;
		DWORD dwOperations;
	}
	union {
		DWORD dwGBitMask;
		DWORD dwUBitMask;
		DWORD dwZBitMask;
		DWORD dwBumpDvBitMask;
		struct {
			WORD wFlipMSTypes;
			WORD wBltMSTypes;
		}
	}
	union {
		DWORD dwBBitMask;
		DWORD dwVBitMask;
		DWORD dwStencilBitMask;
		DWORD dwBumpLuminanceBitMask;
	}
	union {
		DWORD dwRGBAlphaBitMask;
		DWORD dwYUVAlphaBitMask;
		DWORD dwLuminanceAlphaBitMask;
		DWORD dwRGBZBitMask;
		DWORD dwYUVZBitMask;
	}
}
alias DDPIXELFORMAT* LPDDPIXELFORMAT;

struct DDOVERLAYFX {
	DWORD dwSize;
	DWORD dwAlphaEdgeBlendBitDepth;
	DWORD dwAlphaEdgeBlend;
	DWORD dwReserved;
	DWORD dwAlphaDestConstBitDepth;
	union {
		DWORD dwAlphaDestConst;
		LPDIRECTDRAWSURFACE lpDDSAlphaDest;
	}
	DWORD dwAlphaSrcConstBitDepth;
	union {
		DWORD dwAlphaSrcConst;
		LPDIRECTDRAWSURFACE lpDDSAlphaSrc;
	}
	DDCOLORKEY dckDestColorkey;
	DDCOLORKEY dckSrcColorkey;
	DWORD dwDDFX;
	DWORD dwFlags;
}
alias DDOVERLAYFX* LPDDOVERLAYFX;

struct DDBLTBATCH {
	LPRECT lprDest;
	LPDIRECTDRAWSURFACE lpDDSSrc;
	LPRECT lprSrc;
	DWORD dwFlags;
	LPDDBLTFX lpDDBltFx;
}
alias DDBLTBATCH* LPDDBLTBATCH;

struct DDGAMMARAMP {
	WORD[256] red;
	WORD[256] green;
	WORD[256] blue;
}
alias DDGAMMARAMP* LPDDGAMMARAMP;

enum MAX_DDDEVICEID_STRING = 512;

struct DDDEVICEIDENTIFIER {
	char[MAX_DDDEVICEID_STRING] szDriver;
	char[MAX_DDDEVICEID_STRING] szDescription;
	LARGE_INTEGER liDriverVersion;
	DWORD dwVendorId;
	DWORD dwDeviceId;
	DWORD dwSubSysId;
	DWORD dwRevision;
	GUID guidDeviceIdentifier;
}
alias DDDEVICEIDENTIFIER* LPDDDEVICEIDENTIFIER;

struct DDDEVICEIDENTIFIER2 {
	char[MAX_DDDEVICEID_STRING] szDriver;
	char[MAX_DDDEVICEID_STRING] szDescription;
	LARGE_INTEGER liDriverVersion;
	DWORD dwVendorId;
	DWORD dwDeviceId;
	DWORD dwSubSysId;
	DWORD dwRevision;
	GUID guidDeviceIdentifier;
	DWORD dwWHQLLevel;
}
alias DDDEVICEIDENTIFIER2* LPDDDEVICEIDENTIFIER2;

enum DDGDI_GETHOSTIDENTIFIER = 0x00000001;

//	GET_WHQL_YEAR( dwWHQLLevel )  ( (dwWHQLLevel) / 0x10000 )
//	GET_WHQL_MONTH( dwWHQLLevel )  ( ( (dwWHQLLevel) / 0x100 ) & 0x00ff )
//	GET_WHQL_DAY( dwWHQLLevel )  ( (dwWHQLLevel) & 0xff )

alias extern(Windows) DWORD function(LPDIRECTDRAWCLIPPER lpDDClipper, HWND hWnd, DWORD code, LPVOID lpContext) LPCLIPPERCALLBACK;
alias extern(Windows) DWORD function(DWORD) LPSURFACESTREAMINGCALLBACK;

interface IDirectDraw : IUnknown {
public extern(Windows):
	HRESULT Compact();
	HRESULT CreateClipper(DWORD, LPDIRECTDRAWCLIPPER*, IUnknown);
	HRESULT CreatePalette(DWORD, LPPALETTEENTRY, LPDIRECTDRAWPALETTE*, IUnknown);
	HRESULT CreateSurface(LPDDSURFACEDESC, LPDIRECTDRAWSURFACE*, IUnknown);
	HRESULT DuplicateSurface(LPDIRECTDRAWSURFACE, LPDIRECTDRAWSURFACE*);
	HRESULT EnumDisplayModes(DWORD, LPDDSURFACEDESC, LPVOID, LPDDENUMMODESCALLBACK);
	HRESULT EnumSurfaces(DWORD, LPDDSURFACEDESC, LPVOID,LPDDENUMSURFACESCALLBACK);
	HRESULT FlipToGDISurface();
	HRESULT GetCaps(LPDDCAPS, LPDDCAPS);
	HRESULT GetDisplayMode(LPDDSURFACEDESC);
	HRESULT GetFourCCCodes(LPDWORD, LPDWORD);
	HRESULT GetGDISurface(LPDIRECTDRAWSURFACE*);
	HRESULT GetMonitorFrequency(LPDWORD);
	HRESULT GetScanLine(LPDWORD);
	HRESULT GetVerticalBlankStatus(LPBOOL);
	HRESULT Initialize(GUID*);
	HRESULT RestoreDisplayMode();
	HRESULT SetCooperativeLevel(HWND, DWORD);
	HRESULT SetDisplayMode(DWORD, DWORD, DWORD);
	HRESULT WaitForVerticalBlank(DWORD, HANDLE );
}

interface IDirectDraw2 : IUnknown {
public extern(Windows):
	HRESULT Compact();
	HRESULT CreateClipper(DWORD, LPDIRECTDRAWCLIPPER*, IUnknown);
	HRESULT CreatePalette(DWORD, LPPALETTEENTRY, LPDIRECTDRAWPALETTE*, IUnknown);
	HRESULT CreateSurface(LPDDSURFACEDESC, LPDIRECTDRAWSURFACE*, IUnknown);
	HRESULT DuplicateSurface(LPDIRECTDRAWSURFACE, LPDIRECTDRAWSURFACE*);
	HRESULT EnumDisplayModes(DWORD, LPDDSURFACEDESC, LPVOID, LPDDENUMMODESCALLBACK);
	HRESULT EnumSurfaces(DWORD, LPDDSURFACEDESC, LPVOID, LPDDENUMSURFACESCALLBACK);
	HRESULT FlipToGDISurface();
	HRESULT GetCaps(LPDDCAPS, LPDDCAPS);
	HRESULT GetDisplayMode(LPDDSURFACEDESC);
	HRESULT GetFourCCCodes(LPDWORD, LPDWORD);
	HRESULT GetGDISurface(LPDIRECTDRAWSURFACE*);
	HRESULT GetMonitorFrequency(LPDWORD);
	HRESULT GetScanLine(LPDWORD);
	HRESULT GetVerticalBlankStatus(LPBOOL);
	HRESULT Initialize(GUID*);
	HRESULT RestoreDisplayMode();
	HRESULT SetCooperativeLevel(HWND, DWORD);
	HRESULT SetDisplayMode(DWORD, DWORD,DWORD, DWORD, DWORD);
	HRESULT WaitForVerticalBlank(DWORD, HANDLE);
	HRESULT GetAvailableVidMem(LPDDSCAPS, LPDWORD, LPDWORD);
}

interface IDirectDraw4 : IUnknown {
public extern(Windows):
	HRESULT Compact();
	HRESULT CreateClipper(DWORD, LPDIRECTDRAWCLIPPER*, IUnknown);
	HRESULT CreatePalette(DWORD, LPPALETTEENTRY, LPDIRECTDRAWPALETTE*, IUnknown);
	HRESULT CreateSurface(LPDDSURFACEDESC2, LPDIRECTDRAWSURFACE4*, IUnknown);
	HRESULT DuplicateSurface(LPDIRECTDRAWSURFACE4, LPDIRECTDRAWSURFACE4*);
	HRESULT EnumDisplayModes(DWORD, LPDDSURFACEDESC2, LPVOID, LPDDENUMMODESCALLBACK2);
	HRESULT EnumSurfaces(DWORD, LPDDSURFACEDESC2, LPVOID, LPDDENUMSURFACESCALLBACK2);
	HRESULT FlipToGDISurface();
	HRESULT GetCaps(LPDDCAPS, LPDDCAPS);
	HRESULT GetDisplayMode(LPDDSURFACEDESC2);
	HRESULT GetFourCCCodes(LPDWORD, LPDWORD);
	HRESULT GetGDISurface(LPDIRECTDRAWSURFACE4*);
	HRESULT GetMonitorFrequency(LPDWORD);
	HRESULT GetScanLine(LPDWORD);
	HRESULT GetVerticalBlankStatus(LPBOOL);
	HRESULT Initialize(GUID*);
	HRESULT RestoreDisplayMode();
	HRESULT SetCooperativeLevel(HWND, DWORD);
	HRESULT SetDisplayMode(DWORD, DWORD, DWORD, DWORD, DWORD);
	HRESULT WaitForVerticalBlank(DWORD, HANDLE);
	HRESULT GetAvailableVidMem(LPDDSCAPS2, LPDWORD, LPDWORD);
	HRESULT GetSurfaceFromDC(HDC, LPDIRECTDRAWSURFACE4*);
	HRESULT RestoreAllSurfaces();
	HRESULT TestCooperativeLevel();
	HRESULT GetDeviceIdentifier(LPDDDEVICEIDENTIFIER, DWORD);
}

interface IDirectDraw7 : IUnknown {
public extern(Windows):
	HRESULT Compact();
	HRESULT CreateClipper(DWORD, LPDIRECTDRAWCLIPPER*, IUnknown);
	HRESULT CreatePalette(DWORD, LPPALETTEENTRY, LPDIRECTDRAWPALETTE*, IUnknown);
	HRESULT CreateSurface(LPDDSURFACEDESC2, LPDIRECTDRAWSURFACE7*, IUnknown);
	HRESULT DuplicateSurface(LPDIRECTDRAWSURFACE7, LPDIRECTDRAWSURFACE7*);
	HRESULT EnumDisplayModes(DWORD, LPDDSURFACEDESC2, LPVOID, LPDDENUMMODESCALLBACK2);
	HRESULT EnumSurfaces(DWORD, LPDDSURFACEDESC2, LPVOID, LPDDENUMSURFACESCALLBACK7);
	HRESULT FlipToGDISurface();
	HRESULT GetCaps(LPDDCAPS, LPDDCAPS);
	HRESULT GetDisplayMode(LPDDSURFACEDESC2);
	HRESULT GetFourCCCodes(LPDWORD, LPDWORD);
	HRESULT GetGDISurface(LPDIRECTDRAWSURFACE7  *);
	HRESULT GetMonitorFrequency(LPDWORD);
	HRESULT GetScanLine(LPDWORD);
	HRESULT GetVerticalBlankStatus(LPBOOL);
	HRESULT Initialize(GUID*);
	HRESULT RestoreDisplayMode();
	HRESULT SetCooperativeLevel(HWND, DWORD);
	HRESULT SetDisplayMode(DWORD, DWORD, DWORD, DWORD, DWORD);
	HRESULT WaitForVerticalBlank(DWORD, HANDLE);
	HRESULT GetAvailableVidMem(LPDDSCAPS2, LPDWORD, LPDWORD);
	HRESULT GetSurfaceFromDC(HDC, LPDIRECTDRAWSURFACE7*);
	HRESULT RestoreAllSurfaces();
	HRESULT TestCooperativeLevel();
	HRESULT GetDeviceIdentifier(LPDDDEVICEIDENTIFIER2, DWORD);
	HRESULT StartModeTest(LPSIZE, DWORD, DWORD);
	HRESULT EvaluateMode(DWORD, DWORD*);
}

interface IDirectDrawPalette : IUnknown {
public extern(Windows):
	HRESULT GetCaps(LPDWORD);
	HRESULT GetEntries(DWORD, DWORD, DWORD, LPPALETTEENTRY);
	HRESULT Initialize(LPDIRECTDRAW, DWORD, LPPALETTEENTRY);
	HRESULT SetEntries(DWORD, DWORD, DWORD, LPPALETTEENTRY);
}

interface IDirectDrawClipper : IUnknown {
public extern(Windows):
	HRESULT GetClipList(LPRECT, LPRGNDATA, LPDWORD);
	HRESULT GetHWnd(HWND*);
	HRESULT Initialize(LPDIRECTDRAW, DWORD);
	HRESULT IsClipListChanged(BOOL*);
	HRESULT SetClipList(LPRGNDATA, DWORD);
	HRESULT SetHWnd(DWORD, HWND);
}

interface IDirectDrawSurface : IUnknown {
public extern(Windows):
	HRESULT AddAttachedSurface(LPDIRECTDRAWSURFACE);
	HRESULT AddOverlayDirtyRect(LPRECT);
	HRESULT Blt(LPRECT, LPDIRECTDRAWSURFACE, LPRECT,DWORD, LPDDBLTFX);
	HRESULT BltBatch(LPDDBLTBATCH, DWORD, DWORD );
	HRESULT BltFast(DWORD, DWORD, LPDIRECTDRAWSURFACE, LPRECT, DWORD);
	HRESULT DeleteAttachedSurface(DWORD, LPDIRECTDRAWSURFACE);
	HRESULT EnumAttachedSurfaces(LPVOID, LPDDENUMSURFACESCALLBACK);
	HRESULT EnumOverlayZOrders(DWORD, LPVOID,LPDDENUMSURFACESCALLBACK);
	HRESULT Flip(LPDIRECTDRAWSURFACE, DWORD);
	HRESULT GetAttachedSurface(LPDDSCAPS, LPDIRECTDRAWSURFACE*);
	HRESULT GetBltStatus(DWORD);
	HRESULT GetCaps(LPDDSCAPS);
	HRESULT GetClipper(LPDIRECTDRAWCLIPPER*);
	HRESULT GetColorKey(DWORD, LPDDCOLORKEY);
	HRESULT GetDC(HDC*);
	HRESULT GetFlipStatus(DWORD);
	HRESULT GetOverlayPosition(LPLONG, LPLONG);
	HRESULT GetPalette(LPDIRECTDRAWPALETTE*);
	HRESULT GetPixelFormat(LPDDPIXELFORMAT);
	HRESULT GetSurfaceDesc(LPDDSURFACEDESC);
	HRESULT Initialize(LPDIRECTDRAW, LPDDSURFACEDESC);
	HRESULT IsLost();
	HRESULT Lock(LPRECT, LPDDSURFACEDESC, DWORD, HANDLE);
	HRESULT ReleaseDC(HDC);
	HRESULT Restore();
	HRESULT SetClipper(LPDIRECTDRAWCLIPPER);
	HRESULT SetColorKey(DWORD, LPDDCOLORKEY);
	HRESULT SetOverlayPosition(LONG, LONG );
	HRESULT SetPalette(LPDIRECTDRAWPALETTE);
	HRESULT Unlock(LPVOID);
	HRESULT UpdateOverlay(LPRECT, LPDIRECTDRAWSURFACE, LPRECT, DWORD, LPDDOVERLAYFX);
	HRESULT UpdateOverlayDisplay(DWORD);
	HRESULT UpdateOverlayZOrder(DWORD, LPDIRECTDRAWSURFACE);
}

interface IDirectDrawSurface2 : IUnknown {
public extern(Windows):
	HRESULT AddAttachedSurface(LPDIRECTDRAWSURFACE2);
	HRESULT AddOverlayDirtyRect(LPRECT);
	HRESULT Blt(LPRECT, LPDIRECTDRAWSURFACE2, LPRECT, DWORD, LPDDBLTFX);
	HRESULT BltBatch(LPDDBLTBATCH, DWORD, DWORD);
	HRESULT BltFast(DWORD, DWORD, LPDIRECTDRAWSURFACE2, LPRECT, DWORD);
	HRESULT DeleteAttachedSurface(DWORD, LPDIRECTDRAWSURFACE2);
	HRESULT EnumAttachedSurfaces(LPVOID, LPDDENUMSURFACESCALLBACK);
	HRESULT EnumOverlayZOrders(DWORD, LPVOID, LPDDENUMSURFACESCALLBACK);
	HRESULT Flip(LPDIRECTDRAWSURFACE2, DWORD);
	HRESULT GetAttachedSurface(LPDDSCAPS, LPDIRECTDRAWSURFACE2*);
	HRESULT GetBltStatus(DWORD);
	HRESULT GetCaps(LPDDSCAPS);
	HRESULT GetClipper(LPDIRECTDRAWCLIPPER*);
	HRESULT GetColorKey(DWORD, LPDDCOLORKEY);
	HRESULT GetDC(HDC*);
	HRESULT GetFlipStatus(DWORD);
	HRESULT GetOverlayPosition(LPLONG, LPLONG);
	HRESULT GetPalette(LPDIRECTDRAWPALETTE*);
	HRESULT GetPixelFormat(LPDDPIXELFORMAT);
	HRESULT GetSurfaceDesc(LPDDSURFACEDESC);
	HRESULT Initialize(LPDIRECTDRAW, LPDDSURFACEDESC);
	HRESULT IsLost();
	HRESULT Lock(LPRECT,LPDDSURFACEDESC,DWORD,HANDLE);
	HRESULT ReleaseDC(HDC);
	HRESULT Restore();
	HRESULT SetClipper(LPDIRECTDRAWCLIPPER);
	HRESULT SetColorKey(DWORD, LPDDCOLORKEY);
	HRESULT SetOverlayPosition(LONG, LONG);
	HRESULT SetPalette(LPDIRECTDRAWPALETTE);
	HRESULT Unlock(LPVOID);
	HRESULT UpdateOverlay(LPRECT, LPDIRECTDRAWSURFACE2,LPRECT,DWORD, LPDDOVERLAYFX);
	HRESULT UpdateOverlayDisplay(DWORD);
	HRESULT UpdateOverlayZOrder(DWORD, LPDIRECTDRAWSURFACE2);
	HRESULT GetDDInterface(LPVOID*);
	HRESULT PageLock(DWORD);
	HRESULT PageUnlock(DWORD);
}

interface IDirectDrawSurface3 : IUnknown {
public extern(Windows):
	HRESULT AddAttachedSurface(LPDIRECTDRAWSURFACE3);
	HRESULT AddOverlayDirtyRect(LPRECT);
	HRESULT Blt(LPRECT, LPDIRECTDRAWSURFACE3, LPRECT, DWORD, LPDDBLTFX);
	HRESULT BltBatch(LPDDBLTBATCH, DWORD, DWORD);
	HRESULT BltFast(DWORD, DWORD, LPDIRECTDRAWSURFACE3, LPRECT, DWORD);
	HRESULT DeleteAttachedSurface(DWORD, LPDIRECTDRAWSURFACE3);
	HRESULT EnumAttachedSurfaces(LPVOID, LPDDENUMSURFACESCALLBACK);
	HRESULT EnumOverlayZOrders(DWORD, LPVOID, LPDDENUMSURFACESCALLBACK);
	HRESULT Flip(LPDIRECTDRAWSURFACE3, DWORD);
	HRESULT GetAttachedSurface(LPDDSCAPS, LPDIRECTDRAWSURFACE3*);
	HRESULT GetBltStatus(DWORD);
	HRESULT GetCaps(LPDDSCAPS);
	HRESULT GetClipper(LPDIRECTDRAWCLIPPER*);
	HRESULT GetColorKey(DWORD, LPDDCOLORKEY);
	HRESULT GetDC(HDC*);
	HRESULT GetFlipStatus(DWORD);
	HRESULT GetOverlayPosition(LPLONG, LPLONG );
	HRESULT GetPalette(LPDIRECTDRAWPALETTE*);
	HRESULT GetPixelFormat(LPDDPIXELFORMAT);
	HRESULT GetSurfaceDesc(LPDDSURFACEDESC);
	HRESULT Initialize(LPDIRECTDRAW, LPDDSURFACEDESC);
	HRESULT IsLost();
	HRESULT Lock(LPRECT,LPDDSURFACEDESC,DWORD,HANDLE);
	HRESULT ReleaseDC(HDC);
	HRESULT Restore();
	HRESULT SetClipper(LPDIRECTDRAWCLIPPER);
	HRESULT SetColorKey(DWORD, LPDDCOLORKEY);
	HRESULT SetOverlayPosition(LONG, LONG);
	HRESULT SetPalette(LPDIRECTDRAWPALETTE);
	HRESULT Unlock(LPVOID);
	HRESULT UpdateOverlay(LPRECT, LPDIRECTDRAWSURFACE3, LPRECT, DWORD, LPDDOVERLAYFX);
	HRESULT UpdateOverlayDisplay(DWORD);
	HRESULT UpdateOverlayZOrder(DWORD, LPDIRECTDRAWSURFACE3);
	HRESULT GetDDInterface(LPVOID*);
	HRESULT PageLock(DWORD);
	HRESULT PageUnlock(DWORD);
	HRESULT SetSurfaceDesc(LPDDSURFACEDESC, DWORD);
}

interface IDirectDrawSurface4 : IUnknown {
public extern(Windows):
	HRESULT AddAttachedSurface(LPDIRECTDRAWSURFACE4);
	HRESULT AddOverlayDirtyRect(LPRECT);
	HRESULT Blt(LPRECT, LPDIRECTDRAWSURFACE4, LPRECT, DWORD, LPDDBLTFX);
	HRESULT BltBatch(LPDDBLTBATCH, DWORD, DWORD);
	HRESULT BltFast(DWORD, DWORD, LPDIRECTDRAWSURFACE4, LPRECT, DWORD);
	HRESULT DeleteAttachedSurface(DWORD, LPDIRECTDRAWSURFACE4);
	HRESULT EnumAttachedSurfaces(LPVOID, LPDDENUMSURFACESCALLBACK2);
	HRESULT EnumOverlayZOrders(DWORD, LPVOID, LPDDENUMSURFACESCALLBACK2);
	HRESULT Flip(LPDIRECTDRAWSURFACE4, DWORD);
	HRESULT GetAttachedSurface(LPDDSCAPS2, LPDIRECTDRAWSURFACE4*);
	HRESULT GetBltStatus(DWORD);
	HRESULT GetCaps(LPDDSCAPS2);
	HRESULT GetClipper(LPDIRECTDRAWCLIPPER*);
	HRESULT GetColorKey(DWORD, LPDDCOLORKEY);
	HRESULT GetDC(HDC*);
	HRESULT GetFlipStatus(DWORD);
	HRESULT GetOverlayPosition(LPLONG, LPLONG);
	HRESULT GetPalette(LPDIRECTDRAWPALETTE*);
	HRESULT GetPixelFormat(LPDDPIXELFORMAT);
	HRESULT GetSurfaceDesc(LPDDSURFACEDESC2);
	HRESULT Initialize(LPDIRECTDRAW, LPDDSURFACEDESC2);
	HRESULT IsLost();
	HRESULT Lock(LPRECT, LPDDSURFACEDESC2, DWORD, HANDLE);
	HRESULT ReleaseDC(HDC);
	HRESULT Restore();
	HRESULT SetClipper(LPDIRECTDRAWCLIPPER);
	HRESULT SetColorKey(DWORD, LPDDCOLORKEY);
	HRESULT SetOverlayPosition(LONG, LONG);
	HRESULT SetPalette(LPDIRECTDRAWPALETTE);
	HRESULT Unlock(LPRECT);
	HRESULT UpdateOverlay(LPRECT, LPDIRECTDRAWSURFACE4, LPRECT, DWORD, LPDDOVERLAYFX);
	HRESULT UpdateOverlayDisplay(DWORD);
	HRESULT UpdateOverlayZOrder(DWORD, LPDIRECTDRAWSURFACE4);
	HRESULT GetDDInterface(LPVOID*);
	HRESULT PageLock(DWORD);
	HRESULT PageUnlock(DWORD);
	HRESULT SetSurfaceDesc(LPDDSURFACEDESC2, DWORD);
	HRESULT SetPrivateData(REFGUID, LPVOID, DWORD, DWORD);
	HRESULT GetPrivateData(REFGUID, LPVOID, LPDWORD);
	HRESULT FreePrivateData(REFGUID);
	HRESULT GetUniquenessValue(LPDWORD);
	HRESULT ChangeUniquenessValue();
}

interface IDirectDrawSurface7 : IUnknown {
public extern(Windows):
	HRESULT AddAttachedSurface(LPDIRECTDRAWSURFACE7);
	HRESULT AddOverlayDirtyRect(LPRECT);
	HRESULT Blt(LPRECT, LPDIRECTDRAWSURFACE7, LPRECT, DWORD, LPDDBLTFX);
	HRESULT BltBatch(LPDDBLTBATCH, DWORD, DWORD);
	HRESULT BltFast(DWORD, DWORD, LPDIRECTDRAWSURFACE7, LPRECT, DWORD);
	HRESULT DeleteAttachedSurface(DWORD, LPDIRECTDRAWSURFACE7);
	HRESULT EnumAttachedSurfaces(LPVOID, LPDDENUMSURFACESCALLBACK7);
	HRESULT EnumOverlayZOrders(DWORD, LPVOID, LPDDENUMSURFACESCALLBACK7);
	HRESULT Flip(LPDIRECTDRAWSURFACE7, DWORD);
	HRESULT GetAttachedSurface(LPDDSCAPS2, LPDIRECTDRAWSURFACE7*);
	HRESULT GetBltStatus(DWORD);
	HRESULT GetCaps(LPDDSCAPS2);
	HRESULT GetClipper(LPDIRECTDRAWCLIPPER*);
	HRESULT GetColorKey(DWORD, LPDDCOLORKEY);
	HRESULT GetDC(HDC*);
	HRESULT GetFlipStatus(DWORD);
	HRESULT GetOverlayPosition(LPLONG, LPLONG);
	HRESULT GetPalette(LPDIRECTDRAWPALETTE*);
	HRESULT GetPixelFormat(LPDDPIXELFORMAT);
	HRESULT GetSurfaceDesc(LPDDSURFACEDESC2);
	HRESULT Initialize(LPDIRECTDRAW, LPDDSURFACEDESC2);
	HRESULT IsLost();
	HRESULT Lock(LPRECT, LPDDSURFACEDESC2, DWORD, HANDLE);
	HRESULT ReleaseDC(HDC);
	HRESULT Restore();
	HRESULT SetClipper(LPDIRECTDRAWCLIPPER);
	HRESULT SetColorKey(DWORD, LPDDCOLORKEY);
	HRESULT SetOverlayPosition(LONG, LONG);
	HRESULT SetPalette(LPDIRECTDRAWPALETTE);
	HRESULT Unlock(LPRECT);
	HRESULT UpdateOverlay(LPRECT, LPDIRECTDRAWSURFACE7, LPRECT, DWORD, LPDDOVERLAYFX);
	HRESULT UpdateOverlayDisplay(DWORD);
	HRESULT UpdateOverlayZOrder(DWORD, LPDIRECTDRAWSURFACE7);
	HRESULT GetDDInterface(LPVOID*);
	HRESULT PageLock(DWORD);
	HRESULT PageUnlock(DWORD);
	HRESULT SetSurfaceDesc(LPDDSURFACEDESC2, DWORD);
	HRESULT SetPrivateData(REFGUID, LPVOID, DWORD, DWORD);
	HRESULT GetPrivateData(REFGUID, LPVOID, LPDWORD);
	HRESULT FreePrivateData(REFGUID);
	HRESULT GetUniquenessValue(LPDWORD);
	HRESULT ChangeUniquenessValue();
	HRESULT SetPriority(DWORD);
	HRESULT GetPriority(LPDWORD);
	HRESULT SetLOD(DWORD);
	HRESULT GetLOD(LPDWORD);
}

interface IDirectDrawColorControl : IUnknown {
public extern(Windows):
	HRESULT GetColorControls(LPDDCOLORCONTROL);
	HRESULT SetColorControls(LPDDCOLORCONTROL);
}

interface IDirectDrawGammaControl : IUnknown {
public extern(Windows):
	HRESULT GetGammaRamp(DWORD, LPDDGAMMARAMP);
	HRESULT SetGammaRamp(DWORD, LPDDGAMMARAMP);
}

struct DDSURFACEDESC {
	DWORD dwSize;
	DWORD dwFlags;
	DWORD dwHeight;
	DWORD dwWidth;
	union {
		LONG lPitch;
		DWORD dwLinearSize;
	}
	DWORD dwBackBufferCount;
	union {
		DWORD dwMipMapCount;
		DWORD dwZBufferBitDepth;
		DWORD dwRefreshRate;
	}
	DWORD dwAlphaBitDepth;
	DWORD dwReserved;
	LPVOID lpSurface;
	DDCOLORKEY ddckCKDestOverlay;
	DDCOLORKEY ddckCKDestBlt;
	DDCOLORKEY ddckCKSrcOverlay;
	DDCOLORKEY ddckCKSrcBlt;
	DDPIXELFORMAT ddpfPixelFormat;
	DDSCAPS ddsCaps;
}

struct DDSURFACEDESC2 {
	DWORD dwSize;
	DWORD dwFlags;
	DWORD dwHeight;
	DWORD dwWidth;
	union {
		LONG lPitch;
		DWORD dwLinearSize;
	}
	union {
		DWORD dwBackBufferCount;
		DWORD dwDepth;
	}
	union {
		DWORD dwMipMapCount;
		DWORD dwRefreshRate;
		DWORD dwSrcVBHandle;
	}
	DWORD dwAlphaBitDepth;
	DWORD dwReserved;
	LPVOID lpSurface;
	union {
		DDCOLORKEY ddckCKDestOverlay;
		DWORD dwEmptyFaceColor;
	}
	DDCOLORKEY ddckCKDestBlt;
	DDCOLORKEY ddckCKSrcOverlay;
	DDCOLORKEY ddckCKSrcBlt;
	union {
		DDPIXELFORMAT ddpfPixelFormat;
		DWORD dwFVF;
	}
	DDSCAPS2 ddsCaps;
	DWORD dwTextureStage;
}

enum {
	DDSD_CAPS            = 0x00000001,
	DDSD_HEIGHT          = 0x00000002,
	DDSD_WIDTH           = 0x00000004,
	DDSD_PITCH           = 0x00000008,
	DDSD_BACKBUFFERCOUNT = 0x00000020,
	DDSD_ZBUFFERBITDEPTH = 0x00000040,
	DDSD_ALPHABITDEPTH   = 0x00000080,
	DDSD_LPSURFACE       = 0x00000800,
	DDSD_PIXELFORMAT     = 0x00001000,
	DDSD_CKDESTOVERLAY   = 0x00002000,
	DDSD_CKDESTBLT       = 0x00004000,
	DDSD_CKSRCOVERLAY    = 0x00008000,
	DDSD_CKSRCBLT        = 0x00010000,
	DDSD_MIPMAPCOUNT     = 0x00020000,
	DDSD_REFRESHRATE     = 0x00040000,
	DDSD_LINEARSIZE      = 0x00080000,
	DDSD_TEXTURESTAGE    = 0x00100000,
	DDSD_FVF             = 0x00200000,
	DDSD_SRCVBHANDLE     = 0x00400000,
	DDSD_DEPTH           = 0x00800000,
	DDSD_ALL             = 0x00fff9ee,
}

struct DDOPTSURFACEDESC {
	DWORD dwSize;
	DWORD dwFlags;
	DDSCAPS2 ddSCaps;
	DDOSCAPS ddOSCaps;
	GUID guid;
	DWORD dwCompressionRatio;
}

enum {
	DDOSD_GUID                 = 0x00000001,
	DDOSD_COMPRESSION_RATIO    = 0x00000002,
	DDOSD_SCAPS                = 0x00000004,
	DDOSD_OSCAPS               = 0x00000008,
	DDOSD_ALL                  = 0x0000000f,
	DDOSDCAPS_OPTCOMPRESSED    = 0x00000001,
	DDOSDCAPS_OPTREORDERED     = 0x00000002,
	DDOSDCAPS_MONOLITHICMIPMAP = 0x00000004,
	DDOSDCAPS_VALIDSCAPS       = 0x30004800,
	DDOSDCAPS_VALIDOSCAPS      = 0x00000007,
}

struct DDCOLORCONTROL {
	DWORD dwSize;
	DWORD dwFlags;
	LONG lBrightness;
	LONG lContrast;
	LONG lHue;
	LONG lSaturation;
	LONG lSharpness;
	LONG lGamma;
	LONG lColorEnable;
	DWORD dwReserved1;
}

enum {
	DDCOLOR_BRIGHTNESS                    = 0x00000001,
	DDCOLOR_CONTRAST                      = 0x00000002,
	DDCOLOR_HUE                           = 0x00000004,
	DDCOLOR_SATURATION                    = 0x00000008,
	DDCOLOR_SHARPNESS                     = 0x00000010,
	DDCOLOR_GAMMA                         = 0x00000020,
	DDCOLOR_COLORENABLE                   = 0x00000040,
	DDSCAPS_RESERVED1                     = 0x00000001,
	DDSCAPS_ALPHA                         = 0x00000002,
	DDSCAPS_BACKBUFFER                    = 0x00000004,
	DDSCAPS_COMPLEX                       = 0x00000008,
	DDSCAPS_FLIP                          = 0x00000010,
	DDSCAPS_FRONTBUFFER                   = 0x00000020,
	DDSCAPS_OFFSCREENPLAIN                = 0x00000040,
	DDSCAPS_OVERLAY                       = 0x00000080,
	DDSCAPS_PALETTE                       = 0x00000100,
	DDSCAPS_PRIMARYSURFACE                = 0x00000200,
	DDSCAPS_RESERVED3                     = 0x00000400,
	DDSCAPS_PRIMARYSURFACELEFT            = 0x00000000,
	DDSCAPS_SYSTEMMEMORY                  = 0x00000800,
	DDSCAPS_TEXTURE                       = 0x00001000,
	DDSCAPS_3DDEVICE                      = 0x00002000,
	DDSCAPS_VIDEOMEMORY                   = 0x00004000,
	DDSCAPS_VISIBLE                       = 0x00008000,
	DDSCAPS_WRITEONLY                     = 0x00010000,
	DDSCAPS_ZBUFFER                       = 0x00020000,
	DDSCAPS_OWNDC                         = 0x00040000,
	DDSCAPS_LIVEVIDEO                     = 0x00080000,
	DDSCAPS_HWCODEC                       = 0x00100000,
	DDSCAPS_MODEX                         = 0x00200000,
	DDSCAPS_MIPMAP                        = 0x00400000,
	DDSCAPS_RESERVED2                     = 0x00800000,
	DDSCAPS_ALLOCONLOAD                   = 0x04000000,
	DDSCAPS_VIDEOPORT                     = 0x08000000,
	DDSCAPS_LOCALVIDMEM                   = 0x10000000,
	DDSCAPS_NONLOCALVIDMEM                = 0x20000000,
	DDSCAPS_STANDARDVGAMODE               = 0x40000000,
	DDSCAPS_OPTIMIZED                     = 0x80000000,
	DDSCAPS2_RESERVED4                    = 0x00000002,
	DDSCAPS2_HARDWAREDEINTERLACE          = 0x00000000,
	DDSCAPS2_HINTDYNAMIC                  = 0x00000004,
	DDSCAPS2_HINTSTATIC                   = 0x00000008,
	DDSCAPS2_TEXTUREMANAGE                = 0x00000010,
	DDSCAPS2_RESERVED1                    = 0x00000020,
	DDSCAPS2_RESERVED2                    = 0x00000040,
	DDSCAPS2_OPAQUE                       = 0x00000080,
	DDSCAPS2_HINTANTIALIASING             = 0x00000100,
	DDSCAPS2_CUBEMAP                      = 0x00000200,
	DDSCAPS2_CUBEMAP_POSITIVEX            = 0x00000400,
	DDSCAPS2_CUBEMAP_NEGATIVEX            = 0x00000800,
	DDSCAPS2_CUBEMAP_POSITIVEY            = 0x00001000,
	DDSCAPS2_CUBEMAP_NEGATIVEY            = 0x00002000,
	DDSCAPS2_CUBEMAP_POSITIVEZ            = 0x00004000,
	DDSCAPS2_CUBEMAP_NEGATIVEZ            = 0x00008000,
	DDSCAPS2_CUBEMAP_ALLFACES             =  DDSCAPS2_CUBEMAP_POSITIVEX | DDSCAPS2_CUBEMAP_NEGATIVEX | DDSCAPS2_CUBEMAP_POSITIVEY | DDSCAPS2_CUBEMAP_NEGATIVEY | DDSCAPS2_CUBEMAP_POSITIVEZ | DDSCAPS2_CUBEMAP_NEGATIVEZ ,
	DDSCAPS2_MIPMAPSUBLEVEL               = 0x00010000,
	DDSCAPS2_D3DTEXTUREMANAGE             = 0x00020000,
	DDSCAPS2_DONOTPERSIST                 = 0x00040000,
	DDSCAPS2_STEREOSURFACELEFT            = 0x00080000,
	DDSCAPS2_VOLUME                       = 0x00200000,
	DDSCAPS2_NOTUSERLOCKABLE              = 0x00400000,
	DDSCAPS2_POINTS                       = 0x00800000,
	DDSCAPS2_RTPATCHES                    = 0x01000000,
	DDSCAPS2_NPATCHES                     = 0x02000000,
	DDSCAPS2_RESERVED3                    = 0x04000000,
	DDSCAPS2_DISCARDBACKBUFFER            = 0x10000000,
	DDSCAPS2_ENABLEALPHACHANNEL           = 0x20000000,
	DDSCAPS2_EXTENDEDFORMATPRIMARY        = 0x40000000,
	DDSCAPS2_ADDITIONALPRIMARY            = 0x80000000,
	DDSCAPS3_MULTISAMPLE_MASK             = 0x0000001F,
	DDSCAPS3_MULTISAMPLE_QUALITY_MASK     = 0x000000E0,
	DDSCAPS3_MULTISAMPLE_QUALITY_SHIFT    = 5,
	DDSCAPS3_RESERVED1                    = 0x00000100,
	DDSCAPS3_RESERVED2                    = 0x00000200,
	DDSCAPS3_LIGHTWEIGHTMIPMAP            = 0x00000400,
	DDSCAPS3_AUTOGENMIPMAP                = 0x00000800,
	DDSCAPS3_DMAP                         = 0x00001000,
	DDSCAPS3_CREATESHAREDRESOURCE         = 0x00002000,
	DDSCAPS3_READONLYRESOURCE             = 0x00004000,
	DDSCAPS3_OPENSHAREDRESOURCE           = 0x00008000,
	DDCAPS_3D                             = 0x00000001,
	DDCAPS_ALIGNBOUNDARYDEST              = 0x00000002,
	DDCAPS_ALIGNSIZEDEST                  = 0x00000004,
	DDCAPS_ALIGNBOUNDARYSRC               = 0x00000008,
	DDCAPS_ALIGNSIZESRC                   = 0x00000010,
	DDCAPS_ALIGNSTRIDE                    = 0x00000020,
	DDCAPS_BLT                            = 0x00000040,
	DDCAPS_BLTQUEUE                       = 0x00000080,
	DDCAPS_BLTFOURCC                      = 0x00000100,
	DDCAPS_BLTSTRETCH                     = 0x00000200,
	DDCAPS_GDI                            = 0x00000400,
	DDCAPS_OVERLAY                        = 0x00000800,
	DDCAPS_OVERLAYCANTCLIP                = 0x00001000,
	DDCAPS_OVERLAYFOURCC                  = 0x00002000,
	DDCAPS_OVERLAYSTRETCH                 = 0x00004000,
	DDCAPS_PALETTE                        = 0x00008000,
	DDCAPS_PALETTEVSYNC                   = 0x00010000,
	DDCAPS_READSCANLINE                   = 0x00020000,
	DDCAPS_RESERVED1                      = 0x00040000,
	DDCAPS_VBI                            = 0x00080000,
	DDCAPS_ZBLTS                          = 0x00100000,
	DDCAPS_ZOVERLAYS                      = 0x00200000,
	DDCAPS_COLORKEY                       = 0x00400000,
	DDCAPS_ALPHA                          = 0x00800000,
	DDCAPS_COLORKEYHWASSIST               = 0x01000000,
	DDCAPS_NOHARDWARE                     = 0x02000000,
	DDCAPS_BLTCOLORFILL                   = 0x04000000,
	DDCAPS_BANKSWITCHED                   = 0x08000000,
	DDCAPS_BLTDEPTHFILL                   = 0x10000000,
	DDCAPS_CANCLIP                        = 0x20000000,
	DDCAPS_CANCLIPSTRETCHED               = 0x40000000,
	DDCAPS_CANBLTSYSMEM                   = 0x80000000,
	DDCAPS2_CERTIFIED                     = 0x00000001,
	DDCAPS2_NO2DDURING3DSCENE             = 0x00000002,
	DDCAPS2_VIDEOPORT                     = 0x00000004,
	DDCAPS2_AUTOFLIPOVERLAY               = 0x00000008,
	DDCAPS2_CANBOBINTERLEAVED             = 0x00000010,
	DDCAPS2_CANBOBNONINTERLEAVED          = 0x00000020,
	DDCAPS2_COLORCONTROLOVERLAY           = 0x00000040,
	DDCAPS2_COLORCONTROLPRIMARY           = 0x00000080,
	DDCAPS2_CANDROPZ16BIT                 = 0x00000100,
	DDCAPS2_NONLOCALVIDMEM                = 0x00000200,
	DDCAPS2_NONLOCALVIDMEMCAPS            = 0x00000400,
	DDCAPS2_NOPAGELOCKREQUIRED            = 0x00000800,
	DDCAPS2_WIDESURFACES                  = 0x00001000,
	DDCAPS2_CANFLIPODDEVEN                = 0x00002000,
	DDCAPS2_CANBOBHARDWARE                = 0x00004000,
	DDCAPS2_COPYFOURCC                    = 0x00008000,
	DDCAPS2_PRIMARYGAMMA                  = 0x00020000,
	DDCAPS2_CANRENDERWINDOWED             = 0x00080000,
	DDCAPS2_CANCALIBRATEGAMMA             = 0x00100000,
	DDCAPS2_FLIPINTERVAL                  = 0x00200000,
	DDCAPS2_FLIPNOVSYNC                   = 0x00400000,
	DDCAPS2_CANMANAGETEXTURE              = 0x00800000,
	DDCAPS2_TEXMANINNONLOCALVIDMEM        = 0x01000000,
	DDCAPS2_STEREO                        = 0x02000000,
	DDCAPS2_SYSTONONLOCAL_AS_SYSTOLOCAL   = 0x04000000,
	DDCAPS2_RESERVED1                     = 0x08000000,
	DDCAPS2_CANMANAGERESOURCE             = 0x10000000,
	DDCAPS2_DYNAMICTEXTURES               = 0x20000000,
	DDCAPS2_CANAUTOGENMIPMAP              = 0x40000000,
	DDCAPS2_CANSHARERESOURCE              = 0x80000000,
	DDFXALPHACAPS_BLTALPHAEDGEBLEND       = 0x00000001,
	DDFXALPHACAPS_BLTALPHAPIXELS          = 0x00000002,
	DDFXALPHACAPS_BLTALPHAPIXELSNEG       = 0x00000004,
	DDFXALPHACAPS_BLTALPHASURFACES        = 0x00000008,
	DDFXALPHACAPS_BLTALPHASURFACESNEG     = 0x00000010,
	DDFXALPHACAPS_OVERLAYALPHAEDGEBLEND   = 0x00000020,
	DDFXALPHACAPS_OVERLAYALPHAPIXELS      = 0x00000040,
	DDFXALPHACAPS_OVERLAYALPHAPIXELSNEG   = 0x00000080,
	DDFXALPHACAPS_OVERLAYALPHASURFACES    = 0x00000100,
	DDFXALPHACAPS_OVERLAYALPHASURFACESNEG = 0x00000200,
	DDFXCAPS_BLTARITHSTRETCHY             = 0x00000020,
	DDFXCAPS_BLTARITHSTRETCHYN            = 0x00000010,
	DDFXCAPS_BLTMIRRORLEFTRIGHT           = 0x00000040,
	DDFXCAPS_BLTMIRRORUPDOWN              = 0x00000080,
	DDFXCAPS_BLTROTATION                  = 0x00000100,
	DDFXCAPS_BLTROTATION90                = 0x00000200,
	DDFXCAPS_BLTSHRINKX                   = 0x00000400,
	DDFXCAPS_BLTSHRINKXN                  = 0x00000800,
	DDFXCAPS_BLTSHRINKY                   = 0x00001000,
	DDFXCAPS_BLTSHRINKYN                  = 0x00002000,
	DDFXCAPS_BLTSTRETCHX                  = 0x00004000,
	DDFXCAPS_BLTSTRETCHXN                 = 0x00008000,
	DDFXCAPS_BLTSTRETCHY                  = 0x00010000,
	DDFXCAPS_BLTSTRETCHYN                 = 0x00020000,
	DDFXCAPS_OVERLAYARITHSTRETCHY         = 0x00040000,
	DDFXCAPS_OVERLAYARITHSTRETCHYN        = 0x00000008,
	DDFXCAPS_OVERLAYSHRINKX               = 0x00080000,
	DDFXCAPS_OVERLAYSHRINKXN              = 0x00100000,
	DDFXCAPS_OVERLAYSHRINKY               = 0x00200000,
	DDFXCAPS_OVERLAYSHRINKYN              = 0x00400000,
	DDFXCAPS_OVERLAYSTRETCHX              = 0x00800000,
	DDFXCAPS_OVERLAYSTRETCHXN             = 0x01000000,
	DDFXCAPS_OVERLAYSTRETCHY              = 0x02000000,
	DDFXCAPS_OVERLAYSTRETCHYN             = 0x04000000,
	DDFXCAPS_OVERLAYMIRRORLEFTRIGHT       = 0x08000000,
	DDFXCAPS_OVERLAYMIRRORUPDOWN          = 0x10000000,
	DDFXCAPS_OVERLAYDEINTERLACE           = 0x20000000,
	DDFXCAPS_BLTALPHA                     = 0x00000001,
	DDFXCAPS_BLTFILTER                    = DDFXCAPS_BLTARITHSTRETCHY,
	DDFXCAPS_OVERLAYALPHA                 = 0x00000004,
	DDFXCAPS_OVERLAYFILTER                = DDFXCAPS_OVERLAYARITHSTRETCHY,
	DDSVCAPS_RESERVED1                    = 0x00000001,
	DDSVCAPS_RESERVED2                    = 0x00000002,
	DDSVCAPS_RESERVED3                    = 0x00000004,
	DDSVCAPS_RESERVED4                    = 0x00000008,
	DDSVCAPS_STEREOSEQUENTIAL             = 0x00000010,
	DDPCAPS_4BIT                          = 0x00000001,
	DDPCAPS_8BITENTRIES                   = 0x00000002,
	DDPCAPS_8BIT                          = 0x00000004,
	DDPCAPS_INITIALIZE                    = 0x00000000,
	DDPCAPS_PRIMARYSURFACE                = 0x00000010,
	DDPCAPS_PRIMARYSURFACELEFT            = 0x00000020,
	DDPCAPS_ALLOW256                      = 0x00000040,
	DDPCAPS_VSYNC                         = 0x00000080,
	DDPCAPS_1BIT                          = 0x00000100,
	DDPCAPS_2BIT                          = 0x00000200,
	DDPCAPS_ALPHA                         = 0x00000400,
	DDSPD_IUNKNOWNPOINTER                 = 0x00000001,
	DDSPD_VOLATILE                        = 0x00000002,
	DDBD_1                                = 0x00004000,
	DDBD_2                                = 0x00002000,
	DDBD_4                                = 0x00001000,
	DDBD_8                                = 0x00000800,
	DDBD_16                               = 0x00000400,
	DDBD_24                               = 0X00000200,
	DDBD_32                               = 0x00000100,
	DDCKEY_COLORSPACE                     = 0x00000001,
	DDCKEY_DESTBLT                        = 0x00000002,
	DDCKEY_DESTOVERLAY                    = 0x00000004,
	DDCKEY_SRCBLT                         = 0x00000008,
	DDCKEY_SRCOVERLAY                     = 0x00000010,
	DDCKEYCAPS_DESTBLT                    = 0x00000001,
	DDCKEYCAPS_DESTBLTCLRSPACE            = 0x00000002,
	DDCKEYCAPS_DESTBLTCLRSPACEYUV         = 0x00000004,
	DDCKEYCAPS_DESTBLTYUV                 = 0x00000008,
	DDCKEYCAPS_DESTOVERLAY                = 0x00000010,
	DDCKEYCAPS_DESTOVERLAYCLRSPACE        = 0x00000020,
	DDCKEYCAPS_DESTOVERLAYCLRSPACEYUV     = 0x00000040,
	DDCKEYCAPS_DESTOVERLAYONEACTIVE       = 0x00000080,
	DDCKEYCAPS_DESTOVERLAYYUV             = 0x00000100,
	DDCKEYCAPS_SRCBLT                     = 0x00000200,
	DDCKEYCAPS_SRCBLTCLRSPACE             = 0x00000400,
	DDCKEYCAPS_SRCBLTCLRSPACEYUV          = 0x00000800,
	DDCKEYCAPS_SRCBLTYUV                  = 0x00001000,
	DDCKEYCAPS_SRCOVERLAY                 = 0x00002000,
	DDCKEYCAPS_SRCOVERLAYCLRSPACE         = 0x00004000,
	DDCKEYCAPS_SRCOVERLAYCLRSPACEYUV      = 0x00008000,
	DDCKEYCAPS_SRCOVERLAYONEACTIVE        = 0x00010000,
	DDCKEYCAPS_SRCOVERLAYYUV              = 0x00020000,
	DDCKEYCAPS_NOCOSTOVERLAY              = 0x00040000,
	DDPF_ALPHAPIXELS                      = 0x00000001,
	DDPF_ALPHA                            = 0x00000002,
	DDPF_FOURCC                           = 0x00000004,
	DDPF_PALETTEINDEXED4                  = 0x00000008,
	DDPF_PALETTEINDEXEDTO8                = 0x00000010,
	DDPF_PALETTEINDEXED8                  = 0x00000020,
	DDPF_RGB                              = 0x00000040,
	DDPF_COMPRESSED                       = 0x00000080,
	DDPF_RGBTOYUV                         = 0x00000100,
	DDPF_YUV                              = 0x00000200,
	DDPF_ZBUFFER                          = 0x00000400,
	DDPF_PALETTEINDEXED1                  = 0x00000800,
	DDPF_PALETTEINDEXED2                  = 0x00001000,
	DDPF_ZPIXELS                          = 0x00002000,
	DDPF_STENCILBUFFER                    = 0x00004000,
	DDPF_ALPHAPREMULT                     = 0x00008000,
	DDPF_LUMINANCE                        = 0x00020000,
	DDPF_BUMPLUMINANCE                    = 0x00040000,
	DDPF_BUMPDUDV                         = 0x00080000,
	DDENUMSURFACES_ALL                    = 0x00000001,
	DDENUMSURFACES_MATCH                  = 0x00000002,
	DDENUMSURFACES_NOMATCH                = 0x00000004,
	DDENUMSURFACES_CANBECREATED           = 0x00000008,
	DDENUMSURFACES_DOESEXIST              = 0x00000010,
	DDSDM_STANDARDVGAMODE                 = 0x00000001,
	DDEDM_REFRESHRATES                    = 0x00000001,
	DDEDM_STANDARDVGAMODES                = 0x00000002,
	DDSCL_FULLSCREEN                      = 0x00000001,
	DDSCL_ALLOWREBOOT                     = 0x00000002,
	DDSCL_NOWINDOWCHANGES                 = 0x00000004,
	DDSCL_NORMAL                          = 0x00000008,
	DDSCL_EXCLUSIVE                       = 0x00000010,
	DDSCL_ALLOWMODEX                      = 0x00000040,
	DDSCL_SETFOCUSWINDOW                  = 0x00000080,
	DDSCL_SETDEVICEWINDOW                 = 0x00000100,
	DDSCL_CREATEDEVICEWINDOW              = 0x00000200,
	DDSCL_MULTITHREADED                   = 0x00000400,
	DDSCL_FPUSETUP                        = 0x00000800,
	DDSCL_FPUPRESERVE                     = 0x00001000,
	DDBLT_ALPHADEST                       = 0x00000001,
	DDBLT_ALPHADESTCONSTOVERRIDE          = 0x00000002,
	DDBLT_ALPHADESTNEG                    = 0x00000004,
	DDBLT_ALPHADESTSURFACEOVERRIDE        = 0x00000008,
	DDBLT_ALPHAEDGEBLEND                  = 0x00000010,
	DDBLT_ALPHASRC                        = 0x00000020,
	DDBLT_ALPHASRCCONSTOVERRIDE           = 0x00000040,
	DDBLT_ALPHASRCNEG                     = 0x00000080,
	DDBLT_ALPHASRCSURFACEOVERRIDE         = 0x00000100,
	DDBLT_ASYNC                           = 0x00000200,
	DDBLT_COLORFILL                       = 0x00000400,
	DDBLT_DDFX                            = 0x00000800,
	DDBLT_DDROPS                          = 0x00001000,
	DDBLT_KEYDEST                         = 0x00002000,
	DDBLT_KEYDESTOVERRIDE                 = 0x00004000,
	DDBLT_KEYSRC                          = 0x00008000,
	DDBLT_KEYSRCOVERRIDE                  = 0x00010000,
	DDBLT_ROP                             = 0x00020000,
	DDBLT_ROTATIONANGLE                   = 0x00040000,
	DDBLT_ZBUFFER                         = 0x00080000,
	DDBLT_ZBUFFERDESTCONSTOVERRIDE        = 0x00100000,
	DDBLT_ZBUFFERDESTOVERRIDE             = 0x00200000,
	DDBLT_ZBUFFERSRCCONSTOVERRIDE         = 0x00400000,
	DDBLT_ZBUFFERSRCOVERRIDE              = 0x00800000,
	DDBLT_WAIT                            = 0x01000000,
	DDBLT_DEPTHFILL                       = 0x02000000,
	DDBLT_DONOTWAIT                       = 0x08000000,
	DDBLT_PRESENTATION                    = 0x10000000,
	DDBLT_LAST_PRESENTATION               = 0x20000000,
	DDBLT_EXTENDED_FLAGS                  = 0x40000000,
	DDBLT_EXTENDED_LINEAR_CONTENT         = 0x00000004,
	DDBLTFAST_NOCOLORKEY                  = 0x00000000,
	DDBLTFAST_SRCCOLORKEY                 = 0x00000001,
	DDBLTFAST_DESTCOLORKEY                = 0x00000002,
	DDBLTFAST_WAIT                        = 0x00000010,
	DDBLTFAST_DONOTWAIT                   = 0x00000020,
	DDFLIP_WAIT                           = 0x00000001,
	DDFLIP_EVEN                           = 0x00000002,
	DDFLIP_ODD                            = 0x00000004,
	DDFLIP_NOVSYNC                        = 0x00000008,
	DDFLIP_INTERVAL2                      = 0x02000000,
	DDFLIP_INTERVAL3                      = 0x03000000,
	DDFLIP_INTERVAL4                      = 0x04000000,
	DDFLIP_STEREO                         = 0x00000010,
	DDFLIP_DONOTWAIT                      = 0x00000020,
	DDOVER_ALPHADEST                      = 0x00000001,
	DDOVER_ALPHADESTCONSTOVERRIDE         = 0x00000002,
	DDOVER_ALPHADESTNEG                   = 0x00000004,
	DDOVER_ALPHADESTSURFACEOVERRIDE       = 0x00000008,
	DDOVER_ALPHAEDGEBLEND                 = 0x00000010,
	DDOVER_ALPHASRC                       = 0x00000020,
	DDOVER_ALPHASRCCONSTOVERRIDE          = 0x00000040,
	DDOVER_ALPHASRCNEG                    = 0x00000080,
	DDOVER_ALPHASRCSURFACEOVERRIDE        = 0x00000100,
	DDOVER_HIDE                           = 0x00000200,
	DDOVER_KEYDEST                        = 0x00000400,
	DDOVER_KEYDESTOVERRIDE                = 0x00000800,
	DDOVER_KEYSRC                         = 0x00001000,
	DDOVER_KEYSRCOVERRIDE                 = 0x00002000,
	DDOVER_SHOW                           = 0x00004000,
	DDOVER_ADDDIRTYRECT                   = 0x00008000,
	DDOVER_REFRESHDIRTYRECTS              = 0x00010000,
	DDOVER_REFRESHALL                     = 0x00020000,
	DDOVER_DDFX                           = 0x00080000,
	DDOVER_AUTOFLIP                       = 0x00100000,
	DDOVER_BOB                            = 0x00200000,
	DDOVER_OVERRIDEBOBWEAVE               = 0x00400000,
	DDOVER_INTERLEAVED                    = 0x00800000,
	DDOVER_BOBHARDWARE                    = 0x01000000,
	DDOVER_ARGBSCALEFACTORS               = 0x02000000,
	DDOVER_DEGRADEARGBSCALING             = 0x04000000,
	DDSETSURFACEDESC_RECREATEDC           = 0x00000000,
	DDSETSURFACEDESC_PRESERVEDC           = 0x00000001,
	DDLOCK_SURFACEMEMORYPTR               = 0x00000000,
	DDLOCK_WAIT                           = 0x00000001,
	DDLOCK_EVENT                          = 0x00000002,
	DDLOCK_READONLY                       = 0x00000010,
	DDLOCK_WRITEONLY                      = 0x00000020,
	DDLOCK_NOSYSLOCK                      = 0x00000800,
	DDLOCK_NOOVERWRITE                    = 0x00001000,
	DDLOCK_DISCARDCONTENTS                = 0x00002000,
	DDLOCK_OKTOSWAP                       = 0x00002000,
	DDLOCK_DONOTWAIT                      = 0x00004000,
	DDLOCK_HASVOLUMETEXTUREBOXRECT        = 0x00008000,
	DDLOCK_NODIRTYUPDATE                  = 0x00010000,
	DDBLTFX_ARITHSTRETCHY                 = 0x00000001,
	DDBLTFX_MIRRORLEFTRIGHT               = 0x00000002,
	DDBLTFX_MIRRORUPDOWN                  = 0x00000004,
	DDBLTFX_NOTEARING                     = 0x00000008,
	DDBLTFX_ROTATE180                     = 0x00000010,
	DDBLTFX_ROTATE270                     = 0x00000020,
	DDBLTFX_ROTATE90                      = 0x00000040,
	DDBLTFX_ZBUFFERRANGE                  = 0x00000080,
	DDBLTFX_ZBUFFERBASEDEST               = 0x00000100,
	DDOVERFX_ARITHSTRETCHY                = 0x00000001,
	DDOVERFX_MIRRORLEFTRIGHT              = 0x00000002,
	DDOVERFX_MIRRORUPDOWN                 = 0x00000004,
	DDOVERFX_DEINTERLACE                  = 0x00000008,
	DDWAITVB_BLOCKBEGIN                   = 0x00000001,
	DDWAITVB_BLOCKBEGINEVENT              = 0x00000002,
	DDWAITVB_BLOCKEND                     = 0x00000004,
	DDGFS_CANFLIP                         = 0x00000001,
	DDGFS_ISFLIPDONE                      = 0x00000002,
	DDGBS_CANBLT                          = 0x00000001,
	DDGBS_ISBLTDONE                       = 0x00000002,
	DDENUMOVERLAYZ_BACKTOFRONT            = 0x00000000,
	DDENUMOVERLAYZ_FRONTTOBACK            = 0x00000001,
	DDOVERZ_SENDTOFRONT                   = 0x00000000,
	DDOVERZ_SENDTOBACK                    = 0x00000001,
	DDOVERZ_MOVEFORWARD                   = 0x00000002,
	DDOVERZ_MOVEBACKWARD                  = 0x00000003,
	DDOVERZ_INSERTINFRONTOF               = 0x00000004,
	DDOVERZ_INSERTINBACKOF                = 0x00000005,
	DDSGR_CALIBRATE                       = 0x00000001,
	DDSMT_ISTESTREQUIRED                  = 0x00000001,
	DDEM_MODEPASSED                       = 0x00000001,
	DDEM_MODEFAILED                       = 0x00000002,
}

enum {
	DD_OK            = S_OK,
	DD_FALSE         = S_FALSE,
	DDENUMRET_CANCEL = 0,
	DDENUMRET_OK     = 1,
}

enum {
	DDERR_ALREADYINITIALIZED           = MAKE_DDHRESULT(5),
	DDERR_CANNOTATTACHSURFACE          = MAKE_DDHRESULT(10),
	DDERR_CANNOTDETACHSURFACE          = MAKE_DDHRESULT(20),
	DDERR_CURRENTLYNOTAVAIL            = MAKE_DDHRESULT(40),
	DDERR_EXCEPTION                    = MAKE_DDHRESULT(55),
	DDERR_GENERIC                      = E_FAIL,
	DDERR_HEIGHTALIGN                  = MAKE_DDHRESULT(90),
	DDERR_INCOMPATIBLEPRIMARY          = MAKE_DDHRESULT(95),
	DDERR_INVALIDCAPS                  = MAKE_DDHRESULT(100),
	DDERR_INVALIDCLIPLIST              = MAKE_DDHRESULT(110),
	DDERR_INVALIDMODE                  = MAKE_DDHRESULT(120),
	DDERR_INVALIDOBJECT                = MAKE_DDHRESULT(130),
	DDERR_INVALIDPARAMS                = E_INVALIDARG,
	DDERR_INVALIDPIXELFORMAT           = MAKE_DDHRESULT(145),
	DDERR_INVALIDRECT                  = MAKE_DDHRESULT(150),
	DDERR_LOCKEDSURFACES               = MAKE_DDHRESULT(160),
	DDERR_NO3D                         = MAKE_DDHRESULT(170),
	DDERR_NOALPHAHW                    = MAKE_DDHRESULT(180),
	DDERR_NOSTEREOHARDWARE             = MAKE_DDHRESULT(181),
	DDERR_NOSURFACELEFT                = MAKE_DDHRESULT(182),
	DDERR_NOCLIPLIST                   = MAKE_DDHRESULT(205),
	DDERR_NOCOLORCONVHW                = MAKE_DDHRESULT(210),
	DDERR_NOCOOPERATIVELEVELSET        = MAKE_DDHRESULT(212),
	DDERR_NOCOLORKEY                   = MAKE_DDHRESULT(215),
	DDERR_NOCOLORKEYHW                 = MAKE_DDHRESULT(220),
	DDERR_NODIRECTDRAWSUPPORT          = MAKE_DDHRESULT(222),
	DDERR_NOEXCLUSIVEMODE              = MAKE_DDHRESULT(225),
	DDERR_NOFLIPHW                     = MAKE_DDHRESULT(230),
	DDERR_NOGDI                        = MAKE_DDHRESULT(240),
	DDERR_NOMIRRORHW                   = MAKE_DDHRESULT(250),
	DDERR_NOTFOUND                     = MAKE_DDHRESULT(255),
	DDERR_NOOVERLAYHW                  = MAKE_DDHRESULT(260),
	DDERR_OVERLAPPINGRECTS             = MAKE_DDHRESULT(270),
	DDERR_NORASTEROPHW                 = MAKE_DDHRESULT(280),
	DDERR_NOROTATIONHW                 = MAKE_DDHRESULT(290),
	DDERR_NOSTRETCHHW                  = MAKE_DDHRESULT(310),
	DDERR_NOT4BITCOLOR                 = MAKE_DDHRESULT(316),
	DDERR_NOT4BITCOLORINDEX            = MAKE_DDHRESULT(317),
	DDERR_NOT8BITCOLOR                 = MAKE_DDHRESULT(320),
	DDERR_NOTEXTUREHW                  = MAKE_DDHRESULT(330),
	DDERR_NOVSYNCHW                    = MAKE_DDHRESULT(335),
	DDERR_NOZBUFFERHW                  = MAKE_DDHRESULT(340),
	DDERR_NOZOVERLAYHW                 = MAKE_DDHRESULT(350),
	DDERR_OUTOFCAPS                    = MAKE_DDHRESULT(360),
	DDERR_OUTOFMEMORY                  = E_OUTOFMEMORY,
	DDERR_OUTOFVIDEOMEMORY             = MAKE_DDHRESULT(380),
	DDERR_OVERLAYCANTCLIP              = MAKE_DDHRESULT(382),
	DDERR_OVERLAYCOLORKEYONLYONEACTIVE = MAKE_DDHRESULT(384),
	DDERR_PALETTEBUSY                  = MAKE_DDHRESULT(387),
	DDERR_COLORKEYNOTSET               = MAKE_DDHRESULT(400),
	DDERR_SURFACEALREADYATTACHED       = MAKE_DDHRESULT(410),
	DDERR_SURFACEALREADYDEPENDENT      = MAKE_DDHRESULT(420),
	DDERR_SURFACEBUSY                  = MAKE_DDHRESULT(430),
	DDERR_CANTLOCKSURFACE              = MAKE_DDHRESULT(435),
	DDERR_SURFACEISOBSCURED            = MAKE_DDHRESULT(440),
	DDERR_SURFACELOST                  = MAKE_DDHRESULT(450),
	DDERR_SURFACENOTATTACHED           = MAKE_DDHRESULT(460),
	DDERR_TOOBIGHEIGHT                 = MAKE_DDHRESULT(470),
	DDERR_TOOBIGSIZE                   = MAKE_DDHRESULT(480),
	DDERR_TOOBIGWIDTH                  = MAKE_DDHRESULT(490),
	DDERR_UNSUPPORTED                  = E_NOTIMPL,
	DDERR_UNSUPPORTEDFORMAT            = MAKE_DDHRESULT(510),
	DDERR_UNSUPPORTEDMASK              = MAKE_DDHRESULT(520),
	DDERR_INVALIDSTREAM                = MAKE_DDHRESULT(521),
	DDERR_VERTICALBLANKINPROGRESS      = MAKE_DDHRESULT(537),
	DDERR_WASSTILLDRAWING              = MAKE_DDHRESULT(540),
	DDERR_DDSCAPSCOMPLEXREQUIRED       = MAKE_DDHRESULT(542),
	DDERR_XALIGN                       = MAKE_DDHRESULT(560),
	DDERR_INVALIDDIRECTDRAWGUID        = MAKE_DDHRESULT(561),
	DDERR_DIRECTDRAWALREADYCREATED     = MAKE_DDHRESULT(562),
	DDERR_NODIRECTDRAWHW               = MAKE_DDHRESULT(563),
	DDERR_PRIMARYSURFACEALREADYEXISTS  = MAKE_DDHRESULT(564),
	DDERR_NOEMULATION                  = MAKE_DDHRESULT(565),
	DDERR_REGIONTOOSMALL               = MAKE_DDHRESULT(566),
	DDERR_CLIPPERISUSINGHWND           = MAKE_DDHRESULT(567),
	DDERR_NOCLIPPERATTACHED            = MAKE_DDHRESULT(568),
	DDERR_NOHWND                       = MAKE_DDHRESULT(569),
	DDERR_HWNDSUBCLASSED               = MAKE_DDHRESULT(570),
	DDERR_HWNDALREADYSET               = MAKE_DDHRESULT(571),
	DDERR_NOPALETTEATTACHED            = MAKE_DDHRESULT(572),
	DDERR_NOPALETTEHW                  = MAKE_DDHRESULT(573),
	DDERR_BLTFASTCANTCLIP              = MAKE_DDHRESULT(574),
	DDERR_NOBLTHW                      = MAKE_DDHRESULT(575),
	DDERR_NODDROPSHW                   = MAKE_DDHRESULT(576),
	DDERR_OVERLAYNOTVISIBLE            = MAKE_DDHRESULT(577),
	DDERR_NOOVERLAYDEST                = MAKE_DDHRESULT(578),
	DDERR_INVALIDPOSITION              = MAKE_DDHRESULT(579),
	DDERR_NOTAOVERLAYSURFACE           = MAKE_DDHRESULT(580),
	DDERR_EXCLUSIVEMODEALREADYSET      = MAKE_DDHRESULT(581),
	DDERR_NOTFLIPPABLE                 = MAKE_DDHRESULT(582),
	DDERR_CANTDUPLICATE                = MAKE_DDHRESULT(583),
	DDERR_NOTLOCKED                    = MAKE_DDHRESULT(584),
	DDERR_CANTCREATEDC                 = MAKE_DDHRESULT(585),
	DDERR_NODC                         = MAKE_DDHRESULT(586),
	DDERR_WRONGMODE                    = MAKE_DDHRESULT(587),
	DDERR_IMPLICITLYCREATED            = MAKE_DDHRESULT(588),
	DDERR_NOTPALETTIZED                = MAKE_DDHRESULT(589),
	DDERR_UNSUPPORTEDMODE              = MAKE_DDHRESULT(590),
	DDERR_NOMIPMAPHW                   = MAKE_DDHRESULT(591),
	DDERR_INVALIDSURFACETYPE           = MAKE_DDHRESULT(592),
	DDERR_NOOPTIMIZEHW                 = MAKE_DDHRESULT(600),
	DDERR_NOTLOADED                    = MAKE_DDHRESULT(601),
	DDERR_NOFOCUSWINDOW                = MAKE_DDHRESULT(602),
	DDERR_NOTONMIPMAPSUBLEVEL          = MAKE_DDHRESULT(603),
	DDERR_DCALREADYCREATED             = MAKE_DDHRESULT(620),
	DDERR_NONONLOCALVIDMEM             = MAKE_DDHRESULT(630),
	DDERR_CANTPAGELOCK                 = MAKE_DDHRESULT(640),
	DDERR_CANTPAGEUNLOCK               = MAKE_DDHRESULT(660),
	DDERR_NOTPAGELOCKED                = MAKE_DDHRESULT(680),
	DDERR_MOREDATA                     = MAKE_DDHRESULT(690),
	DDERR_EXPIRED                      = MAKE_DDHRESULT(691),
	DDERR_TESTFINISHED                 = MAKE_DDHRESULT(692),
	DDERR_NEWMODE                      = MAKE_DDHRESULT(693),
	DDERR_D3DNOTINITIALIZED            = MAKE_DDHRESULT(694),
	DDERR_VIDEONOTACTIVE               = MAKE_DDHRESULT(695),
	DDERR_NOMONITORINFORMATION         = MAKE_DDHRESULT(696),
	DDERR_NODRIVERSUPPORT              = MAKE_DDHRESULT(697),
	DDERR_DEVICEDOESNTOWNSURFACE       = MAKE_DDHRESULT(699),
	DDERR_NOTINITIALIZED               = CO_E_NOTINITIALIZED,
}

}// extern(C)
