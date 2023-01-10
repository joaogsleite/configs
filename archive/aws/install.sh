#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  brew install awscli
else
  pip install awscli
fi
