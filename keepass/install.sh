#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  brew install --cask macpass
else
  read -p "Did you download the .deb file from https://keeweb.info (y/N) " yn
  case $yn in
    [Yy]* ) ;;
    * ) echo "Please download the .deb file first!" ; exit;;
  esac
  sudo dpkg -i ~/Downloads/KeeWeb*.deb
fi
