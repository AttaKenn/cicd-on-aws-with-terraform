# Terraform Provider
variable "region" {
  description = "AWS default Region"
  type        = string
  default     = "eu-west-1"
}

variable "profile" {
  description = "AWS CLI profile"
  type        = string
  default     = "default"
}

variable "shared_config_files" {
  description = "AWS shared config files"
  type        = list(string)
  default     = ["~/.aws/config"]
}

variable "shared_credentials_files" {
  description = "AWS shared credential files"
  type        = list(string)
  default     = ["~/.aws/credentials"]
}

# Management VPC
variable "management_vpc_name" {
  description = "Management VPC name"
  type        = string
}

variable "management_vpc_cidr" {
  description = "Management VPC cidr block"
  type        = string
}

variable "management_vpc_azs" {
  description = "AZs in the Management VPC"
  type        = list(string)
}

variable "management_vpc_private_subnets" {
  description = "Management VPC private subnets"
  type        = list(string)
}

variable "management_vpc_public_subnets" {
  description = "Management VPC public subnets"
  type        = list(string)
}

variable "management_vpc_enable_nat_gateway" {
  description = "Option to enable VPC NAT gateway"
  type        = bool
  default     = true
}

variable "management_vpc_single_nat_gateway" {
  description = "Option to set just a single VPC NAT gateway"
  type        = bool
  default     = true
}

variable "management_vpc_one_nat_gateway_per_az" {
  description = "Option to enable a VPC NAT gateway per AZ"
  type        = bool
  default     = true
}

variable "management_vpc_tags" {
  description = "Management VPC tags"
  type = object({
    Terraform   = string
    Environment = string
  })
}

variable "management_private_sg_name" {
  type = string
}

variable "management_public_sg_name" {
  type = string
}

# Application VPC
variable "application_vpc_name" {
  description = "Application VPC name"
  type        = string
}

variable "application_vpc_cidr" {
  description = "Application VPC cidr block"
  type        = string
}

variable "application_vpc_azs" {
  description = "AZs in the Application VPC"
  type        = list(string)
}

variable "application_vpc_private_subnets" {
  description = "Application VPC private subnets"
  type        = list(string)
}

variable "application_vpc_public_subnets" {
  description = "Application VPC public subnets"
  type        = list(string)
}

variable "application_vpc_map_public_ip_on_launch" {
  type    = bool
  default = true
}

variable "application_vpc_enable_nat_gateway" {
  description = "Option to enable VPC NAT gateway"
  type        = bool
  default     = true
}

variable "application_vpc_single_nat_gateway" {
  description = "Option to set just a single VPC NAT gateway"
  type        = bool
  default     = true
}

variable "application_vpc_one_nat_gateway_per_az" {
  description = "Option to enable a VPC NAT gateway per AZ"
  type        = bool
  default     = true
}

variable "application_vpc_tags" {
  description = "Application VPC tags"
  type = object({
    Terraform   = string
    Environment = string
  })
}

variable "application_vpc_private_sg_name" {
  type = string
}

variable "application_vpc_public_sg_name" {
  type = string
}

variable "application_vpc_public_subnet_tags" {
  type = any
}

variable "application_vpc_private_subnet_tags" {
  type = any
}

variable "application-vpc-sg-tags" {
  type = any
}

# RDS instance
variable "db_identifier" {
  description = "DB identifier/RDS instance name"
  type        = string
}

variable "allocated_storage" {
  type = string
}

variable "db_engine" {
  description = "DB engine"
  type        = string
}

variable "db_engine_version" {
  description = "DB engine version"
  type        = string
}

variable "db_instance_class" {
  type        = string
  description = "DB instance class"
}

variable "db_skip_final_snapshot" {
  type = bool
}

variable "db_storage_encrypted" {
  type = bool
}

variable "db_subnet_group_name" {
  type        = string
  description = "Subnet for DB instance"
}

variable "tags" {
  type = object({
    Terraform   = bool
    Environment = string
  })
}

variable "aws_db_subnet_group_tags" {
  type = object({
    Name        = string
    Terraform   = bool
    Environment = string
  })
}

# Transit Gateway
variable "transit_gateway_name" {
  type = string
}

variable "transit_gateway_description" {
  type = string
}

variable "transit-gw-enable-auto-accept-share-attachments" {
  type = bool
}

variable "transit-gw-ram-allow-external-principals" {
  type = bool
}

# Management VPC Private Security Group
variable "sg-private-mgmt-tags" {
  type = object({
    Name      = string
    Terraform = string
  })
}

variable "sg-private-mgmt-ingress-port-0-cidr" {
  type = list(string)
}

# Management VPC Public Security Group
variable "sg-public-mgmt-ingress-port-80-cidr" {
  type = list(string)
}

variable "sg-public-mgmt-ingress-port-443-cidr" {
  type = list(string)
}

variable "sg-public-mgmt-ingress-port-22-cidr" {
  type = list(string)
}

variable "sg-public-mgmt-ingress-port-943-cidr" {
  type = list(string)
}

variable "sg-public-mgmt-ingress-port-1194-cidr" {
  type = list(string)
}

variable "sg-public-mgmt-tags" {
  type = object({
    Name      = string
    Terraform = bool
  })
}

# Application VPC Private Security Group
variable "sg-private-app-ingress-port-0-cidr" {
  type = list(string)
}

# Jenkins ALB
variable "jenkins_alb_name" {
  type = string
}

variable "jenkins_alb_tg_name" {
  type = string
}

variable "sg-public-mgmt-jenkins-alb-name" {
  description = "Security group name"
  type        = string
}

variable "jenkins-instance-health-check-path" {
  type    = string
  default = "/login"
}

variable "jenkins-instance-target-port" {
  type    = number
  default = 8080
}

variable "sg-public-mgmt-jenkins-alb-description" {
  type = string
}

variable "sg-public-mgmt-jenkins-port80-description" {
  type = string
}

variable "sg-public-mgmt-jenkins-alb-ingress-port-80-cidr" {
  type = list(string)
}

variable "sg-public-mgmt-jenkins-port443-description" {
  type = string
}

variable "sg-public-mgmt-jenkins-alb-ingress-port-443-cidr" {
  type = list(string)
}

variable "sg-public-mgmt-jenkins-alb-tags" {
  type = object({
    Name        = string
    Terraform   = bool
    Environment = string
  })
}


# ACM
variable "acm-domain-name" {
  type = string
}

variable "acm-validation-method" {
  type = string
}

variable "acm-subject-alternative-names" {
  type = list(string)
}

# AWS Config
variable "alpha-config-bucket" {
  type = string
}

variable "alpha-config-recorder" {
  type = string
}

variable "alpha-default" {
  type = string
}

variable "alpha-config-role" {
  type = string
}

variable "force-destroy-config-bucket" {
  type = bool
}

variable "config-bucket-block-public-acls" {
  type = bool
}

variable "config-bucket-block-public-policy" {
  type = bool
}

variable "config-bucket-ignore-public-acls" {
  type = bool
}

variable "config-bucket-restrict-public-buckets" {
  type = bool
}

variable "all-supported-recording-group" {
  type = bool
}

variable "enable-config-recorder-status" {
  type = bool
}

# AWS Cloudtrail
variable "alpha-cloudtrail-name" {
  type = string
}

variable "alpha-cloudtrail-bucket" {
  type = string
}

variable "force-destroy-cloudtrail-bucket" {
  type    = bool
  default = true
}

variable "cloudtrail-bucket-block-public-acls" {
  type = bool
}

variable "cloudtrail-bucket-block-public-policy" {
  type = bool
}

variable "cloudtrail-bucket-ignore-public-acls" {
  type = bool
}

variable "cloudtrail-bucket-restrict-public-buckets" {
  type = bool
}

# AWS CloudWatch
variable "cloudwatch-guardduty-finding" {
  type = string
}

variable "alpha-security-alerts" {
  type = string
}

variable "alpha-cloudwatch-sns" {
  type = string
}

variable "sms-target-protocol" {
  type = string
}

variable "cloudwatch-sns-event-target" {
  type = string
}

variable "cloudwatch-guardduty-finding-description" {
  type = string
}

# ECR
variable "ecr-app-frontend" {
  type = string
}

variable "ecr-app-backend" {
  type = string
}

variable "ecr-force-delete" {
  type    = bool
  default = true
}

# EKS Cluster
variable "eks-cluster-name" {
  type = string
}

variable "eks-managed-node-group-defaults" {
  type = any
}

variable "create-cluster-security-group" {
  type = bool
}

variable "create-node-security-group" {
  type = bool
}

variable "enable-cluster-creator-admin-permissions" {
  type = bool
}

variable "eks-cluster-enable-irsa" {
  type = bool
}

variable "cluster-endpoint-public-access" {
  type = bool
}

variable "cluster-endpoint-private-access" {
  type = bool
}

variable "cluster-addons" {
  type = any
}

# variable "eks-managed-node-groups" {
#   type = any
# }

variable "openvpn3-ami-id" {
  type = string
}

# AWS Secrets Manager - data.tf
variable "jenkins-ami-id" {
  type = string
}

variable "alpha-db-name" {
  type = string
}

variable "alpha-db-username" {
  type = string
}

variable "alpha-db-password" {
  type = string
}

variable "openvpn-instance-eip-alloc-id" {
  type = string
}

variable "sms-contact" {
  type = string
}

variable "caleb-userarn" {
  type = string
}

variable "caleb-username" {
  type = string
}

variable "kenneth-userarn" {
  type = string
}

variable "kenneth-username" {
  type = string
}

# EKS ALB Security Group
variable "eks-cluster-alb-sg-name" {
  type = string
}

variable "eks-cluster-alb-sg-description" {
  type = string
}

variable "eks-cluster-alb-port80-description" {
  type = string
}

variable "eks-cluster-alb-port80-cidr" {
  type = list(string)
}

variable "eks-cluster-alb-port443-description" {
  type = string
}

variable "eks-cluster-alb-port443-cidr" {
  type = list(string)
}

variable "eks-cluster-alb-sg-tags" {
  type = any
}

# EKS Cluster ALB
variable "eks-cluster-alb-name" {
  type = string
}

variable "eks-cluster-alb-tg-name" {
  type = string
}

variable "eks-cluster-alb-target-port" {
  type = number
}

variable "eks-cluster-alb-target-protocol" {
  type = string
}

variable "eks-cluster-alb-health-check-path" {
  type    = string
  default = "/"
}

# GuardDuty

variable "guardduty-enable" {
  type = bool
}

variable "guardduty-eks-detector-name" {
  type = string
}

variable "guardduty-detector-enable" {
  type = string
}

variable "guardduty-detector-additional-config-name" {
  type = string
}

variable "guardduty-detector-additional-config-status" {
  type = string
}

# Jenkins Instance
variable "alpha-jenkins-ec2-role" {
  type = string
}

variable "alpha-jenkins-instance-policy" {
  type = string
}

variable "ec2-profile-for-jenkins-instance" {
  type = string
}

variable "alpha-jenkins-server-name" {
  type = string
}

variable "jenkins-instance-az" {
  type = string
}

variable "create-eip" {
  type = bool
}

variable "associate-public-ip" {
  type = bool
}

variable "jenkins-instance-type" {
  type = string
}

variable "jenkins-key-name" {
  type = string
}

variable "jenkins-user-data" {
  type = string
}

variable "jenkins-monitoring" {
  type = bool
}

# OpenVPN Instance
variable "openvpn-instance-name" {
  type = string
}

variable "openvpn-instance-az" {
  type = string
}

variable "openvpn-instance-create-eip" {
  type = bool
}

variable "openvpn-instance-type" {
  type = string
}

variable "openvpn-key-name" {
  type = string
}

variable "openvpn-monitoring" {
  type = bool
}

# Route53
variable "route53-zone-name" {
  type = string
}

variable "www-name" {
  type = string
}

variable "www-type" {
  type = string
}

variable "www-ttl" {
  type = string
}

# Jenkins Route53
variable "jenkins53-name" {
  type = string
}

variable "jenkins53-cname" {
  type = string
}

variable "jenkins53-ttl" {
  type = string
}

variable "jenkins53-records" {
  type = list(string)
}

# OpenVPN Route53
variable "openvpn53-name" {
  type = string
}

variable "openvpn53-type" {
  type = string
}

variable "openvpn53-ttl" {
  type = string
}

