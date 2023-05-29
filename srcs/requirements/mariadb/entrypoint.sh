#!/bin/bash

# Start MariaDB service
mysql_install_db

/etc/init.d/mysql start
# Create your database
mysql -u root -e "CREATE DATABASE IF NOT EXISTS wordpress;"

# Grant all privileges on your database to your user
mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'username'@'%' IDENTIFIED BY 'password';"

# Flush the privileges
mysql -u root -e "FLUSH PRIVILEGES;"

# /etc/init.d/mysql stop

# Keep MariaDB running in the foreground
exec /usr/sbin/mysqld --user=root