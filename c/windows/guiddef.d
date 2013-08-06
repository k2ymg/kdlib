/** guiddef.d

Converted from 'guiddef.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.guiddef;


import c.windows.windef;
import std.c.string;
import std.conv;


struct GUID {
	uint Data1;
	ushort Data2;
	ushort Data3;
	ubyte[8] Data4;
}

alias GUID* LPGUID;
alias const(GUID)* LPCGUID;

extern extern(C) const IID GUID_NULL; // from cguid.d.

alias GUID IID;
alias IID* LPIID;
alias GUID_NULL IID_NULL;
alias IsEqualGUID IsEqualIID;
alias GUID CLSID;
alias CLSID* LPCLSID;
alias GUID_NULL CLSID_NULL;
alias IsEqualGUID IsEqualCLSID;
alias GUID FMTID;
alias FMTID* LPFMTID;
alias GUID_NULL FMTID_NULL;
alias IsEqualGUID IsEqualFMTID;

alias const(GUID)* REFGUID;
alias const(IID)* REFIID;
alias const(IID)* REFCLSID;
alias const(IID)* REFFMTID;

extern(C)
BOOL IsEqualGUID(REFGUID rguid1, REFGUID rguid2)
{
	return !memcmp(rguid1, rguid2, GUID.sizeof);
}


template DEFINE_GUID(string name, uint l, ushort w1, ushort w2, ubyte b1, ubyte b2, ubyte b3, ubyte b4, ubyte b5, ubyte b6, ubyte b7, ubyte b8)
{
	version(INITGUID){
		mixin("extern(C) const GUID " ~ name ~ " = {" ~ std.conv.to!(string)(l) ~ ", "
			~ std.conv.to!(string)(cast(uint)w1) ~ ", " ~ std.conv.to!(string)(cast(uint)w2) ~ ", ["
			~ std.conv.to!(string)(cast(uint)b1) ~ ", " ~ std.conv.to!(string)(cast(uint)b2) ~ ", " ~ std.conv.to!(string)(cast(uint)b3) ~ ", " ~ std.conv.to!(string)(cast(uint)b4) ~ ", "
			~ std.conv.to!(string)(cast(uint)b5) ~ ", " ~ std.conv.to!(string)(cast(uint)b6) ~ ", " ~ std.conv.to!(string)(cast(uint)b7) ~ ", " ~ std.conv.to!(string)(cast(uint)b8) ~ "]};");
	}else{
		mixin("extern extern(C) const GUID " ~ name ~ ";");
	}
}

template DEFINE_OLEGUID(string name, uint l, ushort w1, ushort w2)
{
	mixin DEFINE_GUID!(name, l, w1, w2, 0xC0, 0, 0, 0, 0, 0, 0, 0x46);
}

//"11111111-2222-3333-4455-66778899AABB"
template DEFINE_GUID(alias name, string id)
{
	static assert(id.length == 36);
	static if(is(typeof(name) == const(GUID))){
		static assert(false, name.stringof ~ ": the surrounding declaration overrides");
		/*version(INITGUID){
			mixin("extern(C) const GUID " ~ name.stringof ~ " = {0x" ~ id[0 .. 8] ~ ", 0x" ~ id[9 .. 13] ~ ", 0x" ~ id[14 .. 18] ~
				", [0x" ~ id[19 .. 21] ~ ", 0x" ~ id[21 .. 23] ~ ", 0x" ~ id[24 .. 26] ~ ", 0x" ~ id[26 .. 28] ~
				", 0x" ~ id[28 .. 30] ~ ", 0x" ~ id[30 .. 32] ~ ", 0x" ~ id[32 .. 34] ~ ", 0x" ~ id[34 .. 36] ~ "]};"
			);
		}*/
	}else static if(is(typeof(name) == string)){
		version(INITGUID){
			mixin("extern(C) const GUID " ~ name ~ " = {0x" ~ id[0 .. 8] ~ ", 0x" ~ id[9 .. 13] ~ ", 0x" ~ id[14 .. 18] ~
				", [0x" ~ id[19 .. 21] ~ ", 0x" ~ id[21 .. 23] ~ ", 0x" ~ id[24 .. 26] ~ ", 0x" ~ id[26 .. 28] ~
				", 0x" ~ id[28 .. 30] ~ ", 0x" ~ id[30 .. 32] ~ ", 0x" ~ id[32 .. 34] ~ ", 0x" ~ id[34 .. 36] ~ "]};"
			);
		}else{
			mixin("extern extern(C) const GUID " ~ name ~ ";");
		}
	}else{
		static assert(name.stringof);
	}
}

template DEFINE_IID(name, string id)
{
	static assert(id.length == 36);
	static if(is(name == interface)){
		version(INITGUID){
			mixin("extern(C) const IID IID_" ~ name.stringof ~ " = {0x" ~ id[0 .. 8] ~ ", 0x" ~ id[9 .. 13] ~ ", 0x" ~ id[14 .. 18] ~
				", [0x" ~ id[19 .. 21] ~ ", 0x" ~ id[21 .. 23] ~ ", 0x" ~ id[24 .. 26] ~ ", 0x" ~ id[26 .. 28] ~
				", 0x" ~ id[28 .. 30] ~ ", 0x" ~ id[30 .. 32] ~ ", 0x" ~ id[32 .. 34] ~ ", 0x" ~ id[34 .. 36] ~ "]};"
			);
		}else{
			mixin("extern extern(C) const IID IID_" ~ name.stringof ~ ";");
		}
	}else{
		static assert(false, name.stringof);
	}
}
