
FROM nginx:stable

COPY ./build/prod/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY ./ /var/www/

WORKDIR /var/www