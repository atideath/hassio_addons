# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
ARG BUILD_FROM
FROM $BUILD_FROM



WORKDIR /



COPY /config/* /

RUN chmod a+x /alarmserver-linux-raspberry
RUN chmod a+x /config.yaml
CMD [ "/alarmserver-linux-raspberry" ]
