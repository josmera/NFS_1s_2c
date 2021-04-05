#!/usr/bin/env bash
sudo apt-get update
sudo apt-get -y install nfs-common
sudo mkdir -p /mnt/nfs_clientshare
sudo mount 192.168.1.2:/mnt/nfs_share  /mnt/nfs_clientshare
