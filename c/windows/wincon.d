/** wincon.d

Converted from 'wincon.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.wincon;


import c.windows.sdkddkver;
import c.windows.windef;
import c.windows.basetsd;
import c.windows.wingdi;
import c.windows.winbase;


extern(C){

struct COORD {
	SHORT X;
	SHORT Y;
}
alias COORD* PCOORD;

struct SMALL_RECT {
	SHORT Left;
	SHORT Top;
	SHORT Right;
	SHORT Bottom;
}
alias SMALL_RECT* PSMALL_RECT;

struct KEY_EVENT_RECORD {
	BOOL bKeyDown;
	WORD wRepeatCount;
	WORD wVirtualKeyCode;
	WORD wVirtualScanCode;
	union {
		WCHAR UnicodeChar;
		CHAR AsciiChar;
	}
	DWORD dwControlKeyState;
}
alias KEY_EVENT_RECORD* PKEY_EVENT_RECORD;

enum {
	RIGHT_ALT_PRESSED  = 0x0001,
	LEFT_ALT_PRESSED   = 0x0002,
	RIGHT_CTRL_PRESSED = 0x0004,
	LEFT_CTRL_PRESSED  = 0x0008,
	SHIFT_PRESSED      = 0x0010,
	NUMLOCK_ON         = 0x0020,
	SCROLLLOCK_ON      = 0x0040,
	CAPSLOCK_ON        = 0x0080,
	ENHANCED_KEY       = 0x0100,
	NLS_DBCSCHAR       = 0x00010000,
	NLS_ALPHANUMERIC   = 0x00000000,
	NLS_KATAKANA       = 0x00020000,
	NLS_HIRAGANA       = 0x00040000,
	NLS_ROMAN          = 0x00400000,
	NLS_IME_CONVERSION = 0x00800000,
	NLS_IME_DISABLE    = 0x20000000,
}

struct MOUSE_EVENT_RECORD {
	COORD dwMousePosition;
	DWORD dwButtonState;
	DWORD dwControlKeyState;
	DWORD dwEventFlags;
}
alias  MOUSE_EVENT_RECORD* PMOUSE_EVENT_RECORD;

enum {
	FROM_LEFT_1ST_BUTTON_PRESSED = 0x0001,
	RIGHTMOST_BUTTON_PRESSED     = 0x0002,
	FROM_LEFT_2ND_BUTTON_PRESSED = 0x0004,
	FROM_LEFT_3RD_BUTTON_PRESSED = 0x0008,
	FROM_LEFT_4TH_BUTTON_PRESSED = 0x0010,
}

enum {
	MOUSE_MOVED   = 0x0001,
	DOUBLE_CLICK  = 0x0002,
	MOUSE_WHEELED = 0x0004,
	//(_WIN32_WINNT >= _WIN32_WINNT_VISTA)
		MOUSE_HWHEELED = 0x0008,
}

struct WINDOW_BUFFER_SIZE_RECORD {
	COORD dwSize;
}
alias WINDOW_BUFFER_SIZE_RECORD* PWINDOW_BUFFER_SIZE_RECORD;

struct MENU_EVENT_RECORD {
	UINT dwCommandId;
}
alias MENU_EVENT_RECORD* PMENU_EVENT_RECORD;

struct FOCUS_EVENT_RECORD {
	BOOL bSetFocus;
}
alias FOCUS_EVENT_RECORD* PFOCUS_EVENT_RECORD;

struct INPUT_RECORD {
	WORD EventType;
	union {
		KEY_EVENT_RECORD KeyEvent;
		MOUSE_EVENT_RECORD MouseEvent;
		WINDOW_BUFFER_SIZE_RECORD WindowBufferSizeEvent;
		MENU_EVENT_RECORD MenuEvent;
		FOCUS_EVENT_RECORD FocusEvent;
	}
}
alias INPUT_RECORD* PINPUT_RECORD;

enum {
	KEY_EVENT                = 0x0001,
	MOUSE_EVENT              = 0x0002,
	WINDOW_BUFFER_SIZE_EVENT = 0x0004,
	MENU_EVENT               = 0x0008,
	FOCUS_EVENT              = 0x0010,
}

struct CHAR_INFO {
	union {
		WCHAR UnicodeChar;
		CHAR AsciiChar;
	}
	WORD Attributes;
}
alias CHAR_INFO* PCHAR_INFO;

enum {
	FOREGROUND_BLUE            = 0x0001,
	FOREGROUND_GREEN           = 0x0002,
	FOREGROUND_RED             = 0x0004,
	FOREGROUND_INTENSITY       = 0x0008,
	BACKGROUND_BLUE            = 0x0010,
	BACKGROUND_GREEN           = 0x0020,
	BACKGROUND_RED             = 0x0040,
	BACKGROUND_INTENSITY       = 0x0080,
	COMMON_LVB_LEADING_BYTE    = 0x0100,
	COMMON_LVB_TRAILING_BYTE   = 0x0200,
	COMMON_LVB_GRID_HORIZONTAL = 0x0400,
	COMMON_LVB_GRID_LVERTICAL  = 0x0800,
	COMMON_LVB_GRID_RVERTICAL  = 0x1000,
	COMMON_LVB_REVERSE_VIDEO   = 0x4000,
	COMMON_LVB_UNDERSCORE      = 0x8000,
	COMMON_LVB_SBCSDBCS        = 0x0300,
}

struct CONSOLE_SCREEN_BUFFER_INFO {
	COORD dwSize;
	COORD dwCursorPosition;
	WORD wAttributes;
	SMALL_RECT srWindow;
	COORD dwMaximumWindowSize;
}
alias CONSOLE_SCREEN_BUFFER_INFO* PCONSOLE_SCREEN_BUFFER_INFO;

struct CONSOLE_SCREEN_BUFFER_INFOEX {
	ULONG cbSize;
	COORD dwSize;
	COORD dwCursorPosition;
	WORD wAttributes;
	SMALL_RECT srWindow;
	COORD dwMaximumWindowSize;
	WORD wPopupAttributes;
	BOOL bFullscreenSupported;
	COLORREF[16] ColorTable;
}
alias CONSOLE_SCREEN_BUFFER_INFOEX* PCONSOLE_SCREEN_BUFFER_INFOEX;

struct CONSOLE_CURSOR_INFO {
	DWORD dwSize;
	BOOL bVisible;
}
alias CONSOLE_CURSOR_INFO* PCONSOLE_CURSOR_INFO;

struct CONSOLE_FONT_INFO {
	DWORD nFont;
	COORD dwFontSize;
}
alias CONSOLE_FONT_INFO* PCONSOLE_FONT_INFO;

struct CONSOLE_FONT_INFOEX {
	ULONG cbSize;
	DWORD nFont;
	COORD dwFontSize;
	UINT FontFamily;
	UINT FontWeight;
	WCHAR[LF_FACESIZE] FaceName;
}
alias CONSOLE_FONT_INFOEX* PCONSOLE_FONT_INFOEX;

enum HISTORY_NO_DUP_FLAG = 0x1;

struct CONSOLE_HISTORY_INFO {
	UINT cbSize;
	UINT HistoryBufferSize;
	UINT NumberOfHistoryBuffers;
	DWORD dwFlags;
}
alias CONSOLE_HISTORY_INFO* PCONSOLE_HISTORY_INFO;

struct CONSOLE_SELECTION_INFO {
	DWORD dwFlags;
	COORD dwSelectionAnchor;
	SMALL_RECT srSelection;
}
alias CONSOLE_SELECTION_INFO* PCONSOLE_SELECTION_INFO;

enum {
	CONSOLE_NO_SELECTION          = 0x0000,
	CONSOLE_SELECTION_IN_PROGRESS = 0x0001,
	CONSOLE_SELECTION_NOT_EMPTY   = 0x0002,
	CONSOLE_MOUSE_SELECTION       = 0x0004,
	CONSOLE_MOUSE_DOWN            = 0x0008,
}

alias extern(Windows) BOOL function(DWORD CtrlType) PHANDLER_ROUTINE;

enum {
	CTRL_C_EVENT        = 0,
	CTRL_BREAK_EVENT    = 1,
	CTRL_CLOSE_EVENT    = 2,
	CTRL_LOGOFF_EVENT   = 5,
	CTRL_SHUTDOWN_EVENT = 6,
}
enum {
	ENABLE_PROCESSED_INPUT    = 0x0001,
	ENABLE_LINE_INPUT         = 0x0002,
	ENABLE_ECHO_INPUT         = 0x0004,
	ENABLE_WINDOW_INPUT       = 0x0008,
	ENABLE_MOUSE_INPUT        = 0x0010,
	ENABLE_INSERT_MODE        = 0x0020,
	ENABLE_QUICK_EDIT_MODE    = 0x0040,
	ENABLE_EXTENDED_FLAGS     = 0x0080,
	ENABLE_AUTO_POSITION      = 0x0100,
	ENABLE_PROCESSED_OUTPUT   = 0x0001,
	ENABLE_WRAP_AT_EOL_OUTPUT = 0x0002,
}

export extern(Windows) BOOL PeekConsoleInputA(HANDLE hConsoleInput, PINPUT_RECORD lpBuffer, DWORD nLength, LPDWORD lpNumberOfEventsRead);
export extern(Windows) BOOL PeekConsoleInputW(HANDLE hConsoleInput, PINPUT_RECORD lpBuffer, DWORD nLength, LPDWORD lpNumberOfEventsRead);
version(UNICODE)
	alias PeekConsoleInputW PeekConsoleInput;
else
	alias PeekConsoleInputA PeekConsoleInput;

export extern(Windows) BOOL ReadConsoleInputA(HANDLE hConsoleInput, PINPUT_RECORD lpBuffer, DWORD nLength, LPDWORD lpNumberOfEventsRead);
export extern(Windows) BOOL ReadConsoleInputW(HANDLE hConsoleInput, PINPUT_RECORD lpBuffer, DWORD nLength, LPDWORD lpNumberOfEventsRead);
version(UNICODE)
	alias ReadConsoleInputW ReadConsoleInput;
else
	alias ReadConsoleInputA ReadConsoleInput;

export extern(Windows) BOOL WriteConsoleInputA(HANDLE hConsoleInput, const(INPUT_RECORD)* lpBuffer, DWORD nLength, LPDWORD lpNumberOfEventsWritten);
export extern(Windows) BOOL WriteConsoleInputW(HANDLE hConsoleInput, const(INPUT_RECORD)* lpBuffer, DWORD nLength, LPDWORD lpNumberOfEventsWritten);
version(UNICODE)
	alias WriteConsoleInputW WriteConsoleInput;
else
	alias WriteConsoleInputA WriteConsoleInput;

export extern(Windows) BOOL ReadConsoleOutputA(HANDLE hConsoleOutput, PCHAR_INFO lpBuffer, COORD dwBufferSize, COORD dwBufferCoord, PSMALL_RECT lpReadRegion);
export extern(Windows) BOOL ReadConsoleOutputW(HANDLE hConsoleOutput, PCHAR_INFO lpBuffer, COORD dwBufferSize, COORD dwBufferCoord, PSMALL_RECT lpReadRegion);
version(UNICODE)
	alias ReadConsoleOutputW ReadConsoleOutput;
else
	alias ReadConsoleOutputA ReadConsoleOutput;

export extern(Windows) BOOL WriteConsoleOutputA(HANDLE hConsoleOutput, const(CHAR_INFO)* lpBuffer, COORD dwBufferSize, COORD dwBufferCoord, PSMALL_RECT lpWriteRegion);
export extern(Windows) BOOL WriteConsoleOutputW(HANDLE hConsoleOutput, const(CHAR_INFO)* lpBuffer, COORD dwBufferSize, COORD dwBufferCoord, PSMALL_RECT lpWriteRegion);
version(UNICODE)
	alias WriteConsoleOutputW WriteConsoleOutput;
else
	alias WriteConsoleOutputA WriteConsoleOutput;

export extern(Windows) BOOL ReadConsoleOutputCharacterA(HANDLE hConsoleOutput, LPSTR lpCharacter, DWORD nLength, COORD dwReadCoord, LPDWORD lpNumberOfCharsRead);
export extern(Windows) BOOL ReadConsoleOutputCharacterW(HANDLE hConsoleOutput, LPWSTR lpCharacter, DWORD nLength, COORD dwReadCoord, LPDWORD lpNumberOfCharsRead);
version(UNICODE)
	alias ReadConsoleOutputCharacterW ReadConsoleOutputCharacter;
else
	alias ReadConsoleOutputCharacterA ReadConsoleOutputCharacter;

export extern(Windows) BOOL ReadConsoleOutputAttribute(HANDLE hConsoleOutput, LPWORD lpAttribute, DWORD nLength, COORD dwReadCoord, LPDWORD lpNumberOfAttrsRead);

export extern(Windows) BOOL WriteConsoleOutputCharacterA(HANDLE hConsoleOutput, LPCSTR lpCharacter, DWORD nLength, COORD dwWriteCoord, LPDWORD lpNumberOfCharsWritten);
export extern(Windows) BOOL WriteConsoleOutputCharacterW(HANDLE hConsoleOutput, LPCWSTR lpCharacter, DWORD nLength, COORD dwWriteCoord, LPDWORD lpNumberOfCharsWritten);
version(UNICODE)
	alias WriteConsoleOutputCharacterW WriteConsoleOutputCharacter;
else
	alias WriteConsoleOutputCharacterA WriteConsoleOutputCharacter;

export extern(Windows) BOOL WriteConsoleOutputAttribute(HANDLE hConsoleOutput, const(WORD)* lpAttribute, DWORD nLength, COORD dwWriteCoord, LPDWORD lpNumberOfAttrsWritten);
export extern(Windows) BOOL FillConsoleOutputCharacterA(HANDLE hConsoleOutput, CHAR cCharacter, DWORD nLength, COORD dwWriteCoord, LPDWORD lpNumberOfCharsWritten);
export extern(Windows) BOOL FillConsoleOutputCharacterW(HANDLE hConsoleOutput, WCHAR cCharacter, DWORD nLength, COORD dwWriteCoord, LPDWORD lpNumberOfCharsWritten);
version(UNICODE)
	alias FillConsoleOutputCharacterW FillConsoleOutputCharacter;
else
	alias FillConsoleOutputCharacterA FillConsoleOutputCharacter;

export extern(Windows) BOOL FillConsoleOutputAttribute(HANDLE hConsoleOutput, WORD wAttribute, DWORD nLength, COORD dwWriteCoord, LPDWORD lpNumberOfAttrsWritten);
export extern(Windows) BOOL GetConsoleMode(HANDLE hConsoleHandle, LPDWORD lpMode);
export extern(Windows) BOOL GetNumberOfConsoleInputEvents(HANDLE hConsoleInput, LPDWORD lpNumberOfEvents);

const HANDLE CONSOLE_REAL_OUTPUT_HANDLE = cast(HANDLE)cast(void*)-2;//LongToHandle(-2); todo DMD bug
const HANDLE CONSOLE_REAL_INPUT_HANDLE = cast(HANDLE)cast(void*)-3;//LongToHandle(-3); toto DMD bug

export extern(Windows) BOOL GetConsoleScreenBufferInfo(HANDLE hConsoleOutput, PCONSOLE_SCREEN_BUFFER_INFO lpConsoleScreenBufferInfo);
export extern(Windows) BOOL GetConsoleScreenBufferInfoEx(HANDLE hConsoleOutput, PCONSOLE_SCREEN_BUFFER_INFOEX lpConsoleScreenBufferInfoEx);
export extern(Windows) BOOL SetConsoleScreenBufferInfoEx(HANDLE hConsoleOutput, PCONSOLE_SCREEN_BUFFER_INFOEX lpConsoleScreenBufferInfoEx);
export extern(Windows) COORD GetLargestConsoleWindowSize(HANDLE hConsoleOutput);
export extern(Windows) BOOL GetConsoleCursorInfo(HANDLE hConsoleOutput, PCONSOLE_CURSOR_INFO lpConsoleCursorInfo);

export extern(Windows) BOOL GetCurrentConsoleFont(HANDLE hConsoleOutput, BOOL bMaximumWindow, PCONSOLE_FONT_INFO lpConsoleCurrentFont);
export extern(Windows) BOOL GetCurrentConsoleFontEx(HANDLE hConsoleOutput, BOOL bMaximumWindow, PCONSOLE_FONT_INFOEX lpConsoleCurrentFontEx);
export extern(Windows) BOOL SetCurrentConsoleFontEx(HANDLE hConsoleOutput, BOOL bMaximumWindow, PCONSOLE_FONT_INFOEX lpConsoleCurrentFontEx);
export extern(Windows) BOOL GetConsoleHistoryInfo(PCONSOLE_HISTORY_INFO lpConsoleHistoryInfo);
export extern(Windows) BOOL SetConsoleHistoryInfo(PCONSOLE_HISTORY_INFO lpConsoleHistoryInfo);
export extern(Windows) COORD GetConsoleFontSize(HANDLE hConsoleOutput, DWORD nFont);
export extern(Windows) BOOL GetConsoleSelectionInfo(PCONSOLE_SELECTION_INFO lpConsoleSelectionInfo);

export extern(Windows) BOOL GetNumberOfConsoleMouseButtons(LPDWORD lpNumberOfMouseButtons);
export extern(Windows) BOOL SetConsoleMode(HANDLE hConsoleHandle, DWORD dwMode);
export extern(Windows) BOOL SetConsoleActiveScreenBuffer(HANDLE hConsoleOutput);
export extern(Windows) BOOL FlushConsoleInputBuffer(HANDLE hConsoleInput);
export extern(Windows) BOOL SetConsoleScreenBufferSize(HANDLE hConsoleOutput, COORD dwSize);
export extern(Windows) BOOL SetConsoleCursorPosition(HANDLE hConsoleOutput, COORD dwCursorPosition);
export extern(Windows) BOOL SetConsoleCursorInfo(HANDLE hConsoleOutput, const(CONSOLE_CURSOR_INFO)* lpConsoleCursorInfo);

export extern(Windows) BOOL ScrollConsoleScreenBufferA(HANDLE hConsoleOutput, const(SMALL_RECT)* lpScrollRectangle, const(SMALL_RECT)* lpClipRectangle, COORD dwDestinationOrigin, const(CHAR_INFO)* lpFill);
export extern(Windows) BOOL ScrollConsoleScreenBufferW(HANDLE hConsoleOutput, const(SMALL_RECT)* lpScrollRectangle, const(SMALL_RECT)* lpClipRectangle, COORD dwDestinationOrigin, const(CHAR_INFO)* lpFill);
version(UNICODE)
	alias ScrollConsoleScreenBufferW ScrollConsoleScreenBuffer;
else
	alias ScrollConsoleScreenBufferA ScrollConsoleScreenBuffer;

export extern(Windows) BOOL SetConsoleWindowInfo(HANDLE hConsoleOutput, BOOL bAbsolute, const(SMALL_RECT)* lpConsoleWindow);
export extern(Windows) BOOL SetConsoleTextAttribute(HANDLE hConsoleOutput, WORD wAttributes);
export extern(Windows) BOOL SetConsoleCtrlHandler(PHANDLER_ROUTINE HandlerRoutine, BOOL Add);
export extern(Windows) BOOL GenerateConsoleCtrlEvent(DWORD dwCtrlEvent, DWORD dwProcessGroupId);
export extern(Windows) BOOL AllocConsole();
export extern(Windows) BOOL FreeConsole();

export extern(Windows) BOOL AttachConsole(DWORD dwProcessId);
enum ATTACH_PARENT_PROCESS = cast(DWORD)-1;

export extern(Windows) DWORD GetConsoleTitleA(LPSTR lpConsoleTitle, DWORD nSize);
export extern(Windows) DWORD GetConsoleTitleW(LPWSTR lpConsoleTitle, DWORD nSize);
version(UNICODE)
	alias GetConsoleTitleW GetConsoleTitle;
else
	alias GetConsoleTitleA GetConsoleTitle;

static if(_WIN32_WINNT >= _WIN32_WINNT_VISTA){
	export extern(Windows) DWORD GetConsoleOriginalTitleA(LPSTR lpConsoleTitle, DWORD nSize);
	export extern(Windows) DWORD GetConsoleOriginalTitleW(LPWSTR lpConsoleTitle, DWORD nSize);
	version(UNICODE)
		alias GetConsoleOriginalTitleW GetConsoleOriginalTitle;
	else
		alias GetConsoleOriginalTitleA GetConsoleOriginalTitle;
}

export extern(Windows) BOOL SetConsoleTitleA(LPCSTR lpConsoleTitle);
export extern(Windows) BOOL SetConsoleTitleW(LPCWSTR lpConsoleTitle);
version(UNICODE)
	alias SetConsoleTitleW SetConsoleTitle;
else
	alias SetConsoleTitleA SetConsoleTitle;

struct CONSOLE_READCONSOLE_CONTROL {
	ULONG nLength;
	ULONG nInitialChars;
	ULONG dwCtrlWakeupMask;
	ULONG dwControlKeyState;
}
alias CONSOLE_READCONSOLE_CONTROL* PCONSOLE_READCONSOLE_CONTROL;

export extern(Windows) BOOL ReadConsoleA(HANDLE hConsoleInput, LPVOID lpBuffer, DWORD nNumberOfCharsToRead, LPDWORD lpNumberOfCharsRead, PCONSOLE_READCONSOLE_CONTROL pInputControl);
export extern(Windows) BOOL ReadConsoleW(HANDLE hConsoleInput, LPVOID lpBuffer, DWORD nNumberOfCharsToRead, LPDWORD lpNumberOfCharsRead, PCONSOLE_READCONSOLE_CONTROL pInputControl);
version(UNICODE)
	alias ReadConsoleW ReadConsole;
else
	alias ReadConsoleA ReadConsole;

export extern(Windows) BOOL WriteConsoleA(HANDLE hConsoleOutput, const(VOID)* lpBuffer, DWORD nNumberOfCharsToWrite, LPDWORD lpNumberOfCharsWritten, LPVOID lpReserved);
export extern(Windows) BOOL WriteConsoleW(HANDLE hConsoleOutput, const(void)* lpBuffer, DWORD nNumberOfCharsToWrite, LPDWORD lpNumberOfCharsWritten, LPVOID lpReserved);
version(UNICODE)
	alias WriteConsoleW WriteConsole;
else
	alias WriteConsoleA WriteConsole;

enum CONSOLE_TEXTMODE_BUFFER = 1;

export extern(Windows) HANDLE CreateConsoleScreenBuffer(DWORD dwDesiredAccess, DWORD dwShareMode, const(SECURITY_ATTRIBUTES)* lpSecurityAttributes, DWORD dwFlags, LPVOID lpScreenBufferData);
export extern(Windows) UINT GetConsoleCP();
export extern(Windows) BOOL SetConsoleCP(UINT wCodePageID);
export extern(Windows) UINT GetConsoleOutputCP();
export extern(Windows) BOOL SetConsoleOutputCP(UINT wCodePageID);

enum CONSOLE_FULLSCREEN = 1;
enum CONSOLE_FULLSCREEN_HARDWARE = 2;

export extern(Windows) BOOL GetConsoleDisplayMode(LPDWORD lpModeFlags);

enum CONSOLE_FULLSCREEN_MODE = 1;
enum CONSOLE_WINDOWED_MODE = 2;

export extern(Windows) BOOL SetConsoleDisplayMode(HANDLE hConsoleOutput, DWORD dwFlags, PCOORD lpNewScreenBufferDimensions);
export extern(Windows) HWND GetConsoleWindow();

static if(_WIN32_WINNT >= _WIN32_WINNT_WINXP){
	export extern(Windows) DWORD GetConsoleProcessList(LPDWORD lpdwProcessList, DWORD dwProcessCount);
	export extern(Windows) BOOL AddConsoleAliasA(LPSTR Source, LPSTR Target, LPSTR ExeName);
	export extern(Windows) BOOL AddConsoleAliasW(LPWSTR Source, LPWSTR Target, LPWSTR ExeName);
	version(UNICODE)
		alias AddConsoleAliasW AddConsoleAlias;
	else
		alias AddConsoleAliasA AddConsoleAlias;

	export extern(Windows) DWORD GetConsoleAliasA(LPSTR Source, LPSTR TargetBuffer, DWORD TargetBufferLength, LPSTR ExeName);
	export extern(Windows) DWORD GetConsoleAliasW(LPWSTR Source, LPWSTR TargetBuffer, DWORD TargetBufferLength, LPWSTR ExeName);
	version(UNICODE)
		alias GetConsoleAliasW GetConsoleAlias;
	else
		alias GetConsoleAliasA GetConsoleAlias;

	export extern(Windows) DWORD GetConsoleAliasesLengthA(LPSTR ExeName);
	export extern(Windows) DWORD GetConsoleAliasesLengthW(LPWSTR ExeName);
	version(UNICODE)
		alias GetConsoleAliasesLengthW GetConsoleAliasesLength;
	else
		alias GetConsoleAliasesLengthA GetConsoleAliasesLength;

	export extern(Windows) DWORD GetConsoleAliasExesLengthA();
	export extern(Windows) DWORD GetConsoleAliasExesLengthW();
	version(UNICODE)
		alias GetConsoleAliasExesLengthW GetConsoleAliasExesLength;
	else
		alias GetConsoleAliasExesLengthA GetConsoleAliasExesLength;

	export extern(Windows) DWORD GetConsoleAliasesA(LPSTR AliasBuffer, DWORD AliasBufferLength, LPSTR ExeName);
	export extern(Windows) DWORD GetConsoleAliasesW(LPWSTR AliasBuffer, DWORD AliasBufferLength, LPWSTR ExeName);
	version(UNICODE)
		alias GetConsoleAliasesW GetConsoleAliases;
	else
		alias GetConsoleAliasesA GetConsoleAliases;

	export extern(Windows) DWORD GetConsoleAliasExesA(LPSTR ExeNameBuffer, DWORD ExeNameBufferLength);
	export extern(Windows) DWORD GetConsoleAliasExesW(LPWSTR ExeNameBuffer, DWORD ExeNameBufferLength);
	version(UNICODE)
		alias GetConsoleAliasExesW GetConsoleAliasExes;
	else
		alias GetConsoleAliasExesA GetConsoleAliasExes;
}

} // extern(C)
