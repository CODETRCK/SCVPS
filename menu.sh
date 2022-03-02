#!/bin/bash

clear
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
clear

yl='\e[32;1m'
bl='\e[36;1m'
gl='\e[32;1m'
rd='\e[31;1m'
mg='\e[0;95m'
blu='\e[34m'
op='\e[35m'
or='\033[1;33m'
bd='\e[1m'
nc='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
echo "Checking VPS"
clear
echo -e " "
echo -e " "
echo -e " "

echo -e " "
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"

# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
# Shell Version
shellversion=""
shellversion=Bash
shellversion+=" Version"
shellversion+=" ${BASH_VERSION/-*}"
versibash=$shellversion
# Getting OS Information
source /etc/os-release
Versi_OS=$VERSION
ver=$VERSION_ID
Tipe=$NAME
URL_SUPPORT=$HOME_URL
basedong=$ID
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
domain=$(cat /etc/v2ray/domain)
Sver=$(cat /home/version)
tele=$(cat /home/contact)
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
IPVPS=$(curl -s ipinfo.io/ip )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )

	echo -e "   $green VPS Type             :$NC  $typevps"
 	echo -e "   $green CPU Model            :$NC $cname"
 	echo -e "   $green CPU Frequency        :$NC $freq MHz"
 	echo -e "   $green Number Of Cores      :$NC  $cores"
 	echo -e "   $green CPU Usage            :$NC  $cpu_usage"
 	echo -e "   $green Operating System     :$NC  "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`
 	echo -e "   $green Kernel               :$NC  `uname -r`"
 	echo -e "   $green Total Amount Of RAM  :$NC  $tram MB"
 	echo -e "   $green Used RAM             :$NC  $uram MB"
 	echo -e "   $green Free RAM             :$NC  $fram MB"
 	echo -e "   $green System Uptime        :$NC  $uptime $DF( From VPS Booting )"
 	echo -e "   $green Isp Name             :$NC  $ISP"
 	echo -e "   $green Domain               :$NC  $domain"
  echo -e "   $green Ip Vps               :$NC  $IPVPS"
 	echo -e "   $green City                 :$NC  $CITY"
 	echo -e "   $green Time                 :$NC  $WKT"
 	echo -e "   $green Day                  :$NC  $DAY"
 	echo -e "   $green Date                 :$NC  $DATE"
 	echo -e "   $green Telegram             :$NC  $tele"
 	echo -e "   $green Script Version       :$NC  $Sver"




echo -e  "-------------------------┃ MAIN MENU ┃--------------------------------
echo -e  "====================|MENU YANG DISEDIAKAN|============================
echo -e  "
echo -e  "    [1]   -> ->         [SSH & OpenVPN"
echo -e  "    [2]   -> ->         [Panel Wireguard"
echo -e  "    [3]   -> ->         [Panel L2TP, PPTP & SSTP"
echo -e  "    [4]   -> ->         [Panel SSR & SS"
echo -e  "    [5]   -> ->         [Panel VMESS"
echo -e  "    [6]   -> ->         [Panel VLESS"
echo -e  "    [7]   -> ->         [Panel Trojan"
echo -e  "  "
echo -e  "                             ┃ SYSTEM  ┃
echo -e  "
echo -e  "       [ 8 ] Add/Change Subdomain Host For VPS"
echo -e  "       [ 9 ] Add ID Cloudflare"
echo -e  "       [ 10 ] Cloudflare Add-Ons"
echo -e  "       [ 11 ] Pointing BUG"
echo -e  "       [ 12 ] Change Port Of Some Service"
echo -e  "       [ 13 ] Autobackup Data VPS"
echo -e  "       [ 14 ] Backup Data VPS"
echo -e  "       [ 15 ] Restore Data VPS"
echo -e  "       [ 16 ] Webmin Menu"
echo -e  "       [ 17 ] Check Usage of VPS Ram"
echo -e  "       [ 18 ] Reboot VPS"
echo -e  "       [ 19 ] Speedtest VPS"
echo -e  "       [ 20 ] Displaying System Information"
echo -e  "       [ 21 ] Info Script"
echo -e  "

echo -e  "  ║ [0] Exit Menu

echo -e  ""
read -p  "     Please select an option :  " menu
echo -e   ""
 case $menu in
   1)
   mssh
   ;;
   2)
   mwg
   ;;
   3)
   ml2ppss-tp
   ;;
   4)
   mss-ssr
   ;;
   5)
   mvmess
   ;;
   6)
   mvless
   ;;
   7)
   mtrojan
   ;;
	 ;;
   8)
   add-host
   ;;
   9)
   cff
   ;;
   10)
   cfd
   ;;
   11)
   cfh
   ;;
   12)
   change
   ;;
   13)
   autobackup
   ;;
   14)
   backup
   ;;
   15)
   restore
   ;;
   16)
   wbmn
   ;;
   17)
   ram
   ;;
	 18)
   reboot
   ;;
	 21)
   speedtest
   ;;
	 22)
   info
   ;;
	 23)
   about
   ;;
   0)
   exit
   ;;
   *)
   echo -e "ERROR!! SILA MASUKKAN NOMBOR YANG BENAR"
   ;;
  esac
