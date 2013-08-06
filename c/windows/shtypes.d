/** shtypes.d

Converted from 'shtypes.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.shtypes;


import c.windows.sdkddkver;
import c.windows.windef;
import c.windows.guiddef;
import c.windows.wtypes;


extern(C){

align(1)
struct SHITEMID {
	USHORT cb;
	BYTE[1] abID;
}
alias SHITEMID* LPSHITEMID;
alias const(SHITEMID)* LPCSHITEMID;

align(1)
struct ITEMIDLIST {
	SHITEMID mkid;
}
enum ITEMIDLIST_RELATIVE : ITEMIDLIST {init = (ITEMIDLIST).init}
enum ITEMID_CHILD : ITEMIDLIST {init = (ITEMIDLIST).init}
enum ITEMIDLIST_ABSOLUTE : ITEMIDLIST {init = (ITEMIDLIST).init}

enum wirePIDL : BYTE_BLOB* {init = (BYTE_BLOB*).init}

alias ITEMIDLIST* LPITEMIDLIST;
alias const(ITEMIDLIST)* LPCITEMIDLIST;


alias ITEMIDLIST_ABSOLUTE* PIDLIST_ABSOLUTE;
alias const(ITEMIDLIST_ABSOLUTE)* PCIDLIST_ABSOLUTE;
alias const(ITEMIDLIST_ABSOLUTE)* PCUIDLIST_ABSOLUTE;
alias ITEMIDLIST_RELATIVE* PIDLIST_RELATIVE;
alias const(ITEMIDLIST_RELATIVE)* PCIDLIST_RELATIVE;
alias ITEMIDLIST_RELATIVE* PUIDLIST_RELATIVE;
alias const(ITEMIDLIST_RELATIVE)* PCUIDLIST_RELATIVE;
alias ITEMID_CHILD* PITEMID_CHILD;
alias const(ITEMID_CHILD)* PCITEMID_CHILD;
alias ITEMID_CHILD* PUITEMID_CHILD;
alias const(ITEMID_CHILD)* PCUITEMID_CHILD;
alias const(PCUITEMID_CHILD)* PCUITEMID_CHILD_ARRAY;
alias const(PCUIDLIST_RELATIVE)* PCUIDLIST_RELATIVE_ARRAY;
alias const(PCIDLIST_ABSOLUTE)* PCIDLIST_ABSOLUTE_ARRAY;
alias const(PCUIDLIST_ABSOLUTE)* PCUIDLIST_ABSOLUTE_ARRAY;

enum tagSTRRET_TYPE {
	STRRET_WSTR   = 0,
	STRRET_OFFSET = 0x1,
	STRRET_CSTR   = 0x2
}
alias int STRRET_TYPE;

align(8)
struct STRRET {
	UINT uType;
	union {
		LPWSTR pOleStr;
		UINT uOffset;
		char[260] cStr;
	}
}
alias STRRET* LPSTRRET;

align(1)
struct SHELLDETAILS {
	int fmt;
	int cxChar;
	STRRET str;
}
alias SHELLDETAILS* LPSHELLDETAILS;

enum tagPERCEIVED{
	PERCEIVED_TYPE_FIRST       = -3,
	PERCEIVED_TYPE_CUSTOM      = -3,
	PERCEIVED_TYPE_UNSPECIFIED = -2,
	PERCEIVED_TYPE_FOLDER      = -1,
	PERCEIVED_TYPE_UNKNOWN     = 0,
	PERCEIVED_TYPE_TEXT        = 1,
	PERCEIVED_TYPE_IMAGE       = 2,
	PERCEIVED_TYPE_AUDIO       = 3,
	PERCEIVED_TYPE_VIDEO       = 4,
	PERCEIVED_TYPE_COMPRESSED  = 5,
	PERCEIVED_TYPE_DOCUMENT    = 6,
	PERCEIVED_TYPE_SYSTEM      = 7,
	PERCEIVED_TYPE_APPLICATION = 8,
	PERCEIVED_TYPE_GAMEMEDIA   = 9,
	PERCEIVED_TYPE_CONTACTS    = 10,
	PERCEIVED_TYPE_LAST        = 10
}
alias int PERCEIVED;

enum {
	PERCEIVEDFLAG_UNDEFINED     = 0x0000,
	PERCEIVEDFLAG_SOFTCODED     = 0x0001,
	PERCEIVEDFLAG_HARDCODED     = 0x0002,
	PERCEIVEDFLAG_NATIVESUPPORT = 0x0004,
	PERCEIVEDFLAG_GDIPLUS       = 0x0010,
	PERCEIVEDFLAG_WMSDK         = 0x0020,
	PERCEIVEDFLAG_ZIPFOLDER     = 0x0040,
}
alias DWORD PERCEIVEDFLAG;

//(NTDDI_VERSION >= NTDDI_VISTA)
	struct COMDLG_FILTERSPEC {
		LPCWSTR pszName;
		LPCWSTR pszSpec;
	}

alias GUID KNOWNFOLDERID;
alias const(KNOWNFOLDERID)* REFKNOWNFOLDERID;
alias DWORD KF_REDIRECT_FLAGS;
alias GUID FOLDERTYPEID;
alias const(FOLDERTYPEID)* REFFOLDERTYPEID;
alias GUID TASKOWNERID;
alias const(TASKOWNERID)* REFTASKOWNERID;

enum {
	SHCOLSTATE_DEFAULT            = 0,
	SHCOLSTATE_TYPE_STR           = 0x1,
	SHCOLSTATE_TYPE_INT           = 0x2,
	SHCOLSTATE_TYPE_DATE          = 0x3,
	SHCOLSTATE_TYPEMASK           = 0xf,
	SHCOLSTATE_ONBYDEFAULT        = 0x10,
	SHCOLSTATE_SLOW               = 0x20,
	SHCOLSTATE_EXTENDED           = 0x40,
	SHCOLSTATE_SECONDARYUI        = 0x80,
	SHCOLSTATE_HIDDEN             = 0x100,
	SHCOLSTATE_PREFER_VARCMP      = 0x200,
	SHCOLSTATE_PREFER_FMTCMP      = 0x400,
	SHCOLSTATE_NOSORTBYFOLDERNESS = 0x800,
	SHCOLSTATE_VIEWONLY           = 0x10000,
	SHCOLSTATE_BATCHREAD          = 0x20000,
	SHCOLSTATE_NO_GROUPBY         = 0x40000,
	SHCOLSTATE_FIXED_WIDTH        = 0x1000,
	SHCOLSTATE_NODPISCALE         = 0x2000,
	SHCOLSTATE_FIXED_RATIO        = 0x4000,
	SHCOLSTATE_DISPLAYMASK        = 0xf000
}
alias int SHCOLSTATE;

alias DWORD SHCOLSTATEF;
alias PROPERTYKEY SHCOLUMNID;
alias const(SHCOLUMNID)* LPCSHCOLUMNID;

} // extern(C)
