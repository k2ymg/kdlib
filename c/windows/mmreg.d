/** mmreg.d

Converted from 'mmreg.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.mmreg;


import c.windows.windef;
import c.windows.mmsystem;
import c.windows.guiddef;
import c.windows.wingdi;


align(1){
extern(C){

enum {
	MM_MICROSOFT                  = 1,
	MM_CREATIVE                   = 2,
	MM_MEDIAVISION                = 3,
	MM_FUJITSU                    = 4,
	MM_PRAGMATRAX                 = 5,
	MM_CYRIX                      = 6,
	MM_PHILIPS_SPEECH_PROCESSING  = 7,
	MM_NETXL                      = 8,
	MM_ZYXEL                      = 9,
	MM_BECUBED                    = 10,
	MM_AARDVARK                   = 11,
	MM_BINTEC                     = 12,
	MM_HEWLETT_PACKARD            = 13,
	MM_ACULAB                     = 14,
	MM_FAITH                      = 15,
	MM_MITEL                      = 16,
	MM_QUANTUM3D                  = 17,
	MM_SNI                        = 18,
	MM_EMU                        = 19,
	MM_ARTISOFT                   = 20,
	MM_TURTLE_BEACH               = 21,
	MM_IBM                        = 22,
	MM_VOCALTEC                   = 23,
	MM_ROLAND                     = 24,
	MM_DSP_SOLUTIONS              = 25,
	MM_NEC                        = 26,
	MM_ATI                        = 27,
	MM_WANGLABS                   = 28,
	MM_TANDY                      = 29,
	MM_VOYETRA                    = 30,
	MM_ANTEX                      = 31,
	MM_ICL_PS                     = 32,
	MM_INTEL                      = 33,
	MM_GRAVIS                     = 34,
	MM_VAL                        = 35,
	MM_INTERACTIVE                = 36,
	MM_YAMAHA                     = 37,
	MM_EVEREX                     = 38,
	MM_ECHO                       = 39,
	MM_SIERRA                     = 40,
	MM_CAT                        = 41,
	MM_APPS                       = 42,
	MM_DSP_GROUP                  = 43,
	MM_MELABS                     = 44,
	MM_COMPUTER_FRIENDS           = 45,
	MM_ESS                        = 46,
	MM_AUDIOFILE                  = 47,
	MM_MOTOROLA                   = 48,
	MM_CANOPUS                    = 49,
	MM_EPSON                      = 50,
	MM_TRUEVISION                 = 51,
	MM_AZTECH                     = 52,
	MM_VIDEOLOGIC                 = 53,
	MM_SCALACS                    = 54,
	MM_KORG                       = 55,
	MM_APT                        = 56,
	MM_ICS                        = 57,
	MM_ITERATEDSYS                = 58,
	MM_METHEUS                    = 59,
	MM_LOGITECH                   = 60,
	MM_WINNOV                     = 61,
	MM_NCR                        = 62,
	MM_EXAN                       = 63,
	MM_AST                        = 64,
	MM_WILLOWPOND                 = 65,
	MM_SONICFOUNDRY               = 66,
	MM_VITEC                      = 67,
	MM_MOSCOM                     = 68,
	MM_SILICONSOFT                = 69,
	MM_TERRATEC                   = 70,
	MM_MEDIASONIC                 = 71,
	MM_SANYO                      = 72,
	MM_SUPERMAC                   = 73,
	MM_AUDIOPT                    = 74,
	MM_NOGATECH                   = 75,
	MM_SPEECHCOMP                 = 76,
	MM_AHEAD                      = 77,
	MM_DOLBY                      = 78,
	MM_OKI                        = 79,
	MM_AURAVISION                 = 80,
	MM_OLIVETTI                   = 81,
	MM_IOMAGIC                    = 82,
	MM_MATSUSHITA                 = 83,
	MM_CONTROLRES                 = 84,
	MM_XEBEC                      = 85,
	MM_NEWMEDIA                   = 86,
	MM_NMS                        = 87,
	MM_LYRRUS                     = 88,
	MM_COMPUSIC                   = 89,
	MM_OPTI                       = 90,
	MM_ADLACC                     = 91,
	MM_COMPAQ                     = 92,
	MM_DIALOGIC                   = 93,
	MM_INSOFT                     = 94,
	MM_MPTUS                      = 95,
	MM_WEITEK                     = 96,
	MM_LERNOUT_AND_HAUSPIE        = 97,
	MM_QCIAR                      = 98,
	MM_APPLE                      = 99,
	MM_DIGITAL                    = 100,
	MM_MOTU                       = 101,
	MM_WORKBIT                    = 102,
	MM_OSITECH                    = 103,
	MM_MIRO                       = 104,
	MM_CIRRUSLOGIC                = 105,
	MM_ISOLUTION                  = 106,
	MM_HORIZONS                   = 107,
	MM_CONCEPTS                   = 108,
	MM_VTG                        = 109,
	MM_RADIUS                     = 110,
	MM_ROCKWELL                   = 111,
	MM_XYZ                        = 112,
	MM_OPCODE                     = 113,
	MM_VOXWARE                    = 114,
	MM_NORTHERN_TELECOM           = 115,
	MM_APICOM                     = 116,
	MM_GRANDE                     = 117,
	MM_ADDX                       = 118,
	MM_WILDCAT                    = 119,
	MM_RHETOREX                   = 120,
	MM_BROOKTREE                  = 121,
	MM_ENSONIQ                    = 125,
	MM_FAST                       = 126,
	MM_NVIDIA                     = 127,
	MM_OKSORI                     = 128,
	MM_DIACOUSTICS                = 129,
	MM_GULBRANSEN                 = 130,
	MM_KAY_ELEMETRICS             = 131,
	MM_CRYSTAL                    = 132,
	MM_SPLASH_STUDIOS             = 133,
	MM_QUARTERDECK                = 134,
	MM_TDK                        = 135,
	MM_DIGITAL_AUDIO_LABS         = 136,
	MM_SEERSYS                    = 137,
	MM_PICTURETEL                 = 138,
	MM_ATT_MICROELECTRONICS       = 139,
	MM_OSPREY                     = 140,
	MM_MEDIATRIX                  = 141,
	MM_SOUNDESIGNS                = 142,
	MM_ALDIGITAL                  = 143,
	MM_SPECTRUM_SIGNAL_PROCESSING = 144,
	MM_ECS                        = 145,
	MM_AMD                        = 146,
	MM_COREDYNAMICS               = 147,
	MM_CANAM                      = 148,
	MM_SOFTSOUND                  = 149,
	MM_NORRIS                     = 150,
	MM_DDD                        = 151,
	MM_EUPHONICS                  = 152,
	MM_PRECEPT                    = 153,
	MM_CRYSTAL_NET                = 154,
	MM_CHROMATIC                  = 155,
	MM_VOICEINFO                  = 156,
	MM_VIENNASYS                  = 157,
	MM_CONNECTIX                  = 158,
	MM_GADGETLABS                 = 159,
	MM_FRONTIER                   = 160,
	MM_VIONA                      = 161,
	MM_CASIO                      = 162,
	MM_DIAMONDMM                  = 163,
	MM_S3                         = 164,
	MM_DVISION                    = 165,
	MM_NETSCAPE                   = 166,
	MM_SOUNDSPACE                 = 167,
	MM_VANKOEVERING               = 168,
	MM_QTEAM                      = 169,
	MM_ZEFIRO                     = 170,
	MM_STUDER                     = 171,
	MM_FRAUNHOFER_IIS             = 172,
	MM_QUICKNET                   = 173,
	MM_ALARIS                     = 174,
	MM_SICRESOURCE                = 175,
	MM_NEOMAGIC                   = 176,
	MM_MERGING_TECHNOLOGIES       = 177,
	MM_XIRLINK                    = 178,
	MM_COLORGRAPH                 = 179,
	MM_OTI                        = 180,
	MM_AUREAL                     = 181,
	MM_VIVO                       = 182,
	MM_SHARP                      = 183,
	MM_LUCENT                     = 184,
	MM_ATT                        = 185,
	MM_SUNCOM                     = 186,
	MM_SORVIS                     = 187,
	MM_INVISION                   = 188,
	MM_BERKOM                     = 189,
	MM_MARIAN                     = 190,
	MM_DPSINC                     = 191,
	MM_BCB                        = 192,
	MM_MOTIONPIXELS               = 193,
	MM_QDESIGN                    = 194,
	MM_NMP                        = 195,
	MM_DATAFUSION                 = 196,
	MM_DUCK                       = 197,
	MM_FTR                        = 198,
	MM_BERCOS                     = 199,
	MM_ONLIVE                     = 200,
	MM_SIEMENS_SBC                = 201,
	MM_TERALOGIC                  = 202,
	MM_PHONET                     = 203,
	MM_WINBOND                    = 204,
	MM_VIRTUALMUSIC               = 205,
	MM_ENET                       = 206,
	MM_GUILLEMOT                  = 207,
	MM_EMAGIC                     = 208,
	MM_MWM                        = 209,
	MM_PACIFICRESEARCH            = 210,
	MM_SIPROLAB                   = 211,
	MM_LYNX                       = 212,
	MM_SPECTRUM_PRODUCTIONS       = 213,
	MM_DICTAPHONE                 = 214,
	MM_QUALCOMM                   = 215,
	MM_RZS                        = 216,
	MM_AUDIOSCIENCE               = 217,
	MM_PINNACLE                   = 218,
	MM_EES                        = 219,
	MM_HAFTMANN                   = 220,
	MM_LUCID                      = 221,
	MM_HEADSPACE                  = 222,
	MM_UNISYS                     = 223,
	MM_LUMINOSITI                 = 224,
	MM_ACTIVEVOICE                = 225,
	MM_DTS                        = 226,
	MM_DIGIGRAM                   = 227,
	MM_SOFTLAB_NSK                = 228,
	MM_FORTEMEDIA                 = 229,
	MM_SONORUS                    = 230,
	MM_ARRAY                      = 231,
	MM_DATARAN                    = 232,
	MM_I_LINK                     = 233,
	MM_SELSIUS_SYSTEMS            = 234,
	MM_ADMOS                      = 235,
	MM_LEXICON                    = 236,
	MM_SGI                        = 237,
	MM_IPI                        = 238,
	MM_ICE                        = 239,
	MM_VQST                       = 240,
	MM_ETEK                       = 241,
	MM_CS                         = 242,
	MM_ALESIS                     = 243,
	MM_INTERNET                   = 244,
	MM_SONY                       = 245,
	MM_HYPERACTIVE                = 246,
	MM_UHER_INFORMATIC            = 247,
	MM_SYDEC_NV                   = 248,
	MM_FLEXION                    = 249,
	MM_VIA                        = 250,
	MM_MICRONAS                   = 251,
	MM_ANALOGDEVICES              = 252,
	MM_HP                         = 253,
	MM_MATROX_DIV                 = 254,
	MM_QUICKAUDIO                 = 255,
	MM_YOUCOM                     = 256,
	MM_RICHMOND                   = 257,
	MM_IODD                       = 258,
	MM_ICCC                       = 259,
	MM_3COM                       = 260,
	MM_MALDEN                     = 261,
	MM_3DFX                       = 262,
	MM_MINDMAKER                  = 263,
	MM_TELEKOL                    = 264,
	MM_ST_MICROELECTRONICS        = 265,
	MM_ALGOVISION                 = 266,
	MM_UNMAPPED                   = 0xffff,
	MM_PID_UNMAPPED               = MM_UNMAPPED,
}

/*
INIT_MMREG_MID(guid, id) { (guid)->Data1 = 0xd5a47fa7 + (USHORT)(id); (guid)->Data2 = 0x6d98; (guid)->Data3 = 0x11d1; (guid)->Data4[0] = 0xa2; (guid)->Data4[1] = 0x1a; (guid)->Data4[2] = 0x00; (guid)->Data4[3] = 0xa0; (guid)->Data4[4] = 0xc9; (guid)->Data4[5] = 0x22; (guid)->Data4[6] = 0x31; (guid)->Data4[7] = 0x96; }
EXTRACT_MMREG_MID(guid) (USHORT)((guid)->Data1 - 0xd5a47fa7)
DEFINE_MMREG_MID_GUID(id) 0xd5a47fa7+(USHORT)(id), 0x6d98, 0x11d1, 0xa2, 0x1a, 0x00, 0xa0, 0xc9, 0x22, 0x31, 0x96
IS_COMPATIBLE_MMREG_MID(guid) (((guid)->Data1 >= 0xd5a47fa7) && ((guid)->Data1 < 0xd5a47fa7 + 0xffff) && ((guid)->Data2 == 0x6d98) && ((guid)->Data3 == 0x11d1) && ((guid)->Data4[0] == 0xa2) && ((guid)->Data4[1] == 0x1a) && ((guid)->Data4[2] == 0x00) && ((guid)->Data4[3] == 0xa0) && ((guid)->Data4[4] == 0xc9) && ((guid)->Data4[5] == 0x22) && ((guid)->Data4[6] == 0x31) && ((guid)->Data4[7] == 0x96))
INIT_MMREG_PID(guid, id) { (guid)->Data1 = 0xe36dc2ac + (USHORT)(id); (guid)->Data2 = 0x6d9a; (guid)->Data3 = 0x11d1; (guid)->Data4[0] = 0xa2; (guid)->Data4[1] = 0x1a; (guid)->Data4[2] = 0x00; (guid)->Data4[3] = 0xa0; (guid)->Data4[4] = 0xc9; (guid)->Data4[5] = 0x22; (guid)->Data4[6] = 0x31; (guid)->Data4[7] = 0x96; }
EXTRACT_MMREG_PID(guid) (USHORT)((guid)->Data1 - 0xe36dc2ac)
DEFINE_MMREG_PID_GUID(id) 0xe36dc2ac+(USHORT)(id), 0x6d9a, 0x11d1, 0xa2, 0x1a, 0x00, 0xa0, 0xc9, 0x22, 0x31, 0x96
IS_COMPATIBLE_MMREG_PID(guid) (((guid)->Data1 >= 0xe36dc2ac) && ((guid)->Data1 < 0xe36dc2ac + 0xffff) && ((guid)->Data2 == 0x6d9a) && ((guid)->Data3 == 0x11d1) && ((guid)->Data4[0] == 0xa2) && ((guid)->Data4[1] == 0x1a) && ((guid)->Data4[2] == 0x00) && ((guid)->Data4[3] == 0xa0) && ((guid)->Data4[4] == 0xc9) && ((guid)->Data4[5] == 0x22) && ((guid)->Data4[6] == 0x31) && ((guid)->Data4[7] == 0x96))
*/

enum {
	MM_MIDI_MAPPER                      = 1,
	MM_WAVE_MAPPER                      = 2,
	MM_SNDBLST_MIDIOUT                  = 3,
	MM_SNDBLST_MIDIIN                   = 4,
	MM_SNDBLST_SYNTH                    = 5,
	MM_SNDBLST_WAVEOUT                  = 6,
	MM_SNDBLST_WAVEIN                   = 7,
	MM_ADLIB                            = 9,
	MM_MPU401_MIDIOUT                   = 10,
	MM_MPU401_MIDIIN                    = 11,
	MM_PC_JOYSTICK                      = 12,
	MM_PCSPEAKER_WAVEOUT                = 13,
	MM_MSFT_WSS_WAVEIN                  = 14,
	MM_MSFT_WSS_WAVEOUT                 = 15,
	MM_MSFT_WSS_FMSYNTH_STEREO          = 16,
	MM_MSFT_WSS_MIXER                   = 17,
	MM_MSFT_WSS_OEM_WAVEIN              = 18,
	MM_MSFT_WSS_OEM_WAVEOUT             = 19,
	MM_MSFT_WSS_OEM_FMSYNTH_STEREO      = 20,
	MM_MSFT_WSS_AUX                     = 21,
	MM_MSFT_WSS_OEM_AUX                 = 22,
	MM_MSFT_GENERIC_WAVEIN              = 23,
	MM_MSFT_GENERIC_WAVEOUT             = 24,
	MM_MSFT_GENERIC_MIDIIN              = 25,
	MM_MSFT_GENERIC_MIDIOUT             = 26,
	MM_MSFT_GENERIC_MIDISYNTH           = 27,
	MM_MSFT_GENERIC_AUX_LINE            = 28,
	MM_MSFT_GENERIC_AUX_MIC             = 29,
	MM_MSFT_GENERIC_AUX_CD              = 30,
	MM_MSFT_WSS_OEM_MIXER               = 31,
	MM_MSFT_MSACM                       = 32,
	MM_MSFT_ACM_MSADPCM                 = 33,
	MM_MSFT_ACM_IMAADPCM                = 34,
	MM_MSFT_ACM_MSFILTER                = 35,
	MM_MSFT_ACM_GSM610                  = 36,
	MM_MSFT_ACM_G711                    = 37,
	MM_MSFT_ACM_PCM                     = 38,
	MM_WSS_SB16_WAVEIN                  = 39,
	MM_WSS_SB16_WAVEOUT                 = 40,
	MM_WSS_SB16_MIDIIN                  = 41,
	MM_WSS_SB16_MIDIOUT                 = 42,
	MM_WSS_SB16_SYNTH                   = 43,
	MM_WSS_SB16_AUX_LINE                = 44,
	MM_WSS_SB16_AUX_CD                  = 45,
	MM_WSS_SB16_MIXER                   = 46,
	MM_WSS_SBPRO_WAVEIN                 = 47,
	MM_WSS_SBPRO_WAVEOUT                = 48,
	MM_WSS_SBPRO_MIDIIN                 = 49,
	MM_WSS_SBPRO_MIDIOUT                = 50,
	MM_WSS_SBPRO_SYNTH                  = 51,
	MM_WSS_SBPRO_AUX_LINE               = 52,
	MM_WSS_SBPRO_AUX_CD                 = 53,
	MM_WSS_SBPRO_MIXER                  = 54,
	MM_MSFT_WSS_NT_WAVEIN               = 55,
	MM_MSFT_WSS_NT_WAVEOUT              = 56,
	MM_MSFT_WSS_NT_FMSYNTH_STEREO       = 57,
	MM_MSFT_WSS_NT_MIXER                = 58,
	MM_MSFT_WSS_NT_AUX                  = 59,
	MM_MSFT_SB16_WAVEIN                 = 60,
	MM_MSFT_SB16_WAVEOUT                = 61,
	MM_MSFT_SB16_MIDIIN                 = 62,
	MM_MSFT_SB16_MIDIOUT                = 63,
	MM_MSFT_SB16_SYNTH                  = 64,
	MM_MSFT_SB16_AUX_LINE               = 65,
	MM_MSFT_SB16_AUX_CD                 = 66,
	MM_MSFT_SB16_MIXER                  = 67,
	MM_MSFT_SBPRO_WAVEIN                = 68,
	MM_MSFT_SBPRO_WAVEOUT               = 69,
	MM_MSFT_SBPRO_MIDIIN                = 70,
	MM_MSFT_SBPRO_MIDIOUT               = 71,
	MM_MSFT_SBPRO_SYNTH                 = 72,
	MM_MSFT_SBPRO_AUX_LINE              = 73,
	MM_MSFT_SBPRO_AUX_CD                = 74,
	MM_MSFT_SBPRO_MIXER                 = 75,
	MM_MSFT_MSOPL_SYNTH                 = 76,
	MM_MSFT_VMDMS_LINE_WAVEIN           = 80,
	MM_MSFT_VMDMS_LINE_WAVEOUT          = 81,
	MM_MSFT_VMDMS_HANDSET_WAVEIN        = 82,
	MM_MSFT_VMDMS_HANDSET_WAVEOUT       = 83,
	MM_MSFT_VMDMW_LINE_WAVEIN           = 84,
	MM_MSFT_VMDMW_LINE_WAVEOUT          = 85,
	MM_MSFT_VMDMW_HANDSET_WAVEIN        = 86,
	MM_MSFT_VMDMW_HANDSET_WAVEOUT       = 87,
	MM_MSFT_VMDMW_MIXER                 = 88,
	MM_MSFT_VMDM_GAME_WAVEOUT           = 89,
	MM_MSFT_VMDM_GAME_WAVEIN            = 90,
	MM_MSFT_ACM_MSNAUDIO                = 91,
	MM_MSFT_ACM_MSG723                  = 92,
	MM_MSFT_ACM_MSRT24                  = 93,
	MM_MSFT_WDMAUDIO_WAVEOUT            = 100,
	MM_MSFT_WDMAUDIO_WAVEIN             = 101,
	MM_MSFT_WDMAUDIO_MIDIOUT            = 102,
	MM_MSFT_WDMAUDIO_MIDIIN             = 103,
	MM_MSFT_WDMAUDIO_MIXER              = 104,
	MM_MSFT_WDMAUDIO_AUX                = 105,
	MM_CREATIVE_SB15_WAVEIN             = 1,
	MM_CREATIVE_SB20_WAVEIN             = 2,
	MM_CREATIVE_SBPRO_WAVEIN            = 3,
	MM_CREATIVE_SBP16_WAVEIN            = 4,
	MM_CREATIVE_PHNBLST_WAVEIN          = 5,
	MM_CREATIVE_SB15_WAVEOUT            = 101,
	MM_CREATIVE_SB20_WAVEOUT            = 102,
	MM_CREATIVE_SBPRO_WAVEOUT           = 103,
	MM_CREATIVE_SBP16_WAVEOUT           = 104,
	MM_CREATIVE_PHNBLST_WAVEOUT         = 105,
	MM_CREATIVE_MIDIOUT                 = 201,
	MM_CREATIVE_MIDIIN                  = 202,
	MM_CREATIVE_FMSYNTH_MONO            = 301,
	MM_CREATIVE_FMSYNTH_STEREO          = 302,
	MM_CREATIVE_MIDI_AWE32              = 303,
	MM_CREATIVE_AUX_CD                  = 401,
	MM_CREATIVE_AUX_LINE                = 402,
	MM_CREATIVE_AUX_MIC                 = 403,
	MM_CREATIVE_AUX_MASTER              = 404,
	MM_CREATIVE_AUX_PCSPK               = 405,
	MM_CREATIVE_AUX_WAVE                = 406,
	MM_CREATIVE_AUX_MIDI                = 407,
	MM_CREATIVE_SBPRO_MIXER             = 408,
	MM_CREATIVE_SB16_MIXER              = 409,
	MM_MEDIAVISION_PROAUDIO             = 0x10,
	MM_PROAUD_MIDIOUT                   = MM_MEDIAVISION_PROAUDIO+1,
	MM_PROAUD_MIDIIN                    = MM_MEDIAVISION_PROAUDIO+2,
	MM_PROAUD_SYNTH                     = MM_MEDIAVISION_PROAUDIO+3,
	MM_PROAUD_WAVEOUT                   = MM_MEDIAVISION_PROAUDIO+4,
	MM_PROAUD_WAVEIN                    = MM_MEDIAVISION_PROAUDIO+5,
	MM_PROAUD_MIXER                     = MM_MEDIAVISION_PROAUDIO+6,
	MM_PROAUD_AUX                       = MM_MEDIAVISION_PROAUDIO+7,
	MM_MEDIAVISION_THUNDER              = 0x20,
	MM_THUNDER_SYNTH                    = MM_MEDIAVISION_THUNDER+3,
	MM_THUNDER_WAVEOUT                  = MM_MEDIAVISION_THUNDER+4,
	MM_THUNDER_WAVEIN                   = MM_MEDIAVISION_THUNDER+5,
	MM_THUNDER_AUX                      = MM_MEDIAVISION_THUNDER+7,
	MM_MEDIAVISION_TPORT                = 0x40,
	MM_TPORT_WAVEOUT                    = MM_MEDIAVISION_TPORT+1,
	MM_TPORT_WAVEIN                     = MM_MEDIAVISION_TPORT+2,
	MM_TPORT_SYNTH                      = MM_MEDIAVISION_TPORT+3,
	MM_MEDIAVISION_PROAUDIO_PLUS        = 0x50,
	MM_PROAUD_PLUS_MIDIOUT              = MM_MEDIAVISION_PROAUDIO_PLUS+1,
	MM_PROAUD_PLUS_MIDIIN               = MM_MEDIAVISION_PROAUDIO_PLUS+2,
	MM_PROAUD_PLUS_SYNTH                = MM_MEDIAVISION_PROAUDIO_PLUS+3,
	MM_PROAUD_PLUS_WAVEOUT              = MM_MEDIAVISION_PROAUDIO_PLUS+4,
	MM_PROAUD_PLUS_WAVEIN               = MM_MEDIAVISION_PROAUDIO_PLUS+5,
	MM_PROAUD_PLUS_MIXER                = MM_MEDIAVISION_PROAUDIO_PLUS+6,
	MM_PROAUD_PLUS_AUX                  = MM_MEDIAVISION_PROAUDIO_PLUS+7,
	MM_MEDIAVISION_PROAUDIO_16          = 0x60,
	MM_PROAUD_16_MIDIOUT                = MM_MEDIAVISION_PROAUDIO_16+1,
	MM_PROAUD_16_MIDIIN                 = MM_MEDIAVISION_PROAUDIO_16+2,
	MM_PROAUD_16_SYNTH                  = MM_MEDIAVISION_PROAUDIO_16+3,
	MM_PROAUD_16_WAVEOUT                = MM_MEDIAVISION_PROAUDIO_16+4,
	MM_PROAUD_16_WAVEIN                 = MM_MEDIAVISION_PROAUDIO_16+5,
	MM_PROAUD_16_MIXER                  = MM_MEDIAVISION_PROAUDIO_16+6,
	MM_PROAUD_16_AUX                    = MM_MEDIAVISION_PROAUDIO_16+7,
	MM_MEDIAVISION_PROSTUDIO_16         = 0x60,
	MM_STUDIO_16_MIDIOUT                = MM_MEDIAVISION_PROSTUDIO_16+1,
	MM_STUDIO_16_MIDIIN                 = MM_MEDIAVISION_PROSTUDIO_16+2,
	MM_STUDIO_16_SYNTH                  = MM_MEDIAVISION_PROSTUDIO_16+3,
	MM_STUDIO_16_WAVEOUT                = MM_MEDIAVISION_PROSTUDIO_16+4,
	MM_STUDIO_16_WAVEIN                 = MM_MEDIAVISION_PROSTUDIO_16+5,
	MM_STUDIO_16_MIXER                  = MM_MEDIAVISION_PROSTUDIO_16+6,
	MM_STUDIO_16_AUX                    = MM_MEDIAVISION_PROSTUDIO_16+7,
	MM_MEDIAVISION_CDPC                 = 0x70,
	MM_CDPC_MIDIOUT                     = MM_MEDIAVISION_CDPC+1,
	MM_CDPC_MIDIIN                      = MM_MEDIAVISION_CDPC+2,
	MM_CDPC_SYNTH                       = MM_MEDIAVISION_CDPC+3,
	MM_CDPC_WAVEOUT                     = MM_MEDIAVISION_CDPC+4,
	MM_CDPC_WAVEIN                      = MM_MEDIAVISION_CDPC+5,
	MM_CDPC_MIXER                       = MM_MEDIAVISION_CDPC+6,
	MM_CDPC_AUX                         = MM_MEDIAVISION_CDPC+7,
	MM_MEDIAVISION_OPUS1208             = 0x80,
	MM_OPUS401_MIDIOUT                  = MM_MEDIAVISION_OPUS1208+1,
	MM_OPUS401_MIDIIN                   = MM_MEDIAVISION_OPUS1208+2,
	MM_OPUS1208_SYNTH                   = MM_MEDIAVISION_OPUS1208+3,
	MM_OPUS1208_WAVEOUT                 = MM_MEDIAVISION_OPUS1208+4,
	MM_OPUS1208_WAVEIN                  = MM_MEDIAVISION_OPUS1208+5,
	MM_OPUS1208_MIXER                   = MM_MEDIAVISION_OPUS1208+6,
	MM_OPUS1208_AUX                     = MM_MEDIAVISION_OPUS1208+7,
	MM_MEDIAVISION_OPUS1216             = 0x90,
	MM_OPUS1216_MIDIOUT                 = MM_MEDIAVISION_OPUS1216+1,
	MM_OPUS1216_MIDIIN                  = MM_MEDIAVISION_OPUS1216+2,
	MM_OPUS1216_SYNTH                   = MM_MEDIAVISION_OPUS1216+3,
	MM_OPUS1216_WAVEOUT                 = MM_MEDIAVISION_OPUS1216+4,
	MM_OPUS1216_WAVEIN                  = MM_MEDIAVISION_OPUS1216+5,
	MM_OPUS1216_MIXER                   = MM_MEDIAVISION_OPUS1216+6,
	MM_OPUS1216_AUX                     = MM_MEDIAVISION_OPUS1216+7,
	MM_CYRIX_XASYNTH                    = 1,
	MM_CYRIX_XAMIDIIN                   = 2,
	MM_CYRIX_XAMIDIOUT                  = 3,
	MM_CYRIX_XAWAVEIN                   = 4,
	MM_CYRIX_XAWAVEOUT                  = 5,
	MM_CYRIX_XAAUX                      = 6,
	MM_CYRIX_XAMIXER                    = 7,
	MM_PHILIPS_ACM_LPCBB                = 1,
	MM_NETXL_XLVIDEO                    = 1,
	MM_ZYXEL_ACM_ADPCM                  = 1,
	MM_AARDVARK_STUDIO12_WAVEOUT        = 1,
	MM_AARDVARK_STUDIO12_WAVEIN         = 2,
	MM_AARDVARK_STUDIO88_WAVEOUT        = 3,
	MM_AARDVARK_STUDIO88_WAVEIN         = 4,
	MM_BINTEC_TAPI_WAVE                 = 1,
	MM_HEWLETT_PACKARD_CU_CODEC         = 1,
	MM_MITEL_TALKTO_LINE_WAVEOUT        = 100,
	MM_MITEL_TALKTO_LINE_WAVEIN         = 101,
	MM_MITEL_TALKTO_HANDSET_WAVEOUT     = 102,
	MM_MITEL_TALKTO_HANDSET_WAVEIN      = 103,
	MM_MITEL_TALKTO_BRIDGED_WAVEOUT     = 104,
	MM_MITEL_TALKTO_BRIDGED_WAVEIN      = 105,
	MM_MITEL_MPA_HANDSET_WAVEOUT        = 200,
	MM_MITEL_MPA_HANDSET_WAVEIN         = 201,
	MM_MITEL_MPA_HANDSFREE_WAVEOUT      = 202,
	MM_MITEL_MPA_HANDSFREE_WAVEIN       = 203,
	MM_MITEL_MPA_LINE1_WAVEOUT          = 204,
	MM_MITEL_MPA_LINE1_WAVEIN           = 205,
	MM_MITEL_MPA_LINE2_WAVEOUT          = 206,
	MM_MITEL_MPA_LINE2_WAVEIN           = 207,
	MM_MITEL_MEDIAPATH_WAVEOUT          = 300,
	MM_MITEL_MEDIAPATH_WAVEIN           = 301,
	MM_SNI_ACM_G721                     = 1,
	MM_EMU_APSSYNTH                     = 1,
	MM_EMU_APSMIDIIN                    = 2,
	MM_EMU_APSMIDIOUT                   = 3,
	MM_EMU_APSWAVEIN                    = 4,
	MM_EMU_APSWAVEOUT                   = 5,
	MM_ARTISOFT_SBWAVEIN                = 1,
	MM_ARTISOFT_SBWAVEOUT               = 2,
	MM_TBS_TROPEZ_WAVEIN                = 37,
	MM_TBS_TROPEZ_WAVEOUT               = 38,
	MM_TBS_TROPEZ_AUX1                  = 39,
	MM_TBS_TROPEZ_AUX2                  = 40,
	MM_TBS_TROPEZ_LINE                  = 41,
	MM_MMOTION_WAVEAUX                  = 1,
	MM_MMOTION_WAVEOUT                  = 2,
	MM_MMOTION_WAVEIN                   = 3,
	MM_IBM_PCMCIA_WAVEIN                = 11,
	MM_IBM_PCMCIA_WAVEOUT               = 12,
	MM_IBM_PCMCIA_SYNTH                 = 13,
	MM_IBM_PCMCIA_MIDIIN                = 14,
	MM_IBM_PCMCIA_MIDIOUT               = 15,
	MM_IBM_PCMCIA_AUX                   = 16,
	MM_IBM_THINKPAD200                  = 17,
	MM_IBM_MWAVE_WAVEIN                 = 18,
	MM_IBM_MWAVE_WAVEOUT                = 19,
	MM_IBM_MWAVE_MIXER                  = 20,
	MM_IBM_MWAVE_MIDIIN                 = 21,
	MM_IBM_MWAVE_MIDIOUT                = 22,
	MM_IBM_MWAVE_AUX                    = 23,
	MM_IBM_WC_MIDIOUT                   = 30,
	MM_IBM_WC_WAVEOUT                   = 31,
	MM_IBM_WC_MIXEROUT                  = 33,
	MM_VOCALTEC_WAVEOUT                 = 1,
	MM_VOCALTEC_WAVEIN                  = 2,
	MM_ROLAND_RAP10_MIDIOUT             = 10,
	MM_ROLAND_RAP10_MIDIIN              = 11,
	MM_ROLAND_RAP10_SYNTH               = 12,
	MM_ROLAND_RAP10_WAVEOUT             = 13,
	MM_ROLAND_RAP10_WAVEIN              = 14,
	MM_ROLAND_MPU401_MIDIOUT            = 15,
	MM_ROLAND_MPU401_MIDIIN             = 16,
	MM_ROLAND_SMPU_MIDIOUTA             = 17,
	MM_ROLAND_SMPU_MIDIOUTB             = 18,
	MM_ROLAND_SMPU_MIDIINA              = 19,
	MM_ROLAND_SMPU_MIDIINB              = 20,
	MM_ROLAND_SC7_MIDIOUT               = 21,
	MM_ROLAND_SC7_MIDIIN                = 22,
	MM_ROLAND_SERIAL_MIDIOUT            = 23,
	MM_ROLAND_SERIAL_MIDIIN             = 24,
	MM_ROLAND_SCP_MIDIOUT               = 38,
	MM_ROLAND_SCP_MIDIIN                = 39,
	MM_ROLAND_SCP_WAVEOUT               = 40,
	MM_ROLAND_SCP_WAVEIN                = 41,
	MM_ROLAND_SCP_MIXER                 = 42,
	MM_ROLAND_SCP_AUX                   = 48,
	MM_DSP_SOLUTIONS_WAVEOUT            = 1,
	MM_DSP_SOLUTIONS_WAVEIN             = 2,
	MM_DSP_SOLUTIONS_SYNTH              = 3,
	MM_DSP_SOLUTIONS_AUX                = 4,
	MM_NEC_73_86_SYNTH                  = 5,
	MM_NEC_73_86_WAVEOUT                = 6,
	MM_NEC_73_86_WAVEIN                 = 7,
	MM_NEC_26_SYNTH                     = 9,
	MM_NEC_MPU401_MIDIOUT               = 10,
	MM_NEC_MPU401_MIDIIN                = 11,
	MM_NEC_JOYSTICK                     = 12,
	MM_WANGLABS_WAVEIN1                 = 1,
	MM_WANGLABS_WAVEOUT1                = 2,
	MM_TANDY_VISWAVEIN                  = 1,
	MM_TANDY_VISWAVEOUT                 = 2,
	MM_TANDY_VISBIOSSYNTH               = 3,
	MM_TANDY_SENS_MMAWAVEIN             = 4,
	MM_TANDY_SENS_MMAWAVEOUT            = 5,
	MM_TANDY_SENS_MMAMIDIIN             = 6,
	MM_TANDY_SENS_MMAMIDIOUT            = 7,
	MM_TANDY_SENS_VISWAVEOUT            = 8,
	MM_TANDY_PSSJWAVEIN                 = 9,
	MM_TANDY_PSSJWAVEOUT                = 10,
	MM_ANTEX_SX12_WAVEIN                = 1,
	MM_ANTEX_SX12_WAVEOUT               = 2,
	MM_ANTEX_SX15_WAVEIN                = 3,
	MM_ANTEX_SX15_WAVEOUT               = 4,
	MM_ANTEX_VP625_WAVEIN               = 5,
	MM_ANTEX_VP625_WAVEOUT              = 6,
	MM_ANTEX_AUDIOPORT22_WAVEIN         = 7,
	MM_ANTEX_AUDIOPORT22_WAVEOUT        = 8,
	MM_ANTEX_AUDIOPORT22_FEEDTHRU       = 9,
	MM_INTELOPD_WAVEIN                  = 1,
	MM_INTELOPD_WAVEOUT                 = 101,
	MM_INTELOPD_AUX                     = 401,
	MM_INTEL_NSPMODEMLINEIN             = 501,
	MM_INTEL_NSPMODEMLINEOUT            = 502,
	MM_VAL_MICROKEY_AP_WAVEIN           = 1,
	MM_VAL_MICROKEY_AP_WAVEOUT          = 2,
	MM_INTERACTIVE_WAVEIN               = 0x45,
	MM_INTERACTIVE_WAVEOUT              = 0x45,
	MM_YAMAHA_GSS_SYNTH                 = 0x01,
	MM_YAMAHA_GSS_WAVEOUT               = 0x02,
	MM_YAMAHA_GSS_WAVEIN                = 0x03,
	MM_YAMAHA_GSS_MIDIOUT               = 0x04,
	MM_YAMAHA_GSS_MIDIIN                = 0x05,
	MM_YAMAHA_GSS_AUX                   = 0x06,
	MM_YAMAHA_SERIAL_MIDIOUT            = 0x07,
	MM_YAMAHA_SERIAL_MIDIIN             = 0x08,
	MM_YAMAHA_OPL3SA_WAVEOUT            = 0x10,
	MM_YAMAHA_OPL3SA_WAVEIN             = 0x11,
	MM_YAMAHA_OPL3SA_FMSYNTH            = 0x12,
	MM_YAMAHA_OPL3SA_YSYNTH             = 0x13,
	MM_YAMAHA_OPL3SA_MIDIOUT            = 0x14,
	MM_YAMAHA_OPL3SA_MIDIIN             = 0x15,
	MM_YAMAHA_OPL3SA_MIXER              = 0x17,
	MM_YAMAHA_OPL3SA_JOYSTICK           = 0x18,
	MM_YAMAHA_YMF724LEG_MIDIOUT         = 0x19,
	MM_YAMAHA_YMF724LEG_MIDIIN          = 0x1a,
	MM_YAMAHA_YMF724_WAVEOUT            = 0x1b,
	MM_YAMAHA_YMF724_WAVEIN             = 0x1c,
	MM_YAMAHA_YMF724_MIDIOUT            = 0x1d,
	MM_YAMAHA_YMF724_AUX                = 0x1e,
	MM_YAMAHA_YMF724_MIXER              = 0x1f,
	MM_YAMAHA_YMF724LEG_FMSYNTH         = 0x20,
	MM_YAMAHA_YMF724LEG_MIXER           = 0x21,
	MM_YAMAHA_SXG_MIDIOUT               = 0x22,
	MM_YAMAHA_SXG_WAVEOUT               = 0x23,
	MM_YAMAHA_SXG_MIXER                 = 0x24,
	MM_YAMAHA_ACXG_WAVEIN               = 0x25,
	MM_YAMAHA_ACXG_WAVEOUT              = 0x26,
	MM_YAMAHA_ACXG_MIDIOUT              = 0x27,
	MM_YAMAHA_ACXG_MIXER                = 0x28,
	MM_YAMAHA_ACXG_AUX                  = 0x29,
	MM_EVEREX_CARRIER                   = 1,
	MM_ECHO_SYNTH                       = 1,
	MM_ECHO_WAVEOUT                     = 2,
	MM_ECHO_WAVEIN                      = 3,
	MM_ECHO_MIDIOUT                     = 4,
	MM_ECHO_MIDIIN                      = 5,
	MM_ECHO_AUX                         = 6,
	MM_SIERRA_ARIA_MIDIOUT              = 0x14,
	MM_SIERRA_ARIA_MIDIIN               = 0x15,
	MM_SIERRA_ARIA_SYNTH                = 0x16,
	MM_SIERRA_ARIA_WAVEOUT              = 0x17,
	MM_SIERRA_ARIA_WAVEIN               = 0x18,
	MM_SIERRA_ARIA_AUX                  = 0x19,
	MM_SIERRA_ARIA_AUX2                 = 0x20,
	MM_SIERRA_QUARTET_WAVEIN            = 0x50,
	MM_SIERRA_QUARTET_WAVEOUT           = 0x51,
	MM_SIERRA_QUARTET_MIDIIN            = 0x52,
	MM_SIERRA_QUARTET_MIDIOUT           = 0x53,
	MM_SIERRA_QUARTET_SYNTH             = 0x54,
	MM_SIERRA_QUARTET_AUX_CD            = 0x55,
	MM_SIERRA_QUARTET_AUX_LINE          = 0x56,
	MM_SIERRA_QUARTET_AUX_MODEM         = 0x57,
	MM_SIERRA_QUARTET_MIXER             = 0x58,
	MM_CAT_WAVEOUT                      = 1,
	MM_DSP_GROUP_TRUESPEECH             = 1,
	MM_MELABS_MIDI2GO                   = 1,
	MM_ESS_AMWAVEOUT                    = 0x01,
	MM_ESS_AMWAVEIN                     = 0x02,
	MM_ESS_AMAUX                        = 0x03,
	MM_ESS_AMSYNTH                      = 0x04,
	MM_ESS_AMMIDIOUT                    = 0x05,
	MM_ESS_AMMIDIIN                     = 0x06,
	MM_ESS_MIXER                        = 0x07,
	MM_ESS_AUX_CD                       = 0x08,
	MM_ESS_MPU401_MIDIOUT               = 0x09,
	MM_ESS_MPU401_MIDIIN                = 0x0A,
	MM_ESS_ES488_WAVEOUT                = 0x10,
	MM_ESS_ES488_WAVEIN                 = 0x11,
	MM_ESS_ES488_MIXER                  = 0x12,
	MM_ESS_ES688_WAVEOUT                = 0x13,
	MM_ESS_ES688_WAVEIN                 = 0x14,
	MM_ESS_ES688_MIXER                  = 0x15,
	MM_ESS_ES1488_WAVEOUT               = 0x16,
	MM_ESS_ES1488_WAVEIN                = 0x17,
	MM_ESS_ES1488_MIXER                 = 0x18,
	MM_ESS_ES1688_WAVEOUT               = 0x19,
	MM_ESS_ES1688_WAVEIN                = 0x1A,
	MM_ESS_ES1688_MIXER                 = 0x1B,
	MM_ESS_ES1788_WAVEOUT               = 0x1C,
	MM_ESS_ES1788_WAVEIN                = 0x1D,
	MM_ESS_ES1788_MIXER                 = 0x1E,
	MM_ESS_ES1888_WAVEOUT               = 0x1F,
	MM_ESS_ES1888_WAVEIN                = 0x20,
	MM_ESS_ES1888_MIXER                 = 0x21,
	MM_ESS_ES1868_WAVEOUT               = 0x22,
	MM_ESS_ES1868_WAVEIN                = 0x23,
	MM_ESS_ES1868_MIXER                 = 0x24,
	MM_ESS_ES1878_WAVEOUT               = 0x25,
	MM_ESS_ES1878_WAVEIN                = 0x26,
	MM_ESS_ES1878_MIXER                 = 0x27,
	MM_CANOPUS_ACM_DVREX                = 1,
	MM_EPS_FMSND                        = 1,
	MM_TRUEVISION_WAVEIN1               = 1,
	MM_TRUEVISION_WAVEOUT1              = 2,
	MM_AZTECH_MIDIOUT                   = 3,
	MM_AZTECH_MIDIIN                    = 4,
	MM_AZTECH_WAVEIN                    = 17,
	MM_AZTECH_WAVEOUT                   = 18,
	MM_AZTECH_FMSYNTH                   = 20,
	MM_AZTECH_MIXER                     = 21,
	MM_AZTECH_PRO16_WAVEIN              = 33,
	MM_AZTECH_PRO16_WAVEOUT             = 34,
	MM_AZTECH_PRO16_FMSYNTH             = 38,
	MM_AZTECH_DSP16_WAVEIN              = 65,
	MM_AZTECH_DSP16_WAVEOUT             = 66,
	MM_AZTECH_DSP16_FMSYNTH             = 68,
	MM_AZTECH_DSP16_WAVESYNTH           = 70,
	MM_AZTECH_NOVA16_WAVEIN             = 71,
	MM_AZTECH_NOVA16_WAVEOUT            = 72,
	MM_AZTECH_NOVA16_MIXER              = 73,
	MM_AZTECH_WASH16_WAVEIN             = 74,
	MM_AZTECH_WASH16_WAVEOUT            = 75,
	MM_AZTECH_WASH16_MIXER              = 76,
	MM_AZTECH_AUX_CD                    = 401,
	MM_AZTECH_AUX_LINE                  = 402,
	MM_AZTECH_AUX_MIC                   = 403,
	MM_AZTECH_AUX                       = 404,
	MM_VIDEOLOGIC_MSWAVEIN              = 1,
	MM_VIDEOLOGIC_MSWAVEOUT             = 2,
	MM_KORG_PCIF_MIDIOUT                = 1,
	MM_KORG_PCIF_MIDIIN                 = 2,
	MM_KORG_1212IO_MSWAVEIN             = 3,
	MM_KORG_1212IO_MSWAVEOUT            = 4,
	MM_APT_ACE100CD                     = 1,
	MM_ICS_WAVEDECK_WAVEOUT             = 1,
	MM_ICS_WAVEDECK_WAVEIN              = 2,
	MM_ICS_WAVEDECK_MIXER               = 3,
	MM_ICS_WAVEDECK_AUX                 = 4,
	MM_ICS_WAVEDECK_SYNTH               = 5,
	MM_ICS_WAVEDEC_SB_WAVEOUT           = 6,
	MM_ICS_WAVEDEC_SB_WAVEIN            = 7,
	MM_ICS_WAVEDEC_SB_FM_MIDIOUT        = 8,
	MM_ICS_WAVEDEC_SB_MPU401_MIDIOUT    = 9,
	MM_ICS_WAVEDEC_SB_MPU401_MIDIIN     = 10,
	MM_ICS_WAVEDEC_SB_MIXER             = 11,
	MM_ICS_WAVEDEC_SB_AUX               = 12,
	MM_ICS_2115_LITE_MIDIOUT            = 13,
	MM_ICS_2120_LITE_MIDIOUT            = 14,
	MM_ITERATEDSYS_FUFCODEC             = 1,
	MM_METHEUS_ZIPPER                   = 1,
	MM_WINNOV_CAVIAR_WAVEIN             = 1,
	MM_WINNOV_CAVIAR_WAVEOUT            = 2,
	MM_WINNOV_CAVIAR_VIDC               = 3,
	MM_WINNOV_CAVIAR_CHAMPAGNE          = 4,
	MM_WINNOV_CAVIAR_YUV8               = 5,
	MM_NCR_BA_WAVEIN                    = 1,
	MM_NCR_BA_WAVEOUT                   = 2,
	MM_NCR_BA_SYNTH                     = 3,
	MM_NCR_BA_AUX                       = 4,
	MM_NCR_BA_MIXER                     = 5,
	MM_AST_MODEMWAVE_WAVEIN             = 13,
	MM_AST_MODEMWAVE_WAVEOUT            = 14,
	MM_WILLOWPOND_FMSYNTH_STEREO        = 20,
	MM_WILLOWPOND_MPU401                = 21,
	MM_WILLOWPOND_SNDPORT_WAVEIN        = 100,
	MM_WILLOWPOND_SNDPORT_WAVEOUT       = 101,
	MM_WILLOWPOND_SNDPORT_MIXER         = 102,
	MM_WILLOWPOND_SNDPORT_AUX           = 103,
	MM_WILLOWPOND_PH_WAVEIN             = 104,
	MM_WILLOWPOND_PH_WAVEOUT            = 105,
	MM_WILLOWPOND_PH_MIXER              = 106,
	MM_WILLOWPOND_PH_AUX                = 107,
	MM_WILLOPOND_SNDCOMM_WAVEIN         = 108,
	MM_WILLOWPOND_SNDCOMM_WAVEOUT       = 109,
	MM_WILLOWPOND_SNDCOMM_MIXER         = 110,
	MM_WILLOWPOND_SNDCOMM_AUX           = 111,
	MM_WILLOWPOND_GENERIC_WAVEIN        = 112,
	MM_WILLOWPOND_GENERIC_WAVEOUT       = 113,
	MM_WILLOWPOND_GENERIC_MIXER         = 114,
	MM_WILLOWPOND_GENERIC_AUX           = 115,
	MM_VITEC_VMAKER                     = 1,
	MM_VITEC_VMPRO                      = 2,
	MM_MOSCOM_VPC2400_IN                = 1,
	MM_MOSCOM_VPC2400_OUT               = 2,
	MM_SILICONSOFT_SC1_WAVEIN           = 1,
	MM_SILICONSOFT_SC1_WAVEOUT          = 2,
	MM_SILICONSOFT_SC2_WAVEIN           = 3,
	MM_SILICONSOFT_SC2_WAVEOUT          = 4,
	MM_SILICONSOFT_SOUNDJR2_WAVEOUT     = 5,
	MM_SILICONSOFT_SOUNDJR2PR_WAVEIN    = 6,
	MM_SILICONSOFT_SOUNDJR2PR_WAVEOUT   = 7,
	MM_SILICONSOFT_SOUNDJR3_WAVEOUT     = 8,
	MM_TTEWS_WAVEIN                     = 1,
	MM_TTEWS_WAVEOUT                    = 2,
	MM_TTEWS_MIDIIN                     = 3,
	MM_TTEWS_MIDIOUT                    = 4,
	MM_TTEWS_MIDISYNTH                  = 5,
	MM_TTEWS_MIDIMONITOR                = 6,
	MM_TTEWS_VMIDIIN                    = 7,
	MM_TTEWS_VMIDIOUT                   = 8,
	MM_TTEWS_AUX                        = 9,
	MM_TTEWS_MIXER                      = 10,
	MM_MEDIASONIC_ACM_G723              = 1,
	MM_MEDIASONIC_ICOM                  = 2,
	MM_ICOM_WAVEIN                      = 3,
	MM_ICOM_WAVEOUT                     = 4,
	MM_ICOM_MIXER                       = 5,
	MM_ICOM_AUX                         = 6,
	MM_ICOM_LINE                        = 7,
	MM_SANYO_ACM_LD_ADPCM               = 1,
	MM_AHEAD_MULTISOUND                 = 1,
	MM_AHEAD_SOUNDBLASTER               = 2,
	MM_AHEAD_PROAUDIO                   = 3,
	MM_AHEAD_GENERIC                    = 4,
	MM_OLIVETTI_WAVEIN                  = 1,
	MM_OLIVETTI_WAVEOUT                 = 2,
	MM_OLIVETTI_MIXER                   = 3,
	MM_OLIVETTI_AUX                     = 4,
	MM_OLIVETTI_MIDIIN                  = 5,
	MM_OLIVETTI_MIDIOUT                 = 6,
	MM_OLIVETTI_SYNTH                   = 7,
	MM_OLIVETTI_JOYSTICK                = 8,
	MM_OLIVETTI_ACM_GSM                 = 9,
	MM_OLIVETTI_ACM_ADPCM               = 10,
	MM_OLIVETTI_ACM_CELP                = 11,
	MM_OLIVETTI_ACM_SBC                 = 12,
	MM_OLIVETTI_ACM_OPR                 = 13,
	MM_IOMAGIC_TEMPO_WAVEOUT            = 1,
	MM_IOMAGIC_TEMPO_WAVEIN             = 2,
	MM_IOMAGIC_TEMPO_SYNTH              = 3,
	MM_IOMAGIC_TEMPO_MIDIOUT            = 4,
	MM_IOMAGIC_TEMPO_MXDOUT             = 5,
	MM_IOMAGIC_TEMPO_AUXOUT             = 6,
	MM_MATSUSHITA_WAVEIN                = 1,
	MM_MATSUSHITA_WAVEOUT               = 2,
	MM_MATSUSHITA_FMSYNTH_STEREO        = 3,
	MM_MATSUSHITA_MIXER                 = 4,
	MM_MATSUSHITA_AUX                   = 5,
	MM_NEWMEDIA_WAVJAMMER               = 1,
	MM_LYRRUS_BRIDGE_GUITAR             = 1,
	MM_OPTI_M16_FMSYNTH_STEREO          = 0x0001,
	MM_OPTI_M16_MIDIIN                  = 0x0002,
	MM_OPTI_M16_MIDIOUT                 = 0x0003,
	MM_OPTI_M16_WAVEIN                  = 0x0004,
	MM_OPTI_M16_WAVEOUT                 = 0x0005,
	MM_OPTI_M16_MIXER                   = 0x0006,
	MM_OPTI_M16_AUX                     = 0x0007,
	MM_OPTI_P16_FMSYNTH_STEREO          = 0x0010,
	MM_OPTI_P16_MIDIIN                  = 0x0011,
	MM_OPTI_P16_MIDIOUT                 = 0x0012,
	MM_OPTI_P16_WAVEIN                  = 0x0013,
	MM_OPTI_P16_WAVEOUT                 = 0x0014,
	MM_OPTI_P16_MIXER                   = 0x0015,
	MM_OPTI_P16_AUX                     = 0x0016,
	MM_OPTI_M32_WAVEIN                  = 0x0020,
	MM_OPTI_M32_WAVEOUT                 = 0x0021,
	MM_OPTI_M32_MIDIIN                  = 0x0022,
	MM_OPTI_M32_MIDIOUT                 = 0x0023,
	MM_OPTI_M32_SYNTH_STEREO            = 0x0024,
	MM_OPTI_M32_MIXER                   = 0x0025,
	MM_OPTI_M32_AUX                     = 0x0026,
	MM_COMPAQ_BB_WAVEIN                 = 1,
	MM_COMPAQ_BB_WAVEOUT                = 2,
	MM_COMPAQ_BB_WAVEAUX                = 3,
	MM_MPTUS_SPWAVEOUT                  = 1,
	MM_LERNOUT_ANDHAUSPIE_LHCODECACM    = 1,
	MM_DIGITAL_AV320_WAVEIN             = 1,
	MM_DIGITAL_AV320_WAVEOUT            = 2,
	MM_DIGITAL_ACM_G723                 = 3,
	MM_DIGITAL_ICM_H263                 = 4,
	MM_DIGITAL_ICM_H261                 = 5,
	MM_MOTU_MTP_MIDIOUT_ALL             = 100,
	MM_MOTU_MTP_MIDIIN_1                = 101,
	MM_MOTU_MTP_MIDIOUT_1               = 101,
	MM_MOTU_MTP_MIDIIN_2                = 102,
	MM_MOTU_MTP_MIDIOUT_2               = 102,
	MM_MOTU_MTP_MIDIIN_3                = 103,
	MM_MOTU_MTP_MIDIOUT_3               = 103,
	MM_MOTU_MTP_MIDIIN_4                = 104,
	MM_MOTU_MTP_MIDIOUT_4               = 104,
	MM_MOTU_MTP_MIDIIN_5                = 105,
	MM_MOTU_MTP_MIDIOUT_5               = 105,
	MM_MOTU_MTP_MIDIIN_6                = 106,
	MM_MOTU_MTP_MIDIOUT_6               = 106,
	MM_MOTU_MTP_MIDIIN_7                = 107,
	MM_MOTU_MTP_MIDIOUT_7               = 107,
	MM_MOTU_MTP_MIDIIN_8                = 108,
	MM_MOTU_MTP_MIDIOUT_8               = 108,
	MM_MOTU_MTPII_MIDIOUT_ALL           = 200,
	MM_MOTU_MTPII_MIDIIN_SYNC           = 200,
	MM_MOTU_MTPII_MIDIIN_1              = 201,
	MM_MOTU_MTPII_MIDIOUT_1             = 201,
	MM_MOTU_MTPII_MIDIIN_2              = 202,
	MM_MOTU_MTPII_MIDIOUT_2             = 202,
	MM_MOTU_MTPII_MIDIIN_3              = 203,
	MM_MOTU_MTPII_MIDIOUT_3             = 203,
	MM_MOTU_MTPII_MIDIIN_4              = 204,
	MM_MOTU_MTPII_MIDIOUT_4             = 204,
	MM_MOTU_MTPII_MIDIIN_5              = 205,
	MM_MOTU_MTPII_MIDIOUT_5             = 205,
	MM_MOTU_MTPII_MIDIIN_6              = 206,
	MM_MOTU_MTPII_MIDIOUT_6             = 206,
	MM_MOTU_MTPII_MIDIIN_7              = 207,
	MM_MOTU_MTPII_MIDIOUT_7             = 207,
	MM_MOTU_MTPII_MIDIIN_8              = 208,
	MM_MOTU_MTPII_MIDIOUT_8             = 208,
	MM_MOTU_MTPII_NET_MIDIIN_1          = 209,
	MM_MOTU_MTPII_NET_MIDIOUT_1         = 209,
	MM_MOTU_MTPII_NET_MIDIIN_2          = 210,
	MM_MOTU_MTPII_NET_MIDIOUT_2         = 210,
	MM_MOTU_MTPII_NET_MIDIIN_3          = 211,
	MM_MOTU_MTPII_NET_MIDIOUT_3         = 211,
	MM_MOTU_MTPII_NET_MIDIIN_4          = 212,
	MM_MOTU_MTPII_NET_MIDIOUT_4         = 212,
	MM_MOTU_MTPII_NET_MIDIIN_5          = 213,
	MM_MOTU_MTPII_NET_MIDIOUT_5         = 213,
	MM_MOTU_MTPII_NET_MIDIIN_6          = 214,
	MM_MOTU_MTPII_NET_MIDIOUT_6         = 214,
	MM_MOTU_MTPII_NET_MIDIIN_7          = 215,
	MM_MOTU_MTPII_NET_MIDIOUT_7         = 215,
	MM_MOTU_MTPII_NET_MIDIIN_8          = 216,
	MM_MOTU_MTPII_NET_MIDIOUT_8         = 216,
	MM_MOTU_MXP_MIDIIN_MIDIOUT_ALL      = 300,
	MM_MOTU_MXP_MIDIIN_SYNC             = 300,
	MM_MOTU_MXP_MIDIIN_MIDIIN_1         = 301,
	MM_MOTU_MXP_MIDIIN_MIDIOUT_1        = 301,
	MM_MOTU_MXP_MIDIIN_MIDIIN_2         = 302,
	MM_MOTU_MXP_MIDIIN_MIDIOUT_2        = 302,
	MM_MOTU_MXP_MIDIIN_MIDIIN_3         = 303,
	MM_MOTU_MXP_MIDIIN_MIDIOUT_3        = 303,
	MM_MOTU_MXP_MIDIIN_MIDIIN_4         = 304,
	MM_MOTU_MXP_MIDIIN_MIDIOUT_4        = 304,
	MM_MOTU_MXP_MIDIIN_MIDIIN_5         = 305,
	MM_MOTU_MXP_MIDIIN_MIDIOUT_5        = 305,
	MM_MOTU_MXP_MIDIIN_MIDIIN_6         = 306,
	MM_MOTU_MXP_MIDIIN_MIDIOUT_6        = 306,
	MM_MOTU_MXPMPU_MIDIOUT_ALL          = 400,
	MM_MOTU_MXPMPU_MIDIIN_SYNC          = 400,
	MM_MOTU_MXPMPU_MIDIIN_1             = 401,
	MM_MOTU_MXPMPU_MIDIOUT_1            = 401,
	MM_MOTU_MXPMPU_MIDIIN_2             = 402,
	MM_MOTU_MXPMPU_MIDIOUT_2            = 402,
	MM_MOTU_MXPMPU_MIDIIN_3             = 403,
	MM_MOTU_MXPMPU_MIDIOUT_3            = 403,
	MM_MOTU_MXPMPU_MIDIIN_4             = 404,
	MM_MOTU_MXPMPU_MIDIOUT_4            = 404,
	MM_MOTU_MXPMPU_MIDIIN_5             = 405,
	MM_MOTU_MXPMPU_MIDIOUT_5            = 405,
	MM_MOTU_MXPMPU_MIDIIN_6             = 406,
	MM_MOTU_MXPMPU_MIDIOUT_6            = 406,
	MM_MOTU_MXN_MIDIOUT_ALL             = 500,
	MM_MOTU_MXN_MIDIIN_SYNC             = 500,
	MM_MOTU_MXN_MIDIIN_1                = 501,
	MM_MOTU_MXN_MIDIOUT_1               = 501,
	MM_MOTU_MXN_MIDIIN_2                = 502,
	MM_MOTU_MXN_MIDIOUT_2               = 502,
	MM_MOTU_MXN_MIDIIN_3                = 503,
	MM_MOTU_MXN_MIDIOUT_3               = 503,
	MM_MOTU_MXN_MIDIIN_4                = 504,
	MM_MOTU_MXN_MIDIOUT_4               = 504,
	MM_MOTU_FLYER_MIDI_IN_SYNC          = 600,
	MM_MOTU_FLYER_MIDI_IN_A             = 601,
	MM_MOTU_FLYER_MIDI_OUT_A            = 601,
	MM_MOTU_FLYER_MIDI_IN_B             = 602,
	MM_MOTU_FLYER_MIDI_OUT_B            = 602,
	MM_MOTU_PKX_MIDI_IN_SYNC            = 700,
	MM_MOTU_PKX_MIDI_IN_A               = 701,
	MM_MOTU_PKX_MIDI_OUT_A              = 701,
	MM_MOTU_PKX_MIDI_IN_B               = 702,
	MM_MOTU_PKX_MIDI_OUT_B              = 702,
	MM_MOTU_DTX_MIDI_IN_SYNC            = 800,
	MM_MOTU_DTX_MIDI_IN_A               = 801,
	MM_MOTU_DTX_MIDI_OUT_A              = 801,
	MM_MOTU_DTX_MIDI_IN_B               = 802,
	MM_MOTU_DTX_MIDI_OUT_B              = 802,
	MM_MOTU_MTPAV_MIDIOUT_ALL           = 900,
	MM_MOTU_MTPAV_MIDIIN_SYNC           = 900,
	MM_MOTU_MTPAV_MIDIIN_1              = 901,
	MM_MOTU_MTPAV_MIDIOUT_1             = 901,
	MM_MOTU_MTPAV_MIDIIN_2              = 902,
	MM_MOTU_MTPAV_MIDIOUT_2             = 902,
	MM_MOTU_MTPAV_MIDIIN_3              = 903,
	MM_MOTU_MTPAV_MIDIOUT_3             = 903,
	MM_MOTU_MTPAV_MIDIIN_4              = 904,
	MM_MOTU_MTPAV_MIDIOUT_4             = 904,
	MM_MOTU_MTPAV_MIDIIN_5              = 905,
	MM_MOTU_MTPAV_MIDIOUT_5             = 905,
	MM_MOTU_MTPAV_MIDIIN_6              = 906,
	MM_MOTU_MTPAV_MIDIOUT_6             = 906,
	MM_MOTU_MTPAV_MIDIIN_7              = 907,
	MM_MOTU_MTPAV_MIDIOUT_7             = 907,
	MM_MOTU_MTPAV_MIDIIN_8              = 908,
	MM_MOTU_MTPAV_MIDIOUT_8             = 908,
	MM_MOTU_MTPAV_NET_MIDIIN_1          = 909,
	MM_MOTU_MTPAV_NET_MIDIOUT_1         = 909,
	MM_MOTU_MTPAV_NET_MIDIIN_2          = 910,
	MM_MOTU_MTPAV_NET_MIDIOUT_2         = 910,
	MM_MOTU_MTPAV_NET_MIDIIN_3          = 911,
	MM_MOTU_MTPAV_NET_MIDIOUT_3         = 911,
	MM_MOTU_MTPAV_NET_MIDIIN_4          = 912,
	MM_MOTU_MTPAV_NET_MIDIOUT_4         = 912,
	MM_MOTU_MTPAV_NET_MIDIIN_5          = 913,
	MM_MOTU_MTPAV_NET_MIDIOUT_5         = 913,
	MM_MOTU_MTPAV_NET_MIDIIN_6          = 914,
	MM_MOTU_MTPAV_NET_MIDIOUT_6         = 914,
	MM_MOTU_MTPAV_NET_MIDIIN_7          = 915,
	MM_MOTU_MTPAV_NET_MIDIOUT_7         = 915,
	MM_MOTU_MTPAV_NET_MIDIIN_8          = 916,
	MM_MOTU_MTPAV_NET_MIDIOUT_8         = 916,
	MM_MOTU_MTPAV_MIDIIN_ADAT           = 917,
	MM_MOTU_MTPAV_MIDIOUT_ADAT          = 917,
	MM_MOTU_MXPXT_MIDIIN_SYNC           = 1000,
	MM_MOTU_MXPXT_MIDIOUT_ALL           = 1000,
	MM_MOTU_MXPXT_MIDIIN_1              = 1001,
	MM_MOTU_MXPXT_MIDIOUT_1             = 1001,
	MM_MOTU_MXPXT_MIDIOUT_2             = 1002,
	MM_MOTU_MXPXT_MIDIIN_2              = 1002,
	MM_MOTU_MXPXT_MIDIIN_3              = 1003,
	MM_MOTU_MXPXT_MIDIOUT_3             = 1003,
	MM_MOTU_MXPXT_MIDIIN_4              = 1004,
	MM_MOTU_MXPXT_MIDIOUT_4             = 1004,
	MM_MOTU_MXPXT_MIDIIN_5              = 1005,
	MM_MOTU_MXPXT_MIDIOUT_5             = 1005,
	MM_MOTU_MXPXT_MIDIOUT_6             = 1006,
	MM_MOTU_MXPXT_MIDIIN_6              = 1006,
	MM_MOTU_MXPXT_MIDIOUT_7             = 1007,
	MM_MOTU_MXPXT_MIDIIN_7              = 1007,
	MM_MOTU_MXPXT_MIDIOUT_8             = 1008,
	MM_MOTU_MXPXT_MIDIIN_8              = 1008,
	MM_WORKBIT_MIXER                    = 1,
	MM_WORKBIT_WAVEOUT                  = 2,
	MM_WORKBIT_WAVEIN                   = 3,
	MM_WORKBIT_MIDIIN                   = 4,
	MM_WORKBIT_MIDIOUT                  = 5,
	MM_WORKBIT_FMSYNTH                  = 6,
	MM_WORKBIT_AUX                      = 7,
	MM_WORKBIT_JOYSTICK                 = 8,
	MM_OSITECH_TRUMPCARD                = 1,
	MM_MIRO_MOVIEPRO                    = 1,
	MM_MIRO_VIDEOD1                     = 2,
	MM_MIRO_VIDEODC1TV                  = 3,
	MM_MIRO_VIDEOTD                     = 4,
	MM_MIRO_DC30_WAVEOUT                = 5,
	MM_MIRO_DC30_WAVEIN                 = 6,
	MM_MIRO_DC30_MIX                    = 7,
	MM_ISOLUTION_PASCAL                 = 1,
	MM_VOICEMIXER                       = 1,
	ROCKWELL_WA1_WAVEIN                 = 100,
	ROCKWELL_WA1_WAVEOUT                = 101,
	ROCKWELL_WA1_SYNTH                  = 102,
	ROCKWELL_WA1_MIXER                  = 103,
	ROCKWELL_WA1_MPU401_IN              = 104,
	ROCKWELL_WA1_MPU401_OUT             = 105,
	ROCKWELL_WA2_WAVEIN                 = 200,
	ROCKWELL_WA2_WAVEOUT                = 201,
	ROCKWELL_WA2_SYNTH                  = 202,
	ROCKWELL_WA2_MIXER                  = 203,
	ROCKWELL_WA2_MPU401_IN              = 204,
	ROCKWELL_WA2_MPU401_OUT             = 205,
	MM_VOXWARE_CODEC                    = 1,
	MM_NORTEL_MPXAC_WAVEIN              = 1,
	MM_NORTEL_MPXAC_WAVEOUT             = 2,
	MM_ADDX_PCTV_DIGITALMIX             = 1,
	MM_ADDX_PCTV_WAVEIN                 = 2,
	MM_ADDX_PCTV_WAVEOUT                = 3,
	MM_ADDX_PCTV_MIXER                  = 4,
	MM_ADDX_PCTV_AUX_CD                 = 5,
	MM_ADDX_PCTV_AUX_LINE               = 6,
	MM_WILDCAT_AUTOSCOREMIDIIN          = 1,
	MM_RHETOREX_WAVEIN                  = 1,
	MM_RHETOREX_WAVEOUT                 = 2,
	MM_BTV_WAVEIN                       = 1,
	MM_BTV_WAVEOUT                      = 2,
	MM_BTV_MIDIIN                       = 3,
	MM_BTV_MIDIOUT                      = 4,
	MM_BTV_MIDISYNTH                    = 5,
	MM_BTV_AUX_LINE                     = 6,
	MM_BTV_AUX_MIC                      = 7,
	MM_BTV_AUX_CD                       = 8,
	MM_BTV_DIGITALIN                    = 9,
	MM_BTV_DIGITALOUT                   = 10,
	MM_BTV_MIDIWAVESTREAM               = 11,
	MM_BTV_MIXER                        = 12,
	MM_ENSONIQ_SOUNDSCAPE               = 0x10,
	MM_SOUNDSCAPE_WAVEOUT               = MM_ENSONIQ_SOUNDSCAPE+1,
	MM_SOUNDSCAPE_WAVEOUT_AUX           = MM_ENSONIQ_SOUNDSCAPE+2,
	MM_SOUNDSCAPE_WAVEIN                = MM_ENSONIQ_SOUNDSCAPE+3,
	MM_SOUNDSCAPE_MIDIOUT               = MM_ENSONIQ_SOUNDSCAPE+4,
	MM_SOUNDSCAPE_MIDIIN                = MM_ENSONIQ_SOUNDSCAPE+5,
	MM_SOUNDSCAPE_SYNTH                 = MM_ENSONIQ_SOUNDSCAPE+6,
	MM_SOUNDSCAPE_MIXER                 = MM_ENSONIQ_SOUNDSCAPE+7,
	MM_SOUNDSCAPE_AUX                   = MM_ENSONIQ_SOUNDSCAPE+8,
	MM_NVIDIA_WAVEOUT                   = 1,
	MM_NVIDIA_WAVEIN                    = 2,
	MM_NVIDIA_MIDIOUT                   = 3,
	MM_NVIDIA_MIDIIN                    = 4,
	MM_NVIDIA_GAMEPORT                  = 5,
	MM_NVIDIA_MIXER                     = 6,
	MM_NVIDIA_AUX                       = 7,
	MM_OKSORI_BASE                      = 0,
	MM_OKSORI_OSR8_WAVEOUT              = MM_OKSORI_BASE+1,
	MM_OKSORI_OSR8_WAVEIN               = MM_OKSORI_BASE+2,
	MM_OKSORI_OSR16_WAVEOUT             = MM_OKSORI_BASE+3,
	MM_OKSORI_OSR16_WAVEIN              = MM_OKSORI_BASE+4,
	MM_OKSORI_FM_OPL4                   = MM_OKSORI_BASE+5,
	MM_OKSORI_MIX_MASTER                = MM_OKSORI_BASE+6,
	MM_OKSORI_MIX_WAVE                  = MM_OKSORI_BASE+7,
	MM_OKSORI_MIX_FM                    = MM_OKSORI_BASE+8,
	MM_OKSORI_MIX_LINE                  = MM_OKSORI_BASE+9,
	MM_OKSORI_MIX_CD                    = MM_OKSORI_BASE+10,
	MM_OKSORI_MIX_MIC                   = MM_OKSORI_BASE+11,
	MM_OKSORI_MIX_ECHO                  = MM_OKSORI_BASE+12,
	MM_OKSORI_MIX_AUX1                  = MM_OKSORI_BASE+13,
	MM_OKSORI_MIX_LINE1                 = MM_OKSORI_BASE+14,
	MM_OKSORI_EXT_MIC1                  = MM_OKSORI_BASE+15,
	MM_OKSORI_EXT_MIC2                  = MM_OKSORI_BASE+16,
	MM_OKSORI_MIDIOUT                   = MM_OKSORI_BASE+17,
	MM_OKSORI_MIDIIN                    = MM_OKSORI_BASE+18,
	MM_OKSORI_MPEG_CDVISION             = MM_OKSORI_BASE+19,
	MM_DIACOUSTICS_DRUM_ACTION          = 1,
	MM_KAY_ELEMETRICS_CSL               = 0x4300,
	MM_KAY_ELEMETRICS_CSL_DAT           = 0x4308,
	MM_KAY_ELEMETRICS_CSL_4CHANNEL      = 0x4309,
	MM_CRYSTAL_CS4232_WAVEIN            = 1,
	MM_CRYSTAL_CS4232_WAVEOUT           = 2,
	MM_CRYSTAL_CS4232_WAVEMIXER         = 3,
	MM_CRYSTAL_CS4232_WAVEAUX_AUX1      = 4,
	MM_CRYSTAL_CS4232_WAVEAUX_AUX2      = 5,
	MM_CRYSTAL_CS4232_WAVEAUX_LINE      = 6,
	MM_CRYSTAL_CS4232_WAVEAUX_MONO      = 7,
	MM_CRYSTAL_CS4232_WAVEAUX_MASTER    = 8,
	MM_CRYSTAL_CS4232_MIDIIN            = 9,
	MM_CRYSTAL_CS4232_MIDIOUT           = 10,
	MM_CRYSTAL_CS4232_INPUTGAIN_AUX1    = 13,
	MM_CRYSTAL_CS4232_INPUTGAIN_LOOP    = 14,
	MM_CRYSTAL_SOUND_FUSION_WAVEIN      = 21,
	MM_CRYSTAL_SOUND_FUSION_WAVEOUT     = 22,
	MM_CRYSTAL_SOUND_FUSION_MIXER       = 23,
	MM_CRYSTAL_SOUND_FUSION_MIDIIN      = 24,
	MM_CRYSTAL_SOUND_FUSION_MIDIOUT     = 25,
	MM_CRYSTAL_SOUND_FUSION_JOYSTICK    = 26,
	MM_QUARTERDECK_LHWAVEIN             = 0,
	MM_QUARTERDECK_LHWAVEOUT            = 1,
	MM_TDK_MW_MIDI_SYNTH                = 1,
	MM_TDK_MW_MIDI_IN                   = 2,
	MM_TDK_MW_MIDI_OUT                  = 3,
	MM_TDK_MW_WAVE_IN                   = 4,
	MM_TDK_MW_WAVE_OUT                  = 5,
	MM_TDK_MW_AUX                       = 6,
	MM_TDK_MW_MIXER                     = 10,
	MM_TDK_MW_AUX_MASTER                = 100,
	MM_TDK_MW_AUX_BASS                  = 101,
	MM_TDK_MW_AUX_TREBLE                = 102,
	MM_TDK_MW_AUX_MIDI_VOL              = 103,
	MM_TDK_MW_AUX_WAVE_VOL              = 104,
	MM_TDK_MW_AUX_WAVE_RVB              = 105,
	MM_TDK_MW_AUX_WAVE_CHR              = 106,
	MM_TDK_MW_AUX_VOL                   = 107,
	MM_TDK_MW_AUX_RVB                   = 108,
	MM_TDK_MW_AUX_CHR                   = 109,
	MM_DIGITAL_AUDIO_LABS_TC            = 0x01,
	MM_DIGITAL_AUDIO_LABS_DOC           = 0x02,
	MM_DIGITAL_AUDIO_LABS_V8            = 0x10,
	MM_DIGITAL_AUDIO_LABS_CPRO          = 0x11,
	MM_DIGITAL_AUDIO_LABS_VP            = 0x12,
	MM_DIGITAL_AUDIO_LABS_CDLX          = 0x13,
	MM_DIGITAL_AUDIO_LABS_CTDIF         = 0x14,
	MM_SEERSYS_SEERSYNTH                = 1,
	MM_SEERSYS_SEERWAVE                 = 2,
	MM_SEERSYS_SEERMIX                  = 3,
	MM_SEERSYS_WAVESYNTH                = 4,
	MM_SEERSYS_WAVESYNTH_WG             = 5,
	MM_SEERSYS_REALITY                  = 6,
	MM_OSPREY_1000WAVEIN                = 1,
	MM_OSPREY_1000WAVEOUT               = 2,
	MM_SOUNDESIGNS_WAVEIN               = 1,
	MM_SOUNDESIGNS_WAVEOUT              = 2,
	MM_SSP_SNDFESWAVEIN                 = 1,
	MM_SSP_SNDFESWAVEOUT                = 2,
	MM_SSP_SNDFESMIDIIN                 = 3,
	MM_SSP_SNDFESMIDIOUT                = 4,
	MM_SSP_SNDFESSYNTH                  = 5,
	MM_SSP_SNDFESMIX                    = 6,
	MM_SSP_SNDFESAUX                    = 7,
	MM_ECS_AADF_MIDI_IN                 = 10,
	MM_ECS_AADF_MIDI_OUT                = 11,
	MM_ECS_AADF_WAVE2MIDI_IN            = 12,
	MM_AMD_INTERWAVE_WAVEIN             = 1,
	MM_AMD_INTERWAVE_WAVEOUT            = 2,
	MM_AMD_INTERWAVE_SYNTH              = 3,
	MM_AMD_INTERWAVE_MIXER1             = 4,
	MM_AMD_INTERWAVE_MIXER2             = 5,
	MM_AMD_INTERWAVE_JOYSTICK           = 6,
	MM_AMD_INTERWAVE_EX_CD              = 7,
	MM_AMD_INTERWAVE_MIDIIN             = 8,
	MM_AMD_INTERWAVE_MIDIOUT            = 9,
	MM_AMD_INTERWAVE_AUX1               = 10,
	MM_AMD_INTERWAVE_AUX2               = 11,
	MM_AMD_INTERWAVE_AUX_MIC            = 12,
	MM_AMD_INTERWAVE_AUX_CD             = 13,
	MM_AMD_INTERWAVE_MONO_IN            = 14,
	MM_AMD_INTERWAVE_MONO_OUT           = 15,
	MM_AMD_INTERWAVE_EX_TELEPHONY       = 16,
	MM_AMD_INTERWAVE_WAVEOUT_BASE       = 17,
	MM_AMD_INTERWAVE_WAVEOUT_TREBLE     = 18,
	MM_AMD_INTERWAVE_STEREO_ENHANCED    = 19,
	MM_COREDYNAMICS_DYNAMIXHR           = 1,
	MM_COREDYNAMICS_DYNASONIX_SYNTH     = 2,
	MM_COREDYNAMICS_DYNASONIX_MIDI_IN   = 3,
	MM_COREDYNAMICS_DYNASONIX_MIDI_OUT  = 4,
	MM_COREDYNAMICS_DYNASONIX_WAVE_IN   = 5,
	MM_COREDYNAMICS_DYNASONIX_WAVE_OUT  = 6,
	MM_COREDYNAMICS_DYNASONIX_AUDIO_IN  = 7,
	MM_COREDYNAMICS_DYNASONIX_AUDIO_OUT = 8,
	MM_COREDYNAMICS_DYNAGRAFX_VGA       = 9,
	MM_COREDYNAMICS_DYNAGRAFX_WAVE_IN   = 10,
	MM_COREDYNAMICS_DYNAGRAFX_WAVE_OUT  = 11,
	MM_CANAM_CBXWAVEOUT                 = 1,
	MM_CANAM_CBXWAVEIN                  = 2,
	MM_SOFTSOUND_CODEC                  = 1,
	MM_NORRIS_VOICELINK                 = 1,
	MM_DDD_MIDILINK_MIDIIN              = 1,
	MM_DDD_MIDILINK_MIDIOUT             = 2,
	MM_EUPHONICS_AUX_CD                 = 1,
	MM_EUPHONICS_AUX_LINE               = 2,
	MM_EUPHONICS_AUX_MASTER             = 3,
	MM_EUPHONICS_AUX_MIC                = 4,
	MM_EUPHONICS_AUX_MIDI               = 5,
	MM_EUPHONICS_AUX_WAVE               = 6,
	MM_EUPHONICS_FMSYNTH_MONO           = 7,
	MM_EUPHONICS_FMSYNTH_STEREO         = 8,
	MM_EUPHONICS_MIDIIN                 = 9,
	MM_EUPHONICS_MIDIOUT                = 10,
	MM_EUPHONICS_MIXER                  = 11,
	MM_EUPHONICS_WAVEIN                 = 12,
	MM_EUPHONICS_WAVEOUT                = 13,
	MM_EUPHONICS_EUSYNTH                = 14,
	CRYSTAL_NET_SFM_CODEC               = 1,
	MM_CHROMATIC_M1                     = 0x0001,
	MM_CHROMATIC_M1_WAVEIN              = 0x0002,
	MM_CHROMATIC_M1_WAVEOUT             = 0x0003,
	MM_CHROMATIC_M1_FMSYNTH             = 0x0004,
	MM_CHROMATIC_M1_MIXER               = 0x0005,
	MM_CHROMATIC_M1_AUX                 = 0x0006,
	MM_CHROMATIC_M1_AUX_CD              = 0x0007,
	MM_CHROMATIC_M1_MIDIIN              = 0x0008,
	MM_CHROMATIC_M1_MIDIOUT             = 0x0009,
	MM_CHROMATIC_M1_WTSYNTH             = 0x0010,
	MM_CHROMATIC_M1_MPEGWAVEIN          = 0x0011,
	MM_CHROMATIC_M1_MPEGWAVEOUT         = 0x0012,
	MM_CHROMATIC_M2                     = 0x0013,
	MM_CHROMATIC_M2_WAVEIN              = 0x0014,
	MM_CHROMATIC_M2_WAVEOUT             = 0x0015,
	MM_CHROMATIC_M2_FMSYNTH             = 0x0016,
	MM_CHROMATIC_M2_MIXER               = 0x0017,
	MM_CHROMATIC_M2_AUX                 = 0x0018,
	MM_CHROMATIC_M2_AUX_CD              = 0x0019,
	MM_CHROMATIC_M2_MIDIIN              = 0x0020,
	MM_CHROMATIC_M2_MIDIOUT             = 0x0021,
	MM_CHROMATIC_M2_WTSYNTH             = 0x0022,
	MM_CHROMATIC_M2_MPEGWAVEIN          = 0x0023,
	MM_CHROMATIC_M2_MPEGWAVEOUT         = 0x0024,
	MM_VIENNASYS_TSP_WAVE_DRIVER        = 1,
	MM_CONNECTIX_VIDEC_CODEC            = 1,
	MM_GADGETLABS_WAVE44_WAVEIN         = 1,
	MM_GADGETLABS_WAVE44_WAVEOUT        = 2,
	MM_GADGETLABS_WAVE42_WAVEIN         = 3,
	MM_GADGETLABS_WAVE42_WAVEOUT        = 4,
	MM_GADGETLABS_WAVE4_MIDIIN          = 5,
	MM_GADGETLABS_WAVE4_MIDIOUT         = 6,
	MM_FRONTIER_WAVECENTER_MIDIIN       = 1,
	MM_FRONTIER_WAVECENTER_MIDIOUT      = 2,
	MM_FRONTIER_WAVECENTER_WAVEIN       = 3,
	MM_FRONTIER_WAVECENTER_WAVEOUT      = 4,
	MM_VIONA_QVINPCI_MIXER              = 1,
	MM_VIONA_QVINPCI_WAVEIN             = 2,
	MM_VIONAQVINPCI_WAVEOUT             = 3,
	MM_VIONA_BUSTER_MIXER               = 4,
	MM_VIONA_CINEMASTER_MIXER           = 5,
	MM_VIONA_CONCERTO_MIXER             = 6,
	MM_CASIO_WP150_MIDIOUT              = 1,
	MM_CASIO_WP150_MIDIIN               = 2,
	MM_CASIO_LSG_MIDIOUT                = 3,
	MM_DIMD_PLATFORM                    = 0,
	MM_DIMD_DIRSOUND                    = 1,
	MM_DIMD_VIRTMPU                     = 2,
	MM_DIMD_VIRTSB                      = 3,
	MM_DIMD_VIRTJOY                     = 4,
	MM_DIMD_WAVEIN                      = 5,
	MM_DIMD_WAVEOUT                     = 6,
	MM_DIMD_MIDIIN                      = 7,
	MM_DIMD_MIDIOUT                     = 8,
	MM_DIMD_AUX_LINE                    = 9,
	MM_DIMD_MIXER                       = 10,
	MM_DIMD_WSS_WAVEIN                  = 14,
	MM_DIMD_WSS_WAVEOUT                 = 15,
	MM_DIMD_WSS_MIXER                   = 17,
	MM_DIMD_WSS_AUX                     = 21,
	MM_DIMD_WSS_SYNTH                   = 76,
	MM_S3_WAVEOUT                       = 1,
	MM_S3_WAVEIN                        = 2,
	MM_S3_MIDIOUT                       = 3,
	MM_S3_MIDIIN                        = 4,
	MM_S3_FMSYNTH                       = 5,
	MM_S3_MIXER                         = 6,
	MM_S3_AUX                           = 7,
	MM_VKC_MPU401_MIDIIN                = 0x0100,
	MM_VKC_SERIAL_MIDIIN                = 0x0101,
	MM_VKC_MPU401_MIDIOUT               = 0x0200,
	MM_VKC_SERIAL_MIDIOUT               = 0x0201,
	MM_ZEFIRO_ZA2                       = 2,
	MM_FHGIIS_MPEGLAYER3                = 10,
	MM_QUICKNET_PJWAVEIN                = 1,
	MM_QUICKNET_PJWAVEOUT               = 2,
	MM_SICRESOURCE_SSO3D                = 2,
	MM_SICRESOURCE_SSOW3DI              = 3,
	MM_NEOMAGIC_SYNTH                   = 1,
	MM_NEOMAGIC_WAVEOUT                 = 2,
	MM_NEOMAGIC_WAVEIN                  = 3,
	MM_NEOMAGIC_MIDIOUT                 = 4,
	MM_NEOMAGIC_MIDIIN                  = 5,
	MM_NEOMAGIC_AUX                     = 6,
	MM_NEOMAGIC_MW3DX_WAVEOUT           = 10,
	MM_NEOMAGIC_MW3DX_WAVEIN            = 11,
	MM_NEOMAGIC_MW3DX_MIDIOUT           = 12,
	MM_NEOMAGIC_MW3DX_MIDIIN            = 13,
	MM_NEOMAGIC_MW3DX_FMSYNTH           = 14,
	MM_NEOMAGIC_MW3DX_GMSYNTH           = 15,
	MM_NEOMAGIC_MW3DX_MIXER             = 16,
	MM_NEOMAGIC_MW3DX_AUX               = 17,
	MM_NEOMAGIC_MWAVE_WAVEOUT           = 20,
	MM_NEOMAGIC_MWAVE_WAVEIN            = 21,
	MM_NEOMAGIC_MWAVE_MIDIOUT           = 22,
	MM_NEOMAGIC_MWAVE_MIDIIN            = 23,
	MM_NEOMAGIC_MWAVE_MIXER             = 24,
	MM_NEOMAGIC_MWAVE_AUX               = 25,
	MM_MERGING_MPEGL3                   = 1,
	MM_XIRLINK_VISIONLINK               = 1,
	MM_OTI_611WAVEIN                    = 5,
	MM_OTI_611WAVEOUT                   = 6,
	MM_OTI_611MIXER                     = 7,
	MM_OTI_611MIDIN                     = 0x12,
	MM_OTI_611MIDIOUT                   = 0x13,
	MM_AUREAL_AU8820                    = 16,
	MM_AU8820_SYNTH                     = 17,
	MM_AU8820_WAVEOUT                   = 18,
	MM_AU8820_WAVEIN                    = 19,
	MM_AU8820_MIXER                     = 20,
	MM_AU8820_AUX                       = 21,
	MM_AU8820_MIDIOUT                   = 22,
	MM_AU8820_MIDIIN                    = 23,
	MM_AUREAL_AU8830                    = 32,
	MM_AU8830_SYNTH                     = 33,
	MM_AU8830_WAVEOUT                   = 34,
	MM_AU8830_WAVEIN                    = 35,
	MM_AU8830_MIXER                     = 36,
	MM_AU8830_AUX                       = 37,
	MM_AU8830_MIDIOUT                   = 38,
	MM_AU8830_MIDIIN                    = 39,
	MM_VIVO_AUDIO_CODEC                 = 1,
	MM_SHARP_MDC_MIDI_SYNTH             = 1,
	MM_SHARP_MDC_MIDI_IN                = 2,
	MM_SHARP_MDC_MIDI_OUT               = 3,
	MM_SHARP_MDC_WAVE_IN                = 4,
	MM_SHARP_MDC_WAVE_OUT               = 5,
	MM_SHARP_MDC_AUX                    = 6,
	MM_SHARP_MDC_MIXER                  = 10,
	MM_SHARP_MDC_AUX_MASTER             = 100,
	MM_SHARP_MDC_AUX_BASS               = 101,
	MM_SHARP_MDC_AUX_TREBLE             = 102,
	MM_SHARP_MDC_AUX_MIDI_VOL           = 103,
	MM_SHARP_MDC_AUX_WAVE_VOL           = 104,
	MM_SHARP_MDC_AUX_WAVE_RVB           = 105,
	MM_SHARP_MDC_AUX_WAVE_CHR           = 106,
	MM_SHARP_MDC_AUX_VOL                = 107,
	MM_SHARP_MDC_AUX_RVB                = 108,
	MM_SHARP_MDC_AUX_CHR                = 109,
	MM_LUCENT_ACM_G723                  = 0,
	MM_ATT_G729A                        = 1,
	MM_MARIAN_ARC44WAVEIN               = 1,
	MM_MARIAN_ARC44WAVEOUT              = 2,
	MM_MARIAN_PRODIF24WAVEIN            = 3,
	MM_MARIAN_PRODIF24WAVEOUT           = 4,
	MM_MARIAN_ARC88WAVEIN               = 5,
	MM_MARIAN_ARC88WAVEOUT              = 6,
	MM_BCB_NETBOARD_10                  = 1,
	MM_BCB_TT75_10                      = 2,
	MM_MOTIONPIXELS_MVI2                = 1,
	MM_QDESIGN_ACM_MPEG                 = 1,
	MM_QDESIGN_ACM_QDESIGN_MUSIC        = 2,
	MM_NMP_CCP_WAVEIN                   = 1,
	MM_NMP_CCP_WAVEOUT                  = 2,
	MM_NMP_ACM_AMR                      = 10,
	MM_DF_ACM_G726                      = 1,
	MM_DF_ACM_GSM610                    = 2,
	MM_BERCOS_WAVEIN                    = 1,
	MM_BERCOS_MIXER                     = 2,
	MM_BERCOS_WAVEOUT                   = 3,
	MM_ONLIVE_MPCODEC                   = 1,
	MM_PHONET_PP_WAVEOUT                = 1,
	MM_PHONET_PP_WAVEIN                 = 2,
	MM_PHONET_PP_MIXER                  = 3,
	MM_FTR_ENCODER_WAVEIN               = 1,
	MM_FTR_ACM                          = 2,
	MM_ENET_T2000_LINEIN                = 1,
	MM_ENET_T2000_LINEOUT               = 2,
	MM_ENET_T2000_HANDSETIN             = 3,
	MM_ENET_T2000_HANDSETOUT            = 4,
	MM_EMAGIC_UNITOR8                   = 1,
	MM_SIPROLAB_ACELPNET                = 1,
	MM_DICTAPHONE_G726                  = 1,
	MM_RZS_ACM_TUBGSM                   = 1,
	MM_EES_PCMIDI14                     = 1,
	MM_EES_PCMIDI14_IN                  = 2,
	MM_EES_PCMIDI14_OUT1                = 3,
	MM_EES_PCMIDI14_OUT2                = 4,
	MM_EES_PCMIDI14_OUT3                = 5,
	MM_EES_PCMIDI14_OUT4                = 6,
	MM_HAFTMANN_LPTDAC2                 = 1,
	MM_LUCID_PCI24WAVEIN                = 1,
	MM_LUCID_PCI24WAVEOUT               = 2,
	MM_HEADSPACE_HAESYNTH               = 1,
	MM_HEADSPACE_HAEWAVEOUT             = 2,
	MM_HEADSPACE_HAEWAVEIN              = 3,
	MM_HEADSPACE_HAEMIXER               = 4,
	MM_UNISYS_ACM_NAP                   = 1,
	MM_LUMINOSITI_SCWAVEIN              = 1,
	MM_LUMINOSITI_SCWAVEOUT             = 2,
	MM_LUMINOSITI_SCWAVEMIX             = 3,
	MM_ACTIVEVOICE_ACM_VOXADPCM         = 1,
	MM_DTS_DS                           = 1,
	MM_SOFTLAB_NSK_FRW_WAVEIN           = 1,
	MM_SOFTLAB_NSK_FRW_WAVEOUT          = 2,
	MM_SOFTLAB_NSK_FRW_MIXER            = 3,
	MM_SOFTLAB_NSK_FRW_AUX              = 4,
	MM_FORTEMEDIA_WAVEIN                = 1,
	MM_FORTEMEDIA_WAVEOUT               = 2,
	MM_FORTEMEDIA_FMSYNC                = 3,
	MM_FORTEMEDIA_MIXER                 = 4,
	MM_FORTEMEDIA_AUX                   = 5,
	MM_SONORUS_STUDIO                   = 1,
	MM_I_LINK_VOICE_CODER               = 1,
	MM_SELSIUS_SYSTEMS_RTPWAVEOUT       = 1,
	MM_SELSIUS_SYSTEMS_RTPWAVEIN        = 2,
	MM_ADMOS_FM_SYNTH                   = 1,
	MM_ADMOS_QS3AMIDIOUT                = 2,
	MM_ADMOS_QS3AMIDIIN                 = 3,
	MM_ADMOS_QS3AWAVEOUT                = 4,
	MM_ADMOS_QS3AWAVEIN                 = 5,
	MM_LEXICON_STUDIO_WAVE_OUT          = 1,
	MM_LEXICON_STUDIO_WAVE_IN           = 2,
	MM_SGI_320_WAVEIN                   = 1,
	MM_SGI_320_WAVEOUT                  = 2,
	MM_SGI_320_MIXER                    = 3,
	MM_SGI_540_WAVEIN                   = 4,
	MM_SGI_540_WAVEOUT                  = 5,
	MM_SGI_540_MIXER                    = 6,
	MM_SGI_RAD_ADATMONO1_WAVEIN         = 7,
	MM_SGI_RAD_ADATMONO2_WAVEIN         = 8,
	MM_SGI_RAD_ADATMONO3_WAVEIN         = 9,
	MM_SGI_RAD_ADATMONO4_WAVEIN         = 10,
	MM_SGI_RAD_ADATMONO5_WAVEIN         = 11,
	MM_SGI_RAD_ADATMONO6_WAVEIN         = 12,
	MM_SGI_RAD_ADATMONO7_WAVEIN         = 13,
	MM_SGI_RAD_ADATMONO8_WAVEIN         = 14,
	MM_SGI_RAD_ADATSTEREO12_WAVEIN      = 15,
	MM_SGI_RAD_ADATSTEREO34_WAVEIN      = 16,
	MM_SGI_RAD_ADATSTEREO56_WAVEIN      = 17,
	MM_SGI_RAD_ADATSTEREO78_WAVEIN      = 18,
	MM_SGI_RAD_ADAT8CHAN_WAVEIN         = 19,
	MM_SGI_RAD_ADATMONO1_WAVEOUT        = 20,
	MM_SGI_RAD_ADATMONO2_WAVEOUT        = 21,
	MM_SGI_RAD_ADATMONO3_WAVEOUT        = 22,
	MM_SGI_RAD_ADATMONO4_WAVEOUT        = 23,
	MM_SGI_RAD_ADATMONO5_WAVEOUT        = 24,
	MM_SGI_RAD_ADATMONO6_WAVEOUT        = 25,
	MM_SGI_RAD_ADATMONO7_WAVEOUT        = 26,
	MM_SGI_RAD_ADATMONO8_WAVEOUT        = 27,
	MM_SGI_RAD_ADATSTEREO12_WAVEOUT     = 28,
	MM_SGI_RAD_ADATSTEREO32_WAVEOUT     = 29,
	MM_SGI_RAD_ADATSTEREO56_WAVEOUT     = 30,
	MM_SGI_RAD_ADATSTEREO78_WAVEOUT     = 31,
	MM_SGI_RAD_ADAT8CHAN_WAVEOUT        = 32,
	MM_SGI_RAD_AESMONO1_WAVEIN          = 33,
	MM_SGI_RAD_AESMONO2_WAVEIN          = 34,
	MM_SGI_RAD_AESSTEREO_WAVEIN         = 35,
	MM_SGI_RAD_AESMONO1_WAVEOUT         = 36,
	MM_SGI_RAD_AESMONO2_WAVEOUT         = 37,
	MM_SGI_RAD_AESSTEREO_WAVEOUT        = 38,
	MM_IPI_ACM_HSX                      = 1,
	MM_IPI_ACM_RPELP                    = 2,
	MM_IPI_WF_ASSS                      = 3,
	MM_IPI_AT_WAVEOUT                   = 4,
	MM_IPI_AT_WAVEIN                    = 5,
	MM_IPI_AT_MIXER                     = 6,
	MM_ICE_WAVEOUT                      = 1,
	MM_ICE_WAVEIN                       = 2,
	MM_ICE_MTWAVEOUT                    = 3,
	MM_ICE_MTWAVEIN                     = 4,
	MM_ICE_MIDIOUT1                     = 5,
	MM_ICE_MIDIIN1                      = 6,
	MM_ICE_MIDIOUT2                     = 7,
	MM_ICE_MIDIIN2                      = 8,
	MM_ICE_SYNTH                        = 9,
	MM_ICE_MIXER                        = 10,
	MM_ICE_AUX                          = 11,
	MM_VQST_VQC1                        = 1,
	MM_VQST_VQC2                        = 2,
	MM_ETEK_KWIKMIDI_MIDIIN             = 1,
	MM_ETEK_KWIKMIDI_MIDIOUT            = 2,
	MM_INTERNET_SSW_MIDIOUT             = 10,
	MM_INTERNET_SSW_MIDIIN              = 11,
	MM_INTERNET_SSW_WAVEOUT             = 12,
	MM_INTERNET_SSW_WAVEIN              = 13,
	MM_SONY_ACM_SCX                     = 1,
	MM_UH_ACM_ADPCM                     = 1,
	MM_SYDEC_NV_WAVEIN                  = 1,
	MM_SYDEC_NV_WAVEOUT                 = 2,
	MM_FLEXION_X300_WAVEIN              = 1,
	MM_FLEXION_X300_WAVEOUT             = 2,
	MM_VIA_WAVEOUT                      = 1,
	MM_VIA_WAVEIN                       = 2,
	MM_VIA_MIXER                        = 3,
	MM_VIA_AUX                          = 4,
	MM_VIA_MPU401_MIDIOUT               = 5,
	MM_VIA_MPU401_MIDIIN                = 6,
	MM_VIA_SWFM_SYNTH                   = 7,
	MM_VIA_WDM_WAVEOUT                  = 8,
	MM_VIA_WDM_WAVEIN                   = 9,
	MM_VIA_WDM_MIXER                    = 10,
	MM_VIA_WDM_MPU401_MIDIOUT           = 11,
	MM_VIA_WDM_MPU401_MIDIIN            = 12,
	MM_MICRONAS_SC4                     = 1,
	MM_MICRONAS_CLP833                  = 2,
	MM_HP_WAVEOUT                       = 1,
	MM_HP_WAVEIN                        = 2,
	MM_QUICKAUDIO_MINIMIDI              = 1,
	MM_QUICKAUDIO_MAXIMIDI              = 2,
	MM_ICCC_UNA3_WAVEIN                 = 1,
	MM_ICCC_UNA3_WAVEOUT                = 2,
	MM_ICCC_UNA3_AUX                    = 3,
	MM_ICCC_UNA3_MIXER                  = 4,
	MM_3COM_CB_MIXER                    = 1,
	MM_3COM_CB_WAVEIN                   = 2,
	MM_3COM_CB_WAVEOUT                  = 3,
	MM_MINDMAKER_GC_WAVEIN              = 1,
	MM_MINDMAKER_GC_WAVEOUT             = 2,
	MM_MINDMAKER_GC_MIXER               = 3,
	MM_TELEKOL_WAVEOUT                  = 1,
	MM_TELEKOL_WAVEIN                   = 2,
	MM_ALGOVISION_VB80WAVEOUT           = 1,
	MM_ALGOVISION_VB80WAVEIN            = 2,
	MM_ALGOVISION_VB80MIXER             = 3,
	MM_ALGOVISION_VB80AUX               = 4,
	MM_ALGOVISION_VB80AUX2              = 5,
}

enum {
	RIFFINFO_IARL = mmioFOURCC('I', 'A', 'R', 'L'),
	RIFFINFO_IART = mmioFOURCC('I', 'A', 'R', 'T'),
	RIFFINFO_ICMS = mmioFOURCC('I', 'C', 'M', 'S'),
	RIFFINFO_ICMT = mmioFOURCC('I', 'C', 'M', 'T'),
	RIFFINFO_ICOP = mmioFOURCC('I', 'C', 'O', 'P'),
	RIFFINFO_ICRD = mmioFOURCC('I', 'C', 'R', 'D'),
	RIFFINFO_ICRP = mmioFOURCC('I', 'C', 'R', 'P'),
	RIFFINFO_IDIM = mmioFOURCC('I', 'D', 'I', 'M'),
	RIFFINFO_IDPI = mmioFOURCC('I', 'D', 'P', 'I'),
	RIFFINFO_IENG = mmioFOURCC('I', 'E', 'N', 'G'),
	RIFFINFO_IGNR = mmioFOURCC('I', 'G', 'N', 'R'),
	RIFFINFO_IKEY = mmioFOURCC('I', 'K', 'E', 'Y'),
	RIFFINFO_ILGT = mmioFOURCC('I', 'L', 'G', 'T'),
	RIFFINFO_IMED = mmioFOURCC('I', 'M', 'E', 'D'),
	RIFFINFO_INAM = mmioFOURCC('I', 'N', 'A', 'M'),
	RIFFINFO_IPLT = mmioFOURCC('I', 'P', 'L', 'T'),
	RIFFINFO_IPRD = mmioFOURCC('I', 'P', 'R', 'D'),
	RIFFINFO_ISBJ = mmioFOURCC('I', 'S', 'B', 'J'),
	RIFFINFO_ISFT = mmioFOURCC('I', 'S', 'F', 'T'),
	RIFFINFO_ISHP = mmioFOURCC('I', 'S', 'H', 'P'),
	RIFFINFO_ISRC = mmioFOURCC('I', 'S', 'R', 'C'),
	RIFFINFO_ISRF = mmioFOURCC('I', 'S', 'R', 'F'),
	RIFFINFO_ITCH = mmioFOURCC('I', 'T', 'C', 'H'),
	RIFFINFO_ISMP = mmioFOURCC('I', 'S', 'M', 'P'),
	RIFFINFO_IDIT = mmioFOURCC('I', 'D', 'I', 'T'),
	RIFFINFO_ITRK = mmioFOURCC('I', 'T', 'R', 'K'),
	RIFFINFO_ITOC = mmioFOURCC('I', 'T', 'O', 'C'),
}

enum {
	WAVE_FORMAT_UNKNOWN                 = 0x0000,
	WAVE_FORMAT_ADPCM                   = 0x0002,
	WAVE_FORMAT_IEEE_FLOAT              = 0x0003,
	WAVE_FORMAT_VSELP                   = 0x0004,
	WAVE_FORMAT_IBM_CVSD                = 0x0005,
	WAVE_FORMAT_ALAW                    = 0x0006,
	WAVE_FORMAT_MULAW                   = 0x0007,
	WAVE_FORMAT_DTS                     = 0x0008,
	WAVE_FORMAT_DRM                     = 0x0009,
	WAVE_FORMAT_WMAVOICE9               = 0x000A,
	WAVE_FORMAT_WMAVOICE10              = 0x000B,
	WAVE_FORMAT_OKI_ADPCM               = 0x0010,
	WAVE_FORMAT_DVI_ADPCM               = 0x0011,
	WAVE_FORMAT_IMA_ADPCM               = WAVE_FORMAT_DVI_ADPCM,
	WAVE_FORMAT_MEDIASPACE_ADPCM        = 0x0012,
	WAVE_FORMAT_SIERRA_ADPCM            = 0x0013,
	WAVE_FORMAT_G723_ADPCM              = 0x0014,
	WAVE_FORMAT_DIGISTD                 = 0x0015,
	WAVE_FORMAT_DIGIFIX                 = 0x0016,
	WAVE_FORMAT_DIALOGIC_OKI_ADPCM      = 0x0017,
	WAVE_FORMAT_MEDIAVISION_ADPCM       = 0x0018,
	WAVE_FORMAT_CU_CODEC                = 0x0019,
	WAVE_FORMAT_YAMAHA_ADPCM            = 0x0020,
	WAVE_FORMAT_SONARC                  = 0x0021,
	WAVE_FORMAT_DSPGROUP_TRUESPEECH     = 0x0022,
	WAVE_FORMAT_ECHOSC1                 = 0x0023,
	WAVE_FORMAT_AUDIOFILE_AF36          = 0x0024,
	WAVE_FORMAT_APTX                    = 0x0025,
	WAVE_FORMAT_AUDIOFILE_AF10          = 0x0026,
	WAVE_FORMAT_PROSODY_1612            = 0x0027,
	WAVE_FORMAT_LRC                     = 0x0028,
	WAVE_FORMAT_DOLBY_AC2               = 0x0030,
	WAVE_FORMAT_GSM610                  = 0x0031,
	WAVE_FORMAT_MSNAUDIO                = 0x0032,
	WAVE_FORMAT_ANTEX_ADPCME            = 0x0033,
	WAVE_FORMAT_CONTROL_RES_VQLPC       = 0x0034,
	WAVE_FORMAT_DIGIREAL                = 0x0035,
	WAVE_FORMAT_DIGIADPCM               = 0x0036,
	WAVE_FORMAT_CONTROL_RES_CR10        = 0x0037,
	WAVE_FORMAT_NMS_VBXADPCM            = 0x0038,
	WAVE_FORMAT_CS_IMAADPCM             = 0x0039,
	WAVE_FORMAT_ECHOSC3                 = 0x003A,
	WAVE_FORMAT_ROCKWELL_ADPCM          = 0x003B,
	WAVE_FORMAT_ROCKWELL_DIGITALK       = 0x003C,
	WAVE_FORMAT_XEBEC                   = 0x003D,
	WAVE_FORMAT_G721_ADPCM              = 0x0040,
	WAVE_FORMAT_G728_CELP               = 0x0041,
	WAVE_FORMAT_MSG723                  = 0x0042,
	WAVE_FORMAT_MPEG                    = 0x0050,
	WAVE_FORMAT_RT24                    = 0x0052,
	WAVE_FORMAT_PAC                     = 0x0053,
	WAVE_FORMAT_MPEGLAYER3              = 0x0055,
	WAVE_FORMAT_LUCENT_G723             = 0x0059,
	WAVE_FORMAT_CIRRUS                  = 0x0060,
	WAVE_FORMAT_ESPCM                   = 0x0061,
	WAVE_FORMAT_VOXWARE                 = 0x0062,
	WAVE_FORMAT_CANOPUS_ATRAC           = 0x0063,
	WAVE_FORMAT_G726_ADPCM              = 0x0064,
	WAVE_FORMAT_G722_ADPCM              = 0x0065,
	WAVE_FORMAT_DSAT_DISPLAY            = 0x0067,
	WAVE_FORMAT_VOXWARE_BYTE_ALIGNED    = 0x0069,
	WAVE_FORMAT_VOXWARE_AC8             = 0x0070,
	WAVE_FORMAT_VOXWARE_AC10            = 0x0071,
	WAVE_FORMAT_VOXWARE_AC16            = 0x0072,
	WAVE_FORMAT_VOXWARE_AC20            = 0x0073,
	WAVE_FORMAT_VOXWARE_RT24            = 0x0074,
	WAVE_FORMAT_VOXWARE_RT29            = 0x0075,
	WAVE_FORMAT_VOXWARE_RT29HW          = 0x0076,
	WAVE_FORMAT_VOXWARE_VR12            = 0x0077,
	WAVE_FORMAT_VOXWARE_VR18            = 0x0078,
	WAVE_FORMAT_VOXWARE_TQ40            = 0x0079,
	WAVE_FORMAT_SOFTSOUND               = 0x0080,
	WAVE_FORMAT_VOXWARE_TQ60            = 0x0081,
	WAVE_FORMAT_MSRT24                  = 0x0082,
	WAVE_FORMAT_G729A                   = 0x0083,
	WAVE_FORMAT_MVI_MVI2                = 0x0084,
	WAVE_FORMAT_DF_G726                 = 0x0085,
	WAVE_FORMAT_DF_GSM610               = 0x0086,
	WAVE_FORMAT_ISIAUDIO                = 0x0088,
	WAVE_FORMAT_ONLIVE                  = 0x0089,
	WAVE_FORMAT_SBC24                   = 0x0091,
	WAVE_FORMAT_DOLBY_AC3_SPDIF         = 0x0092,
	WAVE_FORMAT_MEDIASONIC_G723         = 0x0093,
	WAVE_FORMAT_PROSODY_8KBPS           = 0x0094,
	WAVE_FORMAT_ZYXEL_ADPCM             = 0x0097,
	WAVE_FORMAT_PHILIPS_LPCBB           = 0x0098,
	WAVE_FORMAT_PACKED                  = 0x0099,
	WAVE_FORMAT_MALDEN_PHONYTALK        = 0x00A0,
	WAVE_FORMAT_RAW_AAC1                = 0x00FF,
	WAVE_FORMAT_RHETOREX_ADPCM          = 0x0100,
	WAVE_FORMAT_IRAT                    = 0x0101,
	WAVE_FORMAT_VIVO_G723               = 0x0111,
	WAVE_FORMAT_VIVO_SIREN              = 0x0112,
	WAVE_FORMAT_DIGITAL_G723            = 0x0123,
	WAVE_FORMAT_SANYO_LD_ADPCM          = 0x0125,
	WAVE_FORMAT_SIPROLAB_ACEPLNET       = 0x0130,
	WAVE_FORMAT_SIPROLAB_ACELP4800      = 0x0131,
	WAVE_FORMAT_SIPROLAB_ACELP8V3       = 0x0132,
	WAVE_FORMAT_SIPROLAB_G729           = 0x0133,
	WAVE_FORMAT_SIPROLAB_G729A          = 0x0134,
	WAVE_FORMAT_SIPROLAB_KELVIN         = 0x0135,
	WAVE_FORMAT_G726ADPCM               = 0x0140,
	WAVE_FORMAT_QUALCOMM_PUREVOICE      = 0x0150,
	WAVE_FORMAT_QUALCOMM_HALFRATE       = 0x0151,
	WAVE_FORMAT_TUBGSM                  = 0x0155,
	WAVE_FORMAT_MSAUDIO1                = 0x0160,
	WAVE_FORMAT_WMAUDIO2                = 0x0161,
	WAVE_FORMAT_WMAUDIO3                = 0x0162,
	WAVE_FORMAT_WMAUDIO_LOSSLESS        = 0x0163,
	WAVE_FORMAT_WMASPDIF                = 0x0164,
	WAVE_FORMAT_UNISYS_NAP_ADPCM        = 0x0170,
	WAVE_FORMAT_UNISYS_NAP_ULAW         = 0x0171,
	WAVE_FORMAT_UNISYS_NAP_ALAW         = 0x0172,
	WAVE_FORMAT_UNISYS_NAP_16K          = 0x0173,
	WAVE_FORMAT_CREATIVE_ADPCM          = 0x0200,
	WAVE_FORMAT_CREATIVE_FASTSPEECH8    = 0x0202,
	WAVE_FORMAT_CREATIVE_FASTSPEECH10   = 0x0203,
	WAVE_FORMAT_UHER_ADPCM              = 0x0210,
	WAVE_FORMAT_QUARTERDECK             = 0x0220,
	WAVE_FORMAT_ILINK_VC                = 0x0230,
	WAVE_FORMAT_RAW_SPORT               = 0x0240,
	WAVE_FORMAT_ESST_AC3                = 0x0241,
	WAVE_FORMAT_GENERIC_PASSTHRU        = 0x0249,
	WAVE_FORMAT_IPI_HSX                 = 0x0250,
	WAVE_FORMAT_IPI_RPELP               = 0x0251,
	WAVE_FORMAT_CS2                     = 0x0260,
	WAVE_FORMAT_SONY_SCX                = 0x0270,
	WAVE_FORMAT_FM_TOWNS_SND            = 0x0300,
	WAVE_FORMAT_BTV_DIGITAL             = 0x0400,
	WAVE_FORMAT_QDESIGN_MUSIC           = 0x0450,
	WAVE_FORMAT_VME_VMPCM               = 0x0680,
	WAVE_FORMAT_TPC                     = 0x0681,
	WAVE_FORMAT_OLIGSM                  = 0x1000,
	WAVE_FORMAT_OLIADPCM                = 0x1001,
	WAVE_FORMAT_OLICELP                 = 0x1002,
	WAVE_FORMAT_OLISBC                  = 0x1003,
	WAVE_FORMAT_OLIOPR                  = 0x1004,
	WAVE_FORMAT_LH_CODEC                = 0x1100,
	WAVE_FORMAT_NORRIS                  = 0x1400,
	WAVE_FORMAT_SOUNDSPACE_MUSICOMPRESS = 0x1500,
	WAVE_FORMAT_MPEG_ADTS_AAC           = 0x1600,
	WAVE_FORMAT_MPEG_RAW_AAC            = 0x1601,
	WAVE_FORMAT_MPEG_LOAS               = 0x1602,
	WAVE_FORMAT_NOKIA_MPEG_ADTS_AAC     = 0x1608,
	WAVE_FORMAT_NOKIA_MPEG_RAW_AAC      = 0x1609,
	WAVE_FORMAT_VODAFONE_MPEG_ADTS_AAC  = 0x160A,
	WAVE_FORMAT_VODAFONE_MPEG_RAW_AAC   = 0x160B,
	WAVE_FORMAT_MPEG_HEAAC              = 0x1610,
	WAVE_FORMAT_DVM                     = 0x2000,
	WAVE_FORMAT_DTS2                    = 0x2001,
	WAVE_FORMAT_EXTENSIBLE              = 0xFFFE,
	WAVE_FORMAT_DEVELOPMENT             = 0xFFFF,
}

/*
DEFINE_WAVEFORMATEX_GUID(x)
{
	(USHORT)(x), 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71
}

STATIC_KSDATAFORMAT_SUBTYPE_PCM DEFINE_WAVEFORMATEX_GUID(WAVE_FORMAT_PCM)
DEFINE_GUIDSTRUCT("00000001-0000-0010-8000-00aa00389b71", KSDATAFORMAT_SUBTYPE_PCM);
KSDATAFORMAT_SUBTYPE_PCM DEFINE_GUIDNAMED(KSDATAFORMAT_SUBTYPE_PCM)

STATIC_KSDATAFORMAT_SUBTYPE_IEEE_FLOAT DEFINE_WAVEFORMATEX_GUID(WAVE_FORMAT_IEEE_FLOAT)
DEFINE_GUIDSTRUCT("00000003-0000-0010-8000-00aa00389b71", KSDATAFORMAT_SUBTYPE_IEEE_FLOAT);
KSDATAFORMAT_SUBTYPE_IEEE_FLOAT DEFINE_GUIDNAMED(KSDATAFORMAT_SUBTYPE_IEEE_FLOAT)

STATIC_KSDATAFORMAT_SUBTYPE_WAVEFORMATEX 0x00000000L, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71
DEFINE_GUIDSTRUCT("00000000-0000-0010-8000-00aa00389b71", KSDATAFORMAT_SUBTYPE_WAVEFORMATEX);
KSDATAFORMAT_SUBTYPE_WAVEFORMATEX DEFINE_GUIDNAMED(KSDATAFORMAT_SUBTYPE_WAVEFORMATEX)

INIT_WAVEFORMATEX_GUID(Guid, x)
{
	 *(Guid) = KSDATAFORMAT_SUBTYPE_WAVEFORMATEX; (Guid)->Data1 = (USHORT)(x);
}

EXTRACT_WAVEFORMATEX_ID(Guid)
{
	 (USHORT)((Guid)->Data1)
}

IS_VALID_WAVEFORMATEX_GUID(Guid)
{
	(!memcmp(((PUSHORT)&KSDATAFORMAT_SUBTYPE_WAVEFORMATEX) + 1, ((PUSHORT)(Guid)) + 1, sizeof(GUID) - sizeof(USHORT)))
}
*/

struct WAVEFORMATEXTENSIBLE {
	WAVEFORMATEX Format;
	union {
		WORD wValidBitsPerSample;
		WORD wSamplesPerBlock;
		WORD wReserved;
	}
	DWORD dwChannelMask;
	GUID SubFormat;
}
alias WAVEFORMATEXTENSIBLE* PWAVEFORMATEXTENSIBLE;
alias WAVEFORMATEXTENSIBLE WAVEFORMATPCMEX;
alias WAVEFORMATPCMEX* PWAVEFORMATPCMEX;
alias WAVEFORMATPCMEX* NPWAVEFORMATPCMEX;
alias WAVEFORMATPCMEX* LPWAVEFORMATPCMEX;
alias WAVEFORMATEXTENSIBLE WAVEFORMATIEEEFLOATEX;
alias WAVEFORMATIEEEFLOATEX* PWAVEFORMATIEEEFLOATEX;
alias WAVEFORMATIEEEFLOATEX* NPWAVEFORMATIEEEFLOATEX;
alias WAVEFORMATIEEEFLOATEX* LPWAVEFORMATIEEEFLOATEX;

enum {
	SPEAKER_FRONT_LEFT            = 0x1,
	SPEAKER_FRONT_RIGHT           = 0x2,
	SPEAKER_FRONT_CENTER          = 0x4,
	SPEAKER_LOW_FREQUENCY         = 0x8,
	SPEAKER_BACK_LEFT             = 0x10,
	SPEAKER_BACK_RIGHT            = 0x20,
	SPEAKER_FRONT_LEFT_OF_CENTER  = 0x40,
	SPEAKER_FRONT_RIGHT_OF_CENTER = 0x80,
	SPEAKER_BACK_CENTER           = 0x100,
	SPEAKER_SIDE_LEFT             = 0x200,
	SPEAKER_SIDE_RIGHT            = 0x400,
	SPEAKER_TOP_CENTER            = 0x800,
	SPEAKER_TOP_FRONT_LEFT        = 0x1000,
	SPEAKER_TOP_FRONT_CENTER      = 0x2000,
	SPEAKER_TOP_FRONT_RIGHT       = 0x4000,
	SPEAKER_TOP_BACK_LEFT         = 0x8000,
	SPEAKER_TOP_BACK_CENTER       = 0x10000,
	SPEAKER_TOP_BACK_RIGHT        = 0x20000,
	SPEAKER_RESERVED              = 0x7FFC0000,
	SPEAKER_ALL                   = 0x80000000,
}


struct ADPCMCOEFSET {
	short iCoef1;
	short iCoef2;
}
alias ADPCMCOEFSET* PADPCMCOEFSET;
alias ADPCMCOEFSET* NPADPCMCOEFSET;
alias ADPCMCOEFSET* LPADPCMCOEFSET;

struct ADPCMWAVEFORMAT {
	WAVEFORMATEX wfx;
	WORD wSamplesPerBlock;
	WORD wNumCoef;
	ADPCMCOEFSET[1] aCoef;
}
alias ADPCMWAVEFORMAT* PADPCMWAVEFORMAT;
alias ADPCMWAVEFORMAT* NPADPCMWAVEFORMAT;
alias ADPCMWAVEFORMAT* LPADPCMWAVEFORMAT;

struct DRMWAVEFORMAT {
	WAVEFORMATEX wfx;
	WORD wReserved;
	ULONG ulContentId;
	WAVEFORMATEX wfxSecure;
}
alias DRMWAVEFORMAT* PDRMWAVEFORMAT;
alias DRMWAVEFORMAT* NPDRMWAVEFORMAT;
alias DRMWAVEFORMAT* LPDRMWAVEFORMAT;

struct DVIADPCMWAVEFORMAT {
	WAVEFORMATEX wfx;
	WORD wSamplesPerBlock;
}
alias DVIADPCMWAVEFORMAT* PDVIADPCMWAVEFORMAT;
alias DVIADPCMWAVEFORMAT* NPDVIADPCMWAVEFORMAT;
alias DVIADPCMWAVEFORMAT* LPDVIADPCMWAVEFORMAT;

struct IMAADPCMWAVEFORMAT {
	WAVEFORMATEX wfx;
	WORD wSamplesPerBlock;
}
alias IMAADPCMWAVEFORMAT* PIMAADPCMWAVEFORMAT;
alias IMAADPCMWAVEFORMAT* NPIMAADPCMWAVEFORMAT;
alias IMAADPCMWAVEFORMAT* LPIMAADPCMWAVEFORMAT;

struct MEDIASPACEADPCMWAVEFORMAT {
	WAVEFORMATEX wfx;
	WORD wRevision;
}
alias MEDIASPACEADPCMWAVEFORMAT* PMEDIASPACEADPCMWAVEFORMAT;
alias MEDIASPACEADPCMWAVEFORMAT* NPMEDIASPACEADPCMWAVEFORMAT;
alias MEDIASPACEADPCMWAVEFORMAT* LPMEDIASPACEADPCMWAVEFORMAT;

struct SIERRAADPCMWAVEFORMAT {
	WAVEFORMATEX wfx;
	WORD wRevision;
}
alias SIERRAADPCMWAVEFORMAT* PSIERRAADPCMWAVEFORMAT;
alias SIERRAADPCMWAVEFORMAT* NPSIERRAADPCMWAVEFORMAT;
alias SIERRAADPCMWAVEFORMAT* LPSIERRAADPCMWAVEFORMAT;

struct G723_ADPCMWAVEFORMAT {
	WAVEFORMATEX wfx;
	WORD cbExtraSize;
	WORD nAuxBlockSize;
}
alias G723_ADPCMWAVEFORMAT* PG723_ADPCMWAVEFORMAT;
alias G723_ADPCMWAVEFORMAT* NPG723_ADPCMWAVEFORMAT;
alias G723_ADPCMWAVEFORMAT* LPG723_ADPCMWAVEFORMAT;

struct DIGISTDWAVEFORMAT {
	WAVEFORMATEX wfx;
}
alias DIGISTDWAVEFORMAT* PDIGISTDWAVEFORMAT;
alias DIGISTDWAVEFORMAT* NPDIGISTDWAVEFORMAT;
alias DIGISTDWAVEFORMAT* LPDIGISTDWAVEFORMAT;

struct DIGIFIXWAVEFORMAT {
	WAVEFORMATEX wfx;
}
alias DIGIFIXWAVEFORMAT* PDIGIFIXWAVEFORMAT;
alias DIGIFIXWAVEFORMAT* NPDIGIFIXWAVEFORMAT;
alias DIGIFIXWAVEFORMAT* LPDIGIFIXWAVEFORMAT;

struct DIALOGICOKIADPCMWAVEFORMAT {
	WAVEFORMATEX ewf;
}
alias DIALOGICOKIADPCMWAVEFORMAT* PDIALOGICOKIADPCMWAVEFORMAT;
alias DIALOGICOKIADPCMWAVEFORMAT* NPDIALOGICOKIADPCMWAVEFORMAT;
alias DIALOGICOKIADPCMWAVEFORMAT* LPDIALOGICOKIADPCMWAVEFORMAT;

struct YAMAHA_ADPCMWAVEFORMAT {
	WAVEFORMATEX wfx;
}
alias YAMAHA_ADPCMWAVEFORMAT* PYAMAHA_ADPCMWAVEFORMAT;
alias YAMAHA_ADPCMWAVEFORMAT* NPYAMAHA_ADPCMWAVEFORMAT;
alias YAMAHA_ADPCMWAVEFORMAT* LPYAMAHA_ADPCMWAVEFORMAT;

struct SONARCWAVEFORMAT {
	WAVEFORMATEX wfx;
	WORD wCompType;
}
alias SONARCWAVEFORMAT* PSONARCWAVEFORMAT;
alias SONARCWAVEFORMAT* NPSONARCWAVEFORMAT;
alias SONARCWAVEFORMAT* LPSONARCWAVEFORMAT;

struct TRUESPEECHWAVEFORMAT {
	WAVEFORMATEX wfx;
	WORD wRevision;
	WORD nSamplesPerBlock;
	BYTE[28] abReserved;
}
alias TRUESPEECHWAVEFORMAT* PTRUESPEECHWAVEFORMAT;
alias TRUESPEECHWAVEFORMAT* NPTRUESPEECHWAVEFORMAT;
alias TRUESPEECHWAVEFORMAT* LPTRUESPEECHWAVEFORMAT;

struct ECHOSC1WAVEFORMAT {
	WAVEFORMATEX wfx;
}
alias ECHOSC1WAVEFORMAT* PECHOSC1WAVEFORMAT;
alias ECHOSC1WAVEFORMAT* NPECHOSC1WAVEFORMAT;
alias ECHOSC1WAVEFORMAT* LPECHOSC1WAVEFORMAT;

struct AUDIOFILE_AF36WAVEFORMAT {
	WAVEFORMATEX wfx;
}
alias AUDIOFILE_AF36WAVEFORMAT* PAUDIOFILE_AF36WAVEFORMAT;
alias AUDIOFILE_AF36WAVEFORMAT* NPAUDIOFILE_AF36WAVEFORMAT;
alias AUDIOFILE_AF36WAVEFORMAT* LPAUDIOFILE_AF36WAVEFORMAT;

struct APTXWAVEFORMAT {
	WAVEFORMATEX wfx;
} 
alias APTXWAVEFORMAT* PAPTXWAVEFORMAT;
alias APTXWAVEFORMAT* NPAPTXWAVEFORMAT;
alias APTXWAVEFORMAT* LPAPTXWAVEFORMAT;

struct AUDIOFILE_AF10WAVEFORMAT {
	WAVEFORMATEX wfx;
}
alias AUDIOFILE_AF10WAVEFORMAT* PAUDIOFILE_AF10WAVEFORMAT;
alias AUDIOFILE_AF10WAVEFORMAT* NPAUDIOFILE_AF10WAVEFORMAT;
alias AUDIOFILE_AF10WAVEFORMAT* LPAUDIOFILE_AF10WAVEFORMAT;

struct DOLBYAC2WAVEFORMAT {
	WAVEFORMATEX wfx;
	WORD nAuxBitsCode;
}

struct GSM610WAVEFORMAT {
	WAVEFORMATEX wfx;
	WORD wSamplesPerBlock;
}
alias GSM610WAVEFORMAT* PGSM610WAVEFORMAT;
alias GSM610WAVEFORMAT* NPGSM610WAVEFORMAT;
alias GSM610WAVEFORMAT* LPGSM610WAVEFORMAT;

struct ADPCMEWAVEFORMAT {
	WAVEFORMATEX wfx;
	WORD wSamplesPerBlock;
}
alias ADPCMEWAVEFORMAT* PADPCMEWAVEFORMAT;
alias ADPCMEWAVEFORMAT* NPADPCMEWAVEFORMAT;
alias ADPCMEWAVEFORMAT* LPADPCMEWAVEFORMAT;

struct CONTRESVQLPCWAVEFORMAT {
	WAVEFORMATEX wfx;
	WORD wSamplesPerBlock;
}
alias CONTRESVQLPCWAVEFORMAT* PCONTRESVQLPCWAVEFORMAT;
alias CONTRESVQLPCWAVEFORMAT* NPCONTRESVQLPCWAVEFORMAT;
alias CONTRESVQLPCWAVEFORMAT* LPCONTRESVQLPCWAVEFORMAT;

struct DIGIREALWAVEFORMAT {
	WAVEFORMATEX wfx;
	WORD wSamplesPerBlock;
}
alias DIGIREALWAVEFORMAT* PDIGIREALWAVEFORMAT;
alias DIGIREALWAVEFORMAT* NPDIGIREALWAVEFORMAT;
alias DIGIREALWAVEFORMAT* LPDIGIREALWAVEFORMAT;

struct DIGIADPCMWAVEFORMAT {
	WAVEFORMATEX wfx;
	WORD wSamplesPerBlock;
}
alias DIGIADPCMWAVEFORMAT* PDIGIADPCMWAVEFORMAT;
alias DIGIADPCMWAVEFORMAT* NPDIGIADPCMWAVEFORMAT;
alias DIGIADPCMWAVEFORMAT* LPDIGIADPCMWAVEFORMAT;

struct CONTRESCR10WAVEFORMAT {
	WAVEFORMATEX wfx;
	WORD wSamplesPerBlock;
}
alias CONTRESCR10WAVEFORMAT* PCONTRESCR10WAVEFORMAT;
alias CONTRESCR10WAVEFORMAT* NPCONTRESCR10WAVEFORMAT;
alias CONTRESCR10WAVEFORMAT* LPCONTRESCR10WAVEFORMAT;

struct NMS_VBXADPCMWAVEFORMAT {
	WAVEFORMATEX wfx;
	WORD wSamplesPerBlock;
}
alias NMS_VBXADPCMWAVEFORMAT* PNMS_VBXADPCMWAVEFORMAT;
alias NMS_VBXADPCMWAVEFORMAT* NPNMS_VBXADPCMWAVEFORMAT;
alias NMS_VBXADPCMWAVEFORMAT* LPNMS_VBXADPCMWAVEFORMAT;

struct G721_ADPCMWAVEFORMAT {
	WAVEFORMATEX wfx;
	WORD nAuxBlockSize;
}
alias G721_ADPCMWAVEFORMAT* PG721_ADPCMWAVEFORMAT;
alias G721_ADPCMWAVEFORMAT* NPG721_ADPCMWAVEFORMAT;
alias G721_ADPCMWAVEFORMAT* LPG721_ADPCMWAVEFORMAT;

struct MPEG1WAVEFORMAT {
	WAVEFORMATEX wfx;
	WORD fwHeadLayer;
	DWORD dwHeadBitrate;
	WORD fwHeadMode;
	WORD fwHeadModeExt;
	WORD wHeadEmphasis;
	WORD fwHeadFlags;
	DWORD dwPTSLow;
	DWORD dwPTSHigh;
}
alias MPEG1WAVEFORMAT* PMPEG1WAVEFORMAT;
alias MPEG1WAVEFORMAT* NPMPEG1WAVEFORMAT;
alias MPEG1WAVEFORMAT* LPMPEG1WAVEFORMAT;

enum {
	ACM_MPEG_LAYER1        = 0x0001,
	ACM_MPEG_LAYER2        = 0x0002,
	ACM_MPEG_LAYER3        = 0x0004,
	ACM_MPEG_STEREO        = 0x0001,
	ACM_MPEG_JOINTSTEREO   = 0x0002,
	ACM_MPEG_DUALCHANNEL   = 0x0004,
	ACM_MPEG_SINGLECHANNEL = 0x0008,
	ACM_MPEG_PRIVATEBIT    = 0x0001,
	ACM_MPEG_COPYRIGHT     = 0x0002,
	ACM_MPEG_ORIGINALHOME  = 0x0004,
	ACM_MPEG_PROTECTIONBIT = 0x0008,
	ACM_MPEG_ID_MPEG1      = 0x0010,
}

enum MPEGLAYER3_WFX_EXTRA_BYTES = 12;

struct MPEGLAYER3WAVEFORMAT {
	WAVEFORMATEX wfx;
	WORD wID;
	DWORD fdwFlags;
	WORD nBlockSize;
	WORD nFramesPerBlock;
	WORD nCodecDelay;
}
alias MPEGLAYER3WAVEFORMAT* PMPEGLAYER3WAVEFORMAT;
alias MPEGLAYER3WAVEFORMAT* NPMPEGLAYER3WAVEFORMAT;
alias MPEGLAYER3WAVEFORMAT* LPMPEGLAYER3WAVEFORMAT;

enum {
	MPEGLAYER3_ID_UNKNOWN           = 0,
	MPEGLAYER3_ID_MPEG              = 1,
	MPEGLAYER3_ID_CONSTANTFRAMESIZE = 2,
}

enum {
	MPEGLAYER3_FLAG_PADDING_ISO = 0x00000000,
	MPEGLAYER3_FLAG_PADDING_ON  = 0x00000001,
	MPEGLAYER3_FLAG_PADDING_OFF = 0x00000002,
}

struct HEAACWAVEINFO {
	WAVEFORMATEX wfx;
	WORD wPayloadType;
	WORD wAudioProfileLevelIndication;
	WORD wStructType;
	WORD wReserved1;
	DWORD dwReserved2;
}
alias HEAACWAVEINFO* PHEAACWAVEINFO;
alias HEAACWAVEINFO* NPHEAACWAVEINFO;
alias HEAACWAVEINFO* LPHEAACWAVEINFO;

struct HEAACWAVEFORMAT {
	HEAACWAVEINFO wfInfo;
	BYTE[1] pbAudioSpecificConfig;
}
alias HEAACWAVEFORMAT* PHEAACWAVEFORMAT;
alias HEAACWAVEFORMAT* NPHEAACWAVEFORMAT;
alias HEAACWAVEFORMAT* LPHEAACWAVEFORMAT;

enum {
	MM_MSFT_ACM_WMAUDIO     = 39,
	WMAUDIO_BITS_PER_SAMPLE = 16,
	WMAUDIO_MAX_CHANNELS    = 2,
	MM_MSFT_ACM_MSAUDIO1    = 39,
}

struct MSAUDIO1WAVEFORMAT {
	WAVEFORMATEX wfx;
	WORD wSamplesPerBlock;
	WORD wEncodeOptions;
}
alias MSAUDIO1WAVEFORMAT* LPMSAUDIO1WAVEFORMAT;

enum {
	MSAUDIO1_BITS_PER_SAMPLE = WMAUDIO_BITS_PER_SAMPLE,
	MSAUDIO1_MAX_CHANNELS    = WMAUDIO_MAX_CHANNELS,
	MSAUDIO1_WFX_EXTRA_BYTES = MSAUDIO1WAVEFORMAT.sizeof - WAVEFORMATEX.sizeof,
}

enum MM_MSFT_ACM_WMAUDIO2 = 101;

struct WMAUDIO2WAVEFORMAT {
	WAVEFORMATEX wfx;
	DWORD dwSamplesPerBlock;
	WORD wEncodeOptions;
	DWORD dwSuperBlockAlign;
}
alias WMAUDIO2WAVEFORMAT* LPWMAUDIO2WAVEFORMAT;

enum {
	WMAUDIO2_BITS_PER_SAMPLE = WMAUDIO_BITS_PER_SAMPLE,
	WMAUDIO2_MAX_CHANNELS    = WMAUDIO_MAX_CHANNELS,
	WMAUDIO2_WFX_EXTRA_BYTES = WMAUDIO2WAVEFORMAT.sizeof - WAVEFORMATEX.sizeof,
}

struct WMAUDIO3WAVEFORMAT {
	WAVEFORMATEX wfx;
	WORD wValidBitsPerSample;
	DWORD dwChannelMask;
	DWORD dwReserved1;
	DWORD dwReserved2;
	WORD wEncodeOptions;
	WORD wReserved3;
}
alias WMAUDIO3WAVEFORMAT* LPWMAUDIO3WAVEFORMAT;

enum WMAUDIO3_WFX_EXTRA_BYTES = WMAUDIO3WAVEFORMAT.sizeof - WAVEFORMATEX.sizeof;

struct CREATIVEADPCMWAVEFORMAT {
	WAVEFORMATEX wfx;
	WORD wRevision;
}
alias CREATIVEADPCMWAVEFORMAT* PCREATIVEADPCMWAVEFORMAT;
alias CREATIVEADPCMWAVEFORMAT* NPCREATIVEADPCMWAVEFORMAT;
alias CREATIVEADPCMWAVEFORMAT* LPCREATIVEADPCMWAVEFORMAT;

struct CREATIVEFASTSPEECH8WAVEFORMAT {
	WAVEFORMATEX wfx;
	WORD wRevision;
}
alias CREATIVEFASTSPEECH8WAVEFORMAT* PCREATIVEFASTSPEECH8WAVEFORMAT;
alias CREATIVEFASTSPEECH8WAVEFORMAT* NPCREATIVEFASTSPEECH8WAVEFORMAT;
alias CREATIVEFASTSPEECH8WAVEFORMAT* LPCREATIVEFASTSPEECH8WAVEFORMAT;

struct CREATIVEFASTSPEECH10WAVEFORMAT {
	WAVEFORMATEX wfx;
	WORD wRevision;
}
alias CREATIVEFASTSPEECH10WAVEFORMAT* PCREATIVEFASTSPEECH10WAVEFORMAT;
alias CREATIVEFASTSPEECH10WAVEFORMAT* NPCREATIVEFASTSPEECH10WAVEFORMAT;
alias CREATIVEFASTSPEECH10WAVEFORMAT* LPCREATIVEFASTSPEECH10WAVEFORMAT;

struct FMTOWNS_SND_WAVEFORMAT {
	WAVEFORMATEX wfx;
	WORD wRevision;
}
alias FMTOWNS_SND_WAVEFORMAT* PFMTOWNS_SND_WAVEFORMAT;
alias FMTOWNS_SND_WAVEFORMAT* NPFMTOWNS_SND_WAVEFORMAT;
alias FMTOWNS_SND_WAVEFORMAT* LPFMTOWNS_SND_WAVEFORMAT;

struct OLIGSMWAVEFORMAT {
	WAVEFORMATEX wfx;
}
alias OLIGSMWAVEFORMAT* POLIGSMWAVEFORMAT;
alias OLIGSMWAVEFORMAT* NPOLIGSMWAVEFORMAT;
alias OLIGSMWAVEFORMAT* LPOLIGSMWAVEFORMAT;

struct OLIADPCMWAVEFORMAT {
	WAVEFORMATEX wfx;
}
alias OLIADPCMWAVEFORMAT* POLIADPCMWAVEFORMAT;
alias OLIADPCMWAVEFORMAT* NPOLIADPCMWAVEFORMAT ;
alias OLIADPCMWAVEFORMAT* LPOLIADPCMWAVEFORMAT;

struct OLICELPWAVEFORMAT {
	WAVEFORMATEX wfx;
}
alias OLICELPWAVEFORMAT* POLICELPWAVEFORMAT;
alias OLICELPWAVEFORMAT* NPOLICELPWAVEFORMAT ;
alias OLICELPWAVEFORMAT* LPOLICELPWAVEFORMAT;

struct OLISBCWAVEFORMAT {
	WAVEFORMATEX wfx;
}
alias OLISBCWAVEFORMAT* POLISBCWAVEFORMAT;
alias OLISBCWAVEFORMAT* NPOLISBCWAVEFORMAT ;
alias OLISBCWAVEFORMAT* LPOLISBCWAVEFORMAT;

struct OLIOPRWAVEFORMAT {
	WAVEFORMATEX wfx;
}
alias OLIOPRWAVEFORMAT* POLIOPRWAVEFORMAT;
alias OLIOPRWAVEFORMAT* NPOLIOPRWAVEFORMAT ;
alias OLIOPRWAVEFORMAT* LPOLIOPRWAVEFORMAT;

struct CSIMAADPCMWAVEFORMAT {
	WAVEFORMATEX wfx;
}
alias CSIMAADPCMWAVEFORMAT* PCSIMAADPCMWAVEFORMAT;
alias CSIMAADPCMWAVEFORMAT* NPCSIMAADPCMWAVEFORMAT;
alias CSIMAADPCMWAVEFORMAT* LPCSIMAADPCMWAVEFORMAT;

enum {
	WAVE_FILTER_UNKNOWN     = 0x0000,
	WAVE_FILTER_DEVELOPMENT = 0xFFFF,
}

struct WAVEFILTER {
	DWORD cbStruct;
	DWORD dwFilterTag;
	DWORD fdwFilter;
	DWORD[5] dwReserved;
}
alias WAVEFILTER* PWAVEFILTER;
alias WAVEFILTER* NPWAVEFILTER;
alias WAVEFILTER* LPWAVEFILTER;

enum WAVE_FILTER_VOLUME = 0x0001;

struct VOLUMEWAVEFILTER {
	WAVEFILTER wfltr;
	DWORD dwVolume;
}
alias VOLUMEWAVEFILTER* PVOLUMEWAVEFILTER;
alias VOLUMEWAVEFILTER* NPVOLUMEWAVEFILTER;
alias VOLUMEWAVEFILTER* LPVOLUMEWAVEFILTER;

enum WAVE_FILTER_ECHO = 0x0002;

struct ECHOWAVEFILTER {
	WAVEFILTER wfltr;
	DWORD dwVolume;
	DWORD dwDelay;
}
alias ECHOWAVEFILTER* PECHOWAVEFILTER;
alias ECHOWAVEFILTER* NPECHOWAVEFILTER;
alias ECHOWAVEFILTER* LPECHOWAVEFILTER;

enum RIFFWAVE_inst = mmioFOURCC('i','n','s','t');

struct s_RIFFWAVE_inst {
	BYTE bUnshiftedNote;
	char chFineTune;
	char chGain;
	BYTE bLowNote;
	BYTE bHighNote;
	BYTE bLowVelocity;
	BYTE bHighVelocity;
}

enum {
	RIFFCPPO      = mmioFOURCC('C','P','P','O'),
	RIFFCPPO_objr = mmioFOURCC('o','b','j','r'),
	RIFFCPPO_obji = mmioFOURCC('o','b','j','i'),
	RIFFCPPO_clsr = mmioFOURCC('c','l','s','r'),
	RIFFCPPO_clsi = mmioFOURCC('c','l','s','i'),
	RIFFCPPO_mbr  = mmioFOURCC('m','b','r',' '),
	RIFFCPPO_char = mmioFOURCC('c','h','a','r'),
	RIFFCPPO_byte = mmioFOURCC('b','y','t','e'),
	RIFFCPPO_int  = mmioFOURCC('i','n','t',' '),
	RIFFCPPO_word = mmioFOURCC('w','o','r','d'),
	RIFFCPPO_long = mmioFOURCC('l','o','n','g'),
	RIFFCPPO_dwrd = mmioFOURCC('d','w','r','d'),
	RIFFCPPO_flt  = mmioFOURCC('f','l','t',' '),
	RIFFCPPO_dbl  = mmioFOURCC('d','b','l',' '),
	RIFFCPPO_str  = mmioFOURCC('s','t','r',' '),
}

struct EXBMINFOHEADER {
	BITMAPINFOHEADER bmi;
	DWORD biExtDataOffset;
}

enum {
	BICOMP_IBMULTIMOTION  = mmioFOURCC('U', 'L', 'T', 'I'),
	BICOMP_IBMPHOTOMOTION = mmioFOURCC('P', 'H', 'M', 'O'),
	BICOMP_CREATIVEYUV    = mmioFOURCC('c', 'y', 'u', 'v'),
}

enum {
	JPEG_DIB = mmioFOURCC('J','P','E','G'),
	MJPG_DIB = mmioFOURCC('M','J','P','G'),
}

enum JPEG_PROCESS_BASELINE = 0;

enum AVIIF_CONTROLFRAME = 0x00000200;

enum {
	JIFMK_SOF0  = 0xFFC0,
	JIFMK_SOF1  = 0xFFC1,
	JIFMK_SOF2  = 0xFFC2,
	JIFMK_SOF3  = 0xFFC3,
	JIFMK_SOF5  = 0xFFC5,
	JIFMK_SOF6  = 0xFFC6,
	JIFMK_SOF7  = 0xFFC7,
	JIFMK_JPG   = 0xFFC8,
	JIFMK_SOF9  = 0xFFC9,
	JIFMK_SOF10 = 0xFFCA,
	JIFMK_SOF11 = 0xFFCB,
	JIFMK_SOF13 = 0xFFCD,
	JIFMK_SOF14 = 0xFFCE,
	JIFMK_SOF15 = 0xFFCF,
	JIFMK_DHT   = 0xFFC4,
	JIFMK_DAC   = 0xFFCC,
	JIFMK_RST0  = 0xFFD0,
	JIFMK_RST1  = 0xFFD1,
	JIFMK_RST2  = 0xFFD2,
	JIFMK_RST3  = 0xFFD3,
	JIFMK_RST4  = 0xFFD4,
	JIFMK_RST5  = 0xFFD5,
	JIFMK_RST6  = 0xFFD6,
	JIFMK_RST7  = 0xFFD7,
	JIFMK_SOI   = 0xFFD8,
	JIFMK_EOI   = 0xFFD9,
	JIFMK_SOS   = 0xFFDA,
	JIFMK_DQT   = 0xFFDB,
	JIFMK_DNL   = 0xFFDC,
	JIFMK_DRI   = 0xFFDD,
	JIFMK_DHP   = 0xFFDE,
	JIFMK_EXP   = 0xFFDF,
	JIFMK_APP0  = 0xFFE0,
	JIFMK_APP1  = 0xFFE1,
	JIFMK_APP2  = 0xFFE2,
	JIFMK_APP3  = 0xFFE3,
	JIFMK_APP4  = 0xFFE4,
	JIFMK_APP5  = 0xFFE5,
	JIFMK_APP6  = 0xFFE6,
	JIFMK_APP7  = 0xFFE7,
	JIFMK_JPG0  = 0xFFF0,
	JIFMK_JPG1  = 0xFFF1,
	JIFMK_JPG2  = 0xFFF2,
	JIFMK_JPG3  = 0xFFF3,
	JIFMK_JPG4  = 0xFFF4,
	JIFMK_JPG5  = 0xFFF5,
	JIFMK_JPG6  = 0xFFF6,
	JIFMK_JPG7  = 0xFFF7,
	JIFMK_JPG8  = 0xFFF8,
	JIFMK_JPG9  = 0xFFF9,
	JIFMK_JPG10 = 0xFFFA,
	JIFMK_JPG11 = 0xFFFB,
	JIFMK_JPG12 = 0xFFFC,
	JIFMK_JPG13 = 0xFFFD,
	JIFMK_COM   = 0xFFFE,
	JIFMK_TEM   = 0xFF01,
	JIFMK_RES   = 0xFF02,
	JIFMK_00    = 0xFF00,
	JIFMK_FF    = 0xFFFF,
}

enum {
	JPEG_Y     = 1,
	JPEG_YCbCr = 2,
	JPEG_RGB   = 3,
}

struct JPEGINFOHEADER {
	DWORD JPEGSize;
	DWORD JPEGProcess;
	DWORD JPEGColorSpaceID;
	DWORD JPEGBitsPerSample;
	DWORD JPEGHSubSampling;
	DWORD JPEGVSubSampling;
}


const BYTE MJPGDHTSeg[0x1A4] = [
0xFF,0xC4,0x01,0xA2,
0x00,0x00,0x01,0x05,0x01,0x01,0x01,0x01,0x01,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08,0x09,0x0A,0x0B,0x01,0x00,0x03,0x01,0x01,0x01,0x01,
0x01,0x01,0x01,0x01,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x02,0x03,0x04,0x05,0x06,0x07,
0x08,0x09,0x0A,0x0B,0x10,0x00,0x02,0x01,0x03,0x03,0x02,0x04,0x03,0x05,0x05,0x04,0x04,0x00,
0x00,0x01,0x7D,0x01,0x02,0x03,0x00,0x04,0x11,0x05,0x12,0x21,0x31,0x41,0x06,0x13,0x51,0x61,
0x07,0x22,0x71,0x14,0x32,0x81,0x91,0xA1,0x08,0x23,0x42,0xB1,0xC1,0x15,0x52,0xD1,0xF0,0x24,
0x33,0x62,0x72,0x82,0x09,0x0A,0x16,0x17,0x18,0x19,0x1A,0x25,0x26,0x27,0x28,0x29,0x2A,0x34,
0x35,0x36,0x37,0x38,0x39,0x3A,0x43,0x44,0x45,0x46,0x47,0x48,0x49,0x4A,0x53,0x54,0x55,0x56,
0x57,0x58,0x59,0x5A,0x63,0x64,0x65,0x66,0x67,0x68,0x69,0x6A,0x73,0x74,0x75,0x76,0x77,0x78,
0x79,0x7A,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,
0x9A,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,0xB9,
0xBA,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,0xD9,
0xDA,0xE1,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xF1,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,
0xF8,0xF9,0xFA,0x11,0x00,0x02,0x01,0x02,0x04,0x04,0x03,0x04,0x07,0x05,0x04,0x04,0x00,0x01,
0x02,0x77,0x00,0x01,0x02,0x03,0x11,0x04,0x05,0x21,0x31,0x06,0x12,0x41,0x51,0x07,0x61,0x71,
0x13,0x22,0x32,0x81,0x08,0x14,0x42,0x91,0xA1,0xB1,0xC1,0x09,0x23,0x33,0x52,0xF0,0x15,0x62,
0x72,0xD1,0x0A,0x16,0x24,0x34,0xE1,0x25,0xF1,0x17,0x18,0x19,0x1A,0x26,0x27,0x28,0x29,0x2A,
0x35,0x36,0x37,0x38,0x39,0x3A,0x43,0x44,0x45,0x46,0x47,0x48,0x49,0x4A,0x53,0x54,0x55,0x56,
0x57,0x58,0x59,0x5A,0x63,0x64,0x65,0x66,0x67,0x68,0x69,0x6A,0x73,0x74,0x75,0x76,0x77,0x78,
0x79,0x7A,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x92,0x93,0x94,0x95,0x96,0x97,0x98,
0x99,0x9A,0xA2,0xA3,0xA4,0xA5,0xA6,0xA7,0xA8,0xA9,0xAA,0xB2,0xB3,0xB4,0xB5,0xB6,0xB7,0xB8,
0xB9,0xBA,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xD2,0xD3,0xD4,0xD5,0xD6,0xD7,0xD8,
0xD9,0xDA,0xE2,0xE3,0xE4,0xE5,0xE6,0xE7,0xE8,0xE9,0xEA,0xF2,0xF3,0xF4,0xF5,0xF6,0xF7,0xF8,
0xF9,0xFA
];

enum {
	ICTYPE_VIDEO = mmioFOURCC('v', 'i', 'd', 'c'),
	ICTYPE_AUDIO = mmioFOURCC('a', 'u', 'd', 'c'),
}

enum FOURCC_RDSP = mmioFOURCC('R', 'D', 'S', 'P');

enum {
	MIXERCONTROL_CONTROLTYPE_SRS_MTS         = MIXERCONTROL_CONTROLTYPE_BOOLEAN + 6,
	MIXERCONTROL_CONTROLTYPE_SRS_ONOFF       = MIXERCONTROL_CONTROLTYPE_BOOLEAN + 7,
	MIXERCONTROL_CONTROLTYPE_SRS_SYNTHSELECT = MIXERCONTROL_CONTROLTYPE_BOOLEAN + 8,
}

}// extern(C)
}// align(1)
