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
echo
TIME g "------- gd772 N1固件 在线更新 菜单 --------"
echo
TIME g "[1] 更新至 2022.2.9 编译的 R22.1.1 5.4.177"
echo
TIME g "[2] 更新至 2022.2.9 编译的 R22.1.1 5.10.97"
echo
TIME g "[3] 更新至 2022.2.9 编译的 R22.1.1 5.15.20"
echo
TIME r "[0] 说啥也不好使了，继续做【钉子户】退出更新"
echo
read -p " 请输入 序号 然后 敲回车确认： " CHOOSE
case $CHOOSE in
1)
echo
TIME g "[1] 更新至 2022.2.9 编译的 R22.1.1 5.4.177"
cd /mnt/mmcblk2p4
rm -rf *.sh Armbian_*
url=https://pan.gd772.com/d/update/2022.02.09
Firmware=Armbian_Phicomm-N1_OP-R22.1.1_5.4.177.tar.gz
if [ -f "/etc/update.sh" ]; then
cp -r /etc/update.sh /mnt/mmcblk2p4     #升级脚本 存在   则复制到mmcblk2p4目录
else                                    #升级脚本 不存在 则下载到mmcblk2p4目录
cd /mnt/mmcblk2p4
curl -LO https://pan.gd772.com/d/update/update.sh
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
TIME g "[2] 更新至 2022.2.9 编译的 R22.1.1 5.10.97"
cd /mnt/mmcblk2p4
rm -rf *.sh Armbian_*
url=https://pan.gd772.com/d/update/2022.02.09
Firmware=Armbian_Phicomm-N1_OP-R22.1.1_5.10.97.tar.gz
if [ -f "/etc/update.sh" ]; then
cp -r /etc/update.sh /mnt/mmcblk2p4     #升级脚本 存在   则复制到mmcblk2p4目录
else                                    #升级脚本 不存在 则下载到mmcblk2p4目录
cd /mnt/mmcblk2p4
curl -LO https://pan.gd772.com/d/update/update.sh
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
TIME g "[3] 更新至 2022.2.9 编译的 R22.1.1 5.15.20"
cd /mnt/mmcblk2p4
rm -rf *.sh Armbian_*
url=https://pan.gd772.com/d/update/2022.02.09
Firmware=Armbian_Phicomm-N1_OP-R22.1.1_5.15.20.tar.gz
if [ -f "/etc/update.sh" ]; then
cp -r /etc/update.sh /mnt/mmcblk2p4     #升级脚本 存在   则复制到mmcblk2p4目录
else                                    #升级脚本 不存在 则下载到mmcblk2p4目录
cd /mnt/mmcblk2p4
curl -LO https://pan.gd772.com/d/update/update.sh
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
0)
echo
TIME r "您选择了 [0] 继续做【钉子户】退出本次更新"
echo
exit 0
break
;;
*)
echo
TIME r "请输入正确的序号!"
;;
esac
done
