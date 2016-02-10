#!/bin/bash

# Variables

## Names
user=$(whoami)
hostname=$(hostname | sed 's/.local//g')

## Version of OS X
version="OS X $(sw_vers -productVersion)"

## Version name
versionNumber=$(sw_vers -productVersion) # Finds version number

versionMajor=`echo $versionNumber | cut -d'.' -f1`
versionMinor=`echo $versionNumber | cut -d'.' -f2`
versionShort="${versionMajor}.${versionMinor}"


## en1 or en0 should contain the ip address
ipAddress=`ipconfig getifaddr en1`
if [ -z "$ipAddress" ]; then
    ipAddress=`ipconfig getifaddr en0`
fi

case $versionShort in
    10.11)
        versionString="El Capitan"
        ;;
    10.10)
        versionString="Yosemite"
        ;;
    10.9)
        versionString="Mavericks"
        ;;
    10.8)
        versionString="Mountain Lion"
        ;;
    10.7)
        versionString="Lion"
        ;;
    10.6)
        versionString="Snow Leopard"
        ;;
    10.5)
        versionString="Leopard"
        ;;
    10.4)
        versionString="Tiger"
        ;;
    10.3)
        versionString="Panther"
        ;;
    10.2)
        versionString="Jaguar"
        ;;
    10.1)
        versionString="Puma"
        ;;
    10.0)
        versionString="Cheetah"
        ;;
esac

## Kernal
kernel=$(uname)

## Uptime
uptime=$(uptime | sed 's/.*up \([^,]*\), .*/\1/')

## Shell
shell="$SHELL"

## Terminal
terminal="$TERM"

## Number of packages installed via Homebrew
##packages="`brew list -l | wc -l | awk '{print $1 }'`"

## CPU Type
cpu=$(sysctl -n machdep.cpu.brand_string)

## Memory Amount
mem=$(sysctl -n hw.memsize)
ram="$((mem/1073741824)) GB"

## Disk usage
disk=`df | head -2 | tail -1 | awk '{print $5}'`

# Add a -c option to enable classic color logo
if [[ $1 == "-c" ]]; then
  GREEN='\033[00;32m'
  YELLOW='\033[00;33m'
  LRED='\033[01;31m'
  RED='\033[00;31m'
  PURPLE='\033[00;35m'
  CYAN='\033[00;36m'
  BLUE='\033[00;34m'
fi

# Output

echo -e "

${GREEN}                  ###
${GREEN}                ####                  User: $user
${GREEN}                ###                   Hostname: $hostname
${GREEN}       ####### ##  #######            Version: $version $versionString
${YELLOW}     ######################           Kernel: $kernel
${YELLOW}    #####################             Uptime: $uptime
${LRED}    ####################              Shell: $shell
${RED}    ####################              Terminal $terminal
${RED}    #####################             Packages $packages
${PURPLE}     ######################           CPU: $cpu
${PURPLE}      ####################            Memory: $ram
${BLUE}        ################              Disk Used: $disk
${BLUE}         ####     #####               Internal IP: $ipAddress

"
tput sgr0
