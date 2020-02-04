FROM debian:stable-slim
RUN apt-get update \
        && apt-get -y install --no-install-recommends bash curl bzip2 ffmpeg cifs-utils alsa-utils && apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV ROON_SERVER_PKG RoonServer_linuxx64.tar.bz2
ENV ROON_SERVER_URL http://download.roonlabs.com/builds/${ROON_SERVER_PKG}
ENV ROON_DATAROOT /data
ENV ROON_ID_DIR /data

RUN mkdir /app
WORKDIR /app
RUN curl $ROON_SERVER_URL -O && tar xjf $ROON_SERVER_PKG &&  rm -f $ROON_SERVER_PKG

VOLUME [ "/data", "/music", "/backup" ]
COPY install.sh /
ENTRYPOINT ["/install.sh"]
