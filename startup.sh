#!/usr/bin/env bash

# Install docker
echo "Installing docker ................"
apt-get update
apt-get install apt-transport-https ca-certificates
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
touch /etc/apt/sources.list.d/docker.list
echo 'deb https://apt.dockerproject.org/repo ubuntu-trusty main' >> /etc/apt/sources.list.d/docker.list
apt-get update
apt-get purge lxc-docker
apt-get update
apt-get install linux-image-extra-$(uname -r)
apt-get install apparmor
apt-get update
apt-get install -y docker-engine
service docker start

# Add docker group and logout and login user
echo "Adding user to docker group ................"
groupadd docker
usermod -aG docker $(whoami)

# Install docker-compose
echo "Installing docker-compose ................"
apt-get update
apt-get -y install python-pip
pip install docker-compose

# Creating ansible docker container
#echo "Creating ansible docker container ................"
#docker-compose up -d

# Install ansible
echo "Installing ansible ................"
sudo apt-get update && \
sudo apt-get install --no-install-recommends -y software-properties-common && \
sudo apt-add-repository ppa:ansible/ansible && \
sudo apt-get update && \
sudo apt-get install -y ansible
