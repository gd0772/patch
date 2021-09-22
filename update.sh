	#/bin/bash

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

	while :; do
	TIME g "[1] 在线更新 至 2021.09.21编译的 5.4.145 版本"
	TIME g "[2] 在线更新 至 2021.09.21编译的 5.14.6 版本"
	TIME g "[3] 退出 本次在线更新 程序"
	read -p " 输入您的选择： " CHOOSE
	case $CHOOSE in
		1)
     bash <(curl -s -S -L https://git.io/phicomm_n1_5.4.y.sh)
			TIME y "[1] 在线更新 至 2021.09.21编译的 5.4.145 版本"
		break
		;;
		2)
     bash <(curl -s -S -L https://git.io/phicomm_n1_5.4.y.sh)
			TIME y "[2] 在线更新 至 2021.09.21编译的 5.14.6 版本"
		break
		;;
		3)
			exit 0
			TIME r "您选择了退出编译程序"
			exit 0
		break
    		;;
    		*)
			TIME r "警告：输入错误,请输入正确的编号!"
		;;
	esac
	done
}
echo
