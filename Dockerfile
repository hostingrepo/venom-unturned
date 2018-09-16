FROM ubuntu:latest

MAINTAINER Edward B, <Edwardebrook@outlook.com>

ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --add-architecture i386 && \
    apt update && \
    apt upgrade -y && \
    apt install screen htop unzip wget
    apt update
    apt install build-essential gcc-multilib rpm libstdc++6:i386 libgcc1:i386 zlib1g:i386 libncurses5:i386
    apt install mono-reference-assemblies-2.0 mono-devel libmono-cil-dev mono-runtime
    apt install libc6:i386 libgl1-mesa-glx:i386 libxcursor1:i386 libxrandr2:i386
    useradd -d /home/container -m container

USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
