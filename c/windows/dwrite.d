/** dwrite.d

Converted from 'dwrite.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.dwrite;


import c.windows.windef;
import c.windows.dcommon;
import c.windows.guiddef;
import c.windows.unknwn;
import c.windows.winerror;
import c.windows.wingdi;
import c.windows.d2d1;


enum {
	DWRITE_FONT_FILE_TYPE_UNKNOWN,
	DWRITE_FONT_FILE_TYPE_CFF,
	DWRITE_FONT_FILE_TYPE_TRUETYPE,
	DWRITE_FONT_FILE_TYPE_TRUETYPE_COLLECTION,
	DWRITE_FONT_FILE_TYPE_TYPE1_PFM,
	DWRITE_FONT_FILE_TYPE_TYPE1_PFB,
	DWRITE_FONT_FILE_TYPE_VECTOR,
	DWRITE_FONT_FILE_TYPE_BITMAP
}
alias int DWRITE_FONT_FILE_TYPE;

enum {
	DWRITE_FONT_FACE_TYPE_CFF,
	DWRITE_FONT_FACE_TYPE_TRUETYPE,
	DWRITE_FONT_FACE_TYPE_TRUETYPE_COLLECTION,
	DWRITE_FONT_FACE_TYPE_TYPE1,
	DWRITE_FONT_FACE_TYPE_VECTOR,
	DWRITE_FONT_FACE_TYPE_BITMAP,
	DWRITE_FONT_FACE_TYPE_UNKNOWN
}
alias int DWRITE_FONT_FACE_TYPE;

enum {
	DWRITE_FONT_SIMULATIONS_NONE    = 0x0000,
	DWRITE_FONT_SIMULATIONS_BOLD    = 0x0001,
	DWRITE_FONT_SIMULATIONS_OBLIQUE = 0x0002
}
alias int DWRITE_FONT_SIMULATIONS;

enum {
	DWRITE_FONT_WEIGHT_THIN        = 100,
	DWRITE_FONT_WEIGHT_EXTRA_LIGHT = 200,
	DWRITE_FONT_WEIGHT_ULTRA_LIGHT = 200,
	DWRITE_FONT_WEIGHT_LIGHT       = 300,
	DWRITE_FONT_WEIGHT_NORMAL      = 400,
	DWRITE_FONT_WEIGHT_REGULAR     = 400,
	DWRITE_FONT_WEIGHT_MEDIUM      = 500,
	DWRITE_FONT_WEIGHT_DEMI_BOLD   = 600,
	DWRITE_FONT_WEIGHT_SEMI_BOLD   = 600,
	DWRITE_FONT_WEIGHT_BOLD        = 700,
	DWRITE_FONT_WEIGHT_EXTRA_BOLD  = 800,
	DWRITE_FONT_WEIGHT_ULTRA_BOLD  = 800,
	DWRITE_FONT_WEIGHT_BLACK       = 900,
	DWRITE_FONT_WEIGHT_HEAVY       = 900,
	DWRITE_FONT_WEIGHT_EXTRA_BLACK = 950,
	DWRITE_FONT_WEIGHT_ULTRA_BLACK = 950
}
alias int DWRITE_FONT_WEIGHT;

enum {
	DWRITE_FONT_STRETCH_UNDEFINED       = 0,
	DWRITE_FONT_STRETCH_ULTRA_CONDENSED = 1,
	DWRITE_FONT_STRETCH_EXTRA_CONDENSED = 2,
	DWRITE_FONT_STRETCH_CONDENSED       = 3,
	DWRITE_FONT_STRETCH_SEMI_CONDENSED  = 4,
	DWRITE_FONT_STRETCH_NORMAL          = 5,
	DWRITE_FONT_STRETCH_MEDIUM          = 5,
	DWRITE_FONT_STRETCH_SEMI_EXPANDED   = 6,
	DWRITE_FONT_STRETCH_EXPANDED        = 7,
	DWRITE_FONT_STRETCH_EXTRA_EXPANDED  = 8,
	DWRITE_FONT_STRETCH_ULTRA_EXPANDED  = 9
}
alias int DWRITE_FONT_STRETCH;

enum {
	DWRITE_FONT_STYLE_NORMAL,
	DWRITE_FONT_STYLE_OBLIQUE,
	DWRITE_FONT_STYLE_ITALIC
}
alias int DWRITE_FONT_STYLE;

enum {
	DWRITE_INFORMATIONAL_STRING_NONE,
	DWRITE_INFORMATIONAL_STRING_COPYRIGHT_NOTICE,
	DWRITE_INFORMATIONAL_STRING_VERSION_STRINGS,
	DWRITE_INFORMATIONAL_STRING_TRADEMARK,
	DWRITE_INFORMATIONAL_STRING_MANUFACTURER,
	DWRITE_INFORMATIONAL_STRING_DESIGNER,
	DWRITE_INFORMATIONAL_STRING_DESIGNER_URL,
	DWRITE_INFORMATIONAL_STRING_DESCRIPTION,
	DWRITE_INFORMATIONAL_STRING_FONT_VENDOR_URL,
	DWRITE_INFORMATIONAL_STRING_LICENSE_DESCRIPTION,
	DWRITE_INFORMATIONAL_STRING_LICENSE_INFO_URL,
	DWRITE_INFORMATIONAL_STRING_WIN32_FAMILY_NAMES,
	DWRITE_INFORMATIONAL_STRING_WIN32_SUBFAMILY_NAMES,
	DWRITE_INFORMATIONAL_STRING_PREFERRED_FAMILY_NAMES,
	DWRITE_INFORMATIONAL_STRING_PREFERRED_SUBFAMILY_NAMES,
	DWRITE_INFORMATIONAL_STRING_SAMPLE_TEXT
}
alias int DWRITE_INFORMATIONAL_STRING_ID;

struct DWRITE_FONT_METRICS {
	UINT16 designUnitsPerEm;
	UINT16 ascent;
	UINT16 descent;
	INT16 lineGap;
	UINT16 capHeight;
	UINT16 xHeight;
	INT16 underlinePosition;
	UINT16 underlineThickness;
	INT16 strikethroughPosition;
	UINT16 strikethroughThickness;
}

struct DWRITE_GLYPH_METRICS {
	INT32 leftSideBearing;
	UINT32 advanceWidth;
	INT32 rightSideBearing;
	INT32 topSideBearing;
	UINT32 advanceHeight;
	INT32 bottomSideBearing;
	INT32 verticalOriginY;
}

struct DWRITE_GLYPH_OFFSET {
	FLOAT advanceOffset;
	FLOAT ascenderOffset;
}

enum {
	DWRITE_FACTORY_TYPE_SHARED,
	DWRITE_FACTORY_TYPE_ISOLATED
}
alias int DWRITE_FACTORY_TYPE;

pure nothrow
DWORD DWRITE_MAKE_OPENTYPE_TAG(WCHAR a, WCHAR b, WCHAR c, WCHAR d)
{
	return ((cast(UINT32)(cast(UINT8)d) << 24) | (cast(UINT32)(cast(UINT8)c) << 16) | (cast(UINT32)(cast(UINT8)b) << 8) | cast(UINT32)(cast(UINT8)a));
}


interface IDWriteFontFileLoader : IUnknown {
public extern(Windows):
	HRESULT CreateStreamFromKey(const(void)* fontFileReferenceKey, UINT32 fontFileReferenceKeySize, IDWriteFontFileStream* fontFileStream);
}
mixin DEFINE_IID!(IDWriteFontFileLoader, "727cad4e-d6af-4c9e-8a08-d695b11caa49");

interface IDWriteLocalFontFileLoader : IDWriteFontFileLoader {
public extern(Windows):
	HRESULT GetFilePathLengthFromKey(const(void)* fontFileReferenceKey, UINT32 fontFileReferenceKeySize, UINT32* filePathLength);
	HRESULT GetFilePathFromKey(const(void)* fontFileReferenceKey, UINT32 fontFileReferenceKeySize, WCHAR* filePath, UINT32 filePathSize);
	HRESULT GetLastWriteTimeFromKey(const(void)* fontFileReferenceKey, UINT32 fontFileReferenceKeySize, FILETIME* lastWriteTime);
}
mixin DEFINE_IID!(IDWriteLocalFontFileLoader, "b2d9f3ec-c9fe-4a11-a2ec-d86208f7c0a2");

interface IDWriteFontFileStream : IUnknown {
public extern(Windows):
	HRESULT ReadFileFragment(const(void)** fragmentStart, UINT64 fileOffset, UINT64 fragmentSize, void** fragmentContext);
	void ReleaseFileFragment(void* fragmentContext);
	HRESULT GetFileSize(UINT64* fileSize);
	HRESULT GetLastWriteTime(UINT64* lastWriteTime);
}
mixin DEFINE_IID!(IDWriteFontFileStream, "6d4865fe-0ab8-4d91-8f62-5dd6be34a3e0");

interface IDWriteFontFile : IUnknown {
public extern(Windows):
	HRESULT GetReferenceKey(const(void)** fontFileReferenceKey, UINT32* fontFileReferenceKeySize);
	HRESULT GetLoader(IDWriteFontFileLoader* fontFileLoader);
	HRESULT Analyze(BOOL* isSupportedFontType, DWRITE_FONT_FILE_TYPE* fontFileType, DWRITE_FONT_FACE_TYPE* fontFaceType, UINT32* numberOfFaces);
}
mixin DEFINE_IID!(IDWriteFontFile, "739d886a-cef5-47dc-8769-1a8b41bebbb0");

enum {
	DWRITE_PIXEL_GEOMETRY_FLAT,
	DWRITE_PIXEL_GEOMETRY_RGB,
	DWRITE_PIXEL_GEOMETRY_BGR
}
alias int DWRITE_PIXEL_GEOMETRY;

enum {
	DWRITE_RENDERING_MODE_DEFAULT,
	DWRITE_RENDERING_MODE_ALIASED,
	DWRITE_RENDERING_MODE_CLEARTYPE_GDI_CLASSIC,
	DWRITE_RENDERING_MODE_CLEARTYPE_GDI_NATURAL,
	DWRITE_RENDERING_MODE_CLEARTYPE_NATURAL,
	DWRITE_RENDERING_MODE_CLEARTYPE_NATURAL_SYMMETRIC,
	DWRITE_RENDERING_MODE_OUTLINE
}
alias int DWRITE_RENDERING_MODE;

struct DWRITE_MATRIX {
	FLOAT m11;
	FLOAT m12;
	FLOAT m21;
	FLOAT m22;
	FLOAT dx;
	FLOAT dy;
}

interface IDWriteRenderingParams : IUnknown {
public extern(Windows):
	FLOAT GetGamma();
	FLOAT GetEnhancedContrast();
	FLOAT GetClearTypeLevel();
	DWRITE_PIXEL_GEOMETRY GetPixelGeometry();
	DWRITE_RENDERING_MODE GetRenderingMode();
}
mixin DEFINE_IID!(IDWriteRenderingParams, "2f0da53a-2add-47cd-82ee-d9ec34688e75");

alias ID2D1SimplifiedGeometrySink IDWriteGeometrySink;

interface IDWriteFontFace : IUnknown {
public extern(Windows):
	DWRITE_FONT_FACE_TYPE GetType();
	HRESULT GetFiles(UINT32* numberOfFiles, IDWriteFontFile* fontFiles);
	UINT32 GetIndex();
	DWRITE_FONT_SIMULATIONS GetSimulations();
	BOOL IsSymbolFont();
	void GetMetrics(DWRITE_FONT_METRICS* fontFaceMetrics);
	UINT16 GetGlyphCount();
	HRESULT GetDesignGlyphMetrics(const(UINT16)* glyphIndices, UINT32 glyphCount, DWRITE_GLYPH_METRICS* glyphMetrics, BOOL isSideways = FALSE);
	HRESULT GetGlyphIndices(const(UINT32)* codePoints, UINT32 codePointCount, UINT16* glyphIndices);
	HRESULT TryGetFontTable(UINT32 openTypeTableTag, const(void)** tableData, UINT32* tableSize, void** tableContext, BOOL* exists);
	void ReleaseFontTable(void* tableContext);
	HRESULT GetGlyphRunOutline(FLOAT emSize, const(UINT16)* glyphIndices, const(FLOAT)* glyphAdvances, const(DWRITE_GLYPH_OFFSET)* glyphOffsets, UINT32 glyphCount, BOOL isSideways, BOOL isRightToLeft, IDWriteGeometrySink geometrySink);
	HRESULT GetRecommendedRenderingMode(FLOAT emSize, FLOAT pixelsPerDip, DWRITE_MEASURING_MODE measuringMode, IDWriteRenderingParams renderingParams, DWRITE_RENDERING_MODE* renderingMode);
	HRESULT GetGdiCompatibleMetrics(FLOAT emSize, FLOAT pixelsPerDip, const(DWRITE_MATRIX)* transform, DWRITE_FONT_METRICS* fontFaceMetrics);
	HRESULT GetGdiCompatibleGlyphMetrics(FLOAT emSize, FLOAT pixelsPerDip, const(DWRITE_MATRIX)* transform, BOOL useGdiNatural, const(UINT16)* glyphIndices, UINT32 glyphCount, DWRITE_GLYPH_METRICS* glyphMetrics, BOOL isSideways = FALSE);
}
mixin DEFINE_IID!(IDWriteFontFace, "5f49804d-7024-4d43-bfa9-d25984f53849");

interface IDWriteFontCollectionLoader : IUnknown {
public extern(Windows):
	HRESULT CreateEnumeratorFromKey(IDWriteFactory factory, const(void)* collectionKey, UINT32 collectionKeySize, IDWriteFontFileEnumerator* fontFileEnumerator);
}
mixin DEFINE_IID!(IDWriteFontCollectionLoader, "cca920e4-52f0-492b-bfa8-29c72ee0a468");

interface IDWriteFontFileEnumerator : IUnknown {
public extern(Windows):
	HRESULT MoveNext(BOOL* hasCurrentFile);
	HRESULT GetCurrentFontFile(IDWriteFontFile* fontFile);
}
mixin DEFINE_IID!(IDWriteFontFileEnumerator, "72755049-5ff7-435d-8348-4be97cfa6c7c");

interface IDWriteLocalizedStrings : IUnknown {
public extern(Windows):
 	UINT32 GetCount();
	HRESULT FindLocaleName(const(WCHAR)* localeName, UINT32* index, BOOL* exists);
	HRESULT GetLocaleNameLength(UINT32 index, UINT32* length);
	HRESULT GetLocaleName(UINT32 index, WCHAR* localeName, UINT32 size);
	HRESULT GetStringLength(UINT32 index, UINT32* length);
	HRESULT GetString(UINT32 index, WCHAR* stringBuffer, UINT32 size);
}
mixin DEFINE_IID!(IDWriteLocalizedStrings, "08256209-099a-4b34-b86d-c22b110e7771");

interface IDWriteFontCollection : IUnknown {
public extern(Windows):
	UINT32 GetFontFamilyCount();
	HRESULT GetFontFamily(UINT32 index, IDWriteFontFamily* fontFamily);
	HRESULT FindFamilyName(const(WCHAR)* familyName, UINT32* index, BOOL* exists);
	HRESULT GetFontFromFontFace(IDWriteFontFace fontFace, IDWriteFont* font);
}
mixin DEFINE_IID!(IDWriteFontCollection, "a84cee02-3eea-4eee-a827-87c1a02a0fcc");

interface IDWriteFontList : IUnknown {
public extern(Windows):
	HRESULT GetFontCollection(IDWriteFontCollection* fontCollection);
	UINT32 GetFontCount();
	HRESULT GetFont(UINT32 index, IDWriteFont* font);
}
mixin DEFINE_IID!(IDWriteFontList, "1a0d8438-1d97-4ec1-aef9-a2fb86ed6acb");

interface IDWriteFontFamily : IDWriteFontList {
public extern(Windows):
	HRESULT GetFamilyNames(IDWriteLocalizedStrings* names);
	HRESULT GetFirstMatchingFont(DWRITE_FONT_WEIGHT weight, DWRITE_FONT_STRETCH stretch, DWRITE_FONT_STYLE style, IDWriteFont* matchingFont);
	HRESULT GetMatchingFonts(DWRITE_FONT_WEIGHT weight, DWRITE_FONT_STRETCH stretch, DWRITE_FONT_STYLE style, IDWriteFontList* matchingFonts);
}
mixin DEFINE_IID!(IDWriteFontFamily, "da20d8ef-812a-4c43-9802-62ec4abd7add");

interface IDWriteFont : IUnknown {
public extern(Windows):
	HRESULT GetFontFamily(IDWriteFontFamily* fontFamily);
	DWRITE_FONT_WEIGHT GetWeight();
	DWRITE_FONT_STRETCH GetStretch();
	DWRITE_FONT_STYLE GetStyle();
	BOOL IsSymbolFont();
	HRESULT GetFaceNames(IDWriteLocalizedStrings* names);
	HRESULT GetInformationalStrings(DWRITE_INFORMATIONAL_STRING_ID informationalStringID, IDWriteLocalizedStrings* informationalStrings, BOOL* exists);
	DWRITE_FONT_SIMULATIONS GetSimulations();
	void GetMetrics(DWRITE_FONT_METRICS* fontMetrics);
	HRESULT HasCharacter(UINT32 unicodeValue, BOOL* exists);
	HRESULT CreateFontFace(IDWriteFontFace* fontFace);
}
mixin DEFINE_IID!(IDWriteFont, "acd16696-8c14-4f5d-877e-fe3fc1d32737");

enum {
	DWRITE_READING_DIRECTION_LEFT_TO_RIGHT,
	DWRITE_READING_DIRECTION_RIGHT_TO_LEFT
}
alias int DWRITE_READING_DIRECTION;

enum {
	DWRITE_FLOW_DIRECTION_TOP_TO_BOTTOM
}
alias int DWRITE_FLOW_DIRECTION;

enum {
	DWRITE_TEXT_ALIGNMENT_LEADING,
	DWRITE_TEXT_ALIGNMENT_TRAILING,
	DWRITE_TEXT_ALIGNMENT_CENTER
}
alias int DWRITE_TEXT_ALIGNMENT;

enum {
	DWRITE_PARAGRAPH_ALIGNMENT_NEAR,
	DWRITE_PARAGRAPH_ALIGNMENT_FAR,
	DWRITE_PARAGRAPH_ALIGNMENT_CENTER
}
alias int DWRITE_PARAGRAPH_ALIGNMENT;

enum {
	DWRITE_WORD_WRAPPING_WRAP,
	DWRITE_WORD_WRAPPING_NO_WRAP
}
alias int DWRITE_WORD_WRAPPING;

enum {
	DWRITE_LINE_SPACING_METHOD_DEFAULT,
	DWRITE_LINE_SPACING_METHOD_UNIFORM
}
alias int DWRITE_LINE_SPACING_METHOD;

enum {
	DWRITE_TRIMMING_GRANULARITY_NONE,
	DWRITE_TRIMMING_GRANULARITY_CHARACTER,
	DWRITE_TRIMMING_GRANULARITY_WORD
}
alias int DWRITE_TRIMMING_GRANULARITY;

enum {
	DWRITE_FONT_FEATURE_TAG_ALTERNATIVE_FRACTIONS = 0x63726661,
	DWRITE_FONT_FEATURE_TAG_PETITE_CAPITALS_FROM_CAPITALS = 0x63703263,
	DWRITE_FONT_FEATURE_TAG_SMALL_CAPITALS_FROM_CAPITALS = 0x63733263,
	DWRITE_FONT_FEATURE_TAG_CONTEXTUAL_ALTERNATES = 0x746c6163,
	DWRITE_FONT_FEATURE_TAG_CASE_SENSITIVE_FORMS = 0x65736163,
	DWRITE_FONT_FEATURE_TAG_GLYPH_COMPOSITION_DECOMPOSITION = 0x706d6363,
	DWRITE_FONT_FEATURE_TAG_CONTEXTUAL_LIGATURES = 0x67696c63,
	DWRITE_FONT_FEATURE_TAG_CAPITAL_SPACING = 0x70737063,
	DWRITE_FONT_FEATURE_TAG_CONTEXTUAL_SWASH = 0x68777363,
	DWRITE_FONT_FEATURE_TAG_CURSIVE_POSITIONING = 0x73727563,
	DWRITE_FONT_FEATURE_TAG_DEFAULT = 0x746c6664,
	DWRITE_FONT_FEATURE_TAG_DISCRETIONARY_LIGATURES = 0x67696c64,
	DWRITE_FONT_FEATURE_TAG_EXPERT_FORMS = 0x74707865,
	DWRITE_FONT_FEATURE_TAG_FRACTIONS = 0x63617266,
	DWRITE_FONT_FEATURE_TAG_FULL_WIDTH = 0x64697766,
	DWRITE_FONT_FEATURE_TAG_HALF_FORMS = 0x666c6168,
	DWRITE_FONT_FEATURE_TAG_HALANT_FORMS = 0x6e6c6168,
	DWRITE_FONT_FEATURE_TAG_ALTERNATE_HALF_WIDTH = 0x746c6168,
	DWRITE_FONT_FEATURE_TAG_HISTORICAL_FORMS = 0x74736968,
	DWRITE_FONT_FEATURE_TAG_HORIZONTAL_KANA_ALTERNATES = 0x616e6b68,
	DWRITE_FONT_FEATURE_TAG_HISTORICAL_LIGATURES = 0x67696c68,
	DWRITE_FONT_FEATURE_TAG_HALF_WIDTH = 0x64697768,
	DWRITE_FONT_FEATURE_TAG_HOJO_KANJI_FORMS = 0x6f6a6f68,
	DWRITE_FONT_FEATURE_TAG_JIS04_FORMS = 0x3430706a,
	DWRITE_FONT_FEATURE_TAG_JIS78_FORMS = 0x3837706a,
	DWRITE_FONT_FEATURE_TAG_JIS83_FORMS = 0x3338706a,
	DWRITE_FONT_FEATURE_TAG_JIS90_FORMS = 0x3039706a,
	DWRITE_FONT_FEATURE_TAG_KERNING = 0x6e72656b,
	DWRITE_FONT_FEATURE_TAG_STANDARD_LIGATURES = 0x6167696c,
	DWRITE_FONT_FEATURE_TAG_LINING_FIGURES = 0x6d756e6c,
	DWRITE_FONT_FEATURE_TAG_LOCALIZED_FORMS = 0x6c636f6c,
	DWRITE_FONT_FEATURE_TAG_MARK_POSITIONING = 0x6b72616d,
	DWRITE_FONT_FEATURE_TAG_MATHEMATICAL_GREEK = 0x6b72676d,
	DWRITE_FONT_FEATURE_TAG_MARK_TO_MARK_POSITIONING = 0x6b6d6b6d,
	DWRITE_FONT_FEATURE_TAG_ALTERNATE_ANNOTATION_FORMS = 0x746c616e,
	DWRITE_FONT_FEATURE_TAG_NLC_KANJI_FORMS = 0x6b636c6e,
	DWRITE_FONT_FEATURE_TAG_OLD_STYLE_FIGURES = 0x6d756e6f,
	DWRITE_FONT_FEATURE_TAG_ORDINALS = 0x6e64726f,
	DWRITE_FONT_FEATURE_TAG_PROPORTIONAL_ALTERNATE_WIDTH = 0x746c6170,
	DWRITE_FONT_FEATURE_TAG_PETITE_CAPITALS = 0x70616370,
	DWRITE_FONT_FEATURE_TAG_PROPORTIONAL_FIGURES = 0x6d756e70,
	DWRITE_FONT_FEATURE_TAG_PROPORTIONAL_WIDTHS = 0x64697770,
	DWRITE_FONT_FEATURE_TAG_QUARTER_WIDTHS = 0x64697771,
	DWRITE_FONT_FEATURE_TAG_REQUIRED_LIGATURES = 0x67696c72,
	DWRITE_FONT_FEATURE_TAG_RUBY_NOTATION_FORMS = 0x79627572,
	DWRITE_FONT_FEATURE_TAG_STYLISTIC_ALTERNATES = 0x746c6173,
	DWRITE_FONT_FEATURE_TAG_SCIENTIFIC_INFERIORS = 0x666e6973,
	DWRITE_FONT_FEATURE_TAG_SMALL_CAPITALS = 0x70636d73,
	DWRITE_FONT_FEATURE_TAG_SIMPLIFIED_FORMS = 0x6c706d73,
	DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_1 = 0x31307373,
	DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_2 = 0x32307373,
	DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_3 = 0x33307373,
	DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_4 = 0x34307373,
	DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_5 = 0x35307373,
	DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_6 = 0x36307373,
	DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_7 = 0x37307373,
	DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_8 = 0x38307373,
	DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_9 = 0x39307373,
	DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_10 = 0x30317373,
	DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_11 = 0x31317373,
	DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_12 = 0x32317373,
	DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_13 = 0x33317373,
	DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_14 = 0x34317373,
	DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_15 = 0x35317373,
	DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_16 = 0x36317373,
	DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_17 = 0x37317373,
	DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_18 = 0x38317373,
	DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_19 = 0x39317373,
	DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_20 = 0x30327373,
	DWRITE_FONT_FEATURE_TAG_SUBSCRIPT = 0x73627573,
	DWRITE_FONT_FEATURE_TAG_SUPERSCRIPT = 0x73707573,
	DWRITE_FONT_FEATURE_TAG_SWASH = 0x68737773,
	DWRITE_FONT_FEATURE_TAG_TITLING = 0x6c746974,
	DWRITE_FONT_FEATURE_TAG_TRADITIONAL_NAME_FORMS = 0x6d616e74,
	DWRITE_FONT_FEATURE_TAG_TABULAR_FIGURES = 0x6d756e74,
	DWRITE_FONT_FEATURE_TAG_TRADITIONAL_FORMS = 0x64617274,
	DWRITE_FONT_FEATURE_TAG_THIRD_WIDTHS = 0x64697774,
	DWRITE_FONT_FEATURE_TAG_UNICASE = 0x63696e75,
	DWRITE_FONT_FEATURE_TAG_SLASHED_ZERO = 0x6f72657a,
}
alias int DWRITE_FONT_FEATURE_TAG;

struct DWRITE_TEXT_RANGE {
	UINT32 startPosition;
	UINT32 length;
}

struct DWRITE_FONT_FEATURE {
	DWRITE_FONT_FEATURE_TAG nameTag;
	UINT32 parameter;
}

struct DWRITE_TYPOGRAPHIC_FEATURES {
	DWRITE_FONT_FEATURE* features;
	UINT32 featureCount;
}

struct DWRITE_TRIMMING {
	DWRITE_TRIMMING_GRANULARITY granularity;
	UINT32 delimiter;
	UINT32 delimiterCount;
}

interface IDWriteTextFormat : IUnknown {
public extern(Windows):
	HRESULT SetTextAlignment(DWRITE_TEXT_ALIGNMENT textAlignment);
	HRESULT SetParagraphAlignment(DWRITE_PARAGRAPH_ALIGNMENT paragraphAlignment);
	HRESULT SetWordWrapping(DWRITE_WORD_WRAPPING wordWrapping);
	HRESULT SetReadingDirection(DWRITE_READING_DIRECTION readingDirection);
	HRESULT SetFlowDirection(DWRITE_FLOW_DIRECTION flowDirection);
	HRESULT SetIncrementalTabStop(FLOAT incrementalTabStop);
	HRESULT SetTrimming(const(DWRITE_TRIMMING)* trimmingOptions, IDWriteInlineObject trimmingSign);
	HRESULT SetLineSpacing(DWRITE_LINE_SPACING_METHOD lineSpacingMethod, FLOAT lineSpacing, FLOAT baseline);
	DWRITE_TEXT_ALIGNMENT GetTextAlignment();
	DWRITE_PARAGRAPH_ALIGNMENT GetParagraphAlignment();
	DWRITE_WORD_WRAPPING GetWordWrapping();
	DWRITE_READING_DIRECTION GetReadingDirection();
	DWRITE_FLOW_DIRECTION GetFlowDirection();
	FLOAT GetIncrementalTabStop();
	HRESULT GetTrimming(DWRITE_TRIMMING* trimmingOptions, IDWriteInlineObject* trimmingSign);
	HRESULT GetLineSpacing(DWRITE_LINE_SPACING_METHOD* lineSpacingMethod, FLOAT* lineSpacing, FLOAT* baseline);
	HRESULT GetFontCollection(IDWriteFontCollection* fontCollection);
	UINT32 GetFontFamilyNameLength();
	HRESULT GetFontFamilyName(WCHAR* fontFamilyName, UINT32 nameSize);
	DWRITE_FONT_WEIGHT GetFontWeight();
	DWRITE_FONT_STYLE GetFontStyle();
	DWRITE_FONT_STRETCH GetFontStretch();
	FLOAT GetFontSize();
	UINT32 GetLocaleNameLength();
	HRESULT GetLocaleName(WCHAR* localeName, UINT32 nameSize);
}
mixin DEFINE_IID!(IDWriteTextFormat, "9c906818-31d7-4fd3-a151-7c5e225db55a");

interface IDWriteTypography : IUnknown {
public extern(Windows):
	HRESULT AddFontFeature(DWRITE_FONT_FEATURE fontFeature);
	UINT32 GetFontFeatureCount();
	HRESULT GetFontFeature(UINT32 fontFeatureIndex, DWRITE_FONT_FEATURE* fontFeature);
}
mixin DEFINE_IID!(IDWriteTypography, "55f1112b-1dc2-4b3c-9541-f46894ed85b6");

enum {
	DWRITE_SCRIPT_SHAPES_DEFAULT = 0,
	DWRITE_SCRIPT_SHAPES_NO_VISUAL = 1
}
alias int DWRITE_SCRIPT_SHAPES;

struct DWRITE_SCRIPT_ANALYSIS {
	UINT16 script;
	DWRITE_SCRIPT_SHAPES shapes;
}

enum {
	DWRITE_BREAK_CONDITION_NEUTRAL,
	DWRITE_BREAK_CONDITION_CAN_BREAK,
	DWRITE_BREAK_CONDITION_MAY_NOT_BREAK,
	DWRITE_BREAK_CONDITION_MUST_BREAK
}
alias int DWRITE_BREAK_CONDITION;

struct DWRITE_LINE_BREAKPOINT {
	UINT8 dummy;
	/*UINT8 breakConditionBefore : 2;
	UINT8 breakConditionAfter : 2;
	UINT8 isWhitespace : 1;
	UINT8 isSoftHyphen : 1;
	UINT8 padding : 2;*/
}

enum {
	DWRITE_NUMBER_SUBSTITUTION_METHOD_FROM_CULTURE,
	DWRITE_NUMBER_SUBSTITUTION_METHOD_CONTEXTUAL,
	DWRITE_NUMBER_SUBSTITUTION_METHOD_NONE,
	DWRITE_NUMBER_SUBSTITUTION_METHOD_NATIONAL,
	DWRITE_NUMBER_SUBSTITUTION_METHOD_TRADITIONAL
}
alias int DWRITE_NUMBER_SUBSTITUTION_METHOD;

interface IDWriteNumberSubstitution : IUnknown {
}
mixin DEFINE_IID!(IDWriteNumberSubstitution, "14885CC9-BAB0-4f90-B6ED-5C366A2CD03D");

struct DWRITE_SHAPING_TEXT_PROPERTIES {
	UINT16 dummy;
	/*UINT16 isShapedAlone : 1;
	UINT16 reserved : 15;*/
}

struct DWRITE_SHAPING_GLYPH_PROPERTIES {
	UINT16 dummy;
	/*UINT16 justification : 4;
	UINT16 isClusterStart : 1;
	UINT16 isDiacritic : 1;
	UINT16 isZeroWidthSpace : 1;
	UINT16 reserved : 9;*/
}

interface IDWriteTextAnalysisSource : IUnknown {
public extern(Windows):
	HRESULT GetTextAtPosition(UINT32 textPosition, const(WCHAR)** textString, UINT32* textLength);
	HRESULT GetTextBeforePosition(UINT32 textPosition, const(WCHAR)** textString, UINT32* textLength);
	DWRITE_READING_DIRECTION GetParagraphReadingDirection();
	HRESULT GetLocaleName(UINT32 textPosition, UINT32* textLength, const(WCHAR)** localeName);
	HRESULT GetNumberSubstitution(UINT32 textPosition, UINT32* textLength, IDWriteNumberSubstitution* numberSubstitution);
}
mixin DEFINE_IID!(IDWriteTextAnalysisSource, "688e1a58-5094-47c8-adc8-fbcea60ae92b");

interface IDWriteTextAnalysisSink : IUnknown {
public extern(Windows):
	HRESULT SetScriptAnalysis(UINT32 textPosition, UINT32 textLength, const(DWRITE_SCRIPT_ANALYSIS)* scriptAnalysis);
	HRESULT SetLineBreakpoints(UINT32 textPosition, UINT32 textLength, const(DWRITE_LINE_BREAKPOINT)* lineBreakpoints);
	HRESULT SetBidiLevel(UINT32 textPosition, UINT32 textLength, UINT8 explicitLevel, UINT8 resolvedLevel);
	HRESULT SetNumberSubstitution(UINT32 textPosition, UINT32 textLength, IDWriteNumberSubstitution numberSubstitution);
}
mixin DEFINE_IID!(IDWriteTextAnalysisSink, "5810cd44-0ca0-4701-b3fa-bec5182ae4f6");

interface IDWriteTextAnalyzer : IUnknown {
public extern(Windows):
	HRESULT AnalyzeScript(IDWriteTextAnalysisSource analysisSource, UINT32 textPosition, UINT32 textLength, IDWriteTextAnalysisSink analysisSink);
	HRESULT AnalyzeBidi(IDWriteTextAnalysisSource analysisSource, UINT32 textPosition, UINT32 textLength, IDWriteTextAnalysisSink analysisSink);
	HRESULT AnalyzeNumberSubstitution(IDWriteTextAnalysisSource analysisSource, UINT32 textPosition, UINT32 textLength, IDWriteTextAnalysisSink analysisSink);
	HRESULT AnalyzeLineBreakpoints(IDWriteTextAnalysisSource analysisSource, UINT32 textPosition, UINT32 textLength, IDWriteTextAnalysisSink analysisSink);
	HRESULT GetGlyphs(const(WCHAR)* textString, UINT32 textLength, IDWriteFontFace fontFace, BOOL isSideways, BOOL isRightToLeft, const(DWRITE_SCRIPT_ANALYSIS)* scriptAnalysis, const(WCHAR)* localeName, IDWriteNumberSubstitution numberSubstitution, const(DWRITE_TYPOGRAPHIC_FEATURES)** features, const(UINT32)* featureRangeLengths, UINT32 featureRanges, UINT32 maxGlyphCount, UINT16* clusterMap, DWRITE_SHAPING_TEXT_PROPERTIES* textProps, UINT16* glyphIndices, DWRITE_SHAPING_GLYPH_PROPERTIES* glyphProps, UINT32* actualGlyphCount);
	HRESULT GetGlyphPlacements(const(WCHAR)* textString, const(UINT16)* clusterMap, DWRITE_SHAPING_TEXT_PROPERTIES* textProps, UINT32 textLength, const(UINT16)* glyphIndices, const(DWRITE_SHAPING_GLYPH_PROPERTIES)* glyphProps, UINT32 glyphCount, IDWriteFontFace fontFace, FLOAT fontEmSize, BOOL isSideways, BOOL isRightToLeft, const(DWRITE_SCRIPT_ANALYSIS)* scriptAnalysis, const(WCHAR)* localeName, const(DWRITE_TYPOGRAPHIC_FEATURES)** features, const(UINT32)* featureRangeLengths, UINT32 featureRanges, FLOAT* glyphAdvances, DWRITE_GLYPH_OFFSET* glyphOffsets);
	HRESULT GetGdiCompatibleGlyphPlacements(const(WCHAR)* textString, const(UINT16)* clusterMap, DWRITE_SHAPING_TEXT_PROPERTIES* textProps, UINT32 textLength, const(UINT16)* glyphIndices, const(DWRITE_SHAPING_GLYPH_PROPERTIES)* glyphProps, UINT32 glyphCount, IDWriteFontFace fontFace, FLOAT fontEmSize, FLOAT pixelsPerDip, const(DWRITE_MATRIX)* transform, BOOL useGdiNatural, BOOL isSideways, BOOL isRightToLeft, const(DWRITE_SCRIPT_ANALYSIS)* scriptAnalysis, const(WCHAR)* localeName, const(DWRITE_TYPOGRAPHIC_FEATURES)** features, const(UINT32)* featureRangeLengths, UINT32 featureRanges, FLOAT* glyphAdvances, DWRITE_GLYPH_OFFSET* glyphOffsets);
}
mixin DEFINE_IID!(IDWriteTextAnalyzer, "b7e6163e-7f46-43b4-84b3-e4e6249c365d");

struct DWRITE_GLYPH_RUN {
	IDWriteFontFace fontFace;
	FLOAT fontEmSize;
	UINT32 glyphCount;
	const(UINT16)* glyphIndices;
	const(FLOAT)* glyphAdvances;
	const(DWRITE_GLYPH_OFFSET)* glyphOffsets;
	BOOL isSideways;
	UINT32 bidiLevel;
}

struct DWRITE_GLYPH_RUN_DESCRIPTION {
	const(WCHAR)* localeName;
	const(WCHAR)* string;
	UINT32 stringLength;
	const(UINT16)* clusterMap;
	UINT32 textPosition;
}

struct DWRITE_UNDERLINE {
	FLOAT width;
	FLOAT thickness;
	FLOAT offset;
	FLOAT runHeight;
	DWRITE_READING_DIRECTION readingDirection;
	DWRITE_FLOW_DIRECTION flowDirection;
	const(WCHAR)* localeName;
	DWRITE_MEASURING_MODE measuringMode;
}

struct DWRITE_STRIKETHROUGH {
	FLOAT width;
	FLOAT thickness;
	FLOAT offset;
	DWRITE_READING_DIRECTION readingDirection;
	DWRITE_FLOW_DIRECTION flowDirection;
	const(WCHAR)* localeName;
	DWRITE_MEASURING_MODE measuringMode;
}

struct DWRITE_LINE_METRICS {
	UINT32 length;
	UINT32 trailingWhitespaceLength;
	UINT32 newlineLength;
	FLOAT height;
	FLOAT baseline;
	BOOL isTrimmed;
}

struct DWRITE_CLUSTER_METRICS {
	FLOAT width;
	UINT16 length;
	UINT16 dummy;
	/*UINT16 canWrapLineAfter : 1;
	UINT16 isWhitespace : 1;
	UINT16 isNewline : 1;
	UINT16 isSoftHyphen : 1;
	UINT16 isRightToLeft : 1;
	UINT16 padding : 11;*/
}

struct DWRITE_TEXT_METRICS {
	FLOAT left;
	FLOAT top;
	FLOAT width;
	FLOAT widthIncludingTrailingWhitespace;
	FLOAT height;
	FLOAT layoutWidth;
	FLOAT layoutHeight;
	UINT32 maxBidiReorderingDepth;
	UINT32 lineCount;
}

struct DWRITE_INLINE_OBJECT_METRICS {
	FLOAT width;
	FLOAT height;
	FLOAT baseline;
	BOOL supportsSideways;
}

struct DWRITE_OVERHANG_METRICS {
	FLOAT left;
	FLOAT top;
	FLOAT right;
	FLOAT bottom;
}

struct DWRITE_HIT_TEST_METRICS {
	UINT32 textPosition;
	UINT32 length;
	FLOAT left;
	FLOAT top;
	FLOAT width;
	FLOAT height;
	UINT32 bidiLevel;
	BOOL isText;
	BOOL isTrimmed;
}

interface IDWriteInlineObject : IUnknown {
public extern(Windows):
	HRESULT Draw(void* clientDrawingContext, IDWriteTextRenderer renderer, FLOAT originX, FLOAT originY, BOOL isSideways, BOOL isRightToLeft, IUnknown clientDrawingEffect);
	HRESULT GetMetrics(DWRITE_INLINE_OBJECT_METRICS* metrics);
	HRESULT GetOverhangMetrics(DWRITE_OVERHANG_METRICS* overhangs);
	HRESULT GetBreakConditions(DWRITE_BREAK_CONDITION* breakConditionBefore, DWRITE_BREAK_CONDITION* breakConditionAfter);
}
mixin DEFINE_IID!(IDWriteInlineObject, "8339FDE3-106F-47ab-8373-1C6295EB10B3");

interface IDWritePixelSnapping : IUnknown {
public extern(Windows):
	HRESULT IsPixelSnappingDisabled(void* clientDrawingContext, BOOL* isDisabled);
	HRESULT GetCurrentTransform(void* clientDrawingContext, DWRITE_MATRIX* transform);
	HRESULT GetPixelsPerDip(void* clientDrawingContext, FLOAT* pixelsPerDip);
}
mixin DEFINE_IID!(IDWritePixelSnapping, "eaf3a2da-ecf4-4d24-b644-b34f6842024b");

interface IDWriteTextRenderer : IDWritePixelSnapping {
public extern(Windows):
	HRESULT DrawGlyphRun(void* clientDrawingContext, FLOAT baselineOriginX, FLOAT baselineOriginY, DWRITE_MEASURING_MODE measuringMode, const(DWRITE_GLYPH_RUN)* glyphRun, const(DWRITE_GLYPH_RUN_DESCRIPTION)* glyphRunDescription, IUnknown clientDrawingEffect);
	HRESULT DrawUnderline(void* clientDrawingContext, FLOAT baselineOriginX, FLOAT baselineOriginY, const(DWRITE_UNDERLINE)* underline, IUnknown clientDrawingEffect);
	HRESULT DrawStrikethrough(void* clientDrawingContext, FLOAT baselineOriginX, FLOAT baselineOriginY, const(DWRITE_STRIKETHROUGH)* strikethrough, IUnknown clientDrawingEffect);
	HRESULT DrawInlineObject(void* clientDrawingContext, FLOAT originX, FLOAT originY, IDWriteInlineObject inlineObject, BOOL isSideways, BOOL isRightToLeft, IUnknown clientDrawingEffect);
}
mixin DEFINE_IID!(IDWriteTextRenderer, "ef8a8135-5cc6-45fe-8825-c5a0724eb819");

interface IDWriteTextLayout : IDWriteTextFormat {
public extern(Windows):
	HRESULT SetMaxWidth(FLOAT maxWidth);
	HRESULT SetMaxHeight(FLOAT maxHeight);
	HRESULT SetFontCollection(IDWriteFontCollection fontCollection, DWRITE_TEXT_RANGE textRange);
	HRESULT SetFontFamilyName(const(WCHAR)* fontFamilyName, DWRITE_TEXT_RANGE textRange);
	HRESULT SetFontWeight(DWRITE_FONT_WEIGHT fontWeight, DWRITE_TEXT_RANGE textRange);
	HRESULT SetFontStyle(DWRITE_FONT_STYLE fontStyle, DWRITE_TEXT_RANGE textRange);
	HRESULT SetFontStretch(DWRITE_FONT_STRETCH fontStretch, DWRITE_TEXT_RANGE textRange);
	HRESULT SetFontSize(FLOAT fontSize, DWRITE_TEXT_RANGE textRange);
	HRESULT SetUnderline(BOOL hasUnderline, DWRITE_TEXT_RANGE textRange);
	HRESULT SetStrikethrough(BOOL hasStrikethrough, DWRITE_TEXT_RANGE textRange);
	HRESULT SetDrawingEffect(IUnknown drawingEffect, DWRITE_TEXT_RANGE textRange);
	HRESULT SetInlineObject(IDWriteInlineObject inlineObject, DWRITE_TEXT_RANGE textRange);
	HRESULT SetTypography(IDWriteTypography typography, DWRITE_TEXT_RANGE textRange);
	HRESULT SetLocaleName(const(WCHAR)* localeName, DWRITE_TEXT_RANGE textRange);
	FLOAT GetMaxWidth();
	FLOAT GetMaxHeight();
	HRESULT GetFontCollectio(UINT32 currentPosition, IDWriteFontCollection* fontCollection, DWRITE_TEXT_RANGE* textRange = null);
	HRESULT GetFontFamilyNameLength(UINT32 currentPosition, UINT32* nameLength, DWRITE_TEXT_RANGE* textRange = null);
	HRESULT GetFontFamilyName(UINT32 currentPosition, WCHAR* fontFamilyName, UINT32 nameSize, DWRITE_TEXT_RANGE* textRange = null);
	HRESULT GetFontWeight(UINT32 currentPosition, DWRITE_FONT_WEIGHT* fontWeight, DWRITE_TEXT_RANGE* textRange = null);
	HRESULT GetFontStyle(UINT32 currentPosition, DWRITE_FONT_STYLE* fontStyle, DWRITE_TEXT_RANGE* textRange = null);
	HRESULT GetFontStretch(UINT32 currentPosition, DWRITE_FONT_STRETCH* fontStretch, DWRITE_TEXT_RANGE* textRange = null);
	HRESULT GetFontSize(UINT32 currentPosition, FLOAT* fontSize, DWRITE_TEXT_RANGE* textRange = null);
	HRESULT GetUnderline(UINT32 currentPosition, BOOL* hasUnderline, DWRITE_TEXT_RANGE* textRange = null);
	HRESULT GetStrikethrough(UINT32 currentPosition, BOOL* hasStrikethrough, DWRITE_TEXT_RANGE* textRange = null);
	HRESULT GetDrawingEffect(UINT32 currentPosition, IUnknown* drawingEffect, DWRITE_TEXT_RANGE* textRange = null);
	HRESULT GetInlineObject(UINT32 currentPosition, IDWriteInlineObject* inlineObject, DWRITE_TEXT_RANGE* textRange = null);
	HRESULT GetTypography(UINT32 currentPosition, IDWriteTypography* typography, DWRITE_TEXT_RANGE* textRange = null);
	HRESULT GetLocaleNameLength(UINT32 currentPosition, UINT32* nameLength, DWRITE_TEXT_RANGE* textRange = null);
	HRESULT GetLocaleName(UINT32 currentPosition, WCHAR* localeName, UINT32 nameSize, DWRITE_TEXT_RANGE* textRange = null);
	HRESULT Draw(void* clientDrawingContext, IDWriteTextRenderer renderer, FLOAT originX, FLOAT originY);
	HRESULT GetLineMetrics(DWRITE_LINE_METRICS* lineMetrics, UINT32 maxLineCount, UINT32* actualLineCount);
	HRESULT GetMetrics(DWRITE_TEXT_METRICS* textMetrics);
	HRESULT GetOverhangMetrics(DWRITE_OVERHANG_METRICS* overhangs);
	HRESULT GetClusterMetrics(DWRITE_CLUSTER_METRICS* clusterMetrics, UINT32 maxClusterCount, UINT32* actualClusterCount);
	HRESULT DetermineMinWidth(FLOAT* minWidth);
	HRESULT HitTestPoint(FLOAT pointX, FLOAT pointY, BOOL* isTrailingHit, BOOL* isInside, DWRITE_HIT_TEST_METRICS* hitTestMetrics);
	HRESULT HitTestTextPosition(UINT32 textPosition, BOOL isTrailingHit, FLOAT* pointX, FLOAT* pointY, DWRITE_HIT_TEST_METRICS* hitTestMetrics);
	HRESULT HitTestTextRange(UINT32 textPosition, UINT32 textLength, FLOAT originX, FLOAT originY, DWRITE_HIT_TEST_METRICS* hitTestMetrics, UINT32 maxHitTestMetricsCount, UINT32* actualHitTestMetricsCount);
}
mixin DEFINE_IID!(IDWriteTextLayout, "53737037-6d14-410b-9bfe-0b182bb70961");

interface IDWriteBitmapRenderTarget : IUnknown {
public extern(Windows):
	HRESULT DrawGlyphRun(FLOAT baselineOriginX, FLOAT baselineOriginY, DWRITE_MEASURING_MODE measuringMode, const(DWRITE_GLYPH_RUN)* glyphRun, IDWriteRenderingParams renderingParams, COLORREF textColor, RECT* blackBoxRect = null);
	HDC GetMemoryDC();
	FLOAT GetPixelsPerDip();
	HRESULT SetPixelsPerDip(FLOAT pixelsPerDip);
	HRESULT GetCurrentTransform(DWRITE_MATRIX* transform);
	HRESULT SetCurrentTransform(const(DWRITE_MATRIX)* transform);
	HRESULT GetSize(SIZE* size);
	HRESULT Resize(UINT32 width, UINT32 height);
}
mixin DEFINE_IID!(IDWriteBitmapRenderTarget, "5e5a32a3-8dff-4773-9ff6-0696eab77267");

interface IDWriteGdiInterop : IUnknown {
public extern(Windows):
	HRESULT CreateFontFromLOGFONT(const(LOGFONTW)* logFont, IDWriteFont* font);
	HRESULT ConvertFontToLOGFONT(IDWriteFont font, LOGFONTW* logFont, BOOL* isSystemFont);
	HRESULT ConvertFontFaceToLOGFONT(IDWriteFontFace font, LOGFONTW* logFont);
	HRESULT CreateFontFaceFromHdc(HDC hdc, IDWriteFontFace* fontFace);
	HRESULT CreateBitmapRenderTarget(HDC hdc, UINT32 width, UINT32 height, IDWriteBitmapRenderTarget* renderTarget);
}
mixin DEFINE_IID!(IDWriteGdiInterop, "1edd9491-9853-4299-898f-6432983b6f3a");

enum {
	DWRITE_TEXTURE_ALIASED_1x1,
	DWRITE_TEXTURE_CLEARTYPE_3x1
}
alias int DWRITE_TEXTURE_TYPE;

enum DWRITE_ALPHA_MAX = 255;

interface IDWriteGlyphRunAnalysis : IUnknown {
public extern(Windows):
	HRESULT GetAlphaTextureBounds(DWRITE_TEXTURE_TYPE textureType, RECT* textureBounds);
	HRESULT CreateAlphaTexture(DWRITE_TEXTURE_TYPE textureType, const(RECT)* textureBounds, BYTE* alphaValues, UINT32 bufferSize);
	HRESULT GetAlphaBlendParams(IDWriteRenderingParams renderingParams, FLOAT* blendGamma, FLOAT* blendEnhancedContrast, FLOAT* blendClearTypeLevel);
}
mixin DEFINE_IID!(IDWriteGlyphRunAnalysis, "7d97dbf7-e085-42d4-81e3-6a883bded118");

interface IDWriteFactory : IUnknown {
public extern(Windows):
	HRESULT GetSystemFontCollection(IDWriteFontCollection* fontCollection, BOOL checkForUpdates = FALSE);
	HRESULT CreateCustomFontCollection(IDWriteFontCollectionLoader collectionLoader, const(void)* collectionKey, UINT32 collectionKeySize, IDWriteFontCollection* fontCollection);
	HRESULT RegisterFontCollectionLoader(IDWriteFontCollectionLoader fontCollectionLoader);
	HRESULT UnregisterFontCollectionLoader(IDWriteFontCollectionLoader fontCollectionLoader);
	HRESULT CreateFontFileReference(const(WCHAR)* filePath, const(FILETIME)* lastWriteTime, IDWriteFontFile* fontFile);
	HRESULT CreateCustomFontFileReference(const(void)* fontFileReferenceKey, UINT32 fontFileReferenceKeySize, IDWriteFontFileLoader fontFileLoader, IDWriteFontFile* fontFile);
	HRESULT CreateFontFace(DWRITE_FONT_FACE_TYPE fontFaceType, UINT32 numberOfFiles, const(IDWriteFontFile)* fontFiles, UINT32 faceIndex, DWRITE_FONT_SIMULATIONS fontFaceSimulationFlags, IDWriteFontFace* fontFace);
	HRESULT CreateRenderingParams(IDWriteRenderingParams* renderingParams);
	HRESULT CreateMonitorRenderingParams(HMONITOR monitor, IDWriteRenderingParams* renderingParams);
	HRESULT CreateCustomRenderingParams(FLOAT gamma, FLOAT enhancedContrast, FLOAT clearTypeLevel, DWRITE_PIXEL_GEOMETRY pixelGeometry, DWRITE_RENDERING_MODE renderingMode, IDWriteRenderingParams* renderingParams);
	HRESULT RegisterFontFileLoader(IDWriteFontFileLoader fontFileLoader);
	HRESULT UnregisterFontFileLoader(IDWriteFontFileLoader fontFileLoader);
	HRESULT CreateTextFormat(const(WCHAR)* fontFamilyName, IDWriteFontCollection fontCollection, DWRITE_FONT_WEIGHT fontWeight, DWRITE_FONT_STYLE fontStyle, DWRITE_FONT_STRETCH fontStretch, FLOAT fontSize, const(WCHAR)* localeName, IDWriteTextFormat* textFormat);
	HRESULT CreateTypography(IDWriteTypography* typography);
	HRESULT GetGdiInterop(IDWriteGdiInterop* gdiInterop);
	HRESULT CreateTextLayout(const(WCHAR)* string, UINT32 stringLength, IDWriteTextFormat textFormat, FLOAT maxWidth, FLOAT maxHeight, IDWriteTextLayout* textLayout);
	HRESULT CreateGdiCompatibleTextLayout(const(WCHAR)* string, UINT32 stringLength, IDWriteTextFormat textFormat, FLOAT layoutWidth, FLOAT layoutHeight, FLOAT pixelsPerDip, const(DWRITE_MATRIX)* transform, BOOL useGdiNatural, IDWriteTextLayout* textLayout);
	HRESULT CreateEllipsisTrimmingSign(IDWriteTextFormat textFormat, IDWriteInlineObject* trimmingSign);
	HRESULT CreateTextAnalyzer(IDWriteTextAnalyzer* textAnalyzer);
	HRESULT CreateNumberSubstitution(DWRITE_NUMBER_SUBSTITUTION_METHOD substitutionMethod, const(WCHAR)* localeName, BOOL ignoreUserOverride, IDWriteNumberSubstitution* numberSubstitution);
	HRESULT CreateGlyphRunAnalysis(const(DWRITE_GLYPH_RUN)* glyphRun, FLOAT pixelsPerDip, const(DWRITE_MATRIX)* transform, DWRITE_RENDERING_MODE renderingMode, DWRITE_MEASURING_MODE measuringMode, FLOAT baselineOriginX, FLOAT baselineOriginY, IDWriteGlyphRunAnalysis* glyphRunAnalysis);
}
mixin DEFINE_IID!(IDWriteFactory, "b859ee5a-d838-4b5b-a2e8-1adc7d93db48");

export extern(Windows) HRESULT DWriteCreateFactory(DWRITE_FACTORY_TYPE factoryType, REFIID iid, IUnknown* factory);

enum {
	FACILITY_DWRITE = 0x898,
	DWRITE_ERR_BASE = 0x5000,
}

pure nothrow
HRESULT MAKE_DWRITE_HR(WORD severity, WORD code)
{
	return MAKE_HRESULT(severity, cast(WORD)FACILITY_DWRITE, cast(WORD)(DWRITE_ERR_BASE + code));
}

pure nothrow
HRESULT MAKE_DWRITE_HR_ERR(WORD code)
{
	return MAKE_DWRITE_HR(SEVERITY_ERROR, code);
}

enum {
	DWRITE_E_FILEFORMAT             = MAKE_DWRITE_HR_ERR(0x000),
	DWRITE_E_UNEXPECTED             = MAKE_DWRITE_HR_ERR(0x001),
	DWRITE_E_NOFONT                 = MAKE_DWRITE_HR_ERR(0x002),
	DWRITE_E_FILENOTFOUND           = MAKE_DWRITE_HR_ERR(0x003),
	DWRITE_E_FILEACCESS             = MAKE_DWRITE_HR_ERR(0x004),
	DWRITE_E_FONTCOLLECTIONOBSOLETE = MAKE_DWRITE_HR_ERR(0x005),
	DWRITE_E_ALREADYREGISTERED      = MAKE_DWRITE_HR_ERR(0x006),
}
