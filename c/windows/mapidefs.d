/** mapidefs.d

Converted from 'mapidefs.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.mapidefs;


import c.windows.guiddef;
import c.windows.windef;
import c.windows.unknwn;
import c.windows.wtypes;
import c.windows.mapix;
import std.c.string;


enum MAPI_DIM = 1;
enum ULONG MAPI_NT_SERVICE = 0x00010000;

extern(C){

alias ULONG* LPULONG;

alias ULONG_PTR LHANDLE;
alias ULONG_PTR* LPLHANDLE;

enum : ULONG {
	MAPI_MODIFY                   = 0x00000001,
	MAPI_ACCESS_MODIFY            = 0x00000001,
	MAPI_ACCESS_READ              = 0x00000002,
	MAPI_ACCESS_DELETE            = 0x00000004,
	MAPI_ACCESS_CREATE_HIERARCHY  = 0x00000008,
	MAPI_ACCESS_CREATE_CONTENTS   = 0x00000010,
	MAPI_ACCESS_CREATE_ASSOCIATED = 0x00000020,
	MAPI_UNICODE                  = 0x80000000,
}

version(UNICODE)
	enum fMapiUnicode = MAPI_UNICODE;
else
	enum fMapiUnicode = 0;
enum hrSuccess = 0;

enum {
	MAPI_ORIG      = 0,
	MAPI_TO        = 1,
	MAPI_CC        = 2,
	MAPI_BCC       = 3,
	MAPI_P1        = 0x10000000,
	MAPI_SUBMITTED = 0x80000000,
}
enum {
	MAPI_SHORTTERM   = 0x80,
	MAPI_NOTRECIP    = 0x40,
	MAPI_THISSESSION = 0x20,
	MAPI_NOW         = 0x10,
	MAPI_NOTRESERVED = 0x08,
	MAPI_COMPOUND    = 0x80,
}

struct ENTRYID {
	BYTE[4] abFlags;
	BYTE[MAPI_DIM] ab;
}
alias ENTRYID* LPENTRYID;

// CbNewENTRYID(_cb) -> ENTRYID._cb.offsetof + _cb
// CbENTRYID(_cb)    -> ENTRYID._cb.offsetof + _cb
// SizedENTRYID(_cb, _name) -> struct _ENTRYID_ ## _name { BYTE abFlags[4]; BYTE ab[_cb]; } _name

struct MAPIUID {
	BYTE[16] ab;
}
alias MAPIUID* LPMAPIUID;

bool IsEqualMAPIUID(const(MAPIUID)* lpuid1, const(MAPIUID)* lpuid2)
{
	return !memcmp(lpuid1, lpuid2, MAPIUID.sizeof);
}

//MAPI_ONE_OFF_UID {0x81, 0x2b, 0x1f, 0xa4, 0xbe, 0xa3, 0x10, 0x19, 0x9d, 0x6e, 0x00, 0xdd, 0x01, 0x0f, 0x54, 0x02 }
enum MAPI_ONE_OFF_UNICODE = 0x8000;
enum MAPI_ONE_OFF_NO_RICH_INFO = 0x0001;

enum : ULONG {
	MAPI_STORE    = 0x00000001,
	MAPI_ADDRBOOK = 0x00000002,
	MAPI_FOLDER   = 0x00000003,
	MAPI_ABCONT   = 0x00000004,
	MAPI_MESSAGE  = 0x00000005,
	MAPI_MAILUSER = 0x00000006,
	MAPI_ATTACH   = 0x00000007,
	MAPI_DISTLIST = 0x00000008,
	MAPI_PROFSECT = 0x00000009,
	MAPI_STATUS   = 0x0000000A,
	MAPI_SESSION  = 0x0000000B,
	MAPI_FORMINFO = 0x0000000C,
}

enum {
	cchProfileNameMax = 64,
	cchProfilePassMax = 64,
}

enum MV_FLAG = 0x1000;

enum : ULONG {
	PT_UNSPECIFIED = 0,
	PT_NULL        = 1,
	PT_I2          = 2,
	PT_LONG        = 3,
	PT_R4          = 4,
	PT_DOUBLE      = 5,
	PT_CURRENCY    = 6,
	PT_APPTIME     = 7,
	PT_ERROR       = 10,
	PT_BOOLEAN     = 11,
	PT_OBJECT      = 13,
	PT_I8          = 20,
	PT_STRING8     = 30,
	PT_UNICODE     = 31,
	PT_SYSTIME     = 64,
	PT_CLSID       = 72,
	PT_BINARY      = 258,
}
enum {
	PT_SHORT    = PT_I2,
	PT_I4       = PT_LONG,
	PT_FLOAT    = PT_R4,
	PT_R8       = PT_DOUBLE,
	PT_LONGLONG = PT_I8,
}

version(UNICODE){
	enum PT_TSTRING = PT_UNICODE;
	enum PT_MV_TSTRING = MV_FLAG | PT_UNICODE;
	//alias lpszW LPSZ; access it directly.
	//alias lppszW LPPSZ;
	//alias MVszW MVSZ;
}else{
	enum PT_TSTRING = PT_STRING8;
	enum PT_MV_TSTRING = MV_FLAG | PT_STRING8;
	//alias lpszA LPSZ;
	//alias lppszA LPPSZ;
	//alias MVszA MVSZ;
}

enum ULONG PROP_TYPE_MASK = 0x0000FFFF;

pure
ULONG PROP_TYPE(ULONG ulPropTag)
{
	return ulPropTag & PROP_TYPE_MASK;
}

pure
ULONG PROP_ID(ULONG ulPropTag)
{
	return ulPropTag >> 16;
}

pure
ULONG PROP_TAG(ULONG ulPropType, ULONG ulPropID)
{
	return (ulPropID << 16) | ulPropType;
}

enum PROP_ID_NULL = 0;
enum PROP_ID_INVALID = 0xFFFF;
enum PR_NULL = PROP_TAG(PT_NULL, PROP_ID_NULL);

pure
LONG CHANGE_PROP_TYPE(ULONG ulPropTag, ULONG ulPropType)
{
	return (0xFFFF0000 & ulPropTag) | ulPropType;
}

enum {
	PT_MV_I2       = MV_FLAG | PT_I2,
	PT_MV_LONG     = MV_FLAG | PT_LONG,
	PT_MV_R4       = MV_FLAG | PT_R4,
	PT_MV_DOUBLE   = MV_FLAG | PT_DOUBLE,
	PT_MV_CURRENCY = MV_FLAG | PT_CURRENCY,
	PT_MV_APPTIME  = MV_FLAG | PT_APPTIME,
	PT_MV_SYSTIME  = MV_FLAG | PT_SYSTIME,
	PT_MV_STRING8  = MV_FLAG | PT_STRING8,
	PT_MV_BINARY   = MV_FLAG | PT_BINARY,
	PT_MV_UNICODE  = MV_FLAG | PT_UNICODE,
	PT_MV_CLSID    = MV_FLAG | PT_CLSID,
	PT_MV_I8       = MV_FLAG | PT_I8,
}
enum {
	PT_MV_SHORT    = PT_MV_I2,
	PT_MV_I4       = PT_MV_LONG,
	PT_MV_FLOAT    = PT_MV_R4,
	PT_MV_R8       = PT_MV_DOUBLE,
	PT_MV_LONGLONG = PT_MV_I8,
}

enum {
	MV_INSTANCE = 0x2000,
	MVI_FLAG    = MV_FLAG | MV_INSTANCE,
}

pure
int MVI_PROP(int tag)
{
	return tag | MVI_FLAG;
}

struct SPropTagArray {
	ULONG cValues;
	ULONG[MAPI_DIM] aulPropTag;
}
alias SPropTagArray* LPSPropTagArray;

// CbNewSPropTagArray(_ctag) -> SPropTagArray.aulPropTag.offsetof + _ctag * ULONG.sizeof;
// CbSPropTagArray(int _lparray) -> SPropTagArray.aulPropTag.offsetof + _lparray.cValues * ULONG.sizeof
// SizedSPropTagArray(_ctag, _name) struct _SPropTagArray_ ## _name { ULONG cValues; ULONG aulPropTag[_ctag]; } _name

alias CY CURRENCY;

struct SBinary {
	ULONG cb;
	LPBYTE lpb;
}
alias SBinary* LPSBinary;

struct SShortArray {
	ULONG cValues;
	short* lpi;
}

struct SGuidArray {
	ULONG cValues;
	GUID* lpguid;
}

struct SRealArray {
	ULONG cValues;
	float *lpflt;
}

struct SLongArray {
	ULONG cValues;
	LONG* lpl;
}

struct SLargeIntegerArray {
	ULONG cValues;
	LARGE_INTEGER* lpli;
}

struct SDateTimeArray {
	ULONG cValues;
	FILETIME* lpft;
}

struct SAppTimeArray {
	ULONG cValues;
	double* lpat;
}

struct SCurrencyArray {
	ULONG cValues;
	CURRENCY* lpcur;
}

struct SBinaryArray {
	ULONG cValues;
	SBinary* lpbin;
}

struct SDoubleArray {
	ULONG cValues;
	double* lpdbl;
}

struct SWStringArray {
	ULONG cValues;
	LPWSTR* lppszW;
}

struct SLPSTRArray {
	ULONG cValues;
	LPSTR* lppszA;
}

union __UPV {
	short i;
	LONG l;
	ULONG ul;
	float flt;
	double dbl;
	ushort b;
	CURRENCY cur;
	double at;
	FILETIME ft;
	LPSTR lpszA;
	SBinary bin;
	LPWSTR lpszW;
	LPGUID lpguid;
	LARGE_INTEGER li;
	SShortArray MVi;
	SLongArray MVl;
	SRealArray MVflt;
	SDoubleArray MVdbl;
	SCurrencyArray MVcur;
	SAppTimeArray MVat;
	SDateTimeArray MVft;
	SBinaryArray MVbin;
	SLPSTRArray MVszA;
	SWStringArray MVszW;
	SGuidArray MVguid;
	SLargeIntegerArray MVli;
	SCODE err;
	LONG x;
}

struct SPropValue {
	ULONG ulPropTag;
	ULONG dwAlignPad;
	__UPV Value;
}
alias SPropValue* LPSPropValue;

struct SPropProblem {
	ULONG ulIndex;
	ULONG ulPropTag;
	SCODE scode;
}
alias SPropProblem* LPSPropProblem;

struct SPropProblemArray {
	ULONG cProblem;
	SPropProblem[MAPI_DIM] aProblem;
}
alias SPropProblemArray* LPSPropProblemArray;

// CbNewSPropProblemArray(_cprob) -> SPropProblemArray.aProblem.offsetof + _cprob * SPropProblem.sizeof
// CbSPropProblemArray(_lparray) -> SPropProblemArray.aProblem.offsetof + _lparray.cProblem * SPropProblem.sizeof
// SizedSPropProblemArray(_cprob, _name) -> struct _SPropProblemArray_ ## _name { ULONG cProblem; SPropProblem aProblem[_cprob]; } _name

alias SBinaryArray ENTRYLIST;
alias ENTRYLIST* LPENTRYLIST;

struct FLATENTRY {
	ULONG cb;
	BYTE[MAPI_DIM] abEntry;
}
alias FLATENTRY* LPFLATENTRY;

struct FLATENTRYLIST {
	ULONG cEntries;
	ULONG cbEntries;
	BYTE[MAPI_DIM] abEntries;
}
alias FLATENTRYLIST* LPFLATENTRYLIST;

struct MTSID {
	ULONG cb;
	BYTE[MAPI_DIM] ab;
}
alias MTSID* LPMTSID;

struct FLATMTSIDLIST {
	ULONG cMTSIDs;
	ULONG cbMTSIDs;
	BYTE[MAPI_DIM] abMTSIDs;
}
alias FLATMTSIDLIST* LPFLATMTSIDLIST;

/*
CbNewFLATENTRY(_cb) -> FLATENTRY.abEntry.offsetof + _cb
CbFLATENTRY(_lpentry) -> FLATENTRY.abEntry.offsetof + _lpentry.cb
CbNewFLATENTRYLIST(_cb) -> FLATENTRYLIST.abEntries + _cb
CbFLATENTRYLIST(_lplist) -> FLATENTRYLIST.abEntries.offsetof + _lplist.cbEntries
CbNewMTSID(_cb) -> MTSID.ab.offsetof + _cb
CbMTSID(_lpentry) -> MTSID.ab.offsetof + _lpentry.cb
CbNewFLATMTSIDLIST(_cb) -> FLATMTSIDLIST.abMTSIDs.offsetof + _cb
CbFLATMTSIDLIST(_lplist) -> FLATMTSIDLIST.abMTSIDs + _lplist.cbMTSIDs
*/

struct ADRENTRY {
	ULONG ulReserved1;
	ULONG cValues;
	LPSPropValue rgPropVals;
}
alias ADRENTRY* LPADRENTRY;

struct ADRLIST {
	ULONG cEntries;
	ADRENTRY[MAPI_DIM] aEntries;
}
alias ADRLIST* LPADRLIST;

/*
CbNewADRLIST(_centries) -> ADRLIST.aEntries.offsetof + _centries * ADRENTRY.sizeof
CbADRLIST(_lpadrlist) -> ADRLIST.aEntries.offsetof + _lpadrlist.cEntries * ADRENTRY.sizeof
SizedADRLIST(_centries, _name) -> struct _ADRLIST_ ## _name { ULONG cEntries; ADRENTRY aEntries[_centries]; } _name
*/

struct SRow {
	ULONG ulAdrEntryPad;
	ULONG cValues;
	LPSPropValue lpProps;
}
alias SRow* LPSRow;

struct SRowSet {
	ULONG cRows;
	SRow[MAPI_DIM] aRow;
}
alias SRowSet* LPSRowSet;

/*
CbNewSRowSet(_crow) -> SRowSet.aRow.offsetof + _crow * SRow.sizeof
CbSRowSet(_lprowset) -> SRowSet.aRow.sizeof + _lprowset.cRows * SRow.sizeof
SizedSRowSet(_crow, _name) struct _SRowSet_ ## _name { ULONG cRows; SRow aRow[_crow]; } _name
*/

alias extern(Windows) SCODE function(ULONG cbSize, LPVOID* lppBuffer) ALLOCATEBUFFER;
alias extern(Windows) SCODE function(ULONG cbSize, LPVOID lpObject, LPVOID* lppBuffer) ALLOCATEMORE;
alias extern(Windows) ULONG function(LPVOID lpBuffer) FREEBUFFER;

alias ALLOCATEBUFFER LPALLOCATEBUFFER;
alias ALLOCATEMORE LPALLOCATEMORE;
alias FREEBUFFER LPFREEBUFFER;

alias const(IID)* LPCIID;

alias IMsgStore LPMDB;
alias IMAPIFolder LPMAPIFOLDER;
alias IMessage LPMESSAGE;
alias IAttach LPATTACH;
alias IAddrBook LPADRBOOK;
alias IABContainer LPABCONT;
alias IMailUser LPMAILUSER;
alias IDistList LPDISTLIST;
alias IMAPIStatus LPMAPISTATUS;
alias IMAPITable LPMAPITABLE;
alias IProfSect LPPROFSECT;
alias IMAPIProp LPMAPIPROP;
alias IMAPIContainer LPMAPICONTAINER;
alias IMAPIAdviseSink LPMAPIADVISESINK;
alias IMAPIProgress LPMAPIPROGRESS;
alias IProviderAdmin LPPROVIDERADMIN;

struct MAPIERROR {
	ULONG ulVersion;
	LPTSTR lpszError;
	LPTSTR lpszComponent;
	ULONG ulLowLevelError;
	ULONG ulContext;
}
alias MAPIERROR* LPMAPIERROR;

enum : ULONG {
	fnevCriticalError        = 0x00000001,
	fnevNewMail              = 0x00000002,
	fnevObjectCreated        = 0x00000004,
	fnevObjectDeleted        = 0x00000008,
	fnevObjectModified       = 0x00000010,
	fnevObjectMoved          = 0x00000020,
	fnevObjectCopied         = 0x00000040,
	fnevSearchComplete       = 0x00000080,
	fnevTableModified        = 0x00000100,
	fnevStatusObjectModified = 0x00000200,
	fnevReservedForMapi      = 0x40000000,
	fnevExtended             = 0x80000000,
}

enum {
	TABLE_CHANGED       = 1,
	TABLE_ERROR         = 2,
	TABLE_ROW_ADDED     = 3,
	TABLE_ROW_DELETED   = 4,
	TABLE_ROW_MODIFIED  = 5,
	TABLE_SORT_DONE     = 6,
	TABLE_RESTRICT_DONE = 7,
	TABLE_SETCOL_DONE   = 8,
	TABLE_RELOAD        = 9,
}

struct ERROR_NOTIFICATION {
	ULONG cbEntryID;
	LPENTRYID lpEntryID;
	SCODE scode;
	ULONG ulFlags;
	LPMAPIERROR lpMAPIError;
}

struct NEWMAIL_NOTIFICATION {
	ULONG cbEntryID;
	LPENTRYID lpEntryID;
	ULONG cbParentID;
	LPENTRYID lpParentID;
	ULONG ulFlags;
	LPTSTR lpszMessageClass;
	ULONG ulMessageFlags;
}

struct OBJECT_NOTIFICATION {
	ULONG cbEntryID;
	LPENTRYID lpEntryID;
	ULONG ulObjType;
	ULONG cbParentID;
	LPENTRYID lpParentID;
	ULONG cbOldID;
	LPENTRYID lpOldID;
	ULONG cbOldParentID;
	LPENTRYID lpOldParentID;
	LPSPropTagArray lpPropTagArray;
}

struct TABLE_NOTIFICATION {
	ULONG ulTableEvent;
	HRESULT hResult;
	SPropValue propIndex;
	SPropValue propPrior;
	SRow row;
	ULONG ulPad;
}

struct EXTENDED_NOTIFICATION {
	ULONG ulEvent;
	ULONG cb;
	LPBYTE pbEventParameters;
}

struct STATUS_OBJECT_NOTIFICATION {
	ULONG cbEntryID;
	LPENTRYID lpEntryID;
	ULONG cValues;
	LPSPropValue lpPropVals;
}

struct NOTIFICATION {
	ULONG ulEventType;
	ULONG ulAlignPad;
	union info_ {
		ERROR_NOTIFICATION err;
		NEWMAIL_NOTIFICATION newmail;
		OBJECT_NOTIFICATION obj;
		TABLE_NOTIFICATION tab;
		EXTENDED_NOTIFICATION ext;
		STATUS_OBJECT_NOTIFICATION statobj;
	}
	info_ info;
}
alias NOTIFICATION* LPNOTIFICATION;

interface IMAPIAdviseSink : IUnknown {
public extern(Windows):
	ULONG OnNotify(ULONG cNotif, LPNOTIFICATION lpNotifications);
}

alias extern(Windows) int function(LPVOID lpvContext, ULONG cNotification, LPNOTIFICATION lpNotifications) NOTIFCALLBACK;
alias NOTIFCALLBACK LPNOTIFCALLBACK;

enum immutable(char)* szMAPINotificationMsg = "MAPI Notify window message\0";

enum ULONG MAPI_TOP_LEVEL = 0x00000001;

interface IMAPIProgress : IUnknown {
public extern(Windows):
	HRESULT Progress(ULONG ulValue, ULONG ulCount, ULONG ulTotal);
	HRESULT GetFlags(ULONG* lpulFlags);
	HRESULT GetMax(ULONG* lpulMax);
	HRESULT GetMin(ULONG* lpulMin);
	HRESULT SetLimits(LPULONG lpulMin, LPULONG lpulMax, LPULONG lpulFlags);
}

enum MAPI_ERROR_VERSION = 0x00000000;

enum : ULONG {
	KEEP_OPEN_READONLY  = 0x00000001,
	KEEP_OPEN_READWRITE = 0x00000002,
	FORCE_SAVE          = 0x00000004,
	MAPI_CREATE         = 0x00000002,
	STREAM_APPEND       = 0x00000004,
	MAPI_MOVE           = 0x00000001,
	MAPI_NOREPLACE      = 0x00000002,
	MAPI_DECLINE_OK     = 0x00000004,
	MAPI_DIALOG         = 0x00000008,
}

enum MAPI_USE_DEFAULT = 0x00000040;

enum : ULONG {
	MAPI_NO_STRINGS = 0x00000001,
	MAPI_NO_IDS     = 0x00000002,
}

enum {
	MNID_ID     = 0,
	MNID_STRING = 1,
}

struct MAPINAMEID {
	LPGUID lpguid;
	ULONG ulKind;
	union Kind_ {
		LONG lID;
		LPWSTR lpwstrName;
	}
	Kind_ Kind;
}
alias MAPINAMEID* LPMAPINAMEID;

interface IMAPIProp : IUnknown {
public extern(Windows):
	HRESULT GetLastError(HRESULT hResult, ULONG ulFlags, LPMAPIERROR* lppMAPIError);
	HRESULT SaveChanges(ULONG ulFlags);
	HRESULT GetProps(LPSPropTagArray lpPropTagArray, ULONG ulFlags, ULONG* lpcValues, LPSPropValue* lppPropArray);
	HRESULT GetPropList(ULONG ulFlags, LPSPropTagArray* lppPropTagArray);
	HRESULT OpenProperty(ULONG ulPropTag, LPCIID lpiid, ULONG ulInterfaceOptions, ULONG ulFlags, LPUNKNOWN* lppUnk);
	HRESULT SetProps(ULONG cValues, LPSPropValue lpPropArray, LPSPropProblemArray* lppProblems);
	HRESULT DeleteProps(LPSPropTagArray lpPropTagArray, LPSPropProblemArray* lppProblems);
	HRESULT CopyTo(ULONG ciidExclude, LPCIID rgiidExclude, LPSPropTagArray lpExcludeProps, ULONG ulUIParam, LPMAPIPROGRESS lpProgress, LPCIID lpInterface, LPVOID lpDestObj, ULONG ulFlags, LPSPropProblemArray* lppProblems);
	HRESULT CopyProps(LPSPropTagArray lpIncludeProps, ULONG ulUIParam, LPMAPIPROGRESS lpProgress, LPCIID lpInterface, LPVOID lpDestObj, ULONG ulFlags, LPSPropProblemArray* lppProblems);
	HRESULT GetNamesFromIDs(LPSPropTagArray* lppPropTags, LPGUID lpPropSetGuid, ULONG ulFlags, ULONG* lpcPropNames, LPMAPINAMEID** lpppPropNames);
	HRESULT GetIDsFromNames(ULONG cPropNames, LPMAPINAMEID* lppPropNames, ULONG ulFlags, LPSPropTagArray* lppPropTags);
}

enum : ULONG {
	TBLSTAT_COMPLETE       = 0,
	TBLSTAT_QCHANGED       = 7,
	TBLSTAT_SORTING        = 9,
	TBLSTAT_SORT_ERROR     = 10,
	TBLSTAT_SETTING_COLS   = 11,
	TBLSTAT_SETCOL_ERROR   = 13,
	TBLSTAT_RESTRICTING    = 14,
	TBLSTAT_RESTRICT_ERROR = 15,
}
enum : ULONG {
	TBLTYPE_SNAPSHOT = 0,
	TBLTYPE_KEYSET   = 1,
	TBLTYPE_DYNAMIC  = 2,
}
enum : ULONG {
	TABLE_SORT_ASCEND  = 0x00000000,
	TABLE_SORT_DESCEND = 0x00000001,
	TABLE_SORT_COMBINE = 0x00000002,
}

struct SSortOrder {
	ULONG ulPropTag;
	ULONG ulOrder;
}
alias SSortOrder* LPSSortOrder;

struct SSortOrderSet {
	ULONG cSorts;
	ULONG cCategories;
	ULONG cExpanded;
	SSortOrder[MAPI_DIM] aSort;
}
alias SSortOrderSet* LPSSortOrderSet;

// CbNewSSortOrderSet(_csort) -> SSortOrderSet.aSort.offsetof + _csort * SSortOrder.sizeof
// CbSSortOrderSet(_lpset) -> SSortOrderSet.aSort.sizeof + _lpset.cSorts * SSortOrder.sizeof
// SizedSSortOrderSet(_csort, _name) struct _SSortOrderSet_ ## _name { ULONG cSorts; ULONG cCategories; ULONG cExpanded; SSortOrder aSort[_csort];} _name

alias ULONG BOOKMARK;

enum : BOOKMARK {
	BOOKMARK_BEGINNING = 0,
	BOOKMARK_CURRENT   = 1,
	BOOKMARK_END       = 2,
}

enum : ULONG {
	FL_FULLSTRING     = 0x00000000,
	FL_SUBSTRING      = 0x00000001,
	FL_PREFIX         = 0x00000002,

	FL_IGNORECASE     = 0x00010000,
	FL_IGNORENONSPACE = 0x00020000,
	FL_LOOSE          = 0x00040000,
}

enum : ULONG {
	RES_AND            = 0x00000000,
	RES_OR             = 0x00000001,
	RES_NOT            = 0x00000002,
	RES_CONTENT        = 0x00000003,
	RES_PROPERTY       = 0x00000004,
	RES_COMPAREPROPS   = 0x00000005,
	RES_BITMASK        = 0x00000006,
	RES_SIZE           = 0x00000007,
	RES_EXIST          = 0x00000008,
	RES_SUBRESTRICTION = 0x00000009,
	RES_COMMENT        = 0x0000000A,
}

enum : ULONG {
	RELOP_LT = 0,
	RELOP_LE = 1,
	RELOP_GT = 2,
	RELOP_GE = 3,
	RELOP_EQ = 4,
	RELOP_NE = 5,
	RELOP_RE = 6,
}

enum : ULONG {
	BMR_EQZ = 0,
	BMR_NEZ = 1,
}

struct SAndRestriction {
	ULONG cRes;
	LPSRestriction lpRes;
}

struct SOrRestriction {
	ULONG cRes;
	LPSRestriction lpRes;
}

struct SNotRestriction {
	ULONG ulReserved;
	LPSRestriction lpRes;
}

struct SContentRestriction {
	ULONG ulFuzzyLevel;
	ULONG ulPropTag;
	LPSPropValue lpProp;
}

struct SBitMaskRestriction {
	ULONG relBMR;
	ULONG ulPropTag;
	ULONG ulMask;
}

struct SPropertyRestriction {
	ULONG relop;
	ULONG ulPropTag;
	LPSPropValue lpProp;
}

struct SComparePropsRestriction {
	ULONG relop;
	ULONG ulPropTag1;
	ULONG ulPropTag2;
}

struct SSizeRestriction {
	ULONG relop;
	ULONG ulPropTag;
	ULONG cb;
}

struct SExistRestriction {
	ULONG ulReserved1;
	ULONG ulPropTag;
	ULONG ulReserved2;
}

struct SSubRestriction {
	ULONG ulSubObject;
	LPSRestriction lpRes;
}

struct SCommentRestriction {
	ULONG cValues;
	LPSRestriction lpRes;
	LPSPropValue lpProp;
}

struct SRestriction {
	ULONG rt;
	union res_ {
		SComparePropsRestriction resCompareProps;
		SAndRestriction resAnd;
		SOrRestriction resOr;
		SNotRestriction resNot;
		SContentRestriction resContent;
		SPropertyRestriction resProperty;
		SBitMaskRestriction resBitMask;
		SSizeRestriction resSize;
		SExistRestriction resExist;
		SSubRestriction resSub;
		SCommentRestriction resComment;
	}
	res_ res;
}
alias SRestriction* LPSRestriction;

enum : ULONG {
	TBL_ALL_COLUMNS        = 0x00000001,
	TBL_LEAF_ROW           = 1,
	TBL_EMPTY_CATEGORY     = 2,
	TBL_EXPANDED_CATEGORY  = 3,
	TBL_COLLAPSED_CATEGORY = 4,
	TBL_NOWAIT             = 0x00000001,
	TBL_ASYNC              = 0x00000001,
	TBL_BATCH              = 0x00000002,
	DIR_BACKWARD           = 0x00000001,
	TBL_NOADVANCE          = 0x00000001,
}

interface IMAPITable : IUnknown {
public extern(Windows):
	HRESULT GetLastError(HRESULT hResult, ULONG ulFlags, LPMAPIERROR* lppMAPIError);
	HRESULT Advise(ULONG ulEventMask, LPMAPIADVISESINK lpAdviseSink, ULONG* lpulConnection);
	HRESULT Unadvise(ULONG ulConnection);
	HRESULT GetStatus(ULONG* lpulTableStatus, ULONG* lpulTableType);
	HRESULT SetColumns(LPSPropTagArray lpPropTagArray, ULONG ulFlags);
	HRESULT QueryColumns(ULONG ulFlags, LPSPropTagArray* lpPropTagArray);
	HRESULT GetRowCount(ULONG ulFlags, ULONG* lpulCount);
	HRESULT SeekRow(BOOKMARK bkOrigin, LONG lRowCount, LONG* lplRowsSought);
	HRESULT SeekRowApprox(ULONG ulNumerator, ULONG ulDenominator);
	HRESULT QueryPosition(ULONG* lpulRow, ULONG* lpulNumerator, ULONG* lpulDenominator);
	HRESULT FindRow(LPSRestriction lpRestriction, BOOKMARK bkOrigin, ULONG ulFlags);
	HRESULT Restrict(LPSRestriction lpRestriction, ULONG ulFlags);
	HRESULT CreateBookmark(BOOKMARK* lpbkPosition);
	HRESULT FreeBookmark(BOOKMARK bkPosition);
	HRESULT SortTable(LPSSortOrderSet lpSortCriteria, ULONG ulFlags);
	HRESULT QuerySortOrder(LPSSortOrderSet* lppSortCriteria);
	HRESULT QueryRows(LONG lRowCount, ULONG ulFlags, LPSRowSet *lppRows);
	HRESULT Abort();
	HRESULT ExpandRow(ULONG cbInstanceKey, LPBYTE pbInstanceKey, ULONG ulRowCount, ULONG ulFlags, LPSRowSet* lppRows, ULONG* lpulMoreRows);
	HRESULT CollapseRow(ULONG cbInstanceKey, LPBYTE pbInstanceKey, ULONG ulFlags, ULONG* lpulRowCount);
	HRESULT WaitForCompletion(ULONG ulFlags, ULONG ulTimeout, ULONG* lpulTableStatus);
	HRESULT GetCollapseState(ULONG ulFlags, ULONG cbInstanceKey, LPBYTE lpbInstanceKey, ULONG* lpcbCollapseState, LPBYTE* lppbCollapseState);
	HRESULT SetCollapseState(ULONG ulFlags, ULONG cbCollapseState, LPBYTE pbCollapseState, BOOKMARK* lpbkLocation);
}

// PS_PROFILE_PROPERTIES_INIT = {0x98, 0x15, 0xAC, 0x08, 0xAA, 0xB0, 0x10, 0x1A, 	0x8C, 0x93, 0x08, 0x00, 0x2B, 0x2A, 0x56, 0xC2 }

interface IProfSect: IMAPIProp {
}

enum : ULONG {
	MAPI_STORE_PROVIDER     = 33,
	MAPI_AB                 = 34,
	MAPI_AB_PROVIDER        = 35,
	MAPI_TRANSPORT_PROVIDER = 36,
	MAPI_SPOOLER            = 37,
	MAPI_PROFILE_PROVIDER   = 38,
	MAPI_SUBSYSTEM          = 39,
	MAPI_HOOK_PROVIDER      = 40,
}

enum : ULONG {
	STATUS_VALIDATE_STATE      = 0x00000001,
	STATUS_SETTINGS_DIALOG     = 0x00000002,
	STATUS_CHANGE_PASSWORD     = 0x00000004,
	STATUS_FLUSH_QUEUES        = 0x00000008,

	STATUS_DEFAULT_OUTBOUND    = 0x00000001,
	STATUS_DEFAULT_STORE       = 0x00000002,
	STATUS_PRIMARY_IDENTITY    = 0x00000004,
	STATUS_SIMPLE_STORE        = 0x00000008,
	STATUS_XP_PREFER_LAST      = 0x00000010,
	STATUS_NO_PRIMARY_IDENTITY = 0x00000020,
	STATUS_NO_DEFAULT_STORE    = 0x00000040,
	STATUS_TEMP_SECTION        = 0x00000080,
	STATUS_OWN_STORE           = 0x00000100,

	STATUS_NEED_IPM_TREE       = 0x00000800,
	STATUS_PRIMARY_STORE       = 0x00001000,
	STATUS_SECONDARY_STORE     = 0x00002000,

	STATUS_AVAILABLE           = 0x00000001,
	STATUS_OFFLINE             = 0x00000002,
	STATUS_FAILURE             = 0x00000004,

	STATUS_INBOUND_ENABLED     = 0x00010000,
	STATUS_INBOUND_ACTIVE      = 0x00020000,
	STATUS_INBOUND_FLUSH       = 0x00040000,
	STATUS_OUTBOUND_ENABLED    = 0x00100000,
	STATUS_OUTBOUND_ACTIVE     = 0x00200000,
	STATUS_OUTBOUND_FLUSH      = 0x00400000,
	STATUS_REMOTE_ACCESS       = 0x00800000,
}

enum {
	SUPPRESS_UI               = 0x00000001,
	REFRESH_XP_HEADER_CACHE   = 0x00010000,
	PROCESS_XP_HEADER_CACHE   = 0x00020000,
	FORCE_XP_CONNECT          = 0x00040000,
	FORCE_XP_DISCONNECT       = 0x00080000,
	CONFIG_CHANGED            = 0x00100000,
	ABORT_XP_HEADER_OPERATION = 0x00200000,
	SHOW_XP_SESSION_UI        = 0x00400000,
}

enum ULONG UI_READONLY = 0x00000001;

enum : ULONG {
	FLUSH_UPLOAD   = 0x00000002,
	FLUSH_DOWNLOAD = 0x00000004,
	FLUSH_FORCE    = 0x00000008,
	FLUSH_NO_UI    = 0x00000010,
	FLUSH_ASYNC_OK = 0x00000020,
}

interface IMAPIStatus : IMAPIProp {
public extern(Windows):
	HRESULT ValidateState(ULONG ulUIParam, ULONG ulFlags);
	HRESULT SettingsDialog(ULONG ulUIParam, ULONG ulFlags);
	HRESULT ChangePassword(LPTSTR lpOldPass, LPTSTR lpNewPass, ULONG ulFlags);
	HRESULT FlushQueues(ULONG ulUIParam, ULONG cbTargetTransport, LPENTRYID lpTargetTransport, ULONG ulFlags);
}


enum ULONG MAPI_BEST_ACCESS = 0x00000010;
enum CONVENIENT_DEPTH = 0x00000001;

enum : ULONG {
	SEARCH_RUNNING    = 0x00000001,
	SEARCH_REBUILD    = 0x00000002,
	SEARCH_RECURSIVE  = 0x00000004,
	SEARCH_FOREGROUND = 0x00000008,
}

enum : ULONG {
	STOP_SEARCH       = 0x00000001,
	RESTART_SEARCH    = 0x00000002,
	RECURSIVE_SEARCH  = 0x00000004,
	SHALLOW_SEARCH    = 0x00000008,
	FOREGROUND_SEARCH = 0x00000010,
	BACKGROUND_SEARCH = 0x00000020,
}

interface IMAPIContainer : IMAPIProp {
public extern(Windows):
	HRESULT GetContentsTable(ULONG ulFlags, LPMAPITABLE* lppTable);
	HRESULT GetHierarchyTable(ULONG ulFlags, LPMAPITABLE* lppTable);
	HRESULT OpenEntry(ULONG cbEntryID, LPENTRYID lpEntryID, LPCIID lpInterface, ULONG ulFlags, ULONG* lpulObjType, LPUNKNOWN* lppUnk);
	HRESULT SetSearchCriteria(LPSRestriction lpRestriction, LPENTRYLIST lpContainerList, ULONG ulSearchFlags);
	HRESULT GetSearchCriteria(ULONG ulFlags, LPSRestriction* lppRestriction, LPENTRYLIST* lppContainerList, ULONG* lpulSearchState);
}

struct FlagList {
	ULONG cFlags;
	ULONG[MAPI_DIM] ulFlag;
}
alias FlagList* LPFlagList;

enum {
	AB_RECIPIENTS    = 0x00000001,
	AB_SUBCONTAINERS = 0x00000002,
	AB_MODIFIABLE    = 0x00000004,
	AB_UNMODIFIABLE  = 0x00000008,
	AB_FIND_ON_OPEN  = 0x00000010,
	AB_NOT_DEFAULT   = 0x00000020,
}

enum : ULONG {
	CREATE_CHECK_DUP_STRICT = 0x00000001,
	CREATE_CHECK_DUP_LOOSE  = 0x00000002,
	CREATE_REPLACE          = 0x00000004,
}
enum : ULONG {
	MAPI_UNRESOLVED = 0x00000000,
	MAPI_AMBIGUOUS  = 0x00000001,
	MAPI_RESOLVED   = 0x00000002,
}

interface IABContainer : IMAPIContainer {
public extern(Windows):
	HRESULT CreateEntry(ULONG cbEntryID, LPENTRYID lpEntryID, ULONG ulCreateFlags, LPMAPIPROP* lppMAPIPropEntry);
	HRESULT CopyEntries(LPENTRYLIST lpEntries, ULONG ulUIParam, LPMAPIPROGRESS lpProgress, ULONG ulFlags);
	HRESULT DeleteEntries(LPENTRYLIST lpEntries, ULONG ulFlags);
	HRESULT ResolveNames(LPSPropTagArray lpPropTagArray, ULONG ulFlags, LPADRLIST lpAdrList, LPFlagList lpFlagList);
}

enum ULONG MAPI_SEND_NO_RICH_INFO = 0x00010000;

pure 
LONG MAPI_DIAG(int _code)
{
	return _code;
}

enum : LONG {
	MAPI_DIAG_NO_DIAGNOSTIC             = MAPI_DIAG(-1),
	MAPI_DIAG_OR_NAME_UNRECOGNIZED      = MAPI_DIAG( 0),
	MAPI_DIAG_OR_NAME_AMBIGUOUS         = MAPI_DIAG( 1),
	MAPI_DIAG_MTS_CONGESTED             = MAPI_DIAG( 2),
	MAPI_DIAG_LOOP_DETECTED             = MAPI_DIAG( 3),
	MAPI_DIAG_RECIPIENT_UNAVAILABLE     = MAPI_DIAG( 4),
	MAPI_DIAG_MAXIMUM_TIME_EXPIRED      = MAPI_DIAG( 5),
	MAPI_DIAG_EITS_UNSUPPORTED          = MAPI_DIAG( 6),
	MAPI_DIAG_CONTENT_TOO_LONG          = MAPI_DIAG( 7),
	MAPI_DIAG_IMPRACTICAL_TO_CONVERT    = MAPI_DIAG( 8),
	MAPI_DIAG_PROHIBITED_TO_CONVERT     = MAPI_DIAG( 9),
	MAPI_DIAG_CONVERSION_UNSUBSCRIBED   = MAPI_DIAG(10),
	MAPI_DIAG_PARAMETERS_INVALID        = MAPI_DIAG(11),
	MAPI_DIAG_CONTENT_SYNTAX_IN_ERROR   = MAPI_DIAG(12),
	MAPI_DIAG_LENGTH_CONSTRAINT_VIOLATD = MAPI_DIAG(13),
	MAPI_DIAG_NUMBER_CONSTRAINT_VIOLATD = MAPI_DIAG(14),
	MAPI_DIAG_CONTENT_TYPE_UNSUPPORTED  = MAPI_DIAG(15),
	MAPI_DIAG_TOO_MANY_RECIPIENTS       = MAPI_DIAG(16),
	MAPI_DIAG_NO_BILATERAL_AGREEMENT    = MAPI_DIAG(17),
	MAPI_DIAG_CRITICAL_FUNC_UNSUPPORTED = MAPI_DIAG(18),
	MAPI_DIAG_CONVERSION_LOSS_PROHIB    = MAPI_DIAG(19),
	MAPI_DIAG_LINE_TOO_LONG             = MAPI_DIAG(20),
	MAPI_DIAG_PAGE_TOO_LONG             = MAPI_DIAG(21),
	MAPI_DIAG_PICTORIAL_SYMBOL_LOST     = MAPI_DIAG(22),
	MAPI_DIAG_PUNCTUATION_SYMBOL_LOST   = MAPI_DIAG(23),
	MAPI_DIAG_ALPHABETIC_CHARACTER_LOST = MAPI_DIAG(24),
	MAPI_DIAG_MULTIPLE_INFO_LOSSES      = MAPI_DIAG(25),
	MAPI_DIAG_REASSIGNMENT_PROHIBITED   = MAPI_DIAG(26),
	MAPI_DIAG_REDIRECTION_LOOP_DETECTED = MAPI_DIAG(27),
	MAPI_DIAG_EXPANSION_PROHIBITED      = MAPI_DIAG(28),
	MAPI_DIAG_SUBMISSION_PROHIBITED     = MAPI_DIAG(29),
	MAPI_DIAG_EXPANSION_FAILED          = MAPI_DIAG(30),
	MAPI_DIAG_RENDITION_UNSUPPORTED     = MAPI_DIAG(31),
	MAPI_DIAG_MAIL_ADDRESS_INCORRECT    = MAPI_DIAG(32),
	MAPI_DIAG_MAIL_OFFICE_INCOR_OR_INVD = MAPI_DIAG(33),
	MAPI_DIAG_MAIL_ADDRESS_INCOMPLETE   = MAPI_DIAG(34),
	MAPI_DIAG_MAIL_RECIPIENT_UNKNOWN    = MAPI_DIAG(35),
	MAPI_DIAG_MAIL_RECIPIENT_DECEASED   = MAPI_DIAG(36),
	MAPI_DIAG_MAIL_ORGANIZATION_EXPIRED = MAPI_DIAG(37),
	MAPI_DIAG_MAIL_REFUSED              = MAPI_DIAG(38),
	MAPI_DIAG_MAIL_UNCLAIMED            = MAPI_DIAG(39),
	MAPI_DIAG_MAIL_RECIPIENT_MOVED      = MAPI_DIAG(40),
	MAPI_DIAG_MAIL_RECIPIENT_TRAVELLING = MAPI_DIAG(41),
	MAPI_DIAG_MAIL_RECIPIENT_DEPARTED   = MAPI_DIAG(42),
	MAPI_DIAG_MAIL_NEW_ADDRESS_UNKNOWN  = MAPI_DIAG(43),
	MAPI_DIAG_MAIL_FORWARDING_UNWANTED  = MAPI_DIAG(44),
	MAPI_DIAG_MAIL_FORWARDING_PROHIB    = MAPI_DIAG(45),
	MAPI_DIAG_SECURE_MESSAGING_ERROR    = MAPI_DIAG(46),
	MAPI_DIAG_DOWNGRADING_IMPOSSIBLE    = MAPI_DIAG(47),
}

enum : ULONG {
	 MAPI_MH_DP_PUBLIC_UA   = 0,
	 MAPI_MH_DP_PRIVATE_UA  = 1,
	 MAPI_MH_DP_MS          = 2,
	 MAPI_MH_DP_ML          = 3,
	 MAPI_MH_DP_PDAU        = 4,
	 MAPI_MH_DP_PDS_PATRON  = 5,
	 MAPI_MH_DP_OTHER_AU    = 6,
}

interface IMailUser : IMAPIProp {
}

interface IDistList : IMAPIContainer {
public extern(Windows):
	HRESULT CreateEntry(ULONG cbEntryID, LPENTRYID lpEntryID, ULONG ulCreateFlags, LPMAPIPROP* lppMAPIPropEntry);
	HRESULT CopyEntries(LPENTRYLIST lpEntries, ULONG ulUIParam, LPMAPIPROGRESS lpProgress, ULONG ulFlags);
	HRESULT DeleteEntries(LPENTRYLIST lpEntries, ULONG ulFlags);
	HRESULT ResolveNames(LPSPropTagArray lpPropTagArray, ULONG ulFlags, LPADRLIST lpAdrList, LPFlagList lpFlagList);
}

enum : ULONG {
	FOLDER_ROOT               = 0x00000000,
	FOLDER_GENERIC            = 0x00000001,
	FOLDER_SEARCH             = 0x00000002,

	MESSAGE_MOVE              = 0x00000001,
	MESSAGE_DIALOG            = 0x00000002,


	OPEN_IF_EXISTS            = 0x00000001,

	DEL_MESSAGES              = 0x00000001,
	FOLDER_DIALOG             = 0x00000002,
	DEL_FOLDERS               = 0x00000004,

	DEL_ASSOCIATED            = 0x00000008,

	FOLDER_MOVE               = 0x00000001,

	COPY_SUBFOLDERS           = 0x00000010,

	MSGSTATUS_HIGHLIGHTED     = 0x00000001,
	MSGSTATUS_TAGGED          = 0x00000002,
	MSGSTATUS_HIDDEN          = 0x00000004,
	MSGSTATUS_DELMARKED       = 0x00000008,

	MSGSTATUS_REMOTE_DOWNLOAD = 0x00001000,
	MSGSTATUS_REMOTE_DELETE   = 0x00002000,

	RECURSIVE_SORT            = 0x00000002,

	FLDSTATUS_HIGHLIGHTED     = 0x00000001,
	FLDSTATUS_TAGGED          = 0x00000002,
	FLDSTATUS_HIDDEN          = 0x00000004,
	FLDSTATUS_DELMARKED       = 0x00000008,
}

interface IMAPIFolder : IMAPIContainer {
public extern(Windows):
	HRESULT CreateMessage(LPCIID lpInterface, ULONG ulFlags, LPMESSAGE* lppMessage);
	HRESULT CopyMessages(LPENTRYLIST lpMsgList, LPCIID lpInterface, LPVOID lpDestFolder, ULONG ulUIParam, LPMAPIPROGRESS lpProgress, ULONG ulFlags);
	HRESULT DeleteMessages(LPENTRYLIST lpMsgList, ULONG ulUIParam, LPMAPIPROGRESS lpProgress, ULONG ulFlags);
	HRESULT CreateFolder(ULONG ulFolderType, LPTSTR lpszFolderName, LPTSTR lpszFolderComment, LPCIID lpInterface, ULONG ulFlags, LPMAPIFOLDER* lppFolder);
	HRESULT CopyFolder(ULONG cbEntryID, LPENTRYID lpEntryID, LPCIID lpInterface, LPVOID lpDestFolder, LPTSTR lpszNewFolderName, ULONG ulUIParam, LPMAPIPROGRESS lpProgress, ULONG ulFlags);
	HRESULT DeleteFolder(ULONG cbEntryID, LPENTRYID lpEntryID, ULONG ulUIParam, LPMAPIPROGRESS lpProgress, ULONG ulFlags);
	HRESULT SetReadFlags(LPENTRYLIST lpMsgList, ULONG ulUIParam, LPMAPIPROGRESS lpProgress, ULONG ulFlags);
	HRESULT GetMessageStatus(ULONG cbEntryID, LPENTRYID lpEntryID, ULONG ulFlags, ULONG* lpulMessageStatus);
	HRESULT SetMessageStatus(ULONG cbEntryID, LPENTRYID lpEntryID, ULONG ulNewStatus, ULONG ulNewStatusMask, ULONG* lpulOldStatus);
	HRESULT SaveContentsSort(LPSSortOrderSet lpSortCriteria, ULONG ulFlags);
	HRESULT EmptyFolder(ULONG ulUIParam, LPMAPIPROGRESS lpProgress, ULONG ulFlags);
}

enum : ULONG {
	STORE_ENTRYID_UNIQUE   = 0x00000001,
	STORE_READONLY         = 0x00000002,
	STORE_SEARCH_OK        = 0x00000004,
	STORE_MODIFY_OK        = 0x00000008,
	STORE_CREATE_OK        = 0x00000010,
	STORE_ATTACH_OK        = 0x00000020,
	STORE_OLE_OK           = 0x00000040,
	STORE_SUBMIT_OK        = 0x00000080,
	STORE_NOTIFY_OK        = 0x00000100,
	STORE_MV_PROPS_OK      = 0x00000200,
	STORE_CATEGORIZE_OK    = 0x00000400,
	STORE_RTF_OK           = 0x00000800,
	STORE_RESTRICTION_OK   = 0x00001000,
	STORE_SORT_OK          = 0x00002000,
	STORE_PUBLIC_FOLDERS   = 0x00004000,
	STORE_UNCOMPRESSED_RTF = 0x00008000,

	STORE_HAS_SEARCHES = 0x01000000,

	LOGOFF_NO_WAIT = 0x00000001,
	LOGOFF_ORDERLY = 0x00000002,
	LOGOFF_PURGE   = 0x00000004,
	LOGOFF_ABORT   = 0x00000008,
	LOGOFF_QUIET   = 0x00000010,

	LOGOFF_COMPLETE       = 0x00010000,
	LOGOFF_INBOUND        = 0x00020000,
	LOGOFF_OUTBOUND       = 0x00040000,
	LOGOFF_OUTBOUND_QUEUE = 0x00080000,

	MSG_LOCKED   = 0x00000001,
	MSG_UNLOCKED = 0x00000000,

	FOLDER_IPM_SUBTREE_VALID     = 0x00000001,
	FOLDER_IPM_INBOX_VALID       = 0x00000002,
	FOLDER_IPM_OUTBOX_VALID      = 0x00000004,
	FOLDER_IPM_WASTEBASKET_VALID = 0x00000008,
	FOLDER_IPM_SENTMAIL_VALID    = 0x00000010,
	FOLDER_VIEWS_VALID           = 0x00000020,
	FOLDER_COMMON_VIEWS_VALID    = 0x00000040,
	FOLDER_FINDER_VALID          = 0x00000080,
}

interface IMsgStore : IMAPIProp {
public extern(Windows):
	HRESULT Advise( ULONG cbEntryID, LPENTRYID lpEntryID, ULONG ulEventMask, LPMAPIADVISESINK lpAdviseSink, ULONG* lpulConnection);
	HRESULT Unadvise(ULONG ulConnection);
	HRESULT CompareEntryIDs(ULONG cbEntryID1, LPENTRYID lpEntryID1, ULONG cbEntryID2, LPENTRYID lpEntryID2, ULONG ulFlags, ULONG* lpulResult);
	HRESULT OpenEntry(ULONG cbEntryID, LPENTRYID lpEntryID, LPCIID lpInterface, ULONG ulFlags, ULONG* lpulObjType, LPUNKNOWN* lppUnk);
	HRESULT SetReceiveFolder(LPTSTR lpszMessageClass, ULONG ulFlags, ULONG cbEntryID, LPENTRYID lpEntryID);
	HRESULT GetReceiveFolder(LPTSTR lpszMessageClass, ULONG ulFlags, ULONG* lpcbEntryID, LPENTRYID* lppEntryID, LPTSTR* lppszExplicitClass);
	HRESULT GetReceiveFolderTable(ULONG ulFlags, LPMAPITABLE* lppTable);
	HRESULT StoreLogoff(ULONG* lpulFlags);
	HRESULT AbortSubmit(ULONG cbEntryID, LPENTRYID lpEntryID, ULONG ulFlags);
	HRESULT GetOutgoingQueue(ULONG ulFlags, LPMAPITABLE* lppTable);
	HRESULT SetLockState(LPMESSAGE lpMessage, ULONG ulLockState);
	HRESULT FinishedMsg(ULONG ulFlags,ULONG cbEntryID, LPENTRYID lpEntryID);
	HRESULT NotifyNewMail(LPNOTIFICATION lpNotification);
}

enum {
	FORCE_SUBMIT= 0x00000001,

	MSGFLAG_READ        = 0x00000001,
	MSGFLAG_UNMODIFIED  = 0x00000002,
	MSGFLAG_SUBMIT      = 0x00000004,
	MSGFLAG_UNSENT      = 0x00000008,
	MSGFLAG_HASATTACH   = 0x00000010,
	MSGFLAG_FROMME      = 0x00000020,
	MSGFLAG_ASSOCIATED  = 0x00000040,
	MSGFLAG_RESEND      = 0x00000080,
	MSGFLAG_RN_PENDING  = 0x00000100,
	MSGFLAG_NRN_PENDING = 0x00000200,

	SUBMITFLAG_LOCKED     = 0x00000001,
	SUBMITFLAG_PREPROCESS = 0x00000002,

	MODRECIP_ADD    = 0x00000002,
	MODRECIP_MODIFY = 0x00000004,
	MODRECIP_REMOVE = 0x00000008,

	SUPPRESS_RECEIPT      = 0x00000001,
	CLEAR_READ_FLAG       = 0x00000004,

	GENERATE_RECEIPT_ONLY = 0x00000010,
	CLEAR_RN_PENDING      = 0x00000020,
	CLEAR_NRN_PENDING     = 0x00000040,

	ATTACH_DIALOG       = 0x00000001,

	SECURITY_SIGNED     = 0x00000001,
	SECURITY_ENCRYPTED  = 0x00000002,
}

enum {
	PRIO_URGENT    = 1,
	PRIO_NORMAL    = 0,
	PRIO_NONURGENT = -1,
}

enum : ULONG {
	SENSITIVITY_NONE                 = 0x00000000,
	SENSITIVITY_PERSONAL             = 0x00000001,
	SENSITIVITY_PRIVATE              = 0x00000002,
	SENSITIVITY_COMPANY_CONFIDENTIAL = 0x00000003,
}

enum {
	IMPORTANCE_LOW    = 0,
	IMPORTANCE_NORMAL = 1,
	IMPORTANCE_HIGH   = 2,
}

interface IMessage : IMAPIProp {
public extern(Windows):
	HRESULT GetAttachmentTable(ULONG ulFlags, LPMAPITABLE* lppTable);
	HRESULT OpenAttach(ULONG ulAttachmentNum, LPCIID lpInterface, ULONG ulFlags, LPATTACH* lppAttach);
	HRESULT CreateAttach(LPCIID lpInterface, ULONG ulFlags, ULONG* lpulAttachmentNum, LPATTACH* lppAttach);
	HRESULT DeleteAttach(ULONG ulAttachmentNum, ULONG ulUIParam, LPMAPIPROGRESS lpProgress, ULONG ulFlags);
	HRESULT GetRecipientTable(ULONG ulFlags, LPMAPITABLE* lppTable);
	HRESULT ModifyRecipients(ULONG ulFlags, LPADRLIST lpMods);
	HRESULT SubmitMessage(ULONG ulFlags);
	HRESULT SetReadFlag(ULONG ulFlags);
}

enum {
	NO_ATTACHMENT         = 0x00000000,
	ATTACH_BY_VALUE       = 0x00000001,
	ATTACH_BY_REFERENCE   = 0x00000002,
	ATTACH_BY_REF_RESOLVE = 0x00000003,
	ATTACH_BY_REF_ONLY    = 0x00000004,
	ATTACH_EMBEDDED_MSG   = 0x00000005,
	ATTACH_OLE            = 0x00000006,
}

interface IAttach : IMAPIProp {
}

pure
ULONG GET_ADRPARM_VERSION(ULONG ulFlags)
{
	return ulFlags & 0xF0000000;
}

pure
ULONG SET_ADRPARM_VERSION(ULONG ulFlags, ULONG ulVersion)
{
	return ulVersion | (ulFlags & 0x0FFFFFFF);
}

enum : ULONG {
	ADRPARM_HELP_CTX = 0x00000000,

	DIALOG_MODAL   = 0x00000001,
	DIALOG_SDI     = 0x00000002,
	DIALOG_OPTIONS = 0x00000004,
	ADDRESS_ONE    = 0x00000008,
	AB_SELECTONLY  = 0x00000010,
	AB_RESOLVE     = 0x00000020,

	DT_MAILUSER         = 0x00000000,
	DT_DISTLIST         = 0x00000001,
	DT_FORUM            = 0x00000002,
	DT_AGENT            = 0x00000003,
	DT_ORGANIZATION     = 0x00000004,
	DT_PRIVATE_DISTLIST = 0x00000005,
	DT_REMOTE_MAILUSER  = 0x00000006,

	DT_MODIFIABLE       = 0x00010000,
	DT_GLOBAL           = 0x00020000,
	DT_LOCAL            = 0x00030000,
	DT_WAN              = 0x00040000,
	DT_NOT_SPECIFIC     = 0x00050000,

	DT_FOLDER           = 0x01000000,
	DT_FOLDER_LINK      = 0x02000000,
	DT_FOLDER_SPECIAL   = 0x04000000,
}

alias extern(Windows) BOOL function(ULONG ulUIParam, LPVOID lpvmsg) ACCELERATEABSDI;
alias ACCELERATEABSDI LPFNABSDI;

alias extern(Windows) void function(ULONG ulUIParam, LPVOID lpvContext) DISMISSMODELESS;
alias DISMISSMODELESS LPFNDISMISS;

alias extern(Windows) SCODE function(ULONG ulUIParam, LPVOID lpvContext, ULONG cbEntryID, LPENTRYID lpSelection, ULONG ulFlags) LPFNBUTTON;

struct ADRPARM {
	ULONG cbABContEntryID;
	LPENTRYID lpABContEntryID;
	ULONG ulFlags;

	LPVOID lpReserved;
	ULONG ulHelpContext;
	LPTSTR lpszHelpFileName;

	LPFNABSDI lpfnABSDI;
	LPFNDISMISS lpfnDismiss;
	LPVOID lpvDismissContext;
	LPTSTR lpszCaption;
	LPTSTR lpszNewEntryTitle;
	LPTSTR lpszDestWellsTitle;
	ULONG cDestFields;
	ULONG nDestFieldFocus;
	LPTSTR* lppszDestTitles;
	ULONG* lpulDestComps;
	LPSRestriction lpContRestriction;
	LPSRestriction lpHierRestriction;
}
alias ADRPARM* LPADRPARM;

enum : ULONG {
	MAPI_DEFERRED_ERRORS = 0x00000008,
	MAPI_ASSOCIATED      = 0x00000040,

	MDB_NO_DIALOG        = 0x00000001,
	MDB_WRITE            = 0x00000004,
	MDB_TEMPORARY        = 0x00000020,
	MDB_NO_MAIL          = 0x00000080,

	AB_NO_DIALOG         = 0x00000001,

	MAPI_ENABLED         = 0x00000000,
	MAPI_DISABLED        = 0x00000001,
}

interface IMAPIControl : IUnknown {
public extern(Windows):
	HRESULT GetLastError(HRESULT hResult, ULONG ulFlags, LPMAPIERROR* lppMAPIError);
	HRESULT Activate(ULONG ulFlags, ULONG ulUIParam);
	HRESULT GetState(ULONG ulFlags, ULONG* lpulState);
}
alias IMAPIControl LPMAPICONTROL;

enum : ULONG {
	DT_MULTILINE     = 0x00000001,
	DT_EDITABLE	     = 0x00000002,
	DT_REQUIRED      = 0x00000004,
	DT_SET_IMMEDIATE = 0x00000008,
	DT_PASSWORD_EDIT = 0x00000010,
	DT_ACCEPT_DBCS   = 0x00000020,
	DT_SET_SELECTION = 0x00000040,

	DTCT_LABEL       = 0x00000000,
	DTCT_EDIT        = 0x00000001,
	DTCT_LBX         = 0x00000002,
	DTCT_COMBOBOX    = 0x00000003,
	DTCT_DDLBX       = 0x00000004,
	DTCT_CHECKBOX    = 0x00000005,
	DTCT_GROUPBOX    = 0x00000006,
	DTCT_BUTTON      = 0x00000007,
	DTCT_PAGE        = 0x00000008,
	DTCT_RADIOBUTTON = 0x00000009,
	DTCT_MVLISTBOX   = 0x0000000B,
	DTCT_MVDDLBX     = 0x0000000C,
}

struct DTBLLABEL {
	ULONG ulbLpszLabelName;
	ULONG ulFlags;
}
alias DTBLLABEL* LPDTBLLABEL;
// SizedDtblLabel(n,u) struct _DTBLLABEL_ ## u { DTBLLABEL dtbllabel; TCHAR lpszLabelName[n]; } u

struct DTBLEDIT {
	ULONG ulbLpszCharsAllowed;
	ULONG ulFlags;
	ULONG ulNumCharsAllowed;
	ULONG ulPropTag;
}
alias DTBLEDIT* LPDTBLEDIT;
// SizedDtblEdit(n,u) struct _DTBLEDIT_ ## u { DTBLEDIT dtbledit; TCHAR lpszCharsAllowed[n]; } u

enum : ULONG {
	MAPI_NO_HBAR = 0x00000001,
	MAPI_NO_VBAR = 0x00000002,
}

struct DTBLLBX {
	ULONG ulFlags;
	ULONG ulPRSetProperty;
	ULONG ulPRTableName;
}
alias DTBLLBX* LPDTBLLBX;

struct DTBLCOMBOBOX {
	ULONG ulbLpszCharsAllowed;
	ULONG ulFlags;
	ULONG ulNumCharsAllowed;
	ULONG ulPRPropertyName;
	ULONG ulPRTableName;
}
alias DTBLCOMBOBOX* LPDTBLCOMBOBOX;
// SizedDtblComboBox(n,u) struct _DTBLCOMBOBOX_ ## u { DTBLCOMBOBOX dtblcombobox; TCHAR lpszCharsAllowed[n]; } u

struct DTBLDDLBX {
	ULONG ulFlags;
	ULONG ulPRDisplayProperty;
	ULONG ulPRSetProperty;
	ULONG ulPRTableName;
}
alias DTBLDDLBX* LPDTBLDDLBX;

struct DTBLCHECKBOX {
	ULONG ulbLpszLabel;
	ULONG ulFlags;
	ULONG ulPRPropertyName;
}
alias DTBLCHECKBOX* LPDTBLCHECKBOX;
// SizedDtblCheckBox(n,u) struct _DTBLCHECKBOX_ ## u { DTBLCHECKBOX dtblcheckbox; TCHAR lpszLabel[n]; } u

struct DTBLGROUPBOX {
	ULONG ulbLpszLabel;
	ULONG ulFlags;
}
alias DTBLGROUPBOX* LPDTBLGROUPBOX;
// SizedDtblGroupBox(n,u) struct _DTBLGROUPBOX_ ## u { DTBLGROUPBOX dtblgroupbox; TCHAR lpszLabel[n]; } u

struct DTBLBUTTON {
	ULONG ulbLpszLabel;
	ULONG ulFlags;
	ULONG ulPRControl;
}
alias DTBLBUTTON* LPDTBLBUTTON;
// SizedDtblButton(n,u) struct _DTBLBUTTON_ ## u { DTBLBUTTON dtblbutton; TCHAR lpszLabel[n]; } u

struct DTBLPAGE {
	ULONG ulbLpszLabel;
	ULONG ulFlags;
	ULONG ulbLpszComponent;
	ULONG ulContext;
}
alias DTBLPAGE* LPDTBLPAGE;
// SizedDtblPage(n,n1,u) struct _DTBLPAGE_ ## u { DTBLPAGE dtblpage; TCHAR lpszLabel[n]; TCHAR lpszComponent[n1]; } u

struct DTBLRADIOBUTTON {
	ULONG ulbLpszLabel;
	ULONG ulFlags;
	ULONG ulcButtons;
	ULONG ulPropTag;
	int lReturnValue;
}
alias DTBLRADIOBUTTON* LPDTBLRADIOBUTTON;
// SizedDtblRadioButton(n,u) struct _DTBLRADIOBUTTON_ ## u { DTBLRADIOBUTTON dtblradiobutton; TCHAR lpszLabel[n]; } u

struct DTBLMVLISTBOX {
	ULONG ulFlags;
	ULONG ulMVPropTag;
}
alias DTBLMVLISTBOX* LPDTBLMVLISTBOX;

struct DTBLMVDDLBX {
	ULONG ulFlags;
	ULONG ulMVPropTag;
}
alias DTBLMVDDLBX* LPDTBLMVDDLBX;

enum {
	UI_SERVICE                = 0x00000002,
	SERVICE_UI_ALWAYS         = 0x00000002,
	SERVICE_UI_ALLOWED        = 0x00000010,
	UI_CURRENT_PROVIDER_FIRST = 0x00000004,
}

interface IProviderAdmin : IUnknown {
public extern(Windows):
	MAPIERROR GetLastError(HRESULT hResult, ULONG ulFlags, LPMAPIERROR* lppMAPIError);
	MAPIERROR GetProviderTable(ULONG ulFlags, LPMAPITABLE* lppTable);
	MAPIERROR CreateProvider(LPTSTR lpszProvider, ULONG cValues, LPSPropValue lpProps, ULONG ulUIParam, ULONG ulFlags, MAPIUID* lpUID);
	MAPIERROR DeleteProvider(LPMAPIUID lpUID);
	MAPIERROR OpenProfileSection(LPMAPIUID lpUID, LPCIID lpInterface, ULONG ulFlags, LPPROFSECT* lppProfSect);
}

} // extern(C)

