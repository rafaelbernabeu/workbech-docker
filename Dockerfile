FROM ubuntu:18.04

MAINTAINER Rafael Bernabeu "rbbernabeu@gmail.com"

# --- BEGIN GLOBAL CONFIG ---

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list   

RUN apt-get update && \
    apt-get install -y \
        software-properties-common \
        apt-transport-https \
        wget \
        curl \
        gedit \
        libxss1 \
        libxext-dev \
        libxrender-dev \
        libxtst-dev \
        chromium-browser \
        firefox

RUN mkdir -p /home/developer && \
    echo "developer:x:1000:1000:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:1000:" >> /etc/group && \
    chown developer:developer -R /home/developer

# --- END GLOBAL CONFIG ---

# --- BEGIN DEV STUFF ---

#Java
RUN add-apt-repository ppa:webupd8team/java -y && \
    apt-get update && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install oracle-java8-installer -y

#Maven
RUN apt-get install maven -y

#Node
RUN apt-get install nodejs -y

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

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

# --- CLEAN ---

USER developer
ENV HOME /home/developer
WORKDIR /home/developer
CMD /bin/bash
