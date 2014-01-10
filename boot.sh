#/bin/bash

# start mysql 
/usr/bin/mysqld_safe &
sleep 3
echo "CREATE USER 'xpressengine'@'localhost' IDENTIFIED BY 'xpressengine';" | mysql
echo "CREATE DATABASE xpressengine;" | mysql
echo "GRANT ALL PRIVILEGES ON xpressengine.* TO 'xpressengine'@'localhost' WITH GRANT OPTION;" | mysql

# start apache2
/usr/sbin/apache2 -D FOREGROUND
