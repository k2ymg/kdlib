/** mfapi.d

Converted from 'mfapi.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.mfapi;


import c.windows.sdkddkver;
import c.windows.windef;
import c.windows.guiddef;
import c.windows.unknwn;
import c.windows.winerror;
import c.windows.mfobjects;
import c.windows.winbase;
import c.windows.propidl;
import c.windows.mediaobj;
import c.directx.d3d9types;
import c.windows.mmreg;
import c.windows.mmsystem;
import c.windows.amvideo;
import c.windows.dvdmedia;
import c.windows.wingdi;
import c.windows.strmif;
import c.windows.ksmedia;


enum {
	MF_SDK_VERSION = 0x0002,
	MF_API_VERSION = 0x0070,
	MF_VERSION     = MF_SDK_VERSION << 16 | MF_API_VERSION,
}

enum {
	MFSTARTUP_NOSOCKET = 0x1,
	MFSTARTUP_LITE     = MFSTARTUP_NOSOCKET,
	MFSTARTUP_FULL     = 0,
}

extern(C){

export extern(Windows) HRESULT MFStartup(ULONG Version, DWORD dwFlags = MFSTARTUP_FULL);
export extern(Windows) HRESULT MFShutdown();
export extern(Windows) HRESULT MFLockPlatform();
export extern(Windows) HRESULT MFUnlockPlatform();

alias ulong MFWORKITEM_KEY;

export extern(Windows) HRESULT MFPutWorkItem(DWORD dwQueue, IMFAsyncCallback pCallback, IUnknown pState);
export extern(Windows) HRESULT MFPutWorkItemEx(DWORD dwQueue, IMFAsyncResult pResult);
export extern(Windows) HRESULT MFScheduleWorkItem(IMFAsyncCallback pCallback, IUnknown pState, INT64 Timeout, MFWORKITEM_KEY* pKey);
export extern(Windows) HRESULT MFScheduleWorkItemEx(IMFAsyncResult pResult, INT64 Timeout, MFWORKITEM_KEY* pKey);
export extern(Windows) HRESULT MFCancelWorkItem(MFWORKITEM_KEY Key);
export extern(Windows) HRESULT MFGetTimerPeriodicity(DWORD* Periodicity);

alias void function(IUnknown pContext) MFPERIODICCALLBACK;

export extern(Windows) HRESULT MFAddPeriodicCallback(MFPERIODICCALLBACK Callback, IUnknown pContext, DWORD* pdwKey);
export extern(Windows) HRESULT MFRemovePeriodicCallback(DWORD dwKey);

//(WINVER >= _WIN32_WINNT_WIN7)
	enum {
		MF_STANDARD_WORKQUEUE = 0,
		MF_WINDOW_WORKQUEUE   = 1,
	}
	alias int MFASYNC_WORKQUEUE_TYPE;
static if(WINVER >= _WIN32_WINNT_WIN7)
	export extern(Windows) HRESULT MFAllocateWorkQueueEx(MFASYNC_WORKQUEUE_TYPE WorkQueueType, DWORD* pdwWorkQueue);

export extern(Windows) HRESULT MFAllocateWorkQueue(DWORD* pdwWorkQueue);
export extern(Windows) HRESULT MFLockWorkQueue(DWORD dwWorkQueue);
export extern(Windows) HRESULT MFUnlockWorkQueue(DWORD dwWorkQueue);
export extern(Windows) HRESULT MFBeginRegisterWorkQueueWithMMCSS(DWORD dwWorkQueueId, LPCWSTR wszClass, DWORD dwTaskId, IMFAsyncCallback pDoneCallback, IUnknown pDoneState );
export extern(Windows) HRESULT MFEndRegisterWorkQueueWithMMCSS(IMFAsyncResult pResult, DWORD* pdwTaskId );
export extern(Windows) HRESULT MFBeginUnregisterWorkQueueWithMMCSS(DWORD dwWorkQueueId, IMFAsyncCallback pDoneCallback, IUnknown pDoneState );
export extern(Windows) HRESULT MFEndUnregisterWorkQueueWithMMCSS(IMFAsyncResult pResult);
export extern(Windows) HRESULT MFGetWorkQueueMMCSSClass(DWORD dwWorkQueueId, LPWSTR pwszClass, DWORD* pcchClass);
export extern(Windows) HRESULT MFGetWorkQueueMMCSSTaskId(DWORD dwWorkQueueId, LPDWORD pdwTaskId );
export extern(Windows) HRESULT MFCreateAsyncResult(IUnknown punkObject, IMFAsyncCallback pCallback, IUnknown punkState, IMFAsyncResult* ppAsyncResult);
export extern(Windows) HRESULT MFInvokeCallback(IMFAsyncResult pAsyncResult );

struct MFASYNCRESULT {
	IMFAsyncResult AsyncResult; // todo: check IMFAsyncRrsult type
	OVERLAPPED overlapped;
	IMFAsyncCallback pCallback;
	HRESULT hrStatusResult;
	DWORD dwBytesTransferred;
	HANDLE hEvent;
}

export extern(Windows) HRESULT MFCreateFile(MF_FILE_ACCESSMODE AccessMode, MF_FILE_OPENMODE OpenMode, MF_FILE_FLAGS fFlags, LPCWSTR pwszFileURL, IMFByteStream* ppIByteStream);
export extern(Windows) HRESULT MFCreateTempFile(MF_FILE_ACCESSMODE AccessMode, MF_FILE_OPENMODE OpenMode, MF_FILE_FLAGS fFlags, IMFByteStream* ppIByteStream);
export extern(Windows) HRESULT MFBeginCreateFile(MF_FILE_ACCESSMODE AccessMode, MF_FILE_OPENMODE OpenMode, MF_FILE_FLAGS fFlags, LPCWSTR pwszFilePath, IMFAsyncCallback pCallback, IUnknown pState, IUnknown* ppCancelCookie);
export extern(Windows) HRESULT MFEndCreateFile(IMFAsyncResult pResult, IMFByteStream* ppFile );
export extern(Windows) HRESULT MFCancelCreateFile(IUnknown pCancelCookie);
export extern(Windows) HRESULT MFCreateMemoryBuffer(DWORD cbMaxLength, IMFMediaBuffer* ppBuffer );
export extern(Windows) HRESULT MFCreateMediaBufferWrapper(IMFMediaBuffer pBuffer, DWORD cbOffset, DWORD dwLength, IMFMediaBuffer* ppBuffer );
export extern(Windows) HRESULT MFCreateLegacyMediaBufferOnMFMediaBuffer(IMFSample pSample, IMFMediaBuffer pMFMediaBuffer, DWORD cbOffset, IMediaBuffer* ppMediaBuffer);
export extern(Windows) HRESULT MFCreateDXSurfaceBuffer(REFIID riid, IUnknown punkSurface, BOOL fBottomUpWhenLinear, IMFMediaBuffer* ppBuffer);

enum {
	MF_1_BYTE_ALIGNMENT   = 0x00000000,
	MF_2_BYTE_ALIGNMENT   = 0x00000001,
	MF_4_BYTE_ALIGNMENT   = 0x00000003,
	MF_8_BYTE_ALIGNMENT   = 0x00000007,
	MF_16_BYTE_ALIGNMENT  = 0x0000000f,
	MF_32_BYTE_ALIGNMENT  = 0x0000001f,
	MF_64_BYTE_ALIGNMENT  = 0x0000003f,
	MF_128_BYTE_ALIGNMENT = 0x0000007f,
	MF_256_BYTE_ALIGNMENT = 0x000000ff,
	MF_512_BYTE_ALIGNMENT = 0x000001ff,
}

export extern(Windows) HRESULT MFCreateAlignedMemoryBuffer(DWORD cbMaxLength, DWORD cbAligment, IMFMediaBuffer* ppBuffer);

extern extern(C) const GUID MR_BUFFER_SERVICE;

export extern(Windows) HRESULT MFCreateMediaEvent(MediaEventType met, REFGUID guidExtendedType, HRESULT hrStatus, const(PROPVARIANT)* pvValue, IMFMediaEvent* ppEvent);
export extern(Windows) HRESULT MFCreateEventQueue(IMFMediaEventQueue* ppMediaEventQueue);

mixin DEFINE_GUID!("MF_EVENT_SESSIONCAPS", 0x7e5ebcd0, 0x11b8, 0x4abe, 0xaf, 0xad, 0x10, 0xf6, 0x59, 0x9a, 0x7f, 0x42);
mixin DEFINE_GUID!("MF_EVENT_SESSIONCAPS_DELTA", 0x7e5ebcd1, 0x11b8, 0x4abe, 0xaf, 0xad, 0x10, 0xf6, 0x59, 0x9a, 0x7f, 0x42);

enum {
	MFSESSIONCAP_START        = 0x00000001,
	MFSESSIONCAP_SEEK         = 0x00000002,
	MFSESSIONCAP_PAUSE        = 0x00000004,
	MFSESSIONCAP_RATE_FORWARD = 0x00000010,
	MFSESSIONCAP_RATE_REVERSE = 0x00000020,
}

enum {
	MF_TOPOSTATUS_INVALID = 0,
	MF_TOPOSTATUS_READY = 100,
	MF_TOPOSTATUS_STARTED_SOURCE = 200,
	//(WINVER >= _WIN32_WINNT_WIN7)
		MF_TOPOSTATUS_DYNAMIC_CHANGED = 210,
	MF_TOPOSTATUS_SINK_SWITCHED = 300,
	MF_TOPOSTATUS_ENDED = 400,
}
alias int MF_TOPOSTATUS;

mixin DEFINE_GUID!("MF_EVENT_TOPOLOGY_STATUS", 0x30c5018d, 0x9a53, 0x454b, 0xad, 0x9e, 0x6d, 0x5f, 0x8f, 0xa7, 0xc4, 0x3b);
mixin DEFINE_GUID!("MF_EVENT_START_PRESENTATION_TIME", 0x5ad914d0, 0x9b45, 0x4a8d, 0xa2, 0xc0, 0x81, 0xd1, 0xe5, 0xb, 0xfb, 0x7);
mixin DEFINE_GUID!("MF_EVENT_PRESENTATION_TIME_OFFSET", 0x5ad914d1, 0x9b45, 0x4a8d, 0xa2, 0xc0, 0x81, 0xd1, 0xe5, 0xb, 0xfb, 0x7);
mixin DEFINE_GUID!("MF_EVENT_START_PRESENTATION_TIME_AT_OUTPUT", 0x5ad914d2, 0x9b45, 0x4a8d, 0xa2, 0xc0, 0x81, 0xd1, 0xe5, 0xb, 0xfb, 0x7);
mixin DEFINE_GUID!("MF_EVENT_SOURCE_FAKE_START", 0xa8cc55a7, 0x6b31, 0x419f, 0x84, 0x5d, 0xff, 0xb3, 0x51, 0xa2, 0x43, 0x4b);
mixin DEFINE_GUID!("MF_EVENT_SOURCE_PROJECTSTART", 0xa8cc55a8, 0x6b31, 0x419f, 0x84, 0x5d, 0xff, 0xb3, 0x51, 0xa2, 0x43, 0x4b);
mixin DEFINE_GUID!("MF_EVENT_SOURCE_ACTUAL_START", 0xa8cc55a9, 0x6b31, 0x419f, 0x84, 0x5d, 0xff, 0xb3, 0x51, 0xa2, 0x43, 0x4b);
mixin DEFINE_GUID!("MF_EVENT_SOURCE_TOPOLOGY_CANCELED", 0xdb62f650, 0x9a5e, 0x4704, 0xac, 0xf3, 0x56, 0x3b, 0xc6, 0xa7, 0x33, 0x64);
mixin DEFINE_GUID!("MF_EVENT_SOURCE_CHARACTERISTICS", 0x47db8490, 0x8b22, 0x4f52, 0xaf, 0xda, 0x9c, 0xe1, 0xb2, 0xd3, 0xcf, 0xa8);
mixin DEFINE_GUID!("MF_EVENT_SOURCE_CHARACTERISTICS_OLD", 0x47db8491, 0x8b22, 0x4f52, 0xaf, 0xda, 0x9c, 0xe1, 0xb2, 0xd3, 0xcf, 0xa8);
mixin DEFINE_GUID!("MF_EVENT_DO_THINNING", 0x321ea6fb, 0xdad9, 0x46e4, 0xb3, 0x1d, 0xd2, 0xea, 0xe7, 0x9, 0xe, 0x30);
mixin DEFINE_GUID!("MF_EVENT_SCRUBSAMPLE_TIME", 0x9ac712b3, 0xdcb8, 0x44d5, 0x8d, 0xc, 0x37, 0x45, 0x5a, 0x27, 0x82, 0xe3);
mixin DEFINE_GUID!("MF_EVENT_OUTPUT_NODE", 0x830f1a8b, 0xc060, 0x46dd, 0xa8, 0x01, 0x1c, 0x95, 0xde, 0xc9, 0xb1, 0x07);

//(WINVER >= _WIN32_WINNT_WIN7)
	mixin DEFINE_GUID!("MF_EVENT_MFT_INPUT_STREAM_ID", 0xf29c2cca, 0x7ae6, 0x42d2, 0xb2, 0x84, 0xbf, 0x83, 0x7c, 0xc8, 0x74, 0xe2);
	mixin DEFINE_GUID!("MF_EVENT_MFT_CONTEXT", 0xb7cd31f1, 0x899e, 0x4b41, 0x80, 0xc9, 0x26, 0xa8, 0x96, 0xd3, 0x29, 0x77);

export extern(Windows) HRESULT MFCreateSample(IMFSample* ppIMFSample);

mixin DEFINE_GUID!("MFSampleExtension_CleanPoint", 0x9cdf01d8, 0xa0f0, 0x43ba, 0xb0, 0x77, 0xea, 0xa0, 0x6c, 0xbd, 0x72, 0x8a);
mixin DEFINE_GUID!("MFSampleExtension_Discontinuity", 0x9cdf01d9, 0xa0f0, 0x43ba, 0xb0, 0x77, 0xea, 0xa0, 0x6c, 0xbd, 0x72, 0x8a);
mixin DEFINE_GUID!("MFSampleExtension_Token", 0x8294da66, 0xf328, 0x4805, 0xb5, 0x51, 0x00, 0xde, 0xb4, 0xc5, 0x7a, 0x61);
mixin DEFINE_GUID!("MFSampleExtension_DescrambleData", 0x43483be6, 0x4903, 0x4314, 0xb0, 0x32, 0x29, 0x51, 0x36, 0x59, 0x36, 0xfc);
mixin DEFINE_GUID!("MFSampleExtension_SampleKeyID", 0x9ed713c8, 0x9b87, 0x4b26, 0x82, 0x97, 0xa9, 0x3b, 0x0c, 0x5a, 0x8a, 0xcc);
mixin DEFINE_GUID!("MFSampleExtension_GenKeyFunc", 0x441ca1ee, 0x6b1f, 0x4501, 0x90, 0x3a, 0xde, 0x87, 0xdf, 0x42, 0xf6, 0xed);
mixin DEFINE_GUID!("MFSampleExtension_GenKeyCtx", 0x188120cb, 0xd7da, 0x4b59, 0x9b, 0x3e, 0x92, 0x52, 0xfd, 0x37, 0x30, 0x1c);
mixin DEFINE_GUID!("MFSampleExtension_PacketCrossOffsets", 0x2789671d, 0x389f, 0x40bb, 0x90, 0xd9, 0xc2, 0x82, 0xf7, 0x7f, 0x9a, 0xbd);
mixin DEFINE_GUID!("MFSampleExtension_Interlaced", 0xb1d5830a, 0xdeb8, 0x40e3, 0x90, 0xfa, 0x38, 0x99, 0x43, 0x71, 0x64, 0x61);
mixin DEFINE_GUID!("MFSampleExtension_BottomFieldFirst", 0x941ce0a3, 0x6ae3, 0x4dda, 0x9a, 0x08, 0xa6, 0x42, 0x98, 0x34, 0x06, 0x17);
mixin DEFINE_GUID!("MFSampleExtension_RepeatFirstField", 0x304d257c, 0x7493, 0x4fbd, 0xb1, 0x49, 0x92, 0x28, 0xde, 0x8d, 0x9a, 0x99);
mixin DEFINE_GUID!("MFSampleExtension_SingleField", 0x9d85f816, 0x658b, 0x455a, 0xbd, 0xe0, 0x9f, 0xa7, 0xe1, 0x5a, 0xb8, 0xf9);
mixin DEFINE_GUID!("MFSampleExtension_DerivedFromTopField", 0x6852465a, 0xae1c, 0x4553, 0x8e, 0x9b, 0xc3, 0x42, 0x0f, 0xcb, 0x16, 0x37);

export extern(Windows) HRESULT MFCreateAttributes(IMFAttributes* ppMFAttributes, UINT32 cInitialSize);
export extern(Windows) HRESULT MFInitAttributesFromBlob(IMFAttributes pAttributes, const(UINT8)* pBuf, UINT cbBufSize);
export extern(Windows) HRESULT MFGetAttributesAsBlobSize(IMFAttributes pAttributes, UINT32* pcbBufSize);
export extern(Windows) HRESULT MFGetAttributesAsBlob(IMFAttributes pAttributes, UINT8* pBuf, UINT cbBufSize);

mixin DEFINE_GUID!("MFT_CATEGORY_VIDEO_DECODER", 0xd6c02d4b, 0x6833, 0x45b4, 0x97, 0x1a, 0x05, 0xa4, 0xb0, 0x4b, 0xab, 0x91);
mixin DEFINE_GUID!("MFT_CATEGORY_VIDEO_ENCODER", 0xf79eac7d, 0xe545, 0x4387, 0xbd, 0xee, 0xd6, 0x47, 0xd7, 0xbd, 0xe4, 0x2a);
mixin DEFINE_GUID!("MFT_CATEGORY_VIDEO_EFFECT", 0x12e17c21, 0x532c, 0x4a6e, 0x8a, 0x1c, 0x40, 0x82, 0x5a, 0x73, 0x63, 0x97);
mixin DEFINE_GUID!("MFT_CATEGORY_MULTIPLEXER", 0x059c561e, 0x05ae, 0x4b61, 0xb6, 0x9d, 0x55, 0xb6, 0x1e, 0xe5, 0x4a, 0x7b);
mixin DEFINE_GUID!("MFT_CATEGORY_DEMULTIPLEXER", 0xa8700a7a, 0x939b, 0x44c5, 0x99, 0xd7, 0x76, 0x22, 0x6b, 0x23, 0xb3, 0xf1);
mixin DEFINE_GUID!("MFT_CATEGORY_AUDIO_DECODER", 0x9ea73fb4, 0xef7a, 0x4559, 0x8d, 0x5d, 0x71, 0x9d, 0x8f, 0x04, 0x26, 0xc7);
mixin DEFINE_GUID!("MFT_CATEGORY_AUDIO_ENCODER", 0x91c64bd0, 0xf91e, 0x4d8c, 0x92, 0x76, 0xdb, 0x24, 0x82, 0x79, 0xd9, 0x75);
mixin DEFINE_GUID!("MFT_CATEGORY_AUDIO_EFFECT", 0x11064c48, 0x3648, 0x4ed0, 0x93, 0x2e, 0x05, 0xce, 0x8a, 0xc8, 0x11, 0xb7);

//(WINVER >= _WIN32_WINNT_WIN7)
	mixin DEFINE_GUID!("MFT_CATEGORY_VIDEO_PROCESSOR", 0x302ea3fc, 0xaa5f, 0x47f9, 0x9f, 0x7a, 0xc2, 0x18, 0x8b, 0xb1, 0x63, 0x2);

mixin DEFINE_GUID!("MFT_CATEGORY_OTHER", 0x90175d57, 0xb7ea, 0x4901, 0xae, 0xb3, 0x93, 0x3a, 0x87, 0x47, 0x75, 0x6f);

export extern(Windows) HRESULT MFTRegister(CLSID clsidMFT, GUID guidCategory, LPWSTR pszName, UINT32 Flags, UINT32 cInputTypes, MFT_REGISTER_TYPE_INFO* pInputTypes, UINT32 cOutputTypes, MFT_REGISTER_TYPE_INFO* pOutputTypes, IMFAttributes pAttributes);
export extern(Windows) HRESULT MFTUnregister(CLSID clsidMFT);

static if(WINVER >= _WIN32_WINNT_WIN7){
	export extern(Windows) HRESULT MFTRegisterLocal(IClassFactory pClassFactory, REFGUID guidCategory, LPCWSTR pszName, UINT32 Flags, UINT32 cInputTypes, const(MFT_REGISTER_TYPE_INFO)* pInputTypes, UINT32 cOutputTypes, const(MFT_REGISTER_TYPE_INFO)* pOutputTypes);
	export extern(Windows) HRESULT MFTUnregisterLocal(IClassFactory pClassFactory);
	export extern(Windows) HRESULT MFTRegisterLocalByCLSID(REFCLSID clisdMFT, REFGUID guidCategory, LPCWSTR pszName, UINT32 Flags, UINT32 cInputTypes, const(MFT_REGISTER_TYPE_INFO)* pInputTypes, UINT32 cOutputTypes, const(MFT_REGISTER_TYPE_INFO)* pOutputTypes);
	export extern(Windows) HRESULT MFTUnregisterLocalByCLSID(CLSID clsidMFT);
}

export extern(Windows) HRESULT MFTEnum( GUID guidCategory, UINT32 Flags, MFT_REGISTER_TYPE_INFO* pInputType, MFT_REGISTER_TYPE_INFO* pOutputType, IMFAttributes pAttributes, CLSID** ppclsidMFT, UINT32* pcMFTs);

//(WINVER >= _WIN32_WINNT_WIN7)
	enum {
		MFT_ENUM_FLAG_SYNCMFT = 0x00000001,
		MFT_ENUM_FLAG_ASYNCMFT = 0x00000002,
		MFT_ENUM_FLAG_HARDWARE = 0x00000004,
		MFT_ENUM_FLAG_FIELDOFUSE = 0x00000008,
		MFT_ENUM_FLAG_LOCALMFT = 0x00000010,
		MFT_ENUM_FLAG_TRANSCODE_ONLY = 0x00000020,
		MFT_ENUM_FLAG_SORTANDFILTER = 0x00000040,
		MFT_ENUM_FLAG_ALL = 0x0000003F
	}
static if(WINVER >= _WIN32_WINNT_WIN7)
	export extern(Windows) HRESULT MFTEnumEx(GUID guidCategory, UINT32 Flags, const(MFT_REGISTER_TYPE_INFO)* pInputType, const(MFT_REGISTER_TYPE_INFO)* pOutputType, IMFActivate** pppMFTActivate, UINT32* pnumMFTActivate);

export extern(Windows) HRESULT MFTGetInfo(CLSID clsidMFT, LPWSTR* pszName, MFT_REGISTER_TYPE_INFO** ppInputTypes, UINT32* pcInputTypes, MFT_REGISTER_TYPE_INFO** ppOutputTypes, UINT32* pcOutputTypes, IMFAttributes* ppAttributes);

static if(WINVER >= _WIN32_WINNT_WIN7){
	export extern(Windows) HRESULT MFGetPluginControl(IMFPluginControl* ppPluginControl);
	export extern(Windows) HRESULT MFGetMFTMerit( IUnknown pMFT, UINT32 cbVerifier, const(BYTE)* verifier, DWORD* merit);
}

mixin DEFINE_GUID!("MFT_SUPPORT_DYNAMIC_FORMAT_CHANGE", 0x53476a11, 0x3f13, 0x49fb, 0xac, 0x42, 0xee, 0x27, 0x33, 0xc9, 0x67, 0x41);

//	FCC(ch4) ((((DWORD)(ch4) & 0xFF) << 24) |  (((DWORD)(ch4) & 0xFF00) << 8) |  (((DWORD)(ch4) & 0xFF0000) >> 8) |  (((DWORD)(ch4) & 0xFF000000) >> 24))
mixin template DEFINE_MEDIATYPE_GUID(string name, DWORD format)
{
	mixin DEFINE_GUID!(name,  format, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71);
}

/*#ifndef DIRECT3D_VERSION
		D3DFMT_R8G8B8 20
		D3DFMT_A8R8G8B8 21
		D3DFMT_X8R8G8B8 22
		D3DFMT_R5G6B5 23
		D3DFMT_X1R5G5B5 24
		D3DFMT_P8 41
		LOCAL_D3DFMT_DEFINES 1
#endif*/

mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_Base", 0x00000000);
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_RGB32", D3DFMT_X8R8G8B8);
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_ARGB32", D3DFMT_A8R8G8B8);
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_RGB24", D3DFMT_R8G8B8);
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_RGB555", D3DFMT_X1R5G5B5);
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_RGB565", D3DFMT_R5G6B5);
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_RGB8", D3DFMT_P8);
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_AI44", ('A' << 24) | ('I' << 16) | ('4' << 8) | '4');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_AYUV", ('A' << 24) | ('Y' << 16) | ('U' << 8) | 'V');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_YUY2", ('Y' << 24) | ('U' << 16) | ('Y' << 8) | '2');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_YVYU", ('Y' << 24) | ('V' << 16) | ('Y' << 8) | 'U');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_YVU9", ('Y' << 24) | ('V' << 16) | ('U' << 8) | '9');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_UYVY", ('U' << 24) | ('Y' << 16) | ('V' << 8) | 'Y');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_NV11", ('N' << 24) | ('V' << 16) | ('1' << 8) | '1');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_NV12", ('N' << 24) | ('V' << 16) | ('1' << 8) | '2');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_YV12", ('Y' << 24) | ('V' << 16) | ('1' << 8) | '2');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_I420", ('I' << 24) | ('4' << 16) | ('2' << 8) | '0');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_IYUV", ('I' << 24) | ('Y' << 16) | ('U' << 8) | 'V');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_Y210", ('Y' << 24) | ('2' << 16) | ('1' << 8) | '0');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_Y216", ('Y' << 24) | ('2' << 16) | ('1' << 8) | '6');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_Y410", ('Y' << 24) | ('4' << 16) | ('1' << 8) | '0');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_Y416", ('Y' << 24) | ('4' << 16) | ('1' << 8) | '6');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_Y41P", ('Y' << 24) | ('4' << 16) | ('1' << 8) | 'P');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_Y41T", ('Y' << 24) | ('4' << 16) | ('1' << 8) | 'T');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_Y42T", ('Y' << 24) | ('4' << 16) | ('2' << 8) | 'T');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_P210", ('P' << 24) | ('2' << 16) | ('1' << 8) | '0');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_P216", ('P' << 24) | ('2' << 16) | ('1' << 8) | '6');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_P010", ('P' << 24) | ('0' << 16) | ('1' << 8) | '0');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_P016", ('P' << 24) | ('0' << 16) | ('1' << 8) | '6');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_v210", ('v' << 24) | ('2' << 16) | ('1' << 8) | '0');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_v216", ('v' << 24) | ('2' << 16) | ('1' << 8) | '6');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_v410", ('v' << 24) | ('4' << 16) | ('1' << 8) | '0');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_MP43", ('M' << 24) | ('P' << 16) | ('4' << 8) | '3');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_MP4S", ('M' << 24) | ('P' << 16) | ('4' << 8) | 'S');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_M4S2", ('M' << 24) | ('4' << 16) | ('S' << 8) | '2');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_MP4V", ('M' << 24) | ('P' << 16) | ('4' << 8) | 'V');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_WMV1", ('W' << 24) | ('M' << 16) | ('V' << 8) | '1');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_WMV2", ('W' << 24) | ('M' << 16) | ('V' << 8) | '2');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_WMV3", ('W' << 24) | ('M' << 16) | ('V' << 8) | '3');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_WVC1", ('W' << 24) | ('V' << 16) | ('C' << 8) | '1');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_MSS1", ('M' << 24) | ('S' << 16) | ('S' << 8) | '1');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_MSS2", ('M' << 24) | ('S' << 16) | ('S' << 8) | '2');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_MPG1", ('M' << 24) | ('P' << 16) | ('G' << 8) | '1');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_DVSL", ('d' << 24) | ('v' << 16) | ('s' << 8) | 'l');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_DVSD", ('d' << 24) | ('v' << 16) | ('s' << 8) | 'd');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_DVHD", ('d' << 24) | ('v' << 16) | ('h' << 8) | 'd');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_DV25", ('d' << 24) | ('v' << 16) | ('2' << 8) | '5');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_DV50", ('d' << 24) | ('v' << 16) | ('5' << 8) | '0');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_DVH1", ('d' << 24) | ('v' << 16) | ('h' << 8) | '1');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_DVC", ('d' << 24) | ('v' << 16) | ('c' << 8) | ' ');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_H264", ('H' << 24) | ('2' << 16) | ('6' << 8) | '4');
mixin DEFINE_MEDIATYPE_GUID!("MFVideoFormat_MJPG", ('M' << 24) | ('J' << 16) | ('P' << 8) | 'G');

mixin DEFINE_GUID!("MFVideoFormat_MPEG2", 0xe06d8026, 0xdb46, 0x11cf, 0xb4, 0xd1, 0x00, 0x80, 0x5f, 0x6c, 0xbb, 0xea);

alias MFVideoFormat_MPEG2 MFVideoFormat_MPG2;

mixin DEFINE_MEDIATYPE_GUID!("MFAudioFormat_Base", 0x00000000);
mixin DEFINE_MEDIATYPE_GUID!("MFAudioFormat_PCM", WAVE_FORMAT_PCM);
mixin DEFINE_MEDIATYPE_GUID!("MFAudioFormat_Float", WAVE_FORMAT_IEEE_FLOAT);
mixin DEFINE_MEDIATYPE_GUID!("MFAudioFormat_DTS", WAVE_FORMAT_DTS);
mixin DEFINE_MEDIATYPE_GUID!("MFAudioFormat_Dolby_AC3_SPDIF", WAVE_FORMAT_DOLBY_AC3_SPDIF);
mixin DEFINE_MEDIATYPE_GUID!("MFAudioFormat_DRM", WAVE_FORMAT_DRM);
mixin DEFINE_MEDIATYPE_GUID!("MFAudioFormat_WMAudioV8", WAVE_FORMAT_WMAUDIO2);
mixin DEFINE_MEDIATYPE_GUID!("MFAudioFormat_WMAudioV9", WAVE_FORMAT_WMAUDIO3);
mixin DEFINE_MEDIATYPE_GUID!("MFAudioFormat_WMAudio_Lossless", WAVE_FORMAT_WMAUDIO_LOSSLESS);
mixin DEFINE_MEDIATYPE_GUID!("MFAudioFormat_WMASPDIF", WAVE_FORMAT_WMASPDIF);
mixin DEFINE_MEDIATYPE_GUID!("MFAudioFormat_MSP1", WAVE_FORMAT_WMAVOICE9);
mixin DEFINE_MEDIATYPE_GUID!("MFAudioFormat_MP3", WAVE_FORMAT_MPEGLAYER3);
mixin DEFINE_MEDIATYPE_GUID!("MFAudioFormat_MPEG", WAVE_FORMAT_MPEG);
mixin DEFINE_MEDIATYPE_GUID!("MFAudioFormat_AAC", WAVE_FORMAT_MPEG_HEAAC);
mixin DEFINE_MEDIATYPE_GUID!("MFAudioFormat_ADTS", WAVE_FORMAT_MPEG_ADTS_AAC);

mixin DEFINE_GUID!("MFMPEG4Format_Base", 0x00000000, 0x767a, 0x494d, 0xb4, 0x78, 0xf2, 0x9d, 0x25, 0xdc, 0x90, 0x37);
mixin DEFINE_GUID!("MF_MT_MAJOR_TYPE", 0x48eba18e, 0xf8c9, 0x4687, 0xbf, 0x11, 0x0a, 0x74, 0xc9, 0xf9, 0x6a, 0x8f);
mixin DEFINE_GUID!("MF_MT_SUBTYPE", 0xf7e34c9a, 0x42e8, 0x4714, 0xb7, 0x4b, 0xcb, 0x29, 0xd7, 0x2c, 0x35, 0xe5);
mixin DEFINE_GUID!("MF_MT_ALL_SAMPLES_INDEPENDENT", 0xc9173739, 0x5e56, 0x461c, 0xb7, 0x13, 0x46, 0xfb, 0x99, 0x5c, 0xb9, 0x5f);
mixin DEFINE_GUID!("MF_MT_FIXED_SIZE_SAMPLES", 0xb8ebefaf, 0xb718, 0x4e04, 0xb0, 0xa9, 0x11, 0x67, 0x75, 0xe3, 0x32, 0x1b);
mixin DEFINE_GUID!("MF_MT_COMPRESSED", 0x3afd0cee, 0x18f2, 0x4ba5, 0xa1, 0x10, 0x8b, 0xea, 0x50, 0x2e, 0x1f, 0x92);
mixin DEFINE_GUID!("MF_MT_SAMPLE_SIZE", 0xdad3ab78, 0x1990, 0x408b, 0xbc, 0xe2, 0xeb, 0xa6, 0x73, 0xda, 0xcc, 0x10);
mixin DEFINE_GUID!("MF_MT_WRAPPED_TYPE", 0x4d3f7b23, 0xd02f, 0x4e6c, 0x9b, 0xee, 0xe4, 0xbf, 0x2c, 0x6c, 0x69, 0x5d);
mixin DEFINE_GUID!("MF_MT_AUDIO_NUM_CHANNELS", 0x37e48bf5, 0x645e, 0x4c5b, 0x89, 0xde, 0xad, 0xa9, 0xe2, 0x9b, 0x69, 0x6a);
mixin DEFINE_GUID!("MF_MT_AUDIO_SAMPLES_PER_SECOND", 0x5faeeae7, 0x0290, 0x4c31, 0x9e, 0x8a, 0xc5, 0x34, 0xf6, 0x8d, 0x9d, 0xba);
mixin DEFINE_GUID!("MF_MT_AUDIO_FLOAT_SAMPLES_PER_SECOND", 0xfb3b724a, 0xcfb5, 0x4319, 0xae, 0xfe, 0x6e, 0x42, 0xb2, 0x40, 0x61, 0x32);
mixin DEFINE_GUID!("MF_MT_AUDIO_AVG_BYTES_PER_SECOND", 0x1aab75c8, 0xcfef, 0x451c, 0xab, 0x95, 0xac, 0x03, 0x4b, 0x8e, 0x17, 0x31);
mixin DEFINE_GUID!("MF_MT_AUDIO_BLOCK_ALIGNMENT", 0x322de230, 0x9eeb, 0x43bd, 0xab, 0x7a, 0xff, 0x41, 0x22, 0x51, 0x54, 0x1d);
mixin DEFINE_GUID!("MF_MT_AUDIO_BITS_PER_SAMPLE", 0xf2deb57f, 0x40fa, 0x4764, 0xaa, 0x33, 0xed, 0x4f, 0x2d, 0x1f, 0xf6, 0x69);
mixin DEFINE_GUID!("MF_MT_AUDIO_VALID_BITS_PER_SAMPLE", 0xd9bf8d6a, 0x9530, 0x4b7c, 0x9d, 0xdf, 0xff, 0x6f, 0xd5, 0x8b, 0xbd, 0x06);
mixin DEFINE_GUID!("MF_MT_AUDIO_SAMPLES_PER_BLOCK", 0xaab15aac, 0xe13a, 0x4995, 0x92, 0x22, 0x50, 0x1e, 0xa1, 0x5c, 0x68, 0x77);
mixin DEFINE_GUID!("MF_MT_AUDIO_CHANNEL_MASK", 0x55fb5765, 0x644a, 0x4caf, 0x84, 0x79, 0x93, 0x89, 0x83, 0xbb, 0x15, 0x88);

struct MFFOLDDOWN_MATRIX {
	UINT32 cbSize;
	UINT32 cSrcChannels;
	UINT32 cDstChannels;
	UINT32 dwChannelMask;
	LONG[64] Coeff;
}

mixin DEFINE_GUID!("MF_MT_AUDIO_FOLDDOWN_MATRIX", 0x9d62927c, 0x36be, 0x4cf2, 0xb5, 0xc4, 0xa3, 0x92, 0x6e, 0x3e, 0x87, 0x11);
mixin DEFINE_GUID!("MF_MT_AUDIO_WMADRC_PEAKREF", 0x9d62927d, 0x36be, 0x4cf2, 0xb5, 0xc4, 0xa3, 0x92, 0x6e, 0x3e, 0x87, 0x11);
mixin DEFINE_GUID!("MF_MT_AUDIO_WMADRC_PEAKTARGET", 0x9d62927e, 0x36be, 0x4cf2, 0xb5, 0xc4, 0xa3, 0x92, 0x6e, 0x3e, 0x87, 0x11);
mixin DEFINE_GUID!("MF_MT_AUDIO_WMADRC_AVGREF", 0x9d62927f, 0x36be, 0x4cf2, 0xb5, 0xc4, 0xa3, 0x92, 0x6e, 0x3e, 0x87, 0x11);
mixin DEFINE_GUID!("MF_MT_AUDIO_WMADRC_AVGTARGET", 0x9d629280, 0x36be, 0x4cf2, 0xb5, 0xc4, 0xa3, 0x92, 0x6e, 0x3e, 0x87, 0x11);
mixin DEFINE_GUID!("MF_MT_AUDIO_PREFER_WAVEFORMATEX", 0xa901aaba, 0xe037, 0x458a, 0xbd, 0xf6, 0x54, 0x5b, 0xe2, 0x07, 0x40, 0x42);

//(WINVER >= _WIN32_WINNT_WIN7)
	mixin DEFINE_GUID!("MF_MT_AAC_PAYLOAD_TYPE", 0xbfbabe79, 0x7434, 0x4d1c, 0x94, 0xf0, 0x72, 0xa3, 0xb9, 0xe1, 0x71, 0x88);
	mixin DEFINE_GUID!("MF_MT_AAC_AUDIO_PROFILE_LEVEL_INDICATION", 0x7632f0e6, 0x9538, 0x4d61, 0xac, 0xda, 0xea, 0x29, 0xc8, 0xc1, 0x44, 0x56);

mixin DEFINE_GUID!("MF_MT_FRAME_SIZE", 0x1652c33d, 0xd6b2, 0x4012, 0xb8, 0x34, 0x72, 0x03, 0x08, 0x49, 0xa3, 0x7d);
mixin DEFINE_GUID!("MF_MT_FRAME_RATE", 0xc459a2e8, 0x3d2c, 0x4e44, 0xb1, 0x32, 0xfe, 0xe5, 0x15, 0x6c, 0x7b, 0xb0);
mixin DEFINE_GUID!("MF_MT_PIXEL_ASPECT_RATIO", 0xc6376a1e, 0x8d0a, 0x4027, 0xbe, 0x45, 0x6d, 0x9a, 0x0a, 0xd3, 0x9b, 0xb6);
mixin DEFINE_GUID!("MF_MT_DRM_FLAGS", 0x8772f323, 0x355a, 0x4cc7, 0xbb, 0x78, 0x6d, 0x61, 0xa0, 0x48, 0xae, 0x82);

enum {
	MFVideoDRMFlag_None                = 0,
	MFVideoDRMFlag_AnalogProtected    = 1,
	MFVideoDRMFlag_DigitallyProtected = 2,
}
alias int  MFVideoDRMFlags;

mixin DEFINE_GUID!("MF_MT_PAD_CONTROL_FLAGS", 0x4d0e73e5, 0x80ea, 0x4354, 0xa9, 0xd0, 0x11, 0x76, 0xce, 0xb0, 0x28, 0xea);

enum {
	MFVideoPadFlag_PAD_TO_None = 0,
	MFVideoPadFlag_PAD_TO_4x3  = 1,
	MFVideoPadFlag_PAD_TO_16x9 = 2
}
alias int MFVideoPadFlags;

mixin DEFINE_GUID!("MF_MT_SOURCE_CONTENT_HINT", 0x68aca3cc, 0x22d0, 0x44e6, 0x85, 0xf8, 0x28, 0x16, 0x71, 0x97, 0xfa, 0x38);

enum {
	MFVideoSrcContentHintFlag_None  = 0,
	MFVideoSrcContentHintFlag_16x9  = 1,
	MFVideoSrcContentHintFlag_235_1 = 2
}
alias int MFVideoSrcContentHintFlags;

mixin DEFINE_GUID!("MF_MT_VIDEO_CHROMA_SITING", 0x65df2370, 0xc773, 0x4c33, 0xaa, 0x64, 0x84, 0x3e, 0x06, 0x8e, 0xfb, 0x0c);
mixin DEFINE_GUID!("MF_MT_INTERLACE_MODE", 0xe2724bb8, 0xe676, 0x4806, 0xb4, 0xb2, 0xa8, 0xd6, 0xef, 0xb4, 0x4c, 0xcd);
mixin DEFINE_GUID!("MF_MT_TRANSFER_FUNCTION", 0x5fb0fce9, 0xbe5c, 0x4935, 0xa8, 0x11, 0xec, 0x83, 0x8f, 0x8e, 0xed, 0x93);
mixin DEFINE_GUID!("MF_MT_VIDEO_PRIMARIES", 0xdbfbe4d7, 0x0740, 0x4ee0, 0x81, 0x92, 0x85, 0x0a, 0xb0, 0xe2, 0x19, 0x35);
mixin DEFINE_GUID!("MF_MT_CUSTOM_VIDEO_PRIMARIES", 0x47537213, 0x8cfb, 0x4722, 0xaa, 0x34, 0xfb, 0xc9, 0xe2, 0x4d, 0x77, 0xb8);

struct MT_CUSTOM_VIDEO_PRIMARIES {
	float fRx;
	float fRy;
	float fGx;
	float fGy;
	float fBx;
	float fBy;
	float fWx;
	float fWy;
}

mixin DEFINE_GUID!("MF_MT_YUV_MATRIX", 0x3e23d450, 0x2c75, 0x4d25, 0xa0, 0x0e, 0xb9, 0x16, 0x70, 0xd1, 0x23, 0x27);
mixin DEFINE_GUID!("MF_MT_VIDEO_LIGHTING", 0x53a0529c, 0x890b, 0x4216, 0x8b, 0xf9, 0x59, 0x93, 0x67, 0xad, 0x6d, 0x20);
mixin DEFINE_GUID!("MF_MT_VIDEO_NOMINAL_RANGE", 0xc21b8ee5, 0xb956, 0x4071, 0x8d, 0xaf, 0x32, 0x5e, 0xdf, 0x5c, 0xab, 0x11);
mixin DEFINE_GUID!("MF_MT_GEOMETRIC_APERTURE", 0x66758743, 0x7e5f, 0x400d, 0x98, 0x0a, 0xaa, 0x85, 0x96, 0xc8, 0x56, 0x96);
mixin DEFINE_GUID!("MF_MT_MINIMUM_DISPLAY_APERTURE", 0xd7388766, 0x18fe, 0x48c6, 0xa1, 0x77, 0xee, 0x89, 0x48, 0x67, 0xc8, 0xc4);
mixin DEFINE_GUID!("MF_MT_PAN_SCAN_APERTURE", 0x79614dde, 0x9187, 0x48fb, 0xb8, 0xc7, 0x4d, 0x52, 0x68, 0x9d, 0xe6, 0x49);
mixin DEFINE_GUID!("MF_MT_PAN_SCAN_ENABLED", 0x4b7f6bc3, 0x8b13, 0x40b2, 0xa9, 0x93, 0xab, 0xf6, 0x30, 0xb8, 0x20, 0x4e);
mixin DEFINE_GUID!("MF_MT_AVG_BITRATE", 0x20332624, 0xfb0d, 0x4d9e, 0xbd, 0x0d, 0xcb, 0xf6, 0x78, 0x6c, 0x10, 0x2e);
mixin DEFINE_GUID!("MF_MT_AVG_BIT_ERROR_RATE", 0x799cabd6, 0x3508, 0x4db4, 0xa3, 0xc7, 0x56, 0x9c, 0xd5, 0x33, 0xde, 0xb1);
mixin DEFINE_GUID!("MF_MT_MAX_KEYFRAME_SPACING", 0xc16eb52b, 0x73a1, 0x476f, 0x8d, 0x62, 0x83, 0x9d, 0x6a, 0x02, 0x06, 0x52);
mixin DEFINE_GUID!("MF_MT_DEFAULT_STRIDE", 0x644b4e48, 0x1e02, 0x4516, 0xb0, 0xeb, 0xc0, 0x1c, 0xa9, 0xd4, 0x9a, 0xc6);
mixin DEFINE_GUID!("MF_MT_PALETTE", 0x6d283f42, 0x9846, 0x4410, 0xaf, 0xd9, 0x65, 0x4d, 0x50, 0x3b, 0x1a, 0x54);
mixin DEFINE_GUID!("MF_MT_USER_DATA", 0xb6bc765f, 0x4c3b, 0x40a4, 0xbd, 0x51, 0x25, 0x35, 0xb6, 0x6f, 0xe0, 0x9d);
mixin DEFINE_GUID!("MF_MT_AM_FORMAT_TYPE", 0x73d1072d, 0x1870, 0x4174, 0xa0, 0x63, 0x29, 0xff, 0x4f, 0xf6, 0xc1, 0x1e);
mixin DEFINE_GUID!("MF_MT_MPEG_START_TIME_CODE", 0x91f67885, 0x4333, 0x4280, 0x97, 0xcd, 0xbd, 0x5a, 0x6c, 0x03, 0xa0, 0x6e);
mixin DEFINE_GUID!("MF_MT_MPEG2_PROFILE", 0xad76a80b, 0x2d5c, 0x4e0b, 0xb3, 0x75, 0x64, 0xe5, 0x20, 0x13, 0x70, 0x36);
mixin DEFINE_GUID!("MF_MT_MPEG2_LEVEL", 0x96f66574, 0x11c5, 0x4015, 0x86, 0x66, 0xbf, 0xf5, 0x16, 0x43, 0x6d, 0xa7);
mixin DEFINE_GUID!("MF_MT_MPEG2_FLAGS", 0x31e3991d, 0xf701, 0x4b2f, 0xb4, 0x26, 0x8a, 0xe3, 0xbd, 0xa9, 0xe0, 0x4b);
mixin DEFINE_GUID!("MF_MT_MPEG_SEQUENCE_HEADER", 0x3c036de7, 0x3ad0, 0x4c9e, 0x92, 0x16, 0xee, 0x6d, 0x6a, 0xc2, 0x1c, 0xb3);
mixin DEFINE_GUID!("MF_MT_DV_AAUX_SRC_PACK_0", 0x84bd5d88, 0x0fb8, 0x4ac8, 0xbe, 0x4b, 0xa8, 0x84, 0x8b, 0xef, 0x98, 0xf3);
mixin DEFINE_GUID!("MF_MT_DV_AAUX_CTRL_PACK_0", 0xf731004e, 0x1dd1, 0x4515, 0xaa, 0xbe, 0xf0, 0xc0, 0x6a, 0xa5, 0x36, 0xac);
mixin DEFINE_GUID!("MF_MT_DV_AAUX_SRC_PACK_1", 0x720e6544, 0x0225, 0x4003, 0xa6, 0x51, 0x01, 0x96, 0x56, 0x3a, 0x95, 0x8e);
mixin DEFINE_GUID!("MF_MT_DV_AAUX_CTRL_PACK_1", 0xcd1f470d, 0x1f04, 0x4fe0, 0xbf, 0xb9, 0xd0, 0x7a, 0xe0, 0x38, 0x6a, 0xd8);
mixin DEFINE_GUID!("MF_MT_DV_VAUX_SRC_PACK", 0x41402d9d, 0x7b57, 0x43c6, 0xb1, 0x29, 0x2c, 0xb9, 0x97, 0xf1, 0x50, 0x09);
mixin DEFINE_GUID!("MF_MT_DV_VAUX_CTRL_PACK", 0x2f84e1c4, 0x0da1, 0x4788, 0x93, 0x8e, 0x0d, 0xfb, 0xfb, 0xb3, 0x4b, 0x48);

//(WINVER >= _WIN32_WINNT_WIN7)
	struct MT_ARBITRARY_HEADER {
		GUID majortype;
		GUID subtype;
		BOOL bFixedSizeSamples;
		BOOL bTemporalCompression;
		ULONG lSampleSize;
		GUID formattype;
	}

	mixin DEFINE_GUID!("MF_MT_ARBITRARY_HEADER", 0x9e6bd6f5, 0x109, 0x4f95, 0x84, 0xac, 0x93, 0x9, 0x15, 0x3a, 0x19, 0xfc);
	mixin DEFINE_GUID!("MF_MT_ARBITRARY_FORMAT", 0x5a75b249, 0xd7d, 0x49a1, 0xa1, 0xc3, 0xe0, 0xd8, 0x7f, 0xc, 0xad, 0xe5);
	mixin DEFINE_GUID!("MF_MT_IMAGE_LOSS_TOLERANT", 0xed062cf4, 0xe34e, 0x4922, 0xbe, 0x99, 0x93, 0x40, 0x32, 0x13, 0x3d, 0x7c);
	mixin DEFINE_GUID!("MF_MT_MPEG4_SAMPLE_DESCRIPTION", 0x261e9d83, 0x9529, 0x4b8f, 0xa1, 0x11, 0x8b, 0x9c, 0x95, 0x0a, 0x81, 0xa9);
	mixin DEFINE_GUID!("MF_MT_MPEG4_CURRENT_SAMPLE_ENTRY", 0x9aa7e155, 0xb64a, 0x4c1d, 0xa5, 0x00, 0x45, 0x5d, 0x60, 0x0b, 0x65, 0x60);
	mixin DEFINE_GUID!("MF_MT_ORIGINAL_4CC", 0xd7be3fe0, 0x2bc7, 0x492d, 0xb8, 0x43, 0x61, 0xa1, 0x91, 0x9b, 0x70, 0xc3);
	mixin DEFINE_GUID!("MF_MT_ORIGINAL_WAVE_FORMAT_TAG", 0x8cbbc843, 0x9fd9, 0x49c2, 0x88, 0x2f, 0xa7, 0x25, 0x86, 0xc4, 0x08, 0xad);
	mixin DEFINE_GUID!("MF_MT_FRAME_RATE_RANGE_MIN", 0xd2e7558c, 0xdc1f, 0x403f, 0x9a, 0x72, 0xd2, 0x8b, 0xb1, 0xeb, 0x3b, 0x5e);
	mixin DEFINE_GUID!("MF_MT_FRAME_RATE_RANGE_MAX", 0xe3371d41, 0xb4cf, 0x4a05, 0xbd, 0x4e, 0x20, 0xb8, 0x8b, 0xb2, 0xc4, 0xd6);

mixin DEFINE_GUID!("MFMediaType_Default", 0x81A412E6, 0x8103, 0x4B06, 0x85, 0x7F, 0x18, 0x62, 0x78, 0x10, 0x24, 0xAC);
mixin DEFINE_GUID!("MFMediaType_Audio", 0x73647561, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xAA, 0x00, 0x38, 0x9B, 0x71);
mixin DEFINE_GUID!("MFMediaType_Video", 0x73646976, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xAA, 0x00, 0x38, 0x9B, 0x71);
mixin DEFINE_GUID!("MFMediaType_Protected", 0x7b4b6fe6, 0x9d04, 0x4494, 0xbe, 0x14, 0x7e, 0x0b, 0xd0, 0x76, 0xc8, 0xe4);
mixin DEFINE_GUID!("MFMediaType_SAMI", 0xe69669a0, 0x3dcd, 0x40cb, 0x9e, 0x2e, 0x37, 0x08, 0x38, 0x7c, 0x06, 0x16);
mixin DEFINE_GUID!("MFMediaType_Script", 0x72178C22, 0xE45B, 0x11D5, 0xBC, 0x2A, 0x00, 0xB0, 0xD0, 0xF3, 0xF4, 0xAB);
mixin DEFINE_GUID!("MFMediaType_Image", 0x72178C23, 0xE45B, 0x11D5, 0xBC, 0x2A, 0x00, 0xB0, 0xD0, 0xF3, 0xF4, 0xAB);
mixin DEFINE_GUID!("MFMediaType_HTML", 0x72178C24, 0xE45B, 0x11D5, 0xBC, 0x2A, 0x00, 0xB0, 0xD0, 0xF3, 0xF4, 0xAB);
mixin DEFINE_GUID!("MFMediaType_Binary", 0x72178C25, 0xE45B, 0x11D5, 0xBC, 0x2A, 0x00, 0xB0, 0xD0, 0xF3, 0xF4, 0xAB);
mixin DEFINE_GUID!("MFMediaType_FileTransfer", 0x72178C26, 0xE45B, 0x11D5, 0xBC, 0x2A, 0x00, 0xB0, 0xD0, 0xF3, 0xF4, 0xAB);
mixin DEFINE_GUID!("AM_MEDIA_TYPE_REPRESENTATION", 0xe2e42ad2, 0x132c, 0x491e, 0xa2, 0x68, 0x3c, 0x7c, 0x2d, 0xca, 0x18, 0x1f);
mixin DEFINE_GUID!("FORMAT_MFVideoFormat", 0xaed4ab2d, 0x7326, 0x43cb, 0x94, 0x64, 0xc8, 0x79, 0xca, 0xb9, 0xc4, 0x3d);

/*
struct tagVIDEOINFOHEADER;
typedef struct tagVIDEOINFOHEADER VIDEOINFOHEADER;
struct tagVIDEOINFOHEADER2;
typedef struct tagVIDEOINFOHEADER2 VIDEOINFOHEADER2;
struct tagMPEG1VIDEOINFO;
typedef struct tagMPEG1VIDEOINFO MPEG1VIDEOINFO;
struct tagMPEG2VIDEOINFO;
typedef struct tagMPEG2VIDEOINFO MPEG2VIDEOINFO;
struct _AMMediaType;
typedef struct _AMMediaType AM_MEDIA_TYPE;
*/

export extern(Windows) HRESULT MFValidateMediaTypeSize(GUID FormatType, UINT8* pBlock, UINT32 cbSize);
export extern(Windows) HRESULT MFCreateMediaType(IMFMediaType* ppMFType);
export extern(Windows) HRESULT MFCreateMFVideoFormatFromMFMediaType(IMFMediaType pMFType, MFVIDEOFORMAT** ppMFVF, UINT32* pcbSize);

enum {
	MFWaveFormatExConvertFlag_Normal          = 0,
	MFWaveFormatExConvertFlag_ForceExtensible = 1
}
alias int MFWaveFormatExConvertFlags;

export extern(Windows) HRESULT MFCreateWaveFormatExFromMFMediaType(IMFMediaType pMFType, WAVEFORMATEX** ppWF, UINT32* pcbSize, UINT32 Flags = MFWaveFormatExConvertFlag_Normal);
export extern(Windows) HRESULT MFInitMediaTypeFromVideoInfoHeader(IMFMediaType pMFType, const(VIDEOINFOHEADER)* pVIH, UINT32 cbBufSize, const(GUID)* pSubtype = null);
export extern(Windows) HRESULT MFInitMediaTypeFromVideoInfoHeader2(IMFMediaType pMFType, const(VIDEOINFOHEADER2)* pVIH2, UINT32 cbBufSize, const(GUID)* pSubtype = null);
export extern(Windows) HRESULT MFInitMediaTypeFromMPEG1VideoInfo(IMFMediaType pMFType, const(MPEG1VIDEOINFO)* pMP1VI, UINT32 cbBufSize, const(GUID)* pSubtype = null);
export extern(Windows) HRESULT MFInitMediaTypeFromMPEG2VideoInfo(IMFMediaType pMFType, const(MPEG2VIDEOINFO)* pMP2VI, UINT32 cbBufSize, const(GUID)* pSubtype = null);
export extern(Windows) HRESULT MFCalculateBitmapImageSize(const(BITMAPINFOHEADER)* pBMIH, UINT32 cbBufSize, UINT32* pcbImageSize, BOOL* pbKnown = null);

export extern(Windows) HRESULT MFCalculateImageSize(REFGUID guidSubtype, UINT32 unWidth, UINT32 unHeight, UINT32* pcbImageSize);
export extern(Windows) HRESULT MFFrameRateToAverageTimePerFrame(UINT32 unNumerator, UINT32 unDenominator, UINT64* punAverageTimePerFrame);
export extern(Windows) HRESULT MFAverageTimePerFrameToFrameRate(UINT64 unAverageTimePerFrame, UINT32* punNumerator, UINT32* punDenominator);
export extern(Windows) HRESULT MFInitMediaTypeFromMFVideoFormat(IMFMediaType pMFType, const(MFVIDEOFORMAT)* pMFVF, UINT32 cbBufSize);
export extern(Windows) HRESULT MFInitMediaTypeFromWaveFormatEx(IMFMediaType pMFType, const(WAVEFORMATEX)* pWaveFormat, UINT32 cbBufSize);
export extern(Windows) HRESULT MFInitMediaTypeFromAMMediaType(IMFMediaType pMFType, const(AM_MEDIA_TYPE)* pAMType);
export extern(Windows) HRESULT MFInitAMMediaTypeFromMFMediaType(IMFMediaType pMFType, GUID guidFormatBlockType, AM_MEDIA_TYPE* pAMType);
export extern(Windows) HRESULT MFCreateAMMediaTypeFromMFMediaType(IMFMediaType* pMFType, GUID guidFormatBlockType, AM_MEDIA_TYPE** ppAMType);
export extern(Windows) BOOL MFCompareFullToPartialMediaType(IMFMediaType pMFTypeFull, IMFMediaType pMFTypePartial);
export extern(Windows) HRESULT MFWrapMediaType(IMFMediaType pOrig, REFGUID MajorType, REFGUID SubType, IMFMediaType* ppWrap);
export extern(Windows) HRESULT MFUnwrapMediaType(IMFMediaType pWrap, IMFMediaType* ppOrig);

export extern(Windows) HRESULT MFCreateVideoMediaTypeFromVideoInfoHeader(const(KS_VIDEOINFOHEADER)* pVideoInfoHeader, DWORD cbVideoInfoHeader, DWORD dwPixelAspectRatioX, DWORD dwPixelAspectRatioY, MFVideoInterlaceMode InterlaceMode, QWORD VideoFlags, const(GUID)* pSubtype, IMFVideoMediaType* ppIVideoMediaType);
export extern(Windows) HRESULT MFCreateVideoMediaTypeFromVideoInfoHeader2(const(KS_VIDEOINFOHEADER2)* pVideoInfoHeader, DWORD cbVideoInfoHeader, QWORD AdditionalVideoFlags, const(GUID)* pSubtype, IMFVideoMediaType* ppIVideoMediaType);

export extern(Windows) HRESULT MFCreateVideoMediaType(const(MFVIDEOFORMAT)* pVideoFormat, IMFVideoMediaType* ppIVideoMediaType);

export extern(Windows) HRESULT MFCreateVideoMediaTypeFromSubtype(const(GUID)* pAMSubtype, IMFVideoMediaType* ppIVideoMediaType);
export extern(Windows) BOOL MFIsFormatYUV(DWORD Format);
export extern(Windows) HRESULT MFCreateVideoMediaTypeFromBitMapInfoHeader(const(BITMAPINFOHEADER)* pbmihBitMapInfoHeader, DWORD dwPixelAspectRatioX, DWORD dwPixelAspectRatioY, MFVideoInterlaceMode InterlaceMode, QWORD VideoFlags, QWORD qwFramesPerSecondNumerator, QWORD qwFramesPerSecondDenominator, DWORD dwMaxBitRate, IMFVideoMediaType* ppIVideoMediaType);
export extern(Windows) HRESULT MFGetStrideForBitmapInfoHeader(DWORD format, DWORD dwWidth, LONG* pStride);
export extern(Windows) HRESULT MFGetPlaneSize(DWORD format, DWORD dwWidth, DWORD dwHeight, DWORD* pdwPlaneSize);

static if(WINVER >= _WIN32_WINNT_WIN7)
	export extern(Windows) HRESULT MFCreateVideoMediaTypeFromBitMapInfoHeaderEx(const(BITMAPINFOHEADER)* pbmihBitMapInfoHeader, UINT32 cbBitMapInfoHeader, DWORD dwPixelAspectRatioX, DWORD dwPixelAspectRatioY, MFVideoInterlaceMode InterlaceMode, QWORD VideoFlags, DWORD dwFramesPerSecondNumerator, DWORD dwFramesPerSecondDenominator, DWORD dwMaxBitRate, IMFVideoMediaType* ppIVideoMediaType);
export extern(Windows) HRESULT MFCreateMediaTypeFromRepresentation(GUID guidRepresentation, LPVOID pvRepresentation, IMFMediaType* ppIMediaType);
export extern(Windows) HRESULT MFCreateAudioMediaType(const(WAVEFORMATEX)* pAudioFormat, IMFAudioMediaType* ppIAudioMediaType);
export extern(Windows) DWORD MFGetUncompressedVideoFormat(const(MFVIDEOFORMAT)* pVideoFormat);
export extern(Windows) HRESULT MFInitVideoFormat(MFVIDEOFORMAT* pVideoFormat, MFStandardVideoFormat type);
export extern(Windows) HRESULT MFInitVideoFormat_RGB(MFVIDEOFORMAT* pVideoFormat, DWORD dwWidth, DWORD dwHeight, DWORD D3Dfmt);
export extern(Windows) HRESULT MFConvertColorInfoToDXVA(DWORD* pdwToDXVA, const(MFVIDEOFORMAT)* pFromFormat);
export extern(Windows) HRESULT MFConvertColorInfoFromDXVA(MFVIDEOFORMAT* pToFormat, DWORD dwFromDXVA);
export extern(Windows) HRESULT MFCopyImage(BYTE* pDest, LONG lDestStride, const(BYTE)* pSrc, LONG lSrcStride, DWORD dwWidthInBytes, DWORD dwLines);
export extern(Windows) HRESULT MFConvertFromFP16Array(float* pDest, const(WORD)* pSrc, DWORD dwCount);
export extern(Windows) HRESULT MFConvertToFP16Array(WORD* pDest, const(float)* pSrc, DWORD dwCount);

UINT32 HI32(UINT64 unPacked)
{
	return cast(UINT32)(unPacked >> 32);
}

UINT32 LO32(UINT64 unPacked)
{
	return cast(UINT32)unPacked;
}

UINT64 Pack2UINT32AsUINT64(UINT32 unHigh, UINT32 unLow)
{
	return (cast(UINT64)unHigh << 32) | unLow;
}

void Unpack2UINT32AsUINT64(UINT64 unPacked, UINT32* punHigh, UINT32* punLow)
{
	*punHigh = HI32(unPacked);
	*punLow = LO32(unPacked);
}

UINT64 PackSize(UINT32 unWidth, UINT32 unHeight)
{
	return Pack2UINT32AsUINT64(unWidth, unHeight);
}

void UnpackSize(UINT64 unPacked, UINT32* punWidth, UINT32* punHeight)
{
	Unpack2UINT32AsUINT64(unPacked, punWidth, punHeight);
}

UINT64 PackRatio(INT32 nNumerator, UINT32 unDenominator)
{
	return Pack2UINT32AsUINT64(cast(UINT32)nNumerator, unDenominator);
}

void UnpackRatio(UINT64 unPacked, INT32* pnNumerator, UINT32* punDenominator)
{
	Unpack2UINT32AsUINT64(unPacked, cast(UINT32*)pnNumerator, punDenominator);
}

UINT32 MFGetAttributeUINT32(IMFAttributes pAttributes, REFGUID guidKey, UINT32 unDefault)
{
	UINT32 unRet;

	if(FAILED(pAttributes.GetUINT32(guidKey, &unRet))){
		unRet = unDefault;
	}
	return unRet;
}

UINT64 MFGetAttributeUINT64(IMFAttributes pAttributes, REFGUID guidKey, UINT64 unDefault)
{
	UINT64 unRet;

	if(FAILED(pAttributes.GetUINT64(guidKey, &unRet))){
		unRet = unDefault;
	}
	return unRet;
}

double MFGetAttributeDouble(IMFAttributes pAttributes, REFGUID guidKey, double fDefault)
{
	double fRet;

	if(FAILED(pAttributes.GetDouble(guidKey, &fRet))){
		fRet = fDefault;
	}
	return fRet;
}

HRESULT MFGetAttribute2UINT32asUINT64(IMFAttributes pAttributes, REFGUID guidKey, UINT32* punHigh32, UINT32* punLow32)
{
	UINT64 unPacked;
	HRESULT hr = S_OK;

	hr = pAttributes.GetUINT64(guidKey, &unPacked);
	if(FAILED(hr)){
		return hr;
	}
	Unpack2UINT32AsUINT64(unPacked, punHigh32, punLow32);

	return hr;
}

HRESULT MFSetAttribute2UINT32asUINT64(IMFAttributes pAttributes, REFGUID guidKey, UINT32 unHigh32, UINT32 unLow32)
{
	return pAttributes.SetUINT64(guidKey, Pack2UINT32AsUINT64(unHigh32, unLow32));
}

HRESULT MFGetAttributeRatio(IMFAttributes pAttributes, REFGUID guidKey, UINT32* punNumerator, UINT32* punDenominator)
{
	return MFGetAttribute2UINT32asUINT64(pAttributes, guidKey, punNumerator, punDenominator);
}

HRESULT MFGetAttributeSize(IMFAttributes pAttributes, REFGUID guidKey, UINT32* punWidth, UINT32* punHeight)
{
	return MFGetAttribute2UINT32asUINT64(pAttributes, guidKey, punWidth, punHeight);
}

HRESULT MFSetAttributeRatio(IMFAttributes pAttributes, REFGUID guidKey, UINT32 unNumerator, UINT32 unDenominator)
{
	return MFSetAttribute2UINT32asUINT64(pAttributes, guidKey, unNumerator, unDenominator);
}

HRESULT MFSetAttributeSize(IMFAttributes pAttributes, REFGUID guidKey, UINT32 unWidth, UINT32 unHeight)
{
	return MFSetAttribute2UINT32asUINT64(pAttributes, guidKey, unWidth, unHeight);
}

enum {
	eAllocationTypeDynamic,
	eAllocationTypeRT,
	eAllocationTypePageable,
	eAllocationTypeIgnore
}
alias int EAllocationType;

extern extern(C) void* MFHeapAlloc(size_t nSize, ULONG dwFlags, char* pszFile, int line, EAllocationType eat);
extern extern(C) void MFHeapFree(void* pv);
export extern(Windows) HRESULT MFCreateCollection(IMFCollection **ppIMFCollection);
mixin DEFINE_GUID!("CLSID_MFSourceResolver", 0x90eab60f, 0xe43a, 0x4188, 0xbc, 0xc4, 0xe4, 0x7f, 0xdf, 0x04, 0x86, 0x8c);

static if(WINVER >= _WIN32_WINNT_WIN7)
	export extern(Windows) LONGLONG MFllMulDiv(LONGLONG a, LONGLONG b, LONGLONG c, LONGLONG d);

}// extern(C)
