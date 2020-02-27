SET(SAILFISH_SDK_NAME SailfishOS-3.2.1.20-armv7hl)
SET(CMAKE_SYSTEM_NAME Linux)
SET(CMAKE_SYSTEM_VERSION 1)

# Specify the cross compiler
SET(CMAKE_C_COMPILER arm-linux-gnueabihf-gcc)
SET(CMAKE_CXX_COMPILER arm-linux-gnueabihf-g++)

# Where is the target environment
SET(CMAKE_FIND_ROOT_PATH /opt/mer/targets/${SAILFISH_SDK_NAME})
SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} --sysroot=${CMAKE_FIND_ROOT_PATH}")
SET(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} --sysroot=${CMAKE_FIND_ROOT_PATH}")
SET(CMAKE_MODULE_LINKER_FLAGS "${CMAKE_MODULE_LINKER_FLAGS} --sysroot=${CMAKE_FIND_ROOT_PATH}")

# Search for programs only in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# Search for libraries and headers only in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# https://stackoverflow.com/a/9234452

set(ENV{PKG_CONFIG_DIR} "")
set(ENV{PKG_CONFIG_LIBDIR} "${CMAKE_FIND_ROOT_PATH}/usr/lib/pkgconfig:${CMAKE_FIND_ROOT_PATH}/usr/share/pkgconfig")
set(ENV{PKG_CONFIG_SYSROOT_DIR} ${CMAKE_FIND_ROOT_PATH})

# https://stackoverflow.com/a/39077145

file(GLOB Qt_bin /usr/bin)

find_program(QT_MOC_EXECUTABLE qt_moc moc PATHS ${Qt_bin})
add_executable(Qt5::moc IMPORTED)
set_property(TARGET Qt5::moc PROPERTY IMPORTED_LOCATION ${QT_MOC_EXECUTABLE})

find_program(QT_LRELEASE_EXECUTABLE qt_lrelease lrelease PATHS ${Qt_bin})
add_executable(Qt5::lrelease IMPORTED)
set_property(TARGET Qt5::lrelease PROPERTY IMPORTED_LOCATION ${QT_LRELEASE_EXECUTABLE})
