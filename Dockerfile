FROM quay.io/continuouspipe/symfony-php7.1-nginx:stable
ARG GITHUB_TOKEN=
ARG SYMFONY_ENV=prod

RUN apt-get update \
    && apt-get install -y php7.1-sqlite3 \
    && apt-get clean

RUN echo "extension=sqlite3.so" > /etc/php/7.1/fpm/php.ini

COPY . /app/
RUN container build
