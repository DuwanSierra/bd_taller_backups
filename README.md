# bd_taller_backups
![UDistrital](https://www.udistrital.edu.co/themes/custom/versh/logo.png)

[Universidad Distrital Francisco José de Caldas](https://www.udistrital.edu.co/inicio)

Prerequisites
-----

I assume you have installed Docker and it is running.

See the [Docker website](http://www.docker.io/gettingstarted/#h_installation) for installation instructions.

Dependecies
-----
An project have this dependencies:

 * Docker
 * Docker Compose
 * Git

How to Work
-----

This image create 3 containers/services
1. database: Postgresql Container [Postgresql](https://www.postgresql.org/)
2. client_db: Client to connect DBO [Dockerfile](./psql_client/Dockerfile)
3. pgadmin: PGAdmin client web [PGAdmin](https://www.pgadmin.org/) 

client_db
-----
This container execute commands from /data/commands/comandos_ejecutar.sh, this command execute this steps:

* Create DB Library
* Execute SQL /data/scripts/library_create.sql
* Load data in tables with cvs files in folder /data/csv/
* Create backup with command copy cvs files in folder /data/backups/copy-1/

Build
-----

Steps to build a Docker image:

1. Clone this repo

        git clone https://github.com/DuwanSierra/bd_taller_backups.git

2. Execute command

    cd bd_taller_backups
    docker-compose up -d --force-recreate

3. If you need see PGAdmin visit [PGAdmin](http://localhost:5050/browser/) and init session with credentials username: admin@admin.com and password: root

4. If you need add database to pgadmin container use host database with username: root and password: root

5. If you need add database to external use host localhost with port 5433, and username: root password: root


You can also execute command inside database postresql:

    docker run -it postgres /bin/bash