#!/bin/bash
set -e
trap '' TERM INT HUP

# Update CS:GO before start
#./steamcmd.sh +login anonymous +force_install_dir ./cs-go +app_update 740 validate +quit

cd cs-go
./srcds_run -game csgo +exec server.cfg +hostname "$CSGO_HOSTNAME" +sv_password "$CSGO_PASSWORD" +rcon_password "$RCON_PASSWORD" +sv_setsteamaccount "$STEAM_ACCOUNT_TOKEN" +map de_dust2
