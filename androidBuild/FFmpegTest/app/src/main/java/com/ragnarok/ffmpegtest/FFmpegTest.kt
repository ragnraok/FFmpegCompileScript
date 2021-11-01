package com.ragnarok.ffmpegtest

class FFmpegTest {

    companion object {
        init {
            System.loadLibrary("FFmpegTest")
        }
    }

    external fun testFFmpeg()
}