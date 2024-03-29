#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  echo "use Final Cut Pro X on macOS"
  exit
fi

# BEFORE INSTALL:
# - download davinci resolve from website
# - download deb generator from http://www.danieltufvesson.com/makeresolvedeb
# - install nvidia CUDA from https://developer.nvidia.com/cuda-downloads

# installing dependencies
sudo apt install -y fakeroot
sudo apt install -y ocl-icd-opencl-dev
sudo apt install -y ifuse
sudo apt install -y xorriso

# creating deb file
unzip ~/Downloads/DaVinci_Resolve_*.zip
tar zxvf ~/Downloads/makeresolvedeb_*.sh.tar.gz
~/Downloads/makeresolvedeb_*.sh lite

# installing davinci-resolve
sudo dpkg -i ~/Downloads/davinci-resolve_*.deb

