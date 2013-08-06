/** unknwn.d

Converted from 'unknwn.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.unknwn;


import c.windows.windef;
import c.windows.guiddef;
//import c.windows.objidl;
//import c.windows.rpcdcep;


extern(C){

//extern extern(C) const IID IID_IUnknown;
interface IUnknown {
public extern(Windows):
	HRESULT QueryInterface(REFIID riid, void** ppvObject);
	ULONG AddRef();
	ULONG Release();
}
mixin DEFINE_IID!(IUnknown, "00000000-0000-0000-C000-000000000046");
alias IUnknown LPUNKNOWN;

/*export extern(Windows){ todo: forward reference
	HRESULT IUnknown_QueryInterface_Proxy(IUnknown This, REFIID riid, void** ppvObject);
	void IUnknown_QueryInterface_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	ULONG IUnknown_AddRef_Proxy(IUnknown This);
	void IUnknown_AddRef_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	ULONG IUnknown_Release_Proxy(IUnknown This);
	void IUnknown_Release_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}*/

//extern extern(C) const IID IID_AsyncIUnknown;
interface AsyncIUnknown : IUnknown {
public extern(Windows):
	HRESULT Begin_QueryInterface(REFIID riid);
	HRESULT Finish_QueryInterface(void** ppvObject);
	HRESULT Begin_AddRef();
	ULONG Finish_AddRef();
	HRESULT Begin_Release();
	ULONG Finish_Release();
}
mixin DEFINE_IID!(AsyncIUnknown, "000e0000-0000-0000-C000-000000000046");

//extern extern(C) const IID IID_IClassFactory;
interface IClassFactory : IUnknown {
public extern(Windows):
	HRESULT CreateInstance(IUnknown pUnkOuter, REFIID riid, void** ppvObject);
	HRESULT LockServer(BOOL fLock);
}
mixin DEFINE_IID!(IClassFactory, "00000001-0000-0000-C000-000000000046");
alias IClassFactory LPCLASSFACTORY;

/*export extern(Windows){ todo: forward reference
	HRESULT IClassFactory_RemoteCreateInstance_Proxy(IClassFactory This, REFIID riid, IUnknown* ppvObject);
	void IClassFactory_RemoteCreateInstance_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IClassFactory_RemoteLockServer_Proxy(IClassFactory This, BOOL fLock);
	void  IClassFactory_RemoteLockServer_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IClassFactory_CreateInstance_Proxy(IClassFactory This, IUnknown pUnkOuter, REFIID riid, void** ppvObject);
	HRESULT IClassFactory_CreateInstance_Stub(IClassFactory This, REFIID riid, IUnknown* ppvObject);
	HRESULT IClassFactory_LockServer_Proxy(IClassFactory This, BOOL fLock);
	HRESULT IClassFactory_LockServer_Stub(IClassFactory This, BOOL fLock);
}*/

} // extern(C)
