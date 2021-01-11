#!/bin/sh

sudo apt update -y && sudo apt upgrade -y

echo "Installing Elasticsearch 7.x"
curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt update -y
sudo apt install elasticsearch -y
sudo sed -i 's/#network.host: 192.168.0.1/network.host: 127.0.0.1/g' /etc/elasticsearch/elasticsearch.yml
sudo systemctl start elasticsearch
sudo systemctl enable elasticsearch

echo "Installing NodeJS"
sudo apt install nodejs npm -y
sudo apt install build-essential -y
sudo npm install pm2@latest -g

echo "Installing Nginx"
sudo apt install nginx -y

echo "Creating CDRServer Base Directory"
sudo mkdir /etc/cdrserver/
sudo chown $USER:$USER /etc/cdrserver/

