#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

if [ "$(uname)" == "Darwin" ]; then
  sudo systemsetup -setremotelogin on
else
  sudo apt install -y openssh-server 
fi

read -p "Did you download id_rsa, id_rsa.pub and authorized_keys from KeePass to ./config ? (y/N) " yn
case $yn in
  [Yy]* ) ;;
  * ) echo "Please download files first!" ; exit 1;;
esac

rm -rf $HOME/.ssh

ln -s $PWD/config $HOME/.ssh

chmod 700 $PWD/config
chmod 600 $PWD/config/id_*
chmod 644 $PWD/config/*.pub
chmod 600 $PWD/config/authorized_keys
