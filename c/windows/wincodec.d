/** wincodec.d

Converted from 'wincodec.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.wincodec;


import c.windows.windef;
import c.windows.wtypes;
import c.windows.guiddef;
import c.windows.unknwn;
import c.windows.objidl;
import c.windows.oaidl;
import c.windows.ocidl;
import c.windows.propidl;
import c.windows.rpcdcep;
import c.windows.winerror;

extern(C){

enum WINCODEC_SDK_VERSION = 0x0236;

mixin DEFINE_GUID!("CLSID_WICImagingFactory", 0xcacaf262, 0x9370, 0x4615, 0xa1, 0x3b, 0x9f, 0x55, 0x39, 0xda, 0x4c, 0xa);
mixin DEFINE_GUID!("GUID_VendorMicrosoft", 0xf0e749ca, 0xedef, 0x4589, 0xa7, 0x3a, 0xee, 0xe, 0x62, 0x6a, 0x2a, 0x2b);
mixin DEFINE_GUID!("GUID_VendorMicrosoftBuiltIn", 0x257a30fd, 0x6b6, 0x462b, 0xae, 0xa4, 0x63, 0xf7, 0xb, 0x86, 0xe5, 0x33);
mixin DEFINE_GUID!("CLSID_WICBmpDecoder", 0x6b462062, 0x7cbf, 0x400d, 0x9f, 0xdb, 0x81, 0x3d, 0xd1, 0x0f, 0x27, 0x78);
mixin DEFINE_GUID!("CLSID_WICPngDecoder", 0x389ea17b, 0x5078, 0x4cde, 0xb6, 0xef, 0x25, 0xc1, 0x51, 0x75, 0xc7, 0x51);
mixin DEFINE_GUID!("CLSID_WICIcoDecoder", 0xc61bfcdf, 0x2e0f, 0x4aad, 0xa8, 0xd7, 0xe0, 0x6b, 0xaf, 0xeb, 0xcd, 0xfe);
mixin DEFINE_GUID!("CLSID_WICJpegDecoder", 0x9456a480, 0xe88b, 0x43ea, 0x9e, 0x73, 0x0b, 0x2d, 0x9b, 0x71, 0xb1, 0xca);
mixin DEFINE_GUID!("CLSID_WICGifDecoder", 0x381dda3c, 0x9ce9, 0x4834, 0xa2, 0x3e, 0x1f, 0x98, 0xf8, 0xfc, 0x52, 0xbe);
mixin DEFINE_GUID!("CLSID_WICTiffDecoder", 0xb54e85d9, 0xfe23, 0x499f, 0x8b, 0x88, 0x6a, 0xce, 0xa7, 0x13, 0x75, 0x2b);
mixin DEFINE_GUID!("CLSID_WICWmpDecoder", 0xa26cec36, 0x234c, 0x4950, 0xae, 0x16, 0xe3, 0x4a, 0xac, 0xe7, 0x1d, 0x0d);
mixin DEFINE_GUID!("CLSID_WICBmpEncoder", 0x69be8bb4, 0xd66d, 0x47c8, 0x86, 0x5a, 0xed, 0x15, 0x89, 0x43, 0x37, 0x82);
mixin DEFINE_GUID!("CLSID_WICPngEncoder", 0x27949969, 0x876a, 0x41d7, 0x94, 0x47, 0x56, 0x8f, 0x6a, 0x35, 0xa4, 0xdc);
mixin DEFINE_GUID!("CLSID_WICJpegEncoder", 0x1a34f5c1, 0x4a5a, 0x46dc, 0xb6, 0x44, 0x1f, 0x45, 0x67, 0xe7, 0xa6, 0x76);
mixin DEFINE_GUID!("CLSID_WICGifEncoder", 0x114f5598, 0x0b22, 0x40a0, 0x86, 0xa1, 0xc8, 0x3e, 0xa4, 0x95, 0xad, 0xbd);
mixin DEFINE_GUID!("CLSID_WICTiffEncoder", 0x0131be10, 0x2001, 0x4c5f, 0xa9, 0xb0, 0xcc, 0x88, 0xfa, 0xb6, 0x4c, 0xe8);
mixin DEFINE_GUID!("CLSID_WICWmpEncoder", 0xac4ce3cb, 0xe1c1, 0x44cd, 0x82, 0x15, 0x5a, 0x16, 0x65, 0x50, 0x9e, 0xc2);
mixin DEFINE_GUID!("GUID_ContainerFormatBmp", 0x0af1d87e, 0xfcfe, 0x4188, 0xbd, 0xeb, 0xa7, 0x90, 0x64, 0x71, 0xcb, 0xe3);
mixin DEFINE_GUID!("GUID_ContainerFormatPng", 0x1b7cfaf4, 0x713f, 0x473c, 0xbb, 0xcd, 0x61, 0x37, 0x42, 0x5f, 0xae, 0xaf);
mixin DEFINE_GUID!("GUID_ContainerFormatIco", 0xa3a860c4, 0x338f, 0x4c17, 0x91, 0x9a, 0xfb, 0xa4, 0xb5, 0x62, 0x8f, 0x21);
mixin DEFINE_GUID!("GUID_ContainerFormatJpeg", 0x19e4a5aa, 0x5662, 0x4fc5, 0xa0, 0xc0, 0x17, 0x58, 0x02, 0x8e, 0x10, 0x57);
mixin DEFINE_GUID!("GUID_ContainerFormatTiff", 0x163bcc30, 0xe2e9, 0x4f0b, 0x96, 0x1d, 0xa3, 0xe9, 0xfd, 0xb7, 0x88, 0xa3);
mixin DEFINE_GUID!("GUID_ContainerFormatGif", 0x1f8a5601, 0x7d4d, 0x4cbd, 0x9c, 0x82, 0x1b, 0xc8, 0xd4, 0xee, 0xb9, 0xa5);
mixin DEFINE_GUID!("GUID_ContainerFormatWmp", 0x57a37caa, 0x367a, 0x4540, 0x91, 0x6b, 0xf1, 0x83, 0xc5, 0x09, 0x3a, 0x4b);
mixin DEFINE_GUID!("CLSID_WICImagingCategories", 0xfae3d380, 0xfea4, 0x4623, 0x8c, 0x75, 0xc6, 0xb6, 0x11, 0x10, 0xb6, 0x81);
mixin DEFINE_GUID!("CATID_WICBitmapDecoders", 0x7ed96837, 0x96f0, 0x4812, 0xb2, 0x11, 0xf1, 0x3c, 0x24, 0x11, 0x7e, 0xd3);
mixin DEFINE_GUID!("CATID_WICBitmapEncoders", 0xac757296, 0x3522, 0x4e11, 0x98, 0x62, 0xc1, 0x7b, 0xe5, 0xa1, 0x76, 0x7e);
mixin DEFINE_GUID!("CATID_WICPixelFormats", 0x2b46e70f, 0xcda7, 0x473e, 0x89, 0xf6, 0xdc, 0x96, 0x30, 0xa2, 0x39, 0x0b);
mixin DEFINE_GUID!("CATID_WICFormatConverters", 0x7835eae8, 0xbf14, 0x49d1, 0x93, 0xce, 0x53, 0x3a, 0x40, 0x7b, 0x22, 0x48);
mixin DEFINE_GUID!("CATID_WICMetadataReader", 0x05af94d8, 0x7174, 0x4cd2, 0xbe, 0x4a, 0x41, 0x24, 0xb8, 0x0e, 0xe4, 0xb8);
mixin DEFINE_GUID!("CATID_WICMetadataWriter", 0xabe3b9a4, 0x257d, 0x4b97, 0xbd, 0x1a, 0x29, 0x4a, 0xf4, 0x96, 0x22, 0x2e);
mixin DEFINE_GUID!("CLSID_WICDefaultFormatConverter", 0x1a3f11dc, 0xb514, 0x4b17, 0x8c, 0x5f, 0x21, 0x54, 0x51, 0x38, 0x52, 0xf1);
mixin DEFINE_GUID!("CLSID_WICFormatConverterHighColor", 0xac75d454, 0x9f37, 0x48f8, 0xb9, 0x72, 0x4e, 0x19, 0xbc, 0x85, 0x60, 0x11);
mixin DEFINE_GUID!("CLSID_WICFormatConverterNChannel", 0xc17cabb2, 0xd4a3, 0x47d7, 0xa5, 0x57, 0x33, 0x9b, 0x2e, 0xfb, 0xd4, 0xf1);
mixin DEFINE_GUID!("CLSID_WICFormatConverterWMPhoto", 0x9cb5172b, 0xd600, 0x46ba, 0xab, 0x77, 0x77, 0xbb, 0x7e, 0x3a, 0x00, 0xd9);

alias UINT32 WICColor;

struct WICRect {
	INT X;
	INT Y;
	INT Width;
	INT Height;
}

alias BYTE* WICInProcPointer;

enum {
	WICColorContextUninitialized  = 0,
	WICColorContextProfile        = 0x1,
	WICColorContextExifColorSpace = 0x2
}
alias int WICColorContextType;

alias REFGUID REFWICPixelFormatGUID;
alias GUID WICPixelFormatGUID;

mixin DEFINE_GUID!("GUID_WICPixelFormatDontCare", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x00);
mixin DEFINE_GUID!("GUID_WICPixelFormat1bppIndexed", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x01);
mixin DEFINE_GUID!("GUID_WICPixelFormat2bppIndexed", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x02);
mixin DEFINE_GUID!("GUID_WICPixelFormat4bppIndexed", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x03);
mixin DEFINE_GUID!("GUID_WICPixelFormat8bppIndexed", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x04);
mixin DEFINE_GUID!("GUID_WICPixelFormatBlackWhite", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x05);
mixin DEFINE_GUID!("GUID_WICPixelFormat2bppGray", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x06);
mixin DEFINE_GUID!("GUID_WICPixelFormat4bppGray", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x07);
mixin DEFINE_GUID!("GUID_WICPixelFormat8bppGray", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x08);
mixin DEFINE_GUID!("GUID_WICPixelFormat8bppAlpha", 0xe6cd0116, 0xeeba, 0x4161, 0xaa, 0x85, 0x27, 0xdd, 0x9f, 0xb3, 0xa8, 0x95);
mixin DEFINE_GUID!("GUID_WICPixelFormat16bppBGR555", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x09);
mixin DEFINE_GUID!("GUID_WICPixelFormat16bppBGR565", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x0a);
mixin DEFINE_GUID!("GUID_WICPixelFormat16bppBGRA5551", 0x05ec7c2b, 0xf1e6, 0x4961, 0xad, 0x46, 0xe1, 0xcc, 0x81, 0x0a, 0x87, 0xd2);
mixin DEFINE_GUID!("GUID_WICPixelFormat16bppGray", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x0b);
mixin DEFINE_GUID!("GUID_WICPixelFormat24bppBGR", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x0c);
mixin DEFINE_GUID!("GUID_WICPixelFormat24bppRGB", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x0d);
mixin DEFINE_GUID!("GUID_WICPixelFormat32bppBGR", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x0e);
mixin DEFINE_GUID!("GUID_WICPixelFormat32bppBGRA", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x0f);
mixin DEFINE_GUID!("GUID_WICPixelFormat32bppPBGRA", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x10);
mixin DEFINE_GUID!("GUID_WICPixelFormat32bppGrayFloat", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x11);
mixin DEFINE_GUID!("GUID_WICPixelFormat32bppRGBA", 0xf5c7ad2d, 0x6a8d, 0x43dd, 0xa7, 0xa8, 0xa2, 0x99, 0x35, 0x26, 0x1a, 0xe9);
mixin DEFINE_GUID!("GUID_WICPixelFormat32bppPRGBA", 0x3cc4a650, 0xa527, 0x4d37, 0xa9, 0x16, 0x31, 0x42, 0xc7, 0xeb, 0xed, 0xba);
mixin DEFINE_GUID!("GUID_WICPixelFormat48bppRGB", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x15);
mixin DEFINE_GUID!("GUID_WICPixelFormat48bppBGR", 0xe605a384, 0xb468, 0x46ce, 0xbb, 0x2e, 0x36, 0xf1, 0x80, 0xe6, 0x43, 0x13);
mixin DEFINE_GUID!("GUID_WICPixelFormat64bppRGBA", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x16);
mixin DEFINE_GUID!("GUID_WICPixelFormat64bppBGRA", 0x1562ff7c, 0xd352, 0x46f9, 0x97, 0x9e, 0x42, 0x97, 0x6b, 0x79, 0x22, 0x46);
mixin DEFINE_GUID!("GUID_WICPixelFormat64bppPRGBA", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x17);
mixin DEFINE_GUID!("GUID_WICPixelFormat64bppPBGRA", 0x8c518e8e, 0xa4ec, 0x468b, 0xae, 0x70, 0xc9, 0xa3, 0x5a, 0x9c, 0x55, 0x30);
mixin DEFINE_GUID!("GUID_WICPixelFormat16bppGrayFixedPoint", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x13);
mixin DEFINE_GUID!("GUID_WICPixelFormat32bppBGR101010", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x14);
mixin DEFINE_GUID!("GUID_WICPixelFormat48bppRGBFixedPoint", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x12);
mixin DEFINE_GUID!("GUID_WICPixelFormat48bppBGRFixedPoint", 0x49ca140e, 0xcab6, 0x493b, 0x9d, 0xdf, 0x60, 0x18, 0x7c, 0x37, 0x53, 0x2a);
mixin DEFINE_GUID!("GUID_WICPixelFormat96bppRGBFixedPoint", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x18);
mixin DEFINE_GUID!("GUID_WICPixelFormat128bppRGBAFloat", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x19);
mixin DEFINE_GUID!("GUID_WICPixelFormat128bppPRGBAFloat", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x1a);
mixin DEFINE_GUID!("GUID_WICPixelFormat128bppRGBFloat", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x1b);
mixin DEFINE_GUID!("GUID_WICPixelFormat32bppCMYK", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x1c);
mixin DEFINE_GUID!("GUID_WICPixelFormat64bppRGBAFixedPoint", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x1d);
mixin DEFINE_GUID!("GUID_WICPixelFormat64bppBGRAFixedPoint", 0x356de33c, 0x54d2, 0x4a23, 0xbb, 0x4, 0x9b, 0x7b, 0xf9, 0xb1, 0xd4, 0x2d);
mixin DEFINE_GUID!("GUID_WICPixelFormat64bppRGBFixedPoint", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x40);
mixin DEFINE_GUID!("GUID_WICPixelFormat128bppRGBAFixedPoint", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x1e);
mixin DEFINE_GUID!("GUID_WICPixelFormat128bppRGBFixedPoint", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x41);
mixin DEFINE_GUID!("GUID_WICPixelFormat64bppRGBAHalf", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x3a);
mixin DEFINE_GUID!("GUID_WICPixelFormat64bppRGBHalf", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x42);
mixin DEFINE_GUID!("GUID_WICPixelFormat48bppRGBHalf", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x3b);
mixin DEFINE_GUID!("GUID_WICPixelFormat32bppRGBE", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x3d);
mixin DEFINE_GUID!("GUID_WICPixelFormat16bppGrayHalf", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x3e);
mixin DEFINE_GUID!("GUID_WICPixelFormat32bppGrayFixedPoint", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x3f);
mixin DEFINE_GUID!("GUID_WICPixelFormat32bppRGBA1010102", 0x25238D72, 0xFCF9, 0x4522, 0xb5, 0x14, 0x55, 0x78, 0xe5, 0xad, 0x55, 0xe0);
mixin DEFINE_GUID!("GUID_WICPixelFormat32bppRGBA1010102XR", 0x00DE6B9A, 0xC101, 0x434b, 0xb5, 0x02, 0xd0, 0x16, 0x5e, 0xe1, 0x12, 0x2c);
mixin DEFINE_GUID!("GUID_WICPixelFormat64bppCMYK", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x1f);
mixin DEFINE_GUID!("GUID_WICPixelFormat24bpp3Channels", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x20);
mixin DEFINE_GUID!("GUID_WICPixelFormat32bpp4Channels", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x21);
mixin DEFINE_GUID!("GUID_WICPixelFormat40bpp5Channels", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x22);
mixin DEFINE_GUID!("GUID_WICPixelFormat48bpp6Channels", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x23);
mixin DEFINE_GUID!("GUID_WICPixelFormat56bpp7Channels", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x24);
mixin DEFINE_GUID!("GUID_WICPixelFormat64bpp8Channels", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x25);
mixin DEFINE_GUID!("GUID_WICPixelFormat48bpp3Channels", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x26);
mixin DEFINE_GUID!("GUID_WICPixelFormat64bpp4Channels", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x27);
mixin DEFINE_GUID!("GUID_WICPixelFormat80bpp5Channels", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x28);
mixin DEFINE_GUID!("GUID_WICPixelFormat96bpp6Channels", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x29);
mixin DEFINE_GUID!("GUID_WICPixelFormat112bpp7Channels", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x2a);
mixin DEFINE_GUID!("GUID_WICPixelFormat128bpp8Channels", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x2b);
mixin DEFINE_GUID!("GUID_WICPixelFormat40bppCMYKAlpha", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x2c);
mixin DEFINE_GUID!("GUID_WICPixelFormat80bppCMYKAlpha", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x2d);
mixin DEFINE_GUID!("GUID_WICPixelFormat32bpp3ChannelsAlpha", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x2e);
mixin DEFINE_GUID!("GUID_WICPixelFormat40bpp4ChannelsAlpha", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x2f);
mixin DEFINE_GUID!("GUID_WICPixelFormat48bpp5ChannelsAlpha", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x30);
mixin DEFINE_GUID!("GUID_WICPixelFormat56bpp6ChannelsAlpha", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x31);
mixin DEFINE_GUID!("GUID_WICPixelFormat64bpp7ChannelsAlpha", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x32);
mixin DEFINE_GUID!("GUID_WICPixelFormat72bpp8ChannelsAlpha", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x33);
mixin DEFINE_GUID!("GUID_WICPixelFormat64bpp3ChannelsAlpha", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x34);
mixin DEFINE_GUID!("GUID_WICPixelFormat80bpp4ChannelsAlpha", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x35);
mixin DEFINE_GUID!("GUID_WICPixelFormat96bpp5ChannelsAlpha", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x36);
mixin DEFINE_GUID!("GUID_WICPixelFormat112bpp6ChannelsAlpha", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x37);
mixin DEFINE_GUID!("GUID_WICPixelFormat128bpp7ChannelsAlpha", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x38);
mixin DEFINE_GUID!("GUID_WICPixelFormat144bpp8ChannelsAlpha", 0x6fddc324, 0x4e03, 0x4bfe, 0xb1, 0x85, 0x3d, 0x77, 0x76, 0x8d, 0xc9, 0x39);

alias GUID_WICPixelFormatDontCare GUID_WICPixelFormatUndefined;

enum {
	WICBitmapNoCache                       = 0,
	WICBitmapCacheOnDemand                 = 0x1,
	WICBitmapCacheOnLoad                   = 0x2,
	WICBITMAPCREATECACHEOPTION_FORCE_DWORD = 0x7fffffff
}
alias int WICBitmapCreateCacheOption;

enum {
	WICDecodeMetadataCacheOnDemand     = 0,
	WICDecodeMetadataCacheOnLoad       = 0x1,
	WICMETADATACACHEOPTION_FORCE_DWORD = 0x7fffffff
}
alias int WICDecodeOptions;

enum {
	WICBitmapEncoderCacheInMemory           = 0,
	WICBitmapEncoderCacheTempFile           = 0x1,
	WICBitmapEncoderNoCache                 = 0x2,
	WICBITMAPENCODERCACHEOPTION_FORCE_DWORD = 0x7fffffff
}
alias int WICBitmapEncoderCacheOption;

enum {
	WICDecoder                   = 0x1,
	WICEncoder                   = 0x2,
	WICPixelFormatConverter      = 0x4,
	WICMetadataReader            = 0x8,
	WICMetadataWriter            = 0x10,
	WICPixelFormat               = 0x20,
	WICAllComponents             = 0x3f,
	WICCOMPONENTTYPE_FORCE_DWORD = 0x7fffffff
}
alias int WICComponentType;

enum {
	WICComponentEnumerateDefault             = 0,
	WICComponentEnumerateRefresh             = 0x1,
	WICComponentEnumerateDisabled            = 0x80000000,
	WICComponentEnumerateUnsigned            = 0x40000000,
	WICComponentEnumerateBuiltInOnly         = 0x20000000,
	WICCOMPONENTENUMERATEOPTIONS_FORCE_DWORD = 0x7fffffff
}
alias int WICComponentEnumerateOptions;

struct WICBitmapPattern {
	ULARGE_INTEGER Position;
	ULONG Length;
	BYTE* Pattern;
	BYTE* Mask;
	BOOL EndOfStream;
}

enum {
	WICBitmapInterpolationModeNearestNeighbor = 0,
	WICBitmapInterpolationModeLinear          = 0x1,
	WICBitmapInterpolationModeCubic           = 0x2,
	WICBitmapInterpolationModeFant            = 0x3,
	WICBITMAPINTERPOLATIONMODE_FORCE_DWORD    = 0x7fffffff
}
alias int WICBitmapInterpolationMode;

enum {
	WICBitmapPaletteTypeCustom           = 0,
	WICBitmapPaletteTypeMedianCut        = 0x1,
	WICBitmapPaletteTypeFixedBW          = 0x2,
	WICBitmapPaletteTypeFixedHalftone8   = 0x3,
	WICBitmapPaletteTypeFixedHalftone27  = 0x4,
	WICBitmapPaletteTypeFixedHalftone64  = 0x5,
	WICBitmapPaletteTypeFixedHalftone125 = 0x6,
	WICBitmapPaletteTypeFixedHalftone216 = 0x7,
	WICBitmapPaletteTypeFixedWebPalette  = WICBitmapPaletteTypeFixedHalftone216,
	WICBitmapPaletteTypeFixedHalftone252 = 0x8,
	WICBitmapPaletteTypeFixedHalftone256 = 0x9,
	WICBitmapPaletteTypeFixedGray4       = 0xa,
	WICBitmapPaletteTypeFixedGray16      = 0xb,
	WICBitmapPaletteTypeFixedGray256     = 0xc,
	WICBITMAPPALETTETYPE_FORCE_DWORD     = 0x7fffffff
}
alias int WICBitmapPaletteType;

enum {
	WICBitmapDitherTypeNone           = 0,
	WICBitmapDitherTypeSolid          = 0,
	WICBitmapDitherTypeOrdered4x4     = 0x1,
	WICBitmapDitherTypeOrdered8x8     = 0x2,
	WICBitmapDitherTypeOrdered16x16   = 0x3,
	WICBitmapDitherTypeSpiral4x4      = 0x4,
	WICBitmapDitherTypeSpiral8x8      = 0x5,
	WICBitmapDitherTypeDualSpiral4x4  = 0x6,
	WICBitmapDitherTypeDualSpiral8x8  = 0x7,
	WICBitmapDitherTypeErrorDiffusion = 0x8,
	WICBITMAPDITHERTYPE_FORCE_DWORD   = 0x7fffffff
}
alias int WICBitmapDitherType;

enum {
	WICBitmapUseAlpha                        = 0,
	WICBitmapUsePremultipliedAlpha           = 0x1,
	WICBitmapIgnoreAlpha                     = 0x2,
	WICBITMAPALPHACHANNELOPTIONS_FORCE_DWORD = 0x7fffffff
}
alias int WICBitmapAlphaChannelOption;

enum {
	WICBitmapTransformRotate0             = 0,
	WICBitmapTransformRotate90            = 0x1,
	WICBitmapTransformRotate180           = 0x2,
	WICBitmapTransformRotate270           = 0x3,
	WICBitmapTransformFlipHorizontal      = 0x8,
	WICBitmapTransformFlipVertical        = 0x10,
	WICBITMAPTRANSFORMOPTIONS_FORCE_DWORD = 0x7fffffff
}
alias int WICBitmapTransformOptions;

enum {
	WICBitmapLockRead              = 0x1,
	WICBitmapLockWrite             = 0x2,
	WICBITMAPLOCKFLAGS_FORCE_DWORD = 0x7fffffff
}
alias int WICBitmapLockFlags;

enum {
	WICBitmapDecoderCapabilitySameEncoder          = 0x1,
	WICBitmapDecoderCapabilityCanDecodeAllImages   = 0x2,
	WICBitmapDecoderCapabilityCanDecodeSomeImages  = 0x4,
	WICBitmapDecoderCapabilityCanEnumerateMetadata = 0x8,
	WICBitmapDecoderCapabilityCanDecodeThumbnail   = 0x10,
	WICBITMAPDECODERCAPABILITIES_FORCE_DWORD       = 0x7fffffff
}
alias int WICBitmapDecoderCapabilities;

enum {
	WICProgressOperationCopyPixels   = 0x1,
	WICProgressOperationWritePixels  = 0x2,
	WICProgressOperationAll          = 0xffff,
	WICPROGRESSOPERATION_FORCE_DWORD = 0x7fffffff
}
alias int WICProgressOperation;

enum {
	WICProgressNotificationBegin        = 0x10000,
	WICProgressNotificationEnd          = 0x20000,
	WICProgressNotificationFrequent     = 0x40000,
	WICProgressNotificationAll          = 0xffff0000,
	WICPROGRESSNOTIFICATION_FORCE_DWORD = 0x7fffffff
}
alias int WICProgressNotification;

enum {
	WICComponentSigned              = 0x1,
	WICComponentUnsigned            = 0x2,
	WICComponentSafe                = 0x4,
	WICComponentDisabled            = 0x80000000,
	WICCOMPONENTSIGNING_FORCE_DWORD = 0x7fffffff
}
alias int WICComponentSigning;

enum {
	WICGifLogicalScreenSignature                        = 0x1,
	WICGifLogicalScreenDescriptorWidth                  = 0x2,
	WICGifLogicalScreenDescriptorHeight                 = 0x3,
	WICGifLogicalScreenDescriptorGlobalColorTableFlag   = 0x4,
	WICGifLogicalScreenDescriptorColorResolution        = 0x5,
	WICGifLogicalScreenDescriptorSortFlag               = 0x6,
	WICGifLogicalScreenDescriptorGlobalColorTableSize   = 0x7,
	WICGifLogicalScreenDescriptorBackgroundColorIndex   = 0x8,
	WICGifLogicalScreenDescriptorPixelAspectRatio       = 0x9,
	WICGifLogicalScreenDescriptorProperties_FORCE_DWORD = 0x7fffffff
}
alias int WICGifLogicalScreenDescriptorProperties;

enum {
	WICGifImageDescriptorLeft                   = 0x1,
	WICGifImageDescriptorTop                    = 0x2,
	WICGifImageDescriptorWidth                  = 0x3,
	WICGifImageDescriptorHeight                 = 0x4,
	WICGifImageDescriptorLocalColorTableFlag    = 0x5,
	WICGifImageDescriptorInterlaceFlag          = 0x6,
	WICGifImageDescriptorSortFlag               = 0x7,
	WICGifImageDescriptorLocalColorTableSize    = 0x8,
	WICGifImageDescriptorProperties_FORCE_DWORD = 0x7fffffff
}
alias int WICGifImageDescriptorProperties;

enum {
	WICGifGraphicControlExtensionDisposal               = 0x1,
	WICGifGraphicControlExtensionUserInputFlag          = 0x2,
	WICGifGraphicControlExtensionTransparencyFlag       = 0x3,
	WICGifGraphicControlExtensionDelay                  = 0x4,
	WICGifGraphicControlExtensionTransparentColorIndex  = 0x5,
	WICGifGraphicControlExtensionProperties_FORCE_DWORD = 0x7fffffff
}
alias int WICGifGraphicControlExtensionProperties;

enum {
	WICGifApplicationExtensionApplication            = 0x1,
	WICGifApplicationExtensionData                   = 0x2,
	WICGifApplicationExtensionProperties_FORCE_DWORD = 0x7fffffff
}
alias int WICGifApplicationExtensionProperties;

enum {
	WICGifCommentExtensionText                   = 0x1,
	WICGifCommentExtensionProperties_FORCE_DWORD = 0x7fffffff
}
alias int WICGifCommentExtensionProperties;

enum {
	WICJpegCommentText                   = 0x1,
	WICJpegCommentProperties_FORCE_DWORD = 0x7fffffff
}
alias int WICJpegCommentProperties;

enum {
	WICJpegLuminanceTable                  = 0x1,
	WICJpegLuminanceProperties_FORCE_DWORD = 0x7fffffff
}
alias int WICJpegLuminanceProperties;

enum {
	WICJpegChrominanceTable                  = 0x1,
	WICJpegChrominanceProperties_FORCE_DWORD = 0x7fffffff
}
alias int WICJpegChrominanceProperties;

enum {
	WIC8BIMIptcPString                = 0,
	WIC8BIMIptcEmbeddedIPTC           = 0x1,
	WIC8BIMIptcProperties_FORCE_DWORD = 0x7fffffff
}
alias int WIC8BIMIptcProperties;

enum {
	WIC8BIMResolutionInfoPString                = 0x1,
	WIC8BIMResolutionInfoHResolution            = 0x2,
	WIC8BIMResolutionInfoHResolutionUnit        = 0x3,
	WIC8BIMResolutionInfoWidthUnit              = 0x4,
	WIC8BIMResolutionInfoVResolution            = 0x5,
	WIC8BIMResolutionInfoVResolutionUnit        = 0x6,
	WIC8BIMResolutionInfoHeightUnit             = 0x7,
	WIC8BIMResolutionInfoProperties_FORCE_DWORD = 0x7fffffff
}
alias int WIC8BIMResolutionInfoProperties;

enum {
	WIC8BIMIptcDigestPString                = 0x1,
	WIC8BIMIptcDigestIptcDigest             = 0x2,
	WIC8BIMIptcDigestProperties_FORCE_DWORD = 0x7fffffff
}
alias int WIC8BIMIptcDigestProperties;

enum {
	WICPngGamaGamma                  = 0x1,
	WICPngGamaProperties_FORCE_DWORD = 0x7fffffff
}
alias int WICPngGamaProperties;

enum {
	WICPngBkgdBackgroundColor        = 0x1,
	WICPngBkgdProperties_FORCE_DWORD = 0x7fffffff
}
alias int WICPngBkgdProperties;

enum {
	WICPngItxtKeyword                = 0x1,
	WICPngItxtCompressionFlag        = 0x2,
	WICPngItxtLanguageTag            = 0x3,
	WICPngItxtTranslatedKeyword      = 0x4,
	WICPngItxtText                   = 0x5,
	WICPngItxtProperties_FORCE_DWORD = 0x7fffffff
}
alias int WICPngItxtProperties;

enum {
	WICPngChrmWhitePointX            = 0x1,
	WICPngChrmWhitePointY            = 0x2,
	WICPngChrmRedX                   = 0x3,
	WICPngChrmRedY                   = 0x4,
	WICPngChrmGreenX                 = 0x5,
	WICPngChrmGreenY                 = 0x6,
	WICPngChrmBlueX                  = 0x7,
	WICPngChrmBlueY                  = 0x8,
	WICPngChrmProperties_FORCE_DWORD = 0x7fffffff
}
alias int WICPngChrmProperties;

enum {
	WICPngHistFrequencies            = 0x1,
	WICPngHistProperties_FORCE_DWORD = 0x7fffffff
}
alias int WICPngHistProperties;

enum {
	WICPngIccpProfileName            = 0x1,
	WICPngIccpProfileData            = 0x2,
	WICPngIccpProperties_FORCE_DWORD = 0x7fffffff
}
alias int WICPngIccpProperties;

enum {
	WICPngSrgbRenderingIntent        = 0x1,
	WICPngSrgbProperties_FORCE_DWORD = 0x7fffffff
}
alias int WICPngSrgbProperties;

enum {
	WICPngTimeYear                   = 0x1,
	WICPngTimeMonth                  = 0x2,
	WICPngTimeDay                    = 0x3,
	WICPngTimeHour                   = 0x4,
	WICPngTimeMinute                 = 0x5,
	WICPngTimeSecond                 = 0x6,
	WICPngTimeProperties_FORCE_DWORD = 0x7fffffff
}
alias int WICPngTimeProperties;

enum {
	WICSectionAccessLevelRead         = 0x1,
	WICSectionAccessLevelReadWrite    = 0x3,
	WICSectionAccessLevel_FORCE_DWORD = 0x7fffffff
}
alias int WICSectionAccessLevel;

enum {
	WICPixelFormatNumericRepresentationUnspecified     = 0,
	WICPixelFormatNumericRepresentationIndexed         = 0x1,
	WICPixelFormatNumericRepresentationUnsignedInteger = 0x2,
	WICPixelFormatNumericRepresentationSignedInteger   = 0x3,
	WICPixelFormatNumericRepresentationFixed           = 0x4,
	WICPixelFormatNumericRepresentationFloat           = 0x5,
	WICPixelFormatNumericRepresentation_FORCE_DWORD    = 0x7fffffff
}
alias int WICPixelFormatNumericRepresentation;

//extern extern(C) const IID IID_IWICPalette;
interface IWICPalette : IUnknown {
public extern(Windows):
	HRESULT InitializePredefined(WICBitmapPaletteType ePaletteType, BOOL fAddTransparentColor);
	HRESULT InitializeCustom(WICColor* pColors, UINT cCount);
	HRESULT InitializeFromBitmap(IWICBitmapSource pISurface,UINT cCount, BOOL fAddTransparentColor);
	HRESULT InitializeFromPalette(IWICPalette pIPalette);
	HRESULT GetType(WICBitmapPaletteType* pePaletteType);
	HRESULT GetColorCount(UINT* pcCount);
	HRESULT GetColors(UINT cCount, WICColor* pColors, UINT* pcActualColors);
	HRESULT IsBlackWhite(BOOL* pfIsBlackWhite);
	HRESULT IsGrayscale(BOOL* pfIsGrayscale);
	HRESULT HasAlpha(BOOL* pfHasAlpha);
}
mixin DEFINE_GUID!("IID_IWICPalette", "00000040-a8f2-4877-ba0a-fd2b6645fb94");

//extern extern(C) const IID IID_IWICBitmapSource;
interface IWICBitmapSource : IUnknown {
public extern(Windows):
	 HRESULT GetSize(UINT* puiWidth, UINT* puiHeight);
	 HRESULT GetPixelFormat(WICPixelFormatGUID* pPixelFormat);
	 HRESULT GetResolution(double* pDpiX, double* pDpiY);
	 HRESULT CopyPalette(IWICPalette pIPalette);
	 HRESULT CopyPixels(const(WICRect)* prc, UINT cbStride, UINT cbBufferSize, BYTE* pbBuffer);
}
mixin DEFINE_GUID!("IID_IWICBitmapSource", "00000120-a8f2-4877-ba0a-fd2b6645fb94");

//extern extern(C) const IID IID_IWICFormatConverter;
interface IWICFormatConverter : IWICBitmapSource {
public extern(Windows):
	 HRESULT Initialize(IWICBitmapSource pISource, REFWICPixelFormatGUID dstFormat, WICBitmapDitherType dither, IWICPalette pIPalette, double alphaThresholdPercent, WICBitmapPaletteType paletteTranslate);
	 HRESULT CanConvert(REFWICPixelFormatGUID srcPixelFormat, REFWICPixelFormatGUID dstPixelFormat, BOOL* pfCanConvert);
}
mixin DEFINE_GUID!("IID_IWICFormatConverter", "00000301-a8f2-4877-ba0a-fd2b6645fb94");

//extern extern(C) const IID IID_IWICBitmapScaler;
interface IWICBitmapScaler : IWICBitmapSource {
public extern(Windows):
	HRESULT Initialize(IWICBitmapSource pISource, UINT uiWidth, UINT uiHeight, WICBitmapInterpolationMode mode);
}
mixin DEFINE_GUID!("IID_IWICBitmapScaler", "00000302-a8f2-4877-ba0a-fd2b6645fb94");

//extern extern(C) const IID IID_IWICBitmapClipper;
interface IWICBitmapClipper : IWICBitmapSource {
public extern(Windows):
	HRESULT Initialize(IWICBitmapSource pISource, const(WICRect)* prc);
}
mixin DEFINE_GUID!("IID_IWICBitmapClipper", "E4FBCF03-223D-4e81-9333-D635556DD1B5");

//extern extern(C) const IID IID_IWICBitmapFlipRotator;
interface IWICBitmapFlipRotator : IWICBitmapSource {
public extern(Windows):
	HRESULT Initialize(IWICBitmapSource pISource, WICBitmapTransformOptions options);
}
mixin DEFINE_GUID!("IID_IWICBitmapFlipRotator", "5009834F-2D6A-41ce-9E1B-17C5AFF7A782");

//extern extern(C) const IID IID_IWICBitmapLock;
interface IWICBitmapLock : IUnknown {
public extern(Windows):
	HRESULT GetSize(UINT* puiWidth, UINT* puiHeight);
	HRESULT GetStride(UINT* pcbStride);
	HRESULT GetDataPointer(UINT* pcbBufferSize,  WICInProcPointer* ppbData);
	HRESULT GetPixelFormat(WICPixelFormatGUID* pPixelFormat);
}
mixin DEFINE_GUID!("IID_IWICBitmapLock", "00000123-a8f2-4877-ba0a-fd2b6645fb94");

//extern extern(C) const IID IID_IWICBitmap;
interface IWICBitmap : IWICBitmapSource {
public extern(Windows):
	HRESULT Lock(const(WICRect)* prcLock, DWORD flags, IWICBitmapLock* ppILock);
	HRESULT SetPalette(IWICPalette pIPalette);
	HRESULT SetResolution(double dpiX, double dpiY);
}
mixin DEFINE_GUID!("IID_IWICBitmap", "00000121-a8f2-4877-ba0a-fd2b6645fb94");

//extern extern(C) const IID IID_IWICColorContext;
interface IWICColorContext : IUnknown {
public extern(Windows):
	HRESULT InitializeFromFilename(LPCWSTR wzFilename);
	HRESULT InitializeFromMemory(const(BYTE)* pbBuffer, UINT cbBufferSize);
	HRESULT InitializeFromExifColorSpace(UINT value);
	HRESULT GetType(WICColorContextType* pType);
	HRESULT GetProfileBytes(UINT cbBuffer, BYTE* pbBuffer, UINT* pcbActual);
	HRESULT GetExifColorSpace(UINT* pValue);
}
mixin DEFINE_GUID!("IID_IWICColorContext", "3C613A02-34B2-44ea-9A7C-45AEA9C6FD6D");

//extern extern(C) const IID IID_IWICColorTransform;
interface IWICColorTransform : IWICBitmapSource {
public extern(Windows):
	HRESULT Initialize(IWICBitmapSource pIBitmapSource, IWICColorContext pIContextSource, IWICColorContext pIContextDest, REFWICPixelFormatGUID pixelFmtDest);
}
mixin DEFINE_GUID!("IID_IWICColorTransform", "B66F034F-D0E2-40ab-B436-6DE39E321A94");

//extern extern(C) const IID IID_IWICFastMetadataEncoder;
interface IWICFastMetadataEncoder : IUnknown {
public extern(Windows):
	HRESULT Commit();
	HRESULT GetMetadataQueryWriter(IWICMetadataQueryWriter* ppIMetadataQueryWriter);
}
mixin DEFINE_GUID!("IID_IWICFastMetadataEncoder", "B84E2C09-78C9-4AC4-8BD3-524AE1663A2F");

//extern extern(C) const IID IID_IWICStream;
interface IWICStream : IStream {
public extern(Windows):
	HRESULT InitializeFromIStream(IStream pIStream);
	HRESULT InitializeFromFilename(LPCWSTR wzFileName, DWORD dwDesiredAccess);
	HRESULT InitializeFromMemory(WICInProcPointer pbBuffer, DWORD cbBufferSize);
	HRESULT InitializeFromIStreamRegion(IStream pIStream, ULARGE_INTEGER ulOffset, ULARGE_INTEGER ulMaxSize);
}
mixin DEFINE_GUID!("IID_IWICStream", "135FF860-22B7-4ddf-B0F6-218F4F299A43");

//extern extern(C) const IID IID_IWICEnumMetadataItem;
interface IWICEnumMetadataItem : IUnknown {
public extern(Windows):
	HRESULT Next(ULONG celt, PROPVARIANT* rgeltSchema, PROPVARIANT* rgeltId, PROPVARIANT* rgeltValue, ULONG* pceltFetched);
	HRESULT Skip(ULONG celt);
	HRESULT Reset();
	HRESULT Clone(IWICEnumMetadataItem* ppIEnumMetadataItem);
}
mixin DEFINE_GUID!("IID_IWICEnumMetadataItem", "DC2BB46D-3F07-481E-8625-220C4AEDBB33");

//extern extern(C) const IID IID_IWICMetadataQueryReader;
interface IWICMetadataQueryReader : IUnknown {
public extern(Windows):
	HRESULT GetContainerFormat(GUID* pguidContainerFormat);
	HRESULT GetLocation(UINT cchMaxLength, WCHAR* wzNamespace, UINT* pcchActualLength);
	HRESULT GetMetadataByName(LPCWSTR wzName, PROPVARIANT* pvarValue);
	HRESULT GetEnumerator(IEnumString* ppIEnumString);
}
mixin DEFINE_GUID!("IID_IWICMetadataQueryReader", "30989668-E1C9-4597-B395-458EEDB808DF");

//extern extern(C) const IID IID_IWICMetadataQueryWriter;
interface IWICMetadataQueryWriter : IWICMetadataQueryReader {
public extern(Windows):
	HRESULT SetMetadataByName(LPCWSTR wzName, const(PROPVARIANT)* pvarValue);
	HRESULT RemoveMetadataByName(LPCWSTR wzName);
}
mixin DEFINE_GUID!("IID_IWICMetadataQueryWriter", "A721791A-0DEF-4d06-BD91-2118BF1DB10B");

//extern extern(C) const IID IID_IWICBitmapEncoder;
interface IWICBitmapEncoder : IUnknown {
public extern(Windows):
	HRESULT Initialize(IStream pIStream, WICBitmapEncoderCacheOption cacheOption);
	HRESULT GetContainerFormat(GUID* pguidContainerFormat);
	HRESULT GetEncoderInfo(IWICBitmapEncoderInfo* ppIEncoderInfo);
	HRESULT SetColorContexts(UINT cCount, IWICColorContext* ppIColorContext);
	HRESULT SetPalette(IWICPalette pIPalette);
	HRESULT SetThumbnail(IWICBitmapSource pIThumbnail);
	HRESULT SetPreview(IWICBitmapSource pIPreview);
	HRESULT CreateNewFrame(IWICBitmapFrameEncode* ppIFrameEncode, IPropertyBag2* ppIEncoderOptions);
	HRESULT Commit();
	HRESULT GetMetadataQueryWriter(IWICMetadataQueryWriter* ppIMetadataQueryWriter);
}
mixin DEFINE_GUID!("IID_IWICBitmapEncoder", "00000103-a8f2-4877-ba0a-fd2b6645fb94");

//extern extern(C) const IID IID_IWICBitmapFrameEncode;
interface IWICBitmapFrameEncode : IUnknown {
public extern(Windows):
	HRESULT Initialize(IPropertyBag2 pIEncoderOptions);
	HRESULT SetSize(UINT uiWidth, UINT uiHeight);
	HRESULT SetResolution(double dpiX, double dpiY);
	HRESULT SetPixelFormat(WICPixelFormatGUID* pPixelFormat);
	HRESULT SetColorContexts(UINT cCount, IWICColorContext* ppIColorContext);
	HRESULT SetPalette(IWICPalette pIPalette);
	HRESULT SetThumbnail(IWICBitmapSource pIThumbnail);
	HRESULT WritePixels(UINT lineCount, UINT cbStride, UINT cbBufferSize, BYTE* pbPixels);
	HRESULT WriteSource(IWICBitmapSource pIBitmapSource, WICRect* prc);
	HRESULT Commit();
	HRESULT GetMetadataQueryWriter(IWICMetadataQueryWriter* ppIMetadataQueryWriter);
}
mixin DEFINE_GUID!("IID_IWICBitmapFrameEncode", "00000105-a8f2-4877-ba0a-fd2b6645fb94");

//extern extern(C) const IID IID_IWICBitmapDecoder;
interface IWICBitmapDecoder : IUnknown {
public extern(Windows):
	HRESULT QueryCapability(IStream pIStream, DWORD* pdwCapability);
	HRESULT Initialize(IStream pIStream, WICDecodeOptions cacheOptions);
	HRESULT GetContainerFormat(GUID* pguidContainerFormat);
	HRESULT GetDecoderInfo(IWICBitmapDecoderInfo* ppIDecoderInfo);
	HRESULT CopyPalette(IWICPalette pIPalette);
	HRESULT GetMetadataQueryReader(IWICMetadataQueryReader* ppIMetadataQueryReader);
	HRESULT GetPreview(IWICBitmapSource* ppIBitmapSource);
	HRESULT GetColorContexts(UINT cCount, IWICColorContext* ppIColorContexts, UINT* pcActualCount);
	HRESULT GetThumbnail(IWICBitmapSource* ppIThumbnail);
	HRESULT GetFrameCount(UINT* pCount);
	HRESULT GetFrame(UINT index, IWICBitmapFrameDecode* ppIBitmapFrame);
}
mixin DEFINE_GUID!("IID_IWICBitmapDecoder", "9EDDE9E7-8DEE-47ea-99DF-E6FAF2ED44BF");

//extern extern(C) const IID IID_IWICBitmapSourceTransform;
interface IWICBitmapSourceTransform : IUnknown {
public extern(Windows):
	HRESULT CopyPixels(const(WICRect)* prc, UINT uiWidth, UINT uiHeight, WICPixelFormatGUID  pguidDstFormat, WICBitmapTransformOptions dstTransform, UINT nStride, UINT cbBufferSize, BYTE* pbBuffer);
	HRESULT GetClosestSize(UINT* puiWidth, UINT* puiHeight);
	HRESULT GetClosestPixelFormat(WICPixelFormatGUID* pguidDstFormat);
	HRESULT DoesSupportTransform(WICBitmapTransformOptions dstTransform, BOOL* pfIsSupported);
}
mixin DEFINE_GUID!("IID_IWICBitmapSourceTransform", "3B16811B-6A43-4ec9-B713-3D5A0C13B940");

//extern extern(C) const IID IID_IWICBitmapFrameDecode;
interface IWICBitmapFrameDecode : IWICBitmapSource {
public extern(Windows):
	HRESULT GetMetadataQueryReader(IWICMetadataQueryReader* ppIMetadataQueryReader);
	HRESULT GetColorContexts(UINT cCount, IWICColorContext* ppIColorContexts, UINT* pcActualCount);
	HRESULT GetThumbnail(IWICBitmapSource* ppIThumbnail);
}
mixin DEFINE_GUID!("IID_IWICBitmapFrameDecode", "3B16811B-6A43-4ec9-A813-3D930C13B940");

//extern extern(C) const IID IID_IWICProgressiveLevelControl;
interface IWICProgressiveLevelControl : IUnknown {
public extern(Windows):
	HRESULT GetLevelCount(UINT* pcLevels);
	HRESULT GetCurrentLevel(UINT* pnLevel);
	HRESULT SetCurrentLevel(UINT nLevel);
}
mixin DEFINE_GUID!("IID_IWICProgressiveLevelControl", "DAAC296F-7AA5-4dbf-8D15-225C5976F891");

//extern extern(C) const IID IID_IWICProgressCallback;
interface IWICProgressCallback : IUnknown {
public extern(Windows):
	HRESULT Notify(ULONG uFrameNum, WICProgressOperation operation, double dblProgress);
}
mixin DEFINE_GUID!("IID_IWICProgressCallback", "4776F9CD-9517-45FA-BF24-E89C5EC5C60C");

alias extern(Windows) HRESULT function(LPVOID pvData, ULONG uFrameNum, WICProgressOperation operation, double dblProgress) PFNProgressNotification ;

//extern extern(C) const IID IID_IWICBitmapCodecProgressNotification;
interface IWICBitmapCodecProgressNotification : IUnknown {
public extern(Windows):
	HRESULT RegisterProgressNotification(PFNProgressNotification pfnProgressNotification, LPVOID pvData, DWORD dwProgressFlags);
}
mixin DEFINE_GUID!("IID_IWICBitmapCodecProgressNotification", "64C1024E-C3CF-4462-8078-88C2B11C46D9");

export extern(Windows){
	HRESULT IWICBitmapCodecProgressNotification_Remote_RegisterProgressNotification_Proxy(IWICBitmapCodecProgressNotification This, IWICProgressCallback pICallback, DWORD dwProgressFlags);
	void IWICBitmapCodecProgressNotification_Remote_RegisterProgressNotification_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_IWICComponentInfo;
interface IWICComponentInfo : IUnknown {
public extern(Windows):
	HRESULT GetComponentType(WICComponentType* pType);
	HRESULT GetCLSID(CLSID* pclsid);
	HRESULT GetSigningStatus(DWORD* pStatus);
	HRESULT GetAuthor(UINT cchAuthor, WCHAR* wzAuthor, UINT* pcchActual);
	HRESULT GetVendorGUID(GUID* pguidVendor);
	HRESULT GetVersion(UINT cchVersion, WCHAR* wzVersion, UINT* pcchActual);
	HRESULT GetSpecVersion(UINT cchSpecVersion, WCHAR* wzSpecVersion, UINT* pcchActual);
	HRESULT GetFriendlyName(UINT cchFriendlyName, WCHAR* wzFriendlyName, UINT* pcchActual);
}
mixin DEFINE_GUID!("IID_IWICComponentInfo", "23BC3F0A-698B-4357-886B-F24D50671334");

//extern extern(C) const IID IID_IWICFormatConverterInfo;
interface IWICFormatConverterInfo : IWICComponentInfo {
public extern(Windows):
	HRESULT GetPixelFormats(UINT cFormats, WICPixelFormatGUID* pPixelFormatGUIDs, UINT* pcActual);
	HRESULT CreateInstance(IWICFormatConverter* ppIConverter);
}
mixin DEFINE_GUID!("IID_IWICFormatConverterInfo", "9F34FB65-13F4-4f15-BC57-3726B5E53D9F");

//extern extern(C) const IID IID_IWICBitmapCodecInfo;
interface IWICBitmapCodecInfo : IWICComponentInfo {
public extern(Windows):
	HRESULT GetContainerFormat(GUID* pguidContainerFormat);
	HRESULT GetPixelFormats(UINT cFormats, GUID* pguidPixelFormats, UINT* pcActual);
	HRESULT GetColorManagementVersion(UINT cchColorManagementVersion, WCHAR* wzColorManagementVersion, UINT* pcchActual);
	HRESULT GetDeviceManufacturer(UINT cchDeviceManufacturer, WCHAR* wzDeviceManufacturer, UINT* pcchActual);
	HRESULT GetDeviceModels(UINT cchDeviceModels, WCHAR* wzDeviceModels, UINT* pcchActual);
	HRESULT GetMimeTypes(UINT cchMimeTypes, WCHAR* wzMimeTypes, UINT* pcchActual);
	HRESULT GetFileExtensions(UINT cchFileExtensions, WCHAR* wzFileExtensions, UINT* pcchActual);
	HRESULT DoesSupportAnimation(BOOL* pfSupportAnimation);
	HRESULT DoesSupportChromakey(BOOL* pfSupportChromakey);
	HRESULT DoesSupportLossless(BOOL* pfSupportLossless);
	HRESULT DoesSupportMultiframe(BOOL* pfSupportMultiframe);
	HRESULT MatchesMimeType(LPCWSTR wzMimeType, BOOL* pfMatches);
}
mixin DEFINE_GUID!("IID_IWICBitmapCodecInfo", "E87A44C4-B76E-4c47-8B09-298EB12A2714");

//extern extern(C) const IID IID_IWICBitmapEncoderInfo;
interface IWICBitmapEncoderInfo : IWICBitmapCodecInfo {
public extern(Windows):
	HRESULT CreateInstance(IWICBitmapEncoder* ppIBitmapEncoder);
}
mixin DEFINE_GUID!("IID_IWICBitmapEncoderInfo", "94C9B4EE-A09F-4f92-8A1E-4A9BCE7E76FB");

//extern extern(C) const IID IID_IWICBitmapDecoderInfo;
interface IWICBitmapDecoderInfo : IWICBitmapCodecInfo {
public extern(Windows):
	HRESULT GetPatterns(UINT cbSizePatterns, WICBitmapPattern* pPatterns, UINT* pcPatterns, UINT* pcbPatternsActual);
	HRESULT MatchesPattern(IStream pIStream, BOOL* pfMatches);
	HRESULT CreateInstance(IWICBitmapDecoder* ppIBitmapDecoder);
}
mixin DEFINE_GUID!("IID_IWICBitmapDecoderInfo", "D8CD007F-D08F-4191-9BFC-236EA7F0E4B5");

export extern(Windows){
	HRESULT IWICBitmapDecoderInfo_Remote_GetPatterns_Proxy(IWICBitmapDecoderInfo This, WICBitmapPattern** ppPatterns, UINT* pcPatterns);
	void IWICBitmapDecoderInfo_Remote_GetPatterns_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_IWICPixelFormatInfo;
interface IWICPixelFormatInfo : IWICComponentInfo {
public extern(Windows):
	HRESULT GetFormatGUID(GUID* pFormat);
	HRESULT GetColorContext(IWICColorContext* ppIColorContext);
	HRESULT GetBitsPerPixel(UINT* puiBitsPerPixel);
	HRESULT GetChannelCount(UINT* puiChannelCount);
	HRESULT GetChannelMask(UINT uiChannelIndex, UINT cbMaskBuffer, BYTE* pbMaskBuffer, UINT* pcbActual);
}
mixin DEFINE_GUID!("IID_IWICPixelFormatInfo", "E8EDA601-3D48-431a-AB44-69059BE88BBE");

//extern extern(C) const IID IID_IWICPixelFormatInfo2;
interface IWICPixelFormatInfo2 : IWICPixelFormatInfo {
public extern(Windows):
	HRESULT SupportsTransparency(BOOL* pfSupportsTransparency);
	HRESULT GetNumericRepresentation(WICPixelFormatNumericRepresentation* pNumericRepresentation);
}
mixin DEFINE_GUID!("IID_IWICPixelFormatInfo2", "A9DB33A2-AF5F-43C7-B679-74F5984B5AA4");

//extern extern(C) const IID IID_IWICImagingFactory;
interface IWICImagingFactory : IUnknown {
public extern(Windows):
	HRESULT CreateDecoderFromFilename(LPCWSTR wzFilename, const(GUID)* pguidVendor, DWORD dwDesiredAccess, WICDecodeOptions metadataOptions, IWICBitmapDecoder* ppIDecoder);
	HRESULT CreateDecoderFromStream(IStream pIStream, const(GUID)* pguidVendor, WICDecodeOptions metadataOptions, IWICBitmapDecoder* ppIDecoder);
	HRESULT CreateDecoderFromFileHandle(ULONG_PTR hFile, const(GUID)* pguidVendor, WICDecodeOptions metadataOptions, IWICBitmapDecoder* ppIDecoder);
	HRESULT CreateComponentInfo(REFCLSID clsidComponent, IWICComponentInfo* ppIInfo);
	HRESULT CreateDecoder(REFGUID guidContainerFormat, const(GUID)* pguidVendor, IWICBitmapDecoder* ppIDecoder);
	HRESULT CreateEncoder(REFGUID guidContainerFormat, const(GUID)* pguidVendor, IWICBitmapEncoder* ppIEncoder);
	HRESULT CreatePalette(IWICPalette* ppIPalette);
	HRESULT CreateFormatConverter(IWICFormatConverter* ppIFormatConverter);
	HRESULT CreateBitmapScaler(IWICBitmapScaler* ppIBitmapScaler);
	HRESULT CreateBitmapClipper(IWICBitmapClipper* ppIBitmapClipper);
	HRESULT CreateBitmapFlipRotator(IWICBitmapFlipRotator* ppIBitmapFlipRotator);
	HRESULT CreateStream(IWICStream* ppIWICStream);
	HRESULT CreateColorContext(IWICColorContext* ppIWICColorContext);
	HRESULT CreateColorTransformer(IWICColorTransform* ppIWICColorTransform);
	HRESULT CreateBitmap(UINT uiWidth, UINT uiHeight, REFWICPixelFormatGUID pixelFormat, WICBitmapCreateCacheOption option, IWICBitmap* ppIBitmap);
	HRESULT CreateBitmapFromSource(IWICBitmapSource pIBitmapSource, WICBitmapCreateCacheOption option, IWICBitmap* ppIBitmap);
	HRESULT CreateBitmapFromSourceRect(IWICBitmapSource pIBitmapSource, UINT x, UINT y, UINT width, UINT height, IWICBitmap* ppIBitmap);
	HRESULT CreateBitmapFromMemory(UINT uiWidth, UINT uiHeight, REFWICPixelFormatGUID pixelFormat, UINT cbStride, UINT cbBufferSize, BYTE* pbBuffer, IWICBitmap* ppIBitmap);
	HRESULT CreateBitmapFromHBITMAP(HBITMAP hBitmap, HPALETTE hPalette, WICBitmapAlphaChannelOption options, IWICBitmap* ppIBitmap);
	HRESULT CreateBitmapFromHICON(HICON hIcon, IWICBitmap* ppIBitmap);
	HRESULT CreateComponentEnumerator(DWORD componentTypes, DWORD options, IEnumUnknown* ppIEnumUnknown);
	HRESULT CreateFastMetadataEncoderFromDecoder(IWICBitmapDecoder pIDecoder, IWICFastMetadataEncoder* ppIFastEncoder);
	HRESULT CreateFastMetadataEncoderFromFrameDecode(IWICBitmapFrameDecode pIFrameDecoder, IWICFastMetadataEncoder* ppIFastEncoder);
	HRESULT CreateQueryWriter(REFGUID guidMetadataFormat, const(GUID)* pguidVendor, IWICMetadataQueryWriter* ppIQueryWriter);
	HRESULT CreateQueryWriterFromReader(IWICMetadataQueryReader pIQueryReader, const(GUID)* pguidVendor, IWICMetadataQueryWriter* ppIQueryWriter);
}
mixin DEFINE_GUID!("IID_IWICImagingFactory", "ec5ec8a9-c395-4314-9c77-54d7a935ff70");

export extern(Windows){
	HRESULT WICConvertBitmapSource(REFWICPixelFormatGUID dstFormat, IWICBitmapSource pISrc, IWICBitmapSource* ppIDst);
	HRESULT WICCreateBitmapFromSection(UINT width, UINT height, REFWICPixelFormatGUID pixelFormat, HANDLE hSection, UINT stride, UINT offset, IWICBitmap* ppIBitmap);
	HRESULT WICCreateBitmapFromSectionEx(UINT width, UINT height, REFWICPixelFormatGUID pixelFormat, HANDLE hSection, UINT stride, UINT offset, WICSectionAccessLevel desiredAccessLevel, IWICBitmap* ppIBitmap);
	HRESULT WICMapGuidToShortName(REFGUID guid, UINT cchName, WCHAR* wzName, UINT* pcchActual);
	HRESULT WICMapShortNameToGuid(const(WCHAR)* wzName, GUID* pguid);
	HRESULT WICMapSchemaToName(REFGUID guidMetadataFormat, LPWSTR pwzSchema, UINT cchName, WCHAR* wzName, UINT* pcchActual);
}

private enum FACILITY_WINCODEC_ERR = 0x898;
private enum WINCODEC_ERR_BASE = 0x2000;

pure nothrow
HRESULT MAKE_WINCODECHR(WORD sev, WORD code)
{
	return MAKE_HRESULT(sev, cast(WORD)FACILITY_WINCODEC_ERR, cast(WORD)(WINCODEC_ERR_BASE + code));
}

pure nothrow
HRESULT MAKE_WINCODECHR_ERR(WORD code)
{
	return MAKE_WINCODECHR(1, code);
}

enum {
	WINCODEC_ERR_GENERIC_ERROR                    = E_FAIL,
	WINCODEC_ERR_INVALIDPARAMETER                 = E_INVALIDARG,
	WINCODEC_ERR_OUTOFMEMORY                      = E_OUTOFMEMORY,
	WINCODEC_ERR_NOTIMPLEMENTED                   = E_NOTIMPL,
	WINCODEC_ERR_ABORTED                          = E_ABORT,
	WINCODEC_ERR_ACCESSDENIED                     = E_ACCESSDENIED,
	WINCODEC_ERR_VALUEOVERFLOW                    = INTSAFE_E_ARITHMETIC_OVERFLOW,
	WINCODEC_ERR_WRONGSTATE                       = MAKE_WINCODECHR_ERR(0xf04),
	WINCODEC_ERR_VALUEOUTOFRANGE                  = MAKE_WINCODECHR_ERR(0xf05),
	WINCODEC_ERR_UNKNOWNIMAGEFORMAT               = MAKE_WINCODECHR_ERR(0xf07),
	WINCODEC_ERR_UNSUPPORTEDVERSION               = MAKE_WINCODECHR_ERR(0xf0B),
	WINCODEC_ERR_NOTINITIALIZED                   = MAKE_WINCODECHR_ERR(0xf0C),
	WINCODEC_ERR_ALREADYLOCKED                    = MAKE_WINCODECHR_ERR(0xf0D),
	WINCODEC_ERR_PROPERTYNOTFOUND                 = MAKE_WINCODECHR_ERR(0xf40),
	WINCODEC_ERR_PROPERTYNOTSUPPORTED             = MAKE_WINCODECHR_ERR(0xf41),
	WINCODEC_ERR_PROPERTYSIZE                     = MAKE_WINCODECHR_ERR(0xf42),
	WINCODEC_ERR_CODECPRESENT                     = MAKE_WINCODECHR_ERR(0xf43),
	WINCODEC_ERR_CODECNOTHUMBNAIL                 = MAKE_WINCODECHR_ERR(0xf44),
	WINCODEC_ERR_PALETTEUNAVAILABLE               = MAKE_WINCODECHR_ERR(0xf45),
	WINCODEC_ERR_CODECTOOMANYSCANLINES            = MAKE_WINCODECHR_ERR(0xf46),
	WINCODEC_ERR_INTERNALERROR                    = MAKE_WINCODECHR_ERR(0xf48),
	WINCODEC_ERR_SOURCERECTDOESNOTMATCHDIMENSIONS = MAKE_WINCODECHR_ERR(0xf49),
	WINCODEC_ERR_COMPONENTNOTFOUND                = MAKE_WINCODECHR_ERR(0xf50),
	WINCODEC_ERR_IMAGESIZEOUTOFRANGE              = MAKE_WINCODECHR_ERR(0xf51),
	WINCODEC_ERR_TOOMUCHMETADATA                  = MAKE_WINCODECHR_ERR(0xf52),
	WINCODEC_ERR_BADIMAGE                         = MAKE_WINCODECHR_ERR(0xf60),
	WINCODEC_ERR_BADHEADER                        = MAKE_WINCODECHR_ERR(0xf61),
	WINCODEC_ERR_FRAMEMISSING                     = MAKE_WINCODECHR_ERR(0xf62),
	WINCODEC_ERR_BADMETADATAHEADER                = MAKE_WINCODECHR_ERR(0xf63),
	WINCODEC_ERR_BADSTREAMDATA                    = MAKE_WINCODECHR_ERR(0xf70),
	WINCODEC_ERR_STREAMWRITE                      = MAKE_WINCODECHR_ERR(0xf71),
	WINCODEC_ERR_STREAMREAD                       = MAKE_WINCODECHR_ERR(0xf72),
	WINCODEC_ERR_STREAMNOTAVAILABLE               = MAKE_WINCODECHR_ERR(0xf73),
	WINCODEC_ERR_UNSUPPORTEDPIXELFORMAT           = MAKE_WINCODECHR_ERR(0xf80),
	WINCODEC_ERR_UNSUPPORTEDOPERATION             = MAKE_WINCODECHR_ERR(0xf81),
	WINCODEC_ERR_INVALIDREGISTRATION              = MAKE_WINCODECHR_ERR(0xf8A),
	WINCODEC_ERR_COMPONENTINITIALIZEFAILURE       = MAKE_WINCODECHR_ERR(0xf8B),
	WINCODEC_ERR_INSUFFICIENTBUFFER               = MAKE_WINCODECHR_ERR(0xf8C),
	WINCODEC_ERR_DUPLICATEMETADATAPRESENT         = MAKE_WINCODECHR_ERR(0xf8D),
	WINCODEC_ERR_PROPERTYUNEXPECTEDTYPE           = MAKE_WINCODECHR_ERR(0xf8E),
	WINCODEC_ERR_UNEXPECTEDSIZE                   = MAKE_WINCODECHR_ERR(0xf8F),
	WINCODEC_ERR_INVALIDQUERYREQUEST              = MAKE_WINCODECHR_ERR(0xf90),
	WINCODEC_ERR_UNEXPECTEDMETADATATYPE           = MAKE_WINCODECHR_ERR(0xf91),
	WINCODEC_ERR_REQUESTONLYVALIDATMETADATAROOT   = MAKE_WINCODECHR_ERR(0xf92),
	WINCODEC_ERR_INVALIDQUERYCHARACTER            = MAKE_WINCODECHR_ERR(0xf93),
	WINCODEC_ERR_WIN32ERROR                       = MAKE_WINCODECHR_ERR(0xf94),
	WINCODEC_ERR_INVALIDPROGRESSIVELEVEL          = MAKE_WINCODECHR_ERR(0xf95),
}

enum {
	WICTiffCompressionDontCare           = 0,
	WICTiffCompressionNone               = 0x1,
	WICTiffCompressionCCITT3             = 0x2,
	WICTiffCompressionCCITT4             = 0x3,
	WICTiffCompressionLZW                = 0x4,
	WICTiffCompressionRLE                = 0x5,
	WICTiffCompressionZIP                = 0x6,
	WICTiffCompressionLZWHDifferencing   = 0x7,
	WICTIFFCOMPRESSIONOPTION_FORCE_DWORD = 0x7fffffff
}
alias int WICTiffCompressionOption;

enum{
	WICJpegYCrCbSubsamplingDefault      = 0,
	WICJpegYCrCbSubsampling420          = 0x1,
	WICJpegYCrCbSubsampling422          = 0x2,
	WICJpegYCrCbSubsampling444          = 0x3,
	WICJPEGYCRCBSUBSAMPLING_FORCE_DWORD = 0x7fffffff
}
alias int WICJpegYCrCbSubsamplingOption;

enum {
	WICPngFilterUnspecified        = 0,
	WICPngFilterNone               = 0x1,
	WICPngFilterSub                = 0x2,
	WICPngFilterUp                 = 0x3,
	WICPngFilterAverage            = 0x4,
	WICPngFilterPaeth              = 0x5,
	WICPngFilterAdaptive           = 0x6,
	WICPNGFILTEROPTION_FORCE_DWORD = 0x7fffffff
}
alias int WICPngFilterOption;

enum {
	WICWhitePointDefault           = 0x1,
	WICWhitePointDaylight          = 0x2,
	WICWhitePointCloudy            = 0x4,
	WICWhitePointShade             = 0x8,
	WICWhitePointTungsten          = 0x10,
	WICWhitePointFluorescent       = 0x20,
	WICWhitePointFlash             = 0x40,
	WICWhitePointUnderwater        = 0x80,
	WICWhitePointCustom            = 0x100,
	WICWhitePointAutoWhiteBalance  = 0x200,
	WICWhitePointAsShot            = WICWhitePointDefault,
	WICNAMEDWHITEPOINT_FORCE_DWORD = 0x7fffffff
}
alias int WICNamedWhitePoint;

enum {
	WICRawCapabilityNotSupported   = 0,
	WICRawCapabilityGetSupported   = 0x1,
	WICRawCapabilityFullySupported = 0x2,
	WICRAWCAPABILITIES_FORCE_DWORD = 0x7fffffff
}
alias int WICRawCapabilities;

enum {
	WICRawRotationCapabilityNotSupported           = 0,
	WICRawRotationCapabilityGetSupported           = 0x1,
	WICRawRotationCapabilityNinetyDegreesSupported = 0x2,
	WICRawRotationCapabilityFullySupported         = 0x3,
	WICRAWROTATIONCAPABILITIES_FORCE_DWORD         = 0x7fffffff
}
alias int WICRawRotationCapabilities;

struct WICRawCapabilitiesInfo {
	UINT cbSize;
	UINT CodecMajorVersion;
	UINT CodecMinorVersion;
	WICRawCapabilities ExposureCompensationSupport;
	WICRawCapabilities ContrastSupport;
	WICRawCapabilities RGBWhitePointSupport;
	WICRawCapabilities NamedWhitePointSupport;
	UINT NamedWhitePointSupportMask;
	WICRawCapabilities KelvinWhitePointSupport;
	WICRawCapabilities GammaSupport;
	WICRawCapabilities TintSupport;
	WICRawCapabilities SaturationSupport;
	WICRawCapabilities SharpnessSupport;
	WICRawCapabilities NoiseReductionSupport;
	WICRawCapabilities DestinationColorProfileSupport;
	WICRawCapabilities ToneCurveSupport;
	WICRawRotationCapabilities RotationSupport;
	WICRawCapabilities RenderModeSupport;
}

enum {
	WICAsShotParameterSet          = 0x1,
	WICUserAdjustedParameterSet    = 0x2,
	WICAutoAdjustedParameterSet    = 0x3,
	WICRAWPARAMETERSET_FORCE_DWORD = 0x7fffffff
}
alias int WICRawParameterSet;

enum {
	WICRawRenderModeDraft        = 0x1,
	WICRawRenderModeNormal       = 0x2,
	WICRawRenderModeBestQuality  = 0x3,
	WICRAWRENDERMODE_FORCE_DWORD = 0x7fffffff
}
alias int WICRawRenderMode;

struct WICRawToneCurvePoint {
	double Input;
	double Output;
}

struct WICRawToneCurve {
	UINT cPoints;
	WICRawToneCurvePoint[1] aPoints;
}

enum {
	WICRawChangeNotification_ExposureCompensation    = 0x00000001,
	WICRawChangeNotification_NamedWhitePoint         = 0x00000002,
	WICRawChangeNotification_KelvinWhitePoint        = 0x00000004,
	WICRawChangeNotification_RGBWhitePoint           = 0x00000008,
	WICRawChangeNotification_Contrast                = 0x00000010,
	WICRawChangeNotification_Gamma                   = 0x00000020,
	WICRawChangeNotification_Sharpness               = 0x00000040,
	WICRawChangeNotification_Saturation              = 0x00000080,
	WICRawChangeNotification_Tint                    = 0x00000100,
	WICRawChangeNotification_NoiseReduction          = 0x00000200,
	WICRawChangeNotification_DestinationColorContext = 0x00000400,
	WICRawChangeNotification_ToneCurve               = 0x00000800,
	WICRawChangeNotification_Rotation                = 0x00001000,
	WICRawChangeNotification_RenderMode              = 0x00002000,
}

//extern extern(C) const IID IID_IWICDevelopRawNotificationCallback;
interface IWICDevelopRawNotificationCallback : IUnknown {
public extern(Windows):
	HRESULT Notify(UINT NotificationMask);
}
mixin DEFINE_GUID!("IID_IWICDevelopRawNotificationCallback", "95c75a6e-3e8c-4ec2-85a8-aebcc551e59b");

//extern extern(C) const IID IID_IWICDevelopRaw;
interface IWICDevelopRaw : IWICBitmapFrameDecode {
public extern(Windows):
	HRESULT QueryRawCapabilitiesInfo(WICRawCapabilitiesInfo* pInfo);
	HRESULT LoadParameterSet(WICRawParameterSet ParameterSet);
	HRESULT GetCurrentParameterSet(IPropertyBag2* ppCurrentParameterSet);
	HRESULT SetExposureCompensation(double ev);
	HRESULT GetExposureCompensation(double* pEV);
	HRESULT SetWhitePointRGB(UINT Red, UINT Green, UINT Blue);
	HRESULT GetWhitePointRGB(UINT* pRed,UINT* pGreen, UINT* pBlue);
	HRESULT SetNamedWhitePoint(WICNamedWhitePoint WhitePoint);
	HRESULT GetNamedWhitePoint(WICNamedWhitePoint* pWhitePoint);
	HRESULT SetWhitePointKelvin(UINT WhitePointKelvin);
	HRESULT GetWhitePointKelvin(UINT* pWhitePointKelvin);
	HRESULT GetKelvinRangeInfo(UINT* pMinKelvinTemp, UINT* pMaxKelvinTemp, UINT* pKelvinTempStepValue);
	HRESULT SetContrast(double Contrast);
	HRESULT GetContrast(double* pContrast);
	HRESULT SetGamma(double Gamma);
	HRESULT GetGamma(double* pGamma);
	HRESULT SetSharpness(double Sharpness);
	HRESULT GetSharpness(double* pSharpness);
	HRESULT SetSaturation(double Saturation);
	HRESULT GetSaturation(double* pSaturation);
	HRESULT SetTint(double Tint);
	HRESULT GetTint(double* pTint);
	HRESULT SetNoiseReduction(double NoiseReduction);
	HRESULT GetNoiseReduction(double* pNoiseReduction);
	HRESULT SetDestinationColorContext(IWICColorContext pColorContext);
	HRESULT SetToneCurve(UINT cbToneCurveSize, const(WICRawToneCurve)* pToneCurve);
	HRESULT GetToneCurve(UINT cbToneCurveBufferSize, WICRawToneCurve* pToneCurve, UINT* pcbActualToneCurveBufferSize);
	HRESULT SetRotation(double Rotation);
	HRESULT GetRotation(double* pRotation);
	HRESULT SetRenderMode(WICRawRenderMode RenderMode);
	HRESULT GetRenderMode(WICRawRenderMode* pRenderMode);
	HRESULT SetNotificationCallback(IWICDevelopRawNotificationCallback pCallback);
}
mixin DEFINE_GUID!("IID_IWICDevelopRaw", "fbec5e44-f7be-4b65-b7f8-c0c81fef026d");

export extern(Windows){
	HRESULT IWICDevelopRaw_Remote_QueryRawCapabilitiesInfo_Proxy(IWICDevelopRaw This, WICRawCapabilitiesInfo* pInfo);
	void IWICDevelopRaw_Remote_QueryRawCapabilitiesInfo_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IWICDevelopRaw_Remote_SetToneCurve_Proxy(IWICDevelopRaw This, UINT cPoints, const(WICRawToneCurvePoint)* aPoints);
	void IWICDevelopRaw_Remote_SetToneCurve_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
	HRESULT IWICDevelopRaw_Remote_GetToneCurve_Proxy(IWICDevelopRaw This, UINT* pcPoints, WICRawToneCurvePoint** paPoints);
	void IWICDevelopRaw_Remote_GetToneCurve_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

export extern(Windows){
	uint BSTR_UserSize(uint*, uint, BSTR*);
	ubyte* BSTR_UserMarshal(uint*, ubyte*, BSTR*);
	ubyte* BSTR_UserUnmarshal(uint*, ubyte*, BSTR*);
	void BSTR_UserFree(uint*, BSTR*);

	uint HBITMAP_UserSize(uint*, uint, HBITMAP*);
	ubyte* HBITMAP_UserMarshal(uint*, ubyte*, HBITMAP*);
	ubyte* HBITMAP_UserUnmarshal(uint*, ubyte*, HBITMAP*);
	void HBITMAP_UserFree(uint*, HBITMAP*);

	uint HICON_UserSize(uint*, uint, HICON*);
	ubyte* HICON_UserMarshal(uint*, ubyte*, HICON*);
	ubyte* HICON_UserUnmarshal(uint*, ubyte*, HICON*);
	void HICON_UserFree(uint*, HICON*);

	uint HPALETTE_UserSize(uint*, uint, HPALETTE*);
	ubyte* HPALETTE_UserMarshal(uint*, ubyte*, HPALETTE*);
	ubyte* HPALETTE_UserUnmarshal(uint*, ubyte*, HPALETTE*);
	void HPALETTE_UserFree(uint*, HPALETTE*);

	uint LPSAFEARRAY_UserSize(uint*, uint, LPSAFEARRAY*);
	ubyte* LPSAFEARRAY_UserMarshal(uint*, ubyte*, LPSAFEARRAY*);
	ubyte* LPSAFEARRAY_UserUnmarshal(uint*, ubyte*, LPSAFEARRAY*);
	void LPSAFEARRAY_UserFree(uint*, LPSAFEARRAY*);

	uint WICInProcPointer_UserSize(uint*, uint, WICInProcPointer*);
	ubyte* WICInProcPointer_UserMarshal(uint*, ubyte*, WICInProcPointer*);
	ubyte* WICInProcPointer_UserUnmarshal(uint*, ubyte*, WICInProcPointer*);
	void WICInProcPointer_UserFree(uint*, WICInProcPointer*);
}

export extern(Windows){
	HRESULT IWICBitmapCodecProgressNotification_RegisterProgressNotification_Proxy(IWICBitmapCodecProgressNotification This, PFNProgressNotification pfnProgressNotification, LPVOID pvData, DWORD dwProgressFlags);
	HRESULT IWICBitmapCodecProgressNotification_RegisterProgressNotification_Stub(IWICBitmapCodecProgressNotification This, IWICProgressCallback pICallback, DWORD dwProgressFlags);
	HRESULT IWICBitmapDecoderInfo_GetPatterns_Proxy(IWICBitmapDecoderInfo This, UINT cbSizePatterns, WICBitmapPattern* pPatterns, UINT* pcPatterns, UINT* pcbPatternsActual);
	HRESULT IWICBitmapDecoderInfo_GetPatterns_Stub(IWICBitmapDecoderInfo This, WICBitmapPattern** ppPatterns, UINT* pcPatterns);
	HRESULT IWICDevelopRaw_QueryRawCapabilitiesInfo_Proxy(IWICDevelopRaw This, WICRawCapabilitiesInfo* pInfo);
	HRESULT IWICDevelopRaw_QueryRawCapabilitiesInfo_Stub(IWICDevelopRaw This, WICRawCapabilitiesInfo* pInfo);
	HRESULT IWICDevelopRaw_SetToneCurve_Proxy(IWICDevelopRaw This, UINT cbToneCurveSize, const(WICRawToneCurve)* pToneCurve);
	HRESULT IWICDevelopRaw_SetToneCurve_Stub(IWICDevelopRaw This, UINT cPoints, const(WICRawToneCurvePoint)* aPoints);
	HRESULT IWICDevelopRaw_GetToneCurve_Proxy(IWICDevelopRaw This, UINT cbToneCurveBufferSize, WICRawToneCurve* pToneCurve, UINT* pcbActualToneCurveBufferSize);
	HRESULT IWICDevelopRaw_GetToneCurve_Stub(IWICDevelopRaw This, UINT* pcPoints, WICRawToneCurvePoint** paPoints);
}

} // extern(C)
