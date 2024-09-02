#!/usr/bin/env bash

# install nvm
REPO="nvm-sh/nvm"
VERSION=$(curl -s "https://api.github.com/repos/$REPO/releases/latest" | jq -r ".tag_name")

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$VERSION/install.sh | bash

# install pnpm
curl -fsSL https://get.pnpm.io/install.sh | sh -

