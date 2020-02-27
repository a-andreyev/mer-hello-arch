SAILFISH_TARGET_NAME := SailfishOS-3.2.1.20-armv7hl
CC      := g++
TOOLCHAIN := arm-linux-gnueabihf-
PT      :=
CFL     := -Wextra -std=c++11
TPATH := /usr/bin/
LPATH := /opt/mer/targets/$(SAILFISH_TARGET_NAME)/
ARCH := -march=armv7-a --sysroot=$(LPATH)

all: hello.cpp
	$(CC) $(CFL) -o eval hello.cpp

cross: hello.cpp
	$(TPATH)$(TOOLCHAIN)$(CC) $(CFL) $(ARCH) hello.cpp -o hello

clear:
	rm -f *.o
	rm -f eval
