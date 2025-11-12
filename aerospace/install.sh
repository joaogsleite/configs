#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

brew install --cask nikitabobko/tap/aerospace

rm -f $HOME/.aerospace.toml
ln -s $PWD/aerospace.toml $HOME/.aerospace.toml

open -a AeroSpace
