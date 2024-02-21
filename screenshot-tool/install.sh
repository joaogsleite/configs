#!/usr/bin/env bash

if [[ "$(uname)" == "Darwin" ]]; then
  echo "use native macOS screenshot tool"
else
  read -p "Did you download the .deb file from https://github.com/DamirPorobic/ksnip/releases (y/N) " yn
  case $yn in
    [Yy]* ) ;;
    * ) echo "Please download the .deb file first!" ; exit;;
  esac
  sudo dpkg -i ~/Downloads/ksnip*.deb
fi
