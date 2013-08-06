/** nb30.d

Converted from 'nb30.h'.

Version: V7.1
Authors: Koji Kishita
*/
module c.windows.nb30;


import c.windows.windef;


extern(C){

enum {
	NCBNAMSZ = 16,
	MAX_LANA = 254,
}

struct NCB {
	UCHAR ncb_command;
	UCHAR ncb_retcode;
	UCHAR ncb_lsn;
	UCHAR ncb_num;
	PUCHAR ncb_buffer;
	WORD ncb_length;
	UCHAR[NCBNAMSZ] ncb_callname;
	UCHAR[NCBNAMSZ] ncb_name;
	UCHAR ncb_rto;
	UCHAR ncb_sto;
	extern(Windows) void function(NCB*) ncb_post;
	UCHAR ncb_lana_num;
	UCHAR ncb_cmd_cplt;
	version(Win64)
		UCHAR[18] ncb_reserve;
	else
		UCHAR[10] ncb_reserve;
	HANDLE ncb_event;
}
alias NCB* PNCB;

struct ADAPTER_STATUS {
	UCHAR[6] adapter_address;
	UCHAR rev_major;
	UCHAR reserved0;
	UCHAR adapter_type;
	UCHAR rev_minor;
	WORD duration;
	WORD frmr_recv;
	WORD frmr_xmit;

	WORD iframe_recv_err;

	WORD xmit_aborts;
	DWORD xmit_success;
	DWORD recv_success;

	WORD iframe_xmit_err;

	WORD recv_buff_unavail;
	WORD t1_timeouts;
	WORD ti_timeouts;
	DWORD reserved1;
	WORD free_ncbs;
	WORD max_cfg_ncbs;
	WORD max_ncbs;
	WORD xmit_buf_unavail;
	WORD max_dgram_size;
	WORD pending_sess;
	WORD max_cfg_sess;
	WORD max_sess;
	WORD max_sess_pkt_size;
	WORD name_count;
}
alias ADAPTER_STATUS* PADAPTER_STATUS;

struct NAME_BUFFER {
	UCHAR[NCBNAMSZ] name;
	UCHAR name_num;
	UCHAR name_flags;
}
alias NAME_BUFFER* PNAME_BUFFER;

enum {
	NAME_FLAGS_MASK = 0x87,

	GROUP_NAME  = 0x80,
	UNIQUE_NAME = 0x00,

	REGISTERING     = 0x00,
	REGISTERED      = 0x04,
	DEREGISTERED    = 0x05,
	DUPLICATE       = 0x06,
	DUPLICATE_DEREG = 0x07,
}

struct SESSION_HEADER {
	UCHAR sess_name;
	UCHAR num_sess;
	UCHAR rcv_dg_outstanding;
	UCHAR rcv_any_outstanding;
}
alias SESSION_HEADER* PSESSION_HEADER;

struct SESSION_BUFFER {
	UCHAR lsn;
	UCHAR state;
	UCHAR[NCBNAMSZ] local_name;
	UCHAR[NCBNAMSZ] remote_name;
	UCHAR rcvs_outstanding;
	UCHAR sends_outstanding;
}
alias SESSION_BUFFER* PSESSION_BUFFER;

enum {
	LISTEN_OUTSTANDING  = 0x01,
	CALL_PENDING        = 0x02,
	SESSION_ESTABLISHED = 0x03,
	HANGUP_PENDING      = 0x04,
	HANGUP_COMPLETE     = 0x05,
	SESSION_ABORTED     = 0x06,
}

struct LANA_ENUM {
	UCHAR length;
	UCHAR[MAX_LANA + 1] lana;
}
alias LANA_ENUM* PLANA_ENUM;

struct FIND_NAME_HEADER {
	WORD node_count;
	UCHAR reserved;
	UCHAR unique_group;
}
alias FIND_NAME_HEADER* PFIND_NAME_HEADER;

struct FIND_NAME_BUFFER {
	UCHAR length;
	UCHAR access_control;
	UCHAR frame_control;
	UCHAR[6] destination_addr;
	UCHAR[6] source_addr;
	UCHAR[18] routing_info;
}
alias FIND_NAME_BUFFER* PFIND_NAME_BUFFER;

struct ACTION_HEADER {
	ULONG transport_id;
	USHORT action_code;
	USHORT reserved;
}
alias ACTION_HEADER* PACTION_HEADER;

enum immutable(char*) ALL_TRANSPORTS = "M\0\0\0";
enum immutable(char*) MS_NBF = "MNBF";

enum {
	NCBCALL        = 0x10,
	NCBLISTEN      = 0x11,
	NCBHANGUP      = 0x12,
	NCBSEND        = 0x14,
	NCBRECV        = 0x15,
	NCBRECVANY     = 0x16,
	NCBCHAINSEND   = 0x17,
	NCBDGSEND      = 0x20,
	NCBDGRECV      = 0x21,
	NCBDGSENDBC    = 0x22,
	NCBDGRECVBC    = 0x23,
	NCBADDNAME     = 0x30,
	NCBDELNAME     = 0x31,
	NCBRESET       = 0x32,
	NCBASTAT       = 0x33,
	NCBSSTAT       = 0x34,
	NCBCANCEL      = 0x35,
	NCBADDGRNAME   = 0x36,
	NCBENUM        = 0x37,
	NCBUNLINK      = 0x70,
	NCBSENDNA      = 0x71,
	NCBCHAINSENDNA = 0x72,
	NCBLANSTALERT  = 0x73,
	NCBACTION      = 0x77,
	NCBFINDNAME    = 0x78,
	NCBTRACE       = 0x79,

	ASYNCH = 0x80,

	NRC_GOODRET     = 0x00,
	NRC_BUFLEN      = 0x01,
	NRC_ILLCMD      = 0x03,
	NRC_CMDTMO      = 0x05,
	NRC_INCOMP      = 0x06,
	NRC_BADDR       = 0x07,
	NRC_SNUMOUT     = 0x08,
	NRC_NORES       = 0x09,
	NRC_SCLOSED     = 0x0a,
	NRC_CMDCAN      = 0x0b,
	NRC_DUPNAME     = 0x0d,
	NRC_NAMTFUL     = 0x0e,
	NRC_ACTSES      = 0x0f,
	NRC_LOCTFUL     = 0x11,
	NRC_REMTFUL     = 0x12,
	NRC_ILLNN       = 0x13,
	NRC_NOCALL      = 0x14,
	NRC_NOWILD      = 0x15,
	NRC_INUSE       = 0x16,
	NRC_NAMERR      = 0x17,
	NRC_SABORT      = 0x18,
	NRC_NAMCONF     = 0x19,
	NRC_IFBUSY      = 0x21,
	NRC_TOOMANY     = 0x22,
	NRC_BRIDGE      = 0x23,
	NRC_CANOCCR     = 0x24,
	NRC_CANCEL      = 0x26,
	NRC_DUPENV      = 0x30,
	NRC_ENVNOTDEF   = 0x34,
	NRC_OSRESNOTAV  = 0x35,
	NRC_MAXAPPS     = 0x36,
	NRC_NOSAPS      = 0x37,
	NRC_NORESOURCES = 0x38,
	NRC_INVADDRESS  = 0x39,
	NRC_INVDDID     = 0x3B,
	NRC_LOCKFAIL    = 0x3C,
	NRC_OPENERR     = 0x3f,
	NRC_SYSTEM      = 0x40,

	NRC_PENDING     = 0xff
}

export extern(Windows)
UCHAR Netbios(PNCB pncb);

//NCB_POST void CALLBACK

}// extern(C)
