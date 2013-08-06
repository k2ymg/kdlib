/** propidl.d

Converted from 'propidl.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.propidl;


import c.windows.windef;
import c.windows.wtypes;
import c.windows.guiddef;
import c.windows.unknwn;
import c.windows.oaidl;
import c.windows.objidl;
import c.windows.rpcdcep;


extern(C){


struct VERSIONEDSTREAM {
	GUID guidVersion;
	IStream pStream;
}
alias VERSIONEDSTREAM* LPVERSIONEDSTREAM;

enum {
	PROPSETFLAG_DEFAULT             = 0,
	PROPSETFLAG_NONSIMPLE           = 1,
	PROPSETFLAG_ANSI                = 2,
	PROPSETFLAG_UNBUFFERED          = 4,
	PROPSETFLAG_CASE_SENSITIVE      = 8,
	PROPSET_BEHAVIOR_CASE_SENSITIVE = 1,
}

struct CAC {
	ULONG cElems;
	CHAR* pElems;
}

struct CAUB {
	ULONG cElems;
	UCHAR* pElems;
}

struct CAI {
	ULONG cElems;
	SHORT* pElems;
}

struct CAUI {
	ULONG cElems;
	USHORT* pElems;
}

struct CAL {
	ULONG cElems;
	LONG* pElems;
}

struct CAUL {
	ULONG cElems;
	ULONG* pElems;
}

struct CAFLT {
	ULONG cElems;
	FLOAT* pElems;
}

struct CADBL {
	ULONG cElems;
	DOUBLE* pElems;
}

struct CACY {
	ULONG cElems;
	CY* pElems;
}

struct CADATE {
	ULONG cElems;
	DATE* pElems;
}

struct CABSTR {
	ULONG cElems;
	BSTR* pElems;
}

struct CABSTRBLOB {
	ULONG cElems;
	BSTRBLOB* pElems;
}

struct CABOOL {
	ULONG cElems;
	VARIANT_BOOL* pElems;
}

struct CASCODE {
	ULONG cElems;
	SCODE* pElems;
}

struct CAPROPVARIANT {
	ULONG cElems;
	PROPVARIANT* pElems;
}

struct CAH {
	ULONG cElems;
	LARGE_INTEGER* pElems;
}

struct CAUH {
	ULONG cElems;
	ULARGE_INTEGER* pElems;
}

struct CALPSTR {
	ULONG cElems;
	LPSTR* pElems;
}

struct CALPWSTR {
	ULONG cElems;
	LPWSTR* pElems;
}

struct CAFILETIME {
	ULONG cElems;
	FILETIME* pElems;
}

struct CACLIPDATA {
	ULONG cElems;
	CLIPDATA* pElems;
}

struct CACLSID {
	ULONG cElems;
	CLSID* pElems;
}

alias WORD PROPVAR_PAD1;
alias WORD PROPVAR_PAD2;
alias WORD PROPVAR_PAD3;

struct PROPVARIANT {
	union {
		struct {
			VARTYPE vt;
			PROPVAR_PAD1 wReserved1;
			PROPVAR_PAD2 wReserved2;
			PROPVAR_PAD3 wReserved3;
			union {
				CHAR cVal;
				UCHAR bVal;
				SHORT iVal;
				USHORT uiVal;
				LONG lVal;
				ULONG ulVal;
				INT intVal;
				UINT uintVal;
				LARGE_INTEGER hVal;
				ULARGE_INTEGER uhVal;
				FLOAT fltVal;
				DOUBLE dblVal;
				VARIANT_BOOL boolVal;
				_VARIANT_BOOL bool_;
				SCODE scode;
				CY cyVal;
				DATE date;
				FILETIME filetime;
				CLSID* puuid;
				CLIPDATA* pclipdata;
				BSTR bstrVal;
				BSTRBLOB bstrblobVal;
				BLOB blob;
				LPSTR pszVal;
				LPWSTR pwszVal;
				IUnknown punkVal;
				IDispatch pdispVal;
				IStream pStream;
				IStorage pStorage;
				LPVERSIONEDSTREAM pVersionedStream;
				LPSAFEARRAY parray;
				CAC cac;
				CAUB caub;
				CAI cai;
				CAUI caui;
				CAL cal;
				CAUL caul;
				CAH cah;
				CAUH cauh;
				CAFLT caflt;
				CADBL cadbl;
				CABOOL cabool;
				CASCODE cascode;
				CACY cacy;
				CADATE cadate;
				CAFILETIME cafiletime;
				CACLSID cauuid;
				CACLIPDATA caclipdata;
				CABSTR cabstr;
				CABSTRBLOB cabstrblob;
				CALPSTR calpstr;
				CALPWSTR calpwstr;
				CAPROPVARIANT capropvar;
				CHAR* pcVal;
				UCHAR* pbVal;
				SHORT* piVal;
				USHORT* puiVal;
				LONG* plVal;
				ULONG* pulVal;
				INT* pintVal;
				UINT* puintVal;
				FLOAT* pfltVal;
				DOUBLE* pdblVal;
				VARIANT_BOOL* pboolVal;
				DECIMAL* pdecVal;
				SCODE* pscode;
				CY* pcyVal;
				DATE* pdate;
				BSTR* pbstrVal;
				IUnknown* ppunkVal;
				IDispatch* ppdispVal;
				LPSAFEARRAY* pparray;
				PROPVARIANT* pvarVal;
			}
		}
		DECIMAL decVal;
	}
}
alias PROPVARIANT* LPPROPVARIANT;
alias const(PROPVARIANT)* REFPROPVARIANT;

enum {
	PID_DICTIONARY         = 0,
	PID_CODEPAGE           = 0x1,
	PID_FIRST_USABLE       = 0x2,
	PID_FIRST_NAME_DEFAULT = 0xfff,
	PID_LOCALE             = 0x80000000,
	PID_MODIFY_TIME        = 0x80000001,
	PID_SECURITY           = 0x80000002,
	PID_BEHAVIOR           = 0x80000003,
	PID_ILLEGAL            = 0xffffffff,
	PID_MIN_READONLY       = 0x80000000,
	PID_MAX_READONLY       = 0xbfffffff,
}

enum {
	PIDDI_THUMBNAIL    = 0x00000002,
	PIDSI_TITLE        = 0x00000002,
	PIDSI_SUBJECT      = 0x00000003,
	PIDSI_AUTHOR       = 0x00000004,
	PIDSI_KEYWORDS     = 0x00000005,
	PIDSI_COMMENTS     = 0x00000006,
	PIDSI_TEMPLATE     = 0x00000007,
	PIDSI_LASTAUTHOR   = 0x00000008,
	PIDSI_REVNUMBER    = 0x00000009,
	PIDSI_EDITTIME     = 0x0000000a,
	PIDSI_LASTPRINTED  = 0x0000000b,
	PIDSI_CREATE_DTM   = 0x0000000c,
	PIDSI_LASTSAVE_DTM = 0x0000000d,
	PIDSI_PAGECOUNT    = 0x0000000e,
	PIDSI_WORDCOUNT    = 0x0000000f,
	PIDSI_CHARCOUNT    = 0x00000010,
	PIDSI_THUMBNAIL    = 0x00000011,
	PIDSI_APPNAME      = 0x00000012,
	PIDSI_DOC_SECURITY = 0x00000013,
	PIDDSI_CATEGORY    = 0x00000002,
	PIDDSI_PRESFORMAT  = 0x00000003,
	PIDDSI_BYTECOUNT   = 0x00000004,
	PIDDSI_LINECOUNT   = 0x00000005,
	PIDDSI_PARCOUNT    = 0x00000006,
	PIDDSI_SLIDECOUNT  = 0x00000007,
	PIDDSI_NOTECOUNT   = 0x00000008,
	PIDDSI_HIDDENCOUNT = 0x00000009,
	PIDDSI_MMCLIPCOUNT = 0x0000000A,
	PIDDSI_SCALE       = 0x0000000B,
	PIDDSI_HEADINGPAIR = 0x0000000C,
	PIDDSI_DOCPARTS    = 0x0000000D,
	PIDDSI_MANAGER     = 0x0000000E,
	PIDDSI_COMPANY     = 0x0000000F,
	PIDDSI_LINKSDIRTY  = 0x00000010,
	PIDMSI_EDITOR      = 0x00000002,
	PIDMSI_SUPPLIER    = 0x00000003,
	PIDMSI_SOURCE      = 0x00000004,
	PIDMSI_SEQUENCE_NO = 0x00000005,
	PIDMSI_PROJECT     = 0x00000006,
	PIDMSI_STATUS      = 0x00000007,
	PIDMSI_OWNER       = 0x00000008,
	PIDMSI_RATING      = 0x00000009,
	PIDMSI_PRODUCTION  = 0x0000000A,
	PIDMSI_COPYRIGHT   = 0x0000000B,
}

enum {
	PIDMSI_STATUS_NORMAL     = 0,
	PIDMSI_STATUS_NEW        = PIDMSI_STATUS_NORMAL + 1,
	PIDMSI_STATUS_PRELIM     = PIDMSI_STATUS_NEW + 1,
	PIDMSI_STATUS_DRAFT      = PIDMSI_STATUS_PRELIM + 1,
	PIDMSI_STATUS_INPROGRESS = PIDMSI_STATUS_DRAFT + 1,
	PIDMSI_STATUS_EDIT       = PIDMSI_STATUS_INPROGRESS + 1,
	PIDMSI_STATUS_REVIEW     = PIDMSI_STATUS_EDIT + 1,
	PIDMSI_STATUS_PROOF      = PIDMSI_STATUS_REVIEW + 1,
	PIDMSI_STATUS_FINAL      = PIDMSI_STATUS_PROOF + 1,
	PIDMSI_STATUS_OTHER      = 0x7fff
}
alias int PIDMSI_STATUS_VALUE;

enum {
	PRSPEC_INVALID = 0xffffffff,
	PRSPEC_LPWSTR  = 0,
	PRSPEC_PROPID  = 1,
}

struct PROPSPEC {
	ULONG ulKind;
	union {
		PROPID propid;
		LPOLESTR lpwstr;
	}
}

struct STATPROPSTG {
	LPOLESTR lpwstrName;
	PROPID propid;
	VARTYPE vt;
}

//PROPSETHDR_OSVER_KIND(dwOSVer) HIWORD( (dwOSVer) )
//PROPSETHDR_OSVER_MAJOR(dwOSVer) LOBYTE(LOWORD( (dwOSVer) ))
//PROPSETHDR_OSVER_MINOR(dwOSVer) HIBYTE(LOWORD( (dwOSVer) ))
//PROPSETHDR_OSVERSION_UNKNOWN 0xFFFFFFFF

struct STATPROPSETSTG {
	FMTID fmtid;
	CLSID clsid;
	DWORD grfFlags;
	FILETIME mtime;
	FILETIME ctime;
	FILETIME atime;
	DWORD dwOSVersion;
}

//extern extern(C) const IID IID_IPropertyStorage;
interface IPropertyStorage : IUnknown {
public extern(Windows):
	HRESULT ReadMultiple( ULONG cpspec, const(PROPSPEC)* rgpspec, PROPVARIANT* rgpropvar);
	HRESULT WriteMultiple(ULONG cpspec, const(PROPSPEC)* rgpspec, const(PROPVARIANT)* rgpropvar, PROPID propidNameFirst);
	HRESULT DeleteMultiple(ULONG cpspec, const(PROPSPEC)* rgpspec);
	HRESULT ReadPropertyNames(ULONG cpropid, const(PROPID)* rgpropid, LPOLESTR* rglpwstrName);
	HRESULT WritePropertyNames(ULONG cpropid, const(PROPID)* rgpropid, const(LPOLESTR)* rglpwstrName);
	HRESULT DeletePropertyNames(ULONG cpropid, const(PROPID)* rgpropid);
	HRESULT Commit(DWORD grfCommitFlags);
	HRESULT Revert();
	HRESULT Enum(IEnumSTATPROPSTG* ppenum);
	HRESULT SetTimes(const(FILETIME)* pctime, const(FILETIME)* patime, const(FILETIME)* pmtime);
	HRESULT SetClass(REFCLSID clsid);
	HRESULT Stat(STATPROPSETSTG* pstatpsstg);
}
mixin DEFINE_IID!(IPropertyStorage, "00000138-0000-0000-C000-000000000046");
alias IPropertyStorage LPPROPERTYSTORAGE;

//extern extern(C) const IID IID_IPropertySetStorage;
interface IPropertySetStorage : IUnknown {
public extern(Windows):
	HRESULT Create(REFFMTID rfmtid, const(CLSID)* pclsid, DWORD grfFlags, DWORD grfMode, IPropertyStorage* ppprstg);
	HRESULT Open(REFFMTID rfmtid, DWORD grfMode, IPropertyStorage* ppprstg);
	HRESULT Delete(REFFMTID rfmtid);
	HRESULT Enum(IEnumSTATPROPSETSTG* ppenum);
}
mixin DEFINE_IID!(IPropertySetStorage, "0000013A-0000-0000-C000-000000000046");
alias IPropertySetStorage LPPROPERTYSETSTORAGE;

//extern extern(C) const IID IID_IEnumSTATPROPSTG;
interface IEnumSTATPROPSTG : IUnknown {
public extern(Windows):
	HRESULT Next(ULONG celt, STATPROPSTG* rgelt, ULONG* pceltFetched);
	HRESULT Skip(ULONG celt);
	HRESULT Reset();
	HRESULT Clone(IEnumSTATPROPSTG* ppenum);
}
mixin DEFINE_IID!(IEnumSTATPROPSTG, "00000139-0000-0000-C000-000000000046");
alias IEnumSTATPROPSTG LPENUMSTATPROPSTG;

export extern(Windows){
	HRESULT IEnumSTATPROPSTG_RemoteNext_Proxy(IEnumSTATPROPSTG This, ULONG celt, STATPROPSTG* rgelt, ULONG* pceltFetched);
	void IEnumSTATPROPSTG_RemoteNext_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_IEnumSTATPROPSETSTG;
interface IEnumSTATPROPSETSTG : IUnknown {
public extern(Windows):
	HRESULT Next(ULONG celt, STATPROPSETSTG* rgelt, ULONG* pceltFetched);
	HRESULT Skip(ULONG celt);
	HRESULT Reset();
	HRESULT Clone(IEnumSTATPROPSETSTG* ppenum);
}
mixin DEFINE_IID!(IEnumSTATPROPSETSTG, "0000013B-0000-0000-C000-000000000046");
alias IEnumSTATPROPSETSTG LPENUMSTATPROPSETSTG;

export extern(Windows){
	HRESULT IEnumSTATPROPSETSTG_RemoteNext_Proxy(IEnumSTATPROPSETSTG This, ULONG celt, STATPROPSETSTG* rgelt, ULONG* pceltFetched);
	void IEnumSTATPROPSETSTG_RemoteNext_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

export extern(Windows){
	HRESULT PropVariantCopy(PROPVARIANT* pvarDest, const(PROPVARIANT)* pvarSrc);
	HRESULT PropVariantClear(PROPVARIANT* pvar);
	HRESULT FreePropVariantArray(ULONG cVariants, PROPVARIANT* rgvars);
	HRESULT StgCreatePropStg(IUnknown pUnk, REFFMTID fmtid, const(CLSID)* pclsid, DWORD grfFlags, DWORD dwReserved, IPropertyStorage* ppPropStg);
	HRESULT StgOpenPropStg(IUnknown pUnk, REFFMTID fmtid, DWORD grfFlags, DWORD dwReserved, IPropertyStorage* ppPropStg);
	HRESULT StgCreatePropSetStg(IStorage pStorage, DWORD dwReserved, IPropertySetStorage* ppPropSetStg);
}

enum CCH_MAX_PROPSTG_NAME = 31;

export extern(Windows){
	HRESULT FmtIdToPropStgName(const(FMTID)* pfmtid, LPOLESTR oszName);
	HRESULT PropStgNameToFmtId(const(LPOLESTR)* oszName, FMTID* pfmtid);
}

struct SERIALIZEDPROPERTYVALUE {
	DWORD dwType;
	BYTE[1] rgb;
}

export extern(Windows){
	SERIALIZEDPROPERTYVALUE* StgConvertVariantToProperty(const(PROPVARIANT)* pvar, USHORT CodePage, SERIALIZEDPROPERTYVALUE* pprop, ULONG* pcb, PROPID pid, BOOLEAN fReserved, ULONG* pcIndirect);

	enum PMemoryAllocator : void* {init = (void*).init} // where is defined it...?
	BOOLEAN StgConvertPropertyToVariant(const(SERIALIZEDPROPERTYVALUE)* pprop, USHORT CodePage, PROPVARIANT* pvar, PMemoryAllocator pma);
}

export extern(Windows){
	uint BSTR_UserSize(uint*, uint, BSTR*);
	ubyte* BSTR_UserMarshal(uint*, ubyte*, BSTR*);
	ubyte* BSTR_UserUnmarshal(uint*, ubyte*, BSTR*);
	void BSTR_UserFree(uint*, BSTR*);

	uint LPSAFEARRAY_UserSize(uint*, uint, LPSAFEARRAY*);
	ubyte* LPSAFEARRAY_UserMarshal(uint*, ubyte*, LPSAFEARRAY*);
	ubyte* LPSAFEARRAY_UserUnmarshal(uint*, ubyte*, LPSAFEARRAY*);
	void LPSAFEARRAY_UserFree(uint*, LPSAFEARRAY*);

	uint BSTR_UserSize64(uint*, uint, BSTR*);
	ubyte* BSTR_UserMarshal64(uint*, ubyte*, BSTR*);
	ubyte* BSTR_UserUnmarshal64(uint*, ubyte*, BSTR*);
	void BSTR_UserFree64(uint*, BSTR*);

	uint LPSAFEARRAY_UserSize64(uint*, uint, LPSAFEARRAY*);
	ubyte* LPSAFEARRAY_UserMarshal64(uint*, ubyte*, LPSAFEARRAY*);
	ubyte* LPSAFEARRAY_UserUnmarshal64(uint*, ubyte*, LPSAFEARRAY*);
	void LPSAFEARRAY_UserFree64(uint*, LPSAFEARRAY*);
}

export extern(Windows){
	HRESULT IEnumSTATPROPSTG_Next_Proxy(IEnumSTATPROPSTG This, ULONG celt, STATPROPSTG* rgelt, ULONG* pceltFetched);
	HRESULT IEnumSTATPROPSTG_Next_Stub(IEnumSTATPROPSTG This, ULONG celt, STATPROPSTG* rgelt, ULONG* pceltFetched);
	HRESULT IEnumSTATPROPSETSTG_Next_Proxy(IEnumSTATPROPSETSTG This, ULONG celt, STATPROPSETSTG* rgelt, ULONG* pceltFetched);
	HRESULT IEnumSTATPROPSETSTG_Next_Stub(IEnumSTATPROPSETSTG This, ULONG celt, STATPROPSETSTG* rgelt, ULONG* pceltFetched);
}

} // extern(C)

