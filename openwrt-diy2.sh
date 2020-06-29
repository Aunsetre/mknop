#!/bin/bash

sed -i 's/192.168.1.1/192.168.31.2/g' package/base-files/files/bin/config_generate
wget https://github.com/upx/upx/releases/download/v3.96/upx-3.96-arm64_linux.tar.xz
xz -d upx-3.96-arm64_linux.tar.xz
tar xf upx-3.96-arm64_linux.tar
mv upx-3.96-arm64_linux/upx /home/runner/work/mknop/mknop/op/staging_dir/host/bin/
