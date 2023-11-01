#!/usr/bin/env bash

git clone git@github.com:FreeTubeApp/FreeTube.git
cd FreeTube/
nvm use 18
npm install -f
npm build:arm64
sudo cp -r build/mac-arm64/FreeTube.app /Applications/FreeTube.app/
