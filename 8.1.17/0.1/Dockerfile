FROM php:8.1.17-fpm
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
    curl \
    git unzip libpq-dev libicu-dev libzip-dev gnupg \
    zlib1g-dev g++ libpng-dev libonig-dev unixodbc-dev
# Install extensions
RUN docker-php-ext-install intl pdo_mysql mbstring zip exif pcntl
# RUN docker-php-ext-configure gd --with-gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/

RUN apt-get install --no-install-recommends --no-install-suggests  -y \
    libwebp-dev \
    # libxpm-dev \
    # libvpx-dev \
    libfreetype6-dev\
    libjpeg-dev\
    libmcrypt-dev\
    libmemcached-dev\
    libpng-dev \
    libtool \
    libxml2-dev\
    libmagickwand-dev\
    libkrb5-dev\
    libbz2-dev\
    libtidy-dev\
    libc-client-dev

RUN docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg --with-webp 
RUN docker-php-ext-install gd
RUN docker-php-ext-install mysqli

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests  -y gnupg2
RUN apt-get clean && rm -rf /var/lib/apt/lists/*


# RUN apt install -y gpg \
#     && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
#     && curl https://packages.microsoft.com/config/ubuntu/22.04/prod.list > /etc/apt/sources.list.d/mssql-release.list \
#     && apt update

RUN pecl config-set php_ini /etc/php/8.1/fpm/php.ini
RUN docker-php-ext-install pdo intl gd mbstring zip 

# RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

# RUN curl https://packages.microsoft.com/config/debian/11/prod.list > /etc/apt/sources.list.d/mssql-release.list

# RUN apt-get update
# RUN ACCEPT_EULA=Y apt-get install -y msodbcsql18
# # optional: for bcp and sqlcmd
# RUN ACCEPT_EULA=Y apt-get install -y mssql-tools18
# RUN echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bash_profile
# RUN echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc 
# # source ~/.bashrc
# # RUN source ~/.bashrc
# RUN bash ~/.bashrc
# # RUN apt-get update && apt-get install   -y unixodbc-dev
 

# optional: kerberos library for debian-slim distributions
# RUN apt-get update && apt-get install  --no-install-recommends --no-install-suggests  -y libgssapi-krb5-2

# RUN pecl install sqlsrv pdo_sqlsrv  
    # && docker-php-ext-enable sqlsrv pdo_sqlsrv 
# RUN pecl install sqlsrv
# RUN pecl install pdo_sqlsrv 

# RUN echo  "; priority=20\nextension=sqlsrv.so\n" > /usr/local/etc/php/conf.d/sqlsrv.ini
# RUN echo  "; priority=30\nextension=pdo_sqlsrv.so\n" > /usr/local/etc/php/conf.d/pdo_sqlsrv.ini


RUN apt install -y gpg \
    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && curl https://packages.microsoft.com/config/debian/11/prod.list > /etc/apt/sources.list.d/mssql-release.list \
    && apt update

RUN ACCEPT_EULA=Y apt install -y msodbcsql18 mssql-tools18 \
    && apt install -y unixodbc-dev \
    && pecl install sqlsrv \
    && docker-php-ext-enable sqlsrv

#composer  
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#sockets
RUN docker-php-ext-install sockets  

# Install redis extension
RUN pecl install redis
# Expose port 9000 and start php-fpm server



EXPOSE 9000
CMD ["php-fpm"]

# tag mgonza02/phpfpm-8.1.17-alpine:0.1.1