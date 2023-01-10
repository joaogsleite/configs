#/usr/bin/env bash

sudo apt install network-manager-l2tp-gnome
sudo apt install network-manager-l2tp
sudo service xl2tpd stop
sudo systemctl disable xl2tpd

# add nm-applet to startup apps
