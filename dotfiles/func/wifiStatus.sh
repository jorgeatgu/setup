#!/bin/bash

statusWifi=`networksetup -setairportpower en0 on`

#Comprobamos si el wifi esta apagado. En caso de que devuelva off lo activamos
if [ ! "$statusWifi" ]; then
    networksetup -setairportpower en0 on
    echo "Activamos el Wifi"
else
    echo "Tenemos internet"
fi
