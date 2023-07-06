FROM php:8.1.17-fpm
WORKDIR /var/www

RUN set -eux; \
  apt-get update; \
  apt-get install -y --no-install-recommends \
    gnupg \
    wget \
    curl \
  ; \
  curl -SL --progress-bar https://packages.microsoft.com/keys/microsoft.asc | apt-key add -; \
  curl -SL --progress-bar https://packages.microsoft.com/config/ubuntu/22.04/prod.list > /etc/apt/sources.list.d/mssql-release.list; \
  apt-get update; \
  ACCEPT_EULA=Y apt-get install -y msodbcsql18; \
  apt-get install -y unixodbc-dev; \
  sed -i -E 's/(CipherString\s*=\s*DEFAULT@SECLEVEL=)2/\11/' /etc/ssl/openssl.cnf; \
  rm -rf /var/lib/apt/lists/*;

RUN set -eux; \
  pecl install \
    sqlsrv \
    pdo_sqlsrv \
  ; \
  docker-php-ext-enable \
    sqlsrv \
    pdo_sqlsrv \
  ; \
  echo "extension= pdo_sqlsrv.so" >> `php --ini | grep "Loaded Configuration" | sed -e "s|.*:\s*||"`; \
  echo "extension= sqlsrv.so" >> `php --ini | grep "Loaded Configuration" | sed -e "s|.*:\s*||"`;  

#composer  
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#sockets
RUN docker-php-ext-install sockets  

# Install redis extension
RUN pecl install redis
#for intl

RUN set -eux; \
  apt-get update; \
  apt-get install -y --no-install-recommends \
    libicu-dev \
    # build-essential \
    libonig-dev 
RUN set -eux; \
  apt-get install -y --no-install-recommends \
    libpq-dev \ 
    libicu-dev \
    libzip-dev
# install mysql 
RUN docker-php-ext-install intl  mbstring zip exif pcntl
RUN docker-php-ext-install pdo_mysql  mysqli 


# Expose port 9000 and start php-fpm server

# tag mgonza02/phpfpm-8.1.17-alpine:0.2.1 