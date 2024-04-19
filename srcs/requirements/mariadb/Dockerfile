FROM alpine:3.18

RUN apk update && \
	apk add --no-cache \
	mariadb \
	mariadb-client

EXPOSE 3306

COPY conf/mariadb.conf /etc/my.cnf.d/mariadb.conf
RUN chmod 644 /etc/my.cnf.d/mariadb.conf

COPY ./tools/mariadb_setup.sh /tmp/mariadb_setup.sh
RUN chmod +x /tmp/mariadb_setup.sh

ENTRYPOINT ["sh", "/tmp/mariadb-setup.sh"]