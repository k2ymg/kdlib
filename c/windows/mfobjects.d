/** mfobjects.d

Converted from 'mfobjects.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.mfobjects;


import c.windows.windef;
import c.windows.wtypes;
import c.windows.guiddef;
import c.windows.unknwn;
import c.windows.propidl;
import c.windows.objidl;
import c.windows.oaidl;
import c.windows.rpcdcep;
import c.windows.mmsystem;


extern(C){

//alias ULONGLONG QWORD;// to windef

enum {
	MF_ATTRIBUTE_UINT32   = VT_UI4,
	MF_ATTRIBUTE_UINT64   = VT_UI8,
	MF_ATTRIBUTE_DOUBLE   = VT_R8,
	MF_ATTRIBUTE_GUID     = VT_CLSID,
	MF_ATTRIBUTE_STRING   = VT_LPWSTR,
	MF_ATTRIBUTE_BLOB     = VT_VECTOR | VT_UI1,
	MF_ATTRIBUTE_IUNKNOWN = VT_UNKNOWN
}
alias int MF_ATTRIBUTE_TYPE;

enum {
	MF_ATTRIBUTES_MATCH_OUR_ITEMS    = 0,
	MF_ATTRIBUTES_MATCH_THEIR_ITEMS  = 1,
	MF_ATTRIBUTES_MATCH_ALL_ITEMS    = 2,
	MF_ATTRIBUTES_MATCH_INTERSECTION = 3,
	MF_ATTRIBUTES_MATCH_SMALLER      = 4
}
alias int MF_ATTRIBUTES_MATCH_TYPE;

//extern extern(C) const IID IID_IMFAttributes;
interface IMFAttributes : IUnknown {
public extern(Windows):
	HRESULT GetItem(REFGUID guidKey, PROPVARIANT* pValue);
	HRESULT GetItemType(REFGUID guidKey, MF_ATTRIBUTE_TYPE* pType);
	HRESULT CompareItem(REFGUID guidKey, REFPROPVARIANT Value, BOOL* pbResult);
	HRESULT Compare(IMFAttributes pTheirs, MF_ATTRIBUTES_MATCH_TYPE MatchType, BOOL* pbResult);
	HRESULT GetUINT32(REFGUID guidKey, UINT32* punValue);
	HRESULT GetUINT64(REFGUID guidKey, UINT64* punValue);
	HRESULT GetDouble(REFGUID guidKey, double* pfValue);
	HRESULT GetGUID(REFGUID guidKey, GUID* pguidValue);
	HRESULT GetStringLength(REFGUID guidKey, UINT32* pcchLength);
	HRESULT GetString(REFGUID guidKey, LPWSTR pwszValue, UINT32 cchBufSize, UINT32* pcchLength);
	HRESULT GetAllocatedString(REFGUID guidKey, LPWSTR* ppwszValue, UINT32* pcchLength);
	HRESULT GetBlobSize(REFGUID guidKey, UINT32* pcbBlobSize);
	HRESULT GetBlob(REFGUID guidKey, UINT8* pBuf, UINT32 cbBufSize, UINT32* pcbBlobSize);
	HRESULT GetAllocatedBlob(REFGUID guidKey, UINT8** ppBuf, UINT32* pcbSize);
	HRESULT GetUnknown(REFGUID guidKey, REFIID riid, LPVOID* ppv);
	HRESULT SetItem(REFGUID guidKey, REFPROPVARIANT Value);
	HRESULT DeleteItem(REFGUID guidKey);
	HRESULT DeleteAllItems();
	HRESULT SetUINT32(REFGUID guidKey, UINT32 unValue);
	HRESULT SetUINT64(REFGUID guidKey, UINT64 unValue);
	HRESULT SetDouble(REFGUID guidKey, double fValue);
	HRESULT SetGUID(REFGUID guidKey, REFGUID guidValue);
	HRESULT SetString(REFGUID guidKey, LPCWSTR wszValue);
	HRESULT SetBlob(REFGUID guidKey, const(UINT8)* pBuf, UINT32 cbBufSize);
	HRESULT SetUnknown(REFGUID guidKey, IUnknown pUnknown);
	HRESULT LockStore();
	HRESULT UnlockStore();
	HRESULT GetCount(UINT32* pcItems);
	HRESULT GetItemByIndex(UINT32 unIndex, GUID* pguidKey, PROPVARIANT* pValue);
	HRESULT CopyAllItems(IMFAttributes pDest);
}
mixin DEFINE_IID!(IMFAttributes, "2cd2d921-c447-44a7-a13c-4adabfc247e3");

enum {
	MF_ATTRIBUTE_SERIALIZE_UNKNOWN_BYREF = 0x1
}
alias int MF_ATTRIBUTE_SERIALIZE_OPTIONS;

export extern(Windows) HRESULT MFSerializeAttributesToStream(IMFAttributes pAttr, DWORD dwOptions, IStream pStm);
export extern(Windows) HRESULT MFDeserializeAttributesFromStream(IMFAttributes pAttr, DWORD dwOptions, IStream pStm);

//extern extern(C) const IID IID_IMFMediaBuffer;
interface IMFMediaBuffer : IUnknown {
public extern(Windows):
	HRESULT Lock(BYTE** ppbBuffer, DWORD* pcbMaxLength, DWORD* pcbCurrentLength);
	HRESULT Unlock();
	HRESULT GetCurrentLength(DWORD* pcbCurrentLength);
	HRESULT SetCurrentLength(DWORD cbCurrentLength);
	HRESULT GetMaxLength(DWORD* pcbMaxLength);
}
mixin DEFINE_IID!(IMFMediaBuffer, "045FA593-8799-42b8-BC8D-8968C6453507");

//extern extern(C) const IID IID_IMFSample;
interface IMFSample : IMFAttributes {
public extern(Windows):
	HRESULT GetSampleFlags(DWORD* pdwSampleFlags);
	HRESULT SetSampleFlags(DWORD dwSampleFlags);
	HRESULT GetSampleTime(LONGLONG* phnsSampleTime);
	HRESULT SetSampleTime(LONGLONG hnsSampleTime);
	HRESULT GetSampleDuration(LONGLONG* phnsSampleDuration);
	HRESULT SetSampleDuration(LONGLONG hnsSampleDuration);
	HRESULT GetBufferCount(DWORD* pdwBufferCount);
	HRESULT GetBufferByIndex(DWORD dwIndex, IMFMediaBuffer* ppBuffer);
	HRESULT ConvertToContiguousBuffer(IMFMediaBuffer* ppBuffer);
	HRESULT AddBuffer(IMFMediaBuffer pBuffer);
	HRESULT RemoveBufferByIndex(DWORD dwIndex);
	HRESULT RemoveAllBuffers();
	HRESULT GetTotalLength(DWORD* pcbTotalLength);
	HRESULT CopyToBuffer(IMFMediaBuffer pBuffer);
}
mixin DEFINE_IID!(IMFSample, "c40a00f2-b93a-4d80-ae8c-5a1c634f58e4");

//extern extern(C) const IID IID_IMF2DBuffer;
interface IMF2DBuffer : IUnknown {
public extern(Windows):
	HRESULT Lock2D(BYTE** pbScanline0, LONG* plPitch);
	HRESULT Unlock2D();
	HRESULT GetScanline0AndPitch(BYTE** pbScanline0, LONG* plPitch);
	HRESULT IsContiguousFormat(BOOL* pfIsContiguous);
	HRESULT GetContiguousLength(DWORD* pcbLength);
	HRESULT ContiguousCopyTo(BYTE* pbDestBuffer, DWORD cbDestBuffer);
	HRESULT ContiguousCopyFrom(const(BYTE)* pbSrcBuffer, DWORD cbSrcBuffer);
}
mixin DEFINE_IID!(IMF2DBuffer, "7DC9D5F9-9ED9-44ec-9BBF-0600BB589FBB");

//extern extern(C) const IID IID_IMFMediaType;
interface IMFMediaType : IMFAttributes {
public extern(Windows):
	HRESULT GetMajorType(GUID* pguidMajorType);
	HRESULT IsCompressedFormat(BOOL* pfCompressed);
	HRESULT IsEqual(IMFMediaType pIMediaType, DWORD* pdwFlags);
	HRESULT GetRepresentation(GUID guidRepresentation, LPVOID* ppvRepresentation);
	HRESULT FreeRepresentation(GUID guidRepresentation, LPVOID pvRepresentation);
}
mixin DEFINE_IID!(IMFMediaType, "44ae0fa8-ea31-4109-8d2e-4cae4997c555");

enum {
	MF_MEDIATYPE_EQUAL_MAJOR_TYPES      = 0x00000001,
	MF_MEDIATYPE_EQUAL_FORMAT_TYPES     = 0x00000002,
	MF_MEDIATYPE_EQUAL_FORMAT_DATA      = 0x00000004,
	MF_MEDIATYPE_EQUAL_FORMAT_USER_DATA = 0x00000008,
}

//extern extern(C) const IID IID_IMFAudioMediaType;
interface IMFAudioMediaType : IMFMediaType {
public extern(Windows):
	const(WAVEFORMATEX)* GetAudioFormat();
}
mixin DEFINE_IID!(IMFAudioMediaType, "26a0adc3-ce26-4672-9304-69552edd3faf");

struct MFT_REGISTER_TYPE_INFO {
	GUID guidMajorType;
	GUID guidSubtype;
}

enum {
	MFVideoInterlace_Unknown                     = 0,
	MFVideoInterlace_Progressive                 = 2,
	MFVideoInterlace_FieldInterleavedUpperFirst  = 3,
	MFVideoInterlace_FieldInterleavedLowerFirst  = 4,
	MFVideoInterlace_FieldSingleUpper            = 5,
	MFVideoInterlace_FieldSingleLower            = 6,
	MFVideoInterlace_MixedInterlaceOrProgressive = 7,
	MFVideoInterlace_Last                        = MFVideoInterlace_MixedInterlaceOrProgressive + 1,
	MFVideoInterlace_ForceDWORD                  = 0x7fffffff
}
alias int MFVideoInterlaceMode;

alias MFVideoInterlace_FieldSingleUpper MFVideoInterlace_FieldSingleUpperFirst;
alias MFVideoInterlace_FieldSingleLower MFVideoInterlace_FieldSingleLowerFirst;

enum {
	MFVideoTransFunc_Unknown    = 0,
	MFVideoTransFunc_10         = 1,
	MFVideoTransFunc_18         = 2,
	MFVideoTransFunc_20         = 3,
	MFVideoTransFunc_22         = 4,
	MFVideoTransFunc_709        = 5,
	MFVideoTransFunc_240M       = 6,
	MFVideoTransFunc_sRGB       = 7,
	MFVideoTransFunc_28         = 8,
	MFVideoTransFunc_Log_100    = 9,
	MFVideoTransFunc_Log_316    = 10,
	MFVideoTransFunc_709_sym    = 11,
	MFVideoTransFunc_Last       = MFVideoTransFunc_709_sym + 1,
	MFVideoTransFunc_ForceDWORD = 0x7fffffff
}
alias int MFVideoTransferFunction;

enum {
	MFVideoPrimaries_Unknown       = 0,
	MFVideoPrimaries_reserved      = 1,
	MFVideoPrimaries_BT709         = 2,
	MFVideoPrimaries_BT470_2_SysM  = 3,
	MFVideoPrimaries_BT470_2_SysBG = 4,
	MFVideoPrimaries_SMPTE170M     = 5,
	MFVideoPrimaries_SMPTE240M     = 6,
	MFVideoPrimaries_EBU3213       = 7,
	MFVideoPrimaries_SMPTE_C       = 8,
	MFVideoPrimaries_Last          = MFVideoPrimaries_SMPTE_C + 1,
	MFVideoPrimaries_ForceDWORD    = 0x7fffffff
}
alias int MFVideoPrimaries;

enum {
	MFVideoLighting_Unknown    = 0,
	MFVideoLighting_bright     = 1,
	MFVideoLighting_office     = 2,
	MFVideoLighting_dim        = 3,
	MFVideoLighting_dark       = 4,
	MFVideoLighting_Last       = MFVideoLighting_dark + 1,
	MFVideoLighting_ForceDWORD = 0x7fffffff
}
alias int MFVideoLighting;

enum {
	MFVideoTransferMatrix_Unknown    = 0,
	MFVideoTransferMatrix_BT709      = 1,
	MFVideoTransferMatrix_BT601      = 2,
	MFVideoTransferMatrix_SMPTE240M  = 3,
	MFVideoTransferMatrix_Last       = ( MFVideoTransferMatrix_SMPTE240M + 1 ) ,
	MFVideoTransferMatrix_ForceDWORD = 0x7fffffff
}
alias int MFVideoTransferMatrix;

enum {
	MFVideoChromaSubsampling_Unknown                        = 0,
	MFVideoChromaSubsampling_ProgressiveChroma              = 0x8,
	MFVideoChromaSubsampling_Horizontally_Cosited           = 0x4,
	MFVideoChromaSubsampling_Vertically_Cosited             = 0x2,
	MFVideoChromaSubsampling_Vertically_AlignedChromaPlanes = 0x1,
	MFVideoChromaSubsampling_MPEG2                          = MFVideoChromaSubsampling_Horizontally_Cosited | MFVideoChromaSubsampling_Vertically_AlignedChromaPlanes,
	MFVideoChromaSubsampling_MPEG1                          = MFVideoChromaSubsampling_Vertically_AlignedChromaPlanes,
	MFVideoChromaSubsampling_DV_PAL                         = MFVideoChromaSubsampling_Horizontally_Cosited | MFVideoChromaSubsampling_Vertically_Cosited,
	MFVideoChromaSubsampling_Cosited                        = MFVideoChromaSubsampling_Horizontally_Cosited | MFVideoChromaSubsampling_Vertically_Cosited | MFVideoChromaSubsampling_Vertically_AlignedChromaPlanes,
	MFVideoChromaSubsampling_Last                           = MFVideoChromaSubsampling_Cosited + 1,
	MFVideoChromaSubsampling_ForceDWORD                     = 0x7fffffff
}
alias int MFVideoChromaSubsampling;

enum {
	MFNominalRange_Unknown    = 0,
	MFNominalRange_Normal     = 1,
	MFNominalRange_Wide       = 2,
	MFNominalRange_0_255      = 1,
	MFNominalRange_16_235     = 2,
	MFNominalRange_48_208     = 3,
	MFNominalRange_64_127     = 4,
	MFNominalRange_Last       = MFNominalRange_64_127 + 1,
	MFNominalRange_ForceDWORD = 0x7fffffff
}
alias int MFNominalRange;

enum {
	MFVideoFlag_PAD_TO_Mask            = 0x1 | 0x2,
	MFVideoFlag_PAD_TO_None            = 0 * 0x1,
	MFVideoFlag_PAD_TO_4x3             = 1 * 0x1,
	MFVideoFlag_PAD_TO_16x9            = 2 * 0x1,
	MFVideoFlag_SrcContentHintMask     = 0x4 | 0x8 | 0x10,
	MFVideoFlag_SrcContentHintNone     = 0 * 0x4,
	MFVideoFlag_SrcContentHint16x9     = 1 * 0x4,
	MFVideoFlag_SrcContentHint235_1    = 2 * 0x4,
	MFVideoFlag_AnalogProtected        = 0x20,
	MFVideoFlag_DigitallyProtected     = 0x40,
	MFVideoFlag_ProgressiveContent     = 0x80,
	MFVideoFlag_FieldRepeatCountMask   = 0x100 | 0x200 | 0x400,
	MFVideoFlag_FieldRepeatCountShift  = 8,
	MFVideoFlag_ProgressiveSeqReset    = 0x800,
	MFVideoFlag_PanScanEnabled         = 0x20000,
	MFVideoFlag_LowerFieldFirst        = 0x40000,
	MFVideoFlag_BottomUpLinearRep      = 0x80000,
	MFVideoFlags_DXVASurface           = 0x100000,
	MFVideoFlags_RenderTargetSurface   = 0x400000,
	MFVideoFlags_ForceQWORD            = 0x7fffffff
}
alias int MFVideoFlags;

struct MFRatio {
	DWORD Numerator;
	DWORD Denominator;
}

struct MFOffset {
	WORD fract;
	short value;
}

struct MFVideoArea {
	MFOffset OffsetX;
	MFOffset OffsetY;
	SIZE Area;
}

struct MFVideoInfo {
	DWORD dwWidth;
	DWORD dwHeight;
	MFRatio PixelAspectRatio;
	MFVideoChromaSubsampling SourceChromaSubsampling;
	MFVideoInterlaceMode InterlaceMode;
	MFVideoTransferFunction TransferFunction;
	MFVideoPrimaries ColorPrimaries;
	MFVideoTransferMatrix TransferMatrix;
	MFVideoLighting SourceLighting;
	MFRatio FramesPerSecond;
	MFNominalRange NominalRange;
	MFVideoArea GeometricAperture;
	MFVideoArea MinimumDisplayAperture;
	MFVideoArea PanScanAperture;
	ulong VideoFlags;
}

struct MFAYUVSample {
	BYTE bCrValue;
	BYTE bCbValue;
	BYTE bYValue;
	BYTE bSampleAlpha8;
}

struct MFARGB {
	BYTE rgbBlue;
	BYTE rgbGreen;
	BYTE rgbRed;
	BYTE rgbAlpha;
}

union MFPaletteEntry {
	MFARGB ARGB;
	MFAYUVSample AYCbCr;
}

struct MFVideoSurfaceInfo {
	DWORD Format;
	DWORD PaletteEntries;
	MFPaletteEntry[1] Palette;
}

struct MFVideoCompressedInfo {
	LONGLONG AvgBitrate;
	LONGLONG AvgBitErrorRate;
	DWORD MaxKeyFrameSpacing;
}

struct MFVIDEOFORMAT {
	DWORD dwSize;
	MFVideoInfo videoInfo;
	GUID guidFormat;
	MFVideoCompressedInfo compressedInfo;
	MFVideoSurfaceInfo surfaceInfo;
}

enum {
	MFStdVideoFormat_reserved = 0,
	MFStdVideoFormat_NTSC,
	MFStdVideoFormat_PAL,
	MFStdVideoFormat_DVD_NTSC,
	MFStdVideoFormat_DVD_PAL,
	MFStdVideoFormat_DV_PAL,
	MFStdVideoFormat_DV_NTSC,
	MFStdVideoFormat_ATSC_SD480i,
	MFStdVideoFormat_ATSC_HD1080i,
	MFStdVideoFormat_ATSC_HD720p
}
alias int MFStandardVideoFormat;

//extern extern(C) const IID IID_IMFVideoMediaType;
interface IMFVideoMediaType : IMFMediaType {
public extern(Windows):
	const(MFVIDEOFORMAT)* GetVideoFormat();
	HRESULT GetVideoRepresentation(GUID guidRepresentation, LPVOID* ppvRepresentation, LONG lStride);
}
mixin DEFINE_IID!(IMFVideoMediaType, "b99f381f-a8f9-47a2-a5af-ca3a225a3890");

//extern extern(C) const IID IID_IMFAsyncResult;
interface IMFAsyncResult : IUnknown {
public extern(Windows):
	HRESULT GetState(IUnknown* ppunkState);
	HRESULT GetStatus();
	HRESULT SetStatus(HRESULT hrStatus);
	HRESULT GetObject(IUnknown* ppObject);
	IUnknown GetStateNoAddRef();
}
mixin DEFINE_IID!(IMFAsyncResult, "ac6b7889-0740-4d51-8619-905994a55cc6");

//extern extern(C) const IID IID_IMFAsyncCallback;
interface IMFAsyncCallback : IUnknown {
public extern(Windows):
	HRESULT GetParameters(DWORD* pdwFlags, DWORD* pdwQueue);
	HRESULT Invoke(IMFAsyncResult pAsyncResult);
}
mixin DEFINE_IID!(IMFAsyncCallback, "a27003cf-2354-4f2a-8d6a-ab7cff15437e");

enum {
	MFASYNC_FAST_IO_PROCESSING_CALLBACK  = 0x00000001,
	MFASYNC_SIGNAL_CALLBACK              = 0x00000002,
	MFASYNC_CALLBACK_QUEUE_UNDEFINED     = 0x00000000,
	MFASYNC_CALLBACK_QUEUE_STANDARD      = 0x00000001,
	MFASYNC_CALLBACK_QUEUE_RT            = 0x00000002,
	MFASYNC_CALLBACK_QUEUE_IO            = 0x00000003,
	MFASYNC_CALLBACK_QUEUE_TIMER         = 0x00000004,
	MFASYNC_CALLBACK_QUEUE_LONG_FUNCTION = 0x00000007,
	MFASYNC_CALLBACK_QUEUE_PRIVATE_MASK  = 0xFFFF0000,
	MFASYNC_CALLBACK_QUEUE_ALL           = 0xFFFFFFFF,
}

enum {
	MEUnknown                            = 0,
	MEError                              = 1,
	MEExtendedType                       = 2,
	MENonFatalError                      = 3,
	MEGenericV1Anchor                    = MENonFatalError,
	MESessionUnknown                     = 100,
	MESessionTopologySet                 = 101,
	MESessionTopologiesCleared           = 102,
	MESessionStarted                     = 103,
	MESessionPaused                      = 104,
	MESessionStopped                     = 105,
	MESessionClosed                      = 106,
	MESessionEnded                       = 107,
	MESessionRateChanged                 = 108,
	MESessionScrubSampleComplete         = 109,
	MESessionCapabilitiesChanged         = 110,
	MESessionTopologyStatus              = 111,
	MESessionNotifyPresentationTime      = 112,
	MENewPresentation                    = 113,
	MELicenseAcquisitionStart            = 114,
	MELicenseAcquisitionCompleted        = 115,
	MEIndividualizationStart             = 116,
	MEIndividualizationCompleted         = 117,
	MEEnablerProgress                    = 118,
	MEEnablerCompleted                   = 119,
	MEPolicyError                        = 120,
	MEPolicyReport                       = 121,
	MEBufferingStarted                   = 122,
	MEBufferingStopped                   = 123,
	MEConnectStart                       = 124,
	MEConnectEnd                         = 125,
	MEReconnectStart                     = 126,
	MEReconnectEnd                       = 127,
	MERendererEvent                      = 128,
	MESessionStreamSinkFormatChanged     = 129,
	MESessionV1Anchor                    = MESessionStreamSinkFormatChanged,
	MESourceUnknown                      = 200,
	MESourceStarted                      = 201,
	MEStreamStarted                      = 202,
	MESourceSeeked                       = 203,
	MEStreamSeeked                       = 204,
	MENewStream                          = 205,
	MEUpdatedStream                      = 206,
	MESourceStopped                      = 207,
	MEStreamStopped                      = 208,
	MESourcePaused                       = 209,
	MEStreamPaused                       = 210,
	MEEndOfPresentation                  = 211,
	MEEndOfStream                        = 212,
	MEMediaSample                        = 213,
	MEStreamTick                         = 214,
	MEStreamThinMode                     = 215,
	MEStreamFormatChanged                = 216,
	MESourceRateChanged                  = 217,
	MEEndOfPresentationSegment           = 218,
	MESourceCharacteristicsChanged       = 219,
	MESourceRateChangeRequested          = 220,
	MESourceMetadataChanged              = 221,
	MESequencerSourceTopologyUpdated     = 222,
	MESourceV1Anchor                     = MESequencerSourceTopologyUpdated,
	MESinkUnknown                        = 300,
	MEStreamSinkStarted                  = 301,
	MEStreamSinkStopped                  = 302,
	MEStreamSinkPaused                   = 303,
	MEStreamSinkRateChanged              = 304,
	MEStreamSinkRequestSample            = 305,
	MEStreamSinkMarker                   = 306,
	MEStreamSinkPrerolled                = 307,
	MEStreamSinkScrubSampleComplete      = 308,
	MEStreamSinkFormatChanged            = 309,
	MEStreamSinkDeviceChanged            = 310,
	MEQualityNotify                      = 311,
	MESinkInvalidated                    = 312,
	MEAudioSessionNameChanged            = 313,
	MEAudioSessionVolumeChanged          = 314,
	MEAudioSessionDeviceRemoved          = 315,
	MEAudioSessionServerShutdown         = 316,
	MEAudioSessionGroupingParamChanged   = 317,
	MEAudioSessionIconChanged            = 318,
	MEAudioSessionFormatChanged          = 319,
	MEAudioSessionDisconnected           = 320,
	MEAudioSessionExclusiveModeOverride  = 321,
	MESinkV1Anchor                       = MEAudioSessionExclusiveModeOverride,
	METrustUnknown                       = 400,
	MEPolicyChanged                      = 401,
	MEContentProtectionMessage           = 402,
	MEPolicySet                          = 403,
	METrustV1Anchor                      = MEPolicySet,
	MEWMDRMLicenseBackupCompleted        = 500,
	MEWMDRMLicenseBackupProgress         = 501,
	MEWMDRMLicenseRestoreCompleted       = 502,
	MEWMDRMLicenseRestoreProgress        = 503,
	MEWMDRMLicenseAcquisitionCompleted   = 506,
	MEWMDRMIndividualizationCompleted    = 508,
	MEWMDRMIndividualizationProgress     = 513,
	MEWMDRMProximityCompleted            = 514,
	MEWMDRMLicenseStoreCleaned           = 515,
	MEWMDRMRevocationDownloadCompleted   = 516,
	MEWMDRMV1Anchor                      = MEWMDRMRevocationDownloadCompleted,
	METransformUnknown                   = 600,
	METransformNeedInput                 = METransformUnknown + 1,
	METransformHaveOutput                = METransformNeedInput + 1,
	METransformDrainComplete             = METransformHaveOutput + 1,
	METransformMarker                    = METransformDrainComplete + 1,
	MEReservedMax                        = 10000
}
alias DWORD MediaEventType;

//extern extern(C) const IID IID_IMFMediaEvent;
interface IMFMediaEvent : IMFAttributes {
public extern(Windows):
	HRESULT GetType(MediaEventType* pmet);
	HRESULT GetExtendedType(GUID* pguidExtendedType);
	HRESULT GetStatus(HRESULT* phrStatus);
	HRESULT GetValue(PROPVARIANT* pvValue);
}
mixin DEFINE_IID!(IMFMediaEvent, "DF598932-F10C-4E39-BBA2-C308F101DAA3");

enum {
	MF_EVENT_FLAG_NO_WAIT = 0x00000001,
}

//extern extern(C) const IID IID_IMFMediaEventGenerator;
interface IMFMediaEventGenerator : IUnknown {
public extern(Windows):
	HRESULT GetEvent(DWORD dwFlags, IMFMediaEvent* ppEvent);
	HRESULT BeginGetEvent(IMFAsyncCallback pCallback, IUnknown punkState);
	HRESULT EndGetEvent(IMFAsyncResult pResult, IMFMediaEvent* ppEvent);
	HRESULT QueueEvent(MediaEventType met, REFGUID guidExtendedType, HRESULT hrStatus, const(PROPVARIANT)* pvValue);
}
mixin DEFINE_IID!(IMFMediaEventGenerator, "2CD0BD52-BCD5-4B89-B62C-EADC0C031E7D");

export extern(Windows){
	HRESULT IMFMediaEventGenerator_RemoteBeginGetEvent_Proxy(IMFMediaEventGenerator This, IMFRemoteAsyncCallback pCallback);
	void IMFMediaEventGenerator_RemoteBeginGetEvent_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IMFMediaEventGenerator_RemoteEndGetEvent_Proxy(IMFMediaEventGenerator This, IUnknown pResult, DWORD* pcbEvent, BYTE** ppbEvent);
	void IMFMediaEventGenerator_RemoteEndGetEvent_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_IMFRemoteAsyncCallback;
interface IMFRemoteAsyncCallback : IUnknown {
public extern(Windows):
	HRESULT Invoke(HRESULT hr, IUnknown pRemoteResult);
}
mixin DEFINE_IID!(IMFRemoteAsyncCallback, "a27003d0-2354-4f2a-8d6a-ab7cff15437e");

enum {
	msoBegin = 0,
	msoCurrent
}
alias int MFBYTESTREAM_SEEK_ORIGIN;

//extern extern(C) const IID IID_IMFByteStream;
interface IMFByteStream : IUnknown {
public extern(Windows):
	HRESULT GetCapabilities(DWORD* pdwCapabilities);
	HRESULT GetLength(QWORD* pqwLength);
	HRESULT SetLength(QWORD qwLength);
	HRESULT GetCurrentPosition(QWORD* pqwPosition);
	HRESULT SetCurrentPosition(QWORD qwPosition);
	HRESULT IsEndOfStream(BOOL* pfEndOfStream);
	HRESULT Read(BYTE* pb, ULONG cb, ULONG* pcbRead);
	HRESULT BeginRead(BYTE* pb, ULONG cb, IMFAsyncCallback pCallback, IUnknown punkState);
	HRESULT EndRead(IMFAsyncResult pResult, ULONG* pcbRead);
	HRESULT Write(const(BYTE)* pb, ULONG cb, ULONG* pcbWritten);
	HRESULT BeginWrite(const(BYTE)* pb, ULONG cb, IMFAsyncCallback pCallback, IUnknown punkState);
	HRESULT EndWrite(IMFAsyncResult pResult, ULONG* pcbWritten);
	HRESULT Seek(MFBYTESTREAM_SEEK_ORIGIN SeekOrigin, LONGLONG llSeekOffset, DWORD dwSeekFlags, QWORD* pqwCurrentPosition);
	HRESULT Flush();
	HRESULT Close();
}
mixin DEFINE_IID!(IMFByteStream, "ad4c1b00-4bf7-422f-9175-756693d9130d");

enum {
	MFBYTESTREAM_IS_READABLE             = 0x00000001,
	MFBYTESTREAM_IS_WRITABLE             = 0x00000002,
	MFBYTESTREAM_IS_SEEKABLE             = 0x00000004,
	MFBYTESTREAM_IS_REMOTE               = 0x00000008,
	MFBYTESTREAM_IS_DIRECTORY            = 0x00000080,
	MFBYTESTREAM_HAS_SLOW_SEEK           = 0x00000100,
	MFBYTESTREAM_IS_PARTIALLY_DOWNLOADED = 0x00000200,
//(WINVER >= _WIN32_WINNT_WIN7)
		MFBYTESTREAM_SHARE_WRITE = 0x00000400,
	MFBYTESTREAM_SEEK_FLAG_CANCEL_PENDING_IO = 0x00000001,
}

mixin DEFINE_GUID!("MF_BYTESTREAM_ORIGIN_NAME", 0xfc358288, 0x3cb6, 0x460c, 0xa4, 0x24, 0xb6, 0x68, 0x12, 0x60, 0x37, 0x5a);
mixin DEFINE_GUID!("MF_BYTESTREAM_CONTENT_TYPE", 0xfc358289, 0x3cb6, 0x460c, 0xa4, 0x24, 0xb6, 0x68, 0x12, 0x60, 0x37, 0x5a);
mixin DEFINE_GUID!("MF_BYTESTREAM_DURATION", 0xfc35828a, 0x3cb6, 0x460c, 0xa4, 0x24, 0xb6, 0x68, 0x12, 0x60, 0x37, 0x5a);
mixin DEFINE_GUID!("MF_BYTESTREAM_LAST_MODIFIED_TIME", 0xfc35828b, 0x3cb6, 0x460c, 0xa4, 0x24, 0xb6, 0x68, 0x12, 0x60, 0x37, 0x5a);
//(WINVER >= _WIN32_WINNT_WIN7)
	mixin DEFINE_GUID!("MF_BYTESTREAM_IFO_FILE_URI", 0xfc35828c, 0x3cb6, 0x460c, 0xa4, 0x24, 0xb6, 0x68, 0x12, 0x60, 0x37, 0x5a);
	mixin DEFINE_GUID!("MF_BYTESTREAM_DLNA_PROFILE_ID", 0xfc35828d, 0x3cb6, 0x460c, 0xa4, 0x24, 0xb6, 0x68, 0x12, 0x60, 0x37, 0x5a);

enum {
	MF_ACCESSMODE_READ      = 1,
	MF_ACCESSMODE_WRITE     = 2,
	MF_ACCESSMODE_READWRITE = 3
}
alias int MF_FILE_ACCESSMODE;

enum {
	MF_OPENMODE_FAIL_IF_NOT_EXIST = 0,
	MF_OPENMODE_FAIL_IF_EXIST     = 1,
	MF_OPENMODE_RESET_IF_EXIST    = 2,
	MF_OPENMODE_APPEND_IF_EXIST   = 3,
	MF_OPENMODE_DELETE_IF_EXIST   = 4
}
alias int MF_FILE_OPENMODE;

enum {
	MF_FILEFLAGS_NONE                = 0,
	MF_FILEFLAGS_NOBUFFERING         = 0x1,
	MF_FILEFLAGS_ALLOW_WRITE_SHARING = 0x2
}
alias int MF_FILE_FLAGS;

//extern extern(C) const IID IID_IMFCollection;
interface IMFCollection : IUnknown {
public extern(Windows):
	HRESULT GetElementCount(DWORD* pcElements);
	HRESULT GetElement(DWORD dwElementIndex, IUnknown* ppUnkElement);
	HRESULT AddElement(IUnknown pUnkElement);
	HRESULT RemoveElement(DWORD dwElementIndex, IUnknown* ppUnkElement);
	HRESULT InsertElementAt(DWORD dwIndex, IUnknown pUnknown);
	HRESULT RemoveAllElements();
}
mixin DEFINE_IID!(IMFCollection, "5BC8A76B-869A-46a3-9B03-FA218A66AEBE");

//extern extern(C) const IID IID_IMFMediaEventQueue;
interface IMFMediaEventQueue : IUnknown {
public extern(Windows):
	HRESULT GetEvent(DWORD dwFlags, IMFMediaEvent* ppEvent);
	HRESULT BeginGetEvent(IMFAsyncCallback pCallback, IUnknown punkState);
	HRESULT EndGetEvent(IMFAsyncResult pResult, IMFMediaEvent* ppEvent);
	HRESULT QueueEvent(IMFMediaEvent pEvent);
	HRESULT QueueEventParamVar(MediaEventType met, REFGUID guidExtendedType, HRESULT hrStatus, const(PROPVARIANT)* pvValue);
	HRESULT QueueEventParamUnk(MediaEventType met, REFGUID guidExtendedType, HRESULT hrStatus, IUnknown pUnk);
	HRESULT Shutdown();
}
mixin DEFINE_IID!(IMFMediaEventQueue, "36f846fc-2256-48b6-b58e-e2b638316581");

//extern extern(C) const IID IID_IMFActivate;
interface IMFActivate : IMFAttributes {
public extern(Windows):
	HRESULT ActivateObject(REFIID riid, void** ppv);
	HRESULT ShutdownObject();
	HRESULT DetachObject();
}
mixin DEFINE_IID!(IMFActivate, "7FEE9E9A-4A89-47a6-899C-B6A53A70FB67");

//(WINVER >= _WIN32_WINNT_WIN7)
	enum {
		MF_Plugin_Type_MFT = 0,
		MF_Plugin_Type_MediaSource = 1
	}
	alias int MF_Plugin_Type;

	//extern extern(C) const IID IID_IMFPluginControl;
	interface IMFPluginControl : IUnknown {
	public extern(Windows):
		HRESULT GetPreferredClsid(DWORD pluginType, LPCWSTR selector, CLSID* clsid);
		HRESULT GetPreferredClsidByIndex(DWORD pluginType, DWORD index, LPWSTR* selector, CLSID* clsid);
		HRESULT SetPreferredClsid(DWORD pluginType, LPCWSTR selector, const(CLSID)* clsid);
		HRESULT IsDisabled(DWORD pluginType, REFCLSID clsid);
		HRESULT GetDisabledByIndex(DWORD pluginType, DWORD index, CLSID* clsid);
		HRESULT SetDisabled(DWORD pluginType, REFCLSID clsid, BOOL disabled);
	}
	mixin DEFINE_IID!(IMFPluginControl, "5c6c44bf-1db6-435b-9249-e8cd10fdec96");

export extern(Windows){
	uint BSTR_UserSize(uint*, uint, BSTR*);
	ubyte* BSTR_UserMarshal(uint*, ubyte*, BSTR*);
	ubyte* BSTR_UserUnmarshal(uint*, ubyte*, BSTR*);
	void BSTR_UserFree(uint*, BSTR*);

	uint LPSAFEARRAY_UserSize(uint*, uint, LPSAFEARRAY*);
	ubyte* LPSAFEARRAY_UserMarshal(uint*, ubyte*, LPSAFEARRAY*);
	ubyte* LPSAFEARRAY_UserUnmarshal(uint*, ubyte*, LPSAFEARRAY*);
	void LPSAFEARRAY_UserFree(uint*, LPSAFEARRAY*);

	uint BSTR_UserSize64(uint*, uint, BSTR*);
	ubyte* BSTR_UserMarshal64(uint*, ubyte*, BSTR*);
	ubyte* BSTR_UserUnmarshal64(uint*, ubyte*, BSTR*);
	void BSTR_UserFree64(uint*, BSTR*);

	uint LPSAFEARRAY_UserSize64(uint*, uint, LPSAFEARRAY*);
	ubyte* LPSAFEARRAY_UserMarshal64(uint*, ubyte*, LPSAFEARRAY*);
	ubyte* LPSAFEARRAY_UserUnmarshal64(uint*, ubyte*, LPSAFEARRAY*);
	void LPSAFEARRAY_UserFree64(uint*, LPSAFEARRAY*);
}

export extern(Windows){
	HRESULT IMFMediaEventGenerator_BeginGetEvent_Proxy(IMFMediaEventGenerator This, IMFAsyncCallback pCallback, IUnknown punkState);
	HRESULT IMFMediaEventGenerator_BeginGetEvent_Stub(IMFMediaEventGenerator This, IMFRemoteAsyncCallback pCallback);
	HRESULT IMFMediaEventGenerator_EndGetEvent_Proxy(IMFMediaEventGenerator This, IMFAsyncResult pResult, IMFMediaEvent* ppEvent);
	HRESULT IMFMediaEventGenerator_EndGetEvent_Stub(IMFMediaEventGenerator This, IUnknown pResult, DWORD* pcbEvent, BYTE** ppbEvent);
}

}// extern(Windows)
