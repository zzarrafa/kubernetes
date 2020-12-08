
  
#!/bin/bash
DB_DATA_PATH="/var/lib/mysql"
DB_USER="admin"
DB_PASS="123"
DB_ROOT_PASS="123"
# SOCKET="/run/mysqld/mysql.sock"



if [  -d $DB_ROOT_PATH  ]
then

mkdir -p /var/lib/mysql

/usr/bin/mysql_install_db --user=mysql
/usr/bin/mysqld_safe --datadir="/var/lib/mysql"
rc-status
/etc/init.d/mariadb setup
/etc/init.d/mariadb start
sleep 7
mysqladmin -u root password "${DB_ROOT_PASS}"
mysql -u root -e "CREATE DATABASE wordpress_db;"
mysql -u root -e "CREATE USER ${DB_USER}@'%' IDENTIFIED BY '${DB_PASS}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO ${DB_USER}@'%';"
mysql -u root -e "use wordpress_db; source /wordpress_db.sql ;"
mysql -u root -e "FLUSH PRIVILEGES;"

/etc/init.d/mariadb stop
fi

/etc/init.d/mariadb start