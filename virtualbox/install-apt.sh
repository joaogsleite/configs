#!/usr/bin/env bash

sudo apt install -y virtualbox
sudo apt install -y virtualbox-dkms
sudo apt install -y virtualbox-guest-additions-iso
sudo dpkg-reconfigure virtualbox-dkms
