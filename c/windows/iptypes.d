/** iptypes.d

Converted from 'iptypes.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.iptypes;


import std.c.time;
import c.windows.sdkddkver;
import c.windows.windef;
import c.windows.nldef;
import c.windows.ws2def;
import c.windows.ifdef;
import c.windows.guiddef;
import c.windows.ipifcons;


extern(C){

enum {
	 MAX_ADAPTER_DESCRIPTION_LENGTH = 128,
	 MAX_ADAPTER_NAME_LENGTH        = 256,
	 MAX_ADAPTER_ADDRESS_LENGTH     = 8,
	 DEFAULT_MINIMUM_ENTITIES       = 32,
	 MAX_HOSTNAME_LEN               = 128,
	 MAX_DOMAIN_NAME_LEN            = 128,
	 MAX_SCOPE_ID_LEN               = 256,
	 MAX_DHCPV6_DUID_LENGTH         = 130,
	 MAX_DNS_SUFFIX_STRING_LENGTH   = 256,
	 BROADCAST_NODETYPE             = 1,
	 PEER_TO_PEER_NODETYPE          = 2,
	 MIXED_NODETYPE                 = 4,
	 HYBRID_NODETYPE                = 8,
}

struct IP_ADDRESS_STRING {
	char[4 * 4] String;
}
alias IP_ADDRESS_STRING* PIP_ADDRESS_STRING;
alias IP_ADDRESS_STRING IP_MASK_STRING;
alias IP_ADDRESS_STRING* PIP_MASK_STRING;

struct IP_ADDR_STRING {
	IP_ADDR_STRING* Next;
	IP_ADDRESS_STRING IpAddress;
	IP_MASK_STRING IpMask;
	DWORD Context;
}
alias IP_ADDR_STRING* PIP_ADDR_STRING;

struct IP_ADAPTER_INFO {
	IP_ADAPTER_INFO* Next;
	DWORD ComboIndex;
	char[MAX_ADAPTER_NAME_LENGTH + 4] AdapterName;
	char[MAX_ADAPTER_DESCRIPTION_LENGTH + 4] Description;
	UINT AddressLength;
	BYTE[MAX_ADAPTER_ADDRESS_LENGTH] Address;
	DWORD Index;
	UINT Type;
	UINT DhcpEnabled;
	PIP_ADDR_STRING CurrentIpAddress;
	IP_ADDR_STRING IpAddressList;
	IP_ADDR_STRING GatewayList;
	IP_ADDR_STRING DhcpServer;
	BOOL HaveWins;
	IP_ADDR_STRING PrimaryWinsServer;
	IP_ADDR_STRING SecondaryWinsServer;
	time_t LeaseObtained;
	time_t LeaseExpires;
}
alias IP_ADAPTER_INFO* PIP_ADAPTER_INFO;


alias NL_PREFIX_ORIGIN IP_PREFIX_ORIGIN;
alias NL_SUFFIX_ORIGIN IP_SUFFIX_ORIGIN;
alias NL_DAD_STATE IP_DAD_STATE;

struct IP_ADAPTER_UNICAST_ADDRESS_LH {
	union {
		ULONGLONG Alignment;
		struct {
			ULONG Length;
			DWORD Flags;
		}
	}
	IP_ADAPTER_UNICAST_ADDRESS_LH* Next;
	SOCKET_ADDRESS Address;
	IP_PREFIX_ORIGIN PrefixOrigin;
	IP_SUFFIX_ORIGIN SuffixOrigin;
	IP_DAD_STATE DadState;
	ULONG ValidLifetime;
	ULONG PreferredLifetime;
	ULONG LeaseLifetime;
	UINT8 OnLinkPrefixLength;
}
alias IP_ADAPTER_UNICAST_ADDRESS_LH* PIP_ADAPTER_UNICAST_ADDRESS_LH;

struct IP_ADAPTER_UNICAST_ADDRESS_XP {
	union {
		ULONGLONG Alignment;
		struct {
			ULONG Length;
			DWORD Flags;
		}
	}
	IP_ADAPTER_UNICAST_ADDRESS_XP* Next;
	SOCKET_ADDRESS Address;
	IP_PREFIX_ORIGIN PrefixOrigin;
	IP_SUFFIX_ORIGIN SuffixOrigin;
	IP_DAD_STATE DadState;
	ULONG ValidLifetime;
	ULONG PreferredLifetime;
	ULONG LeaseLifetime;
}
alias IP_ADAPTER_UNICAST_ADDRESS_XP* PIP_ADAPTER_UNICAST_ADDRESS_XP;

//(NTDDI_VERSION >= NTDDI_VISTA)
	alias IP_ADAPTER_UNICAST_ADDRESS_LH IP_ADAPTER_UNICAST_ADDRESS;
	alias IP_ADAPTER_UNICAST_ADDRESS_LH* PIP_ADAPTER_UNICAST_ADDRESS;

enum {
	 IP_ADAPTER_ADDRESS_DNS_ELIGIBLE = 0x01,
	 IP_ADAPTER_ADDRESS_TRANSIENT    = 0x02,
}

struct IP_ADAPTER_ANYCAST_ADDRESS_XP {
	union {
		ULONGLONG Alignment;
		struct {
			ULONG Length;
			DWORD Flags;
		}
	}
	IP_ADAPTER_ANYCAST_ADDRESS_XP* Next;
	SOCKET_ADDRESS Address;
}
alias IP_ADAPTER_ANYCAST_ADDRESS_XP* PIP_ADAPTER_ANYCAST_ADDRESS_XP;
//(NTDDI_VERSION >= NTDDI_WINXP)
	alias IP_ADAPTER_ANYCAST_ADDRESS_XP IP_ADAPTER_ANYCAST_ADDRESS;
	alias IP_ADAPTER_ANYCAST_ADDRESS_XP* PIP_ADAPTER_ANYCAST_ADDRESS;

struct IP_ADAPTER_MULTICAST_ADDRESS_XP {
	union {
		ULONGLONG Alignment;
		struct {
			ULONG Length;
			DWORD Flags;
		}
	}
	IP_ADAPTER_MULTICAST_ADDRESS_XP* Next;
	SOCKET_ADDRESS Address;
}
alias IP_ADAPTER_MULTICAST_ADDRESS_XP* PIP_ADAPTER_MULTICAST_ADDRESS_XP;
//(NTDDI_VERSION >= NTDDI_WINXP)
	alias IP_ADAPTER_MULTICAST_ADDRESS_XP IP_ADAPTER_MULTICAST_ADDRESS;
	alias IP_ADAPTER_MULTICAST_ADDRESS_XP* PIP_ADAPTER_MULTICAST_ADDRESS;

struct IP_ADAPTER_DNS_SERVER_ADDRESS_XP {
	union {
		ULONGLONG Alignment;
		struct {
			ULONG Length;
			DWORD Reserved;
		}
	}
	IP_ADAPTER_DNS_SERVER_ADDRESS_XP* Next;
	SOCKET_ADDRESS Address;
}
alias IP_ADAPTER_DNS_SERVER_ADDRESS_XP* PIP_ADAPTER_DNS_SERVER_ADDRESS_XP;
//(NTDDI_VERSION >= NTDDI_WINXP)
	alias IP_ADAPTER_DNS_SERVER_ADDRESS_XP IP_ADAPTER_DNS_SERVER_ADDRESS;
	alias IP_ADAPTER_DNS_SERVER_ADDRESS_XP* PIP_ADAPTER_DNS_SERVER_ADDRESS;

struct IP_ADAPTER_WINS_SERVER_ADDRESS_LH {
	union {
		ULONGLONG Alignment;
		struct {
			ULONG Length;
			DWORD Reserved;
		}
	}
	IP_ADAPTER_WINS_SERVER_ADDRESS_LH* Next;
	SOCKET_ADDRESS Address;
}
alias IP_ADAPTER_WINS_SERVER_ADDRESS_LH* PIP_ADAPTER_WINS_SERVER_ADDRESS_LH;
//(NTDDI_VERSION >= NTDDI_VISTA)
	alias IP_ADAPTER_WINS_SERVER_ADDRESS_LH IP_ADAPTER_WINS_SERVER_ADDRESS;
	alias IP_ADAPTER_WINS_SERVER_ADDRESS_LH* PIP_ADAPTER_WINS_SERVER_ADDRESS;

struct IP_ADAPTER_GATEWAY_ADDRESS_LH {
	union {
		ULONGLONG Alignment;
		struct {
			ULONG Length;
			DWORD Reserved;
		}
	}
	IP_ADAPTER_GATEWAY_ADDRESS_LH* Next;
	SOCKET_ADDRESS Address;
}
alias IP_ADAPTER_GATEWAY_ADDRESS_LH* PIP_ADAPTER_GATEWAY_ADDRESS_LH;
//(NTDDI_VERSION >= NTDDI_VISTA)
	alias IP_ADAPTER_GATEWAY_ADDRESS_LH IP_ADAPTER_GATEWAY_ADDRESS;
	alias IP_ADAPTER_GATEWAY_ADDRESS_LH* PIP_ADAPTER_GATEWAY_ADDRESS;

struct IP_ADAPTER_PREFIX_XP {
	union {
		ULONGLONG Alignment;
		struct {
			ULONG Length;
			DWORD Flags;
		}
	}
	IP_ADAPTER_PREFIX_XP* Next;
	SOCKET_ADDRESS Address;
	ULONG PrefixLength;
}
alias IP_ADAPTER_PREFIX_XP* PIP_ADAPTER_PREFIX_XP;
//(NTDDI_VERSION >= NTDDI_WINXP)
	alias IP_ADAPTER_PREFIX_XP IP_ADAPTER_PREFIX;
	alias IP_ADAPTER_PREFIX_XP* PIP_ADAPTER_PREFIX;

struct IP_ADAPTER_DNS_SUFFIX {
	IP_ADAPTER_DNS_SUFFIX* Next;
	WCHAR[MAX_DNS_SUFFIX_STRING_LENGTH] String;
}
alias IP_ADAPTER_DNS_SUFFIX* PIP_ADAPTER_DNS_SUFFIX;

enum {
	 IP_ADAPTER_DDNS_ENABLED               = 0x00000001,
	 IP_ADAPTER_REGISTER_ADAPTER_SUFFIX    = 0x00000002,
	 IP_ADAPTER_DHCP_ENABLED               = 0x00000004,
	 IP_ADAPTER_RECEIVE_ONLY               = 0x00000008,
	 IP_ADAPTER_NO_MULTICAST               = 0x00000010,
	 IP_ADAPTER_IPV6_OTHER_STATEFUL_CONFIG = 0x00000020,
	 IP_ADAPTER_NETBIOS_OVER_TCPIP_ENABLED = 0x00000040,
	 IP_ADAPTER_IPV4_ENABLED               = 0x00000080,
	 IP_ADAPTER_IPV6_ENABLED               = 0x00000100,
	 IP_ADAPTER_IPV6_MANAGE_ADDRESS_CONFIG = 0x00000200,
}

struct IP_ADAPTER_ADDRESSES_LH {
	union {
		ULONGLONG Alignment;
		struct {
			ULONG Length;
			IF_INDEX IfIndex;
		}
	}
	IP_ADAPTER_ADDRESSES_LH* Next;
	PCHAR AdapterName;
	PIP_ADAPTER_UNICAST_ADDRESS_LH FirstUnicastAddress;
	PIP_ADAPTER_ANYCAST_ADDRESS_XP FirstAnycastAddress;
	PIP_ADAPTER_MULTICAST_ADDRESS_XP FirstMulticastAddress;
	PIP_ADAPTER_DNS_SERVER_ADDRESS_XP FirstDnsServerAddress;
	PWCHAR DnsSuffix;
	PWCHAR Description;
	PWCHAR FriendlyName;
	BYTE[MAX_ADAPTER_ADDRESS_LENGTH] PhysicalAddress;
	ULONG PhysicalAddressLength;
	union {
		ULONG Flags;
		/*struct {
			ULONG DdnsEnabled : 1;
			ULONG RegisterAdapterSuffix : 1;
			ULONG Dhcpv4Enabled : 1;
			ULONG ReceiveOnly : 1;
			ULONG NoMulticast : 1;
			ULONG Ipv6OtherStatefulConfig : 1;
			ULONG NetbiosOverTcpipEnabled : 1;
			ULONG Ipv4Enabled : 1;
			ULONG Ipv6Enabled : 1;
			ULONG Ipv6ManagedAddressConfigurationSupported : 1;
		}*/
	}
	ULONG Mtu;
	IFTYPE IfType;
	IF_OPER_STATUS OperStatus;
	IF_INDEX Ipv6IfIndex;
	ULONG[16] ZoneIndices;
	PIP_ADAPTER_PREFIX_XP FirstPrefix;
	ULONG64 TransmitLinkSpeed;
	ULONG64 ReceiveLinkSpeed;
	PIP_ADAPTER_WINS_SERVER_ADDRESS_LH FirstWinsServerAddress;
	PIP_ADAPTER_GATEWAY_ADDRESS_LH FirstGatewayAddress;
	ULONG Ipv4Metric;
	ULONG Ipv6Metric;
	IF_LUID Luid;
	SOCKET_ADDRESS Dhcpv4Server;
	NET_IF_COMPARTMENT_ID CompartmentId;
	NET_IF_NETWORK_GUID NetworkGuid;
	NET_IF_CONNECTION_TYPE ConnectionType;
	TUNNEL_TYPE TunnelType;
	SOCKET_ADDRESS Dhcpv6Server;
	BYTE[MAX_DHCPV6_DUID_LENGTH] Dhcpv6ClientDuid;
	ULONG Dhcpv6ClientDuidLength;
	ULONG Dhcpv6Iaid;
	//(NTDDI_VERSION >= NTDDI_VISTASP1)
		PIP_ADAPTER_DNS_SUFFIX FirstDnsSuffix;
}
alias IP_ADAPTER_ADDRESSES_LH* PIP_ADAPTER_ADDRESSES_LH;

struct IP_ADAPTER_ADDRESSES_XP {
	union {
		ULONGLONG Alignment;
		struct {
			ULONG Length;
			DWORD IfIndex;
		}
	}
	IP_ADAPTER_ADDRESSES_XP* Next;
	PCHAR AdapterName;
	PIP_ADAPTER_UNICAST_ADDRESS_XP FirstUnicastAddress;
	PIP_ADAPTER_ANYCAST_ADDRESS_XP FirstAnycastAddress;
	PIP_ADAPTER_MULTICAST_ADDRESS_XP FirstMulticastAddress;
	PIP_ADAPTER_DNS_SERVER_ADDRESS_XP FirstDnsServerAddress;
	PWCHAR DnsSuffix;
	PWCHAR Description;
	PWCHAR FriendlyName;
	BYTE[MAX_ADAPTER_ADDRESS_LENGTH] PhysicalAddress;
	DWORD PhysicalAddressLength;
	DWORD Flags;
	DWORD Mtu;
	DWORD IfType;
	IF_OPER_STATUS OperStatus;
	DWORD Ipv6IfIndex;
	DWORD[16] ZoneIndices;
	PIP_ADAPTER_PREFIX_XP FirstPrefix;
}
alias IP_ADAPTER_ADDRESSES_XP* PIP_ADAPTER_ADDRESSES_XP;

//(NTDDI_VERSION >= NTDDI_VISTA)
	alias IP_ADAPTER_ADDRESSES_LH IP_ADAPTER_ADDRESSES;
	alias IP_ADAPTER_ADDRESSES_LH* PIP_ADAPTER_ADDRESSES;
//else
//	alias IP_ADAPTER_ADDRESSES_XP IP_ADAPTER_ADDRESSES;
//	alias IP_ADAPTER_ADDRESSES_XP* PIP_ADAPTER_ADDRESSES;

enum {
	 GAA_FLAG_SKIP_UNICAST                = 0x0001,
	 GAA_FLAG_SKIP_ANYCAST                = 0x0002,
	 GAA_FLAG_SKIP_MULTICAST              = 0x0004,
	 GAA_FLAG_SKIP_DNS_SERVER             = 0x0008,
	 GAA_FLAG_INCLUDE_PREFIX              = 0x0010,
	 GAA_FLAG_SKIP_FRIENDLY_NAME          = 0x0020,
	 GAA_FLAG_INCLUDE_WINS_INFO           = 0x0040,
	 GAA_FLAG_INCLUDE_GATEWAYS            = 0x0080,
	 GAA_FLAG_INCLUDE_ALL_INTERFACES      = 0x0100,
	 GAA_FLAG_INCLUDE_ALL_COMPARTMENTS    = 0x0200,
	 GAA_FLAG_INCLUDE_TUNNEL_BINDINGORDER = 0x0400,
}


struct IP_PER_ADAPTER_INFO_W2KSP1 {
	UINT AutoconfigEnabled;
	UINT AutoconfigActive;
	PIP_ADDR_STRING CurrentDnsServer;
	IP_ADDR_STRING DnsServerList;
}
alias IP_PER_ADAPTER_INFO_W2KSP1* PIP_PER_ADAPTER_INFO_W2KSP1;
alias IP_PER_ADAPTER_INFO_W2KSP1 IP_PER_ADAPTER_INFO;
alias IP_PER_ADAPTER_INFO_W2KSP1* PIP_PER_ADAPTER_INFO;

struct FIXED_INFO_W2KSP1 {
	char[MAX_HOSTNAME_LEN + 4] HostName;
	char[MAX_DOMAIN_NAME_LEN + 4] DomainName;
	PIP_ADDR_STRING CurrentDnsServer;
	IP_ADDR_STRING DnsServerList;
	UINT NodeType;
	char[MAX_SCOPE_ID_LEN + 4] ScopeId;
	UINT EnableRouting;
	UINT EnableProxy;
	UINT EnableDns;
}
alias FIXED_INFO_W2KSP1* PFIXED_INFO_W2KSP1;
alias FIXED_INFO_W2KSP1 FIXED_INFO;
alias FIXED_INFO_W2KSP1* PFIXED_INFO;

struct IP_INTERFACE_NAME_INFO_W2KSP1 {
	ULONG Index;
	ULONG MediaType;
	UCHAR ConnectionType;
	UCHAR AccessType;
	GUID DeviceGuid;
	GUID InterfaceGuid;
}
alias IP_INTERFACE_NAME_INFO_W2KSP1* PIP_INTERFACE_NAME_INFO_W2KSP1;
alias IP_INTERFACE_NAME_INFO_W2KSP1 IP_INTERFACE_NAME_INFO;
alias IP_INTERFACE_NAME_INFO_W2KSP1* PIP_INTERFACE_NAME_INFO;

} // extern(C)
