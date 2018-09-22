#!/bin/bash

apt update;
apt install software-properties-common -y;
add-apt-repository ppa:webupd8team/java -y;
apt update;
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections;
apt install wget curl libxss1 libxext-dev libxrender-dev libxtst-dev oracle-java8-installer -y;

apt clean;

./netbeans.sh;
./vscode.sh;

rm -rf /tmp/setups;
