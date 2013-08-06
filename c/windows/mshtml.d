/** mshtml.d

Converted from 'mshtml.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.mshtml;


import c.windows.windef;
import c.windows.wtypes;
import c.windows.guiddef;
import c.windows.unknwn;
import c.windows.oaidl;
import c.windows.dispex;
import c.windows.objidl;
import c.windows.rpcdcep;
import c.windows.imm;
import c.windows.dimm;
import c.windows.wingdi;


extern(C){

extern extern(C) const GUID CMDSETID_Forms3;
extern extern(C) const GUID CLSID_MHTMLDocument;
extern extern(C) const GUID CLSID_HTADocument;
extern extern(C) const GUID CLSID_HTMLApplication;
extern extern(C) const GUID CLSID_HTMLPluginDocument;
mixin DEFINE_GUID!("SID_SEditCommandTarget", 0x3050f4b5, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b);
mixin DEFINE_GUID!("CGID_EditStateCommands", 0x3050f4b6, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b);
mixin DEFINE_GUID!("SID_SHTMLEditHost", 0x3050f6a0, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b);
mixin DEFINE_GUID!("SID_SHTMLEditServices", 0x3050f7f9, 0x98b5, 0x11cf, 0xbb, 0x82, 0x00, 0xaa, 0x00, 0xbd, 0xce, 0x0b);

enum {
	COOKIEACTION_NONE      = 0x00000000,
	COOKIEACTION_ACCEPT    = 0x00000001,
	COOKIEACTION_REJECT    = 0x00000002,
	COOKIEACTION_DOWNGRADE = 0x00000004,
	COOKIEACTION_LEASH     = 0x00000008,
	COOKIEACTION_SUPPRESS  = 0x00000010,
	COOKIEACTION_READ      = 0x00000020,
}

enum {
	PRIVACY_URLISTOPLEVEL         = 0x00010000,
	PRIVACY_URLHASCOMPACTPOLICY   = 0x00020000,
	PRIVACY_URLHASPOSTDATA        = 0x00080000,
	PRIVACY_URLHASPOLICYREFLINK   = 0x00100000,
	PRIVACY_URLHASPOLICYREFHEADER = 0x00200000,
	PRIVACY_URLHASP3PHEADER       = 0x00400000,
}

//extern extern(C) const IID IID_IHTMLFiltersCollection;
mixin DEFINE_IID!(IHTMLFiltersCollection, "3050f3ee-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLFiltersCollection : IDispatch {
public extern(Windows):
	HRESULT get_length(int* p);
	HRESULT get__newEnum(IUnknown* p);
	HRESULT item(VARIANT* pvarIndex, VARIANT* pvarResult);
}

//extern extern(C) const IID IID_IIE70DispatchEx;
mixin DEFINE_IID!(IIE70DispatchEx, "3051046b-98b5-11cf-bb82-00aa00bdce0b");
interface IIE70DispatchEx : IDispatchEx {
public extern(Windows):
}

//extern extern(C) const IID IID_IIE80DispatchEx;
mixin DEFINE_IID!(IIE80DispatchEx, "3051046c-98b5-11cf-bb82-00aa00bdce0b");
interface IIE80DispatchEx : IDispatchEx {
public extern(Windows):
}

enum {
	htmlDesignModeInherit = -2,
	htmlDesignModeOn      = -1,
	htmlDesignModeOff     = 0,
	htmlDesignMode_Max    = 2147483647
}
alias int htmlDesignMode;

enum {
	htmlZOrderFront = 0,
	htmlZOrderBack  = 1,
	htmlZOrder_Max  = 2147483647
}
alias int htmlZOrder;

enum {
	htmlClearNotSet = 0,
	htmlClearAll    = 1,
	htmlClearLeft   = 2,
	htmlClearRight  = 3,
	htmlClearBoth   = 4,
	htmlClearNone   = 5,
	htmlClear_Max   = 2147483647
}
alias int htmlClear;

enum {
	htmlControlAlignNotSet    = 0,
	htmlControlAlignLeft      = 1,
	htmlControlAlignCenter    = 2,
	htmlControlAlignRight     = 3,
	htmlControlAlignTextTop   = 4,
	htmlControlAlignAbsMiddle = 5,
	htmlControlAlignBaseline  = 6,
	htmlControlAlignAbsBottom = 7,
	htmlControlAlignBottom    = 8,
	htmlControlAlignMiddle    = 9,
	htmlControlAlignTop       = 10,
	htmlControlAlign_Max      = 2147483647
}
alias int htmlControlAlign;

enum {
	htmlBlockAlignNotSet  = 0,
	htmlBlockAlignLeft    = 1,
	htmlBlockAlignCenter  = 2,
	htmlBlockAlignRight   = 3,
	htmlBlockAlignJustify = 4,
	htmlBlockAlign_Max    = 2147483647
}
alias int htmlBlockAlign;

enum {
	htmlReadyStateuninitialized = 0,
	htmlReadyStateloading       = 1,
	htmlReadyStateloaded        = 2,
	htmlReadyStateinteractive   = 3,
	htmlReadyStatecomplete      = 4,
	htmlReadyState_Max          = 2147483647
}
alias int htmlReadyState;

enum {
	htmlLoopLoopInfinite = -1,
	htmlLoop_Max         = 2147483647
}
alias int htmlLoop;

enum {
	mediaTypeNotSet     = 0,
	mediaTypeAll        = 511,
	mediaTypeAural      = 1,
	mediaTypeBraille    = 2,
	mediaTypeEmbossed   = 4,
	mediaTypeHandheld   = 8,
	mediaTypePrint      = 16,
	mediaTypeProjection = 32,
	mediaTypeScreen     = 64,
	mediaTypeTty        = 128,
	mediaTypeTv         = 256,
	mediaType_Max       = 2147483647
}
alias int mediaType;

enum {
	DomConstructorObject                      = 0,
	DomConstructorAttr                        = 1,
	DomConstructorBehaviorUrnsCollection      = 2,
	DomConstructorBookmarkCollection          = 3,
	DomConstructorCompatibleInfo              = 4,
	DomConstructorCompatibleInfoCollection    = 5,
	DomConstructorControlRangeCollection      = 6,
	DomConstructorCSSCurrentStyleDeclaration  = 7,
	DomConstructorCSSRuleList                 = 8,
	DomConstructorCSSRuleStyleDeclaration     = 9,
	DomConstructorCSSStyleDeclaration         = 10,
	DomConstructorCSSStyleRule                = 11,
	DomConstructorCSSStyleSheet               = 12,
	DomConstructorDataTransfer                = 13,
	DomConstructorDOMImplementation           = 14,
	DomConstructorElement                     = 15,
	DomConstructorEvent                       = 16,
	DomConstructorHistory                     = 17,
	DomConstructorHTCElementBehaviorDefaults  = 18,
	DomConstructorHTMLAnchorElement           = 19,
	DomConstructorHTMLAreaElement             = 20,
	DomConstructorHTMLAreasCollection         = 21,
	DomConstructorHTMLBaseElement             = 22,
	DomConstructorHTMLBaseFontElement         = 23,
	DomConstructorHTMLBGSoundElement          = 24,
	DomConstructorHTMLBlockElement            = 25,
	DomConstructorHTMLBodyElement             = 26,
	DomConstructorHTMLBRElement               = 27,
	DomConstructorHTMLButtonElement           = 28,
	DomConstructorHTMLCollection              = 29,
	DomConstructorHTMLCommentElement          = 30,
	DomConstructorHTMLDDElement               = 31,
	DomConstructorHTMLDivElement              = 32,
	DomConstructorHTMLDocument                = 33,
	DomConstructorHTMLDListElement            = 34,
	DomConstructorHTMLDTElement               = 35,
	DomConstructorHTMLEmbedElement            = 36,
	DomConstructorHTMLFieldSetElement         = 37,
	DomConstructorHTMLFontElement             = 38,
	DomConstructorHTMLFormElement             = 39,
	DomConstructorHTMLFrameElement            = 40,
	DomConstructorHTMLFrameSetElement         = 41,
	DomConstructorHTMLGenericElement          = 42,
	DomConstructorHTMLHeadElement             = 43,
	DomConstructorHTMLHeadingElement          = 44,
	DomConstructorHTMLHRElement               = 45,
	DomConstructorHTMLHtmlElement             = 46,
	DomConstructorHTMLIFrameElement           = 47,
	DomConstructorHTMLImageElement            = 48,
	DomConstructorHTMLInputElement            = 49,
	DomConstructorHTMLIsIndexElement          = 50,
	DomConstructorHTMLLabelElement            = 51,
	DomConstructorHTMLLegendElement           = 52,
	DomConstructorHTMLLIElement               = 53,
	DomConstructorHTMLLinkElement             = 54,
	DomConstructorHTMLMapElement              = 55,
	DomConstructorHTMLMarqueeElement          = 56,
	DomConstructorHTMLMetaElement             = 57,
	DomConstructorHTMLModelessDialog          = 58,
	DomConstructorHTMLNamespaceInfo           = 59,
	DomConstructorHTMLNamespaceInfoCollection = 60,
	DomConstructorHTMLNextIdElement           = 61,
	DomConstructorHTMLNoShowElement           = 62,
	DomConstructorHTMLObjectElement           = 63,
	DomConstructorHTMLOListElement            = 64,
	DomConstructorHTMLOptionElement           = 65,
	DomConstructorHTMLParagraphElement        = 66,
	DomConstructorHTMLParamElement            = 67,
	DomConstructorHTMLPhraseElement           = 68,
	DomConstructorHTMLPluginsCollection       = 69,
	DomConstructorHTMLPopup                   = 70,
	DomConstructorHTMLScriptElement           = 71,
	DomConstructorHTMLSelectElement           = 72,
	DomConstructorHTMLSpanElement             = 73,
	DomConstructorHTMLStyleElement            = 74,
	DomConstructorHTMLTableCaptionElement     = 75,
	DomConstructorHTMLTableCellElement        = 76,
	DomConstructorHTMLTableColElement         = 77,
	DomConstructorHTMLTableElement            = 78,
	DomConstructorHTMLTableRowElement         = 79,
	DomConstructorHTMLTableSectionElement     = 80,
	DomConstructorHTMLTextAreaElement         = 81,
	DomConstructorHTMLTextElement             = 82,
	DomConstructorHTMLTitleElement            = 83,
	DomConstructorHTMLUListElement            = 84,
	DomConstructorHTMLUnknownElement          = 85,
	DomConstructorImage                       = 86,
	DomConstructorLocation                    = 87,
	DomConstructorNamedNodeMap                = 88,
	DomConstructorNavigator                   = 89,
	DomConstructorNodeList                    = 90,
	DomConstructorOption                      = 91,
	DomConstructorScreen                      = 92,
	DomConstructorSelection                   = 93,
	DomConstructorStaticNodeList              = 94,
	DomConstructorStorage                     = 95,
	DomConstructorStyleSheetList              = 96,
	DomConstructorStyleSheetPage              = 97,
	DomConstructorStyleSheetPageList          = 98,
	DomConstructorText                        = 99,
	DomConstructorTextRange                   = 100,
	DomConstructorTextRangeCollection         = 101,
	DomConstructorTextRectangle               = 102,
	DomConstructorTextRectangleList           = 103,
	DomConstructorWindow                      = 104,
	DomConstructorXDomainRequest              = 105,
	DomConstructorXMLHttpRequest              = 106,
	DomConstructorMax                         = 107,
	DomConstructor_Max                        = 2147483647
}
alias int DomConstructor;

enum {
	styleTextTransformNotSet     = 0,
	styleTextTransformCapitalize = 1,
	styleTextTransformLowercase  = 2,
	styleTextTransformUppercase  = 3,
	styleTextTransformNone       = 4,
	styleTextTransform_Max       = 2147483647
}
alias int styleTextTransform;

enum {
	styleDataRepeatNone  = 0,
	styleDataRepeatInner = 1,
	styleDataRepeat_Max  = 2147483647
}
alias int styleDataRepeat;

enum {
	styleOverflowNotSet  = 0,
	styleOverflowAuto    = 1,
	styleOverflowHidden  = 2,
	styleOverflowVisible = 3,
	styleOverflowScroll  = 4,
	styleOverflow_Max    = 2147483647
}
alias int styleOverflow;

enum {
	styleTableLayoutNotSet = 0,
	styleTableLayoutAuto   = 1,
	styleTableLayoutFixed  = 2,
	styleTableLayout_Max   = 2147483647
}
alias int styleTableLayout;

enum {
	styleBorderCollapseNotSet   = 0,
	styleBorderCollapseSeparate = 1,
	styleBorderCollapseCollapse = 2,
	styleBorderCollapse_Max     = 2147483647
}
alias int styleBorderCollapse;

enum {
	styleCaptionSideNotSet = 0,
	styleCaptionSideTop    = 1,
	styleCaptionSideBottom = 2,
	styleCaptionSideLeft   = 3,
	styleCaptionSideRight  = 4,
	styleCaptionSide_Max   = 2147483647
}
alias int styleCaptionSide;

enum {
	styleEmptyCellsNotSet = 0,
	styleEmptyCellsShow   = 1,
	styleEmptyCellsHide   = 2,
	styleEmptyCells_Max   = 2147483647
}
alias int styleEmptyCells;

enum {
	styleFontStyleNotSet  = 0,
	styleFontStyleItalic  = 1,
	styleFontStyleOblique = 2,
	styleFontStyleNormal  = 3,
	styleFontStyle_Max    = 2147483647
}
alias int styleFontStyle;

enum {
	styleFontVariantNotSet    = 0,
	styleFontVariantSmallCaps = 1,
	styleFontVariantNormal    = 2,
	styleFontVariant_Max      = 2147483647
}
alias int styleFontVariant;

enum {
	styleBackgroundRepeatRepeat   = 0,
	styleBackgroundRepeatRepeatX  = 1,
	styleBackgroundRepeatRepeatY  = 2,
	styleBackgroundRepeatNoRepeat = 3,
	styleBackgroundRepeatNotSet   = 4,
	styleBackgroundRepeat_Max     = 2147483647
}
alias int styleBackgroundRepeat;

enum {
	styleBackgroundAttachmentFixed  = 0,
	styleBackgroundAttachmentScroll = 1,
	styleBackgroundAttachmentNotSet = 2,
	styleBackgroundAttachment_Max   = 2147483647
}
alias int styleBackgroundAttachment;

enum {
	styleVerticalAlignAuto       = 0,
	styleVerticalAlignBaseline   = 1,
	styleVerticalAlignSub        = 2,
	styleVerticalAlignSuper      = 3,
	styleVerticalAlignTop        = 4,
	styleVerticalAlignTextTop    = 5,
	styleVerticalAlignMiddle     = 6,
	styleVerticalAlignBottom     = 7,
	styleVerticalAlignTextBottom = 8,
	styleVerticalAlignInherit    = 9,
	styleVerticalAlignNotSet     = 10,
	styleVerticalAlign_Max       = 2147483647
}
alias int styleVerticalAlign;

enum {
	styleFontWeightNotSet  = 0,
	styleFontWeight100     = 1,
	styleFontWeight200     = 2,
	styleFontWeight300     = 3,
	styleFontWeight400     = 4,
	styleFontWeight500     = 5,
	styleFontWeight600     = 6,
	styleFontWeight700     = 7,
	styleFontWeight800     = 8,
	styleFontWeight900     = 9,
	styleFontWeightNormal  = 10,
	styleFontWeightBold    = 11,
	styleFontWeightBolder  = 12,
	styleFontWeightLighter = 13,
	styleFontWeight_Max    = 2147483647
}
alias int styleFontWeight;

enum {
	styleBackgroundPositionXNotSet = 0,
	styleBackgroundPositionXLeft   = 1,
	styleBackgroundPositionXCenter = 2,
	styleBackgroundPositionXRight  = 3,
	styleBackgroundPositionX_Max   = 2147483647
}
alias int styleBackgroundPositionX;

enum {
	styleBackgroundPositionYNotSet = 0,
	styleBackgroundPositionYTop    = 1,
	styleBackgroundPositionYCenter = 2,
	styleBackgroundPositionYBottom = 3,
	styleBackgroundPositionY_Max   = 2147483647
}
alias int styleBackgroundPositionY;

enum {
	styleFontSizeXXSmall = 0,
	styleFontSizeXSmall  = 1,
	styleFontSizeSmall   = 2,
	styleFontSizeMedium  = 3,
	styleFontSizeLarge   = 4,
	styleFontSizeXLarge  = 5,
	styleFontSizeXXLarge = 6,
	styleFontSizeSmaller = 7,
	styleFontSizeLarger  = 8,
	styleFontSize_Max    = 2147483647
}
alias int styleFontSize;

enum {
	styleZIndexAuto = -2147483647,
	styleZIndex_Max = 2147483647
}
alias int styleZIndex;

enum {
	styleWidowsOrphansNotSet = -2147483647,
	styleWidowsOrphans_Max   = 2147483647
}
alias int styleWidowsOrphans;

enum {
	styleAutoAuto = 0,
	styleAuto_Max = 2147483647
}
alias int styleAuto;

enum {
	styleNoneNone = 0,
	styleNone_Max = 2147483647
}
alias int styleNone;

enum {
	styleNormalNormal = 0,
	styleNormal_Max   = 2147483647
}
alias int styleNormal;

enum {
	styleBorderWidthThin   = 0,
	styleBorderWidthMedium = 1,
	styleBorderWidthThick  = 2,
	styleBorderWidth_Max   = 2147483647
}
alias int styleBorderWidth;

enum {
	stylePositionNotSet   = 0,
	stylePositionstatic   = 1,
	stylePositionrelative = 2,
	stylePositionabsolute = 3,
	stylePositionfixed    = 4,
	stylePosition_Max     = 2147483647
}
alias int stylePosition;

enum {
	styleBorderStyleNotSet      = 0,
	styleBorderStyleDotted      = 1,
	styleBorderStyleDashed      = 2,
	styleBorderStyleSolid       = 3,
	styleBorderStyleDouble      = 4,
	styleBorderStyleGroove      = 5,
	styleBorderStyleRidge       = 6,
	styleBorderStyleInset       = 7,
	styleBorderStyleOutset      = 8,
	styleBorderStyleWindowInset = 9,
	styleBorderStyleNone        = 10,
	styleBorderStyleHidden      = 11,
	styleBorderStyle_Max        = 2147483647
}
alias int styleBorderStyle;

enum {
	styleStyleFloatNotSet = 0,
	styleStyleFloatLeft   = 1,
	styleStyleFloatRight  = 2,
	styleStyleFloatNone   = 3,
	styleStyleFloat_Max   = 2147483647
}
alias int styleStyleFloat;

enum {
	styleDisplayNotSet            = 0,
	styleDisplayBlock             = 1,
	styleDisplayInline            = 2,
	styleDisplayListItem          = 3,
	styleDisplayNone              = 4,
	styleDisplayTableHeaderGroup  = 5,
	styleDisplayTableFooterGroup  = 6,
	styleDisplayInlineBlock       = 7,
	styleDisplayTable             = 8,
	styleDisplayInlineTable       = 9,
	styleDisplayTableRow          = 10,
	styleDisplayTableRowGroup     = 11,
	styleDisplayTableColumn       = 12,
	styleDisplayTableColumnGroup  = 13,
	styleDisplayTableCell         = 14,
	styleDisplayTableCaption      = 15,
	styleDisplayRunIn             = 16,
	styleDisplayRuby              = 17,
	styleDisplayRubyBase          = 18,
	styleDisplayRubyText          = 19,
	styleDisplayRubyBaseContainer = 20,
	styleDisplayRubyTextContainer = 21,
	styleDisplay_Max              = 2147483647
}
alias int styleDisplay;

enum {
	styleVisibilityNotSet   = 0,
	styleVisibilityInherit  = 1,
	styleVisibilityVisible  = 2,
	styleVisibilityHidden   = 3,
	styleVisibilityCollapse = 4,
	styleVisibility_Max     = 2147483647
}
alias int styleVisibility;

enum {
	styleListStyleTypeNotSet             = 0,
	styleListStyleTypeDisc               = 1,
	styleListStyleTypeCircle             = 2,
	styleListStyleTypeSquare             = 3,
	styleListStyleTypeDecimal            = 4,
	styleListStyleTypeLowerRoman         = 5,
	styleListStyleTypeUpperRoman         = 6,
	styleListStyleTypeLowerAlpha         = 7,
	styleListStyleTypeUpperAlpha         = 8,
	styleListStyleTypeNone               = 9,
	styleListStyleTypeDecimalLeadingZero = 10,
	styleListStyleTypeGeorgian           = 11,
	styleListStyleTypeArmenian           = 12,
	styleListStyleTypeUpperLatin         = 13,
	styleListStyleTypeLowerLatin         = 14,
	styleListStyleTypeUpperGreek         = 15,
	styleListStyleTypeLowerGreek         = 16,
	styleListStyleType_Max               = 2147483647
}
alias int styleListStyleType;

enum {
	styleListStylePositionNotSet  = 0,
	styleListStylePositionInside  = 1,
	styleListStylePositionOutSide = 2,
	styleListStylePosition_Max    = 2147483647
}
alias int styleListStylePosition;

enum {
	styleWhiteSpaceNotSet  = 0,
	styleWhiteSpaceNormal  = 1,
	styleWhiteSpacePre     = 2,
	styleWhiteSpaceNowrap  = 3,
	styleWhiteSpacePreline = 4,
	styleWhiteSpacePrewrap = 5,
	styleWhiteSpace_Max    = 2147483647
}
alias int styleWhiteSpace;

enum {
	stylePageBreakNotSet = 0,
	stylePageBreakAuto   = 1,
	stylePageBreakAlways = 2,
	stylePageBreakLeft   = 3,
	stylePageBreakRight  = 4,
	stylePageBreakAvoid  = 5,
	stylePageBreak_Max   = 2147483647
}
alias int stylePageBreak;

enum {
	stylePageBreakInsideNotSet = 0,
	stylePageBreakInsideAuto   = 1,
	stylePageBreakInsideAvoid  = 2,
	stylePageBreakInside_Max   = 2147483647
}
alias int stylePageBreakInside;

enum {
	styleCursorAuto          = 0,
	styleCursorCrosshair     = 1,
	styleCursorDefault       = 2,
	styleCursorHand          = 3,
	styleCursorMove          = 4,
	styleCursorE_resize      = 5,
	styleCursorNe_resize     = 6,
	styleCursorNw_resize     = 7,
	styleCursorN_resize      = 8,
	styleCursorSe_resize     = 9,
	styleCursorSw_resize     = 10,
	styleCursorS_resize      = 11,
	styleCursorW_resize      = 12,
	styleCursorText          = 13,
	styleCursorWait          = 14,
	styleCursorHelp          = 15,
	styleCursorPointer       = 16,
	styleCursorProgress      = 17,
	styleCursorNot_allowed   = 18,
	styleCursorNo_drop       = 19,
	styleCursorVertical_text = 20,
	styleCursorall_scroll    = 21,
	styleCursorcol_resize    = 22,
	styleCursorrow_resize    = 23,
	styleCursorcustom        = 24,
	styleCursorNotSet        = 25,
	styleCursor_Max          = 2147483647
}
alias int styleCursor;

enum {
	styleDirNotSet      = 0,
	styleDirLeftToRight = 1,
	styleDirRightToLeft = 2,
	styleDirInherit     = 3,
	styleDir_Max        = 2147483647
}
alias int styleDir;

enum {
	styleBidiNotSet   = 0,
	styleBidiNormal   = 1,
	styleBidiEmbed    = 2,
	styleBidiOverride = 3,
	styleBidiInherit  = 4,
	styleBidi_Max     = 2147483647
}
alias int styleBidi;

enum {
	styleImeModeAuto     = 0,
	styleImeModeActive   = 1,
	styleImeModeInactive = 2,
	styleImeModeDisabled = 3,
	styleImeModeNotSet   = 4,
	styleImeMode_Max     = 2147483647
}
alias int styleImeMode;

enum {
	styleRubyAlignNotSet           = 0,
	styleRubyAlignAuto             = 1,
	styleRubyAlignLeft             = 2,
	styleRubyAlignCenter           = 3,
	styleRubyAlignRight            = 4,
	styleRubyAlignDistributeLetter = 5,
	styleRubyAlignDistributeSpace  = 6,
	styleRubyAlignLineEdge         = 7,
	styleRubyAlign_Max             = 2147483647
}
alias int styleRubyAlign;

enum {
	styleRubyPositionNotSet = 0,
	styleRubyPositionAbove  = 1,
	styleRubyPositionInline = 2,
	styleRubyPosition_Max   = 2147483647
}
alias int styleRubyPosition;

enum {
	styleRubyOverhangNotSet     = 0,
	styleRubyOverhangAuto       = 1,
	styleRubyOverhangWhitespace = 2,
	styleRubyOverhangNone       = 3,
	styleRubyOverhang_Max       = 2147483647
}
alias int styleRubyOverhang;

enum {
	styleLayoutGridCharNotSet = 0,
	styleLayoutGridCharAuto   = 1,
	styleLayoutGridCharNone   = 2,
	styleLayoutGridChar_Max   = 2147483647
}
alias int styleLayoutGridChar;

enum {
	styleLayoutGridLineNotSet = 0,
	styleLayoutGridLineAuto   = 1,
	styleLayoutGridLineNone   = 2,
	styleLayoutGridLine_Max   = 2147483647
}
alias int styleLayoutGridLine;

enum {
	styleLayoutGridModeNotSet = 0,
	styleLayoutGridModeChar   = 1,
	styleLayoutGridModeLine   = 2,
	styleLayoutGridModeBoth   = 3,
	styleLayoutGridModeNone   = 4,
	styleLayoutGridMode_Max   = 2147483647
}
alias int styleLayoutGridMode;

enum {
	styleLayoutGridTypeNotSet = 0,
	styleLayoutGridTypeLoose  = 1,
	styleLayoutGridTypeStrict = 2,
	styleLayoutGridTypeFixed  = 3,
	styleLayoutGridType_Max   = 2147483647
}
alias int styleLayoutGridType;

enum {
	styleLineBreakNotSet = 0,
	styleLineBreakNormal = 1,
	styleLineBreakStrict = 2,
	styleLineBreak_Max   = 2147483647
}
alias int styleLineBreak;

enum {
	styleWordBreakNotSet   = 0,
	styleWordBreakNormal   = 1,
	styleWordBreakBreakAll = 2,
	styleWordBreakKeepAll  = 3,
	styleWordBreak_Max     = 2147483647
}
alias int styleWordBreak;

enum {
	styleWordWrapNotSet = 0,
	styleWordWrapOff    = 1,
	styleWordWrapOn     = 2,
	styleWordWrap_Max   = 2147483647
}
alias int styleWordWrap;

enum {
	styleTextJustifyNotSet             = 0,
	styleTextJustifyInterWord          = 1,
	styleTextJustifyNewspaper          = 2,
	styleTextJustifyDistribute         = 3,
	styleTextJustifyDistributeAllLines = 4,
	styleTextJustifyInterIdeograph     = 5,
	styleTextJustifyInterCluster       = 6,
	styleTextJustifyKashida            = 7,
	styleTextJustifyAuto               = 8,
	styleTextJustify_Max               = 2147483647
}
alias int styleTextJustify;

enum {
	styleTextAlignLastNotSet  = 0,
	styleTextAlignLastLeft    = 1,
	styleTextAlignLastCenter  = 2,
	styleTextAlignLastRight   = 3,
	styleTextAlignLastJustify = 4,
	styleTextAlignLastAuto    = 5,
	styleTextAlignLast_Max    = 2147483647
}
alias int styleTextAlignLast;

enum {
	styleTextJustifyTrimNotSet       = 0,
	styleTextJustifyTrimNone         = 1,
	styleTextJustifyTrimPunctuation  = 2,
	styleTextJustifyTrimPunctAndKana = 3,
	styleTextJustifyTrim_Max         = 2147483647
}
alias int styleTextJustifyTrim;

enum {
	styleAcceleratorFalse = 0,
	styleAcceleratorTrue  = 1,
	styleAccelerator_Max  = 2147483647
}
alias int styleAccelerator;

enum {
	styleLayoutFlowHorizontal          = 0,
	styleLayoutFlowVerticalIdeographic = 1,
	styleLayoutFlowNotSet              = 2,
	styleLayoutFlow_Max                = 2147483647
}
alias int styleLayoutFlow;

enum {
	styleBlockProgressionTb     = 0,
	styleBlockProgressionRl     = 1,
	styleBlockProgressionBt     = 2,
	styleBlockProgressionLr     = 3,
	styleBlockProgressionNotSet = 4,
	styleBlockProgression_Max   = 2147483647
}
alias int styleBlockProgression;

enum {
	styleWritingModeLrtb   = 0,
	styleWritingModeTbrl   = 1,
	styleWritingModeRltb   = 2,
	styleWritingModeBtrl   = 3,
	styleWritingModeNotSet = 4,
	styleWritingModeTblr   = 5,
	styleWritingModeBtlr   = 6,
	styleWritingModeLrbt   = 7,
	styleWritingModeRlbt   = 8,
	styleWritingMode_Max   = 2147483647
}
alias int styleWritingMode;

enum {
	styleBoolFalse = 0,
	styleBoolTrue  = 1,
	styleBool_Max  = 2147483647
}
alias int styleBool;

enum {
	styleTextUnderlinePositionBelow  = 0,
	styleTextUnderlinePositionAbove  = 1,
	styleTextUnderlinePositionAuto   = 2,
	styleTextUnderlinePositionNotSet = 3,
	styleTextUnderlinePosition_Max   = 2147483647
}
alias int styleTextUnderlinePosition;

enum {
	styleTextOverflowClip     = 0,
	styleTextOverflowEllipsis = 1,
	styleTextOverflowNotSet   = 2,
	styleTextOverflow_Max     = 2147483647
}
alias int styleTextOverflow;

enum {
	styleInterpolationNotSet = 0,
	styleInterpolationNN     = 1,
	styleInterpolationBCH    = 2,
	styleInterpolation_Max   = 2147483647
}
alias int styleInterpolation;

enum {
	styleBoxSizingNotSet     = 0,
	styleBoxSizingContentBox = 1,
	styleBoxSizingBorderBox  = 2,
	styleBoxSizing_Max       = 2147483647
}
alias int styleBoxSizing;

extern extern(C) const GUID CLSID_CStyle;
extern extern(C) const GUID CLSID_CRuleStyle;

enum {
	styleTextLineThroughStyleUndefined = 0,
	styleTextLineThroughStyleSingle    = 1,
	styleTextLineThroughStyleDouble    = 2,
	styleTextLineThroughStyle_Max      = 2147483647
}
alias int styleTextLineThroughStyle;

enum {
	styleTextUnderlineStyleUndefined        = 0,
	styleTextUnderlineStyleSingle           = 1,
	styleTextUnderlineStyleDouble           = 2,
	styleTextUnderlineStyleWords            = 3,
	styleTextUnderlineStyleDotted           = 4,
	styleTextUnderlineStyleThick            = 5,
	styleTextUnderlineStyleDash             = 6,
	styleTextUnderlineStyleDotDash          = 7,
	styleTextUnderlineStyleDotDotDash       = 8,
	styleTextUnderlineStyleWave             = 9,
	styleTextUnderlineStyleSingleAccounting = 10,
	styleTextUnderlineStyleDoubleAccounting = 11,
	styleTextUnderlineStyleThickDash        = 12,
	styleTextUnderlineStyle_Max             = 2147483647
}
alias int styleTextUnderlineStyle;

enum {
	styleTextEffectNone    = 0,
	styleTextEffectEmboss  = 1,
	styleTextEffectEngrave = 2,
	styleTextEffectOutline = 3,
	styleTextEffect_Max    = 2147483647
}
alias int styleTextEffect;

enum {
	styleDefaultTextSelectionFalse = 0,
	styleDefaultTextSelectionTrue  = 1,
	styleDefaultTextSelection_Max  = 2147483647
}
alias int styleDefaultTextSelection;

enum {
	styleTextDecorationNone        = 0,
	styleTextDecorationUnderline   = 1,
	styleTextDecorationOverline    = 2,
	styleTextDecorationLineThrough = 3,
	styleTextDecorationBlink       = 4,
	styleTextDecoration_Max        = 2147483647
}
alias int styleTextDecoration;

extern extern(C) const GUID CLSID_CRenderStyle;

enum {
	textDecorationNone        = 0,
	textDecorationUnderline   = 1,
	textDecorationOverline    = 2,
	textDecorationLineThrough = 3,
	textDecorationBlink       = 4,
	textDecoration_Max        = 2147483647
}
alias int textDecoration;

extern extern(C) const GUID CLSID_CCurrentStyle;

extern extern(C) const GUID CLSID_CAttribute;
extern extern(C) const GUID CLSID_CDOMTextNode;
extern extern(C) const GUID CLSID_CDOMImplementation;
extern extern(C) const GUID CLSID_CAttrCollectionator;
extern extern(C) const GUID CLSID_CStaticNodeList;
extern extern(C) const GUID CLSID_CDOMChildrenCollection;

enum {
	htmlListTypeNotSet     = 0,
	htmlListTypeLargeAlpha = 1,
	htmlListTypeSmallAlpha = 2,
	htmlListTypeLargeRoman = 3,
	htmlListTypeSmallRoman = 4,
	htmlListTypeNumbers    = 5,
	htmlListTypeDisc       = 6,
	htmlListTypeCircle     = 7,
	htmlListTypeSquare     = 8,
	htmlListType_Max       = 2147483647
}
alias int htmlListType;

enum {
	htmlMethodNotSet = 0,
	htmlMethodGet    = 1,
	htmlMethodPost   = 2,
	htmlMethod_Max   = 2147483647
}
alias int htmlMethod;

enum {
	htmlWrapOff  = 1,
	htmlWrapSoft = 2,
	htmlWrapHard = 3,
	htmlWrap_Max = 2147483647
}
alias int htmlWrap;

enum {
	htmlDirNotSet      = 0,
	htmlDirLeftToRight = 1,
	htmlDirRightToLeft = 2,
	htmlDir_Max        = 2147483647
}
alias int htmlDir;

enum {
	htmlEditableInherit = 0,
	htmlEditableTrue    = 1,
	htmlEditableFalse   = 2,
	htmlEditable_Max    = 2147483647
}
alias int htmlEditable;

enum {
	htmlInputNotSet         = 0,
	htmlInputButton         = 1,
	htmlInputCheckbox       = 2,
	htmlInputFile           = 3,
	htmlInputHidden         = 4,
	htmlInputImage          = 5,
	htmlInputPassword       = 6,
	htmlInputRadio          = 7,
	htmlInputReset          = 8,
	htmlInputSelectOne      = 9,
	htmlInputSelectMultiple = 10,
	htmlInputSubmit         = 11,
	htmlInputText           = 12,
	htmlInputTextarea       = 13,
	htmlInputRichtext       = 14,
	htmlInput_Max           = 2147483647
}
alias int htmlInput;

enum {
	htmlEncodingURL       = 0,
	htmlEncodingMultipart = 1,
	htmlEncodingText      = 2,
	htmlEncoding_Max      = 2147483647
}
alias int htmlEncoding;

enum {
	htmlAdjacencyBeforeBegin = 1,
	htmlAdjacencyAfterBegin  = 2,
	htmlAdjacencyBeforeEnd   = 3,
	htmlAdjacencyAfterEnd    = 4,
	htmlAdjacency_Max        = 2147483647
}
alias int htmlAdjacency;

enum {
	htmlTabIndexNotSet = -32768,
	htmlTabIndex_Max   = 2147483647
}
alias int htmlTabIndex;

enum {
	htmlComponentClient        = 0,
	htmlComponentSbLeft        = 1,
	htmlComponentSbPageLeft    = 2,
	htmlComponentSbHThumb      = 3,
	htmlComponentSbPageRight   = 4,
	htmlComponentSbRight       = 5,
	htmlComponentSbUp          = 6,
	htmlComponentSbPageUp      = 7,
	htmlComponentSbVThumb      = 8,
	htmlComponentSbPageDown    = 9,
	htmlComponentSbDown        = 10,
	htmlComponentSbLeft2       = 11,
	htmlComponentSbPageLeft2   = 12,
	htmlComponentSbRight2      = 13,
	htmlComponentSbPageRight2  = 14,
	htmlComponentSbUp2         = 15,
	htmlComponentSbPageUp2     = 16,
	htmlComponentSbDown2       = 17,
	htmlComponentSbPageDown2   = 18,
	htmlComponentSbTop         = 19,
	htmlComponentSbBottom      = 20,
	htmlComponentOutside       = 21,
	htmlComponentGHTopLeft     = 22,
	htmlComponentGHLeft        = 23,
	htmlComponentGHTop         = 24,
	htmlComponentGHBottomLeft  = 25,
	htmlComponentGHTopRight    = 26,
	htmlComponentGHBottom      = 27,
	htmlComponentGHRight       = 28,
	htmlComponentGHBottomRight = 29,
	htmlComponent_Max          = 2147483647
}
alias int htmlComponent;

enum {
	htmlApplyLocationInside  = 0,
	htmlApplyLocationOutside = 1,
	htmlApplyLocation_Max    = 2147483647
}
alias int htmlApplyLocation;

enum {
	htmlGlyphModeNone  = 0,
	htmlGlyphModeBegin = 1,
	htmlGlyphModeEnd   = 2,
	htmlGlyphModeBoth  = 3,
	htmlGlyphMode_Max  = 2147483647
}
alias int htmlGlyphMode;

extern extern(C) const GUID CLSID_CDefaults;

extern extern(C) const GUID CLSID_CHtmlComponentDD;
extern extern(C) const GUID CLSID_CHtmlComponentProperty;
extern extern(C) const GUID CLSID_CHtmlComponentMethod;
extern extern(C) const GUID CLSID_CHtmlComponentEvent;
extern extern(C) const GUID CLSID_CHtmlComponentAttach;
extern extern(C) const GUID CLSID_CHtmlComponentDesc;
extern extern(C) const GUID CLSID_CPeerUrnCollection;
extern extern(C) const GUID CLSID_CGenericElement;
extern extern(C) const GUID CLSID_CStyleSheetRule;
extern extern(C) const GUID CLSID_CStyleSheetRuleArray;
extern extern(C) const GUID CLSID_CStyleSheetPage;
extern extern(C) const GUID CLSID_CStyleSheetPageArray;

extern extern(C) const GUID CLSID_CStyleSheet;
extern extern(C) const GUID CLSID_CStyleSheetArray;
extern extern(C) const GUID CLSID_CLinkElement;

enum {
	htmlUnitCharacter = 1,
	htmlUnitWord      = 2,
	htmlUnitSentence  = 3,
	htmlUnitTextEdit  = 6,
	htmlUnit_Max      = 2147483647
}
alias int htmlUnit;

enum {
	htmlEndPointsStartToStart = 1,
	htmlEndPointsStartToEnd   = 2,
	htmlEndPointsEndToStart   = 3,
	htmlEndPointsEndToEnd     = 4,
	htmlEndPoints_Max         = 2147483647
}
alias int htmlEndPoints;

enum {
	htmlDirectionForward  = 99999,
	htmlDirectionBackward = -99999,
	htmlDirection_Max     = 2147483647
}
alias int htmlDirection;

extern extern(C) const GUID CLSID_CFormElement;

enum {
	htmlStartfileopen  = 0,
	htmlStartmouseover = 1,
	htmlStart_Max      = 2147483647
}
alias int htmlStart;

extern extern(C) const GUID CLSID_CTextElement;
extern extern(C) const GUID CLSID_CImgElement;
extern extern(C) const GUID CLSID_CImageElementFactory;
extern extern(C) const GUID CLSID_CXMLHttpRequest;
extern extern(C) const GUID CLSID_CXMLHttpRequestFactory;

enum {
	bodyScrollyes     = 1,
	bodyScrollno      = 2,
	bodyScrollauto    = 4,
	bodyScrolldefault = 3,
	bodyScroll_Max    = 2147483647
}
alias int bodyScroll;

extern extern(C) const GUID CLSID_CBodyElement;
extern extern(C) const GUID CLSID_CFontElement;
extern extern(C) const GUID CLSID_CAnchorElement;
extern extern(C) const GUID CLSID_CLabelElement;
extern extern(C) const GUID CLSID_CListElement;
extern extern(C) const GUID CLSID_CUListElement;
extern extern(C) const GUID CLSID_COListElement;
extern extern(C) const GUID CLSID_CLIElement;
extern extern(C) const GUID CLSID_CBlockElement;
extern extern(C) const GUID CLSID_CDivElement;
extern extern(C) const GUID CLSID_CDDElement;
extern extern(C) const GUID CLSID_CDTElement;
extern extern(C) const GUID CLSID_CBRElement;
extern extern(C) const GUID CLSID_CDListElement;
extern extern(C) const GUID CLSID_CHRElement;
extern extern(C) const GUID CLSID_CParaElement;
extern extern(C) const GUID CLSID_CElementCollection;
extern extern(C) const GUID CLSID_CHeaderElement;

enum {
	htmlSelectTypeSelectOne      = 1,
	htmlSelectTypeSelectMultiple = 2,
	htmlSelectType_Max           = 2147483647
}
alias int htmlSelectType;

enum {
	htmlSelectExFlagNone                  = 0,
	htmlSelectExFlagHideSelectionInDesign = 0x1,
	htmlSelectExFlag_Max                  = 2147483647
}
alias int htmlSelectExFlag;

extern extern(C) const GUID CLSID_CSelectElement;
extern extern(C) const GUID CLSID_CWndSelectElement;

enum {
	htmlSelectionNone    = 0,
	htmlSelectionText    = 1,
	htmlSelectionControl = 2,
	htmlSelectionTable   = 3,
	htmlSelection_Max    = 2147483647
}
alias int htmlSelection;

extern extern(C) const GUID CLSID_COptionElement;
extern extern(C) const GUID CLSID_COptionElementFactory;
extern extern(C) const GUID CLSID_CWndOptionElement;
extern extern(C) const GUID CLSID_CInput;
extern extern(C) const GUID CLSID_CTextArea;
extern extern(C) const GUID CLSID_CRichtext;
extern extern(C) const GUID CLSID_CButton;

enum {
	htmlMarqueeBehaviorscroll    = 1,
	htmlMarqueeBehaviorslide     = 2,
	htmlMarqueeBehavioralternate = 3,
	htmlMarqueeBehavior_Max      = 2147483647
}
alias int htmlMarqueeBehavior;

enum {
	htmlMarqueeDirectionleft  = 1,
	htmlMarqueeDirectionright = 3,
	htmlMarqueeDirectionup    = 5,
	htmlMarqueeDirectiondown  = 7,
	htmlMarqueeDirection_Max  = 2147483647
}
alias int htmlMarqueeDirection;

extern extern(C) const GUID CLSID_CMarquee;
extern extern(C) const GUID CLSID_CHtmlElement;
extern extern(C) const GUID CLSID_CHeadElement;
extern extern(C) const GUID CLSID_CTitleElement;
extern extern(C) const GUID CLSID_CMetaElement;
extern extern(C) const GUID CLSID_CBaseElement;
extern extern(C) const GUID CLSID_CIsIndexElement;
extern extern(C) const GUID CLSID_CNextIdElement;
extern extern(C) const GUID CLSID_CBaseFontElement;
extern extern(C) const GUID CLSID_CUnknownElement;
extern extern(C) const GUID CLSID_COmHistory;
//extern extern(C) const GUID CLSID_CMimeTypes; defined below
//extern extern(C) const GUID CLSID_CPlugins; defined below
//extern extern(C) const GUID CLSID_COpsProfile; defined below
extern extern(C) const GUID CLSID_COmNavigator;
extern extern(C) const GUID CLSID_COmLocation;

enum {
	htmlPersistStateNormal   = 0,
	htmlPersistStateFavorite = 1,
	htmlPersistStateHistory  = 2,
	htmlPersistStateSnapshot = 3,
	htmlPersistStateUserData = 4,
	htmlPersistState_Max     = 2147483647
}
alias int htmlPersistState;

enum {
	htmlDropEffectCopy = 0,
	htmlDropEffectLink = 1,
	htmlDropEffectMove = 2,
	htmlDropEffectNone = 3,
	htmlDropEffect_Max = 2147483647
}
alias int htmlDropEffect;

enum {
	htmlEffectAllowedCopy          = 0,
	htmlEffectAllowedLink          = 1,
	htmlEffectAllowedMove          = 2,
	htmlEffectAllowedCopyLink      = 3,
	htmlEffectAllowedCopyMove      = 4,
	htmlEffectAllowedLinkMove      = 5,
	htmlEffectAllowedAll           = 6,
	htmlEffectAllowedNone          = 7,
	htmlEffectAllowedUninitialized = 8,
	htmlEffectAllowed_Max          = 2147483647
}
alias int htmlEffectAllowed;

//extern extern(C) const GUID CLSID_CEventObj; defined below

extern extern(C) const GUID CLSID_CFramesCollection;
extern extern(C) const GUID CLSID_CScreen;
extern extern(C) const GUID CLSID_CWindow;
extern extern(C) const GUID CLSID_COmWindowProxy;
extern extern(C) const GUID CLSID_CDocumentVersion;
extern extern(C) const GUID CLSID_CDocumentVersionCollection;

enum {
	htmlCompatModeBackCompat = 0,
	htmlCompatModeCSS1Compat = 1,
	htmlCompatMode_Max       = 2147483647
}
alias int htmlCompatMode;

extern extern(C) const GUID CLSID_CDocument;
extern extern(C) const GUID CLSID_CScriptlet;

enum {
	True          = 1,
	False         = 0,
	BoolValue_Max = 2147483647
}
alias int BoolValue;

extern extern(C) const GUID CLSID_CPluginSite;
extern extern(C) const GUID CLSID_CAreasCollection;
extern extern(C) const GUID CLSID_CMapElement;
extern extern(C) const GUID CLSID_CAreaElement;

enum {
	htmlCaptionAlignNotSet  = 0,
	htmlCaptionAlignLeft    = 1,
	htmlCaptionAlignCenter  = 2,
	htmlCaptionAlignRight   = 3,
	htmlCaptionAlignJustify = 4,
	htmlCaptionAlignTop     = 5,
	htmlCaptionAlignBottom  = 6,
	htmlCaptionAlign_Max    = 2147483647
}
alias int htmlCaptionAlign;

enum {
	htmlCaptionVAlignNotSet = 0,
	htmlCaptionVAlignTop    = 1,
	htmlCaptionVAlignBottom = 2,
	htmlCaptionVAlign_Max   = 2147483647
}
alias int htmlCaptionVAlign;

extern extern(C) const GUID CLSID_CTableCaption;
extern extern(C) const GUID CLSID_CCommentElement;
extern extern(C) const GUID CLSID_CPhraseElement;
extern extern(C) const GUID CLSID_CSpanElement;

enum {
	htmlFrameNotSet = 0,
	htmlFramevoid   = 1,
	htmlFrameabove  = 2,
	htmlFramebelow  = 3,
	htmlFramehsides = 4,
	htmlFramelhs    = 5,
	htmlFramerhs    = 6,
	htmlFramevsides = 7,
	htmlFramebox    = 8,
	htmlFrameborder = 9,
	htmlFrame_Max   = 2147483647
}
alias int htmlFrame;

enum {
	htmlRulesNotSet = 0,
	htmlRulesnone   = 1,
	htmlRulesgroups = 2,
	htmlRulesrows   = 3,
	htmlRulescols   = 4,
	htmlRulesall    = 5,
	htmlRules_Max   = 2147483647
}
alias int htmlRules;

enum {
	htmlCellAlignNotSet = 0,
	htmlCellAlignLeft   = 1,
	htmlCellAlignCenter = 2,
	htmlCellAlignRight  = 3,
	htmlCellAlignMiddle = htmlCellAlignCenter,
	htmlCellAlign_Max   = 2147483647
}
alias int htmlCellAlign;

enum {
	htmlCellVAlignNotSet   = 0,
	htmlCellVAlignTop      = 1,
	htmlCellVAlignMiddle   = 2,
	htmlCellVAlignBottom   = 3,
	htmlCellVAlignBaseline = 4,
	htmlCellVAlignCenter   = htmlCellVAlignMiddle,
	htmlCellVAlign_Max     = 2147483647
}
alias int htmlCellVAlign;

extern extern(C) const GUID CLSID_CTable;
extern extern(C) const GUID CLSID_CTableCol;
extern extern(C) const GUID CLSID_CTableSection;
extern extern(C) const GUID CLSID_CTableRow;
extern extern(C) const GUID CLSID_CTableCell;
extern extern(C) const GUID CLSID_CScriptElement;
extern extern(C) const GUID CLSID_CNoShowElement;
extern extern(C) const GUID CLSID_CObjectElement;
extern extern(C) const GUID CLSID_CParamElement;

enum {
	frameScrollingyes  = 1,
	frameScrollingno   = 2,
	frameScrollingauto = 4,
	frameScrolling_Max = 2147483647
}
alias int frameScrolling;

extern extern(C) const GUID CLSID_CFrameSite;
extern extern(C) const GUID CLSID_CFrameElement;
extern extern(C) const GUID CLSID_CIFrameElement;
extern extern(C) const GUID CLSID_C1DElement;
extern extern(C) const GUID CLSID_CFieldSetElement;
extern extern(C) const GUID CLSID_CLegendElement;
extern extern(C) const GUID CLSID_CSpanSite;
extern extern(C) const GUID CLSID_CFrameSetSite;
extern extern(C) const GUID CLSID_CBGsound;
extern extern(C) const GUID CLSID_CStyleElement;
extern extern(C) const GUID CLSID_CFontFace;
extern extern(C) const GUID CLSID_CXDomainRequest;
extern extern(C) const GUID CLSID_CXDomainRequestFactory;
extern extern(C) const GUID CLSID_CStorage;

enum {
	ELEMENT_CORNER_NONE        = 0,
	ELEMENT_CORNER_TOP         = 1,
	ELEMENT_CORNER_LEFT        = 2,
	ELEMENT_CORNER_BOTTOM      = 3,
	ELEMENT_CORNER_RIGHT       = 4,
	ELEMENT_CORNER_TOPLEFT     = 5,
	ELEMENT_CORNER_TOPRIGHT    = 6,
	ELEMENT_CORNER_BOTTOMLEFT  = 7,
	ELEMENT_CORNER_BOTTOMRIGHT = 8,
	ELEMENT_CORNER_Max         = 2147483647
}
alias int ELEMENT_CORNER;

enum {
	SUHV_PROMPTBEFORENO             = 0x1,
	SUHV_SILENTYES                  = 0x2,
	SUHV_UNSECURESOURCE             = 0x4,
	SECUREURLHOSTVALIDATE_FLAGS_Max = 2147483647
}
alias int SECUREURLHOSTVALIDATE_FLAGS;

enum {
	POINTER_GRAVITY_Left  = 0,
	POINTER_GRAVITY_Right = 1,
	POINTER_GRAVITY_Max   = 2147483647
}
alias int POINTER_GRAVITY;

enum {
	ELEM_ADJ_BeforeBegin  = 0,
	ELEM_ADJ_AfterBegin   = 1,
	ELEM_ADJ_BeforeEnd    = 2,
	ELEM_ADJ_AfterEnd     = 3,
	ELEMENT_ADJACENCY_Max = 2147483647
}
alias int ELEMENT_ADJACENCY;

enum {
	CONTEXT_TYPE_None       = 0,
	CONTEXT_TYPE_Text       = 1,
	CONTEXT_TYPE_EnterScope = 2,
	CONTEXT_TYPE_ExitScope  = 3,
	CONTEXT_TYPE_NoScope    = 4,
	MARKUP_CONTEXT_TYPE_Max = 2147483647
}
alias int 	MARKUP_CONTEXT_TYPE;

enum {
	FINDTEXT_BACKWARDS      = 0x1,
	FINDTEXT_WHOLEWORD      = 0x2,
	FINDTEXT_MATCHCASE      = 0x4,
	FINDTEXT_RAW            = 0x20000,
	FINDTEXT_MATCHDIAC      = 0x20000000,
	FINDTEXT_MATCHKASHIDA   = 0x40000000,
	FINDTEXT_MATCHALEFHAMZA = 0x80000000,
	FINDTEXT_FLAGS_Max      = 2147483647
}
alias int FINDTEXT_FLAGS;

enum {
	MOVEUNIT_PREVCHAR         = 0,
	MOVEUNIT_NEXTCHAR         = 1,
	MOVEUNIT_PREVCLUSTERBEGIN = 2,
	MOVEUNIT_NEXTCLUSTERBEGIN = 3,
	MOVEUNIT_PREVCLUSTEREND   = 4,
	MOVEUNIT_NEXTCLUSTEREND   = 5,
	MOVEUNIT_PREVWORDBEGIN    = 6,
	MOVEUNIT_NEXTWORDBEGIN    = 7,
	MOVEUNIT_PREVWORDEND      = 8,
	MOVEUNIT_NEXTWORDEND      = 9,
	MOVEUNIT_PREVPROOFWORD    = 10,
	MOVEUNIT_NEXTPROOFWORD    = 11,
	MOVEUNIT_NEXTURLBEGIN     = 12,
	MOVEUNIT_PREVURLBEGIN     = 13,
	MOVEUNIT_NEXTURLEND       = 14,
	MOVEUNIT_PREVURLEND       = 15,
	MOVEUNIT_PREVSENTENCE     = 16,
	MOVEUNIT_NEXTSENTENCE     = 17,
	MOVEUNIT_PREVBLOCK        = 18,
	MOVEUNIT_NEXTBLOCK        = 19,
	MOVEUNIT_ACTION_Max       = 2147483647
}
alias int MOVEUNIT_ACTION;

enum {
	PARSE_ABSOLUTIFYIE40URLS = 0x1,
	PARSE_FLAGS_Max          = 2147483647
}
alias int PARSE_FLAGS;

enum {
	TAGID_NULL            = 0,
	TAGID_UNKNOWN         = 1,
	TAGID_A               = 2,
	TAGID_ACRONYM         = 3,
	TAGID_ADDRESS         = 4,
	TAGID_APPLET          = 5,
	TAGID_AREA            = 6,
	TAGID_B               = 7,
	TAGID_BASE            = 8,
	TAGID_BASEFONT        = 9,
	TAGID_BDO             = 10,
	TAGID_BGSOUND         = 11,
	TAGID_BIG             = 12,
	TAGID_BLINK           = 13,
	TAGID_BLOCKQUOTE      = 14,
	TAGID_BODY            = 15,
	TAGID_BR              = 16,
	TAGID_BUTTON          = 17,
	TAGID_CAPTION         = 18,
	TAGID_CENTER          = 19,
	TAGID_CITE            = 20,
	TAGID_CODE            = 21,
	TAGID_COL             = 22,
	TAGID_COLGROUP        = 23,
	TAGID_COMMENT         = 24,
	TAGID_COMMENT_RAW     = 25,
	TAGID_DD              = 26,
	TAGID_DEL             = 27,
	TAGID_DFN             = 28,
	TAGID_DIR             = 29,
	TAGID_DIV             = 30,
	TAGID_DL              = 31,
	TAGID_DT              = 32,
	TAGID_EM              = 33,
	TAGID_EMBED           = 34,
	TAGID_FIELDSET        = 35,
	TAGID_FONT            = 36,
	TAGID_FORM            = 37,
	TAGID_FRAME           = 38,
	TAGID_FRAMESET        = 39,
	TAGID_GENERIC         = 40,
	TAGID_H1              = 41,
	TAGID_H2              = 42,
	TAGID_H3              = 43,
	TAGID_H4              = 44,
	TAGID_H5              = 45,
	TAGID_H6              = 46,
	TAGID_HEAD            = 47,
	TAGID_HR              = 48,
	TAGID_HTML            = 49,
	TAGID_I               = 50,
	TAGID_IFRAME          = 51,
	TAGID_IMG             = 52,
	TAGID_INPUT           = 53,
	TAGID_INS             = 54,
	TAGID_KBD             = 55,
	TAGID_LABEL           = 56,
	TAGID_LEGEND          = 57,
	TAGID_LI              = 58,
	TAGID_LINK            = 59,
	TAGID_LISTING         = 60,
	TAGID_MAP             = 61,
	TAGID_MARQUEE         = 62,
	TAGID_MENU            = 63,
	TAGID_META            = 64,
	TAGID_NEXTID          = 65,
	TAGID_NOBR            = 66,
	TAGID_NOEMBED         = 67,
	TAGID_NOFRAMES        = 68,
	TAGID_NOSCRIPT        = 69,
	TAGID_OBJECT          = 70,
	TAGID_OL              = 71,
	TAGID_OPTION          = 72,
	TAGID_P               = 73,
	TAGID_PARAM           = 74,
	TAGID_PLAINTEXT       = 75,
	TAGID_PRE             = 76,
	TAGID_Q               = 77,
	TAGID_RP              = 78,
	TAGID_RT              = 79,
	TAGID_RUBY            = 80,
	TAGID_S               = 81,
	TAGID_SAMP            = 82,
	TAGID_SCRIPT          = 83,
	TAGID_SELECT          = 84,
	TAGID_SMALL           = 85,
	TAGID_SPAN            = 86,
	TAGID_STRIKE          = 87,
	TAGID_STRONG          = 88,
	TAGID_STYLE           = 89,
	TAGID_SUB             = 90,
	TAGID_SUP             = 91,
	TAGID_TABLE           = 92,
	TAGID_TBODY           = 93,
	TAGID_TC              = 94,
	TAGID_TD              = 95,
	TAGID_TEXTAREA        = 96,
	TAGID_TFOOT           = 97,
	TAGID_TH              = 98,
	TAGID_THEAD           = 99,
	TAGID_TITLE           = 100,
	TAGID_TR              = 101,
	TAGID_TT              = 102,
	TAGID_U               = 103,
	TAGID_UL              = 104,
	TAGID_VAR             = 105,
	TAGID_WBR             = 106,
	TAGID_XMP             = 107,
	TAGID_ROOT            = 108,
	TAGID_OPTGROUP        = 109,
	TAGID_ABBR            = 110,
	TAGID_COUNT           = 111,
	TAGID_LAST_PREDEFINED = 10000,
	ELEMENT_TAG_ID_Max    = 2147483647
}
alias int ELEMENT_TAG_ID;

enum {
	SELECTION_TYPE_None    = 0,
	SELECTION_TYPE_Caret   = 1,
	SELECTION_TYPE_Text    = 2,
	SELECTION_TYPE_Control = 3,
	SELECTION_TYPE_Max     = 2147483647
}
alias int SELECTION_TYPE;

enum {
	SAVE_SEGMENTS_NoIE4SelectionCompat = 0x1,
	SAVE_SEGMENTS_FLAGS_Max            = 2147483647
}
alias int SAVE_SEGMENTS_FLAGS;

enum {
	CARET_DIRECTION_INDETERMINATE = 0,
	CARET_DIRECTION_SAME          = 1,
	CARET_DIRECTION_BACKWARD      = 2,
	CARET_DIRECTION_FORWARD       = 3,
	CARET_DIRECTION_Max           = 2147483647
}
alias int CARET_DIRECTION;

enum {
	LINE_DIRECTION_RightToLeft = 1,
	LINE_DIRECTION_LeftToRight = 2,
	LINE_DIRECTION_Max         = 2147483647
}
alias int LINE_DIRECTION;

enum {
	HT_OPT_AllowAfterEOL = 0x1,
	HT_OPTIONS_Max       = 2147483647
}
alias int HT_OPTIONS;

enum {
	HT_RESULTS_Glyph = 0x1,
	HT_RESULTS_Max   = 2147483647
}
alias int HT_RESULTS;

enum {
	DISPLAY_MOVEUNIT_PreviousLine     = 1,
	DISPLAY_MOVEUNIT_NextLine         = 2,
	DISPLAY_MOVEUNIT_CurrentLineStart = 3,
	DISPLAY_MOVEUNIT_CurrentLineEnd   = 4,
	DISPLAY_MOVEUNIT_TopOfWindow      = 5,
	DISPLAY_MOVEUNIT_BottomOfWindow   = 6,
	DISPLAY_MOVEUNIT_Max              = 2147483647
}
alias int DISPLAY_MOVEUNIT;

enum {
	DISPLAY_GRAVITY_PreviousLine = 1,
	DISPLAY_GRAVITY_NextLine     = 2,
	DISPLAY_GRAVITY_Max          = 2147483647
}
alias int DISPLAY_GRAVITY;

enum {
	DISPLAY_BREAK_None  = 0,
	DISPLAY_BREAK_Block = 0x1,
	DISPLAY_BREAK_Break = 0x2,
	DISPLAY_BREAK_Max   = 2147483647
}
alias int DISPLAY_BREAK;

enum {
	COORD_SYSTEM_GLOBAL    = 0,
	COORD_SYSTEM_PARENT    = 1,
	COORD_SYSTEM_CONTAINER = 2,
	COORD_SYSTEM_CONTENT   = 3,
	COORD_SYSTEM_FRAME     = 4,
	COORD_SYSTEM_Max       = 2147483647
}
alias int COORD_SYSTEM;

//extern extern(C) const GUID CLSID_HtmlDlgSafeHelper; defined below
//extern extern(C) const GUID CLSID_BlockFormats; defined below
//extern extern(C) const GUID CLSID_FontNames; defined below
extern extern(C) const GUID CLSID_CHTMLNamespace;
extern extern(C) const GUID CLSID_CHTMLNamespaceCollection;

enum {
	HTMLPAINTER_OPAQUE         = 0x1,
	HTMLPAINTER_TRANSPARENT    = 0x2,
	HTMLPAINTER_ALPHA          = 0x4,
	HTMLPAINTER_COMPLEX        = 0x8,
	HTMLPAINTER_OVERLAY        = 0x10,
	HTMLPAINTER_HITTEST        = 0x20,
	HTMLPAINTER_SURFACE        = 0x100,
	HTMLPAINTER_3DSURFACE      = 0x200,
	HTMLPAINTER_NOBAND         = 0x400,
	HTMLPAINTER_NODC           = 0x1000,
	HTMLPAINTER_NOPHYSICALCLIP = 0x2000,
	HTMLPAINTER_NOSAVEDC       = 0x4000,
	HTMLPAINTER_SUPPORTS_XFORM = 0x8000,
	HTMLPAINTER_EXPAND         = 0x10000,
	HTMLPAINTER_NOSCROLLBITS   = 0x20000,
	HTML_PAINTER_Max           = 2147483647
}
alias int HTML_PAINTER;

enum {
	HTMLPAINT_ZORDER_NONE               = 0,
	HTMLPAINT_ZORDER_REPLACE_ALL        = 1,
	HTMLPAINT_ZORDER_REPLACE_CONTENT    = 2,
	HTMLPAINT_ZORDER_REPLACE_BACKGROUND = 3,
	HTMLPAINT_ZORDER_BELOW_CONTENT      = 4,
	HTMLPAINT_ZORDER_BELOW_FLOW         = 5,
	HTMLPAINT_ZORDER_ABOVE_FLOW         = 6,
	HTMLPAINT_ZORDER_ABOVE_CONTENT      = 7,
	HTMLPAINT_ZORDER_WINDOW_TOP         = 8,
	HTML_PAINT_ZORDER_Max               = 2147483647
}
alias int HTML_PAINT_ZORDER;

enum {
	HTMLPAINT_DRAW_UPDATEREGION = 0x1,
	HTMLPAINT_DRAW_USE_XFORM    = 0x2,
	HTML_PAINT_DRAW_FLAGS_Max   = 2147483647
}
alias int HTML_PAINT_DRAW_FLAGS;

enum {
	HTMLPAINT_EVENT_TARGET     = 0x1,
	HTMLPAINT_EVENT_SETCURSOR  = 0x2,
	HTML_PAINT_EVENT_FLAGS_Max = 2147483647
}
alias int HTML_PAINT_EVENT_FLAGS;

enum {
	HTMLPAINT_DRAWINFO_VIEWPORT     = 0x1,
	HTMLPAINT_DRAWINFO_UPDATEREGION = 0x2,
	HTMLPAINT_DRAWINFO_XFORM        = 0x4,
	HTML_PAINT_DRAW_INFO_FLAGS_Max  = 2147483647
}
alias int HTML_PAINT_DRAW_INFO_FLAGS;

struct HTML_PAINTER_INFO {
	LONG lFlags;
	LONG lZOrder;
	IID iidDrawObject;
	RECT rcExpand;
}

struct HTML_PAINT_XFORM {
	FLOAT eM11;
	FLOAT eM12;
	FLOAT eM21;
	FLOAT eM22;
	FLOAT eDx;
	FLOAT eDy;
}

struct HTML_PAINT_DRAW_INFO {
	RECT rcViewport;
	HRGN hrgnUpdate;
	HTML_PAINT_XFORM xform;
}

enum {
	HTMLDlgFlagNo     = 0,
	HTMLDlgFlagOff    = 0,
	HTMLDlgFlag0      = 0,
	HTMLDlgFlagYes    = 1,
	HTMLDlgFlagOn     = 1,
	HTMLDlgFlag1      = 1,
	HTMLDlgFlagNotSet = -1,
	HTMLDlgFlag_Max   = 2147483647
}
alias int HTMLDlgFlag;

enum {
	HTMLDlgBorderThin  = 0,
	HTMLDlgBorderThick = 0x40000L,
	HTMLDlgBorder_Max  = 2147483647
}
alias int HTMLDlgBorder;

enum {
	HTMLDlgEdgeSunken = 0,
	HTMLDlgEdgeRaised = 16,
	HTMLDlgEdge_Max   = 2147483647
}
alias int HTMLDlgEdge;

enum {
	HTMLDlgCenterNo      = 0,
	HTMLDlgCenterOff     = 0,
	HTMLDlgCenter0       = 0,
	HTMLDlgCenterYes     = 1,
	HTMLDlgCenterOn      = 1,
	HTMLDlgCenter1       = 1,
	HTMLDlgCenterParent  = 1,
	HTMLDlgCenterDesktop = 2,
	HTMLDlgCenter_Max    = 2147483647
}
alias int HTMLDlgCenter;

extern extern(C) const GUID CLSID_CThreadDialogProcParam;
extern extern(C) const GUID CLSID_CHTMLDlg;
extern extern(C) const GUID CLSID_CHTMLPopup;

enum {
	HTMLAppFlagNo   = 0,
	HTMLAppFlagOff  = 0,
	HTMLAppFlag0    = 0,
	HTMLAppFlagYes  = 1,
	HTMLAppFlagOn   = 1,
	HTMLAppFlag1    = 1,
	HTMLAppFlag_Max = 2147483647
}
alias int HTMLAppFlag;

enum {
	HTMLMinimizeFlagNo   = 0,
	HTMLMinimizeFlagYes  = 0x20000L,
	HTMLMinimizeFlag_Max = 2147483647
}
alias int HTMLMinimizeFlag;

enum {
	HTMLMaximizeFlagNo   = 0,
	HTMLMaximizeFlagYes  = 0x10000L,
	HTMLMaximizeFlag_Max = 2147483647
}
alias int HTMLMaximizeFlag;

enum {
	HTMLCaptionFlagNo   = 0,
	HTMLCaptionFlagYes  = 0xc00000L,
	HTMLCaptionFlag_Max = 2147483647
}
alias int HTMLCaptionFlag;

enum {
	HTMLSysMenuFlagNo   = 0,
	HTMLSysMenuFlagYes  = 0x80000L,
	HTMLSysMenuFlag_Max = 2147483647
}
alias int HTMLSysMenuFlag;

enum {
	HTMLBorderNone   = 0,
	HTMLBorderThick  = 0x40000L,
	HTMLBorderDialog = 0x400000L,
	HTMLBorderThin   = 0x800000L,
	HTMLBorder_Max   = 2147483647
}
alias int HTMLBorder;

enum {
	HTMLBorderStyleNormal   = 0,
	HTMLBorderStyleRaised   = 0x100L,
	HTMLBorderStyleSunken   = 0x200L,
	HTMLBorderStylecombined = 0x300L,
	HTMLBorderStyleStatic   = 0x20000L,
	HTMLBorderStyle_Max     = 2147483647
}
alias int HTMLBorderStyle;

enum {
	HTMLWindowStateNormal   = 1,
	HTMLWindowStateMaximize = 3,
	HTMLWindowStateMinimize = 6,
	HTMLWindowState_Max     = 2147483647
}
alias int HTMLWindowState;

extern extern(C) const GUID CLSID_CAppBehavior;

enum {
	BEHAVIOREVENT_FIRST                 = 0,
	BEHAVIOREVENT_CONTENTREADY          = 0,
	BEHAVIOREVENT_DOCUMENTREADY         = 1,
	BEHAVIOREVENT_APPLYSTYLE            = 2,
	BEHAVIOREVENT_DOCUMENTCONTEXTCHANGE = 3,
	BEHAVIOREVENT_CONTENTSAVE           = 4,
	BEHAVIOREVENT_LAST                  = 4,
	BEHAVIOR_EVENT_Max                  = 2147483647
}
alias int BEHAVIOR_EVENT;

enum {
	BEHAVIOREVENTFLAGS_BUBBLE           = 1,
	BEHAVIOREVENTFLAGS_STANDARDADDITIVE = 2,
	BEHAVIOR_EVENT_FLAGS_Max            = 2147483647
}
alias int BEHAVIOR_EVENT_FLAGS;

enum {
	BEHAVIORRENDERINFO_BEFOREBACKGROUND  = 0x1,
	BEHAVIORRENDERINFO_AFTERBACKGROUND   = 0x2,
	BEHAVIORRENDERINFO_BEFORECONTENT     = 0x4,
	BEHAVIORRENDERINFO_AFTERCONTENT      = 0x8,
	BEHAVIORRENDERINFO_AFTERFOREGROUND   = 0x20,
	BEHAVIORRENDERINFO_ABOVECONTENT      = 0x28,
	BEHAVIORRENDERINFO_ALLLAYERS         = 0xff,
	BEHAVIORRENDERINFO_DISABLEBACKGROUND = 0x100,
	BEHAVIORRENDERINFO_DISABLENEGATIVEZ  = 0x200,
	BEHAVIORRENDERINFO_DISABLECONTENT    = 0x400,
	BEHAVIORRENDERINFO_DISABLEPOSITIVEZ  = 0x800,
	BEHAVIORRENDERINFO_DISABLEALLLAYERS  = 0xf00,
	BEHAVIORRENDERINFO_HITTESTING        = 0x1000,
	BEHAVIORRENDERINFO_SURFACE           = 0x100000,
	BEHAVIORRENDERINFO_3DSURFACE         = 0x200000,
	BEHAVIOR_RENDER_INFO_Max             = 2147483647
}
alias int BEHAVIOR_RENDER_INFO;

enum {
	BEHAVIOR_FIRSTRELATION = 0,
	BEHAVIOR_SAMEELEMENT   = 0,
	BEHAVIOR_PARENT        = 1,
	BEHAVIOR_CHILD         = 2,
	BEHAVIOR_SIBLING       = 3,
	BEHAVIOR_LASTRELATION  = 3,
	BEHAVIOR_RELATION_Max  = 2147483647
}
alias int BEHAVIOR_RELATION;

enum {
	BEHAVIORLAYOUTINFO_FULLDELEGATION = 0x1,
	BEHAVIORLAYOUTINFO_MODIFYNATURAL  = 0x2,
	BEHAVIORLAYOUTINFO_MAPSIZE        = 0x4,
	BEHAVIOR_LAYOUT_INFO_Max          = 2147483647
}
alias int BEHAVIOR_LAYOUT_INFO;

enum {
	BEHAVIORLAYOUTMODE_NATURAL          = 0x1,
	BEHAVIORLAYOUTMODE_MINWIDTH         = 0x2,
	BEHAVIORLAYOUTMODE_MAXWIDTH         = 0x4,
	BEHAVIORLAYOUTMODE_MEDIA_RESOLUTION = 0x4000,
	BEHAVIORLAYOUTMODE_FINAL_PERCENT    = 0x8000,
	BEHAVIOR_LAYOUT_MODE_Max            = 2147483647
}
alias int BEHAVIOR_LAYOUT_MODE;

enum {
	ELEMENTDESCRIPTORFLAGS_LITERAL        = 1,
	ELEMENTDESCRIPTORFLAGS_NESTED_LITERAL = 2,
	ELEMENTDESCRIPTOR_FLAGS_Max           = 2147483647
}
alias int ELEMENTDESCRIPTOR_FLAGS;

enum {
	ELEMENTNAMESPACEFLAGS_ALLOWANYTAG         = 0x1,
	ELEMENTNAMESPACEFLAGS_QUERYFORUNKNOWNTAGS = 0x2,
	ELEMENTNAMESPACE_FLAGS_Max                = 2147483647
}
alias int ELEMENTNAMESPACE_FLAGS;

extern extern(C) const IID LIBID_MSHTML;

//extern extern(C) const IID IID_IHTMLEventObj;
mixin DEFINE_IID!(IHTMLEventObj, "3050f32d-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLEventObj : IDispatch {
public extern(Windows):
	HRESULT get_srcElement(IHTMLElement* p);
	HRESULT get_altKey(VARIANT_BOOL* p);
	HRESULT get_ctrlKey(VARIANT_BOOL* p);
	HRESULT get_shiftKey(VARIANT_BOOL* p);
	HRESULT put_returnValue(VARIANT v);
	HRESULT get_returnValue(VARIANT* p);
	HRESULT put_cancelBubble(VARIANT_BOOL v);
	HRESULT get_cancelBubble(VARIANT_BOOL* p);
	HRESULT get_fromElement(IHTMLElement* p);
	HRESULT get_toElement(IHTMLElement* p);
	HRESULT put_keyCode(int v);
	HRESULT get_keyCode(int* p);
	HRESULT get_button(int* p);
	HRESULT get_type(BSTR* p);
	HRESULT get_qualifier(BSTR* p);
	HRESULT get_reason(int* p);
	HRESULT get_x(int* p);
	HRESULT get_y(int* p);
	HRESULT get_clientX(int* p);
	HRESULT get_clientY(int* p);
	HRESULT get_offsetX(int* p);
	HRESULT get_offsetY(int* p);
	HRESULT get_screenX(int* p);
	HRESULT get_screenY(int* p);
	HRESULT get_srcFilter(IDispatch* p);
}

//extern extern(C) const IID IID_IElementBehaviorSite;
mixin DEFINE_IID!(IElementBehaviorSite, "3050f427-98b5-11cf-bb82-00aa00bdce0b");
interface IElementBehaviorSite : IUnknown {
public extern(Windows):
	HRESULT GetElement(IHTMLElement* ppElement);
	HRESULT RegisterNotification(LONG lEvent);
}

//extern extern(C) const IID IID_IElementBehavior;
mixin DEFINE_IID!(IElementBehavior, "3050f425-98b5-11cf-bb82-00aa00bdce0b");
interface IElementBehavior : IUnknown {
public extern(Windows):
	HRESULT Init(IElementBehaviorSite* pBehaviorSite);
	HRESULT Notify(LONG lEvent, VARIANT* pVar);
	HRESULT Detach();
}

//extern extern(C) const IID IID_IElementBehaviorFactory;
mixin DEFINE_IID!(IElementBehaviorFactory, "3050f429-98b5-11cf-bb82-00aa00bdce0b");
interface IElementBehaviorFactory : IUnknown {
public extern(Windows):
	HRESULT FindBehavior(BSTR bstrBehavior, BSTR bstrBehaviorUrl, IElementBehaviorSite* pSite, IElementBehavior* ppBehavior);
}
alias IID_IElementBehaviorFactory SID_SElementBehaviorFactory;

//extern extern(C) const IID IID_IElementBehaviorSiteOM;
mixin DEFINE_IID!(IElementBehaviorSiteOM, "3050f489-98b5-11cf-bb82-00aa00bdce0b");
interface IElementBehaviorSiteOM : IUnknown {
public extern(Windows):
	HRESULT RegisterEvent(LPOLESTR pchEvent, LONG lFlags, LONG* plCookie);
	HRESULT GetEventCookie(LPOLESTR pchEvent, LONG* plCookie);
	HRESULT FireEvent(LONG lCookie, IHTMLEventObj* pEventObject);
	HRESULT CreateEventObject(IHTMLEventObj* ppEventObject);
	HRESULT RegisterName(LPOLESTR pchName);
	HRESULT RegisterUrn(LPOLESTR pchUrn);
}

//extern extern(C) const IID IID_IElementBehaviorRender;
mixin DEFINE_IID!(IElementBehaviorRender, "3050f4aa-98b5-11cf-bb82-00aa00bdce0b");
interface IElementBehaviorRender : IUnknown {
public extern(Windows):
	HRESULT Draw(HDC hdc, LONG lLayer, RECT* pRect, IUnknown pReserved);
	HRESULT GetRenderInfo(LONG* plRenderInfo);
	HRESULT HitTestPoint(POINT* pPoint, IUnknown pReserved, BOOL* pbHit);
}

//extern extern(C) const IID IID_IElementBehaviorSiteRender;
mixin DEFINE_IID!(IElementBehaviorSiteRender, "3050f4a7-98b5-11cf-bb82-00aa00bdce0b");
interface IElementBehaviorSiteRender : IUnknown {
public extern(Windows):
	HRESULT Invalidate(RECT* pRect);
	HRESULT InvalidateRenderInfo();
	HRESULT InvalidateStyle();
}

//extern extern(C) const IID IID_IHTMLDOMConstructor;
mixin DEFINE_IID!(IHTMLDOMConstructor, "3051049b-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLDOMConstructor : IDispatch {
public extern(Windows):
	HRESULT get_constructor(IDispatch* p);
	HRESULT LookupGetter(BSTR propname, VARIANT* ppDispHandler);
	HRESULT LookupSetter(BSTR propname, VARIANT* ppDispHandler);
	HRESULT DefineGetter(BSTR propname, VARIANT* pdispHandler);
	HRESULT DefineSetter(BSTR propname, VARIANT* pdispHandler);
}

//extern extern(C) const IID IID_IHTMLStyle;
mixin DEFINE_IID!(IHTMLStyle, "3050f25e-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLStyle : IDispatch {
public extern(Windows):
	HRESULT put_fontFamily(BSTR v);
	HRESULT get_fontFamily(BSTR* p);
	HRESULT put_fontStyle(BSTR v);
	HRESULT get_fontStyle(BSTR* p);
	HRESULT put_fontVariant(BSTR v);
	HRESULT get_fontVariant(BSTR* p);
	HRESULT put_fontWeight(BSTR v);
	HRESULT get_fontWeight(BSTR* p);
	HRESULT put_fontSize(VARIANT v);
	HRESULT get_fontSize(VARIANT* p);
	HRESULT put_font(BSTR v);
	HRESULT get_font(BSTR* p);
	HRESULT put_color(VARIANT v);
	HRESULT get_color(VARIANT* p);
	HRESULT put_background(BSTR v);
	HRESULT get_background(BSTR* p);
	HRESULT put_backgroundColor(VARIANT v);
	HRESULT get_backgroundColor(VARIANT* p);
	HRESULT put_backgroundImage(BSTR v);
	HRESULT get_backgroundImage(BSTR* p);
	HRESULT put_backgroundRepeat(BSTR v);
	HRESULT get_backgroundRepeat(BSTR* p);
	HRESULT put_backgroundAttachment(BSTR v);
	HRESULT get_backgroundAttachment(BSTR* p);
	HRESULT put_backgroundPosition(BSTR v);
	HRESULT get_backgroundPosition(BSTR* p);
	HRESULT put_backgroundPositionX(VARIANT v);
	HRESULT get_backgroundPositionX(VARIANT* p);
	HRESULT put_backgroundPositionY(VARIANT v);
	HRESULT get_backgroundPositionY(VARIANT* p);
	HRESULT put_wordSpacing(VARIANT v);
	HRESULT get_wordSpacing(VARIANT* p);
	HRESULT put_letterSpacing(VARIANT v);
	HRESULT get_letterSpacing(VARIANT* p);
	HRESULT put_textDecoration(BSTR v);
	HRESULT get_textDecoration(BSTR* p);
	HRESULT put_textDecorationNone(VARIANT_BOOL v);
	HRESULT get_textDecorationNone(VARIANT_BOOL* p);
	HRESULT put_textDecorationUnderline(VARIANT_BOOL v);
	HRESULT get_textDecorationUnderline(VARIANT_BOOL* p);
	HRESULT put_textDecorationOverline(VARIANT_BOOL v);
	HRESULT get_textDecorationOverline(VARIANT_BOOL* p);
	HRESULT put_textDecorationLineThrough(VARIANT_BOOL v);
	HRESULT get_textDecorationLineThrough(VARIANT_BOOL* p);
	HRESULT put_textDecorationBlink(VARIANT_BOOL v);
	HRESULT get_textDecorationBlink(VARIANT_BOOL* p);
	HRESULT put_verticalAlign(VARIANT v);
	HRESULT get_verticalAlign(VARIANT* p);
	HRESULT put_textTransform(BSTR v);
	HRESULT get_textTransform(BSTR* p);
	HRESULT put_textAlign(BSTR v);
	HRESULT get_textAlign(BSTR* p);
	HRESULT put_textIndent(VARIANT v);
	HRESULT get_textIndent(VARIANT* p);
	HRESULT put_lineHeight(VARIANT v);
	HRESULT get_lineHeight(VARIANT* p);
	HRESULT put_marginTop(VARIANT v);
	HRESULT get_marginTop(VARIANT* p);
	HRESULT put_marginRight(VARIANT v);
	HRESULT get_marginRight(VARIANT* p);
	HRESULT put_marginBottom(VARIANT v);
	HRESULT get_marginBottom(VARIANT* p);
	HRESULT put_marginLeft(VARIANT v);
	HRESULT get_marginLeft(VARIANT* p);
	HRESULT put_margin(BSTR v);
	HRESULT get_margin(BSTR* p);
	HRESULT put_paddingTop(VARIANT v);
	HRESULT get_paddingTop(VARIANT* p);
	HRESULT put_paddingRight(VARIANT v);
	HRESULT get_paddingRight(VARIANT* p);
	HRESULT put_paddingBottom(VARIANT v);
	HRESULT get_paddingBottom(VARIANT* p);
	HRESULT put_paddingLeft(VARIANT v);
	HRESULT get_paddingLeft(VARIANT* p);
	HRESULT put_padding(BSTR v);
	HRESULT get_padding(BSTR* p);
	HRESULT put_border(BSTR v);
	HRESULT get_border(BSTR* p);
	HRESULT put_borderTop(BSTR v);
	HRESULT get_borderTop(BSTR* p);
	HRESULT put_borderRight(BSTR v);
	HRESULT get_borderRight(BSTR* p);
	HRESULT put_borderBottom(BSTR v);
	HRESULT get_borderBottom(BSTR* p);
	HRESULT put_borderLeft(BSTR v);
	HRESULT get_borderLeft(BSTR* p);
	HRESULT put_borderColor(BSTR v);
	HRESULT get_borderColor(BSTR* p);
	HRESULT put_borderTopColor(VARIANT v);
	HRESULT get_borderTopColor(VARIANT* p);
	HRESULT put_borderRightColor(VARIANT v);
	HRESULT get_borderRightColor(VARIANT* p);
	HRESULT put_borderBottomColor(VARIANT v);
	HRESULT get_borderBottomColor(VARIANT* p);
	HRESULT put_borderLeftColor(VARIANT v);
	HRESULT get_borderLeftColor(VARIANT* p);
	HRESULT put_borderWidth(BSTR v);
	HRESULT get_borderWidth(BSTR* p);
	HRESULT put_borderTopWidth(VARIANT v);
	HRESULT get_borderTopWidth(VARIANT* p);
	HRESULT put_borderRightWidth(VARIANT v);
	HRESULT get_borderRightWidth(VARIANT* p);
	HRESULT put_borderBottomWidth(VARIANT v);
	HRESULT get_borderBottomWidth(VARIANT* p);
	HRESULT put_borderLeftWidth(VARIANT v);
	HRESULT get_borderLeftWidth(VARIANT* p);
	HRESULT put_borderStyle(BSTR v);
	HRESULT get_borderStyle(BSTR* p);
	HRESULT put_borderTopStyle(BSTR v);
	HRESULT get_borderTopStyle(BSTR* p);
	HRESULT put_borderRightStyle(BSTR v);
	HRESULT get_borderRightStyle(BSTR* p);
	HRESULT put_borderBottomStyle(BSTR v);
	HRESULT get_borderBottomStyle(BSTR* p);
	HRESULT put_borderLeftStyle(BSTR v);
	HRESULT get_borderLeftStyle(BSTR* p);
	HRESULT put_width(VARIANT v);
	HRESULT get_width(VARIANT* p);
	HRESULT put_height(VARIANT v);
	HRESULT get_height(VARIANT* p);
	HRESULT put_styleFloat(BSTR v);
	HRESULT get_styleFloat(BSTR* p);
	HRESULT put_clear(BSTR v);
	HRESULT get_clear(BSTR* p);
	HRESULT put_display(BSTR v);
	HRESULT get_display(BSTR* p);
	HRESULT put_visibility(BSTR v);
	HRESULT get_visibility(BSTR* p);
	HRESULT put_listStyleType(BSTR v);
	HRESULT get_listStyleType(BSTR* p);
	HRESULT put_listStylePosition(BSTR v);
	HRESULT get_listStylePosition(BSTR* p);
	HRESULT put_listStyleImage(BSTR v);
	HRESULT get_listStyleImage(BSTR* p);
	HRESULT put_listStyle(BSTR v);
	HRESULT get_listStyle(BSTR* p);
	HRESULT put_whiteSpace(BSTR v);
	HRESULT get_whiteSpace(BSTR* p);
	HRESULT put_top(VARIANT v);
	HRESULT get_top(VARIANT* p);
	HRESULT put_left(VARIANT v);
	HRESULT get_left(VARIANT* p);
	HRESULT get_position(BSTR* p);
	HRESULT put_zIndex(VARIANT v);
	HRESULT get_zIndex(VARIANT* p);
	HRESULT put_overflow(BSTR v);
	HRESULT get_overflow(BSTR* p);
	HRESULT put_pageBreakBefore(BSTR v);
	HRESULT get_pageBreakBefore(BSTR* p);
	HRESULT put_pageBreakAfter(BSTR v);
	HRESULT get_pageBreakAfter(BSTR* p);
	HRESULT put_cssText(BSTR v);
	HRESULT get_cssText(BSTR* p);
	HRESULT put_pixelTop(int v);
	HRESULT get_pixelTop(int* p);
	HRESULT put_pixelLeft(int v);
	HRESULT get_pixelLeft(int* p);
	HRESULT put_pixelWidth(int v);
	HRESULT get_pixelWidth(int* p);
	HRESULT put_pixelHeight(int v);
	HRESULT get_pixelHeight(int* p);
	HRESULT put_posTop(float v);
	HRESULT get_posTop(float* p);
	HRESULT put_posLeft(float v);
	HRESULT get_posLeft(float* p);
	HRESULT put_posWidth(float v);
	HRESULT get_posWidth(float* p);
	HRESULT put_posHeight(float v);
	HRESULT get_posHeight(float* p);
	HRESULT put_cursor(BSTR v);
	HRESULT get_cursor(BSTR* p);
	HRESULT put_clip(BSTR v);
	HRESULT get_clip(BSTR* p);
	HRESULT put_filter(BSTR v);
	HRESULT get_filter(BSTR* p);
	HRESULT setAttribute(BSTR strAttributeName, VARIANT AttributeValue, LONG lFlags = 1);
	HRESULT getAttribute(BSTR strAttributeName, LONG lFlags, VARIANT* AttributeValue);
	HRESULT removeAttribute(BSTR strAttributeName, LONG lFlags, VARIANT_BOOL* pfSuccess);
	HRESULT toString(BSTR* String);
}

export extern(Windows){
	HRESULT IHTMLStyle_get_styleFloat_Proxy(IHTMLStyle This, BSTR* p);
	void IHTMLStyle_get_styleFloat_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_put_clear_Proxy(IHTMLStyle This, BSTR v);
	void IHTMLStyle_put_clear_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_get_clear_Proxy(IHTMLStyle This, BSTR* p);
	void IHTMLStyle_get_clear_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_put_display_Proxy(IHTMLStyle This, BSTR v);
	void IHTMLStyle_put_display_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_get_display_Proxy(IHTMLStyle This, BSTR* p);
	void IHTMLStyle_get_display_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_put_visibility_Proxy(IHTMLStyle This, BSTR v);
	void IHTMLStyle_put_visibility_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_get_visibility_Proxy(IHTMLStyle This, BSTR* p);
	void IHTMLStyle_get_visibility_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_put_listStyleType_Proxy(IHTMLStyle This, BSTR v);
	void IHTMLStyle_put_listStyleType_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_get_listStyleType_Proxy(IHTMLStyle This, BSTR* p);
	void IHTMLStyle_get_listStyleType_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_put_listStylePosition_Proxy(IHTMLStyle This, BSTR v);
	void IHTMLStyle_put_listStylePosition_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_get_listStylePosition_Proxy(IHTMLStyle This, BSTR* p);
	void IHTMLStyle_get_listStylePosition_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_put_listStyleImage_Proxy(IHTMLStyle This, BSTR v);
	void IHTMLStyle_put_listStyleImage_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_get_listStyleImage_Proxy(IHTMLStyle This, BSTR* p);
	void IHTMLStyle_get_listStyleImage_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_put_listStyle_Proxy(IHTMLStyle This, BSTR v);
	void IHTMLStyle_put_listStyle_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_get_listStyle_Proxy(IHTMLStyle This, BSTR* p);
	void IHTMLStyle_get_listStyle_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_put_whiteSpace_Proxy(IHTMLStyle This, BSTR v);
	void IHTMLStyle_put_whiteSpace_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_get_whiteSpace_Proxy(IHTMLStyle This, BSTR* p);
	void IHTMLStyle_get_whiteSpace_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_put_top_Proxy(IHTMLStyle This, VARIANT v);
	void IHTMLStyle_put_top_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_get_top_Proxy(IHTMLStyle This, VARIANT* p);
	void IHTMLStyle_get_top_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_put_left_Proxy(IHTMLStyle This, VARIANT v);
	void IHTMLStyle_put_left_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_get_left_Proxy(IHTMLStyle This, VARIANT* p);
	void IHTMLStyle_get_left_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_get_position_Proxy(IHTMLStyle This, BSTR* p);
	void IHTMLStyle_get_position_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_put_zIndex_Proxy(IHTMLStyle This, VARIANT v);
	void IHTMLStyle_put_zIndex_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_get_zIndex_Proxy(IHTMLStyle This, VARIANT* p);
	void IHTMLStyle_get_zIndex_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_put_overflow_Proxy(IHTMLStyle This, BSTR v);
	void IHTMLStyle_put_overflow_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_get_overflow_Proxy(IHTMLStyle This, BSTR* p);
	void IHTMLStyle_get_overflow_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_put_pageBreakBefore_Proxy(IHTMLStyle This, BSTR v);
	void IHTMLStyle_put_pageBreakBefore_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_get_pageBreakBefore_Proxy(IHTMLStyle This, BSTR* p);
	void IHTMLStyle_get_pageBreakBefore_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_put_pageBreakAfter_Proxy(IHTMLStyle This, BSTR v);
	void IHTMLStyle_put_pageBreakAfter_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_get_pageBreakAfter_Proxy(IHTMLStyle This, BSTR* p);
	void IHTMLStyle_get_pageBreakAfter_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_put_cssText_Proxy(IHTMLStyle This, BSTR v);
	void IHTMLStyle_put_cssText_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_get_cssText_Proxy(IHTMLStyle This, BSTR* p);
	void IHTMLStyle_get_cssText_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_put_pixelTop_Proxy(IHTMLStyle This, int v);
	void IHTMLStyle_put_pixelTop_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_get_pixelTop_Proxy(IHTMLStyle This, int* p);
	void IHTMLStyle_get_pixelTop_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_put_pixelLeft_Proxy(IHTMLStyle This, int v);
	void IHTMLStyle_put_pixelLeft_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_get_pixelLeft_Proxy(IHTMLStyle This, int* p);
	void IHTMLStyle_get_pixelLeft_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_put_pixelWidth_Proxy(IHTMLStyle This, int v);
	void IHTMLStyle_put_pixelWidth_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_get_pixelWidth_Proxy(IHTMLStyle This, int* p);
	void IHTMLStyle_get_pixelWidth_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_put_pixelHeight_Proxy(IHTMLStyle This, int v);
	void IHTMLStyle_put_pixelHeight_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_get_pixelHeight_Proxy(IHTMLStyle This, int* p);
	void IHTMLStyle_get_pixelHeight_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_put_posTop_Proxy(IHTMLStyle This, float v);
	void IHTMLStyle_put_posTop_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_get_posTop_Proxy(IHTMLStyle This, float* p);
	void IHTMLStyle_get_posTop_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_put_posLeft_Proxy(IHTMLStyle This, float v);
	void IHTMLStyle_put_posLeft_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_get_posLeft_Proxy(IHTMLStyle This, float* p);
	void IHTMLStyle_get_posLeft_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_put_posWidth_Proxy(IHTMLStyle This, float v);
	void IHTMLStyle_put_posWidth_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_get_posWidth_Proxy(IHTMLStyle This, float* p);
	void IHTMLStyle_get_posWidth_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_put_posHeight_Proxy(IHTMLStyle This, float v);
	void IHTMLStyle_put_posHeight_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_get_posHeight_Proxy(IHTMLStyle This, float* p);
	void IHTMLStyle_get_posHeight_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_put_cursor_Proxy(IHTMLStyle This, BSTR v);
	void IHTMLStyle_put_cursor_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_get_cursor_Proxy(IHTMLStyle This, BSTR* p);
	void IHTMLStyle_get_cursor_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_put_clip_Proxy(IHTMLStyle This, BSTR v);
	void IHTMLStyle_put_clip_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_get_clip_Proxy(IHTMLStyle This, BSTR* p);
	void IHTMLStyle_get_clip_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_put_filter_Proxy(IHTMLStyle This, BSTR v);
	void IHTMLStyle_put_filter_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_get_filter_Proxy(IHTMLStyle This, BSTR* p);
	void IHTMLStyle_get_filter_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_setAttribute_Proxy(IHTMLStyle This, BSTR strAttributeName, VARIANT AttributeValue, LONG lFlags);
	void IHTMLStyle_setAttribute_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_getAttribute_Proxy(IHTMLStyle This, BSTR strAttributeName, LONG lFlags, VARIANT* AttributeValue);
	void IHTMLStyle_getAttribute_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_removeAttribute_Proxy(IHTMLStyle This, BSTR strAttributeName, LONG lFlags, VARIANT_BOOL* pfSuccess);
	void IHTMLStyle_removeAttribute_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLStyle_toString_Proxy(IHTMLStyle This, BSTR* String);
	void IHTMLStyle_toString_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_IHTMLStyle2;
mixin DEFINE_IID!(IHTMLStyle2, "3050f4a2-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLStyle2 : IDispatch {
public extern(Windows):
	HRESULT put_tableLayout(BSTR v);
	HRESULT get_tableLayout(BSTR* p);
	HRESULT put_borderCollapse(BSTR v);
	HRESULT get_borderCollapse(BSTR* p);
	HRESULT put_direction(BSTR v);
	HRESULT get_direction(BSTR* p);
	HRESULT put_behavior(BSTR v);
	HRESULT get_behavior(BSTR* p);
	HRESULT setExpression(BSTR propname, BSTR expression, BSTR language/* = ""*/);
	HRESULT getExpression(BSTR propname, VARIANT* expression);
	HRESULT removeExpression(BSTR propname, VARIANT_BOOL* pfSuccess);
	HRESULT put_position(BSTR v);
	HRESULT get_position(BSTR* p);
	HRESULT put_unicodeBidi(BSTR v);
	HRESULT get_unicodeBidi(BSTR* p);
	HRESULT put_bottom(VARIANT v);
	HRESULT get_bottom(VARIANT* p);
	HRESULT put_right(VARIANT v);
	HRESULT get_right(VARIANT* p);
	HRESULT put_pixelBottom(int v);
	HRESULT get_pixelBottom(int* p);
	HRESULT put_pixelRight(int v);
	HRESULT get_pixelRight(int* p);
	HRESULT put_posBottom(float v);
	HRESULT get_posBottom(float* p);
	HRESULT put_posRight(float v);
	HRESULT get_posRight(float* p);
	HRESULT put_imeMode(BSTR v);
	HRESULT get_imeMode(BSTR* p);
	HRESULT put_rubyAlign(BSTR v);
	HRESULT get_rubyAlign(BSTR* p);
	HRESULT put_rubyPosition(BSTR v);
	HRESULT get_rubyPosition(BSTR* p);
	HRESULT put_rubyOverhang(BSTR v);
	HRESULT get_rubyOverhang(BSTR* p);
	HRESULT put_layoutGridChar(VARIANT v);
	HRESULT get_layoutGridChar(VARIANT* p);
	HRESULT put_layoutGridLine(VARIANT v);
	HRESULT get_layoutGridLine(VARIANT* p);
	HRESULT put_layoutGridMode(BSTR v);
	HRESULT get_layoutGridMode(BSTR* p);
	HRESULT put_layoutGridType(BSTR v);
	HRESULT get_layoutGridType(BSTR* p);
	HRESULT put_layoutGrid(BSTR v);
	HRESULT get_layoutGrid(BSTR* p);
	HRESULT put_wordBreak(BSTR v);
	HRESULT get_wordBreak(BSTR* p);
	HRESULT put_lineBreak(BSTR v);
	HRESULT get_lineBreak(BSTR* p);
	HRESULT put_textJustify(BSTR v);
	HRESULT get_textJustify(BSTR* p);
	HRESULT put_textJustifyTrim(BSTR v);
	HRESULT get_textJustifyTrim(BSTR* p);
	HRESULT put_textKashida(VARIANT v);
	HRESULT get_textKashida(VARIANT* p);
	HRESULT put_textAutospace(BSTR v);
	HRESULT get_textAutospace(BSTR* p);
	HRESULT put_overflowX(BSTR v);
	HRESULT get_overflowX(BSTR* p);
	HRESULT put_overflowY(BSTR v);
	HRESULT get_overflowY(BSTR* p);
	HRESULT put_accelerator(BSTR v);
	HRESULT get_accelerator(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLStyle3;
mixin DEFINE_IID!(IHTMLStyle3, "3050f656-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLStyle3 : IDispatch {
public extern(Windows):
	HRESULT put_layoutFlow(BSTR v);
	HRESULT get_layoutFlow(BSTR* p);
	HRESULT put_zoom(VARIANT v);
	HRESULT get_zoom(VARIANT* p);
	HRESULT put_wordWrap(BSTR v);
	HRESULT get_wordWrap(BSTR* p);
	HRESULT put_textUnderlinePosition(BSTR v);
	HRESULT get_textUnderlinePosition(BSTR* p);
	HRESULT put_scrollbarBaseColor(VARIANT v);
	HRESULT get_scrollbarBaseColor(VARIANT* p);
	HRESULT put_scrollbarFaceColor(VARIANT v);
	HRESULT get_scrollbarFaceColor(VARIANT* p);
	HRESULT put_scrollbar3dLightColor(VARIANT v);
	HRESULT get_scrollbar3dLightColor(VARIANT* p);
	HRESULT put_scrollbarShadowColor(VARIANT v);
	HRESULT get_scrollbarShadowColor(VARIANT* p);
	HRESULT put_scrollbarHighlightColor(VARIANT v);
	HRESULT get_scrollbarHighlightColor(VARIANT* p);
	HRESULT put_scrollbarDarkShadowColor(VARIANT v);
	HRESULT get_scrollbarDarkShadowColor(VARIANT* p);
	HRESULT put_scrollbarArrowColor(VARIANT v);
	HRESULT get_scrollbarArrowColor(VARIANT* p);
	HRESULT put_scrollbarTrackColor(VARIANT v);
	HRESULT get_scrollbarTrackColor(VARIANT* p);
	HRESULT put_writingMode(BSTR v);
	HRESULT get_writingMode(BSTR* p);
	HRESULT put_textAlignLast(BSTR v);
	HRESULT get_textAlignLast(BSTR* p);
	HRESULT put_textKashidaSpace(VARIANT v);
	HRESULT get_textKashidaSpace(VARIANT* p);
}

//extern extern(C) const IID IID_IHTMLStyle4;
mixin DEFINE_IID!(IHTMLStyle4, "3050f816-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLStyle4 : IDispatch {
public extern(Windows):
	HRESULT put_textOverflow(BSTR v);
	HRESULT get_textOverflow(BSTR* p);
	HRESULT put_minHeight(VARIANT v);
	HRESULT get_minHeight(VARIANT* p);
}

//extern extern(C) const IID IID_IHTMLStyle5;
mixin DEFINE_IID!(IHTMLStyle5, "3050f33a-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLStyle5 : IDispatch {
public extern(Windows):
	HRESULT put_msInterpolationMode(BSTR v);
	HRESULT get_msInterpolationMode(BSTR* p);
	HRESULT put_maxHeight(VARIANT v);
	HRESULT get_maxHeight(VARIANT* p);
	HRESULT put_minWidth(VARIANT v);
	HRESULT get_minWidth(VARIANT* p);
	HRESULT put_maxWidth(VARIANT v);
	HRESULT get_maxWidth(VARIANT* p);
}

//extern extern(C) const IID IID_IHTMLStyle6;
mixin DEFINE_IID!(IHTMLStyle6, "30510480-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLStyle6 : IDispatch {
public extern(Windows):
	HRESULT put_content(BSTR v);
	HRESULT get_content(BSTR* p);
	HRESULT put_captionSide(BSTR v);
	HRESULT get_captionSide(BSTR* p);
	HRESULT put_counterIncrement(BSTR v);
	HRESULT get_counterIncrement(BSTR* p);
	HRESULT put_counterReset(BSTR v);
	HRESULT get_counterReset(BSTR* p);
	HRESULT put_outline(BSTR v);
	HRESULT get_outline(BSTR* p);
	HRESULT put_outlineWidth(VARIANT v);
	HRESULT get_outlineWidth(VARIANT* p);
	HRESULT put_outlineStyle(BSTR v);
	HRESULT get_outlineStyle(BSTR* p);
	HRESULT put_outlineColor(VARIANT v);
	HRESULT get_outlineColor(VARIANT* p);
	HRESULT put_boxSizing(BSTR v);
	HRESULT get_boxSizing(BSTR* p);
	HRESULT put_borderSpacing(BSTR v);
	HRESULT get_borderSpacing(BSTR* p);
	HRESULT put_orphans(VARIANT v);
	HRESULT get_orphans(VARIANT* p);
	HRESULT put_widows(VARIANT v);
	HRESULT get_widows(VARIANT* p);
	HRESULT put_pageBreakInside(BSTR v);
	HRESULT get_pageBreakInside(BSTR* p);
	HRESULT put_emptyCells(BSTR v);
	HRESULT get_emptyCells(BSTR* p);
	HRESULT put_msBlockProgression(BSTR v);
	HRESULT get_msBlockProgression(BSTR* p);
	HRESULT put_quotes(BSTR v);
	HRESULT get_quotes(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLRuleStyle;
mixin DEFINE_IID!(IHTMLRuleStyle, "3050f3cf-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLRuleStyle : IDispatch {
public extern(Windows):
	HRESULT put_fontFamily(BSTR v);
	HRESULT get_fontFamily(BSTR* p);
	HRESULT put_fontStyle(BSTR v);
	HRESULT get_fontStyle(BSTR* p);
	HRESULT put_fontVariant(BSTR v);
	HRESULT get_fontVariant(BSTR* p);
	HRESULT put_fontWeight(BSTR v);
	HRESULT get_fontWeight(BSTR* p);
	HRESULT put_fontSize(VARIANT v);
	HRESULT get_fontSize(VARIANT* p);
	HRESULT put_font(BSTR v);
	HRESULT get_font(BSTR* p);
	HRESULT put_color(VARIANT v);
	HRESULT get_color(VARIANT* p);
	HRESULT put_background(BSTR v);
	HRESULT get_background(BSTR* p);
	HRESULT put_backgroundColor(VARIANT v);
	HRESULT get_backgroundColor(VARIANT* p);
	HRESULT put_backgroundImage(BSTR v);
	HRESULT get_backgroundImage(BSTR* p);
	HRESULT put_backgroundRepeat(BSTR v);
	HRESULT get_backgroundRepeat(BSTR* p);
	HRESULT put_backgroundAttachment(BSTR v);
	HRESULT get_backgroundAttachment(BSTR* p);
	HRESULT put_backgroundPosition(BSTR v);
	HRESULT get_backgroundPosition(BSTR* p);
	HRESULT put_backgroundPositionX(VARIANT v);
	HRESULT get_backgroundPositionX(VARIANT* p);
	HRESULT put_backgroundPositionY(VARIANT v);
	HRESULT get_backgroundPositionY(VARIANT* p);
	HRESULT put_wordSpacing(VARIANT v);
	HRESULT get_wordSpacing(VARIANT* p);
	HRESULT put_letterSpacing(VARIANT v);
	HRESULT get_letterSpacing(VARIANT* p);
	HRESULT put_textDecoration(BSTR v);
	HRESULT get_textDecoration(BSTR* p);
	HRESULT put_textDecorationNone(VARIANT_BOOL v);
	HRESULT get_textDecorationNone(VARIANT_BOOL* p);
	HRESULT put_textDecorationUnderline(VARIANT_BOOL v);
	HRESULT get_textDecorationUnderline(VARIANT_BOOL* p);
	HRESULT put_textDecorationOverline(VARIANT_BOOL v);
	HRESULT get_textDecorationOverline(VARIANT_BOOL* p);
	HRESULT put_textDecorationLineThrough(VARIANT_BOOL v);
	HRESULT get_textDecorationLineThrough(VARIANT_BOOL* p);
	HRESULT put_textDecorationBlink(VARIANT_BOOL v);
	HRESULT get_textDecorationBlink(VARIANT_BOOL* p);
	HRESULT put_verticalAlign(VARIANT v);
	HRESULT get_verticalAlign(VARIANT* p);
	HRESULT put_textTransform(BSTR v);
	HRESULT get_textTransform(BSTR* p);
	HRESULT put_textAlign(BSTR v);
	HRESULT get_textAlign(BSTR* p);
	HRESULT put_textIndent(VARIANT v);
	HRESULT get_textIndent(VARIANT* p);
	HRESULT put_lineHeight(VARIANT v);
	HRESULT get_lineHeight(VARIANT* p);
	HRESULT put_marginTop(VARIANT v);
	HRESULT get_marginTop(VARIANT* p);
	HRESULT put_marginRight(VARIANT v);
	HRESULT get_marginRight(VARIANT* p);
	HRESULT put_marginBottom(VARIANT v);
	HRESULT get_marginBottom(VARIANT* p);
	HRESULT put_marginLeft(VARIANT v);
	HRESULT get_marginLeft(VARIANT* p);
	HRESULT put_margin(BSTR v);
	HRESULT get_margin(BSTR* p);
	HRESULT put_paddingTop(VARIANT v);
	HRESULT get_paddingTop(VARIANT* p);
	HRESULT put_paddingRight(VARIANT v);
	HRESULT get_paddingRight(VARIANT* p);
	HRESULT put_paddingBottom(VARIANT v);
	HRESULT get_paddingBottom(VARIANT* p);
	HRESULT put_paddingLeft(VARIANT v);
	HRESULT get_paddingLeft(VARIANT* p);
	HRESULT put_padding(BSTR v);
	HRESULT get_padding(BSTR* p);
	HRESULT put_border(BSTR v);
	HRESULT get_border(BSTR* p);
	HRESULT put_borderTop(BSTR v);
	HRESULT get_borderTop(BSTR* p);
	HRESULT put_borderRight(BSTR v);
	HRESULT get_borderRight(BSTR* p);
	HRESULT put_borderBottom(BSTR v);
	HRESULT get_borderBottom(BSTR* p);
	HRESULT put_borderLeft(BSTR v);
	HRESULT get_borderLeft(BSTR* p);
	HRESULT put_borderColor(BSTR v);
	HRESULT get_borderColor(BSTR* p);
	HRESULT put_borderTopColor(VARIANT v);
	HRESULT get_borderTopColor(VARIANT* p);
	HRESULT put_borderRightColor(VARIANT v);
	HRESULT get_borderRightColor(VARIANT* p);
	HRESULT put_borderBottomColor(VARIANT v);
	HRESULT get_borderBottomColor(VARIANT* p);
	HRESULT put_borderLeftColor(VARIANT v);
	HRESULT get_borderLeftColor(VARIANT* p);
	HRESULT put_borderWidth(BSTR v);
	HRESULT get_borderWidth(BSTR* p);
	HRESULT put_borderTopWidth(VARIANT v);
	HRESULT get_borderTopWidth(VARIANT* p);
	HRESULT put_borderRightWidth(VARIANT v);
	HRESULT get_borderRightWidth(VARIANT* p);
	HRESULT put_borderBottomWidth(VARIANT v);
	HRESULT get_borderBottomWidth(VARIANT* p);
	HRESULT put_borderLeftWidth(VARIANT v);
	HRESULT get_borderLeftWidth(VARIANT* p);
	HRESULT put_borderStyle(BSTR v);
	HRESULT get_borderStyle(BSTR* p);
	HRESULT put_borderTopStyle(BSTR v);
	HRESULT get_borderTopStyle(BSTR* p);
	HRESULT put_borderRightStyle(BSTR v);
	HRESULT get_borderRightStyle(BSTR* p);
	HRESULT put_borderBottomStyle(BSTR v);
	HRESULT get_borderBottomStyle(BSTR* p);
	HRESULT put_borderLeftStyle(BSTR v);
	HRESULT get_borderLeftStyle(BSTR* p);
	HRESULT put_width(VARIANT v);
	HRESULT get_width(VARIANT* p);
	HRESULT put_height(VARIANT v);
	HRESULT get_height(VARIANT* p);
	HRESULT put_styleFloat(BSTR v);
	HRESULT get_styleFloat(BSTR* p);
	HRESULT put_clear(BSTR v);
	HRESULT get_clear(BSTR* p);
	HRESULT put_display(BSTR v);
	HRESULT get_display(BSTR* p);
	HRESULT put_visibility(BSTR v);
	HRESULT get_visibility(BSTR* p);
	HRESULT put_listStyleType(BSTR v);
	HRESULT get_listStyleType(BSTR* p);
	HRESULT put_listStylePosition(BSTR v);
	HRESULT get_listStylePosition(BSTR* p);
	HRESULT put_listStyleImage(BSTR v);
	HRESULT get_listStyleImage(BSTR* p);
	HRESULT put_listStyle(BSTR v);
	HRESULT get_listStyle(BSTR* p);
	HRESULT put_whiteSpace(BSTR v);
	HRESULT get_whiteSpace(BSTR* p);
	HRESULT put_top(VARIANT v);
	HRESULT get_top(VARIANT* p);
	HRESULT put_left(VARIANT v);
	HRESULT get_left(VARIANT* p);
	HRESULT get_position(BSTR* p);
	HRESULT put_zIndex(VARIANT v);
	HRESULT get_zIndex(VARIANT* p);
	HRESULT put_overflow(BSTR v);
	HRESULT get_overflow(BSTR* p);
	HRESULT put_pageBreakBefore(BSTR v);
	HRESULT get_pageBreakBefore(BSTR* p);
	HRESULT put_pageBreakAfter(BSTR v);
	HRESULT get_pageBreakAfter(BSTR* p);
	HRESULT put_cssText(BSTR v);
	HRESULT get_cssText(BSTR* p);
	HRESULT put_cursor(BSTR v);
	HRESULT get_cursor(BSTR* p);
	HRESULT put_clip(BSTR v);
	HRESULT get_clip(BSTR* p);
	HRESULT put_filter(BSTR v);
	HRESULT get_filter(BSTR* p);
	HRESULT setAttribute(BSTR strAttributeName, VARIANT AttributeValue, LONG lFlags = 1);
	HRESULT getAttribute(BSTR strAttributeName, LONG lFlags, VARIANT* AttributeValue);
	HRESULT removeAttribute(BSTR strAttributeName, LONG lFlags, VARIANT_BOOL* pfSuccess);
}

export extern(Windows){
	HRESULT IHTMLRuleStyle_get_styleFloat_Proxy(IHTMLRuleStyle This, BSTR* p);
	void IHTMLRuleStyle_get_styleFloat_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_put_clear_Proxy(IHTMLRuleStyle This, BSTR v);
	void IHTMLRuleStyle_put_clear_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_get_clear_Proxy(IHTMLRuleStyle This, BSTR* p);
	void IHTMLRuleStyle_get_clear_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_put_display_Proxy(IHTMLRuleStyle This, BSTR v);
	void IHTMLRuleStyle_put_display_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_get_display_Proxy(IHTMLRuleStyle This, BSTR* p);
	void IHTMLRuleStyle_get_display_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_put_visibility_Proxy(IHTMLRuleStyle This, BSTR v);
	void IHTMLRuleStyle_put_visibility_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_get_visibility_Proxy(IHTMLRuleStyle This, BSTR* p);
	void IHTMLRuleStyle_get_visibility_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_put_listStyleType_Proxy(IHTMLRuleStyle This, BSTR v);
	void IHTMLRuleStyle_put_listStyleType_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_get_listStyleType_Proxy(IHTMLRuleStyle This, BSTR* p);
	void IHTMLRuleStyle_get_listStyleType_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_put_listStylePosition_Proxy(IHTMLRuleStyle This, BSTR v);
	void IHTMLRuleStyle_put_listStylePosition_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_get_listStylePosition_Proxy(IHTMLRuleStyle This, BSTR* p);
	void IHTMLRuleStyle_get_listStylePosition_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_put_listStyleImage_Proxy(IHTMLRuleStyle This, BSTR v);
	void IHTMLRuleStyle_put_listStyleImage_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_get_listStyleImage_Proxy(IHTMLRuleStyle This, BSTR* p);
	void IHTMLRuleStyle_get_listStyleImage_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_put_listStyle_Proxy(IHTMLRuleStyle This, BSTR v);
	void IHTMLRuleStyle_put_listStyle_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_get_listStyle_Proxy(IHTMLRuleStyle This, BSTR* p);
	void IHTMLRuleStyle_get_listStyle_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_put_whiteSpace_Proxy(IHTMLRuleStyle This, BSTR v);
	void IHTMLRuleStyle_put_whiteSpace_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_get_whiteSpace_Proxy(IHTMLRuleStyle This, BSTR* p);
	void IHTMLRuleStyle_get_whiteSpace_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_put_top_Proxy(IHTMLRuleStyle This, VARIANT v);
	void IHTMLRuleStyle_put_top_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_get_top_Proxy(IHTMLRuleStyle This, VARIANT* p);
	void IHTMLRuleStyle_get_top_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_put_left_Proxy(IHTMLRuleStyle This, VARIANT v);
	void IHTMLRuleStyle_put_left_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_get_left_Proxy(IHTMLRuleStyle This, VARIANT* p);
	void IHTMLRuleStyle_get_left_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_get_position_Proxy(IHTMLRuleStyle This, BSTR* p);
	void IHTMLRuleStyle_get_position_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_put_zIndex_Proxy(IHTMLRuleStyle This, VARIANT v);
	void IHTMLRuleStyle_put_zIndex_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_get_zIndex_Proxy(IHTMLRuleStyle This, VARIANT* p);
	void IHTMLRuleStyle_get_zIndex_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_put_overflow_Proxy(IHTMLRuleStyle This, BSTR v);
	void IHTMLRuleStyle_put_overflow_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_get_overflow_Proxy(IHTMLRuleStyle This, BSTR* p);
	void IHTMLRuleStyle_get_overflow_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_put_pageBreakBefore_Proxy(IHTMLRuleStyle This, BSTR v);
	void IHTMLRuleStyle_put_pageBreakBefore_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_get_pageBreakBefore_Proxy(IHTMLRuleStyle This, BSTR* p);
	void IHTMLRuleStyle_get_pageBreakBefore_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_put_pageBreakAfter_Proxy(IHTMLRuleStyle This, BSTR v);
	void IHTMLRuleStyle_put_pageBreakAfter_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_get_pageBreakAfter_Proxy(IHTMLRuleStyle This, BSTR* p);
	void IHTMLRuleStyle_get_pageBreakAfter_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_put_cssText_Proxy(IHTMLRuleStyle This, BSTR v);
	void IHTMLRuleStyle_put_cssText_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_get_cssText_Proxy(IHTMLRuleStyle This, BSTR* p);
	void IHTMLRuleStyle_get_cssText_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_put_cursor_Proxy(IHTMLRuleStyle This, BSTR v);
	void IHTMLRuleStyle_put_cursor_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_get_cursor_Proxy(IHTMLRuleStyle This, BSTR* p);
	void IHTMLRuleStyle_get_cursor_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_put_clip_Proxy(IHTMLRuleStyle This, BSTR v);
	void IHTMLRuleStyle_put_clip_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_get_clip_Proxy(IHTMLRuleStyle This, BSTR* p);
	void IHTMLRuleStyle_get_clip_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_put_filter_Proxy(IHTMLRuleStyle This, BSTR v);
	void IHTMLRuleStyle_put_filter_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_get_filter_Proxy(IHTMLRuleStyle This, BSTR* p);
	void IHTMLRuleStyle_get_filter_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_setAttribute_Proxy(IHTMLRuleStyle This, BSTR strAttributeName, VARIANT AttributeValue, LONG lFlags);
	void IHTMLRuleStyle_setAttribute_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_getAttribute_Proxy(IHTMLRuleStyle This, BSTR strAttributeName, LONG lFlags, VARIANT* AttributeValue);
	void IHTMLRuleStyle_getAttribute_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IHTMLRuleStyle_removeAttribute_Proxy(IHTMLRuleStyle This, BSTR strAttributeName, LONG lFlags, VARIANT_BOOL* pfSuccess);
	void IHTMLRuleStyle_removeAttribute_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_IHTMLRuleStyle2;
mixin DEFINE_IID!(IHTMLRuleStyle2, "3050f4ac-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLRuleStyle2 : IDispatch {
public extern(Windows):
	HRESULT put_tableLayout(BSTR v);
	HRESULT get_tableLayout(BSTR* p);
	HRESULT put_borderCollapse(BSTR v);
	HRESULT get_borderCollapse(BSTR* p);
	HRESULT put_direction(BSTR v);
	HRESULT get_direction(BSTR* p);
	HRESULT put_behavior(BSTR v);
	HRESULT get_behavior(BSTR* p);
	HRESULT put_position(BSTR v);
	HRESULT get_position(BSTR* p);
	HRESULT put_unicodeBidi(BSTR v);
	HRESULT get_unicodeBidi(BSTR* p);
	HRESULT put_bottom(VARIANT v);
	HRESULT get_bottom(VARIANT* p);
	HRESULT put_right(VARIANT v);
	HRESULT get_right(VARIANT* p);
	HRESULT put_pixelBottom(int v);
	HRESULT get_pixelBottom(int* p);
	HRESULT put_pixelRight(int v);
	HRESULT get_pixelRight(int* p);
	HRESULT put_posBottom(float v);
	HRESULT get_posBottom(float* p);
	HRESULT put_posRight(float v);
	HRESULT get_posRight(float* p);
	HRESULT put_imeMode(BSTR v);
	HRESULT get_imeMode(BSTR* p);
	HRESULT put_rubyAlign(BSTR v);
	HRESULT get_rubyAlign(BSTR* p);
	HRESULT put_rubyPosition(BSTR v);
	HRESULT get_rubyPosition(BSTR* p);
	HRESULT put_rubyOverhang(BSTR v);
	HRESULT get_rubyOverhang(BSTR* p);
	HRESULT put_layoutGridChar(VARIANT v);
	HRESULT get_layoutGridChar(VARIANT* p);
	HRESULT put_layoutGridLine(VARIANT v);
	HRESULT get_layoutGridLine(VARIANT* p);
	HRESULT put_layoutGridMode(BSTR v);
	HRESULT get_layoutGridMode(BSTR* p);
	HRESULT put_layoutGridType(BSTR v);
	HRESULT get_layoutGridType(BSTR* p);
	HRESULT put_layoutGrid(BSTR v);
	HRESULT get_layoutGrid(BSTR* p);
	HRESULT put_textAutospace(BSTR v);
	HRESULT get_textAutospace(BSTR* p);
	HRESULT put_wordBreak(BSTR v);
	HRESULT get_wordBreak(BSTR* p);
	HRESULT put_lineBreak(BSTR v);
	HRESULT get_lineBreak(BSTR* p);
	HRESULT put_textJustify(BSTR v);
	HRESULT get_textJustify(BSTR* p);
	HRESULT put_textJustifyTrim(BSTR v);
	HRESULT get_textJustifyTrim(BSTR* p);
	HRESULT put_textKashida(VARIANT v);
	HRESULT get_textKashida(VARIANT* p);
	HRESULT put_overflowX(BSTR v);
	HRESULT get_overflowX(BSTR* p);
	HRESULT put_overflowY(BSTR v);
	HRESULT get_overflowY(BSTR* p);
	HRESULT put_accelerator(BSTR v);
	HRESULT get_accelerator(BSTR* p);
}

mixin DEFINE_IID!(IHTMLRuleStyle3, "3050f657-98b5-11cf-bb82-00aa00bdce0b");
//extern extern(C) const IID IID_IHTMLRuleStyle3;
interface IHTMLRuleStyle3 : IDispatch {
public extern(Windows):
	HRESULT put_layoutFlow(BSTR v);
	HRESULT get_layoutFlow(BSTR* p);
	HRESULT put_zoom(VARIANT v);
	HRESULT get_zoom(VARIANT* p);
	HRESULT put_wordWrap(BSTR v);
	HRESULT get_wordWrap(BSTR* p);
	HRESULT put_textUnderlinePosition(BSTR v);
	HRESULT get_textUnderlinePosition(BSTR* p);
	HRESULT put_scrollbarBaseColor(VARIANT v);
	HRESULT get_scrollbarBaseColor(VARIANT* p);
	HRESULT put_scrollbarFaceColor(VARIANT v);
	HRESULT get_scrollbarFaceColor(VARIANT* p);
	HRESULT put_scrollbar3dLightColor(VARIANT v);
	HRESULT get_scrollbar3dLightColor(VARIANT* p);
	HRESULT put_scrollbarShadowColor(VARIANT v);
	HRESULT get_scrollbarShadowColor(VARIANT* p);
	HRESULT put_scrollbarHighlightColor(VARIANT v);
	HRESULT get_scrollbarHighlightColor(VARIANT* p);
	HRESULT put_scrollbarDarkShadowColor(VARIANT v);
	HRESULT get_scrollbarDarkShadowColor(VARIANT* p);
	HRESULT put_scrollbarArrowColor(VARIANT v);
	HRESULT get_scrollbarArrowColor(VARIANT* p);
	HRESULT put_scrollbarTrackColor(VARIANT v);
	HRESULT get_scrollbarTrackColor(VARIANT* p);
	HRESULT put_writingMode(BSTR v);
	HRESULT get_writingMode(BSTR* p);
	HRESULT put_textAlignLast(BSTR v);
	HRESULT get_textAlignLast(BSTR* p);
	HRESULT put_textKashidaSpace(VARIANT v);
	HRESULT get_textKashidaSpace(VARIANT* p);
}

//extern extern(C) const IID IID_IHTMLRuleStyle4;
mixin DEFINE_IID!(IHTMLRuleStyle4, "3050f817-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLRuleStyle4 : IDispatch {
public extern(Windows):
	HRESULT put_textOverflow(BSTR v);
	HRESULT get_textOverflow(BSTR* p);
	HRESULT put_minHeight(VARIANT v);
	HRESULT get_minHeight(VARIANT* p);
}

//extern extern(C) const IID IID_IHTMLRuleStyle5;
mixin DEFINE_IID!(IHTMLRuleStyle5, "3050f335-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLRuleStyle5 : IDispatch {
public extern(Windows):
	HRESULT put_msInterpolationMode(BSTR v);
	HRESULT get_msInterpolationMode(BSTR* p);
	HRESULT put_maxHeight(VARIANT v);
	HRESULT get_maxHeight(VARIANT* p);
	HRESULT put_minWidth(VARIANT v);
	HRESULT get_minWidth(VARIANT* p);
	HRESULT put_maxWidth(VARIANT v);
	HRESULT get_maxWidth(VARIANT* p);
}

//extern extern(C) const IID IID_IHTMLRuleStyle6;
mixin DEFINE_IID!(IHTMLRuleStyle6, "30510471-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLRuleStyle6 : IDispatch {
public extern(Windows):
	HRESULT put_content(BSTR v);
	HRESULT get_content(BSTR* p);
	HRESULT put_captionSide(BSTR v);
	HRESULT get_captionSide(BSTR* p);
	HRESULT put_counterIncrement(BSTR v);
	HRESULT get_counterIncrement(BSTR* p);
	HRESULT put_counterReset(BSTR v);
	HRESULT get_counterReset(BSTR* p);
	HRESULT put_outline(BSTR v);
	HRESULT get_outline(BSTR* p);
	HRESULT put_outlineWidth(VARIANT v);
	HRESULT get_outlineWidth(VARIANT* p);
	HRESULT put_outlineStyle(BSTR v);
	HRESULT get_outlineStyle(BSTR* p);
	HRESULT put_outlineColor(VARIANT v);
	HRESULT get_outlineColor(VARIANT* p);
	HRESULT put_boxSizing(BSTR v);
	HRESULT get_boxSizing(BSTR* p);
	HRESULT put_borderSpacing(BSTR v);
	HRESULT get_borderSpacing(BSTR* p);
	HRESULT put_orphans(VARIANT v);
	HRESULT get_orphans(VARIANT* p);
	HRESULT put_widows(VARIANT v);
	HRESULT get_widows(VARIANT* p);
	HRESULT put_pageBreakInside(BSTR v);
	HRESULT get_pageBreakInside(BSTR* p);
	HRESULT put_emptyCells(BSTR v);
	HRESULT get_emptyCells(BSTR* p);
	HRESULT put_msBlockProgression(BSTR v);
	HRESULT get_msBlockProgression(BSTR* p);
	HRESULT put_quotes(BSTR v);
	HRESULT get_quotes(BSTR* p);
}

//extern extern(C) const IID DIID_DispHTMLStyle;
mixin DEFINE_GUID!("DIID_DispHTMLStyle", "3050f55a-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLStyle : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLStyle;
mixin DEFINE_GUID!("CLSID_HTMLStyle", "3050f285-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTMLRuleStyle;
mixin DEFINE_GUID!("DIID_DispHTMLRuleStyle", "3050f55c-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLRuleStyle : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLRuleStyle;
mixin DEFINE_GUID!("CLSID_HTMLRuleStyle", "3050f3d0-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLRenderStyle;
mixin DEFINE_IID!(IHTMLRenderStyle, "3050f6ae-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLRenderStyle : IDispatch {
public extern(Windows):
	HRESULT put_textLineThroughStyle(BSTR v);
	HRESULT get_textLineThroughStyle(BSTR* p);
	HRESULT put_textUnderlineStyle(BSTR v);
	HRESULT get_textUnderlineStyle(BSTR* p);
	HRESULT put_textEffect(BSTR v);
	HRESULT get_textEffect(BSTR* p);
	HRESULT put_textColor(VARIANT v);
	HRESULT get_textColor(VARIANT* p);
	HRESULT put_textBackgroundColor(VARIANT v);
	HRESULT get_textBackgroundColor(VARIANT* p);
	HRESULT put_textDecorationColor(VARIANT v);
	HRESULT get_textDecorationColor(VARIANT* p);
	HRESULT put_renderingPriority(int v);
	HRESULT get_renderingPriority(int* p);
	HRESULT put_defaultTextSelection(BSTR v);
	HRESULT get_defaultTextSelection(BSTR* p);
	HRESULT put_textDecoration(BSTR v);
	HRESULT get_textDecoration(BSTR* p);
}

//extern extern(C) const IID DIID_DispHTMLRenderStyle;
mixin DEFINE_GUID!("DIID_DispHTMLRenderStyle", "3050f58b-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLRenderStyle : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLRenderStyle;
mixin DEFINE_GUID!("CLSID_HTMLRenderStyle", "3050f6aa-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLCurrentStyle;
mixin DEFINE_IID!(IHTMLCurrentStyle, "3050f3db-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLCurrentStyle : IDispatch {
public extern(Windows):
	HRESULT get_position(BSTR* p);
	HRESULT get_styleFloat(BSTR* p);
	HRESULT get_color(VARIANT* p);
	HRESULT get_backgroundColor(VARIANT* p);
	HRESULT get_fontFamily(BSTR* p);
	HRESULT get_fontStyle(BSTR* p);
	HRESULT get_fontVariant(BSTR* p);
	HRESULT get_fontWeight(VARIANT* p);
	HRESULT get_fontSize(VARIANT* p);
	HRESULT get_backgroundImage(BSTR* p);
	HRESULT get_backgroundPositionX(VARIANT* p);
	HRESULT get_backgroundPositionY(VARIANT* p);
	HRESULT get_backgroundRepeat(BSTR* p);
	HRESULT get_borderLeftColor(VARIANT* p);
	HRESULT get_borderTopColor(VARIANT* p);
	HRESULT get_borderRightColor(VARIANT* p);
	HRESULT get_borderBottomColor(VARIANT* p);
	HRESULT get_borderTopStyle(BSTR* p);
	HRESULT get_borderRightStyle(BSTR* p);
	HRESULT get_borderBottomStyle(BSTR* p);
	HRESULT get_borderLeftStyle(BSTR* p);
	HRESULT get_borderTopWidth(VARIANT* p);
	HRESULT get_borderRightWidth(VARIANT* p);
	HRESULT get_borderBottomWidth(VARIANT* p);
	HRESULT get_borderLeftWidth(VARIANT* p);
	HRESULT get_left(VARIANT* p);
	HRESULT get_top(VARIANT* p);
	HRESULT get_width(VARIANT* p);
	HRESULT get_height(VARIANT* p);
	HRESULT get_paddingLeft(VARIANT* p);
	HRESULT get_paddingTop(VARIANT* p);
	HRESULT get_paddingRight(VARIANT* p);
	HRESULT get_paddingBottom(VARIANT* p);
	HRESULT get_textAlign(BSTR* p);
	HRESULT get_textDecoration(BSTR* p);
	HRESULT get_display(BSTR* p);
	HRESULT get_visibility(BSTR* p);
	HRESULT get_zIndex(VARIANT* p);
	HRESULT get_letterSpacing(VARIANT* p);
	HRESULT get_lineHeight(VARIANT* p);
	HRESULT get_textIndent(VARIANT* p);
	HRESULT get_verticalAlign(VARIANT* p);
	HRESULT get_backgroundAttachment(BSTR* p);
	HRESULT get_marginTop(VARIANT* p);
	HRESULT get_marginRight(VARIANT* p);
	HRESULT get_marginBottom(VARIANT* p);
	HRESULT get_marginLeft(VARIANT* p);
	HRESULT get_clear(BSTR* p);
	HRESULT get_listStyleType(BSTR* p);
	HRESULT get_listStylePosition(BSTR* p);
	HRESULT get_listStyleImage(BSTR* p);
	HRESULT get_clipTop(VARIANT* p);
	HRESULT get_clipRight(VARIANT* p);
	HRESULT get_clipBottom(VARIANT* p);
	HRESULT get_clipLeft(VARIANT* p);
	HRESULT get_overflow(BSTR* p);
	HRESULT get_pageBreakBefore(BSTR* p);
	HRESULT get_pageBreakAfter(BSTR* p);
	HRESULT get_cursor(BSTR* p);
	HRESULT get_tableLayout(BSTR* p);
	HRESULT get_borderCollapse(BSTR* p);
	HRESULT get_direction(BSTR* p);
	HRESULT get_behavior(BSTR* p);
	HRESULT getAttribute(BSTR strAttributeName, LONG lFlags, VARIANT* AttributeValue);
	HRESULT get_unicodeBidi(BSTR* p);
	HRESULT get_right(VARIANT* p);
	HRESULT get_bottom(VARIANT* p);
	HRESULT get_imeMode(BSTR* p);
	HRESULT get_rubyAlign(BSTR* p);
	HRESULT get_rubyPosition(BSTR* p);
	HRESULT get_rubyOverhang(BSTR* p);
	HRESULT get_textAutospace(BSTR* p);
	HRESULT get_lineBreak(BSTR* p);
	HRESULT get_wordBreak(BSTR* p);
	HRESULT get_textJustify(BSTR* p);
	HRESULT get_textJustifyTrim(BSTR* p);
	HRESULT get_textKashida(VARIANT* p);
	HRESULT get_blockDirection(BSTR* p);
	HRESULT get_layoutGridChar(VARIANT* p);
	HRESULT get_layoutGridLine(VARIANT* p);
	HRESULT get_layoutGridMode(BSTR* p);
	HRESULT get_layoutGridType(BSTR* p);
	HRESULT get_borderStyle(BSTR* p);
	HRESULT get_borderColor(BSTR* p);
	HRESULT get_borderWidth(BSTR* p);
	HRESULT get_padding(BSTR* p);
	HRESULT get_margin(BSTR* p);
	HRESULT get_accelerator(BSTR* p);
	HRESULT get_overflowX(BSTR* p);
	HRESULT get_overflowY(BSTR* p);
	HRESULT get_textTransform(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLCurrentStyle2;
mixin DEFINE_IID!(IHTMLCurrentStyle2, "3050f658-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLCurrentStyle2 : IDispatch {
public extern(Windows):
	HRESULT get_layoutFlow(BSTR* p);
	HRESULT get_wordWrap(BSTR* p);
	HRESULT get_textUnderlinePosition(BSTR* p);
	HRESULT get_hasLayout(VARIANT_BOOL* p);
	HRESULT get_scrollbarBaseColor(VARIANT* p);
	HRESULT get_scrollbarFaceColor(VARIANT* p);
	HRESULT get_scrollbar3dLightColor(VARIANT* p);
	HRESULT get_scrollbarShadowColor(VARIANT* p);
	HRESULT get_scrollbarHighlightColor(VARIANT* p);
	HRESULT get_scrollbarDarkShadowColor(VARIANT* p);
	HRESULT get_scrollbarArrowColor(VARIANT* p);
	HRESULT get_scrollbarTrackColor(VARIANT* p);
	HRESULT get_writingMode(BSTR* p);
	HRESULT get_zoom(VARIANT* p);
	HRESULT get_filter(BSTR* p);
	HRESULT get_textAlignLast(BSTR* p);
	HRESULT get_textKashidaSpace(VARIANT* p);
	HRESULT get_isBlock(VARIANT_BOOL* p);
}

//extern extern(C) const IID IID_IHTMLCurrentStyle3;
mixin DEFINE_IID!(IHTMLCurrentStyle3, "3050f818-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLCurrentStyle3 : IDispatch {
public extern(Windows):
	HRESULT get_textOverflow(BSTR* p);
	HRESULT get_minHeight(VARIANT* p);
	HRESULT get_wordSpacing(VARIANT* p);
	HRESULT get_whiteSpace(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLCurrentStyle4;
mixin DEFINE_IID!(IHTMLCurrentStyle4, "3050f33b-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLCurrentStyle4 : IDispatch {
public extern(Windows):
	HRESULT get_msInterpolationMode(BSTR* p);
	HRESULT get_maxHeight(VARIANT* p);
	HRESULT get_minWidth(VARIANT* p);
	HRESULT get_maxWidth(VARIANT* p);
}

//extern extern(C) const IID IID_IHTMLCurrentStyle5;
mixin DEFINE_IID!(IHTMLCurrentStyle5, "30510481-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLCurrentStyle5 : IDispatch {
public extern(Windows):
	HRESULT get_captionSide(BSTR* p);
	HRESULT get_outline(BSTR* p);
	HRESULT get_outlineWidth(VARIANT* p);
	HRESULT get_outlineStyle(BSTR* p);
	HRESULT get_outlineColor(VARIANT* p);
	HRESULT get_boxSizing(BSTR* p);
	HRESULT get_borderSpacing(BSTR* p);
	HRESULT get_orphans(VARIANT* p);
	HRESULT get_widows(VARIANT* p);
	HRESULT get_pageBreakInside(BSTR* p);
	HRESULT get_emptyCells(BSTR* p);
	HRESULT get_msBlockProgression(BSTR* p);
	HRESULT get_quotes(BSTR* p);
}

//extern extern(C) const IID DIID_DispHTMLCurrentStyle;
mixin DEFINE_GUID!("DIID_DispHTMLCurrentStyle", "3050f557-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLCurrentStyle : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLCurrentStyle;
mixin DEFINE_GUID!("CLSID_HTMLCurrentStyle", "3050f3dc-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLElement;
mixin DEFINE_IID!(IHTMLElement, "3050f1ff-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLElement : IDispatch {
public extern(Windows):
	HRESULT setAttribute(BSTR strAttributeName, VARIANT AttributeValue, LONG lFlags = 1);
	HRESULT getAttribute(BSTR strAttributeName, LONG lFlags, VARIANT* AttributeValue);
	HRESULT removeAttribute(BSTR strAttributeName, LONG lFlags, VARIANT_BOOL* pfSuccess);
	HRESULT put_className(BSTR v);
	HRESULT get_className(BSTR* p);
	HRESULT put_id(BSTR v);
	HRESULT get_id(BSTR* p);
	HRESULT get_tagName(BSTR* p);
	HRESULT get_parentElement(IHTMLElement* p);
	HRESULT get_style(IHTMLStyle* p);
	HRESULT put_onhelp(VARIANT v);
	HRESULT get_onhelp(VARIANT* p);
	HRESULT put_onclick(VARIANT v);
	HRESULT get_onclick(VARIANT* p);
	HRESULT put_ondblclick(VARIANT v);
	HRESULT get_ondblclick(VARIANT* p);
	HRESULT put_onkeydown(VARIANT v);
	HRESULT get_onkeydown(VARIANT* p);
	HRESULT put_onkeyup(VARIANT v);
	HRESULT get_onkeyup(VARIANT* p);
	HRESULT put_onkeypress(VARIANT v);
	HRESULT get_onkeypress(VARIANT* p);
	HRESULT put_onmouseout(VARIANT v);
	HRESULT get_onmouseout(VARIANT* p);
	HRESULT put_onmouseover(VARIANT v);
	HRESULT get_onmouseover(VARIANT* p);
	HRESULT put_onmousemove(VARIANT v);
	HRESULT get_onmousemove(VARIANT* p);
	HRESULT put_onmousedown(VARIANT v);
	HRESULT get_onmousedown(VARIANT* p);
	HRESULT put_onmouseup(VARIANT v);
	HRESULT get_onmouseup(VARIANT* p);
	HRESULT get_document(IDispatch* p);
	HRESULT put_title(BSTR v);
	HRESULT get_title(BSTR* p);
	HRESULT put_language(BSTR v);
	HRESULT get_language(BSTR* p);
	HRESULT put_onselectstart(VARIANT v);
	HRESULT get_onselectstart(VARIANT* p);
	HRESULT scrollIntoView(VARIANT varargStart);
	HRESULT contains(IHTMLElement pChild, VARIANT_BOOL* pfResult);
	HRESULT get_sourceIndex(int* p);
	HRESULT get_recordNumber(VARIANT* p);
	HRESULT put_lang(BSTR v);
	HRESULT get_lang(BSTR* p);
	HRESULT get_offsetLeft(int* p);
	HRESULT get_offsetTop(int* p);
	HRESULT get_offsetWidth(int* p);
	HRESULT get_offsetHeight(int* p);
	HRESULT get_offsetParent(IHTMLElement* p);
	HRESULT put_innerHTML(BSTR v);
	HRESULT get_innerHTML(BSTR* p);
	HRESULT put_innerText(BSTR v);
	HRESULT get_innerText(BSTR* p);
	HRESULT put_outerHTML(BSTR v);
	HRESULT get_outerHTML(BSTR* p);
	HRESULT put_outerText(BSTR v);
	HRESULT get_outerText(BSTR* p);
	HRESULT insertAdjacentHTML(BSTR where, BSTR html);
	HRESULT insertAdjacentText(BSTR where, BSTR text);
	HRESULT get_parentTextEdit(IHTMLElement* p);
	HRESULT get_isTextEdit(VARIANT_BOOL* p);
	HRESULT click();
	HRESULT get_filters(IHTMLFiltersCollection* p);
	HRESULT put_ondragstart(VARIANT v);
	HRESULT get_ondragstart(VARIANT* p);
	HRESULT toString(BSTR* String);
	HRESULT put_onbeforeupdate(VARIANT v);
	HRESULT get_onbeforeupdate(VARIANT* p);
	HRESULT put_onafterupdate(VARIANT v);
	HRESULT get_onafterupdate(VARIANT* p);
	HRESULT put_onerrorupdate(VARIANT v);
	HRESULT get_onerrorupdate(VARIANT* p);
	HRESULT put_onrowexit(VARIANT v);
	HRESULT get_onrowexit(VARIANT* p);
	HRESULT put_onrowenter(VARIANT v);
	HRESULT get_onrowenter(VARIANT* p);
	HRESULT put_ondatasetchanged(VARIANT v);
	HRESULT get_ondatasetchanged(VARIANT* p);
	HRESULT put_ondataavailable(VARIANT v);
	HRESULT get_ondataavailable(VARIANT* p);
	HRESULT put_ondatasetcomplete(VARIANT v);
	HRESULT get_ondatasetcomplete(VARIANT* p);
	HRESULT put_onfilterchange(VARIANT v);
	HRESULT get_onfilterchange(VARIANT* p);
	HRESULT get_children(IDispatch* p);
	HRESULT get_all(IDispatch* p);
}

//extern extern(C) const IID IID_IHTMLRect;
mixin DEFINE_IID!(IHTMLRect, "3050f4a3-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLRect : IDispatch {
public extern(Windows):
	HRESULT put_left(int v);
	HRESULT get_left(int* p);
	HRESULT put_top(int v);
	HRESULT get_top(int* p);
	HRESULT put_right(int v);
	HRESULT get_right(int* p);
	HRESULT put_bottom(int v);
	HRESULT get_bottom(int* p);
}

//extern extern(C) const IID IID_IHTMLRectCollection;
mixin DEFINE_IID!(IHTMLRectCollection, "3050f4a4-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLRectCollection : IDispatch {
public extern(Windows):
	HRESULT get_length(int* p);
	HRESULT get__newEnum(IUnknown* p);
	HRESULT item(VARIANT* pvarIndex, VARIANT* pvarResult);
}

//extern extern(C) const IID IID_IHTMLElementCollection;
mixin DEFINE_IID!(IHTMLElementCollection, "3050f21f-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLElementCollection : IDispatch {
public extern(Windows):
	HRESULT toString(BSTR* String);
	HRESULT put_length(int v);
	HRESULT get_length(int* p);
	HRESULT get__newEnum(IUnknown* p);
	HRESULT item(VARIANT name, VARIANT index, IDispatch* pdisp);
	HRESULT tags(VARIANT tagName, IDispatch* pdisp);
}

//extern extern(C) const IID IID_IHTMLElement2;
mixin DEFINE_IID!(IHTMLElement2, "3050f434-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLElement2 : IDispatch {
public extern(Windows):
	HRESULT get_scopeName(BSTR* p);
	HRESULT setCapture(VARIANT_BOOL containerCapture = -1);
	HRESULT releaseCapture();
	HRESULT put_onlosecapture(VARIANT v);
	HRESULT get_onlosecapture(VARIANT* p);
	HRESULT componentFromPoint(int x, int y, BSTR* component);
	HRESULT doScroll(VARIANT component);
	HRESULT put_onscroll(VARIANT v);
	HRESULT get_onscroll(VARIANT* p);
	HRESULT put_ondrag(VARIANT v);
	HRESULT get_ondrag(VARIANT* p);
	HRESULT put_ondragend(VARIANT v);
	HRESULT get_ondragend(VARIANT* p);
	HRESULT put_ondragenter(VARIANT v);
	HRESULT get_ondragenter(VARIANT* p);
	HRESULT put_ondragover(VARIANT v);
	HRESULT get_ondragover(VARIANT* p);
	HRESULT put_ondragleave(VARIANT v);
	HRESULT get_ondragleave(VARIANT* p);
	HRESULT put_ondrop(VARIANT v);
	HRESULT get_ondrop(VARIANT* p);
	HRESULT put_onbeforecut(VARIANT v);
	HRESULT get_onbeforecut(VARIANT* p);
	HRESULT put_oncut(VARIANT v);
	HRESULT get_oncut(VARIANT* p);
	HRESULT put_onbeforecopy(VARIANT v);
	HRESULT get_onbeforecopy(VARIANT* p);
	HRESULT put_oncopy(VARIANT v);
	HRESULT get_oncopy(VARIANT* p);
	HRESULT put_onbeforepaste(VARIANT v);
	HRESULT get_onbeforepaste(VARIANT* p);
	HRESULT put_onpaste(VARIANT v);
	HRESULT get_onpaste(VARIANT* p);
	HRESULT get_currentStyle(IHTMLCurrentStyle* p);
	HRESULT put_onpropertychange(VARIANT v);
	HRESULT get_onpropertychange(VARIANT* p);
	HRESULT getClientRects(IHTMLRectCollection* pRectCol);
	HRESULT getBoundingClientRect(IHTMLRect* pRect);
	HRESULT setExpression(BSTR propname, BSTR expression, BSTR language/* = ""*/);
	HRESULT getExpression(BSTR propname, VARIANT* expression);
	HRESULT removeExpression(BSTR propname, VARIANT_BOOL* pfSuccess);
	HRESULT put_tabIndex(short v);
	HRESULT get_tabIndex(short* p);
	HRESULT focus();
	HRESULT put_accessKey(BSTR v);
	HRESULT get_accessKey(BSTR* p);
	HRESULT put_onblur(VARIANT v);
	HRESULT get_onblur(VARIANT* p);
	HRESULT put_onfocus(VARIANT v);
	HRESULT get_onfocus(VARIANT* p);
	HRESULT put_onresize(VARIANT v);
	HRESULT get_onresize(VARIANT* p);
	HRESULT blur();
	HRESULT addFilter(IUnknown pUnk);
	HRESULT removeFilter(IUnknown pUnk);
	HRESULT get_clientHeight(int* p);
	HRESULT get_clientWidth(int* p);
	HRESULT get_clientTop(int* p);
	HRESULT get_clientLeft(int* p);
	HRESULT attachEvent(BSTR event, IDispatch pDisp, VARIANT_BOOL* pfResult);
	HRESULT detachEvent(BSTR event, IDispatch pDisp);
	HRESULT get_readyState(VARIANT* p);
	HRESULT put_onreadystatechange(VARIANT v);
	HRESULT get_onreadystatechange(VARIANT* p);
	HRESULT put_onrowsdelete(VARIANT v);
	HRESULT get_onrowsdelete(VARIANT* p);
	HRESULT put_onrowsinserted(VARIANT v);
	HRESULT get_onrowsinserted(VARIANT* p);
	HRESULT put_oncellchange(VARIANT v);
	HRESULT get_oncellchange(VARIANT* p);
	HRESULT put_dir(BSTR v);
	HRESULT get_dir(BSTR* p);
	HRESULT createControlRange(IDispatch* range);
	HRESULT get_scrollHeight(int* p);
	HRESULT get_scrollWidth(int* p);
	HRESULT put_scrollTop(int v);
	HRESULT get_scrollTop(int* p);
	HRESULT put_scrollLeft(int v);
	HRESULT get_scrollLeft(int* p);
	HRESULT clearAttributes();
	HRESULT mergeAttributes(IHTMLElement mergeThis);
	HRESULT put_oncontextmenu(VARIANT v);
	HRESULT get_oncontextmenu(VARIANT* p);
	HRESULT insertAdjacentElement(BSTR where, IHTMLElement insertedElement, IHTMLElement* inserted);
	HRESULT applyElement(IHTMLElement apply, BSTR where, IHTMLElement* applied);
	HRESULT getAdjacentText(BSTR where, BSTR* text);
	HRESULT replaceAdjacentText(BSTR where, BSTR newText, BSTR* oldText);
	HRESULT get_canHaveChildren(VARIANT_BOOL* p);
	HRESULT addBehavior(BSTR bstrUrl, VARIANT* pvarFactory, int* pCookie);
	HRESULT removeBehavior(int cookie, VARIANT_BOOL* pfResult);
	HRESULT get_runtimeStyle(IHTMLStyle* p);
	HRESULT get_behaviorUrns(IDispatch* p);
	HRESULT put_tagUrn(BSTR v);
	HRESULT get_tagUrn(BSTR* p);
	HRESULT put_onbeforeeditfocus(VARIANT v);
	HRESULT get_onbeforeeditfocus(VARIANT* p);
	HRESULT get_readyStateValue(int* p);
	HRESULT getElementsByTagName(BSTR v, IHTMLElementCollection* pelColl);
}

//extern extern(C) const IID IID_IHTMLAttributeCollection3;
mixin DEFINE_IID!(IHTMLAttributeCollection3, "30510469-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLAttributeCollection3 : IDispatch {
public extern(Windows):
	HRESULT getNamedItem(BSTR bstrName, IHTMLDOMAttribute* ppNodeOut);
	HRESULT setNamedItem(IHTMLDOMAttribute pNodeIn, IHTMLDOMAttribute* ppNodeOut);
	HRESULT removeNamedItem(BSTR bstrName, IHTMLDOMAttribute* ppNodeOut);
	HRESULT item(int index, IHTMLDOMAttribute* ppNodeOut);
	HRESULT get_length(int* p);
}

//extern extern(C) const IID IID_IHTMLDOMNode;
mixin DEFINE_IID!(IHTMLDOMNode, "3050f5da-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLDOMNode : IDispatch {
public extern(Windows):
	HRESULT get_nodeType(int* p);
	HRESULT get_parentNode(IHTMLDOMNode* p);
	HRESULT hasChildNodes(VARIANT_BOOL* fChildren);
	HRESULT get_childNodes(IDispatch* p);
	HRESULT get_attributes(IDispatch* p);
	HRESULT insertBefore(IHTMLDOMNode newChild, VARIANT refChild, IHTMLDOMNode* node);
	HRESULT removeChild(IHTMLDOMNode oldChild, IHTMLDOMNode* node);
	HRESULT replaceChild(IHTMLDOMNode newChild, IHTMLDOMNode oldChild, IHTMLDOMNode* node);
	HRESULT cloneNode(VARIANT_BOOL fDeep, IHTMLDOMNode* clonedNode);
	HRESULT removeNode(VARIANT_BOOL fDeep, IHTMLDOMNode* removed);
	HRESULT swapNode(IHTMLDOMNode otherNode, IHTMLDOMNode* swappedNode);
	HRESULT replaceNode(IHTMLDOMNode replacement, IHTMLDOMNode* replaced);
	HRESULT appendChild(IHTMLDOMNode newChild, IHTMLDOMNode* node);
	HRESULT get_nodeName(BSTR* p);
	HRESULT put_nodeValue(VARIANT v);
	HRESULT get_nodeValue(VARIANT* p);
	HRESULT get_firstChild(IHTMLDOMNode* p);
	HRESULT get_lastChild(IHTMLDOMNode* p);
	HRESULT get_previousSibling(IHTMLDOMNode* p);
	HRESULT get_nextSibling(IHTMLDOMNode* p);

}

//extern extern(C) const IID IID_IHTMLDOMNode2;
mixin DEFINE_IID!(IHTMLDOMNode2, "3050f80b-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLDOMNode2 : IDispatch {
public extern(Windows):
	HRESULT get_ownerDocument(IDispatch* p);
}

//extern extern(C) const IID IID_IHTMLDOMAttribute;
mixin DEFINE_IID!(IHTMLDOMAttribute, "3050f4b0-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLDOMAttribute : IDispatch {
public extern(Windows):
	HRESULT get_nodeName(BSTR* p);
	HRESULT put_nodeValue(VARIANT v);
	HRESULT get_nodeValue(VARIANT* p);
	HRESULT get_specified(VARIANT_BOOL* p);
}

//extern extern(C) const IID IID_IHTMLDOMAttribute2;
mixin DEFINE_IID!(IHTMLDOMAttribute2, "3050f810-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLDOMAttribute2 : IDispatch {
public extern(Windows):
	HRESULT get_name(BSTR* p);
	HRESULT put_value(BSTR v);
	HRESULT get_value(BSTR* p);
	HRESULT get_expando(VARIANT_BOOL* p);
	HRESULT get_nodeType(int* p);
	HRESULT get_parentNode(IHTMLDOMNode* p);
	HRESULT get_childNodes(IDispatch* p);
	HRESULT get_firstChild(IHTMLDOMNode* p);
	HRESULT get_lastChild(IHTMLDOMNode* p);
	HRESULT get_previousSibling(IHTMLDOMNode* p);
	HRESULT get_nextSibling(IHTMLDOMNode* p);
	HRESULT get_attributes(IDispatch* p);
	HRESULT get_ownerDocument(IDispatch* p);
	HRESULT insertBefore(IHTMLDOMNode newChild, VARIANT refChild, IHTMLDOMNode* node);
	HRESULT replaceChild(IHTMLDOMNode newChild, IHTMLDOMNode oldChild, IHTMLDOMNode* node);
	HRESULT removeChild(IHTMLDOMNode oldChild, IHTMLDOMNode* node);
	HRESULT appendChild(IHTMLDOMNode newChild, IHTMLDOMNode* node);
	HRESULT hasChildNodes(VARIANT_BOOL* fChildren);
	HRESULT cloneNode(VARIANT_BOOL fDeep, IHTMLDOMAttribute* clonedNode);
}

//extern extern(C) const IID IID_IHTMLDOMAttribute3;
mixin DEFINE_IID!(IHTMLDOMAttribute3, "30510468-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLDOMAttribute3 : IDispatch {
public extern(Windows):
	HRESULT put_nodeValue(VARIANT v);
	HRESULT get_nodeValue(VARIANT* p);
	HRESULT put_value(BSTR v);
	HRESULT get_value(BSTR* p);
	HRESULT get_specified(VARIANT_BOOL* p);
	HRESULT get_ownerElement(IHTMLElement2* p);
}

//extern extern(C) const IID IID_IHTMLDOMTextNode;
mixin DEFINE_IID!(IHTMLDOMTextNode, "3050f4b1-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLDOMTextNode : IDispatch {
public extern(Windows):
	HRESULT put_data(BSTR v);
	HRESULT get_data(BSTR* p);
	HRESULT toString(BSTR* String);
	HRESULT get_length(int* p);
	HRESULT splitText(int offset, IHTMLDOMNode* pRetNode);
}

//extern extern(C) const IID IID_IHTMLDOMTextNode2;
mixin DEFINE_IID!(IHTMLDOMTextNode2, "3050f809-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLDOMTextNode2 : IDispatch {
public extern(Windows):
	HRESULT substringData(int offset, int Count, BSTR* pbstrsubString);
	HRESULT appendData(BSTR bstrstring);
	HRESULT insertData(int offset, BSTR bstrstring);
	HRESULT deleteData(int offset, int Count);
	HRESULT replaceData(int offset, int Count, BSTR bstrstring);
}

//extern extern(C) const IID IID_IHTMLDOMImplementation;
mixin DEFINE_IID!(IHTMLDOMImplementation, "3050f80d-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLDOMImplementation : IDispatch {
public extern(Windows):
	HRESULT hasFeature(BSTR bstrfeature, VARIANT version_, VARIANT_BOOL* pfHasFeature);
}

//extern extern(C) const IID DIID_DispHTMLDOMAttribute;
mixin DEFINE_GUID!("DIID_DispHTMLDOMAttribute", "3050f564-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLDOMAttribute : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLDOMAttribute;
mixin DEFINE_GUID!("CLSID_HTMLDOMAttribute", "3050f4b2-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTMLDOMTextNode;
mixin DEFINE_GUID!("DIID_DispHTMLDOMTextNode", "3050f565-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLDOMTextNode : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLDOMTextNode;
mixin DEFINE_GUID!("CLSID_HTMLDOMTextNode", "3050f4ba-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTMLDOMImplementation;
mixin DEFINE_GUID!("DIID_DispHTMLDOMImplementation", "3050f58f-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLDOMImplementation : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLDOMImplementation;
mixin DEFINE_GUID!("CLSID_HTMLDOMImplementation", "3050f80e-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLAttributeCollection;
mixin DEFINE_IID!(IHTMLAttributeCollection, "3050f4c3-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLAttributeCollection : IDispatch {
public extern(Windows):
	HRESULT get_length(int* p);
	HRESULT get__newEnum(IUnknown* p);
	HRESULT item(VARIANT* name, IDispatch* pdisp);
}

//extern extern(C) const IID IID_IHTMLAttributeCollection2;
mixin DEFINE_IID!(IHTMLAttributeCollection2, "3050f80a-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLAttributeCollection2 : IDispatch {
public extern(Windows):
	HRESULT getNamedItem(BSTR bstrName, IHTMLDOMAttribute* newretNode);
	HRESULT setNamedItem(IHTMLDOMAttribute ppNode, IHTMLDOMAttribute* newretNode);
	HRESULT removeNamedItem(BSTR bstrName, IHTMLDOMAttribute* newretNode);
}

//extern extern(C) const IID IID_IHTMLDOMChildrenCollection;
mixin DEFINE_IID!(IHTMLDOMChildrenCollection, "3050f5ab-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLDOMChildrenCollection : IDispatch {
public extern(Windows):
	HRESULT get_length(int* p);
	HRESULT get__newEnum(IUnknown* p);
	HRESULT item(int index, IDispatch* ppItem);
}

//extern extern(C) const IID DIID_DispHTMLAttributeCollection;
mixin DEFINE_GUID!("DIID_DispHTMLAttributeCollection", "3050f56c-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLAttributeCollection : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLAttributeCollection;
mixin DEFINE_GUID!("CLSID_HTMLAttributeCollection", "3050f4cc-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispStaticNodeList;
mixin DEFINE_GUID!("DIID_DispStaticNodeList", "3050f59b-98b5-11cf-bb82-00aa00bdce0b");
interface DispStaticNodeList : IDispatch {
}

//extern extern(C) const CLSID CLSID_StaticNodeList;
mixin DEFINE_GUID!("CLSID_StaticNodeList", "30510467-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispDOMChildrenCollection;
mixin DEFINE_GUID!("DIID_DispDOMChildrenCollection", "3050f577-98b5-11cf-bb82-00aa00bdce0b");
interface DispDOMChildrenCollection : IDispatch {
}

//extern extern(C) const CLSID CLSID_DOMChildrenCollection;
mixin DEFINE_GUID!("CLSID_DOMChildrenCollection", "3050f5aa-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_HTMLElementEvents3;
mixin DEFINE_GUID!("DIID_HTMLElementEvents3", "3050f59f-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLElementEvents3 : IDispatch {
}

//extern extern(C) const IID DIID_HTMLElementEvents2;
mixin DEFINE_GUID!("DIID_HTMLElementEvents2", "3050f60f-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLElementEvents2 : IDispatch {
}

//extern extern(C) const IID DIID_HTMLElementEvents;
mixin DEFINE_GUID!("DIID_HTMLElementEvents", "3050f33c-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLElementEvents : IDispatch {
}

//extern extern(C) const IID IID_IHTMLElement3;
mixin DEFINE_IID!(IHTMLElement3, "3050f673-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLElement3 : IDispatch {
public extern(Windows):
	HRESULT mergeAttributes(IHTMLElement mergeThis, VARIANT* pvarFlags);
	HRESULT get_isMultiLine(VARIANT_BOOL* p);
	HRESULT get_canHaveHTML(VARIANT_BOOL* p);
	HRESULT put_onlayoutcomplete(VARIANT v);
	HRESULT get_onlayoutcomplete(VARIANT* p);
	HRESULT put_onpage(VARIANT v);
	HRESULT get_onpage(VARIANT* p);
	HRESULT put_inflateBlock(VARIANT_BOOL v);
	HRESULT get_inflateBlock(VARIANT_BOOL* p);
	HRESULT put_onbeforedeactivate(VARIANT v);
	HRESULT get_onbeforedeactivate(VARIANT* p);
	HRESULT setActive();
	HRESULT put_contentEditable(BSTR v);
	HRESULT get_contentEditable(BSTR* p);
	HRESULT get_isContentEditable(VARIANT_BOOL* p);
	HRESULT put_hideFocus(VARIANT_BOOL v);
	HRESULT get_hideFocus(VARIANT_BOOL* p);
	HRESULT put_disabled(VARIANT_BOOL v);
	HRESULT get_disabled(VARIANT_BOOL* p);
	HRESULT get_isDisabled(VARIANT_BOOL* p);
	HRESULT put_onmove(VARIANT v);
	HRESULT get_onmove(VARIANT* p);
	HRESULT put_oncontrolselect(VARIANT v);
	HRESULT get_oncontrolselect(VARIANT* p);
	HRESULT fireEvent(BSTR bstrEventName, VARIANT* pvarEventObject, VARIANT_BOOL* pfCancelled);
	HRESULT put_onresizestart(VARIANT v);
	HRESULT get_onresizestart(VARIANT* p);
	HRESULT put_onresizeend(VARIANT v);
	HRESULT get_onresizeend(VARIANT* p);
	HRESULT put_onmovestart(VARIANT v);
	HRESULT get_onmovestart(VARIANT* p);
	HRESULT put_onmoveend(VARIANT v);
	HRESULT get_onmoveend(VARIANT* p);
	HRESULT put_onmouseenter(VARIANT v);
	HRESULT get_onmouseenter(VARIANT* p);
	HRESULT put_onmouseleave(VARIANT v);
	HRESULT get_onmouseleave(VARIANT* p);
	HRESULT put_onactivate(VARIANT v);
	HRESULT get_onactivate(VARIANT* p);
	HRESULT put_ondeactivate(VARIANT v);
	HRESULT get_ondeactivate(VARIANT* p);
	HRESULT dragDrop(VARIANT_BOOL* pfRet);
	HRESULT get_glyphMode(LONG* p);
}

//extern extern(C) const IID IID_IHTMLElement4;
mixin DEFINE_IID!(IHTMLElement4, "3050f80f-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLElement4 : IDispatch {
public extern(Windows):
	HRESULT put_onmousewheel(VARIANT v);
	HRESULT get_onmousewheel(VARIANT* p);
	HRESULT normalize();
	HRESULT getAttributeNode(BSTR bstrname, IHTMLDOMAttribute* ppAttribute);
	HRESULT setAttributeNode(IHTMLDOMAttribute pattr, IHTMLDOMAttribute* ppretAttribute);
	HRESULT removeAttributeNode(IHTMLDOMAttribute pattr, IHTMLDOMAttribute* ppretAttribute);
	HRESULT put_onbeforeactivate(VARIANT v);
	HRESULT get_onbeforeactivate(VARIANT* p);
	HRESULT put_onfocusin(VARIANT v);
	HRESULT get_onfocusin(VARIANT* p);
	HRESULT put_onfocusout(VARIANT v);
	HRESULT get_onfocusout(VARIANT* p);
}

//extern extern(C) const IID IID_IElementSelector;
mixin DEFINE_IID!(IElementSelector, "30510463-98b5-11cf-bb82-00aa00bdce0b");
interface IElementSelector : IDispatch {
public extern(Windows):
	HRESULT querySelector(BSTR v, IHTMLElement* pel);
	HRESULT querySelectorAll(BSTR v, IHTMLDOMChildrenCollection* pel);
}

//extern extern(C) const IID IID_IHTMLElementRender;
mixin DEFINE_IID!(IHTMLElementRender, "3050f669-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLElementRender : IUnknown {
public extern(Windows):
	HRESULT DrawToDC(HDC hDC);
	HRESULT SetDocumentPrinter(BSTR bstrPrinterName, HDC hDC);
}

//extern extern(C) const IID IID_IHTMLUniqueName;
mixin DEFINE_IID!(IHTMLUniqueName, "3050f4d0-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLUniqueName : IDispatch {
public extern(Windows):
	HRESULT get_uniqueNumber(int* p);
	HRESULT get_uniqueID(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLElement5;
mixin DEFINE_IID!(IHTMLElement5, "3051045d-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLElement5 : IDispatch {
public extern(Windows):
	HRESULT getAttributeNode(BSTR bstrname, IHTMLDOMAttribute2* ppretAttribute);
	HRESULT setAttributeNode(IHTMLDOMAttribute2 pattr, IHTMLDOMAttribute2* ppretAttribute);
	HRESULT removeAttributeNode(IHTMLDOMAttribute2 pattr, IHTMLDOMAttribute2* ppretAttribute);
	HRESULT hasAttribute(BSTR name, VARIANT_BOOL* pfHasAttribute);
	HRESULT put_role(BSTR v);
	HRESULT get_role(BSTR* p);
	HRESULT put_ariaBusy(BSTR v);
	HRESULT get_ariaBusy(BSTR* p);
	HRESULT put_ariaChecked(BSTR v);
	HRESULT get_ariaChecked(BSTR* p);
	HRESULT put_ariaDisabled(BSTR v);
	HRESULT get_ariaDisabled(BSTR* p);
	HRESULT put_ariaExpanded(BSTR v);
	HRESULT get_ariaExpanded(BSTR* p);
	HRESULT put_ariaHaspopup(BSTR v);
	HRESULT get_ariaHaspopup(BSTR* p);
	HRESULT put_ariaHidden(BSTR v);
	HRESULT get_ariaHidden(BSTR* p);
	HRESULT put_ariaInvalid(BSTR v);
	HRESULT get_ariaInvalid(BSTR* p);
	HRESULT put_ariaMultiselectable(BSTR v);
	HRESULT get_ariaMultiselectable(BSTR* p);
	HRESULT put_ariaPressed(BSTR v);
	HRESULT get_ariaPressed(BSTR* p);
	HRESULT put_ariaReadonly(BSTR v);
	HRESULT get_ariaReadonly(BSTR* p);
	HRESULT put_ariaRequired(BSTR v);
	HRESULT get_ariaRequired(BSTR* p);
	HRESULT put_ariaSecret(BSTR v);
	HRESULT get_ariaSecret(BSTR* p);
	HRESULT put_ariaSelected(BSTR v);
	HRESULT get_ariaSelected(BSTR* p);
	HRESULT getAttribute(BSTR strAttributeName, VARIANT* AttributeValue);
	HRESULT setAttribute(BSTR strAttributeName, VARIANT AttributeValue);
	HRESULT removeAttribute(BSTR strAttributeName, VARIANT_BOOL* pfSuccess);
	HRESULT get_attributes(IHTMLAttributeCollection3* p);
	HRESULT put_ariaValuenow(BSTR v);
	HRESULT get_ariaValuenow(BSTR* p);
	HRESULT put_ariaPosinset(short v);
	HRESULT get_ariaPosinset(short* p);
	HRESULT put_ariaSetsize(short v);
	HRESULT get_ariaSetsize(short* p);
	HRESULT put_ariaLevel(short v);
	HRESULT get_ariaLevel(short* p);
	HRESULT put_ariaValuemin(BSTR v);
	HRESULT get_ariaValuemin(BSTR* p);
	HRESULT put_ariaValuemax(BSTR v);
	HRESULT get_ariaValuemax(BSTR* p);
	HRESULT put_ariaControls(BSTR v);
	HRESULT get_ariaControls(BSTR* p);
	HRESULT put_ariaDescribedby(BSTR v);
	HRESULT get_ariaDescribedby(BSTR* p);
	HRESULT put_ariaFlowto(BSTR v);
	HRESULT get_ariaFlowto(BSTR* p);
	HRESULT put_ariaLabelledby(BSTR v);
	HRESULT get_ariaLabelledby(BSTR* p);
	HRESULT put_ariaActivedescendant(BSTR v);
	HRESULT get_ariaActivedescendant(BSTR* p);
	HRESULT put_ariaOwns(BSTR v);
	HRESULT get_ariaOwns(BSTR* p);
	HRESULT hasAttributes(VARIANT_BOOL* pfHasAttributes);
	HRESULT put_ariaLive(BSTR v);
	HRESULT get_ariaLive(BSTR* p);
	HRESULT put_ariaRelevant(BSTR v);
	HRESULT get_ariaRelevant(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLDatabinding;
mixin DEFINE_IID!(IHTMLDatabinding, "3050f3f2-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLDatabinding : IDispatch {
public extern(Windows):
	HRESULT put_dataFld(BSTR v);
	HRESULT get_dataFld(BSTR* p);
	HRESULT put_dataSrc(BSTR v);
	HRESULT get_dataSrc(BSTR* p);
	HRESULT put_dataFormatAs(BSTR v);
	HRESULT get_dataFormatAs(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLDocument;
mixin DEFINE_IID!(IHTMLDocument, "626FC520-A41E-11cf-A731-00A0C9082637");
interface IHTMLDocument : IDispatch {
public extern(Windows):
	HRESULT get_Script(IDispatch* p);
}

//extern extern(C) const IID IID_IHTMLElementDefaults;
mixin DEFINE_IID!(IHTMLElementDefaults, "3050f6c9-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLElementDefaults : IDispatch {
public extern(Windows):
	HRESULT get_style(IHTMLStyle* p);
	HRESULT put_tabStop(VARIANT_BOOL v);
	HRESULT get_tabStop(VARIANT_BOOL* p);
	HRESULT put_viewInheritStyle(VARIANT_BOOL v);
	HRESULT get_viewInheritStyle(VARIANT_BOOL* p);
	HRESULT put_viewMasterTab(VARIANT_BOOL v);
	HRESULT get_viewMasterTab(VARIANT_BOOL* p);
	HRESULT put_scrollSegmentX(int v);
	HRESULT get_scrollSegmentX(int* p);
	HRESULT put_scrollSegmentY(int v);
	HRESULT get_scrollSegmentY(int* p);
	HRESULT put_isMultiLine(VARIANT_BOOL v);
	HRESULT get_isMultiLine(VARIANT_BOOL* p);
	HRESULT put_contentEditable(BSTR v);
	HRESULT get_contentEditable(BSTR* p);
	HRESULT put_canHaveHTML(VARIANT_BOOL v);
	HRESULT get_canHaveHTML(VARIANT_BOOL* p);
	HRESULT putref_viewLink(IHTMLDocument v);
	HRESULT get_viewLink(IHTMLDocument* p);
	HRESULT put_frozen(VARIANT_BOOL v);
	HRESULT get_frozen(VARIANT_BOOL* p);
}

//extern extern(C) const IID DIID_DispHTMLDefaults;
mixin DEFINE_GUID!("DIID_DispHTMLDefaults", "3050f58c-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLDefaults : IDispatch {
}

extern extern(C) const CLSID CLSID_HTMLDefaults;
mixin DEFINE_GUID!("CLSID_HTMLDefaults", "3050f6c8-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTCDefaultDispatch;
mixin DEFINE_IID!(IHTCDefaultDispatch, "3050f4fd-98b5-11cf-bb82-00aa00bdce0b");
interface IHTCDefaultDispatch : IDispatch {
public extern(Windows):
	HRESULT get_element(IHTMLElement* p);
	HRESULT createEventObject(IHTMLEventObj* eventObj);
	HRESULT get_defaults(IDispatch* p);
	HRESULT get_document(IDispatch* p);
}

//extern extern(C) const IID IID_IHTCPropertyBehavior;
mixin DEFINE_IID!(IHTCPropertyBehavior, "3050f5df-98b5-11cf-bb82-00aa00bdce0b");
interface IHTCPropertyBehavior : IDispatch {
public extern(Windows):
	HRESULT fireChange();
	HRESULT put_value(VARIANT v);
	HRESULT get_value(VARIANT* p);
}

//extern extern(C) const IID IID_IHTCMethodBehavior;
mixin DEFINE_IID!(IHTCMethodBehavior, "3050f631-98b5-11cf-bb82-00aa00bdce0b");
interface IHTCMethodBehavior : IDispatch {
public extern(Windows):
}

//extern extern(C) const IID IID_IHTCEventBehavior;
mixin DEFINE_IID!(IHTCEventBehavior, "3050f4ff-98b5-11cf-bb82-00aa00bdce0b");
interface IHTCEventBehavior : IDispatch {
public extern(Windows):
	HRESULT fire(IHTMLEventObj pvar);
}

//extern extern(C) const IID IID_IHTCAttachBehavior;
mixin DEFINE_IID!(IHTCAttachBehavior, "3050f5f4-98b5-11cf-bb82-00aa00bdce0b");
interface IHTCAttachBehavior : IDispatch {
public extern(Windows):
	HRESULT fireEvent(IDispatch* evt);
	HRESULT detachEvent();
}

//extern extern(C) const IID IID_IHTCAttachBehavior2;
mixin DEFINE_IID!(IHTCAttachBehavior2, "3050f7eb-98b5-11cf-bb82-00aa00bdce0b");
interface IHTCAttachBehavior2 : IDispatch {
public extern(Windows):
	HRESULT fireEvent(VARIANT evt);
}

//extern extern(C) const IID IID_IHTCDescBehavior;
mixin DEFINE_IID!(IHTCDescBehavior, "3050f5dc-98b5-11cf-bb82-00aa00bdce0b");
interface IHTCDescBehavior : IDispatch {
public extern(Windows):
	HRESULT get_urn(BSTR* p);
	HRESULT get_name(BSTR* p);
}

//extern extern(C) const IID DIID_DispHTCDefaultDispatch;
mixin DEFINE_GUID!("DIID_DispHTCDefaultDispatch", "3050f573-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTCDefaultDispatch : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTCDefaultDispatch;
mixin DEFINE_GUID!("CLSID_HTCDefaultDispatch", "3050f4fc-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTCPropertyBehavior;
mixin DEFINE_GUID!("DIID_DispHTCPropertyBehavior", "3050f57f-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTCPropertyBehavior : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTCPropertyBehavior;
mixin DEFINE_GUID!("CLSID_HTCPropertyBehavior", "3050f5de-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTCMethodBehavior;
mixin DEFINE_GUID!("DIID_DispHTCMethodBehavior", "3050f587-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTCMethodBehavior : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTCMethodBehavior;
mixin DEFINE_GUID!("CLSID_HTCMethodBehavior", "3050f630-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTCEventBehavior;
mixin DEFINE_GUID!("DIID_DispHTCEventBehavior", "3050f574-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTCEventBehavior : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTCEventBehavior;
mixin DEFINE_GUID!("CLSID_HTCEventBehavior", "3050f4fe-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTCAttachBehavior;
mixin DEFINE_GUID!("DIID_DispHTCAttachBehavior", "3050f583-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTCAttachBehavior : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTCAttachBehavior;
mixin DEFINE_GUID!("CLSID_HTCAttachBehavior", "3050f5f5-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTCDescBehavior;
mixin DEFINE_GUID!("DIID_DispHTCDescBehavior", "3050f57e-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTCDescBehavior : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTCDescBehavior;
mixin DEFINE_GUID!("CLSID_HTCDescBehavior", "3050f5dd-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLUrnCollection;
mixin DEFINE_IID!(IHTMLUrnCollection, "3050f5e2-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLUrnCollection : IDispatch {
public extern(Windows):
	HRESULT get_length(int* p);
	HRESULT item(int index, BSTR* ppUrn);
}

//extern extern(C) const IID DIID_DispHTMLUrnCollection;
mixin DEFINE_GUID!("DIID_DispHTMLUrnCollection", "3050f551-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLUrnCollection : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLUrnCollection;
mixin DEFINE_GUID!("CLSID_HTMLUrnCollection", "3050f580-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLGenericElement;
mixin DEFINE_IID!(IHTMLGenericElement, "3050f4b7-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLGenericElement : IDispatch {
public extern(Windows):
	HRESULT get_recordset(IDispatch* p);
	HRESULT namedRecordset(BSTR dataMember, VARIANT* hierarchy, IDispatch* ppRecordset);
}

//extern extern(C) const IID DIID_DispHTMLGenericElement;
mixin DEFINE_GUID!("DIID_DispHTMLGenericElement", "3050f563-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLGenericElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLGenericElement;
mixin DEFINE_GUID!("CLSID_HTMLGenericElement", "3050f4b8-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLStyleSheetRule;
mixin DEFINE_IID!(IHTMLStyleSheetRule, "3050f357-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLStyleSheetRule : IDispatch {
public extern(Windows):
	HRESULT put_selectorText(BSTR v);
	HRESULT get_selectorText(BSTR* p);
	HRESULT get_style(IHTMLRuleStyle* p);
	HRESULT get_readOnly(VARIANT_BOOL* p);
}

//extern extern(C) const IID IID_IHTMLStyleSheetRulesCollection;
mixin DEFINE_IID!(IHTMLStyleSheetRulesCollection, "3050f2e5-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLStyleSheetRulesCollection : IDispatch {
public extern(Windows):
	HRESULT get_length(int* p);
	HRESULT item(int index, IHTMLStyleSheetRule* ppHTMLStyleSheetRule);
}

//extern extern(C) const IID DIID_DispHTMLStyleSheetRule;
mixin DEFINE_GUID!("DIID_DispHTMLStyleSheetRule", "3050f50e-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLStyleSheetRule : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLStyleSheetRule;
mixin DEFINE_GUID!("CLSID_HTMLStyleSheetRule", "3050f3ce-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTMLStyleSheetRulesCollection;
mixin DEFINE_GUID!("DIID_DispHTMLStyleSheetRulesCollection", "3050f52f-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLStyleSheetRulesCollection : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLStyleSheetRulesCollection;
mixin DEFINE_GUID!("CLSID_HTMLStyleSheetRulesCollection", "3050f3cd-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLStyleSheetPage;
mixin DEFINE_IID!(IHTMLStyleSheetPage, "3050f7ee-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLStyleSheetPage : IDispatch {
public extern(Windows):
	HRESULT get_selector(BSTR* p);
	HRESULT get_pseudoClass(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLStyleSheetPagesCollection;
mixin DEFINE_IID!(IHTMLStyleSheetPagesCollection, "3050f7f0-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLStyleSheetPagesCollection : IDispatch {
public extern(Windows):
	HRESULT get_length(int* p);
	HRESULT item(int index, IHTMLStyleSheetPage* ppHTMLStyleSheetPage);
}

//extern extern(C) const IID DIID_DispHTMLStyleSheetPage;
mixin DEFINE_GUID!("DIID_DispHTMLStyleSheetPage", "3050f540-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLStyleSheetPage : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLStyleSheetPage;
mixin DEFINE_GUID!("CLSID_HTMLStyleSheetPage", "3050f7ef-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTMLStyleSheetPagesCollection;
mixin DEFINE_GUID!("DIID_DispHTMLStyleSheetPagesCollection", "3050f543-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLStyleSheetPagesCollection : IDispatch {
}

extern extern(C) const CLSID CLSID_HTMLStyleSheetPagesCollection;
mixin DEFINE_GUID!("CLSID_HTMLStyleSheetPagesCollection", "3050f7f1-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLStyleSheetsCollection;
mixin DEFINE_IID!(IHTMLStyleSheetsCollection, "3050f37e-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLStyleSheetsCollection : IDispatch {
public extern(Windows):
	HRESULT get_length(int* p);
	HRESULT get__newEnum(IUnknown* p);
	HRESULT item(VARIANT* pvarIndex, VARIANT* pvarResult);
}

//extern extern(C) const IID IID_IHTMLStyleSheet;
mixin DEFINE_IID!(IHTMLStyleSheet, "3050f2e3-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLStyleSheet : IDispatch {
public extern(Windows):
	HRESULT put_title(BSTR v);
	HRESULT get_title(BSTR* p);
	HRESULT get_parentStyleSheet(IHTMLStyleSheet* p);
	HRESULT get_owningElement(IHTMLElement* p);
	HRESULT put_disabled(VARIANT_BOOL v);
	HRESULT get_disabled(VARIANT_BOOL* p);
	HRESULT get_readOnly(VARIANT_BOOL* p);
	HRESULT get_imports(IHTMLStyleSheetsCollection* p);
	HRESULT put_href(BSTR v);
	HRESULT get_href(BSTR* p);
	HRESULT get_type(BSTR* p);
	HRESULT get_id(BSTR* p);
	HRESULT addImport(BSTR bstrURL, int lIndex, int* plIndex);
	HRESULT addRule(BSTR bstrSelector, BSTR bstrStyle, int lIndex, int* plNewIndex);
	HRESULT removeImport(int lIndex);
	HRESULT removeRule(int lIndex);
	HRESULT put_media(BSTR v);
	HRESULT get_media(BSTR* p);
	HRESULT put_cssText(BSTR v);
	HRESULT get_cssText(BSTR* p);
	HRESULT get_rules(IHTMLStyleSheetRulesCollection* p);
}

//extern extern(C) const IID IID_IHTMLStyleSheet2;
mixin DEFINE_IID!(IHTMLStyleSheet2, "3050f3d1-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLStyleSheet2 : IDispatch {
public extern(Windows):
	HRESULT get_pages(IHTMLStyleSheetPagesCollection* p);
	HRESULT addPageRule(BSTR bstrSelector, BSTR bstrStyle, int lIndex, int* plNewIndex);
}

//extern extern(C) const IID IID_IHTMLStyleSheet3;
mixin DEFINE_IID!(IHTMLStyleSheet3, "30510496-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLStyleSheet3 : IDispatch {
public extern(Windows):
	HRESULT put_href(BSTR v);
	HRESULT get_href(BSTR* p);
	HRESULT get_isAlternate(VARIANT_BOOL* p);
	HRESULT get_isPrefAlternate(VARIANT_BOOL* p);
}

//extern extern(C) const IID DIID_DispHTMLStyleSheet;
mixin DEFINE_GUID!("DIID_DispHTMLStyleSheet", "3050f58d-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLStyleSheet : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLStyleSheet;
mixin DEFINE_GUID!("CLSID_HTMLStyleSheet", "3050f2e4-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTMLStyleSheetsCollection;
mixin DEFINE_GUID!("DIID_DispHTMLStyleSheetsCollection", "3050f547-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLStyleSheetsCollection : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLStyleSheetsCollection;
mixin DEFINE_GUID!("CLSID_HTMLStyleSheetsCollection", "3050f37f-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_HTMLLinkElementEvents2;
mixin DEFINE_GUID!("DIID_HTMLLinkElementEvents2", "3050f61d-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLLinkElementEvents2 : IDispatch {
}

//extern extern(C) const IID DIID_HTMLLinkElementEvents;
mixin DEFINE_GUID!("DIID_HTMLLinkElementEvents", "3050f3cc-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLLinkElementEvents : IDispatch {
}

//extern extern(C) const IID IID_IHTMLLinkElement;
mixin DEFINE_IID!(IHTMLLinkElement, "3050f205-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLLinkElement : IDispatch {
public extern(Windows):
	HRESULT put_href(BSTR v);
	HRESULT get_href(BSTR* p);
	HRESULT put_rel(BSTR v);
	HRESULT get_rel(BSTR* p);
	HRESULT put_rev(BSTR v);
	HRESULT get_rev(BSTR* p);
	HRESULT put_type(BSTR v);
	HRESULT get_type(BSTR* p);
	HRESULT get_readyState(BSTR* p);
	HRESULT put_onreadystatechange(VARIANT v);
	HRESULT get_onreadystatechange(VARIANT* p);
	HRESULT put_onload(VARIANT v);
	HRESULT get_onload(VARIANT* p);
	HRESULT put_onerror(VARIANT v);
	HRESULT get_onerror(VARIANT* p);
	HRESULT get_styleSheet(IHTMLStyleSheet* p);
	HRESULT put_disabled(VARIANT_BOOL v);
	HRESULT get_disabled(VARIANT_BOOL* p);
	HRESULT put_media(BSTR v);
	HRESULT get_media(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLLinkElement2;
mixin DEFINE_IID!(IHTMLLinkElement2, "3050f4e5-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLLinkElement2 : IDispatch {
public extern(Windows):
	HRESULT put_target(BSTR v);
	HRESULT get_target(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLLinkElement3;
mixin DEFINE_IID!(IHTMLLinkElement3, "3050f81e-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLLinkElement3 : IDispatch {
public extern(Windows):
	HRESULT put_charset(BSTR v);
	HRESULT get_charset(BSTR* p);
	HRESULT put_hreflang(BSTR v);
	HRESULT get_hreflang(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLLinkElement4;
mixin DEFINE_IID!(IHTMLLinkElement4, "3051043a-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLLinkElement4 : IDispatch {
public extern(Windows):
	HRESULT put_href(BSTR v);
	HRESULT get_href(BSTR* p);
}

//extern extern(C) const IID DIID_DispHTMLLinkElement;
mixin DEFINE_GUID!("DIID_DispHTMLLinkElement", "3050f524-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLLinkElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLLinkElement;
mixin DEFINE_GUID!("CLSID_HTMLLinkElement", "3050f277-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLTxtRange;
mixin DEFINE_IID!(IHTMLTxtRange, "3050f220-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLTxtRange : IDispatch {
public extern(Windows):
	HRESULT get_htmlText(BSTR* p);
	HRESULT put_text(BSTR v);
	HRESULT get_text(BSTR* p);
	HRESULT parentElement(IHTMLElement* parent);
	HRESULT duplicate(IHTMLTxtRange* Duplicate);
	HRESULT inRange(IHTMLTxtRange Range, VARIANT_BOOL* InRange);
	HRESULT isEqual(IHTMLTxtRange Range, VARIANT_BOOL* IsEqual);
	HRESULT scrollIntoView(VARIANT_BOOL fStart = -1);
	HRESULT collapse(VARIANT_BOOL Start = -1);
	HRESULT expand(BSTR Unit, VARIANT_BOOL* Success);
	HRESULT move(BSTR Unit, int Count, int* ActualCount);
	HRESULT moveStart(BSTR Unit, int Count, int* ActualCount);
	HRESULT moveEnd(BSTR Unit, int Count, int* ActualCount);
	HRESULT select();
	HRESULT pasteHTML(BSTR html);
	HRESULT moveToElementText(IHTMLElement element);
	HRESULT setEndPoint(BSTR how, IHTMLTxtRange SourceRange);
	HRESULT compareEndPoints(BSTR how, IHTMLTxtRange SourceRange, int* ret);
	HRESULT findText(BSTR String, int count, int Flags, VARIANT_BOOL* Success);
	HRESULT moveToPoint(int x, int y);
	HRESULT getBookmark(BSTR* Boolmark);
	HRESULT moveToBookmark(BSTR Bookmark, VARIANT_BOOL* Success);
	HRESULT queryCommandSupported(BSTR cmdID, VARIANT_BOOL* pfRet);
	HRESULT queryCommandEnabled(BSTR cmdID, VARIANT_BOOL* pfRet);
	HRESULT queryCommandState(BSTR cmdID, VARIANT_BOOL* pfRet);
	HRESULT queryCommandIndeterm(BSTR cmdID, VARIANT_BOOL* pfRet);
	HRESULT queryCommandText(BSTR cmdID, BSTR* pcmdText);
	HRESULT queryCommandValue(BSTR cmdID, VARIANT* pcmdValue);
	HRESULT execCommand(BSTR cmdID, VARIANT_BOOL showUI, VARIANT value, VARIANT_BOOL* pfRet);
	HRESULT execCommandShowHelp(BSTR cmdID, VARIANT_BOOL* pfRet);
}

//extern extern(C) const IID IID_IHTMLTextRangeMetrics;
mixin DEFINE_IID!(IHTMLTextRangeMetrics, "3050f40b-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLTextRangeMetrics : IDispatch {
public extern(Windows):
	HRESULT get_offsetTop(int* p);
	HRESULT get_offsetLeft(int* p);
	HRESULT get_boundingTop(int* p);
	HRESULT get_boundingLeft(int* p);
	HRESULT get_boundingWidth(int* p);
	HRESULT get_boundingHeight(int* p);
}

//extern extern(C) const IID IID_IHTMLTextRangeMetrics2;
mixin DEFINE_IID!(IHTMLTextRangeMetrics2, "3050f4a6-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLTextRangeMetrics2 : IDispatch {
public extern(Windows):
	HRESULT getClientRects(IHTMLRectCollection* pRectCol);
	HRESULT getBoundingClientRect(IHTMLRect* pRect);
}

//extern extern(C) const IID IID_IHTMLTxtRangeCollection;
mixin DEFINE_IID!(IHTMLTxtRangeCollection, "3050f7ed-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLTxtRangeCollection : IDispatch {
public extern(Windows):
	HRESULT get_length(int* p);
	HRESULT get__newEnum(IUnknown* p);
	HRESULT item(VARIANT* pvarIndex, VARIANT* pvarResult);
}

//extern extern(C) const IID DIID_HTMLFormElementEvents2;
mixin DEFINE_GUID!("DIID_HTMLFormElementEvents2", "3050f614-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLFormElementEvents2 : IDispatch {
}

//extern extern(C) const IID DIID_HTMLFormElementEvents;
mixin DEFINE_GUID!("DIID_HTMLFormElementEvents", "3050f364-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLFormElementEvents : IDispatch {
}

//extern extern(C) const IID IID_IHTMLFormElement;
mixin DEFINE_IID!(IHTMLFormElement, "3050f1f7-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLFormElement : IDispatch {
public extern(Windows):
	HRESULT put_action(BSTR v);
	HRESULT get_action(BSTR* p);
	HRESULT put_dir(BSTR v);
	HRESULT get_dir(BSTR* p);
	HRESULT put_encoding(BSTR v);
	HRESULT get_encoding(BSTR* p);
	HRESULT put_method(BSTR v);
	HRESULT get_method(BSTR* p);
	HRESULT get_elements(IDispatch* p);
	HRESULT put_target(BSTR v);
	HRESULT get_target(BSTR* p);
	HRESULT put_name(BSTR v);
	HRESULT get_name(BSTR* p);
	HRESULT put_onsubmit(VARIANT v);
	HRESULT get_onsubmit(VARIANT* p);
	HRESULT put_onreset(VARIANT v);
	HRESULT get_onreset(VARIANT* p);
	HRESULT submit();
	HRESULT reset();
	HRESULT put_length(int v);
	HRESULT get_length(int* p);
	HRESULT get__newEnum(IUnknown* p);
	HRESULT item(VARIANT name, VARIANT index, IDispatch* pdisp);
	HRESULT tags(VARIANT tagName, IDispatch* pdisp);
}

//extern extern(C) const IID IID_IHTMLFormElement2;
mixin DEFINE_IID!(IHTMLFormElement2, "3050f4f6-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLFormElement2 : IDispatch {
public extern(Windows):
	HRESULT put_acceptCharset(BSTR v);
	HRESULT get_acceptCharset(BSTR* p);
	HRESULT urns(VARIANT urn, IDispatch* pdisp);
}

//extern extern(C) const IID IID_IHTMLFormElement3;
mixin DEFINE_IID!(IHTMLFormElement3, "3050f836-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLFormElement3 : IDispatch {
public extern(Windows):
	HRESULT namedItem(BSTR name, IDispatch* pdisp);
}

//extern extern(C) const IID IID_IHTMLSubmitData;
mixin DEFINE_IID!(IHTMLSubmitData, "3050f645-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLSubmitData : IDispatch {
public extern(Windows):
	HRESULT appendNameValuePair(BSTR name/* = ""*/, BSTR value/* = ""*/);
	HRESULT appendNameFilePair(BSTR name/* = ""*/, BSTR filename/* = ""*/);
	HRESULT appendItemSeparator();
}

//extern extern(C) const IID IID_IHTMLFormElement4;
mixin DEFINE_IID!(IHTMLFormElement4, "3051042c-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLFormElement4 : IDispatch {
public extern(Windows):
	HRESULT put_action(BSTR v);
	HRESULT get_action(BSTR* p);
}

//extern extern(C) const IID DIID_DispHTMLFormElement;
mixin DEFINE_GUID!("DIID_DispHTMLFormElement", "3050f510-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLFormElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLFormElement;
mixin DEFINE_GUID!("CLSID_HTMLFormElement", "3050f251-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_HTMLControlElementEvents2;
mixin DEFINE_GUID!("DIID_HTMLControlElementEvents2", "3050f612-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLControlElementEvents2 : IDispatch {
}

//extern extern(C) const IID DIID_HTMLControlElementEvents;
mixin DEFINE_GUID!("DIID_HTMLControlElementEvents", "3050f4ea-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLControlElementEvents : IDispatch {
}

//extern extern(C) const IID IID_IHTMLControlElement;
mixin DEFINE_IID!(IHTMLControlElement, "3050f4e9-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLControlElement : IDispatch {
public extern(Windows):
	HRESULT put_tabIndex(short v);
	HRESULT get_tabIndex(short* p);
	HRESULT focus();
	HRESULT put_accessKey(BSTR v);
	HRESULT get_accessKey(BSTR* p);
	HRESULT put_onblur(VARIANT v);
	HRESULT get_onblur(VARIANT* p);
	HRESULT put_onfocus(VARIANT v);
	HRESULT get_onfocus(VARIANT* p);
	HRESULT put_onresize(VARIANT v);
	HRESULT get_onresize(VARIANT* p);
	HRESULT blur();
	HRESULT addFilter(IUnknown pUnk);
	HRESULT removeFilter(IUnknown pUnk);
	HRESULT get_clientHeight(int* p);
	HRESULT get_clientWidth(int* p);
	HRESULT get_clientTop(int* p);
	HRESULT get_clientLeft(int* p);
}

//extern extern(C) const IID IID_IHTMLTextElement;
mixin DEFINE_IID!(IHTMLTextElement, "3050f218-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLTextElement : IDispatch {
public extern(Windows):
}

//extern extern(C) const IID DIID_DispHTMLTextElement;
mixin DEFINE_GUID!("DIID_DispHTMLTextElement", "3050f537-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLTextElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLTextElement;
mixin DEFINE_GUID!("CLSID_HTMLTextElement", "3050f26a-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_HTMLTextContainerEvents2;
mixin DEFINE_GUID!("DIID_HTMLTextContainerEvents2", "3050f624-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLTextContainerEvents2 : IDispatch {
}

//extern extern(C) const IID DIID_HTMLTextContainerEvents;
mixin DEFINE_GUID!("DIID_HTMLTextContainerEvents", "1FF6AA72-5842-11cf-A707-00AA00C0098D");
interface HTMLTextContainerEvents : IDispatch {
}

//extern extern(C) const IID IID_IHTMLTextContainer;
mixin DEFINE_IID!(IHTMLTextContainer, "3050f230-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLTextContainer : IDispatch {
public extern(Windows):
	HRESULT createControlRange(IDispatch* range);
	HRESULT get_scrollHeight(int* p);
	HRESULT get_scrollWidth(int* p);
	HRESULT put_scrollTop(int v);
	HRESULT get_scrollTop(int* p);
	HRESULT put_scrollLeft(int v);
	HRESULT get_scrollLeft(int* p);
	HRESULT put_onscroll(VARIANT v);
	HRESULT get_onscroll(VARIANT* p);
}

//extern extern(C) const IID IID_IHTMLControlRange;
mixin DEFINE_IID!(IHTMLControlRange, "3050f29c-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLControlRange : IDispatch {
public extern(Windows):
	HRESULT select();
	HRESULT add(IHTMLControlElement item);
	HRESULT remove(int index);
	HRESULT item(int index, IHTMLElement* pdisp);
	HRESULT scrollIntoView(VARIANT varargStart);
	HRESULT queryCommandSupported(BSTR cmdID, VARIANT_BOOL* pfRet);
	HRESULT queryCommandEnabled(BSTR cmdID, VARIANT_BOOL* pfRet);
	HRESULT queryCommandState(BSTR cmdID, VARIANT_BOOL* pfRet);
	HRESULT queryCommandIndeterm(BSTR cmdID, VARIANT_BOOL* pfRet);
	HRESULT queryCommandText(BSTR cmdID, BSTR* pcmdText);
	HRESULT queryCommandValue(BSTR cmdID, VARIANT* pcmdValue);
	HRESULT execCommand(BSTR cmdID, VARIANT_BOOL showUI, VARIANT value, VARIANT_BOOL* pfRet);
	HRESULT execCommandShowHelp(BSTR cmdID, VARIANT_BOOL* pfRet);
	HRESULT commonParentElement(IHTMLElement* parent);
	HRESULT get_length(int* p);
}

//extern extern(C) const IID IID_IHTMLControlRange2;
mixin DEFINE_IID!(IHTMLControlRange2, "3050f65e-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLControlRange2 : IDispatch {
public extern(Windows):
	HRESULT addElement(IHTMLElement item);
}

//extern extern(C) const IID DIID_HTMLImgEvents2;
mixin DEFINE_GUID!("DIID_HTMLImgEvents2", "3050f616-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLImgEvents2 : IDispatch {
}

//extern extern(C) const IID DIID_HTMLImgEvents;
mixin DEFINE_GUID!("DIID_HTMLImgEvents", "3050f25b-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLImgEvents : IDispatch {
}

//extern extern(C) const IID IID_IHTMLImgElement;
mixin DEFINE_IID!(IHTMLImgElement, "3050f240-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLImgElement : IDispatch {
public extern(Windows):
	HRESULT put_isMap(VARIANT_BOOL v);
	HRESULT get_isMap(VARIANT_BOOL* p);
	HRESULT put_useMap(BSTR v);
	HRESULT get_useMap(BSTR* p);
	HRESULT get_mimeType(BSTR* p);
	HRESULT get_fileSize(BSTR* p);
	HRESULT get_fileCreatedDate(BSTR* p);
	HRESULT get_fileModifiedDate(BSTR* p);
	HRESULT get_fileUpdatedDate(BSTR* p);
	HRESULT get_protocol(BSTR* p);
	HRESULT get_href(BSTR* p);
	HRESULT get_nameProp(BSTR* p);
	HRESULT put_border(VARIANT v);
	HRESULT get_border(VARIANT* p);
	HRESULT put_vspace(int v);
	HRESULT get_vspace(int* p);
	HRESULT put_hspace(int v);
	HRESULT get_hspace(int* p);
	HRESULT put_alt(BSTR v);
	HRESULT get_alt(BSTR* p);
	HRESULT put_src(BSTR v);
	HRESULT get_src(BSTR* p);
	HRESULT put_lowsrc(BSTR v);
	HRESULT get_lowsrc(BSTR* p);
	HRESULT put_vrml(BSTR v);
	HRESULT get_vrml(BSTR* p);
	HRESULT put_dynsrc(BSTR v);
	HRESULT get_dynsrc(BSTR* p);
	HRESULT get_readyState(BSTR* p);
	HRESULT get_complete(VARIANT_BOOL* p);
	HRESULT put_loop(VARIANT v);
	HRESULT get_loop(VARIANT* p);
	HRESULT put_align(BSTR v);
	HRESULT get_align(BSTR* p);
	HRESULT put_onload(VARIANT v);
	HRESULT get_onload(VARIANT* p);
	HRESULT put_onerror(VARIANT v);
	HRESULT get_onerror(VARIANT* p);
	HRESULT put_onabort(VARIANT v);
	HRESULT get_onabort(VARIANT* p);
	HRESULT put_name(BSTR v);
	HRESULT get_name(BSTR* p);
	HRESULT put_width(int v);
	HRESULT get_width(int* p);
	HRESULT put_height(int v);
	HRESULT get_height(int* p);
	HRESULT put_start(BSTR v);
	HRESULT get_start(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLImgElement2;
mixin DEFINE_IID!(IHTMLImgElement2, "3050f826-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLImgElement2 : IDispatch {
public extern(Windows):
	HRESULT put_longDesc(BSTR v);
	HRESULT get_longDesc(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLImgElement3;
mixin DEFINE_IID!(IHTMLImgElement3, "30510434-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLImgElement3 : IDispatch {
public extern(Windows):
	HRESULT put_longDesc(BSTR v);
	HRESULT get_longDesc(BSTR* p);
	HRESULT put_vrml(BSTR v);
	HRESULT get_vrml(BSTR* p);
	HRESULT put_lowsrc(BSTR v);
	HRESULT get_lowsrc(BSTR* p);
	HRESULT put_dynsrc(BSTR v);
	HRESULT get_dynsrc(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLImageElementFactory;
mixin DEFINE_IID!(IHTMLImageElementFactory, "3050f38e-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLImageElementFactory : IDispatch {
public extern(Windows):
	HRESULT create(VARIANT width, VARIANT height, IHTMLImgElement* __MIDL__IHTMLImageElementFactory0000);
}

//extern extern(C) const IID DIID_DispHTMLImg;
mixin DEFINE_GUID!("DIID_DispHTMLImg", "3050f51c-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLImg : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLImg;
mixin DEFINE_GUID!("CLSID_HTMLImg", "3050f241-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const CLSID CLSID_HTMLImageElementFactory;
mixin DEFINE_GUID!("CLSID_HTMLImageElementFactory", "3050f38f-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_HTMLXMLHttpRequestEvents;
mixin DEFINE_GUID!("DIID_HTMLXMLHttpRequestEvents", "30510498-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLXMLHttpRequestEvents : IDispatch {
}

//extern extern(C) const IID IID_IHTMLXMLHttpRequest;
mixin DEFINE_IID!(IHTMLXMLHttpRequest, "3051040a-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLXMLHttpRequest : IDispatch {
public extern(Windows):
	HRESULT get_readyState(int* p);
	HRESULT get_responseBody(VARIANT* p);
	HRESULT get_responseText(BSTR* p);
	HRESULT get_responseXML(IDispatch* p);
	HRESULT get_status(int* p);
	HRESULT get_statusText(BSTR* p);
	HRESULT put_onreadystatechange(VARIANT v);
	HRESULT get_onreadystatechange(VARIANT* p);
	HRESULT abort();
	HRESULT open(BSTR bstrMethod, BSTR bstrUrl, VARIANT varAsync, VARIANT varUser, VARIANT varPassword);
	HRESULT send(VARIANT varBody);
	HRESULT getAllResponseHeaders(BSTR* __MIDL__IHTMLXMLHttpRequest0000);
	HRESULT getResponseHeader(BSTR bstrHeader, BSTR* __MIDL__IHTMLXMLHttpRequest0001);
	HRESULT setRequestHeader(BSTR bstrHeader, BSTR bstrValue);
}

//extern extern(C) const IID IID_IHTMLXMLHttpRequest2;
mixin DEFINE_IID!(IHTMLXMLHttpRequest2, "30510482-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLXMLHttpRequest2 : IDispatch {
public extern(Windows):
	HRESULT put_timeout(int v);
	HRESULT get_timeout(int* p);
	HRESULT put_ontimeout(VARIANT v);
	HRESULT get_ontimeout(VARIANT* p);
}

//extern extern(C) const IID IID_IHTMLXMLHttpRequestFactory;
mixin DEFINE_IID!(IHTMLXMLHttpRequestFactory, "3051040c-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLXMLHttpRequestFactory : IDispatch {
public extern(Windows):
	HRESULT create(IHTMLXMLHttpRequest* __MIDL__IHTMLXMLHttpRequestFactory0000);
}

//extern extern(C) const IID DIID_DispHTMLXMLHttpRequest;
mixin DEFINE_GUID!("DIID_DispHTMLXMLHttpRequest", "3050f596-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLXMLHttpRequest : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLXMLHttpRequest;
mixin DEFINE_GUID!("CLSID_HTMLXMLHttpRequest", "3051040b-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const CLSID CLSID_HTMLXMLHttpRequestFactory;
mixin DEFINE_GUID!("CLSID_HTMLXMLHttpRequestFactory", "3051040d-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLBodyElement;
mixin DEFINE_IID!(IHTMLBodyElement, "3050f1d8-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLBodyElement : IDispatch {
public extern(Windows):
	HRESULT put_background(BSTR v);
	HRESULT get_background(BSTR* p);
	HRESULT put_bgProperties(BSTR v);
	HRESULT get_bgProperties(BSTR* p);
	HRESULT put_leftMargin(VARIANT v);
	HRESULT get_leftMargin(VARIANT* p);
	HRESULT put_topMargin(VARIANT v);
	HRESULT get_topMargin(VARIANT* p);
	HRESULT put_rightMargin(VARIANT v);
	HRESULT get_rightMargin(VARIANT* p);
	HRESULT put_bottomMargin(VARIANT v);
	HRESULT get_bottomMargin(VARIANT* p);
	HRESULT put_noWrap(VARIANT_BOOL v);
	HRESULT get_noWrap(VARIANT_BOOL* p);
	HRESULT put_bgColor(VARIANT v);
	HRESULT get_bgColor(VARIANT* p);
	HRESULT put_text(VARIANT v);
	HRESULT get_text(VARIANT* p);
	HRESULT put_link(VARIANT v);
	HRESULT get_link(VARIANT* p);
	HRESULT put_vLink(VARIANT v);
	HRESULT get_vLink(VARIANT* p);
	HRESULT put_aLink(VARIANT v);
	HRESULT get_aLink(VARIANT* p);
	HRESULT put_onload(VARIANT v);
	HRESULT get_onload(VARIANT* p);
	HRESULT put_onunload(VARIANT v);
	HRESULT get_onunload(VARIANT* p);
	HRESULT put_scroll(BSTR v);
	HRESULT get_scroll(BSTR* p);
	HRESULT put_onselect(VARIANT v);
	HRESULT get_onselect(VARIANT* p);
	HRESULT put_onbeforeunload(VARIANT v);
	HRESULT get_onbeforeunload(VARIANT* p);
	HRESULT createTextRange(IHTMLTxtRange* range);
}

//extern extern(C) const IID IID_IHTMLBodyElement2;
mixin DEFINE_IID!(IHTMLBodyElement2, "3050f5c5-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLBodyElement2 : IDispatch {
public extern(Windows):
	HRESULT put_onbeforeprint(VARIANT v);
	HRESULT get_onbeforeprint(VARIANT* p);
	HRESULT put_onafterprint(VARIANT v);
	HRESULT get_onafterprint(VARIANT* p);
}

//extern extern(C) const IID IID_IHTMLBodyElement3;
mixin DEFINE_IID!(IHTMLBodyElement3, "30510422-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLBodyElement3 : IDispatch {
public extern(Windows):
	HRESULT put_background(BSTR v);
	HRESULT get_background(BSTR* p);
	HRESULT put_ononline(VARIANT v);
	HRESULT get_ononline(VARIANT* p);
	HRESULT put_onoffline(VARIANT v);
	HRESULT get_onoffline(VARIANT* p);
	HRESULT put_onhashchange(VARIANT v);
	HRESULT get_onhashchange(VARIANT* p);
}

//extern extern(C) const IID DIID_DispHTMLBody;
mixin DEFINE_GUID!("DIID_DispHTMLBody", "3050f507-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLBody : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLBody;
mixin DEFINE_GUID!("CLSID_HTMLBody", "3050f24a-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLFontElement;
mixin DEFINE_IID!(IHTMLFontElement, "3050f1d9-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLFontElement : IDispatch {
public extern(Windows):
	HRESULT put_color(VARIANT v);
	HRESULT get_color(VARIANT* p);
	HRESULT put_face(BSTR v);
	HRESULT get_face(BSTR* p);
	HRESULT put_size(VARIANT v);
	HRESULT get_size(VARIANT* p);
}

//extern extern(C) const IID DIID_DispHTMLFontElement;
mixin DEFINE_GUID!("DIID_DispHTMLFontElement", "3050f512-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLFontElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLFontElement;
mixin DEFINE_GUID!("CLSID_HTMLFontElement", "3050f27b-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_HTMLAnchorEvents2;
mixin DEFINE_GUID!("DIID_HTMLAnchorEvents2", "3050f610-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLAnchorEvents2 : IDispatch {
}

//extern extern(C) const IID DIID_HTMLAnchorEvents;
mixin DEFINE_GUID!("DIID_HTMLAnchorEvents", "3050f29d-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLAnchorEvents : IDispatch {
}

//extern extern(C) const IID IID_IHTMLAnchorElement;
mixin DEFINE_IID!(IHTMLAnchorElement, "3050f1da-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLAnchorElement : IDispatch {
public extern(Windows):
	HRESULT put_href(BSTR v);
	HRESULT get_href(BSTR* p);
	HRESULT put_target(BSTR v);
	HRESULT get_target(BSTR* p);
	HRESULT put_rel(BSTR v);
	HRESULT get_rel(BSTR* p);
	HRESULT put_rev(BSTR v);
	HRESULT get_rev(BSTR* p);
	HRESULT put_urn(BSTR v);
	HRESULT get_urn(BSTR* p);
	HRESULT put_Methods(BSTR v);
	HRESULT get_Methods(BSTR* p);
	HRESULT put_name(BSTR v);
	HRESULT get_name(BSTR* p);
	HRESULT put_host(BSTR v);
	HRESULT get_host(BSTR* p);
	HRESULT put_hostname(BSTR v);
	HRESULT get_hostname(BSTR* p);
	HRESULT put_pathname(BSTR v);
	HRESULT get_pathname(BSTR* p);
	HRESULT put_port(BSTR v);
	HRESULT get_port(BSTR* p);
	HRESULT put_protocol(BSTR v);
	HRESULT get_protocol(BSTR* p);
	HRESULT put_search(BSTR v);
	HRESULT get_search(BSTR* p);
	HRESULT put_hash(BSTR v);
	HRESULT get_hash(BSTR* p);
	HRESULT put_onblur(VARIANT v);
	HRESULT get_onblur(VARIANT* p);
	HRESULT put_onfocus(VARIANT v);
	HRESULT get_onfocus(VARIANT* p);
	HRESULT put_accessKey(BSTR v);
	HRESULT get_accessKey(BSTR* p);
	HRESULT get_protocolLong(BSTR* p);
	HRESULT get_mimeType(BSTR* p);
	HRESULT get_nameProp(BSTR* p);
	HRESULT put_tabIndex(short v);
	HRESULT get_tabIndex(short* p);
	HRESULT focus();
	HRESULT blur();
}

//extern extern(C) const IID IID_IHTMLAnchorElement2;
mixin DEFINE_IID!(IHTMLAnchorElement2, "3050f825-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLAnchorElement2 : IDispatch {
public extern(Windows):
	HRESULT put_charset(BSTR v);
	HRESULT get_charset(BSTR* p);
	HRESULT put_coords(BSTR v);
	HRESULT get_coords(BSTR* p);
	HRESULT put_hreflang(BSTR v);
	HRESULT get_hreflang(BSTR* p);
	HRESULT put_shape(BSTR v);
	HRESULT get_shape(BSTR* p);
	HRESULT put_type(BSTR v);
	HRESULT get_type(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLAnchorElement3;
mixin DEFINE_IID!(IHTMLAnchorElement3, "3051041d-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLAnchorElement3 : IDispatch {
public extern(Windows):
	HRESULT put_shape(BSTR v);
	HRESULT get_shape(BSTR* p);
	HRESULT put_coords(BSTR v);
	HRESULT get_coords(BSTR* p);
	HRESULT put_href(BSTR v);
	HRESULT get_href(BSTR* p);
}

//extern extern(C) const IID DIID_DispHTMLAnchorElement;
mixin DEFINE_GUID!("DIID_DispHTMLAnchorElement", "3050f502-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLAnchorElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLAnchorElement;
mixin DEFINE_GUID!("CLSID_HTMLAnchorElement", "3050f248-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_HTMLLabelEvents2;
mixin DEFINE_GUID!("DIID_HTMLLabelEvents2", "3050f61c-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLLabelEvents2 : IDispatch {
}

//extern extern(C) const IID DIID_HTMLLabelEvents;
mixin DEFINE_GUID!("DIID_HTMLLabelEvents", "3050f329-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLLabelEvents : IDispatch {
}

//extern extern(C) const IID IID_IHTMLLabelElement;
mixin DEFINE_IID!(IHTMLLabelElement, "3050f32a-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLLabelElement : IDispatch {
public extern(Windows):
	HRESULT put_htmlFor(BSTR v);
	HRESULT get_htmlFor(BSTR* p);
	HRESULT put_accessKey(BSTR v);
	HRESULT get_accessKey(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLLabelElement2;
mixin DEFINE_IID!(IHTMLLabelElement2, "3050f832-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLLabelElement2 : IDispatch {
public extern(Windows):
	HRESULT get_form(IHTMLFormElement* p);
}

//extern extern(C) const IID DIID_DispHTMLLabelElement;
mixin DEFINE_GUID!("DIID_DispHTMLLabelElement", "3050f522-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLLabelElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLLabelElement;
mixin DEFINE_GUID!("CLSID_HTMLLabelElement", "3050f32b-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLListElement;
mixin DEFINE_IID!(IHTMLListElement, "3050f20e-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLListElement : IDispatch {
public extern(Windows):
}

//extern extern(C) const IID IID_IHTMLListElement2;
mixin DEFINE_IID!(IHTMLListElement2, "3050f822-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLListElement2 : IDispatch {
public extern(Windows):
	HRESULT put_compact(VARIANT_BOOL v);
	HRESULT get_compact(VARIANT_BOOL* p);
}

//extern extern(C) const IID DIID_DispHTMLListElement;
mixin DEFINE_GUID!("DIID_DispHTMLListElement", "3050f525-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLListElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLListElement;
mixin DEFINE_GUID!("CLSID_HTMLListElement", "3050f272-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLUListElement;
mixin DEFINE_IID!(IHTMLUListElement, "3050f1dd-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLUListElement : IDispatch {
public extern(Windows):
	HRESULT put_compact(VARIANT_BOOL v);
	HRESULT get_compact(VARIANT_BOOL* p);
	HRESULT put_type(BSTR v);
	HRESULT get_type(BSTR* p);
}

//extern extern(C) const IID DIID_DispHTMLUListElement;
mixin DEFINE_GUID!("DIID_DispHTMLUListElement", "3050f538-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLUListElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLUListElement;
mixin DEFINE_GUID!("CLSID_HTMLUListElement", "3050f269-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLOListElement;
mixin DEFINE_IID!(IHTMLOListElement, "3050f1de-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLOListElement : IDispatch {
public extern(Windows):
	HRESULT put_compact(VARIANT_BOOL v);
	HRESULT get_compact(VARIANT_BOOL* p);
	HRESULT put_start(int v);
	HRESULT get_start(int* p);
	HRESULT put_type(BSTR v);
	HRESULT get_type(BSTR* p);
}

//extern extern(C) const IID DIID_DispHTMLOListElement;
mixin DEFINE_GUID!("DIID_DispHTMLOListElement", "3050f52a-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLOListElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLOListElement;
mixin DEFINE_GUID!("CLSID_HTMLOListElement", "3050f270-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLLIElement;
mixin DEFINE_IID!(IHTMLLIElement, "3050f1e0-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLLIElement : IDispatch {
public extern(Windows):
	HRESULT put_type(BSTR v);
	HRESULT get_type(BSTR* p);
	HRESULT put_value(int v);
	HRESULT get_value(int* p);
}

//extern extern(C) const IID DIID_DispHTMLLIElement;
mixin DEFINE_GUID!("DIID_DispHTMLLIElement", "3050f523-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLLIElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLLIElement;
mixin DEFINE_GUID!("CLSID_HTMLLIElement", "3050f273-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLBlockElement;
mixin DEFINE_IID!(IHTMLBlockElement, "3050f208-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLBlockElement : IDispatch {
public extern(Windows):
	HRESULT put_clear(BSTR v);
	HRESULT get_clear(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLBlockElement2;
mixin DEFINE_IID!(IHTMLBlockElement2, "3050f823-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLBlockElement2 : IDispatch {
public extern(Windows):
	HRESULT put_cite(BSTR v);
	HRESULT get_cite(BSTR* p);
	HRESULT put_width(BSTR v);
	HRESULT get_width(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLBlockElement3;
mixin DEFINE_IID!(IHTMLBlockElement3, "30510494-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLBlockElement3 : IDispatch {
public extern(Windows):
	HRESULT put_cite(BSTR v);
	HRESULT get_cite(BSTR* p);
}

//extern extern(C) const IID DIID_DispHTMLBlockElement;
mixin DEFINE_GUID!("DIID_DispHTMLBlockElement", "3050f506-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLBlockElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLBlockElement;
mixin DEFINE_GUID!("CLSID_HTMLBlockElement", "3050f281-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLDivElement;
mixin DEFINE_IID!(IHTMLDivElement, "3050f200-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLDivElement : IDispatch {
public extern(Windows):
	HRESULT put_align(BSTR v);
	HRESULT get_align(BSTR* p);
	HRESULT put_noWrap(VARIANT_BOOL v);
	HRESULT get_noWrap(VARIANT_BOOL* p);
}

//extern extern(C) const IID DIID_DispHTMLDivElement;
mixin DEFINE_GUID!("DIID_DispHTMLDivElement", "3050f50c-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLDivElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLDivElement;
mixin DEFINE_GUID!("CLSID_HTMLDivElement", "3050f27e-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLDDElement;
mixin DEFINE_IID!(IHTMLDDElement, "3050f1f2-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLDDElement : IDispatch {
public extern(Windows):
	HRESULT put_noWrap(VARIANT_BOOL v);
	HRESULT get_noWrap(VARIANT_BOOL* p);
}

//extern extern(C) const IID DIID_DispHTMLDDElement;
mixin DEFINE_GUID!("DIID_DispHTMLDDElement", "3050f50b-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLDDElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLDDElement;
mixin DEFINE_GUID!("CLSID_HTMLDDElement", "3050f27f-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLDTElement;
mixin DEFINE_IID!(IHTMLDTElement, "3050f1f3-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLDTElement : IDispatch {
public extern(Windows):
	HRESULT put_noWrap(VARIANT_BOOL v);
	HRESULT get_noWrap(VARIANT_BOOL* p);
}

//extern extern(C) const IID DIID_DispHTMLDTElement;
mixin DEFINE_GUID!("DIID_DispHTMLDTElement", "3050f50d-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLDTElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLDTElement;
mixin DEFINE_GUID!("CLSID_HTMLDTElement", "3050f27c-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLBRElement;
mixin DEFINE_IID!(IHTMLBRElement, "3050f1f0-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLBRElement : IDispatch {
public extern(Windows):
	HRESULT put_clear(BSTR v);
	HRESULT get_clear(BSTR* p);
}

//extern extern(C) const IID DIID_DispHTMLBRElement;
mixin DEFINE_GUID!("DIID_DispHTMLBRElement", "3050f53a-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLBRElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLBRElement;
mixin DEFINE_GUID!("CLSID_HTMLBRElement", "3050f280-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLDListElement;
mixin DEFINE_IID!(IHTMLDListElement, "3050f1f1-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLDListElement : IDispatch {
public extern(Windows):
	HRESULT put_compact(VARIANT_BOOL v);
	HRESULT get_compact(VARIANT_BOOL* p);
}

//extern extern(C) const IID DIID_DispHTMLDListElement;
mixin DEFINE_GUID!("DIID_DispHTMLDListElement", "3050f53b-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLDListElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLDListElement;
mixin DEFINE_GUID!("CLSID_HTMLDListElement", "3050f27d-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLHRElement;
mixin DEFINE_IID!(IHTMLHRElement, "3050f1f4-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLHRElement : IDispatch {
public extern(Windows):
	HRESULT put_align(BSTR v);
	HRESULT get_align(BSTR* p);
	HRESULT put_color(VARIANT v);
	HRESULT get_color(VARIANT* p);
	HRESULT put_noShade(VARIANT_BOOL v);
	HRESULT get_noShade(VARIANT_BOOL* p);
	HRESULT put_width(VARIANT v);
	HRESULT get_width(VARIANT* p);
	HRESULT put_size(VARIANT v);
	HRESULT get_size(VARIANT* p);
}

//extern extern(C) const IID DIID_DispHTMLHRElement;
mixin DEFINE_GUID!("DIID_DispHTMLHRElement", "3050f53d-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLHRElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLHRElement;
mixin DEFINE_GUID!("CLSID_HTMLHRElement", "3050f252-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLParaElement;
mixin DEFINE_IID!(IHTMLParaElement, "3050f1f5-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLParaElement : IDispatch {
public extern(Windows):
	HRESULT put_align(BSTR v);
	HRESULT get_align(BSTR* p);
}

//extern extern(C) const IID DIID_DispHTMLParaElement;
mixin DEFINE_GUID!("DIID_DispHTMLParaElement", "3050f52c-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLParaElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLParaElement;
mixin DEFINE_GUID!("CLSID_HTMLParaElement", "3050f26f-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLElementCollection2;
mixin DEFINE_IID!(IHTMLElementCollection2, "3050f5ee-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLElementCollection2 : IDispatch {
public extern(Windows):
	HRESULT urns(VARIANT urn, IDispatch* pdisp);
}

//extern extern(C) const IID IID_IHTMLElementCollection3;
mixin DEFINE_IID!(IHTMLElementCollection3, "3050f835-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLElementCollection3 : IDispatch {
public extern(Windows):
	HRESULT namedItem(BSTR name, IDispatch* pdisp);
}

//extern extern(C) const IID IID_IHTMLElementCollection4;
mixin DEFINE_IID!(IHTMLElementCollection4, "30510425-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLElementCollection4 : IDispatch {
public extern(Windows):
	HRESULT get_length(int* p);
	HRESULT item(int index, IHTMLElement2* pNode);
	HRESULT namedItem(BSTR name, IHTMLElement2* pNode);
}

//extern extern(C) const IID DIID_DispHTMLElementCollection;
mixin DEFINE_GUID!("DIID_DispHTMLElementCollection", "3050f56b-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLElementCollection : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLElementCollection;
mixin DEFINE_GUID!("CLSID_HTMLElementCollection", "3050f4cb-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLHeaderElement;
mixin DEFINE_IID!(IHTMLHeaderElement, "3050f1f6-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLHeaderElement : IDispatch {
public extern(Windows):
	HRESULT put_align(BSTR v);
	HRESULT get_align(BSTR* p);
}

//extern extern(C) const IID DIID_DispHTMLHeaderElement;
mixin DEFINE_GUID!("DIID_DispHTMLHeaderElement", "3050f515-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLHeaderElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLHeaderElement;
mixin DEFINE_GUID!("CLSID_HTMLHeaderElement", "3050f27a-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_HTMLSelectElementEvents2;
mixin DEFINE_GUID!("DIID_HTMLSelectElementEvents2", "3050f622-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLSelectElementEvents2 : IDispatch {
}

//extern extern(C) const IID DIID_HTMLSelectElementEvents;
mixin DEFINE_GUID!("DIID_HTMLSelectElementEvents", "3050f302-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLSelectElementEvents : IDispatch {
}

//extern extern(C) const IID IID_IHTMLOptionElement;
mixin DEFINE_IID!(IHTMLOptionElement, "3050f211-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLOptionElement : IDispatch {
public extern(Windows):
	HRESULT put_selected(VARIANT_BOOL v);
	HRESULT get_selected(VARIANT_BOOL* p);
	HRESULT put_value(BSTR v);
	HRESULT get_value(BSTR* p);
	HRESULT put_defaultSelected(VARIANT_BOOL v);
	HRESULT get_defaultSelected(VARIANT_BOOL* p);
	HRESULT put_index(LONG v);
	HRESULT get_index(LONG* p);
	HRESULT put_text(BSTR v);
	HRESULT get_text(BSTR* p);
	HRESULT get_form(IHTMLFormElement* p);
}

//extern extern(C) const IID IID_IHTMLSelectElementEx;
mixin DEFINE_IID!(IHTMLSelectElementEx, "3050f2d1-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLSelectElementEx : IUnknown {
public extern(Windows):
	HRESULT ShowDropdown(BOOL fShow);
	HRESULT SetSelectExFlags(DWORD lFlags);
	HRESULT GetSelectExFlags(DWORD* pFlags);
	HRESULT GetDropdownOpen(BOOL* pfOpen);
}

//extern extern(C) const IID IID_IHTMLSelectElement;
mixin DEFINE_IID!(IHTMLSelectElement, "3050f244-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLSelectElement : IDispatch {
public extern(Windows):
	HRESULT put_size(int v);
	HRESULT get_size(int* p);
	HRESULT put_multiple(VARIANT_BOOL v);
	HRESULT get_multiple(VARIANT_BOOL* p);
	HRESULT put_name(BSTR v);
	HRESULT get_name(BSTR* p);
	HRESULT get_options(IDispatch* p);
	HRESULT put_onchange(VARIANT v);
	HRESULT get_onchange(VARIANT* p);
	HRESULT put_selectedIndex(int v);
	HRESULT get_selectedIndex(int* p);
	HRESULT get_type(BSTR* p);
	HRESULT put_value(BSTR v);
	HRESULT get_value(BSTR* p);
	HRESULT put_disabled(VARIANT_BOOL v);
	HRESULT get_disabled(VARIANT_BOOL* p);
	HRESULT get_form(IHTMLFormElement* p);
	HRESULT add(IHTMLElement element, VARIANT before);
	HRESULT remove(int index = -1);
	HRESULT put_length(int v);
	HRESULT get_length(int* p);
	HRESULT get__newEnum(IUnknown* p);
	HRESULT item(VARIANT name, VARIANT index, IDispatch* pdisp);
	HRESULT tags(VARIANT tagName, IDispatch* pdisp);
}

//extern extern(C) const IID IID_IHTMLSelectElement2;
mixin DEFINE_IID!(IHTMLSelectElement2, "3050f5ed-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLSelectElement2 : IDispatch {
public extern(Windows):
	HRESULT urns(VARIANT urn, IDispatch* pdisp);
}

//extern extern(C) const IID IID_IHTMLSelectElement4;
mixin DEFINE_IID!(IHTMLSelectElement4, "3050f838-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLSelectElement4 : IDispatch {
public extern(Windows):
	HRESULT namedItem(BSTR name, IDispatch* pdisp);
}

//extern extern(C) const IID IID_IHTMLSelectElement5;
mixin DEFINE_IID!(IHTMLSelectElement5, "3051049d-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLSelectElement5 : IDispatch {
public extern(Windows):
	HRESULT add(IHTMLOptionElement pElem, VARIANT* pvarBefore);
}

//extern extern(C) const IID DIID_DispHTMLSelectElement;
mixin DEFINE_GUID!("DIID_DispHTMLSelectElement", "3050f531-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLSelectElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLSelectElement;
mixin DEFINE_GUID!("CLSID_HTMLSelectElement", "3050f245-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTMLWndSelectElement;
mixin DEFINE_GUID!("DIID_DispHTMLWndSelectElement", "3050f597-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLWndSelectElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLWndSelectElement;
mixin DEFINE_GUID!("CLSID_HTMLWndSelectElement", "3050f2cf-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLSelectionObject;
mixin DEFINE_IID!(IHTMLSelectionObject, "3050f25A-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLSelectionObject : IDispatch {
public extern(Windows):
	HRESULT createRange(IDispatch* range);
	HRESULT empty();
	HRESULT clear();
	HRESULT get_type(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLSelectionObject2;
mixin DEFINE_IID!(IHTMLSelectionObject2, "3050f7ec-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLSelectionObject2 : IDispatch {
public extern(Windows):
	HRESULT createRangeCollection(IDispatch* rangeCollection);
	HRESULT get_typeDetail(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLOptionElement3;
mixin DEFINE_IID!(IHTMLOptionElement3, "3050f820-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLOptionElement3 : IDispatch {
public extern(Windows):
	HRESULT put_label(BSTR v);
	HRESULT get_label(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLOptionElementFactory;
mixin DEFINE_IID!(IHTMLOptionElementFactory, "3050f38c-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLOptionElementFactory : IDispatch {
public extern(Windows):
	HRESULT create(VARIANT text, VARIANT value, VARIANT defaultselected, VARIANT selected, IHTMLOptionElement* __MIDL__IHTMLOptionElementFactory0000);
}

//extern extern(C) const IID DIID_DispHTMLOptionElement;
mixin DEFINE_GUID!("DIID_DispHTMLOptionElement", "3050f52b-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLOptionElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLOptionElement;
mixin DEFINE_GUID!("CLSID_HTMLOptionElement", "3050f24d-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const CLSID CLSID_HTMLOptionElementFactory;
mixin DEFINE_GUID!("CLSID_HTMLOptionElementFactory", "3050f38d-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTMLWndOptionElement;
mixin DEFINE_GUID!("DIID_DispHTMLWndOptionElement", "3050f598-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLWndOptionElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLWndOptionElement;
mixin DEFINE_GUID!("CLSID_HTMLWndOptionElement", "3050f2d0-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_HTMLButtonElementEvents2;
mixin DEFINE_GUID!("DIID_HTMLButtonElementEvents2", "3050f617-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLButtonElementEvents2 : IDispatch {
}

//extern extern(C) const IID DIID_HTMLButtonElementEvents;
mixin DEFINE_GUID!("DIID_HTMLButtonElementEvents", "3050f2b3-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLButtonElementEvents : IDispatch {
}

//extern extern(C) const IID DIID_HTMLInputTextElementEvents2;
mixin DEFINE_GUID!("DIID_HTMLInputTextElementEvents2", "3050f618-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLInputTextElementEvents2 : IDispatch {
}

//extern extern(C) const IID DIID_HTMLOptionButtonElementEvents2;
mixin DEFINE_GUID!("DIID_HTMLOptionButtonElementEvents2", "3050f619-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLOptionButtonElementEvents2 : IDispatch {
}

//extern extern(C) const IID DIID_HTMLInputFileElementEvents2;
mixin DEFINE_GUID!("DIID_HTMLInputFileElementEvents2", "3050f61a-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLInputFileElementEvents2 : IDispatch {
}

//extern extern(C) const IID DIID_HTMLInputImageEvents2;
mixin DEFINE_GUID!("DIID_HTMLInputImageEvents2", "3050f61b-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLInputImageEvents2 : IDispatch {
}

//extern extern(C) const IID DIID_HTMLInputTextElementEvents;
mixin DEFINE_GUID!("DIID_HTMLInputTextElementEvents", "3050f2a7-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLInputTextElementEvents : IDispatch {
}

//extern extern(C) const IID DIID_HTMLOptionButtonElementEvents;
mixin DEFINE_GUID!("DIID_HTMLOptionButtonElementEvents", "3050f2bd-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLOptionButtonElementEvents : IDispatch {
}

//extern extern(C) const IID DIID_HTMLInputFileElementEvents;
mixin DEFINE_GUID!("DIID_HTMLInputFileElementEvents", "3050f2af-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLInputFileElementEvents : IDispatch {
}

//extern extern(C) const IID DIID_HTMLInputImageEvents;
mixin DEFINE_GUID!("DIID_HTMLInputImageEvents", "3050f2c3-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLInputImageEvents : IDispatch {
}

//extern extern(C) const IID IID_IHTMLInputElement;
mixin DEFINE_IID!(IHTMLInputElement, "3050f5d2-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLInputElement : IDispatch {
public extern(Windows):
	HRESULT put_type(BSTR v);
	HRESULT get_type(BSTR* p);
	HRESULT put_value(BSTR v);
	HRESULT get_value(BSTR* p);
	HRESULT put_name(BSTR v);
	HRESULT get_name(BSTR* p);
	HRESULT put_status(VARIANT_BOOL v);
	HRESULT get_status(VARIANT_BOOL* p);
	HRESULT put_disabled(VARIANT_BOOL v);
	HRESULT get_disabled(VARIANT_BOOL* p);
	HRESULT get_form(IHTMLFormElement* p);
	HRESULT put_size(int v);
	HRESULT get_size(int* p);
	HRESULT put_maxLength(int v);
	HRESULT get_maxLength(int* p);
	HRESULT select();
	HRESULT put_onchange(VARIANT v);
	HRESULT get_onchange(VARIANT* p);
	HRESULT put_onselect(VARIANT v);
	HRESULT get_onselect(VARIANT* p);
	HRESULT put_defaultValue(BSTR v);
	HRESULT get_defaultValue(BSTR* p);
	HRESULT put_readOnly(VARIANT_BOOL v);
	HRESULT get_readOnly(VARIANT_BOOL* p);
	HRESULT createTextRange(IHTMLTxtRange* range);
	HRESULT put_indeterminate(VARIANT_BOOL v);
	HRESULT get_indeterminate(VARIANT_BOOL* p);
	HRESULT put_defaultChecked(VARIANT_BOOL v);
	HRESULT get_defaultChecked(VARIANT_BOOL* p);
	HRESULT put_checked(VARIANT_BOOL v);
	HRESULT get_checked(VARIANT_BOOL* p);
	HRESULT put_border(VARIANT v);
	HRESULT get_border(VARIANT* p);
	HRESULT put_vspace(int v);
	HRESULT get_vspace(int* p);
	HRESULT put_hspace(int v);
	HRESULT get_hspace(int* p);
	HRESULT put_alt(BSTR v);
	HRESULT get_alt(BSTR* p);
	HRESULT put_src(BSTR v);
	HRESULT get_src(BSTR* p);
	HRESULT put_lowsrc(BSTR v);
	HRESULT get_lowsrc(BSTR* p);
	HRESULT put_vrml(BSTR v);
	HRESULT get_vrml(BSTR* p);
	HRESULT put_dynsrc(BSTR v);
	HRESULT get_dynsrc(BSTR* p);
	HRESULT get_readyState(BSTR* p);
	HRESULT get_complete(VARIANT_BOOL* p);
	HRESULT put_loop(VARIANT v);
	HRESULT get_loop(VARIANT* p);
	HRESULT put_align(BSTR v);
	HRESULT get_align(BSTR* p);
	HRESULT put_onload(VARIANT v);
	HRESULT get_onload(VARIANT* p);
	HRESULT put_onerror(VARIANT v);
	HRESULT get_onerror(VARIANT* p);
	HRESULT put_onabort(VARIANT v);
	HRESULT get_onabort(VARIANT* p);
	HRESULT put_width(int v);
	HRESULT get_width(int* p);
	HRESULT put_height(int v);
	HRESULT get_height(int* p);
	HRESULT put_start(BSTR v);
	HRESULT get_start(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLInputElement2;
mixin DEFINE_IID!(IHTMLInputElement2, "3050f821-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLInputElement2 : IDispatch {
public extern(Windows):
	HRESULT put_accept(BSTR v);
	HRESULT get_accept(BSTR* p);
	HRESULT put_useMap(BSTR v);
	HRESULT get_useMap(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLInputElement3;
mixin DEFINE_IID!(IHTMLInputElement3, "30510435-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLInputElement3 : IDispatch {
public extern(Windows):
	HRESULT put_src(BSTR v);
	HRESULT get_src(BSTR* p);
	HRESULT put_lowsrc(BSTR v);
	HRESULT get_lowsrc(BSTR* p);
	HRESULT put_vrml(BSTR v);
	HRESULT get_vrml(BSTR* p);
	HRESULT put_dynsrc(BSTR v);
	HRESULT get_dynsrc(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLInputButtonElement;
mixin DEFINE_IID!(IHTMLInputButtonElement, "3050f2b2-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLInputButtonElement : IDispatch {
public extern(Windows):
	HRESULT get_type(BSTR* p);
	HRESULT put_value(BSTR v);
	HRESULT get_value(BSTR* p);
	HRESULT put_name(BSTR v);
	HRESULT get_name(BSTR* p);
	HRESULT put_status(VARIANT v);
	HRESULT get_status(VARIANT* p);
	HRESULT put_disabled(VARIANT_BOOL v);
	HRESULT get_disabled(VARIANT_BOOL* p);
	HRESULT get_form(IHTMLFormElement* p);
	HRESULT createTextRange(IHTMLTxtRange* range);
}

//extern extern(C) const IID IID_IHTMLInputHiddenElement;
mixin DEFINE_IID!(IHTMLInputHiddenElement, "3050f2a4-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLInputHiddenElement : IDispatch {
public extern(Windows):
	HRESULT get_type(BSTR* p);
	HRESULT put_value(BSTR v);
	HRESULT get_value(BSTR* p);
	HRESULT put_name(BSTR v);
	HRESULT get_name(BSTR* p);
	HRESULT put_status(VARIANT v);
	HRESULT get_status(VARIANT* p);
	HRESULT put_disabled(VARIANT_BOOL v);
	HRESULT get_disabled(VARIANT_BOOL* p);
	HRESULT get_form(IHTMLFormElement* p);
	HRESULT createTextRange(IHTMLTxtRange* range);
}

//extern extern(C) const IID IID_IHTMLInputTextElement;
mixin DEFINE_IID!(IHTMLInputTextElement, "3050f2a6-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLInputTextElement : IDispatch {
public extern(Windows):
	HRESULT get_type(BSTR* p);
	HRESULT put_value(BSTR v);
	HRESULT get_value(BSTR* p);
	HRESULT put_name(BSTR v);
	HRESULT get_name(BSTR* p);
	HRESULT put_status(VARIANT v);
	HRESULT get_status(VARIANT* p);
	HRESULT put_disabled(VARIANT_BOOL v);
	HRESULT get_disabled(VARIANT_BOOL* p);
	HRESULT get_form(IHTMLFormElement* p);
	HRESULT put_defaultValue(BSTR v);
	HRESULT get_defaultValue(BSTR* p);
	HRESULT put_size(int v);
	HRESULT get_size(int* p);
	HRESULT put_maxLength(int v);
	HRESULT get_maxLength(int* p);
	HRESULT select();
	HRESULT put_onchange(VARIANT v);
	HRESULT get_onchange(VARIANT* p);
	HRESULT put_onselect(VARIANT v);
	HRESULT get_onselect(VARIANT* p);
	HRESULT put_readOnly(VARIANT_BOOL v);
	HRESULT get_readOnly(VARIANT_BOOL* p);
	HRESULT createTextRange(IHTMLTxtRange* range);
}

//extern extern(C) const IID IID_IHTMLInputFileElement;
mixin DEFINE_IID!(IHTMLInputFileElement, "3050f2ad-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLInputFileElement : IDispatch {
public extern(Windows):
	HRESULT get_type(BSTR* p);
	HRESULT put_name(BSTR v);
	HRESULT get_name(BSTR* p);
	HRESULT put_status(VARIANT v);
	HRESULT get_status(VARIANT* p);
	HRESULT put_disabled(VARIANT_BOOL v);
	HRESULT get_disabled(VARIANT_BOOL* p);
	HRESULT get_form(IHTMLFormElement* p);
	HRESULT put_size(int v);
	HRESULT get_size(int* p);
	HRESULT put_maxLength(int v);
	HRESULT get_maxLength(int* p);
	HRESULT select();
	HRESULT put_onchange(VARIANT v);
	HRESULT get_onchange(VARIANT* p);
	HRESULT put_onselect(VARIANT v);
	HRESULT get_onselect(VARIANT* p);
	HRESULT put_value(BSTR v);
	HRESULT get_value(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLOptionButtonElement;
mixin DEFINE_IID!(IHTMLOptionButtonElement, "3050f2bc-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLOptionButtonElement : IDispatch {
public extern(Windows):
	HRESULT put_value(BSTR v);
	HRESULT get_value(BSTR* p);
	HRESULT get_type(BSTR* p);
	HRESULT put_name(BSTR v);
	HRESULT get_name(BSTR* p);
	HRESULT put_checked(VARIANT_BOOL v);
	HRESULT get_checked(VARIANT_BOOL* p);
	HRESULT put_defaultChecked(VARIANT_BOOL v);
	HRESULT get_defaultChecked(VARIANT_BOOL* p);
	HRESULT put_onchange(VARIANT v);
	HRESULT get_onchange(VARIANT* p);
	HRESULT put_disabled(VARIANT_BOOL v);
	HRESULT get_disabled(VARIANT_BOOL* p);
	HRESULT put_status(VARIANT_BOOL v);
	HRESULT get_status(VARIANT_BOOL* p);
	HRESULT put_indeterminate(VARIANT_BOOL v);
	HRESULT get_indeterminate(VARIANT_BOOL* p);
	HRESULT get_form(IHTMLFormElement* p);
}

//extern extern(C) const IID IID_IHTMLInputImage;
mixin DEFINE_IID!(IHTMLInputImage, "3050f2c2-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLInputImage : IDispatch {
public extern(Windows):
	HRESULT get_type(BSTR* p);
	HRESULT put_disabled(VARIANT_BOOL v);
	HRESULT get_disabled(VARIANT_BOOL* p);
	HRESULT put_border(VARIANT v);
	HRESULT get_border(VARIANT* p);
	HRESULT put_vspace(int v);
	HRESULT get_vspace(int* p);
	HRESULT put_hspace(int v);
	HRESULT get_hspace(int* p);
	HRESULT put_alt(BSTR v);
	HRESULT get_alt(BSTR* p);
	HRESULT put_src(BSTR v);
	HRESULT get_src(BSTR* p);
	HRESULT put_lowsrc(BSTR v);
	HRESULT get_lowsrc(BSTR* p);
	HRESULT put_vrml(BSTR v);
	HRESULT get_vrml(BSTR* p);
	HRESULT put_dynsrc(BSTR v);
	HRESULT get_dynsrc(BSTR* p);
	HRESULT get_readyState(BSTR* p);
	HRESULT get_complete(VARIANT_BOOL* p);
	HRESULT put_loop(VARIANT v);
	HRESULT get_loop(VARIANT* p);
	HRESULT put_align(BSTR v);
	HRESULT get_align(BSTR* p);
	HRESULT put_onload(VARIANT v);
	HRESULT get_onload(VARIANT* p);
	HRESULT put_onerror(VARIANT v);
	HRESULT get_onerror(VARIANT* p);
	HRESULT put_onabort(VARIANT v);
	HRESULT get_onabort(VARIANT* p);
	HRESULT put_name(BSTR v);
	HRESULT get_name(BSTR* p);
	HRESULT put_width(int v);
	HRESULT get_width(int* p);
	HRESULT put_height(int v);
	HRESULT get_height(int* p);
	HRESULT put_start(BSTR v);
	HRESULT get_start(BSTR* p);
}

//extern extern(C) const IID DIID_DispHTMLInputElement;
mixin DEFINE_GUID!("DIID_DispHTMLInputElement", "3050f57d-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLInputElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLInputElement;
mixin DEFINE_GUID!("CLSID_HTMLInputElement", "3050f5d8-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLTextAreaElement;
mixin DEFINE_IID!(IHTMLTextAreaElement, "3050f2aa-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLTextAreaElement : IDispatch {
public extern(Windows):
	HRESULT get_type(BSTR* p);
	HRESULT put_value(BSTR v);
	HRESULT get_value(BSTR* p);
	HRESULT put_name(BSTR v);
	HRESULT get_name(BSTR* p);
	HRESULT put_status(VARIANT v);
	HRESULT get_status(VARIANT* p);
	HRESULT put_disabled(VARIANT_BOOL v);
	HRESULT get_disabled(VARIANT_BOOL* p);
	HRESULT get_form(IHTMLFormElement* p);
	HRESULT put_defaultValue(BSTR v);
	HRESULT get_defaultValue(BSTR* p);
	HRESULT select();
	HRESULT put_onchange(VARIANT v);
	HRESULT get_onchange(VARIANT* p);
	HRESULT put_onselect(VARIANT v);
	HRESULT get_onselect(VARIANT* p);
	HRESULT put_readOnly(VARIANT_BOOL v);
	HRESULT get_readOnly(VARIANT_BOOL* p);
	HRESULT put_rows(int v);
	HRESULT get_rows(int* p);
	HRESULT put_cols(int v);
	HRESULT get_cols(int* p);
	HRESULT put_wrap(BSTR v);
	HRESULT get_wrap(BSTR* p);
	HRESULT createTextRange(IHTMLTxtRange* range);
}

//extern extern(C) const IID DIID_DispHTMLTextAreaElement;
mixin DEFINE_GUID!("DIID_DispHTMLTextAreaElement", "3050f521-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLTextAreaElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLTextAreaElement;
mixin DEFINE_GUID!("CLSID_HTMLTextAreaElement", "3050f2ac-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTMLRichtextElement;
mixin DEFINE_GUID!("DIID_DispHTMLRichtextElement", "3050f54d-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLRichtextElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLRichtextElement;
mixin DEFINE_GUID!("CLSID_HTMLRichtextElement", "3050f2df-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLButtonElement;
mixin DEFINE_IID!(IHTMLButtonElement, "3050f2bb-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLButtonElement : IDispatch {
public extern(Windows):
	HRESULT get_type(BSTR* p);
	HRESULT put_value(BSTR v);
	HRESULT get_value(BSTR* p);
	HRESULT put_name(BSTR v);
	HRESULT get_name(BSTR* p);
	HRESULT put_status(VARIANT v);
	HRESULT get_status(VARIANT* p);
	HRESULT put_disabled(VARIANT_BOOL v);
	HRESULT get_disabled(VARIANT_BOOL* p);
	HRESULT get_form(IHTMLFormElement* p);
	HRESULT createTextRange(IHTMLTxtRange* range);
}

//extern extern(C) const IID DIID_DispHTMLButtonElement;
mixin DEFINE_GUID!("DIID_DispHTMLButtonElement", "3050f51f-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLButtonElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLButtonElement;
mixin DEFINE_GUID!("CLSID_HTMLButtonElement", "3050f2c6-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_HTMLMarqueeElementEvents2;
mixin DEFINE_GUID!("DIID_HTMLMarqueeElementEvents2", "3050f61f-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLMarqueeElementEvents2 : IDispatch {
}

//extern extern(C) const IID DIID_HTMLMarqueeElementEvents;
mixin DEFINE_GUID!("DIID_HTMLMarqueeElementEvents", "3050f2b8-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLMarqueeElementEvents : IDispatch {
}

//extern extern(C) const IID IID_IHTMLMarqueeElement;
mixin DEFINE_IID!(IHTMLMarqueeElement, "3050f2b5-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLMarqueeElement : IDispatch {
public extern(Windows):
	HRESULT put_bgColor(VARIANT v);
	HRESULT get_bgColor(VARIANT* p);
	HRESULT put_scrollDelay(int v);
	HRESULT get_scrollDelay(int* p);
	HRESULT put_direction(BSTR v);
	HRESULT get_direction(BSTR* p);
	HRESULT put_behavior(BSTR v);
	HRESULT get_behavior(BSTR* p);
	HRESULT put_scrollAmount(int v);
	HRESULT get_scrollAmount(int* p);
	HRESULT put_loop(int v);
	HRESULT get_loop(int* p);
	HRESULT put_vspace(int v);
	HRESULT get_vspace(int* p);
	HRESULT put_hspace(int v);
	HRESULT get_hspace(int* p);
	HRESULT put_onfinish(VARIANT v);
	HRESULT get_onfinish(VARIANT* p);
	HRESULT put_onstart(VARIANT v);
	HRESULT get_onstart(VARIANT* p);
	HRESULT put_onbounce(VARIANT v);
	HRESULT get_onbounce(VARIANT* p);
	HRESULT put_width(VARIANT v);
	HRESULT get_width(VARIANT* p);
	HRESULT put_height(VARIANT v);
	HRESULT get_height(VARIANT* p);
	HRESULT put_trueSpeed(VARIANT_BOOL v);
	HRESULT get_trueSpeed(VARIANT_BOOL* p);
	HRESULT start();
	HRESULT stop();
}

//extern extern(C) const IID DIID_DispHTMLMarqueeElement;
mixin DEFINE_GUID!("DIID_DispHTMLMarqueeElement", "3050f527-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLMarqueeElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLMarqueeElement;
mixin DEFINE_GUID!("CLSID_HTMLMarqueeElement", "3050f2b9-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLHtmlElement;
mixin DEFINE_IID!(IHTMLHtmlElement, "3050f81c-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLHtmlElement : IDispatch {
public extern(Windows):
	HRESULT put_version(BSTR v);
	HRESULT get_version(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLHeadElement;
mixin DEFINE_IID!(IHTMLHeadElement, "3050f81d-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLHeadElement : IDispatch {
public extern(Windows):
	HRESULT put_profile(BSTR v);
	HRESULT get_profile(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLHeadElement2;
mixin DEFINE_IID!(IHTMLHeadElement2, "3051042f-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLHeadElement2 : IDispatch {
public extern(Windows):
	HRESULT put_profile(BSTR v);
	HRESULT get_profile(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLTitleElement;
mixin DEFINE_IID!(IHTMLTitleElement, "3050f322-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLTitleElement : IDispatch {
public extern(Windows):
	HRESULT put_text(BSTR v);
	HRESULT get_text(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLMetaElement;
mixin DEFINE_IID!(IHTMLMetaElement, "3050f203-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLMetaElement : IDispatch {
public extern(Windows):
	HRESULT put_httpEquiv(BSTR v);
	HRESULT get_httpEquiv(BSTR* p);
	HRESULT put_content(BSTR v);
	HRESULT get_content(BSTR* p);
	HRESULT put_name(BSTR v);
	HRESULT get_name(BSTR* p);
	HRESULT put_url(BSTR v);
	HRESULT get_url(BSTR* p);
	HRESULT put_charset(BSTR v);
	HRESULT get_charset(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLMetaElement2;
mixin DEFINE_IID!(IHTMLMetaElement2, "3050f81f-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLMetaElement2 : IDispatch {
public extern(Windows):
	HRESULT put_scheme(BSTR v);
	HRESULT get_scheme(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLMetaElement3;
mixin DEFINE_IID!(IHTMLMetaElement3, "30510495-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLMetaElement3 : IDispatch {
public extern(Windows):
	HRESULT put_url(BSTR v);
	HRESULT get_url(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLBaseElement;
mixin DEFINE_IID!(IHTMLBaseElement, "3050f204-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLBaseElement : IDispatch {
public extern(Windows):
	HRESULT put_href(BSTR v);
	HRESULT get_href(BSTR* p);
	HRESULT put_target(BSTR v);
	HRESULT get_target(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLBaseElement2;
mixin DEFINE_IID!(IHTMLBaseElement2, "30510420-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLBaseElement2 : IDispatch {
public extern(Windows):
	HRESULT put_href(BSTR v);
	HRESULT get_href(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLIsIndexElement;
mixin DEFINE_IID!(IHTMLIsIndexElement, "3050f206-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLIsIndexElement : IDispatch {
public extern(Windows):
	HRESULT put_prompt(BSTR v);
	HRESULT get_prompt(BSTR* p);
	HRESULT put_action(BSTR v);
	HRESULT get_action(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLIsIndexElement2;
mixin DEFINE_IID!(IHTMLIsIndexElement2, "3050f82f-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLIsIndexElement2 : IDispatch {
public extern(Windows):
	HRESULT get_form(IHTMLFormElement* p);
}

//extern extern(C) const IID IID_IHTMLNextIdElement;
mixin DEFINE_IID!(IHTMLNextIdElement, "3050f207-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLNextIdElement : IDispatch {
public extern(Windows):
	HRESULT put_n(BSTR v);
	HRESULT get_n(BSTR* p);
}

//extern extern(C) const IID DIID_DispHTMLHtmlElement;
mixin DEFINE_GUID!("DIID_DispHTMLHtmlElement", "3050f560-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLHtmlElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLHtmlElement;
mixin DEFINE_GUID!("CLSID_HTMLHtmlElement", "3050f491-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTMLHeadElement;
mixin DEFINE_GUID!("DIID_DispHTMLHeadElement", "3050f561-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLHeadElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLHeadElement;
mixin DEFINE_GUID!("CLSID_HTMLHeadElement", "3050f493-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTMLTitleElement;
mixin DEFINE_GUID!("DIID_DispHTMLTitleElement", "3050f516-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLTitleElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLTitleElement;
mixin DEFINE_GUID!("CLSID_HTMLTitleElement", "3050f284-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTMLMetaElement;
mixin DEFINE_GUID!("DIID_DispHTMLMetaElement", "3050f517-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLMetaElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLMetaElement;
mixin DEFINE_GUID!("CLSID_HTMLMetaElement", "3050f275-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTMLBaseElement;
mixin DEFINE_GUID!("DIID_DispHTMLBaseElement", "3050f518-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLBaseElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLBaseElement;
mixin DEFINE_GUID!("CLSID_HTMLBaseElement", "3050f276-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTMLIsIndexElement;
mixin DEFINE_GUID!("DIID_DispHTMLIsIndexElement", "3050f519-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLIsIndexElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLIsIndexElement;
mixin DEFINE_GUID!("CLSID_HTMLIsIndexElement", "3050f278-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTMLNextIdElement;
mixin DEFINE_GUID!("DIID_DispHTMLNextIdElement", "3050f51a-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLNextIdElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLNextIdElement;
mixin DEFINE_GUID!("CLSID_HTMLNextIdElement", "3050f279-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLBaseFontElement;
mixin DEFINE_IID!(IHTMLBaseFontElement, "3050f202-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLBaseFontElement : IDispatch {
public extern(Windows):
	HRESULT put_color(VARIANT v);
	HRESULT get_color(VARIANT* p);
	HRESULT put_face(BSTR v);
	HRESULT get_face(BSTR* p);
	HRESULT put_size(int v);
	HRESULT get_size(int* p);
}

//extern extern(C) const IID DIID_DispHTMLBaseFontElement;
mixin DEFINE_GUID!("DIID_DispHTMLBaseFontElement", "3050f504-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLBaseFontElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLBaseFontElement;
mixin DEFINE_GUID!("CLSID_HTMLBaseFontElement", "3050f282-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLUnknownElement;
mixin DEFINE_IID!(IHTMLUnknownElement, "3050f209-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLUnknownElement : IDispatch {
public extern(Windows):
}

//extern extern(C) const IID DIID_DispHTMLUnknownElement;
mixin DEFINE_GUID!("DIID_DispHTMLUnknownElement", "3050f539-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLUnknownElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLUnknownElement;
mixin DEFINE_GUID!("CLSID_HTMLUnknownElement", "3050f268-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IOmHistory;
mixin DEFINE_IID!(IOmHistory, "FECEAAA2-8405-11cf-8BA1-00AA00476DA6");
interface IOmHistory : IDispatch {
public extern(Windows):
	HRESULT get_length(short* p);
	HRESULT back(VARIANT* pvargdistance);
	HRESULT forward(VARIANT* pvargdistance);
	HRESULT go(VARIANT* pvargdistance);
}

//extern extern(C) const IID IID_IHTMLMimeTypesCollection;
mixin DEFINE_IID!(IHTMLMimeTypesCollection, "3050f3fc-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLMimeTypesCollection : IDispatch {
public extern(Windows):
	HRESULT get_length(int* p);
}

//extern extern(C) const IID IID_IHTMLPluginsCollection;
mixin DEFINE_IID!(IHTMLPluginsCollection, "3050f3fd-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLPluginsCollection : IDispatch {
public extern(Windows):
	HRESULT get_length(int* p);
	HRESULT refresh(VARIANT_BOOL reload = 0);
}

//extern extern(C) const IID IID_IHTMLOpsProfile;
mixin DEFINE_IID!(IHTMLOpsProfile, "3050f401-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLOpsProfile : IDispatch {
public extern(Windows):
	HRESULT addRequest(BSTR name, VARIANT reserved, VARIANT_BOOL* success);
	HRESULT clearRequest();
	HRESULT doRequest(VARIANT usage, VARIANT fname, VARIANT domain, VARIANT path, VARIANT expire, VARIANT reserved);
	HRESULT getAttribute(BSTR name, BSTR* value);
	HRESULT setAttribute(BSTR name, BSTR value, VARIANT prefs, VARIANT_BOOL* success);
	HRESULT commitChanges(VARIANT_BOOL* success);
	HRESULT addReadRequest(BSTR name, VARIANT reserved, VARIANT_BOOL* success);
	HRESULT doReadRequest(VARIANT usage, VARIANT fname, VARIANT domain, VARIANT path, VARIANT expire, VARIANT reserved);
	HRESULT doWriteRequest(VARIANT_BOOL* success);
}

//extern extern(C) const IID IID_IOmNavigator;
mixin DEFINE_IID!(IOmNavigator, "FECEAAA5-8405-11cf-8BA1-00AA00476DA6");
interface IOmNavigator : IDispatch {
public extern(Windows):
	HRESULT get_appCodeName(BSTR* p);
	HRESULT get_appName(BSTR* p);
	HRESULT get_appVersion(BSTR* p);
	HRESULT get_userAgent(BSTR* p);
	HRESULT javaEnabled(VARIANT_BOOL* enabled);
	HRESULT taintEnabled(VARIANT_BOOL* enabled);
	HRESULT get_mimeTypes(IHTMLMimeTypesCollection* p);
	HRESULT get_plugins(IHTMLPluginsCollection* p);
	HRESULT get_cookieEnabled(VARIANT_BOOL* p);
	HRESULT get_opsProfile(IHTMLOpsProfile* p);
	HRESULT toString(BSTR* string);
	HRESULT get_cpuClass(BSTR* p);
	HRESULT get_systemLanguage(BSTR* p);
	HRESULT get_browserLanguage(BSTR* p);
	HRESULT get_userLanguage(BSTR* p);
	HRESULT get_platform(BSTR* p);
	HRESULT get_appMinorVersion(BSTR* p);
	HRESULT get_connectionSpeed(int* p);
	HRESULT get_onLine(VARIANT_BOOL* p);
	HRESULT get_userProfile(IHTMLOpsProfile* p);
}

//extern extern(C) const IID IID_IHTMLLocation;
mixin DEFINE_IID!(IHTMLLocation, "163BB1E0-6E00-11cf-837A-48DC04C10000");
interface IHTMLLocation : IDispatch {
public extern(Windows):
	HRESULT put_href(BSTR v);
	HRESULT get_href(BSTR* p);
	HRESULT put_protocol(BSTR v);
	HRESULT get_protocol(BSTR* p);
	HRESULT put_host(BSTR v);
	HRESULT get_host(BSTR* p);
	HRESULT put_hostname(BSTR v);
	HRESULT get_hostname(BSTR* p);
	HRESULT put_port(BSTR v);
	HRESULT get_port(BSTR* p);
	HRESULT put_pathname(BSTR v);
	HRESULT get_pathname(BSTR* p);
	HRESULT put_search(BSTR v);
	HRESULT get_search(BSTR* p);
	HRESULT put_hash(BSTR v);
	HRESULT get_hash(BSTR* p);
	HRESULT reload(VARIANT_BOOL flag = 0);
	HRESULT replace(BSTR bstr);
	HRESULT assign(BSTR bstr);
	HRESULT toString(BSTR* string);
}

//extern extern(C) const IID DIID_DispHTMLHistory;
mixin DEFINE_GUID!("DIID_DispHTMLHistory", "3050f549-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLHistory : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLHistory;
mixin DEFINE_GUID!("CLSID_HTMLHistory", "FECEAAA3-8405-11cf-8BA1-00AA00476DA6");

//extern extern(C) const CLSID CLSID_CMimeTypes;
mixin DEFINE_GUID!("CLSID_CMimeTypes", "3050f3fe-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispCPlugins;
mixin DEFINE_GUID!("DIID_DispCPlugins", "3050f54a-98b5-11cf-bb82-00aa00bdce0b");
interface DispCPlugins : IDispatch {
}

//extern extern(C) const CLSID CLSID_CPlugins;
mixin DEFINE_GUID!("CLSID_CPlugins", "3050f3ff-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const CLSID CLSID_COpsProfile;
mixin DEFINE_GUID!("CLSID_COpsProfile", "3050f402-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTMLNavigator;
mixin DEFINE_GUID!("DIID_DispHTMLNavigator", "3050f54c-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLNavigator : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLNavigator;
mixin DEFINE_GUID!("CLSID_HTMLNavigator", "FECEAAA6-8405-11cf-8BA1-00AA00476DA6");

//extern extern(C) const IID DIID_DispHTMLLocation;
mixin DEFINE_GUID!("DIID_DispHTMLLocation", "3050f54e-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLLocation : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLLocation;
mixin DEFINE_GUID!("CLSID_HTMLLocation", "163BB1E1-6E00-11cf-837A-48DC04C10000");

//extern extern(C) const IID IID_IHTMLBookmarkCollection;
mixin DEFINE_IID!(IHTMLBookmarkCollection, "3050f4ce-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLBookmarkCollection : IDispatch {
public extern(Windows):
	HRESULT get_length(int* p);
	HRESULT get__newEnum(IUnknown* p);
	HRESULT item(int index, VARIANT* pVarBookmark);
}

//extern extern(C) const IID IID_IHTMLDataTransfer;
mixin DEFINE_IID!(IHTMLDataTransfer, "3050f4b3-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLDataTransfer : IDispatch {
public extern(Windows):
	HRESULT setData(BSTR format, VARIANT* data, VARIANT_BOOL* pret);
	HRESULT getData(BSTR format, VARIANT* pvarRet);
	HRESULT clearData(BSTR format, VARIANT_BOOL* pret);
	HRESULT put_dropEffect(BSTR v);
	HRESULT get_dropEffect(BSTR* p);
	HRESULT put_effectAllowed(BSTR v);
	HRESULT get_effectAllowed(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLEventObj2;
mixin DEFINE_IID!(IHTMLEventObj2, "3050f48B-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLEventObj2 : IDispatch {
public extern(Windows):
	HRESULT setAttribute(BSTR strAttributeName, VARIANT AttributeValue, LONG lFlags = 1);
	HRESULT getAttribute(BSTR strAttributeName, LONG lFlags, VARIANT* AttributeValue);
	HRESULT removeAttribute(BSTR strAttributeName, LONG lFlags, VARIANT_BOOL* pfSuccess);
	HRESULT put_propertyName(BSTR v);
	HRESULT get_propertyName(BSTR* p);
	HRESULT putref_bookmarks(IHTMLBookmarkCollection v);
	HRESULT get_bookmarks(IHTMLBookmarkCollection* p);
	HRESULT putref_recordset(IDispatch v);
	HRESULT get_recordset(IDispatch* p);
	HRESULT put_dataFld(BSTR v);
	HRESULT get_dataFld(BSTR* p);
	HRESULT putref_boundElements(IHTMLElementCollection v);
	HRESULT get_boundElements(IHTMLElementCollection* p);
	HRESULT put_repeat(VARIANT_BOOL v);
	HRESULT get_repeat(VARIANT_BOOL* p);
	HRESULT put_srcUrn(BSTR v);
	HRESULT get_srcUrn(BSTR* p);
	HRESULT putref_srcElement(IHTMLElement* v);
	HRESULT get_srcElement(IHTMLElement* p);
	HRESULT put_altKey(VARIANT_BOOL v);
	HRESULT get_altKey(VARIANT_BOOL* p);
	HRESULT put_ctrlKey(VARIANT_BOOL v);
	HRESULT get_ctrlKey(VARIANT_BOOL* p);
	HRESULT put_shiftKey(VARIANT_BOOL v);
	HRESULT get_shiftKey(VARIANT_BOOL* p);
	HRESULT putref_fromElement(IHTMLElement* v);
	HRESULT get_fromElement(IHTMLElement* p);
	HRESULT putref_toElement(IHTMLElement* v);
	HRESULT get_toElement(IHTMLElement* p);
	HRESULT put_button(int v);
	HRESULT get_button(int* p);
	HRESULT put_type(BSTR v);
	HRESULT get_type(BSTR* p);
	HRESULT put_qualifier(BSTR v);
	HRESULT get_qualifier(BSTR* p);
	HRESULT put_reason(int v);
	HRESULT get_reason(int* p);
	HRESULT put_x(int v);
	HRESULT get_x(int* p);
	HRESULT put_y(int v);
	HRESULT get_y(int* p);
	HRESULT put_clientX(int v);
	HRESULT get_clientX(int* p);
	HRESULT put_clientY(int v);
	HRESULT get_clientY(int* p);
	HRESULT put_offsetX(int v);
	HRESULT get_offsetX(int* p);
	HRESULT put_offsetY(int v);
	HRESULT get_offsetY(int* p);
	HRESULT put_screenX(int v);
	HRESULT get_screenX(int* p);
	HRESULT put_screenY(int v);
	HRESULT get_screenY(int* p);
	HRESULT putref_srcFilter(IDispatch v);
	HRESULT get_srcFilter(IDispatch* p);
	HRESULT get_dataTransfer(IHTMLDataTransfer* p);
}

//extern extern(C) const IID IID_IHTMLEventObj3;
mixin DEFINE_IID!(IHTMLEventObj3, "3050f680-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLEventObj3 : IDispatch {
public extern(Windows):
	HRESULT get_contentOverflow(VARIANT_BOOL* p);
	HRESULT put_shiftLeft(VARIANT_BOOL v);
	HRESULT get_shiftLeft(VARIANT_BOOL* p);
	HRESULT put_altLeft(VARIANT_BOOL v);
	HRESULT get_altLeft(VARIANT_BOOL* p);
	HRESULT put_ctrlLeft(VARIANT_BOOL v);
	HRESULT get_ctrlLeft(VARIANT_BOOL* p);
	HRESULT get_imeCompositionChange(LONG_PTR* p);
	HRESULT get_imeNotifyCommand(LONG_PTR* p);
	HRESULT get_imeNotifyData(LONG_PTR* p);
	HRESULT get_imeRequest(LONG_PTR* p);
	HRESULT get_imeRequestData(LONG_PTR* p);
	HRESULT get_keyboardLayout(LONG_PTR* p);
	HRESULT get_behaviorCookie(int* p);
	HRESULT get_behaviorPart(int* p);
	HRESULT get_nextPage(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLEventObj4;
mixin DEFINE_IID!(IHTMLEventObj4, "3050f814-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLEventObj4 : IDispatch {
public extern(Windows):
	HRESULT get_wheelDelta(int* p);
}

//extern extern(C) const IID IID_IHTMLEventObj5;
mixin DEFINE_IID!(IHTMLEventObj5, "30510478-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLEventObj5 : IDispatch {
public extern(Windows):
	HRESULT put_url(BSTR v);
	HRESULT get_url(BSTR* p);
	HRESULT put_data(BSTR v);
	HRESULT get_data(BSTR* p);
	HRESULT get_source(IDispatch* p);
	HRESULT put_origin(BSTR v);
	HRESULT get_origin(BSTR* p);
	HRESULT put_issession(VARIANT_BOOL v);
	HRESULT get_issession(VARIANT_BOOL* p);
}

//extern extern(C) const IID DIID_DispCEventObj;
mixin DEFINE_GUID!("DIID_DispCEventObj", "3050f558-98b5-11cf-bb82-00aa00bdce0b");
interface DispCEventObj : IDispatch {
}

//extern extern(C) const CLSID CLSID_CEventObj;
mixin DEFINE_GUID!("CLSID_CEventObj", "3050f48A-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_HTMLWindowEvents3;
mixin DEFINE_GUID!("DIID_HTMLWindowEvents3", "3050f5a1-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLWindowEvents3 : IDispatch {
}

//extern extern(C) const IID DIID_HTMLWindowEvents2;
mixin DEFINE_GUID!("DIID_HTMLWindowEvents2", "3050f625-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLWindowEvents2 : IDispatch {
}

//extern extern(C) const IID DIID_HTMLWindowEvents;
mixin DEFINE_GUID!("DIID_HTMLWindowEvents", "96A0A4E0-D062-11cf-94B6-00AA0060275C");
interface HTMLWindowEvents : IDispatch {
}

//extern extern(C) const IID IID_IHTMLDocument2;
mixin DEFINE_IID!(IHTMLDocument2, "332c4425-26cb-11d0-b483-00c04fd90119");
interface IHTMLDocument2 : IHTMLDocument {
public extern(Windows):
	HRESULT get_all(IHTMLElementCollection* p);
	HRESULT get_body(IHTMLElement* p);
	HRESULT get_activeElement(IHTMLElement* p);
	HRESULT get_images(IHTMLElementCollection* p);
	HRESULT get_applets(IHTMLElementCollection* p);
	HRESULT get_links(IHTMLElementCollection* p);
	HRESULT get_forms(IHTMLElementCollection* p);
	HRESULT get_anchors(IHTMLElementCollection* p);
	HRESULT put_title(BSTR v);
	HRESULT get_title(BSTR* p);
	HRESULT get_scripts(IHTMLElementCollection* p);
	HRESULT put_designMode(BSTR v);
	HRESULT get_designMode(BSTR* p);
	HRESULT get_selection(IHTMLSelectionObject* p);
	HRESULT get_readyState(BSTR* p);
	HRESULT get_frames(IHTMLFramesCollection2* p);
	HRESULT get_embeds(IHTMLElementCollection* p);
	HRESULT get_plugins(IHTMLElementCollection* p);
	HRESULT put_alinkColor(VARIANT v);
	HRESULT get_alinkColor(VARIANT* p);
	HRESULT put_bgColor(VARIANT v);
	HRESULT get_bgColor(VARIANT* p);
	HRESULT put_fgColor(VARIANT v);
	HRESULT get_fgColor(VARIANT* p);
	HRESULT put_linkColor(VARIANT v);
	HRESULT get_linkColor(VARIANT* p);
	HRESULT put_vlinkColor(VARIANT v);
	HRESULT get_vlinkColor(VARIANT* p);
	HRESULT get_referrer(BSTR* p);
	HRESULT get_location(IHTMLLocation* p);
	HRESULT get_lastModified(BSTR* p);
	HRESULT put_URL(BSTR v);
	HRESULT get_URL(BSTR* p);
	HRESULT put_domain(BSTR v);
	HRESULT get_domain(BSTR* p);
	HRESULT put_cookie(BSTR v);
	HRESULT get_cookie(BSTR* p);
	HRESULT put_expando(VARIANT_BOOL v);
	HRESULT get_expando(VARIANT_BOOL* p);
	HRESULT put_charset(BSTR v);
	HRESULT get_charset(BSTR* p);
	HRESULT put_defaultCharset(BSTR v);
	HRESULT get_defaultCharset(BSTR* p);
	HRESULT get_mimeType(BSTR* p);
	HRESULT get_fileSize(BSTR* p);
	HRESULT get_fileCreatedDate(BSTR* p);
	HRESULT get_fileModifiedDate(BSTR* p);
	HRESULT get_fileUpdatedDate(BSTR* p);
	HRESULT get_security(BSTR* p);
	HRESULT get_protocol(BSTR* p);
	HRESULT get_nameProp(BSTR* p);
	HRESULT write(SAFEARRAY* psarray);
	HRESULT writeln(SAFEARRAY* psarray);
	HRESULT open(BSTR url, VARIANT name, VARIANT features, VARIANT replace, IDispatch* pomWindowResult);
	HRESULT close();
	HRESULT clear();
	HRESULT queryCommandSupported(BSTR cmdID, VARIANT_BOOL* pfRet);
	HRESULT queryCommandEnabled(BSTR cmdID, VARIANT_BOOL* pfRet);
	HRESULT queryCommandState(BSTR cmdID, VARIANT_BOOL* pfRet);
	HRESULT queryCommandIndeterm(BSTR cmdID, VARIANT_BOOL* pfRet);
	HRESULT queryCommandText(BSTR cmdID, BSTR* pcmdText);
	HRESULT queryCommandValue(BSTR cmdID, VARIANT* pcmdValue);
	HRESULT execCommand(BSTR cmdID, VARIANT_BOOL showUI, VARIANT value, VARIANT_BOOL* pfRet);
	HRESULT execCommandShowHelp(BSTR cmdID, VARIANT_BOOL* pfRet);
	HRESULT createElement(BSTR eTag, IHTMLElement* newElem);
	HRESULT put_onhelp(VARIANT v);
	HRESULT get_onhelp(VARIANT* p);
	HRESULT put_onclick(VARIANT v);
	HRESULT get_onclick(VARIANT* p);
	HRESULT put_ondblclick(VARIANT v);
	HRESULT get_ondblclick(VARIANT* p);
	HRESULT put_onkeyup(VARIANT v);
	HRESULT get_onkeyup(VARIANT* p);
	HRESULT put_onkeydown(VARIANT v);
	HRESULT get_onkeydown(VARIANT* p);
	HRESULT put_onkeypress(VARIANT v);
	HRESULT get_onkeypress(VARIANT* p);
	HRESULT put_onmouseup(VARIANT v);
	HRESULT get_onmouseup(VARIANT* p);
	HRESULT put_onmousedown(VARIANT v);
	HRESULT get_onmousedown(VARIANT* p);
	HRESULT put_onmousemove(VARIANT v);
	HRESULT get_onmousemove(VARIANT* p);
	HRESULT put_onmouseout(VARIANT v);
	HRESULT get_onmouseout(VARIANT* p);
	HRESULT put_onmouseover(VARIANT v);
	HRESULT get_onmouseover(VARIANT* p);
	HRESULT put_onreadystatechange(VARIANT v);
	HRESULT get_onreadystatechange(VARIANT* p);
	HRESULT put_onafterupdate(VARIANT v);
	HRESULT get_onafterupdate(VARIANT* p);
	HRESULT put_onrowexit(VARIANT v);
	HRESULT get_onrowexit(VARIANT* p);
	HRESULT put_onrowenter(VARIANT v);
	HRESULT get_onrowenter(VARIANT* p);
	HRESULT put_ondragstart(VARIANT v);
	HRESULT get_ondragstart(VARIANT* p);
	HRESULT put_onselectstart(VARIANT v);
	HRESULT get_onselectstart(VARIANT* p);
	HRESULT elementFromPoint(int x, int y, IHTMLElement* elementHit);
	HRESULT get_parentWindow(IHTMLWindow2* p);
	HRESULT get_styleSheets(IHTMLStyleSheetsCollection* p);
	HRESULT put_onbeforeupdate(VARIANT v);
	HRESULT get_onbeforeupdate(VARIANT* p);
	HRESULT put_onerrorupdate(VARIANT v);
	HRESULT get_onerrorupdate(VARIANT* p);
	HRESULT toString(BSTR* String);
	HRESULT createStyleSheet(BSTR bstrHref, int lIndex, IHTMLStyleSheet* ppnewStyleSheet);
}

//extern extern(C) const IID IID_IHTMLFramesCollection2;
mixin DEFINE_IID!(IHTMLFramesCollection2, "332c4426-26cb-11d0-b483-00c04fd90119");
interface IHTMLFramesCollection2 : IDispatch {
public extern(Windows):
	HRESULT item(VARIANT* pvarIndex, VARIANT* pvarResult);
	HRESULT get_length(int* p);
}

//extern extern(C) const IID IID_IHTMLWindow2;
mixin DEFINE_IID!(IHTMLWindow2, "332c4427-26cb-11d0-b483-00c04fd90119");
interface IHTMLWindow2 : IHTMLFramesCollection2 {
public extern(Windows):
	HRESULT get_frames(IHTMLFramesCollection2* p);
	HRESULT put_defaultStatus(BSTR v);
	HRESULT get_defaultStatus(BSTR* p);
	HRESULT put_status(BSTR v);
	HRESULT get_status(BSTR* p);
	HRESULT setTimeout(BSTR expression, int msec, VARIANT* language, int* timerID);
	HRESULT clearTimeout(int timerID);
	HRESULT alert(BSTR message/* = ""*/);
	HRESULT confirm(BSTR message, VARIANT_BOOL* confirmed);
	HRESULT prompt(BSTR message, BSTR defstr, VARIANT* textdata);
	HRESULT get_Image(IHTMLImageElementFactory* p);
	HRESULT get_location(IHTMLLocation* p);
	HRESULT get_history(IOmHistory* p);
	HRESULT close();
	HRESULT put_opener(VARIANT v);
	HRESULT get_opener(VARIANT* p);
	HRESULT get_navigator(IOmNavigator* p);
	HRESULT put_name(BSTR v);
	HRESULT get_name(BSTR* p);
	HRESULT get_parent(IHTMLWindow2* p);
	HRESULT open(BSTR url, BSTR name, BSTR features, VARIANT_BOOL replace, IHTMLWindow2* pomWindowResult);
	HRESULT get_self(IHTMLWindow2* p);
	HRESULT get_top(IHTMLWindow2* p);
	HRESULT get_window(IHTMLWindow2* p);
	HRESULT navigate(BSTR url);
	HRESULT put_onfocus(VARIANT v);
	HRESULT get_onfocus(VARIANT* p);
	HRESULT put_onblur(VARIANT v);
	HRESULT get_onblur(VARIANT* p);
	HRESULT put_onload(VARIANT v);
	HRESULT get_onload(VARIANT* p);
	HRESULT put_onbeforeunload(VARIANT v);
	HRESULT get_onbeforeunload(VARIANT* p);
	HRESULT put_onunload(VARIANT v);
	HRESULT get_onunload(VARIANT* p);
	HRESULT put_onhelp(VARIANT v);
	HRESULT get_onhelp(VARIANT* p);
	HRESULT put_onerror(VARIANT v);
	HRESULT get_onerror(VARIANT* p);
	HRESULT put_onresize(VARIANT v);
	HRESULT get_onresize(VARIANT* p);
	HRESULT put_onscroll(VARIANT v);
	HRESULT get_onscroll(VARIANT* p);
	HRESULT get_document(IHTMLDocument2* p);
	HRESULT get_event(IHTMLEventObj* p);
	HRESULT get__newEnum(IUnknown* p);
	HRESULT showModalDialog(BSTR dialog, VARIANT* varArgIn, VARIANT* varOptions, VARIANT* varArgOut);
	HRESULT showHelp(BSTR helpURL, VARIANT helpArg, BSTR features/* = ""*/);
	HRESULT get_screen(IHTMLScreen* p);
	HRESULT get_Option(IHTMLOptionElementFactory* p);
	HRESULT focus();
	HRESULT get_closed(VARIANT_BOOL* p);
	HRESULT blur();
	HRESULT scroll(int x, int y);
	HRESULT get_clientInformation(IOmNavigator* p);
	HRESULT setInterval(BSTR expression, int msec, VARIANT* language, int* timerID);
	HRESULT clearInterval(int timerID);
	HRESULT put_offscreenBuffering(VARIANT v);
	HRESULT get_offscreenBuffering(VARIANT* p);
	HRESULT execScript(BSTR code, BSTR language, VARIANT* pvarRet);
	HRESULT toString(BSTR* String);
	HRESULT scrollBy(int x, int y);
	HRESULT scrollTo(int x, int y);
	HRESULT moveTo(int x, int y);
	HRESULT moveBy(int x, int y);
	HRESULT resizeTo(int x, int y);
	HRESULT resizeBy(int x, int y);
	HRESULT get_external(IDispatch* p);
}
alias IID_IHTMLWindow2 SID_SHTMLWindow;

//extern extern(C) const IID IID_IHTMLWindow3;
mixin DEFINE_IID!(IHTMLWindow3, "3050f4ae-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLWindow3 : IDispatch {
public extern(Windows):
	HRESULT get_screenLeft(int* p);
	HRESULT get_screenTop(int* p);
	HRESULT attachEvent(BSTR event, IDispatch pDisp, VARIANT_BOOL* pfResult);
	HRESULT detachEvent(BSTR event, IDispatch pDisp);
	HRESULT setTimeout(VARIANT* expression, int msec, VARIANT* language, int* timerID);
	HRESULT setInterval(VARIANT* expression, int msec, VARIANT* language, int* timerID);
	HRESULT print();
	HRESULT put_onbeforeprint(VARIANT v);
	HRESULT get_onbeforeprint(VARIANT* p);
	HRESULT put_onafterprint(VARIANT v);
	HRESULT get_onafterprint(VARIANT* p);
	HRESULT get_clipboardData(IHTMLDataTransfer* p);
	HRESULT showModelessDialog(BSTR url, VARIANT* varArgIn, VARIANT* options, IHTMLWindow2* pDialog);
}

//extern extern(C) const IID IID_IHTMLFrameBase;
mixin DEFINE_IID!(IHTMLFrameBase, "3050f311-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLFrameBase : IDispatch {
public extern(Windows):
	HRESULT put_src(BSTR v);
	HRESULT get_src(BSTR* p);
	HRESULT put_name(BSTR v);
	HRESULT get_name(BSTR* p);
	HRESULT put_border(VARIANT v);
	HRESULT get_border(VARIANT* p);
	HRESULT put_frameBorder(BSTR v);
	HRESULT get_frameBorder(BSTR* p);
	HRESULT put_frameSpacing(VARIANT v);
	HRESULT get_frameSpacing(VARIANT* p);
	HRESULT put_marginWidth(VARIANT v);
	HRESULT get_marginWidth(VARIANT* p);
	HRESULT put_marginHeight(VARIANT v);
	HRESULT get_marginHeight(VARIANT* p);
	HRESULT put_noResize(VARIANT_BOOL v);
	HRESULT get_noResize(VARIANT_BOOL* p);
	HRESULT put_scrolling(BSTR v);
	HRESULT get_scrolling(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLStorage;
mixin DEFINE_IID!(IHTMLStorage, "30510474-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLStorage : IDispatch {
public extern(Windows):
	HRESULT get_length(int* p);
	HRESULT get_remainingSpace(int* p);
	HRESULT key(int lIndex, BSTR* __MIDL__IHTMLStorage0000);
	HRESULT getItem(BSTR bstrKey, VARIANT* __MIDL__IHTMLStorage0001);
	HRESULT setItem(BSTR bstrKey, BSTR bstrValue);
	HRESULT removeItem(BSTR bstrKey);
	HRESULT clear();
}

//extern extern(C) const IID IID_IHTMLScreen;
mixin DEFINE_IID!(IHTMLScreen, "3050f35c-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLScreen : IDispatch {
public extern(Windows):
	HRESULT get_colorDepth(int* p);
	HRESULT put_bufferDepth(int v);
	HRESULT get_bufferDepth(int* p);
	HRESULT get_width(int* p);
	HRESULT get_height(int* p);
	HRESULT put_updateInterval(int v);
	HRESULT get_updateInterval(int* p);
	HRESULT get_availHeight(int* p);
	HRESULT get_availWidth(int* p);
	HRESULT get_fontSmoothingEnabled(VARIANT_BOOL* p);
}

//extern extern(C) const IID IID_IHTMLScreen2;
mixin DEFINE_IID!(IHTMLScreen2, "3050f84a-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLScreen2 : IDispatch {
public extern(Windows):
	HRESULT get_logicalXDPI(int* p);
	HRESULT get_logicalYDPI(int* p);
	HRESULT get_deviceXDPI(int* p);
	HRESULT get_deviceYDPI(int* p);
}

//extern extern(C) const IID IID_IHTMLScreen3;
mixin DEFINE_IID!(IHTMLScreen3, "305104a1-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLScreen3 : IDispatch {
public extern(Windows):
	HRESULT get_systemXDPI(int* p);
	HRESULT get_systemYDPI(int* p);
}

//extern extern(C) const IID IID_IHTMLWindow4;
mixin DEFINE_IID!(IHTMLWindow4, "3050f6cf-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLWindow4 : IDispatch {
public extern(Windows):
	HRESULT createPopup(VARIANT* varArgIn, IDispatch* ppPopup);
	HRESULT get_frameElement(IHTMLFrameBase* p);
}


//extern extern(C) const IID IID_IHTMLWindow5;
mixin DEFINE_IID!(IHTMLWindow5, "3051040e-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLWindow5 : IDispatch {
public extern(Windows):
	HRESULT put_XMLHttpRequest(VARIANT v);
	HRESULT get_XMLHttpRequest(VARIANT* p);
}

//extern extern(C) const IID IID_IHTMLWindow6;
mixin DEFINE_IID!(IHTMLWindow6, "30510453-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLWindow6 : IDispatch {
public extern(Windows):
	HRESULT put_XDomainRequest(VARIANT v);
	HRESULT get_XDomainRequest(VARIANT* p);
	HRESULT get_sessionStorage(IHTMLStorage* p);
	HRESULT get_localStorage(IHTMLStorage* p);
	HRESULT put_onhashchange(VARIANT v);
	HRESULT get_onhashchange(VARIANT* p);
	HRESULT get_maxConnectionsPerServer(int* p);
	HRESULT postMessage(BSTR msg, VARIANT targetOrigin);
	HRESULT toStaticHTML(BSTR bstrHTML, BSTR* pbstrStaticHTML);
	HRESULT put_onmessage(VARIANT v);
	HRESULT get_onmessage(VARIANT* p);
	HRESULT msWriteProfilerMark(BSTR bstrProfilerMarkName);
}

//extern extern(C) const CLSID CLSID_FramesCollection;
mixin DEFINE_GUID!("CLSID_FramesCollection", "3050f7f6-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTMLScreen;
mixin DEFINE_GUID!("DIID_DispHTMLScreen", "3050f591-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLScreen : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLScreen;
mixin DEFINE_GUID!("CLSID_HTMLScreen", "3050f35d-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTMLWindow2;
mixin DEFINE_GUID!("DIID_DispHTMLWindow2", "3050f55d-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLWindow2 : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLWindow2;
mixin DEFINE_GUID!("CLSID_HTMLWindow2", "D48A6EC6-6A4A-11cf-94A7-444553540000");

//extern extern(C) const IID DIID_DispHTMLWindowProxy;
mixin DEFINE_GUID!("DIID_DispHTMLWindowProxy", "3050f55e-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLWindowProxy : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLWindowProxy;
mixin DEFINE_GUID!("CLSID_HTMLWindowProxy", "3050f391-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLDocumentCompatibleInfo;
mixin DEFINE_IID!(IHTMLDocumentCompatibleInfo, "3051041a-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLDocumentCompatibleInfo : IDispatch {
public extern(Windows):
	HRESULT get_userAgent(BSTR* p);
	HRESULT get_version(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLDocumentCompatibleInfoCollection;
mixin DEFINE_IID!(IHTMLDocumentCompatibleInfoCollection, "30510418-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLDocumentCompatibleInfoCollection : IDispatch {
public extern(Windows):
	HRESULT get_length(int* p);
	HRESULT item(int index, IHTMLDocumentCompatibleInfo* compatibleInfo);
}

//extern extern(C) const IID DIID_DispHTMLDocumentCompatibleInfo;
mixin DEFINE_GUID!("DIID_DispHTMLDocumentCompatibleInfo", "3050f53e-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLDocumentCompatibleInfo : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLDocumentCompatibleInfo;
mixin DEFINE_GUID!("CLSID_HTMLDocumentCompatibleInfo", "3051041b-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTMLDocumentCompatibleInfoCollection;
mixin DEFINE_GUID!("DIID_DispHTMLDocumentCompatibleInfoCollection", "3050f53f-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLDocumentCompatibleInfoCollection : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLDocumentCompatibleInfoCollection;
mixin DEFINE_GUID!("CLSID_HTMLDocumentCompatibleInfoCollection", "30510419-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_HTMLDocumentEvents3;
mixin DEFINE_GUID!("DIID_HTMLDocumentEvents3", "3050f5a0-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLDocumentEvents3 : IDispatch {
}

//extern extern(C) const IID DIID_HTMLDocumentEvents2;
mixin DEFINE_GUID!("DIID_HTMLDocumentEvents2", "3050f613-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLDocumentEvents2 : IDispatch {
}

//extern extern(C) const IID DIID_HTMLDocumentEvents;
mixin DEFINE_GUID!("DIID_HTMLDocumentEvents", "3050f260-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLDocumentEvents : IDispatch {
}

//extern extern(C) const IID IID_IHTMLDocument3;
mixin DEFINE_IID!(IHTMLDocument3, "3050f485-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLDocument3 : IDispatch {
public extern(Windows):
	HRESULT releaseCapture();
	HRESULT recalc(VARIANT_BOOL fForce = 0);
	HRESULT createTextNode(BSTR text, IHTMLDOMNode* newTextNode);
	HRESULT get_documentElement(IHTMLElement* p);
	HRESULT get_uniqueID(BSTR* p);
	HRESULT attachEvent(BSTR event, IDispatch pDisp, VARIANT_BOOL* pfResult);
	HRESULT detachEvent(BSTR event, IDispatch pDisp);
	HRESULT put_onrowsdelete(VARIANT v);
	HRESULT get_onrowsdelete(VARIANT* p);
	HRESULT put_onrowsinserted(VARIANT v);
	HRESULT get_onrowsinserted(VARIANT* p);
	HRESULT put_oncellchange(VARIANT v);
	HRESULT get_oncellchange(VARIANT* p);
	HRESULT put_ondatasetchanged(VARIANT v);
	HRESULT get_ondatasetchanged(VARIANT* p);
	HRESULT put_ondataavailable(VARIANT v);
	HRESULT get_ondataavailable(VARIANT* p);
	HRESULT put_ondatasetcomplete(VARIANT v);
	HRESULT get_ondatasetcomplete(VARIANT* p);
	HRESULT put_onpropertychange(VARIANT v);
	HRESULT get_onpropertychange(VARIANT* p);
	HRESULT put_dir(BSTR v);
	HRESULT get_dir(BSTR* p);
	HRESULT put_oncontextmenu(VARIANT v);
	HRESULT get_oncontextmenu(VARIANT* p);
	HRESULT put_onstop(VARIANT v);
	HRESULT get_onstop(VARIANT* p);
	HRESULT createDocumentFragment(IHTMLDocument2* pNewDoc);
	HRESULT get_parentDocument(IHTMLDocument2* p);
	HRESULT put_enableDownload(VARIANT_BOOL v);
	HRESULT get_enableDownload(VARIANT_BOOL* p);
	HRESULT put_baseUrl(BSTR v);
	HRESULT get_baseUrl(BSTR* p);
	HRESULT get_childNodes(IDispatch* p);
	HRESULT put_inheritStyleSheets(VARIANT_BOOL v);
	HRESULT get_inheritStyleSheets(VARIANT_BOOL* p);
	HRESULT put_onbeforeeditfocus(VARIANT v);
	HRESULT get_onbeforeeditfocus(VARIANT* p);
	HRESULT getElementsByName(BSTR v, IHTMLElementCollection* pelColl);
	HRESULT getElementById(BSTR v, IHTMLElement* pel);
	HRESULT getElementsByTagName(BSTR v, IHTMLElementCollection* pelColl);
}

//extern extern(C) const IID IID_IHTMLDocument4;
mixin DEFINE_IID!(IHTMLDocument4, "3050f69a-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLDocument4 : IDispatch {
public extern(Windows):
	HRESULT focus();
	HRESULT hasFocus(VARIANT_BOOL* pfFocus);
	HRESULT put_onselectionchange(VARIANT v);
	HRESULT get_onselectionchange(VARIANT* p);
	HRESULT get_namespaces(IDispatch* p);
	HRESULT createDocumentFromUrl(BSTR bstrUrl, BSTR bstrOptions, IHTMLDocument2* newDoc);
	HRESULT put_media(BSTR v);
	HRESULT get_media(BSTR* p);
	HRESULT createEventObject(VARIANT* pvarEventObject, IHTMLEventObj* ppEventObj);
	HRESULT fireEvent(BSTR bstrEventName, VARIANT* pvarEventObject, VARIANT_BOOL* pfCancelled);
	HRESULT createRenderStyle(BSTR v, IHTMLRenderStyle* ppIHTMLRenderStyle);
	HRESULT put_oncontrolselect(VARIANT v);
	HRESULT get_oncontrolselect(VARIANT* p);
	HRESULT get_URLUnencoded(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLDocument5;
mixin DEFINE_IID!(IHTMLDocument5, "3050f80c-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLDocument5 : IDispatch {
public extern(Windows):
	HRESULT put_onmousewheel(VARIANT v);
	HRESULT get_onmousewheel(VARIANT* p);
	HRESULT get_doctype(IHTMLDOMNode* p);
	HRESULT get_implementation(IHTMLDOMImplementation* pp);
	HRESULT createAttribute(BSTR bstrattrName, IHTMLDOMAttribute* ppattribute);
	HRESULT createComment(BSTR bstrdata, IHTMLDOMNode* ppRetNode);
	HRESULT put_onfocusin(VARIANT v);
	HRESULT get_onfocusin(VARIANT* p);
	HRESULT put_onfocusout(VARIANT v);
	HRESULT get_onfocusout(VARIANT* p);
	HRESULT put_onactivate(VARIANT v);
	HRESULT get_onactivate(VARIANT* p);
	HRESULT put_ondeactivate(VARIANT v);
	HRESULT get_ondeactivate(VARIANT* p);
	HRESULT put_onbeforeactivate(VARIANT v);
	HRESULT get_onbeforeactivate(VARIANT* p);
	HRESULT put_onbeforedeactivate(VARIANT v);
	HRESULT get_onbeforedeactivate(VARIANT* p);
	HRESULT get_compatMode(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLDocument6;
mixin DEFINE_IID!(IHTMLDocument6, "30510417-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLDocument6 : IDispatch {
public extern(Windows):
	HRESULT get_compatible(IHTMLDocumentCompatibleInfoCollection* p);
	HRESULT get_documentMode(VARIANT* p);
	HRESULT put_onstorage(VARIANT v);
	HRESULT get_onstorage(VARIANT* p);
	HRESULT put_onstoragecommit(VARIANT v);
	HRESULT get_onstoragecommit(VARIANT* p);
	HRESULT getElementById(BSTR bstrId, IHTMLElement2* ppRetElement);
	HRESULT updateSettings();
}

//extern extern(C) const IID IID_IDocumentSelector;
mixin DEFINE_IID!(IDocumentSelector, "30510462-98b5-11cf-bb82-00aa00bdce0b");
interface IDocumentSelector : IDispatch {
public extern(Windows):
	HRESULT querySelector(BSTR v, IHTMLElement* pel);
	HRESULT querySelectorAll(BSTR v, IHTMLDOMChildrenCollection* pel);
}

//extern extern(C) const IID DIID_DispHTMLDocument;
mixin DEFINE_GUID!("DIID_DispHTMLDocument", "3050f55f-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLDocument : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLDocument;
mixin DEFINE_GUID!("CLSID_HTMLDocument", "25336920-03F9-11cf-8FD0-00AA00686F13");

//extern extern(C) const IID DIID_DWebBridgeEvents;
mixin DEFINE_GUID!("DIID_DWebBridgeEvents", "A6D897FF-0A95-11d1-B0BA-006008166E11");
interface DWebBridgeEvents : IDispatch {
}

//extern extern(C) const IID IID_IWebBridge;
mixin DEFINE_IID!(IWebBridge, "AE24FDAD-03C6-11D1-8B76-0080C744F389");
interface IWebBridge : IDispatch {
public extern(Windows):
	HRESULT put_URL(BSTR v);
	HRESULT get_URL(BSTR* p);
	HRESULT put_Scrollbar(VARIANT_BOOL v);
	HRESULT get_Scrollbar(VARIANT_BOOL* p);
	HRESULT put_embed(VARIANT_BOOL v);
	HRESULT get_embed(VARIANT_BOOL* p);
	HRESULT get_event(IDispatch* p);
	HRESULT get_readyState(int* p);
	HRESULT AboutBox();
}

//extern extern(C) const IID IID_IWBScriptControl;
mixin DEFINE_IID!(IWBScriptControl, "A5170870-0CF8-11D1-8B91-0080C744F389");
interface IWBScriptControl : IDispatch {
public extern(Windows):
	HRESULT raiseEvent(BSTR name, VARIANT eventData);
	HRESULT bubbleEvent();
	HRESULT setContextMenu(VARIANT menuItemPairs);
	HRESULT put_selectableContent(VARIANT_BOOL v);
	HRESULT get_selectableContent(VARIANT_BOOL* p);
	HRESULT get_frozen(VARIANT_BOOL* p);
	HRESULT put_scrollbar(VARIANT_BOOL v);
	HRESULT get_scrollbar(VARIANT_BOOL* p);
	HRESULT get_version(BSTR* p);
	HRESULT get_visibility(VARIANT_BOOL* p);
	HRESULT put_onvisibilitychange(VARIANT v);
	HRESULT get_onvisibilitychange(VARIANT* p);
}

//extern extern(C) const CLSID CLSID_Scriptlet;
mixin DEFINE_GUID!("CLSID_Scriptlet", "AE24FDAE-03C6-11D1-8B76-0080C744F389");

//extern extern(C) const IID IID_IHTMLEmbedElement;
mixin DEFINE_IID!(IHTMLEmbedElement, "3050f25f-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLEmbedElement : IDispatch {
public extern(Windows):
	HRESULT put_hidden(BSTR v);
	HRESULT get_hidden(BSTR* p);
	HRESULT get_palette(BSTR* p);
	HRESULT get_pluginspage(BSTR* p);
	HRESULT put_src(BSTR v);
	HRESULT get_src(BSTR* p);
	HRESULT put_units(BSTR v);
	HRESULT get_units(BSTR* p);
	HRESULT put_name(BSTR v);
	HRESULT get_name(BSTR* p);
	HRESULT put_width(VARIANT v);
	HRESULT get_width(VARIANT* p);
	HRESULT put_height(VARIANT v);
	HRESULT get_height(VARIANT* p);
}

//extern extern(C) const IID IID_IHTMLEmbedElement2;
mixin DEFINE_IID!(IHTMLEmbedElement2, "30510493-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLEmbedElement2 : IDispatch {
public extern(Windows):
	HRESULT put_src(BSTR v);
	HRESULT get_src(BSTR* p);
	HRESULT get_pluginspage(BSTR* p);
}

//extern extern(C) const IID DIID_DispHTMLEmbed;
mixin DEFINE_GUID!("DIID_DispHTMLEmbed", "3050f52e-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLEmbed : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLEmbed;
mixin DEFINE_GUID!("CLSID_HTMLEmbed", "3050f25d-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_HTMLMapEvents2;
mixin DEFINE_GUID!("DIID_HTMLMapEvents2", "3050f61e-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLMapEvents2 : IDispatch {
}

//extern extern(C) const IID DIID_HTMLMapEvents;
mixin DEFINE_GUID!("DIID_HTMLMapEvents", "3050f3ba-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLMapEvents : IDispatch {
}

//extern extern(C) const IID IID_IHTMLAreasCollection;
mixin DEFINE_IID!(IHTMLAreasCollection, "3050f383-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLAreasCollection : IDispatch {
public extern(Windows):
	HRESULT put_length(int v);
	HRESULT get_length(int* p);
	HRESULT get__newEnum(IUnknown* p);
	HRESULT item(VARIANT name, VARIANT index, IDispatch* pdisp);
	HRESULT tags(VARIANT tagName, IDispatch* pdisp);
	HRESULT add(IHTMLElement* element, VARIANT before);
	HRESULT remove(int index = -1);
}

//extern extern(C) const IID IID_IHTMLAreasCollection2;
mixin DEFINE_IID!(IHTMLAreasCollection2, "3050f5ec-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLAreasCollection2 : IDispatch {
public extern(Windows):
	HRESULT urns(VARIANT urn, IDispatch* pdisp);
}

//extern extern(C) const IID IID_IHTMLAreasCollection3;
mixin DEFINE_IID!(IHTMLAreasCollection3, "3050f837-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLAreasCollection3 : IDispatch {
public extern(Windows):
	HRESULT namedItem(BSTR name, IDispatch* pdisp);
}

//extern extern(C) const IID IID_IHTMLAreasCollection4;
mixin DEFINE_IID!(IHTMLAreasCollection4, "30510492-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLAreasCollection4 : IDispatch {
public extern(Windows):
	HRESULT get_length(int* p);
	HRESULT item(int index, IHTMLElement2* pNode);
	HRESULT namedItem(BSTR name, IHTMLElement2* pNode);
}

//extern extern(C) const IID IID_IHTMLMapElement;
mixin DEFINE_IID!(IHTMLMapElement, "3050f266-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLMapElement : IDispatch {
public extern(Windows):
	HRESULT get_areas(IHTMLAreasCollection* p);
	HRESULT put_name(BSTR v);
	HRESULT get_name(BSTR* p);
}

//extern extern(C) const IID DIID_DispHTMLAreasCollection;
mixin DEFINE_GUID!("DIID_DispHTMLAreasCollection", "3050f56a-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLAreasCollection : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLAreasCollection;
mixin DEFINE_GUID!("CLSID_HTMLAreasCollection", "3050f4ca-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTMLMapElement;
mixin DEFINE_GUID!("DIID_DispHTMLMapElement", "3050f526-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLMapElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLMapElement;
mixin DEFINE_GUID!("CLSID_HTMLMapElement", "3050f271-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_HTMLAreaEvents2;
mixin DEFINE_GUID!("DIID_HTMLAreaEvents2", "3050f611-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLAreaEvents2 : IDispatch {
}

//extern extern(C) const IID DIID_HTMLAreaEvents;
mixin DEFINE_GUID!("DIID_HTMLAreaEvents", "3050f366-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLAreaEvents : IDispatch {
}

//extern extern(C) const IID IID_IHTMLAreaElement;
mixin DEFINE_IID!(IHTMLAreaElement, "3050f265-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLAreaElement : IDispatch {
public extern(Windows):
	HRESULT put_shape(BSTR v);
	HRESULT get_shape(BSTR* p);
	HRESULT put_coords(BSTR v);
	HRESULT get_coords(BSTR* p);
	HRESULT put_href(BSTR v);
	HRESULT get_href(BSTR* p);
	HRESULT put_target(BSTR v);
	HRESULT get_target(BSTR* p);
	HRESULT put_alt(BSTR v);
	HRESULT get_alt(BSTR* p);
	HRESULT put_noHref(VARIANT_BOOL v);
	HRESULT get_noHref(VARIANT_BOOL* p);
	HRESULT put_host(BSTR v);
	HRESULT get_host(BSTR* p);
	HRESULT put_hostname(BSTR v);
	HRESULT get_hostname(BSTR* p);
	HRESULT put_pathname(BSTR v);
	HRESULT get_pathname(BSTR* p);
	HRESULT put_port(BSTR v);
	HRESULT get_port(BSTR* p);
	HRESULT put_protocol(BSTR v);
	HRESULT get_protocol(BSTR* p);
	HRESULT put_search(BSTR v);
	HRESULT get_search(BSTR* p);
	HRESULT put_hash(BSTR v);
	HRESULT get_hash(BSTR* p);
	HRESULT put_onblur(VARIANT v);
	HRESULT get_onblur(VARIANT* p);
	HRESULT put_onfocus(VARIANT v);
	HRESULT get_onfocus(VARIANT* p);
	HRESULT put_tabIndex(short v);
	HRESULT get_tabIndex(short* p);
	HRESULT focus();
	HRESULT blur();
}


//extern extern(C) const IID IID_IHTMLAreaElement2;
mixin DEFINE_IID!(IHTMLAreaElement2, "3051041f-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLAreaElement2 : IDispatch {
public extern(Windows):
	HRESULT put_shape(BSTR v);
	HRESULT get_shape(BSTR* p);
	HRESULT put_coords(BSTR v);
	HRESULT get_coords(BSTR* p);
	HRESULT put_href(BSTR v);
	HRESULT get_href(BSTR* p);
}

//extern extern(C) const IID DIID_DispHTMLAreaElement;
mixin DEFINE_GUID!("DIID_DispHTMLAreaElement", "3050f503-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLAreaElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLAreaElement;
mixin DEFINE_GUID!("CLSID_HTMLAreaElement", "3050f283-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLTableCaption;
mixin DEFINE_IID!(IHTMLTableCaption, "3050f2eb-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLTableCaption : IDispatch {
public extern(Windows):
	HRESULT put_align(BSTR v);
	HRESULT get_align(BSTR* p);
	HRESULT put_vAlign(BSTR v);
	HRESULT get_vAlign(BSTR* p);
}

//extern extern(C) const IID DIID_DispHTMLTableCaption;
mixin DEFINE_GUID!("DIID_DispHTMLTableCaption", "3050f508-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLTableCaption : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLTableCaption;
mixin DEFINE_GUID!("CLSID_HTMLTableCaption", "3050f2ec-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLCommentElement;
mixin DEFINE_IID!(IHTMLCommentElement, "3050f20c-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLCommentElement : IDispatch {
public extern(Windows):
	HRESULT put_text(BSTR v);
	HRESULT get_text(BSTR* p);
	HRESULT put_atomic(int v);
	HRESULT get_atomic(int* p);
}

//extern extern(C) const IID IID_IHTMLCommentElement2;
mixin DEFINE_IID!(IHTMLCommentElement2, "3050f813-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLCommentElement2 : IDispatch {
public extern(Windows):
	HRESULT put_data(BSTR v);
	HRESULT get_data(BSTR* p);
	HRESULT get_length(int* p);
	HRESULT substringData(int offset, int Count, BSTR* pbstrsubString);
	HRESULT appendData(BSTR bstrstring);
	HRESULT insertData(int offset, BSTR bstrstring);
	HRESULT deleteData(int offset, int Count);
	HRESULT replaceData(int offset, int Count, BSTR bstrstring);
}

//extern extern(C) const IID DIID_DispHTMLCommentElement;
mixin DEFINE_GUID!("DIID_DispHTMLCommentElement", "3050f50a-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLCommentElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLCommentElement;
mixin DEFINE_GUID!("CLSID_HTMLCommentElement", "3050f317-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLPhraseElement;
mixin DEFINE_IID!(IHTMLPhraseElement, "3050f20a-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLPhraseElement : IDispatch {
public extern(Windows):
}

//extern extern(C) const IID IID_IHTMLPhraseElement2;
mixin DEFINE_IID!(IHTMLPhraseElement2, "3050f824-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLPhraseElement2 : IDispatch {
public extern(Windows):
	HRESULT put_cite(BSTR v);
	HRESULT get_cite(BSTR* p);
	HRESULT put_dateTime(BSTR v);
	HRESULT get_dateTime(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLPhraseElement3;
mixin DEFINE_IID!(IHTMLPhraseElement3, "3051043d-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLPhraseElement3 : IDispatch {
public extern(Windows):
	HRESULT put_cite(BSTR v);
	HRESULT get_cite(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLSpanElement;
mixin DEFINE_IID!(IHTMLSpanElement, "3050f3f3-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLSpanElement : IDispatch {
public extern(Windows):
}

//extern extern(C) const IID DIID_DispHTMLPhraseElement;
mixin DEFINE_GUID!("DIID_DispHTMLPhraseElement", "3050f52d-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLPhraseElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLPhraseElement;
mixin DEFINE_GUID!("CLSID_HTMLPhraseElement", "3050f26e-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTMLSpanElement;
mixin DEFINE_GUID!("DIID_DispHTMLSpanElement", "3050f548-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLSpanElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLSpanElement;
mixin DEFINE_GUID!("CLSID_HTMLSpanElement", "3050f3f5-98b4-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_HTMLTableEvents2;
mixin DEFINE_GUID!("DIID_HTMLTableEvents2", "3050f623-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLTableEvents2 : IDispatch {
}

//extern extern(C) const IID DIID_HTMLTableEvents;
mixin DEFINE_GUID!("DIID_HTMLTableEvents", "3050f407-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLTableEvents : IDispatch {
}

//extern extern(C) const IID IID_IHTMLTableSection;
mixin DEFINE_IID!(IHTMLTableSection, "3050f23b-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLTableSection : IDispatch {
public extern(Windows):
	HRESULT put_align(BSTR v);
	HRESULT get_align(BSTR* p);
	HRESULT put_vAlign(BSTR v);
	HRESULT get_vAlign(BSTR* p);
	HRESULT put_bgColor(VARIANT v);
	HRESULT get_bgColor(VARIANT* p);
	HRESULT get_rows(IHTMLElementCollection* p);
	HRESULT insertRow(int index, IDispatch* row);
	HRESULT deleteRow(int index = -1);
}

//extern extern(C) const IID IID_IHTMLTable;
mixin DEFINE_IID!(IHTMLTable, "3050f21e-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLTable : IDispatch {
public extern(Windows):
	HRESULT put_cols(int v);
	HRESULT get_cols(int* p);
	HRESULT put_border(VARIANT v);
	HRESULT get_border(VARIANT* p);
	HRESULT put_frame(BSTR v);
	HRESULT get_frame(BSTR* p);
	HRESULT put_rules(BSTR v);
	HRESULT get_rules(BSTR* p);
	HRESULT put_cellSpacing(VARIANT v);
	HRESULT get_cellSpacing(VARIANT* p);
	HRESULT put_cellPadding(VARIANT v);
	HRESULT get_cellPadding(VARIANT* p);
	HRESULT put_background(BSTR v);
	HRESULT get_background(BSTR* p);
	HRESULT put_bgColor(VARIANT v);
	HRESULT get_bgColor(VARIANT* p);
	HRESULT put_borderColor(VARIANT v);
	HRESULT get_borderColor(VARIANT* p);
	HRESULT put_borderColorLight(VARIANT v);
	HRESULT get_borderColorLight(VARIANT* p);
	HRESULT put_borderColorDark(VARIANT v);
	HRESULT get_borderColorDark(VARIANT* p);
	HRESULT put_align(BSTR v);
	HRESULT get_align(BSTR* p);
	HRESULT refresh();
	HRESULT get_rows(IHTMLElementCollection* p);
	HRESULT put_width(VARIANT v);
	HRESULT get_width(VARIANT* p);
	HRESULT put_height(VARIANT v);
	HRESULT get_height(VARIANT* p);
	HRESULT put_dataPageSize(int v);
	HRESULT get_dataPageSize(int* p);
	HRESULT nextPage();
	HRESULT previousPage();
	HRESULT get_tHead(IHTMLTableSection* p);
	HRESULT get_tFoot(IHTMLTableSection* p);
	HRESULT get_tBodies(IHTMLElementCollection* p);
	HRESULT get_caption(IHTMLTableCaption* p);
	HRESULT createTHead(IDispatch* head);
	HRESULT deleteTHead();
	HRESULT createTFoot(IDispatch* foot);
	HRESULT deleteTFoot();
	HRESULT createCaption(IHTMLTableCaption* caption);
	HRESULT deleteCaption();
	HRESULT insertRow(int index, IDispatch* row);
	HRESULT deleteRow(int index = -1);
	HRESULT get_readyState(BSTR* p);
	HRESULT put_onreadystatechange(VARIANT v);
	HRESULT get_onreadystatechange(VARIANT* p);
}

//extern extern(C) const IID IID_IHTMLTable2;
mixin DEFINE_IID!(IHTMLTable2, "3050f4ad-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLTable2 : IDispatch {
public extern(Windows):
	HRESULT firstPage();
	HRESULT lastPage();
	HRESULT get_cells(IHTMLElementCollection* p);
	HRESULT moveRow(int indexFrom, int indexTo, IDispatch* row);
}

//extern extern(C) const IID IID_IHTMLTable3;
mixin DEFINE_IID!(IHTMLTable3, "3050f829-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLTable3 : IDispatch {
public extern(Windows):
	HRESULT put_summary(BSTR v);
	HRESULT get_summary(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLTableCol;
mixin DEFINE_IID!(IHTMLTableCol, "3050f23a-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLTableCol : IDispatch {
public extern(Windows):
	HRESULT put_span(int v);
	HRESULT get_span(int* p);
	HRESULT put_width(VARIANT v);
	HRESULT get_width(VARIANT* p);
	HRESULT put_align(BSTR v);
	HRESULT get_align(BSTR* p);
	HRESULT put_vAlign(BSTR v);
	HRESULT get_vAlign(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLTableCol2;
mixin DEFINE_IID!(IHTMLTableCol2, "3050f82a-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLTableCol2 : IDispatch {
public extern(Windows):
	HRESULT put_ch(BSTR v);
	HRESULT get_ch(BSTR* p);
	HRESULT put_chOff(BSTR v);
	HRESULT get_chOff(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLTableSection2;
mixin DEFINE_IID!(IHTMLTableSection2, "3050f5c7-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLTableSection2 : IDispatch {
public extern(Windows):
	HRESULT moveRow(int indexFrom, int indexTo, IDispatch* row);
}

//extern extern(C) const IID IID_IHTMLTableSection3;
mixin DEFINE_IID!(IHTMLTableSection3, "3050f82b-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLTableSection3 : IDispatch {
public extern(Windows):
	HRESULT put_ch(BSTR v);
	HRESULT get_ch(BSTR* p);
	HRESULT put_chOff(BSTR v);
	HRESULT get_chOff(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLTableRow;
mixin DEFINE_IID!(IHTMLTableRow, "3050f23c-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLTableRow : IDispatch {
public extern(Windows):
	HRESULT put_align(BSTR v);
	HRESULT get_align(BSTR* p);
	HRESULT put_vAlign(BSTR v);
	HRESULT get_vAlign(BSTR* p);
	HRESULT put_bgColor(VARIANT v);
	HRESULT get_bgColor(VARIANT* p);
	HRESULT put_borderColor(VARIANT v);
	HRESULT get_borderColor(VARIANT* p);
	HRESULT put_borderColorLight(VARIANT v);
	HRESULT get_borderColorLight(VARIANT* p);
	HRESULT put_borderColorDark(VARIANT v);
	HRESULT get_borderColorDark(VARIANT* p);
	HRESULT get_rowIndex(int* p);
	HRESULT get_sectionRowIndex(int* p);
	HRESULT get_cells(IHTMLElementCollection* p);
	HRESULT insertCell(int index, IDispatch* row);
	HRESULT deleteCell(int index = -1);
}

//extern extern(C) const IID IID_IHTMLTableRow2;
mixin DEFINE_IID!(IHTMLTableRow2, "3050f4a1-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLTableRow2 : IDispatch {
public extern(Windows):
	HRESULT put_height(VARIANT v);
	HRESULT get_height(VARIANT* p);
}

//extern extern(C) const IID IID_IHTMLTableRow3;
mixin DEFINE_IID!(IHTMLTableRow3, "3050f82c-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLTableRow3 : IDispatch {
public extern(Windows):
	HRESULT put_ch(BSTR v);
	HRESULT get_ch(BSTR* p);
	HRESULT put_chOff(BSTR v);
	HRESULT get_chOff(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLTableRowMetrics;
mixin DEFINE_IID!(IHTMLTableRowMetrics, "3050f413-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLTableRowMetrics : IDispatch {
public extern(Windows):
	HRESULT get_clientHeight(int* p);
	HRESULT get_clientWidth(int* p);
	HRESULT get_clientTop(int* p);
	HRESULT get_clientLeft(int* p);
}

//extern extern(C) const IID IID_IHTMLTableCell;
mixin DEFINE_IID!(IHTMLTableCell, "3050f23d-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLTableCell : IDispatch {
public extern(Windows):
	HRESULT put_rowSpan(int v);
	HRESULT get_rowSpan(int* p);
	HRESULT put_colSpan(int v);
	HRESULT get_colSpan(int* p);
	HRESULT put_align(BSTR v);
	HRESULT get_align(BSTR* p);
	HRESULT put_vAlign(BSTR v);
	HRESULT get_vAlign(BSTR* p);
	HRESULT put_bgColor(VARIANT v);
	HRESULT get_bgColor(VARIANT* p);
	HRESULT put_noWrap(VARIANT_BOOL v);
	HRESULT get_noWrap(VARIANT_BOOL* p);
	HRESULT put_background(BSTR v);
	HRESULT get_background(BSTR* p);
	HRESULT put_borderColor(VARIANT v);
	HRESULT get_borderColor(VARIANT* p);
	HRESULT put_borderColorLight(VARIANT v);
	HRESULT get_borderColorLight(VARIANT* p);
	HRESULT put_borderColorDark(VARIANT v);
	HRESULT get_borderColorDark(VARIANT* p);
	HRESULT put_width(VARIANT v);
	HRESULT get_width(VARIANT* p);
	HRESULT put_height(VARIANT v);
	HRESULT get_height(VARIANT* p);
	HRESULT get_cellIndex(int* p);
}

//extern extern(C) const IID IID_IHTMLTableCell2;
mixin DEFINE_IID!(IHTMLTableCell2, "3050f82d-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLTableCell2 : IDispatch {
public extern(Windows):
	HRESULT put_abbr(BSTR v);
	HRESULT get_abbr(BSTR* p);
	HRESULT put_axis(BSTR v);
	HRESULT get_axis(BSTR* p);
	HRESULT put_ch(BSTR v);
	HRESULT get_ch(BSTR* p);
	HRESULT put_chOff(BSTR v);
	HRESULT get_chOff(BSTR* p);
	HRESULT put_headers(BSTR v);
	HRESULT get_headers(BSTR* p);
	HRESULT put_scope(BSTR v);
	HRESULT get_scope(BSTR* p);
}

//extern extern(C) const IID DIID_DispHTMLTable;
mixin DEFINE_GUID!("DIID_DispHTMLTable", "3050f532-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLTable : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLTable;
mixin DEFINE_GUID!("CLSID_HTMLTable", "3050f26b-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTMLTableCol;
mixin DEFINE_GUID!("DIID_DispHTMLTableCol", "3050f533-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLTableCol : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLTableCol;
mixin DEFINE_GUID!("CLSID_HTMLTableCol", "3050f26c-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTMLTableSection;
mixin DEFINE_GUID!("DIID_DispHTMLTableSection", "3050f534-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLTableSection : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLTableSection;
mixin DEFINE_GUID!("CLSID_HTMLTableSection", "3050f2e9-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTMLTableRow;
mixin DEFINE_GUID!("DIID_DispHTMLTableRow", "3050f535-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLTableRow : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLTableRow;
mixin DEFINE_GUID!("CLSID_HTMLTableRow", "3050f26d-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTMLTableCell;
mixin DEFINE_GUID!("DIID_DispHTMLTableCell", "3050f536-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLTableCell : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLTableCell;
mixin DEFINE_GUID!("CLSID_HTMLTableCell", "3050f246-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_HTMLScriptEvents2;
mixin DEFINE_GUID!("DIID_HTMLScriptEvents2", "3050f621-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLScriptEvents2 : IDispatch {
}

//extern extern(C) const IID DIID_HTMLScriptEvents;
mixin DEFINE_GUID!("DIID_HTMLScriptEvents", "3050f3e2-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLScriptEvents : IDispatch {
}

//extern extern(C) const IID IID_IHTMLScriptElement;
mixin DEFINE_IID!(IHTMLScriptElement, "3050f28b-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLScriptElement : IDispatch {
public extern(Windows):
	HRESULT put_src(BSTR v);
	HRESULT get_src(BSTR* p);
	HRESULT put_htmlFor(BSTR v);
	HRESULT get_htmlFor(BSTR* p);
	HRESULT put_event(BSTR v);
	HRESULT get_event(BSTR* p);
	HRESULT put_text(BSTR v);
	HRESULT get_text(BSTR* p);
	HRESULT put_defer(VARIANT_BOOL v);
	HRESULT get_defer(VARIANT_BOOL* p);
	HRESULT get_readyState(BSTR* p);
	HRESULT put_onerror(VARIANT v);
	HRESULT get_onerror(VARIANT* p);
	HRESULT put_type(BSTR v);
	HRESULT get_type(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLScriptElement2;
mixin DEFINE_IID!(IHTMLScriptElement2, "3050f828-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLScriptElement2 : IDispatch {
public extern(Windows):
	HRESULT put_charset(BSTR v);
	HRESULT get_charset(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLScriptElement3;
mixin DEFINE_IID!(IHTMLScriptElement3, "30510447-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLScriptElement3 : IDispatch {
public extern(Windows):
	HRESULT put_src(BSTR v);
	HRESULT get_src(BSTR* p);
}

//extern extern(C) const IID DIID_DispHTMLScriptElement;
mixin DEFINE_GUID!("DIID_DispHTMLScriptElement", "3050f530-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLScriptElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLScriptElement;
mixin DEFINE_GUID!("CLSID_HTMLScriptElement", "3050f28c-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLNoShowElement;
mixin DEFINE_IID!(IHTMLNoShowElement, "3050f38a-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLNoShowElement : IDispatch {
public extern(Windows):
}

//extern extern(C) const IID DIID_DispHTMLNoShowElement;
mixin DEFINE_GUID!("DIID_DispHTMLNoShowElement", "3050f528-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLNoShowElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLNoShowElement;
mixin DEFINE_GUID!("CLSID_HTMLNoShowElement", "3050f38b-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_HTMLObjectElementEvents2;
mixin DEFINE_GUID!("DIID_HTMLObjectElementEvents2", "3050f620-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLObjectElementEvents2 : IDispatch {
}

//extern extern(C) const IID DIID_HTMLObjectElementEvents;
mixin DEFINE_GUID!("DIID_HTMLObjectElementEvents", "3050f3c4-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLObjectElementEvents : IDispatch {
}

//extern extern(C) const IID IID_IHTMLObjectElement;
mixin DEFINE_IID!(IHTMLObjectElement, "3050f24f-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLObjectElement : IDispatch {
public extern(Windows):
	HRESULT get_object(IDispatch* p);
	HRESULT get_classid(BSTR* p);
	HRESULT get_data(BSTR* p);
	HRESULT putref_recordset(IDispatch v);
	HRESULT get_recordset(IDispatch* p);
	HRESULT put_align(BSTR v);
	HRESULT get_align(BSTR* p);
	HRESULT put_name(BSTR v);
	HRESULT get_name(BSTR* p);
	HRESULT put_codeBase(BSTR v);
	HRESULT get_codeBase(BSTR* p);
	HRESULT put_codeType(BSTR v);
	HRESULT get_codeType(BSTR* p);
	HRESULT put_code(BSTR v);
	HRESULT get_code(BSTR* p);
	HRESULT get_BaseHref(BSTR* p);
	HRESULT put_type(BSTR v);
	HRESULT get_type(BSTR* p);
	HRESULT get_form(IHTMLFormElement* p);
	HRESULT put_width(VARIANT v);
	HRESULT get_width(VARIANT* p);
	HRESULT put_height(VARIANT v);
	HRESULT get_height(VARIANT* p);
	HRESULT get_readyState(int* p);
	HRESULT put_onreadystatechange(VARIANT v);
	HRESULT get_onreadystatechange(VARIANT* p);
	HRESULT put_onerror(VARIANT v);
	HRESULT get_onerror(VARIANT* p);
	HRESULT put_altHtml(BSTR v);
	HRESULT get_altHtml(BSTR* p);
	HRESULT put_vspace(int v);
	HRESULT get_vspace(int* p);
	HRESULT put_hspace(int v);
	HRESULT get_hspace(int* p);
}

//extern extern(C) const IID IID_IHTMLObjectElement2;
mixin DEFINE_IID!(IHTMLObjectElement2, "3050f4cd-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLObjectElement2 : IDispatch {
public extern(Windows):
	HRESULT namedRecordset(BSTR dataMember, VARIANT* hierarchy, IDispatch* ppRecordset);
	HRESULT put_classid(BSTR v);
	HRESULT get_classid(BSTR* p);
	HRESULT put_data(BSTR v);
	HRESULT get_data(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLObjectElement3;
mixin DEFINE_IID!(IHTMLObjectElement3, "3050f827-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLObjectElement3 : IDispatch {
public extern(Windows):
	HRESULT put_archive(BSTR v);
	HRESULT get_archive(BSTR* p);
	HRESULT put_alt(BSTR v);
	HRESULT get_alt(BSTR* p);
	HRESULT put_declare(VARIANT_BOOL v);
	HRESULT get_declare(VARIANT_BOOL* p);
	HRESULT put_standby(BSTR v);
	HRESULT get_standby(BSTR* p);
	HRESULT put_border(VARIANT v);
	HRESULT get_border(VARIANT* p);
	HRESULT put_useMap(BSTR v);
	HRESULT get_useMap(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLObjectElement4;
mixin DEFINE_IID!(IHTMLObjectElement4, "3051043e-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLObjectElement4 : IDispatch {
public extern(Windows):
	HRESULT get_contentDocument(IDispatch* p);
	HRESULT put_codeBase(BSTR v);
	HRESULT get_codeBase(BSTR* p);
	HRESULT put_data(BSTR v);
	HRESULT get_data(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLParamElement;
mixin DEFINE_IID!(IHTMLParamElement, "3050f83d-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLParamElement : IDispatch {
public extern(Windows):
	HRESULT put_name(BSTR v);
	HRESULT get_name(BSTR* p);
	HRESULT put_value(BSTR v);
	HRESULT get_value(BSTR* p);
	HRESULT put_type(BSTR v);
	HRESULT get_type(BSTR* p);
	HRESULT put_valueType(BSTR v);
	HRESULT get_valueType(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLParamElement2;
mixin DEFINE_IID!(IHTMLParamElement2, "30510444-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLParamElement2 : IDispatch {
public extern(Windows):
	HRESULT put_name(BSTR v);
	HRESULT get_name(BSTR* p);
	HRESULT put_type(BSTR v);
	HRESULT get_type(BSTR* p);
	HRESULT put_value(BSTR v);
	HRESULT get_value(BSTR* p);
	HRESULT put_valueType(BSTR v);
	HRESULT get_valueType(BSTR* p);
}

//extern extern(C) const IID DIID_DispHTMLObjectElement;
mixin DEFINE_GUID!("DIID_DispHTMLObjectElement", "3050f529-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLObjectElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLObjectElement;
mixin DEFINE_GUID!("CLSID_HTMLObjectElement", "3050f24e-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTMLParamElement;
mixin DEFINE_GUID!("DIID_DispHTMLParamElement", "3050f590-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLParamElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLParamElement;
mixin DEFINE_GUID!("CLSID_HTMLParamElement", "3050f83e-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_HTMLFrameSiteEvents2;
mixin DEFINE_GUID!("DIID_HTMLFrameSiteEvents2", "3050f7ff-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLFrameSiteEvents2 : IDispatch {
}

//extern extern(C) const IID DIID_HTMLFrameSiteEvents;
mixin DEFINE_GUID!("DIID_HTMLFrameSiteEvents", "3050f800-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLFrameSiteEvents : IDispatch {
}

//extern extern(C) const IID IID_IHTMLFrameBase2;
mixin DEFINE_IID!(IHTMLFrameBase2, "3050f6db-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLFrameBase2 : IDispatch {
public extern(Windows):
	HRESULT get_contentWindow(IHTMLWindow2* p);
	HRESULT put_onload(VARIANT v);
	HRESULT get_onload(VARIANT* p);
	HRESULT put_onreadystatechange(VARIANT v);
	HRESULT get_onreadystatechange(VARIANT* p);
	HRESULT get_readyState(BSTR* p);
	HRESULT put_allowTransparency(VARIANT_BOOL v);
	HRESULT get_allowTransparency(VARIANT_BOOL* p);
}

//extern extern(C) const IID IID_IHTMLFrameBase3;
mixin DEFINE_IID!(IHTMLFrameBase3, "3050f82e-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLFrameBase3 : IDispatch {
public extern(Windows):
	HRESULT put_longDesc(BSTR v);
	HRESULT get_longDesc(BSTR* p);
}

//extern extern(C) const IID DIID_DispHTMLFrameBase;
mixin DEFINE_GUID!("DIID_DispHTMLFrameBase", "3050f541-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLFrameBase : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLFrameBase;
mixin DEFINE_GUID!("CLSID_HTMLFrameBase", "3050f312-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLFrameElement;
mixin DEFINE_IID!(IHTMLFrameElement, "3050f313-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLFrameElement : IDispatch {
public extern(Windows):
	HRESULT put_borderColor(VARIANT v);
	HRESULT get_borderColor(VARIANT* p);
}

//extern extern(C) const IID IID_IHTMLFrameElement2;
mixin DEFINE_IID!(IHTMLFrameElement2, "3050f7f5-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLFrameElement2 : IDispatch {
public extern(Windows):
	HRESULT put_height(VARIANT v);
	HRESULT get_height(VARIANT* p);
	HRESULT put_width(VARIANT v);
	HRESULT get_width(VARIANT* p);
}

//extern extern(C) const IID IID_IHTMLFrameElement3;
mixin DEFINE_IID!(IHTMLFrameElement3, "3051042d-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLFrameElement3 : IDispatch {
public extern(Windows):
	HRESULT get_contentDocument(IDispatch* p);
	HRESULT put_src(BSTR v);
	HRESULT get_src(BSTR* p);
	HRESULT put_longDesc(BSTR v);
	HRESULT get_longDesc(BSTR* p);
	HRESULT put_frameBorder(BSTR v);
	HRESULT get_frameBorder(BSTR* p);
}

//extern extern(C) const IID DIID_DispHTMLFrameElement;
mixin DEFINE_GUID!("DIID_DispHTMLFrameElement", "3050f513-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLFrameElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLFrameElement;
mixin DEFINE_GUID!("CLSID_HTMLFrameElement", "3050f314-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLIFrameElement;
mixin DEFINE_IID!(IHTMLIFrameElement, "3050f315-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLIFrameElement : IDispatch {
public extern(Windows):
	HRESULT put_vspace(int v);
	HRESULT get_vspace(int* p);
	HRESULT put_hspace(int v);
	HRESULT get_hspace(int* p);
	HRESULT put_align(BSTR v);
	HRESULT get_align(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLIFrameElement2;
mixin DEFINE_IID!(IHTMLIFrameElement2, "3050f4e6-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLIFrameElement2 : IDispatch {
public extern(Windows):
	HRESULT put_height(VARIANT v);
	HRESULT get_height(VARIANT* p);
	HRESULT put_width(VARIANT v);
	HRESULT get_width(VARIANT* p);
}

//extern extern(C) const IID IID_IHTMLIFrameElement3;
mixin DEFINE_IID!(IHTMLIFrameElement3, "30510433-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLIFrameElement3 : IDispatch {
public extern(Windows):
	HRESULT get_contentDocument(IDispatch* p);
	HRESULT put_src(BSTR v);
	HRESULT get_src(BSTR* p);
	HRESULT put_longDesc(BSTR v);
	HRESULT get_longDesc(BSTR* p);
	HRESULT put_frameBorder(BSTR v);
	HRESULT get_frameBorder(BSTR* p);
}

//extern extern(C) const IID DIID_DispHTMLIFrame;
mixin DEFINE_GUID!("DIID_DispHTMLIFrame", "3050f51b-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLIFrame : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLIFrame;
mixin DEFINE_GUID!("CLSID_HTMLIFrame", "3050f316-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLDivPosition;
mixin DEFINE_IID!(IHTMLDivPosition, "3050f212-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLDivPosition : IDispatch {
public extern(Windows):
	HRESULT put_align(BSTR v);
	HRESULT get_align(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLFieldSetElement;
mixin DEFINE_IID!(IHTMLFieldSetElement, "3050f3e7-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLFieldSetElement : IDispatch {
public extern(Windows):
	HRESULT put_align(BSTR v);
	HRESULT get_align(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLFieldSetElement2;
mixin DEFINE_IID!(IHTMLFieldSetElement2, "3050f833-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLFieldSetElement2 : IDispatch {
public extern(Windows):
	HRESULT get_form(IHTMLFormElement* p);
}

//extern extern(C) const IID IID_IHTMLLegendElement;
mixin DEFINE_IID!(IHTMLLegendElement, "3050f3ea-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLLegendElement : IDispatch {
public extern(Windows):
	HRESULT put_align(BSTR v);
	HRESULT get_align(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLLegendElement2;
mixin DEFINE_IID!(IHTMLLegendElement2, "3050f834-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLLegendElement2 : IDispatch {
public extern(Windows):
	HRESULT get_form(IHTMLFormElement* p);
}

//extern extern(C) const IID DIID_DispHTMLDivPosition;
mixin DEFINE_GUID!("DIID_DispHTMLDivPosition", "3050f50f-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLDivPosition : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLDivPosition;
mixin DEFINE_GUID!("CLSID_HTMLDivPosition", "3050f249-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTMLFieldSetElement;
mixin DEFINE_GUID!("DIID_DispHTMLFieldSetElement", "3050f545-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLFieldSetElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLFieldSetElement;
mixin DEFINE_GUID!("CLSID_HTMLFieldSetElement", "3050f3e8-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTMLLegendElement;
mixin DEFINE_GUID!("DIID_DispHTMLLegendElement", "3050f546-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLLegendElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLLegendElement;
mixin DEFINE_GUID!("CLSID_HTMLLegendElement", "3050f3e9-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLSpanFlow;
mixin DEFINE_IID!(IHTMLSpanFlow, "3050f3e5-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLSpanFlow : IDispatch {
public extern(Windows):
	HRESULT put_align(BSTR v);
	HRESULT get_align(BSTR* p);
}

//extern extern(C) const IID DIID_DispHTMLSpanFlow;
mixin DEFINE_GUID!("DIID_DispHTMLSpanFlow", "3050f544-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLSpanFlow : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLSpanFlow;
mixin DEFINE_GUID!("CLSID_HTMLSpanFlow", "3050f3e6-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLFrameSetElement;
mixin DEFINE_IID!(IHTMLFrameSetElement, "3050f319-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLFrameSetElement : IDispatch {
public extern(Windows):
	HRESULT put_rows(BSTR v);
	HRESULT get_rows(BSTR* p);
	HRESULT put_cols(BSTR v);
	HRESULT get_cols(BSTR* p);
	HRESULT put_border(VARIANT v);
	HRESULT get_border(VARIANT* p);
	HRESULT put_borderColor(VARIANT v);
	HRESULT get_borderColor(VARIANT* p);
	HRESULT put_frameBorder(BSTR v);
	HRESULT get_frameBorder(BSTR* p);
	HRESULT put_frameSpacing(VARIANT v);
	HRESULT get_frameSpacing(VARIANT* p);
	HRESULT put_name(BSTR v);
	HRESULT get_name(BSTR* p);
	HRESULT put_onload(VARIANT v);
	HRESULT get_onload(VARIANT* p);
	HRESULT put_onunload(VARIANT v);
	HRESULT get_onunload(VARIANT* p);
	HRESULT put_onbeforeunload(VARIANT v);
	HRESULT get_onbeforeunload(VARIANT* p);
}

//extern extern(C) const IID IID_IHTMLFrameSetElement2;
mixin DEFINE_IID!(IHTMLFrameSetElement2, "3050f5c6-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLFrameSetElement2 : IDispatch {
public extern(Windows):
	HRESULT put_onbeforeprint(VARIANT v);
	HRESULT get_onbeforeprint(VARIANT* p);
	HRESULT put_onafterprint(VARIANT v);
	HRESULT get_onafterprint(VARIANT* p);
}

//extern extern(C) const IID DIID_DispHTMLFrameSetSite;
mixin DEFINE_GUID!("DIID_DispHTMLFrameSetSite", "3050f514-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLFrameSetSite : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLFrameSetSite;
mixin DEFINE_GUID!("CLSID_HTMLFrameSetSite", "3050f31A-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLBGsound;
mixin DEFINE_IID!(IHTMLBGsound, "3050f369-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLBGsound : IDispatch {
public extern(Windows):
	HRESULT put_src(BSTR v);
	HRESULT get_src(BSTR* p);
	HRESULT put_loop(VARIANT v);
	HRESULT get_loop(VARIANT* p);
	HRESULT put_volume(VARIANT v);
	HRESULT get_volume(VARIANT* p);
	HRESULT put_balance(VARIANT v);
	HRESULT get_balance(VARIANT* p);
}

//extern extern(C) const IID DIID_DispHTMLBGsound;
mixin DEFINE_GUID!("DIID_DispHTMLBGsound", "3050f53c-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLBGsound : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLBGsound;
mixin DEFINE_GUID!("CLSID_HTMLBGsound", "3050f370-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLFontNamesCollection;
mixin DEFINE_IID!(IHTMLFontNamesCollection, "3050f376-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLFontNamesCollection : IDispatch {
public extern(Windows):
	HRESULT get_length(int* p);
	HRESULT get__newEnum(IUnknown* p);
	HRESULT item(int index, BSTR* pBstr);
}

//extern extern(C) const IID IID_IHTMLFontSizesCollection;
mixin DEFINE_IID!(IHTMLFontSizesCollection, "3050f377-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLFontSizesCollection : IDispatch {
public extern(Windows):
	HRESULT get_length(int* p);
	HRESULT get__newEnum(IUnknown* p);
	HRESULT get_forFont(BSTR* p);
	HRESULT item(int index, int* plSize);
}

//extern extern(C) const IID IID_IHTMLOptionsHolder;
mixin DEFINE_IID!(IHTMLOptionsHolder, "3050f378-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLOptionsHolder : IDispatch {
public extern(Windows):
	HRESULT get_document(IHTMLDocument2* p);
	HRESULT get_fonts(IHTMLFontNamesCollection* p);
	HRESULT put_execArg(VARIANT v);
	HRESULT get_execArg(VARIANT* p);
	HRESULT put_errorLine(int v);
	HRESULT get_errorLine(int* p);
	HRESULT put_errorCharacter(int v);
	HRESULT get_errorCharacter(int* p);
	HRESULT put_errorCode(int v);
	HRESULT get_errorCode(int* p);
	HRESULT put_errorMessage(BSTR v);
	HRESULT get_errorMessage(BSTR* p);
	HRESULT put_errorDebug(VARIANT_BOOL v);
	HRESULT get_errorDebug(VARIANT_BOOL* p);
	HRESULT get_unsecuredWindowOfDocument(IHTMLWindow2* p);
	HRESULT put_findText(BSTR v);
	HRESULT get_findText(BSTR* p);
	HRESULT put_anythingAfterFrameset(VARIANT_BOOL v);
	HRESULT get_anythingAfterFrameset(VARIANT_BOOL* p);
	HRESULT sizes(BSTR fontName, IHTMLFontSizesCollection* pSizesCollection);
	HRESULT openfiledlg(VARIANT initFile, VARIANT initDir, VARIANT filter, VARIANT title, BSTR* pathName);
	HRESULT savefiledlg(VARIANT initFile, VARIANT initDir, VARIANT filter, VARIANT title, BSTR* pathName);
	HRESULT choosecolordlg(VARIANT initColor, int* rgbColor);
	HRESULT showSecurityInfo();
	HRESULT isApartmentModel(IHTMLObjectElement object, VARIANT_BOOL* fApartment);
	HRESULT getCharset(BSTR fontName, int* charset);
	HRESULT get_secureConnectionInfo(BSTR* p);
}

//extern extern(C) const IID DIID_HTMLStyleElementEvents2;
mixin DEFINE_GUID!("DIID_HTMLStyleElementEvents2", "3050f615-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLStyleElementEvents2 : IDispatch {
}

//extern extern(C) const IID DIID_HTMLStyleElementEvents;
mixin DEFINE_GUID!("DIID_HTMLStyleElementEvents", "3050f3cb-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLStyleElementEvents : IDispatch {
}

//extern extern(C) const IID IID_IHTMLStyleElement;
mixin DEFINE_IID!(IHTMLStyleElement, "3050f375-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLStyleElement : IDispatch {
public extern(Windows):
	HRESULT put_type(BSTR v);
	HRESULT get_type(BSTR* p);
	HRESULT get_readyState(BSTR* p);
	HRESULT put_onreadystatechange(VARIANT v);
	HRESULT get_onreadystatechange(VARIANT* p);
	HRESULT put_onload(VARIANT v);
	HRESULT get_onload(VARIANT* p);
	HRESULT put_onerror(VARIANT v);
	HRESULT get_onerror(VARIANT* p);
	HRESULT get_styleSheet(IHTMLStyleSheet* p);
	HRESULT put_disabled(VARIANT_BOOL v);
	HRESULT get_disabled(VARIANT_BOOL* p);
	HRESULT put_media(BSTR v);
	HRESULT get_media(BSTR* p);
}

//extern extern(C) const IID DIID_DispHTMLStyleElement;
mixin DEFINE_GUID!("DIID_DispHTMLStyleElement", "3050f511-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLStyleElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLStyleElement;
mixin DEFINE_GUID!("CLSID_HTMLStyleElement", "3050f37d-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLStyleFontFace;
mixin DEFINE_IID!(IHTMLStyleFontFace, "3050f3d5-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLStyleFontFace : IDispatch {
public extern(Windows):
	HRESULT put_fontsrc(BSTR v);
	HRESULT get_fontsrc(BSTR* p);
}

//extern extern(C) const CLSID CLSID_HTMLStyleFontFace;
mixin DEFINE_GUID!("CLSID_HTMLStyleFontFace", "3050f3d4-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLXDomainRequest;
mixin DEFINE_IID!(IHTMLXDomainRequest, "30510454-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLXDomainRequest : IDispatch {
public extern(Windows):
	HRESULT get_responseText(BSTR* p);
	HRESULT put_timeout(int v);
	HRESULT get_timeout(int* p);
	HRESULT get_contentType(BSTR* p);
	HRESULT put_onprogress(VARIANT v);
	HRESULT get_onprogress(VARIANT* p);
	HRESULT put_onerror(VARIANT v);
	HRESULT get_onerror(VARIANT* p);
	HRESULT put_ontimeout(VARIANT v);
	HRESULT get_ontimeout(VARIANT* p);
	HRESULT put_onload(VARIANT v);
	HRESULT get_onload(VARIANT* p);
	HRESULT abort();
	HRESULT open(BSTR bstrMethod, BSTR bstrUrl);
	HRESULT send(VARIANT varBody);
}

//extern extern(C) const IID IID_IHTMLXDomainRequestFactory;
mixin DEFINE_IID!(IHTMLXDomainRequestFactory, "30510456-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLXDomainRequestFactory : IDispatch {
public extern(Windows):
	HRESULT create(IHTMLXDomainRequest* __MIDL__IHTMLXDomainRequestFactory0000);
}

//extern extern(C) const IID DIID_DispXDomainRequest;
mixin DEFINE_GUID!("DIID_DispXDomainRequest", "3050f599-98b5-11cf-bb82-00aa00bdce0b");
interface DispXDomainRequest : IDispatch {
}

//extern extern(C) const CLSID CLSID_XDomainRequest;
mixin DEFINE_GUID!("CLSID_XDomainRequest", "30510455-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const CLSID CLSID_XDomainRequestFactory;
mixin DEFINE_GUID!("CLSID_XDomainRequestFactory", "30510457-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTMLStorage;
mixin DEFINE_GUID!("DIID_DispHTMLStorage", "3050f59d-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLStorage : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLStorage;
mixin DEFINE_GUID!("CLSID_HTMLStorage", "30510475-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_ICSSFilterSite;
mixin DEFINE_IID!(ICSSFilterSite, "3050f3ed-98b5-11cf-bb82-00aa00bdce0b");
interface ICSSFilterSite : IUnknown {
public extern(Windows):
	HRESULT GetElement(IHTMLElement* Element);
	HRESULT FireOnFilterChangeEvent();
}

//extern extern(C) const IID IID_IMarkupPointer;
mixin DEFINE_IID!(IMarkupPointer, "3050f49f-98b5-11cf-bb82-00aa00bdce0b");
interface IMarkupPointer : IUnknown {
public extern(Windows):
	HRESULT OwningDoc(IHTMLDocument2* ppDoc);
	HRESULT Gravity(POINTER_GRAVITY* pGravity);
	HRESULT SetGravity(POINTER_GRAVITY Gravity);
	HRESULT Cling(BOOL* pfCling);
	HRESULT SetCling(BOOL fCLing);
	HRESULT Unposition();
	HRESULT IsPositioned(BOOL* pfPositioned);
	HRESULT GetContainer(IMarkupContainer* ppContainer);
	HRESULT MoveAdjacentToElement(IHTMLElement* pElement, ELEMENT_ADJACENCY eAdj);
	HRESULT MoveToPointer(IMarkupPointer pPointer);
	HRESULT MoveToContainer(IMarkupContainer pContainer, BOOL fAtStart);
	HRESULT Left(BOOL fMove, MARKUP_CONTEXT_TYPE* pContext, IHTMLElement* ppElement, int* pcch, OLECHAR* pchText);
	HRESULT Right(BOOL fMove, MARKUP_CONTEXT_TYPE* pContext, IHTMLElement* ppElement, int* pcch, OLECHAR* pchText);
	HRESULT CurrentScope(IHTMLElement* ppElemCurrent);
	HRESULT IsLeftOf(IMarkupPointer pPointerThat, BOOL* pfResult);
	HRESULT IsLeftOfOrEqualTo(IMarkupPointer pPointerThat, BOOL* pfResult);
	HRESULT IsRightOf(IMarkupPointer pPointerThat, BOOL* pfResult);
	HRESULT IsRightOfOrEqualTo(IMarkupPointer pPointerThat, BOOL* pfResult);
	HRESULT IsEqualTo(IMarkupPointer pPointerThat, BOOL* pfAreEqual);
	HRESULT MoveUnit(MOVEUNIT_ACTION muAction);
	HRESULT FindText(OLECHAR* pchFindText, DWORD dwFlags, IMarkupPointer pIEndMatch, IMarkupPointer pIEndSearch);
}

//extern extern(C) const IID IID_IMarkupContainer;
mixin DEFINE_IID!(IMarkupContainer, "3050f5f9-98b5-11cf-bb82-00aa00bdce0b");
interface IMarkupContainer : IUnknown {
public extern(Windows):
	HRESULT OwningDoc(IHTMLDocument2* ppDoc);
}

//extern extern(C) const IID IID_IMarkupContainer2;
mixin DEFINE_IID!(IMarkupContainer2, "3050f648-98b5-11cf-bb82-00aa00bdce0b");
interface IMarkupContainer2 : IMarkupContainer {
public extern(Windows):
	HRESULT CreateChangeLog(IHTMLChangeSink pChangeSink, IHTMLChangeLog* ppChangeLog, BOOL fForward, BOOL fBackward);
	HRESULT RegisterForDirtyRange(IHTMLChangeSink pChangeSink, DWORD* pdwCookie);
	HRESULT UnRegisterForDirtyRange(DWORD dwCookie);
	HRESULT GetAndClearDirtyRange(DWORD dwCookie, IMarkupPointer pIPointerBegin, IMarkupPointer pIPointerEnd);
	int GetVersionNumber();
	HRESULT GetMasterElement(IHTMLElement* ppElementMaster);
}

//extern extern(C) const IID IID_IHTMLChangeLog;
mixin DEFINE_IID!(IHTMLChangeLog, "3050f649-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLChangeLog : IUnknown {
public extern(Windows):
	HRESULT GetNextChange(BYTE* pbBuffer, int nBufferSize, int* pnRecordLength);
}

//extern extern(C) const IID IID_IHTMLChangeSink;
mixin DEFINE_IID!(IHTMLChangeSink, "3050f64a-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLChangeSink : IUnknown {
public extern(Windows):
	HRESULT Notify();
}

//extern extern(C) const IID IID_IActiveIMMApp;
mixin DEFINE_IID!(IActiveIMMApp, "08c0e040-62d1-11d1-9326-0060b067b86e");
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

export extern(Windows){
	HRESULT IActiveIMMApp_AssociateContext_Proxy(IActiveIMMApp This, HWND hWnd, HIMC hIME, HIMC* phPrev);
	void IActiveIMMApp_AssociateContext_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_ConfigureIMEA_Proxy(IActiveIMMApp This, HKL hKL, HWND hWnd, DWORD dwMode, REGISTERWORDA* pData);
	void IActiveIMMApp_ConfigureIMEA_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_ConfigureIMEW_Proxy(IActiveIMMApp This, HKL hKL, HWND hWnd, DWORD dwMode, REGISTERWORDW* pData);
	void IActiveIMMApp_ConfigureIMEW_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_CreateContext_Proxy(IActiveIMMApp This, HIMC* phIMC);
	void IActiveIMMApp_CreateContext_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_DestroyContext_Proxy(IActiveIMMApp This, HIMC hIME);
	void IActiveIMMApp_DestroyContext_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_EnumRegisterWordA_Proxy(IActiveIMMApp This, HKL hKL, LPSTR szReading, DWORD dwStyle, LPSTR szRegister, LPVOID pData, IEnumRegisterWordA* pEnum);
	void IActiveIMMApp_EnumRegisterWordA_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_EnumRegisterWordW_Proxy(IActiveIMMApp This, HKL hKL, LPWSTR szReading, DWORD dwStyle, LPWSTR szRegister, LPVOID pData, IEnumRegisterWordW* pEnum);
	void IActiveIMMApp_EnumRegisterWordW_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_EscapeA_Proxy(IActiveIMMApp This, HKL hKL, HIMC hIMC, UINT uEscape, LPVOID pData, LRESULT* plResult);
	void IActiveIMMApp_EscapeA_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_EscapeW_Proxy(IActiveIMMApp This, HKL hKL, HIMC hIMC, UINT uEscape, LPVOID pData, LRESULT* plResult);
	void IActiveIMMApp_EscapeW_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_GetCandidateListA_Proxy(IActiveIMMApp This, HIMC hIMC, DWORD dwIndex, UINT uBufLen, CANDIDATELIST* pCandList, UINT* puCopied);
	void IActiveIMMApp_GetCandidateListA_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_GetCandidateListW_Proxy(IActiveIMMApp This, HIMC hIMC, DWORD dwIndex, UINT uBufLen, CANDIDATELIST* pCandList, UINT* puCopied);
	void IActiveIMMApp_GetCandidateListW_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_GetCandidateListCountA_Proxy(IActiveIMMApp This, HIMC hIMC, DWORD* pdwListSize, DWORD* pdwBufLen);
	void IActiveIMMApp_GetCandidateListCountA_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_GetCandidateListCountW_Proxy(IActiveIMMApp This, HIMC hIMC, DWORD* pdwListSize, DWORD* pdwBufLen);
	void IActiveIMMApp_GetCandidateListCountW_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_GetCandidateWindow_Proxy(IActiveIMMApp This, HIMC hIMC, DWORD dwIndex, CANDIDATEFORM* pCandidate);
	void IActiveIMMApp_GetCandidateWindow_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_GetCompositionFontA_Proxy(IActiveIMMApp This, HIMC hIMC, LOGFONTA* plf);
	void IActiveIMMApp_GetCompositionFontA_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_GetCompositionFontW_Proxy(IActiveIMMApp This, HIMC hIMC, LOGFONTW* plf);
	void IActiveIMMApp_GetCompositionFontW_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_GetCompositionStringA_Proxy(IActiveIMMApp This, HIMC hIMC, DWORD dwIndex, DWORD dwBufLen, LONG* plCopied, LPVOID pBuf);
	void IActiveIMMApp_GetCompositionStringA_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_GetCompositionStringW_Proxy(IActiveIMMApp This, HIMC hIMC, DWORD dwIndex, DWORD dwBufLen, LONG* plCopied, LPVOID pBuf);
	void IActiveIMMApp_GetCompositionStringW_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_GetCompositionWindow_Proxy(IActiveIMMApp This, HIMC hIMC, COMPOSITIONFORM* pCompForm);
	void IActiveIMMApp_GetCompositionWindow_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_GetContext_Proxy(IActiveIMMApp This, HWND hWnd, HIMC* phIMC);
	void IActiveIMMApp_GetContext_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_GetConversionListA_Proxy(IActiveIMMApp This, HKL hKL, HIMC hIMC, LPSTR pSrc, UINT uBufLen, UINT uFlag, CANDIDATELIST* pDst, UINT* puCopied);
	void IActiveIMMApp_GetConversionListA_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_GetConversionListW_Proxy(IActiveIMMApp This, HKL hKL, HIMC hIMC, LPWSTR pSrc, UINT uBufLen, UINT uFlag, CANDIDATELIST* pDst, UINT* puCopied);
	void IActiveIMMApp_GetConversionListW_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_GetConversionStatus_Proxy(IActiveIMMApp This, HIMC hIMC, DWORD* pfdwConversion, DWORD* pfdwSentence);
	void IActiveIMMApp_GetConversionStatus_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_GetDefaultIMEWnd_Proxy(IActiveIMMApp This, HWND hWnd, HWND* phDefWnd);
	void IActiveIMMApp_GetDefaultIMEWnd_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_GetDescriptionA_Proxy(IActiveIMMApp This, HKL hKL, UINT uBufLen, LPSTR szDescription, UINT* puCopied);
	void IActiveIMMApp_GetDescriptionA_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_GetDescriptionW_Proxy(IActiveIMMApp This, HKL hKL, UINT uBufLen, LPWSTR szDescription, UINT* puCopied);
	void IActiveIMMApp_GetDescriptionW_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_GetGuideLineA_Proxy(IActiveIMMApp This, HIMC hIMC, DWORD dwIndex, DWORD dwBufLen, LPSTR pBuf, DWORD* pdwResult);
	void IActiveIMMApp_GetGuideLineA_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_GetGuideLineW_Proxy(IActiveIMMApp This, HIMC hIMC, DWORD dwIndex, DWORD dwBufLen, LPWSTR pBuf, DWORD* pdwResult);
	void IActiveIMMApp_GetGuideLineW_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_GetIMEFileNameA_Proxy(IActiveIMMApp This, HKL hKL, UINT uBufLen, LPSTR szFileName, UINT* puCopied);
	void IActiveIMMApp_GetIMEFileNameA_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_GetIMEFileNameW_Proxy(IActiveIMMApp This, HKL hKL, UINT uBufLen, LPWSTR szFileName, UINT* puCopied);
	void IActiveIMMApp_GetIMEFileNameW_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_GetOpenStatus_Proxy(IActiveIMMApp This, HIMC hIMC);
	void IActiveIMMApp_GetOpenStatus_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_GetProperty_Proxy(IActiveIMMApp This, HKL hKL, DWORD fdwIndex, DWORD* pdwProperty);
	void IActiveIMMApp_GetProperty_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_GetRegisterWordStyleA_Proxy(IActiveIMMApp This, HKL hKL, UINT nItem, STYLEBUFA* pStyleBuf, UINT* puCopied);
	void IActiveIMMApp_GetRegisterWordStyleA_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_GetRegisterWordStyleW_Proxy(IActiveIMMApp This, HKL hKL, UINT nItem, STYLEBUFW* pStyleBuf, UINT* puCopied);
	void IActiveIMMApp_GetRegisterWordStyleW_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_GetStatusWindowPos_Proxy(IActiveIMMApp This, HIMC hIMC, POINT* pptPos);
	void IActiveIMMApp_GetStatusWindowPos_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_GetVirtualKey_Proxy(IActiveIMMApp This, HWND hWnd, UINT* puVirtualKey);
	void IActiveIMMApp_GetVirtualKey_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_InstallIMEA_Proxy(IActiveIMMApp This, LPSTR szIMEFileName, LPSTR szLayoutText, HKL* phKL);
	void IActiveIMMApp_InstallIMEA_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_InstallIMEW_Proxy(IActiveIMMApp This, LPWSTR szIMEFileName, LPWSTR szLayoutText, HKL* phKL);
	void IActiveIMMApp_InstallIMEW_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_IsIME_Proxy(IActiveIMMApp This, HKL hKL);
	void IActiveIMMApp_IsIME_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_IsUIMessageA_Proxy(IActiveIMMApp This, HWND hWndIME, UINT msg, WPARAM wParam, LPARAM lParam);
	void IActiveIMMApp_IsUIMessageA_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_IsUIMessageW_Proxy(IActiveIMMApp This, HWND hWndIME, UINT msg, WPARAM wParam, LPARAM lParam);
	void IActiveIMMApp_IsUIMessageW_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_NotifyIME_Proxy(IActiveIMMApp This, HIMC hIMC, DWORD dwAction, DWORD dwIndex, DWORD dwValue);
	void IActiveIMMApp_NotifyIME_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_RegisterWordA_Proxy(IActiveIMMApp This, HKL hKL, LPSTR szReading, DWORD dwStyle, LPSTR szRegister);
	void IActiveIMMApp_RegisterWordA_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_RegisterWordW_Proxy(IActiveIMMApp This, HKL hKL, LPWSTR szReading, DWORD dwStyle, LPWSTR szRegister);
	void IActiveIMMApp_RegisterWordW_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_ReleaseContext_Proxy(IActiveIMMApp This, HWND hWnd, HIMC hIMC);
	void IActiveIMMApp_ReleaseContext_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_SetCandidateWindow_Proxy(IActiveIMMApp This, HIMC hIMC, CANDIDATEFORM* pCandidate);
	void IActiveIMMApp_SetCandidateWindow_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_SetCompositionFontA_Proxy(IActiveIMMApp This, HIMC hIMC, LOGFONTA* plf);
	void IActiveIMMApp_SetCompositionFontA_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_SetCompositionFontW_Proxy(IActiveIMMApp This, HIMC hIMC, LOGFONTW* plf);
	void IActiveIMMApp_SetCompositionFontW_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_SetCompositionStringA_Proxy(IActiveIMMApp This, HIMC hIMC, DWORD dwIndex, LPVOID pComp, DWORD dwCompLen, LPVOID pRead, DWORD dwReadLen);
	void IActiveIMMApp_SetCompositionStringA_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_SetCompositionStringW_Proxy(IActiveIMMApp This, HIMC hIMC, DWORD dwIndex, LPVOID pComp, DWORD dwCompLen, LPVOID pRead, DWORD dwReadLen);
	void IActiveIMMApp_SetCompositionStringW_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_SetCompositionWindow_Proxy(IActiveIMMApp This, HIMC hIMC, COMPOSITIONFORM* pCompForm);
	void IActiveIMMApp_SetCompositionWindow_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_SetConversionStatus_Proxy(IActiveIMMApp This, HIMC hIMC, DWORD fdwConversion, DWORD fdwSentence);
	void IActiveIMMApp_SetConversionStatus_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_SetOpenStatus_Proxy(IActiveIMMApp This, HIMC hIMC, BOOL fOpen);
	void IActiveIMMApp_SetOpenStatus_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_SetStatusWindowPos_Proxy(IActiveIMMApp This, HIMC hIMC, POINT* pptPos);
	void IActiveIMMApp_SetStatusWindowPos_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_SimulateHotKey_Proxy(IActiveIMMApp This, HWND hWnd, DWORD dwHotKeyID);
	void IActiveIMMApp_SimulateHotKey_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_UnregisterWordA_Proxy(IActiveIMMApp This, HKL hKL, LPSTR szReading, DWORD dwStyle, LPSTR szUnregister);
	void IActiveIMMApp_UnregisterWordA_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_UnregisterWordW_Proxy(IActiveIMMApp This, HKL hKL, LPWSTR szReading, DWORD dwStyle, LPWSTR szUnregister);
	void IActiveIMMApp_UnregisterWordW_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_Activate_Proxy(IActiveIMMApp This, BOOL fRestoreLayout);
	void IActiveIMMApp_Activate_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_Deactivate_Proxy(IActiveIMMApp This);
	void IActiveIMMApp_Deactivate_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_OnDefWindowProc_Proxy(IActiveIMMApp This, HWND hWnd, UINT Msg, WPARAM wParam, LPARAM lParam, LRESULT* plResult);
	void IActiveIMMApp_OnDefWindowProc_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_FilterClientWindows_Proxy(IActiveIMMApp This, ATOM* aaClassList, UINT uSize);
	void IActiveIMMApp_FilterClientWindows_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_GetCodePageA_Proxy(IActiveIMMApp This, HKL hKL, UINT* uCodePage);
	void IActiveIMMApp_GetCodePageA_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_GetLangId_Proxy(IActiveIMMApp This, HKL hKL, LANGID* plid);
	void IActiveIMMApp_GetLangId_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_AssociateContextEx_Proxy(IActiveIMMApp This, HWND hWnd, HIMC hIMC, DWORD dwFlags);
	void IActiveIMMApp_AssociateContextEx_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_DisableIME_Proxy(IActiveIMMApp This, DWORD idThread);
	void IActiveIMMApp_DisableIME_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_GetImeMenuItemsA_Proxy(IActiveIMMApp This, HIMC hIMC, DWORD dwFlags, DWORD dwType, IMEMENUITEMINFOA* pImeParentMenu, IMEMENUITEMINFOA* pImeMenu, DWORD dwSize, DWORD* pdwResult);
	void IActiveIMMApp_GetImeMenuItemsA_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_GetImeMenuItemsW_Proxy(IActiveIMMApp This, HIMC hIMC, DWORD dwFlags, DWORD dwType, IMEMENUITEMINFOW* pImeParentMenu, IMEMENUITEMINFOW* pImeMenu, DWORD dwSize, DWORD* pdwResult);
	void IActiveIMMApp_GetImeMenuItemsW_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IActiveIMMApp_EnumInputContext_Proxy(IActiveIMMApp This, DWORD idThread, IEnumInputContext* ppEnum);
	void IActiveIMMApp_EnumInputContext_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_ISegmentList;
mixin DEFINE_IID!(ISegmentList, "3050f605-98b5-11cf-bb82-00aa00bdce0b");
interface ISegmentList : IUnknown {
public extern(Windows):
	HRESULT CreateIterator(ISegmentListIterator* ppIIter);
	HRESULT GetType(SELECTION_TYPE* peType);
	HRESULT IsEmpty(BOOL* pfEmpty);
}

//extern extern(C) const IID IID_ISegmentListIterator;
mixin DEFINE_IID!(ISegmentListIterator, "3050f692-98b5-11cf-bb82-00aa00bdce0b");
interface ISegmentListIterator : IUnknown {
public extern(Windows):
	HRESULT Current(ISegment* ppISegment);
	HRESULT First();
	HRESULT IsDone();
	HRESULT Advance();
}

//extern extern(C) const IID IID_IHTMLCaret;
mixin DEFINE_IID!(IHTMLCaret, "3050f604-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLCaret : IUnknown {
public extern(Windows):
	HRESULT MoveCaretToPointer(IDisplayPointer pDispPointer, BOOL fScrollIntoView, CARET_DIRECTION eDir);
	HRESULT MoveCaretToPointerEx(IDisplayPointer pDispPointer, BOOL fVisible, BOOL fScrollIntoView, CARET_DIRECTION eDir);
	HRESULT MoveMarkupPointerToCaret(IMarkupPointer pIMarkupPointer);
	HRESULT MoveDisplayPointerToCaret(IDisplayPointer pDispPointer);
	HRESULT IsVisible(BOOL* pIsVisible);
	HRESULT Show(BOOL fScrollIntoView);
	HRESULT Hide();
	HRESULT InsertText(OLECHAR* pText, LONG lLen);
	HRESULT ScrollIntoView();
	HRESULT GetLocation(POINT* pPoint, BOOL fTranslate);
	HRESULT GetCaretDirection(CARET_DIRECTION* peDir);
	HRESULT SetCaretDirection(CARET_DIRECTION eDir);
}

//extern extern(C) const IID IID_ISegment;
mixin DEFINE_IID!(ISegment, "3050f683-98b5-11cf-bb82-00aa00bdce0b");
interface ISegment : IUnknown {
public extern(Windows):
	HRESULT GetPointers(IMarkupPointer pIStart, IMarkupPointer pIEnd);
}

//extern extern(C) const IID IID_IElementSegment;
mixin DEFINE_IID!(IElementSegment, "3050f68f-98b5-11cf-bb82-00aa00bdce0b");
interface IElementSegment : ISegment {
public extern(Windows):
	HRESULT GetElement(IHTMLElement* ppIElement);
	HRESULT SetPrimary(BOOL fPrimary);
	HRESULT IsPrimary(BOOL* pfPrimary);
}

//extern extern(C) const IID IID_IHighlightSegment;
mixin DEFINE_IID!(IHighlightSegment, "3050f690-98b5-11cf-bb82-00aa00bdce0b");
interface IHighlightSegment : ISegment {
public extern(Windows):
}

//extern extern(C) const IID IID_IHighlightRenderingServices;
mixin DEFINE_IID!(IHighlightRenderingServices, "3050f606-98b5-11cf-bb82-00aa00bdce0b");
interface IHighlightRenderingServices : IUnknown {
public extern(Windows):
	HRESULT AddSegment(IDisplayPointer pDispPointerStart,IDisplayPointer pDispPointerEnd, IHTMLRenderStyle pIRenderStyle, IHighlightSegment* ppISegment);
	HRESULT MoveSegmentToPointers(IHighlightSegment pISegment,IDisplayPointer pDispPointerStart,IDisplayPointer pDispPointerEnd);
	HRESULT RemoveSegment(IHighlightSegment pISegment);
}

//extern extern(C) const IID IID_ILineInfo;
mixin DEFINE_IID!(ILineInfo, "3050f7e2-98b5-11cf-bb82-00aa00bdce0b");
interface ILineInfo : IUnknown {
public extern(Windows):
	HRESULT get_x(int* p);
	HRESULT get_baseLine(int* p);
	HRESULT get_textDescent(int* p);
	HRESULT get_textHeight(int* p);
	HRESULT get_lineDirection(LONG* p);
}

//extern extern(C) const IID IID_IDisplayPointer;
mixin DEFINE_IID!(IDisplayPointer, "3050f69e-98b5-11cf-bb82-00aa00bdce0b");
interface IDisplayPointer : IUnknown {
public extern(Windows):
	HRESULT MoveToPoint(POINT ptPoint, COORD_SYSTEM eCoordSystem, IHTMLElement pElementContext, DWORD dwHitTestOptions, DWORD* pdwHitTestResults);
	HRESULT MoveUnit(DISPLAY_MOVEUNIT eMoveUnit, LONG lXPos);
	HRESULT PositionMarkupPointer(IMarkupPointer pMarkupPointer);
	HRESULT MoveToPointer(IDisplayPointer pDispPointer);
	HRESULT SetPointerGravity(POINTER_GRAVITY eGravity);
	HRESULT GetPointerGravity(POINTER_GRAVITY* peGravity);
	HRESULT SetDisplayGravity(DISPLAY_GRAVITY eGravity);
	HRESULT GetDisplayGravity(DISPLAY_GRAVITY* peGravity);
	HRESULT IsPositioned(BOOL* pfPositioned);
	HRESULT Unposition();
	HRESULT IsEqualTo(IDisplayPointer pDispPointer, BOOL* pfIsEqual);
	HRESULT IsLeftOf(IDisplayPointer pDispPointer, BOOL* pfIsLeftOf);
	HRESULT IsRightOf(IDisplayPointer pDispPointer, BOOL* pfIsRightOf);
	HRESULT IsAtBOL(BOOL* pfBOL);
	HRESULT MoveToMarkupPointer(IMarkupPointer pPointer,IDisplayPointer pDispLineContext);
	HRESULT ScrollIntoView();
	HRESULT GetLineInfo(ILineInfo* ppLineInfo);
	HRESULT GetFlowElement(IHTMLElement* ppLayoutElement);
	HRESULT QueryBreaks(DWORD* pdwBreaks);
}

//extern extern(C) const IID IID_IDisplayServices;
mixin DEFINE_IID!(IDisplayServices, "3050f69d-98b5-11cf-bb82-00aa00bdce0b");
interface IDisplayServices : IUnknown {
public extern(Windows):
	HRESULT CreateDisplayPointer(IDisplayPointer* ppDispPointer);
	HRESULT TransformRect(RECT* pRect, COORD_SYSTEM eSource, COORD_SYSTEM eDestination, IHTMLElement pIElement);
	HRESULT TransformPoint(POINT* pPoint, COORD_SYSTEM eSource, COORD_SYSTEM eDestination, IHTMLElement pIElement);
	HRESULT GetCaret(IHTMLCaret* ppCaret);
	HRESULT GetComputedStyle(IMarkupPointer pPointer, IHTMLComputedStyle* ppComputedStyle);
	HRESULT ScrollRectIntoView(IHTMLElement* pIElement, RECT rect);
	HRESULT HasFlowLayout(IHTMLElement pIElement, BOOL* pfHasFlowLayout);
}

//extern extern(C) const IID IID_IHtmlDlgSafeHelper;
mixin DEFINE_IID!(IHtmlDlgSafeHelper, "3050f81a-98b5-11cf-bb82-00aa00bdce0b");
interface IHtmlDlgSafeHelper : IDispatch {
public extern(Windows):
	HRESULT choosecolordlg(VARIANT initColor, VARIANT* rgbColor);
	HRESULT getCharset(BSTR fontName, VARIANT* charset);
	HRESULT get_Fonts(IDispatch* p);
	HRESULT get_BlockFormats(IDispatch* p);
}

//extern extern(C) const IID IID_IBlockFormats;
mixin DEFINE_IID!(IBlockFormats, "3050f830-98b5-11cf-bb82-00aa00bdce0b");
interface IBlockFormats : IDispatch {
public extern(Windows):
	HRESULT get__NewEnum(IUnknown* p);
	HRESULT get_Count(int* p);
	HRESULT Item(VARIANT* pvarIndex, BSTR* pbstrBlockFormat);
}

mixin DEFINE_IID!(IFontNames, "3050f839-98b5-11cf-bb82-00aa00bdce0b");
//extern extern(C) const IID IID_IFontNames;
interface IFontNames : IDispatch {
public extern(Windows):
	HRESULT get__NewEnum(IUnknown* p);
	HRESULT get_Count(int* p);
	HRESULT Item(VARIANT* pvarIndex, BSTR* pbstrFontName);
}

//extern extern(C) const IID IID_ICSSFilter;
mixin DEFINE_IID!(ICSSFilter, "3050f3ec-98b5-11cf-bb82-00aa00bdce0b");
interface ICSSFilter : IUnknown {
public extern(Windows):
	HRESULT SetSite(ICSSFilterSite pSink);
	HRESULT OnAmbientPropertyChange(LONG dispid);
}

//extern extern(C) const IID IID_ISecureUrlHost;
mixin DEFINE_IID!(ISecureUrlHost, "c81984c4-74c8-11d2-baa9-00c04fc2040e");
interface ISecureUrlHost : IUnknown {
public extern(Windows):
	HRESULT ValidateSecureUrl(BOOL* pfAllow, OLECHAR* pchUrlInQuestion, DWORD dwFlags);
}

//extern extern(C) const IID IID_IMarkupServices;
mixin DEFINE_IID!(IMarkupServices, "3050f4a0-98b5-11cf-bb82-00aa00bdce0b");
interface IMarkupServices : IUnknown {
public extern(Windows):
	HRESULT CreateMarkupPointer(IMarkupPointer* ppPointer);
	HRESULT CreateMarkupContainer(IMarkupContainer* ppMarkupContainer);
	HRESULT CreateElement(ELEMENT_TAG_ID tagID, OLECHAR* pchAttributes, IHTMLElement* ppElement);
	HRESULT CloneElement(IHTMLElement pElemCloneThis, IHTMLElement* ppElementTheClone);
	HRESULT InsertElement(IHTMLElement pElementInsert, IMarkupPointer pPointerStart, IMarkupPointer pPointerFinish);
	HRESULT RemoveElement(IHTMLElement pElementRemove);
	HRESULT Remove(IMarkupPointer pPointerStart, IMarkupPointer pPointerFinish);
	HRESULT Copy(IMarkupPointer pPointerSourceStart, IMarkupPointer pPointerSourceFinish, IMarkupPointer pPointerTarget);
	HRESULT Move(IMarkupPointer pPointerSourceStart, IMarkupPointer pPointerSourceFinish, IMarkupPointer pPointerTarget);
	HRESULT InsertText(OLECHAR* pchText, int cch, IMarkupPointer pPointerTarget);
	HRESULT ParseString(OLECHAR* pchHTML, DWORD dwFlags, IMarkupContainer* ppContainerResult, IMarkupPointer ppPointerStart, IMarkupPointer ppPointerFinish);
	HRESULT ParseGlobal(HGLOBAL hglobalHTML, DWORD dwFlags, IMarkupContainer* ppContainerResult, IMarkupPointer pPointerStart, IMarkupPointer pPointerFinish);
	HRESULT IsScopedElement(IHTMLElement pElement, BOOL* pfScoped);
	HRESULT GetElementTagId(IHTMLElement pElement, ELEMENT_TAG_ID* ptagId);
	HRESULT GetTagIDForName(BSTR bstrName, ELEMENT_TAG_ID* ptagId);
	HRESULT GetNameForTagID(ELEMENT_TAG_ID tagId, BSTR* pbstrName);
	HRESULT MovePointersToRange(IHTMLTxtRange pIRange, IMarkupPointer pPointerStart, IMarkupPointer pPointerFinish);
	HRESULT MoveRangeToPointers(IMarkupPointer pPointerStart, IMarkupPointer pPointerFinish, IHTMLTxtRange pIRange);
	HRESULT BeginUndoUnit(OLECHAR* pchTitle);
	HRESULT EndUndoUnit();
}

//extern extern(C) const IID IID_IMarkupServices2;
mixin DEFINE_IID!(IMarkupServices2, "3050f682-98b5-11cf-bb82-00aa00bdce0b");
interface IMarkupServices2 : IMarkupServices {
public extern(Windows):
	HRESULT ParseGlobalEx(HGLOBAL hglobalHTML, DWORD dwFlags, IMarkupContainer pContext, IMarkupContainer* ppContainerResult, IMarkupPointer pPointerStart, IMarkupPointer pPointerFinish);
	HRESULT ValidateElements(IMarkupPointer pPointerStart, IMarkupPointer pPointerFinish, IMarkupPointer pPointerTarget, IMarkupPointer pPointerStatus, IHTMLElement* ppElemFailBottom, IHTMLElement* ppElemFailTop);
	HRESULT SaveSegmentsToClipboard(ISegmentList pSegmentList, DWORD dwFlags);
}

//extern extern(C) const IID IID_IHTMLChangePlayback;
mixin DEFINE_IID!(IHTMLChangePlayback, "3050f6e0-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLChangePlayback : IUnknown {
public extern(Windows):
	HRESULT ExecChange(BYTE* pbRecord, BOOL fForward);
}

//extern extern(C) const IID IID_IMarkupPointer2;
mixin DEFINE_IID!(IMarkupPointer2, "3050f675-98b5-11cf-bb82-00aa00bdce0b");
interface IMarkupPointer2 : IMarkupPointer {
public extern(Windows):
	HRESULT IsAtWordBreak(BOOL* pfAtBreak);
	HRESULT GetMarkupPosition(int* plMP);
	HRESULT MoveToMarkupPosition(IMarkupContainer pContainer, int lMP);
	HRESULT MoveUnitBounded(MOVEUNIT_ACTION muAction, IMarkupPointer pIBoundary);
	HRESULT IsInsideURL(IMarkupPointer pRight, BOOL* pfResult);
	HRESULT MoveToContent(IHTMLElement pIElement, BOOL fAtStart);
}

//extern extern(C) const IID IID_IMarkupTextFrags;
mixin DEFINE_IID!(IMarkupTextFrags, "3050f5fa-98b5-11cf-bb82-00aa00bdce0b");
interface IMarkupTextFrags : IUnknown {
public extern(Windows):
	HRESULT GetTextFragCount(int* pcFrags);
	HRESULT GetTextFrag(int iFrag, BSTR* pbstrFrag, IMarkupPointer pPointerFrag);
	HRESULT RemoveTextFrag(int iFrag);
	HRESULT InsertTextFrag(int iFrag, BSTR bstrInsert, IMarkupPointer pPointerInsert);
	HRESULT FindTextFragFromMarkupPointer(IMarkupPointer pPointerFind, int* piFrag, BOOL* pfFragFound);
}

//extern extern(C) const IID IID_IXMLGenericParse;
mixin DEFINE_IID!(IXMLGenericParse, "E4E23071-4D07-11d2-AE76-0080C73BC199");
interface IXMLGenericParse : IUnknown {
public extern(Windows):
	HRESULT SetGenericParse(VARIANT_BOOL fDoGeneric);
}

//extern extern(C) const IID IID_IHTMLEditHost;
mixin DEFINE_IID!(IHTMLEditHost, "3050f6a0-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLEditHost : IUnknown {
public extern(Windows):
	HRESULT SnapRect(IHTMLElement pIElement, RECT* prcNew, ELEMENT_CORNER eHandle);
}

//extern extern(C) const IID IID_IHTMLEditHost2;
mixin DEFINE_IID!(IHTMLEditHost2, "3050f848-98b5-11cf-bb82-00aa00bdce0d");
interface IHTMLEditHost2 : IHTMLEditHost {
public extern(Windows):
	HRESULT PreDrag();
}

//extern extern(C) const IID IID_ISequenceNumber;
mixin DEFINE_IID!(ISequenceNumber, "3050f6c1-98b5-11cf-bb82-00aa00bdce0b");
interface ISequenceNumber : IUnknown {
public extern(Windows):
	HRESULT GetSequenceNumber(int nCurrent, int* pnNew);
}

//extern extern(C) const IID IID_IIMEServices;
mixin DEFINE_IID!(IIMEServices, "3050f6ca-98b5-11cf-bb82-00aa00bdce0b");
interface IIMEServices : IUnknown {
public extern(Windows):
	HRESULT GetActiveIMM(IActiveIMMApp* ppActiveIMM);
}

//extern extern(C) const IID IID_ISelectionServicesListener;
mixin DEFINE_IID!(ISelectionServicesListener, "3050f699-98b5-11cf-bb82-00aa00bdce0b");
interface ISelectionServicesListener : IUnknown {
public extern(Windows):
	HRESULT BeginSelectionUndo();
	HRESULT EndSelectionUndo();
	HRESULT OnSelectedElementExit(IMarkupPointer pIElementStart, IMarkupPointer pIElementEnd, IMarkupPointer pIElementContentStart, IMarkupPointer pIElementContentEnd);
	HRESULT OnChangeType(SELECTION_TYPE eType, ISelectionServicesListener pIListener);
	HRESULT GetTypeDetail(BSTR* pTypeDetail);
}

//extern extern(C) const IID IID_ISelectionServices;
mixin DEFINE_IID!(ISelectionServices, "3050f684-98b5-11cf-bb82-00aa00bdce0b");
interface ISelectionServices : IUnknown {
public extern(Windows):
	HRESULT SetSelectionType(SELECTION_TYPE eType, ISelectionServicesListener pIListener);
	HRESULT GetMarkupContainer(IMarkupContainer* ppIContainer);
	HRESULT AddSegment(IMarkupPointer pIStart, IMarkupPointer pIEnd, ISegment* ppISegmentAdded);
	HRESULT AddElementSegment(IHTMLElement pIElement,IElementSegment* ppISegmentAdded);
	HRESULT RemoveSegment(ISegment pISegment);
	HRESULT GetSelectionServicesListener(ISelectionServicesListener* ppISelectionServicesListener);
}

//extern extern(C) const IID IID_IHTMLEditDesigner;
mixin DEFINE_IID!(IHTMLEditDesigner, "3050f662-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLEditDesigner : IUnknown {
public extern(Windows):
	HRESULT PreHandleEvent(DISPID inEvtDispId, IHTMLEventObj pIEventObj);
	HRESULT PostHandleEvent(DISPID inEvtDispId, IHTMLEventObj pIEventObj);
	HRESULT TranslateAccelerator(DISPID inEvtDispId, IHTMLEventObj pIEventObj);
	HRESULT PostEditorEventNotify(DISPID inEvtDispId, IHTMLEventObj pIEventObj);
}

//extern extern(C) const IID IID_IHTMLEditServices;
mixin DEFINE_IID!(IHTMLEditServices, "3050f663-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLEditServices : IUnknown {
public extern(Windows):
	HRESULT AddDesigner(IHTMLEditDesigner pIDesigner);
	HRESULT RemoveDesigner(IHTMLEditDesigner pIDesigner);
	HRESULT GetSelectionServices(IMarkupContainer pIContainer, ISelectionServices* ppSelSvc);
	HRESULT MoveToSelectionAnchor(IMarkupPointer pIStartAnchor);
	HRESULT MoveToSelectionEnd(IMarkupPointer pIEndAnchor);
	HRESULT SelectRange(IMarkupPointer pStart, IMarkupPointer pEnd, SELECTION_TYPE eType);
}

//extern extern(C) const IID IID_IHTMLEditServices2;
mixin DEFINE_IID!(IHTMLEditServices2, "3050f812-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLEditServices2 : IHTMLEditServices {
public extern(Windows):
	HRESULT MoveToSelectionAnchorEx(IDisplayPointer pIStartAnchor);
	HRESULT MoveToSelectionEndEx(IDisplayPointer pIEndAnchor);
	HRESULT FreezeVirtualCaretPos(BOOL fReCompute);
	HRESULT UnFreezeVirtualCaretPos(BOOL fReset);
}

//extern extern(C) const IID IID_IHTMLComputedStyle;
mixin DEFINE_IID!(IHTMLComputedStyle, "3050f6c3-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLComputedStyle : IUnknown {
public extern(Windows):
	HRESULT get_bold(VARIANT_BOOL* p);
	HRESULT get_italic(VARIANT_BOOL* p);
	HRESULT get_underline(VARIANT_BOOL* p);
	HRESULT get_overline(VARIANT_BOOL* p);
	HRESULT get_strikeOut(VARIANT_BOOL* p);
	HRESULT get_subScript(VARIANT_BOOL* p);
	HRESULT get_superScript(VARIANT_BOOL* p);
	HRESULT get_explicitFace(VARIANT_BOOL* p);
	HRESULT get_fontWeight(int* p);
	HRESULT get_fontSize(int* p);
	HRESULT get_fontName(TCHAR* p);
	HRESULT get_hasBgColor(VARIANT_BOOL* p);
	HRESULT get_textColor(DWORD* p);
	HRESULT get_backgroundColor(DWORD* p);
	HRESULT get_preFormatted(VARIANT_BOOL* p);
	HRESULT get_direction(VARIANT_BOOL* p);
	HRESULT get_blockDirection(VARIANT_BOOL* p);
	HRESULT get_OL(VARIANT_BOOL* p);
	HRESULT IsEqual(IHTMLComputedStyle pComputedStyle, VARIANT_BOOL* pfEqual);
}

//extern extern(C) const CLSID CLSID_HtmlDlgSafeHelper;
mixin DEFINE_GUID!("CLSID_HtmlDlgSafeHelper", "3050f819-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const CLSID CLSID_BlockFormats;
mixin DEFINE_GUID!("CLSID_BlockFormats", "3050f831-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const CLSID CLSID_FontNames;
mixin DEFINE_GUID!("CLSID_FontNames", "3050f83a-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_HTMLNamespaceEvents;
mixin DEFINE_GUID!("DIID_HTMLNamespaceEvents", "3050f6bd-98b5-11cf-bb82-00aa00bdce0b");
interface HTMLNamespaceEvents : IDispatch {
}

//extern extern(C) const IID IID_IHTMLNamespace;
mixin DEFINE_IID!(IHTMLNamespace, "3050f6bb-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLNamespace : IDispatch {
public extern(Windows):
	HRESULT get_name(BSTR* p);
	HRESULT get_urn(BSTR* p);
	HRESULT get_tagNames(IDispatch* p);
	HRESULT get_readyState(VARIANT* p);
	HRESULT put_onreadystatechange(VARIANT v);
	HRESULT get_onreadystatechange(VARIANT* p);
	HRESULT doImport(BSTR bstrImplementationUrl);
	HRESULT attachEvent(BSTR event, IDispatch pDisp, VARIANT_BOOL* pfResult);
	HRESULT detachEvent(BSTR event, IDispatch pDisp);
}

//extern extern(C) const IID IID_IHTMLNamespaceCollection;
mixin DEFINE_IID!(IHTMLNamespaceCollection, "3050f6b8-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLNamespaceCollection : IDispatch {
public extern(Windows):
	HRESULT get_length(int* p);
	HRESULT item(VARIANT index, IDispatch* ppNamespace);
	HRESULT add(BSTR bstrNamespace, BSTR bstrUrn, VARIANT implementationUrl, IDispatch* ppNamespace);
}

//extern extern(C) const IID DIID_DispHTMLNamespace;
mixin DEFINE_GUID!("DIID_DispHTMLNamespace", "3050f54f-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLNamespace : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLNamespace;
mixin DEFINE_GUID!("CLSID_HTMLNamespace", "3050f6bc-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispHTMLNamespaceCollection;
mixin DEFINE_GUID!("DIID_DispHTMLNamespaceCollection", "3050f550-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLNamespaceCollection : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLNamespaceCollection;
mixin DEFINE_GUID!("CLSID_HTMLNamespaceCollection", "3050f6b9-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLPainter;
mixin DEFINE_IID!(IHTMLPainter, "3050f6a6-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLPainter : IUnknown {
public extern(Windows):
	HRESULT Draw(RECT rcBounds, RECT rcUpdate, LONG lDrawFlags, HDC hdc, LPVOID pvDrawObject);
	HRESULT OnResize(SIZE size);
	HRESULT GetPainterInfo(HTML_PAINTER_INFO* pInfo);
	HRESULT HitTestPoint(POINT pt, BOOL* pbHit, LONG* plPartID);
}

//extern extern(C) const IID IID_IHTMLPaintSite;
mixin DEFINE_IID!(IHTMLPaintSite, "3050f6a7-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLPaintSite : IUnknown {
public extern(Windows):
	HRESULT InvalidatePainterInfo();
	HRESULT InvalidateRect(RECT* prcInvalid);
	HRESULT InvalidateRegion(HRGN rgnInvalid);
	HRESULT GetDrawInfo(LONG lFlags, HTML_PAINT_DRAW_INFO* pDrawInfo);
	HRESULT TransformGlobalToLocal(POINT ptGlobal, POINT* pptLocal);
	HRESULT TransformLocalToGlobal(POINT ptLocal, POINT* pptGlobal);
	HRESULT GetHitTestCookie(LONG* plCookie);
}

//extern extern(C) const IID IID_IHTMLPainterEventInfo;
mixin DEFINE_IID!(IHTMLPainterEventInfo, "3050f6df-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLPainterEventInfo : IUnknown {
public extern(Windows):
	HRESULT GetEventInfoFlags(int* plEventInfoFlags);
	HRESULT GetEventTarget(IHTMLElement* ppElement);
	HRESULT SetCursor(LONG lPartID);
	HRESULT StringFromPartID(LONG lPartID, BSTR* pbstrPart);
}

//extern extern(C) const IID IID_IHTMLPainterOverlay;
mixin DEFINE_IID!(IHTMLPainterOverlay, "3050f7e3-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLPainterOverlay : IUnknown {
public extern(Windows):
	HRESULT OnMove(RECT rcDevice);
}

//extern extern(C) const IID IID_IHTMLIPrintCollection;
mixin DEFINE_IID!(IHTMLIPrintCollection, "3050f6b5-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLIPrintCollection : IDispatch {
public extern(Windows):
	HRESULT get_length(int* p);
	HRESULT get__newEnum(IUnknown* p);
	HRESULT item(int index, IUnknown* ppIPrint);
}

//extern extern(C) const IID IID_IEnumPrivacyRecords;
mixin DEFINE_IID!(IEnumPrivacyRecords, "3050f844-98b5-11cf-bb82-00aa00bdce0b");
interface IEnumPrivacyRecords : IUnknown {
	public extern(Windows):
	HRESULT Reset();
	HRESULT GetSize(ULONG* pSize);
	HRESULT GetPrivacyImpacted(BOOL* pState);
	HRESULT Next(BSTR* pbstrUrl, BSTR* pbstrPolicyRef, LONG* pdwReserved, DWORD* pdwPrivacyFlags);
}

//extern extern(C) const IID IID_IWPCBlockedUrls;
mixin DEFINE_IID!(IWPCBlockedUrls, "30510413-98b5-11cf-bb82-00aa00bdce0b");
interface IWPCBlockedUrls : IUnknown {
public extern(Windows):
	HRESULT GetCount(DWORD* pdwCount);
	HRESULT GetUrl(DWORD dwIdx, BSTR* pbstrUrl);
}

//extern extern(C) const IID IID_IHTMLDOMConstructorCollection;
mixin DEFINE_IID!(IHTMLDOMConstructorCollection, "3051049c-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLDOMConstructorCollection : IDispatch {
public extern(Windows):
	HRESULT get_Attr(IDispatch* p);
	HRESULT get_BehaviorUrnsCollection(IDispatch* p);
	HRESULT get_BookmarkCollection(IDispatch* p);
	HRESULT get_CompatibleInfo(IDispatch* p);
	HRESULT get_CompatibleInfoCollection(IDispatch* p);
	HRESULT get_ControlRangeCollection(IDispatch* p);
	HRESULT get_CSSCurrentStyleDeclaration(IDispatch* p);
	HRESULT get_CSSRuleList(IDispatch* p);
	HRESULT get_CSSRuleStyleDeclaration(IDispatch* p);
	HRESULT get_CSSStyleDeclaration(IDispatch* p);
	HRESULT get_CSSStyleRule(IDispatch* p);
	HRESULT get_CSSStyleSheet(IDispatch* p);
	HRESULT get_DataTransfer(IDispatch* p);
	HRESULT get_DOMImplementation(IDispatch* p);
	HRESULT get_Element(IDispatch* p);
	HRESULT get_Event(IDispatch* p);
	HRESULT get_History(IDispatch* p);
	HRESULT get_HTCElementBehaviorDefaults(IDispatch* p);
	HRESULT get_HTMLAnchorElement(IDispatch* p);
	HRESULT get_HTMLAreaElement(IDispatch* p);
	HRESULT get_HTMLAreasCollection(IDispatch* p);
	HRESULT get_HTMLBaseElement(IDispatch* p);
	HRESULT get_HTMLBaseFontElement(IDispatch* p);
	HRESULT get_HTMLBGSoundElement(IDispatch* p);
	HRESULT get_HTMLBlockElement(IDispatch* p);
	HRESULT get_HTMLBodyElement(IDispatch* p);
	HRESULT get_HTMLBRElement(IDispatch* p);
	HRESULT get_HTMLButtonElement(IDispatch* p);
	HRESULT get_HTMLCollection(IDispatch* p);
	HRESULT get_HTMLCommentElement(IDispatch* p);
	HRESULT get_HTMLDDElement(IDispatch* p);
	HRESULT get_HTMLDivElement(IDispatch* p);
	HRESULT get_HTMLDocument(IDispatch* p);
	HRESULT get_HTMLDListElement(IDispatch* p);
	HRESULT get_HTMLDTElement(IDispatch* p);
	HRESULT get_HTMLEmbedElement(IDispatch* p);
	HRESULT get_HTMLFieldSetElement(IDispatch* p);
	HRESULT get_HTMLFontElement(IDispatch* p);
	HRESULT get_HTMLFormElement(IDispatch* p);
	HRESULT get_HTMLFrameElement(IDispatch* p);
	HRESULT get_HTMLFrameSetElement(IDispatch* p);
	HRESULT get_HTMLGenericElement(IDispatch* p);
	HRESULT get_HTMLHeadElement(IDispatch* p);
	HRESULT get_HTMLHeadingElement(IDispatch* p);
	HRESULT get_HTMLHRElement(IDispatch* p);
	HRESULT get_HTMLHtmlElement(IDispatch* p);
	HRESULT get_HTMLIFrameElement(IDispatch* p);
	HRESULT get_HTMLImageElement(IDispatch* p);
	HRESULT get_HTMLInputElement(IDispatch* p);
	HRESULT get_HTMLIsIndexElement(IDispatch* p);
	HRESULT get_HTMLLabelElement(IDispatch* p);
	HRESULT get_HTMLLegendElement(IDispatch* p);
	HRESULT get_HTMLLIElement(IDispatch* p);
	HRESULT get_HTMLLinkElement(IDispatch* p);
	HRESULT get_HTMLMapElement(IDispatch* p);
	HRESULT get_HTMLMarqueeElement(IDispatch* p);
	HRESULT get_HTMLMetaElement(IDispatch* p);
	HRESULT get_HTMLModelessDialog(IDispatch* p);
	HRESULT get_HTMLNamespaceInfo(IDispatch* p);
	HRESULT get_HTMLNamespaceInfoCollection(IDispatch* p);
	HRESULT get_HTMLNextIdElement(IDispatch* p);
	HRESULT get_HTMLNoShowElement(IDispatch* p);
	HRESULT get_HTMLObjectElement(IDispatch* p);
	HRESULT get_HTMLOListElement(IDispatch* p);
	HRESULT get_HTMLOptionElement(IDispatch* p);
	HRESULT get_HTMLParagraphElement(IDispatch* p);
	HRESULT get_HTMLParamElement(IDispatch* p);
	HRESULT get_HTMLPhraseElement(IDispatch* p);
	HRESULT get_HTMLPluginsCollection(IDispatch* p);
	HRESULT get_HTMLPopup(IDispatch* p);
	HRESULT get_HTMLScriptElement(IDispatch* p);
	HRESULT get_HTMLSelectElement(IDispatch* p);
	HRESULT get_HTMLSpanElement(IDispatch* p);
	HRESULT get_HTMLStyleElement(IDispatch* p);
	HRESULT get_HTMLTableCaptionElement(IDispatch* p);
	HRESULT get_HTMLTableCellElement(IDispatch* p);
	HRESULT get_HTMLTableColElement(IDispatch* p);
	HRESULT get_HTMLTableElement(IDispatch* p);
	HRESULT get_HTMLTableRowElement(IDispatch* p);
	HRESULT get_HTMLTableSectionElement(IDispatch* p);
	HRESULT get_HTMLTextAreaElement(IDispatch* p);
	HRESULT get_HTMLTextElement(IDispatch* p);
	HRESULT get_HTMLTitleElement(IDispatch* p);
	HRESULT get_HTMLUListElement(IDispatch* p);
	HRESULT get_HTMLUnknownElement(IDispatch* p);
	HRESULT get_Image(IDispatch* p);
	HRESULT get_Location(IDispatch* p);
	HRESULT get_NamedNodeMap(IDispatch* p);
	HRESULT get_Navigator(IDispatch* p);
	HRESULT get_NodeList(IDispatch* p);
	HRESULT get_Option(IDispatch* p);
	HRESULT get_Screen(IDispatch* p);
	HRESULT get_Selection(IDispatch* p);
	HRESULT get_StaticNodeList(IDispatch* p);
	HRESULT get_Storage(IDispatch* p);
	HRESULT get_StyleSheetList(IDispatch* p);
	HRESULT get_StyleSheetPage(IDispatch* p);
	HRESULT get_StyleSheetPageList(IDispatch* p);
	HRESULT get_Text(IDispatch* p);
	HRESULT get_TextRange(IDispatch* p);
	HRESULT get_TextRangeCollection(IDispatch* p);
	HRESULT get_TextRectangle(IDispatch* p);
	HRESULT get_TextRectangleList(IDispatch* p);
	HRESULT get_Window(IDispatch* p);
	HRESULT get_XDomainRequest(IDispatch* p);
	HRESULT get_XMLHttpRequest(IDispatch* p);
}

//extern extern(C) const IID IID_IHTMLDialog;
mixin DEFINE_IID!(IHTMLDialog, "3050f216-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLDialog : IDispatch {
public extern(Windows):
	HRESULT put_dialogTop(VARIANT v);
	HRESULT get_dialogTop(VARIANT* p);
	HRESULT put_dialogLeft(VARIANT v);
	HRESULT get_dialogLeft(VARIANT* p);
	HRESULT put_dialogWidth(VARIANT v);
	HRESULT get_dialogWidth(VARIANT* p);
	HRESULT put_dialogHeight(VARIANT v);
	HRESULT get_dialogHeight(VARIANT* p);
	HRESULT get_dialogArguments(VARIANT* p);
	HRESULT get_menuArguments(VARIANT* p);
	HRESULT put_returnValue(VARIANT v);
	HRESULT get_returnValue(VARIANT* p);
	HRESULT close();
	HRESULT toString(BSTR* String);
}

//extern extern(C) const IID IID_IHTMLDialog2;
mixin DEFINE_IID!(IHTMLDialog2, "3050f5e0-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLDialog2 : IDispatch {
public extern(Windows):
	HRESULT put_status(BSTR v);
	HRESULT get_status(BSTR* p);
	HRESULT put_resizable(BSTR v);
	HRESULT get_resizable(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLDialog3;
mixin DEFINE_IID!(IHTMLDialog3, "3050f388-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLDialog3 : IDispatch {
public extern(Windows):
	HRESULT put_unadorned(BSTR v);
	HRESULT get_unadorned(BSTR* p);
	HRESULT put_dialogHide(BSTR v);
	HRESULT get_dialogHide(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLModelessInit;
mixin DEFINE_IID!(IHTMLModelessInit, "3050f5e4-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLModelessInit : IDispatch {
public extern(Windows):
	HRESULT get_parameters(VARIANT* p);
	HRESULT get_optionString(VARIANT* p);
	HRESULT get_moniker(IUnknown* p);
	HRESULT get_document(IUnknown* p);
}

//extern extern(C) const CLSID CLSID_ThreadDialogProcParam;
mixin DEFINE_GUID!("CLSID_ThreadDialogProcParam", "3050f5eb-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const CLSID CLSID_HTMLDialog;
mixin DEFINE_GUID!("CLSID_HTMLDialog", "3050f28a-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLPopup;
mixin DEFINE_IID!(IHTMLPopup, "3050f666-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLPopup : IDispatch {
public extern(Windows):
	HRESULT show(int x, int y, int w, int h, VARIANT* pElement);
	HRESULT hide();
	HRESULT get_document(IHTMLDocument* p);
	HRESULT get_isOpen(VARIANT_BOOL* p);
}

//extern extern(C) const IID DIID_DispHTMLPopup;
mixin DEFINE_GUID!("DIID_DispHTMLPopup", "3050f589-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLPopup : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLPopup;
mixin DEFINE_GUID!("CLSID_HTMLPopup", "3050f667-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IHTMLAppBehavior;
mixin DEFINE_IID!(IHTMLAppBehavior, "3050f5ca-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLAppBehavior : IDispatch {
public extern(Windows):
	HRESULT put_applicationName(BSTR v);
	HRESULT get_applicationName(BSTR* p);
	HRESULT put_version(BSTR v);
	HRESULT get_version(BSTR* p);
	HRESULT put_icon(BSTR v);
	HRESULT get_icon(BSTR* p);
	HRESULT put_singleInstance(BSTR v);
	HRESULT get_singleInstance(BSTR* p);
	HRESULT put_minimizeButton(BSTR v);
	HRESULT get_minimizeButton(BSTR* p);
	HRESULT put_maximizeButton(BSTR v);
	HRESULT get_maximizeButton(BSTR* p);
	HRESULT put_border(BSTR v);
	HRESULT get_border(BSTR* p);
	HRESULT put_borderStyle(BSTR v);
	HRESULT get_borderStyle(BSTR* p);
	HRESULT put_sysMenu(BSTR v);
	HRESULT get_sysMenu(BSTR* p);
	HRESULT put_caption(BSTR v);
	HRESULT get_caption(BSTR* p);
	HRESULT put_windowState(BSTR v);
	HRESULT get_windowState(BSTR* p);
	HRESULT put_showInTaskBar(BSTR v);
	HRESULT get_showInTaskBar(BSTR* p);
	HRESULT get_commandLine(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLAppBehavior2;
mixin DEFINE_IID!(IHTMLAppBehavior2, "3050f5c9-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLAppBehavior2 : IDispatch {
public extern(Windows):
	HRESULT put_contextMenu(BSTR v);
	HRESULT get_contextMenu(BSTR* p);
	HRESULT put_innerBorder(BSTR v);
	HRESULT get_innerBorder(BSTR* p);
	HRESULT put_scroll(BSTR v);
	HRESULT get_scroll(BSTR* p);
	HRESULT put_scrollFlat(BSTR v);
	HRESULT get_scrollFlat(BSTR* p);
	HRESULT put_selection(BSTR v);
	HRESULT get_selection(BSTR* p);
}

//extern extern(C) const IID IID_IHTMLAppBehavior3;
mixin DEFINE_IID!(IHTMLAppBehavior3, "3050f5cd-98b5-11cf-bb82-00aa00bdce0b");
interface IHTMLAppBehavior3 : IDispatch {
public extern(Windows):
	HRESULT put_navigable(BSTR v);
	HRESULT get_navigable(BSTR* p);
}

//extern extern(C) const IID DIID_DispHTMLAppBehavior;
mixin DEFINE_GUID!("DIID_DispHTMLAppBehavior", "3050f57c-98b5-11cf-bb82-00aa00bdce0b");
interface DispHTMLAppBehavior : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLAppBehavior;
mixin DEFINE_GUID!("CLSID_HTMLAppBehavior", "3050f5cb-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const CLSID CLSID_OldHTMLDocument;
mixin DEFINE_GUID!("CLSID_OldHTMLDocument", "D48A6EC9-6A4A-11CF-94A7-444553540000");

//extern extern(C) const CLSID CLSID_OldHTMLFormElement;
mixin DEFINE_GUID!("CLSID_OldHTMLFormElement", "0D04D285-6BEC-11CF-8B97-00AA00476DA6");

//extern extern(C) const IID DIID_DispIHTMLInputButtonElement;
mixin DEFINE_GUID!("DIID_DispIHTMLInputButtonElement", "3050f51e-98b5-11cf-bb82-00aa00bdce0b");
interface DispIHTMLInputButtonElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLInputButtonElement;
mixin DEFINE_GUID!("CLSID_HTMLInputButtonElement", "3050f2b4-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispIHTMLInputTextElement;
mixin DEFINE_GUID!("DIID_DispIHTMLInputTextElement", "3050f520-98b5-11cf-bb82-00aa00bdce0b");
interface DispIHTMLInputTextElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLInputTextElement;
mixin DEFINE_GUID!("CLSID_HTMLInputTextElement", "3050f2ab-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispIHTMLInputFileElement;
mixin DEFINE_GUID!("DIID_DispIHTMLInputFileElement", "3050f542-98b5-11cf-bb82-00aa00bdce0b");
interface DispIHTMLInputFileElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLInputFileElement;
mixin DEFINE_GUID!("CLSID_HTMLInputFileElement", "3050f2ae-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispIHTMLOptionButtonElement;
mixin DEFINE_GUID!("DIID_DispIHTMLOptionButtonElement", "3050f509-98b5-11cf-bb82-00aa00bdce0b");
interface DispIHTMLOptionButtonElement : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLOptionButtonElement;
mixin DEFINE_GUID!("CLSID_HTMLOptionButtonElement", "3050f2be-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID DIID_DispIHTMLInputImage;
mixin DEFINE_GUID!("DIID_DispIHTMLInputImage", "3050f51d-98b5-11cf-bb82-00aa00bdce0b");
interface DispIHTMLInputImage : IDispatch {
}

//extern extern(C) const CLSID CLSID_HTMLInputImage;
mixin DEFINE_GUID!("CLSID_HTMLInputImage", "3050f2c4-98b5-11cf-bb82-00aa00bdce0b");

//extern extern(C) const IID IID_IElementNamespace;
mixin DEFINE_IID!(IElementNamespace, "3050f671-98b5-11cf-bb82-00aa00bdce0b");
interface IElementNamespace : IUnknown {
public extern(Windows):
	HRESULT AddTag(BSTR bstrTagName, LONG lFlags);
}

//extern extern(C) const IID IID_IElementNamespaceTable;
mixin DEFINE_IID!(IElementNamespaceTable, "3050f670-98b5-11cf-bb82-00aa00bdce0b");
interface IElementNamespaceTable : IUnknown {
public extern(Windows):
	HRESULT AddNamespace(BSTR bstrNamespace, BSTR bstrUrn, LONG lFlags, VARIANT* pvarFactory);
}

//extern extern(C) const IID IID_IElementNamespaceFactory;
mixin DEFINE_IID!(IElementNamespaceFactory, "3050f672-98b5-11cf-bb82-00aa00bdce0b");
interface IElementNamespaceFactory : IUnknown {
public extern(Windows):
	HRESULT Create(IElementNamespace pNamespace);
}

//extern extern(C) const IID IID_IElementNamespaceFactory2;
mixin DEFINE_IID!(IElementNamespaceFactory2, "3050f805-98b5-11cf-bb82-00aa00bdce0b");
interface IElementNamespaceFactory2 : IElementNamespaceFactory {
public extern(Windows):
	HRESULT CreateWithImplementation(IElementNamespace pNamespace, BSTR bstrImplementation);
}

//extern extern(C) const IID IID_IElementNamespaceFactoryCallback;
mixin DEFINE_IID!(IElementNamespaceFactoryCallback, "3050f7fd-98b5-11cf-bb82-00aa00bdce0b");
interface IElementNamespaceFactoryCallback : IUnknown {
public extern(Windows):
	HRESULT Resolve(BSTR bstrNamespace, BSTR bstrTagName, BSTR bstrAttrs, IElementNamespace pNamespace);
}

//extern extern(C) const IID IID_IElementBehaviorSiteOM2;
mixin DEFINE_IID!(IElementBehaviorSiteOM2, "3050f659-98b5-11cf-bb82-00aa00bdce0b");
interface IElementBehaviorSiteOM2 : IElementBehaviorSiteOM {
public extern(Windows):
	HRESULT GetDefaults(IHTMLElementDefaults* ppDefaults);
}

//extern extern(C) const IID IID_IElementBehaviorCategory;
mixin DEFINE_IID!(IElementBehaviorCategory, "3050f4ed-98b5-11cf-bb82-00aa00bdce0b");
interface IElementBehaviorCategory : IUnknown {
public extern(Windows):
	HRESULT GetCategory(LPOLESTR* ppchCategory);
}

//extern extern(C) const IID IID_IElementBehaviorSiteCategory;
mixin DEFINE_IID!(IElementBehaviorSiteCategory, "3050f4ee-98b5-11cf-bb82-00aa00bdce0b");
interface IElementBehaviorSiteCategory : IUnknown {
public extern(Windows):
	HRESULT GetRelatedBehaviors(LONG lDirection, LPOLESTR pchCategory, IEnumUnknown* ppEnumerator);
}

//extern extern(C) const IID IID_IElementBehaviorSubmit;
mixin DEFINE_IID!(IElementBehaviorSubmit, "3050f646-98b5-11cf-bb82-00aa00bdce0b");
interface IElementBehaviorSubmit : IUnknown {
public extern(Windows):
	HRESULT GetSubmitInfo(IHTMLSubmitData pSubmitData);
	HRESULT Reset();
}

//extern extern(C) const IID IID_IElementBehaviorFocus;
mixin DEFINE_IID!(IElementBehaviorFocus, "3050f6b6-98b5-11cf-bb82-00aa00bdce0b");
interface IElementBehaviorFocus : IUnknown {
public extern(Windows):
	HRESULT GetFocusRect(RECT* pRect);
}

//extern extern(C) const IID IID_IElementBehaviorLayout;
mixin DEFINE_IID!(IElementBehaviorLayout, "3050f6ba-98b5-11cf-bb82-00aa00bdce0b");
interface IElementBehaviorLayout : IUnknown {
public extern(Windows):
	HRESULT GetSize(LONG dwFlags, SIZE sizeContent, POINT* pptTranslateBy, POINT* pptTopLeft, SIZE* psizeProposed);
	HRESULT GetLayoutInfo(LONG* plLayoutInfo);
	HRESULT GetPosition(LONG lFlags, POINT* pptTopLeft);
	HRESULT MapSize(SIZE* psizeIn, RECT* prcOut);
}

//extern extern(C) const IID IID_IElementBehaviorLayout2;
mixin DEFINE_IID!(IElementBehaviorLayout2, "3050f846-98b5-11cf-bb82-00aa00bdce0b");
interface IElementBehaviorLayout2 : IUnknown {
public extern(Windows):
	HRESULT GetTextDescent(LONG* plDescent);
}

//extern extern(C) const IID IID_IElementBehaviorSiteLayout;
mixin DEFINE_IID!(IElementBehaviorSiteLayout, "3050f6b7-98b5-11cf-bb82-00aa00bdce0b");
interface IElementBehaviorSiteLayout : IUnknown {
public extern(Windows):
	HRESULT InvalidateLayoutInfo();
	HRESULT InvalidateSize();
	HRESULT GetMediaResolution(SIZE* psizeResolution);
}

//extern extern(C) const IID IID_IElementBehaviorSiteLayout2;
mixin DEFINE_IID!(IElementBehaviorSiteLayout2, "3050f847-98b5-11cf-bb82-00aa00bdce0b");
interface IElementBehaviorSiteLayout2 : IUnknown {
public extern(Windows):
	HRESULT GetFontInfo(LOGFONTW* plf);
}

//extern extern(C) const IID IID_IHostBehaviorInit;
mixin DEFINE_IID!(IHostBehaviorInit, "3050f842-98b5-11cf-bb82-00aa00bdce0b");
interface IHostBehaviorInit : IUnknown {
public extern(Windows):
	HRESULT PopulateNamespaceTable();
}

export extern(Windows){
	uint VARIANT_UserSize(uint*, uint, VARIANT*);
	ubyte* VARIANT_UserMarshal(uint*, ubyte*, VARIANT*);
	ubyte* VARIANT_UserUnmarshal(uint*, ubyte*, VARIANT*);
	void VARIANT_UserFree(uint*, VARIANT*);

	uint VARIANT_UserSize64(uint*, uint, VARIANT*);
	ubyte* VARIANT_UserMarshal64(uint*, ubyte*, VARIANT*);
	ubyte* VARIANT_UserUnmarshal64(uint*, ubyte*, VARIANT*);
	void VARIANT_UserFree64(uint*, VARIANT*);
}

}// extern(C)

