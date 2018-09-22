#!/bin/bash

sed 's/main$/main universe/' -i /etc/apt/sources.list;
rm -rf /var/lib/apt/lists/*;

wget http://download.netbeans.org/netbeans/8.0.1/final/bundles/netbeans-8.0.1-javase-linux.sh -O /tmp/netbeans.sh -q;
chmod +x /tmp/netbeans.sh;
echo 'Installing netbeans';
/tmp/netbeans.sh --silent --state /tmp/state.xml;

chmod +x /usr/local/bin/netbeans;
mkdir -p /home/developer;
echo "developer:x:1000:1000:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd;
echo "developer:x:1000:" >> /etc/group;
echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer;
chmod 0440 /etc/sudoers.d/developer;
chown developer:developer -R /home/developer
