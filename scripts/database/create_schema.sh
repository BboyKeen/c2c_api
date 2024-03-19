#!/bin/sh

set -e

DBNAME="c2corg"
DBUSER="www-data"


psql -U "${DBUSER}" -h postgresql <<EOF
create database ${DBNAME} owner "${DBUSER}";
\c ${DBNAME}
create extension postgis;
create schema guidebook authorization "${DBUSER}";
create schema users authorization "${DBUSER}";
create schema sympa authorization "${DBUSER}";
create schema alembic authorization "${DBUSER}";
\q
EOF
# to also set up the database, uncomment the following line
.build/venv/bin/initialize_c2corg_api_db development.ini
