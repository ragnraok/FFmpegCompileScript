# FFmpegCompileScript
Custom FFMpeg build script which support cross-compile to macOS/iOS/Android

## Usage:

First, init all submodule: ``git submodule update --init --recursive``

then change your ffmpeg configure options in ``configureOptions.sh``

### Build mac OS target

run ``cd macOSBuild && ./macOSBuild.sh``, it will output the library in ``macOSBuild/libFFmpeg`` and ``macOSBuild/libx264``

### Build Android target

Android build require android-ndk-r12b, and the compile script will presume your NDK location with ``$HOME/android-ndk-r12b``

then run ``cd androidBuild && ./androidBuild.sh``, it will output the library in ``androidBuild/libFFmpeg`` and ``androidBuild/libx264``

### Build iOS target

ios build require xcode compile toolchain and gas-preprocessor, you can intall via App Store and HomeBrew

then run ``cd iOSBuild && ./iosBuild.sh``, it will output the libarary in ``iOSBuild/FFmpeg-iOS`` and ``iOSBuild/x264-iOS``, by default, it will build a fat libaray which embedded arm64/x86_64 in the output library, you can change this behavior via change the ``ARCHS`` varaible in ``iOSBuild/iosBuild.sh``

