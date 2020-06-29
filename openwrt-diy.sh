#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
cd package/  

rm -rf luci-app-vssr  luci-lib-docker luci-app-dockerman luci-theme-argon openwrt-packages  lua-maxminddb small
 
# adguardhome
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git

### theme ###
# luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon.git
sed -i 's/Microsoft Yahei/Sarasa UI SC/ ' luci-theme-argon/htdocs/luci-static/argon/custom.css
# oui
#git clone https://github.com/zhaojh329/oui.git





#docker
git clone https://github.com/lisaac/luci-app-dockerman.git
git clone https://github.com/lisaac/luci-lib-docker.git

#kcptun
#git clone https://github.com/kuoruan/luci-app-kcptun.git 

# helloWorld
git clone https://github.com/jerrykuku/lua-maxminddb.git  #git lua-maxminddb 依赖
git clone https://github.com/jerrykuku/luci-app-vssr.git 

# passwall 依赖
#brook  chinadns-ng   dns2socks  ipt2socks  kcptun  pdnsd-alt  simple-obfs  tcping  v2ray-plugin
git clone https://github.com/Lienol/openwrt-package.git

# 注意
svn checkout https://github.com/kenzok8/openwrt-packages/trunk/luci-app-passwall/
 #
 #smartdns
git clone https://github.com/pymumu/luci-app-smartdns.git
#n1-install-program
git clone https://github.com/tuanqing/install-program
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/parted
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-vlmcsd
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-syncdial
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/luci-app-netdata
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/ipv6-helper
cd ..
svn co https://github.com/coolsnowwolf/lede/trunk/tools/ucl tools/ucl
svn co https://github.com/coolsnowwolf/lede/trunk/tools/upx tools/upx
echo 'tools-y += ucl upx'>>tools/Makefile
echo '$(curdir)/upx/compile := $(curdir)/ucl/compile'>>tools/Makefile
