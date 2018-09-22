#!/bin/bash

cd /temp/setups;
dpkg -i code_1.27.2-1536736588_amd64.deb;
apt-get install -f -y;
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg;
install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/;
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list';
apt install apt-transport-https -y;
apt install code -y;
