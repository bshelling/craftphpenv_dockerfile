FROM php:7.1.31-apache
RUN apt-get update;
RUN apt-get install -y libzip-dev && pecl install zip && docker-php-ext-enable zip && docker-php-ext-install pdo_mysql \ 
    && docker-php-ext-enable pdo_mysql \
    && apt-get install -y libmagickwand-dev && apt-get install -y vim \
    && pecl install imagick && docker-php-ext-enable imagick && a2enmod rewrite;
COPY ./sites-enabled/000-default.conf /etc/apache2/sites-enabled/
COPY ./config/php.ini /usr/local/etc/php/conf.d/
EXPOSE 80 443