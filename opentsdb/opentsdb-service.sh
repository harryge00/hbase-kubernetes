#!/bin/sh

if [ -f /usr/share/opentsdb/tools/create_table.sh ]; then
  sleep 20
  sh /usr/share/opentsdb/tools/create_table.sh
  rm /usr/share/opentsdb/tools/create_table.sh
fi

exec /usr/share/opentsdb/bin/tsdb tsd \
  --port=4242 \
  --staticroot=/usr/share/opentsdb/static \
  --cachedir=/tmp \
  --auto-metric
