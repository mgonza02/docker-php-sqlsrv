FROM mgonza02/php-fpm:7.4.18-base-v2

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

VOLUME [/var/www/storage]
# # Expose port 9000 and start php-fpm server
# EXPOSE 9000
CMD ["php-fpm"]