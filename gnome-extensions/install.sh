#!/usr/bin/env bash

# create plugins folder
FOLDER=~/.local/share/gnome-shell/extensions
mkdir -p $FOLDER
sudo chown -R joaoleite:joaoleite $FOLDER

# install extensions from browser
sudo apt-get install chrome-gnome-shell

# EXTENSIONS:

# caffeine
git clone git://github.com/eonpatapon/gnome-shell-extension-caffeine.git || true
( cd gnome-shell-extension-caffeine && ./update-locale.sh && glib-compile-schemas --strict --targetdir=caffeine@patapon.info/schemas/ caffeine@patapon.info/schemas && cp -r caffeine@patapon.info ~/.local/share/gnome-shell/extensions )
gnome-shell-extension-tool -e caffeine@patapon.info

# dash to panel
git clone https://github.com/home-sweet-gnome/dash-to-panel.git || true
(cd dash-to-panel && make install)
gnome-shell-extension-tool -e dash-to-panel@jderose9.github.com

