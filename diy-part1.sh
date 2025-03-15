#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
# echo 'src-git smpall https://github.com/kenzok8/small' >>feeds.conf.default

mkdir Modem-Support
pushd Modem-Support
git clone --depth=1 https://github.com/Siriling/5G-Modem-Support .
popd

pushd package
# 5G通信模组拨号工具
mkdir quectel_QMI_WWAN
mkdir fibocom_QMI_WWAN
mkdir quectel_cm_5G
mkdir meig_QMI_WWAN
mkdir meig-cm
mkdir quectel_MHI
# mkdir luci-app-hypermodem
cp -rf ../Modem-Support/quectel_QMI_WWAN/* quectel_QMI_WWAN
cp -rf ../Modem-Support/fibocom_QMI_WWAN/* fibocom_QMI_WWAN
cp -rf ../Modem-Support/quectel_cm_5G/* quectel_cm_5G
cp -rf ../Modem-Support/meig-cm/* meig-cm
cp -rf ../Modem-Support/meig_QMI_WWAN/* meig_QMI_WWAN
cp -rf ../Modem-Support/quectel_MHI/* quectel_MHI
# # cp -rf ../Modem-Support/luci-app-hypermodem/* luci-app-hypermodem

# 5G模组短信插件
rm -rf ../package/luci-app-sms-tool
mkdir luci-app-sms-tool
cp -rf ../Modem-Support/sms-tool/* sms-tool
cp -rf ../Modem-Support/luci-app-sms-tool/* luci-app-sms-tool
popd

