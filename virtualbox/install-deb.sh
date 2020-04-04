#!/usr/bin/env bash

# download virtualbox deb
# https://www.virtualbox.org/wiki/Linux_Downloads

sudo dpkg -i *.deb || true
sudo apt install -g
