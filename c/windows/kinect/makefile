
TARGET=kinect.lib

.D=nuiapi.d \
nuiimagecamera.d \
nuisensor.d \
nuiskeleton.d

.O=${.D:.d=.obj}
.DI=${.D:.d=.di}

DFLAGS=-O -release -inline -w -wi -vtls -I..\..\..
DFLAGS+=-version=UNICODE  -version=INITGUID

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
