SRCPATH=../../../x264
prefix=/Volumes/Ragnarok/Personal/Project/FFmpegCompileScript/iOSBuild/thin-x264/arm64
exec_prefix=${prefix}
bindir=${exec_prefix}/bin
libdir=${exec_prefix}/lib
includedir=${prefix}/include
SYS_ARCH=AARCH64
SYS=MACOSX
CC=xcrun -sdk iphoneos clang
CFLAGS=-Wshadow -O3 -ffast-math  -Wall -I. -I$(SRCPATH) -arch arm64 -fembed-bitcode -mios-version-min=7.0 -std=gnu99 -D_GNU_SOURCE -fPIC -fomit-frame-pointer -fno-tree-vectorize -fvisibility=hidden
CFLAGSSO=
CFLAGSCLI=
COMPILER=GNU
COMPILER_STYLE=GNU
DEPMM=-MM -g0
DEPMT=-MT
LD=xcrun -sdk iphoneos clang -o 
LDFLAGS= -arch arm64 -fembed-bitcode -mios-version-min=7.0 -lm -lpthread -ldl
LDFLAGSCLI=
LIBX264=libx264.a
CLI_LIBX264=$(LIBX264)
AR=ar rc 
RANLIB=ranlib
STRIP=strip
INSTALL=install
AS=/Volumes/Ragnarok/Personal/Project/FFmpegCompileScript/iOSBuild/../x264/tools/gas-preprocessor.pl -arch aarch64 -- xcrun -sdk iphoneos clang
ASFLAGS= -I. -I$(SRCPATH) -arch arm64 -fembed-bitcode -mios-version-min=7.0 -DPREFIX -DPIC -c -DSTACK_ALIGNMENT=16
RC=
RCFLAGS=
EXE=
HAVE_GETOPT_LONG=1
DEVNULL=/dev/null
PROF_GEN_CC=-fprofile-generate
PROF_GEN_LD=-fprofile-generate
PROF_USE_CC=-fprofile-use
PROF_USE_LD=-fprofile-use
HAVE_OPENCL=yes
CC_O=-o $@
default: lib-static
install: install-lib-static
