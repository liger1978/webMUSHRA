FROM php:7.0-fpm
RUN mkdir -p /var/www/html/service
COPY ./service/write.php /var/www/html/service/write.php
WORKDIR /app
