/** vfwmsgs.d

Converted from 'vfwmsgs.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.vfwmsgs;


import c.windows.windef;


enum {
	VFW_E_INVALIDMEDIATYPE                        = cast(HRESULT)0x80040200,
	VFW_E_INVALIDSUBTYPE                          = cast(HRESULT)0x80040201,
	VFW_E_NEED_OWNER                              = cast(HRESULT)0x80040202,
	VFW_E_ENUM_OUT_OF_SYNC                        = cast(HRESULT)0x80040203,
	VFW_E_ALREADY_CONNECTED                       = cast(HRESULT)0x80040204,
	VFW_E_FILTER_ACTIVE                           = cast(HRESULT)0x80040205,
	VFW_E_NO_TYPES                                = cast(HRESULT)0x80040206,
	VFW_E_NO_ACCEPTABLE_TYPES                     = cast(HRESULT)0x80040207,
	VFW_E_INVALID_DIRECTION                       = cast(HRESULT)0x80040208,
	VFW_E_NOT_CONNECTED                           = cast(HRESULT)0x80040209,
	VFW_E_NO_ALLOCATOR                            = cast(HRESULT)0x8004020A,
	VFW_E_RUNTIME_ERROR                           = cast(HRESULT)0x8004020B,
	VFW_E_BUFFER_NOTSET                           = cast(HRESULT)0x8004020C,
	VFW_E_BUFFER_OVERFLOW                         = cast(HRESULT)0x8004020D,
	VFW_E_BADALIGN                                = cast(HRESULT)0x8004020E,
	VFW_E_ALREADY_COMMITTED                       = cast(HRESULT)0x8004020F,
	VFW_E_BUFFERS_OUTSTANDING                     = cast(HRESULT)0x80040210,
	VFW_E_NOT_COMMITTED                           = cast(HRESULT)0x80040211,
	VFW_E_SIZENOTSET                              = cast(HRESULT)0x80040212,
	VFW_E_NO_CLOCK                                = cast(HRESULT)0x80040213,
	VFW_E_NO_SINK                                 = cast(HRESULT)0x80040214,
	VFW_E_NO_INTERFACE                            = cast(HRESULT)0x80040215,
	VFW_E_NOT_FOUND                               = cast(HRESULT)0x80040216,
	VFW_E_CANNOT_CONNECT                          = cast(HRESULT)0x80040217,
	VFW_E_CANNOT_RENDER                           = cast(HRESULT)0x80040218,
	VFW_E_CHANGING_FORMAT                         = cast(HRESULT)0x80040219,
	VFW_E_NO_COLOR_KEY_SET                        = cast(HRESULT)0x8004021A,
	VFW_E_NOT_OVERLAY_CONNECTION                  = cast(HRESULT)0x8004021B,
	VFW_E_NOT_SAMPLE_CONNECTION                   = cast(HRESULT)0x8004021C,
	VFW_E_PALETTE_SET                             = cast(HRESULT)0x8004021D,
	VFW_E_COLOR_KEY_SET                           = cast(HRESULT)0x8004021E,
	VFW_E_NO_COLOR_KEY_FOUND                      = cast(HRESULT)0x8004021F,
	VFW_E_NO_PALETTE_AVAILABLE                    = cast(HRESULT)0x80040220,
	VFW_E_NO_DISPLAY_PALETTE                      = cast(HRESULT)0x80040221,
	VFW_E_TOO_MANY_COLORS                         = cast(HRESULT)0x80040222,
	VFW_E_STATE_CHANGED                           = cast(HRESULT)0x80040223,
	VFW_E_NOT_STOPPED                             = cast(HRESULT)0x80040224,
	VFW_E_NOT_PAUSED                              = cast(HRESULT)0x80040225,
	VFW_E_NOT_RUNNING                             = cast(HRESULT)0x80040226,
	VFW_E_WRONG_STATE                             = cast(HRESULT)0x80040227,
	VFW_E_START_TIME_AFTER_END                    = cast(HRESULT)0x80040228,
	VFW_E_INVALID_RECT                            = cast(HRESULT)0x80040229,
	VFW_E_TYPE_NOT_ACCEPTED                       = cast(HRESULT)0x8004022A,
	VFW_E_SAMPLE_REJECTED                         = cast(HRESULT)0x8004022B,
	VFW_E_SAMPLE_REJECTED_EOS                     = cast(HRESULT)0x8004022C,
	VFW_E_DUPLICATE_NAME                          = cast(HRESULT)0x8004022D,
	VFW_S_DUPLICATE_NAME                          = cast(HRESULT)0x0004022D,
	VFW_E_TIMEOUT                                 = cast(HRESULT)0x8004022E,
	VFW_E_INVALID_FILE_FORMAT                     = cast(HRESULT)0x8004022F,
	VFW_E_ENUM_OUT_OF_RANGE                       = cast(HRESULT)0x80040230,
	VFW_E_CIRCULAR_GRAPH                          = cast(HRESULT)0x80040231,
	VFW_E_NOT_ALLOWED_TO_SAVE                     = cast(HRESULT)0x80040232,
	VFW_E_TIME_ALREADY_PASSED                     = cast(HRESULT)0x80040233,
	VFW_E_ALREADY_CANCELLED                       = cast(HRESULT)0x80040234,
	VFW_E_CORRUPT_GRAPH_FILE                      = cast(HRESULT)0x80040235,
	VFW_E_ADVISE_ALREADY_SET                      = cast(HRESULT)0x80040236,
	VFW_S_STATE_INTERMEDIATE                      = cast(HRESULT)0x00040237,
	VFW_E_NO_MODEX_AVAILABLE                      = cast(HRESULT)0x80040238,
	VFW_E_NO_ADVISE_SET                           = cast(HRESULT)0x80040239,
	VFW_E_NO_FULLSCREEN                           = cast(HRESULT)0x8004023A,
	VFW_E_IN_FULLSCREEN_MODE                      = cast(HRESULT)0x8004023B,
	VFW_E_UNKNOWN_FILE_TYPE                       = cast(HRESULT)0x80040240,
	VFW_E_CANNOT_LOAD_SOURCE_FILTER               = cast(HRESULT)0x80040241,
	VFW_S_PARTIAL_RENDER                          = cast(HRESULT)0x00040242,
	VFW_E_FILE_TOO_SHORT                          = cast(HRESULT)0x80040243,
	VFW_E_INVALID_FILE_VERSION                    = cast(HRESULT)0x80040244,
	VFW_S_SOME_DATA_IGNORED                       = cast(HRESULT)0x00040245,
	VFW_S_CONNECTIONS_DEFERRED                    = cast(HRESULT)0x00040246,
	VFW_E_INVALID_CLSID                           = cast(HRESULT)0x80040247,
	VFW_E_INVALID_MEDIA_TYPE                      = cast(HRESULT)0x80040248,
	VFW_E_BAD_KEY                                 = cast(HRESULT)0x800403F2,
	VFW_S_NO_MORE_ITEMS                           = cast(HRESULT)0x00040103,
	VFW_E_SAMPLE_TIME_NOT_SET                     = cast(HRESULT)0x80040249,
	VFW_S_RESOURCE_NOT_NEEDED                     = cast(HRESULT)0x00040250,
	VFW_E_MEDIA_TIME_NOT_SET                      = cast(HRESULT)0x80040251,
	VFW_E_NO_TIME_FORMAT_SET                      = cast(HRESULT)0x80040252,
	VFW_E_MONO_AUDIO_HW                           = cast(HRESULT)0x80040253,
	VFW_S_MEDIA_TYPE_IGNORED                      = cast(HRESULT)0x00040254,
	VFW_E_NO_DECOMPRESSOR                         = cast(HRESULT)0x80040255,
	VFW_E_NO_AUDIO_HARDWARE                       = cast(HRESULT)0x80040256,
	VFW_S_VIDEO_NOT_RENDERED                      = cast(HRESULT)0x00040257,
	VFW_S_AUDIO_NOT_RENDERED                      = cast(HRESULT)0x00040258,
	VFW_E_RPZA                                    = cast(HRESULT)0x80040259,
	VFW_S_RPZA                                    = cast(HRESULT)0x0004025A,
	VFW_E_PROCESSOR_NOT_SUITABLE                  = cast(HRESULT)0x8004025B,
	VFW_E_UNSUPPORTED_AUDIO                       = cast(HRESULT)0x8004025C,
	VFW_E_UNSUPPORTED_VIDEO                       = cast(HRESULT)0x8004025D,
	VFW_E_MPEG_NOT_CONSTRAINED                    = cast(HRESULT)0x8004025E,
	VFW_E_NOT_IN_GRAPH                            = cast(HRESULT)0x8004025F,
	VFW_S_ESTIMATED                               = cast(HRESULT)0x00040260,
	VFW_E_NO_TIME_FORMAT                          = cast(HRESULT)0x80040261,
	VFW_E_READ_ONLY                               = cast(HRESULT)0x80040262,
	VFW_S_RESERVED                                = cast(HRESULT)0x00040263,
	VFW_E_BUFFER_UNDERFLOW                        = cast(HRESULT)0x80040264,
	VFW_E_UNSUPPORTED_STREAM                      = cast(HRESULT)0x80040265,
	VFW_E_NO_TRANSPORT                            = cast(HRESULT)0x80040266,
	VFW_S_STREAM_OFF                              = cast(HRESULT)0x00040267,
	VFW_S_CANT_CUE                                = cast(HRESULT)0x00040268,
	VFW_E_BAD_VIDEOCD                             = cast(HRESULT)0x80040269,
	VFW_S_NO_STOP_TIME                            = cast(HRESULT)0x00040270,
	VFW_E_OUT_OF_VIDEO_MEMORY                     = cast(HRESULT)0x80040271,
	VFW_E_VP_NEGOTIATION_FAILED                   = cast(HRESULT)0x80040272,
	VFW_E_DDRAW_CAPS_NOT_SUITABLE                 = cast(HRESULT)0x80040273,
	VFW_E_NO_VP_HARDWARE                          = cast(HRESULT)0x80040274,
	VFW_E_NO_CAPTURE_HARDWARE                     = cast(HRESULT)0x80040275,
	VFW_E_DVD_OPERATION_INHIBITED                 = cast(HRESULT)0x80040276,
	VFW_E_DVD_INVALIDDOMAIN                       = cast(HRESULT)0x80040277,
	VFW_E_DVD_NO_BUTTON                           = cast(HRESULT)0x80040278,
	VFW_E_DVD_GRAPHNOTREADY                       = cast(HRESULT)0x80040279,
	VFW_E_DVD_RENDERFAIL                          = cast(HRESULT)0x8004027A,
	VFW_E_DVD_DECNOTENOUGH                        = cast(HRESULT)0x8004027B,
	VFW_E_DDRAW_VERSION_NOT_SUITABLE              = cast(HRESULT)0x8004027C,
	VFW_E_COPYPROT_FAILED                         = cast(HRESULT)0x8004027D,
	VFW_S_NOPREVIEWPIN                            = cast(HRESULT)0x0004027E,
	VFW_E_TIME_EXPIRED                            = cast(HRESULT)0x8004027F,
	VFW_S_DVD_NON_ONE_SEQUENTIAL                  = cast(HRESULT)0x00040280,
	VFW_E_DVD_WRONG_SPEED                         = cast(HRESULT)0x80040281,
	VFW_E_DVD_MENU_DOES_NOT_EXIST                 = cast(HRESULT)0x80040282,
	VFW_E_DVD_CMD_CANCELLED                       = cast(HRESULT)0x80040283,
	VFW_E_DVD_STATE_WRONG_VERSION                 = cast(HRESULT)0x80040284,
	VFW_E_DVD_STATE_CORRUPT                       = cast(HRESULT)0x80040285,
	VFW_E_DVD_STATE_WRONG_DISC                    = cast(HRESULT)0x80040286,
	VFW_E_DVD_INCOMPATIBLE_REGION                 = cast(HRESULT)0x80040287,
	VFW_E_DVD_NO_ATTRIBUTES                       = cast(HRESULT)0x80040288,
	VFW_E_DVD_NO_GOUP_PGC                         = cast(HRESULT)0x80040289,
	VFW_E_DVD_LOW_PARENTAL_LEVEL                  = cast(HRESULT)0x8004028A,
	VFW_E_DVD_NOT_IN_KARAOKE_MODE                 = cast(HRESULT)0x8004028B,
	VFW_S_DVD_CHANNEL_CONTENTS_NOT_AVAILABLE      = cast(HRESULT)0x0004028C,
	VFW_S_DVD_NOT_ACCURATE                        = cast(HRESULT)0x0004028D,
	VFW_E_FRAME_STEP_UNSUPPORTED                  = cast(HRESULT)0x8004028E,
	VFW_E_DVD_STREAM_DISABLED                     = cast(HRESULT)0x8004028F,
	VFW_E_DVD_TITLE_UNKNOWN                       = cast(HRESULT)0x80040290,
	VFW_E_DVD_INVALID_DISC                        = cast(HRESULT)0x80040291,
	VFW_E_DVD_NO_RESUME_INFORMATION               = cast(HRESULT)0x80040292,
	VFW_E_PIN_ALREADY_BLOCKED_ON_THIS_THREAD      = cast(HRESULT)0x80040293,
	VFW_E_PIN_ALREADY_BLOCKED                     = cast(HRESULT)0x80040294,
	VFW_E_CERTIFICATION_FAILURE                   = cast(HRESULT)0x80040295,
	VFW_E_VMR_NOT_IN_MIXER_MODE                   = cast(HRESULT)0x80040296,
	VFW_E_VMR_NO_AP_SUPPLIED                      = cast(HRESULT)0x80040297,
	VFW_E_VMR_NO_DEINTERLACE_HW                   = cast(HRESULT)0x80040298,
	VFW_E_VMR_NO_PROCAMP_HW                       = cast(HRESULT)0x80040299,
	VFW_E_DVD_VMR9_INCOMPATIBLEDEC                = cast(HRESULT)0x8004029A,
	//VFW_E_VMR_NO_AP_SUPPLIED                      = cast(HRESULT)0x80040297,
	//VFW_E_VMR_NO_DEINTERLACE_HW                   = cast(HRESULT)0x80040298,
	//VFW_E_VMR_NO_PROCAMP_HW                       = cast(HRESULT)0x80040299,
	//VFW_E_DVD_VMR9_INCOMPATIBLEDEC                = cast(HRESULT)0x8004029A,
	VFW_E_NO_COPP_HW                              = cast(HRESULT)0x8004029B,
	VFW_E_DVD_NONBLOCKING                         = cast(HRESULT)0x8004029C,
	VFW_E_DVD_TOO_MANY_RENDERERS_IN_FILTER_GRAPH  = cast(HRESULT)0x8004029D,
	VFW_E_DVD_NON_EVR_RENDERER_IN_FILTER_GRAPH    = cast(HRESULT)0x8004029E,
	VFW_E_DVD_RESOLUTION_ERROR                    = cast(HRESULT)0x8004029F,
	E_PROP_SET_UNSUPPORTED                        = cast(HRESULT)0x80070492,
	E_PROP_ID_UNSUPPORTED                         = cast(HRESULT)0x80070490,
	VFW_E_CODECAPI_LINEAR_RANGE                   = cast(HRESULT)0x80040310,
	VFW_E_CODECAPI_ENUMERATED                     = cast(HRESULT)0x80040311,
	VFW_E_CODECAPI_NO_DEFAULT                     = cast(HRESULT)0x80040313,
	VFW_E_CODECAPI_NO_CURRENT_VALUE               = cast(HRESULT)0x80040314,
	VFW_E_DVD_CHAPTER_DOES_NOT_EXIST              = cast(HRESULT)0x80040315,
}