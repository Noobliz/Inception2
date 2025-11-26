#!/bin/bash


echo "Hello, I am Lise. I certify that this image is custom."

# put env variables in the env from template
if [ -f /docker-entrypoint-initdb.d/init.sql.template ]; then
  envsubst < /docker-entrypoint-initdb.d/init.sql.template > /etc/mysql/init.sql
  rm /docker-entrypoint-initdb.d/init.sql.template
fi


exec "$@"