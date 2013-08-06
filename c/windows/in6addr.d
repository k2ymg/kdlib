/** in6addr.d

Converted from 'in6addr.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.in6addr;


import c.windows.windef;


struct in6_addr {
	union {
		UCHAR[16] Byte;
		USHORT[8] Word;
		UCHAR[16] s6_bytes;
		UCHAR[16] s6_addr;
		USHORT[8] s6_words;
	}
}
alias in6_addr IN6_ADDR;
alias IN6_ADDR* PIN6_ADDR;
alias IN6_ADDR* LPIN6_ADDR;
