FROM ubuntu:18.04
MAINTAINER Rafael Bernabeu "rbbernabeu@gmail.com"
COPY setups/ /tmp/setups/

# --- GLOBAL CONFIG ---
RUN sed 's/main$/main universe/' -i /etc/apt/sources.list   
RUN apt-get update && apt-get install -y software-properties-common apt-transport-https apt-utils net-tools wget curl

# Create user developer
RUN chmod +x /tmp/setups/create-user-developer && ./tmp/setups/create-user-developer

# Gedit
RUN apt-get install gedit -y

# Nautilus
RUN chmod +x /tmp/setups/nautilus/setup && ./tmp/setups/nautilus/setup

# Firefox
RUN apt-get install firefox -y

# Google Chrome
RUN chmod +x /tmp/setups/google-chrome/setup && ./tmp/setups/google-chrome/setup

# Chromium
#RUN apt-get install chromium-browser -y

# Oracle Java 8
RUN chmod +x /tmp/setups/java8/setup && ./tmp/setups/java8/setup

# Git
RUN apt-get install git -y

# Maven
RUN apt-get install maven -y

# NodeJS
RUN apt-get install nodejs -y

# NPM
RUN apt-get install npm -y

# Sublime Text (use gtk2, bug others gtk3 programs)
#RUN chmod +x /tmp/setups/sublime-text/setup && ./tmp/setups/sublime-text/setup

# IntelliJ IDEA-C
RUN chmod +x /tmp/setups/intellij/ideaC/setup && ./tmp/setups/intellij/ideaC/setup

# IntelliJ IDEA-U
RUN chmod +x /tmp/setups/intellij/ideaU/setup && ./tmp/setups/intellij/ideaU/setup

# Visual Studio Code
RUN chmod +x /tmp/setups/vscode/setup && ./tmp/setups/vscode/setup

# Netbeans
#RUN chmod +x /tmp/setups/netbeans/setup && ./tmp/setups/netbeans/setup

# WildFly
RUN chmod +x /tmp/setups/wildfly/setup && ./tmp/setups/wildfly/setup

# Squirrel-SQL
RUN chmod +x /tmp/setups/squirrel/setup && ./tmp/setups/squirrel/setup

# Postman (use gtk2, bug others gtk3 programs)
#RUN chmod +x /tmp/setups/postman/setup && ./tmp/setups/postman/setup

# Clean
RUN apt-get install -f -y && apt-get clean && rm -rf /tmp/* && rm -rf /var/lib/apt/lists/*

#USER developer
ENV HOME /home/developer
WORKDIR /home/developer
CMD /bin/bash
