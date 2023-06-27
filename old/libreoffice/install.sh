#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  echo "use Microsoft Office on macOS"
else
  sudo add-apt-repository -y ppa:libreoffice/ppa
  sudo apt update
  sudo apt install -y libreoffice
fi
