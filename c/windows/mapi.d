/** mapi.d

Converted from 'mapi.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.mapi;


import c.windows.basetsd;
import c.windows.windef;
import c.windows.wtypes;
import c.windows.mapidefs;
import c.windows.mapix;


extern(C){

alias uint* LPULONG;
alias uint FLAGS;

alias ULONG_PTR LHANDLE;
alias ULONG_PTR* LPLHANDLE;
alias ubyte* LPBYTE;

const HANDLE lhSessionNull = cast(HANDLE)0;

struct MapiFileDesc {
	ULONG ulReserved;
	ULONG flFlags;
	ULONG nPosition;
	LPSTR lpszPathName;
	LPSTR lpszFileName;
	LPVOID lpFileType;
}
alias MapiFileDesc* lpMapiFileDesc;

enum {
	MAPI_OLE        = 0x00000001,
	MAPI_OLE_STATIC = 0x00000002,
}

struct MapiFileTagExt {
	ULONG ulReserved;
	ULONG cbTag;
	LPBYTE lpTag;
	ULONG cbEncoding;
	LPBYTE lpEncoding;
}
alias MapiFileTagExt* lpMapiFileTagExt;

struct MapiRecipDesc {
	ULONG ulReserved;
	ULONG ulRecipClass;
	LPSTR lpszName;
	LPSTR lpszAddress;
	ULONG ulEIDSize;
	LPVOID lpEntryID;
}
alias MapiRecipDesc* lpMapiRecipDesc;

enum {
	MAPI_ORIG = 0,
	MAPI_TO   = 1,
	MAPI_CC   = 2,
	MAPI_BCC  = 3,
}

struct MapiMessage {
	ULONG ulReserved;
	LPSTR lpszSubject;
	LPSTR lpszNoteText;
	LPSTR lpszMessageType;
	LPSTR lpszDateReceived;
	LPSTR lpszConversationID;
	FLAGS flFlags;
	lpMapiRecipDesc lpOriginator;
	ULONG nRecipCount;
	lpMapiRecipDesc lpRecips;
	ULONG nFileCount;
	lpMapiFileDesc lpFiles;
}
alias MapiMessage* lpMapiMessage;

enum {
	MAPI_UNREAD             = 0x00000001,
	MAPI_RECEIPT_REQUESTED  = 0x00000002,
	MAPI_SENT               = 0x00000004,
}

enum {
	MAPI_LOGON_UI        = 0x00000001,
	MAPI_PASSWORD_UI     = 0x00020000,
	MAPI_NEW_SESSION     = 0x00000002,
	MAPI_FORCE_DOWNLOAD  = 0x00001000,
	MAPI_EXTENDED        = 0x00000020,

	//MAPI_LOGON_UI      = 0x00000001,
	//MAPI_NEW_SESSION   = 0x00000002,
	MAPI_DIALOG          = 0x00000008,
	//MAPI_USE_DEFAULT   = 0x00000040,

	MAPI_UNREAD_ONLY     = 0x00000020,
	MAPI_GUARANTEE_FIFO  = 0x00000100,
	MAPI_LONG_MSGID      = 0x00004000,

	MAPI_PEEK            = 0x00000080,
	MAPI_SUPPRESS_ATTACH = 0x00000800,
	MAPI_ENVELOPE_ONLY   = 0x00000040,
	MAPI_BODY_AS_FILE    = 0x00000200,

	//MAPI_LOGON_UI      = 0x00000001,
	//MAPI_NEW_SESSION   = 0x00000002,
	//MAPI_LONG_MSGID    = 0x00004000,

	//MAPI_LOGON_UI      = 0x00000001,
	//MAPI_NEW_SESSION   = 0x00000002,

	//MAPI_LOGON_UI      = 0x00000001,
	//MAPI_NEW_SESSION   = 0x00000002,
	MAPI_AB_NOMODIFY     = 0x00000400,

	//MAPI_LOGON_UI      = 0x00000001,
	//MAPI_NEW_SESSION   = 0x00000002,
	//MAPI_DIALOG        = 0x00000008,
	//MAPI_AB_NOMODIFY   = 0x00000400,
}

alias extern(Windows) ULONG function(ULONG_PTR ulUIParam, LPSTR lpszProfileName, LPSTR lpszPassword, FLAGS flFlags, ULONG ulReserved, LPLHANDLE lplhSession) MAPILOGON;
alias MAPILOGON LPMAPILOGON;
deprecated alias MAPILOGON MAPILogon;

alias extern(Windows) ULONG function(LHANDLE lhSession, ULONG_PTR ulUIParam, FLAGS flFlags, ULONG ulReserved) MAPILOGOFF;
alias MAPILOGOFF LPMAPILOGOFF;
deprecated alias MAPILOGOFF MAPILogoff;

alias extern(Windows) ULONG function(LHANDLE lhSession, ULONG_PTR ulUIParam, lpMapiMessage lpMessage, FLAGS flFlags, ULONG ulReserved) MAPISENDMAIL;
alias MAPISENDMAIL LPMAPISENDMAIL;
deprecated alias MAPISENDMAIL MAPISendMail;

alias extern(Windows) ULONG function(ULONG_PTR ulUIParam, LPSTR lpszDelimChar, LPSTR lpszFilePaths, LPSTR lpszFileNames, ULONG ulReserved) MAPISENDDOCUMENTS;
alias MAPISENDDOCUMENTS LPMAPISENDDOCUMENTS;
deprecated alias MAPISENDDOCUMENTS MAPISendDocuments;

alias extern(Windows) ULONG function(LHANDLE lhSession, ULONG_PTR ulUIParam, LPSTR lpszMessageType, LPSTR lpszSeedMessageID, FLAGS flFlags, ULONG ulReserved, LPSTR lpszMessageID) MAPIFINDNEXT;
alias MAPIFINDNEXT LPMAPIFINDNEXT;
deprecated alias MAPIFINDNEXT MAPIFindNext;

alias extern(Windows) ULONG function(LHANDLE lhSession, ULONG_PTR ulUIParam, LPSTR lpszMessageID, FLAGS flFlags, ULONG ulReserved, lpMapiMessage* lppMessage) MAPIREADMAIL;
alias MAPIREADMAIL LPMAPIREADMAIL;
deprecated alias MAPIREADMAIL MAPIReadMail;

alias extern(Windows) ULONG function(LHANDLE lhSession, ULONG_PTR ulUIParam, lpMapiMessage lpMessage, FLAGS flFlags, ULONG ulReserved, LPSTR lpszMessageID) MAPISAVEMAIL;
alias MAPISAVEMAIL LPMAPISAVEMAIL;
deprecated alias MAPISAVEMAIL MAPISaveMail;

alias extern(Windows) ULONG function(LHANDLE lhSession, ULONG_PTR ulUIParam, LPSTR lpszMessageID, FLAGS flFlags, ULONG ulReserved) MAPIDELETEMAIL;
alias MAPIDELETEMAIL LPMAPIDELETEMAIL;
deprecated alias MAPIDELETEMAIL MAPIDeleteMail;

alias extern(Windows) ULONG function(LPVOID pv) LPMAPIFREEBUFFER;
export extern(Windows) ULONG MAPIFreeBuffer(LPVOID pv);

alias extern(Windows) ULONG function(LHANDLE lhSession, ULONG_PTR ulUIParam, LPSTR lpszCaption, ULONG nEditFields, LPSTR lpszLabels, ULONG nRecips, lpMapiRecipDesc lpRecips, FLAGS flFlags, ULONG ulReserved, LPULONG lpnNewRecips, lpMapiRecipDesc* lppNewRecips) MAPIADDRESS;
alias MAPIADDRESS LPMAPIADDRESS;
deprecated alias MAPIADDRESS MAPIAddress;

alias extern(Windows) ULONG function(LHANDLE lhSession, ULONG_PTR ulUIParam, lpMapiRecipDesc lpRecip, FLAGS flFlags, ULONG ulReserved) MAPIDETAILS;
alias MAPIDETAILS LPMAPIDETAILS;
deprecated alias MAPIDETAILS MAPIDetails;

alias extern(Windows) ULONG function(LHANDLE lhSession, ULONG_PTR ulUIParam, LPSTR lpszName, FLAGS flFlags, ULONG ulReserved, lpMapiRecipDesc* lppRecip) MAPIRESOLVENAME;
alias MAPIRESOLVENAME LPMAPIRESOLVENAME;
deprecated alias MAPIRESOLVENAME MAPIResolveName;

enum SUCCESS_SUCCESS = 0;

enum {
	MAPI_USER_ABORT                 = 1,
	MAPI_E_USER_ABORT               = MAPI_USER_ABORT,
	MAPI_E_FAILURE                  = 2,
	MAPI_E_LOGON_FAILURE            = 3,
	MAPI_E_LOGIN_FAILURE            = MAPI_E_LOGON_FAILURE,
	MAPI_E_DISK_FULL                = 4,
	MAPI_E_INSUFFICIENT_MEMORY      = 5,
	MAPI_E_ACCESS_DENIED            = 6,
	MAPI_E_TOO_MANY_SESSIONS        = 8,
	MAPI_E_TOO_MANY_FILES           = 9,
	MAPI_E_TOO_MANY_RECIPIENTS      = 10,
	MAPI_E_ATTACHMENT_NOT_FOUND     = 11,
	MAPI_E_ATTACHMENT_OPEN_FAILURE  = 12,
	MAPI_E_ATTACHMENT_WRITE_FAILURE = 13,
	MAPI_E_UNKNOWN_RECIPIENT        = 14,
	MAPI_E_BAD_RECIPTYPE            = 15,
	MAPI_E_NO_MESSAGES              = 16,
	MAPI_E_INVALID_MESSAGE          = 17,
	MAPI_E_TEXT_TOO_LARGE           = 18,
	MAPI_E_INVALID_SESSION          = 19,
	MAPI_E_TYPE_NOT_SUPPORTED       = 20,
	MAPI_E_AMBIGUOUS_RECIPIENT      = 21,
	MAPI_E_AMBIG_RECIP              = MAPI_E_AMBIGUOUS_RECIPIENT,
	MAPI_E_MESSAGE_IN_USE           = 22,
	MAPI_E_NETWORK_FAILURE          = 23,
	MAPI_E_INVALID_EDITFIELDS       = 24,
	MAPI_E_INVALID_RECIPS           = 25,
	MAPI_E_NOT_SUPPORTED            = 26,
}

export extern(Windows)
SCODE ScMAPIXFromSMAPI(LHANDLE lhSimpleSession, ULONG ulFlags, LPCIID lpInterface, LPMAPISESSION* lppMAPISession);

}// extern(C)
