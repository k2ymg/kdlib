/** basetsd.d

Convert from 'basetsd.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.basetsd;


import c.windows.sdkddkver;
import c.windows.windef;


version(Win64){

	enum ADDRESS_TAG_BIT = 0x40000000000UL;

	alias long       SHANDLE_PTR;
	alias ulong      HANDLE_PTR;
	alias uint       UHALF_PTR;
	alias UHALF_PTR* PUHALF_PTR;
	alias int        HALF_PTR;
	alias HALF_PTR*  PHALF_PTR;

	pure nothrow
	uint HandleToULong(const(void)* h)
	{
		return cast(uint)cast(ULONG_PTR)h;
	}

	pure nothrow
	int HandleToLong(const(void)* h)
	{
		return cast(int)cast(LONG_PTR)h;
	}

	pure nothrow
	HANDLE ULongToHandle(uint h)
	{
		return cast(HANDLE)cast(UINT_PTR)h;
	}

	pure nothrow
	HANDLE LongToHandle(int h)
	{
		return cast(HANDLE)cast(INT_PTR)h;
	}

	pure nothrow
	uint PtrToUlong(const(void)* p)
	{
		return cast(uint)cast(ULONG_PTR)p;
	}

	pure nothrow
	uint PtrToUint(const(void)* p)
	{
		return cast(uint)cast(UINT_PTR)p;
	}

	pure nothrow
	ushort PtrToUshort(const(void)* p)
	{
		return cast(ushort)cast(uint)cast(ULONG_PTR)p;
	}

	pure nothrow
	int PtrToLong(const(void*)p)
	{
		return cast(int)cast(LONG_PTR)p;
	}

	pure nothrow
	int PtrToInt(const(void)* p)
	{
		return cast(int)cast(INT_PTR)p;
	}

	pure nothrow
	short PtrToShort(const(void)* p)
	{
		return cast(short)cast(long)cast(LONG_PTR)p;
	}

	pure nothrow
	void* IntToPtr(int i)
	{
		return cast(void*)cast(INT_PTR)i;
	}

	pure nothrow
	void* UIntToPtr(uint ui)
	{
		return cast(void*)cast(UINT_PTR)ui;
	}

	pure nothrow
	void* LongToPtr(int l)
	{
		return cast(void*)cast(LONG_PTR)l;
	}

	pure nothrow
	void* ULongToPtr(uint ul)
	{
		return cast(void*)cast(ULONG_PTR)ul;
	}

	pure nothrow
	void* PtrToPtr64(const(void)* p)
	{
		return cast(void*)p;
	}

	pure nothrow
	void* Ptr64ToPtr(const(void)* p )
	{
		return cast(void*)p;
	}

	alias PtrToPtr64 HandleToHandle64;
	alias Ptr64ToPtr Handle64ToHandle;

	pure nothrow
	void* Ptr32ToPtr(const(void)* p)
	{
		return cast(void*)cast(ULONG_PTR)cast(uint)p;
	}

	pure nothrow
	void* Handle32ToHandle(const(void)* h)
	{
		return cast(void*)cast(LONG_PTR)cast(int)h;
	}

	pure nothrow
	void* PtrToPtr32(const(void)* p)
	{
		return cast(void*)cast(uint)cast(ULONG_PTR)p;
	}

	alias PtrToPtr32 HandleToHandle32;


}else{

	enum ADDRESS_TAG_BIT = 0x80000000U;

	alias ushort UHALF_PTR;
	alias UHALF_PTR* PUHALF_PTR;
	alias short HALF_PTR;
	alias HALF_PTR* PHALF_PTR;
	alias int SHANDLE_PTR;
	alias uint HANDLE_PTR;

	pure nothrow
	ULONG HandleToULong(HANDLE h)
	{
		return cast(ULONG)cast(ULONG_PTR)h;
	}

	pure nothrow
	LONG HandleToLong(HANDLE h)
	{
		return cast(LONG)cast(LONG_PTR)h;
	}

	pure nothrow
	HANDLE ULongToHandle(ULONG ul)
	{
		return cast(HANDLE)cast(ULONG_PTR)ul;
	}

	pure nothrow
	HANDLE LongToHandle(LONG h)
	{
		return cast(HANDLE)cast(LONG_PTR)h;
	}

	pure nothrow
	ULONG PtrToUlong(const(void)* p)
	{
		return cast(ULONG)cast(ULONG_PTR)p;
	}

	pure nothrow
	LONG PtrToLong(const(void)* p)
	{
		return cast(LONG)cast(LONG_PTR)p;
	}

	pure nothrow
	UINT PtrToUint(const(void)* p)
	{
		return cast(UINT)cast(UINT_PTR)p;
	}

	pure nothrow
	INT PtrToInt(const(void)* p)
	{
		return cast(INT)cast(INT_PTR)p;
	}

	pure nothrow
	ushort PtrToUshort(const(void)* p)
	{
		return cast(ushort)cast(ULONG_PTR)p;
	}

	pure nothrow
	short PtrToShort(const(void)* p)
	{
		return cast(short)cast(LONG_PTR)p;
	}

	pure nothrow
	void* IntToPtr(int i)
	{
		return cast(VOID*)cast(INT_PTR)cast(int)i;
	}

	pure nothrow
	void* UIntToPtr(uint ui)
	{
		return cast(VOID*)cast(UINT_PTR)ui;
	}

	pure nothrow
	void* LongToPtr(int l)
	{
		return cast(VOID*)cast(LONG_PTR)cast(int)l;
	}

	pure nothrow
	void* ULongToPtr(uint ul)
	{
		return cast(VOID*)cast(ULONG_PTR)cast(uint)ul;
	}

	pure nothrow
	void* PtrToPtr64(const(void)* p)
	{
		return cast(void*)cast(ulong)cast(ULONG_PTR)p;
	}

	pure nothrow
	void* Ptr64ToPtr(const(void)* p)
	{
		return cast(void*)cast(ULONG_PTR)cast(ulong)p;
	}

	pure nothrow
	void* HandleToHandle64(const(void)* h)
	{
		return cast(void*)cast(long)cast(LONG_PTR)h;
	}

	pure nothrow
	void* Handle64ToHandle(const(void)* h)
	{
		return cast(void*)cast(ULONG_PTR)cast(ulong)h;
	}

	pure nothrow
	void* Ptr32ToPtr(void* p)
	{
		return cast(void*)p;
	}

	pure nothrow
	void* Handle32ToHandle(const(void)* h)
	{
		return Ptr32ToPtr(cast(void*)h);
	}

	pure nothrow
	void* PtrToPtr32(void* p)
	{
		return cast(void*)p;
	}

	pure nothrow
	void* HandleToHandle32(const(void)* h)
	{
		return PtrToPtr32(cast(void*)h);
	}
}

pure nothrow
ULONG HandleToUlong(const(void)* h)
{
	return HandleToULong(cast(HANDLE)h);
}

pure nothrow
HANDLE UlongToHandle(ULONG ul)
{
	return ULongToHandle(ul);
}

pure nothrow
void* UlongToPtr(ULONG ul)
{
	return ULongToPtr(ul);
}

pure nothrow
void* UintToPtr(UINT ui)
{
	return UIntToPtr(ui);
}

enum MAXUINT_PTR = ~(cast(UINT_PTR)0);
enum MAXINT_PTR  = cast(INT_PTR)(MAXUINT_PTR >> 1);
enum MININT_PTR  = ~MAXINT_PTR;

enum MAXULONG_PTR = ~(cast(ULONG_PTR)0);
enum MAXLONG_PTR  = cast(LONG_PTR)(MAXULONG_PTR >> 1);
enum MINLONG_PTR  = ~MAXLONG_PTR;

enum MAXUHALF_PTR = cast(UHALF_PTR)~0;
enum MAXHALF_PTR  = cast(HALF_PTR)(MAXUHALF_PTR >> 1);
enum MINHALF_PTR  = ~MAXHALF_PTR;

//(_WIN32_WINNT >= 0x0600)
	enum MAXUINT8   = (cast(UINT8)~(cast(UINT8)0));
	enum MAXINT8    = (cast(INT8)(MAXUINT8 >> 1));
	enum MININT8    = (cast(INT8)~MAXINT8);

	enum MAXUINT16  = (cast(UINT16)~(cast(UINT16)0));
	enum MAXINT16   = (cast(INT16)(MAXUINT16 >> 1));
	enum MININT16   = (cast(INT16)~MAXINT16);

	enum MAXUINT32  = (cast(UINT32)~(cast(UINT32)0));
	enum MAXINT32   = (cast(INT32)(MAXUINT32 >> 1));
	enum MININT32   = (cast(INT32)~MAXINT32);

	enum MAXUINT64  = (cast(UINT64)~(cast(UINT64)0));
	enum MAXINT64   = (cast(INT64)(MAXUINT64 >> 1));
	enum MININT64   = (cast(INT64)~MAXINT64);

	enum MAXULONG32 = (cast(ULONG32)~(cast(ULONG32)0));
	enum MAXLONG32  = (cast(LONG32)(MAXULONG32 >> 1));
	enum MINLONG32  = (cast(LONG32)~MAXLONG32);

	enum MAXULONG64  =(cast(ULONG64)~(cast(ULONG64)0));
	enum MAXLONG64   =(cast(LONG64)(MAXULONG64 >> 1));
	enum MINLONG64   =(cast(LONG64)~MAXLONG64);

	enum MAXULONGLONG =(cast(ULONGLONG)~(cast(ULONGLONG)0));
	enum MINLONGLONG =(cast(LONGLONG)~MAXLONGLONG);

	enum MAXSIZE_T  = (cast(SIZE_T)~(cast(SIZE_T)0));
	enum MAXSSIZE_T = (cast(SSIZE_T)(MAXSIZE_T >> 1));
	enum MINSSIZE_T = (cast(SSIZE_T)~MAXSSIZE_T);

	enum MAXUINT    = (cast(UINT)~(cast(UINT)0));
	enum MAXINT     = (cast(INT)(MAXUINT >> 1));
	enum MININT     = (cast(INT)~MAXINT);

	enum MAXDWORD32 = (cast(DWORD32)~(cast(DWORD32)0));
	enum MAXDWORD64 = (cast(DWORD64)~(cast(DWORD64)0));
