#!/bin/sh
FF_CONFIGURE_FLAGS="--disable-debug \
                --disable-programs \
                --disable-doc \
                --enable-pic \
                --enable-gpl \
                --enable-libx264 \
                --enable-static \
                --disable-ffmpeg \
                --disable-ffplay \
                --disable-programs \
                --disable-ffprobe \
                --disable-avdevice"

X264_CONFIGURE_FLAGS="--enable-static --enable-pic --disable-cli"