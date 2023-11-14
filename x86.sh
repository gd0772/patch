#!/bin/bash
# https://github.com/gd0772/AutoBuild-OpenWrt
# common Module by gd772

function TIME() {
Compte=$(date +%Y年%m月%d号%H时%M分)
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
# 修改IP
echo
TIME b "修改 默认IP为 192.168.123.254"
sed -i "s/192.168.1.1/192.168.123.254/g" package/base-files/files/bin/config_generate
echo
# ttyd终端 需密码登陆
sed -i '7a uci set system.@system[0].ttylogin=1' package/lean/default-settings/files/zzz-default-settings
echo
TIME y "添加 atmaterial 主题"
svn co https://github.com/gd0772/package/trunk/luci-theme-atmaterial package/gd772/luci-theme-atmaterial
echo
TIME y "添加 opentopd 主题"
git clone https://github.com/sirpdboy/luci-theme-opentopd package/gd772/luci-theme-opentopd
sed -i "s/title=VPN/title=GFW/g" package/gd772/luci-theme-opentopd/htdocs/luci-static/opentopd/css/style.css
echo
# app
TIME y "添加 分区扩容"
git clone https://github.com/sirpdboy/luci-app-partexp.git package/gd772/luci-app-partexp
echo
TIME y "添加 关机"
svn co https://github.com/gd0772/package/trunk/luci-app-poweroff package/gd772/luci-app-poweroff
echo
TIME y "添加 管控过滤"
svn co https://github.com/gd0772/package/trunk/luci-app-control-weburl package/gd772/luci-app-control-weburl
echo
TIME y "添加 访问限制"
svn co https://github.com/gd0772/package/trunk/luci-app-control-webrestriction package/gd772/luci-app-control-webrestriction
echo
TIME y "添加 定时唤醒"
svn co https://github.com/gd0772/package/trunk/luci-app-control-timewol package/gd772/luci-app-control-timewol
echo
TIME y "添加 文件管理器"
svn co https://github.com/gd0772/package/trunk/luci-app-filebrowser package/gd772/luci-app-filebrowser
echo
TIME y "添加 小猫咪"
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/gd772/luci-app-openclash
echo
TIME y "添加 passwall"
git clone https://github.com/kenzok8/small package/gd772/passwall
rm -rf package/gd772/passwall/luci-app-passwall2 package/gd772/passwall/luci-app-ssr-plus package/gd772/passwall/luci-app-bypass
echo
TIME y "添加 SSR Plus+"
git clone -b main https://github.com/fw876/helloworld package/gd772/ssrplus
echo
# 状态
sed -i 's/WireGuard 状态/WiGd状态/g' feeds/luci/applications/luci-app-wireguard/po/zh-cn/wireguard.po
# 系统
sed -i 's/"管理权"/"改密码"/g' feeds/luci/modules/luci-base/po/zh-cn/base.po
sed -i 's/TTYD 终端/终端/g' feeds/luci/applications/luci-app-ttyd/po/zh-cn/terminal.po
# 服务
sed -i 's/广告屏蔽大师 Plus+/广告屏蔽/g' feeds/luci/applications/luci-app-adbyby-plus/po/zh-cn/adbyby.po
sed -i 's/ShadowSocksR Plus+/SSR Plus+/g' package/gd772/ssrplus/luci-app-ssr-plus/luasrc/controller/shadowsocksr.lua
sed -i 's/微信推送/信息推送/g' feeds/luci/applications/luci-app-serverchan/luasrc/controller/serverchan.lua
sed -i 's/解锁网易云灰色歌曲/音乐解锁/g' feeds/luci/applications/luci-app-unblockmusic/po/zh-cn/unblockmusic.po
sed -i 's/msgstr "KMS 服务器"/msgstr "KMS 服务"/g' feeds/luci/applications/luci-app-vlmcsd/po/zh-cn/vlmcsd.po
sed -i 's/"上网时间控制"/"上网控制"/g' feeds/luci/applications/luci-app-accesscontrol/po/zh-cn/mia.po
sed -i 's/msgstr "UPnP"/msgstr "UPnP设置"/g' feeds/luci/applications/luci-app-upnp/po/zh-cn/upnp.po
# 存储
sed -i 's/阿里云盘 WebDAV/阿里云盘/g' feeds/luci/applications/luci-app-aliyundrive-webdav/po/zh-cn/aliyundrive-webdav.po
sed -i 's/"文件浏览器"/"文件管理"/g' package/gd772/luci-app-filebrowser/po/zh-cn/filebrowser.po
sed -i 's/msgstr "FTP 服务器"/msgstr "FTP 服务"/g' feeds/luci/applications/luci-app-vsftpd/po/zh-cn/vsftpd.po
# GFW
sed -i 's/IPSec VPN 服务器/IPSec 服务/g' feeds/luci/applications/luci-app-ipsec-vpnd/po/zh-cn/ipsec.po
# 网络
sed -i '18d' feeds/luci/applications/luci-app-arpbind/po/zh-cn/arpbind.po
sed -i '17a msgstr "MAC绑定"' feeds/luci/applications/luci-app-arpbind/po/zh-cn/arpbind.po
sed -i 's/msgstr "Socat"/msgstr "端口转发"/g' feeds/luci/applications/luci-app-socat/po/zh-cn/socat.po
sed -i 's/Turbo ACC 网络加速/网络加速/g' feeds/luci/applications/luci-app-turboacc/po/zh-cn/turboacc.po
# 菜单重命名
sed -i 's/网络存储/存储/g' feeds/luci/applications/luci-app-vsftpd/po/zh-cn/vsftpd.po
sed -i 's/带宽监控/统计/g' feeds/luci/applications/luci-app-nlbwmon/po/zh-cn/nlbwmon.po
# 欢迎页信息
sed -i '63d' package/lean/autocore/files/x86/index.htm
sed -i '62a localtime  = os.date("%Y年%m月%d日") .. " " .. translate(os.date("%A")) .. " " .. os.date("%X"),' package/lean/autocore/files/x86/index.htm
sed -i '750a <tr><td width="33%"><%:固件编译日期%></td><td id="cpuusage">gd772 2023.11.11</td></tr>' package/lean/autocore/files/x86/index.htm
sed -i "s/2023.11.11/$(TZ=UTC-8 date "+%Y.%m.%d")/g" package/lean/autocore/files/x86/index.htm
# 调整 上网时间控制 到 管控 菜单
sed -i 's/services/control/g' feeds/luci/applications/luci-app-accesscontrol/luasrc/controller/mia.lua
sed -i 's/services/control/g' feeds/luci/applications/luci-app-accesscontrol/luasrc/view/mia/mia_status.htm
# 调整 阿里云盘 到 存储 菜单
sed -i 's/services/nas/g' feeds/luci/applications/luci-app-aliyundrive-webdav/luasrc/controller/*.lua
sed -i 's/services/nas/g' feeds/luci/applications/luci-app-aliyundrive-webdav/luasrc/model/cbi/aliyundrive-webdav/*.lua
sed -i 's/services/nas/g' feeds/luci/applications/luci-app-aliyundrive-webdav/luasrc/view/aliyundrive-webdav/*.htm
# 调整 Open Clash 到 GFW 菜单
sed -i 's/services/vpn/g' package/gd772/luci-app-openclash/luasrc/*.lua
sed -i 's/services/vpn/g' package/gd772/luci-app-openclash/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/gd772/luci-app-openclash/luasrc/model/cbi/openclash/*.lua
sed -i 's/services/vpn/g' package/gd772/luci-app-openclash/luasrc/view/openclash/*.htm
# 调整 passwall 到 GFW 菜单"
sed -i 's/services/vpn/g' package/gd772/passwall/luci-app-passwall/luasrc/controller/passwall.lua
sed -i 's/services/vpn/g' package/gd772/passwall/luci-app-passwall/luasrc/model/cbi/passwall/client/*.lua
sed -i 's/services/vpn/g' package/gd772/passwall/luci-app-passwall/luasrc/model/cbi/passwall/server/*.lua
sed -i 's/services/vpn/g' package/gd772/passwall/luci-app-passwall/luasrc/passwall/*.lua
sed -i 's/services/vpn/g' package/gd772/passwall/luci-app-passwall/luasrc/view/passwall/app_update/*.htm
sed -i 's/services/vpn/g' package/gd772/passwall/luci-app-passwall/luasrc/view/passwall/global/*.htm
sed -i 's/services/vpn/g' package/gd772/passwall/luci-app-passwall/luasrc/view/passwall/haproxy/*.htm
sed -i 's/services/vpn/g' package/gd772/passwall/luci-app-passwall/luasrc/view/passwall/log/*.htm
sed -i 's/services/vpn/g' package/gd772/passwall/luci-app-passwall/luasrc/view/passwall/node_list/*.htm
sed -i 's/services/vpn/g' package/gd772/passwall/luci-app-passwall/luasrc/view/passwall/rule/*.htm
sed -i 's/services/vpn/g' package/gd772/passwall/luci-app-passwall/luasrc/view/passwall/server/*.htm
sed -i 's/services/vpn/g' package/gd772/passwall/luci-app-passwall/luasrc/view/passwall/socks_auto_switch/*.htm
# 调整 SSRP 到 GFW 菜单
sed -i '12a entry({"admin", "vpn"}, firstchild(), "GFW", 45).dependent = false' package/gd772/ssrplus/luci-app-ssr-plus/luasrc/controller/shadowsocksr.lua
sed -i 's/services/vpn/g' package/gd772/ssrplus/luci-app-ssr-plus/luasrc/controller/*.lua
sed -i 's/services/vpn/g' package/gd772/ssrplus/luci-app-ssr-plus/luasrc/model/cbi/shadowsocksr/*.lua
sed -i 's/services/vpn/g' package/gd772/ssrplus/luci-app-ssr-plus/luasrc/view/shadowsocksr/*.htm
# 调整 Zerotier 到 GFW 菜单
sed -i '8d' feeds/luci/applications/luci-app-zerotier/luasrc/controller/zerotier.lua
sed -i '7a entry({"admin", "vpn"}, firstchild(), "GFW", 45).dependent = false' feeds/luci/applications/luci-app-zerotier/luasrc/controller/zerotier.lua
# 调整 IPSec VPN 服务器 到 GFW 菜单
sed -i '8d' feeds/luci/applications/luci-app-ipsec-vpnd/luasrc/controller/ipsec-server.lua
sed -i '7a entry({"admin", "vpn"}, firstchild(), "GFW", 45).dependent = false' feeds/luci/applications/luci-app-ipsec-vpnd/luasrc/controller/ipsec-server.lua
#echo 
#TIME y "更换5.10内核"
#sed -i 's/KERNEL_PATCHVER:=6.1/KERNEL_PATCHVER:=5.10/g' ./target/linux/x86/Makefile
echo
TIME g "自定义文件修复权限"
chmod -R 755 package/gd772
