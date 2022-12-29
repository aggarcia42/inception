all: build up

build: docker-compose -f ./srcs/docker-compose yml build

up: docker-compose -f ./srcs/docker-compose.yml up -d

down: docker-compose -f ./srcs/docker-compose.yml down

start: docker-compose -f ./srcs/docker-compose.yml start

stop: docker-compose -f ./srcs/docker-compose.yml stop

logs: docker-compose -f ./srcs/docker-compose.yml logs

status: docker ps

rmi: docker rmi srcs_wordpress srcs_mariadb srcs_nginx srcs_ftp-server srcs_redis

prune: down
	sudo rm -rf srcs/data
	docker system prune -f

re: prune all

.PHOMY: all build up down start stop logs status rmi prune re