#!/usr/bin/env bash

mkdir -p ~/.ssh/

gpg ./ssh/id_rsa.gpg

cp ./ssh/id_rsa ~/.ssh/
cp ./ssh/id_rsa.pub ~/.ssh/
cp ./ssh/config ~/.ssh/
cp ./ssh/authorized_keys ~/.ssh/

rm ./ssh/id_rsa

sudo chmod 700 ~/.ssh
sudo chmod 700 ~/.ssh/id_rsa
sudo chmod 600 ~/.ssh/authorized_keys
