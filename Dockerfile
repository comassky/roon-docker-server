FROM debian:stable-slim

RUN apt-get update \
        && apt -y upgrade \
        && apt -y install bash curl bzip2 ffmpeg cifs-utils alsa-utils && apt autoremove -y

ENV ROON_SERVER_PKG RoonServer_linuxx64.tar.bz2
ENV ROON_SERVER_URL http://download.roonlabs.com/builds/${ROON_SERVER_PKG}
ENV ROON_DATAROOT /data
ENV ROON_ID_DIR /data

VOLUME [ "/app", "/data", "/music", "/backup" ]

ADD install.sh /
ENTRYPOINT /install.sh

