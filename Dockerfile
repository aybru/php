FROM php:8-fpm
RUN set -x \
&& apt-get update \
&& apt-get install -y \
libfreetype6-dev libjpeg62-turbo-dev libpng-dev libwebp-dev libxpm-dev \
&& apt-get clean \
&& docker-php-ext-configure gd --with-webp --with-jpeg --with-xpm --with-freetype \
&& docker-php-ext-configure mysqli --with-mysql-sock=/run/mysqld/mysqld.sock \
&& docker-php-ext-install -j$(nproc) bcmath exif gd mysqli pdo_mysql \
&& docker-php-ext-enable opcache \
&& docker-php-source delete
