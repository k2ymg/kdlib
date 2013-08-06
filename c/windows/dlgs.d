/** dlgs.d

Converted from 'dlgs.h'.

Version: V7.1
Authors: Koji Kishita
*/
module c.windows.dlgs;


import c.windows.sdkddkver;
import c.windows.windef;


enum {
	ctlFirst = 0x0400,
	ctlLast  = 0x04ff,

	psh1    = 0x0400,
	psh2    = 0x0401,
	psh3    = 0x0402,
	psh4    = 0x0403,
	psh5    = 0x0404,
	psh6    = 0x0405,
	psh7    = 0x0406,
	psh8    = 0x0407,
	psh9    = 0x0408,
	psh10   = 0x0409,
	psh11   = 0x040a,
	psh12   = 0x040b,
	psh13   = 0x040c,
	psh14   = 0x040d,
	psh15   = 0x040e,
	pshHelp = psh15,
	psh16   = 0x040f,

	chx1  = 0x0410,
	chx2  = 0x0411,
	chx3  = 0x0412,
	chx4  = 0x0413,
	chx5  = 0x0414,
	chx6  = 0x0415,
	chx7  = 0x0416,
	chx8  = 0x0417,
	chx9  = 0x0418,
	chx10 = 0x0419,
	chx11 = 0x041a,
	chx12 = 0x041b,
	chx13 = 0x041c,
	chx14 = 0x041d,
	chx15 = 0x041e,
	chx16 = 0x041f,

	rad1  = 0x0420,
	rad2  = 0x0421,
	rad3  = 0x0422,
	rad4  = 0x0423,
	rad5  = 0x0424,
	rad6  = 0x0425,
	rad7  = 0x0426,
	rad8  = 0x0427,
	rad9  = 0x0428,
	rad10 = 0x0429,
	rad11 = 0x042a,
	rad12 = 0x042b,
	rad13 = 0x042c,
	rad14 = 0x042d,
	rad15 = 0x042e,
	rad16 = 0x042f,

	grp1 = 0x0430,
	grp2 = 0x0431,
	grp3 = 0x0432,
	grp4 = 0x0433,
	frm1 = 0x0434,
	frm2 = 0x0435,
	frm3 = 0x0436,
	frm4 = 0x0437,
	rct1 = 0x0438,
	rct2 = 0x0439,
	rct3 = 0x043a,
	rct4 = 0x043b,
	ico1 = 0x043c,
	ico2 = 0x043d,
	ico3 = 0x043e,
	ico4 = 0x043f,

	stc1  = 0x0440,
	stc2  = 0x0441,
	stc3  = 0x0442,
	stc4  = 0x0443,
	stc5  = 0x0444,
	stc6  = 0x0445,
	stc7  = 0x0446,
	stc8  = 0x0447,
	stc9  = 0x0448,
	stc10 = 0x0449,
	stc11 = 0x044a,
	stc12 = 0x044b,
	stc13 = 0x044c,
	stc14 = 0x044d,
	stc15 = 0x044e,
	stc16 = 0x044f,
	stc17 = 0x0450,
	stc18 = 0x0451,
	stc19 = 0x0452,
	stc20 = 0x0453,
	stc21 = 0x0454,
	stc22 = 0x0455,
	stc23 = 0x0456,
	stc24 = 0x0457,
	stc25 = 0x0458,
	stc26 = 0x0459,
	stc27 = 0x045a,
	stc28 = 0x045b,
	stc29 = 0x045c,
	stc30 = 0x045d,
	stc31 = 0x045e,
	stc32 = 0x045f,

	lst1  = 0x0460,
	lst2  = 0x0461,
	lst3  = 0x0462,
	lst4  = 0x0463,
	lst5  = 0x0464,
	lst6  = 0x0465,
	lst7  = 0x0466,
	lst8  = 0x0467,
	lst9  = 0x0468,
	lst10 = 0x0469,
	lst11 = 0x046a,
	lst12 = 0x046b,
	lst13 = 0x046c,
	lst14 = 0x046d,
	lst15 = 0x046e,
	lst16 = 0x046f,

	cmb1  = 0x0470,
	cmb2  = 0x0471,
	cmb3  = 0x0472,
	cmb4  = 0x0473,
	cmb5  = 0x0474,
	cmb6  = 0x0475,
	cmb7  = 0x0476,
	cmb8  = 0x0477,
	cmb9  = 0x0478,
	cmb10 = 0x0479,
	cmb11 = 0x047a,
	cmb12 = 0x047b,
	cmb13 = 0x047c,
	cmb14 = 0x047d,
	cmb15 = 0x047e,
	cmb16 = 0x047f,

	edt1  = 0x0480,
	edt2  = 0x0481,
	edt3  = 0x0482,
	edt4  = 0x0483,
	edt5  = 0x0484,
	edt6  = 0x0485,
	edt7  = 0x0486,
	edt8  = 0x0487,
	edt9  = 0x0488,
	edt10 = 0x0489,
	edt11 = 0x048a,
	edt12 = 0x048b,
	edt13 = 0x048c,
	edt14 = 0x048d,
	edt15 = 0x048e,
	edt16 = 0x048f,

	scr1 = 0x0490,
	scr2 = 0x0491,
	scr3 = 0x0492,
	scr4 = 0x0493,
	scr5 = 0x0494,
	scr6 = 0x0495,
	scr7 = 0x0496,
	scr8 = 0x0497,

	ctl1 = 0x04A0,
}

enum {
	FILEOPENORD      = 1536,
	MULTIFILEOPENORD = 1537,
	PRINTDLGORD      = 1538,
	PRNSETUPDLGORD   = 1539,
	FINDDLGORD       = 1540,
	REPLACEDLGORD    = 1541,
	FONTDLGORD       = 1542,
	FORMATDLGORD31   = 1543,
	FORMATDLGORD30   = 1544,
	RUNDLGORD        = 1545,
}

enum {
	PAGESETUPDLGORD      = 1546,
	NEWFILEOPENORD       = 1547,
	PRINTDLGEXORD        = 1549,
	PAGESETUPDLGORDMOTIF = 1550,
	COLORMGMTDLGORD      = 1551,
	NEWFILEOPENV2ORD     = 1552,
}

static if(NTDDI_VERSION >= NTDDI_VISTA){
	enum NEWFILEOPENV3ORD = 1553;
}

static if(NTDDI_VERSION >= NTDDI_WIN7){
	enum NEWFORMATDLGWITHLINK = 1591;
	enum IDC_MANAGE_LINK = 1592;
}

struct CRGB {
	BYTE bRed;
	BYTE bGreen;
	BYTE bBlue;
	BYTE bExtra;
}
