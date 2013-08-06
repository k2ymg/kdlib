
TARGET=windows.lib

.D=sdkddkver.d windef.d basetsd.d \
oleauto.d \
uuids.d \
dimm.d \
ime_cmodes.d \
imm.d \
dispex.d \
mshtml.d \
iedial.d \
winnetwk.d \
wininet.d \
objectarray.d \
comcat.d \
structuredquerycondition.d \
urlmon.d \
objbase.d \
propidl.d \
winnls.d \
msxml.d \
servprov.d \
oaidl.d \
ocidl.d \
reason.d \
winreg.d \
shtypes.d \
shlwapi.d \
ws2ipdef.d \
windns.d \
inaddr.d \
ws2def.d \
iptypes.d \
ipexport.d \
tcpestats.d \
udpmib.d \
iprtrmib.d \
in6addr.d \
tcpmib.d \
nldef.d \
ipmib.d \
ipifcons.d \
ifdef.d \
ifmib.d \
iphlpapi.d \
shellapi.d \
prsht.d \
commdlg.d \
commctrl.d \
winerror.d \
mmsystem.d \
vfw.d \
vfwmsgs.d \
ntstatus.d \
winbase.d \
winuser.d \
unknwn.d \
objidl.d \
rpc.d \
rpcdcep.d \
rpcdce.d \
rpcndr.d \
wtypes.d \
ktmtypes.d \
wingdi.d \
winternl.d \
winnt.d \
cguid.d \
guiddef.d \
isguids.d \
wincon.d \
intshcut.d \
propsys.d \
propkeydef.d \
shlobj.d \
shobjidl.d \
winver.d \
cderr.d dde.d ddeml.d dlgs.d lzexpand.d nb30.d winperf.d winefs.d \
scarderr.d winsmcrd.d winscard.d

.D+=wincodec.d
.D+=dxgiformat.d dxgitype.d dxgi.d
.D+=dcommon.d d2dbasetypes.d d2d1.d dwrite.d d2derr.d
.D+=ddraw.d strmif.d control.d dshow.d amvideo.d
.D+=dsound.d amaudio.d 
.D+=midles.d mapix.d mapidefs.d mapi.d 
.D+=wincred.d sspi.d schannel.d bcrypt.d ncrypt.d wincrypt.d winineti.d 
.D+=mediaobj.d mfobjects.d mmreg.d dvdmedia.d winioctl.d ks.d vptype.d ksmedia.d mfapi.d

.D+=d3dcommon.d
.D+=d3d10.d d3d10misc.d d3d10shader.d
.D+=d3d10_1.d d3d10_1shader.d
.D+=d3d11.d d3d11shader.d
#.D+=d3dcompiler.d d3dx11.d d3dx11core.d d3dx11async.d d3dx11tex.d

.D+=uiribbonkeydef.d uiribbon.d

.O=${.D:.d=.obj}
.DI=${.D:.d=.di}

DFLAGS=-O -release -inline -w -vtls -I..\..
DFLAGS+=-version=UNICODE  -version=INITGUID
#DFLAGS+=-version=HelperFunctions 
#DFLAGS+=-m64


DC=dmd

.SUFFIXES: .d .obj .di

all: ${TARGET}

.d.obj:
	${DC} -c ${DFLAGS} $<

.d.di:
	${DC} -H -o- ${DFLAGS} $<


${TARGET}: ${.O}
	dmd -lib -of$@ ${.O}

clean:
	-del *.obj

header: ${.DI}
