FROM mgonza02/php-fpm:7.4.18-composer-sqlsrv-v1
WORKDIR /var/www
 

RUN apt-get update && apt-get install -y libpq-dev
RUN docker-php-ext-install pdo pdo_pgsql pgsql

RUN echo  "; priority=20\nextension=pgsql\n" > /usr/local/etc/php/conf.d/pg.ini
RUN echo  "; priority=30\nextension=pdo_pgsql\n" > /usr/local/etc/php/conf.d/pdo_pg.ini


# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]