#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  echo "use macOS native Screen Sharing app"
else
  # vnc server
  sudo apt install -y vino

  # vnc client
  sudo apt-add-repository -y ppa:remmina-ppa-team/remmina-next
  sudo apt update -y
  sudo apt install -y remmina remmina-plugin-rdp remmina-plugin-secret
fi
