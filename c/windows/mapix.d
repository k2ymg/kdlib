/** mapix.d

Converted from 'mapix.h'.

Version: V7.1
Authors: Koji Kishita
*/
module c.windows.mapix;


import c.windows.windef;
import c.windows.unknwn;
import c.windows.wtypes;
import c.windows.mapidefs;


extern(C){

alias IProfAdmin LPPROFADMIN;
alias IMsgServiceAdmin LPSERVICEADMIN;
alias IMAPISession LPMAPISESSION;

alias ULONG FLAGS;

enum {
	MAPI_LOGON_UI          = 0x00000001,
	MAPI_NEW_SESSION       = 0x00000002,
	MAPI_ALLOW_OTHERS      = 0x00000008,
	MAPI_EXPLICIT_PROFILE  = 0x00000010,
	MAPI_EXTENDED          = 0x00000020,
	MAPI_FORCE_DOWNLOAD    = 0x00001000,
	MAPI_SERVICE_UI_ALWAYS = 0x00002000,
	MAPI_NO_MAIL           = 0x00008000,
	MAPI_PASSWORD_UI       = 0x00020000,
	MAPI_TIMEOUT_SHORT     = 0x00100000,

	MAPI_SIMPLE_DEFAULT    = MAPI_LOGON_UI | MAPI_FORCE_DOWNLOAD | MAPI_ALLOW_OTHERS,
	MAPI_SIMPLE_EXPLICIT   = MAPI_NEW_SESSION | MAPI_FORCE_DOWNLOAD | MAPI_EXPLICIT_PROFILE,
}

struct MAPIINIT_0 {
	ULONG ulVersion;
	ULONG ulFlags;
}
alias MAPIINIT_0* LPMAPIINIT_0;
alias MAPIINIT_0 MAPIINIT;
alias MAPIINIT* LPMAPIINIT;

enum MAPI_INIT_VERSION = 0;

enum MAPI_MULTITHREAD_NOTIFICATIONS = 0x00000001;

alias extern(Windows) HRESULT function(LPVOID lpMapiInit) MAPIINITIALIZE;
alias MAPIINITIALIZE LPMAPIINITIALIZE;

alias extern(Windows) void function() MAPIUNINITIALIZE;
alias MAPIUNINITIALIZE LPMAPIUNINITIALIZE;

//MAPIINITIALIZE MAPIInitialize;
//MAPIUNINITIALIZE MAPIUninitialize;

alias extern(Windows) HRESULT function(ULONG_PTR ulUIParam, LPTSTR lpszProfileName, LPTSTR lpszPassword, ULONG ulFlags, LPMAPISESSION* lppSession) MAPILOGONEX;
alias MAPILOGONEX LPMAPILOGONEX;

//MAPILOGONEX MAPILogonEx;

alias extern(Windows) SCODE function(ULONG cbSize, LPVOID* lppBuffer) MAPIALLOCATEBUFFER;
alias extern(Windows) SCODE function(ULONG cbSize, LPVOID lpObject, LPVOID* lppBuffer) MAPIALLOCATEMORE;
alias extern(Windows) ULONG function(LPVOID lpBuffer) MAPIFREEBUFFER;
alias MAPIALLOCATEBUFFER LPMAPIALLOCATEBUFFER;
alias MAPIALLOCATEMORE LPMAPIALLOCATEMORE;
alias MAPIFREEBUFFER LPMAPIFREEBUFFER;

//MAPIALLOCATEBUFFER MAPIAllocateBuffer;
//MAPIALLOCATEMORE MAPIAllocateMore;
//MAPIFREEBUFFER MAPIFreeBuffer;

alias extern(Windows) HRESULT function(ULONG ulFlags, LPPROFADMIN* lppProfAdmin) MAPIADMINPROFILES;
alias MAPIADMINPROFILES LPMAPIADMINPROFILES;

//MAPIADMINPROFILES MAPIAdminProfiles;

enum  {
	MAPI_LOGOFF_SHARED = 0x00000001,
	MAPI_LOGOFF_UI     = 0x00000002,

	MAPI_DEFAULT_STORE          = 0x00000001,
	MAPI_SIMPLE_STORE_TEMPORARY = 0x00000002,
	MAPI_SIMPLE_STORE_PERMANENT = 0x00000003,
	MAPI_PRIMARY_STORE          = 0x00000004,
	MAPI_SECONDARY_STORE        = 0x00000005,

	MAPI_POST_MESSAGE = 0x00000001,
	MAPI_NEW_MESSAGE  = 0x00000002,
}

interface IMAPISession : IUnknown {
public extern(Windows):
	HRESULT GetLastError(HRESULT hResult, ULONG ulFlags, LPMAPIERROR* lppMAPIError);
	HRESULT GetMsgStoresTable(ULONG ulFlags, LPMAPITABLE* lppTable);
	HRESULT OpenMsgStore(ULONG_PTR ulUIParam, ULONG cbEntryID, LPENTRYID lpEntryID, LPCIID lpInterface, ULONG ulFlags, LPMDB* lppMDB);
	HRESULT OpenAddressBook(ULONG_PTR ulUIParam, LPCIID lpInterface, ULONG ulFlags, LPADRBOOK* lppAdrBook);
	HRESULT OpenProfileSection(LPMAPIUID lpUID, LPCIID lpInterface, ULONG ulFlags, LPPROFSECT* ppProfSect);
	HRESULT GetStatusTable(ULONG ulFlags, LPMAPITABLE* lppTable);
	HRESULT OpenEntry(ULONG cbEntryID, LPENTRYID lpEntryID, LPCIID lpInterface, ULONG ulFlags, ULONG* lpulObjType, LPUNKNOWN* lppUnk);
	HRESULT CompareEntryIDs(ULONG cbEntryID1, LPENTRYID lpEntryID1, ULONG cbEntryID2, LPENTRYID lpEntryID2, ULONG ulFlags, ULONG* lpulResult);
	HRESULT Advise(ULONG cbEntryID, LPENTRYID lpEntryID, ULONG ulEventMask, LPMAPIADVISESINK lpAdviseSink, ULONG* lpulConnection);
	HRESULT Unadvise(ULONG ulConnection);
	HRESULT MessageOptions(ULONG_PTR ulUIParam, ULONG ulFlags, LPTSTR lpszAdrType, LPMESSAGE lpMessage);
	HRESULT QueryDefaultMessageOpt(LPTSTR lpszAdrType, ULONG ulFlags, ULONG* lpcValues, LPSPropValue* lppOptions);
	HRESULT EnumAdrTypes(ULONG ulFlags, ULONG* lpcAdrTypes, LPTSTR** lpppszAdrTypes);
	HRESULT QueryIdentity(ULONG* lpcbEntryID, LPENTRYID* lppEntryID);
	HRESULT Logoff(ULONG_PTR ulUIParam, ULONG ulFlags, ULONG ulReserved);
	HRESULT SetDefaultStore(ULONG ulFlags, ULONG cbEntryID, LPENTRYID lpEntryID);
	HRESULT AdminServices(ULONG ulFlags, LPSERVICEADMIN* lppServiceAdmin);
	HRESULT ShowForm(ULONG_PTR ulUIParam, LPMDB lpMsgStore, LPMAPIFOLDER lpParentFolder, LPCIID lpInterface, ULONG ulMessageToken, LPMESSAGE lpMessageSent, ULONG ulFlags, ULONG ulMessageStatus, ULONG ulMessageFlags, ULONG ulAccess, LPSTR lpszMessageClass);
	HRESULT PrepareForm(LPCIID lpInterface, LPMESSAGE lpMessage, ULONG* lpulMessageToken);
}

interface IAddrBook : IMAPIProp {
public extern(Windows):
	 HRESULT OpenEntry(ULONG cbEntryID, LPENTRYID lpEntryID, LPCIID lpInterface, ULONG ulFlags, ULONG* lpulObjType, LPUNKNOWN* lppUnk);
	 HRESULT CompareEntryIDs(ULONG cbEntryID1, LPENTRYID lpEntryID1, ULONG cbEntryID2, LPENTRYID lpEntryID2, ULONG ulFlags, ULONG* lpulResult);
	 HRESULT Advise(ULONG cbEntryID, LPENTRYID lpEntryID, ULONG ulEventMask, LPMAPIADVISESINK lpAdviseSink, ULONG* lpulConnection);
	 HRESULT Unadvise(ULONG ulConnection);
	 HRESULT CreateOneOff(LPTSTR lpszName, LPTSTR lpszAdrType, LPTSTR lpszAddress, ULONG ulFlags, ULONG* lpcbEntryID, LPENTRYID* lppEntryID);
	 HRESULT NewEntry(ULONG_PTR ulUIParam, ULONG ulFlags, ULONG cbEIDContainer, LPENTRYID lpEIDContainer, ULONG cbEIDNewEntryTpl, LPENTRYID lpEIDNewEntryTpl, ULONG* lpcbEIDNewEntry, LPENTRYID* lppEIDNewEntry);
	 HRESULT ResolveName(ULONG_PTR ulUIParam, ULONG ulFlags, LPTSTR lpszNewEntryTitle, LPADRLIST lpAdrList);
	 HRESULT Address(ULONG_PTR* lpulUIParam, LPADRPARM lpAdrParms, LPADRLIST* lppAdrList);
	 HRESULT Details(ULONG* lpulUIParam, LPFNDISMISS lpfnDismiss, LPVOID lpvDismissContext, ULONG cbEntryID, LPENTRYID lpEntryID, LPFNBUTTON lpfButtonCallback, LPVOID lpvButtonContext, LPTSTR lpszButtonText, ULONG ulFlags);
	 HRESULT RecipOptions(ULONG_PTR ulUIParam, ULONG ulFlags, LPADRENTRY lpRecip);
	 HRESULT QueryDefaultRecipOpt(LPTSTR lpszAdrType, ULONG ulFlags, ULONG* lpcValues, LPSPropValue* lppOptions);
	 HRESULT GetPAB(ULONG* lpcbEntryID, LPENTRYID* lppEntryID);
	 HRESULT SetPAB(ULONG cbEntryID, LPENTRYID lpEntryID);
	 HRESULT GetDefaultDir(ULONG* lpcbEntryID, LPENTRYID* lppEntryID);
	 HRESULT SetDefaultDir(ULONG cbEntryID, LPENTRYID lpEntryID);
	 HRESULT GetSearchPath(ULONG ulFlags, LPSRowSet* lppSearchPath);
	 HRESULT SetSearchPath(ULONG ulFlags, LPSRowSet lpSearchPath);
	 HRESULT PrepareRecips(ULONG ulFlags, LPSPropTagArray lpPropTagArray, LPADRLIST lpRecipList);
}
alias IAddrBook LPADRBOOK;

enum MAPI_DEFAULT_SERVICES = 0x00000001;

interface IProfAdmin : IUnknown {
public extern(Windows):
	HRESULT GetLastError(HRESULT hResult, ULONG ulFlags, LPMAPIERROR* lppMAPIError);
	HRESULT GetProfileTable(ULONG ulFlags, LPMAPITABLE* lppTable);
	HRESULT CreateProfile(LPTSTR lpszProfileName, LPTSTR lpszPassword, ULONG_PTR ulUIParam, ULONG ulFlags);
	HRESULT DeleteProfile(LPTSTR lpszProfileName, ULONG ulFlags);
	HRESULT ChangeProfilePassword(LPTSTR lpszProfileName, LPTSTR lpszOldPassword, LPTSTR lpszNewPassword, ULONG ulFlags);
	HRESULT CopyProfile(LPTSTR lpszOldProfileName, LPTSTR lpszOldPassword, LPTSTR lpszNewProfileName, ULONG_PTR ulUIParam, ULONG ulFlags);
	HRESULT RenameProfile(LPTSTR lpszOldProfileName, LPTSTR lpszOldPassword, LPTSTR lpszNewProfileName, ULONG_PTR ulUIParam, ULONG ulFlags);
	HRESULT SetDefaultProfile(LPTSTR lpszProfileName, ULONG ulFlags);
	HRESULT AdminServices(LPTSTR lpszProfileName, LPTSTR lpszPassword, ULONG_PTR ulUIParam, ULONG ulFlags, LPSERVICEADMIN* lppServiceAdmin);
}

enum {
	SERVICE_DEFAULT_STORE       = 0x00000001,
	SERVICE_SINGLE_COPY         = 0x00000002,
	SERVICE_CREATE_WITH_STORE   = 0x00000004,
	SERVICE_PRIMARY_IDENTITY    = 0x00000008,
	SERVICE_NO_PRIMARY_IDENTITY = 0x00000020,
}

interface IMsgServiceAdmin : IUnknown {
public extern(Windows):
	HRESULT GetLastError(HRESULT hResult, ULONG ulFlags, LPMAPIERROR* lppMAPIError);
	HRESULT GetMsgServiceTable(ULONG ulFlags, LPMAPITABLE* lppTable);
	HRESULT CreateMsgService(LPTSTR lpszService, LPTSTR lpszDisplayName, ULONG_PTR ulUIParam, ULONG ulFlags);
	HRESULT DeleteMsgService(LPMAPIUID lpUID);
	HRESULT CopyMsgService(LPMAPIUID lpUID, LPTSTR lpszDisplayName, LPCIID lpInterfaceToCopy, LPCIID lpInterfaceDst, LPVOID lpObjectDst, ULONG_PTR ulUIParam, ULONG ulFlags);
	HRESULT RenameMsgService(LPMAPIUID lpUID, ULONG ulFlags, LPTSTR lpszDisplayName);
	HRESULT ConfigureMsgService(LPMAPIUID lpUID, ULONG_PTR ulUIParam, ULONG ulFlags, ULONG cValues, LPSPropValue lpProps);
	HRESULT OpenProfileSection(LPMAPIUID lpUID, LPCIID lpInterface,  ULONG ulFlags, LPPROFSECT* lppProfSect);
	HRESULT MsgServiceTransportOrder(ULONG cUID, LPMAPIUID lpUIDList, ULONG ulFlags);
	HRESULT AdminProviders(LPMAPIUID lpUID, ULONG ulFlags, LPPROVIDERADMIN* lppProviderAdmin);
	HRESULT SetPrimaryIdentity(LPMAPIUID lpUID, ULONG ulFlags);
	HRESULT GetProviderTable(ULONG ulFlags, LPMAPITABLE* lppTable);
}

}// extern(C)
