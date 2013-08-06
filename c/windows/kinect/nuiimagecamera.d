/** nuiimagecamera.d

Converted from 'NuiImageCamera.h' in Microsoft's Kinect for Windows SDK.

Version: 1.5
License: $(WEB boost.org/LICENSE_1_0.txt, Boost License 1.0).
Authors: Koji Kishita
*/
module c.windows.kinect.nuiimagecamera;


import c.windows.windef;
import c.windows.kinect.nuiapi;


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

	case NUI_IMAGE_RESOLUTION_1280x960:
		refWidth = 1280;
		refHeight = 960;
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
enum NUI_IMAGE_DEPTH_MAXIMUM_NEAR_MODE = ((3000 << NUI_IMAGE_PLAYER_INDEX_SHIFT) | NUI_IMAGE_PLAYER_INDEX_MASK);
enum NUI_IMAGE_DEPTH_MINIMUM_NEAR_MODE = (400 << NUI_IMAGE_PLAYER_INDEX_SHIFT);
enum NUI_IMAGE_DEPTH_NO_VALUE = 0;
enum NUI_IMAGE_DEPTH_TOO_FAR_VALUE = (0x0fff << NUI_IMAGE_PLAYER_INDEX_SHIFT);
enum NUI_DEPTH_DEPTH_UNKNOWN_VALUE = (0x1fff << NUI_IMAGE_PLAYER_INDEX_SHIFT);

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

USHORT NuiDepthPixelToDepth(USHORT packedPixel)
{
	return packedPixel >> NUI_IMAGE_PLAYER_INDEX_SHIFT;
}

USHORT NuiDepthPixelToPlayerIndex(USHORT packedPixel)
{
	return packedPixel & NUI_IMAGE_PLAYER_INDEX_MASK;
}

enum {
    NUI_IMAGE_DIGITAL_ZOOM_1X = 0,
}
alias int NUI_IMAGE_DIGITALZOOM;

enum {
	NUI_IMAGE_FRAME_FLAG_NONE              = 0x00000000,
	NUI_IMAGE_FRAME_FLAG_VIEW_AREA_UNKNOWN = 0x00000001,
}

enum {
	NUI_IMAGE_STREAM_FLAG_SUPPRESS_NO_FRAME_DATA         = 0x00010000,
	NUI_IMAGE_STREAM_FLAG_ENABLE_NEAR_MODE               = 0x00020000,
	NUI_IMAGE_STREAM_FLAG_DISTINCT_OVERFLOW_DEPTH_VALUES = 0x00040000,
}

enum NUI_IMAGE_STREAM_FRAME_LIMIT_MAXIMUM = 4;

extern(Windows)
{
HRESULT NuiImageStreamSetImageFrameFlags(HANDLE hStream, DWORD dwImageFrameFlags);
HRESULT NuiImageStreamGetImageFrameFlags(HANDLE hStream, DWORD* pdwImageFrameFlags);
HRESULT NuiSetFrameEndEvent(HANDLE hEvent, DWORD dwFrameEventFlag);
HRESULT NuiImageStreamOpen(NUI_IMAGE_TYPE eImageType, NUI_IMAGE_RESOLUTION eResolution, DWORD dwImageFrameFlags, DWORD dwFrameLimit, HANDLE hNextFrameEvent, HANDLE* phStreamHandle);
HRESULT NuiImageStreamGetNextFrame(HANDLE hStream, DWORD dwMillisecondsToWait, const(NUI_IMAGE_FRAME)** ppcImageFrame);
HRESULT NuiImageStreamReleaseFrame(HANDLE hStream, const(NUI_IMAGE_FRAME)* pImageFrame);
HRESULT NuiImageGetColorPixelCoordinatesFromDepthPixel(NUI_IMAGE_RESOLUTION eColorResolution, const(NUI_IMAGE_VIEW_AREA)* pcViewArea, LONG lDepthX, LONG lDepthY, USHORT usDepthValue, LONG* plColorX, LONG* plColorY);
HRESULT NuiImageGetColorPixelCoordinatesFromDepthPixelAtResolution(NUI_IMAGE_RESOLUTION eColorResolution, NUI_IMAGE_RESOLUTION eDepthResolution, const(NUI_IMAGE_VIEW_AREA)* pcViewArea, LONG lDepthX, LONG lDepthY, USHORT usDepthValue, LONG* plColorX, LONG* plColorY);
}

enum NUI_CAMERA_ELEVATION_MAXIMUM = 27;
enum NUI_CAMERA_ELEVATION_MINIMUM = -27;

extern(Windows)
{
HRESULT NuiCameraElevationGetAngle(LONG* plAngleDegrees);
HRESULT NuiCameraElevationSetAngle(LONG lAngleDegrees);
}
