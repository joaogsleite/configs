#!/usr/bin/env bash

cp -r ~/.local/share/.DBeaverData/. ./config
rm -rf ./config/drivers

zip -r config.zip config/
gpg -c config.zip
rm -rf config/
rm config.zip
