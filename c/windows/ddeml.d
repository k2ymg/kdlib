/** ddeml.d

Converted from 'ddeml.h'.

Version: V7.1
Authors: Koji Kishita
*/
module c.windows.ddeml;


import c.windows.windef;
import c.windows.winnt;


extern(C){

enum HCONVLIST : void* {init = (void*).init}
enum HCONV : void* {init = (void*).init}
enum HSZ : void* {init = (void*).init}
enum HDDEDATA : void* {init = (void*).init}

struct HSZPAIR {
	HSZ hszSvc;
	HSZ hszTopic;
}
alias HSZPAIR* PHSZPAIR;

struct CONVCONTEXT {
	UINT cb;
	UINT wFlags;
	UINT wCountryID;
	int iCodePage;
	DWORD dwLangID;
	DWORD dwSecurity;
	SECURITY_QUALITY_OF_SERVICE qos;
}
alias CONVCONTEXT* PCONVCONTEXT;

struct CONVINFO {
	DWORD cb;
	DWORD_PTR hUser;
	HCONV hConvPartner;
	HSZ hszSvcPartner;
	HSZ hszServiceReq;
	HSZ hszTopic;
	HSZ hszItem;
	UINT wFmt;
	UINT wType;
	UINT wStatus;
	UINT wConvst;
	UINT wLastError;
	HCONVLIST hConvList;
	CONVCONTEXT ConvCtxt;
	HWND hwnd;
	HWND hwndPartner;
}
alias CONVINFO* PCONVINFO;

enum {
	XST_NULL           = 0,
	XST_INCOMPLETE     = 1,
	XST_CONNECTED      = 2,
	XST_INIT1          = 3,
	XST_INIT2          = 4,
	XST_REQSENT        = 5,
	XST_DATARCVD       = 6,
	XST_POKESENT       = 7,
	XST_POKEACKRCVD    = 8,
	XST_EXECSENT       = 9,
	XST_EXECACKRCVD    = 10,
	XST_ADVSENT        = 11,
	XST_UNADVSENT      = 12,
	XST_ADVACKRCVD     = 13,
	XST_UNADVACKRCVD   = 14,
	XST_ADVDATASENT    = 15,
	XST_ADVDATAACKRCVD = 16,
}

enum CADV_LATEACK = 0xFFFF;

enum {
	ST_CONNECTED  = 0x0001,
	ST_ADVISE     = 0x0002,
	ST_ISLOCAL    = 0x0004,
	ST_BLOCKED    = 0x0008,
	ST_CLIENT     = 0x0010,
	ST_TERMINATED = 0x0020,
	ST_INLIST     = 0x0040,
	ST_BLOCKNEXT  = 0x0080,
	ST_ISSELF     = 0x0100,
}

enum {
	DDE_FACK          = 0x8000,
	DDE_FBUSY         = 0x4000,
	DDE_FDEFERUPD     = 0x4000,
	DDE_FACKREQ       = 0x8000,
	DDE_FRELEASE      = 0x2000,
	DDE_FREQUESTED    = 0x1000,
	DDE_FAPPSTATUS    = 0x00ff,
	DDE_FNOTPROCESSED = 0x0000,
	DDE_FACKRESERVED  = ~(DDE_FACK | DDE_FBUSY | DDE_FAPPSTATUS),
	DDE_FADVRESERVED  = ~(DDE_FACKREQ | DDE_FDEFERUPD),
	DDE_FDATRESERVED  = ~(DDE_FACKREQ | DDE_FRELEASE | DDE_FREQUESTED),
	DDE_FPOKRESERVED  = ~(DDE_FRELEASE),
}

enum MSGF_DDEMGR = 0x8001;

enum {
	CP_WINANSI    = 1004,
	CP_WINUNICODE = 1200,
}
version(UNICODE)
	alias CP_WINUNICODE CP_WINNEUTRAL;
else
	alias CP_WINANSI CP_WINNEUTRAL;

enum {
	XTYPF_NOBLOCK = 0x0002,
	XTYPF_NODATA  = 0x0004,
	XTYPF_ACKREQ  = 0x0008,
}

enum {
	XCLASS_MASK         = 0xFC00,
	XCLASS_BOOL         = 0x1000,
	XCLASS_DATA         = 0x2000,
	XCLASS_FLAGS        = 0x4000,
	XCLASS_NOTIFICATION = 0x8000,
}

enum {
	XTYP_ERROR           = 0x0000 | XCLASS_NOTIFICATION | XTYPF_NOBLOCK,
	XTYP_ADVDATA         = 0x0010 | XCLASS_FLAGS,
	XTYP_ADVREQ          = 0x0020 | XCLASS_DATA | XTYPF_NOBLOCK,
	XTYP_ADVSTART        = 0x0030 | XCLASS_BOOL,
	XTYP_ADVSTOP         = 0x0040 | XCLASS_NOTIFICATION,
	XTYP_EXECUTE         = 0x0050 | XCLASS_FLAGS,
	XTYP_CONNECT         = 0x0060 | XCLASS_BOOL | XTYPF_NOBLOCK,
	XTYP_CONNECT_CONFIRM = 0x0070 | XCLASS_NOTIFICATION | XTYPF_NOBLOCK,
	XTYP_XACT_COMPLETE   = 0x0080 | XCLASS_NOTIFICATION,
	XTYP_POKE            = 0x0090 | XCLASS_FLAGS,
	XTYP_REGISTER        = 0x00A0 | XCLASS_NOTIFICATION | XTYPF_NOBLOCK,
	XTYP_REQUEST         = 0x00B0 | XCLASS_DATA,
	XTYP_DISCONNECT      = 0x00C0 | XCLASS_NOTIFICATION | XTYPF_NOBLOCK,
	XTYP_UNREGISTER      = 0x00D0 | XCLASS_NOTIFICATION | XTYPF_NOBLOCK,
	XTYP_WILDCONNECT     = 0x00E0 | XCLASS_DATA | XTYPF_NOBLOCK,
}

enum XTYP_MASK = 0x00F0;
enum XTYP_SHIFT = 4;

enum TIMEOUT_ASYNC = 0xFFFFFFFF;

enum QID_SYNC = 0xFFFFFFFF;

version(UNICODE){
	enum : immutable(wchar*) {
		SZDDESYS_TOPIC         = "System",
		SZDDESYS_ITEM_TOPICS   = "Topics",
		SZDDESYS_ITEM_SYSITEMS = "SysItems",
		SZDDESYS_ITEM_RTNMSG   = "ReturnMessage",
		SZDDESYS_ITEM_STATUS   = "Status",
		SZDDESYS_ITEM_FORMATS  = "Formats",
		SZDDESYS_ITEM_HELP     = "Help",
		SZDDE_ITEM_ITEMLIST    = "TopicItemList",
	}
}else{
	enum : immutable(char*) {
		SZDDESYS_TOPIC         = "System",
		SZDDESYS_ITEM_TOPICS   = "Topics",
		SZDDESYS_ITEM_SYSITEMS = "SysItems",
		SZDDESYS_ITEM_RTNMSG   = "ReturnMessage",
		SZDDESYS_ITEM_STATUS   = "Status",
		SZDDESYS_ITEM_FORMATS  = "Formats",
		SZDDESYS_ITEM_HELP     = "Help",
		SZDDE_ITEM_ITEMLIST    = "TopicItemList",
	}
}

alias extern(Windows) HDDEDATA function(UINT wType, UINT wFmt, HCONV hConv, HSZ hsz1, HSZ hsz2, HDDEDATA hData, ULONG_PTR dwData1, ULONG_PTR dwData2) FNCALLBACK;
alias extern(Windows) HDDEDATA function(UINT wType, UINT wFmt, HCONV hConv, HSZ hsz1, HSZ hsz2, HDDEDATA hData, ULONG_PTR dwData1, ULONG_PTR dwData2) PFNCALLBACK;

enum HDDEDATA CBR_BLOCK = cast(HDDEDATA)-1;

export extern(Windows){
	UINT DdeInitializeA(LPDWORD pidInst, PFNCALLBACK pfnCallback, DWORD afCmd, DWORD ulRes);
	UINT DdeInitializeW(LPDWORD pidInst, PFNCALLBACK pfnCallback, DWORD afCmd, DWORD ulRes);
}
version(UNICODE)
	alias DdeInitializeW DdeInitialize;
else
	alias DdeInitializeA DdeInitialize;

enum {
	CBF_FAIL_SELFCONNECTIONS = 0x00001000,
	CBF_FAIL_CONNECTIONS     = 0x00002000,
	CBF_FAIL_ADVISES         = 0x00004000,
	CBF_FAIL_EXECUTES        = 0x00008000,
	CBF_FAIL_POKES           = 0x00010000,
	CBF_FAIL_REQUESTS        = 0x00020000,
	CBF_FAIL_ALLSVRXACTIONS  = 0x0003f000,

	CBF_SKIP_CONNECT_CONFIRMS = 0x00040000,
	CBF_SKIP_REGISTRATIONS    = 0x00080000,
	CBF_SKIP_UNREGISTRATIONS  = 0x00100000,
	CBF_SKIP_DISCONNECTS      = 0x00200000,
	CBF_SKIP_ALLNOTIFICATIONS = 0x003c0000,
}

enum {
	APPCMD_CLIENTONLY  = 0x00000010,
	APPCMD_FILTERINITS = 0x00000020,
	APPCMD_MASK        = 0x00000FF0,

	APPCLASS_STANDARD = 0x00000000,
	APPCLASS_MASK     = 0x0000000F,
}

export extern(Windows){
	BOOL DdeUninitialize(DWORD idInst);
	HCONVLIST DdeConnectList(DWORD idInst, HSZ hszService, HSZ hszTopic, HCONVLIST hConvList, PCONVCONTEXT pCC);
	HCONV DdeQueryNextServer(HCONVLIST hConvList, HCONV hConvPrev);
	BOOL DdeDisconnectList(HCONVLIST hConvList);
	HCONV DdeConnect(DWORD idInst, HSZ hszService, HSZ hszTopic, PCONVCONTEXT pCC);
	BOOL DdeDisconnect(HCONV hConv);
	HCONV DdeReconnect(HCONV hConv);
	UINT DdeQueryConvInfo(HCONV hConv, DWORD idTransaction, PCONVINFO pConvInfo);
	BOOL DdeSetUserHandle(HCONV hConv, DWORD id, DWORD_PTR hUser);
	BOOL DdeAbandonTransaction(DWORD idInst, HCONV hConv, DWORD idTransaction);
	BOOL DdePostAdvise(DWORD idInst, HSZ hszTopic, HSZ hszItem);
	BOOL DdeEnableCallback(DWORD idInst, HCONV hConv, UINT wCmd);
	BOOL DdeImpersonateClient(HCONV hConv);
}

enum {
	EC_ENABLEALL    = 0,
	EC_ENABLEONE    = ST_BLOCKNEXT,
	EC_DISABLE      = ST_BLOCKED,
	EC_QUERYWAITING = 2,
}

export extern(Windows)
HDDEDATA DdeNameService(DWORD idInst, HSZ hsz1, HSZ hsz2, UINT afCmd);

enum {
	DNS_REGISTER   = 0x0001,
	DNS_UNREGISTER = 0x0002,
	DNS_FILTERON   = 0x0004,
	DNS_FILTEROFF  = 0x0008,
}

export extern(Windows){
	HDDEDATA DdeClientTransaction(LPBYTE pData, DWORD cbData, HCONV hConv, HSZ hszItem, UINT wFmt, UINT wType, DWORD dwTimeout, LPDWORD pdwResult);
	HDDEDATA DdeCreateDataHandle(DWORD idInst, LPBYTE pSrc, DWORD cb, DWORD cbOff, HSZ hszItem, UINT wFmt, UINT afCmd);
	HDDEDATA DdeAddData(HDDEDATA hData, LPBYTE pSrc, DWORD cb, DWORD cbOff);
	DWORD DdeGetData(HDDEDATA hData, LPBYTE pDst, DWORD cbMax, DWORD cbOff);
	LPBYTE DdeAccessData(HDDEDATA hData, LPDWORD pcbDataSize);
	BOOL DdeUnaccessData(HDDEDATA hData);
	BOOL DdeFreeDataHandle(HDDEDATA hData);
}

enum HDATA_APPOWNED = 0x0001;

export extern(Windows)
UINT DdeGetLastError(DWORD idInst);

enum {
	DMLERR_NO_ERROR            = 0,
	DMLERR_FIRST               = 0x4000,
	DMLERR_ADVACKTIMEOUT       = 0x4000,
	DMLERR_BUSY                = 0x4001,
	DMLERR_DATAACKTIMEOUT      = 0x4002,
	DMLERR_DLL_NOT_INITIALIZED = 0x4003,
	DMLERR_DLL_USAGE           = 0x4004,
	DMLERR_EXECACKTIMEOUT      = 0x4005,
	DMLERR_INVALIDPARAMETER    = 0x4006,
	DMLERR_LOW_MEMORY          = 0x4007,
	DMLERR_MEMORY_ERROR        = 0x4008,
	DMLERR_NOTPROCESSED        = 0x4009,
	DMLERR_NO_CONV_ESTABLISHED = 0x400a,
	DMLERR_POKEACKTIMEOUT      = 0x400b,
	DMLERR_POSTMSG_FAILED      = 0x400c,
	DMLERR_REENTRANCY          = 0x400d,
	DMLERR_SERVER_DIED         = 0x400e,
	DMLERR_SYS_ERROR           = 0x400f,
	DMLERR_UNADVACKTIMEOUT     = 0x4010,
	DMLERR_UNFOUND_QUEUE_ID    = 0x4011,
	DMLERR_LAST                = 0x4011,
}

export extern(Windows){
	HSZ DdeCreateStringHandleA(DWORD idInst, LPCSTR psz, int iCodePage);
	HSZ DdeCreateStringHandleW(DWORD idInst, LPCWSTR psz, int iCodePage);
}
version(UNICODE)
	alias DdeCreateStringHandleW DdeCreateStringHandle;
else
	alias DdeCreateStringHandleA DdeCreateStringHandle;

export extern(Windows){
	DWORD DdeQueryStringA(DWORD idInst, HSZ hsz, LPSTR psz, DWORD cchMax, int iCodePage);
	DWORD DdeQueryStringW(DWORD idInst, HSZ hsz, LPWSTR psz, DWORD cchMax, int iCodePage);
}
version(UNICODE)
	alias DdeQueryStringW DdeQueryString;
else
	alias DdeQueryStringA DdeQueryString;

export extern(Windows){
	BOOL DdeFreeStringHandle(DWORD idInst, HSZ hsz);
	BOOL DdeKeepStringHandle(DWORD idInst, HSZ hsz);
	int DdeCmpStringHandles(HSZ hsz1, HSZ hsz2);
}

version(all){//NODDEMLSPY
	struct DDEML_MSG_HOOK_DATA {
		UINT_PTR uiLo;
		UINT_PTR uiHi;
		DWORD cbData;
		DWORD[8] Data;
	}
	alias DDEML_MSG_HOOK_DATA* PDDEML_MSG_HOOK_DATA;

	struct MONMSGSTRUCT {
		UINT cb;
		HWND hwndTo;
		DWORD dwTime;
		HANDLE hTask;
		UINT wMsg;
		WPARAM wParam;
		LPARAM lParam;
		DDEML_MSG_HOOK_DATA dmhd;
	}
	alias MONMSGSTRUCT* PMONMSGSTRUCT;

	struct MONCBSTRUCT {
		UINT cb;
		DWORD dwTime;
		HANDLE hTask;
		DWORD dwRet;
		UINT wType;
		UINT wFmt;
		HCONV hConv;
		HSZ hsz1;
		HSZ hsz2;
		HDDEDATA hData;
		ULONG_PTR dwData1;
		ULONG_PTR dwData2;
		CONVCONTEXT cc;
		DWORD cbData;
		DWORD[8] Data;
	}
	alias MONCBSTRUCT* PMONCBSTRUCT;

	struct MONHSZSTRUCTA {
		UINT cb;
		BOOL fsAction;
		DWORD dwTime;
		HSZ hsz;
		HANDLE hTask;
		CHAR[1] str;
	}
	alias MONHSZSTRUCTA* PMONHSZSTRUCTA;
	struct MONHSZSTRUCTW {
		UINT cb;
		BOOL fsAction;
		DWORD dwTime;
		HSZ hsz;
		HANDLE hTask;
		WCHAR[1] str;
	}
	alias MONHSZSTRUCTW* PMONHSZSTRUCTW;
	version(UNICODE){
		alias MONHSZSTRUCTW MONHSZSTRUCT;
		alias PMONHSZSTRUCTW PMONHSZSTRUCT;
	}else{
		alias MONHSZSTRUCTA MONHSZSTRUCT;
		alias PMONHSZSTRUCTA PMONHSZSTRUCT;
	}

	enum {
		MH_CREATE  = 1,
		MH_KEEP    = 2,
		MH_DELETE  = 3,
		MH_CLEANUP = 4,
	}

	struct MONERRSTRUCT {
		UINT cb;
		UINT wLastError;
		DWORD dwTime;
		HANDLE hTask;
	}
	alias MONERRSTRUCT* PMONERRSTRUCT;

	struct MONLINKSTRUCT {
		UINT cb;
		DWORD dwTime;
		HANDLE hTask;
		BOOL fEstablished;
		BOOL fNoData;
		HSZ hszSvc;
		HSZ hszTopic;
		HSZ hszItem;
		UINT wFmt;
		BOOL fServer;
		HCONV hConvServer;
		HCONV hConvClient;
	}
	alias MONLINKSTRUCT* PMONLINKSTRUCT;

	struct MONCONVSTRUCT {
		UINT cb;
		BOOL fConnect;
		DWORD dwTime;
		HANDLE hTask;
		HSZ hszSvc;
		HSZ hszTopic;
		HCONV hConvClient;
		HCONV hConvServer;
	}
	alias MONCONVSTRUCT* PMONCONVSTRUCT;

	enum {
		MAX_MONITORS     = 4,
		APPCLASS_MONITOR = 0x00000001,
		XTYP_MONITOR     = 0x00F0 | XCLASS_NOTIFICATION | XTYPF_NOBLOCK,
	}

	enum {
		MF_HSZ_INFO  = 0x01000000,
		MF_SENDMSGS  = 0x02000000,
		MF_POSTMSGS  = 0x04000000,
		MF_CALLBACKS = 0x08000000,
		MF_ERRORS    = 0x10000000,
		MF_LINKS     = 0x20000000,
		MF_CONV      = 0x40000000,
		MF_MASK      = 0xFF000000,
	}
}

}// extern(C)
