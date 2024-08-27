FROM        --platform=$TARGETOS/$TARGETARCH debian:bullseye-slim

LABEL       author="Harumi" maintainer="ntncar311@gmail.com"

ENV         DEBIAN_FRONTEND noninteractive

## Update base packages
SHELL       ["/bin/bash", "-c"]
RUN         apt update && apt upgrade -y
RUN         apt install -y curl lsof ca-certificates openssl git tar sqlite3 fontconfig tzdata iproute2 libfreetype6 zip unzip curl

## Install SDKMAN! and GraalVM as root
RUN         curl -s "https://get.sdkman.io" | bash \
             && bash -c "source /root/.sdkman/bin/sdkman-init.sh && sdk install java 22.0.2-graal" \
             && echo 'source /home/container/.sdkman/bin/sdkman-init.sh' >> /etc/profile

## Create container user
RUN         useradd -d /home/container -m container

## Copy SDKMAN! setup to container user
RUN         mkdir -p /home/container/.sdkman \
             && cp -r /root/.sdkman/* /home/container/.sdkman/ \
             && chown -R container:container /home/container/.sdkman

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

## Ensure SDKMAN! is initialized for the container user
RUN         echo 'source $HOME/.sdkman/bin/sdkman-init.sh' >> /home/container/.bashrc

## Copy entrypoint script
COPY        ../entrypoint.sh /entrypoint.sh

## Default command
CMD         ["/bin/bash", "/entrypoint.sh"]
