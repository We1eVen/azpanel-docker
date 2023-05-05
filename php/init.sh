#!/bin/bash
sleep 20s
cd /var/www/html/azpanel
mysql -h mysql -P 3306 -u root -pazpanel -e "
create database azpanel;
use azpanel;
source azure.sql;
source config.sql;
exit"
php think createAdmin --email $EMAIL --passwd $LOGINPASSWD
php-fpm
