FROM        --platform=$TARGETOS/$TARGETARCH debian:bullseye-slim

LABEL       author="Harumi" maintainer="ntncar311@gmail.com"

ENV     DEBIAN_FRONTEND noninteractive

## Update base packages
SHELL        ["/bin/bash","-c"]
RUN          apt update \
             && apt upgrade -y
RUN          apt install -y curl lsof ca-certificates openssl git tar sqlite3 fontconfig tzdata iproute2 libfreetype6
## Install dependencies
RUN          apt install -y libc++-dev libc6 git wget curl tar zip unzip binutils xz-utils liblzo2-2 cabextract iproute2 net-tools libatomic1 libsdl1.2debian libsdl2-2.0-0 \
             libfontconfig libicu67 icu-devtools libunwind8 libssl-dev sqlite3 libsqlite3-dev libmariadbclient-dev-compat libduktape205 locales ffmpeg gnupg2 apt-transport-https software-properties-common ca-certificates \
             libz-dev rapidjson-dev tzdata libevent-dev libzip4 libsdl2-mixer-2.0-0 libsdl2-image-2.0-0 build-essential cmake libgdiplus
RUN          apt install
## Configure locale
RUN          update-locale lang=en_US.UTF-8 \
             && dpkg-reconfigure --frontend noninteractive locales


##Install graalVM
RUN         curl -s "https://get.sdkman.io" | bash
RUN         source $HOME/.sdkman/bin/sdkman-init.sh && sdk install java 22.0.2-graal
RUN		useradd -d /home/container -m container
USER    container
ENV     USER=container HOME=/home/container
WORKDIR /home/container

COPY    ./entrypoint.sh /entrypoint.sh
CMD     ["/bin/bash", "/entrypoint.sh"]
