/** msr_nuiapi.d

Converted from 'MSR_NuiApi.h'.

Version: Beta 2
Authors: Koji Kishita
*/
module c.windows.kinect.msr_nuiapi;


import c.windows.windef;
import c.windows.winerror;
import c.windows.wtypes;

public import c.windows.kinect.msr_nuiprops;
public import c.windows.kinect.msr_nuiimagecamera;
public import c.windows.kinect.msr_nuiskeleton;


align(8)
struct Vector4 {
	union {
		float[4] vector4_f32;
		uint[4] vector4_u32;
		struct {
			FLOAT x;
			FLOAT y;
			FLOAT z;
			FLOAT w;
		}
		FLOAT[4] v;
		UINT[4] u;
	}
}

alias const Vector4 FVector4;

enum {
	NUI_INITIALIZE_FLAG_USES_DEPTH_AND_PLAYER_INDEX = 0x00000001,
	NUI_INITIALIZE_FLAG_USES_COLOR                  = 0x00000002,
	NUI_INITIALIZE_FLAG_USES_SKELETON               = 0x00000008,
	NUI_INITIALIZE_FLAG_USES_DEPTH                  = 0x00000020,
	NUI_INITIALIZE_DEFAULT_HARDWARE_THREAD          = 0xFFFFFFFF,
}

export extern(Windows)
{
HRESULT NuiInitialize(DWORD dwFlags);
void NuiShutdown();
bool MSR_NuiGetPropsBlob(NUI_PROPSINDEX Index, void* pBlob, DWORD* pdwInOutSize);
NUI_PROPSTYPE MSR_NuiGetPropsType(NUI_PROPSINDEX Index);
}

enum {
	E_NUI_DEVICE_NOT_CONNECTED = HRESULT_FROM_WIN32(ERROR_DEVICE_NOT_CONNECTED),
	E_NUI_DEVICE_NOT_READY     = HRESULT_FROM_WIN32(ERROR_NOT_READY),
	E_NUI_ALREADY_INITIALIZED  = HRESULT_FROM_WIN32(ERROR_ALREADY_INITIALIZED),
	E_NUI_NO_MORE_ITEMS        = HRESULT_FROM_WIN32(ERROR_NO_MORE_ITEMS),
}

private enum FACILITY_NUI = 0x301;

enum {
	E_NUI_FRAME_NO_DATA             = MAKE_HRESULT(SEVERITY_ERROR, FACILITY_NUI, 1),
	E_NUI_STREAM_NOT_ENABLED        = MAKE_HRESULT(SEVERITY_ERROR, FACILITY_NUI, 2),
	E_NUI_IMAGE_STREAM_IN_USE       = MAKE_HRESULT(SEVERITY_ERROR, FACILITY_NUI, 3),
	E_NUI_FRAME_LIMIT_EXCEEDED      = MAKE_HRESULT(SEVERITY_ERROR, FACILITY_NUI, 4),
	E_NUI_FEATURE_NOT_INITIALIZED   = MAKE_HRESULT(SEVERITY_ERROR, FACILITY_NUI, 5),
	E_NUI_DATABASE_NOT_FOUND        = MAKE_HRESULT(SEVERITY_ERROR, FACILITY_NUI, 13),
	E_NUI_DATABASE_VERSION_MISMATCH = MAKE_HRESULT(SEVERITY_ERROR, FACILITY_NUI, 14),
	E_NUI_NOTCONNECTED              = MAKE_HRESULT(SEVERITY_ERROR, FACILITY_NUI, ERROR_BAD_UNIT),
	E_NUI_NOTREADY                  = MAKE_HRESULT(SEVERITY_ERROR, FACILITY_NUI, ERROR_NOT_READY),
	E_NUI_SKELETAL_ENGINE_BUSY      = MAKE_HRESULT(SEVERITY_ERROR, FACILITY_NUI, ERROR_BUSY),
	E_NUI_NOTPOWERED                = MAKE_HRESULT(SEVERITY_ERROR, FACILITY_NUI, ERROR_INSUFFICIENT_POWER),
	E_NUI_BADIINDEX                 = MAKE_HRESULT(SEVERITY_ERROR, FACILITY_NUI, ERROR_INVALID_INDEX),
}
static assert(E_NUI_FRAME_NO_DATA == 0x83010001, "Error code has changed.");



interface INuiInstance {
extern(Windows):
	int InstanceIndex();
	HRESULT NuiInitialize( DWORD dwFlags );
	void NuiShutdown();
	HRESULT NuiImageStreamOpen(NUI_IMAGE_TYPE eImageType, NUI_IMAGE_RESOLUTION eResolution, DWORD dwImageFrameFlags_NotUsed, DWORD dwFrameLimit, HANDLE hNextFrameEvent, HANDLE* phStreamHandle);
	HRESULT NuiImageStreamGetNextFrame(HANDLE hStream, DWORD dwMillisecondsToWait, const(NUI_IMAGE_FRAME)** ppcImageFrame);
	HRESULT NuiImageStreamReleaseFrame(HANDLE hStream, const(NUI_IMAGE_FRAME)* pImageFrame);
	HRESULT NuiImageGetColorPixelCoordinatesFromDepthPixel(NUI_IMAGE_RESOLUTION eColorResolution, const(NUI_IMAGE_VIEW_AREA)* pcViewArea, LONG lDepthX, LONG lDepthY, USHORT usDepthValue, LONG* plColorX, LONG* plColorY);
	HRESULT NuiCameraElevationSetAngle(LONG lAngleDegrees);
	HRESULT NuiCameraElevationGetAngle(LONG* plAngleDegrees);
	HRESULT NuiSkeletonTrackingEnable(HANDLE hNextFrameEvent, DWORD dwFlags);
	HRESULT NuiSkeletonTrackingDisable();
	HRESULT NuiSkeletonGetNextFrame(DWORD dwMillisecondsToWait, NUI_SKELETON_FRAME* pSkeletonFrame);
	HRESULT NuiTransformSmooth(NUI_SKELETON_FRAME* pSkeletonFrame, const(NUI_TRANSFORM_SMOOTH_PARAMETERS)* pSmoothingParams);
	bool MSR_NuiGetPropsBlob(NUI_PROPSINDEX Index, void* pBlob, DWORD* pdwInOutSize);
	NUI_PROPSTYPE MSR_NuiGetPropsType(NUI_PROPSINDEX Index);
	BSTR NuiInstanceName();
    HRESULT NuiStatus();
    DWORD NuiInitializationFlags();
}

export extern(Windows)
{
HRESULT MSR_NUIGetDeviceCount(int* pCount);
HRESULT MSR_NuiCreateInstanceByIndex(int Index, INuiInstance* ppInstance);
void MSR_NuiDestroyInstance(INuiInstance pInstance);
HRESULT MSR_NuiCreateInstanceByName(const(OLECHAR)* strInstanceName, INuiInstance* ppNuiInstance);
}

extern(C){

struct NuiStatusData {
	size_t cb;
	const(OLECHAR)* instanceName;
	HRESULT hrStatus;
}

alias extern(Windows) void function(const(NuiStatusData)*) NuiStatusProc;
export extern(Windows) NuiStatusProc MSR_NuiSetDeviceStatusCallback(NuiStatusProc callback);

bool HasSkeletalEngine(INuiInstance pInstance)
{
	if(pInstance is null)
		return false;
	return (pInstance.NuiInitializationFlags() & NUI_INITIALIZE_FLAG_USES_SKELETON) || (pInstance.NuiInitializationFlags() & NUI_INITIALIZE_FLAG_USES_DEPTH_AND_PLAYER_INDEX);
}

}// extern(C)
