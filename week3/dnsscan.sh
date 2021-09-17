#!/bin/bash 
network=$1
dnsserver=$2
echo "DNS resoloution for $network"
for ip in $(seq 1 254); do
        ADDRESS="$network.$ip"
        nslookup "$ADDRESS" "$dnsserver" >/dev/null; RESULT=$? 
        if [ $RESULT == 0 ]; then
            nslookup "$ADDRESS" "$dnsserver"
        fi
done 
