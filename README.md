# vagrant-multi-vm-setup

This Vagrant-based project provisions a three-tier infrastructure with a web server, database server, and monitoring server, each set up automatically using shell provisioning scripts.

    Web Server (Ubuntu Bionic 64)
        Installs and configures Nginx to serve a static webpage.
        Configured to be accessible on port 8080 (forwarded to port 80).

    Database Server (Ubuntu Focal 64)
        Installs MySQL and sets up a sample database (test_db) with a users table.
        Inserts sample data (Alice and Bob) and allows remote access from the web server.
        Uses environment variables for database credentials to enhance security.

    Monitoring Server (Ubuntu Bionic 64)
        Installs and configures Prometheus to monitor both the web and database servers.
        Uses static targets to collect metrics from Nginx (HTTP) and MySQL.

Key Features

✅ Fully automated provisioning using shell scripts.
✅ Private network setup for secure VM communication.
✅ Database access enabled for the web server.
✅ Prometheus monitoring integration for system metrics.

This setup provides a lightweight, reproducible development environment for testing and learning about multi-tier architectures, automation, and monitoring using Vagrant. 🚀