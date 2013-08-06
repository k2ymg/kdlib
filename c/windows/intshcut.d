/** intshcut.d

Converted from 'intshcut.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.intshcut;


import c.windows.windef;
import c.windows.winerror;
import c.windows.guiddef;
import c.windows.unknwn;


extern(C){

enum {
	E_FLAGS                     = MAKE_SCODE(SEVERITY_ERROR, FACILITY_ITF, 0x1000),
	IS_E_EXEC_FAILED            = MAKE_SCODE(SEVERITY_ERROR, FACILITY_ITF, 0x2002),
	URL_E_INVALID_SYNTAX        = MAKE_SCODE(SEVERITY_ERROR, FACILITY_ITF, 0x1001),
	URL_E_UNREGISTERED_PROTOCOL = MAKE_SCODE(SEVERITY_ERROR, FACILITY_ITF, 0x1002),
}

enum {
	IURL_SETURL_FL_GUESS_PROTOCOL       = 0x0001,
	IURL_SETURL_FL_USE_DEFAULT_PROTOCOL = 0x0002,
}
alias int IURL_SETURL_FLAGS;

enum {
	IURL_INVOKECOMMAND_FL_ALLOW_UI         = 0x0001,
	IURL_INVOKECOMMAND_FL_USE_DEFAULT_VERB = 0x0002,
	IURL_INVOKECOMMAND_FL_DDEWAIT          = 0x0004,
	IURL_INVOKECOMMAND_FL_ASYNCOK          = 0x0008,
}
alias int IURL_INVOKECOMMAND_FLAGS;

struct URLINVOKECOMMANDINFOA {
	DWORD dwcbSize;
	DWORD dwFlags;
	HWND hwndParent;
	LPCSTR pcszVerb;
}
alias URLINVOKECOMMANDINFOA* PURLINVOKECOMMANDINFOA;
alias const(URLINVOKECOMMANDINFOA) CURLINVOKECOMMANDINFOA;
alias const(URLINVOKECOMMANDINFOA)* PCURLINVOKECOMMANDINFOA;

struct URLINVOKECOMMANDINFOW {
	DWORD dwcbSize;
	DWORD dwFlags;
	HWND hwndParent;
	LPCWSTR pcszVerb;
}
alias URLINVOKECOMMANDINFOW* PURLINVOKECOMMANDINFOW;
alias const(URLINVOKECOMMANDINFOW) CURLINVOKECOMMANDINFOW;
alias const(URLINVOKECOMMANDINFOW)* PCURLINVOKECOMMANDINFOW;

version(UNICODE){
	alias URLINVOKECOMMANDINFOW URLINVOKECOMMANDINFO;
	alias PURLINVOKECOMMANDINFOW PURLINVOKECOMMANDINFO;
	alias CURLINVOKECOMMANDINFOW CURLINVOKECOMMANDINFO;
	alias PCURLINVOKECOMMANDINFOW PCURLINVOKECOMMANDINFO;
}else{
	alias URLINVOKECOMMANDINFOA URLINVOKECOMMANDINFO;
	alias PURLINVOKECOMMANDINFOA PURLINVOKECOMMANDINFO;
	alias CURLINVOKECOMMANDINFOA CURLINVOKECOMMANDINFO;
	alias PCURLINVOKECOMMANDINFOA PCURLINVOKECOMMANDINFO;
}

interface IUniformResourceLocatorA : IUnknown {
public extern(Windows):
	HRESULT SetURL(LPCSTR pcszURL, DWORD dwInFlags);
	HRESULT GetURL(LPSTR* ppszURL);
	HRESULT InvokeCommand(PURLINVOKECOMMANDINFOA purlici);
}
mixin DEFINE_IID!(IUniformResourceLocatorA, "fbf23b80-e3f0-101b-8488-00aa003e56f8");

interface IUniformResourceLocatorW : IUnknown {
public extern(Windows):
	HRESULT SetURL(LPCWSTR pcszURL, DWORD dwInFlags);
	HRESULT GetURL(LPWSTR* ppszURL);
	HRESULT InvokeCommand(PURLINVOKECOMMANDINFOW purlici);
}
mixin DEFINE_IID!(IUniformResourceLocatorW, "cabb0da0-da57-11cf-9974-0020afd79762");

version(UNICODE){
	alias IUniformResourceLocatorW IUniformResourceLocator;
}else{
	alias IUniformResourceLocatorA IUniformResourceLocator;
}
alias IUniformResourceLocator PIUniformResourceLocator;
alias const(IUniformResourceLocator) CIUniformResourceLocator;
alias const(IUniformResourceLocator) PCIUniformResourceLocator;

enum {
	TRANSLATEURL_FL_GUESS_PROTOCOL       = 0x0001,
	TRANSLATEURL_FL_USE_DEFAULT_PROTOCOL = 0x0002,
}
alias int TRANSLATEURL_IN_FLAGS;

export extern(Windows) HRESULT TranslateURLA(PCSTR pcszURL, DWORD dwInFlags, PSTR* ppszTranslatedURL);
export extern(Windows) HRESULT TranslateURLW(PCWSTR pcszURL, DWORD dwInFlags, PWSTR* ppszTranslatedURL);
version(UNICODE)
	alias TranslateURLW TranslateURL;
else
	alias TranslateURLA TranslateURL;

enum {
	URLASSOCDLG_FL_USE_DEFAULT_NAME = 0x0001,
	URLASSOCDLG_FL_REGISTER_ASSOC   = 0x0002
}
alias int URLASSOCIATIONDIALOG_IN_FLAGS;

export extern(Windows) HRESULT URLAssociationDialogA(HWND hwndParent, DWORD dwInFlags, PCSTR pcszFile, PCSTR pcszURL, PSTR pszAppBuf, UINT ucAppBufLen);
export extern(Windows) HRESULT URLAssociationDialogW(HWND hwndParent, DWORD dwInFlags, PCWSTR pcszFile, PCWSTR pcszURL, PWSTR pszAppBuf, UINT ucAppBufLen);
version(UNICODE)
	alias URLAssociationDialogW URLAssociationDialog;
else
	alias URLAssociationDialogA URLAssociationDialog;

enum {
	MIMEASSOCDLG_FL_REGISTER_ASSOC = 0x0001
}
alias int MIMEASSOCIATIONDIALOG_IN_FLAGS;

export extern(Windows) HRESULT MIMEAssociationDialogA(HWND hwndParent, DWORD dwInFlags, PCSTR pcszFile, PCSTR pcszMIMEContentType, PSTR pszAppBuf, UINT ucAppBufLen);
export extern(Windows) HRESULT MIMEAssociationDialogW(HWND hwndParent, DWORD dwInFlags, PCWSTR pcszFile, PCWSTR pcszMIMEContentType, PWSTR pszAppBuf, UINT ucAppBufLen);
version(UNICODE)
	alias MIMEAssociationDialogW MIMEAssociationDialog;
else
	alias MIMEAssociationDialogA MIMEAssociationDialog;

export extern(Windows) BOOL InetIsOffline(DWORD dwFlags);

} // extern(C)
