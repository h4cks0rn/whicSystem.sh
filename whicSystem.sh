#!/bin/bash

# Author: h4cks0rn (ak)

ip_address=$1

trap ctrl_c  INT  
function ctrl_c(){
  echo -ne "\t[!]Exit.."
  exit 0
}

function detection_System(){
  ping -c 1  $ip_address > ping.log
  for range  in $(seq 40  64);do
    grep ttl=$range ping.log > /dev/null 2>&1
    if [ "$(echo $?)" == "0" ]; then
      echo  "$ip_address -> (LINUX)"
    fi  
  done  

  for  range in $(seq 80 124);do
    grep ttl=$range ping.log 
    if [ "$(echo $?)" == "0" ]; then
      echo "$ip_address -> (WINDOWS)"
    fi
  done

}

if [ "$#" -ne "1" ]; then 
  echo -ne "[!] Uso: ./whichSystem.sh 192.164.1.64"
else
  detection_System
fi
