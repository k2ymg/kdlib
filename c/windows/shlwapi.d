/** shlwapi.d

Converted from 'shlwapi.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.shlwapi;


import c.windows.sdkddkver;
import c.windows.windef;
import c.windows.shtypes;
import c.windows.wtypes;
import c.windows.winreg;
import c.windows.winbase;
import c.windows.guiddef;
import c.windows.unknwn;
import c.windows.objidl;
import c.windows.ocidl;
import c.windows.winerror;
import std.c.stdarg;


align(8):

extern(C){

export extern(Windows) LPSTR StrChrA(LPCSTR lpStart, WORD wMatch);
export extern(Windows) LPWSTR StrChrW(LPCWSTR lpStart, WCHAR wMatch);
export extern(Windows) LPSTR StrChrIA(LPCSTR lpStart, WORD wMatch);
export extern(Windows) LPWSTR StrChrIW(LPCWSTR lpStart, WCHAR wMatch);
export extern(Windows) LPWSTR StrChrNW(LPCWSTR lpStart, WCHAR wMatch, UINT cchMax);
export extern(Windows) LPWSTR StrChrNIW(LPCWSTR lpStart, WCHAR wMatch, UINT cchMax);
export extern(Windows) int StrCmpNA(LPCSTR lpStr1, LPCSTR lpStr2, int nChar);
export extern(Windows) int StrCmpNW(LPCWSTR lpStr1, LPCWSTR lpStr2, int nChar);
export extern(Windows) int StrCmpNIA(LPCSTR lpStr1, LPCSTR lpStr2, int nChar);
export extern(Windows) int StrCmpNIW(LPCWSTR lpStr1, LPCWSTR lpStr2, int nChar);
export extern(Windows) int StrCSpnA(LPCSTR lpStr, LPCSTR lpSet);
export extern(Windows) int StrCSpnW(LPCWSTR lpStr, LPCWSTR lpSet);
export extern(Windows) int StrCSpnIA(LPCSTR lpStr, LPCSTR lpSet);
export extern(Windows) int StrCSpnIW(LPCWSTR lpStr, LPCWSTR lpSet);
export extern(Windows) LPSTR StrDupA(LPCSTR lpSrch);
export extern(Windows) LPWSTR StrDupW(LPCWSTR lpSrch);

enum {
	SFBS_FLAGS_ROUND_TO_NEAREST_DISPLAYED_DIGIT    = 0x0001,
	SFBS_FLAGS_TRUNCATE_UNDISPLAYED_DECIMAL_DIGITS = 0x0002,
}
alias int SFBS_FLAGS;

export extern(Windows) HRESULT StrFormatByteSizeEx(ULONGLONG ull, SFBS_FLAGS flags, LPWSTR pszBuf, UINT cchBuf);
export extern(Windows) LPSTR StrFormatByteSizeA(DWORD dw, LPSTR pszBuf, UINT cchBuf);
export extern(Windows) LPSTR StrFormatByteSize64A(LONGLONG qdw, LPSTR pszBuf, UINT cchBuf);
export extern(Windows) LPWSTR StrFormatByteSizeW(LONGLONG qdw, LPWSTR pszBuf, UINT cchBuf);
export extern(Windows) LPWSTR StrFormatKBSizeW(LONGLONG qdw, LPWSTR pszBuf, UINT cchBuf);
export extern(Windows) LPSTR StrFormatKBSizeA(LONGLONG qdw, LPSTR pszBuf, UINT cchBuf);
export extern(Windows) int StrFromTimeIntervalA(LPSTR pszOut, UINT cchMax, DWORD dwTimeMS, int digits);
export extern(Windows) int StrFromTimeIntervalW(LPWSTR pwszOut, UINT cchMax, DWORD dwTimeMS, int digits);
export extern(Windows) BOOL StrIsIntlEqualA(BOOL fCaseSens, LPCSTR lpString1, LPCSTR lpString2, int nChar);
export extern(Windows) BOOL StrIsIntlEqualW(BOOL fCaseSens, LPCWSTR lpString1, LPCWSTR lpString2, int nChar);
export extern(Windows) LPSTR StrNCatA(LPSTR psz1, LPCSTR psz2, int cchMax);
export extern(Windows) LPWSTR StrNCatW(LPWSTR psz1, LPCWSTR psz2, int cchMax);

export extern(Windows) LPSTR StrPBrkA(LPCSTR psz, LPCSTR pszSet);
export extern(Windows) LPWSTR StrPBrkW(LPCWSTR psz, LPCWSTR pszSet);
export extern(Windows) LPSTR StrRChrA(LPCSTR lpStart, LPCSTR lpEnd, WORD wMatch);
export extern(Windows) LPWSTR StrRChrW(LPCWSTR lpStart, LPCWSTR lpEnd, WCHAR wMatch);
export extern(Windows) LPSTR StrRChrIA(LPCSTR lpStart, LPCSTR lpEnd, WORD wMatch);
export extern(Windows) LPWSTR StrRChrIW(LPCWSTR lpStart, LPCWSTR lpEnd, WCHAR wMatch);
export extern(Windows) LPSTR StrRStrIA(LPCSTR lpSource, LPCSTR lpLast, LPCSTR lpSrch);
export extern(Windows) LPWSTR StrRStrIW(LPCWSTR lpSource, LPCWSTR lpLast, LPCWSTR lpSrch);

export extern(Windows) int StrSpnA(LPCSTR psz, LPCSTR pszSet);
export extern(Windows) int StrSpnW(LPCWSTR psz, LPCWSTR pszSet);

export extern(Windows) LPSTR StrStrA(LPCSTR lpFirst, LPCSTR lpSrch);
export extern(Windows) LPWSTR StrStrW(LPCWSTR lpFirst, LPCWSTR lpSrch);
export extern(Windows) LPSTR StrStrIA(LPCSTR lpFirst, LPCSTR lpSrch);
export extern(Windows) LPWSTR StrStrIW(LPCWSTR lpFirst, LPCWSTR lpSrch);
export extern(Windows) LPWSTR StrStrNW(LPCWSTR lpFirst, LPCWSTR lpSrch, UINT cchMax);
export extern(Windows) LPWSTR StrStrNIW(LPCWSTR lpFirst, LPCWSTR lpSrch, UINT cchMax);

enum {
	STIF_DEFAULT     = 0x00000000,
	STIF_SUPPORT_HEX = 0x00000001,
}
alias int STIF_FLAGS;
export extern(Windows) int StrToIntA(LPCSTR lpSrc);
export extern(Windows) int StrToIntW(LPCWSTR lpSrc);
export extern(Windows) BOOL StrToIntExA(LPCSTR pszString, STIF_FLAGS dwFlags, int* piRet);
export extern(Windows) BOOL StrToIntExW(LPCWSTR pszString, STIF_FLAGS dwFlags, int* piRet);
export extern(Windows) BOOL StrToInt64ExA(LPCSTR pszString, STIF_FLAGS dwFlags, LONGLONG* pllRet);
export extern(Windows) BOOL StrToInt64ExW(LPCWSTR pszString, STIF_FLAGS dwFlags, LONGLONG* pllRet);

export extern(Windows) BOOL StrTrimA(LPSTR psz, LPCSTR pszTrimChars);
export extern(Windows) BOOL StrTrimW(LPWSTR psz, LPCWSTR pszTrimChars);

export extern(Windows) LPWSTR StrCatW(LPWSTR psz1, LPCWSTR psz2);
export extern(Windows) int StrCmpW(LPCWSTR psz1, LPCWSTR psz2);
export extern(Windows) int StrCmpIW(LPCWSTR psz1, LPCWSTR psz2);
export extern(Windows) LPWSTR StrCpyW(LPWSTR psz1, LPCWSTR psz2);
export extern(Windows) LPWSTR StrCpyNW(LPWSTR psz1, LPCWSTR psz2, int cchMax);

export extern(Windows) LPWSTR StrCatBuffW(LPWSTR pszDest, LPCWSTR pszSrc, int cchDestBuffSize);
export extern(Windows) LPSTR StrCatBuffA(LPSTR pszDest, LPCSTR pszSrc, int cchDestBuffSize);
export extern(Windows) BOOL ChrCmpIA(WORD w1, WORD w2);
export extern(Windows) BOOL ChrCmpIW(WCHAR w1, WCHAR w2);

export extern(Windows) int wvnsprintfA(LPSTR pszDest, int cchDest, LPCSTR pszFmt, va_list arglist);
export extern(Windows) int wvnsprintfW(LPWSTR pszDest, int cchDest, LPCWSTR pszFmt, va_list arglist);
export extern(C) int wnsprintfA(LPSTR pszDest, int cchDest, LPCSTR pszFmt, ...);
export extern(C) int wnsprintfW(LPWSTR pszDest, int cchDest, LPCWSTR pszFmt, ...);

//	StrIntlEqNA( s1, s2, nChar) StrIsIntlEqualA( TRUE, s1, s2, nChar)
//	StrIntlEqNW( s1, s2, nChar) StrIsIntlEqualW( TRUE, s1, s2, nChar)
//	StrIntlEqNIA(s1, s2, nChar) StrIsIntlEqualA(FALSE, s1, s2, nChar)
//	StrIntlEqNIW(s1, s2, nChar) StrIsIntlEqualW(FALSE, s1, s2, nChar)

export extern(Windows) HRESULT StrRetToStrA(STRRET* pstr, PCUITEMID_CHILD pidl, LPSTR* ppsz);
export extern(Windows) HRESULT StrRetToStrW(STRRET* pstr, PCUITEMID_CHILD pidl, LPWSTR* ppsz);
version(UNICODE)
	alias StrRetToStrW StrRetToStr;
else
	alias StrRetToStrA StrRetToStr;

export extern(Windows) HRESULT StrRetToBufA(STRRET* pstr, PCUITEMID_CHILD pidl, LPSTR pszBuf, UINT cchBuf);
export extern(Windows) HRESULT StrRetToBufW(STRRET* pstr, PCUITEMID_CHILD pidl, LPWSTR pszBuf, UINT cchBuf);
version(UNICODE)
	alias StrRetToBufW StrRetToBuf;
else
	alias StrRetToBufA StrRetToBuf;

export extern(Windows) HRESULT SHStrDupA(LPCSTR psz, LPWSTR* ppwsz);
export extern(Windows) HRESULT SHStrDupW(LPCWSTR psz, LPWSTR* ppwsz);
version(UNICODE)
	alias SHStrDupW SHStrDup;
else
	alias SHStrDupA SHStrDup;

HRESULT SHLocalStrDupW(LPCWSTR psz, LPWSTR* ppsz)
{
	*ppsz = StrDupW(psz);
	return *ppsz ? S_OK : E_OUTOFMEMORY;
}

HRESULT SHLocalStrDupA(LPCSTR psz, LPSTR* ppsz)
{
	*ppsz = StrDupA(psz);
	return *ppsz ? S_OK : E_OUTOFMEMORY;
}
version(UNICODE)
	alias SHLocalStrDupW SHLocalStrDup;
else
	alias SHLocalStrDupA SHLocalStrDup;


export extern(Windows) int StrCmpLogicalW(LPCWSTR psz1, LPCWSTR psz2);
export extern(Windows) DWORD StrCatChainW(LPWSTR pszDst, DWORD cchDst, DWORD ichAt, LPCWSTR pszSrc);
export extern(Windows) HRESULT StrRetToBSTR(STRRET* pstr, PCUITEMID_CHILD pidl, BSTR* pbstr);
export extern(Windows) HRESULT SHLoadIndirectString(LPCWSTR pszSource, LPWSTR pszOutBuf, UINT cchOutBuf, void** ppvReserved);

export extern(Windows) BOOL IsCharSpaceA(CHAR wch);
export extern(Windows) BOOL IsCharSpaceW(WCHAR wch);
version(UNICODE)
	alias IsCharSpaceW IsCharSpace;
else
	alias IsCharSpaceA IsCharSpace;

export extern(Windows) int StrCmpCA(LPCSTR pszStr1, LPCSTR pszStr2);
export extern(Windows) int StrCmpCW(LPCWSTR pszStr1, LPCWSTR pszStr2);
version(UNICODE)
	alias StrCmpCW StrCmpC;
else
	alias StrCmpCA StrCmpC;

export extern(Windows) int StrCmpICA(LPCSTR pszStr1, LPCSTR pszStr2);
export extern(Windows) int StrCmpICW(LPCWSTR pszStr1, LPCWSTR pszStr2);
version(UNICODE)
	alias StrCmpICW StrCmpIC;
else
	alias StrCmpICA StrCmpIC;

version(UNICODE){
	alias StrChrW StrChr;
	alias StrRChrW StrRChr;
	alias StrChrIW StrChrI;
	alias StrRChrIW StrRChrI;
	alias StrCmpNW StrCmpN;
	alias StrCmpNIW StrCmpNI;
	alias StrStrW StrStr;
	alias StrStrIW StrStrI;
	alias StrDupW StrDup;
	alias StrRStrIW StrRStrI;
	alias StrCSpnW StrCSpn;
	alias StrCSpnIW StrCSpnI;
	alias StrSpnW StrSpn;
	alias StrToIntW StrToInt;
	alias StrPBrkW StrPBrk;
	alias StrToIntExW StrToIntEx;
	alias StrToInt64ExW StrToInt64Ex;
	alias StrFromTimeIntervalW StrFromTimeInterval;
	//alias StrIntlEqNW StrIntlEqN;
	//alias StrIntlEqNIW StrIntlEqNI;
	alias StrFormatByteSizeW StrFormatByteSize;
	alias StrFormatByteSizeW StrFormatByteSize64;
	alias StrFormatKBSizeW StrFormatKBSize;
	alias StrNCatW StrNCat;
	alias StrTrimW StrTrim;
	alias StrCatBuffW StrCatBuff;
	alias ChrCmpIW ChrCmpI;
	alias wvnsprintfW wvnsprintf;
	alias wnsprintfW wnsprintf;
	alias StrIsIntlEqualW StrIsIntlEqual;
}else{
	alias StrChrA StrChr;
	alias StrRChrA StrRChr;
	alias StrChrIA StrChrI;
	alias StrRChrIA StrRChrI;
	alias StrCmpNA StrCmpN;
	alias StrCmpNIA StrCmpNI;
	alias StrStrA StrStr;
	alias StrStrIA StrStrI;
	alias StrDupA StrDup;
	alias StrRStrIA StrRStrI;
	alias StrCSpnA StrCSpn;
	alias StrCSpnIA StrCSpnI;
	alias StrSpnA StrSpn;
	alias StrToIntA StrToInt;
	alias StrPBrkA StrPBrk;
	alias StrToIntExA StrToIntEx;
	alias StrToInt64ExA StrToInt64Ex;
	alias StrFromTimeIntervalA StrFromTimeInterval;
	//alias StrIntlEqNA StrIntlEqN;
	//alias StrIntlEqNIA StrIntlEqNI;
	alias StrFormatByteSizeA StrFormatByteSize;
	alias StrFormatByteSize64A StrFormatByteSize64;
	alias StrFormatKBSizeA StrFormatKBSize;
	alias StrNCatA StrNCat;
	alias StrTrimA StrTrim;
	alias StrCatBuffA StrCatBuff;
	alias ChrCmpIA ChrCmpI;
	alias wvnsprintfA wvnsprintf;
	alias wnsprintfA wnsprintf;
	alias StrIsIntlEqualA StrIsIntlEqual;
}

export extern(Windows) int StrCmpNCA(LPCSTR lpStr1, LPCSTR lpStr2, int nChar);
export extern(Windows) int StrCmpNCW(LPCWSTR lpStr1, LPCWSTR lpStr2, int nChar);
version(UNICODE)
	alias StrCmpNCW StrCmpNC;
else
	alias StrCmpNCA StrCmpNC;
export extern(Windows) int StrCmpNICA(LPCSTR lpStr1, LPCSTR lpStr2, int nChar);
export extern(Windows) int StrCmpNICW(LPCWSTR lpStr1, LPCWSTR lpStr2, int nChar);
version(UNICODE)
	alias StrCmpNICW StrCmpNIC;
else
	alias StrCmpNICA StrCmpNIC;

export extern(Windows) BOOL IntlStrEqWorkerA(BOOL fCaseSens, LPCSTR lpString1, LPCSTR lpString2, int nChar);
export extern(Windows) BOOL IntlStrEqWorkerW(BOOL fCaseSens, LPCWSTR lpString1, LPCWSTR lpString2, int nChar);

//	IntlStrEqNA( s1, s2, nChar) IntlStrEqWorkerA( TRUE, s1, s2, nChar)
//	IntlStrEqNW( s1, s2, nChar) IntlStrEqWorkerW( TRUE, s1, s2, nChar)
//	IntlStrEqNIA(s1, s2, nChar) IntlStrEqWorkerA(FALSE, s1, s2, nChar)
//	IntlStrEqNIW(s1, s2, nChar) IntlStrEqWorkerW(FALSE, s1, s2, nChar)
/*version(UNICODE){
	alias IntlStrEqNW IntlStrEqN;
	alias IntlStrEqNIW IntlStrEqNI;
}else{
	alias IntlStrEqNA IntlStrEqN;
	alias IntlStrEqNIA IntlStrEqNI;
}*/

const char* SZ_CONTENTTYPE_HTMLA = "text/html";
const wchar* SZ_CONTENTTYPE_HTMLW = "text/html";
const char* SZ_CONTENTTYPE_CDFA = "application/x-cdf";
const wchar* SZ_CONTENTTYPE_CDFW = "application/x-cdf";
version(UNICODE){
	alias SZ_CONTENTTYPE_HTMLW SZ_CONTENTTYPE_HTML;
	alias SZ_CONTENTTYPE_CDFW SZ_CONTENTTYPE_CDF;
}else{
	alias SZ_CONTENTTYPE_HTMLA SZ_CONTENTTYPE_HTML;
	alias SZ_CONTENTTYPE_CDFA SZ_CONTENTTYPE_CDF;
}

BOOL PathIsHTMLFileA(LPCSTR pszPath)
{
	return PathIsContentTypeA(pszPath, SZ_CONTENTTYPE_HTMLA);
}

BOOL PathIsHTMLFileW(LPCWSTR pszPath)
{
	return PathIsContentTypeW(pszPath, SZ_CONTENTTYPE_HTMLW);
}

alias lstrcatA StrCatA;
alias lstrcmpA StrCmpA;
alias lstrcmpiA StrCmpIA;
alias lstrcpyA StrCpyA;
alias lstrcpynA StrCpyNA;

version(UNICODE){
	alias StrCatW StrCat;
	alias StrCmpW StrCmp;
	alias StrCmpIW StrCmpI;
	alias StrCpyW StrCpy;
	alias StrCpyNW StrCpyN;
	alias StrCatBuffW StrCatBuff;
}else{
	alias lstrcatA StrCat;
	alias lstrcmpA StrCmp;
	alias lstrcmpiA StrCmpI;
	alias lstrcpyA StrCpy;
	alias lstrcpynA StrCpyN;
	alias StrCatBuffA StrCatBuff;
}

alias StrToInt StrToLong;
alias StrCmpN StrNCmp;
alias StrCmpNI StrNCmpI;
alias StrCpyN StrNCpy;
alias StrNCat StrCatN;

export extern(Windows) LPSTR PathAddBackslashA(LPSTR pszPath);
export extern(Windows) LPWSTR PathAddBackslashW(LPWSTR pszPath);
version(UNICODE)
	alias PathAddBackslashW PathAddBackslash;
else
	alias PathAddBackslashA PathAddBackslash;

export extern(Windows) BOOL PathAddExtensionA(LPSTR pszPath, LPCSTR pszExt);
export extern(Windows) BOOL PathAddExtensionW(LPWSTR pszPath, LPCWSTR pszExt);
version(UNICODE)
	alias PathAddExtensionW PathAddExtension;
else
	alias PathAddExtensionA PathAddExtension;

export extern(Windows) BOOL PathAppendA(LPSTR pszPath, LPCSTR pMore);
export extern(Windows) BOOL PathAppendW(LPWSTR pszPath, LPCWSTR pMore);
export extern(Windows) LPSTR PathBuildRootA(LPSTR pszRoot, int iDrive);
export extern(Windows) LPWSTR PathBuildRootW(LPWSTR pszRoot, int iDrive);
version(UNICODE)
	alias PathBuildRootW PathBuildRoot;
else
	alias PathBuildRootA PathBuildRoot;

export extern(Windows) BOOL PathCanonicalizeA(LPSTR pszBuf, LPCSTR pszPath);
export extern(Windows) BOOL PathCanonicalizeW(LPWSTR pszBuf, LPCWSTR pszPath);
export extern(Windows) LPSTR PathCombineA(LPSTR pszDest, LPCSTR pszDir, LPCSTR pszFile);
export extern(Windows) LPWSTR PathCombineW(LPWSTR pszDest, LPCWSTR pszDir, LPCWSTR pszFile);
version(UNICODE)
	alias PathCombineW PathCombine;
else
	alias PathCombineA PathCombine;

export extern(Windows) BOOL PathCompactPathA(HDC hDC, LPSTR pszPath, UINT dx);
export extern(Windows) BOOL PathCompactPathW(HDC hDC, LPWSTR pszPath, UINT dx);
export extern(Windows) BOOL PathCompactPathExA(LPSTR pszOut, LPCSTR pszSrc, UINT cchMax, DWORD dwFlags);
export extern(Windows) BOOL PathCompactPathExW(LPWSTR pszOut, LPCWSTR pszSrc, UINT cchMax, DWORD dwFlags);
export extern(Windows) int PathCommonPrefixA(LPCSTR pszFile1, LPCSTR pszFile2, LPSTR achPath);
export extern(Windows) int PathCommonPrefixW(LPCWSTR pszFile1, LPCWSTR pszFile2, LPWSTR achPath);
export extern(Windows) BOOL PathFileExistsA(LPCSTR pszPath);
export extern(Windows) BOOL PathFileExistsW(LPCWSTR pszPath);
version(UNICODE)
	alias PathFileExistsW PathFileExists;
else
	alias PathFileExistsA PathFileExists;

export extern(Windows) LPSTR PathFindExtensionA(LPCSTR pszPath);
export extern(Windows) LPWSTR PathFindExtensionW(LPCWSTR pszPath);
version(UNICODE)
	alias PathFindExtensionW PathFindExtension;
else
	alias PathFindExtensionA PathFindExtension;

export extern(Windows) LPSTR PathFindFileNameA(LPCSTR pszPath);
export extern(Windows) LPWSTR PathFindFileNameW(LPCWSTR pszPath);
version(UNICODE)
	alias PathFindFileNameW PathFindFileName;
else
	alias PathFindFileNameA PathFindFileName;

export extern(Windows) LPSTR PathFindNextComponentA(LPCSTR pszPath);
export extern(Windows) LPWSTR PathFindNextComponentW(LPCWSTR pszPath);
version(UNICODE)
	alias PathFindNextComponentW PathFindNextComponent;
else
	alias PathFindNextComponentA PathFindNextComponent;

export extern(Windows) BOOL PathFindOnPathA(LPSTR pszPath, PZPCSTR ppszOtherDirs);
export extern(Windows) BOOL PathFindOnPathW(LPWSTR pszPath, PZPCWSTR ppszOtherDirs);
export extern(Windows) LPCSTR PathFindSuffixArrayA(LPCSTR pszPath, const(LPCSTR)* apszSuffix, int iArraySize);
export extern(Windows) LPCWSTR PathFindSuffixArrayW(LPCWSTR pszPath, const(LPCWSTR)* apszSuffix, int iArraySize);
version(UNICODE)
	alias PathFindSuffixArrayW PathFindSuffixArray;
else
	alias PathFindSuffixArrayA PathFindSuffixArray;

export extern(Windows) LPSTR PathGetArgsA(LPCSTR pszPath);
export extern(Windows) LPWSTR PathGetArgsW(LPCWSTR pszPath);
version(UNICODE)
	alias PathGetArgsW PathGetArgs;
else
	alias PathGetArgsA PathGetArgs;

export extern(Windows) BOOL PathIsLFNFileSpecA(LPCSTR lpName);
export extern(Windows) BOOL PathIsLFNFileSpecW(LPCWSTR lpName);
version(UNICODE)
	alias PathIsLFNFileSpecW PathIsLFNFileSpec;
else
	alias PathIsLFNFileSpecA PathIsLFNFileSpec;

export extern(Windows) UINT PathGetCharTypeA(UCHAR ch);
export extern(Windows) UINT PathGetCharTypeW(WCHAR ch);

enum {
	GCT_INVALID   = 0x0000,
	GCT_LFNCHAR   = 0x0001,
	GCT_SHORTCHAR = 0x0002,
	GCT_WILD      = 0x0004,
	GCT_SEPARATOR = 0x0008,
}

export extern(Windows) int PathGetDriveNumberA(LPCSTR pszPath);
export extern(Windows) int PathGetDriveNumberW(LPCWSTR pszPath);
version(UNICODE)
	alias PathGetDriveNumberW PathGetDriveNumber;
else
	alias PathGetDriveNumberA PathGetDriveNumber;

export extern(Windows) BOOL PathIsDirectoryA(LPCSTR pszPath);
export extern(Windows) BOOL PathIsDirectoryW(LPCWSTR pszPath);
version(UNICODE)
	alias PathIsDirectoryW PathIsDirectory;
else
	alias PathIsDirectoryA PathIsDirectory;

export extern(Windows) BOOL PathIsDirectoryEmptyA(LPCSTR pszPath);
export extern(Windows) BOOL PathIsDirectoryEmptyW(LPCWSTR pszPath);
version(UNICODE)
	alias PathIsDirectoryEmptyW PathIsDirectoryEmpty;
else
	alias PathIsDirectoryEmptyA PathIsDirectoryEmpty;

export extern(Windows) BOOL PathIsFileSpecA(LPCSTR pszPath);
export extern(Windows) BOOL PathIsFileSpecW(LPCWSTR pszPath);
version(UNICODE)
	alias PathIsFileSpecW PathIsFileSpec;
else
	alias PathIsFileSpecA PathIsFileSpec;

export extern(Windows) BOOL PathIsPrefixA(LPCSTR pszPrefix, LPCSTR pszPath);
export extern(Windows) BOOL PathIsPrefixW(LPCWSTR pszPrefix, LPCWSTR pszPath);
version(UNICODE)
	alias PathIsPrefixW PathIsPrefix;
else
	alias PathIsPrefixA PathIsPrefix;

export extern(Windows) BOOL PathIsRelativeA(LPCSTR pszPath);
export extern(Windows) BOOL PathIsRelativeW(LPCWSTR pszPath);
version(UNICODE)
	alias PathIsRelativeW PathIsRelative;
else
	alias PathIsRelativeA PathIsRelative;

export extern(Windows) BOOL PathIsRootA(LPCSTR pszPath);
export extern(Windows) BOOL PathIsRootW(LPCWSTR pszPath);
version(UNICODE)
	alias PathIsRootW PathIsRoot;
else
	alias PathIsRootA PathIsRoot;

export extern(Windows) BOOL PathIsSameRootA(LPCSTR pszPath1, LPCSTR pszPath2);
export extern(Windows) BOOL PathIsSameRootW(LPCWSTR pszPath1, LPCWSTR pszPath2);
version(UNICODE)
	alias PathIsSameRootW PathIsSameRoot;
else
	alias PathIsSameRootA PathIsSameRoot;

export extern(Windows) BOOL PathIsUNCA(LPCSTR pszPath);
export extern(Windows) BOOL PathIsUNCW(LPCWSTR pszPath);
version(UNICODE)
	alias PathIsUNCW PathIsUNC;
else
	alias PathIsUNCA PathIsUNC;

export extern(Windows) BOOL PathIsNetworkPathA(LPCSTR pszPath);
export extern(Windows) BOOL PathIsNetworkPathW(LPCWSTR pszPath);
version(UNICODE)
	alias PathIsNetworkPathW PathIsNetworkPath;
else
	alias PathIsNetworkPathA PathIsNetworkPath;

export extern(Windows) BOOL PathIsUNCServerA(LPCSTR pszPath);
export extern(Windows) BOOL PathIsUNCServerW(LPCWSTR pszPath);
version(UNICODE)
	alias PathIsUNCServerW PathIsUNCServer;
else
	alias PathIsUNCServerA PathIsUNCServer;

export extern(Windows) BOOL PathIsUNCServerShareA(LPCSTR pszPath);
export extern(Windows) BOOL PathIsUNCServerShareW(LPCWSTR pszPath);
version(UNICODE)
	alias PathIsUNCServerShareW PathIsUNCServerShare;
else
	alias PathIsUNCServerShareA PathIsUNCServerShare;

export extern(Windows) BOOL PathIsContentTypeA(LPCSTR pszPath, LPCSTR pszContentType);
export extern(Windows) BOOL PathIsContentTypeW(LPCWSTR pszPath, LPCWSTR pszContentType);
export extern(Windows) BOOL PathIsURLA(LPCSTR pszPath);
export extern(Windows) BOOL PathIsURLW(LPCWSTR pszPath);
version(UNICODE)
	alias PathIsURLW PathIsURL;
else
	alias PathIsURLA PathIsURL;

export extern(Windows) BOOL PathMakePrettyA(LPSTR pszPath);
export extern(Windows) BOOL PathMakePrettyW(LPWSTR pszPath);
export extern(Windows) BOOL PathMatchSpecA(LPCSTR pszFile, LPCSTR pszSpec);
export extern(Windows) BOOL PathMatchSpecW(LPCWSTR pszFile, LPCWSTR pszSpec);

//(_WIN32_IE >= _WIN32_IE_IE70)
	enum {
		PMSF_NORMAL            = 0x00000000,
		PMSF_MULTIPLE          = 0x00000001,
		PMSF_DONT_STRIP_SPACES = 0x00010000,
	}
static if(_WIN32_IE >= _WIN32_IE_IE70){
	export extern(Windows) HRESULT PathMatchSpecExA(LPCSTR pszFile, LPCSTR pszSpec, DWORD dwFlags);
	export extern(Windows) HRESULT PathMatchSpecExW(LPCWSTR pszFile, LPCWSTR pszSpec, DWORD dwFlags);
}

export extern(Windows) int PathParseIconLocationA(LPSTR pszIconFile);
export extern(Windows) int PathParseIconLocationW(LPWSTR pszIconFile);
export extern(Windows) BOOL PathQuoteSpacesA(LPSTR lpsz);
export extern(Windows) BOOL PathQuoteSpacesW(LPWSTR lpsz);
export extern(Windows) BOOL PathRelativePathToA(LPSTR pszPath, LPCSTR pszFrom, DWORD dwAttrFrom, LPCSTR pszTo, DWORD dwAttrTo);
export extern(Windows) BOOL PathRelativePathToW(LPWSTR pszPath, LPCWSTR pszFrom, DWORD dwAttrFrom, LPCWSTR pszTo, DWORD dwAttrTo);
export extern(Windows) void PathRemoveArgsA(LPSTR pszPath);
export extern(Windows) void PathRemoveArgsW(LPWSTR pszPath);
export extern(Windows) LPSTR PathRemoveBackslashA(LPSTR pszPath);
export extern(Windows) LPWSTR PathRemoveBackslashW(LPWSTR pszPath);
version(UNICODE)
	alias PathRemoveBackslashW PathRemoveBackslash;
else
	alias PathRemoveBackslashA PathRemoveBackslash;

export extern(Windows) void PathRemoveBlanksA(LPSTR pszPath);
export extern(Windows) void PathRemoveBlanksW(LPWSTR pszPath);
export extern(Windows) void PathRemoveExtensionA(LPSTR pszPath);
export extern(Windows) void PathRemoveExtensionW(LPWSTR pszPath);
export extern(Windows) BOOL PathRemoveFileSpecA(LPSTR pszPath);
export extern(Windows) BOOL PathRemoveFileSpecW(LPWSTR pszPath);
export extern(Windows) BOOL PathRenameExtensionA(LPSTR pszPath, LPCSTR pszExt);
export extern(Windows) BOOL PathRenameExtensionW(LPWSTR pszPath, LPCWSTR pszExt);
export extern(Windows) BOOL PathSearchAndQualifyA(LPCSTR pszPath, LPSTR pszBuf, UINT cchBuf);
export extern(Windows) BOOL PathSearchAndQualifyW(LPCWSTR pszPath, LPWSTR pszBuf, UINT cchBuf);
export extern(Windows) void PathSetDlgItemPathA(HWND hDlg, int id, LPCSTR pszPath);
export extern(Windows) void PathSetDlgItemPathW(HWND hDlg, int id, LPCWSTR pszPath);

export extern(Windows) LPSTR PathSkipRootA(LPCSTR pszPath);
export extern(Windows) LPWSTR PathSkipRootW(LPCWSTR pszPath);
version(UNICODE)
	alias PathSkipRootW PathSkipRoot;
else
	alias PathSkipRootA PathSkipRoot;

export extern(Windows) void PathStripPathA(LPSTR pszPath);
export extern(Windows) void PathStripPathW(LPWSTR pszPath);
version(UNICODE)
	alias PathStripPathW PathStripPath;
else
	alias PathStripPathA PathStripPath;

export extern(Windows) BOOL PathStripToRootA(LPSTR pszPath);
export extern(Windows) BOOL PathStripToRootW(LPWSTR pszPath);
version(UNICODE)
	alias PathStripToRootW PathStripToRoot;
else
	alias PathStripToRootA PathStripToRoot;

export extern(Windows) BOOL PathUnquoteSpacesA(LPSTR lpsz);
export extern(Windows) BOOL PathUnquoteSpacesW(LPWSTR lpsz);
export extern(Windows) BOOL PathMakeSystemFolderA(LPCSTR pszPath);
export extern(Windows) BOOL PathMakeSystemFolderW(LPCWSTR pszPath);
version(UNICODE)
	alias PathMakeSystemFolderW PathMakeSystemFolder;
else
	alias PathMakeSystemFolderA PathMakeSystemFolder;

export extern(Windows) BOOL PathUnmakeSystemFolderA(LPCSTR pszPath);
export extern(Windows) BOOL PathUnmakeSystemFolderW(LPCWSTR pszPath);
version(UNICODE)
	alias PathUnmakeSystemFolderW PathUnmakeSystemFolder;
else
	alias PathUnmakeSystemFolderA PathUnmakeSystemFolder;

export extern(Windows) BOOL PathIsSystemFolderA(LPCSTR pszPath, DWORD dwAttrb);
export extern(Windows) BOOL PathIsSystemFolderW(LPCWSTR pszPath, DWORD dwAttrb);
version(UNICODE)
	alias PathIsSystemFolderW PathIsSystemFolder;
else
	alias PathIsSystemFolderA PathIsSystemFolder;

export extern(Windows) void PathUndecorateA(LPSTR pszPath);
export extern(Windows) void PathUndecorateW(LPWSTR pszPath);
version(UNICODE)
	alias PathUndecorateW PathUndecorate;
else
	alias PathUndecorateA PathUndecorate;

export extern(Windows) BOOL PathUnExpandEnvStringsA(LPCSTR pszPath, LPSTR pszBuf, UINT cchBuf);
export extern(Windows) BOOL PathUnExpandEnvStringsW(LPCWSTR pszPath, LPWSTR pszBuf, UINT cchBuf);
version(UNICODE)
	alias PathUnExpandEnvStringsW PathUnExpandEnvStrings;
else
	alias PathUnExpandEnvStringsA PathUnExpandEnvStrings;

version(UNICODE){
	alias PathAppendW PathAppend;
	alias PathCanonicalizeW PathCanonicalize;
	alias PathCompactPathW PathCompactPath;
	alias PathCompactPathExW PathCompactPathEx;
	alias PathCommonPrefixW PathCommonPrefix;
	alias PathFindOnPathW PathFindOnPath;
	alias PathGetCharTypeW PathGetCharType;
	alias PathIsContentTypeW PathIsContentType;
	alias PathIsHTMLFileW PathIsHTMLFile;
	alias PathMakePrettyW PathMakePretty;
	alias PathMatchSpecW PathMatchSpec;
	static if(_WIN32_IE >= _WIN32_IE_IE70)
		alias PathMatchSpecExW PathMatchSpecEx;
	alias PathParseIconLocationW PathParseIconLocation;
	alias PathQuoteSpacesW PathQuoteSpaces;
	alias PathRelativePathToW PathRelativePathTo;
	alias PathRemoveArgsW PathRemoveArgs;
	alias PathRemoveBlanksW PathRemoveBlanks;
	alias PathRemoveExtensionW PathRemoveExtension;
	alias PathRemoveFileSpecW PathRemoveFileSpec;
	alias PathRenameExtensionW PathRenameExtension;
	alias PathSearchAndQualifyW PathSearchAndQualify;
	alias PathSetDlgItemPathW PathSetDlgItemPath;
	alias PathUnquoteSpacesW PathUnquoteSpaces;
}else{
	alias PathAppendA PathAppend;
	alias PathCanonicalizeA PathCanonicalize;
	alias PathCompactPathA PathCompactPath;
	alias PathCompactPathExA PathCompactPathEx;
	alias PathCommonPrefixA PathCommonPrefix;
	alias PathFindOnPathA PathFindOnPath;
	alias PathGetCharTypeA PathGetCharType;
	alias PathIsContentTypeA PathIsContentType;
	alias PathIsHTMLFileA PathIsHTMLFile;
	alias PathMakePrettyA PathMakePretty;
	alias PathMatchSpecA PathMatchSpec;
	static if(_WIN32_IE >= _WIN32_IE_IE70)
		alias PathMatchSpecExA PathMatchSpecEx;
	alias PathParseIconLocationA PathParseIconLocation;
	alias PathQuoteSpacesA PathQuoteSpaces;
	alias PathRelativePathToA PathRelativePathTo;
	alias PathRemoveArgsA PathRemoveArgs;
	alias PathRemoveBlanksA PathRemoveBlanks;
	alias PathRemoveExtensionA PathRemoveExtension;
	alias PathRemoveFileSpecA PathRemoveFileSpec;
	alias PathRenameExtensionA PathRenameExtension;
	alias PathSearchAndQualifyA PathSearchAndQualify;
	alias PathSetDlgItemPathA PathSetDlgItemPath;
	alias PathUnquoteSpacesA PathUnquoteSpaces;
}

enum {
	URL_SCHEME_INVALID = -1,
	URL_SCHEME_UNKNOWN = 0,
	URL_SCHEME_FTP,
	URL_SCHEME_HTTP,
	URL_SCHEME_GOPHER,
	URL_SCHEME_MAILTO,
	URL_SCHEME_NEWS,
	URL_SCHEME_NNTP,
	URL_SCHEME_TELNET,
	URL_SCHEME_WAIS,
	URL_SCHEME_FILE,
	URL_SCHEME_MK,
	URL_SCHEME_HTTPS,
	URL_SCHEME_SHELL,
	URL_SCHEME_SNEWS,
	URL_SCHEME_LOCAL,
	URL_SCHEME_JAVASCRIPT,
	URL_SCHEME_VBSCRIPT,
	URL_SCHEME_ABOUT,
	URL_SCHEME_RES,
	URL_SCHEME_MSSHELLROOTED,
	URL_SCHEME_MSSHELLIDLIST,
	URL_SCHEME_MSHELP,
	//(_WIN32_IE >= _WIN32_IE_IE70)
		URL_SCHEME_MSSHELLDEVICE,
		URL_SCHEME_WILDCARD,
	//(NTDDI_VERSION >= NTDDI_VISTA)
		URL_SCHEME_SEARCH_MS,
	//(NTDDI_VERSION >= NTDDI_VISTASP1)
		URL_SCHEME_SEARCH,
	//(NTDDI_VERSION >= NTDDI_WIN7)
		URL_SCHEME_KNOWNFOLDER,
	URL_SCHEME_MAXVALUE
}
alias int URL_SCHEME;

enum {
	URL_PART_NONE = 0,
	URL_PART_SCHEME = 1,
	URL_PART_HOSTNAME,
	URL_PART_USERNAME,
	URL_PART_PASSWORD,
	URL_PART_PORT,
	URL_PART_QUERY,
}
alias int URL_PART;

enum {
	URLIS_URL,
	URLIS_OPAQUE,
	URLIS_NOHISTORY,
	URLIS_FILEURL,
	URLIS_APPLIABLE,
	URLIS_DIRECTORY,
	URLIS_HASQUERY,
}
alias int URLIS;

enum {
	URL_UNESCAPE                 = 0x10000000,
	URL_ESCAPE_UNSAFE            = 0x20000000,
	URL_PLUGGABLE_PROTOCOL       = 0x40000000,
	URL_WININET_COMPATIBILITY    = 0x80000000,
	URL_DONT_ESCAPE_EXTRA_INFO   = 0x02000000,
	URL_DONT_UNESCAPE_EXTRA_INFO = URL_DONT_ESCAPE_EXTRA_INFO,
	URL_BROWSER_MODE             = URL_DONT_ESCAPE_EXTRA_INFO,
	URL_ESCAPE_SPACES_ONLY       = 0x04000000,
	URL_DONT_SIMPLIFY            = 0x08000000,
	URL_NO_META                  = URL_DONT_SIMPLIFY,
	URL_UNESCAPE_INPLACE         = 0x00100000,
	URL_CONVERT_IF_DOSPATH       = 0x00200000,
	URL_UNESCAPE_HIGH_ANSI_ONLY  = 0x00400000,
	URL_INTERNAL_PATH            = 0x00800000,
	URL_FILE_USE_PATHURL         = 0x00010000,
	URL_DONT_UNESCAPE            = 0x00020000,
	//(NTDDI_VERSION >= NTDDI_WIN7)
		URL_ESCAPE_AS_UTF8 = 0x00040000,
	URL_ESCAPE_PERCENT           = 0x00001000,
	URL_ESCAPE_SEGMENT_ONLY      = 0x00002000,
	URL_PARTFLAG_KEEPSCHEME      = 0x00000001,
	URL_APPLY_DEFAULT            = 0x00000001,
	URL_APPLY_GUESSSCHEME        = 0x00000002,
	URL_APPLY_GUESSFILE          = 0x00000004,
	URL_APPLY_FORCEAPPLY         = 0x00000008,
}

export extern(Windows) int UrlCompareA(LPCSTR psz1, LPCSTR psz2, BOOL fIgnoreSlash);
export extern(Windows) int UrlCompareW(LPCWSTR psz1, LPCWSTR psz2, BOOL fIgnoreSlash);
export extern(Windows) HRESULT UrlCombineA(LPCSTR pszBase, LPCSTR pszRelative, PSTR pszCombined, LPDWORD pcchCombined, DWORD dwFlags);
export extern(Windows) HRESULT UrlCombineW(LPCWSTR pszBase, LPCWSTR pszRelative, LPWSTR pszCombined, LPDWORD pcchCombined, DWORD dwFlags);
export extern(Windows) HRESULT UrlCanonicalizeA(LPCSTR pszUrl, LPSTR pszCanonicalized, LPDWORD pcchCanonicalized, DWORD dwFlags);
export extern(Windows) HRESULT UrlCanonicalizeW(LPCWSTR pszUrl, LPWSTR pszCanonicalized, LPDWORD pcchCanonicalized, DWORD dwFlags);
export extern(Windows) BOOL UrlIsOpaqueA(LPCSTR pszURL);
export extern(Windows) BOOL UrlIsOpaqueW(LPCWSTR pszURL);
export extern(Windows) BOOL UrlIsNoHistoryA(LPCSTR pszURL);
export extern(Windows) BOOL UrlIsNoHistoryW(LPCWSTR pszURL);

BOOL UrlIsFileUrlA(LPCSTR pszURL)
{
	return UrlIsA(pszURL, URLIS_FILEURL);
}

BOOL UrlIsFileUrlW(LPCWSTR pszURL)
{
	return UrlIsW(pszURL, URLIS_FILEURL);
}

export extern(Windows) BOOL UrlIsA(LPCSTR pszUrl, URLIS UrlIs);
export extern(Windows) BOOL UrlIsW(LPCWSTR pszUrl, URLIS UrlIs);
export extern(Windows) LPCSTR UrlGetLocationA(LPCSTR psz1);
export extern(Windows) LPCWSTR UrlGetLocationW(LPCWSTR psz1);
export extern(Windows) HRESULT UrlUnescapeA(LPSTR pszUrl, LPSTR pszUnescaped, LPDWORD pcchUnescaped, DWORD dwFlags);
export extern(Windows) HRESULT UrlUnescapeW(LPWSTR pszUrl, LPWSTR pszUnescaped, LPDWORD pcchUnescaped, DWORD dwFlags);
export extern(Windows) HRESULT UrlEscapeA(LPCSTR pszUrl, LPSTR pszEscaped, LPDWORD pcchEscaped, DWORD dwFlags);
export extern(Windows) HRESULT UrlEscapeW(LPCWSTR pszUrl, LPWSTR pszEscaped, LPDWORD pcchEscaped, DWORD dwFlags);
export extern(Windows) HRESULT UrlCreateFromPathA(LPCSTR pszPath, LPSTR pszUrl, LPDWORD pcchUrl, DWORD dwFlags);
export extern(Windows) HRESULT UrlCreateFromPathW(LPCWSTR pszPath, LPWSTR pszUrl, LPDWORD pcchUrl, DWORD dwFlags);
export extern(Windows) HRESULT PathCreateFromUrlA(LPCSTR pszUrl, LPSTR pszPath, LPDWORD pcchPath, DWORD dwFlags);
export extern(Windows) HRESULT PathCreateFromUrlW(LPCWSTR pszUrl, LPWSTR pszPath, LPDWORD pcchPath, DWORD dwFlags);
static if(_WIN32_IE >= _WIN32_IE_IE70)
	export extern(Windows) HRESULT PathCreateFromUrlAlloc(LPCWSTR pszIn, LPWSTR* ppszOut, DWORD dwFlags);
export extern(Windows) HRESULT UrlHashA(LPCSTR pszUrl, LPBYTE pbHash, DWORD cbHash);
export extern(Windows) HRESULT UrlHashW(LPCWSTR pszUrl, LPBYTE pbHash, DWORD cbHash);
export extern(Windows) HRESULT UrlGetPartW(LPCWSTR pszIn, LPWSTR pszOut, LPDWORD pcchOut, DWORD dwPart, DWORD dwFlags);
export extern(Windows) HRESULT UrlGetPartA(LPCSTR pszIn, LPSTR pszOut, LPDWORD pcchOut, DWORD dwPart, DWORD dwFlags);
export extern(Windows) HRESULT UrlApplySchemeA(LPCSTR pszIn, LPSTR pszOut, LPDWORD pcchOut, DWORD dwFlags);
export extern(Windows) HRESULT UrlApplySchemeW(LPCWSTR pszIn, LPWSTR pszOut, LPDWORD pcchOut, DWORD dwFlags);
export extern(Windows) HRESULT HashData(LPBYTE pbData, DWORD cbData, LPBYTE pbHash, DWORD cbHash);
export extern(Windows) HRESULT UrlFixupW(LPCWSTR pszIn, LPWSTR pszOut, DWORD cchOut);

version(UNICODE){
	alias UrlCompareW UrlCompare;
	alias UrlCombineW UrlCombine;
	alias UrlCanonicalizeW UrlCanonicalize;
	alias UrlIsOpaqueW UrlIsOpaque;
	alias UrlIsFileUrlW UrlIsFileUrl;
	alias UrlGetLocationW UrlGetLocation;
	alias UrlUnescapeW UrlUnescape;
	alias UrlEscapeW UrlEscape;
	alias UrlCreateFromPathW UrlCreateFromPath;
	alias PathCreateFromUrlW PathCreateFromUrl;
	alias UrlHashW UrlHash;
	alias UrlGetPartW UrlGetPart;
	alias UrlApplySchemeW UrlApplyScheme;
	alias UrlIsW UrlIs;
	alias UrlFixupW UrlFixup;
}else{
	alias UrlCompareA UrlCompare;
	alias UrlCombineA UrlCombine;
	alias UrlCanonicalizeA UrlCanonicalize;
	alias UrlIsOpaqueA UrlIsOpaque;
	alias UrlIsFileUrlA UrlIsFileUrl;
	alias UrlGetLocationA UrlGetLocation;
	alias UrlUnescapeA UrlUnescape;
	alias UrlEscapeA UrlEscape;
	alias UrlCreateFromPathA UrlCreateFromPath;
	alias PathCreateFromUrlA PathCreateFromUrl;
	alias UrlHashA UrlHash;
	alias UrlGetPartA UrlGetPart;
	alias UrlApplySchemeA UrlApplyScheme;
	alias UrlIsA UrlIs;
}

//UrlEscapeSpaces(pszUrl, pszEscaped, pcchEscaped) UrlCanonicalize(pszUrl, pszEscaped, pcchEscaped, URL_ESCAPE_SPACES_ONLY |URL_DONT_ESCAPE_EXTRA_INFO )
//UrlUnescapeInPlace(pszUrl, dwFlags) UrlUnescape(pszUrl, NULL, NULL, dwFlags | URL_UNESCAPE_INPLACE)

struct PARSEDURLA {
	DWORD cbSize;
	LPCSTR pszProtocol;
	UINT cchProtocol;
	LPCSTR pszSuffix;
	UINT cchSuffix;
	UINT nScheme;
}
alias PARSEDURLA* PPARSEDURLA;
struct PARSEDURLW {
	DWORD cbSize;
	LPCWSTR pszProtocol;
	UINT cchProtocol;
	LPCWSTR pszSuffix;
	UINT cchSuffix;
	UINT nScheme;
}
alias PARSEDURLW* PPARSEDURLW;
version(UNICODE){
	alias PARSEDURLW PARSEDURL;
	alias PPARSEDURLW PPARSEDURL;
}else{
	alias PARSEDURLA PARSEDURL;
	alias PPARSEDURLA PPARSEDURL;
}
export extern(Windows) HRESULT ParseURLA(LPCSTR pcszURL, PARSEDURLA* ppu);
export extern(Windows) HRESULT ParseURLW(LPCWSTR pcszURL, PARSEDURLW* ppu);
version(UNICODE)
	alias ParseURLW ParseURL;
else
	alias ParseURLA ParseURL;

export extern(Windows) LSTATUS SHDeleteEmptyKeyA(HKEY hkey, LPCSTR pszSubKey);
export extern(Windows) LSTATUS SHDeleteEmptyKeyW(HKEY hkey, LPCWSTR pszSubKey);
version(UNICODE)
	alias SHDeleteEmptyKeyW SHDeleteEmptyKey;
else
	alias SHDeleteEmptyKeyA SHDeleteEmptyKey;

export extern(Windows) LSTATUS SHDeleteKeyA(HKEY hkey, LPCSTR pszSubKey);
export extern(Windows) LSTATUS SHDeleteKeyW(HKEY hkey, LPCWSTR pszSubKey);
version(UNICODE)
	alias SHDeleteKeyW SHDeleteKey;
else
	alias SHDeleteKeyA SHDeleteKey;

export extern(Windows) HKEY SHRegDuplicateHKey(HKEY hkey);

export extern(Windows) LSTATUS SHDeleteValueA(HKEY hkey, LPCSTR pszSubKey, LPCSTR pszValue);
export extern(Windows) LSTATUS SHDeleteValueW(HKEY hkey, LPCWSTR pszSubKey, LPCWSTR pszValue);
version(UNICODE)
	alias SHDeleteValueW SHDeleteValue;
else
	alias SHDeleteValueA SHDeleteValue;

export extern(Windows) LSTATUS SHGetValueA(HKEY hkey, LPCSTR pszSubKey, LPCSTR pszValue, DWORD* pdwType, void* pvData, DWORD* pcbData);
export extern(Windows) LSTATUS SHGetValueW(HKEY hkey, LPCWSTR pszSubKey, LPCWSTR pszValue, DWORD* pdwType, void* pvData, DWORD* pcbData);
version(UNICODE)
	alias SHGetValueW SHGetValue;
else
	alias SHGetValueA SHGetValue;

export extern(Windows) LSTATUS SHSetValueA(HKEY hkey, LPCSTR pszSubKey, LPCSTR pszValue, DWORD dwType, LPCVOID pvData, DWORD cbData);
export extern(Windows) LSTATUS SHSetValueW(HKEY hkey, LPCWSTR pszSubKey, LPCWSTR pszValue, DWORD dwType, LPCVOID pvData, DWORD cbData);
version(UNICODE)
	alias SHSetValueW SHSetValue;
else
	alias SHSetValueA SHSetValue;

alias int SRRF;
enum {
	SRRF_RT_REG_NONE      = 0x00000001,
	SRRF_RT_REG_SZ        = 0x00000002,
	SRRF_RT_REG_EXPAND_SZ = 0x00000004,
	SRRF_RT_REG_BINARY    = 0x00000008,
	SRRF_RT_REG_DWORD     = 0x00000010,
	SRRF_RT_REG_MULTI_SZ  = 0x00000020,
	SRRF_RT_REG_QWORD     = 0x00000040,
	SRRF_RT_DWORD         = SRRF_RT_REG_BINARY | SRRF_RT_REG_DWORD,
	SRRF_RT_QWORD         = SRRF_RT_REG_BINARY | SRRF_RT_REG_QWORD,
	SRRF_RT_ANY           = 0x0000ffff,
	SRRF_RM_ANY           = 0x00000000,
	SRRF_RM_NORMAL        = 0x00010000,
	SRRF_RM_SAFE          = 0x00020000,
	SRRF_RM_SAFENETWORK   = 0x00040000,
	SRRF_NOEXPAND         = 0x10000000,
	SRRF_ZEROONFAILURE    = 0x20000000,
	SRRF_NOVIRT           = 0x40000000,
}
export extern(Windows) LSTATUS SHRegGetValueA(HKEY hkey, LPCSTR pszSubKey, LPCSTR pszValue, SRRF srrfFlags, DWORD* pdwType, void* pvData, DWORD* pcbData);
export extern(Windows) LSTATUS SHRegGetValueW(HKEY hkey, LPCWSTR pszSubKey, LPCWSTR pszValue, SRRF srrfFlags, DWORD* pdwType, void* pvData, DWORD* pcbData);
version(UNICODE)
	alias SHRegGetValueW SHRegGetValue;
else
	alias SHRegGetValueA SHRegGetValue;

export extern(Windows) LSTATUS SHRegSetValue(HKEY hkey, LPCWSTR pszSubKey, LPCWSTR pszValue, SRRF srrfFlags, DWORD dwType, LPCVOID pvData, DWORD cbData);
export extern(Windows) LSTATUS SHRegGetValueFromHKCUHKLM(PCWSTR pwszKey, PCWSTR pwszValue, SRRF srrfFlags, DWORD* pdwType, void* pvData, DWORD* pcbData);
export extern(Windows) BOOL SHRegGetBoolValueFromHKCUHKLM(PCWSTR pszKey, PCWSTR pszValue, BOOL fDefault);

export extern(Windows) LSTATUS SHQueryValueExA(HKEY hkey, LPCSTR pszValue, DWORD* pdwReserved, DWORD* pdwType, void* pvData, DWORD* pcbData);
export extern(Windows) LSTATUS SHQueryValueExW(HKEY hkey, LPCWSTR pszValue, DWORD* pdwReserved, DWORD* pdwType, void* pvData, DWORD* pcbData);
version(UNICODE)
	alias SHQueryValueExW SHQueryValueEx;
else
	alias SHQueryValueExA SHQueryValueEx;

export extern(Windows) LSTATUS SHEnumKeyExA(HKEY hkey, DWORD dwIndex, LPSTR pszName, LPDWORD pcchName);
export extern(Windows) LSTATUS SHEnumKeyExW(HKEY hkey, DWORD dwIndex, LPWSTR pszName, LPDWORD pcchName);
export extern(Windows) LSTATUS SHEnumValueA(HKEY hkey, DWORD dwIndex, PSTR pszValueName, LPDWORD pcchValueName, LPDWORD pdwType, void* pvData, LPDWORD pcbData);
export extern(Windows) LSTATUS SHEnumValueW(HKEY hkey, DWORD dwIndex, PWSTR pszValueName, LPDWORD pcchValueName, LPDWORD pdwType, void* pvData, LPDWORD pcbData);
export extern(Windows) LSTATUS SHQueryInfoKeyA(HKEY hkey, LPDWORD pcSubKeys, LPDWORD pcchMaxSubKeyLen, LPDWORD pcValues, LPDWORD pcchMaxValueNameLen);
export extern(Windows) LSTATUS SHQueryInfoKeyW(HKEY hkey, LPDWORD pcSubKeys, LPDWORD pcchMaxSubKeyLen, LPDWORD pcValues, LPDWORD pcchMaxValueNameLen);

export extern(Windows) LSTATUS SHCopyKeyA(HKEY hkeySrc, LPCSTR szSrcSubKey, HKEY hkeyDest,  DWORD fReserved);
export extern(Windows) LSTATUS SHCopyKeyW(HKEY hkeySrc, LPCWSTR wszSrcSubKey, HKEY hkeyDest,  DWORD fReserved);

export extern(Windows) LSTATUS SHRegGetPathA(HKEY hKey, LPCSTR pcszSubKey, LPCSTR pcszValue, LPSTR pszPath, DWORD dwFlags);
export extern(Windows) LSTATUS SHRegGetPathW(HKEY hKey, LPCWSTR pcszSubKey, LPCWSTR pcszValue, LPWSTR pszPath, DWORD dwFlags);
export extern(Windows) LSTATUS SHRegSetPathA(HKEY hKey, LPCSTR pcszSubKey, LPCSTR pcszValue, LPCSTR pcszPath, DWORD dwFlags);
export extern(Windows) LSTATUS SHRegSetPathW(HKEY hKey, LPCWSTR pcszSubKey, LPCWSTR pcszValue, LPCWSTR pcszPath, DWORD dwFlags);

version(UNICODE){
	alias SHEnumKeyExW SHEnumKeyEx;
	alias SHEnumValueW SHEnumValue;
	alias SHQueryInfoKeyW SHQueryInfoKey;
	alias SHCopyKeyW SHCopyKey;
	alias SHRegGetPathW SHRegGetPath;
	alias SHRegSetPathW SHRegSetPath;
}else{
	alias SHEnumKeyExA SHEnumKeyEx;
	alias SHEnumValueA SHEnumValue;
	alias SHQueryInfoKeyA SHQueryInfoKey;
	alias SHCopyKeyA SHCopyKey;
	alias SHRegGetPathA SHRegGetPath;
	alias SHRegSetPathA SHRegSetPath;
}

enum {
	SHREGDEL_DEFAULT = 0x00000000,
	SHREGDEL_HKCU    = 0x00000001,
	SHREGDEL_HKLM    = 0x00000010,
	SHREGDEL_BOTH    = 0x00000011,
}
alias int SHREGDEL_FLAGS;

enum {
	SHREGENUM_DEFAULT = 0x00000000,
	SHREGENUM_HKCU    = 0x00000001,
	SHREGENUM_HKLM    = 0x00000010,
	SHREGENUM_BOTH    = 0x00000011,
}
alias int SHREGENUM_FLAGS;

enum {
	SHREGSET_HKCU       = 0x00000001,
	SHREGSET_FORCE_HKCU = 0x00000002,
	SHREGSET_HKLM       = 0x00000004,
	SHREGSET_FORCE_HKLM = 0x00000008,
	SHREGSET_DEFAULT    = SHREGSET_FORCE_HKCU | SHREGSET_HKLM,
}

enum HUSKEY : HANDLE {init = (HANDLE).init}
alias HUSKEY* PHUSKEY;

export extern(Windows) LSTATUS SHRegCreateUSKeyA(LPCSTR pszPath, REGSAM samDesired, HUSKEY hRelativeUSKey, PHUSKEY phNewUSKey, DWORD dwFlags);
export extern(Windows) LSTATUS SHRegCreateUSKeyW(LPCWSTR pwzPath, REGSAM samDesired, HUSKEY hRelativeUSKey, PHUSKEY phNewUSKey, DWORD dwFlags);
export extern(Windows) LSTATUS SHRegOpenUSKeyA(LPCSTR pszPath, REGSAM samDesired, HUSKEY hRelativeUSKey, PHUSKEY phNewUSKey, BOOL fIgnoreHKCU);
export extern(Windows) LSTATUS SHRegOpenUSKeyW(LPCWSTR pwzPath, REGSAM samDesired, HUSKEY hRelativeUSKey, PHUSKEY phNewUSKey, BOOL fIgnoreHKCU);
export extern(Windows) LSTATUS SHRegQueryUSValueA(HUSKEY hUSKey, LPCSTR pszValue, DWORD* pdwType, void* pvData, DWORD* pcbData, BOOL fIgnoreHKCU, void* pvDefaultData, DWORD dwDefaultDataSize);
export extern(Windows) LSTATUS SHRegQueryUSValueW(HUSKEY hUSKey, LPCWSTR pszValue, DWORD* pdwType, void* pvData, DWORD* pcbData, BOOL fIgnoreHKCU, void* pvDefaultData, DWORD dwDefaultDataSize);
export extern(Windows) LSTATUS SHRegWriteUSValueA(HUSKEY hUSKey, LPCSTR pszValue, DWORD dwType, const(void)* pvData, DWORD cbData, DWORD dwFlags);
export extern(Windows) LSTATUS SHRegWriteUSValueW(HUSKEY hUSKey, LPCWSTR pwzValue, DWORD dwType, const(void)* pvData, DWORD cbData, DWORD dwFlags);
export extern(Windows) LSTATUS SHRegDeleteUSValueA(HUSKEY hUSKey, LPCSTR pszValue, SHREGDEL_FLAGS delRegFlags);
export extern(Windows) LSTATUS SHRegDeleteUSValueW(HUSKEY hUSKey, LPCWSTR pwzValue, SHREGDEL_FLAGS delRegFlags);
export extern(Windows) LSTATUS SHRegDeleteEmptyUSKeyW(HUSKEY hUSKey, LPCWSTR pwzSubKey, SHREGDEL_FLAGS delRegFlags);
export extern(Windows) LSTATUS SHRegDeleteEmptyUSKeyA(HUSKEY hUSKey, LPCSTR pszSubKey, SHREGDEL_FLAGS delRegFlags);
export extern(Windows) LSTATUS SHRegEnumUSKeyA(HUSKEY hUSKey, DWORD dwIndex, LPSTR pszName, LPDWORD pcchName, SHREGENUM_FLAGS enumRegFlags);
export extern(Windows) LSTATUS SHRegEnumUSKeyW(HUSKEY hUSKey, DWORD dwIndex, LPWSTR pwzName, LPDWORD pcchName, SHREGENUM_FLAGS enumRegFlags);
export extern(Windows) LSTATUS SHRegEnumUSValueA(HUSKEY hUSkey, DWORD dwIndex, LPSTR pszValueName, LPDWORD pcchValueName, LPDWORD pdwType, void* pvData, LPDWORD pcbData, SHREGENUM_FLAGS enumRegFlags);
export extern(Windows) LSTATUS SHRegEnumUSValueW(HUSKEY hUSkey, DWORD dwIndex, LPWSTR pszValueName, LPDWORD pcchValueName, LPDWORD pdwType, void* pvData, LPDWORD pcbData, SHREGENUM_FLAGS enumRegFlags);
export extern(Windows) LSTATUS SHRegQueryInfoUSKeyA(HUSKEY hUSKey, LPDWORD pcSubKeys, LPDWORD pcchMaxSubKeyLen, LPDWORD pcValues, LPDWORD pcchMaxValueNameLen, SHREGENUM_FLAGS enumRegFlags);
export extern(Windows) LSTATUS SHRegQueryInfoUSKeyW(HUSKEY hUSKey, LPDWORD pcSubKeys, LPDWORD pcchMaxSubKeyLen, LPDWORD pcValues, LPDWORD pcchMaxValueNameLen, SHREGENUM_FLAGS enumRegFlags);
export extern(Windows) LSTATUS SHRegCloseUSKey(HUSKEY hUSKey);

export extern(Windows) LSTATUS SHRegGetUSValueA(LPCSTR pszSubKey, LPCSTR pszValue, DWORD* pdwType, void* pvData, DWORD* pcbData, BOOL fIgnoreHKCU, void* pvDefaultData, DWORD dwDefaultDataSize);
export extern(Windows) LSTATUS SHRegGetUSValueW(LPCWSTR pszSubKey, LPCWSTR pszValue, DWORD* pdwType, void* pvData, DWORD* pcbData, BOOL fIgnoreHKCU, void* pvDefaultData, DWORD dwDefaultDataSize);
export extern(Windows) LSTATUS SHRegSetUSValueA(LPCSTR pszSubKey, LPCSTR pszValue, DWORD dwType, const(void)* pvData, DWORD cbData, DWORD dwFlags);
export extern(Windows) LSTATUS SHRegSetUSValueW(LPCWSTR pwzSubKey, LPCWSTR pwzValue, DWORD dwType, const(void)* pvData, DWORD cbData, DWORD dwFlags);
export extern(Windows) int SHRegGetIntW(HKEY hk, PCWSTR pwzKey, int iDefault);

version(UNICODE){
	alias SHRegCreateUSKeyW SHRegCreateUSKey;
	alias SHRegOpenUSKeyW SHRegOpenUSKey;
	alias SHRegQueryUSValueW SHRegQueryUSValue;
	alias SHRegWriteUSValueW SHRegWriteUSValue;
	alias SHRegDeleteUSValueW SHRegDeleteUSValue;
	alias SHRegDeleteEmptyUSKeyW SHRegDeleteEmptyUSKey;
	alias SHRegEnumUSKeyW SHRegEnumUSKey;
	alias SHRegEnumUSValueW SHRegEnumUSValue;
	alias SHRegQueryInfoUSKeyW SHRegQueryInfoUSKey;
	alias SHRegGetUSValueW SHRegGetUSValue;
	alias SHRegSetUSValueW SHRegSetUSValue;
	alias SHRegGetIntW SHRegGetInt;
}else{
	alias SHRegCreateUSKeyA SHRegCreateUSKey;
	alias SHRegOpenUSKeyA SHRegOpenUSKey;
	alias SHRegQueryUSValueA SHRegQueryUSValue;
	alias SHRegWriteUSValueA SHRegWriteUSValue;
	alias SHRegDeleteUSValueA SHRegDeleteUSValue;
	alias SHRegDeleteEmptyUSKeyA SHRegDeleteEmptyUSKey;
	alias SHRegEnumUSKeyA SHRegEnumUSKey;
	alias SHRegEnumUSValueA SHRegEnumUSValue;
	alias SHRegQueryInfoUSKeyA SHRegQueryInfoUSKey;
	alias SHRegGetUSValueA SHRegGetUSValue;
	alias SHRegSetUSValueA SHRegSetUSValue;
}

export extern(Windows) BOOL SHRegGetBoolUSValueA(LPCSTR pszSubKey, LPCSTR pszValue, BOOL fIgnoreHKCU, BOOL fDefault);
export extern(Windows) BOOL SHRegGetBoolUSValueW(LPCWSTR pszSubKey, LPCWSTR pszValue, BOOL fIgnoreHKCU, BOOL fDefault);
version(UNICODE)
	alias SHRegGetBoolUSValueW SHRegGetBoolUSValue;
else
	alias SHRegGetBoolUSValueA SHRegGetBoolUSValue;

enum {
	ASSOCF_INIT_NOREMAPCLSID    = 0x00000001,
	ASSOCF_INIT_BYEXENAME       = 0x00000002,
	ASSOCF_OPEN_BYEXENAME       = 0x00000002,
	ASSOCF_INIT_DEFAULTTOSTAR   = 0x00000004,
	ASSOCF_INIT_DEFAULTTOFOLDER = 0x00000008,
	ASSOCF_NOUSERSETTINGS       = 0x00000010,
	ASSOCF_NOTRUNCATE           = 0x00000020,
	ASSOCF_VERIFY               = 0x00000040,
	ASSOCF_REMAPRUNDLL          = 0x00000080,
	ASSOCF_NOFIXUPS             = 0x00000100,
	ASSOCF_IGNOREBASECLASS      = 0x00000200,
	ASSOCF_INIT_IGNOREUNKNOWN   = 0x00000400,
}
alias DWORD ASSOCF;

enum {
	ASSOCSTR_COMMAND = 1,
	ASSOCSTR_EXECUTABLE,
	ASSOCSTR_FRIENDLYDOCNAME,
	ASSOCSTR_FRIENDLYAPPNAME,
	ASSOCSTR_NOOPEN,
	ASSOCSTR_SHELLNEWVALUE,
	ASSOCSTR_DDECOMMAND,
	ASSOCSTR_DDEIFEXEC,
	ASSOCSTR_DDEAPPLICATION,
	ASSOCSTR_DDETOPIC,
	ASSOCSTR_INFOTIP,
	ASSOCSTR_QUICKTIP,
	ASSOCSTR_TILEINFO,
	ASSOCSTR_CONTENTTYPE,
	ASSOCSTR_DEFAULTICON,
	ASSOCSTR_SHELLEXTENSION,
	//(_WIN32_IE >= _WIN32_IE_IE80)
		ASSOCSTR_DROPTARGET,
		ASSOCSTR_DELEGATEEXECUTE,
	ASSOCSTR_MAX
}
alias int ASSOCSTR;

enum {
	ASSOCKEY_SHELLEXECCLASS = 1,
	ASSOCKEY_APP,
	ASSOCKEY_CLASS,
	ASSOCKEY_BASECLASS,
	ASSOCKEY_MAX
}
alias int ASSOCKEY;

enum {
	ASSOCDATA_MSIDESCRIPTOR = 1,
	ASSOCDATA_NOACTIVATEHANDLER,
	ASSOCDATA_QUERYCLASSSTORE,
	ASSOCDATA_HASPERUSERASSOC,
	ASSOCDATA_EDITFLAGS,
	ASSOCDATA_VALUE,
	ASSOCDATA_MAX
}
alias int ASSOCDATA;

enum {
	ASSOCENUM_NONE
}
alias int ASSOCENUM;

//"c46ca590-3c3f-11d2-bee6-0000f805ca57"
interface IQueryAssociations : IUnknown {
public extern(Windows):
	HRESULT QueryInterface(REFIID riid, void** ppv);
	ULONG AddRef();
	ULONG Release();

	HRESULT Init(ASSOCF flags, LPCWSTR pszAssoc, HKEY hkProgid, HWND hwnd);
	HRESULT GetString(ASSOCF flags, ASSOCSTR str, LPCWSTR pszExtra, LPWSTR pszOut, DWORD* pcchOut);
	HRESULT GetKey(ASSOCF flags, ASSOCKEY key, LPCWSTR pszExtra, HKEY* phkeyOut);
	HRESULT GetData(ASSOCF flags, ASSOCDATA data, LPCWSTR pszExtra, void* pvOut, DWORD* pcbOut);
	HRESULT GetEnum(ASSOCF flags, ASSOCENUM assocenum, LPCWSTR pszExtra, REFIID riid, void** ppvOut);
}

export extern(Windows) HRESULT AssocCreate(CLSID clsid, REFIID riid, void** ppv);
export extern(Windows) HRESULT AssocQueryStringA(ASSOCF flags, ASSOCSTR str, LPCSTR pszAssoc, LPCSTR pszExtra, LPSTR pszOut, DWORD* pcchOut);
export extern(Windows) HRESULT AssocQueryStringW(ASSOCF flags, ASSOCSTR str, LPCWSTR pszAssoc, LPCWSTR pszExtra, LPWSTR pszOut, DWORD* pcchOut);
version(UNICODE)
	alias AssocQueryStringW AssocQueryString;
else
	alias AssocQueryStringA AssocQueryString;

export extern(Windows) HRESULT AssocQueryStringByKeyA(ASSOCF flags, ASSOCSTR str, HKEY hkAssoc, LPCSTR pszExtra, LPSTR pszOut, DWORD* pcchOut);
export extern(Windows) HRESULT AssocQueryStringByKeyW(ASSOCF flags, ASSOCSTR str, HKEY hkAssoc, LPCWSTR pszExtra, LPWSTR pszOut, DWORD* pcchOut);
version(UNICODE)
	alias AssocQueryStringByKeyW AssocQueryStringByKey;
else
	alias AssocQueryStringByKeyA AssocQueryStringByKey;

export extern(Windows) HRESULT AssocQueryKeyA(ASSOCF flags, ASSOCKEY key, LPCSTR pszAssoc, LPCSTR pszExtra, HKEY* phkeyOut);
export extern(Windows) HRESULT AssocQueryKeyW(ASSOCF flags, ASSOCKEY key, LPCWSTR pszAssoc, LPCWSTR pszExtra, HKEY* phkeyOut);
version(UNICODE)
	alias AssocQueryKeyW AssocQueryKey;
else
	alias AssocQueryKeyA AssocQueryKey;

export extern(Windows) BOOL AssocIsDangerous(LPCWSTR pszAssoc);
export extern(Windows) HRESULT AssocGetPerceivedType(LPCWSTR pszExt, PERCEIVED* ptype, PERCEIVEDFLAG* pflag, LPWSTR* ppszType);

export extern(Windows) IStream SHOpenRegStreamA(HKEY hkey, LPCSTR pszSubkey, LPCSTR pszValue, DWORD grfMode);
export extern(Windows) IStream SHOpenRegStreamW(HKEY hkey, LPCWSTR pszSubkey, LPCWSTR pszValue, DWORD grfMode);
version(UNICODE)
	alias SHOpenRegStreamW SHOpenRegStream;
else
	alias SHOpenRegStreamA SHOpenRegStream;

export extern(Windows) IStream SHOpenRegStream2A(HKEY hkey, LPCSTR pszSubkey, LPCSTR pszValue, DWORD grfMode);
export extern(Windows) IStream SHOpenRegStream2W(HKEY hkey, LPCWSTR pszSubkey, LPCWSTR pszValue, DWORD grfMode);
version(UNICODE)
	alias SHOpenRegStream2W SHOpenRegStream2;
else
	alias SHOpenRegStream2A SHOpenRegStream2;

alias SHOpenRegStream2 SHOpenRegStream;

export extern(Windows) HRESULT SHCreateStreamOnFileA(LPCSTR pszFile, DWORD grfMode, IStream* ppstm);
export extern(Windows) HRESULT SHCreateStreamOnFileW(LPCWSTR pszFile, DWORD grfMode, IStream* ppstm);
version(UNICODE)
	alias SHCreateStreamOnFileW SHCreateStreamOnFile;
else
	alias SHCreateStreamOnFileA SHCreateStreamOnFile;

export extern(Windows) HRESULT SHCreateStreamOnFileEx(LPCWSTR pszFile, DWORD grfMode, DWORD dwAttributes, BOOL fCreate, IStream pstmTemplate, IStream* ppstm);
export extern(Windows) IStream SHCreateMemStream(const(BYTE)* pInit, UINT cbInit);

export extern(Windows) HRESULT GetAcceptLanguagesA(LPSTR psz, DWORD* pcch);
export extern(Windows) HRESULT GetAcceptLanguagesW(LPWSTR psz, DWORD* pcch);
version(UNICODE)
	alias GetAcceptLanguagesW GetAcceptLanguages;
else
	alias GetAcceptLanguagesA GetAcceptLanguages;

//(_WIN32_IE < _WIN32_IE_IE70)
	enum {
		SPMODE_SHELL      = 0x00000001,
		SPMODE_DEBUGOUT   = 0x00000002,
		SPMODE_TEST       = 0x00000004,
		SPMODE_BROWSER    = 0x00000008,
		SPMODE_FLUSH      = 0x00000010,
		SPMODE_EVENT      = 0x00000020,
		SPMODE_MSVM       = 0x00000040,
		SPMODE_FORMATTEXT = 0x00000080,
		SPMODE_PROFILE    = 0x00000100,
		SPMODE_DEBUGBREAK = 0x00000200,
		SPMODE_MSGTRACE   = 0x00000400,
		SPMODE_PERFTAGS   = 0x00000800,
		SPMODE_MEMWATCH   = 0x00001000,
		SPMODE_DBMON      = 0x00002000,
		SPMODE_MULTISTOP  = 0x00004000,
		SPMODE_EVENTTRACE = 0x00008000,
	}

static if(_WIN32_IE < _WIN32_IE_IE70){
	export extern(Windows) DWORD StopWatchMode();
	export extern(Windows) DWORD StopWatchFlush();
}

export extern(Windows) void IUnknown_Set(IUnknown* ppunk, IUnknown punk);
export extern(Windows) void IUnknown_AtomicRelease(void** ppunk);
export extern(Windows) HRESULT IUnknown_GetWindow(IUnknown punk, HWND* phwnd);
export extern(Windows) HRESULT IUnknown_SetSite(IUnknown punk, IUnknown punkSite);
export extern(Windows) HRESULT IUnknown_GetSite(IUnknown punk, REFIID riid, void** ppv);
export extern(Windows) HRESULT IUnknown_QueryService(IUnknown punk, REFGUID guidService, REFIID riid, void** ppvOut);

export extern(Windows) HRESULT IStream_Read(IStream pstm, void* pv, ULONG cb);
export extern(Windows) HRESULT IStream_Write(IStream pstm, const(void)* pv, ULONG cb);
export extern(Windows) HRESULT IStream_Reset(IStream pstm);
export extern(Windows) HRESULT IStream_Size(IStream pstm, ULARGE_INTEGER* pui);
export extern(Windows) HRESULT ConnectToConnectionPoint(IUnknown punk, REFIID riidEvent, BOOL fConnect, IUnknown punkTarget, DWORD* pdwCookie, IConnectionPoint* ppcpOut);

export extern(Windows) HRESULT IStream_ReadPidl(IStream pstm, PIDLIST_RELATIVE* ppidlOut);
export extern(Windows) HRESULT IStream_WritePidl(IStream pstm, PCUIDLIST_RELATIVE pidlWrite);

static if(_WIN32_IE >= _WIN32_IE_IE70){
	export extern(Windows) HRESULT IStream_ReadStr(IStream pstm, PWSTR* ppsz);
	export extern(Windows) HRESULT IStream_WriteStr(IStream pstm, PCWSTR psz);
	export extern(Windows) HRESULT IStream_Copy(IStream pstmFrom, IStream pstmTo, DWORD cb);
}

enum {
	SHGVSPB_PERUSER          = 0x00000001,
	SHGVSPB_ALLUSERS         = 0x00000002,
	SHGVSPB_PERFOLDER        = 0x00000004,
	SHGVSPB_ALLFOLDERS       = 0x00000008,
	SHGVSPB_INHERIT          = 0x00000010,
	SHGVSPB_ROAM             = 0x00000020,
	SHGVSPB_NOAUTODEFAULTS   = 0x80000000,
	SHGVSPB_FOLDER           = SHGVSPB_PERUSER | SHGVSPB_PERFOLDER,
	SHGVSPB_FOLDERNODEFAULTS = SHGVSPB_PERUSER | SHGVSPB_PERFOLDER | SHGVSPB_NOAUTODEFAULTS,
	SHGVSPB_USERDEFAULTS     = SHGVSPB_PERUSER | SHGVSPB_ALLFOLDERS,
	SHGVSPB_GLOBALDEFAULTS   = SHGVSPB_ALLUSERS | SHGVSPB_ALLFOLDERS,
}
export extern(Windows) HRESULT SHGetViewStatePropertyBag(PCIDLIST_ABSOLUTE pidl, LPCWSTR pszBagName, DWORD dwFlags, REFIID riid, void** ppv);

enum {
	FDTF_SHORTTIME          = 0x00000001,
	FDTF_SHORTDATE          = 0x00000002,
	FDTF_DEFAULT            = FDTF_SHORTDATE | FDTF_SHORTTIME,
	FDTF_LONGDATE           = 0x00000004,
	FDTF_LONGTIME           = 0x00000008,
	FDTF_RELATIVE           = 0x00000010,
	FDTF_LTRDATE            = 0x00000100,
	FDTF_RTLDATE            = 0x00000200,
	FDTF_NOAUTOREADINGORDER = 0x00000400,
}

export extern(Windows) int SHFormatDateTimeA(const(FILETIME)* pft, DWORD* pdwFlags, LPSTR pszBuf, UINT cchBuf);
export extern(Windows) int SHFormatDateTimeW(const(FILETIME)* pft, DWORD* pdwFlags, LPWSTR pszBuf, UINT cchBuf);
version(UNICODE)
	alias SHFormatDateTimeW SHFormatDateTime;
else
	alias SHFormatDateTimeA SHFormatDateTime;

export extern(Windows) int SHAnsiToUnicode(LPCSTR pszSrc, LPWSTR pwszDst, int cwchBuf);
export extern(Windows) int SHAnsiToAnsi(LPCSTR pszSrc, LPSTR pszDst, int cchBuf);
export extern(Windows) int SHUnicodeToAnsi(LPCWSTR pwszSrc, LPSTR pszDst, int cchBuf);
export extern(Windows) int SHUnicodeToUnicode(LPCWSTR pwzSrc, LPWSTR pwzDst, int cwchBuf);
version(UNICODE){
	alias SHUnicodeToUnicode SHTCharToUnicode;
	alias SHUnicodeToAnsi SHTCharToAnsi;
	alias SHUnicodeToUnicode SHUnicodeToTChar;
	alias SHAnsiToUnicode SHAnsiToTChar;
}else{
	alias SHAnsiToUnicode SHTCharToUnicode;
	alias SHAnsiToAnsi SHTCharToAnsi;
	alias SHUnicodeToAnsi SHUnicodeToTChar;
	alias SHAnsiToAnsi SHAnsiToTChar;
}

export extern(Windows) int SHMessageBoxCheckA(HWND hwnd, LPCSTR pszText, LPCSTR pszCaption, UINT uType, int iDefault, LPCSTR pszRegVal);
export extern(Windows) int SHMessageBoxCheckW(HWND hwnd, LPCWSTR pszText, LPCWSTR pszCaption, UINT uType, int iDefault, LPCWSTR pszRegVal);
version(UNICODE)
	alias SHMessageBoxCheckW SHMessageBoxCheck;
else
	alias SHMessageBoxCheckA SHMessageBoxCheck;

export extern(Windows) LRESULT SHSendMessageBroadcastA(UINT uMsg, WPARAM wParam, LPARAM lParam);
export extern(Windows) LRESULT SHSendMessageBroadcastW(UINT uMsg, WPARAM wParam, LPARAM lParam);
version(UNICODE)
	alias SHSendMessageBroadcastW SHSendMessageBroadcast;
else
	alias SHSendMessageBroadcastA SHSendMessageBroadcast;

export extern(Windows) CHAR SHStripMneumonicA(LPSTR pszMenu);
export extern(Windows) WCHAR SHStripMneumonicW(LPWSTR pszMenu);
version(UNICODE)
	alias SHStripMneumonicW SHStripMneumonic;
else
	alias SHStripMneumonicA SHStripMneumonic;

enum  {
	OS_WINDOWS                = 0,
	OS_NT                     = 1,
	OS_WIN95ORGREATER         = 2,
	OS_NT4ORGREATER           = 3,
	OS_WIN98ORGREATER         = 5,
	OS_WIN98_GOLD             = 6,
	OS_WIN2000ORGREATER       = 7,
	OS_WIN2000PRO             = 8,
	OS_WIN2000SERVER          = 9,
	OS_WIN2000ADVSERVER       = 10,
	OS_WIN2000DATACENTER      = 11,
	OS_WIN2000TERMINAL        = 12,
	OS_EMBEDDED               = 13,
	OS_TERMINALCLIENT         = 14,
	OS_TERMINALREMOTEADMIN    = 15,
	OS_WIN95_GOLD             = 16,
	OS_MEORGREATER            = 17,
	OS_XPORGREATER            = 18,
	OS_HOME                   = 19,
	OS_PROFESSIONAL           = 20,
	OS_DATACENTER             = 21,
	OS_ADVSERVER              = 22,
	OS_SERVER                 = 23,
	OS_TERMINALSERVER         = 24,
	OS_PERSONALTERMINALSERVER = 25,
	OS_FASTUSERSWITCHING      = 26,
	OS_WELCOMELOGONUI         = 27,
	OS_DOMAINMEMBER           = 28,
	OS_ANYSERVER              = 29,
	OS_WOW6432                = 30,
	OS_WEBSERVER              = 31,
	OS_SMALLBUSINESSSERVER    = 32,
	OS_TABLETPC               = 33,
	OS_SERVERADMINUI          = 34,
	OS_MEDIACENTER            = 35,
	OS_APPLIANCE              = 36,
}

export extern(Windows) BOOL IsOS(DWORD dwOS);

enum {
	GLOBALCOUNTER_SEARCHMANAGER,
	GLOBALCOUNTER_SEARCHOPTIONS,
	GLOBALCOUNTER_FOLDERSETTINGSCHANGE,
	GLOBALCOUNTER_RATINGS,
	GLOBALCOUNTER_APPROVEDSITES,
	GLOBALCOUNTER_RESTRICTIONS,
	GLOBALCOUNTER_SHELLSETTINGSCHANGED,
	GLOBALCOUNTER_SYSTEMPIDLCHANGE,
	GLOBALCOUNTER_OVERLAYMANAGER,
	GLOBALCOUNTER_QUERYASSOCIATIONS,
	GLOBALCOUNTER_IESESSIONS,
	GLOBALCOUNTER_IEONLY_SESSIONS,
	GLOBALCOUNTER_APPLICATION_DESTINATIONS,
	__UNUSED_RECYCLE_WAS_GLOBALCOUNTER_CSCSYNCINPROGRESS,
	GLOBALCOUNTER_BITBUCKETNUMDELETERS,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_SHARES,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_A,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_B,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_C,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_D,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_E,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_F,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_G,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_H,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_I,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_J,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_K,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_L,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_M,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_N,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_O,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_P,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_Q,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_R,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_S,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_T,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_U,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_V,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_W,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_X,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_Y,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_Z,
	__UNUSED_RECYCLE_WAS_GLOBALCOUNTER_RECYCLEDIRTYCOUNT_SERVERDRIVE,
	__UNUSED_RECYCLE_WAS_GLOBALCOUNTER_RECYCLEGLOBALDIRTYCOUNT,
	GLOBALCOUNTER_RECYCLEBINENUM,
	GLOBALCOUNTER_RECYCLEBINCORRUPTED,
	GLOBALCOUNTER_RATINGS_STATECOUNTER,
	GLOBALCOUNTER_PRIVATE_PROFILE_CACHE,
	GLOBALCOUNTER_INTERNETTOOLBAR_LAYOUT,
	GLOBALCOUNTER_FOLDERDEFINITION_CACHE,
	GLOBALCOUNTER_COMMONPLACES_LIST_CACHE,
	GLOBALCOUNTER_PRIVATE_PROFILE_CACHE_MACHINEWIDE,
	GLOBALCOUNTER_ASSOCCHANGED,
	GLOBALCOUNTER_MAXIMUMVALUE
}
alias int SHGLOBALCOUNTER;

export extern(Windows) int SHGlobalCounterGetValue(SHGLOBALCOUNTER id);
export extern(Windows) int SHGlobalCounterIncrement(SHGLOBALCOUNTER id);
export extern(Windows) int SHGlobalCounterDecrement(SHGLOBALCOUNTER id);

export extern(Windows) HANDLE SHAllocShared(const(void)* pvData, DWORD dwSize, DWORD dwProcessId);
export extern(Windows) BOOL SHFreeShared(HANDLE hData, DWORD dwProcessId);
export extern(Windows) void* SHLockShared(HANDLE hData, DWORD dwProcessId);
export extern(Windows) BOOL SHUnlockShared(void* pvData);

export extern(Windows) UINT WhichPlatform();

enum {
	PLATFORM_UNKNOWN     = 0,
	PLATFORM_IE3         = 1,
	PLATFORM_BROWSERONLY = 1,
	PLATFORM_INTEGRATED  = 2,
}

struct QITAB {
	const(IID)* piid;
	int dwOffset;
}
alias QITAB* LPQITAB;
alias const(QITAB)* LPCQITAB;

//	QITABENTMULTI(Cthis, Ifoo, Iimpl) 			 { (IID*) &IID_##Ifoo, OFFSETOFCLASS(Iimpl, Cthis) }
//	QITABENTMULTI2(Cthis, Ifoo, Iimpl) 		 { (IID*) &Ifoo, OFFSETOFCLASS(Iimpl, Cthis) }
//	QITABENT(Cthis, Ifoo) QITABENTMULTI(Cthis, Ifoo, Ifoo)

export extern(Windows) HRESULT QISearch(void* that, LPCQITAB pqit, REFIID riid, void** ppv);


enum ILMM_IE4 = 0;
export extern(Windows) BOOL SHIsLowMemoryMachine(DWORD dwType);
export extern(Windows) int GetMenuPosFromID(HMENU hmenu, UINT id);
export extern(Windows) HRESULT SHGetInverseCMAP(BYTE* pbMap, ULONG cbMap);

enum {
	SHACF_DEFAULT               = 0x00000000,
	SHACF_FILESYSTEM            = 0x00000001,
	SHACF_URLHISTORY            = 0x00000002,
	SHACF_URLMRU                = 0x00000004,
	SHACF_URLALL                = SHACF_URLHISTORY | SHACF_URLMRU,
	SHACF_USETAB                = 0x00000008,
	SHACF_FILESYS_ONLY          = 0x00000010,
	SHACF_FILESYS_DIRS          = 0x00000020,
	//(_WIN32_IE >= _WIN32_IE_IE70)
		SHACF_VIRTUAL_NAMESPACE = 0x00000040,
	SHACF_AUTOSUGGEST_FORCE_ON  = 0x10000000,
	SHACF_AUTOSUGGEST_FORCE_OFF = 0x20000000,
	SHACF_AUTOAPPEND_FORCE_ON   = 0x40000000,
	SHACF_AUTOAPPEND_FORCE_OFF  = 0x80000000,
}

export extern(Windows) HRESULT SHAutoComplete(HWND hwndEdit, DWORD dwFlags);
export extern(Windows) HRESULT SHCreateThreadRef(LONG* pcRef, IUnknown* ppunk);
export extern(Windows) HRESULT SHSetThreadRef(IUnknown punk);
export extern(Windows) HRESULT SHGetThreadRef(IUnknown* ppunk);
export extern(Windows) BOOL SHSkipJunction(IBindCtx pbc, const(CLSID)* pclsid);


enum {
	CTF_INSIST         = 0x00000001,
	CTF_THREAD_REF     = 0x00000002,
	CTF_PROCESS_REF    = 0x00000004,
	CTF_COINIT_STA     = 0x00000008,
	CTF_COINIT         = 0x00000008,
	CTF_FREELIBANDEXIT = 0x00000010,
	CTF_REF_COUNTED    = 0x00000020,
	CTF_WAIT_ALLOWCOM  = 0x00000040,
	//(_WIN32_IE >= _WIN32_IE_IE70)
		CTF_UNUSED       = 0x00000080,
		CTF_INHERITWOW64 = 0x00000100,
	//(NTDDI_VERSION >= NTDDI_VISTA)
		CTF_WAIT_NO_REENTRANCY = 0x00000200,
	//(NTDDI_VERSION >= NTDDI_WIN7)
		CTF_KEYBOARD_LOCALE = 0x00000400,
		CTF_OLEINITIALIZE   = 0x00000800,
		CTF_COINIT_MTA      = 0x00001000,
		CTF_NOADDREFLIB     = 0x00002000,
}
alias DWORD SHCT_FLAGS;

export extern(Windows) BOOL SHCreateThread(LPTHREAD_START_ROUTINE pfnThreadProc, void* pData, SHCT_FLAGS flags, LPTHREAD_START_ROUTINE pfnCallback);
export extern(Windows) BOOL SHCreateThreadWithHandle(LPTHREAD_START_ROUTINE pfnThreadProc, void* pData, SHCT_FLAGS flags, LPTHREAD_START_ROUTINE pfnCallback, HANDLE* pHandle);
export extern(Windows) HRESULT SHReleaseThreadRef();
export extern(Windows) HPALETTE SHCreateShellPalette(HDC hdc);
export extern(Windows) void ColorRGBToHLS(COLORREF clrRGB, WORD* pwHue, WORD* pwLuminance, WORD* pwSaturation);
export extern(Windows) COLORREF ColorHLSToRGB(WORD wHue, WORD wLuminance, WORD wSaturation);
export extern(Windows) COLORREF ColorAdjustLuma(COLORREF clrRGB, int n, BOOL fScale);

struct DLLVERSIONINFO {
	DWORD cbSize;
	DWORD dwMajorVersion;
	DWORD dwMinorVersion;
	DWORD dwBuildNumber;
	DWORD dwPlatformID;
}
enum {
	DLLVER_PLATFORM_WINDOWS = 0x00000001,
	DLLVER_PLATFORM_NT      = 0x00000002,
}

struct DLLVERSIONINFO2 {
	DLLVERSIONINFO info1;
	DWORD dwFlags;
	ULONGLONG ullVersion;
}
enum {
	DLLVER_MAJOR_MASK = 0xFFFF000000000000,
	DLLVER_MINOR_MASK = 0x0000FFFF00000000,
	DLLVER_BUILD_MASK = 0x00000000FFFF0000,
	DLLVER_QFE_MASK   = 0x000000000000FFFF,
}

pure nothrow
ULONGLONG MAKEDLLVERULL(WORD major, WORD minor, WORD build, WORD qfe)
{
	return ((cast(ULONGLONG)major << 48) | (cast(ULONGLONG)minor << 32) | (cast(ULONGLONG)build << 16) | (cast(ULONGLONG)qfe << 0));
}

alias extern(Windows) HRESULT function(DLLVERSIONINFO*) DLLGETVERSIONPROC;
export extern(Windows) HRESULT DllInstall(BOOL bInstall, LPCWSTR pszCmdLine);

export extern(Windows) BOOL IsInternetESCEnabled();


}// extern(C)

