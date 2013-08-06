/** winnt.d

Converted from 'winnt.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.winnt;


import std.c.string;
import c.windows.sdkddkver;
import c.windows.windef;
import c.windows.guiddef;
import c.windows.winternl;
import c.windows.ktmtypes;


extern(C){

// Dummy -->
struct EXCEPTION_REGISTRATION_RECORD {
}
alias void* EXCEPTION_DISPOSITION;
struct ACTIVATION_CONTEXT {
}
// <--

enum ANYSIZE_ARRAY = 1;

version(Win64){
	enum MAX_NATURAL_ALIGNMENT = ULONGLONG.sizeof;
	enum MEMORY_ALLOCATION_ALIGNMENT = 16;
}else{
	enum MAX_NATURAL_ALIGNMENT = DWORD.sizeof;
	enum MEMORY_ALLOCATION_ALIGNMENT = 8;
}

version(X86)
	enum SYSTEM_CACHE_ALIGNMENT_SIZE = 64;
else version(X86_64)
	enum SYSTEM_CACHE_ALIGNMENT_SIZE = 64;
else
	enum SYSTEM_CACHE_ALIGNMENT_SIZE = 128;

enum ALL_PROCESSOR_GROUPS = 0xffff;

struct PROCESSOR_NUMBER {
	WORD Group;
	BYTE Number;
	BYTE Reserved;
}
alias PROCESSOR_NUMBER* PPROCESSOR_NUMBER;

struct GROUP_AFFINITY {
	KAFFINITY Mask;
	WORD      Group;
	WORD[3]   Reserved;
}
alias GROUP_AFFINITY* PGROUP_AFFINITY;

/* --> to windef
alias BYTE   FCHAR;
alias WORD   FSHORT;
alias DWORD  FLONG;

alias LONG HRESULT;

alias char CCHAR;
alias DWORD LCID;
alias PDWORD PLCID;
alias WORD LANGID;
*/ // <--

enum {
	APPLICATION_ERROR_MASK       = 0x20000000,
	ERROR_SEVERITY_SUCCESS       = 0x00000000,
	ERROR_SEVERITY_INFORMATIONAL = 0x40000000,
	ERROR_SEVERITY_WARNING       = 0x80000000,
	ERROR_SEVERITY_ERROR         = 0xC0000000,
}

version(none){ // _M_IA64
	align(16)
	struct  FLOAT128 {
		long LowPart;
		long HighPart;
	}
}else{
	struct  FLOAT128 {
		long LowPart;
		long HighPart;
	}
}
alias FLOAT128* PFLOAT128;

alias LONGLONG USN;

/* --> to windef
union LARGE_INTEGER {
	struct {
		DWORD LowPart;
		LONG HighPart;
	}
	LONGLONG QuadPart;
}
alias LARGE_INTEGER* PLARGE_INTEGER;

struct ULARGE_INTEGER {
	struct {
		DWORD LowPart;
		DWORD HighPart;
	}
	ULONGLONG QuadPart;
}
alias ULARGE_INTEGER* PULARGE_INTEGER;

struct LUID {
	DWORD LowPart;
	LONG HighPart;
}
alias LUID* PLUID;

alias ULONGLONG DWORDLONG;
alias DWORDLONG* PDWORDLONG;
*/ // <-- to windef

version(X86_64){
	pure nothrow
	long Int32x32To64(int a, int b)
	{
		return cast(long)a * cast(long)b;
	}

	pure nothrow
	ulong UInt32x32To64(uint a, uint b)
	{
		return cast(ulong)a * cast(ulong)b;
	}

	pure nothrow
	ulong Int64ShllMod32(uint a, int b)
	{
		return (cast(ulong)a) << b;
	}

	pure nothrow
	long Int64ShraMod32(int a, int b)
	{
		return (cast(long)a) >> b;
	}

	pure nothrow
	ulong Int64ShrlMod32(int a, int b)
	{
		return (cast(ulong)a) >> b;
	}

}else version(X86){
	pure nothrow
	long Int32x32To64(int a, int b)
	{
		return cast(long)a * cast(long)b;
	}

	pure nothrow
	ulong UInt32x32To64(uint a, uint b)
	{
		return cast(ulong)a * cast(ulong)b;
	}

	version(D_InlineAsm_X86){
	extern(Windows){
	ULONGLONG Int64ShllMod32(ULONGLONG Value, DWORD ShiftCount)
	{
		asm{
			mov     ECX, ShiftCount;
			mov     EAX, dword ptr [Value];
			mov     EDX, dword ptr [Value+4];
			shld    EDX, EAX, CL;
			shl     EAX, CL;
		}
	}

	LONGLONG Int64ShraMod32(LONGLONG Value, DWORD ShiftCount)
	{
		asm {
			mov     ECX, ShiftCount;
			mov     EAX, dword ptr [Value];
			mov     EDX, dword ptr [Value+4];
			shrd    EAX, EDX, CL;
			sar     EDX, CL;
		}
	}

	ULONGLONG Int64ShrlMod32(ULONGLONG Value, DWORD ShiftCount)
	{
		asm {
			mov     ECX, ShiftCount;
			mov     EAX, dword ptr [Value];
			mov     EDX, dword ptr [Value+4];
			shrd    EAX, EDX, CL;
			shr     EDX, CL;
		}
	}
	} // extern
	} // asm
}else{
	static assert("architecture");
}

extern(C){
	version(X86_64){
		ubyte _rotl8(ubyte Value, ubyte Shift);
		ubyte _rotl16(ushort Value, ubyte Shift);
		ubyte _rotr8 (ubyte Value, ubyte Shift);
		ushort _rotr16(ushort Value, ubyte Shift);

		alias _rotl8 RotateLeft8;
		alias _rotl16 RotateLeft16;
		alias _rotr8 RotateRight8;
		alias _rotr16 RotateRight16;
	}
	uint _rotl(uint Value, int Shift);
	ulong _rotl64 (ulong Value, int Shift);
	uint _rotr(uint Value, int Shift);
	ulong _rotr64(ulong Value, int Shift);

	alias _rotl RotateLeft32;
	alias _rotl64 RotateLeft64;
	alias _rotr RotateRight32;
	alias _rotr64 RotateRight64;
} // extern

enum {
	ANSI_NULL = 0,
	UNICODE_NULL = 0,
	UNICODE_STRING_MAX_BYTES = 65534,
	UNICODE_STRING_MAX_CHARS = 32767,
}
/* to windef -->
alias BYTE BOOLEAN;
alias BOOLEAN* PBOOLEAN;

struct LIST_ENTRY {
	LIST_ENTRY* Flink;
	LIST_ENTRY* Blink;
}
alias LIST_ENTRY* PLIST_ENTRY;
alias LIST_ENTRY* RESTRICTED_POINTER;
alias LIST_ENTRY* PRLIST_ENTRY;

struct SINGLE_LIST_ENTRY {
	SINGLE_LIST_ENTRY* Next;
}
alias SINGLE_LIST_ENTRY* PSINGLE_LIST_ENTRY;

struct LIST_ENTRY32 {
	DWORD Flink;
	DWORD Blink;
}
alias LIST_ENTRY32* PLIST_ENTRY32;

struct LIST_ENTRY64 {
	ULONGLONG Flink;
	ULONGLONG Blink;
}
alias LIST_ENTRY64* PLIST_ENTRY64;
*/ // <-- to windef

struct OBJECTID {
	GUID Lineage;
	DWORD Uniquifier;
}

enum {
	MINCHAR  = 0x80,
	MAXCHAR  = 0x7f,
	MINSHORT = 0x8000,
	MAXSHORT = 0x7fff,
	MINLONG  = 0x80000000,
	MAXLONG  = 0x7fffffff,
	MAXBYTE  = 0xff,
	MAXWORD  = 0xffff,
	MAXDWORD = 0xffffffff,
}

alias extern(Windows) EXCEPTION_DISPOSITION function(EXCEPTION_RECORD* ExceptionRecord, PVOID EstablisherFrame, CONTEXT* ContextRecord, PVOID DispatcherContext) EXCEPTION_ROUTINE;
alias EXCEPTION_ROUTINE PEXCEPTION_ROUTINE;

enum {
	VER_SERVER_NT                      = 0x80000000,
	VER_WORKSTATION_NT                 = 0x40000000,
	VER_SUITE_SMALLBUSINESS            = 0x00000001,
	VER_SUITE_ENTERPRISE               = 0x00000002,
	VER_SUITE_BACKOFFICE               = 0x00000004,
	VER_SUITE_COMMUNICATIONS           = 0x00000008,
	VER_SUITE_TERMINAL                 = 0x00000010,
	VER_SUITE_SMALLBUSINESS_RESTRICTED = 0x00000020,
	VER_SUITE_EMBEDDEDNT               = 0x00000040,
	VER_SUITE_DATACENTER               = 0x00000080,
	VER_SUITE_SINGLEUSERTS             = 0x00000100,
	VER_SUITE_PERSONAL                 = 0x00000200,
	VER_SUITE_BLADE                    = 0x00000400,
	VER_SUITE_EMBEDDED_RESTRICTED      = 0x00000800,
	VER_SUITE_SECURITY_APPLIANCE       = 0x00001000,
	VER_SUITE_STORAGE_SERVER           = 0x00002000,
	VER_SUITE_COMPUTE_SERVER           = 0x00004000,
	VER_SUITE_WH_SERVER                = 0x00008000,
}

enum {
	PRODUCT_UNDEFINED                         = 0x00000000,
	PRODUCT_ULTIMATE                          = 0x00000001,
	PRODUCT_HOME_BASIC                        = 0x00000002,
	PRODUCT_HOME_PREMIUM                      = 0x00000003,
	PRODUCT_ENTERPRISE                        = 0x00000004,
	PRODUCT_HOME_BASIC_N                      = 0x00000005,
	PRODUCT_BUSINESS                          = 0x00000006,
	PRODUCT_STANDARD_SERVER                   = 0x00000007,
	PRODUCT_DATACENTER_SERVER                 = 0x00000008,
	PRODUCT_SMALLBUSINESS_SERVER              = 0x00000009,
	PRODUCT_ENTERPRISE_SERVER                 = 0x0000000A,
	PRODUCT_STARTER                           = 0x0000000B,
	PRODUCT_DATACENTER_SERVER_CORE            = 0x0000000C,
	PRODUCT_STANDARD_SERVER_CORE              = 0x0000000D,
	PRODUCT_ENTERPRISE_SERVER_CORE            = 0x0000000E,
	PRODUCT_ENTERPRISE_SERVER_IA64            = 0x0000000F,
	PRODUCT_BUSINESS_N                        = 0x00000010,
	PRODUCT_WEB_SERVER                        = 0x00000011,
	PRODUCT_CLUSTER_SERVER                    = 0x00000012,
	PRODUCT_HOME_SERVER                       = 0x00000013,
	PRODUCT_STORAGE_EXPRESS_SERVER            = 0x00000014,
	PRODUCT_STORAGE_STANDARD_SERVER           = 0x00000015,
	PRODUCT_STORAGE_WORKGROUP_SERVER          = 0x00000016,
	PRODUCT_STORAGE_ENTERPRISE_SERVER         = 0x00000017,
	PRODUCT_SERVER_FOR_SMALLBUSINESS          = 0x00000018,
	PRODUCT_SMALLBUSINESS_SERVER_PREMIUM      = 0x00000019,
	PRODUCT_HOME_PREMIUM_N                    = 0x0000001A,
	PRODUCT_ENTERPRISE_N                      = 0x0000001B,
	PRODUCT_ULTIMATE_N                        = 0x0000001C,
	PRODUCT_WEB_SERVER_CORE                   = 0x0000001D,
	PRODUCT_MEDIUMBUSINESS_SERVER_MANAGEMENT  = 0x0000001E,
	PRODUCT_MEDIUMBUSINESS_SERVER_SECURITY    = 0x0000001F,
	PRODUCT_MEDIUMBUSINESS_SERVER_MESSAGING   = 0x00000020,
	PRODUCT_SERVER_FOUNDATION                 = 0x00000021,
	PRODUCT_HOME_PREMIUM_SERVER               = 0x00000022,
	PRODUCT_SERVER_FOR_SMALLBUSINESS_V        = 0x00000023,
	PRODUCT_STANDARD_SERVER_V                 = 0x00000024,
	PRODUCT_DATACENTER_SERVER_V               = 0x00000025,
	PRODUCT_ENTERPRISE_SERVER_V               = 0x00000026,
	PRODUCT_DATACENTER_SERVER_CORE_V          = 0x00000027,
	PRODUCT_STANDARD_SERVER_CORE_V            = 0x00000028,
	PRODUCT_ENTERPRISE_SERVER_CORE_V          = 0x00000029,
	PRODUCT_HYPERV                            = 0x0000002A,
	PRODUCT_STORAGE_EXPRESS_SERVER_CORE       = 0x0000002B,
	PRODUCT_STORAGE_STANDARD_SERVER_CORE      = 0x0000002C,
	PRODUCT_STORAGE_WORKGROUP_SERVER_CORE     = 0x0000002D,
	PRODUCT_STORAGE_ENTERPRISE_SERVER_CORE    = 0x0000002E,
	PRODUCT_STARTER_N                         = 0x0000002F,
	PRODUCT_PROFESSIONAL                      = 0x00000030,
	PRODUCT_PROFESSIONAL_N                    = 0x00000031,
	PRODUCT_SB_SOLUTION_SERVER                = 0x00000032,
	PRODUCT_SERVER_FOR_SB_SOLUTIONS           = 0x00000033,
	PRODUCT_STANDARD_SERVER_SOLUTIONS         = 0x00000034,
	PRODUCT_STANDARD_SERVER_SOLUTIONS_CORE    = 0x00000035,
	PRODUCT_SB_SOLUTION_SERVER_EM             = 0x00000036,
	PRODUCT_SERVER_FOR_SB_SOLUTIONS_EM        = 0x00000037,
	PRODUCT_SOLUTION_EMBEDDEDSERVER           = 0x00000038,
	PRODUCT_SOLUTION_EMBEDDEDSERVER_CORE      = 0x00000039,
	PRODUCT_SMALLBUSINESS_SERVER_PREMIUM_CORE = 0x0000003F,
	PRODUCT_ESSENTIALBUSINESS_SERVER_MGMT     = 0x0000003B,
	PRODUCT_ESSENTIALBUSINESS_SERVER_ADDL     = 0x0000003C,
	PRODUCT_ESSENTIALBUSINESS_SERVER_MGMTSVC  = 0x0000003D,
	PRODUCT_ESSENTIALBUSINESS_SERVER_ADDLSVC  = 0x0000003E,
	PRODUCT_CLUSTER_SERVER_V                  = 0x00000040,
	PRODUCT_EMBEDDED                          = 0x00000041,
	PRODUCT_STARTER_E                         = 0x00000042,
	PRODUCT_HOME_BASIC_E                      = 0x00000043,
	PRODUCT_HOME_PREMIUM_E                    = 0x00000044,
	PRODUCT_PROFESSIONAL_E                    = 0x00000045,
	PRODUCT_ENTERPRISE_E                      = 0x00000046,
	PRODUCT_ULTIMATE_E                        = 0x00000047,
	PRODUCT_UNLICENSED                        = 0xABCDABCD,
}

enum {
	LANG_NEUTRAL             =   0x00,
	LANG_INVARIANT           =   0x7f,

	LANG_AFRIKAANS           =   0x36,
	LANG_ALBANIAN            =   0x1c,
	LANG_ALSATIAN            =   0x84,
	LANG_AMHARIC             =   0x5e,
	LANG_ARABIC              =   0x01,
	LANG_ARMENIAN            =   0x2b,
	LANG_ASSAMESE            =   0x4d,
	LANG_AZERI               =   0x2c,
	LANG_BASHKIR             =   0x6d,
	LANG_BASQUE              =   0x2d,
	LANG_BELARUSIAN          =   0x23,
	LANG_BENGALI             =   0x45,
	LANG_BRETON              =   0x7e,
	LANG_BOSNIAN             =   0x1a,
	LANG_BOSNIAN_NEUTRAL     = 0x781a,
	LANG_BULGARIAN           =   0x02,
	LANG_CATALAN             =   0x03,
	LANG_CHINESE             =   0x04,
	LANG_CHINESE_SIMPLIFIED  =   0x04,
	LANG_CHINESE_TRADITIONAL = 0x7c04,
	LANG_CORSICAN            =   0x83,
	LANG_CROATIAN            =   0x1a,
	LANG_CZECH               =   0x05,
	LANG_DANISH              =   0x06,
	LANG_DARI                =   0x8c,
	LANG_DIVEHI              =   0x65,
	LANG_DUTCH               =   0x13,
	LANG_ENGLISH             =   0x09,
	LANG_ESTONIAN            =   0x25,
	LANG_FAEROESE            =   0x38,
	LANG_FARSI               =   0x29,
	LANG_FILIPINO            =   0x64,
	LANG_FINNISH             =   0x0b,
	LANG_FRENCH              =   0x0c,
	LANG_FRISIAN             =   0x62,
	LANG_GALICIAN            =   0x56,
	LANG_GEORGIAN            =   0x37,
	LANG_GERMAN              =   0x07,
	LANG_GREEK               =   0x08,
	LANG_GREENLANDIC         =   0x6f,
	LANG_GUJARATI            =   0x47,
	LANG_HAUSA               =   0x68,
	LANG_HEBREW              =   0x0d,
	LANG_HINDI               =   0x39,
	LANG_HUNGARIAN           =   0x0e,
	LANG_ICELANDIC           =   0x0f,
	LANG_IGBO                =   0x70,
	LANG_INDONESIAN          =   0x21,
	LANG_INUKTITUT           =   0x5d,
	LANG_IRISH               =   0x3c,
	LANG_ITALIAN             =   0x10,
	LANG_JAPANESE            =   0x11,
	LANG_KANNADA             =   0x4b,
	LANG_KASHMIRI            =   0x60,
	LANG_KAZAK               =   0x3f,
	LANG_KHMER               =   0x53,
	LANG_KICHE               =   0x86,
	LANG_KINYARWANDA         =   0x87,
	LANG_KONKANI             =   0x57,
	LANG_KOREAN              =   0x12,
	LANG_KYRGYZ              =   0x40,
	LANG_LAO                 =   0x54,
	LANG_LATVIAN             =   0x26,
	LANG_LITHUANIAN          =   0x27,
	LANG_LOWER_SORBIAN       =   0x2e,
	LANG_LUXEMBOURGISH       =   0x6e,
	LANG_MACEDONIAN          =   0x2f,
	LANG_MALAY               =   0x3e,
	LANG_MALAYALAM           =   0x4c,
	LANG_MALTESE             =   0x3a,
	LANG_MANIPURI            =   0x58,
	LANG_MAORI               =   0x81,
	LANG_MAPUDUNGUN          =   0x7a,
	LANG_MARATHI             =   0x4e,
	LANG_MOHAWK              =   0x7c,
	LANG_MONGOLIAN           =   0x50,
	LANG_NEPALI              =   0x61,
	LANG_NORWEGIAN           =   0x14,
	LANG_OCCITAN             =   0x82,
	LANG_ORIYA               =   0x48,
	LANG_PASHTO              =   0x63,
	LANG_PERSIAN             =   0x29,
	LANG_POLISH              =   0x15,
	LANG_PORTUGUESE          =   0x16,
	LANG_PUNJABI             =   0x46,
	LANG_QUECHUA             =   0x6b,
	LANG_ROMANIAN            =   0x18,
	LANG_ROMANSH             =   0x17,
	LANG_RUSSIAN             =   0x19,
	LANG_SAMI                =   0x3b,
	LANG_SANSKRIT            =   0x4f,
	LANG_SCOTTISH_GAELIC     =   0x91,
	LANG_SERBIAN             =   0x1a,
	LANG_SERBIAN_NEUTRAL     = 0x7c1a,
	LANG_SINDHI              =   0x59,
	LANG_SINHALESE           =   0x5b,
	LANG_SLOVAK              =   0x1b,
	LANG_SLOVENIAN           =   0x24,
	LANG_SOTHO               =   0x6c,
	LANG_SPANISH             =   0x0a,
	LANG_SWAHILI             =   0x41,
	LANG_SWEDISH             =   0x1d,
	LANG_SYRIAC              =   0x5a,
	LANG_TAJIK               =   0x28,
	LANG_TAMAZIGHT           =   0x5f,
	LANG_TAMIL               =   0x49,
	LANG_TATAR               =   0x44,
	LANG_TELUGU              =   0x4a,
	LANG_THAI                =   0x1e,
	LANG_TIBETAN             =   0x51,
	LANG_TIGRIGNA            =   0x73,
	LANG_TSWANA              =   0x32,
	LANG_TURKISH             =   0x1f,
	LANG_TURKMEN             =   0x42,
	LANG_UIGHUR              =   0x80,
	LANG_UKRAINIAN           =   0x22,
	LANG_UPPER_SORBIAN       =   0x2e,
	LANG_URDU                =   0x20,
	LANG_UZBEK               =   0x43,
	LANG_VIETNAMESE          =   0x2a,
	LANG_WELSH               =   0x52,
	LANG_WOLOF               =   0x88,
	LANG_XHOSA               =   0x34,
	LANG_YAKUT               =   0x85,
	LANG_YI                  =   0x78,
	LANG_YORUBA              =   0x6a,
	LANG_ZULU                =   0x35,
}

enum {
	SUBLANG_NEUTRAL                             = 0x00,
	SUBLANG_DEFAULT                             = 0x01,
	SUBLANG_SYS_DEFAULT                         = 0x02,
	SUBLANG_CUSTOM_DEFAULT                      = 0x03,
	SUBLANG_CUSTOM_UNSPECIFIED                  = 0x04,
	SUBLANG_UI_CUSTOM_DEFAULT                   = 0x05,

	SUBLANG_AFRIKAANS_SOUTH_AFRICA              = 0x01,
	SUBLANG_ALBANIAN_ALBANIA                    = 0x01,
	SUBLANG_ALSATIAN_FRANCE                     = 0x01,
	SUBLANG_AMHARIC_ETHIOPIA                    = 0x01,
	SUBLANG_ARABIC_SAUDI_ARABIA                 = 0x01,
	SUBLANG_ARABIC_IRAQ                         = 0x02,
	SUBLANG_ARABIC_EGYPT                        = 0x03,
	SUBLANG_ARABIC_LIBYA                        = 0x04,
	SUBLANG_ARABIC_ALGERIA                      = 0x05,
	SUBLANG_ARABIC_MOROCCO                      = 0x06,
	SUBLANG_ARABIC_TUNISIA                      = 0x07,
	SUBLANG_ARABIC_OMAN                         = 0x08,
	SUBLANG_ARABIC_YEMEN                        = 0x09,
	SUBLANG_ARABIC_SYRIA                        = 0x0a,
	SUBLANG_ARABIC_JORDAN                       = 0x0b,
	SUBLANG_ARABIC_LEBANON                      = 0x0c,
	SUBLANG_ARABIC_KUWAIT                       = 0x0d,
	SUBLANG_ARABIC_UAE                          = 0x0e,
	SUBLANG_ARABIC_BAHRAIN                      = 0x0f,
	SUBLANG_ARABIC_QATAR                        = 0x10,
	SUBLANG_ARMENIAN_ARMENIA                    = 0x01,
	SUBLANG_ASSAMESE_INDIA                      = 0x01,
	SUBLANG_AZERI_LATIN                         = 0x01,
	SUBLANG_AZERI_CYRILLIC                      = 0x02,
	SUBLANG_BASHKIR_RUSSIA                      = 0x01,
	SUBLANG_BASQUE_BASQUE                       = 0x01,
	SUBLANG_BELARUSIAN_BELARUS                  = 0x01,
	SUBLANG_BENGALI_INDIA                       = 0x01,
	SUBLANG_BENGALI_BANGLADESH                  = 0x02,
	SUBLANG_BOSNIAN_BOSNIA_HERZEGOVINA_LATIN    = 0x05,
	SUBLANG_BOSNIAN_BOSNIA_HERZEGOVINA_CYRILLIC = 0x08,
	SUBLANG_BRETON_FRANCE                       = 0x01,
	SUBLANG_BULGARIAN_BULGARIA                  = 0x01,
	SUBLANG_CATALAN_CATALAN                     = 0x01,
	SUBLANG_CHINESE_TRADITIONAL                 = 0x01,
	SUBLANG_CHINESE_SIMPLIFIED                  = 0x02,
	SUBLANG_CHINESE_HONGKONG                    = 0x03,
	SUBLANG_CHINESE_SINGAPORE                   = 0x04,
	SUBLANG_CHINESE_MACAU                       = 0x05,
	SUBLANG_CORSICAN_FRANCE                     = 0x01,
	SUBLANG_CZECH_CZECH_REPUBLIC                = 0x01,
	SUBLANG_CROATIAN_CROATIA                    = 0x01,
	SUBLANG_CROATIAN_BOSNIA_HERZEGOVINA_LATIN   = 0x04,
	SUBLANG_DANISH_DENMARK                      = 0x01,
	SUBLANG_DARI_AFGHANISTAN                    = 0x01,
	SUBLANG_DIVEHI_MALDIVES                     = 0x01,
	SUBLANG_DUTCH                               = 0x01,
	SUBLANG_DUTCH_BELGIAN                       = 0x02,
	SUBLANG_ENGLISH_US                          = 0x01,
	SUBLANG_ENGLISH_UK                          = 0x02,
	SUBLANG_ENGLISH_AUS                         = 0x03,
	SUBLANG_ENGLISH_CAN                         = 0x04,
	SUBLANG_ENGLISH_NZ                          = 0x05,
	SUBLANG_ENGLISH_EIRE                        = 0x06,
	SUBLANG_ENGLISH_SOUTH_AFRICA                = 0x07,
	SUBLANG_ENGLISH_JAMAICA                     = 0x08,
	SUBLANG_ENGLISH_CARIBBEAN                   = 0x09,
	SUBLANG_ENGLISH_BELIZE                      = 0x0a,
	SUBLANG_ENGLISH_TRINIDAD                    = 0x0b,
	SUBLANG_ENGLISH_ZIMBABWE                    = 0x0c,
	SUBLANG_ENGLISH_PHILIPPINES                 = 0x0d,
	SUBLANG_ENGLISH_INDIA                       = 0x10,
	SUBLANG_ENGLISH_MALAYSIA                    = 0x11,
	SUBLANG_ENGLISH_SINGAPORE                   = 0x12,
	SUBLANG_ESTONIAN_ESTONIA                    = 0x01,
	SUBLANG_FAEROESE_FAROE_ISLANDS              = 0x01,
	SUBLANG_FILIPINO_PHILIPPINES                = 0x01,
	SUBLANG_FINNISH_FINLAND                     = 0x01,
	SUBLANG_FRENCH                              = 0x01,
	SUBLANG_FRENCH_BELGIAN                      = 0x02,
	SUBLANG_FRENCH_CANADIAN                     = 0x03,
	SUBLANG_FRENCH_SWISS                        = 0x04,
	SUBLANG_FRENCH_LUXEMBOURG                   = 0x05,
	SUBLANG_FRENCH_MONACO                       = 0x06,
	SUBLANG_FRISIAN_NETHERLANDS                 = 0x01,
	SUBLANG_GALICIAN_GALICIAN                   = 0x01,
	SUBLANG_GEORGIAN_GEORGIA                    = 0x01,
	SUBLANG_GERMAN                              = 0x01,
	SUBLANG_GERMAN_SWISS                        = 0x02,
	SUBLANG_GERMAN_AUSTRIAN                     = 0x03,
	SUBLANG_GERMAN_LUXEMBOURG                   = 0x04,
	SUBLANG_GERMAN_LIECHTENSTEIN                = 0x05,
	SUBLANG_GREEK_GREECE                        = 0x01,
	SUBLANG_GREENLANDIC_GREENLAND               = 0x01,
	SUBLANG_GUJARATI_INDIA                      = 0x01,
	SUBLANG_HAUSA_NIGERIA_LATIN                 = 0x01,
	SUBLANG_HEBREW_ISRAEL                       = 0x01,
	SUBLANG_HINDI_INDIA                         = 0x01,
	SUBLANG_HUNGARIAN_HUNGARY                   = 0x01,
	SUBLANG_ICELANDIC_ICELAND                   = 0x01,
	SUBLANG_IGBO_NIGERIA                        = 0x01,
	SUBLANG_INDONESIAN_INDONESIA                = 0x01,
	SUBLANG_INUKTITUT_CANADA                    = 0x01,
	SUBLANG_INUKTITUT_CANADA_LATIN              = 0x02,
	SUBLANG_IRISH_IRELAND                       = 0x02,
	SUBLANG_ITALIAN                             = 0x01,
	SUBLANG_ITALIAN_SWISS                       = 0x02,
	SUBLANG_JAPANESE_JAPAN                      = 0x01,
	SUBLANG_KANNADA_INDIA                       = 0x01,
	SUBLANG_KASHMIRI_SASIA                      = 0x02,
	SUBLANG_KASHMIRI_INDIA                      = 0x02,
	SUBLANG_KAZAK_KAZAKHSTAN                    = 0x01,
	SUBLANG_KHMER_CAMBODIA                      = 0x01,
	SUBLANG_KICHE_GUATEMALA                     = 0x01,
	SUBLANG_KINYARWANDA_RWANDA                  = 0x01,
	SUBLANG_KONKANI_INDIA                       = 0x01,
	SUBLANG_KOREAN                              = 0x01,
	SUBLANG_KYRGYZ_KYRGYZSTAN                   = 0x01,
	SUBLANG_LAO_LAO                             = 0x01,
	SUBLANG_LATVIAN_LATVIA                      = 0x01,
	SUBLANG_LITHUANIAN                          = 0x01,
	SUBLANG_LOWER_SORBIAN_GERMANY               = 0x02,
	SUBLANG_LUXEMBOURGISH_LUXEMBOURG            = 0x01,
	SUBLANG_MACEDONIAN_MACEDONIA                = 0x01,
	SUBLANG_MALAY_MALAYSIA                      = 0x01,
	SUBLANG_MALAY_BRUNEI_DARUSSALAM             = 0x02,
	SUBLANG_MALAYALAM_INDIA                     = 0x01,
	SUBLANG_MALTESE_MALTA                       = 0x01,
	SUBLANG_MAORI_NEW_ZEALAND                   = 0x01,
	SUBLANG_MAPUDUNGUN_CHILE                    = 0x01,
	SUBLANG_MARATHI_INDIA                       = 0x01,
	SUBLANG_MOHAWK_MOHAWK                       = 0x01,
	SUBLANG_MONGOLIAN_CYRILLIC_MONGOLIA         = 0x01,
	SUBLANG_MONGOLIAN_PRC                       = 0x02,
	SUBLANG_NEPALI_INDIA                        = 0x02,
	SUBLANG_NEPALI_NEPAL                        = 0x01,
	SUBLANG_NORWEGIAN_BOKMAL                    = 0x01,
	SUBLANG_NORWEGIAN_NYNORSK                   = 0x02,
	SUBLANG_OCCITAN_FRANCE                      = 0x01,
	SUBLANG_ORIYA_INDIA                         = 0x01,
	SUBLANG_PASHTO_AFGHANISTAN                  = 0x01,
	SUBLANG_PERSIAN_IRAN                        = 0x01,
	SUBLANG_POLISH_POLAND                       = 0x01,
	SUBLANG_PORTUGUESE                          = 0x02,
	SUBLANG_PORTUGUESE_BRAZILIAN                = 0x01,
	SUBLANG_PUNJABI_INDIA                       = 0x01,
	SUBLANG_QUECHUA_BOLIVIA                     = 0x01,
	SUBLANG_QUECHUA_ECUADOR                     = 0x02,
	SUBLANG_QUECHUA_PERU                        = 0x03,
	SUBLANG_ROMANIAN_ROMANIA                    = 0x01,
	SUBLANG_ROMANSH_SWITZERLAND                 = 0x01,
	SUBLANG_RUSSIAN_RUSSIA                      = 0x01,
	SUBLANG_SAMI_NORTHERN_NORWAY                = 0x01,
	SUBLANG_SAMI_NORTHERN_SWEDEN                = 0x02,
	SUBLANG_SAMI_NORTHERN_FINLAND               = 0x03,
	SUBLANG_SAMI_LULE_NORWAY                    = 0x04,
	SUBLANG_SAMI_LULE_SWEDEN                    = 0x05,
	SUBLANG_SAMI_SOUTHERN_NORWAY                = 0x06,
	SUBLANG_SAMI_SOUTHERN_SWEDEN                = 0x07,
	SUBLANG_SAMI_SKOLT_FINLAND                  = 0x08,
	SUBLANG_SAMI_INARI_FINLAND                  = 0x09,
	SUBLANG_SANSKRIT_INDIA                      = 0x01,
	SUBLANG_SCOTTISH_GAELIC                     = 0x01,
	SUBLANG_SERBIAN_BOSNIA_HERZEGOVINA_LATIN    = 0x06,
	SUBLANG_SERBIAN_BOSNIA_HERZEGOVINA_CYRILLIC = 0x07,
	SUBLANG_SERBIAN_MONTENEGRO_LATIN            = 0x0b,
	SUBLANG_SERBIAN_MONTENEGRO_CYRILLIC         = 0x0c,
	SUBLANG_SERBIAN_SERBIA_LATIN                = 0x09,
	SUBLANG_SERBIAN_SERBIA_CYRILLIC             = 0x0a,
	SUBLANG_SERBIAN_CROATIA                     = 0x01,
	SUBLANG_SERBIAN_LATIN                       = 0x02,
	SUBLANG_SERBIAN_CYRILLIC                    = 0x03,
	SUBLANG_SINDHI_INDIA                        = 0x01,
	SUBLANG_SINDHI_PAKISTAN                     = 0x02,
	SUBLANG_SINDHI_AFGHANISTAN                  = 0x02,
	SUBLANG_SINHALESE_SRI_LANKA                 = 0x01,
	SUBLANG_SOTHO_NORTHERN_SOUTH_AFRICA         = 0x01,
	SUBLANG_SLOVAK_SLOVAKIA                     = 0x01,
	SUBLANG_SLOVENIAN_SLOVENIA                  = 0x01,
	SUBLANG_SPANISH                             = 0x01,
	SUBLANG_SPANISH_MEXICAN                     = 0x02,
	SUBLANG_SPANISH_MODERN                      = 0x03,
	SUBLANG_SPANISH_GUATEMALA                   = 0x04,
	SUBLANG_SPANISH_COSTA_RICA                  = 0x05,
	SUBLANG_SPANISH_PANAMA                      = 0x06,
	SUBLANG_SPANISH_DOMINICAN_REPUBLIC          = 0x07,
	SUBLANG_SPANISH_VENEZUELA                   = 0x08,
	SUBLANG_SPANISH_COLOMBIA                    = 0x09,
	SUBLANG_SPANISH_PERU                        = 0x0a,
	SUBLANG_SPANISH_ARGENTINA                   = 0x0b,
	SUBLANG_SPANISH_ECUADOR                     = 0x0c,
	SUBLANG_SPANISH_CHILE                       = 0x0d,
	SUBLANG_SPANISH_URUGUAY                     = 0x0e,
	SUBLANG_SPANISH_PARAGUAY                    = 0x0f,
	SUBLANG_SPANISH_BOLIVIA                     = 0x10,
	SUBLANG_SPANISH_EL_SALVADOR                 = 0x11,
	SUBLANG_SPANISH_HONDURAS                    = 0x12,
	SUBLANG_SPANISH_NICARAGUA                   = 0x13,
	SUBLANG_SPANISH_PUERTO_RICO                 = 0x14,
	SUBLANG_SPANISH_US                          = 0x15,
	SUBLANG_SWAHILI_KENYA                       = 0x01,
	SUBLANG_SWEDISH                             = 0x01,
	SUBLANG_SWEDISH_FINLAND                     = 0x02,
	SUBLANG_SYRIAC_SYRIA                        = 0x01,
	SUBLANG_TAJIK_TAJIKISTAN                    = 0x01,
	SUBLANG_TAMAZIGHT_ALGERIA_LATIN             = 0x02,
	SUBLANG_TAMIL_INDIA                         = 0x01,
	SUBLANG_TATAR_RUSSIA                        = 0x01,
	SUBLANG_TELUGU_INDIA                        = 0x01,
	SUBLANG_THAI_THAILAND                       = 0x01,
	SUBLANG_TIBETAN_PRC                         = 0x01,
	SUBLANG_TIGRIGNA_ERITREA                    = 0x02,
	SUBLANG_TSWANA_SOUTH_AFRICA                 = 0x01,
	SUBLANG_TURKISH_TURKEY                      = 0x01,
	SUBLANG_TURKMEN_TURKMENISTAN                = 0x01,
	SUBLANG_UIGHUR_PRC                          = 0x01,
	SUBLANG_UKRAINIAN_UKRAINE                   = 0x01,
	SUBLANG_UPPER_SORBIAN_GERMANY               = 0x01,
	SUBLANG_URDU_PAKISTAN                       = 0x01,
	SUBLANG_URDU_INDIA                          = 0x02,
	SUBLANG_UZBEK_LATIN                         = 0x01,
	SUBLANG_UZBEK_CYRILLIC                      = 0x02,
	SUBLANG_VIETNAMESE_VIETNAM                  = 0x01,
	SUBLANG_WELSH_UNITED_KINGDOM                = 0x01,
	SUBLANG_WOLOF_SENEGAL                       = 0x01,
	SUBLANG_XHOSA_SOUTH_AFRICA                  = 0x01,
	SUBLANG_YAKUT_RUSSIA                        = 0x01,
	SUBLANG_YI_PRC                              = 0x01,
	SUBLANG_YORUBA_NIGERIA                      = 0x01,
	SUBLANG_ZULU_SOUTH_AFRICA                   = 0x01,
}

enum {
	SORT_DEFAULT                = 0x0,
	SORT_INVARIANT_MATH         = 0x1,
	SORT_JAPANESE_XJIS          = 0x0,
	SORT_JAPANESE_UNICODE       = 0x1,
	SORT_JAPANESE_RADICALSTROKE = 0x4,
	SORT_CHINESE_BIG5           = 0x0,
	SORT_CHINESE_PRCP           = 0x0,
	SORT_CHINESE_UNICODE        = 0x1,
	SORT_CHINESE_PRC            = 0x2,
	SORT_CHINESE_BOPOMOFO       = 0x3,
	SORT_CHINESE_RADICALSTROKE  = 0x4,
	SORT_KOREAN_KSC             = 0x0,
	SORT_KOREAN_UNICODE         = 0x1,
	SORT_GERMAN_PHONE_BOOK      = 0x1,
	SORT_HUNGARIAN_DEFAULT      = 0x0,
	SORT_HUNGARIAN_TECHNICAL    = 0x1,
	SORT_GEORGIAN_TRADITIONAL   = 0x0,
	SORT_GEORGIAN_MODERN        = 0x1,
}

pure nothrow
WORD MAKELANGID(USHORT p, USHORT s)
{
	return cast(USHORT)(s << 10) | p;
}

pure nothrow
WORD PRIMARYLANGID(WORD lgid)
{
	return lgid & 0x3ff;
}

pure nothrow
WORD SUBLANGID(WORD lgid)
{
	return cast(WORD)(lgid >> 10);
}

enum NLS_VALID_LOCALE_MASK = 0x000fffff;

pure nothrow
DWORD MAKELCID(WORD lgid, WORD srtid)
{
	return ((cast(DWORD)srtid) << 16) | (cast(DWORD)lgid);
}

pure nothrow
DWORD MAKESORTLCID(WORD lgid, WORD srtid, WORD ver)
{
	return (cast(DWORD)MAKELCID(lgid, srtid)) | ((cast(DWORD)ver) << 20);
}

pure nothrow
WORD LANGIDFROMLCID(LCID lcid)
{
	return cast(WORD)lcid;
}

pure nothrow
WORD SORTIDFROMLCID(LCID lcid)
{
	return cast(WORD)(((cast(DWORD)lcid) >> 16) & 0xf);
}

pure nothrow
WORD SORTVERSIONFROMLCID(LCID lcid)
{
	return cast(WORD)(((cast(DWORD)lcid) >> 20) & 0xf);
}

enum LOCALE_NAME_MAX_LENGTH = 85;

enum {
	LANG_SYSTEM_DEFAULT = MAKELANGID(LANG_NEUTRAL, SUBLANG_SYS_DEFAULT),
	LANG_USER_DEFAULT   = MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT),
}

enum {
	LOCALE_SYSTEM_DEFAULT = MAKELCID(LANG_SYSTEM_DEFAULT, SORT_DEFAULT),
	LOCALE_USER_DEFAULT   = MAKELCID(LANG_USER_DEFAULT, SORT_DEFAULT),

	LOCALE_CUSTOM_DEFAULT     = MAKELCID(MAKELANGID(LANG_NEUTRAL, SUBLANG_CUSTOM_DEFAULT), SORT_DEFAULT),
	LOCALE_CUSTOM_UNSPECIFIED = MAKELCID(MAKELANGID(LANG_NEUTRAL, SUBLANG_CUSTOM_UNSPECIFIED), SORT_DEFAULT),
	LOCALE_CUSTOM_UI_DEFAULT  = MAKELCID(MAKELANGID(LANG_NEUTRAL, SUBLANG_UI_CUSTOM_DEFAULT), SORT_DEFAULT),
	LOCALE_NEUTRAL            = MAKELCID(MAKELANGID(LANG_NEUTRAL, SUBLANG_NEUTRAL), SORT_DEFAULT),
	LOCALE_INVARIANT          = MAKELCID(MAKELANGID(LANG_INVARIANT, SUBLANG_NEUTRAL), SORT_DEFAULT),
}

enum {
	//STATUS_WAIT_0                     = 0x00000000, at ntstatus.
	//STATUS_ABANDONED_WAIT_0           = 0x00000080,
	//STATUS_USER_APC                   = 0x000000C0,
	STATUS_TIMEOUT                    = 0x00000102,
	//STATUS_PENDING                    = 0x00000103,
	DBG_EXCEPTION_HANDLED             = 0x00010001,
	DBG_CONTINUE                      = 0x00010002,
	STATUS_SEGMENT_NOTIFICATION       = 0x40000005,
	DBG_TERMINATE_THREAD              = 0x40010003,
	DBG_TERMINATE_PROCESS             = 0x40010004,
	DBG_CONTROL_C                     = 0x40010005,
	DBG_PRINTEXCEPTION_C              = 0x40010006,
	DBG_RIPEXCEPTION                  = 0x40010007,
	DBG_CONTROL_BREAK                 = 0x40010008,
	DBG_COMMAND_EXCEPTION             = 0x40010009,
	//STATUS_GUARD_PAGE_VIOLATION       = 0x80000001,
	//STATUS_DATATYPE_MISALIGNMENT      = 0x80000002,
	//STATUS_BREAKPOINT                 = 0x80000003,
	//STATUS_SINGLE_STEP                = 0x80000004,
	STATUS_LONGJUMP                   = 0x80000026,
	STATUS_UNWIND_CONSOLIDATE         = 0x80000029,
	DBG_EXCEPTION_NOT_HANDLED         = 0x80010001,
	//STATUS_ACCESS_VIOLATION           = 0xC0000005,
	//STATUS_IN_PAGE_ERROR              = 0xC0000006,
	//STATUS_INVALID_HANDLE             = 0xC0000008,
	STATUS_INVALID_PARAMETER          = 0xC000000D,
	STATUS_NO_MEMORY                  = 0xC0000017,
	//STATUS_ILLEGAL_INSTRUCTION        = 0xC000001D,
	//STATUS_NONCONTINUABLE_EXCEPTION   = 0xC0000025,
	//STATUS_INVALID_DISPOSITION        = 0xC0000026,
	//STATUS_ARRAY_BOUNDS_EXCEEDED      = 0xC000008C,
	//STATUS_FLOAT_DENORMAL_OPERAND     = 0xC000008D,
	//STATUS_FLOAT_DIVIDE_BY_ZERO       = 0xC000008E,
	//STATUS_FLOAT_INEXACT_RESULT       = 0xC000008F,
	//STATUS_FLOAT_INVALID_OPERATION    = 0xC0000090,
	//STATUS_FLOAT_OVERFLOW             = 0xC0000091,
	//STATUS_FLOAT_STACK_CHECK          = 0xC0000092,
	//STATUS_FLOAT_UNDERFLOW            = 0xC0000093,
	//STATUS_INTEGER_DIVIDE_BY_ZERO     = 0xC0000094,
	//STATUS_INTEGER_OVERFLOW           = 0xC0000095,
	//STATUS_PRIVILEGED_INSTRUCTION     = 0xC0000096,
	//STATUS_STACK_OVERFLOW             = 0xC00000FD,
	STATUS_DLL_NOT_FOUND              = 0xC0000135,
	STATUS_ORDINAL_NOT_FOUND          = 0xC0000138,
	STATUS_ENTRYPOINT_NOT_FOUND       = 0xC0000139,
	//STATUS_CONTROL_C_EXIT             = 0xC000013A,
	STATUS_DLL_INIT_FAILED            = 0xC0000142,
	STATUS_FLOAT_MULTIPLE_FAULTS      = 0xC00002B4,
	STATUS_FLOAT_MULTIPLE_TRAPS       = 0xC00002B5,
	STATUS_REG_NAT_CONSUMPTION        = 0xC00002C9,
	STATUS_STACK_BUFFER_OVERRUN       = 0xC0000409,
	STATUS_INVALID_CRUNTIME_PARAMETER = 0xC0000417,
	STATUS_ASSERTION_FAILURE          = 0xC0000420,

	STATUS_SXS_EARLY_DEACTIVATION     = 0xC015000F,
	STATUS_SXS_INVALID_DEACTIVATION   = 0xC0150010,
}

enum MAXIMUM_WAIT_OBJECTS = 64;

enum MAXIMUM_SUSPEND_COUNT = MAXCHAR;

alias ULONG_PTR KSPIN_LOCK;
alias KSPIN_LOCK* PKSPIN_LOCK;

align(16)
struct M128A {
	ULONGLONG Low;
	LONGLONG High;
}
alias M128A* PM128A;

align(16)
struct XSAVE_FORMAT {
	WORD ControlWord;
	WORD StatusWord;
	BYTE TagWord;
	BYTE Reserved1;
	WORD ErrorOpcode;
	DWORD ErrorOffset;
	WORD ErrorSelector;
	WORD Reserved2;
	DWORD DataOffset;
	WORD DataSelector;
	WORD Reserved3;
	DWORD MxCsr;
	DWORD MxCsr_Mask;
	M128A[8] FloatRegisters;
	version(Win64){
		M128A[16] XmmRegisters;
		BYTE[96] Reserved4;
	}else{
		M128A[8] XmmRegisters;
		BYTE[192] Reserved4;
		DWORD[7] StackControl;
		DWORD Cr0NpxState;
	}
}
alias XSAVE_FORMAT* PXSAVE_FORMAT;

align(8)
struct XSAVE_AREA_HEADER {
	DWORD64 Mask;
	DWORD64[7] Reserved;
}
alias XSAVE_AREA_HEADER* PXSAVE_AREA_HEADER;

align(16)
struct XSAVE_AREA {
	XSAVE_FORMAT LegacyState;
	XSAVE_AREA_HEADER Header;
}
alias XSAVE_AREA* PXSAVE_AREA;

struct XSTATE_CONTEXT {
	DWORD64 Mask;
	DWORD Length;
	DWORD Reserved1;
	PXSAVE_AREA Area;

	version(X86)
		DWORD Reserved2;
	PVOID Buffer;
	version(X86)
    	DWORD Reserved3;
}
alias XSTATE_CONTEXT* PXSTATE_CONTEXT;

enum XSAVE_ALIGN = 64;
enum MINIMAL_XSTATE_AREA_LENGTH = XSAVE_AREA.sizeof;

struct CONTEXT_CHUNK {
	LONG Offset;
	DWORD Length;
}
alias CONTEXT_CHUNK* PCONTEXT_CHUNK;

struct CONTEXT_EX {
	CONTEXT_CHUNK All;
	CONTEXT_CHUNK Legacy;
	CONTEXT_CHUNK XState;
}
alias CONTEXT_EX* PCONTEXT_EX;

enum CONTEXT_EX_LENGTH = CONTEXT_EX.sizeof;

static assert((XSAVE_FORMAT.sizeof & (XSAVE_ALIGN - 1)) == 0);
static assert((XSAVE_AREA.Header.offsetof & (XSAVE_ALIGN - 1)) == 0);

static assert(MINIMAL_XSTATE_AREA_LENGTH == 512 + 64);

version(all){ //_AMD64_
	version(X86_64){
		extern(C){
			alias _bittest BitTest;
			alias _bittestandcomplement BitTestAndComplement;
			alias _bittestandset BitTestAndSet;
			alias _bittestandreset BitTestAndReset;
			alias _interlockedbittestandset InterlockedBitTestAndSet;
			alias _interlockedbittestandreset InterlockedBitTestAndReset;

			alias _bittest64 BitTest64;
			alias _bittestandcomplement64 BitTestAndComplement64;
			alias _bittestandset64 BitTestAndSet64;
			alias _bittestandreset64 BitTestAndReset64;
			alias _interlockedbittestandset64 InterlockedBitTestAndSet64;
			alias _interlockedbittestandreset64 InterlockedBitTestAndReset64;

			BOOLEAN _bittest(LONG* Base, LONG Offset);
			BOOLEAN _bittestandcomplement(LONG* Base, LONG Offset);
			BOOLEAN _bittestandset(LONG* Base, LONG Offset);
			BOOLEAN _bittestandreset(LONG* Base, LONG Offset);
			BOOLEAN _interlockedbittestandset(LONG* Base, LONG Offset);
			BOOLEAN _interlockedbittestandreset(LONG* Base, LONG Offset);
			BOOLEAN _bittest64(LONG64* Base, LONG64 Offset);
			BOOLEAN _bittestandcomplement64(LONG64* Base, LONG64 Offset);
			BOOLEAN _bittestandset64(LONG64* Base, LONG64 Offset);
			BOOLEAN _bittestandreset64(LONG64* Base, LONG64 Offset);
			BOOLEAN _interlockedbittestandset64(LONG64* Base, LONG64 Offset);
			BOOLEAN _interlockedbittestandreset64(LONG64* Base, LONG64 Offset);

			alias _BitScanForward BitScanForward;
			alias _BitScanReverse BitScanReverse;
			alias _BitScanForward64 BitScanForward64;
			alias _BitScanReverse64 BitScanReverse64;

			BOOLEAN _BitScanForward(DWORD* Index, DWORD Mask);
			BOOLEAN _BitScanReverse(DWORD* Index, DWORD Mask);
			BOOLEAN _BitScanForward64(DWORD* Index, DWORD64 Mask);
			BOOLEAN _BitScanReverse64(DWORD* Index, DWORD64 Mask);

			//alias _InterlockedIncrement16 InterlockedIncrement16;
			//alias _InterlockedDecrement16 InterlockedDecrement16;
			//alias _InterlockedCompareExchange16 InterlockedCompareExchange16;

			//alias _InterlockedAnd InterlockedAnd;
			//alias _InterlockedAnd InterlockedAndAcquire;
			//alias _InterlockedAnd InterlockedAndRelease;
			//alias _InterlockedOr InterlockedOr;
			//alias _InterlockedOr InterlockedOrAcquire;
			//alias _InterlockedOr InterlockedOrRelease;
			//alias _InterlockedXor InterlockedXor; intrinsic
			//alias _InterlockedIncrement InterlockedIncrement;
			//alias InterlockedIncrementAcquire InterlockedIncrementAcquire;
			//alias InterlockedIncrement InterlockedIncrementRelease;
			//alias _InterlockedDecrement InterlockedDecrement;
			//alias InterlockedDecrement InterlockedDecrementAcquire;
			//alias InterlockedDecrement InterlockedDecrementRelease;
			//alias _InterlockedAdd InterlockedAdd;
			//alias _InterlockedExchange InterlockedExchange;
			//alias _InterlockedExchangeAdd InterlockedExchangeAdd;
			//alias _InterlockedCompareExchange InterlockedCompareExchange;
			//alias InterlockedCompareExchange InterlockedCompareExchangeAcquire;
			//alias InterlockedCompareExchange InterlockedCompareExchangeRelease;

			//alias _InterlockedAnd64 InterlockedAnd64
			//alias _InterlockedAnd64 InterlockedAnd64Acquire;
			//alias _InterlockedAnd64 InterlockedAnd64Release;
			//alias InterlockedAnd64 InterlockedAndAffinity;
			//alias _InterlockedOr64 InterlockedOr64;
			//alias _InterlockedOr64 InterlockedOr64Acquire;
			//alias _InterlockedOr64 InterlockedOr64Release;
			//alias InterlockedOr64 InterlockedOrAffinity;
			//alias _InterlockedXor64 InterlockedXor64; intrinsic
			//alias _InterlockedIncrement64 InterlockedIncrement64;
			//alias _InterlockedDecrement64 InterlockedDecrement64;
			//alias _InterlockedAdd64 InterlockedAdd64;
			//alias _InterlockedExchange64 InterlockedExchange64;
			//alias InterlockedExchange64 InterlockedExchangeAcquire64;
			//alias _InterlockedExchangeAdd64 InterlockedExchangeAdd64;
			//alias _InterlockedCompareExchange64 InterlockedCompareExchange64;
			//alias InterlockedCompareExchange64 InterlockedCompareExchangeAcquire64;
			//alias InterlockedCompareExchange64 InterlockedCompareExchangeRelease64;

			//alias _InterlockedExchangePointer InterlockedExchangePointer;
			//alias _InterlockedCompareExchangePointer InterlockedCompareExchangePointer;
			//alias _InterlockedCompareExchangePointer InterlockedCompareExchangePointerAcquire;
			//alias _InterlockedCompareExchangePointer InterlockedCompareExchangePointerRelease;

			alias InterlockedExchangeAdd64 InterlockedExchangeAddSizeT;
			alias InterlockedIncrement64 InterlockedIncrementSizeT;
			alias InterlockedDecrement64 InterlockedDecrementSizeT;

			SHORT InterlockedIncrement16(SHORT* Addend);
			SHORT InterlockedDecrement16(SHORT* Addend);
			SHORT InterlockedCompareExchange16(SHORT* Destination, SHORT ExChange, SHORT Comperand);
			LONG InterlockedAnd(LONG* Destination, LONG Value);
			LONG InterlockedOr(LONG* Destination, LONG Value);
			LONG InterlockedXor(LONG* Destination, LONG Value);
			LONG64 InterlockedAnd64(LONG64* Destination, LONG64 Value);
			LONG64 InterlockedOr64(LONG64* Destination, LONG64 Value);
			LONG64 InterlockedXor64(LONG64* Destination, LONG64 Value);
			LONG InterlockedIncrement(LONG* Addend);
			LONG InterlockedDecrement(LONG* Addend);
			LONG InterlockedExchange(LONG* Target, LONG Value);
			LONG InterlockedExchangeAdd(LONG* Addend, LONG Value);

			// Not AMD64
			LONG InterlockedAdd(LONG* Addend, LONG Value)
			{
			    return InterlockedExchangeAdd(Addend, Value) + Value;
			}

			LONG InterlockedCompareExchange(LONG* Destination, LONG ExChange, LONG Comperand);
			LONG64 InterlockedIncrement64(LONG64* Addend);
			LONG64 InterlockedDecrement64(LONG64* Addend);
			LONG64 InterlockedExchange64(LONG64* Target, LONG64 Value);
			LONG64 InterlockedExchangeAdd64(LONG64* Addend, LONG64 Value);

			// Not AMD64
			LONG64 InterlockedAdd64(LONG64* Addend, LONG64 Value)
			{
			    return InterlockedExchangeAdd64(Addend, Value) + Value;
			}

			LONG64 InterlockedCompareExchange64(LONG64* Destination, LONG64 ExChange, LONG64 Comperand);
			PVOID InterlockedCompareExchangePointer(PVOID* Destination, PVOID Exchange, PVOID Comperand);
			PVOID InterlockedExchangePointer(PVOID*Target, PVOID Value);

			//alias _InterlockedAnd8 InterlockedAnd8;
			//alias _InterlockedOr8 InterlockedOr8;
			//alias _InterlockedXor8 InterlockedXor8;
			//alias _InterlockedAnd16 InterlockedAnd16;
			//alias _InterlockedOr16 InterlockedOr16;
			//alias _InterlockedXor16 InterlockedXor16;

			byte InterlockedAnd8(byte* Destination, byte Value);
			byte InterlockedOr8(byte* Destination, byte Value);
			byte InterlockedXor8 (byte* Destination, byte Value);
			SHORT InterlockedAnd16(SHORT* Destination, SHORT Value);
			SHORT InterlockedOr16(SHORT* Destination, SHORT Value);
			SHORT InterlockedXor16(SHORT* Destination, SHORT Value);

			alias _mm_clflush CacheLineFlush;

			VOID _mm_clflush(VOID* Address);

			VOID _ReadWriteBarrier();

			alias __faststorefence FastFence;
			alias _mm_lfence LoadFence;
			alias _mm_mfence MemoryFence;
			alias _mm_sfence StoreFence;

			VOID __faststorefence();
			VOID _mm_lfence();
			VOID _mm_mfence();
			VOID _mm_sfence();
			VOID _mm_pause();
			VOID _mm_prefetch(byte* a, int sel);
			VOID _m_prefetchw(VOID* Source);

			enum {
				_MM_HINT_T0  = 1,
				_MM_HINT_T1  = 2,
				_MM_HINT_T2  = 3,
				_MM_HINT_NTA = 0,
			}

			alias _mm_pause YieldProcessor;
			alias __faststorefence MemoryBarrier;
			void PreFetchCacheLine(int l, byte* a)
			{
				_mm_prefetch(a, l);
			}
			alias _m_prefetchw PrefetchForWrite;
			void* ReadForWriteAccess(void** p)
			{
				_m_prefetchw(p);
				return *p;
			}

			enum {
				PF_TEMPORAL_LEVEL_1       = _MM_HINT_T0,
				PF_TEMPORAL_LEVEL_2       = _MM_HINT_T1,
				PF_TEMPORAL_LEVEL_3       = _MM_HINT_T2,
				PF_NON_TEMPORAL_LEVEL_ALL = _MM_HINT_NTA,
			}

			alias _mm_getcsr ReadMxCsr;
			alias _mm_setcsr WriteMxCsr;

			uint _mm_getcsr();
			VOID _mm_setcsr(uint MxCsr);

			VOID __int2c();

			alias __int2c DbgRaiseAssertionFailure;

			alias __getcallerseflags GetCallersEflags;

			uint __getcallerseflags();

			alias __segmentlimit GetSegmentLimit;

			DWORD __segmentlimit(DWORD Selector);

			alias __readpmc ReadPMC;

			DWORD64 __readpmc(DWORD Counter);

			alias __rdtsc ReadTimeStampCounter;
			DWORD64 __rdtsc();

			VOID __movsb(PBYTE Destination, BYTE* Source, SIZE_T Count);
			VOID __movsw(PWORD Destination, WORD* Source, SIZE_T Count);
			VOID __movsd(PDWORD Destination, DWORD* Source, SIZE_T Count);
			VOID __movsq(PDWORD64 Destination, DWORD64* Source, SIZE_T Count);
			VOID __stosb(PBYTE Destination, BYTE Value, SIZE_T Count);
			VOID __stosw(PWORD Destination, WORD Value, SIZE_T Count);
			VOID __stosd(PDWORD Destination, DWORD Value, SIZE_T Count);
			VOID __stosq(PDWORD64 Destination, DWORD64 Value, SIZE_T Count);

			//alias __mulh MultiplyHigh;
			//alias __umulh UnsignedMultiplyHigh;

			LONGLONG MultiplyHigh(LONG64 Multiplier, LONG64 Multiplicand);
			ULONGLONG UnsignedMultiplyHigh(DWORD64 Multiplier, DWORD64 Multiplicand);

			//alias __shiftleft128 ShiftLeft128;
			//alias __shiftright128 ShiftRight128;

			DWORD64 ShiftLeft128(DWORD64 LowPart, DWORD64 HighPart, BYTE Shift);
			DWORD64 ShiftRight128(DWORD64 LowPart, DWORD64 HighPart, BYTE Shift);

			//alias _mul128 Multiply128;

			LONG64 Multiply128(LONG64 Multiplier, LONG64 Multiplicand, LONG64* HighProduct);

			//alias _umul128 UnsignedMultiply128;

			DWORD64 UnsignedMultiply128(DWORD64 Multiplier, DWORD64 Multiplicand, DWORD64* HighProduct);

			LONG64 MultiplyExtract128(LONG64 Multiplier, LONG64 Multiplicand, BYTE Shift)
			{
				LONG64 extractedProduct;
				LONG64 highProduct;
				LONG64 lowProduct;
				BOOLEAN negate;
				DWORD64 uhighProduct;
				DWORD64 ulowProduct;

				lowProduct = Multiply128(Multiplier, Multiplicand, &highProduct);
				negate = FALSE;
				uhighProduct = cast(DWORD64)highProduct;
				ulowProduct = cast(DWORD64)lowProduct;
				if(highProduct < 0){
					negate = TRUE;
					uhighProduct = cast(DWORD64)(-highProduct);
					ulowProduct = cast(DWORD64)(-lowProduct);
					if(ulowProduct != 0){
						uhighProduct -= 1;
					}
				}

				extractedProduct = cast(LONG64)ShiftRight128(ulowProduct, uhighProduct, Shift);
				if(negate != FALSE){
					extractedProduct = -extractedProduct;
				}

				return extractedProduct;
			}

			DWORD64 UnsignedMultiplyExtract128(DWORD64 Multiplier, DWORD64 Multiplicand, BYTE Shift)
			{
				DWORD64 extractedProduct;
				DWORD64 highProduct;
				DWORD64 lowProduct;

				lowProduct = UnsignedMultiply128(Multiplier, Multiplicand, &highProduct);
				extractedProduct = ShiftRight128(lowProduct, highProduct, Shift);
				return extractedProduct;
			}

			BYTE __readgsbyte(DWORD Offset);
			WORD __readgsword(DWORD Offset);
			DWORD __readgsdword(DWORD Offset);
			DWORD64 __readgsqword(DWORD Offset);
			VOID __writegsbyte(DWORD Offset, BYTE Data);
			VOID __writegsword(DWORD Offset, WORD Data);
			VOID __writegsdword(DWORD Offset, DWORD Data);
			VOID __writegsqword(DWORD Offset, DWORD64 Data);

			VOID __incgsbyte(DWORD Offset);
			VOID __addgsbyte(DWORD Offset, BYTE Value);
			VOID __incgsword(DWORD Offset);
			VOID __addgsword(DWORD Offset, WORD Value);
			VOID __incgsdword(DWORD Offset);
			VOID __addgsdword(DWORD Offset, DWORD Value);
			VOID __incgsqword(DWORD Offset);
			VOID __addgsqword(DWORD Offset, DWORD64 Value);
		} // extern(C)
	} // version(X86_64)

	enum {
		EXCEPTION_READ_FAULT    = 0,
		EXCEPTION_WRITE_FAULT   = 1,
		EXCEPTION_EXECUTE_FAULT = 8,
	}

	enum {
		CONTEXT_AMD64               = 0x100000,
		CONTEXT_CONTROL             = CONTEXT_AMD64 | 0x1,
		CONTEXT_INTEGER             = CONTEXT_AMD64 | 0x2,
		CONTEXT_SEGMENTS            = CONTEXT_AMD64 | 0x4,
		CONTEXT_FLOATING_POINT      = CONTEXT_AMD64 | 0x8,
		CONTEXT_DEBUG_REGISTERS     = CONTEXT_AMD64 | 0x10,
		CONTEXT_FULL                = CONTEXT_CONTROL | CONTEXT_INTEGER | CONTEXT_FLOATING_POINT,
		CONTEXT_ALL                 = CONTEXT_CONTROL | CONTEXT_INTEGER | CONTEXT_SEGMENTS | CONTEXT_FLOATING_POINT | CONTEXT_DEBUG_REGISTERS,
		CONTEXT_XSTATE              = CONTEXT_AMD64 | 0x20,
		CONTEXT_EXCEPTION_ACTIVE    = 0x8000000,
		CONTEXT_SERVICE_ACTIVE      = 0x10000000,
		CONTEXT_EXCEPTION_REQUEST   = 0x40000000,
		CONTEXT_EXCEPTION_REPORTING = 0x80000000,
	}

	enum {
		INITIAL_MXCSR = 0x1f80,
		INITIAL_FPCSR = 0x027f,
	}

	alias XSAVE_FORMAT XMM_SAVE_AREA32;
	alias XSAVE_FORMAT* PXMM_SAVE_AREA32;

	align(16)
	struct CONTEXT {
		DWORD64 P1Home;
		DWORD64 P2Home;
		DWORD64 P3Home;
		DWORD64 P4Home;
		DWORD64 P5Home;
		DWORD64 P6Home;

		DWORD ContextFlags;
		DWORD MxCsr;

		WORD SegCs;
		WORD SegDs;
		WORD SegEs;
		WORD SegFs;
		WORD SegGs;
		WORD SegSs;
		DWORD EFlags;

		DWORD64 Dr0;
		DWORD64 Dr1;
		DWORD64 Dr2;
		DWORD64 Dr3;
		DWORD64 Dr6;
		DWORD64 Dr7;

		DWORD64 Rax;
		DWORD64 Rcx;
		DWORD64 Rdx;
		DWORD64 Rbx;
		DWORD64 Rsp;
		DWORD64 Rbp;
		DWORD64 Rsi;
		DWORD64 Rdi;
		DWORD64 R8;
		DWORD64 R9;
		DWORD64 R10;
		DWORD64 R11;
		DWORD64 R12;
		DWORD64 R13;
		DWORD64 R14;
		DWORD64 R15;

		DWORD64 Rip;

		union {
			XMM_SAVE_AREA32 FltSave;
			struct {
				M128A[2] Header;
				M128A[8] Legacy;
				M128A Xmm0;
				M128A Xmm1;
				M128A Xmm2;
				M128A Xmm3;
				M128A Xmm4;
				M128A Xmm5;
				M128A Xmm6;
				M128A Xmm7;
				M128A Xmm8;
				M128A Xmm9;
				M128A Xmm10;
				M128A Xmm11;
				M128A Xmm12;
				M128A Xmm13;
				M128A Xmm14;
				M128A Xmm15;
			}
		}

		M128A[26] VectorRegister;
		DWORD64 VectorControl;

		DWORD64 DebugControl;
		DWORD64 LastBranchToRip;
		DWORD64 LastBranchFromRip;
		DWORD64 LastExceptionToRip;
		DWORD64 LastExceptionFromRip;
	}
	alias CONTEXT* PCONTEXT;

	enum RUNTIME_FUNCTION_INDIRECT = 0x1;

	struct RUNTIME_FUNCTION {
		DWORD BeginAddress;
		DWORD EndAddress;
		DWORD UnwindData;
	}
	alias RUNTIME_FUNCTION* PRUNTIME_FUNCTION;

	enum UNWIND_HISTORY_TABLE_SIZE = 12;

	struct UNWIND_HISTORY_TABLE_ENTRY {
		DWORD64 ImageBase;
		PRUNTIME_FUNCTION FunctionEntry;
	}
	alias UNWIND_HISTORY_TABLE_ENTRY* PUNWIND_HISTORY_TABLE_ENTRY;

	struct UNWIND_HISTORY_TABLE {
		DWORD Count;
		BYTE LocalHint;
		BYTE GlobalHint;
		BYTE Search;
		BYTE Once;
		DWORD64 LowAddress;
		DWORD64 HighAddress;
		UNWIND_HISTORY_TABLE_ENTRY[UNWIND_HISTORY_TABLE_SIZE] Entry;
	}
	alias UNWIND_HISTORY_TABLE PUNWIND_HISTORY_TABLE;

	alias extern(Windows) PRUNTIME_FUNCTION function(DWORD64 ControlPc, PVOID Context) GET_RUNTIME_FUNCTION_CALLBACK;
	alias GET_RUNTIME_FUNCTION_CALLBACK* PGET_RUNTIME_FUNCTION_CALLBACK;

	alias DWORD function(HANDLE Process, PVOID TableAddress, PDWORD Entries, PRUNTIME_FUNCTION* Functions) OUT_OF_PROCESS_FUNCTION_TABLE_CALLBACK;
	alias OUT_OF_PROCESS_FUNCTION_TABLE_CALLBACK POUT_OF_PROCESS_FUNCTION_TABLE_CALLBACK;

	immutable char[] OUT_OF_PROCESS_FUNCTION_TABLE_CALLBACK_EXPORT_NAME = "OutOfProcessFunctionTableCallback\0";

	export extern(C)
	VOID RtlRestoreContext(PCONTEXT ContextRecord, EXCEPTION_RECORD* ExceptionRecord);

	export extern(C)
	BOOLEAN RtlAddFunctionTable(PRUNTIME_FUNCTION FunctionTable, DWORD EntryCount, DWORD64 BaseAddress);

	export extern(Windows)
	PRUNTIME_FUNCTION RtlLookupFunctionEntry(DWORD64 ControlPc, PDWORD64 ImageBase, PUNWIND_HISTORY_TABLE HistoryTable);


	struct KNONVOLATILE_CONTEXT_POINTERS {
		union {
			PM128A[16] FloatingContext;
			struct {
				PM128A Xmm0;
				PM128A Xmm1;
				PM128A Xmm2;
				PM128A Xmm3;
				PM128A Xmm4;
				PM128A Xmm5;
				PM128A Xmm6;
				PM128A Xmm7;
				PM128A Xmm8;
				PM128A Xmm9;
				PM128A Xmm10;
				PM128A Xmm11;
				PM128A Xmm12;
				PM128A Xmm13;
				PM128A Xmm14;
				PM128A Xmm15;
			}
		}

		union {
			PDWORD64[16] IntegerContext;
			struct {
				PDWORD64 Rax;
				PDWORD64 Rcx;
				PDWORD64 Rdx;
				PDWORD64 Rbx;
				PDWORD64 Rsp;
				PDWORD64 Rbp;
				PDWORD64 Rsi;
				PDWORD64 Rdi;
				PDWORD64 R8;
				PDWORD64 R9;
				PDWORD64 R10;
				PDWORD64 R11;
				PDWORD64 R12;
				PDWORD64 R13;
				PDWORD64 R14;
				PDWORD64 R15;
			}
		}

	}
	alias KNONVOLATILE_CONTEXT_POINTERS* PKNONVOLATILE_CONTEXT_POINTERS;

	export extern(Windows)
	PEXCEPTION_ROUTINE RtlVirtualUnwind(DWORD HandlerType, DWORD64 ImageBase, DWORD64 ControlPc, PRUNTIME_FUNCTION FunctionEntry, PCONTEXT ContextRecord, PVOID* HandlerData, PDWORD64 EstablisherFrame, PKNONVOLATILE_CONTEXT_POINTERS ContextPointers);
	export extern(C)
	BOOLEAN RtlInstallFunctionTableCallback(DWORD64 TableIdentifier, DWORD64 BaseAddress, DWORD Length, PGET_RUNTIME_FUNCTION_CALLBACK Callback, PVOID Context, PCWSTR OutOfProcessCallbackDll);
	export extern(C)
	BOOLEAN RtlDeleteFunctionTable(PRUNTIME_FUNCTION FunctionTable);

} // version() _AMD64_


version(X86){
	extern(C){
		alias _bittest BitTest;
		alias _bittestandcomplement BitTestAndComplement;
		alias _bittestandset BitTestAndSet;
		alias _bittestandreset BitTestAndReset;
		alias _interlockedbittestandset InterlockedBitTestAndSet;
		alias _interlockedbittestandreset InterlockedBitTestAndReset;

		BOOLEAN _bittest(LONG* Base, LONG Offset);
		BOOLEAN _bittestandcomplement(LONG* Base, LONG Offset);
		BOOLEAN _bittestandset(LONG* Base, LONG Offset);
		BOOLEAN _bittestandreset(LONG* Base, LONG Offset);
		BOOLEAN _interlockedbittestandset(LONG* Base, LONG Offset);
		BOOLEAN _interlockedbittestandreset(LONG* Base, LONG Offset);

		alias _BitScanForward BitScanForward;
		alias _BitScanReverse BitScanReverse;

		BOOLEAN _BitScanForward(DWORD* Index, DWORD Mask);
		BOOLEAN _BitScanReverse(DWORD* Index, DWORD Mask);

		alias _InterlockedAnd16 InterlockedAnd16;
		alias _InterlockedCompareExchange16 InterlockedCompareExchange16;
		alias _InterlockedOr16 InterlockedOr16;

		SHORT _InterlockedAnd16(SHORT* Destination, SHORT Value);
		SHORT _InterlockedCompareExchange16(SHORT* Destination, SHORT ExChange, SHORT Comperand);
		SHORT _InterlockedOr16(SHORT* Destination, SHORT Value);

		BOOLEAN InterlockedBitTestAndComplement(LONG* Base, LONG Bit)
		{
			asm{
				mov EAX, Bit;
				mov ECX, Base;
				lock;
				btc [ECX], EAX;
				setc AL;
			}
		}

		BYTE __readfsbyte(DWORD Offset);
		WORD __readfsword(DWORD Offset);
		DWORD __readfsdword(DWORD Offset);
		VOID __writefsbyte(DWORD Offset, BYTE  Data);
		VOID __writefsword(DWORD Offset, WORD Data);
		VOID __writefsdword(DWORD Offset, DWORD Data);

		VOID __incfsbyte(DWORD Offset);
		VOID __addfsbyte(DWORD Offset, BYTE Value);
		VOID __incfsword(DWORD Offset);
		VOID __addfsword(DWORD Offset, WORD Value);
		VOID __incfsdword(DWORD Offset);
		VOID __addfsdword(DWORD Offset, DWORD Value);

		VOID _mm_pause();

		alias _mm_pause YieldProcessor;
	} // extern(C)

	VOID MemoryBarrier()
	{
		LONG Barrier;
		asm {
			xchg Barrier, EAX;
		}
	}


	alias __readpmc ReadPMC;

	DWORD64 __readpmc(DWORD Counter);

	alias __rdtsc ReadTimeStampCounter;

	DWORD64 __rdtsc();

	VOID __int2c ();

	alias __int2c DbgRaiseAssertionFailure;

	PVOID GetFiberData()
	{
		return *cast(PVOID*)cast(ULONG_PTR) __readfsdword(0x10);
	}

	PVOID GetCurrentFiber()
	{
		return cast(PVOID)cast(ULONG_PTR)__readfsdword (0x10);
	}

	enum {
		EXCEPTION_READ_FAULT    = 0,
		EXCEPTION_WRITE_FAULT   = 1,
		EXCEPTION_EXECUTE_FAULT = 8,
	}

	enum SIZE_OF_80387_REGISTERS = 80;

	enum {
		CONTEXT_i386               = 0x00010000,
		CONTEXT_i486               = 0x00010000,
		CONTEXT_CONTROL            = CONTEXT_i386 | 0x00000001,
		CONTEXT_INTEGER            = CONTEXT_i386 | 0x00000002,
		CONTEXT_SEGMENTS           = CONTEXT_i386 | 0x00000004,
		CONTEXT_FLOATING_POINT     = CONTEXT_i386 | 0x00000008,
		CONTEXT_DEBUG_REGISTERS    = CONTEXT_i386 | 0x00000010,
		CONTEXT_EXTENDED_REGISTERS = CONTEXT_i386 | 0x00000020,
		CONTEXT_FULL               = CONTEXT_CONTROL | CONTEXT_INTEGER | CONTEXT_SEGMENTS,
		CONTEXT_ALL                = CONTEXT_CONTROL | CONTEXT_INTEGER | CONTEXT_SEGMENTS | CONTEXT_FLOATING_POINT | CONTEXT_DEBUG_REGISTERS | CONTEXT_EXTENDED_REGISTERS,
		CONTEXT_XSTATE             = CONTEXT_i386 | 0x00000040,
	}

	struct FLOATING_SAVE_AREA {
		DWORD ControlWord;
		DWORD StatusWord;
		DWORD TagWord;
		DWORD ErrorOffset;
		DWORD ErrorSelector;
		DWORD DataOffset;
		DWORD DataSelector;
		BYTE[SIZE_OF_80387_REGISTERS] RegisterArea;
		DWORD Cr0NpxState;
	}
	alias FLOATING_SAVE_AREA* PFLOATING_SAVE_AREA;

	enum MAXIMUM_SUPPORTED_EXTENSION = 512;

	static assert(XSAVE_FORMAT.sizeof == MAXIMUM_SUPPORTED_EXTENSION);

	align(4)
	struct CONTEXT {
		DWORD ContextFlags;

		DWORD Dr0;
		DWORD Dr1;
		DWORD Dr2;
		DWORD Dr3;
		DWORD Dr6;
		DWORD Dr7;

		FLOATING_SAVE_AREA FloatSave;

		DWORD SegGs;
		DWORD SegFs;
		DWORD SegEs;
		DWORD SegDs;

		DWORD  Edi;
		DWORD  Esi;
		DWORD  Ebx;
		DWORD  Edx;
		DWORD  Ecx;
		DWORD  Eax;

		DWORD Ebp;
		DWORD Eip;
		DWORD SegCs;
		DWORD EFlags;
		DWORD Esp;
		DWORD SegSs;

		BYTE[MAXIMUM_SUPPORTED_EXTENSION] ExtendedRegisters;
	}
	alias CONTEXT* PCONTEXT;
} // version(X86)

struct LDT_ENTRY {
	WORD LimitLow;
	WORD BaseLow;
	union {
		struct {
			BYTE    BaseMid;
			BYTE    Flags1;     // Declare as bytes to avoid alignment
			BYTE    Flags2;     // Problems.
			BYTE    BaseHi;
		}
		uint Bits; // not supported bit field.
	}
}
alias LDT_ENTRY* PLDT_ENTRY;

version(none){ // Intel64
	extern(C){
		alias _bittest BitTest;
		alias _bittestandcomplement BitTestAndComplement;
		alias _bittestandset BitTestAndSet;
		alias _bittestandreset BitTestAndReset;

		alias _bittest64 BitTest64;
		alias _bittestandcomplement64 BitTestAndComplement64;
		alias _bittestandset64 BitTestAndSet64;
		alias _bittestandreset64 BitTestAndReset64;

		BOOLEAN _bittest(LONG* Base, LONG Offset);
		BOOLEAN _bittestandcomplement(LONG* Base, LONG Offset);
		BOOLEAN _bittestandset(LONG* Base, LONG Offset);
		BOOLEAN _bittestandreset(LONG* Base, LONG Offset);
		BOOLEAN _bittest64(LONG64* Base, LONG64 Offset);
		BOOLEAN _bittestandcomplement64(LONG64* Base, LONG64 Offset);
		BOOLEAN _bittestandset64(LONG64* Base, LONG64 Offset);
		BOOLEAN _bittestandreset64(LONG64* Base, LONG64 Offset);

		alias BitScanForward _BitScanForward;
		alias BitScanReverse _BitScanReverse;
		alias BitScanForward64 _BitScanForward64;
		alias BitScanReverse64 _BitScanReverse64;

		BOOLEAN _BitScanForward(DWORD* Index, DWORD Mask);
		BOOLEAN _BitScanReverse(DWORD* Index, DWORD Mask);
		BOOLEAN _BitScanForward64(DWORD* Index, DWORD64 Mask);
		BOOLEAN _BitScanReverse64(DWORD* Index, DWORD64 Mask);

		alias _InterlockedCompareExchange16 InterlockedCompareExchange16;

		SHORT _InterlockedCompareExchange16(SHORT* Destination, SHORT ExChange, SHORT Comperand);
	} // extern(C)

	alias _InterlockedAdd InterlockedAdd;
	alias _InterlockedAdd_acq InterlockedAddAcquire;
	alias _InterlockedAdd_rel InterlockedAddRelease;

	alias _InterlockedIncrement InterlockedIncrement;
	alias _InterlockedIncrement_acq InterlockedIncrementAcquire;
	alias _InterlockedIncrement_rel InterlockedIncrementRelease;

	alias _InterlockedDecrement InterlockedDecrement;
	alias _InterlockedDecrement_acq InterlockedDecrementAcquire;
	alias _InterlockedDecrement_rel InterlockedDecrementRelease;

	alias _InterlockedExchange InterlockedExchange;
	alias _InterlockedExchange_acq InterlockedExchangeAcquire;

	alias _InterlockedExchangeAdd InterlockedExchangeAdd;
	alias _InterlockedExchangeAdd_acq InterlockedExchangeAddAcquire;
	alias _InterlockedExchangeAdd_rel InterlockedExchangeAddRelease;

	alias _InterlockedAdd64 InterlockedAdd64;
	alias _InterlockedAdd64_acq InterlockedAddAcquire64;
	alias _InterlockedAdd64_rel InterlockedAddRelease64;

	alias _InterlockedIncrement64 InterlockedIncrement64;
	alias _InterlockedIncrement64_acq InterlockedIncrementAcquire64;
	alias _InterlockedIncrement64_rel InterlockedIncrementRelease64;

	alias _InterlockedDecrement64 InterlockedDecrement64;
	alias _InterlockedDecrement64_acq InterlockedDecrementAcquire64;
	alias _InterlockedDecrement64_rel InterlockedDecrementRelease64;

	alias _InterlockedExchange64 InterlockedExchange64;
	alias _InterlockedExchange64_acq InterlockedExchangeAcquire64;

	alias _InterlockedExchangeAdd64 InterlockedExchangeAdd64;
	alias _InterlockedExchangeAdd64_acq InterlockedExchangeAddAcquire64;
	alias _InterlockedExchangeAdd64_rel InterlockedExchangeAddRelease64;

	alias _InterlockedCompareExchange64 InterlockedCompareExchange64;
	alias _InterlockedCompareExchange64_acq InterlockedCompareExchangeAcquire64;
	alias _InterlockedCompareExchange64_rel InterlockedCompareExchangeRelease64;

	alias _InterlockedCompare64Exchange128 InterlockedCompare64Exchange128;
	alias _InterlockedCompare64Exchange128_acq InterlockedCompare64ExchangeAcquire128;
	alias _InterlockedCompare64Exchange128_rel InterlockedCompare64ExchangeRelease128;

	alias _InterlockedCompareExchange InterlockedCompareExchange;
	alias _InterlockedCompareExchange_acq InterlockedCompareExchangeAcquire;
	alias _InterlockedCompareExchange_rel InterlockedCompareExchangeRelease;

	alias _InterlockedExchangePointer InterlockedExchangePointer;
	alias _InterlockedExchangePointer_acq InterlockedExchangePointerAcquire;

	alias _InterlockedCompareExchangePointer InterlockedCompareExchangePointer;
	alias _InterlockedCompareExchangePointer_rel InterlockedCompareExchangePointerRelease;
	alias _InterlockedCompareExchangePointer_acq InterlockedCompareExchangePointerAcquire;

	alias InterlockedExchangeAdd64 InterlockedExchangeAddSizeT;
	alias InterlockedIncrement64 InterlockedIncrementSizeT;
	alias InterlockedDecrement64 InterlockedDecrementSizeT;

	alias _InterlockedOr InterlockedOr;
	alias _InterlockedOr_acq InterlockedOrAcquire;
	alias _InterlockedOr_rel InterlockedOrRelease;
	alias _InterlockedOr8 InterlockedOr8;
	alias _InterlockedOr8_acq InterlockedOr8Acquire;
	alias _InterlockedOr8_rel InterlockedOr8Release;
	alias _InterlockedOr16 InterlockedOr16;
	alias _InterlockedOr16_acq InterlockedOr16Acquire;
	alias _InterlockedOr16_rel InterlockedOr16Release;
	alias _InterlockedOr64 InterlockedOr64;
	alias _InterlockedOr64_acq InterlockedOr64Acquire;
	alias _InterlockedOr64_rel InterlockedOr64Release;
	alias _InterlockedXor InterlockedXor;
	alias _InterlockedXor_acq InterlockedXorAcquire;
	alias _InterlockedXor_rel InterlockedXorRelease;
	alias _InterlockedXor8 InterlockedXor8;
	alias _InterlockedXor8_acq InterlockedXor8Acquire;
	alias _InterlockedXor8_rel InterlockedXor8Release;
	alias _InterlockedXor16 InterlockedXor16;
	alias _InterlockedXor16_acq InterlockedXor16Acquire;
	alias _InterlockedXor16_rel InterlockedXor16Release;
	alias _InterlockedXor64 InterlockedXor64;
	alias _InterlockedXor64_acq InterlockedXor64Acquire;
	alias _InterlockedXor64_rel InterlockedXor64Release;
	alias _InterlockedAnd InterlockedAnd;
	alias _InterlockedAnd_acq InterlockedAndAcquire;
	alias _InterlockedAnd_rel InterlockedAndRelease;
	alias _InterlockedAnd8 InterlockedAnd8;
	alias _InterlockedAnd8_acq InterlockedAnd8Acquire;
	alias _InterlockedAnd8_rel InterlockedAnd8Release;
	alias _InterlockedAnd16 InterlockedAnd16;
	alias _InterlockedAnd16_acq InterlockedAnd16Acquire;
	alias _InterlockedAnd16_rel InterlockedAnd16Release;
	alias _InterlockedAnd64 InterlockedAnd64;
	alias _InterlockedAnd64_acq InterlockedAnd64Acquire;
	alias _InterlockedAnd64_rel InterlockedAnd64Release;

	extern(C){
		LONG InterlockedAdd(LONG* Addend, LONG Value);
		LONG InterlockedAddAcquire(LONG* Addend, LONG Value);
		LONG InterlockedAddRelease(LONG* Addend, LONG Value);
		LONGLONG InterlockedAdd64(LONGLONG* Addend, LONGLONG Value);
		LONGLONG InterlockedAddAcquire64(LONGLONG* Addend, LONGLONG Value);
		LONGLONG InterlockedAddRelease64(LONGLONG* Addend, LONGLONG Value);
		LONG InterlockedIncrement(LONG* Addend);
		LONG InterlockedDecrement(LONG* Addend);
		LONG InterlockedIncrementAcquire(LONG* Addend);
		LONG InterlockedDecrementAcquire(LONG* Addend);
		LONG InterlockedIncrementRelease(LONG* Addend);
		LONG InterlockedDecrementRelease(LONG* Addend);
		LONG InterlockedExchange(LONG* Target, LONG Value);
		LONG InterlockedExchangeAcquire(LONG* Target, LONG Value);
		LONG InterlockedExchangeAdd(LONG* Addend, LONG Value);
		LONG InterlockedExchangeAddAcquire(LONG* Addend, LONG Value);
		LONG InterlockedExchangeAddRelease(LONG* Addend, LONG Value);
		LONG InterlockedCompareExchange(LONG* Destination, LONG ExChange, LONG Comperand);
		LONG InterlockedCompareExchangeRelease(LONG* Destination, LONG ExChange, LONG Comperand);
		LONG InterlockedCompareExchangeAcquire(LONG* Destination, LONG ExChange, LONG Comperand);
		LONGLONG InterlockedIncrement64(LONGLONG* Addend);
		LONGLONG InterlockedIncrementAcquire64(LONGLONG* Addend);
		LONGLONG InterlockedIncrementRelease64(LONGLONG* Addend);
		LONGLONG InterlockedDecrement64(LONGLONG* Addend);
		LONGLONG InterlockedDecrementAcquire64(LONGLONG* Addend);
		LONGLONG InterlockedDecrementRelease64(LONGLONG* Addend);
		LONGLONG InterlockedExchange64(LONGLONG* Target, LONGLONG Value);
		LONGLONG InterlockedExchangeAcquire64(LONGLONG* Target, LONGLONG Value);
		LONGLONG InterlockedExchangeAdd64(LONGLONG* Addend, LONGLONG Value);
		LONGLONG InterlockedExchangeAddAcquire64(LONGLONG* Addend, LONGLONG Value);
		LONGLONG InterlockedExchangeAddRelease64(LONGLONG* Addend, LONGLONG Value);
		LONGLONG InterlockedCompareExchange64(LONGLONG* Destination, LONGLONG ExChange, LONGLONG Comperand);
		LONGLONG InterlockedCompareExchangeAcquire64(LONGLONG* Destination, LONGLONG ExChange, LONGLONG Comperand);
		LONGLONG InterlockedCompareExchangeRelease64(LONGLONG* Destination, LONGLONG ExChange, LONGLONG Comperand);
		LONG64 InterlockedCompare64Exchange128(LONG64* Destination, LONG64 ExchangeHigh, LONG64 ExchangeLow, LONG64 Comperand);
		LONG64 InterlockedCompare64ExchangeAcquire128(LONG64* Destination, LONG64 ExchangeHigh, LONG64 ExchangeLow, LONG64 Comperand);
		LONG64 InterlockedCompare64ExchangeRelease128(LONG64* Destination, LONG64 ExchangeHigh, LONG64 ExchangeLow, LONG64 Comperand);
		PVOID InterlockedCompareExchangePointer(PVOID* Destination, PVOID Exchange, PVOID Comperand);
		PVOID InterlockedCompareExchangePointerAcquire(PVOID* Destination, PVOID Exchange, PVOID Comperand);
		PVOID InterlockedCompareExchangePointerRelease(PVOID* Destination, PVOID Exchange, PVOID Comperand);
		PVOID InterlockedExchangePointer(PVOID* Target, PVOID Value);
		PVOID InterlockedExchangePointerAcquire(PVOID* Target, PVOID Value);
		LONG InterlockedOr(LONG* Destination, LONG Value);
		LONG InterlockedOrAcquire(LONG* Destination, LONG Value);
		LONG InterlockedOrRelease(LONG* Destination, LONG Value);
		CHAR InterlockedOr8(CHAR* Destination, CHAR Value);
		CHAR InterlockedOr8Acquire(CHAR* Destination, CHAR Value);
		CHAR InterlockedOr8Release(CHAR* Destination, CHAR Value);
		SHORT InterlockedOr16(SHORT* Destination, SHORT Value);
		SHORT InterlockedOr16Acquire(SHORT* Destination, SHORT Value);
		SHORT InterlockedOr16Release(SHORT* Destination, SHORT Value);
		LONGLONG InterlockedOr64(LONGLONG* Destination, LONGLONG Value);
		LONGLONG InterlockedOr64Acquire(LONGLONG* Destination, LONGLONG Value);
		LONGLONG InterlockedOr64Release(LONGLONG* Destination, LONGLONG Value);
		LONG InterlockedXor(LONG* Destination, LONG Value);
		LONG InterlockedXorAcquire(LONG* Destination, LONG Value);
		LONG InterlockedXorRelease(LONG* Destination, LONG Value);
		CHAR InterlockedXor8(CHAR* Destination, CHAR Value);
		CHAR InterlockedXor8Acquire(CHAR* Destination, CHAR Value);
		CHAR InterlockedXor8Release(CHAR* Destination, CHAR Value);
		SHORT InterlockedXor16(SHORT* Destination, SHORT Value);
		SHORT InterlockedXor16Acquire(SHORT* Destination, SHORT Value);
		SHORT InterlockedXor16Release(SHORT* Destination, SHORT Value);
		LONGLONG InterlockedXor64(LONGLONG* Destination, LONGLONG Value);
		LONGLONG InterlockedXor64Acquire(LONGLONG* Destination, LONGLONG Value);
		LONGLONG InterlockedXor64Release(LONGLONG* Destination, LONGLONG Value);
		LONG InterlockedAnd(LONG* Destination, LONG Value);
		LONG InterlockedAndAcquire(LONG* Destination, LONG Value);
		LONG InterlockedAndRelease(LONG* Destination, LONG Value);
		CHAR InterlockedAnd8(CHAR* Destination, CHAR Value);
		CHAR InterlockedAnd8Acquire(CHAR* Destination, CHAR Value);
		CHAR InterlockedAnd8Release(CHAR* Destination, CHAR Value);
		SHORT InterlockedAnd16(SHORT* Destination, SHORT Value);
		SHORT InterlockedAnd16Acquire(SHORT* Destination, SHORT Value);
		SHORT InterlockedAnd16Release(SHORT* Destination, SHORT Value);
		LONGLONG InterlockedAnd64(LONGLONG* Destination, LONGLONG Value);
		LONGLONG InterlockedAnd64Acquire(LONGLONG* Destination, LONGLONG Value);
		LONGLONG InterlockedAnd64Release(LONGLONG* Destination, LONGLONG Value);

		LONGLONG InterlockedAnd64_Inline(LONGLONG* Destination, LONGLONG Value)
		{
			LONGLONG Old;

			do{
				Old = *Destination;
			}while(InterlockedCompareExchange64(Destination, Old & Value, Old) != Old);

			return Old;
		}
		alias InterlockedAnd64_Inline InterlockedAnd64;
		alias InterlockedAnd64 InterlockedAndAffinity;

		LONGLONG InterlockedOr64_Inline(LONGLONG* Destination, LONGLONG Value)
		{
			LONGLONG Old;

			do{
				Old = *Destination;
			}while(InterlockedCompareExchange64(Destination, Old | Value, Old) != Old);

			return Old;
		}
		alias InterlockedOr64_Inline InterlockedOr64;
		alias InterlockedOr64 InterlockedOrAffinity;

		LONGLONG InterlockedXor64_Inline(LONGLONG* Destination, LONGLONG Value)
		{
			LONGLONG Old;

			do{
				Old = *Destination;
			}while(InterlockedCompareExchange64(Destination, Old ^ Value, Old) != Old);

			return Old;
		}
		alias InterlockedXor64_Inline InterlockedXor64;

		BOOLEAN InterlockedBitTestAndSet_Inline(LONG* Base, LONG Bit)
		{
			LONG tBit;

			tBit = 1 << (Bit & ((*Base).sizeof * 8 - 1));
			return cast(BOOLEAN)((InterlockedOr(&Base[Bit / ((*Base).sizeof * 8)], tBit) & tBit) != 0);
		}
		alias InterlockedBitTestAndSet_Inline InterlockedBitTestAndSet;

		BOOLEAN InterlockedBitTestAndReset_Inline(LONG* Base, LONG Bit)
		{
			LONG tBit;

			tBit = 1 << (Bit & ((*Base).sizeof * 8 - 1));
			return cast(BOOLEAN)((InterlockedAnd(&Base[Bit / ((*Base).sizeof * 8)], ~tBit) & tBit) != 0);
		}
		alias InterlockedBitTestAndReset_Inline InterlockedBitTestAndReset;

		BOOLEAN InterlockedBitTestAndSet64_Inline(LONG64* Base, LONG64 Bit)
		{
			LONG64 tBit;

			tBit = 1L << (Bit & ((*Base).sizeof * 8 - 1));
			return cast(BOOLEAN)((InterlockedOr64(&Base[Bit / ((*Base).sizeof * 8)], tBit) & tBit) != 0);
		}
		alias InterlockedBitTestAndSet64_Inline InterlockedBitTestAndSet64;

		BOOLEAN InterlockedBitTestAndReset64_Inline(LONG64* Base, LONG64 Bit)
		{
			LONG64 tBit;

			tBit = 1L << (Bit & ((*Base).sieof * 8 - 1));
			return cast(BOOLEAN)((InterlockedAnd64(&Base[Bit / ((*Base).sizeof * 8)], ~tBit) & tBit) != 0);
		}
		alias InterlockedBitTestAndReset64_Inline InterlockedBitTestAndReset64;

		BOOLEAN InterlockedBitTestAndComplement_Inline(LONG* Base, LONG Bit)
		{
			LONG tBit;

			tBit = 1 << (Bit & ((*Base).sizeof * 8 - 1));
			return cast(BOOLEAN)((InterlockedXor(&Base[Bit / ((*Base).sizeof * 8)], tBit) & tBit) != 0);
		}
		alias InterlockedBitTestAndComplement_Inline InterlockedBitTestAndComplement;

		BOOLEAN InterlockedBitTestAndComplement64_Inline(LONG64* Base, LONG64 Bit)
		{
			LONG64 tBit;

			tBit = 1L << (Bit & ((*Base).sizeof * 8 - 1));
			return cast(BOOLEAN)((InterlockedXor64(&Base[Bit / ((*Base).sizeof * 8)], tBit) & tBit) != 0);
		}
		alias InterlockedBitTestAndComplement64_Inline InterlockedBitTestAndComplement64;
	} //extern C
} // version(none) _IA64_


version(none){ // _IA64_
	extern(C) void* _rdteb();
	extern(C) void* _rdtebex();

	version(none){ // _M_IA64
		TEB* NtCurrentTeb()
		{
			return cast(TEB*)_rdtebex();
		}

		PNT_TIB GetCurrentFiber()
		{
			 cast(PNT_TIB)(NtCurrentTeb().FiberData);
		}

		void* GetFiberData()
		{
			return  *(cast(PVOID*)GetCurrentFiber());
		}

		extern(C){
			void __break(int StIIM);

			enum {
				BREAK_DEBUG_BASE  = 0x080000,
				ASSERT_BREAKPOINT = BREAK_DEBUG_BASE + 3,
			}

			VOID DbgRaiseAssertionFailure()
			{
				__break(ASSERT_BREAKPOINT);
			}

			void __yield();
			void __mf();
			void __lfetch(int Level, VOID* Address);
			void __lfetchfault(int Level, VOID* Address);
			void __lfetch_excl(int Level, VOID* Address);
			void __lfetchfault_excl(int Level, VOID* Address);

			enum {
				MD_LFHINT_NONE = 0x00,
				MD_LFHINT_NT1  = 0x01,
				MD_LFHINT_NT2  = 0x02,
				MD_LFHINT_NTA  = 0x03,
			}

			//#define ReadTimeStampCounter() __getReg(3116)

			uint __getReg(int Number);

			alias __yield YieldProcessor;
			alias __mf MemoryBarrier;
			alias __lfetch PreFetchCacheLine;
			//#define PrefetchForWrite(p)
			//#define ReadForWriteAccess(p)   (__lfetch_excl(MD_LFHINT_NONE, (p)), (*(p)))

			enum {
				PF_TEMPORAL_LEVEL_1       = MD_LFHINT_NONE,
				PF_TEMPORAL_LEVEL_2       = MD_LFHINT_NT1,
				PF_TEMPORAL_LEVEL_3       = MD_LFHINT_NT2,
				PF_NON_TEMPORAL_LEVEL_ALL = MD_LFHINT_NTA,
			}
			alias __UMULH UnsignedMultiplyHigh;
			ULONGLONG UnsignedMultiplyHigh(ULONGLONG Multiplier, ULONGLONG Multiplicand);
			alias _umul128 UnsignedMultiply128;
			DWORD64 UnsignedMultiply128(ulong Multiplier, ulong Multiplicand, ulong* HighProduct);
			} // extern(C)
	}else{ // not _M_IA64
		TEB* NtCurrentTeb();
	}
} // version(none) _IA64_


version(none){ // _IA64_
	enum {
		EXCEPTION_READ_FAULT    = 0,
		EXCEPTION_WRITE_FAULT   = 1,
		EXCEPTION_EXECUTE_FAULT = 2,
	}

	enum {
		CONTEXT_IA64                  = 0x00080000,
		CONTEXT_CONTROL               = CONTEXT_IA64 | 0x00000001,
		CONTEXT_LOWER_FLOATING_POINT  = CONTEXT_IA64 | 0x00000002,
		CONTEXT_HIGHER_FLOATING_POINT = CONTEXT_IA64 | 0x00000004,
		CONTEXT_INTEGER               = CONTEXT_IA64 | 0x00000008,
		CONTEXT_DEBUG                 = CONTEXT_IA64 | 0x00000010,
		CONTEXT_IA32_CONTROL          = CONTEXT_IA64 | 0x00000020,
		CONTEXT_FLOATING_POINT        = CONTEXT_LOWER_FLOATING_POINT | CONTEXT_HIGHER_FLOATING_POINT,
		CONTEXT_FULL                  = CONTEXT_CONTROL | CONTEXT_FLOATING_POINT | CONTEXT_INTEGER | CONTEXT_IA32_CONTROL,
		CONTEXT_ALL                   = CONTEXT_CONTROL | CONTEXT_FLOATING_POINT | CONTEXT_INTEGER | CONTEXT_DEBUG | CONTEXT_IA32_CONTROL,
		CONTEXT_EXCEPTION_ACTIVE      = 0x8000000,
		CONTEXT_SERVICE_ACTIVE        = 0x10000000,
		CONTEXT_EXCEPTION_REQUEST     = 0x40000000,
		CONTEXT_EXCEPTION_REPORTING   = 0x80000000,
	}

	struct CONTEXT {
		DWORD ContextFlags;
		DWORD[3] Fill1;

		ULONGLONG DbI0;
		ULONGLONG DbI1;
		ULONGLONG DbI2;
		ULONGLONG DbI3;
		ULONGLONG DbI4;
		ULONGLONG DbI5;
		ULONGLONG DbI6;
		ULONGLONG DbI7;

		ULONGLONG DbD0;
		ULONGLONG DbD1;
		ULONGLONG DbD2;
		ULONGLONG DbD3;
		ULONGLONG DbD4;
		ULONGLONG DbD5;
		ULONGLONG DbD6;
		ULONGLONG DbD7;

		FLOAT128 FltS0;
		FLOAT128 FltS1;
		FLOAT128 FltS2;
		FLOAT128 FltS3;
		FLOAT128 FltT0;
		FLOAT128 FltT1;
		FLOAT128 FltT2;
		FLOAT128 FltT3;
		FLOAT128 FltT4;
		FLOAT128 FltT5;
		FLOAT128 FltT6;
		FLOAT128 FltT7;
		FLOAT128 FltT8;
		FLOAT128 FltT9;

		FLOAT128 FltS4;
		FLOAT128 FltS5;
		FLOAT128 FltS6;
		FLOAT128 FltS7;
		FLOAT128 FltS8;
		FLOAT128 FltS9;
		FLOAT128 FltS10;
		FLOAT128 FltS11;
		FLOAT128 FltS12;
		FLOAT128 FltS13;
		FLOAT128 FltS14;
		FLOAT128 FltS15;
		FLOAT128 FltS16;
		FLOAT128 FltS17;
		FLOAT128 FltS18;
		FLOAT128 FltS19;

		FLOAT128 FltF32;
		FLOAT128 FltF33;
		FLOAT128 FltF34;
		FLOAT128 FltF35;
		FLOAT128 FltF36;
		FLOAT128 FltF37;
		FLOAT128 FltF38;
		FLOAT128 FltF39;

		FLOAT128 FltF40;
		FLOAT128 FltF41;
		FLOAT128 FltF42;
		FLOAT128 FltF43;
		FLOAT128 FltF44;
		FLOAT128 FltF45;
		FLOAT128 FltF46;
		FLOAT128 FltF47;
		FLOAT128 FltF48;
		FLOAT128 FltF49;

		FLOAT128 FltF50;
		FLOAT128 FltF51;
		FLOAT128 FltF52;
		FLOAT128 FltF53;
		FLOAT128 FltF54;
		FLOAT128 FltF55;
		FLOAT128 FltF56;
		FLOAT128 FltF57;
		FLOAT128 FltF58;
		FLOAT128 FltF59;

		FLOAT128 FltF60;
		FLOAT128 FltF61;
		FLOAT128 FltF62;
		FLOAT128 FltF63;
		FLOAT128 FltF64;
		FLOAT128 FltF65;
		FLOAT128 FltF66;
		FLOAT128 FltF67;
		FLOAT128 FltF68;
		FLOAT128 FltF69;

		FLOAT128 FltF70;
		FLOAT128 FltF71;
		FLOAT128 FltF72;
		FLOAT128 FltF73;
		FLOAT128 FltF74;
		FLOAT128 FltF75;
		FLOAT128 FltF76;
		FLOAT128 FltF77;
		FLOAT128 FltF78;
		FLOAT128 FltF79;

		FLOAT128 FltF80;
		FLOAT128 FltF81;
		FLOAT128 FltF82;
		FLOAT128 FltF83;
		FLOAT128 FltF84;
		FLOAT128 FltF85;
		FLOAT128 FltF86;
		FLOAT128 FltF87;
		FLOAT128 FltF88;
		FLOAT128 FltF89;

		FLOAT128 FltF90;
		FLOAT128 FltF91;
		FLOAT128 FltF92;
		FLOAT128 FltF93;
		FLOAT128 FltF94;
		FLOAT128 FltF95;
		FLOAT128 FltF96;
		FLOAT128 FltF97;
		FLOAT128 FltF98;
		FLOAT128 FltF99;

		FLOAT128 FltF100;
		FLOAT128 FltF101;
		FLOAT128 FltF102;
		FLOAT128 FltF103;
		FLOAT128 FltF104;
		FLOAT128 FltF105;
		FLOAT128 FltF106;
		FLOAT128 FltF107;
		FLOAT128 FltF108;
		FLOAT128 FltF109;

		FLOAT128 FltF110;
		FLOAT128 FltF111;
		FLOAT128 FltF112;
		FLOAT128 FltF113;
		FLOAT128 FltF114;
		FLOAT128 FltF115;
		FLOAT128 FltF116;
		FLOAT128 FltF117;
		FLOAT128 FltF118;
		FLOAT128 FltF119;

		FLOAT128 FltF120;
		FLOAT128 FltF121;
		FLOAT128 FltF122;
		FLOAT128 FltF123;
		FLOAT128 FltF124;
		FLOAT128 FltF125;
		FLOAT128 FltF126;
		FLOAT128 FltF127;

		ULONGLONG StFPSR;

		ULONGLONG IntGp;
		ULONGLONG IntT0;
		ULONGLONG IntT1;
		ULONGLONG IntS0;
		ULONGLONG IntS1;
		ULONGLONG IntS2;
		ULONGLONG IntS3;
		ULONGLONG IntV0;
		ULONGLONG IntT2;
		ULONGLONG IntT3;
		ULONGLONG IntT4;
		ULONGLONG IntSp;
		ULONGLONG IntTeb;
		ULONGLONG IntT5;
		ULONGLONG IntT6;
		ULONGLONG IntT7;
		ULONGLONG IntT8;
		ULONGLONG IntT9;
		ULONGLONG IntT10;
		ULONGLONG IntT11;
		ULONGLONG IntT12;
		ULONGLONG IntT13;
		ULONGLONG IntT14;
		ULONGLONG IntT15;
		ULONGLONG IntT16;
		ULONGLONG IntT17;
		ULONGLONG IntT18;
		ULONGLONG IntT19;
		ULONGLONG IntT20;
		ULONGLONG IntT21;
		ULONGLONG IntT22;

		ULONGLONG IntNats;

		ULONGLONG Preds;

		ULONGLONG BrRp;
		ULONGLONG BrS0;
		ULONGLONG BrS1;
		ULONGLONG BrS2;
		ULONGLONG BrS3;
		ULONGLONG BrS4;
		ULONGLONG BrT0;
		ULONGLONG BrT1;

		ULONGLONG ApUNAT;
		ULONGLONG ApLC;
		ULONGLONG ApEC;
		ULONGLONG ApCCV;
		ULONGLONG ApDCR;

		ULONGLONG RsPFS;
		ULONGLONG RsBSP;
		ULONGLONG RsBSPSTORE;
		ULONGLONG RsRSC;
		ULONGLONG RsRNAT;

		ULONGLONG StIPSR;
		ULONGLONG StIIP;
		ULONGLONG StIFS;

		ULONGLONG StFCR;
		ULONGLONG Eflag;
		ULONGLONG SegCSD;
		ULONGLONG SegSSD;
		ULONGLONG Cflag;
		ULONGLONG StFSR;
		ULONGLONG StFIR;
		ULONGLONG StFDR;

		ULONGLONG UNUSEDPACK;
	}
	alias CONTEXT* PCONTEXT;

	struct PLABEL_DESCRIPTOR {
		ULONGLONG EntryPoint;
		ULONGLONG GlobalPointer;
	}
	alias PLABEL_DESCRIPTOR* PPLABEL_DESCRIPTOR;

	struct RUNTIME_FUNCTION {
		DWORD BeginAddress;
		DWORD EndAddress;
		DWORD UnwindInfoAddress;
	}
	alias RUNTIME_FUNCTION* PRUNTIME_FUNCTION;

	enum UNWIND_HISTORY_TABLE_SIZE = 12;

	struct UNWIND_HISTORY_TABLE_ENTRY {
		DWORD64 ImageBase;
		DWORD64 Gp;
		PRUNTIME_FUNCTION FunctionEntry;
	}
	alias UNWIND_HISTORY_TABLE_ENTRY* PUNWIND_HISTORY_TABLE_ENTRY;

	struct _UNWIND_HISTORY_TABLE {
		DWORD Count;
		BYTE LocalHint;
		BYTE GlobalHint;
		BYTE Search;
		BYTE Once;
		DWORD64 LowAddress;
		DWORD64 HighAddress;
		UNWIND_HISTORY_TABLE_ENTRY[UNWIND_HISTORY_TABLE_SIZE] Entry;
	}
	alias UNWIND_HISTORY_TABLE* PUNWIND_HISTORY_TABLE;

	alias PRUNTIME_FUNCTION function(DWORD64 ControlPc, PVOID Context) GET_RUNTIME_FUNCTION_CALLBACK;
	alias GET_RUNTIME_FUNCTION_CALLBACK PGET_RUNTIME_FUNCTION_CALLBACK;

	alias DWORD function(HANDLE Process, PVOID TableAddress, PDWORD Entries, PRUNTIME_FUNCTION* Functions) OUT_OF_PROCESS_FUNCTION_TABLE_CALLBACK;
	alias OUT_OF_PROCESS_FUNCTION_TABLE_CALLBACK POUT_OF_PROCESS_FUNCTION_TABLE_CALLBACK;

	const char* OUT_OF_PROCESS_FUNCTION_TABLE_CALLBACK_EXPORT_NAME = "OutOfProcessFunctionTableCallback";

	export extern(Windows)
	BOOLEAN RtlAddFunctionTable(PRUNTIME_FUNCTION FunctionTable, DWORD EntryCount, ULONGLONG BaseAddress, ULONGLONG TargetGp);
	export extern(Windows)
	BOOLEAN RtlInstallFunctionTableCallback ( DWORD64 TableIdentifier, DWORD64 BaseAddress, DWORD Length, DWORD64 TargetGp, PGET_RUNTIME_FUNCTION_CALLBACK Callback, PVOID Context, PCWSTR OutOfProcessCallbackDll);
	export extern(Windows)
	BOOLEAN  RtlDeleteFunctionTable (PRUNTIME_FUNCTION FunctionTable);
	export extern(Windows)
	PRUNTIME_FUNCTION RtlLookupFunctionEntry(ULONGLONG ControlPc, PULONGLONG ImageBase, PULONGLONG TargetGp);

	struct KNONVOLATILE_CONTEXT_POINTERS {
		PFLOAT128  FltS0;
		PFLOAT128  FltS1;
		PFLOAT128  FltS2;
		PFLOAT128  FltS3;
		PFLOAT128[10] HighFloatingContext;
		PFLOAT128  FltS4;
		PFLOAT128  FltS5;
		PFLOAT128  FltS6;
		PFLOAT128  FltS7;
		PFLOAT128  FltS8;
		PFLOAT128  FltS9;
		PFLOAT128  FltS10;
		PFLOAT128  FltS11;
		PFLOAT128  FltS12;
		PFLOAT128  FltS13;
		PFLOAT128  FltS14;
		PFLOAT128  FltS15;
		PFLOAT128  FltS16;
		PFLOAT128  FltS17;
		PFLOAT128  FltS18;
		PFLOAT128  FltS19;

		PULONGLONG IntS0;
		PULONGLONG IntS1;
		PULONGLONG IntS2;
		PULONGLONG IntS3;
		PULONGLONG IntSp;
		PULONGLONG IntS0Nat;
		PULONGLONG IntS1Nat;
		PULONGLONG IntS2Nat;
		PULONGLONG IntS3Nat;
		PULONGLONG IntSpNat;

		PULONGLONG Preds;

		PULONGLONG BrRp;
		PULONGLONG BrS0;
		PULONGLONG BrS1;
		PULONGLONG BrS2;
		PULONGLONG BrS3;
		PULONGLONG BrS4;

		PULONGLONG ApUNAT;
		PULONGLONG ApLC;
		PULONGLONG ApEC;
		PULONGLONG RsPFS;

		PULONGLONG StFSR;
		PULONGLONG StFIR;
		PULONGLONG StFDR;
		PULONGLONG Cflag;

		PULONGLONG StFPSR;
	}
	alias KNONVOLATILE_CONTEXT_POINTERS* PKNONVOLATILE_CONTEXT_POINTERS;

	struct FRAME_POINTERS {
		ULONGLONG MemoryStackFp;
		ULONGLONG BackingStoreFp;
	}
	alias FRAME_POINTERS* PFRAME_POINTERS;

	export extern(Windows)
	ULONGLONG RtlVirtualUnwind(ULONGLONG ImageBase, ULONGLONG ControlPc, PRUNTIME_FUNCTION FunctionEntry, PCONTEXT ContextRecord, PBOOLEAN InFunction, PFRAME_POINTERS EstablisherFrame, PKNONVOLATILE_CONTEXT_POINTERS ContextPointers);
	export extern(Windows)
	VOID RtlRestoreContext(PCONTEXT ContextRecord, EXCEPTION_RECORD* ExceptionRecord);
	export extern(Windows)
	VOID __jump_unwind(ULONGLONG TargetMsFrame, ULONGLONG TargetBsFrame, ULONGLONG TargetPc);

} // _IA64_

enum {
	WOW64_CONTEXT_i386               = 0x00010000,
	WOW64_CONTEXT_i486               = 0x00010000,
	WOW64_CONTEXT_CONTROL            = WOW64_CONTEXT_i386 | 0x00000001,
	WOW64_CONTEXT_INTEGER            = WOW64_CONTEXT_i386 | 0x00000002,
	WOW64_CONTEXT_SEGMENTS           = WOW64_CONTEXT_i386 | 0x00000004,
	WOW64_CONTEXT_FLOATING_POINT     = WOW64_CONTEXT_i386 | 0x00000008,
	WOW64_CONTEXT_DEBUG_REGISTERS    = WOW64_CONTEXT_i386 | 0x00000010,
	WOW64_CONTEXT_EXTENDED_REGISTERS = WOW64_CONTEXT_i386 | 0x00000020,
	WOW64_CONTEXT_FULL               = WOW64_CONTEXT_CONTROL | WOW64_CONTEXT_INTEGER | WOW64_CONTEXT_SEGMENTS,
	WOW64_CONTEXT_ALL                = WOW64_CONTEXT_CONTROL | WOW64_CONTEXT_INTEGER | WOW64_CONTEXT_SEGMENTS | WOW64_CONTEXT_FLOATING_POINT | WOW64_CONTEXT_DEBUG_REGISTERS | WOW64_CONTEXT_EXTENDED_REGISTERS,
	WOW64_CONTEXT_XSTATE             = WOW64_CONTEXT_i386 | 0x00000040,
}

enum WOW64_SIZE_OF_80387_REGISTERS = 80;

enum WOW64_MAXIMUM_SUPPORTED_EXTENSION = 512;

struct WOW64_FLOATING_SAVE_AREA {
	DWORD ControlWord;
	DWORD StatusWord;
	DWORD TagWord;
	DWORD ErrorOffset;
	DWORD ErrorSelector;
	DWORD DataOffset;
	DWORD DataSelector;
	BYTE[WOW64_SIZE_OF_80387_REGISTERS] RegisterArea;
	DWORD Cr0NpxState;
}
alias WOW64_FLOATING_SAVE_AREA* PWOW64_FLOATING_SAVE_AREA;

align(4)
struct WOW64_CONTEXT {
	DWORD ContextFlags;

	DWORD Dr0;
	DWORD Dr1;
	DWORD Dr2;
	DWORD Dr3;
	DWORD Dr6;
	DWORD Dr7;

	WOW64_FLOATING_SAVE_AREA FloatSave;

	DWORD SegGs;
	DWORD SegFs;
	DWORD SegEs;
	DWORD SegDs;

	DWORD Edi;
	DWORD Esi;
	DWORD Ebx;
	DWORD Edx;
	DWORD Ecx;
	DWORD Eax;

	DWORD Ebp;
	DWORD Eip;
	DWORD SegCs;
	DWORD EFlags;
	DWORD Esp;
	DWORD SegSs;

	BYTE[WOW64_MAXIMUM_SUPPORTED_EXTENSION] ExtendedRegisters;
}
alias WOW64_CONTEXT* PWOW64_CONTEXT;

struct WOW64_LDT_ENTRY {
	WORD LimitLow;
	WORD BaseLow;
	union {
		struct {
			BYTE BaseMid;
			BYTE Flags1;
			BYTE Flags2;
			BYTE BaseHi;
		}
		DWORD Bits;
	}
}
alias WOW64_LDT_ENTRY* PWOW64_LDT_ENTRY;

struct WOW64_DESCRIPTOR_TABLE_ENTRY {
	DWORD Selector;
	WOW64_LDT_ENTRY Descriptor;
}
alias WOW64_DESCRIPTOR_TABLE_ENTRY* PWOW64_DESCRIPTOR_TABLE_ENTRY;

enum EXCEPTION_NONCONTINUABLE = 0x1;
enum EXCEPTION_MAXIMUM_PARAMETERS = 15;

struct EXCEPTION_RECORD {
	DWORD ExceptionCode;
	DWORD ExceptionFlags;
	EXCEPTION_RECORD* ExceptionRecord;
	PVOID ExceptionAddress;
	DWORD NumberParameters;
	ULONG_PTR[EXCEPTION_MAXIMUM_PARAMETERS] ExceptionInformation;
}
alias EXCEPTION_RECORD* PEXCEPTION_RECORD;

struct EXCEPTION_RECORD32 {
	DWORD ExceptionCode;
	DWORD ExceptionFlags;
	DWORD ExceptionRecord;
	DWORD ExceptionAddress;
	DWORD NumberParameters;
	DWORD[EXCEPTION_MAXIMUM_PARAMETERS] ExceptionInformation;
}
alias EXCEPTION_RECORD32* PEXCEPTION_RECORD32;

struct EXCEPTION_RECORD64 {
	DWORD ExceptionCode;
	DWORD ExceptionFlags;
	DWORD64 ExceptionRecord;
	DWORD64 ExceptionAddress;
	DWORD NumberParameters;
	DWORD __unusedAlignment;
	DWORD64 [EXCEPTION_MAXIMUM_PARAMETERS]ExceptionInformation;
}
alias EXCEPTION_RECORD64* PEXCEPTION_RECORD64;

struct EXCEPTION_POINTERS {
	PEXCEPTION_RECORD ExceptionRecord;
	PCONTEXT ContextRecord;
}
alias EXCEPTION_POINTERS* PEXCEPTION_POINTERS;

export extern(Windows)
VOID RtlUnwind(PVOID TargetFrame, PVOID TargetIp, PEXCEPTION_RECORD ExceptionRecord, PVOID ReturnValue);

version(none){ // _IA64_
	export extern(Windows)
	VOID RtlUnwind2(FRAME_POINTERS TargetFrame, PVOID TargetIp, PEXCEPTION_RECORD ExceptionRecord, PVOID ReturnValue, PCONTEXT ContextRecord);
}

version(X86_64){
	export extern(Windows)
	VOID RtlUnwindEx(PVOID TargetFrame, PVOID TargetIp, PEXCEPTION_RECORD ExceptionRecord, PVOID ReturnValue, PCONTEXT ContextRecord, PUNWIND_HISTORY_TABLE HistoryTable);
}else version(none){ // _IA64_
	export extern(Windows)
	VOID RtlUnwindEx(FRAME_POINTERS TargetFrame, PVOID TargetIp, PEXCEPTION_RECORD ExceptionRecord, PVOID ReturnValue, PCONTEXT ContextRecord, PUNWIND_HISTORY_TABLE HistoryTable);
}

/* -> moved to windef
alias PVOID PACCESS_TOKEN;
alias PVOID PSECURITY_DESCRIPTOR;
alias PVOID PSID;

alias DWORD ACCESS_MASK;
alias ACCESS_MASK* PACCESS_MASK;
<-- moved to windef */

enum {
	DELETE                   = 0x00010000,
	READ_CONTROL             = 0x00020000,
	WRITE_DAC                = 0x00040000,
	WRITE_OWNER              = 0x00080000,
	SYNCHRONIZE              = 0x00100000,
	STANDARD_RIGHTS_REQUIRED = 0x000F0000,
	STANDARD_RIGHTS_READ     = READ_CONTROL,
	STANDARD_RIGHTS_WRITE    = READ_CONTROL,
	STANDARD_RIGHTS_EXECUTE  = READ_CONTROL,
	STANDARD_RIGHTS_ALL      = 0x001F0000,
	SPECIFIC_RIGHTS_ALL      = 0x0000FFFF,
	ACCESS_SYSTEM_SECURITY   = 0x01000000,
	MAXIMUM_ALLOWED          = 0x02000000,
	GENERIC_READ             = 0x80000000,
	GENERIC_WRITE            = 0x40000000,
	GENERIC_EXECUTE          = 0x20000000,
	GENERIC_ALL              = 0x10000000,
}

struct GENERIC_MAPPING {
	ACCESS_MASK GenericRead;
	ACCESS_MASK GenericWrite;
	ACCESS_MASK GenericExecute;
	ACCESS_MASK GenericAll;
}
alias GENERIC_MAPPING* PGENERIC_MAPPING;

align(4)
struct LUID_AND_ATTRIBUTES {
	LUID Luid;
	DWORD Attributes;
}
alias LUID_AND_ATTRIBUTES* PLUID_AND_ATTRIBUTES;
alias LUID_AND_ATTRIBUTES[ANYSIZE_ARRAY] LUID_AND_ATTRIBUTES_ARRAY;
alias LUID_AND_ATTRIBUTES_ARRAY* PLUID_AND_ATTRIBUTES_ARRAY;

struct SID_IDENTIFIER_AUTHORITY {
	BYTE[6]  Value;
}
alias SID_IDENTIFIER_AUTHORITY* PSID_IDENTIFIER_AUTHORITY;

struct SID {
	BYTE Revision;
	BYTE SubAuthorityCount;
	SID_IDENTIFIER_AUTHORITY IdentifierAuthority;
	DWORD[ANYSIZE_ARRAY] SubAuthority;
}
alias SID* PISID;

enum {
	SID_REVISION                    = 1,
	SID_MAX_SUB_AUTHORITIES         = 15,
	SID_RECOMMENDED_SUB_AUTHORITIES = 1,
}

enum SECURITY_MAX_SID_SIZE = (SID.sizeof - DWORD.sizeof + (SID_MAX_SUB_AUTHORITIES * DWORD.sizeof));

enum {
	SidTypeUser = 1,
	SidTypeGroup,
	SidTypeDomain,
	SidTypeAlias,
	SidTypeWellKnownGroup,
	SidTypeDeletedAccount,
	SidTypeInvalid,
	SidTypeUnknown,
	SidTypeComputer,
	SidTypeLabel
}
alias int SID_NAME_USE;
alias SID_NAME_USE* PSID_NAME_USE;

struct SID_AND_ATTRIBUTES {
	PSID Sid;
	DWORD Attributes;
}
alias SID_AND_ATTRIBUTES* PSID_AND_ATTRIBUTES;
alias SID_AND_ATTRIBUTES[ANYSIZE_ARRAY] SID_AND_ATTRIBUTES_ARRAY;
alias SID_AND_ATTRIBUTES_ARRAY* PSID_AND_ATTRIBUTES_ARRAY;

enum SID_HASH_SIZE = 32;
alias ULONG_PTR SID_HASH_ENTRY;
alias SID_HASH_ENTRY* PSID_HASH_ENTRY;

struct SID_AND_ATTRIBUTES_HASH {
	DWORD SidCount;
	PSID_AND_ATTRIBUTES SidAttr;
	SID_HASH_ENTRY[SID_HASH_SIZE] Hash;
}
alias SID_AND_ATTRIBUTES_HASH* PSID_AND_ATTRIBUTES_HASH;

const SID_IDENTIFIER_AUTHORITY SECURITY_NULL_SID_AUTHORITY         = {[0,0,0,0,0,0]};
const SID_IDENTIFIER_AUTHORITY SECURITY_WORLD_SID_AUTHORITY        = {[0,0,0,0,0,1]};
const SID_IDENTIFIER_AUTHORITY SECURITY_LOCAL_SID_AUTHORITY        = {[0,0,0,0,0,2]};
const SID_IDENTIFIER_AUTHORITY SECURITY_CREATOR_SID_AUTHORITY      = {[0,0,0,0,0,3]};
const SID_IDENTIFIER_AUTHORITY SECURITY_NON_UNIQUE_AUTHORITY       = {[0,0,0,0,0,4]};
const SID_IDENTIFIER_AUTHORITY SECURITY_RESOURCE_MANAGER_AUTHORITY = {[0,0,0,0,0,9]};

enum {
	SECURITY_NULL_RID                 = 0x00000000,
	SECURITY_WORLD_RID                = 0x00000000,
	SECURITY_LOCAL_RID                = 0x00000000,
	SECURITY_LOCAL_LOGON_RID          = 0x00000001,
	SECURITY_CREATOR_OWNER_RID        = 0x00000000,
	SECURITY_CREATOR_GROUP_RID        = 0x00000001,
	SECURITY_CREATOR_OWNER_SERVER_RID = 0x00000002,
	SECURITY_CREATOR_GROUP_SERVER_RID = 0x00000003,
	SECURITY_CREATOR_OWNER_RIGHTS_RID = 0x00000004,
}

const SID_IDENTIFIER_AUTHORITY SECURITY_NT_AUTHORITY = {[0,0,0,0,0,5]};

enum {
	SECURITY_DIALUP_RID                                     = 0x00000001,
	SECURITY_NETWORK_RID                                    = 0x00000002,
	SECURITY_BATCH_RID                                      = 0x00000003,
	SECURITY_INTERACTIVE_RID                                = 0x00000004,
	SECURITY_LOGON_IDS_RID                                  = 0x00000005,
	SECURITY_LOGON_IDS_RID_COUNT                            = 3,
	SECURITY_SERVICE_RID                                    = 0x00000006,
	SECURITY_ANONYMOUS_LOGON_RID                            = 0x00000007,
	SECURITY_PROXY_RID                                      = 0x00000008,
	SECURITY_ENTERPRISE_CONTROLLERS_RID                     = 0x00000009,
	SECURITY_SERVER_LOGON_RID                               = SECURITY_ENTERPRISE_CONTROLLERS_RID,
	SECURITY_PRINCIPAL_SELF_RID                             = 0x0000000A,
	SECURITY_AUTHENTICATED_USER_RID                         = 0x0000000B,
	SECURITY_RESTRICTED_CODE_RID                            = 0x0000000C,
	SECURITY_TERMINAL_SERVER_RID                            = 0x0000000D,
	SECURITY_REMOTE_LOGON_RID                               = 0x0000000E,
	SECURITY_THIS_ORGANIZATION_RID                          = 0x0000000F,
	SECURITY_IUSER_RID                                      = 0x00000011,
	SECURITY_LOCAL_SYSTEM_RID                               = 0x00000012,
	SECURITY_LOCAL_SERVICE_RID                              = 0x00000013,
	SECURITY_NETWORK_SERVICE_RID                            = 0x00000014,
	SECURITY_NT_NON_UNIQUE                                  = 0x00000015,
	SECURITY_NT_NON_UNIQUE_SUB_AUTH_COUNT                   = 3,
	SECURITY_ENTERPRISE_READONLY_CONTROLLERS_RID            = 0x00000016,
	SECURITY_BUILTIN_DOMAIN_RID                             = 0x00000020,
	SECURITY_WRITE_RESTRICTED_CODE_RID                      = 0x00000021,
	SECURITY_PACKAGE_BASE_RID                               = 0x00000040,
	SECURITY_PACKAGE_RID_COUNT                              = 2,
	SECURITY_PACKAGE_NTLM_RID                               = 0x0000000A,
	SECURITY_PACKAGE_SCHANNEL_RID                           = 0x0000000E,
	SECURITY_PACKAGE_DIGEST_RID                             = 0x00000015,
	SECURITY_CRED_TYPE_BASE_RID                             = 0x00000041,
	SECURITY_CRED_TYPE_RID_COUNT                            = 2,
	SECURITY_CRED_TYPE_THIS_ORG_CERT_RID                    = 0x00000001,
	SECURITY_MIN_BASE_RID                                   = 0x00000050,
	SECURITY_SERVICE_ID_BASE_RID                            = 0x00000050,
	SECURITY_SERVICE_ID_RID_COUNT                           = 6,
	SECURITY_RESERVED_ID_BASE_RID                           = 0x00000051,
	SECURITY_APPPOOL_ID_BASE_RID                            = 0x00000052,
	SECURITY_APPPOOL_ID_RID_COUNT                           = 6,
	SECURITY_VIRTUALSERVER_ID_BASE_RID                      = 0x00000053,
	SECURITY_VIRTUALSERVER_ID_RID_COUNT                     = 6,
	SECURITY_USERMODEDRIVERHOST_ID_BASE_RID                 = 0x00000054,
	SECURITY_USERMODEDRIVERHOST_ID_RID_COUNT                = 6,
	SECURITY_CLOUD_INFRASTRUCTURE_SERVICES_ID_BASE_RID      = 0x00000055,
	SECURITY_CLOUD_INFRASTRUCTURE_SERVICES_ID_RID_COUNT     = 6,
	SECURITY_WMIHOST_ID_BASE_RID                            = 0x00000056,
	SECURITY_WMIHOST_ID_RID_COUNT                           = 6,
	SECURITY_TASK_ID_BASE_RID                               = 0x00000057,
	SECURITY_NFS_ID_BASE_RID                                = 0x00000058,
	SECURITY_COM_ID_BASE_RID                                = 0x00000059,
	SECURITY_VIRTUALACCOUNT_ID_RID_COUNT                    = 6,
	SECURITY_MAX_BASE_RID                                   = 0x0000006F,
	SECURITY_MAX_ALWAYS_FILTERED                            = 0x000003E7,
	SECURITY_MIN_NEVER_FILTERED                             = 0x000003E8,
	SECURITY_OTHER_ORGANIZATION_RID                         = 0x000003E8,
	SECURITY_WINDOWSMOBILE_ID_BASE_RID                      = 0x00000070,
	DOMAIN_GROUP_RID_ENTERPRISE_READONLY_DOMAIN_CONTROLLERS = 0x000001F2,
	FOREST_USER_RID_MAX                                     = 0x000001F3,
	DOMAIN_USER_RID_ADMIN                                   = 0x000001F4,
	DOMAIN_USER_RID_GUEST                                   = 0x000001F5,
	DOMAIN_USER_RID_KRBTGT                                  = 0x000001F6,
	DOMAIN_USER_RID_MAX                                     = 0x000003E7,
	DOMAIN_GROUP_RID_ADMINS                                 = 0x00000200,
	DOMAIN_GROUP_RID_USERS                                  = 0x00000201,
	DOMAIN_GROUP_RID_GUESTS                                 = 0x00000202,
	DOMAIN_GROUP_RID_COMPUTERS                              = 0x00000203,
	DOMAIN_GROUP_RID_CONTROLLERS                            = 0x00000204,
	DOMAIN_GROUP_RID_CERT_ADMINS                            = 0x00000205,
	DOMAIN_GROUP_RID_SCHEMA_ADMINS                          = 0x00000206,
	DOMAIN_GROUP_RID_ENTERPRISE_ADMINS                      = 0x00000207,
	DOMAIN_GROUP_RID_POLICY_ADMINS                          = 0x00000208,
	DOMAIN_GROUP_RID_READONLY_CONTROLLERS                   = 0x00000209,
	DOMAIN_ALIAS_RID_ADMINS                                 = 0x00000220,
	DOMAIN_ALIAS_RID_USERS                                  = 0x00000221,
	DOMAIN_ALIAS_RID_GUESTS                                 = 0x00000222,
	DOMAIN_ALIAS_RID_POWER_USERS                            = 0x00000223,
	DOMAIN_ALIAS_RID_ACCOUNT_OPS                            = 0x00000224,
	DOMAIN_ALIAS_RID_SYSTEM_OPS                             = 0x00000225,
	DOMAIN_ALIAS_RID_PRINT_OPS                              = 0x00000226,
	DOMAIN_ALIAS_RID_BACKUP_OPS                             = 0x00000227,
	DOMAIN_ALIAS_RID_REPLICATOR                             = 0x00000228,
	DOMAIN_ALIAS_RID_RAS_SERVERS                            = 0x00000229,
	DOMAIN_ALIAS_RID_PREW2KCOMPACCESS                       = 0x0000022A,
	DOMAIN_ALIAS_RID_REMOTE_DESKTOP_USERS                   = 0x0000022B,
	DOMAIN_ALIAS_RID_NETWORK_CONFIGURATION_OPS              = 0x0000022C,
	DOMAIN_ALIAS_RID_INCOMING_FOREST_TRUST_BUILDERS         = 0x0000022D,
	DOMAIN_ALIAS_RID_MONITORING_USERS                       = 0x0000022E,
	DOMAIN_ALIAS_RID_LOGGING_USERS                          = 0x0000022F,
	DOMAIN_ALIAS_RID_AUTHORIZATIONACCESS                    = 0x00000230,
	DOMAIN_ALIAS_RID_TS_LICENSE_SERVERS                     = 0x00000231,
	DOMAIN_ALIAS_RID_DCOM_USERS                             = 0x00000232,
	DOMAIN_ALIAS_RID_IUSERS                                 = 0x00000238,
	DOMAIN_ALIAS_RID_CRYPTO_OPERATORS                       = 0x00000239,
	DOMAIN_ALIAS_RID_CACHEABLE_PRINCIPALS_GROUP             = 0x0000023B,
	DOMAIN_ALIAS_RID_NON_CACHEABLE_PRINCIPALS_GROUP         = 0x0000023C,
	DOMAIN_ALIAS_RID_EVENT_LOG_READERS_GROUP                = 0x0000023D,
	DOMAIN_ALIAS_RID_CERTSVC_DCOM_ACCESS_GROUP              = 0x0000023E,
}

const SID_IDENTIFIER_AUTHORITY SECURITY_MANDATORY_LABEL_AUTHORITY = {[0,0,0,0,0,16]};
enum {
	SECURITY_MANDATORY_UNTRUSTED_RID            = 0x00000000,
	SECURITY_MANDATORY_LOW_RID                  = 0x00001000,
	SECURITY_MANDATORY_MEDIUM_RID               = 0x00002000,
	SECURITY_MANDATORY_MEDIUM_PLUS_RID          = SECURITY_MANDATORY_MEDIUM_RID + 0x100,
	SECURITY_MANDATORY_HIGH_RID                 = 0x00003000,
	SECURITY_MANDATORY_SYSTEM_RID               = 0x00004000,
	SECURITY_MANDATORY_PROTECTED_PROCESS_RID    = 0x00005000,
	SECURITY_MANDATORY_MAXIMUM_USER_RID         = SECURITY_MANDATORY_SYSTEM_RID,
}

pure nothrow
uint MANDATORY_LEVEL_TO_MANDATORY_RID(uint IL)
{
	return IL * 0x1000;
}

enum {
	WinNullSid                                  = 0,
	WinWorldSid                                 = 1,
	WinLocalSid                                 = 2,
	WinCreatorOwnerSid                          = 3,
	WinCreatorGroupSid                          = 4,
	WinCreatorOwnerServerSid                    = 5,
	WinCreatorGroupServerSid                    = 6,
	WinNtAuthoritySid                           = 7,
	WinDialupSid                                = 8,
	WinNetworkSid                               = 9,
	WinBatchSid                                 = 10,
	WinInteractiveSid                           = 11,
	WinServiceSid                               = 12,
	WinAnonymousSid                             = 13,
	WinProxySid                                 = 14,
	WinEnterpriseControllersSid                 = 15,
	WinSelfSid                                  = 16,
	WinAuthenticatedUserSid                     = 17,
	WinRestrictedCodeSid                        = 18,
	WinTerminalServerSid                        = 19,
	WinRemoteLogonIdSid                         = 20,
	WinLogonIdsSid                              = 21,
	WinLocalSystemSid                           = 22,
	WinLocalServiceSid                          = 23,
	WinNetworkServiceSid                        = 24,
	WinBuiltinDomainSid                         = 25,
	WinBuiltinAdministratorsSid                 = 26,
	WinBuiltinUsersSid                          = 27,
	WinBuiltinGuestsSid                         = 28,
	WinBuiltinPowerUsersSid                     = 29,
	WinBuiltinAccountOperatorsSid               = 30,
	WinBuiltinSystemOperatorsSid                = 31,
	WinBuiltinPrintOperatorsSid                 = 32,
	WinBuiltinBackupOperatorsSid                = 33,
	WinBuiltinReplicatorSid                     = 34,
	WinBuiltinPreWindows2000CompatibleAccessSid = 35,
	WinBuiltinRemoteDesktopUsersSid             = 36,
	WinBuiltinNetworkConfigurationOperatorsSid  = 37,
	WinAccountAdministratorSid                  = 38,
	WinAccountGuestSid                          = 39,
	WinAccountKrbtgtSid                         = 40,
	WinAccountDomainAdminsSid                   = 41,
	WinAccountDomainUsersSid                    = 42,
	WinAccountDomainGuestsSid                   = 43,
	WinAccountComputersSid                      = 44,
	WinAccountControllersSid                    = 45,
	WinAccountCertAdminsSid                     = 46,
	WinAccountSchemaAdminsSid                   = 47,
	WinAccountEnterpriseAdminsSid               = 48,
	WinAccountPolicyAdminsSid                   = 49,
	WinAccountRasAndIasServersSid               = 50,
	WinNTLMAuthenticationSid                    = 51,
	WinDigestAuthenticationSid                  = 52,
	WinSChannelAuthenticationSid                = 53,
	WinThisOrganizationSid                      = 54,
	WinOtherOrganizationSid                     = 55,
	WinBuiltinIncomingForestTrustBuildersSid    = 56,
	WinBuiltinPerfMonitoringUsersSid            = 57,
	WinBuiltinPerfLoggingUsersSid               = 58,
	WinBuiltinAuthorizationAccessSid            = 59,
	WinBuiltinTerminalServerLicenseServersSid   = 60,
	WinBuiltinDCOMUsersSid                      = 61,
	WinBuiltinIUsersSid                         = 62,
	WinIUserSid                                 = 63,
	WinBuiltinCryptoOperatorsSid                = 64,
	WinUntrustedLabelSid                        = 65,
	WinLowLabelSid                              = 66,
	WinMediumLabelSid                           = 67,
	WinHighLabelSid                             = 68,
	WinSystemLabelSid                           = 69,
	WinWriteRestrictedCodeSid                   = 70,
	WinCreatorOwnerRightsSid                    = 71,
	WinCacheablePrincipalsGroupSid              = 72,
	WinNonCacheablePrincipalsGroupSid           = 73,
	WinEnterpriseReadonlyControllersSid         = 74,
	WinAccountReadonlyControllersSid            = 75,
	WinBuiltinEventLogReadersGroup              = 76,
	WinNewEnterpriseReadonlyControllersSid      = 77,
	WinBuiltinCertSvcDComAccessGroup            = 78,
	WinMediumPlusLabelSid                       = 79,
	WinLocalLogonSid                            = 80,
	WinConsoleLogonSid                          = 81,
	WinThisOrganizationCertificateSid           = 82,
}
alias int WELL_KNOWN_SID_TYPE;

const LUID SYSTEM_LUID          = {0x3e7, 0x0};
const LUID ANONYMOUS_LOGON_LUID = {0x3e6, 0x0};
const LUID LOCALSERVICE_LUID    = {0x3e5, 0x0};
const LUID NETWORKSERVICE_LUID  = {0x3e4, 0x0};
const LUID IUSER_LUID           = {0x3e3, 0x0};

enum {
	SE_GROUP_MANDATORY                 = 0x00000001,
	SE_GROUP_ENABLED_BY_DEFAULT        = 0x00000002,
	SE_GROUP_ENABLED                   = 0x00000004,
	SE_GROUP_OWNER                     = 0x00000008,
	SE_GROUP_USE_FOR_DENY_ONLY         = 0x00000010,
	SE_GROUP_INTEGRITY                 = 0x00000020,
	SE_GROUP_INTEGRITY_ENABLED         = 0x00000040,
	SE_GROUP_LOGON_ID                  = 0xC0000000,
	SE_GROUP_RESOURCE                  = 0x20000000,
	SE_GROUP_VALID_ATTRIBUTES          = SE_GROUP_MANDATORY | SE_GROUP_ENABLED_BY_DEFAULT | SE_GROUP_ENABLED | SE_GROUP_OWNER | SE_GROUP_USE_FOR_DENY_ONLY | SE_GROUP_LOGON_ID | SE_GROUP_RESOURCE | SE_GROUP_INTEGRITY | SE_GROUP_INTEGRITY_ENABLED,
}

enum {
	ACL_REVISION    = 2,
	ACL_REVISION_DS = 4,
}

enum {
	ACL_REVISION1    = 1,
	ACL_REVISION2    = 2,
	ACL_REVISION3    = 3,
	ACL_REVISION4    = 4,
	MIN_ACL_REVISION = ACL_REVISION2,
	MAX_ACL_REVISION = ACL_REVISION4,
}

struct ACL {
	BYTE AclRevision;
	BYTE Sbz1;
	WORD AclSize;
	WORD AceCount;
	WORD Sbz2;
}
alias ACL* PACL;

struct ACE_HEADER  {
	BYTE AceType;
	BYTE AceFlags;
	WORD AceSize;
}
alias ACE_HEADER* PACE_HEADER;

enum {
	ACCESS_MIN_MS_ACE_TYPE                  = 0x0,
	ACCESS_ALLOWED_ACE_TYPE                 = 0x0,
	ACCESS_DENIED_ACE_TYPE                  = 0x1,
	SYSTEM_AUDIT_ACE_TYPE                   = 0x2,
	SYSTEM_ALARM_ACE_TYPE                   = 0x3,
	ACCESS_MAX_MS_V2_ACE_TYPE               = 0x3,
	ACCESS_ALLOWED_COMPOUND_ACE_TYPE        = 0x4,
	ACCESS_MAX_MS_V3_ACE_TYPE               = 0x4,
	ACCESS_MIN_MS_OBJECT_ACE_TYPE           = 0x5,
	ACCESS_ALLOWED_OBJECT_ACE_TYPE          = 0x5,
	ACCESS_DENIED_OBJECT_ACE_TYPE           = 0x6,
	SYSTEM_AUDIT_OBJECT_ACE_TYPE            = 0x7,
	SYSTEM_ALARM_OBJECT_ACE_TYPE            = 0x8,
	ACCESS_MAX_MS_OBJECT_ACE_TYPE           = 0x8,
	ACCESS_MAX_MS_V4_ACE_TYPE               = 0x8,
	ACCESS_MAX_MS_ACE_TYPE                  = 0x8,
	ACCESS_ALLOWED_CALLBACK_ACE_TYPE        = 0x9,
	ACCESS_DENIED_CALLBACK_ACE_TYPE         = 0xA,
	ACCESS_ALLOWED_CALLBACK_OBJECT_ACE_TYPE = 0xB,
	ACCESS_DENIED_CALLBACK_OBJECT_ACE_TYPE  = 0xC,
	SYSTEM_AUDIT_CALLBACK_ACE_TYPE          = 0xD,
	SYSTEM_ALARM_CALLBACK_ACE_TYPE          = 0xE,
	SYSTEM_AUDIT_CALLBACK_OBJECT_ACE_TYPE   = 0xF,
	SYSTEM_ALARM_CALLBACK_OBJECT_ACE_TYPE   = 0x10,
	SYSTEM_MANDATORY_LABEL_ACE_TYPE         = 0x11,
	ACCESS_MAX_MS_V5_ACE_TYPE               = 0x11,
}
enum {
	OBJECT_INHERIT_ACE                = 0x1,
	CONTAINER_INHERIT_ACE             = 0x2,
	NO_PROPAGATE_INHERIT_ACE          = 0x4,
	INHERIT_ONLY_ACE                  = 0x8,
	INHERITED_ACE                     = 0x10,
	VALID_INHERIT_FLAGS               = 0x1F,
}

enum {
	SUCCESSFUL_ACCESS_ACE_FLAG       = 0x40,
	FAILED_ACCESS_ACE_FLAG           = 0x80,
}

struct ACCESS_ALLOWED_ACE {
	ACE_HEADER Header;
	ACCESS_MASK Mask;
	DWORD SidStart;
}
alias ACCESS_ALLOWED_ACE* PACCESS_ALLOWED_ACE;

struct ACCESS_DENIED_ACE {
	ACE_HEADER Header;
	ACCESS_MASK Mask;
	DWORD SidStart;
}
alias ACCESS_DENIED_ACE* PACCESS_DENIED_ACE;

struct SYSTEM_AUDIT_ACE {
	ACE_HEADER Header;
	ACCESS_MASK Mask;
	DWORD SidStart;
}
alias SYSTEM_AUDIT_ACE* PSYSTEM_AUDIT_ACE;

struct SYSTEM_ALARM_ACE {
	ACE_HEADER Header;
	ACCESS_MASK Mask;
	DWORD SidStart;
}
alias SYSTEM_ALARM_ACE* PSYSTEM_ALARM_ACE;

struct SYSTEM_MANDATORY_LABEL_ACE {
	ACE_HEADER Header;
	ACCESS_MASK Mask;
	DWORD SidStart;
}
alias SYSTEM_MANDATORY_LABEL_ACE* PSYSTEM_MANDATORY_LABEL_ACE;

enum {
	SYSTEM_MANDATORY_LABEL_NO_WRITE_UP   = 0x1,
	SYSTEM_MANDATORY_LABEL_NO_READ_UP    = 0x2,
	SYSTEM_MANDATORY_LABEL_NO_EXECUTE_UP = 0x4,
	SYSTEM_MANDATORY_LABEL_VALID_MASK    = SYSTEM_MANDATORY_LABEL_NO_WRITE_UP | SYSTEM_MANDATORY_LABEL_NO_READ_UP | SYSTEM_MANDATORY_LABEL_NO_EXECUTE_UP,
}

struct ACCESS_ALLOWED_OBJECT_ACE {
	ACE_HEADER Header;
	ACCESS_MASK Mask;
	DWORD Flags;
	GUID ObjectType;
	GUID InheritedObjectType;
	DWORD SidStart;
}
alias ACCESS_ALLOWED_OBJECT_ACE* PACCESS_ALLOWED_OBJECT_ACE;

struct ACCESS_DENIED_OBJECT_ACE {
	ACE_HEADER Header;
	ACCESS_MASK Mask;
	DWORD Flags;
	GUID ObjectType;
	GUID InheritedObjectType;
	DWORD SidStart;
}
alias ACCESS_DENIED_OBJECT_ACE* PACCESS_DENIED_OBJECT_ACE;

struct SYSTEM_AUDIT_OBJECT_ACE {
	ACE_HEADER Header;
	ACCESS_MASK Mask;
	DWORD Flags;
	GUID ObjectType;
	GUID InheritedObjectType;
	DWORD SidStart;
}
alias SYSTEM_AUDIT_OBJECT_ACE* PSYSTEM_AUDIT_OBJECT_ACE;

struct SYSTEM_ALARM_OBJECT_ACE {
	ACE_HEADER Header;
	ACCESS_MASK Mask;
	DWORD Flags;
	GUID ObjectType;
	GUID InheritedObjectType;
	DWORD SidStart;
}
alias SYSTEM_ALARM_OBJECT_ACE* PSYSTEM_ALARM_OBJECT_ACE;

struct ACCESS_ALLOWED_CALLBACK_ACE {
	ACE_HEADER Header;
	ACCESS_MASK Mask;
	DWORD SidStart;
}
alias ACCESS_ALLOWED_CALLBACK_ACE* PACCESS_ALLOWED_CALLBACK_ACE;

struct ACCESS_DENIED_CALLBACK_ACE {
	ACE_HEADER Header;
	ACCESS_MASK Mask;
	DWORD SidStart;
}
alias ACCESS_DENIED_CALLBACK_ACE* PACCESS_DENIED_CALLBACK_ACE;

struct SYSTEM_AUDIT_CALLBACK_ACE {
	ACE_HEADER Header;
	ACCESS_MASK Mask;
	DWORD SidStart;
}
alias SYSTEM_AUDIT_CALLBACK_ACE* PSYSTEM_AUDIT_CALLBACK_ACE;

struct SYSTEM_ALARM_CALLBACK_ACE {
	ACE_HEADER Header;
	ACCESS_MASK Mask;
	DWORD SidStart;
}
alias SYSTEM_ALARM_CALLBACK_ACE* PSYSTEM_ALARM_CALLBACK_ACE;

struct ACCESS_ALLOWED_CALLBACK_OBJECT_ACE {
	ACE_HEADER Header;
	ACCESS_MASK Mask;
	DWORD Flags;
	GUID ObjectType;
	GUID InheritedObjectType;
	DWORD SidStart;
}
alias ACCESS_ALLOWED_CALLBACK_OBJECT_ACE* PACCESS_ALLOWED_CALLBACK_OBJECT_ACE;

struct ACCESS_DENIED_CALLBACK_OBJECT_ACE {
	ACE_HEADER Header;
	ACCESS_MASK Mask;
	DWORD Flags;
	GUID ObjectType;
	GUID InheritedObjectType;
	DWORD SidStart;
}
alias ACCESS_DENIED_CALLBACK_OBJECT_ACE* PACCESS_DENIED_CALLBACK_OBJECT_ACE;

struct SYSTEM_AUDIT_CALLBACK_OBJECT_ACE {
	ACE_HEADER Header;
	ACCESS_MASK Mask;
	DWORD Flags;
	GUID ObjectType;
	GUID InheritedObjectType;
	DWORD SidStart;
}
alias SYSTEM_AUDIT_CALLBACK_OBJECT_ACE* PSYSTEM_AUDIT_CALLBACK_OBJECT_ACE;

struct SYSTEM_ALARM_CALLBACK_OBJECT_ACE {
	ACE_HEADER Header;
	ACCESS_MASK Mask;
	DWORD Flags;
	GUID ObjectType;
	GUID InheritedObjectType;
	DWORD SidStart;
}
alias SYSTEM_ALARM_CALLBACK_OBJECT_ACE* PSYSTEM_ALARM_CALLBACK_OBJECT_ACE;

enum {
	ACE_OBJECT_TYPE_PRESENT           = 0x1,
	ACE_INHERITED_OBJECT_TYPE_PRESENT = 0x2,
}

enum {
	AclRevisionInformation = 1,
	AclSizeInformation
}
alias int ACL_INFORMATION_CLASS;

struct ACL_REVISION_INFORMATION {
	DWORD AclRevision;
}
alias ACL_REVISION_INFORMATION* PACL_REVISION_INFORMATION;

struct ACL_SIZE_INFORMATION {
	DWORD AceCount;
	DWORD AclBytesInUse;
	DWORD AclBytesFree;
}
alias ACL_SIZE_INFORMATION* PACL_SIZE_INFORMATION;

enum {
	SECURITY_DESCRIPTOR_REVISION  = 1,
	SECURITY_DESCRIPTOR_REVISION1 = 1,
}

enum SECURITY_DESCRIPTOR_MIN_LENGTH = SECURITY_DESCRIPTOR.sizeof;

alias WORD SECURITY_DESCRIPTOR_CONTROL;
alias SECURITY_DESCRIPTOR_CONTROL* PSECURITY_DESCRIPTOR_CONTROL;

enum {
	SE_OWNER_DEFAULTED       = 0x0001,
	SE_GROUP_DEFAULTED       = 0x0002,
	SE_DACL_PRESENT          = 0x0004,
	SE_DACL_DEFAULTED        = 0x0008,
	SE_SACL_PRESENT          = 0x0010,
	SE_SACL_DEFAULTED        = 0x0020,
	SE_DACL_AUTO_INHERIT_REQ = 0x0100,
	SE_SACL_AUTO_INHERIT_REQ = 0x0200,
	SE_DACL_AUTO_INHERITED   = 0x0400,
	SE_SACL_AUTO_INHERITED   = 0x0800,
	SE_DACL_PROTECTED        = 0x1000,
	SE_SACL_PROTECTED        = 0x2000,
	SE_RM_CONTROL_VALID      = 0x4000,
	SE_SELF_RELATIVE         = 0x8000,
}

struct SECURITY_DESCRIPTOR_RELATIVE {
	BYTE Revision;
	BYTE Sbz1;
	SECURITY_DESCRIPTOR_CONTROL Control;
	DWORD Owner;
	DWORD Group;
	DWORD Sacl;
	DWORD Dacl;
}
alias SECURITY_DESCRIPTOR_RELATIVE* PISECURITY_DESCRIPTOR_RELATIVE;

struct SECURITY_DESCRIPTOR {
	BYTE Revision;
	BYTE Sbz1;
	SECURITY_DESCRIPTOR_CONTROL Control;
	PSID Owner;
	PSID Group;
	PACL Sacl;
	PACL Dacl;
}
alias SECURITY_DESCRIPTOR* PISECURITY_DESCRIPTOR;

struct OBJECT_TYPE_LIST {
	WORD Level;
	WORD Sbz;
	GUID* ObjectType;
}
alias OBJECT_TYPE_LIST* POBJECT_TYPE_LIST;

enum {
	ACCESS_OBJECT_GUID       = 0,
	ACCESS_PROPERTY_SET_GUID = 1,
	ACCESS_PROPERTY_GUID     = 2,
	ACCESS_MAX_LEVEL         = 4,
}

enum {
	AuditEventObjectAccess,
	AuditEventDirectoryServiceAccess
}
alias int AUDIT_EVENT_TYPE;
alias AUDIT_EVENT_TYPE* PAUDIT_EVENT_TYPE;

enum AUDIT_ALLOW_NO_PRIVILEGE = 0x1;

const char* ACCESS_DS_SOURCE_A = "DS";
const wchar* ACCESS_DS_SOURCE_W = "DS";
const char* ACCESS_DS_OBJECT_TYPE_NAME_A = "Directory Service Object";
const wchar* ACCESS_DS_OBJECT_TYPE_NAME_W = "Directory Service Object";

enum {
	SE_PRIVILEGE_ENABLED_BY_DEFAULT = 0x00000001,
	SE_PRIVILEGE_ENABLED            = 0x00000002,
	SE_PRIVILEGE_REMOVED            = 0X00000004,
	SE_PRIVILEGE_USED_FOR_ACCESS    = 0x80000000,
	SE_PRIVILEGE_VALID_ATTRIBUTES   = SE_PRIVILEGE_ENABLED_BY_DEFAULT | SE_PRIVILEGE_ENABLED | SE_PRIVILEGE_REMOVED | SE_PRIVILEGE_USED_FOR_ACCESS,
}

enum PRIVILEGE_SET_ALL_NECESSARY = 1;

struct PRIVILEGE_SET {
	DWORD PrivilegeCount;
	DWORD Control;
	LUID_AND_ATTRIBUTES[ANYSIZE_ARRAY] Privilege;
}
alias PRIVILEGE_SET* PPRIVILEGE_SET;

enum {
	ACCESS_REASON_TYPE_MASK = 0xffff0000,
	ACCESS_REASON_DATA_MASK = 0x0000ffff,
}

enum {
	AccessReasonNone             = 0x00000000,
	AccessReasonAllowedAce       = 0x00010000,
	AccessReasonDeniedAce        = 0x00020000,
	AccessReasonAllowedParentAce = 0x00030000,
	AccessReasonDeniedParentAce  = 0x00040000,
	AccessReasonMissingPrivilege = 0x00100000,
	AccessReasonFromPrivilege    = 0x00200000,
	AccessReasonIntegrityLevel   = 0x00300000,
	AccessReasonOwnership        = 0x00400000,
	AccessReasonNullDacl         = 0x00500000,
	AccessReasonEmptyDacl        = 0x00600000,
	AccessReasonNoSD             = 0x00700000,
	AccessReasonNoGrant          = 0x00800000
}
alias int ACCESS_REASON_TYPE;

alias DWORD ACCESS_REASON;

struct ACCESS_REASONS {
	ACCESS_REASON[32] Data;
}
alias ACCESS_REASONS* PACCESS_REASONS;

enum {
	SE_SECURITY_DESCRIPTOR_FLAG_NO_OWNER_ACE = 0x00000001,
	SE_SECURITY_DESCRIPTOR_FLAG_NO_LABEL_ACE = 0x00000002,
	SE_SECURITY_DESCRIPTOR_VALID_FLAGS       = 0x00000003,
}

struct SE_SECURITY_DESCRIPTOR {
	DWORD Size;
	DWORD Flags;
	PSECURITY_DESCRIPTOR SecurityDescriptor;
}
alias SE_SECURITY_DESCRIPTOR* PSE_SECURITY_DESCRIPTOR;

struct SE_ACCESS_REQUEST {
	DWORD Size;
	PSE_SECURITY_DESCRIPTOR SeSecurityDescriptor;
	ACCESS_MASK DesiredAccess;
	ACCESS_MASK PreviouslyGrantedAccess;
	PSID PrincipalSelfSid;
	PGENERIC_MAPPING GenericMapping;
	DWORD ObjectTypeListCount;
	POBJECT_TYPE_LIST ObjectTypeList;
}
alias SE_ACCESS_REQUEST* PSE_ACCESS_REQUEST;

struct SE_ACCESS_REPLY {
	DWORD Size;
	DWORD ResultListCount;
	PACCESS_MASK GrantedAccess;
	PDWORD AccessStatus;
	PACCESS_REASONS AccessReason;
	PPRIVILEGE_SET* Privileges;
}
alias SE_ACCESS_REPLY* PSE_ACCESS_REPLY;

version(UNICODE){
	const wchar* SE_CREATE_TOKEN_NAME           = "SeCreateTokenPrivilege";
	const wchar* SE_ASSIGNPRIMARYTOKEN_NAME     = "SeAssignPrimaryTokenPrivilege";
	const wchar* SE_LOCK_MEMORY_NAME            = "SeLockMemoryPrivilege";
	const wchar* SE_INCREASE_QUOTA_NAME         = "SeIncreaseQuotaPrivilege";
	const wchar* SE_UNSOLICITED_INPUT_NAME      = "SeUnsolicitedInputPrivilege";
	const wchar* SE_MACHINE_ACCOUNT_NAME        = "SeMachineAccountPrivilege";
	const wchar* SE_TCB_NAME                    = "SeTcbPrivilege";
	const wchar* SE_SECURITY_NAME               = "SeSecurityPrivilege";
	const wchar* SE_TAKE_OWNERSHIP_NAME         = "SeTakeOwnershipPrivilege";
	const wchar* SE_LOAD_DRIVER_NAME            = "SeLoadDriverPrivilege";
	const wchar* SE_SYSTEM_PROFILE_NAME         = "SeSystemProfilePrivilege";
	const wchar* SE_SYSTEMTIME_NAME             = "SeSystemtimePrivilege";
	const wchar* SE_PROF_SINGLE_PROCESS_NAME    = "SeProfileSingleProcessPrivilege";
	const wchar* SE_INC_BASE_PRIORITY_NAME      = "SeIncreaseBasePriorityPrivilege";
	const wchar* SE_CREATE_PAGEFILE_NAME        = "SeCreatePagefilePrivilege";
	const wchar* SE_CREATE_PERMANENT_NAME       = "SeCreatePermanentPrivilege";
	const wchar* SE_BACKUP_NAME                 = "SeBackupPrivilege";
	const wchar* SE_RESTORE_NAME                = "SeRestorePrivilege";
	const wchar* SE_SHUTDOWN_NAME               = "SeShutdownPrivilege";
	const wchar* SE_DEBUG_NAME                  = "SeDebugPrivilege";
	const wchar* SE_AUDIT_NAME                  = "SeAuditPrivilege";
	const wchar* SE_SYSTEM_ENVIRONMENT_NAME     = "SeSystemEnvironmentPrivilege";
	const wchar* SE_CHANGE_NOTIFY_NAME          = "SeChangeNotifyPrivilege";
	const wchar* SE_REMOTE_SHUTDOWN_NAME        = "SeRemoteShutdownPrivilege";
	const wchar* SE_UNDOCK_NAME                 = "SeUndockPrivilege";
	const wchar* SE_SYNC_AGENT_NAME             = "SeSyncAgentPrivilege";
	const wchar* SE_ENABLE_DELEGATION_NAME      = "SeEnableDelegationPrivilege";
	const wchar* SE_MANAGE_VOLUME_NAME          = "SeManageVolumePrivilege";
	const wchar* SE_IMPERSONATE_NAME            = "SeImpersonatePrivilege";
	const wchar* SE_CREATE_GLOBAL_NAME          = "SeCreateGlobalPrivilege";
	const wchar* SE_TRUSTED_CREDMAN_ACCESS_NAME = "SeTrustedCredManAccessPrivilege";
	const wchar* SE_RELABEL_NAME                = "SeRelabelPrivilege";
	const wchar* SE_INC_WORKING_SET_NAME        = "SeIncreaseWorkingSetPrivilege";
	const wchar* SE_TIME_ZONE_NAME              = "SeTimeZonePrivilege";
	const wchar* SE_CREATE_SYMBOLIC_LINK_NAME   = "SeCreateSymbolicLinkPrivilege";
}else{
	const char* SE_CREATE_TOKEN_NAME           = "SeCreateTokenPrivilege";
	const char* SE_ASSIGNPRIMARYTOKEN_NAME     = "SeAssignPrimaryTokenPrivilege";
	const char* SE_LOCK_MEMORY_NAME            = "SeLockMemoryPrivilege";
	const char* SE_INCREASE_QUOTA_NAME         = "SeIncreaseQuotaPrivilege";
	const char* SE_UNSOLICITED_INPUT_NAME      = "SeUnsolicitedInputPrivilege";
	const char* SE_MACHINE_ACCOUNT_NAME        = "SeMachineAccountPrivilege";
	const char* SE_TCB_NAME                    = "SeTcbPrivilege";
	const char* SE_SECURITY_NAME               = "SeSecurityPrivilege";
	const char* SE_TAKE_OWNERSHIP_NAME         = "SeTakeOwnershipPrivilege";
	const char* SE_LOAD_DRIVER_NAME            = "SeLoadDriverPrivilege";
	const char* SE_SYSTEM_PROFILE_NAME         = "SeSystemProfilePrivilege";
	const char* SE_SYSTEMTIME_NAME             = "SeSystemtimePrivilege";
	const char* SE_PROF_SINGLE_PROCESS_NAME    = "SeProfileSingleProcessPrivilege";
	const char* SE_INC_BASE_PRIORITY_NAME      = "SeIncreaseBasePriorityPrivilege";
	const char* SE_CREATE_PAGEFILE_NAME        = "SeCreatePagefilePrivilege";
	const char* SE_CREATE_PERMANENT_NAME       = "SeCreatePermanentPrivilege";
	const char* SE_BACKUP_NAME                 = "SeBackupPrivilege";
	const char* SE_RESTORE_NAME                = "SeRestorePrivilege";
	const char* SE_SHUTDOWN_NAME               = "SeShutdownPrivilege";
	const char* SE_DEBUG_NAME                  = "SeDebugPrivilege";
	const char* SE_AUDIT_NAME                  = "SeAuditPrivilege";
	const char* SE_SYSTEM_ENVIRONMENT_NAME     = "SeSystemEnvironmentPrivilege";
	const char* SE_CHANGE_NOTIFY_NAME          = "SeChangeNotifyPrivilege";
	const char* SE_REMOTE_SHUTDOWN_NAME        = "SeRemoteShutdownPrivilege";
	const char* SE_UNDOCK_NAME                 = "SeUndockPrivilege";
	const char* SE_SYNC_AGENT_NAME             = "SeSyncAgentPrivilege";
	const char* SE_ENABLE_DELEGATION_NAME      = "SeEnableDelegationPrivilege";
	const char* SE_MANAGE_VOLUME_NAME          = "SeManageVolumePrivilege";
	const char* SE_IMPERSONATE_NAME            = "SeImpersonatePrivilege";
	const char* SE_CREATE_GLOBAL_NAME          = "SeCreateGlobalPrivilege";
	const char* SE_TRUSTED_CREDMAN_ACCESS_NAME = "SeTrustedCredManAccessPrivilege";
	const char* SE_RELABEL_NAME                = "SeRelabelPrivilege";
	const char* SE_INC_WORKING_SET_NAME        = "SeIncreaseWorkingSetPrivilege";
	const char* SE_TIME_ZONE_NAME              = "SeTimeZonePrivilege";
	const char* SE_CREATE_SYMBOLIC_LINK_NAME   = "SeCreateSymbolicLinkPrivilege";
}

enum {
	SecurityAnonymous,
	SecurityIdentification,
	SecurityImpersonation,
	SecurityDelegation
}
alias int SECURITY_IMPERSONATION_LEVEL;
alias SECURITY_IMPERSONATION_LEVEL* PSECURITY_IMPERSONATION_LEVEL;

enum {
	SECURITY_MAX_IMPERSONATION_LEVEL = SecurityDelegation,
	SECURITY_MIN_IMPERSONATION_LEVEL = SecurityAnonymous,
	DEFAULT_IMPERSONATION_LEVEL      = SecurityImpersonation
}

bool VALID_IMPERSONATION_LEVEL(int L)
{
	return (((L) >= SECURITY_MIN_IMPERSONATION_LEVEL) && ((L) <= SECURITY_MAX_IMPERSONATION_LEVEL));
}

enum {
	TOKEN_ASSIGN_PRIMARY    = 0x0001,
	TOKEN_DUPLICATE         = 0x0002,
	TOKEN_IMPERSONATE       = 0x0004,
	TOKEN_QUERY             = 0x0008,
	TOKEN_QUERY_SOURCE      = 0x0010,
	TOKEN_ADJUST_PRIVILEGES = 0x0020,
	TOKEN_ADJUST_GROUPS     = 0x0040,
	TOKEN_ADJUST_DEFAULT    = 0x0080,
	TOKEN_ADJUST_SESSIONID  = 0x0100,
	TOKEN_ALL_ACCESS_P      = STANDARD_RIGHTS_REQUIRED | TOKEN_ASSIGN_PRIMARY | TOKEN_DUPLICATE | TOKEN_IMPERSONATE | TOKEN_QUERY | TOKEN_QUERY_SOURCE | TOKEN_ADJUST_PRIVILEGES | TOKEN_ADJUST_GROUPS | TOKEN_ADJUST_DEFAULT
}
enum TOKEN_ALL_ACCESS = TOKEN_ALL_ACCESS_P | TOKEN_ADJUST_SESSIONID;

enum {
	TOKEN_READ       = STANDARD_RIGHTS_READ | TOKEN_QUERY,
	TOKEN_WRITE      = STANDARD_RIGHTS_WRITE | TOKEN_ADJUST_PRIVILEGES | TOKEN_ADJUST_GROUPS | TOKEN_ADJUST_DEFAULT,
	TOKEN_EXECUTE    = STANDARD_RIGHTS_EXECUTE,
}

enum {
	TokenPrimary = 1,
	TokenImpersonation
}
alias int TOKEN_TYPE;
alias TOKEN_TYPE* PTOKEN_TYPE;

enum {
	TokenElevationTypeDefault = 1,
	TokenElevationTypeFull,
	TokenElevationTypeLimited,
}
alias int TOKEN_ELEVATION_TYPE;
alias TOKEN_ELEVATION_TYPE* PTOKEN_ELEVATION_TYPE;

enum {
	TokenUser = 1,
	TokenGroups,
	TokenPrivileges,
	TokenOwner,
	TokenPrimaryGroup,
	TokenDefaultDacl,
	TokenSource,
	TokenType,
	TokenImpersonationLevel,
	TokenStatistics,
	TokenRestrictedSids,
	TokenSessionId,
	TokenGroupsAndPrivileges,
	TokenSessionReference,
	TokenSandBoxInert,
	TokenAuditPolicy,
	TokenOrigin,
	TokenElevationType,
	TokenLinkedToken,
	TokenElevation,
	TokenHasRestrictions,
	TokenAccessInformation,
	TokenVirtualizationAllowed,
	TokenVirtualizationEnabled,
	TokenIntegrityLevel,
	TokenUIAccess,
	TokenMandatoryPolicy,
	TokenLogonSid,
	MaxTokenInfoClass
}
alias int TOKEN_INFORMATION_CLASS;
alias TOKEN_INFORMATION_CLASS* PTOKEN_INFORMATION_CLASS;

struct TOKEN_USER {
	SID_AND_ATTRIBUTES User;
}
alias TOKEN_USER* PTOKEN_USER;

struct TOKEN_GROUPS {
	DWORD GroupCount;
	SID_AND_ATTRIBUTES[ANYSIZE_ARRAY] Groups;
}
alias TOKEN_GROUPS* PTOKEN_GROUPS;

struct TOKEN_PRIVILEGES {
	DWORD PrivilegeCount;
	LUID_AND_ATTRIBUTES[ANYSIZE_ARRAY] Privileges;
}
alias TOKEN_PRIVILEGES* PTOKEN_PRIVILEGES;

struct TOKEN_OWNER {
	PSID Owner;
}
alias TOKEN_OWNER* PTOKEN_OWNER;

struct TOKEN_PRIMARY_GROUP {
	PSID PrimaryGroup;
}
alias TOKEN_PRIMARY_GROUP* PTOKEN_PRIMARY_GROUP;

struct TOKEN_DEFAULT_DACL {
	PACL DefaultDacl;
}
alias TOKEN_DEFAULT_DACL* PTOKEN_DEFAULT_DACL;

struct TOKEN_GROUPS_AND_PRIVILEGES {
	DWORD SidCount;
	DWORD SidLength;
	PSID_AND_ATTRIBUTES Sids;
	DWORD RestrictedSidCount;
	DWORD RestrictedSidLength;
	PSID_AND_ATTRIBUTES RestrictedSids;
	DWORD PrivilegeCount;
	DWORD PrivilegeLength;
	PLUID_AND_ATTRIBUTES Privileges;
	LUID AuthenticationId;
}
alias TOKEN_GROUPS_AND_PRIVILEGES* PTOKEN_GROUPS_AND_PRIVILEGES;

struct TOKEN_LINKED_TOKEN {
	HANDLE LinkedToken;
}
alias TOKEN_LINKED_TOKEN* PTOKEN_LINKED_TOKEN;

struct TOKEN_ELEVATION {
	DWORD TokenIsElevated;
}
alias TOKEN_ELEVATION* PTOKEN_ELEVATION;

struct TOKEN_MANDATORY_LABEL {
	SID_AND_ATTRIBUTES Label;
}
alias TOKEN_MANDATORY_LABEL* PTOKEN_MANDATORY_LABEL;

enum {
	TOKEN_MANDATORY_POLICY_OFF             = 0x0,
	TOKEN_MANDATORY_POLICY_NO_WRITE_UP     = 0x1,
	TOKEN_MANDATORY_POLICY_NEW_PROCESS_MIN = 0x2,
	TOKEN_MANDATORY_POLICY_VALID_MASK      = TOKEN_MANDATORY_POLICY_NO_WRITE_UP | TOKEN_MANDATORY_POLICY_NEW_PROCESS_MIN,
}

struct TOKEN_MANDATORY_POLICY {
	DWORD Policy;
}
alias TOKEN_MANDATORY_POLICY* PTOKEN_MANDATORY_POLICY;

struct TOKEN_ACCESS_INFORMATION {
	PSID_AND_ATTRIBUTES_HASH SidHash;
	PSID_AND_ATTRIBUTES_HASH RestrictedSidHash;
	PTOKEN_PRIVILEGES Privileges;
	LUID AuthenticationId;
	TOKEN_TYPE TokenType;
	SECURITY_IMPERSONATION_LEVEL ImpersonationLevel;
	TOKEN_MANDATORY_POLICY MandatoryPolicy;
	DWORD Flags;
}
alias TOKEN_ACCESS_INFORMATION* PTOKEN_ACCESS_INFORMATION;

enum POLICY_AUDIT_SUBCATEGORY_COUNT = 53;

struct TOKEN_AUDIT_POLICY {
	BYTE[((POLICY_AUDIT_SUBCATEGORY_COUNT) >> 1) + 1] PerUserPolicy;
}
alias TOKEN_AUDIT_POLICY* PTOKEN_AUDIT_POLICY;

enum TOKEN_SOURCE_LENGTH = 8;

struct TOKEN_SOURCE {
	CHAR[TOKEN_SOURCE_LENGTH] SourceName;
	LUID SourceIdentifier;
}
alias TOKEN_SOURCE* PTOKEN_SOURCE;

struct TOKEN_STATISTICS {
	LUID TokenId;
	LUID AuthenticationId;
	LARGE_INTEGER ExpirationTime;
	TOKEN_TYPE TokenType;
	SECURITY_IMPERSONATION_LEVEL ImpersonationLevel;
	DWORD DynamicCharged;
	DWORD DynamicAvailable;
	DWORD GroupCount;
	DWORD PrivilegeCount;
	LUID ModifiedId;
}
alias TOKEN_STATISTICS* PTOKEN_STATISTICS;

struct TOKEN_CONTROL {
	LUID TokenId;
	LUID AuthenticationId;
	LUID ModifiedId;
	TOKEN_SOURCE TokenSource;
}
alias TOKEN_CONTROL* PTOKEN_CONTROL;

struct TOKEN_ORIGIN {
	LUID OriginatingLogonSession;
}
alias TOKEN_ORIGIN* PTOKEN_ORIGIN;

enum {
	MandatoryLevelUntrusted = 0,
	MandatoryLevelLow,
	MandatoryLevelMedium,
	MandatoryLevelHigh,
	MandatoryLevelSystem,
	MandatoryLevelSecureProcess,
	MandatoryLevelCount
}
alias int MANDATORY_LEVEL;
alias MANDATORY_LEVEL* PMANDATORY_LEVEL;

enum {
	SECURITY_DYNAMIC_TRACKING = TRUE,
	SECURITY_STATIC_TRACKING  = FALSE,
}
alias BOOLEAN SECURITY_CONTEXT_TRACKING_MODE;
alias SECURITY_CONTEXT_TRACKING_MODE* PSECURITY_CONTEXT_TRACKING_MODE;

struct SECURITY_QUALITY_OF_SERVICE {
	DWORD Length;
	SECURITY_IMPERSONATION_LEVEL ImpersonationLevel;
	SECURITY_CONTEXT_TRACKING_MODE ContextTrackingMode;
	BOOLEAN EffectiveOnly;
}
alias SECURITY_QUALITY_OF_SERVICE* PSECURITY_QUALITY_OF_SERVICE;

struct SE_IMPERSONATION_STATE {
	PACCESS_TOKEN Token;
	BOOLEAN CopyOnOpen;
	BOOLEAN EffectiveOnly;
	SECURITY_IMPERSONATION_LEVEL Level;
}
alias SE_IMPERSONATION_STATE* PSE_IMPERSONATION_STATE;

enum {
	DISABLE_MAX_PRIVILEGE = 0x1,
	SANDBOX_INERT         = 0x2,
	LUA_TOKEN             = 0x4,
	WRITE_RESTRICTED      = 0x8,
}
alias DWORD SECURITY_INFORMATION;
alias SECURITY_INFORMATION* PSECURITY_INFORMATION;

enum {
	OWNER_SECURITY_INFORMATION = 0x00000001,
	GROUP_SECURITY_INFORMATION = 0x00000002,
	DACL_SECURITY_INFORMATION  = 0x00000004,
	SACL_SECURITY_INFORMATION  = 0x00000008,
	LABEL_SECURITY_INFORMATION = 0x00000010,
}

enum {
	PROTECTED_DACL_SECURITY_INFORMATION   = 0x80000000,
	PROTECTED_SACL_SECURITY_INFORMATION   = 0x40000000,
	UNPROTECTED_DACL_SECURITY_INFORMATION = 0x20000000,
	UNPROTECTED_SACL_SECURITY_INFORMATION = 0x10000000,
}

enum {
	PROCESS_TERMINATE                 = 0x0001,
	PROCESS_CREATE_THREAD             = 0x0002,
	PROCESS_SET_SESSIONID             = 0x0004,
	PROCESS_VM_OPERATION              = 0x0008,
	PROCESS_VM_READ                   = 0x0010,
	PROCESS_VM_WRITE                  = 0x0020,
	PROCESS_DUP_HANDLE                = 0x0040,
	PROCESS_CREATE_PROCESS            = 0x0080,
	PROCESS_SET_QUOTA                 = 0x0100,
	PROCESS_SET_INFORMATION           = 0x0200,
	PROCESS_QUERY_INFORMATION         = 0x0400,
	PROCESS_SUSPEND_RESUME            = 0x0800,
	PROCESS_QUERY_LIMITED_INFORMATION = 0x1000,
}
//(NTDDI_VERSION >= NTDDI_VISTA)
	enum PROCESS_ALL_ACCESS = STANDARD_RIGHTS_REQUIRED | SYNCHRONIZE | 0xFFFF;
//}else{
//	enum PROCESS_ALL_ACCESS = STANDARD_RIGHTS_REQUIRED | SYNCHRONIZE | 0xFFF;
//}

version(Win64){
	enum MAXIMUM_PROC_PER_GROUP = 64;
}else{
	enum MAXIMUM_PROC_PER_GROUP = 32;
}

enum MAXIMUM_PROCESSORS = MAXIMUM_PROC_PER_GROUP;

enum {
	THREAD_TERMINATE                 = 0x0001,
	THREAD_SUSPEND_RESUME            = 0x0002,
	THREAD_GET_CONTEXT               = 0x0008,
	THREAD_SET_CONTEXT               = 0x0010,
	THREAD_QUERY_INFORMATION         = 0x0040,
	THREAD_SET_INFORMATION           = 0x0020,
	THREAD_SET_THREAD_TOKEN          = 0x0080,
	THREAD_IMPERSONATE               = 0x0100,
	THREAD_DIRECT_IMPERSONATION      = 0x0200,
	THREAD_SET_LIMITED_INFORMATION   = 0x0400,
	THREAD_QUERY_LIMITED_INFORMATION = 0x0800,
}
//(NTDDI_VERSION >= NTDDI_VISTA)
	enum THREAD_ALL_ACCESS = STANDARD_RIGHTS_REQUIRED | SYNCHRONIZE | 0xFFFF;
//}else{
//	enum THREAD_ALL_ACCESS = STANDARD_RIGHTS_REQUIRED | SYNCHRONIZE | 0x3FF;
//}

enum {
	JOB_OBJECT_ASSIGN_PROCESS          = 0x0001,
	JOB_OBJECT_SET_ATTRIBUTES          = 0x0002,
	JOB_OBJECT_QUERY                   = 0x0004,
	JOB_OBJECT_TERMINATE               = 0x0008,
	JOB_OBJECT_SET_SECURITY_ATTRIBUTES = 0x0010,
	JOB_OBJECT_ALL_ACCESS              = STANDARD_RIGHTS_REQUIRED | SYNCHRONIZE | 0x1F,
}

struct JOB_SET_ARRAY {
	HANDLE JobHandle;
	DWORD MemberLevel;
	DWORD Flags;
}
alias JOB_SET_ARRAY* PJOB_SET_ARRAY;

enum {
	FLS_MAXIMUM_AVAILABLE = 128,
	TLS_MINIMUM_AVAILABLE = 64,
}

struct NT_TIB {
	EXCEPTION_REGISTRATION_RECORD* ExceptionList;
	PVOID StackBase;
	PVOID StackLimit;
	PVOID SubSystemTib;
	union {
		PVOID FiberData;
		DWORD Version;
	}
	PVOID ArbitraryUserPointer;
	NT_TIB* Self;
}
alias NT_TIB* PNT_TIB;

struct NT_TIB32 {
	DWORD ExceptionList;
	DWORD StackBase;
	DWORD StackLimit;
	DWORD SubSystemTib;
	union {
		DWORD FiberData;
		DWORD Version;
	}
	DWORD ArbitraryUserPointer;
	DWORD Self;
}
alias NT_TIB32* PNT_TIB32;

struct NT_TIB64 {
	DWORD64 ExceptionList;
	DWORD64 StackBase;
	DWORD64 StackLimit;
	DWORD64 SubSystemTib;
	union {
		DWORD64 FiberData;
		DWORD Version;
	}
	DWORD64 ArbitraryUserPointer;
	DWORD64 Self;
}
alias NT_TIB64* PNT_TIB64;

enum {
	THREAD_BASE_PRIORITY_LOWRT = 15,
	THREAD_BASE_PRIORITY_MAX   =  2,
	THREAD_BASE_PRIORITY_MIN   = -2,
	THREAD_BASE_PRIORITY_IDLE  = -15,
}

struct UMS_CREATE_THREAD_ATTRIBUTES {
	DWORD UmsVersion;
	PVOID UmsContext;
	PVOID UmsCompletionList;
}
alias UMS_CREATE_THREAD_ATTRIBUTES* PUMS_CREATE_THREAD_ATTRIBUTES;

struct QUOTA_LIMITS {
	SIZE_T PagedPoolLimit;
	SIZE_T NonPagedPoolLimit;
	SIZE_T MinimumWorkingSetSize;
	SIZE_T MaximumWorkingSetSize;
	SIZE_T PagefileLimit;
	LARGE_INTEGER TimeLimit;
}
alias QUOTA_LIMITS* PQUOTA_LIMITS;

enum {
	QUOTA_LIMITS_HARDWS_MIN_ENABLE  = 0x00000001,
	QUOTA_LIMITS_HARDWS_MIN_DISABLE = 0x00000002,
	QUOTA_LIMITS_HARDWS_MAX_ENABLE  = 0x00000004,
	QUOTA_LIMITS_HARDWS_MAX_DISABLE = 0x00000008,
	QUOTA_LIMITS_USE_DEFAULT_LIMITS = 0x00000010,
}

union RATE_QUOTA_LIMIT {
	DWORD RateData;
	DWORD RatePercent7Reserved025;
}
alias RATE_QUOTA_LIMIT* PRATE_QUOTA_LIMIT;

struct QUOTA_LIMITS_EX {
	SIZE_T PagedPoolLimit;
	SIZE_T NonPagedPoolLimit;
	SIZE_T MinimumWorkingSetSize;
	SIZE_T MaximumWorkingSetSize;
	SIZE_T PagefileLimit;
	LARGE_INTEGER TimeLimit;
	SIZE_T WorkingSetLimit;
	SIZE_T Reserved2;
	SIZE_T Reserved3;
	SIZE_T Reserved4;
	DWORD  Flags;
	RATE_QUOTA_LIMIT CpuRateLimit;
}
alias QUOTA_LIMITS_EX* PQUOTA_LIMITS_EX;

struct IO_COUNTERS {
	ULONGLONG ReadOperationCount;
	ULONGLONG WriteOperationCount;
	ULONGLONG  OtherOperationCount;
	ULONGLONG ReadTransferCount;
	ULONGLONG WriteTransferCount;
	ULONGLONG OtherTransferCount;
}
alias IO_COUNTERS* PIO_COUNTERS;

enum MAX_HW_COUNTERS = 16;
enum THREAD_PROFILING_FLAG_DISPATCH = 0x00000001;

enum HARDWARE_COUNTER_TYPE {
	PMCCounter,
	MaxHardwareCounterType
}
alias HARDWARE_COUNTER_TYPE* PHARDWARE_COUNTER_TYPE;

struct JOBOBJECT_BASIC_ACCOUNTING_INFORMATION {
	LARGE_INTEGER TotalUserTime;
	LARGE_INTEGER TotalKernelTime;
	LARGE_INTEGER ThisPeriodTotalUserTime;
	LARGE_INTEGER ThisPeriodTotalKernelTime;
	DWORD TotalPageFaultCount;
	DWORD TotalProcesses;
	DWORD ActiveProcesses;
	DWORD TotalTerminatedProcesses;
}
alias JOBOBJECT_BASIC_ACCOUNTING_INFORMATION* PJOBOBJECT_BASIC_ACCOUNTING_INFORMATION;

struct JOBOBJECT_BASIC_LIMIT_INFORMATION {
	LARGE_INTEGER PerProcessUserTimeLimit;
	LARGE_INTEGER PerJobUserTimeLimit;
	DWORD LimitFlags;
	SIZE_T MinimumWorkingSetSize;
	SIZE_T MaximumWorkingSetSize;
	DWORD ActiveProcessLimit;
	ULONG_PTR Affinity;
	DWORD PriorityClass;
	DWORD SchedulingClass;
}
alias JOBOBJECT_BASIC_LIMIT_INFORMATION* PJOBOBJECT_BASIC_LIMIT_INFORMATION;

struct JOBOBJECT_EXTENDED_LIMIT_INFORMATION {
	JOBOBJECT_BASIC_LIMIT_INFORMATION BasicLimitInformation;
	IO_COUNTERS IoInfo;
	SIZE_T ProcessMemoryLimit;
	SIZE_T JobMemoryLimit;
	SIZE_T PeakProcessMemoryUsed;
	SIZE_T PeakJobMemoryUsed;
}
alias JOBOBJECT_EXTENDED_LIMIT_INFORMATION* PJOBOBJECT_EXTENDED_LIMIT_INFORMATION;

struct JOBOBJECT_BASIC_PROCESS_ID_LIST {
	DWORD NumberOfAssignedProcesses;
	DWORD NumberOfProcessIdsInList;
	ULONG_PTR[1] ProcessIdList;
}
alias JOBOBJECT_BASIC_PROCESS_ID_LIST* PJOBOBJECT_BASIC_PROCESS_ID_LIST;

struct JOBOBJECT_BASIC_UI_RESTRICTIONS {
	DWORD UIRestrictionsClass;
}
alias JOBOBJECT_BASIC_UI_RESTRICTIONS* PJOBOBJECT_BASIC_UI_RESTRICTIONS;

struct JOBOBJECT_SECURITY_LIMIT_INFORMATION {
	DWORD SecurityLimitFlags;
	HANDLE JobToken;
	PTOKEN_GROUPS SidsToDisable;
	PTOKEN_PRIVILEGES PrivilegesToDelete;
	PTOKEN_GROUPS RestrictedSids;
}
alias JOBOBJECT_SECURITY_LIMIT_INFORMATION* PJOBOBJECT_SECURITY_LIMIT_INFORMATION;

struct JOBOBJECT_END_OF_JOB_TIME_INFORMATION {
	DWORD EndOfJobTimeAction;
}
alias JOBOBJECT_END_OF_JOB_TIME_INFORMATION* PJOBOBJECT_END_OF_JOB_TIME_INFORMATION;

struct JOBOBJECT_ASSOCIATE_COMPLETION_PORT {
	PVOID CompletionKey;
	HANDLE CompletionPort;
}
alias JOBOBJECT_ASSOCIATE_COMPLETION_PORT* PJOBOBJECT_ASSOCIATE_COMPLETION_PORT;

struct JOBOBJECT_BASIC_AND_IO_ACCOUNTING_INFORMATION {
	JOBOBJECT_BASIC_ACCOUNTING_INFORMATION BasicInfo;
	IO_COUNTERS IoInfo;
}
alias JOBOBJECT_BASIC_AND_IO_ACCOUNTING_INFORMATION* PJOBOBJECT_BASIC_AND_IO_ACCOUNTING_INFORMATION;

struct JOBOBJECT_JOBSET_INFORMATION {
	DWORD MemberLevel;
}
alias JOBOBJECT_JOBSET_INFORMATION* PJOBOBJECT_JOBSET_INFORMATION;

enum {
	JOB_OBJECT_TERMINATE_AT_END_OF_JOB = 0,
	JOB_OBJECT_POST_AT_END_OF_JOB      = 1,
}

enum {
	JOB_OBJECT_MSG_END_OF_JOB_TIME       = 1,
	JOB_OBJECT_MSG_END_OF_PROCESS_TIME   = 2,
	JOB_OBJECT_MSG_ACTIVE_PROCESS_LIMIT  = 3,
	JOB_OBJECT_MSG_ACTIVE_PROCESS_ZERO   = 4,
	JOB_OBJECT_MSG_NEW_PROCESS           = 6,
	JOB_OBJECT_MSG_EXIT_PROCESS          = 7,
	JOB_OBJECT_MSG_ABNORMAL_EXIT_PROCESS = 8,
	JOB_OBJECT_MSG_PROCESS_MEMORY_LIMIT  = 9,
	JOB_OBJECT_MSG_JOB_MEMORY_LIMIT      = 10,
}

enum {
	JOB_OBJECT_LIMIT_WORKINGSET        = 0x00000001,
	JOB_OBJECT_LIMIT_PROCESS_TIME      = 0x00000002,
	JOB_OBJECT_LIMIT_JOB_TIME          = 0x00000004,
	JOB_OBJECT_LIMIT_ACTIVE_PROCESS    = 0x00000008,
	JOB_OBJECT_LIMIT_AFFINITY          = 0x00000010,
	JOB_OBJECT_LIMIT_PRIORITY_CLASS    = 0x00000020,
	JOB_OBJECT_LIMIT_PRESERVE_JOB_TIME = 0x00000040,
	JOB_OBJECT_LIMIT_SCHEDULING_CLASS  = 0x00000080,
}

enum {
	JOB_OBJECT_LIMIT_PROCESS_MEMORY             = 0x00000100,
	JOB_OBJECT_LIMIT_JOB_MEMORY                 = 0x00000200,
	JOB_OBJECT_LIMIT_DIE_ON_UNHANDLED_EXCEPTION = 0x00000400,
	JOB_OBJECT_LIMIT_BREAKAWAY_OK               = 0x00000800,
	JOB_OBJECT_LIMIT_SILENT_BREAKAWAY_OK        = 0x00001000,
	JOB_OBJECT_LIMIT_KILL_ON_JOB_CLOSE          = 0x00002000,
	JOB_OBJECT_LIMIT_SUBSET_AFFINITY            = 0x00004000,
	JOB_OBJECT_LIMIT_RESERVED3                  = 0x00008000,
	JOB_OBJECT_LIMIT_RESERVED4                  = 0x00010000,
	JOB_OBJECT_LIMIT_RESERVED5                  = 0x00020000,
	JOB_OBJECT_LIMIT_RESERVED6                  = 0x00040000,
}

enum JOB_OBJECT_LIMIT_VALID_FLAGS = 0x0007ffff;

enum {
	JOB_OBJECT_BASIC_LIMIT_VALID_FLAGS    = 0x000000ff,
	JOB_OBJECT_EXTENDED_LIMIT_VALID_FLAGS = 0x00007fff,
	JOB_OBJECT_RESERVED_LIMIT_VALID_FLAGS = 0x0007ffff,
}

enum {
	JOB_OBJECT_UILIMIT_NONE             = 0x00000000,
	JOB_OBJECT_UILIMIT_HANDLES          = 0x00000001,
	JOB_OBJECT_UILIMIT_READCLIPBOARD    = 0x00000002,
	JOB_OBJECT_UILIMIT_WRITECLIPBOARD   = 0x00000004,
	JOB_OBJECT_UILIMIT_SYSTEMPARAMETERS = 0x00000008,
	JOB_OBJECT_UILIMIT_DISPLAYSETTINGS  = 0x00000010,
	JOB_OBJECT_UILIMIT_GLOBALATOMS      = 0x00000020,
	JOB_OBJECT_UILIMIT_DESKTOP          = 0x00000040,
	JOB_OBJECT_UILIMIT_EXITWINDOWS      = 0x00000080,
	JOB_OBJECT_UILIMIT_ALL              = 0x000000FF,
}

enum JOB_OBJECT_UI_VALID_FLAGS = 0x000000FF;

enum {
	JOB_OBJECT_SECURITY_NO_ADMIN         = 0x00000001,
	JOB_OBJECT_SECURITY_RESTRICTED_TOKEN = 0x00000002,
	JOB_OBJECT_SECURITY_ONLY_TOKEN       = 0x00000004,
	JOB_OBJECT_SECURITY_FILTER_TOKENS    = 0x00000008,
	JOB_OBJECT_SECURITY_VALID_FLAGS      = 0x0000000f,
}

enum {
	JobObjectBasicAccountingInformation = 1,
	JobObjectBasicLimitInformation,
	JobObjectBasicProcessIdList,
	JobObjectBasicUIRestrictions,
	JobObjectSecurityLimitInformation,
	JobObjectEndOfJobTimeInformation,
	JobObjectAssociateCompletionPortInformation,
	JobObjectBasicAndIoAccountingInformation,
	JobObjectExtendedLimitInformation,
	JobObjectJobSetInformation,
	JobObjectGroupInformation,
	MaxJobObjectInfoClass
}
alias int JOBOBJECTINFOCLASS;

enum {
	EVENT_MODIFY_STATE = 0x0002,
	EVENT_ALL_ACCESS   = STANDARD_RIGHTS_REQUIRED | SYNCHRONIZE | 0x3,
}

enum {
	MUTANT_QUERY_STATE = 0x000,
	MUTANT_ALL_ACCESS  = STANDARD_RIGHTS_REQUIRED | SYNCHRONIZE | MUTANT_QUERY_STATE,
}

enum {
	SEMAPHORE_MODIFY_STATE = 0x0002,
	SEMAPHORE_ALL_ACCESS   = STANDARD_RIGHTS_REQUIRED | SYNCHRONIZE | 0x3,
}

enum {
	TIMER_QUERY_STATE  = 0x0001,
	TIMER_MODIFY_STATE = 0x0002,
	TIMER_ALL_ACCESS   = STANDARD_RIGHTS_REQUIRED | SYNCHRONIZE| TIMER_QUERY_STATE | TIMER_MODIFY_STATE,
}

enum {
	TIME_ZONE_ID_UNKNOWN  = 0,
	TIME_ZONE_ID_STANDARD = 1,
	TIME_ZONE_ID_DAYLIGHT = 2,
}

enum {
	RelationProcessorCore,
	RelationNumaNode,
	RelationCache,
	RelationProcessorPackage,
	RelationGroup,
	RelationAll = 0xffff
}
alias int LOGICAL_PROCESSOR_RELATIONSHIP;

enum LTP_PC_SMT = 0x1;

enum {
	CacheUnified,
	CacheInstruction,
	CacheData,
	CacheTrace
}
alias int PROCESSOR_CACHE_TYPE;

enum CACHE_FULLY_ASSOCIATIVE = 0xFF;

struct CACHE_DESCRIPTOR {
	BYTE Level;
	BYTE Associativity;
	WORD LineSize;
	DWORD Size;
	PROCESSOR_CACHE_TYPE Type;
}
alias CACHE_DESCRIPTOR* PCACHE_DESCRIPTOR;

struct SYSTEM_LOGICAL_PROCESSOR_INFORMATION {
	ULONG_PTR ProcessorMask;
	LOGICAL_PROCESSOR_RELATIONSHIP Relationship;
	union {
		struct {
			BYTE  Flags;
		}
		struct {
			DWORD NodeNumber;
		}
		CACHE_DESCRIPTOR Cache;
		ULONGLONG[2] Reserved;
	}
}
alias SYSTEM_LOGICAL_PROCESSOR_INFORMATION* PSYSTEM_LOGICAL_PROCESSOR_INFORMATION;

struct PROCESSOR_RELATIONSHIP {
	BYTE Flags;
	BYTE[21] Reserved;
	WORD GroupCount;
	GROUP_AFFINITY[ANYSIZE_ARRAY] GroupMask;
}
alias PROCESSOR_RELATIONSHIP* PPROCESSOR_RELATIONSHIP;

struct NUMA_NODE_RELATIONSHIP {
	DWORD NodeNumber;
	BYTE[20] Reserved;
	GROUP_AFFINITY GroupMask;
}
alias NUMA_NODE_RELATIONSHIP* PNUMA_NODE_RELATIONSHIP;

struct CACHE_RELATIONSHIP {
	BYTE Level;
	BYTE Associativity;
	WORD LineSize;
	DWORD CacheSize;
	PROCESSOR_CACHE_TYPE Type;
	BYTE[20] Reserved;
	GROUP_AFFINITY GroupMask;
}
alias CACHE_RELATIONSHIP* PCACHE_RELATIONSHIP;

struct PROCESSOR_GROUP_INFO {
	BYTE MaximumProcessorCount;
	BYTE ActiveProcessorCount;
	BYTE[38] Reserved;
	KAFFINITY ActiveProcessorMask;
}
alias PROCESSOR_GROUP_INFO* PPROCESSOR_GROUP_INFO;

struct GROUP_RELATIONSHIP {
	WORD MaximumGroupCount;
	WORD ActiveGroupCount;
	BYTE[20] Reserved;
	PROCESSOR_GROUP_INFO[ANYSIZE_ARRAY] GroupInfo;
}
alias GROUP_RELATIONSHIP* PGROUP_RELATIONSHIP;

struct SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX {
	LOGICAL_PROCESSOR_RELATIONSHIP Relationship;
	DWORD Size;
	union {
		PROCESSOR_RELATIONSHIP Processor;
		NUMA_NODE_RELATIONSHIP NumaNode;
		CACHE_RELATIONSHIP Cache;
		GROUP_RELATIONSHIP Group;
	}
}
alias SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX* PSYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX;

struct SYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION {
	DWORD64 CycleTime;
}
alias SYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION* PSYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION;

enum {
	PROCESSOR_INTEL_386     = 386,
	PROCESSOR_INTEL_486     = 486,
	PROCESSOR_INTEL_PENTIUM = 586,
	PROCESSOR_INTEL_IA64    = 2200,
	PROCESSOR_AMD_X8664     = 8664,
	PROCESSOR_MIPS_R4000    = 4000,
	PROCESSOR_ALPHA_21064   = 21064,
	PROCESSOR_PPC_601       = 601,
	PROCESSOR_PPC_603       = 603,
	PROCESSOR_PPC_604       = 604,
	PROCESSOR_PPC_620       = 620,
	PROCESSOR_HITACHI_SH3   = 10003,
	PROCESSOR_HITACHI_SH3E  = 10004,
	PROCESSOR_HITACHI_SH4   = 10005,
	PROCESSOR_MOTOROLA_821  = 821,
	PROCESSOR_SHx_SH3       = 103,
	PROCESSOR_SHx_SH4       = 104,
	PROCESSOR_STRONGARM     = 2577,
	PROCESSOR_ARM720        = 1824,
	PROCESSOR_ARM820        = 2080,
	PROCESSOR_ARM920        = 2336,
	PROCESSOR_ARM_7TDMI     = 70001,
	PROCESSOR_OPTIL         = 0x494f,
}

enum {
	PROCESSOR_ARCHITECTURE_INTEL         = 0,
	PROCESSOR_ARCHITECTURE_MIPS          = 1,
	PROCESSOR_ARCHITECTURE_ALPHA         = 2,
	PROCESSOR_ARCHITECTURE_PPC           = 3,
	PROCESSOR_ARCHITECTURE_SHX           = 4,
	PROCESSOR_ARCHITECTURE_ARM           = 5,
	PROCESSOR_ARCHITECTURE_IA64          = 6,
	PROCESSOR_ARCHITECTURE_ALPHA64       = 7,
	PROCESSOR_ARCHITECTURE_MSIL          = 8,
	PROCESSOR_ARCHITECTURE_AMD64         = 9,
	PROCESSOR_ARCHITECTURE_IA32_ON_WIN64 = 10,
	PROCESSOR_ARCHITECTURE_UNKNOWN       = 0xFFFF,
}

enum {
	PF_FLOATING_POINT_PRECISION_ERRATA = 0,
	PF_FLOATING_POINT_EMULATED         = 1,
	PF_COMPARE_EXCHANGE_DOUBLE         = 2,
	PF_MMX_INSTRUCTIONS_AVAILABLE      = 3,
	PF_PPC_MOVEMEM_64BIT_OK            = 4,
	PF_ALPHA_BYTE_INSTRUCTIONS         = 5,
	PF_XMMI_INSTRUCTIONS_AVAILABLE     = 6,
	PF_3DNOW_INSTRUCTIONS_AVAILABLE    = 7,
	PF_RDTSC_INSTRUCTION_AVAILABLE     = 8,
	PF_PAE_ENABLED                     = 9,
	PF_XMMI64_INSTRUCTIONS_AVAILABLE   = 10,
	PF_SSE_DAZ_MODE_AVAILABLE          = 11,
	PF_NX_ENABLED                      = 12,
	PF_SSE3_INSTRUCTIONS_AVAILABLE     = 13,
	PF_COMPARE_EXCHANGE128             = 14,
	PF_COMPARE64_EXCHANGE128           = 15,
	PF_CHANNELS_ENABLED                = 16,
	PF_XSAVE_ENABLED                   = 17,
}

enum {
	XSTATE_LEGACY_FLOATING_POINT = 0,
	XSTATE_LEGACY_SSE            = 1,
	XSTATE_GSSE                  = 2,
}

enum {
	XSTATE_MASK_LEGACY_FLOATING_POINT = 1L << XSTATE_LEGACY_FLOATING_POINT,
	XSTATE_MASK_LEGACY_SSE            = 1L << XSTATE_LEGACY_SSE,
	XSTATE_MASK_LEGACY                = XSTATE_MASK_LEGACY_FLOATING_POINT | XSTATE_MASK_LEGACY_SSE,
	XSTATE_MASK_GSSE                  = 1L << XSTATE_GSSE,
}

enum MAXIMUM_XSTATE_FEATURES = 64;

struct XSTATE_FEATURE {
	DWORD Offset;
	DWORD Size;
}
alias XSTATE_FEATURE* PXSTATE_FEATURE;

struct XSTATE_CONFIGURATION {
	DWORD64 EnabledFeatures;
	DWORD Size;
	DWORD OptimizedSave1;
	XSTATE_FEATURE[MAXIMUM_XSTATE_FEATURES] Features;
}
alias XSTATE_CONFIGURATION* PXSTATE_CONFIGURATION;

struct MEMORY_BASIC_INFORMATION {
	PVOID BaseAddress;
	PVOID AllocationBase;
	DWORD AllocationProtect;
	SIZE_T RegionSize;
	DWORD State;
	DWORD Protect;
	DWORD Type;
}
alias MEMORY_BASIC_INFORMATION* PMEMORY_BASIC_INFORMATION;

struct MEMORY_BASIC_INFORMATION32 {
	DWORD BaseAddress;
	DWORD AllocationBase;
	DWORD AllocationProtect;
	DWORD RegionSize;
	DWORD State;
	DWORD Protect;
	DWORD Type;
}
alias MEMORY_BASIC_INFORMATION32* PMEMORY_BASIC_INFORMATION32;

align(16)
struct MEMORY_BASIC_INFORMATION64 {
	ULONGLONG BaseAddress;
	ULONGLONG AllocationBase;
	DWORD AllocationProtect;
	DWORD __alignment1;
	ULONGLONG RegionSize;
	DWORD State;
	DWORD Protect;
	DWORD Type;
	DWORD __alignment2;
}
alias MEMORY_BASIC_INFORMATION64* PMEMORY_BASIC_INFORMATION64;

enum {
	SECTION_QUERY                = 0x0001,
	SECTION_MAP_WRITE            = 0x0002,
	SECTION_MAP_READ             = 0x0004,
	SECTION_MAP_EXECUTE          = 0x0008,
	SECTION_EXTEND_SIZE          = 0x0010,
	SECTION_MAP_EXECUTE_EXPLICIT = 0x0020,
	SECTION_ALL_ACCESS           = STANDARD_RIGHTS_REQUIRED | SECTION_QUERY| SECTION_MAP_WRITE | SECTION_MAP_READ | SECTION_MAP_EXECUTE | SECTION_EXTEND_SIZE,
	SESSION_QUERY_ACCESS         = 0x0001,
	SESSION_MODIFY_ACCESS        = 0x0002,
	SESSION_ALL_ACCESS           = STANDARD_RIGHTS_REQUIRED | SESSION_QUERY_ACCESS | SESSION_MODIFY_ACCESS,
}

enum {
	PAGE_NOACCESS          = 0x01,
	PAGE_READONLY          = 0x02,
	PAGE_READWRITE         = 0x04,
	PAGE_WRITECOPY         = 0x08,
	PAGE_EXECUTE           = 0x10,
	PAGE_EXECUTE_READ      = 0x20,
	PAGE_EXECUTE_READWRITE = 0x40,
	PAGE_EXECUTE_WRITECOPY = 0x80,
	PAGE_GUARD             = 0x100,
	PAGE_NOCACHE           = 0x200,
	PAGE_WRITECOMBINE      = 0x400,
	MEM_COMMIT             = 0x1000,
	MEM_RESERVE            = 0x2000,
	MEM_DECOMMIT           = 0x4000,
	MEM_RELEASE            = 0x8000,
	MEM_FREE               = 0x10000,
	MEM_PRIVATE            = 0x20000,
	MEM_MAPPED             = 0x40000,
	MEM_RESET              = 0x80000,
	MEM_TOP_DOWN           = 0x100000,
	MEM_WRITE_WATCH        = 0x200000,
	MEM_PHYSICAL           = 0x400000,
	MEM_ROTATE             = 0x800000,
	MEM_LARGE_PAGES        = 0x20000000,
	MEM_4MB_PAGES          = 0x80000000,
	SEC_FILE               = 0x800000,
	SEC_IMAGE              = 0x1000000,
	SEC_PROTECTED_IMAGE    = 0x2000000,
	SEC_RESERVE            = 0x4000000,
	SEC_COMMIT             = 0x8000000,
	SEC_NOCACHE            = 0x10000000,
	SEC_WRITECOMBINE       = 0x40000000,
	SEC_LARGE_PAGES        = 0x80000000,
	MEM_IMAGE              = SEC_IMAGE,
	WRITE_WATCH_FLAG_RESET = 0x01,
}

enum {
	FILE_READ_DATA            = 0x0001,
	FILE_LIST_DIRECTORY       = 0x0001,
	FILE_WRITE_DATA           = 0x0002,
	FILE_ADD_FILE             = 0x0002,
	FILE_APPEND_DATA          = 0x0004,
	FILE_ADD_SUBDIRECTORY     = 0x0004,
	FILE_CREATE_PIPE_INSTANCE = 0x0004,
	FILE_READ_EA              = 0x0008,
	FILE_WRITE_EA             = 0x0010,
	FILE_EXECUTE              = 0x0020,
	FILE_TRAVERSE             = 0x0020,
	FILE_DELETE_CHILD         = 0x0040,
	FILE_READ_ATTRIBUTES      = 0x0080,
	FILE_WRITE_ATTRIBUTES     = 0x0100,
	FILE_ALL_ACCESS           = STANDARD_RIGHTS_REQUIRED | SYNCHRONIZE | 0x1FF,
	FILE_GENERIC_READ         = STANDARD_RIGHTS_READ | FILE_READ_DATA | FILE_READ_ATTRIBUTES | FILE_READ_EA | SYNCHRONIZE,
	FILE_GENERIC_WRITE        = STANDARD_RIGHTS_WRITE | FILE_WRITE_DATA | FILE_WRITE_ATTRIBUTES | FILE_WRITE_EA | FILE_APPEND_DATA | SYNCHRONIZE,
	FILE_GENERIC_EXECUTE      = STANDARD_RIGHTS_EXECUTE | FILE_READ_ATTRIBUTES | FILE_EXECUTE | SYNCHRONIZE,
}

enum {
	FILE_SHARE_READ                    = 0x00000001,
	FILE_SHARE_WRITE                   = 0x00000002,
	FILE_SHARE_DELETE                  = 0x00000004,
	FILE_ATTRIBUTE_READONLY            = 0x00000001,
	FILE_ATTRIBUTE_HIDDEN              = 0x00000002,
	FILE_ATTRIBUTE_SYSTEM              = 0x00000004,
	FILE_ATTRIBUTE_DIRECTORY           = 0x00000010,
	FILE_ATTRIBUTE_ARCHIVE             = 0x00000020,
	FILE_ATTRIBUTE_DEVICE              = 0x00000040,
	FILE_ATTRIBUTE_NORMAL              = 0x00000080,
	FILE_ATTRIBUTE_TEMPORARY           = 0x00000100,
	FILE_ATTRIBUTE_SPARSE_FILE         = 0x00000200,
	FILE_ATTRIBUTE_REPARSE_POINT       = 0x00000400,
	FILE_ATTRIBUTE_COMPRESSED          = 0x00000800,
	FILE_ATTRIBUTE_OFFLINE             = 0x00001000,
	FILE_ATTRIBUTE_NOT_CONTENT_INDEXED = 0x00002000,
	FILE_ATTRIBUTE_ENCRYPTED           = 0x00004000,
	FILE_ATTRIBUTE_VIRTUAL             = 0x00010000,
	FILE_NOTIFY_CHANGE_FILE_NAME       = 0x00000001,
	FILE_NOTIFY_CHANGE_DIR_NAME        = 0x00000002,
	FILE_NOTIFY_CHANGE_ATTRIBUTES      = 0x00000004,
	FILE_NOTIFY_CHANGE_SIZE            = 0x00000008,
	FILE_NOTIFY_CHANGE_LAST_WRITE      = 0x00000010,
	FILE_NOTIFY_CHANGE_LAST_ACCESS     = 0x00000020,
	FILE_NOTIFY_CHANGE_CREATION        = 0x00000040,
	FILE_NOTIFY_CHANGE_SECURITY        = 0x00000100,
	FILE_ACTION_ADDED                  = 0x00000001,
	FILE_ACTION_REMOVED                = 0x00000002,
	FILE_ACTION_MODIFIED               = 0x00000003,
	FILE_ACTION_RENAMED_OLD_NAME       = 0x00000004,
	FILE_ACTION_RENAMED_NEW_NAME       = 0x00000005,
	MAILSLOT_NO_MESSAGE                = cast(DWORD)-1,
	MAILSLOT_WAIT_FOREVER              = cast(DWORD)-1,
	FILE_CASE_SENSITIVE_SEARCH         = 0x00000001,
	FILE_CASE_PRESERVED_NAMES          = 0x00000002,
	FILE_UNICODE_ON_DISK               = 0x00000004,
	FILE_PERSISTENT_ACLS               = 0x00000008,
	FILE_FILE_COMPRESSION              = 0x00000010,
	FILE_VOLUME_QUOTAS                 = 0x00000020,
	FILE_SUPPORTS_SPARSE_FILES         = 0x00000040,
	FILE_SUPPORTS_REPARSE_POINTS       = 0x00000080,
	FILE_SUPPORTS_REMOTE_STORAGE       = 0x00000100,
	FILE_VOLUME_IS_COMPRESSED          = 0x00008000,
	FILE_SUPPORTS_OBJECT_IDS           = 0x00010000,
	FILE_SUPPORTS_ENCRYPTION           = 0x00020000,
	FILE_NAMED_STREAMS                 = 0x00040000,
	FILE_READ_ONLY_VOLUME              = 0x00080000,
	FILE_SEQUENTIAL_WRITE_ONCE         = 0x00100000,
	FILE_SUPPORTS_TRANSACTIONS         = 0x00200000,
	FILE_SUPPORTS_HARD_LINKS           = 0x00400000,
	FILE_SUPPORTS_EXTENDED_ATTRIBUTES  = 0x00800000,
	FILE_SUPPORTS_OPEN_BY_FILE_ID      = 0x01000000,
	FILE_SUPPORTS_USN_JOURNAL          = 0x02000000,
}

struct FILE_NOTIFY_INFORMATION {
	DWORD NextEntryOffset;
	DWORD Action;
	DWORD FileNameLength;
	WCHAR[1] FileName;
}
alias FILE_NOTIFY_INFORMATION* PFILE_NOTIFY_INFORMATION;

union FILE_SEGMENT_ELEMENT {
	PVOID64 Buffer;
	ULONGLONG Alignment;
}
alias FILE_SEGMENT_ELEMENT* PFILE_SEGMENT_ELEMENT;

struct REPARSE_GUID_DATA_BUFFER {
	DWORD ReparseTag;
	WORD ReparseDataLength;
	WORD Reserved;
	GUID ReparseGuid;
	struct {
		BYTE[1] DataBuffer;
	}
}
alias REPARSE_GUID_DATA_BUFFER* PREPARSE_GUID_DATA_BUFFER;

enum REPARSE_GUID_DATA_BUFFER_HEADER_SIZE = REPARSE_GUID_DATA_BUFFER.DataBuffer.offsetof;

enum MAXIMUM_REPARSE_DATA_BUFFER_SIZE = 16 * 1024;

enum {
	IO_REPARSE_TAG_RESERVED_ZERO = 0,
	IO_REPARSE_TAG_RESERVED_ONE  = 1,
}

enum IO_REPARSE_TAG_RESERVED_RANGE = IO_REPARSE_TAG_RESERVED_ONE;

pure nothrow
uint IsReparseTagMicrosoft(uint _tag)
{
	return _tag & 0x80000000;
}

pure nothrow
uint IsReparseTagNameSurrogate(uint _tag)
{
	return _tag & 0x20000000;
}

enum {
	IO_REPARSE_TAG_MOUNT_POINT = 0xA0000003,
	IO_REPARSE_TAG_HSM         = 0xC0000004,
	IO_REPARSE_TAG_HSM2        = 0x80000006,
	IO_REPARSE_TAG_SIS         = 0x80000007,
	IO_REPARSE_TAG_WIM         = 0x80000008,
	IO_REPARSE_TAG_CSV         = 0x80000009,
	IO_REPARSE_TAG_DFS         = 0x8000000A,
	IO_REPARSE_TAG_SYMLINK     = 0xA000000C,
	IO_REPARSE_TAG_DFSR        = 0x80000012,
}

enum {
	IO_COMPLETION_MODIFY_STATE = 0x0002,
	IO_COMPLETION_ALL_ACCESS   = STANDARD_RIGHTS_REQUIRED | SYNCHRONIZE | 0x3,
}

enum {
	DUPLICATE_CLOSE_SOURCE = 0x00000001,
	DUPLICATE_SAME_ACCESS  = 0x00000002,
}

mixin DEFINE_GUID!("GUID_MAX_POWER_SAVINGS", 0xA1841308, 0x3541, 0x4FAB, 0xBC, 0x81, 0xF7, 0x15, 0x56, 0xF2, 0x0B, 0x4A);
mixin DEFINE_GUID!("GUID_MIN_POWER_SAVINGS", 0x8C5E7FDA, 0xE8BF, 0x4A96, 0x9A, 0x85, 0xA6, 0xE2, 0x3A, 0x8C, 0x63, 0x5C);
mixin DEFINE_GUID!("GUID_TYPICAL_POWER_SAVINGS", 0x381B4222, 0xF694, 0x41F0, 0x96, 0x85, 0xFF, 0x5B, 0xB2, 0x60, 0xDF, 0x2E);
mixin DEFINE_GUID!("NO_SUBGROUP_GUID", 0xFEA3413E, 0x7E05, 0x4911, 0x9A, 0x71, 0x70, 0x03, 0x31, 0xF1, 0xC2, 0x94);
mixin DEFINE_GUID!("ALL_POWERSCHEMES_GUID", 0x68A1E95E, 0x13EA, 0x41E1, 0x80, 0x11, 0x0C, 0x49, 0x6C, 0xA4, 0x90, 0xB0);
mixin DEFINE_GUID!("GUID_POWERSCHEME_PERSONALITY", 0x245D8541, 0x3943, 0x4422, 0xB0, 0x25, 0x13, 0xA7, 0x84, 0xF6, 0x79, 0xB7);
mixin DEFINE_GUID!("GUID_ACTIVE_POWERSCHEME", 0x31F9F286, 0x5084, 0x42FE, 0xB7, 0x20, 0x2B, 0x02, 0x64, 0x99, 0x37, 0x63);
mixin DEFINE_GUID!("GUID_VIDEO_SUBGROUP", 0x7516B95F, 0xF776, 0x4464, 0x8C, 0x53, 0x06, 0x16, 0x7F, 0x40, 0xCC, 0x99);
mixin DEFINE_GUID!("GUID_VIDEO_POWERDOWN_TIMEOUT", 0x3C0BC021, 0xC8A8, 0x4E07, 0xA9, 0x73, 0x6B, 0x14, 0xCB, 0xCB, 0x2B, 0x7E);
mixin DEFINE_GUID!("GUID_VIDEO_ANNOYANCE_TIMEOUT", 0x82DBCF2D, 0xCD67, 0x40C5, 0xBF, 0xDC, 0x9F, 0x1A, 0x5C, 0xCD, 0x46, 0x63);
mixin DEFINE_GUID!("GUID_VIDEO_ADAPTIVE_PERCENT_INCREASE", 0xEED904DF, 0xB142, 0x4183, 0xB1, 0x0B, 0x5A, 0x11, 0x97, 0xA3, 0x78, 0x64);
mixin DEFINE_GUID!("GUID_VIDEO_DIM_TIMEOUT", 0x17aaa29b, 0x8b43, 0x4b94, 0xaa, 0xfe, 0x35, 0xf6, 0x4d, 0xaa, 0xf1, 0xee);
mixin DEFINE_GUID!("GUID_VIDEO_ADAPTIVE_POWERDOWN", 0x90959D22, 0xD6A1, 0x49B9, 0xAF, 0x93, 0xBC, 0xE8, 0x85, 0xAD, 0x33, 0x5B);
mixin DEFINE_GUID!("GUID_MONITOR_POWER_ON", 0x02731015, 0x4510, 0x4526, 0x99, 0xE6, 0xE5, 0xA1, 0x7E, 0xBD, 0x1A, 0xEA);
mixin DEFINE_GUID!("GUID_DEVICE_POWER_POLICY_VIDEO_BRIGHTNESS", 0xaded5e82L, 0xb909, 0x4619, 0x99, 0x49, 0xf5, 0xd7, 0x1d, 0xac, 0x0b, 0xcb);
mixin DEFINE_GUID!("GUID_DEVICE_POWER_POLICY_VIDEO_DIM_BRIGHTNESS", 0xf1fbfde2, 0xa960, 0x4165, 0x9f, 0x88, 0x50, 0x66, 0x79, 0x11, 0xce, 0x96);
mixin DEFINE_GUID!("GUID_VIDEO_CURRENT_MONITOR_BRIGHTNESS", 0x8ffee2c6, 0x2d01, 0x46be, 0xad, 0xb9, 0x39, 0x8a, 0xdd, 0xc5, 0xb4, 0xff);
mixin DEFINE_GUID!("GUID_VIDEO_ADAPTIVE_DISPLAY_BRIGHTNESS", 0xFBD9AA66, 0x9553, 0x4097, 0xBA, 0x44, 0xED, 0x6E, 0x9D, 0x65, 0xEA, 0xB8);
mixin DEFINE_GUID!("GUID_SESSION_DISPLAY_STATE", 0x73A5E93A, 0x5BB1, 0x4F93, 0x89, 0x5B, 0xDB, 0xD0, 0xDA, 0x85, 0x59, 0x67);
mixin DEFINE_GUID!("GUID_CONSOLE_DISPLAY_STATE", 0x6fe69556, 0x704a, 0x47a0, 0x8f, 0x24, 0xc2, 0x8d, 0x93, 0x6f, 0xda, 0x47);
mixin DEFINE_GUID!("GUID_ALLOW_DISPLAY_REQUIRED", 0xA9CEB8DA, 0xCD46, 0x44FB, 0xA9, 0x8B, 0x02, 0xAF, 0x69, 0xDE, 0x46, 0x23);
mixin DEFINE_GUID!("GUID_DISK_SUBGROUP", 0x0012EE47, 0x9041, 0x4B5D, 0x9B, 0x77, 0x53, 0x5F, 0xBA, 0x8B, 0x14, 0x42);
mixin DEFINE_GUID!("GUID_DISK_POWERDOWN_TIMEOUT", 0x6738E2C4, 0xE8A5, 0x4A42, 0xB1, 0x6A, 0xE0, 0x40, 0xE7, 0x69, 0x75, 0x6E);
mixin DEFINE_GUID!("GUID_DISK_BURST_IGNORE_THRESHOLD", 0x80e3c60e, 0xbb94, 0x4ad8, 0xbb, 0xe0, 0x0d, 0x31, 0x95, 0xef, 0xc6, 0x63);
mixin DEFINE_GUID!("GUID_DISK_ADAPTIVE_POWERDOWN", 0x396A32E1, 0x499A, 0x40B2, 0x91, 0x24, 0xA9, 0x6A, 0xFE, 0x70, 0x76, 0x67);
mixin DEFINE_GUID!("GUID_SLEEP_SUBGROUP", 0x238C9FA8, 0x0AAD, 0x41ED, 0x83, 0xF4, 0x97, 0xBE, 0x24, 0x2C, 0x8F, 0x20);
mixin DEFINE_GUID!("GUID_SLEEP_IDLE_THRESHOLD", 0x81cd32e0, 0x7833, 0x44f3, 0x87, 0x37, 0x70, 0x81, 0xf3, 0x8d, 0x1f, 0x70);
mixin DEFINE_GUID!("GUID_STANDBY_TIMEOUT", 0x29F6C1DB, 0x86DA, 0x48C5, 0x9F, 0xDB, 0xF2, 0xB6, 0x7B, 0x1F, 0x44, 0xDA);
mixin DEFINE_GUID!("GUID_UNATTEND_SLEEP_TIMEOUT", 0x7bc4a2f9, 0xd8fc, 0x4469, 0xb0, 0x7b, 0x33, 0xeb, 0x78, 0x5a, 0xac, 0xa0);
mixin DEFINE_GUID!("GUID_HIBERNATE_TIMEOUT", 0x9D7815A6, 0x7EE4, 0x497E, 0x88, 0x88, 0x51, 0x5A, 0x05, 0xF0, 0x23, 0x64);
mixin DEFINE_GUID!("GUID_HIBERNATE_FASTS4_POLICY", 0x94AC6D29, 0x73CE, 0x41A6, 0x80, 0x9F, 0x63, 0x63, 0xBA, 0x21, 0xB4, 0x7E);
mixin DEFINE_GUID!("GUID_CRITICAL_POWER_TRANSITION",  0xB7A27025, 0xE569, 0x46c2, 0xA5, 0x04, 0x2B, 0x96, 0xCA, 0xD2, 0x25, 0xA1);
mixin DEFINE_GUID!("GUID_SYSTEM_AWAYMODE", 0x98A7F580, 0x01F7, 0x48AA, 0x9C, 0x0F, 0x44, 0x35, 0x2C, 0x29, 0xE5, 0xC0);
mixin DEFINE_GUID!("GUID_ALLOW_AWAYMODE", 0x25dfa149, 0x5dd1, 0x4736, 0xb5, 0xab, 0xe8, 0xa3, 0x7b, 0x5b, 0x81, 0x87);
mixin DEFINE_GUID!("GUID_ALLOW_STANDBY_STATES", 0xabfc2519, 0x3608, 0x4c2a, 0x94, 0xea, 0x17, 0x1b, 0x0e, 0xd5, 0x46, 0xab);
mixin DEFINE_GUID!("GUID_ALLOW_RTC_WAKE", 0xBD3B718A, 0x0680, 0x4D9D, 0x8A, 0xB2, 0xE1, 0xD2, 0xB4, 0xAC, 0x80, 0x6D);
mixin DEFINE_GUID!("GUID_ALLOW_SYSTEM_REQUIRED", 0xA4B195F5, 0x8225, 0x47D8, 0x80, 0x12, 0x9D, 0x41, 0x36, 0x97, 0x86, 0xE2);
mixin DEFINE_GUID!("GUID_SYSTEM_BUTTON_SUBGROUP", 0x4F971E89, 0xEEBD, 0x4455, 0xA8, 0xDE, 0x9E, 0x59, 0x04, 0x0E, 0x73, 0x47);
mixin DEFINE_GUID!("GUID_POWERBUTTON_ACTION", 0x7648EFA3, 0xDD9C, 0x4E3E, 0xB5, 0x66, 0x50, 0xF9, 0x29, 0x38, 0x62, 0x80);
mixin DEFINE_GUID!("GUID_POWERBUTTON_ACTION_FLAGS", 0x857E7FAC, 0x034B, 0x4704, 0xAB, 0xB1, 0xBC, 0xA5, 0x4A, 0xA3, 0x14, 0x78);
mixin DEFINE_GUID!("GUID_SLEEPBUTTON_ACTION", 0x96996BC0, 0xAD50, 0x47EC, 0x92, 0x3B, 0x6F, 0x41, 0x87, 0x4D, 0xD9, 0xEB);
mixin DEFINE_GUID!("GUID_SLEEPBUTTON_ACTION_FLAGS", 0x2A160AB1, 0xB69D, 0x4743, 0xB7, 0x18, 0xBF, 0x14, 0x41, 0xD5, 0xE4, 0x93);
mixin DEFINE_GUID!("GUID_USERINTERFACEBUTTON_ACTION", 0xA7066653, 0x8D6C, 0x40A8, 0x91, 0x0E, 0xA1, 0xF5, 0x4B, 0x84, 0xC7, 0xE5);
mixin DEFINE_GUID!("GUID_LIDCLOSE_ACTION", 0x5CA83367, 0x6E45, 0x459F, 0xA2, 0x7B, 0x47, 0x6B, 0x1D, 0x01, 0xC9, 0x36);
mixin DEFINE_GUID!("GUID_LIDCLOSE_ACTION_FLAGS", 0x97E969AC, 0x0D6C, 0x4D08, 0x92, 0x7C, 0xD7, 0xBD, 0x7A, 0xD7, 0x85, 0x7B);
mixin DEFINE_GUID!("GUID_LIDOPEN_POWERSTATE", 0x99FF10E7, 0x23B1, 0x4C07, 0xA9, 0xD1, 0x5C, 0x32, 0x06, 0xD7, 0x41, 0xB4);
mixin DEFINE_GUID!("GUID_BATTERY_SUBGROUP", 0xE73A048D, 0xBF27, 0x4F12, 0x97, 0x31, 0x8B, 0x20, 0x76, 0xE8, 0x89, 0x1F);
mixin DEFINE_GUID!("GUID_BATTERY_DISCHARGE_ACTION_0", 0x637EA02F, 0xBBCB, 0x4015, 0x8E, 0x2C, 0xA1, 0xC7, 0xB9, 0xC0, 0xB5, 0x46);
mixin DEFINE_GUID!("GUID_BATTERY_DISCHARGE_LEVEL_0", 0x9A66D8D7, 0x4FF7, 0x4EF9, 0xB5, 0xA2, 0x5A, 0x32, 0x6C, 0xA2, 0xA4, 0x69);
mixin DEFINE_GUID!("GUID_BATTERY_DISCHARGE_FLAGS_0", 0x5dbb7c9f, 0x38e9, 0x40d2, 0x97, 0x49, 0x4f, 0x8a, 0x0e, 0x9f, 0x64, 0x0f);
mixin DEFINE_GUID!("GUID_BATTERY_DISCHARGE_ACTION_1", 0xD8742DCB, 0x3E6A, 0x4B3C, 0xB3, 0xFE, 0x37, 0x46, 0x23, 0xCD, 0xCF, 0x06);
mixin DEFINE_GUID!("GUID_BATTERY_DISCHARGE_LEVEL_1", 0x8183BA9A, 0xE910, 0x48DA, 0x87, 0x69, 0x14, 0xAE, 0x6D, 0xC1, 0x17, 0x0A);
mixin DEFINE_GUID!("GUID_BATTERY_DISCHARGE_FLAGS_1", 0xbcded951, 0x187b, 0x4d05, 0xbc, 0xcc, 0xf7, 0xe5, 0x19, 0x60, 0xc2, 0x58);
mixin DEFINE_GUID!("GUID_BATTERY_DISCHARGE_ACTION_2", 0x421CBA38, 0x1A8E, 0x4881, 0xAC, 0x89, 0xE3, 0x3A, 0x8B, 0x04, 0xEC, 0xE4);
mixin DEFINE_GUID!("GUID_BATTERY_DISCHARGE_LEVEL_2", 0x07A07CA2, 0xADAF, 0x40D7, 0xB0, 0x77, 0x53, 0x3A, 0xAD, 0xED, 0x1B, 0xFA);
mixin DEFINE_GUID!("GUID_BATTERY_DISCHARGE_FLAGS_2", 0x7fd2f0c4, 0xfeb7, 0x4da3, 0x81, 0x17, 0xe3, 0xfb, 0xed, 0xc4, 0x65, 0x82);
mixin DEFINE_GUID!("GUID_BATTERY_DISCHARGE_ACTION_3", 0x80472613, 0x9780, 0x455E, 0xB3, 0x08, 0x72, 0xD3, 0x00, 0x3C, 0xF2, 0xF8);
mixin DEFINE_GUID!("GUID_BATTERY_DISCHARGE_LEVEL_3", 0x58AFD5A6, 0xC2DD, 0x47D2, 0x9F, 0xBF, 0xEF, 0x70, 0xCC, 0x5C, 0x59, 0x65);
mixin DEFINE_GUID!("GUID_BATTERY_DISCHARGE_FLAGS_3", 0x73613ccf, 0xdbfa, 0x4279, 0x83, 0x56, 0x49, 0x35, 0xf6, 0xbf, 0x62, 0xf3);
mixin DEFINE_GUID!("GUID_PROCESSOR_SETTINGS_SUBGROUP", 0x54533251, 0x82BE, 0x4824, 0x96, 0xC1, 0x47, 0xB6, 0x0B, 0x74, 0x0D, 0x00);
mixin DEFINE_GUID!("GUID_PROCESSOR_THROTTLE_POLICY", 0x57027304, 0x4AF6, 0x4104, 0x92, 0x60, 0xE3, 0xD9, 0x52, 0x48, 0xFC, 0x36);

enum {
	PERFSTATE_POLICY_CHANGE_IDEAL  = 0,
	PERFSTATE_POLICY_CHANGE_SINGLE = 1,
	PERFSTATE_POLICY_CHANGE_ROCKET = 2,
	PERFSTATE_POLICY_CHANGE_MAX    = PERFSTATE_POLICY_CHANGE_ROCKET,
}

mixin DEFINE_GUID!("GUID_PROCESSOR_THROTTLE_MAXIMUM", 0xBC5038F7, 0x23E0, 0x4960, 0x96, 0xDA, 0x33, 0xAB, 0xAF, 0x59, 0x35, 0xEC);
mixin DEFINE_GUID!("GUID_PROCESSOR_THROTTLE_MINIMUM", 0x893DEE8E, 0x2BEF, 0x41E0, 0x89, 0xC6, 0xB5, 0x5D, 0x09, 0x29, 0x96, 0x4C);
mixin DEFINE_GUID!("GUID_PROCESSOR_ALLOW_THROTTLING", 0x3b04d4fd, 0x1cc7, 0x4f23, 0xab, 0x1c, 0xd1, 0x33, 0x78, 0x19, 0xc4, 0xbb);
mixin DEFINE_GUID!("GUID_PROCESSOR_IDLESTATE_POLICY", 0x68f262a7, 0xf621, 0x4069, 0xb9, 0xa5, 0x48, 0x74, 0x16, 0x9b, 0xe2, 0x3c);
mixin DEFINE_GUID!("GUID_PROCESSOR_PERFSTATE_POLICY", 0xBBDC3814, 0x18E9, 0x4463, 0x8A, 0x55, 0xD1, 0x97, 0x32, 0x7C, 0x45, 0xC0);
mixin DEFINE_GUID!("GUID_PROCESSOR_PERF_INCREASE_THRESHOLD", 0x06cadf0e, 0x64ed, 0x448a, 0x89, 0x27, 0xce, 0x7b, 0xf9, 0x0e, 0xb3, 0x5d);
mixin DEFINE_GUID!("GUID_PROCESSOR_PERF_DECREASE_THRESHOLD", 0x12a0ab44, 0xfe28, 0x4fa9, 0xb3, 0xbd, 0x4b, 0x64, 0xf4, 0x49, 0x60, 0xa6);
mixin DEFINE_GUID!("GUID_PROCESSOR_PERF_INCREASE_POLICY", 0x465e1f50, 0xb610, 0x473a, 0xab, 0x58, 0x0, 0xd1, 0x7, 0x7d, 0xc4, 0x18);
mixin DEFINE_GUID!("GUID_PROCESSOR_PERF_DECREASE_POLICY", 0x40fbefc7, 0x2e9d, 0x4d25, 0xa1, 0x85, 0xc, 0xfd, 0x85, 0x74, 0xba, 0xc6);
mixin DEFINE_GUID!("GUID_PROCESSOR_PERF_INCREASE_TIME", 0x984cf492, 0x3bed, 0x4488, 0xa8, 0xf9, 0x42, 0x86, 0xc9, 0x7b, 0xf5, 0xaa);
mixin DEFINE_GUID!("GUID_PROCESSOR_PERF_DECREASE_TIME", 0xd8edeb9b, 0x95cf, 0x4f95, 0xa7, 0x3c, 0xb0, 0x61, 0x97, 0x36, 0x93, 0xc8);
mixin DEFINE_GUID!("GUID_PROCESSOR_PERF_TIME_CHECK", 0x4d2b0152, 0x7d5c, 0x498b, 0x88, 0xe2, 0x34, 0x34, 0x53, 0x92, 0xa2, 0xc5);
mixin DEFINE_GUID!("GUID_PROCESSOR_PERF_BOOST_POLICY", 0x45bcc044, 0xd885, 0x43e2, 0x86, 0x5, 0xee, 0xe, 0xc6, 0xe9, 0x6b, 0x59);

enum {
	PROCESSOR_PERF_BOOST_POLICY_DISABLED = 0,
	PROCESSOR_PERF_BOOST_POLICY_MAX      = 100,
}

mixin DEFINE_GUID!("GUID_PROCESSOR_IDLE_ALLOW_SCALING", 0x6c2993b0, 0x8f48, 0x481f, 0xbc, 0xc6, 0x0, 0xdd, 0x27, 0x42, 0xaa, 0x6);
mixin DEFINE_GUID!("GUID_PROCESSOR_IDLE_DISABLE", 0x5d76a2ca, 0xe8c0, 0x402f, 0xa1, 0x33, 0x21, 0x58, 0x49, 0x2d, 0x58, 0xad);
mixin DEFINE_GUID!("GUID_PROCESSOR_IDLE_TIME_CHECK", 0xc4581c31, 0x89ab, 0x4597, 0x8e, 0x2b, 0x9c, 0x9c, 0xab, 0x44, 0xe, 0x6b);
mixin DEFINE_GUID!("GUID_PROCESSOR_IDLE_DEMOTE_THRESHOLD", 0x4b92d758, 0x5a24, 0x4851, 0xa4, 0x70, 0x81, 0x5d, 0x78, 0xae, 0xe1, 0x19);
mixin DEFINE_GUID!("GUID_PROCESSOR_IDLE_PROMOTE_THRESHOLD", 0x7b224883, 0xb3cc, 0x4d79, 0x81, 0x9f, 0x83, 0x74, 0x15, 0x2c, 0xbe, 0x7c);
mixin DEFINE_GUID!("GUID_PROCESSOR_CORE_PARKING_INCREASE_THRESHOLD", 0xdf142941, 0x20f3, 0x4edf, 0x9a, 0x4a, 0x9c, 0x83, 0xd3, 0xd7, 0x17, 0xd1);
mixin DEFINE_GUID!("GUID_PROCESSOR_CORE_PARKING_DECREASE_THRESHOLD", 0x68dd2f27, 0xa4ce, 0x4e11, 0x84, 0x87, 0x37, 0x94, 0xe4, 0x13, 0x5d, 0xfa);
mixin DEFINE_GUID!("GUID_PROCESSOR_CORE_PARKING_INCREASE_POLICY", 0xc7be0679, 0x2817, 0x4d69, 0x9d, 0x02, 0x51, 0x9a, 0x53, 0x7e, 0xd0, 0xc6);

enum {
	CORE_PARKING_POLICY_CHANGE_IDEAL  = 0,
	CORE_PARKING_POLICY_CHANGE_SINGLE = 1,
	CORE_PARKING_POLICY_CHANGE_ROCKET = 2,
	CORE_PARKING_POLICY_CHANGE_MAX    = CORE_PARKING_POLICY_CHANGE_ROCKET,
}

mixin DEFINE_GUID!("GUID_PROCESSOR_CORE_PARKING_DECREASE_POLICY", 0x71021b41, 0xc749, 0x4d21, 0xbe, 0x74, 0xa0, 0x0f, 0x33, 0x5d, 0x58, 0x2b);
mixin DEFINE_GUID!("GUID_PROCESSOR_CORE_PARKING_MAX_CORES", 0xea062031, 0x0e34, 0x4ff1, 0x9b, 0x6d, 0xeb, 0x10, 0x59, 0x33, 0x40, 0x28);
mixin DEFINE_GUID!("GUID_PROCESSOR_CORE_PARKING_MIN_CORES", 0x0cc5b647, 0xc1df, 0x4637, 0x89, 0x1a, 0xde, 0xc3, 0x5c, 0x31, 0x85, 0x83);
mixin DEFINE_GUID!("GUID_PROCESSOR_CORE_PARKING_INCREASE_TIME", 0x2ddd5a84, 0x5a71, 0x437e, 0x91, 0x2a, 0xdb, 0x0b, 0x8c, 0x78, 0x87, 0x32);
mixin DEFINE_GUID!("GUID_PROCESSOR_CORE_PARKING_DECREASE_TIME", 0xdfd10d17, 0xd5eb, 0x45dd, 0x87, 0x7a, 0x9a, 0x34, 0xdd, 0xd1, 0x5c, 0x82);
mixin DEFINE_GUID!("GUID_PROCESSOR_CORE_PARKING_AFFINITY_HISTORY_DECREASE_FACTOR", 0x8f7b45e3, 0xc393, 0x480a, 0x87, 0x8c, 0xf6, 0x7a, 0xc3, 0xd0, 0x70, 0x82);
mixin DEFINE_GUID!("GUID_PROCESSOR_CORE_PARKING_AFFINITY_HISTORY_THRESHOLD", 0x5b33697b, 0xe89d, 0x4d38, 0xaa, 0x46, 0x9e, 0x7d, 0xfb, 0x7c, 0xd2, 0xf9);
mixin DEFINE_GUID!("GUID_PROCESSOR_CORE_PARKING_AFFINITY_WEIGHTING", 0xe70867f1, 0xfa2f, 0x4f4e, 0xae, 0xa1, 0x4d, 0x8a, 0x0b, 0xa2, 0x3b, 0x20);
mixin DEFINE_GUID!("GUID_PROCESSOR_CORE_PARKING_OVER_UTILIZATION_HISTORY_DECREASE_FACTOR", 0x1299023c, 0xbc28, 0x4f0a, 0x81, 0xec, 0xd3, 0x29, 0x5a, 0x8d, 0x81, 0x5d);
mixin DEFINE_GUID!("GUID_PROCESSOR_CORE_PARKING_OVER_UTILIZATION_HISTORY_THRESHOLD", 0x9ac18e92, 0xaa3c, 0x4e27, 0xb3, 0x07, 0x01, 0xae, 0x37, 0x30, 0x71, 0x29);
mixin DEFINE_GUID!("GUID_PROCESSOR_CORE_PARKING_OVER_UTILIZATION_WEIGHTING", 0x8809c2d8, 0xb155, 0x42d4, 0xbc, 0xda, 0x0d, 0x34, 0x56, 0x51, 0xb1, 0xdb);
mixin DEFINE_GUID!("GUID_PROCESSOR_CORE_PARKING_OVER_UTILIZATION_THRESHOLD", 0x943c8cb6, 0x6f93, 0x4227, 0xad, 0x87, 0xe9, 0xa3, 0xfe, 0xec, 0x08, 0xd1);
mixin DEFINE_GUID!("GUID_PROCESSOR_PARKING_CORE_OVERRIDE", 0xa55612aa, 0xf624, 0x42c6, 0xa4, 0x43, 0x73, 0x97, 0xd0, 0x64, 0xc0, 0x4f);
mixin DEFINE_GUID!("GUID_PROCESSOR_PARKING_PERF_STATE", 0x447235c7, 0x6a8d, 0x4cc0, 0x8e, 0x24, 0x9e, 0xaf, 0x70, 0xb9, 0x6e, 0x2b);
mixin DEFINE_GUID!("GUID_PROCESSOR_PERF_HISTORY", 0x7d24baa7, 0x0b84, 0x480f, 0x84, 0x0c, 0x1b, 0x07, 0x43, 0xc0, 0x0f, 0x5f);
mixin DEFINE_GUID!("GUID_SYSTEM_COOLING_POLICY", 0x94D3A615, 0xA899, 0x4AC5, 0xAE, 0x2B, 0xE4, 0xD8, 0xF6, 0x34, 0x36, 0x7F);
mixin DEFINE_GUID!("GUID_LOCK_CONSOLE_ON_WAKE", 0x0E796BDB, 0x100D, 0x47D6, 0xA2, 0xD5, 0xF7, 0xD2, 0xDA, 0xA5, 0x1F, 0x51);
mixin DEFINE_GUID!("GUID_DEVICE_IDLE_POLICY", 0x4faab71a, 0x92e5, 0x4726, 0xb5, 0x31, 0x22, 0x45, 0x59, 0x67, 0x2d, 0x19);

enum {
	POWER_DEVICE_IDLE_POLICY_PERFORMANCE  = 0,
	POWER_DEVICE_IDLE_POLICY_CONSERVATIVE = 1,
}

mixin DEFINE_GUID!("GUID_ACDC_POWER_SOURCE", 0x5D3E9A59, 0xE9D5, 0x4B00, 0xA6, 0xBD, 0xFF, 0x34, 0xFF, 0x51, 0x65, 0x48);
mixin DEFINE_GUID!("GUID_LIDSWITCH_STATE_CHANGE",  0xBA3E0F4D, 0xB817, 0x4094, 0xA2, 0xD1, 0xD5, 0x63, 0x79, 0xE6, 0xA0, 0xF3);
mixin DEFINE_GUID!("GUID_BATTERY_PERCENTAGE_REMAINING", 0xA7AD8041, 0xB45A, 0x4CAE, 0x87, 0xA3, 0xEE, 0xCB, 0xB4, 0x68, 0xA9, 0xE1);
mixin DEFINE_GUID!("GUID_IDLE_BACKGROUND_TASK", 0x515C31D8, 0xF734, 0x163D, 0xA0, 0xFD, 0x11, 0xA0, 0x8C, 0x91, 0xE8, 0xF1);
mixin DEFINE_GUID!("GUID_BACKGROUND_TASK_NOTIFICATION", 0xCF23F240, 0x2A54, 0x48D8, 0xB1, 0x14, 0xDE, 0x15, 0x18, 0xFF, 0x05, 0x2E);
mixin DEFINE_GUID!("GUID_APPLAUNCH_BUTTON", 0x1A689231, 0x7399, 0x4E9A, 0x8F, 0x99, 0xB7, 0x1F, 0x99, 0x9D, 0xB3, 0xFA);
mixin DEFINE_GUID!(" GUID_PCIEXPRESS_SETTINGS_SUBGROUP", 0x501a4d13, 0x42af,0x4429, 0x9f, 0xd1, 0xa8, 0x21, 0x8c, 0x26, 0x8e, 0x20);
mixin DEFINE_GUID!("GUID_PCIEXPRESS_ASPM_POLICY", 0xee12f906, 0xd277, 0x404b, 0xb6, 0xda, 0xe5, 0xfa, 0x1a, 0x57, 0x6d, 0xf5);
mixin DEFINE_GUID!("GUID_ENABLE_SWITCH_FORCED_SHUTDOWN", 0x833a6b62, 0xdfa4, 0x46d1, 0x82, 0xf8, 0xe0, 0x9e, 0x34, 0xd0, 0x29, 0xd6);

enum {
	PowerSystemUnspecified = 0,
	PowerSystemWorking     = 1,
	PowerSystemSleeping1   = 2,
	PowerSystemSleeping2   = 3,
	PowerSystemSleeping3   = 4,
	PowerSystemHibernate   = 5,
	PowerSystemShutdown    = 6,
	PowerSystemMaximum     = 7
}
alias int SYSTEM_POWER_STATE;
alias SYSTEM_POWER_STATE* PSYSTEM_POWER_STATE;

enum POWER_SYSTEM_MAXIMUM = 7;

enum {
	PowerActionNone = 0,
	PowerActionReserved,
	PowerActionSleep,
	PowerActionHibernate,
	PowerActionShutdown,
	PowerActionShutdownReset,
	PowerActionShutdownOff,
	PowerActionWarmEject
}
alias int POWER_ACTION;
alias POWER_ACTION* PPOWER_ACTION;

enum {
	PowerDeviceUnspecified = 0,
	PowerDeviceD0,
	PowerDeviceD1,
	PowerDeviceD2,
	PowerDeviceD3,
	PowerDeviceMaximum
}
alias int DEVICE_POWER_STATE;
alias DEVICE_POWER_STATE* PDEVICE_POWER_STATE;

enum {
	PowerMonitorOff = 0,
	PowerMonitorOn,
	PowerMonitorDim
}
alias int MONITOR_DISPLAY_STATE;
alias MONITOR_DISPLAY_STATE* PMONITOR_DISPLAY_STATE;

enum {
	ES_SYSTEM_REQUIRED   = 0x00000001,
	ES_DISPLAY_REQUIRED  = 0x00000002,
	ES_USER_PRESENT      = 0x00000004,
	ES_AWAYMODE_REQUIRED = 0x00000040,
	ES_CONTINUOUS        = 0x80000000,
}
alias DWORD EXECUTION_STATE;
alias EXECUTION_STATE* PEXECUTION_STATE;

enum {
	LT_DONT_CARE,
	LT_LOWEST_LATENCY
}
alias int LATENCY_TIME;

//(_WIN32_WINNT >= _WIN32_WINNT_WIN7)
	enum {
		DIAGNOSTIC_REASON_VERSION         = 0,
		DIAGNOSTIC_REASON_SIMPLE_STRING   = 0x00000001,
		DIAGNOSTIC_REASON_DETAILED_STRING = 0x00000002,
		DIAGNOSTIC_REASON_NOT_SPECIFIED   = 0x80000000,
		DIAGNOSTIC_REASON_INVALID_FLAGS   = ~0x80000003,
	}

enum {
	POWER_REQUEST_CONTEXT_VERSION         = 0,
	POWER_REQUEST_CONTEXT_SIMPLE_STRING   = 0x00000001,
	POWER_REQUEST_CONTEXT_DETAILED_STRING = 0x00000002,
}

enum {
    PowerRequestDisplayRequired,
    PowerRequestSystemRequired,
    PowerRequestAwayModeRequired
}
alias int POWER_REQUEST_TYPE;
alias POWER_REQUEST_TYPE* PPOWER_REQUEST_TYPE;

enum PowerRequestMaximum = 3;


//(NTDDI_VERSION >= NTDDI_WINXP)
	enum {
		PDCAP_D0_SUPPORTED           = 0x00000001,
		PDCAP_D1_SUPPORTED           = 0x00000002,
		PDCAP_D2_SUPPORTED           = 0x00000004,
		PDCAP_D3_SUPPORTED           = 0x00000008,
		PDCAP_WAKE_FROM_D0_SUPPORTED = 0x00000010,
		PDCAP_WAKE_FROM_D1_SUPPORTED = 0x00000020,
		PDCAP_WAKE_FROM_D2_SUPPORTED = 0x00000040,
		PDCAP_WAKE_FROM_D3_SUPPORTED = 0x00000080,
		PDCAP_WARM_EJECT_SUPPORTED   = 0x00000100,
	}

	struct CM_POWER_DATA {
		DWORD PD_Size;
		DEVICE_POWER_STATE PD_MostRecentPowerState;
		DWORD PD_Capabilities;
		DWORD PD_D1Latency;
		DWORD PD_D2Latency;
		DWORD PD_D3Latency;
		DEVICE_POWER_STATE[POWER_SYSTEM_MAXIMUM] PD_PowerStateMapping;
		SYSTEM_POWER_STATE PD_DeepestSystemWake;
	}
	alias CM_POWER_DATA* PCM_POWER_DATA;

enum {
	SystemPowerPolicyAc,
	SystemPowerPolicyDc,
	VerifySystemPolicyAc,
	VerifySystemPolicyDc,
	SystemPowerCapabilities,
	SystemBatteryState,
	SystemPowerStateHandler,
	ProcessorStateHandler,
	SystemPowerPolicyCurrent,
	AdministratorPowerPolicy,
	SystemReserveHiberFile,
	ProcessorInformation,
	SystemPowerInformation,
	ProcessorStateHandler2,
	LastWakeTime,
	LastSleepTime,
	SystemExecutionState,
	SystemPowerStateNotifyHandler,
	ProcessorPowerPolicyAc,
	ProcessorPowerPolicyDc,
	VerifyProcessorPowerPolicyAc,
	VerifyProcessorPowerPolicyDc,
	ProcessorPowerPolicyCurrent,
	SystemPowerStateLogging,
	SystemPowerLoggingEntry,
	SetPowerSettingValue,
	NotifyUserPowerSetting,
	PowerInformationLevelUnused0,
	PowerInformationLevelUnused1,
	SystemVideoState,
	TraceApplicationPowerMessage,
	TraceApplicationPowerMessageEnd,
	ProcessorPerfStates,
	ProcessorIdleStates,
	ProcessorCap,
	SystemWakeSource,
	SystemHiberFileInformation,
	TraceServicePowerMessage,
	ProcessorLoad,
	PowerShutdownNotification,
	MonitorCapabilities,
	SessionPowerInit,
	SessionDisplayState,
	PowerRequestCreate,
	PowerRequestAction,
	GetPowerRequestList,
	ProcessorInformationEx,
	NotifyUserModeLegacyPowerEvent,
	GroupPark,
	ProcessorIdleDomains,
	WakeTimerList,
	SystemHiberFileSize,
	PowerInformationLevelMaximum
}
alias int POWER_INFORMATION_LEVEL;

enum {
	PoAc,
	PoDc,
	PoHot,
	PoConditionMaximum
}
alias int SYSTEM_POWER_CONDITION;

struct SET_POWER_SETTING_VALUE {
	DWORD Version;
	GUID Guid;
	SYSTEM_POWER_CONDITION PowerCondition;
	DWORD DataLength;
	BYTE[ANYSIZE_ARRAY] Data;
}
alias SET_POWER_SETTING_VALUE* PSET_POWER_SETTING_VALUE;

enum POWER_SETTING_VALUE_VERSION = 0x1;

struct NOTIFY_USER_POWER_SETTING {
	GUID Guid;
}
alias NOTIFY_USER_POWER_SETTING* PNOTIFY_USER_POWER_SETTING;

struct APPLICATIONLAUNCH_SETTING_VALUE {
    LARGE_INTEGER       ActivationTime;
    DWORD               Flags;
    DWORD               ButtonInstanceID;
}
alias APPLICATIONLAUNCH_SETTING_VALUE* PAPPLICATIONLAUNCH_SETTING_VALUE;

enum {
	PlatformRoleUnspecified = 0,
	PlatformRoleDesktop,
	PlatformRoleMobile,
	PlatformRoleWorkstation,
	PlatformRoleEnterpriseServer,
	PlatformRoleSOHOServer,
	PlatformRoleAppliancePC,
	PlatformRolePerformanceServer,
	PlatformRoleMaximum
}
alias int POWER_PLATFORM_ROLE;

//(NTDDI_VERSION >= NTDDI_WINXP)
	struct BATTERY_REPORTING_SCALE {
		DWORD Granularity;
		DWORD Capacity;
	}
	alias BATTERY_REPORTING_SCALE* PBATTERY_REPORTING_SCALE;

struct PPM_WMI_LEGACY_PERFSTATE {
	DWORD Frequency;
	DWORD Flags;
	DWORD PercentFrequency;
}
alias PPM_WMI_LEGACY_PERFSTATE* PPPM_WMI_LEGACY_PERFSTATE;

struct PPM_WMI_IDLE_STATE {
	DWORD Latency;
	DWORD Power;
	DWORD TimeCheck;
	BYTE PromotePercent;
	BYTE DemotePercent;
	BYTE StateType;
	BYTE Reserved;
	DWORD StateFlags;
	DWORD Context;
	DWORD IdleHandler;
	DWORD Reserved1;
}
alias PPM_WMI_IDLE_STATE* PPPM_WMI_IDLE_STATE;

struct PPM_WMI_IDLE_STATES {
	DWORD Type;
	DWORD Count;
	DWORD TargetState;
	DWORD OldState;
	DWORD64 TargetProcessors;
	PPM_WMI_IDLE_STATE[ANYSIZE_ARRAY] State;
}
alias PPM_WMI_IDLE_STATES* PPPM_WMI_IDLE_STATES;

struct PPM_WMI_IDLE_STATES_EX {
	DWORD Type;
	DWORD Count;
	DWORD TargetState;
	DWORD OldState;
	PVOID TargetProcessors;
	PPM_WMI_IDLE_STATE[ANYSIZE_ARRAY] State;
}
alias PPM_WMI_IDLE_STATES_EX* PPPM_WMI_IDLE_STATES_EX;

struct PPM_WMI_PERF_STATE {
	DWORD Frequency;
	DWORD Power;
	BYTE PercentFrequency;
	BYTE IncreaseLevel;
	BYTE DecreaseLevel;
	BYTE Type;
	DWORD IncreaseTime;
	DWORD DecreaseTime;
	DWORD64 Control;
	DWORD64 Status; 
	DWORD HitCount;
	DWORD Reserved1;
	DWORD64 Reserved2;
	DWORD64 Reserved3;
}
alias PPM_WMI_PERF_STATE* PPPM_WMI_PERF_STATE;

struct PPM_WMI_PERF_STATES {
	DWORD Count;
	DWORD MaxFrequency;
	DWORD CurrentState;
	DWORD MaxPerfState;
	DWORD MinPerfState;
	DWORD LowestPerfState;
	DWORD ThermalConstraint;
	BYTE BusyAdjThreshold;
	BYTE PolicyType;
	BYTE Type;
	BYTE Reserved;
	DWORD TimerInterval;
	DWORD64 TargetProcessors;
	DWORD PStateHandler;
	DWORD PStateContext;
	DWORD TStateHandler;
	DWORD TStateContext;
	DWORD FeedbackHandler;
	DWORD Reserved1;
	DWORD64 Reserved2;
	PPM_WMI_PERF_STATE[ANYSIZE_ARRAY] State;
}
alias PPM_WMI_PERF_STATES* PPPM_WMI_PERF_STATES;

struct PPM_WMI_PERF_STATES_EX {
	DWORD Count;
	DWORD MaxFrequency;
	DWORD CurrentState;
	DWORD MaxPerfState;
	DWORD MinPerfState;
	DWORD LowestPerfState;
	DWORD ThermalConstraint;
	BYTE BusyAdjThreshold;
	BYTE PolicyType;
	BYTE Type;
	BYTE Reserved;
	DWORD TimerInterval;
	PVOID TargetProcessors;
	DWORD PStateHandler;
	DWORD PStateContext;
	DWORD TStateHandler;
	DWORD TStateContext;
	DWORD FeedbackHandler;
	DWORD Reserved1;
	DWORD64 Reserved2;
	PPM_WMI_PERF_STATE[ANYSIZE_ARRAY] State;
}
alias PPM_WMI_PERF_STATES_EX* PPPM_WMI_PERF_STATES_EX;

enum PROC_IDLE_BUCKET_COUNT = 6;

struct PPM_IDLE_STATE_ACCOUNTING {
	DWORD IdleTransitions;
	DWORD FailedTransitions;
	DWORD InvalidBucketIndex;
	DWORD64 TotalTime;
	DWORD[PROC_IDLE_BUCKET_COUNT] IdleTimeBuckets;
}
alias PPM_IDLE_STATE_ACCOUNTING* PPPM_IDLE_STATE_ACCOUNTING;

struct PPM_IDLE_ACCOUNTING {
	DWORD StateCount;
	DWORD TotalTransitions;
	DWORD ResetCount;
	DWORD64 StartTime;
	PPM_IDLE_STATE_ACCOUNTING[ANYSIZE_ARRAY] State;
}
alias PPM_IDLE_ACCOUNTING* PPPM_IDLE_ACCOUNTING;

enum PROC_IDLE_BUCKET_COUNT_EX = 16;

struct PPM_IDLE_STATE_BUCKET_EX {
	DWORD64 TotalTimeUs;
	DWORD MinTimeUs;
	DWORD MaxTimeUs;
	DWORD Count;
}
alias PPM_IDLE_STATE_BUCKET_EX* PPPM_IDLE_STATE_BUCKET_EX;

struct PPM_IDLE_STATE_ACCOUNTING_EX {
	DWORD64 TotalTime;
	DWORD IdleTransitions;
	DWORD FailedTransitions;
	DWORD InvalidBucketIndex;
	DWORD MinTimeUs;
	DWORD MaxTimeUs;
	PPM_IDLE_STATE_BUCKET_EX[PROC_IDLE_BUCKET_COUNT_EX] IdleTimeBuckets;
}
alias PPM_IDLE_STATE_ACCOUNTING_EX* PPPM_IDLE_STATE_ACCOUNTING_EX;

struct PPM_IDLE_ACCOUNTING_EX {
	DWORD StateCount;
	DWORD TotalTransitions;
	DWORD ResetCount;
	DWORD64 StartTime;
	PPM_IDLE_STATE_ACCOUNTING_EX[ANYSIZE_ARRAY] State;
}
alias PPM_IDLE_ACCOUNTING_EX* PPPM_IDLE_ACCOUNTING_EX;

enum {
	ACPI_PPM_SOFTWARE_ALL = 0xFC,
	ACPI_PPM_SOFTWARE_ANY = 0xFD,
	ACPI_PPM_HARDWARE_ALL = 0xFE,
}

enum {
	MS_PPM_SOFTWARE_ALL = 0x1,
}

enum {
	PPM_FIRMWARE_ACPI1C2      = 0x00000001,
	PPM_FIRMWARE_ACPI1C3      = 0x00000002,
	PPM_FIRMWARE_ACPI1TSTATES = 0x00000004,
	PPM_FIRMWARE_CST          = 0x00000008,
	PPM_FIRMWARE_CSD          = 0x00000010,
	PPM_FIRMWARE_PCT          = 0x00000020,
	PPM_FIRMWARE_PSS          = 0x00000040,
	PPM_FIRMWARE_XPSS         = 0x00000080,
	PPM_FIRMWARE_PPC          = 0x00000100,
	PPM_FIRMWARE_PSD          = 0x00000200,
	PPM_FIRMWARE_PTC          = 0x00000400,
	PPM_FIRMWARE_TSS          = 0x00000800,
	PPM_FIRMWARE_TPC          = 0x00001000,
	PPM_FIRMWARE_TSD          = 0x00002000,
	PPM_FIRMWARE_PCCH         = 0x00004000,
	PPM_FIRMWARE_PCCP         = 0x00008000,
}

mixin DEFINE_GUID!("PPM_PERFSTATE_CHANGE_GUID", 0xa5b32ddd, 0x7f39, 0x4abc, 0xb8, 0x92, 0x90, 0xe, 0x43, 0xb5, 0x9e, 0xbb);
mixin DEFINE_GUID!("PPM_PERFSTATE_DOMAIN_CHANGE_GUID", 0x995e6b7f, 0xd653, 0x497a, 0xb9, 0x78, 0x36, 0xa3, 0xc, 0x29, 0xbf, 0x1);
mixin DEFINE_GUID!("PPM_IDLESTATE_CHANGE_GUID", 0x4838fe4f, 0xf71c, 0x4e51, 0x9e, 0xcc, 0x84, 0x30, 0xa7, 0xac, 0x4c, 0x6c);
mixin DEFINE_GUID!("PPM_PERFSTATES_DATA_GUID", 0x5708cc20, 0x7d40, 0x4bf4, 0xb4, 0xaa, 0x2b, 0x01, 0x33, 0x8d, 0x01, 0x26);
mixin DEFINE_GUID!("PPM_IDLESTATES_DATA_GUID", 0xba138e10, 0xe250, 0x4ad7, 0x86, 0x16, 0xcf, 0x1a, 0x7a, 0xd4, 0x10, 0xe7);
mixin DEFINE_GUID!("PPM_IDLE_ACCOUNTING_GUID", 0xe2a26f78, 0xae07, 0x4ee0, 0xa3, 0x0f, 0xce, 0x54, 0xf5, 0x5a, 0x94, 0xcd);
mixin DEFINE_GUID!("PPM_IDLE_ACCOUNTING_EX_GUID", 0xd67abd39, 0x81f8, 0x4a5e, 0x81, 0x52, 0x72, 0xe3, 0x1e, 0xc9, 0x12, 0xee);
mixin DEFINE_GUID!("PPM_THERMALCONSTRAINT_GUID", 0xa852c2c8, 0x1a4c, 0x423b, 0x8c, 0x2c, 0xf3, 0x0d, 0x82, 0x93, 0x1a, 0x88);
mixin DEFINE_GUID!("PPM_PERFMON_PERFSTATE_GUID", 0x7fd18652, 0xcfe, 0x40d2, 0xb0, 0xa1, 0xb, 0x6, 0x6a, 0x87, 0x75, 0x9e);
mixin DEFINE_GUID!("PPM_THERMAL_POLICY_CHANGE_GUID", 0x48f377b8, 0x6880, 0x4c7b, 0x8b, 0xdc, 0x38, 0x1, 0x76, 0xc6, 0x65, 0x4d);

struct PPM_PERFSTATE_EVENT {
	DWORD State;
	DWORD Status;
	DWORD Latency;
	DWORD Speed;
	DWORD Processor;
}
alias PPM_PERFSTATE_EVENT* PPPM_PERFSTATE_EVENT;

struct PPM_PERFSTATE_DOMAIN_EVENT {
	DWORD State;
	DWORD Latency;
	DWORD Speed;
	DWORD64 Processors;
}
alias PPM_PERFSTATE_DOMAIN_EVENT* PPPM_PERFSTATE_DOMAIN_EVENT;

struct PPM_IDLESTATE_EVENT {
	DWORD NewState;
	DWORD OldState;
	DWORD64 Processors;
}
alias PPM_IDLESTATE_EVENT* PPPM_IDLESTATE_EVENT;

struct PPM_THERMALCHANGE_EVENT {
	DWORD ThermalConstraint;
	DWORD64 Processors;
}
alias PPM_THERMALCHANGE_EVENT* PPPM_THERMALCHANGE_EVENT;

struct PPM_THERMAL_POLICY_EVENT {
	BYTE  Mode;
	DWORD64 Processors;
}
alias PPM_THERMAL_POLICY_EVENT* PPPM_THERMAL_POLICY_EVENT;

struct POWER_ACTION_POLICY {
	POWER_ACTION Action;
	DWORD Flags;
	DWORD EventCode;
}
alias POWER_ACTION_POLICY* PPOWER_ACTION_POLICY;

enum {
	POWER_ACTION_QUERY_ALLOWED     = 0x00000001,
	POWER_ACTION_UI_ALLOWED        = 0x00000002,
	POWER_ACTION_OVERRIDE_APPS     = 0x00000004,
	POWER_ACTION_PSEUDO_TRANSITION = 0x08000000,
	POWER_ACTION_LIGHTEST_FIRST    = 0x10000000,
	POWER_ACTION_LOCK_CONSOLE      = 0x20000000,
	POWER_ACTION_DISABLE_WAKES     = 0x40000000,
	POWER_ACTION_CRITICAL          = 0x80000000,
}

enum {
	POWER_LEVEL_USER_NOTIFY_TEXT      = 0x00000001,
	POWER_LEVEL_USER_NOTIFY_SOUND     = 0x00000002,
	POWER_LEVEL_USER_NOTIFY_EXEC      = 0x00000004,
	POWER_USER_NOTIFY_BUTTON          = 0x00000008,
	POWER_USER_NOTIFY_SHUTDOWN        = 0x00000010,
	POWER_USER_NOTIFY_FORCED_SHUTDOWN = 0x00000020,
	POWER_FORCE_TRIGGER_RESET         = 0x80000000,
}

enum {
	BATTERY_DISCHARGE_FLAGS_EVENTCODE_MASK = 0x00000007,
	BATTERY_DISCHARGE_FLAGS_ENABLE         = 0x80000000,
}

struct SYSTEM_POWER_LEVEL {
	BOOLEAN Enable;
	BYTE[3] Spare;
	DWORD BatteryLevel;
	POWER_ACTION_POLICY PowerPolicy;
	SYSTEM_POWER_STATE MinSystemState;
}
alias SYSTEM_POWER_LEVEL* PSYSTEM_POWER_LEVEL;

enum {
	NUM_DISCHARGE_POLICIES      = 4,
	DISCHARGE_POLICY_CRITICAL   = 0,
	DISCHARGE_POLICY_LOW        = 1,
}

struct SYSTEM_POWER_POLICY {
	DWORD Revision;
	POWER_ACTION_POLICY PowerButton;
	POWER_ACTION_POLICY SleepButton;
	POWER_ACTION_POLICY LidClose;
	SYSTEM_POWER_STATE  LidOpenWake;
	DWORD Reserved;
	POWER_ACTION_POLICY Idle;
	DWORD IdleTimeout;
	BYTE IdleSensitivity;
	BYTE DynamicThrottle;
	BYTE[2] Spare2;
	SYSTEM_POWER_STATE MinSleep;
	SYSTEM_POWER_STATE MaxSleep;
	SYSTEM_POWER_STATE ReducedLatencySleep;
	DWORD WinLogonFlags;
	DWORD Spare3;
	DWORD DozeS4Timeout;
	DWORD BroadcastCapacityResolution;
	SYSTEM_POWER_LEVEL[NUM_DISCHARGE_POLICIES] DischargePolicy;
	DWORD VideoTimeout;
	BOOLEAN VideoDimDisplay;
	DWORD[3] VideoReserved;
	DWORD SpindownTimeout;
	BOOLEAN OptimizeForPower;
	BYTE FanThrottleTolerance;
	BYTE ForcedThrottle;
	BYTE MinThrottle;
	POWER_ACTION_POLICY OverThrottled;
}
alias SYSTEM_POWER_POLICY* PSYSTEM_POWER_POLICY;

enum PROCESSOR_IDLESTATE_POLICY_COUNT = 0x3;

struct PROCESSOR_IDLESTATE_INFO {
	DWORD TimeCheck;
	BYTE DemotePercent;
	BYTE PromotePercent;
	BYTE[2] Spare;
}
alias PROCESSOR_IDLESTATE_INFO* PPROCESSOR_IDLESTATE_INFO;

struct PROCESSOR_IDLESTATE_POLICY {
	WORD Revision;
	union {
		WORD AsWORD;
	}
	DWORD PolicyCount;
	PROCESSOR_IDLESTATE_INFO[PROCESSOR_IDLESTATE_POLICY_COUNT] Policy;
}
alias PROCESSOR_IDLESTATE_POLICY* PPROCESSOR_IDLESTATE_POLICY;

enum {
	PO_THROTTLE_NONE     = 0,
	PO_THROTTLE_CONSTANT = 1,
	PO_THROTTLE_DEGRADE  = 2,
	PO_THROTTLE_ADAPTIVE = 3,
	PO_THROTTLE_MAXIMUM  = 4,
}

struct PROCESSOR_POWER_POLICY_INFO {
	DWORD TimeCheck;
	DWORD DemoteLimit;
	DWORD PromoteLimit;
	BYTE DemotePercent;
	BYTE PromotePercent;
	BYTE[2] Spare;
	DWORD AllowDemotion1AllowPromotion1Reserved30;
}
alias PROCESSOR_POWER_POLICY_INFO* PPROCESSOR_POWER_POLICY_INFO;

struct PROCESSOR_POWER_POLICY {
	DWORD Revision;
	BYTE DynamicThrottle;
	BYTE[3] Spare;
	DWORD DisableCStates1Reserved31;
	DWORD PolicyCount;
	PROCESSOR_POWER_POLICY_INFO[3] Policy;
}
alias PROCESSOR_POWER_POLICY* PPROCESSOR_POWER_POLICY;

struct PROCESSOR_PERFSTATE_POLICY {
	DWORD Revision;
	BYTE MaxThrottle;
	BYTE MinThrottle;
	BYTE BusyAdjThreshold;
	union {
		BYTE Spare;
		union {
			BYTE AsBYTE;
			struct {
				BYTE NoDomainAccounting1IncreasePolicy2DecreasePolicy2Reserved3;
			}
		}
	}
	DWORD TimeCheck;
	DWORD IncreaseTime;
	DWORD DecreaseTime;
	DWORD IncreasePercent;
	DWORD DecreasePercent;
}
alias PROCESSOR_PERFSTATE_POLICY* PPROCESSOR_PERFSTATE_POLICY;

struct ADMINISTRATOR_POWER_POLICY {
	SYSTEM_POWER_STATE MinSleep;
	SYSTEM_POWER_STATE MaxSleep;
	DWORD MinVideoTimeout;
	DWORD MaxVideoTimeout;
	DWORD MinSpindownTimeout;
	DWORD MaxSpindownTimeout;
}
alias ADMINISTRATOR_POWER_POLICY* PADMINISTRATOR_POWER_POLICY;

struct SYSTEM_POWER_CAPABILITIES {
	BOOLEAN PowerButtonPresent;
	BOOLEAN SleepButtonPresent;
	BOOLEAN LidPresent;
	BOOLEAN SystemS1;
	BOOLEAN SystemS2;
	BOOLEAN SystemS3;
	BOOLEAN SystemS4;
	BOOLEAN SystemS5;
	BOOLEAN HiberFilePresent;
	BOOLEAN FullWake;
	BOOLEAN VideoDimPresent;
	BOOLEAN ApmPresent;
	BOOLEAN UpsPresent;
	BOOLEAN ThermalControl;
	BOOLEAN ProcessorThrottle;
	BYTE ProcessorMinThrottle;
	BYTE ProcessorMaxThrottle;
	BOOLEAN FastSystemS4;
	BYTE[3] spare2;
	BOOLEAN DiskSpinDown;
	BYTE[8] spare3;
	BOOLEAN SystemBatteriesPresent;
	BOOLEAN BatteriesAreShortTerm;
	BATTERY_REPORTING_SCALE[3] BatteryScale;
	SYSTEM_POWER_STATE AcOnLineWake;
	SYSTEM_POWER_STATE SoftLidWake;
	SYSTEM_POWER_STATE RtcWake;
	SYSTEM_POWER_STATE MinDeviceWakeState;
	SYSTEM_POWER_STATE DefaultLowLatencyWake;
}
alias SYSTEM_POWER_CAPABILITIES* PSYSTEM_POWER_CAPABILITIES;

struct SYSTEM_BATTERY_STATE {
	BOOLEAN AcOnLine;
	BOOLEAN BatteryPresent;
	BOOLEAN Charging;
	BOOLEAN Discharging;
	BOOLEAN[4] Spare1;
	DWORD MaxCapacity;
	DWORD RemainingCapacity;
	DWORD Rate;
	DWORD EstimatedTime;
	DWORD DefaultAlert1;
	DWORD DefaultAlert2;
}
alias SYSTEM_BATTERY_STATE* PSYSTEM_BATTERY_STATE;

align(4){
	enum {
		IMAGE_DOS_SIGNATURE    = 0x5A4D,
		IMAGE_OS2_SIGNATURE    = 0x454E,
		IMAGE_OS2_SIGNATURE_LE = 0x454C,
		IMAGE_VXD_SIGNATURE    = 0x454C,
		IMAGE_NT_SIGNATURE     = 0x00004550,
	}

	align(2){
		struct IMAGE_DOS_HEADER {
			WORD e_magic;
			WORD e_cblp;
			WORD e_cp;
			WORD e_crlc;
			WORD e_cparhdr;
			WORD e_minalloc;
			WORD e_maxalloc;
			WORD e_ss;
			WORD e_sp;
			WORD e_csum;
			WORD e_ip;
			WORD e_cs;
			WORD e_lfarlc;
			WORD e_ovno;
			WORD[4] e_res;
			WORD e_oemid;
			WORD e_oeminfo;
			WORD[10] e_res2;
			LONG e_lfanew;
		}
		alias IMAGE_DOS_HEADER* PIMAGE_DOS_HEADER;

		struct IMAGE_OS2_HEADER {
			WORD ne_magic;
			CHAR ne_ver;
			CHAR ne_rev;
			WORD ne_enttab;
			WORD ne_cbenttab;
			LONG ne_crc;
			WORD ne_flags;
			WORD ne_autodata;
			WORD ne_heap;
			WORD ne_stack;
			LONG ne_csip;
			LONG ne_sssp;
			WORD ne_cseg;
			WORD ne_cmod;
			WORD ne_cbnrestab;
			WORD ne_segtab;
			WORD ne_rsrctab;
			WORD ne_restab;
			WORD ne_modtab;
			WORD ne_imptab;
			LONG ne_nrestab;
			WORD ne_cmovent;
			WORD ne_align;
			WORD ne_cres;
			BYTE ne_exetyp;
			BYTE ne_flagsothers;
			WORD ne_pretthunks;
			WORD ne_psegrefbytes;
			WORD ne_swaparea;
			WORD ne_expver;
		}
		alias IMAGE_OS2_HEADER* PIMAGE_OS2_HEADER;

		struct IMAGE_VXD_HEADER {
			WORD e32_magic;
			BYTE e32_border;
			BYTE e32_worder;
			DWORD e32_level;
			WORD e32_cpu;
			WORD e32_os;
			DWORD e32_ver;
			DWORD e32_mflags;
			DWORD e32_mpages;
			DWORD e32_startobj;
			DWORD e32_eip;
			DWORD e32_stackobj;
			DWORD e32_esp;
			DWORD e32_pagesize;
			DWORD e32_lastpagesize;
			DWORD e32_fixupsize;
			DWORD e32_fixupsum;
			DWORD e32_ldrsize;
			DWORD e32_ldrsum;
			DWORD e32_objtab;
			DWORD e32_objcnt;
			DWORD e32_objmap;
			DWORD e32_itermap;
			DWORD e32_rsrctab;
			DWORD e32_rsrccnt;
			DWORD e32_restab;
			DWORD e32_enttab;
			DWORD e32_dirtab;
			DWORD e32_dircnt;
			DWORD e32_fpagetab;
			DWORD e32_frectab;
			DWORD e32_impmod;
			DWORD e32_impmodcnt;
			DWORD e32_impproc;
			DWORD e32_pagesum;
			DWORD e32_datapage;
			DWORD e32_preload;
			DWORD e32_nrestab;
			DWORD e32_cbnrestab;
			DWORD e32_nressum;
			DWORD e32_autodata;
			DWORD e32_debuginfo;
			DWORD e32_debuglen;
			DWORD e32_instpreload;
			DWORD e32_instdemand;
			DWORD e32_heapsize;
			BYTE[12] e32_res3;
			DWORD e32_winresoff;
			DWORD e32_winreslen;
			WORD e32_devid;
			WORD e32_ddkver;
		}
		alias IMAGE_VXD_HEADER* PIMAGE_VXD_HEADER;
	}

	struct IMAGE_FILE_HEADER {
		WORD Machine;
		WORD NumberOfSections;
		DWORD TimeDateStamp;
		DWORD PointerToSymbolTable;
		DWORD NumberOfSymbols;
		WORD SizeOfOptionalHeader;
		WORD Characteristics;
	}
	alias IMAGE_FILE_HEADER* PIMAGE_FILE_HEADER;

	enum IMAGE_SIZEOF_FILE_HEADER = 20;

	enum {
		IMAGE_FILE_RELOCS_STRIPPED         = 0x0001,
		IMAGE_FILE_EXECUTABLE_IMAGE        = 0x0002,
		IMAGE_FILE_LINE_NUMS_STRIPPED      = 0x0004,
		IMAGE_FILE_LOCAL_SYMS_STRIPPED     = 0x0008,
		IMAGE_FILE_AGGRESIVE_WS_TRIM       = 0x0010,
		IMAGE_FILE_LARGE_ADDRESS_AWARE     = 0x0020,
		IMAGE_FILE_BYTES_REVERSED_LO       = 0x0080,
		IMAGE_FILE_32BIT_MACHINE           = 0x0100,
		IMAGE_FILE_DEBUG_STRIPPED          = 0x0200,
		IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP = 0x0400,
		IMAGE_FILE_NET_RUN_FROM_SWAP       = 0x0800,
		IMAGE_FILE_SYSTEM                  = 0x1000,
		IMAGE_FILE_DLL                     = 0x2000,
		IMAGE_FILE_UP_SYSTEM_ONLY          = 0x4000,
		IMAGE_FILE_BYTES_REVERSED_HI       = 0x8000,
		IMAGE_FILE_MACHINE_UNKNOWN         = 0,
		IMAGE_FILE_MACHINE_I386            = 0x014c,
		IMAGE_FILE_MACHINE_R3000           = 0x0162,
		IMAGE_FILE_MACHINE_R4000           = 0x0166,
		IMAGE_FILE_MACHINE_R10000          = 0x0168,
		IMAGE_FILE_MACHINE_WCEMIPSV2       = 0x0169,
		IMAGE_FILE_MACHINE_ALPHA           = 0x0184,
		IMAGE_FILE_MACHINE_SH3             = 0x01a2,
		IMAGE_FILE_MACHINE_SH3DSP          = 0x01a3,
		IMAGE_FILE_MACHINE_SH3E            = 0x01a4,
		IMAGE_FILE_MACHINE_SH4             = 0x01a6,
		IMAGE_FILE_MACHINE_SH5             = 0x01a8,
		IMAGE_FILE_MACHINE_ARM             = 0x01c0,
		IMAGE_FILE_MACHINE_THUMB           = 0x01c2,
		IMAGE_FILE_MACHINE_AM33            = 0x01d3,
		IMAGE_FILE_MACHINE_POWERPC         = 0x01F0,
		IMAGE_FILE_MACHINE_POWERPCFP       = 0x01f1,
		IMAGE_FILE_MACHINE_IA64            = 0x0200,
		IMAGE_FILE_MACHINE_MIPS16          = 0x0266,
		IMAGE_FILE_MACHINE_ALPHA64         = 0x0284,
		IMAGE_FILE_MACHINE_MIPSFPU         = 0x0366,
		IMAGE_FILE_MACHINE_MIPSFPU16       = 0x0466,
		IMAGE_FILE_MACHINE_AXP64           = IMAGE_FILE_MACHINE_ALPHA64,
		IMAGE_FILE_MACHINE_TRICORE         = 0x0520,
		IMAGE_FILE_MACHINE_CEF             = 0x0CEF,
		IMAGE_FILE_MACHINE_EBC             = 0x0EBC,
		IMAGE_FILE_MACHINE_AMD64           = 0x8664,
		IMAGE_FILE_MACHINE_M32R            = 0x9041,
		IMAGE_FILE_MACHINE_CEE             = 0xC0EE,
	}

	struct IMAGE_DATA_DIRECTORY {
		DWORD VirtualAddress;
		DWORD Size;
	}
	alias IMAGE_DATA_DIRECTORY* PIMAGE_DATA_DIRECTORY;

	enum IMAGE_NUMBEROF_DIRECTORY_ENTRIES = 16;

	struct IMAGE_OPTIONAL_HEADER32 {
		WORD Magic;
		BYTE MajorLinkerVersion;
		BYTE MinorLinkerVersion;
		DWORD SizeOfCode;
		DWORD SizeOfInitializedData;
		DWORD SizeOfUninitializedData;
		DWORD AddressOfEntryPoint;
		DWORD BaseOfCode;
		DWORD BaseOfData;
		DWORD ImageBase;
		DWORD SectionAlignment;
		DWORD FileAlignment;
		WORD MajorOperatingSystemVersion;
		WORD MinorOperatingSystemVersion;
		WORD MajorImageVersion;
		WORD MinorImageVersion;
		WORD MajorSubsystemVersion;
		WORD MinorSubsystemVersion;
		DWORD Win32VersionValue;
		DWORD SizeOfImage;
		DWORD SizeOfHeaders;
		DWORD CheckSum;
		WORD Subsystem;
		WORD DllCharacteristics;
		DWORD SizeOfStackReserve;
		DWORD SizeOfStackCommit;
		DWORD SizeOfHeapReserve;
		DWORD SizeOfHeapCommit;
		DWORD LoaderFlags;
		DWORD NumberOfRvaAndSizes;
		IMAGE_DATA_DIRECTORY[IMAGE_NUMBEROF_DIRECTORY_ENTRIES] DataDirectory;
	}
	alias IMAGE_OPTIONAL_HEADER32* PIMAGE_OPTIONAL_HEADER32;

	struct IMAGE_ROM_OPTIONAL_HEADER {
		WORD Magic;
		BYTE MajorLinkerVersion;
		BYTE MinorLinkerVersion;
		DWORD SizeOfCode;
		DWORD SizeOfInitializedData;
		DWORD SizeOfUninitializedData;
		DWORD AddressOfEntryPoint;
		DWORD BaseOfCode;
		DWORD BaseOfData;
		DWORD BaseOfBss;
		DWORD GprMask;
		DWORD[4] CprMask;
		DWORD GpValue;
	}
	alias IMAGE_ROM_OPTIONAL_HEADER* PIMAGE_ROM_OPTIONAL_HEADER;

	struct IMAGE_OPTIONAL_HEADER64 {
		WORD Magic;
		BYTE MajorLinkerVersion;
		BYTE MinorLinkerVersion;
		DWORD SizeOfCode;
		DWORD SizeOfInitializedData;
		DWORD SizeOfUninitializedData;
		DWORD AddressOfEntryPoint;
		DWORD BaseOfCode;
		ULONGLONG ImageBase;
		DWORD SectionAlignment;
		DWORD FileAlignment;
		WORD MajorOperatingSystemVersion;
		WORD MinorOperatingSystemVersion;
		WORD MajorImageVersion;
		WORD MinorImageVersion;
		WORD MajorSubsystemVersion;
		WORD MinorSubsystemVersion;
		DWORD Win32VersionValue;
		DWORD SizeOfImage;
		DWORD SizeOfHeaders;
		DWORD CheckSum;
		WORD Subsystem;
		WORD DllCharacteristics;
		ULONGLONG SizeOfStackReserve;
		ULONGLONG SizeOfStackCommit;
		ULONGLONG SizeOfHeapReserve;
		ULONGLONG SizeOfHeapCommit;
		DWORD LoaderFlags;
		DWORD NumberOfRvaAndSizes;
		IMAGE_DATA_DIRECTORY[IMAGE_NUMBEROF_DIRECTORY_ENTRIES] DataDirectory;
	}
	alias IMAGE_OPTIONAL_HEADER64* PIMAGE_OPTIONAL_HEADER64;

	enum {
		IMAGE_NT_OPTIONAL_HDR32_MAGIC = 0x10b,
		IMAGE_NT_OPTIONAL_HDR64_MAGIC = 0x20b,
		IMAGE_ROM_OPTIONAL_HDR_MAGIC  = 0x107,
	}

	version(Win64){
		alias IMAGE_OPTIONAL_HEADER64 IMAGE_OPTIONAL_HEADER;
		alias PIMAGE_OPTIONAL_HEADER64 PIMAGE_OPTIONAL_HEADER;
		alias IMAGE_NT_OPTIONAL_HDR64_MAGIC IMAGE_NT_OPTIONAL_HDR_MAGIC;
	}else{
		alias IMAGE_OPTIONAL_HEADER32 IMAGE_OPTIONAL_HEADER;
		alias PIMAGE_OPTIONAL_HEADER32 PIMAGE_OPTIONAL_HEADER;
		alias IMAGE_NT_OPTIONAL_HDR32_MAGIC IMAGE_NT_OPTIONAL_HDR_MAGIC;
	}

	struct IMAGE_NT_HEADERS64 {
		DWORD Signature;
		IMAGE_FILE_HEADER FileHeader;
		IMAGE_OPTIONAL_HEADER64 OptionalHeader;
	}
	alias IMAGE_NT_HEADERS64* PIMAGE_NT_HEADERS64;

	struct IMAGE_NT_HEADERS32 {
		DWORD Signature;
		IMAGE_FILE_HEADER FileHeader;
		IMAGE_OPTIONAL_HEADER32 OptionalHeader;
	}
	alias IMAGE_NT_HEADERS32* PIMAGE_NT_HEADERS32;

	struct IMAGE_ROM_HEADERS {
		IMAGE_FILE_HEADER FileHeader;
		IMAGE_ROM_OPTIONAL_HEADER OptionalHeader;
	}
	alias IMAGE_ROM_HEADERS* PIMAGE_ROM_HEADERS;

	version(Win64){
		alias IMAGE_NT_HEADERS64 IMAGE_NT_HEADERS;
		alias PIMAGE_NT_HEADERS64 PIMAGE_NT_HEADERS;
	}else{
		alias IMAGE_NT_HEADERS32 IMAGE_NT_HEADERS;
		alias PIMAGE_NT_HEADERS32 PIMAGE_NT_HEADERS;
	}

	PIMAGE_SECTION_HEADER IMAGE_FIRST_SECTION(IMAGE_NT_HEADERS* ntheader)
	{
		return cast(PIMAGE_SECTION_HEADER)((cast(ULONG_PTR)ntheader + IMAGE_NT_HEADERS.OptionalHeader.offsetof) + ntheader.FileHeader.SizeOfOptionalHeader);
	}

	enum {
		IMAGE_SUBSYSTEM_UNKNOWN                  = 0,
		IMAGE_SUBSYSTEM_NATIVE                   = 1,
		IMAGE_SUBSYSTEM_WINDOWS_GUI              = 2,
		IMAGE_SUBSYSTEM_WINDOWS_CUI              = 3,
		IMAGE_SUBSYSTEM_OS2_CUI                  = 5,
		IMAGE_SUBSYSTEM_POSIX_CUI                = 7,
		IMAGE_SUBSYSTEM_NATIVE_WINDOWS           = 8,
		IMAGE_SUBSYSTEM_WINDOWS_CE_GUI           = 9,
		IMAGE_SUBSYSTEM_EFI_APPLICATION          = 10,
		IMAGE_SUBSYSTEM_EFI_BOOT_SERVICE_DRIVER  = 11,
		IMAGE_SUBSYSTEM_EFI_RUNTIME_DRIVER       = 12,
		IMAGE_SUBSYSTEM_EFI_ROM                  = 13,
		IMAGE_SUBSYSTEM_XBOX                     = 14,
		IMAGE_SUBSYSTEM_WINDOWS_BOOT_APPLICATION = 16,
	}

	enum {
		//IMAGE_LIBRARY_PROCESS_INIT                   = 0x0001,
		//IMAGE_LIBRARY_PROCESS_TERM                   = 0x0002,
		//IMAGE_LIBRARY_THREAD_INIT                    = 0x0004,
		//IMAGE_LIBRARY_THREAD_TERM                    = 0x0008,
		IMAGE_DLLCHARACTERISTICS_DYNAMIC_BASE          = 0x0040,
		IMAGE_DLLCHARACTERISTICS_FORCE_INTEGRITY       = 0x0080,
		IMAGE_DLLCHARACTERISTICS_NX_COMPAT             = 0x0100,
		IMAGE_DLLCHARACTERISTICS_NO_ISOLATION          = 0x0200,
		IMAGE_DLLCHARACTERISTICS_NO_SEH                = 0x0400,
		IMAGE_DLLCHARACTERISTICS_NO_BIND               = 0x0800,
		//                                             = 0x1000,
		IMAGE_DLLCHARACTERISTICS_WDM_DRIVER            = 0x2000,
		//                                             = 0x4000,
		IMAGE_DLLCHARACTERISTICS_TERMINAL_SERVER_AWARE = 0x8000,
	}

	enum {
		IMAGE_DIRECTORY_ENTRY_EXPORT         =  0,
		IMAGE_DIRECTORY_ENTRY_IMPORT         =  1,
		IMAGE_DIRECTORY_ENTRY_RESOURCE       =  2,
		IMAGE_DIRECTORY_ENTRY_EXCEPTION      =  3,
		IMAGE_DIRECTORY_ENTRY_SECURITY       =  4,
		IMAGE_DIRECTORY_ENTRY_BASERELOC      =  5,
		IMAGE_DIRECTORY_ENTRY_DEBUG          =  6,
		//IMAGE_DIRECTORY_ENTRY_COPYRIGHT    =  7,
		IMAGE_DIRECTORY_ENTRY_ARCHITECTURE   =  7,
		IMAGE_DIRECTORY_ENTRY_GLOBALPTR      =  8,
		IMAGE_DIRECTORY_ENTRY_TLS            =  9,
		IMAGE_DIRECTORY_ENTRY_LOAD_CONFIG    = 10,
		IMAGE_DIRECTORY_ENTRY_BOUND_IMPORT   = 11,
		IMAGE_DIRECTORY_ENTRY_IAT            = 12,
		IMAGE_DIRECTORY_ENTRY_DELAY_IMPORT   = 13,
		IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR = 14,
	}

	struct ANON_OBJECT_HEADER {
		WORD Sig1;
		WORD Sig2;
		WORD Version;
		WORD Machine;
		DWORD TimeDateStamp;
		CLSID ClassID;
		DWORD SizeOfData;
	}

	struct ANON_OBJECT_HEADER_V2 {
		WORD Sig1;
		WORD Sig2;
		WORD Version;
		WORD Machine;
		DWORD TimeDateStamp;
		CLSID ClassID;
		DWORD SizeOfData;
		DWORD Flags;
		DWORD MetaDataSize;
		DWORD MetaDataOffset;
	}

	struct ANON_OBJECT_HEADER_BIGOBJ {
		WORD Sig1;
		WORD Sig2;
		WORD Version;
		WORD Machine;
		DWORD TimeDateStamp;
		CLSID ClassID;
		DWORD SizeOfData;
		DWORD Flags;
		DWORD MetaDataSize;
		DWORD MetaDataOffset;
		DWORD NumberOfSections;
		DWORD PointerToSymbolTable;
		DWORD NumberOfSymbols;
	}

	enum IMAGE_SIZEOF_SHORT_NAME = 8;

	struct IMAGE_SECTION_HEADER {
		BYTE[IMAGE_SIZEOF_SHORT_NAME] Name;
		union {
			DWORD PhysicalAddress;
			DWORD VirtualSize;
		}
		DWORD VirtualAddress;
		DWORD SizeOfRawData;
		DWORD PointerToRawData;
		DWORD PointerToRelocations;
		DWORD PointerToLinenumbers;
		WORD NumberOfRelocations;
		WORD NumberOfLinenumbers;
		DWORD Characteristics;
	}
	alias IMAGE_SECTION_HEADER* PIMAGE_SECTION_HEADER;

	enum IMAGE_SIZEOF_SECTION_HEADER = 40;

	enum {
		//IMAGE_SCN_TYPE_REG             = 0x00000000,
		//IMAGE_SCN_TYPE_DSECT           = 0x00000001,
		//IMAGE_SCN_TYPE_NOLOAD          = 0x00000002,
		//IMAGE_SCN_TYPE_GROUP           = 0x00000004,
		IMAGE_SCN_TYPE_NO_PAD            = 0x00000008,
		//IMAGE_SCN_TYPE_COPY            = 0x00000010,
		IMAGE_SCN_CNT_CODE               = 0x00000020,
		IMAGE_SCN_CNT_INITIALIZED_DATA   = 0x00000040,
		IMAGE_SCN_CNT_UNINITIALIZED_DATA = 0x00000080,
		IMAGE_SCN_LNK_OTHER              = 0x00000100,
		IMAGE_SCN_LNK_INFO               = 0x00000200,
		//IMAGE_SCN_TYPE_OVER            = 0x00000400,
		IMAGE_SCN_LNK_REMOVE             = 0x00000800,
		IMAGE_SCN_LNK_COMDAT             = 0x00001000,
		//                               = 0x00002000,
		//IMAGE_SCN_MEM_PROTECTED        = 0x00004000,
		IMAGE_SCN_NO_DEFER_SPEC_EXC      = 0x00004000,
		IMAGE_SCN_GPREL                  = 0x00008000,
		IMAGE_SCN_MEM_FARDATA            = 0x00008000,
		//IMAGE_SCN_MEM_SYSHEAP          = 0x00010000,
		IMAGE_SCN_MEM_PURGEABLE          = 0x00020000,
		IMAGE_SCN_MEM_16BIT              = 0x00020000,
		IMAGE_SCN_MEM_LOCKED             = 0x00040000,
		IMAGE_SCN_MEM_PRELOAD            = 0x00080000,
		IMAGE_SCN_ALIGN_1BYTES           = 0x00100000,
		IMAGE_SCN_ALIGN_2BYTES           = 0x00200000,
		IMAGE_SCN_ALIGN_4BYTES           = 0x00300000,
		IMAGE_SCN_ALIGN_8BYTES           = 0x00400000,
		IMAGE_SCN_ALIGN_16BYTES          = 0x00500000,
		IMAGE_SCN_ALIGN_32BYTES          = 0x00600000,
		IMAGE_SCN_ALIGN_64BYTES          = 0x00700000,
		IMAGE_SCN_ALIGN_128BYTES         = 0x00800000,
		IMAGE_SCN_ALIGN_256BYTES         = 0x00900000,
		IMAGE_SCN_ALIGN_512BYTES         = 0x00A00000,
		IMAGE_SCN_ALIGN_1024BYTES        = 0x00B00000,
		IMAGE_SCN_ALIGN_2048BYTES        = 0x00C00000,
		IMAGE_SCN_ALIGN_4096BYTES        = 0x00D00000,
		IMAGE_SCN_ALIGN_8192BYTES        = 0x00E00000,
		//                               = 0x00F00000,
		IMAGE_SCN_ALIGN_MASK             = 0x00F00000,
		IMAGE_SCN_LNK_NRELOC_OVFL        = 0x01000000,
		IMAGE_SCN_MEM_DISCARDABLE        = 0x02000000,
		IMAGE_SCN_MEM_NOT_CACHED         = 0x04000000,
		IMAGE_SCN_MEM_NOT_PAGED          = 0x08000000,
		IMAGE_SCN_MEM_SHARED             = 0x10000000,
		IMAGE_SCN_MEM_EXECUTE            = 0x20000000,
		IMAGE_SCN_MEM_READ               = 0x40000000,
		IMAGE_SCN_MEM_WRITE              = 0x80000000,
	}

	enum IMAGE_SCN_SCALE_INDEX = 0x00000001;

	align(2){
		struct IMAGE_SYMBOL {
			union {
				BYTE[8] ShortName;
				struct {
					DWORD Short;
					DWORD Long;
				}
				DWORD[2] LongName;
			}
			DWORD Value;
			SHORT SectionNumber;
			WORD Type;
			BYTE StorageClass;
			BYTE NumberOfAuxSymbols;
		}
		alias IMAGE_SYMBOL* PIMAGE_SYMBOL;

		enum IMAGE_SIZEOF_SYMBOL = 18;

		struct IMAGE_SYMBOL_EX {
			union {
				BYTE[8] ShortName;
				struct {
					DWORD Short;
					DWORD Long;
				}
				DWORD[2] LongName;
			}
			DWORD Value;
			LONG SectionNumber;
			WORD Type;
			BYTE StorageClass;
			BYTE NumberOfAuxSymbols;
		}
		alias IMAGE_SYMBOL_EX* PIMAGE_SYMBOL_EX;

		enum {
			IMAGE_SYM_UNDEFINED      = cast(SHORT)0,
			IMAGE_SYM_ABSOLUTE       = cast(SHORT)-1,
			IMAGE_SYM_DEBUG          = cast(SHORT)-2,
			IMAGE_SYM_SECTION_MAX    = 0xFEFF,
			IMAGE_SYM_SECTION_MAX_EX = MAXLONG,
		}

		enum {
			IMAGE_SYM_TYPE_NULL   = 0x0000,
			IMAGE_SYM_TYPE_VOID   = 0x0001,
			IMAGE_SYM_TYPE_CHAR   = 0x0002,
			IMAGE_SYM_TYPE_SHORT  = 0x0003,
			IMAGE_SYM_TYPE_INT    = 0x0004,
			IMAGE_SYM_TYPE_LONG   = 0x0005,
			IMAGE_SYM_TYPE_FLOAT  = 0x0006,
			IMAGE_SYM_TYPE_DOUBLE = 0x0007,
			IMAGE_SYM_TYPE_STRUCT = 0x0008,
			IMAGE_SYM_TYPE_UNION  = 0x0009,
			IMAGE_SYM_TYPE_ENUM   = 0x000A,
			IMAGE_SYM_TYPE_MOE    = 0x000B,
			IMAGE_SYM_TYPE_BYTE   = 0x000C,
			IMAGE_SYM_TYPE_WORD   = 0x000D,
			IMAGE_SYM_TYPE_UINT   = 0x000E,
			IMAGE_SYM_TYPE_DWORD  = 0x000F,
			IMAGE_SYM_TYPE_PCODE  = 0x8000,
		}

		enum {
			IMAGE_SYM_DTYPE_NULL     = 0,
			IMAGE_SYM_DTYPE_POINTER  = 1,
			IMAGE_SYM_DTYPE_FUNCTION = 2,
			IMAGE_SYM_DTYPE_ARRAY    = 3,
		}

		enum {
			IMAGE_SYM_CLASS_END_OF_FUNCTION  = cast(BYTE)-1,
			IMAGE_SYM_CLASS_NULL             = 0x0000,
			IMAGE_SYM_CLASS_AUTOMATIC        = 0x0001,
			IMAGE_SYM_CLASS_EXTERNAL         = 0x0002,
			IMAGE_SYM_CLASS_STATIC           = 0x0003,
			IMAGE_SYM_CLASS_REGISTER         = 0x0004,
			IMAGE_SYM_CLASS_EXTERNAL_DEF     = 0x0005,
			IMAGE_SYM_CLASS_LABEL            = 0x0006,
			IMAGE_SYM_CLASS_UNDEFINED_LABEL  = 0x0007,
			IMAGE_SYM_CLASS_MEMBER_OF_STRUCT = 0x0008,
			IMAGE_SYM_CLASS_ARGUMENT         = 0x0009,
			IMAGE_SYM_CLASS_STRUCT_TAG       = 0x000A,
			IMAGE_SYM_CLASS_MEMBER_OF_UNION  = 0x000B,
			IMAGE_SYM_CLASS_UNION_TAG        = 0x000C,
			IMAGE_SYM_CLASS_TYPE_DEFINITION  = 0x000D,
			IMAGE_SYM_CLASS_UNDEFINED_STATIC = 0x000E,
			IMAGE_SYM_CLASS_ENUM_TAG         = 0x000F,
			IMAGE_SYM_CLASS_MEMBER_OF_ENUM   = 0x0010,
			IMAGE_SYM_CLASS_REGISTER_PARAM   = 0x0011,
			IMAGE_SYM_CLASS_BIT_FIELD        = 0x0012,
			IMAGE_SYM_CLASS_FAR_EXTERNAL     = 0x0044,
			IMAGE_SYM_CLASS_BLOCK            = 0x0064,
			IMAGE_SYM_CLASS_FUNCTION         = 0x0065,
			IMAGE_SYM_CLASS_END_OF_STRUCT    = 0x0066,
			IMAGE_SYM_CLASS_FILE             = 0x0067,
			IMAGE_SYM_CLASS_SECTION          = 0x0068,
			IMAGE_SYM_CLASS_WEAK_EXTERNAL    = 0x0069,
			IMAGE_SYM_CLASS_CLR_TOKEN        = 0x006B,
		}

		enum {
			N_BTMASK = 0x000F,
			N_TMASK  = 0x0030,
			N_TMASK1 = 0x00C0,
			N_TMASK2 = 0x00F0,
			N_BTSHFT = 4,
			N_TSHIFT = 2,
		}

		pure nothrow
		ushort BTYPE(ushort x)
		{
			return x & N_BTMASK;
		}

		pure nothrow
		bool ISPTR(ushort x)
		{
			return (x & N_TMASK) == (IMAGE_SYM_DTYPE_POINTER << N_BTSHFT);
		}

		pure nothrow
		bool ISFCN(ushort x)
		{
			return (x & N_TMASK) == (IMAGE_SYM_DTYPE_FUNCTION << N_BTSHFT);
		}

		pure nothrow
		bool ISARY(ushort x)
		{
			return (x & N_TMASK) == (IMAGE_SYM_DTYPE_ARRAY << N_BTSHFT);
		}

		pure nothrow
		bool ISTAG(ushort x)
		{
			return (x == IMAGE_SYM_CLASS_STRUCT_TAG || x == IMAGE_SYM_CLASS_UNION_TAG || x == IMAGE_SYM_CLASS_ENUM_TAG);
		}

		//#define INCREF(x) ((((x)&~N_BTMASK)<<N_TSHIFT)|(IMAGE_SYM_DTYPE_POINTER<<N_BTSHFT)|((x)&N_BTMASK))
		//#define DECREF(x) ((((x)>>N_TSHIFT)&~N_BTMASK)|((x)&N_BTMASK))

		align(2){
			struct IMAGE_AUX_SYMBOL_TOKEN_DEF {
				BYTE bAuxType;
				BYTE bReserved;
				DWORD SymbolTableIndex;
				BYTE[12] rgbReserved;
			}
			alias IMAGE_AUX_SYMBOL_TOKEN_DEF* PIMAGE_AUX_SYMBOL_TOKEN_DEF;
		}

		union IMAGE_AUX_SYMBOL {
			struct {
				DWORD TagIndex;
				union {
					struct {
						WORD Linenumber;
						WORD Size;
					}
					DWORD TotalSize;
				}
				union {
					struct {
						DWORD PointerToLinenumber;
						DWORD PointerToNextFunction;
					}
					struct {
						WORD[4] Dimension;
					}
				}
				WORD TvIndex;
			}
			struct {
				BYTE[IMAGE_SIZEOF_SYMBOL] Name;
			}
			struct {
				DWORD Length;
				WORD NumberOfRelocations;
				WORD NumberOfLinenumbers;
				DWORD CheckSum;
				SHORT Number;
				BYTE Selection;
				BYTE bReserved;
				SHORT HighNumber;
			}
			IMAGE_AUX_SYMBOL_TOKEN_DEF TokenDef; 
			struct {
				DWORD crc;
				BYTE[14]  rgbReserved;
			}
		}
		alias IMAGE_AUX_SYMBOL* PIMAGE_AUX_SYMBOL;

		union IMAGE_AUX_SYMBOL_EX {
			struct {
				DWORD WeakDefaultSymIndex;
				DWORD WeakSearchType;
				BYTE[12] rgbReserved;
			}
			struct {
				BYTE[IMAGE_SYMBOL_EX.sizeof] Name;
			}
			struct {
				DWORD Length;
				WORD NumberOfRelocations;
				WORD NumberOfLinenumbers;
				DWORD CheckSum;
				SHORT Number;
				BYTE Selection;
				BYTE bReserved;
				SHORT HighNumber;
				BYTE[2] rgbReserved_2; // !
			}
			struct{ 
				IMAGE_AUX_SYMBOL_TOKEN_DEF TokenDef;
				BYTE[2] rgbReserved_3; // !
			}
			struct {
				DWORD crc;
				BYTE[16]  rgbReserved_4; // !
			}
		}
		alias IMAGE_AUX_SYMBOL_EX* PIMAGE_AUX_SYMBOL_EX;

		enum {
		    IMAGE_AUX_SYMBOL_TYPE_TOKEN_DEF = 1,
		}
		alias int IMAGE_AUX_SYMBOL_TYPE;

		enum {
			IMAGE_COMDAT_SELECT_NODUPLICATES = 1,
			IMAGE_COMDAT_SELECT_ANY          = 2,
			IMAGE_COMDAT_SELECT_SAME_SIZE    = 3,
			IMAGE_COMDAT_SELECT_EXACT_MATCH  = 4,
			IMAGE_COMDAT_SELECT_ASSOCIATIVE  = 5,
			IMAGE_COMDAT_SELECT_LARGEST      = 6,
			IMAGE_COMDAT_SELECT_NEWEST       = 7,
		}

		enum {
			IMAGE_WEAK_EXTERN_SEARCH_NOLIBRARY = 1,
			IMAGE_WEAK_EXTERN_SEARCH_LIBRARY   = 2,
			IMAGE_WEAK_EXTERN_SEARCH_ALIAS     = 3,
		}

		struct IMAGE_RELOCATION {
			union {
				DWORD VirtualAddress;
				DWORD RelocCount;
			}
			DWORD SymbolTableIndex;
			WORD Type;
		}
		alias IMAGE_RELOCATION* PIMAGE_RELOCATION;

		enum {
			IMAGE_REL_I386_ABSOLUTE = 0x0000,
			IMAGE_REL_I386_DIR16    = 0x0001,
			IMAGE_REL_I386_REL16    = 0x0002,
			IMAGE_REL_I386_DIR32    = 0x0006,
			IMAGE_REL_I386_DIR32NB  = 0x0007,
			IMAGE_REL_I386_SEG12    = 0x0009,
			IMAGE_REL_I386_SECTION  = 0x000A,
			IMAGE_REL_I386_SECREL   = 0x000B,
			IMAGE_REL_I386_TOKEN    = 0x000C,
			IMAGE_REL_I386_SECREL7  = 0x000D,
			IMAGE_REL_I386_REL32    = 0x0014,
		}

		enum {
			IMAGE_REL_MIPS_ABSOLUTE  = 0x0000,
			IMAGE_REL_MIPS_REFHALF   = 0x0001,
			IMAGE_REL_MIPS_REFWORD   = 0x0002,
			IMAGE_REL_MIPS_JMPADDR   = 0x0003,
			IMAGE_REL_MIPS_REFHI     = 0x0004,
			IMAGE_REL_MIPS_REFLO     = 0x0005,
			IMAGE_REL_MIPS_GPREL     = 0x0006,
			IMAGE_REL_MIPS_LITERAL   = 0x0007,
			IMAGE_REL_MIPS_SECTION   = 0x000A,
			IMAGE_REL_MIPS_SECREL    = 0x000B,
			IMAGE_REL_MIPS_SECRELLO  = 0x000C,
			IMAGE_REL_MIPS_SECRELHI  = 0x000D,
			IMAGE_REL_MIPS_TOKEN     = 0x000E,
			IMAGE_REL_MIPS_JMPADDR16 = 0x0010,
			IMAGE_REL_MIPS_REFWORDNB = 0x0022,
			IMAGE_REL_MIPS_PAIR      = 0x0025,
		}

		enum {
			IMAGE_REL_ALPHA_ABSOLUTE       = 0x0000,
			IMAGE_REL_ALPHA_REFLONG        = 0x0001,
			IMAGE_REL_ALPHA_REFQUAD        = 0x0002,
			IMAGE_REL_ALPHA_GPREL32        = 0x0003,
			IMAGE_REL_ALPHA_LITERAL        = 0x0004,
			IMAGE_REL_ALPHA_LITUSE         = 0x0005,
			IMAGE_REL_ALPHA_GPDISP         = 0x0006,
			IMAGE_REL_ALPHA_BRADDR         = 0x0007,
			IMAGE_REL_ALPHA_HINT           = 0x0008,
			IMAGE_REL_ALPHA_INLINE_REFLONG = 0x0009,
			IMAGE_REL_ALPHA_REFHI          = 0x000A,
			IMAGE_REL_ALPHA_REFLO          = 0x000B,
			IMAGE_REL_ALPHA_PAIR           = 0x000C,
			IMAGE_REL_ALPHA_MATCH          = 0x000D,
			IMAGE_REL_ALPHA_SECTION        = 0x000E,
			IMAGE_REL_ALPHA_SECREL         = 0x000F,
			IMAGE_REL_ALPHA_REFLONGNB      = 0x0010,
			IMAGE_REL_ALPHA_SECRELLO       = 0x0011,
			IMAGE_REL_ALPHA_SECRELHI       = 0x0012,
			IMAGE_REL_ALPHA_REFQ3          = 0x0013,
			IMAGE_REL_ALPHA_REFQ2          = 0x0014,
			IMAGE_REL_ALPHA_REFQ1          = 0x0015,
			IMAGE_REL_ALPHA_GPRELLO        = 0x0016,
			IMAGE_REL_ALPHA_GPRELHI        = 0x0017,
		}

		enum {
			IMAGE_REL_PPC_ABSOLUTE = 0x0000,
			IMAGE_REL_PPC_ADDR64   = 0x0001,
			IMAGE_REL_PPC_ADDR32   = 0x0002,
			IMAGE_REL_PPC_ADDR24   = 0x0003,
			IMAGE_REL_PPC_ADDR16   = 0x0004,
			IMAGE_REL_PPC_ADDR14   = 0x0005,
			IMAGE_REL_PPC_REL24    = 0x0006,
			IMAGE_REL_PPC_REL14    = 0x0007,
			IMAGE_REL_PPC_TOCREL16 = 0x0008,
			IMAGE_REL_PPC_TOCREL14 = 0x0009,
			IMAGE_REL_PPC_ADDR32NB = 0x000A,
			IMAGE_REL_PPC_SECREL   = 0x000B,
			IMAGE_REL_PPC_SECTION  = 0x000C,
			IMAGE_REL_PPC_IFGLUE   = 0x000D,
			IMAGE_REL_PPC_IMGLUE   = 0x000E,
			IMAGE_REL_PPC_SECREL16 = 0x000F,
			IMAGE_REL_PPC_REFHI    = 0x0010,
			IMAGE_REL_PPC_REFLO    = 0x0011,
			IMAGE_REL_PPC_PAIR     = 0x0012,
			IMAGE_REL_PPC_SECRELLO = 0x0013,
			IMAGE_REL_PPC_SECRELHI = 0x0014,
			IMAGE_REL_PPC_GPREL    = 0x0015,
			IMAGE_REL_PPC_TOKEN    = 0x0016,
			IMAGE_REL_PPC_TYPEMASK = 0x00FF,
			IMAGE_REL_PPC_NEG      = 0x0100,
			IMAGE_REL_PPC_BRTAKEN  = 0x0200,
			IMAGE_REL_PPC_BRNTAKEN = 0x0400,
			IMAGE_REL_PPC_TOCDEFN  = 0x0800,
		}

		enum {
			IMAGE_REL_SH3_ABSOLUTE        = 0x0000,
			IMAGE_REL_SH3_DIRECT16        = 0x0001,
			IMAGE_REL_SH3_DIRECT32        = 0x0002,
			IMAGE_REL_SH3_DIRECT8         = 0x0003,
			IMAGE_REL_SH3_DIRECT8_WORD    = 0x0004,
			IMAGE_REL_SH3_DIRECT8_LONG    = 0x0005,
			IMAGE_REL_SH3_DIRECT4         = 0x0006,
			IMAGE_REL_SH3_DIRECT4_WORD    = 0x0007,
			IMAGE_REL_SH3_DIRECT4_LONG    = 0x0008,
			IMAGE_REL_SH3_PCREL8_WORD     = 0x0009,
			IMAGE_REL_SH3_PCREL8_LONG     = 0x000A,
			IMAGE_REL_SH3_PCREL12_WORD    = 0x000B,
			IMAGE_REL_SH3_STARTOF_SECTION = 0x000C,
			IMAGE_REL_SH3_SIZEOF_SECTION  = 0x000D,
			IMAGE_REL_SH3_SECTION         = 0x000E,
			IMAGE_REL_SH3_SECREL          = 0x000F,
			IMAGE_REL_SH3_DIRECT32_NB     = 0x0010,
			IMAGE_REL_SH3_GPREL4_LONG     = 0x0011,
			IMAGE_REL_SH3_TOKEN           = 0x0012,
			IMAGE_REL_SHM_PCRELPT         = 0x0013,
			IMAGE_REL_SHM_REFLO           = 0x0014,
			IMAGE_REL_SHM_REFHALF         = 0x0015,
			IMAGE_REL_SHM_RELLO           = 0x0016,
			IMAGE_REL_SHM_RELHALF         = 0x0017,
			IMAGE_REL_SHM_PAIR            = 0x0018,
			IMAGE_REL_SH_NOMODE           = 0x8000,
		}

		enum {
			IMAGE_REL_ARM_ABSOLUTE = 0x0000,
			IMAGE_REL_ARM_ADDR32   = 0x0001,
			IMAGE_REL_ARM_ADDR32NB = 0x0002,
			IMAGE_REL_ARM_BRANCH24 = 0x0003,
			IMAGE_REL_ARM_BRANCH11 = 0x0004,
			IMAGE_REL_ARM_TOKEN    = 0x0005,
			IMAGE_REL_ARM_GPREL12  = 0x0006,
			IMAGE_REL_ARM_GPREL7   = 0x0007,
			IMAGE_REL_ARM_BLX24    = 0x0008,
			IMAGE_REL_ARM_BLX11    = 0x0009,
			IMAGE_REL_ARM_SECTION  = 0x000E,
			IMAGE_REL_ARM_SECREL   = 0x000F,
			IMAGE_REL_AM_ABSOLUTE  = 0x0000,
			IMAGE_REL_AM_ADDR32    = 0x0001,
			IMAGE_REL_AM_ADDR32NB  = 0x0002,
			IMAGE_REL_AM_CALL32    = 0x0003,
			IMAGE_REL_AM_FUNCINFO  = 0x0004,
			IMAGE_REL_AM_REL32_1   = 0x0005,
			IMAGE_REL_AM_REL32_2   = 0x0006,
			IMAGE_REL_AM_SECREL    = 0x0007,
			IMAGE_REL_AM_SECTION   = 0x0008,
			IMAGE_REL_AM_TOKEN     = 0x0009,
		}

		enum {
			IMAGE_REL_AMD64_ABSOLUTE = 0x0000,
			IMAGE_REL_AMD64_ADDR64   = 0x0001,
			IMAGE_REL_AMD64_ADDR32   = 0x0002,
			IMAGE_REL_AMD64_ADDR32NB = 0x0003,
			IMAGE_REL_AMD64_REL32    = 0x0004,
			IMAGE_REL_AMD64_REL32_1  = 0x0005,
			IMAGE_REL_AMD64_REL32_2  = 0x0006,
			IMAGE_REL_AMD64_REL32_3  = 0x0007,
			IMAGE_REL_AMD64_REL32_4  = 0x0008,
			IMAGE_REL_AMD64_REL32_5  = 0x0009,
			IMAGE_REL_AMD64_SECTION  = 0x000A,
			IMAGE_REL_AMD64_SECREL   = 0x000B,
			IMAGE_REL_AMD64_SECREL7  = 0x000C,
			IMAGE_REL_AMD64_TOKEN    = 0x000D,
			IMAGE_REL_AMD64_SREL32   = 0x000E,
			IMAGE_REL_AMD64_PAIR     = 0x000F,
			IMAGE_REL_AMD64_SSPAN32  = 0x0010,
		}

		enum {
			IMAGE_REL_IA64_ABSOLUTE   = 0x0000,
			IMAGE_REL_IA64_IMM14      = 0x0001,
			IMAGE_REL_IA64_IMM22      = 0x0002,
			IMAGE_REL_IA64_IMM64      = 0x0003,
			IMAGE_REL_IA64_DIR32      = 0x0004,
			IMAGE_REL_IA64_DIR64      = 0x0005,
			IMAGE_REL_IA64_PCREL21B   = 0x0006,
			IMAGE_REL_IA64_PCREL21M   = 0x0007,
			IMAGE_REL_IA64_PCREL21F   = 0x0008,
			IMAGE_REL_IA64_GPREL22    = 0x0009,
			IMAGE_REL_IA64_LTOFF22    = 0x000A,
			IMAGE_REL_IA64_SECTION    = 0x000B,
			IMAGE_REL_IA64_SECREL22   = 0x000C,
			IMAGE_REL_IA64_SECREL64I  = 0x000D,
			IMAGE_REL_IA64_SECREL32   = 0x000E,
			IMAGE_REL_IA64_DIR32NB    = 0x0010,
			IMAGE_REL_IA64_SREL14     = 0x0011,
			IMAGE_REL_IA64_SREL22     = 0x0012,
			IMAGE_REL_IA64_SREL32     = 0x0013,
			IMAGE_REL_IA64_UREL32     = 0x0014,
			IMAGE_REL_IA64_PCREL60X   = 0x0015,
			IMAGE_REL_IA64_PCREL60B   = 0x0016,
			IMAGE_REL_IA64_PCREL60F   = 0x0017,
			IMAGE_REL_IA64_PCREL60I   = 0x0018,
			IMAGE_REL_IA64_PCREL60M   = 0x0019,
			IMAGE_REL_IA64_IMMGPREL64 = 0x001A,
			IMAGE_REL_IA64_TOKEN      = 0x001B,
			IMAGE_REL_IA64_GPREL32    = 0x001C,
			IMAGE_REL_IA64_ADDEND     = 0x001F,
		}

		enum {
			IMAGE_REL_CEF_ABSOLUTE = 0x0000,
			IMAGE_REL_CEF_ADDR32   = 0x0001,
			IMAGE_REL_CEF_ADDR64   = 0x0002,
			IMAGE_REL_CEF_ADDR32NB = 0x0003,
			IMAGE_REL_CEF_SECTION  = 0x0004,
			IMAGE_REL_CEF_SECREL   = 0x0005,
			IMAGE_REL_CEF_TOKEN    = 0x0006,
		}

		enum {
			IMAGE_REL_CEE_ABSOLUTE = 0x0000,
			IMAGE_REL_CEE_ADDR32   = 0x0001,
			IMAGE_REL_CEE_ADDR64   = 0x0002,
			IMAGE_REL_CEE_ADDR32NB = 0x0003,
			IMAGE_REL_CEE_SECTION  = 0x0004,
			IMAGE_REL_CEE_SECREL   = 0x0005,
			IMAGE_REL_CEE_TOKEN    = 0x0006,
		}

		enum {
			IMAGE_REL_M32R_ABSOLUTE = 0x0000,
			IMAGE_REL_M32R_ADDR32   = 0x0001,
			IMAGE_REL_M32R_ADDR32NB = 0x0002,
			IMAGE_REL_M32R_ADDR24   = 0x0003,
			IMAGE_REL_M32R_GPREL16  = 0x0004,
			IMAGE_REL_M32R_PCREL24  = 0x0005,
			IMAGE_REL_M32R_PCREL16  = 0x0006,
			IMAGE_REL_M32R_PCREL8   = 0x0007,
			IMAGE_REL_M32R_REFHALF  = 0x0008,
			IMAGE_REL_M32R_REFHI    = 0x0009,
			IMAGE_REL_M32R_REFLO    = 0x000A,
			IMAGE_REL_M32R_PAIR     = 0x000B,
			IMAGE_REL_M32R_SECTION  = 0x000C,
			IMAGE_REL_M32R_SECREL32 = 0x000D,
			IMAGE_REL_M32R_TOKEN    = 0x000E,
		}

		enum {
			IMAGE_REL_EBC_ABSOLUTE = 0x0000,
			IMAGE_REL_EBC_ADDR32NB = 0x0001,
			IMAGE_REL_EBC_REL32    = 0x0002,
			IMAGE_REL_EBC_SECTION  = 0x0003,
			IMAGE_REL_EBC_SECREL   = 0x0004,
		}

		/*template EXT_IMM64(alias Value, Address, Size, InstPos, ValPos)
		{
			Value |= (cast(ULONGLONG)((*Address >> InstPos) & ((cast(ULONGLONG)1 << Size) - 1))) << ValPos;
		}*/

		/*template INS_IMM64(Value, Address, Size, InstPos, ValPos)
		{
			*cast(PDWORD)Address = (*cast(PDWORD)Address & ~(((1 << Size) - 1) << InstPos)) | (cast(DWORD)(((cast(ULONGLONG)Value >> ValPos) & ((cast(ULONGLONG)1 << Size) - 1))) << InstPos);
		}*/

		enum {
			EMARCH_ENC_I17_IMM7B_INST_WORD_X      =  3,
			EMARCH_ENC_I17_IMM7B_SIZE_X           =  7,
			EMARCH_ENC_I17_IMM7B_INST_WORD_POS_X  =  4,
			EMARCH_ENC_I17_IMM7B_VAL_POS_X        =  0,
			EMARCH_ENC_I17_IMM9D_INST_WORD_X      =  3,
			EMARCH_ENC_I17_IMM9D_SIZE_X           =  9,
			EMARCH_ENC_I17_IMM9D_INST_WORD_POS_X  =  18,
			EMARCH_ENC_I17_IMM9D_VAL_POS_X        =  7,
			EMARCH_ENC_I17_IMM5C_INST_WORD_X      =  3,
			EMARCH_ENC_I17_IMM5C_SIZE_X           =  5,
			EMARCH_ENC_I17_IMM5C_INST_WORD_POS_X  =  13,
			EMARCH_ENC_I17_IMM5C_VAL_POS_X        =  16,
			EMARCH_ENC_I17_IC_INST_WORD_X         =  3,
			EMARCH_ENC_I17_IC_SIZE_X              =  1,
			EMARCH_ENC_I17_IC_INST_WORD_POS_X     =  12,
			EMARCH_ENC_I17_IC_VAL_POS_X           =  21,
			EMARCH_ENC_I17_IMM41a_INST_WORD_X     =  1,
			EMARCH_ENC_I17_IMM41a_SIZE_X          =  10,
			EMARCH_ENC_I17_IMM41a_INST_WORD_POS_X = 14,
			EMARCH_ENC_I17_IMM41a_VAL_POS_X       = 22,
			EMARCH_ENC_I17_IMM41b_INST_WORD_X     =  1,
			EMARCH_ENC_I17_IMM41b_SIZE_X          =  8,
			EMARCH_ENC_I17_IMM41b_INST_WORD_POS_X =  24,
			EMARCH_ENC_I17_IMM41b_VAL_POS_X       =  32,
			EMARCH_ENC_I17_IMM41c_INST_WORD_X     =  2,
			EMARCH_ENC_I17_IMM41c_SIZE_X          =  23,
			EMARCH_ENC_I17_IMM41c_INST_WORD_POS_X =  0,
			EMARCH_ENC_I17_IMM41c_VAL_POS_X       =  40,
			EMARCH_ENC_I17_SIGN_INST_WORD_X       =  3,
			EMARCH_ENC_I17_SIGN_SIZE_X            =  1,
			EMARCH_ENC_I17_SIGN_INST_WORD_POS_X   =  27,
			EMARCH_ENC_I17_SIGN_VAL_POS_X         =  63,
			X3_OPCODE_INST_WORD_X                 =  3,
			X3_OPCODE_SIZE_X                      =  4,
			X3_OPCODE_INST_WORD_POS_X             =  28,
			X3_OPCODE_SIGN_VAL_POS_X              =  0,
			X3_I_INST_WORD_X                      =  3,
			X3_I_SIZE_X                           =  1,
			X3_I_INST_WORD_POS_X                  =  27,
			X3_I_SIGN_VAL_POS_X                   =  59,
			X3_D_WH_INST_WORD_X                   =  3,
			X3_D_WH_SIZE_X                        =  3,
			X3_D_WH_INST_WORD_POS_X               =  24,
			X3_D_WH_SIGN_VAL_POS_X                =  0,
			X3_IMM20_INST_WORD_X                  =  3,
			X3_IMM20_SIZE_X                       =  20,
			X3_IMM20_INST_WORD_POS_X              =  4,
			X3_IMM20_SIGN_VAL_POS_X               =  0,
			X3_IMM39_1_INST_WORD_X                =  2,
			X3_IMM39_1_SIZE_X                     =  23,
			X3_IMM39_1_INST_WORD_POS_X            =  0,
			X3_IMM39_1_SIGN_VAL_POS_X             =  36,
			X3_IMM39_2_INST_WORD_X                =  1,
			X3_IMM39_2_SIZE_X                     =  16,
			X3_IMM39_2_INST_WORD_POS_X            =  16,
			X3_IMM39_2_SIGN_VAL_POS_X             =  20,
			X3_P_INST_WORD_X                      =  3,
			X3_P_SIZE_X                           =  4,
			X3_P_INST_WORD_POS_X                  =  0,
			X3_P_SIGN_VAL_POS_X                   =  0,
			X3_TMPLT_INST_WORD_X                  =  0,
			X3_TMPLT_SIZE_X                       =  4,
			X3_TMPLT_INST_WORD_POS_X              =  0,
			X3_TMPLT_SIGN_VAL_POS_X               =  0,
			X3_BTYPE_QP_INST_WORD_X               =  2,
			X3_BTYPE_QP_SIZE_X                    =  9,
			X3_BTYPE_QP_INST_WORD_POS_X           =  23,
			X3_BTYPE_QP_INST_VAL_POS_X            =  0,
			X3_EMPTY_INST_WORD_X                  =  1,
			X3_EMPTY_SIZE_X                       =  2,
			X3_EMPTY_INST_WORD_POS_X              =  14,
			X3_EMPTY_INST_VAL_POS_X               =  0,
		}

		struct IMAGE_LINENUMBER {
			union {
				DWORD SymbolTableIndex;
				DWORD VirtualAddress;
			}
			WORD Linenumber;
		}
		alias IMAGE_LINENUMBER* PIMAGE_LINENUMBER;
	} // align(2)

	struct IMAGE_BASE_RELOCATION {
		DWORD VirtualAddress;
		DWORD SizeOfBlock;
		//WORD[1] TypeOffset;
	}
	alias IMAGE_BASE_RELOCATION* PIMAGE_BASE_RELOCATION;

	enum {
		IMAGE_REL_BASED_ABSOLUTE       = 0,
		IMAGE_REL_BASED_HIGH           = 1,
		IMAGE_REL_BASED_LOW            = 2,
		IMAGE_REL_BASED_HIGHLOW        = 3,
		IMAGE_REL_BASED_HIGHADJ        = 4,
		IMAGE_REL_BASED_MIPS_JMPADDR   = 5,
		IMAGE_REL_BASED_MIPS_JMPADDR16 = 9,
		IMAGE_REL_BASED_IA64_IMM64     = 9,
		IMAGE_REL_BASED_DIR64          = 10,
	}

	enum IMAGE_ARCHIVE_START_SIZE = 8;
	const char* IMAGE_ARCHIVE_START  = "!<arch>\n";
	const char* IMAGE_ARCHIVE_END = "`\n";
	const char* IMAGE_ARCHIVE_PAD = "\n";
	const char* IMAGE_ARCHIVE_LINKER_MEMBER = "/               ";
	const char* IMAGE_ARCHIVE_LONGNAMES_MEMBER = "//              ";

	struct IMAGE_ARCHIVE_MEMBER_HEADER {
		BYTE[16] Name;
		BYTE[12] Date;
		BYTE[6] UserID;
		BYTE[6] GroupID;
		BYTE[8] Mode;
		BYTE[10] Size;
		BYTE[2] EndHeader;
	}
	alias IMAGE_ARCHIVE_MEMBER_HEADER* PIMAGE_ARCHIVE_MEMBER_HEADER;

	enum IMAGE_SIZEOF_ARCHIVE_MEMBER_HDR = 60;

	struct IMAGE_EXPORT_DIRECTORY {
		DWORD Characteristics;
		DWORD TimeDateStamp;
		WORD MajorVersion;
		WORD MinorVersion;
		DWORD Name;
		DWORD Base;
		DWORD NumberOfFunctions;
		DWORD NumberOfNames;
		DWORD AddressOfFunctions;
		DWORD AddressOfNames;
		DWORD AddressOfNameOrdinals;
	}
	alias IMAGE_EXPORT_DIRECTORY* PIMAGE_EXPORT_DIRECTORY;

	struct IMAGE_IMPORT_BY_NAME {
		WORD Hint;
		BYTE[1] Name;
	}
	alias IMAGE_IMPORT_BY_NAME* PIMAGE_IMPORT_BY_NAME;

	align(8)
	struct IMAGE_THUNK_DATA64 {
		union {
			ULONGLONG ForwarderString;
			ULONGLONG Function;
			ULONGLONG Ordinal;
			ULONGLONG AddressOfData;
		}
	}
	alias IMAGE_THUNK_DATA64* PIMAGE_THUNK_DATA64;

	struct IMAGE_THUNK_DATA32 {
		union {
			DWORD ForwarderString;
			DWORD Function;
			DWORD Ordinal;
			DWORD AddressOfData;
		}
	}
	alias IMAGE_THUNK_DATA32* PIMAGE_THUNK_DATA32;

	enum {
		IMAGE_ORDINAL_FLAG64 = 0x8000000000000000,
		IMAGE_ORDINAL_FLAG32 = 0x80000000,
	}
	//#define IMAGE_ORDINAL64(Ordinal) (Ordinal & 0xffff)
	//#define IMAGE_ORDINAL32(Ordinal) (Ordinal & 0xffff)
	//#define IMAGE_SNAP_BY_ORDINAL64(Ordinal) ((Ordinal & IMAGE_ORDINAL_FLAG64) != 0)
	//#define IMAGE_SNAP_BY_ORDINAL32(Ordinal) ((Ordinal & IMAGE_ORDINAL_FLAG32) != 0)

	alias extern(Windows) VOID function(PVOID DllHandle, DWORD Reason, PVOID Reserved) PIMAGE_TLS_CALLBACK;

	struct IMAGE_TLS_DIRECTORY64 {
		ULONGLONG StartAddressOfRawData;
		ULONGLONG EndAddressOfRawData;
		ULONGLONG AddressOfIndex;
		ULONGLONG AddressOfCallBacks;
		DWORD SizeOfZeroFill;
		DWORD Characteristics;
	}
	alias IMAGE_TLS_DIRECTORY64* PIMAGE_TLS_DIRECTORY64;

	struct IMAGE_TLS_DIRECTORY32 {
		DWORD StartAddressOfRawData;
		DWORD EndAddressOfRawData;
		DWORD AddressOfIndex;
		DWORD AddressOfCallBacks;
		DWORD SizeOfZeroFill;
		DWORD Characteristics;
	}
	alias IMAGE_TLS_DIRECTORY32* PIMAGE_TLS_DIRECTORY32;

	version(Win64){
		alias IMAGE_ORDINAL_FLAG64 IMAGE_ORDINAL_FLAG;
		//#define IMAGE_ORDINAL(Ordinal)          IMAGE_ORDINAL64(Ordinal)
		alias IMAGE_THUNK_DATA64 IMAGE_THUNK_DATA;
		alias PIMAGE_THUNK_DATA64 PIMAGE_THUNK_DATA;
		//#define IMAGE_SNAP_BY_ORDINAL(Ordinal)  IMAGE_SNAP_BY_ORDINAL64(Ordinal)
		alias IMAGE_TLS_DIRECTORY64 IMAGE_TLS_DIRECTORY;
		alias PIMAGE_TLS_DIRECTORY64 PIMAGE_TLS_DIRECTORY;
	}else{
		alias IMAGE_ORDINAL_FLAG32 IMAGE_ORDINAL_FLAG;
		//#define IMAGE_ORDINAL(Ordinal)          IMAGE_ORDINAL32(Ordinal)
		alias IMAGE_THUNK_DATA32              IMAGE_THUNK_DATA;
		alias PIMAGE_THUNK_DATA32             PIMAGE_THUNK_DATA;
		//#define IMAGE_SNAP_BY_ORDINAL(Ordinal)  IMAGE_SNAP_BY_ORDINAL32(Ordinal)
		alias IMAGE_TLS_DIRECTORY32 IMAGE_TLS_DIRECTORY;
		alias PIMAGE_TLS_DIRECTORY32 PIMAGE_TLS_DIRECTORY;
	}

	struct IMAGE_IMPORT_DESCRIPTOR {
		union {
			DWORD Characteristics;
			DWORD OriginalFirstThunk;
		}
		DWORD TimeDateStamp;
		DWORD ForwarderChain;
		DWORD Name;
		DWORD FirstThunk;
	}
	alias IMAGE_IMPORT_DESCRIPTOR* PIMAGE_IMPORT_DESCRIPTOR;

	struct IMAGE_BOUND_IMPORT_DESCRIPTOR {
		DWORD TimeDateStamp;
		WORD OffsetModuleName;
		WORD NumberOfModuleForwarderRefs;
	}
	alias IMAGE_BOUND_IMPORT_DESCRIPTOR* PIMAGE_BOUND_IMPORT_DESCRIPTOR;

	struct IMAGE_BOUND_FORWARDER_REF {
		DWORD TimeDateStamp;
		WORD OffsetModuleName;
		WORD Reserved;
	}
	alias IMAGE_BOUND_FORWARDER_REF* PIMAGE_BOUND_FORWARDER_REF;

	struct IMAGE_RESOURCE_DIRECTORY {
		DWORD Characteristics;
		DWORD TimeDateStamp;
		WORD MajorVersion;
		WORD MinorVersion;
		WORD NumberOfNamedEntries;
		WORD NumberOfIdEntries;
		// IMAGE_RESOURCE_DIRECTORY_ENTRY[] DirectoryEntries;
	}
	alias IMAGE_RESOURCE_DIRECTORY* PIMAGE_RESOURCE_DIRECTORY;

	enum {
		IMAGE_RESOURCE_NAME_IS_STRING    = 0x80000000,
		IMAGE_RESOURCE_DATA_IS_DIRECTORY = 0x80000000,
	}

	struct IMAGE_RESOURCE_DIRECTORY_ENTRY {
		union {
			struct {
				DWORD NameOffset31NameIsString1;
			}
			DWORD Name;
			WORD Id;
		}
		union {
			DWORD OffsetToData;
			struct {
				DWORD OffsetToDirectory31DataIsDirectory1;
			}
		}
	}
	alias IMAGE_RESOURCE_DIRECTORY_ENTRY* PIMAGE_RESOURCE_DIRECTORY_ENTRY;

	struct IMAGE_RESOURCE_DIRECTORY_STRING {
		WORD Length;
		CHAR[1] NameString;
	}
	alias IMAGE_RESOURCE_DIRECTORY_STRING* PIMAGE_RESOURCE_DIRECTORY_STRING;

	struct IMAGE_RESOURCE_DIR_STRING_U {
		WORD Length;
		WCHAR[1] NameString;
	}
	alias IMAGE_RESOURCE_DIR_STRING_U* PIMAGE_RESOURCE_DIR_STRING_U;

	struct IMAGE_RESOURCE_DATA_ENTRY {
		DWORD OffsetToData;
		DWORD Size;
		DWORD CodePage;
		DWORD Reserved;
	}
	alias IMAGE_RESOURCE_DATA_ENTRY* PIMAGE_RESOURCE_DATA_ENTRY;

	struct IMAGE_LOAD_CONFIG_DIRECTORY32 {
		DWORD Size;
		DWORD TimeDateStamp;
		WORD MajorVersion;
		WORD MinorVersion;
		DWORD GlobalFlagsClear;
		DWORD GlobalFlagsSet;
		DWORD CriticalSectionDefaultTimeout;
		DWORD DeCommitFreeBlockThreshold;
		DWORD DeCommitTotalFreeThreshold;
		DWORD LockPrefixTable;
		DWORD MaximumAllocationSize;
		DWORD VirtualMemoryThreshold;
		DWORD ProcessHeapFlags;
		DWORD ProcessAffinityMask;
		WORD CSDVersion;
		WORD Reserved1;
		DWORD EditList;
		DWORD SecurityCookie;
		DWORD SEHandlerTable;
		DWORD SEHandlerCount;
	}
	alias IMAGE_LOAD_CONFIG_DIRECTORY32* PIMAGE_LOAD_CONFIG_DIRECTORY32;

	struct IMAGE_LOAD_CONFIG_DIRECTORY64 {
		DWORD Size;
		DWORD TimeDateStamp;
		WORD MajorVersion;
		WORD MinorVersion;
		DWORD GlobalFlagsClear;
		DWORD GlobalFlagsSet;
		DWORD CriticalSectionDefaultTimeout;
		ULONGLONG DeCommitFreeBlockThreshold;
		ULONGLONG DeCommitTotalFreeThreshold;
		ULONGLONG LockPrefixTable;
		ULONGLONG MaximumAllocationSize;
		ULONGLONG VirtualMemoryThreshold;
		ULONGLONG ProcessAffinityMask;
		DWORD ProcessHeapFlags;
		WORD CSDVersion;
		WORD Reserved1;
		ULONGLONG EditList;
		ULONGLONG SecurityCookie;
		ULONGLONG SEHandlerTable;
		ULONGLONG SEHandlerCount;
	}
	alias IMAGE_LOAD_CONFIG_DIRECTORY64* PIMAGE_LOAD_CONFIG_DIRECTORY64;

	version(Win64){
		alias IMAGE_LOAD_CONFIG_DIRECTORY64 IMAGE_LOAD_CONFIG_DIRECTORY;
		alias PIMAGE_LOAD_CONFIG_DIRECTORY64 PIMAGE_LOAD_CONFIG_DIRECTORY;
	}else{
		alias IMAGE_LOAD_CONFIG_DIRECTORY32 IMAGE_LOAD_CONFIG_DIRECTORY;
		alias PIMAGE_LOAD_CONFIG_DIRECTORY32 PIMAGE_LOAD_CONFIG_DIRECTORY;
	}

	struct IMAGE_CE_RUNTIME_FUNCTION_ENTRY {
		DWORD FuncStart;
		DWORD PrologLen8FuncLen22ThirtyTwoBit1ExceptionFlag1;
	}
	alias IMAGE_CE_RUNTIME_FUNCTION_ENTRY* PIMAGE_CE_RUNTIME_FUNCTION_ENTRY;

	struct IMAGE_ALPHA64_RUNTIME_FUNCTION_ENTRY {
		ULONGLONG BeginAddress;
		ULONGLONG EndAddress;
		ULONGLONG ExceptionHandler;
		ULONGLONG HandlerData;
		ULONGLONG PrologEndAddress;
	}
	alias IMAGE_ALPHA64_RUNTIME_FUNCTION_ENTRY* PIMAGE_ALPHA64_RUNTIME_FUNCTION_ENTRY;

	struct IMAGE_ALPHA_RUNTIME_FUNCTION_ENTRY {
		DWORD BeginAddress;
		DWORD EndAddress;
		DWORD ExceptionHandler;
		DWORD HandlerData;
		DWORD PrologEndAddress;
	}
	alias IMAGE_ALPHA_RUNTIME_FUNCTION_ENTRY* PIMAGE_ALPHA_RUNTIME_FUNCTION_ENTRY;

	struct IMAGE_IA64_RUNTIME_FUNCTION_ENTRY {
	    DWORD BeginAddress;
	    DWORD EndAddress;
	    DWORD UnwindInfoAddress;
	}
	alias IMAGE_IA64_RUNTIME_FUNCTION_ENTRY* PIMAGE_IA64_RUNTIME_FUNCTION_ENTRY;

	version(none){ // _AXP64_
		alias IMAGE_ALPHA64_RUNTIME_FUNCTION_ENTRY  IMAGE_AXP64_RUNTIME_FUNCTION_ENTRY;
		alias PIMAGE_ALPHA64_RUNTIME_FUNCTION_ENTRY PIMAGE_AXP64_RUNTIME_FUNCTION_ENTRY;
		alias IMAGE_ALPHA64_RUNTIME_FUNCTION_ENTRY  IMAGE_RUNTIME_FUNCTION_ENTRY;
		alias PIMAGE_ALPHA64_RUNTIME_FUNCTION_ENTRY PIMAGE_RUNTIME_FUNCTION_ENTRY;
	}else version(none){ // _ALPHA_
		alias IMAGE_ALPHA_RUNTIME_FUNCTION_ENTRY  IMAGE_RUNTIME_FUNCTION_ENTRY;
		alias PIMAGE_ALPHA_RUNTIME_FUNCTION_ENTRY PIMAGE_RUNTIME_FUNCTION_ENTRY;
	}

	struct IMAGE_DEBUG_DIRECTORY {
		DWORD Characteristics;
		DWORD TimeDateStamp;
		WORD MajorVersion;
		WORD MinorVersion;
		DWORD Type;
		DWORD SizeOfData;
		DWORD AddressOfRawData;
		DWORD PointerToRawData;
	}
	alias IMAGE_DEBUG_DIRECTORY* PIMAGE_DEBUG_DIRECTORY;

	enum {
		IMAGE_DEBUG_TYPE_UNKNOWN       = 0,
		IMAGE_DEBUG_TYPE_COFF          = 1,
		IMAGE_DEBUG_TYPE_CODEVIEW      = 2,
		IMAGE_DEBUG_TYPE_FPO           = 3,
		IMAGE_DEBUG_TYPE_MISC          = 4,
		IMAGE_DEBUG_TYPE_EXCEPTION     = 5,
		IMAGE_DEBUG_TYPE_FIXUP         = 6,
		IMAGE_DEBUG_TYPE_OMAP_TO_SRC   = 7,
		IMAGE_DEBUG_TYPE_OMAP_FROM_SRC = 8,
		IMAGE_DEBUG_TYPE_BORLAND       = 9,
		IMAGE_DEBUG_TYPE_RESERVED10    = 10,
		IMAGE_DEBUG_TYPE_CLSID         = 11,
	}

	struct IMAGE_COFF_SYMBOLS_HEADER {
		DWORD NumberOfSymbols;
		DWORD LvaToFirstSymbol;
		DWORD NumberOfLinenumbers;
		DWORD LvaToFirstLinenumber;
		DWORD RvaToFirstByteOfCode;
		DWORD RvaToLastByteOfCode;
		DWORD RvaToFirstByteOfData;
		DWORD RvaToLastByteOfData;
	}
	alias IMAGE_COFF_SYMBOLS_HEADER* PIMAGE_COFF_SYMBOLS_HEADER;

	enum {
		FRAME_FPO    = 0,
		FRAME_TRAP   = 1,
		FRAME_TSS    = 2,
		FRAME_NONFPO = 3,
	}

	struct FPO_DATA {
		DWORD ulOffStart;
		DWORD cbProcSize;
		DWORD cdwLocals;
		WORD cdwParams;
		WORD cbProlog8cbRegs3fHasSEH1fUseBP1reserved1cbFrame2;
	}
	alias FPO_DATA* PFPO_DATA;
	enum SIZEOF_RFPO_DATA = 16;

	enum IMAGE_DEBUG_MISC_EXENAME = 1;

	struct IMAGE_DEBUG_MISC {
		DWORD DataType;
		DWORD Length;
		BOOLEAN Unicode;
		BYTE[3] Reserved;
		BYTE[1] Data;
	}
	alias IMAGE_DEBUG_MISC* PIMAGE_DEBUG_MISC;

	struct IMAGE_FUNCTION_ENTRY {
		DWORD StartingAddress;
		DWORD EndingAddress;
		DWORD EndOfPrologue;
	}
	alias IMAGE_FUNCTION_ENTRY* PIMAGE_FUNCTION_ENTRY;

	struct IMAGE_FUNCTION_ENTRY64 {
		ULONGLONG StartingAddress;
		ULONGLONG EndingAddress;
		union {
			ULONGLONG EndOfPrologue;
			ULONGLONG UnwindInfoAddress;
		}
	}
	alias IMAGE_FUNCTION_ENTRY64* PIMAGE_FUNCTION_ENTRY64;

	struct IMAGE_SEPARATE_DEBUG_HEADER {
		WORD Signature;
		WORD Flags;
		WORD Machine;
		WORD Characteristics;
		DWORD TimeDateStamp;
		DWORD CheckSum;
		DWORD ImageBase;
		DWORD SizeOfImage;
		DWORD NumberOfSections;
		DWORD ExportedNamesSize;
		DWORD DebugDirectorySize;
		DWORD SectionAlignment;
		DWORD[2] Reserved;
	}
	alias IMAGE_SEPARATE_DEBUG_HEADER* PIMAGE_SEPARATE_DEBUG_HEADER;

	struct NON_PAGED_DEBUG_INFO {
		WORD Signature;
		WORD Flags;
		DWORD Size;
		WORD Machine;
		WORD Characteristics;
		DWORD TimeDateStamp;
		DWORD CheckSum;
		DWORD SizeOfImage;
		ULONGLONG ImageBase;
		//DebugDirectorySize
		//IMAGE_DEBUG_DIRECTORY
	}
	alias NON_PAGED_DEBUG_INFO* PNON_PAGED_DEBUG_INFO;

	enum {
		IMAGE_SEPARATE_DEBUG_SIGNATURE = 0x4944,
		NON_PAGED_DEBUG_SIGNATURE      = 0x494E,
	}

	enum {
		IMAGE_SEPARATE_DEBUG_FLAGS_MASK = 0x8000,
		IMAGE_SEPARATE_DEBUG_MISMATCH   = 0x8000,
	}

	struct IMAGE_ARCHITECTURE_HEADER {
		uint AmaskValue1_7AmaskShift8_16;
		DWORD FirstEntryRVA;
	}
	alias IMAGE_ARCHITECTURE_HEADER* PIMAGE_ARCHITECTURE_HEADER;

	struct IMAGE_ARCHITECTURE_ENTRY {
		DWORD FixupInstRVA;
		DWORD NewInst;
	}
	alias IMAGE_ARCHITECTURE_ENTRY* PIMAGE_ARCHITECTURE_ENTRY;
} // align(4)


enum IMPORT_OBJECT_HDR_SIG2 = 0xffff;

struct IMPORT_OBJECT_HEADER {
	WORD Sig1;
	WORD Sig2;
	WORD Version;
	WORD Machine;
	DWORD TimeDateStamp;
	DWORD SizeOfData;
	union {
		WORD Ordinal;
		WORD Hint;
	}
	WORD Type2NameType3Reserved11;
}

enum {
	IMPORT_OBJECT_CODE  = 0,
	IMPORT_OBJECT_DATA  = 1,
	IMPORT_OBJECT_CONST = 2,
}
alias int IMPORT_OBJECT_TYPE;

enum {
	IMPORT_OBJECT_ORDINAL         = 0,
	IMPORT_OBJECT_NAME            = 1,
	IMPORT_OBJECT_NAME_NO_PREFIX  = 2,
	IMPORT_OBJECT_NAME_UNDECORATE = 3,
}
alias int IMPORT_OBJECT_NAME_TYPE;

enum {
	COMIMAGE_FLAGS_ILONLY                      = 0x00000001,
	COMIMAGE_FLAGS_32BITREQUIRED               = 0x00000002,
	COMIMAGE_FLAGS_IL_LIBRARY                  = 0x00000004,
	COMIMAGE_FLAGS_STRONGNAMESIGNED            = 0x00000008,
	COMIMAGE_FLAGS_NATIVE_ENTRYPOINT           = 0x00000010,
	COMIMAGE_FLAGS_TRACKDEBUGDATA              = 0x00010000,
	COR_VERSION_MAJOR_V2                       = 2,
	COR_VERSION_MAJOR                          = COR_VERSION_MAJOR_V2,
	COR_VERSION_MINOR                          = 0,
	COR_DELETED_NAME_LENGTH                    = 8,
	COR_VTABLEGAP_NAME_LENGTH                  = 8,
	NATIVE_TYPE_MAX_CB                         = 1,
	COR_ILMETHOD_SECT_SMALL_MAX_DATASIZE       = 0xFF,
	IMAGE_COR_MIH_METHODRVA                    = 0x01,
	IMAGE_COR_MIH_EHRVA                        = 0x02,
	IMAGE_COR_MIH_BASICBLOCK                   = 0x08,
	COR_VTABLE_32BIT                           = 0x01,
	COR_VTABLE_64BIT                           = 0x02,
	COR_VTABLE_FROM_UNMANAGED                  = 0x04,
	COR_VTABLE_FROM_UNMANAGED_RETAIN_APPDOMAIN = 0x08,
	COR_VTABLE_CALL_MOST_DERIVED               = 0x10,
	IMAGE_COR_EATJ_THUNK_SIZE                  = 32,
	MAX_CLASS_NAME                             = 1024,
	MAX_PACKAGE_NAME                           = 1024,
}
alias uint ReplacesCorHdrNumericDefines;

struct IMAGE_COR20_HEADER {
	DWORD cb;
	WORD MajorRuntimeVersion;
	WORD MinorRuntimeVersion;
	IMAGE_DATA_DIRECTORY MetaData;
	DWORD Flags;
	union {
		DWORD EntryPointToken;
		DWORD EntryPointRVA;
	}
	IMAGE_DATA_DIRECTORY Resources;
	IMAGE_DATA_DIRECTORY StrongNameSignature;
	IMAGE_DATA_DIRECTORY CodeManagerTable;
	IMAGE_DATA_DIRECTORY VTableFixups;
	IMAGE_DATA_DIRECTORY ExportAddressTableJumps;
	IMAGE_DATA_DIRECTORY ManagedNativeHeader;
}
alias IMAGE_COR20_HEADER* PIMAGE_COR20_HEADER;

version(Win64){
	align(16)
	struct SLIST_ENTRY {
		PSLIST_ENTRY Next;
	}
		alias SLIST_ENTRY* PSLIST_ENTRY;

	struct SLIST_ENTRY32 {
		DWORD Next;
	}
	alias SLIST_ENTRY32* PSLIST_ENTRY32;
}else{
	alias SINGLE_LIST_ENTRY SLIST_ENTRY;
	alias PSINGLE_LIST_ENTRY PSLIST_ENTRY;
	alias SLIST_ENTRY SLIST_ENTRY32;
	alias SLIST_ENTRY32* PSLIST_ENTRY32;
}

version(Win64){
	align(16)
	union SLIST_HEADER {
		struct {
			ULONGLONG Alignment;
			ULONGLONG Region;
		}
	}
	alias SLIST_HEADER* PSLIST_HEADER;

	union SLIST_HEADER32{
		ULONGLONG Alignment;
		struct {
			SLIST_ENTRY32 Next;
			WORD Depth;
			WORD Sequence;
		}
	}
	alias SLIST_HEADER32* PSLIST_HEADER32;
}else{
	union SLIST_HEADER {
		ULONGLONG Alignment;
		struct {
			SLIST_ENTRY Next;
			WORD Depth;
			WORD Sequence;
		}
	}
	alias SLIST_HEADER* PSLIST_HEADER;
	alias SLIST_HEADER SLIST_HEADER32;
	alias SLIST_HEADER32* PSLIST_HEADER32;

}

export extern(Windows) VOID RtlInitializeSListHead(PSLIST_HEADER ListHead);

export extern(Windows) PSLIST_ENTRY RtlFirstEntrySList(const(SLIST_HEADER)* ListHead);
export extern(Windows) PSLIST_ENTRY RtlInterlockedPopEntrySList(PSLIST_HEADER ListHead);
export extern(Windows) PSLIST_ENTRY RtlInterlockedPushEntrySList(PSLIST_HEADER ListHead, PSLIST_ENTRY ListEntry);
export extern(Windows) PSLIST_ENTRY RtlInterlockedFlushSList(PSLIST_HEADER ListHead);
export extern(Windows) WORD RtlQueryDepthSList(PSLIST_HEADER ListHead);
version(none) // _IA64_
	export extern(Windows) PSLIST_ENTRY32 RtlInterlockedPopEntrySList32(PSLIST_HEADER32 ListHead);

enum RTL_RUN_ONCE_INIT = 0;

enum {
	RTL_RUN_ONCE_CHECK_ONLY  = 0x00000001,
	RTL_RUN_ONCE_ASYNC       = 0x00000002,
	RTL_RUN_ONCE_INIT_FAILED = 0x00000004,
}

enum RTL_RUN_ONCE_CTX_RESERVED_BITS = 2;

union RTL_RUN_ONCE {
	PVOID Ptr;
}
alias RTL_RUN_ONCE* PRTL_RUN_ONCE;

alias extern(Windows) DWORD function(PRTL_RUN_ONCE RunOnce, PVOID Parameter, PVOID* Context) RTL_RUN_ONCE_INIT_FN;
alias RTL_RUN_ONCE_INIT_FN PRTL_RUN_ONCE_INIT_FN;


static if(NTDDI_VERSION >= NTDDI_LONGHORN){
	export extern(Windows){
		VOID RtlRunOnceInitialize(PRTL_RUN_ONCE RunOnce);
		DWORD RtlRunOnceExecuteOnce(PRTL_RUN_ONCE RunOnce, PRTL_RUN_ONCE_INIT_FN InitFn, PVOID Parameter, PVOID* Context);
		DWORD RtlRunOnceBeginInitialize(PRTL_RUN_ONCE RunOnce, DWORD Flags, PVOID* Context);
		DWORD RtlRunOnceComplete(PRTL_RUN_ONCE RunOnce, DWORD Flags, PVOID Context);
	}
}

enum {
	HEAP_NO_SERIALIZE             = 0x00000001,
	HEAP_GROWABLE                 = 0x00000002,
	HEAP_GENERATE_EXCEPTIONS      = 0x00000004,
	HEAP_ZERO_MEMORY              = 0x00000008,
	HEAP_REALLOC_IN_PLACE_ONLY    = 0x00000010,
	HEAP_TAIL_CHECKING_ENABLED    = 0x00000020,
	HEAP_FREE_CHECKING_ENABLED    = 0x00000040,
	HEAP_DISABLE_COALESCE_ON_FREE = 0x00000080,
	HEAP_CREATE_ALIGN_16          = 0x00010000,
	HEAP_CREATE_ENABLE_TRACING    = 0x00020000,
	HEAP_CREATE_ENABLE_EXECUTE    = 0x00040000,
	HEAP_MAXIMUM_TAG              = 0x0FFF,
	HEAP_PSEUDO_TAG_FLAG          = 0x8000,
	HEAP_TAG_SHIFT                = 18,
}

pure nothrow
DWORD HEAP_MAKE_TAG_FLAGS(DWORD TagBase, DWORD Tag)
{
    return cast(DWORD)(TagBase + (Tag << HEAP_TAG_SHIFT));
}

static if(NTDDI_VERSION > NTDDI_WINXP)
	export extern(Windows) WORD RtlCaptureStackBackTrace(DWORD FramesToSkip, DWORD FramesToCapture, PVOID* BackTrace, PDWORD BackTraceHash);

export extern(Windows) VOID RtlCaptureContext(PCONTEXT ContextRecord);

enum {
	IS_TEXT_UNICODE_ASCII16            = 0x0001,
	IS_TEXT_UNICODE_REVERSE_ASCII16    = 0x0010,
	IS_TEXT_UNICODE_STATISTICS         = 0x0002,
	IS_TEXT_UNICODE_REVERSE_STATISTICS = 0x0020,
	IS_TEXT_UNICODE_CONTROLS           = 0x0004,
	IS_TEXT_UNICODE_REVERSE_CONTROLS   = 0x0040,
	IS_TEXT_UNICODE_SIGNATURE          = 0x0008,
	IS_TEXT_UNICODE_REVERSE_SIGNATURE  = 0x0080,
	IS_TEXT_UNICODE_ILLEGAL_CHARS      = 0x0100,
	IS_TEXT_UNICODE_ODD_LENGTH         = 0x0200,
	IS_TEXT_UNICODE_DBCS_LEADBYTE      = 0x0400,
	IS_TEXT_UNICODE_NULL_BYTES         = 0x1000,
	IS_TEXT_UNICODE_UNICODE_MASK       = 0x000F,
	IS_TEXT_UNICODE_REVERSE_MASK       = 0x00F0,
	IS_TEXT_UNICODE_NOT_UNICODE_MASK   = 0x0F00,
	IS_TEXT_UNICODE_NOT_ASCII_MASK     = 0xF000,
}

enum {
	COMPRESSION_FORMAT_NONE     = 0x0000,
	COMPRESSION_FORMAT_DEFAULT  = 0x0001,
	COMPRESSION_FORMAT_LZNT1    = 0x0002,
	COMPRESSION_ENGINE_STANDARD = 0x0000,
	COMPRESSION_ENGINE_MAXIMUM  = 0x0100,
	COMPRESSION_ENGINE_HIBER    = 0x0200,
}

export extern(Windows) SIZE_T RtlCompareMemory(const(VOID)* Source1, const(VOID)* Source2, SIZE_T Length);

int RtlEqualMemory(const(void)* Destination, const(void)* Source, SIZE_T Length)
{
	return !memcmp(Destination, Source, Length);
}

void RtlMoveMemory(PVOID Destination, const(void)* Source, SIZE_T Length)
{
	memmove(Destination, Source, Length);
}

void RtlCopyMemory(PVOID Destination, const(void)* Source, SIZE_T Length)
{
	memcpy(Destination, Source, Length);
}

void RtlFillMemory(PVOID Destination, SIZE_T Length, BYTE Fill)
{
	memset(Destination, Fill, Length);
}

void RtlZeroMemory(PVOID Destination, SIZE_T Length)
{
	memset(Destination, 0, Length);
}

PVOID RtlSecureZeroMemory(PVOID ptr, SIZE_T cnt)
{
	byte* vptr = cast(byte*)ptr;

	version(X86_64){
		__stosb(cast(PBYTE)cast(DWORD64)vptr, 0, cnt);
	}else{
	    while (cnt) {
	        *vptr = 0;
	        vptr++;
	        cnt--;
	    }
	}

	return ptr;
}

enum {
	SEF_DACL_AUTO_INHERIT             = 0x01,
	SEF_SACL_AUTO_INHERIT             = 0x02,
	SEF_DEFAULT_DESCRIPTOR_FOR_OBJECT = 0x04,
	SEF_AVOID_PRIVILEGE_CHECK         = 0x08,
	SEF_AVOID_OWNER_CHECK             = 0x10,
	SEF_DEFAULT_OWNER_FROM_PARENT     = 0x20,
	SEF_DEFAULT_GROUP_FROM_PARENT     = 0x40,
	SEF_MACL_NO_WRITE_UP              = 0x100,
	SEF_MACL_NO_READ_UP               = 0x200,
	SEF_MACL_NO_EXECUTE_UP            = 0x400,
	SEF_AVOID_OWNER_RESTRICTION       = 0x1000,
	SEF_MACL_VALID_FLAGS              = SEF_MACL_NO_WRITE_UP | SEF_MACL_NO_READ_UP | SEF_MACL_NO_EXECUTE_UP,
}

struct MESSAGE_RESOURCE_ENTRY {
	WORD Length;
	WORD Flags;
	BYTE[1] Text;
}
alias MESSAGE_RESOURCE_ENTRY* PMESSAGE_RESOURCE_ENTRY;

enum MESSAGE_RESOURCE_UNICODE = 0x0001;

struct MESSAGE_RESOURCE_BLOCK {
	DWORD LowId;
	DWORD HighId;
	DWORD OffsetToEntries;
}
alias MESSAGE_RESOURCE_BLOCK* PMESSAGE_RESOURCE_BLOCK;

struct MESSAGE_RESOURCE_DATA {
	DWORD NumberOfBlocks;
	MESSAGE_RESOURCE_BLOCK[1] Blocks;
}
alias MESSAGE_RESOURCE_DATA* PMESSAGE_RESOURCE_DATA;

export extern(Windows) PVOID RtlPcToFileHeader(PVOID PcValue, PVOID* BaseOfImage);

struct OSVERSIONINFOA {
	DWORD dwOSVersionInfoSize;
	DWORD dwMajorVersion;
	DWORD dwMinorVersion;
	DWORD dwBuildNumber;
	DWORD dwPlatformId;
	CHAR[ 128 ] szCSDVersion;
}
alias OSVERSIONINFOA* POSVERSIONINFOA;
alias OSVERSIONINFOA* LPOSVERSIONINFOA;
struct OSVERSIONINFOW {
	DWORD dwOSVersionInfoSize;
	DWORD dwMajorVersion;
	DWORD dwMinorVersion;
	DWORD dwBuildNumber;
	DWORD dwPlatformId;
	WCHAR[128] szCSDVersion;
}
alias OSVERSIONINFOW* POSVERSIONINFOW;
alias OSVERSIONINFOW* LPOSVERSIONINFOW;
alias OSVERSIONINFOW RTL_OSVERSIONINFOW;
alias OSVERSIONINFOW* PRTL_OSVERSIONINFOW;
version(UNICODE){
	alias OSVERSIONINFOW OSVERSIONINFO;
	alias POSVERSIONINFOW POSVERSIONINFO;
	alias LPOSVERSIONINFOW LPOSVERSIONINFO;
}else{
	alias OSVERSIONINFOA OSVERSIONINFO;
	alias POSVERSIONINFOA POSVERSIONINFO;
	alias LPOSVERSIONINFOA LPOSVERSIONINFO;
}

struct OSVERSIONINFOEXA {
	DWORD dwOSVersionInfoSize;
	DWORD dwMajorVersion;
	DWORD dwMinorVersion;
	DWORD dwBuildNumber;
	DWORD dwPlatformId;
	CHAR[128] szCSDVersion;
	WORD wServicePackMajor;
	WORD wServicePackMinor;
	WORD wSuiteMask;
	BYTE wProductType;
	BYTE wReserved;
}
alias OSVERSIONINFOEXA* POSVERSIONINFOEXA;
alias OSVERSIONINFOEXA* LPOSVERSIONINFOEXA;
struct OSVERSIONINFOEXW {
	DWORD dwOSVersionInfoSize;
	DWORD dwMajorVersion;
	DWORD dwMinorVersion;
	DWORD dwBuildNumber;
	DWORD dwPlatformId;
	WCHAR[128] szCSDVersion;
	WORD wServicePackMajor;
	WORD wServicePackMinor;
	WORD wSuiteMask;
	BYTE wProductType;
	BYTE wReserved;
}
alias OSVERSIONINFOEXW* POSVERSIONINFOEXW;
alias OSVERSIONINFOEXW* LPOSVERSIONINFOEXW;
alias OSVERSIONINFOEXW RTL_OSVERSIONINFOEXW;
alias OSVERSIONINFOEXW* PRTL_OSVERSIONINFOEXW;
version(UNICODE){
	alias OSVERSIONINFOEXW OSVERSIONINFOEX;
	alias POSVERSIONINFOEXW POSVERSIONINFOEX;
	alias LPOSVERSIONINFOEXW LPOSVERSIONINFOEX;
}else{
	alias OSVERSIONINFOEXA OSVERSIONINFOEX;
	alias POSVERSIONINFOEXA POSVERSIONINFOEX;
	alias LPOSVERSIONINFOEXA LPOSVERSIONINFOEX;
}


enum {
	VER_EQUAL                       = 1,
	VER_GREATER                     = 2,
	VER_GREATER_EQUAL               = 3,
	VER_LESS                        = 4,
	VER_LESS_EQUAL                  = 5,
	VER_AND                         = 6,
	VER_OR                          = 7,
	VER_CONDITION_MASK              = 7,
	VER_NUM_BITS_PER_CONDITION_MASK = 3,
}

enum {
	VER_MINORVERSION     = 0x0000001,
	VER_MAJORVERSION     = 0x0000002,
	VER_BUILDNUMBER      = 0x0000004,
	VER_PLATFORMID       = 0x0000008,
	VER_SERVICEPACKMINOR = 0x0000010,
	VER_SERVICEPACKMAJOR = 0x0000020,
	VER_SUITENAME        = 0x0000040,
	VER_PRODUCT_TYPE     = 0x0000080,
}

enum {
	VER_NT_WORKSTATION       = 0x0000001,
	VER_NT_DOMAIN_CONTROLLER = 0x0000002,
	VER_NT_SERVER            = 0x0000003,
}

enum {
	VER_PLATFORM_WIN32s        = 0,
	VER_PLATFORM_WIN32_WINDOWS = 1,
	VER_PLATFORM_WIN32_NT      = 2,
}

/*template VER_SET_CONDITION(alias _m_, alias _t_, alias _c_)
{
	_m_ = VerSetConditionMask(_m_, _t_, _c_);
}*/

export extern(Windows) ULONGLONG VerSetConditionMask(ULONGLONG ConditionMask, DWORD TypeMask, BYTE Condition);

static if(NTDDI_VERSION >= NTDDI_VISTA)
	export extern(Windows) BOOLEAN RtlGetProductInfo(DWORD OSMajorVersion, DWORD OSMinorVersion, DWORD SpMajorVersion, DWORD SpMinorVersion, PDWORD ReturnedProductType);

enum RTL_UMS_VERSION = 0x0100;

enum {
	UmsThreadInvalidInfoClass = 0,
	UmsThreadUserContext,
	UmsThreadPriority,
	UmsThreadAffinity,
	UmsThreadTeb,
	UmsThreadIsSuspended,
	UmsThreadIsTerminated,
	UmsThreadMaxInfoClass
}
alias int RTL_UMS_THREAD_INFO_CLASS;
alias RTL_UMS_THREAD_INFO_CLASS* PRTL_UMS_THREAD_INFO_CLASS;

enum {
	UmsSchedulerStartup = 0,
	UmsSchedulerThreadBlocked,
	UmsSchedulerThreadYield,
}
alias int RTL_UMS_SCHEDULER_REASON;
alias RTL_UMS_SCHEDULER_REASON* PRTL_UMS_SCHEDULER_REASON;

alias extern(Windows)
VOID function(RTL_UMS_SCHEDULER_REASON Reason, ULONG_PTR ActivationPayload, PVOID SchedulerParam) RTL_UMS_SCHEDULER_ENTRY_POINT;
alias RTL_UMS_SCHEDULER_ENTRY_POINT PRTL_UMS_SCHEDULER_ENTRY_POINT;

static if (NTDDI_VERSION >= NTDDI_WIN7){
	export extern(Windows){
		DWORD RtlCopyExtendedContext(PCONTEXT_EX Destination, DWORD ContextFlags, PCONTEXT_EX Source);
		DWORD RtlInitializeExtendedContext(PVOID Context, DWORD ContextFlags, PCONTEXT_EX* ContextEx);
		DWORD64 RtlGetEnabledExtendedFeatures(DWORD64 FeatureMask);
		DWORD RtlGetExtendedContextLength(DWORD ContextFlags, PDWORD ContextLength);
		DWORD64 RtlGetExtendedFeaturesMask(PCONTEXT_EX ContextEx);
		PVOID RtlLocateExtendedFeature(PCONTEXT_EX ContextEx, DWORD FeatureId, PDWORD Length);
		PCONTEXT RtlLocateLegacyContext(PCONTEXT_EX ContextEx, PDWORD Length);
		VOID RtlSetExtendedFeaturesMask(PCONTEXT_EX ContextEx, DWORD64 FeatureMask);
	}
}

struct RTL_CRITICAL_SECTION_DEBUG {
	WORD Type;
	WORD CreatorBackTraceIndex;
	RTL_CRITICAL_SECTION* CriticalSection;
	LIST_ENTRY ProcessLocksList;
	DWORD EntryCount;
	DWORD ContentionCount;
	DWORD Flags;
	WORD CreatorBackTraceIndexHigh;
	WORD SpareWORD;
}
alias RTL_CRITICAL_SECTION_DEBUG* PRTL_CRITICAL_SECTION_DEBUG;
alias RTL_CRITICAL_SECTION_DEBUG RTL_RESOURCE_DEBUG;
alias RTL_CRITICAL_SECTION_DEBUG* PRTL_RESOURCE_DEBUG;

enum {
	RTL_CRITSECT_TYPE = 0,
	RTL_RESOURCE_TYPE = 1,
}
enum {
	RTL_CRITICAL_SECTION_FLAG_NO_DEBUG_INFO     = 0x01000000,
	RTL_CRITICAL_SECTION_FLAG_DYNAMIC_SPIN      = 0x02000000,
	RTL_CRITICAL_SECTION_FLAG_STATIC_INIT       = 0x04000000,
	RTL_CRITICAL_SECTION_ALL_FLAG_BITS          = 0xFF000000,
	RTL_CRITICAL_SECTION_FLAG_RESERVED          = RTL_CRITICAL_SECTION_ALL_FLAG_BITS & (~(RTL_CRITICAL_SECTION_FLAG_NO_DEBUG_INFO | RTL_CRITICAL_SECTION_FLAG_DYNAMIC_SPIN | RTL_CRITICAL_SECTION_FLAG_STATIC_INIT)),
	RTL_CRITICAL_SECTION_DEBUG_FLAG_STATIC_INIT = 0x00000001,
}

align(8)
struct RTL_CRITICAL_SECTION {
	PRTL_CRITICAL_SECTION_DEBUG DebugInfo;
	LONG LockCount;
	LONG RecursionCount;
	HANDLE OwningThread;
	HANDLE LockSemaphore;
	ULONG_PTR SpinCount;
}
alias RTL_CRITICAL_SECTION* PRTL_CRITICAL_SECTION;


struct RTL_SRWLOCK {
	PVOID Ptr;
}
alias RTL_SRWLOCK* PRTL_SRWLOCK;
struct RTL_CONDITION_VARIABLE {
	PVOID Ptr;
}
alias RTL_CONDITION_VARIABLE* PRTL_CONDITION_VARIABLE;
//const RTL_CONDITION_VARIABLE RTL_CONDITION_VARIABLE_INIT = {0};
//const RTL_CONDITION_VARIABLE_LOCKMODE_SHARED = 0x1;
alias extern(Windows) VOID function(ULONG_PTR Parameter) PAPCFUNC;
alias extern(Windows) LONG function(EXCEPTION_POINTERS* ExceptionInfo) PVECTORED_EXCEPTION_HANDLER;

enum {
	HeapCompatibilityInformation,
	HeapEnableTerminationOnCorruption
}
alias int HEAP_INFORMATION_CLASS;

enum {
	WT_EXECUTEDEFAULT              = 0x00000000,
	WT_EXECUTEINIOTHREAD           = 0x00000001,
	WT_EXECUTEINUITHREAD           = 0x00000002,
	WT_EXECUTEINWAITTHREAD         = 0x00000004,
	WT_EXECUTEONLYONCE             = 0x00000008,
	WT_EXECUTEINTIMERTHREAD        = 0x00000020,
	WT_EXECUTELONGFUNCTION         = 0x00000010,
	WT_EXECUTEINPERSISTENTIOTHREAD = 0x00000040,
	WT_EXECUTEINPERSISTENTTHREAD   = 0x00000080,
	WT_TRANSFER_IMPERSONATION      = 0x00000100,
}
/*template WT_SET_MAX_THREADPOOL_THREADS(alias Flags, alias Limit)
{
	Flags |= Limit << 16;
}*/

alias extern(Windows) VOID function(PVOID, BOOLEAN) WAITORTIMERCALLBACKFUNC;
alias extern(Windows) VOID function(PVOID) WORKERCALLBACKFUNC;
alias extern(Windows) VOID function(DWORD, PVOID, PVOID) APC_CALLBACK_FUNCTION;
alias extern(Windows) VOID function(PVOID lpFlsData) PFLS_CALLBACK_FUNCTION;
alias extern(Windows) BOOLEAN function(PVOID Addr, SIZE_T Range) PSECURE_MEMORY_CACHE_CALLBACK;
enum {
	WT_EXECUTEINLONGTHREAD  = 0x00000010,
	WT_EXECUTEDELETEWAIT    = 0x00000008,
}

enum {
	ActivationContextBasicInformation                       = 1,
	ActivationContextDetailedInformation                    = 2,
	AssemblyDetailedInformationInActivationContext          = 3,
	FileInformationInAssemblyOfAssemblyInActivationContext  = 4,
	RunlevelInformationInActivationContext                  = 5,
	CompatibilityInformationInActivationContext             = 6,
	ActivationContextManifestResourceName                   = 7,
	MaxActivationContextInfoClass,
	AssemblyDetailedInformationInActivationContxt           = 3,
	FileInformationInAssemblyOfAssemblyInActivationContxt   = 4
}
alias int ACTIVATION_CONTEXT_INFO_CLASS;
alias ACTIVATION_CONTEXT_INFO_CLASS ACTIVATIONCONTEXTINFOCLASS;

struct ACTIVATION_CONTEXT_QUERY_INDEX {
	DWORD ulAssemblyIndex;
	DWORD ulFileIndexInAssembly;
}
alias ACTIVATION_CONTEXT_QUERY_INDEX* PACTIVATION_CONTEXT_QUERY_INDEX;
alias const(ACTIVATION_CONTEXT_QUERY_INDEX)* PCACTIVATION_CONTEXT_QUERY_INDEX;

enum {
	ACTIVATION_CONTEXT_PATH_TYPE_NONE        = 1,
	ACTIVATION_CONTEXT_PATH_TYPE_WIN32_FILE  = 2,
	ACTIVATION_CONTEXT_PATH_TYPE_URL         = 3,
	ACTIVATION_CONTEXT_PATH_TYPE_ASSEMBLYREF = 4,
}

struct ASSEMBLY_FILE_DETAILED_INFORMATION {
	DWORD ulFlags;
	DWORD ulFilenameLength;
	DWORD ulPathLength;
	PCWSTR lpFileName;
	PCWSTR lpFilePath;
}
alias ASSEMBLY_FILE_DETAILED_INFORMATION* PASSEMBLY_FILE_DETAILED_INFORMATION;
alias const(ASSEMBLY_FILE_DETAILED_INFORMATION)* PCASSEMBLY_FILE_DETAILED_INFORMATION;
alias ASSEMBLY_FILE_DETAILED_INFORMATION ASSEMBLY_DLL_REDIRECTION_DETAILED_INFORMATION;
alias PASSEMBLY_FILE_DETAILED_INFORMATION PASSEMBLY_DLL_REDIRECTION_DETAILED_INFORMATION;
alias PCASSEMBLY_FILE_DETAILED_INFORMATION PCASSEMBLY_DLL_REDIRECTION_DETAILED_INFORMATION;

struct ACTIVATION_CONTEXT_ASSEMBLY_DETAILED_INFORMATION {
	DWORD ulFlags;
	DWORD ulEncodedAssemblyIdentityLength;
	DWORD ulManifestPathType;
	DWORD ulManifestPathLength;
	LARGE_INTEGER liManifestLastWriteTime;
	DWORD ulPolicyPathType;
	DWORD ulPolicyPathLength;
	LARGE_INTEGER liPolicyLastWriteTime;
	DWORD ulMetadataSatelliteRosterIndex;
	DWORD ulManifestVersionMajor;
	DWORD ulManifestVersionMinor;
	DWORD ulPolicyVersionMajor;
	DWORD ulPolicyVersionMinor;
	DWORD ulAssemblyDirectoryNameLength;
	PCWSTR lpAssemblyEncodedAssemblyIdentity;
	PCWSTR lpAssemblyManifestPath;
	PCWSTR lpAssemblyPolicyPath;
	PCWSTR lpAssemblyDirectoryName;
	DWORD ulFileCount;
}
alias ACTIVATION_CONTEXT_ASSEMBLY_DETAILED_INFORMATION* PACTIVATION_CONTEXT_ASSEMBLY_DETAILED_INFORMATION;
alias const(ACTIVATION_CONTEXT_ASSEMBLY_DETAILED_INFORMATION)* PCACTIVATION_CONTEXT_ASSEMBLY_DETAILED_INFORMATION;

enum {
	ACTCTX_RUN_LEVEL_UNSPECIFIED = 0,
	ACTCTX_RUN_LEVEL_AS_INVOKER,
	ACTCTX_RUN_LEVEL_HIGHEST_AVAILABLE,
	ACTCTX_RUN_LEVEL_REQUIRE_ADMIN,
	ACTCTX_RUN_LEVEL_NUMBERS
}
alias int ACTCTX_REQUESTED_RUN_LEVEL;

struct ACTIVATION_CONTEXT_RUN_LEVEL_INFORMATION {
	DWORD ulFlags;
	ACTCTX_REQUESTED_RUN_LEVEL  RunLevel;
	DWORD UiAccess;
}
alias ACTIVATION_CONTEXT_RUN_LEVEL_INFORMATION* PACTIVATION_CONTEXT_RUN_LEVEL_INFORMATION;
alias const(ACTIVATION_CONTEXT_RUN_LEVEL_INFORMATION)* PCACTIVATION_CONTEXT_RUN_LEVEL_INFORMATION;

enum {
	ACTCTX_COMPATIBILITY_ELEMENT_TYPE_UNKNOWN = 0,
	ACTCTX_COMPATIBILITY_ELEMENT_TYPE_OS,
	ACTCTX_COMPATIBILITY_ELEMENT_TYPE_MITIGATION
}
alias int ACTCTX_COMPATIBILITY_ELEMENT_TYPE;

struct COMPATIBILITY_CONTEXT_ELEMENT {
	GUID Id;
	ACTCTX_COMPATIBILITY_ELEMENT_TYPE Type;
}
alias COMPATIBILITY_CONTEXT_ELEMENT* PCOMPATIBILITY_CONTEXT_ELEMENT;
alias const(COMPATIBILITY_CONTEXT_ELEMENT)* PCCOMPATIBILITY_CONTEXT_ELEMENT;


struct ACTIVATION_CONTEXT_COMPATIBILITY_INFORMATION {
	DWORD ElementCount;
	COMPATIBILITY_CONTEXT_ELEMENT[1] Elements;
}
alias ACTIVATION_CONTEXT_COMPATIBILITY_INFORMATION* PACTIVATION_CONTEXT_COMPATIBILITY_INFORMATION;
alias const(ACTIVATION_CONTEXT_COMPATIBILITY_INFORMATION)* PCACTIVATION_CONTEXT_COMPATIBILITY_INFORMATION;

enum MAX_SUPPORTED_OS_NUM = 4;
enum INVALID_OS_COUNT = 0xffff;

struct SUPPORTED_OS_INFO {
	WORD OsCount;
	WORD MitigationExist;
	WORD[MAX_SUPPORTED_OS_NUM] OsList;
}
alias SUPPORTED_OS_INFO* PSUPPORTED_OS_INFO;

struct ACTIVATION_CONTEXT_DETAILED_INFORMATION {
	DWORD dwFlags;
	DWORD ulFormatVersion;
	DWORD ulAssemblyCount;
	DWORD ulRootManifestPathType;
	DWORD ulRootManifestPathChars;
	DWORD ulRootConfigurationPathType;
	DWORD ulRootConfigurationPathChars;
	DWORD ulAppDirPathType;
	DWORD ulAppDirPathChars;
	PCWSTR lpRootManifestPath;
	PCWSTR lpRootConfigurationPath;
	PCWSTR lpAppDirPath;
}
alias ACTIVATION_CONTEXT_DETAILED_INFORMATION* PACTIVATION_CONTEXT_DETAILED_INFORMATION;
alias const(ACTIVATION_CONTEXT_DETAILED_INFORMATION)* PCACTIVATION_CONTEXT_DETAILED_INFORMATION;

struct HARDWARE_COUNTER_DATA {
	HARDWARE_COUNTER_TYPE Type;
	DWORD Reserved;
	DWORD64 Value;
}
alias HARDWARE_COUNTER_DATA* PHARDWARE_COUNTER_DATA;

enum PERFORMANCE_DATA_VERSION = 1;

struct PERFORMANCE_DATA {
	WORD Size;
	BYTE Version;
	BYTE HwCountersCount;
	DWORD ContextSwitchCount;
	DWORD64 WaitReasonBitMap;
	DWORD64 CycleTime;
	DWORD RetryCount;
	DWORD Reserved;
	HARDWARE_COUNTER_DATA[MAX_HW_COUNTERS] HwCounters;
}
alias PERFORMANCE_DATA* PPERFORMANCE_DATA;

enum {
	READ_THREAD_PROFILING_FLAG_DISPATCHING       = 0x00000001,
	READ_THREAD_PROFILING_FLAG_HARDWARE_COUNTERS = 0x00000002,
}

enum {
	DLL_PROCESS_ATTACH = 1,
	DLL_THREAD_ATTACH  = 2,
	DLL_THREAD_DETACH  = 3,
	DLL_PROCESS_DETACH = 0,
}

enum {
	EVENTLOG_SEQUENTIAL_READ = 0x0001,
	EVENTLOG_SEEK_READ       = 0x0002,
	EVENTLOG_FORWARDS_READ   = 0x0004,
	EVENTLOG_BACKWARDS_READ  = 0x0008,
}

enum {
	EVENTLOG_SUCCESS          = 0x0000,
	EVENTLOG_ERROR_TYPE       = 0x0001,
	EVENTLOG_WARNING_TYPE     = 0x0002,
	EVENTLOG_INFORMATION_TYPE = 0x0004,
	EVENTLOG_AUDIT_SUCCESS    = 0x0008,
	EVENTLOG_AUDIT_FAILURE    = 0x0010,
}

enum {
	EVENTLOG_START_PAIRED_EVENT    = 0x0001,
	EVENTLOG_END_PAIRED_EVENT      = 0x0002,
	EVENTLOG_END_ALL_PAIRED_EVENTS = 0x0004,
	EVENTLOG_PAIRED_EVENT_ACTIVE   = 0x0008,
	EVENTLOG_PAIRED_EVENT_INACTIVE = 0x0010,
}

struct EVENTLOGRECORD {
	DWORD Length;
	DWORD Reserved;
	DWORD RecordNumber;
	DWORD TimeGenerated;
	DWORD TimeWritten;
	DWORD EventID;
	WORD EventType;
	WORD NumStrings;
	WORD EventCategory;
	WORD ReservedFlags;
	DWORD ClosingRecordNumber;
	DWORD StringOffset;
	DWORD UserSidLength;
	DWORD UserSidOffset;
	DWORD DataLength;
	DWORD DataOffset;
	// WCHAR[] SourceName;
	// WCHAR[] Computername;
	// SID UserSid;
	// WCHAR[] Strings;
	// BYTE[] Data;
	// CHAR[] Pad;
	// DWORD Length;
}
alias EVENTLOGRECORD* PEVENTLOGRECORD;

enum MAXLOGICALLOGNAMESIZE = 256;

version(all){ // _MSC_EXTENSIONS
	struct EVENTSFORLOGFILE {
		DWORD ulSize;
		WCHAR[MAXLOGICALLOGNAMESIZE] szLogicalLogFile;
		DWORD ulNumRecords;
		EVENTLOGRECORD[1]  pEventLogRecords;
	}

	struct PACKEDEVENTINFO {
		DWORD ulSize;
		DWORD ulNumEventsForLogFile;
		DWORD[1] ulOffsets;
	}
}else{
	struct EVENTSFORLOGFILE {
	}
	struct PACKEDEVENTINFO {
	}
}
alias EVENTSFORLOGFILE* PEVENTSFORLOGFILE;
alias PACKEDEVENTINFO* PPACKEDEVENTINFO;

enum {
	KEY_QUERY_VALUE        = 0x0001,
	KEY_SET_VALUE          = 0x0002,
	KEY_CREATE_SUB_KEY     = 0x0004,
	KEY_ENUMERATE_SUB_KEYS = 0x0008,
	KEY_NOTIFY             = 0x0010,
	KEY_CREATE_LINK        = 0x0020,
	KEY_WOW64_32KEY        = 0x0200,
	KEY_WOW64_64KEY        = 0x0100,
	KEY_WOW64_RES          = 0x0300,
	KEY_READ               = (STANDARD_RIGHTS_READ | KEY_QUERY_VALUE | KEY_ENUMERATE_SUB_KEYS | KEY_NOTIFY) & (~SYNCHRONIZE),
	KEY_WRITE              = (STANDARD_RIGHTS_WRITE | KEY_SET_VALUE | KEY_CREATE_SUB_KEY) & (~SYNCHRONIZE),
	KEY_EXECUTE            = (KEY_READ) & (~SYNCHRONIZE),
	KEY_ALL_ACCESS         = (STANDARD_RIGHTS_ALL | KEY_QUERY_VALUE | KEY_SET_VALUE | KEY_CREATE_SUB_KEY | KEY_ENUMERATE_SUB_KEYS | KEY_NOTIFY | KEY_CREATE_LINK) & (~SYNCHRONIZE),
}

enum {
	REG_OPTION_RESERVED       = 0x00000000,
	REG_OPTION_NON_VOLATILE   = 0x00000000,
	REG_OPTION_VOLATILE       = 0x00000001,
	REG_OPTION_CREATE_LINK    = 0x00000002,
	REG_OPTION_BACKUP_RESTORE = 0x00000004,
	REG_OPTION_OPEN_LINK      = 0x00000008,
	REG_LEGAL_OPTION          = REG_OPTION_RESERVED | REG_OPTION_NON_VOLATILE | REG_OPTION_VOLATILE | REG_OPTION_CREATE_LINK | REG_OPTION_BACKUP_RESTORE | REG_OPTION_OPEN_LINK,
	REG_OPEN_LEGAL_OPTION     = REG_OPTION_RESERVED | REG_OPTION_BACKUP_RESTORE | REG_OPTION_OPEN_LINK,
}

enum {
	REG_CREATED_NEW_KEY     = 0x00000001,
	REG_OPENED_EXISTING_KEY = 0x00000002,
}

enum {
	REG_STANDARD_FORMAT = 1,
	REG_LATEST_FORMAT   = 2,
	REG_NO_COMPRESSION  = 4,
}

enum {
	REG_WHOLE_HIVE_VOLATILE    = 0x00000001,
	REG_REFRESH_HIVE           = 0x00000002,
	REG_NO_LAZY_FLUSH          = 0x00000004,
	REG_FORCE_RESTORE          = 0x00000008,
	REG_APP_HIVE               = 0x00000010,
	REG_PROCESS_PRIVATE        = 0x00000020,
	REG_START_JOURNAL          = 0x00000040,
	REG_HIVE_EXACT_FILE_GROWTH = 0x00000080,
	REG_HIVE_NO_RM             = 0x00000100,
	REG_HIVE_SINGLE_LOG        = 0x00000200,
	REG_BOOT_HIVE              = 0x00000400,
}

enum REG_FORCE_UNLOAD = 1;

enum {
	REG_NOTIFY_CHANGE_NAME       = 0x00000001,
	REG_NOTIFY_CHANGE_ATTRIBUTES = 0x00000002,
	REG_NOTIFY_CHANGE_LAST_SET   = 0x00000004,
	REG_NOTIFY_CHANGE_SECURITY   = 0x00000008,
	REG_LEGAL_CHANGE_FILTER      = REG_NOTIFY_CHANGE_NAME | REG_NOTIFY_CHANGE_ATTRIBUTES | REG_NOTIFY_CHANGE_LAST_SET | REG_NOTIFY_CHANGE_SECURITY,
}

enum {
	REG_NONE                       = 0,
	REG_SZ                         = 1,
	REG_EXPAND_SZ                  = 2,
	REG_BINARY                     = 3,
	REG_DWORD                      = 4,
	REG_DWORD_LITTLE_ENDIAN        = 4,
	REG_DWORD_BIG_ENDIAN           = 5,
	REG_LINK                       = 6,
	REG_MULTI_SZ                   = 7,
	REG_RESOURCE_LIST              = 8,
	REG_FULL_RESOURCE_DESCRIPTOR   = 9,
	REG_RESOURCE_REQUIREMENTS_LIST = 10,
	REG_QWORD                      = 11,
	REG_QWORD_LITTLE_ENDIAN        = 11,
}

enum {
	SERVICE_KERNEL_DRIVER       = 0x00000001,
	SERVICE_FILE_SYSTEM_DRIVER  = 0x00000002,
	SERVICE_ADAPTER             = 0x00000004,
	SERVICE_RECOGNIZER_DRIVER   = 0x00000008,
	SERVICE_DRIVER              = SERVICE_KERNEL_DRIVER | SERVICE_FILE_SYSTEM_DRIVER | SERVICE_RECOGNIZER_DRIVER,
	SERVICE_WIN32_OWN_PROCESS   = 0x00000010,
	SERVICE_WIN32_SHARE_PROCESS = 0x00000020,
	SERVICE_WIN32               = SERVICE_WIN32_OWN_PROCESS | SERVICE_WIN32_SHARE_PROCESS,
	SERVICE_INTERACTIVE_PROCESS = 0x00000100,
	SERVICE_TYPE_ALL            = SERVICE_WIN32 | SERVICE_ADAPTER | SERVICE_DRIVER | SERVICE_INTERACTIVE_PROCESS,
}

enum {
	SERVICE_BOOT_START   = 0x00000000,
	SERVICE_SYSTEM_START = 0x00000001,
	SERVICE_AUTO_START   = 0x00000002,
	SERVICE_DEMAND_START = 0x00000003,
	SERVICE_DISABLED     = 0x00000004,
}

enum {
	SERVICE_ERROR_IGNORE   = 0x00000000,
	SERVICE_ERROR_NORMAL   = 0x00000001,
	SERVICE_ERROR_SEVERE   = 0x00000002,
	SERVICE_ERROR_CRITICAL = 0x00000003,
}

enum {
	DriverType               = SERVICE_KERNEL_DRIVER,
	FileSystemType           = SERVICE_FILE_SYSTEM_DRIVER,
	Win32ServiceOwnProcess   = SERVICE_WIN32_OWN_PROCESS,
	Win32ServiceShareProcess = SERVICE_WIN32_SHARE_PROCESS,
	AdapterType              = SERVICE_ADAPTER,
	RecognizerType           = SERVICE_RECOGNIZER_DRIVER
}
alias int SERVICE_NODE_TYPE;

enum {
	BootLoad    = SERVICE_BOOT_START,
	SystemLoad  = SERVICE_SYSTEM_START,
	AutoLoad    = SERVICE_AUTO_START,
	DemandLoad  = SERVICE_DEMAND_START,
	DisableLoad = SERVICE_DISABLED
}
alias int SERVICE_LOAD_TYPE;

enum {
	IgnoreError   = SERVICE_ERROR_IGNORE,
	NormalError   = SERVICE_ERROR_NORMAL,
	SevereError   = SERVICE_ERROR_SEVERE,
	CriticalError = SERVICE_ERROR_CRITICAL
}
alias int SERVICE_ERROR_TYPE;

enum {
	CM_SERVICE_NETWORK_BOOT_LOAD      = 0x00000001,
	CM_SERVICE_VIRTUAL_DISK_BOOT_LOAD = 0x00000002,
	CM_SERVICE_USB_DISK_BOOT_LOAD     = 0x00000004,
	CM_SERVICE_VALID_PROMOTION_MASK   = CM_SERVICE_NETWORK_BOOT_LOAD | CM_SERVICE_VIRTUAL_DISK_BOOT_LOAD | CM_SERVICE_USB_DISK_BOOT_LOAD,
}

enum {
	TAPE_ERASE_SHORT = 0,
	TAPE_ERASE_LONG  = 1,
}

struct TAPE_ERASE {
	DWORD Type;
	BOOLEAN Immediate;
}
alias TAPE_ERASE* PTAPE_ERASE;

enum {
	TAPE_LOAD    = 0,
	TAPE_UNLOAD  = 1,
	TAPE_TENSION = 2,
	TAPE_LOCK    = 3,
	TAPE_UNLOCK  = 4,
	TAPE_FORMAT  = 5,
}

struct TAPE_PREPARE {
	DWORD Operation;
	BOOLEAN Immediate;
}
alias TAPE_PREPARE* PTAPE_PREPARE;

enum {
	TAPE_SETMARKS        = 0,
	TAPE_FILEMARKS       = 1,
	TAPE_SHORT_FILEMARKS = 2,
	TAPE_LONG_FILEMARKS  = 3,
}
struct TAPE_WRITE_MARKS {
	DWORD Type;
	DWORD Count;
	BOOLEAN Immediate;
}
alias TAPE_WRITE_MARKS* PTAPE_WRITE_MARKS;

enum {
	TAPE_ABSOLUTE_POSITION       = 0,
	TAPE_LOGICAL_POSITION        = 1,
	TAPE_PSEUDO_LOGICAL_POSITION = 2,
}

struct TAPE_GET_POSITION {
	DWORD Type;
	DWORD Partition;
	LARGE_INTEGER Offset;
}
alias TAPE_GET_POSITION* PTAPE_GET_POSITION;

enum {
	TAPE_REWIND                = 0,
	TAPE_ABSOLUTE_BLOCK        = 1,
	TAPE_LOGICAL_BLOCK         = 2,
	TAPE_PSEUDO_LOGICAL_BLOCK  = 3,
	TAPE_SPACE_END_OF_DATA     = 4,
	TAPE_SPACE_RELATIVE_BLOCKS = 5,
	TAPE_SPACE_FILEMARKS       = 6,
	TAPE_SPACE_SEQUENTIAL_FMKS = 7,
	TAPE_SPACE_SETMARKS        = 8,
	TAPE_SPACE_SEQUENTIAL_SMKS = 9,
}

struct TAPE_SET_POSITION {
	DWORD Method;
	DWORD Partition;
	LARGE_INTEGER Offset;
	BOOLEAN Immediate;
}
alias TAPE_SET_POSITION* PTAPE_SET_POSITION;

enum {
	TAPE_DRIVE_FIXED            = 0x00000001,
	TAPE_DRIVE_SELECT           = 0x00000002,
	TAPE_DRIVE_INITIATOR        = 0x00000004,
	TAPE_DRIVE_ERASE_SHORT      = 0x00000010,
	TAPE_DRIVE_ERASE_LONG       = 0x00000020,
	TAPE_DRIVE_ERASE_BOP_ONLY   = 0x00000040,
	TAPE_DRIVE_ERASE_IMMEDIATE  = 0x00000080,
	TAPE_DRIVE_TAPE_CAPACITY    = 0x00000100,
	TAPE_DRIVE_TAPE_REMAINING   = 0x00000200,
	TAPE_DRIVE_FIXED_BLOCK      = 0x00000400,
	TAPE_DRIVE_VARIABLE_BLOCK   = 0x00000800,
	TAPE_DRIVE_WRITE_PROTECT    = 0x00001000,
	TAPE_DRIVE_EOT_WZ_SIZE      = 0x00002000,
	TAPE_DRIVE_ECC              = 0x00010000,
	TAPE_DRIVE_COMPRESSION      = 0x00020000,
	TAPE_DRIVE_PADDING          = 0x00040000,
	TAPE_DRIVE_REPORT_SMKS      = 0x00080000,
	TAPE_DRIVE_GET_ABSOLUTE_BLK = 0x00100000,
	TAPE_DRIVE_GET_LOGICAL_BLK  = 0x00200000,
	TAPE_DRIVE_SET_EOT_WZ_SIZE  = 0x00400000,
	TAPE_DRIVE_EJECT_MEDIA      = 0x01000000,
	TAPE_DRIVE_CLEAN_REQUESTS   = 0x02000000,
	TAPE_DRIVE_SET_CMP_BOP_ONLY = 0x04000000,
	TAPE_DRIVE_RESERVED_BIT     = 0x80000000,
	TAPE_DRIVE_LOAD_UNLOAD      = 0x80000001,
	TAPE_DRIVE_TENSION          = 0x80000002,
	TAPE_DRIVE_LOCK_UNLOCK      = 0x80000004,
	TAPE_DRIVE_REWIND_IMMEDIATE = 0x80000008,
	TAPE_DRIVE_SET_BLOCK_SIZE   = 0x80000010,
	TAPE_DRIVE_LOAD_UNLD_IMMED  = 0x80000020,
	TAPE_DRIVE_TENSION_IMMED    = 0x80000040,
	TAPE_DRIVE_LOCK_UNLK_IMMED  = 0x80000080,
	TAPE_DRIVE_SET_ECC          = 0x80000100,
	TAPE_DRIVE_SET_COMPRESSION  = 0x80000200,
	TAPE_DRIVE_SET_PADDING      = 0x80000400,
	TAPE_DRIVE_SET_REPORT_SMKS  = 0x80000800,
	TAPE_DRIVE_ABSOLUTE_BLK     = 0x80001000,
	TAPE_DRIVE_ABS_BLK_IMMED    = 0x80002000,
	TAPE_DRIVE_LOGICAL_BLK      = 0x80004000,
	TAPE_DRIVE_LOG_BLK_IMMED    = 0x80008000,
	TAPE_DRIVE_END_OF_DATA      = 0x80010000,
	TAPE_DRIVE_RELATIVE_BLKS    = 0x80020000,
	TAPE_DRIVE_FILEMARKS        = 0x80040000,
	TAPE_DRIVE_SEQUENTIAL_FMKS  = 0x80080000,
	TAPE_DRIVE_SETMARKS         = 0x80100000,
	TAPE_DRIVE_SEQUENTIAL_SMKS  = 0x80200000,
	TAPE_DRIVE_REVERSE_POSITION = 0x80400000,
	TAPE_DRIVE_SPACE_IMMEDIATE  = 0x80800000,
	TAPE_DRIVE_WRITE_SETMARKS   = 0x81000000,
	TAPE_DRIVE_WRITE_FILEMARKS  = 0x82000000,
	TAPE_DRIVE_WRITE_SHORT_FMKS = 0x84000000,
	TAPE_DRIVE_WRITE_LONG_FMKS  = 0x88000000,
	TAPE_DRIVE_WRITE_MARK_IMMED = 0x90000000,
	TAPE_DRIVE_FORMAT           = 0xA0000000,
	TAPE_DRIVE_FORMAT_IMMEDIATE = 0xC0000000,
	TAPE_DRIVE_HIGH_FEATURES    = 0x80000000,
}

struct TAPE_GET_DRIVE_PARAMETERS {
	BOOLEAN ECC;
	BOOLEAN Compression;
	BOOLEAN DataPadding;
	BOOLEAN ReportSetmarks;
	DWORD DefaultBlockSize;
	DWORD MaximumBlockSize;
	DWORD MinimumBlockSize;
	DWORD MaximumPartitionCount;
	DWORD FeaturesLow;
	DWORD FeaturesHigh;
	DWORD EOTWarningZoneSize;
}
alias TAPE_GET_DRIVE_PARAMETERS* PTAPE_GET_DRIVE_PARAMETERS;

struct TAPE_SET_DRIVE_PARAMETERS {
	BOOLEAN ECC;
	BOOLEAN Compression;
	BOOLEAN DataPadding;
	BOOLEAN ReportSetmarks;
	DWORD EOTWarningZoneSize;
}
alias TAPE_SET_DRIVE_PARAMETERS* PTAPE_SET_DRIVE_PARAMETERS;

struct TAPE_GET_MEDIA_PARAMETERS {
	LARGE_INTEGER Capacity;
	LARGE_INTEGER Remaining;
	DWORD BlockSize;
	DWORD PartitionCount;
	BOOLEAN WriteProtected;
}
alias TAPE_GET_MEDIA_PARAMETERS* PTAPE_GET_MEDIA_PARAMETERS;

struct TAPE_SET_MEDIA_PARAMETERS {
	DWORD BlockSize;
}
alias TAPE_SET_MEDIA_PARAMETERS* PTAPE_SET_MEDIA_PARAMETERS;

enum {
	TAPE_FIXED_PARTITIONS     = 0,
	TAPE_SELECT_PARTITIONS    = 1,
	TAPE_INITIATOR_PARTITIONS = 2,
}

struct TAPE_CREATE_PARTITION {
	DWORD Method;
	DWORD Count;
	DWORD Size;
}
alias TAPE_CREATE_PARTITION* PTAPE_CREATE_PARTITION;

enum {
	TAPE_QUERY_DRIVE_PARAMETERS  = 0,
	TAPE_QUERY_MEDIA_CAPACITY    = 1,
	TAPE_CHECK_FOR_DRIVE_PROBLEM = 2,
	TAPE_QUERY_IO_ERROR_DATA     = 3,
	TAPE_QUERY_DEVICE_ERROR_DATA = 4,
}

struct TAPE_WMI_OPERATIONS {
	DWORD Method;
	DWORD DataBufferSize;
	PVOID DataBuffer;
}
alias TAPE_WMI_OPERATIONS* PTAPE_WMI_OPERATIONS;

enum {
	TapeDriveProblemNone,
	TapeDriveReadWriteWarning,
	TapeDriveReadWriteError,
	TapeDriveReadWarning,
	TapeDriveWriteWarning,
	TapeDriveReadError,
	TapeDriveWriteError,
	TapeDriveHardwareError,
	TapeDriveUnsupportedMedia,
	TapeDriveScsiConnectionError,
	TapeDriveTimetoClean,
	TapeDriveCleanDriveNow,
	TapeDriveMediaLifeExpired,
	TapeDriveSnappedTape
}
alias int TAPE_DRIVE_PROBLEM_TYPE;

extern(C){
	enum {
		TRANSACTIONMANAGER_QUERY_INFORMATION = 0x0001,
		TRANSACTIONMANAGER_SET_INFORMATION   = 0x0002,
		TRANSACTIONMANAGER_RECOVER           = 0x0004,
		TRANSACTIONMANAGER_RENAME            = 0x0008,
		TRANSACTIONMANAGER_CREATE_RM         = 0x0010,
		TRANSACTIONMANAGER_BIND_TRANSACTION  = 0x0020,
		TRANSACTIONMANAGER_GENERIC_READ      = STANDARD_RIGHTS_READ |TRANSACTIONMANAGER_QUERY_INFORMATION,
		TRANSACTIONMANAGER_GENERIC_WRITE     = STANDARD_RIGHTS_WRITE | TRANSACTIONMANAGER_SET_INFORMATION | TRANSACTIONMANAGER_RECOVER |TRANSACTIONMANAGER_RENAME | TRANSACTIONMANAGER_CREATE_RM,
		TRANSACTIONMANAGER_GENERIC_EXECUTE   = STANDARD_RIGHTS_EXECUTE,
		TRANSACTIONMANAGER_ALL_ACCESS        = STANDARD_RIGHTS_REQUIRED | TRANSACTIONMANAGER_GENERIC_READ | TRANSACTIONMANAGER_GENERIC_WRITE | TRANSACTIONMANAGER_GENERIC_EXECUTE | TRANSACTIONMANAGER_BIND_TRANSACTION,
	}

	enum {
		TRANSACTION_QUERY_INFORMATION       = 0x0001,
		TRANSACTION_SET_INFORMATION         = 0x0002,
		TRANSACTION_ENLIST                  = 0x0004,
		TRANSACTION_COMMIT                  = 0x0008,
		TRANSACTION_ROLLBACK                = 0x0010,
		TRANSACTION_PROPAGATE               = 0x0020,
		TRANSACTION_RIGHT_RESERVED1         = 0x0040,
		TRANSACTION_GENERIC_READ            = STANDARD_RIGHTS_READ | TRANSACTION_QUERY_INFORMATION | SYNCHRONIZE,
		TRANSACTION_GENERIC_WRITE           = STANDARD_RIGHTS_WRITE | TRANSACTION_SET_INFORMATION | TRANSACTION_COMMIT | TRANSACTION_ENLIST | TRANSACTION_ROLLBACK | TRANSACTION_PROPAGATE | SYNCHRONIZE,
		TRANSACTION_GENERIC_EXECUTE         = STANDARD_RIGHTS_EXECUTE | TRANSACTION_COMMIT | TRANSACTION_ROLLBACK | SYNCHRONIZE,
		TRANSACTION_ALL_ACCESS              = STANDARD_RIGHTS_REQUIRED | TRANSACTION_GENERIC_READ | TRANSACTION_GENERIC_WRITE | TRANSACTION_GENERIC_EXECUTE,
		TRANSACTION_RESOURCE_MANAGER_RIGHTS = TRANSACTION_GENERIC_READ | STANDARD_RIGHTS_WRITE | TRANSACTION_SET_INFORMATION | TRANSACTION_ENLIST | TRANSACTION_ROLLBACK | TRANSACTION_PROPAGATE | SYNCHRONIZE,
	}

	enum {
		RESOURCEMANAGER_QUERY_INFORMATION    = 0x0001,
		RESOURCEMANAGER_SET_INFORMATION      = 0x0002,
		RESOURCEMANAGER_RECOVER              = 0x0004,
		RESOURCEMANAGER_ENLIST               = 0x0008,
		RESOURCEMANAGER_GET_NOTIFICATION     = 0x0010,
		RESOURCEMANAGER_REGISTER_PROTOCOL    = 0x0020,
		RESOURCEMANAGER_COMPLETE_PROPAGATION = 0x0040,
		RESOURCEMANAGER_GENERIC_READ         = STANDARD_RIGHTS_READ | RESOURCEMANAGER_QUERY_INFORMATION | SYNCHRONIZE,
		RESOURCEMANAGER_GENERIC_WRITE        = STANDARD_RIGHTS_WRITE | RESOURCEMANAGER_SET_INFORMATION | RESOURCEMANAGER_RECOVER | RESOURCEMANAGER_ENLIST | RESOURCEMANAGER_GET_NOTIFICATION | RESOURCEMANAGER_REGISTER_PROTOCOL | RESOURCEMANAGER_COMPLETE_PROPAGATION | SYNCHRONIZE,
		RESOURCEMANAGER_GENERIC_EXECUTE      = STANDARD_RIGHTS_EXECUTE | RESOURCEMANAGER_RECOVER | RESOURCEMANAGER_ENLIST | RESOURCEMANAGER_GET_NOTIFICATION | RESOURCEMANAGER_COMPLETE_PROPAGATION | SYNCHRONIZE,
		RESOURCEMANAGER_ALL_ACCESS           = STANDARD_RIGHTS_REQUIRED | RESOURCEMANAGER_GENERIC_READ | RESOURCEMANAGER_GENERIC_WRITE | RESOURCEMANAGER_GENERIC_EXECUTE,
	}

	enum {
		ENLISTMENT_QUERY_INFORMATION  = 0x0001,
		ENLISTMENT_SET_INFORMATION    = 0x0002,
		ENLISTMENT_RECOVER            = 0x0004,
		ENLISTMENT_SUBORDINATE_RIGHTS = 0x0008,
		ENLISTMENT_SUPERIOR_RIGHTS    = 0x0010,
		ENLISTMENT_GENERIC_READ       = STANDARD_RIGHTS_READ | ENLISTMENT_QUERY_INFORMATION,
		ENLISTMENT_GENERIC_WRITE      = STANDARD_RIGHTS_WRITE | ENLISTMENT_SET_INFORMATION | ENLISTMENT_RECOVER | ENLISTMENT_SUBORDINATE_RIGHTS | ENLISTMENT_SUPERIOR_RIGHTS,
		ENLISTMENT_GENERIC_EXECUTE    = STANDARD_RIGHTS_EXECUTE | ENLISTMENT_RECOVER | ENLISTMENT_SUBORDINATE_RIGHTS  | ENLISTMENT_SUPERIOR_RIGHTS,
		ENLISTMENT_ALL_ACCESS         = STANDARD_RIGHTS_REQUIRED | ENLISTMENT_GENERIC_READ | ENLISTMENT_GENERIC_WRITE | ENLISTMENT_GENERIC_EXECUTE,
	}

	enum {
		TransactionOutcomeUndetermined = 1,
		TransactionOutcomeCommitted,
		TransactionOutcomeAborted,
	}
	alias int TRANSACTION_OUTCOME;

	enum {
		TransactionStateNormal = 1,
		TransactionStateIndoubt,
		TransactionStateCommittedNotify,
	}
	alias int TRANSACTION_STATE;

	struct TRANSACTION_BASIC_INFORMATION {
		GUID TransactionId;
		DWORD State;
		DWORD Outcome;
	}
	alias TRANSACTION_BASIC_INFORMATION* PTRANSACTION_BASIC_INFORMATION;

	struct TRANSACTIONMANAGER_BASIC_INFORMATION {
		GUID TmIdentity;
		LARGE_INTEGER VirtualClock;
	}
	alias TRANSACTIONMANAGER_BASIC_INFORMATION* PTRANSACTIONMANAGER_BASIC_INFORMATION;

	struct TRANSACTIONMANAGER_LOG_INFORMATION {
		GUID  LogIdentity;
	}
	alias TRANSACTIONMANAGER_LOG_INFORMATION* PTRANSACTIONMANAGER_LOG_INFORMATION;

	struct TRANSACTIONMANAGER_LOGPATH_INFORMATION {
		DWORD LogPathLength;
		WCHAR[1] LogPath;
	}
	alias TRANSACTIONMANAGER_LOGPATH_INFORMATION* PTRANSACTIONMANAGER_LOGPATH_INFORMATION;

	struct TRANSACTIONMANAGER_RECOVERY_INFORMATION {
		ULONGLONG  LastRecoveredLsn;
	}
	alias TRANSACTIONMANAGER_RECOVERY_INFORMATION* PTRANSACTIONMANAGER_RECOVERY_INFORMATION;

	struct TRANSACTIONMANAGER_OLDEST_INFORMATION {
		GUID OldestTransactionGuid;
	}
	alias TRANSACTIONMANAGER_OLDEST_INFORMATION* PTRANSACTIONMANAGER_OLDEST_INFORMATION;

	struct TRANSACTION_PROPERTIES_INFORMATION {
		DWORD IsolationLevel;
		DWORD IsolationFlags;
		LARGE_INTEGER Timeout;
		DWORD Outcome;
		DWORD DescriptionLength;
		WCHAR[1] Description;
	}
	alias TRANSACTION_PROPERTIES_INFORMATION* PTRANSACTION_PROPERTIES_INFORMATION;

	struct TRANSACTION_BIND_INFORMATION {
		HANDLE TmHandle;
	}
	alias TRANSACTION_BIND_INFORMATION* PTRANSACTION_BIND_INFORMATION;

	struct TRANSACTION_ENLISTMENT_PAIR {
		GUID EnlistmentId;
		GUID ResourceManagerId;
	}
	alias TRANSACTION_ENLISTMENT_PAIR* PTRANSACTION_ENLISTMENT_PAIR;

	struct TRANSACTION_ENLISTMENTS_INFORMATION {
		DWORD NumberOfEnlistments;
		TRANSACTION_ENLISTMENT_PAIR[1] EnlistmentPair;
	}
	alias TRANSACTION_ENLISTMENTS_INFORMATION* PTRANSACTION_ENLISTMENTS_INFORMATION;

	struct TRANSACTION_SUPERIOR_ENLISTMENT_INFORMATION {
		TRANSACTION_ENLISTMENT_PAIR SuperiorEnlistmentPair;
	}
	alias TRANSACTION_SUPERIOR_ENLISTMENT_INFORMATION* PTRANSACTION_SUPERIOR_ENLISTMENT_INFORMATION;

	struct RESOURCEMANAGER_BASIC_INFORMATION {
		GUID ResourceManagerId;
		DWORD DescriptionLength;
		WCHAR[1] Description;
	}
	alias RESOURCEMANAGER_BASIC_INFORMATION* PRESOURCEMANAGER_BASIC_INFORMATION;

	struct RESOURCEMANAGER_COMPLETION_INFORMATION {
		HANDLE IoCompletionPortHandle;
		ULONG_PTR CompletionKey;
	}
	alias RESOURCEMANAGER_COMPLETION_INFORMATION* PRESOURCEMANAGER_COMPLETION_INFORMATION;

	enum {
		TransactionBasicInformation,
		TransactionPropertiesInformation,
		TransactionEnlistmentInformation,
		TransactionSuperiorEnlistmentInformation,
		TransactionBindInformation,
		TransactionDTCPrivateInformation,
	}
	alias int TRANSACTION_INFORMATION_CLASS;

	enum {
		TransactionManagerBasicInformation,
		TransactionManagerLogInformation,
		TransactionManagerLogPathInformation,
		TransactionManagerRecoveryInformation = 4,
		TransactionManagerOnlineProbeInformation = 3,
		TransactionManagerOldestTransactionInformation = 5
	}
	alias int TRANSACTIONMANAGER_INFORMATION_CLASS;

	enum {
		ResourceManagerBasicInformation,
		ResourceManagerCompletionInformation,
	}
	alias int RESOURCEMANAGER_INFORMATION_CLASS;

	struct ENLISTMENT_BASIC_INFORMATION {
		GUID EnlistmentId;
		GUID TransactionId;
		GUID ResourceManagerId;
	}
	alias ENLISTMENT_BASIC_INFORMATION* PENLISTMENT_BASIC_INFORMATION;

	struct ENLISTMENT_CRM_INFORMATION {
		GUID CrmTransactionManagerId;
		GUID CrmResourceManagerId;
		GUID CrmEnlistmentId;
	}
	alias ENLISTMENT_CRM_INFORMATION* PENLISTMENT_CRM_INFORMATION;

	enum {
		EnlistmentBasicInformation,
		EnlistmentRecoveryInformation,
		EnlistmentCrmInformation
	}
	alias int ENLISTMENT_INFORMATION_CLASS;

	struct TRANSACTION_LIST_ENTRY {
		UOW uow;
	}
	alias TRANSACTION_LIST_ENTRY* PTRANSACTION_LIST_ENTRY;

	struct TRANSACTION_LIST_INFORMATION {
		DWORD NumberOfTransactions;
		TRANSACTION_LIST_ENTRY[1] TransactionInformation;
	}
	alias TRANSACTION_LIST_INFORMATION* PTRANSACTION_LIST_INFORMATION;

	enum {
		KTMOBJECT_TRANSACTION,
		KTMOBJECT_TRANSACTION_MANAGER,
		KTMOBJECT_RESOURCE_MANAGER,
		KTMOBJECT_ENLISTMENT,
		KTMOBJECT_INVALID
	}
	alias int KTMOBJECT_TYPE;
	alias KTMOBJECT_TYPE* PKTMOBJECT_TYPE;

	struct KTMOBJECT_CURSOR {
		GUID LastQuery;
		DWORD ObjectIdCount;
		GUID[1] ObjectIds;
	}
	alias KTMOBJECT_CURSOR* PKTMOBJECT_CURSOR;
}


alias DWORD TP_VERSION;
alias TP_VERSION* PTP_VERSION; 

struct TP_CALLBACK_INSTANCE {
}
alias TP_CALLBACK_INSTANCE* PTP_CALLBACK_INSTANCE;

alias extern(Windows) VOID function(PTP_CALLBACK_INSTANCE Instance, PVOID Context) PTP_SIMPLE_CALLBACK;

struct TP_POOL {
}
alias TP_POOL* PTP_POOL; 

enum {
	TP_CALLBACK_PRIORITY_HIGH,
	TP_CALLBACK_PRIORITY_NORMAL,
	TP_CALLBACK_PRIORITY_LOW,
	TP_CALLBACK_PRIORITY_INVALID
}
alias int TP_CALLBACK_PRIORITY;

struct TP_POOL_STACK_INFORMATION {
	SIZE_T StackReserve;
	SIZE_T StackCommit;
}
alias TP_POOL_STACK_INFORMATION* PTP_POOL_STACK_INFORMATION;

struct TP_CLEANUP_GROUP {
}
alias TP_CLEANUP_GROUP* PTP_CLEANUP_GROUP;

alias extern(Windows) VOID function(PVOID ObjectContext, PVOID CleanupContext) PTP_CLEANUP_GROUP_CANCEL_CALLBACK;

//(_WIN32_WINNT >= _WIN32_WINNT_WIN7)
	struct TP_CALLBACK_ENVIRON_V3 {
		TP_VERSION Version;
		PTP_POOL Pool;
		PTP_CLEANUP_GROUP CleanupGroup;
		PTP_CLEANUP_GROUP_CANCEL_CALLBACK CleanupGroupCancelCallback;
		PVOID RaceDll;
		ACTIVATION_CONTEXT* ActivationContext;
		PTP_SIMPLE_CALLBACK FinalizationCallback;
		union {
			DWORD Flags;
			DWORD LongFunction1Persistent1Private30;
		}
		TP_CALLBACK_PRIORITY CallbackPriority;
		DWORD Size;
	}
	alias TP_CALLBACK_ENVIRON_V3 TP_CALLBACK_ENVIRON;
	alias TP_CALLBACK_ENVIRON_V3* PTP_CALLBACK_ENVIRON;
/*}else{
	struct TP_CALLBACK_ENVIRON_V1 {
		TP_VERSION Version;
		PTP_POOL Pool;
		PTP_CLEANUP_GROUP CleanupGroup;
		PTP_CLEANUP_GROUP_CANCEL_CALLBACK CleanupGroupCancelCallback;
		PVOID RaceDll;
		ACTIVATION_CONTEXT* ActivationContext;
		PTP_SIMPLE_CALLBACK FinalizationCallback;
		union {
			DWORD Flags;
			DWORD LongFunction1Persistent1Private30;
		}
	}
	alias TP_CALLBACK_ENVIRON_V1 TP_CALLBACK_ENVIRON;
	alias TP_CALLBACK_ENVIRON_V1* PTP_CALLBACK_ENVIRON;
}*/

VOID TpInitializeCallbackEnviron(PTP_CALLBACK_ENVIRON CallbackEnviron)
{

	static if(_WIN32_WINNT >= _WIN32_WINNT_WIN7)
		CallbackEnviron.Version = 3;
	else
		CallbackEnviron.Version = 1;

	CallbackEnviron.Pool = null;
	CallbackEnviron.CleanupGroup = null;
	CallbackEnviron.CleanupGroupCancelCallback = null;
	CallbackEnviron.RaceDll = null;
	CallbackEnviron.ActivationContext = null;
	CallbackEnviron.FinalizationCallback = null;
	CallbackEnviron.Flags = 0;

	static if(_WIN32_WINNT >= _WIN32_WINNT_WIN7){
		CallbackEnviron.CallbackPriority = TP_CALLBACK_PRIORITY_NORMAL;
		CallbackEnviron.Size = TP_CALLBACK_ENVIRON.sizeof;
	}
}

VOID TpSetCallbackThreadpool(PTP_CALLBACK_ENVIRON CallbackEnviron, PTP_POOL Pool)
{
	CallbackEnviron.Pool = Pool;
}

VOID TpSetCallbackCleanupGroup(PTP_CALLBACK_ENVIRON CallbackEnviron, PTP_CLEANUP_GROUP CleanupGroup, PTP_CLEANUP_GROUP_CANCEL_CALLBACK CleanupGroupCancelCallback)
{
	CallbackEnviron.CleanupGroup = CleanupGroup;
	CallbackEnviron.CleanupGroupCancelCallback = CleanupGroupCancelCallback;
}

VOID TpSetCallbackActivationContext(PTP_CALLBACK_ENVIRON CallbackEnviron, ACTIVATION_CONTEXT* ActivationContext)
{
	CallbackEnviron.ActivationContext = ActivationContext;
}

VOID TpSetCallbackNoActivationContext(PTP_CALLBACK_ENVIRON CallbackEnviron)
{
	CallbackEnviron.ActivationContext = cast(ACTIVATION_CONTEXT*)cast(LONG_PTR)-1;
}

VOID TpSetCallbackLongFunction(PTP_CALLBACK_ENVIRON CallbackEnviron)
{
	//CallbackEnviron.LongFunction = 1;
	CallbackEnviron.LongFunction1Persistent1Private30 |= 0x80000000;
}

VOID TpSetCallbackRaceWithDll(PTP_CALLBACK_ENVIRON CallbackEnviron, PVOID DllHandle)
{
	CallbackEnviron.RaceDll = DllHandle;
}

VOID TpSetCallbackFinalizationCallback(PTP_CALLBACK_ENVIRON CallbackEnviron, PTP_SIMPLE_CALLBACK  FinalizationCallback)
{
	CallbackEnviron.FinalizationCallback = FinalizationCallback;
}

static if(_WIN32_WINNT >= _WIN32_WINNT_WIN7){
	VOID TpSetCallbackPriority(PTP_CALLBACK_ENVIRON CallbackEnviron, TP_CALLBACK_PRIORITY Priority)
	{
		CallbackEnviron.CallbackPriority = Priority;
	}
}

VOID TpSetCallbackPersistent(PTP_CALLBACK_ENVIRON CallbackEnviron)
{
	//CallbackEnviron.Persistent = 1;
	CallbackEnviron.LongFunction1Persistent1Private30 |= 0x40000000;
}

VOID TpDestroyCallbackEnviron(PTP_CALLBACK_ENVIRON CallbackEnviron)
{
}

struct TP_WORK {
}
alias TP_WORK* PTP_WORK;

alias extern(Windows) VOID function(PTP_CALLBACK_INSTANCE Instance, PVOID Context, PTP_WORK Work) PTP_WORK_CALLBACK;

struct TP_TIMER {
}
alias TP_TIMER* PTP_TIMER;

alias extern(Windows) VOID function(PTP_CALLBACK_INSTANCE Instance, PVOID Context, PTP_TIMER Timer) PTP_TIMER_CALLBACK;

alias DWORD TP_WAIT_RESULT;
struct TP_WAIT {
}
alias TP_WAIT* PTP_WAIT;

alias extern(Windows) VOID function(PTP_CALLBACK_INSTANCE Instance, PVOID Context, PTP_WAIT Wait, TP_WAIT_RESULT WaitResult) PTP_WAIT_CALLBACK;

struct TP_IO {
}
alias TP_IO* PTP_IO;

version(X86_64){
	TEB* NtCurrentTeb()
	{
		return cast(TEB*)__readgsqword(NT_TIB.Self.offsetof);
	}

	PVOID GetCurrentFiber()
	{
		return cast(PVOID)__readgsqword(NT_TIB.FiberData.offsetof);
	}

	PVOID GetFiberData()
	{
		return *cast(PVOID*)GetCurrentFiber();
	}
}else{

	enum PcTeb = 0x18;

	TEB* NtCurrentTeb()
	{
		return cast(TEB*)cast(ULONG_PTR)__readfsdword(PcTeb);
	}
}

enum {
	ACTIVATION_CONTEXT_SECTION_ASSEMBLY_INFORMATION         = 1,
	ACTIVATION_CONTEXT_SECTION_DLL_REDIRECTION              = 2,
	ACTIVATION_CONTEXT_SECTION_WINDOW_CLASS_REDIRECTION     = 3,
	ACTIVATION_CONTEXT_SECTION_COM_SERVER_REDIRECTION       = 4,
	ACTIVATION_CONTEXT_SECTION_COM_INTERFACE_REDIRECTION    = 5,
	ACTIVATION_CONTEXT_SECTION_COM_TYPE_LIBRARY_REDIRECTION = 6,
	ACTIVATION_CONTEXT_SECTION_COM_PROGID_REDIRECTION       = 7,
	ACTIVATION_CONTEXT_SECTION_GLOBAL_OBJECT_RENAME_TABLE   = 8,
	ACTIVATION_CONTEXT_SECTION_CLR_SURROGATES               = 9,
	ACTIVATION_CONTEXT_SECTION_APPLICATION_SETTINGS         = 10,
	ACTIVATION_CONTEXT_SECTION_COMPATIBILITY_INFO           = 11,
}

} // extern(C)
