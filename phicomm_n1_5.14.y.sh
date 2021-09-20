#!/bin/bash
TIME() {
[[ -z "$1" ]] && {
	echo -ne " "
} || {
     case $1 in
	r) export Color="\e[31m";;
	g) export Color="\e[32m";;
	b) export Color="\e[34m";;
	y) export Color="\e[33m";;
	z) export Color="\e[35m";;
	l) export Color="\e[36m";;
      esac
	[[ $# -lt 2 ]] && echo -e "\e[36m\e[0m ${1}" || {
		echo -e "\e[36m\e[0m ${Color}${2}\e[0m"
	 }
      }
}
cd /mnt/mmcblk2p4
rm -rf *.sh Armbian_*
echo
TIME g "===========================================下载固件中(需科学上网,否则无法更新)================================================="
wget https://github.com/gd0772/AutoBuild-OpenWrt/releases/download/AutoUpdate/Armbian_Phicomm-N1_OP-R21.9.18_5.14.6.img.tar.gz
TIME g "=====================================================下载完成,解压中========================================================="
tar -zxvf *tar.gz && rm -f *.tar.gz
TIME r "=====================================================解压完成,开始升级固件===================================================="
chmod 755 update.sh
bash update.sh Armbian_Phicomm-N1_OP-R21.9.18_5.14.6.img
