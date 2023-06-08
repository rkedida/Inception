# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rkedida <rkedida@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/08 22:45:26 by rkedida           #+#    #+#              #
#    Updated: 2023/06/08 22:45:28 by rkedida          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Use the official Docker Debian Buster slim image as base
FROM debian:buster-slim

# Update the system and install necessary packages
RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y \
		php-fpm \
		php-mysql \
		wget unzip \
		mariadb-client \
		curl \
		&& curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
		&& chmod +x wp-cli.phar \
		&& mv wp-cli.phar /usr/local/bin/wp

# Copy the installation script
COPY wordpress.sh /usr/local/bin/

COPY www.conf /etc/php/7.3/fpm/pool.d/

# Make the installation script executable
RUN chmod +x /usr/local/bin/wordpress.sh

RUN mkdir -p /run/php/
# Set the working directory
WORKDIR /var/www/html

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Run the installation script and start PHP-FPM
ENTRYPOINT ["wordpress.sh"]
