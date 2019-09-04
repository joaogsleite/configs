#!/usr/bin/env bash

# download flutter to this folder
# link: https://flutter.dev/docs/get-started/install/linux

sudo tar -C /opt -xf *.tar.xz

sudo chown -R $USER:$USER /opt/flutter

/opt/flutter/bin/flutter doctor --android-licenses
