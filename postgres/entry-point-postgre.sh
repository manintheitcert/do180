#!/bin/bash
set -m 

echo "Setting up Postgresql Database..."

cnt=$(ls /var/lib/pgsql/data | wc -l)
echo ""
echo ""

if [ "${cnt}" -eq "0" ]; then
initdb -D /var/lib/pgsql/data
cat <<-EOF > /var/lib/pgsql/data/pg_hba.conf 
host  all  all 0.0.0.0/0 md5
local all  all trust
EOF

cat <<-EOF > /var/lib/pgsql/data/postgresql.conf
listen_addresses = '*'
EOF
fi

/usr/bin/postgres -D /var/lib/pgsql/data -c  config_file=/var/lib/pgsql/data/postgresql.conf &

sleep 10

if [ "${cnt}" -eq "0" ]; then

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
fi

fg %1 
