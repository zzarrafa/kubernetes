FROM alpine

RUN apk update
RUN apk add nginx supervisor
RUN apk add telegraf  openssh --repository http://dl-4.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN adduser -D -g 'www' www
COPY script.sh /
RUN sh script.sh
# RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
RUN apk add openssl
COPY nginx.conf /etc/nginx/nginx.conf

COPY index.html /www
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MA/ST=MA/L=bengrir/O=s1337/OU=zzarrafa/CN=kkk"

RUN apk add openrc --no-cache
RUN mkdir /run/openrc && \
touch /run/openrc/softlevel && \
rc-status 
RUN mkdir -p /etc/telegraf
RUN adduser -D zineb
RUN echo "zineb:123" | chpasswd
RUN /usr/bin/ssh-keygen -A && ssh-keygen -t rsa -b 4096 -f  /etc/ssh/ssh_host_key
COPY telegraf.conf /etc/telegraf/telegraf.conf
RUN  service nginx start
COPY service_script.conf /service_script.conf
EXPOSE 80 443

CMD ["supervisord","-c","/service_script.conf"]
