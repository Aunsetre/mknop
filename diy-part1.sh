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
 
cd package/lean/  

rm -rf luci-app-vssr  luci-lib-docker luci-app-dockerman luci-theme-argon luci-app-smartdns openwrt-smartdns luci-app-adguardhome openwrt-packages
rm -rf kcptun  lua-maxminddb small
 
# adguardhome
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git

### theme ###
# luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git
sed -i 's/Microsoft Yahei/Sarasa UI SC/ ' luci-theme-argon/htdocs/luci-static/argon/css/style.css


#docker
git clone https://github.com/lisaac/luci-app-dockerman.git
git clone https://github.com/lisaac/luci-lib-docker.git

#kcptun

# helloWorld
git clone https://github.com/jerrykuku/lua-maxminddb.git  #git lua-maxminddb 依赖
git clone https://github.com/jerrykuku/luci-app-vssr.git 

# passwall 依赖
#brook  chinadns-ng   dns2socks  ipt2socks  kcptun  pdnsd-alt  simple-obfs  tcping  v2ray-plugin
 git clone https://github.com/kenzok8/small.git

#luci-app-openclash ------------------openclash图形
# luci-app-advancedsetting ------------------系统高级设置
# luci-theme-atmaterial ------------------atmaterial 三合一主题（适配18.06）
# luci-app-aliddns ------------------阿里云ddns
# luci-theme-argon-dark-new------------------适配19.07与18.06的主题
# luci-app-eqos ------------------依IP地址限速
# luci-app-gost ------------------隐蔽的https代理
# luci-app-koolproxyR ------------------去广告
# luci-app-smartdns ------------------smartdns防污染
# luci-app-passwall ------------------Lienol大神
# luci-theme-argon_new ------------------适配19.07与18.06的主题
# luci-app-ssr-plus ------------------Lean大神
# luci-theme-opentomcat ------------------修复主机名错误（适配18.06）
# luci-theme-opentomato ------------------修复主机名错误（适配18.06）
# 注意
 git clone git clone -b master https://github.com/kenzok8/openwrt-packages/tree/master/luci-app-passwall.git
 #
 #smartdns
git clone  https://github.com/pymumu/openwrt-smartdns.git
git clone -b lede https://github.com/pymumu/luci-app-smartdns.git
#n1-install-program
 git clone https://github.com/tuanqing/install-program
