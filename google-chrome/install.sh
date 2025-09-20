#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

if [ "$(uname)" == "Darwin" ]; then
  brew install --cask google-chrome
else
  wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
  sudo apt update
  sudo apt install -y google-chrome-stable
fi

sudo rm -f /usr/local/bin/devchrome
sudo ln -s $PWD/devchrome /usr/local/bin/devchrome
