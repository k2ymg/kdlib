/** inaddr.d

Converted from 'inaddr.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.inaddr;


import c.windows.windef;


struct in_addr {
	union {
		struct {
			UCHAR s_b1;
			UCHAR s_b2;
			UCHAR s_b3;
			UCHAR s_b4;
		}
		struct {
			USHORT s_w1;
			USHORT s_w2;
		}
		ULONG S_addr;
	}
}
alias in_addr IN_ADDR;
alias IN_ADDR* PIN_ADDR;
alias IN_ADDR* LPIN_ADDR;
