#!/usr/bin/with-contenv bashio




# Create main config
DEBUG=$(bashio::config 'debug')
#MQTT_ON=$(bashio::config 'mqtt|enabled(", ")')



    echo "option debug \"${DEBUG}\";"









echo "start 8000 web"

python3 -m http.server 8000 

#echo "start alarmserver"
/alarmserver-linux-raspberry 

#echo "alarmserver run"
