#!/usr/bin/env bash

sudo VBoxManage internalcommands createrawvmdk \
-filename "./win10.vmdk" -rawdisk /dev/sda

sudo usermod -a -G disk $USER
