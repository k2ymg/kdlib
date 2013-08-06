/** d3d10.d

Converted from 'd3d10.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.d3d10;


import c.windows.windef;
import c.windows.guiddef;
import c.windows.unknwn;
import c.windows.winerror;
import c.windows.dxgiformat;
import c.windows.dxgitype;


extern(C){

enum {
	D3D10_16BIT_INDEX_STRIP_CUT_VALUE                                    = 0xffff,
	D3D10_32BIT_INDEX_STRIP_CUT_VALUE                                    = 0xffffffff,
	D3D10_8BIT_INDEX_STRIP_CUT_VALUE                                     = 0xff,
	D3D10_ARRAY_AXIS_ADDRESS_RANGE_BIT_COUNT                             = 9,
	D3D10_CLIP_OR_CULL_DISTANCE_COUNT                                    = 8,
	D3D10_CLIP_OR_CULL_DISTANCE_ELEMENT_COUNT                            = 2,
	D3D10_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT                    = 14,
	D3D10_COMMONSHADER_CONSTANT_BUFFER_COMPONENTS                        = 4,
	D3D10_COMMONSHADER_CONSTANT_BUFFER_COMPONENT_BIT_COUNT               = 32,
	D3D10_COMMONSHADER_CONSTANT_BUFFER_HW_SLOT_COUNT                     = 15,
	D3D10_COMMONSHADER_CONSTANT_BUFFER_REGISTER_COMPONENTS               = 4,
	D3D10_COMMONSHADER_CONSTANT_BUFFER_REGISTER_COUNT                    = 15,
	D3D10_COMMONSHADER_CONSTANT_BUFFER_REGISTER_READS_PER_INST           = 1,
	D3D10_COMMONSHADER_CONSTANT_BUFFER_REGISTER_READ_PORTS               = 1,
	D3D10_COMMONSHADER_FLOWCONTROL_NESTING_LIMIT                         = 64,
	D3D10_COMMONSHADER_IMMEDIATE_CONSTANT_BUFFER_REGISTER_COMPONENTS     = 4,
	D3D10_COMMONSHADER_IMMEDIATE_CONSTANT_BUFFER_REGISTER_COUNT          = 1,
	D3D10_COMMONSHADER_IMMEDIATE_CONSTANT_BUFFER_REGISTER_READS_PER_INST = 1,
	D3D10_COMMONSHADER_IMMEDIATE_CONSTANT_BUFFER_REGISTER_READ_PORTS     = 1,
	D3D10_COMMONSHADER_IMMEDIATE_VALUE_COMPONENT_BIT_COUNT               = 32,
	D3D10_COMMONSHADER_INPUT_RESOURCE_REGISTER_COMPONENTS                = 1,
	D3D10_COMMONSHADER_INPUT_RESOURCE_REGISTER_COUNT                     = 128,
	D3D10_COMMONSHADER_INPUT_RESOURCE_REGISTER_READS_PER_INST            = 1,
	D3D10_COMMONSHADER_INPUT_RESOURCE_REGISTER_READ_PORTS                = 1,
	D3D10_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT                         = 128,
	D3D10_COMMONSHADER_SAMPLER_REGISTER_COMPONENTS                       = 1,
	D3D10_COMMONSHADER_SAMPLER_REGISTER_COUNT                            = 16,
	D3D10_COMMONSHADER_SAMPLER_REGISTER_READS_PER_INST                   = 1,
	D3D10_COMMONSHADER_SAMPLER_REGISTER_READ_PORTS                       = 1,
	D3D10_COMMONSHADER_SAMPLER_SLOT_COUNT                                = 16,
	D3D10_COMMONSHADER_SUBROUTINE_NESTING_LIMIT                          = 32,
	D3D10_COMMONSHADER_TEMP_REGISTER_COMPONENTS                          = 4,
	D3D10_COMMONSHADER_TEMP_REGISTER_COMPONENT_BIT_COUNT                 = 32,
	D3D10_COMMONSHADER_TEMP_REGISTER_COUNT                               = 4096,
	D3D10_COMMONSHADER_TEMP_REGISTER_READS_PER_INST                      = 3,
	D3D10_COMMONSHADER_TEMP_REGISTER_READ_PORTS                          = 3,
	D3D10_COMMONSHADER_TEXCOORD_RANGE_REDUCTION_MAX                      = 10,
	D3D10_COMMONSHADER_TEXCOORD_RANGE_REDUCTION_MIN                      = -10,
	D3D10_COMMONSHADER_TEXEL_OFFSET_MAX_NEGATIVE                         = -8,
	D3D10_COMMONSHADER_TEXEL_OFFSET_MAX_POSITIVE                         = 7,
}
const float D3D10_DEFAULT_BLEND_FACTOR_ALPHA                             = 1.0f;
const float D3D10_DEFAULT_BLEND_FACTOR_BLUE                              = 1.0f;
const float D3D10_DEFAULT_BLEND_FACTOR_GREEN                             = 1.0f;
const float D3D10_DEFAULT_BLEND_FACTOR_RED                               = 1.0f;
const float D3D10_DEFAULT_BORDER_COLOR_COMPONENT                         = 0.0f;
enum D3D10_DEFAULT_DEPTH_BIAS                                            = 0;
const float D3D10_DEFAULT_DEPTH_BIAS_CLAMP                               = 0.0f;
const float D3D10_DEFAULT_MAX_ANISOTROPY                                 = 16.0f;
const float D3D10_DEFAULT_MIP_LOD_BIAS                                   = 0.0f;
enum {
	D3D10_DEFAULT_RENDER_TARGET_ARRAY_INDEX                              = 0,
	D3D10_DEFAULT_SAMPLE_MASK                                            = 0xffffffff,
	D3D10_DEFAULT_SCISSOR_ENDX                                           = 0,
	D3D10_DEFAULT_SCISSOR_ENDY                                           = 0,
	D3D10_DEFAULT_SCISSOR_STARTX                                         = 0,
	D3D10_DEFAULT_SCISSOR_STARTY                                         = 0,
}
const float D3D10_DEFAULT_SLOPE_SCALED_DEPTH_BIAS                        = 0.0f;
enum {
	D3D10_DEFAULT_STENCIL_READ_MASK                                      = 0xff,
	D3D10_DEFAULT_STENCIL_REFERENCE                                      = 0,
	D3D10_DEFAULT_STENCIL_WRITE_MASK                                     = 0xff,
	D3D10_DEFAULT_VIEWPORT_AND_SCISSORRECT_INDEX                         = 0,
	D3D10_DEFAULT_VIEWPORT_HEIGHT                                        = 0,
}
const float D3D10_DEFAULT_VIEWPORT_MAX_DEPTH                             = 0.0f;
const float D3D10_DEFAULT_VIEWPORT_MIN_DEPTH                             = 0.0f;
enum {
	D3D10_DEFAULT_VIEWPORT_TOPLEFTX                                      = 0,
	D3D10_DEFAULT_VIEWPORT_TOPLEFTY                                      = 0,
	D3D10_DEFAULT_VIEWPORT_WIDTH                                         = 0,
}
const float D3D10_FLOAT16_FUSED_TOLERANCE_IN_ULP                         = 0.6;
const float D3D10_FLOAT32_MAX                                            = 3.402823466e+38f;
const float D3D10_FLOAT32_TO_INTEGER_TOLERANCE_IN_ULP                    = 0.6f;
const float D3D10_FLOAT_TO_SRGB_EXPONENT_DENOMINATOR                     = 2.4f;
const float D3D10_FLOAT_TO_SRGB_EXPONENT_NUMERATOR                       = 1.0f;
const float D3D10_FLOAT_TO_SRGB_OFFSET                                   = 0.055f;
const float D3D10_FLOAT_TO_SRGB_SCALE_1                                  = 12.92f;
const float D3D10_FLOAT_TO_SRGB_SCALE_2                                  = 1.055f;
const float D3D10_FLOAT_TO_SRGB_THRESHOLD                                = 0.0031308f;
const float D3D10_FTOI_INSTRUCTION_MAX_INPUT                             = 2147483647.999f;
const float D3D10_FTOI_INSTRUCTION_MIN_INPUT                             = -2147483648.999f;
const float D3D10_FTOU_INSTRUCTION_MAX_INPUT                             = 4294967295.999f;
const float D3D10_FTOU_INSTRUCTION_MIN_INPUT                             = 0.0f;
enum {
	D3D10_GS_INPUT_PRIM_CONST_REGISTER_COMPONENTS                        = 1,
	D3D10_GS_INPUT_PRIM_CONST_REGISTER_COMPONENT_BIT_COUNT               = 32,
	D3D10_GS_INPUT_PRIM_CONST_REGISTER_COUNT                             = 1,
	D3D10_GS_INPUT_PRIM_CONST_REGISTER_READS_PER_INST                    = 2,
	D3D10_GS_INPUT_PRIM_CONST_REGISTER_READ_PORTS                        = 1,
	D3D10_GS_INPUT_REGISTER_COMPONENTS                                   = 4,
	D3D10_GS_INPUT_REGISTER_COMPONENT_BIT_COUNT                          = 32,
	D3D10_GS_INPUT_REGISTER_COUNT                                        = 16,
	D3D10_GS_INPUT_REGISTER_READS_PER_INST                               = 2,
	D3D10_GS_INPUT_REGISTER_READ_PORTS                                   = 1,
	D3D10_GS_INPUT_REGISTER_VERTICES                                     = 6,
	D3D10_GS_OUTPUT_ELEMENTS                                             = 32,
	D3D10_GS_OUTPUT_REGISTER_COMPONENTS                                  = 4,
	D3D10_GS_OUTPUT_REGISTER_COMPONENT_BIT_COUNT                         = 32,
	D3D10_GS_OUTPUT_REGISTER_COUNT                                       = 32,
	D3D10_IA_DEFAULT_INDEX_BUFFER_OFFSET_IN_BYTES                        = 0,
	D3D10_IA_DEFAULT_PRIMITIVE_TOPOLOGY                                  = 0,
	D3D10_IA_DEFAULT_VERTEX_BUFFER_OFFSET_IN_BYTES                       = 0,
	D3D10_IA_INDEX_INPUT_RESOURCE_SLOT_COUNT                             = 1,
	D3D10_IA_INSTANCE_ID_BIT_COUNT                                       = 32,
	D3D10_IA_INTEGER_ARITHMETIC_BIT_COUNT                                = 32,
	D3D10_IA_PRIMITIVE_ID_BIT_COUNT                                      = 32,
	D3D10_IA_VERTEX_ID_BIT_COUNT                                         = 32,
	D3D10_IA_VERTEX_INPUT_RESOURCE_SLOT_COUNT                            = 16,
	D3D10_IA_VERTEX_INPUT_STRUCTURE_ELEMENTS_COMPONENTS                  = 64,
	D3D10_IA_VERTEX_INPUT_STRUCTURE_ELEMENT_COUNT                        = 16,
	D3D10_INTEGER_DIVIDE_BY_ZERO_QUOTIENT                                = 0xffffffff,
	D3D10_INTEGER_DIVIDE_BY_ZERO_REMAINDER                               = 0xffffffff,
}
const float D3D10_LINEAR_GAMMA                                           =  1.0f;
const float D3D10_MAX_BORDER_COLOR_COMPONENT                             =  1.0f;
const float D3D10_MAX_DEPTH                                              =  1.0f;
enum D3D10_MAX_MAXANISOTROPY                                             = 16;
enum D3D10_MAX_MULTISAMPLE_SAMPLE_COUNT                                  = 32;
const float D3D10_MAX_POSITION_VALUE                                     = 3.402823466e+34f;
enum D3D10_MAX_TEXTURE_DIMENSION_2_TO_EXP                                = 17;
const float D3D10_MIN_BORDER_COLOR_COMPONENT                             = 0.0f;
const float D3D10_MIN_DEPTH                                              = 0.0f;
enum D3D10_MIN_MAXANISOTROPY                                             = 0;
const float D3D10_MIP_LOD_BIAS_MAX                                       = 15.99f;
const float D3D10_MIP_LOD_BIAS_MIN                                       = -16.0f;
enum D3D10_MIP_LOD_FRACTIONAL_BIT_COUNT                                  = 6;
enum D3D10_MIP_LOD_RANGE_BIT_COUNT                                       = 8;
const float D3D10_MULTISAMPLE_ANTIALIAS_LINE_WIDTH                       = 1.4f;
enum {
	D3D10_NONSAMPLE_FETCH_OUT_OF_RANGE_ACCESS_RESULT                     = 0,
	D3D10_PIXEL_ADDRESS_RANGE_BIT_COUNT                                  = 13,
	D3D10_PRE_SCISSOR_PIXEL_ADDRESS_RANGE_BIT_COUNT                      = 15,
	D3D10_PS_FRONTFACING_DEFAULT_VALUE                                   = 0xffffffff,
	D3D10_PS_FRONTFACING_FALSE_VALUE                                     = 0,
	D3D10_PS_FRONTFACING_TRUE_VALUE                                      = 0xffffffff,
	D3D10_PS_INPUT_REGISTER_COMPONENTS                                   = 4,
	D3D10_PS_INPUT_REGISTER_COMPONENT_BIT_COUNT                          = 32,
	D3D10_PS_INPUT_REGISTER_COUNT                                        = 32,
	D3D10_PS_INPUT_REGISTER_READS_PER_INST                               = 2,
	D3D10_PS_INPUT_REGISTER_READ_PORTS                                   = 1,
}
const float D3D10_PS_LEGACY_PIXEL_CENTER_FRACTIONAL_COMPONENT            = 0.0f;
enum {
	D3D10_PS_OUTPUT_DEPTH_REGISTER_COMPONENTS                            = 1,
	D3D10_PS_OUTPUT_DEPTH_REGISTER_COMPONENT_BIT_COUNT                   = 32,
	D3D10_PS_OUTPUT_DEPTH_REGISTER_COUNT                                 = 1,
	D3D10_PS_OUTPUT_REGISTER_COMPONENTS                                  = 4,
	D3D10_PS_OUTPUT_REGISTER_COMPONENT_BIT_COUNT                         = 32,
	D3D10_PS_OUTPUT_REGISTER_COUNT                                       = 8,
}
const float D3D10_PS_PIXEL_CENTER_FRACTIONAL_COMPONENT                   =  0.5f;
enum {
	D3D10_REQ_BLEND_OBJECT_COUNT_PER_CONTEXT                             = 4096,
	D3D10_REQ_BUFFER_RESOURCE_TEXEL_COUNT_2_TO_EXP                       = 27,
	D3D10_REQ_CONSTANT_BUFFER_ELEMENT_COUNT                              = 4096,
	D3D10_REQ_DEPTH_STENCIL_OBJECT_COUNT_PER_CONTEXT                     = 4096,
	D3D10_REQ_DRAWINDEXED_INDEX_COUNT_2_TO_EXP                           = 32,
	D3D10_REQ_DRAW_VERTEX_COUNT_2_TO_EXP                                 = 32,
	D3D10_REQ_FILTERING_HW_ADDRESSABLE_RESOURCE_DIMENSION                = 8192,
	D3D10_REQ_GS_INVOCATION_32BIT_OUTPUT_COMPONENT_LIMIT                 = 1024,
	D3D10_REQ_IMMEDIATE_CONSTANT_BUFFER_ELEMENT_COUNT                    = 4096,
	D3D10_REQ_MAXANISOTROPY                                              = 16,
	D3D10_REQ_MIP_LEVELS                                                 = 14,
	D3D10_REQ_MULTI_ELEMENT_STRUCTURE_SIZE_IN_BYTES                      = 2048,
	D3D10_REQ_RASTERIZER_OBJECT_COUNT_PER_CONTEXT                        = 4096,
	D3D10_REQ_RENDER_TO_BUFFER_WINDOW_WIDTH                              = 8192,
	D3D10_REQ_RESOURCE_SIZE_IN_MEGABYTES                                 = 128,
	D3D10_REQ_RESOURCE_VIEW_COUNT_PER_CONTEXT_2_TO_EXP                   = 20,
	D3D10_REQ_SAMPLER_OBJECT_COUNT_PER_CONTEXT                           = 4096,
	D3D10_REQ_TEXTURE1D_ARRAY_AXIS_DIMENSION                             = 512,
	D3D10_REQ_TEXTURE1D_U_DIMENSION                                      = 8192,
	D3D10_REQ_TEXTURE2D_ARRAY_AXIS_DIMENSION                             = 512,
	D3D10_REQ_TEXTURE2D_U_OR_V_DIMENSION                                 = 8192,
	D3D10_REQ_TEXTURE3D_U_V_OR_W_DIMENSION                               = 2048,
	D3D10_REQ_TEXTURECUBE_DIMENSION                                      = 8192,
	D3D10_RESINFO_INSTRUCTION_MISSING_COMPONENT_RETVAL                   = 0,
	D3D10_SHADER_MAJOR_VERSION                                           = 4,
	D3D10_SHADER_MINOR_VERSION                                           = 0,
	D3D10_SHIFT_INSTRUCTION_PAD_VALUE                                    = 0,
	D3D10_SHIFT_INSTRUCTION_SHIFT_VALUE_BIT_COUNT                        = 5,
	D3D10_SIMULTANEOUS_RENDER_TARGET_COUNT                               = 8,
	D3D10_SO_BUFFER_MAX_STRIDE_IN_BYTES                                  = 2048,
	D3D10_SO_BUFFER_MAX_WRITE_WINDOW_IN_BYTES                            = 256,
	D3D10_SO_BUFFER_SLOT_COUNT                                           = 4,
	D3D10_SO_DDI_REGISTER_INDEX_DENOTING_GAP                             = 0xffffffff,
	D3D10_SO_MULTIPLE_BUFFER_ELEMENTS_PER_BUFFER                         = 1,
	D3D10_SO_SINGLE_BUFFER_COMPONENT_LIMIT                               = 64,
}
const float D3D10_SRGB_GAMMA                                             = 2.2f;
const float D3D10_SRGB_TO_FLOAT_DENOMINATOR_1                            = 12.92f;
const float D3D10_SRGB_TO_FLOAT_DENOMINATOR_2                            = 1.055f;
const float D3D10_SRGB_TO_FLOAT_EXPONENT                                 = 2.4f;
const float D3D10_SRGB_TO_FLOAT_OFFSET                                   = 0.055f;
const float D3D10_SRGB_TO_FLOAT_THRESHOLD                                = 0.04045f;
const float D3D10_SRGB_TO_FLOAT_TOLERANCE_IN_ULP                         = 0.5f;
enum {
	D3D10_STANDARD_COMPONENT_BIT_COUNT                                   = 32,
	D3D10_STANDARD_COMPONENT_BIT_COUNT_DOUBLED                           = 64,
	D3D10_STANDARD_MAXIMUM_ELEMENT_ALIGNMENT_BYTE_MULTIPLE               = 4,
	D3D10_STANDARD_PIXEL_COMPONENT_COUNT                                 = 128,
	D3D10_STANDARD_PIXEL_ELEMENT_COUNT                                   = 32,
	D3D10_STANDARD_VECTOR_SIZE                                           = 4,
	D3D10_STANDARD_VERTEX_ELEMENT_COUNT                                  = 16,
	D3D10_STANDARD_VERTEX_TOTAL_COMPONENT_COUNT                          = 64,
	D3D10_SUBPIXEL_FRACTIONAL_BIT_COUNT                                  = 8,
	D3D10_SUBTEXEL_FRACTIONAL_BIT_COUNT                                  = 6,
	D3D10_TEXEL_ADDRESS_RANGE_BIT_COUNT                                  = 18,
	D3D10_UNBOUND_MEMORY_ACCESS_RESULT                                   = 0,
	D3D10_VIEWPORT_AND_SCISSORRECT_MAX_INDEX                             = 15,
	D3D10_VIEWPORT_AND_SCISSORRECT_OBJECT_COUNT_PER_PIPELINE             = 16,
	D3D10_VIEWPORT_BOUNDS_MAX                                            = 16383,
	D3D10_VIEWPORT_BOUNDS_MIN                                            = -16384,
	D3D10_VS_INPUT_REGISTER_COMPONENTS                                   = 4,
	D3D10_VS_INPUT_REGISTER_COMPONENT_BIT_COUNT                          = 32,
	D3D10_VS_INPUT_REGISTER_COUNT                                        = 16,
	D3D10_VS_INPUT_REGISTER_READS_PER_INST                               = 2,
	D3D10_VS_INPUT_REGISTER_READ_PORTS                                   = 1,
	D3D10_VS_OUTPUT_REGISTER_COMPONENTS                                  = 4,
	D3D10_VS_OUTPUT_REGISTER_COMPONENT_BIT_COUNT                         = 32,
	D3D10_VS_OUTPUT_REGISTER_COUNT                                       = 16,
	D3D10_WHQL_CONTEXT_COUNT_FOR_RESOURCE_LIMIT                          = 10,
	D3D10_WHQL_DRAWINDEXED_INDEX_COUNT_2_TO_EXP                          = 25,
	D3D10_WHQL_DRAW_VERTEX_COUNT_2_TO_EXP                                = 25,
	D3D_MAJOR_VERSION                                                    = 10,
	D3D_MINOR_VERSION                                                    = 0,
	D3D_SPEC_DATE_DAY                                                    = 8,
	D3D_SPEC_DATE_MONTH                                                  = 8,
	D3D_SPEC_DATE_YEAR                                                   = 2006,
}
//D3D_SPEC_VERSION                                                     =  1.050005 ,

// def at d3d10_1
// D3D10_1_IA_VERTEX_INPUT_STRUCTURE_ELEMENT_COUNT D3D10_IA_VERTEX_INPUT_STRUCTURE_ELEMENT_COUNT
// D3D10_1_IA_VERTEX_INPUT_RESOURCE_SLOT_COUNT D3D10_IA_VERTEX_INPUT_STRUCTURE_ELEMENT_COUNT

private enum _FACD3D10 = 0x879;
private enum _FACD3D10DEBUG =  _FACD3D10 + 1;

pure nothrow
HRESULT MAKE_D3D10_HRESULT(WORD code)
{
	return MAKE_HRESULT(1, _FACD3D10, code);
}

pure nothrow
HRESULT MAKE_D3D10_STATUS(WORD code)
{
	return MAKE_HRESULT(0, _FACD3D10, code);
}

enum D3D10_ERROR_TOO_MANY_UNIQUE_STATE_OBJECTS = MAKE_D3D10_HRESULT(1);
enum D3D10_ERROR_FILE_NOT_FOUND = MAKE_D3D10_HRESULT(2);

enum {
	D3D10_INPUT_PER_VERTEX_DATA   = 0,
	D3D10_INPUT_PER_INSTANCE_DATA = 1
}
alias int D3D10_INPUT_CLASSIFICATION;
enum D3D10_APPEND_ALIGNED_ELEMENT = 0xffffffff;

struct D3D10_INPUT_ELEMENT_DESC {
	LPCSTR SemanticName;
	UINT SemanticIndex;
	DXGI_FORMAT Format;
	UINT InputSlot;
	UINT AlignedByteOffset;
	D3D10_INPUT_CLASSIFICATION InputSlotClass;
	UINT InstanceDataStepRate;
}

enum {
	D3D10_FILL_WIREFRAME = 2,
	D3D10_FILL_SOLID     = 3
}
alias int D3D10_FILL_MODE;

enum {
	D3D10_PRIMITIVE_TOPOLOGY_UNDEFINED         = 0,
	D3D10_PRIMITIVE_TOPOLOGY_POINTLIST         = 1,
	D3D10_PRIMITIVE_TOPOLOGY_LINELIST          = 2,
	D3D10_PRIMITIVE_TOPOLOGY_LINESTRIP         = 3,
	D3D10_PRIMITIVE_TOPOLOGY_TRIANGLELIST      = 4,
	D3D10_PRIMITIVE_TOPOLOGY_TRIANGLESTRIP     = 5,
	D3D10_PRIMITIVE_TOPOLOGY_LINELIST_ADJ      = 10,
	D3D10_PRIMITIVE_TOPOLOGY_LINESTRIP_ADJ     = 11,
	D3D10_PRIMITIVE_TOPOLOGY_TRIANGLELIST_ADJ  = 12,
	D3D10_PRIMITIVE_TOPOLOGY_TRIANGLESTRIP_ADJ = 13
}
alias int D3D10_PRIMITIVE_TOPOLOGY;

enum {
	D3D10_PRIMITIVE_UNDEFINED    = 0,
	D3D10_PRIMITIVE_POINT        = 1,
	D3D10_PRIMITIVE_LINE         = 2,
	D3D10_PRIMITIVE_TRIANGLE     = 3,
	D3D10_PRIMITIVE_LINE_ADJ     = 6,
	D3D10_PRIMITIVE_TRIANGLE_ADJ = 7
}
alias int D3D10_PRIMITIVE;

enum {
	D3D10_CULL_NONE  = 1,
	D3D10_CULL_FRONT = 2,
	D3D10_CULL_BACK  = 3
}
alias int D3D10_CULL_MODE;

struct D3D10_SO_DECLARATION_ENTRY {
	LPCSTR SemanticName;
	UINT SemanticIndex;
	BYTE StartComponent;
	BYTE ComponentCount;
	BYTE OutputSlot;
}

struct D3D10_VIEWPORT {
	INT TopLeftX;
	INT TopLeftY;
	UINT Width;
	UINT Height;
	FLOAT MinDepth;
	FLOAT MaxDepth;
}

enum {
	D3D10_RESOURCE_DIMENSION_UNKNOWN   = 0,
	D3D10_RESOURCE_DIMENSION_BUFFER    = 1,
	D3D10_RESOURCE_DIMENSION_TEXTURE1D = 2,
	D3D10_RESOURCE_DIMENSION_TEXTURE2D = 3,
	D3D10_RESOURCE_DIMENSION_TEXTURE3D = 4
}
alias int D3D10_RESOURCE_DIMENSION;

enum {
	D3D10_SRV_DIMENSION_UNKNOWN          = 0,
	D3D10_SRV_DIMENSION_BUFFER           = 1,
	D3D10_SRV_DIMENSION_TEXTURE1D        = 2,
	D3D10_SRV_DIMENSION_TEXTURE1DARRAY   = 3,
	D3D10_SRV_DIMENSION_TEXTURE2D        = 4,
	D3D10_SRV_DIMENSION_TEXTURE2DARRAY   = 5,
	D3D10_SRV_DIMENSION_TEXTURE2DMS      = 6,
	D3D10_SRV_DIMENSION_TEXTURE2DMSARRAY = 7,
	D3D10_SRV_DIMENSION_TEXTURE3D        = 8,
	D3D10_SRV_DIMENSION_TEXTURECUBE      = 9
}
alias int D3D10_SRV_DIMENSION;

enum {
	D3D10_DSV_DIMENSION_UNKNOWN          = 0,
	D3D10_DSV_DIMENSION_TEXTURE1D        = 1,
	D3D10_DSV_DIMENSION_TEXTURE1DARRAY   = 2,
	D3D10_DSV_DIMENSION_TEXTURE2D        = 3,
	D3D10_DSV_DIMENSION_TEXTURE2DARRAY   = 4,
	D3D10_DSV_DIMENSION_TEXTURE2DMS      = 5,
	D3D10_DSV_DIMENSION_TEXTURE2DMSARRAY = 6
}
alias int D3D10_DSV_DIMENSION;

enum {
	D3D10_RTV_DIMENSION_UNKNOWN          = 0,
	D3D10_RTV_DIMENSION_BUFFER           = 1,
	D3D10_RTV_DIMENSION_TEXTURE1D        = 2,
	D3D10_RTV_DIMENSION_TEXTURE1DARRAY   = 3,
	D3D10_RTV_DIMENSION_TEXTURE2D        = 4,
	D3D10_RTV_DIMENSION_TEXTURE2DARRAY   = 5,
	D3D10_RTV_DIMENSION_TEXTURE2DMS      = 6,
	D3D10_RTV_DIMENSION_TEXTURE2DMSARRAY = 7,
	D3D10_RTV_DIMENSION_TEXTURE3D        = 8
}
alias int D3D10_RTV_DIMENSION;

enum {
	D3D10_USAGE_DEFAULT   = 0,
	D3D10_USAGE_IMMUTABLE = 1,
	D3D10_USAGE_DYNAMIC   = 2,
	D3D10_USAGE_STAGING   = 3
}
alias int D3D10_USAGE;

enum {
	D3D10_BIND_VERTEX_BUFFER   = 0x1,
	D3D10_BIND_INDEX_BUFFER    = 0x2,
	D3D10_BIND_CONSTANT_BUFFER = 0x4,
	D3D10_BIND_SHADER_RESOURCE = 0x8,
	D3D10_BIND_STREAM_OUTPUT   = 0x10,
	D3D10_BIND_RENDER_TARGET   = 0x20,
	D3D10_BIND_DEPTH_STENCIL   = 0x40
}
alias int D3D10_BIND_FLAG;

enum {
	D3D10_CPU_ACCESS_WRITE = 0x10000,
	D3D10_CPU_ACCESS_READ  = 0x20000
}
alias int D3D10_CPU_ACCESS_FLAG;

enum {
	D3D10_RESOURCE_MISC_GENERATE_MIPS     = 0x1,
	D3D10_RESOURCE_MISC_SHARED            = 0x2,
	D3D10_RESOURCE_MISC_TEXTURECUBE       = 0x4,
	D3D10_RESOURCE_MISC_SHARED_KEYEDMUTEX = 0x10,
	D3D10_RESOURCE_MISC_GDI_COMPATIBLE    = 0x20
}
alias int D3D10_RESOURCE_MISC_FLAG;

enum {
	D3D10_MAP_READ               = 1,
	D3D10_MAP_WRITE              = 2,
	D3D10_MAP_READ_WRITE         = 3,
	D3D10_MAP_WRITE_DISCARD      = 4,
	D3D10_MAP_WRITE_NO_OVERWRITE = 5
}
alias int D3D10_MAP;

enum {
	D3D10_MAP_FLAG_DO_NOT_WAIT = 0x100000
}
alias int D3D10_MAP_FLAG;

enum {
	D3D10_RAISE_FLAG_DRIVER_INTERNAL_ERROR = 0x1
}
alias int D3D10_RAISE_FLAG;


enum {
	D3D10_CLEAR_DEPTH   = 0x1,
	D3D10_CLEAR_STENCIL = 0x2
}
alias int D3D10_CLEAR_FLAG;

alias RECT D3D10_RECT;

struct D3D10_BOX {
	UINT left;
	UINT top;
	UINT front;
	UINT right;
	UINT bottom;
	UINT back;
}

//MIDL_INTERFACE("9B7E4C00-342C-4106-A19F-4F2704F689F0")
interface ID3D10DeviceChild : IUnknown {
public extern(Windows):
	void GetDevice(ID3D10Device* ppDevice);
	HRESULT GetPrivateData(REFGUID guid, UINT* pDataSize, void* pData);
	HRESULT SetPrivateData(REFGUID guid, UINT DataSize, const(void)* pData);
	HRESULT SetPrivateDataInterface(REFGUID guid, const(IUnknown) pData);
}

enum {
	D3D10_COMPARISON_NEVER         = 1,
	D3D10_COMPARISON_LESS          = 2,
	D3D10_COMPARISON_EQUAL         = 3,
	D3D10_COMPARISON_LESS_EQUAL    = 4,
	D3D10_COMPARISON_GREATER       = 5,
	D3D10_COMPARISON_NOT_EQUAL     = 6,
	D3D10_COMPARISON_GREATER_EQUAL = 7,
	D3D10_COMPARISON_ALWAYS        = 8
}
alias int D3D10_COMPARISON_FUNC;

enum {
	D3D10_DEPTH_WRITE_MASK_ZERO = 0,
	D3D10_DEPTH_WRITE_MASK_ALL  = 1
}
alias int D3D10_DEPTH_WRITE_MASK;

enum {
	D3D10_STENCIL_OP_KEEP     = 1,
	D3D10_STENCIL_OP_ZERO     = 2,
	D3D10_STENCIL_OP_REPLACE  = 3,
	D3D10_STENCIL_OP_INCR_SAT = 4,
	D3D10_STENCIL_OP_DECR_SAT = 5,
	D3D10_STENCIL_OP_INVERT   = 6,
	D3D10_STENCIL_OP_INCR     = 7,
	D3D10_STENCIL_OP_DECR     = 8
}
alias int D3D10_STENCIL_OP;

struct D3D10_DEPTH_STENCILOP_DESC {
	D3D10_STENCIL_OP StencilFailOp;
	D3D10_STENCIL_OP StencilDepthFailOp;
	D3D10_STENCIL_OP StencilPassOp;
	D3D10_COMPARISON_FUNC StencilFunc;
}

struct D3D10_DEPTH_STENCIL_DESC{
	BOOL DepthEnable;
	D3D10_DEPTH_WRITE_MASK DepthWriteMask;
	D3D10_COMPARISON_FUNC DepthFunc;
	BOOL StencilEnable;
	UINT8 StencilReadMask;
	UINT8 StencilWriteMask;
	D3D10_DEPTH_STENCILOP_DESC FrontFace;
	D3D10_DEPTH_STENCILOP_DESC BackFace;
}

//MIDL_INTERFACE("2B4B1CC8-A4AD-41f8-8322-CA86FC3EC675")
interface ID3D10DepthStencilState : ID3D10DeviceChild {
public extern(Windows):
	void GetDesc(D3D10_DEPTH_STENCIL_DESC* pDesc);
}

enum {
	D3D10_BLEND_ZERO             = 1,
	D3D10_BLEND_ONE              = 2,
	D3D10_BLEND_SRC_COLOR        = 3,
	D3D10_BLEND_INV_SRC_COLOR    = 4,
	D3D10_BLEND_SRC_ALPHA        = 5,
	D3D10_BLEND_INV_SRC_ALPHA    = 6,
	D3D10_BLEND_DEST_ALPHA       = 7,
	D3D10_BLEND_INV_DEST_ALPHA   = 8,
	D3D10_BLEND_DEST_COLOR       = 9,
	D3D10_BLEND_INV_DEST_COLOR   = 10,
	D3D10_BLEND_SRC_ALPHA_SAT    = 11,
	D3D10_BLEND_BLEND_FACTOR     = 14,
	D3D10_BLEND_INV_BLEND_FACTOR = 15,
	D3D10_BLEND_SRC1_COLOR       = 16,
	D3D10_BLEND_INV_SRC1_COLOR   = 17,
	D3D10_BLEND_SRC1_ALPHA       = 18,
	D3D10_BLEND_INV_SRC1_ALPHA   = 19
}
alias int D3D10_BLEND;

enum {
	D3D10_BLEND_OP_ADD          = 1,
	D3D10_BLEND_OP_SUBTRACT     = 2,
	D3D10_BLEND_OP_REV_SUBTRACT = 3,
	D3D10_BLEND_OP_MIN          = 4,
	D3D10_BLEND_OP_MAX          = 5
}
alias int D3D10_BLEND_OP;

enum {
	D3D10_COLOR_WRITE_ENABLE_RED   = 1,
	D3D10_COLOR_WRITE_ENABLE_GREEN = 2,
	D3D10_COLOR_WRITE_ENABLE_BLUE  = 4,
	D3D10_COLOR_WRITE_ENABLE_ALPHA = 8,
	D3D10_COLOR_WRITE_ENABLE_ALL   = D3D10_COLOR_WRITE_ENABLE_RED | D3D10_COLOR_WRITE_ENABLE_GREEN | D3D10_COLOR_WRITE_ENABLE_BLUE | D3D10_COLOR_WRITE_ENABLE_ALPHA,
}
alias int D3D10_COLOR_WRITE_ENABLE;

struct D3D10_BLEND_DESC {
	BOOL AlphaToCoverageEnable;
	BOOL[8] BlendEnable;
	D3D10_BLEND SrcBlend;
	D3D10_BLEND DestBlend;
	D3D10_BLEND_OP BlendOp;
	D3D10_BLEND SrcBlendAlpha;
	D3D10_BLEND DestBlendAlpha;
	D3D10_BLEND_OP BlendOpAlpha;
	UINT8[8] RenderTargetWriteMask;
}

//MIDL_INTERFACE("EDAD8D19-8A35-4d6d-8566-2EA276CDE161")
interface ID3D10BlendState : ID3D10DeviceChild {
public extern(Windows):
	void GetDesc(D3D10_BLEND_DESC* pDesc);
}

struct D3D10_RASTERIZER_DESC {
	D3D10_FILL_MODE FillMode;
	D3D10_CULL_MODE CullMode;
	BOOL FrontCounterClockwise;
	INT DepthBias;
	FLOAT DepthBiasClamp;
	FLOAT SlopeScaledDepthBias;
	BOOL DepthClipEnable;
	BOOL ScissorEnable;
	BOOL MultisampleEnable;
	BOOL AntialiasedLineEnable;
}

//MIDL_INTERFACE("A2A07292-89AF-4345-BE2E-C53D9FBB6E9F")
interface ID3D10RasterizerState : ID3D10DeviceChild {
public extern(Windows):
	void GetDesc(D3D10_RASTERIZER_DESC* pDesc);
}


UINT D3D10CalcSubresource(UINT MipSlice, UINT ArraySlice, UINT MipLevels)
{
	return MipSlice + ArraySlice * MipLevels;
}

struct D3D10_SUBRESOURCE_DATA {
	const(void)* pSysMem;
	UINT SysMemPitch;
	UINT SysMemSlicePitch;
}

//MIDL_INTERFACE("9B7E4C01-342C-4106-A19F-4F2704F689F0")
interface ID3D10Resource : ID3D10DeviceChild {
public extern(Windows):
	void GetType(D3D10_RESOURCE_DIMENSION* rType);
	void SetEvictionPriority(UINT EvictionPriority);
	UINT GetEvictionPriority();
}

struct D3D10_BUFFER_DESC {
	UINT ByteWidth;
	D3D10_USAGE Usage;
	UINT BindFlags;
	UINT CPUAccessFlags;
	UINT MiscFlags;
}

//MIDL_INTERFACE("9B7E4C02-342C-4106-A19F-4F2704F689F0")
interface ID3D10Buffer : ID3D10Resource {
public extern(Windows):
	HRESULT Map(D3D10_MAP MapType, UINT MapFlags, void** ppData);
	void Unmap();
	void GetDesc(D3D10_BUFFER_DESC* pDesc);
}

struct D3D10_TEXTURE1D_DESC {
	UINT Width;
	UINT MipLevels;
	UINT ArraySize;
	DXGI_FORMAT Format;
	D3D10_USAGE Usage;
	UINT BindFlags;
	UINT CPUAccessFlags;
	UINT MiscFlags;
}

//MIDL_INTERFACE("9B7E4C03-342C-4106-A19F-4F2704F689F0")
interface ID3D10Texture1D : ID3D10Resource {
public extern(Windows):
	HRESULT Map(UINT Subresource, D3D10_MAP MapType, UINT MapFlags, void** ppData);
	void Unmap(UINT Subresource);
	void GetDesc(D3D10_TEXTURE1D_DESC* pDesc);
}

struct D3D10_TEXTURE2D_DESC {
	UINT Width;
	UINT Height;
	UINT MipLevels;
	UINT ArraySize;
	DXGI_FORMAT Format;
	DXGI_SAMPLE_DESC SampleDesc;
	D3D10_USAGE Usage;
	UINT BindFlags;
	UINT CPUAccessFlags;
	UINT MiscFlags;
}

struct D3D10_MAPPED_TEXTURE2D {
	void* pData;
	UINT RowPitch;
}

//MIDL_INTERFACE("9B7E4C04-342C-4106-A19F-4F2704F689F0")
interface ID3D10Texture2D : ID3D10Resource {
public extern(Windows):
	HRESULT Map(UINT Subresource, D3D10_MAP MapType, UINT MapFlags, D3D10_MAPPED_TEXTURE2D* pMappedTex2D);
	void Unmap(UINT Subresource);
	void GetDesc(D3D10_TEXTURE2D_DESC* pDesc);
}

struct D3D10_TEXTURE3D_DESC {
	UINT Width;
	UINT Height;
	UINT Depth;
	UINT MipLevels;
	DXGI_FORMAT Format;
	D3D10_USAGE Usage;
	UINT BindFlags;
	UINT CPUAccessFlags;
	UINT MiscFlags;
}

struct D3D10_MAPPED_TEXTURE3D {
	void* pData;
	UINT RowPitch;
	UINT DepthPitch;
}

//MIDL_INTERFACE("9B7E4C05-342C-4106-A19F-4F2704F689F0")
interface ID3D10Texture3D : ID3D10Resource {
public extern(Windows):
	HRESULT Map(UINT Subresource, D3D10_MAP MapType, UINT MapFlags, D3D10_MAPPED_TEXTURE3D* pMappedTex3D);
	void Unmap(UINT Subresource);
	void GetDesc(D3D10_TEXTURE3D_DESC* pDesc);
}

enum {
	D3D10_TEXTURECUBE_FACE_POSITIVE_X = 0,
	D3D10_TEXTURECUBE_FACE_NEGATIVE_X = 1,
	D3D10_TEXTURECUBE_FACE_POSITIVE_Y = 2,
	D3D10_TEXTURECUBE_FACE_NEGATIVE_Y = 3,
	D3D10_TEXTURECUBE_FACE_POSITIVE_Z = 4,
	D3D10_TEXTURECUBE_FACE_NEGATIVE_Z = 5
}
alias int D3D10_TEXTURECUBE_FACE;

//MIDL_INTERFACE("C902B03F-60A7-49BA-9936-2A3AB37A7E33")
interface ID3D10View : ID3D10DeviceChild {
public extern(Windows):
	void GetResource(ID3D10Resource* ppResource);
}

struct D3D10_BUFFER_SRV {
	union {
		UINT FirstElement;
		UINT ElementOffset;
	}
	union {
		UINT NumElements;
		UINT ElementWidth;
	}
}

struct D3D10_TEX1D_SRV {
	UINT MostDetailedMip;
	UINT MipLevels;
}

struct D3D10_TEX1D_ARRAY_SRV {
	UINT MostDetailedMip;
	UINT MipLevels;
	UINT FirstArraySlice;
	UINT ArraySize;
}

struct D3D10_TEX2D_SRV {
	UINT MostDetailedMip;
	UINT MipLevels;
}

struct D3D10_TEX2D_ARRAY_SRV {
	UINT MostDetailedMip;
	UINT MipLevels;
	UINT FirstArraySlice;
	UINT ArraySize;
}

struct D3D10_TEX3D_SRV {
	UINT MostDetailedMip;
	UINT MipLevels;
}

struct D3D10_TEXCUBE_SRV {
	UINT MostDetailedMip;
	UINT MipLevels;
}

struct D3D10_TEX2DMS_SRV {
	UINT UnusedField_NothingToDefine;
}

struct D3D10_TEX2DMS_ARRAY_SRV {
	UINT FirstArraySlice;
	UINT ArraySize;
}

struct D3D10_SHADER_RESOURCE_VIEW_DESC {
	DXGI_FORMAT Format;
	D3D10_SRV_DIMENSION ViewDimension;
	union {
		D3D10_BUFFER_SRV Buffer;
		D3D10_TEX1D_SRV Texture1D;
		D3D10_TEX1D_ARRAY_SRV Texture1DArray;
		D3D10_TEX2D_SRV Texture2D;
		D3D10_TEX2D_ARRAY_SRV Texture2DArray;
		D3D10_TEX2DMS_SRV Texture2DMS;
		D3D10_TEX2DMS_ARRAY_SRV Texture2DMSArray;
		D3D10_TEX3D_SRV Texture3D;
		D3D10_TEXCUBE_SRV TextureCube;
	}
}

//MIDL_INTERFACE("9B7E4C07-342C-4106-A19F-4F2704F689F0")
interface ID3D10ShaderResourceView : ID3D10View {
public extern(Windows):
	void GetDesc(D3D10_SHADER_RESOURCE_VIEW_DESC* pDesc);
}

struct D3D10_BUFFER_RTV {
	union {
		UINT FirstElement;
		UINT ElementOffset;
	}
	union {
		UINT NumElements;
		UINT ElementWidth;
	}
}

struct D3D10_TEX1D_RTV {
	UINT MipSlice;
}

struct D3D10_TEX1D_ARRAY_RTV {
	UINT MipSlice;
	UINT FirstArraySlice;
	UINT ArraySize;
}

struct D3D10_TEX2D_RTV {
	UINT MipSlice;
}

struct D3D10_TEX2DMS_RTV {
	UINT UnusedField_NothingToDefine;
}

struct D3D10_TEX2D_ARRAY_RTV {
	UINT MipSlice;
	UINT FirstArraySlice;
	UINT ArraySize;
}

struct D3D10_TEX2DMS_ARRAY_RTV {
	UINT FirstArraySlice;
	UINT ArraySize;
}

struct D3D10_TEX3D_RTV {
	UINT MipSlice;
	UINT FirstWSlice;
	UINT WSize;
}

struct D3D10_RENDER_TARGET_VIEW_DESC {
	DXGI_FORMAT Format;
	D3D10_RTV_DIMENSION ViewDimension;
	union {
		D3D10_BUFFER_RTV Buffer;
		D3D10_TEX1D_RTV Texture1D;
		D3D10_TEX1D_ARRAY_RTV Texture1DArray;
		D3D10_TEX2D_RTV Texture2D;
		D3D10_TEX2D_ARRAY_RTV Texture2DArray;
		D3D10_TEX2DMS_RTV Texture2DMS;
		D3D10_TEX2DMS_ARRAY_RTV Texture2DMSArray;
		D3D10_TEX3D_RTV Texture3D;
	}
}

//MIDL_INTERFACE("9B7E4C08-342C-4106-A19F-4F2704F689F0")
interface ID3D10RenderTargetView : ID3D10View {
public extern(Windows):
	void GetDesc(D3D10_RENDER_TARGET_VIEW_DESC* pDesc);
}

struct D3D10_TEX1D_DSV {
	UINT MipSlice;
}

struct D3D10_TEX1D_ARRAY_DSV {
	UINT MipSlice;
	UINT FirstArraySlice;
	UINT ArraySize;
}

struct D3D10_TEX2D_DSV {
	UINT MipSlice;
}

struct D3D10_TEX2D_ARRAY_DSV {
	UINT MipSlice;
	UINT FirstArraySlice;
	UINT ArraySize;
}

struct D3D10_TEX2DMS_DSV {
	UINT UnusedField_NothingToDefine;
}

struct D3D10_TEX2DMS_ARRAY_DSV {
	UINT FirstArraySlice;
	UINT ArraySize;
}

struct D3D10_DEPTH_STENCIL_VIEW_DESC {
	DXGI_FORMAT Format;
	D3D10_DSV_DIMENSION ViewDimension;
	union {
		D3D10_TEX1D_DSV Texture1D;
		D3D10_TEX1D_ARRAY_DSV Texture1DArray;
		D3D10_TEX2D_DSV Texture2D;
		D3D10_TEX2D_ARRAY_DSV Texture2DArray;
		D3D10_TEX2DMS_DSV Texture2DMS;
		D3D10_TEX2DMS_ARRAY_DSV Texture2DMSArray;
	}
}

//MIDL_INTERFACE("9B7E4C09-342C-4106-A19F-4F2704F689F0")
interface ID3D10DepthStencilView : ID3D10View {
public extern(Windows):
	void GetDesc(D3D10_DEPTH_STENCIL_VIEW_DESC* pDesc);
}

//MIDL_INTERFACE("9B7E4C0A-342C-4106-A19F-4F2704F689F0")
interface ID3D10VertexShader : ID3D10DeviceChild {
public extern(Windows):
}

//MIDL_INTERFACE("6316BE88-54CD-4040-AB44-20461BC81F68")
interface ID3D10GeometryShader : ID3D10DeviceChild {
public extern(Windows):
}

//MIDL_INTERFACE("4968B601-9D00-4cde-8346-8E7F675819B6")
interface ID3D10PixelShader : ID3D10DeviceChild {
public extern(Windows):
}

//MIDL_INTERFACE("9B7E4C0B-342C-4106-A19F-4F2704F689F0")
interface ID3D10InputLayout : ID3D10DeviceChild {
public extern(Windows):
}

enum {
	D3D10_FILTER_MIN_MAG_MIP_POINT                          = 0,
	D3D10_FILTER_MIN_MAG_POINT_MIP_LINEAR                   = 0x1,
	D3D10_FILTER_MIN_POINT_MAG_LINEAR_MIP_POINT             = 0x4,
	D3D10_FILTER_MIN_POINT_MAG_MIP_LINEAR                   = 0x5,
	D3D10_FILTER_MIN_LINEAR_MAG_MIP_POINT                   = 0x10,
	D3D10_FILTER_MIN_LINEAR_MAG_POINT_MIP_LINEAR            = 0x11,
	D3D10_FILTER_MIN_MAG_LINEAR_MIP_POINT                   = 0x14,
	D3D10_FILTER_MIN_MAG_MIP_LINEAR                         = 0x15,
	D3D10_FILTER_ANISOTROPIC                                = 0x55,
	D3D10_FILTER_COMPARISON_MIN_MAG_MIP_POINT               = 0x80,
	D3D10_FILTER_COMPARISON_MIN_MAG_POINT_MIP_LINEAR        = 0x81,
	D3D10_FILTER_COMPARISON_MIN_POINT_MAG_LINEAR_MIP_POINT  = 0x84,
	D3D10_FILTER_COMPARISON_MIN_POINT_MAG_MIP_LINEAR        = 0x85,
	D3D10_FILTER_COMPARISON_MIN_LINEAR_MAG_MIP_POINT        = 0x90,
	D3D10_FILTER_COMPARISON_MIN_LINEAR_MAG_POINT_MIP_LINEAR = 0x91,
	D3D10_FILTER_COMPARISON_MIN_MAG_LINEAR_MIP_POINT        = 0x94,
	D3D10_FILTER_COMPARISON_MIN_MAG_MIP_LINEAR              = 0x95,
	D3D10_FILTER_COMPARISON_ANISOTROPIC                     = 0xd5,
	D3D10_FILTER_TEXT_1BIT                                  = 0x80000000
}
alias int D3D10_FILTER;

enum {
	D3D10_FILTER_TYPE_POINT  = 0,
	D3D10_FILTER_TYPE_LINEAR = 1
}
alias int D3D10_FILTER_TYPE;

enum {
	D3D10_FILTER_TYPE_MASK          = 0x3,
	D3D10_MIN_FILTER_SHIFT          = 4,
	D3D10_MAG_FILTER_SHIFT          = 2,
	D3D10_MIP_FILTER_SHIFT          = 0,
	D3D10_COMPARISON_FILTERING_BIT  = 0x80,
	D3D10_ANISOTROPIC_FILTERING_BIT = 0x40,
	D3D10_TEXT_1BIT_BIT             = 0x80000000,
}

/*
D3D10_ENCODE_BASIC_FILTER( min, mag, mip, bComparison ) ( ( D3D10_FILTER ) (  ( ( bComparison ) ? D3D10_COMPARISON_FILTERING_BIT : 0 ) |  ( ( ( min ) & D3D10_FILTER_TYPE_MASK ) << D3D10_MIN_FILTER_SHIFT ) |  ( ( ( mag ) & D3D10_FILTER_TYPE_MASK ) << D3D10_MAG_FILTER_SHIFT ) |  ( ( ( mip ) & D3D10_FILTER_TYPE_MASK ) << D3D10_MIP_FILTER_SHIFT ) ) )
D3D10_ENCODE_ANISOTROPIC_FILTER( bComparison )  ( ( D3D10_FILTER ) (  D3D10_ANISOTROPIC_FILTERING_BIT |  D3D10_ENCODE_BASIC_FILTER( D3D10_FILTER_TYPE_LINEAR,  D3D10_FILTER_TYPE_LINEAR,  D3D10_FILTER_TYPE_LINEAR,  bComparison ) ) )
D3D10_DECODE_MIN_FILTER( d3d10Filter )  ( ( D3D10_FILTER_TYPE )  ( ( ( d3d10Filter ) >> D3D10_MIN_FILTER_SHIFT ) & D3D10_FILTER_TYPE_MASK ) )
D3D10_DECODE_MAG_FILTER( d3d10Filter )  ( ( D3D10_FILTER_TYPE )  ( ( ( d3d10Filter ) >> D3D10_MAG_FILTER_SHIFT ) & D3D10_FILTER_TYPE_MASK ) )
D3D10_DECODE_MIP_FILTER( d3d10Filter )  ( ( D3D10_FILTER_TYPE )  ( ( ( d3d10Filter ) >> D3D10_MIP_FILTER_SHIFT ) & D3D10_FILTER_TYPE_MASK ) )
D3D10_DECODE_IS_COMPARISON_FILTER( d3d10Filter )  ( ( d3d10Filter ) & D3D10_COMPARISON_FILTERING_BIT )
D3D10_DECODE_IS_ANISOTROPIC_FILTER( d3d10Filter )  ( ( ( d3d10Filter ) & D3D10_ANISOTROPIC_FILTERING_BIT ) &&  ( D3D10_FILTER_TYPE_LINEAR == D3D10_DECODE_MIN_FILTER( d3d10Filter ) ) &&  ( D3D10_FILTER_TYPE_LINEAR == D3D10_DECODE_MAG_FILTER( d3d10Filter ) ) &&  ( D3D10_FILTER_TYPE_LINEAR == D3D10_DECODE_MIP_FILTER( d3d10Filter ) ) )
D3D10_DECODE_IS_TEXT_1BIT_FILTER( d3d10Filter )  ( ( d3d10Filter ) == D3D10_TEXT_1BIT_BIT )
*/

enum {
	D3D10_TEXTURE_ADDRESS_WRAP        = 1,
	D3D10_TEXTURE_ADDRESS_MIRROR      = 2,
	D3D10_TEXTURE_ADDRESS_CLAMP       = 3,
	D3D10_TEXTURE_ADDRESS_BORDER      = 4,
	D3D10_TEXTURE_ADDRESS_MIRROR_ONCE = 5
}
alias int D3D10_TEXTURE_ADDRESS_MODE;

struct D3D10_SAMPLER_DESC {
	D3D10_FILTER Filter;
	D3D10_TEXTURE_ADDRESS_MODE AddressU;
	D3D10_TEXTURE_ADDRESS_MODE AddressV;
	D3D10_TEXTURE_ADDRESS_MODE AddressW;
	FLOAT MipLODBias;
	UINT MaxAnisotropy;
	D3D10_COMPARISON_FUNC ComparisonFunc;
	FLOAT[4] BorderColor;
	FLOAT MinLOD;
	FLOAT MaxLOD;
}

//MIDL_INTERFACE("9B7E4C0C-342C-4106-A19F-4F2704F689F0")
interface ID3D10SamplerState : ID3D10DeviceChild {
public extern(Windows):
	void GetDesc(D3D10_SAMPLER_DESC* pDesc);
}

enum {
	D3D10_FORMAT_SUPPORT_BUFFER                   = 0x1,
	D3D10_FORMAT_SUPPORT_IA_VERTEX_BUFFER         = 0x2,
	D3D10_FORMAT_SUPPORT_IA_INDEX_BUFFER          = 0x4,
	D3D10_FORMAT_SUPPORT_SO_BUFFER                = 0x8,
	D3D10_FORMAT_SUPPORT_TEXTURE1D                = 0x10,
	D3D10_FORMAT_SUPPORT_TEXTURE2D                = 0x20,
	D3D10_FORMAT_SUPPORT_TEXTURE3D                = 0x40,
	D3D10_FORMAT_SUPPORT_TEXTURECUBE              = 0x80,
	D3D10_FORMAT_SUPPORT_SHADER_LOAD              = 0x100,
	D3D10_FORMAT_SUPPORT_SHADER_SAMPLE            = 0x200,
	D3D10_FORMAT_SUPPORT_SHADER_SAMPLE_COMPARISON = 0x400,
	D3D10_FORMAT_SUPPORT_SHADER_SAMPLE_MONO_TEXT  = 0x800,
	D3D10_FORMAT_SUPPORT_MIP                      = 0x1000,
	D3D10_FORMAT_SUPPORT_MIP_AUTOGEN              = 0x2000,
	D3D10_FORMAT_SUPPORT_RENDER_TARGET            = 0x4000,
	D3D10_FORMAT_SUPPORT_BLENDABLE                = 0x8000,
	D3D10_FORMAT_SUPPORT_DEPTH_STENCIL            = 0x10000,
	D3D10_FORMAT_SUPPORT_CPU_LOCKABLE             = 0x20000,
	D3D10_FORMAT_SUPPORT_MULTISAMPLE_RESOLVE      = 0x40000,
	D3D10_FORMAT_SUPPORT_DISPLAY                  = 0x80000,
	D3D10_FORMAT_SUPPORT_CAST_WITHIN_BIT_LAYOUT   = 0x100000,
	D3D10_FORMAT_SUPPORT_MULTISAMPLE_RENDERTARGET = 0x200000,
	D3D10_FORMAT_SUPPORT_MULTISAMPLE_LOAD         = 0x400000,
	D3D10_FORMAT_SUPPORT_SHADER_GATHER            = 0x800000,
	D3D10_FORMAT_SUPPORT_BACK_BUFFER_CAST         = 0x1000000
}
alias int D3D10_FORMAT_SUPPORT;

//MIDL_INTERFACE("9B7E4C0D-342C-4106-A19F-4F2704F689F0")
interface ID3D10Asynchronous : ID3D10DeviceChild {
public extern(Windows):
	void Begin();
	void End();
	HRESULT GetData(void* pData, UINT DataSize, UINT GetDataFlags);
	UINT GetDataSize();
}

enum {
	D3D10_ASYNC_GETDATA_DONOTFLUSH = 0x1
}
alias int D3D10_ASYNC_GETDATA_FLAG;

enum {
	D3D10_QUERY_EVENT                 = 0,
	D3D10_QUERY_OCCLUSION             = D3D10_QUERY_EVENT + 1,
	D3D10_QUERY_TIMESTAMP             = D3D10_QUERY_OCCLUSION + 1,
	D3D10_QUERY_TIMESTAMP_DISJOINT    = D3D10_QUERY_TIMESTAMP + 1,
	D3D10_QUERY_PIPELINE_STATISTICS   = D3D10_QUERY_TIMESTAMP_DISJOINT + 1,
	D3D10_QUERY_OCCLUSION_PREDICATE   = D3D10_QUERY_PIPELINE_STATISTICS + 1,
	D3D10_QUERY_SO_STATISTICS         = D3D10_QUERY_OCCLUSION_PREDICATE + 1,
	D3D10_QUERY_SO_OVERFLOW_PREDICATE = D3D10_QUERY_SO_STATISTICS + 1
}
alias int D3D10_QUERY;

enum {
	D3D10_QUERY_MISC_PREDICATEHINT = 0x1
}
alias int D3D10_QUERY_MISC_FLAG;

struct D3D10_QUERY_DESC {
	D3D10_QUERY Query;
	UINT MiscFlags;
}

//MIDL_INTERFACE("9B7E4C0E-342C-4106-A19F-4F2704F689F0")
interface ID3D10Query : ID3D10Asynchronous {
public extern(Windows):
	void GetDesc(D3D10_QUERY_DESC* pDesc);
}

//MIDL_INTERFACE("9B7E4C10-342C-4106-A19F-4F2704F689F0")
interface ID3D10Predicate : ID3D10Query {
public extern(Windows):
}

struct D3D10_QUERY_DATA_TIMESTAMP_DISJOINT {
	UINT64 Frequency;
	BOOL Disjoint;
}

struct D3D10_QUERY_DATA_PIPELINE_STATISTICS {
	UINT64 IAVertices;
	UINT64 IAPrimitives;
	UINT64 VSInvocations;
	UINT64 GSInvocations;
	UINT64 GSPrimitives;
	UINT64 CInvocations;
	UINT64 CPrimitives;
	UINT64 PSInvocations;
}

struct D3D10_QUERY_DATA_SO_STATISTICS {
	UINT64 NumPrimitivesWritten;
	UINT64 PrimitivesStorageNeeded;
}

enum {
	D3D10_COUNTER_GPU_IDLE                              = 0,
	D3D10_COUNTER_VERTEX_PROCESSING                     = D3D10_COUNTER_GPU_IDLE + 1,
	D3D10_COUNTER_GEOMETRY_PROCESSING                   = D3D10_COUNTER_VERTEX_PROCESSING + 1,
	D3D10_COUNTER_PIXEL_PROCESSING                      = D3D10_COUNTER_GEOMETRY_PROCESSING + 1,
	D3D10_COUNTER_OTHER_GPU_PROCESSING                  = D3D10_COUNTER_PIXEL_PROCESSING + 1,
	D3D10_COUNTER_HOST_ADAPTER_BANDWIDTH_UTILIZATION    = D3D10_COUNTER_OTHER_GPU_PROCESSING + 1,
	D3D10_COUNTER_LOCAL_VIDMEM_BANDWIDTH_UTILIZATION    = D3D10_COUNTER_HOST_ADAPTER_BANDWIDTH_UTILIZATION + 1,
	D3D10_COUNTER_VERTEX_THROUGHPUT_UTILIZATION         = D3D10_COUNTER_LOCAL_VIDMEM_BANDWIDTH_UTILIZATION + 1,
	D3D10_COUNTER_TRIANGLE_SETUP_THROUGHPUT_UTILIZATION = D3D10_COUNTER_VERTEX_THROUGHPUT_UTILIZATION + 1,
	D3D10_COUNTER_FILLRATE_THROUGHPUT_UTILIZATION       = D3D10_COUNTER_TRIANGLE_SETUP_THROUGHPUT_UTILIZATION + 1,
	D3D10_COUNTER_VS_MEMORY_LIMITED                     = D3D10_COUNTER_FILLRATE_THROUGHPUT_UTILIZATION + 1,
	D3D10_COUNTER_VS_COMPUTATION_LIMITED                = D3D10_COUNTER_VS_MEMORY_LIMITED + 1,
	D3D10_COUNTER_GS_MEMORY_LIMITED                     = D3D10_COUNTER_VS_COMPUTATION_LIMITED + 1,
	D3D10_COUNTER_GS_COMPUTATION_LIMITED                = D3D10_COUNTER_GS_MEMORY_LIMITED + 1,
	D3D10_COUNTER_PS_MEMORY_LIMITED                     = D3D10_COUNTER_GS_COMPUTATION_LIMITED + 1,
	D3D10_COUNTER_PS_COMPUTATION_LIMITED                = D3D10_COUNTER_PS_MEMORY_LIMITED + 1,
	D3D10_COUNTER_POST_TRANSFORM_CACHE_HIT_RATE         = D3D10_COUNTER_PS_COMPUTATION_LIMITED + 1,
	D3D10_COUNTER_TEXTURE_CACHE_HIT_RATE                = D3D10_COUNTER_POST_TRANSFORM_CACHE_HIT_RATE + 1,
	D3D10_COUNTER_DEVICE_DEPENDENT_0                    = 0x40000000
}
alias int D3D10_COUNTER;

enum {
	D3D10_COUNTER_TYPE_FLOAT32 = 0,
	D3D10_COUNTER_TYPE_UINT16  = D3D10_COUNTER_TYPE_FLOAT32 + 1,
	D3D10_COUNTER_TYPE_UINT32  = D3D10_COUNTER_TYPE_UINT16 + 1,
	D3D10_COUNTER_TYPE_UINT64  = D3D10_COUNTER_TYPE_UINT32 + 1
}
alias int D3D10_COUNTER_TYPE;

struct D3D10_COUNTER_DESC {
	D3D10_COUNTER Counter;
	UINT MiscFlags;
}

struct D3D10_COUNTER_INFO {
	D3D10_COUNTER LastDeviceDependentCounter;
	UINT NumSimultaneousCounters;
	UINT8 NumDetectableParallelUnits;
}

//MIDL_INTERFACE("9B7E4C11-342C-4106-A19F-4F2704F689F0")
interface ID3D10Counter : ID3D10Asynchronous {
public extern(Windows):
	void GetDesc(D3D10_COUNTER_DESC* pDesc);
}

//MIDL_INTERFACE("9B7E4C0F-342C-4106-A19F-4F2704F689F0")
interface ID3D10Device : IUnknown {
public extern(Windows):
	void VSSetConstantBuffers(UINT StartSlot, UINT NumBuffers, const(ID3D10Buffer)* ppConstantBuffers);
	void PSSetShaderResources(UINT StartSlot, UINT NumViews, const(ID3D10ShaderResourceView)* ppShaderResourceViews);
	void PSSetShader(ID3D10PixelShader pPixelShader);
	void PSSetSamplers(UINT StartSlot, UINT NumSamplers, const(ID3D10SamplerState)* ppSamplers);
	void VSSetShader(ID3D10VertexShader pVertexShader);
	void DrawIndexed(UINT IndexCount, UINT StartIndexLocation, INT BaseVertexLocation);
	void Draw(UINT VertexCount, UINT StartVertexLocation);
	void PSSetConstantBuffers(UINT StartSlot, UINT NumBuffers, const(ID3D10Buffer)* ppConstantBuffers);
	void IASetInputLayout(ID3D10InputLayout pInputLayout);
	void IASetVertexBuffers(UINT StartSlot, UINT NumBuffers, const(ID3D10Buffer)* ppVertexBuffers, const(UINT)* pStrides, const(UINT)* pOffsets);
	void IASetIndexBuffer(ID3D10Buffer pIndexBuffer, DXGI_FORMAT Format, UINT Offset);
	void DrawIndexedInstanced(UINT IndexCountPerInstance, UINT InstanceCount, UINT StartIndexLocation, INT BaseVertexLocation, UINT StartInstanceLocation);
	void DrawInstanced(UINT VertexCountPerInstance, UINT InstanceCount, UINT StartVertexLocation, UINT StartInstanceLocation);
	void GSSetConstantBuffers(UINT StartSlot, UINT NumBuffers, const(ID3D10Buffer)* ppConstantBuffers);
	void GSSetShader(ID3D10GeometryShader pShader);
	void IASetPrimitiveTopology(D3D10_PRIMITIVE_TOPOLOGY Topology);
	void VSSetShaderResources(UINT StartSlot, UINT NumViews, const(ID3D10ShaderResourceView)* ppShaderResourceViews);
	void VSSetSamplers(UINT StartSlot, UINT NumSamplers, const(ID3D10SamplerState)* ppSamplers);
	void SetPredication(ID3D10Predicate pPredicate, BOOL PredicateValue);
	void GSSetShaderResources(UINT StartSlot, UINT NumViews, const(ID3D10ShaderResourceView)* ppShaderResourceViews);
	void GSSetSamplers(UINT StartSlot, UINT NumSamplers, const(ID3D10SamplerState)* ppSamplers);
	void OMSetRenderTargets(UINT NumViews, const(ID3D10RenderTargetView)* ppRenderTargetViews, ID3D10DepthStencilView pDepthStencilView);
	void OMSetBlendState(ID3D10BlendState pBlendState, const(FLOAT[4]) BlendFactor, UINT SampleMask);
	void OMSetDepthStencilState(ID3D10DepthStencilState pDepthStencilState, UINT StencilRef);
	void SOSetTargets(UINT NumBuffers, const(ID3D10Buffer)* ppSOTargets, const(UINT)* pOffsets);
	void DrawAuto();
	void RSSetState(ID3D10RasterizerState pRasterizerState);
	void RSSetViewports(UINT NumViewports, const(D3D10_VIEWPORT)* pViewports);
	void RSSetScissorRects(UINT NumRects, const(D3D10_RECT)* pRects);
	void CopySubresourceRegion(ID3D10Resource pDstResource, UINT DstSubresource, UINT DstX, UINT DstY, UINT DstZ, ID3D10Resource pSrcResource, UINT SrcSubresource, const(D3D10_BOX)* pSrcBox);
	void CopyResource(ID3D10Resource pDstResource, ID3D10Resource pSrcResource);
	void UpdateSubresource(ID3D10Resource pDstResource, UINT DstSubresource, const(D3D10_BOX)* pDstBox, const(void)* pSrcData, UINT SrcRowPitch, UINT SrcDepthPitch);
	void ClearRenderTargetView(ID3D10RenderTargetView pRenderTargetView, const(FLOAT[4]) ColorRGBA);
	void ClearDepthStencilView(ID3D10DepthStencilView pDepthStencilView, UINT ClearFlags, FLOAT Depth, UINT8 Stencil);
	void GenerateMips(ID3D10ShaderResourceView pShaderResourceView);
	void ResolveSubresource(ID3D10Resource pDstResource, UINT DstSubresource, ID3D10Resource pSrcResource, UINT SrcSubresource, DXGI_FORMAT Format);
	void VSGetConstantBuffers(UINT StartSlot, UINT NumBuffers, ID3D10Buffer* ppConstantBuffers);
	void PSGetShaderResources(UINT StartSlot, UINT NumViews, ID3D10ShaderResourceView* ppShaderResourceViews);
	void PSGetShader(ID3D10PixelShader* ppPixelShader);
	void PSGetSamplers(UINT StartSlot, UINT NumSamplers, ID3D10SamplerState* ppSamplers);
	void VSGetShader(ID3D10VertexShader* ppVertexShader);
	void PSGetConstantBuffers(UINT StartSlot, UINT NumBuffers, ID3D10Buffer* ppConstantBuffers);
	void IAGetInputLayout(ID3D10InputLayout* ppInputLayout);
	void IAGetVertexBuffers(UINT StartSlot, UINT NumBuffers, ID3D10Buffer* ppVertexBuffers, UINT* pStrides, UINT* pOffsets);
	void IAGetIndexBuffer(ID3D10Buffer* pIndexBuffer, DXGI_FORMAT* Format, UINT* Offset);
	void GSGetConstantBuffers(UINT StartSlot, UINT NumBuffers, ID3D10Buffer* ppConstantBuffers);
	void GSGetShader(ID3D10GeometryShader* ppGeometryShader);
	void IAGetPrimitiveTopology(D3D10_PRIMITIVE_TOPOLOGY* pTopology);
	void VSGetShaderResources(UINT StartSlot, UINT NumViews, ID3D10ShaderResourceView* ppShaderResourceViews);
	void VSGetSamplers(UINT StartSlot, UINT NumSamplers, ID3D10SamplerState* ppSamplers);
	void GetPredication(ID3D10Predicate* ppPredicate, BOOL* pPredicateValue);
	void GSGetShaderResources(UINT StartSlot, UINT NumViews, ID3D10ShaderResourceView* ppShaderResourceViews);
	void GSGetSamplers(UINT StartSlot, UINT NumSamplers, ID3D10SamplerState* ppSamplers);
	void OMGetRenderTargets(UINT NumViews, ID3D10RenderTargetView* ppRenderTargetViews, ID3D10DepthStencilView* ppDepthStencilView);
	void OMGetBlendState(ID3D10BlendState* ppBlendState, FLOAT[4] BlendFactor, UINT* pSampleMask);
	void OMGetDepthStencilState(ID3D10DepthStencilState* ppDepthStencilState, UINT* pStencilRef);
	void SOGetTargets(UINT NumBuffers, ID3D10Buffer* ppSOTargets, UINT* pOffsets);
	void RSGetState(ID3D10RasterizerState* ppRasterizerState);
	void RSGetViewports(UINT* NumViewports, D3D10_VIEWPORT* pViewports);
	void RSGetScissorRects(UINT* NumRects, D3D10_RECT* pRects);
	HRESULT GetDeviceRemovedReason();
	HRESULT SetExceptionMode(UINT RaiseFlags);
	UINT GetExceptionMode();
	HRESULT GetPrivateData(REFGUID guid, UINT* pDataSize, void* pData);
	HRESULT SetPrivateData(REFGUID guid, UINT DataSize, const(void)* pData);
	HRESULT SetPrivateDataInterface(REFGUID guid, const(IUnknown) pData);
	void ClearState();
	void Flush();
	HRESULT CreateBuffer(const(D3D10_BUFFER_DESC)* pDesc, const(D3D10_SUBRESOURCE_DATA)* pInitialData, ID3D10Buffer* ppBuffer);
	HRESULT CreateTexture1D(const(D3D10_TEXTURE1D_DESC)* pDesc, const(D3D10_SUBRESOURCE_DATA)* pInitialData, ID3D10Texture1D* ppTexture1D);
	HRESULT CreateTexture2D(const(D3D10_TEXTURE2D_DESC)* pDesc, const(D3D10_SUBRESOURCE_DATA)* pInitialData, ID3D10Texture2D* ppTexture2D);
	HRESULT CreateTexture3D(const(D3D10_TEXTURE3D_DESC)* pDesc, const(D3D10_SUBRESOURCE_DATA)* pInitialData, ID3D10Texture3D* ppTexture3D);
	HRESULT CreateShaderResourceView(ID3D10Resource pResource, const(D3D10_SHADER_RESOURCE_VIEW_DESC)* pDesc, ID3D10ShaderResourceView* ppSRView);
	HRESULT CreateRenderTargetView(ID3D10Resource pResource, const(D3D10_RENDER_TARGET_VIEW_DESC)* pDesc, ID3D10RenderTargetView* ppRTView);
	HRESULT CreateDepthStencilView(ID3D10Resource pResource, const(D3D10_DEPTH_STENCIL_VIEW_DESC)* pDesc, ID3D10DepthStencilView* ppDepthStencilView);
	HRESULT CreateInputLayout(const(D3D10_INPUT_ELEMENT_DESC)* pInputElementDescs, UINT NumElements, const(void)* pShaderBytecodeWithInputSignature, SIZE_T BytecodeLength, ID3D10InputLayout* ppInputLayout);
	HRESULT CreateVertexShader(const(void)* pShaderBytecode, SIZE_T BytecodeLength, ID3D10VertexShader* ppVertexShader);
	HRESULT CreateGeometryShader(const(void)* pShaderBytecode, SIZE_T BytecodeLength, ID3D10GeometryShader* ppGeometryShader);
	HRESULT CreateGeometryShaderWithStreamOutput(const(void)* pShaderBytecode, SIZE_T BytecodeLength, const(D3D10_SO_DECLARATION_ENTRY)* pSODeclaration, UINT NumEntries, UINT OutputStreamStride, ID3D10GeometryShader* ppGeometryShader);
	HRESULT CreatePixelShader(const(void)* pShaderBytecode, SIZE_T BytecodeLength, ID3D10PixelShader* ppPixelShader);
	HRESULT CreateBlendState(const(D3D10_BLEND_DESC)* pBlendStateDesc, ID3D10BlendState* ppBlendState);
	HRESULT CreateDepthStencilState(const(D3D10_DEPTH_STENCIL_DESC)* pDepthStencilDesc, ID3D10DepthStencilState* ppDepthStencilState);
	HRESULT CreateRasterizerState(const(D3D10_RASTERIZER_DESC)* pRasterizerDesc, ID3D10RasterizerState* ppRasterizerState);
	HRESULT CreateSamplerState(const(D3D10_SAMPLER_DESC)* pSamplerDesc, ID3D10SamplerState* ppSamplerState);
	HRESULT CreateQuery(const(D3D10_QUERY_DESC)* pQueryDesc, ID3D10Query* ppQuery);
	HRESULT CreatePredicate(const(D3D10_QUERY_DESC)* pPredicateDesc, ID3D10Predicate* ppPredicate);
	HRESULT CreateCounter(const(D3D10_COUNTER_DESC)* pCounterDesc, ID3D10Counter* ppCounter);
	HRESULT CheckFormatSupport(DXGI_FORMAT Format, UINT* pFormatSupport);
	HRESULT CheckMultisampleQualityLevels(DXGI_FORMAT Format, UINT SampleCount, UINT* pNumQualityLevels);
	void CheckCounterInfo(D3D10_COUNTER_INFO* pCounterInfo);
	HRESULT CheckCounter(const(D3D10_COUNTER_DESC)* pDesc, D3D10_COUNTER_TYPE* pType, UINT* pActiveCounters, LPSTR szName, UINT* pNameLength, LPSTR szUnits, UINT* pUnitsLength, LPSTR szDescription, UINT* pDescriptionLength);
	UINT GetCreationFlags();
	HRESULT OpenSharedResource(HANDLE hResource, REFIID ReturnedInterface, void** ppResource);
	void SetTextFilterSize(UINT Width, UINT Height);
	void GetTextFilterSize(UINT* pWidth, UINT* pHeight);
}

//MIDL_INTERFACE("9B7E4E00-342C-4106-A19F-4F2704F689F0")
interface ID3D10Multithread : IUnknown {
public extern(Windows):
	void Enter();
	void Leave();
	BOOL SetMultithreadProtected(BOOL bMTProtect);
	BOOL GetMultithreadProtected();
}

enum {
	D3D10_CREATE_DEVICE_SINGLETHREADED                           = 0x1,
	D3D10_CREATE_DEVICE_DEBUG                                    = 0x2,
	D3D10_CREATE_DEVICE_SWITCH_TO_REF                            = 0x4,
	D3D10_CREATE_DEVICE_PREVENT_INTERNAL_THREADING_OPTIMIZATIONS = 0x8,
	D3D10_CREATE_DEVICE_ALLOW_NULL_FROM_MAP                      = 0x10,
	D3D10_CREATE_DEVICE_BGRA_SUPPORT                             = 0x20,
	D3D10_CREATE_DEVICE_STRICT_VALIDATION                        = 0x200
}
alias int D3D10_CREATE_DEVICE_FLAG;

enum D3D10_SDK_VERSION =  29;

mixin DEFINE_GUID!("IID_ID3D10DeviceChild", 0x9B7E4C00, 0x342C, 0x4106, 0xA1, 0x9F, 0x4F, 0x27, 0x04, 0xF6, 0x89, 0xF0);
mixin DEFINE_GUID!("IID_ID3D10DepthStencilState", 0x2B4B1CC8, 0xA4AD, 0x41f8, 0x83, 0x22, 0xCA, 0x86, 0xFC, 0x3E, 0xC6, 0x75);
mixin DEFINE_GUID!("IID_ID3D10BlendState", 0xEDAD8D19, 0x8A35, 0x4d6d, 0x85, 0x66, 0x2E, 0xA2, 0x76, 0xCD, 0xE1, 0x61);
mixin DEFINE_GUID!("IID_ID3D10RasterizerState", 0xA2A07292, 0x89AF, 0x4345, 0xBE, 0x2E, 0xC5, 0x3D, 0x9F, 0xBB, 0x6E, 0x9F);
mixin DEFINE_GUID!("IID_ID3D10Resource", 0x9B7E4C01, 0x342C, 0x4106, 0xA1, 0x9F, 0x4F, 0x27, 0x04, 0xF6, 0x89, 0xF0);
mixin DEFINE_GUID!("IID_ID3D10Buffer", 0x9B7E4C02, 0x342C, 0x4106, 0xA1, 0x9F, 0x4F, 0x27, 0x04, 0xF6, 0x89, 0xF0);
mixin DEFINE_GUID!("IID_ID3D10Texture1D", 0x9B7E4C03, 0x342C, 0x4106, 0xA1, 0x9F, 0x4F, 0x27, 0x04, 0xF6, 0x89, 0xF0);
mixin DEFINE_GUID!("IID_ID3D10Texture2D", 0x9B7E4C04, 0x342C, 0x4106, 0xA1, 0x9F, 0x4F, 0x27, 0x04, 0xF6, 0x89, 0xF0);
mixin DEFINE_GUID!("IID_ID3D10Texture3D", 0x9B7E4C05, 0x342C, 0x4106, 0xA1, 0x9F, 0x4F, 0x27, 0x04, 0xF6, 0x89, 0xF0);
mixin DEFINE_GUID!("IID_ID3D10View", 0xC902B03F, 0x60A7, 0x49BA, 0x99, 0x36, 0x2A, 0x3A, 0xB3, 0x7A, 0x7E, 0x33);
mixin DEFINE_GUID!("IID_ID3D10ShaderResourceView", 0x9B7E4C07, 0x342C, 0x4106, 0xA1, 0x9F, 0x4F, 0x27, 0x04, 0xF6, 0x89, 0xF0);
mixin DEFINE_GUID!("IID_ID3D10RenderTargetView", 0x9B7E4C08, 0x342C, 0x4106, 0xA1, 0x9F, 0x4F, 0x27, 0x04, 0xF6, 0x89, 0xF0);
mixin DEFINE_GUID!("IID_ID3D10DepthStencilView", 0x9B7E4C09, 0x342C, 0x4106, 0xA1, 0x9F, 0x4F, 0x27, 0x04, 0xF6, 0x89, 0xF0);
mixin DEFINE_GUID!("IID_ID3D10VertexShader", 0x9B7E4C0A, 0x342C, 0x4106, 0xA1, 0x9F, 0x4F, 0x27, 0x04, 0xF6, 0x89, 0xF0);
mixin DEFINE_GUID!("IID_ID3D10GeometryShader", 0x6316BE88, 0x54CD, 0x4040, 0xAB, 0x44, 0x20, 0x46, 0x1B, 0xC8, 0x1F, 0x68);
mixin DEFINE_GUID!("IID_ID3D10PixelShader", 0x4968B601, 0x9D00, 0x4cde, 0x83, 0x46, 0x8E, 0x7F, 0x67, 0x58, 0x19, 0xB6);
mixin DEFINE_GUID!("IID_ID3D10InputLayout", 0x9B7E4C0B, 0x342C, 0x4106, 0xA1, 0x9F, 0x4F, 0x27, 0x04, 0xF6, 0x89, 0xF0);
mixin DEFINE_GUID!("IID_ID3D10SamplerState", 0x9B7E4C0C, 0x342C, 0x4106, 0xA1, 0x9F, 0x4F, 0x27, 0x04, 0xF6, 0x89, 0xF0);
mixin DEFINE_GUID!("IID_ID3D10Asynchronous", 0x9B7E4C0D, 0x342C, 0x4106, 0xA1, 0x9F, 0x4F, 0x27, 0x04, 0xF6, 0x89, 0xF0);
mixin DEFINE_GUID!("IID_ID3D10Query", 0x9B7E4C0E, 0x342C, 0x4106, 0xA1, 0x9F, 0x4F, 0x27, 0x04, 0xF6, 0x89, 0xF0);
mixin DEFINE_GUID!("IID_ID3D10Predicate", 0x9B7E4C10, 0x342C, 0x4106, 0xA1, 0x9F, 0x4F, 0x27, 0x04, 0xF6, 0x89, 0xF0);
mixin DEFINE_GUID!("IID_ID3D10Counter", 0x9B7E4C11, 0x342C, 0x4106, 0xA1, 0x9F, 0x4F, 0x27, 0x04, 0xF6, 0x89, 0xF0);
mixin DEFINE_GUID!("IID_ID3D10Device", 0x9B7E4C0F, 0x342C, 0x4106, 0xA1, 0x9F, 0x4F, 0x27, 0x04, 0xF6, 0x89, 0xF0);
mixin DEFINE_GUID!("IID_ID3D10Multithread", 0x9B7E4E00, 0x342C, 0x4106, 0xA1, 0x9F, 0x4F, 0x27, 0x04, 0xF6, 0x89, 0xF0);

} // extern(C)

