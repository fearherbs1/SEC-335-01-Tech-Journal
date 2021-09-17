#!/bin/bash
NETWORK="$1"
PORT="$2"
sudo nmap -open  $NETWORK.1-254 -p $PORT -oG - | awk '/Up$/{print $2}' > portscan.txt
sed -e 's/$/,'$PORT'/' -i portscan.txt
sed -i '1 i\ip,port' portscan.txt
