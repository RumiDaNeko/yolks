FROM        --platform=$TARGETOS/$TARGETARCH python:3.8-slim

LABEL       author="Michael Parker" maintainer="parker@pterodactyl.io"

RUN         apt update \
            && apt -y install git gcc g++ ca-certificates dnsutils curl iproute2 ffmpeg procps \
            && useradd -m -d /home/container container
RUN         apt-get install -y libnss3 libatk1.0-0 libatk-bridge2.0-0 libcups2 libxcomposite1 libxrandr2 libgbm1 libpango-1.0-0 libasound2 libxdamage1 libxshmfence1 -y
RUN         apt-get install build-essential libcairo2-dev libpango1.0-dev libjpeg-dev libgif-dev librsvg2-dev libglib2.0-dev libjpeg-dev libpixman-1-dev -y
RUN         apt install wget curl -y
RUN         wget -O /etc/parsepackage.py https://raw.githubusercontent.com/NotMinhDucGamingTV/Cloudcodehosting-sourcenconfig/refs/heads/main/python/v3/parsepackage.py

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./../entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
