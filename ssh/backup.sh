#!/usr/bin/env bash

read -p "Did you update id_rsa, id_rsa.pub and authorized_keys on KeePass? (y/N) " yn
case $yn in
  [Yy]* ) ;;
  * ) echo "Please update files!" ; exit;;
esac

cp ~/.ssh/config ./config
