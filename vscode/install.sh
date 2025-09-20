#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

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
	echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
fi

rm -rf $HOME/Library/Application\ Support/Code/User
mkdir -p $HOME/Library/Application\ Support/Code
ln -s $PWD/config $HOME/Library/Application\ Support/Code/User

# install extensions
cat ./extensions.txt | while read line
do
	code --install-extension "$line"
done

# auto backup vscode extensions 
if [ "$(uname)" == "Darwin" ]; then
sudo tee /usr/local/bin/vscodeextensionssync > /dev/null <<EOF
#!/usr/bin/env bash
/opt/homebrew/bin/code --list-extensions > $PWD/extensions.txt
EOF
sudo chmod +x /usr/local/bin/vscodeextensionssync
cat <<EOF > $HOME/Library/LaunchAgents/com.joaogsleite.vscodeextensionssync.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN"
 "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Label</key>
	<string>com.joaogsleite.vscodeextensionssync</string>
	<key>ProgramArguments</key>
	<array>
		<string>/usr/local/bin/vscodeextensionssync</string>
	</array>
	<key>RunAtLoad</key>
	<true/>
</dict>
</plist>
EOF
launchctl unload $HOME/Library/LaunchAgents/com.joaogsleite.vscodeextensionssync.plist || true
launchctl load $HOME/Library/LaunchAgents/com.joaogsleite.vscodeextensionssync.plist
fi