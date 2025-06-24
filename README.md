#### 介绍

android-tools源码，方便不同平台移植。

#### 使用说明

1.根据自己编译平台环境，切换对应的分支，运行build.sh脚本一键式编译。

2.以编译adb为例子，脚本编译完成后，进入android-tools-4.2.2/core/adb目录获取adb二进制文件。如果想要编译adbd，自行修改build.sh脚本。

#### 参考博客

1.编译adb前，需要先安装zlib与openssl。此步骤在build.sh中已经完成。

详细安装流程查看交叉编译并移植Android工具adb与adbd过程

https://blog.csdn.net/disappears_nick/article/details/117031743

https://www.cnblogs.com/duapple/p/17915542.html

#### 踩坑总结：

##### 1.编译

1. #报错
   error: "./adb": executable's TLS segment is underaligned: alignment is 8, needs to be at least 32 for ARM Bionic

    #查看内存对齐
	readelf -l adb | grep TLS


**
    解决方案：使用android-ndk-r25c的armv7a-linux-androideabi30-clang及以上版本编译**


##### 2.运行

1. ./adb devices
   error: cloesd

**解决方案：不要adb root启动adbd，防止抢占adb的资源，进adbd后，su root切root身份再运行adb。**
