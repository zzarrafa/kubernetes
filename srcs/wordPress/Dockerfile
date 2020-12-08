FROM alpine

RUN apk update

RUN apk add nginx php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype php7-session openrc curl unzip supervisor
RUN apk add telegraf --repository http://dl-4.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

COPY nginx.conf /etc/nginx/nginx.conf
RUN mkdir /run/openrc && \
touch /run/openrc/softlevel && \
rc-status

RUN curl -O https://wordpress.org/latest.zip

RUN unzip latest.zip 
RUN mv wordpress site
RUN rm latest.zip
COPY script.sh /
RUN sh script.sh 
COPY wp-config.php /www
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

ADD /Supervisor /src/supervisor
CMD ["supervisord","-c","/src/supervisor/service_script.conf"]
