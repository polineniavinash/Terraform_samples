#! bin/bash
apt-get update
apt-get -y install nginx
#this command will work  for ubuntu
MYIP=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
echo "<h1> This page is from servers launched using terraform in a VPC </h1> "$MYIP > /var/www/html/index.html
service httpd start
chkconfig httpd on
# yum update -y
# yum install httpd -y
# service httpd start
# chkconfig httpd on
# cd /var/www/html
# echo "<html><h1>Hello World from one of the servers in ELB</h1></html>" > index.html






# apt-get update
# apt-get -y install nginx
# MYIP=`ifconfig | grep 'addr:10' | awk '{ print $2 }' | cut -d ':' -f2`
# echo 'this is: '$MYIP > /var/www/html/index.html
