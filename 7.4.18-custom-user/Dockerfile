FROM mgonza02/php-fpm:7.4.18-composer-v1
WORKDIR /var/www

ARG user
ARG uid

# Add user for laravel application
RUN useradd -G www-data,root -u $uid $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user

# Change current user to www
USER ${user}

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]