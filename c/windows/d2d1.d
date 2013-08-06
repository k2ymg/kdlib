/** d2d1.d

Converted from 'd2d1.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.d2d1;


import c.windows.windef;
import c.windows.guiddef;
import c.windows.unknwn;
import c.windows.dxgiformat;
import c.windows.dxgi;
import c.windows.d2dbasetypes;
import c.windows.d3d10_1;
import c.windows.dcommon;
import c.windows.dwrite;
import c.windows.wincodec;


enum D2D1_INVALID_TAG = ULONGLONG_MAX;
const float D2D1_DEFAULT_FLATTENING_TOLERANCE = 0.25f;

enum {
	D2D1_ALPHA_MODE_UNKNOWN       = 0,
	D2D1_ALPHA_MODE_PREMULTIPLIED = 1,
	D2D1_ALPHA_MODE_STRAIGHT      = 2,
	D2D1_ALPHA_MODE_IGNORE        = 3,
	D2D1_ALPHA_MODE_FORCE_DWORD   = 0xffffffff
}
alias int D2D1_ALPHA_MODE;

enum {
	D2D1_GAMMA_2_2         = 0,
	D2D1_GAMMA_1_0         = 1,
	D2D1_GAMMA_FORCE_DWORD = 0xffffffff
}
alias int D2D1_GAMMA;

enum {
	D2D1_OPACITY_MASK_CONTENT_GRAPHICS            = 0,
	D2D1_OPACITY_MASK_CONTENT_TEXT_NATURAL        = 1,
	D2D1_OPACITY_MASK_CONTENT_TEXT_GDI_COMPATIBLE = 2,
	D2D1_OPACITY_MASK_CONTENT_FORCE_DWORD         = 0xffffffff
}
alias int D2D1_OPACITY_MASK_CONTENT;

enum {
	D2D1_EXTEND_MODE_CLAMP       = 0,
	D2D1_EXTEND_MODE_WRAP        = 1,
	D2D1_EXTEND_MODE_MIRROR      = 2,
	D2D1_EXTEND_MODE_FORCE_DWORD = 0xffffffff
}
alias int D2D1_EXTEND_MODE;

enum {
	D2D1_ANTIALIAS_MODE_PER_PRIMITIVE = 0,
	D2D1_ANTIALIAS_MODE_ALIASED = 1,
	D2D1_ANTIALIAS_MODE_FORCE_DWORD = 0xffffffff
}
alias int D2D1_ANTIALIAS_MODE;

enum {
	D2D1_TEXT_ANTIALIAS_MODE_DEFAULT     = 0,
	D2D1_TEXT_ANTIALIAS_MODE_CLEARTYPE   = 1,
	D2D1_TEXT_ANTIALIAS_MODE_GRAYSCALE   = 2,
	D2D1_TEXT_ANTIALIAS_MODE_ALIASED     = 3,
	D2D1_TEXT_ANTIALIAS_MODE_FORCE_DWORD = 0xffffffff
}
alias int D2D1_TEXT_ANTIALIAS_MODE;

enum {
	D2D1_BITMAP_INTERPOLATION_MODE_NEAREST_NEIGHBOR = 0,
	D2D1_BITMAP_INTERPOLATION_MODE_LINEAR           = 1,
	D2D1_BITMAP_INTERPOLATION_MODE_FORCE_DWORD      = 0xffffffff
}
alias int D2D1_BITMAP_INTERPOLATION_MODE;

enum {
	D2D1_DRAW_TEXT_OPTIONS_NO_SNAP     = 0x00000001,
	D2D1_DRAW_TEXT_OPTIONS_CLIP        = 0x00000002,
	D2D1_DRAW_TEXT_OPTIONS_NONE        = 0x00000000,
	D2D1_DRAW_TEXT_OPTIONS_FORCE_DWORD = 0xffffffff
}
alias int D2D1_DRAW_TEXT_OPTIONS;

struct D2D1_PIXEL_FORMAT {
	DXGI_FORMAT format;
	D2D1_ALPHA_MODE alphaMode;
}

alias D2D_POINT_2U D2D1_POINT_2U;
alias D2D_POINT_2F D2D1_POINT_2F;
alias D2D_RECT_F D2D1_RECT_F;
alias D2D_RECT_U D2D1_RECT_U;
alias D2D_SIZE_F D2D1_SIZE_F;
alias D2D_SIZE_U D2D1_SIZE_U;
alias D2D_COLOR_F D2D1_COLOR_F;
alias D2D_MATRIX_3X2_F D2D1_MATRIX_3X2_F;
alias UINT64 D2D1_TAG;

struct D2D1_BITMAP_PROPERTIES {
	D2D1_PIXEL_FORMAT pixelFormat;
	FLOAT dpiX;
	FLOAT dpiY;
}

struct D2D1_GRADIENT_STOP {
	FLOAT position;
	D2D1_COLOR_F color;
}

struct D2D1_BRUSH_PROPERTIES {
	FLOAT opacity;
	D2D1_MATRIX_3X2_F transform;
}

struct D2D1_BITMAP_BRUSH_PROPERTIES {
	D2D1_EXTEND_MODE extendModeX;
	D2D1_EXTEND_MODE extendModeY;
	D2D1_BITMAP_INTERPOLATION_MODE interpolationMode;
}

struct D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES {
	D2D1_POINT_2F startPoint;
	D2D1_POINT_2F endPoint;
}

struct D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES {
	D2D1_POINT_2F center;
	D2D1_POINT_2F gradientOriginOffset;
	FLOAT radiusX;
	FLOAT radiusY;
}

enum {
	D2D1_ARC_SIZE_SMALL       = 0,
	D2D1_ARC_SIZE_LARGE       = 1,
	D2D1_ARC_SIZE_FORCE_DWORD = 0xffffffff
}
alias int D2D1_ARC_SIZE;

enum {
 D2D1_CAP_STYLE_FLAT        = 0,
 D2D1_CAP_STYLE_SQUARE      = 1,
 D2D1_CAP_STYLE_ROUND       = 2,
 D2D1_CAP_STYLE_TRIANGLE    = 3,
 D2D1_CAP_STYLE_FORCE_DWORD = 0xffffffff
}
alias int D2D1_CAP_STYLE;

enum {
	D2D1_DASH_STYLE_SOLID        = 0,
	D2D1_DASH_STYLE_DASH         = 1,
	D2D1_DASH_STYLE_DOT          = 2,
	D2D1_DASH_STYLE_DASH_DOT     = 3,
	D2D1_DASH_STYLE_DASH_DOT_DOT = 4,
	D2D1_DASH_STYLE_CUSTOM       = 5,
	D2D1_DASH_STYLE_FORCE_DWORD  = 0xffffffff
}
alias int  D2D1_DASH_STYLE;

enum {
	D2D1_LINE_JOIN_MITER          = 0,
	D2D1_LINE_JOIN_BEVEL          = 1,
	D2D1_LINE_JOIN_ROUND          = 2,
	D2D1_LINE_JOIN_MITER_OR_BEVEL = 3,
	D2D1_LINE_JOIN_FORCE_DWORD    = 0xffffffff
}
alias int D2D1_LINE_JOIN;

enum {
	D2D1_COMBINE_MODE_UNION       = 0,
	D2D1_COMBINE_MODE_INTERSECT   = 1,
	D2D1_COMBINE_MODE_XOR         = 2,
	D2D1_COMBINE_MODE_EXCLUDE     = 3,
	D2D1_COMBINE_MODE_FORCE_DWORD = 0xffffffff
}
alias int D2D1_COMBINE_MODE;

enum {
	D2D1_GEOMETRY_RELATION_UNKNOWN      = 0,
	D2D1_GEOMETRY_RELATION_DISJOINT     = 1,
	D2D1_GEOMETRY_RELATION_IS_CONTAINED = 2,
	D2D1_GEOMETRY_RELATION_CONTAINS     = 3,
	D2D1_GEOMETRY_RELATION_OVERLAP      = 4,
	D2D1_GEOMETRY_RELATION_FORCE_DWORD  = 0xffffffff
}
alias int D2D1_GEOMETRY_RELATION;

enum {
	D2D1_GEOMETRY_SIMPLIFICATION_OPTION_CUBICS_AND_LINES = 0,
	D2D1_GEOMETRY_SIMPLIFICATION_OPTION_LINES            = 1,
	D2D1_GEOMETRY_SIMPLIFICATION_OPTION_FORCE_DWORD      = 0xffffffff
}
alias int D2D1_GEOMETRY_SIMPLIFICATION_OPTION;

enum {
	D2D1_FIGURE_BEGIN_FILLED      = 0,
	D2D1_FIGURE_BEGIN_HOLLOW      = 1,
	D2D1_FIGURE_BEGIN_FORCE_DWORD = 0xffffffff
}
alias int D2D1_FIGURE_BEGIN;

enum {
	D2D1_FIGURE_END_OPEN        = 0,
	D2D1_FIGURE_END_CLOSED      = 1,
	D2D1_FIGURE_END_FORCE_DWORD = 0xffffffff
}
alias int D2D1_FIGURE_END;

struct D2D1_BEZIER_SEGMENT {
	D2D1_POINT_2F point1;
	D2D1_POINT_2F point2;
	D2D1_POINT_2F point3;
}

struct D2D1_TRIANGLE {
	D2D1_POINT_2F point1;
	D2D1_POINT_2F point2;
	D2D1_POINT_2F point3;
}

enum {
	D2D1_PATH_SEGMENT_NONE                  = 0x00000000,
	D2D1_PATH_SEGMENT_FORCE_UNSTROKED       = 0x00000001,
	D2D1_PATH_SEGMENT_FORCE_ROUND_LINE_JOIN = 0x00000002,
	D2D1_PATH_SEGMENT_FORCE_DWORD           = 0xffffffff
}
alias int D2D1_PATH_SEGMENT;

enum {
	D2D1_SWEEP_DIRECTION_COUNTER_CLOCKWISE = 0,
	D2D1_SWEEP_DIRECTION_CLOCKWISE         = 1,
	D2D1_SWEEP_DIRECTION_FORCE_DWORD       = 0xffffffff
}
alias int D2D1_SWEEP_DIRECTION;

enum {
	D2D1_FILL_MODE_ALTERNATE   = 0,
	D2D1_FILL_MODE_WINDING     = 1,
	D2D1_FILL_MODE_FORCE_DWORD = 0xffffffff
}
alias int D2D1_FILL_MODE;

struct D2D1_ARC_SEGMENT {
	D2D1_POINT_2F point;
	D2D1_SIZE_F size;
	FLOAT rotationAngle;
	D2D1_SWEEP_DIRECTION sweepDirection;
	D2D1_ARC_SIZE arcSize;
}

struct D2D1_QUADRATIC_BEZIER_SEGMENT {
	D2D1_POINT_2F point1;
	D2D1_POINT_2F point2;
}

struct D2D1_ELLIPSE {
	D2D1_POINT_2F point;
	FLOAT radiusX;
	FLOAT radiusY;
}

struct D2D1_ROUNDED_RECT {
	D2D1_RECT_F rect;
	FLOAT radiusX;
	FLOAT radiusY;
}

struct D2D1_STROKE_STYLE_PROPERTIES {
	D2D1_CAP_STYLE startCap;
	D2D1_CAP_STYLE endCap;
	D2D1_CAP_STYLE dashCap;
	D2D1_LINE_JOIN lineJoin;
	FLOAT miterLimit;
	D2D1_DASH_STYLE dashStyle;
	FLOAT dashOffset;
}

enum {
	D2D1_LAYER_OPTIONS_NONE                     = 0x00000000,
	D2D1_LAYER_OPTIONS_INITIALIZE_FOR_CLEARTYPE = 0x00000001,
	D2D1_LAYER_OPTIONS_FORCE_DWORD              = 0xffffffff
}
alias int D2D1_LAYER_OPTIONS;

struct D2D1_LAYER_PARAMETERS {
	D2D1_RECT_F contentBounds;
	ID2D1Geometry geometricMask;
	D2D1_ANTIALIAS_MODE maskAntialiasMode;
	D2D1_MATRIX_3X2_F maskTransform;
	FLOAT opacity;
	ID2D1Brush opacityBrush;
	D2D1_LAYER_OPTIONS layerOptions;
}

enum {
	D2D1_WINDOW_STATE_NONE        = 0x0000000,
	D2D1_WINDOW_STATE_OCCLUDED    = 0x0000001,
	D2D1_WINDOW_STATE_FORCE_DWORD = 0xffffffff
}
alias int D2D1_WINDOW_STATE;

enum {
	D2D1_RENDER_TARGET_TYPE_DEFAULT     = 0,
	D2D1_RENDER_TARGET_TYPE_SOFTWARE    = 1,
	D2D1_RENDER_TARGET_TYPE_HARDWARE    = 2,
	D2D1_RENDER_TARGET_TYPE_FORCE_DWORD = 0xffffffff
}
alias int D2D1_RENDER_TARGET_TYPE;

enum {
	D2D1_FEATURE_LEVEL_DEFAULT     = 0,
	D2D1_FEATURE_LEVEL_9           = D3D10_FEATURE_LEVEL_9_1,
	D2D1_FEATURE_LEVEL_10          = D3D10_FEATURE_LEVEL_10_0,
	D2D1_FEATURE_LEVEL_FORCE_DWORD = 0xffffffff
}
alias int D2D1_FEATURE_LEVEL;

enum {
	D2D1_RENDER_TARGET_USAGE_NONE                  = 0x00000000,
	D2D1_RENDER_TARGET_USAGE_FORCE_BITMAP_REMOTING = 0x00000001,
	D2D1_RENDER_TARGET_USAGE_GDI_COMPATIBLE        = 0x00000002,
	D2D1_RENDER_TARGET_USAGE_FORCE_DWORD           = 0xffffffff
}
alias int D2D1_RENDER_TARGET_USAGE;

enum {
	D2D1_PRESENT_OPTIONS_NONE            = 0x00000000,
	D2D1_PRESENT_OPTIONS_RETAIN_CONTENTS = 0x00000001,
	D2D1_PRESENT_OPTIONS_IMMEDIATELY     = 0x00000002,
	D2D1_PRESENT_OPTIONS_FORCE_DWORD     = 0xffffffff
}
alias int D2D1_PRESENT_OPTIONS;

struct D2D1_RENDER_TARGET_PROPERTIES {
	D2D1_RENDER_TARGET_TYPE type;
	D2D1_PIXEL_FORMAT pixelFormat;
	FLOAT dpiX;
	FLOAT dpiY;
	D2D1_RENDER_TARGET_USAGE usage;
	D2D1_FEATURE_LEVEL minLevel;
}

struct D2D1_HWND_RENDER_TARGET_PROPERTIES {
	HWND hwnd;
	D2D1_SIZE_U pixelSize;
	D2D1_PRESENT_OPTIONS presentOptions;
}

enum {
	D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS_NONE           = 0x00000000,
	D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS_GDI_COMPATIBLE = 0x00000001,
	D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS_FORCE_DWORD    = 0xffffffff
}
alias int D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS;

struct D2D1_DRAWING_STATE_DESCRIPTION {
	D2D1_ANTIALIAS_MODE antialiasMode;
	D2D1_TEXT_ANTIALIAS_MODE textAntialiasMode;
	D2D1_TAG tag1;
	D2D1_TAG tag2;
	D2D1_MATRIX_3X2_F transform;
}

enum {
	D2D1_DC_INITIALIZE_MODE_COPY        = 0,
	D2D1_DC_INITIALIZE_MODE_CLEAR       = 1,
	D2D1_DC_INITIALIZE_MODE_FORCE_DWORD = 0xffffffff
}
alias int D2D1_DC_INITIALIZE_MODE;

enum {
	D2D1_DEBUG_LEVEL_NONE = 0,
	D2D1_DEBUG_LEVEL_ERROR = 1,
	D2D1_DEBUG_LEVEL_WARNING = 2,
	D2D1_DEBUG_LEVEL_INFORMATION = 3,
	D2D1_DEBUG_LEVEL_FORCE_DWORD = 0xffffffff
}
alias int D2D1_DEBUG_LEVEL;

enum {
	D2D1_FACTORY_TYPE_SINGLE_THREADED = 0,
	D2D1_FACTORY_TYPE_MULTI_THREADED  = 1,
	D2D1_FACTORY_TYPE_FORCE_DWORD     = 0xffffffff
}
alias int D2D1_FACTORY_TYPE;

struct D2D1_FACTORY_OPTIONS {
	D2D1_DEBUG_LEVEL debugLevel;
}

interface ID2D1Resource : IUnknown {
public extern(Windows):
	void GetFactory(ID2D1Factory* factory) const;
}
mixin DEFINE_IID!(ID2D1Resource, "2cd90691-12e2-11dc-9fed-001143a055f9");

interface ID2D1Bitmap : ID2D1Resource {
public extern(Windows):
	D2D1_SIZE_F GetSize() const;
	D2D1_SIZE_U GetPixelSize() const;
	D2D1_PIXEL_FORMAT GetPixelFormat() const;
	void GetDpi(FLOAT* dpiX, FLOAT* dpiY) const;
	HRESULT CopyFromBitmap(const(D2D1_POINT_2U)* destPoint, ID2D1Bitmap bitmap, const(D2D1_RECT_U)* srcRect);
	HRESULT CopyFromRenderTarget(const(D2D1_POINT_2U)* destPoint, ID2D1RenderTarget renderTarget, const(D2D1_RECT_U)* srcRect);
	HRESULT CopyFromMemory(const(D2D1_RECT_U)* dstRect, const(void)* srcData, UINT32 pitch);
}
mixin DEFINE_IID!(ID2D1Bitmap, "a2296057-ea42-4099-983b-539fb6505426");

interface ID2D1GradientStopCollection : ID2D1Resource {
public extern(Windows):
	UINT32 GetGradientStopCount() const;
	void GetGradientStops(D2D1_GRADIENT_STOP* gradientStops, UINT gradientStopsCount) const;
	D2D1_GAMMA GetColorInterpolationGamma() const;
	D2D1_EXTEND_MODE GetExtendMode() const;
}
mixin DEFINE_IID!(ID2D1GradientStopCollection, "2cd906a7-12e2-11dc-9fed-001143a055f9");

interface ID2D1Brush : ID2D1Resource {
public extern(Windows):
	void SetOpacity(FLOAT opacity);
	void SetTransform (const(D2D1_MATRIX_3X2_F)* transform);
	FLOAT GetOpacity() const;
	void GetTransform(D2D1_MATRIX_3X2_F* transform) const;
}
mixin DEFINE_IID!(ID2D1Brush, "2cd906a8-12e2-11dc-9fed-001143a055f9");

interface ID2D1BitmapBrush : ID2D1Brush {
public extern(Windows):
	void SetExtendModeX(D2D1_EXTEND_MODE extendModeX);
	void SetExtendModeY(D2D1_EXTEND_MODE extendModeY);
	void SetInterpolationMode(D2D1_BITMAP_INTERPOLATION_MODE interpolationMode);
	void SetBitmap(ID2D1Bitmap bitmap);
	D2D1_EXTEND_MODE GetExtendModeX() const;
	D2D1_EXTEND_MODE GetExtendModeY() const;
	D2D1_BITMAP_INTERPOLATION_MODE GetInterpolationMode() const;
	void GetBitmap(ID2D1Bitmap* bitmap) const;
}
mixin DEFINE_IID!(ID2D1BitmapBrush, "2cd906aa-12e2-11dc-9fed-001143a055f9");

interface ID2D1SolidColorBrush : ID2D1Brush {
public extern(Windows):
	void SetColor(const(D2D1_COLOR_F)* color);
	D2D1_COLOR_F GetColor() const;
}
mixin DEFINE_IID!(ID2D1SolidColorBrush, "2cd906a9-12e2-11dc-9fed-001143a055f9");

interface ID2D1LinearGradientBrush : ID2D1Brush {
public extern(Windows):
	void SetStartPoint(D2D1_POINT_2F startPoint);
	void SetEndPoint(D2D1_POINT_2F endPoint);
	D2D1_POINT_2F GetStartPoint() const;
	D2D1_POINT_2F GetEndPoint() const;
	void GetGradientStopCollection(ID2D1GradientStopCollection* gradientStopCollection) const;
}
mixin DEFINE_IID!(ID2D1LinearGradientBrush, "2cd906ab-12e2-11dc-9fed-001143a055f9");

interface ID2D1RadialGradientBrush : ID2D1Brush {
public extern(Windows):
	void SetCenter(D2D1_POINT_2F center);
	void SetGradientOriginOffset(D2D1_POINT_2F gradientOriginOffset);
	void SetRadiusX(FLOAT radiusX);
	void SetRadiusY(FLOAT radiusY);
	D2D1_POINT_2F GetCenter() const;
	D2D1_POINT_2F GetGradientOriginOffset() const;
	FLOAT GetRadiusX() const;
	FLOAT GetRadiusY() const;
	void GetGradientStopCollection(ID2D1GradientStopCollection* gradientStopCollection) const;
}
mixin DEFINE_IID!(ID2D1RadialGradientBrush, "2cd906ac-12e2-11dc-9fed-001143a055f9");

interface ID2D1StrokeStyle : ID2D1Resource {
public extern(Windows):
	D2D1_CAP_STYLE GetStartCap() const;
	D2D1_CAP_STYLE GetEndCap() const;
	D2D1_CAP_STYLE GetDashCap() const;
	FLOAT GetMiterLimit() const;
	D2D1_LINE_JOIN GetLineJoin() const;
	FLOAT GetDashOffset() const;
	D2D1_DASH_STYLE GetDashStyle() const;
	UINT32 GetDashesCount() const;
	void GetDashes(FLOAT* dashes, UINT dashesCount) const;
}
mixin DEFINE_IID!(ID2D1StrokeStyle, "2cd9069d-12e2-11dc-9fed-001143a055f9");

interface ID2D1Geometry : ID2D1Resource {
public extern(Windows):
	HRESULT GetBounds(const(D2D1_MATRIX_3X2_F)* worldTransform, D2D1_RECT_F* bounds) const;
	HRESULT GetWidenedBounds(FLOAT strokeWidth, ID2D1StrokeStyle strokeStyle, const(D2D1_MATRIX_3X2_F)* worldTransform, FLOAT flatteningTolerance, D2D1_RECT_F* bounds) const;
	HRESULT StrokeContainsPoint(D2D1_POINT_2F point, FLOAT strokeWidth, ID2D1StrokeStyle strokeStyle, const(D2D1_MATRIX_3X2_F)* worldTransform, FLOAT flatteningTolerance, BOOL* contains) const;
	HRESULT FillContainsPoint(D2D1_POINT_2F point, const(D2D1_MATRIX_3X2_F)* worldTransform, FLOAT flatteningTolerance, BOOL* contains) const;
	HRESULT CompareWithGeometry(ID2D1Geometry inputGeometry, const(D2D1_MATRIX_3X2_F)* inputGeometryTransform, FLOAT flatteningTolerance, D2D1_GEOMETRY_RELATION* relation) const;
	HRESULT Simplify(D2D1_GEOMETRY_SIMPLIFICATION_OPTION simplificationOption, const(D2D1_MATRIX_3X2_F)* worldTransform, FLOAT flatteningTolerance, ID2D1SimplifiedGeometrySink geometrySink) const;
	HRESULT Tessellate(const(D2D1_MATRIX_3X2_F)* worldTransform, FLOAT flatteningTolerance, ID2D1TessellationSink tessellationSink) const;
	HRESULT CombineWithGeometry(ID2D1Geometry inputGeometry, D2D1_COMBINE_MODE combineMode, const(D2D1_MATRIX_3X2_F)* inputGeometryTransform, FLOAT flatteningTolerance, ID2D1SimplifiedGeometrySink geometrySink ) const;
	HRESULT Outline(const(D2D1_MATRIX_3X2_F)* worldTransform, FLOAT flatteningTolerance, ID2D1SimplifiedGeometrySink geometrySink) const;
	HRESULT ComputeArea(const(D2D1_MATRIX_3X2_F)* worldTransform, FLOAT flatteningTolerance, FLOAT* area) const;
	HRESULT ComputeLength(const(D2D1_MATRIX_3X2_F)* worldTransform, FLOAT flatteningTolerance, FLOAT* length) const;
	HRESULT ComputePointAtLength(FLOAT length, const(D2D1_MATRIX_3X2_F)* worldTransform, FLOAT flatteningTolerance, D2D1_POINT_2F* point, D2D1_POINT_2F* unitTangentVector) const;
	HRESULT Widen(FLOAT strokeWidth, ID2D1StrokeStyle strokeStyle, const(D2D1_MATRIX_3X2_F)* worldTransform, FLOAT flatteningTolerance, ID2D1SimplifiedGeometrySink geometrySink) const;
}
mixin DEFINE_IID!(ID2D1Geometry, "2cd906a1-12e2-11dc-9fed-001143a055f9");

interface ID2D1RectangleGeometry : ID2D1Geometry {
public extern(Windows):
	void GetRect(D2D1_RECT_F* rect) const;
}
mixin DEFINE_IID!(ID2D1RectangleGeometry, "2cd906a2-12e2-11dc-9fed-001143a055f9");

interface ID2D1RoundedRectangleGeometry : ID2D1Geometry {
public extern(Windows):
	void GetRoundedRect(D2D1_ROUNDED_RECT* roundedRect) const;
}
mixin DEFINE_IID!(ID2D1RoundedRectangleGeometry, "2cd906a3-12e2-11dc-9fed-001143a055f9");

interface ID2D1EllipseGeometry : ID2D1Geometry {
public extern(Windows):
	void GetEllipse(D2D1_ELLIPSE* ellipse) const;
}
mixin DEFINE_IID!(ID2D1EllipseGeometry, "2cd906a4-12e2-11dc-9fed-001143a055f9");

interface ID2D1GeometryGroup : ID2D1Geometry {
public extern(Windows):
	D2D1_FILL_MODE GetFillMode() const;
	UINT32 GetSourceGeometryCount() const;
	void GetSourceGeometries(ID2D1Geometry* geometries, UINT geometriesCount) const;
}
mixin DEFINE_IID!(ID2D1GeometryGroup, "2cd906a6-12e2-11dc-9fed-001143a055f9");

interface ID2D1TransformedGeometry : ID2D1Geometry {
public extern(Windows):
	void GetSourceGeometry(ID2D1Geometry* sourceGeometry) const;
	void GetTransform(D2D1_MATRIX_3X2_F* transform) const;
}
mixin DEFINE_IID!(ID2D1TransformedGeometry, "2cd906bb-12e2-11dc-9fed-001143a055f9");

interface ID2D1SimplifiedGeometrySink : IUnknown {
public extern(Windows):
	void SetFillMode(D2D1_FILL_MODE fillMode);
	void SetSegmentFlags(D2D1_PATH_SEGMENT vertexFlags);
	void BeginFigure(D2D1_POINT_2F startPoint, D2D1_FIGURE_BEGIN figureBegin);
	void AddLines(const(D2D1_POINT_2F)* points, UINT pointsCount);
	void AddBeziers(const(D2D1_BEZIER_SEGMENT)* beziers, UINT beziersCount);
	void EndFigure(D2D1_FIGURE_END figureEnd);
	HRESULT Close();
}
mixin DEFINE_IID!(ID2D1SimplifiedGeometrySink, "2cd9069e-12e2-11dc-9fed-001143a055f9");

interface ID2D1GeometrySink : ID2D1SimplifiedGeometrySink {
public extern(Windows):
	void AddLine(D2D1_POINT_2F point);
	void AddBezier(const(D2D1_BEZIER_SEGMENT)* bezier);
	void AddQuadraticBezier(const(D2D1_QUADRATIC_BEZIER_SEGMENT)* bezier);
	void AddQuadraticBeziers(const(D2D1_QUADRATIC_BEZIER_SEGMENT)* beziers, UINT beziersCount);
	void AddArc(const(D2D1_ARC_SEGMENT)* arc);
}
mixin DEFINE_IID!(ID2D1GeometrySink, "2cd9069f-12e2-11dc-9fed-001143a055f9");

interface ID2D1TessellationSink : IUnknown {
public extern(Windows):
	void AddTriangles(const(D2D1_TRIANGLE)* triangles, UINT trianglesCount);
	HRESULT Close();
}
mixin DEFINE_IID!(ID2D1TessellationSink, "2cd906c1-12e2-11dc-9fed-001143a055f9");

interface ID2D1PathGeometry : ID2D1Geometry {
public extern(Windows):
	HRESULT Open(ID2D1GeometrySink* geometrySink);
	HRESULT Stream(ID2D1GeometrySink geometrySink) const;
	HRESULT GetSegmentCount(UINT32* count) const;
	HRESULT GetFigureCount(UINT32* count) const;
}
mixin DEFINE_IID!(ID2D1PathGeometry, "2cd906a5-12e2-11dc-9fed-001143a055f9");

interface ID2D1Mesh : ID2D1Resource {
public extern(Windows):
	HRESULT Open(ID2D1TessellationSink* tessellationSink);
}
mixin DEFINE_IID!(ID2D1Mesh, "2cd906c2-12e2-11dc-9fed-001143a055f9");

interface ID2D1Layer : ID2D1Resource {
public extern(Windows):
	D2D1_SIZE_F GetSize() const;
}
mixin DEFINE_IID!(ID2D1Layer, "2cd9069b-12e2-11dc-9fed-001143a055f9");

interface ID2D1DrawingStateBlock : ID2D1Resource {
public extern(Windows):
	void GetDescription(D2D1_DRAWING_STATE_DESCRIPTION* stateDescription) const;
	void SetDescription(const(D2D1_DRAWING_STATE_DESCRIPTION)* stateDescription);
	void SetTextRenderingParams(IDWriteRenderingParams textRenderingParams = null);
	void GetTextRenderingParams(IDWriteRenderingParams* textRenderingParams) const;
}
mixin DEFINE_IID!(ID2D1DrawingStateBlock, "28506e39-ebf6-46a1-bb47-fd85565ab957");

interface ID2D1RenderTarget : ID2D1Resource {
public extern(Windows):
	HRESULT CreateBitmap(D2D1_SIZE_U size, const(void)* srcData, UINT32 pitch, const(D2D1_BITMAP_PROPERTIES)* bitmapProperties, ID2D1Bitmap* bitmap);
	HRESULT CreateBitmapFromWicBitmap(IWICBitmapSource wicBitmapSource, const(D2D1_BITMAP_PROPERTIES)* bitmapProperties, ID2D1Bitmap* bitmap);
	HRESULT CreateSharedBitmap(REFIID riid, void* data, const(D2D1_BITMAP_PROPERTIES)* bitmapProperties, ID2D1Bitmap* bitmap);
	HRESULT CreateBitmapBrush(ID2D1Bitmap bitmap, const(D2D1_BITMAP_BRUSH_PROPERTIES)* bitmapBrushProperties, const(D2D1_BRUSH_PROPERTIES)* brushProperties, ID2D1BitmapBrush* bitmapBrush);
	HRESULT CreateSolidColorBrush(const(D2D1_COLOR_F)* color, const(D2D1_BRUSH_PROPERTIES)* brushProperties, ID2D1SolidColorBrush* solidColorBrush);
	HRESULT CreateGradientStopCollection(const(D2D1_GRADIENT_STOP)* gradientStops, UINT gradientStopsCount, D2D1_GAMMA colorInterpolationGamma, D2D1_EXTEND_MODE extendMode, ID2D1GradientStopCollection* gradientStopCollection);
	HRESULT CreateLinearGradientBrush(const(D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES)* linearGradientBrushProperties, const(D2D1_BRUSH_PROPERTIES)* brushProperties, ID2D1GradientStopCollection gradientStopCollection, ID2D1LinearGradientBrush* linearGradientBrush);
	HRESULT CreateRadialGradientBrush(const(D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES)* radialGradientBrushProperties, const(D2D1_BRUSH_PROPERTIES)* brushProperties, ID2D1GradientStopCollection gradientStopCollection, ID2D1RadialGradientBrush* radialGradientBrush);
	HRESULT CreateCompatibleRenderTarget(const(D2D1_SIZE_F)* desiredSize, const(D2D1_SIZE_U)* desiredPixelSize, const(D2D1_PIXEL_FORMAT)* desiredFormat, D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS options, ID2D1BitmapRenderTarget* bitmapRenderTarget);
	HRESULT CreateLayer(const(D2D1_SIZE_F)* size, ID2D1Layer* layer);
	HRESULT CreateMesh(ID2D1Mesh* mesh);
	void DrawLine(D2D1_POINT_2F point0, D2D1_POINT_2F point1, ID2D1Brush brush, FLOAT strokeWidth = 1.0f, ID2D1StrokeStyle strokeStyle = null);
	void DrawRectangle(const(D2D1_RECT_F)* rect, ID2D1Brush brush, FLOAT strokeWidth = 1.0f, ID2D1StrokeStyle strokeStyle = null);
	void FillRectangle(const(D2D1_RECT_F)* rect, ID2D1Brush brush);
	void DrawRoundedRectangle(const(D2D1_ROUNDED_RECT)* roundedRect, ID2D1Brush brush, FLOAT strokeWidth = 1.0f, ID2D1StrokeStyle strokeStyle = null);
	void FillRoundedRectangle(const(D2D1_ROUNDED_RECT)* roundedRect, ID2D1Brush brush);
	void DrawEllipse(const(D2D1_ELLIPSE)* ellipse, ID2D1Brush brush, FLOAT strokeWidth = 1.0f, ID2D1StrokeStyle strokeStyle = null);
	void FillEllipse(const(D2D1_ELLIPSE)* ellipse, ID2D1Brush brush);
	void DrawGeometry(ID2D1Geometry geometry, ID2D1Brush brush, FLOAT strokeWidth = 1.0f, ID2D1StrokeStyle strokeStyle = null);
	void FillGeometry(ID2D1Geometry geometry, ID2D1Brush brush, ID2D1Brush opacityBrush = null);
	void FillMesh(ID2D1Mesh mesh, ID2D1Brush brush);
	void FillOpacityMask(ID2D1Bitmap opacityMask, ID2D1Brush brush, D2D1_OPACITY_MASK_CONTENT content, const(D2D1_RECT_F)* destinationRectangle = null, const(D2D1_RECT_F)* sourceRectangle = null);
	void DrawBitmap(ID2D1Bitmap bitmap, const(D2D1_RECT_F)* destinationRectangle = null, FLOAT opacity = 1.0f, D2D1_BITMAP_INTERPOLATION_MODE interpolationMode = D2D1_BITMAP_INTERPOLATION_MODE_LINEAR, const(D2D1_RECT_F)* sourceRectangle = null);
	void DrawText(const(WCHAR)* string, UINT stringLength, IDWriteTextFormat textFormat, const(D2D1_RECT_F)* layoutRect, ID2D1Brush defaultForegroundBrush, D2D1_DRAW_TEXT_OPTIONS options = D2D1_DRAW_TEXT_OPTIONS_NONE, DWRITE_MEASURING_MODE measuringMode = DWRITE_MEASURING_MODE_NATURAL);
	void DrawTextLayout(D2D1_POINT_2F origin, IDWriteTextLayout textLayout, ID2D1Brush defaultForegroundBrush, D2D1_DRAW_TEXT_OPTIONS options = D2D1_DRAW_TEXT_OPTIONS_NONE);
	void DrawGlyphRun(D2D1_POINT_2F baselineOrigin, const(DWRITE_GLYPH_RUN)* glyphRun, ID2D1Brush foregroundBrush, DWRITE_MEASURING_MODE measuringMode = DWRITE_MEASURING_MODE_NATURAL);
	void SetTransform(const(D2D1_MATRIX_3X2_F)* transform);
	void GetTransform(D2D1_MATRIX_3X2_F* transform) const;
	void SetAntialiasMode(D2D1_ANTIALIAS_MODE antialiasMode);
	D2D1_ANTIALIAS_MODE GetAntialiasMode() const;
	void SetTextAntialiasMode(D2D1_TEXT_ANTIALIAS_MODE textAntialiasMode);
	D2D1_TEXT_ANTIALIAS_MODE GetTextAntialiasMode() const;
	void SetTextRenderingParams(IDWriteRenderingParams textRenderingParams = null);
	void GetTextRenderingParams(IDWriteRenderingParams* textRenderingParams) const;
	void SetTags(D2D1_TAG tag1, D2D1_TAG tag2);
	void GetTags(D2D1_TAG* tag1 = null, D2D1_TAG* tag2 = null) const;
	void PushLayer(const(D2D1_LAYER_PARAMETERS)* layerParameters, ID2D1Layer layer);
	void PopLayer();
	HRESULT Flush(D2D1_TAG* tag1 = null, D2D1_TAG* tag2 = null);
	void SaveDrawingState(ID2D1DrawingStateBlock drawingStateBlock) const;
	void RestoreDrawingState(ID2D1DrawingStateBlock drawingStateBlock);
	void PushAxisAlignedClip(const(D2D1_RECT_F)* clipRect, D2D1_ANTIALIAS_MODE antialiasMode);
	void PopAxisAlignedClip();
	void Clear(const(D2D1_COLOR_F)* clearColor = null);
	void BeginDraw();
	HRESULT EndDraw(D2D1_TAG* tag1 = null, D2D1_TAG* tag2 = null);
	D2D1_PIXEL_FORMAT GetPixelFormat() const;
	void SetDpi(FLOAT dpiX, FLOAT dpiY);
	void GetDpi(FLOAT* dpiX, FLOAT* dpiY) const;
	D2D1_SIZE_F GetSize() const;
	D2D1_SIZE_U GetPixelSize() const;
	UINT32 GetMaximumBitmapSize() const;
	BOOL IsSupported(const(D2D1_RENDER_TARGET_PROPERTIES)* renderTargetProperties) const;
}
mixin DEFINE_IID!(ID2D1RenderTarget, "2cd90694-12e2-11dc-9fed-001143a055f9");

interface ID2D1BitmapRenderTarget : ID2D1RenderTarget {
public extern(Windows):
	HRESULT GetBitmap(ID2D1Bitmap* bitmap);
}
mixin DEFINE_IID!(ID2D1BitmapRenderTarget, "2cd90695-12e2-11dc-9fed-001143a055f9");

interface ID2D1HwndRenderTarget : ID2D1RenderTarget {
public extern(Windows):
	D2D1_WINDOW_STATE CheckWindowState();
	HRESULT Resize(const(D2D1_SIZE_U)* pixelSize);
	HWND GetHwnd() const;
}
mixin DEFINE_IID!(ID2D1HwndRenderTarget, "2cd90698-12e2-11dc-9fed-001143a055f9");

interface ID2D1GdiInteropRenderTarget : IUnknown {
public extern(Windows):
	HRESULT GetDC(D2D1_DC_INITIALIZE_MODE mode, HDC* hdc);
	HRESULT ReleaseDC(const(RECT)* update);
}
mixin DEFINE_IID!(ID2D1GdiInteropRenderTarget, "e0db51c3-6f77-4bae-b3d5-e47509b35838");

interface ID2D1DCRenderTarget : ID2D1RenderTarget {
public extern(Windows):
	HRESULT BindDC(const(HDC) hDC, const(RECT)* pSubRect);
}
mixin DEFINE_IID!(ID2D1DCRenderTarget, "1c51bc64-de61-46fd-9899-63a5d8f03950");

interface ID2D1Factory : IUnknown {
public extern(Windows):
	HRESULT ReloadSystemMetrics();
	void GetDesktopDpi(FLOAT* dpiX, FLOAT* dpiY);
	HRESULT CreateRectangleGeometry(const(D2D1_RECT_F)* rectangle, ID2D1RectangleGeometry* rectangleGeometry);
	HRESULT CreateRoundedRectangleGeometry(const(D2D1_ROUNDED_RECT)* roundedRectangle, ID2D1RoundedRectangleGeometry* roundedRectangleGeometry);
	HRESULT CreateEllipseGeometry(const(D2D1_ELLIPSE)* ellipse, ID2D1EllipseGeometry* ellipseGeometry);
	HRESULT CreateGeometryGroup(D2D1_FILL_MODE fillMode, ID2D1Geometry* geometries, UINT geometriesCount, ID2D1GeometryGroup* geometryGroup);
	HRESULT CreateTransformedGeometry(ID2D1Geometry sourceGeometry, const(D2D1_MATRIX_3X2_F)* transform, ID2D1TransformedGeometry* transformedGeometry);
	HRESULT CreatePathGeometry(ID2D1PathGeometry* pathGeometry);
	HRESULT CreateStrokeStyle(const(D2D1_STROKE_STYLE_PROPERTIES)* strokeStyleProperties, const(FLOAT)* dashes, UINT dashesCount, ID2D1StrokeStyle* strokeStyle);
	HRESULT CreateDrawingStateBlock(const(D2D1_DRAWING_STATE_DESCRIPTION)* drawingStateDescription, IDWriteRenderingParams textRenderingParams, ID2D1DrawingStateBlock* drawingStateBlock);
	HRESULT CreateWicBitmapRenderTarget(IWICBitmap target, const(D2D1_RENDER_TARGET_PROPERTIES)* renderTargetProperties, ID2D1RenderTarget* renderTarget);
	HRESULT CreateHwndRenderTarget(const(D2D1_RENDER_TARGET_PROPERTIES)* renderTargetProperties, const(D2D1_HWND_RENDER_TARGET_PROPERTIES)* hwndRenderTargetProperties, ID2D1HwndRenderTarget* hwndRenderTarget);
	HRESULT CreateDxgiSurfaceRenderTarget(IDXGISurface dxgiSurface, const(D2D1_RENDER_TARGET_PROPERTIES)* renderTargetProperties, ID2D1RenderTarget* renderTarget);
	HRESULT CreateDCRenderTarget(const(D2D1_RENDER_TARGET_PROPERTIES)* renderTargetProperties, ID2D1DCRenderTarget* dcRenderTarget);
}
mixin DEFINE_IID!(ID2D1Factory, "06152247-6f50-465a-9245-118bfd3b6007");

export extern(Windows){
	HRESULT D2D1CreateFactory(D2D1_FACTORY_TYPE factoryType, REFIID riid, const(D2D1_FACTORY_OPTIONS)* pFactoryOptions, void** ppIFactory);
	void D2D1MakeRotateMatrix(FLOAT angle, D2D1_POINT_2F center, D2D1_MATRIX_3X2_F* matrix);
	void D2D1MakeSkewMatrix(FLOAT angleX, FLOAT angleY, D2D1_POINT_2F center, D2D1_MATRIX_3X2_F* matrix);
	BOOL D2D1IsMatrixInvertible(const(D2D1_MATRIX_3X2_F)* matrix);
	BOOL D2D1InvertMatrix(D2D1_MATRIX_3X2_F* matrix);
}
