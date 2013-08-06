/** wtypes.d

Converted from 'wtypes.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.wtypes;


import c.windows.windef;
import c.windows.guiddef;
import c.windows.wingdi;
import c.windows.rpcndr;


extern(C){

struct RemHGLOBAL {
	int fNullHGlobal;
	uint cbData;
	ubyte[1] data;
}

struct RemHMETAFILEPICT {
	int mm;
	int xExt;
	int yExt;
	uint cbData;
	ubyte[1] data;
}

struct RemHENHMETAFILE {
	uint cbData;
	ubyte[1] data;
}

struct RemHBITMAP {
	uint cbData;
	ubyte[1] data;
}

struct RemHPALETTE {
	uint cbData;
	ubyte[1] data;
}

struct RemHBRUSH {
	uint cbData;
	ubyte[1] data;
}

alias WCHAR OLECHAR;
alias OLECHAR* LPOLESTR;
alias const(OLECHAR)* LPCOLESTR;
//#define OLESTR(str) L##str

alias double DOUBLE;

struct COAUTHIDENTITY {
	USHORT* User;
	ULONG UserLength;
	USHORT* Domain;
	ULONG DomainLength;
	USHORT* Password;
	ULONG PasswordLength;
	ULONG Flags;
}

struct COAUTHINFO {
	DWORD dwAuthnSvc;
	DWORD dwAuthzSvc;
	LPWSTR pwszServerPrincName;
	DWORD dwAuthnLevel;
	DWORD dwImpersonationLevel;
	COAUTHIDENTITY* pAuthIdentityData;
	DWORD dwCapabilities;
}

alias LONG SCODE;
alias SCODE* PSCODE;

enum {
	MEMCTX_TASK      = 1,
	MEMCTX_SHARED    = 2,
	MEMCTX_MACSYSTEM = 3,
	MEMCTX_UNKNOWN   = -1,
	MEMCTX_SAME      = -2
}
alias int MEMCTX;

enum {
	ROTFLAGS_REGISTRATIONKEEPSALIVE = 0x1,
	ROTFLAGS_ALLOWANYCLIENT         = 0x2,
}

enum {
	ROTREGFLAGS_ALLOWANYCLIENT = 0x1,
}
enum {
	APPIDREGFLAGS_ACTIVATE_IUSERVER_INDESKTOP       = 0x1,
	APPIDREGFLAGS_SECURE_SERVER_PROCESS_SD_AND_BIND = 0x2,
	APPIDREGFLAGS_ISSUE_ACTIVATION_RPC_AT_IDENTIFY  = 0x4,
}

enum ROT_COMPARE_MAX = 2048;

enum {
	DCOMSCM_ACTIVATION_USE_ALL_AUTHNSERVICES  = 0x1,
	DCOMSCM_ACTIVATION_DISALLOW_UNSECURE_CALL = 0x2,
	DCOMSCM_RESOLVE_USE_ALL_AUTHNSERVICES     = 0x4,
	DCOMSCM_RESOLVE_DISALLOW_UNSECURE_CALL    = 0x8,
	DCOMSCM_PING_USE_MID_AUTHNSERVICE         = 0x10,
	DCOMSCM_PING_DISALLOW_UNSECURE_CALL       = 0x20,
}

enum {
	CLSCTX_INPROC_SERVER          = 0x1,
	CLSCTX_INPROC_HANDLER         = 0x2,
	CLSCTX_LOCAL_SERVER           = 0x4,
	CLSCTX_INPROC_SERVER16        = 0x8,
	CLSCTX_REMOTE_SERVER          = 0x10,
	CLSCTX_INPROC_HANDLER16       = 0x20,
	CLSCTX_RESERVED1              = 0x40,
	CLSCTX_RESERVED2              = 0x80,
	CLSCTX_RESERVED3              = 0x100,
	CLSCTX_RESERVED4              = 0x200,
	CLSCTX_NO_CODE_DOWNLOAD       = 0x400,
	CLSCTX_RESERVED5              = 0x800,
	CLSCTX_NO_CUSTOM_MARSHAL      = 0x1000,
	CLSCTX_ENABLE_CODE_DOWNLOAD   = 0x2000,
	CLSCTX_NO_FAILURE_LOG         = 0x4000,
	CLSCTX_DISABLE_AAA            = 0x8000,
	CLSCTX_ENABLE_AAA             = 0x10000,
	CLSCTX_FROM_DEFAULT_CONTEXT   = 0x20000,
	CLSCTX_ACTIVATE_32_BIT_SERVER = 0x40000,
	CLSCTX_ACTIVATE_64_BIT_SERVER = 0x80000,
	CLSCTX_ENABLE_CLOAKING        = 0x100000,
	CLSCTX_PS_DLL                 = cast(int)0x80000000
}
alias int CLSCTX;

enum CLSCTX_VALID_MASK = CLSCTX_INPROC_SERVER | CLSCTX_INPROC_HANDLER | CLSCTX_LOCAL_SERVER | CLSCTX_INPROC_SERVER16 | CLSCTX_REMOTE_SERVER | CLSCTX_NO_CODE_DOWNLOAD | CLSCTX_NO_CUSTOM_MARSHAL | CLSCTX_ENABLE_CODE_DOWNLOAD | CLSCTX_NO_FAILURE_LOG | CLSCTX_DISABLE_AAA | CLSCTX_ENABLE_AAA | CLSCTX_FROM_DEFAULT_CONTEXT | CLSCTX_ACTIVATE_32_BIT_SERVER | CLSCTX_ACTIVATE_64_BIT_SERVER | CLSCTX_ENABLE_CLOAKING | CLSCTX_PS_DLL;

enum {
	MSHLFLAGS_NORMAL      = 0,
	MSHLFLAGS_TABLESTRONG = 1,
	MSHLFLAGS_TABLEWEAK   = 2,
	MSHLFLAGS_NOPING      = 4,
	MSHLFLAGS_RESERVED1   = 8,
	MSHLFLAGS_RESERVED2   = 16,
	MSHLFLAGS_RESERVED3   = 32,
	MSHLFLAGS_RESERVED4   = 64
}
alias int MSHLFLAGS;

enum {
	MSHCTX_LOCAL            = 0,
	MSHCTX_NOSHAREDMEM      = 1,
	MSHCTX_DIFFERENTMACHINE = 2,
	MSHCTX_INPROC           = 3,
	MSHCTX_CROSSCTX         = 4
}
alias int MSHCTX;

enum {
	DVASPECT_CONTENT   = 1,
	DVASPECT_THUMBNAIL = 2,
	DVASPECT_ICON      = 4,
	DVASPECT_DOCPRINT  = 8
}
alias int DVASPECT;

enum {
	STGC_DEFAULT                            = 0,
	STGC_OVERWRITE                          = 1,
	STGC_ONLYIFCURRENT                      = 2,
	STGC_DANGEROUSLYCOMMITMERELYTODISKCACHE = 4,
	STGC_CONSOLIDATE                        = 8
}
alias int STGC;

enum {
	STGMOVE_MOVE        = 0,
	STGMOVE_COPY        = 1,
	STGMOVE_SHALLOWCOPY = 2
}
alias int STGMOVE;

enum {
	STATFLAG_DEFAULT = 0,
	STATFLAG_NONAME  = 1,
	STATFLAG_NOOPEN  = 2
}
alias int STATFLAG;

alias void* HCONTEXT;

struct BYTE_BLOB {
	uint clSize;
	ubyte[1] abData;
}
alias BYTE_BLOB* UP_BYTE_BLOB;

struct WORD_BLOB {
	uint clSize;
	ushort[1] asData;
}
alias WORD_BLOB* UP_WORD_BLOB;

struct DWORD_BLOB {
	uint clSize;
	uint[1] alData;
}
alias DWORD_BLOB* UP_DWORD_BLOB;

struct FLAGGED_BYTE_BLOB {
	uint fFlags;
	uint clSize;
	ubyte[1] abData;
}
alias FLAGGED_BYTE_BLOB* UP_FLAGGED_BYTE_BLOB;

struct FLAGGED_WORD_BLOB {
	uint fFlags;
	uint clSize;
	ushort[1] asData;
}
alias FLAGGED_WORD_BLOB* UP_FLAGGED_WORD_BLOB;

struct BYTE_SIZEDARR {
	uint clSize;
	ubyte* pData;
}

struct WORD_SIZEDARR {
	uint clSize;
	ushort* pData;
}

struct DWORD_SIZEDARR {
	uint clSize;
	uint* pData;
}

struct HYPER_SIZEDARR {
	uint clSize;
	hyper* pData;
}

enum {
	WDT_INPROC_CALL   = 0x48746457,
	WDT_REMOTE_CALL   = 0x52746457,
	WDT_INPROC64_CALL = 0x50746457,
}

struct userCLIPFORMAT {
	int fContext;
	union {
		DWORD dwValue;
		wchar_t* pwszName;
	}
}
alias userCLIPFORMAT* wireCLIPFORMAT;

alias WORD CLIPFORMAT;

struct GDI_NONREMOTE {
	int fContext;
	union {
		int hInproc;
		DWORD_BLOB* hRemote;
	}
}

struct userHGLOBAL {
	int fContext;
	union {
		int hInproc;
		FLAGGED_BYTE_BLOB* hRemote;
		long hInproc64;
		}
}
alias userHGLOBAL* wireHGLOBAL;

struct userHMETAFILE {
	int fContext;
	union {
		int hInproc;
		BYTE_BLOB* hRemote;
		long hInproc64;
	}
}

struct remoteMETAFILEPICT {
	int mm;
	int xExt;
	int yExt;
	userHMETAFILE* hMF;
}

struct userHMETAFILEPICT {
	int fContext;
	union {
		int hInproc;
		remoteMETAFILEPICT* hRemote;
		long hInproc64;
	}
}

struct userHENHMETAFILE {
	int fContext;
	union {
		int hInproc;
		BYTE_BLOB* hRemote;
		long hInproc64;
	}
}

struct userBITMAP {
	LONG bmType;
	LONG bmWidth;
	LONG bmHeight;
	LONG bmWidthBytes;
	WORD bmPlanes;
	WORD bmBitsPixel;
	ULONG cbSize;
	ubyte[1] pBuffer;
}

struct userHBITMAP {
	int fContext;
	union {
		int hInproc;
		userBITMAP* hRemote;
		long hInproc64;
	}
}

struct userHPALETTE {
	int fContext;
	union {
		int hInproc;
		LOGPALETTE* hRemote;
		long hInproc64;
	}
}

struct RemotableHandle {
	int fContext;
	union {
		int hInproc;
		int hRemote;
	}
}

alias RemotableHandle* wireHWND;
alias RemotableHandle* wireHMENU;
alias RemotableHandle* wireHACCEL;
alias RemotableHandle* wireHBRUSH;
alias RemotableHandle* wireHFONT;
alias RemotableHandle* wireHDC;
alias RemotableHandle* wireHICON;
alias RemotableHandle* wireHRGN;
alias userHBITMAP* wireHBITMAP;
alias userHPALETTE* wireHPALETTE;
alias userHENHMETAFILE* wireHENHMETAFILE;
alias userHMETAFILE* wireHMETAFILE;
alias userHMETAFILEPICT* wireHMETAFILEPICT;
alias void* HMETAFILEPICT;

alias double DATE;

union CY {
	struct {
		uint Lo;
		int Hi;
	}
	LONGLONG int64;
}
alias CY* LPCY;

struct DECIMAL {
	USHORT wReserved;
	union {
		struct {
			BYTE scale;
			BYTE sign;
		}
		USHORT signscale;
	}
	ULONG Hi32;
	union {
		struct {
			ULONG Lo32;
			ULONG Mid32;
		}
		ULONGLONG Lo64;
	}
}

enum DECIMAL_NEG = cast(BYTE)0x80;
/*template DECIMAL_SETZERO(dec)
{
	(dec).Lo64 = 0;
	(dec).Hi32 = 0;
	(dec).signscale = 0;
}*/

alias DECIMAL* LPDECIMAL;

alias FLAGGED_WORD_BLOB* wireBSTR;
alias OLECHAR* BSTR;
alias BSTR* LPBSTR;
alias short VARIANT_BOOL;
alias VARIANT_BOOL _VARIANT_BOOL;
//alias boolean BOOLEAN; at windef;

struct BSTRBLOB {
	ULONG cbSize;
	BYTE* pData;
}
alias BSTRBLOB* LPBSTRBLOB;

enum {
	VARIANT_TRUE  = -1,
	VARIANT_FALSE = 0,
}

struct BLOB {
	ULONG cbSize;
	BYTE* pBlobData;
}
alias BLOB* LPBLOB;

struct CLIPDATA {
	ULONG cbSize;
	int ulClipFmt;
	BYTE* pClipData;
}

//#define CBPCLIPDATA(clipdata)    ( (clipdata).cbSize - sizeof((clipdata).ulClipFmt) )
alias ushort VARTYPE;

enum {
	VT_EMPTY            = 0,
	VT_NULL             = 1,
	VT_I2               = 2,
	VT_I4               = 3,
	VT_R4               = 4,
	VT_R8               = 5,
	VT_CY               = 6,
	VT_DATE             = 7,
	VT_BSTR             = 8,
	VT_DISPATCH         = 9,
	VT_ERROR            = 10,
	VT_BOOL             = 11,
	VT_VARIANT          = 12,
	VT_UNKNOWN          = 13,
	VT_DECIMAL          = 14,
	VT_I1               = 16,
	VT_UI1              = 17,
	VT_UI2              = 18,
	VT_UI4              = 19,
	VT_I8               = 20,
	VT_UI8              = 21,
	VT_INT              = 22,
	VT_UINT             = 23,
	VT_VOID             = 24,
	VT_HRESULT          = 25,
	VT_PTR              = 26,
	VT_SAFEARRAY        = 27,
	VT_CARRAY           = 28,
	VT_USERDEFINED      = 29,
	VT_LPSTR            = 30,
	VT_LPWSTR           = 31,
	VT_RECORD           = 36,
	VT_INT_PTR          = 37,
	VT_UINT_PTR         = 38,
	VT_FILETIME         = 64,
	VT_BLOB             = 65,
	VT_STREAM           = 66,
	VT_STORAGE          = 67,
	VT_STREAMED_OBJECT  = 68,
	VT_STORED_OBJECT    = 69,
	VT_BLOB_OBJECT      = 70,
	VT_CF               = 71,
	VT_CLSID            = 72,
	VT_VERSIONED_STREAM = 73,
	VT_BSTR_BLOB        = 0xfff,
	VT_VECTOR           = 0x1000,
	VT_ARRAY            = 0x2000,
	VT_BYREF            = 0x4000,
	VT_RESERVED         = 0x8000,
	VT_ILLEGAL          = 0xffff,
	VT_ILLEGALMASKED    = 0xfff,
	VT_TYPEMASK         = 0xfff
}
alias int VARENUM;
enum PROPID : ULONG {init = (ULONG).init}

struct PROPERTYKEY {
	GUID fmtid;
	DWORD pid;
}

struct CSPLATFORM {
	DWORD dwPlatformId;
	DWORD dwVersionHi;
	DWORD dwVersionLo;
	DWORD dwProcessorArch;
}

struct QUERYCONTEXT {
	DWORD dwContext;
	CSPLATFORM Platform;
	LCID Locale;
	DWORD dwVersionHi;
	DWORD dwVersionLo;
}

enum {
	TYSPEC_CLSID       = 0,
	TYSPEC_FILEEXT     = TYSPEC_CLSID + 1,
	TYSPEC_MIMETYPE    = TYSPEC_FILEEXT + 1,
	TYSPEC_FILENAME    = TYSPEC_MIMETYPE + 1,
	TYSPEC_PROGID      = TYSPEC_FILENAME + 1,
	TYSPEC_PACKAGENAME = TYSPEC_PROGID + 1,
	TYSPEC_OBJECTID    = TYSPEC_PACKAGENAME + 1,
}
alias int TYSPEC;

struct uCLSSPEC {
	DWORD tyspec;
	union {
		CLSID clsid;
		LPOLESTR pFileExt;
		LPOLESTR pMimeType;
		LPOLESTR pProgId;
		LPOLESTR pFileName;
		struct {
			LPOLESTR pPackageName;
			GUID PolicyId;
		}
		struct {
			GUID ObjectId;
			GUID PolicyId_2; // !
		}
	}
}

} // extern(C)
