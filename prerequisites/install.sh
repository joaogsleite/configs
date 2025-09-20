#!/usr/bin/env bash

if [[ $(uname) == "Darwin" ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo '# Set PATH, MANPATH, etc., for Homebrew.' >> /Users/joaoleite/.zprofile
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/joaoleite/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
  brew install curl wget jq mas grep
else
  sudo apt update
  sudo apt install -y git curl wget jq 
fi
