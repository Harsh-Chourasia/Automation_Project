#!/bin/bash
myname=Harsh
timestamp=$(date '+%d%m%Y-%H%M%S')
s3_bucket=upgrad-harsh

#package update
sudo apt update -y

#Apache server installation, enabling and status check
sudo apt install apache2
sudo systemctl start apache2
sudo systemctl enable apache2

#Creating tar file
tar -cvf /tmp/${myname}-httpd-logs-${timestamp}.tar /var/log/apache2/*.log

aws s3 \
        cp /tmp/${myname}-httpd-logs-${timestamp}.tar \
        s3://${s3_bucket}/${myname}-httpd-logs-${timestamp}.tar
