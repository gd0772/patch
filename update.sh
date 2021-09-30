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
	TIME y "[1] 回滚至 2021.09.26 编译的 R21.9.18 5.4.148 版本"
	echo
	TIME y "[2] 回滚至 2021.09.26 编译的 R21.9.18 5.10.68 版本"
	echo
	TIME y "[3] 回滚至 2021.09.26 编译的 R21.9.18 5.14.7 版本"
	echo
	TIME g "[4] 更新至 2021.10.01 编译的 R21.10.1 5.4.150 版本"
	echo
	TIME g "[5] 更新至 2021.10.01 编译的 R21.10.1 5.10.70 版本"
	echo
	TIME g "[6] 更新至 2021.10.01 编译的 R21.10.1 5.14.9 版本"
	echo
	TIME g "[0] 说啥也不好使了，继续做【钉子户】退出 本次更新"
	TIME g "---------------------------------------------------"
	read -p " 请输入您的选择 然后 敲回车确认： " CHOOSE
	case $CHOOSE in
	1)
	TIME y "[1] 回滚至 2021.09.26 编译的 R21.9.18 5.4.148 版本"
        cd /mnt/mmcblk2p4
        rm -rf *.sh Armbian_*
        url=https://github.com/gd0772/AutoBuild-OpenWrt/releases/download/AutoUpdate
        Firmware=Armbian_Phicomm-N1_OP-R21.9.18_5.4.148.tar.gz
        img=Armbian_Phicomm-N1_OP-R21.9.18_5.4.148.img
	echo
	TIME g "=======================下载固件中(需科学上网,否则无法更新)======================"
        curl -LO $url/$Firmware
        TIME g "===============================下载完成,解压中==============================="
	#判断 pv 命令是否存在
	#if [ -f "/usr/bin/pv" ]; then
        #pv *tar.gz | tar -zxvf - && rm -f *.tar.gz #命令存在则跳过命令的安装，直接执行解压操作！
	#else
	#opkg update && opkg install pv && pv *tar.gz | tar -zxvf - && rm -f *.tar.gz  #命令不存在则安装命令，安装完成后再执行解压操作！
        #fi
	tar -zxvf *tar.gz && rm -f *.tar.gz
        TIME r "============================解压完成,开始升级固件============================"
        chmod 755 update.sh
        bash update.sh $img
	break
	;;
	2)
	echo
	TIME y "[2] 回滚至 2021.09.26 编译的 R21.9.18 5.10.68 版本"
        cd /mnt/mmcblk2p4
        rm -rf *.sh Armbian_*
        url=https://github.com/gd0772/AutoBuild-OpenWrt/releases/download/AutoUpdate
        Firmware=Armbian_Phicomm-N1_OP-R21.9.18_5.10.68.tar.gz
        img=Armbian_Phicomm-N1_OP-R21.9.18_5.10.68.img
	echo
	TIME g "=======================下载固件中(需科学上网,否则无法更新)======================"
        curl -LO $url/$Firmware
        TIME g "===============================下载完成,解压中==============================="
	#判断 pv 命令是否存在
	#if [ -f "/usr/bin/pv" ]; then
        #pv *tar.gz | tar -zxvf - && rm -f *.tar.gz #命令存在则跳过命令的安装，直接执行解压操作！
	#else
	#opkg update && opkg install pv && pv *tar.gz | tar -zxvf - && rm -f *.tar.gz  #命令不存在则安装命令，安装完成后再执行解压操作！
        #fi
	tar -zxvf *tar.gz && rm -f *.tar.gz
        TIME r "============================解压完成,开始升级固件============================"
        chmod 755 update.sh
        bash update.sh $img
	break
	;;
	3)
	echo
	TIME y "[3] 回滚至 2021.09.26 编译的 R21.9.18 5.14.7 版本"
        cd /mnt/mmcblk2p4
        rm -rf *.sh Armbian_*
        url=https://github.com/gd0772/AutoBuild-OpenWrt/releases/download/AutoUpdate
        Firmware=Armbian_Phicomm-N1_OP-R21.9.18_5.14.7.tar.gz
        img=Armbian_Phicomm-N1_OP-R21.9.18_5.14.7.img
	echo
	TIME g "======================下载固件中(需科学上网,否则无法更新)====================="
        curl -LO $url/$Firmware
        TIME g "=================================下载完成,解压中============================="
	tar -zxvf *tar.gz && rm -f *.tar.gz
        TIME r "=============================解压完成,开始升级固件============================"
        chmod 755 update.sh
        bash update.sh $img
	break
	;;
	4)
	echo
	TIME y "[4] 更新至 2021.10.01 编译的 R21.10.1 5.4.150 版本"
        cd /mnt/mmcblk2p4
        rm -rf *.sh Armbian_*
        url=https://github.com/gd0772/AutoBuild-OpenWrt/releases/download/AutoUpdate
        Firmware=Armbian_Phicomm-N1_OP-R21.10.1_5.4.150.tar.gz
        img=Armbian_Phicomm-N1_OP-R21.10.1_5.4.150.img
	echo
	TIME g "======================下载固件中(需科学上网,否则无法更新)====================="
        curl -LO $url/$Firmware
        TIME g "=================================下载完成,解压中============================="
	tar -zxvf *tar.gz && rm -f *.tar.gz
        TIME r "=============================解压完成,开始升级固件============================"
        chmod 755 update.sh
        bash update.sh $img
	break
	;;
	5)
	echo
	TIME y "[5] 更新至 2021.10.01 编译的 R21.10.1 5.10.70 版本"
        cd /mnt/mmcblk2p4
        rm -rf *.sh Armbian_*
        url=https://github.com/gd0772/AutoBuild-OpenWrt/releases/download/AutoUpdate
        Firmware=Armbian_Phicomm-N1_OP-R21.10.1_5.10.70.tar.gz
        img=Armbian_Phicomm-N1_OP-R21.10.1_5.10.70.img
	echo
	TIME g "======================下载固件中(需科学上网,否则无法更新)====================="
        curl -LO $url/$Firmware
        TIME g "=================================下载完成,解压中============================="
	tar -zxvf *tar.gz && rm -f *.tar.gz
        TIME r "=============================解压完成,开始升级固件============================"
        chmod 755 update.sh
        bash update.sh $img
	break
	;;
	6)
	echo
	TIME y "[6] 更新至 2021.10.01 编译的 R21.10.1 5.14.9 版本"
        cd /mnt/mmcblk2p4
        rm -rf *.sh Armbian_*
        url=https://github.com/gd0772/AutoBuild-OpenWrt/releases/download/AutoUpdate
        Firmware=Armbian_Phicomm-N1_OP-R21.10.1_5.14.9.tar.gz
        img=Armbian_Phicomm-N1_OP-R21.10.1_5.14.9.img
	echo
	TIME g "======================下载固件中(需科学上网,否则无法更新)====================="
        curl -LO $url/$Firmware
        TIME g "=================================下载完成,解压中============================="
	tar -zxvf *tar.gz && rm -f *.tar.gz
        TIME r "=============================解压完成,开始升级固件============================"
        chmod 755 update.sh
        bash update.sh $img
	break
	;;
	0)
	echo
	TIME y "您选择了 [0] 继续做 坚强的 钉子户 放弃本次更新 再见！"
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
