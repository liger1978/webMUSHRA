FROM caddy:latest
ARG ENVIRONMENT

COPY azure.Caddyfile /etc/caddy/Caddyfile
RUN mkdir -p /var/www/html/configs/resources/audio
COPY ./ /var/www/html/
