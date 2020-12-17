#! bin/bash
yum install httpd -y
#echo "<h1> This page is from servers launched using terraform in a VPC </h1>" > /var/www/html/index.html
MYIP=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
echo "<h1> This page is from servers launched using terraform in a VPC </h1> "$MYIP > /var/www/html/index.html
service httpd start
chkconfig httpd on






# apt-get update
# apt-get -y install nginx
# MYIP=`ifconfig | grep 'addr:10' | awk '{ print $2 }' | cut -d ':' -f2`
# echo 'this is: '$MYIP > /var/www/html/index.html
