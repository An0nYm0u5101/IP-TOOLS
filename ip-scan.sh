#!/bin/bash
clear
kontrol=$(which curl |wc -l)
if [[ $kontrol == 0 ]];then
	echo
	echo
	echo
	printf "\e[32m\e[97m CURL PAKETİ KURULUYOR"
	echo
	echo
	echo
	pkg install curl -y
fi
kontrol=$(which ip-scan |wc -l)
if [[ $kontrol == 0 ]];then
	if [[ -a ip-scan.sh ]];then
		mv ip-scan.sh $PREFIX/bin/ip-scan
	fi
	if [[ -a ip-scan ]];then
		mv ip-scan $PREFIX/bin/ip-scan
	fi
	chmod 777 $PREFIX/bin/ip-scan
	echo
	echo
	echo
	printf "\e[32m[✓] \e[1;4;33mip-scan\e[0;97m KISAYOL OLUŞTURULDU"
	echo
	echo
	echo
	sleep 2
	ip-scan
	exit
fi
echo
echo
echo
echo
printf "\e[97m 
            \e[97m██ ██████ \e[32m  ███████ ███████ ███████ ████████
            \e[97m██ ██   █ \e[32m  ██      ██      ██   ██ ██    ██ 
            \e[97m██ ██████ \e[32m  ███████ ██      ███████ ██    ██ 
            \e[97m██ ██     \e[32m       ██ ██      ██   ██ ██    ██ 
            \e[97m██ ██ \e[32m█████████████ ███████ ██   ██ ██    ██ 


         \e[1;97m+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ >>
              \e[33m|C|O|D|E|D| |B|Y| |U|M|U|T| |K|A|R|A|
         \e[97m+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ >>\e[0m
"
if [[ $1 == "" ]];then
	echo
	echo
	echo
	printf "
	\e[31m[!]\e[97m İP NUMARASI GİRİNİZ \e[31m!!!


	\e[33m[*]\e[97m ip-scan 216.58.212.46"
	echo
	echo
	echo
	echo
	echo
	echo
	exit
fi
durum=$(curl -s "http://ip-api.com/json/$1" |awk -F'"' {'print $4'})
if [[ $durum == fail ]];then
	echo
	echo
	echo
	printf "
	\e[31m[!] \e[1;4;33m$1\e[0;97m İP NUMARASI GEÇERSİZ \e[31m!!!\e[97m"
	echo
	echo
	echo
	echo
	echo
	exit
fi
ulke=$(curl -s "http://ip-api.com/json/$1" |awk -F'"' {'print $8'})
ulkekodu=$(curl -s "http://ip-api.com/json/$1" |awk -F'"' {'print $12'})
bolgeadi=$(curl -s "http://ip-api.com/json/$1" |awk -F'"' {'print $20'})
bolgeplaka=$(curl -s "http://ip-api.com/json/$1" |awk -F'"' {'print $16'})
sehir=$(curl -s "http://ip-api.com/json/$1" |awk -F'"' {'print $24'})
postakodu=$(curl -s "http://ip-api.com/json/$1" |awk -F'"' {'print $28'})
enlem=$(curl -s "http://ip-api.com/json/$1" |awk -F':' {'print $9'} |grep -o [0-9.,]\*)
boylam=$(curl -s "http://ip-api.com/json/88.242.134.178" |awk -F':' {'print $10'} |grep -o [0-9.]\*)
zamandilimi=$(curl -s "http://ip-api.com/json/$1" |awk -F'"' {'print $36'})
iss=$(curl -s "http://ip-api.com/json/$1" |awk -F'"' {'print $48'})
echo
echo
echo
printf "
            İP                          : \e[32m$1\e[97m

            ÜLKE                        : \e[32m$ulke\e[97m

            ÜLKE KODU                   : \e[32m$ulkekodu\e[97m

            BÖLGE ADI                   : \e[32m$bolgeadi\e[97m

            BÖLGE PLAKA                 : \e[32m$bolgeplaka\e[97m

            BÖLGE KONUM                 : \e[32m$enlem$boylam\e[97m

            ŞEHİR                       : \e[32m$sehir\e[97m

            POSTA KODU                  : \e[32m$postakodu\e[97m

            ZAMAN DİLİMİ                : \e[32m$zamandilimi\e[97m

            İNTERNET SERVİS SAĞLAYICISI : \e[32m$iss\e[97m

"
echo
echo
echo
echo
