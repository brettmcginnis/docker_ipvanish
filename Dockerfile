FROM ubuntu:16.04

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    wget \
    unzip \
    network-manager-openvpn

ARG VPN_DIR=/etc/openvpn

WORKDIR ${VPN_DIR}

COPY *.ovpn ./

COPY openvpn.sh openvpn.sh

ENV REGION='41'
ENV USERNAME=''
ENV PASSWORD=''

CMD sh openvpn.sh
