/** dsound.d

Converted from 'dsound.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.dsound;


import c.windows.sdkddkver;
import c.windows.windef;
import c.windows.guiddef;
import c.windows.unknwn;
import c.windows.mmsystem;
import c.windows.winerror;
import c.directx.d3d9types;


static if(NTDDI_VERSION < NTDDI_WINXP)
	enum DIRECTSOUND_VERSION = 0x0700;
else static if(NTDDI_VERSION < NTDDI_WINXPSP2 || NTDDI_VERSION == NTDDI_WS03)
	enum DIRECTSOUND_VERSION = 0x0800;
else
	enum DIRECTSOUND_VERSION = 0x0900;


extern(C){

alias float D3DVALUE;
alias D3DVALUE* LPD3DVALUE;

private enum _FACDS = 0x878;
private pure nothrow
HRESULT MAKE_DSHRESULT(WORD code)
{
	return MAKE_HRESULT(1, _FACDS, code);
}

mixin DEFINE_GUID!("CLSID_DirectSound", 0x47d4d946, 0x62e8, 0x11cf, 0x93, 0xbc, 0x44, 0x45, 0x53, 0x54, 0x0, 0x0);
mixin DEFINE_GUID!("CLSID_DirectSound8", 0x3901cc3f, 0x84b5, 0x4fa4, 0xba, 0x35, 0xaa, 0x81, 0x72, 0xb8, 0xa0, 0x9b);
mixin DEFINE_GUID!("CLSID_DirectSoundCapture", 0xb0210780, 0x89cd, 0x11d0, 0xaf, 0x8, 0x0, 0xa0, 0xc9, 0x25, 0xcd, 0x16);
mixin DEFINE_GUID!("CLSID_DirectSoundCapture8", 0xe4bcac13, 0x7f99, 0x4908, 0x9a, 0x8e, 0x74, 0xe3, 0xbf, 0x24, 0xb6, 0xe1);
mixin DEFINE_GUID!("CLSID_DirectSoundFullDuplex", 0xfea4300c, 0x7959, 0x4147, 0xb2, 0x6a, 0x23, 0x77, 0xb9, 0xe7, 0xa9, 0x1d);
mixin DEFINE_GUID!("DSDEVID_DefaultPlayback", 0xdef00000, 0x9c6d, 0x47ed, 0xaa, 0xf1, 0x4d, 0xda, 0x8f, 0x2b, 0x5c, 0x03);
mixin DEFINE_GUID!("DSDEVID_DefaultCapture", 0xdef00001, 0x9c6d, 0x47ed, 0xaa, 0xf1, 0x4d, 0xda, 0x8f, 0x2b, 0x5c, 0x03);
mixin DEFINE_GUID!("DSDEVID_DefaultVoicePlayback", 0xdef00002, 0x9c6d, 0x47ed, 0xaa, 0xf1, 0x4d, 0xda, 0x8f, 0x2b, 0x5c, 0x03);
mixin DEFINE_GUID!("DSDEVID_DefaultVoiceCapture", 0xdef00003, 0x9c6d, 0x47ed, 0xaa, 0xf1, 0x4d, 0xda, 0x8f, 0x2b, 0x5c, 0x03);

//(DIRECTSOUND_VERSION >= 0x0800)
	alias IDirectSoundCapture IDirectSoundCapture8;
	alias IDirectSound3DListener IDirectSound3DListener8;
	alias IDirectSound3DBuffer IDirectSound3DBuffer8;
	alias IDirectSoundNotify IDirectSoundNotify8;
	alias IDirectSoundFXGargle IDirectSoundFXGargle8;
	alias IDirectSoundFXChorus IDirectSoundFXChorus8;
	alias IDirectSoundFXFlanger IDirectSoundFXFlanger8;
	alias IDirectSoundFXEcho IDirectSoundFXEcho8;
	alias IDirectSoundFXDistortion IDirectSoundFXDistortion8;
	alias IDirectSoundFXCompressor IDirectSoundFXCompressor8;
	alias IDirectSoundFXParamEq IDirectSoundFXParamEq8;
	alias IDirectSoundFXWavesReverb IDirectSoundFXWavesReverb8;
	alias IDirectSoundFXI3DL2Reverb IDirectSoundFXI3DL2Reverb8;
	alias IDirectSoundCaptureFXAec IDirectSoundCaptureFXAec8;
	alias IDirectSoundCaptureFXNoiseSuppress IDirectSoundCaptureFXNoiseSuppress8;
	alias IDirectSoundFullDuplex IDirectSoundFullDuplex8;

alias IDirectSound LPDIRECTSOUND;
alias IDirectSoundBuffer LPDIRECTSOUNDBUFFER;
alias IDirectSound3DListener LPDIRECTSOUND3DLISTENER;
alias IDirectSound3DBuffer LPDIRECTSOUND3DBUFFER;
alias IDirectSoundCapture LPDIRECTSOUNDCAPTURE;
alias IDirectSoundCaptureBuffer LPDIRECTSOUNDCAPTUREBUFFER;
alias IDirectSoundNotify LPDIRECTSOUNDNOTIFY;

//(DIRECTSOUND_VERSION >= 0x0800)
	alias IDirectSoundFXGargle LPDIRECTSOUNDFXGARGLE;
	alias IDirectSoundFXChorus LPDIRECTSOUNDFXCHORUS;
	alias IDirectSoundFXFlanger*LPDIRECTSOUNDFXFLANGER;
	alias IDirectSoundFXEcho LPDIRECTSOUNDFXECHO;
	alias IDirectSoundFXDistortion LPDIRECTSOUNDFXDISTORTION;
	alias IDirectSoundFXCompressor LPDIRECTSOUNDFXCOMPRESSOR;
	alias IDirectSoundFXParamEq LPDIRECTSOUNDFXPARAMEQ;
	alias IDirectSoundFXWavesReverb LPDIRECTSOUNDFXWAVESREVERB;
	alias IDirectSoundFXI3DL2Reverb LPDIRECTSOUNDFXI3DL2REVERB;
	alias IDirectSoundCaptureFXAec LPDIRECTSOUNDCAPTUREFXAEC;
	alias IDirectSoundCaptureFXNoiseSuppress LPDIRECTSOUNDCAPTUREFXNOISESUPPRESS;
	//alias IDirectSoundFullDuplex LPDIRECTSOUNDFULLDUPLEX;

	alias IDirectSound8 *LPDIRECTSOUND8;
	alias IDirectSoundBuffer8 *LPDIRECTSOUNDBUFFER8;
	alias IDirectSound3DListener8 *LPDIRECTSOUND3DLISTENER8;
	alias IDirectSound3DBuffer8 *LPDIRECTSOUND3DBUFFER8;
	alias IDirectSoundCapture8 *LPDIRECTSOUNDCAPTURE8;
	alias IDirectSoundCaptureBuffer8 *LPDIRECTSOUNDCAPTUREBUFFER8;
	alias IDirectSoundNotify8 *LPDIRECTSOUNDNOTIFY8;
	alias IDirectSoundFXGargle8 *LPDIRECTSOUNDFXGARGLE8;
	alias IDirectSoundFXChorus8 *LPDIRECTSOUNDFXCHORUS8;
	alias IDirectSoundFXFlanger8 *LPDIRECTSOUNDFXFLANGER8;
	alias IDirectSoundFXEcho8 *LPDIRECTSOUNDFXECHO8;
	alias IDirectSoundFXDistortion8 *LPDIRECTSOUNDFXDISTORTION8;
	alias IDirectSoundFXCompressor8 *LPDIRECTSOUNDFXCOMPRESSOR8;
	alias IDirectSoundFXParamEq8 *LPDIRECTSOUNDFXPARAMEQ8;
	alias IDirectSoundFXWavesReverb8 *LPDIRECTSOUNDFXWAVESREVERB8;
	alias IDirectSoundFXI3DL2Reverb8 *LPDIRECTSOUNDFXI3DL2REVERB8;
	alias IDirectSoundCaptureFXAec8 *LPDIRECTSOUNDCAPTUREFXAEC8;
	alias IDirectSoundCaptureFXNoiseSuppress8 *LPDIRECTSOUNDCAPTUREFXNOISESUPPRESS8;
	alias IDirectSoundFullDuplex8 *LPDIRECTSOUNDFULLDUPLEX8;

//typedef const WAVEFORMATEX *LPCWAVEFORMATEX;
//typedef const GUID *LPCGUID;

alias LPDIRECTSOUND* LPLPDIRECTSOUND;
alias LPDIRECTSOUNDBUFFER* LPLPDIRECTSOUNDBUFFER;
alias LPDIRECTSOUND3DLISTENER* LPLPDIRECTSOUND3DLISTENER;
alias LPDIRECTSOUND3DBUFFER* LPLPDIRECTSOUND3DBUFFER;
alias LPDIRECTSOUNDCAPTURE* LPLPDIRECTSOUNDCAPTURE;
alias LPDIRECTSOUNDCAPTUREBUFFER* LPLPDIRECTSOUNDCAPTUREBUFFER;
alias LPDIRECTSOUNDNOTIFY* LPLPDIRECTSOUNDNOTIFY;

//(DIRECTSOUND_VERSION >= 0x0800)
	alias LPDIRECTSOUND8* LPLPDIRECTSOUND8;
	alias LPDIRECTSOUNDBUFFER8* LPLPDIRECTSOUNDBUFFER8;
	alias LPDIRECTSOUNDCAPTURE8* LPLPDIRECTSOUNDCAPTURE8;
	alias LPDIRECTSOUNDCAPTUREBUFFER8* LPLPDIRECTSOUNDCAPTUREBUFFER8;

struct DSCAPS {
	DWORD dwSize;
	DWORD dwFlags;
	DWORD dwMinSecondarySampleRate;
	DWORD dwMaxSecondarySampleRate;
	DWORD dwPrimaryBuffers;
	DWORD dwMaxHwMixingAllBuffers;
	DWORD dwMaxHwMixingStaticBuffers;
	DWORD dwMaxHwMixingStreamingBuffers;
	DWORD dwFreeHwMixingAllBuffers;
	DWORD dwFreeHwMixingStaticBuffers;
	DWORD dwFreeHwMixingStreamingBuffers;
	DWORD dwMaxHw3DAllBuffers;
	DWORD dwMaxHw3DStaticBuffers;
	DWORD dwMaxHw3DStreamingBuffers;
	DWORD dwFreeHw3DAllBuffers;
	DWORD dwFreeHw3DStaticBuffers;
	DWORD dwFreeHw3DStreamingBuffers;
	DWORD dwTotalHwMemBytes;
	DWORD dwFreeHwMemBytes;
	DWORD dwMaxContigFreeHwMemBytes;
	DWORD dwUnlockTransferRateHwBuffers;
	DWORD dwPlayCpuOverheadSwBuffers;
	DWORD dwReserved1;
	DWORD dwReserved2;
}
alias DSCAPS* LPDSCAPS;
alias const(DSCAPS)* LPCDSCAPS;

struct DSBCAPS {
	DWORD dwSize;
	DWORD dwFlags;
	DWORD dwBufferBytes;
	DWORD dwUnlockTransferRate;
	DWORD dwPlayCpuOverhead;
}
alias DSBCAPS* LPDSBCAPS;
alias const(DSBCAPS)* LPCDSBCAPS;

//(DIRECTSOUND_VERSION >= 0x0800)
	struct DSEFFECTDESC {
		DWORD dwSize;
		DWORD dwFlags;
		GUID guidDSFXClass;
		DWORD_PTR dwReserved1;
		DWORD_PTR dwReserved2;
	}
	alias DSEFFECTDESC* LPDSEFFECTDESC;
	alias const(DSEFFECTDESC)* LPCDSEFFECTDESC;

	enum {
		DSFX_LOCHARDWARE = 0x00000001,
		DSFX_LOCSOFTWARE = 0x00000002,
	}

	enum {
		DSFXR_PRESENT,
		DSFXR_LOCHARDWARE,
		DSFXR_LOCSOFTWARE,
		DSFXR_UNALLOCATED,
		DSFXR_FAILED,
		DSFXR_UNKNOWN,
		DSFXR_SENDLOOP
	}

	struct DSCEFFECTDESC {
		DWORD dwSize;
		DWORD dwFlags;
		GUID guidDSCFXClass;
		GUID guidDSCFXInstance;
		DWORD dwReserved1;
		DWORD dwReserved2;
	}
	alias DSCEFFECTDESC* LPDSCEFFECTDESC;
	alias const(DSCEFFECTDESC)* LPCDSCEFFECTDESC;

	enum {
		DSCFX_LOCHARDWARE  = 0x00000001,
		DSCFX_LOCSOFTWARE  = 0x00000002,
		DSCFXR_LOCHARDWARE = 0x00000010,
		DSCFXR_LOCSOFTWARE = 0x00000020,
	}

struct DSBUFFERDESC {
	DWORD dwSize;
	DWORD dwFlags;
	DWORD dwBufferBytes;
	DWORD dwReserved;
	LPWAVEFORMATEX lpwfxFormat;
	//DIRECTSOUND_VERSION >= 0x0700
		GUID guid3DAlgorithm;
}
alias DSBUFFERDESC* LPDSBUFFERDESC;
alias const(DSBUFFERDESC)* LPCDSBUFFERDESC;

struct DSBUFFERDESC1 {
	DWORD dwSize;
	DWORD dwFlags;
	DWORD dwBufferBytes;
	DWORD dwReserved;
	LPWAVEFORMATEX lpwfxFormat;
}
alias DSBUFFERDESC1* LPDSBUFFERDESC1;
alias const(DSBUFFERDESC1)* LPCDSBUFFERDESC1;

struct DS3DBUFFER {
	DWORD dwSize;
	D3DVECTOR vPosition;
	D3DVECTOR vVelocity;
	DWORD dwInsideConeAngle;
	DWORD dwOutsideConeAngle;
	D3DVECTOR vConeOrientation;
	LONG lConeOutsideVolume;
	D3DVALUE flMinDistance;
	D3DVALUE flMaxDistance;
	DWORD dwMode;
}
alias DS3DBUFFER* LPDS3DBUFFER;
alias const(DS3DBUFFER)* LPCDS3DBUFFER;

struct DS3DLISTENER {
	DWORD dwSize;
	D3DVECTOR vPosition;
	D3DVECTOR vVelocity;
	D3DVECTOR vOrientFront;
	D3DVECTOR vOrientTop;
	D3DVALUE flDistanceFactor;
	D3DVALUE flRolloffFactor;
	D3DVALUE flDopplerFactor;
}
alias DS3DLISTENER* LPDS3DLISTENER;
alias const(DS3DLISTENER)* LPCDS3DLISTENER;

struct DSCCAPS {
	DWORD dwSize;
	DWORD dwFlags;
	DWORD dwFormats;
	DWORD dwChannels;
}
alias DSCCAPS* LPDSCCAPS;
alias const(DSCCAPS)* LPCDSCCAPS;

struct DSCBUFFERDESC1 {
	DWORD dwSize;
	DWORD dwFlags;
	DWORD dwBufferBytes;
	DWORD dwReserved;
	LPWAVEFORMATEX lpwfxFormat;
}
alias DSCBUFFERDESC1* LPDSCBUFFERDESC1;

struct DSCBUFFERDESC {
	DWORD dwSize;
	DWORD dwFlags;
	DWORD dwBufferBytes;
	DWORD dwReserved;
	LPWAVEFORMATEX lpwfxFormat;
	//(DIRECTSOUND_VERSION >= 0x0800)
		DWORD dwFXCount;
		LPDSCEFFECTDESC lpDSCFXDesc;
}
alias DSCBUFFERDESC* LPDSCBUFFERDESC;
alias const(DSCBUFFERDESC)* LPCDSCBUFFERDESC;

struct DSCBCAPS {
	DWORD dwSize;
	DWORD dwFlags;
	DWORD dwBufferBytes;
	DWORD dwReserved;
}
alias DSCBCAPS* LPDSCBCAPS;
alias const(DSCBCAPS)* LPCDSCBCAPS;

struct DSBPOSITIONNOTIFY {
	DWORD dwOffset;
	HANDLE hEventNotify;
}
alias DSBPOSITIONNOTIFY* LPDSBPOSITIONNOTIFY;
alias const(DSBPOSITIONNOTIFY)* LPCDSBPOSITIONNOTIFY;

alias extern(Windows) BOOL function(LPGUID, LPCSTR, LPCSTR, LPVOID) LPDSENUMCALLBACKA;
alias extern(Windows) BOOL function(LPGUID, LPCWSTR, LPCWSTR, LPVOID) LPDSENUMCALLBACKW;

export extern(Windows) HRESULT DirectSoundCreate(LPCGUID pcGuidDevice, LPDIRECTSOUND* ppDS, LPUNKNOWN pUnkOuter);
export extern(Windows) HRESULT DirectSoundEnumerateA(LPDSENUMCALLBACKA pDSEnumCallback, LPVOID pContext);
export extern(Windows) HRESULT DirectSoundEnumerateW(LPDSENUMCALLBACKW pDSEnumCallback, LPVOID pContext);

export extern(Windows) HRESULT DirectSoundCaptureCreate(LPCGUID pcGuidDevice, LPDIRECTSOUNDCAPTURE* ppDSC, LPUNKNOWN pUnkOuter);
export extern(Windows) HRESULT DirectSoundCaptureEnumerateA(LPDSENUMCALLBACKA pDSEnumCallback, LPVOID pContext);
export extern(Windows) HRESULT DirectSoundCaptureEnumerateW(LPDSENUMCALLBACKW pDSEnumCallback, LPVOID pContext);

static if(DIRECTSOUND_VERSION >= 0x0800){
	export extern(Windows) HRESULT DirectSoundCreate8(LPCGUID pcGuidDevice, LPDIRECTSOUND8* ppDS8, LPUNKNOWN pUnkOuter);
	export extern(Windows) HRESULT DirectSoundCaptureCreate8(LPCGUID pcGuidDevice, LPDIRECTSOUNDCAPTURE8* ppDSC8, LPUNKNOWN pUnkOuter);
	export extern(Windows) HRESULT DirectSoundFullDuplexCreate(LPCGUID pcGuidCaptureDevice, LPCGUID pcGuidRenderDevice, LPCDSCBUFFERDESC pcDSCBufferDesc, LPCDSBUFFERDESC pcDSBufferDesc, HWND hWnd, DWORD dwLevel, LPDIRECTSOUNDFULLDUPLEX* ppDSFD, LPDIRECTSOUNDCAPTUREBUFFER8* ppDSCBuffer8, LPDIRECTSOUNDBUFFER8* ppDSBuffer8, LPUNKNOWN pUnkOuter);
	alias DirectSoundFullDuplexCreate DirectSoundFullDuplexCreate8;
	export extern(Windows) HRESULT GetDeviceID(LPCGUID pGuidSrc, LPGUID pGuidDest);
}

version(UNICODE){
	alias LPDSENUMCALLBACKW LPDSENUMCALLBACK;
	alias DirectSoundEnumerateW DirectSoundEnumerate;
	alias DirectSoundCaptureEnumerateW DirectSoundCaptureEnumerate;
}else{
	alias LPDSENUMCALLBACKA LPDSENUMCALLBACK;
	alias DirectSoundEnumerateA DirectSoundEnumerate;
	alias DirectSoundCaptureEnumerateA DirectSoundCaptureEnumerate;
}

alias LONGLONG REFERENCE_TIME;
alias REFERENCE_TIME* LPREFERENCE_TIME;

mixin DEFINE_GUID!("IID_IReferenceClock", 0x56a86897, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70);
interface IReferenceClock : IUnknown {
public extern(Windows):
	HRESULT GetTime(REFERENCE_TIME* pTime);
	HRESULT AdviseTime(REFERENCE_TIME rtBaseTime, REFERENCE_TIME rtStreamTime, HANDLE hEvent, LPDWORD pdwAdviseCookie);
	HRESULT AdvisePeriodic(REFERENCE_TIME rtStartTime, REFERENCE_TIME rtPeriodTime, HANDLE hSemaphore, LPDWORD pdwAdviseCookie);
	HRESULT Unadvise(DWORD dwAdviseCookie);
}

mixin DEFINE_GUID!("IID_IDirectSound", 0x279AFA83, 0x4981, 0x11CE, 0xA5, 0x21, 0x00, 0x20, 0xAF, 0x0B, 0xE5, 0x60);
interface IDirectSound : IUnknown {
public extern(Windows):
	HRESULT CreateSoundBuffer(LPCDSBUFFERDESC pcDSBufferDesc, LPDIRECTSOUNDBUFFER* ppDSBuffer, LPUNKNOWN pUnkOuter);
	HRESULT GetCaps(LPDSCAPS pDSCaps);
	HRESULT DuplicateSoundBuffer(LPDIRECTSOUNDBUFFER pDSBufferOriginal, LPDIRECTSOUNDBUFFER* ppDSBufferDuplicate);
	HRESULT SetCooperativeLevel(HWND hwnd, DWORD dwLevel);
	HRESULT Compact();
	HRESULT GetSpeakerConfig(LPDWORD pdwSpeakerConfig);
	HRESULT SetSpeakerConfig(DWORD dwSpeakerConfig);
	HRESULT Initialize(LPCGUID pcGuidDevice);
}

//(DIRECTSOUND_VERSION >= 0x0800)
	mixin DEFINE_GUID!("IID_IDirectSound8", 0xC50A7E93, 0xF395, 0x4834, 0x9E, 0xF6, 0x7F, 0xA9, 0x9D, 0xE5, 0x09, 0x66);
	interface IDirectSound8 : IDirectSound {
	public extern(Windows):
		HRESULT VerifyCertification(LPDWORD pdwCertified);
	}

mixin DEFINE_GUID!("IID_IDirectSoundBuffer", 0x279AFA85, 0x4981, 0x11CE, 0xA5, 0x21, 0x00, 0x20, 0xAF, 0x0B, 0xE5, 0x60);
interface IDirectSoundBuffer : IUnknown {
public extern(Windows):
	HRESULT GetCaps(LPDSBCAPS pDSBufferCaps);
	HRESULT GetCurrentPosition(LPDWORD pdwCurrentPlayCursor, LPDWORD pdwCurrentWriteCursor);
	HRESULT GetFormat(LPWAVEFORMATEX pwfxFormat, DWORD dwSizeAllocated, LPDWORD pdwSizeWritten);
	HRESULT GetVolume(LPLONG plVolume);
	HRESULT GetPan(LPLONG plPan);
	HRESULT GetFrequency(LPDWORD pdwFrequency);
	HRESULT GetStatus(LPDWORD pdwStatus);
	HRESULT Initialize(LPDIRECTSOUND pDirectSound, LPCDSBUFFERDESC pcDSBufferDesc);
	HRESULT Lock(DWORD dwOffset, DWORD dwBytes, LPVOID* ppvAudioPtr1, LPDWORD pdwAudioBytes1, LPVOID* ppvAudioPtr2, LPDWORD pdwAudioBytes2, DWORD dwFlags);
	HRESULT Play(DWORD dwReserved1, DWORD dwPriority, DWORD dwFlags);
	HRESULT SetCurrentPosition(DWORD dwNewPosition);
	HRESULT SetFormat(LPCWAVEFORMATEX pcfxFormat);
	HRESULT SetVolume(LONG lVolume);
	HRESULT SetPan(LONG lPan);
	HRESULT SetFrequency(DWORD dwFrequency);
	HRESULT Stop();
	HRESULT Unlock(LPVOID pvAudioPtr1, DWORD dwAudioBytes1, LPVOID pvAudioPtr2, DWORD dwAudioBytes2);
	HRESULT Restore();
}

//(DIRECTSOUND_VERSION >= 0x0800)
	mixin DEFINE_GUID!("IID_IDirectSoundBuffer8", 0x6825a449, 0x7524, 0x4d82, 0x92, 0x0f, 0x50, 0xe3, 0x6a, 0xb3, 0xab, 0x1e);
	interface IDirectSoundBuffer8 : IDirectSoundBuffer {
	public extern(Windows):
		HRESULT SetFX(DWORD dwEffectsCount, LPDSEFFECTDESC pDSFXDesc, LPDWORD pdwResultCodes);
		HRESULT AcquireResources(DWORD dwFlags, DWORD dwEffectsCount, LPDWORD pdwResultCodes);
		HRESULT GetObjectInPath(REFGUID rguidObject, DWORD dwIndex, REFGUID rguidInterface, LPVOID* ppObject);
	}
	mixin DEFINE_GUID!("GUID_All_Objects", 0xaa114de5, 0xc262, 0x4169, 0xa1, 0xc8, 0x23, 0xd6, 0x98, 0xcc, 0x73, 0xb5);

mixin DEFINE_GUID!("IID_IDirectSound3DListener", 0x279AFA84, 0x4981, 0x11CE, 0xA5, 0x21, 0x00, 0x20, 0xAF, 0x0B, 0xE5, 0x60);
interface IDirectSound3DListener : IUnknown {
public extern(Windows):
	HRESULT GetAllParameters(LPDS3DLISTENER pListener);
	HRESULT GetDistanceFactor(D3DVALUE* pflDistanceFactor);
	HRESULT GetDopplerFactor(D3DVALUE* pflDopplerFactor);
	HRESULT GetOrientation(D3DVECTOR* pvOrientFront, D3DVECTOR* pvOrientTop);
	HRESULT GetPosition(D3DVECTOR* pvPosition);
	HRESULT GetRolloffFactor(D3DVALUE* pflRolloffFactor);
	HRESULT GetVelocity(D3DVECTOR* pvVelocity);
	HRESULT SetAllParameters(LPCDS3DLISTENER pcListener, DWORD dwApply);
	HRESULT SetDistanceFactor(D3DVALUE flDistanceFactor, DWORD dwApply);
	HRESULT SetDopplerFactor(D3DVALUE flDopplerFactor, DWORD dwApply);
	HRESULT SetOrientation(D3DVALUE xFront, D3DVALUE yFront, D3DVALUE zFront, D3DVALUE xTop, D3DVALUE yTop, D3DVALUE zTop, DWORD dwApply);
	HRESULT SetPosition(D3DVALUE x, D3DVALUE y, D3DVALUE z, DWORD dwApply);
	HRESULT SetRolloffFactor(D3DVALUE flRolloffFactor, DWORD dwApply);
	HRESULT SetVelocity(D3DVALUE x, D3DVALUE y, D3DVALUE z, DWORD dwApply);
	HRESULT CommitDeferredSettings();
}

mixin DEFINE_GUID!("IID_IDirectSound3DBuffer", 0x279AFA86, 0x4981, 0x11CE, 0xA5, 0x21, 0x00, 0x20, 0xAF, 0x0B, 0xE5, 0x60);
interface IDirectSound3DBuffer : IUnknown {
public extern(Windows):
	HRESULT GetAllParameters(LPDS3DBUFFER pDs3dBuffer);
	HRESULT GetConeAngles(LPDWORD pdwInsideConeAngle, LPDWORD pdwOutsideConeAngle);
	HRESULT GetConeOrientation(D3DVECTOR* pvOrientation);
	HRESULT GetConeOutsideVolume(LPLONG plConeOutsideVolume);
	HRESULT GetMaxDistance(D3DVALUE* pflMaxDistance);
	HRESULT GetMinDistance(D3DVALUE* pflMinDistance);
	HRESULT GetMode(LPDWORD pdwMode);
	HRESULT GetPosition(D3DVECTOR* pvPosition);
	HRESULT GetVelocity(D3DVECTOR* pvVelocity);
	HRESULT SetAllParameters(LPCDS3DBUFFER pcDs3dBuffer, DWORD dwApply);
	HRESULT SetConeAngles(DWORD dwInsideConeAngle, DWORD dwOutsideConeAngle, DWORD dwApply);
	HRESULT SetConeOrientation(D3DVALUE x, D3DVALUE y, D3DVALUE z, DWORD dwApply);
	HRESULT SetConeOutsideVolume(LONG lConeOutsideVolume, DWORD dwApply);
	HRESULT SetMaxDistance(D3DVALUE flMaxDistance, DWORD dwApply);
	HRESULT SetMinDistance(D3DVALUE flMinDistance, DWORD dwApply);
	HRESULT SetMode(DWORD dwMode, DWORD dwApply);
	HRESULT SetPosition(D3DVALUE x, D3DVALUE y, D3DVALUE z, DWORD dwApply);
	HRESULT SetVelocity(D3DVALUE x, D3DVALUE y, D3DVALUE z, DWORD dwApply);
}

mixin DEFINE_GUID!("IID_IDirectSoundCapture", 0xb0210781, 0x89cd, 0x11d0, 0xaf, 0x8, 0x0, 0xa0, 0xc9, 0x25, 0xcd, 0x16);
interface IDirectSoundCapture : IUnknown {
public extern(Windows):
	HRESULT CreateCaptureBuffer(LPCDSCBUFFERDESC pcDSCBufferDesc, LPDIRECTSOUNDCAPTUREBUFFER* ppDSCBuffer, LPUNKNOWN pUnkOuter);
	HRESULT GetCaps(LPDSCCAPS pDSCCaps);
	HRESULT Initialize(LPCGUID pcGuidDevice);
}

mixin DEFINE_GUID!("IID_IDirectSoundCaptureBuffer", 0xb0210782, 0x89cd, 0x11d0, 0xaf, 0x8, 0x0, 0xa0, 0xc9, 0x25, 0xcd, 0x16);
interface IDirectSoundCaptureBuffer : IUnknown {
public extern(Windows):
	HRESULT GetCaps(LPDSCBCAPS pDSCBCaps);
	HRESULT GetCurrentPosition(LPDWORD pdwCapturePosition, LPDWORD pdwReadPosition);
	HRESULT GetFormat(LPWAVEFORMATEX pwfxFormat, DWORD dwSizeAllocated, LPDWORD pdwSizeWritten);
	HRESULT GetStatus(LPDWORD pdwStatus);
	HRESULT Initialize(LPDIRECTSOUNDCAPTURE pDirectSoundCapture, LPCDSCBUFFERDESC pcDSCBufferDesc);
	HRESULT Lock(DWORD dwOffset, DWORD dwBytes, LPVOID* ppvAudioPtr1, LPDWORD pdwAudioBytes1, LPVOID* ppvAudioPtr2, LPDWORD pdwAudioBytes2, DWORD dwFlags);
	HRESULT Start(DWORD dwFlags);
	HRESULT Stop();
	HRESULT Unlock(LPVOID pvAudioPtr1, DWORD dwAudioBytes1, LPVOID pvAudioPtr2, DWORD dwAudioBytes2);
}

//(DIRECTSOUND_VERSION >= 0x0800)
	mixin DEFINE_GUID!("IID_IDirectSoundCaptureBuffer8", 0x990df4, 0xdbb, 0x4872, 0x83, 0x3e, 0x6d, 0x30, 0x3e, 0x80, 0xae, 0xb6);
	interface IDirectSoundCaptureBuffer8 : IDirectSoundCaptureBuffer {
	public extern(Windows):
		HRESULT GetObjectInPath(REFGUID rguidObject, DWORD dwIndex, REFGUID rguidInterface, LPVOID* ppObject);
		HRESULT GetFXStatus(DWORD dwEffectsCount, LPDWORD pdwFXStatus);
	}

mixin DEFINE_GUID!("IID_IDirectSoundNotify", 0xb0210783, 0x89cd, 0x11d0, 0xaf, 0x8, 0x0, 0xa0, 0xc9, 0x25, 0xcd, 0x16);
interface IDirectSoundNotify : IUnknown {
public extern(Windows):
	HRESULT SetNotificationPositions(DWORD dwPositionNotifies, LPCDSBPOSITIONNOTIFY pcPositionNotifies);
}

enum {
	KSPROPERTY_SUPPORT_GET = 0x00000001,
	KSPROPERTY_SUPPORT_SET = 0x00000002,
}
mixin DEFINE_GUID!("IID_IKsPropertySet", 0x31efac30, 0x515c, 0x11d0, 0xa9, 0xaa, 0x00, 0xaa, 0x00, 0x61, 0xbe, 0x93);
interface IKsPropertySet : IUnknown {
public extern(Windows):
	HRESULT Get(REFGUID rguidPropSet, ULONG ulId, LPVOID pInstanceData, ULONG ulInstanceLength, LPVOID pPropertyData, ULONG ulDataLength, PULONG pulBytesReturned);
	HRESULT Set(REFGUID rguidPropSet, ULONG ulId, LPVOID pInstanceData, ULONG ulInstanceLength, LPVOID pPropertyData, ULONG ulDataLength);
	HRESULT QuerySupport(REFGUID rguidPropSet, ULONG ulId, PULONG pulTypeSupport);
}
alias IKsPropertySet LPKSPROPERTYSET;

//(DIRECTSOUND_VERSION >= 0x0800)
	mixin DEFINE_GUID!("IID_IDirectSoundFXGargle", 0xd616f352, 0xd622, 0x11ce, 0xaa, 0xc5, 0x00, 0x20, 0xaf, 0x0b, 0x99, 0xa3);
	struct DSFXGargle {
		DWORD dwRateHz;
		DWORD dwWaveShape;
	}
	alias DSFXGargle* LPDSFXGargle;
	alias const(DSFXGargle)* LPCDSFXGargle;

	enum {
		DSFXGARGLE_WAVE_TRIANGLE = 0,
		DSFXGARGLE_WAVE_SQUARE   = 1,
		DSFXGARGLE_RATEHZ_MIN    = 1,
		DSFXGARGLE_RATEHZ_MAX    = 1000,
	}

	interface IDirectSoundFXGargle : IUnknown {
	public extern(Windows):
		HRESULT SetAllParameters(LPCDSFXGargle pcDsFxGargle);
		HRESULT GetAllParameters(LPDSFXGargle pDsFxGargle);
	}

	mixin DEFINE_GUID!("IID_IDirectSoundFXChorus", 0x880842e3, 0x145f, 0x43e6, 0xa9, 0x34, 0xa7, 0x18, 0x06, 0xe5, 0x05, 0x47);
	struct DSFXChorus {
		FLOAT fWetDryMix;
		FLOAT fDepth;
		FLOAT fFeedback;
		FLOAT fFrequency;
		LONG lWaveform;
		FLOAT fDelay;
		LONG lPhase;
	}
	alias DSFXChorus* LPDSFXChorus;
	alias const(DSFXChorus)* LPCDSFXChorus;

	enum {
		DSFXCHORUS_WAVE_TRIANGLE = 0,
		DSFXCHORUS_WAVE_SIN      = 1,
		DSFXCHORUS_WETDRYMIX_MIN = 0.0f,
		DSFXCHORUS_WETDRYMIX_MAX = 100.0f,
		DSFXCHORUS_DEPTH_MIN     = 0.0f,
		DSFXCHORUS_DEPTH_MAX     = 100.0f,
		DSFXCHORUS_FEEDBACK_MIN  = -99.0f,
		DSFXCHORUS_FEEDBACK_MAX  = 99.0f,
		DSFXCHORUS_FREQUENCY_MIN = 0.0f,
		DSFXCHORUS_FREQUENCY_MAX = 10.0f,
		DSFXCHORUS_DELAY_MIN     = 0.0f,
		DSFXCHORUS_DELAY_MAX     = 20.0f,
		DSFXCHORUS_PHASE_MIN     = 0,
		DSFXCHORUS_PHASE_MAX     = 4,
		DSFXCHORUS_PHASE_NEG_180 = 0,
		DSFXCHORUS_PHASE_NEG_90  = 1,
		DSFXCHORUS_PHASE_ZERO    = 2,
		DSFXCHORUS_PHASE_90      = 3,
		DSFXCHORUS_PHASE_180     = 4,
	}

	interface IDirectSoundFXChorus : IUnknown {
	public extern(Windows):
		HRESULT SetAllParameters(LPCDSFXChorus pcDsFxChorus);
		HRESULT GetAllParameters(LPDSFXChorus pDsFxChorus);
	}

	mixin DEFINE_GUID!("IID_IDirectSoundFXFlanger", 0x903e9878, 0x2c92, 0x4072, 0x9b, 0x2c, 0xea, 0x68, 0xf5, 0x39, 0x67, 0x83);
	struct DSFXFlanger {
		FLOAT fWetDryMix;
		FLOAT fDepth;
		FLOAT fFeedback;
		FLOAT fFrequency;
		LONG lWaveform;
		FLOAT fDelay;
		LONG lPhase;
	}
	alias DSFXFlanger* LPDSFXFlanger;
	alias const(DSFXFlanger)* LPCDSFXFlanger;

	enum {
		DSFXFLANGER_WAVE_TRIANGLE = 0,
		DSFXFLANGER_WAVE_SIN      = 1,
		DSFXFLANGER_WETDRYMIX_MIN = 0.0f,
		DSFXFLANGER_WETDRYMIX_MAX = 100.0f,
		DSFXFLANGER_FREQUENCY_MIN = 0.0f,
		DSFXFLANGER_FREQUENCY_MAX = 10.0f,
		DSFXFLANGER_DEPTH_MIN     = 0.0f,
		DSFXFLANGER_DEPTH_MAX     = 100.0f,
		DSFXFLANGER_PHASE_MIN     = 0,
		DSFXFLANGER_PHASE_MAX     = 4,
		DSFXFLANGER_FEEDBACK_MIN  = -99.0f,
		DSFXFLANGER_FEEDBACK_MAX  = 99.0f,
		DSFXFLANGER_DELAY_MIN     = 0.0f,
		DSFXFLANGER_DELAY_MAX     = 4.0f,
		DSFXFLANGER_PHASE_NEG_180 = 0,
		DSFXFLANGER_PHASE_NEG_90  = 1,
		DSFXFLANGER_PHASE_ZERO    = 2,
		DSFXFLANGER_PHASE_90      = 3,
		DSFXFLANGER_PHASE_180     = 4,
	}

	interface IDirectSoundFXFlanger : IUnknown {
	public extern(Windows):
		HRESULT SetAllParameters(LPCDSFXFlanger pcDsFxFlanger);
		HRESULT GetAllParameters(LPDSFXFlanger pDsFxFlanger);
	}

	mixin DEFINE_GUID!("IID_IDirectSoundFXEcho", 0x8bd28edf, 0x50db, 0x4e92, 0xa2, 0xbd, 0x44, 0x54, 0x88, 0xd1, 0xed, 0x42);
	struct DSFXEcho {
		FLOAT fWetDryMix;
		FLOAT fFeedback;
		FLOAT fLeftDelay;
		FLOAT fRightDelay;
		LONG lPanDelay;
	}
	alias DSFXEcho* LPDSFXEcho;
	alias const(DSFXEcho)* LPCDSFXEcho;

	const float DSFXECHO_WETDRYMIX_MIN = 0.0f;
	const float DSFXECHO_WETDRYMIX_MAX = 100.0f;
	const float DSFXECHO_FEEDBACK_MIN = 0.0f;
	const float DSFXECHO_FEEDBACK_MAX = 100.0f;
	const float DSFXECHO_LEFTDELAY_MIN = 1.0f;
	const float DSFXECHO_LEFTDELAY_MAX = 2000.0f;
	const float DSFXECHO_RIGHTDELAY_MIN = 1.0f;
	const float DSFXECHO_RIGHTDELAY_MAX = 2000.0f;
	enum {
		DSFXECHO_PANDELAY_MIN = 0,
		DSFXECHO_PANDELAY_MAX = 1,
	}

	interface IDirectSoundFXEcho : IUnknown {
	public extern(Windows):
		HRESULT SetAllParameters(LPCDSFXEcho pcDsFxEcho);
		HRESULT GetAllParameters(LPDSFXEcho pDsFxEcho);
	}

	mixin DEFINE_GUID!("IID_IDirectSoundFXDistortion", 0x8ecf4326, 0x455f, 0x4d8b, 0xbd, 0xa9, 0x8d, 0x5d, 0x3e, 0x9e, 0x3e, 0x0b);

	struct DSFXDistortion {
		FLOAT fGain;
		FLOAT fEdge;
		FLOAT fPostEQCenterFrequency;
		FLOAT fPostEQBandwidth;
		FLOAT fPreLowpassCutoff;
	}
	alias DSFXDistortion* LPDSFXDistortion;
	alias const(DSFXDistortion)* LPCDSFXDistortion;

	const float DSFXDISTORTION_GAIN_MIN = -60.0f;
	const float DSFXDISTORTION_GAIN_MAX = 0.0f;
	const float DSFXDISTORTION_EDGE_MIN = 0.0f;
	const float DSFXDISTORTION_EDGE_MAX = 100.0f;
	const float DSFXDISTORTION_POSTEQCENTERFREQUENCY_MIN = 100.0f;
	const float DSFXDISTORTION_POSTEQCENTERFREQUENCY_MAX = 8000.0f;
	const float DSFXDISTORTION_POSTEQBANDWIDTH_MIN = 100.0f;
	const float DSFXDISTORTION_POSTEQBANDWIDTH_MAX = 8000.0f;
	const float DSFXDISTORTION_PRELOWPASSCUTOFF_MIN = 100.0f;
	const float DSFXDISTORTION_PRELOWPASSCUTOFF_MAX = 8000.0f;

	interface IDirectSoundFXDistortion : IUnknown {
	public extern(Windows):
		HRESULT SetAllParameters(LPCDSFXDistortion pcDsFxDistortion);
		HRESULT GetAllParameters(LPDSFXDistortion pDsFxDistortion);
	};

	mixin DEFINE_GUID!("IID_IDirectSoundFXCompressor", 0x4bbd1154, 0x62f6, 0x4e2c, 0xa1, 0x5c, 0xd3, 0xb6, 0xc4, 0x17, 0xf7, 0xa0);
	struct DSFXCompressor {
		FLOAT fGain;
		FLOAT fAttack;
		FLOAT fRelease;
		FLOAT fThreshold;
		FLOAT fRatio;
		FLOAT fPredelay;
	}
	alias DSFXCompressor* LPDSFXCompressor;
	alias const(DSFXCompressor)* LPCDSFXCompressor;

	const float DSFXCOMPRESSOR_GAIN_MIN = -60.0f;
	const float DSFXCOMPRESSOR_GAIN_MAX = 60.0f;
	const float DSFXCOMPRESSOR_ATTACK_MIN = 0.01f;
	const float DSFXCOMPRESSOR_ATTACK_MAX = 500.0f;
	const float DSFXCOMPRESSOR_RELEASE_MIN = 50.0f;
	const float DSFXCOMPRESSOR_RELEASE_MAX = 3000.0f;
	const float DSFXCOMPRESSOR_THRESHOLD_MIN = -60.0f;
	const float DSFXCOMPRESSOR_THRESHOLD_MAX = 0.0f;
	const float DSFXCOMPRESSOR_RATIO_MIN = 1.0f;
	const float DSFXCOMPRESSOR_RATIO_MAX = 100.0f;
	const float DSFXCOMPRESSOR_PREDELAY_MIN = 0.0f;
	const float DSFXCOMPRESSOR_PREDELAY_MAX = 4.0f;

	interface IDirectSoundFXCompressor : IUnknown {
	public extern(Windows):
		HRESULT SetAllParameters(LPCDSFXCompressor pcDsFxCompressor);
		HRESULT GetAllParameters(LPDSFXCompressor pDsFxCompressor);
	}

	mixin DEFINE_GUID!("IID_IDirectSoundFXParamEq", 0xc03ca9fe, 0xfe90, 0x4204, 0x80, 0x78, 0x82, 0x33, 0x4c, 0xd1, 0x77, 0xda);
	struct DSFXParamEq {
		FLOAT fCenter;
		FLOAT fBandwidth;
		FLOAT fGain;
	}
	alias DSFXParamEq* LPDSFXParamEq;
	alias const(DSFXParamEq)* LPCDSFXParamEq;

	const float DSFXPARAMEQ_CENTER_MIN = 80.0f;
	const float DSFXPARAMEQ_CENTER_MAX = 16000.0f;
	const float DSFXPARAMEQ_BANDWIDTH_MIN = 1.0f;
	const float DSFXPARAMEQ_BANDWIDTH_MAX = 36.0f;
	const float DSFXPARAMEQ_GAIN_MIN = -15.0f;
	const float DSFXPARAMEQ_GAIN_MAX = 15.0f;

	interface IDirectSoundFXParamEq : IUnknown {
	public extern(Windows):
		HRESULT SetAllParameters(LPCDSFXParamEq pcDsFxParamEq);
		HRESULT GetAllParameters(LPDSFXParamEq pDsFxParamEq);
	}

	mixin DEFINE_GUID!("IID_IDirectSoundFXI3DL2Reverb", 0x4b166a6a, 0x0d66, 0x43f3, 0x80, 0xe3, 0xee, 0x62, 0x80, 0xde, 0xe1, 0xa4);
	struct DSFXI3DL2Reverb {
		LONG lRoom;
		LONG lRoomHF;
		FLOAT flRoomRolloffFactor;
		FLOAT flDecayTime;
		FLOAT flDecayHFRatio;
		LONG lReflections;
		FLOAT flReflectionsDelay;
		LONG lReverb;
		FLOAT flReverbDelay;
		FLOAT flDiffusion;
		FLOAT flDensity;
		FLOAT flHFReference;
	}
	alias DSFXI3DL2Reverb* LPDSFXI3DL2Reverb;
	alias const(DSFXI3DL2Reverb)* LPCDSFXI3DL2Reverb;

	enum {
		DSFX_I3DL2REVERB_ROOM_MIN       = -10000,
		DSFX_I3DL2REVERB_ROOM_MAX       = 0,
		DSFX_I3DL2REVERB_ROOM_DEFAULT   = -1000,
		DSFX_I3DL2REVERB_ROOMHF_MIN     = -10000,
		DSFX_I3DL2REVERB_ROOMHF_MAX     = 0,
		DSFX_I3DL2REVERB_ROOMHF_DEFAULT = -100,
	}

	const float DSFX_I3DL2REVERB_ROOMROLLOFFFACTOR_MIN = 0.0f;
	const float DSFX_I3DL2REVERB_ROOMROLLOFFFACTOR_MAX = 10.0f;
	const float DSFX_I3DL2REVERB_ROOMROLLOFFFACTOR_DEFAULT = 0.0f;
	const float DSFX_I3DL2REVERB_DECAYTIME_MIN = 0.1f;
	const float DSFX_I3DL2REVERB_DECAYTIME_MAX = 20.0f;
	const float DSFX_I3DL2REVERB_DECAYTIME_DEFAULT = 1.49f;
	const float DSFX_I3DL2REVERB_DECAYHFRATIO_MIN = 0.1f;
	const float DSFX_I3DL2REVERB_DECAYHFRATIO_MAX = 2.0f;
	const float DSFX_I3DL2REVERB_DECAYHFRATIO_DEFAULT = 0.83f;

	enum {
		DSFX_I3DL2REVERB_REFLECTIONS_MIN     = -10000,
		DSFX_I3DL2REVERB_REFLECTIONS_MAX     = 1000,
		DSFX_I3DL2REVERB_REFLECTIONS_DEFAULT = -2602,
	}

	const float DSFX_I3DL2REVERB_REFLECTIONSDELAY_MIN = 0.0f;
	const float DSFX_I3DL2REVERB_REFLECTIONSDELAY_MAX = 0.3f;
	const float DSFX_I3DL2REVERB_REFLECTIONSDELAY_DEFAULT = 0.007f;

	enum {
		DSFX_I3DL2REVERB_REVERB_MIN     = -10000,
		DSFX_I3DL2REVERB_REVERB_MAX     = 2000,
		DSFX_I3DL2REVERB_REVERB_DEFAULT = 200,
	}

	const float DSFX_I3DL2REVERB_REVERBDELAY_MIN = 0.0f;
	const float DSFX_I3DL2REVERB_REVERBDELAY_MAX = 0.1f;
	const float DSFX_I3DL2REVERB_REVERBDELAY_DEFAULT = 0.011f;
	const float DSFX_I3DL2REVERB_DIFFUSION_MIN = 0.0f;
	const float DSFX_I3DL2REVERB_DIFFUSION_MAX = 100.0f;
	const float DSFX_I3DL2REVERB_DIFFUSION_DEFAULT = 100.0f;
	const float DSFX_I3DL2REVERB_DENSITY_MIN = 0.0f;
	const float DSFX_I3DL2REVERB_DENSITY_MAX = 100.0f;
	const float DSFX_I3DL2REVERB_DENSITY_DEFAULT = 100.0f;
	const float DSFX_I3DL2REVERB_HFREFERENCE_MIN = 20.0f;
	const float DSFX_I3DL2REVERB_HFREFERENCE_MAX = 20000.0f;
	const float DSFX_I3DL2REVERB_HFREFERENCE_DEFAULT = 5000.0f;

	enum {
		DSFX_I3DL2REVERB_QUALITY_MIN     = 0,
		DSFX_I3DL2REVERB_QUALITY_MAX     = 3,
		DSFX_I3DL2REVERB_QUALITY_DEFAULT = 2,
	}

	interface IDirectSoundFXI3DL2Reverb : IUnknown {
	public extern(Windows):
		HRESULT SetAllParameters(LPCDSFXI3DL2Reverb pcDsFxI3DL2Reverb);
		HRESULT GetAllParameters(LPDSFXI3DL2Reverb pDsFxI3DL2Reverb);
		HRESULT SetPreset(DWORD dwPreset);
		HRESULT GetPreset(LPDWORD pdwPreset);
		HRESULT SetQuality(LONG lQuality);
		HRESULT GetQuality(LONG* plQuality);
	}

	mixin DEFINE_GUID!("IID_IDirectSoundFXWavesReverb", 0x46858c3a,0x0dc6,0x45e3,0xb7,0x60,0xd4,0xee,0xf1,0x6c,0xb3,0x25);
	struct DSFXWavesReverb {
		FLOAT fInGain;
		FLOAT fReverbMix;
		FLOAT fReverbTime;
		FLOAT fHighFreqRTRatio;
	}
	alias DSFXWavesReverb* LPDSFXWavesReverb;
	alias const(DSFXWavesReverb)* LPCDSFXWavesReverb;

	const float DSFX_WAVESREVERB_INGAIN_MIN = -96.0f;
	const float DSFX_WAVESREVERB_INGAIN_MAX = 0.0f;
	const float DSFX_WAVESREVERB_INGAIN_DEFAULT = 0.0f;
	const float DSFX_WAVESREVERB_REVERBMIX_MIN = -96.0f;
	const float DSFX_WAVESREVERB_REVERBMIX_MAX = 0.0f;
	const float DSFX_WAVESREVERB_REVERBMIX_DEFAULT = 0.0f;
	const float DSFX_WAVESREVERB_REVERBTIME_MIN = 0.001f;
	const float DSFX_WAVESREVERB_REVERBTIME_MAX = 3000.0f;
	const float DSFX_WAVESREVERB_REVERBTIME_DEFAULT = 1000.0f;
	const float DSFX_WAVESREVERB_HIGHFREQRTRATIO_MIN = 0.001f;
	const float DSFX_WAVESREVERB_HIGHFREQRTRATIO_MAX = 0.999f;
	const float DSFX_WAVESREVERB_HIGHFREQRTRATIO_DEFAULT = 0.001f;

	interface IDirectSoundFXWavesReverb : IUnknown {
	public extern(Windows):
		HRESULT SetAllParameters(LPCDSFXWavesReverb pcDsFxWavesReverb);
		HRESULT GetAllParameters(LPDSFXWavesReverb pDsFxWavesReverb);
	}

	mixin DEFINE_GUID!("IID_IDirectSoundCaptureFXAec", 0xad74143d, 0x903d, 0x4ab7, 0x80, 0x66, 0x28, 0xd3, 0x63, 0x03, 0x6d, 0x65);
	struct DSCFXAec {
		BOOL fEnable;
		BOOL fNoiseFill;
		DWORD dwMode;
	}
	alias DSCFXAec* LPDSCFXAec;
	alias const(DSCFXAec)* LPCDSCFXAec;

	enum {
		DSCFX_AEC_MODE_PASS_THROUGH                     = 0x0,
		DSCFX_AEC_MODE_HALF_DUPLEX                      = 0x1,
		DSCFX_AEC_MODE_FULL_DUPLEX                      = 0x2,
		DSCFX_AEC_STATUS_HISTORY_UNINITIALIZED          = 0x0,
		DSCFX_AEC_STATUS_HISTORY_CONTINUOUSLY_CONVERGED = 0x1,
		DSCFX_AEC_STATUS_HISTORY_PREVIOUSLY_DIVERGED    = 0x2,
		DSCFX_AEC_STATUS_CURRENTLY_CONVERGED            = 0x8,
	}

	interface IDirectSoundCaptureFXAec : IUnknown {
	public extern(Windows):
		HRESULT SetAllParameters(LPCDSCFXAec pDscFxAec);
		HRESULT GetAllParameters(LPDSCFXAec pDscFxAec);
		HRESULT GetStatus(LPDWORD pdwStatus);
		HRESULT Reset();
	}

	mixin DEFINE_GUID!("IID_IDirectSoundCaptureFXNoiseSuppress", 0xed311e41, 0xfbae, 0x4175, 0x96, 0x25, 0xcd, 0x8, 0x54, 0xf6, 0x93, 0xca);
	struct DSCFXNoiseSuppress {
		BOOL fEnable;
	}
	alias DSCFXNoiseSuppress* LPDSCFXNoiseSuppress;
	alias const(DSCFXNoiseSuppress)* LPCDSCFXNoiseSuppress;

	interface IDirectSoundCaptureFXNoiseSuppress : IUnknown {
	public extern(Windows):
		HRESULT SetAllParameters(LPCDSCFXNoiseSuppress pcDscFxNoiseSuppress);
		HRESULT GetAllParameters(LPDSCFXNoiseSuppress pDscFxNoiseSuppress);
		HRESULT Reset();
	}

	mixin DEFINE_GUID!("IID_IDirectSoundFullDuplex", 0xedcb4c7a, 0xdaab, 0x4216, 0xa4, 0x2e, 0x6c, 0x50, 0x59, 0x6d, 0xdc, 0x1d);
	interface IDirectSoundFullDuplex : IUnknown {
	public extern(Windows):
		HRESULT Initialize(LPCGUID pCaptureGuid, LPCGUID pRenderGuid, LPCDSCBUFFERDESC lpDscBufferDesc, LPCDSBUFFERDESC lpDsBufferDesc, HWND hWnd, DWORD dwLevel, LPLPDIRECTSOUNDCAPTUREBUFFER8 lplpDirectSoundCaptureBuffer8, LPLPDIRECTSOUNDBUFFER8 lplpDirectSoundBuffer8);
	}
	alias IDirectSoundFullDuplex LPDIRECTSOUNDFULLDUPLEX;

enum {
	DS_OK                    = S_OK,
	DS_NO_VIRTUALIZATION     = MAKE_HRESULT(0, _FACDS, 10),
	DSERR_ALLOCATED          = MAKE_DSHRESULT(10),
	DSERR_CONTROLUNAVAIL     = MAKE_DSHRESULT(30),
	DSERR_INVALIDPARAM       = E_INVALIDARG,
	DSERR_INVALIDCALL        = MAKE_DSHRESULT(50),
	DSERR_GENERIC            = E_FAIL,
	DSERR_PRIOLEVELNEEDED    = MAKE_DSHRESULT(70),
	DSERR_OUTOFMEMORY        = E_OUTOFMEMORY,
	DSERR_BADFORMAT          = MAKE_DSHRESULT(100),
	DSERR_UNSUPPORTED        = E_NOTIMPL,
	DSERR_NODRIVER           = MAKE_DSHRESULT(120),
	DSERR_ALREADYINITIALIZED = MAKE_DSHRESULT(130),
	DSERR_NOAGGREGATION      = CLASS_E_NOAGGREGATION,
	DSERR_BUFFERLOST         = MAKE_DSHRESULT(150),
	DSERR_OTHERAPPHASPRIO    = MAKE_DSHRESULT(160),
	DSERR_UNINITIALIZED      = MAKE_DSHRESULT(170),
	DSERR_NOINTERFACE        = E_NOINTERFACE,
	DSERR_ACCESSDENIED       = E_ACCESSDENIED,
	DSERR_BUFFERTOOSMALL     = MAKE_DSHRESULT(180),
	DSERR_DS8_REQUIRED       = MAKE_DSHRESULT(190),
	DSERR_SENDLOOP           = MAKE_DSHRESULT(200),
	DSERR_BADSENDBUFFERGUID  = MAKE_DSHRESULT(210),
	DSERR_OBJECTNOTFOUND     = MAKE_DSHRESULT(4449),
	DSERR_FXUNAVAILABLE      = MAKE_DSHRESULT(220),
}

enum {
	DSCAPS_PRIMARYMONO         = 0x00000001,
	DSCAPS_PRIMARYSTEREO       = 0x00000002,
	DSCAPS_PRIMARY8BIT         = 0x00000004,
	DSCAPS_PRIMARY16BIT        = 0x00000008,
	DSCAPS_CONTINUOUSRATE      = 0x00000010,
	DSCAPS_EMULDRIVER          = 0x00000020,
	DSCAPS_CERTIFIED           = 0x00000040,
	DSCAPS_SECONDARYMONO       = 0x00000100,
	DSCAPS_SECONDARYSTEREO     = 0x00000200,
	DSCAPS_SECONDARY8BIT       = 0x00000400,
	DSCAPS_SECONDARY16BIT      = 0x00000800,
	DSSCL_NORMAL               = 0x00000001,
	DSSCL_PRIORITY             = 0x00000002,
	DSSCL_EXCLUSIVE            = 0x00000003,
	DSSCL_WRITEPRIMARY         = 0x00000004,
	DSSPEAKER_DIRECTOUT        = 0x00000000,
	DSSPEAKER_HEADPHONE        = 0x00000001,
	DSSPEAKER_MONO             = 0x00000002,
	DSSPEAKER_QUAD             = 0x00000003,
	DSSPEAKER_STEREO           = 0x00000004,
	DSSPEAKER_SURROUND         = 0x00000005,
	DSSPEAKER_5POINT1          = 0x00000006,
	DSSPEAKER_7POINT1          = 0x00000007,
	DSSPEAKER_7POINT1_SURROUND = 0x00000008,
	DSSPEAKER_5POINT1_SURROUND = 0x00000009,
	DSSPEAKER_7POINT1_WIDE     = DSSPEAKER_7POINT1,
	DSSPEAKER_5POINT1_BACK     = DSSPEAKER_5POINT1,
	DSSPEAKER_GEOMETRY_MIN     = 0x00000005,
	DSSPEAKER_GEOMETRY_NARROW  = 0x0000000A,
	DSSPEAKER_GEOMETRY_WIDE    = 0x00000014,
	DSSPEAKER_GEOMETRY_MAX     = 0x000000B4,
}

/*
DSSPEAKER_COMBINED(c, g) ((DWORD)(((BYTE)(c)) | ((DWORD)((BYTE)(g))) << 16))
DSSPEAKER_CONFIG(a) ((BYTE)(a))
DSSPEAKER_GEOMETRY(a) ((BYTE)(((DWORD)(a) >> 16) & 0x00FF))
*/

enum {
	DSBCAPS_PRIMARYBUFFER        = 0x00000001,
	DSBCAPS_STATIC               = 0x00000002,
	DSBCAPS_LOCHARDWARE          = 0x00000004,
	DSBCAPS_LOCSOFTWARE          = 0x00000008,
	DSBCAPS_CTRL3D               = 0x00000010,
	DSBCAPS_CTRLFREQUENCY        = 0x00000020,
	DSBCAPS_CTRLPAN              = 0x00000040,
	DSBCAPS_CTRLVOLUME           = 0x00000080,
	DSBCAPS_CTRLPOSITIONNOTIFY   = 0x00000100,
	DSBCAPS_CTRLFX               = 0x00000200,
	DSBCAPS_STICKYFOCUS          = 0x00004000,
	DSBCAPS_GLOBALFOCUS          = 0x00008000,
	DSBCAPS_GETCURRENTPOSITION2  = 0x00010000,
	DSBCAPS_MUTE3DATMAXDISTANCE  = 0x00020000,
	DSBCAPS_LOCDEFER             = 0x00040000,
	DSBCAPS_TRUEPLAYPOSITION     = 0x00080000,
	DSBPLAY_LOOPING              = 0x00000001,
	DSBPLAY_LOCHARDWARE          = 0x00000002,
	DSBPLAY_LOCSOFTWARE          = 0x00000004,
	DSBPLAY_TERMINATEBY_TIME     = 0x00000008,
	DSBPLAY_TERMINATEBY_DISTANCE = 0x000000010,
	DSBPLAY_TERMINATEBY_PRIORITY = 0x000000020,
	DSBSTATUS_PLAYING            = 0x00000001,
	DSBSTATUS_BUFFERLOST         = 0x00000002,
	DSBSTATUS_LOOPING            = 0x00000004,
	DSBSTATUS_LOCHARDWARE        = 0x00000008,
	DSBSTATUS_LOCSOFTWARE        = 0x00000010,
	DSBSTATUS_TERMINATED         = 0x00000020,
	DSBLOCK_FROMWRITECURSOR      = 0x00000001,
	DSBLOCK_ENTIREBUFFER         = 0x00000002,
}

enum {
	DSBFREQUENCY_ORIGINAL = 0,
	DSBFREQUENCY_MIN      = 100,
//(DIRECTSOUND_VERSION >= 0x0900)
		DSBFREQUENCY_MAX = 200000
}

enum {
	DSBPAN_LEFT           = -10000,
	DSBPAN_CENTER         = 0,
	DSBPAN_RIGHT          = 10000,
	DSBVOLUME_MIN         = -10000,
	DSBVOLUME_MAX         = 0,
	DSBSIZE_MIN           = 4,
	DSBSIZE_MAX           = 0x0FFFFFFF,
	DSBSIZE_FX_MIN        = 150,
	DSBNOTIFICATIONS_MAX  = 100000U,
	DS3DMODE_NORMAL       = 0x00000000,
	DS3DMODE_HEADRELATIVE = 0x00000001,
	DS3DMODE_DISABLE      = 0x00000002,
	DS3D_IMMEDIATE        = 0x00000000,
	DS3D_DEFERRED         = 0x00000001,
}

const float DS3D_MINDISTANCEFACTOR = float.min_normal;
const float DS3D_MAXDISTANCEFACTOR = float.max;
const float DS3D_DEFAULTDISTANCEFACTOR = 1.0f;
const float DS3D_MINROLLOFFFACTOR = 0.0f;
const float DS3D_MAXROLLOFFFACTOR = 10.0f;
const float DS3D_DEFAULTROLLOFFFACTOR = 1.0f;
const float DS3D_MINDOPPLERFACTOR = 0.0f;
const float DS3D_MAXDOPPLERFACTOR = 10.0f;
const float DS3D_DEFAULTDOPPLERFACTOR = 1.0f;
const float DS3D_DEFAULTMINDISTANCE = 1.0f;
const float DS3D_DEFAULTMAXDISTANCE = 1000000000.0f;

enum {
	DS3D_MINCONEANGLE             = 0,
	DS3D_MAXCONEANGLE             = 360,
	DS3D_DEFAULTCONEANGLE         = 360,
	DS3D_DEFAULTCONEOUTSIDEVOLUME = DSBVOLUME_MAX,
	DSCCAPS_EMULDRIVER            = DSCAPS_EMULDRIVER,
	DSCCAPS_CERTIFIED             = DSCAPS_CERTIFIED,
	DSCCAPS_MULTIPLECAPTURE       = 0x00000001,
	DSCBCAPS_WAVEMAPPED           = 0x80000000,
//DIRECTSOUND_VERSION >= 0x0800
		DSCBCAPS_CTRLFX = 0x00000200,
	DSCBLOCK_ENTIREBUFFER = 0x00000001,
	DSCBSTATUS_CAPTURING  = 0x00000001,
	DSCBSTATUS_LOOPING    = 0x00000002,
	DSCBSTART_LOOPING     = 0x00000001,
	DSBPN_OFFSETSTOP      = 0xFFFFFFFF,
	DS_CERTIFIED          = 0x00000000,
	DS_UNCERTIFIED        = 0x00000001,
}

enum {
	DSFX_I3DL2_MATERIAL_PRESET_SINGLEWINDOW,
	DSFX_I3DL2_MATERIAL_PRESET_DOUBLEWINDOW,
	DSFX_I3DL2_MATERIAL_PRESET_THINDOOR,
	DSFX_I3DL2_MATERIAL_PRESET_THICKDOOR,
	DSFX_I3DL2_MATERIAL_PRESET_WOODWALL,
	DSFX_I3DL2_MATERIAL_PRESET_BRICKWALL,
	DSFX_I3DL2_MATERIAL_PRESET_STONEWALL,
	DSFX_I3DL2_MATERIAL_PRESET_CURTAIN
}

/*
const I3DL2_MATERIAL_PRESET_SINGLEWINDOW = {-2800,0.71f};
const I3DL2_MATERIAL_PRESET_DOUBLEWINDOW = {-5000,0.40f};
const I3DL2_MATERIAL_PRESET_THINDOOR = {-1800,0.66f};
const I3DL2_MATERIAL_PRESET_THICKDOOR = {-4400,0.64f};
const I3DL2_MATERIAL_PRESET_WOODWALL = {-4000,0.50f};
const I3DL2_MATERIAL_PRESET_BRICKWALL = {-5000,0.60f};
const I3DL2_MATERIAL_PRESET_STONEWALL = {-6000,0.68f};
const I3DL2_MATERIAL_PRESET_CURTAIN = {-1200, 0.15f};
*/

enum {
	DSFX_I3DL2_ENVIRONMENT_PRESET_DEFAULT,
	DSFX_I3DL2_ENVIRONMENT_PRESET_GENERIC,
	DSFX_I3DL2_ENVIRONMENT_PRESET_PADDEDCELL,
	DSFX_I3DL2_ENVIRONMENT_PRESET_ROOM,
	DSFX_I3DL2_ENVIRONMENT_PRESET_BATHROOM,
	DSFX_I3DL2_ENVIRONMENT_PRESET_LIVINGROOM,
	DSFX_I3DL2_ENVIRONMENT_PRESET_STONEROOM,
	DSFX_I3DL2_ENVIRONMENT_PRESET_AUDITORIUM,
	DSFX_I3DL2_ENVIRONMENT_PRESET_CONCERTHALL,
	DSFX_I3DL2_ENVIRONMENT_PRESET_CAVE,
	DSFX_I3DL2_ENVIRONMENT_PRESET_ARENA,
	DSFX_I3DL2_ENVIRONMENT_PRESET_HANGAR,
	DSFX_I3DL2_ENVIRONMENT_PRESET_CARPETEDHALLWAY,
	DSFX_I3DL2_ENVIRONMENT_PRESET_HALLWAY,
	DSFX_I3DL2_ENVIRONMENT_PRESET_STONECORRIDOR,
	DSFX_I3DL2_ENVIRONMENT_PRESET_ALLEY,
	DSFX_I3DL2_ENVIRONMENT_PRESET_FOREST,
	DSFX_I3DL2_ENVIRONMENT_PRESET_CITY,
	DSFX_I3DL2_ENVIRONMENT_PRESET_MOUNTAINS,
	DSFX_I3DL2_ENVIRONMENT_PRESET_QUARRY,
	DSFX_I3DL2_ENVIRONMENT_PRESET_PLAIN,
	DSFX_I3DL2_ENVIRONMENT_PRESET_PARKINGLOT,
	DSFX_I3DL2_ENVIRONMENT_PRESET_SEWERPIPE,
	DSFX_I3DL2_ENVIRONMENT_PRESET_UNDERWATER,
	DSFX_I3DL2_ENVIRONMENT_PRESET_SMALLROOM,
	DSFX_I3DL2_ENVIRONMENT_PRESET_MEDIUMROOM,
	DSFX_I3DL2_ENVIRONMENT_PRESET_LARGEROOM,
	DSFX_I3DL2_ENVIRONMENT_PRESET_MEDIUMHALL,
	DSFX_I3DL2_ENVIRONMENT_PRESET_LARGEHALL,
	DSFX_I3DL2_ENVIRONMENT_PRESET_PLATE
}

/*
	I3DL2_ENVIRONMENT_PRESET_DEFAULT -1000, -100, 0.0f, 1.49f, 0.83f, -2602, 0.007f, 200, 0.011f, 100.0f, 100.0f, 5000.0f
	I3DL2_ENVIRONMENT_PRESET_GENERIC -1000, -100, 0.0f, 1.49f, 0.83f, -2602, 0.007f, 200, 0.011f, 100.0f, 100.0f, 5000.0f
	I3DL2_ENVIRONMENT_PRESET_PADDEDCELL -1000,-6000, 0.0f, 0.17f, 0.10f, -1204, 0.001f, 207, 0.002f, 100.0f, 100.0f, 5000.0f
	I3DL2_ENVIRONMENT_PRESET_ROOM -1000, -454, 0.0f, 0.40f, 0.83f, -1646, 0.002f, 53, 0.003f, 100.0f, 100.0f, 5000.0f
	I3DL2_ENVIRONMENT_PRESET_BATHROOM -1000,-1200, 0.0f, 1.49f, 0.54f, -370, 0.007f, 1030, 0.011f, 100.0f, 60.0f, 5000.0f
	I3DL2_ENVIRONMENT_PRESET_LIVINGROOM -1000,-6000, 0.0f, 0.50f, 0.10f, -1376, 0.003f, -1104, 0.004f, 100.0f, 100.0f, 5000.0f
	I3DL2_ENVIRONMENT_PRESET_STONEROOM -1000, -300, 0.0f, 2.31f, 0.64f, -711, 0.012f, 83, 0.017f, 100.0f, 100.0f, 5000.0f
	I3DL2_ENVIRONMENT_PRESET_AUDITORIUM -1000, -476, 0.0f, 4.32f, 0.59f, -789, 0.020f, -289, 0.030f, 100.0f, 100.0f, 5000.0f
	I3DL2_ENVIRONMENT_PRESET_CONCERTHALL -1000, -500, 0.0f, 3.92f, 0.70f, -1230, 0.020f, -2, 0.029f, 100.0f, 100.0f, 5000.0f
	I3DL2_ENVIRONMENT_PRESET_CAVE -1000, 0, 0.0f, 2.91f, 1.30f, -602, 0.015f, -302, 0.022f, 100.0f, 100.0f, 5000.0f
	I3DL2_ENVIRONMENT_PRESET_ARENA -1000, -698, 0.0f, 7.24f, 0.33f, -1166, 0.020f, 16, 0.030f, 100.0f, 100.0f, 5000.0f
	I3DL2_ENVIRONMENT_PRESET_HANGAR -1000,-1000, 0.0f,10.05f, 0.23f, -602, 0.020f, 198, 0.030f, 100.0f, 100.0f, 5000.0f
	I3DL2_ENVIRONMENT_PRESET_CARPETEDHALLWAY -1000,-4000, 0.0f, 0.30f, 0.10f, -1831, 0.002f, -1630, 0.030f, 100.0f, 100.0f, 5000.0f
	I3DL2_ENVIRONMENT_PRESET_HALLWAY -1000, -300, 0.0f, 1.49f, 0.59f, -1219, 0.007f, 441, 0.011f, 100.0f, 100.0f, 5000.0f
	I3DL2_ENVIRONMENT_PRESET_STONECORRIDOR -1000, -237, 0.0f, 2.70f, 0.79f, -1214, 0.013f, 395, 0.020f, 100.0f, 100.0f, 5000.0f
	I3DL2_ENVIRONMENT_PRESET_ALLEY -1000, -270, 0.0f, 1.49f, 0.86f, -1204, 0.007f, -4, 0.011f, 100.0f, 100.0f, 5000.0f
	I3DL2_ENVIRONMENT_PRESET_FOREST -1000,-3300, 0.0f, 1.49f, 0.54f, -2560, 0.162f, -613, 0.088f, 79.0f, 100.0f, 5000.0f
	I3DL2_ENVIRONMENT_PRESET_CITY -1000, -800, 0.0f, 1.49f, 0.67f, -2273, 0.007f, -2217, 0.011f, 50.0f, 100.0f, 5000.0f
	I3DL2_ENVIRONMENT_PRESET_MOUNTAINS -1000,-2500, 0.0f, 1.49f, 0.21f, -2780, 0.300f, -2014, 0.100f, 27.0f, 100.0f, 5000.0f
	I3DL2_ENVIRONMENT_PRESET_QUARRY -1000,-1000, 0.0f, 1.49f, 0.83f,-10000, 0.061f, 500, 0.025f, 100.0f, 100.0f, 5000.0f
	I3DL2_ENVIRONMENT_PRESET_PLAIN -1000,-2000, 0.0f, 1.49f, 0.50f, -2466, 0.179f, -2514, 0.100f, 21.0f, 100.0f, 5000.0f
	I3DL2_ENVIRONMENT_PRESET_PARKINGLOT -1000, 0, 0.0f, 1.65f, 1.50f, -1363, 0.008f, -1153, 0.012f, 100.0f, 100.0f, 5000.0f
	I3DL2_ENVIRONMENT_PRESET_SEWERPIPE -1000,-1000, 0.0f, 2.81f, 0.14f, 429, 0.014f, 648, 0.021f, 80.0f, 60.0f, 5000.0f
	I3DL2_ENVIRONMENT_PRESET_UNDERWATER -1000,-4000, 0.0f, 1.49f, 0.10f, -449, 0.007f, 1700, 0.011f, 100.0f, 100.0f, 5000.0f
	I3DL2_ENVIRONMENT_PRESET_SMALLROOM -1000, -600, 0.0f, 1.10f, 0.83f, -400, 0.005f, 500, 0.010f, 100.0f, 100.0f, 5000.0f
	I3DL2_ENVIRONMENT_PRESET_MEDIUMROOM -1000, -600, 0.0f, 1.30f, 0.83f, -1000, 0.010f, -200, 0.020f, 100.0f, 100.0f, 5000.0f
	I3DL2_ENVIRONMENT_PRESET_LARGEROOM -1000, -600, 0.0f, 1.50f, 0.83f, -1600, 0.020f, -1000, 0.040f, 100.0f, 100.0f, 5000.0f
	I3DL2_ENVIRONMENT_PRESET_MEDIUMHALL -1000, -600, 0.0f, 1.80f, 0.70f, -1300, 0.015f, -800, 0.030f, 100.0f, 100.0f, 5000.0f
	I3DL2_ENVIRONMENT_PRESET_LARGEHALL -1000, -600, 0.0f, 1.80f, 0.70f, -2000, 0.030f, -1400, 0.060f, 100.0f, 100.0f, 5000.0f
	I3DL2_ENVIRONMENT_PRESET_PLATE -1000, -200, 0.0f, 1.30f, 0.90f, 0, 0.002f, 0, 0.010f, 100.0f, 75.0f, 5000.0f
*/

alias GUID_NULL DS3DALG_DEFAULT;

mixin DEFINE_GUID!("DS3DALG_NO_VIRTUALIZATION", 0xc241333f, 0x1c1b, 0x11d2, 0x94, 0xf5, 0x0, 0xc0, 0x4f, 0xc2, 0x8a, 0xca);
mixin DEFINE_GUID!("DS3DALG_HRTF_FULL", 0xc2413340, 0x1c1b, 0x11d2, 0x94, 0xf5, 0x0, 0xc0, 0x4f, 0xc2, 0x8a, 0xca);
mixin DEFINE_GUID!("DS3DALG_HRTF_LIGHT", 0xc2413342, 0x1c1b, 0x11d2, 0x94, 0xf5, 0x0, 0xc0, 0x4f, 0xc2, 0x8a, 0xca);

//(DIRECTSOUND_VERSION >= 0x0800)
	mixin DEFINE_GUID!("GUID_DSFX_STANDARD_GARGLE", 0xdafd8210, 0x5711, 0x4b91, 0x9f, 0xe3, 0xf7, 0x5b, 0x7a, 0xe2, 0x79, 0xbf);
	mixin DEFINE_GUID!("GUID_DSFX_STANDARD_CHORUS", 0xefe6629c, 0x81f7, 0x4281, 0xbd, 0x91, 0xc9, 0xd6, 0x04, 0xa9, 0x5a, 0xf6);
	mixin DEFINE_GUID!("GUID_DSFX_STANDARD_FLANGER", 0xefca3d92, 0xdfd8, 0x4672, 0xa6, 0x03, 0x74, 0x20, 0x89, 0x4b, 0xad, 0x98);
	mixin DEFINE_GUID!("GUID_DSFX_STANDARD_ECHO", 0xef3e932c, 0xd40b, 0x4f51, 0x8c, 0xcf, 0x3f, 0x98, 0xf1, 0xb2, 0x9d, 0x5d);
	mixin DEFINE_GUID!("GUID_DSFX_STANDARD_DISTORTION", 0xef114c90, 0xcd1d, 0x484e, 0x96, 0xe5, 0x09, 0xcf, 0xaf, 0x91, 0x2a, 0x21);
	mixin DEFINE_GUID!("GUID_DSFX_STANDARD_COMPRESSOR", 0xef011f79, 0x4000, 0x406d, 0x87, 0xaf, 0xbf, 0xfb, 0x3f, 0xc3, 0x9d, 0x57);
	mixin DEFINE_GUID!("GUID_DSFX_STANDARD_PARAMEQ", 0x120ced89, 0x3bf4, 0x4173, 0xa1, 0x32, 0x3c, 0xb4, 0x06, 0xcf, 0x32, 0x31);
	mixin DEFINE_GUID!("GUID_DSFX_STANDARD_I3DL2REVERB", 0xef985e71, 0xd5c7, 0x42d4, 0xba, 0x4d, 0x2d, 0x07, 0x3e, 0x2e, 0x96, 0xf4);
	mixin DEFINE_GUID!("GUID_DSFX_WAVES_REVERB", 0x87fc0268, 0x9a55, 0x4360, 0x95, 0xaa, 0x00, 0x4a, 0x1d, 0x9d, 0xe2, 0x6c);
	mixin DEFINE_GUID!("GUID_DSCFX_CLASS_AEC", 0xBF963D80L, 0xC559, 0x11D0, 0x8A, 0x2B, 0x00, 0xA0, 0xC9, 0x25, 0x5A, 0xC1);
	mixin DEFINE_GUID!("GUID_DSCFX_MS_AEC", 0xcdebb919, 0x379a, 0x488a, 0x87, 0x65, 0xf5, 0x3c, 0xfd, 0x36, 0xde, 0x40);
	mixin DEFINE_GUID!("GUID_DSCFX_SYSTEM_AEC", 0x1c22c56d, 0x9879, 0x4f5b, 0xa3, 0x89, 0x27, 0x99, 0x6d, 0xdc, 0x28, 0x10);
	mixin DEFINE_GUID!("GUID_DSCFX_CLASS_NS", 0xe07f903f, 0x62fd, 0x4e60, 0x8c, 0xdd, 0xde, 0xa7, 0x23, 0x66, 0x65, 0xb5);
	mixin DEFINE_GUID!("GUID_DSCFX_MS_NS", 0x11c5c73b, 0x66e9, 0x4ba1, 0xa0, 0xba, 0xe8, 0x14, 0xc6, 0xee, 0xd9, 0x2d);
	mixin DEFINE_GUID!("GUID_DSCFX_SYSTEM_NS", 0x5ab0882e, 0x7274, 0x4516, 0x87, 0x7d, 0x4e, 0xee, 0x99, 0xba, 0x4f, 0xd0);

//(DIRECTSOUND_VERSION >= 0x0800)
	alias IID_IDirectSoundCapture IID_IDirectSoundCapture8;
	alias IID_IDirectSound3DListener IID_IDirectSound3DListener8;
	alias IID_IDirectSound3DBuffer IID_IDirectSound3DBuffer8;
	alias IID_IDirectSoundNotify IID_IDirectSoundNotify8;
	alias IID_IDirectSoundFXGargle IID_IDirectSoundFXGargle8;
	alias IID_IDirectSoundFXChorus IID_IDirectSoundFXChorus8;
	alias IID_IDirectSoundFXFlanger IID_IDirectSoundFXFlanger8;
	alias IID_IDirectSoundFXEcho IID_IDirectSoundFXEcho8;
	alias IID_IDirectSoundFXDistortion IID_IDirectSoundFXDistortion8;
	alias IID_IDirectSoundFXCompressor IID_IDirectSoundFXCompressor8;
	alias IID_IDirectSoundFXParamEq IID_IDirectSoundFXParamEq8;
	alias IID_IDirectSoundFXWavesReverb IID_IDirectSoundFXWavesReverb8;
	alias IID_IDirectSoundFXI3DL2Reverb IID_IDirectSoundFXI3DL2Reverb8;
	alias IID_IDirectSoundCaptureFXAec IID_IDirectSoundCaptureFXAec8;
	alias IID_IDirectSoundCaptureFXNoiseSuppress IID_IDirectSoundCaptureFXNoiseSuppress8;
	alias IID_IDirectSoundFullDuplex IID_IDirectSoundFullDuplex8;

}// extern(C)
