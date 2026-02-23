#!/bin/bash
yum update -y && yum install -y httpd php php-mysqli mariadb105
systemctl start httpd && systemctl enable httpd
usermod -a -G apache ec2-user && chown -R ec2-user:apache /var/www && chmod 2775 /var/www
echo "${payload_app}" | base64 -d > /var/www/html/index.php
sed -i "s|DB_HOST_PLACEHOLDER|${db_address}|g;s|DB_USER_PLACEHOLDER|${db_username}|g;s|DB_PASS_PLACEHOLDER|${db_password}|g" /var/www/html/index.php
cat > /tmp/db.sql <<'EOF'
CREATE DATABASE IF NOT EXISTS cadastro_db;
USE cadastro_db;
CREATE TABLE IF NOT EXISTS clientes (id INT AUTO_INCREMENT PRIMARY KEY,nome VARCHAR(100),sobrenome VARCHAR(100),idade INT,pais VARCHAR(100),telefone VARCHAR(20),data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
EOF
for i in {1..10}; do
  mysql -h "${db_address}" -u "${db_username}" -p"${db_password}" < /tmp/db.sql 2>/dev/null && break
  sleep 3
done
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
AVAILABILITY_ZONE=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)
PRIVATE_IP=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
sed -i "s/INSTANCE_ID_PLACEHOLDER/$INSTANCE_ID/;s/PRIVATE_IP_PLACEHOLDER/$PRIVATE_IP/;s/AVAILABILITY_ZONE_PLACEHOLDER/$AVAILABILITY_ZONE/" /var/www/html/index.php