FROM php:7.3-fpm

RUN apt-get update && apt-get install -y \
        libpq-dev \
        libfreetype6-dev \
        libmcrypt-dev \
        libicu-dev\
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo_pgsql pgsql \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl

RUN apt-get update && apt-get install -y \
        zlib1g-dev \
        libzip-dev \
    && docker-php-ext-install zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/bin --filename=composer --quiet

ENV COMPOSER_ALLOW_SUPERUSER 1

COPY ./ /var/www/

WORKDIR /var/www
RUN composer install --no-interaction --no-autoloader --no-suggest --prefer-dist --no-dev
RUN composer dumpautoload --no-interaction --optimize --no-dev
