FROM php:8.1.14-fpm-alpine

WORKDIR /var/www

# Install system dependencies
RUN apk update && apk add --no-cache \
    build-base \
    libxml2-dev \
    libzip-dev \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    libwebp-dev \
    libmcrypt-dev \
    unixodbc-dev \
    libgomp \
    icu-dev

# Install PHP extensions
RUN docker-php-ext-install \
    pdo_mysql \
    intl \
    zip \
    opcache \
    bcmath \
    exif \
    pcntl \
    gd

RUN apk update && apk add --no-cache \
    unixodbc-dev \
    g++ \
    make \
    autoconf


# Install SQL Server drivers
RUN curl -O https://download.microsoft.com/download/1/f/f/1fffb537-26ab-4947-a46a-7a45c27f6f77/msodbcsql18_18.2.1.1-1_amd64.apk
RUN curl -O https://download.microsoft.com/download/1/f/f/1fffb537-26ab-4947-a46a-7a45c27f6f77/mssql-tools18_18.2.1.1-1_amd64.apk

RUN apk add --allow-untrusted msodbcsql18_18.2.1.1-1_amd64.apk
RUN apk add --allow-untrusted mssql-tools18_18.2.1.1-1_amd64.apk

#composer  
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#sockets
RUN docker-php-ext-install sockets && docker-php-ext-enable sockets

# Install redis extension
RUN pecl install redis && docker-php-ext-enable redis

# sqlserver drivers
RUN pecl install sqlsrv && docker-php-ext-enable sqlsrv
RUN pecl install pdo_sqlsrv && docker-php-ext-enable pdo_sqlsrv

RUN echo  "; priority=20\nextension=sqlsrv.so\n" > /usr/local/etc/php/conf.d/sqlsrv.ini
RUN echo  "; priority=30\nextension=pdo_sqlsrv.so\n" > /usr/local/etc/php/conf.d/pdo_sqlsrv.ini


# Configure PHP
# COPY php.ini /usr/local/etc/php/

RUC echo -e "openssl_conf = openssl_init\n[openssl_init]\nssl_conf = ssl_sect\n[ssl_sect]\nssl_version = TLSv1.0" > openssl.cnf

# Expose port 9000 and start PHP-FPM server
EXPOSE 9000
CMD ["php-fpm"]
