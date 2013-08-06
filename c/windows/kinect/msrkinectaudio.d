/** msrkinectaudio.d

Converted from 'MSRKinectAudio.h'.

Version: Beta
Authors: Koji Kishita
*/
module c.windows.kinect.msrkinectaudio;


import c.windows.windef;
import c.windows.guiddef;
import c.windows.unknwn;


mixin DEFINE_GUID!("CLSID_CMSRKinectAudio", 0x4ddf4183, 0xc038, 0x4c8b, 0xaf, 0x9d, 0x61, 0xe9, 0x32, 0xb5, 0x88, 0x46);

enum MICARRAY_ADAPTIVE_BEAM = 0x1100;

mixin DEFINE_GUID!("IID_ISoundSourceLocalizer", 0x8c3cebfa, 0xa35d, 0x497e, 0xbc, 0x9a, 0xe9, 0x75, 0x2a, 0x81, 0x55, 0xe0);

interface ISoundSourceLocalizer : IUnknown {
extern(Windows):
	HRESULT GetBeam(double* pdAngle);
	HRESULT GetPosition(double* pdAngle, double* pdConfidence);
	HRESULT SetBeam(double dBeamAngle);
}

enum MAX_STR_LEN = 512;
struct KINECT_AUDIO_INFO {
	wchar[MAX_STR_LEN] szDeviceName;
	wchar[MAX_STR_LEN] szDeviceID;
	int iDeviceIndex;
}
alias KINECT_AUDIO_INFO* PKINECT_AUDIO_INFO;

extern(Windows)
HRESULT GetKinectDeviceInfo(PKINECT_AUDIO_INFO pDeviceInfo, int* piDeviceCount);

