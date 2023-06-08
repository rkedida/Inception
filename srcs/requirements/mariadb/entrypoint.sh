# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    entrypoint.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rkedida <rkedida@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/08 22:44:41 by rkedida           #+#    #+#              #
#    Updated: 2023/06/08 22:44:45 by rkedida          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

# Start MariaDB service
service mysql start

# Wait for MariaDB service to start
until mysqladmin ping >/dev/null 2>&1; do
  echo -n "."; sleep 1;
done

# Run mysql_secure_installation
SECURE_MYSQL=$(expect -c "
set timeout 10
spawn mysql_secure_installation
expect \"Enter current password for root (enter for none):\"
send \"$MY_SQL_PW\r\"
expect \"Set root password?\"
send \"Y\r\"
expect \"New password:\"
send \"$MY_SQL_PW\r\"
expect \"Re-enter new password:\"
send \"$MY_SQL_PW\r\"
expect \"Remove anonymous users?\"
send \"Y\r\"
expect \"Disallow root login remotely?\"
send \"Y\r\"
expect \"Remove test database and access to it?\"
send \"Y\r\"
expect \"Reload privilege tables now?\"
send \"Y\r\"
expect eof
")

echo "$SECURE_MYSQL"

# Create your database
mysql -u root -p$MY_SQL_PW -e "CREATE DATABASE IF NOT EXISTS $MY_SQL_DB;"

# Grant all privileges on your database to your user
mysql -u root -p$MY_SQL_PW -e "GRANT ALL PRIVILEGES ON $MY_SQL_DB.* TO '$WP_DB_USER'@'%' IDENTIFIED BY '$MY_SQL_PW';"

service mysql stop

# Keep MariaDB running in the foreground
exec "$@"
