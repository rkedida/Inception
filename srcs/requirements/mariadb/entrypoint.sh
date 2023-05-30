#!/bin/bash

# Start MariaDB service
mysql_install_db

/etc/init.d/mysql start

# Set a root password (replace 'mysecretpassword' with the actual password you want to use)
mysql -u root -e "UPDATE mysql.user SET Password=PASSWORD('Pass') WHERE User='root';"

# Remove anonymous users
mysql -u root -e "DELETE FROM mysql.user WHERE User='';"

# Remove test database
mysql -u root -e "DROP DATABASE test;"

# Reload the privilege tables
mysql -u root -e "FLUSH PRIVILEGES;"

# Create your database
mysql -u root -e "CREATE DATABASE IF NOT EXISTS wordpress;"

# Grant all privileges on your database to your user
mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'username'@'%' IDENTIFIED BY 'password';"

# Flush the privileges
mysql -u root -e "FLUSH PRIVILEGES;"

# Keep MariaDB running in the foreground
exec /usr/sbin/mysqld --user=root