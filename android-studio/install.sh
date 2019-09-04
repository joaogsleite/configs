#!/usr/bin/env bash

sudo mkdir -p /opt
sudo tar xvzf *.tar.gz -C /opt/

# dependencies
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386

# kvm
sudo apt-get install qemu-kvm 

