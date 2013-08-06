/** commctrl.d

Converted from 'commctrl.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.commctrl;


import c.windows.sdkddkver;
import c.windows.windef;
import c.windows.wingdi;
import c.windows.winuser;
import c.windows.winbase;
import c.windows.guiddef;
import c.windows.objidl;
import c.windows.winnls;
import c.windows.oleidl;


extern(C){
//typedef int HRESULT; at windef

//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	enum COMCTL32_VERSION = 6;
//else enum COMCTL32_VERSION = 5;

export extern(Windows) void InitCommonControls();

struct INITCOMMONCONTROLSEX {
	DWORD dwSize;
	DWORD dwICC;
}
alias INITCOMMONCONTROLSEX* LPINITCOMMONCONTROLSEX;

enum {
	ICC_LISTVIEW_CLASSES   = 0x00000001,
	ICC_TREEVIEW_CLASSES   = 0x00000002,
	ICC_BAR_CLASSES        = 0x00000004,
	ICC_TAB_CLASSES        = 0x00000008,
	ICC_UPDOWN_CLASS       = 0x00000010,
	ICC_PROGRESS_CLASS     = 0x00000020,
	ICC_HOTKEY_CLASS       = 0x00000040,
	ICC_ANIMATE_CLASS      = 0x00000080,
	ICC_WIN95_CLASSES      = 0x000000FF,
	ICC_DATE_CLASSES       = 0x00000100,
	ICC_USEREX_CLASSES     = 0x00000200,
	ICC_COOL_CLASSES       = 0x00000400,
	ICC_INTERNET_CLASSES   = 0x00000800,
	ICC_PAGESCROLLER_CLASS = 0x00001000,
	ICC_NATIVEFNTCTL_CLASS = 0x00002000,
	//_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		ICC_STANDARD_CLASSES = 0x00004000,
		ICC_LINK_CLASS       = 0x00008000,
}

export extern(Windows) BOOL InitCommonControlsEx(const(INITCOMMONCONTROLSEX)* picce);

enum {
	ODT_HEADER   = 100,
	ODT_TAB      = 101,
	ODT_LISTVIEW = 102,
}
enum {
	LVM_FIRST = 0x1000,
	TV_FIRST  = 0x1100,
	HDM_FIRST = 0x1200,
	TCM_FIRST = 0x1300,
}

enum {
	PGM_FIRST = 0x1400,
//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		ECM_FIRST = 0x1500,
		BCM_FIRST = 0x1600,
		CBM_FIRST = 0x1700,
}

enum {
	CCM_FIRST            = 0x2000,
	CCM_LAST             = CCM_FIRST + 0x200,
	CCM_SETBKCOLOR       = CCM_FIRST + 1,
	CCM_SETCOLORSCHEME   = CCM_FIRST + 2,
	CCM_GETCOLORSCHEME   = CCM_FIRST + 3,
	CCM_GETDROPTARGET    = CCM_FIRST + 4,
	CCM_SETUNICODEFORMAT = CCM_FIRST + 5,
	CCM_GETUNICODEFORMAT = CCM_FIRST + 6,
	CCM_SETVERSION       = CCM_FIRST + 0x7,
	CCM_GETVERSION       = CCM_FIRST + 0x8,
	CCM_SETNOTIFYWINDOW  = CCM_FIRST + 0x9,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		CCM_SETWINDOWTHEME = CCM_FIRST + 0xb,
		CCM_DPISCALE       = CCM_FIRST + 0xc,
}

struct COLORSCHEME {
	DWORD dwSize;
	COLORREF clrBtnHighlight;
	COLORREF clrBtnShadow;
}
alias COLORSCHEME* LPCOLORSCHEME;

enum INFOTIPSIZE = 1024;

enum {
	NM_FIRST  = -0U,
	NM_LAST   = -99U,
	LVN_FIRST = -100U,
	LVN_LAST  = -199U,
	HDN_FIRST = -300U,
	HDN_LAST  = -399U,
	TVN_FIRST = -400U,
	TVN_LAST  = -499U,
	TTN_FIRST = -520U,
	TTN_LAST  = -549U,
	TCN_FIRST = -550U,
	TCN_LAST  = -580U,
	CDN_FIRST = -601U,
	CDN_LAST  = -699U,
	TBN_FIRST = -700U,
	TBN_LAST  = -720U,
	UDN_FIRST = -721U,
	UDN_LAST  = -729U,
}

enum {
	NM_OUTOFMEMORY     = NM_FIRST - 1,
	NM_CLICK           = NM_FIRST - 2,
	NM_DBLCLK          = NM_FIRST - 3,
	NM_RETURN          = NM_FIRST - 4,
	NM_RCLICK          = NM_FIRST - 5,
	NM_RDBLCLK         = NM_FIRST - 6,
	NM_SETFOCUS        = NM_FIRST - 7,
	NM_KILLFOCUS       = NM_FIRST - 8,
	NM_CUSTOMDRAW      = NM_FIRST - 12,
	NM_HOVER           = NM_FIRST - 13,
	NM_NCHITTEST       = NM_FIRST - 14,
	NM_KEYDOWN         = NM_FIRST - 15,
	NM_RELEASEDCAPTURE = NM_FIRST - 16,
	NM_SETCURSOR       = NM_FIRST - 17,
	NM_CHAR            = NM_FIRST - 18,
	NM_TOOLTIPSCREATED = NM_FIRST - 19,
	NM_LDOWN           = NM_FIRST - 20,
	NM_RDOWN           = NM_FIRST - 21,
	NM_THEMECHANGED    = NM_FIRST - 22,
	//(_WIN32_WINNT >= 0x0600)
		NM_FONTCHANGED          = NM_FIRST - 23,
		NM_CUSTOMTEXT           = NM_FIRST - 24,
		NM_TVSTATEIMAGECHANGING = NM_FIRST - 24,
}

struct NMTOOLTIPSCREATED {
	NMHDR hdr;
	HWND hwndToolTips;
}
alias NMTOOLTIPSCREATED* LPNMTOOLTIPSCREATED;

struct NMMOUSE {
	NMHDR hdr;
	DWORD_PTR dwItemSpec;
	DWORD_PTR dwItemData;
	POINT pt;
	LPARAM dwHitInfo;
}
alias NMMOUSE* LPNMMOUSE;

alias NMMOUSE NMCLICK;
alias LPNMMOUSE LPNMCLICK;

struct NMOBJECTNOTIFY {
	NMHDR hdr;
	int iItem;
	const IID* piid;
	void* pObject;
	HRESULT hResult;
	DWORD dwFlags;
}
alias NMOBJECTNOTIFY* LPNMOBJECTNOTIFY;

struct NMKEY {
	NMHDR hdr;
	UINT nVKey;
	UINT uFlags;
}
alias NMKEY* LPNMKEY;

struct NMCHAR {
	NMHDR hdr;
	UINT ch;
	DWORD dwItemPrev;
	DWORD dwItemNext;
}
alias NMCHAR* LPNMCHAR;


//(_WIN32_IE >= _WIN32_WINNT_VISTA)
	struct NMCUSTOMTEXT {
		NMHDR hdr;
		HDC hDC;
		LPCWSTR lpString;
		int nCount;
		LPRECT lpRect;
		UINT uFormat;
		BOOL fLink;
	}
	alias NMCUSTOMTEXT* LPNMCUSTOMTEXT;

enum {
	DTN_FIRST  = -740U,
	DTN_LAST   = -745U,
	MCN_FIRST  = -746U,
	MCN_LAST   = -752U,
	DTN_FIRST2 = -753U,
	DTN_LAST2  = -799U,
	CBEN_FIRST = -800U,
	CBEN_LAST  = -830U,
	RBN_FIRST  = -831U,
	RBN_LAST   = -859U,
	IPN_FIRST = 0U-860U,
	IPN_LAST  = 0U-879U,
	SBN_FIRST = 0U-880U,
	SBN_LAST  = 0U-899U,
	PGN_FIRST = 0U-900U,
	PGN_LAST  = 0U-950U,
	WMN_FIRST = 0U-1000U,
	WMN_LAST  = 0U-1200U,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		BCN_FIRST = 0U-1250U,
		BCN_LAST  = 0U-1350U,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		TRBN_FIRST = 0U-1501U,
		TRBN_LAST  = 0U-1519U,
}
enum {
	MSGF_COMMCTRL_BEGINDRAG   = 0x4200,
	MSGF_COMMCTRL_SIZEHEADER  = 0x4201,
	MSGF_COMMCTRL_DRAGSELECT  = 0x4202,
	MSGF_COMMCTRL_TOOLBARCUST = 0x4203,
}

enum {
	CDRF_DODEFAULT         = 0x00000000,
	CDRF_NEWFONT           = 0x00000002,
	CDRF_SKIPDEFAULT       = 0x00000004,
	CDRF_DOERASE           = 0x00000008,
	CDRF_SKIPPOSTPAINT     = 0x00000100,
	CDRF_NOTIFYPOSTPAINT   = 0x00000010,
	CDRF_NOTIFYITEMDRAW    = 0x00000020,
	CDRF_NOTIFYSUBITEMDRAW = 0x00000020,
	CDRF_NOTIFYPOSTERASE   = 0x00000040,
}
enum {
	CDDS_PREPAINT      = 0x00000001,
	CDDS_POSTPAINT     = 0x00000002,
	CDDS_PREERASE      = 0x00000003,
	CDDS_POSTERASE     = 0x00000004,
	CDDS_ITEM          = 0x00010000,
	CDDS_ITEMPREPAINT  = CDDS_ITEM | CDDS_PREPAINT,
	CDDS_ITEMPOSTPAINT = CDDS_ITEM | CDDS_POSTPAINT,
	CDDS_ITEMPREERASE  = CDDS_ITEM | CDDS_PREERASE,
	CDDS_ITEMPOSTERASE = CDDS_ITEM | CDDS_POSTERASE,
	CDDS_SUBITEM       = 0x00020000,
}
enum {
	CDIS_SELECTED      = 0x0001,
	CDIS_GRAYED        = 0x0002,
	CDIS_DISABLED      = 0x0004,
	CDIS_CHECKED       = 0x0008,
	CDIS_FOCUS         = 0x0010,
	CDIS_DEFAULT       = 0x0020,
	CDIS_HOT           = 0x0040,
	CDIS_MARKED        = 0x0080,
	CDIS_INDETERMINATE = 0x0100,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		CDIS_SHOWKEYBOARDCUES = 0x0200,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		CDIS_NEARHOT          = 0x0400,
		CDIS_OTHERSIDEHOT     = 0x0800,
		CDIS_DROPHILITED      = 0x1000,
}
struct NMCUSTOMDRAW {
	NMHDR hdr;
	DWORD dwDrawStage;
	HDC hdc;
	RECT rc;
	DWORD_PTR dwItemSpec;
	UINT uItemState;
	LPARAM lItemlParam;
}
alias NMCUSTOMDRAW* LPNMCUSTOMDRAW;

struct NMTTCUSTOMDRAW {
	NMCUSTOMDRAW nmcd;
	UINT uDrawFlags;
}
alias NMTTCUSTOMDRAW* LPNMTTCUSTOMDRAW;

struct NMCUSTOMSPLITRECTINFO {
	NMHDR hdr;
	RECT rcClient;
	RECT rcButton;
	RECT rcSplit;
}
alias NMCUSTOMSPLITRECTINFO* LPNMCUSTOMSPLITRECTINFO;

enum NM_GETCUSTOMSPLITRECT = BCN_FIRST + 0x0003;

enum {
	CLR_NONE    = 0xFFFFFFFF,
	CLR_DEFAULT = 0xFF000000,
}

//-------------------------------------------------------------------

enum HIMAGELIST : void* {init = (void*).init}

struct IMAGELISTDRAWPARAMS {
	DWORD cbSize;
	HIMAGELIST himl;
	int i;
	HDC hdcDst;
	int x;
	int y;
	int cx;
	int cy;
	int xBitmap;
	int yBitmap;
	COLORREF rgbBk;
	COLORREF rgbFg;
	UINT fStyle;
	DWORD dwRop;
	//(_WIN32_IE >= _WIN32_WINNT_WINXP)
		DWORD fState;
		DWORD Frame;
		COLORREF crEffect;
}
alias IMAGELISTDRAWPARAMS* LPIMAGELISTDRAWPARAMS;

enum IMAGELISTDRAWPARAMS_V3_SIZE = IMAGELISTDRAWPARAMS.dwRop.offsetof + IMAGELISTDRAWPARAMS.dwRop.sizeof;

enum {
	ILC_MASK     = 0x00000001,
	ILC_COLOR    = 0x00000000,
	ILC_COLORDDB = 0x000000FE,
	ILC_COLOR4   = 0x00000004,
	ILC_COLOR8   = 0x00000008,
	ILC_COLOR16  = 0x00000010,
	ILC_COLOR24  = 0x00000018,
	ILC_COLOR32  = 0x00000020,
	ILC_PALETTE  = 0x00000800,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		ILC_MIRROR        = 0x00002000,
		ILC_PERITEMMIRROR = 0x00008000,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		ILC_ORIGINALSIZE     = 0x00010000,
		ILC_HIGHQUALITYSCALE = 0x00020000,
}
export extern(Windows) HIMAGELIST ImageList_Create(int cx, int cy, UINT flags, int cInitial, int cGrow);
export extern(Windows) BOOL ImageList_Destroy(HIMAGELIST himl);
export extern(Windows) int ImageList_GetImageCount(HIMAGELIST himl);
export extern(Windows) BOOL ImageList_SetImageCount(HIMAGELIST himl, UINT uNewCount);
export extern(Windows) int ImageList_Add(HIMAGELIST himl, HBITMAP hbmImage, HBITMAP hbmMask);
export extern(Windows) int ImageList_ReplaceIcon(HIMAGELIST himl, int i, HICON hicon);
export extern(Windows) COLORREF ImageList_SetBkColor(HIMAGELIST himl, COLORREF clrBk);
export extern(Windows) COLORREF ImageList_GetBkColor(HIMAGELIST himl);
export extern(Windows) BOOL ImageList_SetOverlayImage(HIMAGELIST himl, int iImage, int iOverlay);

enum {
	ILD_NORMAL      = 0x00000000,
	ILD_TRANSPARENT = 0x00000001,
	ILD_MASK        = 0x00000010,
	ILD_IMAGE       = 0x00000020,
	ILD_ROP         = 0x00000040,
	ILD_BLEND25     = 0x00000002,
	ILD_BLEND50     = 0x00000004,
	ILD_OVERLAYMASK = 0x00000F00,
}

pure nothrow
UINT INDEXTOOVERLAYMASK(UINT i)
{
	return i << 8;
}

enum {
	ILD_PRESERVEALPHA = 0x00001000,
	ILD_SCALE         = 0x00002000,
	ILD_DPISCALE      = 0x00004000,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		ILD_ASYNC = 0x00008000,
	ILD_SELECTED      = ILD_BLEND50,
	ILD_FOCUS         = ILD_BLEND25,
	ILD_BLEND         = ILD_BLEND50,
	CLR_HILIGHT       = CLR_DEFAULT,
	ILS_NORMAL        = 0x00000000,
	ILS_GLOW          = 0x00000001,
	ILS_SHADOW        = 0x00000002,
	ILS_SATURATE      = 0x00000004,
	ILS_ALPHA         = 0x00000008,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		ILGT_NORMAL = 0x00000000,
		ILGT_ASYNC  = 0x00000001,
}

export extern(Windows) BOOL ImageList_Draw(HIMAGELIST himl, int i, HDC hdcDst, int x, int y, UINT fStyle);

//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	const HBITMAP HBITMAP_CALLBACK = cast(HBITMAP)-1;

export extern(Windows) BOOL ImageList_Replace(HIMAGELIST himl, int i, HBITMAP hbmImage, HBITMAP hbmMask);
export extern(Windows) int ImageList_AddMasked(HIMAGELIST himl, HBITMAP hbmImage, COLORREF crMask);
export extern(Windows) BOOL ImageList_DrawEx(HIMAGELIST himl, int i, HDC hdcDst, int x, int y, int dx, int dy, COLORREF rgbBk, COLORREF rgbFg, UINT fStyle);
export extern(Windows) BOOL ImageList_DrawIndirect(IMAGELISTDRAWPARAMS* pimldp);
export extern(Windows) BOOL ImageList_Remove(HIMAGELIST himl, int i);
export extern(Windows) HICON ImageList_GetIcon(HIMAGELIST himl, int i, UINT flags);
export extern(Windows) HIMAGELIST ImageList_LoadImageA(HINSTANCE hi, LPCSTR lpbmp, int cx, int cGrow, COLORREF crMask, UINT uType, UINT uFlags);
export extern(Windows) HIMAGELIST ImageList_LoadImageW(HINSTANCE hi, LPCWSTR lpbmp, int cx, int cGrow, COLORREF crMask, UINT uType, UINT uFlags);
version(UNICODE)
	alias ImageList_LoadImageW ImageList_LoadImage;
else
	alias ImageList_LoadImageA ImageList_LoadImage;

enum {
	ILCF_MOVE = 0x00000000,
	ILCF_SWAP = 0x00000001,
}
export extern(Windows) BOOL ImageList_Copy(HIMAGELIST himlDst, int iDst, HIMAGELIST himlSrc, int iSrc, UINT uFlags);

export extern(Windows) BOOL ImageList_BeginDrag(HIMAGELIST himlTrack, int iTrack, int dxHotspot, int dyHotspot);
export extern(Windows) void ImageList_EndDrag();
export extern(Windows) BOOL ImageList_DragEnter(HWND hwndLock, int x, int y);
export extern(Windows) BOOL ImageList_DragLeave(HWND hwndLock);
export extern(Windows) BOOL ImageList_DragMove(int x, int y);
export extern(Windows) BOOL ImageList_SetDragCursorImage(HIMAGELIST himlDrag, int iDrag, int dxHotspot, int dyHotspot);
export extern(Windows) BOOL ImageList_DragShowNolock(BOOL fShow);
export extern(Windows) HIMAGELIST ImageList_GetDragImage(POINT* ppt, POINT* pptHotspot);

export extern(Windows) HIMAGELIST ImageList_Read(IStream pstm);
export extern(Windows) BOOL ImageList_Write(HIMAGELIST himl, IStream pstm);

enum {//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	ILP_NORMAL    = 0,
	ILP_DOWNLEVEL = 1,
}
static if(_WIN32_WINNT >= _WIN32_WINNT_WINXP){
	export extern(Windows) HRESULT ImageList_ReadEx(DWORD dwFlags, IStream pstm, REFIID riid, PVOID* ppv);
	export extern(Windows) HRESULT ImageList_WriteEx(HIMAGELIST himl, DWORD dwFlags, IStream pstm);
}

struct IMAGEINFO {
	HBITMAP hbmImage;
	HBITMAP hbmMask;
	int Unused1;
	int Unused2;
	RECT rcImage;
}
alias IMAGEINFO* LPIMAGEINFO;

export extern(Windows) BOOL ImageList_GetIconSize(HIMAGELIST himl, int* cx, int* cy);
export extern(Windows) BOOL ImageList_SetIconSize(HIMAGELIST himl, int cx, int cy);
export extern(Windows) BOOL ImageList_GetImageInfo(HIMAGELIST himl, int i, IMAGEINFO* pImageInfo);
export extern(Windows) HIMAGELIST ImageList_Merge(HIMAGELIST himl1, int i1, HIMAGELIST himl2, int i2, int dx, int dy);

export extern(Windows) HIMAGELIST ImageList_Duplicate(HIMAGELIST himl);

static if(_WIN32_WINNT >= _WIN32_WINNT_WINXP){
	export extern(Windows) HRESULT HIMAGELIST_QueryInterface(HIMAGELIST himl, REFIID riid, void** ppv);
	//	IImageListToHIMAGELIST(himl) ((HIMAGELIST)(himl))
}

version(HelperFunctions){
	int ImageList_AddIcon(HIMAGELIST himl, HICON hicon)
	{
		return ImageList_ReplaceIcon(himl, -1, hicon);
	}

	BOOL ImageList_RemoveAll(HIMAGELIST himl)
	{
		return ImageList_Remove(himl, -1);
	}

	HICON ImageList_ExtractIcon(HINSTANCE hi, HIMAGELIST himl, int i)
	{
		return ImageList_GetIcon(himl, i, 0);
	}

	HIMAGELIST ImageList_LoadBitmap(HINSTANCE hi, LPCTSTR lpbmp, int cx, int cGrow, COLORREF crMask)
	{
		return ImageList_LoadImage(hi, lpbmp, cx, cGrow, crMask, IMAGE_BITMAP, 0);
	}
}

//-------------------------------------------------------------------
const char* WC_HEADERA = "SysHeader32";
const wchar* WC_HEADERW = "SysHeader32";
version(UNICODE)
	alias WC_HEADERW WC_HEADER;
else
	alias WC_HEADERA WC_HEADER;

enum {
	HDS_HORZ      = 0x0000,
	HDS_BUTTONS   = 0x0002,
	HDS_HOTTRACK  = 0x0004,
	HDS_HIDDEN    = 0x0008,
	HDS_DRAGDROP  = 0x0040,
	HDS_FULLDRAG  = 0x0080,
	HDS_FILTERBAR = 0x0100,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		HDS_FLAT       = 0x0200,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		HDS_CHECKBOXES = 0x0400,
		HDS_NOSIZING   = 0x0800,
		HDS_OVERFLOW   = 0x1000,
}

enum {
	HDFT_ISSTRING   = 0x0000,
	HDFT_ISNUMBER   = 0x0001,
	HDFT_ISDATE     = 0x0002,
	HDFT_HASNOVALUE = 0x8000,
}
version(UNICODE){
	alias HD_TEXTFILTERW HD_TEXTFILTER;
	alias HD_TEXTFILTERW HDTEXTFILTER;
	alias LPHD_TEXTFILTERW LPHD_TEXTFILTER;
	alias LPHD_TEXTFILTERW LPHDTEXTFILTER;
}else{
	alias HD_TEXTFILTERA HD_TEXTFILTER;
	alias HD_TEXTFILTERA HDTEXTFILTER;
	alias LPHD_TEXTFILTERA LPHD_TEXTFILTER;
	alias LPHD_TEXTFILTERA LPHDTEXTFILTER;
}

struct HD_TEXTFILTERA {
	LPSTR pszText;
	INT cchTextMax;
}
alias HD_TEXTFILTERA* LPHD_TEXTFILTERA;

struct HD_TEXTFILTERW {
	LPWSTR pszText;
	INT cchTextMax;
}
alias HD_TEXTFILTERW* LPHD_TEXTFILTERW;

struct HDITEMA {
	UINT mask;
	int cxy;
	LPSTR pszText;
	HBITMAP hbm;
	int cchTextMax;
	int fmt;
	LPARAM lParam;
	int iImage;
	int iOrder;
	UINT type;
	void* pvFilter;
	//(_WIN32_WINNT >= 0x0600)
		UINT state;
}
alias HDITEMA* LPHDITEMA;

struct HDITEMW {
	UINT mask;
	int cxy;
	LPWSTR pszText;
	HBITMAP hbm;
	int cchTextMax;
	int fmt;
	LPARAM lParam;
	int iImage;
	int iOrder;
	UINT type;
	void* pvFilter;
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		UINT state;
}
alias HDITEMW* LPHDITEMW;

enum HDITEMA_V1_SIZE = HDITEMA.lParam.offsetof + HDITEMA.lParam.sizeof;
enum HDITEMW_V1_SIZE = HDITEMW.lParam.offsetof + HDITEMW.lParam.sizeof;

//alias HDITEMA HD_ITEMA;
//alias HDITEMW HD_ITEMW;
//alias HDITEM HD_ITEM;
version(UNICODE){
	alias HDITEMW HDITEM;
	alias LPHDITEMW LPHDITEM;
	enum HDITEM_V1_SIZE = HDITEMW_V1_SIZE;
}else{
	alias HDITEMA HDITEM;
	alias LPHDITEMA LPHDITEM;
	enum HDITEM_V1_SIZE = HDITEMA_V1_SIZE;
}

enum {
	HDI_WIDTH      = 0x0001,
	HDI_HEIGHT     = HDI_WIDTH,
	HDI_TEXT       = 0x0002,
	HDI_FORMAT     = 0x0004,
	HDI_LPARAM     = 0x0008,
	HDI_BITMAP     = 0x0010,
	HDI_IMAGE      = 0x0020,
	HDI_DI_SETITEM = 0x0040,
	HDI_ORDER      = 0x0080,
	HDI_FILTER     = 0x0100,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		HDI_STATE = 0x0200,
}

enum {
	HDF_LEFT            = 0x0000,
	HDF_RIGHT           = 0x0001,
	HDF_CENTER          = 0x0002,
	HDF_JUSTIFYMASK     = 0x0003,
	HDF_RTLREADING      = 0x0004,
	HDF_BITMAP          = 0x2000,
	HDF_STRING          = 0x4000,
	HDF_OWNERDRAW       = 0x8000,
	HDF_IMAGE           = 0x0800,
	HDF_BITMAP_ON_RIGHT = 0x1000,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		HDF_SORTUP      = 0x0400,
		HDF_SORTDOWN    = 0x0200,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		HDF_CHECKBOX    = 0x0040,
		HDF_CHECKED     = 0x0080,
		HDF_FIXEDWIDTH  = 0x0100,
		HDF_SPLITBUTTON = 0x1000000,
}
//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	enum HDIS_FOCUSED = 0x00000001;

enum {
	HDM_GETITEMCOUNT = HDM_FIRST + 0,
	HDM_INSERTITEMA  = HDM_FIRST + 1,
	HDM_INSERTITEMW  = HDM_FIRST + 10,
}
version(UNICODE)
	enum HDM_INSERTITEM = HDM_INSERTITEMW;
else
	enum HDM_INSERTITEM = HDM_INSERTITEMA;

enum HDM_DELETEITEM = HDM_FIRST + 2;

enum {
	HDM_GETITEMA = HDM_FIRST + 3,
	HDM_GETITEMW = HDM_FIRST + 11,
}
version(UNICODE)
	enum HDM_GETITEM = HDM_GETITEMW;
else
	enum HDM_GETITEM = HDM_GETITEMA;

enum {
	HDM_SETITEMA = HDM_FIRST + 4,
	HDM_SETITEMW = HDM_FIRST + 12,
}
version(UNICODE)
	enum HDM_SETITEM = HDM_SETITEMW;
else
	enum HDM_SETITEM = HDM_SETITEMA;

struct HDLAYOUT {
	RECT* prc;
	WINDOWPOS* pwpos;
}
alias HDLAYOUT* LPHDLAYOUT;

enum HDM_LAYOUT = HDM_FIRST + 5;
//alias HDLAYOUT HD_LAYOUT;

enum {
	HHT_NOWHERE        = 0x0001,
	HHT_ONHEADER       = 0x0002,
	HHT_ONDIVIDER      = 0x0004,
	HHT_ONDIVOPEN      = 0x0008,
	HHT_ONFILTER       = 0x0010,
	HHT_ONFILTERBUTTON = 0x0020,
	HHT_ABOVE          = 0x0100,
	HHT_BELOW          = 0x0200,
	HHT_TORIGHT        = 0x0400,
	HHT_TOLEFT         = 0x0800,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		HHT_ONITEMSTATEICON = 0x1000,
		HHT_ONDROPDOWN      = 0x2000,
		HHT_ONOVERFLOW      = 0x4000,
}

struct HDHITTESTINFO {
	POINT pt;
	UINT flags;
	int iItem;
}
alias HDHITTESTINFO* LPHDHITTESTINFO;
//alias HDHITTESTINFO HD_HITTESTINFO;

enum {
	HDSIL_NORMAL = 0,
	HDSIL_STATE  = 1,
}
enum {
	HDM_HITTEST                = HDM_FIRST + 6,
	HDM_GETITEMRECT            = HDM_FIRST + 7,
	HDM_SETIMAGELIST           = HDM_FIRST + 8,
	HDM_GETIMAGELIST           = HDM_FIRST + 9,
	HDM_ORDERTOINDEX           = HDM_FIRST + 15,
	HDM_CREATEDRAGIMAGE        = HDM_FIRST + 16,
	HDM_GETORDERARRAY          = HDM_FIRST + 17,
	HDM_SETORDERARRAY          = HDM_FIRST + 18,
	HDM_SETHOTDIVIDER          = HDM_FIRST + 19,
	HDM_SETBITMAPMARGIN        = HDM_FIRST + 20,
	HDM_GETBITMAPMARGIN        = HDM_FIRST + 21,
	HDM_SETUNICODEFORMAT       = CCM_SETUNICODEFORMAT,
	HDM_GETUNICODEFORMAT       = CCM_GETUNICODEFORMAT,
	HDM_SETFILTERCHANGETIMEOUT = HDM_FIRST + 22,
	HDM_EDITFILTER             = HDM_FIRST + 23,
	HDM_CLEARFILTER            = HDM_FIRST + 24,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		HDM_GETITEMDROPDOWNRECT = HDM_FIRST + 25,
		HDM_GETOVERFLOWRECT     = HDM_FIRST + 26,
		HDM_GETFOCUSEDITEM      = HDM_FIRST + 27,
		HDM_SETFOCUSEDITEM      = HDM_FIRST + 28,
}

//(_WIN32_IE >= 0x0600)
//	enum HDM_TRANSLATEACCELERATOR = CCM_TRANSLATEACCELERATOR;
enum {
	TB_GETSTRINGW = WM_USER + 91,
	TB_GETSTRINGA = WM_USER + 92,
}
version(UNICODE)
	enum TB_GETSTRING = TB_GETSTRINGW;
else
	enum TB_GETSTRING = TB_GETSTRINGA;
enum {
	TB_SETHOTITEM2          = WM_USER + 94,
	TB_SETLISTGAP           = WM_USER + 96,
	TB_GETIMAGELISTCOUNT    = WM_USER + 98,
	TB_GETIDEALSIZE         = WM_USER + 99,
	//TB_TRANSLATEACCELERATOR = CCM_TRANSLATEACCELERATOR,
}

enum {
	HDN_ITEMCHANGINGA    = HDN_FIRST-0,
	HDN_ITEMCHANGINGW    = HDN_FIRST-20,
	HDN_ITEMCHANGEDA     = HDN_FIRST-1,
	HDN_ITEMCHANGEDW     = HDN_FIRST-21,
	HDN_ITEMCLICKA       = HDN_FIRST-2,
	HDN_ITEMCLICKW       = HDN_FIRST-22,
	HDN_ITEMDBLCLICKA    = HDN_FIRST-3,
	HDN_ITEMDBLCLICKW    = HDN_FIRST-23,
	HDN_DIVIDERDBLCLICKA = HDN_FIRST-5,
	HDN_DIVIDERDBLCLICKW = HDN_FIRST-25,
	HDN_BEGINTRACKA      = HDN_FIRST-6,
	HDN_BEGINTRACKW      = HDN_FIRST-26,
	HDN_ENDTRACKA        = HDN_FIRST-7,
	HDN_ENDTRACKW        = HDN_FIRST-27,
	HDN_TRACKA           = HDN_FIRST-8,
	HDN_TRACKW           = HDN_FIRST-28,
	HDN_GETDISPINFOA     = HDN_FIRST-9,
	HDN_GETDISPINFOW     = HDN_FIRST-29,
	HDN_BEGINDRAG        = HDN_FIRST-10,
	HDN_ENDDRAG          = HDN_FIRST-11,
	HDN_FILTERCHANGE     = HDN_FIRST-12,
	HDN_FILTERBTNCLICK   = HDN_FIRST-13,
	HDN_BEGINFILTEREDIT  = HDN_FIRST-14,
	HDN_ENDFILTEREDIT    = HDN_FIRST-15,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		HDN_ITEMSTATEICONCLICK = HDN_FIRST-16,
		HDN_ITEMKEYDOWN        = HDN_FIRST-17,
		HDN_DROPDOWN           = HDN_FIRST-18,
		HDN_OVERFLOWCLICK      = HDN_FIRST-19,
}

version(UNICODE){
	enum {
		HDN_ITEMCHANGING    = HDN_ITEMCHANGINGW,
		HDN_ITEMCHANGED     = HDN_ITEMCHANGEDW,
		HDN_ITEMCLICK       = HDN_ITEMCLICKW,
		HDN_ITEMDBLCLICK    = HDN_ITEMDBLCLICKW,
		HDN_DIVIDERDBLCLICK = HDN_DIVIDERDBLCLICKW,
		HDN_BEGINTRACK      = HDN_BEGINTRACKW,
		HDN_ENDTRACK        = HDN_ENDTRACKW,
		HDN_TRACK           = HDN_TRACKW,
		HDN_GETDISPINFO     = HDN_GETDISPINFOW,
	}
}else{
	enum {
		HDN_ITEMCHANGING    = HDN_ITEMCHANGINGA,
		HDN_ITEMCHANGED     = HDN_ITEMCHANGEDA,
		HDN_ITEMCLICK       = HDN_ITEMCLICKA,
		HDN_ITEMDBLCLICK    = HDN_ITEMDBLCLICKA,
		HDN_DIVIDERDBLCLICK = HDN_DIVIDERDBLCLICKA,
		HDN_BEGINTRACK      = HDN_BEGINTRACKA,
		HDN_ENDTRACK        = HDN_ENDTRACKA,
		HDN_TRACK           = HDN_TRACKA,
		HDN_GETDISPINFO     = HDN_GETDISPINFOA,
	}
}

struct NMHEADERA {
	NMHDR hdr;
	int iItem;
	int iButton;
	HDITEMA* pitem;
}
alias NMHEADERA* LPNMHEADERA;

struct NMHEADERW {
	NMHDR hdr;
	int iItem;
	int iButton;
	HDITEMW* pitem;
}
alias NMHEADERW* LPNMHEADERW;

//alias NMHEADERA HD_NOTIFYA;
//alias NMHEADERW HD_NOTIFYW;
version(UNICODE){
	alias NMHEADERW NMHEADER;
	alias LPNMHEADERW LPNMHEADER;
}else{
	alias NMHEADERA NMHEADER;
	alias LPNMHEADERA LPNMHEADER;
}
alias NMHEADER HD_NOTIFY;

struct NMHDDISPINFOW {
	NMHDR hdr;
	int iItem;
	UINT mask;
	LPWSTR pszText;
	int cchTextMax;
	int iImage;
	LPARAM lParam;
}
alias NMHDDISPINFOW* LPNMHDDISPINFOW;

struct NMHDDISPINFOA {
	NMHDR hdr;
	int iItem;
	UINT mask;
	LPSTR pszText;
	int cchTextMax;
	int iImage;
	LPARAM lParam;
}
alias NMHDDISPINFOA* LPNMHDDISPINFOA;

version(UNICODE){
	alias NMHDDISPINFOW NMHDDISPINFO;
	alias LPNMHDDISPINFOW LPNMHDDISPINFO;
}else{
	alias NMHDDISPINFOA NMHDDISPINFO;
	alias LPNMHDDISPINFOA LPNMHDDISPINFO;
}

struct NMHDFILTERBTNCLICK {
	NMHDR hdr;
	INT iItem;
	RECT rc;
}
alias NMHDFILTERBTNCLICK* LPNMHDFILTERBTNCLICK;


version(HelperFunctions){
	int Header_GetItemCount(HWND hwndHD)
	{
		return cast(int)SendMessage(hwndHD, HDM_GETITEMCOUNT, 0, 0);
	}

	int Header_InsertItem(HWND hwndHD, int i, const(HDITEM)* phdi)
	{
		return cast(int)SendMessage(hwndHD, HDM_INSERTITEM, cast(WPARAM)i, cast(LPARAM)phdi);
	}

	BOOL Header_DeleteItem(HWND hwndHD, int i)
	{
		return cast(BOOL)SendMessage(hwndHD, HDM_DELETEITEM, cast(WPARAM)i, 0);
	}

	BOOL Header_GetItem(HWND hwndHD, int i, HDITEM* phdi)
	{
		return cast(BOOL)SendMessage(hwndHD, HDM_GETITEM, cast(WPARAM)i, cast(LPARAM)phdi);
	}

	BOOL Header_SetItem(HWND hwndHD, int i, const(HDITEM)* phdi)
	{
		return cast(BOOL)SendMessage(hwndHD, HDM_SETITEM, cast(WPARAM)i, cast(LPARAM)phdi);
	}

	BOOL Header_Layout(HWND hwndHD, HDLAYOUT* playout)
	{
		return cast(BOOL)SendMessage(hwndHD, HDM_LAYOUT, 0,  cast(LPARAM)playout);
	}

	BOOL Header_GetItemRect(HWND hwnd, int iItem, LPRECT lprc)
	{
		return cast(BOOL)SendMessage(hwnd, HDM_GETITEMRECT, cast(WPARAM)iItem, cast(LPARAM)lprc);
	}

	HIMAGELIST Header_SetImageList(HWND hwnd, HIMAGELIST himl)
	{
		return cast(HIMAGELIST)SendMessage(hwnd, HDM_SETIMAGELIST, HDSIL_NORMAL, cast(LPARAM)himl);
	}

	HIMAGELIST Header_SetStateImageList(HWND hwnd, HIMAGELIST himl)
	{
		return cast(HIMAGELIST)SendMessage(hwnd, HDM_SETIMAGELIST, HDSIL_STATE, cast(LPARAM)himl);
	}

	HIMAGELIST Header_GetImageList(HWND hwnd)
	{
		return cast(HIMAGELIST)SendMessage(hwnd, HDM_GETIMAGELIST, HDSIL_NORMAL, 0);
	}

	HIMAGELIST Header_GetStateImageList(HWND hwnd)
	{
		return cast(HIMAGELIST)SendMessage(hwnd, HDM_GETIMAGELIST, HDSIL_STATE, 0);
	}

	int Header_OrderToIndex(HWND hwnd, int i)
	{
		return cast(int)SendMessage(hwnd, HDM_ORDERTOINDEX, cast(WPARAM)i, 0);
	}

	HIMAGELIST Header_CreateDragImage(HWND hwnd, int i)
	{
		return cast(HIMAGELIST)SendMessage(hwnd, HDM_CREATEDRAGIMAGE, cast(WPARAM)i, 0);
	}

	BOOL Header_GetOrderArray(HWND hwnd, int iCount, int* lpi)
	{
		return cast(BOOL)SendMessage(hwnd, HDM_GETORDERARRAY, cast(WPARAM)iCount, cast(LPARAM)lpi);
	}

	BOOL Header_SetOrderArray(HWND hwnd, int iCount, int* lpi)
	{
		return cast(BOOL)SendMessage(hwnd, HDM_SETORDERARRAY, cast(WPARAM)iCount, cast(LPARAM)lpi);
	}

	int Header_SetHotDivider(HWND hwnd, BOOL fPos, DWORD dw)
	{
		return cast(int)SendMessage(hwnd, HDM_SETHOTDIVIDER, cast(WPARAM)fPos, cast(LPARAM)dw);
	}

	BOOL Header_SetUnicodeFormat(HWND hwnd, BOOL fUnicode)
	{
		return cast(BOOL)SendMessage(hwnd, HDM_SETUNICODEFORMAT, cast(WPARAM)fUnicode, 0);
	}

	BOOL Header_GetUnicodeFormat(HWND hwnd)
	{
		return cast(BOOL)SendMessage(hwnd, HDM_GETUNICODEFORMAT, 0, 0);
	}

	int Header_SetBitmapMargin(HWND hwnd, int iWidth)
	{
		return cast(int)SendMessage(hwnd, HDM_SETBITMAPMARGIN, cast(WPARAM)iWidth, 0);
	}

	int Header_GetBitmapMargin(HWND hwnd)
	{
		return cast(int)SendMessage(hwnd, HDM_GETBITMAPMARGIN, 0, 0);
	}

	int Header_SetFilterChangeTimeout(HWND hwnd, int i)
	{
		return cast(int)SendMessage(hwnd, HDM_SETFILTERCHANGETIMEOUT, 0, cast(LPARAM)i);
	}

	int Header_EditFilter(HWND hwnd, int i, BOOL fDiscardChanges)
	{
		return cast(int)SendMessage(hwnd, HDM_EDITFILTER, cast(WPARAM)i, MAKELPARAM(cast(WORD)fDiscardChanges, cast(WORD)0));
	}

	int Header_ClearFilter(HWND hwnd, int i)
	{
		return cast(int)SendMessage(hwnd, HDM_CLEARFILTER, cast(WPARAM)i, 0);
	}

	int Header_ClearAllFilters(HWND hwnd)
	{
		return cast(int)SendMessage(hwnd, HDM_CLEARFILTER, cast(WPARAM)-1, 0);
	}

	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		BOOL Header_GetItemDropDownRect(HWND hwnd, int iItem, LPRECT lprc)
		{
			return cast(BOOL)SendMessage(hwnd, HDM_GETITEMDROPDOWNRECT, cast(WPARAM)iItem, cast(LPARAM)lprc);
		}

		BOOL Header_GetOverflowRect(HWND hwnd, LPRECT lprc)
		{
			return cast(BOOL)SendMessage(hwnd, HDM_GETOVERFLOWRECT, 0, cast(LPARAM)lprc);
		}

		int Header_GetFocusedItem(HWND hwnd)
		{
			return cast(int)SendMessage(hwnd, HDM_GETFOCUSEDITEM, 0, 0);
		}

		BOOL Header_SetFocusedItem(HWND hwnd, int iItem)
		{
			return cast(BOOL)SendMessage(hwnd, HDM_SETFOCUSEDITEM, 0, cast(LPARAM)iItem);
		}
}

//-------------------------------------------------------------------
const wchar* TOOLBARCLASSNAMEW = "ToolbarWindow32";
const char* TOOLBARCLASSNAMEA = "ToolbarWindow32";
version(UNICODE)
	alias TOOLBARCLASSNAMEW TOOLBARCLASSNAME;
else
	alias TOOLBARCLASSNAMEA TOOLBARCLASSNAME;

struct TBBUTTON {
	int iBitmap;
	int idCommand;
	BYTE fsState;
	BYTE fsStyle;
	version(Win64)
		BYTE[6] bReserved;
	version(Win64)
		BYTE[2] bReserved2;
	DWORD_PTR dwData;
	INT_PTR iString;
}
alias TBBUTTON* PTBBUTTON;
alias TBBUTTON* LPTBBUTTON;
alias const(TBBUTTON)* LPCTBBUTTON;

struct COLORMAP {
	COLORREF from;
	COLORREF to;
}
alias COLORMAP* LPCOLORMAP;

export extern(Windows) HWND CreateToolbarEx(HWND hwnd, DWORD ws, UINT wID, int nBitmaps, HINSTANCE hBMInst, UINT_PTR wBMID, LPCTBBUTTON lpButtons, int iNumButtons, int dxButton, int dyButton, int dxBitmap, int dyBitmap, UINT uStructSize);
export extern(Windows) HBITMAP CreateMappedBitmap(HINSTANCE hInstance, INT_PTR idBitmap, UINT wFlags, LPCOLORMAP lpColorMap, int iNumMaps);
enum {
	CMB_MASKED            = 0x02,
	TBSTATE_CHECKED       = 0x01,
	TBSTATE_PRESSED       = 0x02,
	TBSTATE_ENABLED       = 0x04,
	TBSTATE_HIDDEN        = 0x08,
	TBSTATE_INDETERMINATE = 0x10,
	TBSTATE_WRAP          = 0x20,
	TBSTATE_ELLIPSES      = 0x40,
	TBSTATE_MARKED        = 0x80,
	TBSTYLE_BUTTON        = 0x0000,
	TBSTYLE_SEP           = 0x0001,
	TBSTYLE_CHECK         = 0x0002,
	TBSTYLE_GROUP         = 0x0004,
	TBSTYLE_CHECKGROUP    = TBSTYLE_GROUP | TBSTYLE_CHECK,
	TBSTYLE_DROPDOWN      = 0x0008,
	TBSTYLE_AUTOSIZE      = 0x0010,
	TBSTYLE_NOPREFIX      = 0x0020,
	TBSTYLE_TOOLTIPS      = 0x0100,
	TBSTYLE_WRAPABLE      = 0x0200,
	TBSTYLE_ALTDRAG       = 0x0400,
	TBSTYLE_FLAT          = 0x0800,
	TBSTYLE_LIST          = 0x1000,
	TBSTYLE_CUSTOMERASE   = 0x2000,
	TBSTYLE_REGISTERDROP  = 0x4000,
	TBSTYLE_TRANSPARENT   = 0x8000,
	BTNS_BUTTON        = TBSTYLE_BUTTON,
	BTNS_SEP           = TBSTYLE_SEP,
	BTNS_CHECK         = TBSTYLE_CHECK,
	BTNS_GROUP         = TBSTYLE_GROUP,
	BTNS_CHECKGROUP    = TBSTYLE_CHECKGROUP,
	BTNS_DROPDOWN      = TBSTYLE_DROPDOWN,
	BTNS_AUTOSIZE      = TBSTYLE_AUTOSIZE,
	BTNS_NOPREFIX      = TBSTYLE_NOPREFIX,
	BTNS_SHOWTEXT      = 0x0040,
	BTNS_WHOLEDROPDOWN = 0x0080,
	TBSTYLE_EX_DRAWDDARROWS       = 0x00000001,
	TBSTYLE_EX_MIXEDBUTTONS       = 0x00000008,
	TBSTYLE_EX_HIDECLIPPEDBUTTONS = 0x00000010,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		TBSTYLE_EX_DOUBLEBUFFER = 0x00000080,
}

struct NMTBCUSTOMDRAW {
	NMCUSTOMDRAW nmcd;
	HBRUSH hbrMonoDither;
	HBRUSH hbrLines;
	HPEN hpenLines;
	COLORREF clrText;
	COLORREF clrMark;
	COLORREF clrTextHighlight;
	COLORREF clrBtnFace;
	COLORREF clrBtnHighlight;
	COLORREF clrHighlightHotTrack;
	RECT rcText;
	int nStringBkMode;
	int nHLStringBkMode;
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		int iListGap;
}
alias NMTBCUSTOMDRAW* LPNMTBCUSTOMDRAW;

enum {
	TBCDRF_NOEDGES        = 0x00010000,
	TBCDRF_HILITEHOTTRACK = 0x00020000,
	TBCDRF_NOOFFSET       = 0x00040000,
	TBCDRF_NOMARK         = 0x00080000,
	TBCDRF_NOETCHEDEFFECT = 0x00100000,
	TBCDRF_BLENDICON      = 0x00200000,
	TBCDRF_NOBACKGROUND   = 0x00400000,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		TBCDRF_USECDCOLORS = 0x00800000,
}

enum {
	TB_ENABLEBUTTON          = WM_USER + 1,
	TB_CHECKBUTTON           = WM_USER + 2,
	TB_PRESSBUTTON           = WM_USER + 3,
	TB_HIDEBUTTON            = WM_USER + 4,
	TB_INDETERMINATE         = WM_USER + 5,
	TB_MARKBUTTON            = WM_USER + 6,
	TB_ISBUTTONENABLED       = WM_USER + 9,
	TB_ISBUTTONCHECKED       = WM_USER + 10,
	TB_ISBUTTONPRESSED       = WM_USER + 11,
	TB_ISBUTTONHIDDEN        = WM_USER + 12,
	TB_ISBUTTONINDETERMINATE = WM_USER + 13,
	TB_ISBUTTONHIGHLIGHTED   = WM_USER + 14,
	TB_SETSTATE              = WM_USER + 17,
	TB_GETSTATE              = WM_USER + 18,
	TB_ADDBITMAP             = WM_USER + 19,
	TB_ADDBUTTONSA           = WM_USER + 20,
	TB_INSERTBUTTONA         = WM_USER + 21,
	TB_DELETEBUTTON          = WM_USER + 22,
	TB_GETBUTTON             = WM_USER + 23,
	TB_BUTTONCOUNT           = WM_USER + 24,
	TB_COMMANDTOINDEX        = WM_USER + 25,
	TB_SAVERESTOREA          = WM_USER + 26,
	TB_SAVERESTOREW          = WM_USER + 76,
	TB_CUSTOMIZE             = WM_USER + 27,
	TB_ADDSTRINGA            = WM_USER + 28,
	TB_ADDSTRINGW            = WM_USER + 77,
	TB_GETITEMRECT           = WM_USER + 29,
	TB_BUTTONSTRUCTSIZE      = WM_USER + 30,
	TB_SETBUTTONSIZE         = WM_USER + 31,
	TB_SETBITMAPSIZE         = WM_USER + 32,
	TB_AUTOSIZE              = WM_USER + 33,
	TB_GETTOOLTIPS           = WM_USER + 35,
	TB_SETTOOLTIPS           = WM_USER + 36,
	TB_SETPARENT             = WM_USER + 37,
	TB_SETROWS               = WM_USER + 39,
	TB_GETROWS               = WM_USER + 40,
	TB_GETBITMAPFLAGS        = WM_USER + 41,
	TB_SETCMDID              = WM_USER + 42,
	TB_CHANGEBITMAP          = WM_USER + 43,
	TB_GETBITMAP             = WM_USER + 44,
	TB_GETBUTTONTEXTA        = WM_USER + 45,
	TB_GETBUTTONTEXTW        = WM_USER + 75,
	TB_REPLACEBITMAP         = WM_USER + 46,
	TB_SETINDENT             = WM_USER + 47,
	TB_SETIMAGELIST          = WM_USER + 48,
	TB_GETIMAGELIST          = WM_USER + 49,
	TB_LOADIMAGES            = WM_USER + 50,
	TB_GETRECT               = WM_USER + 51,
	TB_SETHOTIMAGELIST       = WM_USER + 52,
	TB_GETHOTIMAGELIST       = WM_USER + 53,
	TB_SETDISABLEDIMAGELIST  = WM_USER + 54,
	TB_GETDISABLEDIMAGELIST  = WM_USER + 55,
	TB_SETSTYLE              = WM_USER + 56,
	TB_GETSTYLE              = WM_USER + 57,
	TB_GETBUTTONSIZE         = WM_USER + 58,
	TB_SETBUTTONWIDTH        = WM_USER + 59,
	TB_SETMAXTEXTROWS        = WM_USER + 60,
	TB_GETTEXTROWS           = WM_USER + 61,
	TB_GETOBJECT             = WM_USER + 62,
	TB_GETBUTTONINFOW        = WM_USER + 63,
	TB_SETBUTTONINFOW        = WM_USER + 64,
	TB_GETBUTTONINFOA        = WM_USER + 65,
	TB_SETBUTTONINFOA        = WM_USER + 66,
	TB_INSERTBUTTONW         = WM_USER + 67,
	TB_ADDBUTTONSW           = WM_USER + 68,
	TB_HITTEST               = WM_USER + 69,
	TB_GETHOTITEM            = WM_USER + 71,
	TB_SETHOTITEM            = WM_USER + 72,
	TB_SETANCHORHIGHLIGHT    = WM_USER + 73,
	TB_GETANCHORHIGHLIGHT    = WM_USER + 74,
	TB_MAPACCELERATORA       = WM_USER + 78,
	TB_GETINSERTMARK         = WM_USER + 79,
	TB_SETINSERTMARK         = WM_USER + 80,
	TB_INSERTMARKHITTEST     = WM_USER + 81,
	TB_MOVEBUTTON            = WM_USER + 82,
	TB_GETMAXSIZE            = WM_USER + 83,
	TB_SETEXTENDEDSTYLE      = WM_USER + 84,
	TB_GETEXTENDEDSTYLE      = WM_USER + 85,
	TB_GETPADDING            = WM_USER + 86,
	TB_SETPADDING            = WM_USER + 87,
	TB_SETINSERTMARKCOLOR    = WM_USER + 88,
	TB_GETINSERTMARKCOLOR    = WM_USER + 89,
	TB_SETCOLORSCHEME        = CCM_SETCOLORSCHEME,
	TB_GETCOLORSCHEME        = CCM_GETCOLORSCHEME,
	TB_SETUNICODEFORMAT      = CCM_SETUNICODEFORMAT,
	TB_GETUNICODEFORMAT      = CCM_GETUNICODEFORMAT,
	TB_MAPACCELERATORW       = WM_USER + 90,
}

struct TBADDBITMAP {
	HINSTANCE hInst;
	UINT_PTR nID;
}
alias TBADDBITMAP* LPTBADDBITMAP;

const HINSTANCE HINST_COMMCTRL = cast(HINSTANCE)-1;
enum {
	IDB_STD_SMALL_COLOR  = 0,
	IDB_STD_LARGE_COLOR  = 1,
	IDB_VIEW_SMALL_COLOR = 4,
	IDB_VIEW_LARGE_COLOR = 5,
	IDB_HIST_SMALL_COLOR = 8,
	IDB_HIST_LARGE_COLOR = 9,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		IDB_HIST_NORMAL   = 12,
		IDB_HIST_HOT      = 13,
		IDB_HIST_DISABLED = 14,
		IDB_HIST_PRESSED  = 15,
}

enum {
	STD_CUT        = 0,
	STD_COPY       = 1,
	STD_PASTE      = 2,
	STD_UNDO       = 3,
	STD_REDOW      = 4,
	STD_DELETE     = 5,
	STD_FILENEW    = 6,
	STD_FILEOPEN   = 7,
	STD_FILESAVE   = 8,
	STD_PRINTPRE   = 9,
	STD_PROPERTIES = 10,
	STD_HELP       = 11,
	STD_FIND       = 12,
	STD_REPLACE    = 13,
	STD_PRINT      = 14,
}

enum {
	VIEW_LARGEICONS    = 0,
	VIEW_SMALLICONS    = 1,
	VIEW_LIST          = 2,
	VIEW_DETAILS       = 3,
	VIEW_SORTNAME      = 4,
	VIEW_SORTSIZE      = 5,
	VIEW_SORTDATE      = 6,
	VIEW_SORTTYPE      = 7,
	VIEW_PARENTFOLDER  = 8,
	VIEW_NETCONNECT    = 9,
	VIEW_NETDISCONNECT = 10,
	VIEW_NEWFOLDER     = 11,
	VIEW_VIEWMENU      = 12,
}

enum {
	HIST_BACK           = 0,
	HIST_FORWARD        = 1,
	HIST_FAVORITES      = 2,
	HIST_ADDTOFAVORITES = 3,
	HIST_VIEWTREE       = 4,
}

struct TBSAVEPARAMSA {
	HKEY hkr;
	LPCSTR pszSubKey;
	LPCSTR pszValueName;
}
alias TBSAVEPARAMSA* LPTBSAVEPARAMSA;

struct TBSAVEPARAMSW {
	HKEY hkr;
	LPCWSTR pszSubKey;
	LPCWSTR pszValueName;
}
alias TBSAVEPARAMSW* LPTBSAVEPARAMSW;

version(UNICODE){
	alias TBSAVEPARAMSW TBSAVEPARAMS;
	alias LPTBSAVEPARAMSW LPTBSAVEPARAMS;
}else{
	alias TBSAVEPARAMSA TBSAVEPARAMS;
	alias LPTBSAVEPARAMSA LPTBSAVEPARAMS;
}

version(UNICODE){
	enum {
		TB_GETBUTTONTEXT = TB_GETBUTTONTEXTW,
		TB_SAVERESTORE   = TB_SAVERESTOREW,
		TB_ADDSTRING     = TB_ADDSTRINGW,
	}
}else{
	enum {
		TB_GETBUTTONTEXT = TB_GETBUTTONTEXTA,
		TB_SAVERESTORE   = TB_SAVERESTOREA,
		TB_ADDSTRING     = TB_ADDSTRINGA,
	}
}

struct TBINSERTMARK {
	int iButton;
	DWORD dwFlags;
}
alias TBINSERTMARK* LPTBINSERTMARK;
enum {
	TBIMHT_AFTER      = 0x00000001,
	TBIMHT_BACKGROUND = 0x00000002,
}

version(UNICODE)
	enum TB_MAPACCELERATOR = TB_MAPACCELERATORW;
else
	enum TB_MAPACCELERATOR = TB_MAPACCELERATORA;


struct TBREPLACEBITMAP {
	HINSTANCE hInstOld;
	UINT_PTR nIDOld;
	HINSTANCE hInstNew;
	UINT_PTR nIDNew;
	int nButtons;
}
alias TBREPLACEBITMAP* LPTBREPLACEBITMAP;

enum {
	TBBF_LARGE        = 0x0001,

}

enum {
	TBIF_IMAGE   = 0x00000001,
	TBIF_TEXT    = 0x00000002,
	TBIF_STATE   = 0x00000004,
	TBIF_STYLE   = 0x00000008,
	TBIF_LPARAM  = 0x00000010,
	TBIF_COMMAND = 0x00000020,
	TBIF_SIZE    = 0x00000040,
	TBIF_BYINDEX = 0x80000000,
}

struct TBBUTTONINFOA {
	UINT cbSize;
	DWORD dwMask;
	int idCommand;
	int iImage;
	BYTE fsState;
	BYTE fsStyle;
	WORD cx;
	DWORD_PTR lParam;
	LPSTR pszText;
	int cchText;
}
alias TBBUTTONINFOA* LPTBBUTTONINFOA;

struct TBBUTTONINFOW {
	UINT cbSize;
	DWORD dwMask;
	int idCommand;
	int iImage;
	BYTE fsState;
	BYTE fsStyle;
	WORD cx;
	DWORD_PTR lParam;
	LPWSTR pszText;
	int cchText;
}
alias TBBUTTONINFOW* LPTBBUTTONINFOW;

version(UNICODE){
	alias TBBUTTONINFOW TBBUTTONINFO;
	alias LPTBBUTTONINFOW LPTBBUTTONINFO;
}else{
	alias TBBUTTONINFOA TBBUTTONINFO;
	alias LPTBBUTTONINFOA LPTBBUTTONINFO;
}

version(UNICODE){
	alias TB_GETBUTTONINFOW TB_GETBUTTONINFO;
	alias TB_SETBUTTONINFOW TB_SETBUTTONINFO;
}else{
	alias TB_GETBUTTONINFOA TB_GETBUTTONINFO;
	alias TB_SETBUTTONINFOA TB_SETBUTTONINFO;
}

version(UNICODE){
	alias TB_INSERTBUTTONW TB_INSERTBUTTON;
	alias TB_ADDBUTTONSW TB_ADDBUTTONS;
}else{
	alias TB_INSERTBUTTONA TB_INSERTBUTTON;
	alias TB_ADDBUTTONSA TB_ADDBUTTONS;
}
enum TB_SETDRAWTEXTFLAGS = WM_USER + 70;

//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	enum {
		TBMF_PAD           = 0x00000001,
		TBMF_BARPAD        = 0x00000002,
		TBMF_BUTTONSPACING = 0x00000004,
	}
	struct TBMETRICS {
		UINT cbSize;
		DWORD dwMask;
		int cxPad;
		int cyPad;
		int cxBarPad;
		int cyBarPad;
		int cxButtonSpacing;
		int cyButtonSpacing;
	}
	alias TBMETRICS* LPTBMETRICS;
	enum {
		TB_GETMETRICS = WM_USER + 101,
		TB_SETMETRICS = WM_USER + 102,
	}


//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	enum {
		TB_GETITEMDROPDOWNRECT = WM_USER + 103,
		TB_SETPRESSEDIMAGELIST = WM_USER + 104,
		TB_GETPRESSEDIMAGELIST = WM_USER + 105,
	}

//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	enum TB_SETWINDOWTHEME = CCM_SETWINDOWTHEME;

enum {
	TBN_GETBUTTONINFOA  = TBN_FIRST - 0,
	TBN_BEGINDRAG       = TBN_FIRST - 1,
	TBN_ENDDRAG         = TBN_FIRST - 2,
	TBN_BEGINADJUST     = TBN_FIRST - 3,
	TBN_ENDADJUST       = TBN_FIRST - 4,
	TBN_RESET           = TBN_FIRST - 5,
	TBN_QUERYINSERT     = TBN_FIRST - 6,
	TBN_QUERYDELETE     = TBN_FIRST - 7,
	TBN_TOOLBARCHANGE   = TBN_FIRST - 8,
	TBN_CUSTHELP        = TBN_FIRST - 9,
	TBN_DROPDOWN        = TBN_FIRST - 10,
	TBN_GETOBJECT       = TBN_FIRST - 12,
	TBN_HOTITEMCHANGE   = TBN_FIRST - 13,
	TBN_DRAGOUT         = TBN_FIRST - 14,
	TBN_DELETINGBUTTON  = TBN_FIRST - 15,
	TBN_GETDISPINFOA    = TBN_FIRST - 16,
	TBN_GETDISPINFOW    = TBN_FIRST - 17,
	TBN_GETINFOTIPA     = TBN_FIRST - 18,
	TBN_GETINFOTIPW     = TBN_FIRST - 19,
	TBN_GETBUTTONINFOW  = TBN_FIRST - 20,
	TBN_RESTORE         = TBN_FIRST - 21,
	TBN_SAVE            = TBN_FIRST - 22,
	TBN_INITCUSTOMIZE   = TBN_FIRST - 23,
	TBNRF_HIDEHELP      = 0x00000001,
	TBNRF_ENDCUSTOMIZE  = 0x00000002,
	TBN_WRAPHOTITEM     = TBN_FIRST - 24,
	TBN_DUPACCELERATOR  = TBN_FIRST - 25,
	TBN_WRAPACCELERATOR = TBN_FIRST - 26,
	TBN_DRAGOVER        = TBN_FIRST - 27,
	TBN_MAPACCELERATOR  = TBN_FIRST - 28,
}

struct NMTBHOTITEM {
	NMHDR hdr;
	int idOld;
	int idNew;
	DWORD dwFlags;
}
alias NMTBHOTITEM* LPNMTBHOTITEM;
enum {
	HICF_OTHER          = 0x00000000,
	HICF_MOUSE          = 0x00000001,
	HICF_ARROWKEYS      = 0x00000002,
	HICF_ACCELERATOR    = 0x00000004,
	HICF_DUPACCEL       = 0x00000008,
	HICF_ENTERING       = 0x00000010,
	HICF_LEAVING        = 0x00000020,
	HICF_RESELECT       = 0x00000040,
	HICF_LMOUSE         = 0x00000080,
	HICF_TOGGLEDROPDOWN = 0x00000100,
}

struct NMTBSAVE {
	NMHDR hdr;
	DWORD* pData;
	DWORD* pCurrent;
	UINT cbData;
	int iItem;
	int cButtons;
	TBBUTTON tbButton;
}
alias NMTBSAVE* LPNMTBSAVE;

struct NMTBRESTORE {
	NMHDR hdr;
	DWORD* pData;
	DWORD* pCurrent;
	UINT cbData;
	int iItem;
	int cButtons;
	int cbBytesPerRecord;
	TBBUTTON tbButton;
}
alias NMTBRESTORE* LPNMTBRESTORE;

struct NMTBGETINFOTIPA {
	NMHDR hdr;
	LPSTR pszText;
	int cchTextMax;
	int iItem;
	LPARAM lParam;
}
alias NMTBGETINFOTIPA* LPNMTBGETINFOTIPA;

struct NMTBGETINFOTIPW {
	NMHDR hdr;
	LPWSTR pszText;
	int cchTextMax;
	int iItem;
	LPARAM lParam;
}
alias NMTBGETINFOTIPW* LPNMTBGETINFOTIPW;

version(UNICODE){
	enum TBN_GETINFOTIP = TBN_GETINFOTIPW;
	alias NMTBGETINFOTIPW NMTBGETINFOTIP;
	alias LPNMTBGETINFOTIPW LPNMTBGETINFOTIP;
}else{
	enum TBN_GETINFOTIP = TBN_GETINFOTIPA;
	alias NMTBGETINFOTIPA NMTBGETINFOTIP;
	alias LPNMTBGETINFOTIPA LPNMTBGETINFOTIP;
}
enum {
	TBNF_IMAGE      = 0x00000001,
	TBNF_TEXT       = 0x00000002,
	TBNF_DI_SETITEM = 0x10000000,
}
struct NMTBDISPINFOA {
	NMHDR hdr;
	DWORD dwMask;
	int idCommand;
	DWORD_PTR lParam;
	int iImage;
	LPSTR pszText;
	int cchText;
}
alias NMTBDISPINFOA* LPNMTBDISPINFOA;

struct NMTBDISPINFOW {
	NMHDR hdr;
	DWORD dwMask;
	int idCommand;
	DWORD_PTR lParam;
	int iImage;
	LPWSTR pszText;
	int cchText;
}
alias NMTBDISPINFOW* LPNMTBDISPINFOW;

version(UNICODE){
	alias TBN_GETDISPINFOW TBN_GETDISPINFO;
	alias NMTBDISPINFOW NMTBDISPINFO;
	alias LPNMTBDISPINFOW LPNMTBDISPINFO;
}else{
	alias TBN_GETDISPINFOA TBN_GETDISPINFO;
	alias NMTBDISPINFOA NMTBDISPINFO;
	alias LPNMTBDISPINFOA LPNMTBDISPINFO;
}
enum {
	TBDDRET_DEFAULT      = 0,
	TBDDRET_NODEFAULT    = 1,
	TBDDRET_TREATPRESSED = 2,
}

version(UNICODE)
	enum TBN_GETBUTTONINFO = TBN_GETBUTTONINFOW;
else
	enum TBN_GETBUTTONINFO = TBN_GETBUTTONINFOA;

struct NMTOOLBARA {
	NMHDR hdr;
	int iItem;
	TBBUTTON tbButton;
	int cchText;
	LPSTR pszText;
	RECT rcButton;
}
alias NMTOOLBARA* LPNMTOOLBARA;

struct NMTOOLBARW {
	NMHDR hdr;
	int iItem;
	TBBUTTON tbButton;
	int cchText;
	LPWSTR pszText;
	RECT rcButton;
}
alias NMTOOLBARW* LPNMTOOLBARW;

version(UNICODE){
	alias NMTOOLBARW NMTOOLBAR;
	alias LPNMTOOLBARW LPNMTOOLBAR;
}else{
	alias NMTOOLBARA NMTOOLBAR;
	alias LPNMTOOLBARA LPNMTOOLBAR;
}
//alias NMTOOLBAR TBNOTIFY;
//alias LPNMTOOLBAR LPTBNOTIFY;
//alias NMTOOLBARA TBNOTIFYA;
//alias NMTOOLBARW TBNOTIFYW;
//alias LPNMTOOLBARA LPTBNOTIFYA;
//alias LPNMTOOLBARW LPTBNOTIFYW;

//-------------------------------------------------------------------

const wchar* REBARCLASSNAMEW = "ReBarWindow32";
const char* REBARCLASSNAMEA = "ReBarWindow32";
version(UNICODE)
	alias REBARCLASSNAMEW REBARCLASSNAME;
else
	alias REBARCLASSNAMEA REBARCLASSNAME;

enum RBIM_IMAGELIST = 0x00000001;

enum {
	RBS_TOOLTIPS        = 0x00000100,
	RBS_VARHEIGHT       = 0x00000200,
	RBS_BANDBORDERS     = 0x00000400,
	RBS_FIXEDORDER      = 0x00000800,
	RBS_REGISTERDROP    = 0x00001000,
	RBS_AUTOSIZE        = 0x00002000,
	RBS_VERTICALGRIPPER = 0x00004000,
	RBS_DBLCLKTOGGLE    = 0x00008000,
}

struct REBARINFO {
	UINT cbSize;
	UINT fMask;
	HIMAGELIST himl;
}
alias REBARINFO* LPREBARINFO;
enum {
	RBBS_BREAK          = 0x00000001,
	RBBS_FIXEDSIZE      = 0x00000002,
	RBBS_CHILDEDGE      = 0x00000004,
	RBBS_HIDDEN         = 0x00000008,
	RBBS_NOVERT         = 0x00000010,
	RBBS_FIXEDBMP       = 0x00000020,
	RBBS_VARIABLEHEIGHT = 0x00000040,
	RBBS_GRIPPERALWAYS  = 0x00000080,
	RBBS_NOGRIPPER      = 0x00000100,
	RBBS_USECHEVRON     = 0x00000200,
	RBBS_HIDETITLE      = 0x00000400,
	RBBS_TOPALIGN       = 0x00000800,
}

enum {
	RBBIM_STYLE      = 0x00000001,
	RBBIM_COLORS     = 0x00000002,
	RBBIM_TEXT       = 0x00000004,
	RBBIM_IMAGE      = 0x00000008,
	RBBIM_CHILD      = 0x00000010,
	RBBIM_CHILDSIZE  = 0x00000020,
	RBBIM_SIZE       = 0x00000040,
	RBBIM_BACKGROUND = 0x00000080,
	RBBIM_ID         = 0x00000100,
	RBBIM_IDEALSIZE  = 0x00000200,
	RBBIM_LPARAM     = 0x00000400,
	RBBIM_HEADERSIZE = 0x00000800,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		RBBIM_CHEVRONLOCATION = 0x00001000,
		RBBIM_CHEVRONSTATE    = 0x00002000,
}

struct REBARBANDINFOA {
	UINT cbSize;
	UINT fMask;
	UINT fStyle;
	COLORREF clrFore;
	COLORREF clrBack;
	LPSTR lpText;
	UINT cch;
	int iImage;
	HWND hwndChild;
	UINT cxMinChild;
	UINT cyMinChild;
	UINT cx;
	HBITMAP hbmBack;
	UINT wID;
	UINT cyChild;
	UINT cyMaxChild;
	UINT cyIntegral;
	UINT cxIdeal;
	LPARAM lParam;
	UINT cxHeader;
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		RECT rcChevronLocation;
		UINT uChevronState;
}
alias REBARBANDINFOA* LPREBARBANDINFOA;
alias REBARBANDINFOA* LPCREBARBANDINFOA;

struct REBARBANDINFOW {
	UINT cbSize;
	UINT fMask;
	UINT fStyle;
	COLORREF clrFore;
	COLORREF clrBack;
	LPWSTR lpText;
	UINT cch;
	int iImage;
	HWND hwndChild;
	UINT cxMinChild;
	UINT cyMinChild;
	UINT cx;
	HBITMAP hbmBack;
	UINT wID;
		UINT cyChild;
		UINT cyMaxChild;
		UINT cyIntegral;
		UINT cxIdeal;
		LPARAM lParam;
		UINT cxHeader;
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		RECT rcChevronLocation;
		UINT uChevronState;
}
alias REBARBANDINFOW* LPREBARBANDINFOW;
alias REBARBANDINFOW* LPCREBARBANDINFOW;
enum REBARBANDINFOA_V3_SIZE = REBARBANDINFOA.wID.offsetof + REBARBANDINFOA.wID.sizeof;
enum REBARBANDINFOW_V3_SIZE = REBARBANDINFOW.wID.offsetof + REBARBANDINFOW.wID.sizeof;
enum REBARBANDINFOA_V6_SIZE = REBARBANDINFOA.cxHeader.offsetof + REBARBANDINFOA.cxHeader.sizeof;
enum REBARBANDINFOW_V6_SIZE = REBARBANDINFOW.cxHeader.offsetof + REBARBANDINFOW.cxHeader.sizeof;
version(UNICODE){
	alias REBARBANDINFOW REBARBANDINFO;
	alias LPREBARBANDINFOW LPREBARBANDINFO;
	alias LPCREBARBANDINFOW LPCREBARBANDINFO;
	enum REBARBANDINFO_V3_SIZE = REBARBANDINFOW_V3_SIZE;
	enum REBARBANDINFO_V6_SIZE = REBARBANDINFOW_V6_SIZE;
}else{
	alias REBARBANDINFOA REBARBANDINFO;
	alias LPREBARBANDINFOA LPREBARBANDINFO;
	alias LPCREBARBANDINFOA LPCREBARBANDINFO;
	enum REBARBANDINFO_V3_SIZE = REBARBANDINFOA_V3_SIZE;
	enum REBARBANDINFO_V6_SIZE = REBARBANDINFOA_V6_SIZE;
}

enum {
	RB_INSERTBANDA  = WM_USER + 1,
	RB_DELETEBAND   = WM_USER + 2,
	RB_GETBARINFO   = WM_USER + 3,
	RB_SETBARINFO   = WM_USER + 4,
	//RB_GETBANDINFO = WM_USER + 5, //(_WIN32_IE < 0x0400)
	RB_SETBANDINFOA = WM_USER + 6,
	RB_SETPARENT    = WM_USER + 7,
	RB_HITTEST      = WM_USER + 8,
	RB_GETRECT      = WM_USER + 9,
	RB_INSERTBANDW  = WM_USER + 10,
	RB_SETBANDINFOW = WM_USER + 11,
	RB_GETBANDCOUNT = WM_USER + 12,
	RB_GETROWCOUNT  = WM_USER + 13,
	RB_GETROWHEIGHT = WM_USER + 14,
	RB_IDTOINDEX    = WM_USER + 16,
	RB_GETTOOLTIPS  = WM_USER + 17,
	RB_SETTOOLTIPS  = WM_USER + 18,
	RB_SETBKCOLOR   = WM_USER + 19,
	RB_GETBKCOLOR   = WM_USER + 20,
	RB_SETTEXTCOLOR = WM_USER + 21,
	RB_GETTEXTCOLOR = WM_USER + 22,
	RB_SIZETORECT   = WM_USER + 23,
}
//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	enum RBSTR_CHANGERECT = 0x0001;

enum RB_SETCOLORSCHEME = CCM_SETCOLORSCHEME;
enum RB_GETCOLORSCHEME = CCM_GETCOLORSCHEME;

version(UNICODE){
	enum RB_INSERTBAND = RB_INSERTBANDW;
	enum RB_SETBANDINFO = RB_SETBANDINFOW;
}else{
	enum RB_INSERTBAND = RB_INSERTBANDA;
	enum RB_SETBANDINFO = RB_SETBANDINFOA;
}

enum {
	RB_BEGINDRAG    = WM_USER + 24,
	RB_ENDDRAG      = WM_USER + 25,
	RB_DRAGMOVE     = WM_USER + 26,
	RB_GETBARHEIGHT = WM_USER + 27,
	RB_GETBANDINFOW = WM_USER + 28,
	RB_GETBANDINFOA = WM_USER + 29,
}
version(UNICODE)
	enum RB_GETBANDINFO = RB_GETBANDINFOW;
else
	enum RB_GETBANDINFO = RB_GETBANDINFOA;
enum {
	RB_MINIMIZEBAND     = WM_USER + 30,
	RB_MAXIMIZEBAND     = WM_USER + 31,
	RB_GETDROPTARGET    = CCM_GETDROPTARGET,
	RB_GETBANDBORDERS   = WM_USER + 34,
	RB_SHOWBAND         = WM_USER + 35,
	RB_SETPALETTE       = WM_USER + 37,
	RB_GETPALETTE       = WM_USER + 38,
	RB_MOVEBAND         = WM_USER + 39,
	RB_SETUNICODEFORMAT = CCM_SETUNICODEFORMAT,
	RB_GETUNICODEFORMAT = CCM_GETUNICODEFORMAT,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		RB_GETBANDMARGINS = WM_USER + 40,
		RB_SETWINDOWTHEME = CCM_SETWINDOWTHEME,
	RB_SETEXTENDEDSTYLE = WM_USER + 41,
	RB_GETEXTENDEDSTYLE = WM_USER + 42,
	RB_PUSHCHEVRON      = WM_USER + 43,
	RB_SETBANDWIDTH     = WM_USER + 44,
}

enum RBN_HEIGHTCHANGE = RBN_FIRST - 0;


enum {
	RBN_GETOBJECT     = RBN_FIRST - 1,
	RBN_LAYOUTCHANGED = RBN_FIRST - 2,
	RBN_AUTOSIZE      = RBN_FIRST - 3,
	RBN_BEGINDRAG     = RBN_FIRST - 4,
	RBN_ENDDRAG       = RBN_FIRST - 5,
	RBN_DELETINGBAND  = RBN_FIRST - 6,
	RBN_DELETEDBAND   = RBN_FIRST - 7,
	RBN_CHILDSIZE     = RBN_FIRST - 8,
	RBN_CHEVRONPUSHED = RBN_FIRST - 10,
	RBN_SPLITTERDRAG  = RBN_FIRST - 11,
	RBN_MINMAX        = RBN_FIRST - 21,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		RBN_AUTOBREAK = RBN_FIRST - 22,
}

struct NMREBARCHILDSIZE {
	NMHDR hdr;
	UINT uBand;
	UINT wID;
	RECT rcChild;
	RECT rcBand;
}
alias NMREBARCHILDSIZE* LPNMREBARCHILDSIZE;

struct NMREBAR {
	NMHDR hdr;
	DWORD dwMask;
	UINT uBand;
	UINT fStyle;
	UINT wID;
	LPARAM lParam;
}
alias NMREBAR* LPNMREBAR;

enum {
	RBNM_ID     = 0x00000001,
	RBNM_STYLE  = 0x00000002,
	RBNM_LPARAM = 0x00000004,
}

struct NMRBAUTOSIZE {
	NMHDR hdr;
	BOOL fChanged;
	RECT rcTarget;
	RECT rcActual;
}
alias NMRBAUTOSIZE* LPNMRBAUTOSIZE;

struct NMREBARCHEVRON {
	NMHDR hdr;
	UINT uBand;
	UINT wID;
	LPARAM lParam;
	RECT rc;
	LPARAM lParamNM;
}
alias NMREBARCHEVRON* LPNMREBARCHEVRON;

struct NMREBARSPLITTER {
	NMHDR hdr;
	RECT rcSizing;
}
alias NMREBARSPLITTER* LPNMREBARSPLITTER;


//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	enum {
		RBAB_AUTOSIZE = 0x0001,
		RBAB_ADDBAND  = 0x0002,
	}

	struct NMREBARAUTOBREAK {
		NMHDR hdr;
		UINT uBand;
		UINT wID;
		LPARAM lParam;
		UINT uMsg;
		UINT fStyleCurrent;
		BOOL fAutoBreak;
	}
	alias NMREBARAUTOBREAK* LPNMREBARAUTOBREAK;

enum {
	RBHT_NOWHERE  = 0x0001,
	RBHT_CAPTION  = 0x0002,
	RBHT_CLIENT   = 0x0003,
	RBHT_GRABBER  = 0x0004,
	RBHT_CHEVRON  = 0x0008,
	RBHT_SPLITTER = 0x0010,
}

struct RBHITTESTINFO {
	POINT pt;
	UINT flags;
	int iBand;
}
alias RBHITTESTINFO* LPRBHITTESTINFO;


//-------------------------------------------------------------------
const wchar* TOOLTIPS_CLASSW = "tooltips_class32";
const char* TOOLTIPS_CLASSA = "tooltips_class32";
version(UNICODE)
	alias TOOLTIPS_CLASSW TOOLTIPS_CLASS;
else
	alias TOOLTIPS_CLASSA TOOLTIPS_CLASS;

struct TTTOOLINFOA {
	UINT cbSize;
	UINT uFlags;
	HWND hwnd;
	UINT_PTR uId;
	RECT rect;
	HINSTANCE hinst;
	LPSTR lpszText;
	LPARAM lParam;
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		void* lpReserved;
}
alias TTTOOLINFOA* PTOOLINFOA;
alias TTTOOLINFOA* LPTTTOOLINFOA;

struct TTTOOLINFOW {
	UINT cbSize;
	UINT uFlags;
	HWND hwnd;
	UINT_PTR uId;
	RECT rect;
	HINSTANCE hinst;
	LPWSTR lpszText;
	LPARAM lParam;
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		void* lpReserved;
}
alias TTTOOLINFOW* PTOOLINFOW;
alias TTTOOLINFOW* LPTTTOOLINFOW;

version(UNICODE){
	alias TTTOOLINFOW TTTOOLINFO;
	alias PTOOLINFOW PTOOLINFO;
	alias LPTTTOOLINFOW LPTTTOOLINFO;
	alias TTTOOLINFOW_V1_SIZE TTTOOLINFO_V1_SIZE;
}else{
	alias PTOOLINFOA PTOOLINFO;
	alias TTTOOLINFOA TTTOOLINFO;
	alias LPTTTOOLINFOA LPTTTOOLINFO;
	alias TTTOOLINFOA_V1_SIZE TTTOOLINFO_V1_SIZE;
}
alias LPTTTOOLINFOA LPTOOLINFOA;
alias LPTTTOOLINFOW LPTOOLINFOW;
alias TTTOOLINFOA TOOLINFOA;
alias TTTOOLINFOW TOOLINFOW;
alias LPTTTOOLINFO LPTOOLINFO;
alias TTTOOLINFO TOOLINFO;

enum TTTOOLINFOA_V1_SIZE = TTTOOLINFOA.lpszText.offsetof + TTTOOLINFOA.lpszText.sizeof;
enum TTTOOLINFOW_V1_SIZE = TTTOOLINFOW.lpszText.offsetof + TTTOOLINFOW.lpszText.sizeof;
enum TTTOOLINFOA_V2_SIZE = TTTOOLINFOA.lParam.offsetof + TTTOOLINFOA.lParam.sizeof;
enum TTTOOLINFOW_V2_SIZE = TTTOOLINFOW.lParam.offsetof + TTTOOLINFOW.lParam.sizeof;
enum TTTOOLINFOA_V3_SIZE = TTTOOLINFOA.lpReserved.offsetof + TTTOOLINFOA.lpReserved.sizeof;
enum TTTOOLINFOW_V3_SIZE = TTTOOLINFOW.lpReserved.offsetof + TTTOOLINFOW.lpReserved.sizeof;

enum {
	TTS_ALWAYSTIP = 0x01,
	TTS_NOPREFIX  = 0x02,
	TTS_NOANIMATE = 0x10,
	TTS_NOFADE    = 0x20,
	TTS_BALLOON   = 0x40,
	TTS_CLOSE     = 0x80,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		TTS_USEVISUALSTYLE = 0x100,
}
enum {
	TTF_IDISHWND    = 0x0001,
	TTF_CENTERTIP   = 0x0002,
	TTF_RTLREADING  = 0x0004,
	TTF_SUBCLASS    = 0x0010,
	TTF_TRACK       = 0x0020,
	TTF_ABSOLUTE    = 0x0080,
	TTF_TRANSPARENT = 0x0100,
	TTF_PARSELINKS  = 0x1000,
	TTF_DI_SETITEM  = 0x8000,
}

enum {
	TTDT_AUTOMATIC = 0,
	TTDT_RESHOW    = 1,
	TTDT_AUTOPOP   = 2,
	TTDT_INITIAL   = 3,
}

enum {
	TTI_NONE    = 0,
	TTI_INFO    = 1,
	TTI_WARNING = 2,
	TTI_ERROR   = 3,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		TTI_INFO_LARGE    = 4,
		TTI_WARNING_LARGE = 5,
		TTI_ERROR_LARGE   = 6,
}

enum {
	TTM_ACTIVATE        = WM_USER + 1,
	TTM_SETDELAYTIME    = WM_USER + 3,
	TTM_ADDTOOLA        = WM_USER + 4,
	TTM_ADDTOOLW        = WM_USER + 50,
	TTM_DELTOOLA        = WM_USER + 5,
	TTM_DELTOOLW        = WM_USER + 51,
	TTM_NEWTOOLRECTA    = WM_USER + 6,
	TTM_NEWTOOLRECTW    = WM_USER + 52,
	TTM_RELAYEVENT      = WM_USER + 7,
	TTM_GETTOOLINFOA    = WM_USER + 8,
	TTM_GETTOOLINFOW    = WM_USER + 53,
	TTM_SETTOOLINFOA    = WM_USER + 9,
	TTM_SETTOOLINFOW    = WM_USER + 54,
	TTM_HITTESTA        = WM_USER +10,
	TTM_HITTESTW        = WM_USER +55,
	TTM_GETTEXTA        = WM_USER +11,
	TTM_GETTEXTW        = WM_USER +56,
	TTM_UPDATETIPTEXTA  = WM_USER +12,
	TTM_UPDATETIPTEXTW  = WM_USER +57,
	TTM_GETTOOLCOUNT    = WM_USER +13,
	TTM_ENUMTOOLSA      = WM_USER +14,
	TTM_ENUMTOOLSW      = WM_USER +58,
	TTM_GETCURRENTTOOLA = WM_USER + 15,
	TTM_GETCURRENTTOOLW = WM_USER + 59,
	TTM_WINDOWFROMPOINT = WM_USER + 16,
	TTM_TRACKACTIVATE   = WM_USER + 17,
	TTM_TRACKPOSITION   = WM_USER + 18,
	TTM_SETTIPBKCOLOR   = WM_USER + 19,
	TTM_SETTIPTEXTCOLOR = WM_USER + 20,
	TTM_GETDELAYTIME    = WM_USER + 21,
	TTM_GETTIPBKCOLOR   = WM_USER + 22,
	TTM_GETTIPTEXTCOLOR = WM_USER + 23,
	TTM_SETMAXTIPWIDTH  = WM_USER + 24,
	TTM_GETMAXTIPWIDTH  = WM_USER + 25,
	TTM_SETMARGIN       = WM_USER + 26,
	TTM_GETMARGIN       = WM_USER + 27,
	TTM_POP             = WM_USER + 28,
	TTM_UPDATE          = WM_USER + 29,
	TTM_GETBUBBLESIZE   = WM_USER + 30,
	TTM_ADJUSTRECT      = WM_USER + 31,
	TTM_SETTITLEA       = WM_USER + 32,
	TTM_SETTITLEW       = WM_USER + 33,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		TTM_POPUP    = WM_USER + 34,
		TTM_GETTITLE = WM_USER + 35,
}
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	struct TTGETTITLE {
		DWORD dwSize;
		UINT uTitleBitmap;
		UINT cch;
		WCHAR* pszTitle;
	}
	alias TTGETTITLE* PTTGETTITLE;

version(UNICODE){
	enum {
		TTM_ADDTOOL        = TTM_ADDTOOLW,
		TTM_DELTOOL        = TTM_DELTOOLW,
		TTM_NEWTOOLRECT    = TTM_NEWTOOLRECTW,
		TTM_GETTOOLINFO    = TTM_GETTOOLINFOW,
		TTM_SETTOOLINFO    = TTM_SETTOOLINFOW,
		TTM_HITTEST        = TTM_HITTESTW,
		TTM_GETTEXT        = TTM_GETTEXTW,
		TTM_UPDATETIPTEXT  = TTM_UPDATETIPTEXTW,
		TTM_ENUMTOOLS      = TTM_ENUMTOOLSW,
		TTM_GETCURRENTTOOL = TTM_GETCURRENTTOOLW,
		TTM_SETTITLE       = TTM_SETTITLEW,
	}
}else{
	enum {
		TTM_ADDTOOL        = TTM_ADDTOOLA,
		TTM_DELTOOL        = TTM_DELTOOLA,
		TTM_NEWTOOLRECT    = TTM_NEWTOOLRECTA,
		TTM_GETTOOLINFO    = TTM_GETTOOLINFOA,
		TTM_SETTOOLINFO    = TTM_SETTOOLINFOA,
		TTM_HITTEST        = TTM_HITTESTA,
		TTM_GETTEXT        = TTM_GETTEXTA,
		TTM_UPDATETIPTEXT  = TTM_UPDATETIPTEXTA,
		TTM_ENUMTOOLS      = TTM_ENUMTOOLSA,
		TTM_GETCURRENTTOOL = TTM_GETCURRENTTOOLA,
		TTM_SETTITLE       = TTM_SETTITLEA,
	}
}

//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	enum TTM_SETWINDOWTHEME = CCM_SETWINDOWTHEME;

alias LPTTHITTESTINFOW LPHITTESTINFOW;
alias LPTTHITTESTINFOA LPHITTESTINFOA;

struct TTHITTESTINFOA {
	HWND hwnd;
	POINT pt;
	TTTOOLINFOA ti;
}
alias TTHITTESTINFOA* LPTTHITTESTINFOA;

struct TTHITTESTINFOW {
	HWND hwnd;
	POINT pt;
	TTTOOLINFOW ti;
}
alias TTHITTESTINFOW* LPTTHITTESTINFOW;

version(UNICODE){
	alias TTHITTESTINFOW TTHITTESTINFO;
	alias LPTTHITTESTINFOW LPTTHITTESTINFO;
}else{
	alias TTHITTESTINFOA TTHITTESTINFO;
	alias LPTTHITTESTINFOA LPTTHITTESTINFO;
}
alias LPTTHITTESTINFO LPHITTESTINFO;

enum {
	TTN_GETDISPINFOA = TTN_FIRST - 0,
	TTN_GETDISPINFOW = TTN_FIRST - 10,
	TTN_SHOW         = TTN_FIRST - 1,
	TTN_POP          = TTN_FIRST - 2,
	TTN_LINKCLICK    = TTN_FIRST - 3,
}

version(UNICODE)
	enum TTN_GETDISPINFO = TTN_GETDISPINFOW;
else
	enum TTN_GETDISPINFO = TTN_GETDISPINFOA;
enum {
	TTN_NEEDTEXT  = TTN_GETDISPINFO,
	TTN_NEEDTEXTA = TTN_GETDISPINFOA,
	TTN_NEEDTEXTW = TTN_GETDISPINFOW,
}

alias NMTTDISPINFOW TOOLTIPTEXTW;
alias NMTTDISPINFOA TOOLTIPTEXTA;
alias LPNMTTDISPINFOA LPTOOLTIPTEXTA;
alias LPNMTTDISPINFOW LPTOOLTIPTEXTW;

alias NMTTDISPINFO TOOLTIPTEXT;
alias LPNMTTDISPINFO LPTOOLTIPTEXT;

enum NMTTDISPINFOA_V1_SIZE = NMTTDISPINFOA.uFlags.offsetof + NMTTDISPINFOA.uFlags.sizeof;
enum NMTTDISPINFOW_V1_SIZE = NMTTDISPINFOW.uFlags.offsetof + NMTTDISPINFOW.uFlags.sizeof;

struct NMTTDISPINFOA {
	NMHDR hdr;
	LPSTR lpszText;
	char[80] szText;
	HINSTANCE hinst;
	UINT uFlags;
	LPARAM lParam;
}
alias NMTTDISPINFOA* LPNMTTDISPINFOA;

struct NMTTDISPINFOW {
	NMHDR hdr;
	LPWSTR lpszText;
	WCHAR[80] szText;
	HINSTANCE hinst;
	UINT uFlags;
	LPARAM lParam;
}
alias NMTTDISPINFOW* LPNMTTDISPINFOW;

version(UNICODE){
	alias NMTTDISPINFOW NMTTDISPINFO;
	alias LPNMTTDISPINFOW LPNMTTDISPINFO;
	enum NMTTDISPINFO_V1_SIZE = NMTTDISPINFOW_V1_SIZE ;
}else{
	alias NMTTDISPINFOA NMTTDISPINFO;
	alias LPNMTTDISPINFOA LPNMTTDISPINFO;
	enum NMTTDISPINFO_V1_SIZE = NMTTDISPINFOA_V1_SIZE;
}

enum SBARS_SIZEGRIP = 0x0100;
enum SBARS_TOOLTIPS = 0x0800;
enum SBT_TOOLTIPS = 0x0800;

export extern(Windows) void DrawStatusTextA(HDC hDC, LPCRECT lprc, LPCSTR pszText, UINT uFlags);
export extern(Windows) void DrawStatusTextW(HDC hDC, LPCRECT lprc, LPCWSTR pszText, UINT uFlags);

export extern(Windows) HWND CreateStatusWindowA(LONG style, LPCSTR lpszText, HWND hwndParent, UINT wID);
export extern(Windows) HWND CreateStatusWindowW(LONG style, LPCWSTR lpszText, HWND hwndParent, UINT wID);

version(UNICODE){
	alias CreateStatusWindowW CreateStatusWindow;
	alias DrawStatusTextW DrawStatusText;
}else{
	alias CreateStatusWindowA CreateStatusWindow;
	alias DrawStatusTextA DrawStatusText;
}

//-------------------------------------------------------------------
const wchar* STATUSCLASSNAMEW = "msctls_statusbar32";
const char* STATUSCLASSNAMEA = "msctls_statusbar32";
version(UNICODE)
	alias STATUSCLASSNAMEW STATUSCLASSNAME;
else
	alias STATUSCLASSNAMEA STATUSCLASSNAME;

enum {
	SB_SETTEXTA         = WM_USER+1,
	SB_SETTEXTW         = WM_USER+11,
	SB_GETTEXTA         = WM_USER+2,
	SB_GETTEXTW         = WM_USER+13,
	SB_GETTEXTLENGTHA   = WM_USER+3,
	SB_GETTEXTLENGTHW   = WM_USER+12,
	SB_SETPARTS         = WM_USER+4,
	SB_GETPARTS         = WM_USER+6,
	SB_GETBORDERS       = WM_USER+7,
	SB_SETMINHEIGHT     = WM_USER+8,
	SB_SIMPLE           = WM_USER+9,
	SB_GETRECT          = WM_USER+10,
	SB_ISSIMPLE         = WM_USER + 14,
	SB_SETICON          = WM_USER+15,
	SB_SETTIPTEXTA      = WM_USER+16,
	SB_SETTIPTEXTW      = WM_USER+17,
	SB_GETTIPTEXTA      = WM_USER+18,
	SB_GETTIPTEXTW      = WM_USER+19,
	SB_GETICON          = WM_USER+20,
	SB_SETUNICODEFORMAT = CCM_SETUNICODEFORMAT,
	SB_GETUNICODEFORMAT = CCM_GETUNICODEFORMAT,
}

version(UNICODE){
	enum {
		SB_GETTEXT       = SB_GETTEXTW,
		SB_SETTEXT       = SB_SETTEXTW,
		SB_GETTEXTLENGTH = SB_GETTEXTLENGTHW,
		SB_SETTIPTEXT    = SB_SETTIPTEXTW,
		SB_GETTIPTEXT    = SB_GETTIPTEXTW,
	}
}else{
	enum {
		SB_GETTEXT       = SB_GETTEXTA,
		SB_SETTEXT       = SB_SETTEXTA,
		SB_GETTEXTLENGTH = SB_GETTEXTLENGTHA,
		SB_SETTIPTEXT    = SB_SETTIPTEXTA,
		SB_GETTIPTEXT    = SB_GETTIPTEXTA,
	}
}
enum {
	SBT_OWNERDRAW  = 0x1000,
	SBT_NOBORDERS  = 0x0100,
	SBT_POPOUT     = 0x0200,
	SBT_RTLREADING = 0x0400,
}
enum SBT_NOTABPARSING = 0x0800;
enum SB_SETBKCOLOR = CCM_SETBKCOLOR;
enum SBN_SIMPLEMODECHANGE = SBN_FIRST - 0;
enum SB_SIMPLEID = 0x00ff;

export extern(Windows) void MenuHelp(UINT uMsg, WPARAM wParam, LPARAM lParam, HMENU hMainMenu, HINSTANCE hInst, HWND hwndStatus, UINT* lpwIDs);
export extern(Windows) BOOL ShowHideMenuCtl(HWND hWnd, UINT_PTR uFlags, LPINT lpInfo);
export extern(Windows) void GetEffectiveClientRect(HWND hWnd, LPRECT lprc, const(INT)* lpInfo);

enum MINSYSCOMMAND = SC_SIZE;

//-------------------------------------------------------------------
const char* TRACKBAR_CLASSA = "msctls_trackbar32";
const wchar* TRACKBAR_CLASSW = "msctls_trackbar32";
version(UNICODE)
	alias TRACKBAR_CLASSW TRACKBAR_CLASS;
else
	alias TRACKBAR_CLASSA TRACKBAR_CLASS;

enum {
	TBS_AUTOTICKS        = 0x0001,
	TBS_VERT             = 0x0002,
	TBS_HORZ             = 0x0000,
	TBS_TOP              = 0x0004,
	TBS_BOTTOM           = 0x0000,
	TBS_LEFT             = 0x0004,
	TBS_RIGHT            = 0x0000,
	TBS_BOTH             = 0x0008,
	TBS_NOTICKS          = 0x0010,
	TBS_ENABLESELRANGE   = 0x0020,
	TBS_FIXEDLENGTH      = 0x0040,
	TBS_NOTHUMB          = 0x0080,
	TBS_TOOLTIPS         = 0x0100,
	TBS_REVERSED         = 0x0200,
	TBS_DOWNISLEFT       = 0x0400,
	TBS_NOTIFYBEFOREMOVE = 0x0800,
	//(NTDDI_VERSION >= NTDDI_VISTA)
		TBS_TRANSPARENTBKGND = 0x1000,
}

enum {
	TBM_GETPOS         = WM_USER,
	TBM_GETRANGEMIN    = WM_USER+1,
	TBM_GETRANGEMAX    = WM_USER+2,
	TBM_GETTIC         = WM_USER+3,
	TBM_SETTIC         = WM_USER+4,
	TBM_SETPOS         = WM_USER+5,
	TBM_SETRANGE       = WM_USER+6,
	TBM_SETRANGEMIN    = WM_USER+7,
	TBM_SETRANGEMAX    = WM_USER+8,
	TBM_CLEARTICS      = WM_USER+9,
	TBM_SETSEL         = WM_USER+10,
	TBM_SETSELSTART    = WM_USER+11,
	TBM_SETSELEND      = WM_USER+12,
	TBM_GETPTICS       = WM_USER+14,
	TBM_GETTICPOS      = WM_USER+15,
	TBM_GETNUMTICS     = WM_USER+16,
	TBM_GETSELSTART    = WM_USER+17,
	TBM_GETSELEND      = WM_USER+18,
	TBM_CLEARSEL       = WM_USER+19,
	TBM_SETTICFREQ     = WM_USER+20,
	TBM_SETPAGESIZE    = WM_USER+21,
	TBM_GETPAGESIZE    = WM_USER+22,
	TBM_SETLINESIZE    = WM_USER+23,
	TBM_GETLINESIZE    = WM_USER+24,
	TBM_GETTHUMBRECT   = WM_USER+25,
	TBM_GETCHANNELRECT = WM_USER+26,
	TBM_SETTHUMBLENGTH = WM_USER+27,
	TBM_GETTHUMBLENGTH = WM_USER+28,
}

enum {
	TBM_SETTOOLTIPS = WM_USER+29,
	TBM_GETTOOLTIPS = WM_USER+30,
	TBM_SETTIPSIDE  = WM_USER+31,
}
enum {
	TBTS_TOP    = 0,
	TBTS_LEFT   = 1,
	TBTS_BOTTOM = 2,
	TBTS_RIGHT  = 3,
}
enum {
	TBM_SETBUDDY     = WM_USER+32,
	TBM_GETBUDDY     = WM_USER+33,
	TBM_SETPOSNOTIFY = WM_USER+34,
}

enum {
	TBM_SETUNICODEFORMAT = CCM_SETUNICODEFORMAT,
	TBM_GETUNICODEFORMAT = CCM_GETUNICODEFORMAT,
}


enum {
	TB_LINEUP        = 0,
	TB_LINEDOWN      = 1,
	TB_PAGEUP        = 2,
	TB_PAGEDOWN      = 3,
	TB_THUMBPOSITION = 4,
	TB_THUMBTRACK    = 5,
	TB_TOP           = 6,
	TB_BOTTOM        = 7,
	TB_ENDTRACK      = 8,
}
enum {
	TBCD_TICS    = 0x0001,
	TBCD_THUMB   = 0x0002,
	TBCD_CHANNEL = 0x0003,
}

//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	enum TRBN_THUMBPOSCHANGING = TRBN_FIRST - 1;

	struct NMTRBTHUMBPOSCHANGING {
		NMHDR hdr;
		DWORD dwPos;
		int nReason;
	}


struct DRAGLISTINFO {
	UINT uNotification;
	HWND hWnd;
	POINT ptCursor;
}
alias DRAGLISTINFO* LPDRAGLISTINFO;

enum {
	DL_BEGINDRAG  = WM_USER+133,
	DL_DRAGGING   = WM_USER+134,
	DL_DROPPED    = WM_USER+135,
	DL_CANCELDRAG = WM_USER+136,
}
enum {
	DL_CURSORSET  = 0,
	DL_STOPCURSOR = 1,
	DL_COPYCURSOR = 2,
	DL_MOVECURSOR = 3,
}

const LPTSTR DRAGLISTMSGSTRING = "commctrl_DragListMsg";

export extern(Windows) BOOL MakeDragList(HWND hLB);
export extern(Windows) void DrawInsert(HWND handParent, HWND hLB, int nItem);
export extern(Windows) int LBItemFromPt(HWND hLB, POINT pt, BOOL bAutoScroll);

//-------------------------------------------------------------------
const char* UPDOWN_CLASSA = "msctls_updown32";
const wchar* UPDOWN_CLASSW = "msctls_updown32";
version(UNICODE)
	alias UPDOWN_CLASSW UPDOWN_CLASS;
else
	alias UPDOWN_CLASSA UPDOWN_CLASS;

struct UDACCEL {
	UINT nSec;
	UINT nInc;
}
alias UDACCEL* LPUDACCEL;

enum {
	UD_MAXVAL = 0x7fff,
	UD_MINVAL = -UD_MAXVAL,
}

enum {
	UDS_WRAP        = 0x0001,
	UDS_SETBUDDYINT = 0x0002,
	UDS_ALIGNRIGHT  = 0x0004,
	UDS_ALIGNLEFT   = 0x0008,
	UDS_AUTOBUDDY   = 0x0010,
	UDS_ARROWKEYS   = 0x0020,
	UDS_HORZ        = 0x0040,
	UDS_NOTHOUSANDS = 0x0080,
	UDS_HOTTRACK    = 0x0100,
}

enum {
	UDM_SETRANGE         = WM_USER+101,
	UDM_GETRANGE         = WM_USER+102,
	UDM_SETPOS           = WM_USER+103,
	UDM_GETPOS           = WM_USER+104,
	UDM_SETBUDDY         = WM_USER+105,
	UDM_GETBUDDY         = WM_USER+106,
	UDM_SETACCEL         = WM_USER+107,
	UDM_GETACCEL         = WM_USER+108,
	UDM_SETBASE          = WM_USER+109,
	UDM_GETBASE          = WM_USER+110,
	UDM_SETRANGE32       = WM_USER+111,
	UDM_GETRANGE32       = WM_USER+112,
	UDM_SETUNICODEFORMAT = CCM_SETUNICODEFORMAT,
	UDM_GETUNICODEFORMAT = CCM_GETUNICODEFORMAT,
	UDM_SETPOS32         = WM_USER+113,
	UDM_GETPOS32         = WM_USER+114,
}


export extern(Windows) HWND CreateUpDownControl(DWORD dwStyle, int x, int y, int cx, int cy, HWND hParent, int nID, HINSTANCE hInst, HWND hBuddy, int nUpper, int nLower, int nPos);

alias NMUPDOWN NM_UPDOWN;
alias LPNMUPDOWN LPNM_UPDOWN;

struct NMUPDOWN {
	NMHDR hdr;
	int iPos;
	int iDelta;
}
alias NMUPDOWN* LPNMUPDOWN;

enum UDN_DELTAPOS = UDN_FIRST - 1;

//-------------------------------------------------------------------
const char* PROGRESS_CLASSA = "msctls_progress32";
const wchar* PROGRESS_CLASSW = "msctls_progress32";
version(UNICODE)
	alias PROGRESS_CLASSW PROGRESS_CLASS;
else
	alias PROGRESS_CLASSA PROGRESS_CLASS;

enum {
	PBS_SMOOTH   = 0x01,
	PBS_VERTICAL = 0x04,
}

enum {
	PBM_SETRANGE = WM_USER+1,
	PBM_SETPOS   = WM_USER+2,
	PBM_DELTAPOS = WM_USER+3,
	PBM_SETSTEP  = WM_USER+4,
	PBM_STEPIT   = WM_USER+5,
}

enum PBM_SETRANGE32 = WM_USER + 6;
struct PBRANGE {
	int iLow;
	int iHigh;
}
alias PBRANGE* PPBRANGE;
enum {
	PBM_GETRANGE = WM_USER+7,
	PBM_GETPOS   = WM_USER+8,
}
enum PBM_SETBARCOLOR = WM_USER + 9;
enum PBM_SETBKCOLOR = CCM_SETBKCOLOR;


//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	enum PBS_MARQUEE = 0x08;
//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	enum PBM_SETMARQUEE = WM_USER + 10;
//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	enum PBS_SMOOTHREVERSE = 0x10;

//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	enum {
		PBM_GETSTEP     = WM_USER+13,
		PBM_GETBKCOLOR  = WM_USER+14,
		PBM_GETBARCOLOR = WM_USER+15,
		PBM_SETSTATE    = WM_USER+16,
		PBM_GETSTATE    = WM_USER+17,
	}

	enum {
		PBST_NORMAL = 0x0001,
		PBST_ERROR  = 0x0002,
		PBST_PAUSED = 0x0003,
	}


enum {
	HOTKEYF_SHIFT   = 0x01,
	HOTKEYF_CONTROL = 0x02,
	HOTKEYF_ALT     = 0x04,
	HOTKEYF_EXT     = 0x08,
}
enum {
	HKCOMB_NONE = 0x0001,
	HKCOMB_S    = 0x0002,
	HKCOMB_C    = 0x0004,
	HKCOMB_A    = 0x0008,
	HKCOMB_SC   = 0x0010,
	HKCOMB_SA   = 0x0020,
	HKCOMB_CA   = 0x0040,
	HKCOMB_SCA  = 0x0080,
}
enum {
	HKM_SETHOTKEY = WM_USER+1,
	HKM_GETHOTKEY = WM_USER+2,
	HKM_SETRULES  = WM_USER+3,
}

//-------------------------------------------------------------------
const char* HOTKEY_CLASSA = "msctls_hotkey32";
const wchar* HOTKEY_CLASSW = "msctls_hotkey32";
version(UNICODE)
	alias HOTKEY_CLASSW HOTKEY_CLASS;
else
	alias HOTKEY_CLASSA HOTKEY_CLASS;

enum {
	CCS_TOP           = 0x00000001,
	CCS_NOMOVEY       = 0x00000002,
	CCS_BOTTOM        = 0x00000003,
	CCS_NORESIZE      = 0x00000004,
	CCS_NOPARENTALIGN = 0x00000008,
	CCS_ADJUSTABLE    = 0x00000020,
	CCS_NODIVIDER     = 0x00000040,
	CCS_VERT          = 0x00000080,
	CCS_LEFT          = CCS_VERT | CCS_TOP,
	CCS_RIGHT         = CCS_VERT | CCS_BOTTOM,
	CCS_NOMOVEX       = CCS_VERT | CCS_NOMOVEY,
}

//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	enum {
		INVALID_LINK_INDEX = -1,
		MAX_LINKID_TEXT    = 48,
	}
	enum L_MAX_URL_LENGTH = 2048 + 32 + 3; // 3 = "://"

	const wchar* WC_LINK = "SysLink";

	enum {
		LWS_TRANSPARENT  = 0x0001,
		LWS_IGNORERETURN = 0x0002,
	}
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		enum {
			LWS_NOPREFIX       = 0x0004,
			LWS_USEVISUALSTYLE = 0x0008,
			LWS_USECUSTOMTEXT  = 0x0010,
			LWS_RIGHT          = 0x0020,
		}

	enum {
		LIF_ITEMINDEX = 0x00000001,
		LIF_STATE     = 0x00000002,
		LIF_ITEMID    = 0x00000004,
		LIF_URL       = 0x00000008,
	}
	enum {
		LIS_FOCUSED = 0x00000001,
		LIS_ENABLED = 0x00000002,
		LIS_VISITED = 0x00000004,
		//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
			LIS_HOTTRACK      = 0x00000008,
			LIS_DEFAULTCOLORS = 0x00000010,
	}

	struct LITEM {
		UINT mask;
		int iLink;
		UINT state;
		UINT stateMask;
		WCHAR[MAX_LINKID_TEXT] szID;
		WCHAR[L_MAX_URL_LENGTH] szUrl;
	}
	alias LITEM* PLITEM;

	struct LHITTESTINFO {
		POINT pt;
		LITEM item;
	}
	alias LHITTESTINFO* PLHITTESTINFO;

	struct NMLINK {
		NMHDR hdr;
		LITEM item;
	}
	alias NMLINK* PNMLINK;
	enum {
		LM_HITTEST        = WM_USER+0x300,
		LM_GETIDEALHEIGHT = WM_USER+0x301,
		LM_SETITEM        = WM_USER+0x302,
		LM_GETITEM        = WM_USER+0x303,
		LM_GETIDEALSIZE   = LM_GETIDEALHEIGHT,
	}

//-------------------------------------------------------------------
const char* WC_LISTVIEWA = "SysListView32";
const wchar* WC_LISTVIEWW = "SysListView32";
version(UNICODE)
	alias WC_LISTVIEWW WC_LISTVIEW;
else
	alias WC_LISTVIEWA WC_LISTVIEW;

enum {
	LVS_ICON            = 0x0000,
	LVS_REPORT          = 0x0001,
	LVS_SMALLICON       = 0x0002,
	LVS_LIST            = 0x0003,
	LVS_TYPEMASK        = 0x0003,
	LVS_SINGLESEL       = 0x0004,
	LVS_SHOWSELALWAYS   = 0x0008,
	LVS_SORTASCENDING   = 0x0010,
	LVS_SORTDESCENDING  = 0x0020,
	LVS_SHAREIMAGELISTS = 0x0040,
	LVS_NOLABELWRAP     = 0x0080,
	LVS_AUTOARRANGE     = 0x0100,
	LVS_EDITLABELS      = 0x0200,
	LVS_OWNERDATA       = 0x1000,
	LVS_NOSCROLL        = 0x2000,
	LVS_TYPESTYLEMASK   = 0xfc00,
	LVS_ALIGNTOP        = 0x0000,
	LVS_ALIGNLEFT       = 0x0800,
	LVS_ALIGNMASK       = 0x0c00,
	LVS_OWNERDRAWFIXED  = 0x0400,
	LVS_NOCOLUMNHEADER  = 0x4000,
	LVS_NOSORTHEADER    = 0x8000,
}
enum LVM_SETUNICODEFORMAT = CCM_SETUNICODEFORMAT;

enum LVM_GETUNICODEFORMAT = CCM_GETUNICODEFORMAT;

version(HelperFunctions){
	BOOL ListView_SetUnicodeFormat(HWND hwnd, BOOL fUnicode)
	{
		return cast(BOOL)SendMessage(hwnd, LVM_SETUNICODEFORMAT, cast(WPARAM)fUnicode, 0);
	}

	BOOL ListView_GetUnicodeFormat(HWND hwnd)
	{
		return cast(BOOL)SendMessage(hwnd, LVM_GETUNICODEFORMAT, 0, 0);
	}
}

enum LVM_GETBKCOLOR = LVM_FIRST + 0;
enum LVM_SETBKCOLOR = LVM_FIRST + 1;
enum LVM_GETIMAGELIST = LVM_FIRST + 2;
enum {
	LVSIL_NORMAL      = 0,
	LVSIL_SMALL       = 1,
	LVSIL_STATE       = 2,
	LVSIL_GROUPHEADER = 3,
}
enum LVM_SETIMAGELIST = LVM_FIRST + 3;
enum LVM_GETITEMCOUNT = LVM_FIRST + 4;
enum {
	LVIF_TEXT        = 0x00000001,
	LVIF_IMAGE       = 0x00000002,
	LVIF_PARAM       = 0x00000004,
	LVIF_STATE       = 0x00000008,
	LVIF_INDENT      = 0x00000010,
	LVIF_NORECOMPUTE = 0x00000800,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		LVIF_GROUPID = 0x00000100,
		LVIF_COLUMNS = 0x00000200,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		LVIF_COLFMT  = 0x00010000,
}
enum {
	LVIS_FOCUSED        = 0x0001,
	LVIS_SELECTED       = 0x0002,
	LVIS_CUT            = 0x0004,
	LVIS_DROPHILITED    = 0x0008,
	LVIS_GLOW           = 0x0010,
	LVIS_ACTIVATING     = 0x0020,
	LVIS_OVERLAYMASK    = 0x0F00,
	LVIS_STATEIMAGEMASK = 0xF000,
}

pure nothrow
UINT INDEXTOSTATEIMAGEMASK(UINT i)
{
	return i << 12;
}

enum I_INDENTCALLBACK = -1;
//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	enum I_GROUPIDCALLBACK = -1;
	enum I_GROUPIDNONE = -2;

//alias LVITEMA LV_ITEMA;
//alias LVITEMW LV_ITEMW;
//alias LVITEM LV_ITEM;

struct LVITEMA {
	UINT mask;
	int iItem;
	int iSubItem;
	UINT state;
	UINT stateMask;
	LPSTR pszText;
	int cchTextMax;
	int iImage;
	LPARAM lParam;
	int iIndent;
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		int iGroupId;
		UINT cColumns;
		PUINT puColumns;
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		int* piColFmt;
		int iGroup;
}
alias LVITEMA* LPLVITEMA;

struct LVITEMW {
	UINT mask;
	int iItem;
	int iSubItem;
	UINT state;
	UINT stateMask;
	LPWSTR pszText;
	int cchTextMax;
	int iImage;
	LPARAM lParam;
	int iIndent;
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		int iGroupId;
		UINT cColumns;
		PUINT puColumns;
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		int* piColFmt;
		int iGroup;
}
alias LVITEMW* LPLVITEMW;
enum LVITEMA_V1_SIZE = LVITEMA.lParam.offsetof + LVITEMA.lParam.sizeof;
enum LVITEMW_V1_SIZE = LVITEMW.lParam.offsetof + LVITEMW.lParam.sizeof;
version(UNICODE){
	alias LVITEMW LVITEM;
	alias LPLVITEMW LPLVITEM;
	enum LVITEM_V1_SIZE = LVITEMW_V1_SIZE;
}else{
	alias LVITEMA LVITEM;
	alias LPLVITEMA LPLVITEM;
	enum LVITEM_V1_SIZE = LVITEMA_V1_SIZE;
}
//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	enum LVITEMA_V5_SIZE = LVITEMA.puColumns.offsetof + LVITEMA.puColumns.sizeof;
	enum LVITEMW_V5_SIZE = LVITEMW.puColumns.offsetof + LVITEMW.puColumns.sizeof;
	version(UNICODE)
		enum LVITEM_V5_SIZE = LVITEMW_V5_SIZE;
	else
		enum LVITEM_V5_SIZE = LVITEMA_V5_SIZE;

const LPWSTR LPSTR_TEXTCALLBACKW = cast(LPWSTR)-1;
const LPSTR LPSTR_TEXTCALLBACKA = cast(LPSTR)-1;
version(UNICODE)
	alias LPSTR_TEXTCALLBACKW LPSTR_TEXTCALLBACK;
else
	alias LPSTR_TEXTCALLBACKA LPSTR_TEXTCALLBACK;

enum {
	I_IMAGECALLBACK = -1,
	I_IMAGENONE     = -2,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		I_COLUMNSCALLBACK = cast(UINT)-1,
}

enum {
	LVM_GETITEMA = LVM_FIRST + 5,
	LVM_GETITEMW = LVM_FIRST + 75,
}
version(UNICODE)
	enum LVM_GETITEM = LVM_GETITEMW;
else
	enum LVM_GETITEM = LVM_GETITEMA;
enum {
	LVM_SETITEMA = LVM_FIRST + 6,
	LVM_SETITEMW = LVM_FIRST + 76,
}
version(UNICODE)
	enum LVM_SETITEM = LVM_SETITEMW;
else
	enum LVM_SETITEM = LVM_SETITEMA;

enum {
	LVM_INSERTITEMA = LVM_FIRST + 7,
	LVM_INSERTITEMW = LVM_FIRST + 77,
}
version(UNICODE)
	enum LVM_INSERTITEM = LVM_INSERTITEMW;
else
	enum LVM_INSERTITEM = LVM_INSERTITEMA;

enum LVM_DELETEITEM = LVM_FIRST + 8;
enum LVM_DELETEALLITEMS = LVM_FIRST + 9;
enum LVM_GETCALLBACKMASK = LVM_FIRST + 10;
enum LVM_SETCALLBACKMASK = LVM_FIRST + 11;

enum {
	LVNI_ALL           = 0x0000,
	LVNI_FOCUSED       = 0x0001,
	LVNI_SELECTED      = 0x0002,
	LVNI_CUT           = 0x0004,
	LVNI_DROPHILITED   = 0x0008,
	LVNI_STATEMASK     = LVNI_FOCUSED | LVNI_SELECTED | LVNI_CUT | LVNI_DROPHILITED,
	LVNI_VISIBLEORDER  = 0x0010,
	LVNI_PREVIOUS      = 0x0020,
	LVNI_VISIBLEONLY   = 0x0040,
	LVNI_SAMEGROUPONLY = 0x0080,
	LVNI_ABOVE         = 0x0100,
	LVNI_BELOW         = 0x0200,
	LVNI_TOLEFT        = 0x0400,
	LVNI_TORIGHT       = 0x0800,
	LVNI_DIRECTIONMASK = LVNI_ABOVE | LVNI_BELOW | LVNI_TOLEFT | LVNI_TORIGHT,
	LVM_GETNEXTITEM    = LVM_FIRST + 12,
}

enum {
	LVFI_PARAM     = 0x0001,
	LVFI_STRING    = 0x0002,
	LVFI_SUBSTRING = 0x0004,
	LVFI_PARTIAL   = 0x0008,
	LVFI_WRAP      = 0x0020,
	LVFI_NEARESTXY = 0x0040,
}

struct LVFINDINFOA {
	UINT flags;
	LPCSTR psz;
	LPARAM lParam;
	POINT pt;
	UINT vkDirection;
}
alias LVFINDINFOA* LPFINDINFOA;

struct LVFINDINFOW {
	UINT flags;
	LPCWSTR psz;
	LPARAM lParam;
	POINT pt;
	UINT vkDirection;
}
alias LVFINDINFOW* LPFINDINFOW;

version(UNICODE)
	alias LVFINDINFOW LVFINDINFO;
else
	alias LVFINDINFOA LVFINDINFO;

//alias LVFINDINFOA LV_FINDINFOA;
//alias LVFINDINFOW LV_FINDINFOW;
//alias LVFINDINFO LV_FINDINFO;

enum {
	LVM_FINDITEMA = LVM_FIRST + 13,
	LVM_FINDITEMW = LVM_FIRST + 83,
}
version(UNICODE)
	enum LVM_FINDITEM = LVM_FINDITEMW;
else
	enum LVM_FINDITEM = LVM_FINDITEMA;

enum {
	LVIR_BOUNDS       = 0,
	LVIR_ICON         = 1,
	LVIR_LABEL        = 2,
	LVIR_SELECTBOUNDS = 3,
}
enum LVM_GETITEMRECT = LVM_FIRST + 14;
enum LVM_SETITEMPOSITION = LVM_FIRST + 15;
enum LVM_GETITEMPOSITION = LVM_FIRST + 16;
enum {
	LVM_GETSTRINGWIDTHA = LVM_FIRST + 17,
	LVM_GETSTRINGWIDTHW = LVM_FIRST + 87,
}
version(UNICODE)
	enum LVM_GETSTRINGWIDTH = LVM_GETSTRINGWIDTHW;
else
	enum LVM_GETSTRINGWIDTH = LVM_GETSTRINGWIDTHA;

enum {
	LVHT_NOWHERE         = 0x00000001,
	LVHT_ONITEMICON      = 0x00000002,
	LVHT_ONITEMLABEL     = 0x00000004,
	LVHT_ONITEMSTATEICON = 0x00000008,
	LVHT_ONITEM          = LVHT_ONITEMICON | LVHT_ONITEMLABEL | LVHT_ONITEMSTATEICON,
	LVHT_ABOVE           = 0x00000008,
	LVHT_BELOW           = 0x00000010,
	LVHT_TORIGHT         = 0x00000020,
	LVHT_TOLEFT          = 0x00000040,
}
enum {
	LVHT_EX_GROUP_HEADER     = 0x10000000,
	LVHT_EX_GROUP_FOOTER     = 0x20000000,
	LVHT_EX_GROUP_COLLAPSE   = 0x40000000,
	LVHT_EX_GROUP_BACKGROUND = 0x80000000,
	LVHT_EX_GROUP_STATEICON  = 0x01000000,
	LVHT_EX_GROUP_SUBSETLINK = 0x02000000,
	LVHT_EX_GROUP            = LVHT_EX_GROUP_BACKGROUND | LVHT_EX_GROUP_COLLAPSE | LVHT_EX_GROUP_FOOTER | LVHT_EX_GROUP_HEADER | LVHT_EX_GROUP_STATEICON | LVHT_EX_GROUP_SUBSETLINK,
	LVHT_EX_ONCONTENTS       = 0x04000000,
	LVHT_EX_FOOTER           = 0x08000000,
}

struct LVHITTESTINFO {
	POINT pt;
	UINT flags;
	int iItem;
	int iSubItem;
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		int iGroup;
}
alias LVHITTESTINFO* LPLVHITTESTINFO;
//alias LVHITTESTINFO LV_HITTESTINFO;

enum LVHITTESTINFO_V1_SIZE = LVHITTESTINFO.iItem.offsetof + LVHITTESTINFO.iItem.sizeof;
enum LVM_HITTEST = LVM_FIRST + 18;
enum LVM_ENSUREVISIBLE = LVM_FIRST + 19;
enum LVM_SCROLL = LVM_FIRST + 20;
enum LVM_REDRAWITEMS = LVM_FIRST + 21;
enum {
	LVA_DEFAULT    = 0x0000,
	LVA_ALIGNLEFT  = 0x0001,
	LVA_ALIGNTOP   = 0x0002,
	LVA_SNAPTOGRID = 0x0005,
}
enum LVM_ARRANGE = LVM_FIRST + 22;
enum {
	LVM_EDITLABELA = LVM_FIRST + 23,
	LVM_EDITLABELW = LVM_FIRST + 118,
}
version(UNICODE)
	enum LVM_EDITLABEL = LVM_EDITLABELW;
else
	enum LVM_EDITLABEL = LVM_EDITLABELA;

enum LVM_GETEDITCONTROL = LVM_FIRST + 24;

struct LVCOLUMNA {
	UINT mask;
	int fmt;
	int cx;
	LPSTR pszText;
	int cchTextMax;
	int iSubItem;
	int iImage;
	int iOrder;
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		int cxMin;
		int cxDefault;
		int cxIdeal;
}
alias LVCOLUMNA* LPLVCOLUMNA;

struct LVCOLUMNW {
	UINT mask;
	int fmt;
	int cx;
	LPWSTR pszText;
	int cchTextMax;
	int iSubItem;
	int iImage;
	int iOrder;
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		int cxMin;
		int cxDefault;
		int cxIdeal;
}
alias LVCOLUMNW* LPLVCOLUMNW;

enum LVCOLUMNA_V1_SIZE = LVCOLUMNA.iSubItem.offsetof + LVCOLUMNA.iSubItem.sizeof;
enum LVCOLUMNW_V1_SIZE = LVCOLUMNW.iSubItem.offsetof + LVCOLUMNW.iSubItem.sizeof;
version(UNICODE){
	alias LVCOLUMNW LVCOLUMN;
	alias LPLVCOLUMNW LPLVCOLUMN;
	enum LVCOLUMN_V1_SIZE = LVCOLUMNW_V1_SIZE;
}else{
	alias LVCOLUMNA LVCOLUMN;
	alias LPLVCOLUMNA LPLVCOLUMN;
	enum LVCOLUMN_V1_SIZE = LVCOLUMNA_V1_SIZE;
}
//alias LVCOLUMNA LV_COLUMNA;
//alias LVCOLUMNW LV_COLUMNW;
//alias LVCOLUMN LV_COLUMN;

enum {
	LVCF_FMT     = 0x0001,
	LVCF_WIDTH   = 0x0002,
	LVCF_TEXT    = 0x0004,
	LVCF_SUBITEM = 0x0008,
	LVCF_IMAGE   = 0x0010,
	LVCF_ORDER   = 0x0020,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		LVCF_MINWIDTH     = 0x0040,
		LVCF_DEFAULTWIDTH = 0x0080,
		LVCF_IDEALWIDTH   = 0x0100,
}
enum {
	LVCFMT_LEFT            = 0x0000,
	LVCFMT_RIGHT           = 0x0001,
	LVCFMT_CENTER          = 0x0002,
	LVCFMT_JUSTIFYMASK     = 0x0003,
	LVCFMT_IMAGE           = 0x0800,
	LVCFMT_BITMAP_ON_RIGHT = 0x1000,
	LVCFMT_COL_HAS_IMAGES  = 0x8000,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		LVCFMT_FIXED_WIDTH        = 0x00100,
		LVCFMT_NO_DPI_SCALE       = 0x40000,
		LVCFMT_FIXED_RATIO        = 0x80000,
		LVCFMT_LINE_BREAK         = 0x100000,
		LVCFMT_FILL               = 0x200000,
		LVCFMT_WRAP               = 0x400000,
		LVCFMT_NO_TITLE           = 0x800000,
		LVCFMT_TILE_PLACEMENTMASK = LVCFMT_LINE_BREAK | LVCFMT_FILL,
		LVCFMT_SPLITBUTTON        = 0x1000000,
}
enum {
	LVM_GETCOLUMNA = LVM_FIRST + 25,
	LVM_GETCOLUMNW = LVM_FIRST + 95,
}
version(UNICODE)
	enum LVM_GETCOLUMN = LVM_GETCOLUMNW;
else
	enum LVM_GETCOLUMN = LVM_GETCOLUMNA;
enum {
	LVM_SETCOLUMNA = LVM_FIRST + 26,
	LVM_SETCOLUMNW = LVM_FIRST + 96,
}
version(UNICODE)
	enum LVM_SETCOLUMN = LVM_SETCOLUMNW;
else
	enum LVM_SETCOLUMN = LVM_SETCOLUMNA;

enum {
	LVM_INSERTCOLUMNA = LVM_FIRST + 27,
	LVM_INSERTCOLUMNW = LVM_FIRST + 97,
}
version(UNICODE)
	enum LVM_INSERTCOLUMN = LVM_INSERTCOLUMNW;
else
	enum LVM_INSERTCOLUMN = LVM_INSERTCOLUMNA;

enum LVM_DELETECOLUMN = LVM_FIRST + 28;
enum LVM_GETCOLUMNWIDTH = LVM_FIRST + 29;
enum {
	LVSCW_AUTOSIZE           = -1,
	LVSCW_AUTOSIZE_USEHEADER = -2,
}
enum LVM_SETCOLUMNWIDTH = LVM_FIRST + 30;
enum LVM_GETHEADER = LVM_FIRST + 31;

enum LVM_CREATEDRAGIMAGE = LVM_FIRST + 33;
enum LVM_GETVIEWRECT = LVM_FIRST + 34;
enum LVM_GETTEXTCOLOR = LVM_FIRST + 35;
enum LVM_SETTEXTCOLOR = LVM_FIRST + 36;
enum LVM_GETTEXTBKCOLOR = LVM_FIRST + 37;
enum LVM_SETTEXTBKCOLOR = LVM_FIRST + 38;
enum LVM_GETTOPINDEX = LVM_FIRST + 39;
enum LVM_GETCOUNTPERPAGE = LVM_FIRST + 40;
enum LVM_GETORIGIN = LVM_FIRST + 41;
enum LVM_UPDATE = LVM_FIRST + 42;
enum LVM_SETITEMSTATE = LVM_FIRST + 43;

enum LVM_GETITEMSTATE = LVM_FIRST + 44;
enum {
	LVM_GETITEMTEXTA = LVM_FIRST + 45,
	LVM_GETITEMTEXTW = LVM_FIRST + 115,
}
version(UNICODE)
	enum LVM_GETITEMTEXT = LVM_GETITEMTEXTW;
else
	enum LVM_GETITEMTEXT = LVM_GETITEMTEXTA;

enum {
	LVM_SETITEMTEXTA = LVM_FIRST + 46,
	LVM_SETITEMTEXTW = LVM_FIRST + 116,
}
version(UNICODE)
	enum LVM_SETITEMTEXT = LVM_SETITEMTEXTW;
else
	enum LVM_SETITEMTEXT = LVM_SETITEMTEXTA;

enum {
	LVSICF_NOINVALIDATEALL = 0x00000001,
	LVSICF_NOSCROLL        = 0x00000002,
}

enum LVM_SETITEMCOUNT = LVM_FIRST + 47;

alias extern(Windows) int function(LPARAM, LPARAM, LPARAM) PFNLVCOMPARE;

enum LVM_SORTITEMS = LVM_FIRST + 48;

enum LVM_SETITEMPOSITION32 = LVM_FIRST + 49;

enum LVM_GETSELECTEDCOUNT = LVM_FIRST + 50;

enum LVM_GETITEMSPACING = LVM_FIRST + 51;

enum {
	LVM_GETISEARCHSTRINGA = LVM_FIRST + 52,
	LVM_GETISEARCHSTRINGW = LVM_FIRST + 117,
}
version(UNICODE)
	enum LVM_GETISEARCHSTRING = LVM_GETISEARCHSTRINGW;
else
	enum LVM_GETISEARCHSTRING = LVM_GETISEARCHSTRINGA;


enum LVM_SETICONSPACING = LVM_FIRST + 53;
enum LVM_SETEXTENDEDLISTVIEWSTYLE = LVM_FIRST + 54;
enum LVM_GETEXTENDEDLISTVIEWSTYLE = LVM_FIRST + 55;
enum {
	LVS_EX_GRIDLINES        = 0x00000001,
	LVS_EX_SUBITEMIMAGES    = 0x00000002,
	LVS_EX_CHECKBOXES       = 0x00000004,
	LVS_EX_TRACKSELECT      = 0x00000008,
	LVS_EX_HEADERDRAGDROP   = 0x00000010,
	LVS_EX_FULLROWSELECT    = 0x00000020,
	LVS_EX_ONECLICKACTIVATE = 0x00000040,
	LVS_EX_TWOCLICKACTIVATE = 0x00000080,
	LVS_EX_FLATSB           = 0x00000100,
	LVS_EX_REGIONAL         = 0x00000200,
	LVS_EX_INFOTIP          = 0x00000400,
	LVS_EX_UNDERLINEHOT     = 0x00000800,
	LVS_EX_UNDERLINECOLD    = 0x00001000,
	LVS_EX_MULTIWORKAREAS   = 0x00002000,
	LVS_EX_LABELTIP         = 0x00004000,
	LVS_EX_BORDERSELECT     = 0x00008000,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		LVS_EX_DOUBLEBUFFER = 0x00010000,
		LVS_EX_HIDELABELS   = 0x00020000,
		LVS_EX_SINGLEROW    = 0x00040000,
		LVS_EX_SNAPTOGRID   = 0x00080000,
		LVS_EX_SIMPLESELECT = 0x00100000,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		LVS_EX_JUSTIFYCOLUMNS        = 0x00200000,
		LVS_EX_TRANSPARENTBKGND      = 0x00400000,
		LVS_EX_TRANSPARENTSHADOWTEXT = 0x00800000,
		LVS_EX_AUTOAUTOARRANGE       = 0x01000000,
		LVS_EX_HEADERINALLVIEWS      = 0x02000000,
		LVS_EX_AUTOCHECKSELECT       = 0x08000000,
		LVS_EX_AUTOSIZECOLUMNS       = 0x10000000,
		LVS_EX_COLUMNSNAPPOINTS      = 0x40000000,
		LVS_EX_COLUMNOVERFLOW        = 0x80000000,
}

enum LVM_GETSUBITEMRECT = LVM_FIRST + 56;
enum LVM_SUBITEMHITTEST = LVM_FIRST + 57;
enum LVM_SETCOLUMNORDERARRAY = LVM_FIRST + 58;
enum LVM_GETCOLUMNORDERARRAY = LVM_FIRST + 59;
enum LVM_SETHOTITEM = LVM_FIRST + 60;
enum LVM_GETHOTITEM = LVM_FIRST + 61;
enum LVM_SETHOTCURSOR = LVM_FIRST + 62;
enum LVM_GETHOTCURSOR = LVM_FIRST + 63;
enum LVM_APPROXIMATEVIEWRECT = LVM_FIRST + 64;



enum LV_MAX_WORKAREAS = 16;
enum LVM_SETWORKAREAS = LVM_FIRST + 65;
enum LVM_GETWORKAREAS = LVM_FIRST + 70;
enum LVM_GETNUMBEROFWORKAREAS = LVM_FIRST + 73;
enum LVM_GETSELECTIONMARK = LVM_FIRST + 66;
enum LVM_SETSELECTIONMARK = LVM_FIRST + 67;
enum LVM_SETHOVERTIME = LVM_FIRST + 71;
enum LVM_GETHOVERTIME = LVM_FIRST + 72;
enum LVM_SETTOOLTIPS = LVM_FIRST + 74;
enum LVM_GETTOOLTIPS = LVM_FIRST + 78;
enum LVM_SORTITEMSEX = LVM_FIRST + 81;

struct LVBKIMAGEA {
	ULONG ulFlags;
	HBITMAP hbm;
	LPSTR pszImage;
	UINT cchImageMax;
	int xOffsetPercent;
	int yOffsetPercent;
}
alias LVBKIMAGEA* LPLVBKIMAGEA;
struct LVBKIMAGEW {
	ULONG ulFlags;
	HBITMAP hbm;
	LPWSTR pszImage;
	UINT cchImageMax;
	int xOffsetPercent;
	int yOffsetPercent;
}
alias LVBKIMAGEW* LPLVBKIMAGEW;
enum {
	LVBKIF_SOURCE_NONE    = 0x00000000,
	LVBKIF_SOURCE_HBITMAP = 0x00000001,
	LVBKIF_SOURCE_URL     = 0x00000002,
	LVBKIF_SOURCE_MASK    = 0x00000003,
	LVBKIF_STYLE_NORMAL   = 0x00000000,
	LVBKIF_STYLE_TILE     = 0x00000010,
	LVBKIF_STYLE_MASK     = 0x00000010,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		LVBKIF_FLAG_TILEOFFSET = 0x00000100,
		LVBKIF_TYPE_WATERMARK  = 0x10000000,
		LVBKIF_FLAG_ALPHABLEND = 0x20000000,
}
enum {
	LVM_SETBKIMAGEA = LVM_FIRST + 68,
	LVM_SETBKIMAGEW = LVM_FIRST + 138,
	LVM_GETBKIMAGEA = LVM_FIRST + 69,
	LVM_GETBKIMAGEW = LVM_FIRST + 139,
}
//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	enum LVM_SETSELECTEDCOLUMN = LVM_FIRST + 140;
	enum {
		LV_VIEW_ICON      = 0x0000,
		LV_VIEW_DETAILS   = 0x0001,
		LV_VIEW_SMALLICON = 0x0002,
		LV_VIEW_LIST      = 0x0003,
		LV_VIEW_TILE      = 0x0004,
		LV_VIEW_MAX       = 0x0004,
	}
	enum LVM_SETVIEW = LVM_FIRST + 142;
	enum LVM_GETVIEW = LVM_FIRST + 143;
	enum {
		LVGF_NONE    = 0x00000000,
		LVGF_HEADER  = 0x00000001,
		LVGF_FOOTER  = 0x00000002,
		LVGF_STATE   = 0x00000004,
		LVGF_ALIGN   = 0x00000008,
		LVGF_GROUPID = 0x00000010,
		//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
			LVGF_SUBTITLE          = 0x00000100,
			LVGF_TASK              = 0x00000200,
			LVGF_DESCRIPTIONTOP    = 0x00000400,
			LVGF_DESCRIPTIONBOTTOM = 0x00000800,
			LVGF_TITLEIMAGE        = 0x00001000,
			LVGF_EXTENDEDIMAGE     = 0x00002000,
			LVGF_ITEMS             = 0x00004000,
			LVGF_SUBSET            = 0x00008000,
			LVGF_SUBSETITEMS       = 0x00010000,
	}
	enum {
		LVGS_NORMAL            = 0x00000000,
		LVGS_COLLAPSED         = 0x00000001,
		LVGS_HIDDEN            = 0x00000002,
		LVGS_NOHEADER          = 0x00000004,
		LVGS_COLLAPSIBLE       = 0x00000008,
		LVGS_FOCUSED           = 0x00000010,
		LVGS_SELECTED          = 0x00000020,
		LVGS_SUBSETED          = 0x00000040,
		LVGS_SUBSETLINKFOCUSED = 0x00000080,
	}
	enum {
		LVGA_HEADER_LEFT   = 0x00000001,
		LVGA_HEADER_CENTER = 0x00000002,
		LVGA_HEADER_RIGHT  = 0x00000004,
		LVGA_FOOTER_LEFT   = 0x00000008,
		LVGA_FOOTER_CENTER = 0x00000010,
		LVGA_FOOTER_RIGHT  = 0x00000020,
	}
	struct LVGROUP {
		UINT cbSize;
		UINT mask;
		LPWSTR pszHeader;
		int cchHeader;
		LPWSTR pszFooter;
		int cchFooter;
		int iGroupId;
		UINT stateMask;
		UINT state;
		UINT uAlign;
		//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
			LPWSTR pszSubtitle;
			UINT cchSubtitle;
			LPWSTR pszTask;
			UINT cchTask;
			LPWSTR pszDescriptionTop;
			UINT cchDescriptionTop;
			LPWSTR pszDescriptionBottom;
			UINT cchDescriptionBottom;
			int iTitleImage;
			int iExtendedImage;
			int iFirstItem;
			UINT cItems;
			LPWSTR pszSubsetTitle;
			UINT cchSubsetTitle;
	}
	alias LVGROUP* PLVGROUP;
	enum LVGROUP_V5_SIZE = LVGROUP.uAlign.offsetof + LVGROUP.uAlign.sizeof;

	enum LVM_INSERTGROUP = LVM_FIRST + 145;
	enum LVM_SETGROUPINFO = LVM_FIRST + 147;
	enum LVM_GETGROUPINFO = LVM_FIRST + 149;
	enum LVM_REMOVEGROUP = LVM_FIRST + 150;
	enum LVM_MOVEGROUP = LVM_FIRST + 151;
	enum LVM_GETGROUPCOUNT = LVM_FIRST + 152;
	enum LVM_GETGROUPINFOBYINDEX = LVM_FIRST + 153;
	enum LVM_MOVEITEMTOGROUP = LVM_FIRST + 154;

	enum {
		LVGGR_GROUP      = 0,
		LVGGR_HEADER     = 1,
		LVGGR_LABEL      = 2,
		LVGGR_SUBSETLINK = 3,
	}
	enum LVM_GETGROUPRECT = LVM_FIRST + 98;

	enum {
		LVGMF_NONE        = 0x00000000,
		LVGMF_BORDERSIZE  = 0x00000001,
		LVGMF_BORDERCOLOR = 0x00000002,
		LVGMF_TEXTCOLOR   = 0x00000004,
	}
	struct LVGROUPMETRICS {
		UINT cbSize;
		UINT mask;
		UINT Left;
		UINT Top;
		UINT Right;
		UINT Bottom;
		COLORREF crLeft;
		COLORREF crTop;
		COLORREF crRight;
		COLORREF crBottom;
		COLORREF crHeader;
		COLORREF crFooter;
	}
	alias LVGROUPMETRICS* PLVGROUPMETRICS;

	enum LVM_SETGROUPMETRICS = LVM_FIRST + 155;
	enum LVM_GETGROUPMETRICS = LVM_FIRST + 156;
	enum LVM_ENABLEGROUPVIEW = LVM_FIRST + 157;
	alias extern(Windows) int function(int, int, void*) PFNLVGROUPCOMPARE;
	enum LVM_SORTGROUPS = LVM_FIRST + 158;

	struct LVINSERTGROUPSORTED {
		PFNLVGROUPCOMPARE pfnGroupCompare;
		void* pvData;
		LVGROUP lvGroup;
	}
	alias LVINSERTGROUPSORTED* PLVINSERTGROUPSORTED;

	enum LVM_INSERTGROUPSORTED = LVM_FIRST + 159;
	enum LVM_REMOVEALLGROUPS = LVM_FIRST + 160;
	enum LVM_HASGROUP = LVM_FIRST + 161;
	enum LVM_GETGROUPSTATE = LVM_FIRST + 92;
	enum LVM_GETFOCUSEDGROUP = LVM_FIRST + 93;
	enum {
		LVTVIF_AUTOSIZE    = 0x00000000,
		LVTVIF_FIXEDWIDTH  = 0x00000001,
		LVTVIF_FIXEDHEIGHT = 0x00000002,
		LVTVIF_FIXEDSIZE   = 0x00000003,
		//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
			LVTVIF_EXTENDED = 0x00000004,
	}
	enum {
		LVTVIM_TILESIZE    = 0x00000001,
		LVTVIM_COLUMNS     = 0x00000002,
		LVTVIM_LABELMARGIN = 0x00000004,
	}

	struct LVTILEVIEWINFO {
		UINT cbSize;
		DWORD dwMask;
		DWORD dwFlags;
		SIZE sizeTile;
		int cLines;
		RECT rcLabelMargin;
	}
	alias LVTILEVIEWINFO* PLVTILEVIEWINFO;

	struct LVTILEINFO {
		UINT cbSize;
		int iItem;
		UINT cColumns;
		PUINT puColumns;
		//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
			int* piColFmt;
	}
	alias LVTILEINFO* PLVTILEINFO;

	enum LVTILEINFO_V5_SIZE = LVTILEINFO.puColumns.offsetof + LVTILEINFO.puColumns.sizeof;
	enum LVM_SETTILEVIEWINFO = LVM_FIRST + 162;
	enum LVM_GETTILEVIEWINFO = LVM_FIRST + 163;
	enum LVM_SETTILEINFO = LVM_FIRST + 164;
	enum LVM_GETTILEINFO = LVM_FIRST + 165;

	struct LVINSERTMARK {
		UINT cbSize;
		DWORD dwFlags;
		int iItem;
		DWORD dwReserved;
	}
	alias LVINSERTMARK* LPLVINSERTMARK;

	enum LVIM_AFTER = 0x00000001;
	enum LVM_SETINSERTMARK = LVM_FIRST + 166;
	enum LVM_GETINSERTMARK = LVM_FIRST + 167;
	enum LVM_INSERTMARKHITTEST = LVM_FIRST + 168;
	enum LVM_GETINSERTMARKRECT = LVM_FIRST + 169;
	enum LVM_SETINSERTMARKCOLOR = LVM_FIRST + 170;
	enum LVM_GETINSERTMARKCOLOR = LVM_FIRST + 171;


	struct LVSETINFOTIP {
		UINT cbSize;
		DWORD dwFlags;
		LPWSTR pszText;
		int iItem;
		int iSubItem;
	}
	alias LVSETINFOTIP* PLVSETINFOTIP;

	enum LVM_SETINFOTIP = LVM_FIRST + 173;
	enum LVM_GETSELECTEDCOLUMN = LVM_FIRST + 174;
	enum LVM_ISGROUPVIEWENABLED = LVM_FIRST + 175;
	enum LVM_GETOUTLINECOLOR = LVM_FIRST + 176;
	enum LVM_SETOUTLINECOLOR = LVM_FIRST + 177;
	enum LVM_CANCELEDITLABEL = LVM_FIRST + 179;
	enum LVM_MAPINDEXTOID = LVM_FIRST + 180;
	enum LVM_MAPIDTOINDEX = LVM_FIRST + 181;
	enum LVM_ISITEMVISIBLE = LVM_FIRST + 182;

	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		enum LVM_GETEMPTYTEXT = LVM_FIRST + 204;
		enum LVM_GETFOOTERRECT = LVM_FIRST + 205;
		enum LVFF_ITEMCOUNT = 0x00000001;

		struct LVFOOTERINFO {
			UINT mask;
			LPWSTR pszText;
			int cchTextMax;
			UINT cItems;
		}
		alias LVFOOTERINFO* LPLVFOOTERINFO;

		enum LVM_GETFOOTERINFO = LVM_FIRST + 206;
		enum LVM_GETFOOTERITEMRECT = LVM_FIRST + 207;
		enum {
			LVFIF_TEXT  = 0x00000001,
			LVFIF_STATE = 0x00000002,
		}
		enum LVFIS_FOCUSED = 0x0001;
		struct LVFOOTERITEM {
			UINT mask;
			int iItem;
			LPWSTR pszText;
			int cchTextMax;
			UINT state;
			UINT stateMask;
		}
		alias LVFOOTERITEM* LPLVFOOTERITEM;

		enum LVM_GETFOOTERITEM = LVM_FIRST + 208;

		struct LVITEMINDEX {
			int iItem;
			int iGroup;
		}
		alias LVITEMINDEX* PLVITEMINDEX;

		enum LVM_GETITEMINDEXRECT = LVM_FIRST + 209;
		enum LVM_SETITEMINDEXSTATE = LVM_FIRST + 210;
		enum LVM_GETNEXTITEMINDEX = LVM_FIRST + 211;


version(UNICODE){
	alias LVBKIMAGEW LVBKIMAGE;
	alias LPLVBKIMAGEW LPLVBKIMAGE;
	enum {
		LVM_SETBKIMAGE = LVM_SETBKIMAGEW,
		LVM_GETBKIMAGE = LVM_GETBKIMAGEW,
	}
}else{
	alias LVBKIMAGEA LVBKIMAGE;
	alias LPLVBKIMAGEA LPLVBKIMAGE;
	enum {
		LVM_SETBKIMAGE = LVM_SETBKIMAGEA,
		LVM_GETBKIMAGE = LVM_GETBKIMAGEA,
	}
}

struct NMLISTVIEW {
	NMHDR hdr;
	int iItem;
	int iSubItem;
	UINT uNewState;
	UINT uOldState;
	UINT uChanged;
	POINT ptAction;
	LPARAM lParam;
}
alias NMLISTVIEW* LPNMLISTVIEW;
//alias LPNMLISTVIEW LPNM_LISTVIEW;
//alias NMLISTVIEW NM_LISTVIEW;

struct NMITEMACTIVATE {
	NMHDR hdr;
	int iItem;
	int iSubItem;
	UINT uNewState;
	UINT uOldState;
	UINT uChanged;
	POINT ptAction;
	LPARAM lParam;
	UINT uKeyFlags;
}
alias NMITEMACTIVATE* LPNMITEMACTIVATE;
enum {
	LVKF_ALT     = 0x0001,
	LVKF_CONTROL = 0x0002,
	LVKF_SHIFT   = 0x0004,
}

struct NMLVCUSTOMDRAW {
	NMCUSTOMDRAW nmcd;
	COLORREF clrText;
	COLORREF clrTextBk;
	int iSubItem;
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		DWORD dwItemType;
		COLORREF clrFace;
		int iIconEffect;
		int iIconPhase;
		int iPartId;
		int iStateId;
		RECT rcText;
		UINT uAlign;
}
alias NMLVCUSTOMDRAW* LPNMLVCUSTOMDRAW;
enum NMLVCUSTOMDRAW_V3_SIZE = NMLVCUSTOMDRAW.clrTextBk.offsetof + NMLVCUSTOMDRAW.clrTextBk.sizeof;

enum {
	LVCDI_ITEM      = 0x00000000,
	LVCDI_GROUP     = 0x00000001,
	LVCDI_ITEMSLIST = 0x00000002,
}
enum {
	LVCDRF_NOSELECT     = 0x00010000,
	LVCDRF_NOGROUPFRAME = 0x00020000,
}
struct NMLVCACHEHINT {
	NMHDR hdr;
	int iFrom;
	int iTo;
}
alias NMLVCACHEHINT* LPNMLVCACHEHINT;

alias LPNMLVCACHEHINT LPNM_CACHEHINT;
alias LPNMLVCACHEHINT PNM_CACHEHINT;
alias NMLVCACHEHINT NM_CACHEHINT;

struct NMLVFINDITEMA {
	NMHDR hdr;
	int iStart;
	LVFINDINFOA lvfi;
}
alias NMLVFINDITEMA* LPNMLVFINDITEMA;

struct NMLVFINDITEMW {
	NMHDR hdr;
	int iStart;
	LVFINDINFOW lvfi;
}
alias NMLVFINDITEMW* LPNMLVFINDITEMW;

alias LPNMLVFINDITEMA PNM_FINDITEMA;
alias LPNMLVFINDITEMA LPNM_FINDITEMA;
alias NMLVFINDITEMA NM_FINDITEMA;

alias LPNMLVFINDITEMW PNM_FINDITEMW;
alias LPNMLVFINDITEMW LPNM_FINDITEMW;
alias NMLVFINDITEMW NM_FINDITEMW;

version(UNICODE){
	alias PNM_FINDITEMW PNM_FINDITEM;
	alias LPNM_FINDITEMW LPNM_FINDITEM;
	alias NM_FINDITEMW NM_FINDITEM;
	alias NMLVFINDITEMW NMLVFINDITEM;
	alias LPNMLVFINDITEMW LPNMLVFINDITEM;
}else{
	alias PNM_FINDITEMA PNM_FINDITEM;
	alias LPNM_FINDITEMA LPNM_FINDITEM;
	alias NM_FINDITEMA NM_FINDITEM;
	alias NMLVFINDITEMA NMLVFINDITEM;
	alias LPNMLVFINDITEMA LPNMLVFINDITEM;
}

struct NMLVODSTATECHANGE {
	NMHDR hdr;
	int iFrom;
	int iTo;
	UINT uNewState;
	UINT uOldState;
}
alias NMLVODSTATECHANGE* LPNMLVODSTATECHANGE;

alias LPNMLVODSTATECHANGE PNM_ODSTATECHANGE;
alias LPNMLVODSTATECHANGE LPNM_ODSTATECHANGE;
alias NMLVODSTATECHANGE NM_ODSTATECHANGE;

enum {
	LVN_ITEMCHANGING    = LVN_FIRST-0,
	LVN_ITEMCHANGED     = LVN_FIRST-1,
	LVN_INSERTITEM      = LVN_FIRST-2,
	LVN_DELETEITEM      = LVN_FIRST-3,
	LVN_DELETEALLITEMS  = LVN_FIRST-4,
	LVN_BEGINLABELEDITA = LVN_FIRST-5,
	LVN_BEGINLABELEDITW = LVN_FIRST-75,
	LVN_ENDLABELEDITA   = LVN_FIRST-6,
	LVN_ENDLABELEDITW   = LVN_FIRST-76,
	LVN_COLUMNCLICK     = LVN_FIRST-8,
	LVN_BEGINDRAG       = LVN_FIRST-9,
	LVN_BEGINRDRAG      = LVN_FIRST-11,
	LVN_ODCACHEHINT     = LVN_FIRST-13,
	LVN_ODFINDITEMA     = LVN_FIRST-52,
	LVN_ODFINDITEMW     = LVN_FIRST-79,
	LVN_ITEMACTIVATE    = LVN_FIRST-14,
	LVN_ODSTATECHANGED  = LVN_FIRST-15,
}
version(UNICODE)
	enum LVN_ODFINDITEM = LVN_ODFINDITEMW;
else
	enum LVN_ODFINDITEM = LVN_ODFINDITEMA;

enum LVN_HOTTRACK = LVN_FIRST - 21;
enum {
	LVN_GETDISPINFOA = LVN_FIRST-50,
	LVN_GETDISPINFOW = LVN_FIRST-77,
	LVN_SETDISPINFOA = LVN_FIRST-51,
	LVN_SETDISPINFOW = LVN_FIRST-78,
}
version(UNICODE){
	enum {
		LVN_BEGINLABELEDIT = LVN_BEGINLABELEDITW,
		LVN_ENDLABELEDIT   = LVN_ENDLABELEDITW,
		LVN_GETDISPINFO    = LVN_GETDISPINFOW,
		LVN_SETDISPINFO    = LVN_SETDISPINFOW,
	}
}else{
	enum {
		LVN_BEGINLABELEDIT = LVN_BEGINLABELEDITA,
		LVN_ENDLABELEDIT   = LVN_ENDLABELEDITA,
		LVN_GETDISPINFO    = LVN_GETDISPINFOA,
		LVN_SETDISPINFO    = LVN_SETDISPINFOA,
	}
}

enum LVIF_DI_SETITEM = 0x1000;


struct NMLVDISPINFOA {
	NMHDR hdr;
	LVITEMA item;
}
alias NMLVDISPINFOA* LPNMLVDISPINFOA;

struct NMLVDISPINFOW {
	NMHDR hdr;
	LVITEMW item;
}
alias NMLVDISPINFOW* LPNMLVDISPINFOW;

version(UNICODE)
	alias NMLVDISPINFOW NMLVDISPINFO;
else
	alias NMLVDISPINFOA NMLVDISPINFO;
//alias NMLVDISPINFOA LV_DISPINFOA;
//alias NMLVDISPINFOW LV_DISPINFOW;
//alias NMLVDISPINFO LV_DISPINFO;

enum LVN_KEYDOWN = LVN_FIRST - 55;

align(1)
struct NMLVKEYDOWN {
	NMHDR hdr;
	WORD wVKey;
	UINT flags;
}
alias NMLVKEYDOWN* LPNMLVKEYDOWN;
//alias NMLVKEYDOWN LV_KEYDOWN;

enum LVN_MARQUEEBEGIN = LVN_FIRST - 56;

//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
struct NMLVLINK {
	NMHDR hdr;
	LITEM link;
	int iItem;
	int iSubItem;
}
alias NMLVLINK* PNMLVLINK;

struct NMLVGETINFOTIPA {
	NMHDR hdr;
	DWORD dwFlags;
	LPSTR pszText;
	int cchTextMax;
	int iItem;
	int iSubItem;
	LPARAM lParam;
}
alias NMLVGETINFOTIPA* LPNMLVGETINFOTIPA;

struct NMLVGETINFOTIPW {
	NMHDR hdr;
	DWORD dwFlags;
	LPWSTR pszText;
	int cchTextMax;
	int iItem;
	int iSubItem;
	LPARAM lParam;
}
alias NMLVGETINFOTIPW* LPNMLVGETINFOTIPW;

enum LVGIT_UNFOLDED = 0x0001;
enum {
	LVN_GETINFOTIPA = LVN_FIRST-57,
	LVN_GETINFOTIPW = LVN_FIRST-58,
}
version(UNICODE){
	enum LVN_GETINFOTIP = LVN_GETINFOTIPW ;
	alias NMLVGETINFOTIPW NMLVGETINFOTIP;
	alias LPNMLVGETINFOTIPW LPNMLVGETINFOTIP;
}else{
	enum LVN_GETINFOTIP = LVN_GETINFOTIPA;
	alias NMLVGETINFOTIPA NMLVGETINFOTIP;
	alias LPNMLVGETINFOTIPA LPNMLVGETINFOTIP;
}

enum {
	LVNSCH_DEFAULT = -1,
	LVNSCH_ERROR   = -2,
	LVNSCH_IGNORE  = -3,
}
enum {
	LVN_INCREMENTALSEARCHA = LVN_FIRST-62,
	LVN_INCREMENTALSEARCHW = LVN_FIRST-63,
}
version(UNICODE)
	enum LVN_INCREMENTALSEARCH = LVN_INCREMENTALSEARCHW;
else
	enum LVN_INCREMENTALSEARCH = LVN_INCREMENTALSEARCHA;


//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	enum {
		LVN_COLUMNDROPDOWN      = LVN_FIRST-64,
		LVN_COLUMNOVERFLOWCLICK = LVN_FIRST-66,
	}

//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	struct NMLVSCROLL {
		NMHDR hdr;
		int dx;
		int dy;
	}
	alias NMLVSCROLL* LPNMLVSCROLL;
	enum {
		LVN_BEGINSCROLL = LVN_FIRST-80,
		LVN_ENDSCROLL   = LVN_FIRST-81,
	}

//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	enum LVN_LINKCLICK = LVN_FIRST - 84;

	enum EMF_CENTERED = 0x00000001;

	struct NMLVEMPTYMARKUP {
		NMHDR hdr;
		DWORD dwFlags;
		WCHAR[L_MAX_URL_LENGTH] szMarkup;
	}
	enum LVN_GETEMPTYMARKUP = LVN_FIRST - 87;


version(HelperFunctions){
	COLORREF ListView_GetBkColor(HWND hwnd)
	{
		return cast(COLORREF)SendMessage(hwnd, LVM_GETBKCOLOR, 0, 0);
	}

	BOOL ListView_SetBkColor(HWND hwnd, COLORREF clrBk)
	{
		return cast(BOOL)SendMessage(hwnd, LVM_SETBKCOLOR, 0, cast(LPARAM)clrBk);
	}

	HIMAGELIST ListView_GetImageList(HWND hwnd, int iImageList)
	{
		return cast(HIMAGELIST)SendMessage(hwnd, LVM_GETIMAGELIST, cast(WPARAM)iImageList, 0);
	}

	HIMAGELIST ListView_SetImageList(HWND hwnd, HIMAGELIST himl, int iImageList)
	{
		return cast(HIMAGELIST)SendMessage(hwnd, LVM_SETIMAGELIST, cast(WPARAM)iImageList, cast(LPARAM)himl);
	}

	int ListView_GetItemCount(HWND hwnd)
	{
		return cast(int)SendMessage(hwnd, LVM_GETITEMCOUNT, 0, 0);
	}

	BOOL ListView_GetItem(HWND hwnd, LVITEM* pitem)
	{
		return cast(BOOL)SendMessage(hwnd, LVM_GETITEM, 0, cast(LPARAM)pitem);
	}

	BOOL ListView_SetItem(HWND hwnd, const(LVITEM)* pitem)
	{
		return cast(BOOL)SendMessage(hwnd, LVM_SETITEM, 0, cast(LPARAM)pitem);
	}

	int ListView_InsertItem(HWND hwnd, const(LVITEM)* pitem)
	{
		return cast(int)SendMessage(hwnd, LVM_INSERTITEM, 0, cast(LPARAM)pitem);
	}

	BOOL ListView_DeleteItem(HWND hwnd, int i)
	{
		return cast(BOOL)SendMessage(hwnd, LVM_DELETEITEM, cast(WPARAM)i, 0);
	}

	BOOL ListView_DeleteAllItems(HWND hwnd)
	{
		return cast(BOOL)SendMessage(hwnd, LVM_DELETEALLITEMS, 0, 0);
	}

	BOOL ListView_GetCallbackMask(HWND hwnd)
	{
		return cast(BOOL)SendMessage(hwnd, LVM_GETCALLBACKMASK, 0, 0);
	}

	BOOL ListView_SetCallbackMask(HWND hwnd, UINT mask)
	{
		return cast(BOOL)SendMessage(hwnd, LVM_SETCALLBACKMASK, cast(WPARAM)mask, 0);
	}

	int ListView_GetNextItem(HWND hwnd, int i, UINT flags)
	{
		return cast(int)SendMessage(hwnd, LVM_GETNEXTITEM, cast(WPARAM)i, MAKELPARAM(cast(WORD)flags, 0));
	}

	int ListView_FindItem(HWND hwnd, int iStart, const(LVFINDINFO)* plvfi)
	{
		return cast(int)SendMessage(hwnd, LVM_FINDITEM, cast(WPARAM)iStart, cast(LPARAM)plvfi);
	}

	BOOL ListView_GetItemRect(HWND hwnd, int i, RECT* prc, int code)
	{
		return cast(BOOL)SendMessage(hwnd, LVM_GETITEMRECT, cast(WPARAM)i,
			prc ? prc.left = code, cast(LPARAM)prc : cast(LPARAM)null);
	}

	BOOL ListView_SetItemPosition(HWND hwndLV, int i, int x, int y)
	{
		return cast(BOOL)SendMessage(hwndLV, LVM_SETITEMPOSITION, cast(WPARAM)i, MAKELPARAM(cast(WORD)x, cast(WORD)y));
	}

	BOOL ListView_GetItemPosition(HWND hwndLV, int i, POINT* ppt)
	{
		return cast(BOOL)SendMessage(hwndLV, LVM_GETITEMPOSITION, cast(WPARAM)i, cast(LPARAM)ppt);
	}

	int ListView_GetStringWidth(HWND hwndLV, LPCTSTR psz)
	{
		return cast(int)SendMessage(hwndLV, LVM_GETSTRINGWIDTH, 0, cast(LPARAM)psz);
	}

	int ListView_HitTest(HWND hwndLV, LVHITTESTINFO* pinfo)
	{
		return cast(int)SendMessage(hwndLV, LVM_HITTEST, 0, cast(LPARAM)pinfo);
	}

	int ListView_HitTestEx(HWND hwndLV, LVHITTESTINFO* pinfo)
	{
		return cast(int)SendMessage(hwndLV, LVM_HITTEST, cast(WPARAM)-1, cast(LPARAM)pinfo);
	}

	BOOL ListView_EnsureVisible(HWND hwndLV, int i, BOOL fPartialOK)
	{
		return cast(BOOL)SendMessage(hwndLV, LVM_ENSUREVISIBLE, cast(WPARAM)i, MAKELPARAM(cast(WORD)fPartialOK, 0));
	}

	BOOL ListView_Scroll(HWND hwndLV, int dx, int dy)
	{
		return cast(BOOL)SendMessage(hwndLV, LVM_SCROLL, cast(WPARAM)dx, cast(LPARAM)dy);
	}

	BOOL ListView_RedrawItems(HWND hwndLV, int iFirst, int iLast)
	{
		return cast(BOOL)SendMessage(hwndLV, LVM_REDRAWITEMS, cast(WPARAM)iFirst, cast(LPARAM)iLast);
	}

	BOOL ListView_Arrange(HWND hwndLV, UINT code)
	{
		return cast(BOOL)SendMessage(hwndLV, LVM_ARRANGE, cast(WPARAM)code, 0);
	}

	HWND ListView_EditLabel(HWND hwndLV, int i)
	{
		return cast(HWND)SendMessage(hwndLV, LVM_EDITLABEL, cast(WPARAM)i, 0);
	}

	HWND ListView_GetEditControl(HWND hwndLV)
	{
		return cast(HWND)SendMessage(hwndLV, LVM_GETEDITCONTROL, 0, 0);
	}

	BOOL ListView_GetColumn(HWND hwnd, int iCol, LVCOLUMN* pcol)
	{
		return cast(BOOL)SendMessage(hwnd, LVM_GETCOLUMN, cast(WPARAM)iCol, cast(LPARAM)pcol);
	}

	BOOL ListView_SetColumn(HWND hwnd, int iCol, const(LVCOLUMN)* pcol)
	{
		return cast(BOOL)SendMessage(hwnd, LVM_SETCOLUMN, cast(WPARAM)iCol, cast(LPARAM)pcol);
	}

	int ListView_InsertColumn(HWND hwnd, int iCol, const(LVCOLUMN)* pcol)
	{
		return cast(int)SendMessage(hwnd, LVM_INSERTCOLUMN, cast(WPARAM)iCol, cast(LPARAM)pcol);
	}

	BOOL ListView_DeleteColumn(HWND hwnd, int iCol)
	{
		return cast(BOOL)SendMessage(hwnd, LVM_DELETECOLUMN, cast(WPARAM)iCol, 0);
	}

	int ListView_GetColumnWidth(HWND hwnd, int iCol)
	{
		return cast(int)SendMessage(hwnd, LVM_GETCOLUMNWIDTH, cast(WPARAM)iCol, 0);
	}

	BOOL ListView_SetColumnWidth(HWND hwnd, int iCol, int cx)
	{
		return cast(BOOL)SendMessage(hwnd, LVM_SETCOLUMNWIDTH, cast(WPARAM)iCol, MAKELPARAM(cast(WORD)cx, 0));
	}

	HIMAGELIST ListView_CreateDragImage(HWND hwnd, int i, LPPOINT lpptUpLeft)
	{
		return cast(HIMAGELIST)SendMessage(hwnd, LVM_CREATEDRAGIMAGE, cast(WPARAM)i, cast(LPARAM)lpptUpLeft);
	}

	BOOL ListView_GetViewRect(HWND hwnd, RECT* prc)
	{
		return cast(BOOL)SendMessage(hwnd, LVM_GETVIEWRECT, 0, cast(LPARAM)prc);
	}

	COLORREF ListView_GetTextColor(HWND hwnd)
	{
		return cast(COLORREF)SendMessage(hwnd, LVM_GETTEXTCOLOR, 0, 0);
	}

	BOOL ListView_SetTextColor(HWND hwnd, COLORREF clrText)
	{
		return cast(BOOL)SendMessage(hwnd, LVM_SETTEXTCOLOR, 0, cast(LPARAM)clrText);
	}

	COLORREF ListView_GetTextBkColorhwnd(HWND hwnd)
	{
		return cast(COLORREF)SendMessage(hwnd, LVM_GETTEXTBKCOLOR, 0, 0);
	}

	BOOL ListView_SetTextBkColor(HWND hwnd, COLORREF clrTextBk)
	{
		return cast(BOOL)SendMessage(hwnd, LVM_SETTEXTBKCOLOR, 0, cast(LPARAM)clrTextBk);
	}

	int ListView_GetTopIndex(HWND hwndLV)
	{
		return cast(int)SendMessage(hwndLV, LVM_GETTOPINDEX, 0, 0);
	}

	int ListView_GetCountPerPage(HWND hwndLV)
	{
		return cast(int)SendMessage(hwndLV, LVM_GETCOUNTPERPAGE, 0, 0);
	}

	BOOL ListView_GetOrigin(HWND hwndLV, LPPOINT ppt)
	{
		return cast(BOOL)SendMessage(hwndLV, LVM_GETORIGIN, 0, cast(LPARAM)ppt);
	}

	BOOL ListView_Update(HWND hwndLV, int i)
	{
		return cast(BOOL)SendMessage(hwndLV, LVM_UPDATE, cast(WPARAM)i, 0);
	}

	void ListView_SetItemState(HWND hwndLV, int i, UINT data, UINT mask)
	{
		LVITEM _macro_lvi;

		_macro_lvi.stateMask = mask;
		_macro_lvi.state = data;
		SendMessage(hwndLV, LVM_SETITEMSTATE, cast(WPARAM)i, cast(LPARAM)&_macro_lvi);
	}

	UINT ListView_GetItemState(HWND hwndLV, int i, UINT mask)
	{
		return cast(UINT)SendMessage(hwndLV, LVM_GETITEMSTATE, cast(WPARAM)i, cast(LPARAM)mask);
	}

	void ListView_GetItemText(HWND hwndLV, int i, int iSubItem_, LPTSTR pszText_, int cchTextMax_)
	{
		LVITEM _macro_lvi;

		_macro_lvi.iSubItem = iSubItem_;
		_macro_lvi.cchTextMax = cchTextMax_;
		_macro_lvi.pszText = pszText_;
		 SendMessage(hwndLV, LVM_GETITEMTEXT, cast(WPARAM)i, cast(LPARAM)&_macro_lvi);
	}

	void ListView_SetItemText(HWND hwndLV, int i, int iSubItem_, LPCTSTR pszText_)
	{
		LVITEM _macro_lvi;

		_macro_lvi.iSubItem = iSubItem_;
		_macro_lvi.pszText = cast(TCHAR*)pszText_;
		SendMessage(hwndLV, LVM_SETITEMTEXT, cast(WPARAM)i, cast(LPARAM)&_macro_lvi);
	}

	void ListView_SetItemCount(HWND hwndLV, int cItems)
	{
		SendMessage(hwndLV, LVM_SETITEMCOUNT, cast(WPARAM)cItems, 0);
	}

	BOOL ListView_SortItems(HWND hwndLV, PFNLVCOMPARE  _pfnCompare, LPARAM _lPrm)
	{
		return cast(BOOL)SendMessage(hwndLV, LVM_SORTITEMS, cast(WPARAM)_lPrm, cast(LPARAM)_pfnCompare);
	}

	void ListView_SetItemPosition32(HWND hwndLV, int i, int x0, int y0)
	{
		POINT ptNewPos;

		ptNewPos.x = x0;
		ptNewPos.y = y0;
		SendMessage(hwndLV, LVM_SETITEMPOSITION32, cast(WPARAM)i, cast(LPARAM)&ptNewPos);
	}

	UINT ListView_GetSelectedCount(HWND hwndLV)
	{
		return cast(UINT)SendMessage(hwndLV, LVM_GETSELECTEDCOUNT, 0, 0);
	}

	DWORD ListView_GetItemSpacing(HWND hwndLV, BOOL fSmall)
	{
		return cast(DWORD)SendMessage(hwndLV, LVM_GETITEMSPACING, fSmall, 0);
	}

	BOOL ListView_GetISearchString(HWND hwndLV, LPTSTR lpsz)
	{
		return cast(BOOL)SendMessage(hwndLV, LVM_GETISEARCHSTRING, 0, cast(LPARAM)lpsz);
	}


	HWND ListView_GetHeader(HWND hwnd)
	{
		return cast(HWND)SendMessage(hwnd, LVM_GETHEADER, 0, 0);
	}

	void ListView_SetCheckState(HWND hwndLV, UINT i, BOOL fCheck)
	{
		ListView_SetItemState(hwndLV, i, INDEXTOSTATEIMAGEMASK(fCheck ? 2 : 1), LVIS_STATEIMAGEMASK);
	}

	BOOL ListView_GetCheckState(HWND hwndLV, UINT i)
	{
		 return cast(BOOL)(((cast(UINT)(SendMessage(hwndLV, LVM_GETITEMSTATE, cast(WPARAM)i, LVIS_STATEIMAGEMASK))) >> 12) -1);
	}

	void ListView_SetItemCountEx(HWND hwndLV, int cItems, DWORD dwFlags)
	{
		SendMessage(hwndLV, LVM_SETITEMCOUNT, cast(WPARAM)cItems, cast(LPARAM)dwFlags);
	}

	DWORD ListView_SetIconSpacing(HWND hwndLV, int cx, int cy)
	{
		return cast(DWORD)SendMessage(hwndLV, LVM_SETICONSPACING, 0, MAKELONG(cx, cy));
	}

	DWORD ListView_SetExtendedListViewStyle(HWND hwndLV, DWORD dw)
	{
		return cast(DWORD)SendMessage(hwndLV, LVM_SETEXTENDEDLISTVIEWSTYLE, 0, dw);
	}

	DWORD ListView_GetExtendedListViewStyle(HWND hwndLV)
	{
		return cast(DWORD)SendMessage(hwndLV, LVM_GETEXTENDEDLISTVIEWSTYLE, 0, 0);
	}

	BOOL ListView_GetSubItemRect(HWND hwnd, int iItem, int iSubItem, int code, LPRECT prc)
	{
		return cast(BOOL)SendMessage(hwnd, LVM_GETSUBITEMRECT, cast(WPARAM)iItem,
			prc ? prc.top = iSubItem, prc.left = code, cast(LPARAM)prc : cast(LPARAM)null);
	}

	int ListView_SubItemHitTest(HWND hwnd, LPLVHITTESTINFO plvhti)
	{
		return cast(int)SendMessage(hwnd, LVM_SUBITEMHITTEST, 0, cast(LPARAM)plvhti);
	}

	int ListView_SubItemHitTestEx(HWND hwnd, LPLVHITTESTINFO plvhti)
	{
		return cast (int)SendMessage(hwnd, LVM_SUBITEMHITTEST, cast(WPARAM)-1, cast(LPARAM)plvhti);
	}

	BOOL ListView_SetColumnOrderArray(HWND hwnd, int iCount, int* pi)
	{
		return cast(BOOL)SendMessage(hwnd, LVM_SETCOLUMNORDERARRAY, cast(WPARAM)iCount, cast(LPARAM)pi);
	}

	BOOL ListView_GetColumnOrderArray(HWND hwnd, int iCount, int* pi)
	{
		return cast(BOOL)SendMessage(hwnd, LVM_GETCOLUMNORDERARRAY, cast(WPARAM)iCount, cast(LPARAM)pi);
	}

	int ListView_SetHotItem(HWND hwnd, int i)
	{
		return cast(int)SendMessage(hwnd, LVM_SETHOTITEM, cast(WPARAM)i, 0);
	}

	int ListView_GetHotItem(HWND hwnd)
	{
		return cast(int)SendMessage(hwnd, LVM_GETHOTITEM, 0, 0);
	}

	HCURSOR ListView_SetHotCursor(HWND hwnd, HCURSOR hcur)
	{
		return cast(HCURSOR)SendMessage(hwnd, LVM_SETHOTCURSOR, 0, cast(LPARAM)hcur);
	}

	HCURSOR ListView_GetHotCursor(HWND hwnd)
	{
		return cast(HCURSOR)SendMessage(hwnd, LVM_GETHOTCURSOR, 0, 0);
	}

	DWORD ListView_ApproximateViewRect(HWND hwnd, int iWidth, int iHeight, int iCount)
	{
		return cast(DWORD)SendMessage(hwnd, LVM_APPROXIMATEVIEWRECT, cast(WPARAM)iCount, MAKELPARAM(cast(WORD)iWidth, cast(WORD)iHeight));
	}

	DWORD ListView_SetExtendedListViewStyleEx(HWND hwndLV, DWORD dwMask, DWORD dw)
	{
		return cast(DWORD)SendMessage((hwndLV), LVM_SETEXTENDEDLISTVIEWSTYLE, dwMask, dw);
	}

	BOOL ListView_SetWorkAreas(HWND hwnd, int nWorkAreas, RECT* prc)
	{
		return cast(BOOL)SendMessage(hwnd, LVM_SETWORKAREAS, cast(WPARAM)nWorkAreas, cast(LPARAM)prc);
	}

	BOOL ListView_GetWorkAreas(HWND hwnd, int nWorkAreas, RECT* prc)
	{
		return cast(BOOL)SendMessage(hwnd, LVM_GETWORKAREAS, cast(WPARAM)nWorkAreas, cast(LPARAM)prc);
	}

	BOOL ListView_GetNumberOfWorkAreas(HWND hwnd, uint* pnWorkAreas)
	{
		return cast(BOOL)SendMessage(hwnd, LVM_GETNUMBEROFWORKAREAS, 0, cast(LPARAM)pnWorkAreas);
	}

	int ListView_GetSelectionMark(HWND hwnd)
	{
		return cast(int)SendMessage(hwnd, LVM_GETSELECTIONMARK, 0, 0);
	}

	int ListView_SetSelectionMark(HWND hwnd, int i)
	{
		return cast(int)SendMessage(hwnd, LVM_SETSELECTIONMARK, 0, cast(LPARAM)i);
	}

	DWORD ListView_SetHoverTime(HWND hwndLV, DWORD dwHoverTimeMs)
	{
		return cast(DWORD)SendMessage(hwndLV, LVM_SETHOVERTIME, 0, cast(LPARAM)dwHoverTimeMs);
	}

	DWORD ListView_GetHoverTime(HWND hwndLV)
	{
		return cast(DWORD)SendMessage(hwndLV, LVM_GETHOVERTIME, 0, 0);
	}

	HWND ListView_SetToolTips(HWND hwndLV, HWND hwndNewHwnd)
	{
		return cast(HWND)SendMessage(hwndLV, LVM_SETTOOLTIPS, cast(WPARAM)hwndNewHwnd, 0);
	}

	HWND ListView_GetToolTips(HWND hwndLV)
	{
		return cast(HWND)SendMessage(hwndLV, LVM_GETTOOLTIPS, 0, 0);
	}

	BOOL ListView_SortItemsEx(HWND hwndLV, PFNLVCOMPARE _pfnCompare, LPARAM _lPrm)
	{
		return cast(BOOL)SendMessage(hwndLV, LVM_SORTITEMSEX, cast(WPARAM)_lPrm, cast(LPARAM)_pfnCompare);
	}

	BOOL ListView_SetBkImage(HWND hwnd, LPLVBKIMAGE plvbki)
	{
		return cast(BOOL)SendMessage(hwnd, LVM_SETBKIMAGE, 0, cast(LPARAM)plvbki);
	}

	BOOL ListView_GetBkImage(HWND hwnd, LPLVBKIMAGE plvbki)
	{
		return cast(BOOL)SendMessage(hwnd, LVM_GETBKIMAGE, 0, cast(LPARAM)plvbki);
	}

	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		void ListView_SetSelectedColumn(HWND hwnd, int iCol)
		{
			SendMessage(hwnd, LVM_SETSELECTEDCOLUMN, cast(WPARAM)iCol, 0);
		}

		DWORD ListView_SetView(HWND hwnd, DWORD iView)
		{
			return cast(DWORD)SendMessage(hwnd, LVM_SETVIEW, cast(WPARAM)iView, 0);
		}

		DWORD ListView_GetView(HWND hwnd)
		{
			return cast(DWORD)SendMessage(hwnd, LVM_GETVIEW, 0, 0);
		}

		int ListView_InsertGroup(HWND hwnd, int index, PLVGROUP pgrp)
		{
			return cast(int)SendMessage(hwnd, LVM_INSERTGROUP, cast(WPARAM)index, cast(LPARAM)pgrp);
		}

		int ListView_SetGroupInfo(HWND hwnd, int iGroupId, PLVGROUP pgrp)
		{
			return cast(int)SendMessage(hwnd, LVM_SETGROUPINFO, cast(WPARAM)iGroupId, cast(LPARAM)pgrp);
		}

		int ListView_GetGroupInfo(HWND hwnd, int iGroupId, PLVGROUP pgrp)
		{
			return cast(int)SendMessage(hwnd, LVM_GETGROUPINFO, cast(WPARAM)iGroupId, cast(LPARAM)pgrp);
		}

		int ListView_RemoveGroup(HWND hwnd, int iGroupId)
		{
			return cast(int)SendMessage(hwnd, LVM_REMOVEGROUP, cast(WPARAM)iGroupId, 0);
		}

		int ListView_MoveGroup(HWND hwnd, int iGroupId, int toIndex)
		{
			return cast(int)SendMessage(hwnd, LVM_MOVEGROUP, cast(WPARAM)iGroupId, cast(LPARAM)toIndex);
		}

		int ListView_GetGroupCount(HWND hwnd)
		{
			return cast(int)SendMessage(hwnd, LVM_GETGROUPCOUNT, 0, 0);
		}

		LRESULT ListView_GetGroupInfoByIndex(HWND hwnd, int iIndex, PLVGROUP pgrp)
		{
			return SendMessage(hwnd, LVM_GETGROUPINFOBYINDEX, cast(WPARAM)iIndex, cast(LPARAM)pgrp);
		}

		LRESULT ListView_MoveItemToGroup(HWND hwnd, int idItemFrom, int idGroupTo)
		{
			return SendMessage(hwnd, LVM_MOVEITEMTOGROUP, cast(WPARAM)idItemFrom, cast(LPARAM)idGroupTo);
		}

		BOOL ListView_GetGroupRect(HWND hwnd, int iGroupId, LONG type, RECT* prc)
		{
			return cast(BOOL)SendMessage(hwnd, LVM_GETGROUPRECT, cast(WPARAM)iGroupId,
				prc ? prc.top = type, cast(LPARAM)prc : cast(LPARAM)null);
		}

		void ListView_SetGroupMetrics(HWND hwnd, PLVGROUPMETRICS pGroupMetrics)
		{
			SendMessage(hwnd, LVM_SETGROUPMETRICS, 0, cast(LPARAM)pGroupMetrics);
		}

		void ListView_GetGroupMetrics(HWND hwnd, PLVGROUPMETRICS pGroupMetrics)
		{
			SendMessage(hwnd, LVM_GETGROUPMETRICS, 0, cast(LPARAM)pGroupMetrics);
		}

		int ListView_EnableGroupView(HWND hwnd, BOOL fEnable)
		{
			return cast(int)SendMessage(hwnd, LVM_ENABLEGROUPVIEW, cast(WPARAM)fEnable, 0);
		}

		int ListView_SortGroups(HWND hwnd, PFNLVGROUPCOMPARE _pfnGroupCompate, void* _plv)
		{
			return cast(int)SendMessage(hwnd, LVM_SORTGROUPS, cast(WPARAM)_pfnGroupCompate, cast(LPARAM)_plv);
		}

		void ListView_InsertGroupSorted(HWND hwnd, PLVINSERTGROUPSORTED structInsert)
		{
			SendMessage(hwnd, LVM_INSERTGROUPSORTED, cast(WPARAM)structInsert, 0);
		}

		void ListView_RemoveAllGroups(HWND hwnd)
		{
			SendMessage(hwnd, LVM_REMOVEALLGROUPS, 0, 0);
		}

		BOOL ListView_HasGroup(HWND hwnd, int dwGroupId)
		{
			return cast(BOOL)SendMessage(hwnd, LVM_HASGROUP, dwGroupId, 0);
		}

		LRESULT ListView_SetGroupState(HWND hwnd, UINT dwGroupId, UINT dwMask, UINT dwState)
		{
			LVGROUP _macro_lvg;

			 _macro_lvg.cbSize = _macro_lvg.sizeof;
			 _macro_lvg.mask = LVGF_STATE;
			 _macro_lvg.stateMask = dwMask;
			 _macro_lvg.state = dwState;
			 return SendMessage(hwnd, LVM_SETGROUPINFO, cast(WPARAM)dwGroupId, cast(LPARAM)&_macro_lvg);
		}

		UINT ListView_GetGroupState(HWND hwnd, UINT dwGroupId, UINT dwMask)
		{
			return cast(UINT)SendMessage(hwnd, LVM_GETGROUPSTATE, cast(WPARAM)dwGroupId, cast(LPARAM)dwMask);
		}

		INT ListView_GetFocusedGroup(HWND hwnd)
		{
			return cast(INT)SendMessage(hwnd, LVM_GETFOCUSEDGROUP, 0, 0);
		}

		BOOL ListView_SetTileViewInfo(HWND hwnd, PLVTILEVIEWINFO ptvi)
		{
			return cast(BOOL)SendMessage(hwnd, LVM_SETTILEVIEWINFO, 0, cast(LPARAM)ptvi);
		}

		void ListView_GetTileViewInfo(HWND hwnd, PLVTILEVIEWINFO ptvi)
		{
			SendMessage(hwnd, LVM_GETTILEVIEWINFO, 0, cast(LPARAM)ptvi);
		}

		BOOL ListView_SetTileInfo(HWND hwnd, PLVTILEINFO pti)
		{
			return cast(BOOL)SendMessage(hwnd, LVM_SETTILEINFO, 0, cast(LPARAM)pti);
		}

		void ListView_GetTileInfo(HWND hwnd, PLVTILEINFO pti)
		{
			SendMessage(hwnd, LVM_GETTILEINFO, 0, cast(LPARAM)pti);
		}

		BOOL ListView_SetInsertMark(HWND hwnd, LVINSERTMARK* lvim)
		{
			return cast(BOOL)SendMessage(hwnd, LVM_SETINSERTMARK, 0, cast(LPARAM)lvim);
		}

		BOOL ListView_GetInsertMark(HWND hwnd, LVINSERTMARK* lvim)
		{
			return cast(BOOL)SendMessage(hwnd, LVM_GETINSERTMARK, 0, cast(LPARAM)lvim);
		}

		BOOL ListView_InsertMarkHitTest(HWND hwnd, LPPOINT point, LVINSERTMARK* lvim)
		{
			return cast(int)SendMessage(hwnd, LVM_INSERTMARKHITTEST, cast(WPARAM)point, cast(LPARAM)lvim);
		}

		int ListView_GetInsertMarkRect(HWND hwnd, LPRECT rc)
		{
			return cast(int)SendMessage(hwnd, LVM_GETINSERTMARKRECT, 0, cast(LPARAM)rc);
		}

		COLORREF ListView_SetInsertMarkColor(HWND hwnd, COLORREF color)
		{
			return cast(COLORREF)SendMessage(hwnd, LVM_SETINSERTMARKCOLOR, 0, cast(LPARAM)color);
		}

		COLORREF ListView_GetInsertMarkColor(HWND hwnd)
		{
			return cast(COLORREF)SendMessage(hwnd, LVM_GETINSERTMARKCOLOR, 0, 0);
		}

		BOOL ListView_SetInfoTip(HWND hwndLV, PLVSETINFOTIP plvInfoTip)
		{
			return cast(BOOL)SendMessage(hwndLV, LVM_SETINFOTIP, 0, cast(LPARAM)plvInfoTip);
		}

		UINT ListView_GetSelectedColumn(HWND hwnd)
		{
			return cast(UINT)SendMessage(hwnd, LVM_GETSELECTEDCOLUMN, 0, 0);
		}

		BOOL ListView_IsGroupViewEnabled(HWND hwnd)
		{
			return cast(BOOL)SendMessage(hwnd, LVM_ISGROUPVIEWENABLED, 0, 0);
		}

		COLORREF ListView_GetOutlineColor(HWND hwnd)
		{
			return cast(COLORREF)SendMessage(hwnd, LVM_GETOUTLINECOLOR, 0, 0);
		}

		COLORREF ListView_SetOutlineColor(HWND hwnd, COLORREF color)
		{
			return cast(COLORREF)SendMessage(hwnd, LVM_SETOUTLINECOLOR, 0, cast(LPARAM)color);
		}

		void ListView_CancelEditLabel(HWND hwnd)
		{
			SendMessage(hwnd, LVM_CANCELEDITLABEL, 0, 0);
		}

		UINT ListView_MapIndexToID(HWND hwnd, UINT index)
		{
			return cast(UINT)SendMessage(hwnd, LVM_MAPINDEXTOID, cast(WPARAM)index, 0);
		}

		UINT ListView_MapIDToIndex(HWND hwnd, UINT id)
		{
			return cast(UINT)SendMessage(hwnd, LVM_MAPIDTOINDEX, cast(WPARAM)id, 0);
		}

		UINT ListView_IsItemVisible(HWND hwnd, uint index)
		{
			return cast(UINT)SendMessage(hwnd, LVM_ISITEMVISIBLE, cast(WPARAM)index, 0);
		}

	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		HIMAGELIST ListView_SetGroupHeaderImageList(HWND hwnd, HIMAGELIST himl)
		{
			return cast(HIMAGELIST)SendMessage(hwnd, LVM_SETIMAGELIST, cast(WPARAM)LVSIL_GROUPHEADER, cast(LPARAM)himl);
		}

		HIMAGELIST ListView_GetGroupHeaderImageList(HWND hwnd)
		{
			return cast(HIMAGELIST)SendMessage(hwnd, LVM_GETIMAGELIST, cast(WPARAM)LVSIL_GROUPHEADER, 0);
		}

		BOOL ListView_GetEmptyText(HWND hwnd, LPWSTR pszText, UINT cchText)
		{
			return cast(BOOL)SendMessage(hwnd, LVM_GETEMPTYTEXT, cast(WPARAM)cchText, cast(LPARAM)pszText);
		}

		BOOL ListView_GetFooterRect(HWND hwnd, RECT* prc)
		{
			return cast(BOOL)SendMessage(hwnd, LVM_GETFOOTERRECT, 0, cast(LPARAM)prc);
		}

		BOOL ListView_GetFooterInfo(HWND hwnd, LPLVFOOTERINFO plvfi)
		{
			return cast(BOOL)SendMessage(hwnd, LVM_GETFOOTERINFO, 0, cast(LPARAM)plvfi);
		}

		BOOL ListView_GetFooterItemRect(HWND hwnd, UINT iItem, RECT* prc)
		{
			return cast(BOOL)SendMessage(hwnd, LVM_GETFOOTERITEMRECT, cast(WPARAM)iItem, cast(LPARAM)prc);
		}

		BOOL ListView_GetFooterItem(HWND hwnd, UINT iItem, LVFOOTERITEM* pfi)
		{
			return cast(BOOL)SendMessage(hwnd, LVM_GETFOOTERITEM, cast(WPARAM)iItem, cast(LPARAM)pfi);
		}

		BOOL ListView_GetItemIndexRect(HWND hwnd, LVITEMINDEX* plvii, LONG iSubItem, LONG code, LPRECT prc)
		{
			return cast(BOOL)SendMessage(hwnd, LVM_GETITEMINDEXRECT, cast(WPARAM)plvii,
				prc ? prc.top = iSubItem, prc.left = code, cast(LPARAM)prc : cast(LPARAM)null);
		}

		HRESULT ListView_SetItemIndexState(HWND hwndLV, LVITEMINDEX* plvii, UINT data, UINT mask)
		{
			LVITEM _macro_lvi;

			_macro_lvi.stateMask = mask;
			_macro_lvi.state = data;
			return cast(HRESULT)SendMessage(hwndLV, LVM_SETITEMINDEXSTATE, cast(WPARAM)plvii, cast(LPARAM)&_macro_lvi);
		}

		BOOL ListView_GetNextItemIndex(HWND hwnd, LVITEMINDEX* plvii, LPARAM flags)
		{
			return cast(BOOL)SendMessage(hwnd, LVM_GETNEXTITEMINDEX, cast(WPARAM)plvii, MAKELPARAM(cast(WORD)flags, 0));
		}
}

//-------------------------------------------------------------------
const char* WC_TREEVIEWA = "SysTreeView32";
const wchar* WC_TREEVIEWW = "SysTreeView32";
version(UNICODE)
	alias WC_TREEVIEWW WC_TREEVIEW;
else
	alias WC_TREEVIEWA WC_TREEVIEW;

enum {
	TVS_HASBUTTONS      = 0x0001,
	TVS_HASLINES        = 0x0002,
	TVS_LINESATROOT     = 0x0004,
	TVS_EDITLABELS      = 0x0008,
	TVS_DISABLEDRAGDROP = 0x0010,
	TVS_SHOWSELALWAYS   = 0x0020,
	TVS_RTLREADING      = 0x0040,
	TVS_NOTOOLTIPS      = 0x0080,
	TVS_CHECKBOXES      = 0x0100,
	TVS_TRACKSELECT     = 0x0200,
	TVS_SINGLEEXPAND    = 0x0400,
	TVS_INFOTIP         = 0x0800,
	TVS_FULLROWSELECT   = 0x1000,
	TVS_NOSCROLL        = 0x2000,
	TVS_NONEVENHEIGHT   = 0x4000,
	TVS_NOHSCROLL       = 0x8000,
}

//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	enum {
		TVS_EX_MULTISELECT         = 0x0002,
		TVS_EX_DOUBLEBUFFER        = 0x0004,
		TVS_EX_NOINDENTSTATE       = 0x0008,
		TVS_EX_RICHTOOLTIP         = 0x0010,
		TVS_EX_AUTOHSCROLL         = 0x0020,
		TVS_EX_FADEINOUTEXPANDOS   = 0x0040,
		TVS_EX_PARTIALCHECKBOXES   = 0x0080,
		TVS_EX_EXCLUSIONCHECKBOXES = 0x0100,
		TVS_EX_DIMMEDCHECKBOXES    = 0x0200,
		TVS_EX_DRAWIMAGEASYNC      = 0x0400,
	}

enum HTREEITEM : void* {init = (void*).init}

enum {
	TVIF_TEXT          = 0x0001,
	TVIF_IMAGE         = 0x0002,
	TVIF_PARAM         = 0x0004,
	TVIF_STATE         = 0x0008,
	TVIF_HANDLE        = 0x0010,
	TVIF_SELECTEDIMAGE = 0x0020,
	TVIF_CHILDREN      = 0x0040,
	TVIF_INTEGRAL      = 0x0080,
	TVIF_STATEEX       = 0x0100,
	TVIF_EXPANDEDIMAGE = 0x0200,
}
enum {
	TVIS_SELECTED       = 0x0002,
	TVIS_CUT            = 0x0004,
	TVIS_DROPHILITED    = 0x0008,
	TVIS_BOLD           = 0x0010,
	TVIS_EXPANDED       = 0x0020,
	TVIS_EXPANDEDONCE   = 0x0040,
	TVIS_EXPANDPARTIAL  = 0x0080,
	TVIS_OVERLAYMASK    = 0x0F00,
	TVIS_STATEIMAGEMASK = 0xF000,
	TVIS_USERMASK       = 0xF000,
	TVIS_EX_FLAT        = 0x0001,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		TVIS_EX_DISABLED = 0x0002,
	TVIS_EX_ALL         = 0x0002,
}

struct NMTVSTATEIMAGECHANGING {
	NMHDR hdr;
	HTREEITEM hti;
	int iOldStateImageIndex;
	int iNewStateImageIndex;
}
alias NMTVSTATEIMAGECHANGING* LPNMTVSTATEIMAGECHANGING;

enum I_CHILDRENCALLBACK = -1;

//alias LPTVITEMW LPTV_ITEMW;
//alias LPTVITEMA LPTV_ITEMA;
//alias TVITEMW TV_ITEMW;
//alias TVITEMA TV_ITEMA;
//alias LPTVITEM LPTV_ITEM;
//alias TVITEM TV_ITEM;

struct TVITEMA {
	UINT mask;
	HTREEITEM hItem;
	UINT state;
	UINT stateMask;
	LPSTR pszText;
	int cchTextMax;
	int iImage;
	int iSelectedImage;
	int cChildren;
	LPARAM lParam;
}
alias TVITEMA* LPTVITEMA;

struct TVITEMW {
	UINT mask;
	HTREEITEM hItem;
	UINT state;
	UINT stateMask;
	LPWSTR pszText;
	int cchTextMax;
	int iImage;
	int iSelectedImage;
	int cChildren;
	LPARAM lParam;
}
alias TVITEMW* LPTVITEMW;

struct TVITEMEXA {
	UINT mask;
	HTREEITEM hItem;
	UINT state;
	UINT stateMask;
	LPSTR pszText;
	int cchTextMax;
	int iImage;
	int iSelectedImage;
	int cChildren;
	LPARAM lParam;
	int iIntegral;
	UINT uStateEx;
	HWND hwnd;
	int iExpandedImage;
	//(NTDDI_VERSION >= NTDDI_WIN7)
		int iReserved;
}
alias TVITEMEXA* LPTVITEMEXA;

struct TVITEMEXW {
	UINT mask;
	HTREEITEM hItem;
	UINT state;
	UINT stateMask;
	LPWSTR pszText;
	int cchTextMax;
	int iImage;
	int iSelectedImage;
	int cChildren;
	LPARAM lParam;
	int iIntegral;
	UINT uStateEx;
	HWND hwnd;
	int iExpandedImage;
	//(NTDDI_VERSION >= NTDDI_WIN7)
		int iReserved;
}
alias TVITEMEXW* LPTVITEMEXW;
version(UNICODE){
	alias TVITEMEXW TVITEMEX;
	alias LPTVITEMEXW LPTVITEMEX;
}else{
	alias TVITEMEXA TVITEMEX;
	alias LPTVITEMEXA LPTVITEMEX;
}

version(UNICODE){
	alias TVITEMW TVITEM;
	alias LPTVITEMW LPTVITEM;
}else{
	alias TVITEMA TVITEM;
	alias LPTVITEMA LPTVITEM;
}

const HTREEITEM TVI_ROOT = cast(HTREEITEM)cast(ULONG_PTR)-0x10000;
const HTREEITEM TVI_FIRST = cast(HTREEITEM)cast(ULONG_PTR)-0x0FFFF;
const HTREEITEM TVI_LAST = cast(HTREEITEM)cast(ULONG_PTR)-0x0FFFE;
const HTREEITEM TVI_SORT = cast(HTREEITEM)cast(ULONG_PTR)-0x0FFFD;

struct TVINSERTSTRUCTA {
	HTREEITEM hParent;
	HTREEITEM hInsertAfter;
	union {
		TVITEMEXA itemex;
		TVITEMA item;
	}
}
alias TVINSERTSTRUCTA* LPTVINSERTSTRUCTA;
struct TVINSERTSTRUCTW {
	HTREEITEM hParent;
	HTREEITEM hInsertAfter;
	union {
		TVITEMEXW itemex;
		TVITEMW item;
	}
}
alias TVINSERTSTRUCTW* LPTVINSERTSTRUCTW;
version(UNICODE){
	alias TVINSERTSTRUCTW TVINSERTSTRUCT;
	alias LPTVINSERTSTRUCTW LPTVINSERTSTRUCT;
	alias TVINSERTSTRUCTW_V1_SIZE TVINSERTSTRUCT_V1_SIZE;
}else{
	alias TVINSERTSTRUCTA TVINSERTSTRUCT;
	alias LPTVINSERTSTRUCTA LPTVINSERTSTRUCT;
	alias TVINSERTSTRUCTA_V1_SIZE TVINSERTSTRUCT_V1_SIZE;
}

//alias LPTVINSERTSTRUCTA LPTV_INSERTSTRUCTA;
//alias LPTVINSERTSTRUCTW LPTV_INSERTSTRUCTW;
//alias TVINSERTSTRUCTA TV_INSERTSTRUCTA;
//alias TVINSERTSTRUCTW TV_INSERTSTRUCTW;

alias TVINSERTSTRUCT TV_INSERTSTRUCT;
alias LPTVINSERTSTRUCT LPTV_INSERTSTRUCT;
enum TVINSERTSTRUCTA_V1_SIZE = TVINSERTSTRUCTA.item.offsetof + TVINSERTSTRUCTA.item.sizeof;
enum TVINSERTSTRUCTW_V1_SIZE = TVINSERTSTRUCTW.item.offsetof + TVINSERTSTRUCTW.item.sizeof;

enum {
	TVM_INSERTITEMA = TV_FIRST + 0,
	TVM_INSERTITEMW = TV_FIRST + 50,
}
version(UNICODE)
	enum TVM_INSERTITEM = TVM_INSERTITEMW;
else
	enum TVM_INSERTITEM = TVM_INSERTITEMA;

enum TVM_DELETEITEM = TV_FIRST + 1;
enum TVM_EXPAND = TV_FIRST + 2;

enum {
	TVE_COLLAPSE      = 0x0001,
	TVE_EXPAND        = 0x0002,
	TVE_TOGGLE        = 0x0003,
	TVE_EXPANDPARTIAL = 0x4000,
	TVE_COLLAPSERESET = 0x8000,
}

enum TVM_GETITEMRECT = TV_FIRST + 4;
enum TVM_GETCOUNT = TV_FIRST + 5;
enum TVM_GETINDENT = TV_FIRST + 6;
enum TVM_SETINDENT = TV_FIRST + 7;
enum TVM_GETIMAGELIST = TV_FIRST + 8;
enum {
	TVSIL_NORMAL = 0,
	TVSIL_STATE  = 2,
}
enum TVM_SETIMAGELIST = TV_FIRST + 9;
enum TVM_GETNEXTITEM = TV_FIRST + 10;
enum {
	TVGN_ROOT            = 0x0000,
	TVGN_NEXT            = 0x0001,
	TVGN_PREVIOUS        = 0x0002,
	TVGN_PARENT          = 0x0003,
	TVGN_CHILD           = 0x0004,
	TVGN_FIRSTVISIBLE    = 0x0005,
	TVGN_NEXTVISIBLE     = 0x0006,
	TVGN_PREVIOUSVISIBLE = 0x0007,
	TVGN_DROPHILITE      = 0x0008,
	TVGN_CARET           = 0x0009,
	TVGN_LASTVISIBLE     = 0x000A,
	TVGN_NEXTSELECTED    = 0x000B,
}
//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	enum TVSI_NOSINGLEEXPAND = 0x8000;
enum TVM_SELECTITEM = TV_FIRST + 11;

enum {
	TVM_GETITEMA = TV_FIRST + 12,
	TVM_GETITEMW = TV_FIRST + 62,
}
version(UNICODE)
	enum TVM_GETITEM = TVM_GETITEMW;
else
	enum TVM_GETITEM = TVM_GETITEMA;

enum {
	TVM_SETITEMA = TV_FIRST + 13,
	TVM_SETITEMW = TV_FIRST + 63,
}
version(UNICODE)
	enum TVM_SETITEM = TVM_SETITEMW;
else
	enum TVM_SETITEM = TVM_SETITEMA;
enum {
	TVM_EDITLABELA = TV_FIRST + 14,
	TVM_EDITLABELW = TV_FIRST + 65,
}
version(UNICODE)
	enum TVM_EDITLABEL = TVM_EDITLABELW;
else
	enum TVM_EDITLABEL = TVM_EDITLABELA;
enum TVM_GETEDITCONTROL = TV_FIRST + 15;
enum TVM_GETVISIBLECOUNT = TV_FIRST + 16;
enum TVM_HITTEST = TV_FIRST + 17;

//alias LPTVHITTESTINFO LPTV_HITTESTINFO;
//alias TVHITTESTINFO TV_HITTESTINFO;

struct TVHITTESTINFO {
	POINT pt;
	UINT flags;
	HTREEITEM hItem;
}
alias TVHITTESTINFO* LPTVHITTESTINFO;
enum {
	TVHT_NOWHERE         = 0x0001,
	TVHT_ONITEMICON      = 0x0002,
	TVHT_ONITEMLABEL     = 0x0004,
	TVHT_ONITEMINDENT    = 0x0008,
	TVHT_ONITEMBUTTON    = 0x0010,
	TVHT_ONITEMRIGHT     = 0x0020,
	TVHT_ONITEMSTATEICON = 0x0040,
	TVHT_ABOVE           = 0x0100,
	TVHT_BELOW           = 0x0200,
	TVHT_TORIGHT         = 0x0400,
	TVHT_TOLEFT          = 0x0800,
	TVHT_ONITEM          = TVHT_ONITEMICON | TVHT_ONITEMLABEL | TVHT_ONITEMSTATEICON,
}
enum TVM_CREATEDRAGIMAGE = TV_FIRST + 18;
enum TVM_SORTCHILDREN = TV_FIRST + 19;
enum TVM_ENSUREVISIBLE = TV_FIRST + 20;
enum TVM_SORTCHILDRENCB = TV_FIRST + 21;
enum TVM_ENDEDITLABELNOW = TV_FIRST + 22;
enum {
	TVM_GETISEARCHSTRINGA = TV_FIRST + 23,
	TVM_GETISEARCHSTRINGW = TV_FIRST + 64,
}
version(UNICODE)
	enum TVM_GETISEARCHSTRING = TVM_GETISEARCHSTRINGW;
else
	enum TVM_GETISEARCHSTRING = TVM_GETISEARCHSTRINGA;

enum TVM_SETTOOLTIPS = TV_FIRST + 24;
enum TVM_GETTOOLTIPS = TV_FIRST + 25;
enum TVM_SETINSERTMARK = TV_FIRST + 26;
enum TVM_SETUNICODEFORMAT = CCM_SETUNICODEFORMAT;
enum TVM_GETUNICODEFORMAT = CCM_GETUNICODEFORMAT;
enum TVM_SETITEMHEIGHT = TV_FIRST + 27;
enum TVM_GETITEMHEIGHT = TV_FIRST + 28;
enum TVM_SETBKCOLOR = TV_FIRST + 29;
enum TVM_SETTEXTCOLOR = TV_FIRST + 30;
enum TVM_GETBKCOLOR = TV_FIRST + 31;
enum TVM_GETTEXTCOLOR = TV_FIRST + 32;
enum TVM_SETSCROLLTIME = TV_FIRST + 33;
enum TVM_GETSCROLLTIME = TV_FIRST + 34;
enum TVM_SETINSERTMARKCOLOR = TV_FIRST + 37;
enum TVM_GETINSERTMARKCOLOR = TV_FIRST + 38;
enum TVM_GETITEMSTATE = TV_FIRST + 39;
enum TVM_SETLINECOLOR = TV_FIRST + 40;
enum TVM_GETLINECOLOR = TV_FIRST + 41;
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	enum TVM_MAPACCIDTOHTREEITEM = TV_FIRST + 42;
	enum TVM_MAPHTREEITEMTOACCID = TV_FIRST + 43;
	enum TVM_SETEXTENDEDSTYLE = TV_FIRST + 44;
	enum TVM_GETEXTENDEDSTYLE = TV_FIRST + 45;
	enum TVM_SETAUTOSCROLLINFO = TV_FIRST + 59;

	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	enum TVM_GETSELECTEDCOUNT = TV_FIRST + 70;
	enum TVM_SHOWINFOTIP = TV_FIRST + 71;

	enum {
		TVGIPR_BUTTON = 0x0001,
	}
	alias int TVITEMPART;

	struct TVGETITEMPARTRECTINFO {
		HTREEITEM hti;
		RECT* prc;
		TVITEMPART partID;
	}
	enum TVM_GETITEMPARTRECT = TV_FIRST + 72;

alias extern(Windows) int function(LPARAM lParam1, LPARAM lParam2, LPARAM lParamSort) PFNTVCOMPARE;

//alias LPTVSORTCB LPTV_SORTCB;
//alias TVSORTCB TV_SORTCB;

struct TVSORTCB {
	HTREEITEM hParent;
	PFNTVCOMPARE lpfnCompare;
	LPARAM lParam;
}
alias TVSORTCB* LPTVSORTCB;

//alias LPNMTREEVIEWA LPNM_TREEVIEWA;
//alias LPNMTREEVIEWW LPNM_TREEVIEWW;
//alias NMTREEVIEWW NM_TREEVIEWW;
//alias NMTREEVIEWA NM_TREEVIEWA;
//alias LPNMTREEVIEW LPNM_TREEVIEW;
//alias NMTREEVIEW NM_TREEVIEW;

struct NMTREEVIEWA {
	NMHDR hdr;
	UINT action;
	TVITEMA itemOld;
	TVITEMA itemNew;
	POINT ptDrag;
}
alias NMTREEVIEWA* LPNMTREEVIEWA;

struct NMTREEVIEWW {
	NMHDR hdr;
	UINT action;
	TVITEMW itemOld;
	TVITEMW itemNew;
	POINT ptDrag;
}
alias NMTREEVIEWW* LPNMTREEVIEWW;

version(UNICODE){
	alias NMTREEVIEWW NMTREEVIEW;
	alias LPNMTREEVIEWW LPNMTREEVIEW;
}else{
	alias NMTREEVIEWA NMTREEVIEW;
	alias LPNMTREEVIEWA LPNMTREEVIEW;
}
enum {
	TVN_SELCHANGINGA = TVN_FIRST-1,
	TVN_SELCHANGINGW = TVN_FIRST-50,
	TVN_SELCHANGEDA  = TVN_FIRST-2,
	TVN_SELCHANGEDW  = TVN_FIRST-51,
}
enum {
	TVC_UNKNOWN    = 0x0000,
	TVC_BYMOUSE    = 0x0001,
	TVC_BYKEYBOARD = 0x0002,
}
enum {
	TVN_GETDISPINFOA = TVN_FIRST-3,
	TVN_GETDISPINFOW = TVN_FIRST-52,
	TVN_SETDISPINFOA = TVN_FIRST-4,
	TVN_SETDISPINFOW = TVN_FIRST-53,
}
enum TVIF_DI_SETITEM = 0x1000;
//alias NMTVDISPINFOA TV_DISPINFOA;
//alias NMTVDISPINFOW TV_DISPINFOW;
//alias NMTVDISPINFO TV_DISPINFO;

struct NMTVDISPINFOA {
	NMHDR hdr;
	TVITEMA item;
}
alias NMTVDISPINFOA* LPNMTVDISPINFOA;

struct NMTVDISPINFOW {
	NMHDR hdr;
	TVITEMW item;
}
alias NMTVDISPINFOW* LPNMTVDISPINFOW;

version(UNICODE){
	alias NMTVDISPINFOW NMTVDISPINFO;
	alias LPNMTVDISPINFOW LPNMTVDISPINFO;
}else{
	alias NMTVDISPINFOA NMTVDISPINFO;
	alias LPNMTVDISPINFOA LPNMTVDISPINFO;
}

//(_WIN32_IE >= _WIN32_WINNT_VISTA)
	struct NMTVDISPINFOEXA {
		NMHDR hdr;
		TVITEMEXA item;
	}
	alias NMTVDISPINFOEXA* LPNMTVDISPINFOEXA;

	struct NMTVDISPINFOEXW {
		NMHDR hdr;
		TVITEMEXW item;
	}
	alias NMTVDISPINFOEXW* LPNMTVDISPINFOEXW;

	version(UNICODE){
		alias NMTVDISPINFOEXW NMTVDISPINFOEX;
		alias LPNMTVDISPINFOEXW LPNMTVDISPINFOEX;
	}else{
		alias NMTVDISPINFOEXA NMTVDISPINFOEX;
		alias LPNMTVDISPINFOEXA LPNMTVDISPINFOEX;
	}
	alias NMTVDISPINFOEXA TV_DISPINFOEXA;
	alias NMTVDISPINFOEXW TV_DISPINFOEXW;
	alias NMTVDISPINFOEX TV_DISPINFOEX;

enum {
	TVN_ITEMEXPANDINGA  = TVN_FIRST-5,
	TVN_ITEMEXPANDINGW  = TVN_FIRST-54,
	TVN_ITEMEXPANDEDA   = TVN_FIRST-6,
	TVN_ITEMEXPANDEDW   = TVN_FIRST-55,
	TVN_BEGINDRAGA      = TVN_FIRST-7,
	TVN_BEGINDRAGW      = TVN_FIRST-56,
	TVN_BEGINRDRAGA     = TVN_FIRST-8,
	TVN_BEGINRDRAGW     = TVN_FIRST-57,
	TVN_DELETEITEMA     = TVN_FIRST-9,
	TVN_DELETEITEMW     = TVN_FIRST-58,
	TVN_BEGINLABELEDITA = TVN_FIRST-10,
	TVN_BEGINLABELEDITW = TVN_FIRST-59,
	TVN_ENDLABELEDITA   = TVN_FIRST-11,
	TVN_ENDLABELEDITW   = TVN_FIRST-60,
	TVN_KEYDOWN         = TVN_FIRST-12,
	TVN_GETINFOTIPA     = TVN_FIRST-13,
	TVN_GETINFOTIPW     = TVN_FIRST-14,
	TVN_SINGLEEXPAND    = TVN_FIRST-15,
}
enum {
	TVNRET_DEFAULT = 0,
	TVNRET_SKIPOLD = 1,
	TVNRET_SKIPNEW = 2,
}

enum {
	TVN_ITEMCHANGINGA = TVN_FIRST-16,
	TVN_ITEMCHANGINGW = TVN_FIRST-17,
	TVN_ITEMCHANGEDA  = TVN_FIRST-18,
	TVN_ITEMCHANGEDW  = TVN_FIRST-19,
	TVN_ASYNCDRAW     = TVN_FIRST-20,
}

//alias NMTVKEYDOWN TV_KEYDOWN;

align(1)
struct NMTVKEYDOWN {
	NMHDR hdr;
	WORD wVKey;
	UINT flags;
}
alias NMTVKEYDOWN* LPNMTVKEYDOWN;

version(UNICODE){
	enum {
		TVN_SELCHANGING    = TVN_SELCHANGINGW,
		TVN_SELCHANGED     = TVN_SELCHANGEDW,
		TVN_GETDISPINFO    = TVN_GETDISPINFOW,
		TVN_SETDISPINFO    = TVN_SETDISPINFOW,
		TVN_ITEMEXPANDING  = TVN_ITEMEXPANDINGW,
		TVN_ITEMEXPANDED   = TVN_ITEMEXPANDEDW,
		TVN_BEGINDRAG      = TVN_BEGINDRAGW,
		TVN_BEGINRDRAG     = TVN_BEGINRDRAGW,
		TVN_DELETEITEM     = TVN_DELETEITEMW,
		TVN_BEGINLABELEDIT = TVN_BEGINLABELEDITW,
		TVN_ENDLABELEDIT   = TVN_ENDLABELEDITW,
	}
}else{
	enum {
		TVN_SELCHANGING    = TVN_SELCHANGINGA,
		TVN_SELCHANGED     = TVN_SELCHANGEDA,
		TVN_GETDISPINFO    = TVN_GETDISPINFOA,
		TVN_SETDISPINFO    = TVN_SETDISPINFOA,
		TVN_ITEMEXPANDING  = TVN_ITEMEXPANDINGA,
		TVN_ITEMEXPANDED   = TVN_ITEMEXPANDEDA,
		TVN_BEGINDRAG      = TVN_BEGINDRAGA,
		TVN_BEGINRDRAG     = TVN_BEGINRDRAGA,
		TVN_DELETEITEM     = TVN_DELETEITEMA,
		TVN_BEGINLABELEDIT = TVN_BEGINLABELEDITA,
		TVN_ENDLABELEDIT   = TVN_ENDLABELEDITA,
	}
}

struct NMTVCUSTOMDRAW {
	NMCUSTOMDRAW nmcd;
	COLORREF clrText;
	COLORREF clrTextBk;
	int iLevel;
}
alias NMTVCUSTOMDRAW* LPNMTVCUSTOMDRAW;
enum NMTVCUSTOMDRAW_V3_SIZE = NMTVCUSTOMDRAW.clrTextBk.offsetof + NMTVCUSTOMDRAW.clrTextBk.sizeof;

struct NMTVGETINFOTIPA {
	NMHDR hdr;
	LPSTR pszText;
	int cchTextMax;
	HTREEITEM hItem;
	LPARAM lParam;
}
alias NMTVGETINFOTIPA* LPNMTVGETINFOTIPA;

struct NMTVGETINFOTIPW {
	NMHDR hdr;
	LPWSTR pszText;
	int cchTextMax;
	HTREEITEM hItem;
	LPARAM lParam;
}
alias NMTVGETINFOTIPW* LPNMTVGETINFOTIPW;

version(UNICODE){
	enum TVN_GETINFOTIP = TVN_GETINFOTIPW;
	alias NMTVGETINFOTIPW NMTVGETINFOTIP;
	alias LPNMTVGETINFOTIPW LPNMTVGETINFOTIP;
}else{
	enum TVN_GETINFOTIP = TVN_GETINFOTIPA;
	alias NMTVGETINFOTIPA NMTVGETINFOTIP;
	alias LPNMTVGETINFOTIPA LPNMTVGETINFOTIP;
}

enum TVCDRF_NOIMAGES = 0x00010000;

struct NMTVITEMCHANGE {
	NMHDR hdr;
	UINT uChanged;
	HTREEITEM hItem;
	UINT uStateNew;
	UINT uStateOld;
	LPARAM lParam;
}
struct NMTVASYNCDRAW {
	NMHDR hdr;
	IMAGELISTDRAWPARAMS* pimldp;
	HRESULT hr;
	HTREEITEM hItem;
	LPARAM lParam;
	DWORD dwRetFlags;
	int iRetImageIndex;
}
version(UNICODE){
	enum TVN_ITEMCHANGING = TVN_ITEMCHANGINGW;
	enum TVN_ITEMCHANGED = TVN_ITEMCHANGEDW;
}else{
	enum TVN_ITEMCHANGING = TVN_ITEMCHANGINGA;
	enum TVN_ITEMCHANGED = TVN_ITEMCHANGEDA;
}

version(HelperFunctions){
	HTREEITEM TreeView_InsertItem(HWND hwnd, LPTV_INSERTSTRUCT lpis)
	{
		return cast(HTREEITEM)SendMessage(hwnd, TVM_INSERTITEM, 0, cast(LPARAM)lpis);
	}

	BOOL TreeView_DeleteItem(HWND hwnd, HTREEITEM hitem)
	{
		return cast(BOOL)SendMessage(hwnd, TVM_DELETEITEM, 0, cast(LPARAM)hitem);
	}

	BOOL TreeView_DeleteAllItems(HWND hwnd)
	{
		return cast(BOOL)SendMessage(hwnd, TVM_DELETEITEM, 0, cast(LPARAM)TVI_ROOT);
	}

	BOOL TreeView_Expand(HWND hwnd, HTREEITEM hitem, UINT code)
	{
		return cast(BOOL)SendMessage(hwnd, TVM_EXPAND, cast(WPARAM)code, cast(LPARAM)hitem);
	}

	BOOL TreeView_GetItemRect(HWND hwnd, HTREEITEM hitem, LPRECT prc, BOOL code)
	{
		*cast(HTREEITEM*)prc = hitem;
		return cast(BOOL)SendMessage(hwnd, TVM_GETITEMRECT, cast(WPARAM)code, cast(LPARAM)prc);
	}

	UINT TreeView_GetCount(HWND hwnd)
	{
		return cast(UINT)SendMessage(hwnd, TVM_GETCOUNT, 0, 0);
	}

	UINT TreeView_GetIndent(HWND hwnd)
	{
		return cast(UINT)SendMessage(hwnd, TVM_GETINDENT, 0, 0);
	}

	BOOL TreeView_SetIndent(HWND hwnd, int indent)
	{
		return cast(BOOL)SendMessage(hwnd, TVM_SETINDENT, cast(WPARAM)indent, 0);
	}

	HIMAGELIST TreeView_GetImageList(HWND hwnd, int iImage)
	{
		return cast(HIMAGELIST)SendMessage(hwnd, TVM_GETIMAGELIST, iImage, 0);
	}

	HIMAGELIST TreeView_SetImageList(HWND hwnd, HIMAGELIST himl, int iImage)
	{
		return cast(HIMAGELIST)SendMessage(hwnd, TVM_SETIMAGELIST, iImage, cast(LPARAM)himl);
	}

	HTREEITEM TreeView_GetNextItem(HWND hwnd, HTREEITEM hitem, UINT code)
	{
		return cast(HTREEITEM)SendMessage(hwnd, TVM_GETNEXTITEM, cast(WPARAM)code, cast(LPARAM)hitem);
	}

	HTREEITEM TreeView_GetChild(HWND hwnd, HTREEITEM hitem)
	{
		 return TreeView_GetNextItem(hwnd, hitem, TVGN_CHILD);
	}

	HTREEITEM TreeView_GetNextSibling(HWND hwnd, HTREEITEM hitem)
	{
		return TreeView_GetNextItem(hwnd, hitem, TVGN_NEXT);
	}

	HTREEITEM TreeView_GetPrevSibling(HWND hwnd, HTREEITEM hitem)
	{
		return TreeView_GetNextItem(hwnd, hitem, TVGN_PREVIOUS);
	}

	HTREEITEM TreeView_GetParent(HWND hwnd, HTREEITEM hitem)
	{
		return TreeView_GetNextItem(hwnd, hitem, TVGN_PARENT);
	}

	HTREEITEM TreeView_GetFirstVisible(HWND hwnd)
	{
		return TreeView_GetNextItem(hwnd, null, TVGN_FIRSTVISIBLE);
	}

	HTREEITEM TreeView_GetNextVisible(HWND hwnd, HTREEITEM hitem)
	{
		return TreeView_GetNextItem(hwnd, hitem, TVGN_NEXTVISIBLE);
	}

	HTREEITEM TreeView_GetPrevVisible(HWND hwnd, HTREEITEM hitem)
	{
		return TreeView_GetNextItem(hwnd, hitem, TVGN_PREVIOUSVISIBLE);
	}

	HTREEITEM TreeView_GetSelection(HWND hwnd)
	{
		return TreeView_GetNextItem(hwnd, null, TVGN_CARET);
	}

	HTREEITEM TreeView_GetDropHilight(HWND hwnd)
	{
		return TreeView_GetNextItem(hwnd, null, TVGN_DROPHILITE);
	}

	HTREEITEM TreeView_GetRoot(HWND hwnd)
	{
		return TreeView_GetNextItem(hwnd, null, TVGN_ROOT);
	}

	BOOL TreeView_Select(HWND hwnd, HTREEITEM hitem, UINT code)
	{
		return cast(BOOL)SendMessage(hwnd, TVM_SELECTITEM, cast(WPARAM)code, cast(LPARAM)hitem);
	}

	BOOL TreeView_SelectItem(HWND hwnd, HTREEITEM hitem)
	{
		return TreeView_Select(hwnd, hitem, TVGN_CARET);
	}

	BOOL TreeView_SelectDropTarget(HWND hwnd, HTREEITEM hitem)
	{
		return TreeView_Select(hwnd, hitem, TVGN_DROPHILITE);
	}

	BOOL TreeView_SelectSetFirstVisible(HWND hwnd, HTREEITEM hitem)
	{
		return TreeView_Select(hwnd, hitem, TVGN_FIRSTVISIBLE);
	}

	BOOL TreeView_GetItem(HWND hwnd, TVITEM* pitem)
	{
		return cast(BOOL)SendMessage(hwnd, TVM_GETITEM, 0, cast(LPARAM)pitem);
	}

	BOOL TreeView_SetItem(HWND hwnd, const(TVITEM*) pitem)
	{
		return cast(BOOL)SendMessage(hwnd, TVM_SETITEM, 0, cast(LPARAM)pitem);
	}

	HWND TreeView_EditLabel(HWND hwnd, HTREEITEM hitem)
	{
		return cast(HWND)SendMessage(hwnd, TVM_EDITLABEL, 0, cast(LPARAM)hitem);
	}

	HWND TreeView_GetEditControl(HWND hwnd)
	{
		return cast(HWND)SendMessage(hwnd, TVM_GETEDITCONTROL, 0, 0);
	}

	UINT TreeView_GetVisibleCount(HWND hwnd)
	{
		return cast(UINT)SendMessage(hwnd, TVM_GETVISIBLECOUNT, 0, 0);
	}

	HTREEITEM TreeView_HitTest(HWND hwnd, LPTVHITTESTINFO lpht)
	{
		return cast(HTREEITEM)SendMessage(hwnd, TVM_HITTEST, 0, cast(LPARAM)lpht);
	}

	HIMAGELIST TreeView_CreateDragImage(HWND hwnd, HTREEITEM hitem)
	{
		return cast(HIMAGELIST)SendMessage(hwnd, TVM_CREATEDRAGIMAGE, 0, cast(LPARAM)hitem);
	}

	BOOL TreeView_SortChildren(HWND hwnd, HTREEITEM hitem, BOOL recurse)
	{
		return cast(BOOL)SendMessage(hwnd, TVM_SORTCHILDREN, cast(WPARAM)recurse, cast(LPARAM)hitem);
	}

	BOOL TreeView_EnsureVisible(HWND hwnd, HTREEITEM hitem)
	{
		return cast(BOOL)SendMessage(hwnd, TVM_ENSUREVISIBLE, 0, cast(LPARAM)hitem);
	}

	BOOL TreeView_SortChildrenCB(HWND hwnd, LPTVSORTCB psort, BOOL recurse)
	{
		return cast(BOOL)SendMessage(hwnd, TVM_SORTCHILDRENCB, cast(WPARAM)recurse, cast(LPARAM)psort);
	}

	BOOL TreeView_EndEditLabelNow(HWND hwnd, BOOL fCancel)
	{
		return cast(BOOL)SendMessage(hwnd, TVM_ENDEDITLABELNOW, cast(WPARAM)fCancel, 0);
	}

	BOOL TreeView_GetISearchString(HWND hwndTV, LPTSTR lpsz)
	{
		return cast(BOOL)SendMessage(hwndTV, TVM_GETISEARCHSTRING, 0, cast(LPARAM)lpsz);
	}

	HWND TreeView_SetToolTips(HWND hwnd, HWND hwndTT)
	{
		return cast(HWND)SendMessage(hwnd, TVM_SETTOOLTIPS, cast(WPARAM)hwndTT, 0);
	}

	HWND TreeView_GetToolTips(HWND hwnd)
	{
		return cast(HWND)SendMessage(hwnd, TVM_GETTOOLTIPS, 0, 0);
	}

	HTREEITEM TreeView_GetLastVisible(HWND hwnd)
	{
		return TreeView_GetNextItem(hwnd, null, TVGN_LASTVISIBLE);
	}

	BOOL TreeView_SetInsertMark(HWND hwnd, HTREEITEM hItem, BOOL fAfter)
	{
		return cast(BOOL)SendMessage(hwnd, TVM_SETINSERTMARK, cast(WPARAM)fAfter, cast(LPARAM)hItem);
	}

	BOOL TreeView_SetUnicodeFormat(HWND hwnd, BOOL fUnicode)
	{
		return cast(BOOL)SendMessage(hwnd, TVM_SETUNICODEFORMAT, cast(WPARAM)fUnicode, 0);
	}

	BOOL TreeView_GetUnicodeFormat(HWND hwnd)
	{
		return cast(BOOL)SendMessage(hwnd, TVM_GETUNICODEFORMAT, 0, 0);
	}

	int TreeView_SetItemHeight(HWND hwnd, int iHeight)
	{
		return cast(int)SendMessage(hwnd, TVM_SETITEMHEIGHT, cast(WPARAM)iHeight, 0);
	}

	int TreeView_GetItemHeight(HWND hwnd)
	{
		return cast(int)SendMessage(hwnd, TVM_GETITEMHEIGHT, 0, 0);
	}

	COLORREF TreeView_SetBkColor(HWND hwnd, COLORREF clr)
	{
		return cast(COLORREF)SendMessage(hwnd, TVM_SETBKCOLOR, 0, cast(LPARAM)clr);
	}

	COLORREF TreeView_SetTextColor(HWND hwnd, COLORREF clr)
	{
		return cast(COLORREF)SendMessage(hwnd, TVM_SETTEXTCOLOR, 0, cast(LPARAM)clr);
	}

	COLORREF TreeView_GetBkColor(HWND hwnd)
	{
		return cast(COLORREF)SendMessage(hwnd, TVM_GETBKCOLOR, 0, 0);
	}

	COLORREF TreeView_GetTextColor(HWND hwnd)
	{
		return cast(COLORREF)SendMessage(hwnd, TVM_GETTEXTCOLOR, 0, 0);
	}

	UINT TreeView_SetScrollTime(HWND hwnd, UINT uTime)
	{
		return cast(UINT)SendMessage(hwnd, TVM_SETSCROLLTIME, uTime, 0);
	}

	UINT TreeView_GetScrollTime(HWND hwnd)
	{
		return cast(UINT)SendMessage(hwnd, TVM_GETSCROLLTIME, 0, 0);
	}

	COLORREF TreeView_SetInsertMarkColor(HWND hwnd, COLORREF clr)
	{
		return cast(COLORREF)SendMessage(hwnd, TVM_SETINSERTMARKCOLOR, 0, cast(LPARAM)clr);
	}

	COLORREF TreeView_GetInsertMarkColor(HWND hwnd)
	{
		return cast(COLORREF)SendMessage(hwnd, TVM_GETINSERTMARKCOLOR, 0, 0);
	}

	UINT TreeView_SetItemState(HWND hwndTV, HTREEITEM hti, UINT data, UINT _mask)
	{
		TVITEM _ms_TVi;
		_ms_TVi.mask = TVIF_STATE;
		_ms_TVi.hItem = hti;
		_ms_TVi.stateMask = _mask;
		_ms_TVi.state = data;
		return cast(UINT)SendMessage(hwndTV, TVM_SETITEM, 0, cast(LPARAM)&_ms_TVi);
	}

	UINT TreeView_SetCheckState(HWND hwndTV, HTREEITEM hti, BOOL fCheck)
	{
		return cast(UINT)TreeView_SetItemState(hwndTV, hti, INDEXTOSTATEIMAGEMASK(fCheck ? 2 : 1), TVIS_STATEIMAGEMASK);
	}

	UINT TreeView_GetItemState(HWND hwndTV, HTREEITEM hti, UINT mask)
	{
		return cast(UINT)SendMessage(hwndTV, TVM_GETITEMSTATE, cast(WPARAM)hti, cast(LPARAM)mask);
	}

	UINT TreeView_GetCheckState(HWND hwndTV, HTREEITEM hti)
	{
		return (((cast(UINT)(SendMessage(hwndTV, TVM_GETITEMSTATE, cast(WPARAM)hti, TVIS_STATEIMAGEMASK))) >> 12) -1);
	}

	COLORREF TreeView_SetLineColor(HWND hwnd, COLORREF clr)
	{
		return cast(COLORREF)SendMessage(hwnd, TVM_SETLINECOLOR, 0, cast(LPARAM)clr);
	}

	COLORREF TreeView_GetLineColor(HWND hwnd)
	{
		return cast(COLORREF)SendMessage(hwnd, TVM_GETLINECOLOR, 0, 0);
	}

	HTREEITEM TreeView_GetNextSelected(HWND hwnd, HTREEITEM hitem)
	{
		return TreeView_GetNextItem(hwnd, hitem, TVGN_NEXTSELECTED);
	}

	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		HTREEITEM TreeView_MapAccIDToHTREEITEM(HWND hwnd, UINT id)
		{
			return cast(HTREEITEM)SendMessage(hwnd, TVM_MAPACCIDTOHTREEITEM, id, 0);
		}

		UINT TreeView_MapHTREEITEMToAccID(HWND hwnd, HTREEITEM htreeitem)
		{
			return cast(UINT)SendMessage(hwnd, TVM_MAPHTREEITEMTOACCID, cast(WPARAM)htreeitem, 0);
		}

		DWORD TreeView_SetExtendedStyle(HWND hwnd, DWORD dw, UINT mask)
		{
			return cast(DWORD)SendMessage(hwnd, TVM_SETEXTENDEDSTYLE, mask, dw);
		}

		DWORD TreeView_GetExtendedStyle(HWND hwnd)
		{
			return cast(DWORD)SendMessage(hwnd, TVM_GETEXTENDEDSTYLE, 0, 0);
		}

		LRESULT TreeView_SetAutoScrollInfo(HWND hwnd, UINT uPixPerSec, UINT uUpdateTime)
		{
			return SendMessage(hwnd, TVM_SETAUTOSCROLLINFO, cast(WPARAM)uPixPerSec, cast(LPARAM)uUpdateTime);
		}

		DWORD TreeView_GetSelectedCount(HWND hwnd)
		{
			return cast(DWORD)SendMessage(hwnd, TVM_GETSELECTEDCOUNT, 0, 0);
		}

		DWORD TreeView_ShowInfoTip(HWND hwnd, HTREEITEM hitem)
		{
			return cast(DWORD)SendMessage(hwnd, TVM_SHOWINFOTIP, 0, cast(LPARAM)hitem);
		}

	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		BOOL TreeView_GetItemPartRect(HWND hwnd, HTREEITEM hitem, RECT* prc, TVITEMPART* partid)
		{
			TVGETITEMPARTRECTINFO info;

			info.hti = hitem;
			info.prc = prc;
			info.partID = cast(int)partid;
			return cast(BOOL)SendMessage(hwnd, TVM_GETITEMPARTRECT, 0, cast(LPARAM)&info);
		}
}

//-------------------------------------------------------------------
const wchar* WC_COMBOBOXEXW = "ComboBoxEx32";
const char* WC_COMBOBOXEXA = "ComboBoxEx32";
version(UNICODE)
	alias WC_COMBOBOXEXW WC_COMBOBOXEX;
else
	alias WC_COMBOBOXEXA WC_COMBOBOXEX;
enum {
	CBEIF_TEXT          = 0x00000001,
	CBEIF_IMAGE         = 0x00000002,
	CBEIF_SELECTEDIMAGE = 0x00000004,
	CBEIF_OVERLAY       = 0x00000008,
	CBEIF_INDENT        = 0x00000010,
	CBEIF_LPARAM        = 0x00000020,
	CBEIF_DI_SETITEM    = 0x10000000,
}
struct COMBOBOXEXITEMA {
	UINT mask;
	INT_PTR iItem;
	LPSTR pszText;
	int cchTextMax;
	int iImage;
	int iSelectedImage;
	int iOverlay;
	int iIndent;
	LPARAM lParam;
}
alias COMBOBOXEXITEMA* PCOMBOBOXEXITEMA;
alias COMBOBOXEXITEMA* PCCOMBOBOXEXITEMA;

struct COMBOBOXEXITEMW {
	UINT mask;
	INT_PTR iItem;
	LPWSTR pszText;
	int cchTextMax;
	int iImage;
	int iSelectedImage;
	int iOverlay;
	int iIndent;
	LPARAM lParam;
}
alias COMBOBOXEXITEMW* PCOMBOBOXEXITEMW;
alias COMBOBOXEXITEMW* PCCOMBOBOXEXITEMW;

version(UNICODE){
	alias COMBOBOXEXITEMW COMBOBOXEXITEM;
	alias PCOMBOBOXEXITEMW PCOMBOBOXEXITEM;
	alias PCCOMBOBOXEXITEMW PCCOMBOBOXEXITEM;
}else{
	alias COMBOBOXEXITEMA COMBOBOXEXITEM;
	alias PCOMBOBOXEXITEMA PCOMBOBOXEXITEM;
	alias PCCOMBOBOXEXITEMA PCCOMBOBOXEXITEM;
}
enum {
	CBEM_INSERTITEMA      = WM_USER + 1,
	CBEM_SETIMAGELIST     = WM_USER + 2,
	CBEM_GETIMAGELIST     = WM_USER + 3,
	CBEM_GETITEMA         = WM_USER + 4,
	CBEM_SETITEMA         = WM_USER + 5,
	CBEM_DELETEITEM       = CB_DELETESTRING,
	CBEM_GETCOMBOCONTROL  = WM_USER + 6,
	CBEM_GETEDITCONTROL   = WM_USER + 7,
	CBEM_SETEXSTYLE       = WM_USER + 8,
	CBEM_SETEXTENDEDSTYLE = WM_USER + 14,
	CBEM_GETEXSTYLE       = WM_USER + 9,
	CBEM_GETEXTENDEDSTYLE = WM_USER + 9,
	CBEM_SETUNICODEFORMAT = CCM_SETUNICODEFORMAT,
	CBEM_GETUNICODEFORMAT = CCM_GETUNICODEFORMAT,
	CBEM_HASEDITCHANGED  = WM_USER + 10,
	CBEM_INSERTITEMW     = WM_USER + 11,
	CBEM_SETITEMW        = WM_USER + 12,
	CBEM_GETITEMW        = WM_USER + 13,
}
version(UNICODE){
	enum CBEM_INSERTITEM = CBEM_INSERTITEMW;
	enum CBEM_SETITEM = CBEM_SETITEMW;
	enum CBEM_GETITEM = CBEM_GETITEMW;
}else{
	enum CBEM_INSERTITEM = CBEM_INSERTITEMA;
	enum CBEM_SETITEM = CBEM_SETITEMA;
	enum CBEM_GETITEM = CBEM_GETITEMA;
}

//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	enum CBEM_SETWINDOWTHEME = CCM_SETWINDOWTHEME;
enum {
	CBES_EX_NOEDITIMAGE       = 0x00000001,
	CBES_EX_NOEDITIMAGEINDENT = 0x00000002,
	CBES_EX_PATHWORDBREAKPROC = 0x00000004,
}

enum {
	CBES_EX_NOSIZELIMIT   = 0x00000008,
	CBES_EX_CASESENSITIVE = 0x00000010,
}
//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	enum CBES_EX_TEXTENDELLIPSIS = 0x00000020;

struct NMCOMBOBOXEXA {
	NMHDR hdr;
	COMBOBOXEXITEMA ceItem;
}
alias NMCOMBOBOXEXA* PNMCOMBOBOXEXA;

struct NMCOMBOBOXEXW {
	NMHDR hdr;
	COMBOBOXEXITEMW ceItem;
}
alias NMCOMBOBOXEXW* PNMCOMBOBOXEXW;

enum CBEN_GETDISPINFOW = CBEN_FIRST - 7;
enum CBEN_GETDISPINFOA = CBEN_FIRST - 0;

version(UNICODE){
	alias NMCOMBOBOXEXW NMCOMBOBOXEX;
	alias PNMCOMBOBOXEXW PNMCOMBOBOXEX;
	enum CBEN_GETDISPINFO = CBEN_GETDISPINFOW;
}else{
	alias NMCOMBOBOXEXA NMCOMBOBOXEX;
	alias PNMCOMBOBOXEXA PNMCOMBOBOXEX;
	enum CBEN_GETDISPINFO = CBEN_GETDISPINFOA;
}

enum {
	CBEN_INSERTITEM = CBEN_FIRST - 1,
	CBEN_DELETEITEM = CBEN_FIRST - 2,
	CBEN_BEGINEDIT  = CBEN_FIRST - 4,
	CBEN_ENDEDITA   = CBEN_FIRST - 5,
	CBEN_ENDEDITW   = CBEN_FIRST - 6,
}

enum {
	CBEN_DRAGBEGINA = CBEN_FIRST - 8,
	CBEN_DRAGBEGINW = CBEN_FIRST - 9,
}
version(UNICODE)
	enum CBEN_DRAGBEGIN = CBEN_DRAGBEGINW;
else
	enum CBEN_DRAGBEGIN = CBEN_DRAGBEGINA;

version(UNICODE)
	enum CBEN_ENDEDIT = CBEN_ENDEDITW;
else
	enum CBEN_ENDEDIT = CBEN_ENDEDITA;
enum {
	CBENF_KILLFOCUS = 1,
	CBENF_RETURN    = 2,
	CBENF_ESCAPE    = 3,
	CBENF_DROPDOWN  = 4,
}
enum CBEMAXSTRLEN = 260;

struct NMCBEDRAGBEGINW {
	NMHDR hdr;
	int iItemid;
	WCHAR[CBEMAXSTRLEN] szText;
}
alias NMCBEDRAGBEGINW* LPNMCBEDRAGBEGINW;
alias NMCBEDRAGBEGINW* PNMCBEDRAGBEGINW;

struct NMCBEDRAGBEGINA {
	NMHDR hdr;
	int iItemid;
	char[CBEMAXSTRLEN] szText;
}
alias NMCBEDRAGBEGINA* LPNMCBEDRAGBEGINA;
alias NMCBEDRAGBEGINA* PNMCBEDRAGBEGINA;

version(UNICODE){
	alias NMCBEDRAGBEGINW NMCBEDRAGBEGIN;
	alias LPNMCBEDRAGBEGINW LPNMCBEDRAGBEGIN;
	alias PNMCBEDRAGBEGINW PNMCBEDRAGBEGIN;
}else{
	alias NMCBEDRAGBEGINA NMCBEDRAGBEGIN;
	alias LPNMCBEDRAGBEGINA LPNMCBEDRAGBEGIN;
	alias PNMCBEDRAGBEGINA PNMCBEDRAGBEGIN;
}

struct NMCBEENDEDITW {
	NMHDR hdr;
	BOOL fChanged;
	int iNewSelection;
	WCHAR[CBEMAXSTRLEN] szText;
	int iWhy;
}
alias NMCBEENDEDITW* LPNMCBEENDEDITW;
alias NMCBEENDEDITW* PNMCBEENDEDITW;

struct NMCBEENDEDITA {
	NMHDR hdr;
	BOOL fChanged;
	int iNewSelection;
	char[CBEMAXSTRLEN] szText;
	int iWhy;
}
alias NMCBEENDEDITA* LPNMCBEENDEDITA;
alias NMCBEENDEDITA* PNMCBEENDEDITA;

version(UNICODE){
	alias NMCBEENDEDITW NMCBEENDEDIT;
	alias LPNMCBEENDEDITW LPNMCBEENDEDIT;
	alias PNMCBEENDEDITW PNMCBEENDEDIT;
}else{
	alias NMCBEENDEDITA NMCBEENDEDIT;
	alias LPNMCBEENDEDITA LPNMCBEENDEDIT;
	alias PNMCBEENDEDITA PNMCBEENDEDIT;
}


//-------------------------------------------------------------------
const char* WC_TABCONTROLA = "SysTabControl32";
const wchar* WC_TABCONTROLW = "SysTabControl32";

version(UNICODE)
	alias WC_TABCONTROLW WC_TABCONTROL;
else
	alias WC_TABCONTROLA WC_TABCONTROL;

enum {
	TCS_SCROLLOPPOSITE    = 0x0001,
	TCS_BOTTOM            = 0x0002,
	TCS_RIGHT             = 0x0002,
	TCS_MULTISELECT       = 0x0004,
	TCS_FLATBUTTONS       = 0x0008,
	TCS_FORCEICONLEFT     = 0x0010,
	TCS_FORCELABELLEFT    = 0x0020,
	TCS_HOTTRACK          = 0x0040,
	TCS_VERTICAL          = 0x0080,
	TCS_TABS              = 0x0000,
	TCS_BUTTONS           = 0x0100,
	TCS_SINGLELINE        = 0x0000,
	TCS_MULTILINE         = 0x0200,
	TCS_RIGHTJUSTIFY      = 0x0000,
	TCS_FIXEDWIDTH        = 0x0400,
	TCS_RAGGEDRIGHT       = 0x0800,
	TCS_FOCUSONBUTTONDOWN = 0x1000,
	TCS_OWNERDRAWFIXED    = 0x2000,
	TCS_TOOLTIPS          = 0x4000,
	TCS_FOCUSNEVER        = 0x8000,
}
enum {
	TCS_EX_FLATSEPARATORS = 0x00000001,
	TCS_EX_REGISTERDROP   = 0x00000002,
}

enum TCM_GETIMAGELIST = TCM_FIRST + 2;
enum TCM_SETIMAGELIST = TCM_FIRST + 3;
enum TCM_GETITEMCOUNT = TCM_FIRST + 4;
enum {
	TCIF_TEXT       = 0x0001,
	TCIF_IMAGE      = 0x0002,
	TCIF_RTLREADING = 0x0004,
	TCIF_PARAM      = 0x0008,
}
enum {
	TCIF_STATE         = 0x0010,
	TCIS_BUTTONPRESSED = 0x0001,
}
enum TCIS_HIGHLIGHTED = 0x0002;

//alias TCITEMHEADERA TC_ITEMHEADERA;
//alias TCITEMHEADERW TC_ITEMHEADERW;
//alias TCITEMHEADER TC_ITEMHEADER;

struct TCITEMHEADERA {
	UINT mask;
	UINT lpReserved1;
	UINT lpReserved2;
	LPSTR pszText;
	int cchTextMax;
	int iImage;
}
alias TCITEMHEADERA* LPTCITEMHEADERA;
struct TCITEMHEADERW {
	UINT mask;
	UINT lpReserved1;
	UINT lpReserved2;
	LPWSTR pszText;
	int cchTextMax;
	int iImage;
}
alias TCITEMHEADERW* LPTCITEMHEADERW;

version(UNICODE){
	alias TCITEMHEADERW TCITEMHEADER;
	alias LPTCITEMHEADERW LPTCITEMHEADER;
}else{
	alias TCITEMHEADERA TCITEMHEADER;
	alias LPTCITEMHEADERA LPTCITEMHEADER;
}

//alias TCITEMA TC_ITEMA;
//alias TCITEMW TC_ITEMW;
//alias TCITEM TC_ITEM;

struct TCITEMA {
	UINT mask;
	DWORD dwState;
	DWORD dwStateMask;
	LPSTR pszText;
	int cchTextMax;
	int iImage;
	LPARAM lParam;
}
alias TCITEMA* LPTCITEMA;

struct TCITEMW {
	UINT mask;
	DWORD dwState;
	DWORD dwStateMask;
	LPWSTR pszText;
	int cchTextMax;
	int iImage;
	LPARAM lParam;
}
alias TCITEMW* LPTCITEMW;

version(UNICODE){
	alias TCITEMW TCITEM;
	alias LPTCITEMW LPTCITEM;
}else{
	alias TCITEMA TCITEM;
	alias LPTCITEMA LPTCITEM;
}
enum {
	TCM_GETITEMA = TCM_FIRST + 5,
	TCM_GETITEMW = TCM_FIRST + 60,
}
version(UNICODE)
	enum TCM_GETITEM = TCM_GETITEMW;
else
	enum TCM_GETITEM = TCM_GETITEMA;

enum {
	TCM_SETITEMA = TCM_FIRST + 6,
	TCM_SETITEMW = TCM_FIRST + 61,
}
version(UNICODE)
	enum TCM_SETITEM = TCM_SETITEMW;
else
	enum TCM_SETITEM = TCM_SETITEMA;
enum {
	TCM_INSERTITEMA = TCM_FIRST + 7,
	TCM_INSERTITEMW = TCM_FIRST + 62,
}
version(UNICODE)
	enum TCM_INSERTITEM = TCM_INSERTITEMW;
else
	enum TCM_INSERTITEM = TCM_INSERTITEMA;

enum TCM_DELETEITEM = TCM_FIRST + 8;
enum TCM_DELETEALLITEMS = TCM_FIRST + 9;
enum TCM_GETITEMRECT = TCM_FIRST + 10;
enum TCM_GETCURSEL = TCM_FIRST + 11;
enum TCM_SETCURSEL = TCM_FIRST + 12;
enum {
	TCHT_NOWHERE     = 0x0001,
	TCHT_ONITEMICON  = 0x0002,
	TCHT_ONITEMLABEL = 0x0004,
	TCHT_ONITEM      = TCHT_ONITEMICON | TCHT_ONITEMLABEL,
}
//alias LPTCHITTESTINFO LPTC_HITTESTINFO;
//alias TCHITTESTINFO TC_HITTESTINFO;

struct TCHITTESTINFO {
	POINT pt;
	UINT flags;
}
alias TCHITTESTINFO* LPTCHITTESTINFO;

enum TCM_HITTEST = TCM_FIRST + 13;
enum TCM_SETITEMEXTRA = TCM_FIRST + 14;
enum TCM_ADJUSTRECT = TCM_FIRST + 40;
enum TCM_SETITEMSIZE = TCM_FIRST + 41;
enum TCM_REMOVEIMAGE = TCM_FIRST + 42;
enum TCM_SETPADDING = TCM_FIRST + 43;
enum TCM_GETROWCOUNT = TCM_FIRST + 44;
enum TCM_GETTOOLTIPS = TCM_FIRST + 45;
enum TCM_SETTOOLTIPS = TCM_FIRST + 46;
enum TCM_GETCURFOCUS = TCM_FIRST + 47;
enum TCM_SETCURFOCUS = TCM_FIRST + 48;
enum TCM_SETMINTABWIDTH = TCM_FIRST + 49;
enum TCM_DESELECTALL = TCM_FIRST + 50;
enum TCM_HIGHLIGHTITEM = TCM_FIRST + 51;
enum TCM_SETEXTENDEDSTYLE = TCM_FIRST + 52;
enum TCM_GETEXTENDEDSTYLE = TCM_FIRST + 53;
enum TCM_SETUNICODEFORMAT = CCM_SETUNICODEFORMAT;
enum TCM_GETUNICODEFORMAT = CCM_GETUNICODEFORMAT;


enum TCN_KEYDOWN = TCN_FIRST - 0;

//alias NMTCKEYDOWN TC_KEYDOWN;

align(1)
struct NMTCKEYDOWN {
	NMHDR hdr;
	WORD wVKey;
	UINT flags;
}
enum {
	TCN_SELCHANGE   = TCN_FIRST - 1,
	TCN_SELCHANGING = TCN_FIRST - 2,
	TCN_GETOBJECT   = TCN_FIRST - 3,
	TCN_FOCUSCHANGE = TCN_FIRST - 4,
}

version(HelperFunctions){
	HIMAGELIST TabCtrl_GetImageList(HWND hwnd)
	{
		return cast(HIMAGELIST)SendMessage(hwnd, TCM_GETIMAGELIST, 0, 0);
	}

	HIMAGELIST TabCtrl_SetImageList(HWND hwnd, HIMAGELIST himl)
	{
		return cast(HIMAGELIST)SendMessage(hwnd, TCM_SETIMAGELIST, 0, cast(LPARAM)himl);
	}

	int TabCtrl_GetItemCount(HWND hwnd)
	{
		return cast(int)SendMessage(hwnd, TCM_GETITEMCOUNT, 0, 0);
	}

	BOOL TabCtrl_GetItem(HWND hwnd, int iItem, TCITEM* pitem)
	{
		return cast(BOOL)SendMessage(hwnd, TCM_GETITEM, cast(WPARAM)iItem, cast(LPARAM)pitem);
	}

	BOOL TabCtrl_SetItem(HWND hwnd, int iItem, TCITEM* pitem)
	{
		return cast(BOOL)SendMessage(hwnd, TCM_SETITEM, cast(WPARAM)iItem, cast(LPARAM)pitem);
	}

	int TabCtrl_InsertItem(HWND hwnd, int iItem, const(TCITEM)* pitem)
	{
		return cast(int)SendMessage(hwnd, TCM_INSERTITEM, cast(WPARAM)iItem, cast(LPARAM)pitem);
	}

	BOOL TabCtrl_DeleteItem(HWND hwnd, int i)
	{
		return cast(BOOL)SendMessage(hwnd, TCM_DELETEITEM, cast(WPARAM)i, 0);
	}

	BOOL TabCtrl_DeleteAllItems(HWND hwnd)
	{
		return cast(BOOL)SendMessage(hwnd, TCM_DELETEALLITEMS, 0, 0);
	}

	BOOL TabCtrl_GetItemRect(HWND hwnd, int i, RECT* prc)
	{
		return cast(BOOL)SendMessage(hwnd, TCM_GETITEMRECT, cast(WPARAM)i, cast(LPARAM)prc);
	}

	int TabCtrl_GetCurSel(HWND hwnd)
	{
		return cast(int)SendMessage(hwnd, TCM_GETCURSEL, 0, 0);
	}

	int TabCtrl_SetCurSel(HWND hwnd, int i)
	{
		return cast(int)SendMessage(hwnd, TCM_SETCURSEL, cast(WPARAM)i, 0);
	}

	int TabCtrl_HitTest(HWND hwndTC, TCHITTESTINFO* pinfo)
	{
		return cast(int)SendMessage((hwndTC), TCM_HITTEST, 0, cast(LPARAM)pinfo);
	}

	BOOL TabCtrl_SetItemExtra(HWND hwndTC, int cb)
	{
		return cast(BOOL)SendMessage(hwndTC, TCM_SETITEMEXTRA, cast(WPARAM)cb, 0);
	}

	int TabCtrl_AdjustRect(HWND hwnd, BOOL bLarger, RECT* prc)
	{
		return cast(int)SendMessage(hwnd, TCM_ADJUSTRECT, cast(WPARAM)bLarger, cast(LPARAM)prc);
	}

	DWORD TabCtrl_SetItemSize(HWND hwnd, int x, int y)
	{
		return cast(DWORD)SendMessage(hwnd, TCM_SETITEMSIZE, 0, MAKELPARAM(cast(WORD)x, cast(WORD)y));
	}

	void TabCtrl_RemoveImage(HWND hwnd, int i)
	{
		SendMessage(hwnd, TCM_REMOVEIMAGE, i, 0);
	}

	void TabCtrl_SetPadding(HWND hwnd, int cx, int cy)
	{
		SendMessage(hwnd, TCM_SETPADDING, 0, MAKELPARAM(cast(WORD)cx, cast(WORD)cy));
	}

	int TabCtrl_GetRowCount(HWND hwnd)
	{
		return cast(int)SendMessage(hwnd, TCM_GETROWCOUNT, 0, 0);
	}

	HWND TabCtrl_GetToolTips(HWND hwnd)
	{
		return cast(HWND)SendMessage(hwnd, TCM_GETTOOLTIPS, 0, 0);
	}

	void TabCtrl_SetToolTips(HWND hwnd, HWND hwndTT)
	{
		SendMessage(hwnd, TCM_SETTOOLTIPS, cast(WPARAM)hwndTT, 0);
	}

	int TabCtrl_GetCurFocus(HWND hwnd)
	{
		return cast(int)SendMessage(hwnd, TCM_GETCURFOCUS, 0, 0);
	}

	void TabCtrl_SetCurFocus(HWND hwnd, int i)
	{
		SendMessage(hwnd, TCM_SETCURFOCUS, i, 0);
	}

	int TabCtrl_SetMinTabWidth(HWND hwnd, int x)
	{
		return cast(int)SendMessage(hwnd, TCM_SETMINTABWIDTH, 0, x);
	}

	void TabCtrl_DeselectAll(HWND hwnd, UINT fExcludeFocus)
	{
		SendMessage(hwnd, TCM_DESELECTALL, fExcludeFocus, 0);
	}

	BOOL TabCtrl_HighlightItem(HWND hwnd, int i, WORD fHighlight)
	{
		return cast(BOOL)SendMessage(hwnd, TCM_HIGHLIGHTITEM, cast(WPARAM)i, cast(LPARAM)MAKELONG(fHighlight, 0));
	}

	BOOL TabCtrl_SetExtendedStyle(HWND hwnd, DWORD dw)
	{
		return cast(DWORD)SendMessage((hwnd), TCM_SETEXTENDEDSTYLE, 0, dw);
	}

	DWORD TabCtrl_GetExtendedStyle(HWND hwnd)
	{
		return cast(DWORD)SendMessage(hwnd, TCM_GETEXTENDEDSTYLE, 0, 0);
	}

	BOOL TabCtrl_SetUnicodeFormat(HWND hwnd, BOOL fUnicode)
	{
		return cast(BOOL)SendMessage(hwnd, TCM_SETUNICODEFORMAT, cast(WPARAM)fUnicode, 0);
	}

	BOOL TabCtrl_GetUnicodeFormat(HWND hwnd)
	{
		return cast(BOOL)SendMessage(hwnd, TCM_GETUNICODEFORMAT, 0, 0);
	}
}

//-------------------------------------------------------------------
const wchar* ANIMATE_CLASSW = "SysAnimate32";
const char* ANIMATE_CLASSA = "SysAnimate32";
version(UNICODE)
	alias ANIMATE_CLASSW ANIMATE_CLASS;
else
	alias ANIMATE_CLASSA ANIMATE_CLASS;

enum {
	ACS_CENTER      = 0x0001,
	ACS_TRANSPARENT = 0x0002,
	ACS_AUTOPLAY    = 0x0004,
	ACS_TIMER       = 0x0008,
}
enum {
	ACM_OPENA = WM_USER+100,
	ACM_OPENW = WM_USER+103,
}
version(UNICODE)
	enum ACM_OPEN = ACM_OPENW;
else
	enum ACM_OPEN = ACM_OPENA;
enum {
	ACM_PLAY      = WM_USER+101,
	ACM_STOP      = WM_USER+102,
	ACM_ISPLAYING = WM_USER+104,
}
enum {
	ACN_START = 1,
	ACN_STOP  = 2,
}
version(HelperFunction){
	HWND Animate_Create(HWND hwndP, UINT id, DWORD dwStyle, HINSTANCE hInstance)
	{
		return CreateWindow(ANIMATE_CLASS, null, dwStyle, 0, 0, 0, 0, hwndP, cast(HMENU)id, hInstance, null);
	}

	BOOL Animate_Open(HWND hwnd, LPTSTR szName)
	{
		return cast(BOOL)SendMessage(hwnd, ACM_OPEN, 0, cast(LPARAM)szName);
	}

	BOOL Animate_OpenEx(HWND hwnd, HINSTANCE hInst, LPTSTR szName)
	{
		return cast(BOOL)SendMessage(hwnd, ACM_OPEN, cast(WPARAM)hInst, cast(LPARAM)szName);
	}

	BOOL Animate_Play(HWND hwnd, UINT from, UINT to, UINT rep)
	{
		return cast(BOOL)SendMessage(hwnd, ACM_PLAY, cast(WPARAM)rep, cast(LPARAM)MAKELONG(from, to));
	}

	BOOL Animate_Stop(HWND hwnd)
	{
		return cast(BOOL)SendMessage(hwnd, ACM_STOP, 0, 0);
	}

	BOOL Animate_IsPlaying(HWND hwnd)
	{
		return cast(BOOL)SendMessage(hwnd, ACM_ISPLAYING, 0, 0);
	}

	BOOL Animate_Close(HWND hwnd)
	{
		return Animate_Open(hwnd, null);
	}

	BOOL Animate_Seek(HWND hwnd, UINT frame)
	{
		return Animate_Play(hwnd, frame, frame, 1);
	}
}

//-------------------------------------------------------------------
const wchar* MONTHCAL_CLASSW = "SysMonthCal32";
const char* MONTHCAL_CLASSA = "SysMonthCal32";
version(UNICODE)
	alias MONTHCAL_CLASSW MONTHCAL_CLASS;
else
	alias MONTHCAL_CLASSA MONTHCAL_CLASS;

alias DWORD MONTHDAYSTATE;
alias MONTHDAYSTATE* LPMONTHDAYSTATE;

enum MCM_FIRST = 0x1000;

enum MCM_GETCURSEL = MCM_FIRST + 1;
enum MCM_SETCURSEL = MCM_FIRST + 2;
enum MCM_GETMAXSELCOUNT = MCM_FIRST + 3;
enum MCM_SETMAXSELCOUNT = MCM_FIRST + 4;
enum MCM_GETSELRANGE = MCM_FIRST + 5;
enum MCM_SETSELRANGE = MCM_FIRST + 6;
enum MCM_GETMONTHRANGE = MCM_FIRST + 7;
enum MCM_SETDAYSTATE = MCM_FIRST + 8;
enum MCM_GETMINREQRECT = MCM_FIRST + 9;
enum MCM_SETCOLOR = MCM_FIRST + 10;
enum MCM_GETCOLOR = MCM_FIRST + 1;
enum {
	MCSC_BACKGROUND   = 0,
	MCSC_TEXT         = 1,
	MCSC_TITLEBK      = 2,
	MCSC_TITLETEXT    = 3,
	MCSC_MONTHBK      = 4,
	MCSC_TRAILINGTEXT = 5,
}
enum MCM_SETTODAY = MCM_FIRST + 12;
enum MCM_GETTODAY = MCM_FIRST + 13;
enum MCM_HITTEST = MCM_FIRST + 14;

struct MCHITTESTINFO {
	UINT cbSize;
	POINT pt;
	UINT uHit;
	SYSTEMTIME st;
	//(NTDDI_VERSION >= NTDDI_VISTA)
		RECT rc;
		int iOffset;
		int iRow;
		int iCol;
}
alias MCHITTESTINFO* PMCHITTESTINFO;

enum MCHITTESTINFO_V1_SIZE = MCHITTESTINFO.st.offsetof + MCHITTESTINFO.st.sizeof;

enum {
	MCHT_TITLE            = 0x00010000,
	MCHT_CALENDAR         = 0x00020000,
	MCHT_TODAYLINK        = 0x00030000,
	//(NTDDI_VERSION >= NTDDI_VISTA)
		MCHT_CALENDARCONTROL = 0x00100000,
	MCHT_NEXT             = 0x01000000,
	MCHT_PREV             = 0x02000000,
	MCHT_NOWHERE          = 0x00000000,
	MCHT_TITLEBK          = MCHT_TITLE,
	MCHT_TITLEMONTH       = MCHT_TITLE | 0x0001,
	MCHT_TITLEYEAR        = MCHT_TITLE | 0x0002,
	MCHT_TITLEBTNNEXT     = MCHT_TITLE | MCHT_NEXT | 0x0003,
	MCHT_TITLEBTNPREV     = MCHT_TITLE | MCHT_PREV | 0x0003,
	MCHT_CALENDARBK       = MCHT_CALENDAR,
	MCHT_CALENDARDATE     = MCHT_CALENDAR | 0x0001,
	MCHT_CALENDARDATENEXT = MCHT_CALENDARDATE | MCHT_NEXT,
	MCHT_CALENDARDATEPREV = MCHT_CALENDARDATE | MCHT_PREV,
	MCHT_CALENDARDAY      = MCHT_CALENDAR | 0x0002,
	MCHT_CALENDARWEEKNUM  = MCHT_CALENDAR | 0x0003,
	MCHT_CALENDARDATEMIN  = MCHT_CALENDAR | 0x0004,
	MCHT_CALENDARDATEMAX  = MCHT_CALENDAR | 0x0005,
}
enum MCM_SETFIRSTDAYOFWEEK = MCM_FIRST + 15;
enum MCM_GETFIRSTDAYOFWEEK = MCM_FIRST + 16;
enum MCM_GETRANGE = MCM_FIRST + 17;
enum MCM_SETRANGE = MCM_FIRST + 18;
enum MCM_GETMONTHDELTA = MCM_FIRST + 19;
enum MCM_SETMONTHDELTA = MCM_FIRST + 20;
enum MCM_GETMAXTODAYWIDTH = MCM_FIRST + 21;
enum MCM_SETUNICODEFORMAT = CCM_SETUNICODEFORMAT;
enum MCM_GETUNICODEFORMAT = CCM_GETUNICODEFORMAT;

//(NTDDI_VERSION >= NTDDI_VISTA)
	enum {
		MCMV_MONTH   = 0,
		MCMV_YEAR    = 1,
		MCMV_DECADE  = 2,
		MCMV_CENTURY = 3,
		MCMV_MAX     = MCMV_CENTURY,
	}
	enum MCM_GETCURRENTVIEW = MCM_FIRST + 22;
	enum MCM_GETCALENDARCOUNT = MCM_FIRST + 23;
	enum {
		MCGIP_CALENDARCONTROL = 0,
		MCGIP_NEXT            = 1,
		MCGIP_PREV            = 2,
		MCGIP_FOOTER          = 3,
		MCGIP_CALENDAR        = 4,
		MCGIP_CALENDARHEADER  = 5,
		MCGIP_CALENDARBODY    = 6,
		MCGIP_CALENDARROW     = 7,
		MCGIP_CALENDARCELL    = 8,
	}
	enum {
		MCGIF_DATE = 0x00000001,
		MCGIF_RECT = 0x00000002,
		MCGIF_NAME = 0x00000004,
	}
	struct MCGRIDINFO {
		UINT cbSize;
		DWORD dwPart;
		DWORD dwFlags;
		int iCalendar;
		int iRow;
		int iCol;
		BOOL bSelected;
		SYSTEMTIME stStart;
		SYSTEMTIME stEnd;
		RECT rc;
		PWSTR pszName;
		size_t cchName;
	}
	alias MCGRIDINFO* PMCGRIDINFO;

	enum MCM_GETCALENDARGRIDINFO = MCM_FIRST + 24;
	enum MCM_GETCALID = MCM_FIRST + 27;
	enum MCM_SETCALID = MCM_FIRST + 28;
	enum MCM_SIZERECTTOMIN = MCM_FIRST + 29;
	enum MCM_SETCALENDARBORDER = MCM_FIRST + 30;
	enum MCM_GETCALENDARBORDER = MCM_FIRST + 31;
	enum MCM_SETCURRENTVIEW = MCM_FIRST + 32;

struct NMSELCHANGE {
	NMHDR nmhdr;
	SYSTEMTIME stSelStart;
	SYSTEMTIME stSelEnd;
}
alias NMSELCHANGE* LPNMSELCHANGE;

enum MCN_SELCHANGE = MCN_FIRST - 3;

struct NMDAYSTATE {
	NMHDR nmhdr;
	SYSTEMTIME stStart;
	int cDayState;
	LPMONTHDAYSTATE prgDayState;
}
alias NMDAYSTATE* LPNMDAYSTATE;

enum MCN_GETDAYSTATE = MCN_FIRST - 1;

alias NMSELCHANGE NMSELECT;
alias NMSELECT* LPNMSELECT;

enum MCN_SELECT = MCN_FIRST;

struct NMVIEWCHANGE {
	NMHDR nmhdr;
	DWORD dwOldView;
	DWORD dwNewView;
}
alias NMVIEWCHANGE* LPNMVIEWCHANGE;

enum MCN_VIEWCHANGE = MCN_FIRST - 4;

enum {
	MCS_DAYSTATE      = 0x0001,
	MCS_MULTISELECT   = 0x0002,
	MCS_WEEKNUMBERS   = 0x0004,
	MCS_NOTODAYCIRCLE = 0x0008,
	MCS_NOTODAY       = 0x0010,
	//(NTDDI_VERSION >= NTDDI_VISTA)
		MCS_NOTRAILINGDATES  = 0x0040,
		MCS_SHORTDAYSOFWEEK  = 0x0080,
		MCS_NOSELCHANGEONNAV = 0x0100,
}
enum {
	GMR_VISIBLE  = 0,
	GMR_DAYSTATE = 1,
}

version(HelperFunctions){
	BOOL MonthCal_GetCurSel(HWND hmc, LPSYSTEMTIME pst)
	{
		return cast(BOOL)SendMessage(hmc, MCM_GETCURSEL, 0, cast(LPARAM)pst);
	}

	BOOL MonthCal_SetCurSel(HWND hmc, LPSYSTEMTIME pst)
	{
		return cast(BOOL)SendMessage(hmc, MCM_SETCURSEL, 0, cast(LPARAM)pst);
	}

	DWORD MonthCal_GetMaxSelCount(HWND hmc)
	{
		return cast(DWORD)SendMessage(hmc, MCM_GETMAXSELCOUNT, 0, 0);
	}

	BOOL MonthCal_SetMaxSelCount(HWND hmc, UINT n)
	{
		return cast(BOOL)SendMessage(hmc, MCM_SETMAXSELCOUNT, cast(WPARAM)n, 0);
	}

	BOOL MonthCal_GetSelRange(HWND hmc, LPSYSTEMTIME rgst)
	{
		return cast(BOOL)SendMessage(hmc, MCM_GETSELRANGE, 0, cast(LPARAM)rgst);
	}

	BOOL MonthCal_SetSelRange(HWND hmc, LPSYSTEMTIME rgst)
	{
		return cast(BOOL)SendMessage(hmc, MCM_SETSELRANGE, 0, cast(LPARAM)rgst);
	}

	DWORD MonthCal_GetMonthRange(HWND hmc, DWORD gmr, LPSYSTEMTIME rgst)
	{
		return cast(DWORD)SendMessage(hmc, MCM_GETMONTHRANGE, cast(WPARAM)gmr, cast(LPARAM)rgst);
	}

	BOOL MonthCal_SetDayState(HWND hmc, int cbds, LPMONTHDAYSTATE rgds)
	{
		return cast(BOOL)SendMessage(hmc, MCM_SETDAYSTATE, cast(WPARAM)cbds, cast(LPARAM)rgds);
	}

	BOOL MonthCal_GetMinReqRect(HWND hmc, LPRECT prc)
	{
		return cast(BOOL)SendMessage(hmc, MCM_GETMINREQRECT, 0, cast(LPARAM)prc);
	}

	COLORREF MonthCal_SetColor(HWND hmc, int iColor, COLORREF clr)
	{
		return cast(COLORREF)SendMessage(hmc, MCM_SETCOLOR, iColor, clr);
	}

	COLORREF MonthCal_GetColor(HWND hmc, int iColor)
	{
		return cast(COLORREF)SendMessage(hmc, MCM_GETCOLOR, iColor, 0);
	}

	void MonthCal_SetToday(HWND hmc, LPSYSTEMTIME pst)
	{
		SendMessage(hmc, MCM_SETTODAY, 0, cast(LPARAM)pst);
	}

	BOOL MonthCal_GetToday(HWND hmc, LPSYSTEMTIME pst)
	{
		return cast(BOOL)SendMessage(hmc, MCM_GETTODAY, 0, cast(LPARAM)pst);
	}

	DWORD MonthCal_HitTest(HWND hmc, PMCHITTESTINFO pinfo)
	{
		return cast(DWORD)SendMessage(hmc, MCM_HITTEST, 0, cast(LPARAM)pinfo);
	}

	DWORD MonthCal_SetFirstDayOfWeek(HWND hmc, int iDay)
	{
		return cast(DWORD)SendMessage(hmc, MCM_SETFIRSTDAYOFWEEK, 0, iDay);
	}

	DWORD MonthCal_GetFirstDayOfWeek(HWND hmc)
	{
		return cast(DWORD)SendMessage(hmc, MCM_GETFIRSTDAYOFWEEK, 0, 0);
	}

	DWORD MonthCal_GetRange(HWND hmc, LPSYSTEMTIME rgst)
	{
		return cast(DWORD)SendMessage(hmc, MCM_GETRANGE, 0, cast(LPARAM)rgst);
	}

	BOOL MonthCal_SetRange(HWND hmc, DWORD gd, LPSYSTEMTIME rgst)
	{
		return cast(BOOL)SendMessage(hmc, MCM_SETRANGE, cast(WPARAM)gd, cast(LPARAM)rgst);
	}

	int MonthCal_GetMonthDelta(HWND hmc)
	{
		return cast(int)SendMessage(hmc, MCM_GETMONTHDELTA, 0, 0);
	}

	int MonthCal_SetMonthDelta(HWND hmc, int n)
	{
		return cast(int)SendMessage(hmc, MCM_SETMONTHDELTA, n, 0);
	}

	DWORD MonthCal_GetMaxTodayWidth(HWND hmc)
	{
		return cast(DWORD)SendMessage(hmc, MCM_GETMAXTODAYWIDTH, 0, 0);
	}

	BOOL MonthCal_SetUnicodeFormat(HWND hwnd, BOOL fUnicode)
	{
		return cast(BOOL)SendMessage(hwnd, MCM_SETUNICODEFORMAT, cast(WPARAM)fUnicode, 0);
	}

	BOOL MonthCal_GetUnicodeFormat(HWND hwnd)
	{
		return cast(BOOL)SendMessage(hwnd, MCM_GETUNICODEFORMAT, 0, 0);
	}

	//(NTDDI_VERSION >= NTDDI_VISTA)
		DWORD MonthCal_GetCurrentView(HWND hmc)
		{
			return cast(DWORD)SendMessage(hmc, MCM_GETCURRENTVIEW, 0, 0);
		}

		DWORD MonthCal_GetCalendarCount(HWND hmc)
		{
			return cast(DWORD)SendMessage(hmc, MCM_GETCALENDARCOUNT, 0, 0);
		}

		BOOL MonthCal_GetCalendarGridInfo(HWND hmc, MCGRIDINFO* pmcGridInfo)
		{
			return cast(BOOL)SendMessage(hmc, MCM_GETCALENDARGRIDINFO, 0, cast(LPARAM)pmcGridInfo);
		}

		CALID MonthCal_GetCALID(HWND hmc)
		{
			return cast(CALID)SendMessage(hmc, MCM_GETCALID, 0, 0);
		}

		void MonthCal_SetCALID(HWND hmc, UINT calid)
		{
			SendMessage(hmc, MCM_SETCALID, cast(WPARAM)calid, 0);
		}

		void MonthCal_SizeRectToMin(HWND hmc, RECT* prc)
		{
			SendMessage(hmc, MCM_SIZERECTTOMIN, 0, cast(LPARAM)prc);
		}

		void MonthCal_SetCalendarBorder(HWND hmc, BOOL fset, int xyborder)
		{
			SendMessage(hmc, MCM_SETCALENDARBORDER, cast(WPARAM)fset, cast(LPARAM)xyborder);
		}

		int MonthCal_GetCalendarBorder(HWND hmc)
		{
			return cast(int)SendMessage(hmc, MCM_GETCALENDARBORDER, 0, 0);
		}

		BOOL MonthCal_SetCurrentView(HWND hmc, DWORD dwNewView)
		{
			return cast(BOOL)SendMessage(hmc, MCM_SETCURRENTVIEW, 0, cast(LPARAM)dwNewView);
		}
}

//-------------------------------------------------------------------
const wchar* DATETIMEPICK_CLASSW = "SysDateTimePick32";
const char* DATETIMEPICK_CLASSA = "SysDateTimePick32";
version(UNICODE)
	alias DATETIMEPICK_CLASSW DATETIMEPICK_CLASS;
else
	alias DATETIMEPICK_CLASSA DATETIMEPICK_CLASS;

//(NTDDI_VERSION >= NTDDI_VISTA)
	struct DATETIMEPICKERINFO {
		DWORD cbSize;
		RECT rcCheck;
		DWORD stateCheck;
		RECT rcButton;
		DWORD stateButton;
		HWND hwndEdit;
		HWND hwndUD;
		HWND hwndDropDown;
	}
	alias DATETIMEPICKERINFO* LPDATETIMEPICKERINFO;

enum DTM_FIRST = 0x1000;

enum DTM_GETSYSTEMTIME = DTM_FIRST + 1;
enum DTM_SETSYSTEMTIME = DTM_FIRST + 2;
enum DTM_GETRANGE = DTM_FIRST + 3;
enum DTM_SETRANGE = DTM_FIRST + 4;
enum {
	DTM_SETFORMATA = DTM_FIRST + 5,
	DTM_SETFORMATW = DTM_FIRST + 50,
}
version(UNICODE)
	enum DTM_SETFORMAT = DTM_SETFORMATW;
else
	enum DTM_SETFORMAT = DTM_SETFORMATA;

enum DTM_SETMCCOLOR = DTM_FIRST + 6;
enum DTM_GETMCCOLOR = DTM_FIRST + 7;
enum DTM_GETMONTHCAL = DTM_FIRST + 8;
enum DTM_SETMCFONT = DTM_FIRST + 9;
enum DTM_GETMCFONT = DTM_FIRST + 10;
//(NTDDI_VERSION >= NTDDI_VISTA)
	enum DTM_SETMCSTYLE = DTM_FIRST + 11;
	enum DTM_GETMCSTYLE = DTM_FIRST + 12;
	enum DTM_CLOSEMONTHCAL = DTM_FIRST + 13;
	enum DTM_GETDATETIMEPICKERINFO = DTM_FIRST + 14;
	enum DTM_GETIDEALSIZE = DTM_FIRST + 15;

enum {
	DTS_UPDOWN                 = 0x0001,
	DTS_SHOWNONE               = 0x0002,
	DTS_SHORTDATEFORMAT        = 0x0000,
	DTS_LONGDATEFORMAT         = 0x0004,
	DTS_SHORTDATECENTURYFORMAT = 0x000C,
	DTS_TIMEFORMAT             = 0x0009,
	DTS_APPCANPARSE            = 0x0010,
	DTS_RIGHTALIGN             = 0x0020,
}

enum DTN_DATETIMECHANGE = DTN_FIRST2 - 6;
struct NMDATETIMECHANGE {
	NMHDR nmhdr;
	DWORD dwFlags;
	SYSTEMTIME st;
}
alias NMDATETIMECHANGE* LPNMDATETIMECHANGE;

enum {
	DTN_USERSTRINGA = DTN_FIRST2 - 5,
	DTN_USERSTRINGW = DTN_FIRST - 5,
}
struct NMDATETIMESTRINGA {
	NMHDR nmhdr;
	LPCSTR pszUserString;
	SYSTEMTIME st;
	DWORD dwFlags;
}
alias NMDATETIMESTRINGA* LPNMDATETIMESTRINGA;

struct NMDATETIMESTRINGW {
	NMHDR nmhdr;
	LPCWSTR pszUserString;
	SYSTEMTIME st;
	DWORD dwFlags;
}
alias NMDATETIMESTRINGW* LPNMDATETIMESTRINGW;

version(UNICODE){
	alias DTN_USERSTRINGW DTN_USERSTRING;
	alias NMDATETIMESTRINGW NMDATETIMESTRING;
	alias LPNMDATETIMESTRINGW LPNMDATETIMESTRING;
}else{
	alias DTN_USERSTRINGA DTN_USERSTRING;
	alias NMDATETIMESTRINGA NMDATETIMESTRING;
	alias LPNMDATETIMESTRINGA LPNMDATETIMESTRING;
}

enum {
	DTN_WMKEYDOWNA = DTN_FIRST2 - 4,
	DTN_WMKEYDOWNW = DTN_FIRST - 4,
}
struct NMDATETIMEWMKEYDOWNA {
	NMHDR nmhdr;
	int nVirtKey;
	LPCSTR pszFormat;
	SYSTEMTIME st;
}
alias NMDATETIMEWMKEYDOWNA* LPNMDATETIMEWMKEYDOWNA;

struct NMDATETIMEWMKEYDOWNW {
	NMHDR nmhdr;
	int nVirtKey;
	LPCWSTR pszFormat;
	SYSTEMTIME st;
}
alias NMDATETIMEWMKEYDOWNW* LPNMDATETIMEWMKEYDOWNW;

version(UNICODE){
	alias DTN_WMKEYDOWNW DTN_WMKEYDOWN;
	alias NMDATETIMEWMKEYDOWNW NMDATETIMEWMKEYDOWN;
	alias LPNMDATETIMEWMKEYDOWNW LPNMDATETIMEWMKEYDOWN;
}else{
	alias DTN_WMKEYDOWNA DTN_WMKEYDOWN;
	alias NMDATETIMEWMKEYDOWNA NMDATETIMEWMKEYDOWN;
	alias LPNMDATETIMEWMKEYDOWNA LPNMDATETIMEWMKEYDOWN;
}

enum {
	DTN_FORMATA = DTN_FIRST2 - 3,
	DTN_FORMATW = DTN_FIRST - 3,
}
struct NMDATETIMEFORMATA {
	NMHDR nmhdr;
	LPCSTR pszFormat;
	SYSTEMTIME st;
	LPCSTR pszDisplay;
	CHAR[64] szDisplay;
}
alias NMDATETIMEFORMATA* LPNMDATETIMEFORMATA;

struct NMDATETIMEFORMATW {
	NMHDR nmhdr;
	LPCWSTR pszFormat;
	SYSTEMTIME st;
	LPCWSTR pszDisplay;
	WCHAR[64] szDisplay;
}
alias NMDATETIMEFORMATW* LPNMDATETIMEFORMATW;

version(UNICODE){
	alias DTN_FORMATW DTN_FORMAT;
	alias NMDATETIMEFORMATW NMDATETIMEFORMAT;
	alias LPNMDATETIMEFORMATW LPNMDATETIMEFORMAT;
}else{
	alias DTN_FORMATA DTN_FORMAT;
	alias NMDATETIMEFORMATA NMDATETIMEFORMAT;
	alias LPNMDATETIMEFORMATA LPNMDATETIMEFORMAT;
}
enum {
	DTN_FORMATQUERYA = DTN_FIRST2 - 2,
	DTN_FORMATQUERYW = DTN_FIRST - 2,
}
struct NMDATETIMEFORMATQUERYA {
	NMHDR nmhdr;
	LPCSTR pszFormat;
	SIZE szMax;
}
alias NMDATETIMEFORMATQUERYA* LPNMDATETIMEFORMATQUERYA;

struct NMDATETIMEFORMATQUERYW {
	NMHDR nmhdr;
	LPCWSTR pszFormat;
	SIZE szMax;
}
alias NMDATETIMEFORMATQUERYW* LPNMDATETIMEFORMATQUERYW;

version(UNICODE){
	alias DTN_FORMATQUERYW DTN_FORMATQUERY;
	alias NMDATETIMEFORMATQUERYW NMDATETIMEFORMATQUERY;
	alias LPNMDATETIMEFORMATQUERYW LPNMDATETIMEFORMATQUERY;
}else{
	alias DTN_FORMATQUERYA DTN_FORMATQUERY;
	alias NMDATETIMEFORMATQUERYA NMDATETIMEFORMATQUERY;
	alias LPNMDATETIMEFORMATQUERYA LPNMDATETIMEFORMATQUERY;
}

enum {
	DTN_DROPDOWN = DTN_FIRST2 - 1,
	DTN_CLOSEUP  = DTN_FIRST2,
}
enum {
	GDTR_MIN = 0x0001,
	GDTR_MAX = 0x0002,
}
enum {
	GDT_ERROR = -1,
	GDT_VALID = 0,
	GDT_NONE  = 1,
}

version(HelperFunctions){
	DWORD DateTime_GetSystemtime(HWND hdp, LPSYSTEMTIME pst)
	{
		return cast(DWORD)SendMessage(hdp, DTM_GETSYSTEMTIME, 0, cast(LPARAM)pst);
	}

	BOOL DateTime_SetSystemtime(HWND hdp, DWORD gd, LPSYSTEMTIME pst)
	{
		return cast(BOOL)SendMessage(hdp, DTM_SETSYSTEMTIME, cast(WPARAM)gd, cast(LPARAM)pst);
	}

	DWORD DateTime_GetRange(HWND hdp, LPSYSTEMTIME rgst)
	{
		return cast(DWORD)SendMessage(hdp, DTM_GETRANGE, 0, cast(LPARAM)rgst);
	}

	BOOL DateTime_SetRange(HWND hdp, DWORD gd, LPSYSTEMTIME rgst)
	{
		return cast(BOOL)SendMessage(hdp, DTM_SETRANGE, cast(WPARAM)gd, cast(LPARAM)rgst);
	}

	BOOL DateTime_SetFormat(HWND hdp, LPCTSTR sz)
	{
		return cast(BOOL)SendMessage(hdp, DTM_SETFORMAT, 0, cast(LPARAM)sz);
	}

	COLORREF DateTime_SetMonthCalColor(HWND hdp, int iColor, COLORREF clr)
	{
		return cast(COLORREF)SendMessage(hdp, DTM_SETMCCOLOR, iColor, clr);
	}

	COLORREF DateTime_GetMonthCalColor(HWND hdp, int iColor)
	{
		return cast(COLORREF)SendMessage(hdp, DTM_GETMCCOLOR, iColor, 0);
	}

	HWND DateTime_GetMonthCal(HWND hdp)
	{
		return cast(HWND)SendMessage(hdp, DTM_GETMONTHCAL, 0, 0);
	}

	void DateTime_SetMonthCalFont(HWND hdp, HFONT hfont, BOOL fRedraw)
	{
		SendMessage(hdp, DTM_SETMCFONT, cast(WPARAM)hfont, cast(LPARAM)MAKELONG(fRedraw, 0));
	}

	HFONT DateTime_GetMonthCalFont(HWND hdp)
	{
		return cast(HFONT)SendMessage(hdp, DTM_GETMCFONT, 0, 0);
	}

	LRESULT DateTime_SetMonthCalStyle(HWND hdp, DWORD dwStyle)
	{
		return SendMessage(hdp, DTM_SETMCSTYLE, 0, cast(LPARAM)dwStyle);
	}

	LRESULT DateTime_GetMonthCalStyle(HWND hdp)
	{
		return SendMessage(hdp, DTM_GETMCSTYLE, 0, 0);
	}

	LRESULT DateTime_CloseMonthCal(HWND hdp)
	{
		return SendMessage(hdp, DTM_CLOSEMONTHCAL, 0, 0);
	}

	LRESULT DateTime_GetDateTimePickerInfo(HWND hdp, DATETIMEPICKERINFO* pdtpi)
	{
		return SendMessage(hdp, DTM_GETDATETIMEPICKERINFO, 0, cast(LPARAM)pdtpi);
	}

	BOOL DateTime_GetIdealSize(HWND hdp, SIZE* psize)
	{
		return cast(BOOL)SendMessage(hdp, DTM_GETIDEALSIZE, 0, cast(LPARAM)psize);
	}
}

//-------------------------------------------------------------------
enum {
	IPM_CLEARADDRESS = WM_USER+100,
	IPM_SETADDRESS   = WM_USER+101,
	IPM_GETADDRESS   = WM_USER+102,
	IPM_SETRANGE     = WM_USER+103,
	IPM_SETFOCUS     = WM_USER+104,
	IPM_ISBLANK      = WM_USER+105,
}

const wchar* WC_IPADDRESSW = "SysIPAddress32";
const char* WC_IPADDRESSA  = "SysIPAddress32";
version(UNICODE)
	alias WC_IPADDRESSW WC_IPADDRESS;
else
	alias WC_IPADDRESSA WC_IPADDRESS;

enum IPN_FIELDCHANGED = IPN_FIRST - 0;
struct NMIPADDRESS {
	NMHDR hdr;
	int iField;
	int iValue;
}
alias NMIPADDRESS* LPNMIPADDRESS;

pure nothrow
LPARAM MAKEIPRANGE(BYTE low, BYTE high)
{
	return cast(LPARAM)cast(WORD)((high << 8) + low);
}

pure nothrow
LPARAM MAKEIPADDRESS(BYTE b1, BYTE b2, BYTE b3, BYTE b4)
{
	return cast(LPARAM)((cast(DWORD)b1 << 24) + (cast(DWORD)b2 << 16) + (cast(DWORD)b3 << 8) + (cast(DWORD)b4));
}

pure nothrow
BYTE FIRST_IPADDRESS(LPARAM x)
{
	return cast(BYTE)(((x) >> 24) & 0xff);
}

pure nothrow
BYTE SECOND_IPADDRESS(LPARAM x)
{
	return cast(BYTE)(((x) >> 16) & 0xff);
}

pure nothrow
BYTE THIRD_IPADDRESS(LPARAM x)
{
	return cast(BYTE)(((x) >> 8) & 0xff);
}

pure nothrow
BYTE FOURTH_IPADDRESS(LPARAM x)
{
	return cast(BYTE)((x) & 0xff);
}

//-------------------------------------------------------------------
const wchar* WC_PAGESCROLLERW = "SysPager";
const char* WC_PAGESCROLLERA = "SysPager";
version(UNICODE)
	alias WC_PAGESCROLLERW WC_PAGESCROLLER;
else
	alias WC_PAGESCROLLERA WC_PAGESCROLLER;

enum {
	PGS_VERT       = 0x00000000,
	PGS_HORZ       = 0x00000001,
	PGS_AUTOSCROLL = 0x00000002,
	PGS_DRAGNDROP  = 0x00000004,
}
enum {
	PGF_INVISIBLE = 0,
	PGF_NORMAL    = 1,
	PGF_GRAYED    = 2,
	PGF_DEPRESSED = 4,
	PGF_HOT       = 8,
}
enum {
	PGB_TOPORLEFT     = 0,
	PGB_BOTTOMORRIGHT = 1,
}
enum PGM_SETCHILD = PGM_FIRST + 1;
enum PGM_RECALCSIZE = PGM_FIRST + 2;
enum PGM_FORWARDMOUSE = PGM_FIRST + 3;
enum PGM_SETBKCOLOR = PGM_FIRST + 4;
enum PGM_GETBKCOLOR = PGM_FIRST + 5;
enum PGM_SETBORDER = PGM_FIRST + 6;
enum PGM_GETBORDER = PGM_FIRST + 7;
enum PGM_SETPOS = PGM_FIRST + 8;
enum PGM_GETPOS = PGM_FIRST + 9;
enum PGM_SETBUTTONSIZE = PGM_FIRST + 10;
enum PGM_GETBUTTONSIZE = PGM_FIRST + 11;
enum PGM_GETBUTTONSTATE = PGM_FIRST + 12;
enum PGM_GETDROPTARGET = CCM_GETDROPTARGET;

enum PGN_SCROLL = PGN_FIRST - 1;
enum {
	PGF_SCROLLUP    = 1,
	PGF_SCROLLDOWN  = 2,
	PGF_SCROLLLEFT  = 4,
	PGF_SCROLLRIGHT = 8,
}
enum {
	PGK_SHIFT   = 1,
	PGK_CONTROL = 2,
	PGK_MENU    = 4,
}

align(1)
struct NMPGSCROLL {
	NMHDR hdr;
	WORD fwKeys;
	RECT rcParent;
	int iDir;
	int iXpos;
	int iYpos;
	int iScroll;
}
alias NMPGSCROLL* LPNMPGSCROLL;

enum PGN_CALCSIZE = PGN_FIRST - 2;

enum {
	PGF_CALCWIDTH  = 1,
	PGF_CALCHEIGHT = 2,
}
struct NMPGCALCSIZE {
	NMHDR hdr;
	DWORD dwFlag;
	int iWidth;
	int iHeight;
}
alias NMPGCALCSIZE* LPNMPGCALCSIZE;

enum PGN_HOTITEMCHANGE = PGN_FIRST - 3;

struct NMPGHOTITEM {
	NMHDR hdr;
	int idOld;
	int idNew;
	DWORD dwFlags;
}
alias NMPGHOTITEM* LPNMPGHOTITEM;

version(HelperFunctions){
	void Pager_SetChild(HWND hwnd, HWND hwndChild)
	{
		SendMessage(hwnd, PGM_SETCHILD, 0, cast(LPARAM)hwndChild);
	}

	void Pager_RecalcSize(HWND hwnd)
	{
		SendMessage(hwnd, PGM_RECALCSIZE, 0, 0);
	}

	void Pager_ForwardMouse(HWND hwnd, BOOL bForward)
	{
		SendMessage(hwnd, PGM_FORWARDMOUSE, cast(WPARAM)bForward, 0);
	}

	COLORREF Pager_SetBkColor(HWND hwnd, COLORREF clr)
	{
		return cast(COLORREF)SendMessage(hwnd, PGM_SETBKCOLOR, 0, cast(LPARAM)clr);
	}

	COLORREF Pager_GetBkColor(HWND hwnd)
	{
		return cast(COLORREF)SendMessage(hwnd, PGM_GETBKCOLOR, 0, 0);
	}

	int Pager_SetBorder(HWND hwnd, int iBorder)
	{
		return cast(int)SendMessage(hwnd, PGM_SETBORDER, 0, cast(LPARAM)iBorder);
	}

	int Pager_GetBorder(HWND hwnd)
	{
		return cast(int)SendMessage(hwnd, PGM_GETBORDER, 0, 0);
	}

	int Pager_SetPos(HWND hwnd, int iPos)
	{
		return cast(int)SendMessage(hwnd, PGM_SETPOS, 0, cast(LPARAM)iPos);
	}

	int Pager_GetPos(HWND hwnd)
	{
		return cast(int)SendMessage(hwnd, PGM_GETPOS, 0, 0);
	}

	int Pager_SetButtonSize(HWND hwnd, int iSize)
	{
		return cast(int)SendMessage(hwnd, PGM_SETBUTTONSIZE, 0, cast(LPARAM)iSize);
	}

	int Pager_GetButtonSize(HWND hwnd)
	{
		return cast(int)SendMessage(hwnd, PGM_GETBUTTONSIZE, 0,0);
	}

	DWORD Pager_GetButtonState(HWND hwnd, int iButton)
	{
		return cast(DWORD)SendMessage(hwnd, PGM_GETBUTTONSTATE, 0, cast(LPARAM)iButton);
	}

	void Pager_GetDropTarget(HWND hwnd, IDropTarget* ppdt)
	{
		SendMessage(hwnd, PGM_GETDROPTARGET, 0, cast(LPARAM)ppdt);
	}
}

//-------------------------------------------------------------------
const wchar* WC_NATIVEFONTCTLW = "NativeFontCtl";
const char* WC_NATIVEFONTCTLA = "NativeFontCtl";
version(UNICODE)
	alias WC_NATIVEFONTCTLW WC_NATIVEFONTCTL;
else
	alias WC_NATIVEFONTCTLA WC_NATIVEFONTCTL;

enum {
	NFS_EDIT         = 0x0001,
	NFS_STATIC       = 0x0002,
	NFS_LISTCOMBO    = 0x0004,
	NFS_BUTTON       = 0x0008,
	NFS_ALL          = 0x0010,
	NFS_USEFONTASSOC = 0x0020,
}

//-------------------------------------------------------------------
const char* WC_BUTTONA = "Button";
const wchar* WC_BUTTONW = "Button";
version(UNICODE)
	alias WC_BUTTONW WC_BUTTON;
else
	alias WC_BUTTONA WC_BUTTON;

//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	enum {
		BUTTON_IMAGELIST_ALIGN_LEFT   = 0,
		BUTTON_IMAGELIST_ALIGN_RIGHT  = 1,
		BUTTON_IMAGELIST_ALIGN_TOP    = 2,
		BUTTON_IMAGELIST_ALIGN_BOTTOM = 3,
		BUTTON_IMAGELIST_ALIGN_CENTER = 4,
	}

	struct BUTTON_IMAGELIST {
		HIMAGELIST himl;
		RECT margin;
		UINT uAlign;
	}
	alias BUTTON_IMAGELIST* PBUTTON_IMAGELIST;

	enum BCM_GETIDEALSIZE = BCM_FIRST + 0x0001;
	enum BCM_SETIMAGELIST = BCM_FIRST + 0x0002;
	enum BCM_GETIMAGELIST = BCM_FIRST + 0x0003;
	enum BCM_SETTEXTMARGIN = BCM_FIRST + 0x0004;
	enum BCM_GETTEXTMARGIN = BCM_FIRST + 0x0005;

	struct NMBCHOTITEM {
		NMHDR hdr;
		DWORD dwFlags;
	}
	alias NMBCHOTITEM* LPNMBCHOTITEM;

	enum BCN_HOTITEMCHANGE = BCN_FIRST + 0x0001;

	enum BST_HOT = 0x0200;


//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	enum {
		BST_DROPDOWNPUSHED = 0x0400,
		BS_SPLITBUTTON     = 0x0000000C,
		BS_DEFSPLITBUTTON  = 0x0000000D,
		BS_COMMANDLINK     = 0x0000000E,
		BS_DEFCOMMANDLINK  = 0x0000000F,
		BCSIF_GLYPH        = 0x0001,
		BCSIF_IMAGE        = 0x0002,
		BCSIF_STYLE        = 0x0004,
		BCSIF_SIZE         = 0x0008,
		BCSS_NOSPLIT       = 0x0001,
		BCSS_STRETCH       = 0x0002,
		BCSS_ALIGNLEFT     = 0x0004,
		BCSS_IMAGE         = 0x0008,
	}

	struct BUTTON_SPLITINFO {
		UINT mask;
		HIMAGELIST himlGlyph;
		UINT uSplitStyle;
		SIZE size;
	}
	alias BUTTON_SPLITINFO* PBUTTON_SPLITINFO;

	enum BCM_SETDROPDOWNSTATE = BCM_FIRST + 0x0006;
	enum BCM_SETSPLITINFO = BCM_FIRST + 0x0007;
	enum BCM_GETSPLITINFO = BCM_FIRST + 0x0008;

	enum BCM_SETNOTE = BCM_FIRST + 0x0009;
	enum BCM_GETNOTE = BCM_FIRST + 0x000A;
	enum BCM_GETNOTELENGTH = BCM_FIRST + 0x000B;
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		enum BCM_SETSHIELD = BCM_FIRST + 0x000C;

	const HIMAGELIST BCCL_NOGLYPH = cast(HIMAGELIST)-1;

	struct NMBCDROPDOWN {
		NMHDR hdr;
		RECT rcButton;
	}
	alias NMBCDROPDOWN* LPNMBCDROPDOWN;

	enum BCN_DROPDOWN = BCN_FIRST + 0x0002;


version(HelperFunctions){
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		BOOL Button_GetIdealSize(HWND hwnd, SIZE* psize)
		{
			return cast(BOOL)SendMessage(hwnd, BCM_GETIDEALSIZE, 0, cast(LPARAM)psize);
		}

		BOOL Button_SetImageList(HWND hwnd, PBUTTON_IMAGELIST pbuttonImagelist)
		{
			return cast(BOOL)SendMessage(hwnd, BCM_SETIMAGELIST, 0, cast(LPARAM)pbuttonImagelist);
		}

		BOOL Button_GetImageList(HWND hwnd, PBUTTON_IMAGELIST pbuttonImagelist)
		{
			return cast(BOOL)SendMessage(hwnd, BCM_GETIMAGELIST, 0, cast(LPARAM)pbuttonImagelist);
		}

		BOOL Button_SetTextMargin(HWND hwnd, RECT* pmargin)
		{
			return cast(BOOL)SendMessage(hwnd, BCM_SETTEXTMARGIN, 0, cast(LPARAM)pmargin);
		}

		BOOL Button_GetTextMargin(HWND hwnd, RECT* pmargin)
		{
			return cast(BOOL)SendMessage(hwnd, BCM_GETTEXTMARGIN, 0, cast(LPARAM)pmargin);
		}

	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		BOOL Button_SetDropDownState(HWND hwnd, BOOL fDropDown)
		{
			return cast(BOOL)SendMessage(hwnd, BCM_SETDROPDOWNSTATE, cast(WPARAM)fDropDown, 0);
		}

		BOOL Button_SetSplitInfo(HWND hwnd, BUTTON_SPLITINFO* pInfo)
		{
			return cast(BOOL)SendMessage(hwnd, BCM_SETSPLITINFO, 0, cast(LPARAM)pInfo);
		}

		BOOL Button_GetSplitInfo(HWND hwnd, BUTTON_SPLITINFO* pInfo)
		{
			return cast(BOOL)SendMessage(hwnd, BCM_GETSPLITINFO, 0, cast(LPARAM)pInfo);
		}

		BOOL Button_SetNote(HWND hwnd, PCWSTR psz)
		{
			return cast(BOOL)SendMessage(hwnd, BCM_SETNOTE, 0, cast(LPARAM)psz);
		}

		BOOL Button_GetNote(HWND hwnd, LPCWSTR psz, int pcc)
		{
			return cast(BOOL)SendMessage(hwnd, BCM_GETNOTE, cast(WPARAM)pcc, cast(LPARAM)psz);
		}

		LRESULT Button_GetNoteLength(HWND hwnd)
		{
			return cast(LRESULT)SendMessage(hwnd, BCM_GETNOTELENGTH, 0, 0);
		}

		LRESULT Button_SetElevationRequiredState(HWND hwnd, BOOL fRequired)
		{
			return cast(LRESULT)SendMessage(hwnd, BCM_SETSHIELD, 0, cast(LPARAM)fRequired);
		}
}

//-------------------------------------------------------------------
const char* WC_STATICA = "Static";
const wchar* WC_STATICW = "Static";
version(UNICODE)
	alias WC_STATICW WC_STATIC;
else
	alias WC_STATICA WC_STATIC;

//-------------------------------------------------------------------
const char* WC_EDITA = "Edit";
const wchar* WC_EDITW = "Edit";
version(UNICODE)
	alias WC_EDITW WC_EDIT;
else
	alias WC_EDITA WC_EDIT;

//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	enum EM_SETCUEBANNER = ECM_FIRST + 1;
	enum EM_GETCUEBANNER = ECM_FIRST + 2;

	struct EDITBALLOONTIP {
		DWORD cbStruct;
		LPCWSTR pszTitle;
		LPCWSTR pszText;
		INT ttiIcon;
	}
	alias EDITBALLOONTIP* PEDITBALLOONTIP;
	enum EM_SHOWBALLOONTIP = ECM_FIRST + 3;
	enum EM_HIDEBALLOONTIP = ECM_FIRST + 4;

//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	enum EM_SETHILITE = ECM_FIRST + 5;
	enum EM_GETHILITE = ECM_FIRST + 6;


version(HelperFunctions){
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		BOOL Edit_SetCueBannerText(HWND hwnd, LPCWSTR lpcwText)
		{
			return cast(BOOL)SendMessage(hwnd, EM_SETCUEBANNER, 0, cast(LPARAM)lpcwText);
		}

		BOOL Edit_SetCueBannerTextFocused(HWND hwnd, LPCWSTR lpcwText, BOOL fDrawFocused)
		{
			return cast(BOOL)SendMessage(hwnd, EM_SETCUEBANNER, cast(WPARAM)fDrawFocused, cast(LPARAM)lpcwText);
		}

		BOOL Edit_GetCueBannerText(HWND hwnd, LPCWSTR lpwText, LONG cchText)
		{
			return cast(BOOL)SendMessage(hwnd, EM_GETCUEBANNER, cast(WPARAM)lpwText, cast(LPARAM)cchText);
		}

		BOOL Edit_ShowBalloonTip(HWND hwnd, PEDITBALLOONTIP peditballoontip)
		{
			return cast(BOOL)SendMessage(hwnd, EM_SHOWBALLOONTIP, 0, cast(LPARAM)peditballoontip);
		}

		BOOL Edit_HideBalloonTip(HWND hwnd)
		{
			return cast(BOOL)SendMessage(hwnd, EM_HIDEBALLOONTIP, 0, 0);
		}

	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		void Edit_SetHilite(HWND hwndCtl, int ichStart, int ichEnd)
		{
			SendMessage(hwndCtl, EM_SETHILITE, ichStart, ichEnd);
		}

		DWORD Edit_GetHilite(HWND hwndCtl)
		{
			return cast(DWORD)SendMessage(hwndCtl, EM_GETHILITE, 0, 0);
		}
}

//-------------------------------------------------------------------
const char* WC_LISTBOXA = "ListBox";
const wchar* WC_LISTBOXW = "ListBox";
version(UNICODE)
	alias WC_LISTBOXW WC_LISTBOX;
else
	alias WC_LISTBOXA WC_LISTBOX;

const char* WC_COMBOBOXA = "ComboBox";
const wchar* WC_COMBOBOXW = "ComboBox";
version(UNICODE)
	alias WC_COMBOBOXW WC_COMBOBOX;
else
	alias WC_COMBOBOXA WC_COMBOBOX;

//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	enum {
		CB_SETMINVISIBLE = CBM_FIRST + 1,
		CB_GETMINVISIBLE = CBM_FIRST + 2,
		CB_SETCUEBANNER  = CBM_FIRST + 3,
		CB_GETCUEBANNER  = CBM_FIRST + 4,
	}
	version(HelperFunctions){
		BOOL ComboBox_SetMinVisible(HWND hwnd, int iMinVisible)
		{
			return cast(BOOL)SendMessage(hwnd, CB_SETMINVISIBLE, cast(WPARAM)iMinVisible, 0);
		}

		int ComboBox_GetMinVisible(HWND hwnd)
		{
			return cast(int)SendMessage(hwnd, CB_GETMINVISIBLE, 0, 0);
		}

		BOOL ComboBox_SetCueBannerText(HWND hwnd, LPCWSTR lpcwText)
		{
			return cast(BOOL)SendMessage(hwnd, CB_SETCUEBANNER, 0, cast(LPARAM)lpcwText);
		}

		BOOL ComboBox_GetCueBannerText(HWND hwnd, LPWSTR lpwText, int cchText)
		{
			return cast(BOOL)SendMessage(hwnd, CB_GETCUEBANNER, cast(WPARAM)lpwText, cast(LPARAM)cchText);
		}
	}

const char* WC_SCROLLBARA = "ScrollBar";
const wchar* WC_SCROLLBARW = "ScrollBar";
version(UNICODE)
	alias WC_SCROLLBARW WC_SCROLLBAR;
else
	alias WC_SCROLLBARA WC_SCROLLBAR;

//(NTDDI_VERSION >= NTDDI_VISTA)
	align(1){
		alias extern(Windows) HRESULT function(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam, LONG_PTR lpRefData) PFTASKDIALOGCALLBACK;

		enum {
			TDF_ENABLE_HYPERLINKS           = 0x0001,
			TDF_USE_HICON_MAIN              = 0x0002,
			TDF_USE_HICON_FOOTER            = 0x0004,
			TDF_ALLOW_DIALOG_CANCELLATION   = 0x0008,
			TDF_USE_COMMAND_LINKS           = 0x0010,
			TDF_USE_COMMAND_LINKS_NO_ICON   = 0x0020,
			TDF_EXPAND_FOOTER_AREA          = 0x0040,
			TDF_EXPANDED_BY_DEFAULT         = 0x0080,
			TDF_VERIFICATION_FLAG_CHECKED   = 0x0100,
			TDF_SHOW_PROGRESS_BAR           = 0x0200,
			TDF_SHOW_MARQUEE_PROGRESS_BAR   = 0x0400,
			TDF_CALLBACK_TIMER              = 0x0800,
			TDF_POSITION_RELATIVE_TO_WINDOW = 0x1000,
			TDF_RTL_LAYOUT                  = 0x2000,
			TDF_NO_DEFAULT_RADIO_BUTTON     = 0x4000,
			TDF_CAN_BE_MINIMIZED            = 0x8000
		}
		alias int TASKDIALOG_FLAGS;

		enum {
			TDM_NAVIGATE_PAGE                       = WM_USER+101,
			TDM_CLICK_BUTTON                        = WM_USER+102,
			TDM_SET_MARQUEE_PROGRESS_BAR            = WM_USER+103,
			TDM_SET_PROGRESS_BAR_STATE              = WM_USER+104,
			TDM_SET_PROGRESS_BAR_RANGE              = WM_USER+105,
			TDM_SET_PROGRESS_BAR_POS                = WM_USER+106,
			TDM_SET_PROGRESS_BAR_MARQUEE            = WM_USER+107,
			TDM_SET_ELEMENT_TEXT                    = WM_USER+108,
			TDM_CLICK_RADIO_BUTTON                  = WM_USER+110,
			TDM_ENABLE_BUTTON                       = WM_USER+111,
			TDM_ENABLE_RADIO_BUTTON                 = WM_USER+112,
			TDM_CLICK_VERIFICATION                  = WM_USER+113,
			TDM_UPDATE_ELEMENT_TEXT                 = WM_USER+114,
			TDM_SET_BUTTON_ELEVATION_REQUIRED_STATE = WM_USER+115,
			TDM_UPDATE_ICON                         = WM_USER+116
		}
		alias int TASKDIALOG_MESSAGES;

		enum  {
			TDN_CREATED                = 0,
			TDN_NAVIGATED              = 1,
			TDN_BUTTON_CLICKED         = 2,
			TDN_HYPERLINK_CLICKED      = 3,
			TDN_TIMER                  = 4,
			TDN_DESTROYED              = 5,
			TDN_RADIO_BUTTON_CLICKED   = 6,
			TDN_DIALOG_CONSTRUCTED     = 7,
			TDN_VERIFICATION_CLICKED   = 8,
			TDN_HELP                   = 9,
			TDN_EXPANDO_BUTTON_CLICKED = 10
		}
		alias int TASKDIALOG_NOTIFICATIONS;

		struct TASKDIALOG_BUTTON {
			int nButtonID;
			PCWSTR pszButtonText;
		}

		enum {
			TDE_CONTENT,
			TDE_EXPANDED_INFORMATION,
			TDE_FOOTER,
			TDE_MAIN_INSTRUCTION
		}
		alias int TASKDIALOG_ELEMENTS;

		enum {
			TDIE_ICON_MAIN,
			TDIE_ICON_FOOTER
		}
		alias int TASKDIALOG_ICON_ELEMENTS;

		const WCHAR* TD_WARNING_ICON = MAKEINTRESOURCEW(cast(WORD)-1);
		const WCHAR* TD_ERROR_ICON = MAKEINTRESOURCEW(cast(WORD)-2);
		const WCHAR* TD_INFORMATION_ICON = MAKEINTRESOURCEW(cast(WORD)-3);
		const WCHAR* TD_SHIELD_ICON = MAKEINTRESOURCEW(cast(WORD)-4);
	}

	//(NTDDI_VERSION >= NTDDI_VISTA)
		enum {
			TDCBF_OK_BUTTON     = 0x0001,
			TDCBF_YES_BUTTON    = 0x0002,
			TDCBF_NO_BUTTON     = 0x0004,
			TDCBF_CANCEL_BUTTON = 0x0008,
			TDCBF_RETRY_BUTTON  = 0x0010,
			TDCBF_CLOSE_BUTTON  = 0x0020
		}
		alias int TASKDIALOG_COMMON_BUTTON_FLAGS;

		struct TASKDIALOGCONFIG {
			UINT cbSize;
			HWND hwndParent;
			HINSTANCE hInstance;
			TASKDIALOG_FLAGS dwFlags;
			TASKDIALOG_COMMON_BUTTON_FLAGS dwCommonButtons;
			PCWSTR pszWindowTitle;
			union {
				HICON hMainIcon;
				PCWSTR pszMainIcon;
			}
			PCWSTR pszMainInstruction;
			PCWSTR pszContent;
			UINT cButtons;
			const(TASKDIALOG_BUTTON)* pButtons;
			int nDefaultButton;
			UINT cRadioButtons;
			const(TASKDIALOG_BUTTON)* pRadioButtons;
			int nDefaultRadioButton;
			PCWSTR pszVerificationText;
			PCWSTR pszExpandedInformation;
			PCWSTR pszExpandedControlText;
			PCWSTR pszCollapsedControlText;
			union {
				HICON hFooterIcon;
				PCWSTR pszFooterIcon;
			}
			PCWSTR pszFooter;
			PFTASKDIALOGCALLBACK pfCallback;
			LONG_PTR lpCallbackData;
			UINT cxWidth;
		}

static if(NTDDI_VERSION >= NTDDI_VISTA){
	export extern(Windows) HRESULT TaskDialogIndirect(const TASKDIALOGCONFIG* pTaskConfig, int* pnButton, int* pnRadioButton, BOOL* pfVerificationFlagChecked);
	export extern(Windows) HRESULT TaskDialog(HWND hwndParent, HINSTANCE hInstance, PCWSTR pszWindowTitle, PCWSTR pszMainInstruction, PCWSTR pszContent, TASKDIALOG_COMMON_BUTTON_FLAGS dwCommonButtons, PCWSTR pszIcon, int* pnButton);
}

extern(Windows) void  InitMUILanguage(LANGID uiLang);
extern(Windows) LANGID GetMUILanguage();

enum {
	DA_LAST = 0x7FFFFFFF,
	DA_ERR  = -1,
}

alias extern(Windows) int function(void* p, void* pData) PFNDAENUMCALLBACK;
alias extern(Windows) int function(const(void)* p, void* pData) PFNDAENUMCALLBACKCONST;
alias extern(Windows) int function(void* p1, void* p2, LPARAM lParam) PFNDACOMPARE;
alias extern(Windows) int function(const(void)* p1, const(void)* p2, LPARAM lParam) PFNDACOMPARECONST;

enum HDSA : void* {init = (void*).init}

export extern(Windows) HDSA DSA_Create(int cbItem, int cItemGrow);
export extern(Windows) BOOL DSA_Destroy(HDSA hdsa);
export extern(Windows) void DSA_DestroyCallback(HDSA hdsa, PFNDAENUMCALLBACK pfnCB, void* pData);

export extern(Windows) BOOL DSA_DeleteItem(HDSA hdsa, int i);
export extern(Windows) BOOL DSA_DeleteAllItems(HDSA hdsa);
export extern(Windows) void DSA_EnumCallback(HDSA hdsa, PFNDAENUMCALLBACK pfnCB, void* pData);

export extern(Windows) int DSA_InsertItem(HDSA hdsa, int i, void* pitem);
export extern(Windows) PVOID DSA_GetItemPtr(HDSA hdsa, int i);
export extern(Windows) BOOL DSA_GetItem(HDSA hdsa, int i, void* pitem);
export extern(Windows) BOOL DSA_SetItem(HDSA hdsa, int i, void* pitem);

int DSA_GetItemCount(HDSA hdsa)
{
	return *cast(int*)hdsa;
}

int DSA_AppendItem(HDSA hdsa, void* pitem)
{
	return DSA_InsertItem(hdsa, DA_LAST, pitem);
}

static if(NTDDI_VERSION >= NTDDI_VISTA){
	export extern(Windows) HDSA DSA_Clone(HDSA hdsa);
	export extern(Windows) ULONGLONG DSA_GetSize(HDSA hdsa);
	export extern(Windows) BOOL DSA_Sort(HDSA pdsa, PFNDACOMPARE pfnCompare, LPARAM lParam);
}
enum {
	DSA_APPEND = DA_LAST,
	DSA_ERR    = DA_ERR,
}
alias PFNDAENUMCALLBACK PFNDSAENUMCALLBACK;
alias PFNDAENUMCALLBACKCONST PFNDSAENUMCALLBACKCONST;
alias PFNDACOMPARE PFNDSACOMPARE;
alias PFNDACOMPARECONST PFNDSACOMPARECONST;

enum HDPA : void* {init = (void*).init}

export extern(Windows) HDPA DPA_Create(int cItemGrow);
export extern(Windows) HDPA DPA_CreateEx(int cpGrow, HANDLE hheap);
export extern(Windows) HDPA DPA_Clone(const(HDPA)hdpa, HDPA hdpaNew);
export extern(Windows) BOOL DPA_Destroy(HDPA hdpa);
export extern(Windows) void DPA_DestroyCallback(HDPA hdpa, PFNDAENUMCALLBACK pfnCB, void* pData);

export extern(Windows) PVOID DPA_DeletePtr(HDPA hdpa, int i);
export extern(Windows) BOOL DPA_DeleteAllPtrs(HDPA hdpa);
export extern(Windows) void DPA_EnumCallback(HDPA hdpa, PFNDAENUMCALLBACK pfnCB, void* pData);

export extern(Windows) BOOL DPA_Grow(HDPA pdpa, int cp);
export extern(Windows) int DPA_InsertPtr(HDPA hdpa, int i, void* p);
export extern(Windows) BOOL DPA_SetPtr(HDPA hdpa, int i, void* p);
export extern(Windows) PVOID DPA_GetPtr(HDPA hdpa, INT_PTR i);
export extern(Windows) int DPA_GetPtrIndex(HDPA hdpa, const(void)* p);

int DPA_GetPtrCount(HDPA hdpa)
{
	return *cast(int*)hdpa;
}

int DPA_SetPtrCount(HDPA hdpa, int cItems)
{
	return *cast(int*)hdpa = cItems;
}

void DPA_FastDeleteLastPtr(HDPA hdpa)
{
	 --*cast(int*)hdpa;
}

void** DPA_GetPtrPtr(HDPA hdpa)
{
	return *(cast(void***)(cast(BYTE*)hdpa + (void*).sizeof));
}

void* DPA_FastGetPtr(HDPA hdpa, int i)
{
	return DPA_GetPtrPtr(hdpa)[i];
}

int DPA_AppendPtr(HDPA hdpa, void* pitem)
{
	return DPA_InsertPtr(hdpa, DA_LAST, pitem);
}

static if(NTDDI_VERSION >= NTDDI_VISTA)
	export extern(Windows) ULONGLONG DPA_GetSize(HDPA hdpa);

export extern(Windows) BOOL DPA_Sort(HDPA hdpa, PFNDACOMPARE pfnCompare, LPARAM lParam);

struct DPASTREAMINFO {
	int iPos;
	void* pvItem;
}

alias extern(Windows) HRESULT function(DPASTREAMINFO* pinfo, IStream pstream, void* pvInstData) PFNDPASTREAM;
export extern(Windows) HRESULT DPA_LoadStream(HDPA* phdpa, PFNDPASTREAM pfn, IStream pstream, void* pvInstData);
export extern(Windows) HRESULT DPA_SaveStream(HDPA hdpa, PFNDPASTREAM pfn, IStream pstream, void* pvInstData);

enum {
	DPAM_SORTED    = 0x00000001,
	DPAM_NORMAL    = 0x00000002,
	DPAM_UNION     = 0x00000004,
	DPAM_INTERSECT = 0x00000008,
}

alias extern(Windows) void* function(UINT uMsg, void* pvDest, void* pvSrc, LPARAM lParam) PFNDPAMERGE;
alias extern(Windows) const(void)* function(UINT uMsg, const(void)* pvDest, const(void)* pvSrc, LPARAM lParam) PFNDPAMERGECONST;

enum {
	DPAMM_MERGE  = 1,
	DPAMM_DELETE = 2,
	DPAMM_INSERT = 3,
}

export extern(Windows) BOOL DPA_Merge(HDPA hdpaDest, HDPA hdpaSrc, DWORD dwFlags, PFNDACOMPARE pfnCompare, PFNDPAMERGE pfnMerge, LPARAM lParam);

enum {
	DPAS_SORTED       = 0x0001,
	DPAS_INSERTBEFORE = 0x0002,
	DPAS_INSERTAFTER  = 0x0004,
}

export extern(Windows) int DPA_Search(HDPA hdpa, void* pFind, int iStart, PFNDACOMPARE pfnCompare, LPARAM lParam, UINT options);

int DPA_SortedInsertPtr(HDPA hdpa, void* pFind, int iStart, PFNDPACOMPARE pfnCompare, LPARAM lParam, UINT options, void* pitem)
{
	return DPA_InsertPtr(hdpa, DPA_Search(hdpa, pFind, iStart, pfnCompare, lParam, (DPAS_SORTED | (options))), (pitem));
}

enum {
	DPA_APPEND = DA_LAST,
	DPA_ERR    = DA_ERR,
}

alias PFNDAENUMCALLBACK PFNDPAENUMCALLBACK;
alias PFNDAENUMCALLBACKCONST PFNDPAENUMCALLBACKCONST;
alias PFNDACOMPARE PFNDPACOMPARE;
alias PFNDACOMPARECONST PFNDPACOMPARECONST;

export extern(Windows) BOOL Str_SetPtrW(LPWSTR* ppsz, LPCWSTR psz);

enum {
	WM_MOUSEHOVER = 0x02A1,
	WM_MOUSELEAVE = 0x02A3,
}

enum {
	TME_HOVER     = 0x00000001,
	TME_LEAVE     = 0x00000002,
	TME_NONCLIENT = 0x00000010,
	TME_QUERY     = 0x40000000,
	TME_CANCEL    = 0x80000000,
}

enum HOVER_DEFAULT = 0xFFFFFFFF;

struct TRACKMOUSEEVENT {
	DWORD cbSize;
	DWORD dwFlags;
	HWND hwndTrack;
	DWORD dwHoverTime;
}
alias TRACKMOUSEEVENT* LPTRACKMOUSEEVENT;

export extern(Windows) BOOL _TrackMouseEvent(LPTRACKMOUSEEVENT lpEventTrack);

enum {
	WSB_PROP_CYVSCROLL = 0x00000001,
	WSB_PROP_CXHSCROLL = 0x00000002,
	WSB_PROP_CYHSCROLL = 0x00000004,
	WSB_PROP_CXVSCROLL = 0x00000008,
	WSB_PROP_CXHTHUMB  = 0x00000010,
	WSB_PROP_CYVTHUMB  = 0x00000020,
	WSB_PROP_VBKGCOLOR = 0x00000040,
	WSB_PROP_HBKGCOLOR = 0x00000080,
	WSB_PROP_VSTYLE    = 0x00000100,
	WSB_PROP_HSTYLE    = 0x00000200,
	WSB_PROP_WINSTYLE  = 0x00000400,
	WSB_PROP_PALETTE   = 0x00000800,
	WSB_PROP_MASK      = 0x00000FFF,
}

enum {
	FSB_FLAT_MODE    = 2,
	FSB_ENCARTA_MODE = 1,
	FSB_REGULAR_MODE = 0,
}

export extern(Windows) BOOL FlatSB_EnableScrollBar(HWND, int, UINT);
export extern(Windows) BOOL FlatSB_ShowScrollBar(HWND, int code, BOOL);
export extern(Windows) BOOL FlatSB_GetScrollRange(HWND, int code, LPINT, LPINT);
export extern(Windows) BOOL FlatSB_GetScrollInfo(HWND, int code, LPSCROLLINFO);
export extern(Windows) int FlatSB_GetScrollPos(HWND, int code);
export extern(Windows) BOOL FlatSB_GetScrollProp(HWND, int propIndex, LPINT);
version(Win64)
	export extern(Windows) BOOL FlatSB_GetScrollPropPtr(HWND, int propIndex, PINT_PTR);
else
	alias FlatSB_GetScrollProp FlatSB_GetScrollPropPtr;

export extern(Windows) int FlatSB_SetScrollPos(HWND, int code, int pos, BOOL fRedraw);
export extern(Windows) int FlatSB_SetScrollInfo(HWND, int code, LPSCROLLINFO psi, BOOL fRedraw);
export extern(Windows) int FlatSB_SetScrollRange(HWND, int code, int min, int max, BOOL fRedraw);
export extern(Windows) BOOL FlatSB_SetScrollProp(HWND, UINT index, INT_PTR newValue, BOOL);
alias FlatSB_SetScrollProp FlatSB_SetScrollPropPtr;
export extern(Windows) BOOL InitializeFlatSB(HWND);
export extern(Windows) HRESULT UninitializeFlatSB(HWND);



static if(_WIN32_WINNT >= _WIN32_WINNT_WINXP){
	alias extern(Windows) LRESULT function(HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam, UINT_PTR uIdSubclass, DWORD_PTR dwRefData) SUBCLASSPROC;
	extern(Windows) BOOL SetWindowSubclass(HWND hWnd, SUBCLASSPROC pfnSubclass, UINT_PTR uIdSubclass, DWORD_PTR dwRefData);
	extern(Windows) BOOL GetWindowSubclass(HWND hWnd, SUBCLASSPROC pfnSubclass, UINT_PTR uIdSubclass, DWORD_PTR* pdwRefData);
	extern(Windows) BOOL RemoveWindowSubclass(HWND hWnd, SUBCLASSPROC pfnSubclass, UINT_PTR uIdSubclass);
	extern(Windows) LRESULT DefSubclassProc(HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam);
}

//(NTDDI_VERSION >= NTDDI_VISTA)
	enum {
		LIM_SMALL,
		LIM_LARGE,
	}
static if(NTDDI_VERSION >= NTDDI_VISTA){
	export extern(Windows) HRESULT LoadIconMetric(HINSTANCE hinst, PCWSTR pszName, int lims, HICON* phico);
	export extern(Windows) HRESULT LoadIconWithScaleDown(HINSTANCE hinst, PCWSTR pszName, int cx, int cy, HICON* phico);
}

static if(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	extern(Windows) int DrawShadowText(HDC hdc, LPCWSTR pszText, UINT cch, RECT* prc, DWORD dwFlags, COLORREF crText, COLORREF crShadow, int ixOffset, int iyOffset);

} // extern(C)
