#!/usr/bin/env bash

rm *.xpi
zip -r joaogsleite-extension.xpi manifest.json background.js

echo "Upload a new version here:"
echo "https://addons.mozilla.org/en-US/developers/addon/6bd88d77b8ba4356a7a1/versions"