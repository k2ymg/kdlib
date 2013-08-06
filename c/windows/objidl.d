/** objidl.d

Convert from 'objidl.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.objidl;


import c.windows.sdkddkver;
import c.windows.windef;
import c.windows.wtypes;
import c.windows.guiddef;
import c.windows.unknwn;
import c.windows.rpcdcep;


extern(C){

struct COSERVERINFO {
	DWORD dwReserved1;
	LPWSTR pwszName;
	COAUTHINFO* pAuthInfo;
	DWORD dwReserved2;
}

//extern extern(C) const IID IID_IMarshal;
interface IMarshal : IUnknown {
public extern(Windows):
	HRESULT GetUnmarshalClass(REFIID riid, void* pv, DWORD dwDestContext, void* pvDestContext, DWORD mshlflags, CLSID* pCid);
	HRESULT GetMarshalSizeMax(REFIID riid, void* pv, DWORD dwDestContext, void* pvDestContext, DWORD mshlflags, DWORD* pSize);
	HRESULT MarshalInterface(IStream pStm, REFIID riid, void* pv, DWORD dwDestContext, void* pvDestContext, DWORD mshlflags);
	HRESULT UnmarshalInterface(IStream pStm, REFIID riid, void** ppv);
	HRESULT ReleaseMarshalData(IStream pStm);
	HRESULT DisconnectObject(DWORD dwReserved);
}
mixin DEFINE_IID!(IMarshal, "00000003-0000-0000-C000-000000000046");
alias IMarshal LPMARSHAL;

//extern extern(C) const IID IID_IMarshal2;
interface IMarshal2 : IMarshal {
}
mixin DEFINE_IID!(IMarshal2, "000001cf-0000-0000-C000-000000000046");
alias IMarshal2 LPMARSHAL2;

//extern extern(C) const IID IID_IMalloc;
interface IMalloc : IUnknown {
public extern(Windows):
	void* Alloc(SIZE_T cb);
	void* Realloc(void* pv, SIZE_T cb);
	void Free(void* pv);
	SIZE_T GetSize(void* pv);
	int DidAlloc(void* pv);
	void  HeapMinimize();
}
mixin DEFINE_IID!(IMalloc, "00000002-0000-0000-C000-000000000046");
alias IMalloc LPMALLOC;

//extern extern(C) const IID IID_IMallocSpy;
interface IMallocSpy : IUnknown {
public extern(Windows):
	SIZE_T PreAlloc(SIZE_T cbRequest);
	void* PostAlloc(void* pActual);
	void* PreFree(void* pRequest, BOOL fSpyed);
	void PostFree(BOOL fSpyed);
	SIZE_T PreRealloc(void* pRequest, SIZE_T cbRequest, void** ppNewRequest, BOOL fSpyed);
	void* PostRealloc(void* pActual, BOOL fSpyed);
	void* PreGetSize(void* pRequest, BOOL fSpyed);
	SIZE_T PostGetSize(SIZE_T cbActual, BOOL fSpyed);
	void* PreDidAlloc(void* pRequest, BOOL fSpyed);
	int PostDidAlloc(void* pRequest, BOOL fSpyed, int fActual);
	void PreHeapMinimize();
	void PostHeapMinimize();
}
mixin DEFINE_IID!(IMallocSpy, "0000001d-0000-0000-C000-000000000046");
alias IMallocSpy LPMALLOCSPY;

//extern extern(C) const IID IID_IStdMarshalInfo;
interface IStdMarshalInfo : IUnknown {
public extern(Windows):
	HRESULT GetClassForHandler(DWORD dwDestContext, void* pvDestContext, CLSID* pClsid);
}
mixin DEFINE_IID!(IStdMarshalInfo, "00000018-0000-0000-C000-000000000046");
alias IStdMarshalInfo LPSTDMARSHALINFO;

enum {
	EXTCONN_STRONG   = 0x1,
	EXTCONN_WEAK     = 0x2,
	EXTCONN_CALLABLE = 0x4
}
alias int EXTCONN;

//extern extern(C) const IID IID_IExternalConnection;
interface IExternalConnection : IUnknown {
public extern(Windows):
	DWORD AddConnection(DWORD extconn, DWORD reserved);
	DWORD ReleaseConnection(DWORD extconn, DWORD reserved, BOOL fLastReleaseCloses);
}
mixin DEFINE_IID!(IExternalConnection, "00000019-0000-0000-C000-000000000046");
alias IExternalConnection LPEXTERNALCONNECTION;

struct MULTI_QI {
	const(IID)* pIID;
	IUnknown pItf;
	HRESULT hr;
}

//extern extern(C) const IID IID_IMultiQI;
interface IMultiQI : IUnknown {
public extern(Windows):
	HRESULT QueryMultipleInterfaces(ULONG cMQIs, MULTI_QI* pMQIs);
}
mixin DEFINE_IID!(IMultiQI, "00000020-0000-0000-C000-000000000046");
alias IMultiQI LPMULTIQI;

//extern extern(C) const IID IID_AsyncIMultiQI;
interface AsyncIMultiQI : IUnknown {
public extern(Windows):
	HRESULT Begin_QueryMultipleInterfaces(ULONG cMQIs, MULTI_QI* pMQIs);
	HRESULT Finish_QueryMultipleInterfaces(MULTI_QI* pMQIs);
}
mixin DEFINE_IID!(AsyncIMultiQI, "000e0020-0000-0000-C000-000000000046");

//extern extern(C) const IID IID_IInternalUnknown;
interface IInternalUnknown : IUnknown {
public extern(Windows):
	HRESULT QueryInternalInterface(REFIID riid, void** ppv);
}
mixin DEFINE_IID!(IInternalUnknown, "00000021-0000-0000-C000-000000000046");

//extern extern(C) const IID IID_IEnumUnknown;
interface IEnumUnknown : IUnknown {
public extern(Windows):
	HRESULT Next(ULONG celt, IUnknown* rgelt, ULONG* pceltFetched);
	HRESULT Skip(ULONG celt);
	HRESULT Reset();
	HRESULT Clone(IEnumUnknown* ppenum);
}
mixin DEFINE_IID!(IEnumUnknown, "00000100-0000-0000-C000-000000000046");
alias IEnumUnknown LPENUMUNKNOWN;

export extern(Windows){
	HRESULT IEnumUnknown_RemoteNext_Proxy(IEnumUnknown This, ULONG celt, IUnknown* rgelt, ULONG* pceltFetched);
	void IEnumUnknown_RemoteNext_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

private template BIND_OPTS_T() {
	DWORD cbStruct;
	DWORD grfFlags;
	DWORD grfMode;
	DWORD dwTickCountDeadline;
}
private template BIND_OPTS2_T() {
	mixin BIND_OPTS_T;
	DWORD dwTrackFlags;
	DWORD dwClassContext;
	LCID locale;
	COSERVERINFO* pServerInfo;
}
struct BIND_OPTS {
	mixin BIND_OPTS_T;
}
alias BIND_OPTS* LPBIND_OPTS;
struct BIND_OPTS2 {
	mixin BIND_OPTS2_T;
}
alias BIND_OPTS2* LPBIND_OPTS2;
struct BIND_OPTS3 {
	mixin BIND_OPTS2_T;
	HWND hwnd;
}
alias BIND_OPTS3* LPBIND_OPTS3;
enum {
	BIND_MAYBOTHERUSER     = 1,
	BIND_JUSTTESTEXISTENCE = 2
}
alias int BIND_FLAGS;

//extern extern(C) const IID IID_IBindCtx;
interface IBindCtx : IUnknown {
public extern(Windows):
	HRESULT RegisterObjectBound(IUnknown punk);
	HRESULT RevokeObjectBound(IUnknown punk);
	HRESULT ReleaseBoundObjects();
	HRESULT SetBindOptions(BIND_OPTS* pbindopts);
	HRESULT GetBindOptions(BIND_OPTS* pbindopts);
	HRESULT GetRunningObjectTable(IRunningObjectTable* pprot);
	HRESULT RegisterObjectParam(LPOLESTR pszKey, IUnknown punk);
	HRESULT GetObjectParam(LPOLESTR pszKey, IUnknown* ppunk);
	HRESULT EnumObjectParam(IEnumString* ppenum);
	HRESULT RevokeObjectParam(LPOLESTR pszKey);
}
mixin DEFINE_IID!(IBindCtx, "0000000e-0000-0000-C000-000000000046");
alias IBindCtx LPBC;
alias IBindCtx LPBINDCTX;

export extern(Windows){
	HRESULT IBindCtx_RemoteSetBindOptions_Proxy(IBindCtx This, BIND_OPTS2* pbindopts);
	void IBindCtx_RemoteSetBindOptions_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IBindCtx_RemoteGetBindOptions_Proxy(IBindCtx This, BIND_OPTS2* pbindopts);
	void IBindCtx_RemoteGetBindOptions_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_IEnumMoniker;
interface IEnumMoniker : IUnknown {
public extern(Windows):
	HRESULT Next(ULONG celt, IMoniker* rgelt, ULONG* pceltFetched);
	HRESULT Skip(ULONG celt);
	HRESULT Reset();
	HRESULT Clone(IEnumMoniker* ppenum);
}
mixin DEFINE_IID!(IEnumMoniker, "00000102-0000-0000-C000-000000000046");
alias IEnumMoniker LPENUMMONIKER;

export extern(Windows){
	HRESULT IEnumMoniker_RemoteNext_Proxy(IEnumMoniker This, ULONG celt, IMoniker* rgelt, ULONG* pceltFetched);
	void IEnumMoniker_RemoteNext_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_IRunnableObject;
interface IRunnableObject : IUnknown {
public extern(Windows):
	HRESULT GetRunningClass(LPCLSID lpClsid);
	HRESULT Run(LPBINDCTX pbc);
	BOOL IsRunning();
	HRESULT LockRunning(BOOL fLock, BOOL fLastUnlockCloses);
	HRESULT SetContainedObject(BOOL fContained);
}
mixin DEFINE_IID!(IRunnableObject, "00000126-0000-0000-C000-000000000046");
alias IRunnableObject LPRUNNABLEOBJECT;

export extern(Windows){
	HRESULT IRunnableObject_RemoteIsRunning_Proxy(IRunnableObject This);
	void IRunnableObject_RemoteIsRunning_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_IRunningObjectTable;
interface IRunningObjectTable : IUnknown {
public extern(Windows):
	HRESULT Register(DWORD grfFlags, IUnknown punkObject, IMoniker pmkObjectName, DWORD* pdwRegister);
	HRESULT Revoke(DWORD dwRegister);
	HRESULT IsRunning(IMoniker pmkObjectName);
	HRESULT GetObject(IMoniker pmkObjectName, IUnknown* ppunkObject);
	HRESULT NoteChangeTime(DWORD dwRegister, FILETIME* pfiletime);
	HRESULT GetTimeOfLastChange(IMoniker pmkObjectName, FILETIME* pfiletime);
	HRESULT EnumRunning(IEnumMoniker* ppenumMoniker);
}
mixin DEFINE_IID!(IRunningObjectTable, "00000010-0000-0000-C000-000000000046");
alias IRunningObjectTable LPRUNNINGOBJECTTABLE;

//extern extern(C) const IID IID_IPersist;
interface IPersist : IUnknown {
public extern(Windows):
	HRESULT GetClassID(CLSID* pClassID);
}
mixin DEFINE_IID!(IPersist, "0000010c-0000-0000-C000-000000000046");
alias IPersist LPPERSIST;

//extern extern(C) const IID IID_IPersistStream;
interface IPersistStream : IPersist {
public extern(Windows):
	HRESULT IsDirty();
	HRESULT Load(IStream pStm);
	HRESULT Save(IStream pStm, BOOL fClearDirty);
	HRESULT GetSizeMax(ULARGE_INTEGER* pcbSize);
}
mixin DEFINE_IID!(IPersistStream, "00000109-0000-0000-C000-000000000046");
alias IPersistStream LPPERSISTSTREAM;

enum {
	MKSYS_NONE             = 0,
	MKSYS_GENERICCOMPOSITE = 1,
	MKSYS_FILEMONIKER      = 2,
	MKSYS_ANTIMONIKER      = 3,
	MKSYS_ITEMMONIKER      = 4,
	MKSYS_POINTERMONIKER   = 5,
	MKSYS_CLASSMONIKER     = 7,
	MKSYS_OBJREFMONIKER    = 8,
	MKSYS_SESSIONMONIKER   = 9,
	MKSYS_LUAMONIKER       = 10
}
alias int MKSYS;
enum {
	MKRREDUCE_ONE         = 3 << 16,
	MKRREDUCE_TOUSER      = 2 << 16,
	MKRREDUCE_THROUGHUSER = 1 << 16,
	MKRREDUCE_ALL         = 0
}
alias int MKRREDUCE;

//extern extern(C) const IID IID_IMoniker;
interface IMoniker : IPersistStream {
public extern(Windows):
	HRESULT BindToObject(IBindCtx pbc, IMoniker pmkToLeft, REFIID riidResult, void** ppvResult);
	HRESULT BindToStorage(IBindCtx pbc, IMoniker pmkToLeft, REFIID riid, void** ppvObj);
	HRESULT Reduce(IBindCtx pbc, DWORD dwReduceHowFar, IMoniker* ppmkToLeft, IMoniker* ppmkReduced);
	HRESULT ComposeWith(IMoniker pmkRight, BOOL fOnlyIfNotGeneric, IMoniker* ppmkComposite);
	HRESULT Enum(BOOL fForward, IEnumMoniker* ppenumMoniker);
	HRESULT IsEqual(IMoniker pmkOtherMoniker);
	HRESULT Hash(DWORD* pdwHash);
	HRESULT IsRunning(IBindCtx pbc, IMoniker pmkToLeft, IMoniker pmkNewlyRunning);
	HRESULT GetTimeOfLastChange(IBindCtx pbc, IMoniker pmkToLeft, FILETIME* pFileTime);
	HRESULT Inverse(IMoniker* ppmk);
	HRESULT CommonPrefixWith(IMoniker pmkOther, IMoniker* ppmkPrefix) ;
	HRESULT RelativePathTo(IMoniker pmkOther, IMoniker* ppmkRelPath);
	HRESULT GetDisplayName(IBindCtx pbc, IMoniker pmkToLeft, LPOLESTR* ppszDisplayName);
	HRESULT ParseDisplayName(IBindCtx pbc, IMoniker pmkToLeft, LPOLESTR pszDisplayName, ULONG* pchEaten, IMoniker* ppmkOut);
	HRESULT IsSystemMoniker(DWORD* pdwMksys);
}
mixin DEFINE_IID!(IMoniker, "0000000f-0000-0000-C000-000000000046");
alias IMoniker LPMONIKER;

export extern(Windows){
	HRESULT IMoniker_RemoteBindToObject_Proxy(IMoniker This, IBindCtx pbc, IMoniker pmkToLeft, REFIID riidResult, IUnknown* ppvResult);
	void IMoniker_RemoteBindToObject_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IMoniker_RemoteBindToStorage_Proxy(IMoniker This, IBindCtx pbc, IMoniker pmkToLeft, REFIID riid, IUnknown* ppvObj);
	void IMoniker_RemoteBindToStorage_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_IROTData;
interface IROTData : IUnknown {
public extern(Windows):
	HRESULT GetComparisonData(byte* pbData, ULONG cbMax, ULONG* pcbData);
}
mixin DEFINE_IID!(IROTData, "f29f6bc0-5021-11ce-aa15-00006901293f");

//extern extern(C) const IID IID_IEnumString;
interface IEnumString : IUnknown {
public extern(Windows):
	HRESULT Next(ULONG celt, LPOLESTR* rgelt, ULONG* pceltFetched);
	HRESULT Skip(ULONG celt);
	HRESULT Reset();
	HRESULT Clone(IEnumString* ppenum);
}
mixin DEFINE_IID!(IEnumString, "00000101-0000-0000-C000-000000000046");
alias IEnumString LPENUMSTRING;

export extern(Windows){
	HRESULT IEnumString_RemoteNext_Proxy(IEnumString This, ULONG celt, LPOLESTR* rgelt, ULONG* pceltFetched);
	void IEnumString_RemoteNext_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_ISequentialStream;
interface ISequentialStream : IUnknown {
public extern(Windows):
	HRESULT Read(void* pv, ULONG cb, ULONG* pcbRead);
	HRESULT Write(const(void)* pv, ULONG cb, ULONG* pcbWritten);
}
mixin DEFINE_IID!(ISequentialStream, "0c733a30-2a1c-11ce-ade5-00aa0044773d");

export extern(Windows){
	HRESULT ISequentialStream_RemoteRead_Proxy(ISequentialStream This, byte* pv, ULONG cb, ULONG* pcbRead);
	void ISequentialStream_RemoteRead_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT ISequentialStream_RemoteWrite_Proxy(ISequentialStream This, const(byte)* pv, ULONG cb, ULONG* pcbWritten);
	void ISequentialStream_RemoteWrite_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

struct STATSTG {
	LPOLESTR pwcsName;
	DWORD type;
	ULARGE_INTEGER cbSize;
	FILETIME mtime;
	FILETIME ctime;
	FILETIME atime;
	DWORD grfMode;
	DWORD grfLocksSupported;
	CLSID clsid;
	DWORD grfStateBits;
	DWORD reserved;
}
enum {
	STGTY_STORAGE   = 1,
	STGTY_STREAM    = 2,
	STGTY_LOCKBYTES = 3,
	STGTY_PROPERTY  = 4
}
alias int STGTY;
enum {
	STREAM_SEEK_SET = 0,
	STREAM_SEEK_CUR = 1,
	STREAM_SEEK_END = 2
}
alias int STREAM_SEEK;
enum {
	LOCK_WRITE     = 1,
	LOCK_EXCLUSIVE = 2,
	LOCK_ONLYONCE  = 4
}
alias int LOCKTYPE;

//extern extern(C) const IID IID_IStream;
interface IStream : ISequentialStream {
public extern(Windows):
	HRESULT Seek(LARGE_INTEGER dlibMove, DWORD dwOrigin, ULARGE_INTEGER* plibNewPosition);
	HRESULT SetSize(ULARGE_INTEGER libNewSize);
	HRESULT CopyTo(IStream pstm, ULARGE_INTEGER cb, ULARGE_INTEGER* pcbRead, ULARGE_INTEGER* pcbWritten);
	HRESULT Commit(DWORD grfCommitFlags);
	HRESULT Revert();
	HRESULT LockRegion(ULARGE_INTEGER libOffset, ULARGE_INTEGER cb, DWORD dwLockType);
	HRESULT UnlockRegion(ULARGE_INTEGER libOffset, ULARGE_INTEGER cb, DWORD dwLockType);
	HRESULT Stat(STATSTG* pstatstg, DWORD grfStatFlag);
	HRESULT Clone(IStream* ppstm);
}
mixin DEFINE_IID!(IStream, "0000000c-0000-0000-C000-000000000046");
alias IStream LPSTREAM;

export extern(Windows){
	HRESULT IStream_RemoteSeek_Proxy(IStream This, LARGE_INTEGER dlibMove, DWORD dwOrigin, ULARGE_INTEGER* plibNewPosition);
	void IStream_RemoteSeek_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IStream_RemoteCopyTo_Proxy(IStream This, IStream pstm, ULARGE_INTEGER cb, ULARGE_INTEGER* pcbRead, ULARGE_INTEGER* pcbWritten);
	void IStream_RemoteCopyTo_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_IEnumSTATSTG;
interface IEnumSTATSTG : IUnknown {
public extern(Windows):
	HRESULT Next(ULONG celt, STATSTG* rgelt, ULONG* pceltFetched);
	HRESULT Skip(ULONG celt);
	HRESULT Reset();
	HRESULT Clone(IEnumSTATSTG* ppenum);
}
mixin DEFINE_IID!(IEnumSTATSTG, "0000000d-0000-0000-C000-000000000046");
alias IEnumSTATSTG LPENUMSTATSTG;

export extern(Windows){
	HRESULT IEnumSTATSTG_RemoteNext_Proxy(IEnumSTATSTG This, ULONG celt, STATSTG* rgelt, ULONG* pceltFetched);
	void IEnumSTATSTG_RemoteNext_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

struct RemSNB {
	uint ulCntStr;
	uint ulCntChar;
	OLECHAR[1] rgString;
}
alias RemSNB* wireSNB;
alias LPOLESTR* SNB;

//extern extern(C) const IID IID_IStorage;
interface IStorage : IUnknown {
public extern(Windows):
	HRESULT CreateStream(const(OLECHAR)* pwcsName, DWORD grfMode, DWORD reserved1, DWORD reserved2, IStream* ppstm);
	HRESULT OpenStream(const(OLECHAR)* pwcsName, void* reserved1, DWORD grfMode, DWORD reserved2, IStream* ppstm);
	HRESULT CreateStorage(const(OLECHAR)* pwcsName, DWORD grfMode, DWORD reserved1, DWORD reserved2, IStorage* ppstg);
	HRESULT OpenStorage(const(OLECHAR)* pwcsName, IStorage pstgPriority, DWORD grfMode, SNB snbExclude, DWORD reserved, IStorage* ppstg);
	HRESULT CopyTo(DWORD ciidExclude, const(IID)* rgiidExclude, SNB snbExclude, IStorage pstgDest);
	HRESULT MoveElementTo(const(OLECHAR)* pwcsName, IStorage pstgDest, const(OLECHAR)* pwcsNewName, DWORD grfFlags);
	HRESULT Commit(DWORD grfCommitFlags);
	HRESULT Revert();
	HRESULT EnumElements(DWORD reserved1, void* reserved2, DWORD reserved3, IEnumSTATSTG* ppenum);
	HRESULT DestroyElement(const(OLECHAR)* pwcsName);
	HRESULT RenameElement(const(OLECHAR)* pwcsOldName, const(OLECHAR)* pwcsNewName);
	HRESULT SetElementTimes(const(OLECHAR)* pwcsName, const(FILETIME)* pctime, const(FILETIME)* patime, const(FILETIME)* pmtime);
	HRESULT SetClass(REFCLSID clsid);
	HRESULT SetStateBits(DWORD grfStateBits, DWORD grfMask);
	HRESULT Stat(STATSTG* pstatstg, DWORD grfStatFlag);
}
mixin DEFINE_IID!(IStorage, "0000000b-0000-0000-C000-000000000046");
alias IStorage LPSTORAGE;

export extern(Windows){
	HRESULT IStorage_RemoteOpenStream_Proxy(IStorage This, const(OLECHAR)* pwcsName, uint cbReserved1, byte* reserved1, DWORD grfMode, DWORD reserved2, IStream* ppstm);
	void IStorage_RemoteOpenStream_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IStorage_RemoteCopyTo_Proxy(IStorage This, DWORD ciidExclude, const(IID)* rgiidExclude, SNB snbExclude, IStorage pstgDest);
	void IStorage_RemoteCopyTo_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IStorage_RemoteEnumElements_Proxy(IStorage This, DWORD reserved1, uint cbReserved2, byte* reserved2, DWORD reserved3, IEnumSTATSTG* ppenum);
	void IStorage_RemoteEnumElements_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_IPersistFile;
interface IPersistFile : IPersist {
public extern(Windows):
	HRESULT IsDirty();
	HRESULT Load(LPCOLESTR pszFileName, DWORD dwMode);
	HRESULT Save(LPCOLESTR pszFileName, BOOL fRemember);
	HRESULT SaveCompleted(LPCOLESTR pszFileName);
	HRESULT GetCurFile(LPOLESTR* ppszFileName);
}
mixin DEFINE_IID!(IPersistFile, "0000010b-0000-0000-C000-000000000046");
alias IPersistFile LPPERSISTFILE;

//extern extern(C) const IID IID_IPersistStorage;
interface IPersistStorage : IPersist {
public extern(Windows):
	HRESULT IsDirty();
	HRESULT InitNew(IStorage pStg);
	HRESULT Load(IStorage pStg);
	HRESULT Save(IStorage pStgSave, BOOL fSameAsLoad);
	HRESULT SaveCompleted(IStorage pStgNew);
	HRESULT HandsOffStorage();
}
mixin DEFINE_IID!(IPersistStorage, "0000010a-0000-0000-C000-000000000046");
alias IPersistStorage LPPERSISTSTORAGE;

//extern extern(C) const IID IID_ILockBytes;
interface ILockBytes : IUnknown {
public extern(Windows):
	HRESULT ReadAt(ULARGE_INTEGER ulOffset, void* pv, ULONG cb, ULONG* pcbRead);
	HRESULT WriteAt(ULARGE_INTEGER ulOffset, const(void)* pv, ULONG cb, ULONG* pcbWritten);
	HRESULT Flush();
	HRESULT SetSize(ULARGE_INTEGER cb);
	HRESULT LockRegion(ULARGE_INTEGER libOffset, ULARGE_INTEGER cb, DWORD dwLockType);
	HRESULT UnlockRegion(ULARGE_INTEGER libOffset, ULARGE_INTEGER cb, DWORD dwLockType);
	HRESULT Stat(STATSTG* pstatstg, DWORD grfStatFlag);
}
mixin DEFINE_IID!(ILockBytes, "0000000a-0000-0000-C000-000000000046");
alias ILockBytes LPLOCKBYTES;

export extern(Windows){
	HRESULT ILockBytes_RemoteReadAt_Proxy(ILockBytes This, ULARGE_INTEGER ulOffset, byte* pv, ULONG cb, ULONG* pcbRead);
	void ILockBytes_RemoteReadAt_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT ILockBytes_RemoteWriteAt_Proxy(ILockBytes This, ULARGE_INTEGER ulOffset, const(byte)* pv, ULONG cb, ULONG* pcbWritten);
	void ILockBytes_RemoteWriteAt_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

struct DVTARGETDEVICE {
	DWORD tdSize;
	WORD tdDriverNameOffset;
	WORD tdDeviceNameOffset;
	WORD tdPortNameOffset;
	WORD tdExtDevmodeOffset;
	BYTE[1] tdData;
}
alias CLIPFORMAT* LPCLIPFORMAT;
struct FORMATETC {
	CLIPFORMAT cfFormat;
	DVTARGETDEVICE* ptd;
	DWORD dwAspect;
	LONG lindex;
	DWORD tymed;
}
alias FORMATETC* LPFORMATETC;

//extern extern(C) const IID IID_IEnumFORMATETC;
interface IEnumFORMATETC : IUnknown {
public extern(Windows):
	HRESULT Next(ULONG celt, FORMATETC* rgelt, ULONG* pceltFetched);
	HRESULT Skip(ULONG celt);
	HRESULT Reset();
	HRESULT Clone(IEnumFORMATETC* ppenum);
}
mixin DEFINE_IID!(IEnumFORMATETC, "00000103-0000-0000-C000-000000000046");
alias IEnumFORMATETC LPENUMFORMATETC;

export extern(Windows){
	HRESULT IEnumFORMATETC_RemoteNext_Proxy(IEnumFORMATETC This, ULONG celt, FORMATETC* rgelt, ULONG* pceltFetched);
	void IEnumFORMATETC_RemoteNext_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

enum {
	ADVF_NODATA            = 1,
	ADVF_PRIMEFIRST        = 2,
	ADVF_ONLYONCE          = 4,
	ADVF_DATAONSTOP        = 64,
	ADVFCACHE_NOHANDLER    = 8,
	ADVFCACHE_FORCEBUILTIN = 16,
	ADVFCACHE_ONSAVE       = 32
}
alias int ADVF;
struct STATDATA {
	FORMATETC formatetc;
	DWORD advf;
	IAdviseSink pAdvSink;
	DWORD dwConnection;
}
alias STATDATA* LPSTATDATA;

//extern extern(C) const IID IID_IEnumSTATDATA;
interface IEnumSTATDATA : IUnknown {
public extern(Windows):
	HRESULT Next(ULONG celt, STATDATA* rgelt, ULONG* pceltFetched);
	HRESULT Skip(ULONG celt);
	HRESULT Reset();
	HRESULT Clone(IEnumSTATDATA* ppenum);
}
mixin DEFINE_IID!(IEnumSTATDATA, "00000105-0000-0000-C000-000000000046");
alias IEnumSTATDATA LPENUMSTATDATA;

export extern(Windows){
	HRESULT IEnumSTATDATA_RemoteNext_Proxy(IEnumSTATDATA This, ULONG celt, STATDATA* rgelt, ULONG* pceltFetched);
	void IEnumSTATDATA_RemoteNext_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_IRootStorage;
interface IRootStorage : IUnknown {
public extern(Windows):
	HRESULT SwitchToFile(LPOLESTR pszFile);
}
mixin DEFINE_IID!(IRootStorage, "00000012-0000-0000-C000-000000000046");
alias IRootStorage LPROOTSTORAGE;

enum {
	TYMED_HGLOBAL  = 1,
	TYMED_FILE     = 2,
	TYMED_ISTREAM  = 4,
	TYMED_ISTORAGE = 8,
	TYMED_GDI      = 16,
	TYMED_MFPICT   = 32,
	TYMED_ENHMF    = 64,
	TYMED_NULL     = 0
}
alias int TYMED;
struct RemSTGMEDIUM {
	DWORD tymed;
	DWORD dwHandleType;
	uint pData;
	uint pUnkForRelease;
	uint cbData;
	byte[1] data;
}
struct uSTGMEDIUM {
	DWORD tymed;
	union {
		HBITMAP hBitmap;
		HMETAFILEPICT hMetaFilePict;
		HENHMETAFILE hEnhMetaFile;
		HGLOBAL hGlobal;
		LPOLESTR lpszFileName;
		IStream pstm;
		IStorage pstg;
	}
	IUnknown pUnkForRelease;
}
struct GDI_OBJECT {
	DWORD ObjectType;
	union {
		wireHBITMAP hBitmap;
		wireHPALETTE hPalette;
		wireHGLOBAL hGeneric;
	}
}
struct userSTGMEDIUM {
	struct {
		DWORD tymed;
		union {
			wireHMETAFILEPICT hMetaFilePict;
			wireHENHMETAFILE hHEnhMetaFile;
			GDI_OBJECT* hGdiHandle;
			wireHGLOBAL hGlobal;
			LPOLESTR lpszFileName;
			BYTE_BLOB* pstm;
			BYTE_BLOB* pstg;
		}
	}
	IUnknown pUnkForRelease;
}
alias userSTGMEDIUM* wireSTGMEDIUM;
alias uSTGMEDIUM STGMEDIUM;
alias userSTGMEDIUM* wireASYNC_STGMEDIUM;
alias STGMEDIUM ASYNC_STGMEDIUM;
alias STGMEDIUM* LPSTGMEDIUM;
struct userFLAG_STGMEDIUM {
	int ContextFlags;
	int fPassOwnership;
	userSTGMEDIUM Stgmed;
}
alias userFLAG_STGMEDIUM* wireFLAG_STGMEDIUM;
struct FLAG_STGMEDIUM {
	int ContextFlags;
	int fPassOwnership;
	STGMEDIUM Stgmed;
}

//extern extern(C) const IID IID_IAdviseSink;
interface IAdviseSink : IUnknown {
public extern(Windows):
	void OnDataChange(FORMATETC* pFormatetc, STGMEDIUM* pStgmed);
	void OnViewChange(DWORD dwAspect, LONG lindex);
	void OnRename(IMoniker pmk);
	void OnSave();
	void OnClose();
}
mixin DEFINE_IID!(IAdviseSink, "0000010f-0000-0000-C000-000000000046");
alias IAdviseSink LPADVISESINK;

export extern(Windows){
	HRESULT IAdviseSink_RemoteOnDataChange_Proxy(IAdviseSink This, FORMATETC* pFormatetc, ASYNC_STGMEDIUM* pStgmed);
	void IAdviseSink_RemoteOnDataChange_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IAdviseSink_RemoteOnViewChange_Proxy(IAdviseSink This, DWORD dwAspect, LONG lindex);
	void IAdviseSink_RemoteOnViewChange_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IAdviseSink_RemoteOnRename_Proxy(IAdviseSink This, IMoniker pmk);
	void IAdviseSink_RemoteOnRename_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IAdviseSink_RemoteOnSave_Proxy(IAdviseSink This);
	void IAdviseSink_RemoteOnSave_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IAdviseSink_RemoteOnClose_Proxy(IAdviseSink This);
	void IAdviseSink_RemoteOnClose_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_AsyncIAdviseSink;
interface AsyncIAdviseSink : IUnknown {
public extern(Windows):
	void Begin_OnDataChange(FORMATETC* pFormatetc, STGMEDIUM* pStgmed);
	void Finish_OnDataChange();
	void Begin_OnViewChange(DWORD dwAspect, LONG lindex);
	void Finish_OnViewChange();
	void Begin_OnRename(IMoniker pmk);
	void Finish_OnRename();
	void Begin_OnSave();
	void Finish_OnSave();
	void Begin_OnClose();
	void Finish_OnClose();
}
mixin DEFINE_IID!(AsyncIAdviseSink, "00000150-0000-0000-C000-000000000046");

export extern(Windows){
	HRESULT AsyncIAdviseSink_Begin_RemoteOnDataChange_Proxy(AsyncIAdviseSink This, FORMATETC* pFormatetc, ASYNC_STGMEDIUM* pStgmed);
	void AsyncIAdviseSink_Begin_RemoteOnDataChange_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT AsyncIAdviseSink_Finish_RemoteOnDataChange_Proxy(AsyncIAdviseSink This);
	void AsyncIAdviseSink_Finish_RemoteOnDataChange_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT AsyncIAdviseSink_Begin_RemoteOnViewChange_Proxy(AsyncIAdviseSink This, DWORD dwAspect, LONG lindex);
	void AsyncIAdviseSink_Begin_RemoteOnViewChange_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT AsyncIAdviseSink_Finish_RemoteOnViewChange_Proxy(AsyncIAdviseSink This);
	void AsyncIAdviseSink_Finish_RemoteOnViewChange_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT AsyncIAdviseSink_Begin_RemoteOnRename_Proxy(AsyncIAdviseSink This, IMoniker pmk);
	void AsyncIAdviseSink_Begin_RemoteOnRename_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT AsyncIAdviseSink_Finish_RemoteOnRename_Proxy(AsyncIAdviseSink This);
	void AsyncIAdviseSink_Finish_RemoteOnRename_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT AsyncIAdviseSink_Begin_RemoteOnSave_Proxy(AsyncIAdviseSink This);
	void AsyncIAdviseSink_Begin_RemoteOnSave_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT AsyncIAdviseSink_Finish_RemoteOnSave_Proxy(AsyncIAdviseSink This);
	void AsyncIAdviseSink_Finish_RemoteOnSave_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT AsyncIAdviseSink_Begin_RemoteOnClose_Proxy(AsyncIAdviseSink This);
	void AsyncIAdviseSink_Begin_RemoteOnClose_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT AsyncIAdviseSink_Finish_RemoteOnClose_Proxy(AsyncIAdviseSink This);
	void AsyncIAdviseSink_Finish_RemoteOnClose_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_IAdviseSink2;
interface IAdviseSink2 : IAdviseSink {
public extern(Windows):
	void OnLinkSrcChange(IMoniker pmk);
}
mixin DEFINE_IID!(IAdviseSink2, "00000125-0000-0000-C000-000000000046");
alias IAdviseSink2 LPADVISESINK2;

export extern(Windows){
	HRESULT IAdviseSink2_RemoteOnLinkSrcChange_Proxy(IAdviseSink2 This, IMoniker pmk);
	void IAdviseSink2_RemoteOnLinkSrcChange_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_AsyncIAdviseSink2;
interface AsyncIAdviseSink2 : AsyncIAdviseSink {
public extern(Windows):
	void Begin_OnLinkSrcChange(IMoniker pmk);
	void Finish_OnLinkSrcChange();
}
mixin DEFINE_IID!(AsyncIAdviseSink2, "00000151-0000-0000-C000-000000000046");

export extern(Windows){
	HRESULT AsyncIAdviseSink2_Begin_RemoteOnLinkSrcChange_Proxy(AsyncIAdviseSink2 This, IMoniker pmk);
	void AsyncIAdviseSink2_Begin_RemoteOnLinkSrcChange_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT AsyncIAdviseSink2_Finish_RemoteOnLinkSrcChange_Proxy(AsyncIAdviseSink2 This);
	void AsyncIAdviseSink2_Finish_RemoteOnLinkSrcChange_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

enum {
	DATADIR_GET = 1,
	DATADIR_SET = 2
}
alias int DATADIR;

//extern extern(C) const IID IID_IDataObject;
interface IDataObject : IUnknown {
public extern(Windows):
	HRESULT GetData(FORMATETC* pformatetcIn, STGMEDIUM* pmedium);
	HRESULT GetDataHere(FORMATETC* pformatetc, STGMEDIUM* pmedium);
	HRESULT QueryGetData(FORMATETC* pformatetc);
	HRESULT GetCanonicalFormatEtc(FORMATETC* pformatectIn, FORMATETC* pformatetcOut);
	HRESULT SetData(FORMATETC* pformatetc, STGMEDIUM* pmedium, BOOL fRelease);
	HRESULT EnumFormatEtc(DWORD dwDirection, IEnumFORMATETC* ppenumFormatEtc);
	HRESULT DAdvise(FORMATETC* pformatetc, DWORD advf, IAdviseSink pAdvSink, DWORD* pdwConnection);
	HRESULT DUnadvise(DWORD dwConnection);
	HRESULT EnumDAdvise(IEnumSTATDATA* ppenumAdvise);
}
mixin DEFINE_IID!(IDataObject, "0000010e-0000-0000-C000-000000000046");
alias IDataObject LPDATAOBJECT;

export extern(Windows){
	HRESULT IDataObject_RemoteGetData_Proxy(IDataObject This, FORMATETC* pformatetcIn, STGMEDIUM* pRemoteMedium);
	void IDataObject_RemoteGetData_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IDataObject_RemoteGetDataHere_Proxy(IDataObject This, FORMATETC* pformatetc, STGMEDIUM* pRemoteMedium);
	void IDataObject_RemoteGetDataHere_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IDataObject_RemoteSetData_Proxy(IDataObject This, FORMATETC* pformatetc, FLAG_STGMEDIUM* pmedium, BOOL fRelease);
	void IDataObject_RemoteSetData_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_IDataAdviseHolder;
interface IDataAdviseHolder : IUnknown {
public extern(Windows):
	HRESULT Advise(IDataObject pDataObject, FORMATETC* pFetc, DWORD advf, IAdviseSink pAdvise, DWORD* pdwConnection);
	HRESULT Unadvise(DWORD dwConnection);
	HRESULT EnumAdvise(IEnumSTATDATA* ppenumAdvise);
	HRESULT SendOnDataChange(IDataObject pDataObject, DWORD dwReserved, DWORD advf);
}
mixin DEFINE_IID!(IDataAdviseHolder, "00000110-0000-0000-C000-000000000046");
alias IDataAdviseHolder LPDATAADVISEHOLDER;

enum {
	CALLTYPE_TOPLEVEL             = 1,
	CALLTYPE_NESTED               = 2,
	CALLTYPE_ASYNC                = 3,
	CALLTYPE_TOPLEVEL_CALLPENDING = 4,
	CALLTYPE_ASYNC_CALLPENDING    = 5
}
alias int CALLTYPE;
enum {
	SERVERCALL_ISHANDLED  = 0,
	SERVERCALL_REJECTED   = 1,
	SERVERCALL_RETRYLATER = 2
}
alias int SERVERCALL;
enum {
	PENDINGTYPE_TOPLEVEL = 1,
	PENDINGTYPE_NESTED   = 2
}
alias int PENDINGTYPE;
enum {
	PENDINGMSG_CANCELCALL     = 0,
	PENDINGMSG_WAITNOPROCESS  = 1,
	PENDINGMSG_WAITDEFPROCESS = 2
}
alias int PENDINGMSG;
struct INTERFACEINFO {
	IUnknown pUnk;
	IID iid;
	WORD wMethod;
}
alias INTERFACEINFO* LPINTERFACEINFO;

//extern extern(C) const IID IID_IMessageFilter;
interface IMessageFilter : IUnknown {
public extern(Windows):
	DWORD HandleInComingCall(DWORD dwCallType, HTASK htaskCaller, DWORD dwTickCount, LPINTERFACEINFO lpInterfaceInfo);
	DWORD RetryRejectedCall(HTASK htaskCallee, DWORD dwTickCount, DWORD dwRejectType);
	DWORD MessagePending(HTASK htaskCallee, DWORD dwTickCount, DWORD dwPendingType);
}
mixin DEFINE_IID!(IMessageFilter, "00000016-0000-0000-C000-000000000046");
alias IMessageFilter LPMESSAGEFILTER;

alias uint RPCOLEDATAREP;
struct RPCOLEMESSAGE {
	void* reserved1;
	RPCOLEDATAREP dataRepresentation;
	void* Buffer;
	ULONG cbBuffer;
	ULONG iMethod;
	void*[5] reserved2;
	ULONG rpcFlags;
}
alias RPCOLEMESSAGE* PRPCOLEMESSAGE;

//extern extern(C) const IID IID_IRpcChannelBuffer;
interface IRpcChannelBuffer : IUnknown {
public extern(Windows):
	HRESULT GetBuffer(RPCOLEMESSAGE* pMessage, REFIID riid);
	HRESULT SendReceive(RPCOLEMESSAGE* pMessage, ULONG* pStatus);
	HRESULT FreeBuffer(RPCOLEMESSAGE* pMessage);
	HRESULT GetDestCtx(DWORD* pdwDestContext, void** ppvDestContext);
	HRESULT IsConnected();
}
mixin DEFINE_IID!(IRpcChannelBuffer, "D5F56B60-593B-101A-B569-08002B2DBF7A");

//extern extern(C) const IID IID_IRpcChannelBuffer2;
interface IRpcChannelBuffer2 : IRpcChannelBuffer {
public extern(Windows):
	HRESULT GetProtocolVersion(DWORD* pdwVersion);
}
mixin DEFINE_IID!(IRpcChannelBuffer2, "594f31d0-7f19-11d0-b194-00a0c90dc8bf");

//extern extern(C) const IID IID_IAsyncRpcChannelBuffer;
interface IAsyncRpcChannelBuffer : IRpcChannelBuffer2 {
public extern(Windows):
	HRESULT Send(RPCOLEMESSAGE* pMsg, ISynchronize pSync, ULONG* pulStatus);
	HRESULT Receive(RPCOLEMESSAGE* pMsg, ULONG* pulStatus);
	HRESULT GetDestCtxEx(RPCOLEMESSAGE* pMsg, DWORD* pdwDestContext, void** ppvDestContext);
}
mixin DEFINE_IID!(IAsyncRpcChannelBuffer, "a5029fb6-3c34-11d1-9c99-00c04fb998aa");

//extern extern(C) const IID IID_IRpcChannelBuffer3;
interface IRpcChannelBuffer3 : IRpcChannelBuffer2 {
public extern(Windows):
	HRESULT Send(RPCOLEMESSAGE* pMsg, ULONG* pulStatus);
	HRESULT Receive(RPCOLEMESSAGE* pMsg, ULONG ulSize, ULONG* pulStatus);
	HRESULT Cancel(RPCOLEMESSAGE* pMsg);
	HRESULT GetCallContext(RPCOLEMESSAGE* pMsg, REFIID riid, void** pInterface);
	HRESULT GetDestCtxEx(RPCOLEMESSAGE* pMsg, DWORD* pdwDestContext, void** ppvDestContext);
	HRESULT GetState(RPCOLEMESSAGE* pMsg, DWORD* pState);
	HRESULT RegisterAsync(RPCOLEMESSAGE* pMsg, IAsyncManager pAsyncMgr);
}
mixin DEFINE_IID!(IRpcChannelBuffer3, "25B15600-0115-11d0-BF0D-00AA00B8DFD2");

//extern extern(C) const IID IID_IRpcSyntaxNegotiate;
interface IRpcSyntaxNegotiate : IUnknown {
public extern(Windows):
	HRESULT NegotiateSyntax(RPCOLEMESSAGE* pMsg);
}
mixin DEFINE_IID!(IRpcSyntaxNegotiate, "58a08519-24c8-4935-b482-3fd823333a4f");

//extern extern(C) const IID IID_IRpcProxyBuffer;
interface IRpcProxyBuffer : IUnknown {
public extern(Windows):
	HRESULT Connect(IRpcChannelBuffer pRpcChannelBuffer);
	void Disconnect();
}
mixin DEFINE_IID!(IRpcProxyBuffer, "D5F56A34-593B-101A-B569-08002B2DBF7A");

//extern extern(C) const IID IID_IRpcStubBuffer;
interface IRpcStubBuffer : IUnknown {
public extern(Windows):
	HRESULT Connect(IUnknown pUnkServer);
	void Disconnect();
	HRESULT Invoke(RPCOLEMESSAGE* _prpcmsg, IRpcChannelBuffer _pRpcChannelBuffer);
	IRpcStubBuffer IsIIDSupported(REFIID riid);
	ULONG CountRefs();
	HRESULT DebugServerQueryInterface(void** ppv);
	void DebugServerRelease(void* pv);
}
mixin DEFINE_IID!(IRpcStubBuffer, "D5F56AFC-593B-101A-B569-08002B2DBF7A");

//extern extern(C) const IID IID_IPSFactoryBuffer;
interface IPSFactoryBuffer : IUnknown {
public extern(Windows):
	HRESULT CreateProxy(IUnknown pUnkOuter, REFIID riid, IRpcProxyBuffer* ppProxy, void** ppv);
	HRESULT CreateStub(REFIID riid, IUnknown pUnkServer, IRpcStubBuffer* ppStub);
}
mixin DEFINE_IID!(IPSFactoryBuffer, "D5F569D0-593B-101A-B569-08002B2DBF7A");

// This interface is only valid on Windows NT 4.0
struct SChannelHookCallInfo {
	IID iid;
	DWORD cbSize;
	GUID uCausality;
	DWORD dwServerPid;
	DWORD iMethod;
	void* pObject;
}

//extern extern(C) const IID IID_IChannelHook;
interface IChannelHook : IUnknown {
public extern(Windows):
	void ClientGetSize(REFGUID uExtent, REFIID riid, ULONG* pDataSize);
	void ClientFillBuffer(REFGUID uExtent, REFIID riid, ULONG* pDataSize, void* pDataBuffer);
	void ClientNotify(REFGUID uExtent, REFIID riid, ULONG cbDataSize, void* pDataBuffer, DWORD lDataRep, HRESULT hrFault);
	void ServerNotify(REFGUID uExtent, REFIID riid, ULONG cbDataSize, void* pDataBuffer, DWORD lDataRep);
	void ServerGetSize(REFGUID uExtent, REFIID riid, HRESULT hrFault, ULONG* pDataSize);
	void ServerFillBuffer(REFGUID uExtent, REFIID riid, ULONG* pDataSize, void* pDataBuffer, HRESULT hrFault);
}
mixin DEFINE_IID!(IChannelHook, "1008c4a0-7613-11cf-9af1-0020af6e72f4");

extern const FMTID FMTID_SummaryInformation;
extern const FMTID FMTID_DocSummaryInformation;
extern const FMTID FMTID_UserDefinedProperties;
extern const FMTID FMTID_DiscardableInformation;
extern const FMTID FMTID_ImageSummaryInformation;
extern const FMTID FMTID_AudioSummaryInformation;
extern const FMTID FMTID_VideoSummaryInformation;
extern const FMTID FMTID_MediaFileSummaryInformation;

struct SOLE_AUTHENTICATION_SERVICE {
	DWORD dwAuthnSvc;
	DWORD dwAuthzSvc;
	OLECHAR* pPrincipalName;
	HRESULT hr;
}
alias SOLE_AUTHENTICATION_SERVICE* PSOLE_AUTHENTICATION_SERVICE;

enum {
	EOAC_NONE              = 0,
	EOAC_MUTUAL_AUTH       = 0x1,
	EOAC_STATIC_CLOAKING   = 0x20,
	EOAC_DYNAMIC_CLOAKING  = 0x40,
	EOAC_ANY_AUTHORITY     = 0x80,
	EOAC_MAKE_FULLSIC      = 0x100,
	EOAC_DEFAULT           = 0x800,
	EOAC_SECURE_REFS       = 0x2,
	EOAC_ACCESS_CONTROL    = 0x4,
	EOAC_APPID             = 0x8,
	EOAC_DYNAMIC           = 0x10,
	EOAC_REQUIRE_FULLSIC   = 0x200,
	EOAC_AUTO_IMPERSONATE  = 0x400,
	EOAC_NO_CUSTOM_MARSHAL = 0x2000,
	EOAC_DISABLE_AAA       = 0x1000
}
alias int EOLE_AUTHENTICATION_CAPABILITIES;

const OLECHAR* COLE_DEFAULT_PRINCIPAL = cast(OLECHAR*)-1;
const void* COLE_DEFAULT_AUTHINFO = cast(void*)-1;

struct SOLE_AUTHENTICATION_INFO {
	DWORD dwAuthnSvc;
	DWORD dwAuthzSvc;
	void* pAuthInfo;
}
alias SOLE_AUTHENTICATION_INFO* PSOLE_AUTHENTICATION_INFO;
struct SOLE_AUTHENTICATION_LIST {
	DWORD cAuthInfo;
	SOLE_AUTHENTICATION_INFO* aAuthInfo;
}
alias SOLE_AUTHENTICATION_LIST* PSOLE_AUTHENTICATION_LIST;

//extern extern(C) const IID IID_IClientSecurity;
interface IClientSecurity : IUnknown {
public extern(Windows):
	HRESULT QueryBlanket(IUnknown pProxy, DWORD* pAuthnSvc, DWORD* pAuthzSvc, OLECHAR** pServerPrincName, DWORD* pAuthnLevel, DWORD* pImpLevel, void** pAuthInfo, DWORD* pCapabilites);
	HRESULT SetBlanket(IUnknown pProxy, DWORD dwAuthnSvc, DWORD dwAuthzSvc, OLECHAR* pServerPrincName, DWORD dwAuthnLevel, DWORD dwImpLevel, void* pAuthInfo, DWORD dwCapabilities);
	HRESULT CopyProxy(IUnknown pProxy, IUnknown* ppCopy);
}
mixin DEFINE_IID!(IClientSecurity, "0000013D-0000-0000-C000-000000000046");

//extern extern(C) const IID IID_IServerSecurity;
interface IServerSecurity : IUnknown {
public extern(Windows):
	HRESULT QueryBlanket(DWORD* pAuthnSvc, DWORD* pAuthzSvc, OLECHAR** pServerPrincName, DWORD* pAuthnLevel, DWORD* pImpLevel, void** pPrivs, DWORD* pCapabilities);
	HRESULT ImpersonateClient();
	HRESULT RevertToSelf();
	BOOL IsImpersonating();
}
mixin DEFINE_IID!(IServerSecurity, "0000013E-0000-0000-C000-000000000046");

//extern extern(C) const IID IID_IClassActivator;
interface IClassActivator : IUnknown {
public extern(Windows):
	HRESULT GetClassObject(REFCLSID rclsid, DWORD dwClassContext, LCID locale, REFIID riid, void** ppv);
}
mixin DEFINE_IID!(IClassActivator, "00000140-0000-0000-C000-000000000046");

enum {
	COMBND_RPCTIMEOUT      = 0x1,
	COMBND_SERVER_LOCALITY = 0x2
}
alias int RPCOPT_PROPERTIES;
enum {
	SERVER_LOCALITY_PROCESS_LOCAL = 0,
	SERVER_LOCALITY_MACHINE_LOCAL = 1,
	SERVER_LOCALITY_REMOTE        = 2
}
alias int RPCOPT_SERVER_LOCALITY_VALUES;

//extern extern(C) const IID IID_IRpcOptions;
interface IRpcOptions : IUnknown {
public extern(Windows):
	HRESULT Set(IUnknown pPrx, RPCOPT_PROPERTIES dwProperty, ULONG_PTR dwValue);
	HRESULT Query(IUnknown pPrx, RPCOPT_PROPERTIES dwProperty, ULONG_PTR* pdwValue);
}
mixin DEFINE_IID!(IRpcOptions, "00000144-0000-0000-C000-000000000046");

enum {
	COMGLB_EXCEPTION_HANDLING     = 1,
	COMGLB_APPID                  = 2,
	COMGLB_RPC_THREADPOOL_SETTING = 3
}
alias int GLOBALOPT_PROPERTIES;

enum {
	COMGLB_EXCEPTION_HANDLE             = 0,
	COMGLB_EXCEPTION_DONOT_HANDLE_FATAL = 1,
	COMGLB_EXCEPTION_DONOT_HANDLE       = COMGLB_EXCEPTION_DONOT_HANDLE_FATAL,
	COMGLB_EXCEPTION_DONOT_HANDLE_ANY   = 2
}
alias int GLOBALOPT_EH_VALUES;

enum {
	COMGLB_RPC_THREADPOOL_SETTING_DEFAULT_POOL = 0,
	COMGLB_RPC_THREADPOOL_SETTING_PRIVATE_POOL = 1
}
alias int GLOBALOPT_RPCTP_VALUES;

//extern extern(C) const IID IID_IGlobalOptions;
interface IGlobalOptions : IUnknown {
public extern(Windows):
	HRESULT Set(GLOBALOPT_PROPERTIES dwProperty, ULONG_PTR dwValue);
	HRESULT Query(GLOBALOPT_PROPERTIES dwProperty, ULONG_PTR* pdwValue);
}
mixin DEFINE_IID!(IGlobalOptions, "0000015B-0000-0000-C000-000000000046");

//extern extern(C) const IID IID_IFillLockBytes;
interface IFillLockBytes : IUnknown {
public extern(Windows):
	HRESULT FillAppend(const(void)* pv, ULONG cb, ULONG* pcbWritten);
	HRESULT FillAt(ULARGE_INTEGER ulOffset, const(void)* pv, ULONG cb, ULONG* pcbWritten);
	HRESULT SetFillSize(ULARGE_INTEGER ulSize);
	HRESULT Terminate(BOOL bCanceled);
}
mixin DEFINE_IID!(IFillLockBytes, "99caf010-415e-11cf-8814-00aa00b569f5");

export extern(Windows){
	HRESULT IFillLockBytes_RemoteFillAppend_Proxy(IFillLockBytes This, const(byte)* pv, ULONG cb, ULONG* pcbWritten);
	void IFillLockBytes_RemoteFillAppend_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IFillLockBytes_RemoteFillAt_Proxy(IFillLockBytes This, ULARGE_INTEGER ulOffset, const(byte)* pv, ULONG cb, ULONG* pcbWritten);
	void IFillLockBytes_RemoteFillAt_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_IProgressNotify;
interface IProgressNotify : IUnknown {
public extern(Windows):
	HRESULT OnProgress(DWORD dwProgressCurrent, DWORD dwProgressMaximum, BOOL fAccurate, BOOL fOwner);
}
mixin DEFINE_IID!(IProgressNotify, "a9d758a0-4617-11cf-95fc-00aa00680db4");

struct StorageLayout {
	DWORD LayoutType;
	OLECHAR* pwcsElementName;
	LARGE_INTEGER cOffset;
	LARGE_INTEGER cBytes;
}

//extern extern(C) const IID IID_ILayoutStorage;
interface ILayoutStorage : IUnknown {
public extern(Windows):
	extern(Windows) HRESULT LayoutScript(StorageLayout pStorageLayout, DWORD nEntries, DWORD glfInterleavedFlag);
	extern(Windows) HRESULT BeginMonitor();
	extern(Windows) HRESULT EndMonitor();
	extern(Windows) HRESULT ReLayoutDocfile(OLECHAR* pwcsNewDfName);
	extern(Windows) HRESULT ReLayoutDocfileOnILockBytes(ILockBytes pILockBytes);
}
mixin DEFINE_IID!(ILayoutStorage, "0e6d4d90-6738-11cf-9608-00aa00680db4");

//extern extern(C) const IID IID_IBlockingLock;
interface IBlockingLock : IUnknown {
public extern(Windows):
	HRESULT Lock(DWORD dwTimeout);
	HRESULT Unlock();
}
mixin DEFINE_IID!(IBlockingLock, "30f3d47a-6447-11d1-8e3c-00c04fb9386d");

//extern extern(C) const IID IID_ITimeAndNoticeControl;
interface ITimeAndNoticeControl : IUnknown {
public extern(Windows):
	HRESULT SuppressChanges(DWORD res1, DWORD res2);
}
mixin DEFINE_IID!(ITimeAndNoticeControl, "bc0bf6ae-8878-11d1-83e9-00c04fc2c6d4");

//extern extern(C) const IID IID_IOplockStorage;
interface IOplockStorage : IUnknown {
public extern(Windows):
	HRESULT CreateStorageEx(LPCWSTR pwcsName, DWORD grfMode, DWORD stgfmt, DWORD grfAttrs, REFIID riid, void** ppstgOpen);
	HRESULT OpenStorageEx(LPCWSTR pwcsName, DWORD grfMode, DWORD stgfmt, DWORD grfAttrs, REFIID riid, void** ppstgOpen);
}
mixin DEFINE_IID!(IOplockStorage, "8d19c834-8879-11d1-83e9-00c04fc2c6d4");

//extern extern(C) const IID IID_ISurrogate;
interface ISurrogate : IUnknown {
public extern(Windows):
	HRESULT LoadDllServer(REFCLSID Clsid);
	HRESULT FreeSurrogate();
}
mixin DEFINE_IID!(ISurrogate, "00000022-0000-0000-C000-000000000046");
alias ISurrogate LPSURROGATE;

//extern extern(C) const IID IID_IGlobalInterfaceTable;
interface IGlobalInterfaceTable : IUnknown {
public extern(Windows):
	HRESULT RegisterInterfaceInGlobal(IUnknown pUnk, REFIID riid, DWORD* pdwCookie);
	HRESULT RevokeInterfaceFromGlobal(DWORD dwCookie);
	HRESULT GetInterfaceFromGlobal(DWORD dwCookie, REFIID riid, void** ppv);
}
mixin DEFINE_IID!(IGlobalInterfaceTable, "00000146-0000-0000-C000-000000000046");
alias IGlobalInterfaceTable LPGLOBALINTERFACETABLE;

//extern extern(C) const IID IID_IDirectWriterLock;
interface IDirectWriterLock : IUnknown {
public extern(Windows):
	HRESULT WaitForWriteAccess(DWORD dwTimeout);
	HRESULT ReleaseWriteAccess();
	HRESULT HaveWriteAccess();
}
mixin DEFINE_IID!(IDirectWriterLock, "0e6d4d92-6738-11cf-9608-00aa00680db4");

//extern extern(C) const IID IID_ISynchronize;
interface ISynchronize : IUnknown {
public extern(Windows):
	HRESULT Wait(DWORD dwFlags, DWORD dwMilliseconds);
	HRESULT Signal();
	HRESULT Reset();
}
mixin DEFINE_IID!(ISynchronize, "00000030-0000-0000-C000-000000000046");

//extern extern(C) const IID IID_ISynchronizeHandle;
interface ISynchronizeHandle : IUnknown {
public extern(Windows):
	HRESULT GetHandle(HANDLE* ph);
}
mixin DEFINE_IID!(ISynchronizeHandle, "00000031-0000-0000-C000-000000000046");

//extern extern(C) const IID IID_ISynchronizeEvent;
interface ISynchronizeEvent : ISynchronizeHandle {
public extern(Windows):
	HRESULT SetEventHandle(HANDLE* ph);
}
mixin DEFINE_IID!(ISynchronizeEvent, "00000032-0000-0000-C000-000000000046");

//extern extern(C) const IID IID_ISynchronizeContainer;
interface ISynchronizeContainer : IUnknown {
public extern(Windows):
	HRESULT AddSynchronize(ISynchronize pSync);
	HRESULT WaitMultiple(DWORD dwFlags, DWORD dwTimeOut, ISynchronize* ppSync);
}
mixin DEFINE_IID!(ISynchronizeContainer, "00000033-0000-0000-C000-000000000046");

//extern extern(C) const IID IID_ISynchronizeMutex;
interface ISynchronizeMutex : ISynchronize {
public extern(Windows):
	HRESULT ReleaseMutex();
}
mixin DEFINE_IID!(ISynchronizeMutex, "00000025-0000-0000-C000-000000000046");

//extern extern(C) const IID IID_ICancelMethodCalls;
interface ICancelMethodCalls : IUnknown {
public extern(Windows):
	HRESULT Cancel(ULONG ulSeconds);
	HRESULT TestCancel();
}
mixin DEFINE_IID!(ICancelMethodCalls, "00000029-0000-0000-C000-000000000046");
alias ICancelMethodCalls LPCANCELMETHODCALLS;

enum {
	DCOM_NONE          = 0,
	DCOM_CALL_COMPLETE = 0x1,
	DCOM_CALL_CANCELED = 0x2
}
alias int DCOM_CALL_STATE;

//extern extern(C) const IID IID_IAsyncManager;
interface IAsyncManager : IUnknown {
public extern(Windows):
	HRESULT CompleteCall(HRESULT Result);
	HRESULT GetCallContext(REFIID riid, void** pInterface);
	HRESULT GetState(ULONG* pulStateFlags);
}
mixin DEFINE_IID!(IAsyncManager, "0000002A-0000-0000-C000-000000000046");

//extern extern(C) const IID IID_ICallFactory;
interface ICallFactory : IUnknown {
public extern(Windows):
	HRESULT CreateCall(REFIID riid, IUnknown pCtrlUnk, REFIID riid2, IUnknown* ppv);
}
mixin DEFINE_IID!(ICallFactory, "1c733a30-2a1c-11ce-ade5-00aa0044773d");

//extern extern(C) const IID IID_IRpcHelper;
interface IRpcHelper : IUnknown {
public extern(Windows):
	HRESULT GetDCOMProtocolVersion(DWORD* pComVersion);
	HRESULT GetIIDFromOBJREF(void* pObjRef, IID** piid);
}
mixin DEFINE_IID!(IRpcHelper, "00000149-0000-0000-C000-000000000046");

//extern extern(C) const IID IID_IReleaseMarshalBuffers;
interface IReleaseMarshalBuffers : IUnknown {
public extern(Windows):
	HRESULT ReleaseMarshalBuffer(RPCOLEMESSAGE* pMsg, DWORD dwFlags, IUnknown pChnl);
}
mixin DEFINE_IID!(IReleaseMarshalBuffers, "eb0cb9e8-7996-11d2-872e-0000f8080859");

//extern extern(C) const IID IID_IWaitMultiple;
interface IWaitMultiple : IUnknown {
public extern(Windows):
	HRESULT WaitMultiple(DWORD timeout, ISynchronize* pSync);
	HRESULT AddSynchronize(ISynchronize pSync);
}
mixin DEFINE_IID!(IWaitMultiple, "0000002B-0000-0000-C000-000000000046");

//extern extern(C) const IID IID_IUrlMon;
interface IUrlMon : IUnknown {
public extern(Windows):
	HRESULT AsyncGetClassBits(REFCLSID rclsid, LPCWSTR pszTYPE, LPCWSTR pszExt, DWORD dwFileVersionMS, DWORD dwFileVersionLS, LPCWSTR pszCodeBase, IBindCtx pbc, DWORD dwClassContext, REFIID riid, DWORD flags);
}
mixin DEFINE_IID!(IUrlMon, "00000026-0000-0000-C000-000000000046");

//extern extern(C) const IID IID_IForegroundTransfer;
interface IForegroundTransfer : IUnknown {
public extern(Windows):
	HRESULT AllowForegroundTransfer(void* lpvReserved);
}
mixin DEFINE_IID!(IForegroundTransfer, "00000145-0000-0000-C000-000000000046");

//extern extern(C) const IID IID_IAddrTrackingControl;
interface IAddrTrackingControl : IUnknown {
public extern(Windows):
	HRESULT EnableCOMDynamicAddrTracking();
	HRESULT DisableCOMDynamicAddrTracking();
}
mixin DEFINE_IID!(IAddrTrackingControl, "00000147-0000-0000-C000-000000000046");
alias IAddrTrackingControl LPADDRTRACKINGCONTROL;

//extern extern(C) const IID IID_IAddrExclusionControl;
interface IAddrExclusionControl : IUnknown {
public extern(Windows):
	HRESULT GetCurrentAddrExclusionList(REFIID riid, void** ppEnumerator);
	HRESULT UpdateAddrExclusionList(IUnknown pEnumerator);
}
mixin DEFINE_IID!(IAddrExclusionControl, "00000148-0000-0000-C000-000000000046");
alias IAddrExclusionControl LPADDREXCLUSIONCONTROL;

//extern extern(C) const IID IID_IPipeByte;
interface IPipeByte : IUnknown {
public extern(Windows):
	HRESULT Pull(BYTE* buf, ULONG cRequest, ULONG* pcReturned);
	HRESULT Push(BYTE* buf, ULONG cSent);
}
mixin DEFINE_IID!(IPipeByte, "DB2F3ACA-2F86-11d1-8E04-00C04FB9989A");

//extern extern(C) const IID IID_AsyncIPipeByte;
interface AsyncIPipeByte : IUnknown {
public extern(Windows):
	HRESULT Begin_Pull(ULONG cRequest);
	HRESULT Finish_Pull(BYTE* buf, ULONG* pcReturned);
	HRESULT Begin_Push(BYTE* buf, ULONG cSent);
	HRESULT Finish_Push();
}
mixin DEFINE_IID!(AsyncIPipeByte, "DB2F3ACB-2F86-11d1-8E04-00C04FB9989A");

//extern extern(C) const IID IID_IPipeLong;
interface IPipeLong : IUnknown {
public extern(Windows):
	HRESULT Pull(LONG* buf, ULONG cRequest, ULONG* pcReturned);
	HRESULT Push(LONG* buf, ULONG cSent);
}
mixin DEFINE_IID!(IPipeLong, "DB2F3ACC-2F86-11d1-8E04-00C04FB9989A");

//extern extern(C) const IID IID_AsyncIPipeLong;
interface AsyncIPipeLong : IUnknown {
public extern(Windows):
	HRESULT Begin_Pull(ULONG cRequest);
	HRESULT Finish_Pull(LONG* buf, ULONG* pcReturned);
	HRESULT Begin_Push(LONG* buf, ULONG cSent);
	HRESULT Finish_Push();
}
mixin DEFINE_IID!(AsyncIPipeLong, "DB2F3ACD-2F86-11d1-8E04-00C04FB9989A");

//extern extern(C) const IID IID_IPipeDouble;
interface IPipeDouble : IUnknown {
public extern(Windows):
	HRESULT Pull(DOUBLE* buf, ULONG cRequest, ULONG* pcReturned);
	HRESULT Push(DOUBLE* buf, ULONG cSent);
}
mixin DEFINE_IID!(IPipeDouble, "DB2F3ACE-2F86-11d1-8E04-00C04FB9989A");

//extern extern(C) const IID IID_AsyncIPipeDouble;
interface AsyncIPipeDouble : IUnknown {
public extern(Windows):
	HRESULT Begin_Pull(ULONG cRequest);
	HRESULT Finish_Pull(DOUBLE* buf, ULONG* pcReturned);
	HRESULT Begin_Push(DOUBLE* buf, ULONG cSent);
	HRESULT Finish_Push();
}
mixin DEFINE_IID!(AsyncIPipeDouble, "DB2F3ACF-2F86-11d1-8E04-00C04FB9989A");

//extern extern(C) const IID IID_IThumbnailExtractor;
interface IThumbnailExtractor : IUnknown {
public extern(Windows):
	HRESULT ExtractThumbnail(IStorage pStg, ULONG ulLength, ULONG ulHeight, ULONG* pulOutputLength, ULONG* pulOutputHeight, HBITMAP* phOutputBitmap);
	HRESULT OnFileUpdated(IStorage pStg);
}
mixin DEFINE_IID!(IThumbnailExtractor, "969dc708-5c76-11d1-8d86-0000f804b057");

//extern extern(C) const IID IID_IDummyHICONIncluder;
interface IDummyHICONIncluder : IUnknown {
public extern(Windows):
	HRESULT Dummy(HICON h1, HDC h2);
}
mixin DEFINE_IID!(IDummyHICONIncluder, "947990de-cc28-11d2-a0f7-00805f858fb1");

alias DWORD CPFLAGS;
struct ContextProperty {
	GUID policyId;
	CPFLAGS flags;
	IUnknown pUnk;
}

//extern extern(C) const IID IID_IEnumContextProps;
interface IEnumContextProps : IUnknown {
public extern(Windows):
	HRESULT Next(ULONG celt, ContextProperty* pContextProperties, ULONG* pceltFetched);
	HRESULT Skip(ULONG celt);
	HRESULT Reset();
	HRESULT Clone(IEnumContextProps* ppEnumContextProps);
	HRESULT Count(ULONG* pcelt);
}
mixin DEFINE_IID!(IEnumContextProps, "000001c1-0000-0000-C000-000000000046");
alias IEnumContextProps LPENUMCONTEXTPROPS;

//extern extern(C) const IID IID_IContext;
interface IContext : IUnknown {
public extern(Windows):
	HRESULT SetProperty(REFGUID rpolicyId, CPFLAGS flags, IUnknown pUnk);
	HRESULT RemoveProperty(REFGUID rPolicyId);
	HRESULT GetProperty(REFGUID rGuid, CPFLAGS* pFlags, IUnknown* ppUnk);
	HRESULT EnumContextProps(IEnumContextProps* ppEnumContextProps);
}
mixin DEFINE_IID!(IContext, "000001c0-0000-0000-C000-000000000046");

//extern extern(C) const IID IID_IObjContext;
interface IObjContext : IContext {
public extern(Windows):
	void Reserved1();
	void Reserved2();
	void Reserved3();
	void Reserved4();
	void Reserved5();
	void Reserved6();
	void Reserved7();
}
mixin DEFINE_IID!(IObjContext, "000001c6-0000-0000-C000-000000000046");

enum {
	ServerApplication  = 0,
	LibraryApplication = ServerApplication + 1
}
alias int ApplicationType;

enum {
	IdleShutdown   = 0,
	ForcedShutdown = IdleShutdown + 1,
}
alias int ShutdownType;

//extern extern(C) const IID IID_IProcessLock;
interface IProcessLock : IUnknown {
public extern(Windows):
	ULONG AddRefOnProcess();
	ULONG ReleaseRefOnProcess();
}
mixin DEFINE_IID!(IProcessLock, "000001d5-0000-0000-C000-000000000046");

//extern extern(C) const IID IID_ISurrogateService;
interface ISurrogateService : IUnknown {
public extern(Windows):
	HRESULT Init(REFGUID rguidProcessID, IProcessLock pProcessLock, BOOL* pfApplicationAware);
	HRESULT ApplicationLaunch(REFGUID rguidApplID, ApplicationType appType);
	HRESULT ApplicationFree(REFGUID rguidApplID);
	HRESULT CatalogRefresh(ULONG ulReserved);
	HRESULT ProcessShutdown(ShutdownType shutdownType);
}
mixin DEFINE_IID!(ISurrogateService, "000001d4-0000-0000-C000-000000000046");

enum {
	APTTYPEQUALIFIER_NONE               = 0,
	APTTYPEQUALIFIER_IMPLICIT_MTA       = 1,
	APTTYPEQUALIFIER_NA_ON_MTA          = 2,
	APTTYPEQUALIFIER_NA_ON_STA          = 3,
	APTTYPEQUALIFIER_NA_ON_IMPLICIT_MTA = 4,
	APTTYPEQUALIFIER_NA_ON_MAINSTA      = 5
}
alias int APTTYPEQUALIFIER;

enum {
	APTTYPE_CURRENT = -1,
	APTTYPE_STA     = 0,
	APTTYPE_MTA     = 1,
	APTTYPE_NA      = 2,
	APTTYPE_MAINSTA = 3
}
alias int APTTYPE;

enum {
	THDTYPE_BLOCKMESSAGES   = 0,
	THDTYPE_PROCESSMESSAGES = 1
}
alias int THDTYPE;

alias DWORD APARTMENTID;

//extern extern(C) const IID IID_IComThreadingInfo;
interface IComThreadingInfo : IUnknown {
public extern(Windows):
	HRESULT GetCurrentApartmentType(APTTYPE* pAptType);
	HRESULT GetCurrentThreadType(THDTYPE* pThreadType);
	HRESULT GetCurrentLogicalThreadId(GUID* pguidLogicalThreadId);
	HRESULT SetCurrentLogicalThreadId(REFGUID rguid);
}
mixin DEFINE_IID!(IComThreadingInfo, "000001ce-0000-0000-C000-000000000046");

//extern extern(C) const IID IID_IProcessInitControl;
interface IProcessInitControl : IUnknown {
public extern(Windows):
	HRESULT ResetInitializerTimeout(DWORD dwSecondsRemaining);
}
mixin DEFINE_IID!(IProcessInitControl, "72380d55-8d2b-43a3-8513-2b6ef31434e9");

//extern extern(C) const IID IID_IInitializeSpy;
interface IInitializeSpy : IUnknown {
public extern(Windows):
	HRESULT PreInitialize(DWORD dwCoInit,  DWORD dwCurThreadAptRefs);
	HRESULT PostInitialize(HRESULT hrCoInit, DWORD dwCoInit, DWORD dwNewThreadAptRefs);
	HRESULT PreUninitialize(DWORD dwCurThreadAptRefs);
	HRESULT PostUninitialize(DWORD dwNewThreadAptRefs);
}
mixin DEFINE_IID!(IInitializeSpy, "00000034-0000-0000-C000-000000000046");
alias IInitializeSpy LPINITIALIZESPY;

export extern(Windows){
	uint ASYNC_STGMEDIUM_UserSize(uint*, uint, ASYNC_STGMEDIUM*);
	ubyte* ASYNC_STGMEDIUM_UserMarshal(uint*, ubyte*, ASYNC_STGMEDIUM*);
	ubyte* ASYNC_STGMEDIUM_UserUnmarshal(uint*, ubyte*, ASYNC_STGMEDIUM*);
	void ASYNC_STGMEDIUM_UserFree(uint*, ASYNC_STGMEDIUM*); 
	uint CLIPFORMAT_UserSize(uint*, uint, CLIPFORMAT*);
	ubyte* CLIPFORMAT_UserMarshal(uint*, ubyte*, CLIPFORMAT*);
	ubyte* CLIPFORMAT_UserUnmarshal(uint*, ubyte*, CLIPFORMAT*);
	void CLIPFORMAT_UserFree(uint*, CLIPFORMAT*);
	uint FLAG_STGMEDIUM_UserSize(uint*, uint, FLAG_STGMEDIUM*);
	ubyte* FLAG_STGMEDIUM_UserMarshal(uint*, ubyte*, FLAG_STGMEDIUM*);
	ubyte* FLAG_STGMEDIUM_UserUnmarshal(uint*, ubyte*, FLAG_STGMEDIUM*);
	void FLAG_STGMEDIUM_UserFree(uint*, FLAG_STGMEDIUM*);
	uint HBITMAP_UserSize(uint*, uint, HBITMAP*);
	ubyte* HBITMAP_UserMarshal(uint*, ubyte*, HBITMAP*);
	ubyte* HBITMAP_UserUnmarshal(uint*, ubyte*, HBITMAP*); 
	void HBITMAP_UserFree(uint*, HBITMAP*);
	uint HDC_UserSize(uint*, uint, HDC*);
	ubyte* HDC_UserMarshal(uint*, ubyte*, HDC*);
	ubyte*  HDC_UserUnmarshal(uint*, ubyte*, HDC*);
	void HDC_UserFree(uint*, HDC*);
	uint HICON_UserSize(uint*, uint, HICON*);
	ubyte* HICON_UserMarshal(uint*, ubyte*, HICON*);
	ubyte* HICON_UserUnmarshal(uint*, ubyte*, HICON*);
	void HICON_UserFree(uint*, HICON*);
	uint SNB_UserSize(uint*, uint, SNB*);
	ubyte* SNB_UserMarshal(uint*, ubyte*, SNB*);
	ubyte* SNB_UserUnmarshal(uint*, ubyte*, SNB*);
	void SNB_UserFree(uint*, SNB*);
	uint STGMEDIUM_UserSize(uint*, uint, STGMEDIUM*);
	ubyte* STGMEDIUM_UserMarshal(uint*, ubyte*, STGMEDIUM*);
	ubyte* STGMEDIUM_UserUnmarshal(uint*,ubyte*, STGMEDIUM*);
	void STGMEDIUM_UserFree(uint*, STGMEDIUM*);
	uint ASYNC_STGMEDIUM_UserSize64(uint*, uint, ASYNC_STGMEDIUM*);
	ubyte* ASYNC_STGMEDIUM_UserMarshal64(uint*, ubyte*, ASYNC_STGMEDIUM*);
	ubyte* ASYNC_STGMEDIUM_UserUnmarshal64(uint*, ubyte*, ASYNC_STGMEDIUM*);
	void ASYNC_STGMEDIUM_UserFree64(uint*, ASYNC_STGMEDIUM*);
	uint CLIPFORMAT_UserSize64(uint*, uint, CLIPFORMAT*);
	ubyte* CLIPFORMAT_UserMarshal64(uint*, ubyte*, CLIPFORMAT*);
	ubyte* CLIPFORMAT_UserUnmarshal64(uint*, ubyte*, CLIPFORMAT*);
	void CLIPFORMAT_UserFree64(uint*, CLIPFORMAT*);
	uint FLAG_STGMEDIUM_UserSize64(uint*, uint, FLAG_STGMEDIUM*);
	ubyte* FLAG_STGMEDIUM_UserMarshal64(uint*, ubyte*, FLAG_STGMEDIUM*);
	ubyte* FLAG_STGMEDIUM_UserUnmarshal64(uint*, ubyte*, FLAG_STGMEDIUM*);
	void FLAG_STGMEDIUM_UserFree64(uint*, FLAG_STGMEDIUM*);
	uint HBITMAP_UserSize64(uint*, uint, HBITMAP*);
	ubyte* HBITMAP_UserMarshal64(uint*, ubyte*, HBITMAP*);
	ubyte* HBITMAP_UserUnmarshal64(uint*, ubyte*, HBITMAP*); 
	void HBITMAP_UserFree64(uint*, HBITMAP*);
	uint HDC_UserSize64(uint*, uint, HDC*);
	ubyte* HDC_UserMarshal64(uint*, ubyte*, HDC*);
	ubyte* HDC_UserUnmarshal64(uint*, ubyte*, HDC*);
	void HDC_UserFree64(uint*, HDC*);
	uint HICON_UserSize64(uint*, uint, HICON*);
	ubyte* HICON_UserMarshal64(uint*, ubyte*, HICON*); 
	ubyte* HICON_UserUnmarshal64(uint*, ubyte*, HICON*);
	void HICON_UserFree64(uint*, HICON*);
	uint SNB_UserSize64(uint*, uint, SNB*);
	ubyte* SNB_UserMarshal64(uint*, ubyte*, SNB*);
	ubyte* SNB_UserUnmarshal64(uint*, ubyte*, SNB*);
	void SNB_UserFree64(uint*, SNB*);
	uint STGMEDIUM_UserSize64(uint*, uint, STGMEDIUM*);
	ubyte* STGMEDIUM_UserMarshal64(uint*, ubyte*, STGMEDIUM*);
	ubyte* STGMEDIUM_UserUnmarshal64(uint*, ubyte*, STGMEDIUM*);
	void STGMEDIUM_UserFree64(uint*, STGMEDIUM*);
}

export extern(Windows){
	HRESULT IEnumUnknown_Next_Proxy(IEnumUnknown This, ULONG celt, IUnknown* rgelt, ULONG* pceltFetched);
	HRESULT IEnumUnknown_Next_Stub(IEnumUnknown This, ULONG celt, IUnknown* rgelt, ULONG* pceltFetched);
	HRESULT IBindCtx_SetBindOptions_Proxy(IBindCtx This, BIND_OPTS* pbindopts);
	HRESULT IBindCtx_SetBindOptions_Stub(IBindCtx This, BIND_OPTS2* pbindopts);
	HRESULT IBindCtx_GetBindOptions_Proxy(IBindCtx This, BIND_OPTS* pbindopts);
	HRESULT IBindCtx_GetBindOptions_Stub(IBindCtx This, BIND_OPTS2* pbindopts);
	HRESULT IEnumMoniker_Next_Proxy(IEnumMoniker This, ULONG celt, IMoniker* rgelt, ULONG* pceltFetched);
	HRESULT IEnumMoniker_Next_Stub(IEnumMoniker This, ULONG celt, IMoniker* rgelt, ULONG* pceltFetched);
	BOOL IRunnableObject_IsRunning_Proxy(IRunnableObject This);
	HRESULT IRunnableObject_IsRunning_Stub(IRunnableObject This);
	HRESULT IMoniker_BindToObject_Proxy(IMoniker This, IBindCtx pbc, IMoniker pmkToLeft, REFIID riidResult, void** ppvResult);
	HRESULT IMoniker_BindToObject_Stub(IMoniker This, IBindCtx pbc, IMoniker pmkToLeft, REFIID riidResult, IUnknown* ppvResult);
	HRESULT IMoniker_BindToStorage_Proxy(IMoniker This, IBindCtx pbc, IMoniker pmkToLeft, REFIID riid, void** ppvObj);
	HRESULT IMoniker_BindToStorage_Stub(IMoniker This, IBindCtx pbc, IMoniker pmkToLeft, REFIID riid, IUnknown* ppvObj);
	HRESULT IEnumString_Next_Proxy(IEnumString This, ULONG celt, LPOLESTR* rgelt, ULONG* pceltFetched);
	HRESULT IEnumString_Next_Stub(IEnumString This, ULONG celt, LPOLESTR* rgelt, ULONG* pceltFetched);
	HRESULT ISequentialStream_Read_Proxy(ISequentialStream This, void* pv, ULONG cb, ULONG* pcbRead);
	HRESULT ISequentialStream_Read_Stub(ISequentialStream This, byte* pv, ULONG cb, ULONG* pcbRead);
	HRESULT ISequentialStream_Write_Proxy(ISequentialStream This, const(void)* pv, ULONG cb, ULONG* pcbWritten);
	HRESULT ISequentialStream_Write_Stub(ISequentialStream This, const(byte)* pv, ULONG cb, ULONG* pcbWritten);
	HRESULT IStream_Seek_Proxy(IStream This, LARGE_INTEGER dlibMove, DWORD dwOrigin, ULARGE_INTEGER* plibNewPosition);
	HRESULT IStream_Seek_Stub(IStream This, LARGE_INTEGER dlibMove, DWORD dwOrigin, ULARGE_INTEGER* plibNewPosition);
	HRESULT IStream_CopyTo_Proxy(IStream This, IStream pstm, ULARGE_INTEGER cb, ULARGE_INTEGER* pcbRead, ULARGE_INTEGER* pcbWritten);
	HRESULT IStream_CopyTo_Stub(IStream This, IStream pstm, ULARGE_INTEGER cb, ULARGE_INTEGER* pcbRead, ULARGE_INTEGER* pcbWritten);
	HRESULT IEnumSTATSTG_Next_Proxy(IEnumSTATSTG This, ULONG celt, STATSTG* rgelt, ULONG* pceltFetched);
	HRESULT IEnumSTATSTG_Next_Stub(IEnumSTATSTG This, ULONG celt, STATSTG* rgelt, ULONG* pceltFetched);
	HRESULT IStorage_OpenStream_Proxy(IStorage This, const(OLECHAR)* pwcsName, void* reserved1, DWORD grfMode, DWORD reserved2, IStream* ppstm);
	HRESULT IStorage_OpenStream_Stub(IStorage This, const(OLECHAR)* pwcsName, uint cbReserved1, byte* reserved1, DWORD grfMode, DWORD reserved2, IStream* ppstm);
	HRESULT IStorage_CopyTo_Proxy(IStorage This, DWORD ciidExclude, const(IID)* rgiidExclude, SNB snbExclude, IStorage pstgDest);
	HRESULT IStorage_CopyTo_Stub(IStorage This, DWORD ciidExclude, const(IID)* rgiidExclude, SNB snbExclude, IStorage pstgDest);
	HRESULT IStorage_EnumElements_Proxy(IStorage This, DWORD reserved1, void* reserved2, DWORD reserved3, IEnumSTATSTG* ppenum);
	HRESULT IStorage_EnumElements_Stub(IStorage This, DWORD reserved1, uint cbReserved2, byte* reserved2, DWORD reserved3, IEnumSTATSTG* ppenum);
	HRESULT ILockBytes_ReadAt_Proxy(ILockBytes This, ULARGE_INTEGER ulOffset, void* pv, ULONG cb, ULONG* pcbRead);
	HRESULT ILockBytes_ReadAt_Stub(ILockBytes This, ULARGE_INTEGER ulOffset, byte* pv, ULONG cb, ULONG* pcbRead);
	HRESULT ILockBytes_WriteAt_Proxy(ILockBytes This, ULARGE_INTEGER ulOffset, const(void)* pv, ULONG cb, ULONG* pcbWritten);
	HRESULT ILockBytes_WriteAt_Stub(ILockBytes This, ULARGE_INTEGER ulOffset, const(byte)* pv, ULONG cb, ULONG* pcbWritten);
	HRESULT IEnumFORMATETC_Next_Proxy(IEnumFORMATETC This, ULONG celt, FORMATETC* rgelt, ULONG* pceltFetched);
	HRESULT IEnumFORMATETC_Next_Stub(IEnumFORMATETC This, ULONG celt, FORMATETC* rgelt, ULONG* pceltFetched);
	HRESULT IEnumSTATDATA_Next_Proxy(IEnumSTATDATA This, ULONG celt, STATDATA* rgelt, ULONG* pceltFetched);
	HRESULT IEnumSTATDATA_Next_Stub(IEnumSTATDATA This, ULONG celt, STATDATA* rgelt, ULONG* pceltFetched);
	void IAdviseSink_OnDataChange_Proxy(IAdviseSink This, FORMATETC* pFormatetc, STGMEDIUM* pStgmed);
	HRESULT IAdviseSink_OnDataChange_Stub(IAdviseSink This, FORMATETC* pFormatetc, ASYNC_STGMEDIUM* pStgmed);
	void IAdviseSink_OnViewChange_Proxy(IAdviseSink This, DWORD dwAspect, LONG lindex);
	HRESULT IAdviseSink_OnViewChange_Stub(IAdviseSink This, DWORD dwAspect, LONG lindex);
	void IAdviseSink_OnRename_Proxy(IAdviseSink This, IMoniker pmk);
	HRESULT IAdviseSink_OnRename_Stub(IAdviseSink This, IMoniker pmk);
	void IAdviseSink_OnSave_Proxy(IAdviseSink This);
	HRESULT IAdviseSink_OnSave_Stub(IAdviseSink This);
	void IAdviseSink_OnClose_Proxy(IAdviseSink This);
	HRESULT IAdviseSink_OnClose_Stub(IAdviseSink This);
	void IAdviseSink2_OnLinkSrcChange_Proxy(IAdviseSink2 This, IMoniker pmk);
	HRESULT IAdviseSink2_OnLinkSrcChange_Stub(IAdviseSink2 This, IMoniker pmk);
	HRESULT IDataObject_GetData_Proxy(IDataObject This, FORMATETC* pformatetcIn, STGMEDIUM* pmedium);
	HRESULT IDataObject_GetData_Stub(IDataObject This, FORMATETC* pformatetcIn, STGMEDIUM* pRemoteMedium);
	HRESULT IDataObject_GetDataHere_Proxy(IDataObject This, FORMATETC* pformatetc, STGMEDIUM* pmedium);
	HRESULT IDataObject_GetDataHere_Stub(IDataObject This, FORMATETC* pformatetc, STGMEDIUM* pRemoteMedium);
	HRESULT IDataObject_SetData_Proxy(IDataObject This, FORMATETC* pformatetc, STGMEDIUM* pmedium, BOOL fRelease);
	HRESULT IDataObject_SetData_Stub(IDataObject This, FORMATETC* pformatetc, FLAG_STGMEDIUM* pmedium, BOOL fRelease);
	HRESULT IFillLockBytes_FillAppend_Proxy(IFillLockBytes This, const(void)* pv, ULONG cb, ULONG* pcbWritten);
	HRESULT IFillLockBytes_FillAppend_Stub(IFillLockBytes This, const(byte)* pv, ULONG cb, ULONG* pcbWritten);
	HRESULT IFillLockBytes_FillAt_Proxy(IFillLockBytes This, ULARGE_INTEGER ulOffset, const(void)* pv, ULONG cb, ULONG* pcbWritten);
	HRESULT IFillLockBytes_FillAt_Stub(IFillLockBytes This, ULARGE_INTEGER ulOffset, const(byte)* pv, ULONG cb, ULONG* pcbWritten);
	void AsyncIAdviseSink_Begin_OnDataChange_Proxy(AsyncIAdviseSink This, FORMATETC* pFormatetc, STGMEDIUM* pStgmed);
	HRESULT AsyncIAdviseSink_Begin_OnDataChange_Stub(AsyncIAdviseSink This, FORMATETC* pFormatetc, ASYNC_STGMEDIUM* pStgmed);
	void AsyncIAdviseSink_Finish_OnDataChange_Proxy(AsyncIAdviseSink This);
	HRESULT AsyncIAdviseSink_Finish_OnDataChange_Stub(AsyncIAdviseSink This);
	void AsyncIAdviseSink_Begin_OnViewChange_Proxy(AsyncIAdviseSink This, DWORD dwAspect, LONG lindex);
	HRESULT AsyncIAdviseSink_Begin_OnViewChange_Stub(AsyncIAdviseSink This, DWORD dwAspect, LONG lindex);
	void AsyncIAdviseSink_Finish_OnViewChange_Proxy(AsyncIAdviseSink This);
	HRESULT AsyncIAdviseSink_Finish_OnViewChange_Stub(AsyncIAdviseSink This);
	void AsyncIAdviseSink_Begin_OnRename_Proxy(AsyncIAdviseSink This, IMoniker pmk);
	HRESULT AsyncIAdviseSink_Begin_OnRename_Stub(AsyncIAdviseSink This, IMoniker pmk);
	void AsyncIAdviseSink_Finish_OnRename_Proxy(AsyncIAdviseSink This);
	HRESULT AsyncIAdviseSink_Finish_OnRename_Stub(AsyncIAdviseSink This);
	void AsyncIAdviseSink_Begin_OnSave_Proxy(AsyncIAdviseSink This);
	HRESULT AsyncIAdviseSink_Begin_OnSave_Stub(AsyncIAdviseSink This);
	void AsyncIAdviseSink_Finish_OnSave_Proxy(AsyncIAdviseSink This);
	HRESULT AsyncIAdviseSink_Finish_OnSave_Stub(AsyncIAdviseSink This);
	void AsyncIAdviseSink_Begin_OnClose_Proxy(AsyncIAdviseSink This);
	HRESULT AsyncIAdviseSink_Begin_OnClose_Stub(AsyncIAdviseSink This);
	void AsyncIAdviseSink_Finish_OnClose_Proxy(AsyncIAdviseSink This);
	HRESULT AsyncIAdviseSink_Finish_OnClose_Stub(AsyncIAdviseSink This);
	void AsyncIAdviseSink2_Begin_OnLinkSrcChange_Proxy(AsyncIAdviseSink2 This, IMoniker pmk);
	HRESULT AsyncIAdviseSink2_Begin_OnLinkSrcChange_Stub(AsyncIAdviseSink2 This, IMoniker pmk);
	void AsyncIAdviseSink2_Finish_OnLinkSrcChange_Proxy(AsyncIAdviseSink2 This);
	HRESULT AsyncIAdviseSink2_Finish_OnLinkSrcChange_Stub(AsyncIAdviseSink2 This);
}

} // extern(C)
