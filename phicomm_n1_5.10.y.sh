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
url=https://github-releases.githubusercontent.com/347537054/83519c13-25d8-4967-8dc5-bfc3d26d7d7d?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20210923%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20210923T095043Z&X-Amz-Expires=300&X-Amz-Signature=4d3317b832f9d72f3c8b1bf128f39ae88d96588fb7956192665fed117a8571eb&X-Amz-SignedHeaders=host&actor_id=0&key_id=0&repo_id=347537054&response-content-disposition=attachment%3B%20filename%3DArmbian_Phicomm-N1_OP-R21.9.18_5.14.6.img.tar.gz&response-content-type=application%2Foctet-stream
#Firmware=Armbian_Phicomm-N1_OP-R21.9.18_5.14.6.img.tar.gz
img=Armbian_Phicomm-N1_OP-R21.9.18_5.14.6.img
TIME g "===========================================下载固件中(需科学上网,否则无法更新)================================================="
curl $url
TIME g "=====================================================下载完成,解压中========================================================="
tar -zxvf *tar.gz && rm -f *.tar.gz
TIME r "=====================================================解压完成,开始升级固件===================================================="
chmod 755 update.sh
bash update.sh $img
