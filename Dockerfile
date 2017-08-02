FROM ubuntu:16.04

MAINTAINER Brett McGinnis <brettmcgin@gmail.com>

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    wget \
    unzip \
    network-manager-openvpn

ARG VPN_DIR=/etc/openvpn

WORKDIR ${VPN_DIR}

RUN wget https://www.ipvanish.com/software/configs/configs.zip && \
    unzip configs.zip

COPY openvpn.sh openvpn.sh

ENV REGION='ipvanish-US-Seattle-sea-a01'
ENV USERNAME=''
ENV PASSWORD=''

CMD sh openvpn.sh
