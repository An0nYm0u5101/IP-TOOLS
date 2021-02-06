#!/bin/bash
if [[ $1 == güncelle ]];then
	cd files
	bash güncelleme.sh güncelle
	exit
fi
kontrol=$(which curl |wc -l)
if [[ $kontrol == 0 ]];then
	echo
	echo
	echo
	printf "\e[32m\e[97m CURL PAKETİ KURULUYOR"
	echo
	echo
	echo
	sleep 1
	pkg install curl -y
fi
kontrol=$(which nmap |wc -l)
if [[ $kontrol == 0 ]];then
	echo
	echo
	printf "\e[32m[*]\e[0m NMAP PAKETİ KURULUYOR.."
	echo
	echo
	sleep 1
	pkg install nmap -y
fi
kontrol=$(which ip-scan |wc -l)
if [[ $kontrol == 0 ]];then
	echo -e "#/bin/bash
	cd \$HOME/.IP-SCAN
	bash ip-scan.sh \$1" > $PREFIX/bin/ip-scan
	chmod 777 $PREFIX/bin/ip-scan
	cd ..
	mv IP-SCAN .IP-SCAN
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
else
	kontrol=$(cat ip-scan |wc -l)
	if [[ $kontrol != 3 ]];then
		echo -e "#/bin/bash
		cd \$HOME/.IP-SCAN
		bash ip-scan.sh \$1" > $PREFIX/bin/ip-scan
		chmod 777 $PREFIX/bin/ip-scan
		cd ..
		mv IP-SCAN .IP-SCAN
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
fi
cd files
clear
bash güncelleme.sh
bash banner.sh
if [[ $1 == "" ]];then
	echo
	echo
	echo
	printf "\e[97m
                  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+\e[1;33m
	                    |H|E|L|P|\e[0;97m
  	          +-+-+-+-+-+-+-+-+-+-+-+-+-+-+\e[97m



	              \e[32mip-scan\e[97m 216.58.212.46

		      \e[32mip-scan\e[97m google.com

		      \e[32mip-scan\e[97m --agtarama
		      "
	echo
	echo
	echo
	echo
	echo
	echo
	exit
fi
if [[ $1 == --agtarama ]];then
	kontrol=$(ifconfig |grep -o "broadcast")
	if [[ $kontrol == broadcast ]];then
		echo
	else
		echo
		echo
		echo
		printf "\e[31m[!]\e[0m KABLOSUZ AĞ BAĞLANTISI YOK \e[31m!!!\e[0m"
		echo
		echo
		echo
		exit
	fi
	nmapp=$(ifconfig |grep -o 192.168.[0-9] |sed -n 1p)
	echo
	echo
	echo
	printf "\e[32m[*]\e[0m NMAP AĞ TARAMASI YAPILIYOR.."
	echo
	echo
	echo
	sleep 2
	#################### NMAP TARAMA ####################

	printf "
	\e[31m////////////////////////////////////////\e[32m"
	echo
	echo
	echo
	nmap $nmapp.0/24
	echo
	echo
	echo
	printf "\e[32m[✓]\e[0m NMAP AĞ TARAMASI TAMAMLANDI"
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
	              \e[31m[!]\e[97m HATALI İP & DOMAİN \e[31m!!!\e[97m

		              \e[33m$1\e[97m"
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
