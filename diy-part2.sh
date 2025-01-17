#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
rm package/lean/default-settings/files/zzz-default-settings
cp ./zzz-default-settings package/lean/default-settings/files/zzz-default-settings
# 修改openwrt登陆地址,把下面的192.168.5.1修改成你想要的就可以了
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate

# 修改主机名字，把Xiaomi-R4A修改你喜欢的就行（不能纯数字或者使用中文）
sed -i '/uci commit system/i\uci set system.@system[0].hostname='LilyChou'' package/lean/default-settings/files/zzz-default-settings

# 版本号里显示一个自己的名字（ababwnq build $(TZ=UTC-8 date "+%Y.%m.%d") @ 这些都是后增加的）
sed -i "s/OpenWrt /LilyChou build $(TZ=UTC-8 date "+%Y.%m.%d") @ 由OpenWrt强力驱动 /g" package/lean/default-settings/files/zzz-default-settings

# 修改 argon 为默认主题,可根据你喜欢的修改成其他的（不选择那些会自动改变为默认主题的主题才有效果）
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 修改默认wifi名称ssid为Xiaomi_R4A
sed -i 's/ssid=OpenWrt/ssid=Xiaomi_R4A/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# Change Kernel Version to 510
sed -i 's#KERNEL_PATCHVER:=5.4#KERNEL_PATCHVER:=5.10#g' target/linux/ramips/Makefile

# As far as i know, this fiexes error 2 issue when compiling
#rm /target/linux/generic/pending-5.10/435-mtd-add-routerbootpart-parser-config.patch
