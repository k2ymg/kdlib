/** winscard.d

Converted from 'winscard.h'.

Version: V7.1
Authors: Koji Kishita
*/
module c.windows.winscard;


import c.windows.sdkddkver;
import c.windows.windef;
import c.windows.guiddef;
import c.windows.rpcdce;
import c.windows.winsmcrd;


//#include <wtypes.h>
//#include <winioctl.h>
//#include "winsmcrd.h"
//#ifndef SCARD_S_SUCCESS
//	#include "SCardErr.h" <--- 一緒に
//#endif

extern(C){

alias const(BYTE)* LPCBYTE;// -> to windef?
alias const(VOID)* LPCVOID;// -> to windef?


export const(SCARD_IO_REQUEST)
	g_rgSCardT0Pci,
	g_rgSCardT1Pci,
	g_rgSCardRawPci;
/*enum immutable(SCARD_IO_REQUEST*) SCARD_PCI_T0 = &g_rgSCardT0Pci; todo
enum immutable(SCARD_IO_REQUEST*) SCARD_PCI_T1 = &g_rgSCardT1Pci;
enum immutable(SCARD_IO_REQUEST*) SCARD_PCI_RAW = &g_rgSCardRawPci;*/


enum SCARDCONTEXT : ULONG_PTR {init = (ULONG_PTR).init}
alias SCARDCONTEXT* PSCARDCONTEXT;
alias SCARDCONTEXT* LPSCARDCONTEXT;

enum SCARDHANDLE : ULONG_PTR {init = (ULONG_PTR).init}
alias SCARDHANDLE* PSCARDHANDLE;
alias SCARDHANDLE* LPSCARDHANDLE;


enum DWORD SCARD_AUTOALLOCATE = -1;
enum {
	SCARD_SCOPE_USER     = 0,
	SCARD_SCOPE_TERMINAL = 1,
	SCARD_SCOPE_SYSTEM   = 2,
}

export extern(Windows){
	LONG SCardEstablishContext(DWORD dwScope, LPCVOID pvReserved1, LPCVOID pvReserved2, LPSCARDCONTEXT phContext);
	LONG SCardReleaseContext(SCARDCONTEXT hContext);
	LONG SCardIsValidContext(SCARDCONTEXT hContext);
}

version(UNICODE){
	enum : immutable(wchar*) {
		SCARD_ALL_READERS     = "SCard$AllReaders\000",
		SCARD_DEFAULT_READERS = "SCard$DefaultReaders\000",
		SCARD_LOCAL_READERS   = "SCard$LocalReaders\000",
		SCARD_SYSTEM_READERS  = "SCard$SystemReaders\000",
	}
}else{
	enum : immutable(char*) {
		SCARD_ALL_READERS     = "SCard$AllReaders\000",
		SCARD_DEFAULT_READERS = "SCard$DefaultReaders\000",
		SCARD_LOCAL_READERS   = "SCard$LocalReaders\000",
		SCARD_SYSTEM_READERS  = "SCard$SystemReaders\000",
	}
}
enum {
	SCARD_PROVIDER_PRIMARY = 1,
	SCARD_PROVIDER_CSP     = 2,
	SCARD_PROVIDER_KSP     = 3,
}

export extern(Windows){
	LONG SCardListReaderGroupsA(SCARDCONTEXT hContext, LPSTR mszGroups, LPDWORD pcchGroups);
	LONG SCardListReaderGroupsW(SCARDCONTEXT hContext, LPWSTR mszGroups, LPDWORD pcchGroups);
}
version(UNICODE)
	alias SCardListReaderGroupsW SCardListReaderGroups;
else
	alias SCardListReaderGroupsA SCardListReaderGroups;

export extern(Windows){
	LONG SCardListReadersA(SCARDCONTEXT hContext, LPCSTR mszGroups, LPSTR mszReaders, LPDWORD pcchReaders);
	LONG SCardListReadersW(SCARDCONTEXT hContext, LPCWSTR mszGroups, LPWSTR mszReaders, LPDWORD pcchReaders);
}
version(UNICODE)
	alias SCardListReadersW SCardListReaders;
else
	alias SCardListReadersA SCardListReaders;

export extern(Windows){
	LONG SCardListCardsA(SCARDCONTEXT hContext, LPCBYTE pbAtr, LPCGUID rgquidInterfaces, DWORD cguidInterfaceCount, LPSTR mszCards, LPDWORD pcchCards);
	LONG SCardListCardsW(SCARDCONTEXT hContext, LPCBYTE pbAtr, LPCGUID rgquidInterfaces, DWORD cguidInterfaceCount, LPWSTR mszCards, LPDWORD pcchCards);
}
version(UNICODE)
	alias SCardListCardsW SCardListCards;
else
	alias SCardListCardsA SCardListCards;
alias SCardListCards SCardListCardTypes;

export extern(Windows){
	LONG SCardListInterfacesA(SCARDCONTEXT hContext, LPCSTR szCard, LPGUID pguidInterfaces, LPDWORD pcguidInterfaces);
	LONG SCardListInterfacesW(SCARDCONTEXT hContext, LPCWSTR szCard, LPGUID pguidInterfaces, LPDWORD pcguidInterfaces);
}
version(UNICODE)
	alias SCardListInterfacesW SCardListInterfaces;
else
	alias SCardListInterfacesA SCardListInterfaces;

export extern(Windows){
	LONG SCardGetProviderIdA(SCARDCONTEXT hContext, LPCSTR szCard, LPGUID pguidProviderId);
	LONG SCardGetProviderIdW(SCARDCONTEXT hContext, LPCWSTR szCard, LPGUID pguidProviderId);
}
version(UNICODE)
	alias SCardGetProviderIdW SCardGetProviderId;
else
	alias SCardGetProviderIdA SCardGetProviderId;

export extern(Windows){
	LONG SCardGetCardTypeProviderNameA(SCARDCONTEXT hContext, LPCSTR szCardName, DWORD dwProviderId, LPSTR szProvider, LPDWORD pcchProvider);
	LONG SCardGetCardTypeProviderNameW(SCARDCONTEXT hContext, LPCWSTR szCardName, DWORD dwProviderId, LPWSTR szProvider, LPDWORD pcchProvider);
}
version(UNICODE)
	alias SCardGetCardTypeProviderNameW SCardGetCardTypeProviderName;
else
	alias SCardGetCardTypeProviderNameA SCardGetCardTypeProviderName;

export extern(Windows){
	LONG SCardIntroduceReaderGroupA(SCARDCONTEXT hContext, LPCSTR szGroupName);
	LONG SCardIntroduceReaderGroupW(SCARDCONTEXT hContext, LPCWSTR szGroupName);
}
version(UNICODE)
	alias SCardIntroduceReaderGroupW SCardIntroduceReaderGroup;
else
	alias SCardIntroduceReaderGroupA SCardIntroduceReaderGroup;

export extern(Windows){
	LONG SCardForgetReaderGroupA(SCARDCONTEXT hContext, LPCSTR szGroupName);
	LONG SCardForgetReaderGroupW(SCARDCONTEXT hContext, LPCWSTR szGroupName);
}
version(UNICODE)
	alias SCardForgetReaderGroupW SCardForgetReaderGroup;
else
	alias SCardForgetReaderGroupA SCardForgetReaderGroup;

export extern(Windows){
	LONG SCardIntroduceReaderA(SCARDCONTEXT hContext, LPCSTR szReaderName, LPCSTR szDeviceName);
	LONG SCardIntroduceReaderW(SCARDCONTEXT hContext, LPCWSTR szReaderName, LPCWSTR szDeviceName);
}
version(UNICODE)
	alias SCardIntroduceReaderW SCardIntroduceReader;
else
	alias SCardIntroduceReaderA SCardIntroduceReader;

export extern(Windows){
	LONG SCardForgetReaderA(SCARDCONTEXT hContext, LPCSTR szReaderName);
	LONG SCardForgetReaderW(SCARDCONTEXT hContext, LPCWSTR szReaderName);
}
version(UNICODE)
	alias SCardForgetReaderW SCardForgetReader;
else
	alias SCardForgetReaderA SCardForgetReader;

export extern(Windows){
	LONG SCardAddReaderToGroupA(SCARDCONTEXT hContext, LPCSTR szReaderName, LPCSTR szGroupName);
	LONG SCardAddReaderToGroupW(SCARDCONTEXT hContext, LPCWSTR szReaderName, LPCWSTR szGroupName);
}
version(UNICODE)
	alias SCardAddReaderToGroupW SCardAddReaderToGroup;
else
	alias SCardAddReaderToGroupA SCardAddReaderToGroup;

export extern(Windows){
	LONG SCardRemoveReaderFromGroupA(SCARDCONTEXT hContext, LPCSTR szReaderName, LPCSTR szGroupName);
	LONG SCardRemoveReaderFromGroupW(SCARDCONTEXT hContext, LPCWSTR szReaderName, LPCWSTR szGroupName);
}
version(UNICODE)
	alias SCardRemoveReaderFromGroupW SCardRemoveReaderFromGroup;
else
	alias SCardRemoveReaderFromGroupA SCardRemoveReaderFromGroup;

export extern(Windows){
	LONG SCardIntroduceCardTypeA(SCARDCONTEXT hContext, LPCSTR szCardName, LPCGUID pguidPrimaryProvider, LPCGUID rgguidInterfaces, DWORD dwInterfaceCount, LPCBYTE pbAtr, LPCBYTE pbAtrMask, DWORD cbAtrLen);
	LONG SCardIntroduceCardTypeW(SCARDCONTEXT hContext, LPCWSTR szCardName, LPCGUID pguidPrimaryProvider, LPCGUID rgguidInterfaces, DWORD dwInterfaceCount, LPCBYTE pbAtr, LPCBYTE pbAtrMask, DWORD cbAtrLen);
}
version(UNICODE)
	alias SCardIntroduceCardTypeW SCardIntroduceCardType;
else
	alias SCardIntroduceCardTypeA SCardIntroduceCardType;

LONG PCSCardIntroduceCardType(SCARDCONTEXT hContext, LPCTSTR szCardName, LPCBYTE pbAtr, LPCBYTE pbAtrMask, DWORD cbAtrLen, LPCGUID pguidPrimaryProvider, LPCGUID rgguidInterfaces, DWORD dwInterfaceCount)
{
	return SCardIntroduceCardType(hContext, szCardName, pguidPrimaryProvider, rgguidInterfaces, dwInterfaceCount, pbAtr, pbAtrMask, cbAtrLen);
}

export extern(Windows){
	LONG SCardSetCardTypeProviderNameA(SCARDCONTEXT hContext, LPCSTR szCardName, DWORD dwProviderId, LPCSTR szProvider);
	LONG SCardSetCardTypeProviderNameW(SCARDCONTEXT hContext, LPCWSTR szCardName, DWORD dwProviderId, LPCWSTR szProvider);
}
version(UNICODE)
	alias SCardSetCardTypeProviderNameW SCardSetCardTypeProviderName;
else
	alias SCardSetCardTypeProviderNameA SCardSetCardTypeProviderName;

export extern(Windows){
	LONG SCardForgetCardTypeA(SCARDCONTEXT hContext, LPCSTR szCardName);
	LONG SCardForgetCardTypeW(SCARDCONTEXT hContext, LPCWSTR szCardName);
}
version(UNICODE)
	alias SCardForgetCardTypeW SCardForgetCardType;
else
	alias SCardForgetCardTypeA SCardForgetCardType;

export extern(Windows){
	LONG SCardFreeMemory(SCARDCONTEXT hContext, LPCVOID pvMem);

	static if(NTDDI_VERSION >= NTDDI_WINXP){
		HANDLE SCardAccessStartedEvent();
		void SCardReleaseStartedEvent();
	}
}

struct SCARD_READERSTATEA {
	LPCSTR szReader;
	LPVOID pvUserData;
	DWORD dwCurrentState;
	DWORD dwEventState;
	DWORD cbAtr;
	BYTE[36] rgbAtr;
}
alias SCARD_READERSTATEA* PSCARD_READERSTATEA;
alias SCARD_READERSTATEA* LPSCARD_READERSTATEA;

struct SCARD_READERSTATEW {
	LPCWSTR szReader;
	LPVOID pvUserData;
	DWORD dwCurrentState;
	DWORD dwEventState;
	DWORD cbAtr;
	BYTE[36] rgbAtr;
}
alias SCARD_READERSTATEW* PSCARD_READERSTATEW;
alias SCARD_READERSTATEW* LPSCARD_READERSTATEW;

version(UNICODE){
	alias SCARD_READERSTATEW SCARD_READERSTATE;
	alias PSCARD_READERSTATEW PSCARD_READERSTATE;
	alias LPSCARD_READERSTATEW LPSCARD_READERSTATE;
}else{
	alias SCARD_READERSTATEA SCARD_READERSTATE;
	alias PSCARD_READERSTATEA PSCARD_READERSTATE;
	alias LPSCARD_READERSTATEA LPSCARD_READERSTATE;
}

alias SCARD_READERSTATEA SCARD_READERSTATE_A;
alias SCARD_READERSTATEW SCARD_READERSTATE_W;
alias PSCARD_READERSTATEA PSCARD_READERSTATE_A;
alias PSCARD_READERSTATEW PSCARD_READERSTATE_W;
alias LPSCARD_READERSTATEA LPSCARD_READERSTATE_A;
alias LPSCARD_READERSTATEW LPSCARD_READERSTATE_W;

enum {
	SCARD_STATE_UNAWARE     = 0x00000000,
	SCARD_STATE_IGNORE      = 0x00000001,
	SCARD_STATE_CHANGED     = 0x00000002,
	SCARD_STATE_UNKNOWN     = 0x00000004,
	SCARD_STATE_UNAVAILABLE = 0x00000008,
	SCARD_STATE_EMPTY       = 0x00000010,
	SCARD_STATE_PRESENT     = 0x00000020,
	SCARD_STATE_ATRMATCH    = 0x00000040,
	SCARD_STATE_EXCLUSIVE   = 0x00000080,
	SCARD_STATE_INUSE       = 0x00000100,
	SCARD_STATE_MUTE        = 0x00000200,
	SCARD_STATE_UNPOWERED   = 0x00000400,
}

export extern(Windows){
	LONG SCardLocateCardsA(SCARDCONTEXT hContext, LPCSTR mszCards, LPSCARD_READERSTATEA rgReaderStates, DWORD cReaders);
	LONG SCardLocateCardsW(SCARDCONTEXT hContext, LPCWSTR mszCards, LPSCARD_READERSTATEW rgReaderStates, DWORD cReaders);
}
version(UNICODE)
	alias SCardLocateCardsW SCardLocateCards;
else
	alias SCardLocateCardsA SCardLocateCards;


//(NTDDI_VERSION >= NTDDI_WINXP)
	struct SCARD_ATRMASK {
		DWORD cbAtr;
		BYTE[36] rgbAtr;
		BYTE[36] rgbMask;
	}
	alias SCARD_ATRMASK* PSCARD_ATRMASK;
	alias SCARD_ATRMASK* LPSCARD_ATRMASK;

	static if(NTDDI_VERSION >= NTDDI_WINXP){
		export extern(Windows){
			LONG SCardLocateCardsByATRA(SCARDCONTEXT hContext, LPSCARD_ATRMASK rgAtrMasks, DWORD cAtrs, LPSCARD_READERSTATEA rgReaderStates, DWORD cReaders);
			LONG SCardLocateCardsByATRW(SCARDCONTEXT hContext, LPSCARD_ATRMASK rgAtrMasks, DWORD cAtrs, LPSCARD_READERSTATEW rgReaderStates, DWORD cReaders);
		}
		version(UNICODE)
			alias SCardLocateCardsByATRW SCardLocateCardsByATR;
		else
			alias SCardLocateCardsByATRA SCardLocateCardsByATR;
	}

export extern(Windows){
	LONG SCardGetStatusChangeA(SCARDCONTEXT hContext, DWORD dwTimeout, LPSCARD_READERSTATEA rgReaderStates, DWORD cReaders);
	LONG SCardGetStatusChangeW(SCARDCONTEXT hContext, DWORD dwTimeout, LPSCARD_READERSTATEW rgReaderStates, DWORD cReaders);
}
version(UNICODE)
	alias SCardGetStatusChangeW SCardGetStatusChange;
else
	alias SCardGetStatusChangeA SCardGetStatusChange;

export extern(Windows) LONG SCardCancel(SCARDCONTEXT hContext);

enum {
	SCARD_SHARE_EXCLUSIVE = 1,
	SCARD_SHARE_SHARED    = 2,
	SCARD_SHARE_DIRECT    = 3,

	SCARD_LEAVE_CARD   = 0,
	SCARD_RESET_CARD   = 1,
	SCARD_UNPOWER_CARD = 2,
	SCARD_EJECT_CARD   = 3,
}

export extern(Windows){
	LONG SCardConnectA(SCARDCONTEXT hContext, LPCSTR szReader, DWORD dwShareMode, DWORD dwPreferredProtocols, LPSCARDHANDLE phCard, LPDWORD pdwActiveProtocol);
	LONG SCardConnectW(SCARDCONTEXT hContext, LPCWSTR szReader, DWORD dwShareMode, DWORD dwPreferredProtocols, LPSCARDHANDLE phCard, LPDWORD pdwActiveProtocol);
}
version(UNICODE)
	alias SCardConnectW SCardConnect;
else
	alias SCardConnectA SCardConnect;

export extern(Windows){
	LONG SCardReconnect(SCARDHANDLE hCard, DWORD dwShareMode, DWORD dwPreferredProtocols, DWORD dwInitialization, LPDWORD pdwActiveProtocol);
	LONG SCardDisconnect(SCARDHANDLE hCard, DWORD dwDisposition);
	LONG SCardBeginTransaction(SCARDHANDLE hCard);
	LONG SCardEndTransaction(SCARDHANDLE hCard, DWORD dwDisposition);
	LONG SCardCancelTransaction(SCARDHANDLE hCard);
	LONG SCardState(SCARDHANDLE hCard, LPDWORD pdwState, LPDWORD pdwProtocol, LPBYTE pbAtr, LPDWORD pcbAtrLen);
	LONG SCardStatusA(SCARDHANDLE hCard, LPSTR mszReaderNames, LPDWORD pcchReaderLen, LPDWORD pdwState, LPDWORD pdwProtocol, LPBYTE pbAtr, LPDWORD pcbAtrLen);
	LONG SCardStatusW(SCARDHANDLE hCard, LPWSTR mszReaderNames, LPDWORD pcchReaderLen, LPDWORD pdwState, LPDWORD pdwProtocol, LPBYTE pbAtr, LPDWORD pcbAtrLen);
}
version(UNICODE)
	alias SCardStatusW SCardStatus;
else
	alias SCardStatusA SCardStatus;

export extern(Windows){
	LONG SCardTransmit(SCARDHANDLE hCard, LPCSCARD_IO_REQUEST pioSendPci, LPCBYTE pbSendBuffer, DWORD cbSendLength, LPSCARD_IO_REQUEST pioRecvPci, LPBYTE pbRecvBuffer, LPDWORD pcbRecvLength);
	static if(NTDDI_VERSION >= NTDDI_VISTA)
		LONG SCardGetTransmitCount(SCARDHANDLE hCard, LPDWORD pcTransmitCount);
	LONG SCardControl(SCARDHANDLE hCard, DWORD dwControlCode, LPCVOID lpInBuffer, DWORD cbInBufferSize, LPVOID lpOutBuffer, DWORD cbOutBufferSize, LPDWORD lpBytesReturned);
	LONG SCardGetAttrib(SCARDHANDLE hCard, DWORD dwAttrId, LPBYTE pbAttr, LPDWORD pcbAttrLen);
	alias SCardGetAttrib SCardGetReaderCapabilities;
	LONG SCardSetAttrib(SCARDHANDLE hCard, DWORD dwAttrId, LPCBYTE pbAttr, DWORD cbAttrLen);
	alias SCardSetAttrib SCardSetReaderCapabilities;
}

enum {
	SC_DLG_MINIMAL_UI = 0x01,
	SC_DLG_NO_UI      = 0x02,
	SC_DLG_FORCE_UI   = 0x04,

	SCERR_NOCARDNAME = 0x4000,
	SCERR_NOGUIDS    = 0x8000,
}

alias SCARDHANDLE function(SCARDCONTEXT, LPSTR, LPSTR, PVOID) LPOCNCONNPROCA;
alias SCARDHANDLE function(SCARDCONTEXT, LPWSTR, LPWSTR, PVOID) LPOCNCONNPROCW;
version(UNICODE)
	alias LPOCNCONNPROCW LPOCNCONNPROC;
else
	alias LPOCNCONNPROCA LPOCNCONNPROC;
alias BOOL function(SCARDCONTEXT, SCARDHANDLE, PVOID) LPOCNCHKPROC;
alias void function(SCARDCONTEXT, SCARDHANDLE, PVOID) LPOCNDSCPROC;

struct OPENCARD_SEARCH_CRITERIAA {
	DWORD dwStructSize;
	LPSTR lpstrGroupNames;
	DWORD nMaxGroupNames;

	LPCGUID rgguidInterfaces;
	DWORD cguidInterfaces;
	LPSTR lpstrCardNames;
	DWORD nMaxCardNames;
	LPOCNCHKPROC lpfnCheck;
	LPOCNCONNPROCA lpfnConnect;
	LPOCNDSCPROC lpfnDisconnect;
	LPVOID pvUserData;
	DWORD dwShareMode;
	DWORD dwPreferredProtocols;
}
alias OPENCARD_SEARCH_CRITERIAA* POPENCARD_SEARCH_CRITERIAA;
alias OPENCARD_SEARCH_CRITERIAA* LPOPENCARD_SEARCH_CRITERIAA;

struct OPENCARD_SEARCH_CRITERIAW {
	DWORD dwStructSize;
	LPWSTR lpstrGroupNames;
	DWORD nMaxGroupNames;

	LPCGUID rgguidInterfaces;
	DWORD cguidInterfaces;
	LPWSTR lpstrCardNames;
	DWORD nMaxCardNames;
	LPOCNCHKPROC lpfnCheck;
	LPOCNCONNPROCW lpfnConnect;
	LPOCNDSCPROC lpfnDisconnect;
	LPVOID pvUserData;
	DWORD dwShareMode;
	DWORD dwPreferredProtocols;
}
alias OPENCARD_SEARCH_CRITERIAW* POPENCARD_SEARCH_CRITERIAW;
alias OPENCARD_SEARCH_CRITERIAW* LPOPENCARD_SEARCH_CRITERIAW;

version(UNICODE){
	alias OPENCARD_SEARCH_CRITERIAW OPENCARD_SEARCH_CRITERIA;
	alias POPENCARD_SEARCH_CRITERIAW POPENCARD_SEARCH_CRITERIA;
	alias LPOPENCARD_SEARCH_CRITERIAW LPOPENCARD_SEARCH_CRITERIA;
}else{
	alias OPENCARD_SEARCH_CRITERIAA OPENCARD_SEARCH_CRITERIA;
	alias POPENCARD_SEARCH_CRITERIAA POPENCARD_SEARCH_CRITERIA;
	alias LPOPENCARD_SEARCH_CRITERIAA LPOPENCARD_SEARCH_CRITERIA;
}

struct OPENCARDNAME_EXA {
	DWORD dwStructSize;
	SCARDCONTEXT hSCardContext;
	HWND hwndOwner;
	DWORD dwFlags;
	LPCSTR lpstrTitle;
	LPCSTR lpstrSearchDesc;
	HICON hIcon;
	POPENCARD_SEARCH_CRITERIAA pOpenCardSearchCriteria;
	LPOCNCONNPROCA lpfnConnect;
	LPVOID pvUserData;
	DWORD dwShareMode;
	DWORD dwPreferredProtocols;

	LPSTR lpstrRdr;
	DWORD nMaxRdr;
	LPSTR lpstrCard;
	DWORD nMaxCard;
	DWORD dwActiveProtocol;
	SCARDHANDLE hCardHandle;
}
alias OPENCARDNAME_EXA* POPENCARDNAME_EXA;
alias OPENCARDNAME_EXA* LPOPENCARDNAME_EXA;

struct OPENCARDNAME_EXW {
	DWORD dwStructSize;
	SCARDCONTEXT hSCardContext;
	HWND hwndOwner;
	DWORD dwFlags;
	LPCWSTR lpstrTitle;
	LPCWSTR lpstrSearchDesc;
	HICON hIcon;
	POPENCARD_SEARCH_CRITERIAW pOpenCardSearchCriteria;
	LPOCNCONNPROCW lpfnConnect;
	LPVOID pvUserData;
	DWORD dwShareMode;
	DWORD dwPreferredProtocols;

	LPWSTR lpstrRdr;
	DWORD nMaxRdr;
	LPWSTR lpstrCard;
	DWORD nMaxCard;
	DWORD dwActiveProtocol;
	SCARDHANDLE hCardHandle;
}
alias OPENCARDNAME_EXW* POPENCARDNAME_EXW;
alias OPENCARDNAME_EXW* LPOPENCARDNAME_EXW;

version(UNICODE){
	alias OPENCARDNAME_EXW OPENCARDNAME_EX;
	alias POPENCARDNAME_EXW POPENCARDNAME_EX;
	alias LPOPENCARDNAME_EXW LPOPENCARDNAME_EX;
}else{
	alias OPENCARDNAME_EXA OPENCARDNAME_EX;
	alias POPENCARDNAME_EXA POPENCARDNAME_EX;
	alias LPOPENCARDNAME_EXA LPOPENCARDNAME_EX;
}

alias OPENCARDNAME_EXA OPENCARDNAMEA_EX;
alias OPENCARDNAME_EXW OPENCARDNAMEW_EX;
alias POPENCARDNAME_EXA POPENCARDNAMEA_EX;
alias POPENCARDNAME_EXW POPENCARDNAMEW_EX;
alias LPOPENCARDNAME_EXA LPOPENCARDNAMEA_EX;
alias LPOPENCARDNAME_EXW LPOPENCARDNAMEW_EX;

export extern(Windows){
	LONG SCardUIDlgSelectCardA(LPOPENCARDNAMEA_EX);
	LONG SCardUIDlgSelectCardW(LPOPENCARDNAMEW_EX);
}
version(UNICODE)
	alias SCardUIDlgSelectCardW SCardUIDlgSelectCard;
else
	alias SCardUIDlgSelectCardA SCardUIDlgSelectCard;

struct OPENCARDNAMEA {
	DWORD dwStructSize;
	HWND hwndOwner;
	SCARDCONTEXT hSCardContext;
	LPSTR lpstrGroupNames;
	DWORD nMaxGroupNames;
	LPSTR lpstrCardNames;
	DWORD nMaxCardNames;
	LPCGUID rgguidInterfaces;
	DWORD cguidInterfaces;
	LPSTR lpstrRdr;
	DWORD nMaxRdr;
	LPSTR lpstrCard;
	DWORD nMaxCard;
	LPCSTR lpstrTitle;
	DWORD dwFlags;
	LPVOID pvUserData;
	DWORD dwShareMode;
	DWORD dwPreferredProtocols;
	DWORD dwActiveProtocol;
	LPOCNCONNPROCA lpfnConnect;
	LPOCNCHKPROC lpfnCheck;
	LPOCNDSCPROC lpfnDisconnect;
	SCARDHANDLE hCardHandle;
}
alias OPENCARDNAMEA* POPENCARDNAMEA;
alias OPENCARDNAMEA* LPOPENCARDNAMEA;

struct OPENCARDNAMEW {
	DWORD dwStructSize;
	HWND hwndOwner;
	SCARDCONTEXT hSCardContext;
	LPWSTR lpstrGroupNames;
	DWORD nMaxGroupNames;
	LPWSTR lpstrCardNames;
	DWORD nMaxCardNames;
	LPCGUID rgguidInterfaces;
	DWORD cguidInterfaces;
	LPWSTR lpstrRdr;
	DWORD nMaxRdr;
	LPWSTR lpstrCard;
	DWORD nMaxCard;
	LPCWSTR lpstrTitle;
	DWORD dwFlags;
	LPVOID pvUserData;
	DWORD dwShareMode;
	DWORD dwPreferredProtocols;
	DWORD dwActiveProtocol;
	LPOCNCONNPROCW lpfnConnect;
	LPOCNCHKPROC lpfnCheck;
	LPOCNDSCPROC lpfnDisconnect;
	SCARDHANDLE hCardHandle;
}
alias OPENCARDNAMEW* POPENCARDNAMEW;
alias OPENCARDNAMEW* LPOPENCARDNAMEW;
version(UNICODE){
	alias OPENCARDNAMEW OPENCARDNAME;
	alias POPENCARDNAMEW POPENCARDNAME;
	alias LPOPENCARDNAMEW LPOPENCARDNAME;
}else{
	alias OPENCARDNAMEA OPENCARDNAME;
	alias POPENCARDNAMEA POPENCARDNAME;
	alias LPOPENCARDNAMEA LPOPENCARDNAME;
}

alias OPENCARDNAMEA OPENCARDNAME_A;
alias OPENCARDNAMEW OPENCARDNAME_W;
alias POPENCARDNAMEA POPENCARDNAME_A;
alias POPENCARDNAMEW POPENCARDNAME_W;
alias LPOPENCARDNAMEA LPOPENCARDNAME_A;
alias LPOPENCARDNAMEW LPOPENCARDNAME_W;

export extern(Windows){
	LONG GetOpenCardNameA(LPOPENCARDNAMEA);
	LONG GetOpenCardNameW(LPOPENCARDNAMEW);
}
version(UNICODE)
	alias GetOpenCardNameW GetOpenCardName;
else
	alias GetOpenCardNameA GetOpenCardName;

export extern(Windows) LONG SCardDlgExtendedError();

static if(NTDDI_VERSION >= NTDDI_VISTA){
	export extern(Windows){
		LONG SCardReadCacheA(SCARDCONTEXT hContext, UUID* CardIdentifier, DWORD FreshnessCounter, LPSTR LookupName, PBYTE Data, DWORD* DataLen);
		LONG SCardReadCacheW(SCARDCONTEXT hContext, UUID* CardIdentifier, DWORD FreshnessCounter, LPWSTR LookupName, PBYTE Data, DWORD* DataLen);
	}
	version(UNICODE)
		alias SCardReadCacheW SCardReadCache;
	else
		alias SCardReadCacheA SCardReadCache;

	export extern(Windows){
		LONG SCardWriteCacheA(SCARDCONTEXT hContext, UUID* CardIdentifier, DWORD FreshnessCounter, LPSTR LookupName, PBYTE Data, DWORD DataLen);
		LONG SCardWriteCacheW(SCARDCONTEXT hContext, UUID* CardIdentifier, DWORD FreshnessCounter, LPWSTR LookupName, PBYTE Data, DWORD DataLen);
	}
	version(UNICODE)
		alias SCardWriteCacheW SCardWriteCache;
	else
		alias SCardWriteCacheA SCardWriteCache;
}

}// extern(C)
