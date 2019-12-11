#!/usr/bin/env bash

wget -O teams.deb "https://teams.microsoft.com/downloads/desktopurl?env=production&plat=linux&arch=x64&download=true&linuxArchiveType=deb"

sudo dpkg -i teams.deb

