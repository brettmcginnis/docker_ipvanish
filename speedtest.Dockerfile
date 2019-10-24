FROM ubuntu:18.04

RUN apt update && \
  apt install software-properties-common -y  && \
  add-apt-repository ppa:deadsnakes/ppa && \
  apt install python3.7 curl -y

CMD curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -
