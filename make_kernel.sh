#/bin/bash
# gd772's Armbian kernel Compile script

TIME() {
[[ -z "$1" ]] && {
	echo -ne " "
} || {
     case $1 in
	r) export Color="\e[31;1m";;
	g) export Color="\e[32;1m";;
	b) export Color="\e[34;1m";;
	y) export Color="\e[33;1m";;
	z) export Color="\e[35;1m";;
	l) export Color="\e[36;1m";;
      esac
	[[ $# -lt 2 ]] && echo -e "\e[36m\e[0m ${1}" || {
		echo -e "\e[36m\e[0m ${Color}${2}\e[0m"
	 }
      }
}

 echo
 TIME r "---------------------------- 关于脚本的说明 -----------------------------"
 TIME b "本脚本仅方便有基础、又想折腾、的网友交叉编译 Armbian 内核，内核编译完成后"
 echo
 TIME b "并不能直接使用，还需要到您的 Arm设备上 进行 安装提取 打包好的内核才能使用"
 TIME r "------------------ 内核源码配置来至 Flippy 发布的 github ----------------"
 while :; do
 echo
 TIME g "--------- Armbian内核编译 ----------"
 echo
 TIME g "[1] 编译 5.4.xxx 版本的 Armbian 内核"
 echo
 TIME g "[2] 更新 5.4.xxx 版本的 Armbian 内核"
 echo
 TIME g "[3] 编译 5.10.xx 版本的 Armbian 内核"
 echo
 TIME g "[4] 更新 5.10.xx 版本的 Armbian 内核"
 echo
 TIME g "[0] 按错了 退出 本次编译 "
 echo
 TIME g "------- 萌新专用，大神请忽略 -------"
 echo
 read -p " 请输入 序号 然后 敲回车 确认选择： " CHOOSE
 case $CHOOSE in
 1)
 echo
 TIME g "你选择了 [1] 编译 5.4.xxx 版本的 Armbian 内核"
 TIME g "-----------------------------------------------"
 echo
 if [ ! -d "/opt/gcc-linaro-11.2.1-2021.12-x86_64_aarch64-linux-gnu" ]; then
 echo
 TIME g "部署编译环境"
 sudo apt update && sudo apt upgrade -y
 sudo apt-get -qq install $(curl -fsSL git.io/ubuntu-2004-server)
 echo
 TIME g "下载 $gcc"
 gcc=gcc-linaro-11.2.1-2021.12-x86_64_aarch64-linux-gnu
 curl -LO https://snapshots.linaro.org/gnu-toolchain/11.2-2021.12-1/aarch64-linux-gnu/${gcc}.tar.xz
 tar -xvf ${gcc}.tar.xz
 sudo cp -r ${gcc} /opt && rm -r ${gcc} ${gcc}.tar.xz
 fi
 echo
 if [ ! -d "linux-5.4.y" ]; then
 sudo apt update && sudo apt upgrade -y
 sudo apt-get -qq install $(curl -fsSL git.io/ubuntu-2004-server)
 echo
 TIME g "下载 $kernel 内核源码"
 kernel=linux-5.4.y
 git clone https://ghproxy.com/https://github.com/unifreq/${kernel}
 cd ${kernel} && curl -LO https://raw.githubusercontent.com/gd0772/patch/main/make.tar.gz && tar zxvf make.tar.gz
 rm -r set_* make.tar.gz linux-5.10.y.config && mv ${kernel}.config .config
 fi
 echo
 TIME g "是否对内核进行 配置？"
 echo
 read -p " 输入 y 回车配置内核，直接回车 跳过配置 使用默认配置 编译 ： " MENU
 case $MENU in
 y)
 Menuconfig="YES"
 echo
 TIME y "您选择了 配置内核,请耐心等待程序运行至窗口弹出进行配置!"
 ;; 
 *)
 echo
 TIME y "您选择了 跳过 内核菜单配置，将使用 默认的配置 进行编译！"
 echo
 cd linux-5.4.y && bash make && cd ..
 tar zcvf linux-5.4.y.tar.gz linux-5.4.y
 ;;
 esac     
 [ "${Menuconfig}" == "YES" ] && { 
 cd linux-5.4.y && bash menuconfig && bash make && tar zcvf ${kernel}.tar.gz ${kernel}
 } 
 echo
 TIME y "内核编译并打包完成，将打包好的 linux-5.4.y.tar.gz 文件 上传到你的 Arm设备 进行解压安装 提取内核操作！"
 echo
 break
 ;;
 2)
 echo
 TIME g "你选择了 [2] 更新 5.4.xxx 版本的 Armbian 内核"
 TIME g "-----------------------------------------------"
 echo
 kernel=linux-5.4.y
 TIME g "更新编译 $kernel 内核源码"
 cd $kernel
 git pull
 bash make && cd ..
 tar zcvf linux-5.4.y.tar.gz linux-5.4.y
 echo
 TIME y "内核更新编译完成，请将打包好的 linux-5.4.y.tar.gz 文件 上传到你的 Arm设备 进行解压安装 提取内核操作！"
 break
 ;;
 3)
 echo
 TIME g "你选择了 [3] 编译 5.10.xxx 版本的 Armbian 内核"
 TIME g "-----------------------------------------------"
 echo
 if [ ! -d "/opt/gcc-linaro-11.2.1-2021.12-x86_64_aarch64-linux-gnu" ]; then
 echo
 TIME g "部署编译环境"
 sudo apt update && sudo apt upgrade -y
 sudo apt-get -qq install $(curl -fsSL git.io/ubuntu-2004-server)
 echo
 TIME g "下载 $gcc"
 gcc=gcc-linaro-11.2.1-2021.12-x86_64_aarch64-linux-gnu
 curl -LO https://snapshots.linaro.org/gnu-toolchain/11.2-2021.12-1/aarch64-linux-gnu/${gcc}.tar.xz
 tar -xvf ${gcc}.tar.xz
 sudo cp -r ${gcc} /opt && rm -r ${gcc} ${gcc}.tar.xz
 fi
 if [ ! -d "linux-5.10.y" ]; then
 echo
 TIME g "下载 $kernel 内核源码"
 kernel=linux-5.10.y
 git clone https://ghproxy.com/https://github.com/unifreq/${kernel}
 cd ${kernel} && curl -LO https://raw.githubusercontent.com/gd0772/patch/main/make.tar.gz && tar zxvf make.tar.gz
 mv ${kernel}.config .config && rm -r make.tar.gz linux-5.4.y.config
 fi
 echo
 TIME g "是否对内核进行 配置？"
 echo
 read -p " 输入 y 回车配置内核，直接回车 跳过配置 使用默认配置 编译 ： " MENU
 case $MENU in
 y)
 Menuconfig="YES"
 echo
 TIME y "您选择了 配置内核,请耐心等待程序运行至窗口弹出进行配置!"
 ;; 
 *)
 echo
 TIME y "您选择了 跳过 内核菜单配置，将使用 默认的配置 进行编译！"
 echo 
 cd linux-5.10.y && bash make && cd .. 
 tar zcvf linux-5.10.y.tar.gz linux-5.10.y
 echo
 TIME y "内核编译并打包完成，将打包好的 linux-5.10.y.tar.gz 文件 上传到你的 Arm设备 进行解压安装 提取内核操作！"
 ;;
 esac     
 [ "${Menuconfig}" == "YES" ] && { 
 cd ${kernel} 
 bash menuconfig && bash make && tar zcvf ${kernel}.tar.gz ${kernel}
 } 
 echo
 break
 ;;
 4)
 echo
 TIME g "你选择了 [4] 更新 5.10.xxx 版本的 Armbian 内核"
 TIME g "-----------------------------------------------"
 echo
 kernel=linux-5.10.y
 TIME g "更新编译 $kernel 内核源码"
 cd $kernel
 git pull
 bash make && cd ..
 tar zcvf linux-5.10.y.tar.gz linux-5.10.y
 echo
 TIME y "内核更新编译完成，请将打包好的 linux-5.10.y.tar.gz 文件 上传到你的 Arm设备 进行解压安装 提取内核操作！"
 break
 ;;
 0)
 echo
 TIME g "您选择了 [0] 退出 本次编译  再见！"
 exit 0
 break
 ;;
 *)
 echo
 TIME r "请输入正确的序号!"
 ;;
 esac
 done
 
echo 
