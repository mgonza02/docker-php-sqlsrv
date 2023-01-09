FROM php:8.1.14-fpm
WORKDIR /var/www

# Install dependencies
RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests  -y \
    build-essential \
    libicu-dev \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    # vim \
    unzip \
    # git \
    openssl \
    libonig-dev \
    libzip-dev \
    curl
# Install extensions
RUN docker-php-ext-install intl pdo_mysql mbstring zip exif pcntl
# RUN docker-php-ext-configure gd --with-gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/
RUN docker-php-ext-install gd
RUN docker-php-ext-install mysqli

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests  -y gnupg2

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

RUN curl https://packages.microsoft.com/config/debian/11/prod.list > /etc/apt/sources.list.d/mssql-release.list

RUN apt-get update
RUN ACCEPT_EULA=Y apt-get install -y msodbcsql18
# optional: for bcp and sqlcmd
RUN ACCEPT_EULA=Y apt-get install -y mssql-tools18
RUN echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bash_profile
RUN echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc
RUN exec bash

# RUN source ~/.bashrc
# optional: for znixODBC development headers
RUN apt-get update && apt-get install  --no-install-recommends --no-install-suggests  -y unixodbc-dev
# optional: kerberos library for debian-slim distributions
RUN apt-get update && apt-get install  --no-install-recommends --no-install-suggests  -y libgssapi-krb5-2


RUN pecl config-set php_ini /etc/php/8.1/fpm/php.ini
RUN pecl install sqlsrv
RUN pecl install pdo_sqlsrv 
RUN echo  "; priority=20\nextension=sqlsrv.so\n" > /usr/local/etc/php/conf.d/sqlsrv.ini
RUN echo  "; priority=30\nextension=pdo_sqlsrv.so\n" > /usr/local/etc/php/conf.d/pdo_sqlsrv.ini


#composer  
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]