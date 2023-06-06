# Use the penultimate version of the Debian image from DockerHub
FROM debian:buster-slim 

# Update the system and install MariaDB server
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server procps

# Create a my.cnf file with the required settings
RUN echo "[mysqld]" >> /etc/mysql/my.cnf && \
    echo "user = mysql" >> /etc/mysql/my.cnf && \
    echo "pid-file = /var/run/mysqld/mysqld.pid" >> /etc/mysql/my.cnf && \
    echo "socket = /var/run/mysqld/mysqld.sock" >> /etc/mysql/my.cnf && \
    echo "port = 3306" >> /etc/mysql/my.cnf && \
    echo "basedir = /usr" >> /etc/mysql/my.cnf && \
    echo "datadir = /var/lib/mysql" >> /etc/mysql/my.cnf && \
    echo "tmpdir = /tmp" >> /etc/mysql/my.cnf && \
    echo "lc-messages-dir = /usr/share/mysql" >> /etc/mysql/my.cnf && \
    echo "skip-external-locking" >> /etc/mysql/my.cnf

# Remove apt cache to reduce image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Expose port 3306 for the MariaDB service inside the Docker container
EXPOSE 3306

# Set the entrypoint script for the MariaDB service
COPY entrypoint.sh /entrypoint.sh

# Set permissions for the entrypoint script
RUN chmod +x /entrypoint.sh
RUN mkdir /var/run/mysqld \
    && chown -R www-data:www-data /var/run/mysqld \
	&& chmod 777 /var/run/mysqld


# Define the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]

CMD ["mysqld", "--bind-address=0.0.0.0"]