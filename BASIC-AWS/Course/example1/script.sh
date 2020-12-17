#! /bin/bash
yum install httpd -y
service httpd start
chkconfig httpd on
echo "<h1> Hello world from web server! </h1>" > /var/www/html/index.html
