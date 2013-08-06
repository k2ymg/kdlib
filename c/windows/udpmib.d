/** udpmib.d

Converted from 'udpmib.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.udpmib;


import c.windows.windef;
import c.windows.in6addr;


enum TCPIP_OWNING_MODULE_SIZE = 16;

struct MIB_UDPROW {
	DWORD dwLocalAddr;
	DWORD dwLocalPort;
}
alias MIB_UDPROW* PMIB_UDPROW;

struct MIB_UDPTABLE {
	DWORD dwNumEntries;
	MIB_UDPROW[1] table;
}
alias MIB_UDPTABLE* PMIB_UDPTABLE;

struct MIB_UDPROW_OWNER_PID {
	DWORD dwLocalAddr;
	DWORD dwLocalPort;
	DWORD dwOwningPid;
}
alias MIB_UDPROW_OWNER_PID* PMIB_UDPROW_OWNER_PID;

struct MIB_UDPTABLE_OWNER_PID {
	DWORD dwNumEntries;
	MIB_UDPROW_OWNER_PID[1] table;
}
alias MIB_UDPTABLE_OWNER_PID* PMIB_UDPTABLE_OWNER_PID;

struct MIB_UDPROW_OWNER_MODULE {
	DWORD dwLocalAddr;
	DWORD dwLocalPort;
	DWORD dwOwningPid;
	LARGE_INTEGER liCreateTimestamp;
	union {
		//struct {
		//	int SpecificPortBind : 1;
		//}
		int dwFlags;
	}
	ULONGLONG[TCPIP_OWNING_MODULE_SIZE] OwningModuleInfo;
}
alias MIB_UDPROW_OWNER_MODULE* PMIB_UDPROW_OWNER_MODULE;

struct MIB_UDPTABLE_OWNER_MODULE {
	DWORD dwNumEntries;
	MIB_UDPROW_OWNER_MODULE[1] table;
}
alias MIB_UDPTABLE_OWNER_MODULE* PMIB_UDPTABLE_OWNER_MODULE;

struct MIB_UDP6ROW {
	IN6_ADDR dwLocalAddr;
	DWORD dwLocalScopeId;
	DWORD dwLocalPort;
}
alias MIB_UDP6ROW* PMIB_UDP6ROW;

struct MIB_UDP6TABLE {
	DWORD dwNumEntries;
	MIB_UDP6ROW[1] table;
}
alias MIB_UDP6TABLE* PMIB_UDP6TABLE;

struct MIB_UDP6ROW_OWNER_PID {
	UCHAR[16] ucLocalAddr;
	DWORD dwLocalScopeId;
	DWORD dwLocalPort;
	DWORD dwOwningPid;
}
alias MIB_UDP6ROW_OWNER_PID* PMIB_UDP6ROW_OWNER_PID;

struct MIB_UDP6TABLE_OWNER_PID {
	DWORD dwNumEntries;
	MIB_UDP6ROW_OWNER_PID[1] table;
}
alias MIB_UDP6TABLE_OWNER_PID* PMIB_UDP6TABLE_OWNER_PID;

struct MIB_UDP6ROW_OWNER_MODULE {
	UCHAR[16] ucLocalAddr;
	DWORD dwLocalScopeId;
	DWORD dwLocalPort;
	DWORD dwOwningPid;
	LARGE_INTEGER liCreateTimestamp;
	union {
		//struct {
		//	int SpecificPortBind : 1;
		//}
		int dwFlags;
	}
	ULONGLONG[TCPIP_OWNING_MODULE_SIZE] OwningModuleInfo;
}
alias MIB_UDP6ROW_OWNER_MODULE* PMIB_UDP6ROW_OWNER_MODULE;

struct MIB_UDP6TABLE_OWNER_MODULE {
	DWORD dwNumEntries;
	MIB_UDP6ROW_OWNER_MODULE[1] table;
}
alias MIB_UDP6TABLE_OWNER_MODULE* PMIB_UDP6TABLE_OWNER_MODULE;

struct MIB_UDPSTATS {
	DWORD dwInDatagrams;
	DWORD dwNoPorts;
	DWORD dwInErrors;
	DWORD dwOutDatagrams;
	DWORD dwNumAddrs;
}
alias MIB_UDPSTATS* PMIB_UDPSTATS;
