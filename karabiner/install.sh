#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

osascript -e 'quit app "Karabiner-Elements"'

brew install --cask karabiner-elements

mkdir -p $HOME/.config/
rm -rf $HOME/.config/karabiner/
ln -s $PWD/config $HOME/.config/karabiner

open -a Karabiner-Elements
