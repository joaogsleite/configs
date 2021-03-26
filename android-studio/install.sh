#!/usr/bin/env bash

# download android studio from:
# https://developer.android.com/studio

sudo mkdir -p /opt
sudo tar xvzf *.tar.gz -C /opt/

# dependencies
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386

# kvm
sudo apt-get install qemu-kvm 

# desktop file
cp ./androidstudio.desktop ~/.local/share/applications/androidstudio.desktop

# fix avdmanager
sudo apt-get autoremove openjdk*
sudo apt-get install openjdk-8-jdk

# fix permissions
sudo chown -R $USER:$USER /opt/android-studio



