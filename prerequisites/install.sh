#!/usr/bin/env bash

if [[ $(uname) == "Darwin" ]]; then
  xcode-select --install
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew install curl wget jq mas
else
  sudo apt update
  sudo apt install -y git curl wget jq 
fi
