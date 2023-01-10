#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  echo "not needed on macOS"
  exit
fi

# BEFORE INSTALL:
# - download nvidia CUDA from https://developer.nvidia.com/cuda-downloads

# install CUDA
sudo dpkg -i cuda-*.deb
sudo apt-key add /var/cuda-repo-*/7fa2af80.pub
sudo apt update
sudo apt install -y cuda

# install nvidia driver
sudo add-apt-repository -y ppa:graphics-drivers/ppa
sudo apt-get update
sudo apt install -y nvidia-driver-390

# disable nouveau driver
sudo sh -c 'echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf'
