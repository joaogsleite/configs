#!/usr/bin/env bash

cp ~/.config/filezilla/sitemanager.xml ./sitemanager.xml
rm ./sitemanager.xml.gpg
gpg -c ./sitemanager.xml
rm ./sitemanager.xml

cp ~/.config/filezilla/filezilla.xml ./filezilla.xml
sed -i '/<LastServer>/,/<\/LastServer>/d' filezilla.xml
sed -i '/<Setting name="Last local directory">/,/<\/Setting>/d' filezilla.xml
