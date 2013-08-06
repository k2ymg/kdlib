/** ipmib.d

Converted from 'ipmib.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.ipmib;


import c.windows.sdkddkver;
import c.windows.windef;
import c.windows.ifdef;
import c.windows.ifmib;
import c.windows.nldef;


enum {
	MIB_IPADDR_PRIMARY      = 0x0001,
	MIB_IPADDR_DYNAMIC      = 0x0004,
	MIB_IPADDR_DISCONNECTED = 0x0008,
	MIB_IPADDR_DELETED      = 0x0040,
	MIB_IPADDR_TRANSIENT    = 0x0080,
	MIB_IPADDR_DNS_ELIGIBLE = 0X0100,
}

struct MIB_IPADDRROW_XP {
	DWORD dwAddr;
	IF_INDEX dwIndex;
	DWORD dwMask;
	DWORD dwBCastAddr;
	DWORD dwReasmSize;
	ushort unused1;
	ushort wType;
}
alias MIB_IPADDRROW_XP* PMIB_IPADDRROW_XP;

struct MIB_IPADDRROW_W2K {
	DWORD dwAddr;
	DWORD dwIndex;
	DWORD dwMask;
	DWORD dwBCastAddr;
	DWORD dwReasmSize;
	ushort unused1;
	ushort unused2;
}
alias MIB_IPADDRROW_W2K* PMIB_IPADDRROW_W2K;

//(NTDDI_VERSION >= NTDDI_WINXP)
	alias MIB_IPADDRROW_XP MIB_IPADDRROW;
	alias MIB_IPADDRROW_XP* PMIB_IPADDRROW;
//}else{
//	alias MIB_IPADDRROW_W2K MIB_IPADDRROW;
//	alias MIB_IPADDRROW_W2K* PMIB_IPADDRROW;
//}

struct MIB_IPADDRTABLE {
	DWORD dwNumEntries;
	MIB_IPADDRROW[1] table;
}
alias MIB_IPADDRTABLE* PMIB_IPADDRTABLE;


struct MIB_IPFORWARDNUMBER {
	DWORD dwValue;
}
alias MIB_IPFORWARDNUMBER* PMIB_IPFORWARDNUMBER;

alias NL_ROUTE_PROTOCOL MIB_IPFORWARD_PROTO;

enum MIB_IPFORWARD_TYPE {
	MIB_IPROUTE_TYPE_OTHER    = 1,
	MIB_IPROUTE_TYPE_INVALID  = 2,
	MIB_IPROUTE_TYPE_DIRECT   = 3,
	MIB_IPROUTE_TYPE_INDIRECT = 4,
}

struct MIB_IPFORWARDROW {
	DWORD dwForwardDest;
	DWORD dwForwardMask;
	DWORD dwForwardPolicy;
	DWORD dwForwardNextHop;
	IF_INDEX dwForwardIfIndex;
	union {
		DWORD dwForwardType;
		MIB_IPFORWARD_TYPE ForwardType;
	}
	union {
		DWORD dwForwardProto;
		MIB_IPFORWARD_PROTO ForwardProto;
	}
	DWORD dwForwardAge;
	DWORD dwForwardNextHopAS;
	DWORD dwForwardMetric1;
	DWORD dwForwardMetric2;
	DWORD dwForwardMetric3;
	DWORD dwForwardMetric4;
	DWORD dwForwardMetric5;
}
alias MIB_IPFORWARDROW* PMIB_IPFORWARDROW;

enum {
	MIB_IPROUTE_TYPE_OTHER    = 1,
	MIB_IPROUTE_TYPE_INVALID  = 2,
	MIB_IPROUTE_TYPE_DIRECT   = 3,
	MIB_IPROUTE_TYPE_INDIRECT = 4,
	MIB_IPROUTE_METRIC_UNUSED = cast(DWORD)-1,
}

struct MIB_IPFORWARDTABLE {
	DWORD dwNumEntries;
	MIB_IPFORWARDROW[1] table;
}
alias MIB_IPFORWARDTABLE* PMIB_IPFORWARDTABLE;

enum {
	MIB_IPNET_TYPE_OTHER   = 1,
	MIB_IPNET_TYPE_INVALID = 2,
	MIB_IPNET_TYPE_DYNAMIC = 3,
	MIB_IPNET_TYPE_STATIC  = 4,
}
alias int MIB_IPNET_TYPE;

struct MIB_IPNETROW_LH {
	IF_INDEX dwIndex;
	DWORD dwPhysAddrLen;
	UCHAR[MAXLEN_PHYSADDR] bPhysAddr;
	DWORD dwAddr;
	union {
		DWORD dwType;
		MIB_IPNET_TYPE Type;
	}
}
alias MIB_IPNETROW_LH* PMIB_IPNETROW_LH;

struct MIB_IPNETROW_W2K {
	IF_INDEX dwIndex;
	DWORD dwPhysAddrLen;
	UCHAR[MAXLEN_PHYSADDR] bPhysAddr;
	DWORD dwAddr;
	DWORD dwType;
}
alias MIB_IPNETROW_W2K* PMIB_IPNETROW_W2K;

//(NTDDI_VERSION >= NTDDI_VISTA)
	alias MIB_IPNETROW_LH MIB_IPNETROW;
	alias MIB_IPNETROW_LH* PMIB_IPNETROW;
//}else{
//	alias MIB_IPNETROW_W2K MIB_IPNETROW;
//	alias MIB_IPNETROW_W2K* PMIB_IPNETROW;
//}

struct MIB_IPNETTABLE {
	DWORD dwNumEntries;
	MIB_IPNETROW[1] table;
}
alias MIB_IPNETTABLE* PMIB_IPNETTABLE;

enum {
	MIB_IP_FORWARDING     = 1,
	MIB_IP_NOT_FORWARDING = 2,
}
alias int MIB_IPSTATS_FORWARDING;
alias MIB_IPSTATS_FORWARDING* PMIB_IPSTATS_FORWARDING;

enum {
	MIB_USE_CURRENT_TTL        = cast(DWORD)-1,
	MIB_USE_CURRENT_FORWARDING = cast(DWORD)-1,
}

struct MIB_IPSTATS_LH {
	union {
		DWORD dwForwarding;
		MIB_IPSTATS_FORWARDING Forwarding;
	}
	DWORD dwDefaultTTL;
	DWORD dwInReceives;
	DWORD dwInHdrErrors;
	DWORD dwInAddrErrors;
	DWORD dwForwDatagrams;
	DWORD dwInUnknownProtos;
	DWORD dwInDiscards;
	DWORD dwInDelivers;
	DWORD dwOutRequests;
	DWORD dwRoutingDiscards;
	DWORD dwOutDiscards;
	DWORD dwOutNoRoutes;
	DWORD dwReasmTimeout;
	DWORD dwReasmReqds;
	DWORD dwReasmOks;
	DWORD dwReasmFails;
	DWORD dwFragOks;
	DWORD dwFragFails;
	DWORD dwFragCreates;
	DWORD dwNumIf;
	DWORD dwNumAddr;
	DWORD dwNumRoutes;
}
alias MIB_IPSTATS_LH* PMIB_IPSTATS_LH;

struct MIB_IPSTATS_W2K {
	DWORD dwForwarding;
	DWORD dwDefaultTTL;
	DWORD dwInReceives;
	DWORD dwInHdrErrors;
	DWORD dwInAddrErrors;
	DWORD dwForwDatagrams;
	DWORD dwInUnknownProtos;
	DWORD dwInDiscards;
	DWORD dwInDelivers;
	DWORD dwOutRequests;
	DWORD dwRoutingDiscards;
	DWORD dwOutDiscards;
	DWORD dwOutNoRoutes;
	DWORD dwReasmTimeout;
	DWORD dwReasmReqds;
	DWORD dwReasmOks;
	DWORD dwReasmFails;
	DWORD dwFragOks;
	DWORD dwFragFails;
	DWORD dwFragCreates;
	DWORD dwNumIf;
	DWORD dwNumAddr;
	DWORD dwNumRoutes;
}
alias MIB_IPSTATS_W2K* PMIB_IPSTATS_W2K;

//(NTDDI_VERSION >= NTDDI_VISTA)
	alias MIB_IPSTATS_LH MIB_IPSTATS;
	alias MIB_IPSTATS_LH* PMIB_IPSTATS;

struct MIBICMPSTATS {
	DWORD dwMsgs;
	DWORD dwErrors;
	DWORD dwDestUnreachs;
	DWORD dwTimeExcds;
	DWORD dwParmProbs;
	DWORD dwSrcQuenchs;
	DWORD dwRedirects;
	DWORD dwEchos;
	DWORD dwEchoReps;
	DWORD dwTimestamps;
	DWORD dwTimestampReps;
	DWORD dwAddrMasks;
	DWORD dwAddrMaskReps;
}
alias MIBICMPSTATS* PMIBICMPSTATS;

struct MIBICMPINFO {
	MIBICMPSTATS icmpInStats;
	MIBICMPSTATS icmpOutStats;
}

struct MIB_ICMP {
	MIBICMPINFO stats;
}
alias MIB_ICMP* PMIB_ICMP;

struct MIBICMPSTATS_EX_XPSP1 {
	DWORD dwMsgs;
	DWORD dwErrors;
	DWORD[256] rgdwTypeCount;
}
alias MIBICMPSTATS_EX_XPSP1* PMIBICMPSTATS_EX_XPSP1;
//(NTDDI_VERSION >= NTDDI_WINXPSP1)
	alias MIBICMPSTATS_EX_XPSP1 MIBICMPSTATS_EX;
	alias MIBICMPSTATS_EX_XPSP1* PMIBICMPSTATS_EX;

struct MIB_ICMP_EX_XPSP1 {
	MIBICMPSTATS_EX icmpInStats;
	MIBICMPSTATS_EX icmpOutStats;
}
alias MIB_ICMP_EX_XPSP1* PMIB_ICMP_EX_XPSP1;
//(NTDDI_VERSION >= NTDDI_WINXPSP1)
	alias MIB_ICMP_EX_XPSP1 MIB_ICMP_EX;
	alias MIB_ICMP_EX_XPSP1* PMIB_ICMP_EX;

enum {
	ICMP6_DST_UNREACH          = 1,
	ICMP6_PACKET_TOO_BIG       = 2,
	ICMP6_TIME_EXCEEDED        = 3,
	ICMP6_PARAM_PROB           = 4,
	ICMP6_ECHO_REQUEST         = 128,
	ICMP6_ECHO_REPLY           = 129,
	ICMP6_MEMBERSHIP_QUERY     = 130,
	ICMP6_MEMBERSHIP_REPORT    = 131,
	ICMP6_MEMBERSHIP_REDUCTION = 132,
	ND_ROUTER_SOLICIT          = 133,
	ND_ROUTER_ADVERT           = 134,
	ND_NEIGHBOR_SOLICIT        = 135,
	ND_NEIGHBOR_ADVERT         = 136,
	ND_REDIRECT                = 137,
	ICMP6_V2_MEMBERSHIP_REPORT = 143,
}
alias int ICMP6_TYPE;
alias ICMP6_TYPE* PICMP6_TYPE;

enum ICMP6_INFOMSG_MASK = 0x80;
//	ICMP6_ISTYPEINFORMATIONAL(Type) (((Type) & ICMP6_INFOMSG_MASK) != 0)
//	ICMP6_ISTYPEERROR(Type) (!ICMP6_ISTYPEINFORMATIONAL(Type))

enum {
 ICMP4_ECHO_REPLY        = 0,
 ICMP4_DST_UNREACH       = 3,
 ICMP4_SOURCE_QUENCH     = 4,
 ICMP4_REDIRECT          = 5,
 ICMP4_ECHO_REQUEST      = 8,
 ICMP4_ROUTER_ADVERT     = 9,
 ICMP4_ROUTER_SOLICIT    = 10,
 ICMP4_TIME_EXCEEDED     = 11,
 ICMP4_PARAM_PROB        = 12,
 ICMP4_TIMESTAMP_REQUEST = 13,
 ICMP4_TIMESTAMP_REPLY   = 14,
 ICMP4_MASK_REQUEST      = 17,
 ICMP4_MASK_REPLY        = 18,
}
alias int ICMP4_TYPE;
alias ICMP4_TYPE* PICMP4_TYPE;

//	ICMP4_ISTYPEERROR(Type)  (((Type) == ICMP4_DST_UNREACH) ||  ((Type) == ICMP4_SOURCE_QUENCH) ||  ((Type) == ICMP4_REDIRECT) ||  ((Type) == ICMP4_PARAM_PROB) ||  ((Type) == ICMP4_TIME_EXCEEDED)) 
struct MIB_IPMCAST_OIF_XP {
	DWORD dwOutIfIndex;
	DWORD dwNextHopAddr;
	DWORD dwReserved;
	DWORD dwReserved1;
}
alias MIB_IPMCAST_OIF_XP* PMIB_IPMCAST_OIF_XP ;

struct MIB_IPMCAST_OIF_W2K {
	DWORD dwOutIfIndex;
	DWORD dwNextHopAddr;
	PVOID pvReserved;
	DWORD dwReserved;
}
alias MIB_IPMCAST_OIF_W2K* PMIB_IPMCAST_OIF_W2K;

//(NTDDI_VERSION >= NTDDI_WINXP)
	alias MIB_IPMCAST_OIF_XP MIB_IPMCAST_OIF;
	alias MIB_IPMCAST_OIF_XP* PMIB_IPMCAST_OIF;


struct MIB_IPMCAST_MFE {
	DWORD dwGroup;
	DWORD dwSource;
	DWORD dwSrcMask;
	DWORD dwUpStrmNgbr;
	DWORD dwInIfIndex;
	DWORD dwInIfProtocol;
	DWORD dwRouteProtocol;
	DWORD dwRouteNetwork;
	DWORD dwRouteMask;
	ULONG ulUpTime;
	ULONG ulExpiryTime;
	ULONG ulTimeOut;
	ULONG ulNumOutIf;
	DWORD fFlags;
	DWORD dwReserved;
	MIB_IPMCAST_OIF[1] rgmioOutInfo;
}
alias MIB_IPMCAST_MFE* PMIB_IPMCAST_MFE;

struct MIB_MFE_TABLE {
	DWORD dwNumEntries;
	MIB_IPMCAST_MFE[1] table;
}
alias MIB_MFE_TABLE* PMIB_MFE_TABLE;

struct MIB_IPMCAST_OIF_STATS_LH {
	DWORD dwOutIfIndex;
	DWORD dwNextHopAddr;
	DWORD dwDialContext;
	ULONG ulTtlTooLow;
	ULONG ulFragNeeded;
	ULONG ulOutPackets;
	ULONG ulOutDiscards;
}
alias MIB_IPMCAST_OIF_STATS_LH* PMIB_IPMCAST_OIF_STATS_LH;

struct MIB_IPMCAST_OIF_STATS_W2K {
	DWORD dwOutIfIndex;
	DWORD dwNextHopAddr;
	PVOID pvDialContext;
	ULONG ulTtlTooLow;
	ULONG ulFragNeeded;
	ULONG ulOutPackets;
	ULONG ulOutDiscards;
}
alias MIB_IPMCAST_OIF_STATS_W2K* PMIB_IPMCAST_OIF_STATS_W2K;

//(NTDDI_VERSION >= NTDDI_VISTA)
	alias MIB_IPMCAST_OIF_STATS_LH MIB_IPMCAST_OIF_STATS;
	alias MIB_IPMCAST_OIF_STATS_LH* PMIB_IPMCAST_OIF_STATS;

struct MIB_IPMCAST_MFE_STATS {
	DWORD dwGroup;
	DWORD dwSource;
	DWORD dwSrcMask;
	DWORD dwUpStrmNgbr;
	DWORD dwInIfIndex;
	DWORD dwInIfProtocol;
	DWORD dwRouteProtocol;
	DWORD dwRouteNetwork;
	DWORD dwRouteMask;
	ULONG ulUpTime;
	ULONG ulExpiryTime;
	ULONG ulNumOutIf;
	ULONG ulInPkts;
	ULONG ulInOctets;
	ULONG ulPktsDifferentIf;
	ULONG ulQueueOverflow;
	MIB_IPMCAST_OIF_STATS[1] rgmiosOutStats;
}
alias MIB_IPMCAST_MFE_STATS* PMIB_IPMCAST_MFE_STATS;

struct MIB_MFE_STATS_TABLE {
	DWORD dwNumEntries;
	MIB_IPMCAST_MFE_STATS[1] table;
}
alias MIB_MFE_STATS_TABLE* PMIB_MFE_STATS_TABLE;

struct MIB_IPMCAST_MFE_STATS_EX_XP {
	DWORD dwGroup;
	DWORD dwSource;
	DWORD dwSrcMask;
	DWORD dwUpStrmNgbr;
	DWORD dwInIfIndex;
	DWORD dwInIfProtocol;
	DWORD dwRouteProtocol;
	DWORD dwRouteNetwork;
	DWORD dwRouteMask;
	ULONG ulUpTime;
	ULONG ulExpiryTime;
	ULONG ulNumOutIf;
	ULONG ulInPkts;
	ULONG ulInOctets;
	ULONG ulPktsDifferentIf;
	ULONG ulQueueOverflow;
	ULONG ulUninitMfe;
	ULONG ulNegativeMfe;
	ULONG ulInDiscards;
	ULONG ulInHdrErrors;
	ULONG ulTotalOutPackets;
	MIB_IPMCAST_OIF_STATS[1] rgmiosOutStats;
}
alias MIB_IPMCAST_MFE_STATS_EX_XP* PMIB_IPMCAST_MFE_STATS_EX_XP;
//(NTDDI_VERSION >= NTDDI_WINXP)
	alias MIB_IPMCAST_MFE_STATS_EX_XP MIB_IPMCAST_MFE_STATS_EX;
	alias MIB_IPMCAST_MFE_STATS_EX_XP* PMIB_IPMCAST_MFE_STATS_EX;


struct MIB_MFE_STATS_TABLE_EX_XP {
	DWORD dwNumEntries;
	PMIB_IPMCAST_MFE_STATS_EX_XP[1] table;
}
alias MIB_MFE_STATS_TABLE_EX_XP* PMIB_MFE_STATS_TABLE_EX_XP;

//(NTDDI_VERSION >= NTDDI_WINXP)
	alias MIB_MFE_STATS_TABLE_EX_XP MIB_MFE_STATS_TABLE_EX;
	alias MIB_MFE_STATS_TABLE_EX_XP* PMIB_MFE_STATS_TABLE_EX;


struct MIB_IPMCAST_GLOBAL {
	DWORD dwEnable;
}
alias MIB_IPMCAST_GLOBAL* PMIB_IPMCAST_GLOBAL;

struct MIB_IPMCAST_IF_ENTRY {
	DWORD dwIfIndex;
	DWORD dwTtl;
	DWORD dwProtocol;
	DWORD dwRateLimit;
	ULONG ulInMcastOctets;
	ULONG ulOutMcastOctets;
}
alias MIB_IPMCAST_IF_ENTRY* PMIB_IPMCAST_IF_ENTRY;

struct MIB_IPMCAST_IF_TABLE {
	DWORD dwNumEntries;
	MIB_IPMCAST_IF_ENTRY[1] table;
}
alias MIB_IPMCAST_IF_TABLE* PMIB_IPMCAST_IF_TABLE;
