FROM php:7.4-fpm
WORKDIR /workspace
COPY init.sh init.sh
RUN apt update && apt install wget git unzip mariadb-client -y && \
    wget https://getcomposer.org/download/latest-stable/composer.phar && chmod +x composer.phar && mv composer.phar /usr/local/bin/composer && \
    wget https://raw.githubusercontent.com/azpanel/azpanel/master/database/azure.sql && \
    wget https://raw.githubusercontent.com/azpanel/azpanel/master/database/config.sql && \
    chmod +x * && \
    mkdir -p /var/www/html/azpanel && cd /var/www/html/azpanel && \
#    chattr -i .user.ini && \
#    rm .user.ini && \
    git clone https://github.com/azpanel/azpanel.git . && \
    chmod 777 -R * && \
#    chown www -R * && \
    composer install && \
    cp .example.env .env && \
    sed -i "s/127\.0\.0\.1/mysql/g;s/test/azpanel/g;s/username/root/g;s/password/azpanel/g" .env

ENTRYPOINT ["/workspace/init.sh"]
