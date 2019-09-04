#!/usr/bin/env bash

cp ./gitignore ~/.gitignore
cp ./gitconfig ~/.gitconfig
git config --global core.excludesfile '~/.gitignore'
git config --global user.email "joaogsleite@gmail.com"
git config --global user.name "joaogsleite"
git config --global core.editor "vim"
