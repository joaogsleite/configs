#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  brew install --cask postman
else
  wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
  sudo tar -xzf postman.tar.gz -C /opt
  rm postman.tar.gz
  sudo rm -f /usr/bin/postman
  sudo ln -s /opt/Postman/Postman /usr/bin/postman

  cat > ~/.local/share/applications/postman.desktop <<EOL
  [Desktop Entry]
  Encoding=UTF-8
  Name=Postman
  Exec=postman
  Icon=/opt/Postman/app/resources/app/assets/icon.png
  Terminal=false
  Type=Application
  Categories=Development;
  EOL
  sudo chmod +x ~/.local/share/applications/postman.desktop
fi
