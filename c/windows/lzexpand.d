/** lzexpand.d

Converted from 'lzexpand.h'.

Version: V7.1
Authors: Koji Kishita
*/
module c.windows.lzexpand;


import c.windows.windef;
import c.windows.winbase;


extern(C){

enum {
	LZERROR_BADINHANDLE  = -1,
	LZERROR_BADOUTHANDLE = -2,
	LZERROR_READ         = -3,
	LZERROR_WRITE        = -4,
	LZERROR_GLOBALLOC    = -5,
	LZERROR_GLOBLOCK     = -6,
	LZERROR_BADVALUE     = -7,
	LZERROR_UNKNOWNALG   = -8,
}

export extern(Windows){
	INT LZStart();
	VOID LZDone();
	LONG CopyLZFile(INT hfSource, INT hfDest);
	LONG LZCopy(INT hfSource, INT hfDest);
	INT LZInit(INT hfSource);
	INT GetExpandedNameA(LPSTR lpszSource, LPSTR lpszBuffer);
	INT GetExpandedNameW(LPWSTR lpszSource, LPWSTR lpszBuffer);
}
version(UNICODE)
	alias GetExpandedNameW GetExpandedName;
else
	alias GetExpandedNameA GetExpandedName;

export extern(Windows){
	INT LZOpenFileA(LPSTR lpFileName, LPOFSTRUCT lpReOpenBuf, WORD wStyle);
	INT LZOpenFileW(LPWSTR lpFileName, LPOFSTRUCT lpReOpenBuf, WORD wStyle);
}
version(UNICODE)
	alias LZOpenFileW LZOpenFile;
else
	alias LZOpenFileA LZOpenFile;

export extern(Windows){
	LONG LZSeek(INT hFile, LONG lOffset, INT iOrigin);
	INT LZRead(INT hFile, CHAR* lpBuffer, INT cbRead);
	VOID LZClose(INT hFile);
}

}// extern(C)
