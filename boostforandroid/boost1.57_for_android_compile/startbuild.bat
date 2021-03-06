set ANDROID_SDK=F:\Android\android_dev\SDK
set ANDROID_NDK=F:\Android\android_dev\android-ndk-r10c
set ANDROID_NDK_TOOLCHAIN_VERSION=4.9
set BOOST_CONFIGURATION="-a --with-random --with-thread --with-date_time  --with-system   --with-chrono --with-filesystem --with-regex --layout=versioned toolset=gcc-android target-os=linux threading=multi link=static runtime-link=shared variant=release threadapi=pthread stage"

call build-android.bat android gcc armeabi %ANDROID_SDK% %ANDROID_NDK% %ANDROID_NDK_TOOLCHAIN_VERSION% %BOOST_CONFIGURATION%
call build-android.bat android gcc armeabi-v7a %ANDROID_SDK% %ANDROID_NDK% %ANDROID_NDK_TOOLCHAIN_VERSION% %BOOST_CONFIGURATION%
call build-android.bat android gcc x86 %ANDROID_SDK% %ANDROID_NDK% %ANDROID_NDK_TOOLCHAIN_VERSION% %BOOST_CONFIGURATION%
call build-android.bat android gcc mips %ANDROID_SDK% %ANDROID_NDK% %ANDROID_NDK_TOOLCHAIN_VERSION% %BOOST_CONFIGURATION%
call build-android.bat android gcc arm64-v8a %ANDROID_SDK% %ANDROID_NDK% %ANDROID_NDK_TOOLCHAIN_VERSION% %BOOST_CONFIGURATION%
call build-android.bat android gcc mips64 %ANDROID_SDK% %ANDROID_NDK% %ANDROID_NDK_TOOLCHAIN_VERSION% %BOOST_CONFIGURATION%
call build-android.bat android gcc x86_64 %ANDROID_SDK% %ANDROID_NDK% %ANDROID_NDK_TOOLCHAIN_VERSION% %BOOST_CONFIGURATION%