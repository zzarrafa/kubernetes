 telegraf
 mkdir /www
 chown -R nginx:nginx /var/lib/nginx
chown -R nginx:nginx /www
cd /www
wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
mv phpMyAdmin-5.0.2-all-languages phpmyadmin
rm phpMyAdmin-5.0.2-all-languages.tar.gz
mv -f  phpmyadmin/* .
rm -rf phpmyadmin/
chmod -R 777 /www
 touch /run/openrc/softlevel
 rc-service nginx start
 rc-service php-fpm7 start
