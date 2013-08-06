/** winternl.d

Converted from 'winternl.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.winternl;


import c.windows.sdkddkver;
import c.windows.windef;


extern(C){

alias LONG NTSTATUS;

alias const(char)* PCSZ;

struct STRING {
	USHORT Length;
	USHORT MaximumLength;
	PCHAR Buffer;
}
alias STRING* PSTRING;

alias STRING ANSI_STRING;
alias PSTRING PANSI_STRING;
alias PSTRING PCANSI_STRING;

alias STRING OEM_STRING;
alias PSTRING POEM_STRING;
alias const(STRING)* PCOEM_STRING;

struct UNICODE_STRING {
	USHORT Length;
	USHORT MaximumLength;
	PWSTR  Buffer;
}
alias UNICODE_STRING* PUNICODE_STRING;
alias const(UNICODE_STRING)* PCUNICODE_STRING;

struct PEB_LDR_DATA {
	BYTE[8] Reserved1;
	PVOID[3] Reserved2;
	LIST_ENTRY InMemoryOrderModuleList;
}
alias PEB_LDR_DATA* PPEB_LDR_DATA;

struct LDR_DATA_TABLE_ENTRY {
	PVOID[2] Reserved1;
	LIST_ENTRY InMemoryOrderLinks;
	PVOID[2] Reserved2;
	PVOID DllBase;
	PVOID[2] Reserved3;
	UNICODE_STRING FullDllName;
	BYTE[8] Reserved4;
	PVOID[3] Reserved5;
	union {
		ULONG CheckSum;
		PVOID Reserved6;
	}
	ULONG TimeDateStamp;
}
alias LDR_DATA_TABLE_ENTRY* PLDR_DATA_TABLE_ENTRY;

struct RTL_USER_PROCESS_PARAMETERS {
	BYTE[16] Reserved1;
	PVOID[10] Reserved2;
	UNICODE_STRING ImagePathName;
	UNICODE_STRING CommandLine;
}
alias RTL_USER_PROCESS_PARAMETERS* PRTL_USER_PROCESS_PARAMETERS;

alias extern(Windows) VOID function() PPS_POST_PROCESS_INIT_ROUTINE;

struct PEB {
	BYTE[2] Reserved1;
	BYTE BeingDebugged;
	BYTE[1] Reserved2;
	PVOID[2] Reserved3;
	PPEB_LDR_DATA Ldr;
	PRTL_USER_PROCESS_PARAMETERS ProcessParameters;
	BYTE[104] Reserved4;
	PVOID[52] Reserved5;
	PPS_POST_PROCESS_INIT_ROUTINE PostProcessInitRoutine;
	BYTE[128] Reserved6;
	PVOID[1] Reserved7;
	ULONG SessionId;
}
alias PEB* PPEB;

struct TEB {
	BYTE[1952] Reserved1;
	PVOID[412] Reserved2;
	PVOID[64] TlsSlots;
	BYTE[8] Reserved3;
	PVOID[26] Reserved4;
	PVOID ReservedForOle;
	PVOID[4] Reserved5;
	PVOID TlsExpansionSlots;
}
alias TEB* PTEB;

struct OBJECT_ATTRIBUTES {
	ULONG Length;
	HANDLE RootDirectory;
	PUNICODE_STRING ObjectName;
	ULONG Attributes;
	PVOID SecurityDescriptor;
	PVOID SecurityQualityOfService;
}
alias OBJECT_ATTRIBUTES* POBJECT_ATTRIBUTES;

struct IO_STATUS_BLOCK {
	union {
		NTSTATUS Status;
		PVOID Pointer;
	}
	ULONG_PTR Information;
}
alias IO_STATUS_BLOCK* PIO_STATUS_BLOCK;

alias extern(Windows) VOID function(PVOID ApcContext, PIO_STATUS_BLOCK IoStatusBlock, ULONG Reserved) PIO_APC_ROUTINE;

struct PROCESS_BASIC_INFORMATION {
	PVOID Reserved1;
	PPEB PebBaseAddress;
	PVOID[2] Reserved2;
	ULONG_PTR UniqueProcessId;
	PVOID Reserved3;
}
alias PROCESS_BASIC_INFORMATION* PPROCESS_BASIC_INFORMATION;

struct SYSTEM_PROCESSOR_PERFORMANCE_INFORMATION {
	LARGE_INTEGER IdleTime;
	LARGE_INTEGER KernelTime;
	LARGE_INTEGER UserTime;
	LARGE_INTEGER[2] Reserved1;
	ULONG Reserved2;
}
alias SYSTEM_PROCESSOR_PERFORMANCE_INFORMATION* PSYSTEM_PROCESSOR_PERFORMANCE_INFORMATION;

struct SYSTEM_PROCESS_INFORMATION {
	ULONG NextEntryOffset;
	BYTE[52] Reserved1;
	PVOID[3] Reserved2;
	HANDLE UniqueProcessId;
	PVOID Reserved3;
	ULONG HandleCount;
	BYTE[4] Reserved4;
	PVOID[11] Reserved5;
	SIZE_T PeakPagefileUsage;
	SIZE_T PrivatePageCount;
	LARGE_INTEGER[6] Reserved6;
}
alias SYSTEM_PROCESS_INFORMATION* PSYSTEM_PROCESS_INFORMATION;

struct SYSTEM_REGISTRY_QUOTA_INFORMATION {
	ULONG RegistryQuotaAllowed;
	ULONG RegistryQuotaUsed;
	PVOID Reserved1;
}
alias SYSTEM_REGISTRY_QUOTA_INFORMATION* PSYSTEM_REGISTRY_QUOTA_INFORMATION;

struct SYSTEM_BASIC_INFORMATION {
	BYTE[24] Reserved1;
	PVOID[4] Reserved2;
	CCHAR NumberOfProcessors;
}
alias SYSTEM_BASIC_INFORMATION* PSYSTEM_BASIC_INFORMATION;

struct SYSTEM_TIMEOFDAY_INFORMATION {
	BYTE[48] Reserved1;
}
alias SYSTEM_TIMEOFDAY_INFORMATION* PSYSTEM_TIMEOFDAY_INFORMATION;

struct SYSTEM_PERFORMANCE_INFORMATION {
	BYTE[312] Reserved1;
}
alias SYSTEM_PERFORMANCE_INFORMATION* PSYSTEM_PERFORMANCE_INFORMATION;

struct SYSTEM_EXCEPTION_INFORMATION {
	BYTE[16] Reserved1;
}
alias SYSTEM_EXCEPTION_INFORMATION* PSYSTEM_EXCEPTION_INFORMATION;

struct SYSTEM_LOOKASIDE_INFORMATION {
	BYTE[32] Reserved1;
}
alias SYSTEM_LOOKASIDE_INFORMATION* PSYSTEM_LOOKASIDE_INFORMATION;

struct SYSTEM_INTERRUPT_INFORMATION {
	BYTE[24] Reserved1;
}
alias SYSTEM_INTERRUPT_INFORMATION* PSYSTEM_INTERRUPT_INFORMATION;

enum {
	FileDirectoryInformation = 1
}
alias int FILE_INFORMATION_CLASS;

enum {
	ProcessBasicInformation = 0,
	ProcessWow64Information = 26
}
alias int PROCESSINFOCLASS;

enum {
	ThreadIsIoPending = 16
}
alias int THREADINFOCLASS;

enum {
	SystemBasicInformation                = 0,
	SystemPerformanceInformation          = 2,
	SystemTimeOfDayInformation            = 3,
	SystemProcessInformation              = 5,
	SystemProcessorPerformanceInformation = 8,
	SystemInterruptInformation            = 23,
	SystemExceptionInformation            = 33,
	SystemRegistryQuotaInformation        = 37,
	SystemLookasideInformation            = 45
}
alias int SYSTEM_INFORMATION_CLASS;

enum {
	ObjectBasicInformation = 0,
	ObjectTypeInformation  = 2
}
alias int OBJECT_INFORMATION_CLASS;

struct PUBLIC_OBJECT_BASIC_INFORMATION {
	ULONG Attributes;
	ACCESS_MASK GrantedAccess;
	ULONG HandleCount;
	ULONG PointerCount;
	ULONG[10] Reserved;
}
alias PUBLIC_OBJECT_BASIC_INFORMATION* PPUBLIC_OBJECT_BASIC_INFORMATION;

struct PUBLIC_OBJECT_TYPE_INFORMATION {
	UNICODE_STRING TypeName;
	ULONG[22] Reserved;
}
alias PUBLIC_OBJECT_TYPE_INFORMATION* PPUBLIC_OBJECT_TYPE_INFORMATION;

//(_WIN32_WINNT >= _WIN32_WINNT_WINXP)
	ULONG INTERNAL_TS_ACTIVE_CONSOLE_ID()
	{
		return *(cast(ULONG*)0x7ffe02d8);
	}

export extern(Windows){
NTSTATUS NtClose(HANDLE Handle);
NTSTATUS NtCreateFile(PHANDLE FileHandle, ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes, PIO_STATUS_BLOCK IoStatusBlock, PLARGE_INTEGER AllocationSize, ULONG FileAttributes, ULONG ShareAccess, ULONG CreateDisposition, ULONG CreateOptions, PVOID EaBuffer, ULONG EaLength);
NTSTATUS NtOpenFile(PHANDLE FileHandle, ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes, PIO_STATUS_BLOCK IoStatusBlock, ULONG ShareAccess, ULONG OpenOptions);
NTSTATUS NtDeviceIoControlFile(HANDLE FileHandle, HANDLE Event, PIO_APC_ROUTINE ApcRoutine, PVOID ApcContext, PIO_STATUS_BLOCK IoStatusBlock, ULONG IoControlCode, PVOID InputBuffer, ULONG InputBufferLength, PVOID OutputBuffer, ULONG OutputBufferLength);
NTSTATUS NtWaitForSingleObject(HANDLE Handle, BOOLEAN Alertable, PLARGE_INTEGER Timeout);
BOOLEAN RtlIsNameLegalDOS8Dot3(PUNICODE_STRING Name, POEM_STRING OemName, PBOOLEAN NameContainsSpaces);
ULONG RtlNtStatusToDosError(NTSTATUS Status);
NTSTATUS NtQueryInformationProcess(HANDLE ProcessHandle, PROCESSINFOCLASS ProcessInformationClass, PVOID ProcessInformation, ULONG ProcessInformationLength, PULONG ReturnLength);
NTSTATUS NtQueryInformationThread(HANDLE ThreadHandle, THREADINFOCLASS ThreadInformationClass, PVOID ThreadInformation, ULONG ThreadInformationLength, PULONG ReturnLength);
NTSTATUS NtQueryObject(HANDLE Handle, OBJECT_INFORMATION_CLASS ObjectInformationClass, PVOID ObjectInformation, ULONG ObjectInformationLength, PULONG ReturnLength);
NTSTATUS NtQuerySystemInformation(SYSTEM_INFORMATION_CLASS SystemInformationClass, PVOID SystemInformation, ULONG SystemInformationLength, PULONG ReturnLength);
NTSTATUS NtQuerySystemTime(PLARGE_INTEGER SystemTime);
NTSTATUS RtlLocalTimeToSystemTime(PLARGE_INTEGER LocalTime, PLARGE_INTEGER SystemTime);
BOOLEAN RtlTimeToSecondsSince1970(PLARGE_INTEGER Time, PULONG ElapsedSeconds);
VOID RtlFreeAnsiString(PANSI_STRING AnsiString);
VOID RtlFreeUnicodeString(PUNICODE_STRING UnicodeString);
VOID RtlFreeOemString(POEM_STRING OemString);
VOID RtlInitString(PSTRING DestinationString, PCSZ SourceString);
VOID RtlInitAnsiString(PANSI_STRING DestinationString, PCSZ SourceString);
VOID RtlInitUnicodeString(PUNICODE_STRING DestinationString, PCWSTR SourceString);
NTSTATUS RtlAnsiStringToUnicodeString(PUNICODE_STRING DestinationString, PCANSI_STRING SourceString, BOOLEAN AllocateDestinationString);
NTSTATUS RtlUnicodeStringToAnsiString(PANSI_STRING DestinationString, PCUNICODE_STRING SourceString, BOOLEAN AllocateDestinationString);
NTSTATUS RtlUnicodeStringToOemString(POEM_STRING DestinationString, PCUNICODE_STRING SourceString, BOOLEAN AllocateDestinationString);
NTSTATUS RtlUnicodeToMultiByteSize(PULONG BytesInMultiByteString, PWCH UnicodeString, ULONG BytesInUnicodeString);
NTSTATUS RtlCharToInteger(PCSZ String, ULONG Base, PULONG Value);
NTSTATUS RtlConvertSidToUnicodeString(PUNICODE_STRING UnicodeString, PSID Sid, BOOLEAN AllocateDestinationString);
ULONG RtlUniform(PULONG Seed);
} // extern

enum LOGONID_CURRENT = cast(ULONG)-1;
const HANDLE SERVERNAME_CURRENT = cast(HANDLE)null;

enum {
	WinStationInformation = 8
}
alias int WINSTATIONINFOCLASS;

struct WINSTATIONINFORMATIONW {
	BYTE[70] Reserved2;
	ULONG LogonId;
	BYTE[1140] Reserved3;
}
alias WINSTATIONINFORMATIONW* PWINSTATIONINFORMATIONW;

alias extern(Windows) BOOLEAN function(HANDLE, ULONG, WINSTATIONINFOCLASS, PVOID, ULONG, PULONG) PWINSTATIONQUERYINFORMATIONW;

pure nothrow
bool NT_SUCCESS(NTSTATUS Status)
{
	return Status >= 0;
}

pure nothrow
bool NT_INFORMATION(NTSTATUS Status)
{
	return ((cast(ULONG)Status) >> 30) == 1;
}

pure nothrow
bool NT_WARNING(NTSTATUS Status)
{
	return ((cast(ULONG)Status) >> 30) == 2;
}

pure nothrow
bool NT_ERROR(NTSTATUS Status)
{
	return ((cast(ULONG)Status) >> 30) == 3;
}

/*template InitializeObjectAttributes(alias p, n, a, r, s )
{
	p.Length = OBJECT_ATTRIBUTES.sizeof;
	p.RootDirectory = r;
	p.Attributes = a;
	p.ObjectName = n;
	p.SecurityDescriptor = s;
	p.SecurityQualityOfService = NULL;
}*/

enum {
	OBJ_INHERIT            = 0x00000002,
	OBJ_PERMANENT          = 0x00000010,
	OBJ_EXCLUSIVE          = 0x00000020,
	OBJ_CASE_INSENSITIVE   = 0x00000040,
	OBJ_OPENIF             = 0x00000080,
	OBJ_OPENLINK           = 0x00000100,
	OBJ_KERNEL_HANDLE      = 0x00000200,
	OBJ_FORCE_ACCESS_CHECK = 0x00000400,
	OBJ_VALID_ATTRIBUTES   = 0x000007F2,
}

enum {
	FILE_SUPERSEDE           = 0x00000000,
	FILE_OPEN                = 0x00000001,
	FILE_CREATE              = 0x00000002,
	FILE_OPEN_IF             = 0x00000003,
	FILE_OVERWRITE           = 0x00000004,
	FILE_OVERWRITE_IF        = 0x00000005,
	FILE_MAXIMUM_DISPOSITION = 0x00000005,
}

enum {
	FILE_DIRECTORY_FILE              = 0x00000001,
	FILE_WRITE_THROUGH               = 0x00000002,
	FILE_SEQUENTIAL_ONLY             = 0x00000004,
	FILE_NO_INTERMEDIATE_BUFFERING   = 0x00000008,
	FILE_SYNCHRONOUS_IO_ALERT        = 0x00000010,
	FILE_SYNCHRONOUS_IO_NONALERT     = 0x00000020,
	FILE_NON_DIRECTORY_FILE          = 0x00000040,
	FILE_CREATE_TREE_CONNECTION      = 0x00000080,
	FILE_COMPLETE_IF_OPLOCKED        = 0x00000100,
	FILE_NO_EA_KNOWLEDGE             = 0x00000200,
	FILE_OPEN_REMOTE_INSTANCE        = 0x00000400,
	FILE_RANDOM_ACCESS               = 0x00000800,
	FILE_DELETE_ON_CLOSE             = 0x00001000,
	FILE_OPEN_BY_FILE_ID             = 0x00002000,
	FILE_OPEN_FOR_BACKUP_INTENT      = 0x00004000,
	FILE_NO_COMPRESSION              = 0x00008000,
	FILE_RESERVE_OPFILTER            = 0x00100000,
	FILE_OPEN_REPARSE_POINT          = 0x00200000,
	FILE_OPEN_NO_RECALL              = 0x00400000,
	FILE_OPEN_FOR_FREE_SPACE_QUERY   = 0x00800000,
	FILE_VALID_OPTION_FLAGS          = 0x00ffffff,
	FILE_VALID_PIPE_OPTION_FLAGS     = 0x00000032,
	FILE_VALID_MAILSLOT_OPTION_FLAGS = 0x00000032,
	FILE_VALID_SET_FLAGS             = 0x00000036,
	//(_WIN32_WINNT >= _WIN32_WINNT_WIN7){
		FILE_OPEN_REQUIRING_OPLOCK  = 0x00010000,
}

enum {
	FILE_SUPERSEDED     = 0x00000000,
	FILE_OPENED         = 0x00000001,
	FILE_CREATED        = 0x00000002,
	FILE_OVERWRITTEN    = 0x00000003,
	FILE_EXISTS         = 0x00000004,
	FILE_DOES_NOT_EXIST = 0x00000005,
}

} // extern(C)
