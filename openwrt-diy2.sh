#!/bin/bash
svn co https://github.com/coolsnowwolf/lede/trunk/tools/ucl tools/ucl
svn co https://github.com/coolsnowwolf/lede/trunk/tools/upx tools/upx
echo 'tools-y += ucl upx'>>tools/Makefile
echo '$(curdir)/upx/compile := $(curdir)/ucl/compile'>>tools/Makefile
sed -i 's/192.168.1.1/192.168.31.2/g' package/base-files/files/bin/config_generate
sed -i '$a src-git node https://github.com/nxhack/openwrt-node-packages.git' feeds.conf.default
./scripts/feeds update node
rm ./package/feeds/packages/node
rm ./package/feeds/packages/node-*
./scripts/feeds install -a -p node
wget https://github.com/upx/upx/releases/download/v3.96/upx-3.96-arm64_linux.tar.xz
xz -d upx-3.96-arm64_linux.tar.xz
tar xf upx-3.96-arm64_linux.tar
mv upx-3.96-arm64_linux/upx /home/runner/work/mknop/mknop/op/staging_dir/host/bin/
