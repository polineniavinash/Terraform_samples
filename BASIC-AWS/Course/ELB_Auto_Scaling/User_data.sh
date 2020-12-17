#! bin/bash
yum install httpd -y
MYIP=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
echo "<h1> This page is from servers launched using terraform in a VPC </h1> "$MYIP > /var/www/html/index.html
service httpd start
chkconfig httpd on
