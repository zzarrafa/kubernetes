
FROM alpine:latest
RUN apk update && \
    apk add mariadb mariadb-client supervisor
# openrc contient rc-service
RUN apk add openrc vim
RUN apk add telegraf --repository http://dl-4.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN mkdir /run/openrc/
RUN chmod 777 /run/openrc
RUN touch /run/openrc/softlevel
COPY mariadb-server.cnf /etc/my.cnf.d/
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf
# COPY wordpress_db1.sql /
COPY start.sh /
#VOLUME fl /var/lib/data
EXPOSE 3306
COPY wordpress_db.sql /
ADD service_script.conf /
CMD ["supervisord","-c","/service_script.conf"]

# FROM alpine

# RUN apk update
# RUN apk add mariadb mariadb-client openrc
# RUN mkdir /run/openrc && \
# touch /run/openrc/softlevel && \
# rc-status 
# COPY mariadb.conf /etc
# COPY script.sh /
# CMD sh script.sh
# EXPOSE 3306