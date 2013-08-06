/** oleidl.d

Converted from 'oleidl.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.oleidl;


import c.windows.windef;
import c.windows.wtypes;
import c.windows.guiddef;
import c.windows.unknwn;
import c.windows.objidl;
import c.windows.rpcdcep;
import c.windows.winuser;
import c.windows.wingdi;


extern(C){

//extern extern(C) const IID IID_IOleAdviseHolder;
interface IOleAdviseHolder : IUnknown {
public extern(Windows):
	HRESULT Advise(IAdviseSink pAdvise, DWORD* pdwConnection);
	HRESULT Unadvise(DWORD dwConnection);
	HRESULT EnumAdvise(IEnumSTATDATA* ppenumAdvise);
	HRESULT SendOnRename(IMoniker pmk);
	HRESULT SendOnSave();
	HRESULT SendOnClose();
}
mixin DEFINE_IID!(IOleAdviseHolder, "00000111-0000-0000-C000-000000000046");
alias IOleAdviseHolder LPOLEADVISEHOLDER;

//extern extern(C) const IID IID_IOleCache;
interface IOleCache : IUnknown {
public extern(Windows):
	HRESULT Cache(FORMATETC* pformatetc, DWORD advf, DWORD* pdwConnection);
	HRESULT Uncache(DWORD dwConnection);
	HRESULT EnumCache(IEnumSTATDATA* ppenumSTATDATA);
	HRESULT InitCache(IDataObject pDataObject);
	HRESULT SetData(FORMATETC* pformatetc, STGMEDIUM* pmedium, BOOL fRelease);
}
mixin DEFINE_IID!(IOleCache, "0000011e-0000-0000-C000-000000000046");
alias IOleCache LPOLECACHE;

enum {
	UPDFCACHE_NODATACACHE          = 0x1,
	UPDFCACHE_ONSAVECACHE          = 0x2,
	UPDFCACHE_ONSTOPCACHE          = 0x4,
	UPDFCACHE_NORMALCACHE          = 0x8,
	UPDFCACHE_IFBLANK              = 0x10,
	UPDFCACHE_ONLYIFBLANK          = 0x80000000,
	UPDFCACHE_IFBLANKORONSAVECACHE = UPDFCACHE_IFBLANK | UPDFCACHE_ONSAVECACHE,
	UPDFCACHE_ALL                  = cast(DWORD)~UPDFCACHE_ONLYIFBLANK,
	UPDFCACHE_ALLBUTNODATACACHE    = UPDFCACHE_ALL & cast(DWORD)~UPDFCACHE_NODATACACHE,
}

enum {
	DISCARDCACHE_SAVEIFDIRTY = 0,
	DISCARDCACHE_NOSAVE      = 1
}
alias int DISCARDCACHE;

//extern extern(C) const IID IID_IOleCache2;
interface IOleCache2 : IOleCache {
public extern(Windows):
	HRESULT UpdateCache(LPDATAOBJECT pDataObject, DWORD grfUpdf, LPVOID pReserved);
	HRESULT DiscardCache(DWORD dwDiscardOptions);
}
mixin DEFINE_IID!(IOleCache2, "00000128-0000-0000-C000-000000000046");
alias IOleCache2 LPOLECACHE2;

export extern(Windows){
	HRESULT IOleCache2_RemoteUpdateCache_Proxy(IOleCache2 This, LPDATAOBJECT pDataObject, DWORD grfUpdf, LONG_PTR pReserved);
	void IOleCache2_RemoteUpdateCache_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_IOleCacheControl;
interface IOleCacheControl : IUnknown {
public extern(Windows):
	HRESULT OnRun(LPDATAOBJECT pDataObject);
	HRESULT OnStop();
}
mixin DEFINE_IID!(IOleCacheControl, "00000129-0000-0000-C000-000000000046");
alias IOleCacheControl LPOLECACHECONTROL;

//extern extern(C) const IID IID_IParseDisplayName;
interface IParseDisplayName : IUnknown {
public extern(Windows):
	HRESULT ParseDisplayName(IBindCtx pbc, LPOLESTR pszDisplayName, ULONG* pchEaten, IMoniker* ppmkOut);
}
mixin DEFINE_IID!(IParseDisplayName, "0000011a-0000-0000-C000-000000000046");
alias IParseDisplayName LPPARSEDISPLAYNAME;

//extern extern(C) const IID IID_IOleContainer;
interface IOleContainer : IParseDisplayName {
public extern(Windows):
	HRESULT EnumObjects(DWORD grfFlags, IEnumUnknown* ppenum);
	HRESULT LockContainer(BOOL fLock);
}
mixin DEFINE_IID!(IOleContainer, "0000011b-0000-0000-C000-000000000046");
alias IOleContainer LPOLECONTAINER;

//extern extern(C) const IID IID_IOleClientSite;
interface IOleClientSite : IUnknown {
public extern(Windows):
	HRESULT SaveObject();
	HRESULT GetMoniker(DWORD dwAssign, DWORD dwWhichMoniker, IMoniker* ppmk);
	HRESULT GetContainer(IOleContainer* ppContainer);
	HRESULT ShowObject();
	HRESULT OnShowWindow(BOOL fShow);
	HRESULT RequestNewObjectLayout();
}
mixin DEFINE_IID!(IOleClientSite, "00000118-0000-0000-C000-000000000046");
alias IOleClientSite LPOLECLIENTSITE;

enum {
	OLEGETMONIKER_ONLYIFTHERE = 1,
	OLEGETMONIKER_FORCEASSIGN = 2,
	OLEGETMONIKER_UNASSIGN    = 3,
	OLEGETMONIKER_TEMPFORUSER = 4
}
alias int OLEGETMONIKER;

enum {
	OLEWHICHMK_CONTAINER = 1,
	OLEWHICHMK_OBJREL    = 2,
	OLEWHICHMK_OBJFULL   = 3
}
alias int OLEWHICHMK;

enum {
	USERCLASSTYPE_FULL    = 1,
	USERCLASSTYPE_SHORT   = 2,
	USERCLASSTYPE_APPNAME = 3
}
alias int USERCLASSTYPE;

enum {
	OLEMISC_RECOMPOSEONRESIZE            = 0x1,
	OLEMISC_ONLYICONIC                   = 0x2,
	OLEMISC_INSERTNOTREPLACE             = 0x4,
	OLEMISC_STATIC                       = 0x8,
	OLEMISC_CANTLINKINSIDE               = 0x10,
	OLEMISC_CANLINKBYOLE1                = 0x20,
	OLEMISC_ISLINKOBJECT                 = 0x40,
	OLEMISC_INSIDEOUT                    = 0x80,
	OLEMISC_ACTIVATEWHENVISIBLE          = 0x100,
	OLEMISC_RENDERINGISDEVICEINDEPENDENT = 0x200,
	OLEMISC_INVISIBLEATRUNTIME           = 0x400,
	OLEMISC_ALWAYSRUN                    = 0x800,
	OLEMISC_ACTSLIKEBUTTON               = 0x1000,
	OLEMISC_ACTSLIKELABEL                = 0x2000,
	OLEMISC_NOUIACTIVATE                 = 0x4000,
	OLEMISC_ALIGNABLE                    = 0x8000,
	OLEMISC_SIMPLEFRAME                  = 0x10000,
	OLEMISC_SETCLIENTSITEFIRST           = 0x20000,
	OLEMISC_IMEMODE                      = 0x40000,
	OLEMISC_IGNOREACTIVATEWHENVISIBLE    = 0x80000,
	OLEMISC_WANTSTOMENUMERGE             = 0x100000,
	OLEMISC_SUPPORTSMULTILEVELUNDO       = 0x200000
}
alias int OLEMISC;

enum {
	OLECLOSE_SAVEIFDIRTY = 0,
	OLECLOSE_NOSAVE      = 1,
	OLECLOSE_PROMPTSAVE  = 2
}
alias int OLECLOSE;

//extern extern(C) const IID IID_IOleObject;
interface IOleObject : IUnknown {
public extern(Windows):
	HRESULT SetClientSite(IOleClientSite pClientSite);
	HRESULT GetClientSite(IOleClientSite* ppClientSite);
	HRESULT SetHostNames(LPCOLESTR szContainerApp, LPCOLESTR szContainerObj);
	HRESULT Close(DWORD dwSaveOption);
	HRESULT SetMoniker(DWORD dwWhichMoniker, IMoniker pmk);
	HRESULT GetMoniker(DWORD dwAssign, DWORD dwWhichMoniker, IMoniker* ppmk);
	HRESULT InitFromData(IDataObject pDataObject, BOOL fCreation, DWORD dwReserved);
	HRESULT GetClipboardData(DWORD dwReserved, IDataObject* ppDataObject);
	HRESULT DoVerb(LONG iVerb, LPMSG lpmsg, IOleClientSite pActiveSite, LONG lindex, HWND hwndParent, LPCRECT lprcPosRect);
	HRESULT EnumVerbs(IEnumOLEVERB* ppEnumOleVerb);
	HRESULT Update();
	HRESULT IsUpToDate();
	HRESULT GetUserClassID(CLSID* pClsid);
	HRESULT GetUserType(DWORD dwFormOfType, LPOLESTR* pszUserType);
	HRESULT SetExtent(DWORD dwDrawAspect, SIZEL* psizel);
	HRESULT GetExtent(DWORD dwDrawAspect, SIZEL* psizel);
	HRESULT Advise(IAdviseSink pAdvSink, DWORD* pdwConnection);
	HRESULT Unadvise(DWORD dwConnection);
	HRESULT EnumAdvise(IEnumSTATDATA* ppenumAdvise);
	HRESULT GetMiscStatus(DWORD dwAspect, DWORD* pdwStatus);
	HRESULT SetColorScheme(LOGPALETTE* pLogpal);
}
mixin DEFINE_IID!(IOleObject, "00000112-0000-0000-C000-000000000046");
alias IOleObject LPOLEOBJECT;

enum {
	OLERENDER_NONE   = 0,
	OLERENDER_DRAW   = 1,
	OLERENDER_FORMAT = 2,
	OLERENDER_ASIS   = 3
}
alias int OLERENDER;
alias OLERENDER* LPOLERENDER;

struct OBJECTDESCRIPTOR {
	ULONG cbSize;
	CLSID clsid;
	DWORD dwDrawAspect;
	SIZEL sizel;
	POINTL pointl;
	DWORD dwStatus;
	DWORD dwFullUserTypeName;
	DWORD dwSrcOfCopy;
}
alias OBJECTDESCRIPTOR* POBJECTDESCRIPTOR;
alias OBJECTDESCRIPTOR* LPOBJECTDESCRIPTOR;
alias OBJECTDESCRIPTOR LINKSRCDESCRIPTOR;
alias OBJECTDESCRIPTOR* PLINKSRCDESCRIPTOR;
alias OBJECTDESCRIPTOR* LPLINKSRCDESCRIPTOR;

//extern extern(C) const IID IID_IOleWindow;
interface IOleWindow : IUnknown {
public extern(Windows):
	HRESULT GetWindow(HWND* phwnd);
	HRESULT ContextSensitiveHelp(BOOL fEnterMode);
}
mixin DEFINE_IID!(IOleWindow, "00000114-0000-0000-C000-000000000046");
alias IOleWindow LPOLEWINDOW;

enum {
	OLEUPDATE_ALWAYS = 1,
	OLEUPDATE_ONCALL = 3
}
alias int OLEUPDATE;
alias OLEUPDATE* LPOLEUPDATE;
alias OLEUPDATE* POLEUPDATE;

enum {
	OLELINKBIND_EVENIFCLASSDIFF = 1
}
alias int OLELINKBIND;

//extern extern(C) const IID IID_IOleLink;
interface IOleLink : IUnknown {
public extern(Windows):
	HRESULT SetUpdateOptions(DWORD dwUpdateOpt);
	HRESULT GetUpdateOptions(DWORD* pdwUpdateOpt);
	HRESULT SetSourceMoniker(IMoniker pmk, REFCLSID rclsid);
	HRESULT GetSourceMoniker(IMoniker* ppmk);
	HRESULT SetSourceDisplayName(LPCOLESTR pszStatusText);
	HRESULT GetSourceDisplayName(LPOLESTR* ppszDisplayName);
	HRESULT BindToSource(DWORD bindflags, IBindCtx pbc);
	HRESULT BindIfRunning();
	HRESULT GetBoundSource(IUnknown* ppunk);
	HRESULT UnbindSource();
	HRESULT Update(IBindCtx pbc);
}
mixin DEFINE_IID!(IOleLink, "0000011d-0000-0000-C000-000000000046");
alias IOleLink LPOLELINK;

enum {
	BINDSPEED_INDEFINITE = 1,
	BINDSPEED_MODERATE   = 2,
	BINDSPEED_IMMEDIATE  = 3
}
alias int BINDSPEED;

enum {
	OLECONTF_EMBEDDINGS    = 1,
	OLECONTF_LINKS         = 2,
	OLECONTF_OTHERS        = 4,
	OLECONTF_ONLYUSER      = 8,
	OLECONTF_ONLYIFRUNNING = 16
}
alias int OLECONTF;

//extern extern(C) const IID IID_IOleItemContainer;
interface IOleItemContainer : IOleContainer {
public extern(Windows):
	HRESULT GetObject(LPOLESTR pszItem, DWORD dwSpeedNeeded, IBindCtx pbc, REFIID riid, void** ppvObject);
	HRESULT GetObjectStorage(LPOLESTR pszItem, IBindCtx pbc, REFIID riid, void** ppvStorage);
	HRESULT IsRunning(LPOLESTR pszItem);
}
mixin DEFINE_IID!(IOleItemContainer, "0000011c-0000-0000-C000-000000000046");
alias IOleItemContainer LPOLEITEMCONTAINER;

alias RECT BORDERWIDTHS;
alias LPRECT LPBORDERWIDTHS;
alias LPCRECT LPCBORDERWIDTHS;

//extern extern(C) const IID IID_IOleInPlaceUIWindow;
interface IOleInPlaceUIWindow : IOleWindow {
public extern(Windows):
	HRESULT GetBorder(LPRECT lprectBorder);
	HRESULT RequestBorderSpace(LPCBORDERWIDTHS pborderwidths);
	HRESULT SetBorderSpace(LPCBORDERWIDTHS pborderwidths);
	HRESULT SetActiveObject(IOleInPlaceActiveObject pActiveObject, LPCOLESTR pszObjName);
}
mixin DEFINE_IID!(IOleInPlaceUIWindow, "00000115-0000-0000-C000-000000000046");
alias IOleInPlaceUIWindow LPOLEINPLACEUIWINDOW;

//extern extern(C) const IID IID_IOleInPlaceActiveObject;
interface IOleInPlaceActiveObject : IOleWindow {
public extern(Windows):
	HRESULT TranslateAccelerator(LPMSG lpmsg);
	HRESULT OnFrameWindowActivate(BOOL fActivate);
	HRESULT OnDocWindowActivate(BOOL fActivate);
	HRESULT ResizeBorder(LPCRECT prcBorder, IOleInPlaceUIWindow pUIWindow, BOOL fFrameWindow);
	HRESULT EnableModeless(BOOL fEnable);
}
mixin DEFINE_IID!(IOleInPlaceActiveObject, "00000117-0000-0000-C000-000000000046");
alias IOleInPlaceActiveObject LPOLEINPLACEACTIVEOBJECT;

export extern(Windows){
	HRESULT IOleInPlaceActiveObject_RemoteTranslateAccelerator_Proxy(IOleInPlaceActiveObject This);
	void IOleInPlaceActiveObject_RemoteTranslateAccelerator_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IOleInPlaceActiveObject_RemoteResizeBorder_Proxy(IOleInPlaceActiveObject This, LPCRECT prcBorder, REFIID riid, IOleInPlaceUIWindow pUIWindow, BOOL fFrameWindow);
	void IOleInPlaceActiveObject_RemoteResizeBorder_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

struct OLEINPLACEFRAMEINFO {
	UINT cb;
	BOOL fMDIApp;
	HWND hwndFrame;
	HACCEL haccel;
	UINT cAccelEntries;
}
alias OLEINPLACEFRAMEINFO* LPOLEINPLACEFRAMEINFO;

struct OLEMENUGROUPWIDTHS {
	LONG[6] width;
}
alias OLEMENUGROUPWIDTHS* LPOLEMENUGROUPWIDTHS;

enum HOLEMENU : HGLOBAL {init = (HGLOBAL).init}

//extern extern(C) const IID IID_IOleInPlaceFrame;
interface IOleInPlaceFrame : IOleInPlaceUIWindow {
public extern(Windows):
	HRESULT InsertMenus(HMENU hmenuShared, LPOLEMENUGROUPWIDTHS lpMenuWidths);
	HRESULT SetMenu(HMENU hmenuShared, HOLEMENU holemenu, HWND hwndActiveObject);
	HRESULT RemoveMenus(HMENU hmenuShared);
	HRESULT SetStatusText(LPCOLESTR pszStatusText);
	HRESULT EnableModeless(BOOL fEnable);
	HRESULT TranslateAccelerator(LPMSG lpmsg, WORD wID);
}
mixin DEFINE_IID!(IOleInPlaceFrame, "00000116-0000-0000-C000-000000000046");
alias IOleInPlaceFrame LPOLEINPLACEFRAME;

//extern extern(C) const IID IID_IOleInPlaceObject;
interface IOleInPlaceObject : IOleWindow {
public extern(Windows):
	HRESULT InPlaceDeactivate();
	HRESULT UIDeactivate();
	HRESULT SetObjectRects(LPCRECT lprcPosRect, LPCRECT lprcClipRect);
	HRESULT ReactivateAndUndo();
}
mixin DEFINE_IID!(IOleInPlaceObject, "00000113-0000-0000-C000-000000000046");
alias IOleInPlaceObject LPOLEINPLACEOBJECT;

//extern extern(C) const IID IID_IOleInPlaceSite;
interface IOleInPlaceSite : IOleWindow {
public extern(Windows):
	HRESULT CanInPlaceActivate();
	HRESULT OnInPlaceActivate();
	HRESULT OnUIActivate();
	HRESULT GetWindowContext(IOleInPlaceFrame* ppFrame, IOleInPlaceUIWindow* ppDoc, LPRECT lprcPosRect, LPRECT lprcClipRect, LPOLEINPLACEFRAMEINFO lpFrameInfo);
	HRESULT Scroll(SIZE scrollExtant);
	HRESULT OnUIDeactivate(BOOL fUndoable);
	HRESULT OnInPlaceDeactivate();
	HRESULT DiscardUndoState();
	HRESULT DeactivateAndUndo();
	HRESULT OnPosRectChange(LPCRECT lprcPosRect);
}
mixin DEFINE_IID!(IOleInPlaceSite, "00000119-0000-0000-C000-000000000046");
alias IOleInPlaceSite LPOLEINPLACESITE;

//extern extern(C) const IID IID_IContinue;
interface IContinue : IUnknown {
public extern(Windows):
	HRESULT FContinue();
}
mixin DEFINE_IID!(IContinue, "0000012a-0000-0000-C000-000000000046");

//extern extern(C) const IID IID_IViewObject;
interface IViewObject : IUnknown {
public extern(Windows):
	HRESULT Draw(DWORD dwDrawAspect, LONG lindex, void* pvAspect, DVTARGETDEVICE* ptd, HDC hdcTargetDev, HDC hdcDraw, LPCRECTL lprcBounds, LPCRECTL lprcWBounds, BOOL function(ULONG_PTR dwContinue) pfnContinue, ULONG_PTR dwContinue);
	HRESULT GetColorSet(DWORD dwDrawAspect, LONG lindex, void* pvAspect, DVTARGETDEVICE* ptd, HDC hicTargetDev, LOGPALETTE** ppColorSet);
	HRESULT Freeze(DWORD dwDrawAspect, LONG lindex, void* pvAspect, DWORD* pdwFreeze);
	HRESULT Unfreeze(DWORD dwFreeze);
	HRESULT SetAdvise(DWORD aspects, DWORD advf, IAdviseSink pAdvSink);
	HRESULT GetAdvise(DWORD* pAspects, DWORD* pAdvf, IAdviseSink* ppAdvSink);
}
mixin DEFINE_IID!(IViewObject, "0000010d-0000-0000-C000-000000000046");
alias IViewObject LPVIEWOBJECT;

export extern(Windows){
	HRESULT IViewObject_RemoteDraw_Proxy(IViewObject This, DWORD dwDrawAspect, LONG lindex, ULONG_PTR pvAspect, DVTARGETDEVICE* ptd, HDC hdcTargetDev, HDC hdcDraw, LPCRECTL lprcBounds, LPCRECTL lprcWBounds, IContinue pContinue);
	void IViewObject_RemoteDraw_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IViewObject_RemoteGetColorSet_Proxy(IViewObject This, DWORD dwDrawAspect, LONG lindex, ULONG_PTR pvAspect, DVTARGETDEVICE* ptd, ULONG_PTR hicTargetDev, LOGPALETTE** ppColorSet);
	void IViewObject_RemoteGetColorSet_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IViewObject_RemoteFreeze_Proxy(IViewObject This, DWORD dwDrawAspect, LONG lindex, ULONG_PTR pvAspect, DWORD* pdwFreeze);
	void IViewObject_RemoteFreeze_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IViewObject_RemoteGetAdvise_Proxy(IViewObject This, DWORD* pAspects, DWORD* pAdvf, IAdviseSink* ppAdvSink);
	void IViewObject_RemoteGetAdvise_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_IViewObject2;
interface IViewObject2 : IViewObject {
public extern(Windows):
	HRESULT GetExtent(DWORD dwDrawAspect, LONG lindex, DVTARGETDEVICE* ptd, LPSIZEL lpsizel);
}
mixin DEFINE_IID!(IViewObject2, "00000127-0000-0000-C000-000000000046");
alias IViewObject2 LPVIEWOBJECT2;

//extern extern(C) const IID IID_IDropSource;
interface IDropSource : IUnknown {
public extern(Windows):
	HRESULT QueryContinueDrag(BOOL fEscapePressed, DWORD grfKeyState);
	HRESULT GiveFeedback(DWORD dwEffect);
}
mixin DEFINE_IID!(IDropSource, "00000121-0000-0000-C000-000000000046");
alias IDropSource LPDROPSOURCE;

enum {
	MK_ALT               = 0x20,
	DROPEFFECT_NONE      = 0,
	DROPEFFECT_COPY      = 1,
	DROPEFFECT_MOVE      = 2,
	DROPEFFECT_LINK      = 4,
	DROPEFFECT_SCROLL    = 0x80000000,
	DD_DEFSCROLLINSET    = 11,
	DD_DEFSCROLLDELAY    = 50,
	DD_DEFSCROLLINTERVAL = 50,
	DD_DEFDRAGDELAY      = 200,
	DD_DEFDRAGMINDIST    = 2,
}

//extern extern(C) const IID IID_IDropTarget;
interface IDropTarget : IUnknown {
public extern(Windows):
	HRESULT DragEnter(IDataObject pDataObj, DWORD grfKeyState, POINTL pt, DWORD* pdwEffect);
	HRESULT DragOver(DWORD grfKeyState, POINTL pt, DWORD* pdwEffect);
	HRESULT DragLeave();
	HRESULT Drop(IDataObject pDataObj, DWORD grfKeyState, POINTL pt, DWORD* pdwEffect);
}
mixin DEFINE_IID!(IDropTarget, "00000122-0000-0000-C000-000000000046");
alias IDropTarget LPDROPTARGET;

//extern extern(C) const IID IID_IDropSourceNotify;
interface IDropSourceNotify : IUnknown {
public extern(Windows):
	HRESULT DragEnterTarget(HWND hwndTarget);
	HRESULT DragLeaveTarget();
}
mixin DEFINE_IID!(IDropSourceNotify, "0000012B-0000-0000-C000-000000000046");

struct OLEVERB {
	LONG lVerb;
	LPOLESTR lpszVerbName;
	DWORD fuFlags;
	DWORD grfAttribs;
}
alias OLEVERB* LPOLEVERB;

enum {
	OLEVERBATTRIB_NEVERDIRTIES    = 1,
	OLEVERBATTRIB_ONCONTAINERMENU = 2
}
alias int OLEVERBATTRIB;

//extern extern(C) const IID IID_IEnumOLEVERB;
interface IEnumOLEVERB : IUnknown {
public extern(Windows):
	HRESULT Next(ULONG celt, LPOLEVERB rgelt, ULONG* pceltFetched);
	HRESULT Skip(ULONG celt);
	HRESULT Reset();
	HRESULT Clone(IEnumOLEVERB* ppenum);
}
mixin DEFINE_IID!(IEnumOLEVERB, "00000104-0000-0000-C000-000000000046");
alias IEnumOLEVERB LPENUMOLEVERB;

export extern(Windows){
	HRESULT IEnumOLEVERB_RemoteNext_Proxy(IEnumOLEVERB This, ULONG celt, LPOLEVERB rgelt, ULONG* pceltFetched);
	void IEnumOLEVERB_RemoteNext_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

export extern(Windows){
	ULONG CLIPFORMAT_UserSize(ULONG*, ULONG, CLIPFORMAT*);
	BYTE* CLIPFORMAT_UserMarshal(ULONG*, BYTE*, CLIPFORMAT*);
	BYTE* CLIPFORMAT_UserUnmarshal(LONG*, BYTE*, CLIPFORMAT*);
	void CLIPFORMAT_UserFree(ULONG*, CLIPFORMAT*);

	ULONG HACCEL_UserSize(ULONG*, ULONG, HACCEL*);
	BYTE* HACCEL_UserMarshal(ULONG*, BYTE*, HACCEL*);
	BYTE* HACCEL_UserUnmarshal(ULONG*, BYTE*, HACCEL*);
	void HACCEL_UserFree(ULONG*, HACCEL*);

	ULONG HDC_UserSize(ULONG*, ULONG, HDC*);
	BYTE* HDC_UserMarshal(ULONG*, BYTE*, HDC*);
	BYTE* HDC_UserUnmarshal(ULONG*, BYTE*, HDC*);
	void HDC_UserFree(ULONG*, HDC*);

	ULONG HGLOBAL_UserSize(ULONG*, ULONG, HGLOBAL*);
	BYTE* HGLOBAL_UserMarshal(ULONG*, BYTE*, HGLOBAL*);
	BYTE* HGLOBAL_UserUnmarshal(ULONG*, BYTE*, HGLOBAL*);
	void HGLOBAL_UserFree(ULONG*, HGLOBAL*);

	ULONG HMENU_UserSize(ULONG*, ULONG, HMENU*);
	BYTE* HMENU_UserMarshal(ULONG*, BYTE*, HMENU*);
	BYTE* HMENU_UserUnmarshal(ULONG*, BYTE*, HMENU*);
	void HMENU_UserFree(ULONG*, HMENU*);

	ULONG HWND_UserSize(ULONG*, ULONG, HWND*);
	BYTE* HWND_UserMarshal(ULONG*, BYTE*, HWND*);
	BYTE* HWND_UserUnmarshal(ULONG*, BYTE*, HWND*);
	void HWND_UserFree(ULONG*, HWND*);

	ULONG STGMEDIUM_UserSize(ULONG*, ULONG, STGMEDIUM*);
	BYTE* STGMEDIUM_UserMarshal(ULONG*, BYTE*, STGMEDIUM*);
	BYTE* STGMEDIUM_UserUnmarshal(ULONG*, BYTE*, STGMEDIUM*);
	void STGMEDIUM_UserFree(ULONG*, STGMEDIUM*);

	ULONG CLIPFORMAT_UserSize64(ULONG*, ULONG, CLIPFORMAT*);
	BYTE* CLIPFORMAT_UserMarshal64(ULONG*, BYTE*, CLIPFORMAT*);
	BYTE* CLIPFORMAT_UserUnmarshal64(ULONG*, BYTE*, CLIPFORMAT*);
	void CLIPFORMAT_UserFree64(ULONG*, CLIPFORMAT*);

	ULONG HACCEL_UserSize64(ULONG*, ULONG, HACCEL*);
	BYTE* HACCEL_UserMarshal64(ULONG*, BYTE*, HACCEL*);
	BYTE* HACCEL_UserUnmarshal64(ULONG*, BYTE*, HACCEL*);
	void HACCEL_UserFree64(ULONG*, HACCEL*);

	ULONG HDC_UserSize64(ULONG*, ULONG, HDC*);
	BYTE* HDC_UserMarshal64(ULONG*, BYTE*, HDC*);
	BYTE* HDC_UserUnmarshal64(ULONG*, BYTE*, HDC*);
	void HDC_UserFree64(ULONG*, HDC*);

	ULONG HGLOBAL_UserSize64(ULONG*, ULONG, HGLOBAL*);
	BYTE* HGLOBAL_UserMarshal64(ULONG*, BYTE*, HGLOBAL*);
	BYTE* HGLOBAL_UserUnmarshal64(ULONG*, BYTE*, HGLOBAL*);
	void HGLOBAL_UserFree64(ULONG*, HGLOBAL*);

	ULONG HMENU_UserSize64(ULONG*, ULONG, HMENU*);
	BYTE* HMENU_UserMarshal64(ULONG*, BYTE*, HMENU*);
	BYTE* HMENU_UserUnmarshal64(ULONG*, BYTE*, HMENU*);
	void HMENU_UserFree64(ULONG*, HMENU*);

	ULONG HWND_UserSize64(ULONG*, ULONG, HWND*);
	BYTE* HWND_UserMarshal64(ULONG*, BYTE*, HWND*);
	BYTE* HWND_UserUnmarshal64(ULONG*, BYTE*, HWND*);
	void HWND_UserFree64(ULONG*, HWND*);

	ULONG STGMEDIUM_UserSize64(ULONG*, ULONG, STGMEDIUM*);
	BYTE* STGMEDIUM_UserMarshal64(ULONG*, BYTE*, STGMEDIUM*);
	BYTE* STGMEDIUM_UserUnmarshal64(ULONG*, BYTE*, STGMEDIUM*);
	void STGMEDIUM_UserFree64(ULONG*, STGMEDIUM*);
}

export extern(Windows){
	HRESULT IOleCache2_UpdateCache_Proxy(IOleCache2 This, LPDATAOBJECT pDataObject, DWORD grfUpdf, LPVOID pReserved);
	HRESULT IOleCache2_UpdateCache_Stub(IOleCache2 This, LPDATAOBJECT pDataObject, DWORD grfUpdf, LONG_PTR pReserved);
	HRESULT IOleInPlaceActiveObject_TranslateAccelerator_Proxy(IOleInPlaceActiveObject This, LPMSG lpmsg);
	HRESULT IOleInPlaceActiveObject_TranslateAccelerator_Stub(IOleInPlaceActiveObject This);
	HRESULT IOleInPlaceActiveObject_ResizeBorder_Proxy(IOleInPlaceActiveObject This, LPCRECT prcBorder, IOleInPlaceUIWindow pUIWindow, BOOL fFrameWindow);
	HRESULT IOleInPlaceActiveObject_ResizeBorder_Stub(IOleInPlaceActiveObject This, LPCRECT prcBorder, REFIID riid, IOleInPlaceUIWindow pUIWindow, BOOL fFrameWindow);
	HRESULT IViewObject_Draw_Proxy(IViewObject This, DWORD dwDrawAspect, LONG lindex, void* pvAspect, DVTARGETDEVICE* ptd, HDC hdcTargetDev, HDC hdcDraw, LPCRECTL lprcBounds, LPCRECTL lprcWBounds, BOOL function(ULONG_PTR dwContinue) pfnContinue, ULONG_PTR dwContinue);
	HRESULT IViewObject_Draw_Stub(IViewObject This, DWORD dwDrawAspect, LONG lindex, ULONG_PTR pvAspect, DVTARGETDEVICE* ptd, HDC hdcTargetDev, HDC hdcDraw, LPCRECTL lprcBounds, LPCRECTL lprcWBounds, IContinue pContinue);
	HRESULT IViewObject_GetColorSet_Proxy(IViewObject This, DWORD dwDrawAspect, LONG lindex, void* pvAspect, DVTARGETDEVICE* ptd, HDC hicTargetDev, LOGPALETTE** ppColorSet);
	HRESULT IViewObject_GetColorSet_Stub(IViewObject This, DWORD dwDrawAspect, LONG lindex, ULONG_PTR pvAspect, DVTARGETDEVICE* ptd, ULONG_PTR hicTargetDev, LOGPALETTE** ppColorSet);
	HRESULT IViewObject_Freeze_Proxy(IViewObject This, DWORD dwDrawAspect, LONG lindex, void* pvAspect, DWORD* pdwFreeze);
	HRESULT IViewObject_Freeze_Stub(IViewObject This, DWORD dwDrawAspect, LONG lindex, ULONG_PTR pvAspect, DWORD* pdwFreeze);
	HRESULT IViewObject_GetAdvise_Proxy(IViewObject This, DWORD* pAspects, DWORD* pAdvf, IAdviseSink* ppAdvSink);
	HRESULT IViewObject_GetAdvise_Stub(IViewObject This, DWORD* pAspects, DWORD* pAdvf, IAdviseSink* ppAdvSink);
	HRESULT IEnumOLEVERB_Next_Proxy(IEnumOLEVERB This, ULONG celt, LPOLEVERB rgelt, ULONG* pceltFetched);
	HRESULT IEnumOLEVERB_Next_Stub(IEnumOLEVERB This, ULONG celt, LPOLEVERB rgelt, ULONG* pceltFetched);
}

} // extern(C)


