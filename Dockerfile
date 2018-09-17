FROM ubuntu:latest

MAINTAINER Edward B, <Edwardebrook@outlook.com>

ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --add-architecture i386 && \
    apt upgrade -y && \
    apt update -y && \
    apt install screen htop unzip wget -y && \
    apt install build-essential gcc-multilib rpm libstdc++6:i386 libgcc1:i386 zlib1g:i386 libncurses5:i386 -y && \
    apt install mono-reference-assemblies-2.0 mono-devel libmono-cil-dev mono-runtime -y && \
    apt install libc6:i386 libgl1-mesa-glx:i386 libxcursor1:i386 libxrandr2:i386 -y && \
    useradd -d /home/container -m container

USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
