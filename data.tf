# Get AWS Secrets Manager secrets value
# OpenVPN AMI_ID
data "aws_secretsmanager_secret" "openvpnv3_ami_id" {
  name = var.openvpn3-ami-id
}

data "aws_secretsmanager_secret_version" "openvpn_latest" {
  secret_id = data.aws_secretsmanager_secret.openvpnv3_ami_id.id
}

# Jenkins
data "aws_secretsmanager_secret" "jenkins_ami_id" {
  name = var.jenkins-ami-id
}

data "aws_secretsmanager_secret_version" "jenkins_latest" {
  secret_id = data.aws_secretsmanager_secret.jenkins_ami_id.id
}

# RDS instance
data "aws_secretsmanager_secret" "automat_it_db_name" {
  name = var.alpha-db-name
}

data "aws_secretsmanager_secret_version" "automat_it_db_name_latest" {
  secret_id = data.aws_secretsmanager_secret.automat_it_db_name.id
}

data "aws_secretsmanager_secret" "automat_it_db_username" {
  name = var.alpha-db-username
}

data "aws_secretsmanager_secret_version" "automat_it_db_username_latest" {
  secret_id = data.aws_secretsmanager_secret.automat_it_db_username.id
}

data "aws_secretsmanager_secret" "automat_it_db_password" {
  name = var.alpha-db-password
}

data "aws_secretsmanager_secret_version" "automat_it_db_password_latest" {
  secret_id = data.aws_secretsmanager_secret.automat_it_db_password.id
}

# OpenVPN server
data "aws_secretsmanager_secret" "openvpn_instance_eip_alloc_id" {
  name = var.openvpn-instance-eip-alloc-id
}

data "aws_secretsmanager_secret_version" "openvpn_instance_eip_alloc_id_latest" {
  secret_id = data.aws_secretsmanager_secret.openvpn_instance_eip_alloc_id.id
}

# SMS Contact
data "aws_secretsmanager_secret" "sms_contact" {
  name = var.sms-contact
}

data "aws_secretsmanager_secret_version" "sms_contact_latest" {
  secret_id = data.aws_secretsmanager_secret.sms_contact.id
}

# EKS Users for RBAC 
data "aws_secretsmanager_secret" "caleb_userarn" {
  name = var.caleb-userarn
}

data "aws_secretsmanager_secret_version" "caleb_userarn_latest" {
  secret_id = data.aws_secretsmanager_secret.caleb_userarn.id
}

data "aws_secretsmanager_secret" "caleb_username" {
  name = var.caleb-username
}

data "aws_secretsmanager_secret_version" "caleb_username_latest" {
  secret_id = data.aws_secretsmanager_secret.caleb_username.id
}

data "aws_secretsmanager_secret" "kenneth_userarn" {
  name = var.kenneth-userarn
}

data "aws_secretsmanager_secret_version" "kenneth_userarn_latest" {
  secret_id = data.aws_secretsmanager_secret.kenneth_userarn.id
}

data "aws_secretsmanager_secret" "kenneth_username" {
  name = var.kenneth-username
}

data "aws_secretsmanager_secret_version" "kenneth_username_latest" {
  secret_id = data.aws_secretsmanager_secret.kenneth_username.id
}