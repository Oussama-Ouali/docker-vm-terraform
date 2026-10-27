#!/bin/bash
set -e

mkdir -p inventory

HOST=$(vagrant ssh-config | awk '$1=="HostName"{print $2;exit}')
PORT=$(vagrant ssh-config | awk '$1=="Port"{print $2;exit}')
USER=$(vagrant ssh-config | awk '$1=="User"{print $2;exit}')
KEY=$(vagrant ssh-config | awk '$1=="IdentityFile"{print $2;exit}')

cat > inventory/hosts.ini <<INVENTORY
[web]
docker-vm ansible_host=$HOST ansible_port=$PORT ansible_user=$USER ansible_ssh_private_key_file=$KEY ansible_connection=ssh
INVENTORY

echo "Inventory generated successfully"
cat inventory/hosts.ini
