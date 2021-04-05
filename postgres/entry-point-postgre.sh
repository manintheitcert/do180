#!/bin/bash
set -m 

echo "Setting up Postgresql Database..."

/usr/bin/postgres -D /var/lib/pgsql/data -c  config_file=/var/lib/pgsql/data/postgresql.conf &

sleep 10

if [ ! -z "${POSTGRE_USER}" ] && [ ! -z "${POSTGRE_PASSWORD}" ] && [ ! -z "${POSTGRE_DATABASE}" ]; then
  psql --command "CREATE USER ${POSTGRE_USER} WITH SUPERUSER PASSWORD '${POSTGRE_PASSWORD}';"
  createdb -O "${POSTGRE_USER}" "${POSTGRE_DATABASE}"
fi 


if [ ! -z "${POSTGRE_ROOT_PASSWORD}" ]; then
  echo "ROOT PASSWORD IS SET TO ${POSTGRE_ROOT_PASSWORD}"
  psql --command "ALTER USER postgres WITH PASSWORD '${POSTGRES_ROOT_PASSWORD}';"
  else
    echo "ROOT IS NOT SET"
fi

fg %1 
