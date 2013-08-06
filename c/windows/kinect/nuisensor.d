/** nuisensor.d

Converted from 'NuiScensor.h' in Microsoft's Kinect for Windows SDK.

Version: 1.5
License: $(WEB boost.org/LICENSE_1_0.txt, Boost License 1.0).
Authors: Koji Kishita
*/
module c.windows.kinect.nuisensor;


import c.windows.windef;
import c.windows.guiddef;
import c.windows.unknwn;
import c.windows.wtypes;
import c.windows.kinect.nuiapi;


mixin DEFINE_GUID!("IID_INuiSensor", 0x1f5e088c, 0xa8c7, 0x41d3, 0x99, 0x57, 0x20, 0x96, 0x77, 0xa1, 0x3e, 0x85);
mixin DEFINE_GUID!("IID_INuiFrameTexture", 0x13ea17f5, 0xff2e, 0x4670, 0x9e, 0xe5, 0x12, 0x97, 0xa6, 0xe8, 0x80, 0xd1);
mixin DEFINE_GUID!("IID_INuiAudioBeam", 0x8c3cebfa, 0xa35d, 0x497e, 0xbc, 0x9a, 0xe9, 0x75, 0x2a, 0x81, 0x55, 0xe0);

enum NUI_SKELETON_COUNT = 6;

align(8)
struct Vector4 {
	FLOAT x;
	FLOAT y;
	FLOAT z;
	FLOAT w;
}

align(8)
struct Matrix4 {
	FLOAT M11;
	FLOAT M12;
	FLOAT M13;
	FLOAT M14;
	FLOAT M21;
	FLOAT M22;
	FLOAT M23;
	FLOAT M24;
	FLOAT M31;
	FLOAT M32;
	FLOAT M33;
	FLOAT M34;
	FLOAT M41;
	FLOAT M42;
	FLOAT M43;
	FLOAT M44;
}

/*
#ifdef __XNAMATH_H__
	#ifndef _Vector4_Functions_
		#define _Vector4_Functions_
		inline XMVECTOR XMVectorFromVector4(const Vector4& vec4)
		{
		return XMVectorSet(vec4.x, vec4.y, vec4.z, vec4.w);
		}

		inline Vector4 XMVectorToVector4(FXMVECTOR V)
		{
		Vector4 vec4 = { XMVectorGetX(V), XMVectorGetY(V), XMVectorGetZ(V), XMVectorGetW(V) };
		return vec4;
		}
	#endif _Vector4_Functions_
#endif
*/

enum {
	NUI_SKELETON_POSITION_HIP_CENTER = 0,
	NUI_SKELETON_POSITION_SPINE,
	NUI_SKELETON_POSITION_SHOULDER_CENTER,
	NUI_SKELETON_POSITION_HEAD,
	NUI_SKELETON_POSITION_SHOULDER_LEFT,
	NUI_SKELETON_POSITION_ELBOW_LEFT,
	NUI_SKELETON_POSITION_WRIST_LEFT,
	NUI_SKELETON_POSITION_HAND_LEFT,
	NUI_SKELETON_POSITION_SHOULDER_RIGHT,
	NUI_SKELETON_POSITION_ELBOW_RIGHT,
	NUI_SKELETON_POSITION_WRIST_RIGHT,
	NUI_SKELETON_POSITION_HAND_RIGHT,
	NUI_SKELETON_POSITION_HIP_LEFT,
	NUI_SKELETON_POSITION_KNEE_LEFT,
	NUI_SKELETON_POSITION_ANKLE_LEFT,
	NUI_SKELETON_POSITION_FOOT_LEFT,
	NUI_SKELETON_POSITION_HIP_RIGHT,
	NUI_SKELETON_POSITION_KNEE_RIGHT,
	NUI_SKELETON_POSITION_ANKLE_RIGHT,
	NUI_SKELETON_POSITION_FOOT_RIGHT,
	NUI_SKELETON_POSITION_COUNT
}
alias int NUI_SKELETON_POSITION_INDEX;

enum {
	NUI_IMAGE_TYPE_DEPTH_AND_PLAYER_INDEX = 0,
	NUI_IMAGE_TYPE_COLOR,
	NUI_IMAGE_TYPE_COLOR_YUV,
	NUI_IMAGE_TYPE_COLOR_RAW_YUV,
	NUI_IMAGE_TYPE_DEPTH,
}
alias int NUI_IMAGE_TYPE;

enum {
	NUI_IMAGE_RESOLUTION_INVALID = -1,
	NUI_IMAGE_RESOLUTION_80x60 = 0,
	NUI_IMAGE_RESOLUTION_320x240,
	NUI_IMAGE_RESOLUTION_640x480,
	NUI_IMAGE_RESOLUTION_1280x960
}
alias int NUI_IMAGE_RESOLUTION;

align(8)
struct NUI_IMAGE_VIEW_AREA {
	int eDigitalZoom_NotUsed;
	LONG lCenterX;
	LONG lCenterY;
}

align(8)
struct NUI_TRANSFORM_SMOOTH_PARAMETERS {
	FLOAT fSmoothing;
	FLOAT fCorrection;
	FLOAT fPrediction;
	FLOAT fJitterRadius;
	FLOAT fMaxDeviationRadius;
}

align(8)
struct NUI_SURFACE_DESC {
	UINT Width;
	UINT Height;
}

enum {
	NUI_SKELETON_POSITION_NOT_TRACKED = 0,
	NUI_SKELETON_POSITION_INFERRED,
	NUI_SKELETON_POSITION_TRACKED
}
alias int NUI_SKELETON_POSITION_TRACKING_STATE;

enum {
	NUI_SKELETON_NOT_TRACKED = 0,
	NUI_SKELETON_POSITION_ONLY,
	NUI_SKELETON_TRACKED
}
alias int NUI_SKELETON_TRACKING_STATE;

align(8)
struct NUI_SKELETON_DATA {
	NUI_SKELETON_TRACKING_STATE eTrackingState;
	DWORD dwTrackingID;
	DWORD dwEnrollmentIndex_NotUsed;
	DWORD dwUserIndex;
	Vector4 Position;
	Vector4[20] SkeletonPositions;
	NUI_SKELETON_POSITION_TRACKING_STATE[20] eSkeletonPositionTrackingState;
	DWORD dwQualityFlags;
}

align(16)
struct NUI_SKELETON_FRAME {
	LARGE_INTEGER liTimeStamp;
	DWORD dwFrameNumber;
	DWORD dwFlags;
	Vector4 vFloorClipPlane;
	Vector4 vNormalToGravity;
	NUI_SKELETON_DATA[6] SkeletonData;
}

align(8)
struct NUI_SKELETON_BONE_ROTATION {
	Matrix4 rotationMatrix;
	Vector4 rotationQuaternion;
}

align(8)
struct NUI_SKELETON_BONE_ORIENTATION {
	NUI_SKELETON_POSITION_INDEX endJoint;
	NUI_SKELETON_POSITION_INDEX startJoint;
	NUI_SKELETON_BONE_ROTATION hierarchicalRotation;
	NUI_SKELETON_BONE_ROTATION absoluteRotation;
}

align(8)
struct NUI_LOCKED_RECT {
	INT Pitch;
	INT size;
	ubyte* pBits;
}

enum MICARRAY_ADAPTIVE_BEAM = 0x1100;

align(8)
struct NUI_IMAGE_FRAME {
	LARGE_INTEGER liTimeStamp;
	DWORD dwFrameNumber;
	NUI_IMAGE_TYPE eImageType;
	NUI_IMAGE_RESOLUTION eResolution;
	INuiFrameTexture pFrameTexture;
	DWORD dwFrameFlags;
	NUI_IMAGE_VIEW_AREA ViewArea;
}

//EXTERN_C const IID IID_INuiAudioBeam;
//MIDL_INTERFACE("8C3CEBFA-A35D-497E-BC9A-E9752A8155E0")
interface INuiAudioBeam : IUnknown {
public extern(Windows):
	HRESULT GetBeam(double* angle);
	HRESULT SetBeam(double angle);
	HRESULT GetPosition(double* angle, double* confidence);
}

//EXTERN_C const IID IID_INuiFrameTexture;
//MIDL_INTERFACE("13ea17f5-ff2e-4670-9ee5-1297a6e880d1")
interface INuiFrameTexture : IUnknown {
public extern(Windows):
	int BufferLen();
	int Pitch();
	HRESULT LockRect(UINT Level, NUI_LOCKED_RECT* pLockedRect, RECT* pRect, DWORD Flags);
	HRESULT GetLevelDesc(UINT Level, NUI_SURFACE_DESC* pDesc);
	HRESULT UnlockRect(UINT Level);
}

//EXTERN_C const IID IID_INuiSensor;
//MIDL_INTERFACE("1f5e088c-a8c7-41d3-9957-209677a13e85")
interface INuiSensor : IUnknown {
public extern(Windows):
	HRESULT NuiInitialize(DWORD dwFlags);
	void NuiShutdown();
	HRESULT NuiSetFrameEndEvent(HANDLE hEvent, DWORD dwFrameEventFlag);
	HRESULT NuiImageStreamOpen(NUI_IMAGE_TYPE eImageType, NUI_IMAGE_RESOLUTION eResolution, DWORD dwImageFrameFlags, DWORD dwFrameLimit, HANDLE hNextFrameEvent, HANDLE* phStreamHandle);
	HRESULT NuiImageStreamSetImageFrameFlags(HANDLE hStream, DWORD dwImageFrameFlags);
	HRESULT NuiImageStreamGetImageFrameFlags(HANDLE hStream, DWORD* pdwImageFrameFlags);
	HRESULT NuiImageStreamGetNextFrame(HANDLE hStream, DWORD dwMillisecondsToWait, NUI_IMAGE_FRAME* pImageFrame);
	HRESULT NuiImageStreamReleaseFrame(HANDLE hStream, NUI_IMAGE_FRAME* pImageFrame);
	HRESULT NuiImageGetColorPixelCoordinatesFromDepthPixel(NUI_IMAGE_RESOLUTION eColorResolution, const(NUI_IMAGE_VIEW_AREA)* pcViewArea, LONG lDepthX, LONG lDepthY, USHORT usDepthValue, LONG* plColorX, LONG* plColorY);
	HRESULT NuiImageGetColorPixelCoordinatesFromDepthPixelAtResolution(NUI_IMAGE_RESOLUTION eColorResolution, NUI_IMAGE_RESOLUTION eDepthResolution, const(NUI_IMAGE_VIEW_AREA)* pcViewArea, LONG lDepthX, LONG lDepthY, USHORT usDepthValue, LONG* plColorX, LONG* plColorY);
	HRESULT NuiImageGetColorPixelCoordinateFrameFromDepthPixelFrameAtResolution(NUI_IMAGE_RESOLUTION eColorResolution, NUI_IMAGE_RESOLUTION eDepthResolution, DWORD cDepthValues, USHORT* pDepthValues, DWORD cColorCoordinates, LONG* pColorCoordinates);
	HRESULT NuiCameraElevationSetAngle(LONG lAngleDegrees);
	HRESULT NuiCameraElevationGetAngle(LONG* plAngleDegrees);
	HRESULT NuiSkeletonTrackingEnable(HANDLE hNextFrameEvent, DWORD dwFlags);
	HRESULT NuiSkeletonTrackingDisable();
	HRESULT NuiSkeletonSetTrackedSkeletons(DWORD* TrackingIDs);
	HRESULT NuiSkeletonGetNextFrame(DWORD dwMillisecondsToWait, NUI_SKELETON_FRAME* pSkeletonFrame);
	HRESULT NuiTransformSmooth(NUI_SKELETON_FRAME *pSkeletonFrame, const(NUI_TRANSFORM_SMOOTH_PARAMETERS)* pSmoothingParams);
	HRESULT NuiGetAudioSource(INuiAudioBeam* ppDmo);
	int NuiInstanceIndex();
	BSTR NuiDeviceConnectionId();
	BSTR NuiUniqueId();
	BSTR NuiAudioArrayId();
	HRESULT NuiStatus();
	DWORD NuiInitializationFlags();
}

export extern(Windows)
{
HRESULT NuiGetSensorCount(int* pCount);
HRESULT NuiCreateSensorByIndex(int index, INuiSensor* ppNuiSensor);
HRESULT NuiCreateSensorById(const(OLECHAR)* strInstanceId, INuiSensor* ppNuiSensor);
HRESULT NuiGetAudioSource(INuiAudioBeam* ppDmo);
}

alias extern(Windows) void function(HRESULT hrStatus, const(OLECHAR)* instanceName, const(OLECHAR)* uniqueDeviceName, void* pUserData) NuiStatusProc;

export extern(Windows)
void NuiSetDeviceStatusCallback(NuiStatusProc callback, void* pUserData);

bool HasSkeletalEngine(INuiSensor pNuiSensor)
{
	if(pNuiSensor is null)
		return false;

	return (pNuiSensor.NuiInitializationFlags() & NUI_INITIALIZE_FLAG_USES_SKELETON) || (pNuiSensor.NuiInitializationFlags() & NUI_INITIALIZE_FLAG_USES_DEPTH_AND_PLAYER_INDEX);
}

enum MAX_DEV_STR_LEN = 512;

align(8)
struct NUI_MICROPHONE_ARRAY_DEVICE {
	wchar[MAX_DEV_STR_LEN] szDeviceName;
	wchar[MAX_DEV_STR_LEN] szDeviceID;
	int iDeviceIndex;
}
alias NUI_MICROPHONE_ARRAY_DEVICE* PNUI_MICROPHONE_ARRAY_DEVICE;

export extern(Windows)
HRESULT NuiGetMicrophoneArrayDevices(PNUI_MICROPHONE_ARRAY_DEVICE pDeviceInfo, int size, int* piDeviceCount);

align(8)
struct NUI_SPEAKER_DEVICE {
	wchar[MAX_DEV_STR_LEN] szDeviceName;
	int iDeviceIndex;
	bool fDefault;
}
alias NUI_SPEAKER_DEVICE* PNUI_SPEAKER_DEVICE;

export extern(Windows)
HRESULT NuiGetSpeakerDevices(PNUI_SPEAKER_DEVICE pDeviceInfo, int size, int* piDeviceCount);
