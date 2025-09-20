#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  read -p "Did you download wg0.conf? (y/N) " yn
  case $yn in
    [Yy]* ) ;;
    * ) echo "Please download files first!" ; exit;;
  esac
  if [ ! -f ~/Downloads/wg0.conf ]; then
    echo "~/Downloads/wg0.conf not found!"
    exit -1
  fi
  sudo mkdir -p /opt/homebrew/etc/wireguard/
  sudo mv ~/Downloads/wg0.conf /opt/homebrew/etc/wireguard/wg0.conf
  chmod 600 /opt/homebrew/etc/wireguard/wg0.conf
fi
