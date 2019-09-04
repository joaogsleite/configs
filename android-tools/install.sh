#!/usr/bin/env bash

# android-file-transfer
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0BB4A1B2FA1A38EB
sudo add-apt-repository -y "deb http://ppa.launchpad.net/samoilov-lex/aftl-stable/ubuntu artful main"
sudo apt install -y android-file-transfer

# android-tools
sudo apt install -y android-tools-adb
sudo apt install -y android-tools-fastboot
