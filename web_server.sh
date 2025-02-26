#!/bin/bash


sudo apt-get update
sudo apt-get install -y nginx mysql-client prometheus-node-exporter

# сторінка
echo "<h1>Welcome to the Web Server</h1>" | sudo tee /var/www/html/index.html

# рестарт сервісів
sudo systemctl restart nginx
sudo systemctl enable nginx
sudo systemctl enable prometheus-node-exporter

# створення файлу
sudo touch /var/log/db_query.log
sudo chmod 666 /var/log/db_query.log

#the db_query.sh script
sudo tee /usr/local/bin/db_query.sh > /dev/null <<EOF
#!/bin/bash
mysql -u webuser -p'password' -h 192.168.56.11 -D test_db -e "SELECT * FROM users;" >> /var/log/db_query.log
EOF

# додаю execute rights
sudo chmod +x /usr/local/bin/db_query.sh
