#!/bin/bash
echo "Creating DB";
sleep 5;
psql "postgresql://root:root@database/test_db" -c 'create database library;';
echo "Creating tables";
psql "postgresql://root:root@database/library" -a -f "/var/lib/postgresql/scripts/library_create.sql";
sleep 5;
echo "Creating inserts";
psql "postgresql://root:root@database/library" -c "\copy ubicacion FROM '/var/lib/postgresql/csv/ubicacion.csv' DELIMITER ';' CSV HEADER;";
psql "postgresql://root:root@database/library" -c "\copy autor FROM '/var/lib/postgresql/csv/autor.csv' DELIMITER ';' CSV HEADER;";
psql "postgresql://root:root@database/library" -c "\copy usuario FROM '/var/lib/postgresql/csv/usuario.csv' DELIMITER ';' CSV HEADER;";
psql "postgresql://root:root@database/library" -c "\copy editorial FROM '/var/lib/postgresql/csv/editorial.csv' DELIMITER ';' CSV HEADER;";
psql "postgresql://root:root@database/library" -c "\copy telefono FROM '/var/lib/postgresql/csv/telefono.csv' DELIMITER ';' CSV HEADER;";
psql "postgresql://root:root@database/library" -c "\copy libro FROM '/var/lib/postgresql/csv/libro.csv' DELIMITER ';' CSV HEADER;";
psql "postgresql://root:root@database/library" -c "\copy ejemplar FROM '/var/lib/postgresql/csv/ejemplar.csv' DELIMITER ';' CSV HEADER;";
psql "postgresql://root:root@database/library" -c "\copy escribe FROM '/var/lib/postgresql/csv/escribe.csv' DELIMITER ';' CSV HEADER;";
psql "postgresql://root:root@database/library" -c "\copy prestamo FROM '/var/lib/postgresql/csv/prestamo.csv' DELIMITER ';' CSV HEADER;";
