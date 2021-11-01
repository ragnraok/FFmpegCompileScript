cmake_minimum_required(VERSION 3.4.1)

project(FFmpegTest)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")

set(ffmpeg_dir ${CMAKE_SOURCE_DIR}/../cppLibs/libFFmpeg)
set(ffmpeg_lib_dir ${ffmpeg_dir}/lib)
set(ffmpeg_include_dir ${ffmpeg_dir}/include)

set(x264_dir ${CMAKE_SOURCE_DIR}/../cppLibs/libx264/arm64-v8a)
set(x264_lib_dir ${x264_dir}/lib)
set(x264_include_dir ${x264_dir}/include)

include_directories(${ffmpeg_include_dir} ${x264_include_dir})
link_directories(${ffmpeg_lib_dir} ${x264_lib_dir})

# note the link order
set(ffmpeg_lib_list
        avfilter
        avformat
        avcodec
        avutil
        swresample
        swscale
        x264)

find_library(log_lib log)
set(android_lib
        android
        OpenSLES
        EGL
        GLESv2
        ${log_lib}
        z)

add_library(FFmpegTest
        SHARED
        FFmpegTest.cpp)

target_link_libraries(FFmpegTest
        ${ffmpeg_lib_list}
        ${android_lib})


