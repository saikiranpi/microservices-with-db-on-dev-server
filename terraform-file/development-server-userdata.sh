#! /bin/bash
yum update -y
hostnamectl set-hostname Development-Server
amazon-linux-extras install docker -y
systemctl start docker
systemctl enable docker
usermod -a -G docker ec2-user
curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" \
-o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
yum install git -y
yum install java-11-amazon-corretto -y
git clone https://github.com/cmakkaya/microservices-with-db-on-dev-server.git
cd microservices-with-db-on-dev-server
git checkout dev