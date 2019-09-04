#!/usr/bin/env bash

gpg ./sitemanager.xml.gpg
cp ./sitemanager.xml ~/.config/filezilla/sitemanager.xml
rm ./sitemanager.xml

cp ./filezilla.xml ~/.config/filezilla/filezilla.xml
