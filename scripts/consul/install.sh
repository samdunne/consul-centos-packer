#!/bin/bash
set -e

echo "Installing dependencies..."
sudo yum install -y unzip

echo "Fetching Consul..."
cd /tmp
wget https://dl.bintray.com/mitchellh/consul/0.5.2_linux_amd64.zip -O consul.zip

echo "Installing Consul..."
unzip consul.zip >/dev/null
sudo chmod +x consul
sudo mv consul /usr/local/bin/consul
sudo mkdir -p /etc/consul.d
sudo mkdir -p /var/lib/consul
sudo mkdir -p /mnt/consul

echo "Configuring Consul..."
sudo mv /tmp/consul.json /etc/consul.d/consul.json

echo "Installing service..."
sudo mv /tmp/consul.init /etc/init.d/consul
sudo chmod 0755 /etc/init.d/consul

echo "Downloading web ui..."
cd /tmp
wget https://releases.hashicorp.com/consul/0.5.2/consul_0.5.2_web_ui.zip -O web.zip

echo "Installing web ui..."
unzip web.zip > /dev/null
sudo mkdir /opt/consul
sudo mv dist/ /opt/consul/
