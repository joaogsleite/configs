#!/usr/bin/env bash

CONFIG_NAME="${1%.conf}"

sudo wg-quick down $CONFIG_NAME
