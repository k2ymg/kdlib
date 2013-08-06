/** iedial.d

Converted from 'iedial.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.iedial;


import c.windows.windef;
import c.windows.guiddef;
import c.windows.unknwn;
import c.windows.wingdi;


extern(C){

//extern extern(C) const IID IID_IDialEventSink;
interface IDialEventSink : IUnknown {
public extern(Windows):
	HRESULT OnEvent(DWORD dwEvent, DWORD dwStatus);
}
mixin DEFINE_IID!(IDialEventSink, "2d86f4ff-6e2d-4488-b2e9-6934afd41bea");

//extern extern(C) const IID IID_IDialEngine;
interface IDialEngine : IUnknown {
public extern(Windows):
	HRESULT Initialize(LPCWSTR pwzConnectoid, IDialEventSink pIDES);
	HRESULT GetProperty(LPCWSTR pwzProperty, LPWSTR pwzValue, DWORD dwBufSize);
	HRESULT SetProperty(LPCWSTR pwzProperty, LPCWSTR pwzValue);
	HRESULT Dial();
	HRESULT HangUp();
	HRESULT GetConnectedState(DWORD* pdwState);
	HRESULT GetConnectHandle(DWORD_PTR* pdwHandle);
}
mixin DEFINE_IID!(IDialEngine, "39fd782b-7905-40d5-9148-3c9b190423d5");

//extern extern(C) const IID IID_IDialBranding;
interface IDialBranding : IUnknown {
public extern(Windows):
	HRESULT Initialize(LPCWSTR pwzConnectoid);
	HRESULT GetBitmap(DWORD dwIndex, HBITMAP* phBitmap);
}
mixin DEFINE_IID!(IDialBranding, "8aecafa9-4306-43cc-8c5a-765f2979cc16");

const wchar* DIALPROP_USERNAME = "UserName";
const wchar* DIALPROP_PASSWORD = "Password";
const wchar* DIALPROP_DOMAIN = "Domain";
const wchar* DIALPROP_SAVEPASSWORD = "SavePassword";
const wchar* DIALPROP_REDIALCOUNT = "RedialCount";
const wchar* DIALPROP_REDIALINTERVAL = "RedialInterval";
const wchar* DIALPROP_PHONENUMBER = "PhoneNumber";
const wchar* DIALPROP_LASTERROR = "LastError";
const wchar* DIALPROP_RESOLVEDPHONE = "ResolvedPhone";

enum {
	DIALENG_OperationComplete = 0x10000,
	DIALENG_RedialAttempt     = 0x10001,
	DIALENG_RedialWait        = 0x10002,
}

export extern(Windows){
	uint HBITMAP_UserSize(uint*, uint, HBITMAP*);
	ubyte* HBITMAP_UserMarshal(uint*, ubyte*, HBITMAP*);
	ubyte* HBITMAP_UserUnmarshal(uint*, ubyte*, HBITMAP*);
	void HBITMAP_UserFree(uint*, HBITMAP*);

	uint HBITMAP_UserSize64(uint*, uint, HBITMAP*);
	ubyte* HBITMAP_UserMarshal64(uint*, ubyte*, HBITMAP*);
	ubyte* HBITMAP_UserUnmarshal64(uint*, ubyte*, HBITMAP*);
	void HBITMAP_UserFree64(uint*, HBITMAP*);
}

}// extern(C)
