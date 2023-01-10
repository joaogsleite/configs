#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  brew install python
else
  sudo apt update
  sudo apt install -y python3-pip
  sudo apt install -y python2
  curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py
  sudo python2 get-pip.py
fi
