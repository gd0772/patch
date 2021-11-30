#!/bin/bash
# https://github.com/gd0772/AutoBuild-OpenWrt
# common Module by gd772

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
TIME r "删除无用主题"
rm -rf ./feeds/freifunk/themes
rm -rf ./package/lean/luci-theme-argon
rm -rf ./feeds/luci/themes/luci-theme-material
TIME r "删除重复插件"
rm -rf ./feeds/packages/net/smartdns
rm -rf ./feeds/packages/admin/netdata
rm -rf ./package/lean/luci-app-netdata
rm -rf ./package/lean/luci-app-jd-dailybonus
rm -rf ./feeds/luci/applications/luci-app-rp-pppoe-server
rm -rf ./package/lean/luci-app-usb-printer
rm -rf ./package/lean/lisaac/luci-app-dockerman
echo
TIME b "修改 默认IP为 192.168.123.2"
sed -i "s/192.168.1.1/192.168.123.2/g" package/base-files/files/bin/config_generate
TIME b "修改 主机名为 N1"
sed -i "s/'OpenWrt'/'N1'/g" package/base-files/files/bin/config_generate
TIME b "修改 系统文件..."
curl -fsSL https://raw.githubusercontent.com/gd0772/patch/main/zzz-default-settings > ./package/lean/default-settings/files/zzz-default-settings
curl -fsSL https://raw.githubusercontent.com/gd0772/patch/main/n1_index.htm > ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm
curl -fsSL https://raw.githubusercontent.com/gd0772/patch/main/udpxy.lua > ./feeds/luci/applications/luci-app-udpxy/luasrc/controller/udpxy.lua
TIME b "系统文件 修改完成"
echo
TIME y "添加 gd772 Package"
rm -rf package/gd772 && git clone https://github.com/gd0772/package package/gd772
echo
TIME y "添加 SSR Plus+"
git clone https://github.com/fw876/helloworld package/gd772/ssrplus
echo
TIME y "添加 小猫咪"
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/gd772/luci-app-openclash
echo
TIME y "添加 Pass wall"
git clone https://github.com/xiaorouji/openwrt-passwall package/gd772/passwall
echo
TIME y "添加 Hello World"
git clone https://github.com/jerrykuku/luci-app-vssr package/gd772/luci-app-vssr
echo
TIME y "添加 京东签到"
git clone https://github.com/jerrykuku/luci-app-jd-dailybonus package/gd772/luci-app-jd-dailybonus
echo
TIME y "添加 SmartDNS"
git clone https://github.com/pymumu/luci-app-smartdns.git -b lede ./package/gd772/luci-app-smartdns
git clone https://github.com/pymumu/openwrt-smartdns.git ./feeds/packages/net/smartdns
echo
TIME y "添加 KPR去广告"
git clone https://github.com/project-lede/luci-app-godproxy package/gd772/luci-app-godproxy
echo
TIME y "添加 微信推送"
git clone https://github.com/tty228/luci-app-serverchan.git ./package/gd772/luci-app-serverchan
echo
TIME y "汉化 实时监控"
rm -rf ./package/lean/luci-app-netdata && svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-netdata ./package/lean/luci-app-netdata
rm -rf ./feeds/packages/admin/netdata && svn co https://github.com/sirpdboy/sirpdboy-package/trunk/netdata ./feeds/packages/admin/netdata
echo
TIME y "添加 Dockerman"
rm -rf package/gd772/luci-app-dockerman && svn co https://github.com/lisaac/luci-app-dockerman/trunk/applications/luci-app-dockerman package/gd772/luci-app-dockerman
echo             
TIME b "插件 重命名..."
sed -i 's/"管理权"/"改密码"/g' feeds/luci/modules/luci-base/po/zh-cn/base.po

sed -i 's/msgstr "Web 管理"/msgstr "Web"/g' package/lean/luci-app-webadmin/po/zh-cn/webadmin.po

sed -i 's/TTYD 终端/命令行/g' package/lean/luci-app-ttyd/po/zh-cn/terminal.po

sed -i 's/ShadowSocksR Plus+/SSR Plus+/g' package/gd772/ssrplus/luci-app-ssr-plus/luasrc/controller/shadowsocksr.lua

sed -i 's/PassWall/Pass Wall/g' package/gd772/passwall/luci-app-passwall/po/zh-cn/passwall.po

sed -i 's/广告屏蔽大师 Plus+/广告屏蔽/g' package/lean/luci-app-adbyby-plus/po/zh-cn/adbyby.po

sed -i 's/("Dnsforwarder")/("广告过滤")/g' package/lean/luci-app-dnsforwarder/luasrc/controller/dnsforwarder.lua

sed -i 's/"GodProxy滤广告"/"KPR去广告"/g' package/gd772/luci-app-godproxy/po/zh-cn/koolproxy.po

sed -i 's/GodProxy滤广告/KoolProxyR去广告/g' package/gd772/luci-app-godproxy/luasrc/model/cbi/koolproxy/global.lua

sed -i 's/GodProxy 访问控制/KoolProxyR 访问控制/g' package/gd772/luci-app-godproxy/luasrc/model/cbi/koolproxy/global.lua

sed -i 's/GodProxy 帮助支持/KoolProxyR帮助支持/g' package/gd772/luci-app-godproxy/luasrc/model/cbi/koolproxy/global.lua

sed -i 's/GodProxy是/是/g' package/gd772/luci-app-godproxy/luasrc/model/cbi/koolproxy/global.lua

sed -i 's/GodProxy/KoolProxyR/g' package/gd772/luci-app-godproxy/luasrc/model/cbi/koolproxy/global.lua

sed -i 's/GodProxy滤广告/KPR去广告/g' package/gd772/luci-app-godproxy/luasrc/model/cbi/koolproxy/rss_rule.lua

sed -i 's/Shaoxia的KoolProxyR详细使用说明/关于 KoolProxyR 的详细使用说明/g' package/gd772/luci-app-godproxy/luasrc/view/koolproxy/feedback.htm

sed -i 's/GodProxy/KoolProxyR/g' package/gd772/luci-app-godproxy/luasrc/view/koolproxy/koolproxy_status.htm

sed -i 's/KoolProxyR滤广告/KoolProxyR去广告/g' package/gd772/luci-app-godproxy/luasrc/view/koolproxy/koolproxy_status.htm

sed -i 's/京东签到服务/京东签到/g' package/gd772/luci-app-jd-dailybonus/luasrc/controller/jd-dailybonus.lua

sed -i 's/msgstr "KMS 服务器"/msgstr "KMS 激活"/g' package/lean/luci-app-vlmcsd/po/zh-cn/vlmcsd.po

sed -i 's/msgstr "UPnP"/msgstr "UPnP设置"/g' feeds/luci/applications/luci-app-upnp/po/zh-cn/upnp.po

sed -i 's/Frp 内网穿透/Frp 客户端/g' package/lean/luci-app-frpc/po/zh-cn/frp.po

sed -i 's/Frps/Frp 服务端/g' package/lean/luci-app-frps/luasrc/controller/frps.lua

sed -i 's/Nps 内网穿透/Nps 客户端/g' package/lean/luci-app-nps/po/zh-cn/nps.po

sed -i 's/解锁网易云灰色歌曲/音乐解锁/g' package/lean/luci-app-unblockmusic/po/zh-cn/unblockmusic.po

sed -i 's/Docker CE 容器/Docker容器/g' package/lean/luci-app-docker/po/zh-cn/docker.po

sed -i 's/UU游戏加速器/UU加速器/g' package/lean/luci-app-uugamebooster/po/zh-cn/uuplugin.po

sed -i 's/网络存储/存储/g' package/lean/luci-app-vsftpd/po/zh-cn/vsftpd.po

sed -i 's/挂载 SMB 网络共享/挂载共享/g' package/lean/luci-app-cifs-mount/po/zh-cn/cifs.po

sed -i 's/"文件浏览器"/"文件管理"/g' package/gd772/luci-app-filebrowser/po/zh-cn/filebrowser.po

sed -i 's/"阿里云盘 WebDAV"/"阿里云盘"/g' package/lean/luci-app-aliyundrive-webdav/po/zh-cn/aliyundrive-webdav.po

sed -i 's/msgstr "FTP 服务器"/msgstr "FTP 服务"/g' package/lean/luci-app-vsftpd/po/zh-cn/vsftpd.po

sed -i 's/Rclone/网盘挂载/g' package/lean/luci-app-rclone/luasrc/controller/rclone.lua

sed -i 's/msgstr "Aria2"/msgstr "Aria2下载"/g' feeds/luci/applications/luci-app-aria2/po/zh-cn/aria2.po

sed -i 's/_("qBittorrent")/_("BT下载")/g' package/lean/luci-app-qbittorrent/luasrc/controller/qbittorrent.lua

sed -i 's/BaiduPCS Web/百毒网盘/g' package/lean/luci-app-baidupcs-web/luasrc/controller/baidupcs-web.lua

sed -i 's/IPSec VPN 服务器/IPSec 服务/g' package/lean/luci-app-ipsec-vpnd/po/zh-cn/ipsec.po

sed -i 's/"PPTP VPN 服务器"/"PPTP 服务"/g' package/lean/luci-app-pptp-server/po/zh-cn/pptp.po

sed -i 's/V2ray 服务器/V2ray 服务/g' package/lean/luci-app-v2ray-server/po/zh-cn/v2ray_server.po

sed -i 's/SoftEther VPN 服务器/SoftEther/g' package/lean/luci-app-softethervpn/po/zh-cn/softethervpn.po

sed -i 's/"OpenVPN 服务器"/"OpenVPN"/g' package/lean/luci-app-openvpn-server/po/zh-cn/openvpn-server.po

sed -i 's/firstchild(), "VPN"/firstchild(), "GFW"/g' package/lean/luci-app-zerotier/luasrc/controller/zerotier.lua

sed -i 's/firstchild(), "VPN"/firstchild(), "GFW"/g' package/lean/luci-app-ipsec-vpnd/luasrc/controller/ipsec-server.lua

sed -i 's/firstchild(), "VPN"/firstchild(), "GFW"/g' package/lean/luci-app-softethervpn/luasrc/controller/softethervpn.lua

sed -i 's/firstchild(), "VPN"/firstchild(), "GFW"/g' package/lean/luci-app-openvpn-server/luasrc/controller/openvpn-server.lua

sed -i 's/WireGuard 状态/WiGd状态/g' feeds/luci/applications/luci-app-wireguard/po/zh-cn/wireguard.po

sed -i 's/Turbo ACC 网络加速/网络加速/g' package/lean/luci-app-turboacc/po/zh-cn/turboacc.po

sed -i 's/MWAN3 分流助手/分流助手/g' package/lean/luci-app-mwan3helper/po/zh-cn/mwan3helper.po

sed -i 's/带宽监控/统计/g' feeds/luci/applications/luci-app-nlbwmon/po/zh-cn/nlbwmon.po

sed -i 's/实时流量监测/流量监测/g' package/lean/luci-app-wrtbwmon/po/zh-cn/wrtbwmon.po

TIME b "重命名 完成"

sed -i 's/invalid/## invalid/g' feeds/packages/net/samba4/files/smb.conf.template

echo
TIME b "菜单调整 整理..."
TIME b "调整 网络共享 到 存储菜单"
sed -i 's/\"services\"/\"nas\"/g' package/lean/luci-app-samba4/luasrc/controller/samba4.lua
TIME b "调整 分流助手 到 网络菜单"
sed -i 's/\"services\"/\"network\"/g' package/lean/luci-app-mwan3helper/luasrc/controller/mwan3helper.lua
curl -fsSL https://raw.githubusercontent.com/gd0772/patch/main/mwan3helper_status.htm > ./package/lean/luci-app-mwan3helper/luasrc/view/mwan3helper/mwan3helper_status.htm
TIME b "调整 Dockerman 到 服务 菜单"
sed -i 's/"admin",/"admin","services",/g' package/gd772/luci-app-dockerman/luasrc/controller/*.lua
sed -i 's/"admin/"admin\/services/g' package/gd772/luci-app-dockerman/luasrc/model/*.lua
sed -i 's/"admin/"admin\/services/g' package/gd772/luci-app-dockerman/luasrc/model/cbi/dockerman/*.lua
sed -i 's/"admin/"admin\/services/g' package/gd772/luci-app-dockerman/luasrc/view/dockerman/*.htm
sed -i 's/"admin/"admin\/services/g' package/gd772/luci-app-dockerman/luasrc/view/dockerman/cbi/*.htm
TIME b "调整 SSRP 到 GFW 菜单"
sed -i 's/services/vpn/g' package/gd772/ssrplus/luci-app-ssr-plus/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/gd772/ssrplus/luci-app-ssr-plus/luasrc/model/cbi/shadowsocksr/*.lua
sed -i 's/services/vpn/g' package/gd772/ssrplus/luci-app-ssr-plus/luasrc/view/shadowsocksr/*.htm
TIME b "调整 Pass Wall 到 GFW 菜单"
sed -i 's/services/vpn/g' package/gd772/passwall/luci-app-passwall/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/gd772/passwall/luci-app-passwall/luasrc/model/cbi/passwall/api/*.lua
sed -i 's/services/vpn/g' package/gd772/passwall/luci-app-passwall/luasrc/model/cbi/passwall/client/*.lua
sed -i 's/services/vpn/g' package/gd772/passwall/luci-app-passwall/luasrc/model/cbi/passwall/server/*.lua
sed -i 's/services/vpn/g' package/gd772/passwall/luci-app-passwall/luasrc/view/passwall/app_update/*.htm
sed -i 's/services/vpn/g' package/gd772/passwall/luci-app-passwall/luasrc/view/passwall/global/*.htm
sed -i 's/services/vpn/g' package/gd772/passwall/luci-app-passwall/luasrc/view/passwall/haproxy/*.htm
sed -i 's/services/vpn/g' package/gd772/passwall/luci-app-passwall/luasrc/view/passwall/log/*.htm
sed -i 's/services/vpn/g' package/gd772/passwall/luci-app-passwall/luasrc/view/passwall/node_list/*.htm
sed -i 's/services/vpn/g' package/gd772/passwall/luci-app-passwall/luasrc/view/passwall/rule/*.htm
sed -i 's/services/vpn/g' package/gd772/passwall/luci-app-passwall/luasrc/view/passwall/server/*.htm
TIME b "调整 Hello World 到 GFW 菜单"
sed -i 's/services/vpn/g' package/gd772/luci-app-vssr/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/gd772/luci-app-vssr/luasrc/model/cbi/vssr/*.lua
sed -i 's/services/vpn/g' package/gd772/luci-app-vssr/luasrc/view/vssr/*.htm
TIME b "调整 Open Clash 到 GFW 菜单"
sed -i 's/services/vpn/g' package/gd772/luci-app-openclash/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/gd772/luci-app-openclash/luasrc/*.lua
sed -i 's/services/vpn/g' package/gd772/luci-app-openclash/luasrc/model/cbi/openclash/*.lua
sed -i 's/services/vpn/g' package/gd772/luci-app-openclash/luasrc/view/openclash/*.htm
TIME b "调整 V2ray服务 到 GFW 菜单"
sed -i 's/services/vpn/g' package/lean/luci-app-v2ray-server/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/lean/luci-app-v2ray-server/luasrc/model/cbi/v2ray_server/*.lua
sed -i 's/services/vpn/g' package/lean/luci-app-v2ray-server/luasrc/view/v2ray_server/*.htm
TIME b "调整 阿里云盘 到 存储 菜单"
sed -i 's/services/nas/g' package/lean/luci-app-aliyundrive-webdav/luasrc/controller/*.lua
sed -i 's/services/nas/g' package/lean/luci-app-aliyundrive-webdav/luasrc/model/cbi/aliyundrive-webdav/*.lua
sed -i 's/services/nas/g' package/lean/luci-app-aliyundrive-webdav/luasrc/view/aliyundrive-webdav/*.htm

TIME l "菜单调理 完成"
echo
TIME y "更新固件 编译日期"
sed -i "s/2021.10.01/$(TZ=UTC-8 date "+%Y.%m.%d")/g" feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm

echo
TIME g "自定义文件修复权限"
chmod -R 755 package/gd772
echo
TIME g "更新配置..."
./scripts/feeds update -i
TIME g "配置更新完成"
