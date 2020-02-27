#!/bin/sh
mkdir -p build-hello-cmake && cd build-hello-cmake
cmake -D CMAKE_BUILD_TYPE=Debug -D CMAKE_TOOLCHAIN_FILE=../Toolchain-SailfishOS-latest-armv7hl.cmake ../hello-cmake
make
