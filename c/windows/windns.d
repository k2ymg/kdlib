/** windns.d

Converted from 'windns.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.windns;


import c.windows.sdkddkver;
import c.windows.windef;
import c.windows.in6addr;
import c.windows.ws2def;


extern(C){

//alias ulong QWORD;
//alias QWORD* PQWORD; to windef

alias LONG DNS_STATUS;
alias DNS_STATUS* PDNS_STATUS;

alias DWORD IP4_ADDRESS;
alias IP4_ADDRESS* PIP4_ADDRESS;

enum {
	SIZEOF_IP4_ADDRESS               = 4,
	IP4_ADDRESS_STRING_LENGTH        = 16,
	IP4_ADDRESS_STRING_BUFFER_LENGTH = 16,
}

struct IP4_ARRAY {
	DWORD AddrCount;
	IP4_ADDRESS[1] AddrArray;
}
alias IP4_ARRAY* PIP4_ARRAY;

union IP6_ADDRESS {
	version(Win64)
		QWORD[2] IP6Qword;

	DWORD[4] IP6Dword;
	WORD[8] IP6Word;
	BYTE[16] IP6Byte;
	IN6_ADDR In6;
}
alias IP6_ADDRESS* PIP6_ADDRESS;

enum {
	IP6_ADDRESS_STRING_LENGTH        = 65,
	IP6_ADDRESS_STRING_BUFFER_LENGTH = 65,
	DNS_ADDRESS_STRING_LENGTH        = IP6_ADDRESS_STRING_LENGTH,
}

/*
	INLINE_WORD_FLIP(out, in)  {  WORD _in = (in);  (out) = (_in << 8) | (_in >> 8);  }
	INLINE_HTONS(out, in) INLINE_WORD_FLIP(out, in)
	INLINE_NTOHS(out, in) INLINE_WORD_FLIP(out, in)
	INLINE_DWORD_FLIP(out, in)  {  DWORD _in = (in);  (out) = ((_in << 8) & 0x00ff0000) |  (_in << 24) |  ((_in >> 8) & 0x0000ff00) |  (_in >> 24);  }
	INLINE_NTOHL(out, in) INLINE_DWORD_FLIP(out, in)
	INLINE_HTONL(out, in) INLINE_DWORD_FLIP(out, in)
	INLINE_WRITE_FLIPPED_WORD( pout, in )  INLINE_WORD_FLIP( *((UNALIGNED WORD *)(pout)), in )
	INLINE_WRITE_FLIPPED_DWORD( pout, in )  INLINE_DWORD_FLIP( *((UNALIGNED DWORD *)(pout)), in )
*/

enum {
	DNS_PORT_HOST_ORDER           = 0x0035,
	DNS_PORT_NET_ORDER            = 0x3500,
	DNS_RFC_MAX_UDP_PACKET_LENGTH = 512,
	DNS_MAX_NAME_LENGTH           = 255,
	DNS_MAX_LABEL_LENGTH          = 63,
	DNS_MAX_NAME_BUFFER_LENGTH    = 256,
	DNS_MAX_LABEL_BUFFER_LENGTH   = 64,
}

const char* DNS_IP4_REVERSE_DOMAIN_STRING_A = "in-addr.arpa.";
const wchar* DNS_IP4_REVERSE_DOMAIN_STRING_W = "in-addr.arpa.";

enum DNS_MAX_IP4_REVERSE_NAME_LENGTH = IP4_ADDRESS_STRING_LENGTH + 15;

const char* DNS_IP6_REVERSE_DOMAIN_STRING_A = "ip6.arpa.";
const wchar* DNS_IP6_REVERSE_DOMAIN_STRING_W = "ip6.arpa.";

enum DNS_MAX_IP6_REVERSE_NAME_LENGTH = 75;
enum DNS_MAX_REVERSE_NAME_LENGTH = DNS_MAX_IP6_REVERSE_NAME_LENGTH;

version(UNICODE){
	alias DNS_IP4_REVERSE_DOMAIN_STRING_W DNS_IP4_REVERSE_DOMAIN_STRING;
	alias DNS_IP6_REVERSE_DOMAIN_STRING_W DNS_IP6_REVERSE_DOMAIN_STRING;
}else{
	alias DNS_IP4_REVERSE_DOMAIN_STRING_A DNS_IP4_REVERSE_DOMAIN_STRING;
	alias DNS_IP6_REVERSE_DOMAIN_STRING_A DNS_IP6_REVERSE_DOMAIN_STRING;
}
enum DNS_MAX_IP4_REVERSE_NAME_BUFFER_LENGTH = DNS_MAX_IP4_REVERSE_NAME_LENGTH;
enum DNS_MAX_IP6_REVERSE_NAME_BUFFER_LENGTH = DNS_MAX_IP6_REVERSE_NAME_LENGTH;
enum DNS_MAX_REVERSE_NAME_BUFFER_LENGTH = DNS_MAX_REVERSE_NAME_LENGTH;
enum DNS_MAX_TEXT_STRING_LENGTH = 255;

align(1){

	struct DNS_HEADER {
		WORD Xid;
		BYTE RecursionDesired1Truncation1Authoritative1Opcode4IsResponse1;
		BYTE ResponseCode4CheckingDisabled1AuthenticatedData1Reserved1RecursionAvailable1;
		WORD QuestionCount;
		WORD AnswerCount;
		WORD NameServerCount;
		WORD AdditionalCount;
	}
	alias DNS_HEADER* PDNS_HEADER;

	struct DNS_HEADER_EXT {
		WORD Reserved15DnssecOk1;
		BYTE chRcode;
		BYTE chVersion;
	}
	alias DNS_HEADER_EXT* PDNS_HEADER_EXT;

	//	DNS_HEADER_FLAGS(pHead) ( *((PWORD)(pHead)+1) )
	//	DNS_BYTE_FLIP_HEADER_COUNTS(pHeader)  {  PDNS_HEADER _head = (pHeader);  INLINE_HTONS(_head->Xid, _head->Xid );  INLINE_HTONS(_head->QuestionCount, _head->QuestionCount );  INLINE_HTONS(_head->AnswerCount, _head->AnswerCount );  INLINE_HTONS(_head->NameServerCount,_head->NameServerCount );  INLINE_HTONS(_head->AdditionalCount,_head->AdditionalCount );  }
	//	DNS_OFFSET_TO_QUESTION_NAME sizeof(DNS_HEADER)
	//	DNS_COMPRESSED_QUESTION_NAME (0xC00C)
	//	DNS_QUESTION_NAME_FROM_HEADER( _pHeader_ )  ( (PCHAR)( (PDNS_HEADER)(_pHeader_) + 1 ) )
	//	DNS_ANSWER_FROM_QUESTION( _pQuestion_ )  ( (PCHAR)( (PDNS_QUESTION)(_pQuestion_) + 1 ) )

	struct DNS_WIRE_QUESTION {
		WORD QuestionType;
		WORD QuestionClass;
	}
	alias DNS_WIRE_QUESTION* PDNS_WIRE_QUESTION;

	struct DNS_WIRE_RECORD {
		WORD RecordType;
		WORD RecordClass;
		DWORD TimeToLive;
		WORD DataLength;
	}
	alias DNS_WIRE_RECORD* PDNS_WIRE_RECORD;
}

enum {
	DNS_OPCODE_QUERY         = 0,
	DNS_OPCODE_IQUERY        = 1,
	DNS_OPCODE_SERVER_STATUS = 2,
	DNS_OPCODE_UNKNOWN       = 3,
	DNS_OPCODE_NOTIFY        = 4,
	DNS_OPCODE_UPDATE        = 5,
}
enum {
	DNS_RCODE_NOERROR         = 0,
	DNS_RCODE_FORMERR         = 1,
	DNS_RCODE_SERVFAIL        = 2,
	DNS_RCODE_NXDOMAIN        = 3,
	DNS_RCODE_NOTIMPL         = 4,
	DNS_RCODE_REFUSED         = 5,
	DNS_RCODE_YXDOMAIN        = 6,
	DNS_RCODE_YXRRSET         = 7,
	DNS_RCODE_NXRRSET         = 8,
	DNS_RCODE_NOTAUTH         = 9,
	DNS_RCODE_NOTZONE         = 10,
	DNS_RCODE_MAX             = 15,
	DNS_RCODE_BADVERS         = 16,
	DNS_RCODE_BADSIG          = 16,
	DNS_RCODE_BADKEY          = 17,
	DNS_RCODE_BADTIME         = 18,
	DNS_RCODE_NO_ERROR        = DNS_RCODE_NOERROR,
	DNS_RCODE_FORMAT_ERROR    = DNS_RCODE_FORMERR,
	DNS_RCODE_SERVER_FAILURE  = DNS_RCODE_SERVFAIL,
	DNS_RCODE_NAME_ERROR      = DNS_RCODE_NXDOMAIN,
	DNS_RCODE_NOT_IMPLEMENTED = DNS_RCODE_NOTIMPL,
}
enum {
	DNS_CLASS_INTERNET  = 0x0001,
	DNS_CLASS_CSNET     = 0x0002,
	DNS_CLASS_CHAOS     = 0x0003,
	DNS_CLASS_HESIOD    = 0x0004,
	DNS_CLASS_NONE      = 0x00fe,
	DNS_CLASS_ALL       = 0x00ff,
	DNS_CLASS_ANY       = 0x00ff,
	DNS_RCLASS_INTERNET = 0x0100,
	DNS_RCLASS_CSNET    = 0x0200,
	DNS_RCLASS_CHAOS    = 0x0300,
	DNS_RCLASS_HESIOD   = 0x0400,
	DNS_RCLASS_NONE     = 0xfe00,
	DNS_RCLASS_ALL      = 0xff00,
	DNS_RCLASS_ANY      = 0xff00,
}
enum {
	DNS_TYPE_ZERO     = 0x0000,
	DNS_TYPE_A        = 0x0001,
	DNS_TYPE_NS       = 0x0002,
	DNS_TYPE_MD       = 0x0003,
	DNS_TYPE_MF       = 0x0004,
	DNS_TYPE_CNAME    = 0x0005,
	DNS_TYPE_SOA      = 0x0006,
	DNS_TYPE_MB       = 0x0007,
	DNS_TYPE_MG       = 0x0008,
	DNS_TYPE_MR       = 0x0009,
	DNS_TYPE_NULL     = 0x000a,
	DNS_TYPE_WKS      = 0x000b,
	DNS_TYPE_PTR      = 0x000c,
	DNS_TYPE_HINFO    = 0x000d,
	DNS_TYPE_MINFO    = 0x000e,
	DNS_TYPE_MX       = 0x000f,
	DNS_TYPE_TEXT     = 0x0010,
	DNS_TYPE_RP       = 0x0011,
	DNS_TYPE_AFSDB    = 0x0012,
	DNS_TYPE_X25      = 0x0013,
	DNS_TYPE_ISDN     = 0x0014,
	DNS_TYPE_RT       = 0x0015,
	DNS_TYPE_NSAP     = 0x0016,
	DNS_TYPE_NSAPPTR  = 0x0017,
	DNS_TYPE_SIG      = 0x0018,
	DNS_TYPE_KEY      = 0x0019,
	DNS_TYPE_PX       = 0x001a,
	DNS_TYPE_GPOS     = 0x001b,
	DNS_TYPE_AAAA     = 0x001c,
	DNS_TYPE_LOC      = 0x001d,
	DNS_TYPE_NXT      = 0x001e,
	DNS_TYPE_EID      = 0x001f,
	DNS_TYPE_NIMLOC   = 0x0020,
	DNS_TYPE_SRV      = 0x0021,
	DNS_TYPE_ATMA     = 0x0022,
	DNS_TYPE_NAPTR    = 0x0023,
	DNS_TYPE_KX       = 0x0024,
	DNS_TYPE_CERT     = 0x0025,
	DNS_TYPE_A6       = 0x0026,
	DNS_TYPE_DNAME    = 0x0027,
	DNS_TYPE_SINK     = 0x0028,
	DNS_TYPE_OPT      = 0x0029,
	DNS_TYPE_DS       = 0x002b,
	DNS_TYPE_RRSIG    = 0x002e,
	DNS_TYPE_NSEC     = 0x002f,
	DNS_TYPE_DNSKEY   = 0x0030,
	DNS_TYPE_DHCID    = 0x0031,
	DNS_TYPE_UINFO    = 0x0064,
	DNS_TYPE_UID      = 0x0065,
	DNS_TYPE_GID      = 0x0066,
	DNS_TYPE_UNSPEC   = 0x0067,
	DNS_TYPE_ADDRS    = 0x00f8,
	DNS_TYPE_TKEY     = 0x00f9,
	DNS_TYPE_TSIG     = 0x00fa,
	DNS_TYPE_IXFR     = 0x00fb,
	DNS_TYPE_AXFR     = 0x00fc,
	DNS_TYPE_MAILB    = 0x00fd,
	DNS_TYPE_MAILA    = 0x00fe,
	DNS_TYPE_ALL      = 0x00ff,
	DNS_TYPE_ANY      = 0x00ff,
	DNS_TYPE_WINS     = 0xff01,
	DNS_TYPE_WINSR    = 0xff02,
	DNS_TYPE_NBSTAT   = DNS_TYPE_WINSR,
	DNS_RTYPE_A       = 0x0100,
	DNS_RTYPE_NS      = 0x0200,
	DNS_RTYPE_MD      = 0x0300,
	DNS_RTYPE_MF      = 0x0400,
	DNS_RTYPE_CNAME   = 0x0500,
	DNS_RTYPE_SOA     = 0x0600,
	DNS_RTYPE_MB      = 0x0700,
	DNS_RTYPE_MG      = 0x0800,
	DNS_RTYPE_MR      = 0x0900,
	DNS_RTYPE_NULL    = 0x0a00,
	DNS_RTYPE_WKS     = 0x0b00,
	DNS_RTYPE_PTR     = 0x0c00,
	DNS_RTYPE_HINFO   = 0x0d00,
	DNS_RTYPE_MINFO   = 0x0e00,
	DNS_RTYPE_MX      = 0x0f00,
	DNS_RTYPE_TEXT    = 0x1000,
	DNS_RTYPE_RP      = 0x1100,
	DNS_RTYPE_AFSDB   = 0x1200,
	DNS_RTYPE_X25     = 0x1300,
	DNS_RTYPE_ISDN    = 0x1400,
	DNS_RTYPE_RT      = 0x1500,
	DNS_RTYPE_NSAP    = 0x1600,
	DNS_RTYPE_NSAPPTR = 0x1700,
	DNS_RTYPE_SIG     = 0x1800,
	DNS_RTYPE_KEY     = 0x1900,
	DNS_RTYPE_PX      = 0x1a00,
	DNS_RTYPE_GPOS    = 0x1b00,
	DNS_RTYPE_AAAA    = 0x1c00,
	DNS_RTYPE_LOC     = 0x1d00,
	DNS_RTYPE_NXT     = 0x1e00,
	DNS_RTYPE_EID     = 0x1f00,
	DNS_RTYPE_NIMLOC  = 0x2000,
	DNS_RTYPE_SRV     = 0x2100,
	DNS_RTYPE_ATMA    = 0x2200,
	DNS_RTYPE_NAPTR   = 0x2300,
	DNS_RTYPE_KX      = 0x2400,
	DNS_RTYPE_CERT    = 0x2500,
	DNS_RTYPE_A6      = 0x2600,
	DNS_RTYPE_DNAME   = 0x2700,
	DNS_RTYPE_SINK    = 0x2800,
	DNS_RTYPE_OPT     = 0x2900,
	DNS_RTYPE_DS      = 0x2b00,
	DNS_RTYPE_RRSIG   = 0x2e00,
	DNS_RTYPE_NSEC    = 0x2f00,
	DNS_RTYPE_DNSKEY  = 0x3000,
	DNS_RTYPE_DHCID   = 0x3100,
	DNS_RTYPE_UINFO   = 0x6400,
	DNS_RTYPE_UID     = 0x6500,
	DNS_RTYPE_GID     = 0x6600,
	DNS_RTYPE_UNSPEC  = 0x6700,
	DNS_RTYPE_TKEY    = 0xf900,
	DNS_RTYPE_TSIG    = 0xfa00,
	DNS_RTYPE_IXFR    = 0xfb00,
	DNS_RTYPE_AXFR    = 0xfc00,
	DNS_RTYPE_MAILB   = 0xfd00,
	DNS_RTYPE_MAILA   = 0xfe00,
	DNS_RTYPE_ALL     = 0xff00,
	DNS_RTYPE_ANY     = 0xff00,
	DNS_RTYPE_WINS    = 0x01ff,
	DNS_RTYPE_WINSR   = 0x02ff,
}
enum {
	DNS_ATMA_FORMAT_E164       = 1,
	DNS_ATMA_FORMAT_AESA       = 2,
	DNS_ATMA_MAX_ADDR_LENGTH   = 20,
	DNS_ATMA_AESA_ADDR_LENGTH  = 20,
	DNS_ATMA_MAX_RECORD_LENGTH = DNS_ATMA_MAX_ADDR_LENGTH+1,
}
enum {
	DNSSEC_ALGORITHM_RSAMD5  = 1,
	DNSSEC_ALGORITHM_RSASHA1 = 5,
	DNSSEC_ALGORITHM_NULL    = 253,
	DNSSEC_ALGORITHM_PRIVATE = 254,
}
enum {
	DNSSEC_PROTOCOL_NONE   = 0,
	DNSSEC_PROTOCOL_TLS    = 1,
	DNSSEC_PROTOCOL_EMAIL  = 2,
	DNSSEC_PROTOCOL_DNSSEC = 3,
	DNSSEC_PROTOCOL_IPSEC  = 4,
}
enum {
	DNSSEC_KEY_FLAG_NOAUTH = 0x0001,
	DNSSEC_KEY_FLAG_NOCONF = 0x0002,
	DNSSEC_KEY_FLAG_FLAG2  = 0x0004,
	DNSSEC_KEY_FLAG_EXTEND = 0x0008,
	DNSSEC_KEY_FLAG_FLAG4  = 0x0010,
	DNSSEC_KEY_FLAG_FLAG5  = 0x0020,
	DNSSEC_KEY_FLAG_USER   = 0x0000,
	DNSSEC_KEY_FLAG_ZONE   = 0x0040,
	DNSSEC_KEY_FLAG_HOST   = 0x0080,
	DNSSEC_KEY_FLAG_NTPE3  = 0x00c0,
	DNSSEC_KEY_FLAG_FLAG8  = 0x0100,
	DNSSEC_KEY_FLAG_FLAG9  = 0x0200,
	DNSSEC_KEY_FLAG_FLAG10 = 0x0400,
	DNSSEC_KEY_FLAG_FLAG11 = 0x0800,
	DNSSEC_KEY_FLAG_SIG0   = 0x0000,
	DNSSEC_KEY_FLAG_SIG1   = 0x1000,
	DNSSEC_KEY_FLAG_SIG2   = 0x2000,
	DNSSEC_KEY_FLAG_SIG3   = 0x3000,
	DNSSEC_KEY_FLAG_SIG4   = 0x4000,
	DNSSEC_KEY_FLAG_SIG5   = 0x5000,
	DNSSEC_KEY_FLAG_SIG6   = 0x6000,
	DNSSEC_KEY_FLAG_SIG7   = 0x7000,
	DNSSEC_KEY_FLAG_SIG8   = 0x8000,
	DNSSEC_KEY_FLAG_SIG9   = 0x9000,
	DNSSEC_KEY_FLAG_SIG10  = 0xa000,
	DNSSEC_KEY_FLAG_SIG11  = 0xb000,
	DNSSEC_KEY_FLAG_SIG12  = 0xc000,
	DNSSEC_KEY_FLAG_SIG13  = 0xd000,
	DNSSEC_KEY_FLAG_SIG14  = 0xe000,
	DNSSEC_KEY_FLAG_SIG15  = 0xf000,
}
enum {
	DNS_TKEY_MODE_SERVER_ASSIGN   = 1,
	DNS_TKEY_MODE_DIFFIE_HELLMAN  = 2,
	DNS_TKEY_MODE_GSS             = 3,
	DNS_TKEY_MODE_RESOLVER_ASSIGN = 4,
}
enum {
	DNS_WINS_FLAG_SCOPE = 0x80000000,
	DNS_WINS_FLAG_LOCAL = 0x00010000,
}

//	IS_WORD_ALIGNED(p) ( !((UINT_PTR)(p) & (UINT_PTR)1) )
//	IS_DWORD_ALIGNED(p) ( !((UINT_PTR)(p) & (UINT_PTR)3) )
//	IS_QWORD_ALIGNED(p) ( !((UINT_PTR)(p) & (UINT_PTR)7) )

enum {
	DnsConfigPrimaryDomainName_W,
	DnsConfigPrimaryDomainName_A,
	DnsConfigPrimaryDomainName_UTF8,
	DnsConfigAdapterDomainName_W,
	DnsConfigAdapterDomainName_A,
	DnsConfigAdapterDomainName_UTF8,
	DnsConfigDnsServerList,
	DnsConfigSearchList,
	DnsConfigAdapterInfo,
	DnsConfigPrimaryHostNameRegistrationEnabled,
	DnsConfigAdapterHostNameRegistrationEnabled,
	DnsConfigAddressRegistrationMaxCount,
	DnsConfigHostName_W,
	DnsConfigHostName_A,
	DnsConfigHostName_UTF8,
	DnsConfigFullHostName_W,
	DnsConfigFullHostName_A,
	DnsConfigFullHostName_UTF8
}
alias int DNS_CONFIG_TYPE;

enum DNS_CONFIG_FLAG_ALLOC = 0x00000001;

export extern(Windows) DNS_STATUS DnsQueryConfig(DNS_CONFIG_TYPE Config, DWORD Flag, PCWSTR pwsAdapterName, PVOID pReserved, PVOID pBuffer, PDWORD pBufLen);

struct DNS_A_DATA {
	IP4_ADDRESS IpAddress;
}
alias DNS_A_DATA* PDNS_A_DATA;

struct DNS_PTR_DATAW {
	PWSTR pNameHost;
}
alias DNS_PTR_DATAW* PDNS_PTR_DATAW;

struct DNS_PTR_DATAA {
	PSTR pNameHost;
}
alias DNS_PTR_DATAA* PDNS_PTR_DATAA;

struct DNS_SOA_DATAW {
	PWSTR pNamePrimaryServer;
	PWSTR pNameAdministrator;
	DWORD dwSerialNo;
	DWORD dwRefresh;
	DWORD dwRetry;
	DWORD dwExpire;
	DWORD dwDefaultTtl;
}
alias DNS_SOA_DATAW* PDNS_SOA_DATAW;

struct DNS_SOA_DATAA {
	PSTR pNamePrimaryServer;
	PSTR pNameAdministrator;
	DWORD dwSerialNo;
	DWORD dwRefresh;
	DWORD dwRetry;
	DWORD dwExpire;
	DWORD dwDefaultTtl;
}
alias DNS_SOA_DATAA* PDNS_SOA_DATAA;

struct DNS_MINFO_DATAW {
	PWSTR pNameMailbox;
	PWSTR pNameErrorsMailbox;
}
alias DNS_MINFO_DATAW* PDNS_MINFO_DATAW;

struct DNS_MINFO_DATAA {
	PSTR pNameMailbox;
	PSTR pNameErrorsMailbox;
}
alias DNS_MINFO_DATAA* PDNS_MINFO_DATAA;

struct DNS_MX_DATAW {
	PWSTR pNameExchange;
	WORD wPreference;
	WORD Pad;
}
alias DNS_MX_DATAW* PDNS_MX_DATAW;

struct DNS_MX_DATAA {
	PSTR pNameExchange;
	WORD wPreference;
	WORD Pad;
}
alias DNS_MX_DATAA* PDNS_MX_DATAA;

struct DNS_TXT_DATAW {
	DWORD dwStringCount;
	PWSTR[1] pStringArray;
}
alias DNS_TXT_DATAW* PDNS_TXT_DATAW;

struct DNS_TXT_DATAA {
	DWORD dwStringCount;
	PSTR[1] pStringArray;
}
alias DNS_TXT_DATAA* PDNS_TXT_DATAA;

struct DNS_NULL_DATA {
	DWORD dwByteCount;
	BYTE[1] Data;
}
alias DNS_NULL_DATA* PDNS_NULL_DATA;

struct DNS_WKS_DATA {
	IP4_ADDRESS IpAddress;
	UCHAR chProtocol;
	BYTE[1] BitMask;
}
alias DNS_WKS_DATA* PDNS_WKS_DATA;

struct DNS_AAAA_DATA {
	IP6_ADDRESS Ip6Address;
}
alias DNS_AAAA_DATA* PDNS_AAAA_DATA;

struct DNS_SIG_DATAW {
	WORD wTypeCovered;
	BYTE chAlgorithm;
	BYTE chLabelCount;
	DWORD dwOriginalTtl;
	DWORD dwExpiration;
	DWORD dwTimeSigned;
	WORD wKeyTag;
	WORD wSignatureLength;
	PWSTR pNameSigner;
	BYTE[1] Signature;
}
alias DNS_SIG_DATAW* PDNS_SIG_DATAW;
alias DNS_SIG_DATAW DNS_RRSIG_DATAW;
alias DNS_SIG_DATAW* PDNS_RRSIG_DATAW;

struct DNS_SIG_DATAA {
	WORD wTypeCovered;
	BYTE chAlgorithm;
	BYTE chLabelCount;
	DWORD dwOriginalTtl;
	DWORD dwExpiration;
	DWORD dwTimeSigned;
	WORD wKeyTag;
	WORD wSignatureLength;
	PSTR pNameSigner;
	BYTE[1] Signature;
}
alias DNS_SIG_DATAA* PDNS_SIG_DATAA;
alias DNS_SIG_DATAA DNS_RRSIG_DATAA;
alias DNS_SIG_DATAA* PDNS_RRSIG_DATAA;

struct DNS_KEY_DATA {
	WORD wFlags;
	BYTE chProtocol;
	BYTE chAlgorithm;
	WORD wKeyLength;
	WORD wPad;
	BYTE[1] Key;
}
alias DNS_KEY_DATA* PDNS_KEY_DATA;
alias DNS_KEY_DATA DNS_DNSKEY_DATA;
alias DNS_KEY_DATA* PDNS_DNSKEY_DATA;

struct DNS_DHCID_DATA {
	DWORD dwByteCount;
	BYTE[1] DHCID;
}
alias DNS_DHCID_DATA* PDNS_DHCID_DATA;

struct DNS_NSEC_DATAW {
	PWSTR pNextDomainName;
	WORD wTypeBitMapsLength;
	WORD wPad;
	BYTE[1] TypeBitMaps;
}
alias DNS_NSEC_DATAW* PDNS_NSEC_DATAW;

struct DNS_NSEC_DATAA {
	PSTR pNextDomainName;
	WORD wTypeBitMapsLength;
	WORD wPad;
	BYTE[1] TypeBitMaps;
}
alias DNS_NSEC_DATAA* PDNS_NSEC_DATAA;

struct DNS_DS_DATA {
	WORD wKeyTag;
	BYTE chAlgorithm;
	BYTE chDigestType;
	WORD wDigestLength;
	WORD wPad;
	BYTE[1] Digest;
}
alias DNS_DS_DATA* PDNS_DS_DATA;

struct DNS_OPT_DATA {
	WORD wDataLength;
	WORD wPad;
	BYTE[1] Data;
}
alias DNS_OPT_DATA* PDNS_OPT_DATA;

struct DNS_LOC_DATA {
	WORD wVersion;
	WORD wSize;
	WORD wHorPrec;
	WORD wVerPrec;
	DWORD dwLatitude;
	DWORD dwLongitude;
	DWORD dwAltitude;
}
alias DNS_LOC_DATA* PDNS_LOC_DATA;

struct DNS_NXT_DATAW {
	PWSTR pNameNext;
	WORD wNumTypes;
	WORD[1] wTypes;
}
alias DNS_NXT_DATAW* PDNS_NXT_DATAW;

struct DNS_NXT_DATAA {
	PSTR pNameNext;
	WORD wNumTypes;
	WORD[1] wTypes;
}
alias DNS_NXT_DATAA* PDNS_NXT_DATAA;

struct DNS_SRV_DATAW {
	PWSTR pNameTarget;
	WORD wPriority;
	WORD wWeight;
	WORD wPort;
	WORD Pad;
}
alias DNS_SRV_DATAW* PDNS_SRV_DATAW;

struct DNS_SRV_DATAA {
	PSTR pNameTarget;
	WORD wPriority;
	WORD wWeight;
	WORD wPort;
	WORD Pad;
}
alias DNS_SRV_DATAA* PDNS_SRV_DATAA;

struct DNS_NAPTR_DATAW {
	WORD wOrder;
	WORD wPreference;
	PWSTR pFlags;
	PWSTR pService;
	PWSTR pRegularExpression;
	PWSTR pReplacement;
}
alias DNS_NAPTR_DATAW* PDNS_NAPTR_DATAW;

struct DNS_NAPTR_DATAA {
	WORD wOrder;
	WORD wPreference;
	PSTR pFlags;
	PSTR pService;
	PSTR pRegularExpression;
	PSTR pReplacement;
}
alias DNS_NAPTR_DATAA* PDNS_NAPTR_DATAA;

struct DNS_ATMA_DATA {
	BYTE AddressType;
	BYTE[DNS_ATMA_MAX_ADDR_LENGTH] Address;

}
alias DNS_ATMA_DATA* PDNS_ATMA_DATA;

struct DNS_TKEY_DATAW {
	PWSTR pNameAlgorithm;
	PBYTE pAlgorithmPacket;
	PBYTE pKey;
	PBYTE pOtherData;
	DWORD dwCreateTime;
	DWORD dwExpireTime;
	WORD wMode;
	WORD wError;
	WORD wKeyLength;
	WORD wOtherLength;
	UCHAR cAlgNameLength;
	BOOL bPacketPointers;
}
alias DNS_TKEY_DATAW* PDNS_TKEY_DATAW;

struct DNS_TKEY_DATAA {
	PSTR pNameAlgorithm;
	PBYTE pAlgorithmPacket;
	PBYTE pKey;
	PBYTE pOtherData;
	DWORD dwCreateTime;
	DWORD dwExpireTime;
	WORD wMode;
	WORD wError;
	WORD wKeyLength;
	WORD wOtherLength;
	UCHAR cAlgNameLength;
	BOOL bPacketPointers;
}
alias DNS_TKEY_DATAA* PDNS_TKEY_DATAA;

struct DNS_TSIG_DATAW {
	PWSTR pNameAlgorithm;
	PBYTE pAlgorithmPacket;
	PBYTE pSignature;
	PBYTE pOtherData;
	LONGLONG i64CreateTime;
	WORD wFudgeTime;
	WORD wOriginalXid;
	WORD wError;
	WORD wSigLength;
	WORD wOtherLength;
	UCHAR cAlgNameLength;
	BOOL bPacketPointers;
}
alias DNS_TSIG_DATAW* PDNS_TSIG_DATAW;

struct DNS_TSIG_DATAA {
	PSTR pNameAlgorithm;
	PBYTE pAlgorithmPacket;
	PBYTE pSignature;
	PBYTE pOtherData;
	LONGLONG i64CreateTime;
	WORD wFudgeTime;
	WORD wOriginalXid;
	WORD wError;
	WORD wSigLength;
	WORD wOtherLength;
	UCHAR cAlgNameLength;
	BOOL bPacketPointers;
}
alias DNS_TSIG_DATAA* PDNS_TSIG_DATAA;

struct DNS_WINS_DATA {
	DWORD dwMappingFlag;
	DWORD dwLookupTimeout;
	DWORD dwCacheTimeout;
	DWORD cWinsServerCount;
	IP4_ADDRESS[1] WinsServers;
}
alias DNS_WINS_DATA* PDNS_WINS_DATA;

struct DNS_WINSR_DATAW {
	DWORD dwMappingFlag;
	DWORD dwLookupTimeout;
	DWORD dwCacheTimeout;
	PWSTR pNameResultDomain;
}
alias DNS_WINSR_DATAW* PDNS_WINSR_DATAW;

struct DNS_WINSR_DATAA {
	DWORD dwMappingFlag;
	DWORD dwLookupTimeout;
	DWORD dwCacheTimeout;
	PSTR pNameResultDomain;
}
alias DNS_WINSR_DATAA* PDNS_WINSR_DATAA;

version(UNICODE){
	alias DNS_PTR_DATAW DNS_PTR_DATA;
	alias DNS_PTR_DATAW* PDNS_PTR_DATA;
	alias DNS_SOA_DATAW DNS_SOA_DATA;
	alias DNS_SOA_DATAW* PDNS_SOA_DATA;
	alias DNS_MINFO_DATAW DNS_MINFO_DATA;
	alias DNS_MINFO_DATAW* PDNS_MINFO_DATA;
	alias DNS_MX_DATAW DNS_MX_DATA;
	alias DNS_MX_DATAW* PDNS_MX_DATA;
	alias DNS_TXT_DATAW DNS_TXT_DATA;
	alias DNS_TXT_DATAW* PDNS_TXT_DATA;
	alias DNS_SIG_DATAW DNS_SIG_DATA;
	alias DNS_SIG_DATAW* PDNS_SIG_DATA;
	alias DNS_NXT_DATAW DNS_NXT_DATA;
	alias DNS_NXT_DATAW* PDNS_NXT_DATA;
	alias DNS_SRV_DATAW DNS_SRV_DATA;
	alias DNS_SRV_DATAW* PDNS_SRV_DATA;
	alias DNS_NAPTR_DATAW DNS_NAPTR_DATA;
	alias DNS_NAPTR_DATAW* PDNS_NAPTR_DATA;
	alias DNS_RRSIG_DATAW DNS_RRSIG_DATA;
	alias DNS_RRSIG_DATAW* PDNS_RRSIG_DATA;
	alias DNS_NSEC_DATAW DNS_NSEC_DATA;
	alias DNS_NSEC_DATAW* PDNS_NSEC_DATA;
	alias DNS_TKEY_DATAW DNS_TKEY_DATA;
	alias DNS_TKEY_DATAW* PDNS_TKEY_DATA;
	alias DNS_TSIG_DATAW DNS_TSIG_DATA;
	alias DNS_TSIG_DATAW* PDNS_TSIG_DATA;
	alias DNS_WINSR_DATAW DNS_WINSR_DATA;
	alias DNS_WINSR_DATAW* PDNS_WINSR_DATA;
}else{
	alias DNS_PTR_DATAA DNS_PTR_DATA;
	alias DNS_PTR_DATAA* PDNS_PTR_DATA;
	alias DNS_SOA_DATAA DNS_SOA_DATA;
	alias DNS_SOA_DATAA* PDNS_SOA_DATA;
	alias DNS_MINFO_DATAA DNS_MINFO_DATA;
	alias DNS_MINFO_DATAA* PDNS_MINFO_DATA;
	alias DNS_MX_DATAA DNS_MX_DATA;
	alias DNS_MX_DATAA* PDNS_MX_DATA;
	alias DNS_TXT_DATAA DNS_TXT_DATA;
	alias DNS_TXT_DATAA* PDNS_TXT_DATA;
	alias DNS_SIG_DATAA DNS_SIG_DATA;
	alias DNS_SIG_DATAA* PDNS_SIG_DATA;
	alias DNS_NXT_DATAA DNS_NXT_DATA;
	alias DNS_NXT_DATAA* PDNS_NXT_DATA;
	alias DNS_SRV_DATAA DNS_SRV_DATA;
	alias DNS_SRV_DATAA* PDNS_SRV_DATA;
	alias DNS_NAPTR_DATAA DNS_NAPTR_DATA;
	alias DNS_NAPTR_DATAA* PDNS_NAPTR_DATA;
	alias DNS_RRSIG_DATAA DNS_RRSIG_DATA;
	alias DNS_RRSIG_DATAA* PDNS_RRSIG_DATA;
	alias DNS_NSEC_DATAA DNS_NSEC_DATA;
	alias DNS_NSEC_DATAA* PDNS_NSEC_DATA;
	alias DNS_TKEY_DATAA DNS_TKEY_DATA;
	alias DNS_TKEY_DATAA* PDNS_TKEY_DATA;
	alias DNS_TSIG_DATAA DNS_TSIG_DATA;
	alias DNS_TSIG_DATAA* PDNS_TSIG_DATA;
	alias DNS_WINSR_DATAA DNS_WINSR_DATA;
	alias DNS_WINSR_DATAA* PDNS_WINSR_DATA;
}

//	DNS_TEXT_RECORD_LENGTH(StringCount)  (FIELD_OFFSET(DNS_TXT_DATA, pStringArray) + ((StringCount) * sizeof(PCHAR)))
//	DNS_NULL_RECORD_LENGTH(ByteCount)  (FIELD_OFFSET(DNS_NULL_DATA, Data) + (ByteCount))
//	DNS_WKS_RECORD_LENGTH(ByteCount)  (FIELD_OFFSET(DNS_WKS_DATA, BitMask) + (ByteCount))
//	DNS_WINS_RECORD_LENGTH(IpCount)  (FIELD_OFFSET(DNS_WINS_DATA, WinsServers) + ((IpCount) * sizeof(IP4_ADDRESS)))
//	DNS_KEY_RECORD_LENGTH(ByteCount)  (FIELD_OFFSET(DNS_KEY_DATA, Key) + (ByteCount))
//	DNS_SIG_RECORD_LENGTH(ByteCount)  (FIELD_OFFSET(DNS_SIG_DATA, Signature) + (ByteCount))
//	DNS_NSEC_RECORD_LENGTH(ByteCount)  (FIELD_OFFSET(DNS_NSEC_DATA, TypeBitMaps) + (ByteCount))
//	DNS_DS_RECORD_LENGTH(ByteCount)  (FIELD_OFFSET(DNS_DS_DATA, Digest) + (ByteCount))
//	DNS_OPT_RECORD_LENGTH(ByteCount)  (FIELD_OFFSET(DNS_OPT_DATA, Data) + (ByteCount))
//	DNS_DHCID_RECORD_LENGTH(ByteCount)  (FIELD_OFFSET(DNS_DHCID_DATA, DHCID) + (ByteCount))

struct DNS_RECORD_FLAGS {
	DWORD Section2Delete1CharSet2Unused3Reserved24;
}

enum {
	DnsSectionQuestion,
	DnsSectionAnswer,
	DnsSectionAuthority,
	DnsSectionAddtional,
}
alias int DNS_SECTION;

enum {
	DnsSectionZone   = DnsSectionQuestion,
	DnsSectionPrereq = DnsSectionAnswer,
	DnsSectionUpdate = DnsSectionAuthority,
}
enum {
	DNSREC_SECTION    = 0x00000003,
	DNSREC_QUESTION   = 0x00000000,
	DNSREC_ANSWER     = 0x00000001,
	DNSREC_AUTHORITY  = 0x00000002,
	DNSREC_ADDITIONAL = 0x00000003,
	DNSREC_ZONE       = 0x00000000,
	DNSREC_PREREQ     = 0x00000001,
	DNSREC_UPDATE     = 0x00000002,
	DNSREC_DELETE     = 0x00000004,
	DNSREC_NOEXIST    = 0x00000004,
}


struct DNS_RECORDW {
	DNS_RECORDW* pNext;
	PWSTR pName;
	WORD wType;
	WORD wDataLength;
	union {
		DWORD DW;
		DNS_RECORD_FLAGS S;
	}
	DWORD dwTtl;
	DWORD dwReserved;
	union {
		DNS_A_DATA A;
		DNS_SOA_DATAW SOA;
		DNS_SOA_DATAW Soa;
		DNS_PTR_DATAW PTR;
		DNS_PTR_DATAW Ptr;
		DNS_PTR_DATAW NS;
		DNS_PTR_DATAW Ns;
		DNS_PTR_DATAW CNAME;
		DNS_PTR_DATAW Cname;
		DNS_PTR_DATAW DNAME;
		DNS_PTR_DATAW Dname;
		DNS_PTR_DATAW MB;
		DNS_PTR_DATAW Mb;
		DNS_PTR_DATAW MD;
		DNS_PTR_DATAW Md;
		DNS_PTR_DATAW MF;
		DNS_PTR_DATAW Mf;
		DNS_PTR_DATAW MG;
		DNS_PTR_DATAW Mg;
		DNS_PTR_DATAW MR;
		DNS_PTR_DATAW Mr;
		DNS_MINFO_DATAW MINFO;
		DNS_MINFO_DATAW Minfo;
		DNS_MINFO_DATAW RP;
		DNS_MINFO_DATAW Rp;
		DNS_MX_DATAW MX;
		DNS_MX_DATAW Mx;
		DNS_MX_DATAW AFSDB;
		DNS_MX_DATAW Afsdb;
		DNS_MX_DATAW RT;
		DNS_MX_DATAW Rt;
		DNS_TXT_DATAW HINFO;
		DNS_TXT_DATAW Hinfo;
		DNS_TXT_DATAW ISDN;
		DNS_TXT_DATAW Isdn;
		DNS_TXT_DATAW TXT;
		DNS_TXT_DATAW Txt;
		DNS_TXT_DATAW X25;
		DNS_NULL_DATA Null;
		DNS_WKS_DATA WKS;
		DNS_WKS_DATA Wks;
		DNS_AAAA_DATA AAAA;
		DNS_KEY_DATA KEY;
		DNS_KEY_DATA Key;
		DNS_SIG_DATAW SIG;
		DNS_SIG_DATAW Sig;
		DNS_ATMA_DATA ATMA;
		DNS_ATMA_DATA Atma;
		DNS_NXT_DATAW NXT;
		DNS_NXT_DATAW Nxt;
		DNS_SRV_DATAW SRV;
		DNS_SRV_DATAW Srv;
		DNS_NAPTR_DATAW NAPTR;
		DNS_NAPTR_DATAW Naptr;
		DNS_OPT_DATA OPT;
		DNS_OPT_DATA Opt;
		DNS_DS_DATA DS;
		DNS_DS_DATA Ds;
		DNS_RRSIG_DATAW RRSIG;
		DNS_RRSIG_DATAW Rrsig;
		DNS_NSEC_DATAW NSEC;
		DNS_NSEC_DATAW Nsec;
		DNS_DNSKEY_DATA DNSKEY;
		DNS_DNSKEY_DATA Dnskey;
		DNS_TKEY_DATAW TKEY;
		DNS_TKEY_DATAW Tkey;
		DNS_TSIG_DATAW TSIG;
		DNS_TSIG_DATAW Tsig;
		DNS_WINS_DATA WINS;
		DNS_WINS_DATA Wins;
		DNS_WINSR_DATAW WINSR;
		DNS_WINSR_DATAW WinsR;
		DNS_WINSR_DATAW NBSTAT;
		DNS_WINSR_DATAW Nbstat;
		DNS_DHCID_DATA DHCID;
	}
}
alias DNS_RECORDW* PDNS_RECORDW;

struct DNS_RECORD_OPTW {
	DNS_RECORD_OPTW* pNext;
	PWSTR pName;
	WORD wType;
	WORD wDataLength;
	union {
		DWORD DW;
		DNS_RECORD_FLAGS S;
	}
	DNS_HEADER_EXT ExtHeader;
	WORD wPayloadSize;
	WORD wReserved;
	union {
		DNS_OPT_DATA OPT, Opt;
	}
}
alias DNS_RECORD_OPTW* PDNS_RECORD_OPTW;

struct DNS_RECORDA {
	DNS_RECORDA* pNext;
	PSTR pName;
	WORD wType;
	WORD wDataLength;
	union {
		DWORD DW;
		DNS_RECORD_FLAGS S;
	}
	DWORD dwTtl;
	DWORD dwReserved;
	union {
		DNS_A_DATA A;
		DNS_SOA_DATAA SOA;
		DNS_SOA_DATAA Soa;
		DNS_PTR_DATAA PTR;
		DNS_PTR_DATAA Ptr;
		DNS_PTR_DATAA NS;
		DNS_PTR_DATAA Ns;
		DNS_PTR_DATAA CNAME;
		DNS_PTR_DATAA Cname;
		DNS_PTR_DATAA DNAME;
		DNS_PTR_DATAA Dname;
		DNS_PTR_DATAA MB;
		DNS_PTR_DATAA Mb;
		DNS_PTR_DATAA MD;
		DNS_PTR_DATAA Md;
		DNS_PTR_DATAA MF;
		DNS_PTR_DATAA Mf;
		DNS_PTR_DATAA MG;
		DNS_PTR_DATAA Mg;
		DNS_PTR_DATAA MR;
		DNS_PTR_DATAA Mr;
		DNS_MINFO_DATAA MINFO;
		DNS_MINFO_DATAA Minfo;
		DNS_MINFO_DATAA RP;
		DNS_MINFO_DATAA Rp;
		DNS_MX_DATAA MX;
		DNS_MX_DATAA Mx;
		DNS_MX_DATAA AFSDB;
		DNS_MX_DATAA Afsdb;
		DNS_MX_DATAA RT;
		DNS_MX_DATAA Rt;
		DNS_TXT_DATAA HINFO;
		DNS_TXT_DATAA Hinfo;
		DNS_TXT_DATAA ISDN;
		DNS_TXT_DATAA Isdn;
		DNS_TXT_DATAA TXT;
		DNS_TXT_DATAA Txt;
		DNS_TXT_DATAA X25;
		DNS_NULL_DATA Null;
		DNS_WKS_DATA WKS;
		DNS_WKS_DATA Wks;
		DNS_AAAA_DATA AAAA;
		DNS_KEY_DATA KEY;
		DNS_KEY_DATA Key;
		DNS_SIG_DATAA SIG;
		DNS_SIG_DATAA Sig;
		DNS_ATMA_DATA ATMA;
		DNS_ATMA_DATA Atma;
		DNS_NXT_DATAA NXT;
		DNS_NXT_DATAA Nxt;
		DNS_SRV_DATAA SRV;
		DNS_SRV_DATAA Srv;
		DNS_NAPTR_DATAA NAPTR;
		DNS_NAPTR_DATAA Naptr;
		DNS_OPT_DATA OPT;
		DNS_OPT_DATA Opt;
		DNS_DS_DATA DS;
		DNS_DS_DATA Ds;
		DNS_RRSIG_DATAA RRSIG;
		DNS_RRSIG_DATAA Rrsig;
		DNS_NSEC_DATAA NSEC;
		DNS_NSEC_DATAA Nsec;
		DNS_DNSKEY_DATA DNSKEY;
		DNS_DNSKEY_DATA Dnskey;
		DNS_TKEY_DATAA TKEY;
		DNS_TKEY_DATAA Tkey;
		DNS_TSIG_DATAA TSIG;
		DNS_TSIG_DATAA Tsig;
		DNS_WINS_DATA WINS;
		DNS_WINS_DATA Wins;
		DNS_WINSR_DATAA WINSR;
		DNS_WINSR_DATAA WinsR;
		DNS_WINSR_DATAA NBSTAT;
		DNS_WINSR_DATAA Nbstat;
		DNS_DHCID_DATA DHCID;
	}
}
alias DNS_RECORDA* PDNS_RECORDA;

struct DNS_RECORD_OPTA {
	DNS_RECORD_OPTA* pNext;
	PSTR pName;
	WORD wType;
	WORD wDataLength;
	union {
		DWORD DW;
		DNS_RECORD_FLAGS S;
	}
	DNS_HEADER_EXT ExtHeader;
	WORD wPayloadSize;
	WORD wReserved;
	union {
		DNS_OPT_DATA OPT;
		DNS_OPT_DATA Opt;
	}
}
alias DNS_RECORD_OPTA* PDNS_RECORD_OPTA;

version(UNICODE){
	alias DNS_RECORDW DNS_RECORD;
	alias DNS_RECORDW* PDNS_RECORD;
	alias DNS_RECORD_OPTW DNS_RECORD_OPT;
	alias DNS_RECORD_OPTW* PDNS_RECORD_OPT;
}else{
	alias DNS_RECORDA DNS_RECORD;
	alias DNS_RECORDA* PDNS_RECORD;
	alias DNS_RECORD_OPTA DNS_RECORD_OPT;
	alias DNS_RECORD_OPTA* PDNS_RECORD_OPT;
}


struct DNS_RRSET {
	PDNS_RECORD pFirstRR;
	PDNS_RECORD pLastRR;
}
alias DNS_RRSET* PDNS_RRSET;

//	DNS_RRSET_INIT( rrset )  {  PDNS_RRSET _prrset = &(rrset);  _prrset->pFirstRR = NULL;  _prrset->pLastRR = (PDNS_RECORD) &_prrset->pFirstRR;  }
//	DNS_RRSET_ADD( rrset, pnewRR )  {  PDNS_RRSET _prrset = &(rrset);  PDNS_RECORD _prrnew = (pnewRR);  _prrset->pLastRR->pNext = _prrnew;  _prrset->pLastRR = _prrnew;  }
//	DNS_RRSET_TERMINATE( rrset )  {  PDNS_RRSET _prrset = &(rrset);  _prrset->pLastRR->pNext = NULL;  }

alias extern(Windows) VOID function(void* completionContext, DNS_STATUS status) DNS_PROXY_COMPLETION_ROUTINE;

enum {
	DNS_PROXY_INFORMATION_DIRECT,
	DNS_PROXY_INFORMATION_DEFAULT_SETTINGS,
	DNS_PROXY_INFORMATION_PROXY_NAME,
	DNS_PROXY_INFORMATION_DOES_NOT_EXIST
}
alias int DNS_PROXY_INFORMATION_TYPE;

struct DNS_PROXY_INFORMATION {
	ULONG version_; //!
	DNS_PROXY_INFORMATION_TYPE proxyInformationType;
	PWSTR proxyName;
}

enum {
	DnsCharSetUnknown,
	DnsCharSetUnicode,
	DnsCharSetUtf8,
	DnsCharSetAnsi,
}
alias int DNS_CHARSET;

export extern(Windows) PDNS_RECORD DnsRecordCopyEx(PDNS_RECORD pRecord, DNS_CHARSET CharSetIn, DNS_CHARSET CharSetOut);
export extern(Windows) PDNS_RECORD DnsRecordSetCopyEx(PDNS_RECORD pRecordSet, DNS_CHARSET CharSetIn, DNS_CHARSET CharSetOut);
/*version(UNICODE){
	DnsRecordCopy(pRR) 	 DnsRecordCopyEx( (pRR), DnsCharSetUnicode, DnsCharSetUnicode )
	DnsRecordSetCopy(pRR) 	 DnsRecordSetCopyEx( (pRR), DnsCharSetUnicode, DnsCharSetUnicode )
}else{
	DnsRecordCopy(pRR) 	 DnsRecordCopyEx( (pRR), DnsCharSetAnsi, DnsCharSetAnsi )
	DnsRecordSetCopy(pRR) 	 DnsRecordSetCopyEx( (pRR), DnsCharSetAnsi, DnsCharSetAnsi )
}*/

export extern(Windows) BOOL DnsRecordCompare(PDNS_RECORD pRecord1, PDNS_RECORD pRecord2);
export extern(Windows) BOOL DnsRecordSetCompare(PDNS_RECORD pRR1, PDNS_RECORD pRR2, PDNS_RECORD* ppDiff1, PDNS_RECORD* ppDiff2);
export PDNS_RECORD DnsRecordSetDetach(PDNS_RECORD pRecordList);

enum {
	DnsFreeFlat = 0,
	DnsFreeRecordList,
	DnsFreeParsedMessageFields
}
alias int DNS_FREE_TYPE;
export extern(Windows) VOID DnsFree(PVOID pData, DNS_FREE_TYPE FreeType);

alias DnsFreeRecordList DnsFreeRecordListDeep;
static if(_WIN32_WINNT >= _WIN32_WINNT_WINXP){
	extern(Windows) void DnsRecordListFree(PDNS_RECORD p, DNS_FREE_TYPE t)
	{
		DnsFree(p, DnsFreeRecordList);
	}
}else
	export extern(Windows) VOID DnsRecordListFree(PDNS_RECORD pRecordList, DNS_FREE_TYPE FreeType);

enum {
	DNS_QUERY_STANDARD                  = 0x00000000,
	DNS_QUERY_ACCEPT_TRUNCATED_RESPONSE = 0x00000001,
	DNS_QUERY_USE_TCP_ONLY              = 0x00000002,
	DNS_QUERY_NO_RECURSION              = 0x00000004,
	DNS_QUERY_BYPASS_CACHE              = 0x00000008,
	DNS_QUERY_NO_WIRE_QUERY             = 0x00000010,
	DNS_QUERY_NO_LOCAL_NAME             = 0x00000020,
	DNS_QUERY_NO_HOSTS_FILE             = 0x00000040,
	DNS_QUERY_NO_NETBT                  = 0x00000080,
	DNS_QUERY_WIRE_ONLY                 = 0x00000100,
	DNS_QUERY_RETURN_MESSAGE            = 0x00000200,
	DNS_QUERY_MULTICAST_ONLY            = 0x00000400,
	DNS_QUERY_NO_MULTICAST              = 0x00000800,
	DNS_QUERY_TREAT_AS_FQDN             = 0x00001000,
	DNS_QUERY_APPEND_MULTILABEL         = 0x00800000,
	DNS_QUERY_DONT_RESET_TTL_VALUES     = 0x00100000,
	DNS_QUERY_RESERVED                  = 0xf0000000,
	DNS_QUERY_CACHE_ONLY                = DNS_QUERY_NO_WIRE_QUERY,
}

export extern(Windows) DNS_STATUS DnsQuery_A(PCSTR pszName, WORD wType, DWORD Options, PVOID pExtra, PDNS_RECORD* ppQueryResults, PVOID* pReserved);
export extern(Windows) DNS_STATUS DnsQuery_UTF8(PCSTR pszName, WORD wType, DWORD Options, PVOID pExtra, PDNS_RECORD* ppQueryResults, PVOID* pReserved);
export extern(Windows) DNS_STATUS DnsQuery_W(PCWSTR pszName, WORD wType, DWORD Options, PVOID pExtra, PDNS_RECORD* ppQueryResults, PVOID* pReserved);
version(UNICODE)
	alias DnsQuery_W DnsQuery;
else
	alias DnsQuery_A DnsQuery;

enum {
	DNS_UPDATE_SECURITY_USE_DEFAULT    = 0x00000000,
	DNS_UPDATE_SECURITY_OFF            = 0x00000010,
	DNS_UPDATE_SECURITY_ON             = 0x00000020,
	DNS_UPDATE_SECURITY_ONLY           = 0x00000100,
	DNS_UPDATE_CACHE_SECURITY_CONTEXT  = 0x00000200,
	DNS_UPDATE_TEST_USE_LOCAL_SYS_ACCT = 0x00000400,
	DNS_UPDATE_FORCE_SECURITY_NEGO     = 0x00000800,
	DNS_UPDATE_TRY_ALL_MASTER_SERVERS  = 0x00001000,
	DNS_UPDATE_SKIP_NO_UPDATE_ADAPTERS = 0x00002000,
	DNS_UPDATE_REMOTE_SERVER           = 0x00004000,
	DNS_UPDATE_RESERVED                = 0xffff0000,
}

export extern(Windows) DNS_STATUS DnsAcquireContextHandle_W(DWORD CredentialFlags, PVOID Credentials, PHANDLE pContext);
export extern(Windows) DNS_STATUS DnsAcquireContextHandle_A(DWORD CredentialFlags, PVOID Credentials, PHANDLE pContext);
version(UNICODE)
	alias DnsAcquireContextHandle_W DnsAcquireContextHandle;
else
	alias DnsAcquireContextHandle_A DnsAcquireContextHandle;

export extern(Windows) VOID DnsReleaseContextHandle(HANDLE hContext);
export extern(Windows) DNS_STATUS DnsModifyRecordsInSet_W(PDNS_RECORD pAddRecords, PDNS_RECORD pDeleteRecords, DWORD Options, HANDLE hCredentials, PVOID pExtraList, PVOID pReserved);
export extern(Windows) DNS_STATUS DnsModifyRecordsInSet_A(PDNS_RECORD pAddRecords, PDNS_RECORD pDeleteRecords, DWORD Options, HANDLE hCredentials, PVOID pExtraList, PVOID pReserved);
export extern(Windows) DNS_STATUS DnsModifyRecordsInSet_UTF8(PDNS_RECORD pAddRecords, PDNS_RECORD pDeleteRecords, DWORD Options, HANDLE hCredentials, PVOID pExtraList, PVOID pReserved);
version(UNICODE)
	alias DnsModifyRecordsInSet_W DnsModifyRecordsInSet;
else
	alias DnsModifyRecordsInSet_A DnsModifyRecordsInSet;

export extern(Windows) DNS_STATUS DnsReplaceRecordSetW(PDNS_RECORD pReplaceSet, DWORD Options, HANDLE hContext, PVOID pExtraInfo, PVOID pReserved);
export extern(Windows) DNS_STATUS DnsReplaceRecordSetA(PDNS_RECORD pReplaceSet, DWORD Options, HANDLE hContext, PVOID pExtraInfo, PVOID pReserved);
export extern(Windows) DNS_STATUS DnsReplaceRecordSetUTF8(PDNS_RECORD pReplaceSet, DWORD Options, HANDLE hContext, PVOID pExtraInfo, PVOID pReserved);
version(UNICODE)
	alias DnsReplaceRecordSetW DnsReplaceRecordSet;
else
	alias DnsReplaceRecordSetA DnsReplaceRecordSet;

enum {
	DnsNameDomain,
	DnsNameDomainLabel,
	DnsNameHostnameFull,
	DnsNameHostnameLabel,
	DnsNameWildcard,
	DnsNameSrvRecord,
	DnsNameValidateTld
}
alias int DNS_NAME_FORMAT;
export extern(Windows) DNS_STATUS DnsValidateName_W(PCWSTR pszName, DNS_NAME_FORMAT Format);
export extern(Windows) DNS_STATUS DnsValidateName_A(PCSTR pszName, DNS_NAME_FORMAT Format);
export extern(Windows) DNS_STATUS DnsValidateName_UTF8(PCSTR pszName, DNS_NAME_FORMAT Format);
version(UNICODE)
	alias DnsValidateName_W DnsValidateName;
else
	alias DnsValidateName_A DnsValidateName;

enum {
	DNS_VALSVR_ERROR_INVALID_ADDR = 0x01,
	DNS_VALSVR_ERROR_INVALID_NAME = 0x02,
	DNS_VALSVR_ERROR_UNREACHABLE  = 0x03,
	DNS_VALSVR_ERROR_NO_RESPONSE  = 0x04,
	DNS_VALSVR_ERROR_NO_AUTH      = 0x05,
	DNS_VALSVR_ERROR_REFUSED      = 0x06,
	DNS_VALSVR_ERROR_NO_TCP       = 0x10,
	DNS_VALSVR_ERROR_UNKNOWN      = 0xFF,
}

export extern(Windows) DNS_STATUS DnsValidateServerStatus(PSOCKADDR server, PCWSTR queryName, PDWORD serverStatus);
export extern(Windows) BOOL DnsNameCompare_A(PCSTR pName1, PCSTR pName2);
export extern(Windows) BOOL DnsNameCompare_W(PCWSTR pName1, PCWSTR pName2);
version(UNICODE)
	alias DnsNameCompare_W DnsNameCompare;
else
	alias DnsNameCompare_A DnsNameCompare;

struct DNS_MESSAGE_BUFFER {
	DNS_HEADER MessageHead;
	CHAR[1] MessageBody;
}
alias DNS_MESSAGE_BUFFER* PDNS_MESSAGE_BUFFER;

export extern(Windows) BOOL DnsWriteQuestionToBuffer_W(PDNS_MESSAGE_BUFFER pDnsBuffer, PDWORD pdwBufferSize, PCWSTR pszName, WORD wType, WORD Xid, BOOL fRecursionDesired);
export extern(Windows) BOOL DnsWriteQuestionToBuffer_UTF8(PDNS_MESSAGE_BUFFER pDnsBuffer, PDWORD pdwBufferSize, PCSTR pszName, WORD wType, WORD Xid, BOOL fRecursionDesired);
export extern(Windows) DNS_STATUS DnsExtractRecordsFromMessage_W(PDNS_MESSAGE_BUFFER pDnsBuffer, WORD wMessageLength, PDNS_RECORD* ppRecord);
export extern(Windows) DNS_STATUS DnsExtractRecordsFromMessage_UTF8(PDNS_MESSAGE_BUFFER pDnsBuffer, WORD wMessageLength, PDNS_RECORD* ppRecord);
export extern(Windows) DWORD DnsGetProxyInformation(PCWSTR hostName, DNS_PROXY_INFORMATION* proxyInformation, DNS_PROXY_INFORMATION* defaultProxyInformation, DNS_PROXY_COMPLETION_ROUTINE completionRoutine, void* completionContext);
export extern(Windows) VOID DnsFreeProxyName(PWSTR proxyName);

} // extern(C)
