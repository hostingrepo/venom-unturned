FROM ubuntu:latest

MAINTAINER Edward B, <Edwardebrook@outlook.com>

ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --add-architecture i386 && \
    apt upgrade -y && \
    apt update -y && \
    apt install screen htop unzip -y && \
    apt install lib32stdc++6 -y && \
    apt install mono-runtime mono-reference-assemblies-2.0 -y && \
    apt install libc6:i386 libgl1-mesa-glx:i386 libxcursor1:i386 libxrandr2:i386 -y && \
    apt install libc6-dev-i386 libgcc-4.8-dev:i386 -y && \
    apt install curl lib32gcc1 ca-certificates -y && \
    useradd -d /home/container -m container

USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
