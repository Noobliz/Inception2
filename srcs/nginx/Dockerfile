FROM debian:bookworm


RUN apt update  && apt install -y nginx openssl zsh && \
    mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -out /etc/nginx/ssl/lguiet.42.fr.crt \
    -keyout /etc/nginx/ssl/lguiet.42.fr.key \
    -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=lguiet.42.fr/emailAddress=lguiet@student.42.fr"


RUN mkdir -p /var/run/nginx


COPY nginx.conf /etc/nginx/conf.d


EXPOSE 443


CMD ["nginx", "-g", "daemon off;"]