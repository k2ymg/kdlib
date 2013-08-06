/** objectarray.d

Converted from 'objectarray.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.objectarray;


import c.windows.windef;
import c.windows.guiddef;
import c.windows.unknwn;


extern(C){

//extern extern(C) const IID IID_IObjectArray;
interface IObjectArray : IUnknown {
public extern(Windows):
	HRESULT GetCount(UINT* pcObjects);
	HRESULT GetAt(UINT uiIndex, REFIID riid, void** ppv);
}
mixin DEFINE_IID!(IObjectArray, "92CA9DCD-5622-4bba-A805-5E9F541BD8C9");

//extern extern(C) const IID IID_IObjectCollection;
interface IObjectCollection : IObjectArray {
public extern(Windows):
	HRESULT AddObject(IUnknown punk);
	HRESULT AddFromArray(IObjectArray poaSource);
	HRESULT RemoveObjectAt(UINT uiIndex);
	HRESULT Clear();
}
mixin DEFINE_IID!(IObjectCollection, "5632b1a4-e38a-400a-928a-d4cd63230295");

}// extern(C)
