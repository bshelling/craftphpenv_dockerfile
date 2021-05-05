FROM php:7.4.18-apache
RUN apt-get update;
RUN apt-get install -y libzip-dev libpq-dev && pecl install zip && docker-php-ext-enable zip && docker-php-ext-install pdo_mysql pdo pdo_pgsql pgsql \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && apt-get install -y libmagickwand-dev && apt-get install -y vim \
    && pecl install imagick && docker-php-ext-enable imagick && a2enmod rewrite;
COPY ./sites-enabled/000-default.conf /etc/apache2/sites-enabled/
COPY ./config/php.ini /usr/local/etc/php/conf.d/
EXPOSE 80 443