#!/usr/bin/env bash

mkdir -p ./ssh/
cp -R ~/.ssh/* ./ssh/
rm ./ssh/known_hosts 2>/dev/null || true

rm ./ssh/id_rsa.gpg
gpg -c ./ssh/id_rsa
rm ./ssh/id_rsa
