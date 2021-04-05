#!/usr/bin/env bash
sudo apt-get update
sudo apt-get -y install nfs-kernel-server
sudo mkdir -p /mnt/nfs_share
sudo chown -R nobody:nogroup /mnt/nfs_share
sudo chmod 777 /mnt/nfs_share
echo "/mnt/nfs_share  192.168.1.0/24(rw,sync,no_subtree_check)" >> /etc/exports
sudo exportfs -a
sudo systemctl restart nfs-kernel-server
sudo ufw allow from 192.168.1.0/24 to any port nfs
sudo ufw enable
sudo ufw status
