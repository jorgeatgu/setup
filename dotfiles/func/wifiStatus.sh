#!/bin/bash

statusWifi=`networksetup -setairportpower en0 on`
PURPLE='\033[00;35m'

#Comprobamos si el wifi esta apagado. En caso de que devuelva off lo activamos
if [ ! "$statusWifi" ]; then
    networksetup -setairportpower en0 on
    echo "${PURPLE} No hay internet, activamos el Wifi"
else
    echo "${PURPLE} Tenemos internet!"
fi
