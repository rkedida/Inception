#!/bin/bash

# Start MariaDB service
mysqld_safe --datadir='/var/lib/mysql' &

# Wait for MariaDB service to start
until mysqladmin ping >/dev/null 2>&1; do
  echo -n "."; sleep 1;
done

# Set a root password (replace 'mysecretpassword' with the actual password you want to use)
mysql -u root -e "UPDATE mysql.user SET Password=PASSWORD('pass') WHERE User='root';"

# Remove anonymous users
mysql -u root -e "DELETE FROM mysql.user WHERE User='';"

# Remove test database
mysql -u root -e "DROP DATABASE IF EXISTS test;"

# Reload the privilege tables
mysql -u root -e "FLUSH PRIVILEGES;"

# Create your database
mysql -u root -e "CREATE DATABASE IF NOT EXISTS XXX;"

# Grant all privileges on your database to your user
mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'username'@'%' IDENTIFIED BY 'password';"

# Flush the privileges
mysql -u root -e "FLUSH PRIVILEGES;"

# Keep MariaDB running in the foreground
wait