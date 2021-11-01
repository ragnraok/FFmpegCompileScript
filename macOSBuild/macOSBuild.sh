#!/bin/sh

source ../configureOptions.sh

CWD=`pwd`

mkdir -p build/

X264_OUT=`pwd`/libx264
if [ ! -d $X264_OUT ]
then
    # build x264
    echo "Start to build x264"
    X264_SOURCE=`pwd`/../x264
    X264_CONFIGURE_FLAGS=$X264_CONFIGURE_FLAGS

    X264_BUILD=build/x264Build
    mkdir -p $X264_BUILD
    cd $X264_BUILD
    $X264_SOURCE/configure \
            $X264_CONFIGURE_FLAGS \
            --prefix=$X264_OUT

    make clean
    make -j3 install
fi

cd $CWD

# build ffmpeg
echo "Start to build FFmpeg"
FFMPEG_SOURCE=`pwd`/../FFmpeg_release_4_3
CONFIGURE_FLAGS=$FF_CONFIGURE_FLAGS
FFMPEG_OUT=`pwd`/libFFmpeg

FFMPEG_BUILD=build/FFmpegBuild
mkdir -p $FFMPEG_BUILD

cd $FFMPEG_BUILD

CFLAGS="-I$X264_OUT/include"
LDFLAGS="-L$X264_OUT/lib"

$FFMPEG_SOURCE/configure \
    $CONFIGURE_FLAGS \
    --prefix=$FFMPEG_OUT \
    --arch=x86_64 \
    --extra-cflags="$CFLAGS" \
	--extra-ldflags="$LDFLAGS"

make clean
make -j3 install

cd $CWD