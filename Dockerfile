FROM php:7.3-alpine

RUN apk --update add tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata && \
    rm -rf /var/cache/apk/*

RUN docker-php-ext-install mbstring

# COPY php.ini-development /usr/local/etc/php/php.ini
# phpフォルダのDockerfileをディレクトリ直下に移動したので/php/を付け足した
# heroku container:push web -a [アプリ名] する時は直下にDocerfileが必要

COPY /php/php.ini-development /usr/local/etc/php/php.ini

WORKDIR /work

CMD ["php", "-S", "0.0.0.0:8000", "-t", "/work"]
