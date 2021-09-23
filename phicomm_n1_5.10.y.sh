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
url=https://git.io/n1_5.10.61.img
Firmware=Armbian_Phicomm-N1-R21.8.6_5.10.61.tar.gz
img=Armbian_Phicomm-N1-R21.8.6_5.10.61.img
echo -e "===========================================下载固件中(需科学上网,否则无法更新)================================================="
curl $url && mv n1_5.10.61.img $Firmware
TIME g "=====================================================下载完成,解压中========================================================="
tar -zxvf *tar.gz && rm -f *.tar.gz
TIME r "=====================================================解压完成,开始升级固件===================================================="
chmod 755 update.sh
bash update.sh Armbian_Phicomm-N1-R21.8.6_5.10.61.img
