#!/bin/bash

#################### GÜNLER ####################

pazartesi=$(date |grep -o Mon)
sali=$(date |grep -o Tue)
carsamba=$(date |grep -o Wed)
persembe=$(date |grep -o Thu)
cuma=$(date |grep -o Fri)
cumartesi=$(date |grep -o Sat)
pazar=$(date |grep -o Sun)

#################### GÜNLERE GÖRE RENKLER ####################

if [[ $pazartesi == Mon ]];then
	color='\e[32m'
elif [[ $sali == Tue ]];then
	color='\e[33m'
elif [[ $carsamba == Wed ]];then
	color='\e[34m'
elif [[ $persembe == Thu ]];then
	color='\e[31m'
elif [[ $cuma == Fri ]];then
	color='\e[36m'
elif [[ $cumartesi == Sat ]];then
	color='\e[32m'
elif [[ $pazar == Sun ]];then
	color='\e[33m'
fi

#################### BANNER ####################


_ip_scan(){
	echo -e " 
            \e[97m██ ██████ $color  ███████ ███████ ███████ ████████
            \e[97m██ ██   █ $color  ██      ██      ██   ██ ██    ██ 
            \e[97m██ ██████ $color  ███████ ██      ███████ ██    ██ 
            \e[97m██ ██     $color       ██ ██      ██   ██ ██    ██ 
            \e[97m██ ██ $color█████████████ ███████ ██   ██ ██    ██ 

	    "
}

_ip_logger() {
	echo -e "
                            \e[97m██╗██████╗ 
                            \e[97m██║██╔══██╗
                            \e[97m██║██████╔╝
                            \e[97m██║██╔═══╝ 
                            \e[97m██║██║     
                            \e[97m╚═╝╚═╝     
           
        $color██╗      ██████╗  ██████╗  ██████╗ ███████╗██████╗ 
        $color██║     ██╔═══██╗██╔════╝ ██╔════╝ ██╔════╝██╔══██╗
        $color██║     ██║   ██║██║  ███╗██║  ███╗█████╗  ██████╔╝
        $color██║     ██║   ██║██║   ██║██║   ██║██╔══╝  ██╔══██╗
        $color███████╗╚██████╔╝╚██████╔╝╚██████╔╝███████╗██║  ██║
        $color╚══════╝ ╚═════╝  ╚═════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝
       "
}

_ip_tools() {
	echo -e "

                            \e[97m██ ██████ 
                            \e[97m██ ██   █ 
                            \e[97m██ ██████ 
                            \e[97m██ ██     
                            \e[97m██ ██     
           
          
          $color████████  ██████   ██████  ██      ███████ 
          $color   ██    ██    ██ ██    ██ ██      ██      
          $color   ██    ██    ██ ██    ██ ██      ███████ 
          $color   ██    ██    ██ ██    ██ ██           ██ 
          $color   ██     ██████   ██████  ███████ ███████ 
                                           



	"
}

if [[ $1 == _ip_scan ]];then
	banner="_ip_scan"
fi
if [[ $1 == _ip_logger ]];then
	banner="_ip_logger"
fi
if [[ $1 == "" ]];then
	banner="_ip_tools"
fi

printf "\e[97m
$($banner)
                         \e[33mSON GÜNCELLEME :\e[0m $(cat updates_infos |sed -n 1p)
         \e[1;97m+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
              $color C O D E D   B Y   U M U T   K A R A
         \e[97m+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
	 \e[97m+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
	          $color T E R M U X X   T O O L S S
  	 \e[97m+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
	     +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
	         +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
		     +-+-+-+-+-+-+-+-+-+-+-+
		         +-+-+-+-+-+-+-+
			     +-+-+-+
			       +-+
			        +

"
                                                   
                                           
