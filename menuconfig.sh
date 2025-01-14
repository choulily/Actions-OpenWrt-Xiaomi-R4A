#!/bin/bash
# Auto Config Generator For LEDE
# sudo apt update -y
# sudo apt full-upgrade -y
# sudo apt install -y ack antlr3 aria2 asciidoc autoconf automake autopoint binutils bison build-essential bzip2 ccache cmake cpio curl device-tree-compiler fastjar flex gawk gettext gcc-multilib g++-multilib git gperf haveged help2man intltool libc6-dev-i386 libelf-dev libglib2.0-dev libgmp3-dev libltdl-dev libmpc-dev libmpfr-dev libncurses5-dev libncursesw5-dev libreadline-dev libssl-dev libtool lrzsz mkisofs msmtp nano ninja-build p7zip p7zip-full patch pkgconf python2.7 python3 python3-pip libpython3-dev qemu-utils rsync scons squashfs-tools subversion swig texinfo uglifyjs upx-ucl unzip vim wget xmlto xxd zlib1g-dev
mkdir ~/lede
cd ~/lede
git clone git@github.com:choulily/Actions-OpenWrt-Xiaomi-R4A.git
git clone git@github.com:coolsnowwolf/lede.git
cp ./Actions-OpenWrt-Xiaomi-R4A/diy-part1.sh ./lede/1.sh
cp ./Actions-OpenWrt-Xiaomi-R4A/diy-part2.sh ./lede/2.sh
cp ./Actions-OpenWrt-Xiaomi-R4A/zzz-default-settings ./lede/zzz-default-settings
cp ./Actions-OpenWrt-Xiaomi-R4A/ra4-old.config ./lede/.config
cd lede
chmod +x 1.sh && ./1.sh
chmod +x ./scripts/feeds
./scripts/feeds update -a
./scripts/feeds install -a
chmod +x 2.sh && ./2.sh
make menuconfig
