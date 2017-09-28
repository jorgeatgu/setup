#!/bin/bash

statusWifi='networksetup -setairportpower en0 on'
GREEN='\033[00;32m'
LRED='\033[01;31m'
wifion='activado'
wifioff='desactivado'

#Comprobamos si el wifi esta apagado. En caso de que devuelva off lo activamos
if [ ! "$statusWifi" ]; then
    networksetup -setairportpower en0 on
    echo -e "

${GREEN} El wifi esta: $wifioff

    "
else
    echo -e "
${GREEN} El wifi esta: $wifion
"
fi
