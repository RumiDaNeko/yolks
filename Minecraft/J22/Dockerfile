FROM        --platform=$TARGETOS/$TARGETARCH ghcr.io/graalvm/jdk-community:22.0.2

LABEL       author="Harumi" maintainer="ntncar311@gmail.com"

ENV         DEBIAN_FRONTEND=noninteractive SDKMAN_DIR=/home/container/.sdkman

## Update base packages and install minimal necessary tools (including zip and curl)
RUN         apt update && apt install -y --no-install-recommends \
             curl ca-certificates git unzip zip \
             && apt clean && rm -rf /var/lib/apt/lists/*

## Create container user
RUN         useradd -d /home/container -m container

## Install SDKMAN! and GraalVM as container user
USER        container
WORKDIR     /home/container

## Copy entrypoint script
COPY        ../entrypoint.sh /entrypoint.sh

## Default command
CMD         ["/bin/bash", "/entrypoint.sh"]
