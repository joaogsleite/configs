#!/usr/bin/env bash


wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

RELEASE=$(lsb_release --codename | cut -f2)
sudo add-apt-repository "deb https://download.virtualbox.org/virtualbox/debian $RELEASE contrib"

sudo apt-get update
sudo apt-get install -y virtualbox-6.0

