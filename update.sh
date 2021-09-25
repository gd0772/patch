#/bin/bash

TIME() {
[[ -z "$1" ]] && {
	echo -ne " "
} || {
     case $1 in
	r) export Color="\e[31;1m";;
	g) export Color="\e[32;1m";;
	b) export Color="\e[34;1m";;
	y) export Color="\e[33;0m";;
	z) export Color="\e[35;1m";;
	l) export Color="\e[36;1m";;
      esac
	[[ $# -lt 2 ]] && echo -e "\e[36m\e[0m ${1}" || {
		echo -e "\e[36m\e[0m ${Color}${2}\e[0m"
	 }
      }
}

	while :; do
	TIME g "---------------------------------------------------"
	TIME g "[1] 更新至 2021.09.26 编译的 R21.9.18 5.4.148 版本"
	echo
	TIME g "[2] 更新至 2021.09.26 编译的 R21.9.18 5.10.68 版本"
	echo
	TIME g "[3] 更新至 2021.09.26 编译的 R21.9.18 5.14.7 版本"
	echo
	TIME g "[0] 说啥也不好使了，继续做【钉子户】退出 本次更新"
	TIME g "---------------------------------------------------"
	read -p " 请输入您的选择 然后 敲回车确认： " CHOOSE
	case $CHOOSE in
	1)
	echo
	TIME y "[1] 更新至 2021.09.26 编译的 R21.9.18 5.4.148 版本"
        cd /mnt/mmcblk2p4
        rm -rf *.sh Armbian_*
        url=https://github.com/gd0772/AutoBuild-OpenWrt/releases/download/AutoUpdate
        Firmware=Armbian_Phicomm-N1_OP-R21.9.18_5.4.148.tar.gz
        img=Armbian_Phicomm-N1_OP-R21.9.18_5.4.148.img
	echo
	TIME g "=====================下载固件中(需科学上网,否则无法更新)======================"
        curl -LO $url/$Firmware
        TIME g "===============================下载完成,解压中==============================="
        tar -zxvf *tar.gz && rm -f *.tar.gz
        TIME r "============================解压完成,开始升级固件============================"
        chmod 755 update.sh
        bash update.sh $img
	break
	;;
	2)
	echo
	TIME y "[2] 更新至 2021.09.26 编译的 R21.9.18 5.10.68 版本"
        cd /mnt/mmcblk2p4
        rm -rf *.sh Armbian_*
        url=https://github.com/gd0772/AutoBuild-OpenWrt/releases/download/AutoUpdate
        Firmware=Armbian_Phicomm-N1_OP-R21.9.18_5.10.68.tar.gz
        img=Armbian_Phicomm-N1_OP-R21.9.18_5.10.68.img
	echo
	TIME g "=====================下载固件中(需科学上网,否则无法更新)======================"
        curl -LO $url/$Firmware
        TIME g "===============================下载完成,解压中==============================="
	if [ ! -f "/usr/bin/pv” ]; then
        pv *tar.gz | tar -zxf - && rm -f *.tar.gz
	else
	opkg update && opkg install pv && pv *tar.gz | tar -zxf - && rm -f *.tar.gz
        fi
        TIME r "============================解压完成,开始升级固件============================"
        chmod 755 update.sh
        bash update.sh $img
	break
	;;
	3)
	echo
	TIME y "[3] 更新至 2021.09.26 编译的 R21.9.18 5.14.7 版本"
        cd /mnt/mmcblk2p4
        rm -rf *.sh Armbian_*
        url=https://github.com/gd0772/AutoBuild-OpenWrt/releases/download/AutoUpdate
        Firmware=Armbian_Phicomm-N1_OP-R21.9.18_5.14.7.tar.gz
        img=Armbian_Phicomm-N1_OP-R21.9.18_5.14.7.img
	echo
	TIME g "=====================下载固件中(需科学上网,否则无法更新)======================"
        curl -LO $url/$Firmware
        TIME g "===============================下载完成,解压中==============================="
        #检查 pv命令 是否存在
	if [ ! -e “/usr/bin/pv” ]; then
        pv=1 #等于 1 时表示不存在
        else
        pv=0 #等于 0 时表示存在
        fi
        if [ "${pv}" -eq "1" ]; then #判断如果 pv命令 不存在，则安装 pe命令
        opkg update && opkg install pv && pv *tar.gz | tar -zxf - && rm -f *.tar.gz
        fi
	if [ "${pv}" -eq "0" ]; then #判断如果 pv命令 存在，则跳过安装 pe命令
	pv *tar.gz | tar -zxf - && rm -f *.tar.gz
	fi
        TIME r "============================解压完成,开始升级固件============================"
        chmod 755 update.sh
        bash update.sh $img
	break
	;;
	0)
	echo
	TIME r "您选择了 [0] 继续做 坚强的 钉子户 放弃本次更新 再见！"
	exit 0
	break
    	;;
    	*)
	echo
	TIME r "大哥：您输什么?什么 鸡巴？看清楚了！请输入正确的编号!"
	;;
	esac
	done
	
echo
