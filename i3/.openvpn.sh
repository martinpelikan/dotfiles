#!/bin/bash
if [ -f /run/openvpn@client.pid ];
then
    echo '<span foreground="#FF0000">UP</span>'
else
    echo 'DOWN'
fi
