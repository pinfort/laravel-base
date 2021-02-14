FROM php:7.4

RUN apt-get update -yqq
# Prep for Node
RUN apt-get install gnupg apt-utils -yqq
# Upgrade to Node 12
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
# Install dependencies
RUN apt-get install git nodejs libcurl4-gnutls-dev libicu-dev libmcrypt-dev libvpx-dev libjpeg-dev libpng-dev libxpm-dev zlib1g-dev libfreetype6-dev libxml2-dev libexpat1-dev libbz2-dev libgmp3-dev libldap2-dev unixodbc-dev libpq-dev libsqlite3-dev libaspell-dev libsnmp-dev libpcre3-dev libtidy-dev libonig-dev libzip-dev -yqq
# Install php extensions
RUN docker-php-ext-install pdo_mysql intl gd zip bz2 opcache
# Install & enable Xdebug for code coverage reports
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug
