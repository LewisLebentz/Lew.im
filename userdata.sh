#!/bin/bash
yum update -y
yum install -y httpd24 php56
yum install -y php56-devel php56-mysqlnd php56-pdo php56-mbstring php56-gd
yum install -y stress
cd /etc/httpd/conf
cp httpd.conf httpdconfbackup.conf
rm -rf httpd.conf
wget https://raw.githubusercontent.com/LewisLebentz/Lew.im/master/httpd.conf
cd /var/www/html
aws s3 sync --delete s3://lew-wp-code/ /var/www/html/
chmod -R 755 wp-content
wget https://raw.githubusercontent.com/LewisLebentz/Lew.im/master/htaccess
mv htaccess .htaccess
cd /var/www
chown -R apache.apache html
cd /etc
rm -rf crontab
wget https://raw.githubusercontent.com/LewisLebentz/Lew.im/master/crontab
service httpd start
chkconfig httpd on
