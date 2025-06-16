repo_dir=$(pwd)
echo "Repository directory: $repo_dir"

if [ ! -d aarch64-linux-musl-cross ]; then
    wget https://musl.cc/aarch64-linux-musl-cross.tgz
    tar -xzf aarch64-linux-musl-cross.tgz
fi

export PATH=$PATH:$(pwd)/aarch64-linux-musl-cross/bin

# # #compile zlib for aarch64-linux-musl
cd $repo_dir/zlib-1.2.11
make clean
# chmod +x configure
# CC=aarch64-linux-musl-gcc ./configure --static --prefix=$(pwd)/../libz
make
make install

# #compile openssl for aarch64-linux-musl
cd $repo_dir/openssl-1.0.0e
make clean
# chmod +x Configure
# ./Configure no-shared no-dso no-zlib os/compiler:aarch64-linux-musl-gcc --prefix=$(pwd)/../libopenssl
make
make install

#compile adb for aarch64-linux-musl
cd $repo_dir/android-tools-4.2.2/core/adb
make clean
make
