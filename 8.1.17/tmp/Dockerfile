# Use the official PHP-FPM 8.1.17 base image
FROM php:8.1.14-fpm

# Install system dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        unixodbc-dev \
        libltdl-dev \
        libtool \
        libgpm2 \
        gnupg2 \
        curl \
    && rm -rf /var/lib/apt/lists/*

# Import the Microsoft GPG key
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

# Add the Microsoft SQL Server repository
RUN curl https://packages.microsoft.com/config/debian/11/prod.list > /etc/apt/sources.list.d/mssql-release.list

# Install the SQL Server driver and dependencies
RUN apt-get update \
    && ACCEPT_EULA=Y apt-get install -y --no-install-recommends \
        msodbcsql18 \
        mssql-tools18 \
        unixodbc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# RUN ln -s /usr/lib/x86_64-linux-gnu/libodbc.so /usr/lib/x86_64-linux-gnu/libodbc.la
# RUN ls -la /usr/lib/x86_64-linux-gnu/libltdl.so
# RUN ln -s /usr/lib/x86_64-linux-gnu/libltdl.so /usr/lib/x86_64-linux-gnu/libltdl.la


# Install the PHP SQL Server extension
RUN pecl install sqlsrv \
    && docker-php-ext-enable sqlsrv

# Optionally, install the PDO SQL Server extension
RUN pecl install pdo_sqlsrv \
    && docker-php-ext-enable pdo_sqlsrv

# Set the working directory
WORKDIR /var/www/html

# Copy your PHP application code into the container
COPY . /var/www/html

# Expose the port if needed
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm"]
