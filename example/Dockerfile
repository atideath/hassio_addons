# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
ARG BUILD_FROM
FROM $BUILD_FROM

RUN \
  apk add --no-cache \
    python3

WORKDIR /data



COPY /alarmserver/* /data/

RUN chmod a+x /data/alarmserver-linux-raspberry
RUN chmod a+x /data/config.yaml
CMD [ "/data/alarmserver-linux-raspberry" ]


COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]

