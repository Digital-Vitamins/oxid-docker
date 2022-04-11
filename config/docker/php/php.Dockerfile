FROM php:8.0.2-apache

RUN apt-get update -y
RUN apt-get install -y software-properties-common
RUN apt-get update
RUN a2enmod rewrite

# MySQL stuff - @todo: is this really needed?
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo
RUN docker-php-ext-enable pdo
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-enable pdo_mysql

RUN apt-get update -y && \
  apt-get install -y --no-install-recommends \
  less vim wget unzip rsync git default-mysql-client libzip-dev ssl-cert \
  libcurl4-openssl-dev libfreetype6 libjpeg62-turbo libpng-dev libjpeg-dev libxml2-dev libxpm4 && \
  apt-get clean && \
  apt-get autoremove -y && \
  rm -rf /var/lib/apt/lists/* && \
  echo "export TERM=xterm" >> /root/.bashrc

# GD
RUN docker-php-ext-configure gd --with-jpeg && \
  docker-php-ext-install -j$(nproc) zip bcmath soap pdo_mysql gd

# SOAP
RUN apt-get install -y libxml2-dev
RUN docker-php-ext-install soap

# BCMath
RUN docker-php-ext-install bcmath

# XDEBUG
RUN pecl install xdebug-3.1.4
RUN docker-php-ext-enable xdebug

# cURL
RUN apt-get upgrade -y
RUN apt-get install -y libpng-dev && apt-get install -y libcurl4-openssl-dev

RUN service apache2 restart

# Post server setup
RUN chmod -R 777 /var/www/html

# install composer
RUN php -r 'readfile("https://getcomposer.org/installer");' > composer-setup.php \
  && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
  && rm -f composer-setup.php \
  && chown www-data:www-data /var/www

# Create oxid eshop project
RUN useradd -u 1000 -o -m user
USER user
