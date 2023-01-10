#!/usr/bin/env bash

if [[ "$(uname)" == "Darwin" ]]; then
  echo "use native macOS screenshot tool"
else
  # download deb from
  # https://github.com/DamirPorobic/ksnip/releases
  sudo dpkg -i *.deb
fi
