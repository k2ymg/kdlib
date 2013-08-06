/** nuiimagebuffer.d

Converted from 'NuiImageBuffer.h'.

Version: Beta
Authors: Koji Kishita
*/
module c.windows.kinect.nuiimagebuffer;


import c.windows.windef;
import c.windows.winerror;


struct KINECT_LOCKED_RECT {
	INT Pitch;
	void* pBits;
}

struct KINECT_SURFACE_DESC {
	UINT Width;
	UINT Height;
}

struct NuiImageBuffer {
	int m_Width;
	int m_Height;
	int m_BytesPerPixel;
	BYTE* m_pBuffer;


public:
	int BufferLen()
	{
		return m_Width * m_Height * m_BytesPerPixel;
	}

	int Pitch()
	{
		return m_Width * m_BytesPerPixel;
	}

	HRESULT LockRect(UINT Level, KINECT_LOCKED_RECT* pLockedRect, const(RECT)* pRectUsuallyNull, DWORD Flags)
	{
		if(!pLockedRect)
			return E_POINTER;

		if(Level != 0)
			return E_INVALIDARG;

		pLockedRect.pBits = m_pBuffer;

		if(!m_pBuffer){
			pLockedRect.Pitch = 0;
			return E_OUTOFMEMORY;
		}

		if(m_Height){
			pLockedRect.Pitch = Pitch();
			return S_OK;
		}else{
			pLockedRect.Pitch = 0;
			return E_POINTER;
		}
	}

	HRESULT GetLevelDesc(UINT Level, KINECT_SURFACE_DESC* pDesc)
	{
		if(!pDesc)
			return E_POINTER;

		if(Level != 0)
			return E_INVALIDARG;

		pDesc.Width = m_Width;
		pDesc.Height = m_Height;
		return S_OK;
	}

	HRESULT UnlockRect( UINT Level)
	{
		if(Level != 0)
			return E_INVALIDARG;
		return S_OK;
	}
}
