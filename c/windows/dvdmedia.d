/** dvdmedia.d

Converted from 'dvdmedia.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.dvdmedia;


import c.windows.windef;
import c.windows.amvideo;
import c.windows.wingdi;


extern(C){

enum {
	AM_PROPERTY_AC3_ERROR_CONCEALMENT  = 1,
	AM_PROPERTY_AC3_ALTERNATE_AUDIO    = 2,
	AM_PROPERTY_AC3_DOWNMIX            = 3,
	AM_PROPERTY_AC3_BIT_STREAM_MODE    = 4,
	AM_PROPERTY_AC3_DIALOGUE_LEVEL     = 5,
	AM_PROPERTY_AC3_LANGUAGE_CODE      = 6,
	AM_PROPERTY_AC3_ROOM_TYPE          = 7
}
alias int AM_PROPERTY_AC3;

struct AM_AC3_ERROR_CONCEALMENT {
	BOOL fRepeatPreviousBlock;
	BOOL fErrorInCurrentBlock;
}
alias AM_AC3_ERROR_CONCEALMENT* PAM_AC3_ERROR_CONCEALMENT;

struct AM_AC3_ALTERNATE_AUDIO {
	BOOL fStereo;
	ULONG DualMode;
}
alias AM_AC3_ALTERNATE_AUDIO* PAM_AC3_ALTERNATE_AUDIO;

enum {
	AM_AC3_ALTERNATE_AUDIO_1    = 1,
	AM_AC3_ALTERNATE_AUDIO_2    = 2,
	AM_AC3_ALTERNATE_AUDIO_BOTH = 3,
}

struct AM_AC3_DOWNMIX {
	BOOL fDownMix;
	BOOL fDolbySurround;
}
alias AM_AC3_DOWNMIX* PAM_AC3_DOWNMIX;

struct AM_AC3_BIT_STREAM_MODE {
	LONG BitStreamMode;
}
alias AM_AC3_BIT_STREAM_MODE* PAM_AC3_BIT_STREAM_MODE;

enum {
	AM_AC3_SERVICE_MAIN_AUDIO        = 0,
	AM_AC3_SERVICE_NO_DIALOG         = 1,
	AM_AC3_SERVICE_VISUALLY_IMPAIRED = 2,
	AM_AC3_SERVICE_HEARING_IMPAIRED  = 3,
	AM_AC3_SERVICE_DIALOG_ONLY       = 4,
	AM_AC3_SERVICE_COMMENTARY        = 5,
	AM_AC3_SERVICE_EMERGENCY_FLASH   = 6,
	AM_AC3_SERVICE_VOICE_OVER        = 7,
}

struct AM_AC3_DIALOGUE_LEVEL {
	ULONG DialogueLevel;
}
alias AM_AC3_DIALOGUE_LEVEL* PAM_AC3_DIALOGUE_LEVEL;

struct AM_AC3_ROOM_TYPE {
	BOOL fLargeRoom;
}
alias AM_AC3_ROOM_TYPE* PAM_AC3_ROOM_TYPE;

enum {
	AM_PROPERTY_DVDSUBPIC_PALETTE     = 0,
	AM_PROPERTY_DVDSUBPIC_HLI         = 1,
	AM_PROPERTY_DVDSUBPIC_COMPOSIT_ON = 2
}
alias int AM_PROPERTY_DVDSUBPIC;

struct AM_DVD_YUV {
	UCHAR Reserved;
	UCHAR Y;
	UCHAR U;
	UCHAR V;
}
alias AM_DVD_YUV* PAM_DVD_YUV;

struct AM_PROPERTY_SPPAL {
	AM_DVD_YUV[16] sppal;
}
alias AM_PROPERTY_SPPAL* PAM_PROPERTY_SPPAL;

struct AM_COLCON {
	UCHAR flags_;
	/*UCHAR emph1col:4;
	UCHAR emph2col:4;
	UCHAR backcol:4;
	UCHAR patcol:4;
	UCHAR emph1con:4;
	UCHAR emph2con:4;
	UCHAR backcon:4;
	UCHAR patcon:4;*/
}
alias AM_COLCON* PAM_COLCON;

struct AM_PROPERTY_SPHLI {
	USHORT HLISS;
	USHORT Reserved;
	ULONG StartPTM;
	ULONG EndPTM;
	USHORT StartX;
	USHORT StartY;
	USHORT StopX;
	USHORT StopY;
	AM_COLCON ColCon;
}
alias AM_PROPERTY_SPHLI* PAM_PROPERTY_SPHLI;

alias BOOL AM_PROPERTY_COMPOSIT_ON;
alias AM_PROPERTY_COMPOSIT_ON* PAM_PROPERTY_COMPOSIT_ON;

enum {
	AM_UseNewCSSKey      = 0x1,
	AM_ReverseBlockStart = 0x2,
	AM_ReverseBlockEnd   = 0x4,
}

enum {
	AM_PROPERTY_DVDCOPY_CHLG_KEY               = 0x01,
	AM_PROPERTY_DVDCOPY_DVD_KEY1               = 0x02,
	AM_PROPERTY_DVDCOPY_DEC_KEY2               = 0x03,
	AM_PROPERTY_DVDCOPY_TITLE_KEY              = 0x04,
	AM_PROPERTY_COPY_MACROVISION               = 0x05,
	AM_PROPERTY_DVDCOPY_REGION                 = 0x06,
	AM_PROPERTY_DVDCOPY_SET_COPY_STATE         = 0x07,
	AM_PROPERTY_COPY_ANALOG_COMPONENT          = 0x08,
	AM_PROPERTY_COPY_DIGITAL_CP                = 0x09,
	AM_PROPERTY_COPY_DVD_SRM                   = 0x0a,
	AM_PROPERTY_DVDCOPY_SUPPORTS_NEW_KEYCOUNT  = 0x0b,
	AM_PROPERTY_DVDCOPY_DISC_KEY               = 0x80
}
alias int AM_PROPERTY_DVDCOPYPROT;

enum {
	AM_DIGITAL_CP_OFF           = 0,
	AM_DIGITAL_CP_ON            = 1,
	AM_DIGITAL_CP_DVD_COMPLIANT = 2
}
alias int AM_DIGITAL_CP;

struct AM_DVDCOPY_CHLGKEY {
	BYTE[10] ChlgKey;
	BYTE[2] Reserved;
}
alias AM_DVDCOPY_CHLGKEY* PAM_DVDCOPY_CHLGKEY;

struct AM_DVDCOPY_BUSKEY {
	BYTE[5] BusKey;
	BYTE[1] Reserved;
}
alias AM_DVDCOPY_BUSKEY* PAM_DVDCOPY_BUSKEY;

struct AM_DVDCOPY_DISCKEY {
	BYTE[2048] DiscKey;
}
alias AM_DVDCOPY_DISCKEY* PAM_DVDCOPY_DISCKEY;

struct AM_DVDCOPY_TITLEKEY {
	ULONG KeyFlags;
	ULONG[2] Reserved1;
	UCHAR[6] TitleKey;
	UCHAR[2] Reserved2;
}
alias AM_DVDCOPY_TITLEKEY* PAM_DVDCOPY_TITLEKEY;

struct AM_COPY_MACROVISION {
	ULONG MACROVISIONLevel;
}
alias AM_COPY_MACROVISION* PAM_COPY_MACROVISION;

struct AM_DVDCOPY_SET_COPY_STATE {
	ULONG DVDCopyState;
}
alias AM_DVDCOPY_SET_COPY_STATE* PAM_DVDCOPY_SET_COPY_STATE;

enum {
	AM_DVDCOPYSTATE_INITIALIZE                  = 0,
	AM_DVDCOPYSTATE_INITIALIZE_TITLE            = 1,
	AM_DVDCOPYSTATE_AUTHENTICATION_NOT_REQUIRED = 2,
	AM_DVDCOPYSTATE_AUTHENTICATION_REQUIRED     = 3,
	AM_DVDCOPYSTATE_DONE                        = 4
}
alias int AM_DVDCOPYSTATE;

enum {
	AM_MACROVISION_DISABLED  = 0,
	AM_MACROVISION_LEVEL1    = 1,
	AM_MACROVISION_LEVEL2    = 2,
	AM_MACROVISION_LEVEL3    = 3
}
alias int AM_COPY_MACROVISION_LEVEL;
alias AM_COPY_MACROVISION_LEVEL* PAM_COPY_MACROVISION_LEVEL;

struct DVD_REGION {
	UCHAR CopySystem;
	UCHAR RegionData;
	UCHAR SystemRegion;
	UCHAR ResetCount;
}
alias DVD_REGION* PDVD_REGION;

enum {
	AM_DVD_CGMS_RESERVED_MASK     = 0x00000078,
	AM_DVD_CGMS_COPY_PROTECT_MASK = 0x00000018,
	AM_DVD_CGMS_COPY_PERMITTED    = 0x00000000,
	AM_DVD_CGMS_COPY_ONCE         = 0x00000010,
	AM_DVD_CGMS_NO_COPY           = 0x00000018,
	AM_DVD_COPYRIGHT_MASK         = 0x00000040,
	AM_DVD_NOT_COPYRIGHTED        = 0x00000000,
	AM_DVD_COPYRIGHTED            = 0x00000040,
	AM_DVD_SECTOR_PROTECT_MASK    = 0x00000020,
	AM_DVD_SECTOR_NOT_PROTECTED   = 0x00000000,
	AM_DVD_SECTOR_PROTECTED       = 0x00000020
}

enum {
	AM_MPEG2Level_Low       = 1,
	AM_MPEG2Level_Main      = 2,
	AM_MPEG2Level_High1440  = 3,
	AM_MPEG2Level_High      = 4
}
alias int AM_MPEG2Level;

enum {
	AM_MPEG2Profile_Simple             = 1,
	AM_MPEG2Profile_Main               = 2,
	AM_MPEG2Profile_SNRScalable        = 3,
	AM_MPEG2Profile_SpatiallyScalable  = 4,
	AM_MPEG2Profile_High               = 5
}
alias int AM_MPEG2Profile;

enum {
	AMINTERLACE_IsInterlaced          = 0x00000001,
	AMINTERLACE_1FieldPerSample       = 0x00000002,
	AMINTERLACE_Field1First           = 0x00000004,
	AMINTERLACE_UNUSED                = 0x00000008,
	AMINTERLACE_FieldPatternMask      = 0x00000030,
	AMINTERLACE_FieldPatField1Only    = 0x00000000,
	AMINTERLACE_FieldPatField2Only    = 0x00000010,
	AMINTERLACE_FieldPatBothRegular   = 0x00000020,
	AMINTERLACE_FieldPatBothIrregular = 0x00000030,
	AMINTERLACE_DisplayModeMask       = 0x000000c0,
	AMINTERLACE_DisplayModeBobOnly    = 0x00000000,
	AMINTERLACE_DisplayModeWeaveOnly  = 0x00000040,
	AMINTERLACE_DisplayModeBobOrWeave = 0x00000080,
	AMCOPYPROTECT_RestrictDuplication = 0x00000001,
	AMMPEG2_DoPanScan                 = 0x00000001,
	AMMPEG2_DVDLine21Field1           = 0x00000002,
	AMMPEG2_DVDLine21Field2           = 0x00000004,
	AMMPEG2_SourceIsLetterboxed       = 0x00000008,
	AMMPEG2_FilmCameraMode            = 0x00000010,
	AMMPEG2_LetterboxAnalogOut        = 0x00000020,
	AMMPEG2_DSS_UserData              = 0x00000040,
	AMMPEG2_DVB_UserData              = 0x00000080,
	AMMPEG2_27MhzTimebase             = 0x00000100,
	AMMPEG2_WidescreenAnalogOut       = 0x00000200,
	AMCONTROL_USED                    = 0x00000001,
	AMCONTROL_PAD_TO_4x3              = 0x00000002,
	AMCONTROL_PAD_TO_16x9             = 0x00000004,
	AMCONTROL_COLORINFO_PRESENT       = 0x00000080,
}

struct VIDEOINFOHEADER2 {
	RECT rcSource;
	RECT rcTarget;
	DWORD dwBitRate;
	DWORD dwBitErrorRate;
	REFERENCE_TIME AvgTimePerFrame;
	DWORD dwInterlaceFlags;
	DWORD dwCopyProtectFlags;
	DWORD dwPictAspectRatioX;
	DWORD dwPictAspectRatioY;
	union {
		DWORD dwControlFlags;
		DWORD dwReserved1;
	}
	DWORD dwReserved2;
	BITMAPINFOHEADER bmiHeader;
}

struct MPEG2VIDEOINFO {
	VIDEOINFOHEADER2 hdr;
	DWORD dwStartTimeCode;
	DWORD cbSequenceHeader;
	DWORD dwProfile;
	DWORD dwLevel;
	DWORD dwFlags;
	DWORD[1] dwSequenceHeader;
}

//SIZE_MPEG2VIDEOINFO(pv) (FIELD_OFFSET(MPEG2VIDEOINFO, dwSequenceHeader[0]) + (pv)->cbSequenceHeader)
//MPEG1_SEQUENCE_INFO(pv) ((const BYTE *)(pv)->bSequenceHeader)
//MPEG2_SEQUENCE_INFO(pv) ((const BYTE *)(pv)->dwSequenceHeader)

enum {
	AM_VIDEO_FLAG_FIELD_MASK        = 0x0003,
	AM_VIDEO_FLAG_INTERLEAVED_FRAME = 0x0000,
	AM_VIDEO_FLAG_FIELD1            = 0x0001,
	AM_VIDEO_FLAG_FIELD2            = 0x0002,
	AM_VIDEO_FLAG_FIELD1FIRST       = 0x0004,
	AM_VIDEO_FLAG_WEAVE             = 0x0008,
	AM_VIDEO_FLAG_IPB_MASK          = 0x0030,
	AM_VIDEO_FLAG_I_SAMPLE          = 0x0000,
	AM_VIDEO_FLAG_P_SAMPLE          = 0x0010,
	AM_VIDEO_FLAG_B_SAMPLE          = 0x0020,
	AM_VIDEO_FLAG_REPEAT_FIELD      = 0x0040,
}

struct AM_DvdKaraokeData {
	DWORD dwDownmix;
	DWORD dwSpeakerAssignment;
}

enum {
	AM_PROPERTY_DVDKARAOKE_ENABLE = 0,
	AM_PROPERTY_DVDKARAOKE_DATA   = 1,
}
alias int AM_PROPERTY_DVDKARAOKE;

enum {
	AM_RATE_SimpleRateChange        = 1,
	AM_RATE_ExactRateChange         = 2,
	AM_RATE_MaxFullDataRate         = 3,
	AM_RATE_Step                    = 4,
	AM_RATE_UseRateVersion          = 5,
	AM_RATE_QueryFullFrameRate      =6,
	AM_RATE_QueryLastRateSegPTS     =7,
	AM_RATE_CorrectTS               = 8,
	AM_RATE_ReverseMaxFullDataRate  = 9,
	AM_RATE_ResetOnTimeDisc         = 10,
	AM_RATE_QueryMapping            = 11
}
alias int AM_PROPERTY_TS_RATE_CHANGE;

enum {
	AM_RATE_ChangeRate       = 1,
	AM_RATE_FullDataRateMax  = 2,
	AM_RATE_ReverseDecode    = 3,
	AM_RATE_DecoderPosition  = 4,
	AM_RATE_DecoderVersion   = 5
}
alias int AM_PROPERTY_DVD_RATE_CHANGE;

struct AM_SimpleRateChange {
	REFERENCE_TIME StartTime;
	LONG Rate;
}

struct AM_QueryRate  {
	LONG lMaxForwardFullFrame;
	LONG lMaxReverseFullFrame;
}

struct AM_ExactRateChange {
	REFERENCE_TIME OutputZeroTime;
	LONG Rate;
}

alias LONG AM_MaxFullDataRate;
alias DWORD AM_Step;

struct AM_DVD_ChangeRate  {
	REFERENCE_TIME StartInTime;
	REFERENCE_TIME StartOutTime;
	LONG Rate;
}
alias LONGLONG AM_DVD_DecoderPosition;

enum {
	DVD_DIR_FORWARD = 0,
	DVD_DIR_BACKWARD = 1
}
alias int DVD_PLAY_DIRECTION;

}// extern(C)
