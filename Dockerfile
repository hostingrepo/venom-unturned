FROM debian:latest

MAINTAINER Edward B, <Edwardebrook@outlook.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt upgrade -y && \
    apt update -y && \
    apt install screen htop unzip -y && \
    dpkg --add-architecture i386 -y && \
    apt install lib32stdc++6 -y && \
    apt install mono-runtime libmono2.0-cil  -y && \
    apt install libc6 libgl1-mesa-glx libxcursor1 libxrandr2  -y && \
    apt install libc6-dev-i386 libgcc-4.8-dev -y && \

USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
