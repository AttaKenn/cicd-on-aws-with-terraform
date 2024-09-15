#!/bin/bash

# Install AWS CLI v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip
unzip awscliv2.zip
sudo ./aws/install

# Install latest stable version of Docker CLI & Docker Engine
curl -fsSL https://get.docker.com -o install-docker.sh
sudo sh install-docker.sh

# Install Helm
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm -y
curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.7.2/docs/install/iam_policy.json

# Install Kubectl
 curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
 sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Install Java
sudo apt update
sudo apt install fontconfig openjdk-17-jre -y

# Install Jenkins
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins -y
sudo usermod -aG docker jenkins

# Wait for Jenkins to start
sleep 15


# Get the initial admin password
INITIAL_PASSWORD=$(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)

JENKINS_ADMIN_PASSWD=$(aws secretsmanager get-secret-value --secret-id automatjenkinsadmin --query SecretString --output text --region eu-west-1)

# Download Jenkins CLI
wget http://localhost:8080/jnlpJars/jenkins-cli.jar

# Change the password using Jenkins CLI
echo "jenkins.model.Jenkins.instance.securityRealm.createAccount(\"admin\", \"$JENKINS_ADMIN_PASSWD\")" | java -jar jenkins-cli.jar -s http://localhost:8080 -auth admin:$INITIAL_PASSWORD groovy =
