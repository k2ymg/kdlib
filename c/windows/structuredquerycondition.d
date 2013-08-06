/** structuredquerycondition.d

Converted from 'structuredquerycondition.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.structuredquerycondition;


import c.windows.windef;
import c.windows.guiddef;
import c.windows.wtypes;
import c.windows.unknwn;
import c.windows.propidl;
import c.windows.objidl;
import c.windows.rpcdcep;
import c.windows.oaidl;


extern(C){

enum {
	CT_AND_CONDITION = 0,
	CT_OR_CONDITION,
	CT_NOT_CONDITION,
	CT_LEAF_CONDITION
}
alias int CONDITION_TYPE;

enum {
	COP_IMPLICIT = 0,
	COP_EQUAL,
	COP_NOTEQUAL,
	COP_LESSTHAN,
	COP_GREATERTHAN,
	COP_LESSTHANOREQUAL,
	COP_GREATERTHANOREQUAL,
	COP_VALUE_STARTSWITH,
	COP_VALUE_ENDSWITH,
	COP_VALUE_CONTAINS,
	COP_VALUE_NOTCONTAINS,
	COP_DOSWILDCARDS,
	COP_WORD_EQUAL,
	COP_WORD_STARTSWITH,
	COP_APPLICATION_SPECIFIC
}
alias int CONDITION_OPERATION;

//extern extern(C) const IID IID_IRichChunk;
interface IRichChunk : IUnknown {
public extern(Windows):
	HRESULT GetData(ULONG* pFirstPos, ULONG* pLength, LPWSTR* ppsz, PROPVARIANT* pValue);
}
mixin DEFINE_IID!(IRichChunk, "4FDEF69C-DBC9-454e-9910-B34F3C64B510");

export extern(Windows){
	HRESULT IRichChunk_RemoteGetData_Proxy(IRichChunk This, ULONG* pFirstPos, ULONG* pLength, LPWSTR* ppsz, PROPVARIANT* pValue);
	void IRichChunk_RemoteGetData_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_ICondition;
interface ICondition : IPersistStream {
public extern(Windows):
	HRESULT GetConditionType(CONDITION_TYPE* pNodeType);
	HRESULT GetSubConditions(REFIID riid, void** ppv);
	HRESULT GetComparisonInfo(LPWSTR* ppszPropertyName, CONDITION_OPERATION* pcop, PROPVARIANT* ppropvar);
	HRESULT GetValueType(LPWSTR* ppszValueTypeName);
	HRESULT GetValueNormalization(LPWSTR* ppszNormalization);
	HRESULT GetInputTerms(IRichChunk* ppPropertyTerm, IRichChunk* ppOperationTerm, IRichChunk* ppValueTerm);
	HRESULT Clone(ICondition* ppc);
}
mixin DEFINE_IID!(ICondition, "0FC988D4-C935-4b97-A973-46282EA175C8");

export extern(Windows){
	HRESULT ICondition_RemoteGetComparisonInfo_Proxy(ICondition This, LPWSTR* ppszPropertyName, CONDITION_OPERATION* pcop, PROPVARIANT* ppropvar);
	void ICondition_RemoteGetComparisonInfo_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT ICondition_RemoteGetInputTerms_Proxy(ICondition This, IRichChunk* ppPropertyTerm, IRichChunk* ppOperationTerm, IRichChunk* ppValueTerm);
	void ICondition_RemoteGetInputTerms_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_ICondition2;
interface ICondition2 : ICondition {
public extern(Windows):
	HRESULT GetLocale(LPWSTR* ppszLocaleName);
	HRESULT GetLeafConditionInfo(PROPERTYKEY* ppropkey, CONDITION_OPERATION* pcop, PROPVARIANT* ppropvar);
}
mixin DEFINE_IID!(ICondition2, "0DB8851D-2E5B-47eb-9208-D28C325A01D7");

export extern(Windows){
	HRESULT ICondition2_RemoteGetLeafConditionInfo_Proxy(ICondition2 This, PROPERTYKEY* ppropkey, CONDITION_OPERATION* pcop, PROPVARIANT* ppropvar);
	void ICondition2_RemoteGetLeafConditionInfo_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
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
}

export extern(Windows){
	HRESULT IRichChunk_GetData_Proxy(IRichChunk This, ULONG* pFirstPos, ULONG* pLength, LPWSTR* ppsz, PROPVARIANT* pValue);
	HRESULT IRichChunk_GetData_Stub(IRichChunk This, ULONG* pFirstPos, ULONG* pLength, LPWSTR* ppsz, PROPVARIANT* pValue);
	HRESULT ICondition_GetComparisonInfo_Proxy(ICondition This, LPWSTR* ppszPropertyName, CONDITION_OPERATION* pcop, PROPVARIANT* ppropvar);
	HRESULT ICondition_GetComparisonInfo_Stub(ICondition This, LPWSTR* ppszPropertyName, CONDITION_OPERATION* pcop, PROPVARIANT* ppropvar);
	HRESULT ICondition_GetInputTerms_Proxy(ICondition This, IRichChunk* ppPropertyTerm, IRichChunk* ppOperationTerm, IRichChunk* ppValueTerm);
	HRESULT ICondition_GetInputTerms_Stub(ICondition This, IRichChunk* ppPropertyTerm, IRichChunk* ppOperationTerm, IRichChunk* ppValueTerm);
	HRESULT ICondition2_GetLeafConditionInfo_Proxy(ICondition2 This, PROPERTYKEY* ppropkey, CONDITION_OPERATION* pcop, PROPVARIANT* ppropvar);
	HRESULT ICondition2_GetLeafConditionInfo_Stub(ICondition2 This, PROPERTYKEY* ppropkey, CONDITION_OPERATION* pcop, PROPVARIANT* ppropvar);
}

}// extern(C)
