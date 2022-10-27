#!/usr/bin/with-contenv bashio




# Create main config
DEBUG=$(bashio::config 'debug')

# mqtt
for network in $(bashio::config 'mqtt|keys'); do
    MQTT_ENABLE=$(bashio::config "mqtt[${network}].enabled")
    MQTT_USERNAME=$(bashio::config "mqtt[${network}].username")
    MQTT_PASSWORD=$(bashio::config "mqtt[${network}].password")
    MQTT_PORT=$(bashio::config "mqtt[${network}].port")
    MQTT_SERVER=$(bashio::config "mqtt[${network}].server")
    MQTT_TOPICROOT=$(bashio::config "mqtt[${network}].topicroot")
done

file="/config.yaml"
echo "debug: "${DEBUG} > "${file}"
## append ##
echo "mqtt:" >> "${file}"
echo "   enabled: "${MQTT_ENABLE} >> "${file}"
echo "   username: "${MQTT_USERNAME} >> "${file}"
echo "   password: \"${MQTT_PASSWORD}\"" >> "${file}"
echo "   port: "${MQTT_PORT} >> "${file}"
echo "   server: \"${MQTT_SERVER}\"" >> "${file}"
echo "   topicroot: "${MQTT_TOPICROOT} >> "${file}"



# hisilicon
for network in $(bashio::config 'hisilicon|keys'); do
    HISILICON_ENABLE=$(bashio::config "hisilicon[${network}].enabled")
    HISILICON_PORT=$(bashio::config "hisilicon[${network}].port")

done

echo "hisilicon:" >> "${file}"
echo "   enabled: "${HISILICON_ENABLE} >> "${file}"
echo "   port: "${HISILICON_PORT} >> "${file}"


# ftp
for network in $(bashio::config 'ftp|keys'); do
    FTP_ENABLE=$(bashio::config "ftp[${network}].enabled")
    FTP_PORT=$(bashio::config "ftp[${network}].port")
    FTP_PASSWORD=$(bashio::config "ftp[${network}].password")
    FTP_ALLOW=$(bashio::config "ftp[${network}].allowFiles")
    FTP_ROOT=$(bashio::config "ftp[${network}].rootPath")

done

echo "ftp:" >> "${file}"
echo "   enabled: "${FTP_ENABLE} >> "${file}"
echo "   port: "${FTP_PORT} >> "${file}"
echo "   password: \"${FTP_PASSWORD}\"" >> "${file}"
echo "   allowFiles: "${FTP_ALLOW} >> "${file}"
echo "   rootPath: \"${FTP_ROOT}\"" >> "${file}"






chmod a+x /config.yaml

echo "start 8000 web"

#python3 -m http.server 8000 

#echo "start alarmserver"
/alarmserver-linux-raspberry 

echo "alarmserver run"
