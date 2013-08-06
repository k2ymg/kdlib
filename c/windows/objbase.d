/** objbase.d

Converted from 'objbase.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.objbase;


import c.windows.sdkddkver;
import c.windows.windef;
import c.windows.wtypes;
import c.windows.guiddef;
import c.windows.unknwn;
import c.windows.objidl;
import c.windows.rpcdce;
import c.windows.urlmon;


align(8){


//	LISet32(li, v) ((li).HighPart = ((LONG) (v)) < 0 ? -1 : 0, (li).LowPart = (v))
//	ULISet32(li, v) ((li).HighPart = 0, (li).LowPart = (v))

enum CLSCTX_INPROC = CLSCTX_INPROC_SERVER | CLSCTX_INPROC_HANDLER;

enum CLSCTX_ALL = CLSCTX_INPROC_SERVER | CLSCTX_INPROC_HANDLER | CLSCTX_LOCAL_SERVER | CLSCTX_REMOTE_SERVER;
enum CLSCTX_SERVER = CLSCTX_INPROC_SERVER | CLSCTX_LOCAL_SERVER | CLSCTX_REMOTE_SERVER;

enum {
	REGCLS_SINGLEUSE      = 0,
	REGCLS_MULTIPLEUSE    = 1,
	REGCLS_MULTI_SEPARATE = 2,
	REGCLS_SUSPENDED      = 4,
	REGCLS_SURROGATE      = 8
}
alias int REGCLS;

enum MARSHALINTERFACE_MIN = 500;
enum CWCSTORAGENAME = 32;

enum {
	STGM_DIRECT           = 0x00000000,
	STGM_TRANSACTED       = 0x00010000,
	STGM_SIMPLE           = 0x08000000,
	STGM_READ             = 0x00000000,
	STGM_WRITE            = 0x00000001,
	STGM_READWRITE        = 0x00000002,
	STGM_SHARE_DENY_NONE  = 0x00000040,
	STGM_SHARE_DENY_READ  = 0x00000030,
	STGM_SHARE_DENY_WRITE = 0x00000020,
	STGM_SHARE_EXCLUSIVE  = 0x00000010,
	STGM_PRIORITY         = 0x00040000,
	STGM_DELETEONRELEASE  = 0x04000000,
	STGM_NOSCRATCH        = 0x00100000,
	STGM_CREATE           = 0x00001000,
	STGM_CONVERT          = 0x00020000,
	STGM_FAILIFTHERE      = 0x00000000,
	STGM_NOSNAPSHOT       = 0x00200000,
	STGM_DIRECT_SWMR      = 0x00400000,
}
enum {
	ASYNC_MODE_COMPATIBILITY = 0x00000001,
	ASYNC_MODE_DEFAULT       = 0x00000000,
	STGTY_REPEAT             = 0x00000100,
	STG_TOEND                = 0xFFFFFFFF,
	STG_LAYOUT_SEQUENTIAL    = 0x00000000,
	STG_LAYOUT_INTERLEAVED   = 0x00000001,
}

alias DWORD STGFMT;

enum {
	STGFMT_STORAGE  = 0,
	STGFMT_NATIVE   = 1,
	STGFMT_FILE     = 3,
	STGFMT_ANY      = 4,
	STGFMT_DOCFILE  = 5,
	STGFMT_DOCUMENT = 0,
}

enum {
	COINIT_APARTMENTTHREADED = 0x2,
	COINIT_MULTITHREADED     = 0x0,
	COINIT_DISABLE_OLE1DDE   = 0x4,
	COINIT_SPEED_OVER_MEMORY = 0x8,
}
alias int COINIT;

export extern(Windows){
	DWORD CoBuildVersion();
	HRESULT CoInitialize(LPVOID pvReserved);
	void CoUninitialize();
	HRESULT CoGetMalloc(DWORD dwMemContext, LPMALLOC* ppMalloc);
	DWORD CoGetCurrentProcess();
	HRESULT CoRegisterMallocSpy(LPMALLOCSPY pMallocSpy);
	HRESULT CoRevokeMallocSpy();
	HRESULT CoCreateStandardMalloc(DWORD memctx, IMalloc* ppMalloc);
	HRESULT CoInitializeEx(LPVOID pvReserved, DWORD dwCoInit);
	HRESULT CoGetCallerTID(LPDWORD lpdwTID);
	HRESULT CoGetCurrentLogicalThreadId(GUID* pguid);
}

//(_WIN32_WINNT >= 0x0501)
	enum {
		SD_LAUNCHPERMISSIONS  = 0,
		SD_ACCESSPERMISSIONS  = 1,
		SD_LAUNCHRESTRICTIONS = 2,
		SD_ACCESSRESTRICTIONS = 3
	}
	alias int COMSD;

static if(_WIN32_WINNT >= 0x0501){
	export extern(Windows){
		HRESULT CoRegisterInitializeSpy(LPINITIALIZESPY pSpy, ULARGE_INTEGER* puliCookie);
		HRESULT CoRevokeInitializeSpy(ULARGE_INTEGER uliCookie);
		HRESULT CoGetContextToken(ULONG_PTR* pToken);
		HRESULT CoGetSystemSecurityPermissions(COMSD comSDType, PSECURITY_DESCRIPTOR* ppSD);
	}
}

static if(_WIN32_WINNT >= _WIN32_WINNT_WIN7)
	export extern(Windows) HRESULT CoGetApartmentType(APTTYPE* pAptType, APTTYPEQUALIFIER* pAptQualifier);

//export extern(Windows) ULONG DebugCoGetRpcFault();
//export extern(Windows) void DebugCoSetRpcFault(ULONG);


//(_WIN32_WINNT >= 0x0500)
	struct SOleTlsDataPublic {
		void*[2] pvReserved0;
		DWORD[3] dwReserved0;
		void*[1] pvReserved1;
		DWORD[3] dwReserved1;
		void*[4] pvReserved2;
		DWORD[1] dwReserved2;
		void* pCurrentCtx;
	}

export extern(Windows){
	HRESULT CoGetObjectContext(REFIID riid, LPVOID* ppv);
	HRESULT CoGetClassObject(REFCLSID rclsid, DWORD dwClsContext, LPVOID pvReserved, REFIID riid, LPVOID* ppv);
	HRESULT CoRegisterClassObject(REFCLSID rclsid, LPUNKNOWN pUnk, DWORD dwClsContext, DWORD flags, LPDWORD lpdwRegister);
	HRESULT CoRevokeClassObject(DWORD dwRegister);
	HRESULT CoResumeClassObjects();
	HRESULT CoSuspendClassObjects();
	ULONG CoAddRefServerProcess();
	ULONG CoReleaseServerProcess();
	HRESULT CoGetPSClsid(REFIID riid, CLSID* pClsid);
	HRESULT CoRegisterPSClsid(REFIID riid, REFCLSID rclsid);
	HRESULT CoRegisterSurrogate(LPSURROGATE pSurrogate);
	HRESULT CoGetMarshalSizeMax(ULONG* pulSize, REFIID riid, LPUNKNOWN pUnk, DWORD dwDestContext, LPVOID pvDestContext, DWORD mshlflags);
	HRESULT CoMarshalInterface(LPSTREAM pStm, REFIID riid, LPUNKNOWN pUnk, DWORD dwDestContext, LPVOID pvDestContext, DWORD mshlflags);
	HRESULT CoUnmarshalInterface(LPSTREAM pStm, REFIID riid, LPVOID* ppv);
	HRESULT CoMarshalHresult(LPSTREAM pstm, HRESULT hresult);
	HRESULT CoUnmarshalHresult(LPSTREAM pstm, HRESULT* phresult);
	HRESULT CoReleaseMarshalData(LPSTREAM pStm);
	HRESULT CoDisconnectObject(LPUNKNOWN pUnk, DWORD dwReserved);
	HRESULT CoLockObjectExternal(LPUNKNOWN pUnk, BOOL fLock, BOOL fLastUnlockReleases);
	HRESULT CoGetStandardMarshal(REFIID riid, LPUNKNOWN pUnk, DWORD dwDestContext, LPVOID pvDestContext, DWORD mshlflags, LPMARSHAL* ppMarshal);
	HRESULT CoGetStdMarshalEx(LPUNKNOWN pUnkOuter, DWORD smexflags, LPUNKNOWN* ppUnkInner);
}

enum {
	SMEXF_SERVER  = 0x01,
	SMEXF_HANDLER = 0x02
}
alias int STDMSHLFLAGS;

export extern(Windows){
	BOOL CoIsHandlerConnected(LPUNKNOWN pUnk);
	HRESULT CoMarshalInterThreadInterfaceInStream(REFIID riid, LPUNKNOWN pUnk, LPSTREAM* ppStm);
	HRESULT CoGetInterfaceAndReleaseStream(LPSTREAM pStm, REFIID iid, LPVOID* ppv);
	HRESULT CoCreateFreeThreadedMarshaler(LPUNKNOWN punkOuter, LPUNKNOWN* ppunkMarshal);
	HINSTANCE CoLoadLibrary(LPOLESTR lpszLibName, BOOL bAutoFree);
	void CoFreeLibrary(HINSTANCE hInst);
	void CoFreeAllLibraries();
	void CoFreeUnusedLibraries();
	static if(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		void CoFreeUnusedLibrariesEx(DWORD dwUnloadDelay, DWORD dwReserved);
	static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		HRESULT CoDisconnectContext(DWORD dwTimeout);

	HRESULT CoInitializeSecurity(PSECURITY_DESCRIPTOR pSecDesc, LONG cAuthSvc, SOLE_AUTHENTICATION_SERVICE* asAuthSvc, void* pReserved1, DWORD dwAuthnLevel, DWORD dwImpLevel, void* pAuthList, DWORD dwCapabilities, void* pReserved3);
	HRESULT CoGetCallContext(REFIID riid, void** ppInterface);
	HRESULT CoQueryProxyBlanket(IUnknown pProxy, DWORD* pwAuthnSvc, DWORD* pAuthzSvc, OLECHAR** pServerPrincName, DWORD* pAuthnLevel, DWORD* pImpLevel, RPC_AUTH_IDENTITY_HANDLE* pAuthInfo, DWORD* pCapabilites);
	HRESULT CoSetProxyBlanket(IUnknown pProxy, DWORD dwAuthnSvc, DWORD dwAuthzSvc, OLECHAR* pServerPrincName, DWORD dwAuthnLevel, DWORD dwImpLevel, RPC_AUTH_IDENTITY_HANDLE pAuthInfo, DWORD dwCapabilities );
	HRESULT CoCopyProxy(IUnknown pProxy, IUnknown* ppCopy);
	HRESULT CoQueryClientBlanket(DWORD* pAuthnSvc, DWORD* pAuthzSvc, OLECHAR** pServerPrincName, DWORD* pAuthnLevel, DWORD* pImpLevel, RPC_AUTHZ_HANDLE* pPrivs, DWORD* pCapabilities);
	HRESULT CoImpersonateClient();
	HRESULT CoRevertToSelf();
	HRESULT CoQueryAuthenticationServices(DWORD* pcAuthSvc, SOLE_AUTHENTICATION_SERVICE** asAuthSv);
	HRESULT CoSwitchCallContext(IUnknown pNewObject, IUnknown* ppOldObject);
}

enum {
	COM_RIGHTS_EXECUTE         = 1,
	COM_RIGHTS_EXECUTE_LOCAL   = 2,
	COM_RIGHTS_EXECUTE_REMOTE  = 4,
	COM_RIGHTS_ACTIVATE_LOCAL  = 8,
	COM_RIGHTS_ACTIVATE_REMOTE = 16,
}

export extern(Windows){
	HRESULT CoCreateInstance(REFCLSID rclsid, LPUNKNOWN pUnkOuter, DWORD dwClsContext, REFIID riid, LPVOID* ppv);

	HRESULT CoGetInstanceFromFile(COSERVERINFO* pServerInfo, CLSID* pClsid, IUnknown punkOuter, DWORD dwClsCtx, DWORD grfMode, OLECHAR* pwszName, DWORD dwCount, MULTI_QI* pResults);
	HRESULT CoGetInstanceFromIStorage(COSERVERINFO* pServerInfo, CLSID* pClsid, IUnknown punkOuter, DWORD dwClsCtx, IStorage pstg, DWORD dwCount, MULTI_QI* pResults);
	HRESULT CoCreateInstanceEx(REFCLSID Clsid, IUnknown punkOuter, DWORD dwClsCtx, COSERVERINFO* pServerInfo, DWORD dwCount, MULTI_QI* pResults);

	HRESULT CoGetCancelObject(DWORD dwThreadId, REFIID iid, void** ppUnk);
	HRESULT CoSetCancelObject(IUnknown pUnk);
	HRESULT CoCancelCall(DWORD dwThreadId, ULONG ulTimeout);
	HRESULT CoTestCancel();
	HRESULT CoEnableCallCancellation(LPVOID pReserved);
	HRESULT CoDisableCallCancellation(LPVOID pReserved);
	HRESULT CoAllowSetForegroundWindow(IUnknown pUnk, LPVOID lpvReserved);
	HRESULT DcomChannelSetHResult(LPVOID pvReserved, ULONG* pulReserved, HRESULT appsHR);

	HRESULT StringFromCLSID(REFCLSID rclsid, LPOLESTR* lplpsz);
	HRESULT CLSIDFromString(LPCOLESTR lpsz, LPCLSID pclsid);
	HRESULT StringFromIID(REFIID rclsid, LPOLESTR* lplpsz);
	HRESULT IIDFromString(LPCOLESTR lpsz, LPIID lpiid);
	BOOL CoIsOle1Class(REFCLSID rclsid);
	HRESULT ProgIDFromCLSID(REFCLSID clsid, LPOLESTR* lplpszProgID);
	HRESULT CLSIDFromProgID(LPCOLESTR lpszProgID, LPCLSID lpclsid);
	HRESULT CLSIDFromProgIDEx(LPCOLESTR lpszProgID, LPCLSID lpclsid);
	int StringFromGUID2(REFGUID rguid,LPOLESTR lpsz, int cchMax);
	HRESULT CoCreateGuid(GUID* pguid);
	BOOL CoFileTimeToDosDateTime(FILETIME* lpFileTime, LPWORD lpDosDate, LPWORD lpDosTime);
	BOOL CoDosDateTimeToFileTime(WORD nDosDate, WORD nDosTime, FILETIME* lpFileTime);
	HRESULT CoFileTimeNow(FILETIME* lpFileTime);
	HRESULT CoRegisterMessageFilter(LPMESSAGEFILTER lpMessageFilter, LPMESSAGEFILTER* lplpMessageFilter);

	HRESULT CoRegisterChannelHook(REFGUID ExtensionUuid, IChannelHook pChannelHook);
}
export extern(Windows) HRESULT CoWaitForMultipleHandles(DWORD dwFlags, DWORD dwTimeout, ULONG cHandles, LPHANDLE pHandles, LPDWORD lpdwindex);

enum {
	COWAIT_WAITALL = 1,
	COWAIT_ALERTABLE = 2,
	COWAIT_INPUTAVAILABLE = 4
}
alias int COWAIT_FLAGS;

export extern(Windows){
	static if(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		HRESULT CoInvalidateRemoteMachineBindings(LPOLESTR pszMachineName);

	HRESULT CoGetTreatAsClass(REFCLSID clsidOld, LPCLSID pClsidNew);
	HRESULT CoTreatAsClass(REFCLSID clsidOld, REFCLSID clsidNew);

	alias extern(Windows) HRESULT function(REFCLSID, REFIID, LPVOID*) LPFNGETCLASSOBJECT;
	alias extern(Windows) HRESULT function() LPFNCANUNLOADNOW;

	HRESULT DllGetClassObject(REFCLSID rclsid, REFIID riid, LPVOID* ppv);
	HRESULT DllCanUnloadNow();
	LPVOID CoTaskMemAlloc(SIZE_T cb);
	LPVOID CoTaskMemRealloc(LPVOID pv, SIZE_T cb);
	void CoTaskMemFree(LPVOID pv);

	HRESULT CreateDataAdviseHolder(LPDATAADVISEHOLDER* ppDAHolder);
	HRESULT CreateDataCache(LPUNKNOWN pUnkOuter, REFCLSID rclsid, REFIID iid, LPVOID* ppv);
	HRESULT StgCreateDocfile(const(WCHAR)* pwcsName, DWORD grfMode, DWORD reserved, IStorage* ppstgOpen);
	HRESULT StgCreateDocfileOnILockBytes(ILockBytes plkbyt, DWORD grfMode, DWORD reserved, IStorage* ppstgOpen);
	HRESULT StgOpenStorage(const(WCHAR)* pwcsName, IStorage pstgPriority, DWORD grfMode, SNB snbExclude, DWORD reserved, IStorage* ppstgOpen);
	HRESULT StgOpenStorageOnILockBytes(ILockBytes plkbyt, IStorage pstgPriority, DWORD grfMode, SNB snbExclude, DWORD reserved, IStorage* ppstgOpen);
	HRESULT StgIsStorageFile(const(WCHAR)* pwcsName);
	HRESULT StgIsStorageILockBytes(ILockBytes plkbyt);
	HRESULT StgSetTimes(const(WCHAR)* lpszName, const(FILETIME)* pctime, const(FILETIME)* patime, const(FILETIME)* pmtime);
	HRESULT StgOpenAsyncDocfileOnIFillLockBytes(IFillLockBytes pflb, DWORD grfMode, DWORD asyncFlags, IStorage* ppstgOpen);
	HRESULT StgGetIFillLockBytesOnILockBytes(ILockBytes pilb, IFillLockBytes* ppflb);
	HRESULT StgGetIFillLockBytesOnFile(OLECHAR* pwcsName, IFillLockBytes* ppflb);
	HRESULT StgOpenLayoutDocfile(OLECHAR* pwcsDfName, DWORD grfMode, DWORD reserved, IStorage* ppstgOpen);
}

enum STGOPTIONS_VERSION = 2;

struct STGOPTIONS {
	USHORT usVersion;
	USHORT reserved;
	ULONG ulSectorSize;
	const(WCHAR)* pwcsTemplateFile;
}

export extern(Windows){
	HRESULT StgCreateStorageEx(const(WCHAR)* pwcsName, DWORD grfMode, DWORD stgfmt, DWORD grfAttrs, STGOPTIONS* pStgOptions, PSECURITY_DESCRIPTOR pSecurityDescriptor, REFIID riid, void** ppObjectOpen);
	HRESULT StgOpenStorageEx(const(WCHAR)* pwcsName, DWORD grfMode, DWORD stgfmt, DWORD grfAttrs, STGOPTIONS* pStgOptions, PSECURITY_DESCRIPTOR pSecurityDescriptor, REFIID riid, void** ppObjectOpen);
	HRESULT BindMoniker(LPMONIKER pmk, DWORD grfOpt, REFIID iidResult, LPVOID* ppvResult);
	HRESULT CoInstall(IBindCtx* pbc, DWORD dwFlags, uCLSSPEC* pClassSpec, QUERYCONTEXT* pQuery, LPWSTR pszCodeBase);
	HRESULT CoGetObject(LPCWSTR pszName, BIND_OPTS* pBindOptions, REFIID riid, void** ppv);
	HRESULT MkParseDisplayName(LPBC pbc, LPCOLESTR szUserName, ULONG* pchEaten, LPMONIKER* ppmk);
	HRESULT MonikerRelativePathTo(LPMONIKER pmkSrc, LPMONIKER pmkDest, LPMONIKER* ppmkRelPath, BOOL dwReserved);
	HRESULT MonikerCommonPrefixWith(LPMONIKER pmkThis, LPMONIKER pmkOther, LPMONIKER* ppmkCommon);
	HRESULT CreateBindCtx(DWORD reserved, LPBC* ppbc);
	HRESULT CreateGenericComposite(LPMONIKER pmkFirst, LPMONIKER pmkRest, LPMONIKER* ppmkComposite);
	HRESULT GetClassFile(LPCOLESTR szFilename, CLSID* pclsid);
	HRESULT CreateClassMoniker(REFCLSID rclsid, LPMONIKER* ppmk);
	HRESULT CreateFileMoniker(LPCOLESTR lpszPathName, LPMONIKER* ppmk);
	HRESULT CreateItemMoniker(LPCOLESTR lpszDelim, LPCOLESTR lpszItem, LPMONIKER* ppmk);
	HRESULT CreateAntiMoniker(LPMONIKER* ppmk);
	HRESULT CreatePointerMoniker(LPUNKNOWN punk, LPMONIKER* ppmk);
	HRESULT CreateObjrefMoniker(LPUNKNOWN punk, LPMONIKER* ppmk);
	HRESULT GetRunningObjectTable(DWORD reserved, LPRUNNINGOBJECTTABLE* pprot);

	HRESULT CreateStdProgressIndicator(HWND hwndParent, LPCOLESTR pszTitle, IBindStatusCallback* pIbscCaller, IBindStatusCallback* ppIbsc);
}

} //align(8)

