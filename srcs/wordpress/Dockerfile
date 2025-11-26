FROM debian:bookworm

ENV DEBIAN_FRONTEND=noninteractive


RUN apt update && \
    apt upgrade -y && \
    apt install -y curl php-fpm php-mysqli zsh && \
    apt clean && rm -rf /var/lib/apt/lists/*


RUN mkdir -p /run/php && chown www-data:www-data /run/php


COPY www.conf /etc/php/8.2/fpm/pool.d/


WORKDIR /var/www/html/


COPY script.sh /usr/local/bin/script.sh


RUN chmod +x /usr/local/bin/script.sh


EXPOSE 9000


ENTRYPOINT ["/usr/local/bin/script.sh"]


CMD ["php-fpm8.2", "-F"]