#!/usr/bin/env bash

# create plugins folder
FOLDER=~/.local/share/gnome-shell/extensions
mkdir -p $FOLDER
sudo chown -R joaoleite:joaoleite $FOLDER

# install extensions from browser
sudo apt-get install chrome-gnome-shell

# reset extensions:
sudo rm -rf ~/.local/share/gnome-shell/extensions/*

# caffeine
git clone git://github.com/eonpatapon/gnome-shell-extension-caffeine.git || true
(cd gnome-shell-extension-caffeine && ./update-locale.sh && glib-compile-schemas --strict --targetdir=caffeine@patapon.info/schemas/ caffeine@patapon.info/schemas && cp -r caffeine@patapon.info ~/.local/share/gnome-shell/extensions )
gnome-extensions enable caffeine@patapon.info

# dash to panel
git clone https://github.com/home-sweet-gnome/dash-to-panel.git || true
(cd dash-to-panel && make install)
gnome-extensions enable dash-to-panel@jderose9.github.com

# nothing to say
git clone https://github.com/wbolster/nothing-to-say || true
cp -r nothing-to-say ~/.local/share/gnome-shell/extensions/nothing-to-say@extensions.gnome.wouter.bolsterl.ee
gnome-extensions enable nothing-to-say@extensions.gnome.wouter.bolsterl.ee
