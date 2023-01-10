#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  brew install nvm
else
  unset NVM_DIR
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
fi
