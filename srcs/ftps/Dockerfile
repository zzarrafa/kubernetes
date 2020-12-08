FROM alpine

RUN apk update
RUN apk add telegraf --repository http://dl-4.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN apk add vsftpd supervisor openssl
RUN apk add openrc
RUN mkdir /run/openrc && \
touch /run/openrc/softlevel && \
rc-status
RUN rc-update add vsftpd default
COPY vsftpd.conf /etc/vsftpd
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf
EXPOSE 21
COPY start.sh /
RUN sh /start.sh
ADD /Supervisor /src/supervisor
CMD ["supervisord","-c","/src/supervisor/service_script.conf"]
#RUN rc-service vsftpd start

