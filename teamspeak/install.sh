#/usr/bin/env bash

chmod +x *.run
./*.run

sudo mkdir -p /opt
sudo mv TeamSpeak3-Client-linux_amd64 /opt

sudo chown -Rv root:root /opt/TeamSpeak3-Client-linux_amd64
sudo chmod -Rv 755 /opt/TeamSpeak3-Client-linux_amd64

sudo wget -O /opt/TeamSpeak3-Client-linux_amd64/teamspeak-icon.png https://addons-content.teamspeak.com/943dd816-7ef2-48d7-82b8-d60c3b9b10b3/images/648_366/teamspeaklogo_5d00347a0cb48.png

cat << EOF | sudo tee /usr/share/applications/teamspeak.desktop
[Desktop Entry]
Name=TeamSpeak 3
Comment=TeamSpeak 3 VoIP Communicator
Exec=/opt/TeamSpeak3-Client-linux_amd64/ts3client_runscript.sh
Terminal=false
Type=Application
Categories=Network;Application;
Icon=/opt/TeamSpeak3-Client-linux_amd64/teamspeak-icon.png
EOF

