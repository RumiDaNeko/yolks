FROM        --platform=$TARGETOS/$TARGETARCH node:20-bullseye-slim

LABEL       author="MinhDucGone" maintainer="NMDGTV@notminhducgamingtv.tk"

RUN         apt update \
            && apt -y install ffmpeg iproute2 git sqlite3 libsqlite3-dev python3 python3-dev ca-certificates dnsutils tzdata zip tar curl build-essential libtool wget \
            && useradd -m -d /home/container container
RUN         apt-get install -y libnss3 libatk1.0-0 libatk-bridge2.0-0 libcups2 libxcomposite1 libxrandr2 libgbm1 libpango-1.0-0 libasound2 libxdamage1 libxshmfence1 -y
RUN         apt-get install build-essential libcairo2-dev libpango1.0-dev libjpeg-dev libgif-dev librsvg2-dev libglib2.0-dev libjpeg-dev libpixman-1-dev libc6 musl -y
RUN         apt install wget curl -y
RUN         npm install npm@latest -g
RUN         wget -O /etc/parsepackage.js https://raw.githubusercontent.com/RumiDaNeko/Cloudcodehosting-sourcenconfig/refs/heads/main/nodejs/parsepackage.js

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
