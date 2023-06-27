#/usr/bin/env bash

CURRENT_VERSION=2.27.1
wget https://github.com/Versent/saml2aws/releases/download/v${CURRENT_VERSION}/saml2aws_${CURRENT_VERSION}_linux_amd64.tar.gz
sudo tar -xzvf saml2aws_${CURRENT_VERSION}_linux_amd64.tar.gz -C /usr/local/bin/
sudo chmod u+x /usr/local/bin/saml2aws
