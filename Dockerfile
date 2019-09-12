#
# Phukish CS:GO Docker Image
# Updated: 2019/09/12 (New)
# Based on: https://github.com/foxylion/docker-steam-csgo/blob/master/Dockerfile
#

FROM cm2network/steamcmd:latest

MAINTAINER Charles van Niman <charles@phukish.com>

RUN mkdir /tmp/csgo-lib
ADD lib/ /tmp/csgo-lib
ADD ./entrypoint.sh entrypoint.sh

RUN ./steamcmd.sh +login anonymous +force_install_dir ./cs-go +app_update 740 validate +quit

ENV CSGO_HOSTNAME "A Phukish CS:GO Server"
ENV CSGO_PASSWORD ""
ENV RCON_PASSWORD secret-password
ENV STEAM_ACCOUNT_TOKEN ""

RUN cd /home/steam/steamcmd/cs-go/csgo && \
    tar zxvf /tmp/csgo-lib/mmsource-1.10.7-git971-linux.tar.gz && \
    tar zxvf /tmp/csgo-lib/sourcemod-1.9.0-git6282-linux.tar.gz && 

EXPOSE 27015/udp
EXPOSE 27015

CMD ./entrypoint.sh
