FROM ubuntu:18.04

MAINTAINER Rafael Bernabeu "rbbernabeu@gmail.com"

# --- BEGIN GLOBAL CONFIG ---

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list   

RUN apt update && \
    apt install wget curl libxss1 libxext-dev libxrender-dev libxtst-dev software-properties-common chromium-browser firefox gedit -y

RUN mkdir -p /home/developer && \
    echo "developer:x:1000:1000:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:1000:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chown developer:developer -R /home/developer

#    chmod 0440 /etc/sudoers.d/developer && \

# --- END GLOBAL CONFIG ---

# --- BEGIN DEV STUFF ---

#Java
RUN add-apt-repository ppa:webupd8team/java -y && \
    apt update && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt install oracle-java8-installer -y

#Maven
RUN apt install maven -y

#Node
RUN apt install nodejs -y

# --- END DEV STUFF ---

# --- BEGIN NETBEANS ---

ADD setups/netbeans/run /home/developer/netbeans
ADD setups/netbeans/state.xml /tmp/state.xml

RUN wget http://download.netbeans.org/netbeans/8.0.1/final/bundles/netbeans-8.0.1-javase-linux.sh -O /tmp/netbeans.sh -q && \
    chmod +x /tmp/netbeans.sh && \
    echo 'Installing netbeans' && \
    /tmp/netbeans.sh --silent --state /tmp/state.xml && \
    chmod +x /home/developer/netbeans

# --- END NETBEANS ---

# -- CLEAN ---

RUN apt clean && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

# --- CLEAN ---

USER developer
ENV HOME /home/developer
WORKDIR /home/developer
CMD /bin/bash
