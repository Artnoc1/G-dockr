FROM ubuntu:18.04

# Fix locale to avoid warnings:
ENV LANG C.UTF-8

RUN dpkg --add-architecture i386

USER root
WORKDIR /tmp

# Install deps
# Removed unused parts to make a smaller Docker image:
RUN apt update && \
	apt -yq install sudo wget gdebi-core libgl1-mesa-dri:i386 libgl1-mesa-glx:i386 && \
	wget http://media.steampowered.com/client/installer/steam.deb && \
	gdebi --non-interactive steam.deb && \
	apt clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*  

# Setup our user Steamer
RUN adduser --disabled-password --shell /bin/bash --gecos "" steamer && \
    echo "steamer ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/steamer && \
    chmod 0440 /etc/sudoers.d/steamer 

USER steamer
WORKDIR "/home/steamer"
RUN mkdir -p "/home/steamer/.local/share/
VOLUME ["/mnt/storage/"]
 

