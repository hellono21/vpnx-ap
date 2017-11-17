#!/bin/sh -e
cat > /opt/udp2raw/udp2raw.conf <<EOF
-c
# You can add comments like this
# Comments MUST occupy an entire line
# Or they will not work as expected
# Listen address
-l 0.0.0.0:443
# Remote address
-r $TUNNEL_HOST:$TUNNEL_PORT
-a
--raw-mode faketcp

EOF

/opt/udp2raw/udp2raw_amd64 --conf-file /opt/udp2raw/udp2raw.conf
