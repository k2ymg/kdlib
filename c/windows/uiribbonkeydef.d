/** uiribbonkeydef.d

Converted from 'uiribbonkeydef.h'.

Version: V7.1
Authors: Koji Kishita
*/
module c.windows.uiribbonkeydef;


import std.conv;


template DEFINE_UIPROPERTYKEY(string name, alias type, int index)
{
	mixin("extern(C) const PROPERTYKEY "
		~ name ~ " = {{ 0x00000000 + "
		~ std.conv.to!(string)(index) ~ ", 0x7363, 0x696e, [0x84, 0x41, 0x79, 0x8a, 0xcf, 0x5a, 0xeb, 0xb7] },"
		~ std.conv.to!(string)(type) ~ " };");
}
