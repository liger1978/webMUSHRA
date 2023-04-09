FROM php:7.0-fpm
RUN mkdir -p /app/service
COPY ./service/write.php /app/service/write.php
WORKDIR /app
