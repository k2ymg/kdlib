/** msr_nuiimagecamera.d

Converted from 'MSR_NuiImageCamera.h'.

Version: Beta
Authors: Koji Kishita
*/
module c.windows.kinect.msr_nuiimagecamera;


import c.windows.windef;
import c.windows.kinect.nuiimagebuffer;


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
	NUI_IMAGE_RESOLUTION_1280x1024
}
alias int NUI_IMAGE_RESOLUTION;

extern(C)
void NuiImageResolutionToSize(NUI_IMAGE_RESOLUTION res, ref DWORD refWidth, ref DWORD refHeight)
{
	switch(res){
	case NUI_IMAGE_RESOLUTION_80x60:
		refWidth = 80;
		refHeight = 60;
		break;

	case NUI_IMAGE_RESOLUTION_320x240:
		refWidth = 320;
		refHeight = 240;
		break;

	case NUI_IMAGE_RESOLUTION_640x480:
		refWidth = 640;
		refHeight = 480;
		break;

	case NUI_IMAGE_RESOLUTION_1280x1024:
		refWidth = 1280;
		refHeight = 1024;
		break;

	default:
		refWidth = 0;
		refHeight = 0;
		break;
	}
}

enum NUI_IMAGE_PLAYER_INDEX_SHIFT = 3;
enum NUI_IMAGE_PLAYER_INDEX_MASK = ((1 << NUI_IMAGE_PLAYER_INDEX_SHIFT) - 1);
enum NUI_IMAGE_DEPTH_MAXIMUM = ((4000 << NUI_IMAGE_PLAYER_INDEX_SHIFT) | NUI_IMAGE_PLAYER_INDEX_MASK);
enum NUI_IMAGE_DEPTH_MINIMUM = (800 << NUI_IMAGE_PLAYER_INDEX_SHIFT);
enum NUI_IMAGE_DEPTH_NO_VALUE = 0;

enum NUI_CAMERA_DEPTH_NOMINAL_FOCAL_LENGTH_IN_PIXELS         = 285.63f;
enum NUI_CAMERA_DEPTH_NOMINAL_INVERSE_FOCAL_LENGTH_IN_PIXELS = 3.501e-3f;
enum NUI_CAMERA_DEPTH_NOMINAL_DIAGONAL_FOV                   = 70.0f;
enum NUI_CAMERA_DEPTH_NOMINAL_HORIZONTAL_FOV                 = 58.5f;
enum NUI_CAMERA_DEPTH_NOMINAL_VERTICAL_FOV                   = 45.6f;

enum NUI_CAMERA_COLOR_NOMINAL_FOCAL_LENGTH_IN_PIXELS         = 531.15f;
enum NUI_CAMERA_COLOR_NOMINAL_INVERSE_FOCAL_LENGTH_IN_PIXELS = 1.83e-3f;
enum NUI_CAMERA_COLOR_NOMINAL_DIAGONAL_FOV                   = 73.9f;
enum NUI_CAMERA_COLOR_NOMINAL_HORIZONTAL_FOV                 = 62.0f;
enum NUI_CAMERA_COLOR_NOMINAL_VERTICAL_FOV                   = 48.6f;

align(8)
struct NUI_IMAGE_VIEW_AREA {
	int eDigitalZoom_NotUsed;
	LONG lCenterX_NotUsed;
	LONG lCenterY_NotUsed;
}

align(8)
struct NUI_LOCKED_RECT {
	INT Pitch;
	void* pBits;
}

struct NUI_SURFACE_DESC {
	UINT Width;
	UINT Height;
}

interface INuiFrameTexture {
public extern(Windows):
	int  BufferLen();
	int Pitch();
	HRESULT LockRect(UINT Level, NUI_LOCKED_RECT* pLockedRect, const(RECT)* pRectUsuallyNull, DWORD Flags);
    HRESULT GetLevelDesc(UINT Level, NUI_SURFACE_DESC* pDesc);
    HRESULT UnlockRect(UINT Level);
}

deprecated alias INuiFrameTexture NuiImageBuffer;
deprecated alias NUI_LOCKED_RECT KINECT_LOCKED_RECT;
deprecated alias NUI_SURFACE_DESC KINECT_SURFACE_DESC;

align(8)
struct NUI_IMAGE_FRAME {
	LARGE_INTEGER liTimeStamp;
	DWORD dwFrameNumber;
	NUI_IMAGE_TYPE eImageType;
	NUI_IMAGE_RESOLUTION eResolution;
	INuiFrameTexture* pFrameTexture;
	DWORD dwFrameFlags_NotUsed;
	NUI_IMAGE_VIEW_AREA ViewArea_NotUsed;
}

enum NUI_IMAGE_STREAM_FRAME_LIMIT_MAXIMUM = 4;
enum NUI_IMAGE_STREAM_FLAG_SUPPRESS_NO_FRAME_DATA = 0x00010000;

extern(Windows)
{
HRESULT NuiImageStreamOpen(NUI_IMAGE_TYPE eImageType, NUI_IMAGE_RESOLUTION eResolution, DWORD dwImageFrameFlags_NotUsed, DWORD dwFrameLimit, HANDLE hNextFrameEvent, HANDLE* phStreamHandle);
HRESULT NuiImageStreamGetNextFrame(HANDLE hStream, DWORD dwMillisecondsToWait, const(NUI_IMAGE_FRAME)** ppcImageFrame);
HRESULT NuiImageStreamReleaseFrame(HANDLE hStream, const(NUI_IMAGE_FRAME)* pImageFrame);
HRESULT NuiImageGetColorPixelCoordinatesFromDepthPixel(NUI_IMAGE_RESOLUTION eColorResolution, const(NUI_IMAGE_VIEW_AREA)* pcViewArea, LONG lDepthX, LONG lDepthY, USHORT usDepthValue, LONG* plColorX, LONG* plColorY);
}

enum NUI_CAMERA_ELEVATION_MAXIMUM = 27;
enum NUI_CAMERA_ELEVATION_MINIMUM = -27;

extern(Windows)
{
HRESULT NuiCameraElevationSetAngle(LONG lAngleDegrees);
HRESULT NuiCameraElevationGetAngle(LONG* plAngleDegrees);
}
