 telegraf
 mkdir /www
 
 curl -O https://wordpress.org/latest.zip
 unzip latest.zip 
 mv wordpress/* /www
 touch /run/openrc/softlevel
 rc-service nginx start
 rc-service php-fpm7 start