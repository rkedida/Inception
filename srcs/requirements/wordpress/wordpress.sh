#!/bin/bash

sleep 60

# Proceed with WordPress configuration
mkdir -p /var/www/html/wordpress
cd /var/www/html/wordpress

if [ -f "/var/www/html/wordpress/wp-config.php" ]
then
	echo "WARNING: WordPress already configured";
else
	# Download and setup WordPress
	wget -nc https://wordpress.org/latest.zip
	unzip -o latest.zip && rm latest.zip
	chown -R www-data:www-data wordpress
	mv wordpress/* .
	rm -rf wordpress/
	# Configure WordPress using wp-cli
	wp --allow-root config create --dbhost=mariadb --dbname=$MY_SQL_DB --dbuser=$WP_DB_USER --dbpass=$WP_PASS --locale=en_US 
	# Replace '<your-site-url>' with your actual site URL
	wp --allow-root core install --url=rkedida.42.fr --title=NOT_A_WEBSITE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL
	wp --allow-root user create Balu Balu@test.com --user_pass=$WP_SECOND_PASS --porcelain
fi

# Start PHP-FPM
php-fpm7.3 -F
