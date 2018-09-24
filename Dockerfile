FROM ubuntu:18.04
MAINTAINER Rafael Bernabeu "rbbernabeu@gmail.com"
COPY setups/ /tmp/setups/

# --- GLOBAL CONFIG ---
RUN sed 's/main$/main universe/' -i /etc/apt/sources.list   
RUN apt-get update && apt-get install -y software-properties-common apt-transport-https apt-utils wget curl

# Create user developer
RUN chmod +x /tmp/setups/create-user-developer && /tmp/setups/create-user-developer

# Firefox
#RUN apt-get install firefox -y

# Chromium
RUN apt-get install chromium-browser -y

# Oracle Java 8
RUN chmod +x /tmp/setups/java8/setup && ./tmp/setups/java8/setup

# Git
RUN apt-get install git -y

# Maven
RUN apt-get install maven -y

# NodeJS
RUN apt-get install nodejs -y

# Sublime Text
RUN chmod +x /tmp/setups/sublime-text/setup && ./tmp/setups/sublime-text/setup

# IntelliJ IDEA
RUN chmod +x /tmp/setups/intellij/setup && ./tmp/setups/intellij/setup

# Visual Studio Code
RUN chmod +x /tmp/setups/vscode/setup && ./tmp/setups/vscode/setup

# Netbeans
#RUN chmod +x /tmp/setups/netbeans/setup && ./tmp/setups/netbeans/setup

# Clean
RUN apt-get install -f -y && apt-get clean && rm -rf /tmp/* && rm -rf /var/lib/apt/lists/*

#USER developer
ENV HOME /home/developer
WORKDIR /home/developer
CMD /bin/bash
