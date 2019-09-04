#!/usr/bin/env bash

mkdir -p ./vim
cp -R ~/.vim/* ./vim/

rm -rf ./vim/bundle 2>/dev/null
rm -rf ./vim/swp 2>/dev/null
rm -rf ./vim/undo 2>/dev/null
rm -rf ./vim/.swp 2>/dev/null

cp ~/.vimrc ./vimrc
