#!/usr/bin/with-contenv bashio

echo "start 8000 web"

python3 -m http.server 8000

echo "start alarmserver"
/alarmserver-linux-raspberry

echo "alarmserver run"
