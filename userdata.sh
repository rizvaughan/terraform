#!/usr/bin/bash

yum install httpd -y
yum install mysql -y
amazon-linux-extras enable php7.4
yum install -y php-cli php-pdo php-fpm php-json php-mysqlnd
cd /var/www/html/
wget http://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
echo "<VirtualHost *:80>
"healthcheck" : "passed"
</VirtualHost>" > /var/www/html/index.html
systemctl start httpd
systemctl enable httpd
