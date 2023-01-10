#!/usr/bin/env bash

if [[ $(uname) == "Darwin" ]]; then
  echo "use Parallels on macOS"
else
  VBoxManage internalcommands createrawvmdk -filename "./win10.vmdk" -rawdisk /dev/sda
  sudo usermod -a -G disk $USER
  sudo usermod -a -G vboxusers $USER
fi
