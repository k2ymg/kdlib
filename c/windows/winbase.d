/** winbase.d

Converted from 'winbase.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.winbase;


import c.windows.sdkddkver;
import c.windows.windef;
import c.windows.winnt;
import c.windows.guiddef;
import c.windows.ntstatus;
import std.c.stdarg;


extern(C){

/*
#define DefineHandleTable(w) ((w),TRUE)
#define LimitEmsPages(dw)
#define SetSwapAreaSize(w) (w)
#define LockSegment(w) GlobalFix((HANDLE)(w))
#define UnlockSegment(w) GlobalUnfix((HANDLE)(w))
#define GetCurrentTime() GetTickCount()

#define Yield()
*/

const HANDLE INVALID_HANDLE_VALUE = cast(HANDLE)cast(LONG_PTR)-1;
enum {
	INVALID_FILE_SIZE        = cast(DWORD)0xFFFFFFFF,
	INVALID_SET_FILE_POINTER = cast(DWORD)-1,
	INVALID_FILE_ATTRIBUTES  = cast(DWORD)-1,
}
enum {
	FILE_BEGIN   = 0,
	FILE_CURRENT = 1,
	FILE_END     = 2,
}
enum TIME_ZONE_ID_INVALID = cast(DWORD)0xFFFFFFFF;

enum {
	WAIT_FAILED      = cast(DWORD)0xFFFFFFFF,
	WAIT_OBJECT_0    = STATUS_WAIT_0 + 0,
	WAIT_ABANDONED   = STATUS_ABANDONED_WAIT_0 + 0,
	WAIT_ABANDONED_0 = STATUS_ABANDONED_WAIT_0 + 0,
}

alias STATUS_USER_APC WAIT_IO_COMPLETION;
alias STATUS_PENDING STILL_ACTIVE;
alias STATUS_ACCESS_VIOLATION EXCEPTION_ACCESS_VIOLATION;
alias STATUS_DATATYPE_MISALIGNMENT EXCEPTION_DATATYPE_MISALIGNMENT;
alias STATUS_BREAKPOINT EXCEPTION_BREAKPOINT;
alias STATUS_SINGLE_STEP EXCEPTION_SINGLE_STEP;
alias STATUS_ARRAY_BOUNDS_EXCEEDED EXCEPTION_ARRAY_BOUNDS_EXCEEDED;
alias STATUS_FLOAT_DENORMAL_OPERAND EXCEPTION_FLT_DENORMAL_OPERAND;
alias STATUS_FLOAT_DIVIDE_BY_ZERO EXCEPTION_FLT_DIVIDE_BY_ZERO;
alias STATUS_FLOAT_INEXACT_RESULT EXCEPTION_FLT_INEXACT_RESULT;
alias STATUS_FLOAT_INVALID_OPERATION EXCEPTION_FLT_INVALID_OPERATION;
alias STATUS_FLOAT_OVERFLOW EXCEPTION_FLT_OVERFLOW;
alias STATUS_FLOAT_STACK_CHECK EXCEPTION_FLT_STACK_CHECK;
alias STATUS_FLOAT_UNDERFLOW EXCEPTION_FLT_UNDERFLOW;
alias STATUS_INTEGER_DIVIDE_BY_ZERO EXCEPTION_INT_DIVIDE_BY_ZERO;
alias STATUS_INTEGER_OVERFLOW EXCEPTION_INT_OVERFLOW;
alias STATUS_PRIVILEGED_INSTRUCTION EXCEPTION_PRIV_INSTRUCTION;
alias STATUS_IN_PAGE_ERROR EXCEPTION_IN_PAGE_ERROR;
alias STATUS_ILLEGAL_INSTRUCTION EXCEPTION_ILLEGAL_INSTRUCTION;
alias STATUS_NONCONTINUABLE_EXCEPTION EXCEPTION_NONCONTINUABLE_EXCEPTION;
alias STATUS_STACK_OVERFLOW EXCEPTION_STACK_OVERFLOW;
alias STATUS_INVALID_DISPOSITION EXCEPTION_INVALID_DISPOSITION;
alias STATUS_GUARD_PAGE_VIOLATION EXCEPTION_GUARD_PAGE;
alias STATUS_INVALID_HANDLE EXCEPTION_INVALID_HANDLE;
alias STATUS_POSSIBLE_DEADLOCK EXCEPTION_POSSIBLE_DEADLOCK;
alias STATUS_CONTROL_C_EXIT CONTROL_C_EXIT;

alias RtlMoveMemory MoveMemor;
alias RtlCopyMemory CopyMemory;
alias RtlFillMemory FillMemory;
alias RtlZeroMemory ZeroMemory;
alias RtlSecureZeroMemory SecureZeroMemory;
alias RtlCaptureStackBackTrace CaptureStackBackTrace;

enum {
	FILE_FLAG_WRITE_THROUGH       = 0x80000000,
	FILE_FLAG_OVERLAPPED          = 0x40000000,
	FILE_FLAG_NO_BUFFERING        = 0x20000000,
	FILE_FLAG_RANDOM_ACCESS       = 0x10000000,
	FILE_FLAG_SEQUENTIAL_SCAN     = 0x08000000,
	FILE_FLAG_DELETE_ON_CLOSE     = 0x04000000,
	FILE_FLAG_BACKUP_SEMANTICS    = 0x02000000,
	FILE_FLAG_POSIX_SEMANTICS     = 0x01000000,
	FILE_FLAG_OPEN_REPARSE_POINT  = 0x00200000,
	FILE_FLAG_OPEN_NO_RECALL      = 0x00100000,
	FILE_FLAG_FIRST_PIPE_INSTANCE = 0x00080000,
}

enum {
	CREATE_NEW        = 1,
	CREATE_ALWAYS     = 2,
	OPEN_EXISTING     = 3,
	OPEN_ALWAYS       = 4,
	TRUNCATE_EXISTING = 5,
}

enum {
	PROGRESS_CONTINUE = 0,
	PROGRESS_CANCEL   = 1,
	PROGRESS_STOP     = 2,
	PROGRESS_QUIET    = 3,
}
enum {
	CALLBACK_CHUNK_FINISHED = 0x00000000,
	CALLBACK_STREAM_SWITCH  = 0x00000001,
}
enum {
	COPY_FILE_FAIL_IF_EXISTS              = 0x00000001,
	COPY_FILE_RESTARTABLE                 = 0x00000002,
	COPY_FILE_OPEN_SOURCE_FOR_WRITE       = 0x00000004,
	COPY_FILE_ALLOW_DECRYPTED_DESTINATION = 0x00000008,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		COPY_FILE_COPY_SYMLINK = 0x00000800,
		COPY_FILE_NO_BUFFERING = 0x00001000,
}

enum {
	REPLACEFILE_WRITE_THROUGH       = 0x00000001,
	REPLACEFILE_IGNORE_MERGE_ERRORS = 0x00000002,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		REPLACEFILE_IGNORE_ACL_ERRORS = 0x00000004,
}

enum {
	PIPE_ACCESS_INBOUND  = 0x00000001,
	PIPE_ACCESS_OUTBOUND = 0x00000002,
	PIPE_ACCESS_DUPLEX   = 0x00000003,
}

enum {
	PIPE_CLIENT_END = 0x00000000,
	PIPE_SERVER_END = 0x00000001,
}
enum {
	PIPE_WAIT                  = 0x00000000,
	PIPE_NOWAIT                = 0x00000001,
	PIPE_READMODE_BYTE         = 0x00000000,
	PIPE_READMODE_MESSAGE      = 0x00000002,
	PIPE_TYPE_BYTE             = 0x00000000,
	PIPE_TYPE_MESSAGE          = 0x00000004,
	PIPE_ACCEPT_REMOTE_CLIENTS = 0x00000000,
	PIPE_REJECT_REMOTE_CLIENTS = 0x00000008,
}

enum PIPE_UNLIMITED_INSTANCES = 255;

enum {
	SECURITY_ANONYMOUS        = SecurityAnonymous << 16,
	SECURITY_IDENTIFICATION   = SecurityIdentification << 16,
	SECURITY_IMPERSONATION    = SecurityImpersonation << 16,
	SECURITY_DELEGATION       = SecurityDelegation << 16,
	SECURITY_CONTEXT_TRACKING = 0x00040000,
	SECURITY_EFFECTIVE_ONLY   = 0x00080000,
	SECURITY_SQOS_PRESENT     = 0x00100000,
	SECURITY_VALID_SQOS_FLAGS = 0x001F0000,
}

struct OVERLAPPED {
	ULONG_PTR Internal;
	ULONG_PTR InternalHigh;
	union {
		struct {
			DWORD Offset;
			DWORD OffsetHigh;
		}
		PVOID Pointer;
	}
	HANDLE hEvent;
}
alias OVERLAPPED* LPOVERLAPPED;

struct OVERLAPPED_ENTRY {
	ULONG_PTR lpCompletionKey;
	LPOVERLAPPED lpOverlapped;
	ULONG_PTR Internal;
	DWORD dwNumberOfBytesTransferred;
}
alias OVERLAPPED_ENTRY* LPOVERLAPPED_ENTRY;

struct SECURITY_ATTRIBUTES {
	DWORD nLength;
	LPVOID lpSecurityDescriptor;
	BOOL bInheritHandle;
}
alias SECURITY_ATTRIBUTES* PSECURITY_ATTRIBUTES;
alias SECURITY_ATTRIBUTES* LPSECURITY_ATTRIBUTES;

struct PROCESS_INFORMATION {
	HANDLE hProcess;
	HANDLE hThread;
	DWORD dwProcessId;
	DWORD dwThreadId;
}
alias PROCESS_INFORMATION* PPROCESS_INFORMATION;
alias PROCESS_INFORMATION* LPPROCESS_INFORMATION;

/* defined at windef.d
struct FILETIME {
	DWORD dwLowDateTime;
	DWORD dwHighDateTime;
}
alias FILETIME* PFILETIME;
alias FILETIME* LPFILETIME;
*/

struct SYSTEMTIME {
	WORD wYear;
	WORD wMonth;
	WORD wDayOfWeek;
	WORD wDay;
	WORD wHour;
	WORD wMinute;
	WORD wSecond;
	WORD wMilliseconds;
}
alias SYSTEMTIME* PSYSTEMTIME;
alias SYSTEMTIME* LPSYSTEMTIME;

alias extern(Windows) DWORD function(LPVOID lpThreadParameter) PTHREAD_START_ROUTINE;
alias PTHREAD_START_ROUTINE LPTHREAD_START_ROUTINE;
alias extern(Windows) VOID function(LPVOID lpFiberParameter) PFIBER_START_ROUTINE;
alias PFIBER_START_ROUTINE LPFIBER_START_ROUTINE;

alias RTL_CRITICAL_SECTION CRITICAL_SECTION;
alias PRTL_CRITICAL_SECTION PCRITICAL_SECTION;
alias PRTL_CRITICAL_SECTION LPCRITICAL_SECTION;

alias RTL_CRITICAL_SECTION_DEBUG CRITICAL_SECTION_DEBUG;
alias PRTL_CRITICAL_SECTION_DEBUG PCRITICAL_SECTION_DEBUG;
alias PRTL_CRITICAL_SECTION_DEBUG LPCRITICAL_SECTION_DEBUG;

//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	alias RTL_RUN_ONCE INIT_ONCE;
	alias PRTL_RUN_ONCE PINIT_ONCE;
	alias PRTL_RUN_ONCE LPINIT_ONCE;

	enum {
		INIT_ONCE_STATIC_INIT       = RTL_RUN_ONCE_INIT,
		INIT_ONCE_CHECK_ONLY        = RTL_RUN_ONCE_CHECK_ONLY,
		INIT_ONCE_ASYNC             = RTL_RUN_ONCE_ASYNC,
		INIT_ONCE_INIT_FAILED       = RTL_RUN_ONCE_INIT_FAILED,
		INIT_ONCE_CTX_RESERVED_BITS = RTL_RUN_ONCE_CTX_RESERVED_BITS,
	}

	enum {
		FAIL_FAST_GENERATE_EXCEPTION_ADDRESS = 0x1,
		FAIL_FAST_NO_HARD_ERROR_DLG          = 0x2,
	}

	alias extern(Windows) BOOL function(PINIT_ONCE InitOnce, PVOID Parameter, PVOID* Context) PINIT_ONCE_FN;
static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	export extern(Windows) VOID InitOnceInitialize(PINIT_ONCE InitOnce);
	export extern(Windows) BOOL InitOnceExecuteOnce(PINIT_ONCE InitOnce, PINIT_ONCE_FN InitFn, PVOID Parameter, LPVOID* Context);
	export extern(Windows) BOOL InitOnceBeginInitialize(LPINIT_ONCE lpInitOnce, DWORD dwFlags, PBOOL fPending, LPVOID* lpContext);
	export extern(Windows) BOOL InitOnceComplete(LPINIT_ONCE lpInitOnce, DWORD dwFlags, LPVOID lpContext);
}

alias RTL_SRWLOCK SRWLOCK;
alias SRWLOCK* PSRWLOCK;

//alias RTL_SRWLOCK_INIT SRWLOCK_INIT;

export extern(Windows) VOID InitializeSRWLock(PSRWLOCK SRWLock);
export extern(Windows) VOID ReleaseSRWLockExclusive(PSRWLOCK SRWLock);
export extern(Windows) VOID ReleaseSRWLockShared(PSRWLOCK SRWLock);
export extern(Windows) VOID AcquireSRWLockExclusive(PSRWLOCK SRWLock);
export extern(Windows) VOID AcquireSRWLockShared(PSRWLOCK SRWLock);
export extern(Windows) BOOLEAN TryAcquireSRWLockExclusive(PSRWLOCK SRWLock);
export extern(Windows) BOOLEAN TryAcquireSRWLockShared(PSRWLOCK SRWLock);

alias RTL_CONDITION_VARIABLE CONDITION_VARIABLE;
alias RTL_CONDITION_VARIABLE* PCONDITION_VARIABLE;

export extern(Windows) VOID InitializeConditionVariable(PCONDITION_VARIABLE ConditionVariable);
export extern(Windows) VOID WakeConditionVariable(PCONDITION_VARIABLE ConditionVariable);
export extern(Windows) VOID WakeAllConditionVariable(PCONDITION_VARIABLE ConditionVariable);
export extern(Windows) BOOL SleepConditionVariableCS(PCONDITION_VARIABLE ConditionVariable, PCRITICAL_SECTION CriticalSection, DWORD dwMilliseconds);
export extern(Windows) BOOL SleepConditionVariableSRW(PCONDITION_VARIABLE ConditionVariable, PSRWLOCK SRWLock, DWORD dwMilliseconds, ULONG Flags);

//alias RTL_CONDITION_VARIABLE_INIT CONDITION_VARIABLE_INIT;
//alias RTL_CONDITION_VARIABLE_LOCKMODE_SHARED CONDITION_VARIABLE_LOCKMODE_SHARED;

export extern(Windows) PVOID EncodePointer(PVOID Ptr);
export extern(Windows) PVOID DecodePointer(PVOID Ptr);
export extern(Windows) PVOID EncodeSystemPointer(PVOID Ptr);
export extern(Windows) PVOID DecodeSystemPointer(PVOID Ptr);

alias PLDT_ENTRY LPLDT_ENTRY;

enum {
	MUTEX_MODIFY_STATE = MUTANT_QUERY_STATE,
	MUTEX_ALL_ACCESS   = MUTANT_ALL_ACCESS,
}

enum SP_SERIALCOMM = cast(DWORD)0x00000001;

enum {
	PST_UNSPECIFIED    = 0x00000000,
	PST_RS232          = 0x00000001,
	PST_PARALLELPORT   = 0x00000002,
	PST_RS422          = 0x00000003,
	PST_RS423          = 0x00000004,
	PST_RS449          = 0x00000005,
	PST_MODEM          = 0x00000006,
	PST_FAX            = 0x00000021,
	PST_SCANNER        = 0x00000022,
	PST_NETWORK_BRIDGE = 0x00000100,
	PST_LAT            = 0x00000101,
	PST_TCPIP_TELNET   = 0x00000102,
	PST_X25            = 0x00000103,
}
enum {
	PCF_DTRDSR        = cast(DWORD)0x0001,
	PCF_RTSCTS        = cast(DWORD)0x0002,
	PCF_RLSD          = cast(DWORD)0x0004,
	PCF_PARITY_CHECK  = cast(DWORD)0x0008,
	PCF_XONXOFF       = cast(DWORD)0x0010,
	PCF_SETXCHAR      = cast(DWORD)0x0020,
	PCF_TOTALTIMEOUTS = cast(DWORD)0x0040,
	PCF_INTTIMEOUTS   = cast(DWORD)0x0080,
	PCF_SPECIALCHARS  = cast(DWORD)0x0100,
	PCF_16BITMODE     = cast(DWORD)0x0200,
}
enum {
	SP_PARITY       = cast(DWORD)0x0001,
	SP_BAUD         = cast(DWORD)0x0002,
	SP_DATABITS     = cast(DWORD)0x0004,
	SP_STOPBITS     = cast(DWORD)0x0008,
	SP_HANDSHAKING  = cast(DWORD)0x0010,
	SP_PARITY_CHECK = cast(DWORD)0x0020,
	SP_RLSD         = cast(DWORD)0x0040,
}
enum {
	BAUD_075    = cast(DWORD)0x00000001,
	BAUD_110    = cast(DWORD)0x00000002,
	BAUD_134_5  = cast(DWORD)0x00000004,
	BAUD_150    = cast(DWORD)0x00000008,
	BAUD_300    = cast(DWORD)0x00000010,
	BAUD_600    = cast(DWORD)0x00000020,
	BAUD_1200   = cast(DWORD)0x00000040,
	BAUD_1800   = cast(DWORD)0x00000080,
	BAUD_2400   = cast(DWORD)0x00000100,
	BAUD_4800   = cast(DWORD)0x00000200,
	BAUD_7200   = cast(DWORD)0x00000400,
	BAUD_9600   = cast(DWORD)0x00000800,
	BAUD_14400  = cast(DWORD)0x00001000,
	BAUD_19200  = cast(DWORD)0x00002000,
	BAUD_38400  = cast(DWORD)0x00004000,
	BAUD_56K    = cast(DWORD)0x00008000,
	BAUD_128K   = cast(DWORD)0x00010000,
	BAUD_115200 = cast(DWORD)0x00020000,
	BAUD_57600  = cast(DWORD)0x00040000,
	BAUD_USER   = cast(DWORD)0x10000000,
}
enum {
	DATABITS_5   = 0x0001,
	DATABITS_6   = 0x0002,
	DATABITS_7   = 0x0004,
	DATABITS_8   = 0x0008,
	DATABITS_16  = 0x0010,
	DATABITS_16X = 0x0020,
}
enum {
	STOPBITS_10  = 0x0001,
	STOPBITS_15  = 0x0002,
	STOPBITS_20  = 0x0004,
	PARITY_NONE  = 0x0100,
	PARITY_ODD   = 0x0200,
	PARITY_EVEN  = 0x0400,
	PARITY_MARK  = 0x0800,
	PARITY_SPACE = 0x1000,
}
struct COMMPROP {
	WORD wPacketLength;
	WORD wPacketVersion;
	DWORD dwServiceMask;
	DWORD dwReserved1;
	DWORD dwMaxTxQueue;
	DWORD dwMaxRxQueue;
	DWORD dwMaxBaud;
	DWORD dwProvSubType;
	DWORD dwProvCapabilities;
	DWORD dwSettableParams;
	DWORD dwSettableBaud;
	WORD wSettableData;
	WORD wSettableStopParity;
	DWORD dwCurrentTxQueue;
	DWORD dwCurrentRxQueue;
	DWORD dwProvSpec1;
	DWORD dwProvSpec2;
	WCHAR[1] wcProvChar;
}
alias COMMPROP* LPCOMMPROP;

enum COMMPROP_INITIALIZED = cast(DWORD)0xE73CF52E;

struct COMSTAT {
	DWORD dummy_;
	/*DWORD fCtsHold : 1;
	DWORD fDsrHold : 1;
	DWORD fRlsdHold : 1;
	DWORD fXoffHold : 1;
	DWORD fXoffSent : 1;
	DWORD fEof : 1;
	DWORD fTxim : 1;
	DWORD fReserved : 25;*/
	DWORD cbInQue;
	DWORD cbOutQue;
}
alias COMSTAT* LPCOMSTAT;

enum {
	DTR_CONTROL_DISABLE   = 0x00,
	DTR_CONTROL_ENABLE    = 0x01,
	DTR_CONTROL_HANDSHAKE = 0x02,
}

enum {
	RTS_CONTROL_DISABLE   = 0x00,
	RTS_CONTROL_ENABLE    = 0x01,
	RTS_CONTROL_HANDSHAKE = 0x02,
	RTS_CONTROL_TOGGLE    = 0x03,
}

struct DCB {
	DWORD DCBlength;
	DWORD BaudRate;
	DWORD dummy_;
	/*DWORD fBinary: 1;
	DWORD fParity: 1;
	DWORD fOutxCtsFlow:1;
	DWORD fOutxDsrFlow:1;
	DWORD fDtrControl:2;
	DWORD fDsrSensitivity:1;
	DWORD fTXContinueOnXoff: 1;
	DWORD fOutX: 1;
	DWORD fInX: 1;
	DWORD fErrorChar: 1;
	DWORD fNull: 1;
	DWORD fRtsControl:2;
	DWORD fAbortOnError:1;
	DWORD fDummy2:17;*/
	WORD wReserved;
	WORD XonLim;
	WORD XoffLim;
	BYTE ByteSize;
	BYTE Parity;
	BYTE StopBits;
	char XonChar;
	char XoffChar;
	char ErrorChar;
	char EofChar;
	char EvtChar;
	WORD wReserved1;
}
alias DCB* LPDCB;

struct COMMTIMEOUTS {
	DWORD ReadIntervalTimeout;
	DWORD ReadTotalTimeoutMultiplier;
	DWORD ReadTotalTimeoutConstant;
	DWORD WriteTotalTimeoutMultiplier;
	DWORD WriteTotalTimeoutConstant;
}
alias COMMTIMEOUTS* LPCOMMTIMEOUTS;

struct COMMCONFIG {
	DWORD dwSize;
	WORD wVersion;
	WORD wReserved;
	DCB dcb;
	DWORD dwProviderSubType;
	DWORD dwProviderOffset;
	DWORD dwProviderSize;
	WCHAR[1] wcProviderData;
}
alias COMMCONFIG* LPCOMMCONFIG;

struct SYSTEM_INFO {
	union {
		DWORD dwOemId;
		struct {
			WORD wProcessorArchitecture;
			WORD wReserved;
		}
	}
	DWORD dwPageSize;
	LPVOID lpMinimumApplicationAddress;
	LPVOID lpMaximumApplicationAddress;
	DWORD_PTR dwActiveProcessorMask;
	DWORD dwNumberOfProcessors;
	DWORD dwProcessorType;
	DWORD dwAllocationGranularity;
	WORD wProcessorLevel;
	WORD wProcessorRevision;
}
alias SYSTEM_INFO* LPSYSTEM_INFO;

enum {
	GMEM_FIXED          = 0x0000,
	GMEM_MOVEABLE       = 0x0002,
	GMEM_NOCOMPACT      = 0x0010,
	GMEM_NODISCARD      = 0x0020,
	GMEM_ZEROINIT       = 0x0040,
	GMEM_MODIFY         = 0x0080,
	GMEM_DISCARDABLE    = 0x0100,
	GMEM_NOT_BANKED     = 0x1000,
	GMEM_SHARE          = 0x2000,
	GMEM_DDESHARE       = 0x2000,
	GMEM_NOTIFY         = 0x4000,
	GMEM_LOWER          = GMEM_NOT_BANKED,
	GMEM_VALID_FLAGS    = 0x7F72,
	GMEM_INVALID_HANDLE = 0x8000,
}
enum {
	GHND = GMEM_MOVEABLE | GMEM_ZEROINIT,
	GPTR = GMEM_FIXED | GMEM_ZEROINIT,
}
enum {
	GMEM_DISCARDED = 0x4000,
	GMEM_LOCKCOUNT = 0x00FF,
}

struct MEMORYSTATUS {
	DWORD dwLength;
	DWORD dwMemoryLoad;
	SIZE_T dwTotalPhys;
	SIZE_T dwAvailPhys;
	SIZE_T dwTotalPageFile;
	SIZE_T dwAvailPageFile;
	SIZE_T dwTotalVirtual;
	SIZE_T dwAvailVirtual;
}
alias MEMORYSTATUS* LPMEMORYSTATUS;

enum {
	LMEM_FIXED          = 0x0000,
	LMEM_MOVEABLE       = 0x0002,
	LMEM_NOCOMPACT      = 0x0010,
	LMEM_NODISCARD      = 0x0020,
	LMEM_ZEROINIT       = 0x0040,
	LMEM_MODIFY         = 0x0080,
	LMEM_DISCARDABLE    = 0x0F00,
	LMEM_VALID_FLAGS    = 0x0F72,
	LMEM_INVALID_HANDLE = 0x8000,
}
enum {
	LHND = LMEM_MOVEABLE | LMEM_ZEROINIT,
	LPTR = LMEM_FIXED | LMEM_ZEROINIT,
}
enum {
	NONZEROLHND = LMEM_MOVEABLE,
	NONZEROLPTR = LMEM_FIXED,
}

enum {
	LMEM_DISCARDED = 0x4000,
	LMEM_LOCKCOUNT = 0x00FF,
}
enum NUMA_NO_PREFERRED_NODE = cast(DWORD)-1;

enum {
	DEBUG_PROCESS                     = 0x00000001,
	DEBUG_ONLY_THIS_PROCESS           = 0x00000002,
	CREATE_SUSPENDED                  = 0x00000004,
	DETACHED_PROCESS                  = 0x00000008,
	CREATE_NEW_CONSOLE                = 0x00000010,
	NORMAL_PRIORITY_CLASS             = 0x00000020,
	IDLE_PRIORITY_CLASS               = 0x00000040,
	HIGH_PRIORITY_CLASS               = 0x00000080,
	REALTIME_PRIORITY_CLASS           = 0x00000100,
	CREATE_NEW_PROCESS_GROUP          = 0x00000200,
	CREATE_UNICODE_ENVIRONMENT        = 0x00000400,
	CREATE_SEPARATE_WOW_VDM           = 0x00000800,
	CREATE_SHARED_WOW_VDM             = 0x00001000,
	CREATE_FORCEDOS                   = 0x00002000,
	BELOW_NORMAL_PRIORITY_CLASS       = 0x00004000,
	ABOVE_NORMAL_PRIORITY_CLASS       = 0x00008000,
	INHERIT_PARENT_AFFINITY           = 0x00010000,
	INHERIT_CALLER_PRIORITY           = 0x00020000,
	CREATE_PROTECTED_PROCESS          = 0x00040000,
	EXTENDED_STARTUPINFO_PRESENT      = 0x00080000,
	PROCESS_MODE_BACKGROUND_BEGIN     = 0x00100000,
	PROCESS_MODE_BACKGROUND_END       = 0x00200000,
	CREATE_BREAKAWAY_FROM_JOB         = 0x01000000,
	CREATE_PRESERVE_CODE_AUTHZ_LEVEL  = 0x02000000,
	CREATE_DEFAULT_ERROR_MODE         = 0x04000000,
	CREATE_NO_WINDOW                  = 0x08000000,
	PROFILE_USER                      = 0x10000000,
	PROFILE_KERNEL                    = 0x20000000,
	PROFILE_SERVER                    = 0x40000000,
	CREATE_IGNORE_SYSTEM_DEFAULT      = 0x80000000,
	STACK_SIZE_PARAM_IS_A_RESERVATION = 0x00010000,
}
enum {
	THREAD_PRIORITY_LOWEST        = THREAD_BASE_PRIORITY_MIN,
	THREAD_PRIORITY_BELOW_NORMAL  = THREAD_PRIORITY_LOWEST+1,
	THREAD_PRIORITY_NORMAL        = 0,
	THREAD_PRIORITY_HIGHEST       = THREAD_BASE_PRIORITY_MAX,
	THREAD_PRIORITY_ABOVE_NORMAL  = THREAD_PRIORITY_HIGHEST-1,
	THREAD_PRIORITY_ERROR_RETURN  = MAXLONG,
	THREAD_PRIORITY_TIME_CRITICAL = THREAD_BASE_PRIORITY_LOWRT,
	THREAD_PRIORITY_IDLE          = THREAD_BASE_PRIORITY_IDLE,
}
enum {
	THREAD_MODE_BACKGROUND_BEGIN = 0x00010000,
	THREAD_MODE_BACKGROUND_END   = 0x00020000,
}
enum {
	VOLUME_NAME_DOS  = 0x0,
	VOLUME_NAME_GUID = 0x1,
	VOLUME_NAME_NT   = 0x2,
	VOLUME_NAME_NONE = 0x4,
}
enum {
	FILE_NAME_NORMALIZED = 0x0,
	FILE_NAME_OPENED     = 0x8,
}
enum {
	EXCEPTION_DEBUG_EVENT      = 1,
	CREATE_THREAD_DEBUG_EVENT  = 2,
	CREATE_PROCESS_DEBUG_EVENT = 3,
	EXIT_THREAD_DEBUG_EVENT    = 4,
	EXIT_PROCESS_DEBUG_EVENT   = 5,
	LOAD_DLL_DEBUG_EVENT       = 6,
	UNLOAD_DLL_DEBUG_EVENT     = 7,
	OUTPUT_DEBUG_STRING_EVENT  = 8,
	RIP_EVENT                  = 9,
}

struct EXCEPTION_DEBUG_INFO {
	EXCEPTION_RECORD ExceptionRecord;
	DWORD dwFirstChance;
}
alias EXCEPTION_DEBUG_INFO* LPEXCEPTION_DEBUG_INFO;

struct CREATE_THREAD_DEBUG_INFO {
	HANDLE hThread;
	LPVOID lpThreadLocalBase;
	LPTHREAD_START_ROUTINE lpStartAddress;
}
alias CREATE_THREAD_DEBUG_INFO* LPCREATE_THREAD_DEBUG_INFO;

struct CREATE_PROCESS_DEBUG_INFO {
	HANDLE hFile;
	HANDLE hProcess;
	HANDLE hThread;
	LPVOID lpBaseOfImage;
	DWORD dwDebugInfoFileOffset;
	DWORD nDebugInfoSize;
	LPVOID lpThreadLocalBase;
	LPTHREAD_START_ROUTINE lpStartAddress;
	LPVOID lpImageName;
	WORD fUnicode;
}
alias CREATE_PROCESS_DEBUG_INFO* LPCREATE_PROCESS_DEBUG_INFO;

struct EXIT_THREAD_DEBUG_INFO {
	DWORD dwExitCode;
}
alias EXIT_THREAD_DEBUG_INFO* LPEXIT_THREAD_DEBUG_INFO;

struct EXIT_PROCESS_DEBUG_INFO {
	DWORD dwExitCode;
}
alias EXIT_PROCESS_DEBUG_INFO* LPEXIT_PROCESS_DEBUG_INFO;

struct LOAD_DLL_DEBUG_INFO {
	HANDLE hFile;
	LPVOID lpBaseOfDll;
	DWORD dwDebugInfoFileOffset;
	DWORD nDebugInfoSize;
	LPVOID lpImageName;
	WORD fUnicode;
}
alias LOAD_DLL_DEBUG_INFO* LPLOAD_DLL_DEBUG_INFO;

struct UNLOAD_DLL_DEBUG_INFO {
	LPVOID lpBaseOfDll;
}
alias UNLOAD_DLL_DEBUG_INFO* LPUNLOAD_DLL_DEBUG_INFO;

struct OUTPUT_DEBUG_STRING_INFO {
	LPSTR lpDebugStringData;
	WORD fUnicode;
	WORD nDebugStringLength;
}
alias OUTPUT_DEBUG_STRING_INFO* LPOUTPUT_DEBUG_STRING_INFO;

struct RIP_INFO {
	DWORD dwError;
	DWORD dwType;
}
alias RIP_INFO* LPRIP_INFO;

struct DEBUG_EVENT {
	DWORD dwDebugEventCode;
	DWORD dwProcessId;
	DWORD dwThreadId;
	union {
		EXCEPTION_DEBUG_INFO Exception;
		CREATE_THREAD_DEBUG_INFO CreateThread;
		CREATE_PROCESS_DEBUG_INFO CreateProcessInfo;
		EXIT_THREAD_DEBUG_INFO ExitThread;
		EXIT_PROCESS_DEBUG_INFO ExitProcess;
		LOAD_DLL_DEBUG_INFO LoadDll;
		UNLOAD_DLL_DEBUG_INFO UnloadDll;
		OUTPUT_DEBUG_STRING_INFO DebugString;
		RIP_INFO RipInfo;
	}
}
alias DEBUG_EVENT* LPDEBUG_EVENT;

struct JIT_DEBUG_INFO {
	DWORD dwSize;
	DWORD dwProcessorArchitecture;
	DWORD dwThreadID;
	DWORD dwReserved0;
	ULONG64 lpExceptionAddress;
	ULONG64 lpExceptionRecord;
	ULONG64 lpContextRecord;
}
alias JIT_DEBUG_INFO* LPJIT_DEBUG_INFO;

alias JIT_DEBUG_INFO JIT_DEBUG_INFO32;
alias JIT_DEBUG_INFO32* LPJIT_DEBUG_INFO32;
alias JIT_DEBUG_INFO JIT_DEBUG_INFO64;
alias JIT_DEBUG_INFO64* LPJIT_DEBUG_INFO64;

alias PCONTEXT LPCONTEXT;
alias PEXCEPTION_RECORD LPEXCEPTION_RECORD;
alias PEXCEPTION_POINTERS LPEXCEPTION_POINTERS;

enum {
	DRIVE_UNKNOWN     = 0,
	DRIVE_NO_ROOT_DIR = 1,
	DRIVE_REMOVABLE   = 2,
	DRIVE_FIXED       = 3,
	DRIVE_REMOTE      = 4,
	DRIVE_CDROM       = 5,
	DRIVE_RAMDISK     = 6,
}
enum {
	FILE_TYPE_UNKNOWN = 0x0000,
	FILE_TYPE_DISK    = 0x0001,
	FILE_TYPE_CHAR    = 0x0002,
	FILE_TYPE_PIPE    = 0x0003,
	FILE_TYPE_REMOTE  = 0x8000,
}
enum {
	STD_INPUT_HANDLE  = (DWORD)-10,
	STD_OUTPUT_HANDLE = (DWORD)-11,
	STD_ERROR_HANDLE  = (DWORD)-12,
}
enum {
	NOPARITY    = 0,
	ODDPARITY   = 1,
	EVENPARITY  = 2,
	MARKPARITY  = 3,
	SPACEPARITY = 4,
}
enum {
	ONESTOPBIT   = 0,
	ONE5STOPBITS = 1,
	TWOSTOPBITS  = 2,
}
enum {
	IGNORE   = 0,
	INFINITE = 0xFFFFFFFF,
}
enum {
	CBR_110    = 110,
	CBR_300    = 300,
	CBR_600    = 600,
	CBR_1200   = 1200,
	CBR_2400   = 2400,
	CBR_4800   = 4800,
	CBR_9600   = 9600,
	CBR_14400  = 14400,
	CBR_19200  = 19200,
	CBR_38400  = 38400,
	CBR_56000  = 56000,
	CBR_57600  = 57600,
	CBR_115200 = 115200,
	CBR_128000 = 128000,
	CBR_256000 = 256000,
}
enum {
	CE_RXOVER   = 0x0001,
	CE_OVERRUN  = 0x0002,
	CE_RXPARITY = 0x0004,
	CE_FRAME    = 0x0008,
	CE_BREAK    = 0x0010,
	CE_TXFULL   = 0x0100,
	CE_PTO      = 0x0200,
	CE_IOE      = 0x0400,
	CE_DNS      = 0x0800,
	CE_OOP      = 0x1000,
	CE_MODE     = 0x8000,
}
enum {
	IE_BADID    = -1,
	IE_OPEN     = -2,
	IE_NOPEN    = -3,
	IE_MEMORY   = -4,
	IE_DEFAULT  = -5,
	IE_HARDWARE = -10,
	IE_BYTESIZE = -11,
	IE_BAUDRATE = -12,
}
enum {
	EV_RXCHAR   = 0x0001,
	EV_RXFLAG   = 0x0002,
	EV_TXEMPTY  = 0x0004,
	EV_CTS      = 0x0008,
	EV_DSR      = 0x0010,
	EV_RLSD     = 0x0020,
	EV_BREAK    = 0x0040,
	EV_ERR      = 0x0080,
	EV_RING     = 0x0100,
	EV_PERR     = 0x0200,
	EV_RX80FULL = 0x0400,
	EV_EVENT1   = 0x0800,
	EV_EVENT2   = 0x1000,
}
enum {
	SETXOFF  = 1,
	SETXON   = 2,
	SETRTS   = 3,
	CLRRTS   = 4,
	SETDTR   = 5,
	CLRDTR   = 6,
	RESETDEV = 7,
	SETBREAK = 8,
	CLRBREAK = 9,
}
enum {
	PURGE_TXABORT = 0x0001,
	PURGE_RXABORT = 0x0002,
	PURGE_TXCLEAR = 0x0004,
	PURGE_RXCLEAR = 0x0008,
}

enum LPTx = 0x80;

enum {
	MS_CTS_ON  = 0x0010,
	MS_DSR_ON  = 0x0020,
	MS_RING_ON = 0x0040,
	MS_RLSD_ON = 0x0080,
}
enum {
	S_QUEUEEMPTY   = 0,
	S_THRESHOLD    = 1,
	S_ALLTHRESHOLD = 2,
}
enum {
	S_NORMAL   = 0,
	S_LEGATO   = 1,
	S_STACCATO = 2,
}
enum {
	S_PERIOD512   = 0,
	S_PERIOD1024  = 1,
	S_PERIOD2048  = 2,
	S_PERIODVOICE = 3,
	S_WHITE512    = 4,
	S_WHITE1024   = 5,
	S_WHITE2048   = 6,
	S_WHITEVOICE  = 7,
}
enum {
	S_SERDVNA = -1,
	S_SEROFM  = -2,
	S_SERMACT = -3,
	S_SERQFUL = -4,
	S_SERBDNT = -5,
	S_SERDLN  = -6,
	S_SERDCC  = -7,
	S_SERDTP  = -8,
	S_SERDVL  = -9,
	S_SERDMD  = -10,
	S_SERDSH  = -11,
	S_SERDPT  = -12,
	S_SERDFQ  = -13,
	S_SERDDR  = -14,
	S_SERDSR  = -15,
	S_SERDST  = -16,
}
enum {
	NMPWAIT_WAIT_FOREVER     = 0xffffffff,
	NMPWAIT_NOWAIT           = 0x00000001,
	NMPWAIT_USE_DEFAULT_WAIT = 0x00000000,
}
enum {
	FS_CASE_IS_PRESERVED      = FILE_CASE_PRESERVED_NAMES,
	FS_CASE_SENSITIVE         = FILE_CASE_SENSITIVE_SEARCH,
	FS_UNICODE_STORED_ON_DISK = FILE_UNICODE_ON_DISK,
	FS_PERSISTENT_ACLS        = FILE_PERSISTENT_ACLS,
	FS_VOL_IS_COMPRESSED      = FILE_VOLUME_IS_COMPRESSED,
	FS_FILE_COMPRESSION       = FILE_FILE_COMPRESSION,
	FS_FILE_ENCRYPTION        = FILE_SUPPORTS_ENCRYPTION,
}
enum {
	FILE_MAP_COPY       = SECTION_QUERY,
	FILE_MAP_WRITE      = SECTION_MAP_WRITE,
	FILE_MAP_READ       = SECTION_MAP_READ,
	FILE_MAP_ALL_ACCESS = SECTION_ALL_ACCESS,
	FILE_MAP_EXECUTE    = SECTION_MAP_EXECUTE_EXPLICIT,
}
enum {
	OF_READ             = 0x00000000,
	OF_WRITE            = 0x00000001,
	OF_READWRITE        = 0x00000002,
	OF_SHARE_COMPAT     = 0x00000000,
	OF_SHARE_EXCLUSIVE  = 0x00000010,
	OF_SHARE_DENY_WRITE = 0x00000020,
	OF_SHARE_DENY_READ  = 0x00000030,
	OF_SHARE_DENY_NONE  = 0x00000040,
	OF_PARSE            = 0x00000100,
	OF_DELETE           = 0x00000200,
	OF_VERIFY           = 0x00000400,
	OF_CANCEL           = 0x00000800,
	OF_CREATE           = 0x00001000,
	OF_PROMPT           = 0x00002000,
	OF_EXIST            = 0x00004000,
	OF_REOPEN           = 0x00008000,
}
enum OFS_MAXPATHNAME = 128;
struct OFSTRUCT {
	BYTE cBytes;
	BYTE fFixedDisk;
	WORD nErrCode;
	WORD Reserved1;
	WORD Reserved2;
	CHAR[OFS_MAXPATHNAME] szPathName;
}
alias OFSTRUCT* LPOFSTRUCT;
alias OFSTRUCT* POFSTRUCT;

version(none){ // _M_IA64
	alias _InterlockedIncrement InterlockedIncrement;
	alias _InterlockedIncrement_acq InterlockedIncrementAcquire;
	alias _InterlockedIncrement_rel InterlockedIncrementRelease;
	alias _InterlockedDecrement InterlockedDecrement;
	alias _InterlockedDecrement_acq InterlockedDecrementAcquire;
	alias _InterlockedDecrement_rel InterlockedDecrementRelease;
	alias _InterlockedExchange InterlockedExchange;
	alias _InterlockedExchangeAdd InterlockedExchangeAdd;
	alias _InterlockedCompareExchange InterlockedCompareExchange;
	alias _InterlockedCompareExchange_acq InterlockedCompareExchangeAcquire;
	alias _InterlockedCompareExchange_rel InterlockedCompareExchangeRelease;
	alias _InterlockedExchangePointer InterlockedExchangePointer;
	alias _InterlockedCompareExchangePointer InterlockedCompareExchangePointer;
	alias _InterlockedCompareExchangePointer_rel InterlockedCompareExchangePointerRelease;
	alias _InterlockedCompareExchangePointer_acq InterlockedCompareExchangePointerAcquire;

	alias _InterlockedIncrement64 InterlockedIncrement64;
	alias _InterlockedDecrement64 InterlockedDecrement64;
	alias _InterlockedExchange64 InterlockedExchange64;
	alias _InterlockedExchange64_acq InterlockedExchangeAcquire64;
	alias _InterlockedExchangeAdd64 InterlockedExchangeAdd64;
	alias _InterlockedCompareExchange64 InterlockedCompareExchange64;
	alias _InterlockedCompareExchange64_acq InterlockedCompareExchangeAcquire64;
	alias _InterlockedCompareExchange64_rel InterlockedCompareExchangeRelease64;
	alias _InterlockedCompare64Exchange128 InterlockedCompare64Exchange128;
	alias _InterlockedCompare64Exchange128_acq InterlockedCompare64ExchangeAcquire128;
	alias _InterlockedCompare64Exchange128_rel InterlockedCompare64ExchangeRelease128;

	alias _InterlockedOr InterlockedOr;
	alias _InterlockedOr_acq InterlockedOrAcquire;
	alias _InterlockedOr_rel InterlockedOrRelease;
	alias _InterlockedOr8 InterlockedOr8;
	alias _InterlockedOr8_acq InterlockedOr8Acquire;
	alias _InterlockedOr8_rel InterlockedOr8Release;
	alias _InterlockedOr16 InterlockedOr16;
	alias _InterlockedOr16_acq InterlockedOr16Acquire;
	alias _InterlockedOr16_rel InterlockedOr16Release;
	alias _InterlockedOr64 InterlockedOr64;
	alias _InterlockedOr64_acq InterlockedOr64Acquire;
	alias _InterlockedOr64_rel InterlockedOr64Release;
	alias _InterlockedXor InterlockedXor;
	alias _InterlockedXor_acq InterlockedXorAcquire;
	alias _InterlockedXor_rel InterlockedXorRelease;
	alias _InterlockedXor8 InterlockedXor8;
	alias _InterlockedXor8_acq InterlockedXor8Acquire;
	alias _InterlockedXor8_rel InterlockedXor8Release;
	alias _InterlockedXor16 InterlockedXor16;
	alias _InterlockedXor16_acq InterlockedXor16Acquire;
	alias _InterlockedXor16_rel InterlockedXor16Release;
	alias _InterlockedXor64 InterlockedXor64;
	alias _InterlockedXor64_acq InterlockedXor64Acquire;
	alias _InterlockedXor64_rel InterlockedXor64Release;
	alias _InterlockedAnd InterlockedAnd;
	alias _InterlockedAnd_acq InterlockedAndAcquire;
	alias _InterlockedAnd_rel InterlockedAndRelease;
	alias _InterlockedAnd8 InterlockedAnd8;
	alias _InterlockedAnd8_acq InterlockedAnd8Acquire;
	alias _InterlockedAnd8_rel InterlockedAnd8Release;
	alias _InterlockedAnd16 InterlockedAnd16;
	alias _InterlockedAnd16_acq InterlockedAnd16Acquire;
	alias _InterlockedAnd16_rel InterlockedAnd16Release;
	alias _InterlockedAnd64 InterlockedAnd64;
	alias _InterlockedAnd64_acq InterlockedAnd64Acquire;
	alias _InterlockedAnd64_rel InterlockedAnd64Release;

	extern(C) LONG InterlockedOr(LONG* Destination, LONG Value);
	extern(C) LONG InterlockedOrAcquire(LONG* Destination, LONG Value);
	extern(C) LONG InterlockedOrRelease(LONG* Destination, LONG Value);
	extern(C) char InterlockedOr8(char* Destination, char Value);
	extern(C) char InterlockedOr8Acquire(char* Destination, char Value);
	extern(C) char InterlockedOr8Release(char* Destination, char Value);
	extern(C) SHORT InterlockedOr16(SHORT* Destination, SHORT Value);
	extern(C) SHORT InterlockedOr16Acquire(SHORT* Destination, SHORT Value);
	extern(C) SHORT InterlockedOr16Release(SHORT* Destination, SHORT Value);
	extern(C) LONGLONG InterlockedOr64(LONGLONG* Destination, LONGLONG Value);
	extern(C) LONGLONG InterlockedOr64Acquire(LONGLONG* Destination, LONGLONG Value);
	extern(C) LONGLONG InterlockedOr64Release(LONGLONG* Destination, LONGLONG Value);
	extern(C) LONG InterlockedXor(LONG* Destination, LONG Value);
	extern(C) LONG InterlockedXorAcquire(LONG* Destination, LONG Value);

	extern(C) LONG InterlockedXorRelease(LONG* Destination, LONG Value);
	extern(C) char InterlockedXor8(char* Destination, char Value);
	extern(C) char InterlockedXor8Acquire(char* Destination, char Value);
	extern(C) char InterlockedXor8Release(char* Destination, char Value);
	extern(C) SHORT InterlockedXor16(SHORT* Destination, SHORT Value);
	extern(C) SHORT InterlockedXor16Acquire(SHORT* Destination, SHORT Value);
	extern(C) SHORT InterlockedXor16Release(SHORT* Destination, SHORT Value);
	extern(C) LONGLONG InterlockedXor64(LONGLONG* Destination, LONGLONG Value);
	extern(C) LONGLONG InterlockedXor64Acquire(LONGLONG* Destination, LONGLONG Value);
	extern(C) LONGLONG InterlockedXor64Release(LONGLONG* Destination, LONGLONG Value);
	extern(C) LONG InterlockedAnd(LONG* Destination, LONG Value);
	extern(C) LONG InterlockedAndAcquire(LONG* Destination, LONG Value);
	extern(C) LONG InterlockedAndRelease(LONG* Destination, LONG Value);
	extern(C) char InterlockedAnd8(char* Destination, char Value);
	extern(C) char InterlockedAnd8Acquire(char* Destination, char Value);
	extern(C) char InterlockedAnd8Release(char* Destination, char Value);
	extern(C) SHORT InterlockedAnd16(SHORT* Destination, SHORT Value);
	extern(C) SHORT InterlockedAnd16Acquire(SHORT* Destination, SHORT Value);
	extern(C) SHORT InterlockedAnd16Release(SHORT* Destination, SHORT Value);
	extern(C) LONGLONG InterlockedAnd64(LONGLONG* Destination, LONGLONG Value);
	extern(C) LONGLONG InterlockedAnd64Acquire(LONGLONG* Destination, LONGLONG Value);
	extern(C) LONGLONG InterlockedAnd64Release(LONGLONG* Destination, LONGLONG Value);
	extern(C) LONGLONG InterlockedIncrement64(LONGLONG* Addend);
	extern(C) LONGLONG InterlockedDecrement64(LONGLONG* Addend);
	extern(C) LONG InterlockedIncrementAcquire(LONG* Addend);
	extern(C) LONG InterlockedDecrementAcquire(LONG* Addend);
	extern(C) LONG InterlockedIncrementRelease(LONG* Addend);
	extern(C) LONG InterlockedDecrementRelease(LONG* Addend);
	extern(C) LONGLONG InterlockedExchange64(LONGLONG* Target, LONGLONG Value);
	extern(C) LONGLONG InterlockedExchangeAcquire64(LONGLONG* Target, LONGLONG Value);
	extern(C) LONGLONG InterlockedExchangeAdd64(LONGLONG* Addend, LONGLONG Value);
	extern(C) LONGLONG InterlockedCompareExchange64(LONGLONG* Destination, LONGLONG ExChange, LONGLONG Comperand);
	extern(C) LONGLONG InterlockedCompareExchangeAcquire64(LONGLONG* Destination, LONGLONG ExChange, LONGLONG Comperand);
	extern(C) LONGLONG InterlockedCompareExchangeRelease64(LONGLONG* Destination, LONGLONG ExChange, LONGLONG Comperand);
	extern(C) LONG64 InterlockedCompare64Exchange128(LONG64* Destination, LONG64 ExchangeHigh, LONG64 ExchangeLow, LONG64 Comperand);
	extern(C) LONG64 InterlockedCompare64ExchangeAcquire128(LONG64* Destination, LONG64 ExchangeHigh, LONG64 ExchangeLow, LONG64 Comperand);
	extern(C) LONG64 InterlockedCompare64ExchangeRelease128(LONG64* Destination, LONG64 ExchangeHigh, LONG64 ExchangeLow, LONG64 Comperand);
	extern(C) LONG InterlockedIncrement(LONG* lpAddend);
	extern(C) LONG InterlockedDecrement(LONG* lpAddend);
	extern(C) LONG InterlockedExchange(LONG* Target, LONG Value);
	extern(C) LONG InterlockedExchangeAdd(LONG* Addend, LONG Value);
	extern(C) LONG InterlockedCompareExchange(LONG* Destination, LONG ExChange, LONG Comperand);
	extern(C) LONG InterlockedCompareExchangeRelease(LONG* Destination, LONG ExChange, LONG Comperand);
	extern(C) LONG InterlockedCompareExchangeAcquire(LONG* Destination, LONG ExChange, LONG Comperand);
	extern(C) PVOID InterlockedExchangePointer(PVOID* Target, PVOID Value);
	extern(C) PVOID InterlockedCompareExchangePointer(PVOID* Destination, PVOID ExChange, PVOID Comperand);
	extern(C) PVOID InterlockedCompareExchangePointerAcquire(PVOID* Destination, PVOID Exchange, PVOID Comperand);
	extern(C) PVOID InterlockedCompareExchangePointerRelease(PVOID* Destination, PVOID Exchange, PVOID Comperand);

	alias InterlockedAnd_Inline InterlockedAnd;

	LONG InterlockedAnd_Inline(LONG* Target, LONG Set)
	{
		LONG i;
		LONG j;

		j = *Target;
		do{
			i = j;
			j = InterlockedCompareExchange(Target, i & Set, i);
		}while(i != j);

		return j;
	}

	alias InterlockedOr_Inline InterlockedOr;

	LONG InterlockedOr_Inline(LONG* Target, LONG Set)
	{
		LONG i;
		LONG j;

		j = *Target;
		do{
			i = j;
			j = InterlockedCompareExchange(Target, i | Set, i);
		}while(i != j);

		return j;
	}

	alias InterlockedXor_Inline InterlockedXor;

	LONG InterlockedXor_Inline(LONG* Target, LONG Set)
	{
		LONG i;
		LONG j;

		j = *Target;
		do {
			i = j;
			j = InterlockedCompareExchange(Target, i ^ Set, i);
		}while(i != j);

		return j;
	}

	alias InterlockedAnd64_Inline InterlockedAnd64;
	
	LONGLONG InterlockedAnd64_Inline(LONGLONG* Destination, LONGLONG Value)
	{
		LONGLONG Old;

		do{
			Old = *Destination;
		}while(InterlockedCompareExchange64(Destination, Old & Value, Old) != Old);

		return Old;
	}

	alias InterlockedOr64_Inline InterlockedOr64;

	LONGLONG InterlockedOr64_Inline(LONGLONG* Destination, LONGLONG Value)
	{
		LONGLONG Old;

		do{
			Old = *Destination;
		}while(InterlockedCompareExchange64(Destination, Old | Value, Old) != Old);

		return Old;
	}

	alias InterlockedXor64_Inline InterlockedXor64;

	LONGLONG InterlockedXor64_Inline(LONGLONG* Destination, LONGLONG Value)
	{
		LONGLONG Old;

	 do{
	 	Old = *Destination;
	 }while(InterlockedCompareExchange64(Destination, Old ^ Value, Old) != Old);

		return Old;
	}

	alias InterlockedBitTestAndSet_Inline InterlockedBitTestAndSet;

	BOOLEAN InterlockedBitTestAndSet_Inline(LONG* Base, LONG Bit)
	{
		LONG tBit;

		tBit = 1 << (Bit & ((*Base).sizeof * 8 - 1));
		return cast(BOOLEAN)((InterlockedOr(&Base[Bit / ((*Base).sizeof * 8)], tBit) & tBit) != 0);
	}

	alias InterlockedBitTestAndReset_Inline InterlockedBitTestAndReset;

	BOOLEAN InterlockedBitTestAndReset_Inline(LONG* Base, LONG Bit)
	{
		LONG tBit;

		tBit = 1 << (Bit & ((*Base).sizeof * 8 - 1));
		return cast(BOOLEAN)((InterlockedAnd(&Base[Bit / ((*Base).sizeof * 8)], ~tBit) & tBit) != 0);
	}

	alias InterlockedBitTestAndComplement_Inline InterlockedBitTestAndComplement;

	BOOLEAN InterlockedBitTestAndComplement_Inline(LONG* Base, LONG Bit)
	{
		LONG tBit;

		tBit = 1 << (Bit & ((*Base).sizeof * 8 - 1));
		return cast(BOOLEAN)((InterlockedXor(&Base[Bit / ((*Base).sizeof * 8)], tBit) & tBit) != 0);
	}

}else version(X86_64){ // _M_AMD64
	/*alias _InterlockedAnd InterlockedAnd;
	alias _InterlockedOr InterlockedOr;
	alias _InterlockedXor InterlockedXor;
	alias _InterlockedIncrement InterlockedIncrement;
	alias InterlockedIncrement InterlockedIncrementAcquire;
	alias InterlockedIncrement InterlockedIncrementRelease;
	alias _InterlockedDecrement InterlockedDecrement;
	alias InterlockedDecrement InterlockedDecrementAcquire;
	alias InterlockedDecrement InterlockedDecrementRelease;
	alias _InterlockedExchange InterlockedExchange;
	alias _InterlockedExchangeAdd InterlockedExchangeAdd;
	alias _InterlockedCompareExchange InterlockedCompareExchange;
	alias InterlockedCompareExchange InterlockedCompareExchangeAcquire;
	alias InterlockedCompareExchange InterlockedCompareExchangeRelease;
	alias _InterlockedExchangePointer InterlockedExchangePointer;
	alias _InterlockedCompareExchangePointer InterlockedCompareExchangePointer;
	alias _InterlockedCompareExchangePointer InterlockedCompareExchangePointerAcquire;
	alias _InterlockedCompareExchangePointer InterlockedCompareExchangePointerRelease;

	alias _InterlockedAnd64 InterlockedAnd64;
	alias _InterlockedOr64 InterlockedOr64;
	alias _InterlockedXor64 InterlockedXor64;
	alias _InterlockedIncrement64 InterlockedIncrement64;
	alias _InterlockedDecrement64 InterlockedDecrement64;
	alias _InterlockedExchange64 InterlockedExchange64;
	alias _InterlockedExchangeAdd64 InterlockedExchangeAdd64;
	alias _InterlockedCompareExchange64 InterlockedCompareExchange64;
	alias InterlockedCompareExchange64 InterlockedCompareExchangeAcquire64;
	alias InterlockedCompareExchange64 InterlockedCompareExchangeRelease64;

	LONG InterlockedAnd(LONG* Destination, LONG Value);
	LONG InterlockedOr(LONG* Destination, LONG Value);
	LONG InterlockedXor(LONG* Destination, LONG Value);
	LONG InterlockedIncrement(LONG* Addend);
	LONG InterlockedDecrement(LONG* Addend);
	LONG InterlockedExchange(LONG* Target, LONG Value);
	LONG InterlockedExchangeAdd(LONG* Addend, LONG Value);
	LONG InterlockedCompareExchange(LONG* Destination, LONG ExChange, LONG Comperand);
	PVOID InterlockedCompareExchangePointer(PVOID* Destination, PVOID Exchange, PVOID Comperand);
	PVOID InterlockedExchangePointer(PVOID* Target, PVOID Value);
	LONG64 InterlockedAnd64(LONG64* Destination, LONG64 Value);
	LONG64 InterlockedOr64(LONG64* Destination, LONG64 Value);
	LONG64 InterlockedXor64(LONG64* Destination, LONG64 Value);
	LONG64 InterlockedIncrement64(LONG64* Addend);
	LONG64 InterlockedDecrement64(LONG64* Addend);
	LONG64 InterlockedExchange64(LONG64* Target, LONG64 Value);
	LONG64 InterlockedExchangeAdd64(LONG64* Addend, LONG64 Value);
	LONG64 InterlockedCompareExchange64(LONG64* Destination, LONG64 ExChange, LONG64 Comperand);

	alias _InterlockedAnd8 InterlockedAnd8;
	alias _InterlockedOr8 InterlockedOr8;
	alias _InterlockedXor8 InterlockedXor8;
	alias _InterlockedAnd16 InterlockedAnd16;
	alias _InterlockedOr16 InterlockedOr16;
	alias _InterlockedXor16 InterlockedXor16;

	char InterlockedAnd8(char* Destination, char Value);
	char InterlockedOr8(char* Destination, char Value);
	char InterlockedXor8(char* Destination, char Value);
	SHORT InterlockedAnd16(SHORT* Destination, SHORT Value);
	SHORT InterlockedOr16(SHORT* Destination, SHORT Value);
	SHORT InterlockedXor16(SHORT* Destination, SHORT Value);*/

}else{
	export extern(Windows) LONG InterlockedIncrement(LONG* lpAddend);
	export extern(Windows) LONG InterlockedDecrement(LONG* lpAddend);
	export extern(Windows) LONG InterlockedExchange(LONG* Target, LONG Value);

	PVOID InterlockedExchangePointer(PLONG Target, LONG Value)
	{
		return cast(PVOID)InterlockedExchange(Target, Value);
	}

	export extern(Windows) LONG InterlockedExchangeAdd(LONG* Addend, LONG Value);
	export extern(Windows) LONG InterlockedCompareExchange(LONG* Destination, LONG Exchange, LONG Comperand);

	static if(_WIN32_WINNT >= _WIN32_WINNT_WS03)
		export extern(Windows) LONGLONG InterlockedCompareExchange64(LONGLONG* Destination, LONGLONG Exchange, LONGLONG Comperand);

	static if(_WIN32_WINNT >= _WIN32_WINNT_WS03){
		LONGLONG InterlockedAnd64(LONGLONG* Destination, LONGLONG Value)
		{
			LONGLONG Old;

		 	do{
		 		Old = *Destination;
		 	}while(InterlockedCompareExchange64(Destination, Old & Value, Old) != Old);

			 return Old;
		}

		LONGLONG InterlockedOr64(LONGLONG* Destination, LONGLONG Value)
		{
			LONGLONG Old;

		 	do{
		 		Old = *Destination;
			}while(InterlockedCompareExchange64(Destination, Old | Value, Old) != Old);

			return Old;
		}

		LONGLONG InterlockedXor64(LONGLONG* Destination, LONGLONG Value)
		{
			LONGLONG Old;

			do{
				Old = *Destination;
			}while(InterlockedCompareExchange64(Destination, Old ^ Value, Old) != Old);

			return Old;
		}

		LONGLONG InterlockedIncrement64(LONGLONG* Addend)
		{
			LONGLONG Old;

		 	do{
		 		Old = *Addend;
		 	}while(InterlockedCompareExchange64(Addend, Old + 1, Old) != Old);

			return Old + 1;
		}

		LONGLONG InterlockedDecrement64(LONGLONG* Addend)
		{
			LONGLONG Old;

			 do{
			 	Old = *Addend;
			 }while(InterlockedCompareExchange64(Addend, Old - 1, Old) != Old);

			return Old - 1;
		}

		LONGLONG InterlockedExchange64(LONGLONG* Target, LONGLONG Value)
		{
			LONGLONG Old;

			 do {
			 	Old = *Target;
			 }while(InterlockedCompareExchange64(Target, Value, Old) != Old);

			return Old;
		}

		LONGLONG InterlockedExchangeAdd64(LONGLONG* Addend, LONGLONG Value)
		{
			 LONGLONG Old;

			 do{
			 	Old = *Addend;
			 }while(InterlockedCompareExchange64(Addend, Old + Value, Old) != Old);

			return Old;
		}
	}

	PVOID InterlockedCompareExchangePointer(PVOID Destination, PVOID ExChange, PVOID Comperand)
	{
		return cast(PVOID)InterlockedCompareExchange(cast(LONG*)Destination, cast(LONG)cast(LONG_PTR)ExChange, cast(LONG)cast(LONG_PTR)Comperand);
	}

	alias InterlockedIncrement InterlockedIncrementAcquire;
	alias InterlockedIncrement InterlockedIncrementRelease;
	alias InterlockedDecrement InterlockedDecrementAcquire;
	alias InterlockedDecrement InterlockedDecrementRelease;
	alias InterlockedIncrement InterlockedIncrementAcquire;
	alias InterlockedIncrement InterlockedIncrementRelease;
	alias InterlockedCompareExchange InterlockedCompareExchangeAcquire;
	alias InterlockedCompareExchange InterlockedCompareExchangeRelease;
	alias InterlockedCompareExchange64 InterlockedCompareExchangeAcquire64;
	alias InterlockedCompareExchange64 InterlockedCompareExchangeRelease64;
	alias InterlockedCompareExchangePointer InterlockedCompareExchangePointerAcquire;
	alias InterlockedCompareExchangePointer InterlockedCompareExchangePointerRelease;
}

export extern(Windows) VOID InitializeSListHead(PSLIST_HEADER ListHead);
export extern(Windows) PSLIST_ENTRY InterlockedPopEntrySList(PSLIST_HEADER ListHead);
export extern(Windows) PSLIST_ENTRY InterlockedPushEntrySList(PSLIST_HEADER ListHead, PSLIST_ENTRY ListEntry);
export extern(Windows) PSLIST_ENTRY InterlockedFlushSList(PSLIST_HEADER ListHead);
export extern(Windows) USHORT QueryDepthSList(PSLIST_HEADER ListHead);
export extern(Windows) BOOL FreeResource(HGLOBAL hResData);
export extern(Windows) LPVOID LockResource(HGLOBAL hResData);

//#define UnlockResource(hResData) ((hResData), 0)

enum MAXINTATOM = 0xC000;
pure nothrow
LPTSTR MAKEINTATOM(WORD i)
{
	return cast(LPTSTR)cast(ULONG_PTR)i;
}
enum INVALID_ATOM = cast(ATOM)0;

extern(Windows) int WinMain( HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nShowCmd);
extern(Windows) int wWinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPWSTR lpCmdLine, int nShowCmd);

export extern(Windows) BOOL FreeLibrary(HMODULE hLibModule);
export extern(Windows) VOID FreeLibraryAndExitThread(HMODULE hLibModule, DWORD dwExitCode);
export extern(Windows) BOOL DisableThreadLibraryCalls(HMODULE hLibModule);
export extern(Windows) FARPROC GetProcAddress(HMODULE hModule, LPCSTR lpProcName);
export extern(Windows) DWORD GetVersion();
export extern(Windows) HGLOBAL GlobalAlloc(UINT uFlags, SIZE_T dwBytes);
export extern(Windows) HGLOBAL GlobalReAlloc(HGLOBAL hMem, SIZE_T dwBytes, UINT uFlags);
export extern(Windows) SIZE_T GlobalSize(HGLOBAL hMem);
export extern(Windows) UINT GlobalFlags(HGLOBAL hMem);
export extern(Windows) LPVOID GlobalLock(HGLOBAL hMem);
export extern(Windows) HGLOBAL GlobalHandle(LPCVOID pMem);
export extern(Windows) BOOL GlobalUnlock(HGLOBAL hMem);
export extern(Windows) HGLOBAL GlobalFree(HGLOBAL hMem);
export extern(Windows) SIZE_T GlobalCompact(DWORD dwMinFree);
export extern(Windows) VOID GlobalFix(HGLOBAL hMem);
export extern(Windows) VOID GlobalUnfix(HGLOBAL hMem);
export extern(Windows) LPVOID GlobalWire(HGLOBAL hMem);
export extern(Windows) BOOL GlobalUnWire(HGLOBAL hMem);
export extern(Windows) VOID GlobalMemoryStatus(LPMEMORYSTATUS lpBuffer);

struct MEMORYSTATUSEX {
	DWORD dwLength;
	DWORD dwMemoryLoad;
	DWORDLONG ullTotalPhys;
	DWORDLONG ullAvailPhys;
	DWORDLONG ullTotalPageFile;
	DWORDLONG ullAvailPageFile;
	DWORDLONG ullTotalVirtual;
	DWORDLONG ullAvailVirtual;
	DWORDLONG ullAvailExtendedVirtual;
}
alias MEMORYSTATUSEX* LPMEMORYSTATUSEX;

export extern(Windows) BOOL GlobalMemoryStatusEx(LPMEMORYSTATUSEX lpBuffer);
export extern(Windows) HLOCAL LocalAlloc(UINT uFlags, SIZE_T uBytes);
export extern(Windows) HLOCAL LocalReAlloc(HLOCAL hMem, SIZE_T uBytes, UINT uFlags);
export extern(Windows) LPVOID LocalLock(HLOCAL hMem);
export extern(Windows) HLOCAL LocalHandle(LPCVOID pMem);
export extern(Windows) BOOL LocalUnlock(HLOCAL hMem);
export extern(Windows) SIZE_T LocalSize(HLOCAL hMem);
export extern(Windows) UINT LocalFlags(HLOCAL hMem);
export extern(Windows) HLOCAL LocalFree(HLOCAL hMem);

export extern(Windows) SIZE_T LocalShrink(HLOCAL hMem, UINT cbNewSize);
export extern(Windows) SIZE_T LocalCompact(UINT uMinFree);
export extern(Windows) BOOL FlushInstructionCache(HANDLE hProcess, LPCVOID lpBaseAddress, SIZE_T dwSize);

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	export extern(Windows) VOID FlushProcessWriteBuffers();
	export extern(Windows) BOOL QueryThreadCycleTime(HANDLE ThreadHandle, PULONG64 CycleTime);
	export extern(Windows) BOOL QueryProcessCycleTime(HANDLE ProcessHandle, PULONG64 CycleTime);
	export extern(Windows) BOOL QueryIdleProcessorCycleTime (PULONG BufferLength, PULONG64 ProcessorIdleCycleTime);
}

static if(_WIN32_WINNT >= _WIN32_WINNT_WIN7){
	export extern(Windows) BOOL QueryIdleProcessorCycleTimeEx(USHORT Group, PULONG BufferLength, PULONG64 ProcessorIdleCycleTime);
	export extern(Windows) BOOL QueryUnbiasedInterruptTime(PULONGLONG UnbiasedTime);
	export extern(Windows) BOOL GetProcessorSystemCycleTime(USHORT Group, PSYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION Buffer, PDWORD ReturnedLength);
}

export extern(Windows) LPVOID VirtualAlloc(LPVOID lpAddress, SIZE_T dwSize, DWORD flAllocationType, DWORD flProtect);
export extern(Windows) BOOL VirtualFree(LPVOID lpAddress, SIZE_T dwSize, DWORD dwFreeType);
export extern(Windows) BOOL VirtualProtect(LPVOID lpAddress, SIZE_T dwSize, DWORD flNewProtect, PDWORD lpflOldProtect);
export extern(Windows) SIZE_T VirtualQuery(LPCVOID lpAddress, PMEMORY_BASIC_INFORMATION lpBuffer, SIZE_T dwLength);
export extern(Windows) LPVOID VirtualAllocEx(HANDLE hProcess, LPVOID lpAddress, SIZE_T dwSize, DWORD flAllocationType, DWORD flProtect);

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	export extern(Windows) LPVOID VirtualAllocExNuma(HANDLE hProcess, LPVOID lpAddress, SIZE_T dwSize, DWORD flAllocationType, DWORD flProtect, DWORD nndPreferred);

export extern(Windows) UINT GetWriteWatch(DWORD dwFlags, PVOID lpBaseAddress, SIZE_T dwRegionSize, PVOID* lpAddresses, ULONG_PTR* lpdwCount, PULONG lpdwGranularity);

export extern(Windows) UINT ResetWriteWatch(LPVOID lpBaseAddress, SIZE_T dwRegionSize);
export extern(Windows) SIZE_T GetLargePageMinimum();
export extern(Windows) UINT EnumSystemFirmwareTables(DWORD FirmwareTableProviderSignature, PVOID pFirmwareTableEnumBuffer, DWORD BufferSize);
export extern(Windows) UINT GetSystemFirmwareTable(DWORD FirmwareTableProviderSignature, DWORD FirmwareTableID, PVOID pFirmwareTableBuffer, DWORD BufferSize);
export extern(Windows) BOOL GetPhysicallyInstalledSystemMemory(PULONGLONG TotalMemoryInKilobytes);
export extern(Windows) BOOL VirtualFreeEx(HANDLE hProcess, LPVOID lpAddress, SIZE_T dwSize, DWORD dwFreeType);
export extern(Windows) BOOL VirtualProtectEx(HANDLE hProcess, LPVOID lpAddress, SIZE_T dwSize, DWORD flNewProtect, PDWORD lpflOldProtect);
export extern(Windows) SIZE_T VirtualQueryEx(HANDLE hProcess, LPCVOID lpAddress, PMEMORY_BASIC_INFORMATION lpBuffer, SIZE_T dwLength);
export extern(Windows) HANDLE HeapCreate(DWORD flOptions, SIZE_T dwInitialSize, SIZE_T dwMaximumSize);
export extern(Windows) BOOL HeapDestroy(HANDLE hHeap);
export extern(Windows) LPVOID HeapAlloc(HANDLE hHeap, DWORD dwFlags, SIZE_T dwBytes);
export extern(Windows) LPVOID HeapReAlloc(HANDLE hHeap, DWORD dwFlags, LPVOID lpMem, SIZE_T dwBytes);
export extern(Windows) BOOL HeapFree(HANDLE hHeap, DWORD dwFlags, LPVOID lpMem);
export extern(Windows) SIZE_T HeapSize(HANDLE hHeap, DWORD dwFlags, LPCVOID lpMem);
export extern(Windows) BOOL HeapValidate(HANDLE hHeap, DWORD dwFlags, LPCVOID lpMem);
export extern(Windows) SIZE_T HeapCompact(HANDLE hHeap, DWORD dwFlags);
export extern(Windows) HANDLE GetProcessHeap();
export extern(Windows) DWORD GetProcessHeaps(DWORD NumberOfHeaps, PHANDLE ProcessHeaps);

struct PROCESS_HEAP_ENTRY {
	PVOID lpData;
	DWORD cbData;
	BYTE cbOverhead;
	BYTE iRegionIndex;
	WORD wFlags;
	union {
		struct {
			HANDLE hMem;
			DWORD[3] dwReserved;
		}
		struct {
			DWORD dwCommittedSize;
			DWORD dwUnCommittedSize;
			LPVOID lpFirstBlock;
			LPVOID lpLastBlock;
		}
	}
}
alias PROCESS_HEAP_ENTRY* LPPROCESS_HEAP_ENTRY;
alias PROCESS_HEAP_ENTRY* PPROCESS_HEAP_ENTRY;

enum {
	PROCESS_HEAP_REGION            = 0x0001,
	PROCESS_HEAP_UNCOMMITTED_RANGE = 0x0002,
	PROCESS_HEAP_ENTRY_BUSY        = 0x0004,
	PROCESS_HEAP_ENTRY_MOVEABLE    = 0x0010,
	PROCESS_HEAP_ENTRY_DDESHARE    = 0x0020,
}
export extern(Windows) BOOL HeapLock(HANDLE hHeap);
export extern(Windows) BOOL HeapUnlock(HANDLE hHeap);
export extern(Windows) BOOL HeapWalk(HANDLE hHeap, LPPROCESS_HEAP_ENTRY lpEntry);
export extern(Windows) BOOL HeapSetInformation(HANDLE HeapHandle, HEAP_INFORMATION_CLASS HeapInformationClass, PVOID HeapInformation, SIZE_T HeapInformationLength);
export extern(Windows) BOOL HeapQueryInformation(HANDLE HeapHandle, HEAP_INFORMATION_CLASS HeapInformationClass, PVOID HeapInformation, SIZE_T HeapInformationLength, PSIZE_T ReturnLength);

enum {
	SCS_32BIT_BINARY = 0,
	SCS_DOS_BINARY   = 1,
	SCS_WOW_BINARY   = 2,
	SCS_PIF_BINARY   = 3,
	SCS_POSIX_BINARY = 4,
	SCS_OS216_BINARY = 5,
	SCS_64BIT_BINARY = 6,
}

version(Win64)
	enum SCS_THIS_PLATFORM_BINARY = SCS_64BIT_BINARY;
else
	enum SCS_THIS_PLATFORM_BINARY = SCS_32BIT_BINARY;

export extern(Windows) BOOL GetBinaryTypeA(LPCSTR lpApplicationName, LPDWORD lpBinaryType);
export extern(Windows) BOOL GetBinaryTypeW(LPCWSTR lpApplicationName, LPDWORD lpBinaryType);
version(UNICODE)
	alias GetBinaryTypeW GetBinaryType;
else
	alias GetBinaryTypeA GetBinaryType;

export extern(Windows) DWORD GetShortPathNameA(LPCSTR lpszLongPath, LPSTR lpszShortPath, DWORD cchBuffer);
export extern(Windows) DWORD GetShortPathNameW(LPCWSTR lpszLongPath, LPWSTR lpszShortPath, DWORD cchBuffer);
version(UNICODE)
	alias GetShortPathNameW GetShortPathName;
else
	alias GetShortPathNameA GetShortPathName;

export extern(Windows) DWORD GetLongPathNameA(LPCSTR lpszShortPath, LPSTR lpszLongPath, DWORD cchBuffer);
export extern(Windows) DWORD GetLongPathNameW(LPCWSTR lpszShortPath, LPWSTR lpszLongPath, DWORD cchBuffer);
version(UNICODE)
	alias GetLongPathNameW GetLongPathName;
else
	alias GetLongPathNameA GetLongPathName;

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	export extern(Windows) DWORD GetLongPathNameTransactedA(LPCSTR lpszShortPath, LPSTR lpszLongPath, DWORD cchBuffer, HANDLE hTransaction);
	export extern(Windows) DWORD GetLongPathNameTransactedW(LPCWSTR lpszShortPath, LPWSTR lpszLongPath, DWORD cchBuffer, HANDLE hTransaction);
	version(UNICODE)
		alias GetLongPathNameTransactedW GetLongPathNameTransacted;
	else
		alias GetLongPathNameTransactedA GetLongPathNameTransacted;
}

export extern(Windows) BOOL GetProcessAffinityMask(HANDLE hProcess, PDWORD_PTR lpProcessAffinityMask, PDWORD_PTR lpSystemAffinityMask);
export extern(Windows) BOOL SetProcessAffinityMask(HANDLE hProcess, DWORD_PTR dwProcessAffinityMask);

static if(_WIN32_WINNT >= _WIN32_WINNT_WIN7)
	extern(Windows) BOOL GetProcessGroupAffinity(HANDLE hProcess, PUSHORT GroupCount, PUSHORT GroupArray);

export extern(Windows) BOOL GetProcessHandleCount(HANDLE hProcess, PDWORD pdwHandleCount);
export extern(Windows) BOOL GetProcessTimes(HANDLE hProcess, LPFILETIME lpCreationTime, LPFILETIME lpExitTime, LPFILETIME lpKernelTime, LPFILETIME lpUserTime);
export extern(Windows) BOOL GetProcessIoCounters(HANDLE hProcess, PIO_COUNTERS lpIoCounters);
export extern(Windows) BOOL GetProcessWorkingSetSize(HANDLE hProcess, PSIZE_T lpMinimumWorkingSetSize, PSIZE_T lpMaximumWorkingSetSize);
export extern(Windows) BOOL GetProcessWorkingSetSizeEx(HANDLE hProcess, PSIZE_T lpMinimumWorkingSetSize, PSIZE_T lpMaximumWorkingSetSize, PDWORD Flags);
export extern(Windows) BOOL SetProcessWorkingSetSize(HANDLE hProcess, SIZE_T dwMinimumWorkingSetSize, SIZE_T dwMaximumWorkingSetSize);
export extern(Windows) BOOL SetProcessWorkingSetSizeEx(HANDLE hProcess, SIZE_T dwMinimumWorkingSetSize, SIZE_T dwMaximumWorkingSetSize, DWORD Flags);

//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	enum PROCESS_AFFINITY_ENABLE_AUTO_UPDATE = 0x00000001U;

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	export extern(Windows) BOOL SetProcessAffinityUpdateMode(HANDLE hProcess, DWORD dwFlags);
	export extern(Windows) BOOL QueryProcessAffinityUpdateMode(HANDLE hProcess, LPDWORD lpdwFlags);
}

export extern(Windows) HANDLE OpenProcess(DWORD dwDesiredAccess, BOOL bInheritHandle, DWORD dwProcessId);
export extern(Windows) HANDLE GetCurrentProcess();
export extern(Windows) DWORD GetCurrentProcessId();
export extern(Windows) VOID ExitProcess(UINT uExitCode);
export extern(Windows) BOOL TerminateProcess(HANDLE hProcess, UINT uExitCode);
export extern(Windows) BOOL GetExitCodeProcess(HANDLE hProcess, LPDWORD lpExitCode);
export extern(Windows) VOID FatalExit(int ExitCode);
export extern(Windows) LPCH GetEnvironmentStrings();
export extern(Windows) LPWCH GetEnvironmentStringsW();
version(UNICODE)
	alias GetEnvironmentStringsW GetEnvironmentStrings;
else
	alias GetEnvironmentStrings GetEnvironmentStringsA;

export extern(Windows) BOOL SetEnvironmentStringsA(LPCH NewEnvironment);
export extern(Windows) BOOL SetEnvironmentStringsW(LPWCH NewEnvironment);
version(UNICODE)
	alias SetEnvironmentStringsW SetEnvironmentStrings;
else
	alias SetEnvironmentStringsA SetEnvironmentStrings;

export extern(Windows) BOOL FreeEnvironmentStringsA(LPCH);
export extern(Windows) BOOL FreeEnvironmentStringsW(LPWCH);
version(UNICODE)
	alias FreeEnvironmentStringsW FreeEnvironmentStrings;
else
	alias FreeEnvironmentStringsA FreeEnvironmentStrings;

export extern(Windows) VOID RaiseException(DWORD dwExceptionCode, DWORD dwExceptionFlags, DWORD nNumberOfArguments, const(ULONG_PTR)* lpArguments);
export extern(Windows) VOID RaiseFailFastException(PEXCEPTION_RECORD pExceptionRecord, PCONTEXT pContextRecord, DWORD dwFlags);

export extern(Windows) LONG UnhandledExceptionFilter(EXCEPTION_POINTERS* ExceptionInfo);
alias extern(Windows) LONG function(EXCEPTION_POINTERS* ExceptionInfo) PTOP_LEVEL_EXCEPTION_FILTER;
alias PTOP_LEVEL_EXCEPTION_FILTER LPTOP_LEVEL_EXCEPTION_FILTER;

export extern(Windows) LPTOP_LEVEL_EXCEPTION_FILTER SetUnhandledExceptionFilter(LPTOP_LEVEL_EXCEPTION_FILTER lpTopLevelExceptionFilter);

enum FIBER_FLAG_FLOAT_SWITCH = 0x1;

export extern(Windows) LPVOID CreateFiber(SIZE_T dwStackSize, LPFIBER_START_ROUTINE lpStartAddress, LPVOID lpParameter);
export extern(Windows) LPVOID CreateFiberEx(SIZE_T dwStackCommitSize, SIZE_T dwStackReserveSize, DWORD dwFlags, LPFIBER_START_ROUTINE lpStartAddress, LPVOID lpParameter);
export extern(Windows) VOID DeleteFiber(LPVOID lpFiber);
export extern(Windows) LPVOID ConvertThreadToFiber(LPVOID lpParameter);
export extern(Windows) LPVOID ConvertThreadToFiberEx(LPVOID lpParameter, DWORD dwFlags);
static if(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	export extern(Windows) BOOL ConvertFiberToThread();
static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	export extern(Windows) BOOL IsThreadAFiber();
export extern(Windows) VOID SwitchToFiber(LPVOID lpFiber);
export extern(Windows) BOOL SwitchToThread();

//(_WIN32_WINNT >= _WIN32_WINNT_WIN7)
	enum PUMS_CONTEXT : void* {init = (void*).init}
	enum PUMS_COMPLETION_LIST : void* {init = (void*).init}
	alias RTL_UMS_THREAD_INFO_CLASS UMS_THREAD_INFO_CLASS;
	alias UMS_THREAD_INFO_CLASS* PUMS_THREAD_INFO_CLASS;
	alias RTL_UMS_SCHEDULER_REASON UMS_SCHEDULER_REASON;
	alias PRTL_UMS_SCHEDULER_ENTRY_POINT PUMS_SCHEDULER_ENTRY_POINT;

	struct UMS_SCHEDULER_STARTUP_INFO {
		ULONG UmsVersion;
		PUMS_COMPLETION_LIST CompletionList;
		PUMS_SCHEDULER_ENTRY_POINT SchedulerProc;
		PVOID SchedulerParam;
	}
	alias UMS_SCHEDULER_STARTUP_INFO* PUMS_SCHEDULER_STARTUP_INFO;

static if(_WIN32_WINNT >= _WIN32_WINNT_WIN7){
	export extern(Windows) BOOL CreateUmsCompletionList(PUMS_COMPLETION_LIST* UmsCompletionList);
	export extern(Windows) BOOL DequeueUmsCompletionListItems(PUMS_COMPLETION_LIST UmsCompletionList, DWORD WaitTimeOut, PUMS_CONTEXT* UmsThreadList);
	export extern(Windows) BOOL GetUmsCompletionListEvent(PUMS_COMPLETION_LIST UmsCompletionList, PHANDLE UmsCompletionEvent);
	export extern(Windows) BOOL ExecuteUmsThread(PUMS_CONTEXT UmsThread);
	export extern(Windows) BOOL UmsThreadYield(PVOID SchedulerParam);
	export extern(Windows) BOOL DeleteUmsCompletionList(PUMS_COMPLETION_LIST UmsCompletionList);
	export extern(Windows) PUMS_CONTEXT GetCurrentUmsThread();
	export extern(Windows) PUMS_CONTEXT GetNextUmsListItem(PUMS_CONTEXT UmsContext);
	export extern(Windows) BOOL QueryUmsThreadInformation(PUMS_CONTEXT UmsThread, UMS_THREAD_INFO_CLASS UmsThreadInfoClass, PVOID UmsThreadInformation, ULONG UmsThreadInformationLength, PULONG ReturnLength);
	export extern(Windows) BOOL SetUmsThreadInformation(PUMS_CONTEXT UmsThread, UMS_THREAD_INFO_CLASS UmsThreadInfoClass, PVOID UmsThreadInformation, ULONG UmsThreadInformationLength);
	export extern(Windows) BOOL DeleteUmsThreadContext(PUMS_CONTEXT UmsThread);
	export extern(Windows) BOOL CreateUmsThreadContext(PUMS_CONTEXT* lpUmsThread);
	export extern(Windows) BOOL EnterUmsSchedulingMode(PUMS_SCHEDULER_STARTUP_INFO SchedulerStartupInfo);
}

struct PROC_THREAD_ATTRIBUTE_LIST {}
alias PROC_THREAD_ATTRIBUTE_LIST* PPROC_THREAD_ATTRIBUTE_LIST;
alias PROC_THREAD_ATTRIBUTE_LIST* LPPROC_THREAD_ATTRIBUTE_LIST;

export extern(Windows) HANDLE CreateThread(LPSECURITY_ATTRIBUTES lpThreadAttributes, SIZE_T dwStackSize, LPTHREAD_START_ROUTINE lpStartAddress, LPVOID lpParameter, DWORD dwCreationFlags, LPDWORD lpThreadId);
export extern(Windows) HANDLE CreateRemoteThread(HANDLE hProcess, LPSECURITY_ATTRIBUTES lpThreadAttributes, SIZE_T dwStackSize, LPTHREAD_START_ROUTINE lpStartAddress, LPVOID lpParameter, DWORD dwCreationFlags, LPDWORD lpThreadId);
export extern(Windows) HANDLE CreateRemoteThreadEx(HANDLE hProcess, LPSECURITY_ATTRIBUTES lpThreadAttributes, SIZE_T dwStackSize, LPTHREAD_START_ROUTINE lpStartAddress, LPVOID lpParameter, DWORD dwCreationFlags, LPPROC_THREAD_ATTRIBUTE_LIST lpAttributeList, LPDWORD lpThreadId);
export extern(Windows) HANDLE GetCurrentThread();
export extern(Windows) DWORD GetCurrentThreadId();
export extern(Windows) BOOL SetThreadStackGuarantee(PULONG StackSizeInBytes);
export extern(Windows) DWORD GetProcessIdOfThread(HANDLE Thread);
static if(_WIN32_WINNT >= _WIN32_WINNT_WS03)
	export extern(Windows) DWORD GetThreadId(HANDLE Thread);
export extern(Windows) DWORD GetProcessId(HANDLE Process);
export extern(Windows) DWORD GetCurrentProcessorNumber();
static if(_WIN32_WINNT >= _WIN32_WINNT_WIN7)
	export extern(Windows) VOID GetCurrentProcessorNumberEx(PPROCESSOR_NUMBER ProcNumber);
static if (_WIN32_WINNT >= _WIN32_WINNT_WIN7)
	export extern(Windows) BOOL GetThreadGroupAffinity(HANDLE hThread, PGROUP_AFFINITY GroupAffinity);
export extern(Windows) DWORD_PTR SetThreadAffinityMask(HANDLE hThread, DWORD_PTR dwThreadAffinityMask);
static if(_WIN32_WINNT >= _WIN32_WINNT_WIN7){
	export extern(Windows) BOOL SetThreadGroupAffinity(HANDLE hThread, const(GROUP_AFFINITY)* GroupAffinity, PGROUP_AFFINITY PreviousGroupAffinity);
	export extern(Windows) BOOL SetThreadIdealProcessorEx(HANDLE hThread, PPROCESSOR_NUMBER lpIdealProcessor, PPROCESSOR_NUMBER lpPreviousIdealProcessor);
	export extern(Windows) BOOL GetThreadIdealProcessorEx(HANDLE hThread, PPROCESSOR_NUMBER lpIdealProcessor);
}

export extern(Windows) DWORD SetThreadIdealProcessor(HANDLE hThread, DWORD dwIdealProcessor);

//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	enum {
		PROCESS_DEP_ENABLE                      = 0x00000001,
		PROCESS_DEP_DISABLE_ATL_THUNK_EMULATION = 0x00000002,
	}

static if(_WIN32_WINNT >= _WIN32_WINNT_WINXP){
	export extern(Windows) BOOL SetProcessDEPPolicy(DWORD dwFlags);
	export extern(Windows) BOOL GetProcessDEPPolicy(HANDLE hProcess, LPDWORD lpFlags, PBOOL lpPermanent);
}

export extern(Windows) BOOL SetProcessPriorityBoost(HANDLE hProcess, BOOL bDisablePriorityBoost);
export extern(Windows) BOOL GetProcessPriorityBoost(HANDLE hProcess, PBOOL pDisablePriorityBoost);
export extern(Windows) BOOL RequestWakeupLatency(LATENCY_TIME latency);
export extern(Windows) BOOL IsSystemResumeAutomatic();
export extern(Windows) HANDLE OpenThread(DWORD dwDesiredAccess, BOOL bInheritHandle, DWORD dwThreadId);
export extern(Windows) BOOL SetThreadPriority(HANDLE hThread, int nPriority);
export extern(Windows) BOOL SetThreadPriorityBoost(HANDLE hThread, BOOL bDisablePriorityBoost);
export extern(Windows) BOOL GetThreadPriorityBoost(HANDLE hThread, PBOOL pDisablePriorityBoost);
export extern(Windows) int GetThreadPriority(HANDLE hThread);
export extern(Windows) BOOL GetThreadTimes(HANDLE hThread, LPFILETIME lpCreationTime, LPFILETIME lpExitTime, LPFILETIME lpKernelTime, LPFILETIME lpUserTime);

static if(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	export extern(Windows) BOOL GetThreadIOPendingFlag(HANDLE hThread, PBOOL lpIOIsPending);

export extern(Windows) VOID ExitThread(DWORD dwExitCode);
export extern(Windows) BOOL TerminateThread(HANDLE hThread, DWORD dwExitCode);
export extern(Windows) BOOL GetExitCodeThread(HANDLE hThread, LPDWORD lpExitCode);
export extern(Windows) BOOL GetThreadSelectorEntry(HANDLE hThread, DWORD dwSelector, LPLDT_ENTRY lpSelectorEntry);
export extern(Windows) EXECUTION_STATE SetThreadExecutionState(EXECUTION_STATE esFlags);

//(_WIN32_WINNT >= _WIN32_WINNT_WIN7)
	struct REASON_CONTEXT {
		ULONG Version;
		DWORD Flags;
		union {
			struct {
				HMODULE LocalizedReasonModule;
				ULONG LocalizedReasonId;
				ULONG ReasonStringCount;
				LPWSTR* ReasonStrings;
			}
			LPWSTR SimpleReasonString;
		}
	}
	alias REASON_CONTEXT* PREASON_CONTEXT;
	alias REASON_CONTEXT POWER_REQUEST_CONTEXT;
	alias POWER_REQUEST_CONTEXT* PPOWER_REQUEST_CONTEXT;
	alias POWER_REQUEST_CONTEXT* LPPOWER_REQUEST_CONTEXT;

static if(_WIN32_WINNT >= _WIN32_WINNT_WIN7){
	export extern(Windows) HANDLE PowerCreateRequest(PREASON_CONTEXT Context);
	export extern(Windows) BOOL PowerSetRequest(HANDLE PowerRequest, POWER_REQUEST_TYPE RequestType);
	export extern(Windows) BOOL PowerClearRequest(HANDLE PowerRequest, POWER_REQUEST_TYPE RequestType);
}

export extern(Windows) DWORD GetLastError();
export extern(Windows) VOID SetLastError(DWORD dwErrCode);

export extern(Windows) VOID  RestoreLastError(DWORD dwErrCode);
alias extern(Windows) VOID function(DWORD) PRESTORE_LAST_ERROR;
const char* RESTORE_LAST_ERROR_NAME_A  = "RestoreLastError";
const wchar* RESTORE_LAST_ERROR_NAME_W = "RestoreLastError";
const TCHAR* RESTORE_LAST_ERROR_NAME   = "RestoreLastError";


//#define HasOverlappedIoCompleted(lpOverlapped) (((DWORD)(lpOverlapped)->Internal) != STATUS_PENDING)

export extern(Windows) BOOL GetOverlappedResult(HANDLE hFile, LPOVERLAPPED lpOverlapped, LPDWORD lpNumberOfBytesTransferred, BOOL bWait);
export extern(Windows) HANDLE CreateIoCompletionPort(HANDLE FileHandle, HANDLE ExistingCompletionPort, ULONG_PTR CompletionKey, DWORD NumberOfConcurrentThreads);
export extern(Windows) BOOL GetQueuedCompletionStatus(HANDLE CompletionPort, LPDWORD lpNumberOfBytesTransferred, PULONG_PTR lpCompletionKey, LPOVERLAPPED* lpOverlapped, DWORD dwMilliseconds);

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	export extern(Windows) BOOL GetQueuedCompletionStatusEx(HANDLE CompletionPort, LPOVERLAPPED_ENTRY lpCompletionPortEntries, ULONG ulCount, PULONG ulNumEntriesRemoved, DWORD dwMilliseconds, BOOL fAlertable);
export extern(Windows) BOOL PostQueuedCompletionStatus(HANDLE CompletionPort, DWORD dwNumberOfBytesTransferred, ULONG_PTR dwCompletionKey, LPOVERLAPPED lpOverlapped);

//(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	enum {
		FILE_SKIP_COMPLETION_PORT_ON_SUCCESS = 0x1,
		FILE_SKIP_SET_EVENT_ON_HANDLE        = 0x2,
	}

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	export extern(Windows) BOOL SetFileCompletionNotificationModes(HANDLE FileHandle, UCHAR Flags);
	export extern(Windows) BOOL SetFileIoOverlappedRange(HANDLE FileHandle, PUCHAR OverlappedRangeStart, ULONG Length);
}

enum {
	SEM_FAILCRITICALERRORS     = 0x0001,
	SEM_NOGPFAULTERRORBOX      = 0x0002,
	SEM_NOALIGNMENTFAULTEXCEPT = 0x0004,
	SEM_NOOPENFILEERRORBOX     = 0x8000,
}

export extern(Windows) UINT GetErrorMode();
export extern(Windows) UINT SetErrorMode(UINT uMode);
export extern(Windows) DWORD GetThreadErrorMode();
export extern(Windows) BOOL SetThreadErrorMode(DWORD dwNewMode, LPDWORD lpOldMode);
export extern(Windows) BOOL ReadProcessMemory(HANDLE hProcess, LPCVOID lpBaseAddress, LPVOID lpBuffer, SIZE_T nSize, SIZE_T* lpNumberOfBytesRead);
export extern(Windows) BOOL WriteProcessMemory(HANDLE hProcess, LPVOID lpBaseAddress, LPCVOID lpBuffer, SIZE_T nSize, SIZE_T* lpNumberOfBytesWritten);
export extern(Windows) BOOL GetThreadContext(HANDLE hThread, LPCONTEXT lpContext);
export extern(Windows) BOOL SetThreadContext(HANDLE hThread, const(CONTEXT)* lpContext );
export extern(Windows) BOOL Wow64GetThreadContext(HANDLE hThread, PWOW64_CONTEXT lpContext);
static if(_WIN32_WINNT >= _WIN32_WINNT_WIN7)
	export extern(Windows) BOOL Wow64GetThreadSelectorEntry(HANDLE hThread, DWORD dwSelector, PWOW64_LDT_ENTRY lpSelectorEntry);
export extern(Windows) BOOL Wow64SetThreadContext(HANDLE hThread, const(WOW64_CONTEXT)* lpContext);
export extern(Windows) DWORD SuspendThread(HANDLE hThread);
export extern(Windows) DWORD Wow64SuspendThread(HANDLE hThread);
export extern(Windows) DWORD ResumeThread(HANDLE hThread);
export extern(Windows) DWORD QueueUserAPC(PAPCFUNC pfnAPC, HANDLE hThread, ULONG_PTR dwData);
export extern(Windows) BOOL IsDebuggerPresent();
static if(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	export extern(Windows) BOOL CheckRemoteDebuggerPresent(HANDLE hProcess, PBOOL pbDebuggerPresent);
export extern(Windows) VOID DebugBreak();
export extern(Windows) BOOL WaitForDebugEvent(LPDEBUG_EVENT lpDebugEvent, DWORD dwMilliseconds);
export extern(Windows) BOOL ContinueDebugEvent(DWORD dwProcessId, DWORD dwThreadId, DWORD dwContinueStatus);
export extern(Windows) BOOL DebugActiveProcess(DWORD dwProcessId);
export extern(Windows) BOOL DebugActiveProcessStop(DWORD dwProcessId);
export extern(Windows) BOOL DebugSetProcessKillOnExit(BOOL KillOnExit);
export extern(Windows) BOOL DebugBreakProcess(HANDLE Process);
export extern(Windows) VOID InitializeCriticalSection(LPCRITICAL_SECTION lpCriticalSection);
export extern(Windows) VOID EnterCriticalSection(LPCRITICAL_SECTION lpCriticalSection);
export extern(Windows) VOID LeaveCriticalSection(LPCRITICAL_SECTION lpCriticalSection);

enum CRITICAL_SECTION_NO_DEBUG_INFO = RTL_CRITICAL_SECTION_FLAG_NO_DEBUG_INFO;

export extern(Windows) BOOL InitializeCriticalSectionAndSpinCount(LPCRITICAL_SECTION lpCriticalSection, DWORD dwSpinCount);
export extern(Windows) BOOL InitializeCriticalSectionEx(LPCRITICAL_SECTION lpCriticalSection, DWORD dwSpinCount, DWORD Flags);
export extern(Windows) DWORD SetCriticalSectionSpinCount(LPCRITICAL_SECTION lpCriticalSection, DWORD dwSpinCount);

export extern(Windows) BOOL TryEnterCriticalSection(LPCRITICAL_SECTION lpCriticalSection);
export extern(Windows) VOID DeleteCriticalSection(LPCRITICAL_SECTION lpCriticalSection);
export extern(Windows) BOOL SetEvent(HANDLE hEvent);
export extern(Windows) BOOL ResetEvent(HANDLE hEvent);
export extern(Windows) BOOL PulseEvent(HANDLE hEvent);
export extern(Windows) BOOL ReleaseSemaphore(HANDLE hSemaphore, LONG lReleaseCount, LPLONG lpPreviousCount);
export extern(Windows) BOOL ReleaseMutex(HANDLE hMutex);
export extern(Windows) DWORD WaitForSingleObject(HANDLE hHandle, DWORD dwMilliseconds);
export extern(Windows) DWORD WaitForMultipleObjects(DWORD nCount, const(HANDLE)*lpHandles, BOOL bWaitAll, DWORD dwMilliseconds);
export extern(Windows) VOID Sleep(DWORD dwMilliseconds);
export extern(Windows) HGLOBAL LoadResource(HMODULE hModule, HRSRC hResInfo);
export extern(Windows) DWORD SizeofResource(HMODULE hModule, HRSRC hResInfo);
export extern(Windows) ATOM GlobalDeleteAtom(ATOM nAtom);
export extern(Windows) BOOL InitAtomTable(DWORD nSize);
export extern(Windows) ATOM DeleteAtom(ATOM nAtom);
export extern(Windows) UINT SetHandleCount(UINT uNumber);
export extern(Windows) DWORD GetLogicalDrives();
export extern(Windows) BOOL LockFile(HANDLE hFile, DWORD dwFileOffsetLow, DWORD dwFileOffsetHigh, DWORD nNumberOfBytesToLockLow, DWORD nNumberOfBytesToLockHigh);
export extern(Windows) BOOL UnlockFile(HANDLE hFile, DWORD dwFileOffsetLow, DWORD dwFileOffsetHigh, DWORD nNumberOfBytesToUnlockLow, DWORD nNumberOfBytesToUnlockHigh);
export extern(Windows) BOOL LockFileEx(HANDLE hFile, DWORD dwFlags, DWORD dwReserved, DWORD nNumberOfBytesToLockLow, DWORD nNumberOfBytesToLockHigh, LPOVERLAPPED lpOverlapped);

enum {
	LOCKFILE_FAIL_IMMEDIATELY = 0x00000001,
	LOCKFILE_EXCLUSIVE_LOCK   = 0x00000002,
}
export extern(Windows) BOOL UnlockFileEx(HANDLE hFile, DWORD dwReserved, DWORD nNumberOfBytesToUnlockLow, DWORD nNumberOfBytesToUnlockHigh, LPOVERLAPPED lpOverlapped);

struct BY_HANDLE_FILE_INFORMATION {
	DWORD dwFileAttributes;
	FILETIME ftCreationTime;
	FILETIME ftLastAccessTime;
	FILETIME ftLastWriteTime;
	DWORD dwVolumeSerialNumber;
	DWORD nFileSizeHigh;
	DWORD nFileSizeLow;
	DWORD nNumberOfLinks;
	DWORD nFileIndexHigh;
	DWORD nFileIndexLow;
}
alias BY_HANDLE_FILE_INFORMATION* PBY_HANDLE_FILE_INFORMATION;
alias BY_HANDLE_FILE_INFORMATION* LPBY_HANDLE_FILE_INFORMATION;

export extern(Windows) BOOL GetFileInformationByHandle(HANDLE hFile, LPBY_HANDLE_FILE_INFORMATION lpFileInformation);
export extern(Windows) DWORD GetFileType(HANDLE hFile);
export extern(Windows) DWORD GetFileSize(HANDLE hFile, LPDWORD lpFileSizeHigh);
export extern(Windows) BOOL GetFileSizeEx(HANDLE hFile, PLARGE_INTEGER lpFileSize);
export extern(Windows) HANDLE GetStdHandle(DWORD nStdHandle);
export extern(Windows) BOOL SetStdHandle(DWORD nStdHandle, HANDLE hHandle);

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	export extern(Windows) BOOL SetStdHandleEx(DWORD nStdHandle, HANDLE hHandle, PHANDLE phPrevValue);
export extern(Windows) BOOL WriteFile(HANDLE hFile, LPCVOID lpBuffer, DWORD nNumberOfBytesToWrite, LPDWORD lpNumberOfBytesWritten, LPOVERLAPPED lpOverlapped);
export extern(Windows) BOOL ReadFile(HANDLE hFile, LPVOID lpBuffer, DWORD nNumberOfBytesToRead, LPDWORD lpNumberOfBytesRead, LPOVERLAPPED lpOverlapped);
export extern(Windows) BOOL FlushFileBuffers(HANDLE hFile);
export extern(Windows) BOOL DeviceIoControl(HANDLE hDevice, DWORD dwIoControlCode, LPVOID lpInBuffer, DWORD nInBufferSize, LPVOID lpOutBuffer, DWORD nOutBufferSize, LPDWORD lpBytesReturned, LPOVERLAPPED lpOverlapped);
export extern(Windows) BOOL RequestDeviceWakeup(HANDLE hDevice);
export extern(Windows) BOOL CancelDeviceWakeupRequest(HANDLE hDevice);
export extern(Windows) BOOL GetDevicePowerState(HANDLE hDevice, BOOL* pfOn);
export extern(Windows) BOOL SetMessageWaitingIndicator(HANDLE hMsgIndicator, ULONG ulMsgCount);
export extern(Windows) BOOL SetEndOfFile(HANDLE hFile);
export extern(Windows) DWORD SetFilePointer(HANDLE hFile, LONG lDistanceToMove, PLONG lpDistanceToMoveHigh, DWORD dwMoveMethod);
export extern(Windows) BOOL SetFilePointerEx(HANDLE hFile, LARGE_INTEGER liDistanceToMove, PLARGE_INTEGER lpNewFilePointer, DWORD dwMoveMethod);
export extern(Windows) BOOL FindClose(HANDLE hFindFile);
export extern(Windows) BOOL GetFileTime(HANDLE hFile, LPFILETIME lpCreationTime, LPFILETIME lpLastAccessTime, LPFILETIME lpLastWriteTime);
export extern(Windows) BOOL SetFileTime(HANDLE hFile, const(FILETIME)* lpCreationTime, const(FILETIME)* lpLastAccessTime, const(FILETIME)* lpLastWriteTime);

static if(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	export extern(Windows) BOOL SetFileValidData(HANDLE hFile, LONGLONG ValidDataLength);

export extern(Windows) BOOL SetFileShortNameA(HANDLE hFile, LPCSTR lpShortName);
export extern(Windows) BOOL SetFileShortNameW(HANDLE hFile, LPCWSTR lpShortName);
version(UNICODE)
	alias SetFileShortNameW SetFileShortName;
else
	alias SetFileShortNameA SetFileShortName;

export extern(Windows) BOOL CloseHandle(HANDLE hObject);
export extern(Windows) BOOL DuplicateHandle(HANDLE hSourceProcessHandle, HANDLE hSourceHandle, HANDLE hTargetProcessHandle, LPHANDLE lpTargetHandle, DWORD dwDesiredAccess, BOOL bInheritHandle, DWORD dwOptions);
export extern(Windows) BOOL GetHandleInformation(HANDLE hObject, LPDWORD lpdwFlags);
export extern(Windows) BOOL SetHandleInformation(HANDLE hObject, DWORD dwMask, DWORD dwFlags);

enum {
	HANDLE_FLAG_INHERIT            = 0x00000001,
	HANDLE_FLAG_PROTECT_FROM_CLOSE = 0x00000002,
}
enum HINSTANCE_ERROR = 32;

export extern(Windows) DWORD LoadModule(LPCSTR lpModuleName, LPVOID lpParameterBlock);
export extern(Windows) UINT WinExec(LPCSTR lpCmdLine, UINT uCmdShow);
export extern(Windows) BOOL ClearCommBreak(HANDLE hFile);
export extern(Windows) BOOL ClearCommError(HANDLE hFile, LPDWORD lpErrors, LPCOMSTAT lpStat);
export extern(Windows) BOOL SetupComm(HANDLE hFile, DWORD dwInQueue, DWORD dwOutQueue);
export extern(Windows) BOOL EscapeCommFunction(HANDLE hFile, DWORD dwFunc);
export extern(Windows) BOOL GetCommConfig(HANDLE hCommDev, LPCOMMCONFIG lpCC, LPDWORD lpdwSize);
export extern(Windows) BOOL GetCommMask(HANDLE hFile, LPDWORD lpEvtMask);
export extern(Windows) BOOL GetCommProperties(HANDLE hFile, LPCOMMPROP lpCommProp);
export extern(Windows) BOOL GetCommModemStatus(HANDLE hFile, LPDWORD lpModemStat);
export extern(Windows) BOOL GetCommState(HANDLE hFile, LPDCB lpDCB);
export extern(Windows) BOOL GetCommTimeouts(HANDLE hFile, LPCOMMTIMEOUTS lpCommTimeouts);
export extern(Windows) BOOL PurgeComm(HANDLE hFile, DWORD dwFlags);
export extern(Windows) BOOL SetCommBreak(HANDLE hFile);
export extern(Windows) BOOL SetCommConfig(HANDLE hCommDev, LPCOMMCONFIG lpCC, DWORD dwSize);
export extern(Windows) BOOL SetCommMask(HANDLE hFile, DWORD dwEvtMask);
export extern(Windows) BOOL SetCommState(HANDLE hFile, LPDCB lpDCB);
export extern(Windows) BOOL SetCommTimeouts(HANDLE hFile, LPCOMMTIMEOUTS lpCommTimeouts);
export extern(Windows) BOOL TransmitCommChar(HANDLE hFile, char cChar);
export extern(Windows) BOOL WaitCommEvent(HANDLE hFile, LPDWORD lpEvtMask, LPOVERLAPPED lpOverlapped);
export extern(Windows) DWORD SetTapePosition(HANDLE hDevice, DWORD dwPositionMethod, DWORD dwPartition, DWORD dwOffsetLow, DWORD dwOffsetHigh, BOOL bImmediate);
export extern(Windows) DWORD GetTapePosition(HANDLE hDevice, DWORD dwPositionType, LPDWORD lpdwPartition, LPDWORD lpdwOffsetLow, LPDWORD lpdwOffsetHigh);
export extern(Windows) DWORD PrepareTape(HANDLE hDevice, DWORD dwOperation, BOOL bImmediate);
export extern(Windows) DWORD EraseTape(HANDLE hDevice, DWORD dwEraseType, BOOL bImmediate);
export extern(Windows) DWORD CreateTapePartition(HANDLE hDevice, DWORD dwPartitionMethod, DWORD dwCount, DWORD dwSize);
export extern(Windows) DWORD WriteTapemark(HANDLE hDevice, DWORD dwTapemarkType, DWORD dwTapemarkCount, BOOL bImmediate);
export extern(Windows) DWORD GetTapeStatus(HANDLE hDevice);
export extern(Windows) DWORD GetTapeParameters(HANDLE hDevice, DWORD dwOperation, LPDWORD lpdwSize, LPVOID lpTapeInformation);

enum {
	GET_TAPE_MEDIA_INFORMATION = 0,
	GET_TAPE_DRIVE_INFORMATION = 1,
}

export extern(Windows) DWORD SetTapeParameters(HANDLE hDevice, DWORD dwOperation, LPVOID lpTapeInformation);

enum {
	SET_TAPE_MEDIA_INFORMATION = 0,
	SET_TAPE_DRIVE_INFORMATION = 1,
}

export extern(Windows) BOOL Beep(DWORD dwFreq, DWORD dwDuration);
export extern(Windows) int MulDiv(int nNumber, int nNumerator, int nDenominator);
export extern(Windows) VOID GetSystemTime(LPSYSTEMTIME lpSystemTime);
export extern(Windows) VOID GetSystemTimeAsFileTime(LPFILETIME lpSystemTimeAsFileTime);
export extern(Windows) BOOL SetSystemTime(const(SYSTEMTIME)* lpSystemTime);
export extern(Windows) VOID GetLocalTime(LPSYSTEMTIME lpSystemTime);
export extern(Windows) BOOL SetLocalTime(const(SYSTEMTIME)* lpSystemTime);
export extern(Windows) VOID GetSystemInfo(LPSYSTEM_INFO lpSystemInfo);

enum {
	DEPPolicyAlwaysOff = 0,
	DEPPolicyAlwaysOn,
	DEPPolicyOptIn,
	DEPPolicyOptOut,
	DEPTotalPolicyCount
}
alias int DEP_SYSTEM_POLICY_TYPE;

export extern(Windows) DEP_SYSTEM_POLICY_TYPE GetSystemDEPPolicy();

//(_WIN32_WINNT >= _WIN32_WINNT_WS03)
	enum {
		FILE_CACHE_MAX_HARD_ENABLE  = 0x00000001,
		FILE_CACHE_MAX_HARD_DISABLE = 0x00000002,
		FILE_CACHE_MIN_HARD_ENABLE  = 0x00000004,
		FILE_CACHE_MIN_HARD_DISABLE = 0x00000008,
	}

static if(_WIN32_WINNT >= _WIN32_WINNT_WS03){
	export extern(Windows) BOOL SetSystemFileCacheSize(SIZE_T MinimumFileCacheSize, SIZE_T MaximumFileCacheSize, DWORD Flags);
	export extern(Windows) BOOL GetSystemFileCacheSize(PSIZE_T lpMinimumFileCacheSize, PSIZE_T lpMaximumFileCacheSize, PDWORD lpFlags);
}

static if(_WIN32_WINNT >= _WIN32_WINNT_WINXP){
	export extern(Windows) BOOL GetSystemRegistryQuota(PDWORD pdwQuotaAllowed, PDWORD pdwQuotaUsed);
	export extern(Windows) BOOL GetSystemTimes(LPFILETIME lpIdleTime, LPFILETIME lpKernelTime, LPFILETIME lpUserTime);
}

static if(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	export extern(Windows) VOID GetNativeSystemInfo(LPSYSTEM_INFO lpSystemInfo);

export extern(Windows) BOOL IsProcessorFeaturePresent(DWORD ProcessorFeature);

struct TIME_ZONE_INFORMATION {
	LONG Bias;
	WCHAR[32] StandardName;
	SYSTEMTIME StandardDate;
	LONG StandardBias;
	WCHAR[32] DaylightName;
	SYSTEMTIME DaylightDate;
	LONG DaylightBias;
}
alias TIME_ZONE_INFORMATION* PTIME_ZONE_INFORMATION;
alias TIME_ZONE_INFORMATION* LPTIME_ZONE_INFORMATION;

struct DYNAMIC_TIME_ZONE_INFORMATION {
	LONG Bias;
	WCHAR[32] StandardName;
	SYSTEMTIME StandardDate;
	LONG StandardBias;
	WCHAR[32] DaylightName;
	SYSTEMTIME DaylightDate;
	LONG DaylightBias;
	WCHAR[128] TimeZoneKeyName;
	BOOLEAN DynamicDaylightTimeDisabled;
}
alias DYNAMIC_TIME_ZONE_INFORMATION* PDYNAMIC_TIME_ZONE_INFORMATION;

export extern(Windows) BOOL SystemTimeToTzSpecificLocalTime(const(TIME_ZONE_INFORMATION)* lpTimeZoneInformation, const(SYSTEMTIME)* lpUniversalTime, LPSYSTEMTIME lpLocalTime);
export extern(Windows) BOOL TzSpecificLocalTimeToSystemTime(const(TIME_ZONE_INFORMATION)* lpTimeZoneInformation, const(SYSTEMTIME)* lpLocalTime, LPSYSTEMTIME lpUniversalTime);
extern(Windows) BOOL GetTimeZoneInformationForYear(USHORT wYear, PDYNAMIC_TIME_ZONE_INFORMATION pdtzi, LPTIME_ZONE_INFORMATION ptzi);
export extern(Windows) DWORD GetTimeZoneInformation(LPTIME_ZONE_INFORMATION lpTimeZoneInformation);
export extern(Windows) BOOL SetTimeZoneInformation(const(TIME_ZONE_INFORMATION)* lpTimeZoneInformation);
export extern(Windows) DWORD GetDynamicTimeZoneInformation(PDYNAMIC_TIME_ZONE_INFORMATION pTimeZoneInformation);
export extern(Windows) BOOL SetDynamicTimeZoneInformation(const(DYNAMIC_TIME_ZONE_INFORMATION)* lpTimeZoneInformation);
export extern(Windows) BOOL SystemTimeToFileTime(const(SYSTEMTIME)* lpSystemTime, LPFILETIME lpFileTime);
export extern(Windows) BOOL FileTimeToLocalFileTime(const(FILETIME)* lpFileTime, LPFILETIME lpLocalFileTime);
export extern(Windows) BOOL LocalFileTimeToFileTime(const(FILETIME)* lpLocalFileTime,LPFILETIME lpFileTime);
export extern(Windows) BOOL FileTimeToSystemTime(const(FILETIME)* lpFileTime, LPSYSTEMTIME lpSystemTime);
export extern(Windows) LONG CompareFileTime(const(FILETIME)* lpFileTime1, const(FILETIME)* lpFileTime2);
export extern(Windows) BOOL FileTimeToDosDateTime(const(FILETIME)* lpFileTime, LPWORD lpFatDate, LPWORD lpFatTime);
export extern(Windows) BOOL DosDateTimeToFileTime(WORD wFatDate, WORD wFatTime, LPFILETIME lpFileTime);

export extern(Windows) DWORD GetTickCount();

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	export extern(Windows) ULONGLONG GetTickCount64();

export extern(Windows) BOOL SetSystemTimeAdjustment(DWORD dwTimeAdjustment, BOOL bTimeAdjustmentDisabled);
export extern(Windows) BOOL GetSystemTimeAdjustment(PDWORD lpTimeAdjustment, PDWORD lpTimeIncrement, PBOOL lpTimeAdjustmentDisabled);

export extern(Windows) DWORD FormatMessageA(DWORD dwFlags, LPCVOID lpSource, DWORD dwMessageId, DWORD dwLanguageId, LPSTR lpBuffer, DWORD nSize, va_list* Arguments);
export extern(Windows) DWORD FormatMessageW(DWORD dwFlags, LPCVOID lpSource, DWORD dwMessageId, DWORD dwLanguageId, LPWSTR lpBuffer, DWORD nSize, va_list* Arguments);
version(UNICODE)
	alias FormatMessageW FormatMessage;
else
	alias FormatMessageA FormatMessage;

enum {
	FORMAT_MESSAGE_ALLOCATE_BUFFER = 0x00000100,
	FORMAT_MESSAGE_IGNORE_INSERTS  = 0x00000200,
	FORMAT_MESSAGE_FROM_STRING     = 0x00000400,
	FORMAT_MESSAGE_FROM_HMODULE    = 0x00000800,
	FORMAT_MESSAGE_FROM_SYSTEM     = 0x00001000,
	FORMAT_MESSAGE_ARGUMENT_ARRAY  = 0x00002000,
	FORMAT_MESSAGE_MAX_WIDTH_MASK  = 0x000000FF,
}

export extern(Windows) BOOL CreatePipe(PHANDLE hReadPipe,  PHANDLE hWritePipe, LPSECURITY_ATTRIBUTES lpPipeAttributes, DWORD nSize);
export extern(Windows) BOOL ConnectNamedPipe(HANDLE hNamedPipe, LPOVERLAPPED lpOverlapped);
export extern(Windows) BOOL DisconnectNamedPipe(HANDLE hNamedPipe);
export extern(Windows) BOOL SetNamedPipeHandleState(HANDLE hNamedPipe, LPDWORD lpMode, LPDWORD lpMaxCollectionCount, LPDWORD lpCollectDataTimeout);
export extern(Windows) BOOL GetNamedPipeInfo(HANDLE hNamedPipe, LPDWORD lpFlags, LPDWORD lpOutBufferSize, LPDWORD lpInBufferSize, LPDWORD lpMaxInstances);
export extern(Windows) BOOL PeekNamedPipe(HANDLE hNamedPipe, LPVOID lpBuffer, DWORD nBufferSize, LPDWORD lpBytesRead, LPDWORD lpTotalBytesAvail, LPDWORD lpBytesLeftThisMessage);
export extern(Windows) BOOL TransactNamedPipe(HANDLE hNamedPipe, LPVOID lpInBuffer, DWORD nInBufferSize, LPVOID lpOutBuffer, DWORD nOutBufferSize, LPDWORD lpBytesRead, LPOVERLAPPED lpOverlapped);
export extern(Windows) HANDLE CreateMailslotA(LPCSTR lpName, DWORD nMaxMessageSize, DWORD lReadTimeout, LPSECURITY_ATTRIBUTES lpSecurityAttributes);
export extern(Windows) HANDLE CreateMailslotW(LPCWSTR lpName, DWORD nMaxMessageSize, DWORD lReadTimeout, LPSECURITY_ATTRIBUTES lpSecurityAttributes);
version(UNICODE)
	alias CreateMailslotW CreateMailslot;
else
	alias CreateMailslotA CreateMailslot;

export extern(Windows) BOOL GetMailslotInfo(HANDLE hMailslot, LPDWORD lpMaxMessageSize, LPDWORD lpNextSize, LPDWORD lpMessageCount, LPDWORD lpReadTimeout);
export extern(Windows) BOOL SetMailslotInfo(HANDLE hMailslot, DWORD lReadTimeout);
export extern(Windows) LPVOID MapViewOfFile(HANDLE hFileMappingObject, DWORD dwDesiredAccess, DWORD dwFileOffsetHigh, DWORD dwFileOffsetLow, SIZE_T dwNumberOfBytesToMap);
export extern(Windows) BOOL FlushViewOfFile(LPCVOID lpBaseAddress, SIZE_T dwNumberOfBytesToFlush);
export extern(Windows) BOOL UnmapViewOfFile(LPCVOID lpBaseAddress);
export extern(Windows) BOOL EncryptFileA(LPCSTR lpFileName);
export extern(Windows) BOOL EncryptFileW(LPCWSTR lpFileName);
version(UNICODE)
	alias EncryptFileW EncryptFile;
else
	alias EncryptFileA EncryptFile;

export extern(Windows) BOOL DecryptFileA(LPCSTR lpFileName, DWORD dwReserved);
export extern(Windows) BOOL DecryptFileW(LPCWSTR lpFileName, DWORD dwReserved);
version(UNICODE)
	alias DecryptFileW DecryptFile;
else
	alias DecryptFileA DecryptFile;

enum {
	FILE_ENCRYPTABLE        = 0,
	FILE_IS_ENCRYPTED       = 1,
	FILE_SYSTEM_ATTR        = 2,
	FILE_ROOT_DIR           = 3,
	FILE_SYSTEM_DIR         = 4,
	FILE_UNKNOWN            = 5,
	FILE_SYSTEM_NOT_SUPPORT = 6,
	FILE_USER_DISALLOWED    = 7,
	FILE_READ_ONLY          = 8,
	FILE_DIR_DISALLOWED     = 9,
}

export extern(Windows) BOOL FileEncryptionStatusA(LPCSTR lpFileName, LPDWORD lpStatus);
export extern(Windows) BOOL FileEncryptionStatusW(LPCWSTR lpFileName, LPDWORD lpStatus);
version(UNICODE)
	alias FileEncryptionStatusW FileEncryptionStatus;
else
	alias FileEncryptionStatusA FileEncryptionStatus;

enum EFS_USE_RECOVERY_KEYS = 0x1;

alias extern(Windows) DWORD function(PBYTE pbData, PVOID pvCallbackContext, ULONG ulLength) PFE_EXPORT_FUNC;
alias extern(Windows) DWORD function(PBYTE pbData, PVOID pvCallbackContext, PULONG ulLength) PFE_IMPORT_FUNC;
enum {
	CREATE_FOR_IMPORT  = 1,
	CREATE_FOR_DIR     = 2,
	OVERWRITE_HIDDEN   = 4,
	EFSRPC_SECURE_ONLY = 8,
}
export extern(Windows) DWORD OpenEncryptedFileRawA(LPCSTR lpFileName, ULONG ulFlags, PVOID* pvContext);
export extern(Windows) DWORD OpenEncryptedFileRawW(LPCWSTR lpFileName, ULONG ulFlags, PVOID* pvContext);
version(UNICODE)
	alias OpenEncryptedFileRawW OpenEncryptedFileRaw;
else
	alias OpenEncryptedFileRawA OpenEncryptedFileRaw;

export extern(Windows) DWORD ReadEncryptedFileRaw(PFE_EXPORT_FUNC pfExportCallback, PVOID pvCallbackContext, PVOID pvContext);

export extern(Windows) DWORD WriteEncryptedFileRaw(PFE_IMPORT_FUNC pfImportCallback, PVOID pvCallbackContext, PVOID pvContext);
export extern(Windows) VOID CloseEncryptedFileRaw(PVOID pvContext);

export extern(Windows) int lstrcmpA(LPCSTR lpString1, LPCSTR lpString2);
export extern(Windows) int lstrcmpW(LPCWSTR lpString1, LPCWSTR lpString2);
version(UNICODE)
	alias lstrcmpW lstrcmp;
else
	alias lstrcmpA lstrcmp;

export extern(Windows) int lstrcmpiA(LPCSTR lpString1, LPCSTR lpString2);
export extern(Windows) int lstrcmpiW(LPCWSTR lpString1, LPCWSTR lpString2);
version(UNICODE)
	alias lstrcmpiW lstrcmp;
else
	alias lstrcmpiA lstrcmpi;

export extern(Windows) LPSTR lstrcpynA(LPSTR lpString1, LPCSTR lpString2, int iMaxLength);
export extern(Windows) LPWSTR lstrcpynW(LPWSTR lpString1, LPCWSTR lpString2, int iMaxLength);
version(UNICODE)
	alias lstrcpynW lstrcpyn;
else
	alias lstrcpynA lstrcpyn;

export extern(Windows) LPSTR lstrcpyA(LPSTR lpString1, LPCSTR lpString2);
export extern(Windows) LPWSTR lstrcpyW(LPWSTR lpString1, LPCWSTR lpString2);
version(UNICODE)
	alias lstrcpyW lstrcpy;
else
	alias lstrcpyA lstrcpy;

export extern(Windows) LPSTR lstrcatA(LPSTR lpString1, LPCSTR lpString2);
export extern(Windows) LPWSTR lstrcatW(LPWSTR lpString1, LPCWSTR lpString2);
version(UNICODE)
	alias lstrcatW lstrcat;
else
	alias lstrcatA lstrcat;

export extern(Windows) int lstrlenA(LPCSTR lpString);
export extern(Windows) int lstrlenW(LPCWSTR lpString);
version(UNICODE)
	alias lstrlenW lstrlen;
else
	alias lstrlenA lstrlen;

export extern(Windows) HFILE OpenFile(LPCSTR lpFileName, LPOFSTRUCT lpReOpenBuff, UINT uStyle);
export extern(Windows) HFILE _lopen(LPCSTR lpPathName, int iReadWrite);
export extern(Windows) HFILE _lcreat(LPCSTR lpPathName, int iAttribute);
export extern(Windows) UINT _lread(HFILE hFile, LPVOID lpBuffer, UINT uBytes);
export extern(Windows) UINT _lwrite(HFILE hFile, LPCCH lpBuffer, UINT uBytes);
export extern(Windows) int _hread(HFILE hFile, LPVOID lpBuffer, int lBytes);
export extern(Windows) int _hwrite(HFILE hFile, LPCCH lpBuffer, int lBytes);
export extern(Windows) HFILE _lclose(HFILE hFile);
export extern(Windows) LONG _llseek( HFILE hFile, LONG lOffset, int iOrigin);
export extern(Windows) BOOL IsTextUnicode(const(VOID)* lpv, int iSize, LPINT lpiResult);

enum FLS_OUT_OF_INDEXES = cast(DWORD)0xFFFFFFFF;

export extern(Windows) DWORD FlsAlloc(PFLS_CALLBACK_FUNCTION lpCallback);
export extern(Windows) PVOID FlsGetValue(DWORD dwFlsIndex);
export extern(Windows) BOOL FlsSetValue(DWORD dwFlsIndex, PVOID lpFlsData);
export extern(Windows) BOOL FlsFree(DWORD dwFlsIndex);

enum TLS_OUT_OF_INDEXES = cast(DWORD)0xFFFFFFFF;

export extern(Windows) DWORD TlsAlloc();
export extern(Windows) LPVOID TlsGetValue(DWORD dwTlsIndex);
export extern(Windows) BOOL TlsSetValue(DWORD dwTlsIndex, LPVOID lpTlsValue);
export extern(Windows) BOOL TlsFree(DWORD dwTlsIndex);
alias extern(Windows) VOID function(DWORD dwErrorCode, DWORD dwNumberOfBytesTransfered, LPOVERLAPPED lpOverlapped) LPOVERLAPPED_COMPLETION_ROUTINE;
export extern(Windows) DWORD SleepEx(DWORD dwMilliseconds, BOOL bAlertable);
export extern(Windows) DWORD WaitForSingleObjectEx(HANDLE hHandle, DWORD dwMilliseconds, BOOL bAlertable);
export extern(Windows) DWORD WaitForMultipleObjectsEx(DWORD nCount, const(HANDLE)* lpHandles, BOOL bWaitAll, DWORD dwMilliseconds, BOOL bAlertable);
export extern(Windows) DWORD SignalObjectAndWait(HANDLE hObjectToSignal, HANDLE hObjectToWaitOn, DWORD dwMilliseconds, BOOL bAlertable);
export extern(Windows) BOOL ReadFileEx(HANDLE hFile, LPVOID lpBuffer, DWORD nNumberOfBytesToRead, LPOVERLAPPED lpOverlapped, LPOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine);
export extern(Windows) BOOL WriteFileEx(HANDLE hFile, LPCVOID lpBuffer, DWORD nNumberOfBytesToWrite, LPOVERLAPPED lpOverlapped, LPOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine);
export extern(Windows) BOOL BackupRead(HANDLE hFile, LPBYTE lpBuffer, DWORD nNumberOfBytesToRead, LPDWORD lpNumberOfBytesRead,  BOOL bAbort, BOOL bProcessSecurity, LPVOID* lpContext);
export extern(Windows) BOOL BackupSeek(HANDLE hFile, DWORD dwLowBytesToSeek, DWORD dwHighBytesToSeek, LPDWORD lpdwLowByteSeeked, LPDWORD lpdwHighByteSeeked, LPVOID* lpContext);
export extern(Windows) BOOL BackupWrite(HANDLE hFile, LPBYTE lpBuffer, DWORD nNumberOfBytesToWrite, LPDWORD lpNumberOfBytesWritten, BOOL bAbort, BOOL bProcessSecurity, LPVOID* lpContext);

struct WIN32_STREAM_ID {
	DWORD dwStreamId;
	DWORD dwStreamAttributes;
	LARGE_INTEGER Size;
	DWORD dwStreamNameSize;
	WCHAR[ANYSIZE_ARRAY] cStreamName;
}
alias WIN32_STREAM_ID* LPWIN32_STREAM_ID ;

enum {
	BACKUP_INVALID        = 0x00000000,
	BACKUP_DATA           = 0x00000001,
	BACKUP_EA_DATA        = 0x00000002,
	BACKUP_SECURITY_DATA  = 0x00000003,
	BACKUP_ALTERNATE_DATA = 0x00000004,
	BACKUP_LINK           = 0x00000005,
	BACKUP_PROPERTY_DATA  = 0x00000006,
	BACKUP_OBJECT_ID      = 0x00000007,
	BACKUP_REPARSE_DATA   = 0x00000008,
	BACKUP_SPARSE_BLOCK   = 0x00000009,
	BACKUP_TXFS_DATA      = 0x0000000a,
}

enum {
	STREAM_NORMAL_ATTRIBUTE    = 0x00000000,
	STREAM_MODIFIED_WHEN_READ  = 0x00000001,
	STREAM_CONTAINS_SECURITY   = 0x00000002,
	STREAM_CONTAINS_PROPERTIES = 0x00000004,
	STREAM_SPARSE_ATTRIBUTE    = 0x00000008,
}

export extern(Windows) BOOL ReadFileScatter(HANDLE hFile, FILE_SEGMENT_ELEMENT* aSegmentArray, DWORD nNumberOfBytesToRead, LPDWORD lpReserved, LPOVERLAPPED lpOverlapped);
export extern(Windows) BOOL WriteFileGather(HANDLE hFile, FILE_SEGMENT_ELEMENT* aSegmentArray, DWORD nNumberOfBytesToWrite, LPDWORD lpReserved, LPOVERLAPPED lpOverlapped);
enum {
	STARTF_USESHOWWINDOW    = 0x00000001,
	STARTF_USESIZE          = 0x00000002,
	STARTF_USEPOSITION      = 0x00000004,
	STARTF_USECOUNTCHARS    = 0x00000008,
	STARTF_USEFILLATTRIBUTE = 0x00000010,
	STARTF_RUNFULLSCREEN    = 0x00000020,
	STARTF_FORCEONFEEDBACK  = 0x00000040,
	STARTF_FORCEOFFFEEDBACK = 0x00000080,
	STARTF_USESTDHANDLES    = 0x00000100,
	STARTF_USEHOTKEY        = 0x00000200,
	STARTF_TITLEISLINKNAME  = 0x00000800,
	STARTF_TITLEISAPPID     = 0x00001000,
	STARTF_PREVENTPINNING   = 0x00002000,
}

struct STARTUPINFOA {
	DWORD cb;
	LPSTR lpReserved;
	LPSTR lpDesktop;
	LPSTR lpTitle;
	DWORD dwX;
	DWORD dwY;
	DWORD dwXSize;
	DWORD dwYSize;
	DWORD dwXCountChars;
	DWORD dwYCountChars;
	DWORD dwFillAttribute;
	DWORD dwFlags;
	WORD wShowWindow;
	WORD cbReserved2;
	LPBYTE lpReserved2;
	HANDLE hStdInput;
	HANDLE hStdOutput;
	HANDLE hStdError;
}
alias STARTUPINFOA* LPSTARTUPINFOA;
struct STARTUPINFOW {
	DWORD cb;
	LPWSTR lpReserved;
	LPWSTR lpDesktop;
	LPWSTR lpTitle;
	DWORD dwX;
	DWORD dwY;
	DWORD dwXSize;
	DWORD dwYSize;
	DWORD dwXCountChars;
	DWORD dwYCountChars;
	DWORD dwFillAttribute;
	DWORD dwFlags;
	WORD wShowWindow;
	WORD cbReserved2;
	LPBYTE lpReserved2;
	HANDLE hStdInput;
	HANDLE hStdOutput;
	HANDLE hStdError;
}
alias STARTUPINFOW* LPSTARTUPINFOW;
version(UNICODE){
	alias STARTUPINFOW STARTUPINFO;
	alias LPSTARTUPINFOW LPSTARTUPINFO;
}else{
	alias STARTUPINFOA STARTUPINFO;
	alias LPSTARTUPINFOA LPSTARTUPINFO;
}

//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	struct STARTUPINFOEXA {
		STARTUPINFOA StartupInfo;
		LPPROC_THREAD_ATTRIBUTE_LIST lpAttributeList;
	}
	alias STARTUPINFOEXA* LPSTARTUPINFOEXA;
	struct STARTUPINFOEXW {
		STARTUPINFOW StartupInfo;
		LPPROC_THREAD_ATTRIBUTE_LIST lpAttributeList;
	}
	alias STARTUPINFOEXW* LPSTARTUPINFOEXW;
	version(UNICODE){
		alias STARTUPINFOEXW STARTUPINFOEX;
		alias LPSTARTUPINFOEXW LPSTARTUPINFOEX;
	}else{
		alias STARTUPINFOEXA STARTUPINFOEX;
		alias LPSTARTUPINFOEXA LPSTARTUPINFOEX;
	}

enum SHUTDOWN_NORETRY = 0x00000001;

struct WIN32_FIND_DATAA {
	DWORD dwFileAttributes;
	FILETIME ftCreationTime;
	FILETIME ftLastAccessTime;
	FILETIME ftLastWriteTime;
	DWORD nFileSizeHigh;
	DWORD nFileSizeLow;
	DWORD dwReserved0;
	DWORD dwReserved1;
	CHAR[MAX_PATH] cFileName;
	CHAR[14] cAlternateFileName;
}
alias WIN32_FIND_DATAA* PWIN32_FIND_DATAA;
alias WIN32_FIND_DATAA* LPWIN32_FIND_DATAA;
struct WIN32_FIND_DATAW {
	DWORD dwFileAttributes;
	FILETIME ftCreationTime;
	FILETIME ftLastAccessTime;
	FILETIME ftLastWriteTime;
	DWORD nFileSizeHigh;
	DWORD nFileSizeLow;
	DWORD dwReserved0;
	DWORD dwReserved1;
	WCHAR[MAX_PATH] cFileName;
	WCHAR[14] cAlternateFileName;
}
alias WIN32_FIND_DATAW* PWIN32_FIND_DATAW;
alias WIN32_FIND_DATAW* LPWIN32_FIND_DATAW;
version(UNICODE){
	alias WIN32_FIND_DATAW WIN32_FIND_DATA;
	alias PWIN32_FIND_DATAW PWIN32_FIND_DATA;
	alias LPWIN32_FIND_DATAW LPWIN32_FIND_DATA;
}else{
	alias WIN32_FIND_DATAA WIN32_FIND_DATA;
	alias PWIN32_FIND_DATAA PWIN32_FIND_DATA;
	alias LPWIN32_FIND_DATAA LPWIN32_FIND_DATA;
}

struct WIN32_FILE_ATTRIBUTE_DATA {
	DWORD dwFileAttributes;
	FILETIME ftCreationTime;
	FILETIME ftLastAccessTime;
	FILETIME ftLastWriteTime;
	DWORD nFileSizeHigh;
	DWORD nFileSizeLow;
}
alias WIN32_FILE_ATTRIBUTE_DATA* LPWIN32_FILE_ATTRIBUTE_DATA;

export extern(Windows) HANDLE CreateMutexA(LPSECURITY_ATTRIBUTES lpMutexAttributes, BOOL bInitialOwner, LPCSTR lpName);
export extern(Windows) HANDLE CreateMutexW(LPSECURITY_ATTRIBUTES lpMutexAttributes, BOOL bInitialOwner, LPCWSTR lpName);
version(UNICODE)
	alias CreateMutexW CreateMutex;
else
	alias CreateMutexA CreateMutex;

export extern(Windows) HANDLE OpenMutexA(DWORD dwDesiredAccess, BOOL bInheritHandle, LPCSTR lpName);
export extern(Windows) HANDLE OpenMutexW(DWORD dwDesiredAccess, BOOL bInheritHandle, LPCWSTR lpName);
version(UNICODE)
	alias OpenMutexW OpenMutex;
else
	alias OpenMutexA OpenMutex;

export extern(Windows) HANDLE CreateEventA(LPSECURITY_ATTRIBUTES lpEventAttributes, BOOL bManualReset, BOOL bInitialState, LPCSTR lpName);
export extern(Windows) HANDLE CreateEventW(LPSECURITY_ATTRIBUTES lpEventAttributes, BOOL bManualReset, BOOL bInitialState, LPCWSTR lpName);
version(UNICODE)
	alias CreateEventW CreateEvent;
else
	alias CreateEventA CreateEvent;

export extern(Windows) HANDLE OpenEventA(DWORD dwDesiredAccess, BOOL bInheritHandle, LPCSTR lpName);
export extern(Windows) HANDLE OpenEventW(DWORD dwDesiredAccess, BOOL bInheritHandle, LPCWSTR lpName);
version(UNICODE)
	alias OpenEventW OpenEvent;
else
	alias OpenEventA OpenEvent;

export extern(Windows) HANDLE CreateSemaphoreA(LPSECURITY_ATTRIBUTES lpSemaphoreAttributes, LONG lInitialCount, LONG lMaximumCount, LPCSTR lpName);
export extern(Windows) HANDLE CreateSemaphoreW(LPSECURITY_ATTRIBUTES lpSemaphoreAttributes, LONG lInitialCount, LONG lMaximumCount, LPCWSTR lpName);
version(UNICODE)
	alias CreateSemaphoreW CreateSemaphore;
else
	alias CreateSemaphoreA CreateSemaphore;

export extern(Windows) HANDLE OpenSemaphoreA(DWORD dwDesiredAccess, BOOL bInheritHandle, LPCSTR lpName);
export extern(Windows) HANDLE OpenSemaphoreW(DWORD dwDesiredAccess, BOOL bInheritHandle, LPCWSTR lpName);
version(UNICODE)
	alias OpenSemaphoreW OpenSemaphore;
else
	alias OpenSemaphoreA OpenSemaphore;

alias extern(Windows) VOID function(LPVOID lpArgToCompletionRoutine, DWORD dwTimerLowValue, DWORD dwTimerHighValue) PTIMERAPCROUTINE;
export extern(Windows) HANDLE CreateWaitableTimerA(LPSECURITY_ATTRIBUTES lpTimerAttributes, BOOL bManualReset, LPCSTR lpTimerName);
export extern(Windows) HANDLE CreateWaitableTimerW(LPSECURITY_ATTRIBUTES lpTimerAttributes, BOOL bManualReset, LPCWSTR lpTimerName);
version(UNICODE)
	alias CreateWaitableTimerW CreateWaitableTimer;
else
	alias CreateWaitableTimerA CreateWaitableTimer;

export extern(Windows) HANDLE OpenWaitableTimerA(DWORD dwDesiredAccess, BOOL bInheritHandle, LPCSTR lpTimerName);
export extern(Windows) HANDLE OpenWaitableTimerW(DWORD dwDesiredAccess, BOOL bInheritHandle, LPCWSTR lpTimerName);
version(UNICODE)
	alias OpenWaitableTimerW OpenWaitableTimer;
else
	alias OpenWaitableTimerA OpenWaitableTimer;

static if(_WIN32_WINNT >= _WIN32_WINNT_WIN7)
	extern(Windows) BOOL SetWaitableTimerEx(HANDLE hTimer, const(LARGE_INTEGER)* lpDueTime, LONG lPeriod, PTIMERAPCROUTINE pfnCompletionRoutine, LPVOID lpArgToCompletionRoutine, PREASON_CONTEXT WakeContext, ULONG TolerableDelay);

export extern(Windows) BOOL SetWaitableTimer(HANDLE hTimer, const(LARGE_INTEGER)* lpDueTime, LONG lPeriod, PTIMERAPCROUTINE pfnCompletionRoutine, LPVOID lpArgToCompletionRoutine, BOOL fResume);

export extern(Windows) BOOL CancelWaitableTimer(HANDLE hTimer);

//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	enum CREATE_MUTEX_INITIAL_OWNER = 0x00000001;

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	export extern(Windows) HANDLE CreateMutexExA(LPSECURITY_ATTRIBUTES lpMutexAttributes, LPCSTR lpName, DWORD dwFlags, DWORD dwDesiredAccess);
	export extern(Windows) HANDLE CreateMutexExW(LPSECURITY_ATTRIBUTES lpMutexAttributes, LPCWSTR lpName, DWORD dwFlags, DWORD dwDesiredAccess);
	version(UNICODE)
		alias CreateMutexExW CreateMutexEx;
	else
		alias CreateMutexExA CreateMutexEx;
}

//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	enum {
		CREATE_EVENT_MANUAL_RESET = 0x00000001,
		CREATE_EVENT_INITIAL_SET  = 0x00000002,
	}

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	export extern(Windows) HANDLE CreateEventExA(LPSECURITY_ATTRIBUTES lpEventAttributes, LPCSTR lpName, DWORD dwFlags, DWORD dwDesiredAccess);
	export extern(Windows) HANDLE CreateEventExW(LPSECURITY_ATTRIBUTES lpEventAttributes, LPCWSTR lpName, DWORD dwFlags, DWORD dwDesiredAccess);
	version(UNICODE)
		alias CreateEventExW CreateEventEx;
	else
		alias CreateEventExA CreateEventEx;
}

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	export extern(Windows) HANDLE CreateSemaphoreExA(LPSECURITY_ATTRIBUTES lpSemaphoreAttributes, LONG lInitialCount, LONG lMaximumCount, LPCSTR lpName, DWORD dwFlags, DWORD dwDesiredAccess);
	export extern(Windows) HANDLE CreateSemaphoreExW(LPSECURITY_ATTRIBUTES lpSemaphoreAttributes, LONG lInitialCount, LONG lMaximumCount, LPCWSTR lpName, DWORD dwFlags, DWORD dwDesiredAccess);
	version(UNICODE)
		alias CreateSemaphoreExW CreateSemaphoreEx;
	else
		alias CreateSemaphoreExA CreateSemaphoreEx;
}

//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	enum CREATE_WAITABLE_TIMER_MANUAL_RESET = 0x00000001;

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	export extern(Windows) HANDLE CreateWaitableTimerExA(LPSECURITY_ATTRIBUTES lpTimerAttributes, LPCSTR lpTimerName, DWORD dwFlags, DWORD dwDesiredAccess);
	export extern(Windows) HANDLE CreateWaitableTimerExW(LPSECURITY_ATTRIBUTES lpTimerAttributes, LPCWSTR lpTimerName, DWORD dwFlags, DWORD dwDesiredAccess);
	version(UNICODE)
		alias CreateWaitableTimerExW CreateWaitableTimerEx;
	else
		alias CreateWaitableTimerExA CreateWaitableTimerEx;
}

export extern(Windows) HANDLE CreateFileMappingA(HANDLE hFile, LPSECURITY_ATTRIBUTES lpFileMappingAttributes, DWORD flProtect, DWORD dwMaximumSizeHigh, DWORD dwMaximumSizeLow, LPCSTR lpName);
export extern(Windows) HANDLE CreateFileMappingW(HANDLE hFile, LPSECURITY_ATTRIBUTES lpFileMappingAttributes, DWORD flProtect, DWORD dwMaximumSizeHigh, DWORD dwMaximumSizeLow, LPCWSTR lpName);
version(UNICODE)
	alias CreateFileMappingW CreateFileMapping;
else
	alias CreateFileMappingA CreateFileMapping;

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	export extern(Windows) HANDLE CreateFileMappingNumaA(HANDLE hFile, LPSECURITY_ATTRIBUTES lpFileMappingAttributes, DWORD flProtect, DWORD dwMaximumSizeHigh, DWORD dwMaximumSizeLow, LPCSTR lpName, DWORD nndPreferred);
	export extern(Windows) HANDLE CreateFileMappingNumaW(HANDLE hFile, LPSECURITY_ATTRIBUTES lpFileMappingAttributes, DWORD flProtect, DWORD dwMaximumSizeHigh, DWORD dwMaximumSizeLow, LPCWSTR lpName, DWORD nndPreferred);
	version(UNICODE)
		alias CreateFileMappingNumaW CreateFileMappingNuma;
	else
		alias CreateFileMappingNumaA CreateFileMappingNuma;
}

export extern(Windows) HANDLE OpenFileMappingA(DWORD dwDesiredAccess, BOOL bInheritHandle, LPCSTR lpName);
export extern(Windows) HANDLE OpenFileMappingW(DWORD dwDesiredAccess, BOOL bInheritHandle, LPCWSTR lpName);
version(UNICODE)
	alias OpenFileMappingW OpenFileMapping;
else
	alias OpenFileMappingA OpenFileMapping;

export extern(Windows) DWORD GetLogicalDriveStringsA(DWORD nBufferLength, LPSTR lpBuffer);
export extern(Windows) DWORD GetLogicalDriveStringsW(DWORD nBufferLength, LPWSTR lpBuffer);
version(UNICODE)
	alias GetLogicalDriveStringsW GetLogicalDriveStrings;
else
	alias GetLogicalDriveStringsA GetLogicalDriveStrings;

//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	enum {
		LowMemoryResourceNotification,
		HighMemoryResourceNotification
	}
	alias int MEMORY_RESOURCE_NOTIFICATION_TYPE;
static if(_WIN32_WINNT >= _WIN32_WINNT_WINXP){
	export extern(Windows) HANDLE CreateMemoryResourceNotification(MEMORY_RESOURCE_NOTIFICATION_TYPE NotificationType);
	export extern(Windows) BOOL QueryMemoryResourceNotification(HANDLE ResourceNotificationHandle, PBOOL ResourceState);
}

export extern(Windows) HMODULE LoadLibraryA(LPCSTR lpLibFileName);
export extern(Windows) HMODULE LoadLibraryW(LPCWSTR lpLibFileName);
version(UNICODE)
	alias LoadLibraryW LoadLibrary;
else
	alias LoadLibraryA LoadLibrary;

export extern(Windows) HMODULE LoadLibraryExA(LPCSTR lpLibFileName, HANDLE hFile, DWORD dwFlags);
export extern(Windows) HMODULE LoadLibraryExW(LPCWSTR lpLibFileName, HANDLE hFile, DWORD dwFlags);
version(UNICODE)
	alias LoadLibraryExW LoadLibraryEx;
else
	alias LoadLibraryExA LoadLibraryEx;

enum {
	DONT_RESOLVE_DLL_REFERENCES        = 0x00000001,
	LOAD_LIBRARY_AS_DATAFILE           = 0x00000002,
	LOAD_WITH_ALTERED_SEARCH_PATH      = 0x00000008,
	LOAD_IGNORE_CODE_AUTHZ_LEVEL       = 0x00000010,
	LOAD_LIBRARY_AS_IMAGE_RESOURCE     = 0x00000020,
	LOAD_LIBRARY_AS_DATAFILE_EXCLUSIVE = 0x00000040,
	LOAD_LIBRARY_REQUIRE_SIGNED_TARGET = 0x00000080,
}

export extern(Windows) DWORD GetModuleFileNameA(HMODULE hModule, LPSTR lpFilename, DWORD nSize);
export extern(Windows) DWORD GetModuleFileNameW(HMODULE hModule, LPWSTR lpFilename, DWORD nSize);
version(UNICODE)
	alias GetModuleFileNameW GetModuleFileName;
else
	alias GetModuleFileNameA GetModuleFileName;

export extern(Windows) HMODULE GetModuleHandleA(LPCSTR lpModuleName);
export extern(Windows) HMODULE GetModuleHandleW(LPCWSTR lpModuleName);
version(UNICODE)
	alias GetModuleHandleW GetModuleHandle;
else
	alias GetModuleHandleA GetModuleHandle;

enum {
	GET_MODULE_HANDLE_EX_FLAG_PIN                = 0x00000001,
	GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT = 0x00000002,
	GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS       = 0x00000004,
}

alias extern(Windows) BOOL function(DWORD dwFlags, LPCSTR lpModuleName, HMODULE* phModule) PGET_MODULE_HANDLE_EXA;
alias extern(Windows) BOOL function(DWORD dwFlags, LPCWSTR lpModuleName, HMODULE* phModule) PGET_MODULE_HANDLE_EXW;
version(UNICODE)
	alias PGET_MODULE_HANDLE_EXW PGET_MODULE_HANDLE_EX;
else
	alias PGET_MODULE_HANDLE_EXA PGET_MODULE_HANDLE_EX;

export extern(Windows) BOOL GetModuleHandleExA(DWORD dwFlags, LPCSTR lpModuleName, HMODULE* phModule);
export extern(Windows) BOOL GetModuleHandleExW(DWORD dwFlags, LPCWSTR lpModuleName, HMODULE* phModule);
version(UNICODE)
	alias GetModuleHandleExW GetModuleHandleEx;
else
	alias GetModuleHandleExA GetModuleHandleEx;

static if(_WIN32_WINNT >= _WIN32_WINNT_WS03){
	export extern(Windows) BOOL NeedCurrentDirectoryForExePathA(LPCSTR ExeName);
	export extern(Windows) BOOL NeedCurrentDirectoryForExePathW(LPCWSTR ExeName);
	version(UNICODE)
		alias NeedCurrentDirectoryForExePathW NeedCurrentDirectoryForExePath;
	else
		alias NeedCurrentDirectoryForExePathA NeedCurrentDirectoryForExePath;
}

//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	enum PROCESS_NAME_NATIVE = 0x00000001;
static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	export extern(Windows) BOOL QueryFullProcessImageNameA(HANDLE hProcess, DWORD dwFlags, LPSTR lpExeName, PDWORD lpdwSize);
	export extern(Windows) BOOL QueryFullProcessImageNameW(HANDLE hProcess, DWORD dwFlags, LPWSTR lpExeName, PDWORD lpdwSize);
	version(UNICODE)
		alias QueryFullProcessImageNameW QueryFullProcessImageName;
	else
		alias QueryFullProcessImageNameA QueryFullProcessImageName;
}

//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	enum {
		PROC_THREAD_ATTRIBUTE_NUMBER   = 0x0000FFFF,
		PROC_THREAD_ATTRIBUTE_THREAD   = 0x00010000,
		PROC_THREAD_ATTRIBUTE_INPUT    = 0x00020000,
		PROC_THREAD_ATTRIBUTE_ADDITIVE = 0x00040000,
	}
	enum {
		ProcThreadAttributeParentProcess = 0,
		ProcThreadAttributeExtendedFlags,
		ProcThreadAttributeHandleList,
		ProcThreadAttributeGroupAffinity,
		ProcThreadAttributePreferredNode,
		ProcThreadAttributeIdealProcessor,
		ProcThreadAttributeUmsThread,
		ProcThreadAttributeMitigationPolicy,
		ProcThreadAttributeMax
	}
	alias int PROC_THREAD_ATTRIBUTE_NUM;

	//#define ProcThreadAttributeValue(Number, Thread, Input, Additive) (((Number) & PROC_THREAD_ATTRIBUTE_NUMBER) | 	 ((Thread != FALSE) ? PROC_THREAD_ATTRIBUTE_THREAD : 0) | 	 ((Input != FALSE) ? PROC_THREAD_ATTRIBUTE_INPUT : 0) | 	 ((Additive != FALSE) ? PROC_THREAD_ATTRIBUTE_ADDITIVE : 0))
	//#define PROC_THREAD_ATTRIBUTE_PARENT_PROCESS 	 ProcThreadAttributeValue (ProcThreadAttributeParentProcess, FALSE, TRUE, FALSE)
	//#define PROC_THREAD_ATTRIBUTE_EXTENDED_FLAGS 	 ProcThreadAttributeValue (ProcThreadAttributeExtendedFlags, FALSE, TRUE, TRUE)
	//#define PROC_THREAD_ATTRIBUTE_HANDLE_LIST 	 ProcThreadAttributeValue (ProcThreadAttributeHandleList, FALSE, TRUE, FALSE)
	//#define PROC_THREAD_ATTRIBUTE_GROUP_AFFINITY 	 ProcThreadAttributeValue (ProcThreadAttributeGroupAffinity, TRUE, TRUE, FALSE)
	//#define PROC_THREAD_ATTRIBUTE_PREFERRED_NODE 	 ProcThreadAttributeValue (ProcThreadAttributePreferredNode, FALSE, TRUE, FALSE)
	//#define PROC_THREAD_ATTRIBUTE_IDEAL_PROCESSOR 	 ProcThreadAttributeValue (ProcThreadAttributeIdealProcessor, TRUE, TRUE, FALSE)
	//#define PROC_THREAD_ATTRIBUTE_UMS_THREAD 	 ProcThreadAttributeValue (ProcThreadAttributeUmsThread, TRUE, TRUE, FALSE)
	//#define PROC_THREAD_ATTRIBUTE_MITIGATION_POLICY 	 ProcThreadAttributeValue (ProcThreadAttributeMitigationPolicy, FALSE, TRUE, FALSE)

	enum {
		PROCESS_CREATION_MITIGATION_POLICY_DEP_ENABLE           = 0x01,
		PROCESS_CREATION_MITIGATION_POLICY_DEP_ATL_THUNK_ENABLE = 0x02,
		PROCESS_CREATION_MITIGATION_POLICY_SEHOP_ENABLE         = 0x04,
	}
static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	export extern(Windows) BOOL InitializeProcThreadAttributeList(LPPROC_THREAD_ATTRIBUTE_LIST lpAttributeList, DWORD dwAttributeCount, DWORD dwFlags, PSIZE_T lpSize);
	export extern(Windows) VOID DeleteProcThreadAttributeList(LPPROC_THREAD_ATTRIBUTE_LIST lpAttributeList);
}

//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	enum PROC_THREAD_ATTRIBUTE_REPLACE_VALUE = 0x00000001;
static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	export extern(Windows) BOOL UpdateProcThreadAttribute(LPPROC_THREAD_ATTRIBUTE_LIST lpAttributeList, DWORD dwFlags, DWORD_PTR Attribute, PVOID lpValue, SIZE_T cbSize, PVOID lpPreviousValue, PSIZE_T lpReturnSize);
}

export extern(Windows) BOOL CreateProcessA(LPCSTR lpApplicationName, LPSTR lpCommandLine, LPSECURITY_ATTRIBUTES lpProcessAttributes, LPSECURITY_ATTRIBUTES lpThreadAttributes, BOOL bInheritHandles, DWORD dwCreationFlags, LPVOID lpEnvironment, LPCSTR lpCurrentDirectory, LPSTARTUPINFOA lpStartupInfo, LPPROCESS_INFORMATION lpProcessInformation);
export extern(Windows) BOOL CreateProcessW(LPCWSTR lpApplicationName, LPWSTR lpCommandLine, LPSECURITY_ATTRIBUTES lpProcessAttributes, LPSECURITY_ATTRIBUTES lpThreadAttributes, BOOL bInheritHandles, DWORD dwCreationFlags, LPVOID lpEnvironment, LPCWSTR lpCurrentDirectory, LPSTARTUPINFOW lpStartupInfo, LPPROCESS_INFORMATION lpProcessInformation);
version(UNICODE)
	alias CreateProcessW CreateProcess;
else
	alias CreateProcessA CreateProcess;

export extern(Windows) BOOL SetProcessShutdownParameters(DWORD dwLevel, DWORD dwFlags);

export extern(Windows) BOOL GetProcessShutdownParameters(LPDWORD lpdwLevel, LPDWORD lpdwFlags);
export extern(Windows) DWORD GetProcessVersion(DWORD ProcessId);
export extern(Windows) VOID FatalAppExitA(UINT uAction, LPCSTR lpMessageText);
export extern(Windows) VOID FatalAppExitW(UINT uAction, LPCWSTR lpMessageText);
version(UNICODE)
	alias FatalAppExitW FatalAppExit;
else
	alias FatalAppExitA FatalAppExit;

export extern(Windows) VOID GetStartupInfoA(LPSTARTUPINFOA lpStartupInfo);
export extern(Windows) VOID GetStartupInfoW(LPSTARTUPINFOW lpStartupInfo);
version(UNICODE)
	alias GetStartupInfoW GetStartupInfo;
else
	alias GetStartupInfoA GetStartupInfo;

export extern(Windows) LPSTR GetCommandLineA();
export extern(Windows) LPWSTR GetCommandLineW();
version(UNICODE)
	alias GetCommandLineW GetCommandLine;
else
	alias GetCommandLineA GetCommandLine;

export extern(Windows) DWORD GetEnvironmentVariableA(LPCSTR lpName, LPSTR lpBuffer, DWORD nSize);
export extern(Windows) DWORD GetEnvironmentVariableW(LPCWSTR lpName, LPWSTR lpBuffer, DWORD nSize);
version(UNICODE)
	alias GetEnvironmentVariableW GetEnvironmentVariable;
else
	alias GetEnvironmentVariableA GetEnvironmentVariable;

export extern(Windows) BOOL SetEnvironmentVariableA(LPCSTR lpName, LPCSTR lpValue);
export extern(Windows) BOOL SetEnvironmentVariableW(LPCWSTR lpName, LPCWSTR lpValue);
version(UNICODE)
	alias SetEnvironmentVariableW SetEnvironmentVariable;
else
	alias SetEnvironmentVariableA SetEnvironmentVariable;

export extern(Windows) DWORD ExpandEnvironmentStringsA(LPCSTR lpSrc, LPSTR lpDst, DWORD nSize);
export extern(Windows) DWORD ExpandEnvironmentStringsW(LPCWSTR lpSrc, LPWSTR lpDst, DWORD nSize);
version(UNICODE)
	alias ExpandEnvironmentStringsW ExpandEnvironmentStrings;
else
	alias ExpandEnvironmentStringsA ExpandEnvironmentStrings;

export extern(Windows) DWORD GetFirmwareEnvironmentVariableA(LPCSTR lpName, LPCSTR lpGuid, PVOID pBuffer, DWORD nSize);
export extern(Windows) DWORD GetFirmwareEnvironmentVariableW(LPCWSTR lpName, LPCWSTR lpGuid, PVOID pBuffer, DWORD nSize);
version(UNICODE)
	alias GetFirmwareEnvironmentVariableW GetFirmwareEnvironmentVariable;
else
	alias GetFirmwareEnvironmentVariableA GetFirmwareEnvironmentVariable;

export extern(Windows) BOOL SetFirmwareEnvironmentVariableA(LPCSTR lpName, LPCSTR lpGuid, PVOID pValue, DWORD nSize);
export extern(Windows) BOOL SetFirmwareEnvironmentVariableW(LPCWSTR lpName, LPCWSTR lpGuid, PVOID pValue, DWORD nSize);
version(UNICODE)
	alias SetFirmwareEnvironmentVariableW SetFirmwareEnvironmentVariable;
else
	alias SetFirmwareEnvironmentVariableA SetFirmwareEnvironmentVariable;

export extern(Windows) VOID OutputDebugStringA(LPCSTR lpOutputString);
export extern(Windows) VOID OutputDebugStringW(LPCWSTR lpOutputString);
version(UNICODE)
	alias OutputDebugStringW OutputDebugString;
else
	alias OutputDebugStringA OutputDebugString;

export extern(Windows) HRSRC FindResourceA(HMODULE hModule, LPCSTR lpName, LPCSTR lpType);
export extern(Windows) HRSRC FindResourceW(HMODULE hModule, LPCWSTR lpName, LPCWSTR lpType);
version(UNICODE)
	alias FindResourceW FindResource;
else
	alias FindResourceA FindResource;

export extern(Windows) HRSRC FindResourceExA(HMODULE hModule, LPCSTR lpType, LPCSTR lpName, WORD wLanguage);
export extern(Windows) HRSRC FindResourceExW(HMODULE hModule, LPCWSTR lpType, LPCWSTR lpName, WORD wLanguage);
version(UNICODE)
	alias FindResourceExW FindResourceEx;
else
	alias FindResourceExA FindResourceEx;

alias extern(Windows) BOOL function(HMODULE hModule, LPSTR lpType, LONG_PTR lParam) ENUMRESTYPEPROCA;
alias extern(Windows) BOOL function(HMODULE hModule, LPWSTR lpType, LONG_PTR lParam) ENUMRESTYPEPROCW;
version(UNICODE)
	alias ENUMRESTYPEPROCW ENUMRESTYPEPROC;
else
	alias ENUMRESTYPEPROCA ENUMRESTYPEPROC;

alias extern(Windows) BOOL function(HMODULE hModule, LPCSTR lpType, LPSTR lpName, LONG_PTR lParam) ENUMRESNAMEPROCA;
alias extern(Windows) BOOL function(HMODULE hModule, LPCWSTR lpType, LPWSTR lpName, LONG_PTR lParam) ENUMRESNAMEPROCW;
version(UNICODE)
	alias ENUMRESNAMEPROCW ENUMRESNAMEPROC;
else
	alias ENUMRESNAMEPROCA ENUMRESNAMEPROC;

alias extern(Windows) BOOL function(HMODULE hModule, LPCSTR lpType, LPCSTR lpName, WORD wLanguage, LONG_PTR lParam) ENUMRESLANGPROCA;
alias extern(Windows) BOOL function(HMODULE hModule, LPCWSTR lpType, LPCWSTR lpName, WORD wLanguage, LONG_PTR lParam) ENUMRESLANGPROCW;
version(UNICODE)
	alias ENUMRESLANGPROCW ENUMRESLANGPROC;
else
	alias ENUMRESLANGPROCA ENUMRESLANGPROC;

export extern(Windows) BOOL EnumResourceTypesA(HMODULE hModule, ENUMRESTYPEPROCA lpEnumFunc, LONG_PTR lParam);
export extern(Windows) BOOL EnumResourceTypesW(HMODULE hModule, ENUMRESTYPEPROCW lpEnumFunc, LONG_PTR lParam);
version(UNICODE)
	alias EnumResourceTypesW EnumResourceTypes;
else
	alias EnumResourceTypesA EnumResourceTypes;

export extern(Windows) BOOL EnumResourceNamesA(HMODULE hModule, LPCSTR lpType, ENUMRESNAMEPROCA lpEnumFunc, LONG_PTR lParam);
export extern(Windows) BOOL EnumResourceNamesW(HMODULE hModule, LPCWSTR lpType, ENUMRESNAMEPROCW lpEnumFunc, LONG_PTR lParam);
version(UNICODE)
	alias EnumResourceNamesW EnumResourceNames;
else
	alias EnumResourceNamesA EnumResourceNames;

export extern(Windows) BOOL EnumResourceLanguagesA(HMODULE hModule, LPCSTR lpType, LPCSTR lpName, ENUMRESLANGPROCA lpEnumFunc, LONG_PTR lParam);
export extern(Windows) BOOL EnumResourceLanguagesW(HMODULE hModule, LPCWSTR lpType, LPCWSTR lpName, ENUMRESLANGPROCW lpEnumFunc, LONG_PTR lParam);
version(UNICODE)
	alias EnumResourceLanguagesW EnumResourceLanguages;
else
	alias EnumResourceLanguagesA EnumResourceLanguages;

enum {
	RESOURCE_ENUM_LN           = 0x0001,
	RESOURCE_ENUM_MUI          = 0x0002,
	RESOURCE_ENUM_MUI_SYSTEM   = 0x0004,
	RESOURCE_ENUM_VALIDATE     = 0x0008,
	RESOURCE_ENUM_MODULE_EXACT = 0x0010,
}

export extern(Windows) BOOL EnumResourceTypesExA(HMODULE hModule, ENUMRESTYPEPROCA lpEnumFunc, LONG_PTR lParam, DWORD dwFlags, LANGID LangId);
export extern(Windows) BOOL EnumResourceTypesExW(HMODULE hModule, ENUMRESTYPEPROCW lpEnumFunc, LONG_PTR lParam, DWORD dwFlags, LANGID LangId);
version(UNICODE)
	alias EnumResourceTypesExW EnumResourceTypesEx;
else
	alias EnumResourceTypesExA EnumResourceTypesEx;

export extern(Windows) BOOL EnumResourceNamesExA(HMODULE hModule, LPCSTR lpType, ENUMRESNAMEPROCA lpEnumFunc, LONG_PTR lParam, DWORD dwFlags, LANGID LangId);
export extern(Windows) BOOL EnumResourceNamesExW(HMODULE hModule, LPCWSTR lpType, ENUMRESNAMEPROCW lpEnumFunc, LONG_PTR lParam, DWORD dwFlags, LANGID LangId);
version(UNICODE)
	alias EnumResourceNamesExW EnumResourceNamesEx;
else
	alias EnumResourceNamesExA EnumResourceNamesEx;

export extern(Windows) BOOL EnumResourceLanguagesExA(HMODULE hModule, LPCSTR lpType, LPCSTR lpName, ENUMRESLANGPROCA lpEnumFunc, LONG_PTR lParam, DWORD dwFlags, LANGID LangId);
export extern(Windows) BOOL EnumResourceLanguagesExW(HMODULE hModule, LPCWSTR lpType, LPCWSTR lpName, ENUMRESLANGPROCW lpEnumFunc, LONG_PTR lParam, DWORD dwFlags, LANGID LangId);
version(UNICODE)
	alias EnumResourceLanguagesExW EnumResourceLanguagesEx;
else
	alias EnumResourceLanguagesExA EnumResourceLanguagesEx;

export extern(Windows) HANDLE BeginUpdateResourceA(LPCSTR pFileName, BOOL bDeleteExistingResources);
export extern(Windows) HANDLE BeginUpdateResourceW(LPCWSTR pFileName, BOOL bDeleteExistingResources);
version(UNICODE)
	alias BeginUpdateResourceW BeginUpdateResource;
else
	alias BeginUpdateResourceA BeginUpdateResource;

export extern(Windows) BOOL UpdateResourceA(HANDLE hUpdate, LPCSTR lpType, LPCSTR lpName, WORD wLanguage, LPVOID lpData, DWORD cb);
export extern(Windows) BOOL UpdateResourceW(HANDLE hUpdate, LPCWSTR lpType, LPCWSTR lpName, WORD wLanguage, LPVOID lpData, DWORD cb);
version(UNICODE)
	alias UpdateResourceW UpdateResource;
else
	alias UpdateResourceA UpdateResource;

export extern(Windows) BOOL EndUpdateResourceA(HANDLE hUpdate, BOOL fDiscard);
export extern(Windows) BOOL EndUpdateResourceW(HANDLE hUpdate, BOOL fDiscard);
version(UNICODE)
	alias EndUpdateResourceW EndUpdateResource;
else
	alias EndUpdateResourceA EndUpdateResource;

export extern(Windows) ATOM GlobalAddAtomA(LPCSTR lpString);
export extern(Windows) ATOM GlobalAddAtomW(LPCWSTR lpString);
version(UNICODE)
	alias GlobalAddAtomW GlobalAddAtom;
else
	alias GlobalAddAtomA GlobalAddAtom;

export extern(Windows) ATOM GlobalFindAtomA(LPCSTR lpString);
export extern(Windows) ATOM GlobalFindAtomW(LPCWSTR lpString);
version(UNICODE)
	alias GlobalFindAtomW GlobalFindAtom;
else
	alias GlobalFindAtomA GlobalFindAtom;

export extern(Windows) UINT GlobalGetAtomNameA(ATOM nAtom, LPSTR lpBuffer, int nSize);
export extern(Windows) UINT GlobalGetAtomNameW(ATOM nAtom, LPWSTR lpBuffer, int nSize);
version(UNICODE)
	alias GlobalGetAtomNameW GlobalGetAtomName;
else
	alias GlobalGetAtomNameA GlobalGetAtomName;

export extern(Windows) ATOM AddAtomA(LPCSTR lpString);
export extern(Windows) ATOM AddAtomW(LPCWSTR lpString);
version(UNICODE)
	alias AddAtomW AddAtom;
else
	alias AddAtomA AddAtom;

export extern(Windows) ATOM FindAtomA(LPCSTR lpString);
export extern(Windows) ATOM FindAtomW(LPCWSTR lpString);
version(UNICODE)
	alias FindAtomW FindAtom;
else
	alias FindAtomA FindAtom;

export extern(Windows) UINT GetAtomNameA(ATOM nAtom, LPSTR lpBuffer, int nSize);
export extern(Windows) UINT GetAtomNameW(ATOM nAtom, LPWSTR lpBuffer, int nSize);
version(UNICODE)
	alias GetAtomNameW GetAtomName;
else
	alias GetAtomNameA GetAtomName;

export extern(Windows) UINT GetProfileIntA(LPCSTR lpAppName, LPCSTR lpKeyName, INT nDefault);
export extern(Windows) UINT GetProfileIntW(LPCWSTR lpAppName, LPCWSTR lpKeyName, INT nDefault);
version(UNICODE)
	alias GetProfileIntW GetProfileInt;
else
	alias GetProfileIntA GetProfileInt;

export extern(Windows) DWORD GetProfileStringA(LPCSTR lpAppName, LPCSTR lpKeyName, LPCSTR lpDefault, LPSTR lpReturnedString, DWORD nSize);
export extern(Windows) DWORD GetProfileStringW(LPCWSTR lpAppName, LPCWSTR lpKeyName, LPCWSTR lpDefault, LPWSTR lpReturnedString, DWORD nSize);
version(UNICODE)
	alias GetProfileStringW GetProfileString;
else
	alias GetProfileStringA GetProfileString;

export extern(Windows) BOOL WriteProfileStringA(LPCSTR lpAppName, LPCSTR lpKeyName, LPCSTR lpString);
export extern(Windows) BOOL WriteProfileStringW(LPCWSTR lpAppName, LPCWSTR lpKeyName, LPCWSTR lpString);
version(UNICODE)
	alias WriteProfileStringW WriteProfileString;
else
	alias WriteProfileStringA WriteProfileString;

export extern(Windows) DWORD GetProfileSectionA(LPCSTR lpAppName, LPSTR lpReturnedString, DWORD nSize);
export extern(Windows) DWORD GetProfileSectionW(LPCWSTR lpAppName, LPWSTR lpReturnedString, DWORD nSize);
version(UNICODE)
	alias GetProfileSectionW GetProfileSection;
else
	alias GetProfileSectionA GetProfileSection;

export extern(Windows) BOOL WriteProfileSectionA(LPCSTR lpAppName, LPCSTR lpString);
export extern(Windows) BOOL WriteProfileSectionW(LPCWSTR lpAppName, LPCWSTR lpString);
version(UNICODE)
	alias WriteProfileSectionW WriteProfileSection;
else
	alias WriteProfileSectionA WriteProfileSection;

export extern(Windows) UINT GetPrivateProfileIntA(LPCSTR lpAppName, LPCSTR lpKeyName, INT nDefault, LPCSTR lpFileName);
export extern(Windows) UINT GetPrivateProfileIntW(LPCWSTR lpAppName, LPCWSTR lpKeyName, INT nDefault, LPCWSTR lpFileName);
version(UNICODE)
	alias GetPrivateProfileIntW GetPrivateProfileInt;
else
	alias GetPrivateProfileIntA GetPrivateProfileInt;

export extern(Windows) DWORD GetPrivateProfileStringA(LPCSTR lpAppName, LPCSTR lpKeyName, LPCSTR lpDefault, LPSTR lpReturnedString, DWORD nSize, LPCSTR lpFileName);
export extern(Windows) DWORD GetPrivateProfileStringW(LPCWSTR lpAppName, LPCWSTR lpKeyName, LPCWSTR lpDefault, LPWSTR lpReturnedString, DWORD nSize, LPCWSTR lpFileName);
version(UNICODE)
	alias GetPrivateProfileStringW GetPrivateProfileString;
else
	alias GetPrivateProfileStringA GetPrivateProfileString;

export extern(Windows) BOOL WritePrivateProfileStringA(LPCSTR lpAppName, LPCSTR lpKeyName, LPCSTR lpString, LPCSTR lpFileName);
export extern(Windows) BOOL WritePrivateProfileStringW(LPCWSTR lpAppName, LPCWSTR lpKeyName, LPCWSTR lpString, LPCWSTR lpFileName);
version(UNICODE)
	alias WritePrivateProfileStringW WritePrivateProfileString;
else
	alias WritePrivateProfileStringA WritePrivateProfileString;

export extern(Windows) DWORD GetPrivateProfileSectionA(LPCSTR lpAppName, LPSTR lpReturnedString, DWORD nSize, LPCSTR lpFileName);
export extern(Windows) DWORD GetPrivateProfileSectionW(LPCWSTR lpAppName, LPWSTR lpReturnedString, DWORD nSize, LPCWSTR lpFileName);
version(UNICODE)
	alias GetPrivateProfileSectionW GetPrivateProfileSection;
else
	alias GetPrivateProfileSectionA GetPrivateProfileSection;

export extern(Windows) BOOL WritePrivateProfileSectionA(LPCSTR lpAppName, LPCSTR lpString, LPCSTR lpFileName);
export extern(Windows) BOOL WritePrivateProfileSectionW(LPCWSTR lpAppName, LPCWSTR lpString, LPCWSTR lpFileName);
version(UNICODE)
	alias WritePrivateProfileSectionW WritePrivateProfileSection;
else
	alias WritePrivateProfileSectionA WritePrivateProfileSection;

export extern(Windows) DWORD GetPrivateProfileSectionNamesA(LPSTR lpszReturnBuffer, DWORD nSize, LPCSTR lpFileName);
export extern(Windows) DWORD GetPrivateProfileSectionNamesW(LPWSTR lpszReturnBuffer, DWORD nSize, LPCWSTR lpFileName);
version(UNICODE)
	alias GetPrivateProfileSectionNamesW GetPrivateProfileSectionNames;
else
	alias GetPrivateProfileSectionNamesA GetPrivateProfileSectionNames;

export extern(Windows) BOOL GetPrivateProfileStructA(LPCSTR lpszSection, LPCSTR lpszKey, LPVOID lpStruct, UINT uSizeStruct, LPCSTR szFile);
export extern(Windows) BOOL GetPrivateProfileStructW(LPCWSTR lpszSection, LPCWSTR lpszKey, LPVOID lpStruct, UINT uSizeStruct, LPCWSTR szFile);
version(UNICODE)
	alias GetPrivateProfileStructW GetPrivateProfileStruct;
else
	alias GetPrivateProfileStructA GetPrivateProfileStruct;

export extern(Windows) BOOL WritePrivateProfileStructA(LPCSTR lpszSection, LPCSTR lpszKey, LPVOID lpStruct, UINT uSizeStruct, LPCSTR szFile);
export extern(Windows) BOOL WritePrivateProfileStructW(LPCWSTR lpszSection, LPCWSTR lpszKey, LPVOID lpStruct, UINT uSizeStruct, LPCWSTR szFile);
version(UNICODE)
	alias WritePrivateProfileStructW WritePrivateProfileStruct;
else
	alias WritePrivateProfileStructA WritePrivateProfileStruct;

export extern(Windows) UINT GetDriveTypeA(LPCSTR lpRootPathName);
export extern(Windows) UINT GetDriveTypeW(LPCWSTR lpRootPathName);
version(UNICODE)
	alias GetDriveTypeW GetDriveType;
else
	alias GetDriveTypeA GetDriveType;

export extern(Windows) UINT GetSystemDirectoryA(LPSTR lpBuffer, UINT uSize);
export extern(Windows) UINT GetSystemDirectoryW(LPWSTR lpBuffer, UINT uSize);
version(UNICODE)
	alias GetSystemDirectoryW GetSystemDirectory;
else
	alias GetSystemDirectoryA GetSystemDirectory;

export extern(Windows) DWORD GetTempPathA(DWORD nBufferLength, LPSTR lpBuffer);
export extern(Windows) DWORD GetTempPathW(DWORD nBufferLength, LPWSTR lpBuffer);
version(UNICODE)
	alias GetTempPathW GetTempPath;
else
	alias GetTempPathA GetTempPath;

export extern(Windows) UINT GetTempFileNameA(LPCSTR lpPathName, LPCSTR lpPrefixString, UINT uUnique, LPSTR lpTempFileName);
export extern(Windows) UINT GetTempFileNameW(LPCWSTR lpPathName, LPCWSTR lpPrefixString, UINT uUnique, LPWSTR lpTempFileName);
version(UNICODE)
	alias GetTempFileNameW GetTempFileName;
else
	alias GetTempFileNameA GetTempFileName;

export extern(Windows) UINT GetWindowsDirectoryA(LPSTR lpBuffer, UINT uSize);
export extern(Windows) UINT GetWindowsDirectoryW(LPWSTR lpBuffer, UINT uSize);
version(UNICODE)
	alias GetWindowsDirectoryW GetWindowsDirectory;
else
	alias GetWindowsDirectoryA GetWindowsDirectory;

export extern(Windows) UINT GetSystemWindowsDirectoryA(LPSTR lpBuffer, UINT uSize);
export extern(Windows) UINT GetSystemWindowsDirectoryW(LPWSTR lpBuffer, UINT uSize);
version(UNICODE)
	alias GetSystemWindowsDirectoryW GetSystemWindowsDirectory;
else
	alias GetSystemWindowsDirectoryA GetSystemWindowsDirectory;

static if(_WIN32_WINNT >= _WIN32_WINNT_WINXP){
	export extern(Windows) UINT GetSystemWow64DirectoryA(LPSTR lpBuffer, UINT uSize);
	export extern(Windows) UINT GetSystemWow64DirectoryW(LPWSTR lpBuffer, UINT uSize);
	version(UNICODE)
		alias GetSystemWow64DirectoryW GetSystemWow64Directory;
	else
		alias GetSystemWow64DirectoryA GetSystemWow64Directory;

	export extern(Windows) BOOLEAN Wow64EnableWow64FsRedirection(BOOLEAN Wow64FsEnableRedirection);
	export extern(Windows) BOOL Wow64DisableWow64FsRedirection(PVOID* OldValue);
	export extern(Windows) BOOL Wow64RevertWow64FsRedirection (PVOID OlValue);
}
//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	alias extern(Windows) UINT function(LPSTR lpBuffer, UINT uSize) PGET_SYSTEM_WOW64_DIRECTORY_A;
	alias extern(Windows) UINT function(LPWSTR lpBuffer, UINT uSize) PGET_SYSTEM_WOW64_DIRECTORY_W;

	const char* GET_SYSTEM_WOW64_DIRECTORY_NAME_A_A  = "GetSystemWow64DirectoryA";
	const wchar* GET_SYSTEM_WOW64_DIRECTORY_NAME_A_W = "GetSystemWow64DirectoryA";
	const TCHAR* GET_SYSTEM_WOW64_DIRECTORY_NAME_A_T = "GetSystemWow64DirectoryA";
	const char* GET_SYSTEM_WOW64_DIRECTORY_NAME_W_A  = "GetSystemWow64DirectoryW";
	const wchar* GET_SYSTEM_WOW64_DIRECTORY_NAME_W_W = "GetSystemWow64DirectoryW";
	const TCHAR* GET_SYSTEM_WOW64_DIRECTORY_NAME_W_T ="GetSystemWow64DirectoryW";

	version(UNICODE){
		alias GET_SYSTEM_WOW64_DIRECTORY_NAME_W_A GET_SYSTEM_WOW64_DIRECTORY_NAME_T_A;
		alias GET_SYSTEM_WOW64_DIRECTORY_NAME_W_W GET_SYSTEM_WOW64_DIRECTORY_NAME_T_W;
		alias GET_SYSTEM_WOW64_DIRECTORY_NAME_W_T GET_SYSTEM_WOW64_DIRECTORY_NAME_T_T;
	}else{
		alias GET_SYSTEM_WOW64_DIRECTORY_NAME_A_A GET_SYSTEM_WOW64_DIRECTORY_NAME_T_A;
		alias GET_SYSTEM_WOW64_DIRECTORY_NAME_A_W GET_SYSTEM_WOW64_DIRECTORY_NAME_T_W;
		alias GET_SYSTEM_WOW64_DIRECTORY_NAME_A_T GET_SYSTEM_WOW64_DIRECTORY_NAME_T_T;
	}

export extern(Windows) BOOL SetCurrentDirectoryA(LPCSTR lpPathName);
export extern(Windows) BOOL SetCurrentDirectoryW(LPCWSTR lpPathName);
version(UNICODE)
	alias SetCurrentDirectoryW SetCurrentDirectory;
else
	alias SetCurrentDirectoryA SetCurrentDirectory;

export extern(Windows) DWORD GetCurrentDirectoryA(DWORD nBufferLength, LPSTR lpBuffer);
export extern(Windows) DWORD GetCurrentDirectoryW(DWORD nBufferLength, LPWSTR lpBuffer);
version(UNICODE)
	alias GetCurrentDirectoryW GetCurrentDirectory;
else
	alias GetCurrentDirectoryA GetCurrentDirectory;

static if(_WIN32_WINNT >= _WIN32_WINNT_WS03){
	export extern(Windows) BOOL SetDllDirectoryA(LPCSTR lpPathName);
	export extern(Windows) BOOL SetDllDirectoryW(LPCWSTR lpPathName);
	version(UNICODE)
		alias SetDllDirectoryW SetDllDirectory;
	else
		alias SetDllDirectoryA SetDllDirectory;

	export extern(Windows) DWORD GetDllDirectoryA(DWORD nBufferLength, LPSTR lpBuffer);
	export extern(Windows) DWORD GetDllDirectoryW(DWORD nBufferLength, LPWSTR lpBuffer);
	version(UNICODE)
		alias GetDllDirectoryW GetDllDirectory;
	else
		alias GetDllDirectoryA GetDllDirectory;
}

enum {
	BASE_SEARCH_PATH_ENABLE_SAFE_SEARCHMODE  = 0x1,
	BASE_SEARCH_PATH_DISABLE_SAFE_SEARCHMODE = 0x10000,
	BASE_SEARCH_PATH_PERMANENT               = 0x8000,
	BASE_SEARCH_PATH_INVALID_FLAGS           = ~0x18001,
}

export extern(Windows) BOOL SetSearchPathMode(DWORD Flags);
export extern(Windows) BOOL GetDiskFreeSpaceA(LPCSTR lpRootPathName, LPDWORD lpSectorsPerCluster, LPDWORD lpBytesPerSector, LPDWORD lpNumberOfFreeClusters, LPDWORD lpTotalNumberOfClusters);
export extern(Windows) BOOL GetDiskFreeSpaceW(LPCWSTR lpRootPathName, LPDWORD lpSectorsPerCluster, LPDWORD lpBytesPerSector, LPDWORD lpNumberOfFreeClusters, LPDWORD lpTotalNumberOfClusters);
version(UNICODE)
	alias GetDiskFreeSpaceW GetDiskFreeSpace;
else
	alias GetDiskFreeSpaceA GetDiskFreeSpace;

export extern(Windows) BOOL GetDiskFreeSpaceExA(LPCSTR lpDirectoryName, PULARGE_INTEGER lpFreeBytesAvailableToCaller, PULARGE_INTEGER lpTotalNumberOfBytes, PULARGE_INTEGER lpTotalNumberOfFreeBytes);
export extern(Windows) BOOL GetDiskFreeSpaceExW(LPCWSTR lpDirectoryName, PULARGE_INTEGER lpFreeBytesAvailableToCaller, PULARGE_INTEGER lpTotalNumberOfBytes, PULARGE_INTEGER lpTotalNumberOfFreeBytes);
version(UNICODE)
	alias GetDiskFreeSpaceExW GetDiskFreeSpaceEx;
else
	alias GetDiskFreeSpaceExA GetDiskFreeSpaceEx;

export extern(Windows) BOOL CreateDirectoryA(LPCSTR lpPathName, LPSECURITY_ATTRIBUTES lpSecurityAttributes);
export extern(Windows) BOOL CreateDirectoryW(LPCWSTR lpPathName, LPSECURITY_ATTRIBUTES lpSecurityAttributes);
version(UNICODE)
	alias CreateDirectoryW CreateDirectory;
else
	alias CreateDirectoryA CreateDirectory;

export extern(Windows) BOOL CreateDirectoryExA(LPCSTR lpTemplateDirectory, LPCSTR lpNewDirectory, LPSECURITY_ATTRIBUTES lpSecurityAttributes);
export extern(Windows) BOOL CreateDirectoryExW(LPCWSTR lpTemplateDirectory, LPCWSTR lpNewDirectory, LPSECURITY_ATTRIBUTES lpSecurityAttributes);
version(UNICODE)
	alias CreateDirectoryExW CreateDirectoryEx;
else
	alias CreateDirectoryExA CreateDirectoryEx;

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	export extern(Windows) BOOL CreateDirectoryTransactedA(LPCSTR lpTemplateDirectory, LPCSTR lpNewDirectory, LPSECURITY_ATTRIBUTES lpSecurityAttributes, HANDLE hTransaction);
	export extern(Windows) BOOL CreateDirectoryTransactedW(LPCWSTR lpTemplateDirectory, LPCWSTR lpNewDirectory, LPSECURITY_ATTRIBUTES lpSecurityAttributes, HANDLE hTransaction);
	version(UNICODE)
		alias CreateDirectoryTransactedW CreateDirectoryTransacted;
	else
		alias CreateDirectoryTransactedA CreateDirectoryTransacted;
}

export extern(Windows) BOOL RemoveDirectoryA(LPCSTR lpPathName);
export extern(Windows) BOOL RemoveDirectoryW(LPCWSTR lpPathName);
version(UNICODE)
	alias RemoveDirectoryW RemoveDirectory;
else
	alias RemoveDirectoryA RemoveDirectory;

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	export extern(Windows) BOOL RemoveDirectoryTransactedA(LPCSTR lpPathName, HANDLE hTransaction);
	export extern(Windows) BOOL RemoveDirectoryTransactedW(LPCWSTR lpPathName, HANDLE hTransaction);
	version(UNICODE)
		alias RemoveDirectoryTransactedW RemoveDirectoryTransacted;
	else
		alias RemoveDirectoryTransactedA RemoveDirectoryTransacted;
}

export extern(Windows) DWORD GetFullPathNameA(LPCSTR lpFileName, DWORD nBufferLength, LPSTR lpBuffer, LPSTR* lpFilePart);
export extern(Windows) DWORD GetFullPathNameW(LPCWSTR lpFileName, DWORD nBufferLength, LPWSTR lpBuffer, LPWSTR* lpFilePart);
version(UNICODE)
	alias GetFullPathNameW GetFullPathName;
else
	alias GetFullPathNameA GetFullPathName;

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	export extern(Windows) DWORD GetFullPathNameTransactedA(LPCSTR lpFileName, DWORD nBufferLength, LPSTR lpBuffer, LPSTR* lpFilePart, HANDLE hTransaction);
	export extern(Windows) DWORD GetFullPathNameTransactedW(LPCWSTR lpFileName, DWORD nBufferLength, LPWSTR lpBuffer, LPWSTR* lpFilePart, HANDLE hTransaction);
	version(UNICODE)
		alias GetFullPathNameTransactedW GetFullPathNameTransacted;
	else
		alias GetFullPathNameTransactedA GetFullPathNameTransacted;
}

enum {
	DDD_RAW_TARGET_PATH       = 0x00000001,
	DDD_REMOVE_DEFINITION     = 0x00000002,
	DDD_EXACT_MATCH_ON_REMOVE = 0x00000004,
	DDD_NO_BROADCAST_SYSTEM   = 0x00000008,
	DDD_LUID_BROADCAST_DRIVE  = 0x00000010,
}

export extern(Windows) BOOL DefineDosDeviceA(DWORD dwFlags, LPCSTR lpDeviceName, LPCSTR lpTargetPath);
export extern(Windows) BOOL DefineDosDeviceW(DWORD dwFlags, LPCWSTR lpDeviceName, LPCWSTR lpTargetPath);
version(UNICODE)
	alias DefineDosDeviceW DefineDosDevice;
else
	alias DefineDosDeviceA DefineDosDevice;

export extern(Windows) DWORD QueryDosDeviceA(LPCSTR lpDeviceName, LPSTR lpTargetPath, DWORD ucchMax);
export extern(Windows) DWORD QueryDosDeviceW(LPCWSTR lpDeviceName, LPWSTR lpTargetPath, DWORD ucchMax);
version(UNICODE)
	alias QueryDosDeviceW QueryDosDevice;
else
	alias QueryDosDeviceA QueryDosDevice;

export extern(Windows) HANDLE CreateFileA(LPCSTR lpFileName, DWORD dwDesiredAccess, DWORD dwShareMode, LPSECURITY_ATTRIBUTES lpSecurityAttributes, DWORD dwCreationDisposition, DWORD dwFlagsAndAttributes, HANDLE hTemplateFile);
export extern(Windows) HANDLE CreateFileW(LPCWSTR lpFileName, DWORD dwDesiredAccess, DWORD dwShareMode, LPSECURITY_ATTRIBUTES lpSecurityAttributes, DWORD dwCreationDisposition, DWORD dwFlagsAndAttributes, HANDLE hTemplateFile);
version(UNICODE)
	alias CreateFileW CreateFile;
else
	alias CreateFileA CreateFile;

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	export extern(Windows) HANDLE CreateFileTransactedA(LPCSTR lpFileName, DWORD dwDesiredAccess, DWORD dwShareMode, LPSECURITY_ATTRIBUTES lpSecurityAttributes, DWORD dwCreationDisposition, DWORD dwFlagsAndAttributes, HANDLE hTemplateFile, HANDLE hTransaction, PUSHORT pusMiniVersion, PVOID lpExtendedParameter);
	export extern(Windows) HANDLE CreateFileTransactedW(LPCWSTR lpFileName, DWORD dwDesiredAccess, DWORD dwShareMode, LPSECURITY_ATTRIBUTES lpSecurityAttributes, DWORD dwCreationDisposition, DWORD dwFlagsAndAttributes, HANDLE hTemplateFile, HANDLE hTransaction, PUSHORT pusMiniVersion, PVOID lpExtendedParameter);
	version(UNICODE)
		alias CreateFileTransactedW CreateFileTransacted;
	else
		alias CreateFileTransactedA CreateFileTransacted;
}

static if(_WIN32_WINNT >= _WIN32_WINNT_WS03){
	export extern(Windows) HANDLE ReOpenFile(HANDLE hOriginalFile, DWORD dwDesiredAccess, DWORD dwShareMode, DWORD dwFlagsAndAttributes);
}

export extern(Windows) BOOL SetFileAttributesA(LPCSTR lpFileName, DWORD dwFileAttributes);
export extern(Windows) BOOL SetFileAttributesW(LPCWSTR lpFileName, DWORD dwFileAttributes);
version(UNICODE)
	alias SetFileAttributesW SetFileAttributes;
else
	alias SetFileAttributesA SetFileAttributes;

export extern(Windows) DWORD GetFileAttributesA(LPCSTR lpFileName);
export extern(Windows) DWORD GetFileAttributesW(LPCWSTR lpFileName);
version(UNICODE)
	alias GetFileAttributesW GetFileAttributes;
else
	alias GetFileAttributesA GetFileAttributes;


static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	export extern(Windows) BOOL SetFileAttributesTransactedA(LPCSTR lpFileName, DWORD dwFileAttributes, HANDLE hTransaction);
	export extern(Windows) BOOL SetFileAttributesTransactedW(LPCWSTR lpFileName, DWORD dwFileAttributes, HANDLE hTransaction);
	version(UNICODE)
		alias SetFileAttributesTransactedW SetFileAttributesTransacted;
	else
		alias SetFileAttributesTransactedA SetFileAttributesTransacted;
}

enum {
	GetFileExInfoStandard,
	GetFileExMaxInfoLevel
}
alias int GET_FILEEX_INFO_LEVELS;

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	export extern(Windows) BOOL GetFileAttributesTransactedA(LPCSTR lpFileName, GET_FILEEX_INFO_LEVELS fInfoLevelId, LPVOID lpFileInformation, HANDLE hTransaction);
	export extern(Windows) BOOL GetFileAttributesTransactedW(LPCWSTR lpFileName, GET_FILEEX_INFO_LEVELS fInfoLevelId, LPVOID lpFileInformation, HANDLE hTransaction);
	version(UNICODE)
		alias GetFileAttributesTransactedW GetFileAttributesTransacted;
	else
		alias GetFileAttributesTransactedA GetFileAttributesTransacted;
}

export extern(Windows) BOOL GetFileAttributesExA(LPCSTR lpFileName, GET_FILEEX_INFO_LEVELS fInfoLevelId, LPVOID lpFileInformation);
export extern(Windows) BOOL GetFileAttributesExW(LPCWSTR lpFileName, GET_FILEEX_INFO_LEVELS fInfoLevelId, LPVOID lpFileInformation);
version(UNICODE)
	alias GetFileAttributesExW GetFileAttributesEx;
else
	alias GetFileAttributesExA GetFileAttributesEx;

export extern(Windows) DWORD GetCompressedFileSizeA(LPCSTR lpFileName, LPDWORD lpFileSizeHigh);
export extern(Windows) DWORD GetCompressedFileSizeW(LPCWSTR lpFileName, LPDWORD lpFileSizeHigh);
version(UNICODE)
	alias GetCompressedFileSizeW GetCompressedFileSize;
else
	alias GetCompressedFileSizeA GetCompressedFileSize;

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	export extern(Windows) DWORD GetCompressedFileSizeTransactedA(LPCSTR lpFileName, LPDWORD lpFileSizeHigh, HANDLE hTransaction);
	export extern(Windows) DWORD GetCompressedFileSizeTransactedW(LPCWSTR lpFileName, LPDWORD lpFileSizeHigh, HANDLE hTransaction);
	version(UNICODE)
		alias GetCompressedFileSizeTransactedW GetCompressedFileSizeTransacted;
	else
		alias GetCompressedFileSizeTransactedA GetCompressedFileSizeTransacted;
}

export extern(Windows) BOOL DeleteFileA(LPCSTR lpFileName);
export extern(Windows) BOOL DeleteFileW(LPCWSTR lpFileName);
version(UNICODE)
	alias DeleteFileW DeleteFile;
else
	alias DeleteFileA DeleteFile;

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	export extern(Windows) BOOL DeleteFileTransactedA(LPCSTR lpFileName, HANDLE hTransaction);
	export extern(Windows) BOOL DeleteFileTransactedW(LPCWSTR lpFileName, HANDLE hTransaction);
	version(UNICODE)
		alias DeleteFileTransactedW DeleteFileTransacted;
	else
		alias DeleteFileTransactedA DeleteFileTransacted;
}

static if(_WIN32_WINNT >= _WIN32_WINNT_WINXP){
	export extern(Windows) BOOL CheckNameLegalDOS8Dot3A(LPCSTR lpName, LPSTR lpOemName, DWORD OemNameSize, PBOOL pbNameContainsSpaces, PBOOL pbNameLegal);
	export extern(Windows) BOOL CheckNameLegalDOS8Dot3W(LPCWSTR lpName, LPSTR lpOemName, DWORD OemNameSize, PBOOL pbNameContainsSpaces, PBOOL pbNameLegal);
	version(UNICODE)
		alias CheckNameLegalDOS8Dot3W CheckNameLegalDOS8Dot3;
	else
		alias CheckNameLegalDOS8Dot3A CheckNameLegalDOS8Dot3;
}

enum {
	FindExInfoStandard,
	FindExInfoBasic,
	FindExInfoMaxInfoLevel
}
alias int FINDEX_INFO_LEVELS;

enum {
	FindExSearchNameMatch,
	FindExSearchLimitToDirectories,
	FindExSearchLimitToDevices,
	FindExSearchMaxSearchOp
}
alias int FINDEX_SEARCH_OPS;
enum{
	FIND_FIRST_EX_CASE_SENSITIVE = 0x00000001,
	FIND_FIRST_EX_LARGE_FETCH    = 0x00000002,
}
export extern(Windows) HANDLE FindFirstFileExA(LPCSTR lpFileName, FINDEX_INFO_LEVELS fInfoLevelId, LPVOID lpFindFileData, FINDEX_SEARCH_OPS fSearchOp, LPVOID lpSearchFilter, DWORD dwAdditionalFlags);
export extern(Windows) HANDLE FindFirstFileExW(LPCWSTR lpFileName, FINDEX_INFO_LEVELS fInfoLevelId, LPVOID lpFindFileData, FINDEX_SEARCH_OPS fSearchOp, LPVOID lpSearchFilter, DWORD dwAdditionalFlags);
version(UNICODE)
	alias FindFirstFileExW FindFirstFileEx;
else
	alias FindFirstFileExA FindFirstFileEx;

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	export extern(Windows) HANDLE FindFirstFileTransactedA(LPCSTR lpFileName, FINDEX_INFO_LEVELS fInfoLevelId, LPVOID lpFindFileData, FINDEX_SEARCH_OPS fSearchOp, LPVOID lpSearchFilter, DWORD dwAdditionalFlags, HANDLE hTransaction);
	export extern(Windows) HANDLE FindFirstFileTransactedW(LPCWSTR lpFileName, FINDEX_INFO_LEVELS fInfoLevelId, LPVOID lpFindFileData, FINDEX_SEARCH_OPS fSearchOp, LPVOID lpSearchFilter, DWORD dwAdditionalFlags, HANDLE hTransaction);
	version(UNICODE)
		alias FindFirstFileTransactedW FindFirstFileTransacted;
	else
		alias FindFirstFileTransactedA FindFirstFileTransacted;
}

export extern(Windows) HANDLE FindFirstFileA(LPCSTR lpFileName, LPWIN32_FIND_DATAA lpFindFileData);
export extern(Windows) HANDLE FindFirstFileW(LPCWSTR lpFileName, LPWIN32_FIND_DATAW lpFindFileData);
version(UNICODE)
	alias FindFirstFileW FindFirstFile;
else
	alias FindFirstFileA FindFirstFile;

export extern(Windows) BOOL FindNextFileA(HANDLE hFindFile, LPWIN32_FIND_DATAA lpFindFileData);
export extern(Windows) BOOL FindNextFileW(HANDLE hFindFile, LPWIN32_FIND_DATAW lpFindFileData);
version(UNICODE)
	alias FindNextFileW FindNextFile;
else
	alias FindNextFileA FindNextFile;

export extern(Windows) DWORD SearchPathA(LPCSTR lpPath, LPCSTR lpFileName, LPCSTR lpExtension, DWORD nBufferLength, LPSTR lpBuffer, LPSTR* lpFilePart);
export extern(Windows) DWORD SearchPathW(LPCWSTR lpPath, LPCWSTR lpFileName, LPCWSTR lpExtension, DWORD nBufferLength, LPWSTR lpBuffer, LPWSTR* lpFilePart);
version(UNICODE)
	alias SearchPathW SearchPath;
else
	alias SearchPathA SearchPath;

export extern(Windows) BOOL CopyFileA(LPCSTR lpExistingFileName, LPCSTR lpNewFileName, BOOL bFailIfExists);
export extern(Windows) BOOL CopyFileW(LPCWSTR lpExistingFileName, LPCWSTR lpNewFileName, BOOL bFailIfExists);
version(UNICODE)
	alias CopyFileW CopyFile;
else
	alias CopyFileA CopyFile;

alias extern(Windows) DWORD function(LARGE_INTEGER TotalFileSize, LARGE_INTEGER TotalBytesTransferred, LARGE_INTEGER StreamSize, LARGE_INTEGER StreamBytesTransferred, DWORD dwStreamNumber, DWORD dwCallbackReason, HANDLE hSourceFile, HANDLE hDestinationFile, LPVOID lpData) LPPROGRESS_ROUTINE;
export extern(Windows) BOOL CopyFileExA(LPCSTR lpExistingFileName, LPCSTR lpNewFileName, LPPROGRESS_ROUTINE lpProgressRoutine, LPVOID lpData, LPBOOL pbCancel, DWORD dwCopyFlags );
export extern(Windows) BOOL CopyFileExW(LPCWSTR lpExistingFileName, LPCWSTR lpNewFileName, LPPROGRESS_ROUTINE lpProgressRoutine, LPVOID lpData, LPBOOL pbCancel, DWORD dwCopyFlags);
version(UNICODE)
	alias CopyFileExW CopyFileEx;
else
	alias CopyFileExA CopyFileEx;
static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	export extern(Windows) BOOL CopyFileTransactedA(LPCSTR lpExistingFileName, LPCSTR lpNewFileName, LPPROGRESS_ROUTINE lpProgressRoutine, LPVOID lpData, LPBOOL pbCancel, DWORD dwCopyFlags, HANDLE hTransaction);
	export extern(Windows) BOOL CopyFileTransactedW(LPCWSTR lpExistingFileName, LPCWSTR lpNewFileName, LPPROGRESS_ROUTINE lpProgressRoutine, LPVOID lpData, LPBOOL pbCancel, DWORD dwCopyFlags, HANDLE hTransaction);
	version(UNICODE)
		alias CopyFileTransactedW CopyFileTransacted;
	else
		alias CopyFileTransactedA CopyFileTransacted;
}

export extern(Windows) BOOL MoveFileA(LPCSTR lpExistingFileName, LPCSTR lpNewFileName);
export extern(Windows) BOOL MoveFileW(LPCWSTR lpExistingFileName, LPCWSTR lpNewFileName);
version(UNICODE)
	alias MoveFileW MoveFile;
else
	alias MoveFileA MoveFile;

export extern(Windows) BOOL MoveFileExA(LPCSTR lpExistingFileName, LPCSTR lpNewFileName, DWORD dwFlags);
export extern(Windows) BOOL MoveFileExW(LPCWSTR lpExistingFileName, LPCWSTR lpNewFileName, DWORD dwFlags);
version(UNICODE)
	alias MoveFileExW MoveFileEx;
else
	alias MoveFileExA MoveFileEx;

export extern(Windows) BOOL MoveFileWithProgressA(LPCSTR lpExistingFileName, LPCSTR lpNewFileName, LPPROGRESS_ROUTINE lpProgressRoutine, LPVOID lpData, DWORD dwFlags);
export extern(Windows) BOOL MoveFileWithProgressW(LPCWSTR lpExistingFileName, LPCWSTR lpNewFileName, LPPROGRESS_ROUTINE lpProgressRoutine, LPVOID lpData, DWORD dwFlags);
version(UNICODE)
	alias MoveFileWithProgressW MoveFileWithProgres;
else
	alias MoveFileWithProgressA MoveFileWithProgress;

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	export extern(Windows) BOOL MoveFileTransactedA(LPCSTR lpExistingFileName, LPCSTR lpNewFileName, LPPROGRESS_ROUTINE lpProgressRoutine, LPVOID lpData, DWORD dwFlags, HANDLE hTransaction);
	export extern(Windows) BOOL MoveFileTransactedW(LPCWSTR lpExistingFileName, LPCWSTR lpNewFileName, LPPROGRESS_ROUTINE lpProgressRoutine, LPVOID lpData, DWORD dwFlags, HANDLE hTransaction);
	version(UNICODE)
		alias MoveFileTransactedW MoveFileTransacted;
	else
		alias MoveFileTransactedA MoveFileTransacted;
}

enum {
	MOVEFILE_REPLACE_EXISTING      = 0x00000001,
	MOVEFILE_COPY_ALLOWED          = 0x00000002,
	MOVEFILE_DELAY_UNTIL_REBOOT    = 0x00000004,
	MOVEFILE_WRITE_THROUGH         = 0x00000008,
	MOVEFILE_CREATE_HARDLINK       = 0x00000010,
	MOVEFILE_FAIL_IF_NOT_TRACKABLE = 0x00000020,
}

export extern(Windows) BOOL ReplaceFileA(LPCSTR lpReplacedFileName, LPCSTR lpReplacementFileName, LPCSTR lpBackupFileName, DWORD dwReplaceFlags, LPVOID lpExclude, LPVOID lpReserved);
export extern(Windows) BOOL ReplaceFileW(LPCWSTR lpReplacedFileName, LPCWSTR lpReplacementFileName, LPCWSTR lpBackupFileName, DWORD dwReplaceFlags, LPVOID lpExclude, LPVOID lpReserved);
version(UNICODE)
	alias ReplaceFileW ReplaceFile;
else
	alias ReplaceFileA ReplaceFile;

export extern(Windows) BOOL CreateHardLinkA(LPCSTR lpFileName, LPCSTR lpExistingFileName, LPSECURITY_ATTRIBUTES lpSecurityAttributes);
export extern(Windows) BOOL CreateHardLinkW(LPCWSTR lpFileName, LPCWSTR lpExistingFileName, LPSECURITY_ATTRIBUTES lpSecurityAttributes);
version(UNICODE)
	alias CreateHardLinkW CreateHardLink;
else
	alias CreateHardLinkA CreateHardLink;

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	export extern(Windows) BOOL CreateHardLinkTransactedA(LPCSTR lpFileName, LPCSTR lpExistingFileName, LPSECURITY_ATTRIBUTES lpSecurityAttributes, HANDLE hTransaction);
	export extern(Windows) BOOL CreateHardLinkTransactedW(LPCWSTR lpFileName, LPCWSTR lpExistingFileName, LPSECURITY_ATTRIBUTES lpSecurityAttributes, HANDLE hTransaction);
	version(UNICODE)
		alias CreateHardLinkTransactedW CreateHardLinkTransacted;
	else
		alias CreateHardLinkTransactedA CreateHardLinkTransacted;
}

//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	enum {
		FindStreamInfoStandard,
		FindStreamInfoMaxInfoLevel
	}
	alias int STREAM_INFO_LEVELS;

	struct WIN32_FIND_STREAM_DATA {
		LARGE_INTEGER StreamSize;
		WCHAR[MAX_PATH + 36] cStreamName;
	}
	alias WIN32_FIND_STREAM_DATA* PWIN32_FIND_STREAM_DATA;

static if(_WIN32_WINNT >= _WIN32_WINNT_WINXP){
	export extern(Windows) HANDLE FindFirstStreamW(LPCWSTR lpFileName, STREAM_INFO_LEVELS InfoLevel, LPVOID lpFindStreamData, DWORD dwFlags);
	static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		export extern(Windows) HANDLE FindFirstStreamTransactedW(LPCWSTR lpFileName, STREAM_INFO_LEVELS InfoLevel, LPVOID lpFindStreamData, DWORD dwFlags, HANDLE hTransaction);
	export extern(Windows) BOOL FindNextStreamW(HANDLE hFindStream, LPVOID lpFindStreamData);
}

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	export extern(Windows) HANDLE FindFirstFileNameW(LPCWSTR lpFileName, DWORD dwFlags, LPDWORD StringLength, PWCHAR LinkName);
	export extern(Windows) BOOL FindNextFileNameW(HANDLE hFindStream, LPDWORD StringLength, PWCHAR LinkName);
	export extern(Windows) HANDLE FindFirstFileNameTransactedW(LPCWSTR lpFileName, DWORD dwFlags, LPDWORD StringLength, PWCHAR LinkName, HANDLE hTransaction);
}

export extern(Windows) HANDLE CreateNamedPipeA(LPCSTR lpName, DWORD dwOpenMode, DWORD dwPipeMode, DWORD nMaxInstances, DWORD nOutBufferSize, DWORD nInBufferSize, DWORD nDefaultTimeOut, LPSECURITY_ATTRIBUTES lpSecurityAttributes);
export extern(Windows) HANDLE CreateNamedPipeW(LPCWSTR lpName, DWORD dwOpenMode, DWORD dwPipeMode, DWORD nMaxInstances, DWORD nOutBufferSize, DWORD nInBufferSize, DWORD nDefaultTimeOut, LPSECURITY_ATTRIBUTES lpSecurityAttributes);
version(UNICODE)
	alias CreateNamedPipeW CreateNamedPipe;
else
	alias CreateNamedPipeA CreateNamedPipe;

export extern(Windows) BOOL GetNamedPipeHandleStateA(HANDLE hNamedPipe, LPDWORD lpState, LPDWORD lpCurInstances, LPDWORD lpMaxCollectionCount, LPDWORD lpCollectDataTimeout, LPSTR lpUserName, DWORD nMaxUserNameSize);
export extern(Windows) BOOL GetNamedPipeHandleStateW(HANDLE hNamedPipe, LPDWORD lpState, LPDWORD lpCurInstances, LPDWORD lpMaxCollectionCount, LPDWORD lpCollectDataTimeout, LPWSTR lpUserName, DWORD nMaxUserNameSize);
version(UNICODE)
	alias GetNamedPipeHandleStateW GetNamedPipeHandleState;
else
	alias GetNamedPipeHandleStateA GetNamedPipeHandleState;

export extern(Windows) BOOL CallNamedPipeA(LPCSTR lpNamedPipeName, LPVOID lpInBuffer, DWORD nInBufferSize, LPVOID lpOutBuffer, DWORD nOutBufferSize, LPDWORD lpBytesRead, DWORD nTimeOut);
export extern(Windows) BOOL CallNamedPipeW(LPCWSTR lpNamedPipeName, LPVOID lpInBuffer, DWORD nInBufferSize, LPVOID lpOutBuffer, DWORD nOutBufferSize, LPDWORD lpBytesRead, DWORD nTimeOut);
version(UNICODE)
	alias CallNamedPipeW CallNamedPipe;
else
	alias CallNamedPipeA CallNamedPipe;

export extern(Windows) BOOL WaitNamedPipeA(LPCSTR lpNamedPipeName, DWORD nTimeOut);
export extern(Windows) BOOL WaitNamedPipeW(LPCWSTR lpNamedPipeName, DWORD nTimeOut);
version(UNICODE)
	alias WaitNamedPipeW WaitNamedPipe;
else
	alias WaitNamedPipeA WaitNamedPipe;

enum {
	PipeAttribute,
	PipeConnectionAttribute,
	PipeHandleAttribute
}
alias int PIPE_ATTRIBUTE_TYPE;

export extern(Windows) BOOL GetNamedPipeAttribute(HANDLE Pipe, PIPE_ATTRIBUTE_TYPE AttributeType, PSTR AttributeName, PVOID AttributeValue, PSIZE_T AttributeValueLength);
export extern(Windows) BOOL SetNamedPipeAttribute(HANDLE Pipe, PIPE_ATTRIBUTE_TYPE AttributeType, PSTR AttributeName, PVOID AttributeValue, SIZE_T AttributeValueLength);
export extern(Windows) BOOL GetNamedPipeClientComputerNameA(HANDLE Pipe, LPSTR ClientComputerName, ULONG ClientComputerNameLength);
export extern(Windows) BOOL GetNamedPipeClientComputerNameW(HANDLE Pipe, LPWSTR ClientComputerName, ULONG ClientComputerNameLength);
version(UNICODE)
	alias GetNamedPipeClientComputerNameW GetNamedPipeClientComputerName;
else
	alias GetNamedPipeClientComputerNameA GetNamedPipeClientComputerName;

export extern(Windows) BOOL GetNamedPipeClientProcessId(HANDLE Pipe, PULONG ClientProcessId);
export extern(Windows) BOOL GetNamedPipeClientSessionId(HANDLE Pipe, PULONG ClientSessionId);
export extern(Windows) BOOL GetNamedPipeServerProcessId(HANDLE Pipe, PULONG ServerProcessId);
export extern(Windows) BOOL GetNamedPipeServerSessionId(HANDLE Pipe, PULONG ServerSessionId);
export extern(Windows) BOOL SetVolumeLabelA(LPCSTR lpRootPathName, LPCSTR lpVolumeName);
export extern(Windows) BOOL SetVolumeLabelW(LPCWSTR lpRootPathName, LPCWSTR lpVolumeName);
version(UNICODE)
	alias SetVolumeLabelW SetVolumeLabel;
else
	alias SetVolumeLabelA SetVolumeLabe;

export extern(Windows) VOID SetFileApisToOEM();
export extern(Windows) VOID SetFileApisToANSI();
export extern(Windows) BOOL AreFileApisANSI();
export extern(Windows) BOOL GetVolumeInformationA(LPCSTR lpRootPathName, LPSTR lpVolumeNameBuffer, DWORD nVolumeNameSize, LPDWORD lpVolumeSerialNumber, LPDWORD lpMaximumComponentLength, LPDWORD lpFileSystemFlags, LPSTR lpFileSystemNameBuffer, DWORD nFileSystemNameSize);
export extern(Windows) BOOL GetVolumeInformationW(LPCWSTR lpRootPathName, LPWSTR lpVolumeNameBuffer, DWORD nVolumeNameSize, LPDWORD lpVolumeSerialNumber, LPDWORD lpMaximumComponentLength, LPDWORD lpFileSystemFlags, LPWSTR lpFileSystemNameBuffer, DWORD nFileSystemNameSize);
version(UNICODE)
	alias GetVolumeInformationW GetVolumeInformation;
else
	alias GetVolumeInformationA GetVolumeInformation;

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	export extern(Windows) BOOL GetVolumeInformationByHandleW(HANDLE hFile, LPWSTR lpVolumeNameBuffer, DWORD nVolumeNameSize, LPDWORD lpVolumeSerialNumber, LPDWORD lpMaximumComponentLength, LPDWORD lpFileSystemFlags, LPWSTR lpFileSystemNameBuffer, DWORD nFileSystemNameSize);

export extern(Windows) BOOL CancelSynchronousIo(HANDLE hThread);
export extern(Windows) BOOL CancelIoEx(HANDLE hFile, LPOVERLAPPED lpOverlapped);
export extern(Windows) BOOL CancelIo(HANDLE hFile);
export extern(Windows) BOOL SetFileBandwidthReservation(HANDLE hFile, DWORD nPeriodMilliseconds, DWORD nBytesPerPeriod, BOOL bDiscardable, LPDWORD lpTransferSize, LPDWORD lpNumOutstandingRequests);
export extern(Windows) BOOL GetFileBandwidthReservation(HANDLE hFile, LPDWORD lpPeriodMilliseconds, LPDWORD lpBytesPerPeriod, LPBOOL pDiscardable, LPDWORD lpTransferSize, LPDWORD lpNumOutstandingRequests);
export extern(Windows) BOOL ClearEventLogA(HANDLE hEventLog, LPCSTR lpBackupFileName);
export extern(Windows) BOOL ClearEventLogW(HANDLE hEventLog, LPCWSTR lpBackupFileName);
version(UNICODE)
	alias ClearEventLogW ClearEventLog;
else
	alias ClearEventLogA ClearEventLog;

export extern(Windows) BOOL BackupEventLogA(HANDLE hEventLog, LPCSTR lpBackupFileName);
export extern(Windows) BOOL BackupEventLogW(HANDLE hEventLog, LPCWSTR lpBackupFileName);
version(UNICODE)
	alias BackupEventLogW BackupEventLog;
else
	alias BackupEventLogA BackupEventLog;

export extern(Windows) BOOL CloseEventLog(HANDLE hEventLog);
export extern(Windows) BOOL DeregisterEventSource(HANDLE hEventLog);
export extern(Windows) BOOL NotifyChangeEventLog(HANDLE hEventLog, HANDLE hEvent);
export extern(Windows) BOOL GetNumberOfEventLogRecords(HANDLE hEventLog, PDWORD NumberOfRecords);
export extern(Windows) BOOL GetOldestEventLogRecord(HANDLE hEventLog, PDWORD OldestRecord);
export extern(Windows) HANDLE OpenEventLogA(LPCSTR lpUNCServerName, LPCSTR lpSourceName);
export extern(Windows) HANDLE OpenEventLogW(LPCWSTR lpUNCServerName, LPCWSTR lpSourceName);
version(UNICODE)
	alias OpenEventLogW OpenEventLog;
else
	alias OpenEventLogA OpenEventLog;

export extern(Windows) HANDLE RegisterEventSourceA(LPCSTR lpUNCServerName, LPCSTR lpSourceName);
export extern(Windows) HANDLE RegisterEventSourceW(LPCWSTR lpUNCServerName, LPCWSTR lpSourceName);
version(UNICODE)
	alias RegisterEventSourceW RegisterEventSource;
else
	alias RegisterEventSourceA RegisterEventSource;

export extern(Windows) HANDLE OpenBackupEventLogA(LPCSTR lpUNCServerName, LPCSTR lpFileName);
export extern(Windows) HANDLE OpenBackupEventLogW(LPCWSTR lpUNCServerName, LPCWSTR lpFileName);
version(UNICODE)
	alias OpenBackupEventLogW OpenBackupEventLog;
else
	alias OpenBackupEventLogA OpenBackupEventLog;

export extern(Windows) BOOL ReadEventLogA(HANDLE hEventLog, DWORD dwReadFlags, DWORD dwRecordOffset, LPVOID lpBuffer, DWORD nNumberOfBytesToRead, DWORD* pnBytesRead, DWORD* pnMinNumberOfBytesNeeded);
export extern(Windows) BOOL ReadEventLogW(HANDLE hEventLog, DWORD dwReadFlags, DWORD dwRecordOffset, LPVOID lpBuffer, DWORD nNumberOfBytesToRead, DWORD* pnBytesRead, DWORD* pnMinNumberOfBytesNeeded);
version(UNICODE)
	alias ReadEventLogW ReadEventLog;
else
	alias ReadEventLogA ReadEventLog;

export extern(Windows) BOOL ReportEventA(HANDLE hEventLog, WORD wType, WORD wCategory, DWORD dwEventID, PSID lpUserSid, WORD wNumStrings, DWORD dwDataSize, LPCSTR* lpStrings, LPVOID lpRawData);
export extern(Windows) BOOL ReportEventW(HANDLE hEventLog, WORD wType, WORD wCategory, DWORD dwEventID, PSID lpUserSid, WORD wNumStrings, DWORD dwDataSize, LPCWSTR* lpStrings, LPVOID lpRawData);
version(UNICODE)
	alias ReportEventW ReportEvent;
else
	alias ReportEventA ReportEvent;

enum EVENTLOG_FULL_INFO = 0;

struct EVENTLOG_FULL_INFORMATION {
	DWORD dwFull;
}
alias EVENTLOG_FULL_INFORMATION* LPEVENTLOG_FULL_INFORMATION;

export extern(Windows) BOOL GetEventLogInformation(HANDLE hEventLog, DWORD dwInfoLevel, LPVOID lpBuffer, DWORD cbBufSize, LPDWORD pcbBytesNeeded);
export extern(Windows) BOOL DuplicateToken(HANDLE ExistingTokenHandle, SECURITY_IMPERSONATION_LEVEL ImpersonationLevel, PHANDLE DuplicateTokenHandle);
export extern(Windows) BOOL GetKernelObjectSecurity(HANDLE Handle, SECURITY_INFORMATION RequestedInformation, PSECURITY_DESCRIPTOR pSecurityDescriptor, DWORD nLength, LPDWORD lpnLengthNeeded);
export extern(Windows) BOOL ImpersonateNamedPipeClient(HANDLE hNamedPipe);
export extern(Windows) BOOL ImpersonateSelf(SECURITY_IMPERSONATION_LEVEL ImpersonationLevel);
export extern(Windows) BOOL RevertToSelf();
export extern(Windows) BOOL SetThreadToken(PHANDLE Thread, HANDLE Token);
export extern(Windows) BOOL AccessCheck(PSECURITY_DESCRIPTOR pSecurityDescriptor, HANDLE ClientToken, DWORD DesiredAccess, PGENERIC_MAPPING GenericMapping, PPRIVILEGE_SET PrivilegeSet, LPDWORD PrivilegeSetLength, LPDWORD GrantedAccess, LPBOOL AccessStatus);
export  extern(Windows) BOOL AccessCheckByType(PSECURITY_DESCRIPTOR pSecurityDescriptor, PSID PrincipalSelfSid, HANDLE ClientToken, DWORD DesiredAccess, POBJECT_TYPE_LIST ObjectTypeList, DWORD ObjectTypeListLength, PGENERIC_MAPPING GenericMapping, PPRIVILEGE_SET PrivilegeSet, LPDWORD PrivilegeSetLength, LPDWORD GrantedAccess, LPBOOL AccessStatus);
export extern(Windows) BOOL AccessCheckByTypeResultList(PSECURITY_DESCRIPTOR pSecurityDescriptor, PSID PrincipalSelfSid, HANDLE ClientToken, DWORD DesiredAccess, POBJECT_TYPE_LIST ObjectTypeList, DWORD ObjectTypeListLength, PGENERIC_MAPPING GenericMapping, PPRIVILEGE_SET PrivilegeSet, LPDWORD PrivilegeSetLength, LPDWORD GrantedAccessList, LPDWORD AccessStatusList);

export extern(Windows) BOOL OpenProcessToken(HANDLE ProcessHandle, DWORD DesiredAccess, PHANDLE TokenHandle);
export extern(Windows) BOOL OpenThreadToken(HANDLE ThreadHandle, DWORD DesiredAccess, BOOL OpenAsSelf, PHANDLE TokenHandle);
export extern(Windows) BOOL GetTokenInformation(HANDLE TokenHandle, TOKEN_INFORMATION_CLASS TokenInformationClass, LPVOID TokenInformation, DWORD TokenInformationLength, PDWORD ReturnLength);
export extern(Windows) BOOL SetTokenInformation(HANDLE TokenHandle, TOKEN_INFORMATION_CLASS TokenInformationClass, LPVOID TokenInformation, DWORD TokenInformationLength);
export extern(Windows) BOOL AdjustTokenPrivileges(HANDLE TokenHandle, BOOL DisableAllPrivileges, PTOKEN_PRIVILEGES NewState, DWORD BufferLength, PTOKEN_PRIVILEGES PreviousState, PDWORD ReturnLength);
export extern(Windows) BOOL AdjustTokenGroups(HANDLE TokenHandle, BOOL ResetToDefault, PTOKEN_GROUPS NewState, DWORD BufferLength, PTOKEN_GROUPS PreviousState, PDWORD ReturnLength);
export extern(Windows) BOOL PrivilegeCheck(HANDLE ClientToken, PPRIVILEGE_SET RequiredPrivileges, LPBOOL pfResult);
export extern(Windows) BOOL AccessCheckAndAuditAlarmA(LPCSTR SubsystemName, LPVOID HandleId, LPSTR ObjectTypeName, LPSTR ObjectName, PSECURITY_DESCRIPTOR SecurityDescriptor, DWORD DesiredAccess, PGENERIC_MAPPING GenericMapping, BOOL ObjectCreation, LPDWORD GrantedAccess, LPBOOL AccessStatus, LPBOOL pfGenerateOnClose);
export extern(Windows) BOOL AccessCheckAndAuditAlarmW(LPCWSTR SubsystemName, LPVOID HandleId, LPWSTR ObjectTypeName, LPWSTR ObjectName, PSECURITY_DESCRIPTOR SecurityDescriptor, DWORD DesiredAccess, PGENERIC_MAPPING GenericMapping, BOOL ObjectCreation, LPDWORD GrantedAccess, LPBOOL AccessStatus, LPBOOL pfGenerateOnClose);
version(UNICODE)
	alias AccessCheckAndAuditAlarmW AccessCheckAndAuditAlarm;
else
	alias AccessCheckAndAuditAlarmA AccessCheckAndAuditAlarm;

export extern(Windows) BOOL AccessCheckByTypeAndAuditAlarmA(LPCSTR SubsystemName, LPVOID HandleId, LPCSTR ObjectTypeName, LPCSTR ObjectName, PSECURITY_DESCRIPTOR SecurityDescriptor, PSID PrincipalSelfSid, DWORD DesiredAccess, AUDIT_EVENT_TYPE AuditType, DWORD Flags, POBJECT_TYPE_LIST ObjectTypeList, DWORD ObjectTypeListLength, PGENERIC_MAPPING GenericMapping, BOOL ObjectCreation, LPDWORD GrantedAccess, LPBOOL AccessStatus, LPBOOL pfGenerateOnClose);
export extern(Windows) BOOL AccessCheckByTypeAndAuditAlarmW(LPCWSTR SubsystemName, LPVOID HandleId, LPCWSTR ObjectTypeName, LPCWSTR ObjectName, PSECURITY_DESCRIPTOR SecurityDescriptor, PSID PrincipalSelfSid, DWORD DesiredAccess, AUDIT_EVENT_TYPE AuditType, DWORD Flags, POBJECT_TYPE_LIST ObjectTypeList, DWORD ObjectTypeListLength, PGENERIC_MAPPING GenericMapping, BOOL ObjectCreation, LPDWORD GrantedAccess, LPBOOL AccessStatus, LPBOOL pfGenerateOnClose);
version(UNICODE)
	alias AccessCheckByTypeAndAuditAlarmW AccessCheckByTypeAndAuditAlarm;
else
	alias AccessCheckByTypeAndAuditAlarmA AccessCheckByTypeAndAuditAlarm;

export extern(Windows) BOOL AccessCheckByTypeResultListAndAuditAlarmA(LPCSTR SubsystemName, LPVOID HandleId, LPCSTR ObjectTypeName, LPCSTR ObjectName, PSECURITY_DESCRIPTOR SecurityDescriptor, PSID PrincipalSelfSid, DWORD DesiredAccess, AUDIT_EVENT_TYPE AuditType, DWORD Flags, POBJECT_TYPE_LIST ObjectTypeList, DWORD ObjectTypeListLength, PGENERIC_MAPPING GenericMapping, BOOL ObjectCreation, LPDWORD GrantedAccess, LPDWORD AccessStatusList, LPBOOL pfGenerateOnClose);
export extern(Windows) BOOL AccessCheckByTypeResultListAndAuditAlarmW(LPCWSTR SubsystemName, LPVOID HandleId, LPCWSTR ObjectTypeName, LPCWSTR ObjectName, PSECURITY_DESCRIPTOR SecurityDescriptor, PSID PrincipalSelfSid, DWORD DesiredAccess, AUDIT_EVENT_TYPE AuditType, DWORD Flags, POBJECT_TYPE_LIST ObjectTypeList, DWORD ObjectTypeListLength, PGENERIC_MAPPING GenericMapping, BOOL ObjectCreation, LPDWORD GrantedAccess, LPDWORD AccessStatusList, LPBOOL pfGenerateOnClose);
version(UNICODE)
	alias AccessCheckByTypeResultListAndAuditAlarmW AccessCheckByTypeResultListAndAuditAlarm;
else
	alias AccessCheckByTypeResultListAndAuditAlarmA AccessCheckByTypeResultListAndAuditAlarm;

export extern(Windows) BOOL AccessCheckByTypeResultListAndAuditAlarmByHandleA(LPCSTR SubsystemName, LPVOID HandleId, HANDLE ClientToken, LPCSTR ObjectTypeName, LPCSTR ObjectName, PSECURITY_DESCRIPTOR SecurityDescriptor, PSID PrincipalSelfSid, DWORD DesiredAccess, AUDIT_EVENT_TYPE AuditType, DWORD Flags, POBJECT_TYPE_LIST ObjectTypeList, DWORD ObjectTypeListLength, PGENERIC_MAPPING GenericMapping, BOOL ObjectCreation, LPDWORD GrantedAccess, LPDWORD AccessStatusList, LPBOOL pfGenerateOnClose);
export extern(Windows) BOOL AccessCheckByTypeResultListAndAuditAlarmByHandleW(LPCWSTR SubsystemName, LPVOID HandleId, HANDLE ClientToken, LPCWSTR ObjectTypeName, LPCWSTR ObjectName, PSECURITY_DESCRIPTOR SecurityDescriptor, PSID PrincipalSelfSid, DWORD DesiredAccess, AUDIT_EVENT_TYPE AuditType, DWORD Flags, POBJECT_TYPE_LIST ObjectTypeList, DWORD ObjectTypeListLength, PGENERIC_MAPPING GenericMapping, BOOL ObjectCreation, LPDWORD GrantedAccess, LPDWORD AccessStatusList, LPBOOL pfGenerateOnClose);
version(UNICODE)
	alias AccessCheckByTypeResultListAndAuditAlarmByHandleW AccessCheckByTypeResultListAndAuditAlarmByHandle;
else
	alias AccessCheckByTypeResultListAndAuditAlarmByHandleA AccessCheckByTypeResultListAndAuditAlarmByHandle;

export extern(Windows) BOOL ObjectOpenAuditAlarmA(LPCSTR SubsystemName, LPVOID HandleId, LPSTR ObjectTypeName, LPSTR ObjectName, PSECURITY_DESCRIPTOR pSecurityDescriptor, HANDLE ClientToken, DWORD DesiredAccess, DWORD GrantedAccess, PPRIVILEGE_SET Privileges, BOOL ObjectCreation, BOOL AccessGranted, LPBOOL GenerateOnClose);
export extern(Windows) BOOL ObjectOpenAuditAlarmW(LPCWSTR SubsystemName, LPVOID HandleId, LPWSTR ObjectTypeName, LPWSTR ObjectName, PSECURITY_DESCRIPTOR pSecurityDescriptor, HANDLE ClientToken, DWORD DesiredAccess, DWORD GrantedAccess, PPRIVILEGE_SET Privileges, BOOL ObjectCreation, BOOL AccessGranted, LPBOOL GenerateOnClose);
version(UNICODE)
	alias ObjectOpenAuditAlarmW ObjectOpenAuditAlarm;
else
	alias ObjectOpenAuditAlarmA ObjectOpenAuditAlarm;

export extern(Windows) BOOL ObjectPrivilegeAuditAlarmA(LPCSTR SubsystemName, LPVOID HandleId, HANDLE ClientToken, DWORD DesiredAccess, PPRIVILEGE_SET Privileges, BOOL AccessGranted);
export extern(Windows) BOOL ObjectPrivilegeAuditAlarmW(LPCWSTR SubsystemName, LPVOID HandleId, HANDLE ClientToken, DWORD DesiredAccess, PPRIVILEGE_SET Privileges, BOOL AccessGranted);
version(UNICODE)
	alias ObjectPrivilegeAuditAlarmW ObjectPrivilegeAuditAlarm;
else
	alias ObjectPrivilegeAuditAlarmA ObjectPrivilegeAuditAlarm;

export extern(Windows) BOOL ObjectCloseAuditAlarmA(LPCSTR SubsystemName, LPVOID HandleId, BOOL GenerateOnClose);
export extern(Windows) BOOL ObjectCloseAuditAlarmW(LPCWSTR SubsystemName, LPVOID HandleId, BOOL GenerateOnClose);
version(UNICODE)
	alias ObjectCloseAuditAlarmW ObjectCloseAuditAlarm;
else
	alias ObjectCloseAuditAlarmA ObjectCloseAuditAlarm;

export extern(Windows) BOOL ObjectDeleteAuditAlarmA(LPCSTR SubsystemName, LPVOID HandleId, BOOL GenerateOnClose);
export extern(Windows) BOOL ObjectDeleteAuditAlarmW(LPCWSTR SubsystemName, LPVOID HandleId, BOOL GenerateOnClose);
version(UNICODE)
	alias ObjectDeleteAuditAlarmW ObjectDeleteAuditAlarm;
else
	alias ObjectDeleteAuditAlarmA ObjectDeleteAuditAlarm;

export extern(Windows) BOOL PrivilegedServiceAuditAlarmA(LPCSTR SubsystemName, LPCSTR ServiceName, HANDLE ClientToken, PPRIVILEGE_SET Privileges, BOOL AccessGranted);
export extern(Windows) BOOL PrivilegedServiceAuditAlarmW(LPCWSTR SubsystemName, LPCWSTR ServiceName, HANDLE ClientToken, PPRIVILEGE_SET Privileges, BOOL AccessGranted);
version(UNICODE)
	alias PrivilegedServiceAuditAlarmW PrivilegedServiceAuditAlarm;
else
	alias PrivilegedServiceAuditAlarmA PrivilegedServiceAuditAlarm;

static if(_WIN32_WINNT >= _WIN32_WINNT_WINXP){
	export extern(Windows) BOOL IsWellKnownSid(PSID pSid, WELL_KNOWN_SID_TYPE WellKnownSidType);
	export extern(Windows) BOOL CreateWellKnownSid(WELL_KNOWN_SID_TYPE WellKnownSidType, PSID DomainSid, PSID pSid, DWORD* cbSid);
	export extern(Windows) BOOL EqualDomainSid(PSID pSid1, PSID pSid2, BOOL* pfEqual);
	export extern(Windows) BOOL GetWindowsAccountDomainSid(PSID pSid, PSID pDomainSid, DWORD* cbDomainSid);
}
export extern(Windows) BOOL IsValidSid(PSID pSid);
export extern(Windows) BOOL EqualSid(PSID pSid1, PSID pSid2);
export extern(Windows) BOOL EqualPrefixSid(PSID pSid1, PSID pSid2);
export extern(Windows) DWORD GetSidLengthRequired(UCHAR nSubAuthorityCount);
export extern(Windows) BOOL AllocateAndInitializeSid(PSID_IDENTIFIER_AUTHORITY pIdentifierAuthority, BYTE nSubAuthorityCount, DWORD nSubAuthority0, DWORD nSubAuthority1, DWORD nSubAuthority2, DWORD nSubAuthority3, DWORD nSubAuthority4, DWORD nSubAuthority5, DWORD nSubAuthority6, DWORD nSubAuthority7, PSID* pSid);
export extern(Windows) PVOID FreeSid(PSID pSid);
export extern(Windows) BOOL InitializeSid(PSID Sid, PSID_IDENTIFIER_AUTHORITY pIdentifierAuthority, BYTE nSubAuthorityCount);
export extern(Windows) PSID_IDENTIFIER_AUTHORITY GetSidIdentifierAuthority(PSID pSid);
export extern(Windows) PDWORD GetSidSubAuthority(PSID pSid, DWORD nSubAuthority);
export extern(Windows) PUCHAR GetSidSubAuthorityCount(PSID pSid);
export extern(Windows) DWORD GetLengthSid(PSID pSid);
export extern(Windows) BOOL CopySid(DWORD nDestinationSidLength, PSID pDestinationSid, PSID pSourceSid);
export extern(Windows) BOOL AreAllAccessesGranted(DWORD GrantedAccess, DWORD DesiredAccess);
export extern(Windows) BOOL AreAnyAccessesGranted(DWORD GrantedAccess, DWORD DesiredAccess);
export extern(Windows) VOID MapGenericMask(PDWORD AccessMask, PGENERIC_MAPPING GenericMapping);
export extern(Windows) BOOL IsValidAcl(PACL pAcl);
export extern(Windows) BOOL InitializeAcl(PACL pAcl, DWORD nAclLength, DWORD dwAclRevision);
export extern(Windows) BOOL GetAclInformation(PACL pAcl, LPVOID pAclInformation, DWORD nAclInformationLength, ACL_INFORMATION_CLASS dwAclInformationClass);
export extern(Windows) BOOL SetAclInformation(PACL pAcl, LPVOID pAclInformation, DWORD nAclInformationLength, ACL_INFORMATION_CLASS dwAclInformationClass);
export extern(Windows) BOOL AddAce(PACL pAcl, DWORD dwAceRevision, DWORD dwStartingAceIndex, LPVOID pAceList, DWORD nAceListLength);
export extern(Windows) BOOL DeleteAce(PACL pAcl, DWORD dwAceIndex);
export extern(Windows) BOOL GetAce(PACL pAcl, DWORD dwAceIndex, LPVOID* pAce);
export extern(Windows) BOOL AddAccessAllowedAce(PACL pAcl, DWORD dwAceRevision, DWORD AccessMask, PSID pSid);
export extern(Windows) BOOL AddAccessAllowedAceEx(PACL pAcl, DWORD dwAceRevision, DWORD AceFlags, DWORD AccessMask, PSID pSid);
static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	export extern(Windows) BOOL AddMandatoryAce(PACL pAcl, DWORD dwAceRevision, DWORD AceFlags, DWORD MandatoryPolicy, PSID pLabelSid);
static if(_WIN32_WINNT >= _WIN32_WINNT_WIN7)
	export extern(Windows) BOOL AddConditionalAce(PACL pAcl, DWORD dwAceRevision, DWORD AceFlags, UCHAR AceType, DWORD AccessMask, PSID pSid, PWCHAR ConditionStr, DWORD* ReturnLength);
export extern(Windows) BOOL AddAccessDeniedAce(PACL pAcl,  DWORD dwAceRevision, DWORD AccessMask, PSID pSid);
export extern(Windows) BOOL AddAccessDeniedAceEx(PACL pAcl, DWORD dwAceRevision, DWORD AceFlags, DWORD AccessMask, PSID pSid);
export extern(Windows) BOOL AddAuditAccessAce(PACL pAcl, DWORD dwAceRevision, DWORD dwAccessMask, PSID pSid, BOOL bAuditSuccess, BOOL bAuditFailure);
export extern(Windows) BOOL AddAuditAccessAceEx(PACL pAcl, DWORD dwAceRevision, DWORD AceFlags, DWORD dwAccessMask, PSID pSid, BOOL bAuditSuccess, BOOL bAuditFailure);
export extern(Windows) BOOL AddAccessAllowedObjectAce(PACL pAcl, DWORD dwAceRevision, DWORD AceFlags, DWORD AccessMask, GUID* ObjectTypeGuid, GUID* InheritedObjectTypeGuid, PSID pSid);
export extern(Windows) BOOL AddAccessDeniedObjectAce(PACL pAcl, DWORD dwAceRevision, DWORD AceFlags, DWORD AccessMask, GUID* ObjectTypeGuid, GUID* InheritedObjectTypeGuid, PSID pSid);
export extern(Windows) BOOL AddAuditAccessObjectAce(PACL pAcl, DWORD dwAceRevision, DWORD AceFlags, DWORD AccessMask, GUID* ObjectTypeGuid, GUID* InheritedObjectTypeGuid, PSID pSid, BOOL bAuditSuccess, BOOL bAuditFailure);

export extern(Windows) BOOL FindFirstFreeAce(PACL pAcl, LPVOID* pAce);
export extern(Windows) BOOL InitializeSecurityDescriptor(PSECURITY_DESCRIPTOR pSecurityDescriptor, DWORD dwRevision);
export extern(Windows) BOOL IsValidSecurityDescriptor(PSECURITY_DESCRIPTOR pSecurityDescriptor);
export extern(Windows) BOOL IsValidRelativeSecurityDescriptor(PSECURITY_DESCRIPTOR pSecurityDescriptor, ULONG SecurityDescriptorLength, SECURITY_INFORMATION RequiredInformation);
export extern(Windows) DWORD GetSecurityDescriptorLength(PSECURITY_DESCRIPTOR pSecurityDescriptor);
export extern(Windows) BOOL GetSecurityDescriptorControl(PSECURITY_DESCRIPTOR pSecurityDescriptor, PSECURITY_DESCRIPTOR_CONTROL pControl, LPDWORD lpdwRevision);
export extern(Windows) BOOL SetSecurityDescriptorControl(PSECURITY_DESCRIPTOR pSecurityDescriptor, SECURITY_DESCRIPTOR_CONTROL ControlBitsOfInterest, SECURITY_DESCRIPTOR_CONTROL ControlBitsToSet);
export extern(Windows) BOOL SetSecurityDescriptorDacl(PSECURITY_DESCRIPTOR pSecurityDescriptor, BOOL bDaclPresent, PACL pDacl, BOOL bDaclDefaulted);
export extern(Windows) BOOL GetSecurityDescriptorDacl(PSECURITY_DESCRIPTOR pSecurityDescriptor, LPBOOL lpbDaclPresent, PACL* pDacl, LPBOOL lpbDaclDefaulted);
export extern(Windows) BOOL SetSecurityDescriptorSacl(PSECURITY_DESCRIPTOR pSecurityDescriptor, BOOL bSaclPresent, PACL pSacl, BOOL bSaclDefaulted);
export extern(Windows) BOOL GetSecurityDescriptorSacl(PSECURITY_DESCRIPTOR pSecurityDescriptor, LPBOOL lpbSaclPresent, PACL* pSacl, LPBOOL lpbSaclDefaulted);
export extern(Windows) BOOL SetSecurityDescriptorOwner(PSECURITY_DESCRIPTOR pSecurityDescriptor, PSID pOwner, BOOL bOwnerDefaulted);
export extern(Windows) BOOL GetSecurityDescriptorOwner(PSECURITY_DESCRIPTOR pSecurityDescriptor, PSID* pOwner, LPBOOL lpbOwnerDefaulted);
export extern(Windows) BOOL SetSecurityDescriptorGroup(PSECURITY_DESCRIPTOR pSecurityDescriptor, PSID pGroup, BOOL bGroupDefaulted);
export extern(Windows) BOOL GetSecurityDescriptorGroup(PSECURITY_DESCRIPTOR pSecurityDescriptor, PSID* pGroup, LPBOOL lpbGroupDefaulted);
export extern(Windows) DWORD SetSecurityDescriptorRMControl(PSECURITY_DESCRIPTOR SecurityDescriptor, PUCHAR RMControl);
export extern(Windows) DWORD GetSecurityDescriptorRMControl(PSECURITY_DESCRIPTOR SecurityDescriptor, PUCHAR RMControl);
export extern(Windows) BOOL CreatePrivateObjectSecurity(PSECURITY_DESCRIPTOR ParentDescriptor, PSECURITY_DESCRIPTOR CreatorDescriptor, PSECURITY_DESCRIPTOR* NewDescriptor, BOOL IsDirectoryObject, HANDLE Token, PGENERIC_MAPPING GenericMapping);
export extern(Windows) BOOL ConvertToAutoInheritPrivateObjectSecurity(PSECURITY_DESCRIPTOR ParentDescriptor, PSECURITY_DESCRIPTOR CurrentSecurityDescriptor, PSECURITY_DESCRIPTOR* NewSecurityDescriptor, GUID* ObjectType, BOOLEAN IsDirectoryObject, PGENERIC_MAPPING GenericMapping);
export extern(Windows) BOOL CreatePrivateObjectSecurityEx(PSECURITY_DESCRIPTOR ParentDescriptor, PSECURITY_DESCRIPTOR CreatorDescriptor, PSECURITY_DESCRIPTOR* NewDescriptor, GUID* ObjectType, BOOL IsContainerObject, ULONG AutoInheritFlags, HANDLE Token, PGENERIC_MAPPING GenericMapping);
export extern(Windows) BOOL CreatePrivateObjectSecurityWithMultipleInheritance(PSECURITY_DESCRIPTOR ParentDescriptor, PSECURITY_DESCRIPTOR CreatorDescriptor, PSECURITY_DESCRIPTOR* NewDescriptor, GUID** ObjectTypes, ULONG GuidCount, BOOL IsContainerObject, ULONG AutoInheritFlags, HANDLE Token, PGENERIC_MAPPING GenericMapping);
export extern(Windows) BOOL SetPrivateObjectSecurity(SECURITY_INFORMATION SecurityInformation, PSECURITY_DESCRIPTOR ModificationDescriptor, PSECURITY_DESCRIPTOR* ObjectsSecurityDescriptor, PGENERIC_MAPPING GenericMapping, HANDLE Token);
export extern(Windows) BOOL SetPrivateObjectSecurityEx(SECURITY_INFORMATION SecurityInformation, PSECURITY_DESCRIPTOR ModificationDescriptor, PSECURITY_DESCRIPTOR* ObjectsSecurityDescriptor, ULONG AutoInheritFlags, PGENERIC_MAPPING GenericMapping, HANDLE Token);
export extern(Windows) BOOL GetPrivateObjectSecurity(PSECURITY_DESCRIPTOR ObjectDescriptor, SECURITY_INFORMATION SecurityInformation, PSECURITY_DESCRIPTOR ResultantDescriptor, DWORD DescriptorLength, PDWORD ReturnLength);
export extern(Windows) BOOL DestroyPrivateObjectSecurity(PSECURITY_DESCRIPTOR* ObjectDescriptor);
export extern(Windows) BOOL MakeSelfRelativeSD(PSECURITY_DESCRIPTOR pAbsoluteSecurityDescriptor, PSECURITY_DESCRIPTOR pSelfRelativeSecurityDescriptor, LPDWORD lpdwBufferLength);
export extern(Windows) BOOL MakeAbsoluteSD(PSECURITY_DESCRIPTOR pSelfRelativeSecurityDescriptor, PSECURITY_DESCRIPTOR pAbsoluteSecurityDescriptor, LPDWORD lpdwAbsoluteSecurityDescriptorSize, PACL pDacl, LPDWORD lpdwDaclSize, PACL pSacl, LPDWORD lpdwSaclSize, PSID pOwner, LPDWORD lpdwOwnerSize, PSID pPrimaryGroup, LPDWORD lpdwPrimaryGroupSize);
export extern(Windows) BOOL MakeAbsoluteSD2(PSECURITY_DESCRIPTOR pSelfRelativeSecurityDescriptor, LPDWORD lpdwBufferSize);
export extern(Windows) VOID QuerySecurityAccessMask(SECURITY_INFORMATION SecurityInformation, LPDWORD DesiredAccess);
export extern(Windows) VOID SetSecurityAccessMask(SECURITY_INFORMATION SecurityInformation, LPDWORD DesiredAccess);
export extern(Windows) BOOL SetFileSecurityA(LPCSTR lpFileName, SECURITY_INFORMATION SecurityInformation, PSECURITY_DESCRIPTOR pSecurityDescriptor);
export extern(Windows) BOOL SetFileSecurityW(LPCWSTR lpFileName, SECURITY_INFORMATION SecurityInformation, PSECURITY_DESCRIPTOR pSecurityDescriptor);
version(UNICODE)
	alias SetFileSecurityW SetFileSecurity;
else
	alias SetFileSecurityA SetFileSecurity;

export extern(Windows) BOOL GetFileSecurityA(LPCSTR lpFileName, SECURITY_INFORMATION RequestedInformation, PSECURITY_DESCRIPTOR pSecurityDescriptor, DWORD nLength, LPDWORD lpnLengthNeeded);
export extern(Windows) BOOL GetFileSecurityW(LPCWSTR lpFileName, SECURITY_INFORMATION RequestedInformation, PSECURITY_DESCRIPTOR pSecurityDescriptor, DWORD nLength, LPDWORD lpnLengthNeeded);
version(UNICODE)
	alias GetFileSecurityW GetFileSecurity;
else
	alias GetFileSecurityA GetFileSecurity;

export extern(Windows) BOOL SetKernelObjectSecurity(HANDLE Handle, SECURITY_INFORMATION SecurityInformation, PSECURITY_DESCRIPTOR SecurityDescriptor);
export extern(Windows) HANDLE FindFirstChangeNotificationA(LPCSTR lpPathName, BOOL bWatchSubtree, DWORD dwNotifyFilter);
export extern(Windows) HANDLE FindFirstChangeNotificationW(LPCWSTR lpPathName, BOOL bWatchSubtree, DWORD dwNotifyFilter);
version(UNICODE)
	alias FindFirstChangeNotificationW FindFirstChangeNotification;
else
	alias FindFirstChangeNotificationA FindFirstChangeNotification;

export extern(Windows) BOOL FindNextChangeNotification(HANDLE hChangeHandle);
export extern(Windows) BOOL FindCloseChangeNotification(HANDLE hChangeHandle);

export extern(Windows) BOOL ReadDirectoryChangesW(HANDLE hDirectory, LPVOID lpBuffer, DWORD nBufferLength, BOOL bWatchSubtree, DWORD dwNotifyFilter, LPDWORD lpBytesReturned, LPOVERLAPPED lpOverlapped, LPOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine);

export extern(Windows) BOOL VirtualLock(LPVOID lpAddress, SIZE_T dwSize);
export extern(Windows) BOOL VirtualUnlock(LPVOID lpAddress, SIZE_T dwSize);
export extern(Windows) LPVOID MapViewOfFileEx(HANDLE hFileMappingObject, DWORD dwDesiredAccess, DWORD dwFileOffsetHigh, DWORD dwFileOffsetLow, SIZE_T dwNumberOfBytesToMap, LPVOID lpBaseAddress);

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	export extern(Windows) LPVOID MapViewOfFileExNuma(HANDLE hFileMappingObject, DWORD dwDesiredAccess, DWORD dwFileOffsetHigh, DWORD dwFileOffsetLow, SIZE_T dwNumberOfBytesToMap, LPVOID lpBaseAddress, DWORD nndPreferred);

export extern(Windows) BOOL SetPriorityClass(HANDLE hProcess, DWORD dwPriorityClass);
export extern(Windows) DWORD GetPriorityClass(HANDLE hProcess);
export extern(Windows) BOOL IsBadReadPtr(const(VOID)* lp, UINT_PTR ucb);
export extern(Windows) BOOL IsBadWritePtr(LPVOID lp, UINT_PTR ucb);
export extern(Windows) BOOL IsBadHugeReadPtr(const(VOID)* lp, UINT_PTR ucb);
export extern(Windows) BOOL IsBadHugeWritePtr(LPVOID lp, UINT_PTR ucb);
export extern(Windows) BOOL IsBadCodePtr(FARPROC lpfn);
export extern(Windows) BOOL IsBadStringPtrA(LPCSTR lpsz, UINT_PTR ucchMax);
export extern(Windows) BOOL IsBadStringPtrW(LPCWSTR lpsz, UINT_PTR ucchMax);
version(UNICODE)
	alias IsBadStringPtrW IsBadStringPtr;
else
	alias IsBadStringPtrA IsBadStringPtr;

export extern(Windows) BOOL LookupAccountSidA(LPCSTR lpSystemName, PSID Sid, LPSTR Name, LPDWORD cchName, LPSTR ReferencedDomainName, LPDWORD cchReferencedDomainName, PSID_NAME_USE peUse);
export extern(Windows) BOOL LookupAccountSidW(LPCWSTR lpSystemName, PSID Sid, LPWSTR Name, LPDWORD cchName, LPWSTR ReferencedDomainName, LPDWORD cchReferencedDomainName, PSID_NAME_USE peUse);
version(UNICODE)
	alias LookupAccountSidW LookupAccountSid;
else
	alias LookupAccountSidA LookupAccountSid;

export extern(Windows) BOOL LookupAccountSidLocalA(PSID Sid, LPSTR Name, LPDWORD cchName, LPSTR ReferencedDomainName, LPDWORD cchReferencedDomainName, PSID_NAME_USE peUse);
export extern(Windows) BOOL LookupAccountSidLocalW(PSID Sid, LPWSTR Name, LPDWORD cchName, LPWSTR ReferencedDomainName, LPDWORD cchReferencedDomainName, PSID_NAME_USE peUse);
version(UNICODE)
	alias LookupAccountSidLocalW LookupAccountSidLocal;
else
	alias LookupAccountSidLocalA LookupAccountSidLocal;

export extern(Windows) BOOL LookupAccountNameA(LPCSTR lpSystemName, LPCSTR lpAccountName, PSID Sid, LPDWORD cbSid, LPSTR ReferencedDomainName, LPDWORD cchReferencedDomainName, PSID_NAME_USE peUse);
export extern(Windows) BOOL LookupAccountNameW(LPCWSTR lpSystemName, LPCWSTR lpAccountName, PSID Sid, LPDWORD cbSid, LPWSTR ReferencedDomainName, LPDWORD cchReferencedDomainName, PSID_NAME_USE peUse);
version(UNICODE)
	alias LookupAccountNameW LookupAccountName;
else
	alias LookupAccountNameA LookupAccountName;

export extern(Windows) BOOL LookupAccountNameLocalA(LPCSTR lpAccountName, PSID Sid, LPDWORD cbSid, LPSTR ReferencedDomainName, LPDWORD cchReferencedDomainName, PSID_NAME_USE peUse);
export extern(Windows) BOOL LookupAccountNameLocalW(LPCWSTR lpAccountName, PSID Sid, LPDWORD cbSid, LPWSTR ReferencedDomainName, LPDWORD cchReferencedDomainName, PSID_NAME_USE peUse);
version(UNICODE)
	alias LookupAccountNameLocalW LookupAccountNameLocal;
else
	alias LookupAccountNameLocalA LookupAccountNameLocal;

export extern(Windows) BOOL LookupPrivilegeValueA(LPCSTR lpSystemName, LPCSTR lpName, PLUID lpLuid);
export extern(Windows) BOOL LookupPrivilegeValueW(LPCWSTR lpSystemName, LPCWSTR lpName, PLUID lpLuid);
version(UNICODE)
	alias LookupPrivilegeValueW LookupPrivilegeValue;
else
	alias LookupPrivilegeValueA LookupPrivilegeValue;

export extern(Windows) BOOL LookupPrivilegeNameA(LPCSTR lpSystemName, PLUID lpLuid, LPSTR lpName, LPDWORD cchName);
export extern(Windows) BOOL LookupPrivilegeNameW(LPCWSTR lpSystemName, PLUID lpLuid, LPWSTR lpName, LPDWORD cchName);
version(UNICODE)
	alias LookupPrivilegeNameW LookupPrivilegeName;
else
	alias LookupPrivilegeNameA LookupPrivilegeName;

export extern(Windows) BOOL LookupPrivilegeDisplayNameA(LPCSTR lpSystemName, LPCSTR lpName, LPSTR lpDisplayName, LPDWORD cchDisplayName, LPDWORD lpLanguageId);
export extern(Windows) BOOL LookupPrivilegeDisplayNameW(LPCWSTR lpSystemName, LPCWSTR lpName, LPWSTR lpDisplayName, LPDWORD cchDisplayName, LPDWORD lpLanguageId);
version(UNICODE)
	alias LookupPrivilegeDisplayNameW LookupPrivilegeDisplayName;
else
	alias LookupPrivilegeDisplayNameA LookupPrivilegeDisplayName;

export extern(Windows) BOOL AllocateLocallyUniqueId(PLUID Luid);
export extern(Windows) BOOL BuildCommDCBA(LPCSTR lpDef, LPDCB lpDCB);
export extern(Windows) BOOL BuildCommDCBW(LPCWSTR lpDef, LPDCB lpDCB);
version(UNICODE)
	alias BuildCommDCBW BuildCommDCB;
else
	alias BuildCommDCBA BuildCommDCB;

export extern(Windows) BOOL BuildCommDCBAndTimeoutsA(LPCSTR lpDef, LPDCB lpDCB, LPCOMMTIMEOUTS lpCommTimeouts);
export extern(Windows) BOOL BuildCommDCBAndTimeoutsW(LPCWSTR lpDef, LPDCB lpDCB, LPCOMMTIMEOUTS lpCommTimeouts);
version(UNICODE)
	alias BuildCommDCBAndTimeoutsW BuildCommDCBAndTimeouts;
else
	alias BuildCommDCBAndTimeoutsA BuildCommDCBAndTimeouts;

export extern(Windows) BOOL CommConfigDialogA(LPCSTR lpszName, HWND hWnd, LPCOMMCONFIG lpCC);
export extern(Windows) BOOL CommConfigDialogW(LPCWSTR lpszName, HWND hWnd, LPCOMMCONFIG lpCC);
version(UNICODE)
	alias CommConfigDialogW CommConfigDialog;
else
	alias CommConfigDialogA CommConfigDialog;

export extern(Windows) BOOL GetDefaultCommConfigA(LPCSTR lpszName, LPCOMMCONFIG lpCC, LPDWORD lpdwSize);
export extern(Windows) BOOL GetDefaultCommConfigW(LPCWSTR lpszName, LPCOMMCONFIG lpCC, LPDWORD lpdwSize);
version(UNICODE)
	alias GetDefaultCommConfigW GetDefaultCommConfig;
else
	alias GetDefaultCommConfigA GetDefaultCommConfig;

export extern(Windows) BOOL SetDefaultCommConfigA(LPCSTR lpszName, LPCOMMCONFIG lpCC, DWORD dwSize);
export extern(Windows) BOOL SetDefaultCommConfigW(LPCWSTR lpszName, LPCOMMCONFIG lpCC, DWORD dwSize);
version(UNICODE)
	alias SetDefaultCommConfigW SetDefaultCommConfig;
else
	alias SetDefaultCommConfigA SetDefaultCommConfig;

enum MAX_COMPUTERNAME_LENGTH = 15;

export extern(Windows) BOOL GetComputerNameA(LPSTR lpBuffer, LPDWORD nSize);
export extern(Windows) BOOL GetComputerNameW(LPWSTR lpBuffer, LPDWORD nSize);
version(UNICODE)
	alias GetComputerNameW GetComputerNam;
else
	alias GetComputerNameA GetComputerName;

export extern(Windows) BOOL SetComputerNameA(LPCSTR lpComputerName);
export extern(Windows) BOOL SetComputerNameW(LPCWSTR lpComputerName);
version(UNICODE)
	alias SetComputerNameW SetComputerNam;
else
	alias SetComputerNameA SetComputerName;


enum {
	ComputerNameNetBIOS,
	ComputerNameDnsHostname,
	ComputerNameDnsDomain,
	ComputerNameDnsFullyQualified,
	ComputerNamePhysicalNetBIOS,
	ComputerNamePhysicalDnsHostname,
	ComputerNamePhysicalDnsDomain,
	ComputerNamePhysicalDnsFullyQualified,
	ComputerNameMax
}
alias int COMPUTER_NAME_FORMAT;

export extern(Windows) BOOL GetComputerNameExA(COMPUTER_NAME_FORMAT NameType, LPSTR lpBuffer, LPDWORD nSize);
export extern(Windows) BOOL GetComputerNameExW(COMPUTER_NAME_FORMAT NameType, LPWSTR lpBuffer, LPDWORD nSize);
version(UNICODE)
	alias GetComputerNameExW GetComputerNameEx;
else
	alias GetComputerNameExA GetComputerNameEx;

export extern(Windows) BOOL SetComputerNameExA(COMPUTER_NAME_FORMAT NameType, LPCSTR lpBuffer);
export extern(Windows) BOOL SetComputerNameExW(COMPUTER_NAME_FORMAT NameType, LPCWSTR lpBuffer);
version(UNICODE)
	alias SetComputerNameExW SetComputerNameEx;
else
	alias SetComputerNameExA SetComputerNameEx;

export extern(Windows) BOOL DnsHostnameToComputerNameA(LPCSTR Hostname, LPSTR ComputerName, LPDWORD nSize);
export extern(Windows) BOOL DnsHostnameToComputerNameW(LPCWSTR Hostname, LPWSTR ComputerName, LPDWORD nSize);
version(UNICODE)
	alias DnsHostnameToComputerNameW DnsHostnameToComputerName;
else
	alias DnsHostnameToComputerNameA DnsHostnameToComputerName;

export extern(Windows) BOOL GetUserNameA(LPSTR lpBuffer, LPDWORD pcbBuffer);
export extern(Windows) BOOL GetUserNameW(LPWSTR lpBuffer, LPDWORD pcbBuffer);
version(UNICODE)
	alias GetUserNameW GetUserName;
else
	alias GetUserNameA GetUserName;
enum {
	LOGON32_LOGON_INTERACTIVE       = 2,
	LOGON32_LOGON_NETWORK           = 3,
	LOGON32_LOGON_BATCH             = 4,
	LOGON32_LOGON_SERVICE           = 5,
	LOGON32_LOGON_UNLOCK            = 7,
	LOGON32_LOGON_NETWORK_CLEARTEXT = 8,
	LOGON32_LOGON_NEW_CREDENTIALS   = 9,
}
enum {
	LOGON32_PROVIDER_DEFAULT = 0,
	LOGON32_PROVIDER_WINNT35 = 1,
	LOGON32_PROVIDER_WINNT40 = 2,
	LOGON32_PROVIDER_WINNT50 = 3,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		LOGON32_PROVIDER_VIRTUAL = 4,
}

export extern(Windows) BOOL LogonUserA(LPCSTR lpszUsername, LPCSTR lpszDomain, LPCSTR lpszPassword, DWORD dwLogonType, DWORD dwLogonProvider, PHANDLE phToken);
export extern(Windows) BOOL LogonUserW(LPCWSTR lpszUsername, LPCWSTR lpszDomain, LPCWSTR lpszPassword, DWORD dwLogonType, DWORD dwLogonProvider, PHANDLE phToken);
version(UNICODE)
	alias LogonUserW LogonUser;
else
	alias LogonUserA LogonUser;

export extern(Windows) BOOL LogonUserExA(LPCSTR lpszUsername, LPCSTR lpszDomain, LPCSTR lpszPassword, DWORD dwLogonType, DWORD dwLogonProvider, PHANDLE phToken, PSID* ppLogonSid, PVOID* ppProfileBuffer, LPDWORD pdwProfileLength, PQUOTA_LIMITS pQuotaLimits);
export extern(Windows) BOOL LogonUserExW(LPCWSTR lpszUsername, LPCWSTR lpszDomain, LPCWSTR lpszPassword, DWORD dwLogonType, DWORD dwLogonProvider, PHANDLE phToken, PSID* ppLogonSid, PVOID* ppProfileBuffer, LPDWORD pdwProfileLength, PQUOTA_LIMITS pQuotaLimits);
version(UNICODE)
	alias LogonUserExW LogonUserEx;
else
	alias LogonUserExA LogonUserEx;

export extern(Windows) BOOL ImpersonateLoggedOnUser(HANDLE hToken);
export extern(Windows) BOOL CreateProcessAsUserA(HANDLE hToken, LPCSTR lpApplicationName, LPSTR lpCommandLine, LPSECURITY_ATTRIBUTES lpProcessAttributes, LPSECURITY_ATTRIBUTES lpThreadAttributes, BOOL bInheritHandles, DWORD dwCreationFlags, LPVOID lpEnvironment, LPCSTR lpCurrentDirectory, LPSTARTUPINFOA lpStartupInfo, LPPROCESS_INFORMATION lpProcessInformation);
export extern(Windows) BOOL CreateProcessAsUserW(HANDLE hToken, LPCWSTR lpApplicationName, LPWSTR lpCommandLine, LPSECURITY_ATTRIBUTES lpProcessAttributes, LPSECURITY_ATTRIBUTES lpThreadAttributes, BOOL bInheritHandles, DWORD dwCreationFlags, LPVOID lpEnvironment, LPCWSTR lpCurrentDirectory, LPSTARTUPINFOW lpStartupInfo, LPPROCESS_INFORMATION lpProcessInformation);
version(UNICODE)
	alias CreateProcessAsUserW CreateProcessAsUser;
else
	alias CreateProcessAsUserA CreateProcessAsUser;

enum {
	LOGON_WITH_PROFILE         = 0x00000001,
	LOGON_NETCREDENTIALS_ONLY  = 0x00000002,
	LOGON_ZERO_PASSWORD_BUFFER = 0x80000000,
}

export extern(Windows) BOOL CreateProcessWithLogonW(LPCWSTR lpUsername, LPCWSTR lpDomain, LPCWSTR lpPassword, DWORD dwLogonFlags, LPCWSTR lpApplicationName, LPWSTR lpCommandLine, DWORD dwCreationFlags, LPVOID lpEnvironment, LPCWSTR lpCurrentDirectory, LPSTARTUPINFOW lpStartupInfo, LPPROCESS_INFORMATION lpProcessInformation);
export extern(Windows) BOOL CreateProcessWithTokenW(HANDLE hToken, DWORD dwLogonFlags, LPCWSTR lpApplicationName, LPWSTR lpCommandLine, DWORD dwCreationFlags, LPVOID lpEnvironment, LPCWSTR lpCurrentDirectory, LPSTARTUPINFOW lpStartupInfo, LPPROCESS_INFORMATION lpProcessInformation);

export extern(Windows) BOOL ImpersonateAnonymousToken(HANDLE ThreadHandle);
export extern(Windows) BOOL DuplicateTokenEx(HANDLE hExistingToken, DWORD dwDesiredAccess, LPSECURITY_ATTRIBUTES lpTokenAttributes, SECURITY_IMPERSONATION_LEVEL ImpersonationLevel, TOKEN_TYPE TokenType, PHANDLE phNewToken);
export extern(Windows) BOOL CreateRestrictedToken(HANDLE ExistingTokenHandle, DWORD Flags, DWORD DisableSidCount, PSID_AND_ATTRIBUTES SidsToDisable, DWORD DeletePrivilegeCount, PLUID_AND_ATTRIBUTES PrivilegesToDelete, DWORD RestrictedSidCount, PSID_AND_ATTRIBUTES SidsToRestrict, PHANDLE NewTokenHandle);
export extern(Windows) BOOL IsTokenRestricted(HANDLE TokenHandle);
export extern(Windows) BOOL IsTokenUntrusted(HANDLE TokenHandle);
export extern(Windows) BOOL CheckTokenMembership(HANDLE TokenHandle, PSID SidToCheck, PBOOL IsMember);

alias WAITORTIMERCALLBACKFUNC WAITORTIMERCALLBACK;

export extern(Windows) BOOL RegisterWaitForSingleObject(PHANDLE phNewWaitObject, HANDLE hObject, WAITORTIMERCALLBACK Callback, PVOID Context, ULONG dwMilliseconds, ULONG dwFlags);
export extern(Windows) HANDLE RegisterWaitForSingleObjectEx(HANDLE hObject, WAITORTIMERCALLBACK Callback, PVOID Context, ULONG dwMilliseconds, ULONG dwFlags);
export extern(Windows) BOOL UnregisterWait(HANDLE WaitHandle);
export extern(Windows) BOOL UnregisterWaitEx(HANDLE WaitHandle, HANDLE CompletionEvent);
export extern(Windows) BOOL QueueUserWorkItem(LPTHREAD_START_ROUTINE Function, PVOID Context, ULONG Flags);
export extern(Windows) BOOL BindIoCompletionCallback(HANDLE FileHandle, LPOVERLAPPED_COMPLETION_ROUTINE Function, ULONG Flags);
export extern(Windows) HANDLE CreateTimerQueue();
export extern(Windows) BOOL CreateTimerQueueTimer(PHANDLE phNewTimer, HANDLE TimerQueue, WAITORTIMERCALLBACK Callback, PVOID Parameter, DWORD DueTime, DWORD Period, ULONG Flags );
export extern(Windows) BOOL ChangeTimerQueueTimer(HANDLE TimerQueue, HANDLE Timer, ULONG DueTime, ULONG Period);
export extern(Windows) BOOL DeleteTimerQueueTimer(HANDLE TimerQueue, HANDLE Timer, HANDLE CompletionEvent);
export extern(Windows) BOOL DeleteTimerQueueEx(HANDLE TimerQueue, HANDLE CompletionEvent);
export extern(Windows) HANDLE SetTimerQueueTimer(HANDLE TimerQueue, WAITORTIMERCALLBACK Callback, PVOID Parameter, DWORD DueTime, DWORD Period, BOOL PreferIo);
export extern(Windows) BOOL CancelTimerQueueTimer(HANDLE TimerQueue, HANDLE Timer);
export extern(Windows) BOOL DeleteTimerQueue(HANDLE TimerQueue);

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	alias extern(Windows) VOID function(PTP_CALLBACK_INSTANCE Instance, PVOID Context, PVOID Overlapped, ULONG IoResult, ULONG_PTR NumberOfBytesTransferred, PTP_IO Io) PTP_WIN32_IO_CALLBACK;
	export extern(Windows) PTP_POOL CreateThreadpool(PVOID reserved);
	export extern(Windows) VOID SetThreadpoolThreadMaximum(PTP_POOL ptpp, DWORD cthrdMost);
	export extern(Windows) BOOL SetThreadpoolThreadMinimum(PTP_POOL ptpp, DWORD cthrdMic);
	export extern(Windows) BOOL SetThreadpoolStackInformation(PTP_POOL ptpp, PTP_POOL_STACK_INFORMATION ptpsi);
	export extern(Windows) BOOL QueryThreadpoolStackInformation(PTP_POOL ptpp, PTP_POOL_STACK_INFORMATION ptpsi);
	export extern(Windows) VOID CloseThreadpool(PTP_POOL ptpp);
	export extern(Windows) PTP_CLEANUP_GROUP CreateThreadpoolCleanupGroup();
	export extern(Windows) VOID CloseThreadpoolCleanupGroupMembers(PTP_CLEANUP_GROUP ptpcg, BOOL fCancelPendingCallbacks, PVOID pvCleanupContext);
	export extern(Windows) VOID CloseThreadpoolCleanupGroup(PTP_CLEANUP_GROUP ptpcg);

	VOID InitializeThreadpoolEnvironment(PTP_CALLBACK_ENVIRON pcbe)
	{
		TpInitializeCallbackEnviron(pcbe);
	}

	VOID SetThreadpoolCallbackPool(PTP_CALLBACK_ENVIRON pcbe, PTP_POOL ptpp)
	{
		TpSetCallbackThreadpool(pcbe, ptpp);
	}

	VOID SetThreadpoolCallbackCleanupGroup(PTP_CALLBACK_ENVIRON pcbe, PTP_CLEANUP_GROUP ptpcg, PTP_CLEANUP_GROUP_CANCEL_CALLBACK pfng)
	{
		TpSetCallbackCleanupGroup(pcbe, ptpcg, pfng);
	}

	VOID SetThreadpoolCallbackRunsLong(PTP_CALLBACK_ENVIRON pcbe)
	{
		TpSetCallbackLongFunction(pcbe);
	}

	VOID SetThreadpoolCallbackLibrary(PTP_CALLBACK_ENVIRON pcbe, PVOID mod)
	{
		TpSetCallbackRaceWithDll(pcbe, mod);
	}

	static if(_WIN32_WINNT >= _WIN32_WINNT_WIN7){
		VOID SetThreadpoolCallbackPriority(PTP_CALLBACK_ENVIRON pcbe, TP_CALLBACK_PRIORITY Priority)
		{
			TpSetCallbackPriority(pcbe, Priority);
		}
	}

	VOID SetThreadpoolCallbackPersistent(PTP_CALLBACK_ENVIRON pcbe)
	{
		TpSetCallbackPersistent(pcbe);
	}

	VOID DestroyThreadpoolEnvironment(PTP_CALLBACK_ENVIRON pcbe)
	{
		TpDestroyCallbackEnviron(pcbe);
	}

	export extern(Windows) VOID SetEventWhenCallbackReturns(PTP_CALLBACK_INSTANCE pci, HANDLE evt);
	export extern(Windows) VOID ReleaseSemaphoreWhenCallbackReturns(PTP_CALLBACK_INSTANCE pci, HANDLE sem, DWORD crel);
	export extern(Windows) VOID ReleaseMutexWhenCallbackReturns(PTP_CALLBACK_INSTANCE pci, HANDLE mut);
	export extern(Windows) VOID LeaveCriticalSectionWhenCallbackReturns(PTP_CALLBACK_INSTANCE pci, PCRITICAL_SECTION pcs);
	export extern(Windows) VOID FreeLibraryWhenCallbackReturns(PTP_CALLBACK_INSTANCE pci, HMODULE mod);
	export extern(Windows) BOOL CallbackMayRunLong(PTP_CALLBACK_INSTANCE pci);
	export extern(Windows) VOID DisassociateCurrentThreadFromCallback(PTP_CALLBACK_INSTANCE pci);
	export extern(Windows) BOOL TrySubmitThreadpoolCallback(PTP_SIMPLE_CALLBACK pfns, PVOID pv, PTP_CALLBACK_ENVIRON pcbe);
	export extern(Windows) PTP_WORK CreateThreadpoolWork(PTP_WORK_CALLBACK pfnwk, PVOID pv, PTP_CALLBACK_ENVIRON pcbe);
	export extern(Windows) VOID SubmitThreadpoolWork(PTP_WORK pwk);
	export extern(Windows) VOID WaitForThreadpoolWorkCallbacks(PTP_WORK pwk, BOOL fCancelPendingCallbacks);
	export extern(Windows) VOID CloseThreadpoolWork(PTP_WORK pwk);
	export extern(Windows) PTP_TIMER CreateThreadpoolTimer(PTP_TIMER_CALLBACK pfnti, PVOID pv, PTP_CALLBACK_ENVIRON pcbe);
	export extern(Windows) VOID SetThreadpoolTimer(PTP_TIMER pti, PFILETIME pftDueTime, DWORD msPeriod, DWORD msWindowLength);
	export extern(Windows) BOOL IsThreadpoolTimerSet(PTP_TIMER pti);
	export extern(Windows) VOID WaitForThreadpoolTimerCallbacks(PTP_TIMER pti, BOOL fCancelPendingCallbacks);
	export extern(Windows) VOID CloseThreadpoolTimer(PTP_TIMER pti);
	export extern(Windows) PTP_WAIT CreateThreadpoolWait(PTP_WAIT_CALLBACK pfnwa, PVOID pv, PTP_CALLBACK_ENVIRON pcbe);
	export extern(Windows) VOID SetThreadpoolWait(PTP_WAIT pwa, HANDLE h, PFILETIME pftTimeout);
	export extern(Windows) VOID WaitForThreadpoolWaitCallbacks(PTP_WAIT pwa, BOOL fCancelPendingCallbacks);
	export extern(Windows) VOID CloseThreadpoolWait(PTP_WAIT pwa);
	export extern(Windows) PTP_IO CreateThreadpoolIo(HANDLE fl, PTP_WIN32_IO_CALLBACK pfnio, PVOID pv, PTP_CALLBACK_ENVIRON pcbe);
	export extern(Windows) VOID StartThreadpoolIo(PTP_IO pio);
	export extern(Windows) VOID CancelThreadpoolIo(PTP_IO pio);
	export extern(Windows) VOID WaitForThreadpoolIoCallbacks(PTP_IO pio, BOOL fCancelPendingCallbacks);
	export extern(Windows) VOID CloseThreadpoolIo(PTP_IO pio);
	export extern(Windows) HANDLE CreatePrivateNamespaceA(LPSECURITY_ATTRIBUTES lpPrivateNamespaceAttributes, LPVOID lpBoundaryDescriptor, LPCSTR lpAliasPrefix);
	export extern(Windows) HANDLE CreatePrivateNamespaceW(LPSECURITY_ATTRIBUTES lpPrivateNamespaceAttributes, LPVOID lpBoundaryDescriptor, LPCWSTR lpAliasPrefix);
	version(UNICODE)
		alias CreatePrivateNamespaceW CreatePrivateNamespace;
	else
		alias CreatePrivateNamespaceA CreatePrivateNamespace;

	export extern(Windows) HANDLE OpenPrivateNamespaceA(LPVOID lpBoundaryDescriptor, LPCSTR lpAliasPrefix);
	export extern(Windows) HANDLE OpenPrivateNamespaceW(LPVOID lpBoundaryDescriptor, LPCWSTR lpAliasPrefix);
	version(UNICODE)
		alias OpenPrivateNamespaceW OpenPrivateNamespace;
	else
		alias OpenPrivateNamespaceA OpenPrivateNamespace;

	enum PRIVATE_NAMESPACE_FLAG_DESTROY = 0x00000001;

	export extern(Windows) BOOLEAN ClosePrivateNamespace(HANDLE Handle, ULONG Flags);
	export extern(Windows) HANDLE CreateBoundaryDescriptorA(LPCSTR Name, ULONG Flags);
	export extern(Windows) HANDLE CreateBoundaryDescriptorW(LPCWSTR Name, ULONG Flags);
	version(UNICODE)
		alias CreateBoundaryDescriptorW CreateBoundaryDescriptor;
	else
		alias CreateBoundaryDescriptorA CreateBoundaryDescriptor;
	export extern(Windows) BOOL AddSIDToBoundaryDescriptor(HANDLE* BoundaryDescriptor, PSID RequiredSid);
	export extern(Windows) BOOL AddIntegrityLabelToBoundaryDescriptor(HANDLE* BoundaryDescriptor, PSID IntegrityLabel);
	export extern(Windows) VOID DeleteBoundaryDescriptor(HANDLE BoundaryDescriptor);
}

enum {
	HW_PROFILE_GUIDLEN = 39,
	MAX_PROFILE_LEN    = 80,
}

enum {
	DOCKINFO_UNDOCKED      = 0x1,
	DOCKINFO_DOCKED        = 0x2,
	DOCKINFO_USER_SUPPLIED = 0x4,
	DOCKINFO_USER_UNDOCKED = DOCKINFO_USER_SUPPLIED | DOCKINFO_UNDOCKED,
	DOCKINFO_USER_DOCKED   = DOCKINFO_USER_SUPPLIED | DOCKINFO_DOCKED,
}

struct HW_PROFILE_INFOA {
	 DWORD dwDockInfo;
	 CHAR[HW_PROFILE_GUIDLEN] szHwProfileGuid;
	 CHAR[MAX_PROFILE_LEN] szHwProfileName;
}
alias HW_PROFILE_INFOA* LPHW_PROFILE_INFOA;
struct HW_PROFILE_INFOW {
	 DWORD dwDockInfo;
	 WCHAR[HW_PROFILE_GUIDLEN] szHwProfileGuid;
	 WCHAR[MAX_PROFILE_LEN] szHwProfileName;
}
alias HW_PROFILE_INFOW* LPHW_PROFILE_INFOW;
version(UNICODE){
	alias HW_PROFILE_INFOW HW_PROFILE_INFO;
	alias LPHW_PROFILE_INFOW LPHW_PROFILE_INFO;
}else{
	alias HW_PROFILE_INFOA HW_PROFILE_INFO;
	alias LPHW_PROFILE_INFOA LPHW_PROFILE_INFO;
}

export extern(Windows) BOOL GetCurrentHwProfileA(LPHW_PROFILE_INFOA lpHwProfileInfo);
export extern(Windows) BOOL GetCurrentHwProfileW(LPHW_PROFILE_INFOW lpHwProfileInfo);
version(UNICODE)
	alias GetCurrentHwProfileW GetCurrentHwProfile;
else
	alias GetCurrentHwProfileA GetCurrentHwProfile;

export extern(Windows) BOOL QueryPerformanceCounter(LARGE_INTEGER* lpPerformanceCount);
export extern(Windows) BOOL QueryPerformanceFrequency(LARGE_INTEGER* lpFrequency);

export extern(Windows) BOOL GetVersionExA(LPOSVERSIONINFOA lpVersionInformation);
export extern(Windows) BOOL GetVersionExW(LPOSVERSIONINFOW lpVersionInformation);
version(UNICODE)
	alias GetVersionExW GetVersionEx;
else
	alias GetVersionExA GetVersionEx;

export extern(Windows) BOOL VerifyVersionInfoA(LPOSVERSIONINFOEXA lpVersionInformation, DWORD dwTypeMask, DWORDLONG dwlConditionMask);
export extern(Windows) BOOL VerifyVersionInfoW(LPOSVERSIONINFOEXW lpVersionInformation, DWORD dwTypeMask, DWORDLONG dwlConditionMask);
version(UNICODE)
	alias VerifyVersionInfoW VerifyVersionInfo;
else
	alias VerifyVersionInfoA VerifyVersionInfo;

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	export extern(Windows) BOOL GetProductInfo(DWORD dwOSMajorVersion, DWORD dwOSMinorVersion, DWORD dwSpMajorVersion, DWORD dwSpMinorVersion, PDWORD pdwReturnedProductType);

enum {
	TC_NORMAL  = 0,
	TC_HARDERR = 1,
	TC_GP_TRAP = 2,
	TC_SIGNAL  = 3,
}

enum {
	AC_LINE_OFFLINE      = 0x00,
	AC_LINE_ONLINE       = 0x01,
	AC_LINE_BACKUP_POWER = 0x02,
	AC_LINE_UNKNOWN      = 0xFF,
}

enum {
	BATTERY_FLAG_HIGH          = 0x01,
	BATTERY_FLAG_LOW           = 0x02,
	BATTERY_FLAG_CRITICAL      = 0x04,
	BATTERY_FLAG_CHARGING      = 0x08,
	BATTERY_FLAG_NO_BATTERY    = 0x80,
	BATTERY_FLAG_UNKNOWN       = 0xFF,
	BATTERY_PERCENTAGE_UNKNOWN = 0xFF,
	BATTERY_LIFE_UNKNOWN       = 0xFFFFFFFF,
}

struct SYSTEM_POWER_STATUS {
	BYTE ACLineStatus;
	BYTE BatteryFlag;
	BYTE BatteryLifePercent;
	BYTE Reserved1;
	DWORD BatteryLifeTime;
	DWORD BatteryFullLifeTime;
}
alias SYSTEM_POWER_STATUS* LPSYSTEM_POWER_STATUS;
export extern(Windows) BOOL GetSystemPowerStatus(LPSYSTEM_POWER_STATUS lpSystemPowerStatus);
export extern(Windows) BOOL SetSystemPowerState(BOOL fSuspend, BOOL fForce);

export extern(Windows) BOOL AllocateUserPhysicalPages(HANDLE hProcess, PULONG_PTR NumberOfPages, PULONG_PTR PageArray);
static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	export extern(Windows) BOOL AllocateUserPhysicalPagesNuma(HANDLE hProcess, PULONG_PTR NumberOfPages, PULONG_PTR PageArray, DWORD nndPreferred);

export extern(Windows) BOOL FreeUserPhysicalPages(HANDLE hProcess, PULONG_PTR NumberOfPages, PULONG_PTR PageArray);
export extern(Windows) BOOL MapUserPhysicalPages(PVOID VirtualAddress, ULONG_PTR NumberOfPages, PULONG_PTR PageArray);
export extern(Windows) BOOL MapUserPhysicalPagesScatter(PVOID* VirtualAddresses, ULONG_PTR NumberOfPages, PULONG_PTR PageArray);
export extern(Windows) HANDLE CreateJobObjectA(LPSECURITY_ATTRIBUTES lpJobAttributes, LPCSTR lpName);
export extern(Windows) HANDLE CreateJobObjectW(LPSECURITY_ATTRIBUTES lpJobAttributes, LPCWSTR lpName);
version(UNICODE)
	alias CreateJobObjectW CreateJobObject;
else
	alias CreateJobObjectA CreateJobObject;

export extern(Windows) HANDLE OpenJobObjectA(DWORD dwDesiredAccess, BOOL bInheritHandle, LPCSTR lpName);
export extern(Windows) HANDLE OpenJobObjectW(DWORD dwDesiredAccess, BOOL bInheritHandle, LPCWSTR lpName);
version(UNICODE)
	alias OpenJobObjectW OpenJobObject;
else
	alias OpenJobObjectA OpenJobObject;

export extern(Windows) BOOL AssignProcessToJobObject(HANDLE hJob, HANDLE hProcess);
export extern(Windows) BOOL TerminateJobObject(HANDLE hJob, UINT uExitCode);
export extern(Windows) BOOL QueryInformationJobObject(HANDLE hJob, JOBOBJECTINFOCLASS JobObjectInformationClass, LPVOID lpJobObjectInformation, DWORD cbJobObjectInformationLength, LPDWORD lpReturnLength);
export extern(Windows) BOOL SetInformationJobObject(HANDLE hJob, JOBOBJECTINFOCLASS JobObjectInformationClass, LPVOID lpJobObjectInformation, DWORD cbJobObjectInformationLength);
static if(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	export extern(Windows) BOOL IsProcessInJob(HANDLE ProcessHandle, HANDLE JobHandle, PBOOL Result);

export extern(Windows) BOOL CreateJobSet(ULONG NumJob, PJOB_SET_ARRAY UserJobSet, ULONG Flags);
export extern(Windows) PVOID AddVectoredExceptionHandler(ULONG First, PVECTORED_EXCEPTION_HANDLER Handler);
export extern(Windows) ULONG RemoveVectoredExceptionHandler(PVOID Handle);
export extern(Windows) PVOID AddVectoredContinueHandler(ULONG First, PVECTORED_EXCEPTION_HANDLER Handler);
export extern(Windows) ULONG RemoveVectoredContinueHandler(PVOID Handle);
export extern(Windows) HANDLE FindFirstVolumeA(LPSTR lpszVolumeName, DWORD cchBufferLength);
export extern(Windows) HANDLE FindFirstVolumeW(LPWSTR lpszVolumeName, DWORD cchBufferLength);
version(UNICODE)
	alias FindFirstVolumeW FindFirstVolume;
else
	alias FindFirstVolumeA FindFirstVolume;

export extern(Windows) BOOL FindNextVolumeA(HANDLE hFindVolume, LPSTR lpszVolumeName, DWORD cchBufferLength);
export extern(Windows) BOOL FindNextVolumeW(HANDLE hFindVolume, LPWSTR lpszVolumeName, DWORD cchBufferLength);
version(UNICODE)
	alias FindNextVolumeW FindNextVolume;
else
	alias FindNextVolumeA FindNextVolume;

export extern(Windows) BOOL FindVolumeClose(HANDLE hFindVolume);
export extern(Windows) HANDLE FindFirstVolumeMountPointA(LPCSTR lpszRootPathName, LPSTR lpszVolumeMountPoint, DWORD cchBufferLength);
export extern(Windows) HANDLE FindFirstVolumeMountPointW(LPCWSTR lpszRootPathName, LPWSTR lpszVolumeMountPoint, DWORD cchBufferLength);
version(UNICODE)
	alias FindFirstVolumeMountPointW FindFirstVolumeMountPoint;
else
	alias FindFirstVolumeMountPointA FindFirstVolumeMountPoint;

export extern(Windows) BOOL FindNextVolumeMountPointA(HANDLE hFindVolumeMountPoint, LPSTR lpszVolumeMountPoint, DWORD cchBufferLength);
export extern(Windows) BOOL FindNextVolumeMountPointW(HANDLE hFindVolumeMountPoint, LPWSTR lpszVolumeMountPoint, DWORD cchBufferLength);
version(UNICODE)
	alias FindNextVolumeMountPointW FindNextVolumeMountPoint;
else
	alias FindNextVolumeMountPointA FindNextVolumeMountPoint;

export extern(Windows) BOOL FindVolumeMountPointClose(HANDLE hFindVolumeMountPoint);

export extern(Windows) BOOL SetVolumeMountPointA(LPCSTR lpszVolumeMountPoint, LPCSTR lpszVolumeName);
export extern(Windows) BOOL SetVolumeMountPointW(LPCWSTR lpszVolumeMountPoint, LPCWSTR lpszVolumeName);
version(UNICODE)
	alias SetVolumeMountPointW SetVolumeMountPoint;
else
	alias SetVolumeMountPointA SetVolumeMountPoint;

export extern(Windows) BOOL DeleteVolumeMountPointA(LPCSTR lpszVolumeMountPoint);
export extern(Windows) BOOL DeleteVolumeMountPointW(LPCWSTR lpszVolumeMountPoint);
version(UNICODE)
	alias DeleteVolumeMountPointW DeleteVolumeMountPoint;
else
	alias DeleteVolumeMountPointA DeleteVolumeMountPoint;

export extern(Windows) BOOL GetVolumeNameForVolumeMountPointA(LPCSTR lpszVolumeMountPoint, LPSTR lpszVolumeName, DWORD cchBufferLength);
export extern(Windows) BOOL GetVolumeNameForVolumeMountPointW(LPCWSTR lpszVolumeMountPoint, LPWSTR lpszVolumeName, DWORD cchBufferLength);
version(UNICODE)
	alias GetVolumeNameForVolumeMountPointW GetVolumeNameForVolumeMountPoint;
else
	alias GetVolumeNameForVolumeMountPointA GetVolumeNameForVolumeMountPoint;

export extern(Windows) BOOL GetVolumePathNameA(LPCSTR lpszFileName, LPSTR lpszVolumePathName, DWORD cchBufferLength);
export extern(Windows) BOOL GetVolumePathNameW(LPCWSTR lpszFileName, LPWSTR lpszVolumePathName, DWORD cchBufferLength);
version(UNICODE)
	alias GetVolumePathNameW GetVolumePathName;
else
	alias GetVolumePathNameA GetVolumePathName;


static if(_WIN32_WINNT >= _WIN32_WINNT_WINXP){
	export extern(Windows) BOOL GetVolumePathNamesForVolumeNameA(LPCSTR lpszVolumeName, LPCH lpszVolumePathNames, DWORD cchBufferLength, PDWORD lpcchReturnLength);
	export extern(Windows) BOOL GetVolumePathNamesForVolumeNameW(LPCWSTR lpszVolumeName, LPWCH lpszVolumePathNames, DWORD cchBufferLength, PDWORD lpcchReturnLength);
	version(UNICODE)
		alias GetVolumePathNamesForVolumeNameW GetVolumePathNamesForVolumeName;
	else
		alias GetVolumePathNamesForVolumeNameA GetVolumePathNamesForVolumeName;
}

enum {
	ACTCTX_FLAG_PROCESSOR_ARCHITECTURE_VALID = 0x00000001,
	ACTCTX_FLAG_LANGID_VALID                 = 0x00000002,
	ACTCTX_FLAG_ASSEMBLY_DIRECTORY_VALID     = 0x00000004,
	ACTCTX_FLAG_RESOURCE_NAME_VALID          = 0x00000008,
	ACTCTX_FLAG_SET_PROCESS_DEFAULT          = 0x00000010,
	ACTCTX_FLAG_APPLICATION_NAME_VALID       = 0x00000020,
	ACTCTX_FLAG_SOURCE_IS_ASSEMBLYREF        = 0x00000040,
	ACTCTX_FLAG_HMODULE_VALID                = 0x00000080,
}

struct ACTCTXA {
	ULONG cbSize;
	DWORD dwFlags;
	LPCSTR lpSource;
	USHORT wProcessorArchitecture;
	LANGID wLangId;
	LPCSTR lpAssemblyDirectory;
	LPCSTR lpResourceName;
	LPCSTR lpApplicationName;
	HMODULE hModule;
}
alias ACTCTXA* PACTCTXA;
struct ACTCTXW {
	ULONG cbSize;
	DWORD dwFlags;
	LPCWSTR lpSource;
	USHORT wProcessorArchitecture;
	LANGID wLangId;
	LPCWSTR lpAssemblyDirectory;
	LPCWSTR lpResourceName;
	LPCWSTR lpApplicationName;
	HMODULE hModule;
}
alias ACTCTXW* PACTCTXW;
version(UNICODE){
	alias ACTCTXW ACTCTX;
	alias PACTCTXW PACTCTX;
}else{
	alias ACTCTXA ACTCTX;
	alias PACTCTXA PACTCTX;
}
alias const(ACTCTXA)* PCACTCTXA;
alias const(ACTCTXW)* PCACTCTXW;
version(UNICODE)
	alias PCACTCTXW PCACTCTX;
else
	alias PCACTCTXA PCACTCTX;

export extern(Windows) HANDLE CreateActCtxA(PCACTCTXA pActCtx);
export extern(Windows) HANDLE CreateActCtxW(PCACTCTXW pActCtx);
version(UNICODE)
	alias CreateActCtxW CreateActCtx;
else
	alias CreateActCtxA CreateActCtx;

export extern(Windows) VOID AddRefActCtx(HANDLE hActCtx);
export extern(Windows) VOID ReleaseActCtx(HANDLE hActCtx);
export extern(Windows) BOOL ZombifyActCtx(HANDLE hActCtx);
export extern(Windows) BOOL ActivateActCtx(HANDLE hActCtx, ULONG_PTR* lpCookie);

enum DEACTIVATE_ACTCTX_FLAG_FORCE_EARLY_DEACTIVATION = 0x00000001;

export extern(Windows) BOOL DeactivateActCtx(DWORD dwFlags, ULONG_PTR ulCookie);
export extern(Windows) BOOL GetCurrentActCtx(HANDLE* lphActCtx);

struct ACTCTX_SECTION_KEYED_DATA_2600 {
	ULONG cbSize;
	ULONG ulDataFormatVersion;
	PVOID lpData;
	ULONG ulLength;
	PVOID lpSectionGlobalData;
	ULONG ulSectionGlobalDataLength;
	PVOID lpSectionBase;
	ULONG ulSectionTotalLength;
	HANDLE hActCtx;
	ULONG ulAssemblyRosterIndex;
}
alias ACTCTX_SECTION_KEYED_DATA_2600* PACTCTX_SECTION_KEYED_DATA_2600;
alias const(ACTCTX_SECTION_KEYED_DATA_2600)* PCACTCTX_SECTION_KEYED_DATA_2600;

struct ACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA {
	PVOID lpInformation;
	PVOID lpSectionBase;
	ULONG ulSectionLength;
	PVOID lpSectionGlobalDataBase;
	ULONG ulSectionGlobalDataLength;
}
alias ACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA* PACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA;
alias const(ACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA)* PCACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA;

struct ACTCTX_SECTION_KEYED_DATA {
	ULONG cbSize;
	ULONG ulDataFormatVersion;
	PVOID lpData;
	ULONG ulLength;
	PVOID lpSectionGlobalData;
	ULONG ulSectionGlobalDataLength;
	PVOID lpSectionBase;
	ULONG ulSectionTotalLength;
	HANDLE hActCtx;
	ULONG ulAssemblyRosterIndex;
	ULONG ulFlags;
	ACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA AssemblyMetadata;
}
alias ACTCTX_SECTION_KEYED_DATA* PACTCTX_SECTION_KEYED_DATA;
alias const(ACTCTX_SECTION_KEYED_DATA)* PCACTCTX_SECTION_KEYED_DATA;

enum {
	FIND_ACTCTX_SECTION_KEY_RETURN_HACTCTX           = 0x00000001,
	FIND_ACTCTX_SECTION_KEY_RETURN_FLAGS             = 0x00000002,
	FIND_ACTCTX_SECTION_KEY_RETURN_ASSEMBLY_METADATA = 0x00000004,
}

export extern(Windows) BOOL FindActCtxSectionStringA(DWORD dwFlags, const(GUID)* lpExtensionGuid, ULONG ulSectionId, LPCSTR lpStringToFind, PACTCTX_SECTION_KEYED_DATA ReturnedData);
export extern(Windows) BOOL FindActCtxSectionStringW(DWORD dwFlags, const(GUID)* lpExtensionGuid, ULONG ulSectionId, LPCWSTR lpStringToFind, PACTCTX_SECTION_KEYED_DATA ReturnedData);
version(UNICODE)
	alias FindActCtxSectionStringW FindActCtxSectionString;
else
	alias FindActCtxSectionStringA FindActCtxSectionString;

export extern(Windows) BOOL FindActCtxSectionGuid(DWORD dwFlags, const(GUID)* lpExtensionGuid, ULONG ulSectionId, const(GUID)* lpGuidToFind, PACTCTX_SECTION_KEYED_DATA ReturnedData);

struct ACTIVATION_CONTEXT_BASIC_INFORMATION {
	HANDLE hActCtx;
	DWORD dwFlags;
}
alias ACTIVATION_CONTEXT_BASIC_INFORMATION* PACTIVATION_CONTEXT_BASIC_INFORMATION;
alias const(ACTIVATION_CONTEXT_BASIC_INFORMATION)* PCACTIVATION_CONTEXT_BASIC_INFORMATION;

enum {
	QUERY_ACTCTX_FLAG_USE_ACTIVE_ACTCTX = 0x00000004,
	QUERY_ACTCTX_FLAG_ACTCTX_IS_HMODULE = 0x00000008,
	QUERY_ACTCTX_FLAG_ACTCTX_IS_ADDRESS = 0x00000010,
	QUERY_ACTCTX_FLAG_NO_ADDREF         = 0x80000000,
}

export extern(Windows) BOOL QueryActCtxW(DWORD dwFlags, HANDLE hActCtx, PVOID pvSubInstance, ULONG ulInfoClass, PVOID pvBuffer, SIZE_T cbBuffer, SIZE_T* pcbWrittenOrRequired);
alias extern(Windows) BOOL function(DWORD dwFlags, HANDLE hActCtx, PVOID pvSubInstance, ULONG ulInfoClass, PVOID pvBuffer, SIZE_T cbBuffer, SIZE_T* pcbWrittenOrRequired) PQUERYACTCTXW_FUNC;

export extern(Windows) BOOL ProcessIdToSessionId(DWORD dwProcessId, DWORD* pSessionId);
static if(_WIN32_WINNT >= _WIN32_WINNT_WINXP){
	export extern(Windows) DWORD WTSGetActiveConsoleSessionId();
	export extern(Windows) BOOL IsWow64Process(HANDLE hProcess, PBOOL Wow64Process);
}
export extern(Windows) BOOL GetLogicalProcessorInformation(PSYSTEM_LOGICAL_PROCESSOR_INFORMATION Buffer, PDWORD ReturnedLength);
static if(_WIN32_WINNT >= _WIN32_WINNT_WIN7){
	export extern(Windows) BOOL GetLogicalProcessorInformationEx(LOGICAL_PROCESSOR_RELATIONSHIP RelationshipType, PSYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX Buffer, PDWORD ReturnedLength);
	export extern(Windows) WORD GetActiveProcessorGroupCount();
	export extern(Windows) WORD GetMaximumProcessorGroupCount();
	export extern(Windows) DWORD GetActiveProcessorCount(WORD GroupNumber);
	export extern(Windows) DWORD GetMaximumProcessorCount(WORD GroupNumber);
}
export extern(Windows) BOOL GetNumaHighestNodeNumber(PULONG HighestNodeNumber);
export extern(Windows) BOOL GetNumaProcessorNode(UCHAR Processor, PUCHAR NodeNumber);
static if(_WIN32_WINNT >= _WIN32_WINNT_WIN7)
	export extern(Windows) BOOL GetNumaNodeNumberFromHandle(HANDLE hFile, PUSHORT NodeNumber);
static if(_WIN32_WINNT >= _WIN32_WINNT_WIN7)
	export extern(Windows) BOOL GetNumaProcessorNodeEx(PPROCESSOR_NUMBER Processor, PUSHORT NodeNumber);
export extern(Windows) BOOL GetNumaNodeProcessorMask(UCHAR Node, PULONGLONG ProcessorMask);
static if(_WIN32_WINNT >= _WIN32_WINNT_WIN7)
	export extern(Windows) BOOL GetNumaNodeProcessorMaskEx(USHORT Node, PGROUP_AFFINITY ProcessorMask);
export extern(Windows) BOOL GetNumaAvailableMemoryNode(UCHAR Node, PULONGLONG AvailableBytes);
static if(_WIN32_WINNT >= _WIN32_WINNT_WIN7)
	export extern(Windows) BOOL GetNumaAvailableMemoryNodeEx(USHORT Node, PULONGLONG AvailableBytes);
static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	export extern(Windows) BOOL GetNumaProximityNode(ULONG ProximityId, PUCHAR NodeNumber);
static if(_WIN32_WINNT >= _WIN32_WINNT_WIN7)
	export extern(Windows) BOOL GetNumaProximityNodeEx(ULONG ProximityId, PUSHORT NodeNumber);
alias extern(Windows) DWORD function(PVOID pvParameter) APPLICATION_RECOVERY_CALLBACK;

enum {
	RESTART_MAX_CMD_LINE = 1024,
	RESTART_NO_CRASH     = 1,
	RESTART_NO_HANG      = 2,
	RESTART_NO_PATCH     = 4,
	RESTART_NO_REBOOT    = 8,
}
export extern(Windows) HRESULT RegisterApplicationRecoveryCallback(APPLICATION_RECOVERY_CALLBACK pRecoveyCallback, PVOID pvParameter, DWORD dwPingInterval, DWORD dwFlags);
export extern(Windows) HRESULT UnregisterApplicationRecoveryCallback();
export extern(Windows) HRESULT RegisterApplicationRestart(PCWSTR pwzCommandline, DWORD dwFlags);
export extern(Windows) HRESULT UnregisterApplicationRestart();
enum {
	RECOVERY_DEFAULT_PING_INTERVAL = 5000,
	RECOVERY_MAX_PING_INTERVAL     = 5 * 60 * 1000,
}
export extern(Windows) HRESULT GetApplicationRecoveryCallback(HANDLE hProcess, APPLICATION_RECOVERY_CALLBACK* pRecoveryCallback, PVOID* ppvParameter, PDWORD pdwPingInterval, PDWORD pdwFlags);
export extern(Windows) HRESULT GetApplicationRestartSettings(HANDLE hProcess, PWSTR pwzCommandline, PDWORD pcchSize, PDWORD pdwFlags);
export extern(Windows) HRESULT ApplicationRecoveryInProgress(PBOOL pbCancelled);
export extern(Windows) VOID ApplicationRecoveryFinished(BOOL bSuccess);

//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	enum {
		FileBasicInfo,
		FileStandardInfo,
		FileNameInfo,
		FileRenameInfo,
		FileDispositionInfo,
		FileAllocationInfo,
		FileEndOfFileInfo,
		FileStreamInfo,
		FileCompressionInfo,
		FileAttributeTagInfo,
		FileIdBothDirectoryInfo,
		FileIdBothDirectoryRestartInfo,
		FileIoPriorityHintInfo,
		FileRemoteProtocolInfo,
		MaximumFileInfoByHandleClass
	}
	alias int FILE_INFO_BY_HANDLE_CLASS;
	alias FILE_INFO_BY_HANDLE_CLASS* PFILE_INFO_BY_HANDLE_CLASS;

	struct FILE_BASIC_INFO {
		LARGE_INTEGER CreationTime;
		LARGE_INTEGER LastAccessTime;
		LARGE_INTEGER LastWriteTime;
		LARGE_INTEGER ChangeTime;
		DWORD FileAttributes;
	}
	alias FILE_BASIC_INFO* PFILE_BASIC_INFO;

	struct FILE_STANDARD_INFO {
		LARGE_INTEGER AllocationSize;
		LARGE_INTEGER EndOfFile;
		DWORD NumberOfLinks;
		BOOLEAN DeletePending;
		BOOLEAN Directory;
	}
	alias FILE_STANDARD_INFO* PFILE_STANDARD_INFO;

	struct FILE_NAME_INFO {
		DWORD FileNameLength;
		WCHAR[1] FileName;
	}
	alias FILE_NAME_INFO* PFILE_NAME_INFO;

	struct FILE_RENAME_INFO {
		BOOLEAN ReplaceIfExists;
		HANDLE RootDirectory;
		DWORD FileNameLength;
		WCHAR[1] FileName;
	}
	alias FILE_RENAME_INFO* PFILE_RENAME_INFO;

	struct FILE_ALLOCATION_INFO {
		LARGE_INTEGER AllocationSize;
	}
	alias FILE_ALLOCATION_INFO* PFILE_ALLOCATION_INFO;

	struct FILE_END_OF_FILE_INFO {
		LARGE_INTEGER EndOfFile;
	}
	alias FILE_END_OF_FILE_INFO* PFILE_END_OF_FILE_INFO;

	struct FILE_STREAM_INFO {
		DWORD NextEntryOffset;
		DWORD StreamNameLength;
		LARGE_INTEGER StreamSize;
		LARGE_INTEGER StreamAllocationSize;
		WCHAR[1] StreamName;
	}
	alias FILE_STREAM_INFO* PFILE_STREAM_INFO;

	struct FILE_COMPRESSION_INFO {
		LARGE_INTEGER CompressedFileSize;
		WORD CompressionFormat;
		UCHAR CompressionUnitShift;
		UCHAR ChunkShift;
		UCHAR ClusterShift;
		UCHAR[3] Reserved;
	}
	alias FILE_COMPRESSION_INFO* PFILE_COMPRESSION_INFO;

	struct FILE_ATTRIBUTE_TAG_INFO {
		DWORD FileAttributes;
		DWORD ReparseTag;
	}
	alias FILE_ATTRIBUTE_TAG_INFO* PFILE_ATTRIBUTE_TAG_INFO;

	struct FILE_DISPOSITION_INFO {
		BOOLEAN DeleteFile;
	}
	alias FILE_DISPOSITION_INFO* PFILE_DISPOSITION_INFO;

	struct FILE_ID_BOTH_DIR_INFO {
		DWORD NextEntryOffset;
		DWORD FileIndex;
		LARGE_INTEGER CreationTime;
		LARGE_INTEGER LastAccessTime;
		LARGE_INTEGER LastWriteTime;
		LARGE_INTEGER ChangeTime;
		LARGE_INTEGER EndOfFile;
		LARGE_INTEGER AllocationSize;
		DWORD FileAttributes;
		DWORD FileNameLength;
		DWORD EaSize;
		CCHAR ShortNameLength;
		WCHAR[12] ShortName;
		LARGE_INTEGER FileId;
		WCHAR[1] FileName;
	}
	alias FILE_ID_BOTH_DIR_INFO* PFILE_ID_BOTH_DIR_INFO;

	enum {
		IoPriorityHintVeryLow = 0,
		IoPriorityHintLow,
		IoPriorityHintNormal,
		MaximumIoPriorityHintType
	}
	alias int PRIORITY_HINT;

	struct FILE_IO_PRIORITY_HINT_INFO {
		PRIORITY_HINT PriorityHint;
	}
	alias FILE_IO_PRIORITY_HINT_INFO* PFILE_IO_PRIORITY_HINT_INFO;

	enum {
		REMOTE_PROTOCOL_INFO_FLAG_LOOPBACK = 0x00000001,
		REMOTE_PROTOCOL_INFO_FLAG_OFFLINE  = 0x00000002,
	}
	struct FILE_REMOTE_PROTOCOL_INFO {
		USHORT StructureVersion;
		USHORT StructureSize;
		DWORD Protocol;
		USHORT ProtocolMajorVersion;
		USHORT ProtocolMinorVersion;
		USHORT ProtocolRevision;
		USHORT Reserved;
		DWORD Flags;
		struct {
			DWORD[8] Reserved8;
		}
		struct {
			DWORD[16] Reserved16;
		}
	}
	alias FILE_REMOTE_PROTOCOL_INFO* PFILE_REMOTE_PROTOCOL_INFO;

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	export extern(Windows) BOOL SetFileInformationByHandle(HANDLE hFile, FILE_INFO_BY_HANDLE_CLASS FileInformationClass, LPVOID lpFileInformation, DWORD dwBufferSize);
	export extern(Windows) BOOL GetFileInformationByHandleEx(HANDLE hFile, FILE_INFO_BY_HANDLE_CLASS FileInformationClass, LPVOID lpFileInformation, DWORD dwBufferSize);
}

//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	enum {
		FileIdType,
		ObjectIdType,
		MaximumFileIdType
	}
	alias int FILE_ID_TYPE;
	alias FILE_ID_TYPE* PFILE_ID_TYPE;

	struct FILE_ID_DESCRIPTOR {
		DWORD dwSize;
		FILE_ID_TYPE Type;
		union {
			LARGE_INTEGER FileId;
			GUID ObjectId;
		}
	}
	alias FILE_ID_DESCRIPTOR* LPFILE_ID_DESCRIPTOR;

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	export extern(Windows) HANDLE OpenFileById(HANDLE hVolumeHint, LPFILE_ID_DESCRIPTOR lpFileId, DWORD dwDesiredAccess, DWORD dwShareMode, LPSECURITY_ATTRIBUTES lpSecurityAttributes, DWORD dwFlagsAndAttributes);

//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	enum SYMBOLIC_LINK_FLAG_DIRECTORY = 0x1;
	enum VALID_SYMBOLIC_LINK_FLAGS = SYMBOLIC_LINK_FLAG_DIRECTORY;

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	export extern(Windows) BOOLEAN CreateSymbolicLinkA(LPCSTR lpSymlinkFileName, LPCSTR lpTargetFileName, DWORD dwFlags);
	export extern(Windows) BOOLEAN CreateSymbolicLinkW(LPCWSTR lpSymlinkFileName, LPCWSTR lpTargetFileName, DWORD dwFlags);
	version(UNICODE)
		alias CreateSymbolicLinkW CreateSymbolicLink;
	else
		alias CreateSymbolicLinkA CreateSymbolicLink;

	export extern(Windows) BOOLEAN CreateSymbolicLinkTransactedA(LPCSTR lpSymlinkFileName, LPCSTR lpTargetFileName, DWORD dwFlags, HANDLE hTransaction);
	export extern(Windows) BOOLEAN CreateSymbolicLinkTransactedW(LPCWSTR lpSymlinkFileName, LPCWSTR lpTargetFileName, DWORD dwFlags, HANDLE hTransaction);
	version(UNICODE)
		alias CreateSymbolicLinkTransactedW CreateSymbolicLinkTransacted;
	else
		alias CreateSymbolicLinkTransactedA CreateSymbolicLinkTransacted;

	export extern(Windows) DWORD GetFinalPathNameByHandleA(HANDLE hFile, LPSTR lpszFilePath, DWORD cchFilePath, DWORD dwFlags);
	export extern(Windows) DWORD GetFinalPathNameByHandleW(HANDLE hFile, LPWSTR lpszFilePath, DWORD cchFilePath, DWORD dwFlags);
	version(UNICODE)
		alias GetFinalPathNameByHandleW GetFinalPathNameByHandle;
	else
		alias GetFinalPathNameByHandleA GetFinalPathNameByHandle;
}

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	export extern(Windows) BOOL QueryActCtxSettingsW(DWORD dwFlags, HANDLE hActCtx, PCWSTR settingsNameSpace, PCWSTR settingName, PWSTR pvBuffer, SIZE_T dwBuffer, SIZE_T* pdwWrittenOrRequired);

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
	export extern(Windows) BOOL ReplacePartitionUnit(PWSTR TargetPartition, PWSTR SparePartition, ULONG Flags);

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	export extern(Windows) BOOL AddSecureMemoryCacheCallback(PSECURE_MEMORY_CACHE_CALLBACK pfnCallBack);
	export extern(Windows) BOOL RemoveSecureMemoryCacheCallback(PSECURE_MEMORY_CACHE_CALLBACK pfnCallBack);
}

static if(_WIN32_WINNT >= _WIN32_WINNT_WIN7){
	export extern(Windows) BOOL CopyExtendedContext(PCONTEXT_EX Destination, DWORD ContextFlags, PCONTEXT_EX Source);
	export extern(Windows) BOOL InitializeExtendedContext(PVOID Context, DWORD ContextFlags, PCONTEXT_EX* ContextEx);
	export extern(Windows) DWORD64 GetEnabledExtendedFeatures(DWORD64 FeatureMask);
	export extern(Windows) BOOL GetExtendedContextLength(DWORD ContextFlags, PDWORD ContextLength);
	export extern(Windows) DWORD64 GetExtendedFeaturesMask(PCONTEXT_EX ContextEx);
	export extern(Windows) PVOID LocateExtendedFeature(PCONTEXT_EX ContextEx, DWORD FeatureId, PDWORD Length);
	export extern(Windows) PCONTEXT LocateLegacyContext(PCONTEXT_EX ContextEx, PDWORD Length);
	export extern(Windows) VOID SetExtendedFeaturesMask(PCONTEXT_EX ContextEx ,DWORD64 FeatureMask);
	export extern(Windows) DWORD EnableThreadProfiling(HANDLE ThreadHandle, DWORD Flags, DWORD64 HardwareCounters, HANDLE* PerformanceDataHandle);
	export extern(Windows) DWORD DisableThreadProfiling(HANDLE PerformanceDataHandle);
	export extern(Windows) DWORD QueryThreadProfiling(HANDLE ThreadHandle, PBOOLEAN Enabled);
	export extern(Windows) DWORD ReadThreadProfilingData(HANDLE PerformanceDataHandle, DWORD Flags, PPERFORMANCE_DATA PerformanceData);
}

} // extern(C)
