/** dimm.d

Converted from 'dimm.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.dimm;


import c.windows.windef;
import c.windows.guiddef;
import c.windows.imm;
import c.windows.unknwn;
import c.windows.wingdi;
import c.windows.winuser;


extern(C){

struct INPUTCONTEXT {
	HWND hWnd;
	BOOL fOpen;
	POINT ptStatusWndPos;
	POINT ptSoftKbdPos;
	DWORD fdwConversion;
	DWORD fdwSentence;
	union {
		LOGFONTA A;
		LOGFONTW W;
	}
	COMPOSITIONFORM cfCompForm;
	CANDIDATEFORM[4] cfCandForm;
	HIMCC hCompStr;
	HIMCC hCandInfo;
	HIMCC hGuideLine;
	HIMCC hPrivate;
	DWORD dwNumMsgBuf;
	HIMCC hMsgBuf;
	DWORD fdwInit;
	DWORD[3] dwReserve;
}

struct IMEINFO {
	DWORD dwPrivateDataSize;
	DWORD fdwProperty;
	DWORD fdwConversionCaps;
	DWORD fdwSentenceCaps;
	DWORD fdwUICaps;
	DWORD fdwSCSCaps;
	DWORD fdwSelectCaps;
}

extern extern(C) const IID LIBID_ActiveIMM;

//extern extern(C) const IID IID_IEnumRegisterWordA;
interface IEnumRegisterWordA : IUnknown {
public extern(Windows):
	HRESULT Clone(IEnumRegisterWordA* ppEnum);
	HRESULT Next(ULONG ulCount, REGISTERWORDA* rgRegisterWord, ULONG* pcFetched);
	HRESULT Reset();
	HRESULT Skip(ULONG ulCount);
}
mixin DEFINE_IID!(IEnumRegisterWordA, "08C03412-F96B-11d0-A475-00AA006BCC59");

//extern extern(C) const IID IID_IEnumRegisterWordW;
interface IEnumRegisterWordW : IUnknown {
public extern(Windows):
	HRESULT Clone(IEnumRegisterWordW* ppEnum);
	HRESULT Next(ULONG ulCount, REGISTERWORDW* rgRegisterWord, ULONG* pcFetched);
	HRESULT Reset();
	HRESULT Skip(ULONG ulCount);
}
mixin DEFINE_IID!(IEnumRegisterWordW, "4955DD31-B159-11d0-8FCF-00AA006BCC59");

//extern extern(C) const IID IID_IEnumInputContext;
interface IEnumInputContext : IUnknown {
public extern(Windows):
	HRESULT Clone(IEnumInputContext* ppEnum);
	HRESULT Next(ULONG ulCount, HIMC* rgInputContext, ULONG* pcFetched);
	HRESULT Reset();
	HRESULT Skip(ULONG ulCount);
}
mixin DEFINE_IID!(IEnumInputContext, "09b5eab0-f997-11d1-93d4-0060b067b86e");

//extern extern(C) const IID IID_IActiveIMMRegistrar;
interface IActiveIMMRegistrar : IUnknown {
public extern(Windows):
	HRESULT RegisterIME(REFCLSID rclsid, LANGID lgid, LPCWSTR pszIconFile, LPCWSTR pszDesc);
	HRESULT UnregisterIME(REFCLSID rclsid);
}
mixin DEFINE_IID!(IActiveIMMRegistrar, "b3458082-bd00-11d1-939b-0060b067b86e");

//extern extern(C) const IID IID_IActiveIMMMessagePumpOwner;
interface IActiveIMMMessagePumpOwner : IUnknown {
public extern(Windows):
	HRESULT Start();
	HRESULT End();
	HRESULT OnTranslateMessage(const(MSG)* pMsg);
	HRESULT Pause(DWORD* pdwCookie);
	HRESULT Resume(DWORD dwCookie);
}
mixin DEFINE_IID!(IActiveIMMMessagePumpOwner, "b5cf2cfa-8aeb-11d1-9364-0060b067b86e");

//extern extern(C) const IID IID_IActiveIMMApp;
interface IActiveIMMApp : IUnknown {
public extern(Windows):
	HRESULT AssociateContext(HWND hWnd, HIMC hIME, HIMC* phPrev);
	HRESULT ConfigureIMEA(HKL hKL, HWND hWnd, DWORD dwMode, REGISTERWORDA* pData);
	HRESULT ConfigureIMEW(HKL hKL, HWND hWnd, DWORD dwMode, REGISTERWORDW* pData);
	HRESULT CreateContext(HIMC* phIMC);
	HRESULT DestroyContext(HIMC hIME);
	HRESULT EnumRegisterWordA(HKL hKL, LPSTR szReading, DWORD dwStyle, LPSTR szRegister, LPVOID pData, IEnumRegisterWordA* pEnum);
	HRESULT EnumRegisterWordW(HKL hKL, LPWSTR szReading, DWORD dwStyle, LPWSTR szRegister, LPVOID pData, IEnumRegisterWordW* pEnum);
	HRESULT EscapeA(HKL hKL, HIMC hIMC, UINT uEscape, LPVOID pData, LRESULT* plResult);
	HRESULT EscapeW(HKL hKL, HIMC hIMC, UINT uEscape, LPVOID pData, LRESULT* plResult);
	HRESULT GetCandidateListA(HIMC hIMC, DWORD dwIndex, UINT uBufLen, CANDIDATELIST* pCandList, UINT* puCopied);
	HRESULT GetCandidateListW(HIMC hIMC, DWORD dwIndex, UINT uBufLen, CANDIDATELIST* pCandList, UINT* puCopied);
	HRESULT GetCandidateListCountA(HIMC hIMC, DWORD* pdwListSize, DWORD* pdwBufLen);
	HRESULT GetCandidateListCountW(HIMC hIMC, DWORD* pdwListSize, DWORD* pdwBufLen);
	HRESULT GetCandidateWindow(HIMC hIMC, DWORD dwIndex, CANDIDATEFORM* pCandidate);
	HRESULT GetCompositionFontA(HIMC hIMC, LOGFONTA* plf);
	HRESULT GetCompositionFontW(HIMC hIMC, LOGFONTW* plf);
	HRESULT GetCompositionStringA(HIMC hIMC, DWORD dwIndex, DWORD dwBufLen, LONG* plCopied, LPVOID pBuf);
	HRESULT GetCompositionStringW(HIMC hIMC, DWORD dwIndex, DWORD dwBufLen, LONG* plCopied, LPVOID pBuf);
	HRESULT GetCompositionWindow(HIMC hIMC, COMPOSITIONFORM* pCompForm);
	HRESULT GetContext(HWND hWnd, HIMC* phIMC);
	HRESULT GetConversionListA(HKL hKL, HIMC hIMC, LPSTR pSrc, UINT uBufLen, UINT uFlag, CANDIDATELIST* pDst, UINT* puCopied);
	HRESULT GetConversionListW(HKL hKL, HIMC hIMC, LPWSTR pSrc, UINT uBufLen, UINT uFlag, CANDIDATELIST* pDst, UINT* puCopied);
	HRESULT GetConversionStatus(HIMC hIMC, DWORD* pfdwConversion, DWORD* pfdwSentence);
	HRESULT GetDefaultIMEWnd(HWND hWnd, HWND* phDefWnd);
	HRESULT GetDescriptionA(HKL hKL, UINT uBufLen, LPSTR szDescription, UINT* puCopied);
	HRESULT GetDescriptionW(HKL hKL, UINT uBufLen, LPWSTR szDescription, UINT* puCopied);
	HRESULT GetGuideLineA(HIMC hIMC, DWORD dwIndex,DWORD dwBufLen, LPSTR pBuf, DWORD* pdwResult);
	HRESULT GetGuideLineW(HIMC hIMC, DWORD dwIndex, DWORD dwBufLen, LPWSTR pBuf, DWORD* pdwResult);
	HRESULT GetIMEFileNameA(HKL hKL, UINT uBufLen, LPSTR szFileName, UINT* puCopied);
	HRESULT GetIMEFileNameW(HKL hKL, UINT uBufLen, LPWSTR szFileName, UINT* puCopied);
	HRESULT GetOpenStatus(HIMC hIMC);
	HRESULT GetProperty(HKL hKL, DWORD fdwIndex, DWORD* pdwProperty);
	HRESULT GetRegisterWordStyleA(HKL hKL, UINT nItem, STYLEBUFA* pStyleBuf, UINT* puCopied);
	HRESULT GetRegisterWordStyleW(HKL hKL, UINT nItem, STYLEBUFW* pStyleBuf, UINT* puCopied);
	HRESULT GetStatusWindowPos(HIMC hIMC, POINT* pptPos);
	HRESULT GetVirtualKey(HWND hWnd, UINT* puVirtualKey);
	HRESULT InstallIMEA(LPSTR szIMEFileName, LPSTR szLayoutText, HKL* phKL);
	HRESULT InstallIMEW(LPWSTR szIMEFileName, LPWSTR szLayoutText, HKL* phKL);
	HRESULT IsIME(HKL hKL);
	HRESULT IsUIMessageA(HWND hWndIME, UINT msg, WPARAM wParam, LPARAM lParam);
	HRESULT IsUIMessageW(HWND hWndIME, UINT msg, WPARAM wParam, LPARAM lParam);
	HRESULT NotifyIME(HIMC hIMC, DWORD dwAction, DWORD dwIndex, DWORD dwValue);
	HRESULT RegisterWordA(HKL hKL, LPSTR szReading, DWORD dwStyle, LPSTR szRegister);
	HRESULT RegisterWordW(HKL hKL, LPWSTR szReading, DWORD dwStyle, LPWSTR szRegister);
	HRESULT ReleaseContext(HWND hWnd, HIMC hIMC);
	HRESULT SetCandidateWindow(HIMC hIMC, CANDIDATEFORM* pCandidate);
	HRESULT SetCompositionFontA(HIMC hIMC, LOGFONTA* plf);
	HRESULT SetCompositionFontW(HIMC hIMC, LOGFONTW* plf);
	HRESULT SetCompositionStringA(HIMC hIMC, DWORD dwIndex, LPVOID pComp, DWORD dwCompLen, LPVOID pRead, DWORD dwReadLen);
	HRESULT SetCompositionStringW(HIMC hIMC, DWORD dwIndex, LPVOID pComp, DWORD dwCompLen, LPVOID pRead, DWORD dwReadLen);
	HRESULT SetCompositionWindow(HIMC hIMC, COMPOSITIONFORM* pCompForm);
	HRESULT SetConversionStatus(HIMC hIMC, DWORD fdwConversion, DWORD fdwSentence);
	HRESULT SetOpenStatus(HIMC hIMC, BOOL fOpen);
	HRESULT SetStatusWindowPos(HIMC hIMC, POINT* pptPos);
	HRESULT SimulateHotKey(HWND hWnd, DWORD dwHotKeyID);
	HRESULT UnregisterWordA(HKL hKL, LPSTR szReading, DWORD dwStyle, LPSTR szUnregister);
	HRESULT UnregisterWordW(HKL hKL, LPWSTR szReading, DWORD dwStyle, LPWSTR szUnregister);
	HRESULT Activate(BOOL fRestoreLayout);
	HRESULT Deactivate();
	HRESULT OnDefWindowProc(HWND hWnd, UINT Msg, WPARAM wParam, LPARAM lParam, LRESULT* plResult);
	HRESULT FilterClientWindows(ATOM* aaClassList, UINT uSize);
	HRESULT GetCodePageA(HKL hKL, UINT* uCodePage);
	HRESULT GetLangId(HKL hKL, LANGID* plid);
	HRESULT AssociateContextEx(HWND hWnd, HIMC hIMC, DWORD dwFlags);
	HRESULT DisableIME(DWORD idThread);
	HRESULT GetImeMenuItemsA(HIMC hIMC, DWORD dwFlags, DWORD dwType, IMEMENUITEMINFOA* pImeParentMenu, IMEMENUITEMINFOA* pImeMenu, DWORD dwSize, DWORD* pdwResult);
	HRESULT GetImeMenuItemsW(HIMC hIMC, DWORD dwFlags, DWORD dwType, IMEMENUITEMINFOW* pImeParentMenu, IMEMENUITEMINFOW* pImeMenu, DWORD dwSize, DWORD* pdwResult);
	HRESULT EnumInputContext(DWORD idThread, IEnumInputContext* ppEnum);
}
mixin DEFINE_IID!(IActiveIMMApp, "08c0e040-62d1-11d1-9326-0060b067b86e");

//extern extern(C) const IID IID_IActiveIMMIME;
interface IActiveIMMIME : IUnknown {
public extern(Windows):
	HRESULT AssociateContext(HWND hWnd, HIMC hIME, HIMC* phPrev);
	HRESULT ConfigureIMEA(HKL hKL, HWND hWnd, DWORD dwMode, REGISTERWORDA* pData);
	HRESULT ConfigureIMEW(HKL hKL, HWND hWnd, DWORD dwMode, REGISTERWORDW* pData);
	HRESULT CreateContext(HIMC* phIMC);
	HRESULT DestroyContext(HIMC hIME);
	HRESULT EnumRegisterWordA(HKL hKL, LPSTR szReading, DWORD dwStyle, LPSTR szRegister, LPVOID pData, IEnumRegisterWordA* pEnum);
	HRESULT EnumRegisterWordW(HKL hKL, LPWSTR szReading, DWORD dwStyle, LPWSTR szRegister, LPVOID pData, IEnumRegisterWordW* pEnum);
	HRESULT EscapeA(HKL hKL, HIMC hIMC, UINT uEscape, LPVOID pData, LRESULT* plResult);
	HRESULT EscapeW(HKL hKL, HIMC hIMC, UINT uEscape, LPVOID pData, LRESULT* plResult);
	HRESULT GetCandidateListA(HIMC hIMC, DWORD dwIndex, UINT uBufLen, CANDIDATELIST* pCandList, UINT* puCopied);
	HRESULT GetCandidateListW(HIMC hIMC, DWORD dwIndex, UINT uBufLen, CANDIDATELIST* pCandList, UINT* puCopied);
	HRESULT GetCandidateListCountA(HIMC hIMC, DWORD* pdwListSize, DWORD* pdwBufLen);
	HRESULT GetCandidateListCountW(HIMC hIMC, DWORD* pdwListSize, DWORD* pdwBufLen);
	HRESULT GetCandidateWindow(HIMC hIMC, DWORD dwIndex, CANDIDATEFORM* pCandidate);
	HRESULT GetCompositionFontA(HIMC hIMC, LOGFONTA* plf);
	HRESULT GetCompositionFontW(HIMC hIMC, LOGFONTW* plf);
	HRESULT GetCompositionStringA(HIMC hIMC, DWORD dwIndex, DWORD dwBufLen, LONG* plCopied, LPVOID pBuf);
	HRESULT GetCompositionStringW(HIMC hIMC, DWORD dwIndex, DWORD dwBufLen, LONG* plCopied, LPVOID pBuf);
	HRESULT GetCompositionWindow(HIMC hIMC, COMPOSITIONFORM* pCompForm);
	HRESULT GetContext(HWND hWnd, HIMC* phIMC);
	HRESULT GetConversionListA(HKL hKL, HIMC hIMC, LPSTR pSrc, UINT uBufLen, UINT uFlag, CANDIDATELIST* pDst, UINT* puCopied);
	HRESULT GetConversionListW(HKL hKL, HIMC hIMC, LPWSTR pSrc, UINT uBufLen, UINT uFlag, CANDIDATELIST* pDst, UINT* puCopied);
	HRESULT GetConversionStatus(HIMC hIMC, DWORD* pfdwConversion, DWORD* pfdwSentence);
	HRESULT GetDefaultIMEWnd(HWND hWnd, HWND* phDefWnd);
	HRESULT GetDescriptionA(HKL hKL, UINT uBufLen, LPSTR szDescription, UINT* puCopied);
	HRESULT GetDescriptionW(HKL hKL, UINT uBufLen, LPWSTR szDescription, UINT* puCopied);
	HRESULT GetGuideLineA(HIMC hIMC, DWORD dwIndex, DWORD dwBufLen, LPSTR pBuf, DWORD* pdwResult);
	HRESULT GetGuideLineW(HIMC hIMC, DWORD dwIndex, DWORD dwBufLen, LPWSTR pBuf, DWORD* pdwResult);
	HRESULT GetIMEFileNameA(HKL hKL, UINT uBufLen, LPSTR szFileName, UINT* puCopied);
	HRESULT GetIMEFileNameW(HKL hKL, UINT uBufLen, LPWSTR szFileName, UINT* puCopied);
	HRESULT GetOpenStatus(HIMC hIMC);
	HRESULT GetProperty(HKL hKL, DWORD fdwIndex, DWORD* pdwProperty);
	HRESULT GetRegisterWordStyleA(HKL hKL, UINT nItem, STYLEBUFA* pStyleBuf, UINT* puCopied);
	HRESULT GetRegisterWordStyleW(HKL hKL, UINT nItem, STYLEBUFW* pStyleBuf, UINT* puCopied);
	HRESULT GetStatusWindowPos(HIMC hIMC, POINT* pptPos);
	HRESULT GetVirtualKey(HWND hWnd, UINT* puVirtualKey);
	HRESULT InstallIMEA(LPSTR szIMEFileName, LPSTR szLayoutText, HKL* phKL);
	HRESULT InstallIMEW(LPWSTR szIMEFileName, LPWSTR szLayoutText, HKL* phKL);
	HRESULT IsIME(HKL hKL);
	HRESULT IsUIMessageA(HWND hWndIME, UINT msg, WPARAM wParam, LPARAM lParam);
	HRESULT IsUIMessageW(HWND hWndIME, UINT msg, WPARAM wParam, LPARAM lParam);
	HRESULT NotifyIME(HIMC hIMC, DWORD dwAction, DWORD dwIndex, DWORD dwValue);
	HRESULT RegisterWordA(HKL hKL, LPSTR szReading, DWORD dwStyle, LPSTR szRegister);
	HRESULT RegisterWordW(HKL hKL, LPWSTR szReading, DWORD dwStyle, LPWSTR szRegister);
	HRESULT ReleaseContext(HWND hWnd, HIMC hIMC);
	HRESULT SetCandidateWindow(HIMC hIMC, CANDIDATEFORM* pCandidate);
	HRESULT SetCompositionFontA(HIMC hIMC, LOGFONTA* plf);
	HRESULT SetCompositionFontW(HIMC hIMC, LOGFONTW* plf);
	HRESULT SetCompositionStringA(HIMC hIMC, DWORD dwIndex, LPVOID pComp, DWORD dwCompLen, LPVOID pRead, DWORD dwReadLen);
	HRESULT SetCompositionStringW(HIMC hIMC, DWORD dwIndex, LPVOID pComp, DWORD dwCompLen, LPVOID pRead, DWORD dwReadLen);
	HRESULT SetCompositionWindow(HIMC hIMC, COMPOSITIONFORM* pCompForm);
	HRESULT SetConversionStatus(HIMC hIMC, DWORD fdwConversion, DWORD fdwSentence);
	HRESULT SetOpenStatus(HIMC hIMC, BOOL fOpen);
	HRESULT SetStatusWindowPos(HIMC hIMC, POINT* pptPos);
	HRESULT SimulateHotKey(HWND hWnd, DWORD dwHotKeyID);
	HRESULT UnregisterWordA(HKL hKL, LPSTR szReading, DWORD dwStyle, LPSTR szUnregister);
	HRESULT UnregisterWordW(HKL hKL, LPWSTR szReading, DWORD dwStyle, LPWSTR szUnregister);
	HRESULT GenerateMessage(HIMC hIMC);
	HRESULT LockIMC(HIMC hIMC, INPUTCONTEXT** ppIMC);
	HRESULT UnlockIMC(HIMC hIMC);
	HRESULT GetIMCLockCount(HIMC hIMC, DWORD* pdwLockCount);
	HRESULT CreateIMCC(DWORD dwSize, HIMCC* phIMCC);
	HRESULT DestroyIMCC(HIMCC hIMCC);
	HRESULT LockIMCC(HIMCC hIMCC, void** ppv);
	HRESULT UnlockIMCC(HIMCC hIMCC);
	HRESULT ReSizeIMCC(HIMCC hIMCC, DWORD dwSize, HIMCC* phIMCC);
	HRESULT GetIMCCSize(HIMCC hIMCC, DWORD* pdwSize);
	HRESULT GetIMCCLockCount(HIMCC hIMCC, DWORD* pdwLockCount);
	HRESULT GetHotKey(DWORD dwHotKeyID, UINT* puModifiers, UINT* puVKey, HKL* phKL);
	HRESULT SetHotKey(DWORD dwHotKeyID, UINT uModifiers, UINT uVKey, HKL hKL);
	HRESULT CreateSoftKeyboard(UINT uType, HWND hOwner, int x, int y, HWND* phSoftKbdWnd);
	HRESULT DestroySoftKeyboard(HWND hSoftKbdWnd);
	HRESULT ShowSoftKeyboard(HWND hSoftKbdWnd, int nCmdShow);
	HRESULT GetCodePageA(HKL hKL, UINT* uCodePage);
	HRESULT GetLangId(HKL hKL, LANGID* plid);
	HRESULT KeybdEvent(LANGID lgidIME, BYTE bVk, BYTE bScan, DWORD dwFlags, DWORD dwExtraInfo);
	HRESULT LockModal();
	HRESULT UnlockModal();
	HRESULT AssociateContextEx(HWND hWnd, HIMC hIMC, DWORD dwFlags);
	HRESULT DisableIME(DWORD idThread);
	HRESULT GetImeMenuItemsA(HIMC hIMC, DWORD dwFlags, DWORD dwType, IMEMENUITEMINFOA* pImeParentMenu, IMEMENUITEMINFOA* pImeMenu, DWORD dwSize, DWORD* pdwResult);
	HRESULT GetImeMenuItemsW(HIMC hIMC, DWORD dwFlags, DWORD dwType, IMEMENUITEMINFOW* pImeParentMenu, IMEMENUITEMINFOW* pImeMenu, DWORD dwSize, DWORD* pdwResult);
	HRESULT EnumInputContext(DWORD idThread, IEnumInputContext* ppEnum);
	HRESULT RequestMessageA(HIMC hIMC, WPARAM wParam, LPARAM lParam, LRESULT* plResult);
	HRESULT RequestMessageW(HIMC hIMC, WPARAM wParam, LPARAM lParam, LRESULT* plResult);
	HRESULT SendIMCA(HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam, LRESULT* plResult);
	HRESULT SendIMCW(HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam, LRESULT* plResult);
	HRESULT IsSleeping();
}
mixin DEFINE_IID!(IActiveIMMIME, "08C03411-F96B-11d0-A475-00AA006BCC59");

//extern extern(C) const IID IID_IActiveIME;
interface IActiveIME : IUnknown {
public extern(Windows):
	HRESULT Inquire(DWORD dwSystemInfoFlags, IMEINFO* pIMEInfo, LPWSTR szWndClass, DWORD* pdwPrivate);
	HRESULT ConversionList(HIMC hIMC, LPWSTR szSource, UINT uFlag, UINT uBufLen, CANDIDATELIST* pDest, UINT* puCopied);
	HRESULT Configure(HKL hKL, HWND hWnd, DWORD dwMode, REGISTERWORDW* pRegisterWord);
	HRESULT Destroy(UINT uReserved);
	HRESULT Escape(HIMC hIMC, UINT uEscape, void* pData, LRESULT* plResult);
	HRESULT SetActiveContext(HIMC hIMC, BOOL fFlag);
	HRESULT ProcessKey(HIMC hIMC, UINT uVirKey, DWORD lParam, BYTE* pbKeyState);
	HRESULT Notify(HIMC hIMC, DWORD dwAction, DWORD dwIndex, DWORD dwValue);
	HRESULT Select(HIMC hIMC, BOOL fSelect);
	HRESULT SetCompositionString(HIMC hIMC, DWORD dwIndex, void* pComp, DWORD dwCompLen, void* pRead, DWORD dwReadLen);
	HRESULT ToAsciiEx(UINT uVirKey, UINT uScanCode, BYTE* pbKeyState, UINT fuState, HIMC hIMC, DWORD* pdwTransBuf, UINT* puSize);
	HRESULT RegisterWord(LPWSTR szReading, DWORD dwStyle, LPWSTR szString);
	HRESULT UnregisterWord(LPWSTR szReading, DWORD dwStyle, LPWSTR szString);
	HRESULT GetRegisterWordStyle(UINT nItem, STYLEBUFW* pStyleBuf, UINT* puBufSize);
	HRESULT EnumRegisterWord(LPWSTR szReading, DWORD dwStyle, LPWSTR szRegister, LPVOID pData, IEnumRegisterWordW* ppEnum);
	HRESULT GetCodePageA(UINT* uCodePage);
	HRESULT GetLangId(LANGID* plid);
}
mixin DEFINE_IID!(IActiveIME, "6FE20962-D077-11d0-8FE7-00AA006BCC59");

//extern extern(C) const IID IID_IActiveIME2;
interface IActiveIME2 : IActiveIME {
public extern(Windows):
	HRESULT Sleep();
	HRESULT Unsleep(BOOL fDead);
}
mixin DEFINE_IID!(IActiveIME2, "e1c4bf0e-2d53-11d2-93e1-0060b067b86e");

//extern extern(C) const CLSID CLSID_CActiveIMM;
mixin DEFINE_GUID!("CLSID_CActiveIMM", "4955DD33-B159-11d0-8FCF-00AA006BCC59");

}// extern(C)
