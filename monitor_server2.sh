#!/bin/bash

sudo apt-get update
sudo apt-get install -y prometheus

# configure yml file
sudo tee /etc/prometheus/prometheus.yml > /dev/null <<EOF
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: "web_ser"
    static_configs:
      - targets: ["192.168.56.10:9100"]

  - job_name: "database_ser"
    static_configs:
      - targets: ["192.168.56.11:9100"]
EOF

# changing owner
sudo chown prometheus:prometheus /etc/prometheus/prometheus.yml

# restaring for the changes to be applied
sudo systemctl daemon-reload
sudo systemctl restart prometheus
sudo systemctl enable prometheus
