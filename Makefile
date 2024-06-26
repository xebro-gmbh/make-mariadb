#--------------------------
# xebro GmbH - MariaDB - 0.0.2
#--------------------------

DB_FILENAME=$(shell date +"%Y%m%d%H%M%S")

mariadb.bash: ## Execute bash inside database image
	@${DOCKER_COMPOSE} ${DOCKER_FILES} exec mariadb bash

mariadb.logs: ## Show mariadb container logs
	@${DOCKER_COMPOSE} ${DOCKER_FILES} logs -f mariadb

mariadb.console: ## Run mysql console
	@${DOCKER_COMPOSE} ${DOCKER_FILES} exec mariadb mysql -p${MARIADB_ROOT_PASSWORD}

mariadb.export: ## create database backup from current db
	@mkdir -p ./var/mariadb
	@${DOCKER_COMPOSE} ${DOCKER_FILES} exec mariadb mysqldump -p${MARIADB_ROOT_PASSWORD} --add-drop-database  --all-databases  > "./var/mariadb/${DB_FILENAME}.sql"

mariadb.install:
	$(call headline,"Installing Mariadb")
	@mkdir -p ./var/mariadb
	$(call add_config,".env","docker/mariadb/.env")

install: mariadb.install
