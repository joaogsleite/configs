#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

CONFIG_NAME="${1%.conf}"

if [ "$(uname)" == "Darwin" ]; then
  if [ ! -f $CONFIG_NAME.conf ]; then
    echo "$CONFIG_NAME.conf not found!"
    exit -1
  fi
  mkdir -p /opt/homebrew/etc/wireguard/
  rm -f /opt/homebrew/etc/wireguard/$CONFIG_NAME.conf
  cp $CONFIG_NAME.conf /opt/homebrew/etc/wireguard/$CONFIG_NAME.conf
  chmod 600 /opt/homebrew/etc/wireguard/$CONFIG_NAME.conf
  sudo chown root:wheel /opt/homebrew/etc/wireguard/$CONFIG_NAME.conf
fi

sudo wg-quick up $CONFIG_NAME
