#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  brew install --cask orbstack 
else
  sudo apt install -y docker.io
  sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
  sudo groupadd docker
  sudo usermod -aG docker $USER
  sudo chmod 666 /var/run/docker.sock
fi
