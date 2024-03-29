RED=\033[0;31m
GREEN=\033[0;32m
YELLOW=\033[0;33m
BLUE=\033[0;34m
NO_COLOR=\033[0m
HOME_DIR := $(shell echo $$HOME)

all: build up

build: 
	@echo "$(BLUE)Building images...$(NO_COLOR)"
	mkdir -p $(HOME_DIR)/data/mariadb
	mkdir -p $(HOME_DIR)/data/wordpress
	docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env build

up:
	@echo "$(GREEN)Starting containers...$(NO_COLOR)"
	docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

down:
	@echo "$(YELLOW)Stopping containers...$(NO_COLOR)"
	docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

start:
	@echo "$(GREEN)Starting containers...$(NO_COLOR)"
	docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env start

stop:
	@echo "$(YELLOW)Stopping containers...$(NO_COLOR)"
	docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env stop

logs:
	@echo "$(BLUE)Building logs...$(NO_COLOR)"
	docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env logs

status:
	docker ps

exec_mariadb:
	@echo "$(GREEN)Accessing mariadb container...$(NO_COLOR)"
	docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env exec mariadb bash

exec_nginx:
	@echo "$(GREEN)Accessing nginx container...$(NO_COLOR)"
	docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env exec nginx bash

exec_wordpress:
	@echo "$(GREEN)Accessing wordpress container...$(NO_COLOR)"
	docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env exec wordpress bash

clean:
	-docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down -v --rmi  all
	-docker system prune -af

re: clean all

.PHONY: all build up down start stop logs status exec_mariadb exec_nginx exec_wordpress clean re