FROM php:7.3-cli

RUN pecl install -o -f redis \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable redis

RUN apt-get update && apt-get install -y libpq-dev unzip \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo_pgsql

COPY ./build/prod/php-cli/conf/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

WORKDIR /var/www

