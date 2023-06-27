#!/usr/bin/env bash

if [[ $(uname) == "Darwin" ]]; then
  echo "use raycast on macOS"
  exit
fi

sudo add-apt-repository -y ppa:agornostal/ulauncher
sudo apt update

sudo apt install -y ulauncher

# Extensions
# ==================================================

# lorem
pip install lorem

# docker
pip install argparse docker

# open subtitles
pip install --user beautifulsoup4

# password generator
pip install pwgen

# url shortner
pip install requests

# lorem ipsum
pip3 install lorem --user

# clipboard
sudo apt install -y gpaste
