/** comcat.d

Converted from 'comcat.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.comcat;


import c.windows.windef;
import c.windows.wtypes;
import c.windows.guiddef;
import c.windows.unknwn;
import c.windows.objidl;
import c.windows.rpcdcep;


extern(C){

extern extern(C) const CLSID CLSID_StdComponentCategoriesMgr;

alias GUID CATID;
alias REFGUID REFCATID;
alias LPENUMGUID LPENUMCLSID;
alias GUID_NULL CATID_NULL;
alias IsEqualGUID IsEqualCATID;

extern extern(C) const CATID CATID_Insertable;
extern extern(C) const CATID CATID_Control;
extern extern(C) const CATID CATID_Programmable;
extern extern(C) const CATID CATID_IsShortcut;
extern extern(C) const CATID CATID_NeverShowExt;
extern extern(C) const CATID CATID_DocObject;
extern extern(C) const CATID CATID_Printable;
extern extern(C) const CATID CATID_RequiresDataPathHost;
extern extern(C) const CATID CATID_PersistsToMoniker;
extern extern(C) const CATID CATID_PersistsToStorage;
extern extern(C) const CATID CATID_PersistsToStreamInit;
extern extern(C) const CATID CATID_PersistsToStream;
extern extern(C) const CATID CATID_PersistsToMemory;
extern extern(C) const CATID CATID_PersistsToFile;
extern extern(C) const CATID CATID_PersistsToPropertyBag;
extern extern(C) const CATID CATID_InternetAware;
extern extern(C) const CATID CATID_DesignTimeUIActivatableControl;

//extern extern(C) const IID IID_IEnumGUID;
interface IEnumGUID : IUnknown {
public extern(Windows):
	HRESULT Next(ULONG celt, GUID* rgelt, ULONG* pceltFetched);
	HRESULT Skip(ULONG celt);
	HRESULT Reset();
	HRESULT Clone(IEnumGUID* ppenum);
}
mixin DEFINE_IID!(IEnumGUID, "0002E000-0000-0000-C000-000000000046");
alias IEnumGUID LPENUMGUID;
alias IEnumGUID IEnumCLSID;
alias IEnumGUID IEnumCATID;
alias IID_IEnumGUID IID_IEnumCLSID;
alias IID_IEnumGUID IID_IEnumCATID;

HRESULT IEnumGUID_RemoteNext_Proxy(IEnumGUID This, ULONG celt, GUID* rgelt, ULONG* pceltFetched);
void IEnumGUID_RemoteNext_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);

struct CATEGORYINFO {
	CATID catid;
	LCID lcid;
	OLECHAR[128] szDescription;
}
alias CATEGORYINFO* LPCATEGORYINFO;

//extern extern(C) const IID IID_IEnumCATEGORYINFO;
interface IEnumCATEGORYINFO : IUnknown {
public extern(Windows):
	HRESULT Next(ULONG celt, CATEGORYINFO* rgelt, ULONG* pceltFetched);
	HRESULT Skip(ULONG celt);
	HRESULT Reset();
	HRESULT Clone(IEnumCATEGORYINFO* ppenum);
}
mixin DEFINE_IID!(IEnumCATEGORYINFO, "0002E011-0000-0000-C000-000000000046");
alias IEnumCATEGORYINFO LPENUMCATEGORYINFO;

//extern extern(C) const IID IID_ICatRegister;
interface ICatRegister : IUnknown {
public extern(Windows):
	HRESULT RegisterCategories(ULONG cCategories, CATEGORYINFO* rgCategoryInfo);
	HRESULT UnRegisterCategories(ULONG cCategories, CATID* rgcatid);
	HRESULT RegisterClassImplCategories(REFCLSID rclsid, ULONG cCategories, CATID* rgcatid);
	HRESULT UnRegisterClassImplCategories(REFCLSID rclsid, ULONG cCategories, CATID* rgcatid);
	HRESULT RegisterClassReqCategories(REFCLSID rclsid, ULONG cCategories, CATID* rgcatid);
	HRESULT UnRegisterClassReqCategories(REFCLSID rclsid, ULONG cCategories, CATID* rgcatid);
}
mixin DEFINE_IID!(ICatRegister, "0002E012-0000-0000-C000-000000000046");
alias ICatRegister LPCATREGISTER;

//extern extern(C) const IID IID_ICatInformation;
interface ICatInformation : IUnknown {
public extern(Windows):
	HRESULT EnumCategories(LCID lcid, IEnumCATEGORYINFO* ppenumCategoryInfo);
	HRESULT GetCategoryDesc(REFCATID rcatid, LCID lcid, LPWSTR* pszDesc);
	HRESULT EnumClassesOfCategories(ULONG cImplemented, const(CATID)* rgcatidImpl, ULONG cRequired, const(CATID)* rgcatidReq, IEnumGUID* ppenumClsid);
	HRESULT IsClassOfCategories(REFCLSID rclsid, ULONG cImplemented, const(CATID)* rgcatidImpl, ULONG cRequired, const(CATID)* rgcatidReq);
	HRESULT EnumImplCategoriesOfClass(REFCLSID rclsid, IEnumGUID* ppenumCatid);
	HRESULT EnumReqCategoriesOfClass(REFCLSID rclsid, IEnumGUID* ppenumCatid);
}
mixin DEFINE_IID!(ICatInformation, "0002E013-0000-0000-C000-000000000046");
alias ICatInformation LPCATINFORMATION;

export extern(Windows){
	HRESULT ICatInformation_RemoteEnumClassesOfCategories_Proxy(ICatInformation This, ULONG cImplemented, const(CATID)* rgcatidImpl, ULONG cRequired, const(CATID)* rgcatidReq, IEnumGUID* ppenumClsid);
	void ICatInformation_RemoteEnumClassesOfCategories_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT ICatInformation_RemoteIsClassOfCategories_Proxy(ICatInformation This, REFCLSID rclsid, ULONG cImplemented, const(CATID)* rgcatidImpl, ULONG cRequired, const(CATID)* rgcatidReq);
	void ICatInformation_RemoteIsClassOfCategories_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IEnumGUID_Next_Proxy(IEnumGUID This, ULONG celt, GUID* rgelt, ULONG* pceltFetched);
	HRESULT IEnumGUID_Next_Stub(IEnumGUID This, ULONG celt, GUID* rgelt, ULONG* pceltFetched);
	HRESULT ICatInformation_EnumClassesOfCategories_Proxy(ICatInformation This, ULONG cImplemented, const(CATID)* rgcatidImpl, ULONG cRequired, const(CATID)* rgcatidReq, IEnumGUID* ppenumClsid);
	HRESULT ICatInformation_EnumClassesOfCategories_Stub(ICatInformation This, ULONG cImplemented, const(CATID)* rgcatidImpl, ULONG cRequired, const(CATID)* rgcatidReq, IEnumGUID* ppenumClsid);
	HRESULT ICatInformation_IsClassOfCategories_Proxy(ICatInformation This, REFCLSID rclsid, ULONG cImplemented, const(CATID)* rgcatidImpl, ULONG cRequired, const(CATID)* rgcatidReq);
	HRESULT ICatInformation_IsClassOfCategories_Stub(ICatInformation This, REFCLSID rclsid, ULONG cImplemented, const(CATID)* rgcatidImpl, ULONG cRequired, const(CATID)* rgcatidReq);
}

}// extern(C)
