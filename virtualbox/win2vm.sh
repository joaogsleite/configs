#!/usr/bin/env bash

VBoxManage internalcommands createrawvmdk \
-filename "./win10.vmdk" -rawdisk /dev/sda

sudo usermod -a -G disk $USER
sudo usermod -a -G vboxusers $USER

