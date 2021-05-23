FROM php:7.4-fpm
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
# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]