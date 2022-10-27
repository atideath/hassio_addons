# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
ARG BUILD_FROM
FROM $BUILD_FROM

RUN \
  apk add --no-cache \
    python3

WORKDIR /


COPY /alarmserver/* /
RUN chmod a+x /alarmserver-linux-raspberry
#RUN chmod a+x /config.yaml
#CMD [ "/alarmserver-linux-raspberry" ]


#COPY run.sh /data/
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]

