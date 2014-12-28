boostforandroid

How to compile boost1.57 for android(windows host)?

prepare:
1、download/unzip your boost src files to directory like "E:\boost_1_57_0"
2、copy all files in 'boost1.57_for_android_compile' to "E:\boost_1_57_0"

start compile:
1、edit 'startbuild.bat' to set variables and boost libarary.
2、run 'cmd' and 'cd' to your "E:\boost_1_57_0" directory
3、run 'booststrap.bat' to generate 'b2.exe'
4、run 'startbuild.bat'
5、wait to compile finished....
6、copy boost_1_57_0\stage\lib all files to your jni project.
