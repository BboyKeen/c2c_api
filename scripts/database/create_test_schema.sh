#!/bin/sh

set -e

DBNAME="c2corg_tests"
DBUSER="www-data"

if [ "$( psql -U "${DBUSER}" -tAc "SELECT 1 FROM pg_database WHERE datname='${DBNAME}'" )" = '1' ]
then
    echo "Test database exists"
else
    echo "Create test database"

psql -U "${DBUSER}" <<EOF
create database ${DBNAME} owner "${DBUSER}";
\c ${DBNAME}
create extension postgis;
create schema guidebook authorization "${DBUSER}";
create schema users authorization "${DBUSER}";
create schema sympa authorization "${DBUSER}";
create schema alembic authorization "${DBUSER}";
\q
EOF
fi
