FROM        --platform=$TARGETOS/$TARGETARCH node:21-bullseye-slim

LABEL       author="MinhDucGone" maintainer="NMDGTV@notminhducgamingtv.tk"

RUN         apt update \
            && apt -y install ffmpeg iproute2 git sqlite3 libsqlite3-dev python3 python3-dev ca-certificates dnsutils tzdata zip tar curl build-essential libtool wget\
            && useradd -m -d /home/container container
RUN         apt-get install -y libnss3 libatk1.0-0 libatk-bridge2.0-0 libcups2 libxcomposite1 libxrandr2 libgbm1 libpango-1.0-0 libasound2 libxdamage1 libxshmfence1 -y
RUN         apt-get install build-essential libcairo2-dev libpango1.0-dev libjpeg-dev libgif-dev librsvg2-dev libglib2.0-dev libjpeg-dev libpixman-1-dev libc6 musl -y
RUN         apt update && apt install -y openssh-server sslh
RUN         apt install wget curl -y
RUN         npm install npm@latest -g
RUN         wget -O /etc/parsepackage.js https://raw.githubusercontent.com/RumiDaNeko/Cloudcodehosting-sourcenconfig/refs/heads/main/nodejs/parsepackage.js
# Add cloudflare gpg key
RUN         sudo mkdir -p --mode=0755 /usr/share/keyrings
RUN         curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | sudo tee /usr/share/keyrings/cloudflare-main.gpg >/dev/null

# Add this repo to your apt repositories
RUN         echo 'deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared any main' | sudo tee /etc/apt/sources.list.d/cloudflared.list

# install cloudflared
RUN         sudo apt-get update && sudo apt-get install cloudflared

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

RUN         curl -fsSL https://gate.minekube.com/install | bash

COPY        ./../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
