# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rrask <rrask@student.hive.fi>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/03/26 10:27:29 by rrask             #+#    #+#              #
#    Updated: 2024/04/22 10:47:25 by rrask            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	if ! grep -q "rrask.42.fr" /etc/hosts; then \
		echo "127.0.0.1 rrask.42.fr" >> /etc/hosts; \
	fi
	if ! grep -q "www.rrask.42.fr" /etc/hosts; then \
		echo "127.0.0.1 www.rrask.42.fr" >> /etc/hosts; \
	fi
	mkdir -p /home/rrask/data/mariadb-data
	mkdir -p /home/rrask/data/wordpress-data
	docker-compose -f srcs/docker-compose.yml build
	docker-compose -f srcs/docker-compose.yml up -d
	
clean:
	docker-compose -f srcs/docker-compose.yml down --rmi all -v

fclean: clean
	rm -rf /home/rrask/data/mariadb-data
	rm -rf /home/rrask/data/wordpress-data
	docker system prune -f

re: fclean all

up:
	docker-compose -f srcs/docker-compose.yml up -d

down:
	docker-compose -f srcs/docker-compose.yml down

.PHONY: all clean fclean re up down