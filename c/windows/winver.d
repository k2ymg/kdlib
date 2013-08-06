/** winver.d

Converted from 'winver.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.winver;


import c.windows.windef;


extern(C){

export extern(Windows){
	DWORD VerFindFileA(DWORD uFlags, LPCSTR szFileName, LPCSTR szWinDir, LPCSTR szAppDir, LPSTR szCurDir, PUINT lpuCurDirLen, LPSTR szDestDir, PUINT lpuDestDirLen);
	DWORD VerFindFileW(DWORD uFlags, LPCWSTR szFileName, LPCWSTR szWinDir, LPCWSTR szAppDir, LPWSTR szCurDir, PUINT lpuCurDirLen, LPWSTR szDestDir, PUINT lpuDestDirLen);
}
version(UNICODE)
	alias VerFindFileW VerFindFile;
else
	alias VerFindFileA VerFindFile;

export extern(Windows){
	DWORD VerInstallFileA(DWORD uFlags, LPCSTR szSrcFileName, LPCSTR szDestFileName, LPCSTR szSrcDir, LPCSTR szDestDir, LPCSTR szCurDir, LPSTR szTmpFile, PUINT lpuTmpFileLen);
	DWORD VerInstallFileW(DWORD uFlags, LPCWSTR szSrcFileName, LPCWSTR szDestFileName, LPCWSTR szSrcDir, LPCWSTR szDestDir, LPCWSTR szCurDir, LPWSTR szTmpFile, PUINT lpuTmpFileLen);
}
version(UNICODE)
	alias VerInstallFileW VerInstallFile;
else
	alias VerInstallFileA VerInstallFile;

export extern(Windows){
	DWORD GetFileVersionInfoSizeA(LPCSTR lptstrFilename, LPDWORD lpdwHandle);
	DWORD GetFileVersionInfoSizeW(LPCWSTR lptstrFilename, LPDWORD lpdwHandle);
}
version(UNICODE)
	alias GetFileVersionInfoSizeW GetFileVersionInfoSize;
else
	alias GetFileVersionInfoSizeA GetFileVersionInfoSize;

export extern(Windows){
	BOOL GetFileVersionInfoA(LPCSTR lptstrFilename, DWORD dwHandle, DWORD dwLen, LPVOID lpData);
	BOOL GetFileVersionInfoW(LPCWSTR lptstrFilename, DWORD dwHandle, DWORD dwLen, LPVOID lpData);
}
version(UNICODE)
	alias GetFileVersionInfoW GetFileVersionInfo;
else
	alias GetFileVersionInfoA GetFileVersionInfo;

export extern(Windows){
	DWORD GetFileVersionInfoSizeExA(DWORD dwFlags, LPCSTR lpwstrFilename, LPDWORD lpdwHandle);
	DWORD GetFileVersionInfoSizeExW(DWORD dwFlags, LPCWSTR lpwstrFilename, LPDWORD lpdwHandle);
}
version(UNICODE)
	alias GetFileVersionInfoSizeExW GetFileVersionInfoSizeEx;
else
	alias GetFileVersionInfoSizeExA GetFileVersionInfoSizeEx;

export extern(Windows){
	BOOL GetFileVersionInfoExA(DWORD dwFlags, LPCSTR lpwstrFilename, DWORD dwHandle, DWORD dwLen, LPVOID lpData);
	BOOL GetFileVersionInfoExW(DWORD dwFlags, LPCWSTR lpwstrFilename, DWORD dwHandle, DWORD dwLen, LPVOID lpData);
}
version(UNICODE)
	alias GetFileVersionInfoExW GetFileVersionInfoEx;
else
	alias GetFileVersionInfoExA GetFileVersionInfoEx;

export extern(Windows){
	DWORD VerLanguageNameA(DWORD wLang, LPSTR szLang, DWORD cchLang);
	DWORD VerLanguageNameW(DWORD wLang, LPWSTR szLang, DWORD cchLang);
}
version(UNICODE)
	alias VerLanguageNameW VerLanguageName;
else
	alias VerLanguageNameA VerLanguageName;

export extern(Windows){
	BOOL VerQueryValueA(LPCVOID pBlock, LPCSTR lpSubBlock, LPVOID* lplpBuffer, PUINT puLen);
	BOOL VerQueryValueW(LPCVOID pBlock, LPCWSTR lpSubBlock, LPVOID* lplpBuffer, PUINT puLen);
}
version(UNICODE)
	alias VerQueryValueW VerQueryValue;
else
	alias VerQueryValueA VerQueryValue;

}// extern(C)
