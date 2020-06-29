#!/bin/bash
sed -i 's/192.168.1.1/192.168.31.2/g' package/base-files/files/bin/config_generate
sed -i '$a src-git node https://github.com/nxhack/openwrt-node-packages.git' feeds.conf.default
./scripts/feeds update node
rm ./package/feeds/packages/node
rm ./package/feeds/packages/node-*
./scripts/feeds install -a -p node
