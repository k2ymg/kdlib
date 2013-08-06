/** amaudio.d

Converted from 'amaudio.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.amaudio;


import c.windows.windef;
import c.windows.unknwn;
import c.windows.mmsystem;
import c.windows.dsound;
import c.windows.winerror;


extern(C){

interface IAMDirectSound : IUnknown {
public extern(Windows):
	HRESULT GetDirectSoundInterface(LPDIRECTSOUND* lplpds);
	HRESULT GetPrimaryBufferInterface(LPDIRECTSOUNDBUFFER* lplpdsb);
	HRESULT GetSecondaryBufferInterface(LPDIRECTSOUNDBUFFER* lplpdsb);
	HRESULT ReleaseDirectSoundInterface(LPDIRECTSOUND lpds);
	HRESULT ReleasePrimaryBufferInterface(LPDIRECTSOUNDBUFFER lpdsb);
	HRESULT ReleaseSecondaryBufferInterface(LPDIRECTSOUNDBUFFER lpdsb);
	HRESULT SetFocusWindow(HWND, BOOL);
	HRESULT GetFocusWindow(HWND*, BOOL*);
}

HRESULT AMValidateAndFixWaveFormatEx(WAVEFORMATEX* pwfx, DWORD cb)
{
	if(cb < PCMWAVEFORMAT.sizeof)
		return E_INVALIDARG;
	if(pwfx.wFormatTag != WAVE_FORMAT_PCM){
		if(cb < WAVEFORMATEX.sizeof)
			return E_INVALIDARG;
		if(cb < WAVEFORMATEX.sizeof + pwfx.cbSize)
			pwfx.cbSize = 0;
	}

	if(pwfx.nAvgBytesPerSec > 10000000 || pwfx.nAvgBytesPerSec == 0)
		pwfx.nAvgBytesPerSec = 176400;

	if(pwfx.nChannels > 32)
		pwfx.nChannels = 1;

	return S_OK;
}

}// extern(C)
