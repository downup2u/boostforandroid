@echo off

setlocal EnableDelayedExpansion
set SRCLOC=%~dp0

set targetOS=%1
set compiler=%2
set targetArch=%3
set ANDROID_SDK=%4
set ANDROID_NDK=%5%
set ANDROID_NDK_TOOLCHAIN_VERSION=%6%
set BOOST_CONFIGURATION=%~7%

echo BOOST_CONFIGURATION is %BOOST_CONFIGURATION%

echo Going to build Boost for %targetOS%/%compiler%/%targetArch%

set validTargetOS=1
set buildNeeded=1

set validCompiler=0
if "%compiler%"=="gcc" (
	set validCompiler=1
)
if not "%validCompiler%"=="1" (
	echo 'gcc' is the only supported compilers, while '%compiler%' was specified
	exit /B 1
)

set validArch=0
if "%targetArch%"=="armeabi" (
	set validArch=1
)
if "%targetArch%"=="armeabi-v7a" (
	set validArch=1
)
if "%targetArch%"=="x86" (
	set validArch=1
)
if "%targetArch%"=="mips" (
	set validArch=1
)
if "%targetArch%"=="arm64-v8a" (
	set validArch=1
)
if "%targetArch%"=="mips64" (
	set validArch=1
)
if "%targetArch%"=="x86_64" (
	set validArch=1
)
if not "%validArch%"=="1" (
	echo 'armeabi', 'armeabi-v7a', 'x86', 'mips','arm64-v8a','mips64','x86_64' are the only supported target architectures, while '%targetArch%' was specified
	exit /B 1
)

if not exist "%ANDROID_SDK%" (
	echo ANDROID_SDK '%ANDROID_SDK%' does not point to a valid directory
	exit /B 1
)
set ANDROID_SDK_ROOT=%ANDROID_SDK%
echo Using ANDROID_SDK '%ANDROID_SDK%'

if not exist "%ANDROID_NDK%" (
	echo ANDROID_NDK '%ANDROID_NDK%' does not point to a valid directory
	exit /B 1
)
set ANDROID_NDK_ROOT=%ANDROID_NDK%
echo Using ANDROID_NDK '%ANDROID_NDK%'

set ANDROID_NDK_HOST=""
if exist "%ANDROID_NDK%\prebuilt\windows-x86_64" (
	set ANDROID_NDK_HOST=windows-x86_64
)
if exist "%ANDROID_NDK%\prebuilt\windows-x86" (
	set ANDROID_NDK_HOST=windows-x86
)
if exist "%ANDROID_NDK%\prebuilt\windows" (
	set ANDROID_NDK_HOST=windows
)
if "ANDROID_NDK_HOST"=="" (
	echo ANDROID_NDK '%ANDROID_NDK%' contains no valid host prebuilt tools
	exit /B 1
)
echo Using ANDROID_NDK_HOST '%ANDROID_NDK_HOST%'

set ANDROID_NDK_PLATFORM=android-21
if not exist "%ANDROID_NDK%\platforms\%ANDROID_NDK_PLATFORM%" (
	echo Platform '%ANDROID_NDK%\platforms\%ANDROID_NDK_PLATFORM%' does not exist
	exit /B 1
)
echo Using ANDROID_NDK_PLATFORM '%ANDROID_NDK_PLATFORM%'

echo Using ANDROID_NDK_TOOLCHAIN_VERSION '%ANDROID_NDK_TOOLCHAIN_VERSION%'

set TOOLCHAIN_PATH=""
if "%targetArch%"=="armeabi" (
	set TOOLCHAIN_PATH=%ANDROID_NDK%\toolchains\arm-linux-androideabi-%ANDROID_NDK_TOOLCHAIN_VERSION%
)
if "%targetArch%"=="armeabi-v7a" (
	set TOOLCHAIN_PATH=%ANDROID_NDK%\toolchains\arm-linux-androideabi-%ANDROID_NDK_TOOLCHAIN_VERSION%
)
if "%targetArch%"=="x86" (
	set TOOLCHAIN_PATH=%ANDROID_NDK%\toolchains\x86-%ANDROID_NDK_TOOLCHAIN_VERSION%
)
if "%targetArch%"=="mips" (
	set TOOLCHAIN_PATH=%ANDROID_NDK%\toolchains\mipsel-linux-android-%ANDROID_NDK_TOOLCHAIN_VERSION%
)
if "%targetArch%"=="arm64-v8a" (
	set TOOLCHAIN_PATH=%ANDROID_NDK%\toolchains\aarch64-linux-android-%ANDROID_NDK_TOOLCHAIN_VERSION%
)
if "%targetArch%"=="mips64" (
	set TOOLCHAIN_PATH=%ANDROID_NDK%\toolchains\mips64el-linux-android-%ANDROID_NDK_TOOLCHAIN_VERSION%
)
if "%targetArch%"=="x86_64" (
	set TOOLCHAIN_PATH=%ANDROID_NDK%\toolchains\x86_64-%ANDROID_NDK_TOOLCHAIN_VERSION%
)

if not exist "%TOOLCHAIN_PATH%" (
	echo Toolchain at '%TOOLCHAIN_PATH%' not found
	exit /B 1
)
echo Using toolchain '%TOOLCHAIN_PATH%'

if not exist "stage\lib\%targetArch%" (
	mkdir stage\lib\%targetArch%
)

echo Using '%targetOS%.%compiler%-%targetArch%.jam'
copy "%~dp0targets\%targetOS%.%compiler%-%targetArch%.jam" "%SRCLOC%\project-config.jam" /Y

b2 %BOOST_CONFIGURATION% 

move "stage\lib\*.*" "stage\lib\%targetArch%"

exit /B
