#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  echo "use Navicat on macOS"
  exit
fi

wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list

sudo apt update
sudo apt -y install dbeaver-ce
