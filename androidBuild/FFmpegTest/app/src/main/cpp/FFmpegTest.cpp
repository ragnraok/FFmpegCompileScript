//
// Created by ragnarok on 2021/3/14.
//

#include <jni.h>
#include <android/log.h>

extern "C" {
#include "libavformat/avformat.h"
#include "libavcodec/avcodec.h"
#include "libavutil/avutil.h"
#include "libswresample/swresample.h"
#include "libswscale/swscale.h"
#include "libavcodec/jni.h"
}


void test() {
    av_register_all();

    auto *codec = avcodec_find_decoder_by_name("hevc_mediacodec");
    if (codec != nullptr) {
        __android_log_print(ANDROID_LOG_INFO, "FFmpegTest", "Get MediaCodec decoder");
    } else {
        __android_log_print(ANDROID_LOG_INFO, "FFmpegTest", "Cannot get MediaCodec decoder");
    }
}

extern "C" JNIEXPORT
void JNICALL Java_com_ragnarok_ffmpegtest_FFmpegTest_testFFmpeg(JNIEnv *env, jobject) {
    av_jni_set_java_vm(env, nullptr);
    test();
}