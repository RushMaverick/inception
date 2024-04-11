# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rrask <rrask@student.hive.fi>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/26 10:27:29 by rrask             #+#    #+#              #
#    Updated: 2024/04/11 11:35:15 by rrask            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	docker-compose -f srcs/docker-compose.yml build
	docker-compose -f srcs/docker-compose.yml up 
	
clean:
	docker-compose -f srcs/docker-compose.yml down --rmi all -v

fclean: clean
	sed -i '/rrask\.42\.fr/d' /etc/hosts
	rm -rf /home/rrask/data/mariadb-data
	rm -rf /home/rrask/data/wordpress-data
	docker system prune -f

re: fclean all

up:
	docker-compose -f srcs/docker-compose.yml up -d

down:
	docker-compose -f srcs/docker-compose.yml down

.PHONY: all clean fclean re up down