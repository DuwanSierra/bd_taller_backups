#!/bin/bash
echo "Creating DB";
sleep 5;
psql "postgresql://root:root@database/test_db" -c 'create database library;';
echo "Creating tables";
psql "postgresql://root:root@database/library" -a -f "/var/lib/postgresql/scripts/library_create.sql";
sleep 5;
echo "Load the data from the files in the DB";
sleep 5;
psql "postgresql://root:root@database/library" -c "\copy ubicacion FROM '/var/lib/postgresql/csv/ubicacion.csv' DELIMITER ';' CSV HEADER;";
psql "postgresql://root:root@database/library" -c "\copy autor FROM '/var/lib/postgresql/csv/autor.csv' DELIMITER ';' CSV HEADER;";
psql "postgresql://root:root@database/library" -c "\copy usuario FROM '/var/lib/postgresql/csv/usuario.csv' DELIMITER ';' CSV HEADER;";
psql "postgresql://root:root@database/library" -c "\copy editorial FROM '/var/lib/postgresql/csv/editorial.csv' DELIMITER ';' CSV HEADER;";
psql "postgresql://root:root@database/library" -c "\copy telefono FROM '/var/lib/postgresql/csv/telefono.csv' DELIMITER ';' CSV HEADER;";
psql "postgresql://root:root@database/library" -c "\copy libro FROM '/var/lib/postgresql/csv/libro.csv' DELIMITER ';' CSV HEADER;";
psql "postgresql://root:root@database/library" -c "\copy ejemplar FROM '/var/lib/postgresql/csv/ejemplar.csv' DELIMITER ';' CSV HEADER;";
psql "postgresql://root:root@database/library" -c "\copy escribe FROM '/var/lib/postgresql/csv/escribe.csv' DELIMITER ';' CSV HEADER;";
psql "postgresql://root:root@database/library" -c "\copy prestamo FROM '/var/lib/postgresql/csv/prestamo.csv' DELIMITER ';' CSV HEADER;";
echo "Backup the database data - Command Copy";
sleep 5;
#Cleaning folder
rm -r /var/lib/postgresql/backups/copy-1/*
#Backup Process
psql "postgresql://root:root@database/library" -c "\copy ubicacion TO '/var/lib/postgresql/backups/copy-1/ubicacion_backup.csv' DELIMITER ';' CSV HEADER;";
psql "postgresql://root:root@database/library" -c "\copy autor TO '/var/lib/postgresql/backups/copy-1/autor_backup.csv' DELIMITER ';' CSV HEADER;";
psql "postgresql://root:root@database/library" -c "\copy usuario TO '/var/lib/postgresql/backups/copy-1/usuario_backup.csv' DELIMITER ';' CSV HEADER;";
psql "postgresql://root:root@database/library" -c "\copy editorial TO '/var/lib/postgresql/backups/copy-1/editorial_backup.csv' DELIMITER ';' CSV HEADER;";
psql "postgresql://root:root@database/library" -c "\copy telefono TO '/var/lib/postgresql/backups/copy-1/telefono_backup.csv' DELIMITER ';' CSV HEADER;";
psql "postgresql://root:root@database/library" -c "\copy libro TO '/var/lib/postgresql/backups/copy-1/libro_backup.csv' DELIMITER ';' CSV HEADER;";
psql "postgresql://root:root@database/library" -c "\copy ejemplar TO '/var/lib/postgresql/backups/copy-1/ejemplar_backup.csv' DELIMITER ';' CSV HEADER;";
psql "postgresql://root:root@database/library" -c "\copy escribe TO '/var/lib/postgresql/backups/copy-1/escribe_backup.csv' DELIMITER ';' CSV HEADER;";
psql "postgresql://root:root@database/library" -c "\copy prestamo TO '/var/lib/postgresql/backups/copy-1/prestamo_backup.csv' DELIMITER ';' CSV HEADER;";
sleep infinity;
