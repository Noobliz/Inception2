FROM debian:bookworm


RUN apt update  && apt install -y nginx openssl zsh && \
    mkdir -p /etc/nginx/ssl

RUN mkdir -p /var/run/nginx


COPY nginx.conf /etc/nginx/conf.d

COPY setup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/setup.sh
EXPOSE 443

ENTRYPOINT ["/usr/local/bin/setup.sh"]
CMD ["nginx", "-g", "daemon off;"]