/** ws2ipdef.d

Converted from 'ws2ipdef.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.ws2ipdef;


import c.windows.sdkddkver;
import c.windows.windef;
import c.windows.inaddr;
import c.windows.in6addr;
import c.windows.ws2def;
import std.c.string;


extern(C){

struct sockaddr_in6_old {
	SHORT sin6_family;
	USHORT sin6_port;
	ULONG sin6_flowinfo;
	IN6_ADDR sin6_addr;
}

union sockaddr_gen {
	sockaddr Address;
	sockaddr_in AddressIn;
	sockaddr_in6_old AddressIn6;
}

struct INTERFACE_INFO {
	ULONG iiFlags;
	sockaddr_gen iiAddress;
	sockaddr_gen iiBroadcastAddress;
	sockaddr_gen iiNetmask;
}
alias INTERFACE_INFO* LPINTERFACE_INFO;

struct INTERFACE_INFO_EX {
	ULONG iiFlags;
	SOCKET_ADDRESS iiAddress;
	SOCKET_ADDRESS iiBroadcastAddress;
	SOCKET_ADDRESS iiNetmask;
}
alias INTERFACE_INFO_EX* LPINTERFACE_INFO_EX;

enum {
	IFF_UP           = 0x00000001,
	IFF_BROADCAST    = 0x00000002,
	IFF_LOOPBACK     = 0x00000004,
	IFF_POINTTOPOINT = 0x00000008,
	IFF_MULTICAST    = 0x00000010,
}
enum {
	IP_OPTIONS                     = 1,
	IP_HDRINCL                     = 2,
	IP_TOS                         = 3,
	IP_TTL                         = 4,
	IP_MULTICAST_IF                = 9,
	IP_MULTICAST_TTL               = 10,
	IP_MULTICAST_LOOP              = 11,
	IP_ADD_MEMBERSHIP              = 12,
	IP_DROP_MEMBERSHIP             = 13,
	IP_DONTFRAGMENT                = 14,
	IP_ADD_SOURCE_MEMBERSHIP       = 15,
	IP_DROP_SOURCE_MEMBERSHIP      = 16,
	IP_BLOCK_SOURCE                = 17,
	IP_UNBLOCK_SOURCE              = 18,
	IP_PKTINFO                     = 19,
	IP_HOPLIMIT                    = 21,
	IP_RECEIVE_BROADCAST           = 22,
	IP_RECVIF                      = 24,
	IP_RECVDSTADDR                 = 25,
	IP_IFLIST                      = 28,
	IP_ADD_IFLIST                  = 29,
	IP_DEL_IFLIST                  = 30,
	IP_UNICAST_IF                  = 31,
	IP_RTHDR                       = 32,
	IP_RECVRTHDR                   = 38,
	IP_TCLASS                      = 39,
	IP_RECVTCLASS                  = 40,
	IP_ORIGINAL_ARRIVAL_IF         = 47,
	IP_UNSPECIFIED_TYPE_OF_SERVICE = -1,
}

struct sockaddr_in6 {
	ADDRESS_FAMILY sin6_family;
	USHORT sin6_port;
	ULONG sin6_flowinfo;
	IN6_ADDR sin6_addr;
	union {
		ULONG sin6_scope_id;
		SCOPE_ID sin6_scope_struct;
	}
}
alias sockaddr_in6 SOCKADDR_IN6_LH;
alias sockaddr_in6* PSOCKADDR_IN6_LH;
alias sockaddr_in6* LPSOCKADDR_IN6_LH;

struct sockaddr_in6_w2ksp1 {
	short sin6_family;
	USHORT sin6_port;
	ULONG sin6_flowinfo;
	in6_addr sin6_addr;
	ULONG sin6_scope_id;
}
alias sockaddr_in6_w2ksp1 SOCKADDR_IN6_W2KSP1;
alias sockaddr_in6_w2ksp1* PSOCKADDR_IN6_W2KSP1;
alias sockaddr_in6_w2ksp1* LPSOCKADDR_IN6_W2KSP1;

alias SOCKADDR_IN6_LH SOCKADDR_IN6;
alias SOCKADDR_IN6_LH* PSOCKADDR_IN6;
alias SOCKADDR_IN6_LH* LPSOCKADDR_IN6;

union SOCKADDR_INET {
	SOCKADDR_IN Ipv4;
	SOCKADDR_IN6 Ipv6;
	ADDRESS_FAMILY si_family;
}
alias SOCKADDR_INET* PSOCKADDR_INET;

struct SOCKADDR_IN6_PAIR {
	PSOCKADDR_IN6 SourceAddress;
	PSOCKADDR_IN6 DestinationAddress;
}
alias SOCKADDR_IN6_PAIR* PSOCKADDR_IN6_PAIR;

const IN6_ADDR IN6ADDR_ANY_INIT = {0};
const IN6_ADDR IN6ADDR_LOOPBACK_INIT = { [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1] };
const IN6_ADDR IN6ADDR_ALLNODESONNODE_INIT = { [0xff, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01] };
const IN6_ADDR IN6ADDR_ALLNODESONLINK_INIT = { [0xff, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01] };
const IN6_ADDR IN6ADDR_ALLROUTERSONLINK_INIT = { [0xff, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02] };
const IN6_ADDR IN6ADDR_ALLMLDV2ROUTERSONLINK_INIT = { [0xff, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16] };
const IN6_ADDR IN6ADDR_TEREDOINITIALLINKLOCALADDRESS_INIT = { [0xfe, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xfe] };
const IN6_ADDR IN6ADDR_TEREDOOLDLINKLOCALADDRESSXP_INIT = { [0xfe, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 'T', 'E', 'R', 'E', 'D', 'O'] };
const IN6_ADDR IN6ADDR_TEREDOOLDLINKLOCALADDRESSVISTA_INIT = { [0xfe, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff] };
const IN6_ADDR IN6ADDR_LINKLOCALPREFIX_INIT = { [0xfe, 0x80,] };
const IN6_ADDR IN6ADDR_MULTICASTPREFIX_INIT = { [0xff, 0x00,] };
const IN6_ADDR IN6ADDR_SOLICITEDNODEMULTICASTPREFIX_INIT = { [0xff, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0xff,] };
const IN6_ADDR IN6ADDR_V4MAPPEDPREFIX_INIT = { [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0xff,] };
const IN6_ADDR IN6ADDR_6TO4PREFIX_INIT = { [0x20, 0x02,] };
const IN6_ADDR IN6ADDR_TEREDOPREFIX_INIT = { [0x20, 0x01, 0x00, 0x00,] };
const IN6_ADDR IN6ADDR_TEREDOPREFIX_INIT_OLD = { [0x3f, 0xfe, 0x83, 0x1f,] };
enum {
	IN6ADDR_LINKLOCALPREFIX_LENGTH              = 64,
	IN6ADDR_MULTICASTPREFIX_LENGTH              = 8,
	IN6ADDR_SOLICITEDNODEMULTICASTPREFIX_LENGTH = 104,
	IN6ADDR_V4MAPPEDPREFIX_LENGTH               = 96,
	IN6ADDR_6TO4PREFIX_LENGTH                   = 16,
	IN6ADDR_TEREDOPREFIX_LENGTH                 = 32,
}

extern const SCOPE_ID scopeid_unspecified;

extern const IN_ADDR in4addr_any;
extern const IN_ADDR in4addr_loopback;
extern const IN_ADDR in4addr_broadcast;
extern const IN_ADDR in4addr_allnodesonlink;
extern const IN_ADDR in4addr_allroutersonlink;
extern const IN_ADDR in4addr_alligmpv3routersonlink;
extern const IN_ADDR in4addr_allteredohostsonlink;
extern const IN_ADDR in4addr_linklocalprefix;
extern const IN_ADDR in4addr_multicastprefix;

extern const IN6_ADDR in6addr_any;
extern const IN6_ADDR in6addr_loopback;
extern const IN6_ADDR in6addr_allnodesonnode;
extern const IN6_ADDR in6addr_allnodesonlink;
extern const IN6_ADDR in6addr_allroutersonlink;
extern const IN6_ADDR in6addr_allmldv2routersonlink;
extern const IN6_ADDR in6addr_teredoinitiallinklocaladdress;
extern const IN6_ADDR in6addr_linklocalprefix;
extern const IN6_ADDR in6addr_multicastprefix;
extern const IN6_ADDR in6addr_solicitednodemulticastprefix;
extern const IN6_ADDR in6addr_v4mappedprefix;
extern const IN6_ADDR in6addr_6to4prefix;
extern const IN6_ADDR in6addr_teredoprefix;
extern const IN6_ADDR in6addr_teredoprefix_old;

BOOLEAN IN6_ADDR_EQUAL(const(IN6_ADDR)* x, const(IN6_ADDR)* y)
{
	long* a;
	long* b;

	a = cast(long*)x;
	b = cast(long*)y;
	return cast(BOOLEAN)((a[1] == b[1]) && (a[0] == b[0]));
}
alias IN6_ADDR_EQUAL IN6_ARE_ADDR_EQUAL;

BOOLEAN IN6_IS_ADDR_UNSPECIFIED(const(IN6_ADDR)* a)
{
	return cast(BOOLEAN)((a.s6_words[0] == 0) && (a.s6_words[1] == 0) && (a.s6_words[2] == 0) && (a.s6_words[3] == 0) && (a.s6_words[4] == 0) && (a.s6_words[5] == 0) && (a.s6_words[6] == 0) && (a.s6_words[7] == 0));
}

BOOLEAN IN6_IS_ADDR_LOOPBACK(const(IN6_ADDR)* a)
{
	return cast(BOOLEAN)((a.s6_words[0] == 0) && (a.s6_words[1] == 0) && (a.s6_words[2] == 0) && (a.s6_words[3] == 0) && (a.s6_words[4] == 0) && (a.s6_words[5] == 0) && (a.s6_words[6] == 0) && (a.s6_words[7] == 0x0100));
}

BOOLEAN IN6_IS_ADDR_MULTICAST(const(IN6_ADDR)* a)
{
	return cast(BOOLEAN)(a.s6_bytes[0] == 0xff);
}

BOOLEAN IN6_IS_ADDR_EUI64(const(IN6_ADDR)* a)
{
	return cast(BOOLEAN)(((a.s6_bytes[0] & 0xe0) != 0) && !IN6_IS_ADDR_MULTICAST(a));
}

BOOLEAN IN6_IS_ADDR_SUBNET_ROUTER_ANYCAST(const(IN6_ADDR)* a)
{
	return cast(BOOLEAN)(IN6_IS_ADDR_EUI64(a) && (a.s6_words[4] == 0) && (a.s6_words[5] == 0) && (a.s6_words[6] == 0) && (a.s6_words[7] == 0));
}

BOOLEAN IN6_IS_ADDR_SUBNET_RESERVED_ANYCAST(const(IN6_ADDR)* a)
{
	return cast(BOOLEAN)(IN6_IS_ADDR_EUI64(a) && (a.s6_words[4] == 0xfffd) && (a.s6_words[5] == 0xffff) && (a.s6_words[6] == 0xffff) && ((a.s6_words[7] & 0x80ff) == 0x80ff));
}

BOOLEAN IN6_IS_ADDR_ANYCAST(const(IN6_ADDR)* a)
{
	return (IN6_IS_ADDR_SUBNET_RESERVED_ANYCAST(a) || IN6_IS_ADDR_SUBNET_ROUTER_ANYCAST(a));
}

BOOLEAN IN6_IS_ADDR_LINKLOCAL(const(IN6_ADDR)* a)
{
	return cast(BOOLEAN)((a.s6_bytes[0] == 0xfe) && ((a.s6_bytes[1] & 0xc0) == 0x80));
}

BOOLEAN IN6_IS_ADDR_SITELOCAL(const(IN6_ADDR)* a)
{
	return cast(BOOLEAN)((a.s6_bytes[0] == 0xfe) && ((a.s6_bytes[1] & 0xc0) == 0xc0));
}

BOOLEAN IN6_IS_ADDR_GLOBAL(const(IN6_ADDR)* a)
{
	ULONG High = (a.s6_bytes[0] & 0xf0);
	return cast(BOOLEAN)((High != 0) && (High != 0xf0));
}

BOOLEAN IN6_IS_ADDR_V4MAPPED(const(IN6_ADDR)* a)
{
	return cast(BOOLEAN)((a.s6_words[0] == 0) && (a.s6_words[1] == 0) && (a.s6_words[2] == 0) && (a.s6_words[3] == 0) && (a.s6_words[4] == 0) && (a.s6_words[5] == 0xffff));
}

BOOLEAN IN6_IS_ADDR_V4COMPAT(const(IN6_ADDR)* a)
{
	return cast(BOOLEAN)((a.s6_words[0] == 0) && (a.s6_words[1] == 0) && (a.s6_words[2] == 0) && (a.s6_words[3] == 0) && (a.s6_words[4] == 0) && (a.s6_words[5] == 0) && !((a.s6_words[6] == 0) && (a.s6_addr[14] == 0) && ((a.s6_addr[15] == 0) || (a.s6_addr[15] == 1))));
}


BOOLEAN IN6_IS_ADDR_V4TRANSLATED(const(IN6_ADDR)* a)
{
	return cast(BOOLEAN)((a.s6_words[0] == 0) && (a.s6_words[1] == 0) && (a.s6_words[2] == 0) && (a.s6_words[3] == 0) && (a.s6_words[4] == 0xffff) && (a.s6_words[5] == 0));
}

BOOLEAN IN6_IS_ADDR_MC_NODELOCAL(const(IN6_ADDR)* a)
{
	return cast(BOOLEAN)(IN6_IS_ADDR_MULTICAST(a) && ((a.s6_bytes[1] & 0xf) == 1));
}

BOOLEAN IN6_IS_ADDR_MC_LINKLOCAL(const(IN6_ADDR)* a)
{
	return cast(BOOLEAN)(IN6_IS_ADDR_MULTICAST(a) && ((a.s6_bytes[1] & 0xf) == 2));
}

BOOLEAN IN6_IS_ADDR_MC_SITELOCAL(const(IN6_ADDR)* a)
{
	return cast(BOOLEAN)(IN6_IS_ADDR_MULTICAST(a) && ((a.s6_bytes[1] & 0xf) == 5));
}

BOOLEAN IN6_IS_ADDR_MC_ORGLOCAL(const(IN6_ADDR)* a)
{
	return cast(BOOLEAN)(IN6_IS_ADDR_MULTICAST(a) && ((a.s6_bytes[1] & 0xf) == 8));
}

BOOLEAN IN6_IS_ADDR_MC_GLOBAL(const(IN6_ADDR)* a)
{
	return cast(BOOLEAN)(IN6_IS_ADDR_MULTICAST(a) && ((a.s6_bytes[1] & 0xf) == 0xe));
}

VOID IN6_SET_ADDR_UNSPECIFIED(PIN6_ADDR a)
{
	memset(a.s6_bytes.ptr, 0, IN6_ADDR.sizeof);
}

VOID IN6_SET_ADDR_LOOPBACK(PIN6_ADDR a)
{
	memset(a.s6_bytes.ptr, 0, IN6_ADDR.sizeof);
	a.s6_bytes[15] = 1;
}

VOID IN6ADDR_SETANY(PSOCKADDR_IN6 a)
{
	a.sin6_family = AF_INET6;
	a.sin6_port = 0;
	a.sin6_flowinfo = 0;
	IN6_SET_ADDR_UNSPECIFIED(&a.sin6_addr);
	a.sin6_scope_id = 0;
}

VOID IN6ADDR_SETLOOPBACK(PSOCKADDR_IN6 a)
{
	a.sin6_family = AF_INET6;
	a.sin6_port = 0;
	a.sin6_flowinfo = 0;
	IN6_SET_ADDR_LOOPBACK(&a.sin6_addr);
	a.sin6_scope_id = 0;
}

BOOLEAN IN6ADDR_ISANY(const(SOCKADDR_IN6)* a)
{
	return IN6_IS_ADDR_UNSPECIFIED(&a.sin6_addr);
}

BOOLEAN IN6ADDR_ISLOOPBACK(const(SOCKADDR_IN6)* a)
{
	return IN6_IS_ADDR_LOOPBACK(&a.sin6_addr);
}

BOOLEAN IN6ADDR_ISEQUAL(const(SOCKADDR_IN6)* a, const(SOCKADDR_IN6)* b)
{
	return cast(BOOLEAN)(a.sin6_scope_id == b.sin6_scope_id && IN6_ADDR_EQUAL(&a.sin6_addr, &b.sin6_addr));
}

BOOLEAN IN6ADDR_ISUNSPECIFIED(const(SOCKADDR_IN6)* a)
{
	return cast(BOOLEAN)(a.sin6_scope_id == 0 && IN6_IS_ADDR_UNSPECIFIED(&a.sin6_addr));
}

enum {
	SIO_GET_INTERFACE_LIST    = _IOR!('t', 127, ULONG),
	SIO_GET_INTERFACE_LIST_EX = _IOR!('t', 126, ULONG),
	SIO_SET_MULTICAST_FILTER  = _IOW!('t', 125, ULONG),
	SIO_GET_MULTICAST_FILTER  = _IOW!('t', 124 | IOC_IN, ULONG),
	SIOCSIPMSFILTER           = SIO_SET_MULTICAST_FILTER,
	SIOCGIPMSFILTER           = SIO_GET_MULTICAST_FILTER,
	SIOCSMSFILTER             = _IOW!('t', 126, ULONG),
	SIOCGMSFILTER             = _IOW!('t', 127 | IOC_IN, ULONG),
	//(NTDDI_VERSION >= NTDDI_VISTASP1)
		SIO_IDEAL_SEND_BACKLOG_QUERY  = _IOR!('t', 123, ULONG),
		SIO_IDEAL_SEND_BACKLOG_CHANGE = _IO!('t', 122),
}
enum {
	MCAST_JOIN_GROUP         = 41,
	MCAST_LEAVE_GROUP        = 42,
	MCAST_BLOCK_SOURCE       = 43,
	MCAST_UNBLOCK_SOURCE     = 44,
	MCAST_JOIN_SOURCE_GROUP  = 45,
	MCAST_LEAVE_SOURCE_GROUP = 46,
}
enum {
	MCAST_INCLUDE = 0,
	MCAST_EXCLUDE
}
alias int MULTICAST_MODE_TYPE;

struct IP_MREQ {
	IN_ADDR imr_multiaddr;
	IN_ADDR imr_interface;
}
alias IP_MREQ* PIP_MREQ;

struct IP_MREQ_SOURCE {
	IN_ADDR imr_multiaddr;
	IN_ADDR imr_sourceaddr;
	IN_ADDR imr_interface;
}
alias IP_MREQ_SOURCE* PIP_MREQ_SOURCE;

struct IP_MSFILTER {
	IN_ADDR imsf_multiaddr;
	IN_ADDR imsf_interface;
	MULTICAST_MODE_TYPE imsf_fmode;
	ULONG imsf_numsrc;
	IN_ADDR[1] imsf_slist;
}
alias IP_MSFILTER* PIP_MSFILTER;

enum {
	IPV6_HOPOPTS          = 1,
	IPV6_HDRINCL          = 2,
	IPV6_UNICAST_HOPS     = 4,
	IPV6_MULTICAST_IF     = 9,
	IPV6_MULTICAST_HOPS   = 10,
	IPV6_MULTICAST_LOOP   = 11,
	IPV6_ADD_MEMBERSHIP   = 12,
	IPV6_JOIN_GROUP       = IPV6_ADD_MEMBERSHIP,
	IPV6_DROP_MEMBERSHIP  = 13,
	IPV6_LEAVE_GROUP      = IPV6_DROP_MEMBERSHIP,
	IPV6_DONTFRAG         = 14,
	IPV6_PKTINFO          = 19,
	IPV6_HOPLIMIT         = 21,
	IPV6_PROTECTION_LEVEL = 23,
	IPV6_RECVIF           = 24,
	IPV6_RECVDSTADDR      = 25,
	IPV6_CHECKSUM         = 26,
	IPV6_V6ONLY           = 27,
	IPV6_IFLIST           = 28,
	IPV6_ADD_IFLIST       = 29,
	IPV6_DEL_IFLIST       = 30,
	IPV6_UNICAST_IF       = 31,
	IPV6_RTHDR            = 32,
	IPV6_RECVRTHDR        = 38,
	IPV6_TCLASS           = 39,
	IPV6_RECVTCLASS       = 40,
}
enum {
	IP_UNSPECIFIED_HOP_LIMIT = -1,
	IP_PROTECTION_LEVEL      = IPV6_PROTECTION_LEVEL,
}
enum {
	PROTECTION_LEVEL_UNRESTRICTED   = 10,
	PROTECTION_LEVEL_EDGERESTRICTED = 20,
	PROTECTION_LEVEL_RESTRICTED     = 30,
}
enum PROTECTION_LEVEL_DEFAULT = cast(UINT)-1;

struct IPV6_MREQ {
	IN6_ADDR ipv6mr_multiaddr;
	ULONG ipv6mr_interface;
}
alias IPV6_MREQ* PIPV6_MREQ;

//(NTDDI_VERSION >= NTDDI_WINXP)
	struct GROUP_REQ {
		ULONG gr_interface;
		SOCKADDR_STORAGE gr_group;
	}
	alias GROUP_REQ* PGROUP_REQ;

	struct GROUP_SOURCE_REQ {
		ULONG gsr_interface;
		SOCKADDR_STORAGE gsr_group;
		SOCKADDR_STORAGE gsr_source;
	}
	alias GROUP_SOURCE_REQ* PGROUP_SOURCE_REQ;

	struct GROUP_FILTER {
		ULONG gf_interface;
		SOCKADDR_STORAGE gf_group;
		MULTICAST_MODE_TYPE gf_fmode;
		ULONG gf_numsrc;
		SOCKADDR_STORAGE[1] gf_slist;
	}
	alias GROUP_FILTER* PGROUP_FILTER;

struct IN_PKTINFO {
	IN_ADDR ipi_addr;
	ULONG ipi_ifindex;
}
alias IN_PKTINFO* PIN_PKTINFO;
static assert(IN_PKTINFO.sizeof == 8);

struct IN6_PKTINFO {
	IN6_ADDR ipi6_addr;
	ULONG ipi6_ifindex;
}
alias IN6_PKTINFO* PIN6_PKTINFO;
static assert(IN6_PKTINFO.sizeof == 20);

enum {
	INET_ADDRSTRLEN  = 22,
	INET6_ADDRSTRLEN = 65,
}
enum {
	TCP_OFFLOAD_NO_PREFERENCE = 0,
	TCP_OFFLOAD_NOT_PREFERRED = 1,
	TCP_OFFLOAD_PREFERRED     = 2,
	TCP_EXPEDITED_1122        = 0x0002,
	TCP_KEEPALIVE             = 3,
	TCP_MAXSEG                = 4,
	TCP_MAXRT                 = 5,
	TCP_STDURG                = 6,
	TCP_NOURG                 = 7,
	TCP_ATMARK                = 8,
	TCP_NOSYNRETRIES          = 9,
	TCP_TIMESTAMPS            = 0,
	TCP_OFFLOAD_PREFERENCE    = 11,
	TCP_CONGESTION_ALGORITHM  = 12,
	TCP_DELAY_FIN_ACK         = 13,
}

}// extern(C)
