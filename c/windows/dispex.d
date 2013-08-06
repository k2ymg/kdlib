/** dispex.d

Converted from 'dispex.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.dispex;


import c.windows.windef;
import c.windows.guiddef;
import c.windows.wtypes;
import c.windows.unknwn;
import c.windows.oaidl;
import c.windows.servprov;
import c.windows.rpcdcep;
import c.windows.objidl;


extern(C){

//mixin DEFINE_GUID!("IID_IDispatchEx", 0xa6ef9860, 0xc720, 0x11d0, 0x93, 0x37, 0x0, 0xa0, 0xc9, 0xd, 0xca, 0xa9);
//mixin DEFINE_GUID!("IID_IDispError", 0xa6ef9861, 0xc720, 0x11d0, 0x93, 0x37, 0x0, 0xa0, 0xc9, 0xd, 0xca, 0xa9);
//mixin DEFINE_GUID!("IID_IVariantChangeType", 0xa6ef9862, 0xc720, 0x11d0, 0x93, 0x37, 0x0, 0xa0, 0xc9, 0xd, 0xca, 0xa9);
mixin DEFINE_GUID!("SID_VariantConversion", 0x1f101481, 0xbccd, 0x11d0, 0x93, 0x36, 0x0, 0xa0, 0xc9, 0xd, 0xca, 0xa9);
mixin DEFINE_GUID!("SID_GetCaller", 0x4717cc40, 0xbcb9, 0x11d0, 0x93, 0x36, 0x0, 0xa0, 0xc9, 0xd, 0xca, 0xa9);
mixin DEFINE_GUID!("SID_ProvideRuntimeContext", 0x74a5040c, 0xdd0c, 0x48f0, 0xac, 0x85, 0x19, 0x4c, 0x32, 0x59, 0x18, 0xa);
//mixin DEFINE_GUID!("IID_IProvideRuntimeContext", 0x10e2414a, 0xec59, 0x49d2, 0xbc, 0x51, 0x5a, 0xdd, 0x2c, 0x36, 0xfe, 0xbc);
//mixin DEFINE_GUID!("IID_IObjectIdentity", 0xca04b7e6, 0xd21, 0x11d1, 0x8c, 0xc5, 0x0, 0xc0, 0x4f, 0xc2, 0xb0, 0x85);
//alias IID_IActiveScriptSite SID_GetScriptSite; todo

enum {
	fdexNameCaseSensitive       = 0x00000001,
	fdexNameEnsure              = 0x00000002,
	fdexNameImplicit            = 0x00000004,
	fdexNameCaseInsensitive     = 0x00000008,
	fdexNameInternal            = 0x00000010,
	fdexNameNoDynamicProperties = 0x00000020,
	fdexPropCanGet              = 0x00000001,
	fdexPropCannotGet           = 0x00000002,
	fdexPropCanPut              = 0x00000004,
	fdexPropCannotPut           = 0x00000008,
	fdexPropCanPutRef           = 0x00000010,
	fdexPropCannotPutRef        = 0x00000020,
	fdexPropNoSideEffects       = 0x00000040,
	fdexPropDynamicType         = 0x00000080,
	fdexPropCanCall             = 0x00000100,
	fdexPropCannotCall          = 0x00000200,
	fdexPropCanConstruct        = 0x00000400,
	fdexPropCannotConstruct     = 0x00000800,
	fdexPropCanSourceEvents     = 0x00001000,
	fdexPropCannotSourceEvents  = 0x00002000,
	grfdexPropCanAll            = fdexPropCanGet | fdexPropCanPut | fdexPropCanPutRef | fdexPropCanCall | fdexPropCanConstruct | fdexPropCanSourceEvents,
	grfdexPropCannotAll         = fdexPropCannotGet | fdexPropCannotPut | fdexPropCannotPutRef | fdexPropCannotCall | fdexPropCannotConstruct | fdexPropCannotSourceEvents,
	grfdexPropExtraAll          = fdexPropNoSideEffects | fdexPropDynamicType,
	grfdexPropAll               = grfdexPropCanAll | grfdexPropCannotAll | grfdexPropExtraAll,
	fdexEnumDefault             = 0x00000001,
	fdexEnumAll                 = 0x00000002,
}

enum {
	DISPATCH_CONSTRUCT = 0x4000,
	DISPID_THIS        = -613,
	DISPID_STARTENUM   = DISPID_UNKNOWN,
}

//extern extern(C) const IID IID_IDispatchEx;
interface IDispatchEx : IDispatch {
public extern(Windows):
	HRESULT GetDispID(BSTR bstrName, DWORD grfdex, DISPID* pid);
	HRESULT InvokeEx(DISPID id, LCID lcid, WORD wFlags, DISPPARAMS* pdp, VARIANT* pvarRes, EXCEPINFO* pei, IServiceProvider pspCaller);
	HRESULT DeleteMemberByName(BSTR bstrName, DWORD grfdex);
	HRESULT DeleteMemberByDispID(DISPID id);
	HRESULT GetMemberProperties(DISPID id, DWORD grfdexFetch, DWORD* pgrfdex);
	HRESULT GetMemberName(DISPID id, BSTR* pbstrName);
	HRESULT GetNextDispID(DWORD grfdex, DISPID id, DISPID* pid);
	HRESULT GetNameSpaceParent(IUnknown* ppunk);
}
mixin DEFINE_IID!(IDispatchEx, "A6EF9860-C720-11d0-9337-00A0C90DCAA9");

export extern(Windows){
	HRESULT IDispatchEx_RemoteInvokeEx_Proxy(IDispatchEx This, DISPID id, LCID lcid, DWORD dwFlags, DISPPARAMS* pdp, VARIANT* pvarRes, EXCEPINFO* pei, IServiceProvider pspCaller, UINT cvarRefArg, UINT* rgiRefArg, VARIANT* rgvarRefArg);
	void IDispatchEx_RemoteInvokeEx_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_IDispError;
interface IDispError : IUnknown {
public extern(Windows):
	HRESULT QueryErrorInfo(GUID guidErrorType, IDispError* ppde);
	HRESULT GetNext(IDispError* ppde);
	HRESULT GetHresult(HRESULT* phr);
	HRESULT GetSource(BSTR* pbstrSource);
	HRESULT GetHelpInfo(BSTR* pbstrFileName, DWORD* pdwContext);
	HRESULT GetDescription(BSTR* pbstrDescription);
}
mixin DEFINE_IID!(IDispError, "A6EF9861-C720-11d0-9337-00A0C90DCAA9");

//extern extern(C) const IID IID_IVariantChangeType;
interface IVariantChangeType : IUnknown {
public extern(Windows):
	HRESULT ChangeType(VARIANT* pvarDst, VARIANT* pvarSrc, LCID lcid, VARTYPE vtNew);
}
mixin DEFINE_IID!(IVariantChangeType, "A6EF9862-C720-11d0-9337-00A0C90DCAA9");

//extern extern(C) const IID IID_IObjectIdentity;
interface IObjectIdentity : IUnknown {
public extern(Windows):
	HRESULT IsEqualObject(IUnknown punk);
}
mixin DEFINE_IID!(IObjectIdentity, "CA04B7E6-0D21-11d1-8CC5-00C04FC2B085");

//extern extern(C) const IID IID_IProvideRuntimeContext;
interface IProvideRuntimeContext : IUnknown {
public extern(Windows):
	HRESULT GetCurrentSourceContext(DWORD_PTR* pdwContext, VARIANT_BOOL* pfExecutingGlobalCode);
}
mixin DEFINE_IID!(IProvideRuntimeContext, "10E2414A-EC59-49d2-BC51-5ADD2C36FEBC");

export extern(Windows){
	uint BSTR_UserSize(uint*, uint,  BSTR*);
	ubyte* BSTR_UserMarshal(uint*, ubyte*, BSTR*);
	ubyte* BSTR_UserUnmarshal(uint*, ubyte*, BSTR*);
	void BSTR_UserFree(uint*, BSTR*);

	uint VARIANT_UserSize(uint*, uint, VARIANT*);
	ubyte* VARIANT_UserMarshal(uint*, ubyte*, VARIANT*);
	ubyte* VARIANT_UserUnmarshal(uint*, ubyte*, VARIANT*);
	void VARIANT_UserFree(uint*, VARIANT*);

	uint BSTR_UserSize64(uint*, uint, BSTR*);
	ubyte* BSTR_UserMarshal64(uint*, ubyte*, BSTR*);
	ubyte* BSTR_UserUnmarshal64(uint*, ubyte*, BSTR*);
	void BSTR_UserFree64(uint*, BSTR*);

	uint VARIANT_UserSize64(uint*, uint, VARIANT*);
	ubyte* VARIANT_UserMarshal64(uint*, ubyte*, VARIANT*);
	ubyte* VARIANT_UserUnmarshal64(uint*, ubyte*, VARIANT*);
	void VARIANT_UserFree64(uint*, VARIANT*);

}

export extern(Windows){
	HRESULT IDispatchEx_InvokeEx_Proxy(IDispatchEx This, DISPID id, LCID lcid, WORD wFlags, DISPPARAMS* pdp, VARIANT* pvarRes, EXCEPINFO* pei, IServiceProvider pspCaller);
	HRESULT IDispatchEx_InvokeEx_Stub(IDispatchEx This, DISPID id, LCID lcid, DWORD dwFlags, DISPPARAMS* pdp, VARIANT* pvarRes, EXCEPINFO* pei, IServiceProvider pspCaller, UINT cvarRefArg, UINT* rgiRefArg, VARIANT* rgvarRefArg);
}

}// extern(C)

