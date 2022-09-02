#!/usr/bin/with-contenv bashio




# Create main config
DEBUG=$(bashio::config 'debug')
#MQTT_ON=$(bashio::config 'mqtt|enabled(", ")')



echo "option debug \"${DEBUG}\";"



# mqtt
for network in $(bashio::config 'mqtt|keys'); do
    MQTT_ENABLE=$(bashio::config "mqtt[${network}].enabled")
    MQTT_USERNAME=$(bashio::config "mqtt[${network}].username")
    MQTT_PASSWORD=$(bashio::config "mqtt[${network}].password")
    MQTT_PORT=$(bashio::config "mqtt[${network}].port")
    MQTT_SERVER=$(bashio::config "mqtt[${network}].server")
    MQTT_TOPICROOT=$(bashio::config "mqtt[${network}].topicroot")
done




file="/bar.txt"
echo "This is a test" > /foo.txt
echo "debug:"${DEBUG} > "${file}"
## append ##
echo "mqtt:" >> "${file}"
echo "   enabled:\${MQTT_ENABLE}\;" >> "${file}"





echo "option MQTT_ENABLE \"${MQTT_ENABLE}\";"
echo "option MQTT_USERNAME \"${MQTT_USERNAME}\";"


echo "start 8000 web"

python3 -m http.server 8000 

#echo "start alarmserver"
/alarmserver-linux-raspberry 

#echo "alarmserver run"
