#!/bin/bash
cd /app
if $EARLY_ACCESS; then
   ROON_SERVER_URL=https://download.roonlabs.net/builds/earlyaccess/RoonServer_linuxx64.tar.bz2
fi
if test ! -d RoonServer; then
        curl $ROON_SERVER_URL -O -L
        tar xjf $ROON_SERVER_PKG
        rm -f $ROON_SERVER_PKG
fi
/app/RoonServer/start.sh
