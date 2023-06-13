# Inception

## Introduction
This project aims to showcase the knowledge of system administration using Docker by 

setting up a small infrastructure composed of different services in a Virtual Machine.

## System requirements

- Docker

- Docker Compose

- Virtual Machine

## Setup and Configuration

1. Clone the repository:

```sh
git clone https://github.com/rkedida/Inception.git
```

2. Change the working directory to the cloned repository.
```sh
cd repository_directory/
```

3. Setup the .env file

Create a .env file at the root of the srcs directory.

```sh
cp srcs/.env.example srcs/.env
```

Open the .env file and replace the placeholders with the appropriate information.

Remember, for security reasons, the .env file should not be version controlled.

4. Build and run the Docker images

Run the following command to build the Docker images and start the containers using Docker Compose.

```sh
docker-compose up --build
docker-compose up
```

## Containers

1. NGINX Container: This container serves as the entry point to the infrastructure.
   It is configured to use TLSv1.2 or TLSv1.3 protocol and listens on port 443.

2. WordPress + php-fpm Container: This container hosts the WordPress application using php-fpm without nginx.

3. MariaDB Container: This container hosts the MariaDB database server.

## Volumes:
WordPress Database Volume: This volume stores the WordPress database.

WordPress Website Files Volume: This volume stores the WordPress website files.

## Docker Network:
A Docker network is set up to establish connections between the containers.

## Notes:
All containers are set to restart automatically in case of a crash.

Docker images are built from either the penultimate stable version of Alpine or Debian.

## Contributing:
Please read the CONTRIBUTING.md for details on code of conduct and the process for submitting pull requests.
