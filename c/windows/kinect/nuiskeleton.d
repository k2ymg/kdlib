/** nuiskeleton.d

Converted from 'NuiSkeleton.h' in Microsoft's Kinect for Windows SDK.

Version: 1.5
License: $(WEB boost.org/LICENSE_1_0.txt, Boost License 1.0).
Authors: Koji Kishita
*/
module c.windows.kinect.nuiskeleton;


import c.windows.windef;
import c.windows.kinect.nuiapi;


enum FLT_EPSILON = 1.192092896e-07F;

enum NUI_SKELETON_MAX_TRACKED_COUNT = 2;
enum NUI_SKELETON_INVALID_TRACKING_ID = 0;

enum NuiSkeletonDataSize = NUI_SKELETON_DATA.sizeof;

enum {
	NUI_SKELETON_QUALITY_CLIPPED_RIGHT  = 0x00000001,
	NUI_SKELETON_QUALITY_CLIPPED_LEFT   = 0x00000002,
	NUI_SKELETON_QUALITY_CLIPPED_TOP    = 0x00000004,
	NUI_SKELETON_QUALITY_CLIPPED_BOTTOM = 0x00000008,
}

enum NUI_SKELETON_FRAME_FLAG_SEATED_SUPPORT_ENABLED = 0x00000008;

enum {
	NUI_SKELETON_TRACKING_FLAG_SUPPRESS_NO_FRAME_DATA       = 0x00000001,
	NUI_SKELETON_TRACKING_FLAG_TITLE_SETS_TRACKED_SKELETONS = 0x00000002,
	NUI_SKELETON_TRACKING_FLAG_ENABLE_SEATED_SUPPORT        = 0x00000004,
	NUI_SKELETON_TRACKING_FLAG_ENABLE_IN_NEAR_RANGE         = 0x00000008,
}

export extern(Windows)
{
HRESULT NuiSkeletonTrackingEnable(HANDLE hNextFrameEvent, DWORD dwFlags);
HRESULT NuiSkeletonTrackingDisable();
HRESULT NuiSkeletonGetNextFrame(DWORD dwMillisecondsToWait, NUI_SKELETON_FRAME* pSkeletonFrame);
HRESULT NuiSkeletonSetTrackedSkeletons(DWORD[NUI_SKELETON_MAX_TRACKED_COUNT] TrackingIDs);
}

enum NUI_CAMERA_DEPTH_IMAGE_TO_SKELETON_MULTIPLIER_320x240 = NUI_CAMERA_DEPTH_NOMINAL_INVERSE_FOCAL_LENGTH_IN_PIXELS;
enum NUI_CAMERA_SKELETON_TO_DEPTH_IMAGE_MULTIPLIER_320x240 = NUI_CAMERA_DEPTH_NOMINAL_FOCAL_LENGTH_IN_PIXELS;

void NuiTransformSkeletonToDepthImage(Vector4 vPoint, LONG* plDepthX, LONG* plDepthY, USHORT* pusDepthValue, NUI_IMAGE_RESOLUTION eResolution)
{
	if((plDepthX == null) || (plDepthY == null) || (pusDepthValue == null))
		return;

	if(vPoint.z > FLT_EPSILON){
		DWORD width;
		DWORD height;

		NuiImageResolutionToSize(eResolution, width, height);
		*plDepthX = cast(INT)(width / 2 + vPoint.x * (width / 320.0f) * NUI_CAMERA_SKELETON_TO_DEPTH_IMAGE_MULTIPLIER_320x240 / vPoint.z + 0.5f);
		*plDepthY = cast(INT)(height / 2 - vPoint.y * (height / 240.0f) * NUI_CAMERA_SKELETON_TO_DEPTH_IMAGE_MULTIPLIER_320x240 / vPoint.z + 0.5f);
		*pusDepthValue = cast(USHORT)(cast(USHORT)(vPoint.z * 1000) << 3);
	}else{
		*plDepthX = 0;
		*plDepthY = 0;
		*pusDepthValue = 0;
	}
}

void NuiTransformSkeletonToDepthImage(Vector4 vPoint, LONG* plDepthX, LONG* plDepthY, USHORT* pusDepthValue)
{
	NuiTransformSkeletonToDepthImage(vPoint, plDepthX, plDepthY, pusDepthValue, NUI_IMAGE_RESOLUTION_320x240);
}

void NuiTransformSkeletonToDepthImage(Vector4 vPoint, FLOAT* pfDepthX, FLOAT* pfDepthY, NUI_IMAGE_RESOLUTION eResolution)
{
	if((pfDepthX == null) || (pfDepthY == null))
		return;

	if(vPoint.z > FLT_EPSILON){
		DWORD width;
		DWORD height;

		NuiImageResolutionToSize(eResolution, width, height);
		*pfDepthX = width / 2 + vPoint.x * (width / 320.0f) * NUI_CAMERA_SKELETON_TO_DEPTH_IMAGE_MULTIPLIER_320x240 / vPoint.z;
		*pfDepthY = height / 2 - vPoint.y * (height / 240.0f) * NUI_CAMERA_SKELETON_TO_DEPTH_IMAGE_MULTIPLIER_320x240 / vPoint.z;
	}else{
		*pfDepthX = 0.0f;
		*pfDepthY = 0.0f;
	}
}

void NuiTransformSkeletonToDepthImage(Vector4 vPoint, FLOAT* pfDepthX, FLOAT* pfDepthY)
{
	NuiTransformSkeletonToDepthImage(vPoint, pfDepthX, pfDepthY, NUI_IMAGE_RESOLUTION_320x240);
}

Vector4 NuiTransformDepthImageToSkeleton(LONG lDepthX, LONG lDepthY, USHORT usDepthValue, NUI_IMAGE_RESOLUTION eResolution)
{
	DWORD width;
	DWORD height;

	NuiImageResolutionToSize( eResolution, width, height);

	FLOAT fSkeletonZ = cast(FLOAT)(usDepthValue >> 3) / 1000.0f;

	FLOAT fSkeletonX = (lDepthX - width / 2.0f) * (320.0f / width) * NUI_CAMERA_DEPTH_IMAGE_TO_SKELETON_MULTIPLIER_320x240 * fSkeletonZ;
	FLOAT fSkeletonY = -(lDepthY - height / 2.0f) * (240.0f / height) * NUI_CAMERA_DEPTH_IMAGE_TO_SKELETON_MULTIPLIER_320x240 * fSkeletonZ;

	Vector4 v4;
	v4.x = fSkeletonX;
	v4.y = fSkeletonY;
	v4.z = fSkeletonZ;
	v4.w = 1.0f;
	return v4;
}

Vector4 NuiTransformDepthImageToSkeleton(LONG lDepthX, LONG lDepthY, USHORT usDepthValue)
{
	return NuiTransformDepthImageToSkeleton(lDepthX, lDepthY, usDepthValue, NUI_IMAGE_RESOLUTION_320x240);
}

export extern(Windows)
{
HRESULT NuiTransformSmooth(NUI_SKELETON_FRAME* pSkeletonFrame, NUI_TRANSFORM_SMOOTH_PARAMETERS* pSmoothingParams);
HRESULT NuiSkeletonCalculateBoneOrientations(const(NUI_SKELETON_DATA)* pSkeletonData, NUI_SKELETON_BONE_ORIENTATION* pBoneOrientations);
}
