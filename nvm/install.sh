#!/usr/bin/env bash

REPO="nvm-sh/nvm"
VERSION=$(curl -s "https://api.github.com/repos/$REPO/releases/latest" | jq -r ".tag_name")

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$VERSION/install.sh | bash
