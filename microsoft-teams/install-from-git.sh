#!/usr/bin/env zsh

source ~/.zshrc

git clone https://github.com/IsmaelMartinez/teams-for-linux.git
cd teams-for-linux
git pull

npm install
npm run dist:linux -- deb || true

sudo dpkg -i ./dist/*.deb
sudo apt install -f -y
sudo dpkg -i ./dist/*.deb

# OLD REPO:

# clone git repo
#git clone https://github.com/ivelkov/teams-for-linux
#cd teams-for-linux

# install dependencies
#npm i && (cd app && npm i)
