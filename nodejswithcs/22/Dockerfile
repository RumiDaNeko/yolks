FROM --platform=$TARGETOS/$TARGETARCH node:22-bullseye-slim

LABEL author="MinhDucGone" maintainer="NMDGTV@notminhducgamingtv.tk"

# Install system dependencies in ONE layer
RUN apt-get update && apt-get install -y \
    ffmpeg iproute2 git sqlite3 libsqlite3-dev \
    python3 python3-dev ca-certificates dnsutils tzdata \
    zip tar curl build-essential libtool wget jq \
    libnss3 libatk1.0-0 libatk-bridge2.0-0 libcups2 \
    libxcomposite1 libxrandr2 libgbm1 libpango-1.0-0 \
    libasound2 libxdamage1 libxshmfence1 \
    libcairo2-dev libpango1.0-dev libjpeg-dev \
    libgif-dev librsvg2-dev libglib2.0-dev \
    libpixman-1-dev musl \
    && rm -rf /var/lib/apt/lists/*

# Create container user
RUN useradd -m -d /home/container container

# Update npm
RUN npm install -g npm@latest

# Download parsepackage
RUN wget -O /etc/parsepackage.js \
    https://raw.githubusercontent.com/RumiDaNeko/Cloudcodehosting-sourcenconfig/refs/heads/main/nodejs/parsepackage.js

# Install code-server
RUN set -eux; \
    ARCH=$(uname -m); \
    if [ "$ARCH" = "x86_64" ]; then ARCH="amd64"; else ARCH="arm64"; fi; \
	MATCH=linux-${ARCH}; \
	LATEST_JSON=$(curl --silent "https://api.github.com/repos/coder/code-server/releases/latest"); \ 
   	DOWNLOAD_URL=$(echo $LATEST_JSON | jq .assets | jq -r .[].browser_download_url  | grep -i ${MATCH} ); \
    curl -fL $DOWNLOAD_URL \
    | tar -xz -C /etc/codeserver/.local/lib; \
    mv /etc/codeserver/.local/lib/code-server-* /etc/codeserver/.local/lib/code-server; \
    ln -s /etc/codeserver/.local/lib/code-server/bin/code-server /usr/local/bin/code-server

# Setup config symlink (config stored inside mounted volume)
RUN mkdir -p /home/container/codeserver \
    && ln -s /home/container/codeserver/config.yml /etc/codeserver/.config/code-server/config.yaml \
    && chown -R container:container /home/container

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./../entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
