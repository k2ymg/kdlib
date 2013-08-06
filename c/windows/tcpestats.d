/** tcpestats.d

Converted from 'tcpestats.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.tcpestats;


import c.windows.windef;


enum {
	TcpConnectionEstatsSynOpts,
	TcpConnectionEstatsData,
	TcpConnectionEstatsSndCong,
	TcpConnectionEstatsPath,
	TcpConnectionEstatsSendBuff,
	TcpConnectionEstatsRec,
	TcpConnectionEstatsObsRec,
	TcpConnectionEstatsBandwidth,
	TcpConnectionEstatsFineRtt,
	TcpConnectionEstatsMaximum,
}
alias int TCP_ESTATS_TYPE;
alias TCP_ESTATS_TYPE* PTCP_ESTATS_TYPE;

enum {
	TcpBoolOptDisabled = 0,
	TcpBoolOptEnabled,
	TcpBoolOptUnchanged = -1
}
alias int TCP_BOOLEAN_OPTIONAL;
alias TCP_BOOLEAN_OPTIONAL* PTCP_BOOLEAN_OPTIONAL;

struct TCP_ESTATS_SYN_OPTS_ROS_v0 {
	BOOLEAN ActiveOpen;
	ULONG MssRcvd;
	ULONG MssSent;
}
alias TCP_ESTATS_SYN_OPTS_ROS_v0* PTCP_ESTATS_SYN_OPTS_ROS_v0;

enum {
	TcpErrorNone = 0,
	TcpErrorBelowDataWindow,
	TcpErrorAboveDataWindow,
	TcpErrorBelowAckWindow,
	TcpErrorAboveAckWindow,
	TcpErrorBelowTsWindow,
	TcpErrorAboveTsWindow,
	TcpErrorDataChecksumError,
	TcpErrorDataLengthError,
	TcpErrorMaxSoftError
}
alias int TCP_SOFT_ERROR;
alias TCP_SOFT_ERROR* PTCP_SOFT_ERROR;

struct TCP_ESTATS_DATA_ROD_v0 {
	ULONG64 DataBytesOut;
	ULONG64 DataSegsOut;
	ULONG64 DataBytesIn;
	ULONG64 DataSegsIn;
	ULONG64 SegsOut;
	ULONG64 SegsIn;
	ULONG SoftErrors;
	ULONG SoftErrorReason;
	ULONG SndUna;
	ULONG SndNxt;
	ULONG SndMax;
	ULONG64 ThruBytesAcked;
	ULONG RcvNxt;
	ULONG64 ThruBytesReceived;
}
alias  TCP_ESTATS_DATA_ROD_v0* PTCP_ESTATS_DATA_ROD_v0;

struct TCP_ESTATS_DATA_RW_v0 {
	BOOLEAN EnableCollection;
}
alias TCP_ESTATS_DATA_RW_v0* PTCP_ESTATS_DATA_RW_v0;

struct TCP_ESTATS_SND_CONG_ROD_v0 {
	ULONG SndLimTransRwin;
	ULONG SndLimTimeRwin;
	SIZE_T SndLimBytesRwin;
	ULONG SndLimTransCwnd;
	ULONG SndLimTimeCwnd;
	SIZE_T SndLimBytesCwnd;
	ULONG SndLimTransSnd;
	ULONG SndLimTimeSnd;
	SIZE_T SndLimBytesSnd;
	ULONG SlowStart;
	ULONG CongAvoid;
	ULONG OtherReductions;
	ULONG CurCwnd;
	ULONG MaxSsCwnd;
	ULONG MaxCaCwnd;
	ULONG CurSsthresh;
	ULONG MaxSsthresh;
	ULONG MinSsthresh;
}
alias TCP_ESTATS_SND_CONG_ROD_v0* PTCP_ESTATS_SND_CONG_ROD_v0;

struct TCP_ESTATS_SND_CONG_ROS_v0 {
	ULONG LimCwnd;
}
alias TCP_ESTATS_SND_CONG_ROS_v0* PTCP_ESTATS_SND_CONG_ROS_v0;

struct TCP_ESTATS_SND_CONG_RW_v0 {
	BOOLEAN EnableCollection;
}
alias TCP_ESTATS_SND_CONG_RW_v0* PTCP_ESTATS_SND_CONG_RW_v0;

struct TCP_ESTATS_PATH_ROD_v0 {
	ULONG FastRetran;
	ULONG Timeouts;
	ULONG SubsequentTimeouts;
	ULONG CurTimeoutCount;
	ULONG AbruptTimeouts;
	ULONG PktsRetrans;
	ULONG BytesRetrans;
	ULONG DupAcksIn;
	ULONG SacksRcvd;
	ULONG SackBlocksRcvd;
	ULONG CongSignals;
	ULONG PreCongSumCwnd;
	ULONG PreCongSumRtt;
	ULONG PostCongSumRtt;
	ULONG PostCongCountRtt;
	ULONG EcnSignals;
	ULONG EceRcvd;
	ULONG SendStall;
	ULONG QuenchRcvd;
	ULONG RetranThresh;
	ULONG SndDupAckEpisodes;
	ULONG SumBytesReordered;
	ULONG NonRecovDa;
	ULONG NonRecovDaEpisodes;
	ULONG AckAfterFr;
	ULONG DsackDups;
	ULONG SampleRtt;
	ULONG SmoothedRtt;
	ULONG RttVar;
	ULONG MaxRtt;
	ULONG MinRtt;
	ULONG SumRtt;
	ULONG CountRtt;
	ULONG CurRto;
	ULONG MaxRto;
	ULONG MinRto;
	ULONG CurMss;
	ULONG MaxMss;
	ULONG MinMss;
	ULONG SpuriousRtoDetections;
}
alias TCP_ESTATS_PATH_ROD_v0* PTCP_ESTATS_PATH_ROD_v0;

struct TCP_ESTATS_PATH_RW_v0 {
	BOOLEAN EnableCollection;
}
alias TCP_ESTATS_PATH_RW_v0* PTCP_ESTATS_PATH_RW_v0;

struct TCP_ESTATS_SEND_BUFF_ROD_v0 {
	SIZE_T CurRetxQueue;
	SIZE_T MaxRetxQueue;
	SIZE_T CurAppWQueue;
	SIZE_T MaxAppWQueue;
}
alias TCP_ESTATS_SEND_BUFF_ROD_v0* PTCP_ESTATS_SEND_BUFF_ROD_v0;

struct TCP_ESTATS_SEND_BUFF_RW_v0 {
	BOOLEAN EnableCollection;
}
alias TCP_ESTATS_SEND_BUFF_RW_v0* PTCP_ESTATS_SEND_BUFF_RW_v0;

struct TCP_ESTATS_REC_ROD_v0 {
	ULONG CurRwinSent;
	ULONG MaxRwinSent;
	ULONG MinRwinSent;
	ULONG LimRwin;
	ULONG DupAckEpisodes;
	ULONG DupAcksOut;
	ULONG CeRcvd;
	ULONG EcnSent;
	ULONG EcnNoncesRcvd;
	ULONG CurReasmQueue;
	ULONG MaxReasmQueue;
	SIZE_T CurAppRQueue;
	SIZE_T MaxAppRQueue;
	UCHAR WinScaleSent;
}
alias TCP_ESTATS_REC_ROD_v0* PTCP_ESTATS_REC_ROD_v0;

struct TCP_ESTATS_REC_RW_v0 {
	BOOLEAN EnableCollection;
}
alias TCP_ESTATS_REC_RW_v0* PTCP_ESTATS_REC_RW_v0;

struct TCP_ESTATS_OBS_REC_ROD_v0 {
	ULONG CurRwinRcvd;
	ULONG MaxRwinRcvd;
	ULONG MinRwinRcvd;
	UCHAR WinScaleRcvd;
}
alias TCP_ESTATS_OBS_REC_ROD_v0* PTCP_ESTATS_OBS_REC_ROD_v0;

struct TCP_ESTATS_OBS_REC_RW_v0 {
	BOOLEAN EnableCollection;
}
alias TCP_ESTATS_OBS_REC_RW_v0* PTCP_ESTATS_OBS_REC_RW_v0;

struct TCP_ESTATS_BANDWIDTH_RW_v0 {
	TCP_BOOLEAN_OPTIONAL EnableCollectionOutbound;
	TCP_BOOLEAN_OPTIONAL EnableCollectionInbound;
}
alias TCP_ESTATS_BANDWIDTH_RW_v0* PTCP_ESTATS_BANDWIDTH_RW_v0;

struct TCP_ESTATS_BANDWIDTH_ROD_v0 {
	ULONG64 OutboundBandwidth;
	ULONG64 InboundBandwidth;
	ULONG64 OutboundInstability;
	ULONG64 InboundInstability;
	BOOLEAN OutboundBandwidthPeaked;
	BOOLEAN InboundBandwidthPeaked;
}
alias TCP_ESTATS_BANDWIDTH_ROD_v0* PTCP_ESTATS_BANDWIDTH_ROD_v0;

struct TCP_ESTATS_FINE_RTT_RW_v0 {
	BOOLEAN EnableCollection;
}
alias TCP_ESTATS_FINE_RTT_RW_v0* PTCP_ESTATS_FINE_RTT_RW_v0;

struct TCP_ESTATS_FINE_RTT_ROD_v0 {
	ULONG RttVar;
	ULONG MaxRtt;
	ULONG MinRtt;
	ULONG SumRtt;
}
alias TCP_ESTATS_FINE_RTT_ROD_v0* PTCP_ESTATS_FINE_RTT_ROD_v0;