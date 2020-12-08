FROM alpine:latest

RUN apk add influxdb supervisor

RUN  mkdir -p /var/lib/influxdb


RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untruste
COPY telegraf.conf /etc/telegraf/telegraf.conf
# COPY grafana.db /grafana-6.7.2/data/grafana.db

EXPOSE 8086

#CMD ["influxd", "-config" , "/etc/influxdb.conf" ]

COPY supervisord.conf /
 ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/supervisord.conf"]