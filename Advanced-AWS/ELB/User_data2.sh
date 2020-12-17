#! bin/bash
yum install httpd -y
echo "<h1> This page is from server-2 launched using terraform in a VPC </h1>" > /var/www/html/index.html
service httpd start
chkconfig httpd on
