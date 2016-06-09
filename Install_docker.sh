#!/usr/bin/env bash

# Install docker
sudo echo "Installing docker ................"
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo touch /etc/apt/sources.list.d/docker.list
sudo echo 'deb https://apt.dockerproject.org/repo ubuntu-trusty main' >> /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get purge lxc-docker
sudo apt-get update
sudo apt-get install linux-image-extra-$(uname -r)
apt-get install apparmor
sudo apt-get update
sudo apt-get install -y docker-engine
sudo service docker start

# Add docker group and logout and login user
sudo echo "Adding user to docker group ................"
sudo groupadd docker
sudo usermod -aG docker $(whoami)

# Install docker-compose
sudo echo "Installing docker-compose ................"
sudo apt-get update
sudo apt-get -y install python-pip
sudo pip install docker-compose

# Creating ansible docker container
sudo echo "Creating ansible docker container ................"
docker-compose up -d