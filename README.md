#### 介绍
android-tools源码，方便不同平台移植。

#### 使用说明
1.需要先安装zlib与openssl。详细安装流程查看
交叉编译并移植Android工具adb与adbd过程 https://blog.csdn.net/disappears_nick/article/details/117031743

2.根据自己编译平台环境，自行修改对应目录下makefile中的编译器

3.以编译adb为例子，进入adb目录make即可在当前目录下生成adb二进制文件。

