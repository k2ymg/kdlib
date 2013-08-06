/** mediaobj.d

Converted from 'mediaobj.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.mediaobj;


import c.windows.windef;
import c.windows.guiddef;
import c.windows.strmif;
import c.windows.unknwn;


alias AM_MEDIA_TYPE DMO_MEDIA_TYPE;

extern(C){

enum {
	DMO_INPUT_DATA_BUFFERF_SYNCPOINT  = 0x1,
	DMO_INPUT_DATA_BUFFERF_TIME       = 0x2,
	DMO_INPUT_DATA_BUFFERF_TIMELENGTH = 0x4
}

enum {
	DMO_OUTPUT_DATA_BUFFERF_SYNCPOINT  = 0x1,
	DMO_OUTPUT_DATA_BUFFERF_TIME       = 0x2,
	DMO_OUTPUT_DATA_BUFFERF_TIMELENGTH = 0x4,
	DMO_OUTPUT_DATA_BUFFERF_INCOMPLETE = 0x1000000
}

enum {
	DMO_INPUT_STATUSF_ACCEPT_DATA = 0x1
}

enum {
	DMO_INPUT_STREAMF_WHOLE_SAMPLES            = 0x1,
	DMO_INPUT_STREAMF_SINGLE_SAMPLE_PER_BUFFER = 0x2,
	DMO_INPUT_STREAMF_FIXED_SAMPLE_SIZE        = 0x4,
	DMO_INPUT_STREAMF_HOLDS_BUFFERS            = 0x8
}

enum {
	DMO_OUTPUT_STREAMF_WHOLE_SAMPLES            = 0x1,
	DMO_OUTPUT_STREAMF_SINGLE_SAMPLE_PER_BUFFER = 0x2,
	DMO_OUTPUT_STREAMF_FIXED_SAMPLE_SIZE        = 0x4,
	DMO_OUTPUT_STREAMF_DISCARDABLE              = 0x8,
	DMO_OUTPUT_STREAMF_OPTIONAL                 = 0x10
}

enum {
	DMO_SET_TYPEF_TEST_ONLY = 0x1,
	DMO_SET_TYPEF_CLEAR     = 0x2
}

enum {
	DMO_PROCESS_OUTPUT_DISCARD_WHEN_NO_BUFFER = 0x1
}

//extern extern(C) const IID IID_IMediaBuffer;
interface IMediaBuffer : IUnknown {
public extern(Windows):
	HRESULT SetLength(DWORD cbLength);
	HRESULT GetMaxLength(DWORD* pcbMaxLength);
	HRESULT GetBufferAndLength(BYTE** ppBuffer, DWORD* pcbLength);
}
mixin DEFINE_IID!(IMediaBuffer, "59eff8b9-938c-4a26-82f2-95cb84cdc837");

struct DMO_OUTPUT_DATA_BUFFER {
	IMediaBuffer pBuffer;
	DWORD dwStatus;
	REFERENCE_TIME rtTimestamp;
	REFERENCE_TIME rtTimelength;
}
alias DMO_OUTPUT_DATA_BUFFER* PDMO_OUTPUT_DATA_BUFFER;

//extern extern(C) const IID IID_IMediaObject;
interface IMediaObject : IUnknown {
public extern(Windows):
	HRESULT GetStreamCount(DWORD* pcInputStreams, DWORD* pcOutputStreams);
	HRESULT GetInputStreamInfo(DWORD dwInputStreamIndex, DWORD* pdwFlags);
	HRESULT GetOutputStreamInfo(DWORD dwOutputStreamIndex, DWORD* pdwFlags);
	HRESULT GetInputType(DWORD dwInputStreamIndex, DWORD dwTypeIndex, DMO_MEDIA_TYPE* pmt);
	HRESULT GetOutputType(DWORD dwOutputStreamIndex, DWORD dwTypeIndex, DMO_MEDIA_TYPE* pmt);
	HRESULT SetInputType(DWORD dwInputStreamIndex, const(DMO_MEDIA_TYPE)* pmt, DWORD dwFlags);
	HRESULT SetOutputType(DWORD dwOutputStreamIndex, const(DMO_MEDIA_TYPE)* pmt, DWORD dwFlags);
	HRESULT GetInputCurrentType(DWORD dwInputStreamIndex, DMO_MEDIA_TYPE* pmt);
	HRESULT GetOutputCurrentType(DWORD dwOutputStreamIndex, DMO_MEDIA_TYPE* pmt);
	HRESULT GetInputSizeInfo(DWORD dwInputStreamIndex, DWORD* pcbSize, DWORD* pcbMaxLookahead, DWORD* pcbAlignment);
	HRESULT GetOutputSizeInfo(DWORD dwOutputStreamIndex, DWORD* pcbSize, DWORD* pcbAlignment);
	HRESULT GetInputMaxLatency(DWORD dwInputStreamIndex, REFERENCE_TIME* prtMaxLatency);
	HRESULT SetInputMaxLatency(DWORD dwInputStreamIndex, REFERENCE_TIME rtMaxLatency);
	HRESULT Flush();
	HRESULT Discontinuity(DWORD dwInputStreamIndex);
	HRESULT AllocateStreamingResources();
	HRESULT FreeStreamingResources();
	HRESULT GetInputStatus(DWORD dwInputStreamIndex, DWORD* dwFlags);
	HRESULT ProcessInput(DWORD dwInputStreamIndex, IMediaBuffer pBuffer, DWORD dwFlags, REFERENCE_TIME rtTimestamp, REFERENCE_TIME rtTimelength);
	HRESULT ProcessOutput(DWORD dwFlags, DWORD cOutputBufferCount, DMO_OUTPUT_DATA_BUFFER* pOutputBuffers, DWORD* pdwStatus);
	HRESULT Lock(LONG bLock);
}
mixin DEFINE_IID!(IMediaObject, "d8ad0f58-5494-4102-97c5-ec798e59bcf4");

//extern extern(C) const IID IID_IEnumDMO;
interface IEnumDMO : IUnknown {
public extern(Windows):
	HRESULT Next(DWORD cItemsToFetch, CLSID* pCLSID, LPWSTR* Names, DWORD* pcItemsFetched);
	HRESULT Skip(DWORD cItemsToSkip);
	HRESULT Reset();
	HRESULT Clone(IEnumDMO* ppEnum);
}
mixin DEFINE_IID!(IEnumDMO, "2c3cd98a-2bfa-4a53-9c27-5249ba64ba0f");

enum {
	DMO_INPLACE_NORMAL = 0,
	DMO_INPLACE_ZERO = 0x1
}

//extern extern(C) const IID IID_IMediaObjectInPlace;
interface IMediaObjectInPlace : IUnknown {
public extern(Windows):
	HRESULT Process(ULONG ulSize, BYTE* pData, REFERENCE_TIME refTimeStart, DWORD dwFlags);
	HRESULT Clone(IMediaObjectInPlace* ppMediaObject);
	HRESULT GetLatency(REFERENCE_TIME* pLatencyTime);
}
mixin DEFINE_IID!(IMediaObjectInPlace, "651b9ad0-0fc7-4aa9-9538-d89931010741");

enum {
	DMO_QUALITY_STATUS_ENABLED = 0x1
}

//extern extern(C) const IID IID_IDMOQualityControl;
interface IDMOQualityControl : IUnknown {
public extern(Windows):
	HRESULT SetNow(REFERENCE_TIME rtNow);
	HRESULT SetStatus(DWORD dwFlags);
	HRESULT GetStatus(DWORD* pdwFlags);
}
mixin DEFINE_IID!(IDMOQualityControl, "65abea96-cf36-453f-af8a-705e98f16260");

enum {
	DMO_VOSF_NEEDS_PREVIOUS_SAMPLE = 0x1
}

//extern extern(C) const IID IID_IDMOVideoOutputOptimizations;
interface IDMOVideoOutputOptimizations : IUnknown {
public extern(Windows):
	HRESULT QueryOperationModePreferences(ULONG ulOutputStreamIndex, DWORD* pdwRequestedCapabilities);
	HRESULT SetOperationMode(ULONG ulOutputStreamIndex, DWORD dwEnabledFeatures);
	HRESULT GetCurrentOperationMode(ULONG ulOutputStreamIndex, DWORD* pdwEnabledFeatures);
	HRESULT GetCurrentSampleRequirements(ULONG ulOutputStreamIndex, DWORD* pdwRequestedFeatures);
}
mixin DEFINE_IID!(IDMOVideoOutputOptimizations, "be8f4f4e-5b16-4d29-b350-7f6b5d9298ac");

}// extern(C)
