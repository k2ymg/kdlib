include ..\..\dmake

VPATH:=..\..\windows:${VPATH}

DFLAGS=-release -O -inline -vtls -w -wi -nofloat -I..\..\..

TARGETS =
TARGETS += d3d9.lib
TARGETS += d3d9_.lib
TARGETS += d3dx9.lib 
TARGETS += d3dx9_.lib
#TARGETS += mmsystem.lib
#TARGETS += msimg32.lib
#TARGETS += shell32.lib
TARGETS += unknwn.lib
#TARGETS += user32.lib
#TARGETS += version.lib
TARGETS += windows.lib
TARGETS += wininet.lib



all: ${TARGETS}

d3d9.lib: d3d9.def
	implib d3d9.lib d3d9.def

d3d9_.lib: d3d9.obj
	lib -c d3d9_.lib d3d9.obj

d3dx9.lib: d3dx9.def
	implib d3dx9.lib d3dx9.def

d3dx9_.lib: d3dx9.obj
	lib -c d3dx9_.lib d3dx9.obj


WINDOWS.DFILES = windef.d winerror.d winuser.d \
 wingdi.d winbase.d winnt.d guiddef.d commctrl.d prsht.d
WINDOWS.OBJFILES = ${WINDOWS.DFILES:.d=.obj}
windows.lib: ${WINDOWS.OBJFILES}
	lib -c windows.lib ${WINDOWS.OBJFILES}

UNKNWN.DFILES = unknwn.d oaidl.d oleidl.d objidl.d exdisp.d
UNKNWN.OBJFILES = ${UNKNWN.DFILES:.d=.obj}
unknwn.lib: ${UNKNWN.OBJFILES}
	lib -c unknwn.lib ${UNKNWN.OBJFILES}

MMSYSTEM.DFILES = mmsystem.d
MMSYSTEM.OBJFILES = ${MMSYSTEM.DFILES:.d=.obj}
mmsystem.lib: ${MMSYSTEM.OBJFILES}
	lib -c mmsystem.lib ${MMSYSTEM.OBJFILES}

wininet.lib: wininet.def
	implib wininet.lib wininet.def



clean:
	-del *.obj
	-del *.bak

alldelete:
	-del ${TARGETS}
