FROM mgonza02/php-fpm-8.1-sqlsrv-gd:1.0.1

RUN apt-get update

# clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

#instyall node
RUN apt-get update && apt-get install -y nodejs npm

# WORKDIR /var/www

# ARG user
# ARG uid

# # Add user for laravel application
# RUN useradd -G www-data,root -u $uid $user
# RUN mkdir -p /home/$user/.composer && chown -R $user:$user /home/$user

# RUN mkdir -p storage

# RUN chmod -R 777 storage

# USER ${user}
