FROM php:7.4-apache

RUN docker-php-ext-install pdo_mysql
RUN a2enmod headers
RUN a2enmod rewrite
RUN a2enmod autoindex

RUN apt-get update -qq && apt-get upgrade -qq
RUN apt-get install -qq ffmpeg python3 wget curl net-tools unzip python3-dev python3-pip
RUN python3 -m pip install --upgrade youtube-dl

RUN apt-get install -y libzip-dev zip && docker-php-ext-install zip
