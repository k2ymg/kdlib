/** oaidl.d

Converted from 'oaidl.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.oaidl;


import c.windows.windef;
import c.windows.wtypes;
import c.windows.guiddef;
import c.windows.unknwn;
import c.windows.objidl;
import c.windows.rpcdcep;


extern(C){

alias CY CURRENCY;

struct SAFEARRAYBOUND {
	ULONG cElements;
	LONG lLbound;
}
alias SAFEARRAYBOUND* LPSAFEARRAYBOUND;
alias _wireVARIANT* wireVARIANT;
alias _wireBRECORD* wireBRECORD;

struct SAFEARR_BSTR {
	ULONG Size;
	wireBSTR* aBstr;
}

struct SAFEARR_UNKNOWN {
	ULONG Size;
	IUnknown* apUnknown;
}

struct SAFEARR_DISPATCH {
	ULONG Size;
	IDispatch* apDispatch;
}

struct SAFEARR_VARIANT {
	ULONG Size;
	wireVARIANT* aVariant;
}

struct SAFEARR_BRECORD {
	ULONG Size;
	wireBRECORD* aRecord;
}

struct SAFEARR_HAVEIID {
	ULONG Size;
	IUnknown* apUnknown;
	IID iid;
}

enum {
	SF_ERROR    = VT_ERROR,
	SF_I1       = VT_I1,
	SF_I2       = VT_I2,
	SF_I4       = VT_I4,
	SF_I8       = VT_I8,
	SF_BSTR     = VT_BSTR,
	SF_UNKNOWN  = VT_UNKNOWN,
	SF_DISPATCH = VT_DISPATCH,
	SF_VARIANT  = VT_VARIANT,
	SF_RECORD   = VT_RECORD,
	SF_HAVEIID  = VT_UNKNOWN | VT_RESERVED,
}
alias int SF_TYPE;

struct SAFEARRAYUNION {
	ULONG sfType;
	union {
		SAFEARR_BSTR BstrStr;
		SAFEARR_UNKNOWN UnknownStr;
		SAFEARR_DISPATCH DispatchStr;
		SAFEARR_VARIANT VariantStr;
		SAFEARR_BRECORD RecordStr;
		SAFEARR_HAVEIID HaveIidStr;
		BYTE_SIZEDARR ByteStr;
		WORD_SIZEDARR WordStr;
		DWORD_SIZEDARR LongStr;
		HYPER_SIZEDARR HyperStr;
	}
}

struct _wireSAFEARRAY {
	USHORT cDims;
	USHORT fFeatures;
	ULONG cbElements;
	ULONG cLocks;
	SAFEARRAYUNION uArrayStructs;
	SAFEARRAYBOUND[1] rgsabound;
}
alias _wireSAFEARRAY* wireSAFEARRAY;
alias wireSAFEARRAY* wirePSAFEARRAY;

struct SAFEARRAY {
	USHORT cDims;
	USHORT fFeatures;
	ULONG cbElements;
	ULONG cLocks;
	PVOID pvData;
	SAFEARRAYBOUND[1] rgsabound;
}
alias SAFEARRAY* LPSAFEARRAY;

enum {
	FADF_AUTO        = 0x1,
	FADF_STATIC      = 0x2,
	FADF_EMBEDDED    = 0x4,
	FADF_FIXEDSIZE   = 0x10,
	FADF_RECORD      = 0x20,
	FADF_HAVEIID     = 0x40,
	FADF_HAVEVARTYPE = 0x80,
	FADF_BSTR        = 0x100,
	FADF_UNKNOWN     = 0x200,
	FADF_DISPATCH    = 0x400,
	FADF_VARIANT     = 0x800,
	FADF_RESERVED    = 0xf008,
}


struct VARIANT {
	union {
		struct {
			VARTYPE vt;
			WORD wReserved1;
			WORD wReserved2;
			WORD wReserved3;
			union {
				LONGLONG llVal;
				LONG lVal;
				BYTE bVal;
				SHORT iVal;
				FLOAT fltVal;
				DOUBLE dblVal;
				VARIANT_BOOL boolVal;
				_VARIANT_BOOL bool_;
				SCODE scode;
				CY cyVal;
				DATE date;
				BSTR bstrVal;
				IUnknown punkVal;
				IDispatch pdispVal;
				SAFEARRAY* parray;
				BYTE* pbVal;
				SHORT* piVal;
				LONG* plVal;
				LONGLONG* pllVal;
				FLOAT* pfltVal;
				DOUBLE* pdblVal;
				VARIANT_BOOL* pboolVal;
				_VARIANT_BOOL* pbool;
				SCODE* pscode;
				CY* pcyVal;
				DATE* pdate;
				BSTR* pbstrVal;
				IUnknown* ppunkVal;
				IDispatch* ppdispVal;
				SAFEARRAY** pparray;
				VARIANT* pvarVal;
				PVOID byref;
				CHAR cVal;
				USHORT uiVal;
				ULONG ulVal;
				ULONGLONG ullVal;
				INT intVal;
				UINT uintVal;
				DECIMAL* pdecVal;
				CHAR* pcVal;
				USHORT* puiVal;
				ULONG* pulVal;
				ULONGLONG* pullVal;
				INT* pintVal;
				UINT* puintVal;
				struct {
					PVOID pvRecord;
					IRecordInfo pRecInfo;
				}
			}
		}
		DECIMAL decVal;
	}
}
alias VARIANT* LPVARIANT;
alias VARIANT VARIANTARG;
alias VARIANT* LPVARIANTARG;

alias const(VARIANT)* REFVARIANT;


struct _wireBRECORD {
	ULONG fFlags;
	ULONG clSize;
	IRecordInfo pRecInfo;
	byte* pRecord;
}
struct _wireVARIANT {
	DWORD clSize;
	DWORD rpcReserved;
	USHORT vt;
	USHORT wReserved1;
	USHORT wReserved2;
	USHORT wReserved3;
	union {
		LONGLONG llVal;
		LONG lVal;
		BYTE bVal;
		SHORT iVal;
		FLOAT fltVal;
		DOUBLE dblVal;
		VARIANT_BOOL boolVal;
		SCODE scode;
		CY cyVal;
		DATE date;
		wireBSTR bstrVal;
		IUnknown punkVal;
		IDispatch pdispVal;
		wirePSAFEARRAY parray;
		wireBRECORD brecVal;
		BYTE* pbVal;
		SHORT* piVal;
		LONG* plVal;
		LONGLONG* pllVal;
		FLOAT* pfltVal;
		DOUBLE* pdblVal;
		VARIANT_BOOL* pboolVal;
		SCODE* pscode;
		CY* pcyVal;
		DATE* pdate;
		wireBSTR* pbstrVal;
		IUnknown* ppunkVal;
		IDispatch* ppdispVal;
		wirePSAFEARRAY* pparray;
		wireVARIANT* pvarVal;
		CHAR cVal;
		USHORT uiVal;
		ULONG ulVal;
		ULONGLONG ullVal;
		INT intVal;
		UINT uintVal;
		DECIMAL decVal;
		DECIMAL* pdecVal;
		CHAR* pcVal;
		USHORT* puiVal;
		ULONG* pulVal;
		ULONGLONG* pullVal;
		INT* pintVal;
		UINT* puintVal;
	}
}
alias LONG DISPID;
alias DISPID MEMBERID;
alias DWORD HREFTYPE;

enum {
	TKIND_ENUM      = 0,
	TKIND_RECORD    = TKIND_ENUM + 1,
	TKIND_MODULE    = TKIND_RECORD + 1,
	TKIND_INTERFACE = TKIND_MODULE + 1,
	TKIND_DISPATCH  = TKIND_INTERFACE + 1,
	TKIND_COCLASS   = TKIND_DISPATCH + 1,
	TKIND_ALIAS     = TKIND_COCLASS + 1,
	TKIND_UNION     = TKIND_ALIAS + 1,
	TKIND_MAX       = TKIND_UNION + 1
}
alias int TYPEKIND;

struct TYPEDESC {
	union {
		TYPEDESC* lptdesc;
		ARRAYDESC* lpadesc;
		HREFTYPE hreftype;
	}
	VARTYPE vt;
}

struct ARRAYDESC {
	TYPEDESC tdescElem;
	USHORT cDims;
	SAFEARRAYBOUND[1] rgbounds;
}

struct PARAMDESCEX {
	ULONG cBytes;
	VARIANTARG varDefaultValue;
}
alias PARAMDESCEX* LPPARAMDESCEX;

struct PARAMDESC {
	LPPARAMDESCEX pparamdescex;
	USHORT wParamFlags;
}
alias PARAMDESC* LPPARAMDESC;

enum {
	PARAMFLAG_NONE         = 0,
	PARAMFLAG_FIN          = 0x1,
	PARAMFLAG_FOUT         = 0x2,
	PARAMFLAG_FLCID        = 0x4,
	PARAMFLAG_FRETVAL      = 0x8,
	PARAMFLAG_FOPT         = 0x10,
	PARAMFLAG_FHASDEFAULT  = 0x20,
	PARAMFLAG_FHASCUSTDATA = 0x40,
}

struct IDLDESC {
	ULONG_PTR dwReserved;
	USHORT wIDLFlags;
}
alias IDLDESC* LPIDLDESC;

enum {
	IDLFLAG_NONE    = PARAMFLAG_NONE,
	IDLFLAG_FIN     = PARAMFLAG_FIN,
	IDLFLAG_FOUT    = PARAMFLAG_FOUT,
	IDLFLAG_FLCID   = PARAMFLAG_FLCID,
	IDLFLAG_FRETVAL = PARAMFLAG_FRETVAL,
}

struct ELEMDESC {
	TYPEDESC tdesc;
	union {
		IDLDESC idldesc;
		PARAMDESC paramdesc;
	}
}
alias ELEMDESC* LPELEMDESC;

struct TYPEATTR {
	GUID guid;
	LCID lcid;
	DWORD dwReserved;
	MEMBERID memidConstructor;
	MEMBERID memidDestructor;
	LPOLESTR lpstrSchema;
	ULONG cbSizeInstance;
	TYPEKIND typekind;
	WORD cFuncs;
	WORD cVars;
	WORD cImplTypes;
	WORD cbSizeVft;
	WORD cbAlignment;
	WORD wTypeFlags;
	WORD wMajorVerNum;
	WORD wMinorVerNum;
	TYPEDESC tdescAlias;
	IDLDESC idldescType;
}
alias TYPEATTR* LPTYPEATTR;

struct DISPPARAMS {
	VARIANTARG* rgvarg;
	DISPID* rgdispidNamedArgs;
	UINT cArgs;
	UINT cNamedArgs;
}

struct EXCEPINFO {
	WORD wCode;
	WORD wReserved;
	BSTR bstrSource;
	BSTR bstrDescription;
	BSTR bstrHelpFile;
	DWORD dwHelpContext;
	PVOID pvReserved;
	extern(Windows) HRESULT function(EXCEPINFO*) pfnDeferredFillIn;
	SCODE scode;
}
alias EXCEPINFO* LPEXCEPINFO;

enum {
	CC_FASTCALL   = 0,
	CC_CDECL      = 1,
	CC_MSCPASCAL  = CC_CDECL + 1,
	CC_PASCAL     = CC_MSCPASCAL,
	CC_MACPASCAL  = CC_PASCAL + 1,
	CC_STDCALL    = CC_MACPASCAL + 1,
	CC_FPFASTCALL = CC_STDCALL + 1,
	CC_SYSCALL    = CC_FPFASTCALL + 1,
	CC_MPWCDECL   = CC_SYSCALL + 1,
	CC_MPWPASCAL  = CC_MPWCDECL + 1,
	CC_MAX        = CC_MPWPASCAL + 1
}
alias int CALLCONV;

enum {
	FUNC_VIRTUAL     = 0,
	FUNC_PUREVIRTUAL = FUNC_VIRTUAL + 1,
	FUNC_NONVIRTUAL  = FUNC_PUREVIRTUAL + 1,
	FUNC_STATIC      = FUNC_NONVIRTUAL + 1,
	FUNC_DISPATCH    = FUNC_STATIC + 1
}
alias int FUNCKIND;

enum {
	INVOKE_FUNC           = 1,
	INVOKE_PROPERTYGET    = 2,
	INVOKE_PROPERTYPUT    = 4,
	INVOKE_PROPERTYPUTREF = 8
}
alias int INVOKEKIND;

struct FUNCDESC {
	MEMBERID memid;
	SCODE* lprgscode;
	ELEMDESC* lprgelemdescParam;
	FUNCKIND funckind;
	INVOKEKIND invkind;
	CALLCONV callconv;
	SHORT cParams;
	SHORT cParamsOpt;
	SHORT oVft;
	SHORT cScodes;
	ELEMDESC elemdescFunc;
	WORD wFuncFlags;
}
alias FUNCDESC* LPFUNCDESC;

enum {
	VAR_PERINSTANCE = 0,
	VAR_STATIC      = VAR_PERINSTANCE + 1,
	VAR_CONST       = VAR_STATIC + 1,
	VAR_DISPATCH    = VAR_CONST + 1
}
alias int VARKIND;

enum {
	IMPLTYPEFLAG_FDEFAULT       = 0x1,
	IMPLTYPEFLAG_FSOURCE        = 0x2,
	IMPLTYPEFLAG_FRESTRICTED    = 0x4,
	IMPLTYPEFLAG_FDEFAULTVTABLE = 0x8,
}

struct VARDESC {
	MEMBERID memid;
	LPOLESTR lpstrSchema;
	union {
		ULONG oInst;
		VARIANT* lpvarValue;
	}
	ELEMDESC elemdescVar;
	WORD wVarFlags;
	VARKIND varkind;
}
alias VARDESC* LPVARDESC;

enum  {
	TYPEFLAG_FAPPOBJECT     = 0x1,
	TYPEFLAG_FCANCREATE     = 0x2,
	TYPEFLAG_FLICENSED      = 0x4,
	TYPEFLAG_FPREDECLID     = 0x8,
	TYPEFLAG_FHIDDEN        = 0x10,
	TYPEFLAG_FCONTROL       = 0x20,
	TYPEFLAG_FDUAL          = 0x40,
	TYPEFLAG_FNONEXTENSIBLE = 0x80,
	TYPEFLAG_FOLEAUTOMATION = 0x100,
	TYPEFLAG_FRESTRICTED    = 0x200,
	TYPEFLAG_FAGGREGATABLE  = 0x400,
	TYPEFLAG_FREPLACEABLE   = 0x800,
	TYPEFLAG_FDISPATCHABLE  = 0x1000,
	TYPEFLAG_FREVERSEBIND   = 0x2000,
	TYPEFLAG_FPROXY         = 0x4000
}
alias int TYPEFLAGS;

enum {
	FUNCFLAG_FRESTRICTED       = 0x1,
	FUNCFLAG_FSOURCE           = 0x2,
	FUNCFLAG_FBINDABLE         = 0x4,
	FUNCFLAG_FREQUESTEDIT      = 0x8,
	FUNCFLAG_FDISPLAYBIND      = 0x10,
	FUNCFLAG_FDEFAULTBIND      = 0x20,
	FUNCFLAG_FHIDDEN           = 0x40,
	FUNCFLAG_FUSESGETLASTERROR = 0x80,
	FUNCFLAG_FDEFAULTCOLLELEM  = 0x100,
	FUNCFLAG_FUIDEFAULT        = 0x200,
	FUNCFLAG_FNONBROWSABLE     = 0x400,
	FUNCFLAG_FREPLACEABLE      = 0x800,
	FUNCFLAG_FIMMEDIATEBIND    = 0x1000
}
alias int FUNCFLAGS;

enum {
	VARFLAG_FREADONLY        = 0x1,
	VARFLAG_FSOURCE          = 0x2,
	VARFLAG_FBINDABLE        = 0x4,
	VARFLAG_FREQUESTEDIT     = 0x8,
	VARFLAG_FDISPLAYBIND     = 0x10,
	VARFLAG_FDEFAULTBIND     = 0x20,
	VARFLAG_FHIDDEN          = 0x40,
	VARFLAG_FRESTRICTED      = 0x80,
	VARFLAG_FDEFAULTCOLLELEM = 0x100,
	VARFLAG_FUIDEFAULT       = 0x200,
	VARFLAG_FNONBROWSABLE    = 0x400,
	VARFLAG_FREPLACEABLE     = 0x800,
	VARFLAG_FIMMEDIATEBIND   = 0x1000
}
alias int VARFLAGS;

struct CLEANLOCALSTORAGE {
	IUnknown pInterface;
	PVOID pStorage;
	DWORD flags;
}

struct CUSTDATAITEM {
	GUID guid;
	VARIANTARG varValue;
}
alias CUSTDATAITEM* LPCUSTDATAITEM;

struct CUSTDATA {
	DWORD cCustData;
	LPCUSTDATAITEM prgCustData;
}
alias CUSTDATA* LPCUSTDATA;

//extern extern(C) const IID IID_ICreateTypeInfo;
interface ICreateTypeInfo : IUnknown {
public extern(Windows):
	HRESULT SetGuid(REFGUID guid);
	HRESULT SetTypeFlags(UINT uTypeFlags);
	HRESULT SetDocString(LPOLESTR pStrDoc);
	HRESULT SetHelpContext(DWORD dwHelpContext);
	HRESULT SetVersion(WORD wMajorVerNum, WORD wMinorVerNum);
	HRESULT AddRefTypeInfo(ITypeInfo pTInfo, HREFTYPE* phRefType);
	HRESULT AddFuncDesc(UINT index, FUNCDESC* pFuncDesc);
	HRESULT AddImplType(UINT index, HREFTYPE hRefType);
	HRESULT SetImplTypeFlags(UINT index, INT implTypeFlags);
	HRESULT SetAlignment(WORD cbAlignment);
	HRESULT SetSchema(LPOLESTR pStrSchema);
	HRESULT AddVarDesc(UINT index, VARDESC* pVarDesc);
	HRESULT SetFuncAndParamNames(UINT index, LPOLESTR* rgszNames, UINT cNames);
	HRESULT SetVarName(UINT index, LPOLESTR szName);
	HRESULT SetTypeDescAlias(TYPEDESC* pTDescAlias);
	HRESULT DefineFuncAsDllEntry(UINT index, LPOLESTR szDllName, LPOLESTR szProcName);
	HRESULT SetFuncDocString(UINT index, LPOLESTR szDocString);
	HRESULT SetVarDocString(UINT index, LPOLESTR szDocString);
	HRESULT SetFuncHelpContext(UINT index, DWORD dwHelpContext);
	HRESULT SetVarHelpContext(UINT index, DWORD dwHelpContext);
	HRESULT SetMops(UINT index, BSTR bstrMops);
	HRESULT SetTypeIdldesc(IDLDESC* pIdlDesc);
	HRESULT LayOut();
}
mixin DEFINE_IID!(ICreateTypeInfo, "00020405-0000-0000-C000-000000000046");
alias ICreateTypeInfo LPCREATETYPEINFO;

//extern extern(C) const IID IID_ICreateTypeInfo2;
interface ICreateTypeInfo2 : ICreateTypeInfo {
public extern(Windows):
	HRESULT DeleteFuncDesc(UINT index);
	HRESULT DeleteFuncDescByMemId(MEMBERID memid, INVOKEKIND invKind);
	HRESULT DeleteVarDesc(UINT index);
	HRESULT DeleteVarDescByMemId(MEMBERID memid);
	HRESULT DeleteImplType(UINT index);
	HRESULT SetCustData(REFGUID guid, VARIANT* pVarVal);
	HRESULT SetFuncCustData(UINT index, REFGUID guid, VARIANT* pVarVal);
	HRESULT SetParamCustData(UINT indexFunc, UINT indexParam, REFGUID guid, VARIANT* pVarVal);
	HRESULT SetVarCustData(UINT index, REFGUID guid, VARIANT* pVarVal);
	HRESULT SetImplTypeCustData(UINT index, REFGUID guid, VARIANT* pVarVal);
	HRESULT SetHelpStringContext(ULONG dwHelpStringContext);
	HRESULT SetFuncHelpStringContext(UINT index, ULONG dwHelpStringContext);
	HRESULT SetVarHelpStringContext(UINT index, ULONG dwHelpStringContext);
	HRESULT Invalidate();
	HRESULT SetName(LPOLESTR szName);
}
mixin DEFINE_IID!(ICreateTypeInfo2, "0002040E-0000-0000-C000-000000000046");
alias ICreateTypeInfo2 LPCREATETYPEINFO2;

//extern extern(C) const IID IID_ICreateTypeLib;
interface ICreateTypeLib : IUnknown {
public extern(Windows):
	HRESULT CreateTypeInfo(LPOLESTR szName, TYPEKIND tkind, ICreateTypeInfo* ppCTInfo);
	HRESULT SetName(LPOLESTR szName);
	HRESULT SetVersion(WORD wMajorVerNum, WORD wMinorVerNum);
	HRESULT SetGuid(REFGUID guid);
	HRESULT SetDocString(LPOLESTR szDoc);
	HRESULT SetHelpFileName(LPOLESTR szHelpFileName);
	HRESULT SetHelpContext(DWORD dwHelpContext);
	HRESULT SetLcid(LCID lcid);
	HRESULT SetLibFlags(UINT uLibFlags);
	HRESULT SaveAllChanges();
}
mixin DEFINE_IID!(ICreateTypeLib, "00020406-0000-0000-C000-000000000046");
alias ICreateTypeLib LPCREATETYPELIB;

//extern extern(C) const IID IID_ICreateTypeLib2;
interface ICreateTypeLib2 : ICreateTypeLib {
public extern(Windows):
	HRESULT DeleteTypeInfo(LPOLESTR szName);
	HRESULT SetCustData(REFGUID guid, VARIANT* pVarVal);
	HRESULT SetHelpStringContext(ULONG dwHelpStringContext);
	HRESULT SetHelpStringDll(LPOLESTR szFileName);
}
mixin DEFINE_IID!(ICreateTypeLib2, "0002040F-0000-0000-C000-000000000046");
alias ICreateTypeLib2 LPCREATETYPELIB2;

enum {
	DISPID_UNKNOWN     = -1,
	DISPID_VALUE       = 0,
	DISPID_PROPERTYPUT = -3,
	DISPID_NEWENUM     = -4,
	DISPID_EVALUATE    = -5,
	DISPID_CONSTRUCTOR = -6,
	DISPID_DESTRUCTOR  = -7,
	DISPID_COLLECT     = -8,
}

//extern extern(C) const IID IID_IDispatch;
interface IDispatch : IUnknown {
public extern(Windows):
	HRESULT GetTypeInfoCount(UINT* pctinfo);
	HRESULT GetTypeInfo(UINT iTInfo, LCID lcid, ITypeInfo* ppTInfo);
	HRESULT GetIDsOfNames(REFIID riid, LPOLESTR* rgszNames, UINT cNames, LCID lcid, DISPID* rgDispId);
	HRESULT Invoke(DISPID dispIdMember, REFIID riid, LCID lcid, WORD wFlags, DISPPARAMS* pDispParams, VARIANT* pVarResult, EXCEPINFO* pExcepInfo, UINT* puArgErr);
}
mixin DEFINE_GUID!(IDispatch, "00020400-0000-0000-C000-000000000046");
alias IDispatch LPDISPATCH;

export extern(Windows){
	HRESULT IDispatch_RemoteInvoke_Proxy(IDispatch This, DISPID dispIdMember, REFIID riid, LCID lcid, DWORD dwFlags, DISPPARAMS* pDispParams, VARIANT* pVarResult, EXCEPINFO* pExcepInfo, UINT* pArgErr, UINT cVarRef, UINT* rgVarRefIdx, VARIANTARG* rgVarRef);
	void IDispatch_RemoteInvoke_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_IEnumVARIANT;
interface IEnumVARIANT : IUnknown {
public extern(Windows):
	HRESULT Next(ULONG celt, VARIANT* rgVar, ULONG* pCeltFetched);
	HRESULT Skip(ULONG celt);
	HRESULT Reset();
	HRESULT Clone(IEnumVARIANT* ppEnum);
}
mixin DEFINE_IID!(IEnumVARIANT, "00020404-0000-0000-C000-000000000046");
alias IEnumVARIANT LPENUMVARIANT;

export extern(Windows){
	HRESULT IEnumVARIANT_RemoteNext_Proxy(IEnumVARIANT This, ULONG celt, VARIANT* rgVar, ULONG* pCeltFetched);
	void IEnumVARIANT_RemoteNext_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

enum {
	DESCKIND_NONE           = 0,
	DESCKIND_FUNCDESC       = DESCKIND_NONE + 1,
	DESCKIND_VARDESC        = DESCKIND_FUNCDESC + 1,
	DESCKIND_TYPECOMP       = DESCKIND_VARDESC + 1,
	DESCKIND_IMPLICITAPPOBJ = DESCKIND_TYPECOMP + 1,
	DESCKIND_MAX            = DESCKIND_IMPLICITAPPOBJ + 1
}
alias int DESCKIND;

union BINDPTR {
	FUNCDESC* lpfuncdesc;
	VARDESC* lpvardesc;
	ITypeComp lptcomp;
}
alias BINDPTR* LPBINDPTR;

//extern extern(C) const IID IID_ITypeComp;
interface ITypeComp : IUnknown {
public extern(Windows):
	HRESULT Bind(LPOLESTR szName, ULONG lHashVal, WORD wFlags, ITypeInfo* ppTInfo, DESCKIND* pDescKind, BINDPTR* pBindPtr);
	HRESULT BindType(LPOLESTR szName, ULONG lHashVal, ITypeInfo* ppTInfo, ITypeComp* ppTComp);
}
mixin DEFINE_IID!(ITypeComp, "00020403-0000-0000-C000-000000000046");
alias ITypeComp LPTYPECOMP;

export extern(Windows){
	HRESULT ITypeComp_RemoteBind_Proxy(ITypeComp This, LPOLESTR szName, ULONG lHashVal, WORD wFlags, ITypeInfo* ppTInfo, DESCKIND* pDescKind, LPFUNCDESC* ppFuncDesc, LPVARDESC* ppVarDesc, ITypeComp* ppTypeComp, CLEANLOCALSTORAGE* pDummy);
	void ITypeComp_RemoteBind_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT ITypeComp_RemoteBindType_Proxy(ITypeComp This, LPOLESTR szName, ULONG lHashVal, ITypeInfo* ppTInfo);
	void ITypeComp_RemoteBindType_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_ITypeInfo;
interface ITypeInfo : IUnknown {
public extern(Windows):
	HRESULT GetTypeAttr(TYPEATTR* ppTypeAttr);
	HRESULT GetTypeComp(ITypeComp* ppTComp);
	HRESULT GetFuncDesc(UINT index, FUNCDESC** ppFuncDesc);
	HRESULT GetVarDesc(UINT index, VARDESC** ppVarDesc);
	HRESULT GetNames(MEMBERID memid, BSTR* rgBstrNames, UINT cMaxNames, UINT* pcNames);
	HRESULT GetRefTypeOfImplType(UINT index, HREFTYPE* pRefType);
	HRESULT GetImplTypeFlags(UINT index, INT* pImplTypeFlags);
	HRESULT GetIDsOfNames(LPOLESTR* rgszNames, UINT cNames, MEMBERID* pMemId);
	HRESULT Invoke(PVOID pvInstance, MEMBERID memid, WORD wFlags, DISPPARAMS* pDispParams, VARIANT* pVarResult, EXCEPINFO* pExcepInfo, UINT* puArgErr);
	HRESULT GetDocumentation(MEMBERID memid, BSTR* pBstrName, BSTR* pBstrDocString, DWORD* pdwHelpContext, BSTR* pBstrHelpFile);
	HRESULT GetDllEntry(MEMBERID memid, INVOKEKIND invKind, BSTR* pBstrDllName, BSTR* pBstrName, WORD* pwOrdinal);
	HRESULT GetRefTypeInfo(HREFTYPE hRefType, ITypeInfo* ppTInfo);
	HRESULT AddressOfMember(MEMBERID memid, INVOKEKIND invKind, PVOID* ppv);
	HRESULT CreateInstance(IUnknown pUnkOuter, REFIID riid, PVOID* ppvObj);
	HRESULT GetMops(MEMBERID memid, BSTR* pBstrMops);
	HRESULT GetContainingTypeLib(ITypeLib* ppTLib, UINT* pIndex);
	void ReleaseTypeAttr(TYPEATTR* pTypeAttr);
	void ReleaseFuncDesc(FUNCDESC* pFuncDesc);
	void  ReleaseVarDesc(VARDESC* pVarDesc);
}
mixin DEFINE_IID!(ITypeInfo, "00020401-0000-0000-C000-000000000046");
alias ITypeInfo LPTYPEINFO;

export extern(Windows){
	HRESULT ITypeInfo_RemoteGetTypeAttr_Proxy(ITypeInfo This, LPTYPEATTR* ppTypeAttr, CLEANLOCALSTORAGE* pDummy);
	void ITypeInfo_RemoteGetTypeAttr_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT ITypeInfo_RemoteGetFuncDesc_Proxy(ITypeInfo This, UINT index, LPFUNCDESC* ppFuncDesc, CLEANLOCALSTORAGE* pDummy);
	void ITypeInfo_RemoteGetFuncDesc_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT ITypeInfo_RemoteGetVarDesc_Proxy(ITypeInfo This, UINT index, LPVARDESC* ppVarDesc, CLEANLOCALSTORAGE* pDummy);
	void ITypeInfo_RemoteGetVarDesc_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT ITypeInfo_RemoteGetNames_Proxy(ITypeInfo This, MEMBERID memid, BSTR* rgBstrNames, UINT cMaxNames, UINT* pcNames);
	void ITypeInfo_RemoteGetNames_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT ITypeInfo_LocalGetIDsOfNames_Proxy(ITypeInfo This);
	void ITypeInfo_LocalGetIDsOfNames_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT ITypeInfo_LocalInvoke_Proxy(ITypeInfo This);
	void ITypeInfo_LocalInvoke_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT ITypeInfo_RemoteGetDocumentation_Proxy(ITypeInfo This, MEMBERID memid, DWORD refPtrFlags, BSTR* pBstrName, BSTR* pBstrDocString, DWORD* pdwHelpContext, BSTR* pBstrHelpFile);
	void ITypeInfo_RemoteGetDocumentation_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT ITypeInfo_RemoteGetDllEntry_Proxy(ITypeInfo This, MEMBERID memid, INVOKEKIND invKind, DWORD refPtrFlags, BSTR* pBstrDllName, BSTR* pBstrName, WORD* pwOrdinal);
	void ITypeInfo_RemoteGetDllEntry_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT ITypeInfo_LocalAddressOfMember_Proxy(ITypeInfo This);
	void ITypeInfo_LocalAddressOfMember_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD _pdwStubPhase);
	HRESULT ITypeInfo_RemoteCreateInstance_Proxy(ITypeInfo This, REFIID riid, IUnknown* ppvObj);
	void ITypeInfo_RemoteCreateInstance_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD _pdwStubPhase);
	HRESULT ITypeInfo_RemoteGetContainingTypeLib_Proxy(ITypeInfo This, ITypeLib* ppTLib, UINT* pIndex);
	void ITypeInfo_RemoteGetContainingTypeLib_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT ITypeInfo_LocalReleaseTypeAttr_Proxy(ITypeInfo This);
	void ITypeInfo_LocalReleaseTypeAttr_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT ITypeInfo_LocalReleaseFuncDesc_Proxy(ITypeInfo This);
	void ITypeInfo_LocalReleaseFuncDesc_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT ITypeInfo_LocalReleaseVarDesc_Proxy(ITypeInfo This);
	void ITypeInfo_LocalReleaseVarDesc_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD _pdwStubPhase);
}

//extern extern(C) const IID IID_ITypeInfo2;
interface ITypeInfo2 : ITypeInfo {
public extern(Windows):
	HRESULT GetTypeKind(TYPEKIND* pTypeKind);
	HRESULT GetTypeFlags(ULONG* pTypeFlags);
	HRESULT GetFuncIndexOfMemId(MEMBERID memid, INVOKEKIND invKind, UINT* pFuncIndex);
	HRESULT GetVarIndexOfMemId(MEMBERID memid, UINT* pVarIndex);
	HRESULT GetCustData(REFGUID guid, VARIANT* pVarVal);
	HRESULT GetFuncCustData(UINT index, REFGUID guid, VARIANT* pVarVal);
	HRESULT GetParamCustData(UINT indexFunc, UINT indexParam, REFGUID guid, VARIANT* pVarVal);
	HRESULT GetVarCustData(UINT index, REFGUID guid, VARIANT* pVarVal);
	HRESULT GetImplTypeCustData(UINT index, REFGUID guid, VARIANT* pVarVal);
	HRESULT GetDocumentation2(MEMBERID memid, LCID lcid, BSTR* pbstrHelpString, DWORD* pdwHelpStringContext, BSTR* pbstrHelpStringDll);
	HRESULT GetAllCustData(CUSTDATA* pCustData);
	HRESULT GetAllFuncCustData(UINT index, CUSTDATA* pCustData);
	HRESULT GetAllParamCustData(UINT indexFunc, UINT indexParam, CUSTDATA* pCustData);
	HRESULT GetAllVarCustData(UINT index, CUSTDATA* pCustData);
	HRESULT GetAllImplTypeCustData(UINT index, CUSTDATA* pCustData);
}
mixin DEFINE_IID!(ITypeInfo2, "00020412-0000-0000-C000-000000000046");
alias ITypeInfo2 LPTYPEINFO2;

export extern(Windows){
	HRESULT ITypeInfo2_RemoteGetDocumentation2_Proxy(ITypeInfo2 This, MEMBERID memid, LCID lcid, DWORD refPtrFlags, BSTR* pbstrHelpString, DWORD* pdwHelpStringContext, BSTR* pbstrHelpStringDll);
	void ITypeInfo2_RemoteGetDocumentation2_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

enum {
	SYS_WIN16 = 0,
	SYS_WIN32 = SYS_WIN16 + 1,
	SYS_MAC   = SYS_WIN32 + 1,
	SYS_WIN64 = SYS_MAC + 1
}
alias int SYSKIND;

enum {
	LIBFLAG_FRESTRICTED   = 0x1,
	LIBFLAG_FCONTROL      = 0x2,
	LIBFLAG_FHIDDEN       = 0x4,
	LIBFLAG_FHASDISKIMAGE = 0x8
}
alias int LIBFLAGS;

struct TLIBATTR {
	GUID guid;
	LCID lcid;
	SYSKIND syskind;
	WORD wMajorVerNum;
	WORD wMinorVerNum;
	WORD wLibFlags;
}
alias TLIBATTR* LPTLIBATTR;

//extern extern(C) const IID IID_ITypeLib;
interface ITypeLib : IUnknown {
public extern(Windows):
	UINT GetTypeInfoCount();
	HRESULT GetTypeInfo(UINT index, ITypeInfo* ppTInfo);
	HRESULT GetTypeInfoType(UINT index, TYPEKIND* pTKind);
	HRESULT GetTypeInfoOfGuid(REFGUID guid, ITypeInfo* ppTinfo);
	HRESULT GetLibAttr(TLIBATTR** ppTLibAttr);
	HRESULT GetTypeComp(ITypeComp* ppTComp);
	HRESULT GetDocumentation(INT index, BSTR* pBstrName, BSTR* pBstrDocString, DWORD* pdwHelpContext, BSTR* pBstrHelpFile);
	HRESULT IsName(LPOLESTR szNameBuf, ULONG lHashVal, BOOL* pfName);
	HRESULT FindName(LPOLESTR szNameBuf, ULONG lHashVal, ITypeInfo* ppTInfo, MEMBERID* rgMemId, USHORT* pcFound);
	void  ReleaseTLibAttr(TLIBATTR* pTLibAttr);
}
mixin DEFINE_GUID!(ITypeLib, "00020402-0000-0000-C000-000000000046");
alias ITypeLib LPTYPELIB;

export extern(Windows){
	HRESULT ITypeLib_RemoteGetTypeInfoCount_Proxy(ITypeLib This, UINT* pcTInfo);
	void ITypeLib_RemoteGetTypeInfoCount_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT ITypeLib_RemoteGetLibAttr_Proxy(ITypeLib This, LPTLIBATTR* ppTLibAttr, CLEANLOCALSTORAGE* pDummy);
	void ITypeLib_RemoteGetLibAttr_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT ITypeLib_RemoteGetDocumentation_Proxy(ITypeLib This, INT index, DWORD refPtrFlags, BSTR* pBstrName, BSTR* pBstrDocString, DWORD* pdwHelpContext, BSTR* pBstrHelpFile);
	void ITypeLib_RemoteGetDocumentation_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT ITypeLib_RemoteIsName_Proxy(ITypeLib This, LPOLESTR szNameBuf, ULONG lHashVal, BOOL* pfName, BSTR* pBstrLibName);
	void ITypeLib_RemoteIsName_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT ITypeLib_RemoteFindName_Proxy(ITypeLib This, LPOLESTR szNameBuf, ULONG lHashVal, ITypeInfo* ppTInfo, MEMBERID* rgMemId, USHORT* pcFound, BSTR* pBstrLibName);
	void ITypeLib_RemoteFindName_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT ITypeLib_LocalReleaseTLibAttr_Proxy(ITypeLib This);
	void ITypeLib_LocalReleaseTLibAttr_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_ITypeLib2;
interface ITypeLib2 : ITypeLib {
public extern(Windows):
	HRESULT GetCustData(REFGUID guid, VARIANT* pVarVal);
	HRESULT GetLibStatistics(ULONG* pcUniqueNames, ULONG* pcchUniqueNames);
	HRESULT GetDocumentation2(INT index, LCID lcid, BSTR* pbstrHelpString, DWORD* pdwHelpStringContext, BSTR* pbstrHelpStringDll);
	HRESULT GetAllCustData(CUSTDATA* pCustData);
}
mixin DEFINE_IID!(ITypeLib2, "00020411-0000-0000-C000-000000000046");
alias ITypeLib2 LPTYPELIB2;

export extern(Windows){
	HRESULT ITypeLib2_RemoteGetLibStatistics_Proxy(ITypeLib2 This, ULONG* pcUniqueNames, ULONG* pcchUniqueNames);
	void ITypeLib2_RemoteGetLibStatistics_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT ITypeLib2_RemoteGetDocumentation2_Proxy(ITypeLib2 This, INT index, LCID lcid, DWORD refPtrFlags, BSTR* pbstrHelpString, DWORD* pdwHelpStringContext, BSTR* pbstrHelpStringDll);
	void ITypeLib2_RemoteGetDocumentation2_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

enum {
	CHANGEKIND_ADDMEMBER        = 0,
	CHANGEKIND_DELETEMEMBER     = CHANGEKIND_ADDMEMBER + 1,
	CHANGEKIND_SETNAMES         = CHANGEKIND_DELETEMEMBER + 1,
	CHANGEKIND_SETDOCUMENTATION = CHANGEKIND_SETNAMES + 1,
	CHANGEKIND_GENERAL          = CHANGEKIND_SETDOCUMENTATION + 1,
	CHANGEKIND_INVALIDATE       = CHANGEKIND_GENERAL + 1,
	CHANGEKIND_CHANGEFAILED     = CHANGEKIND_INVALIDATE + 1,
	CHANGEKIND_MAX              = CHANGEKIND_CHANGEFAILED + 1
}
alias int CHANGEKIND;

//extern extern(C) const IID IID_ITypeChangeEvents;
interface ITypeChangeEvents : IUnknown {
public extern(Windows):
	HRESULT RequestTypeChange(CHANGEKIND changeKind, ITypeInfo pTInfoBefore, LPOLESTR pStrName, INT* pfCancel);
	HRESULT AfterTypeChange(CHANGEKIND changeKind, ITypeInfo pTInfoAfter, LPOLESTR pStrName);
}
mixin DEFINE_IID!(ITypeChangeEvents, "00020410-0000-0000-C000-000000000046");
alias ITypeChangeEvents LPTYPECHANGEEVENTS;

//extern extern(C) const IID IID_IErrorInfo;
interface IErrorInfo : IUnknown {
public extern(Windows):
	HRESULT GetGUID(GUID* pGUID);
	HRESULT GetSource(BSTR* pBstrSource);
	HRESULT GetDescription(BSTR* pBstrDescription);
	HRESULT GetHelpFile(BSTR* pBstrHelpFile);
	HRESULT GetHelpContext(DWORD* pdwHelpContext);
}
mixin DEFINE_IID!(IErrorInfo, "1CF2B120-547D-101B-8E65-08002B2BD119");
alias IErrorInfo LPERRORINFO;

//extern extern(C) const IID IID_ICreateErrorInfo;
interface ICreateErrorInfo : IUnknown {
public extern(Windows):
	HRESULT SetGUID(REFGUID rguid);
	HRESULT SetSource(LPOLESTR szSource);
	HRESULT SetDescription(LPOLESTR szDescription);
	HRESULT SetHelpFile(LPOLESTR szHelpFile);
	HRESULT SetHelpContext(DWORD dwHelpContext);
}
mixin DEFINE_IID!(ICreateErrorInfo, "22F03340-547D-101B-8E65-08002B2BD119");
alias ICreateErrorInfo LPCREATEERRORINFO;

//extern extern(C) const IID IID_ISupportErrorInfo;
interface ISupportErrorInfo : IUnknown {
public extern(Windows):
	HRESULT InterfaceSupportsErrorInfo(REFIID riid);
}
mixin DEFINE_IID!(ISupportErrorInfo, "DF0B3D60-548F-101B-8E65-08002B2BD119");
alias ISupportErrorInfo LPSUPPORTERRORINFO;

//extern extern(C) const IID IID_ITypeFactory;
interface ITypeFactory : IUnknown {
public extern(Windows):
	HRESULT CreateFromTypeInfo(ITypeInfo pTypeInfo, REFIID riid, IUnknown* ppv);
}
mixin DEFINE_IID!(ITypeFactory, "0000002E-0000-0000-C000-000000000046");

//extern extern(C) const IID IID_ITypeMarshal;
interface ITypeMarshal : IUnknown {
public extern(Windows):
	HRESULT Size(PVOID pvType, DWORD dwDestContext, PVOID pvDestContext, ULONG* pSize);
	HRESULT Marshal(PVOID pvType, DWORD dwDestContext, PVOID pvDestContext, ULONG cbBufferLength, BYTE* pBuffer, ULONG* pcbWritten);
	HRESULT Unmarshal(PVOID pvType, DWORD dwFlags, ULONG cbBufferLength, BYTE* pBuffer, ULONG* pcbRead);
	HRESULT Free(PVOID pvType);
}
mixin DEFINE_IID!(ITypeMarshal, "0000002D-0000-0000-C000-000000000046");

//extern extern(C) const IID IID_IRecordInfo;
interface IRecordInfo : IUnknown {
public extern(Windows):
	HRESULT RecordInit(PVOID pvNew);
	HRESULT RecordClear(PVOID pvExisting);
	HRESULT RecordCopy(PVOID pvExisting, PVOID pvNew);
	HRESULT GetGuid(GUID* pguid);
	HRESULT GetName(BSTR* pbstrName);
	HRESULT GetSize(ULONG* pcbSize);
	HRESULT GetTypeInfo(ITypeInfo* ppTypeInfo);
	HRESULT GetField(PVOID pvData, LPCOLESTR szFieldName, VARIANT* pvarField);
	HRESULT GetFieldNoCopy(PVOID pvData, LPCOLESTR szFieldName, VARIANT* pvarField, PVOID* ppvDataCArray);
	HRESULT PutField(ULONG wFlags, PVOID pvData, LPCOLESTR szFieldName, VARIANT* pvarField);
	HRESULT PutFieldNoCopy(ULONG wFlags, PVOID pvData, LPCOLESTR szFieldName, VARIANT* pvarField);
	HRESULT GetFieldNames(ULONG* pcNames, BSTR* rgBstrNames);
	BOOL IsMatchingType(IRecordInfo pRecordInfo);
	PVOID RecordCreate();
	HRESULT RecordCreateCopy(PVOID pvSource, PVOID* ppvDest);
	HRESULT RecordDestroy(PVOID pvRecord);
}
mixin DEFINE_IID!(IRecordInfo, "0000002F-0000-0000-C000-000000000046");
alias IRecordInfo LPRECORDINFO;

//extern extern(C) const IID IID_IErrorLog;
interface IErrorLog : IUnknown {
public extern(Windows):
	HRESULT AddError(LPCOLESTR pszPropName, EXCEPINFO* pExcepInfo);
}
mixin DEFINE_GUID!(IErrorLog, "3127CA40-446E-11CE-8135-00AA004BB851");
alias IErrorLog LPERRORLOG;

//extern extern(C) const IID IID_IPropertyBag;
interface IPropertyBag : IUnknown {
public extern(Windows):
	HRESULT Read(LPCOLESTR pszPropName, VARIANT* pVar, IErrorLog pErrorLog);
	HRESULT Write(LPCOLESTR pszPropName, VARIANT* pVar);
}
mixin DEFINE_IID!(IPropertyBag, "55272A00-42CB-11CE-8135-00AA004BB851");
alias IPropertyBag LPPROPERTYBAG;

export extern(Windows){
	HRESULT IPropertyBag_RemoteRead_Proxy(IPropertyBag This, LPCOLESTR pszPropName, VARIANT* pVar, IErrorLog pErrorLog, DWORD varType, IUnknown pUnkObj);
	void IPropertyBag_RemoteRead_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

export extern(Windows){
	ULONG BSTR_UserSize(ULONG*, ULONG, BSTR*);
	BYTE* BSTR_UserMarshal(ULONG*, BYTE*, BSTR*);
	BYTE* BSTR_UserUnmarshal(ULONG*, BYTE*, BSTR*);
	void BSTR_UserFree(ULONG*, BSTR*);

	ULONG CLEANLOCALSTORAGE_UserSize(ULONG*, ULONG, CLEANLOCALSTORAGE*);
	BYTE* CLEANLOCALSTORAGE_UserMarshal(ULONG*, BYTE*, CLEANLOCALSTORAGE*);
	BYTE* CLEANLOCALSTORAGE_UserUnmarshal(ULONG*, BYTE*, CLEANLOCALSTORAGE*);
	void CLEANLOCALSTORAGE_UserFree(ULONG*, CLEANLOCALSTORAGE*);

	ULONG VARIANT_UserSize(ULONG*, ULONG, VARIANT*);
	BYTE* VARIANT_UserMarshal(ULONG*, BYTE*, VARIANT*);
	BYTE* VARIANT_UserUnmarshal(ULONG*, BYTE*, VARIANT*);
	void VARIANT_UserFree(ULONG*, VARIANT*);

	ULONG BSTR_UserSize64(ULONG*, ULONG, BSTR*);
	BYTE* BSTR_UserMarshal64(ULONG*, BYTE*, BSTR*);
	BYTE* BSTR_UserUnmarshal64(ULONG*, BYTE*, BSTR*);
	void BSTR_UserFree64(ULONG*, BSTR*);

	ULONG CLEANLOCALSTORAGE_UserSize64(ULONG*, ULONG, CLEANLOCALSTORAGE*);
	BYTE* CLEANLOCALSTORAGE_UserMarshal64(ULONG*, BYTE*, CLEANLOCALSTORAGE*);
	BYTE* CLEANLOCALSTORAGE_UserUnmarshal64(ULONG*, BYTE*, CLEANLOCALSTORAGE*);
	void CLEANLOCALSTORAGE_UserFree64(ULONG*, CLEANLOCALSTORAGE*);

	ULONG VARIANT_UserSize64(ULONG*, ULONG, VARIANT*);
	BYTE* VARIANT_UserMarshal64(ULONG*, BYTE*, VARIANT*);
	BYTE* VARIANT_UserUnmarshal64(ULONG*, BYTE*, VARIANT*);
	void VARIANT_UserFree64(ULONG*, VARIANT*);
}

export extern(Windows){
	HRESULT IDispatch_Invoke_Proxy(IDispatch This, DISPID dispIdMember, REFIID riid, LCID lcid, WORD wFlags, DISPPARAMS* pDispParams, VARIANT* pVarResult, EXCEPINFO* pExcepInfo, UINT* puArgErr);
	HRESULT IDispatch_Invoke_Stub(IDispatch This, DISPID dispIdMember, REFIID riid, LCID lcid, DWORD dwFlags, DISPPARAMS* pDispParams, VARIANT* pVarResult, EXCEPINFO* pExcepInfo, UINT* pArgErr, UINT cVarRef, UINT* rgVarRefIdx, VARIANTARG* rgVarRef);
	HRESULT IEnumVARIANT_Next_Proxy(IEnumVARIANT This, ULONG celt, VARIANT* rgVar, ULONG* pCeltFetched);
	HRESULT IEnumVARIANT_Next_Stub(IEnumVARIANT This, ULONG celt, VARIANT* rgVar, ULONG* pCeltFetched);
	HRESULT ITypeComp_Bind_Proxy(ITypeComp This, LPOLESTR szName, ULONG lHashVal, WORD wFlags, ITypeInfo* ppTInfo, DESCKIND* pDescKind, BINDPTR* pBindPtr);
	HRESULT ITypeComp_Bind_Stub(ITypeComp This, LPOLESTR szName, ULONG lHashVal, WORD wFlags, ITypeInfo* ppTInfo, DESCKIND* pDescKind, LPFUNCDESC* ppFuncDesc, LPVARDESC* ppVarDesc, ITypeComp* ppTypeComp, CLEANLOCALSTORAGE* pDummy);
	HRESULT ITypeComp_BindType_Proxy(ITypeComp This, LPOLESTR szName, ULONG lHashVal, ITypeInfo* ppTInfo, ITypeComp* ppTComp);
	HRESULT ITypeComp_BindType_Stub(ITypeComp This, LPOLESTR szName, ULONG lHashVal, ITypeInfo* ppTInfo);
	HRESULT ITypeInfo_GetTypeAttr_Proxy(ITypeInfo This, TYPEATTR** ppTypeAttr);
	HRESULT ITypeInfo_GetTypeAttr_Stub(ITypeInfo This, LPTYPEATTR* ppTypeAttr, CLEANLOCALSTORAGE* pDummy);
	HRESULT ITypeInfo_GetFuncDesc_Proxy(ITypeInfo This, UINT index, FUNCDESC** ppFuncDesc);
	HRESULT ITypeInfo_GetFuncDesc_Stub(ITypeInfo This, UINT index, LPFUNCDESC* ppFuncDesc, CLEANLOCALSTORAGE* pDummy);
	HRESULT ITypeInfo_GetVarDesc_Proxy(ITypeInfo This, UINT index, VARDESC** ppVarDesc);
	HRESULT ITypeInfo_GetVarDesc_Stub(ITypeInfo This, UINT index, LPVARDESC* ppVarDesc, CLEANLOCALSTORAGE* pDummy);
	HRESULT ITypeInfo_GetNames_Proxy(ITypeInfo This, MEMBERID memid, BSTR* rgBstrNames, UINT cMaxNames, UINT* pcNames);
	HRESULT ITypeInfo_GetNames_Stub(ITypeInfo This, MEMBERID memid, BSTR* rgBstrNames, UINT cMaxNames, UINT* pcNames);
	HRESULT ITypeInfo_GetIDsOfNames_Proxy(ITypeInfo This, LPOLESTR* rgszNames, UINT cNames, MEMBERID* pMemId);
	HRESULT ITypeInfo_GetIDsOfNames_Stub(ITypeInfo This);
	HRESULT ITypeInfo_Invoke_Proxy(ITypeInfo This, PVOID pvInstance, MEMBERID memid, WORD wFlags, DISPPARAMS* pDispParams, VARIANT* pVarResult, EXCEPINFO* pExcepInfo, UINT* puArgErr);
	HRESULT ITypeInfo_Invoke_Stub(ITypeInfo This);
	HRESULT ITypeInfo_GetDocumentation_Proxy(ITypeInfo This, MEMBERID memid, BSTR* pBstrName, BSTR* pBstrDocString, DWORD* pdwHelpContext, BSTR* pBstrHelpFile);
	HRESULT ITypeInfo_GetDocumentation_Stub(ITypeInfo This, MEMBERID memid, DWORD refPtrFlags, BSTR* pBstrName, BSTR* pBstrDocString, DWORD* pdwHelpContext, BSTR* pBstrHelpFile);
	HRESULT ITypeInfo_GetDllEntry_Proxy(ITypeInfo This, MEMBERID memid, INVOKEKIND invKind, BSTR* pBstrDllName, BSTR* pBstrName, WORD* pwOrdinal);
	HRESULT ITypeInfo_GetDllEntry_Stub(ITypeInfo This, MEMBERID memid, INVOKEKIND invKind, DWORD refPtrFlags, BSTR* pBstrDllName, BSTR* pBstrName, WORD* pwOrdinal);
	HRESULT ITypeInfo_AddressOfMember_Proxy(ITypeInfo This, MEMBERID memid, INVOKEKIND invKind, PVOID* ppv);
	HRESULT ITypeInfo_AddressOfMember_Stub(ITypeInfo This);
	HRESULT ITypeInfo_CreateInstance_Proxy(ITypeInfo This, IUnknown pUnkOuter, REFIID riid, PVOID* ppvObj);
	HRESULT ITypeInfo_CreateInstance_Stub(ITypeInfo This, REFIID riid, IUnknown* ppvObj);
	HRESULT ITypeInfo_GetContainingTypeLib_Proxy(ITypeInfo This, ITypeLib* ppTLib, UINT* pIndex);
	HRESULT ITypeInfo_GetContainingTypeLib_Stub(ITypeInfo This, ITypeLib* ppTLib, UINT* pIndex);
	void ITypeInfo_ReleaseTypeAttr_Proxy(ITypeInfo This, TYPEATTR* pTypeAttr);
	HRESULT ITypeInfo_ReleaseTypeAttr_Stub(ITypeInfo This);
	void ITypeInfo_ReleaseFuncDesc_Proxy(ITypeInfo This, FUNCDESC* pFuncDesc);
	HRESULT ITypeInfo_ReleaseFuncDesc_Stub(ITypeInfo This);
	void ITypeInfo_ReleaseVarDesc_Proxy(ITypeInfo This, VARDESC* pVarDesc);
	HRESULT ITypeInfo_ReleaseVarDesc_Stub(ITypeInfo This);
	HRESULT ITypeInfo2_GetDocumentation2_Proxy(ITypeInfo2 This, MEMBERID memid, LCID lcid, BSTR* pbstrHelpString, DWORD* pdwHelpStringContext, BSTR* pbstrHelpStringDll);
	HRESULT ITypeInfo2_GetDocumentation2_Stub(ITypeInfo2 This, MEMBERID memid, LCID lcid, DWORD refPtrFlags, BSTR* pbstrHelpString, DWORD* pdwHelpStringContext, BSTR* pbstrHelpStringDll);
	UINT ITypeLib_GetTypeInfoCount_Proxy(ITypeLib This);
	HRESULT ITypeLib_GetTypeInfoCount_Stub(ITypeLib This, UINT* pcTInfo);
	HRESULT ITypeLib_GetLibAttr_Proxy(ITypeLib This, TLIBATTR** ppTLibAttr);
	HRESULT ITypeLib_GetLibAttr_Stub(ITypeLib This, LPTLIBATTR* ppTLibAttr, CLEANLOCALSTORAGE* pDummy);
	HRESULT ITypeLib_GetDocumentation_Proxy(ITypeLib This, INT index, BSTR* pBstrName, BSTR* pBstrDocString, DWORD* pdwHelpContext, BSTR* pBstrHelpFile);
	HRESULT ITypeLib_GetDocumentation_Stub(ITypeLib This, INT index, DWORD refPtrFlags, BSTR* pBstrName, BSTR* pBstrDocString, DWORD* pdwHelpContext, BSTR* pBstrHelpFile);
	HRESULT ITypeLib_IsName_Proxy(ITypeLib This, LPOLESTR szNameBuf, ULONG lHashVal, BOOL* pfName);
	HRESULT ITypeLib_IsName_Stub(ITypeLib This, LPOLESTR szNameBuf, ULONG lHashVal, BOOL* pfName, BSTR* pBstrLibName);
	HRESULT ITypeLib_FindName_Proxy(ITypeLib This, LPOLESTR szNameBuf, ULONG lHashVal, ITypeInfo* ppTInfo, MEMBERID* rgMemId, USHORT* pcFound);
	HRESULT ITypeLib_FindName_Stub(ITypeLib This, LPOLESTR szNameBuf, ULONG lHashVal, ITypeInfo* ppTInfo, MEMBERID* rgMemId, USHORT* pcFound, BSTR* pBstrLibName);
	void ITypeLib_ReleaseTLibAttr_Proxy(ITypeLib This, TLIBATTR* pTLibAttr);
	HRESULT ITypeLib_ReleaseTLibAttr_Stub(ITypeLib This);
	HRESULT ITypeLib2_GetLibStatistics_Proxy(ITypeLib2 This, ULONG* pcUniqueNames, ULONG* pcchUniqueNames);
	HRESULT ITypeLib2_GetLibStatistics_Stub(ITypeLib2 This, ULONG* pcUniqueNames, ULONG* pcchUniqueNames);
	HRESULT ITypeLib2_GetDocumentation2_Proxy(ITypeLib2 This, INT index, LCID lcid, BSTR* pbstrHelpString, DWORD* pdwHelpStringContext, BSTR* pbstrHelpStringDll);
	HRESULT ITypeLib2_GetDocumentation2_Stub(ITypeLib2 This, INT index, LCID lcid, DWORD refPtrFlags, BSTR* pbstrHelpString, DWORD* pdwHelpStringContext, BSTR* pbstrHelpStringDll);
	HRESULT IPropertyBag_Read_Proxy(IPropertyBag This, LPCOLESTR pszPropName, VARIANT* pVar, IErrorLog pErrorLog);
	HRESULT IPropertyBag_Read_Stub(IPropertyBag This, LPCOLESTR pszPropName, VARIANT* pVar, IErrorLog pErrorLog, DWORD varType, IUnknown pUnkObj);
}

} // extern(C)
