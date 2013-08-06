/** propkeydef.d

Converted from 'propkeydef.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.propkeydef;


import std.metastrings;
import c.windows.windef;
import c.windows.wtypes;
import c.windows.guiddef;


alias const(PROPERTYKEY)* REFPROPERTYKEY;


template DEFINE_PROPERTYKEY(string name, uint l, ushort w1, ushort w2, ubyte b1, ubyte b2, ubyte b3, ubyte b4, ubyte b5, ubyte b6, ubyte b7, ubyte b8, uint pid)
{
	version(NITGUID){
		mixin(std.metastrings.Format!("extern(C) const PROPERTYKEY %s = {{%s, %s, %s, [%s, %s, %s, %s, %s, %s, %s, %s]}, %s};", name, l,
			cast(uint)w1, cast(uint)w2, cast(uint)b1, cast(uint)b2,  cast(uint)b3, cast(uint)b4, cast(uint)b5, cast(uint)b6, cast(uint)b7, cast(uint)b8, pid));
	}else{
		mixin(std.metastrings.Format!("extern extern(C) const PROPERTYKEY %s;", name));
	}
}


extern(C)
BOOL IsEqualPropertyKey(REFPROPERTYKEY a, REFPROPERTYKEY b)
{
	return cast(BOOL)((a.pid == b.pid) && IsEqualIID(&a.fmtid, &b.fmtid));
}

//int operator == (REFPROPERTYKEY pkeyOne, REFPROPERTYKEY pkeyOther) { return IsEqualPropertyKey(pkeyOne, pkeyOther); }
//int operator != (REFPROPERTYKEY pkeyOne, REFPROPERTYKEY pkeyOther) { return !(pkeyOne == pkeyOther); }
