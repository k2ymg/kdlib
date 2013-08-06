/** control.d

Converted from 'control.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.control;


import c.windows.windef;
import c.windows.wtypes;
import c.windows.guiddef;
import c.windows.unknwn;
import c.windows.oaidl;


extern(C){

alias double REFTIME;
alias LONG_PTR OAEVENT;
alias LONG_PTR OAHWND;
alias int OAFilterState;


mixin DEFINE_GUID!("LIBID_QuartzTypeLib", 0x56a868b0, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70);

mixin DEFINE_GUID!("IID_IAMCollection", 0x56a868b9, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70);
//MIDL_INTERFACE("56a868b9-0ad4-11ce-b03a-0020af0ba770");
interface IAMCollection : IDispatch {
public extern(Windows):
	HRESULT get_Count(LONG* plCount);
	HRESULT Item(int lItem, IUnknown* ppUnk);
	HRESULT get__NewEnum(IUnknown* ppUnk);
}

mixin DEFINE_GUID!("IID_IMediaControl", 0x56a868b1, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70);
//MIDL_INTERFACE("56a868b1-0ad4-11ce-b03a-0020af0ba770")
interface IMediaControl : IDispatch {
public extern(Windows):
	HRESULT Run();
	HRESULT Pause();
	HRESULT Stop();
	HRESULT GetState(LONG msTimeout, OAFilterState* pfs);
	HRESULT RenderFile(BSTR strFilename);
	HRESULT AddSourceFilter(BSTR strFilename, IDispatch* ppUnk);
	HRESULT get_FilterCollection(IDispatch* ppUnk);
	HRESULT get_RegFilterCollection(IDispatch* ppUnk);
	HRESULT StopWhenReady();
}

mixin DEFINE_GUID!("IID_IMediaEvent", 0x56a868b6, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70);
//MIDL_INTERFACE("56a868b6-0ad4-11ce-b03a-0020af0ba770")
interface IMediaEvent : IDispatch {
public extern(Windows):
	HRESULT GetEventHandle(OAEVENT* hEvent);
	HRESULT GetEvent(int* lEventCode, LONG_PTR* lParam1, LONG_PTR* lParam2, int msTimeout);
	HRESULT WaitForCompletion(int msTimeout, int* pEvCode);
	HRESULT CancelDefaultHandling(int lEvCode);
	HRESULT RestoreDefaultHandling(int lEvCode);
	HRESULT FreeEventParams(int lEvCode, LONG_PTR lParam1, LONG_PTR lParam2);
}

mixin DEFINE_GUID!("IID_IMediaEventEx", 0x56a868c0, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70);
//MIDL_INTERFACE("56a868c0-0ad4-11ce-b03a-0020af0ba770")
interface IMediaEventEx : IMediaEvent {
public extern(Windows):
	HRESULT SetNotifyWindow(OAHWND hwnd, int lMsg, LONG_PTR lInstanceData);
	HRESULT SetNotifyFlags(int lNoNotifyFlags);
	HRESULT GetNotifyFlags(int* lplNoNotifyFlags);
}

mixin DEFINE_GUID!("IID_IMediaPosition", 0x56a868b2, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70);
//MIDL_INTERFACE("56a868b2-0ad4-11ce-b03a-0020af0ba770")
interface IMediaPosition : IDispatch {
public extern(Windows):
	HRESULT get_Duration(REFTIME* plength);
	HRESULT put_CurrentPosition(REFTIME llTime);
	HRESULT get_CurrentPosition(REFTIME* pllTime);
	HRESULT get_StopTime(REFTIME* pllTime);
	HRESULT put_StopTime(REFTIME llTime);
	HRESULT get_PrerollTime(REFTIME* pllTime);
	HRESULT put_PrerollTime(REFTIME llTime);
	HRESULT put_Rate(double dRate);
	HRESULT get_Rate(double* pdRate);
	HRESULT CanSeekForward(LONG* pCanSeekForward);
	HRESULT CanSeekBackward(LONG* pCanSeekBackward);
}

mixin DEFINE_GUID!("IID_IBasicAudio", 0x56a868b3, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70);
//MIDL_INTERFACE("56a868b3-0ad4-11ce-b03a-0020af0ba770")
interface IBasicAudio : IDispatch {
public extern(Windows):
	HRESULT put_Volume(int lVolume);
	HRESULT get_Volume(int* plVolume);
	HRESULT put_Balance(int lBalance);
	HRESULT get_Balance(int* plBalance);
}

mixin DEFINE_GUID!("IID_IVideoWindow", 0x56a868b4, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70);
//MIDL_INTERFACE("56a868b4-0ad4-11ce-b03a-0020af0ba770")
interface IVideoWindow : IDispatch {
public extern(Windows):
	HRESULT put_Caption(BSTR strCaption);
	HRESULT get_Caption(BSTR* strCaption);
	HRESULT put_WindowStyle(int WindowStyle);
	HRESULT get_WindowStyle(int* WindowStyle);
	HRESULT put_WindowStyleEx(int WindowStyleEx);
	HRESULT get_WindowStyleEx(int* WindowStyleEx);
	HRESULT put_AutoShow(int AutoShow);
	HRESULT get_AutoShow(int* AutoShow);
	HRESULT put_WindowState(int WindowState);
	HRESULT get_WindowState(int* WindowState);
	HRESULT put_BackgroundPalette(int BackgroundPalette);
	HRESULT get_BackgroundPalette(int* pBackgroundPalette);
	HRESULT put_Visible(int Visible);
	HRESULT get_Visible(int* pVisible);
	HRESULT put_Left(int Left);
	HRESULT get_Left(int* pLeft);
	HRESULT put_Width(int Width);
	HRESULT get_Width(int* pWidth);
	HRESULT put_Top(int Top);
	HRESULT get_Top(int* pTop);
	HRESULT put_Height(int Height);
	HRESULT get_Height(int* pHeight);
	HRESULT put_Owner(OAHWND Owner);
	HRESULT get_Owner(OAHWND* Owner);
	HRESULT put_MessageDrain(OAHWND Drain);
	HRESULT get_MessageDrain(OAHWND* Drain);
	HRESULT get_BorderColor(int* Color);
	HRESULT put_BorderColor(int Color);
	HRESULT get_FullScreenMode(int* FullScreenMode);
	HRESULT put_FullScreenMode(int FullScreenMode);
	HRESULT SetWindowForeground(int Focus);
	HRESULT NotifyOwnerMessage(OAHWND hwnd, int uMsg, LONG_PTR wParam, LONG_PTR lParam);
	HRESULT SetWindowPosition(int Left, int Top, int Width, int Height);
	HRESULT GetWindowPosition(int* pLeft, int* pTop, int* pWidth, int* pHeight);
	HRESULT GetMinIdealImageSize(int* pWidth, int* pHeight);
	HRESULT GetMaxIdealImageSize(int* pWidth, int* pHeight);
	HRESULT GetRestorePosition(int* pLeft, int* pTop, int* pWidth, int* pHeight);
	HRESULT HideCursor(int HideCursor);
	HRESULT IsCursorHidden(int* CursorHidden);
}

mixin DEFINE_GUID!("IID_IBasicVideo", 0x56a868b5, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70);
//MIDL_INTERFACE("56a868b5-0ad4-11ce-b03a-0020af0ba770")
interface IBasicVideo : IDispatch {
public extern(Windows):
	HRESULT get_AvgTimePerFrame(REFTIME* pAvgTimePerFrame);
	HRESULT get_BitRate(int* pBitRate);
	HRESULT get_BitErrorRate(int* pBitErrorRate);
	HRESULT get_VideoWidth(int* pVideoWidth);
	HRESULT get_VideoHeight(int* pVideoHeight);
	HRESULT put_SourceLeft(int SourceLeft);
	HRESULT get_SourceLeft(int* pSourceLeft);
	HRESULT put_SourceWidth(int SourceWidth);
	HRESULT get_SourceWidth(int* pSourceWidth);
	HRESULT put_SourceTop(int SourceTop);
	HRESULT get_SourceTop(int* pSourceTop);
	HRESULT put_SourceHeight(int SourceHeight);
	HRESULT get_SourceHeight(int* pSourceHeight);
	HRESULT put_DestinationLeft(int DestinationLeft);
	HRESULT get_DestinationLeft(int* pDestinationLeft);
	HRESULT put_DestinationWidth(int DestinationWidth);
	HRESULT get_DestinationWidth(int* pDestinationWidth);
	HRESULT put_DestinationTop(int DestinationTop);
	HRESULT get_DestinationTop(int* pDestinationTop);
	HRESULT put_DestinationHeight(int DestinationHeight);
	HRESULT get_DestinationHeight(int* pDestinationHeight);
	HRESULT SetSourcePosition(int Left, int Top, int Width, int Height);
	HRESULT GetSourcePosition(int* pLeft, int* pTop, int* pWidth, int* pHeight);
	HRESULT SetDefaultSourcePosition();
	HRESULT SetDestinationPosition(int Left, int Top, int Width, int Height);
	HRESULT GetDestinationPosition(int* pLeft, int* pTop, int* pWidth, int* pHeight);
	HRESULT SetDefaultDestinationPosition();
	HRESULT GetVideoSize(int* pWidth, int* pHeight);
	HRESULT GetVideoPaletteEntries(int StartIndex, int Entries, int* pRetrieved, int* pPalette);
	HRESULT GetCurrentImage(int* pBufferSize, int* pDIBImage);
	HRESULT IsUsingDefaultSource();
	HRESULT IsUsingDefaultDestination();
}

mixin DEFINE_GUID!("IID_IBasicVideo2", 0x329bb360, 0xf6ea, 0x11d1, 0x90, 0x38, 0x00, 0xa0, 0xc9, 0x69, 0x72, 0x98);
//MIDL_INTERFACE("329bb360-f6ea-11d1-9038-00a0c9697298")
interface IBasicVideo2 : IBasicVideo {
public extern(Windows):
	HRESULT GetPreferredAspectRatio(int* plAspectX, int* plAspectY);
}

mixin DEFINE_GUID!("IID_IDeferredCommand", 0x56a868b8, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70);
//MIDL_INTERFACE("56a868b8-0ad4-11ce-b03a-0020af0ba770")
interface IDeferredCommand : IUnknown {
public extern(Windows):
	HRESULT Cancel();
	HRESULT Confidence(LONG* pConfidence);
	HRESULT Postpone(REFTIME newtime);
	HRESULT GetHResult(HRESULT* phrResult);
}

mixin DEFINE_GUID!("IID_IQueueCommand", 0x56a868b7, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70);
//MIDL_INTERFACE("56a868b7-0ad4-11ce-b03a-0020af0ba770")
interface IQueueCommand : IUnknown {
public extern(Windows):
	HRESULT InvokeAtStreamTime(IDeferredCommand* pCmd, REFTIME time, GUID* iid, int dispidMethod, short wFlags, int cArgs, VARIANT* pDispParams, VARIANT* pvarResult, short* puArgErr);
	HRESULT InvokeAtPresentationTime(IDeferredCommand* pCmd, REFTIME time, GUID* iid, int dispidMethod, short wFlags, int cArgs, VARIANT* pDispParams, VARIANT* pvarResult, short* puArgErr);
}

mixin DEFINE_GUID!("CLSID_FilgraphManager", 0xe436ebb3, 0x524f, 0x11ce, 0x9f, 0x53, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70);
//class DECLSPEC_UUID("e436ebb3-524f-11ce-9f53-0020af0ba770") FilgraphManager;

mixin DEFINE_GUID!("IID_IFilterInfo", 0x56a868ba, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70);
//MIDL_INTERFACE("56a868ba-0ad4-11ce-b03a-0020af0ba770")
interface IFilterInfo : IDispatch {
public extern(Windows):
	HRESULT FindPin(BSTR strPinID, IDispatch* ppUnk);
	HRESULT get_Name(BSTR* strName);
	HRESULT get_VendorInfo(BSTR* strVendorInfo);
	HRESULT get_Filter(IUnknown* ppUnk);
	HRESULT get_Pins(IDispatch* ppUnk);
	HRESULT get_IsFileSource(LONG* pbIsSource);
	HRESULT get_Filename(BSTR* pstrFilename);
	HRESULT put_Filename(BSTR strFilename);
}

mixin DEFINE_GUID!("IID_IRegFilterInfo", 0x56a868bb, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70);
//MIDL_INTERFACE("56a868bb-0ad4-11ce-b03a-0020af0ba770")
interface IRegFilterInfo : IDispatch {
public extern(Windows):
	HRESULT get_Name(BSTR* strName);
	HRESULT Filter(IDispatch* ppUnk);
}

mixin DEFINE_GUID!("IID_IMediaTypeInfo", 0x56a868bc, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70);
//MIDL_INTERFACE("56a868bc-0ad4-11ce-b03a-0020af0ba770")
interface IMediaTypeInfo : IDispatch {
public extern(Windows):
	HRESULT get_Type(BSTR* strType);
	HRESULT get_Subtype(BSTR* strType);
}

mixin DEFINE_GUID!("IID_IPinInfo", 0x56a868bd, 0x0ad4, 0x11ce, 0xb0, 0x3a, 0x00, 0x20, 0xaf, 0x0b, 0xa7, 0x70);
//MIDL_INTERFACE("56a868bd-0ad4-11ce-b03a-0020af0ba770")
interface IPinInfo : IDispatch {
public extern(Windows):
	HRESULT get_Pin(IUnknown* ppUnk);
	HRESULT get_ConnectedTo(IDispatch* ppUnk);
	HRESULT get_ConnectionMediaType(IDispatch* ppUnk);
	HRESULT get_FilterInfo(IDispatch* ppUnk);
	HRESULT get_Name(BSTR* ppUnk);
	HRESULT get_Direction(LONG* ppDirection);
	HRESULT get_PinID(BSTR* strPinID);
	HRESULT get_MediaTypes(IDispatch* ppUnk);
	HRESULT Connect(IUnknown pPin);
	HRESULT ConnectDirect(IUnknown pPin);
	HRESULT ConnectWithType(IUnknown pPin, IDispatch pMediaType);
	HRESULT Disconnect();
	HRESULT Render();
}

mixin DEFINE_GUID!("IID_IAMStats", 0xbc9bcf80, 0xdcd2, 0x11d2, 0xab, 0xf6, 0x00, 0xa0, 0xc9, 0x05, 0xf3, 0x75);
//MIDL_INTERFACE("bc9bcf80-dcd2-11d2-abf6-00a0c905f375")
interface IAMStats : IDispatch {
public extern(Windows):
	HRESULT Reset();
	HRESULT get_Count(LONG* plCount);
	HRESULT GetValueByIndex(int lIndex, BSTR* szName, int* lCount, double* dLast, double* dAverage, double* dStdDev, double* dMin, double* dMax);
	HRESULT GetValueByName(BSTR szName, int* lIndex, int* lCount, double* dLast, double* dAverage, double* dStdDev, double* dMin, double* dMax);
	HRESULT GetIndex(BSTR szName, int lCreate, int* plIndex);
	HRESULT AddValue(int lIndex, double dValue);
}

}// extern(C)
