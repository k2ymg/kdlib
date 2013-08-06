/** iphlpapi.d

Converted from 'iphlpapi.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.iphlpapi;


import c.windows.sdkddkver;
import c.windows.windef;
import c.windows.ifmib;
import c.windows.ipmib;
import c.windows.tcpmib;
import c.windows.iprtrmib;
import c.windows.udpmib;
import c.windows.tcpestats;
import c.windows.ipexport;
import c.windows.iptypes;
import c.windows.winbase;
import c.windows.ws2def;
import c.windows.windns;
import c.windows.ws2ipdef;


extern(C){

export extern(Windows) DWORD GetNumberOfInterfaces(PDWORD pdwNumIf);
export extern(Windows) DWORD GetIfEntry(PMIB_IFROW pIfRow);
export extern(Windows) DWORD GetIfTable(PMIB_IFTABLE pIfTable, PULONG pdwSize, BOOL bOrder );
export extern(Windows) DWORD GetIpAddrTable(PMIB_IPADDRTABLE pIpAddrTable, PULONG pdwSize, BOOL bOrder);
export extern(Windows) ULONG GetIpNetTable(PMIB_IPNETTABLE IpNetTable, PULONG SizePointer, BOOL Order);
export extern(Windows) DWORD GetIpForwardTable(PMIB_IPFORWARDTABLE pIpForwardTable, PULONG pdwSize, BOOL bOrder);
export extern(Windows) ULONG GetTcpTable(PMIB_TCPTABLE TcpTable, PULONG SizePointer, BOOL Order);
export extern(Windows) DWORD GetExtendedTcpTable(PVOID pTcpTable, PDWORD pdwSize, BOOL bOrder, ULONG ulAf, TCP_TABLE_CLASS TableClass, ULONG Reserved);
export extern(Windows) DWORD GetOwnerModuleFromTcpEntry(PMIB_TCPROW_OWNER_MODULE pTcpEntry, TCPIP_OWNER_MODULE_INFO_CLASS Class, PVOID pBuffer, PDWORD pdwSize);
export extern(Windows) ULONG GetUdpTable(PMIB_UDPTABLE UdpTable, PULONG SizePointer, BOOL Order);
export extern(Windows) DWORD GetExtendedUdpTable(PVOID pUdpTable, PDWORD pdwSize, BOOL bOrder, ULONG ulAf, UDP_TABLE_CLASS TableClass, ULONG Reserved);
export extern(Windows) DWORD GetOwnerModuleFromUdpEntry(PMIB_UDPROW_OWNER_MODULE pUdpEntry, TCPIP_OWNER_MODULE_INFO_CLASS Class, PVOID pBuffer, PDWORD pdwSize);
static if(NTDDI_VERSION >= NTDDI_VISTA)
	export extern(Windows) ULONG GetTcpTable2(PMIB_TCPTABLE2 TcpTable, PULONG SizePointer, BOOL Order);

static if(NTDDI_VERSION < NTDDI_VISTA){
	export extern(Windows) DWORD AllocateAndGetTcpExTableFromStack(PVOID* ppTcpTable, BOOL bOrder, HANDLE hHeap, DWORD dwFlags, DWORD dwFamily);
	export extern(Windows) DWORD AllocateAndGetUdpExTableFromStack(PVOID* ppUdpTable, BOOL bOrder, HANDLE hHeap, DWORD dwFlags, DWORD dwFamily);
}
static if(NTDDI_VERSION >= NTDDI_VISTA){
	export extern(Windows) ULONG GetTcp6Table(PMIB_TCP6TABLE TcpTable, PULONG SizePointer, BOOL Order);
	export extern(Windows) ULONG GetTcp6Table2(PMIB_TCP6TABLE2 TcpTable, PULONG SizePointer, BOOL Order);
}
export extern(Windows) ULONG GetPerTcpConnectionEStats(PMIB_TCPROW Row, TCP_ESTATS_TYPE EstatsType, PUCHAR Rw, ULONG RwVersion, ULONG RwSize, PUCHAR Ros, ULONG RosVersion, ULONG RosSize, PUCHAR Rod, ULONG RodVersion, ULONG RodSize);
export extern(Windows) ULONG SetPerTcpConnectionEStats(PMIB_TCPROW Row, TCP_ESTATS_TYPE EstatsType, PUCHAR Rw, ULONG RwVersion, ULONG RwSize, ULONG Offset);
export extern(Windows) ULONG GetPerTcp6ConnectionEStats(PMIB_TCP6ROW Row, TCP_ESTATS_TYPE EstatsType, PUCHAR Rw, ULONG RwVersion, ULONG RwSize, PUCHAR Ros, ULONG RosVersion, ULONG RosSize, PUCHAR Rod, ULONG RodVersion, ULONG RodSize);
export extern(Windows) ULONG SetPerTcp6ConnectionEStats(PMIB_TCP6ROW Row, TCP_ESTATS_TYPE EstatsType, PUCHAR Rw, ULONG RwVersion, ULONG RwSize, ULONG Offset);
export extern(Windows) DWORD GetOwnerModuleFromTcp6Entry(PMIB_TCP6ROW_OWNER_MODULE pTcpEntry, TCPIP_OWNER_MODULE_INFO_CLASS Class, PVOID pBuffer, PDWORD pdwSize);
export extern(Windows) ULONG GetUdp6Table(PMIB_UDP6TABLE Udp6Table, PULONG SizePointer, BOOL Order);
export extern(Windows) DWORD GetOwnerModuleFromUdp6Entry(PMIB_UDP6ROW_OWNER_MODULE pUdpEntry, TCPIP_OWNER_MODULE_INFO_CLASS Class, PVOID pBuffer, PDWORD pdwSize);
export extern(Windows) DWORD GetOwnerModuleFromPidAndInfo(ULONG ulPid, ULONGLONG* pInfo, TCPIP_OWNER_MODULE_INFO_CLASS Class, PVOID pBuffer, PDWORD pdwSize);
export extern(Windows) ULONG GetIpStatistics(PMIB_IPSTATS Statistics);
export extern(Windows) ULONG GetIcmpStatistics(PMIB_ICMP Statistics);
export extern(Windows) ULONG GetTcpStatistics(PMIB_TCPSTATS Statistics);
export extern(Windows) ULONG GetUdpStatistics(PMIB_UDPSTATS Stats);

static if (NTDDI_VERSION >= NTDDI_WINXP){
	export extern(Windows) ULONG GetIpStatisticsEx(PMIB_IPSTATS Statistics, ULONG Family);
	export extern(Windows) ULONG SetIpStatisticsEx(PMIB_IPSTATS Statistics, ULONG Family);
	export extern(Windows) ULONG GetIcmpStatisticsEx(PMIB_ICMP_EX Statistics, ULONG Family);
	export extern(Windows) ULONG GetTcpStatisticsEx(PMIB_TCPSTATS Statistics, ULONG Family);
	export extern(Windows) ULONG GetUdpStatisticsEx(PMIB_UDPSTATS Statistics, ULONG Family);
}
export extern(Windows) DWORD SetIfEntry(PMIB_IFROW pIfRow);
export extern(Windows) DWORD CreateIpForwardEntry(PMIB_IPFORWARDROW pRoute);
export extern(Windows) DWORD SetIpForwardEntry(PMIB_IPFORWARDROW pRoute);
export extern(Windows) DWORD DeleteIpForwardEntry(PMIB_IPFORWARDROW pRoute);
export extern(Windows) DWORD SetIpStatistics(PMIB_IPSTATS pIpStats);
export extern(Windows) DWORD SetIpTTL(UINT nTTL);
export extern(Windows) DWORD CreateIpNetEntry(PMIB_IPNETROW pArpEntry);
export extern(Windows) DWORD SetIpNetEntry(PMIB_IPNETROW pArpEntry);
export extern(Windows) DWORD DeleteIpNetEntry(PMIB_IPNETROW pArpEntry);
export extern(Windows) DWORD FlushIpNetTable(DWORD dwIfIndex);
export extern(Windows) DWORD CreateProxyArpEntry(DWORD dwAddress, DWORD dwMask, DWORD dwIfIndex);
export extern(Windows) DWORD DeleteProxyArpEntry(DWORD dwAddress, DWORD dwMask, DWORD dwIfIndex);
export extern(Windows) DWORD SetTcpEntry(PMIB_TCPROW pTcpRow);
export extern(Windows) DWORD GetInterfaceInfo(PIP_INTERFACE_INFO pIfTable, PULONG dwOutBufLen);
export extern(Windows) DWORD GetUniDirectionalAdapterInfo(PIP_UNIDIRECTIONAL_ADAPTER_ADDRESS pIPIfInfo, PULONG dwOutBufLen);
export extern(Windows) DWORD NhpAllocateAndGetInterfaceInfoFromStack(IP_INTERFACE_NAME_INFO** ppTable, PDWORD pdwCount, BOOL bOrder, HANDLE hHeap, DWORD dwFlags);
export extern(Windows) DWORD GetBestInterface(IPAddr dwDestAddr, PDWORD pdwBestIfIndex);
export extern(Windows) DWORD GetBestInterfaceEx(sockaddr* pDestAddr, PDWORD pdwBestIfIndex);
export extern(Windows) DWORD GetBestRoute(DWORD dwDestAddr, DWORD dwSourceAddr, PMIB_IPFORWARDROW pBestRoute);
export extern(Windows) DWORD NotifyAddrChange(PHANDLE Handle, LPOVERLAPPED overlapped);
export extern(Windows) DWORD NotifyRouteChange(PHANDLE Handle, LPOVERLAPPED overlapped);
export extern(Windows) BOOL CancelIPChangeNotify(LPOVERLAPPED notifyOverlapped);
export extern(Windows) DWORD GetAdapterIndex(LPWSTR AdapterName, PULONG IfIndex);
export extern(Windows) DWORD AddIPAddress(IPAddr Address, IPMask IpMask, DWORD IfIndex, PULONG NTEContext, PULONG NTEInstance);
export extern(Windows) DWORD DeleteIPAddress(ULONG NTEContext);
export extern(Windows) DWORD GetNetworkParams(PFIXED_INFO pFixedInfo, PULONG pOutBufLen);
export extern(Windows) ULONG GetAdaptersInfo(PIP_ADAPTER_INFO AdapterInfo, PULONG SizePointer);
export extern(Windows) PIP_ADAPTER_ORDER_MAP GetAdapterOrderMap();
export extern(Windows) ULONG GetAdaptersAddresses(ULONG Family, ULONG Flags, PVOID Reserved, PIP_ADAPTER_ADDRESSES AdapterAddresses, PULONG SizePointer);
export extern(Windows) DWORD GetPerAdapterInfo(ULONG IfIndex, PIP_PER_ADAPTER_INFO pPerAdapterInfo, PULONG pOutBufLen);
export extern(Windows) DWORD IpReleaseAddress(PIP_ADAPTER_INDEX_MAP AdapterInfo);
export extern(Windows) DWORD IpRenewAddress(PIP_ADAPTER_INDEX_MAP AdapterInfo);
export extern(Windows) DWORD SendARP(IPAddr DestIP, IPAddr SrcIP, PVOID pMacAddr, PULONG PhyAddrLen);
export extern(Windows) BOOL  GetRTTAndHopCount(IPAddr DestIpAddress, PULONG HopCount, ULONG MaxHops, PULONG RTT);
export extern(Windows) DWORD GetFriendlyIfIndex(DWORD IfIndex);
export extern(Windows) DWORD EnableRouter(HANDLE* pHandle, OVERLAPPED* pOverlapped);
export extern(Windows) DWORD UnenableRouter(OVERLAPPED* pOverlapped, LPDWORD lpdwEnableCount);
export extern(Windows) DWORD DisableMediaSense(HANDLE* pHandle, OVERLAPPED* pOverLapped);
export extern(Windows) DWORD RestoreMediaSense(OVERLAPPED* pOverlapped, LPDWORD lpdwEnableCount);
static if(NTDDI_VERSION >= NTDDI_VISTA){
	export extern(Windows) DWORD GetIpErrorString(IP_STATUS ErrorCode, PWSTR Buffer, PDWORD Size);
	export extern(Windows) ULONG ResolveNeighbor(SOCKADDR* NetworkAddress, PVOID PhysicalAddress, PULONG PhysicalAddressLength);
	export extern(Windows) ULONG CreatePersistentTcpPortReservation(USHORT StartPort, USHORT NumberOfPorts, PULONG64 Token);
	export extern(Windows) ULONG CreatePersistentUdpPortReservation(USHORT StartPort, USHORT NumberOfPorts, PULONG64 Token);
	export extern(Windows) ULONG DeletePersistentTcpPortReservation(USHORT StartPort, USHORT NumberOfPorts);
	export extern(Windows) ULONG DeletePersistentUdpPortReservation(USHORT StartPort, USHORT NumberOfPorts);
	export extern(Windows) ULONG LookupPersistentTcpPortReservation(USHORT StartPort, USHORT NumberOfPorts, PULONG64 Token);
	export extern(Windows) ULONG LookupPersistentUdpPortReservation(USHORT StartPort, USHORT NumberOfPorts, PULONG64 Token);
}
//(NTDDI_VERSION >= NTDDI_VISTA)
	enum {
		NET_STRING_IPV4_ADDRESS          = 0x00000001,
		NET_STRING_IPV4_SERVICE          = 0x00000002,
		NET_STRING_IPV4_NETWORK          = 0x00000004,
		NET_STRING_IPV6_ADDRESS          = 0x00000008,
		NET_STRING_IPV6_ADDRESS_NO_SCOPE = 0x00000010,
		NET_STRING_IPV6_SERVICE          = 0x00000020,
		NET_STRING_IPV6_SERVICE_NO_SCOPE = 0x00000040,
		NET_STRING_IPV6_NETWORK          = 0x00000080,
		NET_STRING_NAMED_ADDRESS         = 0x00000100,
		NET_STRING_NAMED_SERVICE         = 0x00000200,
		NET_STRING_IP_ADDRESS            = NET_STRING_IPV4_ADDRESS | NET_STRING_IPV6_ADDRESS,
		NET_STRING_IP_ADDRESS_NO_SCOPE   = NET_STRING_IPV4_ADDRESS | NET_STRING_IPV6_ADDRESS_NO_SCOPE,
		NET_STRING_IP_SERVICE            = NET_STRING_IPV4_SERVICE | NET_STRING_IPV6_SERVICE,
		NET_STRING_IP_SERVICE_NO_SCOPE   = NET_STRING_IPV4_SERVICE | NET_STRING_IPV6_SERVICE_NO_SCOPE,
		NET_STRING_IP_NETWORK            = NET_STRING_IPV4_NETWORK | NET_STRING_IPV6_NETWORK,
		NET_STRING_ANY_ADDRESS           = NET_STRING_NAMED_ADDRESS | NET_STRING_IP_ADDRESS,
		NET_STRING_ANY_ADDRESS_NO_SCOPE  = NET_STRING_NAMED_ADDRESS | NET_STRING_IP_ADDRESS_NO_SCOPE,
		NET_STRING_ANY_SERVICE           = NET_STRING_NAMED_SERVICE | NET_STRING_IP_SERVICE,
		NET_STRING_ANY_SERVICE_NO_SCOPE  = NET_STRING_NAMED_SERVICE | NET_STRING_IP_SERVICE_NO_SCOPE,
	}

	enum {
		NET_ADDRESS_FORMAT_UNSPECIFIED = 0,
		NET_ADDRESS_DNS_NAME,
		NET_ADDRESS_IPV4,
		NET_ADDRESS_IPV6
	}
	alias int NET_ADDRESS_FORMAT;

	struct NET_ADDRESS_INFO {
		NET_ADDRESS_FORMAT Format;
		union {
			struct {
				WCHAR[DNS_MAX_NAME_BUFFER_LENGTH] Address;
				WCHAR[6] Port;
	 		}
			SOCKADDR_IN Ipv4Address;
			SOCKADDR_IN6 Ipv6Address;
			SOCKADDR IpAddress;
		}
	}
	alias NET_ADDRESS_INFO* PNET_ADDRESS_INFO;
static if(NTDDI_VERSION >= NTDDI_VISTA){
	export extern(Windows) DWORD ParseNetworkString(const(WCHAR)* NetworkString, DWORD Types, PNET_ADDRESS_INFO AddressInfo, USHORT* PortNumber, BYTE* PrefixLength);
}

} // extern(C)
