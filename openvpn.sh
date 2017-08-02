#!/bin/sh
set -eu

: ${REGION:?"Run 'docker run brettmcgin/ipvanish ls' to see the list of regions"}
: ${USERNAME:?"Pass in '-e USERNAME='PIA Username''"}
: ${PASSWORD:?"Pass in '-e PASSWORD='PIA Password''"}

echo "$USERNAME" > auth.conf
echo "$PASSWORD" >> auth.conf

chmod 600 auth.conf

openvpn \
    --config "${REGION}.ovpn" \
    --auth-user-pass auth.conf \
    --mute-replay-warnings
