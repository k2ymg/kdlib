/** ifmib.d

Converted from 'ifmib.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.ifmib;


import c.windows.windef;
import c.windows.ifdef;
import c.windows.ipifcons;


struct MIB_IFNUMBER {
	DWORD dwValue;
}
alias MIB_IFNUMBER* PMIB_IFNUMBER;

enum {
	MAXLEN_PHYSADDR        = 8,
	MAXLEN_IFDESCR         = 256,
	MAX_INTERFACE_NAME_LEN = 256,
}

struct MIB_IFROW {
	WCHAR[MAX_INTERFACE_NAME_LEN] wszName;
	IF_INDEX dwIndex;
	IFTYPE dwType;
	DWORD dwMtu;
	DWORD dwSpeed;
	DWORD dwPhysAddrLen;
	UCHAR[MAXLEN_PHYSADDR] bPhysAddr;
	DWORD dwAdminStatus;
	INTERNAL_IF_OPER_STATUS dwOperStatus;
	DWORD dwLastChange;
	DWORD dwInOctets;
	DWORD dwInUcastPkts;
	DWORD dwInNUcastPkts;
	DWORD dwInDiscards;
	DWORD dwInErrors;
	DWORD dwInUnknownProtos;
	DWORD dwOutOctets;
	DWORD dwOutUcastPkts;
	DWORD dwOutNUcastPkts;
	DWORD dwOutDiscards;
	DWORD dwOutErrors;
	DWORD dwOutQLen;
	DWORD dwDescrLen;
	UCHAR[MAXLEN_IFDESCR] bDescr;
}
alias MIB_IFROW* PMIB_IFROW;

struct MIB_IFTABLE {
	DWORD dwNumEntries;
	MIB_IFROW[1] table;
}
alias MIB_IFTABLE* PMIB_IFTABLE;
