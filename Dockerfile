FROM ubuntu:16.04

MAINTAINER Brett McGinnis <brettmcgin@gmail.com>

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    wget \
    unzip

ARG VPN_DIR=/etc/openvpn

RUN mkdir -p ${VPN_DIR} && \
    cd ${VPN_DIR}

WORKDIR ${VPN_DIR}

RUN wget https://www.ipvanish.com/software/configs/configs.zip && \
    unzip configs.zip

RUN ls

COPY openvpn.sh openvpn.sh

ENV REGION='ipvanish-US-Seattle-sea-a01'
ENV USERNAME=''
ENV PASSWORD=''

CMD sh openvpn.sh
