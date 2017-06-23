sudo yum install -y mariadb mariadb-server
sudo systemctl enable mariadb.service
sudo systemctl start mariadb
setsebool -P httpd_can_network_connect_db on
cat << EOF | mysql
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('secret');
create user 'root'@'192.168.100.13' identified by 'secret';
DELETE FROM mysql.user WHERE User='';
FLUSH PRIVILEGES;
EOF
sudo firewall-cmd --zone=public --add-port=3306/tcp --permanent
sudo firewall-cmd --reload