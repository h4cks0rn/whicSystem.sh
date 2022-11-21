#!/bin/bash

# Author: th3hostname (ak)

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

ip_address=$1

trap  ctrl_c INT  

function ctrl_c(){
	echo -ne "\t${redColour}[!]${endColour}${grayColour}Exit..${endColour}"
	rm  ping.log > /dev/null 2>&1
	exit 0
} 2>/dev/null

ping  -c1 $ip_address 2>/dev/null > ping.log
function detection_System(){
	for range  in $(seq 30  64);do
	grep ttl=$range ping.log > /dev/null 2>&1
	if [ "$(echo $?)" == "0" ]; then
		echo -ne "${grayColour}$ip_address${endColour}${yellowColour} ->${endColour}${grayColour} (LINUX) ${endColour}"
	fi	
	done  

	for  range in $(seq 70 124);do
	grep ttl=$range ping.log > /dev/null 2>&1
	if [ "$(echo $?)" == "0" ]; then
		echo -ne "${grayColour}$ip_address${endColour}${yellowColour} ->${endColour}${grayColour} (WINDOWS) ${endColour}"
	fi
        done

} > /dev/null  2>&1

if [ "$#" -ne "1" ]; then 
	echo -ne "${redColour}[!]${endColour} ${grayColour}Uso: ./whichSystem.sh 192.164.1.64${endColour}"
else
	detection_System > /dev/null 2>&1
	rm  ping.log > /dev/null 2>&1
fi
