#!/bin/bash
set -e

echo "Updating Ubuntu..."
apt-get update -y

echo "Installing Docker..."
apt-get install -y docker.io

echo "Starting Docker..."
systemctl enable --now docker

echo "Deploying Nginx..."

docker run -d \
  --name web \
  --restart unless-stopped \
  -p 8080:80 \
  nginx:alpine

echo "Docker installation completed!"
docker --version
docker ps