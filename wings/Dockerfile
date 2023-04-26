FROM        --platform=$TARGETOS/$TARGETARCH ubuntu:focal

LABEL       author="MinhDucGoneMissing" maintainer="nmdgtv@notminhducgamingtv.tk"

## install mongo
RUN curl -sSL https://get.docker.com/ | CHANNEL=stable bash \
 && systemctl enable --now docker \
 && apt update \
 && apt install -y mongodb-org mongodb-org-server mongodb-org-shell mongodb-org-mongos mongodb-org-tools \
 ## install bastion reqs
 && apt install -y python build-essential git libtool netcat ffmpeg iproute2 curl tzdata \
 ## add container user
 && useradd -d /home/container -m container -s /bin/bash

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
