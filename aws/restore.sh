#!/usr/bin/env bash

mkdir -p ~/.aws
cp -r ./config ~/.aws/config

aws configure
