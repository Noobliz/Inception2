#!/bin/bash


echo "Hello, I am Lise. I certify that this image is custom."

# met les vairables d'env dans l'env a partir du template puis le suppr
if [ -f /docker-entrypoint-initdb.d/init.sql.template ]; then
  envsubst < /docker-entrypoint-initdb.d/init.sql.template > /etc/mysql/init.sql
  rm /docker-entrypoint-initdb.d/init.sql.template
fi


exec "$@"