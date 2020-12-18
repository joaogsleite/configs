#!/usr/bin/env bash

sudo apt install linux-headers-`uname -r` gcc make

mv droidcam.desktop ~/.local/share/applications/droidcam.desktop

wget https://files.dev47apps.net/linux/droidcam_latest.zip
unzip droidcam_latest.zip -d droidcam
cd droidcam
sudo ./install-client
sudo ./install-video

