#!/usr/bin/env bash

# install vscode
if [ "$(uname)" == "Darwin" ]; then
	brew install --cask visual-studio-code
else
	curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
	sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
	sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
	rm microsoft.gpg
	sudo apt install -y apt-transport-https
	sudo apt update
	sudo apt install -y code
fi

# install extensions
cat ./extensions.txt | while read line
do
	code --install-extension "$line"
done
