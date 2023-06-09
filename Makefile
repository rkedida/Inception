# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rkedida <rkedida@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/09 16:55:49 by rkedida           #+#    #+#              #
#    Updated: 2023/06/09 17:20:38 by rkedida          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COMPOSE_FILE = /home/robel/Documents/Inception/srcs/docker-compose.yml

DB_VOLUME = /home/rkedida/data/mysql
WP_VOLUME = /home/rkedida/data/wordpress

all: run

run:
	@sudo docker compose -f $(COMPOSE_FILE) up --build 

empty-volume:
	@sudo rm -rf $(DB_VOLUME)/*
	@sudo rm -rf $(WP_VOLUME)/*

prune:
	@sudo docker system prune -a

fclean:
	@sudo docker compose -f $(COMPOSE_FILE) down
	@sudo rm -rf $(DB_VOLUME)/*
	@sudo rm -rf $(WP_VOLUME)/*
	@sudo docker volume rm srcs_wordpress_data srcs_mysql_data
	@sudo docker image rm -f nginx
	@sudo docker image rm -f wordpress
	@sudo docker image rm -f mariadb


re: fclean run
	
.PHONY: all run rm-volume prune fclean re