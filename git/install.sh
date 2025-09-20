#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

if [ "$(uname)" == "Darwin" ]; then
  brew install git
else
  sudo apt install -y git
fi

rm -f $HOME/.gitconfig $HOME/.gitignore
ln -s $PWD/config/gitconfig $HOME/.gitconfig
ln -s $PWD/config/gitignore $HOME/.gitignore
