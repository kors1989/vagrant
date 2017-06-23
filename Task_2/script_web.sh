sudo yum install -y httpd php php-mysql
sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
sudo firewall-cmd --reload
sudo systemctl enable httpd
sudo systemctl start httpd
sudo chmod -R 777 /var/www/html
setsebool -P httpd_can_network_connect_db on
