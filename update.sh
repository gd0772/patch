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
TIME g "--------------------------------------------------"
TIME g "[1] 更新至 2022.1.21 编译的 R22.1.1 5.4.172"
echo
TIME g "[2] 更新至 2022.1.21 编译的 R22.1.1 5.10.92"
echo
TIME g "[3] 更新至 2022.1.21 编译的 R22.1.1 5.15.15"
echo
TIME r "[4] 内核为 5.4.134 玩 Docker 选择此版"
echo
TIME g "[5] 一键无脑安装 Docker 及 DockerMan 到固件"
echo
TIME g "[0] 说啥也不好使了，继续做【钉子户】退出更新"
TIME g "-------------------------------------------------"
read -p " 请输入 序号 然后 敲回车确认： " CHOOSE
case $CHOOSE in
1)
echo
TIME g "[1] 更新至 2022.1.21 编译的 R22.1.1 5.4.172"
cd /mnt/mmcblk2p4
rm -rf *.sh Armbian_*
url=https://pan.gd772.com/d/update/N1/2022.01.21
Firmware=Armbian_Phicomm-N1_OP-R22.1.1_5.4.172.tar.gz
if [ -f "/etc/update.sh" ]; then
cp -r /etc/update.sh /mnt/mmcblk2p4     #升级脚本 存在   则复制到mmcblk2p4目录
else                                    #升级脚本 不存在 则下载到mmcblk2p4目录
cd /mnt/mmcblk2p4
curl -LO curl -LO https://pan.gd772.com/d/update/update.sh
fi
echo
TIME g "================================ 下载固件中 =================================="
curl -LO $url/$Firmware
TIME g "===============================下载完成,解压中==============================="
tar -zxvf *tar.gz && rm -f *.tar.gz
TIME r "============================解压完成,开始升级固件============================"
chmod 755 update.sh
bash update.sh *.img
break
;;
2)
echo
TIME g "[2] 更新至 2022.1.21 编译的 R22.1.1 5.10.92"
cd /mnt/mmcblk2p4
rm -rf *.sh Armbian_*
url=https://pan.gd772.com/d/update/N1/2022.01.21
Firmware=Armbian_Phicomm-N1_OP-R22.1.1_5.10.92.tar.gz
if [ -f "/etc/update.sh" ]; then
cp -r /etc/update.sh /mnt/mmcblk2p4     #升级脚本 存在   则复制到mmcblk2p4目录
else                                    #升级脚本 不存在 则下载到mmcblk2p4目录
cd /mnt/mmcblk2p4
curl -LO curl -LO https://pan.gd772.com/d/update/update.sh
fi
echo
TIME g "================================ 下载固件中 =================================="
curl -LO $url/$Firmware
TIME g "===============================下载完成,解压中==============================="
tar -zxvf *tar.gz && rm -f *.tar.gz
TIME r "============================解压完成,开始升级固件============================"
chmod 755 update.sh
bash update.sh *.img
break
;;
3)
echo
TIME g "[3] 更新至 2022.1.21 编译的 R22.1.1 5.15.15"
cd /mnt/mmcblk2p4
rm -rf *.sh Armbian_*
url=https://pan.gd772.com/d/update/N1/2022.01.21
Firmware=Armbian_Phicomm-N1_OP-R22.1.1_5.15.15.tar.gz
if [ -f "/etc/update.sh" ]; then
cp -r /etc/update.sh /mnt/mmcblk2p4     #升级脚本 存在   则复制到mmcblk2p4目录
else                                    #升级脚本 不存在 则下载到mmcblk2p4目录
cd /mnt/mmcblk2p4
curl -LO curl -LO https://pan.gd772.com/d/update/update.sh
fi
echo
TIME g "================================ 下载固件中 =================================="
curl -LO $url/$Firmware
TIME g "=================================下载完成,解压中============================="
tar -zxvf *tar.gz && rm -f *.tar.gz
TIME r "=============================解压完成,开始升级固件============================"
chmod 755 update.sh
bash update.sh *.img
break
;;
4)
echo
TIME y "[4] 内核为 5.4.134 玩 Docker 选择此版"
cd /mnt/mmcblk2p4
rm -rf *.sh Armbian_*
url=https://pan.gd772.com/d/update/N1
Firmware=Armbian_Phicomm-N1_OP-R22.1.1_5.4.134.tar.gz
if [ -f "/etc/update.sh" ]; then
cp -r /etc/update.sh /mnt/mmcblk2p4     #升级脚本 存在   则复制到mmcblk2p4目录
else                                    #升级脚本 不存在 则下载到mmcblk2p4目录
cd /mnt/mmcblk2p4
curl -LO curl -LO https://pan.gd772.com/d/update/update.sh
fi
echo
TIME g "================================ 下载固件中 =================================="
curl -LO $url/$Firmware
TIME g "=================================下载完成,解压中============================="
tar -zxvf *tar.gz && rm -f *.tar.gz
TIME r "=============================解压完成,开始升级固件============================"
chmod 755 update.sh
bash update.sh *.img
break
;;
5)
echo
TIME g "[5] 一键无脑安装 Docker 及 DockerMan 到固件"
cd /mnt/mmcblk2p4
url=https://pan.gd772.com/d/update
files=docker_20.10.12-2_N1.tar.gz
echo
TIME g "============================== 下载 Docker ================================="
curl -LO $url/$files
TIME g "=================================下载完成,解压中============================="
tar -zxvf *tar.gz && rm -f *.tar.gz
TIME g "============================= 解压完成,开始安装 ============================="
chmod 755 *.ipk
opkg install *.ipk && /etc/init.d/dockerd start 
rm -r *.ipk && rm -r /etc/config/dockerd-opkg
TIME g "============================= Docker安装完成 ==============================="
break
;;
0)
echo
TIME g "您选择了 [0] 继续做 坚强的 钉子户 放弃本次更新 再见！"
exit 0
break
;;
*)
echo
TIME r "大哥：您输什么 鸡巴？看清楚了！请输入正确的序号!"
;;
esac
done
