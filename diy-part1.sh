#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default
if [ -d "package/more" ];then
  echo "文件夹存在"
  rm -rf package/more
else
  echo "文件夹不存在"
fi
set -x
svn checkout https://github.com/coolsnowwolf/lede/trunk/package/lean/dns2socks package/more/dns2socks
svn checkout https://github.com/coolsnowwolf/lede/trunk/package/lean/pdnsd-alt package/more/pdnsd-alt
svn checkout https://github.com/coolsnowwolf/lede/trunk/package/lean/tcpping package/more/tcpping
svn checkout https://github.com/coolsnowwolf/lede/trunk/package/lean/trojan package/more/trojan
svn checkout https://github.com/coolsnowwolf/lede/trunk/package/lean/simple-obfs package/more/simple-obfs
svn checkout https://github.com/coolsnowwolf/lede/trunk/package/lean/redsocks2 package/more/redsocks2
svn checkout https://github.com/coolsnowwolf/lede/trunk/package/lean/ipt2socks package/more/ipt2socks
svn checkout https://github.com/coolsnowwolf/lede/trunk/package/lean/microsocks package/more/microsocks
git clone https://github.com/garypang13/luci-app-eqos.git package/more/luci-app-eqos
