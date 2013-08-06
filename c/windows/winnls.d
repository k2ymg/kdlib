/** winnls.d

Converted from 'winnls.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.winnls;


import c.windows.sdkddkver;
import c.windows.windef;
import c.windows.winbase;
import c.windows.guiddef;


extern(C){

enum {
	MAX_LEADBYTES   = 12,
	MAX_DEFAULTCHAR = 2,
}

enum {
	HIGH_SURROGATE_START = 0xd800,
	HIGH_SURROGATE_END   = 0xdbff,
	LOW_SURROGATE_START  = 0xdc00,
	LOW_SURROGATE_END    = 0xdfff,
}

enum {
	MB_PRECOMPOSED       = 0x00000001,
	MB_COMPOSITE         = 0x00000002,
	MB_USEGLYPHCHARS     = 0x00000004,
	MB_ERR_INVALID_CHARS = 0x00000008,
	WC_COMPOSITECHECK    = 0x00000200,
	WC_DISCARDNS         = 0x00000010,
	WC_SEPCHARS          = 0x00000020,
	WC_DEFAULTCHAR       = 0x00000040,
	//(WINVER >= _WIN32_WINNT_VISTA)
		WC_ERR_INVALID_CHARS = 0x00000080,
	WC_NO_BEST_FIT_CHARS = 0x00000400,
}

enum {
	CT_CTYPE1 = 0x00000001,
	CT_CTYPE2 = 0x00000002,
	CT_CTYPE3 = 0x00000004,
}

enum {
	C1_UPPER            = 0x0001,
	C1_LOWER            = 0x0002,
	C1_DIGIT            = 0x0004,
	C1_SPACE            = 0x0008,
	C1_PUNCT            = 0x0010,
	C1_CNTRL            = 0x0020,
	C1_BLANK            = 0x0040,
	C1_XDIGIT           = 0x0080,
	C1_ALPHA            = 0x0100,
	C1_DEFINED          = 0x0200,
	C2_LEFTTORIGHT      = 0x0001,
	C2_RIGHTTOLEFT      = 0x0002,
	C2_EUROPENUMBER     = 0x0003,
	C2_EUROPESEPARATOR  = 0x0004,
	C2_EUROPETERMINATOR = 0x0005,
	C2_ARABICNUMBER     = 0x0006,
	C2_COMMONSEPARATOR  = 0x0007,
	C2_BLOCKSEPARATOR   = 0x0008,
	C2_SEGMENTSEPARATOR = 0x0009,
	C2_WHITESPACE       = 0x000A,
	C2_OTHERNEUTRAL     = 0x000B,
	C2_NOTAPPLICABLE    = 0x0000,
	C3_NONSPACING       = 0x0001,
	C3_DIACRITIC        = 0x0002,
	C3_VOWELMARK        = 0x0004,
	C3_SYMBOL           = 0x0008,
	C3_KATAKANA         = 0x0010,
	C3_HIRAGANA         = 0x0020,
	C3_HALFWIDTH        = 0x0040,
	C3_FULLWIDTH        = 0x0080,
	C3_IDEOGRAPH        = 0x0100,
	C3_KASHIDA          = 0x0200,
	C3_LEXICAL          = 0x0400,
	C3_HIGHSURROGATE    = 0x0800,
	C3_LOWSURROGATE     = 0x1000,
	C3_ALPHA            = 0x8000,
	C3_NOTAPPLICABLE    = 0x0000,
}

enum {
	NORM_IGNORECASE            = 0x00000001,
	NORM_IGNORENONSPACE        = 0x00000002,
	NORM_IGNORESYMBOLS         = 0x00000004,
	LINGUISTIC_IGNORECASE      = 0x00000010,
	LINGUISTIC_IGNOREDIACRITIC = 0x00000020,
	NORM_IGNOREKANATYPE        = 0x00010000,
	NORM_IGNOREWIDTH           = 0x00020000,
	NORM_LINGUISTIC_CASING     = 0x08000000,
	MAP_FOLDCZONE              = 0x00000010,
	MAP_PRECOMPOSED            = 0x00000020,
	MAP_COMPOSITE              = 0x00000040,
	MAP_FOLDDIGITS             = 0x00000080,
	MAP_EXPAND_LIGATURES       = 0x00002000,
	LCMAP_LOWERCASE            = 0x00000100,
	LCMAP_UPPERCASE            = 0x00000200,
	//(WINVER >= _WIN32_WINNT_WIN7)
		LCMAP_TITLECASE = 0x00000300,
	LCMAP_SORTKEY              = 0x00000400,
	LCMAP_BYTEREV              = 0x00000800,
	LCMAP_HIRAGANA             = 0x00100000,
	LCMAP_KATAKANA             = 0x00200000,
	LCMAP_HALFWIDTH            = 0x00400000,
	LCMAP_FULLWIDTH            = 0x00800000,
	LCMAP_LINGUISTIC_CASING    = 0x01000000,
	LCMAP_SIMPLIFIED_CHINESE   = 0x02000000,
	LCMAP_TRADITIONAL_CHINESE  = 0x04000000,
	FIND_STARTSWITH            = 0x00100000,
	FIND_ENDSWITH              = 0x00200000,
	FIND_FROMSTART             = 0x00400000,
	FIND_FROMEND               = 0x00800000,
	LGRPID_INSTALLED           = 0x00000001,
	LGRPID_SUPPORTED           = 0x00000002,
	LCID_INSTALLED             = 0x00000001,
	LCID_SUPPORTED             = 0x00000002,
	LCID_ALTERNATE_SORTS       = 0x00000004,
}

//(WINVER >= _WIN32_WINNT_VISTA)
	enum {
		LOCALE_ALL             = 0,
		LOCALE_WINDOWS         = 0x00000001,
		LOCALE_SUPPLEMENTAL    = 0x00000002,
		LOCALE_ALTERNATE_SORTS = 0x00000004,
		LOCALE_REPLACEMENT     = 0x00000008,
		//(WINVER >= _WIN32_WINNT_WIN7)
			LOCALE_NEUTRALDATA  = 0x00000010,
			LOCALE_SPECIFICDATA = 0x00000020,
	}

enum {
	CP_INSTALLED = 0x00000001,
	CP_SUPPORTED = 0x00000002,
}
enum {
	SORT_STRINGSORT = 0x00001000,
	//(WINVER >= _WIN32_WINNT_WIN7)
		SORT_DIGITSASNUMBERS = 0x00000008,
}

enum {
	CSTR_LESS_THAN    = 1,
	CSTR_EQUAL        = 2,
	CSTR_GREATER_THAN = 3,
}

enum {
	CP_ACP        = 0,
	CP_OEMCP      = 1,
	CP_MACCP      = 2,
	CP_THREAD_ACP = 3,
	CP_SYMBOL     = 42,
	CP_UTF7       = 65000,
	CP_UTF8       = 65001,
}

enum {
	CTRY_DEFAULT            = 0,
	CTRY_ALBANIA            = 355,
	CTRY_ALGERIA            = 213,
	CTRY_ARGENTINA          = 54,
	CTRY_ARMENIA            = 374,
	CTRY_AUSTRALIA          = 61,
	CTRY_AUSTRIA            = 43,
	CTRY_AZERBAIJAN         = 994,
	CTRY_BAHRAIN            = 973,
	CTRY_BELARUS            = 375,
	CTRY_BELGIUM            = 32,
	CTRY_BELIZE             = 501,
	CTRY_BOLIVIA            = 591,
	CTRY_BRAZIL             = 55,
	CTRY_BRUNEI_DARUSSALAM  = 673,
	CTRY_BULGARIA           = 359,
	CTRY_CANADA             = 2,
	CTRY_CARIBBEAN          = 1,
	CTRY_CHILE              = 56,
	CTRY_COLOMBIA           = 57,
	CTRY_COSTA_RICA         = 506,
	CTRY_CROATIA            = 385,
	CTRY_CZECH              = 420,
	CTRY_DENMARK            = 45,
	CTRY_DOMINICAN_REPUBLIC = 1,
	CTRY_ECUADOR            = 593,
	CTRY_EGYPT              = 20,
	CTRY_EL_SALVADOR        = 503,
	CTRY_ESTONIA            = 372,
	CTRY_FAEROE_ISLANDS     = 298,
	CTRY_FINLAND            = 358,
	CTRY_FRANCE             = 33,
	CTRY_GEORGIA            = 995,
	CTRY_GERMANY            = 49,
	CTRY_GREECE             = 30,
	CTRY_GUATEMALA          = 502,
	CTRY_HONDURAS           = 504,
	CTRY_HONG_KONG          = 852,
	CTRY_HUNGARY            = 36,
	CTRY_ICELAND            = 354,
	CTRY_INDIA              = 91,
	CTRY_INDONESIA          = 62,
	CTRY_IRAN               = 981,
	CTRY_IRAQ               = 964,
	CTRY_IRELAND            = 353,
	CTRY_ISRAEL             = 972,
	CTRY_ITALY              = 39,
	CTRY_JAMAICA            = 1,
	CTRY_JAPAN              = 81,
	CTRY_JORDAN             = 962,
	CTRY_KAZAKSTAN          = 7,
	CTRY_KENYA              = 254,
	CTRY_KUWAIT             = 965,
	CTRY_KYRGYZSTAN         = 996,
	CTRY_LATVIA             = 371,
	CTRY_LEBANON            = 961,
	CTRY_LIBYA              = 218,
	CTRY_LIECHTENSTEIN      = 41,
	CTRY_LITHUANIA          = 370,
	CTRY_LUXEMBOURG         = 352,
	CTRY_MACAU              = 853,
	CTRY_MACEDONIA          = 389,
	CTRY_MALAYSIA           = 60,
	CTRY_MALDIVES           = 960,
	CTRY_MEXICO             = 52,
	CTRY_MONACO             = 33,
	CTRY_MONGOLIA           = 976,
	CTRY_MOROCCO            = 212,
	CTRY_NETHERLANDS        = 31,
	CTRY_NEW_ZEALAND        = 64,
	CTRY_NICARAGUA          = 505,
	CTRY_NORWAY             = 47,
	CTRY_OMAN               = 968,
	CTRY_PAKISTAN           = 92,
	CTRY_PANAMA             = 507,
	CTRY_PARAGUAY           = 595,
	CTRY_PERU               = 51,
	CTRY_PHILIPPINES        = 63,
	CTRY_POLAND             = 48,
	CTRY_PORTUGAL           = 351,
	CTRY_PRCHINA            = 86,
	CTRY_PUERTO_RICO        = 1,
	CTRY_QATAR              = 974,
	CTRY_ROMANIA            = 40,
	CTRY_RUSSIA             = 7,
	CTRY_SAUDI_ARABIA       = 966,
	CTRY_SERBIA             = 381,
	CTRY_SINGAPORE          = 65,
	CTRY_SLOVAK             = 421,
	CTRY_SLOVENIA           = 386,
	CTRY_SOUTH_AFRICA       = 27,
	CTRY_SOUTH_KOREA        = 82,
	CTRY_SPAIN              = 34,
	CTRY_SWEDEN             = 46,
	CTRY_SWITZERLAND        = 41,
	CTRY_SYRIA              = 963,
	CTRY_TAIWAN             = 886,
	CTRY_TATARSTAN          = 7,
	CTRY_THAILAND           = 66,
	CTRY_TRINIDAD_Y_TOBAGO  = 1,
	CTRY_TUNISIA            = 216,
	CTRY_TURKEY             = 90,
	CTRY_UAE                = 971,
	CTRY_UKRAINE            = 380,
	CTRY_UNITED_KINGDOM     = 44,
	CTRY_UNITED_STATES      = 1,
	CTRY_URUGUAY            = 598,
	CTRY_UZBEKISTAN         = 7,
	CTRY_VENEZUELA          = 58,
	CTRY_VIET_NAM           = 84,
	CTRY_YEMEN              = 967,
	CTRY_ZIMBABWE           = 263,
}

enum {
	LOCALE_NOUSEROVERRIDE = 0x80000000,
	LOCALE_USE_CP_ACP     = 0x40000000,
	LOCALE_RETURN_NUMBER  = 0x20000000,
	//(WINVER >= _WIN32_WINNT_WIN7)
		LOCALE_RETURN_GENITIVE_NAMES = 0x10000000,
		LOCALE_ALLOW_NEUTRAL_NAMES   = 0x08000000,
	LOCALE_SLOCALIZEDDISPLAYNAME = 0x00000002,
	//(WINVER >= _WIN32_WINNT_WIN7)
		LOCALE_SENGLISHDISPLAYNAME = 0x00000072,
		LOCALE_SNATIVEDISPLAYNAME  = 0x00000073,
	//(WINVER >= _WIN32_WINNT_VISTA)
		LOCALE_SLOCALIZEDLANGUAGENAME = 0x0000006f,
	LOCALE_SENGLISHLANGUAGENAME  = 0x00001001,
	LOCALE_SNATIVELANGUAGENAME   = 0x00000004,
	LOCALE_SLOCALIZEDCOUNTRYNAME = 0x00000006,
	LOCALE_SENGLISHCOUNTRYNAME   = 0x00001002,
	LOCALE_SNATIVECOUNTRYNAME    = 0x00000008,
	LOCALE_SLANGUAGE             = 0x00000002,
	//(WINVER >= _WIN32_WINNT_VISTA)
		LOCALE_SLANGDISPLAYNAME = 0x0000006f,
	LOCALE_SENGLANGUAGE         = 0x00001001,
	LOCALE_SNATIVELANGNAME      = 0x00000004,
	LOCALE_SCOUNTRY             = 0x00000006,
	LOCALE_SENGCOUNTRY          = 0x00001002,
	LOCALE_SNATIVECTRYNAME      = 0x00000008,
	LOCALE_ILANGUAGE            = 0x00000001,
	LOCALE_SABBREVLANGNAME      = 0x00000003,
	LOCALE_ICOUNTRY             = 0x00000005,
	LOCALE_SABBREVCTRYNAME      = 0x00000007,
	LOCALE_IGEOID               = 0x0000005B,
	LOCALE_IDEFAULTLANGUAGE     = 0x00000009,
	LOCALE_IDEFAULTCOUNTRY      = 0x0000000A,
	LOCALE_IDEFAULTCODEPAGE     = 0x0000000B,
	LOCALE_IDEFAULTANSICODEPAGE = 0x00001004,
	LOCALE_IDEFAULTMACCODEPAGE  = 0x00001011,
	LOCALE_SLIST                = 0x0000000C,
	LOCALE_IMEASURE             = 0x0000000D,
	LOCALE_SDECIMAL             = 0x0000000E,
	LOCALE_STHOUSAND            = 0x0000000F,
	LOCALE_SGROUPING            = 0x00000010,
	LOCALE_IDIGITS              = 0x00000011,
	LOCALE_ILZERO               = 0x00000012,
	LOCALE_INEGNUMBER           = 0x00001010,
	LOCALE_SNATIVEDIGITS        = 0x00000013,
	LOCALE_SCURRENCY            = 0x00000014,
	LOCALE_SINTLSYMBOL          = 0x00000015,
	LOCALE_SMONDECIMALSEP       = 0x00000016,
	LOCALE_SMONTHOUSANDSEP      = 0x00000017,
	LOCALE_SMONGROUPING         = 0x00000018,
	LOCALE_ICURRDIGITS          = 0x00000019,
	LOCALE_IINTLCURRDIGITS      = 0x0000001A,
	LOCALE_ICURRENCY            = 0x0000001B,
	LOCALE_INEGCURR             = 0x0000001C,
	LOCALE_SDATE                = 0x0000001D,
	LOCALE_STIME                = 0x0000001E,
	LOCALE_SSHORTDATE           = 0x0000001F,
	LOCALE_SLONGDATE            = 0x00000020,
	LOCALE_STIMEFORMAT          = 0x00001003,
	LOCALE_IDATE                = 0x00000021,
	LOCALE_ILDATE               = 0x00000022,
	LOCALE_ITIME                = 0x00000023,
	LOCALE_ITIMEMARKPOSN        = 0x00001005,
	LOCALE_ICENTURY             = 0x00000024,
	LOCALE_ITLZERO              = 0x00000025,
	LOCALE_IDAYLZERO            = 0x00000026,
	LOCALE_IMONLZERO            = 0x00000027,
	LOCALE_S1159                = 0x00000028,
	LOCALE_S2359                = 0x00000029,
	LOCALE_ICALENDARTYPE        = 0x00001009,
	LOCALE_IOPTIONALCALENDAR    = 0x0000100B,
	LOCALE_IFIRSTDAYOFWEEK      = 0x0000100C,
	LOCALE_IFIRSTWEEKOFYEAR     = 0x0000100D,
	LOCALE_SDAYNAME1            = 0x0000002A,
	LOCALE_SDAYNAME2            = 0x0000002B,
	LOCALE_SDAYNAME3            = 0x0000002C,
	LOCALE_SDAYNAME4            = 0x0000002D,
	LOCALE_SDAYNAME5            = 0x0000002E,
	LOCALE_SDAYNAME6            = 0x0000002F,
	LOCALE_SDAYNAME7            = 0x00000030,
	LOCALE_SABBREVDAYNAME1      = 0x00000031,
	LOCALE_SABBREVDAYNAME2      = 0x00000032,
	LOCALE_SABBREVDAYNAME3      = 0x00000033,
	LOCALE_SABBREVDAYNAME4      = 0x00000034,
	LOCALE_SABBREVDAYNAME5      = 0x00000035,
	LOCALE_SABBREVDAYNAME6      = 0x00000036,
	LOCALE_SABBREVDAYNAME7      = 0x00000037,
	LOCALE_SMONTHNAME1          = 0x00000038,
	LOCALE_SMONTHNAME2          = 0x00000039,
	LOCALE_SMONTHNAME3          = 0x0000003A,
	LOCALE_SMONTHNAME4          = 0x0000003B,
	LOCALE_SMONTHNAME5          = 0x0000003C,
	LOCALE_SMONTHNAME6          = 0x0000003D,
	LOCALE_SMONTHNAME7          = 0x0000003E,
	LOCALE_SMONTHNAME8          = 0x0000003F,
	LOCALE_SMONTHNAME9          = 0x00000040,
	LOCALE_SMONTHNAME10         = 0x00000041,
	LOCALE_SMONTHNAME11         = 0x00000042,
	LOCALE_SMONTHNAME12         = 0x00000043,
	LOCALE_SMONTHNAME13         = 0x0000100E,
	LOCALE_SABBREVMONTHNAME1    = 0x00000044,
	LOCALE_SABBREVMONTHNAME2    = 0x00000045,
	LOCALE_SABBREVMONTHNAME3    = 0x00000046,
	LOCALE_SABBREVMONTHNAME4    = 0x00000047,
	LOCALE_SABBREVMONTHNAME5    = 0x00000048,
	LOCALE_SABBREVMONTHNAME6    = 0x00000049,
	LOCALE_SABBREVMONTHNAME7    = 0x0000004A,
	LOCALE_SABBREVMONTHNAME8    = 0x0000004B,
	LOCALE_SABBREVMONTHNAME9    = 0x0000004C,
	LOCALE_SABBREVMONTHNAME10   = 0x0000004D,
	LOCALE_SABBREVMONTHNAME11   = 0x0000004E,
	LOCALE_SABBREVMONTHNAME12   = 0x0000004F,
	LOCALE_SABBREVMONTHNAME13   = 0x0000100F,
	LOCALE_SPOSITIVESIGN        = 0x00000050,
	LOCALE_SNEGATIVESIGN        = 0x00000051,
	LOCALE_IPOSSIGNPOSN         = 0x00000052,
	LOCALE_INEGSIGNPOSN         = 0x00000053,
	LOCALE_IPOSSYMPRECEDES      = 0x00000054,
	LOCALE_IPOSSEPBYSPACE       = 0x00000055,
	LOCALE_INEGSYMPRECEDES      = 0x00000056,
	LOCALE_INEGSEPBYSPACE       = 0x00000057,
	LOCALE_FONTSIGNATURE    = 0x00000058,
	LOCALE_SISO639LANGNAME  = 0x00000059,
	LOCALE_SISO3166CTRYNAME = 0x0000005A,
	LOCALE_IDEFAULTEBCDICCODEPAGE = 0x00001012,
	LOCALE_IPAPERSIZE             = 0x0000100A,
	LOCALE_SENGCURRNAME           = 0x00001007,
	LOCALE_SNATIVECURRNAME        = 0x00001008,
	LOCALE_SYEARMONTH             = 0x00001006,
	LOCALE_SSORTNAME              = 0x00001013,
	LOCALE_IDIGITSUBSTITUTION     = 0x00001014,
	//(WINVER >= _WIN32_WINNT_VISTA)
		LOCALE_SNAME                = 0x0000005c,
		LOCALE_SDURATION            = 0x0000005d,
		LOCALE_SKEYBOARDSTOINSTALL  = 0x0000005e,
		LOCALE_SSHORTESTDAYNAME1    = 0x00000060,
		LOCALE_SSHORTESTDAYNAME2    = 0x00000061,
		LOCALE_SSHORTESTDAYNAME3    = 0x00000062,
		LOCALE_SSHORTESTDAYNAME4    = 0x00000063,
		LOCALE_SSHORTESTDAYNAME5    = 0x00000064,
		LOCALE_SSHORTESTDAYNAME6    = 0x00000065,
		LOCALE_SSHORTESTDAYNAME7    = 0x00000066,
		LOCALE_SISO639LANGNAME2     = 0x00000067,
		LOCALE_SISO3166CTRYNAME2    = 0x00000068,
		LOCALE_SNAN                 = 0x00000069,
		LOCALE_SPOSINFINITY         = 0x0000006a,
		LOCALE_SNEGINFINITY         = 0x0000006b,
		LOCALE_SSCRIPTS             = 0x0000006c,
		LOCALE_SPARENT              = 0x0000006d,
		LOCALE_SCONSOLEFALLBACKNAME = 0x0000006e,
	//(WINVER >= _WIN32_WINNT_WIN7)
		LOCALE_IREADINGLAYOUT       = 0x00000070,
		LOCALE_INEUTRAL             = 0x00000071,
		LOCALE_INEGATIVEPERCENT     = 0x00000074,
		LOCALE_IPOSITIVEPERCENT     = 0x00000075,
		LOCALE_SPERCENT             = 0x00000076,
		LOCALE_SPERMILLE            = 0x00000077,
		LOCALE_SMONTHDAY            = 0x00000078,
		LOCALE_SSHORTTIME           = 0x00000079,
		LOCALE_SOPENTYPELANGUAGETAG = 0x0000007a,
		LOCALE_SSORTLOCALE          = 0x0000007b,
}

enum {
	TIME_NOMINUTESORSECONDS = 0x00000001,
	TIME_NOSECONDS          = 0x00000002,
	TIME_NOTIMEMARKER       = 0x00000004,
	TIME_FORCE24HOURFORMAT  = 0x00000008,
}

enum {
	DATE_SHORTDATE        = 0x00000001,
	DATE_LONGDATE         = 0x00000002,
	DATE_USE_ALT_CALENDAR = 0x00000004,
	DATE_YEARMONTH        = 0x00000008,
	DATE_LTRREADING       = 0x00000010,
	DATE_RTLREADING       = 0x00000020,
	//(WINVER >= _WIN32_WINNT_WIN7)
		DATE_AUTOLAYOUT = 0x00000040,
}

enum {
	CAL_NOUSEROVERRIDE = LOCALE_NOUSEROVERRIDE,
	CAL_USE_CP_ACP     = LOCALE_USE_CP_ACP,
	CAL_RETURN_NUMBER  = LOCALE_RETURN_NUMBER,
	//(WINVER >= _WIN32_WINNT_WIN7)
		CAL_RETURN_GENITIVE_NAMES = LOCALE_RETURN_GENITIVE_NAMES,
}

enum {
	CAL_ICALINTVALUE       = 0x00000001,
	CAL_SCALNAME           = 0x00000002,
	CAL_IYEAROFFSETRANGE   = 0x00000003,
	CAL_SERASTRING         = 0x00000004,
	CAL_SSHORTDATE         = 0x00000005,
	CAL_SLONGDATE          = 0x00000006,
	CAL_SDAYNAME1          = 0x00000007,
	CAL_SDAYNAME2          = 0x00000008,
	CAL_SDAYNAME3          = 0x00000009,
	CAL_SDAYNAME4          = 0x0000000a,
	CAL_SDAYNAME5          = 0x0000000b,
	CAL_SDAYNAME6          = 0x0000000c,
	CAL_SDAYNAME7          = 0x0000000d,
	CAL_SABBREVDAYNAME1    = 0x0000000e,
	CAL_SABBREVDAYNAME2    = 0x0000000f,
	CAL_SABBREVDAYNAME3    = 0x00000010,
	CAL_SABBREVDAYNAME4    = 0x00000011,
	CAL_SABBREVDAYNAME5    = 0x00000012,
	CAL_SABBREVDAYNAME6    = 0x00000013,
	CAL_SABBREVDAYNAME7    = 0x00000014,
	CAL_SMONTHNAME1        = 0x00000015,
	CAL_SMONTHNAME2        = 0x00000016,
	CAL_SMONTHNAME3        = 0x00000017,
	CAL_SMONTHNAME4        = 0x00000018,
	CAL_SMONTHNAME5        = 0x00000019,
	CAL_SMONTHNAME6        = 0x0000001a,
	CAL_SMONTHNAME7        = 0x0000001b,
	CAL_SMONTHNAME8        = 0x0000001c,
	CAL_SMONTHNAME9        = 0x0000001d,
	CAL_SMONTHNAME10       = 0x0000001e,
	CAL_SMONTHNAME11       = 0x0000001f,
	CAL_SMONTHNAME12       = 0x00000020,
	CAL_SMONTHNAME13       = 0x00000021,
	CAL_SABBREVMONTHNAME1  = 0x00000022,
	CAL_SABBREVMONTHNAME2  = 0x00000023,
	CAL_SABBREVMONTHNAME3  = 0x00000024,
	CAL_SABBREVMONTHNAME4  = 0x00000025,
	CAL_SABBREVMONTHNAME5  = 0x00000026,
	CAL_SABBREVMONTHNAME6  = 0x00000027,
	CAL_SABBREVMONTHNAME7  = 0x00000028,
	CAL_SABBREVMONTHNAME8  = 0x00000029,
	CAL_SABBREVMONTHNAME9  = 0x0000002a,
	CAL_SABBREVMONTHNAME10 = 0x0000002b,
	CAL_SABBREVMONTHNAME11 = 0x0000002c,
	CAL_SABBREVMONTHNAME12 = 0x0000002d,
	CAL_SABBREVMONTHNAME13 = 0x0000002e,
	CAL_SYEARMONTH         = 0x0000002f,
	CAL_ITWODIGITYEARMAX   = 0x00000030,
	//(WINVER >= _WIN32_WINNT_VISTA)
		CAL_SSHORTESTDAYNAME1 = 0x00000031,
		CAL_SSHORTESTDAYNAME2 = 0x00000032,
		CAL_SSHORTESTDAYNAME3 = 0x00000033,
		CAL_SSHORTESTDAYNAME4 = 0x00000034,
		CAL_SSHORTESTDAYNAME5 = 0x00000035,
		CAL_SSHORTESTDAYNAME6 = 0x00000036,
		CAL_SSHORTESTDAYNAME7 = 0x00000037,
	//(WINVER >= _WIN32_WINNT_WIN7)
		CAL_SMONTHDAY        =  0x00000038,
		CAL_SABBREVERASTRING  = 0x00000039,
}

enum ENUM_ALL_CALENDARS = 0xffffffff;

enum {
	CAL_GREGORIAN              = 1,
	CAL_GREGORIAN_US           = 2,
	CAL_JAPAN                  = 3,
	CAL_TAIWAN                 = 4,
	CAL_KOREA                  = 5,
	CAL_HIJRI                  = 6,
	CAL_THAI                   = 7,
	CAL_HEBREW                 = 8,
	CAL_GREGORIAN_ME_FRENCH    = 9,
	CAL_GREGORIAN_ARABIC       = 10,
	CAL_GREGORIAN_XLIT_ENGLISH = 11,
	CAL_GREGORIAN_XLIT_FRENCH  = 12,
	CAL_UMALQURA               = 23,
}

enum {
	LGRPID_WESTERN_EUROPE      = 0x0001,
	LGRPID_CENTRAL_EUROPE      = 0x0002,
	LGRPID_BALTIC              = 0x0003,
	LGRPID_GREEK               = 0x0004,
	LGRPID_CYRILLIC            = 0x0005,
	LGRPID_TURKIC              = 0x0006,
	LGRPID_TURKISH             = 0x0006,
	LGRPID_JAPANESE            = 0x0007,
	LGRPID_KOREAN              = 0x0008,
	LGRPID_TRADITIONAL_CHINESE = 0x0009,
	LGRPID_SIMPLIFIED_CHINESE  = 0x000a,
	LGRPID_THAI                = 0x000b,
	LGRPID_HEBREW              = 0x000c,
	LGRPID_ARABIC              = 0x000d,
	LGRPID_VIETNAMESE          = 0x000e,
	LGRPID_INDIC               = 0x000f,
	LGRPID_GEORGIAN            = 0x0010,
	LGRPID_ARMENIAN            = 0x0011,
}

//(WINVER >= _WIN32_WINNT_VISTA)
	enum {
		MUI_LANGUAGE_ID                    = 0x4,
		MUI_LANGUAGE_NAME                  = 0x8,
		MUI_MERGE_SYSTEM_FALLBACK          = 0x10,
		MUI_MERGE_USER_FALLBACK            = 0x20,
		MUI_UI_FALLBACK                    = MUI_MERGE_SYSTEM_FALLBACK | MUI_MERGE_USER_FALLBACK,
		MUI_THREAD_LANGUAGES               = 0x40,
		MUI_CONSOLE_FILTER                 = 0x100,
		MUI_COMPLEX_SCRIPT_FILTER          = 0x200,
		MUI_RESET_FILTERS                  = 0x001,
		MUI_USER_PREFERRED_UI_LANGUAGES    = 0x10,
		MUI_USE_INSTALLED_LANGUAGES        = 0x20,
		MUI_USE_SEARCH_ALL_LANGUAGES       = 0x40,
		MUI_LANG_NEUTRAL_PE_FILE           = 0x100,
		MUI_NON_LANG_NEUTRAL_FILE          = 0x200,
		MUI_MACHINE_LANGUAGE_SETTINGS      = 0x400,
		MUI_FILETYPE_NOT_LANGUAGE_NEUTRAL  = 0x001,
		MUI_FILETYPE_LANGUAGE_NEUTRAL_MAIN = 0x002,
		MUI_FILETYPE_LANGUAGE_NEUTRAL_MUI  = 0x004,
		MUI_QUERY_TYPE                     = 0x001,
		MUI_QUERY_CHECKSUM                 = 0x002,
		MUI_QUERY_LANGUAGE_NAME            = 0x004,
		MUI_QUERY_RESOURCE_TYPES           = 0x008,
		MUI_FILEINFO_VERSION               = 0x001,
		MUI_FULL_LANGUAGE                  = 0x01,
		MUI_PARTIAL_LANGUAGE               = 0x02,
		MUI_LIP_LANGUAGE                   = 0x04,
		MUI_LANGUAGE_INSTALLED             = 0x20,
		MUI_LANGUAGE_LICENSED              = 0x40,
		//MUI_CALLBACK_ALL_FLAGS             = MUI_CALLBACK_FLAG_UPGRADED_INSTALLATION, undefined
	}

alias DWORD LGRPID;
alias DWORD LCTYPE;
alias DWORD CALTYPE;
alias DWORD CALID;

struct CPINFO {
	UINT MaxCharSize;
	BYTE[MAX_DEFAULTCHAR] DefaultChar;
	BYTE[MAX_LEADBYTES] LeadByte;
}
alias CPINFO* LPCPINFO;

struct CPINFOEXA {
	UINT MaxCharSize;
	BYTE[MAX_DEFAULTCHAR] DefaultChar;
	BYTE[MAX_LEADBYTES] LeadByte;
	WCHAR UnicodeDefaultChar;
	UINT CodePage;
	CHAR[MAX_PATH] CodePageName;
}
alias CPINFOEXA* LPCPINFOEXA;
struct CPINFOEXW {
	UINT MaxCharSize;
	BYTE[MAX_DEFAULTCHAR] DefaultChar;
	BYTE[MAX_LEADBYTES] LeadByte;
	WCHAR UnicodeDefaultChar;
	UINT CodePage;
	WCHAR[MAX_PATH] CodePageName;
}
alias CPINFOEXW* LPCPINFOEXW;
version(UNICODE){
	alias CPINFOEXW CPINFOEX;
	alias LPCPINFOEXW LPCPINFOEX;
}else{
	alias CPINFOEXA CPINFOEX;
	alias LPCPINFOEXA LPCPINFOEX;
}

struct NUMBERFMTA {
	UINT NumDigits;
	UINT LeadingZero;
	UINT Grouping;
	LPSTR lpDecimalSep;
	LPSTR lpThousandSep;
	UINT NegativeOrder;
}
alias NUMBERFMTA* LPNUMBERFMTA;
struct NUMBERFMTW {
	UINT NumDigits;
	UINT LeadingZero;
	UINT Grouping;
	LPWSTR lpDecimalSep;
	LPWSTR lpThousandSep;
	UINT NegativeOrder;
}
alias NUMBERFMTW* LPNUMBERFMTW;
version(UNICODE){
	alias NUMBERFMTW NUMBERFMT;
	alias LPNUMBERFMTW LPNUMBERFMT;
}else{
	alias NUMBERFMTA NUMBERFMT;
	alias LPNUMBERFMTA LPNUMBERFMT;
}

struct CURRENCYFMTA {
	UINT NumDigits;
	UINT LeadingZero;
	UINT Grouping;
	LPSTR lpDecimalSep;
	LPSTR lpThousandSep;
	UINT NegativeOrder;
	UINT PositiveOrder;
	LPSTR lpCurrencySymbol;
}
alias CURRENCYFMTA* LPCURRENCYFMTA;
struct CURRENCYFMTW {
	UINT NumDigits;
	UINT LeadingZero;
	UINT Grouping;
	LPWSTR lpDecimalSep;
	LPWSTR lpThousandSep;
	UINT NegativeOrder;
	UINT PositiveOrder;
	LPWSTR lpCurrencySymbol;
}
alias CURRENCYFMTW* LPCURRENCYFMTW;
version(UNICODE){
	alias CURRENCYFMTW CURRENCYFMT;
	alias LPCURRENCYFMTW LPCURRENCYFMT;
}else{
	alias CURRENCYFMTA CURRENCYFMT;
	alias LPCURRENCYFMTA LPCURRENCYFMT;
}

enum {
	COMPARE_STRING = 0x0001,
}
alias int SYSNLS_FUNCTION;
alias DWORD NLS_FUNCTION;

struct NLSVERSIONINFO {
	DWORD dwNLSVersionInfoSize;
	DWORD dwNLSVersion;
	DWORD dwDefinedVersion;
}
alias NLSVERSIONINFO* LPNLSVERSIONINFO;

struct NLSVERSIONINFOEX {
	DWORD dwNLSVersionInfoSize;
	DWORD dwNLSVersion;
	DWORD dwDefinedVersion;
	DWORD dwEffectiveId;
	GUID guidCustomVersion;
}
alias  NLSVERSIONINFOEX* LPNLSVERSIONINFOEX;

alias LONG GEOID;
alias DWORD GEOTYPE;
alias DWORD GEOCLASS;

enum GEOID_NOT_AVAILABLE = -1;

enum {
	GEO_NATION            = 0x0001,
	GEO_LATITUDE          = 0x0002,
	GEO_LONGITUDE         = 0x0003,
	GEO_ISO2              = 0x0004,
	GEO_ISO3              = 0x0005,
	GEO_RFC1766           = 0x0006,
	GEO_LCID              = 0x0007,
	GEO_FRIENDLYNAME      = 0x0008,
	GEO_OFFICIALNAME      = 0x0009,
	GEO_TIMEZONES         = 0x000A,
	GEO_OFFICIALLANGUAGES = 0x000B,
}
alias int SYSGEOTYPE;

enum {
	GEOCLASS_NATION = 16,
	GEOCLASS_REGION = 14,
}
alias int SYSGEOCLASS;

//(WINVER >= _WIN32_WINNT_VISTA)
	enum {
		NormalizationOther = 0,
		NormalizationC     = 0x1,
		NormalizationD     = 0x2,
		NormalizationKC    = 0x5,
		NormalizationKD    = 0x6
	}
	alias int NORM_FORM;

	enum {
		IDN_ALLOW_UNASSIGNED       = 0x01,
		IDN_USE_STD3_ASCII_RULES   = 0x02,
		VS_ALLOW_LATIN             = 0x0001,
		GSS_ALLOW_INHERITED_COMMON = 0x0001,
	}

alias extern(Windows) BOOL function(LGRPID, LPSTR, LPSTR, DWORD, LONG_PTR) LANGUAGEGROUP_ENUMPROCA;
alias extern(Windows) BOOL function(LGRPID, LCID, LPSTR, LONG_PTR) LANGGROUPLOCALE_ENUMPROCA;
alias extern(Windows) BOOL function(LPSTR, LONG_PTR) UILANGUAGE_ENUMPROCA;
alias extern(Windows) BOOL function(LPSTR) LOCALE_ENUMPROCA;
alias extern(Windows) BOOL function(LPSTR) CODEPAGE_ENUMPROCA;
alias extern(Windows) BOOL function(LPSTR) DATEFMT_ENUMPROCA;
alias extern(Windows) BOOL function(LPSTR, CALID) DATEFMT_ENUMPROCEXA;
alias extern(Windows) BOOL function(LPSTR) TIMEFMT_ENUMPROCA;
alias extern(Windows) BOOL function(LPSTR) CALINFO_ENUMPROCA;
alias extern(Windows) BOOL function(LPSTR, CALID) CALINFO_ENUMPROCEXA;

alias extern(Windows) BOOL function(LGRPID, LPWSTR, LPWSTR, DWORD, LONG_PTR) LANGUAGEGROUP_ENUMPROCW;
alias extern(Windows) BOOL function(LGRPID, LCID, LPWSTR, LONG_PTR) LANGGROUPLOCALE_ENUMPROCW;
alias extern(Windows) BOOL function(LPWSTR, LONG_PTR) UILANGUAGE_ENUMPROCW;
alias extern(Windows) BOOL function(LPWSTR) LOCALE_ENUMPROCW;
alias extern(Windows) BOOL function(LPWSTR) CODEPAGE_ENUMPROCW;
alias extern(Windows) BOOL function(LPWSTR) DATEFMT_ENUMPROCW;
alias extern(Windows) BOOL function(LPWSTR, CALID) DATEFMT_ENUMPROCEXW;
alias extern(Windows) BOOL function(LPWSTR) TIMEFMT_ENUMPROCW;
alias extern(Windows) BOOL function(LPWSTR) CALINFO_ENUMPROCW;
alias extern(Windows) BOOL function(LPWSTR, CALID) CALINFO_ENUMPROCEXW;
alias extern(Windows) BOOL function(GEOID) GEO_ENUMPROC;

version(UNICODE){
	alias LANGUAGEGROUP_ENUMPROCW LANGUAGEGROUP_ENUMPROC;
	alias LANGGROUPLOCALE_ENUMPROCW LANGGROUPLOCALE_ENUMPROC;
	alias UILANGUAGE_ENUMPROCW UILANGUAGE_ENUMPROC;
	alias LOCALE_ENUMPROCW LOCALE_ENUMPROC;
	alias CODEPAGE_ENUMPROCW CODEPAGE_ENUMPROC;
	alias DATEFMT_ENUMPROCW DATEFMT_ENUMPROC;
	alias DATEFMT_ENUMPROCEXW DATEFMT_ENUMPROCEX;
	alias TIMEFMT_ENUMPROCW TIMEFMT_ENUMPROC;
	alias CALINFO_ENUMPROCW CALINFO_ENUMPROC;
	alias CALINFO_ENUMPROCEXW CALINFO_ENUMPROCEX;
}else{
	alias LANGUAGEGROUP_ENUMPROCA LANGUAGEGROUP_ENUMPROC;
	alias LANGGROUPLOCALE_ENUMPROCA LANGGROUPLOCALE_ENUMPROC;
	alias UILANGUAGE_ENUMPROCA UILANGUAGE_ENUMPROC;
	alias LOCALE_ENUMPROCA LOCALE_ENUMPROC;
	alias CODEPAGE_ENUMPROCA CODEPAGE_ENUMPROC;
	alias DATEFMT_ENUMPROCA DATEFMT_ENUMPROC;
	alias DATEFMT_ENUMPROCEXA DATEFMT_ENUMPROCEX;
	alias TIMEFMT_ENUMPROCA TIMEFMT_ENUMPROC;
	alias CALINFO_ENUMPROCA CALINFO_ENUMPROC;
	alias CALINFO_ENUMPROCEXA CALINFO_ENUMPROCEX;
}

struct FILEMUIINFO {
	DWORD dwSize;
	DWORD dwVersion;
	DWORD dwFileType;
	BYTE[16] pChecksum;
	BYTE[16] pServiceChecksum;
	DWORD dwLanguageNameOffset;
	DWORD dwTypeIDMainSize;
	DWORD dwTypeIDMainOffset;
	DWORD dwTypeNameMainOffset;
	DWORD dwTypeIDMUISize;
	DWORD dwTypeIDMUIOffset;
	DWORD dwTypeNameMUIOffset;
	BYTE[8] abBuffer;
}
alias FILEMUIINFO* PFILEMUIINFO;

pure nothrow
bool IS_HIGH_SURROGATE(WCHAR wch)
{
	return (((wch) >= HIGH_SURROGATE_START) && ((wch) <= HIGH_SURROGATE_END));
}

pure nothrow
bool IS_LOW_SURROGATE(WCHAR wch)
{
	return (((wch) >= LOW_SURROGATE_START) && ((wch) <= LOW_SURROGATE_END));
}

pure nothrow
bool IS_SURROGATE_PAIR(WCHAR hs, WCHAR ls)
{
	return (IS_HIGH_SURROGATE(hs) && IS_LOW_SURROGATE(ls));
}

pure nothrow
LPWSTR FILEMUIINFO_GET_CULTURE(PFILEMUIINFO pInfo)
{
	return cast(LPWSTR)((pInfo.dwLanguageNameOffset > 0) ? cast(ULONG_PTR)pInfo + pInfo.dwLanguageNameOffset : 0);
}

pure nothrow
DWORD* FILEMUIINFO_GET_MAIN_TYPEIDS(PFILEMUIINFO pInfo)
{
	return cast(DWORD*)((pInfo.dwTypeIDMainOffset > 0) ? cast(ULONG_PTR)pInfo+pInfo.dwTypeIDMainOffset : 0);
}

pure nothrow
DWORD FILEMUIINFO_GET_MAIN_TYPEID(PFILEMUIINFO pInfo, DWORD iType)
{
	return (((iType<pInfo.dwTypeIDMainSize)&&(pInfo.dwTypeIDMainOffset>0))?*(cast(DWORD*)(cast(ULONG_PTR)pInfo+pInfo.dwTypeIDMainOffset)+iType):0);
}

pure nothrow
LPWSTR FILEMUIINFO_GET_MAIN_TYPENAMES(PFILEMUIINFO pInfo)
{
	return (cast(LPWSTR)((pInfo.dwTypeNameMainOffset>0)?cast(ULONG_PTR)pInfo+pInfo.dwTypeNameMainOffset:0));
}

pure nothrow
DWORD* FILEMUIINFO_GET_MUI_TYPEIDS(PFILEMUIINFO pInfo)
{
	return (cast(DWORD*)((pInfo.dwTypeIDMUIOffset>0)?cast(ULONG_PTR)pInfo+pInfo.dwTypeIDMUIOffset : 0));
}

pure nothrow
DWORD FILEMUIINFO_GET_MUI_TYPEID(PFILEMUIINFO pInfo, DWORD iType)
{
	return (((iType<pInfo.dwTypeIDMUISize)&&(pInfo.dwTypeIDMUIOffset>0))?*(cast(DWORD*)(cast(ULONG_PTR)pInfo+pInfo.dwTypeIDMUIOffset)+iType):0);
}

pure nothrow
LPWSTR FILEMUIINFO_GET_MUI_TYPENAMES(PFILEMUIINFO pInfo)
{
	return (cast(LPWSTR)((pInfo.dwTypeNameMUIOffset>0)?cast(ULONG_PTR)pInfo+pInfo.dwTypeNameMUIOffset:0));
}

export extern(Windows) BOOL IsValidCodePage(UINT CodePage);
export extern(Windows) UINT GetACP();
export extern(Windows) UINT GetOEMCP();
export extern(Windows) BOOL GetCPInfo(UINT CodePage, LPCPINFO lpCPInfo);

export extern(Windows) BOOL GetCPInfoExA(UINT CodePage, DWORD dwFlags, LPCPINFOEXA lpCPInfoEx);
export extern(Windows) BOOL GetCPInfoExW(UINT CodePage, DWORD dwFlags, LPCPINFOEXW lpCPInfoEx);
version(UNICODE)
	alias GetCPInfoExW GetCPInfoEx;
else
	alias GetCPInfoExA GetCPInfoEx;

export extern(Windows) BOOL IsDBCSLeadByte(BYTE TestChar);
export extern(Windows) BOOL IsDBCSLeadByteEx(UINT CodePage, BYTE TestChar);
export extern(Windows) int MultiByteToWideChar(UINT CodePage, DWORD dwFlags, LPCSTR lpMultiByteStr, int cbMultiByte, LPWSTR lpWideCharStr, int cchWideChar);
export extern(Windows) int WideCharToMultiByte(UINT CodePage, DWORD dwFlags, LPCWSTR lpWideCharStr, int cchWideChar, LPSTR lpMultiByteStr, int cbMultiByte, LPCSTR lpDefaultChar, LPBOOL lpUsedDefaultChar);
export extern(Windows) int CompareStringA(LCID Locale, DWORD dwCmpFlags, PCNZCH lpString1, int cchCount1, PCNZCH lpString2, int cchCount2);
export extern(Windows) int CompareStringW(LCID Locale, DWORD dwCmpFlags, PCNZWCH lpString1, int cchCount1, PCNZWCH lpString2, int cchCount2);
version(UNICODE)
	alias CompareStringW CompareString;
else
	alias CompareStringA CompareString;

static if (WINVER >= _WIN32_WINNT_VISTA)
	export extern(Windows) int FindNLSString(LCID Locale, DWORD dwFindNLSStringFlags, LPCWSTR lpStringSource, int cchSource, LPCWSTR lpStringValue, int cchValue, LPINT pcchFound);

static if(WINVER >= _WIN32_WINNT_WIN7)
	export extern(Windows) int FindStringOrdinal(DWORD dwFindStringOrdinalFlags, LPCWSTR lpStringSource, int cchSource, LPCWSTR lpStringValue, int cchValue, BOOL bIgnoreCase);

export extern(Windows) int LCMapStringA(LCID Locale, DWORD dwMapFlags, LPCSTR lpSrcStr, int cchSrc, LPSTR lpDestStr, int cchDest);
export extern(Windows) int LCMapStringW(LCID Locale, DWORD dwMapFlags, LPCWSTR lpSrcStr, int cchSrc, LPWSTR lpDestStr, int cchDest);
version(UNICODE)
	alias LCMapStringW LCMapString;
else
	alias LCMapStringA LCMapString;

export extern(Windows) int GetLocaleInfoA(LCID Locale, LCTYPE LCType, LPSTR lpLCData, int cchData);
export extern(Windows) int GetLocaleInfoW(LCID Locale, LCTYPE LCType, LPWSTR lpLCData, int cchData);
version(UNICODE)
	alias GetLocaleInfoW GetLocaleInfo;
else
	alias GetLocaleInfoA GetLocaleInfo;

export extern(Windows) BOOL SetLocaleInfoA(LCID Locale, LCTYPE LCType, LPCSTR lpLCData);
export extern(Windows) BOOL SetLocaleInfoW(LCID Locale, LCTYPE LCType, LPCWSTR lpLCData);
version(UNICODE)
	alias SetLocaleInfoW SetLocaleInfo;
else
	alias SetLocaleInfoA SetLocaleInfo;

export extern(Windows) int GetCalendarInfoA(LCID Locale, CALID Calendar, CALTYPE CalType, LPSTR lpCalData, int cchData, LPDWORD lpValue);
export extern(Windows) int GetCalendarInfoW(LCID Locale, CALID Calendar, CALTYPE CalType, LPWSTR lpCalData, int cchData, LPDWORD lpValue);
version(UNICODE)
	alias GetCalendarInfoW GetCalendarInfo;
else
	alias GetCalendarInfoA GetCalendarInfo;

export extern(Windows) BOOL SetCalendarInfoA(LCID Locale, CALID Calendar, CALTYPE CalType, LPCSTR lpCalData);
export extern(Windows) BOOL SetCalendarInfoW(LCID Locale, CALID Calendar, CALTYPE CalType, LPCWSTR lpCalData);
version(UNICODE)
	alias SetCalendarInfoW SetCalendarInfo;
else
	alias SetCalendarInfoA SetCalendarInfo;

static if(WINVER >= _WIN32_WINNT_VISTA){
	export extern(Windows) int LCIDToLocaleName(LCID Locale, LPWSTR lpName, int cchName, DWORD dwFlags);
	export extern(Windows) LCID LocaleNameToLCID(LPCWSTR lpName, DWORD dwFlags);
}

export extern(Windows) int GetTimeFormatA(LCID Locale, DWORD dwFlags, const(SYSTEMTIME)* lpTime, LPCSTR lpFormat, LPSTR lpTimeStr, int cchTime);
export extern(Windows) int GetTimeFormatW(LCID Locale, DWORD dwFlags, const(SYSTEMTIME)* lpTime, LPCWSTR lpFormat, LPWSTR lpTimeStr, int cchTime);
version(UNICODE)
	alias GetTimeFormatW GetTimeFormat;
else
	alias GetTimeFormatA GetTimeFormat;

static if(WINVER >= _WIN32_WINNT_VISTA)
	export extern(Windows) int GetDurationFormat(LCID Locale, DWORD dwFlags, const(SYSTEMTIME)* lpDuration, ULONGLONG ullDuration, LPCWSTR lpFormat, LPWSTR lpDurationStr, int cchDuration);

export extern(Windows) int GetDateFormatA(LCID Locale, DWORD dwFlags, const(SYSTEMTIME)* lpDate, LPCSTR lpFormat, LPSTR lpDateStr, int cchDate);
export extern(Windows) int GetDateFormatW(LCID Locale, DWORD dwFlags, const(SYSTEMTIME)* lpDate, LPCWSTR lpFormat, LPWSTR lpDateStr, int cchDate);
version(UNICODE)
	alias GetDateFormatW GetDateFormat;
else
	alias GetDateFormatA GetDateFormat;

export extern(Windows) int GetNumberFormatA(LCID Locale, DWORD dwFlags, LPCSTR lpValue, const(NUMBERFMTA)* lpFormat, LPSTR lpNumberStr, int cchNumber);
export extern(Windows) int GetNumberFormatW(LCID Locale, DWORD dwFlags, LPCWSTR lpValue, const(NUMBERFMTW)* lpFormat, LPWSTR lpNumberStr, int cchNumber);
version(UNICODE)
	alias GetNumberFormatW GetNumberFormat;
else
	alias GetNumberFormatA GetNumberFormat;

export extern(Windows) int GetCurrencyFormatA(LCID Locale, DWORD dwFlags, LPCSTR lpValue, const(CURRENCYFMTA)* lpFormat, LPSTR lpCurrencyStr, int cchCurrency);
export extern(Windows) int GetCurrencyFormatW(LCID Locale, DWORD dwFlags, LPCWSTR lpValue, const(CURRENCYFMTW)* lpFormat, LPWSTR lpCurrencyStr, int cchCurrency);
version(UNICODE)
	alias GetCurrencyFormatW GetCurrencyFormat;
else
	alias GetCurrencyFormatA GetCurrencyFormat;

export extern(Windows) BOOL EnumCalendarInfoA(CALINFO_ENUMPROCA lpCalInfoEnumProc, LCID Locale, CALID Calendar, CALTYPE CalType);
export extern(Windows) BOOL EnumCalendarInfoW(CALINFO_ENUMPROCW lpCalInfoEnumProc, LCID Locale, CALID Calendar, CALTYPE CalType);
version(UNICODE)
	alias EnumCalendarInfoW EnumCalendarInfo;
else
	alias EnumCalendarInfoA EnumCalendarInfo;

export extern(Windows) BOOL EnumCalendarInfoExA(CALINFO_ENUMPROCEXA lpCalInfoEnumProcEx, LCID Locale, CALID Calendar, CALTYPE CalType);
export extern(Windows) BOOL EnumCalendarInfoExW(CALINFO_ENUMPROCEXW lpCalInfoEnumProcEx, LCID Locale, CALID Calendar, CALTYPE CalType);
version(UNICODE)
	alias EnumCalendarInfoExW EnumCalendarInfoEx;
else
	alias EnumCalendarInfoExA EnumCalendarInfoEx;

export extern(Windows) BOOL EnumTimeFormatsA(TIMEFMT_ENUMPROCA lpTimeFmtEnumProc, LCID Locale, DWORD dwFlags);
export extern(Windows) BOOL EnumTimeFormatsW(TIMEFMT_ENUMPROCW lpTimeFmtEnumProc, LCID Locale, DWORD dwFlags);
version(UNICODE)
	alias EnumTimeFormatsW EnumTimeFormats;
else
	alias EnumTimeFormatsA EnumTimeFormats;

export extern(Windows) BOOL EnumDateFormatsA(DATEFMT_ENUMPROCA lpDateFmtEnumProc, LCID Locale, DWORD dwFlags);
export extern(Windows) BOOL EnumDateFormatsW(DATEFMT_ENUMPROCW lpDateFmtEnumProc, LCID Locale, DWORD dwFlags);
version(UNICODE)
	alias EnumDateFormatsW EnumDateFormats;
else
	alias EnumDateFormatsA EnumDateFormats;

export extern(Windows) BOOL EnumDateFormatsExA(DATEFMT_ENUMPROCEXA lpDateFmtEnumProcEx, LCID Locale, DWORD dwFlags);
export extern(Windows) BOOL EnumDateFormatsExW(DATEFMT_ENUMPROCEXW lpDateFmtEnumProcEx, LCID Locale, DWORD dwFlags);
version(UNICODE)
	alias EnumDateFormatsExW EnumDateFormatsEx;
else
	alias EnumDateFormatsExA EnumDateFormatsEx;

export extern(Windows) BOOL IsValidLanguageGroup(LGRPID LanguageGroup, DWORD dwFlags);
export extern(Windows) BOOL GetNLSVersion(NLS_FUNCTION Function, LCID Locale, LPNLSVERSIONINFO lpVersionInformation);
export extern(Windows) BOOL IsNLSDefinedString(NLS_FUNCTION Function, DWORD dwFlags, LPNLSVERSIONINFO lpVersionInformation, LPCWSTR lpString, INT cchStr);
export extern(Windows) BOOL IsValidLocale(LCID Locale, DWORD dwFlags);
export extern(Windows) int GetGeoInfoA(GEOID Location, GEOTYPE GeoType, LPSTR lpGeoData, int cchData, LANGID LangId);
export extern(Windows) int GetGeoInfoW(GEOID Location, GEOTYPE GeoType, LPWSTR lpGeoData, int cchData, LANGID LangId);
version(UNICODE)
	alias GetGeoInfoW GetGeoInfo;
else
	alias GetGeoInfoA GetGeoInfo;


export extern(Windows) BOOL EnumSystemGeoID(GEOCLASS GeoClass, GEOID ParentGeoId, GEO_ENUMPROC lpGeoEnumProc);
export extern(Windows) GEOID GetUserGeoID(GEOCLASS GeoClass);
export extern(Windows) BOOL SetUserGeoID(GEOID GeoId);
export extern(Windows) LCID ConvertDefaultLocale(LCID Locale);
export extern(Windows) LCID GetThreadLocale();
export extern(Windows) BOOL SetThreadLocale(LCID Locale);

export extern(Windows) LANGID GetSystemDefaultUILanguage();
export extern(Windows) LANGID GetUserDefaultUILanguage();

export extern(Windows) LANGID GetSystemDefaultLangID();
export extern(Windows) LANGID GetUserDefaultLangID();
export extern(Windows) LCID GetSystemDefaultLCID();
export extern(Windows) LCID GetUserDefaultLCID();
export extern(Windows) LANGID SetThreadUILanguage(LANGID LangId);

static if(WINVER >= _WIN32_WINNT_VISTA){
	export extern(Windows) LANGID GetThreadUILanguage();
	export extern(Windows) BOOL GetProcessPreferredUILanguages(DWORD dwFlags, PULONG pulNumLanguages, PZZWSTR pwszLanguagesBuffer, PULONG pcchLanguagesBuffer);
	export extern(Windows) BOOL SetProcessPreferredUILanguages(DWORD dwFlags, PCZZWSTR pwszLanguagesBuffer, PULONG pulNumLanguages);
	export extern(Windows) BOOL GetUserPreferredUILanguages(DWORD dwFlags, PULONG pulNumLanguages, PZZWSTR pwszLanguagesBuffer, PULONG pcchLanguagesBuffer);
	export extern(Windows) BOOL GetSystemPreferredUILanguages(DWORD dwFlags, PULONG pulNumLanguages, PZZWSTR pwszLanguagesBuffer, PULONG pcchLanguagesBuffer);
	export extern(Windows) BOOL GetThreadPreferredUILanguages(DWORD dwFlags, PULONG pulNumLanguages, PZZWSTR pwszLanguagesBuffer, PULONG pcchLanguagesBuffer);
	export extern(Windows) BOOL SetThreadPreferredUILanguages(DWORD dwFlags, PCZZWSTR pwszLanguagesBuffer, PULONG pulNumLanguages);
	export extern(Windows) BOOL GetFileMUIInfo(DWORD dwFlags, PCWSTR pcwszFilePath, PFILEMUIINFO pFileMUIInfo, DWORD* pcbFileMUIInfo);
	export extern(Windows) BOOL GetFileMUIPath(DWORD dwFlags, PCWSTR pcwszFilePath, PWSTR pwszLanguage, PULONG pcchLanguage, PWSTR pwszFileMUIPath, PULONG pcchFileMUIPath, PULONGLONG pululEnumerator);
	export extern(Windows) BOOL GetUILanguageInfo(DWORD dwFlags, PCZZWSTR pwmszLanguage, PZZWSTR pwszFallbackLanguages, PDWORD pcchFallbackLanguages, PDWORD pAttributes);
	export extern(Windows) BOOL NotifyUILanguageChange(DWORD dwFlags, PCWSTR pcwstrNewLanguage, PCWSTR pcwstrPreviousLanguage, DWORD dwReserved, PDWORD pdwStatusRtrn);
}

export extern(Windows) BOOL GetStringTypeExA(LCID Locale, DWORD dwInfoType, LPCSTR lpSrcStr, int cchSrc, LPWORD lpCharType);
export extern(Windows) BOOL GetStringTypeExW(LCID Locale, DWORD dwInfoType, LPCWSTR lpSrcStr, int cchSrc, LPWORD lpCharType);
version(UNICODE)
	alias GetStringTypeExW GetStringTypeEx;
else
	alias GetStringTypeExA GetStringTypeEx;

export extern(Windows) BOOL GetStringTypeA(LCID Locale, DWORD dwInfoType, LPCSTR lpSrcStr, int cchSrc, LPWORD lpCharType);
export extern(Windows) BOOL GetStringTypeW(DWORD dwInfoType, LPCWSTR lpSrcStr, int cchSrc, LPWORD lpCharType);

export extern(Windows) int FoldStringA(DWORD dwMapFlags, LPCSTR lpSrcStr, int cchSrc, LPSTR lpDestStr, int cchDest);
export extern(Windows) int FoldStringW(DWORD dwMapFlags, LPCWSTR lpSrcStr, int cchSrc, LPWSTR lpDestStr, int cchDest);
version(UNICODE)
	alias FoldStringW FoldString;
else
	alias FoldStringA FoldString;

export extern(Windows) BOOL EnumSystemLanguageGroupsA(LANGUAGEGROUP_ENUMPROCA lpLanguageGroupEnumProc, DWORD dwFlags, LONG_PTR lParam);
export extern(Windows) BOOL EnumSystemLanguageGroupsW(LANGUAGEGROUP_ENUMPROCW lpLanguageGroupEnumProc, DWORD dwFlags, LONG_PTR lParam);
version(UNICODE)
	alias EnumSystemLanguageGroupsW EnumSystemLanguageGroups;
else
	alias EnumSystemLanguageGroupsA EnumSystemLanguageGroups;

export extern(Windows) BOOL EnumLanguageGroupLocalesA(LANGGROUPLOCALE_ENUMPROCA lpLangGroupLocaleEnumProc, LGRPID LanguageGroup, DWORD dwFlags, LONG_PTR lParam);
export extern(Windows) BOOL EnumLanguageGroupLocalesW(LANGGROUPLOCALE_ENUMPROCW lpLangGroupLocaleEnumProc, LGRPID LanguageGroup, DWORD dwFlags, LONG_PTR lParam);
version(UNICODE)
	alias EnumLanguageGroupLocalesW EnumLanguageGroupLocales;
else
	alias EnumLanguageGroupLocalesA EnumLanguageGroupLocales;

export extern(Windows) BOOL EnumUILanguagesA(UILANGUAGE_ENUMPROCA lpUILanguageEnumProc, DWORD dwFlags, LONG_PTR lParam);
export extern(Windows) BOOL EnumUILanguagesW(UILANGUAGE_ENUMPROCW lpUILanguageEnumProc, DWORD dwFlags, LONG_PTR lParam);
version(UNICODE)
	alias EnumUILanguagesW EnumUILanguages;
else
	alias EnumUILanguagesA EnumUILanguages;

export extern(Windows) BOOL EnumSystemLocalesA(LOCALE_ENUMPROCA lpLocaleEnumProc, DWORD dwFlags);
export extern(Windows) BOOL EnumSystemLocalesW(LOCALE_ENUMPROCW lpLocaleEnumProc, DWORD dwFlags);
version(UNICODE)
	alias EnumSystemLocalesW EnumSystemLocales;
else
	alias EnumSystemLocalesA EnumSystemLocales;

export extern(Windows) BOOL EnumSystemCodePagesA(CODEPAGE_ENUMPROCA lpCodePageEnumProc, DWORD dwFlags);
export extern(Windows) BOOL EnumSystemCodePagesW(CODEPAGE_ENUMPROCW lpCodePageEnumProc, DWORD dwFlags);
version(UNICODE)
	alias EnumSystemCodePagesW EnumSystemCodePages;
else
	alias EnumSystemCodePagesA EnumSystemCodePages;

static if (WINVER >= _WIN32_WINNT_VISTA){
	export extern(Windows) int NormalizeString(NORM_FORM NormForm, LPCWSTR lpSrcString, int cwSrcLength, LPWSTR lpDstString, int cwDstLength);
	export extern(Windows) BOOL IsNormalizedString(NORM_FORM NormForm, LPCWSTR lpString, int cwLength);
	export extern(Windows) int IdnToAscii(DWORD dwFlags, LPCWSTR lpUnicodeCharStr, int cchUnicodeChar, LPWSTR lpASCIICharStr, int cchASCIIChar);
	export extern(Windows) int IdnToNameprepUnicode(DWORD dwFlags, LPCWSTR lpUnicodeCharStr, int cchUnicodeChar, LPWSTR lpNameprepCharStr, int cchNameprepChar);
	export extern(Windows) int IdnToUnicode(DWORD dwFlags, LPCWSTR lpASCIICharStr, int cchASCIIChar, LPWSTR lpUnicodeCharStr, int cchUnicodeChar);
	export extern(Windows) BOOL VerifyScripts(DWORD dwFlags, LPCWSTR lpLocaleScripts, int cchLocaleScripts, LPCWSTR lpTestScripts, int cchTestScripts);
	export extern(Windows) int GetStringScripts(DWORD dwFlags, LPCWSTR lpString, int cchString, LPWSTR lpScripts, int cchScripts);
}

//(WINVER >= _WIN32_WINNT_VISTA)
	const wchar* LOCALE_NAME_USER_DEFAULT = null;
	const wchar* LOCALE_NAME_INVARIANT = "";
	const wchar* LOCALE_NAME_SYSTEM_DEFAULT = "!x-sys-default-locale";

static if(WINVER >= _WIN32_WINNT_VISTA){
	export extern(Windows) int GetLocaleInfoEx(LPCWSTR lpLocaleName, LCTYPE LCType, LPWSTR lpLCData, int cchData);
	export extern(Windows) int GetCalendarInfoEx(LPCWSTR lpLocaleName, CALID Calendar, LPCWSTR lpReserved, CALTYPE CalType, LPWSTR lpCalData, int cchData, LPDWORD lpValue);
	export extern(Windows) int GetTimeFormatEx(LPCWSTR lpLocaleName, DWORD dwFlags, const(SYSTEMTIME)* lpTime, LPCWSTR lpFormat, LPWSTR lpTimeStr, int cchTime);
	export extern(Windows) int GetDateFormatEx(LPCWSTR lpLocaleName, DWORD dwFlags, const(SYSTEMTIME)* lpDate, LPCWSTR lpFormat, LPWSTR lpDateStr, int cchDate, LPCWSTR lpCalendar);
	export extern(Windows) int GetDurationFormatEx(LPCWSTR lpLocaleName, DWORD dwFlags, const(SYSTEMTIME)* lpDuration, ULONGLONG ullDuration, LPCWSTR lpFormat, LPWSTR lpDurationStr, int cchDuration);
	export extern(Windows) int GetNumberFormatEx(LPCWSTR lpLocaleName, DWORD dwFlags, LPCWSTR lpValue, const(NUMBERFMTW)* lpFormat, LPWSTR lpNumberStr, int cchNumber);
	export extern(Windows) int GetCurrencyFormatEx(LPCWSTR lpLocaleName, DWORD dwFlags, LPCWSTR lpValue, const(CURRENCYFMTW)* lpFormat, LPWSTR lpCurrencyStr, int cchCurrency);
	export extern(Windows) int GetUserDefaultLocaleName(LPWSTR lpLocaleName, int cchLocaleName);
	export extern(Windows) int GetSystemDefaultLocaleName(LPWSTR lpLocaleName, int cchLocaleName);
	export extern(Windows) BOOL GetNLSVersionEx(NLS_FUNCTION function_, LPCWSTR lpLocaleName, LPNLSVERSIONINFOEX lpVersionInformation);
	export extern(Windows) int CompareStringEx(LPCWSTR lpLocaleName, DWORD dwCmpFlags, LPCWSTR lpString1, int cchCount1, LPCWSTR lpString2, int cchCount2, LPNLSVERSIONINFO lpVersionInformation, LPVOID lpReserved, LPARAM lParam);
	export extern(Windows) int FindNLSStringEx(LPCWSTR lpLocaleName, DWORD dwFindNLSStringFlags, LPCWSTR lpStringSource, int cchSource, LPCWSTR lpStringValue, int cchValue, LPINT pcchFound, LPNLSVERSIONINFO lpVersionInformation, LPVOID lpReserved, LPARAM lParam);
	export extern(Windows) int LCMapStringEx(LPCWSTR lpLocaleName, DWORD dwMapFlags, LPCWSTR lpSrcStr, int cchSrc, LPWSTR lpDestStr, int cchDest, LPNLSVERSIONINFO lpVersionInformation, LPVOID lpReserved, LPARAM lParam);
	export extern(Windows) int CompareStringOrdinal(LPCWSTR lpString1, int cchCount1, LPCWSTR lpString2, int cchCount2, BOOL bIgnoreCase);
	export extern(Windows) BOOL IsValidLocaleName(LPCWSTR lpLocaleName);
	alias extern(Windows) BOOL function(LPWSTR, CALID, LPWSTR, LPARAM) CALINFO_ENUMPROCEXEX;
	export extern(Windows) BOOL EnumCalendarInfoExEx(CALINFO_ENUMPROCEXEX pCalInfoEnumProcExEx, LPCWSTR lpLocaleName, CALID Calendar, LPCWSTR lpReserved, CALTYPE CalType, LPARAM lParam);
	alias extern(Windows) BOOL function(LPWSTR, CALID, LPARAM) DATEFMT_ENUMPROCEXEX;
	export extern(Windows) BOOL EnumDateFormatsExEx(DATEFMT_ENUMPROCEXEX lpDateFmtEnumProcExEx, LPCWSTR lpLocaleName, DWORD dwFlags, LPARAM lParam);
	alias extern(Windows) BOOL function(LPWSTR, LPARAM) TIMEFMT_ENUMPROCEX;
	export extern(Windows) BOOL EnumTimeFormatsEx(TIMEFMT_ENUMPROCEX lpTimeFmtEnumProcEx, LPCWSTR lpLocaleName, DWORD dwFlags, LPARAM lParam);
	alias extern(Windows) BOOL function(LPWSTR, DWORD, LPARAM) LOCALE_ENUMPROCEX;
	export extern(Windows) BOOL EnumSystemLocalesEx(LOCALE_ENUMPROCEX lpLocaleEnumProcEx, DWORD dwFlags, LPARAM lParam, LPVOID lpReserved);
}

static if(WINVER >= _WIN32_WINNT_WIN7)
	export extern(Windows) int ResolveLocaleName(LPCWSTR lpNameToResolve, LPWSTR lpLocaleName, int cchLocaleName);

} // extern(C)
