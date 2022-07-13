#!/bin/bash
psql -u root -c 'create database library;'
psql -U root -d library -a -f library_create.sql
psql -U root -d library -c "\copy ubicacion FROM '/var/lib/postgresql/csv/Ubicacion.csv' DELIMITER ';' CSV HEADER;"
psql -U root -d library -c "select * from ubicacion"