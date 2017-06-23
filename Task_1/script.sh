sudo yum install -y httpd php php-mysql mariadb mariadb-server
sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
sudo firewall-cmd --reload
sudo systemctl enable httpd
sudo systemctl start httpd
sudo systemctl enable mariadb.service
sudo systemctl start mariadb
sudo chmod -R 777 /var/www/html
cat << EOF | mysql
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('secret');
DELETE FROM mysql.user WHERE User='';
FLUSH PRIVILEGES;
EOF