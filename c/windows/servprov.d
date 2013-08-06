/** servprov.d

Converted from 'servprov.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.servprov;


import c.windows.windef;
import c.windows.guiddef;
import c.windows.unknwn;
import c.windows.objidl;
import c.windows.rpcdcep;


extern(C){

//extern extern(C) const IID IID_IServiceProvider;
interface IServiceProvider : IUnknown {
public extern(Windows):
	HRESULT QueryService(REFGUID guidService, REFIID riid, void** ppvObject);
}
mixin DEFINE_IID!(IServiceProvider, "6d5140c1-7436-11ce-8034-00aa006009fa");
alias IServiceProvider LPSERVICEPROVIDER;

export extern(Windows){
	HRESULT IServiceProvider_RemoteQueryService_Proxy(IServiceProvider This, REFGUID guidService, REFIID riid, IUnknown* ppvObject);
	void IServiceProvider_RemoteQueryService_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IServiceProvider_QueryService_Proxy(IServiceProvider This, REFGUID guidService, REFIID riid, void** ppvObject);
	HRESULT IServiceProvider_QueryService_Stub(IServiceProvider This, REFGUID guidService, REFIID riid, IUnknown* ppvObject);
}

} // extern(C)

