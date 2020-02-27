# Building Mer/Sailfish/Aurora applications
# Archlinux way, cross-compiling

## Initial

### Info

+ [https://sailfishos.org/wiki/Toolchain](https://sailfishos.org/wiki/Toolchain)
+ [http://releases.linaro.org/components/toolchain/binaries/4.9-2017.01/](http://releases.linaro.org/components/toolchain/binaries/4.9-2017.01/)

Some gcc info examples from the devices, sdk and linaro toolchain:

```bash
,---
| Sailfish OS 3.2.1.20 (Nuuksio)
,---
[nemo@Sailfish ~]$ gcc -v
Using built-in specs.
COLLECT_GCC=gcc
COLLECT_LTO_WRAPPER=/usr/libexec/gcc/armv7hl-meego-linux-gnueabi/4.9.4/lto-wrapper
Target: armv7hl-meego-linux-gnueabi
Configured with: ../configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --disable-bootstrap --with-bugurl=http://bugs.merproject.org/ --build=armv7hl-meego-linux-gnueabi --with-isl=/home/abuild/rpmbuild/BUILD/gcc-linaro-4.9-2017.01/obj-armv7hl-meego-linux-gnueabi/isl-install --with-cloog=/home/abuild/rpmbuild/BUILD/gcc-linaro-4.9-2017.01/obj-armv7hl-meego-linux-gnueabi/cloog-install --with-float=hard --with-fpu=neon --with-mode=thumb --with-arch=armv7-a --disable-sjlj-exceptions --enable-gold --enable-plugin --with-plugin-ld=gold --disable-multilib --enable-checking=release --disable-fixed-point --with-system-zlib --enable-__cxa_atexit --disable-libunwind-exceptions --enable-gnu-unique-object --enable-lto --enable-linker-build-id --enable-languages=c,c++,objc,obj-c++ --enable-threads=posix --enable-shared --disable-libgcj --disable-libsanitizer --disable-libcilkrts --build=armv7hl-meego-linux-gnueabi
Thread model: posix
gcc version 4.9.4 20160726 (Mer 4.9.4-1) (Linaro GCC 4.9-2017.01)
```

```bash
/opt/mer/toolings/SailfishOS-3.2.1.20/opt/cross/bin/armv7hl-meego-linux-gnueabi-gcc -v
Using built-in specs.
COLLECT_GCC=/opt/mer/toolings/SailfishOS-3.2.1.20/opt/cross/bin/armv7hl-meego-linux-gnueabi-gcc
COLLECT_LTO_WRAPPER=/opt/mer/toolings/SailfishOS-3.2.1.20/opt/cross/bin/../libexec/gcc/armv7hl-meego-linux-gnueabi/4.9.4/lto-wrapper
Target: armv7hl-meego-linux-gnueabi
Configured with: ../configure --prefix=/opt/cross --mandir=/opt/cross/share/man --infodir=/opt/cross/share/info --disable-bootstrap --with-bugurl=http://bugs.merproject.org/ --build=i486-meego-linux --with-isl=/home/abuild/rpmbuild/BUILD/gcc-linaro-4.9-2017.01/obj-i486-meego-linux/isl-install --with-cloog=/home/abuild/rpmbuild/BUILD/gcc-linaro-4.9-2017.01/obj-i486-meego-linux/cloog-install --host=i486-meego-linux --target=armv7hl-meego-linux-gnueabi --with-sysroot=/opt/cross/armv7hl-meego-linux-gnueabi/sys-root --disable-multilib --disable-multilib --enable-checking=release --disable-fixed-point --with-system-zlib --enable-__cxa_atexit --disable-libunwind-exceptions --enable-gnu-unique-object --enable-linker-build-id --enable-languages=c,c++,objc,obj-c++ --enable-threads=posix --enable-shared --disable-libgcj --disable-libsanitizer --disable-libcilkrts --with-float=hard --with-fpu=neon --with-arch=armv7-a --with-mode=thumb --build=i486-meego-linux
Thread model: posix
gcc version 4.9.4 20160726 (Mer 4.9.4-1) (Linaro GCC 4.9-2017.01) 
```

```bash
arm-linux-gnueabihf-gcc -v
Using built-in specs.
COLLECT_GCC=arm-linux-gnueabihf-gcc
COLLECT_LTO_WRAPPER=/usr/bin/../libexec/gcc/arm-linux-gnueabihf/4.9.4/lto-wrapper
Target: arm-linux-gnueabihf
Configured with: /home/tcwg-buildslave/workspace/tcwg-make-release/label/docker-trusty-amd64-tcwg-build/target/arm-linux-gnueabihf/snapshots/gcc-linaro-4.9-2017.01/configure SHELL=/bin/bash --with-mpc=/home/tcwg-buildslave/workspace/tcwg-make-release/label/docker-trusty-amd64-tcwg-build/target/arm-linux-gnueabihf/_build/builds/destdir/x86_64-unknown-linux-gnu --with-mpfr=/home/tcwg-buildslave/workspace/tcwg-make-release/label/docker-trusty-amd64-tcwg-build/target/arm-linux-gnueabihf/_build/builds/destdir/x86_64-unknown-linux-gnu --with-gmp=/home/tcwg-buildslave/workspace/tcwg-make-release/label/docker-trusty-amd64-tcwg-build/target/arm-linux-gnueabihf/_build/builds/destdir/x86_64-unknown-linux-gnu --with-gnu-as --with-gnu-ld --disable-libmudflap --enable-lto --enable-objc-gc --enable-shared --without-included-gettext --enable-nls --disable-sjlj-exceptions --enable-gnu-unique-object --enable-linker-build-id --disable-libstdcxx-pch --enable-c99 --enable-clocale=gnu --enable-libstdcxx-debug --enable-long-long --with-cloog=no --with-ppl=no --with-isl=no --disable-multilib --with-float=hard --with-mode=thumb --with-tune=cortex-a9 --with-arch=armv7-a --with-fpu=vfpv3-d16 --enable-threads=posix --enable-multiarch --enable-libstdcxx-time=yes --with-build-sysroot=/home/tcwg-buildslave/workspace/tcwg-make-release/label/docker-trusty-amd64-tcwg-build/target/arm-linux-gnueabihf/_build/sysroots/arm-linux-gnueabihf --with-sysroot=/home/tcwg-buildslave/workspace/tcwg-make-release/label/docker-trusty-amd64-tcwg-build/target/arm-linux-gnueabihf/_build/builds/destdir/x86_64-unknown-linux-gnu/arm-linux-gnueabihf/libc --enable-checking=release --disable-bootstrap --enable-languages=c,c++,fortran,lto --build=x86_64-unknown-linux-gnu --host=x86_64-unknown-linux-gnu --target=arm-linux-gnueabihf --prefix=/home/tcwg-buildslave/workspace/tcwg-make-release/label/docker-trusty-amd64-tcwg-build/target/arm-linux-gnueabihf/_build/builds/destdir/x86_64-unknown-linux-gnu
Thread model: posix
gcc version 4.9.4 (Linaro GCC 4.9-2017.01)
```

### Devel packages

`TODO:` sailfishos-platform-sdk-target-armv7hl-latest

`TODO`: sailfishos-platform-sdk-bin

`TODO`: arm-linux-gnueabihf-gcc-linaro-bin

```bash
yaourt -Qi arm-linux-gnueabihf-gcc-linaro-bin
```

```
Name            : arm-linux-gnueabihf-gcc-linaro-bin
Version         : 4.9-1
Description     : The GNU Compiler Collection - cross compiler for ARM EABI hard float target.
Architecture    : x86_64
URL             : http://www.linaro.org/downloads/
Licenses        : GPL  LGPL
Groups          : arm-linux-gnueabihf-toolchain-linaro-bin
Provides        : None
Depends On      : None
Optional Deps   : None
Required By     : None
Optional For    : None
Conflicts With  : arm-linux-gnueabihf-gcc
Replaces        : arm-linux-gnueabihf-gcc
Installed Size  : 351,62 MiB
Packager        : Unknown Packager
Build Date      : Ср 15 янв 2020 19:54:12
Install Date    : Ср 15 янв 2020 19:56:16
Install Reason  : Explicitly installed
Install Script  : No
Validated By    : None
```

## Cross-compile building

### Make project

`build-hello-make.sh`:

```bash
#!/bin/sh
make cross -C hello-make
```

`hello.cpp`:

```cpp
#include <stdio.h>
int main(int argc, char **argv)
{
   printf("Hello World\n");
   return 0;
}
```

`Makefile`:

```make
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

```

### CMake project

`build-hello-cmake.sh`:

```bash
#!/bin/sh
mkdir -p build-hello-cmake && cd build-hello-cmake
cmake -D CMAKE_BUILD_TYPE=Debug -D CMAKE_TOOLCHAIN_FILE=../Toolchain-SailfishOS-latest-armv7hl.cmake ../hello-cmake
make
```

[`Toolchain-SailfishOS-latest-armv7hl.cmake`](Toolchain-SailfishOS-latest-armv7hl.cmake)

### QMake project

`TODO`

## Installing dependencies

### From the repos to the target

`TODO`: scratchbox2, maybe docker, maybe just chroot via device or sshfs with the device as a target

```bash
ssh nemo@192.168.2.15
mkdir /tmp/hostmachine
# https://build.merproject.org/package/show/home:nielnielsen/sshfs
# http://repo.merproject.org/obs/home:/nielnielsen/sailfish_latest_armv7hl/armv7hl/sshfs-2.5-1.9.13.jolla.armv7hl.rpm
curl -LO http://repo.merproject.org/obs/home:/nielnielsen/sailfish_latest_armv7hl/armv7hl/sshfs-2.5-1.9.13.jolla.armv7hl.rpm
devel-su
pkcon install-local sshfs-2.5-1.9.13.jolla.armv7hl.rpm
sshfs -o allow_other,default_permissions,idmap=user aa13q@192.168.2.7:/opt/mer /tmp/hostmachine
cd /tmp/hostmachine/targets/SailfishOS-3.2.1.20-armv7hl
mount -t proc /proc proc/
mount --rbind /sys sys/
mount --rbind /dev dev/
mount --rbind /run run/
chroot . /bin/bash
# WARNING: DBus call failed, falling back to libssu: Failed to activate service 'org.nemo.ssu': timed out (service_start_timeout=25000ms)
# rpm -i file.rpm 
# error: unpacking of archive failed on file /usr/lib/somelib.so;5e580385: cpio: chown failed - File exists
```

## Deploy

### Pure binary

```bash
scp hello-make/hello nemo@192.168.2.15:~
ssh nemo@192.168.2.15
./hello
# Hello World
```

```bash
scp build-hello-cmake/app nemo@192.168.2.15:~
ssh nemo@192.168.2.15
./app
# Hello World!
```

### RPM package

`TODO`

## IDE integration

### Qt Creator

`TODO`
