#!/usr/bin/env bash

# download flutter to this folder
# link: https://flutter.dev/docs/get-started/install/linux

sudo tar -C /opt -xf *.tar.xz

sudo chown -R $USER:$USER /opt/flutter

sudo cp ./flutter /usr/bin/flutter

flutter doctor --android-licenses
flutter precache

