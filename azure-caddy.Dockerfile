FROM caddy:latest
ARG ENVIRONMENT

COPY azure.Caddyfile /etc/caddy/Caddyfile
RUN mkdir -p /var/www/html
COPY ./ /var/www/html/
