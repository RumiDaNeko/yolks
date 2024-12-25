FROM ubuntu:latest

# Set noninteractive mode
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends bash curl ca-certificates iproute2 xz-utils bzip2 sudo \
    && rm -rf /var/lib/apt/lists/*

RUN adduser --home /home/ubuntu ubuntu

USER ubuntu
ENV  USER ubuntu
ENV HOME /home/ubuntu
WORKDIR /home/ubuntu

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
