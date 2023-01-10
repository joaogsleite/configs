#!/usr/bin/env bash

# dont run this file!
exit 1

NAME=$1

# copy conf file from server
sudo vim /etc/wireguard/$NAME.conf

# enable vpn on boot
sudo systemctl enable wg-quick@$NAME.service

# start vpn now
sudo wg-quick up $NAME
# or
sudo systemctl start wg-quick@$NAME.service

# check status
sudo systemctl status wg-quick@$NAME.service

# stop vpn now
sudo wg-quick down $NAME
# or
sudo systemctl stop wg-quick@$NAME.service

