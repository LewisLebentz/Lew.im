#!/bin/bash
yum update -y
aws s3 sync --delete s3://lew-wordpress-code/ /var/www/html/
cd /var/www/
chown -R apache.apache html
cd /var/www/html
chmod -R 755 wp-content
