/** oleauto.d

Converted from 'oleauto.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.oleauto;


import c.windows.sdkddkver;
import c.windows.windef;
import c.windows.wtypes;
import c.windows.guiddef;
import c.windows.unknwn;
import c.windows.oaidl;
import c.windows.winbase;


align(8){

extern extern(C) const IID IID_StdOle;

enum {
	STDOLE_MAJORVERNUM  = 0x1,
	STDOLE_MINORVERNUM  = 0x0,
	STDOLE_LCID         = 0x0000,
	STDOLE2_MAJORVERNUM = 0x2,
	STDOLE2_MINORVERNUM = 0x0,
	STDOLE2_LCID        = 0x0000,
}

alias DWORD LCID;

export extern(Windows) BSTR SysAllocString(const(OLECHAR)* psz);
export extern(Windows) INT SysReAllocString(BSTR* pbstr, const(OLECHAR)* psz);
export extern(Windows) BSTR SysAllocStringLen(const(OLECHAR)* strIn, UINT ui);
export extern(Windows) INT SysReAllocStringLen(BSTR* pbstr, const(OLECHAR)* psz, uint len);
export extern(Windows) void SysFreeString(BSTR bstrString);
export extern(Windows) UINT SysStringLen(BSTR);

export extern(Windows) UINT SysStringByteLen(BSTR bstr);
export extern(Windows) BSTR SysAllocStringByteLen(LPCSTR psz, UINT len);
export extern(Windows) INT DosDateTimeToVariantTime(USHORT wDosDate, USHORT wDosTime, DOUBLE* pvtime);
export extern(Windows) INT VariantTimeToDosDateTime(DOUBLE vtime, USHORT* pwDosDate, USHORT* pwDosTime);
export extern(Windows) INT SystemTimeToVariantTime(LPSYSTEMTIME lpSystemTime, DOUBLE* pvtime);
export extern(Windows) INT VariantTimeToSystemTime(DOUBLE vtime, LPSYSTEMTIME lpSystemTime);

export extern(Windows) HRESULT SafeArrayAllocDescriptor(UINT cDims, SAFEARRAY** ppsaOut);
export extern(Windows) HRESULT SafeArrayAllocDescriptorEx(VARTYPE vt, UINT cDims, SAFEARRAY** ppsaOut);
export extern(Windows) HRESULT SafeArrayAllocData(SAFEARRAY* psa);
export extern(Windows) SAFEARRAY* SafeArrayCreate(VARTYPE vt, UINT cDims, SAFEARRAYBOUND* rgsabound);
export extern(Windows) SAFEARRAY* SafeArrayCreateEx(VARTYPE vt, UINT cDims, SAFEARRAYBOUND* rgsabound, PVOID pvExtra);
export extern(Windows) HRESULT SafeArrayCopyData(SAFEARRAY* psaSource, SAFEARRAY* psaTarget);
export extern(Windows) HRESULT SafeArrayDestroyDescriptor(SAFEARRAY* psa);
export extern(Windows) HRESULT SafeArrayDestroyData(SAFEARRAY* psa);
export extern(Windows) HRESULT SafeArrayDestroy(SAFEARRAY* psa);
export extern(Windows) HRESULT SafeArrayRedim(SAFEARRAY* psa, SAFEARRAYBOUND* psaboundNew);
export extern(Windows) UINT SafeArrayGetDim(SAFEARRAY* psa);
export extern(Windows) UINT SafeArrayGetElemsize(SAFEARRAY* psa);
export extern(Windows) HRESULT SafeArrayGetUBound(SAFEARRAY* psa, UINT nDim, LONG* plUbound);
export extern(Windows) HRESULT SafeArrayGetLBound(SAFEARRAY* psa, UINT nDim, LONG* plLbound);
export extern(Windows) HRESULT SafeArrayLock(SAFEARRAY* psa);
export extern(Windows) HRESULT SafeArrayUnlock(SAFEARRAY* psa);
export extern(Windows) HRESULT SafeArrayAccessData(SAFEARRAY* psa, void** ppvData);
export extern(Windows) HRESULT SafeArrayUnaccessData(SAFEARRAY* psa);
export extern(Windows) HRESULT SafeArrayGetElement(SAFEARRAY* psa, LONG* rgIndices, void* pv);
export extern(Windows) HRESULT SafeArrayPutElement(SAFEARRAY* psa, LONG* rgIndices, void* pv);
export extern(Windows) HRESULT SafeArrayCopy(SAFEARRAY* psa, SAFEARRAY** ppsaOut);
export extern(Windows) HRESULT SafeArrayPtrOfIndex(SAFEARRAY* psa, LONG* rgIndices, void** ppvData);
export extern(Windows) HRESULT SafeArraySetRecordInfo(SAFEARRAY* psa, IRecordInfo prinfo);
export extern(Windows) HRESULT SafeArrayGetRecordInfo(SAFEARRAY* psa, IRecordInfo* prinfo);
export extern(Windows) HRESULT SafeArraySetIID(SAFEARRAY* psa, REFGUID guid);
export extern(Windows) HRESULT SafeArrayGetIID(SAFEARRAY* psa, GUID* pguid);
export extern(Windows) HRESULT SafeArrayGetVartype(SAFEARRAY* psa, VARTYPE* pvt);
export extern(Windows) SAFEARRAY* SafeArrayCreateVector(VARTYPE vt, LONG lLbound, ULONG cElements);
export extern(Windows) SAFEARRAY* SafeArrayCreateVectorEx(VARTYPE vt, LONG lLbound, ULONG cElements, PVOID pvExtra);

export extern(Windows) void VariantInit(VARIANTARG * pvarg);
export extern(Windows) HRESULT VariantClear(VARIANTARG* pvarg);
export extern(Windows) HRESULT VariantCopy(VARIANTARG* pvargDest, const(VARIANTARG)* pvargSrc);
export extern(Windows) HRESULT VariantCopyInd(VARIANT* pvarDest, const(VARIANTARG)* pvargSrc);
export extern(Windows) HRESULT VariantChangeType(VARIANTARG* pvargDest, const(VARIANTARG)* pvarSrc, USHORT wFlags, VARTYPE vt);
export extern(Windows) HRESULT VariantChangeTypeEx(VARIANTARG* pvargDest, const(VARIANTARG)* pvarSrc, LCID lcid, USHORT wFlags, VARTYPE vt);

enum {
	VARIANT_NOVALUEPROP        = 0x01,
	VARIANT_ALPHABOOL          = 0x02,
	VARIANT_NOUSEROVERRIDE     = 0x04,
	VARIANT_CALENDAR_HIJRI     = 0x08,
	VARIANT_LOCALBOOL          = 0x10,
	VARIANT_CALENDAR_THAI      = 0x20,
	VARIANT_CALENDAR_GREGORIAN = 0x40,
	VARIANT_USE_NLS            = 0x80
}

export extern(Windows) HRESULT VectorFromBstr(BSTR bstr, SAFEARRAY** ppsa);
export extern(Windows) HRESULT BstrFromVector(SAFEARRAY* psa, BSTR* pbstr);

enum {
	VAR_TIMEVALUEONLY       = cast(DWORD)0x00000001,
	VAR_DATEVALUEONLY       = cast(DWORD)0x00000002,
	VAR_VALIDDATE           = cast(DWORD)0x00000004,
	VAR_CALENDAR_HIJRI      = cast(DWORD)0x00000008,
	VAR_LOCALBOOL           = cast(DWORD)0x00000010,
	VAR_FORMAT_NOSUBSTITUTE = cast(DWORD)0x00000020,
	VAR_FOURDIGITYEARS      = cast(DWORD)0x00000040,
	LOCALE_USE_NLS          = 0x10000000,
	VAR_CALENDAR_THAI       = cast(DWORD)0x00000080,
	VAR_CALENDAR_GREGORIAN  = cast(DWORD)0x00000100,
	VTDATEGRE_MAX           = 2958465,
	VTDATEGRE_MIN           = -657434,
}

export extern(Windows) HRESULT VarUI1FromI2(SHORT sIn, BYTE* pbOut);
export extern(Windows) HRESULT VarUI1FromI4(LONG lIn, BYTE* pbOut);
export extern(Windows) HRESULT VarUI1FromI8(LONG64 i64In, BYTE* pbOut);
export extern(Windows) HRESULT VarUI1FromR4(FLOAT fltIn, BYTE* pbOut);
export extern(Windows) HRESULT VarUI1FromR8(DOUBLE dblIn, BYTE* pbOut);
export extern(Windows) HRESULT VarUI1FromCy(CY cyIn, BYTE* pbOut);
export extern(Windows) HRESULT VarUI1FromDate(DATE dateIn, BYTE* pbOut);
export extern(Windows) HRESULT VarUI1FromStr(LPCOLESTR strIn, LCID lcid, ULONG dwFlags, BYTE* pbOut);
export extern(Windows) HRESULT VarUI1FromDisp(IDispatch pdispIn, LCID lcid, BYTE* pbOut);
export extern(Windows) HRESULT VarUI1FromBool(VARIANT_BOOL boolIn, BYTE* pbOut);
export extern(Windows) HRESULT VarUI1FromI1(CHAR cIn, BYTE* pbOut);
export extern(Windows) HRESULT VarUI1FromUI2(USHORT uiIn, BYTE* pbOut);
export extern(Windows) HRESULT VarUI1FromUI4(ULONG ulIn, BYTE* pbOut);
export extern(Windows) HRESULT VarUI1FromUI8(ULONG64 ui64In, BYTE* pbOut);
export extern(Windows) HRESULT VarUI1FromDec(const(DECIMAL)* pdecIn, BYTE* pbOut);

export extern(Windows) HRESULT VarI2FromUI1(BYTE bIn, SHORT* psOut);
export extern(Windows) HRESULT VarI2FromI4(LONG lIn, SHORT* psOut);
export extern(Windows) HRESULT VarI2FromI8(LONG64 i64In, SHORT* psOut);
export extern(Windows) HRESULT VarI2FromR4(FLOAT fltIn, SHORT* psOut);
export extern(Windows) HRESULT VarI2FromR8(DOUBLE dblIn, SHORT* psOut);
export extern(Windows) HRESULT VarI2FromCy(CY cyIn, SHORT* psOut);
export extern(Windows) HRESULT VarI2FromDate(DATE dateIn, SHORT* psOut);
export extern(Windows) HRESULT VarI2FromStr(LPCOLESTR strIn, LCID lcid, ULONG dwFlags, SHORT* psOut);
export extern(Windows) HRESULT VarI2FromDisp(IDispatch pdispIn, LCID lcid, SHORT* psOut);
export extern(Windows) HRESULT VarI2FromBool(VARIANT_BOOL boolIn, SHORT* psOut);
export extern(Windows) HRESULT VarI2FromI1(CHAR cIn, SHORT* psOut);
export extern(Windows) HRESULT VarI2FromUI2(USHORT uiIn, SHORT* psOut);
export extern(Windows) HRESULT VarI2FromUI4(ULONG ulIn, SHORT* psOut);
export extern(Windows) HRESULT VarI2FromUI8(ULONG64 ui64In, SHORT* psOut);
export extern(Windows) HRESULT VarI2FromDec(const(DECIMAL)* pdecIn, SHORT* psOut);

export extern(Windows) HRESULT VarI4FromUI1(BYTE bIn, LONG* plOut);
export extern(Windows) HRESULT VarI4FromI2(SHORT sIn, LONG* plOut);
export extern(Windows) HRESULT VarI4FromI8(LONG64 i64In, LONG* plOut);
export extern(Windows) HRESULT VarI4FromR4(FLOAT fltIn, LONG* plOut);
export extern(Windows) HRESULT VarI4FromR8(DOUBLE dblIn, LONG* plOut);
export extern(Windows) HRESULT VarI4FromCy(CY cyIn, LONG* plOut);
export extern(Windows) HRESULT VarI4FromDate(DATE dateIn, LONG* plOut);
export extern(Windows) HRESULT VarI4FromStr(LPCOLESTR strIn, LCID lcid, ULONG dwFlags, LONG* plOut);
export extern(Windows) HRESULT VarI4FromDisp(IDispatch pdispIn, LCID lcid, LONG* plOut);
export extern(Windows) HRESULT VarI4FromBool(VARIANT_BOOL boolIn, LONG* plOut);
export extern(Windows) HRESULT VarI4FromI1(CHAR cIn, LONG* plOut);
export extern(Windows) HRESULT VarI4FromUI2(USHORT uiIn, LONG* plOut);
export extern(Windows) HRESULT VarI4FromUI4(ULONG ulIn, LONG* plOut);
export extern(Windows) HRESULT VarI4FromUI8(ULONG64 ui64In, LONG* plOut);
export extern(Windows) HRESULT VarI4FromDec(const(DECIMAL)* pdecIn, LONG* plOut);
export extern(Windows) HRESULT VarI4FromInt(INT intIn, LONG* plOut);

export extern(Windows) HRESULT VarI8FromUI1(BYTE bIn, LONG64* pi64Out);
export extern(Windows) HRESULT VarI8FromI2(SHORT sIn, LONG64* pi64Out);
export extern(Windows) HRESULT VarI8FromI4(LONG lIn, LONG64 * pi64Out);
export extern(Windows) HRESULT VarI8FromR4(FLOAT fltIn, LONG64* pi64Out);
export extern(Windows) HRESULT VarI8FromR8(DOUBLE dblIn, LONG64* pi64Out);
export extern(Windows) HRESULT VarI8FromCy(CY cyIn, LONG64* pi64Out);
export extern(Windows) HRESULT VarI8FromDate(DATE dateIn, LONG64* pi64Out);
export extern(Windows) HRESULT VarI8FromStr(LPCOLESTR strIn, LCID lcid, uint dwFlags, LONG64* pi64Out);
export extern(Windows) HRESULT VarI8FromDisp(IDispatch pdispIn, LCID lcid, LONG64* pi64Out);
export extern(Windows) HRESULT VarI8FromBool(VARIANT_BOOL boolIn, LONG64* pi64Out);
export extern(Windows) HRESULT VarI8FromI1(CHAR cIn, LONG64* pi64Out);
export extern(Windows) HRESULT VarI8FromUI2(USHORT uiIn, LONG64* pi64Out);
export extern(Windows) HRESULT VarI8FromUI4(ULONG ulIn, LONG64* pi64Out);
export extern(Windows) HRESULT VarI8FromUI8(ULONG64 ui64In, LONG64 * pi64Out);
export extern(Windows) HRESULT VarI8FromDec(const(DECIMAL)* pdecIn, LONG64* pi64Out);
export extern(Windows) HRESULT VarI8FromInt(INT intIn, LONG64* pi64Out);

export extern(Windows) HRESULT VarR4FromUI1(BYTE bIn, FLOAT* pfltOut);
export extern(Windows) HRESULT VarR4FromI2(SHORT sIn, FLOAT* pfltOut);
export extern(Windows) HRESULT VarR4FromI4(LONG lIn, FLOAT* pfltOut);
export extern(Windows) HRESULT VarR4FromI8(LONG64 i64In, FLOAT* pfltOut);
export extern(Windows) HRESULT VarR4FromR8(DOUBLE dblIn, FLOAT* pfltOut);
export extern(Windows) HRESULT VarR4FromCy(CY cyIn, FLOAT* pfltOut);
export extern(Windows) HRESULT VarR4FromDate(DATE dateIn, FLOAT* pfltOut);
export extern(Windows) HRESULT VarR4FromStr(LPCOLESTR strIn, LCID lcid, ULONG dwFlags, FLOAT* pfltOut);
export extern(Windows) HRESULT VarR4FromDisp(IDispatch pdispIn, LCID lcid, FLOAT* pfltOut);
export extern(Windows) HRESULT VarR4FromBool(VARIANT_BOOL boolIn, FLOAT* pfltOut);
export extern(Windows) HRESULT VarR4FromI1(CHAR cIn, FLOAT* pfltOut);
export extern(Windows) HRESULT VarR4FromUI2(USHORT uiIn, FLOAT* pfltOut);
export extern(Windows) HRESULT VarR4FromUI4(ULONG ulIn, FLOAT* pfltOut);
export extern(Windows) HRESULT VarR4FromUI8(ULONG64 ui64In, FLOAT* pfltOut);
export extern(Windows) HRESULT VarR4FromDec(const(DECIMAL)* pdecIn, FLOAT* pfltOut);

export extern(Windows) HRESULT VarR8FromUI1(BYTE bIn, DOUBLE* pdblOut);
export extern(Windows) HRESULT VarR8FromI2(SHORT sIn, DOUBLE* pdblOut);
export extern(Windows) HRESULT VarR8FromI4(LONG lIn, DOUBLE* pdblOut);
export extern(Windows) HRESULT VarR8FromI8(LONG64 i64In, DOUBLE* pdblOut);
export extern(Windows) HRESULT VarR8FromR4(FLOAT fltIn, DOUBLE* pdblOut);
export extern(Windows) HRESULT VarR8FromCy(CY cyIn, DOUBLE* pdblOut);
export extern(Windows) HRESULT VarR8FromDate(DATE dateIn, DOUBLE* pdblOut);
export extern(Windows) HRESULT VarR8FromStr(LPCOLESTR strIn, LCID lcid, ULONG dwFlags, DOUBLE* pdblOut);
export extern(Windows) HRESULT VarR8FromDisp(IDispatch pdispIn, LCID lcid, DOUBLE* pdblOut);
export extern(Windows) HRESULT VarR8FromBool(VARIANT_BOOL boolIn, DOUBLE* pdblOut);
export extern(Windows) HRESULT VarR8FromI1(CHAR cIn, DOUBLE* pdblOut);
export extern(Windows) HRESULT VarR8FromUI2(USHORT uiIn, DOUBLE* pdblOut);
export extern(Windows) HRESULT VarR8FromUI4(ULONG ulIn, DOUBLE* pdblOut);
export extern(Windows) HRESULT VarR8FromUI8(ULONG64 ui64In, DOUBLE* pdblOut);
export extern(Windows) HRESULT VarR8FromDec(const(DECIMAL)* pdecIn, DOUBLE* pdblOut);

export extern(Windows) HRESULT VarDateFromUI1(BYTE bIn, DATE* pdateOut);
export extern(Windows) HRESULT VarDateFromI2(SHORT sIn, DATE* pdateOut);
export extern(Windows) HRESULT VarDateFromI4(LONG lIn, DATE* pdateOut);
export extern(Windows) HRESULT VarDateFromI8(LONG64 i64In, DATE* pdateOut);
export extern(Windows) HRESULT VarDateFromR4(FLOAT fltIn, DATE* pdateOut);
export extern(Windows) HRESULT VarDateFromR8(DOUBLE dblIn, DATE* pdateOut);
export extern(Windows) HRESULT VarDateFromCy(CY cyIn, DATE* pdateOut);
export extern(Windows) HRESULT VarDateFromStr(LPCOLESTR strIn, LCID lcid, ULONG dwFlags, DATE* pdateOut);
export extern(Windows) HRESULT VarDateFromDisp(IDispatch pdispIn, LCID lcid, DATE* pdateOut);
export extern(Windows) HRESULT VarDateFromBool(VARIANT_BOOL boolIn, DATE* pdateOut);
export extern(Windows) HRESULT VarDateFromI1(CHAR cIn, DATE* pdateOut);
export extern(Windows) HRESULT VarDateFromUI2(USHORT uiIn, DATE* pdateOut);
export extern(Windows) HRESULT VarDateFromUI4(ULONG ulIn, DATE* pdateOut);
export extern(Windows) HRESULT VarDateFromUI8(ULONG64 ui64In, DATE* pdateOut);
export extern(Windows) HRESULT VarDateFromDec(const(DECIMAL)* pdecIn, DATE* pdateOut);

export extern(Windows) HRESULT VarCyFromUI1(BYTE bIn, CY* pcyOut);
export extern(Windows) HRESULT VarCyFromI2(SHORT sIn, CY* pcyOut);
export extern(Windows) HRESULT VarCyFromI4(LONG lIn, CY* pcyOut);
export extern(Windows) HRESULT VarCyFromI8(LONG64 i64In, CY* pcyOut);
export extern(Windows) HRESULT VarCyFromR4(FLOAT fltIn, CY* pcyOut);
export extern(Windows) HRESULT VarCyFromR8(DOUBLE dblIn, CY* pcyOut);
export extern(Windows) HRESULT VarCyFromDate(DATE dateIn, CY* pcyOut);
export extern(Windows) HRESULT VarCyFromStr(LPCOLESTR strIn, LCID lcid, ULONG dwFlags, CY* pcyOut);
export extern(Windows) HRESULT VarCyFromDisp(IDispatch pdispIn, LCID lcid, CY* pcyOut);
export extern(Windows) HRESULT VarCyFromBool(VARIANT_BOOL boolIn, CY* pcyOut);
export extern(Windows) HRESULT VarCyFromI1(CHAR cIn, CY* pcyOut);
export extern(Windows) HRESULT VarCyFromUI2(USHORT uiIn, CY* pcyOut);
export extern(Windows) HRESULT VarCyFromUI4(ULONG ulIn, CY* pcyOut);
export extern(Windows) HRESULT VarCyFromUI8(ULONG64 ui64In, CY* pcyOut);
export extern(Windows) HRESULT VarCyFromDec(const(DECIMAL)* pdecIn, CY* pcyOut);

export extern(Windows) HRESULT VarBstrFromUI1(BYTE bVal, LCID lcid, ULONG dwFlags, BSTR* pbstrOut);
export extern(Windows) HRESULT VarBstrFromI2(SHORT iVal, LCID lcid, ULONG dwFlags, BSTR* pbstrOut);
export extern(Windows) HRESULT VarBstrFromI4(LONG lIn, LCID lcid, ULONG dwFlags, BSTR* pbstrOut);
export extern(Windows) HRESULT VarBstrFromI8(LONG64 i64In, LCID lcid, uint dwFlags, BSTR* pbstrOut);
export extern(Windows) HRESULT VarBstrFromR4(FLOAT fltIn, LCID lcid, ULONG dwFlags, BSTR* pbstrOut);
export extern(Windows) HRESULT VarBstrFromR8(DOUBLE dblIn, LCID lcid, ULONG dwFlags, BSTR* pbstrOut);
export extern(Windows) HRESULT VarBstrFromCy(CY cyIn, LCID lcid, ULONG dwFlags, BSTR* pbstrOut);
export extern(Windows) HRESULT VarBstrFromDate(DATE dateIn, LCID lcid, ULONG dwFlags, BSTR* pbstrOut);
export extern(Windows) HRESULT VarBstrFromDisp(IDispatch pdispIn, LCID lcid, ULONG dwFlags, BSTR* pbstrOut);
export extern(Windows) HRESULT VarBstrFromBool(VARIANT_BOOL boolIn, LCID lcid, ULONG dwFlags, BSTR* pbstrOut);
export extern(Windows) HRESULT VarBstrFromI1(CHAR cIn, LCID lcid, ULONG dwFlags, BSTR* pbstrOut);
export extern(Windows) HRESULT VarBstrFromUI2(USHORT uiIn, LCID lcid, ULONG dwFlags, BSTR* pbstrOut);
export extern(Windows) HRESULT VarBstrFromUI4(ULONG ulIn, LCID lcid, ULONG dwFlags, BSTR* pbstrOut);
export extern(Windows) HRESULT VarBstrFromUI8(ULONG64 ui64In, LCID lcid, uint dwFlags, BSTR* pbstrOut);
export extern(Windows) HRESULT VarBstrFromDec(const(DECIMAL)* pdecIn, LCID lcid, ULONG dwFlags, BSTR* pbstrOut);

export extern(Windows) HRESULT VarBoolFromUI1(BYTE bIn, VARIANT_BOOL* pboolOut);
export extern(Windows) HRESULT VarBoolFromI2(SHORT sIn, VARIANT_BOOL* pboolOut);
export extern(Windows) HRESULT VarBoolFromI4(LONG lIn, VARIANT_BOOL* pboolOut);
export extern(Windows) HRESULT VarBoolFromI8(LONG64 i64In, VARIANT_BOOL* pboolOut);
export extern(Windows) HRESULT VarBoolFromR4(FLOAT fltIn, VARIANT_BOOL* pboolOut);
export extern(Windows) HRESULT VarBoolFromR8(DOUBLE dblIn, VARIANT_BOOL* pboolOut);
export extern(Windows) HRESULT VarBoolFromDate(DATE dateIn, VARIANT_BOOL* pboolOut);
export extern(Windows) HRESULT VarBoolFromCy(CY cyIn, VARIANT_BOOL* pboolOut);
export extern(Windows) HRESULT VarBoolFromStr(LPCOLESTR strIn, LCID lcid, ULONG dwFlags, VARIANT_BOOL* pboolOut);
export extern(Windows) HRESULT VarBoolFromDisp(IDispatch pdispIn, LCID lcid, VARIANT_BOOL* pboolOut);
export extern(Windows) HRESULT VarBoolFromI1(CHAR cIn, VARIANT_BOOL* pboolOut);
export extern(Windows) HRESULT VarBoolFromUI2(USHORT uiIn, VARIANT_BOOL* pboolOut);
export extern(Windows) HRESULT VarBoolFromUI4(ULONG ulIn, VARIANT_BOOL* pboolOut);
export extern(Windows) HRESULT VarBoolFromUI8(ULONG64 i64In, VARIANT_BOOL* pboolOut);
export extern(Windows) HRESULT VarBoolFromDec(const(DECIMAL)* pdecIn, VARIANT_BOOL* pboolOut);

export extern(Windows) HRESULT VarI1FromUI1(BYTE bIn, CHAR* pcOut);
export extern(Windows) HRESULT VarI1FromI2(SHORT uiIn, CHAR* pcOut);
export extern(Windows) HRESULT VarI1FromI4(LONG lIn, CHAR* pcOut);
export extern(Windows) HRESULT VarI1FromI8(LONG64 i64In, CHAR* pcOut);
export extern(Windows) HRESULT VarI1FromR4(FLOAT fltIn, CHAR* pcOut);
export extern(Windows) HRESULT VarI1FromR8(DOUBLE dblIn, CHAR* pcOut);
export extern(Windows) HRESULT VarI1FromDate(DATE dateIn, CHAR* pcOut);
export extern(Windows) HRESULT VarI1FromCy(CY cyIn, CHAR* pcOut);
export extern(Windows) HRESULT VarI1FromStr(LPCOLESTR strIn, LCID lcid, ULONG dwFlags, CHAR* pcOut);
export extern(Windows) HRESULT VarI1FromDisp(IDispatch pdispIn, LCID lcid, CHAR* pcOut);
export extern(Windows) HRESULT VarI1FromBool(VARIANT_BOOL boolIn, CHAR* pcOut);
export extern(Windows) HRESULT VarI1FromUI2(USHORT uiIn, CHAR* pcOut);
export extern(Windows) HRESULT VarI1FromUI4(ULONG ulIn, CHAR* pcOut);
export extern(Windows) HRESULT VarI1FromUI8(ULONG64 i64In, CHAR* pcOut);
export extern(Windows) HRESULT VarI1FromDec(const(DECIMAL)* pdecIn, CHAR* pcOut);

export extern(Windows) HRESULT VarUI2FromUI1(BYTE bIn, USHORT* puiOut);
export extern(Windows) HRESULT VarUI2FromI2(SHORT uiIn, USHORT* puiOut);
export extern(Windows) HRESULT VarUI2FromI4(LONG lIn, USHORT* puiOut);
export extern(Windows) HRESULT VarUI2FromI8(LONG64 i64In, USHORT* puiOut);
export extern(Windows) HRESULT VarUI2FromR4(FLOAT fltIn, USHORT* puiOut);
export extern(Windows) HRESULT VarUI2FromR8(DOUBLE dblIn, USHORT* puiOut);
export extern(Windows) HRESULT VarUI2FromDate(DATE dateIn, USHORT* puiOut);
export extern(Windows) HRESULT VarUI2FromCy(CY cyIn, USHORT* puiOut);
export extern(Windows) HRESULT VarUI2FromStr(LPCOLESTR strIn, LCID lcid, ULONG dwFlags, USHORT* puiOut);
export extern(Windows) HRESULT VarUI2FromDisp(IDispatch pdispIn, LCID lcid, USHORT* puiOut);
export extern(Windows) HRESULT VarUI2FromBool(VARIANT_BOOL boolIn, USHORT* puiOut);
export extern(Windows) HRESULT VarUI2FromI1(CHAR cIn, USHORT* puiOut);
export extern(Windows) HRESULT VarUI2FromUI4(ULONG ulIn, USHORT* puiOut);
export extern(Windows) HRESULT VarUI2FromUI8(ULONG64 i64In, USHORT* puiOut);
export extern(Windows) HRESULT VarUI2FromDec(const(DECIMAL)* pdecIn, USHORT* puiOut);

export extern(Windows) HRESULT VarUI4FromUI1(BYTE bIn, ULONG* pulOut);
export extern(Windows) HRESULT VarUI4FromI2(SHORT uiIn, ULONG* pulOut);
export extern(Windows) HRESULT VarUI4FromI4(LONG lIn, ULONG* pulOut);
export extern(Windows) HRESULT VarUI4FromI8(LONG64 i64In, ULONG* plOut);
export extern(Windows) HRESULT VarUI4FromR4(FLOAT fltIn, ULONG* pulOut);
export extern(Windows) HRESULT VarUI4FromR8(DOUBLE dblIn, ULONG* pulOut);
export extern(Windows) HRESULT VarUI4FromDate(DATE dateIn, ULONG* pulOut);
export extern(Windows) HRESULT VarUI4FromCy(CY cyIn, ULONG* pulOut);
export extern(Windows) HRESULT VarUI4FromStr(LPCOLESTR strIn, LCID lcid, ULONG dwFlags, ULONG* pulOut);
export extern(Windows) HRESULT VarUI4FromDisp(IDispatch pdispIn, LCID lcid, ULONG* pulOut);
export extern(Windows) HRESULT VarUI4FromBool(VARIANT_BOOL boolIn, ULONG* pulOut);
export extern(Windows) HRESULT VarUI4FromI1(CHAR cIn, ULONG* pulOut);
export extern(Windows) HRESULT VarUI4FromUI2(USHORT uiIn, ULONG* pulOut);
export extern(Windows) HRESULT VarUI4FromUI8(ULONG64 ui64In, ULONG* plOut);
export extern(Windows) HRESULT VarUI4FromDec(const(DECIMAL)* pdecIn, ULONG* pulOut);

export extern(Windows) HRESULT VarUI8FromUI1(BYTE bIn, ULONG64* pi64Out);
export extern(Windows) HRESULT VarUI8FromI2(SHORT sIn, ULONG64* pi64Out);
export extern(Windows) HRESULT VarUI8FromI4(LONG lIn, ULONG64* pi64Out);
export extern(Windows) HRESULT VarUI8FromI8(LONG64 ui64In, ULONG64* pi64Out);
export extern(Windows) HRESULT VarUI8FromR4(FLOAT fltIn, ULONG64* pi64Out);
export extern(Windows) HRESULT VarUI8FromR8(DOUBLE dblIn, ULONG64* pi64Out);
export extern(Windows) HRESULT VarUI8FromCy(CY cyIn, ULONG64* pi64Out);
export extern(Windows) HRESULT VarUI8FromDate(DATE dateIn, ULONG64* pi64Out);
export extern(Windows) HRESULT VarUI8FromStr(LPCOLESTR strIn, LCID lcid, uint dwFlags, ULONG64* pi64Out);
export extern(Windows) HRESULT VarUI8FromDisp(IDispatch pdispIn, LCID lcid, ULONG64* pi64Out);
export extern(Windows) HRESULT VarUI8FromBool(VARIANT_BOOL boolIn, ULONG64* pi64Out);
export extern(Windows) HRESULT VarUI8FromI1(CHAR cIn, ULONG64* pi64Out);
export extern(Windows) HRESULT VarUI8FromUI2(USHORT uiIn, ULONG64* pi64Out);
export extern(Windows) HRESULT VarUI8FromUI4(ULONG ulIn, ULONG64* pi64Out);
export extern(Windows) HRESULT VarUI8FromDec(const(DECIMAL)* pdecIn, ULONG64* pi64Out);
export extern(Windows) HRESULT VarUI8FromInt(INT intIn, ULONG64* pi64Out);

export extern(Windows) HRESULT VarDecFromUI1(BYTE bIn, DECIMAL* pdecOut);
export extern(Windows) HRESULT VarDecFromI2(SHORT uiIn, DECIMAL* pdecOut);
export extern(Windows) HRESULT VarDecFromI4(LONG lIn, DECIMAL* pdecOut);
export extern(Windows) HRESULT VarDecFromI8(LONG64 i64In, DECIMAL* pdecOut);
export extern(Windows) HRESULT VarDecFromR4(FLOAT fltIn, DECIMAL* pdecOut);
export extern(Windows) HRESULT VarDecFromR8(DOUBLE dblIn, DECIMAL* pdecOut);
export extern(Windows) HRESULT VarDecFromDate(DATE dateIn, DECIMAL* pdecOut);
export extern(Windows) HRESULT VarDecFromCy(CY cyIn, DECIMAL* pdecOut);
export extern(Windows) HRESULT VarDecFromStr(LPCOLESTR strIn, LCID lcid, ULONG dwFlags, DECIMAL* pdecOut);
export extern(Windows) HRESULT VarDecFromDisp(IDispatch pdispIn, LCID lcid, DECIMAL* pdecOut);
export extern(Windows) HRESULT VarDecFromBool(VARIANT_BOOL boolIn, DECIMAL* pdecOut);
export extern(Windows) HRESULT VarDecFromI1(CHAR cIn, DECIMAL* pdecOut);
export extern(Windows) HRESULT VarDecFromUI2(USHORT uiIn, DECIMAL* pdecOut);
export extern(Windows) HRESULT VarDecFromUI4(ULONG ulIn, DECIMAL* pdecOut);
export extern(Windows) HRESULT VarDecFromUI8(ULONG64 ui64In, DECIMAL* pdecOut);

//#define VarUI4FromUI4(in, pOut) (*(pOut) = (in))
//#define VarI4FromI4(in, pOut) (*(pOut) = (in))

export extern(Windows) HRESULT VarI4FromI8(LONG64 i64In, LONG* plOut);
export extern(Windows) HRESULT VarI4FromUI8(ULONG64 ui64In, LONG* plOut);

//#define VarUI8FromUI8(in, pOut) (*(pOut) = (in))
//#define VarI8FromI8(in, pOut) (*(pOut) = (in))

alias VarUI1FromI4 VarUI1FromInt;
alias VarUI1FromUI4 VarUI1FromUint;
alias VarI2FromI4 VarI2FromInt;
alias VarI2FromUI4 VarI2FromUint;
//alias VarI4FromI4 VarI4FromInt;
alias VarI4FromUI4 VarI4FromUint;
alias VarI8FromI4 VarI8FromInt;
alias VarI8FromUI4 VarI8FromUint;
alias VarR4FromI4 VarR4FromInt;
alias VarR4FromUI4 VarR4FromUint;
alias VarR8FromI4 VarR8FromInt;
alias VarR8FromUI4 VarR8FromUint;
alias VarDateFromI4 VarDateFromInt;
alias VarDateFromUI4 VarDateFromUint;
alias VarCyFromI4 VarCyFromInt;
alias VarCyFromUI4 VarCyFromUint;
alias VarBstrFromI4 VarBstrFromInt;
alias VarBstrFromUI4 VarBstrFromUint;
alias VarBoolFromI4 VarBoolFromInt;
alias VarBoolFromUI4 VarBoolFromUint;
alias VarI1FromI4 VarI1FromInt;
alias VarI1FromUI4 VarI1FromUint;
alias VarUI2FromI4 VarUI2FromInt;
alias VarUI2FromUI4 VarUI2FromUint;
alias VarUI4FromI4 VarUI4FromInt;
//alias VarUI4FromUI4 VarUI4FromUint;
alias VarDecFromI4 VarDecFromInt;
alias VarDecFromUI4 VarDecFromUint;
alias VarI4FromUI1 VarIntFromUI1;
alias VarI4FromI2 VarIntFromI2;
//alias VarI4FromI4 VarIntFromI4;
alias VarI4FromI8 VarIntFromI8;
alias VarI4FromR4 VarIntFromR4;
alias VarI4FromR8 VarIntFromR8;
alias VarI4FromDate VarIntFromDate;
alias VarI4FromCy VarIntFromCy;
alias VarI4FromStr VarIntFromStr;
alias VarI4FromDisp VarIntFromDisp;
alias VarI4FromBool VarIntFromBool;
alias VarI4FromI1 VarIntFromI1;
alias VarI4FromUI2 VarIntFromUI2;
alias VarI4FromUI4 VarIntFromUI4;
alias VarI4FromUI8 VarIntFromUI8;
alias VarI4FromDec VarIntFromDec;
alias VarI4FromUI4 VarIntFromUint;
alias VarUI4FromUI1 VarUintFromUI1;
alias VarUI4FromI2 VarUintFromI2;
alias VarUI4FromI4 VarUintFromI4;
alias VarUI4FromI8 VarUintFromI8;
alias VarUI4FromR4 VarUintFromR4;
alias VarUI4FromR8 VarUintFromR8;
alias VarUI4FromDate VarUintFromDate;
alias VarUI4FromCy VarUintFromCy;
alias VarUI4FromStr VarUintFromStr;
alias VarUI4FromDisp VarUintFromDisp;
alias VarUI4FromBool VarUintFromBool;
alias VarUI4FromI1 VarUintFromI1;
alias VarUI4FromUI2 VarUintFromUI2;
//alias VarUI4FromUI4 VarUintFromUI4;
alias VarUI4FromUI8 VarUintFromUI8;
alias VarUI4FromDec VarUintFromDec;
alias VarUI4FromI4 VarUintFromInt;

struct NUMPARSE {
	INT cDig;
	ULONG dwInFlags;
	ULONG dwOutFlags;
	INT cchUsed;
	INT nBaseShift;
	INT nPwr10;
}

enum {
	NUMPRS_LEADING_WHITE  = 0x0001,
	NUMPRS_TRAILING_WHITE = 0x0002,
	NUMPRS_LEADING_PLUS   = 0x0004,
	NUMPRS_TRAILING_PLUS  = 0x0008,
	NUMPRS_LEADING_MINUS  = 0x0010,
	NUMPRS_TRAILING_MINUS = 0x0020,
	NUMPRS_HEX_OCT        = 0x0040,
	NUMPRS_PARENS         = 0x0080,
	NUMPRS_DECIMAL        = 0x0100,
	NUMPRS_THOUSANDS      = 0x0200,
	NUMPRS_CURRENCY       = 0x0400,
	NUMPRS_EXPONENT       = 0x0800,
	NUMPRS_USE_ALL        = 0x1000,
	NUMPRS_STD            = 0x1FFF,
	NUMPRS_NEG            = 0x10000,
	NUMPRS_INEXACT        = 0x20000,
}

enum {
	VTBIT_I1      = 1 << VT_I1,
	VTBIT_UI1     = 1 << VT_UI1,
	VTBIT_I2      = 1 << VT_I2,
	VTBIT_UI2     = 1 << VT_UI2,
	VTBIT_I4      = 1 << VT_I4,
	VTBIT_UI4     = 1 << VT_UI4,
	VTBIT_I8      = 1 << VT_I8,
	VTBIT_UI8     = 1 << VT_UI8,
	VTBIT_R4      = 1 << VT_R4,
	VTBIT_R8      = 1 << VT_R8,
	VTBIT_CY      = 1 << VT_CY,
	VTBIT_DECIMAL = 1 << VT_DECIMAL,
}

export extern(Windows) HRESULT VarParseNumFromStr(LPCOLESTR strIn, LCID lcid, ULONG dwFlags, NUMPARSE* pnumprs, BYTE* rgbDig);
export extern(Windows) HRESULT VarNumFromParseNum(NUMPARSE* pnumprs, BYTE* rgbDig, ULONG dwVtBits, VARIANT* pvar);

export extern(Windows) HRESULT VarAdd(LPVARIANT pvarLeft, LPVARIANT pvarRight, LPVARIANT pvarResult);
export extern(Windows) HRESULT VarAnd(LPVARIANT pvarLeft, LPVARIANT pvarRight, LPVARIANT pvarResult);
export extern(Windows) HRESULT VarCat(LPVARIANT pvarLeft, LPVARIANT pvarRight, LPVARIANT pvarResult);
export extern(Windows) HRESULT VarDiv(LPVARIANT pvarLeft, LPVARIANT pvarRight, LPVARIANT pvarResult);
export extern(Windows) HRESULT VarEqv(LPVARIANT pvarLeft, LPVARIANT pvarRight, LPVARIANT pvarResult);
export extern(Windows) HRESULT VarIdiv(LPVARIANT pvarLeft, LPVARIANT pvarRight, LPVARIANT pvarResult);
export extern(Windows) HRESULT VarImp(LPVARIANT pvarLeft, LPVARIANT pvarRight, LPVARIANT pvarResult);
export extern(Windows) HRESULT VarMod(LPVARIANT pvarLeft, LPVARIANT pvarRight, LPVARIANT pvarResult);
export extern(Windows) HRESULT VarMul(LPVARIANT pvarLeft, LPVARIANT pvarRight, LPVARIANT pvarResult);
export extern(Windows) HRESULT VarOr(LPVARIANT pvarLeft, LPVARIANT pvarRight, LPVARIANT pvarResult);
export extern(Windows) HRESULT VarPow(LPVARIANT pvarLeft, LPVARIANT pvarRight, LPVARIANT pvarResult);
export extern(Windows) HRESULT VarSub(LPVARIANT pvarLeft, LPVARIANT pvarRight, LPVARIANT pvarResult);
export extern(Windows) HRESULT VarXor(LPVARIANT pvarLeft, LPVARIANT pvarRight, LPVARIANT pvarResult);

export extern(Windows) HRESULT VarAbs(LPVARIANT pvarIn, LPVARIANT pvarResult);
export extern(Windows) HRESULT VarFix(LPVARIANT pvarIn, LPVARIANT pvarResult);
export extern(Windows) HRESULT VarInt(LPVARIANT pvarIn, LPVARIANT pvarResult);
export extern(Windows) HRESULT VarNeg(LPVARIANT pvarIn, LPVARIANT pvarResult);
export extern(Windows) HRESULT VarNot(LPVARIANT pvarIn, LPVARIANT pvarResult);

export extern(Windows) HRESULT VarRound(LPVARIANT pvarIn, int cDecimals, LPVARIANT pvarResult);
export extern(Windows) HRESULT VarCmp(LPVARIANT pvarLeft, LPVARIANT pvarRight, LCID lcid, ULONG dwFlags);

extern(D)
HRESULT VarCmp(LPVARIANT pvarLeft, LPVARIANT pvarRight, LCID lcid)
{
	return VarCmp(pvarLeft, pvarRight, lcid, 0);
}


export extern(Windows) HRESULT VarDecAdd(LPDECIMAL pdecLeft, LPDECIMAL pdecRight, LPDECIMAL pdecResult);
export extern(Windows) HRESULT VarDecDiv(LPDECIMAL pdecLeft, LPDECIMAL pdecRight, LPDECIMAL pdecResult);
export extern(Windows) HRESULT VarDecMul(LPDECIMAL pdecLeft, LPDECIMAL pdecRight, LPDECIMAL pdecResult);
export extern(Windows) HRESULT VarDecSub(LPDECIMAL pdecLeft, LPDECIMAL pdecRight, LPDECIMAL pdecResult);

export extern(Windows) HRESULT VarDecAbs(LPDECIMAL pdecIn, LPDECIMAL pdecResult);
export extern(Windows) HRESULT VarDecFix(LPDECIMAL pdecIn, LPDECIMAL pdecResult);
export extern(Windows) HRESULT VarDecInt(LPDECIMAL pdecIn, LPDECIMAL pdecResult);
export extern(Windows) HRESULT VarDecNeg(LPDECIMAL pdecIn, LPDECIMAL pdecResult);

export extern(Windows) HRESULT VarDecRound(LPDECIMAL pdecIn, int cDecimals, LPDECIMAL pdecResult);

export extern(Windows) HRESULT VarDecCmp(LPDECIMAL pdecLeft, LPDECIMAL pdecRight);
export extern(Windows) HRESULT VarDecCmpR8(LPDECIMAL pdecLeft, double dblRight);

export extern(Windows) HRESULT VarCyAdd(CY cyLeft, CY cyRight, LPCY pcyResult);
export extern(Windows) HRESULT VarCyMul(CY cyLeft, CY cyRight, LPCY pcyResult);
export extern(Windows) HRESULT VarCyMulI4(CY cyLeft, int lRight, LPCY pcyResult);
export extern(Windows) HRESULT VarCyMulI8(CY cyLeft, LONG64 lRight, LPCY pcyResult);
export extern(Windows) HRESULT VarCySub(CY cyLeft, CY cyRight, LPCY pcyResult);

export extern(Windows) HRESULT VarCyAbs(CY cyIn, LPCY pcyResult);
export extern(Windows) HRESULT VarCyFix(CY cyIn, LPCY pcyResult);
export extern(Windows) HRESULT VarCyInt(CY cyIn, LPCY pcyResult);
export extern(Windows) HRESULT VarCyNeg(CY cyIn, LPCY pcyResult);

export extern(Windows) HRESULT VarCyRound(CY cyIn, int cDecimals, LPCY pcyResult);

export extern(Windows) HRESULT VarCyCmp(CY cyLeft, CY cyRight);
export extern(Windows) HRESULT VarCyCmpR8(CY cyLeft, double dblRight);

export extern(Windows) HRESULT VarBstrCat(BSTR bstrLeft, BSTR bstrRight, LPBSTR pbstrResult);
export extern(Windows) HRESULT VarBstrCmp(BSTR bstrLeft, BSTR bstrRight, LCID lcid, ULONG dwFlags);
export extern(Windows) HRESULT VarR8Pow(double dblLeft, double dblRight, double* pdblResult);
export extern(Windows) HRESULT VarR4CmpR8(float fltLeft, double dblRight);
export extern(Windows) HRESULT VarR8Round(double dblIn, int cDecimals, double* pdblResult);

enum {
	VARCMP_LT   = 0,
	VARCMP_EQ   = 1,
	VARCMP_GT   = 2,
	VARCMP_NULL = 3,
}

alias VT_RESERVED VT_HARDTYPE;

struct UDATE {
	SYSTEMTIME st;
	USHORT wDayOfYear;
}

export extern(Windows) HRESULT VarDateFromUdate(UDATE* pudateIn, ULONG dwFlags, DATE* pdateOut);
export extern(Windows) HRESULT VarDateFromUdateEx(UDATE* pudateIn, LCID lcid, ULONG dwFlags, DATE* pdateOut);
export extern(Windows) HRESULT VarUdateFromDate(DATE dateIn, ULONG dwFlags, UDATE* pudateOut);

export extern(Windows) HRESULT GetAltMonthNames(LCID lcid, LPOLESTR** prgp);

export extern(Windows) HRESULT VarFormat(LPVARIANT pvarIn, LPOLESTR pstrFormat, int iFirstDay, int iFirstWeek, ULONG dwFlags, BSTR* pbstrOut);
export extern(Windows) HRESULT VarFormatDateTime(LPVARIANT pvarIn, int iNamedFormat, ULONG dwFlags, BSTR* pbstrOut);
export extern(Windows) HRESULT VarFormatNumber(LPVARIANT pvarIn, int iNumDig, int iIncLead, int iUseParens, int iGroup, ULONG dwFlags, BSTR* pbstrOut);
export extern(Windows) HRESULT VarFormatPercent(LPVARIANT pvarIn, int iNumDig, int iIncLead, int iUseParens, int iGroup, ULONG dwFlags, BSTR* pbstrOut);
export extern(Windows) HRESULT VarFormatCurrency(LPVARIANT pvarIn, int iNumDig, int iIncLead, int iUseParens, int iGroup, ULONG dwFlags, BSTR* pbstrOut);
export extern(Windows) HRESULT VarWeekdayName(int iWeekday, int fAbbrev, int iFirstDay, ULONG dwFlags, BSTR* pbstrOut);
export extern(Windows) HRESULT VarMonthName(int iMonth, int fAbbrev, ULONG dwFlags, BSTR* pbstrOut);
export extern(Windows) HRESULT VarFormatFromTokens(LPVARIANT pvarIn, LPOLESTR pstrFormat, LPBYTE pbTokCur, ULONG dwFlags, BSTR* pbstrOut, LCID lcid);
export extern(Windows) HRESULT VarTokenizeFormatString(LPOLESTR pstrFormat, LPBYTE rgbTok, int cbTok, int iFirstDay, int iFirstWeek, LCID lcid, int* pcbActual);

alias ITypeLib LPTYPELIB;
alias LONG DISPID;
alias DISPID MEMBERID;

alias DISPID_UNKNOWN MEMBERID_NIL;
enum ID_DEFAULTINST = -2;

enum {
	DISPATCH_METHOD         = 0x1,
	DISPATCH_PROPERTYGET    = 0x2,
	DISPATCH_PROPERTYPUT    = 0x4,
	DISPATCH_PROPERTYPUTREF = 0x8,
}

alias ITypeInfo LPTYPEINFO;
alias ITypeComp LPTYPECOMP;
alias ICreateTypeLib LPCREATETYPELIB;
alias ICreateTypeInfo LPCREATETYPEINFO;

export extern(Windows) ULONG LHashValOfNameSysA(SYSKIND syskind, LCID lcid, LPCSTR szName);
export extern(Windows) ULONG LHashValOfNameSys(SYSKIND syskind, LCID lcid, const(OLECHAR)* szName);

//#define LHashValOfName(lcid, szName)  LHashValOfNameSys(SYS_WIN32, lcid, szName)
//#define WHashValOfLHashVal(lhashval)  ((USHORT) (0x0000ffff & (lhashval)))
//#define IsHashValCompatible(lhashval1, lhashval2)  ((BOOL) ((0x00ff0000 & (lhashval1)) == (0x00ff0000 & (lhashval2))))

export extern(Windows) HRESULT LoadTypeLib(LPCOLESTR szFile, ITypeLib* pptlib);

enum {
	REGKIND_DEFAULT,
	REGKIND_REGISTER,
	REGKIND_NONE
}
alias int REGKIND;

enum {
	LOAD_TLB_AS_32BIT      = 0x20,
	LOAD_TLB_AS_64BIT      = 0x40,
	MASK_TO_RESET_TLB_BITS = ~(LOAD_TLB_AS_32BIT | LOAD_TLB_AS_64BIT),
}

export extern(Windows) HRESULT LoadTypeLibEx(LPCOLESTR szFile, REGKIND regkind, ITypeLib* pptlib);
export extern(Windows) HRESULT LoadRegTypeLib(REFGUID rguid, WORD wVerMajor, WORD wVerMinor, LCID lcid, ITypeLib* pptlib);
export extern(Windows) HRESULT QueryPathOfRegTypeLib(REFGUID guid, USHORT wMaj, USHORT wMin, LCID lcid, LPBSTR lpbstrPathName);
export extern(Windows) HRESULT RegisterTypeLib(ITypeLib ptlib, LPCOLESTR szFullPath, LPCOLESTR szHelpDir);
export extern(Windows) HRESULT UnRegisterTypeLib(REFGUID libID, WORD wVerMajor, WORD wVerMinor, LCID lcid, SYSKIND syskind);
export extern(Windows) HRESULT RegisterTypeLibForUser(ITypeLib ptlib, OLECHAR* szFullPath, OLECHAR* szHelpDir);
export extern(Windows) HRESULT UnRegisterTypeLibForUser(REFGUID libID, WORD wMajorVerNum, WORD wMinorVerNum, LCID lcid, SYSKIND syskind);
export extern(Windows) HRESULT CreateTypeLib(SYSKIND syskind, LPCOLESTR szFile, ICreateTypeLib* ppctlib);
export extern(Windows) HRESULT CreateTypeLib2(SYSKIND syskind, LPCOLESTR szFile, ICreateTypeLib2* ppctlib);

alias IDispatch LPDISPATCH;

struct PARAMDATA {
	OLECHAR* szName;
	VARTYPE vt;
}
alias PARAMDATA* LPPARAMDATA;

struct METHODDATA {
	OLECHAR* szName;
	PARAMDATA* ppdata;
	DISPID dispid;
	UINT iMeth;
	CALLCONV cc;
	UINT cArgs;
	WORD wFlags;
	VARTYPE vtReturn;
}
alias METHODDATA* LPMETHODDATA;

struct INTERFACEDATA {
	METHODDATA* pmethdata;
	UINT cMembers;
}
alias INTERFACEDATA* LPINTERFACEDATA;

export extern(Windows) HRESULT DispGetParam(DISPPARAMS* pdispparams, UINT position, VARTYPE vtTarg, VARIANT* pvarResult, UINT* puArgErr);
export extern(Windows) HRESULT DispGetIDsOfNames(ITypeInfo ptinfo, OLECHAR** rgszNames, UINT cNames, DISPID* rgdispid);
export extern(Windows) HRESULT DispInvoke(void* _this, ITypeInfo ptinfo, DISPID dispidMember, WORD wFlags, DISPPARAMS* pparams, VARIANT* pvarResult, EXCEPINFO* pexcepinfo, UINT* puArgErr);
export extern(Windows) HRESULT CreateDispTypeInfo(INTERFACEDATA* pidata, LCID lcid, ITypeInfo* pptinfo);
export extern(Windows) HRESULT CreateStdDispatch(IUnknown punkOuter, void* pvThis, ITypeInfo ptinfo, IUnknown* ppunkStdDisp);
export extern(Windows) HRESULT DispCallFunc(void* pvInstance, ULONG_PTR oVft, CALLCONV cc, VARTYPE vtReturn, UINT cActuals, VARTYPE* prgvt, VARIANTARG ** prgpvarg, VARIANT* pvargResult);

enum {
	ACTIVEOBJECT_STRONG = 0x0,
	ACTIVEOBJECT_WEAK   = 0x1,
}

export extern(Windows) HRESULT RegisterActiveObject(IUnknown punk, REFCLSID rclsid, DWORD dwFlags, DWORD* pdwRegister);
export extern(Windows) HRESULT RevokeActiveObject(DWORD dwRegister, void* pvReserved);
export extern(Windows) HRESULT GetActiveObject(REFCLSID rclsid, void* pvReserved, IUnknown* ppunk);
export extern(Windows) HRESULT SetErrorInfo(ULONG dwReserved, IErrorInfo perrinfo);
export extern(Windows) HRESULT GetErrorInfo(ULONG dwReserved, IErrorInfo* pperrinfo);
export extern(Windows) HRESULT CreateErrorInfo(ICreateErrorInfo* pperrinfo);
export extern(Windows) HRESULT GetRecordInfoFromTypeInfo(ITypeInfo pTypeInfo, IRecordInfo* ppRecInfo);
export extern(Windows) HRESULT GetRecordInfoFromGuids(REFGUID rGuidTypeLib, ULONG uVerMajor, ULONG uVerMinor, LCID lcid, REFGUID rGuidTypeInfo, IRecordInfo* ppRecInfo);
export extern(Windows) ULONG OaBuildVersion();
export extern(Windows) void ClearCustData(LPCUSTDATA pCustData);

static if(NTDDI_VERSION >= NTDDI_VISTASP1)
	export extern(Windows) void OaEnablePerUserTLibRegistration();

/*
#define V_UNION(X, Y) ((X)->Y)
#define V_VT(X) ((X)->vt)
#define V_RECORDINFO(X) ((X)->pRecInfo)
#define V_RECORD(X) ((X)->pvRecord)

#define V_ISBYREF(X) (V_VT(X)&VT_BYREF)
#define V_ISARRAY(X) (V_VT(X)&VT_ARRAY)
#define V_ISVECTOR(X) (V_VT(X)&VT_VECTOR)
#define V_NONE(X) V_I2(X)

#define V_UI1(X) V_UNION(X, bVal)
#define V_UI1REF(X) V_UNION(X, pbVal)
#define V_I2(X) V_UNION(X, iVal)
#define V_I2REF(X) V_UNION(X, piVal)
#define V_I4(X) V_UNION(X, lVal)
#define V_I4REF(X) V_UNION(X, plVal)
#define V_I8(X) V_UNION(X, llVal)
#define V_I8REF(X) V_UNION(X, pllVal)
#define V_R4(X) V_UNION(X, fltVal)
#define V_R4REF(X) V_UNION(X, pfltVal)
#define V_R8(X) V_UNION(X, dblVal)
#define V_R8REF(X) V_UNION(X, pdblVal)
#define V_I1(X) V_UNION(X, cVal)
#define V_I1REF(X) V_UNION(X, pcVal)
#define V_UI2(X) V_UNION(X, uiVal)
#define V_UI2REF(X) V_UNION(X, puiVal)
#define V_UI4(X) V_UNION(X, ulVal)
#define V_UI4REF(X) V_UNION(X, pulVal)
#define V_UI8(X) V_UNION(X, ullVal)
#define V_UI8REF(X) V_UNION(X, pullVal)
#define V_INT(X) V_UNION(X, intVal)
#define V_INTREF(X) V_UNION(X, pintVal)
#define V_UINT(X) V_UNION(X, uintVal)
#define V_UINTREF(X) V_UNION(X, puintVal)

#ifdef _WIN64
	#define V_INT_PTR(X) V_UNION(X, llVal)
	#define V_UINT_PTR(X) V_UNION(X, ullVal)
	#define V_INT_PTRREF(X) V_UNION(X, pllVal)
	#define V_UINT_PTRREF(X) V_UNION(X, pullVal)
#else
	#define V_INT_PTR(X) V_UNION(X, lVal)
	#define V_UINT_PTR(X) V_UNION(X, ulVal)
	#define V_INT_PTRREF(X) V_UNION(X, plVal)
	#define V_UINT_PTRREF(X) V_UNION(X, pulVal)
#endif

#define V_CY(X) V_UNION(X, cyVal)
#define V_CYREF(X) V_UNION(X, pcyVal)
#define V_DATE(X) V_UNION(X, date)
#define V_DATEREF(X) V_UNION(X, pdate)
#define V_BSTR(X) V_UNION(X, bstrVal)
#define V_BSTRREF(X) V_UNION(X, pbstrVal)
#define V_DISPATCH(X) V_UNION(X, pdispVal)
#define V_DISPATCHREF(X) V_UNION(X, ppdispVal)
#define V_ERROR(X) V_UNION(X, scode)
#define V_ERRORREF(X) V_UNION(X, pscode)
#define V_BOOL(X) V_UNION(X, boolVal)
#define V_BOOLREF(X) V_UNION(X, pboolVal)
#define V_UNKNOWN(X) V_UNION(X, punkVal)
#define V_UNKNOWNREF(X) V_UNION(X, ppunkVal)
#define V_VARIANTREF(X) V_UNION(X, pvarVal)
#define V_ARRAY(X) V_UNION(X, parray)
#define V_ARRAYREF(X) V_UNION(X, pparray)
#define V_BYREF(X) V_UNION(X, byref)

#define V_DECIMAL(X) V_UNION(X, decVal)
#define V_DECIMALREF(X) V_UNION(X, pdecVal)
*/
}// align(8)
