FROM php:8-cli-alpine

RUN apk add --no-cache curl
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Install MySQL extension, as WP-CLI needs to access to the WordPress database
RUN docker-php-ext-install mysqli

USER www-data

ENTRYPOINT [ "wp" ]
