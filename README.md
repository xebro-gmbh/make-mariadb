xebro Makefile - mariadb
======

This is the mariadb bundle for the [xebro Makefile](https://github.com/xebro-gmbh/make-core) project.

## Prerequisite
Please install the core bundle first.

### Install
```bash
make docker/mariadb
```

### Configuration

Configure your local setup with this environment variables
defined in your `.env.local`

This setup is only for development purposes in mind created, please don't use it for production
environments.

```
MARIADB_DATABASE=app
MARIADB_USERNAME=root
DATABASE_URL=mysql://${MARIADB_USERNAME}:${MARIADB_ROOT_PASSWORD}@mariadb:3306/${MARIADB_DATABASE}?serverVersion=10.11.2-MariaDB&charset=utf8mb4
MARIADB_ROOT_PASSWORD=root
```
