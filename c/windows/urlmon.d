/** urlmon.d

Converted from 'urlmon.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.urlmon;


import c.windows.sdkddkver;
import c.windows.windef;
import c.windows.basetsd;
import c.windows.wtypes;
import c.windows.winbase;
import c.windows.guiddef;
import c.windows.unknwn;
import c.windows.objidl;
import c.windows.rpcdcep;
import c.windows.servprov;
import c.windows.msxml;


extern(C){

extern extern(C) const IID CLSID_SBS_StdURLMoniker;
extern extern(C) const IID CLSID_SBS_HttpProtocol;
extern extern(C) const IID CLSID_SBS_FtpProtocol;
extern extern(C) const IID CLSID_SBS_GopherProtocol;
extern extern(C) const IID CLSID_SBS_HttpSProtocol;
extern extern(C) const IID CLSID_SBS_FileProtocol;
extern extern(C) const IID CLSID_SBS_MkProtocol;
extern extern(C) const IID CLSID_SBS_UrlMkBindCtx;
extern extern(C) const IID CLSID_SBS_SoftDistExt;
extern extern(C) const IID CLSID_SBS_StdEncodingFilterFac;
extern extern(C) const IID CLSID_SBS_DeCompMimeFilter;
extern extern(C) const IID CLSID_SBS_CdlProtocol;
extern extern(C) const IID CLSID_SBS_ClassInstallFilter;
extern extern(C) const IID CLSID_SBS_InternetSecurityManager;
extern extern(C) const IID CLSID_SBS_InternetZoneManager;
/*
BINDF_DONTUSECACHE BINDF_GETNEWESTVERSION
BINDF_DONTPUTINCACHE BINDF_NOWRITECACHE
BINDF_NOCOPYDATA BINDF_PULLDATA
INVALID_P_ROOT_SECURITY_ID ((BYTE*)-1)
PI_DOCFILECLSIDLOOKUP PI_CLSIDLOOKUP
*/
extern extern(C) const IID IID_IAsyncMoniker;
extern extern(C) const IID CLSID_StdURLMoniker;
extern extern(C) const IID CLSID_HttpProtocol;
extern extern(C) const IID CLSID_FtpProtocol;
extern extern(C) const IID CLSID_GopherProtocol;
extern extern(C) const IID CLSID_HttpSProtocol;
extern extern(C) const IID CLSID_FileProtocol;
extern extern(C) const IID CLSID_MkProtocol;
extern extern(C) const IID CLSID_StdURLProtocol;
extern extern(C) const IID CLSID_UrlMkBindCtx;
extern extern(C) const IID CLSID_StdEncodingFilterFac;
extern extern(C) const IID CLSID_DeCompMimeFilter;
extern extern(C) const IID CLSID_CdlProtocol;
extern extern(C) const IID CLSID_ClassInstallFilter;
extern extern(C) const IID IID_IAsyncBindCtx;

const wchar* SZ_URLCONTEXT = "URL Context";
const wchar* SZ_ASYNC_CALLEE = "AsyncCallee";
enum {
	MKSYS_URLMONIKER       = 6,
	URL_MK_LEGACY          = 0,
	URL_MK_UNIFORM         = 1,
	URL_MK_NO_CANONICALIZE = 2,
}

export extern(Windows) HRESULT CreateURLMoniker(LPMONIKER pMkCtx, LPCWSTR szURL, LPMONIKER* ppmk);
export extern(Windows) HRESULT CreateURLMonikerEx(LPMONIKER pMkCtx, LPCWSTR szURL, LPMONIKER* ppmk, DWORD dwFlags);
export extern(Windows) HRESULT GetClassURL(LPCWSTR szURL, CLSID* pClsID);
export extern(Windows) HRESULT CreateAsyncBindCtx(DWORD reserved, IBindStatusCallback pBSCb, IEnumFORMATETC pEFetc, IBindCtx* ppBC);
//(_WIN32_IE >= _WIN32_IE_IE70) // moved below
//	export extern(Windows) HRESULT CreateURLMonikerEx2(LPMONIKER pMkCtx, IUri pUri, LPMONIKER* ppmk, DWORD dwFlags);
export extern(Windows) HRESULT CreateAsyncBindCtxEx(IBindCtx pbc, DWORD dwOptions, IBindStatusCallback pBSCb, IEnumFORMATETC pEnum, IBindCtx* ppBC, DWORD reserved);
export extern(Windows) HRESULT MkParseDisplayNameEx(IBindCtx pbc, LPCWSTR szDisplayName, ULONG* pchEaten, LPMONIKER* ppmk);
export extern(Windows) HRESULT RegisterBindStatusCallback(LPBC pBC, IBindStatusCallback pBSCb, IBindStatusCallback* ppBSCBPrev, DWORD dwReserved);
export extern(Windows) HRESULT RevokeBindStatusCallback(LPBC pBC, IBindStatusCallback pBSCb);
export extern(Windows) HRESULT GetClassFileOrMime(LPBC pBC, LPCWSTR szFilename, LPVOID pBuffer, DWORD cbSize, LPCWSTR szMime, DWORD dwReserved, CLSID* pclsid);
export extern(Windows) HRESULT IsValidURL(LPBC pBC, LPCWSTR szURL, DWORD dwReserved);
export extern(Windows) HRESULT CoGetClassObjectFromURL(REFCLSID rCLASSID, LPCWSTR szCODE, DWORD dwFileVersionMS, DWORD dwFileVersionLS, LPCWSTR szTYPE, LPBINDCTX pBindCtx, DWORD dwClsContext, LPVOID pvReserved, REFIID riid, LPVOID* ppv);
export extern(Windows) HRESULT IEInstallScope(LPDWORD pdwScope);
export extern(Windows) HRESULT FaultInIEFeature(HWND hWnd, uCLSSPEC* pClassSpec, QUERYCONTEXT* pQuery, DWORD dwFlags);
export extern(Windows) HRESULT GetComponentIDFromCLSSPEC(uCLSSPEC* pClassspec, LPSTR* ppszComponentID);

enum {
	FIEF_FLAG_FORCE_JITUI                  = 0x1,
	FIEF_FLAG_PEEK                         = 0x2,
	FIEF_FLAG_SKIP_INSTALLED_VERSION_CHECK = 0x4,
}

export extern(Windows) HRESULT IsAsyncMoniker(IMoniker pmk);
export extern(Windows) HRESULT CreateURLBinding(LPCWSTR lpszUrl, IBindCtx pbc, IBinding* ppBdg);
export extern(Windows) HRESULT RegisterMediaTypes(UINT ctypes, const(LPCSTR)* rgszTypes, CLIPFORMAT* rgcfTypes);
export extern(Windows) HRESULT FindMediaType(LPCSTR rgszTypes, CLIPFORMAT* rgcfTypes);
export extern(Windows) HRESULT CreateFormatEnumerator(UINT cfmtetc, FORMATETC* rgfmtetc, IEnumFORMATETC* ppenumfmtetc);
export extern(Windows) HRESULT RegisterFormatEnumerator(LPBC pBC, IEnumFORMATETC pEFetc, DWORD reserved);
export extern(Windows) HRESULT RevokeFormatEnumerator(LPBC pBC, IEnumFORMATETC pEFetc);
export extern(Windows) HRESULT RegisterMediaTypeClass(LPBC pBC,UINT ctypes, const(LPCSTR)* rgszTypes, CLSID* rgclsID, DWORD reserved);
export extern(Windows) HRESULT FindMediaTypeClass(LPBC pBC, LPCSTR szType, CLSID* pclsID, DWORD reserved);
export extern(Windows) HRESULT UrlMkSetSessionOption(DWORD dwOption, LPVOID pBuffer, DWORD dwBufferLength, DWORD dwReserved);
export extern(Windows) HRESULT UrlMkGetSessionOption(DWORD dwOption, LPVOID pBuffer, DWORD dwBufferLength, DWORD* pdwBufferLengthOut, DWORD dwReserved);
export extern(Windows) HRESULT FindMimeFromData(LPBC pBC, LPCWSTR pwzUrl, LPVOID pBuffer, DWORD cbSize, LPCWSTR pwzMimeProposed, DWORD dwMimeFlags, LPWSTR* ppwzMimeOut, DWORD dwReserved);
enum {
	FMFD_DEFAULT       = 0x00000000,
	FMFD_URLASFILENAME = 0x00000001,
}
enum {
	FMFD_ENABLEMIMESNIFFING  = 0x00000002,
	FMFD_IGNOREMIMETEXTPLAIN = 0x00000004,
}
enum {
	FMFD_SERVERMIME = 0x00000008,
	UAS_EXACTLEGACY = 0x00001000,
}
export extern(Windows) HRESULT ObtainUserAgentString(DWORD dwOption, LPSTR pszUAOut, DWORD* cbSize);
export extern(Windows) HRESULT CompareSecurityIds(BYTE* pbSecurityId1, DWORD dwLen1, BYTE* pbSecurityId2, DWORD dwLen2, DWORD dwReserved);
export extern(Windows) HRESULT CompatFlagsFromClsid(CLSID* pclsid, LPDWORD pdwCompatFlags, LPDWORD pdwMiscStatusFlags);

enum {
	URLMON_OPTION_USERAGENT           = 0x10000001,
	URLMON_OPTION_USERAGENT_REFRESH   = 0x10000002,
	URLMON_OPTION_URL_ENCODING        = 0x10000004,
	URLMON_OPTION_USE_BINDSTRINGCREDS = 0x10000008,
	//(_WIN32_IE >= _WIN32_IE_IE70)
		URLMON_OPTION_USE_BROWSERAPPSDOCUMENTS = 0x10000010,
}

enum CF_NULL = 0;
const TCHAR* CFSTR_MIME_NULL = null;
const TCHAR* CFSTR_MIME_TEXT        = "text/plain";
const TCHAR* CFSTR_MIME_RICHTEXT    = "text/richtext";
const TCHAR* CFSTR_MIME_X_BITMAP    = "image/x-xbitmap";
const TCHAR* CFSTR_MIME_POSTSCRIPT  = "application/postscript";
const TCHAR* CFSTR_MIME_AIFF        = "audio/aiff";
const TCHAR* CFSTR_MIME_BASICAUDIO  = "audio/basic";
const TCHAR* CFSTR_MIME_WAV         = "audio/wav";
const TCHAR* CFSTR_MIME_X_WAV       = "audio/x-wav";
const TCHAR* CFSTR_MIME_GIF         = "image/gif";
const TCHAR* CFSTR_MIME_PJPEG       = "image/pjpeg";
const TCHAR* CFSTR_MIME_JPEG        = "image/jpeg";
const TCHAR* CFSTR_MIME_TIFF        = "image/tiff";
const TCHAR* CFSTR_MIME_X_PNG       = "image/x-png";
const TCHAR* CFSTR_MIME_BMP         = "image/bmp";
const TCHAR* CFSTR_MIME_X_ART       = "image/x-jg";
const TCHAR* CFSTR_MIME_X_EMF       = "image/x-emf";
const TCHAR* CFSTR_MIME_X_WMF       = "image/x-wmf";
const TCHAR* CFSTR_MIME_AVI         = "video/avi";
const TCHAR* CFSTR_MIME_MPEG        = "video/mpeg";
const TCHAR* CFSTR_MIME_FRACTALS    = "application/fractals";
const TCHAR* CFSTR_MIME_RAWDATA     = "application/octet-stream";
const TCHAR* CFSTR_MIME_RAWDATASTRM = "application/octet-stream";
const TCHAR* CFSTR_MIME_PDF         = "application/pdf";
const TCHAR* CFSTR_MIME_HTA         = "application/hta";
const TCHAR* CFSTR_MIME_X_AIFF      = "audio/x-aiff";
const TCHAR* CFSTR_MIME_X_REALAUDIO = "audio/x-pn-realaudio";
const TCHAR* CFSTR_MIME_XBM         = "image/xbm";
const TCHAR* CFSTR_MIME_QUICKTIME   = "video/quicktime";
const TCHAR* CFSTR_MIME_X_MSVIDEO   = "video/x-msvideo";
const TCHAR* CFSTR_MIME_X_SGI_MOVIE = "video/x-sgi-movie";
const TCHAR* CFSTR_MIME_HTML        = "text/html";
const TCHAR* CFSTR_MIME_XML         = "text/xml";

enum {
	MK_S_ASYNCHRONOUS                          = cast(HRESULT)0x000401E8,
	S_ASYNCHRONOUS                             = MK_S_ASYNCHRONOUS,
	E_PENDING                                  = cast(HRESULT)0x8000000A,
	INET_E_INVALID_URL                         = cast(HRESULT)0x800C0002,
	INET_E_NO_SESSION                          = cast(HRESULT)0x800C0003,
	INET_E_CANNOT_CONNECT                      = cast(HRESULT)0x800C0004,
	INET_E_RESOURCE_NOT_FOUND                  = cast(HRESULT)0x800C0005,
	INET_E_OBJECT_NOT_FOUND                    = cast(HRESULT)0x800C0006,
	INET_E_DATA_NOT_AVAILABLE                  = cast(HRESULT)0x800C0007,
	INET_E_DOWNLOAD_FAILURE                    = cast(HRESULT)0x800C0008,
	INET_E_AUTHENTICATION_REQUIRED             = cast(HRESULT)0x800C0009,
	INET_E_NO_VALID_MEDIA                      = cast(HRESULT)0x800C000A,
	INET_E_CONNECTION_TIMEOUT                  = cast(HRESULT)0x800C000B,
	INET_E_INVALID_REQUEST                     = cast(HRESULT)0x800C000C,
	INET_E_UNKNOWN_PROTOCOL                    = cast(HRESULT)0x800C000D,
	INET_E_SECURITY_PROBLEM                    = cast(HRESULT)0x800C000E,
	INET_E_CANNOT_LOAD_DATA                    = cast(HRESULT)0x800C000F,
	INET_E_CANNOT_INSTANTIATE_OBJECT           = cast(HRESULT)0x800C0010,
	INET_E_INVALID_CERTIFICATE                 = cast(HRESULT)0x800C0019,
	INET_E_REDIRECT_FAILED                     = cast(HRESULT)0x800C0014,
	INET_E_REDIRECT_TO_DIR                     = cast(HRESULT)0x800C0015,
	INET_E_CANNOT_LOCK_REQUEST                 = cast(HRESULT)0x800C0016,
	INET_E_USE_EXTEND_BINDING                  = cast(HRESULT)0x800C0017,
	INET_E_TERMINATED_BIND                     = cast(HRESULT)0x800C0018,
	INET_E_RESERVED_1                          = cast(HRESULT)0x800C001A,
	INET_E_BLOCKED_REDIRECT_XSECURITYID        = cast(HRESULT)0x800C001B,
	INET_E_ERROR_FIRST                         = cast(HRESULT)0x800C0002,
	INET_E_CODE_DOWNLOAD_DECLINED              = cast(HRESULT)0x800C0100,
	INET_E_RESULT_DISPATCHED                   = cast(HRESULT)0x800C0200,
	INET_E_CANNOT_REPLACE_SFP_FILE             = cast(HRESULT)0x800C0300,
	INET_E_CODE_INSTALL_SUPPRESSED             = cast(HRESULT)0x800C0400,
	INET_E_CODE_INSTALL_BLOCKED_BY_HASH_POLICY = cast(HRESULT)0x800C0500,
	INET_E_DOWNLOAD_BLOCKED_BY_INPRIVATE       = cast(HRESULT)0x800C0501,
	INET_E_ERROR_LAST                          = INET_E_DOWNLOAD_BLOCKED_BY_INPRIVATE,
}

//extern extern(C) const IID IID_IPersistMoniker;
interface IPersistMoniker : IUnknown {
public extern(Windows):
	HRESULT GetClassID(CLSID* pClassID);
	HRESULT IsDirty();
	HRESULT Load(BOOL fFullyAvailable, IMoniker pimkName, LPBC pibc, DWORD grfMode);
	HRESULT Save(IMoniker pimkName, LPBC pbc, BOOL fRemember);
	HRESULT SaveCompleted(IMoniker pimkName, LPBC pibc);
	HRESULT GetCurMoniker(IMoniker* ppimkName);
}
mixin DEFINE_GUID!(IPersistMoniker, "79eac9c9-baf9-11ce-8c82-00aa004ba90b");
alias IPersistMoniker LPPERSISTMONIKER;

enum {
	MIMETYPEPROP        = 0,
	USE_SRC_URL         = 0x1,
	CLASSIDPROP         = 0x2,
	TRUSTEDDOWNLOADPROP = 0x3,
	POPUPLEVELPROP      = 0x4
}
alias int MONIKERPROPERTY;

//extern extern(C) const IID IID_IMonikerProp;
interface IMonikerProp : IUnknown {
public extern(Windows):
	HRESULT PutProperty(MONIKERPROPERTY mkp, LPCWSTR val);
}
mixin DEFINE_IID!(IMonikerProp, "a5ca5f7f-1847-4d87-9c5b-918509f7511d");
alias IMonikerProp LPMONIKERPROP;

//extern extern(C) const IID IID_IBindProtocol;
interface IBindProtocol : IUnknown {
public extern(Windows):
	HRESULT CreateBinding(LPCWSTR szUrl, IBindCtx pbc, IBinding* ppb);
}
mixin DEFINE_IID!(IBindProtocol, "79eac9cd-baf9-11ce-8c82-00aa004ba90b");
alias IBindProtocol LPBINDPROTOCOL;

//extern extern(C) const IID IID_IBinding;
interface IBinding : IUnknown {
public extern(Windows):
	HRESULT Abort();
	HRESULT Suspend();
	HRESULT Resume();
	HRESULT SetPriority(LONG nPriority);
	HRESULT GetPriority(LONG* pnPriority);
	HRESULT GetBindResult(CLSID* pclsidProtocol, DWORD* pdwResult, LPOLESTR* pszResult, DWORD* pdwReserved);
}
mixin DEFINE_IID!(IBinding, "79eac9c0-baf9-11ce-8c82-00aa004ba90b");
alias IBinding LPBINDING;

export extern(Windows){
	HRESULT IBinding_RemoteGetBindResult_Proxy(IBinding This, CLSID* pclsidProtocol, DWORD* pdwResult, LPOLESTR* pszResult, DWORD dwReserved);
	void IBinding_RemoteGetBindResult_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

enum {
	BINDVERB_GET       = 0,
	BINDVERB_POST      = 0x1,
	BINDVERB_PUT       = 0x2,
	BINDVERB_CUSTOM    = 0x3,
	BINDVERB_RESERVED1 = 0x4
}
alias int BINDVERB;

enum {
	BINDINFOF_URLENCODESTGMEDDATA = 0x1,
	BINDINFOF_URLENCODEDEXTRAINFO = 0x2
}
alias int BINDINFOF;

enum {
	BINDF_ASYNCHRONOUS             = 0x1,
	BINDF_ASYNCSTORAGE             = 0x2,
	BINDF_NOPROGRESSIVERENDERING   = 0x4,
	BINDF_OFFLINEOPERATION         = 0x8,
	BINDF_GETNEWESTVERSION         = 0x10,
	BINDF_NOWRITECACHE             = 0x20,
	BINDF_NEEDFILE                 = 0x40,
	BINDF_PULLDATA                 = 0x80,
	BINDF_IGNORESECURITYPROBLEM    = 0x100,
	BINDF_RESYNCHRONIZE            = 0x200,
	BINDF_HYPERLINK                = 0x400,
	BINDF_NO_UI                    = 0x800,
	BINDF_SILENTOPERATION          = 0x1000,
	BINDF_PRAGMA_NO_CACHE          = 0x2000,
	BINDF_GETCLASSOBJECT           = 0x4000,
	BINDF_RESERVED_1               = 0x8000,
	BINDF_FREE_THREADED            = 0x10000,
	BINDF_DIRECT_READ              = 0x20000,
	BINDF_FORMS_SUBMIT             = 0x40000,
	BINDF_GETFROMCACHE_IF_NET_FAIL = 0x80000,
	BINDF_FROMURLMON               = 0x100000,
	BINDF_FWD_BACK                 = 0x200000,
	BINDF_PREFERDEFAULTHANDLER     = 0x400000,
	BINDF_ENFORCERESTRICTED        = 0x800000
}
alias int BINDF;

enum {
	URL_ENCODING_NONE         = 0,
	URL_ENCODING_ENABLE_UTF8  = 0x10000000,
	URL_ENCODING_DISABLE_UTF8 = 0x20000000
}
alias int URL_ENCODING;

struct BINDINFO {
	ULONG cbSize;
	LPWSTR szExtraInfo;
	STGMEDIUM stgmedData;
	DWORD grfBindInfoF;
	DWORD dwBindVerb;
	LPWSTR szCustomVerb;
	DWORD cbstgmedData;
	DWORD dwOptions;
	DWORD dwOptionsFlags;
	DWORD dwCodePage;
	SECURITY_ATTRIBUTES securityAttributes;
	IID iid;
	IUnknown pUnk;
	DWORD dwReserved;
}

struct REMSECURITY_ATTRIBUTES {
	DWORD nLength;
	DWORD lpSecurityDescriptor;
	BOOL bInheritHandle;
}
alias REMSECURITY_ATTRIBUTES* PREMSECURITY_ATTRIBUTES;
alias REMSECURITY_ATTRIBUTES* LPREMSECURITY_ATTRIBUTES;

struct RemBINDINFO {
	ULONG cbSize;
	LPWSTR szExtraInfo;
	DWORD grfBindInfoF;
	DWORD dwBindVerb;
	LPWSTR szCustomVerb;
	DWORD cbstgmedData;
	DWORD dwOptions;
	DWORD dwOptionsFlags;
	DWORD dwCodePage;
	REMSECURITY_ATTRIBUTES securityAttributes;
	IID iid;
	IUnknown pUnk;
	DWORD dwReserved;
}

struct RemFORMATETC {
	DWORD cfFormat;
	DWORD ptd;
	DWORD dwAspect;
	LONG lindex;
	DWORD tymed;
}
alias RemFORMATETC* LPREMFORMATETC;

enum {
	BINDINFO_OPTIONS_WININETFLAG              = 0x10000,
	BINDINFO_OPTIONS_ENABLE_UTF8              = 0x20000,
	BINDINFO_OPTIONS_DISABLE_UTF8             = 0x40000,
	BINDINFO_OPTIONS_USE_IE_ENCODING          = 0x80000,
	BINDINFO_OPTIONS_BINDTOOBJECT             = 0x100000,
	BINDINFO_OPTIONS_SECURITYOPTOUT           = 0x200000,
	BINDINFO_OPTIONS_IGNOREMIMETEXTPLAIN      = 0x400000,
	BINDINFO_OPTIONS_USEBINDSTRINGCREDS       = 0x800000,
	BINDINFO_OPTIONS_IGNOREHTTPHTTPSREDIRECTS = 0x1000000,
	BINDINFO_OPTIONS_IGNORE_SSLERRORS_ONCE    = 0x2000000,
	BINDINFO_WPC_DOWNLOADBLOCKED              = 0x8000000,
	BINDINFO_WPC_LOGGING_ENABLED              = 0x10000000,
	BINDINFO_OPTIONS_ALLOWCONNECTDATA         = 0x20000000,
	BINDINFO_OPTIONS_DISABLEAUTOREDIRECTS     = 0x40000000,
	BINDINFO_OPTIONS_SHDOCVW_NAVIGATE         = cast(int)0x80000000
}
alias int BINDINFO_OPTIONS;

enum {
	BSCF_FIRSTDATANOTIFICATION        = 0x1,
	BSCF_INTERMEDIATEDATANOTIFICATION = 0x2,
	BSCF_LASTDATANOTIFICATION         = 0x4,
	BSCF_DATAFULLYAVAILABLE           = 0x8,
	BSCF_AVAILABLEDATASIZEUNKNOWN     = 0x10,
	BSCF_SKIPDRAINDATAFORFILEURLS     = 0x20,
	BSCF_64BITLENGTHDOWNLOAD          = 0x40
}
alias int BSCF;

enum {
	BINDSTATUS_FINDINGRESOURCE = 1,
	BINDSTATUS_CONNECTING,
	BINDSTATUS_REDIRECTING,
	BINDSTATUS_BEGINDOWNLOADDATA,
	BINDSTATUS_DOWNLOADINGDATA,
	BINDSTATUS_ENDDOWNLOADDATA,
	BINDSTATUS_BEGINDOWNLOADCOMPONENTS,
	BINDSTATUS_INSTALLINGCOMPONENTS,
	BINDSTATUS_ENDDOWNLOADCOMPONENTS,
	BINDSTATUS_USINGCACHEDCOPY,
	BINDSTATUS_SENDINGREQUEST,
	BINDSTATUS_CLASSIDAVAILABLE,
	BINDSTATUS_MIMETYPEAVAILABLE,
	BINDSTATUS_CACHEFILENAMEAVAILABLE,
	BINDSTATUS_BEGINSYNCOPERATION,
	BINDSTATUS_ENDSYNCOPERATION,
	BINDSTATUS_BEGINUPLOADDATA,
	BINDSTATUS_UPLOADINGDATA,
	BINDSTATUS_ENDUPLOADDATA,
	BINDSTATUS_PROTOCOLCLASSID,
	BINDSTATUS_ENCODING,
	BINDSTATUS_VERIFIEDMIMETYPEAVAILABLE,
	BINDSTATUS_CLASSINSTALLLOCATION,
	BINDSTATUS_DECODING,
	BINDSTATUS_LOADINGMIMEHANDLER,
	BINDSTATUS_CONTENTDISPOSITIONATTACH,
	BINDSTATUS_FILTERREPORTMIMETYPE,
	BINDSTATUS_CLSIDCANINSTANTIATE,
	BINDSTATUS_IUNKNOWNAVAILABLE,
	BINDSTATUS_DIRECTBIND,
	BINDSTATUS_RAWMIMETYPE,
	BINDSTATUS_PROXYDETECTING,
	BINDSTATUS_ACCEPTRANGES,
	BINDSTATUS_COOKIE_SENT,
	BINDSTATUS_COMPACT_POLICY_RECEIVED,
	BINDSTATUS_COOKIE_SUPPRESSED,
	BINDSTATUS_COOKIE_STATE_UNKNOWN,
	BINDSTATUS_COOKIE_STATE_ACCEPT,
	BINDSTATUS_COOKIE_STATE_REJECT,
	BINDSTATUS_COOKIE_STATE_PROMPT,
	BINDSTATUS_COOKIE_STATE_LEASH,
	BINDSTATUS_COOKIE_STATE_DOWNGRADE,
	BINDSTATUS_POLICY_HREF,
	BINDSTATUS_P3P_HEADER,
	BINDSTATUS_SESSION_COOKIE_RECEIVED,
	BINDSTATUS_PERSISTENT_COOKIE_RECEIVED,
	BINDSTATUS_SESSION_COOKIES_ALLOWED,
	BINDSTATUS_CACHECONTROL,
	BINDSTATUS_CONTENTDISPOSITIONFILENAME,
	BINDSTATUS_MIMETEXTPLAINMISMATCH,
	BINDSTATUS_PUBLISHERAVAILABLE,
	BINDSTATUS_DISPLAYNAMEAVAILABLE,
	BINDSTATUS_SSLUX_NAVBLOCKED,
	BINDSTATUS_SERVER_MIMETYPEAVAILABLE,
	BINDSTATUS_SNIFFED_CLASSIDAVAILABLE,
	BINDSTATUS_64BIT_PROGRESS,
}
alias int BINDSTATUS;

//extern extern(C) const IID IID_IBindStatusCallback;
interface IBindStatusCallback : IUnknown {
public extern(Windows):
	HRESULT OnStartBinding(DWORD dwReserved, IBinding pib);
	HRESULT GetPriority(LONG* pnPriority);
	HRESULT OnLowResource(DWORD reserved);
	HRESULT OnProgress(ULONG ulProgress, ULONG ulProgressMax, ULONG ulStatusCode, LPCWSTR szStatusText);
	HRESULT OnStopBinding(HRESULT hresult, LPCWSTR szError);
	HRESULT GetBindInfo(DWORD* grfBINDF, BINDINFO* pbindinfo);
	HRESULT OnDataAvailable(DWORD grfBSCF, DWORD dwSize, FORMATETC* pformatetc, STGMEDIUM* pstgmed);
	HRESULT OnObjectAvailable(REFIID riid, IUnknown punk);
}
mixin DEFINE_IID!(IBindStatusCallback, "79eac9c1-baf9-11ce-8c82-00aa004ba90b");
alias IBindStatusCallback LPBINDSTATUSCALLBACK;

export extern(Windows){
	HRESULT IBindStatusCallback_RemoteGetBindInfo_Proxy(IBindStatusCallback This, DWORD* grfBINDF, RemBINDINFO* pbindinfo, RemSTGMEDIUM* pstgmed);
	void IBindStatusCallback_RemoteGetBindInfo_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IBindStatusCallback_RemoteOnDataAvailable_Proxy(IBindStatusCallback This, DWORD grfBSCF, DWORD dwSize, RemFORMATETC* pformatetc, RemSTGMEDIUM* pstgmed);
	void IBindStatusCallback_RemoteOnDataAvailable_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

enum {
	BINDF2_DISABLEBASICOVERHTTP              = 0x1,
	BINDF2_DISABLEAUTOCOOKIEHANDLING         = 0x2,
	BINDF2_READ_DATA_GREATER_THAN_4GB        = 0x4,
	BINDF2_DISABLE_HTTP_REDIRECT_XSECURITYID = 0x8,
	BINDF2_RESERVED_3                        = 0x20000000,
	BINDF2_RESERVED_2                        = 0x40000000,
	BINDF2_RESERVED_1                        = 0x80000000
}
alias int BINDF2;

//extern extern(C) const IID IID_IBindStatusCallbackEx;
interface IBindStatusCallbackEx : IBindStatusCallback {
public extern(Windows):
	HRESULT GetBindInfoEx(DWORD* grfBINDF, BINDINFO* pbindinfo, DWORD* grfBINDF2, DWORD* pdwReserved);
}
mixin DEFINE_IID!(IBindStatusCallbackEx, "aaa74ef9-8ee7-4659-88d9-f8c504da73cc");
alias IBindStatusCallbackEx LPBINDSTATUSCALLBACKEX;

export extern(Windows){
	HRESULT IBindStatusCallbackEx_RemoteGetBindInfoEx_Proxy(IBindStatusCallbackEx This, DWORD* grfBINDF, RemBINDINFO* pbindinfo, RemSTGMEDIUM* pstgmed, DWORD* grfBINDF2, DWORD* pdwReserved);
	void IBindStatusCallbackEx_RemoteGetBindInfoEx_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_IAuthenticate;
interface IAuthenticate : IUnknown {
public extern(Windows):
	HRESULT Authenticate(HWND* phwnd, LPWSTR* pszUsername, LPWSTR* pszPassword);
}
mixin DEFINE_IID!(IAuthenticate, "79eac9d0-baf9-11ce-8c82-00aa004ba90b");
alias IAuthenticate LPAUTHENTICATION;

enum {
	AUTHENTICATEF_PROXY = 0x1,
	AUTHENTICATEF_BASIC = 0x2,
	AUTHENTICATEF_HTTP  = 0x4
}
alias int AUTHENTICATEF;

struct AUTHENTICATEINFO {
	DWORD dwFlags;
	DWORD dwReserved;
}

//extern extern(C) const IID IID_IAuthenticateEx;
interface IAuthenticateEx : IAuthenticate {
public extern(Windows):
	HRESULT AuthenticateEx(HWND* phwnd, LPWSTR* pszUsername, LPWSTR* pszPassword, AUTHENTICATEINFO* pauthinfo);
}
mixin DEFINE_IID!(IAuthenticateEx, "2ad1edaf-d83d-48b5-9adf-03dbe19f53bd");
alias IAuthenticateEx LPAUTHENTICATIONEX;

//extern extern(C) const IID IID_IHttpNegotiate;
interface  IHttpNegotiate : IUnknown {
public extern(Windows):
	HRESULT BeginningTransaction(LPCWSTR szURL, LPCWSTR szHeaders, DWORD dwReserved, LPWSTR* pszAdditionalHeaders);
	HRESULT OnResponse(DWORD dwResponseCode, LPCWSTR szResponseHeaders, LPCWSTR szRequestHeaders, LPWSTR* pszAdditionalRequestHeaders);
}
mixin DEFINE_GUID!(IHttpNegotiate, "79eac9d2-baf9-11ce-8c82-00aa004ba90b");
alias IHttpNegotiate LPHTTPNEGOTIATE;

//extern extern(C) const IID IID_IHttpNegotiate2;
interface IHttpNegotiate2 : IHttpNegotiate {
public extern(Windows):
	HRESULT GetRootSecurityId(BYTE* pbSecurityId, DWORD* pcbSecurityId, DWORD_PTR dwReserved);
}
mixin DEFINE_IID!(IHttpNegotiate2, "4F9F9FCB-E0F4-48eb-B7AB-FA2EA9365CB4");
alias IHttpNegotiate2 LPHTTPNEGOTIATE2;

//extern extern(C) const IID IID_IHttpNegotiate3;
interface IHttpNegotiate3 : IHttpNegotiate2 {
public extern(Windows):
	HRESULT GetSerializedClientCertContext(BYTE** ppbCert, DWORD* pcbCert);
}
mixin DEFINE_IID!(IHttpNegotiate3, "57b6c80a-34c2-4602-bc26-66a02fc57153");
alias IHttpNegotiate3 LPHTTPNEGOTIATE3;

//extern extern(C) const IID IID_IWinInetFileStream;
interface IWinInetFileStream : IUnknown {
public extern(Windows):
	HRESULT SetHandleForUnlock(DWORD_PTR hWinInetLockHandle, DWORD_PTR dwReserved);
	HRESULT SetDeleteFile(DWORD_PTR dwReserved);
}
mixin DEFINE_IID!(IWinInetFileStream, "F134C4B7-B1F8-4e75-B886-74B90943BECB");
alias IWinInetFileStream LPWININETFILESTREAM;

//extern extern(C) const IID IID_IWindowForBindingUI;
interface IWindowForBindingUI : IUnknown {
public extern(Windows):
	HRESULT GetWindow(REFGUID rguidReason, HWND* phwnd);
}
mixin DEFINE_IID!(IWindowForBindingUI, "79eac9d5-bafa-11ce-8c82-00aa004ba90b");
alias IWindowForBindingUI LPWINDOWFORBINDINGUI;

enum {
	CIP_DISK_FULL = 0,
	CIP_ACCESS_DENIED,
	CIP_NEWER_VERSION_EXISTS,
	CIP_OLDER_VERSION_EXISTS,
	CIP_NAME_CONFLICT,
	CIP_TRUST_VERIFICATION_COMPONENT_MISSING,
	CIP_EXE_SELF_REGISTERATION_TIMEOUT,
	CIP_UNSAFE_TO_ABORT,
	CIP_NEED_REBOOT,
	CIP_NEED_REBOOT_UI_PERMISSION
}
alias int CIP_STATUS;

//extern extern(C) const IID IID_ICodeInstall;
interface ICodeInstall : IWindowForBindingUI {
public extern(Windows):
	HRESULT OnCodeInstallProblem(ULONG ulStatusCode, LPCWSTR szDestination, LPCWSTR szSource, DWORD dwReserved);
}
mixin DEFINE_IID!(ICodeInstall, "79eac9d1-baf9-11ce-8c82-00aa004ba90b");
alias ICodeInstall LPCODEINSTALL;

//(_WIN32_IE >= _WIN32_IE_IE70)
	enum {
		Uri_PROPERTY_ABSOLUTE_URI   = 0,
		Uri_PROPERTY_STRING_START   = Uri_PROPERTY_ABSOLUTE_URI,
		Uri_PROPERTY_AUTHORITY      = 1,
		Uri_PROPERTY_DISPLAY_URI    = 2,
		Uri_PROPERTY_DOMAIN         = 3,
		Uri_PROPERTY_EXTENSION      = 4,
		Uri_PROPERTY_FRAGMENT       = 5,
		Uri_PROPERTY_HOST           = 6,
		Uri_PROPERTY_PASSWORD       = 7,
		Uri_PROPERTY_PATH           = 8,
		Uri_PROPERTY_PATH_AND_QUERY = 9,
		Uri_PROPERTY_QUERY          = 10,
		Uri_PROPERTY_RAW_URI        = 11,
		Uri_PROPERTY_SCHEME_NAME    = 12,
		Uri_PROPERTY_USER_INFO      = 13,
		Uri_PROPERTY_USER_NAME      = 14,
		Uri_PROPERTY_STRING_LAST    = Uri_PROPERTY_USER_NAME,
		Uri_PROPERTY_HOST_TYPE      = 15,
		Uri_PROPERTY_DWORD_START    = Uri_PROPERTY_HOST_TYPE,
		Uri_PROPERTY_PORT           = 16,
		Uri_PROPERTY_SCHEME         = 17,
		Uri_PROPERTY_ZONE           = 18,
		Uri_PROPERTY_DWORD_LAST     = Uri_PROPERTY_ZONE
	}
	alias int Uri_PROPERTY;

	enum {
		Uri_HOST_UNKNOWN = 0,
		Uri_HOST_DNS,
		Uri_HOST_IPV4,
		Uri_HOST_IPV6,
		Uri_HOST_IDN
	}
	alias int Uri_HOST_TYPE;

	//extern extern(C) const IID IID_IUri;
	interface IUri : IUnknown {
	public extern(Windows):
		HRESULT GetPropertyBSTR(Uri_PROPERTY uriProp, BSTR* pbstrProperty, DWORD dwFlags);
		HRESULT GetPropertyLength(Uri_PROPERTY uriProp, DWORD* pcchProperty, DWORD dwFlags);
		HRESULT GetPropertyDWORD(Uri_PROPERTY uriProp, DWORD* pdwProperty, DWORD dwFlags);
		HRESULT HasProperty(Uri_PROPERTY uriProp,BOOL* pfHasProperty);
		HRESULT GetAbsoluteUri(BSTR* pbstrAbsoluteUri);
		HRESULT GetAuthority(BSTR* pbstrAuthority);
		HRESULT GetDisplayUri(BSTR* pbstrDisplayString);
		HRESULT GetDomain(BSTR* pbstrDomain);
		HRESULT GetExtension(BSTR* pbstrExtension);
		HRESULT GetFragment(BSTR* pbstrFragment);
		HRESULT GetHost(BSTR* pbstrHost);
		HRESULT GetPassword(BSTR* pbstrPassword);
		HRESULT GetPath(BSTR* pbstrPath);
		HRESULT GetPathAndQuery(BSTR* pbstrPathAndQuery);
		HRESULT GetQuery(BSTR* pbstrQuery);
		HRESULT GetRawUri(BSTR* pbstrRawUri);
		HRESULT GetSchemeName(BSTR* pbstrSchemeName);
		HRESULT GetUserInfo(BSTR* pbstrUserInfo);
		HRESULT GetUserName(BSTR* pbstrUserName);
		HRESULT GetHostType(DWORD* pdwHostType);
		HRESULT GetPort(DWORD* pdwPort);
		HRESULT GetScheme(DWORD* pdwScheme);
		HRESULT GetZone(DWORD* pdwZone);
		HRESULT GetProperties(LPDWORD pdwFlags);
		HRESULT IsEqual(IUri pUri, BOOL* pfEqual);
	}
	mixin DEFINE_IID!(IUri, "A39EE748-6A27-4817-A6F2-13914BEF5890");

static if(_WIN32_IE >= _WIN32_IE_IE70){
	export extern(Windows) HRESULT CreateUri(LPCWSTR pwzURI, DWORD dwFlags, DWORD_PTR dwReserved, IUri* ppURI);
	export extern(Windows) HRESULT CreateUriWithFragment(LPCWSTR pwzURI, LPCWSTR pwzFragment, DWORD dwFlags, DWORD_PTR dwReserved, IUri* ppURI);
	export extern(Windows) HRESULT CreateUriFromMultiByteString(LPCSTR pszANSIInputUri, DWORD dwEncodingFlags, DWORD dwCodePage, DWORD dwCreateFlags, DWORD_PTR dwReserved, IUri* ppUri);
}

//(_WIN32_IE >= _WIN32_IE_IE70)
	enum {
		Uri_HAS_ABSOLUTE_URI   = 1 << Uri_PROPERTY_ABSOLUTE_URI,
		Uri_HAS_AUTHORITY      = 1 << Uri_PROPERTY_AUTHORITY,
		Uri_HAS_DISPLAY_URI    = 1 << Uri_PROPERTY_DISPLAY_URI,
		Uri_HAS_DOMAIN         = 1 << Uri_PROPERTY_DOMAIN,
		Uri_HAS_EXTENSION      = 1 << Uri_PROPERTY_EXTENSION,
		Uri_HAS_FRAGMENT       = 1 << Uri_PROPERTY_FRAGMENT,
		Uri_HAS_HOST           = 1 << Uri_PROPERTY_HOST,
		Uri_HAS_PASSWORD       = 1 << Uri_PROPERTY_PASSWORD,
		Uri_HAS_PATH           = 1 << Uri_PROPERTY_PATH,
		Uri_HAS_QUERY          = 1 << Uri_PROPERTY_QUERY,
		Uri_HAS_RAW_URI        = 1 << Uri_PROPERTY_RAW_URI,
		Uri_HAS_SCHEME_NAME    = 1 << Uri_PROPERTY_SCHEME_NAME,
		Uri_HAS_USER_NAME      = 1 << Uri_PROPERTY_USER_NAME,
		Uri_HAS_PATH_AND_QUERY = 1 << Uri_PROPERTY_PATH_AND_QUERY,
		Uri_HAS_USER_INFO      = 1 << Uri_PROPERTY_USER_INFO,
		Uri_HAS_HOST_TYPE      = 1 << Uri_PROPERTY_HOST_TYPE,
		Uri_HAS_PORT           = 1 << Uri_PROPERTY_PORT,
		Uri_HAS_SCHEME         = 1 << Uri_PROPERTY_SCHEME,
		Uri_HAS_ZONE           = 1 << Uri_PROPERTY_ZONE,
	}
	enum {
		Uri_CREATE_ALLOW_RELATIVE                 = 0x00000001,
		Uri_CREATE_ALLOW_IMPLICIT_WILDCARD_SCHEME = 0x00000002,
		Uri_CREATE_ALLOW_IMPLICIT_FILE_SCHEME     = 0x00000004,
		Uri_CREATE_NOFRAG                         = 0x00000008,
		Uri_CREATE_NO_CANONICALIZE                = 0x00000010,
		Uri_CREATE_CANONICALIZE                   = 0x00000100,
		Uri_CREATE_FILE_USE_DOS_PATH              = 0x00000020,
		Uri_CREATE_DECODE_EXTRA_INFO              = 0x00000040,
		Uri_CREATE_NO_DECODE_EXTRA_INFO           = 0x00000080,
		Uri_CREATE_CRACK_UNKNOWN_SCHEMES          = 0x00000200,
		Uri_CREATE_NO_CRACK_UNKNOWN_SCHEMES       = 0x00000400,
		Uri_CREATE_PRE_PROCESS_HTML_URI           = 0x00000800,
		Uri_CREATE_NO_PRE_PROCESS_HTML_URI        = 0x00001000,
		Uri_CREATE_IE_SETTINGS                    = 0x00002000,
		Uri_CREATE_NO_IE_SETTINGS                 = 0x00004000,
		Uri_CREATE_NO_ENCODE_FORBIDDEN_CHARACTERS = 0x00008000,
	}
	enum {
		Uri_DISPLAY_NO_FRAGMENT = 0x00000001,
		Uri_PUNYCODE_IDN_HOST   = 0x00000002,
		Uri_DISPLAY_IDN_HOST    = 0x00000004,
	}
	enum {
		Uri_ENCODING_USER_INFO_AND_PATH_IS_PERCENT_ENCODED_UTF8 = 0x00000001,
		Uri_ENCODING_USER_INFO_AND_PATH_IS_CP                   = 0x00000002,
		Uri_ENCODING_HOST_IS_IDN                                = 0x00000004,
		Uri_ENCODING_HOST_IS_PERCENT_ENCODED_UTF8               = 0x00000008,
		Uri_ENCODING_HOST_IS_PERCENT_ENCODED_CP                 = 0x00000010,
		Uri_ENCODING_QUERY_AND_FRAGMENT_IS_PERCENT_ENCODED_UTF8 = 0x00000020,
		Uri_ENCODING_QUERY_AND_FRAGMENT_IS_CP                   = 0x00000040,
		Uri_ENCODING_RFC                                        = Uri_ENCODING_USER_INFO_AND_PATH_IS_PERCENT_ENCODED_UTF8 | Uri_ENCODING_HOST_IS_PERCENT_ENCODED_UTF8 | Uri_ENCODING_QUERY_AND_FRAGMENT_IS_PERCENT_ENCODED_UTF8,
	}
	enum UriBuilder_USE_ORIGINAL_FLAGS = 0x00000001;

	//extern extern(C) const IID IID_IUriContainer;
	interface IUriContainer : IUnknown {
	public extern(Windows):
		 HRESULT GetIUri(IUri* ppIUri);
	}
	mixin DEFINE_IID!(IUriContainer, "a158a630-ed6f-45fb-b987-f68676f57752");

	//extern extern(C) const IID IID_IUriBuilder;
	interface IUriBuilder : IUnknown {
	public extern(Windows):
		HRESULT CreateUriSimple(DWORD dwAllowEncodingPropertyMask, DWORD_PTR dwReserved, IUri* ppIUri);
		HRESULT CreateUri(DWORD dwCreateFlags, DWORD dwAllowEncodingPropertyMask, DWORD_PTR dwReserved, IUri* ppIUri);
		HRESULT CreateUriWithFlags(DWORD dwCreateFlags, DWORD dwUriBuilderFlags, DWORD dwAllowEncodingPropertyMask, DWORD_PTR dwReserved, IUri* ppIUri);
		HRESULT GetIUri(IUri* ppIUri);
		HRESULT SetIUri(IUri pIUri);
		HRESULT GetFragment(DWORD* pcchFragment, LPCWSTR* ppwzFragment);
		HRESULT GetHost(DWORD* pcchHost, LPCWSTR* ppwzHost);
		HRESULT GetPassword(DWORD* pcchPassword, LPCWSTR* ppwzPassword);
		HRESULT GetPath(DWORD* pcchPath, LPCWSTR* ppwzPath);
		HRESULT GetPort(BOOL* pfHasPort, DWORD* pdwPort);
		HRESULT GetQuery(DWORD* pcchQuery, LPCWSTR* ppwzQuery);
		HRESULT GetSchemeName(DWORD* pcchSchemeName, LPCWSTR* ppwzSchemeName);
		HRESULT GetUserName(DWORD* pcchUserName, LPCWSTR* ppwzUserName);
		HRESULT SetFragment(LPCWSTR pwzNewValue);
		HRESULT SetHost(LPCWSTR pwzNewValue);
		HRESULT SetPassword(LPCWSTR pwzNewValue);
		HRESULT SetPath(LPCWSTR pwzNewValue);
		HRESULT SetPort(BOOL fHasPort, DWORD dwNewValue);
		HRESULT SetQuery(LPCWSTR pwzNewValue);
		HRESULT SetSchemeName(LPCWSTR pwzNewValue);
		HRESULT SetUserName(LPCWSTR pwzNewValue);
		HRESULT RemoveProperties(DWORD dwPropertyMask);
		HRESULT HasBeenModified(BOOL* pfModified);
	}
	mixin DEFINE_IID!(IUriBuilder, "4221B2E1-8955-46c0-BD5B-DE9897565DE7");

	//extern extern(C) const IID IID_IUriBuilderFactory;
	interface IUriBuilderFactory : IUnknown {
	public extern(Windows):
		HRESULT CreateIUriBuilder(DWORD dwFlags, DWORD_PTR dwReserved, IUriBuilder* ppIUriBuilder);
		HRESULT CreateInitializedIUriBuilder(DWORD dwFlags, DWORD_PTR dwReserved, IUriBuilder* ppIUriBuilder);
	}
	mixin DEFINE_IID!(IUriBuilderFactory, "E982CE48-0B96-440c-BC37-0C869B27A29E");

static if(_WIN32_IE >= _WIN32_IE_IE70){
	export extern(Windows) HRESULT CreateIUriBuilder(IUri pIUri, DWORD dwFlags, DWORD_PTR dwReserved, IUriBuilder* ppIUriBuilder);
	export extern(Windows) HRESULT CreateURLMonikerEx2(LPMONIKER pMkCtx, IUri pUri, LPMONIKER* ppmk, DWORD dwFlags);
}

//extern extern(C) const IID IID_IWinInetInfo;
interface IWinInetInfo : IUnknown {
public extern(Windows):
	HRESULT QueryOption(DWORD dwOption, LPVOID pBuffer, DWORD* pcbBuf);
}
mixin DEFINE_IID!(IWinInetInfo, "79eac9d6-bafa-11ce-8c82-00aa004ba90b");
alias IWinInetInfo LPWININETINFO;

export extern(Windows){
	HRESULT IWinInetInfo_RemoteQueryOption_Proxy(IWinInetInfo This, DWORD dwOption, BYTE* pBuffer, DWORD* pcbBuf);
	void IWinInetInfo_RemoteQueryOption_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_IHttpSecurity;
interface IHttpSecurity : IWindowForBindingUI {
public extern(Windows):
	HRESULT OnSecurityProblem(DWORD dwProblem);
}
mixin DEFINE_IID!(IHttpSecurity, "79eac9d7-bafa-11ce-8c82-00aa004ba90b");
alias IHttpSecurity LPHTTPSECURITY;

//extern extern(C) const IID IID_IWinInetHttpInfo;
interface IWinInetHttpInfo : IWinInetInfo {
public extern(Windows):
	HRESULT QueryInfo(DWORD dwOption, LPVOID pBuffer, DWORD* pcbBuf, DWORD* pdwFlags, DWORD* pdwReserved);
}
mixin DEFINE_IID!(IWinInetHttpInfo, "79eac9d8-bafa-11ce-8c82-00aa004ba90b");
alias IWinInetHttpInfo LPWININETHTTPINFO;

export extern(Windows){
	HRESULT IWinInetHttpInfo_RemoteQueryInfo_Proxy(IWinInetHttpInfo This, DWORD dwOption, BYTE* pBuffer, DWORD* pcbBuf, DWORD* pdwFlags, DWORD* pdwReserved);
	void IWinInetHttpInfo_RemoteQueryInfo_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_IWinInetCacheHints;
interface IWinInetCacheHints : IUnknown {
public extern(Windows):
	HRESULT SetCacheExtension(LPCWSTR pwzExt,LPVOID pszCacheFile, DWORD* pcbCacheFile, DWORD* pdwWinInetError, DWORD* pdwReserved);
}
mixin DEFINE_IID!(IWinInetCacheHints, "DD1EC3B3-8391-4fdb-A9E6-347C3CAAA7DD");
alias IWinInetCacheHints LPWININETCACHEHINTS;

//(_WIN32_IE >= _WIN32_IE_IE70)
	//extern extern(C) const IID IID_IWinInetCacheHints2;
	interface IWinInetCacheHints2 : IWinInetCacheHints {
	public extern(Windows):
		HRESULT SetCacheExtension2(LPCWSTR pwzExt, WCHAR* pwzCacheFile, DWORD* pcchCacheFile, DWORD* pdwWinInetError, DWORD* pdwReserved);
	}
	mixin DEFINE_IID!(IWinInetCacheHints2, "7857AEAC-D31F-49bf-884E-DD46DF36780A");
	alias IWinInetCacheHints2 LPWININETCACHEHINTS2;

//extern extern(C) const IID IID_IBindHost;
interface IBindHost : IUnknown {
public extern(Windows):
	HRESULT CreateMoniker(LPOLESTR szName, IBindCtx pBC, IMoniker* ppmk, DWORD dwReserved);
	HRESULT MonikerBindToStorage(IMoniker pMk, IBindCtx pBC, IBindStatusCallback pBSC, REFIID riid, void** ppvObj);
	HRESULT MonikerBindToObject(IMoniker pMk, IBindCtx pBC, IBindStatusCallback pBSC, REFIID riid, void** ppvObj);
}
mixin DEFINE_IID!(IBindHost, "fc4801a1-2ba9-11cf-a229-00aa003d7352");
alias IBindHost LPBINDHOST;

alias IID_IBindHost SID_IBindHost;
alias IID_IBindHost SID_SBindHost;
extern extern(C) const GUID SID_BindHost;

export extern(Windows){
	HRESULT IBindHost_RemoteMonikerBindToStorage_Proxy(IBindHost This, IMoniker pMk, IBindCtx pBC, IBindStatusCallback pBSC, REFIID riid, IUnknown* ppvObj);
	void IBindHost_RemoteMonikerBindToStorage_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IBindHost_RemoteMonikerBindToObject_Proxy(IBindHost This, IMoniker pMk, IBindCtx pBC, IBindStatusCallback pBSC, REFIID riid, IUnknown* ppvObj);
	void IBindHost_RemoteMonikerBindToObject_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

enum {
	URLOSTRM_USECACHEDCOPY_ONLY = 0x1,
	URLOSTRM_USECACHEDCOPY      = 0x2,
	URLOSTRM_GETNEWESTVERSION   = 0x3,
}

//struct IBindStatusCallback;
export extern(Windows) HRESULT HlinkSimpleNavigateToString(LPCWSTR szTarget, LPCWSTR szLocation, LPCWSTR szTargetFrameName, IUnknown pUnk, IBindCtx pbc, IBindStatusCallback, DWORD grfHLNF, DWORD dwReserved);
export extern(Windows) HRESULT HlinkSimpleNavigateToMoniker(IMoniker pmkTarget, LPCWSTR szLocation, LPCWSTR szTargetFrameName, IUnknown pUnk, IBindCtx pbc, IBindStatusCallback, DWORD grfHLNF, DWORD dwReserved);

export extern(Windows) HRESULT URLOpenStreamA(LPUNKNOWN, LPCSTR, DWORD, LPBINDSTATUSCALLBACK);
export extern(Windows) HRESULT URLOpenStreamW(LPUNKNOWN, LPCWSTR, DWORD, LPBINDSTATUSCALLBACK);
export extern(Windows) HRESULT URLOpenPullStreamA(LPUNKNOWN, LPCSTR, DWORD, LPBINDSTATUSCALLBACK);
export extern(Windows) HRESULT URLOpenPullStreamW(LPUNKNOWN, LPCWSTR, DWORD, LPBINDSTATUSCALLBACK);
export extern(Windows) HRESULT URLDownloadToFileA(LPUNKNOWN, LPCSTR, LPCSTR, DWORD, LPBINDSTATUSCALLBACK);
export extern(Windows) HRESULT URLDownloadToFileW(LPUNKNOWN, LPCWSTR, LPCWSTR, DWORD, LPBINDSTATUSCALLBACK);
export extern(Windows) HRESULT URLDownloadToCacheFileA(LPUNKNOWN, LPCSTR, LPSTR, DWORD cchFileName, DWORD, LPBINDSTATUSCALLBACK);
export extern(Windows) HRESULT URLDownloadToCacheFileW(LPUNKNOWN, LPCWSTR,LPWSTR, DWORD cchFileName, DWORD, LPBINDSTATUSCALLBACK);
export extern(Windows) HRESULT URLOpenBlockingStreamA(LPUNKNOWN, LPCSTR, LPSTREAM*, DWORD, LPBINDSTATUSCALLBACK);
export extern(Windows) HRESULT URLOpenBlockingStreamW(LPUNKNOWN, LPCWSTR, LPSTREAM*, DWORD, LPBINDSTATUSCALLBACK);

version(UNICODE){
	alias URLOpenStreamW URLOpenStream;
	alias URLOpenPullStreamW URLOpenPullStream;
	alias URLDownloadToFileW URLDownloadToFile;
	alias URLDownloadToCacheFileW URLDownloadToCacheFile;
	alias URLOpenBlockingStreamW URLOpenBlockingStream;
}else{
	alias URLOpenStreamA URLOpenStream;
	alias URLOpenPullStreamA URLOpenPullStream;
	alias URLDownloadToFileA URLDownloadToFile;
	alias URLDownloadToCacheFileA URLDownloadToCacheFile;
	alias URLOpenBlockingStreamA URLOpenBlockingStream;
}

export extern(Windows) HRESULT HlinkGoBack(IUnknown pUnk);
export extern(Windows) HRESULT HlinkGoForward(IUnknown pUnk);
export extern(Windows) HRESULT HlinkNavigateString(IUnknown pUnk, LPCWSTR szTarget);
export extern(Windows) HRESULT HlinkNavigateMoniker(IUnknown pUnk, IMoniker pmkTarget);

//extern extern(C) const IID IID_IInternet;
interface IInternet : IUnknown {
public extern(Windows):
}
mixin DEFINE_IID!(IInternet, "79eac9e0-baf9-11ce-8c82-00aa004ba90b");
alias IInternet LPIINTERNET;

enum {
	BINDSTRING_HEADERS = 1,
	BINDSTRING_ACCEPT_MIMES,
	BINDSTRING_EXTRA_URL,
	BINDSTRING_LANGUAGE,
	BINDSTRING_USERNAME,
	BINDSTRING_PASSWORD,
	BINDSTRING_UA_PIXELS,
	BINDSTRING_UA_COLOR,
	BINDSTRING_OS,
	BINDSTRING_USER_AGENT,
	BINDSTRING_ACCEPT_ENCODINGS,
	BINDSTRING_POST_COOKIE,
	BINDSTRING_POST_DATA_MIME,
	BINDSTRING_URL,
	BINDSTRING_IID,
	BINDSTRING_FLAG_BIND_TO_OBJECT,
	BINDSTRING_PTR_BIND_CONTEXT,
	BINDSTRING_XDR_ORIGIN
}
alias int BINDSTRING;

//extern extern(C) const IID IID_IInternetBindInfo;
interface IInternetBindInfo : IUnknown {
public extern(Windows):
	HRESULT GetBindInfo(DWORD* grfBINDF, BINDINFO* pbindinfo);
	HRESULT GetBindString(ULONG ulStringType, LPOLESTR* ppwzStr, ULONG cEl, ULONG* pcElFetched);
}
mixin DEFINE_IID!(IInternetBindInfo, "79eac9e1-baf9-11ce-8c82-00aa004ba90b");
alias IInternetBindInfo LPIINTERNETBINDINFO;

//extern extern(C) const IID IID_IInternetBindInfoEx;
interface IInternetBindInfoEx : IInternetBindInfo {
public extern(Windows):
	HRESULT GetBindInfoEx(DWORD* grfBINDF, BINDINFO* pbindinfo, DWORD* grfBINDF2, DWORD* pdwReserved);
}
mixin DEFINE_IID!(IInternetBindInfoEx, "a3e015b7-a82c-4dcd-a150-569aeeed36ab");
alias IInternetBindInfoEx LPIINTERNETBINDINFOEX;

enum {
	PI_PARSE_URL            = 0x1,
	PI_FILTER_MODE          = 0x2,
	PI_FORCE_ASYNC          = 0x4,
	PI_USE_WORKERTHREAD     = 0x8,
	PI_MIMEVERIFICATION     = 0x10,
	PI_CLSIDLOOKUP          = 0x20,
	PI_DATAPROGRESS         = 0x40,
	PI_SYNCHRONOUS          = 0x80,
	PI_APARTMENTTHREADED    = 0x100,
	PI_CLASSINSTALL         = 0x200,
	PI_PASSONBINDCTX        = 0x2000,
	PI_NOMIMEHANDLER        = 0x8000,
	PI_LOADAPPDIRECT        = 0x4000,
	PD_FORCE_SWITCH         = 0x10000,
	PI_PREFERDEFAULTHANDLER = 0x20000
}
alias int PI_FLAGS;

struct PROTOCOLDATA {
	DWORD grfFlags;
	DWORD dwState;
	LPVOID pData;
	ULONG cbData;
}

struct StartParam {
	IID iid;
	IBindCtx pIBindCtx;
	IUnknown pItf;
}

//extern extern(C) const IID IID_IInternetProtocolRoot;
interface IInternetProtocolRoot : IUnknown {
public extern(Windows):
	HRESULT Start(LPCWSTR szUrl, IInternetProtocolSink pOIProtSink, IInternetBindInfo pOIBindInfo, DWORD grfPI, HANDLE_PTR dwReserved);
	HRESULT Continue(PROTOCOLDATA* pProtocolData);
	HRESULT Abort(HRESULT hrReason, DWORD dwOptions);
	HRESULT Terminate(DWORD dwOptions);
	HRESULT Suspend();
	HRESULT Resume();
}
mixin DEFINE_IID!(IInternetProtocolRoot, "79eac9e3-baf9-11ce-8c82-00aa004ba90b");
alias IInternetProtocolRoot LPIINTERNETPROTOCOLROOT;

//extern extern(C) const IID IID_IInternetProtocol;
interface IInternetProtocol : IInternetProtocolRoot {
public extern(Windows):
	HRESULT Read(void* pv, ULONG cb, ULONG* pcbRead);
	HRESULT Seek(LARGE_INTEGER dlibMove, DWORD dwOrigin, ULARGE_INTEGER* plibNewPosition);
	HRESULT LockRequest(DWORD dwOptions);
	HRESULT UnlockRequest();
}
mixin DEFINE_IID!(IInternetProtocol, "79eac9e4-baf9-11ce-8c82-00aa004ba90b");
alias IInternetProtocol LPIINTERNETPROTOCOL;

//(_WIN32_IE >= _WIN32_IE_IE70)
	//extern extern(C) const IID IID_IInternetProtocolEx;
	interface IInternetProtocolEx : IInternetProtocol {
	public extern(Windows):
		HRESULT StartEx(IUri pUri, IInternetProtocolSink pOIProtSink, IInternetBindInfo pOIBindInfo, DWORD grfPI, HANDLE_PTR dwReserved);
	}
	mixin DEFINE_IID!(IInternetProtocolEx, "C7A98E66-1010-492c-A1C8-C809E1F75905");

//extern extern(C) const IID IID_IInternetProtocolSink;
interface IInternetProtocolSink : IUnknown {
public extern(Windows):
	HRESULT Switch(PROTOCOLDATA* pProtocolData);
	HRESULT ReportProgress(ULONG ulStatusCode, LPCWSTR szStatusText);
	HRESULT ReportData(DWORD grfBSCF, ULONG ulProgress, ULONG ulProgressMax);
	HRESULT ReportResult(HRESULT hrResult, DWORD dwError, LPCWSTR szResult);
}
mixin DEFINE_IID!(IInternetProtocolSink, "79eac9e5-baf9-11ce-8c82-00aa004ba90b");
alias IInternetProtocolSink LPIINTERNETPROTOCOLSINK;

//extern extern(C) const IID IID_IInternetProtocolSinkStackable;
interface IInternetProtocolSinkStackable : IUnknown {
public extern(Windows):
	HRESULT SwitchSink(IInternetProtocolSink pOIProtSink);
	HRESULT CommitSwitch();
	HRESULT RollbackSwitch();
}
mixin DEFINE_IID!(IInternetProtocolSinkStackable, "79eac9f0-baf9-11ce-8c82-00aa004ba90b");
alias IInternetProtocolSinkStackable LPIINTERNETPROTOCOLSINKStackable;

enum {
	OIBDG_APARTMENTTHREADED = 0x100,
	OIBDG_DATAONLY          = 0x1000
}
alias int OIBDG_FLAGS;

//extern extern(C) const IID IID_IInternetSession;
interface IInternetSession : IUnknown {
public extern(Windows):
	HRESULT RegisterNameSpace(IClassFactory pCF, REFCLSID rclsid, LPCWSTR pwzProtocol, ULONG cPatterns, LPCWSTR* ppwzPatterns, DWORD dwReserved);
	HRESULT UnregisterNameSpace(IClassFactory pCF, LPCWSTR pszProtocol);
	HRESULT RegisterMimeFilter(IClassFactory pCF, REFCLSID rclsid, LPCWSTR pwzType);
	HRESULT UnregisterMimeFilter(IClassFactory pCF, LPCWSTR pwzType);
	HRESULT CreateBinding(LPBC pBC, LPCWSTR szUrl, IUnknown pUnkOuter, IUnknown* ppUnk, IInternetProtocol* ppOInetProt, DWORD dwOption);
	HRESULT SetSessionOption(DWORD dwOption, LPVOID pBuffer, DWORD dwBufferLength, DWORD dwReserved);
	HRESULT GetSessionOption(DWORD dwOption, LPVOID pBuffer, DWORD* pdwBufferLength, DWORD dwReserved);
}
mixin DEFINE_IID!(IInternetSession, "79eac9e7-baf9-11ce-8c82-00aa004ba90b");
alias IInternetSession LPIINTERNETSESSION;

//extern extern(C) const IID IID_IInternetThreadSwitch;
interface IInternetThreadSwitch : IUnknown {
public extern(Windows):
	HRESULT Prepare();
	HRESULT Continue();
}
mixin DEFINE_IID!(IInternetThreadSwitch, "79eac9e8-baf9-11ce-8c82-00aa004ba90b");
alias IInternetThreadSwitch LPIINTERNETTHREADSWITCH;

//extern extern(C) const IID IID_IInternetPriority;
interface IInternetPriority : IUnknown {
public extern(Windows):
	HRESULT SetPriority(LONG nPriority);
	HRESULT GetPriority(LONG* pnPriority);
}
mixin DEFINE_IID!(IInternetPriority, "79eac9eb-baf9-11ce-8c82-00aa004ba90b");
alias IInternetPriority LPIINTERNETPRIORITY;

enum {
	PARSE_CANONICALIZE = 1,
	PARSE_FRIENDLY,
	PARSE_SECURITY_URL,
	PARSE_ROOTDOCUMENT,
	PARSE_DOCUMENT,
	PARSE_ANCHOR,
	PARSE_ENCODE_IS_UNESCAPE,
	PARSE_DECODE_IS_ESCAPE,
	PARSE_PATH_FROM_URL,
	PARSE_URL_FROM_PATH,
	PARSE_MIME,
	PARSE_SERVER,
	PARSE_SCHEMA,
	PARSE_SITE,
	PARSE_DOMAIN,
	PARSE_LOCATION,
	PARSE_SECURITY_DOMAIN,
	PARSE_ESCAPE,
	PARSE_UNESCAPE,
}
alias int PARSEACTION;

enum {
	PSU_DEFAULT = 1,
	PSU_SECURITY_URL_ONLY,
}
alias int PSUACTION;

enum {
	QUERY_EXPIRATION_DATE = 1,
	QUERY_TIME_OF_LAST_CHANGE,
	QUERY_CONTENT_ENCODING,
	QUERY_CONTENT_TYPE,
	QUERY_REFRESH,
	QUERY_RECOMBINE,
	QUERY_CAN_NAVIGATE,
	QUERY_USES_NETWORK,
	QUERY_IS_CACHED,
	QUERY_IS_INSTALLEDENTRY,
	QUERY_IS_CACHED_OR_MAPPED,
	QUERY_USES_CACHE,
	QUERY_IS_SECURE,
	QUERY_IS_SAFE,
	QUERY_USES_HISTORYFOLDER,
}
alias int QUERYOPTION;

//extern extern(C) const IID IID_IInternetProtocolInfo;
interface IInternetProtocolInfo : IUnknown {
public extern(Windows):
	HRESULT ParseUrl(LPCWSTR pwzUrl, PARSEACTION ParseAction, DWORD dwParseFlags, LPWSTR pwzResult, DWORD cchResult, DWORD* pcchResult, DWORD dwReserved);
	HRESULT CombineUrl(LPCWSTR pwzBaseUrl, LPCWSTR pwzRelativeUrl, DWORD dwCombineFlags, LPWSTR pwzResult, DWORD cchResult, DWORD* pcchResult, DWORD dwReserved);
	HRESULT CompareUrl(LPCWSTR pwzUrl1, LPCWSTR pwzUrl2, DWORD dwCompareFlags);
	HRESULT QueryInfo(LPCWSTR pwzUrl, QUERYOPTION OueryOption, DWORD dwQueryFlags, LPVOID pBuffer, DWORD cbBuffer, DWORD* pcbBuf, DWORD dwReserved);
}
mixin DEFINE_IID!(IInternetProtocolInfo, "79eac9ec-baf9-11ce-8c82-00aa004ba90b");
alias IInternetProtocolInfo* LPIINTERNETPROTOCOLINFO;

alias IInternet IOInet;
alias IInternetBindInfo IOInetBindInfo;
alias IInternetBindInfoEx IOInetBindInfoEx;
alias IInternetProtocolRoot IOInetProtocolRoot;
alias IInternetProtocol IOInetProtocol;
//(_WIN32_IE >= _WIN32_IE_IE70)
	alias IInternetProtocolEx IOInetProtocolEx;
alias IInternetProtocolSink IOInetProtocolSink;
alias IInternetProtocolInfo IOInetProtocolInfo;
alias IInternetSession IOInetSession;
alias IInternetPriority IOInetPriority;
alias IInternetThreadSwitch IOInetThreadSwitch;
alias IInternetProtocolSinkStackable IOInetProtocolSinkStackable;
alias LPIINTERNET LPOINET;
alias LPIINTERNETPROTOCOLINFO LPOINETPROTOCOLINFO;
alias LPIINTERNETBINDINFO LPOINETBINDINFO;
alias LPIINTERNETPROTOCOLROOT LPOINETPROTOCOLROOT;
alias LPIINTERNETPROTOCOL LPOINETPROTOCOL;
//(_WIN32_IE >= _WIN32_IE_IE70)
//	alias LPIINTERNETPROTOCOLEX LPOINETPROTOCOLEX; not defined
alias LPIINTERNETPROTOCOLSINK LPOINETPROTOCOLSINK;
alias LPIINTERNETSESSION LPOINETSESSION;
alias LPIINTERNETTHREADSWITCH LPOINETTHREADSWITCH;
alias LPIINTERNETPRIORITY LPOINETPRIORITY;
//alias LPIINTERNETPROTOCOLINFO LPOINETPROTOCOLINFO; confict
//alias LPIINTERNETPROTOCOLSINKSTACKABLE LPOINETPROTOCOLSINKSTACKABLE; not defined
alias IID_IInternet IID_IOInet;
alias IID_IInternetBindInfo IID_IOInetBindInfo;
alias IID_IInternetBindInfoEx IID_IOInetBindInfoEx;
alias IID_IInternetProtocolRoot IID_IOInetProtocolRoot;
alias IID_IInternetProtocol IID_IOInetProtocol;
//(_WIN32_IE >= _WIN32_IE_IE70)
	alias IID_IInternetProtocolEx IID_IOInetProtocolEx;
alias IID_IInternetProtocolSink IID_IOInetProtocolSink;
alias IID_IInternetProtocolInfo IID_IOInetProtocolInfo;
alias IID_IInternetSession IID_IOInetSession;
alias IID_IInternetPriority IID_IOInetPriority;
alias IID_IInternetThreadSwitch IID_IOInetThreadSwitch;
alias IID_IInternetProtocolSinkStackable IID_IOInetProtocolSinkStackable;

export extern(Windows) HRESULT CoInternetParseUrl(LPCWSTR pwzUrl, PARSEACTION ParseAction, DWORD dwFlags, LPWSTR pszResult, DWORD cchResult, DWORD* pcchResult, DWORD dwReserved);
static if(_WIN32_IE >= _WIN32_IE_IE70)
	export extern(Windows) HRESULT CoInternetParseIUri(IUri pIUri, PARSEACTION ParseAction, DWORD dwFlags, LPWSTR pwzResult, DWORD cchResult, DWORD* pcchResult, DWORD_PTR dwReserved);
export extern(Windows) HRESULT CoInternetCombineUrl(LPCWSTR pwzBaseUrl, LPCWSTR pwzRelativeUrl, DWORD dwCombineFlags, LPWSTR pszResult, DWORD cchResult, DWORD* pcchResult, DWORD dwReserved);
static if(_WIN32_IE >= _WIN32_IE_IE70){
	export extern(Windows) HRESULT CoInternetCombineUrlEx(IUri pBaseUri, LPCWSTR pwzRelativeUrl, DWORD dwCombineFlags, IUri* ppCombinedUri, DWORD_PTR dwReserved);
	export extern(Windows) HRESULT CoInternetCombineIUri(IUri pBaseUri, IUri pRelativeUri, DWORD dwCombineFlags, IUri* ppCombinedUri, DWORD_PTR dwReserved);
}
export extern(Windows) HRESULT CoInternetCompareUrl(LPCWSTR pwzUrl1, LPCWSTR pwzUrl2, DWORD dwFlags);
export extern(Windows) HRESULT CoInternetGetProtocolFlags(LPCWSTR pwzUrl, DWORD* pdwFlags, DWORD dwReserved);
export extern(Windows) HRESULT CoInternetQueryInfo(LPCWSTR pwzUrl, QUERYOPTION QueryOptions, DWORD dwQueryFlags, LPVOID pvBuffer, DWORD cbBuffer, DWORD* pcbBuffer, DWORD dwReserved);
export extern(Windows) HRESULT CoInternetGetSession(DWORD dwSessionMode, IInternetSession* ppIInternetSession, DWORD dwReserved);
export extern(Windows) HRESULT CoInternetGetSecurityUrl(LPCWSTR pwszUrl, LPWSTR* ppwszSecUrl, PSUACTION psuAction, DWORD dwReserved);
export extern(Windows) HRESULT AsyncInstallDistributionUnit(LPCWSTR szDistUnit, LPCWSTR szTYPE, LPCWSTR szExt, DWORD dwFileVersionMS, DWORD dwFileVersionLS, LPCWSTR szURL, IBindCtx pbc, LPVOID pvReserved, DWORD flags);
static if(_WIN32_IE >= _WIN32_IE_IE70)
	export extern(Windows) HRESULT CoInternetGetSecurityUrlEx(IUri pUri, IUri* ppSecUri, PSUACTION psuAction, DWORD_PTR dwReserved);

//extern extern(C) const IID IID_IInternetSecurityManager;
interface IInternetSecurityManager : IUnknown {
public extern(Windows):
	HRESULT SetSecuritySite(IInternetSecurityMgrSite pSite);
	HRESULT GetSecuritySite(IInternetSecurityMgrSite* ppSite);
	HRESULT MapUrlToZone(LPCWSTR pwszUrl, DWORD* pdwZone, DWORD dwFlags);
	HRESULT GetSecurityId(LPCWSTR pwszUrl, BYTE* pbSecurityId, DWORD* pcbSecurityId, DWORD_PTR dwReserved);
	HRESULT ProcessUrlAction(LPCWSTR pwszUrl, DWORD dwAction, BYTE* pPolicy, DWORD cbPolicy, BYTE* pContext, DWORD cbContext, DWORD dwFlags, DWORD dwReserved);
	HRESULT QueryCustomPolicy(LPCWSTR pwszUrl, REFGUID guidKey, BYTE** ppPolicy, DWORD* pcbPolicy, BYTE* pContext, DWORD cbContext, DWORD dwReserved);
	HRESULT SetZoneMapping(DWORD dwZone, LPCWSTR lpszPattern, DWORD dwFlags);
	HRESULT GetZoneMappings(DWORD dwZone, IEnumString* ppenumString, DWORD dwFlags);
}
mixin DEFINE_IID!(IInternetSecurityManager, "79eac9ee-baf9-11ce-8c82-00aa004ba90b");

//extern extern(C) const IID IID_IInternetSecurityManagerEx;
interface IInternetSecurityManagerEx : IInternetSecurityManager {
public extern(Windows):
	HRESULT ProcessUrlActionEx(LPCWSTR pwszUrl, DWORD dwAction, BYTE* pPolicy, DWORD cbPolicy, BYTE* pContext, DWORD cbContext, DWORD dwFlags, DWORD dwReserved, DWORD* pdwOutFlags);
}
mixin DEFINE_IID!(IInternetSecurityManagerEx, "F164EDF1-CC7C-4f0d-9A94-34222625C393");

//(_WIN32_IE >= _WIN32_IE_IE70)
	//extern extern(C) const IID IID_IInternetSecurityManagerEx2;
	interface IInternetSecurityManagerEx2 : IInternetSecurityManagerEx {
	public extern(Windows):
		HRESULT MapUrlToZoneEx2(IUri pUri, DWORD* pdwZone, DWORD dwFlags, LPWSTR* ppwszMappedUrl, DWORD* pdwOutFlags);
		HRESULT ProcessUrlActionEx2(IUri pUri, DWORD dwAction, BYTE* pPolicy, DWORD cbPolicy, BYTE* pContext, DWORD cbContext, DWORD dwFlags, DWORD_PTR dwReserved, DWORD* pdwOutFlags);
		HRESULT GetSecurityIdEx2(IUri pUri, BYTE* pbSecurityId, DWORD* pcbSecurityId, DWORD_PTR dwReserved);
		HRESULT QueryCustomPolicyEx2(IUri pUri, REFGUID guidKey, BYTE** ppPolicy, DWORD* pcbPolicy, BYTE* pContext, DWORD cbContext, DWORD_PTR dwReserved);
	}
	mixin DEFINE_IID!(IInternetSecurityManagerEx2, "F1E50292-A795-4117-8E09-2B560A72AC60");

enum {
	FEATURE_OBJECT_CACHING = 0,
	FEATURE_ZONE_ELEVATION,
	FEATURE_MIME_HANDLING,
	FEATURE_MIME_SNIFFING,
	FEATURE_WINDOW_RESTRICTIONS,
	FEATURE_WEBOC_POPUPMANAGEMENT,
	FEATURE_BEHAVIORS,
	FEATURE_DISABLE_MK_PROTOCOL,
	FEATURE_LOCALMACHINE_LOCKDOWN,
	FEATURE_SECURITYBAND,
	FEATURE_RESTRICT_ACTIVEXINSTALL,
	FEATURE_VALIDATE_NAVIGATE_URL,
	FEATURE_RESTRICT_FILEDOWNLOAD,
	FEATURE_ADDON_MANAGEMENT,
	FEATURE_PROTOCOL_LOCKDOWN,
	FEATURE_HTTP_USERNAME_PASSWORD_DISABLE,
	FEATURE_SAFE_BINDTOOBJECT,
	FEATURE_UNC_SAVEDFILECHECK,
	FEATURE_GET_URL_DOM_FILEPATH_UNENCODED,
	FEATURE_TABBED_BROWSING,
	FEATURE_SSLUX,
	FEATURE_DISABLE_NAVIGATION_SOUNDS,
	FEATURE_DISABLE_LEGACY_COMPRESSION,
	FEATURE_FORCE_ADDR_AND_STATUS,
	FEATURE_XMLHTTP,
	FEATURE_DISABLE_TELNET_PROTOCOL,
	FEATURE_FEEDS,
	FEATURE_BLOCK_INPUT_PROMPTS,
	FEATURE_ENTRY_COUNT
}
alias int INTERNETFEATURELIST;

enum {
	SET_FEATURE_ON_THREAD              = 0x00000001,
	SET_FEATURE_ON_PROCESS             = 0x00000002,
	SET_FEATURE_IN_REGISTRY            = 0x00000004,
	SET_FEATURE_ON_THREAD_LOCALMACHINE = 0x00000008,
	SET_FEATURE_ON_THREAD_INTRANET     = 0x00000010,
	SET_FEATURE_ON_THREAD_TRUSTED      = 0x00000020,
	SET_FEATURE_ON_THREAD_INTERNET     = 0x00000040,
	SET_FEATURE_ON_THREAD_RESTRICTED   = 0x00000080,
}
enum {
	GET_FEATURE_FROM_THREAD              = 0x00000001,
	GET_FEATURE_FROM_PROCESS             = 0x00000002,
	GET_FEATURE_FROM_REGISTRY            = 0x00000004,
	GET_FEATURE_FROM_THREAD_LOCALMACHINE = 0x00000008,
	GET_FEATURE_FROM_THREAD_INTRANET     = 0x00000010,
	GET_FEATURE_FROM_THREAD_TRUSTED      = 0x00000020,
	GET_FEATURE_FROM_THREAD_INTERNET     = 0x00000040,
	GET_FEATURE_FROM_THREAD_RESTRICTED   = 0x00000080,
}
export extern(Windows) HRESULT CoInternetSetFeatureEnabled(INTERNETFEATURELIST FeatureEntry, DWORD dwFlags, BOOL fEnable);
export extern(Windows) HRESULT CoInternetIsFeatureEnabled(INTERNETFEATURELIST FeatureEntry, DWORD dwFlags);
export extern(Windows) HRESULT CoInternetIsFeatureEnabledForUrl(INTERNETFEATURELIST FeatureEntry, DWORD dwFlags, LPCWSTR szURL, IInternetSecurityManager pSecMgr);
export extern(Windows) HRESULT CoInternetIsFeatureEnabledForIUri(INTERNETFEATURELIST FeatureEntry, DWORD dwFlags, IUri pIUri, IInternetSecurityManagerEx2 pSecMgr);
export extern(Windows) HRESULT CoInternetIsFeatureZoneElevationEnabled(LPCWSTR szFromURL, LPCWSTR szToURL, IInternetSecurityManager pSecMgr, DWORD dwFlags);

export extern(Windows) HRESULT CopyStgMedium(const(STGMEDIUM)* pcstgmedSrc, STGMEDIUM* pstgmedDest);
export extern(Windows) HRESULT CopyBindInfo(const(BINDINFO)* pcbiSrc, BINDINFO* pbiDest);
export extern(Windows) void ReleaseBindInfo(BINDINFO* pbindinfo );

enum {
	INET_E_USE_DEFAULT_PROTOCOLHANDLER = cast(HRESULT)0x800C0011,
	INET_E_USE_DEFAULT_SETTING         = cast(HRESULT)0x800C0012,
	INET_E_DEFAULT_ACTION              = INET_E_USE_DEFAULT_PROTOCOLHANDLER,
	INET_E_QUERYOPTION_UNKNOWN         = cast(HRESULT)0x800C0013,
	INET_E_REDIRECTING                 = cast(HRESULT)0x800C0014,
}
alias CoInternetParseUrl OInetParseUrl;
alias CoInternetCombineUrl OInetCombineUrl;
static if(_WIN32_IE >= _WIN32_IE_IE70){
	alias CoInternetCombineUrlEx OInetCombineUrlEx;
	alias CoInternetCombineIUri OInetCombineIUri;
}
alias CoInternetCompareUrl OInetCompareUrl;
alias CoInternetQueryInfo OInetQueryInfo;
alias CoInternetGetSession OInetGetSession;

enum PROTOCOLFLAG_NO_PICS_CHECK = 0x00000001;

export extern(Windows) HRESULT CoInternetCreateSecurityManager(IServiceProvider pSP, IInternetSecurityManager* ppSM, DWORD dwReserved);
export extern(Windows) HRESULT CoInternetCreateZoneManager(IServiceProvider pSP, IInternetZoneManager* ppZM, DWORD dwReserved);

//extern extern(C) const IID IID_IInternetSecurityMgrSite;
interface IInternetSecurityMgrSite : IUnknown {
public extern(Windows):
	HRESULT GetWindow(HWND* phwnd);
	HRESULT EnableModeless(BOOL fEnable);
}
mixin DEFINE_IID!(IInternetSecurityMgrSite, "79eac9ed-baf9-11ce-8c82-00aa004ba90b");

enum {
	MUTZ_NOSAVEDFILECHECK       = 0x00000001,
	MUTZ_ISFILE                 = 0x00000002,
	MUTZ_ACCEPT_WILDCARD_SCHEME = 0x00000080,
	MUTZ_ENFORCERESTRICTED      = 0x00000100,
	MUTZ_RESERVED               = 0x00000200,
	MUTZ_REQUIRESAVEDFILECHECK  = 0x00000400,
	MUTZ_DONT_UNESCAPE          = 0x00000800,
	MUTZ_DONT_USE_CACHE         = 0x00001000,
	MUTZ_FORCE_INTRANET_FLAGS   = 0x00002000,
	MUTZ_IGNORE_ZONE_MAPPINGS   = 0x00004000,
}
enum MAX_SIZE_SECURITY_ID = 512;

enum {
	PUAF_DEFAULT                      = 0,
	PUAF_NOUI                         = 0x1,
	PUAF_ISFILE                       = 0x2,
	PUAF_WARN_IF_DENIED               = 0x4,
	PUAF_FORCEUI_FOREGROUND           = 0x8,
	PUAF_CHECK_TIFS                   = 0x10,
	PUAF_DONTCHECKBOXINDIALOG         = 0x20,
	PUAF_TRUSTED                      = 0x40,
	PUAF_ACCEPT_WILDCARD_SCHEME       = 0x80,
	PUAF_ENFORCERESTRICTED            = 0x100,
	PUAF_NOSAVEDFILECHECK             = 0x200,
	PUAF_REQUIRESAVEDFILECHECK        = 0x400,
	PUAF_DONT_USE_CACHE               = 0x1000,
	PUAF_RESERVED1                    = 0x2000,
	PUAF_RESERVED2                    = 0x4000,
	PUAF_LMZ_UNLOCKED                 = 0x10000,
	PUAF_LMZ_LOCKED                   = 0x20000,
	PUAF_DEFAULTZONEPOL               = 0x40000,
	PUAF_NPL_USE_LOCKED_IF_RESTRICTED = 0x80000,
	PUAF_NOUIIFLOCKED                 = 0x100000,
	PUAF_DRAGPROTOCOLCHECK            = 0x200000
}
alias int PUAF;

enum {
	PUAFOUT_DEFAULT          = 0,
	PUAFOUT_ISLOCKZONEPOLICY = 0x1
}
alias int PUAFOUT;

enum {
	SZM_CREATE = 0,
	SZM_DELETE = 0x1
}
alias int SZM_FLAGS;

//extern extern(C) const IID IID_IZoneIdentifier;
interface IZoneIdentifier : IUnknown {
public extern(Windows):
	HRESULT GetId(DWORD* pdwZone);
	HRESULT SetId(DWORD dwZone);
	HRESULT Remove();
}
mixin DEFINE_IID!(IZoneIdentifier, "cd45f185-1b21-48e2-967b-ead743a8914e");

//extern extern(C) const IID IID_IInternetHostSecurityManager;
interface IInternetHostSecurityManager : IUnknown {
public extern(Windows):
	HRESULT GetSecurityId(BYTE* pbSecurityId, DWORD* pcbSecurityId, DWORD_PTR dwReserved);
	HRESULT ProcessUrlAction(DWORD dwAction, BYTE* pPolicy, DWORD cbPolicy, BYTE* pContext, DWORD cbContext, DWORD dwFlags, DWORD dwReserved);
	HRESULT QueryCustomPolicy(REFGUID guidKey, BYTE** ppPolicy, DWORD* pcbPolicy, BYTE* pContext, DWORD cbContext, DWORD dwReserved);
}
mixin DEFINE_IID!(IInternetHostSecurityManager, "3af280b6-cb3f-11d0-891e-00c04fb6bfc4");

enum {
	URLACTION_MIN                                    = 0x00001000,
	URLACTION_DOWNLOAD_MIN                           = 0x00001000,
	URLACTION_DOWNLOAD_SIGNED_ACTIVEX                = 0x00001001,
	URLACTION_DOWNLOAD_UNSIGNED_ACTIVEX              = 0x00001004,
	URLACTION_DOWNLOAD_CURR_MAX                      = 0x00001004,
	URLACTION_DOWNLOAD_MAX                           = 0x000011FF,
	URLACTION_ACTIVEX_MIN                            = 0x00001200,
	URLACTION_ACTIVEX_RUN                            = 0x00001200,
	URLPOLICY_ACTIVEX_CHECK_LIST                     = 0x00010000,
	URLACTION_ACTIVEX_OVERRIDE_OBJECT_SAFETY         = 0x00001201,
	URLACTION_ACTIVEX_OVERRIDE_DATA_SAFETY           = 0x00001202,
	URLACTION_ACTIVEX_OVERRIDE_SCRIPT_SAFETY         = 0x00001203,
	URLACTION_SCRIPT_OVERRIDE_SAFETY                 = 0x00001401,
	URLACTION_ACTIVEX_CONFIRM_NOOBJECTSAFETY         = 0x00001204,
	URLACTION_ACTIVEX_TREATASUNTRUSTED               = 0x00001205,
	URLACTION_ACTIVEX_NO_WEBOC_SCRIPT                = 0x00001206,
	URLACTION_ACTIVEX_OVERRIDE_REPURPOSEDETECTION    = 0x00001207,
	URLACTION_ACTIVEX_OVERRIDE_OPTIN                 = 0x00001208,
	URLACTION_ACTIVEX_SCRIPTLET_RUN                  = 0x00001209,
	URLACTION_ACTIVEX_DYNSRC_VIDEO_AND_ANIMATION     = 0x0000120A,
	URLACTION_ACTIVEX_OVERRIDE_DOMAINLIST            = 0x0000120B,
	URLACTION_ACTIVEX_CURR_MAX                       = 0x0000120B,
	URLACTION_ACTIVEX_MAX                            = 0x000013ff,
	URLACTION_SCRIPT_MIN                             = 0x00001400,
	URLACTION_SCRIPT_RUN                             = 0x00001400,
	URLACTION_SCRIPT_JAVA_USE                        = 0x00001402,
	URLACTION_SCRIPT_SAFE_ACTIVEX                    = 0x00001405,
	URLACTION_CROSS_DOMAIN_DATA                      = 0x00001406,
	URLACTION_SCRIPT_PASTE                           = 0x00001407,
	URLACTION_ALLOW_XDOMAIN_SUBFRAME_RESIZE          = 0x00001408,
	URLACTION_SCRIPT_XSSFILTER                       = 0x00001409,
	URLACTION_SCRIPT_CURR_MAX                        = 0x00001409,
	URLACTION_SCRIPT_MAX                             = 0x000015ff,
	URLACTION_HTML_MIN                               = 0x00001600,
	URLACTION_HTML_SUBMIT_FORMS                      = 0x00001601,
	URLACTION_HTML_SUBMIT_FORMS_FROM                 = 0x00001602,
	URLACTION_HTML_SUBMIT_FORMS_TO                   = 0x00001603,
	URLACTION_HTML_FONT_DOWNLOAD                     = 0x00001604,
	URLACTION_HTML_JAVA_RUN                          = 0x00001605,
	URLACTION_HTML_USERDATA_SAVE                     = 0x00001606,
	URLACTION_HTML_SUBFRAME_NAVIGATE                 = 0x00001607,
	URLACTION_HTML_META_REFRESH                      = 0x00001608,
	URLACTION_HTML_MIXED_CONTENT                     = 0x00001609,
	URLACTION_HTML_INCLUDE_FILE_PATH                 = 0x0000160A,
	URLACTION_HTML_MAX                               = 0x000017ff,
	URLACTION_SHELL_MIN                              = 0x00001800,
	URLACTION_SHELL_INSTALL_DTITEMS                  = 0x00001800,
	URLACTION_SHELL_MOVE_OR_COPY                     = 0x00001802,
	URLACTION_SHELL_FILE_DOWNLOAD                    = 0x00001803,
	URLACTION_SHELL_VERB                             = 0x00001804,
	URLACTION_SHELL_WEBVIEW_VERB                     = 0x00001805,
	URLACTION_SHELL_SHELLEXECUTE                     = 0x00001806,
	URLACTION_SHELL_EXECUTE_HIGHRISK                 = 0x00001806,
	URLACTION_SHELL_EXECUTE_MODRISK                  = 0x00001807,
	URLACTION_SHELL_EXECUTE_LOWRISK                  = 0x00001808,
	URLACTION_SHELL_POPUPMGR                         = 0x00001809,
	URLACTION_SHELL_RTF_OBJECTS_LOAD                 = 0x0000180A,
	URLACTION_SHELL_ENHANCED_DRAGDROP_SECURITY       = 0x0000180B,
	URLACTION_SHELL_EXTENSIONSECURITY                = 0x0000180C,
	URLACTION_SHELL_SECURE_DRAGSOURCE                = 0x0000180D,
	//(_WIN32_IE >= _WIN32_IE_WIN7)
		URLACTION_SHELL_REMOTEQUERY = 0x0000180E,
		URLACTION_SHELL_PREVIEW     = 0x0000180F,
	URLACTION_SHELL_CURR_MAX                         = 0x0000180F,
	URLACTION_SHELL_MAX                              = 0x000019ff,
	URLACTION_NETWORK_MIN                            = 0x00001A00,
	URLACTION_CREDENTIALS_USE                        = 0x00001A00,
	URLPOLICY_CREDENTIALS_SILENT_LOGON_OK            = 0x00000000,
	URLPOLICY_CREDENTIALS_MUST_PROMPT_USER           = 0x00010000,
	URLPOLICY_CREDENTIALS_CONDITIONAL_PROMPT         = 0x00020000,
	URLPOLICY_CREDENTIALS_ANONYMOUS_ONLY             = 0x00030000,
	URLACTION_AUTHENTICATE_CLIENT                    = 0x00001A01,
	URLPOLICY_AUTHENTICATE_CLEARTEXT_OK              = 0x00000000,
	URLPOLICY_AUTHENTICATE_CHALLENGE_RESPONSE        = 0x00010000,
	URLPOLICY_AUTHENTICATE_MUTUAL_ONLY               = 0x00030000,
	URLACTION_COOKIES                                = 0x00001A02,
	URLACTION_COOKIES_SESSION                        = 0x00001A03,
	URLACTION_CLIENT_CERT_PROMPT                     = 0x00001A04,
	URLACTION_COOKIES_THIRD_PARTY                    = 0x00001A05,
	URLACTION_COOKIES_SESSION_THIRD_PARTY            = 0x00001A06,
	URLACTION_COOKIES_ENABLED                        = 0x00001A10,
	URLACTION_NETWORK_CURR_MAX                       = 0x00001A10,
	URLACTION_NETWORK_MAX                            = 0x00001Bff,
	URLACTION_JAVA_MIN                               = 0x00001C00,
	URLACTION_JAVA_PERMISSIONS                       = 0x00001C00,
	URLPOLICY_JAVA_PROHIBIT                          = 0x00000000,
	URLPOLICY_JAVA_HIGH                              = 0x00010000,
	URLPOLICY_JAVA_MEDIUM                            = 0x00020000,
	URLPOLICY_JAVA_LOW                               = 0x00030000,
	URLPOLICY_JAVA_CUSTOM                            = 0x00800000,
	URLACTION_JAVA_CURR_MAX                          = 0x00001C00,
	URLACTION_JAVA_MAX                               = 0x00001Cff,
	URLACTION_INFODELIVERY_MIN                       = 0x00001D00,
	URLACTION_INFODELIVERY_NO_ADDING_CHANNELS        = 0x00001D00,
	URLACTION_INFODELIVERY_NO_EDITING_CHANNELS       = 0x00001D01,
	URLACTION_INFODELIVERY_NO_REMOVING_CHANNELS      = 0x00001D02,
	URLACTION_INFODELIVERY_NO_ADDING_SUBSCRIPTIONS   = 0x00001D03,
	URLACTION_INFODELIVERY_NO_EDITING_SUBSCRIPTIONS  = 0x00001D04,
	URLACTION_INFODELIVERY_NO_REMOVING_SUBSCRIPTIONS = 0x00001D05,
	URLACTION_INFODELIVERY_NO_CHANNEL_LOGGING        = 0x00001D06,
	URLACTION_INFODELIVERY_CURR_MAX                  = 0x00001D06,
	URLACTION_INFODELIVERY_MAX                       = 0x00001Dff,
	URLACTION_CHANNEL_SOFTDIST_MIN                   = 0x00001E00,
	URLACTION_CHANNEL_SOFTDIST_PERMISSIONS           = 0x00001E05,
	URLPOLICY_CHANNEL_SOFTDIST_PROHIBIT              = 0x00010000,
	URLPOLICY_CHANNEL_SOFTDIST_PRECACHE              = 0x00020000,
	URLPOLICY_CHANNEL_SOFTDIST_AUTOINSTALL           = 0x00030000,
	URLACTION_CHANNEL_SOFTDIST_MAX                   = 0x00001Eff,
	//(_WIN32_IE >= _WIN32_IE_IE80)
		URLACTION_DOTNET_USERCONTROLS = 0x00002005,
	URLACTION_BEHAVIOR_MIN                           = 0x00002000,
	URLACTION_BEHAVIOR_RUN                           = 0x00002000,
	URLPOLICY_BEHAVIOR_CHECK_LIST                    = 0x00010000,
	URLACTION_FEATURE_MIN                            = 0x00002100,
	URLACTION_FEATURE_MIME_SNIFFING                  = 0x00002100,
	URLACTION_FEATURE_ZONE_ELEVATION                 = 0x00002101,
	URLACTION_FEATURE_WINDOW_RESTRICTIONS            = 0x00002102,
	URLACTION_FEATURE_SCRIPT_STATUS_BAR              = 0x00002103,
	URLACTION_FEATURE_FORCE_ADDR_AND_STATUS          = 0x00002104,
	URLACTION_FEATURE_BLOCK_INPUT_PROMPTS            = 0x00002105,
	URLACTION_FEATURE_DATA_BINDING                   = 0x00002106,
	URLACTION_AUTOMATIC_DOWNLOAD_UI_MIN              = 0x00002200,
	URLACTION_AUTOMATIC_DOWNLOAD_UI                  = 0x00002200,
	URLACTION_AUTOMATIC_ACTIVEX_UI                   = 0x00002201,
	URLACTION_ALLOW_RESTRICTEDPROTOCOLS              = 0x00002300,
	//(_WIN32_IE >= _WIN32_IE_IE70)
		URLACTION_ALLOW_APEVALUATION           = 0x00002301,
		URLACTION_WINDOWS_BROWSER_APPLICATIONS = 0x00002400,
		URLACTION_XPS_DOCUMENTS                = 0x00002401,
		URLACTION_LOOSE_XAML                   = 0x00002402,
		URLACTION_LOWRIGHTS                    = 0x00002500,
		URLACTION_WINFX_SETUP                  = 0x00002600,
		URLACTION_INPRIVATE_BLOCKING           = 0x00002700,
}
enum {
	URLPOLICY_ALLOW              = 0x00,
	URLPOLICY_QUERY              = 0x01,
	URLPOLICY_DISALLOW           = 0x03,
	URLPOLICY_NOTIFY_ON_ALLOW    = 0x10,
	URLPOLICY_NOTIFY_ON_DISALLOW = 0x20,
	URLPOLICY_LOG_ON_ALLOW       = 0x40,
	URLPOLICY_LOG_ON_DISALLOW    = 0x80,
	URLPOLICY_MASK_PERMISSIONS   = 0x0f,
	URLPOLICY_DONTCHECKDLGBOX    = 0x100,
}
//GetUrlPolicyPermissions(dw) (dw & URLPOLICY_MASK_PERMISSIONS)
//SetUrlPolicyPermissions(dw,dw2) ((dw) = ((dw) & ~(URLPOLICY_MASK_PERMISSIONS)) | (dw2))

extern extern(C) const GUID GUID_CUSTOM_LOCALMACHINEZONEUNLOCKED;

enum {
	URLZONE_INVALID        = -1,
	URLZONE_PREDEFINED_MIN = 0,
	URLZONE_LOCAL_MACHINE  = 0,
	URLZONE_INTRANET       = URLZONE_LOCAL_MACHINE + 1,
	URLZONE_TRUSTED        = URLZONE_INTRANET + 1,
	URLZONE_INTERNET       = URLZONE_TRUSTED + 1,
	URLZONE_UNTRUSTED      = URLZONE_INTERNET + 1,
	URLZONE_PREDEFINED_MAX = 999,
	URLZONE_USER_MIN       = 1000,
	URLZONE_USER_MAX       = 10000
}
alias int URLZONE;

enum URLZONE_ESC_FLAG = 0x100;
enum {
	URLTEMPLATE_CUSTOM         = 0,
	URLTEMPLATE_PREDEFINED_MIN = 0x10000,
	URLTEMPLATE_LOW            = 0x10000,
	URLTEMPLATE_MEDLOW         = 0x10500,
	URLTEMPLATE_MEDIUM         = 0x11000,
	URLTEMPLATE_MEDHIGH        = 0x11500,
	URLTEMPLATE_HIGH           = 0x12000,
	URLTEMPLATE_PREDEFINED_MAX = 0x20000
}
alias int URLTEMPLATE;

enum {
	MAX_ZONE_PATH        = 260,
	MAX_ZONE_DESCRIPTION = 200
}

enum {
	ZAFLAGS_CUSTOM_EDIT              = 0x1,
	ZAFLAGS_ADD_SITES                = 0x2,
	ZAFLAGS_REQUIRE_VERIFICATION     = 0x4,
	ZAFLAGS_INCLUDE_PROXY_OVERRIDE   = 0x8,
	ZAFLAGS_INCLUDE_INTRANET_SITES   = 0x10,
	ZAFLAGS_NO_UI                    = 0x20,
	ZAFLAGS_SUPPORTS_VERIFICATION    = 0x40,
	ZAFLAGS_UNC_AS_INTRANET          = 0x80,
	ZAFLAGS_DETECT_INTRANET          = 0x100,
	ZAFLAGS_USE_LOCKED_ZONES         = 0x10000,
	ZAFLAGS_VERIFY_TEMPLATE_SETTINGS = 0x20000,
	ZAFLAGS_NO_CACHE                 = 0x40000
}
alias int ZAFLAGS;

struct ZONEATTRIBUTES {
	ULONG cbSize;
	WCHAR[260] szDisplayName;
	WCHAR[200] szDescription;
	WCHAR[260] szIconPath;
	DWORD dwTemplateMinLevel;
	DWORD dwTemplateRecommended;
	DWORD dwTemplateCurrentLevel;
	DWORD dwFlags;
}
alias ZONEATTRIBUTES* LPZONEATTRIBUTES;

enum {
	URLZONEREG_DEFAULT = 0,
	URLZONEREG_HKLM,
	URLZONEREG_HKCU
}
alias int URLZONEREG;

//extern extern(C) const IID IID_IInternetZoneManager;
interface IInternetZoneManager : IUnknown {
public extern(Windows):
	HRESULT GetZoneAttributes(DWORD dwZone, ZONEATTRIBUTES* pZoneAttributes);
	HRESULT SetZoneAttributes(DWORD dwZone, ZONEATTRIBUTES* pZoneAttributes);
	HRESULT GetZoneCustomPolicy(DWORD dwZone, REFGUID guidKey, BYTE** ppPolicy, DWORD* pcbPolicy, URLZONEREG urlZoneReg);
	HRESULT SetZoneCustomPolicy(DWORD dwZone, REFGUID guidKey, BYTE* pPolicy, DWORD cbPolicy, URLZONEREG urlZoneReg);
	HRESULT GetZoneActionPolicy(DWORD dwZone, DWORD dwAction, BYTE* pPolicy, DWORD cbPolicy, URLZONEREG urlZoneReg);
	HRESULT SetZoneActionPolicy(DWORD dwZone, DWORD dwAction, BYTE* pPolicy, DWORD cbPolicy, URLZONEREG urlZoneReg);
	HRESULT PromptAction(DWORD dwAction, HWND hwndParent, LPCWSTR pwszUrl, LPCWSTR pwszText, DWORD dwPromptFlags);
	HRESULT LogAction(DWORD dwAction, LPCWSTR pwszUrl, LPCWSTR pwszText, DWORD dwLogFlags);
	HRESULT CreateZoneEnumerator(DWORD* pdwEnum, DWORD* pdwCount, DWORD dwFlags);
	HRESULT GetZoneAt(DWORD dwEnum, DWORD dwIndex, DWORD* pdwZone);
	HRESULT DestroyZoneEnumerator(DWORD dwEnum);
	HRESULT CopyTemplatePoliciesToZone(DWORD dwTemplate, DWORD dwZone, DWORD dwReserved);
}
mixin DEFINE_IID!(IInternetZoneManager, "79eac9ef-baf9-11ce-8c82-00aa004ba90b");
alias IInternetZoneManager LPURLZONEMANAGER;

//extern extern(C) const IID IID_IInternetZoneManagerEx;
interface IInternetZoneManagerEx : IInternetZoneManager {
public extern(Windows):
	HRESULT GetZoneActionPolicyEx(DWORD dwZone, DWORD dwAction, BYTE* pPolicy, DWORD cbPolicy, URLZONEREG urlZoneReg, DWORD dwFlags);
	HRESULT SetZoneActionPolicyEx(DWORD dwZone, DWORD dwAction, BYTE* pPolicy, DWORD cbPolicy, URLZONEREG urlZoneReg, DWORD dwFlags);
}
mixin DEFINE_IID!(IInternetZoneManagerEx, "A4C23339-8E06-431e-9BF4-7E711C085648");

//(_WIN32_IE >= _WIN32_IE_IE70)
	enum {
		SECURITY_IE_STATE_GREEN = 0x00000000,
		SECURITY_IE_STATE_RED   = 0x00000001,
	}

	//extern extern(C) const IID IID_IInternetZoneManagerEx2;
	interface IInternetZoneManagerEx2 : IInternetZoneManagerEx {
	public extern(Windows):
		HRESULT GetZoneAttributesEx(DWORD dwZone, ZONEATTRIBUTES* pZoneAttributes, DWORD dwFlags);
		HRESULT GetZoneSecurityState(DWORD dwZoneIndex, BOOL fRespectPolicy, LPDWORD pdwState, BOOL* pfPolicyEncountered);
		HRESULT GetIESecurityState(BOOL fRespectPolicy, LPDWORD pdwState, BOOL* pfPolicyEncountered, BOOL fNoCache);
		HRESULT FixUnsecureSettings();
	}
	mixin DEFINE_IID!(IInternetZoneManagerEx2, "EDC17559-DD5D-4846-8EEF-8BECBA5A4ABF");

extern extern(C) const IID CLSID_SoftDistExt;

enum {
	SOFTDIST_FLAG_USAGE_EMAIL         = 0x00000001,
	SOFTDIST_FLAG_USAGE_PRECACHE      = 0x00000002,
	SOFTDIST_FLAG_USAGE_AUTOINSTALL   = 0x00000004,
	SOFTDIST_FLAG_DELETE_SUBSCRIPTION = 0x00000008,
	SOFTDIST_ADSTATE_NONE             = 0x00000000,
	SOFTDIST_ADSTATE_AVAILABLE        = 0x00000001,
	SOFTDIST_ADSTATE_DOWNLOADED       = 0x00000002,
	SOFTDIST_ADSTATE_INSTALLED        = 0x00000003,
}

struct CODEBASEHOLD {
	ULONG cbSize;
	LPWSTR szDistUnit;
	LPWSTR szCodeBase;
	DWORD dwVersionMS;
	DWORD dwVersionLS;
	DWORD dwStyle;
}
alias CODEBASEHOLD* LPCODEBASEHOLD;

struct SOFTDISTINFO {
	ULONG cbSize;
	DWORD dwFlags;
	DWORD dwAdState;
	LPWSTR szTitle;
	LPWSTR szAbstract;
	LPWSTR szHREF;
	DWORD dwInstalledVersionMS;
	DWORD dwInstalledVersionLS;
	DWORD dwUpdateVersionMS;
	DWORD dwUpdateVersionLS;
	DWORD dwAdvertisedVersionMS;
	DWORD dwAdvertisedVersionLS;
	DWORD dwReserved;
}
alias SOFTDISTINFO* LPSOFTDISTINFO;

//extern extern(C) const IID IID_ISoftDistExt;
interface ISoftDistExt : IUnknown {
public extern(Windows):
	HRESULT ProcessSoftDist(LPCWSTR szCDFURL, IXMLElement pSoftDistElement, LPSOFTDISTINFO lpsdi);
	HRESULT GetFirstCodeBase(LPWSTR* szCodeBase, LPDWORD dwMaxSize);
	HRESULT GetNextCodeBase(LPWSTR* szCodeBase, LPDWORD dwMaxSize);
	HRESULT AsyncInstallDistributionUnit(IBindCtx pbc, LPVOID pvReserved, DWORD flags, LPCODEBASEHOLD lpcbh);
}
mixin DEFINE_IID!(ISoftDistExt, "B15B8DC1-C7E1-11d0-8680-00AA00BDCB71");
export extern(Windows) HRESULT GetSoftwareUpdateInfo(LPCWSTR szDistUnit, LPSOFTDISTINFO psdi);
export extern(Windows) HRESULT SetSoftwareUpdateAdvertisementState(LPCWSTR szDistUnit, DWORD dwAdState, DWORD dwAdvertisedVersionMS, DWORD dwAdvertisedVersionLS);

//extern extern(C) const IID IID_ICatalogFileInfo;
interface ICatalogFileInfo : IUnknown {
public extern(Windows):
	HRESULT GetCatalogFile(LPSTR* ppszCatalogFile);
	HRESULT GetJavaTrust(void** ppJavaTrust);
}
mixin DEFINE_IID!(ICatalogFileInfo, "711C7600-6B48-11d1-B403-00AA00B92AF1");
alias ICatalogFileInfo LPCATALOGFILEINFO;

//extern extern(C) const IID IID_IDataFilter;
interface IDataFilter : IUnknown {
public extern(Windows):
	HRESULT DoEncode(DWORD dwFlags, LONG lInBufferSize, BYTE* pbInBuffer, LONG lOutBufferSize, BYTE* pbOutBuffer, LONG lInBytesAvailable, LONG* plInBytesRead, LONG* plOutBytesWritten, DWORD dwReserved);
	HRESULT DoDecode(DWORD dwFlags, LONG lInBufferSize, BYTE* pbInBuffer, LONG lOutBufferSize, BYTE* pbOutBuffer, LONG lInBytesAvailable, LONG* plInBytesRead, LONG* plOutBytesWritten, DWORD dwReserved);
	HRESULT SetEncodingLevel(DWORD dwEncLevel);
}
mixin DEFINE_IID!(IDataFilter, "69d14c80-c18e-11d0-a9ce-006097942311");
alias IDataFilter LPDATAFILTER;

struct PROTOCOLFILTERDATA {
	DWORD cbSize;
	IInternetProtocolSink pProtocolSink;
	IInternetProtocol pProtocol;
	IUnknown pUnk;
	DWORD dwFilterFlags;
}

struct DATAINFO {
	ULONG ulTotalSize;
	ULONG ulavrPacketSize;
	ULONG ulConnectSpeed;
	ULONG ulProcessorSpeed;
}

//extern extern(C) const IID IID_IEncodingFilterFactory;
interface IEncodingFilterFactory : IUnknown {
public extern(Windows):
	HRESULT FindBestFilter(LPCWSTR pwzCodeIn, LPCWSTR pwzCodeOut, DATAINFO info, IDataFilter* ppDF);
	HRESULT GetDefaultFilter(LPCWSTR pwzCodeIn, LPCWSTR pwzCodeOut, IDataFilter* ppDF);
}
mixin DEFINE_IID!(IEncodingFilterFactory, "70bdde00-c18e-11d0-a9ce-006097942311");
alias IEncodingFilterFactory LPENCODINGFILTERFACTORY;

export extern(Windows) BOOL IsLoggingEnabledA(LPCSTR pszUrl);
export extern(Windows) BOOL IsLoggingEnabledW(LPCWSTR pwszUrl);
version(UNICODE)
	alias IsLoggingEnabledW IsLoggingEnabled;
else
	alias IsLoggingEnabledA IsLoggingEnabled;

struct HIT_LOGGING_INFO {
	DWORD dwStructSize;
	LPSTR lpszLoggedUrlName;
	SYSTEMTIME StartTime;
	SYSTEMTIME EndTime;
	LPSTR lpszExtendedInfo;
}
alias HIT_LOGGING_INFO* LPHIT_LOGGING_INFO;

export extern(Windows) BOOL WriteHitLogging(LPHIT_LOGGING_INFO lpLogginginfo);
enum CONFIRMSAFETYACTION_LOADOBJECT = 0x00000001;
struct CONFIRMSAFETY {
	CLSID clsid;
	IUnknown pUnk;
	DWORD dwFlags;
}
extern extern(C) const GUID GUID_CUSTOM_CONFIRMOBJECTSAFETY;

//extern extern(C) const IID IID_IWrappedProtocol;
interface IWrappedProtocol : IUnknown {
public extern(Windows):
	HRESULT GetWrapperCode(LONG* pnCode, DWORD_PTR dwReserved);
}
mixin DEFINE_IID!(IWrappedProtocol, "53c84785-8425-4dc5-971b-e58d9c19f9b6");
alias IWrappedProtocol LPIWRAPPEDPROTOCOL;

export extern(Windows){
	ULONG BSTR_UserSize(ULONG*, ULONG, BSTR*);
	BYTE* BSTR_UserMarshal(ULONG*, BYTE*, BSTR*);
	BYTE* BSTR_UserUnmarshal(ULONG*, BYTE*, BSTR*);
	void BSTR_UserFree(ULONG*, BSTR*);

	ULONG HWND_UserSize(ULONG*, ULONG, HWND*);
	BYTE* HWND_UserMarshal(ULONG*, BYTE*, HWND*);
	BYTE* HWND_UserUnmarshal(ULONG*, BYTE*, HWND*);
	void HWND_UserFree(ULONG*, HWND*);

	ULONG BSTR_UserSize64(ULONG*, ULONG, BSTR*);
	BYTE* BSTR_UserMarshal64(ULONG*, BYTE*, BSTR*);
	BYTE* BSTR_UserUnmarshal64(ULONG*, BYTE*, BSTR*);
	void BSTR_UserFree64(ULONG*, BSTR*);

	ULONG HWND_UserSize64(ULONG*, ULONG, HWND*);
	BYTE* HWND_UserMarshal64(ULONG*, BYTE*, HWND*);
	BYTE* HWND_UserUnmarshal64(ULONG*, BYTE*, HWND*);
	void HWND_UserFree64(ULONG*, HWND*);
}

export extern(Windows){
	HRESULT IBinding_GetBindResult_Proxy(IBinding This, CLSID* pclsidProtocol, DWORD* pdwResult, LPOLESTR* pszResult, DWORD* pdwReserved);
	HRESULT IBinding_GetBindResult_Stub(IBinding This, CLSID* pclsidProtocol, DWORD* pdwResult, LPOLESTR* pszResult, DWORD dwReserved);
	HRESULT IBindStatusCallback_GetBindInfo_Proxy(IBindStatusCallback This, DWORD* grfBINDF, BINDINFO* pbindinfo);
	HRESULT IBindStatusCallback_GetBindInfo_Stub(IBindStatusCallback This, DWORD* grfBINDF, RemBINDINFO* pbindinfo, RemSTGMEDIUM* pstgmed);
	HRESULT IBindStatusCallback_OnDataAvailable_Proxy(IBindStatusCallback This, DWORD grfBSCF, DWORD dwSize, FORMATETC* pformatetc, STGMEDIUM* pstgmed);
	HRESULT IBindStatusCallback_OnDataAvailable_Stub(IBindStatusCallback This, DWORD grfBSCF, DWORD dwSize, RemFORMATETC* pformatetc, RemSTGMEDIUM* pstgmed);
	HRESULT IBindStatusCallbackEx_GetBindInfoEx_Proxy(IBindStatusCallbackEx This, DWORD* grfBINDF, BINDINFO* pbindinfo, DWORD* grfBINDF2, DWORD* pdwReserved);
	HRESULT IBindStatusCallbackEx_GetBindInfoEx_Stub(IBindStatusCallbackEx This, DWORD* grfBINDF, RemBINDINFO* pbindinfo, RemSTGMEDIUM* pstgmed, DWORD* grfBINDF2, DWORD* pdwReserved);
	HRESULT IWinInetInfo_QueryOption_Proxy(IWinInetInfo This, DWORD dwOption, LPVOID pBuffer, DWORD* pcbBuf);
	HRESULT IWinInetInfo_QueryOption_Stub(IWinInetInfo This, DWORD dwOption, BYTE* pBuffer, DWORD* pcbBuf);
	HRESULT IWinInetHttpInfo_QueryInfo_Proxy(IWinInetHttpInfo This, DWORD dwOption, LPVOID pBuffer, DWORD* pcbBuf, DWORD* pdwFlags, DWORD* pdwReserved);
	HRESULT IWinInetHttpInfo_QueryInfo_Stub(IWinInetHttpInfo This, DWORD dwOption, BYTE* pBuffer, DWORD* pcbBuf, DWORD* pdwFlags, DWORD* pdwReserved);
	HRESULT IBindHost_MonikerBindToStorage_Proxy(IBindHost This, IMoniker pMk, IBindCtx pBC, IBindStatusCallback pBSC, REFIID riid, void** ppvObj);
	HRESULT IBindHost_MonikerBindToStorage_Stub(IBindHost This, IMoniker pMk, IBindCtx pBC, IBindStatusCallback pBSC, REFIID riid, IUnknown* ppvObj);
	HRESULT IBindHost_MonikerBindToObject_Proxy(IBindHost This, IMoniker pMk, IBindCtx pBC, IBindStatusCallback pBSC, REFIID riid, void** ppvObj);
	HRESULT IBindHost_MonikerBindToObject_Stub(IBindHost This, IMoniker pMk, IBindCtx pBC, IBindStatusCallback pBSC, REFIID riid, IUnknown* ppvObj);
}

extern extern(C) const IID CLSID_InternetSecurityManager;
extern extern(C) const IID CLSID_InternetZoneManager;
extern extern(C) const IID CLSID_PersistentZoneIdentifier;
alias IID_IInternetSecurityManager SID_SInternetSecurityManager;
alias IID_IInternetSecurityManagerEx SID_SInternetSecurityManagerEx;
//(_WIN32_IE >= _WIN32_IE_IE70)
	alias IID_IInternetSecurityManagerEx2 SID_SInternetSecurityManagerEx2;
alias IID_IInternetHostSecurityManager SID_SInternetHostSecurityManager;

} // extern(C)
