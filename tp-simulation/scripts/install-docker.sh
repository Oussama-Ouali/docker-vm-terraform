#!/bin/bash
set -e

apt-get update -y
apt-get install -y docker.io
systemctl enable --now docker

if ! docker container inspect web >/dev/null 2>&1; then
  docker run -d --name web \
    --restart unless-stopped \
    -p 8080:80 nginx:alpine
fi

docker --version
docker ps
