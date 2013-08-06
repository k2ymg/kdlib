/** tcpmib.d

Converted from 'tcpmib.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.tcpmib;


import c.windows.sdkddkver;
import c.windows.windef;
import c.windows.in6addr;


enum TCPIP_OWNING_MODULE_SIZE = 16;

enum {
	MIB_TCP_STATE_CLOSED     = 1,
	MIB_TCP_STATE_LISTEN     = 2,
	MIB_TCP_STATE_SYN_SENT   = 3,
	MIB_TCP_STATE_SYN_RCVD   = 4,
	MIB_TCP_STATE_ESTAB      = 5,
	MIB_TCP_STATE_FIN_WAIT1  = 6,
	MIB_TCP_STATE_FIN_WAIT2  = 7,
	MIB_TCP_STATE_CLOSE_WAIT = 8,
	MIB_TCP_STATE_CLOSING    = 9,
	MIB_TCP_STATE_LAST_ACK   = 10,
	MIB_TCP_STATE_TIME_WAIT  = 11,
	MIB_TCP_STATE_DELETE_TCB = 12,
}
alias int MIB_TCP_STATE;

enum {
	TcpConnectionOffloadStateInHost,
	TcpConnectionOffloadStateOffloading,
	TcpConnectionOffloadStateOffloaded,
	TcpConnectionOffloadStateUploading,
	TcpConnectionOffloadStateMax
}
alias int TCP_CONNECTION_OFFLOAD_STATE;
alias TCP_CONNECTION_OFFLOAD_STATE* PTCP_CONNECTION_OFFLOAD_STATE;

struct MIB_TCPROW_LH {
	union {
		DWORD dwState;
		MIB_TCP_STATE State;
	}
	DWORD dwLocalAddr;
	DWORD dwLocalPort;
	DWORD dwRemoteAddr;
	DWORD dwRemotePort;
}
alias MIB_TCPROW_LH* PMIB_TCPROW_LH;

struct MIB_TCPROW_W2K {
	DWORD dwState;
	DWORD dwLocalAddr;
	DWORD dwLocalPort;
	DWORD dwRemoteAddr;
	DWORD dwRemotePort;
}
alias MIB_TCPROW_W2K* PMIB_TCPROW_W2K;

//(NTDDI_VERSION >= NTDDI_VISTA)
	alias MIB_TCPROW_LH MIB_TCPROW;
	alias MIB_TCPROW_LH* PMIB_TCPROW;
/*(NTDDI_VERSION >= NTDDI_WIN2K)
	alias MIB_TCPROW_W2K MIB_TCPROW;
	alias MIB_TCPROW_W2K* PMIB_TCPROW;
}else{
	alias MIB_TCPROW_LH MIB_TCPROW;
	alias MIB_TCPROW_LH* PMIB_TCPROW;
}*/

struct MIB_TCPTABLE {
	DWORD dwNumEntries;
	MIB_TCPROW[1] table;
}
alias MIB_TCPTABLE* PMIB_TCPTABLE;

struct MIB_TCPROW2 {
	DWORD dwState;
	DWORD dwLocalAddr;
	DWORD dwLocalPort;
	DWORD dwRemoteAddr;
	DWORD dwRemotePort;
	DWORD dwOwningPid;
	TCP_CONNECTION_OFFLOAD_STATE dwOffloadState;
}
alias MIB_TCPROW2* PMIB_TCPROW2;

struct MIB_TCPTABLE2 {
	DWORD dwNumEntries;
	MIB_TCPROW2[1] table;
}
alias MIB_TCPTABLE2* PMIB_TCPTABLE2;

struct MIB_TCPROW_OWNER_PID {
	DWORD dwState;
	DWORD dwLocalAddr;
	DWORD dwLocalPort;
	DWORD dwRemoteAddr;
	DWORD dwRemotePort;
	DWORD dwOwningPid;
}
alias MIB_TCPROW_OWNER_PID* PMIB_TCPROW_OWNER_PID;

struct MIB_TCPTABLE_OWNER_PID {
	DWORD dwNumEntries;
	MIB_TCPROW_OWNER_PID[1] table;
}
alias MIB_TCPTABLE_OWNER_PID* PMIB_TCPTABLE_OWNER_PID;

struct MIB_TCPROW_OWNER_MODULE {
	DWORD dwState;
	DWORD dwLocalAddr;
	DWORD dwLocalPort;
	DWORD dwRemoteAddr;
	DWORD dwRemotePort;
	DWORD dwOwningPid;
	LARGE_INTEGER liCreateTimestamp;
	ULONGLONG[1] OwningModuleInfo;
}
alias MIB_TCPROW_OWNER_MODULE* PMIB_TCPROW_OWNER_MODULE;

struct MIB_TCPTABLE_OWNER_MODULE {
	DWORD dwNumEntries;
	MIB_TCPROW_OWNER_MODULE[1] table;
}
alias MIB_TCPTABLE_OWNER_MODULE* PMIB_TCPTABLE_OWNER_MODULE;

struct MIB_TCP6ROW {
	MIB_TCP_STATE State;
	IN6_ADDR LocalAddr;
	DWORD dwLocalScopeId;
	DWORD dwLocalPort;
	IN6_ADDR RemoteAddr;
	DWORD dwRemoteScopeId;
	DWORD dwRemotePort;
}
alias MIB_TCP6ROW* PMIB_TCP6ROW;

struct MIB_TCP6TABLE {
	DWORD dwNumEntries;
	MIB_TCP6ROW[1] table;
}
alias MIB_TCP6TABLE* PMIB_TCP6TABLE;

struct MIB_TCP6ROW2 {
	IN6_ADDR LocalAddr;
	DWORD dwLocalScopeId;
	DWORD dwLocalPort;
	IN6_ADDR RemoteAddr;
	DWORD dwRemoteScopeId;
	DWORD dwRemotePort;
	MIB_TCP_STATE State;
	DWORD dwOwningPid;
	TCP_CONNECTION_OFFLOAD_STATE dwOffloadState;
}
alias MIB_TCP6ROW2* PMIB_TCP6ROW2;

struct MIB_TCP6TABLE2 {
	DWORD dwNumEntries;
	MIB_TCP6ROW2[1] table;
}
alias MIB_TCP6TABLE2* PMIB_TCP6TABLE2;

struct MIB_TCP6ROW_OWNER_PID {
	UCHAR[16] ucLocalAddr;
	DWORD dwLocalScopeId;
	DWORD dwLocalPort;
	UCHAR[16] ucRemoteAddr;
	DWORD dwRemoteScopeId;
	DWORD dwRemotePort;
	DWORD dwState;
	DWORD dwOwningPid;
}
alias MIB_TCP6ROW_OWNER_PID* PMIB_TCP6ROW_OWNER_PID;

struct MIB_TCP6TABLE_OWNER_PID {
	DWORD dwNumEntries;
	MIB_TCP6ROW_OWNER_PID[1] table;
}
alias MIB_TCP6TABLE_OWNER_PID* PMIB_TCP6TABLE_OWNER_PID;

struct MIB_TCP6ROW_OWNER_MODULE {
	UCHAR[16] ucLocalAddr;
	DWORD dwLocalScopeId;
	DWORD dwLocalPort;
	UCHAR[16] ucRemoteAddr;
	DWORD dwRemoteScopeId;
	DWORD dwRemotePort;
	DWORD dwState;
	DWORD dwOwningPid;
	LARGE_INTEGER liCreateTimestamp;
	ULONGLONG[TCPIP_OWNING_MODULE_SIZE] OwningModuleInfo;
}
alias MIB_TCP6ROW_OWNER_MODULE* PMIB_TCP6ROW_OWNER_MODULE;

struct MIB_TCP6TABLE_OWNER_MODULE {
	DWORD dwNumEntries;
	MIB_TCP6ROW_OWNER_MODULE[1] table;
}
alias MIB_TCP6TABLE_OWNER_MODULE* PMIB_TCP6TABLE_OWNER_MODULE;

enum MIB_TCP_MAXCONN_DYNAMIC = cast(ULONG)-1;

enum {
	TcpRtoAlgorithmOther,
	TcpRtoAlgorithmConstant,
	TcpRtoAlgorithmRsre,
	TcpRtoAlgorithmVanj,
}
enum {
	MIB_TCP_RTO_OTHER = 1,
	MIB_TCP_RTO_CONSTANT = 2,
	MIB_TCP_RTO_RSRE = 3,
	MIB_TCP_RTO_VANJ = 4,
}
alias int TCP_RTO_ALGORITHM;
alias TCP_RTO_ALGORITHM* PTCP_RTO_ALGORITHM;

struct MIB_TCPSTATS_LH {
	union {
		DWORD dwRtoAlgorithm;
		TCP_RTO_ALGORITHM RtoAlgorithm;
	}
	DWORD dwRtoMin;
	DWORD dwRtoMax;
	DWORD dwMaxConn;
	DWORD dwActiveOpens;
	DWORD dwPassiveOpens;
	DWORD dwAttemptFails;
	DWORD dwEstabResets;
	DWORD dwCurrEstab;
	DWORD dwInSegs;
	DWORD dwOutSegs;
	DWORD dwRetransSegs;
	DWORD dwInErrs;
	DWORD dwOutRsts;
	DWORD dwNumConns;
}
alias MIB_TCPSTATS_LH* PMIB_TCPSTATS_LH;

struct MIB_TCPSTATS_W2K {
	DWORD dwRtoAlgorithm;
	DWORD dwRtoMin;
	DWORD dwRtoMax;
	DWORD dwMaxConn;
	DWORD dwActiveOpens;
	DWORD dwPassiveOpens;
	DWORD dwAttemptFails;
	DWORD dwEstabResets;
	DWORD dwCurrEstab;
	DWORD dwInSegs;
	DWORD dwOutSegs;
	DWORD dwRetransSegs;
	DWORD dwInErrs;
	DWORD dwOutRsts;
	DWORD dwNumConns;
}
alias MIB_TCPSTATS_W2K* PMIB_TCPSTATS_W2K;

//(NTDDI_VERSION >= NTDDI_VISTA)
	alias MIB_TCPSTATS_LH MIB_TCPSTATS;
	alias MIB_TCPSTATS_LH* PMIB_TCPSTATS;
/*}else(NTDDI_VERSION >= NTDDI_WIN2K){
	alias MIB_TCPSTATS_W2K MIB_TCPSTATS;
	alias MIB_TCPSTATS_W2K* PMIB_TCPSTATS;
}*/
