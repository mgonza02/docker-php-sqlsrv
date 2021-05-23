FROM mgonza02/php-fpm:7.4.18-composer-v1
WORKDIR /var/www

RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests  -y gnupg2

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

RUN curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list > /etc/apt/sources.list.d/mssql-release.list

RUN apt-get update
RUN ACCEPT_EULA=Y apt-get install -y msodbcsql17

# optional: for bcp and sqlcmd
RUN ACCEPT_EULA=Y apt-get install -y mssql-tools
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
RUN exec bash

# optional: for unixODBC development headers
RUN apt-get update && apt-get install  --no-install-recommends --no-install-suggests  -y unixodbc-dev
# optional: kerberos library for debian-slim distributions
RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests  -y libgssapi-krb5-2
RUN pecl config-set php_ini /etc/php/7.4/fpm/php.ini
RUN pecl install sqlsrv
RUN pecl install pdo_sqlsrv 
RUN echo  "; priority=20\nextension=sqlsrv.so\n" > /usr/local/etc/php/conf.d/sqlsrv.ini
RUN echo  "; priority=30\nextension=pdo_sqlsrv.so\n" > /usr/local/etc/php/conf.d/pdo_sqlsrv.ini


# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]