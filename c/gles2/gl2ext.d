/** gl2ext.d

Converted from 'gl2ext.h'.

Version: 2.0
See_Also: http://www.khronos.org/opengles/2_X/
Authors: Koji Kishita
*/
module c.gles2.gl2ext;


/*
 * This document is licensed under the SGI Free Software B License Version
 * 2.0. For details, see http://oss.sgi.com/projects/FreeB/ .
 */


import c.gles2.gl2;


enum {
	GL_ETC1_RGB8_OES                                        = 0x8D64,

	GL_PALETTE4_RGB8_OES                                    = 0x8B90,
	GL_PALETTE4_RGBA8_OES                                   = 0x8B91,
	GL_PALETTE4_R5_G6_B5_OES                                = 0x8B92,
	GL_PALETTE4_RGBA4_OES                                   = 0x8B93,
	GL_PALETTE4_RGB5_A1_OES                                 = 0x8B94,
	GL_PALETTE8_RGB8_OES                                    = 0x8B95,
	GL_PALETTE8_RGBA8_OES                                   = 0x8B96,
	GL_PALETTE8_R5_G6_B5_OES                                = 0x8B97,
	GL_PALETTE8_RGBA4_OES                                   = 0x8B98,
	GL_PALETTE8_RGB5_A1_OES                                 = 0x8B99,

	GL_DEPTH_COMPONENT24_OES                                = 0x81A6,

	GL_DEPTH_COMPONENT32_OES                                = 0x81A7,
}

alias void* GLeglImageOES;

enum {
	GL_UNSIGNED_INT                                         = 0x1405,

	GL_PROGRAM_BINARY_LENGTH_OES                            = 0x8741,
	GL_NUM_PROGRAM_BINARY_FORMATS_OES                       = 0x87FE,
	GL_PROGRAM_BINARY_FORMATS_OES                           = 0x87FF,

	GL_WRITE_ONLY_OES                                       = 0x88B9,
	GL_BUFFER_ACCESS_OES                                    = 0x88BB,
	GL_BUFFER_MAPPED_OES                                    = 0x88BC,
	GL_BUFFER_MAP_POINTER_OES                               = 0x88BD,

	GL_DEPTH_STENCIL_OES                                    = 0x84F9,
	GL_UNSIGNED_INT_24_8_OES                                = 0x84FA,
	GL_DEPTH24_STENCIL8_OES                                 = 0x88F0,

	GL_RGB8_OES                                             = 0x8051,
	GL_RGBA8_OES                                            = 0x8058,

	GL_FRAGMENT_SHADER_DERIVATIVE_HINT_OES                  = 0x8B8B,

	GL_STENCIL_INDEX1_OES                                   = 0x8D46,

	GL_STENCIL_INDEX4_OES                                   = 0x8D47,

	GL_TEXTURE_WRAP_R_OES                                   = 0x8072,
	GL_TEXTURE_3D_OES                                       = 0x806F,
	GL_TEXTURE_BINDING_3D_OES                               = 0x806A,
	GL_MAX_3D_TEXTURE_SIZE_OES                              = 0x8073,
	GL_SAMPLER_3D_OES                                       = 0x8B5F,
	GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_3D_ZOFFSET_OES        = 0x8CD4,

	GL_HALF_FLOAT_OES                                       = 0x8D61,

	GL_VERTEX_ARRAY_BINDING_OES                             = 0x85B5,

	GL_UNSIGNED_INT_10_10_10_2_OES                          = 0x8DF6,
	GL_INT_10_10_10_2_OES                                   = 0x8DF7,

	GL_3DC_X_AMD                                            = 0x87F9,
	GL_3DC_XY_AMD                                           = 0x87FA,

	GL_ATC_RGB_AMD                                          = 0x8C92,
	GL_ATC_RGBA_EXPLICIT_ALPHA_AMD                          = 0x8C93,
	GL_ATC_RGBA_INTERPOLATED_ALPHA_AMD                      = 0x87EE,

	GL_COUNTER_TYPE_AMD                                     = 0x8BC0,
	GL_COUNTER_RANGE_AMD                                    = 0x8BC1,
	GL_UNSIGNED_INT64_AMD                                   = 0x8BC2,
	GL_PERCENTAGE_AMD                                       = 0x8BC3,
	GL_PERFMON_RESULT_AVAILABLE_AMD                         = 0x8BC4,
	GL_PERFMON_RESULT_SIZE_AMD                              = 0x8BC5,
	GL_PERFMON_RESULT_AMD                                   = 0x8BC6,

	GL_Z400_BINARY_AMD                                      = 0x8740,

	GL_MIN_EXT                                              = 0x8007,
	GL_MAX_EXT                                              = 0x8008,

	GL_COLOR_EXT                                            = 0x1800,
	GL_DEPTH_EXT                                            = 0x1801,
	GL_STENCIL_EXT                                          = 0x1802,

	GL_BGRA_EXT                                             = 0x80E1,
	GL_UNSIGNED_SHORT_4_4_4_4_REV_EXT                       = 0x8365,
	GL_UNSIGNED_SHORT_1_5_5_5_REV_EXT                       = 0x8366,

	GL_TEXTURE_MAX_ANISOTROPY_EXT                           = 0x84FE,
	GL_MAX_TEXTURE_MAX_ANISOTROPY_EXT                       = 0x84FF,

	//GL_BGRA_EXT                                             = 0x80E1,

	GL_UNSIGNED_INT_2_10_10_10_REV_EXT                      = 0x8368,

	GL_SGX_PROGRAM_BINARY_IMG                               = 0x9130,

	//GL_BGRA_IMG                                             = 0x80E1,
	GL_UNSIGNED_SHORT_4_4_4_4_REV_IMG                       = 0x8365,

	GL_SGX_BINARY_IMG                                       = 0x8C0A,

	GL_COMPRESSED_RGB_PVRTC_4BPPV1_IMG                      = 0x8C00,
	GL_COMPRESSED_RGB_PVRTC_2BPPV1_IMG                      = 0x8C01,
	GL_COMPRESSED_RGBA_PVRTC_4BPPV1_IMG                     = 0x8C02,
	GL_COMPRESSED_RGBA_PVRTC_2BPPV1_IMG                     = 0x8C03,

	GL_ALL_COMPLETED_NV                                     = 0x84F2,
	GL_FENCE_STATUS_NV                                      = 0x84F3,
	GL_FENCE_CONDITION_NV                                   = 0x84F4,

	GL_TEXTURE_WIDTH_QCOM                                   = 0x8BD2,
	GL_TEXTURE_HEIGHT_QCOM                                  = 0x8BD3,
	GL_TEXTURE_DEPTH_QCOM                                   = 0x8BD4,
	GL_TEXTURE_INTERNAL_FORMAT_QCOM                         = 0x8BD5,
	GL_TEXTURE_FORMAT_QCOM                                  = 0x8BD6,
	GL_TEXTURE_TYPE_QCOM                                    = 0x8BD7,
	GL_TEXTURE_IMAGE_VALID_QCOM                             = 0x8BD8,
	GL_TEXTURE_NUM_LEVELS_QCOM                              = 0x8BD9,
	GL_TEXTURE_TARGET_QCOM                                  = 0x8BDA,
	GL_TEXTURE_OBJECT_VALID_QCOM                            = 0x8BDB,
	GL_STATE_RESTORE                                        = 0x8BDC,

	GL_PERFMON_GLOBAL_MODE_QCOM                             = 0x8FA0,

	GL_WRITEONLY_RENDERING_QCOM                             = 0x8823,

	GL_COLOR_BUFFER_BIT0_QCOM                               = 0x00000001,
	GL_COLOR_BUFFER_BIT1_QCOM                               = 0x00000002,
	GL_COLOR_BUFFER_BIT2_QCOM                               = 0x00000004,
	GL_COLOR_BUFFER_BIT3_QCOM                               = 0x00000008,
	GL_COLOR_BUFFER_BIT4_QCOM                               = 0x00000010,
	GL_COLOR_BUFFER_BIT5_QCOM                               = 0x00000020,
	GL_COLOR_BUFFER_BIT6_QCOM                               = 0x00000040,
	GL_COLOR_BUFFER_BIT7_QCOM                               = 0x00000080,
	GL_DEPTH_BUFFER_BIT0_QCOM                               = 0x00000100,
	GL_DEPTH_BUFFER_BIT1_QCOM                               = 0x00000200,
	GL_DEPTH_BUFFER_BIT2_QCOM                               = 0x00000400,
	GL_DEPTH_BUFFER_BIT3_QCOM                               = 0x00000800,
	GL_DEPTH_BUFFER_BIT4_QCOM                               = 0x00001000,
	GL_DEPTH_BUFFER_BIT5_QCOM                               = 0x00002000,
	GL_DEPTH_BUFFER_BIT6_QCOM                               = 0x00004000,
	GL_DEPTH_BUFFER_BIT7_QCOM                               = 0x00008000,
	GL_STENCIL_BUFFER_BIT0_QCOM                             = 0x00010000,
	GL_STENCIL_BUFFER_BIT1_QCOM                             = 0x00020000,
	GL_STENCIL_BUFFER_BIT2_QCOM                             = 0x00040000,
	GL_STENCIL_BUFFER_BIT3_QCOM                             = 0x00080000,
	GL_STENCIL_BUFFER_BIT4_QCOM                             = 0x00100000,
	GL_STENCIL_BUFFER_BIT5_QCOM                             = 0x00200000,
	GL_STENCIL_BUFFER_BIT6_QCOM                             = 0x00400000,
	GL_STENCIL_BUFFER_BIT7_QCOM                             = 0x00800000,
	GL_MULTISAMPLE_BUFFER_BIT0_QCOM                         = 0x01000000,
	GL_MULTISAMPLE_BUFFER_BIT1_QCOM                         = 0x02000000,
	GL_MULTISAMPLE_BUFFER_BIT2_QCOM                         = 0x04000000,
	GL_MULTISAMPLE_BUFFER_BIT3_QCOM                         = 0x08000000,
	GL_MULTISAMPLE_BUFFER_BIT4_QCOM                         = 0x10000000,
	GL_MULTISAMPLE_BUFFER_BIT5_QCOM                         = 0x20000000,
	GL_MULTISAMPLE_BUFFER_BIT6_QCOM                         = 0x40000000,
	GL_MULTISAMPLE_BUFFER_BIT7_QCOM                         = 0x80000000,
}

version(GL_GLEXT_PROTOTYPES){
	extern(System) void glEGLImageTargetTexture2DOES(GLenum target, GLeglImageOES image);
	extern(System) void glEGLImageTargetRenderbufferStorageOES(GLenum target, GLeglImageOES image);
}else{
	alias extern(System) void function(GLenum target, GLeglImageOES image) PFNGLEGLIMAGETARGETTEXTURE2DOESPROC;
	alias extern(System) void function(GLenum target, GLeglImageOES image) PFNGLEGLIMAGETARGETRENDERBUFFERSTORAGEOESPROC;
}

version(GL_GLEXT_PROTOTYPES){
	export extern(System) void glGetProgramBinaryOES(GLuint program, GLsizei bufSize, GLsizei* length, GLenum* binaryFormat, GLvoid* binary);
	export extern(System) void glProgramBinaryOES(GLuint program, GLenum binaryFormat, const(GLvoid)* binary, GLint length);
}else{
	alias extern(System) void function(GLuint program, GLsizei bufSize, GLsizei* length, GLenum* binaryFormat, GLvoid* binary) PFNGLGETPROGRAMBINARYOESPROC;
	alias extern(System) void function(GLuint program, GLenum binaryFormat, const(GLvoid)* binary, GLint length) PFNGLPROGRAMBINARYOESPROC;
}

version(GL_GLEXT_PROTOTYPES){
	export extern(System) void* glMapBufferOES(GLenum target, GLenum access);
	export extern(System) GLboolean glUnmapBufferOES(GLenum target);
	export extern(System) void glGetBufferPointervOES(GLenum target, GLenum pname, GLvoid** params);
}else{
	alias extern(System) void* function(GLenum target, GLenum access) PFNGLMAPBUFFEROESPROC;
	alias extern(System) GLboolean function(GLenum target) PFNGLUNMAPBUFFEROESPROC;
	alias extern(System) void function(GLenum target, GLenum pname, GLvoid** params) PFNGLGETBUFFERPOINTERVOESPROC;
}

version(GL_GLEXT_PROTOTYPES){
	export extern(System) void glTexImage3DOES(GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type, const(GLvoid)* pixels);
	export extern(System) void glTexSubImage3DOES(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const(GLvoid)* pixels);
	export extern(System) void glCopyTexSubImage3DOES(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height);
	export extern(System) void glCompressedTexImage3DOES(GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, const(GLvoid)* data);
	export extern(System) void glCompressedTexSubImage3DOES(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, const(GLvoid)* data);
	export extern(System) void glFramebufferTexture3DOES(GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level, GLint zoffset);
}else{
	alias extern(System) void function(GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type, const(GLvoid)* pixels) PFNGLTEXIMAGE3DOESPROC;
	alias extern(System) void function(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const(GLvoid)* pixels) PFNGLTEXSUBIMAGE3DOESPROC;
	alias extern(System) void function(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height) PFNGLCOPYTEXSUBIMAGE3DOESPROC;
	alias extern(System) void function(GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, const(GLvoid)* data) PFNGLCOMPRESSEDTEXIMAGE3DOESPROC;
	alias extern(System) void function(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, const(GLvoid)* data) PFNGLCOMPRESSEDTEXSUBIMAGE3DOESPROC;
	alias extern(System) void function(GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level, GLint zoffset) PFNGLFRAMEBUFFERTEXTURE3DOES;
}

version(GL_GLEXT_PROTOTYPES){
	export extern(System) void glBindVertexArrayOES(GLuint array);
	export extern(System) void glDeleteVertexArraysOES(GLsizei n, const(GLuint)* arrays);
	export extern(System) void glGenVertexArraysOES(GLsizei n, GLuint* arrays);
	export extern(System) GLboolean glIsVertexArrayOES(GLuint array);
}else{
	alias extern(System) void function(GLuint array) PFNGLBINDVERTEXARRAYOESPROC;
	alias extern(System) void function(GLsizei n, const(GLuint)* arrays) PFNGLDELETEVERTEXARRAYSOESPROC;
	alias extern(System) void function(GLsizei n, GLuint* arrays) PFNGLGENVERTEXARRAYSOESPROC;
	alias extern(System) GLboolean function(GLuint array) PFNGLISVERTEXARRAYOESPROC;
}

version(GL_GLEXT_PROTOTYPES){
	export extern(System) void glGetPerfMonitorGroupsAMD(GLint* numGroups, GLsizei groupsSize, GLuint* groups);
	export extern(System) void glGetPerfMonitorCountersAMD(GLuint group, GLint* numCounters, GLint* maxActiveCounters, GLsizei counterSize, GLuint* counters);
	export extern(System) void glGetPerfMonitorGroupStringAMD(GLuint group, GLsizei bufSize, GLsizei* length, GLchar* groupString);
	export extern(System) void glGetPerfMonitorCounterStringAMD(GLuint group, GLuint counter, GLsizei bufSize, GLsizei* length, GLchar* counterString);
	export extern(System) void glGetPerfMonitorCounterInfoAMD(GLuint group, GLuint counter, GLenum pname, GLvoid* data);
	export extern(System) void glGenPerfMonitorsAMD(GLsizei n, GLuint* monitors);
	export extern(System) void glDeletePerfMonitorsAMD(GLsizei n, GLuint* monitors);
	export extern(System) void glSelectPerfMonitorCountersAMD(GLuint monitor, GLboolean enable, GLuint group, GLint numCounters, GLuint* countersList);
	export extern(System) void glBeginPerfMonitorAMD(GLuint monitor);
	export extern(System) void glEndPerfMonitorAMD(GLuint monitor);
	export extern(System) void glGetPerfMonitorCounterDataAMD(GLuint monitor, GLenum pname, GLsizei dataSize, GLuint* data, GLint* bytesWritten);
}else{
	alias extern(System) void function(GLint* numGroups, GLsizei groupsSize, GLuint* groups) PFNGLGETPERFMONITORGROUPSAMDPROC;
	alias extern(System) void function(GLuint group, GLint* numCounters, GLint* maxActiveCounters, GLsizei counterSize, GLuint* counters) PFNGLGETPERFMONITORCOUNTERSAMDPROC;
	alias extern(System) void function(GLuint group, GLsizei bufSize, GLsizei* length, GLchar* groupString) PFNGLGETPERFMONITORGROUPSTRINGAMDPROC;
	alias extern(System) void function(GLuint group, GLuint counter, GLsizei bufSize, GLsizei* length, GLchar* counterString) PFNGLGETPERFMONITORCOUNTERSTRINGAMDPROC;
	alias extern(System) void function(GLuint group, GLuint counter, GLenum pname, GLvoid* data) PFNGLGETPERFMONITORCOUNTERINFOAMDPROC;
	alias extern(System) void function(GLsizei n, GLuint* monitors) PFNGLGENPERFMONITORSAMDPROC;
	alias extern(System) void function(GLsizei n, GLuint* monitors) PFNGLDELETEPERFMONITORSAMDPROC;
	alias extern(System) void function(GLuint monitor, GLboolean enable, GLuint group, GLint numCounters, GLuint* countersList) PFNGLSELECTPERFMONITORCOUNTERSAMDPROC;
	alias extern(System) void function(GLuint monitor) PFNGLBEGINPERFMONITORAMDPROC;
	alias extern(System) void function(GLuint monitor) PFNGLENDPERFMONITORAMDPROC;
	alias extern(System) void function(GLuint monitor, GLenum pname, GLsizei dataSize, GLuint* data, GLint* bytesWritten) PFNGLGETPERFMONITORCOUNTERDATAAMDPROC;
}

version(GL_GLEXT_PROTOTYPES){
	export extern(System) void glDiscardFramebufferEXT(GLenum target, GLsizei numAttachments, const(GLenum)* attachments);
}else{
	alias extern(System) void function(GLenum target, GLsizei numAttachments, const(GLenum)* attachments) PFNGLDISCARDFRAMEBUFFEREXTPROC;
}

version(GL_GLEXT_PROTOTYPES){
	export extern(System) void glMultiDrawArraysEXT(GLenum, GLint*, GLsizei*, GLsizei);
	export extern(System) void glMultiDrawElementsEXT(GLenum, const(GLsizei)*, GLenum, const(GLvoid)**, GLsizei);
}else{
	alias extern(System) void function(GLenum mode, GLint* first, GLsizei* count, GLsizei primcount) PFNGLMULTIDRAWARRAYSEXTPROC;
	alias extern(System) void function(GLenum mode, const(GLsizei)* count, GLenum type, const(GLvoid)** indices, GLsizei primcount) PFNGLMULTIDRAWELEMENTSEXTPROC;
}

version(GL_GLEXT_PROTOTYPES){
	export extern(System) void glDeleteFencesNV(GLsizei, const(GLuint)*);
	export extern(System) void glGenFencesNV(GLsizei, GLuint*);
	export extern(System) GLboolean glIsFenceNV(GLuint);
	export extern(System) GLboolean glTestFenceNV(GLuint);
	export extern(System) void glGetFenceivNV(GLuint, GLenum, GLint*);
	export extern(System) void glFinishFenceNV(GLuint);
	export extern(System) void glSetFenceNV(GLuint, GLenum);
}else{
	alias extern(System) void function(GLsizei n, const(GLuint)* fences) PFNGLDELETEFENCESNVPROC;
	alias extern(System) void function(GLsizei n, GLuint* fences) PFNGLGENFENCESNVPROC;
	alias extern(System) GLboolean function(GLuint fence) PFNGLISFENCENVPROC;
	alias extern(System) GLboolean function(GLuint fence) PFNGLTESTFENCENVPROC;
	alias extern(System) void function(GLuint fence, GLenum pname, GLint* params) PFNGLGETFENCEIVNVPROC;
	alias extern(System) void function(GLuint fence) PFNGLFINISHFENCENVPROC;
	alias extern(System) void function(GLuint fence, GLenum condition) PFNGLSETFENCENVPROC;
}

version(GL_GLEXT_PROTOTYPES){
	export extern(System) void glGetDriverControlsQCOM(GLint* num, GLsizei size, GLuint* driverControls);
	export extern(System) void glGetDriverControlStringQCOM(GLuint driverControl, GLsizei bufSize, GLsizei* length, GLchar* driverControlString);
	export extern(System) void glEnableDriverControlQCOM(GLuint driverControl);
	export extern(System) void glDisableDriverControlQCOM(GLuint driverControl);
}else{
	alias extern(System) void function(GLint* num, GLsizei size, GLuint* driverControls) PFNGLGETDRIVERCONTROLSQCOMPROC;
	alias extern(System) void function(GLuint driverControl, GLsizei bufSize, GLsizei* length, GLchar* driverControlString) PFNGLGETDRIVERCONTROLSTRINGQCOMPROC;
	alias extern(System) void function(GLuint driverControl) PFNGLENABLEDRIVERCONTROLQCOMPROC;
	alias extern(System) void function(GLuint driverControl) PFNGLDISABLEDRIVERCONTROLQCOMPROC;
}

version(GL_GLEXT_PROTOTYPES){
	export extern(System) void glExtGetTexturesQCOM(GLuint* textures, GLint maxTextures, GLint* numTextures);
	export extern(System) void glExtGetBuffersQCOM(GLuint* buffers, GLint maxBuffers, GLint* numBuffers);
	export extern(System) void glExtGetRenderbuffersQCOM(GLuint* renderbuffers, GLint maxRenderbuffers, GLint* numRenderbuffers);
	export extern(System) void glExtGetFramebuffersQCOM(GLuint* framebuffers, GLint maxFramebuffers, GLint* numFramebuffers);
	export extern(System) void glExtGetTexLevelParameterivQCOM(GLuint texture, GLenum face, GLint level, GLenum pname, GLint* params);
	export extern(System) void glExtTexObjectStateOverrideiQCOM(GLenum target, GLenum pname, GLint param);
	export extern(System) void glExtGetTexSubImageQCOM(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, GLvoid* texels);
	export extern(System) void glExtGetBufferPointervQCOM(GLenum target, GLvoid** params);
}else{
	alias extern(System) void function(GLuint* textures, GLint maxTextures, GLint* numTextures) PFNGLEXTGETTEXTURESQCOMPROC;
	alias extern(System) void function(GLuint* buffers, GLint maxBuffers, GLint* numBuffers) PFNGLEXTGETBUFFERSQCOMPROC;
	alias extern(System) void function(GLuint* renderbuffers, GLint maxRenderbuffers, GLint* numRenderbuffers) PFNGLEXTGETRENDERBUFFERSQCOMPROC;
	alias extern(System) void function(GLuint* framebuffers, GLint maxFramebuffers, GLint* numFramebuffers) PFNGLEXTGETFRAMEBUFFERSQCOMPROC;
	alias extern(System) void function(GLuint texture, GLenum face, GLint level, GLenum pname, GLint* params) PFNGLEXTGETTEXLEVELPARAMETERIVQCOMPROC;
	alias extern(System) void function(GLenum target, GLenum pname, GLint param) PFNGLEXTTEXOBJECTSTATEOVERRIDEIQCOMPROC;
	alias extern(System) void function(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, GLvoid* texels) PFNGLEXTGETTEXSUBIMAGEQCOMPROC;
	alias extern(System) void function(GLenum target, GLvoid** params) PFNGLEXTGETBUFFERPOINTERVQCOMPROC;
}

version(GL_GLEXT_PROTOTYPES){
	export extern(System) void glExtGetShadersQCOM(GLuint* shaders, GLint maxShaders, GLint* numShaders);
	export extern(System) void  glExtGetProgramsQCOM(GLuint* programs, GLint maxPrograms, GLint* numPrograms);
	export extern(System) GLboolean glExtIsProgramBinaryQCOM(GLuint program);
	export extern(System) void glExtGetProgramBinarySourceQCOM(GLuint program, GLenum shadertype, GLchar* source, GLint* length);
}else{
	alias extern(System) void function(GLuint* shaders, GLint maxShaders, GLint* numShaders) PFNGLEXTGETSHADERSQCOMPROC;
	alias extern(System) void function(GLuint* programs, GLint maxPrograms, GLint* numPrograms) PFNGLEXTGETPROGRAMSQCOMPROC;
	alias extern(System) GLboolean function(GLuint program) PFNGLEXTISPROGRAMBINARYQCOMPROC;
	alias extern(System) void function(GLuint program, GLenum shadertype, GLchar* source, GLint* length) PFNGLEXTGETPROGRAMBINARYSOURCEQCOMPROC;
}

version(GL_GLEXT_PROTOTYPES){
	export extern(System) void glStartTilingQCOM(GLuint x, GLuint y, GLuint width, GLuint height, GLbitfield preserveMask);
	export extern(System) void glEndTilingQCOM(GLbitfield preserveMask);
}else{
	alias extern(System) void function(GLuint x, GLuint y, GLuint width, GLuint height, GLbitfield preserveMask) PFNGLSTARTTILINGQCOMPROC;
	alias extern(System) void function(GLbitfield preserveMask) PFNGLENDTILINGQCOMPROC;
}
