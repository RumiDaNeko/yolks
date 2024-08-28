FROM        --platform=$TARGETOS/$TARGETARCH ghcr.io/graalvm/jdk-community:20.0.2

LABEL       author="Harumi" maintainer="ntncar311@gmail.com"

ENV     DEBIAN_FRONTEND noninteractive

## Update base packages
SHELL        ["/bin/bash","-c"]
RUN          apt update \
             && apt upgrade -y
RUN          apt install -y curl lsof ca-certificates openssl git tar sqlite3 fontconfig tzdata iproute2 libfreetype6 zip unzip curl
## Install dependencies

##Install graalVM
RUN		useradd -d /home/container -m container
USER    container
ENV     USER=container HOME=/home/container
WORKDIR /home/container

COPY    ../entrypoint.sh /entrypoint.sh
CMD     ["/bin/bash", "/entrypoint.sh"]
