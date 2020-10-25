CFLAGS        += -pipe -O2 -Wall -W -D_REENTRANT -lpthread -lLEPTON_SDK
CXXFLAGS      += -pipe -O2 -Wall -W -D_REENTRANT -lpthread -lLEPTON_SDK
INCPATH		  += -I.

all: leptsci.o SPI.o Lepton_I2C.o Palettes.o lepton_v4l2_capture

Palettes.o: Palettes.cpp Palettes.h
	${CXX} -c ${CXXFLAGS} ${INCPATH} -o Palettes.o Palettes.cpp

SPI.o: SPI.cpp SPI.h
	${CXX} -c ${CXXFLAGS} ${INCPATH} -o SPI.o SPI.cpp

Lepton_I2C.o: 
	${CXX} -c ${CXXFLAGS} ${INCPATH} -o Lepton_I2C.o Lepton_I2C.cpp

lepton_v4l2_capture: lepton_v4l2_capture.o leptsci.o Palettes.o SPI.o
	${CXX} -c ${CXXFLAGS} -o lepton_v4l2_capture leptsci.o Palettes.o SPI.o lepton_v4l2_capture.cpp

leptsci.o: leptsci.c

clean:
	rm -f SPI.o Lepton_I2C.o Palettes.o leptsci.o lepton_v4l2_capture.o lepton_v4l2_capture
