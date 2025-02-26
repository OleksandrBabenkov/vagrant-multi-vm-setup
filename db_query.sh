#!/bin/bash

# щмінні для підключення
DB_HOST="192.168.56.11"
DB_USER="webuser"
DB_PASS="password"
DB_NAME="test_db"
LOG_FILE="/var/log/db_query.log"

# перевірка файлів
sudo touch $LOG_FILE
sudo chmod 666 $LOG_FILE

# запускаю запит і перевіряю файл
echo "[$(date)] Running database query..." | sudo tee -a $LOG_FILE
mysql -u$DB_USER -p$DB_PASS -h$DB_HOST -D$DB_NAME -e "SELECT * FROM users;" 2>&1 | sudo tee -a $LOG_FILE
echo "[$(date)] Query completed." | sudo tee -a $LOG_FILE
