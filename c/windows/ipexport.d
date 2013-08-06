/** ipexport.d

Converted from 'ipexport.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.ipexport;


import c.windows.sdkddkver;
import c.windows.windef;
import c.windows.in6addr;


alias ULONG IPAddr;
alias ULONG IPMask;
alias ULONG IP_STATUS;

alias IN6_ADDR IPv6Addr;

struct IP_OPTION_INFORMATION {
	UCHAR Ttl;
	UCHAR Tos;
	UCHAR Flags;
	UCHAR OptionsSize;
	PUCHAR OptionsData;
}
alias IP_OPTION_INFORMATION* PIP_OPTION_INFORMATION;

version(Win64){
	struct IP_OPTION_INFORMATION32 {
		UCHAR Ttl;
		UCHAR Tos;
		UCHAR Flags;
		UCHAR OptionsSize;
		UCHAR* OptionsData; // POINTER_32
	}
	alias IP_OPTION_INFORMATION32* PIP_OPTION_INFORMATION32;
}

struct ICMP_ECHO_REPLY {
	IPAddr Address;
	ULONG Status;
	ULONG RoundTripTime;
	USHORT DataSize;
	USHORT Reserved;
	PVOID Data;
	IP_OPTION_INFORMATION Options;
}
alias ICMP_ECHO_REPLY* PICMP_ECHO_REPLY;

version(Win64){
	struct ICMP_ECHO_REPLY32 {
		IPAddr Address;
		ULONG Status;
		ULONG RoundTripTime;
		USHORT DataSize;
		USHORT Reserved;
		VOID* Data; // POINTER_32
		IP_OPTION_INFORMATION32 Options;
	}
	alias ICMP_ECHO_REPLY32* PICMP_ECHO_REPLY32;
}

//(NTDDI_VERSION >= NTDDI_WINXP)
	align(1)
	struct IPV6_ADDRESS_EX {
		USHORT sin6_port;
		ULONG sin6_flowinfo;
		USHORT[8] sin6_addr;
		ULONG sin6_scope_id;
	}
	alias IPV6_ADDRESS_EX* PIPV6_ADDRESS_EX;

	struct ICMPV6_ECHO_REPLY_LH {
		IPV6_ADDRESS_EX Address;
		ULONG Status;
		uint RoundTripTime;
	}
	alias ICMPV6_ECHO_REPLY_LH* PICMPV6_ECHO_REPLY_LH;

	alias ICMPV6_ECHO_REPLY_LH ICMPV6_ECHO_REPLY;
	alias ICMPV6_ECHO_REPLY_LH* PICMPV6_ECHO_REPLY;

struct ARP_SEND_REPLY {
	IPAddr DestAddress;
	IPAddr SrcAddress;
}
alias ARP_SEND_REPLY* PARP_SEND_REPLY;

struct TCP_RESERVE_PORT_RANGE {
	USHORT UpperRange;
	USHORT LowerRange;
}
alias TCP_RESERVE_PORT_RANGE* PTCP_RESERVE_PORT_RANGE;

enum MAX_ADAPTER_NAME = 128;

struct IP_ADAPTER_INDEX_MAP {
	ULONG Index;
	WCHAR[MAX_ADAPTER_NAME] Name;
}
alias IP_ADAPTER_INDEX_MAP* PIP_ADAPTER_INDEX_MAP;

struct IP_INTERFACE_INFO {
	LONG NumAdapters;
	IP_ADAPTER_INDEX_MAP[1] Adapter;
}
alias IP_INTERFACE_INFO* PIP_INTERFACE_INFO;

struct IP_UNIDIRECTIONAL_ADAPTER_ADDRESS {
	ULONG NumAdapters;
	IPAddr[1] Address;
}
alias IP_UNIDIRECTIONAL_ADAPTER_ADDRESS* PIP_UNIDIRECTIONAL_ADAPTER_ADDRESS;

struct IP_ADAPTER_ORDER_MAP {
	ULONG NumAdapters;
	ULONG[1] AdapterOrder;
}
alias IP_ADAPTER_ORDER_MAP* PIP_ADAPTER_ORDER_MAP;

struct IP_MCAST_COUNTER_INFO {
	ULONG64 InMcastOctets;
	ULONG64 OutMcastOctets;
	ULONG64 InMcastPkts;
	ULONG64 OutMcastPkts;
}
alias IP_MCAST_COUNTER_INFO* PIP_MCAST_COUNTER_INFO;

enum {
	IP_STATUS_BASE                     = 11000,
	IP_SUCCESS                         = 0,
	IP_BUF_TOO_SMALL                   = IP_STATUS_BASE + 1,
	IP_DEST_NET_UNREACHABLE            = IP_STATUS_BASE + 2,
	IP_DEST_HOST_UNREACHABLE           = IP_STATUS_BASE + 3,
	IP_DEST_PROT_UNREACHABLE           = IP_STATUS_BASE + 4,
	IP_DEST_PORT_UNREACHABLE           = IP_STATUS_BASE + 5,
	IP_NO_RESOURCES                    = IP_STATUS_BASE + 6,
	IP_BAD_OPTION                      = IP_STATUS_BASE + 7,
	IP_HW_ERROR                        = IP_STATUS_BASE + 8,
	IP_PACKET_TOO_BIG                  = IP_STATUS_BASE + 9,
	IP_REQ_TIMED_OUT                   = IP_STATUS_BASE + 10,
	IP_BAD_REQ                         = IP_STATUS_BASE + 11,
	IP_BAD_ROUTE                       = IP_STATUS_BASE + 12,
	IP_TTL_EXPIRED_TRANSIT             = IP_STATUS_BASE + 13,
	IP_TTL_EXPIRED_REASSEM             = IP_STATUS_BASE + 14,
	IP_PARAM_PROBLEM                   = IP_STATUS_BASE + 15,
	IP_SOURCE_QUENCH                   = IP_STATUS_BASE + 16,
	IP_OPTION_TOO_BIG                  = IP_STATUS_BASE + 17,
	IP_BAD_DESTINATION                 = IP_STATUS_BASE + 18,
	IP_DEST_NO_ROUTE                   = IP_STATUS_BASE + 2,
	IP_DEST_ADDR_UNREACHABLE           = IP_STATUS_BASE + 3,
	IP_DEST_PROHIBITED                 = IP_STATUS_BASE + 4,
//	IP_DEST_PORT_UNREACHABLE           = IP_STATUS_BASE + 5, conflict
	IP_HOP_LIMIT_EXCEEDED              = IP_STATUS_BASE + 13,
	IP_REASSEMBLY_TIME_EXCEEDED        = IP_STATUS_BASE + 14,
	IP_PARAMETER_PROBLEM               = IP_STATUS_BASE + 15,
	IP_DEST_UNREACHABLE                = IP_STATUS_BASE + 40,
	IP_TIME_EXCEEDED                   = IP_STATUS_BASE + 41,
	IP_BAD_HEADER                      = IP_STATUS_BASE + 42,
	IP_UNRECOGNIZED_NEXT_HEADER        = IP_STATUS_BASE + 43,
	IP_ICMP_ERROR                      = IP_STATUS_BASE + 44,
	IP_DEST_SCOPE_MISMATCH             = IP_STATUS_BASE + 45,
	IP_ADDR_DELETED                    = IP_STATUS_BASE + 19,
	IP_SPEC_MTU_CHANGE                 = IP_STATUS_BASE + 20,
	IP_MTU_CHANGE                      = IP_STATUS_BASE + 21,
	IP_UNLOAD                          = IP_STATUS_BASE + 22,
	IP_ADDR_ADDED                      = IP_STATUS_BASE + 23,
	IP_MEDIA_CONNECT                   = IP_STATUS_BASE + 24,
	IP_MEDIA_DISCONNECT                = IP_STATUS_BASE + 25,
	IP_BIND_ADAPTER                    = IP_STATUS_BASE + 26,
	IP_UNBIND_ADAPTER                  = IP_STATUS_BASE + 27,
	IP_DEVICE_DOES_NOT_EXIST           = IP_STATUS_BASE + 28,
	IP_DUPLICATE_ADDRESS               = IP_STATUS_BASE + 29,
	IP_INTERFACE_METRIC_CHANGE         = IP_STATUS_BASE + 30,
	IP_RECONFIG_SECFLTR                = IP_STATUS_BASE + 31,
	IP_NEGOTIATING_IPSEC               = IP_STATUS_BASE + 32,
	IP_INTERFACE_WOL_CAPABILITY_CHANGE = IP_STATUS_BASE + 33,
	IP_DUPLICATE_IPADD                 = IP_STATUS_BASE + 34,
	IP_GENERAL_FAILURE                 = IP_STATUS_BASE + 50,
	MAX_IP_STATUS                      = IP_GENERAL_FAILURE,
	IP_PENDING                         = IP_STATUS_BASE + 255,
}
enum {
	IP_FLAG_REVERSE = 0x1,
	IP_FLAG_DF      = 0x2,
}
enum {
	IP_OPT_EOL          = 0,
	IP_OPT_NOP          = 1,
	IP_OPT_SECURITY     = 0x82,
	IP_OPT_LSRR         = 0x83,
	IP_OPT_SSRR         = 0x89,
	IP_OPT_RR           = 0x7,
	IP_OPT_TS           = 0x44,
	IP_OPT_SID          = 0x88,
	IP_OPT_ROUTER_ALERT = 0x94,
}
enum MAX_OPT_SIZE = 40;

enum {
	IOCTL_IP_RTCHANGE_NOTIFY_REQUEST        = 101,
	IOCTL_IP_ADDCHANGE_NOTIFY_REQUEST       = 102,
	IOCTL_ARP_SEND_REQUEST                  = 103,
	IOCTL_IP_INTERFACE_INFO                 = 104,
	IOCTL_IP_GET_BEST_INTERFACE             = 105,
	IOCTL_IP_UNIDIRECTIONAL_ADAPTER_ADDRESS = 106,
}
