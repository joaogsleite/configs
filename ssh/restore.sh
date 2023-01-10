#!/usr/bin/env bash

read -p "Did you download id_rsa, id_rsa.pub and authorized_keys from KeePass? (y/N) " yn
case $yn in
  [Yy]* ) ;;
  * ) echo "Please download files first!" ; exit;;
esac

mkdir -p ~/.ssh/

cp ./config ~/.ssh/config
cp ~/Downloads/id_rsa ~/.ssh/
cp ~/Downloads/id_rsa.pub ~/.ssh/
cp ~/Downloads/authorized_keys ~/.ssh/

sudo chmod 700 ~/.ssh
sudo chmod 700 ~/.ssh/id_rsa
sudo chmod 600 ~/.ssh/authorized_keys
