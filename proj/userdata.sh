#!/bin/bash
sudo apt update -y
sudo apt install -y postgresql postgresql-contrib

sudo systemctl enable postgresql
sudo systemctl start postgresql

# Create database, user, and set password
sudo -u postgres psql <<EOF
CREATE DATABASE pospcontest;
CREATE USER dbuser WITH ENCRYPTED PASSWORD '${var.db_password}';
GRANT ALL PRIVILEGES ON DATABASE pospcontest TO dbuser;
EOF

# Import schema from contestSchema.sql
sudo -u postgres psql -d pospcontest -f /home/ubuntu/contestSchema.sql