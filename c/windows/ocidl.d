/** ocidl.d

Converted from 'ocidl.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.ocidl;


import c.windows.windef;
import c.windows.wtypes;
import c.windows.guiddef;
import c.windows.unknwn;
import c.windows.objidl;
import c.windows.rpcdcep;
import c.windows.winuser;
import c.windows.wingdi;
import c.windows.oaidl;
import c.windows.oleidl;
import c.windows.urlmon;
import c.windows.servprov;


extern(C){


enum {
	UAS_NORMAL         = 0,
	UAS_BLOCKED        = 0x1,
	UAS_NOPARENTENABLE = 0x2,
	UAS_MASK           = 0x3
}
alias int UASFLAGS;

enum {
	READYSTATE_UNINITIALIZED = 0,
	READYSTATE_LOADING       = 1,
	READYSTATE_LOADED        = 2,
	READYSTATE_INTERACTIVE   = 3,
	READYSTATE_COMPLETE      = 4
}
alias int READYSTATE;

struct CONNECTDATA {
	IUnknown pUnk;
	DWORD dwCookie;
}
alias CONNECTDATA* PCONNECTDATA;
alias CONNECTDATA* LPCONNECTDATA;

//extern extern(C) const IID IID_IEnumConnections;
interface IEnumConnections : IUnknown {
public extern(Windows):
	HRESULT Next( ULONG cConnections, LPCONNECTDATA rgcd, ULONG* pcFetched);
	HRESULT Skip(ULONG cConnections);
	HRESULT Reset();
	HRESULT Clone(IEnumConnections* ppEnum);
}
mixin DEFINE_IID!(IEnumConnections, "B196B287-BAB4-101A-B69C-00AA00341D07");
alias IEnumConnections PENUMCONNECTIONS;
alias IEnumConnections LPENUMCONNECTIONS;

export extern(Windows){
	HRESULT IEnumConnections_RemoteNext_Proxy(IEnumConnections This, ULONG cConnections, LPCONNECTDATA rgcd, ULONG* pcFetched);
	void IEnumConnections_RemoteNext_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_IConnectionPoint;
interface IConnectionPoint : IUnknown {
public extern(Windows):
	HRESULT GetConnectionInterface(IID* pIID);
	HRESULT GetConnectionPointContainer(IConnectionPointContainer* ppCPC);
	HRESULT Advise(IUnknown* pUnkSink, DWORD* pdwCookie);
	HRESULT Unadvise(DWORD dwCookie);
	HRESULT EnumConnections(IEnumConnections* ppEnum);
}
mixin DEFINE_IID!(IConnectionPoint, "B196B286-BAB4-101A-B69C-00AA00341D07");
alias IConnectionPoint PCONNECTIONPOINT;
alias IConnectionPoint LPCONNECTIONPOINT;

//extern extern(C) const IID IID_IEnumConnectionPoints;
interface IEnumConnectionPoints : IUnknown {
public extern(Windows):
	HRESULT Next(ULONG cConnections, LPCONNECTIONPOINT* ppCP, ULONG* pcFetched);
	HRESULT Skip(ULONG cConnections);
	HRESULT Reset();
	HRESULT Clone(IEnumConnectionPoints* ppEnum);
}
mixin DEFINE_IID!(IEnumConnectionPoints, "B196B285-BAB4-101A-B69C-00AA00341D07");
alias IEnumConnectionPoints PENUMCONNECTIONPOINTS;
alias IEnumConnectionPoints LPENUMCONNECTIONPOINTS;

export extern(Windows){
	HRESULT IEnumConnectionPoints_RemoteNext_Proxy(IEnumConnectionPoints This, ULONG cConnections, LPCONNECTIONPOINT* ppCP, ULONG* pcFetched);
	void IEnumConnectionPoints_RemoteNext_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_IConnectionPointContainer;
interface IConnectionPointContainer : IUnknown {
public extern(Windows):
	HRESULT EnumConnectionPoints(IEnumConnectionPoints* ppEnum);
	HRESULT FindConnectionPoint(REFIID riid, IConnectionPoint* ppCP);
}
mixin DEFINE_IID!(IConnectionPointContainer, "B196B284-BAB4-101A-B69C-00AA00341D07");
alias IConnectionPointContainer PCONNECTIONPOINTCONTAINER;
alias IConnectionPointContainer LPCONNECTIONPOINTCONTAINER;

struct LICINFO {
	LONG cbLicInfo;
	BOOL fRuntimeKeyAvail;
	BOOL fLicVerified;
}
alias LICINFO* LPLICINFO;

//extern extern(C) const IID IID_IClassFactory2;
interface IClassFactory2 : IClassFactory {
public extern(Windows):
	HRESULT GetLicInfo(LICINFO* pLicInfo);
	HRESULT RequestLicKey(DWORD dwReserved, BSTR* pBstrKey);
	HRESULT CreateInstanceLic(IUnknown pUnkOuter, IUnknown pUnkReserved, REFIID riid, BSTR bstrKey, PVOID* ppvObj);
}
mixin DEFINE_IID!(IClassFactory2, "B196B28F-BAB4-101A-B69C-00AA00341D07");
alias IClassFactory2 LPCLASSFACTORY2;

export extern(Windows){
	HRESULT IClassFactory2_RemoteCreateInstanceLic_Proxy(IClassFactory2 This, REFIID riid, BSTR bstrKey, IUnknown* ppvObj);
	void IClassFactory2_RemoteCreateInstanceLic_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_IProvideClassInfo;
interface IProvideClassInfo : IUnknown {
public extern(Windows):
	HRESULT GetClassInfo(ITypeInfo* ppTI);
}
mixin DEFINE_IID!(IProvideClassInfo, "B196B283-BAB4-101A-B69C-00AA00341D07");
alias IProvideClassInfo LPPROVIDECLASSINFO;

enum {
	GUIDKIND_DEFAULT_SOURCE_DISP_IID = 1
}
alias int GUIDKIND;

//extern extern(C) const IID IID_IProvideClassInfo2;
interface IProvideClassInfo2 : IProvideClassInfo {
public extern(Windows):
	HRESULT GetGUID(DWORD dwGuidKind, GUID* pGUID);
}
mixin DEFINE_IID!(IProvideClassInfo2, "A6BC3AC0-DBAA-11CE-9DE3-00AA004BB851");
alias IProvideClassInfo2 LPPROVIDECLASSINFO2;

enum {
	MULTICLASSINFO_GETTYPEINFO           = 0x00000001,
	MULTICLASSINFO_GETNUMRESERVEDDISPIDS = 0x00000002,
	MULTICLASSINFO_GETIIDPRIMARY         = 0x00000004,
	MULTICLASSINFO_GETIIDSOURCE          = 0x00000008,
	TIFLAGS_EXTENDDISPATCHONLY           = 0x00000001,
}

//extern extern(C) const IID IID_IProvideMultipleClassInfo;
interface IProvideMultipleClassInfo : IProvideClassInfo2 {
public extern(Windows):
	HRESULT GetMultiTypeInfoCount(ULONG* pcti);
	HRESULT GetInfoOfIndex(ULONG iti, DWORD dwFlags, ITypeInfo* pptiCoClass, DWORD* pdwTIFlags, ULONG* pcdispidReserved, IID* piidPrimary, IID* piidSource);
}
mixin DEFINE_IID!(IProvideMultipleClassInfo, "A7ABA9C1-8983-11cf-8F20-00805F2CD064");
alias IProvideMultipleClassInfo LPPROVIDEMULTIPLECLASSINFO;

struct CONTROLINFO {
	ULONG cb;
	HACCEL hAccel;
	USHORT cAccel;
	DWORD dwFlags;
}
alias CONTROLINFO* LPCONTROLINFO;

enum {
	CTRLINFO_EATS_RETURN = 1,
	CTRLINFO_EATS_ESCAPE = 2
}
alias int CTRLINFO;

//extern extern(C) const IID IID_IOleControl;
interface IOleControl : IUnknown {
public extern(Windows):
	HRESULT GetControlInfo(CONTROLINFO* pCI);
	HRESULT OnMnemonic(MSG* pMsg);
	HRESULT OnAmbientPropertyChange(DISPID dispID);
	HRESULT FreezeEvents(BOOL bFreeze);
}
mixin DEFINE_IID!(IOleControl, "B196B288-BAB4-101A-B69C-00AA00341D07");
alias IOleControl LPOLECONTROL;

struct POINTF {
	FLOAT x;
	FLOAT y;
}
alias POINTF* LPPOINTF;

enum {
	XFORMCOORDS_POSITION            = 0x1,
	XFORMCOORDS_SIZE                = 0x2,
	XFORMCOORDS_HIMETRICTOCONTAINER = 0x4,
	XFORMCOORDS_CONTAINERTOHIMETRIC = 0x8,
	XFORMCOORDS_EVENTCOMPAT         = 0x10
}
alias int XFORMCOORDS;

//extern extern(C) const IID IID_IOleControlSite;
interface IOleControlSite : IUnknown {
public extern(Windows):
	HRESULT OnControlInfoChanged();
	HRESULT LockInPlaceActive(BOOL fLock);
	HRESULT GetExtendedControl(IDispatch* ppDisp);
	HRESULT TransformCoords(POINTL* pPtlHimetric, POINTF* pPtfContainer, DWORD dwFlags);
	HRESULT TranslateAccelerator(MSG* pMsg, DWORD grfModifiers);
	HRESULT OnFocus(BOOL fGotFocus);
	HRESULT ShowPropertyFrame();
}
mixin DEFINE_IID!(IOleControlSite, "B196B289-BAB4-101A-B69C-00AA00341D07");
alias IOleControlSite* LPOLECONTROLSITE;

struct PROPPAGEINFO {
	ULONG cb;
	LPOLESTR pszTitle;
	SIZE size;
	LPOLESTR pszDocString;
	LPOLESTR pszHelpFile;
	DWORD dwHelpContext;
}
alias PROPPAGEINFO* LPPROPPAGEINFO;

//extern extern(C) const IID IID_IPropertyPage;
interface IPropertyPage : IUnknown {
public extern(Windows):
	HRESULT SetPageSite(IPropertyPageSite pPageSite);
	HRESULT Activate(HWND hWndParent, LPCRECT pRect, BOOL bModal);
	HRESULT Deactivate();
	HRESULT GetPageInfo(PROPPAGEINFO* pPageInfo);
	HRESULT SetObjects(ULONG cObjects, IUnknown* ppUnk);
	HRESULT Show(UINT nCmdShow);
	HRESULT Move(LPCRECT pRect);
	HRESULT IsPageDirty();
	HRESULT Apply();
	HRESULT Help(LPCOLESTR pszHelpDir);
	HRESULT TranslateAccelerator(MSG* pMsg);
}
mixin DEFINE_IID!(IPropertyPage, "B196B28D-BAB4-101A-B69C-00AA00341D07");
alias IPropertyPage* LPPROPERTYPAGE;

extern extern(C) const IID IID_IPropertyPage2;
interface IPropertyPage2 : IPropertyPage {
public extern(Windows):
	HRESULT EditProperty(DISPID dispID);
}
mixin DEFINE_IID!(IPropertyPage2, "01E44665-24AC-101B-84ED-08002B2EC713");
alias IPropertyPage2 LPPROPERTYPAGE2;

enum {
	PROPPAGESTATUS_DIRTY    = 0x1,
	PROPPAGESTATUS_VALIDATE = 0x2,
	PROPPAGESTATUS_CLEAN    = 0x4
}
alias int PROPPAGESTATUS;

//extern extern(C) const IID IID_IPropertyPageSite;
interface IPropertyPageSite : IUnknown {
public extern(Windows):
	HRESULT OnStatusChange(DWORD dwFlags);
	HRESULT GetLocaleID(LCID* pLocaleID);
	HRESULT GetPageContainer(IUnknown* ppUnk);
	HRESULT TranslateAccelerator(MSG* pMsg);
}
mixin DEFINE_IID!(IPropertyPageSite, "B196B28C-BAB4-101A-B69C-00AA00341D07");
alias IPropertyPageSite LPPROPERTYPAGESITE;

//extern extern(C) const IID IID_IPropertyNotifySink;
interface IPropertyNotifySink : IUnknown {
public extern(Windows):
	HRESULT OnChanged(DISPID dispID);
	HRESULT OnRequestEdit(DISPID dispID);
}
mixin DEFINE_IID!(IPropertyNotifySink, "9BFBBC02-EFF1-101A-84ED-00AA00341D07");
alias IPropertyNotifySink LPPROPERTYNOTIFYSINK;

struct CAUUID {
	ULONG cElems;
	GUID* pElems;
}
alias CAUUID* LPCAUUID;

//extern extern(C) const IID IID_ISpecifyPropertyPages;
interface ISpecifyPropertyPages : IUnknown {
public extern(Windows):
	HRESULT GetPages(CAUUID* pPages);
}
mixin DEFINE_IID!(ISpecifyPropertyPages, "B196B28B-BAB4-101A-B69C-00AA00341D07");
alias ISpecifyPropertyPages LPSPECIFYPROPERTYPAGES;

//extern extern(C) const IID IID_IPersistMemory;
interface IPersistMemory : IPersist {
public extern(Windows):
	HRESULT IsDirty();
	HRESULT Load(LPVOID pMem, ULONG cbSize);
	HRESULT Save(LPVOID pMem, BOOL fClearDirty, ULONG cbSize);
	HRESULT GetSizeMax( ULONG* pCbSize);
	HRESULT InitNew();
}
mixin DEFINE_IID!(IPersistMemory, "BD1AE5E0-A6AE-11CE-BD37-504200C10000");
alias IPersistMemory LPPERSISTMEMORY;

export extern(Windows){
HRESULT IPersistMemory_RemoteLoad_Proxy(IPersistMemory This, BYTE* pMem, ULONG cbSize);
	void IPersistMemory_RemoteLoad_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IPersistMemory_RemoteSave_Proxy(IPersistMemory This, BYTE* pMem, BOOL fClearDirty, ULONG cbSize);
	void IPersistMemory_RemoteSave_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_IPersistStreamInit;
interface IPersistStreamInit : IPersist {
public extern(Windows):
	HRESULT IsDirty();
	HRESULT Load(LPSTREAM pStm);
	HRESULT Save(LPSTREAM pStm, BOOL fClearDirty);
	HRESULT GetSizeMax(ULARGE_INTEGER* pCbSize);
	HRESULT InitNew();
}
mixin DEFINE_IID!(IPersistStreamInit, "7FD52380-4E07-101B-AE2D-08002B2EC713");
alias IPersistStreamInit LPPERSISTSTREAMINIT;

//extern extern(C) const IID IID_IPersistPropertyBag;
interface IPersistPropertyBag : IPersist {
public extern(Windows):
	HRESULT InitNew();
	HRESULT Load(IPropertyBag pPropBag, IErrorLog pErrorLog);
	HRESULT Save(IPropertyBag pPropBag, BOOL fClearDirty, BOOL fSaveAllProperties);
}
mixin DEFINE_IID!(IPersistPropertyBag, "37D84F60-42CB-11CE-8135-00AA004BB851");
alias IPersistPropertyBag LPPERSISTPROPERTYBAG;

//extern extern(C) const IID IID_ISimpleFrameSite;
interface ISimpleFrameSite : IUnknown {
public extern(Windows):
	HRESULT PreMessageFilter(HWND hWnd, UINT msg, WPARAM wp, LPARAM lp, LRESULT* plResult, DWORD* pdwCookie);
	HRESULT PostMessageFilter(HWND hWnd, UINT msg, WPARAM wp, LPARAM lp, LRESULT* plResult, DWORD dwCookie);
}
mixin DEFINE_IID!(ISimpleFrameSite, "742B0E01-14E6-101B-914E-00AA00300CAB");
alias ISimpleFrameSite LPSIMPLEFRAMESITE;

alias TEXTMETRICW TEXTMETRICOLE;
alias TEXTMETRICOLE LPTEXTMETRICOLE;

//extern extern(C) const IID IID_IFont;
interface IFont : IUnknown {
public extern(Windows):
	HRESULT get_Name(BSTR* pName);
	HRESULT put_Name(BSTR name);
	HRESULT get_Size(CY* pSize);
	HRESULT put_Size(CY size);
	HRESULT get_Bold(BOOL* pBold);
	HRESULT put_Bold(BOOL bold);
	HRESULT get_Italic(BOOL* pItalic);
	HRESULT put_Italic(BOOL italic);
	HRESULT get_Underline(BOOL* pUnderline);
	HRESULT put_Underline(BOOL underline);
	HRESULT get_Strikethrough(BOOL* pStrikethrough);
	HRESULT put_Strikethrough(BOOL strikethrough);
	HRESULT get_Weight(SHORT* pWeight);
	HRESULT put_Weight(SHORT weight);
	HRESULT get_Charset(SHORT* pCharset);
	HRESULT put_Charset(SHORT charset);
	HRESULT get_hFont(HFONT* phFont);
	HRESULT Clone(IFont* ppFont);
	HRESULT IsEqual(IFont pFontOther);
	HRESULT SetRatio(LONG cyLogical, LONG cyHimetric);
	HRESULT QueryTextMetrics(TEXTMETRICOLE* pTM);
	HRESULT AddRefHfont(HFONT hFont);
	HRESULT ReleaseHfont(HFONT hFont);
	HRESULT SetHdc(HDC hDC);
}
mixin DEFINE_IID!(IFont, "BEF6E002-A874-101A-8BBA-00AA00300CAB");
alias IFont LPFONT;

enum {
	PICTURE_SCALABLE    = 0x1,
	PICTURE_TRANSPARENT = 0x2
}
alias int PICTUREATTRIBUTES;

alias /*DEFINE_GUID("66504313-BE0F-101A-8BBB-00AA00300CAB")*/ UINT OLE_HANDLE;
alias /*DEFINE_GUID("66504306-BE0F-101A-8BBB-00AA00300CAB")*/ LONG OLE_XPOS_HIMETRIC;
alias /*DEFINE_GUID("66504307-BE0F-101A-8BBB-00AA00300CAB")*/ LONG OLE_YPOS_HIMETRIC;
alias /*DEFINE_GUID("66504308-BE0F-101A-8BBB-00AA00300CAB")*/ LONG OLE_XSIZE_HIMETRIC;
alias /*DEFINE_GUID("66504309-BE0F-101A-8BBB-00AA00300CAB")*/ LONG OLE_YSIZE_HIMETRIC;

//extern extern(C) const IID IID_IPicture;
interface IPicture : IUnknown {
public extern(Windows):
	HRESULT get_Handle(OLE_HANDLE* pHandle);
	HRESULT get_hPal(OLE_HANDLE* phPal);
	HRESULT get_Type(SHORT* pType);
	HRESULT get_Width(OLE_XSIZE_HIMETRIC* pWidth);
	HRESULT get_Height(OLE_YSIZE_HIMETRIC* pHeight);
	HRESULT Render(HDC hDC, LONG x, LONG y, LONG cx, LONG cy, OLE_XPOS_HIMETRIC xSrc, OLE_YPOS_HIMETRIC ySrc, OLE_XSIZE_HIMETRIC cxSrc, OLE_YSIZE_HIMETRIC cySrc, LPCRECT pRcWBounds);
	HRESULT set_hPal(OLE_HANDLE hPal);
	HRESULT get_CurDC(HDC* phDC);
	HRESULT SelectPicture(HDC hDCIn, HDC* phDCOut, OLE_HANDLE* phBmpOut);
	HRESULT get_KeepOriginalFormat(BOOL* pKeep);
	HRESULT put_KeepOriginalFormat(BOOL keep);
	HRESULT PictureChanged();
	HRESULT SaveAsFile(LPSTREAM pStream, BOOL fSaveMemCopy, LONG* pCbSize);
	HRESULT get_Attributes(DWORD* pDwAttr);
}
mixin DEFINE_IID!(IPicture, "7BF80980-BF32-101A-8BBB-00AA00300CAB");
alias IPicture LPPICTURE;

alias UINT_PTR HHANDLE;
//extern extern(C) const IID IID_IPicture2;
interface IPicture2 : IUnknown {
public extern(Windows):
	HRESULT get_Handle(HHANDLE* pHandle);
	HRESULT get_hPal(HHANDLE* phPal);
	HRESULT get_Type(SHORT* pType);
	HRESULT get_Width(OLE_XSIZE_HIMETRIC* pWidth);
	HRESULT get_Height(OLE_YSIZE_HIMETRIC* pHeight);
	HRESULT Render(HDC hDC, LONG x, LONG y, LONG cx, LONG cy, OLE_XPOS_HIMETRIC xSrc, OLE_YPOS_HIMETRIC ySrc, OLE_XSIZE_HIMETRIC cxSrc, OLE_YSIZE_HIMETRIC cySrc, LPCRECT pRcWBounds);
	HRESULT set_hPal(HHANDLE hPal);
	HRESULT get_CurDC(HDC* phDC);
	HRESULT SelectPicture(HDC hDCIn, HDC* phDCOut, HHANDLE* phBmpOut);
	HRESULT get_KeepOriginalFormat(BOOL* pKeep);
	HRESULT put_KeepOriginalFormat(BOOL keep);
	HRESULT PictureChanged();
	HRESULT SaveAsFile(LPSTREAM pStream, BOOL fSaveMemCopy, LONG* pCbSize);
	HRESULT get_Attributes(DWORD* pDwAttr);
}
mixin DEFINE_IID!(IPicture2, "F5185DD8-2012-4b0b-AAD9-F052C6BD482B");
alias IPicture2 LPPICTURE2;

//extern extern(C) const IID IID_IFontEventsDisp;
interface IFontEventsDisp : IDispatch {
public extern(Windows):
}
mixin DEFINE_IID!(IFontEventsDisp, "4EF6100A-AF88-11D0-9846-00C04FC29993");
alias IFontEventsDisp LPFONTEVENTS;

//extern extern(C) const IID IID_IFontDisp;
interface IFontDisp : IDispatch {
public extern(Windows):
}
mixin DEFINE_IID!(IFontDisp, "BEF6E003-A874-101A-8BBA-00AA00300CAB");
alias IFontDisp LPFONTDISP;

//extern extern(C) const IID IID_IPictureDisp;
interface IPictureDisp : IDispatch {
public extern(Windows):
}
mixin DEFINE_IID!(IPictureDisp, "7BF80981-BF32-101A-8BBB-00AA00300CAB");
alias IPictureDisp LPPICTUREDISP;

//extern extern(C) const IID IID_IOleInPlaceObjectWindowless;
interface IOleInPlaceObjectWindowless : IOleInPlaceObject {
public extern(Windows):
	HRESULT OnWindowMessage(UINT msg, WPARAM wParam, LPARAM lParam, LRESULT* plResult);
	HRESULT GetDropTarget(IDropTarget* ppDropTarget);
}
mixin DEFINE_IID!(IOleInPlaceObjectWindowless, "1C2056CC-5EF4-101B-8BC8-00AA003E3B29");
alias IOleInPlaceObjectWindowless LPOLEINPLACEOBJECTWINDOWLESS;

enum {
	ACTIVATE_WINDOWLESS = 1
}
alias int ACTIVATEFLAGS;

//extern extern(C) const IID IID_IOleInPlaceSiteEx;
interface IOleInPlaceSiteEx : IOleInPlaceSite {
public extern(Windows):
	HRESULT OnInPlaceActivateEx(BOOL* pfNoRedraw, DWORD dwFlags);
	HRESULT OnInPlaceDeactivateEx(BOOL fNoRedraw);
	HRESULT RequestUIActivate();
}
mixin DEFINE_IID!(IOleInPlaceSiteEx, "9C2CAD80-3424-11CF-B670-00AA004CD6D8");
alias IOleInPlaceSiteEx LPOLEINPLACESITEEX;

enum {
	OLEDC_NODRAW     = 0x1,
	OLEDC_PAINTBKGND = 0x2,
	OLEDC_OFFSCREEN  = 0x4
}
alias int OLEDCFLAGS;

//extern extern(C) const IID IID_IOleInPlaceSiteWindowless;
interface IOleInPlaceSiteWindowless : IOleInPlaceSiteEx {
public extern(Windows):
	HRESULT CanWindowlessActivate();
	HRESULT GetCapture();
	HRESULT SetCapture(BOOL fCapture);
	HRESULT GetFocus();
	HRESULT SetFocus(BOOL fFocus);
	HRESULT GetDC(LPCRECT pRect, DWORD grfFlags, HDC* phDC);
	HRESULT ReleaseDC(HDC hDC);
	HRESULT InvalidateRect(LPCRECT pRect, BOOL fErase);
	HRESULT InvalidateRgn(HRGN hRGN, BOOL fErase);
	HRESULT ScrollRect(INT dx, INT dy, LPCRECT pRectScroll, LPCRECT pRectClip);
	HRESULT AdjustRect(LPRECT prc);
	HRESULT OnDefWindowMessage(UINT msg, WPARAM wParam, LPARAM lParam, LRESULT* plResult);
}
mixin DEFINE_IID!(IOleInPlaceSiteWindowless, "922EADA0-3424-11CF-B670-00AA004CD6D8");
alias IOleInPlaceSiteWindowless LPOLEINPLACESITEWINDOWLESS;

enum {
	VIEWSTATUS_OPAQUE              = 1,
	VIEWSTATUS_SOLIDBKGND          = 2,
	VIEWSTATUS_DVASPECTOPAQUE      = 4,
	VIEWSTATUS_DVASPECTTRANSPARENT = 8,
	VIEWSTATUS_SURFACE             = 16,
	VIEWSTATUS_3DSURFACE           = 32
}
alias int VIEWSTATUS;

enum {
	HITRESULT_OUTSIDE     = 0,
	HITRESULT_TRANSPARENT = 1,
	HITRESULT_CLOSE       = 2,
	HITRESULT_HIT         = 3
}
alias int HITRESULT;

enum {
	DVASPECT_OPAQUE      = 16,
	DVASPECT_TRANSPARENT = 32
}
alias int DVASPECT2;

struct DVEXTENTINFO {
	ULONG cb;
	DWORD dwExtentMode;
	SIZEL sizelProposed;
}

enum {
	DVEXTENT_CONTENT  = 0,
	DVEXTENT_INTEGRAL = DVEXTENT_CONTENT + 1
}
alias int DVEXTENTMODE;

enum {
	DVASPECTINFOFLAG_CANOPTIMIZE = 1
}
alias int DVASPECTINFOFLAG;

struct DVASPECTINFO {
	ULONG cb;
	DWORD dwFlags;
}

//extern extern(C) const IID IID_IViewObjectEx;
interface IViewObjectEx : IViewObject2 {
public extern(Windows):
	HRESULT GetRect(DWORD dwAspect, LPRECTL pRect);
	HRESULT GetViewStatus(DWORD* pdwStatus);
	HRESULT QueryHitPoint(DWORD dwAspect, LPCRECT pRectBounds, POINT ptlLoc, LONG lCloseHint, DWORD* pHitResult);
	HRESULT QueryHitRect(DWORD dwAspect, LPCRECT pRectBounds, LPCRECT pRectLoc, LONG lCloseHint, DWORD* pHitResult);
	HRESULT GetNaturalExtent(DWORD dwAspect, LONG lindex, DVTARGETDEVICE* ptd, HDC hicTargetDev, DVEXTENTINFO* pExtentInfo, LPSIZEL pSizel);
}
mixin DEFINE_IID!(IViewObjectEx, "3AF24292-0C96-11CE-A0CF-00AA00600AB8");
alias IViewObjectEx LPVIEWOBJECTEX;

//extern extern(C) const IID IID_IOleUndoUnit;
interface IOleUndoUnit : IUnknown {
public extern(Windows):
	HRESULT Do(IOleUndoManager pUndoManager);
	HRESULT GetDescription(BSTR* pBstr);
	HRESULT GetUnitType(CLSID* pClsid, LONG* plID);
	HRESULT OnNextAdd();
}
mixin DEFINE_IID!(IOleUndoUnit, "894AD3B0-EF97-11CE-9BC9-00AA00608E01");
alias IOleUndoUnit LPOLEUNDOUNIT;

//extern extern(C) const IID IID_IOleParentUndoUnit;
interface IOleParentUndoUnit : IOleUndoUnit {
public extern(Windows):
	HRESULT Open(IOleParentUndoUnit pPUU);
	HRESULT Close(IOleParentUndoUnit pPUU, BOOL fCommit);
	HRESULT Add(IOleUndoUnit pUU);
	HRESULT FindUnit(IOleUndoUnit pUU);
	HRESULT GetParentState(DWORD* pdwState);
}
mixin DEFINE_IID!(IOleParentUndoUnit, "A1FAF330-EF97-11CE-9BC9-00AA00608E01");
alias IOleParentUndoUnit LPOLEPARENTUNDOUNIT;

//extern extern(C) const IID IID_IEnumOleUndoUnits;
interface IEnumOleUndoUnits : IUnknown {
public extern(Windows):
	HRESULT Next(ULONG cElt, IOleUndoUnit* rgElt, ULONG* pcEltFetched);
	HRESULT Skip(ULONG cElt);
	HRESULT Reset();
	HRESULT Clone(IEnumOleUndoUnits* ppEnum);
}
mixin DEFINE_IID!(IEnumOleUndoUnits, "B3E7C340-EF97-11CE-9BC9-00AA00608E01");
alias IEnumOleUndoUnits LPENUMOLEUNDOUNITS;

export extern(Windows){
	HRESULT IEnumOleUndoUnits_RemoteNext_Proxy(IEnumOleUndoUnits This, ULONG cElt, IOleUndoUnit* rgElt, ULONG* pcEltFetched);
	void IEnumOleUndoUnits_RemoteNext_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_IOleUndoManager;
interface IOleUndoManager : IUnknown {
public extern(Windows):
	HRESULT Open(IOleParentUndoUnit pPUU);
	HRESULT Close(IOleParentUndoUnit pPUU, BOOL fCommit);
	HRESULT Add(IOleUndoUnit pUU);
	HRESULT GetOpenParentState(DWORD* pdwState);
	HRESULT DiscardFrom(IOleUndoUnit pUU);
	HRESULT UndoTo(IOleUndoUnit pUU);
	HRESULT RedoTo(IOleUndoUnit pUU);
	HRESULT EnumUndoable(IEnumOleUndoUnits* ppEnum);
	HRESULT EnumRedoable(IEnumOleUndoUnits* ppEnum);
	HRESULT GetLastUndoDescription(BSTR* pBstr);
	HRESULT GetLastRedoDescription(BSTR* pBstr);
	HRESULT Enable(BOOL fEnable);
}
mixin DEFINE_IID!(IOleUndoManager, "D001F200-EF97-11CE-9BC9-00AA00608E01");
alias IOleUndoManager LPOLEUNDOMANAGER;

enum {
	POINTERINACTIVE_ACTIVATEONENTRY   = 1,
	POINTERINACTIVE_DEACTIVATEONLEAVE = 2,
	POINTERINACTIVE_ACTIVATEONDRAG    = 4
}
alias int POINTERINACTIVE;

//extern extern(C) const IID IID_IPointerInactive;
interface IPointerInactive : IUnknown {
public extern(Windows):
	HRESULT GetActivationPolicy(DWORD* pdwPolicy);
	HRESULT OnInactiveMouseMove(LPCRECT pRectBounds, LONG x, LONG y, DWORD grfKeyState);
	HRESULT OnInactiveSetCursor(LPCRECT pRectBounds, LONG x, LONG y, DWORD dwMouseMsg, BOOL fSetAlways);
}
mixin DEFINE_IID!(IPointerInactive, "55980BA0-35AA-11CF-B671-00AA004CD6D8");
alias IPointerInactive LPPOINTERINACTIVE;

//extern extern(C) const IID IID_IObjectWithSite;
interface IObjectWithSite : IUnknown {
public extern(Windows):
	HRESULT SetSite(IUnknown pUnkSite);
	HRESULT GetSite(REFIID riid, void** ppvSite);
}
mixin DEFINE_IID!(IObjectWithSite, "FC4801A3-2BA9-11CF-A229-00AA003D7352");
alias IObjectWithSite LPOBJECTWITHSITE;

struct CALPOLESTR {
	ULONG cElems;
	LPOLESTR* pElems;
}
alias CALPOLESTR* LPCALPOLESTR;

struct CADWORD {
	ULONG cElems;
	DWORD* pElems;
}
alias CADWORD* LPCADWORD;

//extern extern(C) const IID IID_IPerPropertyBrowsing;
interface IPerPropertyBrowsing : IUnknown {
public extern(Windows):
	HRESULT GetDisplayString(DISPID dispID, BSTR* pBstr);
	HRESULT MapPropertyToPage(DISPID dispID, CLSID* pClsid);
	HRESULT GetPredefinedStrings(DISPID dispID, CALPOLESTR* pCaStringsOut, CADWORD* pCaCookiesOut);
	HRESULT GetPredefinedValue(DISPID dispID, DWORD dwCookie, VARIANT* pVarOut);
}
mixin DEFINE_IID!(IPerPropertyBrowsing, "376BD3AA-3845-101B-84ED-08002B2EC713");
alias IPerPropertyBrowsing LPPERPROPERTYBROWSING;

enum {
	PROPBAG2_TYPE_UNDEFINED = 0,
	PROPBAG2_TYPE_DATA      = 1,
	PROPBAG2_TYPE_URL       = 2,
	PROPBAG2_TYPE_OBJECT    = 3,
	PROPBAG2_TYPE_STREAM    = 4,
	PROPBAG2_TYPE_STORAGE   = 5,
	PROPBAG2_TYPE_MONIKER   = 6
}
alias int PROPBAG2_TYPE;

struct PROPBAG2 {
	DWORD dwType;
	VARTYPE vt;
	CLIPFORMAT cfType;
	DWORD dwHint;
	LPOLESTR pstrName;
	CLSID clsid;
}

//extern extern(C) const IID IID_IPropertyBag2;
interface IPropertyBag2 : IUnknown {
public extern(Windows):
	HRESULT Read(ULONG cProperties, PROPBAG2* pPropBag, IErrorLog pErrLog, VARIANT* pvarValue, HRESULT* phrError);
	HRESULT Write(ULONG cProperties, PROPBAG2* pPropBag, VARIANT* pvarValue);
	HRESULT CountProperties(ULONG* pcProperties);
	HRESULT GetPropertyInfo(ULONG iProperty, ULONG cProperties, PROPBAG2* pPropBag, ULONG* pcProperties);
	HRESULT LoadObject(LPCOLESTR pstrName, DWORD dwHint, IUnknown pUnkObject, IErrorLog pErrLog);
}
mixin DEFINE_IID!(IPropertyBag2, "22F55882-280B-11d0-A8A9-00A0C90C2004");
alias IPropertyBag2 LPPROPERTYBAG2;

//extern extern(C) const IID IID_IPersistPropertyBag2;
interface IPersistPropertyBag2 : IPersist {
public extern(Windows):
	HRESULT InitNew();
	HRESULT Load(IPropertyBag2 pPropBag, IErrorLog pErrLog);
	HRESULT Save(IPropertyBag2 pPropBag, BOOL fClearDirty, BOOL fSaveAllProperties);
	HRESULT IsDirty();
}
mixin DEFINE_IID!(IPersistPropertyBag2, "22F55881-280B-11d0-A8A9-00A0C90C2004");
alias IPersistPropertyBag2 LPPERSISTPROPERTYBAG2;

//extern extern(C) const IID IID_IAdviseSinkEx;
interface IAdviseSinkEx : IAdviseSink {
public extern(Windows):
	void OnViewStatusChange(DWORD dwViewStatus);
}
mixin DEFINE_IID!(IAdviseSinkEx, "3AF24290-0C96-11CE-A0CF-00AA00600AB8");
alias IAdviseSinkEx LPADVISESINKEX;

export extern(Windows){
	HRESULT IAdviseSinkEx_RemoteOnViewStatusChange_Proxy(IAdviseSinkEx This, DWORD dwViewStatus);
	void IAdviseSinkEx_RemoteOnViewStatusChange_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

enum {
	QACONTAINER_SHOWHATCHING      = 0x1,
	QACONTAINER_SHOWGRABHANDLES   = 0x2,
	QACONTAINER_USERMODE          = 0x4,
	QACONTAINER_DISPLAYASDEFAULT  = 0x8,
	QACONTAINER_UIDEAD            = 0x10,
	QACONTAINER_AUTOCLIP          = 0x20,
	QACONTAINER_MESSAGEREFLECT    = 0x40,
	QACONTAINER_SUPPORTSMNEMONICS = 0x80
}
alias int QACONTAINERFLAGS;

alias /*DEFINE_GUID("66504301-BE0F-101A-8BBB-00AA00300CAB")*/ DWORD OLE_COLOR;

struct QACONTAINER {
	ULONG cbSize;
	IOleClientSite pClientSite;
	IAdviseSinkEx pAdviseSink;
	IPropertyNotifySink pPropertyNotifySink;
	IUnknown pUnkEventSink;
	DWORD dwAmbientFlags;
	OLE_COLOR colorFore;
	OLE_COLOR colorBack;
	IFont pFont;
	IOleUndoManager pUndoMgr;
	DWORD dwAppearance;
	LONG lcid;
	HPALETTE hpal;
	IBindHost pBindHost;
	IOleControlSite pOleControlSite;
	IServiceProvider pServiceProvider;
}

struct QACONTROL {
	ULONG cbSize;
	DWORD dwMiscStatus;
	DWORD dwViewStatus;
	DWORD dwEventCookie;
	DWORD dwPropNotifyCookie;
	DWORD dwPointerActivationPolicy;
}

//extern extern(C) const IID IID_IQuickActivate;
interface IQuickActivate : IUnknown {
public extern(Windows):
	HRESULT QuickActivate(QACONTAINER* pQaContainer, QACONTROL* pQaControl);
	HRESULT SetContentExtent(LPSIZEL pSizel);
	HRESULT GetContentExtent(LPSIZEL pSizel);
}
mixin DEFINE_IID!(IQuickActivate, "CF51ED10-62FE-11CF-BF86-00A0C9034836");
alias IQuickActivate LPQUICKACTIVATE;

export extern(Windows){
	HRESULT IQuickActivate_RemoteQuickActivate_Proxy(IQuickActivate This, QACONTAINER* pQaContainer, QACONTROL* pQaControl);
	void IQuickActivate_RemoteQuickActivate_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

export extern(Windows){
	uint BSTR_UserSize(uint*, uint, BSTR*);
	char* BSTR_UserMarshal(uint*, char*, BSTR*);
	char* BSTR_UserUnmarshal(uint*, char*, BSTR*);
	void BSTR_UserFree(uint*, BSTR*);

	uint CLIPFORMAT_UserSize(uint*, uint, CLIPFORMAT*);
	char* CLIPFORMAT_UserMarshal(uint*, char*, CLIPFORMAT*);
	char* CLIPFORMAT_UserUnmarshal(uint*, char*, CLIPFORMAT*);
	void CLIPFORMAT_UserFree(uint*, CLIPFORMAT*);

	uint HACCEL_UserSize(uint*, uint, HACCEL*);
	char* HACCEL_UserMarshal(uint*, char*, HACCEL*);
	char* HACCEL_UserUnmarshal(uint*, char*, HACCEL*);
	void HACCEL_UserFree(uint*, HACCEL*);

	uint HDC_UserSize(uint*, uint, HDC*);
	char* HDC_UserMarshal(uint*, char*, HDC*);
	char* HDC_UserUnmarshal(uint*, char*, HDC*);
	void HDC_UserFree(uint*, HDC*);

	uint HFONT_UserSize(uint*, uint, HFONT*);
	char* HFONT_UserMarshal(uint*, char*, HFONT*);
	char* HFONT_UserUnmarshal(uint*, char*, HFONT*);
	void HFONT_UserFree(uint*, HFONT*);

	uint HPALETTE_UserSize(uint*, uint, HPALETTE*);
	char* HPALETTE_UserMarshal(uint*, char*, HPALETTE*);
	char* HPALETTE_UserUnmarshal(uint*, char*, HPALETTE*);
	void HPALETTE_UserFree(uint*, HPALETTE*);

	uint HRGN_UserSize(uint*, uint, HRGN*);
	char* HRGN_UserMarshal(uint*, char*, HRGN*);
	char* HRGN_UserUnmarshal(uint*, char*, HRGN*);
	void HRGN_UserFree(uint*, HRGN*);

	uint HWND_UserSize(uint*, uint, HWND*);
	char* HWND_UserMarshal(uint*, char*, HWND*);
	char* HWND_UserUnmarshal(uint*, char*, HWND*);
	void HWND_UserFree(uint*, HWND*);

	uint VARIANT_UserSize(uint*, uint, VARIANT*);
	char* VARIANT_UserMarshal(uint*, char*, VARIANT*);
	char* VARIANT_UserUnmarshal(uint*, char*, VARIANT*);
	void VARIANT_UserFree(uint*, VARIANT*);

	uint BSTR_UserSize64(uint*, uint, BSTR*);
	char* BSTR_UserMarshal64(uint*, char*, BSTR*);
	char* BSTR_UserUnmarshal64(uint*, char*, BSTR*);
	void BSTR_UserFree64(uint*, BSTR*);

	uint CLIPFORMAT_UserSize64(uint*, uint, CLIPFORMAT*);
	char* CLIPFORMAT_UserMarshal64(uint*, char*, CLIPFORMAT*);
	char* CLIPFORMAT_UserUnmarshal64(uint*, char*, CLIPFORMAT*);
	void CLIPFORMAT_UserFree64(uint*, CLIPFORMAT*);

	uint HACCEL_UserSize64(uint*, uint, HACCEL*);
	char* HACCEL_UserMarshal64(uint*, char*, HACCEL*);
	char* HACCEL_UserUnmarshal64(uint*, char*, HACCEL*);
	void HACCEL_UserFree64(uint*, HACCEL*);

	uint HDC_UserSize64(uint*, uint, HDC*);
	char* HDC_UserMarshal64(uint*, char*, HDC*);
	char* HDC_UserUnmarshal64(uint*, char*, HDC*);
	void HDC_UserFree64(uint*, HDC*);

	uint HFONT_UserSize64(uint*, uint, HFONT*);
	char* HFONT_UserMarshal64(uint*, char*, HFONT*);
	char* HFONT_UserUnmarshal64(uint*, char*, HFONT*);
	void HFONT_UserFree64(uint*, HFONT*);

	uint HPALETTE_UserSize64(uint*, uint, HPALETTE*);
	char* HPALETTE_UserMarshal64(uint*, char*, HPALETTE*);
	char* HPALETTE_UserUnmarshal64(uint*, char*, HPALETTE*);
	void HPALETTE_UserFree64(uint*, HPALETTE*);

	uint HRGN_UserSize64(uint*, uint, HRGN*);
	char* HRGN_UserMarshal64(uint*, char*, HRGN*);
	char* HRGN_UserUnmarshal64(uint*, char*, HRGN*);
	void HRGN_UserFree64(uint*, HRGN*);

	uint HWND_UserSize64(uint*, uint, HWND*);
	char* HWND_UserMarshal64(uint*, char*, HWND*);
	char* HWND_UserUnmarshal64(uint*, char*, HWND*);
	void HWND_UserFree64(uint*, HWND*);

	uint VARIANT_UserSize64(uint*, uint, VARIANT*);
	char* VARIANT_UserMarshal64(uint*, char*, VARIANT*);
	char* VARIANT_UserUnmarshal64(uint*, char*, VARIANT*);
	void VARIANT_UserFree64(uint*, VARIANT*);
}

export extern(Windows){
	HRESULT IEnumConnections_Next_Proxy(IEnumConnections This, ULONG cConnections, LPCONNECTDATA rgcd, ULONG* pcFetched);
	HRESULT IEnumConnections_Next_Stub(IEnumConnections This, ULONG cConnections, LPCONNECTDATA rgcd, ULONG* pcFetched);
	HRESULT IEnumConnectionPoints_Next_Proxy(IEnumConnectionPoints This, ULONG cConnections, LPCONNECTIONPOINT* ppCP, ULONG* pcFetched);
	HRESULT IEnumConnectionPoints_Next_Stub(IEnumConnectionPoints This, ULONG cConnections, LPCONNECTIONPOINT* ppCP, ULONG* pcFetched);
	HRESULT IClassFactory2_CreateInstanceLic_Proxy(IClassFactory2 This, IUnknown pUnkOuter, IUnknown pUnkReserved, REFIID riid, BSTR bstrKey, PVOID* ppvObj);
	HRESULT IClassFactory2_CreateInstanceLic_Stub(IClassFactory2 This, REFIID riid, BSTR bstrKey, IUnknown* ppvObj);
	HRESULT IPersistMemory_Load_Proxy(IPersistMemory This, LPVOID pMem, ULONG cbSize);
	HRESULT IPersistMemory_Load_Stub(IPersistMemory This, BYTE* pMem, ULONG cbSize);
	HRESULT IPersistMemory_Save_Proxy(IPersistMemory This, LPVOID pMem, BOOL fClearDirty, ULONG cbSize);
	HRESULT IPersistMemory_Save_Stub(IPersistMemory This, BYTE* pMem, BOOL fClearDirty, ULONG cbSize);
	HRESULT IEnumOleUndoUnits_Next_Proxy(IEnumOleUndoUnits This, ULONG cElt, IOleUndoUnit* rgElt, ULONG* pcEltFetched);
	HRESULT IEnumOleUndoUnits_Next_Stub(IEnumOleUndoUnits This, ULONG cElt, IOleUndoUnit* rgElt, ULONG* pcEltFetched);
	void  IAdviseSinkEx_OnViewStatusChange_Proxy(IAdviseSinkEx This, DWORD dwViewStatus);
	HRESULT IAdviseSinkEx_OnViewStatusChange_Stub(IAdviseSinkEx This, DWORD dwViewStatus);
	HRESULT IQuickActivate_QuickActivate_Proxy(IQuickActivate This, QACONTAINER* pQaContainer, QACONTROL* pQaControl);
	HRESULT IQuickActivate_QuickActivate_Stub(IQuickActivate This, QACONTAINER* pQaContainer, QACONTROL* pQaControl);
}

} // extern(C)
