# Use the penultimate version of the Debian image from DockerHub
FROM debian:buster-slim 

# Update the system and install MariaDB server
RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y mariadb-server

# Remove apt cache to reduce image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Expose port 3306 for the MariaDB service inside the Docker container
EXPOSE 3306

# Set the entrypoint script for the MariaDB service
COPY entrypoint.sh /entrypoint.sh

# Set permissions for the entrypoint script
RUN chmod +x /entrypoint.sh
RUN mkdir /var/run/mysqld \
	&& chown mysql:mysql /var/run/mysqld
# Define the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]