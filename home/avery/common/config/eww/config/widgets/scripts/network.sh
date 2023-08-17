#!/bin/sh

interface=$(route | grep '^default' | grep -o '[^ ]*$')
nmout=$(nmcli device show "$interface" 2> /dev/null)

if [[ $1 == "isethernet" ]]; then
    echo "$nmout" | grep ethernet
elif [[ $1 == "connection" ]]; then
    echo "$nmout" | grep 'GENERAL.CONNECTION' | cut -d':' -f2- | xargs
fi
