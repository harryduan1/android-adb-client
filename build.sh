repo_dir=$(pwd)
echo "Repository directory: $repo_dir"

if [ ! -e android-ndk-r25c-linux.zip ]; then
    wget https://dl.google.com/android/repository/android-ndk-r25c-linux.zip
fi

if [ ! -d android-ndk-r25c ]; then
    unzip android-ndk-r25c-linux.zip
fi

export PATH=$PATH:$repo_dir/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/bin

# # #compile zlib for aarch64-linux-musl
cd $repo_dir/zlib-1.2.11
make clean
chmod +x configure
CC=armv7a-linux-androideabi30-clang ./configure --static --prefix=$(pwd)/../libz
make
make install

# #compile openssl for aarch64-linux-musl
cd $repo_dir/openssl-1.0.0e
make clean
chmod +x Configure
./Configure no-shared no-dso no-zlib os/compiler:armv7a-linux-androideabi30-clang --prefix=$(pwd)/../libopenssl
sed -i '242s/.*/build_all: build_libs/' $repo_dir/openssl-1.0.0e/Makefile
sed -i '497s/.*/install: install_sw/' $repo_dir/openssl-1.0.0e/Makefile
make
make install

#compile adb for aarch64-linux-musl
cd $repo_dir/android-tools-4.2.2/core/adb
make clean
make
