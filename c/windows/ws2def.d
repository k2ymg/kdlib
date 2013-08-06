/** ws2def.d

Converted from 'ws2def.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.ws2def;


import c.windows.sdkddkver;
import c.windows.windef;
import c.windows.inaddr;
import c.windows.guiddef;


extern(C){

alias USHORT ADDRESS_FAMILY;

enum {
	AF_UNSPEC    = 0,
	AF_UNIX      = 1,
	AF_INET      = 2,
	AF_IMPLINK   = 3,
	AF_PUP       = 4,
	AF_CHAOS     = 5,
	AF_NS        = 6,
	AF_IPX       = AF_NS,
	AF_ISO       = 7,
	AF_OSI       = AF_ISO,
	AF_ECMA      = 8,
	AF_DATAKIT   = 9,
	AF_CCITT     = 10,
	AF_SNA       = 11,
	AF_DECnet    = 12,
	AF_DLI       = 13,
	AF_LAT       = 14,
	AF_HYLINK    = 15,
	AF_APPLETALK = 16,
	AF_NETBIOS   = 17,
	AF_VOICEVIEW = 18,
	AF_FIREFOX   = 19,
	AF_UNKNOWN1  = 20,
	AF_BAN       = 21,
	AF_ATM       = 22,
	AF_INET6     = 23,
	AF_CLUSTER   = 24,
	AF_12844     = 25,
	AF_IRDA      = 26,
	AF_NETDES    = 28,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		AF_TCNPROCESS = 29,
		AF_TCNMESSAGE = 30,
		AF_ICLFXBM    = 31,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		AF_BTH = 32,
	//(_WIN32_WINNT >= _WIN32_WINNT_WIN7)
		AF_LINK = 33,
		AF_MAX  = 34,
}
enum {
	SOCK_STREAM    = 1,
	SOCK_DGRAM     = 2,
	SOCK_RAW       = 3,
	SOCK_RDM       = 4,
	SOCK_SEQPACKET = 5,
}
enum SOL_SOCKET = 0xffff;
enum {
	SO_DEBUG              = 0x0001,
	SO_ACCEPTCONN         = 0x0002,
	SO_REUSEADDR          = 0x0004,
	SO_KEEPALIVE          = 0x0008,
	SO_DONTROUTE          = 0x0010,
	SO_BROADCAST          = 0x0020,
	SO_USELOOPBACK        = 0x0040,
	SO_LINGER             = 0x0080,
	SO_OOBINLINE          = 0x0100,
	SO_DONTLINGER         = cast(int)(~SO_LINGER),
	SO_EXCLUSIVEADDRUSE   = cast(int)(~SO_REUSEADDR),
	SO_SNDBUF             = 0x1001,
	SO_RCVBUF             = 0x1002,
	SO_SNDLOWAT           = 0x1003,
	SO_RCVLOWAT           = 0x1004,
	SO_SNDTIMEO           = 0x1005,
	SO_RCVTIMEO           = 0x1006,
	SO_ERROR              = 0x1007,
	SO_TYPE               = 0x1008,
	SO_BSP_STATE          = 0x1009,
	SO_GROUP_ID           = 0x2001,
	SO_GROUP_PRIORITY     = 0x2002,
	SO_MAX_MSG_SIZE       = 0x2003,
	SO_CONDITIONAL_ACCEPT = 0x3002,
	SO_PAUSE_ACCEPT       = 0x3003,
	SO_COMPARTMENT_ID     = 0x3004,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
		SO_RANDOMIZE_PORT   = 0x3005,
		SO_PORT_SCALABILITY = 0x3006,
}

enum WSK_SO_BASE = 0x4000;
enum TCP_NODELAY = 0x0001;

struct sockaddr {
	ADDRESS_FAMILY sa_family;
	CHAR[14] sa_data;
}
alias sockaddr SOCKADDR;
alias SOCKADDR* PSOCKADDR;
alias SOCKADDR* LPSOCKADDR;

struct SOCKET_ADDRESS {
	LPSOCKADDR lpSockaddr;
	INT iSockaddrLength;
}
alias SOCKET_ADDRESS* PSOCKET_ADDRESS;
alias SOCKET_ADDRESS* LPSOCKET_ADDRESS;

struct SOCKET_ADDRESS_LIST {
	INT iAddressCount;
	SOCKET_ADDRESS[1] Address;
}
alias SOCKET_ADDRESS_LIST* PSOCKET_ADDRESS_LIST;
alias SOCKET_ADDRESS_LIST* LPSOCKET_ADDRESS_LIST;

struct CSADDR_INFO {
	SOCKET_ADDRESS LocalAddr;
	SOCKET_ADDRESS RemoteAddr;
	INT iSocketType ;
	INT iProtocol ;
}
alias CSADDR_INFO* PCSADDR_INFO;
alias CSADDR_INFO* LPCSADDR_INFO;

enum {
	_SS_MAXSIZE   = 128,
	_SS_ALIGNSIZE = long.sizeof,
}

enum {
	_SS_PAD1SIZE = _SS_ALIGNSIZE - USHORT.sizeof,
	_SS_PAD2SIZE = _SS_MAXSIZE - (USHORT.sizeof + _SS_PAD1SIZE + _SS_ALIGNSIZE),
}

struct SOCKADDR_STORAGE_LH {
	ADDRESS_FAMILY ss_family;
	CHAR[_SS_PAD1SIZE] __ss_pad1;
	long __ss_align;
	CHAR[_SS_PAD2SIZE] __ss_pad2;

}
alias SOCKADDR_STORAGE_LH* PSOCKADDR_STORAGE_LH;
alias SOCKADDR_STORAGE_LH* LPSOCKADDR_STORAGE_LH;

struct SOCKADDR_STORAGE_XP {
	short ss_family;
	CHAR[_SS_PAD1SIZE] __ss_pad1;
	long __ss_align;
	CHAR[_SS_PAD2SIZE] __ss_pad2;

}
alias SOCKADDR_STORAGE_XP* PSOCKADDR_STORAGE_XP;
alias SOCKADDR_STORAGE_XP* LPSOCKADDR_STORAGE_XP;

alias SOCKADDR_STORAGE_LH SOCKADDR_STORAGE;
alias SOCKADDR_STORAGE* PSOCKADDR_STORAGE;
alias SOCKADDR_STORAGE* LPSOCKADDR_STORAGE;

enum {
	IOC_UNIX     = 0x00000000,
	IOC_WS2      = 0x08000000,
	IOC_PROTOCOL = 0x10000000,
	IOC_VENDOR   = 0x18000000,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		IOC_WSK = IOC_WS2 | 0x07000000,
	IOCPARM_MASK = 0x7f,
	IOC_VOID     = 0x20000000,
	IOC_OUT      = 0x40000000,
	IOC_IN       = 0x80000000,
	IOC_INOUT    = IOC_IN|IOC_OUT,
}

private pure nothrow{
	uint _WSAIO(uint x, uint y)
	{
		return IOC_VOID | x | y;
	}
	uint _WSAIOR(int x, int y)
	{
		return IOC_OUT | x | y;
	}
	uint _WSAIOW(int x, int y)
	{
		return IOC_IN | x | y;
	}
	uint _WSAIORW(int x, int y)
	{
		return IOC_INOUT | x | y;
	}
}


enum {
	SIO_ASSOCIATE_HANDLE               = _WSAIOW(IOC_WS2,1),
	SIO_ENABLE_CIRCULAR_QUEUEING       = _WSAIO(IOC_WS2,2),
	SIO_FIND_ROUTE                     = _WSAIOR(IOC_WS2,3),
	SIO_FLUSH                          = _WSAIO(IOC_WS2,4),
	SIO_GET_BROADCAST_ADDRESS          = _WSAIOR(IOC_WS2,5),
	SIO_GET_EXTENSION_FUNCTION_POINTER = _WSAIORW(IOC_WS2,6),
	SIO_GET_QOS                        = _WSAIORW(IOC_WS2,7),
	SIO_GET_GROUP_QOS                  = _WSAIORW(IOC_WS2,8),
	SIO_MULTIPOINT_LOOPBACK            = _WSAIOW(IOC_WS2,9),
	SIO_MULTICAST_SCOPE                = _WSAIOW(IOC_WS2,10),
	SIO_SET_QOS                        = _WSAIOW(IOC_WS2,11),
	SIO_SET_GROUP_QOS                  = _WSAIOW(IOC_WS2,12),
	SIO_TRANSLATE_HANDLE               = _WSAIORW(IOC_WS2,13),
	SIO_ROUTING_INTERFACE_QUERY        = _WSAIORW(IOC_WS2,20),
	SIO_ROUTING_INTERFACE_CHANGE       = _WSAIOW(IOC_WS2,21),
	SIO_ADDRESS_LIST_QUERY             = _WSAIOR(IOC_WS2,22),
	SIO_ADDRESS_LIST_CHANGE            = _WSAIO(IOC_WS2,23),
	SIO_QUERY_TARGET_PNP_HANDLE        = _WSAIOR(IOC_WS2,24),
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		SIO_ADDRESS_LIST_SORT = _WSAIORW(IOC_WS2,25),
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		SIO_RESERVED_1 = _WSAIOW(IOC_WS2,26),
		SIO_RESERVED_2 = _WSAIOW(IOC_WS2,33),
}
enum {
	IPPROTO_IP = 0,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	 	IPPROTO_HOPOPTS = 0,
	IPPROTO_ICMP = 1,
	IPPROTO_IGMP = 2,
	IPPROTO_GGP = 3,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	 	IPPROTO_IPV4 = 4,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	 	IPPROTO_ST = 5,
	IPPROTO_TCP = 6,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		IPPROTO_CBT = 7,
		IPPROTO_EGP = 8,
		IPPROTO_IGP = 9,
	IPPROTO_PUP = 12,
	IPPROTO_UDP = 17,
	IPPROTO_IDP = 22,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		IPPROTO_RDP = 27,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		IPPROTO_IPV6     = 41,
		IPPROTO_ROUTING  = 43,
		IPPROTO_FRAGMENT = 44,
		IPPROTO_ESP      = 50,
		IPPROTO_AH       = 51,
		IPPROTO_ICMPV6   = 58,
		IPPROTO_NONE     = 59,
		IPPROTO_DSTOPTS  = 60,
	IPPROTO_ND = 77,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		IPPROTO_ICLFXBM = 78,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		IPPROTO_PIM  = 103,
		IPPROTO_PGM  = 113,
		IPPROTO_L2TP = 115,
		IPPROTO_SCTP = 132,
	IPPROTO_RAW                   = 255,
	IPPROTO_MAX                   = 256,
	IPPROTO_RESERVED_RAW          = 257,
	IPPROTO_RESERVED_IPSEC        = 258,
	IPPROTO_RESERVED_IPSECOFFLOAD = 259,
	IPPROTO_RESERVED_MAX          = 260
}
alias int IPPROTO;
alias IPPROTO* PIPROTO;

enum {
	IPPORT_TCPMUX       = 1,
	IPPORT_ECHO         = 7,
	IPPORT_DISCARD      = 9,
	IPPORT_SYSTAT       = 11,
	IPPORT_DAYTIME      = 13,
	IPPORT_NETSTAT      = 15,
	IPPORT_QOTD         = 17,
	IPPORT_MSP          = 18,
	IPPORT_CHARGEN      = 19,
	IPPORT_FTP_DATA     = 20,
	IPPORT_FTP          = 21,
	IPPORT_TELNET       = 23,
	IPPORT_SMTP         = 25,
	IPPORT_TIMESERVER   = 37,
	IPPORT_NAMESERVER   = 42,
	IPPORT_WHOIS        = 43,
	IPPORT_MTP          = 57,
	IPPORT_TFTP         = 69,
	IPPORT_RJE          = 77,
	IPPORT_FINGER       = 79,
	IPPORT_TTYLINK      = 87,
	IPPORT_SUPDUP       = 95,
	IPPORT_POP3         = 110,
	IPPORT_NTP          = 123,
	IPPORT_EPMAP        = 135,
	IPPORT_NETBIOS_NS   = 137,
	IPPORT_NETBIOS_DGM  = 138,
	IPPORT_NETBIOS_SSN  = 139,
	IPPORT_IMAP         = 143,
	IPPORT_SNMP         = 161,
	IPPORT_SNMP_TRAP    = 162,
	IPPORT_IMAP3        = 220,
	IPPORT_LDAP         = 389,
	IPPORT_HTTPS        = 443,
	IPPORT_MICROSOFT_DS = 445,
	IPPORT_EXECSERVER   = 512,
	IPPORT_LOGINSERVER  = 513,
	IPPORT_CMDSERVER    = 514,
	IPPORT_EFSSERVER    = 520,
	IPPORT_BIFFUDP      = 512,
	IPPORT_WHOSERVER    = 513,
	IPPORT_ROUTESERVER  = 520,
	IPPORT_RESERVED     = 1024,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		IPPORT_REGISTERED_MIN = IPPORT_RESERVED,
		IPPORT_REGISTERED_MAX = 0xbfff,
		IPPORT_DYNAMIC_MIN    = 0xc000,
		IPPORT_DYNAMIC_MAX    = 0xffff,
}

//	IN_CLASSA(i) (((LONG)(i) & 0x80000000) == 0)
//	IN_CLASSB(i) (((LONG)(i) & 0xc0000000) == 0x80000000)
//	IN_CLASSC(i) (((LONG)(i) & 0xe0000000) == 0xc0000000)
//	IN_CLASSD(i) (((int)(i) & 0xf0000000) == 0xe0000000)
//	IN_MULTICAST(i) IN_CLASSD(i)

enum {
	IN_CLASSA_NET    = 0xff000000,
	IN_CLASSA_NSHIFT = 24,
	IN_CLASSA_HOST   = 0x00ffffff,
	IN_CLASSA_MAX    = 128,
	IN_CLASSB_NET    = 0xffff0000,
	IN_CLASSB_NSHIFT = 16,
	IN_CLASSB_HOST   = 0x0000ffff,
	IN_CLASSB_MAX    = 65536,
	IN_CLASSC_NET    = 0xffffff00,
	IN_CLASSC_NSHIFT = 8,
	IN_CLASSC_HOST   = 0x000000ff,
	IN_CLASSD_NET    = 0xf0000000,
	IN_CLASSD_NSHIFT = 28,
	IN_CLASSD_HOST   = 0x0fffffff,
	INADDR_ANY       = cast(ULONG)0x00000000,
	INADDR_LOOPBACK  = 0x7f000001,
	INADDR_BROADCAST = cast(ULONG)0xffffffff,
	INADDR_NONE      = 0xffffffff,
}

enum {
	ScopeLevelInterface    = 1,
	ScopeLevelLink         = 2,
	ScopeLevelSubnet       = 3,
	ScopeLevelAdmin        = 4,
	ScopeLevelSite         = 5,
	ScopeLevelOrganization = 8,
	ScopeLevelGlobal       = 14,
	ScopeLevelCount        = 16
}
alias int SCOPE_LEVEL;

struct SCOPE_ID {
	union {
		/*struct {
			ULONG Zone : 28;
			ULONG Level : 4;
		}*/
		ULONG Value;
	}
}
alias SCOPE_ID* PSCOPE_ID;

//const SCOPE_ID SCOPEID_UNSPECIFIED_INIT = {0};

struct sockaddr_in {
	ADDRESS_FAMILY sin_family;
	USHORT sin_port;
	IN_ADDR sin_addr;
	CHAR[8] sin_zero;
}
alias sockaddr_in SOCKADDR_IN;
alias sockaddr_in* PSOCKADDR_IN;

//(_WIN32_WINNT >= _WIN32_WINNT_WIN7)
	struct sockaddr_dl {
		ADDRESS_FAMILY sdl_family;
		UCHAR[8] sdl_data;
		UCHAR[4] sdl_zero;
	}
	alias sockaddr_dl SOCKADDR_DL;
	alias SOCKADDR_DL* PSOCKADDR_DL;

template _IO(int x, int y)
{
	enum _IO = (IOC_VOID | (x << 8) | y);
}

template _IOR(int x, int y, T)
{
	enum _IOR = (IOC_OUT | ((T.sizeof & IOCPARM_MASK) << 16) | (x << 8) | y);
}

template _IOW(int x, int y, T)
{
	enum _IOW = (IOC_IN | ((T.sizeof & IOCPARM_MASK) << 16) | (x << 8) | y);
}

struct WSABUF {
	ULONG len;
	CHAR* buf;
}
alias WSABUF* LPWSABUF;

struct WSAMSG {
	LPSOCKADDR name;
	INT namelen;
	LPWSABUF lpBuffers;
	ULONG dwBufferCount;
	WSABUF Control;
	ULONG dwFlags;
}
alias WSAMSG* PWSAMSG;
alias WSAMSG* LPWSAMSG;

struct WSACMSGHDR {
	SIZE_T cmsg_len;
	INT cmsg_level;
	INT cmsg_type;
}
alias WSACMSGHDR* PWSACMSGHDR;
alias WSACMSGHDR* LPWSACMSGHDR;

//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	alias WSACMSGHDR CMSGHDR;
	alias WSACMSGHDR* PCMSGHDR;

enum {
	MSG_TRUNC  = 0x0100,
	MSG_CTRUNC = 0x0200,
	MSG_BCAST  = 0x0400,
	MSG_MCAST  = 0x0800,
}
enum {
	AI_PASSIVE                = 0x00000001,
	AI_CANONNAME              = 0x00000002,
	AI_NUMERICHOST            = 0x00000004,
	AI_NUMERICSERV            = 0x00000008,
	AI_ALL                    = 0x00000100,
	AI_ADDRCONFIG             = 0x00000400,
	AI_V4MAPPED               = 0x00000800,
	AI_NON_AUTHORITATIVE      = 0x00004000,
	AI_SECURE                 = 0x00008000,
	AI_RETURN_PREFERRED_NAMES = 0x00010000,
	AI_FQDN                   = 0x00020000,
	AI_FILESERVER             = 0x00040000,
}

struct ADDRINFOA {
	int ai_flags;
	int ai_family;
	int ai_socktype;
	int ai_protocol;
	size_t ai_addrlen;
	char* ai_canonname;
	SOCKADDR* ai_addr;
	ADDRINFOA* ai_next;
}

struct ADDRINFOW {
	int ai_flags;
	int ai_family;
	int ai_socktype;
	int ai_protocol;
	size_t ai_addrlen;
	wchar* ai_canonname;
	SOCKADDR* ai_addr;
	ADDRINFOW* ai_next;
}
alias ADDRINFOA* PADDRINFOA;
alias ADDRINFOW* PADDRINFOW;

//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	struct ADDRINFOEXA {
		int ai_flags;
		int ai_family;
		int ai_socktype;
		int ai_protocol;
		size_t ai_addrlen;
		char* ai_canonname;
		sockaddr* ai_addr;
		void* ai_blob;
		size_t ai_bloblen;
		LPGUID ai_provider;
		ADDRINFOEXA* ai_next;
	}
	struct ADDRINFOEXW {
		int ai_flags;
		int ai_family;
		int ai_socktype;
		int ai_protocol;
		size_t ai_addrlen;
		wchar* ai_canonname;
		sockaddr* ai_addr;
		void* ai_blob;
		size_t ai_bloblen;
		LPGUID ai_provider;
		ADDRINFOEXW* ai_next;
	}
	alias ADDRINFOEXA* PADDRINFOEXA;
	alias ADDRINFOEXA* LPADDRINFOEXA;
	alias ADDRINFOEXW* PADDRINFOEXW;
	alias ADDRINFOEXW* LPADDRINFOEXW;

enum {
	NS_ALL         = 0,
	NS_SAP         = 1,
	NS_NDS         = 2,
	NS_PEER_BROWSE = 3,
	NS_SLP         = 5,
	NS_DHCP        = 6,
	NS_TCPIP_LOCAL = 10,
	NS_TCPIP_HOSTS = 11,
	NS_DNS         = 12,
	NS_NETBT       = 13,
	NS_WINS        = 14,
	//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
		NS_NLA = 15,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		NS_BTH = 16,
	NS_NBP  = 20,
	NS_MS   = 30,
	NS_STDA = 31,
	NS_NTDS = 32,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		NS_EMAIL     = 37,
		NS_PNRPNAME  = 38,
		NS_PNRPCLOUD = 39,
	NS_X500    = 40,
	NS_NIS     = 41,
	NS_NISPLUS = 42,
	NS_WRQ     = 50,
	NS_NETDES  = 60,
}

enum {
	NI_NOFQDN      = 0x01,
	NI_NUMERICHOST = 0x02,
	NI_NAMEREQD    = 0x04,
	NI_NUMERICSERV = 0x08,
	NI_DGRAM       = 0x10,
	NI_MAXHOST     = 1025,
	NI_MAXSERV     = 32,
}

} // extern(C)
