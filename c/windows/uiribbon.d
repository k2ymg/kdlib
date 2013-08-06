/** uiribbon.d

Converted from 'uiribbon.h'.

Version: V7.1
Authors: Koji Kishita
*/
module c.windows.uiribbon;


import c.windows.windef;
import c.windows.wtypes;
import c.windows.guiddef;
import c.windows.unknwn;
import c.windows.objidl;
import c.windows.propkeydef;
import c.windows.propidl;
import c.windows.uiribbonkeydef;


extern(C){

mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_Enabled", VT_BOOL, 1);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_LabelDescription", VT_LPWSTR, 2);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_Keytip", VT_LPWSTR, 3);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_Label", VT_LPWSTR, 4);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_TooltipDescription", VT_LPWSTR, 5);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_TooltipTitle", VT_LPWSTR, 6);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_LargeImage", VT_UNKNOWN, 7);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_LargeHighContrastImage", VT_UNKNOWN, 8);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_SmallImage", VT_UNKNOWN, 9);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_SmallHighContrastImage", VT_UNKNOWN, 10);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_CommandId", VT_UI4, 100);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_ItemsSource", VT_UNKNOWN, 101);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_Categories", VT_UNKNOWN, 102);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_CategoryId", VT_UI4, 103);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_SelectedItem", VT_UI4, 104);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_CommandType", VT_UI4, 105);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_ItemImage", VT_UNKNOWN, 106);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_BooleanValue", VT_BOOL, 200);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_DecimalValue", VT_DECIMAL, 201);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_StringValue", VT_LPWSTR, 202);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_MaxValue", VT_DECIMAL, 203);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_MinValue", VT_DECIMAL, 204);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_Increment", VT_DECIMAL, 205);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_DecimalPlaces", VT_UI4, 206);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_FormatString", VT_LPWSTR, 207);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_RepresentativeString", VT_LPWSTR, 208);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_FontProperties", VT_UNKNOWN, 300);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_FontProperties_Family", VT_LPWSTR, 301);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_FontProperties_Size", VT_DECIMAL, 302);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_FontProperties_Bold", VT_UI4, 303);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_FontProperties_Italic", VT_UI4, 304);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_FontProperties_Underline", VT_UI4, 305);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_FontProperties_Strikethrough", VT_UI4, 306);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_FontProperties_VerticalPositioning", VT_UI4, 307);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_FontProperties_ForegroundColor", VT_UI4, 308);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_FontProperties_BackgroundColor", VT_UI4, 309);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_FontProperties_ForegroundColorType", VT_UI4, 310);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_FontProperties_BackgroundColorType", VT_UI4, 311);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_FontProperties_ChangedProperties", VT_UNKNOWN, 312);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_FontProperties_DeltaSize", VT_UI4, 313);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_RecentItems", VT_ARRAY|VT_UNKNOWN, 350);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_Pinned", VT_BOOL, 351);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_Color", VT_UI4, 400);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_ColorType", VT_UI4, 401);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_ColorMode", VT_UI4, 402);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_ThemeColorsCategoryLabel", VT_LPWSTR, 403);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_StandardColorsCategoryLabel", VT_LPWSTR, 404);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_RecentColorsCategoryLabel", VT_LPWSTR, 405);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_AutomaticColorLabel", VT_LPWSTR, 406);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_NoColorLabel", VT_LPWSTR, 407);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_MoreColorsLabel", VT_LPWSTR, 408);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_ThemeColors", VT_VECTOR|VT_UI4, 409);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_StandardColors", VT_VECTOR|VT_UI4, 410);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_ThemeColorsTooltips", VT_VECTOR|VT_LPWSTR, 411);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_StandardColorsTooltips", VT_VECTOR|VT_LPWSTR, 412);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_Viewable", VT_BOOL, 1000);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_Minimized", VT_BOOL, 1001);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_QuickAccessToolbarDock", VT_UI4, 1002);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_ContextAvailable", VT_UI4, 1100);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_GlobalBackgroundColor", VT_UI4, 2000);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_GlobalHighlightColor", VT_UI4, 2001);
mixin DEFINE_UIPROPERTYKEY!("UI_PKEY_GlobalTextColor", VT_UI4, 2002);

alias DWORD UI_HSBCOLOR;

pure
UI_HSBCOLOR UI_HSB(BYTE hue, BYTE saturation, BYTE brightness)
{
	return hue | (saturation << 8) | (brightness << 16);
}

enum {
	UI_CONTEXTAVAILABILITY_NOTAVAILABLE = 0,
	UI_CONTEXTAVAILABILITY_AVAILABLE    = 1,
	UI_CONTEXTAVAILABILITY_ACTIVE       = 2
}
alias int UI_CONTEXTAVAILABILITY;

enum {
	UI_FONTPROPERTIES_NOTAVAILABLE = 0,
	UI_FONTPROPERTIES_NOTSET       = 1,
	UI_FONTPROPERTIES_SET          = 2
}
alias int UI_FONTPROPERTIES;

enum {
	UI_FONTVERTICALPOSITION_NOTAVAILABLE = 0,
	UI_FONTVERTICALPOSITION_NOTSET       = 1,
	UI_FONTVERTICALPOSITION_SUPERSCRIPT  = 2,
	UI_FONTVERTICALPOSITION_SUBSCRIPT    = 3
}
alias int UI_FONTVERTICALPOSITION;

enum {
	UI_FONTUNDERLINE_NOTAVAILABLE = 0,
	UI_FONTUNDERLINE_NOTSET       = 1,
	UI_FONTUNDERLINE_SET          = 2
}
alias int UI_FONTUNDERLINE;

enum {
	UI_FONTDELTASIZE_GROW   = 0,
	UI_FONTDELTASIZE_SHRINK = 1
}
alias int UI_FONTDELTASIZE;

enum {
	UI_CONTROLDOCK_TOP    = 1,
	UI_CONTROLDOCK_BOTTOM = 3
}
alias int UI_CONTROLDOCK;

enum {
	UI_SWATCHCOLORTYPE_NOCOLOR   = 0,
	UI_SWATCHCOLORTYPE_AUTOMATIC = 1,
	UI_SWATCHCOLORTYPE_RGB       = 2
}
alias int UI_SWATCHCOLORTYPE;

enum {
	UI_SWATCHCOLORMODE_NORMAL     = 0,
	UI_SWATCHCOLORMODE_MONOCHROME = 1
}
alias int UI_SWATCHCOLORMODE;

mixin DEFINE_GUID!("IID_IUISimplePropertySet", "c205bb48-5b1c-4219-a106-15bd0a5f24e2");
interface IUISimplePropertySet : IUnknown {
public extern(Windows):
	HRESULT GetValue(REFPROPERTYKEY key, PROPVARIANT* value);
}

mixin DEFINE_GUID!("IID_IUIRibbon", "803982ab-370a-4f7e-a9e7-8784036a6e26");
interface IUIRibbon : IUnknown {
public extern(Windows):
	HRESULT GetHeight(UINT32* cy);
	HRESULT LoadSettingsFromStream(IStream pStream);
	HRESULT SaveSettingsToStream(IStream pStream);
}

enum {
	UI_INVALIDATIONS_STATE         = 0x1,
	UI_INVALIDATIONS_VALUE         = 0x2,
	UI_INVALIDATIONS_PROPERTY      = 0x4,
	UI_INVALIDATIONS_ALLPROPERTIES = 0x8
}
alias int UI_INVALIDATIONS;

enum UI_ALL_COMMANDS = 0;

mixin DEFINE_GUID!("IID_IUIFramework", "F4F0385D-6872-43a8-AD09-4C339CB3F5C5");
interface IUIFramework : IUnknown {
public extern(Windows):
	HRESULT Initialize(HWND frameWnd, IUIApplication application);
	HRESULT Destroy();
	HRESULT LoadUI(HINSTANCE instance, LPCWSTR resourceName);
	HRESULT GetView(UINT32 viewId, REFIID riid, void** ppv);
	HRESULT GetUICommandProperty(UINT32 commandId, REFPROPERTYKEY key, PROPVARIANT* value);
	HRESULT SetUICommandProperty(UINT32 commandId, REFPROPERTYKEY key, REFPROPVARIANT value);
	HRESULT InvalidateUICommand(UINT32 commandId, UI_INVALIDATIONS flags, const(PROPERTYKEY)* key);
	HRESULT FlushPendingInvalidations();
	HRESULT SetModes(INT32 iModes);
}

mixin DEFINE_GUID!("IID_IUIContextualUI", "EEA11F37-7C46-437c-8E55-B52122B29293");
interface IUIContextualUI : IUnknown {
public extern(Windows):
	HRESULT ShowAtLocation(INT32 x, INT32 y);
}

mixin DEFINE_GUID!("IID_IUICollection", "DF4F45BF-6F9D-4dd7-9D68-D8F9CD18C4DB");
interface IUICollection : IUnknown {
public extern(Windows):
	HRESULT GetCount(UINT32* count);
	HRESULT GetItem(UINT32 index, IUnknown* item);
	HRESULT Add(IUnknown* item);
	HRESULT Insert(UINT32 index, IUnknown item);
	HRESULT RemoveAt(UINT32 index);
	HRESULT Replace(UINT32 indexReplaced, IUnknown itemReplaceWith);
	HRESULT Clear();
}

enum {
	UI_COLLECTIONCHANGE_INSERT  = 0,
	UI_COLLECTIONCHANGE_REMOVE  = 1,
	UI_COLLECTIONCHANGE_REPLACE = 2,
	UI_COLLECTIONCHANGE_RESET   = 3
}
alias int UI_COLLECTIONCHANGE;

enum UI_COLLECTION_INVALIDINDEX = 0xffffffff;

mixin DEFINE_GUID!("IID_IUICollectionChangedEvent", "6502AE91-A14D-44b5-BBD0-62AACC581D52");
interface IUICollectionChangedEvent : IUnknown {
public extern(Windows):
	HRESULT OnChanged(UI_COLLECTIONCHANGE action, UINT32 oldIndex, IUnknown oldItem, UINT32 newIndex, IUnknown newItem);
}

enum {
	UI_EXECUTIONVERB_EXECUTE       = 0,
	UI_EXECUTIONVERB_PREVIEW       = 1,
	UI_EXECUTIONVERB_CANCELPREVIEW = 2
}
alias int UI_EXECUTIONVERB;

mixin DEFINE_GUID!("IID_IUICommandHandler", "75ae0a2d-dc03-4c9f-8883-069660d0beb6");
interface IUICommandHandler : IUnknown {
public extern(Windows):
	HRESULT Execute(UINT32 commandId, UI_EXECUTIONVERB verb, const(PROPERTYKEY)* key, const(PROPVARIANT)* currentValue, IUISimplePropertySet commandExecutionProperties);
	HRESULT UpdateProperty(UINT32 commandId, REFPROPERTYKEY key, const(PROPVARIANT)* currentValue, PROPVARIANT* newValue);
}

enum {
	UI_COMMANDTYPE_UNKNOWN           = 0,
	UI_COMMANDTYPE_GROUP             = 1,
	UI_COMMANDTYPE_ACTION            = 2,
	UI_COMMANDTYPE_ANCHOR            = 3,
	UI_COMMANDTYPE_CONTEXT           = 4,
	UI_COMMANDTYPE_COLLECTION        = 5,
	UI_COMMANDTYPE_COMMANDCOLLECTION = 6,
	UI_COMMANDTYPE_DECIMAL           = 7,
	UI_COMMANDTYPE_BOOLEAN           = 8,
	UI_COMMANDTYPE_FONT              = 9,
	UI_COMMANDTYPE_RECENTITEMS       = 10,
	UI_COMMANDTYPE_COLORANCHOR       = 11,
	UI_COMMANDTYPE_COLORCOLLECTION   = 12
}
alias int UI_COMMANDTYPE;

enum {
	UI_VIEWTYPE_RIBBON	= 1
}
alias int UI_VIEWTYPE;

enum {
	UI_VIEWVERB_CREATE  = 0,
	UI_VIEWVERB_DESTROY = 1,
	UI_VIEWVERB_SIZE    = 2,
	UI_VIEWVERB_ERROR   = 3
}
alias int UI_VIEWVERB;

mixin DEFINE_GUID!("IID_IUIApplication", "D428903C-729A-491d-910D-682A08FF2522");
interface IUIApplication : IUnknown {
public extern(Windows):
	HRESULT OnViewChanged(UINT32 viewId, UI_VIEWTYPE typeID, IUnknown view, UI_VIEWVERB verb, INT32 uReasonCode);
	HRESULT OnCreateUICommand(UINT32 commandId, UI_COMMANDTYPE typeID, IUICommandHandler* commandHandler);
	HRESULT OnDestroyUICommand(UINT32 commandId, UI_COMMANDTYPE typeID, IUICommandHandler commandHandler);
}

mixin DEFINE_GUID!("IID_IUIImage", "23c8c838-4de6-436b-ab01-5554bb7c30dd");
interface IUIImage : IUnknown {
public extern(Windows):
	HRESULT GetBitmap(HBITMAP* bitmap);
}

enum {
	UI_OWNERSHIP_TRANSFER = 0,
	UI_OWNERSHIP_COPY     = 1
}
alias int UI_OWNERSHIP;

mixin DEFINE_GUID!("IID_IUIImageFromBitmap", "18aba7f3-4c1c-4ba2-bf6c-f5c3326fa816");
interface IUIImageFromBitmap : IUnknown {
public extern(Windows):
	HRESULT CreateImage(HBITMAP bitmap, UI_OWNERSHIP options, IUIImage* image);
}

pure
int UI_MAKEAPPMODE(int x)
{
	return 1 << x;
}

mixin DEFINE_GUID!("CLSID_UIRibbonFramework", 0x926749fa, 0x2615, 0x4987, 0x88, 0x45, 0xc3, 0x3e, 0x65, 0xf2, 0xb9, 0x57);
mixin DEFINE_GUID!("CLSID_UIRibbonImageFromBitmapFactory", 0x0f7434b6, 0x59b6, 0x4250, 0x99, 0x9e, 0xd1, 0x68, 0xd6, 0xae, 0x42, 0x93);
mixin DEFINE_GUID!("LIBID_UIRibbon", 0x942f35c2, 0xe83b, 0x45ef, 0xb0, 0x85, 0xac, 0x29, 0x5d, 0xd6, 0x3d, 0x5b);

//extern(C) const IID LIBID_UIRibbon;
//extern(C) const CLSID CLSID_UIRibbonFramework;
//class DECLSPEC_UUID("926749fa-2615-4987-8845-c33e65f2b957") UIRibbonFramework;
//extern(C) const CLSID CLSID_UIRibbonImageFromBitmapFactory;
//class DECLSPEC_UUID("0F7434B6-59B6-4250-999E-D168D6AE4293") UIRibbonImageFromBitmapFactory;


}// extern(C)
