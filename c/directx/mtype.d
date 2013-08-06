/** mtype.d

Where can I get mtype.h?

Version: noe.
Authors: Koji Kishita
*/
module c.directx.mtype;


import c.windows.strmif;
import c.windows.objbase;


extern(C){

void FreeMediaType(AM_MEDIA_TYPE* mt)
{
	if(mt.cbFormat != 0){
		CoTaskMemFree(mt.pbFormat);
		mt.cbFormat = 0;
		mt.pbFormat = null;
	}
	if(mt.pUnk !is null){
		mt.pUnk.Release();
		mt.pUnk = null;
	}
}

void DeleteMediaType(AM_MEDIA_TYPE* pmt)
{
	if(pmt !is null){
		FreeMediaType(pmt);
		CoTaskMemFree(pmt);
	}
}

}// extern(C)
