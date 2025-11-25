FROM debian:bookworm

RUN apt update && apt install -y mariadb-client mariadb-server gettext-base

COPY server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY init.sql.template /docker-entrypoint-initdb.d/.

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

EXPOSE 3306

COPY docker-entrypoint.sh .

RUN chmod +x docker-entrypoint.sh

ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["mysqld"]