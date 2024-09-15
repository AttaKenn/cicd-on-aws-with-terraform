# Terraform Provider
region                   = "eu-west-1"
profile                  = "default"
shared_config_files      = ["~/.aws/config"]
shared_credentials_files = ["~/.aws/credentials"]

# Management VPC
management_vpc_name                   = "management_vpc"
management_vpc_cidr                   = "192.168.0.0/16"
management_vpc_azs                    = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
management_vpc_private_subnets        = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
management_vpc_public_subnets         = ["192.168.101.0/24", "192.168.102.0/24", "192.168.103.0/24"]
management_vpc_enable_nat_gateway     = true
management_vpc_single_nat_gateway     = true
management_vpc_one_nat_gateway_per_az = false
management_private_sg_name            = "management_private-sg"
management_public_sg_name             = "management_public-sg"
management_vpc_tags = {
  Terraform   = "true"
  Environment = "dev"
}

# Management VPC Private Security Group
sg-private-mgmt-ingress-port-0-cidr = ["192.168.0.0/16", "172.16.0.0/16"]
sg-private-mgmt-tags = {
  Name        = "private_instances"
  Terraform   = true
  Environment = "dev"
}

# Management VPC Public Security Group
sg-public-mgmt-ingress-port-80-cidr   = ["0.0.0.0/0"]
sg-public-mgmt-ingress-port-443-cidr  = ["0.0.0.0/0"]
sg-public-mgmt-ingress-port-22-cidr   = ["0.0.0.0/0"]
sg-public-mgmt-ingress-port-943-cidr  = ["0.0.0.0/0"]
sg-public-mgmt-ingress-port-1194-cidr = ["0.0.0.0/0"]
sg-public-mgmt-tags = {
  Name      = "allow_http_https_ssh_udp"
  Terraform = true
}

# Application VPC
application_vpc_name                    = "application_vpc"
application_vpc_cidr                    = "172.16.0.0/16"
application_vpc_azs                     = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
application_vpc_private_subnets         = ["172.16.1.0/24", "172.16.2.0/24", "172.16.3.0/24"]
application_vpc_public_subnets          = ["172.16.101.0/24", "172.16.102.0/24", "172.16.103.0/24"]
application_vpc_map_public_ip_on_launch = true
application_vpc_enable_nat_gateway      = true
application_vpc_single_nat_gateway      = true
application_vpc_one_nat_gateway_per_az  = false

application_vpc_tags = {
  Terraform   = "true"
  Environment = "dev"
}

application_vpc_public_subnet_tags = {
  "kubernetes.io/cluster/alpha-eks-cluster" = "shared"
  # "kubernetes.io/role/elb"                       = "1"
  "kubernetes.io/role/internal-elb" = "1"
}

application_vpc_private_subnet_tags = {
  "kubernetes.io/cluster/alpha-eks-cluster" = "shared"
  # "kubernetes.io/role/elb"                       = "1"
  "kubernetes.io/role/internal-elb" = "1"
}

application_vpc_private_sg_name = "application_private-sg"
application_vpc_public_sg_name  = "application_public-sg"
application-vpc-sg-tags = {
  Name                                           = "allow_http_https"
  Terraform                                      = true
  "kubernetes.io/cluster/alpha-eks-cluster" = "shared"
}

# Application VPC Private Security Group
sg-private-app-ingress-port-0-cidr = ["172.16.0.0/16", "192.168.0.0/16", "10.100.0.0/16"]


# RDS Instance
db_identifier          = "alpha-db"
allocated_storage      = "10"
db_engine              = "postgres"
db_engine_version      = "15.7"
db_instance_class      = "db.t3.micro"
db_skip_final_snapshot = true
db_storage_encrypted   = true
db_subnet_group_name   = "automat_it_db_subnet_grp"
tags = {
  Terraform   = true
  Environment = "dev"
}
aws_db_subnet_group_tags = {
  Name        = "Alpha DB subnet group"
  Terraform   = true
  Environment = "dev"
}

# Transit Gateway
transit_gateway_name                            = "alpha-tgw"
transit_gateway_description                     = "Alpha Transit Gateway"
transit-gw-enable-auto-accept-share-attachments = true
transit-gw-ram-allow-external-principals        = true

# Jenkins ALB
sg-public-mgmt-jenkins-alb-name                  = "jenkins-alb-sg"
sg-public-mgmt-jenkins-alb-description           = "Allow HTTP and HTTPS inbound traffic from only GitHub (Webhook) - api.github.com/meta and private cidr range"
sg-public-mgmt-jenkins-port80-description        = "HTTP from only GitHub (Webhook) - api.github.com/meta and private cidr range"
sg-public-mgmt-jenkins-alb-ingress-port-80-cidr  = ["192.30.252.0/22", "185.199.108.0/22", "140.82.112.0/20", "143.55.64.0/20", "192.168.0.0/16"]
sg-public-mgmt-jenkins-port443-description       = "HTTPS from only GitHub (Webhook) - api.github.com/meta and private cidr range"
sg-public-mgmt-jenkins-alb-ingress-port-443-cidr = ["192.30.252.0/22", "185.199.108.0/22", "140.82.112.0/20", "143.55.64.0/20", "192.168.0.0/16"]
sg-public-mgmt-jenkins-alb-tags = {
  Name        = "Jenkins ALB security group"
  Terraform   = true
  Environment = "dev"
}
jenkins_alb_name    = "jenkins-alb"
jenkins_alb_tg_name = "jenkins-tg"

# Alpha ACM
acm-domain-name               = "alpha-dev.com"
acm-validation-method         = "DNS"
acm-subject-alternative-names = ["*.alpha-dev.com"]

# Alpha AWS Config
alpha-config-bucket              = "alpha-config-bucket-demo"
alpha-config-recorder            = "alpha-config-recorder"
alpha-config-role                = "alpha-config-role"
alpha-default                    = "alpha-default"
force-destroy-config-bucket           = true
config-bucket-block-public-acls       = true
config-bucket-block-public-policy     = true
config-bucket-ignore-public-acls      = true
config-bucket-restrict-public-buckets = true
all-supported-recording-group         = true
enable-config-recorder-status         = true

# Alpha Cloudtrail
alpha-cloudtrail-name                = "alpha-cloudtrail"
alpha-cloudtrail-bucket              = "alpha-cloudtrail-bucket-demo"
force-destroy-cloudtrail-bucket           = true
cloudtrail-bucket-block-public-acls       = true
cloudtrail-bucket-block-public-policy     = true
cloudtrail-bucket-ignore-public-acls      = true
cloudtrail-bucket-restrict-public-buckets = true

# Alpha CloudWatch
cloudwatch-guardduty-finding             = "alpha-guardduty-finding"
alpha-security-alerts               = "alpha-security-alerts"
alpha-cloudwatch-sns                = "alpha-cloudwatch-sns"
cloudwatch-guardduty-finding-description = "Capture GuardDuty findings"
cloudwatch-sns-event-target              = "SendToSNS"
sms-target-protocol                      = "sms"

# ECR
ecr-app-backend  = "alpha/app_backend"
ecr-app-frontend = "alpha/app_frontend"
ecr-force-delete = true

# EKS Cluster
eks-cluster-name                         = "alpha-eks-cluster"
create-cluster-security-group            = true
create-node-security-group               = true
enable-cluster-creator-admin-permissions = true
eks-cluster-enable-irsa                  = true
cluster-endpoint-public-access           = true
cluster-endpoint-private-access          = false
cluster-addons = {
  coredns                = {}
  eks-pod-identity-agent = {}
  kube-proxy             = {}
  vpc-cni                = {}
}
eks-managed-node-group-defaults = {
  disk_size      = 50
  instance_types = ["t3.medium"]
  desired_size   = 1
}

# EKS Cluster ALB Security Group
eks-cluster-alb-sg-name             = "Alpha EKS cluster security group"
eks-cluster-alb-sg-description      = "Security group for cluster application load balancer"
eks-cluster-alb-port80-description  = "Allow http inbound traffic"
eks-cluster-alb-port80-cidr         = ["0.0.0.0/0"]
eks-cluster-alb-port443-description = "Allow https inbound traffic"
eks-cluster-alb-port443-cidr        = ["0.0.0.0/0"]
eks-cluster-alb-sg-tags = {
  Name                                           = "Cluster ALB security group"
  Environment                                    = "dev"
  Terraform                                      = true
  "kubernetes.io/cluster/alpha-eks-cluster" = "shared"
}

# EKS Cluster ALB
eks-cluster-alb-name              = "Alpha-EKS-ALB"
eks-cluster-alb-tg-name           = "Alpha-EKS-ALB-tg"
eks-cluster-alb-target-port       = 80
eks-cluster-alb-target-protocol   = "HTTP"
eks-cluster-alb-health-check-path = "/"

# Data
openvpn3-ami-id               = "openvpnv3_ami_id"
jenkins-ami-id                = "jenkins_ami_id"
alpha-db-name            = "automat_it_db_name"
alpha-db-username        = "automat_it_db_username"
alpha-db-password        = "automat_it_db_password"
openvpn-instance-eip-alloc-id = "openvpn_instance_eip_alloc_id"
sms-contact                   = "sms_contact"
caleb-userarn                 = "caleb_userarn"
caleb-username                = "caleb_username"
kenneth-userarn               = "kenneth_userarn"
kenneth-username              = "kenneth_username"

# GuardDuty
guardduty-enable                            = true
guardduty-eks-detector-name                 = "EKS_RUNTIME_MONITORING"
guardduty-detector-enable                   = "ENABLED"
guardduty-detector-additional-config-name   = "EKS_ADDON_MANAGEMENT"
guardduty-detector-additional-config-status = "ENABLED"

# Jenkins Instance
alpha-jenkins-ec2-role        = "alpha-jenkins-ec2-role"
alpha-jenkins-instance-policy = "alpha-jenkins-instance-policy"
ec2-profile-for-jenkins-instance   = "ec2-profile-for-jenkins-instance"
alpha-jenkins-server-name     = "alpha-jenkins-server"
jenkins-instance-az                = "eu-west-1a"
create-eip                         = false
associate-public-ip                = false
jenkins-instance-type              = "t3.xlarge"
jenkins-key-name                   = "alpha"
jenkins-user-data                  = "scripts/jenkins.sh"
jenkins-monitoring                 = false

# OpenVPN Instance
openvpn-instance-name       = "alpha-openvpn-access-server"
openvpn-instance-az         = "eu-west-1a"
openvpn-instance-create-eip = false
openvpn-instance-type       = "t2.small"
openvpn-key-name            = "alpha"
openvpn-monitoring          = false

# Route53
route53-zone-name = "alpha-dev.com"
www-name          = "www.alpha-dev.com"
www-type          = "A"
www-ttl           = "300"

jenkins53-name    = "jenkins.alpha-dev.com"
jenkins53-cname   = "CNAME"
jenkins53-ttl     = "300"
jenkins53-records = ["http://jenkins-alb-1708875401.eu-west-1.elb.amazonaws.com"]

openvpn53-name = "openvpn.alpha-dev.com"
openvpn53-type = "A"
openvpn53-ttl  = "300"