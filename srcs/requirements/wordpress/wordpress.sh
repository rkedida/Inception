#!/bin/bash

# Wait until the database is accessible
# cc

# Proceed with WordPress configuration
mkdir -p /var/www/html/wordpress
cd /var/www/html/wordpress

if [ -f "/var/www/html/wordpress/wp-config.php" ]
then
	echo "WARNING: WordPress already configured";
else
	# Download and setup WordPress
	wget https://wordpress.org/latest.zip
	unzip latest.zip && rm latest.zip
	mv /Users/rkedida/Documents/Inception/srcs/requirements/* .
	chown -R www-data:www-data .
	
	# Configure WordPress using wp-cli
	wp --allow-root config create --dbhost=mariadb --dbname=$WP_DB --dbuser=$WP_USER --dbpass=$WP_PASS --locale=en_DB 
	wp --allow-root core install --url=<your-site-url> --title=NOT_A_WEBSITE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL
	new_user_id=$(wp --allow-root user create test test@test.com --user_pass=secret --porcelain)
	echo "New user created with ID: $new_user_id"
fi

# Start PHP-FPM
php-fpm7.3 -F

# Execute any commands passed to the script
exec $@