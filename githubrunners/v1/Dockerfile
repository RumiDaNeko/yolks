FROM --platform=$TARGETOS/$TARGETARCH ghcr.io/notminhducgamingtv/yolks:debian

LABEL       author="Haruka Kanemari" maintainer="harumi@harumi.io.vn"

ENV         DEBIAN_FRONTEND noninteractive

RUN         apt-get install gcc-multilib -y
RUN         apt update -y && apt install curl wget sudo -y && useradd -m -d /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
