#!/usr/bin/env bash

gpg ./config.zip.gpg
unzip ./config.zip

mkdir -p ~/.local/share/.DBeaverData
cp -r ./config/. ~/.local/share/.DBeaverData/

rm ./config.zip
rm -rf ./config/


