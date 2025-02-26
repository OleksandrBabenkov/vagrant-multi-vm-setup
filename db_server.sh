#!/bin/bash
set -e  # Exit immediately if any command fails

# Install MySQL Server and Client
sudo apt-get update
sudo apt-get install -y mysql-server mysql-client
sudo apt-get install -y prometheus-node-exporter
# Allow remote connections by modifying bind-address
sudo sed -i "s/^bind-address\s*=.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf

# Restart MySQL service to apply changes
sudo systemctl restart mysql
sudo systemctl enable mysql
sudo systemctl enable prometheus-node-exporter
# Create database and user
sudo mysql -e "
CREATE DATABASE IF NOT EXISTS test_db;
USE test_db;
CREATE TABLE IF NOT EXISTS users (id INT PRIMARY KEY, name VARCHAR(50));
INSERT INTO users (id, name) VALUES (1, 'Alice'), (2, 'Bob');
CREATE USER IF NOT EXISTS 'webuser'@'192.168.56.10' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON test_db.* TO 'webuser'@'192.168.56.10';
FLUSH PRIVILEGES;
"
