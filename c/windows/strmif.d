/** strmif.d

Converted from 'strmif.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.strmif;


import c.windows.windef;
import c.windows.wtypes;
import c.windows.guiddef;
import c.windows.unknwn;
import c.windows.objidl;
import c.windows.oaidl;
import c.windows.rpcdcep;
import c.windows.wingdi;
import c.windows.rpcndr;
import c.windows.ddraw;


extern(C){

enum {
	CDEF_CLASS_DEFAULT          = 0x0001,
	CDEF_BYPASS_CLASS_MANAGER   = 0x0002,
	CDEF_MERIT_ABOVE_DO_NOT_USE = 0x0008,
	CDEF_DEVMON_CMGR_DEVICE     = 0x0010,
	CDEF_DEVMON_DMO             = 0x0020,
	CDEF_DEVMON_PNP_DEVICE      = 0x0040,
	CDEF_DEVMON_FILTER          = 0x0080,
	CDEF_DEVMON_SELECTIVE_MASK  = 0x00f0,
}

//export extern(C) const IID IID_ICreateDevEnum;
interface ICreateDevEnum : IUnknown {
public extern(Windows):
	HRESULT CreateClassEnumerator(REFCLSID clsidDeviceClass, IEnumMoniker* ppEnumMoniker, DWORD dwFlags);
}
mixin DEFINE_IID!(ICreateDevEnum, "29840822-5B84-11D0-BD3B-00A0C911CE86");

enum CHARS_IN_GUID = 39;

struct AM_MEDIA_TYPE {
	GUID majortype;
	GUID subtype;
	BOOL bFixedSizeSamples;
	BOOL bTemporalCompression;
	ULONG lSampleSize;
	GUID formattype;
	IUnknown pUnk;
	ULONG cbFormat;
	BYTE* pbFormat;
}

enum {
	PINDIR_INPUT = 0,
	PINDIR_OUTPUT
}
alias int PIN_DIRECTION;

enum MAX_PIN_NAME = 128;
enum MAX_FILTER_NAME = 128;
alias LONGLONG REFERENCE_TIME;
alias double REFTIME;
alias DWORD_PTR HSEMAPHORE;
alias DWORD_PTR HEVENT;

struct ALLOCATOR_PROPERTIES {
	int cBuffers;
	int cbBuffer;
	int cbAlign;
	int cbPrefix;
}

struct PIN_INFO {
	IBaseFilter pFilter;
	PIN_DIRECTION dir;
	WCHAR[128] achName;
}

//export extern(C) const IID IID_IPin;
interface IPin : IUnknown {
public extern(Windows):
	HRESULT Connect(IPin pReceivePin, const(AM_MEDIA_TYPE)* pmt);
	HRESULT ReceiveConnection(IPin pConnector, const(AM_MEDIA_TYPE)* pmt);
	HRESULT Disconnect();
	HRESULT ConnectedTo(IPin* pPin);
	HRESULT ConnectionMediaType(AM_MEDIA_TYPE* pmt);
	HRESULT QueryPinInfo(PIN_INFO* pInfo);
	HRESULT QueryDirection(PIN_DIRECTION* pPinDir);
	HRESULT QueryId(LPWSTR* Id);
	HRESULT QueryAccept(const(AM_MEDIA_TYPE)* pmt);
	HRESULT EnumMediaTypes(IEnumMediaTypes* ppEnum);
	HRESULT QueryInternalConnections(IPin* apPin, ULONG* nPin);
	HRESULT EndOfStream();
	HRESULT BeginFlush();
	HRESULT EndFlush();
	HRESULT NewSegment(REFERENCE_TIME tStart, REFERENCE_TIME tStop, double dRate);
}
mixin DEFINE_IID!(IPin, "56a86891-0ad4-11ce-b03a-0020af0ba770");
alias IPin PPIN;

//export extern(C) const IID IID_IEnumPins;
interface IEnumPins : IUnknown {
public extern(Windows):
	HRESULT Next(ULONG cPins, IPin* ppPins, ULONG* pcFetched);
	HRESULT Skip(ULONG cPins);
	HRESULT Reset();
	HRESULT Clone(IEnumPins* ppEnum);
}
mixin DEFINE_IID!(IEnumPins, "56a86892-0ad4-11ce-b03a-0020af0ba770");
alias IEnumPins PENUMPINS;

//export extern(C) const IID IID_IEnumMediaTypes;
interface IEnumMediaTypes : IUnknown {
public extern(Windows):
	HRESULT Next(ULONG cMediaTypes, AM_MEDIA_TYPE** ppMediaTypes, ULONG* pcFetched);
	HRESULT Skip(ULONG cMediaTypes);
	HRESULT Reset();
	HRESULT Clone(IEnumMediaTypes* ppEnum);
}
mixin DEFINE_IID!(IEnumMediaTypes, "89c31040-846b-11ce-97d3-00aa0055595a");
alias IEnumMediaTypes PENUMMEDIATYPES;

//export extern(C) const IID IID_IFilterGraph;
interface IFilterGraph : IUnknown {
public extern(Windows):
	HRESULT AddFilter(IBaseFilter pFilter, LPCWSTR pName);
	HRESULT RemoveFilter(IBaseFilter pFilter);
	HRESULT EnumFilters(IEnumFilters* ppEnum);
	HRESULT FindFilterByName(LPCWSTR pName, IBaseFilter* ppFilter);
	HRESULT ConnectDirect(IPin ppinOut, IPin ppinIn, const(AM_MEDIA_TYPE)* pmt);
	HRESULT Reconnect(IPin ppin);
	HRESULT Disconnect(IPin ppin);
	HRESULT SetDefaultSyncSource();
}
mixin DEFINE_IID!(IFilterGraph, "56a8689f-0ad4-11ce-b03a-0020af0ba770");
alias IFilterGraph PFILTERGRAPH;

//export extern(C) const IID IID_IEnumFilters;
interface IEnumFilters : IUnknown {
public extern(Windows):
	HRESULT Next(ULONG cFilters, IBaseFilter* ppFilter, ULONG* pcFetched);
	HRESULT Skip(ULONG cFilters);
	HRESULT Reset();
	HRESULT Clone(IEnumFilters* ppEnum);
}
mixin DEFINE_IID!(IEnumFilters, "56a86893-0ad4-11ce-b03a-0020af0ba770");
alias IEnumFilters PENUMFILTERS;

enum {
	State_Stopped = 0,
	State_Paused,
	State_Running
}
alias int FILTER_STATE;

//export extern(C) const IID IID_IMediaFilter;
interface IMediaFilter : IPersist {
public extern(Windows):
	HRESULT Stop();
	HRESULT Pause();
	HRESULT Run(REFERENCE_TIME tStart);
	HRESULT GetState(DWORD dwMilliSecsTimeout, FILTER_STATE* State);
	HRESULT SetSyncSource(IReferenceClock pClock);
	HRESULT GetSyncSource(IReferenceClock* pClock);
}
mixin DEFINE_IID!(IMediaFilter, "56a86899-0ad4-11ce-b03a-0020af0ba770");
alias IMediaFilter PMEDIAFILTER;

struct FILTER_INFO {
	WCHAR[128] achName;
	IFilterGraph pGraph;
}

//export extern(C) const IID IID_IBaseFilter;
interface IBaseFilter : IMediaFilter {
public extern(Windows):
	HRESULT EnumPins(IEnumPins* ppEnum);
	HRESULT FindPin(LPCWSTR Id, IPin* ppPin);
	HRESULT QueryFilterInfo(FILTER_INFO* pInfo);
	HRESULT JoinFilterGraph(IFilterGraph pGraph, LPCWSTR pName);
	HRESULT QueryVendorInfo(LPWSTR* pVendorInfo);
}
mixin DEFINE_IID!(IBaseFilter, "56a86895-0ad4-11ce-b03a-0020af0ba770");
alias IBaseFilter PFILTER;

//export extern(C) const IID IID_IReferenceClock;
interface IReferenceClock : IUnknown {
public extern(Windows):
	HRESULT GetTime(REFERENCE_TIME* pTime);
	HRESULT AdviseTime(REFERENCE_TIME baseTime, REFERENCE_TIME streamTime, HEVENT hEvent, DWORD_PTR* pdwAdviseCookie);
	HRESULT AdvisePeriodic(REFERENCE_TIME startTime, REFERENCE_TIME periodTime, HSEMAPHORE hSemaphore, DWORD_PTR* pdwAdviseCookie);
	HRESULT Unadvise(DWORD_PTR dwAdviseCookie);
}
mixin DEFINE_IID!(IReferenceClock, "56a86897-0ad4-11ce-b03a-0020af0ba770");
alias IReferenceClock PREFERENCECLOCK;

//export extern(C) const IID IID_IReferenceClockTimerControl;
interface IReferenceClockTimerControl : IUnknown {
public extern(Windows):
	HRESULT SetDefaultTimerResolution(REFERENCE_TIME timerResolution);
	HRESULT GetDefaultTimerResolution(REFERENCE_TIME* pTimerResolution);
}
mixin DEFINE_IID!(IReferenceClockTimerControl, "ebec459c-2eca-4d42-a8af-30df557614b8");

//export extern(C) const IID IID_IReferenceClock2;
interface IReferenceClock2 : IReferenceClock {
public extern(Windows):
}
mixin DEFINE_IID!(IReferenceClock2, "36b73885-c2c8-11cf-8b46-00805f6cef60");
alias IReferenceClock2 PREFERENCECLOCK2;

//export extern(C) const IID IID_IMediaSample;
interface IMediaSample : IUnknown {
public extern(Windows):
	HRESULT GetPointer(BYTE** ppBuffer);
	int GetSize();
	HRESULT GetTime(REFERENCE_TIME* pTimeStart, REFERENCE_TIME* pTimeEnd);
	HRESULT SetTime(REFERENCE_TIME* pTimeStart, REFERENCE_TIME* pTimeEnd);
	HRESULT IsSyncPoint();
	HRESULT SetSyncPoint(BOOL bIsSyncPoint);
	HRESULT IsPreroll();
	HRESULT SetPreroll(BOOL bIsPreroll);
	int GetActualDataLength();
	HRESULT SetActualDataLength(int __MIDL__IMediaSample0000);
	HRESULT GetMediaType(AM_MEDIA_TYPE** ppMediaType);
	HRESULT SetMediaType(AM_MEDIA_TYPE* pMediaType);
	HRESULT IsDiscontinuity();
	HRESULT SetDiscontinuity(BOOL bDiscontinuity);
	HRESULT GetMediaTime(LONGLONG* pTimeStart, LONGLONG* pTimeEnd);
	HRESULT SetMediaTime(LONGLONG* pTimeStart, LONGLONG* pTimeEnd);
}
mixin DEFINE_IID!(IMediaSample, "56a8689a-0ad4-11ce-b03a-0020af0ba770");
alias IMediaSample PMEDIASAMPLE;

enum {
	AM_SAMPLE_SPLICEPOINT = 0x1,
	AM_SAMPLE_PREROLL = 0x2,
	AM_SAMPLE_DATADISCONTINUITY = 0x4,
	AM_SAMPLE_TYPECHANGED = 0x8,
	AM_SAMPLE_TIMEVALID = 0x10,
	AM_SAMPLE_TIMEDISCONTINUITY = 0x40,
	AM_SAMPLE_FLUSH_ON_PAUSE = 0x80,
	AM_SAMPLE_STOPVALID = 0x100,
	AM_SAMPLE_ENDOFSTREAM = 0x200,
	AM_STREAM_MEDIA = 0,
	AM_STREAM_CONTROL = 1
}

struct AM_SAMPLE2_PROPERTIES {
	DWORD cbData;
	DWORD dwTypeSpecificFlags;
	DWORD dwSampleFlags;
	LONG lActual;
	REFERENCE_TIME tStart;
	REFERENCE_TIME tStop;
	DWORD dwStreamId;
	AM_MEDIA_TYPE* pMediaType;
	BYTE* pbBuffer;
	LONG cbBuffer;
}

//export extern(C) const IID IID_IMediaSample2;
interface IMediaSample2 : IMediaSample {
public extern(Windows):
	HRESULT GetProperties(DWORD cbProperties, BYTE* pbProperties);
	HRESULT SetProperties(DWORD cbProperties, const(BYTE)* pbProperties);
}
mixin DEFINE_IID!(IMediaSample2, "36b73884-c2c8-11cf-8b46-00805f6cef60");
alias IMediaSample2 PMEDIASAMPLE2;

//export extern(C) const IID IID_IMediaSample2Config;
interface IMediaSample2Config : IUnknown {
public extern(Windows):
	HRESULT GetSurface(IUnknown* ppDirect3DSurface9);
}
mixin DEFINE_IID!(IMediaSample2Config, "68961E68-832B-41ea-BC91-63593F3E70E3");

enum {
	AM_GBF_PREVFRAMESKIPPED = 1,
	AM_GBF_NOTASYNCPOINT    = 2,
	AM_GBF_NOWAIT           = 4,
	AM_GBF_NODDSURFACELOCK  = 8,
}

//export extern(C) const IID IID_IMemAllocator;
interface IMemAllocator : IUnknown {
public extern(Windows):
	HRESULT SetProperties(ALLOCATOR_PROPERTIES* pRequest, ALLOCATOR_PROPERTIES* pActual);
	HRESULT GetProperties(ALLOCATOR_PROPERTIES* pProps);
	HRESULT Commit();
	HRESULT Decommit();
	HRESULT GetBuffer(IMediaSample* ppBuffer, REFERENCE_TIME* pStartTime, REFERENCE_TIME* pEndTime, DWORD dwFlags);
	HRESULT ReleaseBuffer(IMediaSample pBuffer);
}
mixin DEFINE_IID!(IMemAllocator, "56a8689c-0ad4-11ce-b03a-0020af0ba770");
alias IMemAllocator PMEMALLOCATOR;

//export extern(C) const IID IID_IMemAllocatorCallbackTemp;
interface IMemAllocatorCallbackTemp : IMemAllocator {
public extern(Windows):
	HRESULT SetNotify(IMemAllocatorNotifyCallbackTemp pNotify);
	HRESULT GetFreeCount(LONG* plBuffersFree);
}
mixin DEFINE_IID!(IMemAllocatorCallbackTemp, "379a0cf0-c1de-11d2-abf5-00a0c905f375");

//export extern(C) const IID IID_IMemAllocatorNotifyCallbackTemp;
interface IMemAllocatorNotifyCallbackTemp : IUnknown {
public extern(Windows):
	HRESULT NotifyRelease();
}
mixin DEFINE_IID!(IMemAllocatorNotifyCallbackTemp, "92980b30-c1de-11d2-abf5-00a0c905f375");

//export extern(C) const IID IID_IMemInputPin;
interface IMemInputPin : IUnknown {
public extern(Windows):
	HRESULT GetAllocator(IMemAllocator* ppAllocator);
	HRESULT NotifyAllocator(IMemAllocator pAllocator, BOOL bReadOnly);
	HRESULT GetAllocatorRequirements(ALLOCATOR_PROPERTIES* pProps);
	HRESULT Receive(IMediaSample pSample);
	HRESULT ReceiveMultiple(IMediaSample* pSamples, int nSamples, int* nSamplesProcessed);
	HRESULT ReceiveCanBlock();
}
mixin DEFINE_IID!(IMemInputPin, "56a8689d-0ad4-11ce-b03a-0020af0ba770");
alias IMemInputPin PMEMINPUTPIN;

//export extern(C) const IID IID_IAMovieSetup;
interface IAMovieSetup : IUnknown {
public extern(Windows):
	HRESULT Register();
	HRESULT Unregister();
}
mixin DEFINE_IID!(IAMovieSetup, "a3d8cec0-7e5a-11cf-bbc5-00805f6cef20");
alias IAMovieSetup PAMOVIESETUP;

enum {
	AM_SEEKING_NoPositioning = 0,
	AM_SEEKING_AbsolutePositioning = 0x1,
	AM_SEEKING_RelativePositioning = 0x2,
	AM_SEEKING_IncrementalPositioning = 0x3,
	AM_SEEKING_PositioningBitsMask = 0x3,
	AM_SEEKING_SeekToKeyFrame = 0x4,
	AM_SEEKING_ReturnTime = 0x8,
	AM_SEEKING_Segment = 0x10,
	AM_SEEKING_NoFlush = 0x20
}
alias int AM_SEEKING_SEEKING_FLAGS;

enum {
	AM_SEEKING_CanSeekAbsolute = 0x1,
	AM_SEEKING_CanSeekForwards = 0x2,
	AM_SEEKING_CanSeekBackwards = 0x4,
	AM_SEEKING_CanGetCurrentPos = 0x8,
	AM_SEEKING_CanGetStopPos = 0x10,
	AM_SEEKING_CanGetDuration = 0x20,
	AM_SEEKING_CanPlayBackwards = 0x40,
	AM_SEEKING_CanDoSegments = 0x80,
	AM_SEEKING_Source = 0x100
}
alias int AM_SEEKING_SEEKING_CAPABILITIES;

//export extern(C) const IID IID_IMediaSeeking;
interface IMediaSeeking : IUnknown {
public extern(Windows):
	HRESULT GetCapabilities(DWORD* pCapabilities);
	HRESULT CheckCapabilities(DWORD* pCapabilities);
	HRESULT IsFormatSupported(const(GUID)* pFormat);
	HRESULT QueryPreferredFormat(GUID* pFormat);
	HRESULT GetTimeFormat(GUID* pFormat);
	HRESULT IsUsingTimeFormat(const(GUID)* pFormat);
	HRESULT SetTimeFormat(const(GUID)* pFormat);
	HRESULT GetDuration(LONGLONG* pDuration);
	HRESULT GetStopPosition(LONGLONG* pStop);
	HRESULT GetCurrentPosition(LONGLONG* pCurrent);
	HRESULT ConvertTimeFormat(LONGLONG* pTarget, const(GUID)* pTargetFormat, LONGLONG Source, const(GUID)* pSourceFormat);
	HRESULT SetPositions(LONGLONG* pCurrent, DWORD dwCurrentFlags, LONGLONG* pStop, DWORD dwStopFlags);
	HRESULT GetPositions(LONGLONG* pCurrent, LONGLONG* pStop);
	HRESULT GetAvailable(LONGLONG* pEarliest, LONGLONG* pLatest);
	HRESULT SetRate(double dRate);
	HRESULT GetRate(double* pdRate);
	HRESULT GetPreroll(LONGLONG* pllPreroll);
}
mixin DEFINE_IID!(IMediaSeeking, "36b73880-c2c8-11cf-8b46-00805f6cef60");
alias IMediaSeeking PMEDIASEEKING;

enum {
	AM_MEDIAEVENT_NONOTIFY = 0x01
}

struct REGFILTER {
	CLSID Clsid;
	LPWSTR Name;
}

//export extern(C) const IID IID_IEnumRegFilters;
interface IEnumRegFilters : IUnknown {
public extern(Windows):
	HRESULT Next(ULONG cFilters, REGFILTER** apRegFilter, ULONG* pcFetched);
	HRESULT Skip(ULONG cFilters);
	HRESULT Reset();
	HRESULT Clone(IEnumRegFilters* ppEnum);
}
mixin DEFINE_IID!(IEnumRegFilters, "56a868a4-0ad4-11ce-b03a-0020af0ba770");
alias IEnumRegFilters PENUMREGFILTERS;

enum {
	MERIT_PREFERRED = 0x800000,
	MERIT_NORMAL = 0x600000,
	MERIT_UNLIKELY = 0x400000,
	MERIT_DO_NOT_USE = 0x200000,
	MERIT_SW_COMPRESSOR = 0x100000,
	MERIT_HW_COMPRESSOR = 0x100050
}

//export extern(C) const IID IID_IFilterMapper;
interface IFilterMapper : IUnknown {
public extern(Windows):
	HRESULT RegisterFilter(CLSID clsid, LPCWSTR Name, DWORD dwMerit);
	HRESULT RegisterFilterInstance(CLSID clsid, LPCWSTR Name, CLSID* MRId);
	HRESULT RegisterPin(CLSID Filter, LPCWSTR Name, BOOL bRendered, BOOL bOutput, BOOL bZero, BOOL bMany, CLSID ConnectsToFilter, LPCWSTR ConnectsToPin);
	HRESULT RegisterPinType(CLSID clsFilter, LPCWSTR strName, CLSID clsMajorType, CLSID clsSubType);
	HRESULT UnregisterFilter(CLSID Filter);
	HRESULT UnregisterFilterInstance(CLSID MRId);
	HRESULT UnregisterPin(CLSID Filter, LPCWSTR Name);
	HRESULT EnumMatchingFilters(IEnumRegFilters* ppEnum, DWORD dwMerit, BOOL bInputNeeded, CLSID clsInMaj, CLSID clsInSub, BOOL bRender, BOOL bOututNeeded, CLSID clsOutMaj, CLSID clsOutSub);
}
mixin DEFINE_IID!(IFilterMapper, "56a868a3-0ad4-11ce-b03a-0020af0ba770");

struct REGPINTYPES {
	const(CLSID)* clsMajorType;
	const(CLSID)* clsMinorType;
}

struct REGFILTERPINS {
	LPWSTR strName;
	BOOL bRendered;
	BOOL bOutput;
	BOOL bZero;
	BOOL bMany;
	const(CLSID)* clsConnectsToFilter;
	const(WCHAR)* strConnectsToPin;
	UINT nMediaTypes;
	const(REGPINTYPES)* lpMediaType;
}

struct REGPINMEDIUM {
	CLSID clsMedium;
	DWORD dw1;
	DWORD dw2;
}

enum {
	REG_PINFLAG_B_ZERO = 0x1,
	REG_PINFLAG_B_RENDERER = 0x2,
	REG_PINFLAG_B_MANY = 0x4,
	REG_PINFLAG_B_OUTPUT = 0x8
}

struct REGFILTERPINS2 {
	DWORD dwFlags;
	UINT cInstances;
	UINT nMediaTypes;
	const(REGPINTYPES)* lpMediaType;
	UINT nMediums;
	const(REGPINMEDIUM)* lpMedium;
	const(CLSID)* clsPinCategory;
}

struct REGFILTER2 {
	DWORD dwVersion;
	DWORD dwMerit;
	union {
		struct {
			ULONG cPins;
			const(REGFILTERPINS)* rgPins;
		}
		struct {
			ULONG cPins2;
			const(REGFILTERPINS2)* rgPins2;
		}
	}
}

//export extern(C) const IID IID_IFilterMapper2;
interface IFilterMapper2 : IUnknown {
public extern(Windows):
	HRESULT CreateCategory(REFCLSID clsidCategory, DWORD dwCategoryMerit, LPCWSTR Description);
	HRESULT UnregisterFilter(const(CLSID)* pclsidCategory, LPCOLESTR szInstance, REFCLSID Filter);
	HRESULT RegisterFilter(REFCLSID clsidFilter, LPCWSTR Name, IMoniker* ppMoniker, const(CLSID)* pclsidCategory, LPCOLESTR szInstance, const(REGFILTER2)* prf2);
	HRESULT EnumMatchingFilters(IEnumMoniker* ppEnum, DWORD dwFlags, BOOL bExactMatch, DWORD dwMerit, BOOL bInputNeeded, DWORD cInputTypes, const(GUID)* pInputTypes, const(REGPINMEDIUM)* pMedIn, const(CLSID)* pPinCategoryIn, BOOL bRender, BOOL bOutputNeeded, DWORD cOutputTypes, const(GUID)* pOutputTypes, const(REGPINMEDIUM)* pMedOut, const(CLSID)* pPinCategoryOut);
}
mixin DEFINE_IID!(IFilterMapper2, "b79bb0b0-33c1-11d1-abe1-00a0c905f375");

//export extern(C) const IID IID_IFilterMapper3;
interface IFilterMapper3 : IFilterMapper2 {
public extern(Windows):
	HRESULT GetICreateDevEnum(ICreateDevEnum* ppEnum);
}
mixin DEFINE_IID!(IFilterMapper3, "b79bb0b1-33c1-11d1-abe1-00a0c905f375");

enum {
	Famine = 0,
	Flood
}
alias int QualityMessageType;

struct Quality {
	QualityMessageType Type;
	int Proportion;
	REFERENCE_TIME Late;
	REFERENCE_TIME TimeStamp;
}

//export extern(C) const IID IID_IQualityControl;
interface IQualityControl : IUnknown {
public extern(Windows):
	HRESULT Notify(IBaseFilter pSelf, Quality q);
	HRESULT SetSink(IQualityControl piqc);
}
mixin DEFINE_IID!(IQualityControl, "56a868a5-0ad4-11ce-b03a-0020af0ba770");
alias IQualityControl PQUALITYCONTROL;

enum {
	CK_NOCOLORKEY = 0,
	CK_INDEX = 0x1,
	CK_RGB = 0x2
}

struct COLORKEY {
	DWORD KeyType;
	DWORD PaletteIndex;
	COLORREF LowColorValue;
	COLORREF HighColorValue;
}

enum {
	ADVISE_NONE = 0,
	ADVISE_CLIPPING = 0x1,
	ADVISE_PALETTE = 0x2,
	ADVISE_COLORKEY = 0x4,
	ADVISE_POSITION = 0x8,
	ADVISE_DISPLAY_CHANGE = 0x10,
	ADVISE_ALL = ADVISE_CLIPPING | ADVISE_PALETTE | ADVISE_COLORKEY | ADVISE_POSITION,
	ADVISE_ALL2 = ADVISE_ALL | ADVISE_DISPLAY_CHANGE
}

//export extern(C) const IID IID_IOverlayNotify;
interface IOverlayNotify : IUnknown {
public extern(Windows):
	HRESULT OnPaletteChange(DWORD dwColors, const(PALETTEENTRY)* pPalette);
	HRESULT OnClipChange(const(RECT)* pSourceRect, const(RECT)* pDestinationRect, const(RGNDATA)* pRgnData);
	HRESULT OnColorKeyChange(const(COLORKEY)* pColorKey);
	HRESULT OnPositionChange(const(RECT)* pSourceRect, const(RECT)* pDestinationRect);
}
mixin DEFINE_IID!(IOverlayNotify, "56a868a0-0ad4-11ce-b03a-0020af0ba770");
alias IOverlayNotify *POVERLAYNOTIFY;

//export extern(C) const IID IID_IOverlayNotify2;
interface IOverlayNotify2 : IOverlayNotify {
public extern(Windows):
	HRESULT OnDisplayChange(HMONITOR hMonitor);
}
mixin DEFINE_IID!(IOverlayNotify2, "680EFA10-D535-11D1-87C8-00A0C9223196");
alias IOverlayNotify2 POVERLAYNOTIFY2;

//export extern(C) const IID IID_IOverlay;
interface IOverlay : IUnknown {
public extern(Windows):
	HRESULT GetPalette(DWORD* pdwColors, PALETTEENTRY** ppPalette);
	HRESULT SetPalette(DWORD dwColors, PALETTEENTRY* pPalette);
	HRESULT GetDefaultColorKey(COLORKEY* pColorKey);
	HRESULT GetColorKey(COLORKEY* pColorKey);
	HRESULT SetColorKey(COLORKEY* pColorKey);
	HRESULT GetWindowHandle(HWND* pHwnd);
	HRESULT GetClipList(RECT* pSourceRect, RECT* pDestinationRect, RGNDATA** ppRgnData);
	HRESULT GetVideoPosition(RECT* pSourceRect, RECT* pDestinationRect);
	HRESULT Advise(IOverlayNotify pOverlayNotify, DWORD dwInterests);
	HRESULT Unadvise();
}
mixin DEFINE_IID!(IOverlay, "56a868a1-0ad4-11ce-b03a-0020af0ba770");
alias IOverlay POVERLAY;

//export extern(C) const IID IID_IMediaEventSink;
interface IMediaEventSink : IUnknown {
public extern(Windows):
	HRESULT Notify(int EventCode, LONG_PTR EventParam1, LONG_PTR EventParam2);
}
mixin DEFINE_IID!(IMediaEventSink, "56a868a2-0ad4-11ce-b03a-0020af0ba770");
alias IMediaEventSink PMEDIAEVENTSINK;

//export extern(C) const IID IID_IFileSourceFilter;
interface IFileSourceFilter : IUnknown {
public extern(Windows):
	HRESULT Load(LPCOLESTR pszFileName, const(AM_MEDIA_TYPE)* pmt);
	HRESULT GetCurFile(LPOLESTR* ppszFileName, AM_MEDIA_TYPE* pmt);
}
mixin DEFINE_IID!(IFileSourceFilter, "56a868a6-0ad4-11ce-b03a-0020af0ba770");
alias IFileSourceFilter PFILTERFILESOURCE;

//export extern(C) const IID IID_IFileSinkFilter;
interface IFileSinkFilter : IUnknown {
public extern(Windows):
	HRESULT SetFileName(LPCOLESTR pszFileName, const(AM_MEDIA_TYPE)* pmt);
	HRESULT GetCurFile(LPOLESTR* ppszFileName, AM_MEDIA_TYPE* pmt);
}
mixin DEFINE_IID!(IFileSinkFilter, "a2104830-7c70-11cf-8bce-00aa00a3f1a6");
alias IFileSinkFilter PFILTERFILESINK;

//export extern(C) const IID IID_IFileSinkFilter2;
interface IFileSinkFilter2 : IFileSinkFilter {
public extern(Windows):
	HRESULT SetMode(DWORD dwFlags);
	HRESULT GetMode(DWORD* pdwFlags);
}
mixin DEFINE_IID!(IFileSinkFilter2, "00855B90-CE1B-11d0-BD4F-00A0C911CE86");
alias IFileSinkFilter2 PFILESINKFILTER2;

enum {
	AM_FILE_OVERWRITE = 0x1
}
alias int AM_FILESINK_FLAGS;

//export extern(C) const IID IID_IGraphBuilder;
interface IGraphBuilder : IFilterGraph {
public extern(Windows):
	HRESULT Connect(IPin ppinOut, IPin ppinIn);
	HRESULT Render(IPin ppinOut);
	HRESULT RenderFile(LPCWSTR lpcwstrFile, LPCWSTR lpcwstrPlayList);
	HRESULT AddSourceFilter(LPCWSTR lpcwstrFileName, LPCWSTR lpcwstrFilterName, IBaseFilter* ppFilter);
	HRESULT SetLogFile(DWORD_PTR hFile);
	HRESULT Abort();
	HRESULT ShouldOperationContinue();
}
mixin DEFINE_IID!(IGraphBuilder, "56a868a9-0ad4-11ce-b03a-0020af0ba770");

//export extern(C) const IID IID_ICaptureGraphBuilder;
interface ICaptureGraphBuilder : IUnknown {
public extern(Windows):
	HRESULT SetFiltergraph(IGraphBuilder pfg);
	HRESULT GetFiltergraph(IGraphBuilder* ppfg);
	HRESULT SetOutputFileName(const(GUID)* pType, LPCOLESTR lpstrFile, IBaseFilter* ppf, IFileSinkFilter* ppSink);
	HRESULT FindInterface(const(GUID)* pCategory, IBaseFilter pf, REFIID riid, void** ppint);
	HRESULT RenderStream(const(GUID)* pCategory, IUnknown pSource, IBaseFilter pfCompressor, IBaseFilter pfRenderer);
	HRESULT ControlStream(const(GUID)* pCategory, IBaseFilter pFilter, REFERENCE_TIME* pstart, REFERENCE_TIME* pstop, WORD wStartCookie, WORD wStopCookie);
	HRESULT AllocCapFile(LPCOLESTR lpstr, DWORDLONG dwlSize);
	HRESULT CopyCaptureFile(LPOLESTR lpwstrOld, LPOLESTR lpwstrNew, int fAllowEscAbort, IAMCopyCaptureFileProgress pCallback);
}
mixin DEFINE_IID!(ICaptureGraphBuilder, "bf87b6e0-8c27-11d0-b3f0-00aa003761c5");

export extern(Windows){
	HRESULT ICaptureGraphBuilder_RemoteFindInterface_Proxy(ICaptureGraphBuilder This, const(GUID)* pCategory, IBaseFilter pf, REFIID riid, IUnknown* ppint);
	void ICaptureGraphBuilder_RemoteFindInterface_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//export extern(C) const IID IID_IAMCopyCaptureFileProgress;
interface IAMCopyCaptureFileProgress : IUnknown {
public extern(Windows):
	HRESULT Progress(int iProgress);
}
mixin DEFINE_IID!(IAMCopyCaptureFileProgress, "670d1d20-a068-11d0-b3f0-00aa003761c5");

//export extern(C) const IID IID_ICaptureGraphBuilder2;
interface ICaptureGraphBuilder2 : IUnknown {
public extern(Windows):
	HRESULT SetFiltergraph(IGraphBuilder pfg);
	HRESULT GetFiltergraph(IGraphBuilder* ppfg);
	HRESULT SetOutputFileName(const(GUID)* pType, LPCOLESTR lpstrFile, IBaseFilter* ppf, IFileSinkFilter* ppSink);
	HRESULT FindInterface(const(GUID)* pCategory, const(GUID)* pType, IBaseFilter pf, REFIID riid, void** ppint);
	HRESULT RenderStream(const(GUID)* pCategory, const(GUID)* pType, IUnknown pSource, IBaseFilter pfCompressor, IBaseFilter pfRenderer);
	HRESULT ControlStream(const(GUID)* pCategory, const(GUID)* pType, IBaseFilter pFilter, REFERENCE_TIME* pstart, REFERENCE_TIME* pstop, WORD wStartCookie, WORD wStopCookie);
	HRESULT AllocCapFile(LPCOLESTR lpstr, DWORDLONG dwlSize);
	HRESULT CopyCaptureFile(LPOLESTR lpwstrOld, LPOLESTR lpwstrNew, int fAllowEscAbort, IAMCopyCaptureFileProgress pCallback);
	HRESULT FindPin(IUnknown pSource, PIN_DIRECTION pindir, const(GUID)* pCategory, const(GUID)* pType, BOOL fUnconnected, int num, IPin* ppPin);
}
mixin DEFINE_IID!(ICaptureGraphBuilder2, "93E5A4E0-2D50-11d2-ABFA-00A0C9C6E38D");

export extern(Windows){
	HRESULT ICaptureGraphBuilder2_RemoteFindInterface_Proxy(ICaptureGraphBuilder2 This, const(GUID)* pCategory, const(GUID)* pType, IBaseFilter pf, REFIID riid, IUnknown* ppint);
	void ICaptureGraphBuilder2_RemoteFindInterface_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

enum {
	AM_RENDEREX_RENDERTOEXISTINGRENDERERS = 0x1
}

//export extern(C) const IID IID_IFilterGraph2;
interface IFilterGraph2 : IGraphBuilder {
public extern(Windows):
	HRESULT AddSourceFilterForMoniker(IMoniker pMoniker, IBindCtx pCtx, LPCWSTR lpcwstrFilterName, IBaseFilter* ppFilter);
	HRESULT ReconnectEx(IPin ppin, const(AM_MEDIA_TYPE)* pmt);
	HRESULT RenderEx(IPin pPinOut, DWORD dwFlags, DWORD* pvContext);
}
mixin DEFINE_IID!(IFilterGraph2, "36b73882-c2c8-11cf-8b46-00805f6cef60");

//export extern(C) const IID IID_IFilterGraph3;
interface IFilterGraph3 : IFilterGraph2 {
public extern(Windows):
	HRESULT SetSyncSourceEx(IReferenceClock pClockForMostOfFilterGraph, IReferenceClock pClockForFilter, IBaseFilter pFilter);
}
mixin DEFINE_IID!(IFilterGraph3, "aaf38154-b80b-422f-91e6-b66467509a07");

//export extern(C) const IID IID_IStreamBuilder;
interface IStreamBuilder : IUnknown {
public extern(Windows):
	HRESULT Render(IPin ppinOut, IGraphBuilder pGraph);
	HRESULT Backout(IPin ppinOut, IGraphBuilder pGraph);
}
mixin DEFINE_IID!(IStreamBuilder, "56a868bf-0ad4-11ce-b03a-0020af0ba770");

//export extern(C) const IID IID_IAsyncReader;
interface IAsyncReader : IUnknown {
public extern(Windows):
	HRESULT RequestAllocator(IMemAllocator pPreferred, ALLOCATOR_PROPERTIES* pProps, IMemAllocator* ppActual);
	HRESULT Request(IMediaSample pSample, DWORD_PTR dwUser);
	HRESULT WaitForNext(DWORD dwTimeout, IMediaSample* ppSample, DWORD_PTR* pdwUser);
	HRESULT SyncReadAligned(IMediaSample pSample);
	HRESULT SyncRead(LONGLONG llPosition, LONG lLength, BYTE* pBuffer);
	HRESULT Length(LONGLONG* pTotal, LONGLONG* pAvailable);
	HRESULT BeginFlush();
	HRESULT EndFlush();
}
mixin DEFINE_IID!(IAsyncReader, "56a868aa-0ad4-11ce-b03a-0020af0ba770");

//export extern(C) const IID IID_IGraphVersion;
interface IGraphVersion : IUnknown {
public extern(Windows):
	HRESULT QueryVersion(LONG* pVersion);
}
mixin DEFINE_IID!(IGraphVersion, "56a868ab-0ad4-11ce-b03a-0020af0ba770");

//export extern(C) const IID IID_IResourceConsumer;
interface IResourceConsumer : IUnknown {
public extern(Windows):
	HRESULT AcquireResource(LONG idResource);
	HRESULT ReleaseResource(LONG idResource);
}
mixin DEFINE_IID!(IResourceConsumer, "56a868ad-0ad4-11ce-b03a-0020af0ba770");

//export extern(C) const IID IID_IResourceManager;
interface IResourceManager : IUnknown {
public extern(Windows):
	HRESULT Register(LPCWSTR pName, LONG cResource, LONG* plToken);
	HRESULT RegisterGroup(LPCWSTR pName, LONG cResource, LONG* palTokens, LONG* plToken);
	HRESULT RequestResource(LONG idResource, IUnknown pFocusObject, IResourceConsumer pConsumer);
	HRESULT NotifyAcquire(LONG idResource, IResourceConsumer pConsumer, HRESULT hr);
	HRESULT NotifyRelease(LONG idResource, IResourceConsumer pConsumer, BOOL bStillWant);
	HRESULT CancelRequest(LONG idResource, IResourceConsumer pConsumer);
	HRESULT SetFocus(IUnknown pFocusObject);
	HRESULT ReleaseFocus(IUnknown pFocusObject);
}
mixin DEFINE_IID!(IResourceManager, "56a868ac-0ad4-11ce-b03a-0020af0ba770");

//export extern(C) const IID IID_IDistributorNotify;
interface IDistributorNotify : IUnknown {
public extern(Windows):
	HRESULT Stop();
	HRESULT Pause();
	HRESULT Run(REFERENCE_TIME tStart);
	HRESULT SetSyncSource(IReferenceClock pClock);
	HRESULT NotifyGraphChange();
}
mixin DEFINE_IID!(IDistributorNotify, "56a868af-0ad4-11ce-b03a-0020af0ba770");

enum {
	AM_STREAM_INFO_START_DEFINED = 0x1,
	AM_STREAM_INFO_STOP_DEFINED = 0x2,
	AM_STREAM_INFO_DISCARDING = 0x4,
	AM_STREAM_INFO_STOP_SEND_EXTRA = 0x10
}
alias int AM_STREAM_INFO_FLAGS;

struct AM_STREAM_INFO {
	REFERENCE_TIME tStart;
	REFERENCE_TIME tStop;
	DWORD dwStartCookie;
	DWORD dwStopCookie;
	DWORD dwFlags;
}

//export extern(C) const IID IID_IAMStreamControl;
interface IAMStreamControl : IUnknown {
public extern(Windows):
	HRESULT StartAt(const(REFERENCE_TIME)* ptStart, DWORD dwCookie);
	HRESULT StopAt(const(REFERENCE_TIME)* ptStop, BOOL bSendExtra, DWORD dwCookie);
	HRESULT GetInfo(AM_STREAM_INFO* pInfo);
}
mixin DEFINE_IID!(IAMStreamControl, "36b73881-c2c8-11cf-8b46-00805f6cef60");

//export extern(C) const IID IID_ISeekingPassThru;
interface ISeekingPassThru : IUnknown {
public extern(Windows):
	HRESULT Init(BOOL bSupportRendering, IPin pPin);
}
mixin DEFINE_IID!(ISeekingPassThru, "36b73883-c2c8-11cf-8b46-00805f6cef60");

struct VIDEO_STREAM_CONFIG_CAPS {
	GUID guid;
	ULONG VideoStandard;
	SIZE InputSize;
	SIZE MinCroppingSize;
	SIZE MaxCroppingSize;
	int CropGranularityX;
	int CropGranularityY;
	int CropAlignX;
	int CropAlignY;
	SIZE MinOutputSize;
	SIZE MaxOutputSize;
	int OutputGranularityX;
	int OutputGranularityY;
	int StretchTapsX;
	int StretchTapsY;
	int ShrinkTapsX;
	int ShrinkTapsY;
	LONGLONG MinFrameInterval;
	LONGLONG MaxFrameInterval;
	LONG MinBitsPerSecond;
	LONG MaxBitsPerSecond;
}

struct AUDIO_STREAM_CONFIG_CAPS {
	GUID guid;
	ULONG MinimumChannels;
	ULONG MaximumChannels;
	ULONG ChannelsGranularity;
	ULONG MinimumBitsPerSample;
	ULONG MaximumBitsPerSample;
	ULONG BitsPerSampleGranularity;
	ULONG MinimumSampleFrequency;
	ULONG MaximumSampleFrequency;
	ULONG SampleFrequencyGranularity;
}

//export extern(C) const IID IID_IAMStreamConfig;
interface IAMStreamConfig : IUnknown {
public extern(Windows):
	HRESULT SetFormat(AM_MEDIA_TYPE* pmt);
	HRESULT GetFormat(AM_MEDIA_TYPE** ppmt);
	HRESULT GetNumberOfCapabilities(int* piCount, int* piSize);
	HRESULT GetStreamCaps(int iIndex, AM_MEDIA_TYPE** ppmt, BYTE* pSCC);
}
mixin DEFINE_IID!(IAMStreamConfig, "C6E13340-30AC-11d0-A18C-00A0C9118956");

enum {
	INTERLEAVE_NONE = 0,
	INTERLEAVE_CAPTURE,
	INTERLEAVE_FULL,
	INTERLEAVE_NONE_BUFFERED
}
alias int InterleavingMode;

//export extern(C) const IID IID_IConfigInterleaving;
interface IConfigInterleaving : IUnknown {
public extern(Windows):
	HRESULT put_Mode(InterleavingMode mode);
	HRESULT get_Mode(InterleavingMode* pMode);
	HRESULT put_Interleaving(const(REFERENCE_TIME)* prtInterleave, const(REFERENCE_TIME)* prtPreroll);
	HRESULT get_Interleaving(REFERENCE_TIME* prtInterleave, REFERENCE_TIME* prtPreroll);
}
mixin DEFINE_IID!(IConfigInterleaving, "BEE3D220-157B-11d0-BD23-00A0C911CE86");

//export extern(C) const IID IID_IConfigAviMux;
interface IConfigAviMux : IUnknown {
public extern(Windows):
	HRESULT SetMasterStream(LONG iStream);
	HRESULT GetMasterStream(LONG* pStream);
	HRESULT SetOutputCompatibilityIndex(BOOL fOldIndex);
	HRESULT GetOutputCompatibilityIndex(BOOL* pfOldIndex);
}
mixin DEFINE_IID!(IConfigAviMux, "5ACD6AA0-F482-11ce-8B67-00AA00A3F1A6");

enum {
	CompressionCaps_CanQuality = 0x1,
	CompressionCaps_CanCrunch = 0x2,
	CompressionCaps_CanKeyFrame = 0x4,
	CompressionCaps_CanBFrame = 0x8,
	CompressionCaps_CanWindow = 0x10
}
alias int CompressionCaps;

//export extern(C) const IID IID_IAMVideoCompression;
interface IAMVideoCompression : IUnknown {
public extern(Windows):
	HRESULT put_KeyFrameRate(int KeyFrameRate);
	HRESULT get_KeyFrameRate(int* pKeyFrameRate);
	HRESULT put_PFramesPerKeyFrame(int PFramesPerKeyFrame);
	HRESULT get_PFramesPerKeyFrame(int* pPFramesPerKeyFrame);
	HRESULT put_Quality(double Quality);
	HRESULT get_Quality(double* pQuality);
	HRESULT put_WindowSize(DWORDLONG WindowSize);
	HRESULT get_WindowSize(DWORDLONG* pWindowSize);
	HRESULT GetInfo(LPWSTR pszVersion, int* pcbVersion, LPWSTR pszDescription, int* pcbDescription, int* pDefaultKeyFrameRate, int* pDefaultPFramesPerKey, double* pDefaultQuality, int* pCapabilities);
	HRESULT OverrideKeyFrame(int FrameNumber);
	HRESULT OverrideFrameSize(int FrameNumber, int Size);
}
mixin DEFINE_IID!(IAMVideoCompression, "C6E13343-30AC-11d0-A18C-00A0C9118956");

enum {
	VfwCaptureDialog_Source = 0x1,
	VfwCaptureDialog_Format = 0x2,
	VfwCaptureDialog_Display = 0x4
}
alias int VfwCaptureDialogs;

enum {
	VfwCompressDialog_Config = 0x1,
	VfwCompressDialog_About = 0x2,
	VfwCompressDialog_QueryConfig = 0x4,
	VfwCompressDialog_QueryAbout = 0x8
}
alias int VfwCompressDialogs;

//export extern(C) const IID IID_IAMVfwCaptureDialogs;
interface IAMVfwCaptureDialogs : IUnknown {
public extern(Windows):
	HRESULT HasDialog(int iDialog);
	HRESULT ShowDialog(int iDialog, HWND hwnd);
	HRESULT SendDriverMessage(int iDialog, int uMsg, int dw1, int dw2);
}
mixin DEFINE_IID!(IAMVfwCaptureDialogs, "D8D715A0-6E5E-11D0-B3F0-00AA003761C5");

//export extern(C) const IID IID_IAMVfwCompressDialogs;
interface IAMVfwCompressDialogs : IUnknown {
public extern(Windows):
	HRESULT ShowDialog(int iDialog, HWND hwnd);
	HRESULT GetState(LPVOID pState, int* pcbState);
	HRESULT SetState(LPVOID pState, int cbState);
	HRESULT SendDriverMessage(int uMsg, int dw1, int dw2);
}
mixin DEFINE_IID!(IAMVfwCompressDialogs, "D8D715A3-6E5E-11D0-B3F0-00AA003761C5");

//export extern(C) const IID IID_IAMDroppedFrames;
interface IAMDroppedFrames : IUnknown {
public extern(Windows):
	HRESULT GetNumDropped(int* plDropped);
	HRESULT GetNumNotDropped(int* plNotDropped);
	HRESULT GetDroppedInfo(int lSize, int* plArray, int* plNumCopied);
	HRESULT GetAverageFrameSize(int* plAverageSize);
}
mixin DEFINE_IID!(IAMDroppedFrames, "C6E13344-30AC-11d0-A18C-00A0C9118956");

enum AMF_AUTOMATICGAIN = -1.0;

//export extern(C) const IID IID_IAMAudioInputMixer;
interface IAMAudioInputMixer : IUnknown {
public extern(Windows):
	HRESULT put_Enable(BOOL fEnable);
	HRESULT get_Enable(BOOL* pfEnable);
	HRESULT put_Mono(BOOL fMono);
	HRESULT get_Mono(BOOL* pfMono);
	HRESULT put_MixLevel(double Level);
	HRESULT get_MixLevel(double* pLevel);
	HRESULT put_Pan(double Pan);
	HRESULT get_Pan(double* pPan);
	HRESULT put_Loudness(BOOL fLoudness);
	HRESULT get_Loudness(BOOL* pfLoudness);
	HRESULT put_Treble(double Treble);
	HRESULT get_Treble(double* pTreble);
	HRESULT get_TrebleRange(double* pRange);
	HRESULT put_Bass(double Bass);
	HRESULT get_Bass(double* pBass);
	HRESULT get_BassRange(double* pRange);
}
mixin DEFINE_IID!(IAMAudioInputMixer, "54C39221-8380-11d0-B3F0-00AA003761C5");

//export extern(C) const IID IID_IAMBufferNegotiation;
interface IAMBufferNegotiation : IUnknown {
public extern(Windows):
	HRESULT SuggestAllocatorProperties(const(ALLOCATOR_PROPERTIES)* pprop);
	HRESULT GetAllocatorProperties(ALLOCATOR_PROPERTIES* pprop);
}
mixin DEFINE_IID!(IAMBufferNegotiation, "56ED71A0-AF5F-11D0-B3F0-00AA003761C5");

enum {
	AnalogVideo_None = 0,
	AnalogVideo_NTSC_M = 0x1,
	AnalogVideo_NTSC_M_J = 0x2,
	AnalogVideo_NTSC_433 = 0x4,
	AnalogVideo_PAL_B = 0x10,
	AnalogVideo_PAL_D = 0x20,
	AnalogVideo_PAL_G = 0x40,
	AnalogVideo_PAL_H = 0x80,
	AnalogVideo_PAL_I = 0x100,
	AnalogVideo_PAL_M = 0x200,
	AnalogVideo_PAL_N = 0x400,
	AnalogVideo_PAL_60 = 0x800,
	AnalogVideo_SECAM_B = 0x1000,
	AnalogVideo_SECAM_D = 0x2000,
	AnalogVideo_SECAM_G = 0x4000,
	AnalogVideo_SECAM_H = 0x8000,
	AnalogVideo_SECAM_K = 0x10000,
	AnalogVideo_SECAM_K1 = 0x20000,
	AnalogVideo_SECAM_L = 0x40000,
	AnalogVideo_SECAM_L1 = 0x80000,
	AnalogVideo_PAL_N_COMBO = 0x100000,
	AnalogVideoMask_MCE_NTSC = AnalogVideo_NTSC_M | AnalogVideo_NTSC_M_J | AnalogVideo_NTSC_433 | AnalogVideo_PAL_M | AnalogVideo_PAL_N | AnalogVideo_PAL_60 | AnalogVideo_PAL_N_COMBO ,
	AnalogVideoMask_MCE_PAL = AnalogVideo_PAL_B | AnalogVideo_PAL_D | AnalogVideo_PAL_G | AnalogVideo_PAL_H | AnalogVideo_PAL_I,
	AnalogVideoMask_MCE_SECAM = AnalogVideo_SECAM_B | AnalogVideo_SECAM_D | AnalogVideo_SECAM_G | AnalogVideo_SECAM_H | AnalogVideo_SECAM_K | AnalogVideo_SECAM_K1 | AnalogVideo_SECAM_L | AnalogVideo_SECAM_L1
}
alias int AnalogVideoStandard;

enum {
	TunerInputCable = 0,
	TunerInputAntenna
}
alias int TunerInputType;

enum {
	AnalogVideo_NTSC_Mask  = 0x00000007,
	AnalogVideo_PAL_Mask   = 0x00100FF0,
	AnalogVideo_SECAM_Mask = 0x000FF000,
}

enum {
	VideoCopyProtectionMacrovisionBasic = 0,
	VideoCopyProtectionMacrovisionCBI
}
alias int VideoCopyProtectionType;

enum {
	PhysConn_Video_Tuner = 1,
	PhysConn_Video_Composite,
	PhysConn_Video_SVideo,
	PhysConn_Video_RGB,
	PhysConn_Video_YRYBY,
	PhysConn_Video_SerialDigital,
	PhysConn_Video_ParallelDigital,
	PhysConn_Video_SCSI,
	PhysConn_Video_AUX,
	PhysConn_Video_1394,
	PhysConn_Video_USB,
	PhysConn_Video_VideoDecoder,
	PhysConn_Video_VideoEncoder,
	PhysConn_Video_SCART,
	PhysConn_Video_Black,
	PhysConn_Audio_Tuner = 0x1000,
	PhysConn_Audio_Line,
	PhysConn_Audio_Mic,
	PhysConn_Audio_AESDigital,
	PhysConn_Audio_SPDIFDigital,
	PhysConn_Audio_SCSI,
	PhysConn_Audio_AUX,
	PhysConn_Audio_1394,
	PhysConn_Audio_USB,
	PhysConn_Audio_AudioDecoder
}
alias int PhysicalConnectorType;

//export extern(C) const IID IID_IAMAnalogVideoDecoder;
interface IAMAnalogVideoDecoder : IUnknown {
public extern(Windows):
	HRESULT get_AvailableTVFormats(int* lAnalogVideoStandard);
	HRESULT put_TVFormat(int lAnalogVideoStandard);
	HRESULT get_TVFormat(int* plAnalogVideoStandard);
	HRESULT get_HorizontalLocked(int* plLocked);
	HRESULT put_VCRHorizontalLocking(int lVCRHorizontalLocking);
	HRESULT get_VCRHorizontalLocking(int* plVCRHorizontalLocking);
	HRESULT get_NumberOfLines(int* plNumberOfLines);
	HRESULT put_OutputEnable(int lOutputEnable);
	HRESULT get_OutputEnable(int* plOutputEnable);
}
mixin DEFINE_IID!(IAMAnalogVideoDecoder, "C6E13350-30AC-11d0-A18C-00A0C9118956");

enum {
	VideoProcAmp_Brightness = 0,
	VideoProcAmp_Contrast,
	VideoProcAmp_Hue,
	VideoProcAmp_Saturation,
	VideoProcAmp_Sharpness,
	VideoProcAmp_Gamma,
	VideoProcAmp_ColorEnable,
	VideoProcAmp_WhiteBalance,
	VideoProcAmp_BacklightCompensation,
	VideoProcAmp_Gain
}
alias int VideoProcAmpProperty;

enum {
	VideoProcAmp_Flags_Auto = 0x1,
	VideoProcAmp_Flags_Manual = 0x2
}
alias int VideoProcAmpFlags;

//export extern(C) const IID IID_IAMVideoProcAmp;
interface IAMVideoProcAmp : IUnknown {
public extern(Windows):
	HRESULT GetRange(int Property, int* pMin, int* pMax, int* pSteppingDelta, int* pDefault, int* pCapsFlags);
	HRESULT Set(int Property, int lValue, int Flags);
	HRESULT Get(int Property, int* lValue, int* Flags);
}
mixin DEFINE_IID!(IAMVideoProcAmp, "C6E13360-30AC-11d0-A18C-00A0C9118956");

enum {
	CameraControl_Pan = 0,
	CameraControl_Tilt,
	CameraControl_Roll,
	CameraControl_Zoom,
	CameraControl_Exposure,
	CameraControl_Iris,
	CameraControl_Focus
}
alias int CameraControlProperty;

enum {
	CameraControl_Flags_Auto = 0x1,
	CameraControl_Flags_Manual = 0x2
}
alias int CameraControlFlags;


//export extern(C) const IID IID_IAMCameraControl;
interface IAMCameraControl : IUnknown {
public extern(Windows):
	HRESULT GetRange(int Property, int* pMin, int* pMax, int* pSteppingDelta, int* pDefault, int* pCapsFlags);
	HRESULT Set(int Property, int lValue, int Flags);
	HRESULT Get(int Property, int* lValue, int* Flags);
}
mixin DEFINE_IID!(IAMCameraControl, "C6E13370-30AC-11d0-A18C-00A0C9118956");

enum {
	VideoControlFlag_FlipHorizontal = 0x1,
	VideoControlFlag_FlipVertical = 0x2,
	VideoControlFlag_ExternalTriggerEnable = 0x4,
	VideoControlFlag_Trigger = 0x8
}
alias int VideoControlFlags;


//export extern(C) const IID IID_IAMVideoControl;
interface IAMVideoControl : IUnknown {
public extern(Windows):
	HRESULT GetCaps(IPin pPin, int* pCapsFlags);
	HRESULT SetMode(IPin pPin, int Mode);
	HRESULT GetMode(IPin pPin, int* Mode);
	HRESULT GetCurrentActualFrameRate(IPin pPin, LONGLONG* ActualFrameRate);
	HRESULT GetMaxAvailableFrameRate(IPin pPin, int iIndex, SIZE Dimensions, LONGLONG *MaxAvailableFrameRate);
	HRESULT GetFrameRateList(IPin pPin, int iIndex, SIZE Dimensions, int* ListSize, LONGLONG** FrameRates);
}
mixin DEFINE_IID!(IAMVideoControl, "6a2e0670-28e4-11d0-a18c-00a0c9118956");

//export extern(C) const IID IID_IAMCrossbar;
interface IAMCrossbar : IUnknown {
public extern(Windows):
	HRESULT get_PinCounts(int* OutputPinCount, int* InputPinCount);
	HRESULT CanRoute(int OutputPinIndex, int InputPinIndex);
	HRESULT Route(int OutputPinIndex, int InputPinIndex);
	HRESULT get_IsRoutedTo(int OutputPinIndex, int* InputPinIndex);
	HRESULT get_CrossbarPinInfo(BOOL IsInputPin, int PinIndex, int* PinIndexRelated, int* PhysicalType);
}
mixin DEFINE_IID!(IAMCrossbar, "C6E13380-30AC-11d0-A18C-00A0C9118956");

enum {
	AMTUNER_SUBCHAN_NO_TUNE = -2,
	AMTUNER_SUBCHAN_DEFAULT = -1
}
alias int AMTunerSubChannel;

enum {
	AMTUNER_HASNOSIGNALSTRENGTH = -1,
	AMTUNER_NOSIGNAL = 0,
	AMTUNER_SIGNALPRESENT = 1
}
alias int AMTunerSignalStrength;

enum {
	AMTUNER_MODE_DEFAULT = 0,
	AMTUNER_MODE_TV = 0x1,
	AMTUNER_MODE_FM_RADIO = 0x2,
	AMTUNER_MODE_AM_RADIO = 0x4,
	AMTUNER_MODE_DSS = 0x8
}
alias int AMTunerModeType;

enum {
	AMTUNER_EVENT_CHANGED = 0x1
}
alias int AMTunerEventType;


//export extern(C) const IID IID_IAMTuner;
interface IAMTuner : IUnknown {
public extern(Windows):
	HRESULT put_Channel(int lChannel, int lVideoSubChannel, int lAudioSubChannel);
	HRESULT get_Channel(int* plChannel, int* plVideoSubChannel, int* plAudioSubChannel);
	HRESULT ChannelMinMax(int* lChannelMin, int* lChannelMax);
	HRESULT put_CountryCode(int lCountryCode);
	HRESULT get_CountryCode(int* plCountryCode);
	HRESULT put_TuningSpace(int lTuningSpace);
	HRESULT get_TuningSpace(int* plTuningSpace);
	HRESULT Logon(HANDLE hCurrentUser);
	HRESULT Logout();
	HRESULT SignalPresent(int* plSignalStrength);
	HRESULT put_Mode(AMTunerModeType lMode);
	HRESULT get_Mode(AMTunerModeType* plMode);
	HRESULT GetAvailableModes(int* plModes);
	HRESULT RegisterNotificationCallBack(IAMTunerNotification pNotify, int lEvents);
	HRESULT UnRegisterNotificationCallBack(IAMTunerNotification pNotify);
}
mixin DEFINE_IID!(IAMTuner, "211A8761-03AC-11d1-8D13-00AA00BD8339");

//export extern(C) const IID IID_IAMTunerNotification;
interface IAMTunerNotification : IUnknown {
public extern(Windows):
	HRESULT OnEvent(AMTunerEventType Event);
}
mixin DEFINE_IID!(IAMTunerNotification, "211A8760-03AC-11d1-8D13-00AA00BD8339");

//export extern(C) const IID IID_IAMTVTuner;
interface IAMTVTuner : IAMTuner {
public extern(Windows):
	HRESULT get_AvailableTVFormats(int* lAnalogVideoStandard);
	HRESULT get_TVFormat(int* plAnalogVideoStandard);
	HRESULT AutoTune(int lChannel, int* plFoundSignal);
	HRESULT StoreAutoTune();
	HRESULT get_NumInputConnections(int* plNumInputConnections);
	HRESULT put_InputType(int lIndex, TunerInputType InputType);
	HRESULT get_InputType(int lIndex, TunerInputType* pInputType);
	HRESULT put_ConnectInput(int lIndex);
	HRESULT get_ConnectInput(int* plIndex);
	HRESULT get_VideoFrequency(int* lFreq);
	HRESULT get_AudioFrequency(int* lFreq);
}
mixin DEFINE_IID!(IAMTVTuner, "211A8766-03AC-11d1-8D13-00AA00BD8339");

//export extern(C) const IID IID_IBPCSatelliteTuner;
interface IBPCSatelliteTuner : IAMTuner {
public extern(Windows):
	HRESULT get_DefaultSubChannelTypes(int* plDefaultVideoType, int* plDefaultAudioType);
	HRESULT put_DefaultSubChannelTypes(int lDefaultVideoType, int lDefaultAudioType);
	HRESULT IsTapingPermitted();
}
mixin DEFINE_IID!(IBPCSatelliteTuner, "211A8765-03AC-11d1-8D13-00AA00BD8339");

enum {
	AMTVAUDIO_MODE_MONO = 0x1,
	AMTVAUDIO_MODE_STEREO = 0x2,
	AMTVAUDIO_MODE_LANG_A = 0x10,
	AMTVAUDIO_MODE_LANG_B = 0x20,
	AMTVAUDIO_MODE_LANG_C = 0x40,
	AMTVAUDIO_PRESET_STEREO = 0x200,
	AMTVAUDIO_PRESET_LANG_A = 0x1000,
	AMTVAUDIO_PRESET_LANG_B = 0x2000,
	AMTVAUDIO_PRESET_LANG_C = 0x4000
}
alias int TVAudioMode;

enum {
	AMTVAUDIO_EVENT_CHANGED = 0x1
}
alias int AMTVAudioEventType;

//export extern(C) const IID IID_IAMTVAudio;
interface IAMTVAudio : IUnknown {
public extern(Windows):
	HRESULT GetHardwareSupportedTVAudioModes(int* plModes);
	HRESULT GetAvailableTVAudioModes(int* plModes);
	HRESULT get_TVAudioMode(int* plMode);
	HRESULT put_TVAudioMode(int lMode);
	HRESULT RegisterNotificationCallBack(IAMTunerNotification pNotify, int lEvents);
	HRESULT UnRegisterNotificationCallBack(IAMTunerNotification pNotify);
}
mixin DEFINE_IID!(IAMTVAudio, "83EC1C30-23D1-11d1-99E6-00A0C9560266");

//export extern(C) const IID IID_IAMTVAudioNotification;
interface IAMTVAudioNotification : IUnknown {
public extern(Windows):
	HRESULT OnEvent(AMTVAudioEventType Event);
}
mixin DEFINE_IID!(IAMTVAudioNotification, "83EC1C33-23D1-11d1-99E6-00A0C9560266");

//export extern(C) const IID IID_IAMAnalogVideoEncoder;
interface IAMAnalogVideoEncoder : IUnknown {
public extern(Windows):
	HRESULT get_AvailableTVFormats(int* lAnalogVideoStandard);
	HRESULT put_TVFormat(int lAnalogVideoStandard);
	HRESULT get_TVFormat(int* plAnalogVideoStandard);
	HRESULT put_CopyProtection(int lVideoCopyProtection);
	HRESULT get_CopyProtection(int* lVideoCopyProtection);
	HRESULT put_CCEnable(int lCCEnable);
	HRESULT get_CCEnable(int* lCCEnable);
}
mixin DEFINE_IID!(IAMAnalogVideoEncoder, "C6E133B0-30AC-11d0-A18C-00A0C9118956");

enum {
	AMPROPERTY_PIN_CATEGORY = 0,
	AMPROPERTY_PIN_MEDIUM
}
alias int AMPROPERTY_PIN;

enum {
	KSPROPERTY_SUPPORT_GET = 1,
	KSPROPERTY_SUPPORT_SET = 2,
}

//export extern(C) const IID IID_IKsPropertySet;
interface IKsPropertySet : IUnknown {
public extern(Windows):
	HRESULT Set(REFGUID guidPropSet, DWORD dwPropID, LPVOID pInstanceData, DWORD cbInstanceData, LPVOID pPropData, DWORD cbPropData);
	HRESULT Get(REFGUID guidPropSet, DWORD dwPropID, LPVOID pInstanceData, DWORD cbInstanceData, LPVOID pPropData, DWORD cbPropData, DWORD* pcbReturned);
	HRESULT QuerySupported(REFGUID guidPropSet, DWORD dwPropID, DWORD* pTypeSupport);
}
mixin DEFINE_IID!(IKsPropertySet, "31EFAC30-515C-11d0-A9AA-00AA0061BE93");

export extern(Windows){
	HRESULT IKsPropertySet_RemoteSet_Proxy(IKsPropertySet This, REFGUID guidPropSet, DWORD dwPropID, byte* pInstanceData, DWORD cbInstanceData, byte* pPropData, DWORD cbPropData);
	void IKsPropertySet_RemoteSet_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IKsPropertySet_RemoteGet_Proxy(IKsPropertySet This, REFGUID guidPropSet, DWORD dwPropID, byte* pInstanceData, DWORD cbInstanceData, byte* pPropData, DWORD cbPropData, DWORD* pcbReturned);
	void IKsPropertySet_RemoteGet_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//export extern(C) const IID IID_IMediaPropertyBag;
interface IMediaPropertyBag : IPropertyBag {
public extern(Windows):
	HRESULT EnumProperty(ULONG iProperty, VARIANT* pvarPropertyName, VARIANT* pvarPropertyValue);
}
mixin DEFINE_IID!(IMediaPropertyBag, "6025A880-C0D5-11d0-BD4E-00A0C911CE86");
alias IMediaPropertyBag LPMEDIAPROPERTYBAG;

//export extern(C) const IID IID_IPersistMediaPropertyBag;
interface IPersistMediaPropertyBag : IPersist {
public extern(Windows):
	HRESULT InitNew();
	HRESULT Load(IMediaPropertyBag pPropBag, IErrorLog pErrorLog);
	HRESULT Save(IMediaPropertyBag pPropBag, BOOL fClearDirty, BOOL fSaveAllProperties);
}
mixin DEFINE_IID!(IPersistMediaPropertyBag, "5738E040-B67F-11d0-BD4D-00A0C911CE86");
alias IPersistMediaPropertyBag LPPERSISTMEDIAPROPERTYBAG;

//export extern(C) const IID IID_IAMPhysicalPinInfo;
interface IAMPhysicalPinInfo : IUnknown {
public extern(Windows):
	HRESULT GetPhysicalType(int* pType, LPOLESTR* ppszType);
}
mixin DEFINE_IID!(IAMPhysicalPinInfo, "F938C991-3029-11cf-8C44-00AA006B6814");
alias IAMPhysicalPinInfo PAMPHYSICALPININFO;

//export extern(C) const IID IID_IAMExtDevice;
interface IAMExtDevice : IUnknown {
public extern(Windows):
	HRESULT GetCapability(int Capability, int* pValue, double* pdblValue);
	HRESULT get_ExternalDeviceID(LPOLESTR* ppszData);
	HRESULT get_ExternalDeviceVersion(LPOLESTR* ppszData);
	HRESULT put_DevicePower(int PowerMode);
	HRESULT get_DevicePower(int* pPowerMode);
	HRESULT Calibrate(HEVENT hEvent, int Mode, int* pStatus);
	HRESULT put_DevicePort(int DevicePort);
	HRESULT get_DevicePort(int* pDevicePort);
}
mixin DEFINE_IID!(IAMExtDevice, "B5730A90-1A2C-11cf-8C23-00AA006B6814");
alias IAMExtDevice PEXTDEVICE;

//export extern(C) const IID IID_IAMExtTransport;
interface IAMExtTransport : IUnknown {
public extern(Windows):
	HRESULT GetCapability(int Capability, int* pValue, double* pdblValue);
	HRESULT put_MediaState(int State);
	HRESULT get_MediaState(int* pState);
	HRESULT put_LocalControl(int State);
	HRESULT get_LocalControl(int* pState);
	HRESULT GetStatus(int StatusItem, int* pValue);
	HRESULT GetTransportBasicParameters(int Param, int* pValue, LPOLESTR* ppszData);
	HRESULT SetTransportBasicParameters(int Param, int Value, LPCOLESTR pszData);
	HRESULT GetTransportVideoParameters(int Param, int* pValue);
	HRESULT SetTransportVideoParameters(int Param, int Value);
	HRESULT GetTransportAudioParameters(int Param, int* pValue);
	HRESULT SetTransportAudioParameters(int Param, int Value);
	HRESULT put_Mode(int Mode);
	HRESULT get_Mode(int* pMode);
	HRESULT put_Rate(double dblRate);
	HRESULT get_Rate(double* pdblRate);
	HRESULT GetChase(int* pEnabled, int* pOffset, HEVENT* phEvent);
	HRESULT SetChase(int Enable, int Offset, HEVENT hEvent);
	HRESULT GetBump(int* pSpeed, int* pDuration);
	HRESULT SetBump(int Speed, int Duration);
	HRESULT get_AntiClogControl(int* pEnabled);
	HRESULT put_AntiClogControl(int Enable);
	HRESULT GetEditPropertySet(int EditID, int* pState);
	HRESULT SetEditPropertySet(int* pEditID, int State);
	HRESULT GetEditProperty(int EditID, int Param, int* pValue);
	HRESULT SetEditProperty(int EditID, int Param, int Value);
	HRESULT get_EditStart(int* pValue);
	HRESULT put_EditStart(int Value);
}
mixin DEFINE_IID!(IAMExtTransport, "A03CD5F0-3045-11cf-8C44-00AA006B6814");
alias IAMExtTransport PIAMEXTTRANSPORT;

union TIMECODE {
	struct {
		WORD wFrameRate;
		WORD wFrameFract;
		DWORD dwFrames;
	}
	DWORDLONG qw;
}
alias TIMECODE *PTIMECODE;

struct TIMECODE_SAMPLE {
	LONGLONG qwTick;
	TIMECODE timecode;
	DWORD dwUser;
	DWORD dwFlags;
}
alias TIMECODE_SAMPLE* PTIMECODE_SAMPLE;

//export extern(C) const IID IID_IAMTimecodeReader;
interface IAMTimecodeReader : IUnknown {
public extern(Windows):
	HRESULT GetTCRMode(int Param, int* pValue);
	HRESULT SetTCRMode(int Param, int Value);
	HRESULT put_VITCLine(int Line);
	HRESULT get_VITCLine(int* pLine);
	HRESULT GetTimecode(PTIMECODE_SAMPLE pTimecodeSample);
}
mixin DEFINE_IID!(IAMTimecodeReader, "9B496CE1-811B-11cf-8C77-00AA006B6814");
alias IAMTimecodeReader PIAMTIMECODEREADER;

//export extern(C) const IID IID_IAMTimecodeGenerator;
interface IAMTimecodeGenerator : IUnknown {
public extern(Windows):
	HRESULT GetTCGMode(int Param, int* pValue);
	HRESULT SetTCGMode(int Param, int Value);
	HRESULT put_VITCLine(int Line);
	HRESULT get_VITCLine(int* pLine);
	HRESULT SetTimecode(PTIMECODE_SAMPLE pTimecodeSample);
	HRESULT GetTimecode(PTIMECODE_SAMPLE pTimecodeSample);
}
mixin DEFINE_IID!(IAMTimecodeGenerator, "9B496CE0-811B-11cf-8C77-00AA006B6814");
alias IAMTimecodeGenerator PIAMTIMECODEGENERATOR;

//export extern(C) const IID IID_IAMTimecodeDisplay;
interface IAMTimecodeDisplay : IUnknown {
public extern(Windows):
	HRESULT GetTCDisplayEnable(int* pState);
	HRESULT SetTCDisplayEnable(int State);
	HRESULT GetTCDisplay(int Param, int* pValue);
	HRESULT SetTCDisplay(int Param, int Value);
}
mixin DEFINE_IID!(IAMTimecodeDisplay, "9B496CE2-811B-11cf-8C77-00AA006B6814");
alias IAMTimecodeDisplay PIAMTIMECODEDISPLAY;

//export extern(C) const IID IID_IAMDevMemoryAllocator;
interface IAMDevMemoryAllocator : IUnknown {
public extern(Windows):
	HRESULT GetInfo(DWORD* pdwcbTotalFree, DWORD* pdwcbLargestFree, DWORD* pdwcbTotalMemory, DWORD* pdwcbMinimumChunk);
	HRESULT CheckMemory(const(BYTE)* pBuffer);
	HRESULT Alloc(BYTE** ppBuffer, DWORD* pdwcbBuffer);
	HRESULT Free(BYTE* pBuffer);
	HRESULT GetDevMemoryObject(IUnknown* ppUnkInnner, IUnknown pUnkOuter);
}
mixin DEFINE_IID!(IAMDevMemoryAllocator, "c6545bf0-e76b-11d0-bd52-00a0c911ce86");
alias IAMDevMemoryAllocator PAMDEVMEMORYALLOCATOR;

//export extern(C) const IID IID_IAMDevMemoryControl;
interface IAMDevMemoryControl : IUnknown {
public extern(Windows):
	HRESULT QueryWriteSync();
	HRESULT WriteSync();
	HRESULT GetDevId(DWORD* pdwDevId);
}
mixin DEFINE_IID!(IAMDevMemoryControl, "c6545bf1-e76b-11d0-bd52-00a0c911ce86");
alias IAMDevMemoryControl PAMDEVMEMORYCONTROL;

enum {
	AMSTREAMSELECTINFO_ENABLED   = 0x1,
	AMSTREAMSELECTINFO_EXCLUSIVE = 0x2
}

enum {
	AMSTREAMSELECTENABLE_ENABLE = 0x1,
	AMSTREAMSELECTENABLE_ENABLEALL = 0x2
}

//export extern(C) const IID IID_IAMStreamSelect;
interface IAMStreamSelect : IUnknown {
public extern(Windows):
	HRESULT Count(DWORD* pcStreams);
	HRESULT Info(int lIndex, AM_MEDIA_TYPE** ppmt, DWORD* pdwFlags, LCID* plcid, DWORD* pdwGroup, LPWSTR* ppszName, IUnknown* ppObject, IUnknown* ppUnk);
	HRESULT Enable(int lIndex, DWORD dwFlags);
}
mixin DEFINE_IID!(IAMStreamSelect, "c1960960-17f5-11d1-abe1-00a0c905f375");
alias IAMStreamSelect PAMSTREAMSELECT;

enum {
	AMRESCTL_RESERVEFLAGS_RESERVE = 0,
	AMRESCTL_RESERVEFLAGS_UNRESERVE = 0x1
} 

//export extern(C) const IID IID_IAMResourceControl;
interface IAMResourceControl : IUnknown {
public extern(Windows):
	HRESULT Reserve(DWORD dwFlags, PVOID pvReserved);
}
mixin DEFINE_IID!(IAMResourceControl, "8389d2d0-77d7-11d1-abe6-00a0c905f375");

//export extern(C) const IID IID_IAMClockAdjust;
interface IAMClockAdjust : IUnknown {
public extern(Windows):
	HRESULT SetClockDelta(REFERENCE_TIME rtDelta);
}
mixin DEFINE_IID!(IAMClockAdjust, "4d5466b0-a49c-11d1-abe8-00a0c905f375");

enum {
	AM_FILTER_MISC_FLAGS_IS_RENDERER = 0x1,
	AM_FILTER_MISC_FLAGS_IS_SOURCE = 0x2
}

//export extern(C) const IID IID_IAMFilterMiscFlags;
interface IAMFilterMiscFlags : IUnknown {
public extern(Windows):
	ULONG GetMiscFlags();
}
mixin DEFINE_IID!(IAMFilterMiscFlags, "2dd74950-a890-11d1-abe8-00a0c905f375");

//export extern(C) const IID IID_IDrawVideoImage;
interface IDrawVideoImage : IUnknown {
public extern(Windows):
	HRESULT DrawVideoImageBegin();
	HRESULT DrawVideoImageEnd();
	HRESULT DrawVideoImageDraw(HDC hdc, LPRECT lprcSrc, LPRECT lprcDst);
}
mixin DEFINE_IID!(IDrawVideoImage, "48efb120-ab49-11d2-aed2-00a0c995e8d5");

//export extern(C) const IID IID_IDecimateVideoImage;
interface IDecimateVideoImage : IUnknown {
public extern(Windows):
	HRESULT SetDecimationImageSize(int lWidth, int lHeight);
	HRESULT ResetDecimationImageSize();
}
mixin DEFINE_IID!(IDecimateVideoImage, "2e5ea3e0-e924-11d2-b6da-00a0c995e8df");

enum {
	DECIMATION_LEGACY = 0,
	DECIMATION_USE_DECODER_ONLY,
	DECIMATION_USE_VIDEOPORT_ONLY,
	DECIMATION_USE_OVERLAY_ONLY,
	DECIMATION_DEFAULT
}
alias int DECIMATION_USAGE;


//export extern(C) const IID IID_IAMVideoDecimationProperties;
interface IAMVideoDecimationProperties : IUnknown {
public extern(Windows):
	HRESULT QueryDecimationUsage(DECIMATION_USAGE* lpUsage);
	HRESULT SetDecimationUsage(DECIMATION_USAGE Usage);
}
mixin DEFINE_IID!(IAMVideoDecimationProperties, "60d32930-13da-11d3-9ec6-c4fcaef5c7be");

//export extern(C) const IID IID_IVideoFrameStep;
interface IVideoFrameStep : IUnknown {
public extern(Windows):
	HRESULT Step(DWORD dwFrames, IUnknown pStepObject);
	HRESULT CanStep(int bMultiple, IUnknown pStepObject);
	HRESULT CancelStep();
}
mixin DEFINE_IID!(IVideoFrameStep, "e46a9787-2b71-444d-a4b5-1fab7b708d6a");

enum {
	AM_PUSHSOURCECAPS_INTERNAL_RM = 0x1,
	AM_PUSHSOURCECAPS_NOT_LIVE = 0x2,
	AM_PUSHSOURCECAPS_PRIVATE_CLOCK = 0x4,
	AM_PUSHSOURCEREQS_USE_STREAM_CLOCK = 0x10000,
	AM_PUSHSOURCEREQS_USE_CLOCK_CHAIN = 0x20000
}

//export extern(C) const IID IID_IAMLatency;
interface IAMLatency : IUnknown {
public extern(Windows):
	HRESULT GetLatency(REFERENCE_TIME* prtLatency);
}
mixin DEFINE_IID!(IAMLatency, "62EA93BA-EC62-11d2-B770-00C04FB6BD3D");

//export extern(C) const IID IID_IAMPushSource;
interface IAMPushSource : IAMLatency {
public extern(Windows):
	HRESULT GetPushSourceFlags(ULONG* pFlags);
	HRESULT SetPushSourceFlags(ULONG Flags);
	HRESULT SetStreamOffset(REFERENCE_TIME rtOffset);
	HRESULT GetStreamOffset(REFERENCE_TIME* prtOffset);
	HRESULT GetMaxStreamOffset(REFERENCE_TIME* prtMaxOffset);
	HRESULT SetMaxStreamOffset(REFERENCE_TIME rtMaxOffset);
}
mixin DEFINE_IID!(IAMPushSource, "F185FE76-E64E-11d2-B76E-00C04FB6BD3D");

//export extern(C) const IID IID_IAMDeviceRemoval;
interface IAMDeviceRemoval : IUnknown {
public extern(Windows):
	HRESULT DeviceInfo(CLSID* pclsidInterfaceClass, LPWSTR* pwszSymbolicLink);
	HRESULT Reassociate();
	HRESULT Disassociate();
}
mixin DEFINE_IID!(IAMDeviceRemoval, "f90a6130-b658-11d2-ae49-0000f8754b99");

struct DVINFO {
	DWORD dwDVAAuxSrc;
	DWORD dwDVAAuxCtl;
	DWORD dwDVAAuxSrc1;
	DWORD dwDVAAuxCtl1;
	DWORD dwDVVAuxSrc;
	DWORD dwDVVAuxCtl;
	DWORD[2] dwDVReserved;
}

alias DVINFO* PDVINFO;

enum {
	DVENCODERRESOLUTION_720x480 = 2012,
	DVENCODERRESOLUTION_360x240 = 2013,
	DVENCODERRESOLUTION_180x120 = 2014,
	DVENCODERRESOLUTION_88x60 = 2015
}

enum {
	DVENCODERVIDEOFORMAT_NTSC = 2000,
	DVENCODERVIDEOFORMAT_PAL = 2001
}

enum {
	DVENCODERFORMAT_DVSD = 2007,
	DVENCODERFORMAT_DVHD = 2008,
	DVENCODERFORMAT_DVSL = 2009
}

//export extern(C) const IID IID_IDVEnc;
interface IDVEnc : IUnknown {
public extern(Windows):
	HRESULT get_IFormatResolution(int* VideoFormat, int* DVFormat, int* Resolution, BYTE fDVInfo, DVINFO* sDVInfo);
	HRESULT put_IFormatResolution(int VideoFormat, int DVFormat, int Resolution, BYTE fDVInfo, DVINFO* sDVInfo);
}
mixin DEFINE_IID!(IDVEnc, "d18e17a0-aacb-11d0-afb0-00aa00b67a42");

enum {
	DVDECODERRESOLUTION_720x480 = 1000,
	DVDECODERRESOLUTION_360x240 = 1001,
	DVDECODERRESOLUTION_180x120 = 1002,
	DVDECODERRESOLUTION_88x60 = 1003
}

enum {
	DVRESOLUTION_FULL = 1000,
	DVRESOLUTION_HALF = 1001,
	DVRESOLUTION_QUARTER = 1002,
	DVRESOLUTION_DC = 1003
}

//export extern(C) const IID IID_IIPDVDec;
interface IIPDVDec : IUnknown {
public extern(Windows):
	HRESULT get_IPDisplay(int* displayPix);
	HRESULT put_IPDisplay(int displayPix);
}
mixin DEFINE_IID!(IIPDVDec, "b8e8bd60-0bfe-11d0-af91-00aa00b67a42");

//export extern(C) const IID IID_IDVRGB219;
interface IDVRGB219 : IUnknown {
public extern(Windows):
	HRESULT SetRGB219(BOOL bState);
}
mixin DEFINE_IID!(IDVRGB219, "58473A19-2BC8-4663-8012-25F81BABDDD1");

//export extern(C) const IID IID_IDVSplitter;
interface IDVSplitter : IUnknown {
public extern(Windows):
	HRESULT DiscardAlternateVideoFrames(int nDiscard);
}
mixin DEFINE_IID!(IDVSplitter, "92a3a302-da7c-4a1f-ba7e-1802bb5d2d02");

enum {
	AM_AUDREND_STAT_PARAM_BREAK_COUNT = 1,
	AM_AUDREND_STAT_PARAM_SLAVE_MODE,
	AM_AUDREND_STAT_PARAM_SILENCE_DUR,
	AM_AUDREND_STAT_PARAM_LAST_BUFFER_DUR,
	AM_AUDREND_STAT_PARAM_DISCONTINUITIES,
	AM_AUDREND_STAT_PARAM_SLAVE_RATE,
	AM_AUDREND_STAT_PARAM_SLAVE_DROPWRITE_DUR,
	AM_AUDREND_STAT_PARAM_SLAVE_HIGHLOWERROR,
	AM_AUDREND_STAT_PARAM_SLAVE_LASTHIGHLOWERROR,
	AM_AUDREND_STAT_PARAM_SLAVE_ACCUMERROR,
	AM_AUDREND_STAT_PARAM_BUFFERFULLNESS,
	AM_AUDREND_STAT_PARAM_JITTER
}

//export extern(C) const IID IID_IAMAudioRendererStats;
interface IAMAudioRendererStats : IUnknown {
public extern(Windows):
	HRESULT GetStatParam(DWORD dwParam, DWORD* pdwParam1, DWORD* pdwParam2);
}
mixin DEFINE_IID!(IAMAudioRendererStats, "22320CB2-D41A-11d2-BF7C-D7CB9DF0BF93");

enum {
	AM_INTF_SEARCH_INPUT_PIN = 0x1,
	AM_INTF_SEARCH_OUTPUT_PIN = 0x2,
	AM_INTF_SEARCH_FILTER = 0x4
}

//export extern(C) const IID IID_IAMGraphStreams;
interface IAMGraphStreams : IUnknown {
public extern(Windows):
	HRESULT FindUpstreamInterface(IPin pPin, REFIID riid, void** ppvInterface, DWORD dwFlags);
	HRESULT SyncUsingStreamOffset(BOOL bUseStreamOffset);
	HRESULT SetMaxGraphLatency(REFERENCE_TIME rtMaxGraphLatency);
}
mixin DEFINE_IID!(IAMGraphStreams, "632105FA-072E-11d3-8AF9-00C04FB6BD3D");

enum {
	AMOVERFX_NOFX = 0,
	AMOVERFX_MIRRORLEFTRIGHT = 0x2,
	AMOVERFX_MIRRORUPDOWN = 0x4,
	AMOVERFX_DEINTERLACE = 0x8
}
alias int AMOVERLAYFX;

//export extern(C) const IID IID_IAMOverlayFX;
interface IAMOverlayFX : IUnknown {
public extern(Windows):
	HRESULT QueryOverlayFXCaps(DWORD* lpdwOverlayFXCaps);
	HRESULT SetOverlayFX(DWORD dwOverlayFX);
	HRESULT GetOverlayFX(DWORD* lpdwOverlayFX);
}
mixin DEFINE_IID!(IAMOverlayFX, "62fae250-7e65-4460-bfc9-6398b322073c");

//export extern(C) const IID IID_IAMOpenProgress;
interface IAMOpenProgress : IUnknown {
public extern(Windows):
	HRESULT QueryProgress(LONGLONG* pllTotal, LONGLONG* pllCurrent);
	HRESULT AbortOperation();
}
mixin DEFINE_IID!(IAMOpenProgress, "8E1C39A1-DE53-11cf-AA63-0080C744528D");

//export extern(C) const IID IID_IMpeg2Demultiplexer;
interface IMpeg2Demultiplexer : IUnknown {
public extern(Windows):
	HRESULT CreateOutputPin(AM_MEDIA_TYPE* pMediaType, LPWSTR pszPinName, IPin* ppIPin);
	HRESULT SetOutputPinMediaType(LPWSTR pszPinName, AM_MEDIA_TYPE* pMediaType);
	HRESULT DeleteOutputPin(LPWSTR pszPinName);
}
mixin DEFINE_IID!(IMpeg2Demultiplexer, "436eee9c-264f-4242-90e1-4e330c107512");

enum {
	MPEG2_PROGRAM_STREAM_MAP           = 0x00000000,
	MPEG2_PROGRAM_ELEMENTARY_STREAM    = 0x00000001,
	MPEG2_PROGRAM_DIRECTORY_PES_PACKET = 0x00000002,
	MPEG2_PROGRAM_PACK_HEADER          = 0x00000003,
	MPEG2_PROGRAM_PES_STREAM           = 0x00000004,
	MPEG2_PROGRAM_SYSTEM_HEADER        = 0x00000005,
	SUBSTREAM_FILTER_VAL_NONE          = 0x10000000,
}

struct STREAM_ID_MAP {
	ULONG stream_id;
	DWORD dwMediaSampleContent;
	ULONG ulSubstreamFilterValue;
	int iDataOffset;
}

//export extern(C) const IID IID_IEnumStreamIdMap;
interface IEnumStreamIdMap : IUnknown {
public extern(Windows):
	HRESULT Next(ULONG cRequest, STREAM_ID_MAP* pStreamIdMap, ULONG* pcReceived);
	HRESULT Skip(ULONG cRecords);
	HRESULT Reset();
	HRESULT Clone(IEnumStreamIdMap* ppIEnumStreamIdMap);
}
mixin DEFINE_IID!(IEnumStreamIdMap, "945C1566-6202-46fc-96C7-D87F289C6534");

//export extern(C) const IID IID_IMPEG2StreamIdMap;
interface IMPEG2StreamIdMap : IUnknown {
public extern(Windows):
	HRESULT MapStreamId(ULONG ulStreamId, DWORD MediaSampleContent, ULONG ulSubstreamFilterValue, int iDataOffset);
	HRESULT UnmapStreamId(ULONG culStreamId, ULONG* pulStreamId);
	HRESULT EnumStreamIdMap(IEnumStreamIdMap* ppIEnumStreamIdMap);
}
mixin DEFINE_IID!(IMPEG2StreamIdMap, "D0E04C47-25B8-4369-925A-362A01D95444");

//export extern(C) const IID IID_IRegisterServiceProvider;
interface IRegisterServiceProvider : IUnknown {
public extern(Windows):
	HRESULT RegisterService(REFGUID guidService, IUnknown pUnkObject);
}
mixin DEFINE_IID!(IRegisterServiceProvider, "7B3A2F01-0751-48DD-B556-004785171C54");

//export extern(C) const IID IID_IAMClockSlave;
interface IAMClockSlave : IUnknown {
public extern(Windows):
	HRESULT SetErrorTolerance(DWORD dwTolerance);
	HRESULT GetErrorTolerance(DWORD* pdwTolerance);
}
mixin DEFINE_IID!(IAMClockSlave, "9FD52741-176D-4b36-8F51-CA8F933223BE");

//export extern(C) const IID IID_IAMGraphBuilderCallback;
interface IAMGraphBuilderCallback : IUnknown {
public extern(Windows):
	HRESULT SelectedFilter(IMoniker pMon);
	HRESULT CreatedFilter(IBaseFilter pFil);
}
mixin DEFINE_IID!(IAMGraphBuilderCallback, "4995f511-9ddb-4f12-bd3b-f04611807b79");

/*EXTERN_GUID(IID_IAMFilterGraphCallback,0x56a868fd,0x0ad4,0x11ce,0xb0,0xa3,0x0,0x20,0xaf,0x0b,0xa7,0x70);
interface IAMFilterGraphCallback : IUnknown
{

HRESULT UnableToRender(IPin *pPin);

};*/

struct CodecAPIEventData {
	GUID guid;
	DWORD dataLength;
	DWORD[3] reserved;
}

//export extern(C) const IID IID_ICodecAPI;
interface ICodecAPI : IUnknown {
public extern(Windows):
	HRESULT IsSupported(const(GUID)* Api);
	HRESULT IsModifiable(const(GUID)* Api);
	HRESULT GetParameterRange(const(GUID)* Api, VARIANT* ValueMin, VARIANT* ValueMax, VARIANT* SteppingDelta);
	HRESULT GetParameterValues(const(GUID)* Api, VARIANT** Values, ULONG* ValuesCount);
	HRESULT GetDefaultValue(const(GUID)* Api, VARIANT* Value);
	HRESULT GetValue(const(GUID)* Api, VARIANT* Value);
	HRESULT SetValue(const(GUID)* Api, VARIANT* Value);
	HRESULT RegisterForEvent(const(GUID)* Api, LONG_PTR userData);
	HRESULT UnregisterForEvent(const(GUID)* Api);
	HRESULT SetAllDefaults();
	HRESULT SetValueWithNotify(const(GUID)* Api, VARIANT* Value, GUID** ChangedParam, ULONG* ChangedParamCount);
	HRESULT SetAllDefaultsWithNotify(GUID** ChangedParam, ULONG* ChangedParamCount);
	HRESULT GetAllSettings(IStream __MIDL__ICodecAPI0000);
	HRESULT SetAllSettings(IStream __MIDL__ICodecAPI0001);
	HRESULT SetAllSettingsWithNotify(IStream __MIDL__ICodecAPI0002, GUID** ChangedParam, ULONG* ChangedParamCount);
}
mixin DEFINE_IID!(ICodecAPI, "901db4c7-31ce-41a2-85dc-8fa0bf41b8da");

//export extern(C) const IID IID_IGetCapabilitiesKey;
interface IGetCapabilitiesKey : IUnknown {
public extern(Windows):
	HRESULT GetCapabilitiesKey(HKEY* pHKey);
}
mixin DEFINE_IID!(IGetCapabilitiesKey, "a8809222-07bb-48ea-951c-33158100625b");

//export extern(C) const IID IID_IEncoderAPI;
interface IEncoderAPI : IUnknown {
public extern(Windows):
	HRESULT IsSupported(const(GUID)* Api);
	HRESULT IsAvailable(const(GUID)* Api);
	HRESULT GetParameterRange(const(GUID)* Api, VARIANT* ValueMin, VARIANT* ValueMax, VARIANT* SteppingDelta);
	HRESULT GetParameterValues(const(GUID)* Api, VARIANT** Values, ULONG* ValuesCount);
	HRESULT GetDefaultValue(const(GUID)* Api, VARIANT* Value);
	HRESULT GetValue(const(GUID)* Api, VARIANT* Value);
	HRESULT SetValue(const(GUID)* Api, VARIANT* Value);
}
mixin DEFINE_IID!(IEncoderAPI, "70423839-6ACC-4b23-B079-21DBF08156A5");

//export extern(C) const IID IID_IVideoEncoder;
interface IVideoEncoder : IEncoderAPI {
public extern(Windows):
}
mixin DEFINE_IID!(IVideoEncoder, "02997C3B-8E1B-460e-9270-545E0DE9563E");

enum {
	ConstantBitRate = 0,
	VariableBitRateAverage,
	VariableBitRatePeak
}
alias int VIDEOENCODER_BITRATE_MODE;

enum {
	AM_GETDECODERCAP_QUERY_VMR_SUPPORT  = 0x00000001,
	VMR_NOTSUPPORTED                    = 0x00000000,
	VMR_SUPPORTED                       = 0x00000001,
	AM_QUERY_DECODER_VMR_SUPPORT        = 0x00000001,
	AM_QUERY_DECODER_DXVA_1_SUPPORT     = 0x00000002,
	AM_QUERY_DECODER_DVD_SUPPORT        = 0x00000003,
	AM_QUERY_DECODER_ATSC_SD_SUPPORT    = 0x00000004,
	AM_QUERY_DECODER_ATSC_HD_SUPPORT    = 0x00000005,
	AM_GETDECODERCAP_QUERY_VMR9_SUPPORT = 0x00000006,
	AM_GETDECODERCAP_QUERY_EVR_SUPPORT  = 0x00000007,
	DECODER_CAP_NOTSUPPORTED            = 0x00000000,
	DECODER_CAP_SUPPORTED               = 0x00000001,
}

//export extern(C) const IID IID_IAMDecoderCaps;
interface IAMDecoderCaps : IUnknown {
public extern(Windows):
	HRESULT GetDecoderCaps(DWORD dwCapIndex, DWORD* lpdwCap);
}
mixin DEFINE_IID!(IAMDecoderCaps, "c0dff467-d499-4986-972b-e1d9090fa941");

struct AMCOPPSignature {
	BYTE[256] Signature;
}

struct AMCOPPCommand {
	GUID macKDI;
	GUID guidCommandID;
	DWORD dwSequence;
	DWORD cbSizeData;
	BYTE[4056] CommandData;
}
alias AMCOPPCommand* LPAMCOPPCommand;

struct AMCOPPStatusInput {
	GUID rApp;
	GUID guidStatusRequestID;
	DWORD dwSequence;
	DWORD cbSizeData;
	BYTE[4056] StatusData;
}
alias AMCOPPStatusInput* LPAMCOPPStatusInput;

struct AMCOPPStatusOutput {
	GUID macKDI;
	DWORD cbSizeData;
	BYTE[4076] COPPStatus;
}
alias AMCOPPStatusOutput* LPAMCOPPStatusOutput;

//export extern(C) const IID IID_IAMCertifiedOutputProtection;
interface IAMCertifiedOutputProtection : IUnknown {
public extern(Windows):
	HRESULT KeyExchange(GUID* pRandom, BYTE** VarLenCertGH, DWORD* pdwLengthCertGH);
	HRESULT SessionSequenceStart(AMCOPPSignature* pSig);
	HRESULT ProtectionCommand(const(AMCOPPCommand)* cmd);
	HRESULT ProtectionStatus(const(AMCOPPStatusInput)* pStatusInput, AMCOPPStatusOutput* pStatusOutput);
}
mixin DEFINE_IID!(IAMCertifiedOutputProtection, "6feded3e-0ff1-4901-a2f1-43f7012c8515");

//export extern(C) const IID IID_IAMAsyncReaderTimestampScaling;
interface IAMAsyncReaderTimestampScaling : IUnknown {
public extern(Windows):
	HRESULT GetTimestampMode(BOOL* pfRaw);
	HRESULT SetTimestampMode(BOOL fRaw);
}
mixin DEFINE_IID!(IAMAsyncReaderTimestampScaling, "cf7b26fc-9a00-485b-8147-3e789d5e8f67");

//export extern(C) const IID IID_IAMPluginControl;
interface IAMPluginControl : IUnknown {
public extern(Windows):
	HRESULT GetPreferredClsid(REFGUID subType, CLSID* clsid);
	HRESULT GetPreferredClsidByIndex(DWORD index, GUID* subType, CLSID* clsid);
	HRESULT SetPreferredClsid(REFGUID subType, const(CLSID)* clsid);
	HRESULT IsDisabled(REFCLSID clsid);
	HRESULT GetDisabledByIndex(DWORD index, CLSID* clsid);
	HRESULT SetDisabled(REFCLSID clsid, BOOL disabled);
	HRESULT IsLegacyDisabled(LPCWSTR dllName);
}
mixin DEFINE_IID!(IAMPluginControl, "0e26a181-f40c-4635-8786-976284b52981");

enum {
	DVD_DOMAIN_FirstPlay = 1,
	DVD_DOMAIN_VideoManagerMenu,
	DVD_DOMAIN_VideoTitleSetMenu,
	DVD_DOMAIN_Title,
	DVD_DOMAIN_Stop
}
alias int DVD_DOMAIN;

enum {
	DVD_MENU_Title = 2,
	DVD_MENU_Root = 3,
	DVD_MENU_Subpicture = 4,
	DVD_MENU_Audio = 5,
	DVD_MENU_Angle = 6,
	DVD_MENU_Chapter = 7
}
alias int DVD_MENU_ID;

enum {
	DVD_SIDE_A = 1,
	DVD_SIDE_B = 2
}
alias int DVD_DISC_SIDE;

enum {
	DISPLAY_CONTENT_DEFAULT = 0,
	DISPLAY_16x9 = 1,
	DISPLAY_4x3_PANSCAN_PREFERRED = 2,
	DISPLAY_4x3_LETTERBOX_PREFERRED = 3
}
alias int DVD_PREFERRED_DISPLAY_MODE;

alias WORD DVD_REGISTER;

alias DVD_REGISTER[16] GPRMARRAY;
alias DVD_REGISTER[24] SPRMARRAY;

struct DVD_ATR {
	ULONG ulCAT;
	BYTE[768] pbATRI;
}

alias BYTE[2] DVD_VideoATR;
alias BYTE[8] DVD_AudioATR;
alias BYTE[6] DVD_SubpictureATR;

enum {
	DVD_FPS_25 = 1,
	DVD_FPS_30NonDrop = 3
}
alias int DVD_FRAMERATE;

struct DVD_TIMECODE {
	ULONG dummy_;
	/*ULONG Hours1 :4;
	ULONG Hours10 :4;
	ULONG Minutes1 :4;
	ULONG Minutes10:4;
	ULONG Seconds1 :4;
	ULONG Seconds10:4;
	ULONG Frames1 :4;
	ULONG Frames10 :2;
	ULONG FrameRateCode: 2;*/
}

enum {
	DVD_NavCmdType_Pre = 1,
	DVD_NavCmdType_Post = 2,
	DVD_NavCmdType_Cell = 3,
	DVD_NavCmdType_Button = 4
}
alias int DVD_NavCmdType;

enum {
	DVD_TC_FLAG_25fps = 0x1,
	DVD_TC_FLAG_30fps = 0x2,
	DVD_TC_FLAG_DropFrame = 0x4,
	DVD_TC_FLAG_Interpolated = 0x8
}
alias int DVD_TIMECODE_FLAGS;

struct DVD_HMSF_TIMECODE {
	BYTE bHours;
	BYTE bMinutes;
	BYTE bSeconds;
	BYTE bFrames;
}

struct DVD_PLAYBACK_LOCATION2 {
	ULONG TitleNum;
	ULONG ChapterNum;
	DVD_HMSF_TIMECODE TimeCode;
	ULONG TimeCodeFlags;
}

struct DVD_PLAYBACK_LOCATION {
	ULONG TitleNum;
	ULONG ChapterNum;
	ULONG TimeCode;
}

alias DWORD VALID_UOP_SOMTHING_OR_OTHER;

enum {
	UOP_FLAG_Play_Title_Or_AtTime = 0x1,
	UOP_FLAG_Play_Chapter = 0x2,
	UOP_FLAG_Play_Title = 0x4,
	UOP_FLAG_Stop = 0x8,
	UOP_FLAG_ReturnFromSubMenu = 0x10,
	UOP_FLAG_Play_Chapter_Or_AtTime = 0x20,
	UOP_FLAG_PlayPrev_Or_Replay_Chapter = 0x40,
	UOP_FLAG_PlayNext_Chapter = 0x80,
	UOP_FLAG_Play_Forwards = 0x100,
	UOP_FLAG_Play_Backwards = 0x200,
	UOP_FLAG_ShowMenu_Title = 0x400,
	UOP_FLAG_ShowMenu_Root = 0x800,
	UOP_FLAG_ShowMenu_SubPic = 0x1000,
	UOP_FLAG_ShowMenu_Audio = 0x2000,
	UOP_FLAG_ShowMenu_Angle = 0x4000,
	UOP_FLAG_ShowMenu_Chapter = 0x8000,
	UOP_FLAG_Resume = 0x10000,
	UOP_FLAG_Select_Or_Activate_Button = 0x20000,
	UOP_FLAG_Still_Off = 0x40000,
	UOP_FLAG_Pause_On = 0x80000,
	UOP_FLAG_Select_Audio_Stream = 0x100000,
	UOP_FLAG_Select_SubPic_Stream = 0x200000,
	UOP_FLAG_Select_Angle = 0x400000,
	UOP_FLAG_Select_Karaoke_Audio_Presentation_Mode = 0x800000,
	UOP_FLAG_Select_Video_Mode_Preference = 0x1000000
}
alias int VALID_UOP_FLAG;

enum {
	DVD_CMD_FLAG_None = 0,
	DVD_CMD_FLAG_Flush = 0x1,
	DVD_CMD_FLAG_SendEvents = 0x2,
	DVD_CMD_FLAG_Block = 0x4,
	DVD_CMD_FLAG_StartWhenRendered = 0x8,
	DVD_CMD_FLAG_EndAfterRendered = 0x10
}
alias int DVD_CMD_FLAGS;

enum {
	DVD_ResetOnStop = 1,
	DVD_NotifyParentalLevelChange = 2,
	DVD_HMSF_TimeCodeEvents = 3,
	DVD_AudioDuringFFwdRew = 4,
	DVD_EnableNonblockingAPIs = 5,
	DVD_CacheSizeInMB = 6,
	DVD_EnablePortableBookmarks = 7,
	DVD_EnableExtendedCopyProtectErrors = 8,
	DVD_NotifyPositionChange = 9,
	DVD_IncreaseOutputControl = 10,
	DVD_EnableStreaming = 11,
	DVD_EnableESOutput = 12,
	DVD_EnableTitleLength = 13,
	DVD_DisableStillThrottle = 14,
	DVD_EnableLoggingEvents = 15,
	DVD_MaxReadBurstInKB = 16,
	DVD_ReadBurstPeriodInMS = 17
}
alias int DVD_OPTION_FLAG;

enum {
	DVD_Relative_Upper = 1,
	DVD_Relative_Lower = 2,
	DVD_Relative_Left = 3,
	DVD_Relative_Right = 4
}
alias int DVD_RELATIVE_BUTTON;

enum {
	DVD_PARENTAL_LEVEL_8 = 0x8000,
	DVD_PARENTAL_LEVEL_7 = 0x4000,
	DVD_PARENTAL_LEVEL_6 = 0x2000,
	DVD_PARENTAL_LEVEL_5 = 0x1000,
	DVD_PARENTAL_LEVEL_4 = 0x800,
	DVD_PARENTAL_LEVEL_3 = 0x400,
	DVD_PARENTAL_LEVEL_2 = 0x200,
	DVD_PARENTAL_LEVEL_1 = 0x100
}
alias int DVD_PARENTAL_LEVEL;

enum {
	DVD_AUD_EXT_NotSpecified = 0,
	DVD_AUD_EXT_Captions = 1,
	DVD_AUD_EXT_VisuallyImpaired = 2,
	DVD_AUD_EXT_DirectorComments1 = 3,
	DVD_AUD_EXT_DirectorComments2 = 4
}
alias int DVD_AUDIO_LANG_EXT;

enum {
	DVD_SP_EXT_NotSpecified = 0,
	DVD_SP_EXT_Caption_Normal = 1,
	DVD_SP_EXT_Caption_Big = 2,
	DVD_SP_EXT_Caption_Children = 3,
	DVD_SP_EXT_CC_Normal = 5,
	DVD_SP_EXT_CC_Big = 6,
	DVD_SP_EXT_CC_Children = 7,
	DVD_SP_EXT_Forced = 9,
	DVD_SP_EXT_DirectorComments_Normal = 13,
	DVD_SP_EXT_DirectorComments_Big = 14,
	DVD_SP_EXT_DirectorComments_Children = 15
}
alias int DVD_SUBPICTURE_LANG_EXT;

enum {
	DVD_AudioMode_None = 0,
	DVD_AudioMode_Karaoke = 1,
	DVD_AudioMode_Surround = 2,
	DVD_AudioMode_Other = 3
}
alias int DVD_AUDIO_APPMODE;

enum {
	DVD_AudioFormat_AC3 = 0,
	DVD_AudioFormat_MPEG1 = 1,
	DVD_AudioFormat_MPEG1_DRC = 2,
	DVD_AudioFormat_MPEG2 = 3,
	DVD_AudioFormat_MPEG2_DRC = 4,
	DVD_AudioFormat_LPCM = 5,
	DVD_AudioFormat_DTS = 6,
	DVD_AudioFormat_SDDS = 7,
	DVD_AudioFormat_Other = 8
}
alias int DVD_AUDIO_FORMAT;

enum {
	DVD_Mix_0to0 = 0x1,
	DVD_Mix_1to0 = 0x2,
	DVD_Mix_2to0 = 0x4,
	DVD_Mix_3to0 = 0x8,
	DVD_Mix_4to0 = 0x10,
	DVD_Mix_Lto0 = 0x20,
	DVD_Mix_Rto0 = 0x40,
	DVD_Mix_0to1 = 0x100,
	DVD_Mix_1to1 = 0x200,
	DVD_Mix_2to1 = 0x400,
	DVD_Mix_3to1 = 0x800,
	DVD_Mix_4to1 = 0x1000,
	DVD_Mix_Lto1 = 0x2000,
	DVD_Mix_Rto1 = 0x4000
}
alias int DVD_KARAOKE_DOWNMIX;

struct DVD_AudioAttributes {
	DVD_AUDIO_APPMODE AppMode;
	BYTE AppModeData;
	DVD_AUDIO_FORMAT AudioFormat;
	LCID Language;
	DVD_AUDIO_LANG_EXT LanguageExtension;
	BOOL fHasMultichannelInfo;
	DWORD dwFrequency;
	BYTE bQuantization;
	BYTE bNumberOfChannels;
	DWORD[2] dwReserved;
}

struct DVD_MUA_MixingInfo {
	BOOL fMixTo0;
	BOOL fMixTo1;
	BOOL fMix0InPhase;
	BOOL fMix1InPhase;
	DWORD dwSpeakerPosition;
}

struct DVD_MUA_Coeff {
	double log2_alpha;
	double log2_beta;
}

struct DVD_MultichannelAudioAttributes {
	DVD_MUA_MixingInfo[8] Info;
	DVD_MUA_Coeff[8] Coeff;
}

enum {
	DVD_Karaoke_GuideVocal1 = 0x1,
	DVD_Karaoke_GuideVocal2 = 0x2,
	DVD_Karaoke_GuideMelody1 = 0x4,
	DVD_Karaoke_GuideMelody2 = 0x8,
	DVD_Karaoke_GuideMelodyA = 0x10,
	DVD_Karaoke_GuideMelodyB = 0x20,
	DVD_Karaoke_SoundEffectA = 0x40,
	DVD_Karaoke_SoundEffectB = 0x80
}
alias int DVD_KARAOKE_CONTENTS;

enum {
	DVD_Assignment_reserved0 = 0,
	DVD_Assignment_reserved1 = 1,
	DVD_Assignment_LR = 2,
	DVD_Assignment_LRM = 3,
	DVD_Assignment_LR1 = 4,
	DVD_Assignment_LRM1 = 5,
	DVD_Assignment_LR12 = 6,
	DVD_Assignment_LRM12 = 7
}
alias int DVD_KARAOKE_ASSIGNMENT;

struct DVD_KaraokeAttributes {
	BYTE bVersion;
	BOOL fMasterOfCeremoniesInGuideVocal1;
	BOOL fDuet;
	DVD_KARAOKE_ASSIGNMENT ChannelAssignment;
	WORD[8] wChannelContents;
}

enum {
	DVD_VideoCompression_Other = 0,
	DVD_VideoCompression_MPEG1 = 1,
	DVD_VideoCompression_MPEG2 = 2
}
alias int DVD_VIDEO_COMPRESSION;

struct DVD_VideoAttributes {
	BOOL fPanscanPermitted;
	BOOL fLetterboxPermitted;
	ULONG ulAspectX;
	ULONG ulAspectY;
	ULONG ulFrameRate;
	ULONG ulFrameHeight;
	DVD_VIDEO_COMPRESSION Compression;
	BOOL fLine21Field1InGOP;
	BOOL fLine21Field2InGOP;
	ULONG ulSourceResolutionX;
	ULONG ulSourceResolutionY;
	BOOL fIsSourceLetterboxed;
	BOOL fIsFilmMode;
}

enum {
	DVD_SPType_NotSpecified = 0,
	DVD_SPType_Language = 1,
	DVD_SPType_Other = 2
}
alias int DVD_SUBPICTURE_TYPE;

enum {
	DVD_SPCoding_RunLength = 0,
	DVD_SPCoding_Extended = 1,
	DVD_SPCoding_Other = 2
}
alias int DVD_SUBPICTURE_CODING;

struct DVD_SubpictureAttributes {
	DVD_SUBPICTURE_TYPE Type;
	DVD_SUBPICTURE_CODING CodingMode;
	LCID Language;
	DVD_SUBPICTURE_LANG_EXT LanguageExtension;
}

enum {
	DVD_AppMode_Not_Specified = 0,
	DVD_AppMode_Karaoke = 1,
	DVD_AppMode_Other = 3
}
alias int DVD_TITLE_APPMODE;

struct DVD_TitleAttributes {
	union {
		DVD_TITLE_APPMODE AppMode;
		DVD_HMSF_TIMECODE TitleLength;
	}
	DVD_VideoAttributes VideoAttributes;
	ULONG ulNumberOfAudioStreams;
	DVD_AudioAttributes[8] AudioAttributes;
	DVD_MultichannelAudioAttributes[8] MultichannelAudioAttributes;
	ULONG ulNumberOfSubpictureStreams;
	DVD_SubpictureAttributes[32] SubpictureAttributes;
}

struct DVD_MenuAttributes {
	BOOL[8] fCompatibleRegion;
	DVD_VideoAttributes VideoAttributes;
	BOOL fAudioPresent;
	DVD_AudioAttributes AudioAttributes;
	BOOL fSubpicturePresent;
	DVD_SubpictureAttributes SubpictureAttributes;
}

//export extern(C) const IID IID_IDvdControl;
interface IDvdControl : IUnknown {
public extern(Windows):
	HRESULT TitlePlay(ULONG ulTitle);
	HRESULT ChapterPlay(ULONG ulTitle, ULONG ulChapter);
	HRESULT TimePlay(ULONG ulTitle, ULONG bcdTime);
	HRESULT StopForResume();
	HRESULT GoUp();
	HRESULT TimeSearch(ULONG bcdTime);
	HRESULT ChapterSearch(ULONG ulChapter);
	HRESULT PrevPGSearch();
	HRESULT TopPGSearch();
	HRESULT NextPGSearch();
	HRESULT ForwardScan(double dwSpeed);
	HRESULT BackwardScan(double dwSpeed);
	HRESULT MenuCall(DVD_MENU_ID MenuID);
	HRESULT Resume();
	HRESULT UpperButtonSelect();
	HRESULT LowerButtonSelect();
	HRESULT LeftButtonSelect();
	HRESULT RightButtonSelect();
	HRESULT ButtonActivate();
	HRESULT ButtonSelectAndActivate(ULONG ulButton);
	HRESULT StillOff();
	HRESULT PauseOn();
	HRESULT PauseOff();
	HRESULT MenuLanguageSelect(LCID Language);
	HRESULT AudioStreamChange(ULONG ulAudio);
	HRESULT SubpictureStreamChange(ULONG ulSubPicture, BOOL bDisplay);
	HRESULT AngleChange(ULONG ulAngle);
	HRESULT ParentalLevelSelect(ULONG ulParentalLevel);
	HRESULT ParentalCountrySelect(WORD wCountry);
	HRESULT KaraokeAudioPresentationModeChange(ULONG ulMode);
	HRESULT VideoModePreferrence(ULONG ulPreferredDisplayMode);
	HRESULT SetRoot(LPCWSTR pszPath);
	HRESULT MouseActivate(POINT point);
	HRESULT MouseSelect(POINT point);
	HRESULT ChapterPlayAutoStop(ULONG ulTitle, ULONG ulChapter, ULONG ulChaptersToPlay);
}
mixin DEFINE_IID!(IDvdControl, "A70EFE61-E2A3-11d0-A9BE-00AA0061BE93");

//export extern(C) const IID IID_IDvdInfo;
interface IDvdInfo : IUnknown {
public extern(Windows):
	HRESULT GetCurrentDomain(DVD_DOMAIN* pDomain);
	HRESULT GetCurrentLocation(DVD_PLAYBACK_LOCATION* pLocation);
	HRESULT GetTotalTitleTime(ULONG* pulTotalTime);
	HRESULT GetCurrentButton(ULONG* pulButtonsAvailable, ULONG* pulCurrentButton);
	HRESULT GetCurrentAngle(ULONG* pulAnglesAvailable, ULONG* pulCurrentAngle);
	HRESULT GetCurrentAudio(ULONG* pulStreamsAvailable, ULONG* pulCurrentStream);
	HRESULT GetCurrentSubpicture(ULONG* pulStreamsAvailable, ULONG* pulCurrentStream, BOOL* pIsDisabled);
	HRESULT GetCurrentUOPS(VALID_UOP_SOMTHING_OR_OTHER* pUOP);
	HRESULT GetAllSPRMs(SPRMARRAY* pRegisterArray);
	HRESULT GetAllGPRMs(GPRMARRAY* pRegisterArray);
	HRESULT GetAudioLanguage(ULONG ulStream, LCID* pLanguage);
	HRESULT GetSubpictureLanguage(ULONG ulStream, LCID* pLanguage);
	HRESULT GetTitleAttributes(ULONG ulTitle, DVD_ATR* pATR);
	HRESULT GetVMGAttributes(DVD_ATR* pATR);
	HRESULT GetCurrentVideoAttributes(DVD_VideoATR* pATR);
	HRESULT GetCurrentAudioAttributes(DVD_AudioATR* pATR);
	HRESULT GetCurrentSubpictureAttributes(DVD_SubpictureATR* pATR);
	HRESULT GetCurrentVolumeInfo(ULONG* pulNumOfVol, ULONG* pulThisVolNum, DVD_DISC_SIDE* pSide, ULONG* pulNumOfTitles);
	HRESULT GetDVDTextInfo(BYTE* pTextManager, ULONG ulBufSize, ULONG* pulActualSize);
	HRESULT GetPlayerParentalLevel(ULONG* pulParentalLevel, ULONG* pulCountryCode);
	HRESULT GetNumberOfChapters(ULONG ulTitle, ULONG* pulNumberOfChapters);
	HRESULT GetTitleParentalLevels(ULONG ulTitle, ULONG* pulParentalLevels);
	HRESULT GetRoot(LPSTR pRoot, ULONG ulBufSize, ULONG* pulActualSize);
}
mixin DEFINE_IID!(IDvdInfo, "A70EFE60-E2A3-11d0-A9BE-00AA0061BE93");

//export extern(C) const IID IID_IDvdCmd;
interface IDvdCmd : IUnknown {
public extern(Windows):
	HRESULT WaitForStart();
	HRESULT WaitForEnd();
}
mixin DEFINE_IID!(IDvdCmd, "5a4a97e4-94ee-4a55-9751-74b5643aa27d");

//export extern(C) const IID IID_IDvdState;
interface IDvdState : IUnknown {
public extern(Windows):
	HRESULT GetDiscID(ULONGLONG* pullUniqueID);
	HRESULT GetParentalLevel(ULONG* pulParentalLevel);
}
mixin DEFINE_IID!(IDvdState, "86303d6d-1c4a-4087-ab42-f711167048ef");

//export extern(C) const IID IID_IDvdControl2;
interface IDvdControl2 : IUnknown {
public extern(Windows):
	HRESULT PlayTitle(ULONG ulTitle, DWORD dwFlags, IDvdCmd* ppCmd);
	HRESULT PlayChapterInTitle(ULONG ulTitle, ULONG ulChapter, DWORD dwFlags, IDvdCmd* ppCmd);
	HRESULT PlayAtTimeInTitle(ULONG ulTitle, DVD_HMSF_TIMECODE* pStartTime, DWORD dwFlags, IDvdCmd* ppCmd);
	HRESULT Stop();
	HRESULT ReturnFromSubmenu(DWORD dwFlags, IDvdCmd* ppCmd);
	HRESULT PlayAtTime(DVD_HMSF_TIMECODE* pTime, DWORD dwFlags, IDvdCmd* ppCmd);
	HRESULT PlayChapter(ULONG ulChapter, DWORD dwFlags, IDvdCmd* ppCmd);
	HRESULT PlayPrevChapter(DWORD dwFlags, IDvdCmd* ppCmd);
	HRESULT ReplayChapter(DWORD dwFlags, IDvdCmd* ppCmd);
	HRESULT PlayNextChapter(DWORD dwFlags, IDvdCmd* ppCmd);
	HRESULT PlayForwards(double dSpeed, DWORD dwFlags, IDvdCmd* ppCmd);
	HRESULT PlayBackwards(double dSpeed, DWORD dwFlags, IDvdCmd* ppCmd);
	HRESULT ShowMenu(DVD_MENU_ID MenuID, DWORD dwFlags, IDvdCmd* ppCmd);
	HRESULT Resume(DWORD dwFlags, IDvdCmd* ppCmd);
	HRESULT SelectRelativeButton(DVD_RELATIVE_BUTTON buttonDir);
	HRESULT ActivateButton();
	HRESULT SelectButton(ULONG ulButton);
	HRESULT SelectAndActivateButton(ULONG ulButton);
	HRESULT StillOff();
	HRESULT Pause(BOOL bState);
	HRESULT SelectAudioStream(ULONG ulAudio, DWORD dwFlags, IDvdCmd* ppCmd);
	HRESULT SelectSubpictureStream(ULONG ulSubPicture, DWORD dwFlags, IDvdCmd* ppCmd);
	HRESULT SetSubpictureState(BOOL bState, DWORD dwFlags, IDvdCmd* ppCmd);
	HRESULT SelectAngle(ULONG ulAngle, DWORD dwFlags, IDvdCmd* ppCmd);
	HRESULT SelectParentalLevel(ULONG ulParentalLevel);
	HRESULT SelectParentalCountry(BYTE* bCountry/*[ 2 ]*/);
	HRESULT SelectKaraokeAudioPresentationMode(ULONG ulMode);
	HRESULT SelectVideoModePreference(ULONG ulPreferredDisplayMode);
	HRESULT SetDVDDirectory(LPCWSTR pszwPath);
	HRESULT ActivateAtPosition(POINT point);
	HRESULT SelectAtPosition(POINT point);
	HRESULT PlayChaptersAutoStop(ULONG ulTitle, ULONG ulChapter, ULONG ulChaptersToPlay, DWORD dwFlags, IDvdCmd* ppCmd);
	HRESULT AcceptParentalLevelChange(BOOL bAccept);
	HRESULT SetOption(DVD_OPTION_FLAG flag, BOOL fState);
	HRESULT SetState(IDvdState pState, DWORD dwFlags, IDvdCmd* ppCmd);
	HRESULT PlayPeriodInTitleAutoStop(ULONG ulTitle, DVD_HMSF_TIMECODE* pStartTime, DVD_HMSF_TIMECODE* pEndTime, DWORD dwFlags, IDvdCmd* ppCmd);
	HRESULT SetGPRM(ULONG ulIndex, WORD wValue, DWORD dwFlags, IDvdCmd* ppCmd);
	HRESULT SelectDefaultMenuLanguage(LCID Language);
	HRESULT SelectDefaultAudioLanguage(LCID Language, DVD_AUDIO_LANG_EXT audioExtension);
	HRESULT SelectDefaultSubpictureLanguage(LCID Language, DVD_SUBPICTURE_LANG_EXT subpictureExtension);
}
mixin DEFINE_IID!(IDvdControl2, "33BC7430-EEC0-11D2-8201-00A0C9D74842");

enum {
	DVD_Struct_Volume = 0x1,
	DVD_Struct_Title = 0x2,
	DVD_Struct_ParentalID = 0x3,
	DVD_Struct_PartOfTitle = 0x4,
	DVD_Struct_Cell = 0x5,
	DVD_Stream_Audio = 0x10,
	DVD_Stream_Subpicture = 0x11,
	DVD_Stream_Angle = 0x12,
	DVD_Channel_Audio = 0x20,
	DVD_General_Name = 0x30,
	DVD_General_Comments = 0x31,
	DVD_Title_Series = 0x38,
	DVD_Title_Movie = 0x39,
	DVD_Title_Video = 0x3a,
	DVD_Title_Album = 0x3b,
	DVD_Title_Song = 0x3c,
	DVD_Title_Other = 0x3f,
	DVD_Title_Sub_Series = 0x40,
	DVD_Title_Sub_Movie = 0x41,
	DVD_Title_Sub_Video = 0x42,
	DVD_Title_Sub_Album = 0x43,
	DVD_Title_Sub_Song = 0x44,
	DVD_Title_Sub_Other = 0x47,
	DVD_Title_Orig_Series = 0x48,
	DVD_Title_Orig_Movie = 0x49,
	DVD_Title_Orig_Video = 0x4a,
	DVD_Title_Orig_Album = 0x4b,
	DVD_Title_Orig_Song = 0x4c,
	DVD_Title_Orig_Other = 0x4f,
	DVD_Other_Scene = 0x50,
	DVD_Other_Cut = 0x51,
	DVD_Other_Take = 0x52
}
alias int DVD_TextStringType;

enum {
	DVD_CharSet_Unicode = 0,
	DVD_CharSet_ISO646 = 1,
	DVD_CharSet_JIS_Roman_Kanji = 2,
	DVD_CharSet_ISO8859_1 = 3,
	DVD_CharSet_ShiftJIS_Kanji_Roman_Katakana = 4
}
alias int DVD_TextCharSet;

enum {
	DVD_TITLE_MENU           = 0x000,
	DVD_STREAM_DATA_CURRENT  = 0x800,
	DVD_STREAM_DATA_VMGM     = 0x400,
	DVD_STREAM_DATA_VTSM     = 0x401,
	DVD_DEFAULT_AUDIO_STREAM = 0x0f,
}

struct DVD_DECODER_CAPS {
	DWORD dwSize;
	DWORD dwAudioCaps;
	double dFwdMaxRateVideo;
	double dFwdMaxRateAudio;
	double dFwdMaxRateSP;
	double dBwdMaxRateVideo;
	double dBwdMaxRateAudio;
	double dBwdMaxRateSP;
	DWORD dwRes1;
	DWORD dwRes2;
	DWORD dwRes3;
	DWORD dwRes4;
}

enum {
	DVD_AUDIO_CAPS_AC3   = 0x00000001,
	DVD_AUDIO_CAPS_MPEG2 = 0x00000002,
	DVD_AUDIO_CAPS_LPCM  = 0x00000004,
	DVD_AUDIO_CAPS_DTS   = 0x00000008,
	DVD_AUDIO_CAPS_SDDS  = 0x00000010,
}

//export extern(C) const IID IID_IDvdInfo2;
interface IDvdInfo2 : IUnknown {
public extern(Windows):
	HRESULT GetCurrentDomain(DVD_DOMAIN* pDomain);
	HRESULT GetCurrentLocation(DVD_PLAYBACK_LOCATION2* pLocation);
	HRESULT GetTotalTitleTime(DVD_HMSF_TIMECODE* pTotalTime, ULONG* ulTimeCodeFlags);
	HRESULT GetCurrentButton(ULONG* pulButtonsAvailable, ULONG* pulCurrentButton);
	HRESULT GetCurrentAngle(ULONG* pulAnglesAvailable, ULONG* pulCurrentAngle);
	HRESULT GetCurrentAudio(ULONG* pulStreamsAvailable, ULONG* pulCurrentStream);
	HRESULT GetCurrentSubpicture(ULONG* pulStreamsAvailable, ULONG* pulCurrentStream, BOOL* pbIsDisabled);
	HRESULT GetCurrentUOPS(ULONG* pulUOPs);
	HRESULT GetAllSPRMs(SPRMARRAY* pRegisterArray);
	HRESULT GetAllGPRMs(GPRMARRAY* pRegisterArray);
	HRESULT GetAudioLanguage(ULONG ulStream, LCID* pLanguage);
	HRESULT GetSubpictureLanguage(ULONG ulStream, LCID* pLanguage);
	HRESULT GetTitleAttributes(ULONG ulTitle, DVD_MenuAttributes* pMenu, DVD_TitleAttributes* pTitle);
	HRESULT GetVMGAttributes(DVD_MenuAttributes* pATR);
	HRESULT GetCurrentVideoAttributes(DVD_VideoAttributes* pATR);
	HRESULT GetAudioAttributes(ULONG ulStream, DVD_AudioAttributes* pATR);
	HRESULT GetKaraokeAttributes(ULONG ulStream, DVD_KaraokeAttributes* pAttributes);
	HRESULT GetSubpictureAttributes(ULONG ulStream, DVD_SubpictureAttributes* pATR);
	HRESULT GetDVDVolumeInfo(ULONG* pulNumOfVolumes, ULONG* pulVolume, DVD_DISC_SIDE* pSide, ULONG* pulNumOfTitles);
	HRESULT GetDVDTextNumberOfLanguages(ULONG* pulNumOfLangs);
	HRESULT GetDVDTextLanguageInfo(ULONG ulLangIndex, ULONG* pulNumOfStrings, LCID* pLangCode, DVD_TextCharSet* pbCharacterSet);
	HRESULT GetDVDTextStringAsNative( ULONG ulLangIndex, ULONG ulStringIndex, BYTE* pbBuffer, ULONG ulMaxBufferSize, ULONG* pulActualSize, DVD_TextStringType* pType);
	HRESULT GetDVDTextStringAsUnicode(ULONG ulLangIndex, ULONG ulStringIndex, WCHAR* pchwBuffer, ULONG ulMaxBufferSize, ULONG* pulActualSize, DVD_TextStringType* pType);
	HRESULT GetPlayerParentalLevel(ULONG* pulParentalLevel, BYTE* pbCountryCode/*[ 2 ]*/);
	HRESULT GetNumberOfChapters(ULONG ulTitle, ULONG* pulNumOfChapters);
	HRESULT GetTitleParentalLevels(ULONG ulTitle, ULONG* pulParentalLevels);
	HRESULT GetDVDDirectory(LPWSTR pszwPath, ULONG ulMaxSize, ULONG* pulActualSize);
	HRESULT IsAudioStreamEnabled(ULONG ulStreamNum, BOOL* pbEnabled);
	HRESULT GetDiscID( LPCWSTR pszwPath, ULONGLONG* pullDiscID);
	HRESULT GetState( IDvdState* pStateData);
	HRESULT GetMenuLanguages(LCID* pLanguages, ULONG ulMaxLanguages, ULONG* pulActualLanguages);
	HRESULT GetButtonAtPosition(POINT point, ULONG* pulButtonIndex);
	HRESULT GetCmdFromEvent(LONG_PTR lParam1, IDvdCmd* pCmdObj);
	HRESULT GetDefaultMenuLanguage(LCID* pLanguage);
	HRESULT GetDefaultAudioLanguage(LCID* pLanguage, DVD_AUDIO_LANG_EXT* pAudioExtension);
	HRESULT GetDefaultSubpictureLanguage(LCID* pLanguage, DVD_SUBPICTURE_LANG_EXT* pSubpictureExtension);
	HRESULT GetDecoderCaps(DVD_DECODER_CAPS* pCaps);
	HRESULT GetButtonRect(ULONG ulButton, RECT* pRect);
	HRESULT IsSubpictureStreamEnabled(ULONG ulStreamNum, BOOL* pbEnabled);
}
mixin DEFINE_IID!(IDvdInfo2, "34151510-EEC0-11D2-8201-00A0C9D74842");

enum {
	AM_DVD_HWDEC_PREFER = 0x1,
	AM_DVD_HWDEC_ONLY = 0x2,
	AM_DVD_SWDEC_PREFER = 0x4,
	AM_DVD_SWDEC_ONLY = 0x8,
	AM_DVD_NOVPE = 0x100,
	AM_DVD_DO_NOT_CLEAR = 0x200,
	AM_DVD_VMR9_ONLY = 0x800,
	AM_DVD_EVR_ONLY = 0x1000,
	AM_DVD_EVR_QOS = 0x2000,
	AM_DVD_ADAPT_GRAPH = 0x4000,
	AM_DVD_MASK = 0xffff
}
alias int AM_DVD_GRAPH_FLAGS;

enum {
	AM_DVD_STREAM_VIDEO = 0x1,
	AM_DVD_STREAM_AUDIO = 0x2,
	AM_DVD_STREAM_SUBPIC = 0x4
}
alias int AM_DVD_STREAM_FLAGS;

struct AM_DVD_RENDERSTATUS {
	HRESULT hrVPEStatus;
	BOOL bDvdVolInvalid;
	BOOL bDvdVolUnknown;
	BOOL bNoLine21In;
	BOOL bNoLine21Out;
	int iNumStreams;
	int iNumStreamsFailed;
	DWORD dwFailedStreamsFlag;
}

//export extern(C) const IID IID_IDvdGraphBuilder;
interface IDvdGraphBuilder : IUnknown {
public extern(Windows):
	HRESULT GetFiltergraph(IGraphBuilder* ppGB);
	HRESULT GetDvdInterface(REFIID riid, void** ppvIF);
	HRESULT RenderDvdVideoVolume(LPCWSTR lpcwszPathName, DWORD dwFlags, AM_DVD_RENDERSTATUS* pStatus);
}
mixin DEFINE_IID!(IDvdGraphBuilder, "FCC152B6-F372-11d0-8E00-00C04FD7C08B");

//export extern(C) const IID IID_IDDrawExclModeVideo;
interface IDDrawExclModeVideo : IUnknown {
public extern(Windows):
	HRESULT SetDDrawObject(IDirectDraw  pDDrawObject);
	HRESULT GetDDrawObject(IDirectDraw* ppDDrawObject, BOOL* pbUsingExternal);
	HRESULT SetDDrawSurface(IDirectDrawSurface pDDrawSurface);
	HRESULT GetDDrawSurface(IDirectDrawSurface* ppDDrawSurface, BOOL* pbUsingExternal);
	HRESULT SetDrawParameters(const(RECT)* prcSource, const(RECT)* prcTarget);
	HRESULT GetNativeVideoProps(DWORD* pdwVideoWidth, DWORD* pdwVideoHeight, DWORD* pdwPictAspectRatioX, DWORD* pdwPictAspectRatioY);
	HRESULT SetCallbackInterface(IDDrawExclModeVideoCallback pCallback, DWORD dwFlags);
}
mixin DEFINE_IID!(IDDrawExclModeVideo, "153ACC21-D83B-11d1-82BF-00A0C9696C8F");

enum {
	AM_OVERLAY_NOTIFY_VISIBLE_CHANGE = 0x1,
	AM_OVERLAY_NOTIFY_SOURCE_CHANGE = 0x2,
	AM_OVERLAY_NOTIFY_DEST_CHANGE = 0x4
}

//export extern(C) const IID IID_IDDrawExclModeVideoCallback;
interface IDDrawExclModeVideoCallback : IUnknown {
public extern(Windows):
	HRESULT OnUpdateOverlay(BOOL bBefore, DWORD dwFlags, BOOL bOldVisible, const(RECT)* prcOldSrc, const(RECT)* prcOldDest, BOOL bNewVisible, const(RECT)* prcNewSrc, const(RECT)* prcNewDest);
	HRESULT OnUpdateColorKey(const(COLORKEY)* pKey, DWORD dwColor);
	HRESULT OnUpdateSize(DWORD dwWidth, DWORD dwHeight, DWORD dwARWidth, DWORD dwARHeight);
}
mixin DEFINE_IID!(IDDrawExclModeVideoCallback, "913c24a0-20ab-11d2-9038-00a0c9697298");

//export extern(C) const IID IID_IPinConnection;
interface IPinConnection : IUnknown {
public extern(Windows):
	HRESULT DynamicQueryAccept(const(AM_MEDIA_TYPE)* pmt);
	HRESULT NotifyEndOfStream(HANDLE hNotifyEvent);
	HRESULT IsEndPin();
	HRESULT DynamicDisconnect();
}
mixin DEFINE_IID!(IPinConnection, "4a9a62d3-27d4-403d-91e9-89f540e55534");

//export extern(C) const IID IID_IPinFlowControl;
interface IPinFlowControl : IUnknown {
public extern(Windows):
	HRESULT Block(DWORD dwBlockFlags, HANDLE hEvent);
}
mixin DEFINE_IID!(IPinFlowControl, "c56e9858-dbf3-4f6b-8119-384af2060deb");

enum {
	AM_PIN_FLOW_CONTROL_BLOCK = 0x1
}

enum {
	AM_GRAPH_CONFIG_RECONNECT_DIRECTCONNECT = 0x1,
	AM_GRAPH_CONFIG_RECONNECT_CACHE_REMOVED_FILTERS = 0x2,
	AM_GRAPH_CONFIG_RECONNECT_USE_ONLY_CACHED_FILTERS = 0x4
}
alias int AM_GRAPH_CONFIG_RECONNECT_FLAGS;

enum {
	REMFILTERF_LEAVECONNECTED = 0x1
}

enum {
	AM_FILTER_FLAGS_REMOVABLE = 0x1
}
alias int AM_FILTER_FLAGS;

//export extern(C) const IID IID_IGraphConfig;
interface IGraphConfig : IUnknown {
public extern(Windows):
	HRESULT Reconnect(IPin pOutputPin, IPin pInputPin, const(AM_MEDIA_TYPE)* pmtFirstConnection, IBaseFilter pUsingFilter, HANDLE hAbortEvent, DWORD dwFlags);
	HRESULT Reconfigure(IGraphConfigCallback pCallback, PVOID pvContext, DWORD dwFlags, HANDLE hAbortEvent);
	HRESULT AddFilterToCache(IBaseFilter pFilter);
	HRESULT EnumCacheFilter(IEnumFilters* pEnum);
	HRESULT RemoveFilterFromCache(IBaseFilter pFilter);
	HRESULT GetStartTime(REFERENCE_TIME* prtStart);
	HRESULT PushThroughData(IPin pOutputPin, IPinConnection pConnection, HANDLE hEventAbort);
	HRESULT SetFilterFlags(IBaseFilter pFilter, DWORD dwFlags);
	HRESULT GetFilterFlags(IBaseFilter pFilter, DWORD* pdwFlags);
	HRESULT RemoveFilterEx(IBaseFilter pFilter, DWORD Flags);
}
mixin DEFINE_IID!(IGraphConfig, "03A1EB8E-32BF-4245-8502-114D08A9CB88");

//export extern(C) const IID IID_IGraphConfigCallback;
interface IGraphConfigCallback : IUnknown {
public extern(Windows):
	HRESULT Reconfigure(PVOID pvContext, DWORD dwFlags);
}
mixin DEFINE_IID!(IGraphConfigCallback, "ade0fd60-d19d-11d2-abf6-00a0c905f375");

//export extern(C) const IID IID_IFilterChain;
interface IFilterChain : IUnknown {
public extern(Windows):
	HRESULT StartChain(IBaseFilter pStartFilter, IBaseFilter pEndFilter);
	HRESULT PauseChain(IBaseFilter pStartFilter, IBaseFilter pEndFilter);
	HRESULT StopChain(IBaseFilter pStartFilter, IBaseFilter pEndFilter);
	HRESULT RemoveChain(IBaseFilter pStartFilter, IBaseFilter pEndFilter);
}
mixin DEFINE_IID!(IFilterChain, "DCFBDCF6-0DC2-45f5-9AB2-7C330EA09C29");

enum {
	VMRSample_SyncPoint = 0x1,
	VMRSample_Preroll = 0x2,
	VMRSample_Discontinuity = 0x4,
	VMRSample_TimeValid = 0x8,
	VMRSample_SrcDstRectsValid = 0x10
}
alias int VMRPresentationFlags;

struct VMRPRESENTATIONINFO {
	DWORD dwFlags;
	LPDIRECTDRAWSURFACE7 lpSurf;
	REFERENCE_TIME rtStart;
	REFERENCE_TIME rtEnd;
	SIZE szAspectRatio;
	RECT rcSrc;
	RECT rcDst;
	DWORD dwTypeSpecificFlags;
	DWORD dwInterlaceFlags;
}

//export extern(C) const IID IID_IVMRImagePresenter;
interface IVMRImagePresenter : IUnknown {
public extern(Windows):
	HRESULT StartPresenting(DWORD_PTR dwUserID);
	HRESULT StopPresenting(DWORD_PTR dwUserID);
	HRESULT PresentImage(DWORD_PTR dwUserID, VMRPRESENTATIONINFO* lpPresInfo);
}
mixin DEFINE_IID!(IVMRImagePresenter, "CE704FE7-E71E-41fb-BAA2-C4403E1182F5");

enum {
	AMAP_PIXELFORMAT_VALID = 0x1,
	AMAP_3D_TARGET = 0x2,
	AMAP_ALLOW_SYSMEM = 0x4,
	AMAP_FORCE_SYSMEM = 0x8,
	AMAP_DIRECTED_FLIP = 0x10,
	AMAP_DXVA_TARGET = 0x20
}
alias int VMRSurfaceAllocationFlags;

struct VMRALLOCATIONINFO {
	DWORD dwFlags;
	LPBITMAPINFOHEADER lpHdr;
	LPDDPIXELFORMAT lpPixFmt;
	SIZE szAspectRatio;
	DWORD dwMinBuffers;
	DWORD dwMaxBuffers;
	DWORD dwInterlaceFlags;
	SIZE szNativeSize;
}

//export extern(C) const IID IID_IVMRSurfaceAllocator;
interface IVMRSurfaceAllocator : IUnknown {
public extern(Windows):
	HRESULT AllocateSurface(DWORD_PTR dwUserID, VMRALLOCATIONINFO* lpAllocInfo, DWORD* lpdwActualBuffers, LPDIRECTDRAWSURFACE7* lplpSurface);
	HRESULT FreeSurface(DWORD_PTR dwID);
	HRESULT PrepareSurface(DWORD_PTR dwUserID, LPDIRECTDRAWSURFACE7 lpSurface, DWORD dwSurfaceFlags);
	HRESULT AdviseNotify(IVMRSurfaceAllocatorNotify lpIVMRSurfAllocNotify);
}
mixin DEFINE_IID!(IVMRSurfaceAllocator, "31ce832e-4484-458b-8cca-f4d7e3db0b52");

//export extern(C) const IID IID_IVMRSurfaceAllocatorNotify;
interface IVMRSurfaceAllocatorNotify : IUnknown {
public extern(Windows):
	HRESULT AdviseSurfaceAllocator(DWORD_PTR dwUserID, IVMRSurfaceAllocator lpIVRMSurfaceAllocator);
	HRESULT SetDDrawDevice(LPDIRECTDRAW7 lpDDrawDevice, HMONITOR hMonitor);
	HRESULT ChangeDDrawDevice(LPDIRECTDRAW7 lpDDrawDevice, HMONITOR hMonitor);
	HRESULT RestoreDDrawSurfaces();
	HRESULT NotifyEvent(LONG EventCode, LONG_PTR Param1, LONG_PTR Param2);
	HRESULT SetBorderColor(COLORREF clrBorder);
}
mixin DEFINE_IID!(IVMRSurfaceAllocatorNotify, "aada05a8-5a4e-4729-af0b-cea27aed51e2");

enum {
	VMR_ARMODE_NONE = 0,
	VMR_ARMODE_LETTER_BOX = VMR_ARMODE_NONE
}
alias int VMR_ASPECT_RATIO_MODE;

//export extern(C) const IID IID_IVMRWindowlessControl;
interface IVMRWindowlessControl : IUnknown {
public extern(Windows):
	HRESULT GetNativeVideoSize(LONG* lpWidth, LONG* lpHeight, LONG* lpARWidth, LONG* lpARHeight);
	HRESULT GetMinIdealVideoSize(LONG* lpWidth, LONG* lpHeight);
	HRESULT GetMaxIdealVideoSize(LONG* lpWidth, LONG* lpHeight);
	HRESULT SetVideoPosition(const(LPRECT)lpSRCRect, const(LPRECT) lpDSTRect);
	HRESULT GetVideoPosition(LPRECT lpSRCRect, LPRECT lpDSTRect);
	HRESULT GetAspectRatioMode(DWORD* lpAspectRatioMode);
	HRESULT SetAspectRatioMode(DWORD AspectRatioMode);
	HRESULT SetVideoClippingWindow(HWND hwnd);
	HRESULT RepaintVideo(HWND hwnd, HDC hdc);
	HRESULT DisplayModeChanged();
	HRESULT GetCurrentImage(BYTE** lpDib);
	HRESULT SetBorderColor(COLORREF Clr);
	HRESULT GetBorderColor(COLORREF* lpClr);
	HRESULT SetColorKey(COLORREF Clr);
	HRESULT GetColorKey(COLORREF* lpClr);
}
mixin DEFINE_IID!(IVMRWindowlessControl, "0eb1088c-4dcd-46f0-878f-39dae86a51b7");

enum {
	MixerPref_NoDecimation = 0x1,
	MixerPref_DecimateOutput = 0x2,
	MixerPref_ARAdjustXorY = 0x4,
	MixerPref_DecimationReserved = 0x8,
	MixerPref_DecimateMask = 0xf,
	MixerPref_BiLinearFiltering = 0x10,
	MixerPref_PointFiltering = 0x20,
	MixerPref_FilteringMask = 0xf0,
	MixerPref_RenderTargetRGB = 0x100,
	MixerPref_RenderTargetYUV = 0x1000,
	MixerPref_RenderTargetYUV420 = 0x200,
	MixerPref_RenderTargetYUV422 = 0x400,
	MixerPref_RenderTargetYUV444 = 0x800,
	MixerPref_RenderTargetReserved = 0xe000,
	MixerPref_RenderTargetMask = 0xff00,
	MixerPref_DynamicSwitchToBOB = 0x10000,
	MixerPref_DynamicDecimateBy2 = 0x20000,
	MixerPref_DynamicReserved = 0xc0000,
	MixerPref_DynamicMask = 0xf0000
}
alias int VMRMixerPrefs;

struct NORMALIZEDRECT {
	float left;
	float top;
	float right;
	float bottom;
}
alias NORMALIZEDRECT* PNORMALIZEDRECT;

//export extern(C) const IID IID_IVMRMixerControl;
interface IVMRMixerControl : IUnknown {
public extern(Windows):
	HRESULT SetAlpha(DWORD dwStreamID, float Alpha);
	HRESULT GetAlpha(DWORD dwStreamID, float* pAlpha);
	HRESULT SetZOrder(DWORD dwStreamID, DWORD dwZ);
	HRESULT GetZOrder(DWORD dwStreamID, DWORD* pZ);
	HRESULT SetOutputRect(DWORD dwStreamID, const(NORMALIZEDRECT)* pRect);
	HRESULT GetOutputRect(DWORD dwStreamID, NORMALIZEDRECT* pRect);
	HRESULT SetBackgroundClr(COLORREF ClrBkg);
	HRESULT GetBackgroundClr(COLORREF* lpClrBkg);
	HRESULT SetMixingPrefs(DWORD dwMixerPrefs);
	HRESULT GetMixingPrefs(DWORD* pdwMixerPrefs);
}
mixin DEFINE_IID!(IVMRMixerControl, "1c1a17b0-bed0-415d-974b-dc6696131599");

struct VMRGUID {
	GUID* pGUID;
	GUID GUID_;
}

struct VMRMONITORINFO {
	VMRGUID guid;
	RECT rcMonitor;
	HMONITOR hMon;
	DWORD dwFlags;
	wchar_t[32] szDevice;
	wchar_t[256] szDescription;
	LARGE_INTEGER liDriverVersion;
	DWORD dwVendorId;
	DWORD dwDeviceId;
	DWORD dwSubSysId;
	DWORD dwRevision;
}

//export extern(C) const IID IID_IVMRMonitorConfig;
interface IVMRMonitorConfig : IUnknown {
public extern(Windows):
	HRESULT SetMonitor(const(VMRGUID)* pGUID);
	HRESULT GetMonitor(VMRGUID* pGUID);
	HRESULT SetDefaultMonitor(const(VMRGUID)* pGUID);
	HRESULT GetDefaultMonitor(VMRGUID* pGUID);
	HRESULT GetAvailableMonitors(VMRMONITORINFO* pInfo, DWORD dwMaxInfoArraySize, DWORD* pdwNumDevices);
}
mixin DEFINE_IID!(IVMRMonitorConfig, "9cf0b1b6-fbaa-4b7f-88cf-cf1f130a0dce");

enum VMRRenderPrefs {
	RenderPrefs_RestrictToInitialMonitor = 0,
	RenderPrefs_ForceOffscreen = 0x1,
	RenderPrefs_ForceOverlays = 0x2,
	RenderPrefs_AllowOverlays = 0,
	RenderPrefs_AllowOffscreen = 0,
	RenderPrefs_DoNotRenderColorKeyAndBorder = 0x8,
	RenderPrefs_Reserved = 0x10,
	RenderPrefs_PreferAGPMemWhenMixing = 0x20,
	RenderPrefs_Mask = 0x3f
}

enum {
	VMRMode_Windowed = 0x1,
	VMRMode_Windowless = 0x2,
	VMRMode_Renderless = 0x4,
	VMRMode_Mask = 0x7
}
alias int VMRMode;

enum {
	MAX_NUMBER_OF_STREAMS = 16
}

//export extern(C) const IID IID_IVMRFilterConfig;
interface IVMRFilterConfig : IUnknown {
public extern(Windows):
	HRESULT SetImageCompositor(IVMRImageCompositor lpVMRImgCompositor);
	HRESULT SetNumberOfStreams(DWORD dwMaxStreams);
	HRESULT GetNumberOfStreams(DWORD* pdwMaxStreams);
	HRESULT SetRenderingPrefs(DWORD dwRenderFlags);
	HRESULT GetRenderingPrefs(DWORD* pdwRenderFlags);
	HRESULT SetRenderingMode(DWORD Mode);
	HRESULT GetRenderingMode(DWORD* pMode);
}
mixin DEFINE_IID!(IVMRFilterConfig, "9e5530c5-7034-48b4-bb46-0b8a6efc8e36");

//export extern(C) const IID IID_IVMRAspectRatioControl;
interface IVMRAspectRatioControl : IUnknown {
public extern(Windows):
	HRESULT GetAspectRatioMode(LPDWORD lpdwARMode);
	HRESULT SetAspectRatioMode(DWORD dwARMode);
}
mixin DEFINE_IID!(IVMRAspectRatioControl, "ede80b5c-bad6-4623-b537-65586c9f8dfd");

enum {
	DeinterlacePref_NextBest = 0x1,
	DeinterlacePref_BOB = 0x2,
	DeinterlacePref_Weave = 0x4,
	DeinterlacePref_Mask = 0x7
}
alias int VMRDeinterlacePrefs;

enum {
	DeinterlaceTech_Unknown = 0,
	DeinterlaceTech_BOBLineReplicate = 0x1,
	DeinterlaceTech_BOBVerticalStretch = 0x2,
	DeinterlaceTech_MedianFiltering = 0x4,
	DeinterlaceTech_EdgeFiltering = 0x10,
	DeinterlaceTech_FieldAdaptive = 0x20,
	DeinterlaceTech_PixelAdaptive = 0x40,
	DeinterlaceTech_MotionVectorSteered = 0x80
}
alias int VMRDeinterlaceTech;

struct VMRFrequency {
	DWORD dwNumerator;
	DWORD dwDenominator;
}

struct VMRVideoDesc {
	DWORD dwSize;
	DWORD dwSampleWidth;
	DWORD dwSampleHeight;
	BOOL SingleFieldPerSample;
	DWORD dwFourCC;
	VMRFrequency InputSampleFreq;
	VMRFrequency OutputFrameFreq;
}

struct VMRDeinterlaceCaps {
	DWORD dwSize;
	DWORD dwNumPreviousOutputFrames;
	DWORD dwNumForwardRefSamples;
	DWORD dwNumBackwardRefSamples;
	VMRDeinterlaceTech DeinterlaceTechnology;
}

//export extern(C) const IID IID_IVMRDeinterlaceControl;
interface IVMRDeinterlaceControl : IUnknown {
public extern(Windows):
	HRESULT GetNumberOfDeinterlaceModes(VMRVideoDesc *lpVideoDescription, LPDWORD lpdwNumDeinterlaceModes, LPGUID lpDeinterlaceModes);
	HRESULT GetDeinterlaceModeCaps(LPGUID lpDeinterlaceMode, VMRVideoDesc* lpVideoDescription, VMRDeinterlaceCaps* lpDeinterlaceCaps);
	HRESULT GetDeinterlaceMode(DWORD dwStreamID, LPGUID lpDeinterlaceMode);
	HRESULT SetDeinterlaceMode(DWORD dwStreamID, LPGUID lpDeinterlaceMode);
	HRESULT GetDeinterlacePrefs(LPDWORD lpdwDeinterlacePrefs);
	HRESULT SetDeinterlacePrefs(DWORD dwDeinterlacePrefs);
	HRESULT GetActualDeinterlaceMode(DWORD dwStreamID, LPGUID lpDeinterlaceMode);
}
mixin DEFINE_IID!(IVMRDeinterlaceControl, "bb057577-0db8-4e6a-87a7-1a8c9a505a0f");

struct VMRALPHABITMAP {
	DWORD dwFlags;
	HDC hdc;
	LPDIRECTDRAWSURFACE7 pDDS;
	RECT rSrc;
	NORMALIZEDRECT rDest;
	FLOAT fAlpha;
	COLORREF clrSrcKey;
}
alias VMRALPHABITMAP* PVMRALPHABITMAP;

enum {
	VMRBITMAP_DISABLE     = 0x00000001,
	VMRBITMAP_HDC         = 0x00000002,
	VMRBITMAP_ENTIREDDS   = 0x00000004,
	VMRBITMAP_SRCCOLORKEY = 0x00000008,
	VMRBITMAP_SRCRECT     = 0x00000010,
}

//export extern(C) const IID IID_IVMRMixerBitmap;
interface IVMRMixerBitmap : IUnknown {
public extern(Windows):
	HRESULT SetAlphaBitmap(const(VMRALPHABITMAP)* pBmpParms);
	HRESULT UpdateAlphaBitmapParameters(PVMRALPHABITMAP pBmpParms);
	HRESULT GetAlphaBitmapParameters(PVMRALPHABITMAP pBmpParms);
}
mixin DEFINE_IID!(IVMRMixerBitmap, "1E673275-0257-40aa-AF20-7C608D4A0428");

struct VMRVIDEOSTREAMINFO {
	LPDIRECTDRAWSURFACE7 pddsVideoSurface;
	DWORD dwWidth;
	DWORD dwHeight;
	DWORD dwStrmID;
	FLOAT fAlpha;
	DDCOLORKEY ddClrKey;
	NORMALIZEDRECT rNormal;
}

//export extern(C) const IID IID_IVMRImageCompositor;
interface IVMRImageCompositor : IUnknown {
public extern(Windows):
	HRESULT InitCompositionTarget(IUnknown pD3DDevice, LPDIRECTDRAWSURFACE7 pddsRenderTarget);
	HRESULT TermCompositionTarget(IUnknown pD3DDevice, LPDIRECTDRAWSURFACE7 pddsRenderTarget);
	HRESULT SetStreamMediaType(DWORD dwStrmID, AM_MEDIA_TYPE* pmt, BOOL fTexture);
	HRESULT CompositeImage(IUnknown pD3DDevice, LPDIRECTDRAWSURFACE7 pddsRenderTarget, AM_MEDIA_TYPE* pmtRenderTarget, REFERENCE_TIME rtStart, REFERENCE_TIME rtEnd, DWORD dwClrBkGnd, VMRVIDEOSTREAMINFO* pVideoStreamInfo, UINT cStreams);
}
mixin DEFINE_IID!(IVMRImageCompositor, "7a4fb5af-479f-4074-bb40-ce6722e43c82");

//export extern(C) const IID IID_IVMRVideoStreamControl;
interface IVMRVideoStreamControl : IUnknown {
public extern(Windows):
	HRESULT SetColorKey(LPDDCOLORKEY lpClrKey);
	HRESULT GetColorKey(LPDDCOLORKEY lpClrKey);
	HRESULT SetStreamActiveState(BOOL fActive);
	HRESULT GetStreamActiveState(BOOL* lpfActive);
}
mixin DEFINE_IID!(IVMRVideoStreamControl, "058d1f11-2a54-4bef-bd54-df706626b727");

//export extern(C) const IID IID_IVMRSurface;
interface IVMRSurface : IUnknown {
public extern(Windows):
	HRESULT IsSurfaceLocked();
	HRESULT LockSurface(BYTE** lpSurface);
	HRESULT UnlockSurface();
	HRESULT GetSurface(LPDIRECTDRAWSURFACE7* lplpSurface);
}
mixin DEFINE_IID!(IVMRSurface, "a9849bbe-9ec8-4263-b764-62730f0d15d0");

//export extern(C) const IID IID_IVMRImagePresenterConfig;
interface IVMRImagePresenterConfig : IUnknown {
public extern(Windows):
	HRESULT SetRenderingPrefs(DWORD dwRenderFlags);
	HRESULT GetRenderingPrefs(DWORD* dwRenderFlags);
}
mixin DEFINE_IID!(IVMRImagePresenterConfig, "9f3a1c85-8555-49ba-935f-be5b5b29d178");

//export extern(C) const IID IID_IVMRImagePresenterExclModeConfig;
interface IVMRImagePresenterExclModeConfig : IVMRImagePresenterConfig {
public extern(Windows):
	HRESULT SetXlcModeDDObjAndPrimarySurface(LPDIRECTDRAW7 lpDDObj, LPDIRECTDRAWSURFACE7 lpPrimarySurf);
	HRESULT GetXlcModeDDObjAndPrimarySurface(LPDIRECTDRAW7* lpDDObj, LPDIRECTDRAWSURFACE7* lpPrimarySurf);
}
mixin DEFINE_IID!(IVMRImagePresenterExclModeConfig, "e6f7ce40-4673-44f1-8f77-5499d68cb4ea");

//export extern(C) const IID IID_IVPManager;
interface IVPManager : IUnknown {
public extern(Windows):
	HRESULT SetVideoPortIndex(DWORD dwVideoPortIndex);
	HRESULT GetVideoPortIndex(DWORD* pdwVideoPortIndex);
}
mixin DEFINE_IID!(IVPManager, "aac18c18-e186-46d2-825d-a1f8dc8e395a");

}// extern(C)
