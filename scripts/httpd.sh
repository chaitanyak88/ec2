#!/bin/bash

yum update -y

yum install java-11-openjdk -y

wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

yum install jenkins -y

systemctl enable jenkins
systemctl start jenkins

yum install epel-release -y

yum install ansible -y

echo "Jenkins initial admin password:"
cat /var/lib/jenkins/secrets/initialAdminPassword

echo "Installation completed!"
