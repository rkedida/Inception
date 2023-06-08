# Use the official Docker Debian Buster slim image as base
FROM debian:buster-slim

# Update the system and install nginx
RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y nginx openssl

RUN mkdir -p /ssl \
	&& cd /ssl \
	&& openssl genpkey -algorithm RSA -out nginx.key \
	&& openssl req -new -key nginx.key -out nginx.csr -subj "/C=DE/ST=Heilbronn /L=Heilbronn /O=42/CN=42heilbronn.com" \
	&& openssl req -x509 -sha256 -days 365 -key nginx.key -in nginx.csr -out nginx.crt

# Remove apt cache to reduce image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Expose port 443
EXPOSE 443

COPY ./default /etc/nginx/sites-available/default
# Start Nginx when the container has provisioned.
CMD ["nginx", "-g", "daemon off;"]