#!/bin/sh

# only build arm64 for android

source ../configureOptions.sh

NDK=$HOME/android-ndk-r12b
PLATFORM_PREFIX=aarch64-linux-android-
PLATFORM_VERSION=4.9
TOOLCHAIN=$NDK/toolchains/${PLATFORM_PREFIX}${PLATFORM_VERSION}/prebuilt/darwin-x86_64
CC=$TOOLCHAIN/bin/${PLATFORM_PREFIX}gcc
CXX=$TOOLCHAIN/bin/${PLATFORM_PREFIX}g++
SYSROOT=$NDK/platforms/android-21/arch-arm64
CROSS_PREFIX=${TOOLCHAIN}/bin/${PLATFORM_PREFIX}


echo "SYSROOT=$SYSROOT"
echo "TOOLCHAIN=$TOOLCHAIN"
echo "CROSS_PREFIX=$CROSS_PREFIX"
echo "CC=$CC"
echo "CXX=$CXX"


CWD=`pwd`


mkdir -p build/
X264_OUT=`pwd`/libx264/arm64-v8a
if [ ! -d $X264_OUT ]
then
    # build x264
    echo "Start to build x264"
    X264_SOURCE=`pwd`/../x264
    echo "X264_CONFIGURE_FLAGS=$X264_CONFIGURE_FLAGS"

    X264_BUILD=build/x264Build
    mkdir -p $X264_BUILD
    cd $X264_BUILD
    $X264_SOURCE/configure \
            --prefix=$X264_OUT \
            --host=aarch64-linux \
            --cross-prefix=$CROSS_PREFIX \
            --sysroot=$SYSROOT \
            $X264_CONFIGURE_FLAGS

    make clean
    make -j3 install
fi

cd $CWD

# build ffmpeg
echo "Start to build FFmpeg"
FFMPEG_SOURCE=`pwd`/../FFmpeg_release_4_3
CONFIGURE_FLAGS=$FF_CONFIGURE_FLAGS
CONFIGURE_FLAGS="$CONFIGURE_FLAGS --enable-cross-compile"
FFMPEG_OUT=`pwd`/libFFmpeg

FFMPEG_BUILD=build/FFmpegBuild/arm64-v8a
mkdir -p $FFMPEG_BUILD

cd $FFMPEG_BUILD

CFLAGS="-I$X264_OUT/include -march=armv8-a"
LDFLAGS="-L$X264_OUT/lib"

export PKG_CONFIG_PATH=$X264_OUT/lib/pkgconfig:$PKG_CONFIG_PATH

ANDROID_HW_DECODERS="
                --enable-jni \
                --enable-mediacodec \
                --enable-decoder=mpeg2_mediacodec \
                --enable-decoder=vp8_mediacodec \
                --enable-decoder=vp9_mediacodec \
                --enable-decoder=mpeg4_mediacodec \
                --enable-decoder=h264_mediacodec \
                --enable-decoder=hevc_mediacodec"

$FFMPEG_SOURCE/configure \
    $CONFIGURE_FLAGS \
    $ANDROID_HW_DECODERS \
    --extra-cflags="$CFLAGS" \
	--extra-ldflags="$LDFLAGS" \
    --arch=aarch64 \
    --cpu=armv8-a \
    --prefix=$FFMPEG_OUT \
    --cross-prefix=$CROSS_PREFIX \
    --target-os=android \
    --disable-symver \
    --enable-cross-compile \
    --cc=$CC \
    --cxx=$CXX \
    --sysroot=$SYSROOT \
    --pkg-config=/usr/local/bin/pkg-config


make clean
make -j3 install

cd $CWD


