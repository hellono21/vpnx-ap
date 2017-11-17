#!/bin/sh -e

NET=${XTUN_NET:-'10.222.0.2/24'}

if [ -z "$XTUN_PSK" ]; then
  exit 1
fi
cat <<EOF

================================================

xTun NET: $NET
xTun PSK: $XTUN_PSK
xTun server: $TUNNEL_HOST:$TUNNEL_PORT

================================================

EOF

/opt/xtun/xTun -I $NET -k $XTUN_PSK -n -V -c $TUNNEL_HOST -p $TUNNEL_PORT
