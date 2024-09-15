# OpenVPN Access Server
module "openvpn_access_server_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name              = var.openvpn-instance-name
  ami               = data.aws_secretsmanager_secret_version.openvpn_latest.secret_string
  availability_zone = var.openvpn-instance-az
  create_eip        = var.openvpn-instance-create-eip
  eip_tags          = var.tags

  instance_type          = var.openvpn-instance-type
  key_name               = var.openvpn-key-name
  monitoring             = var.openvpn-monitoring
  vpc_security_group_ids = [module.management_public_sg.public_security_group_id]
  subnet_id              = module.management_vpc.public_subnets[0]

  tags = var.tags

  depends_on = [module.jenkins_server_instance]
}

# EIP Allocation
module "openvpn_instance_eip_alloc" {
  source        = "./modules/eip_association"
  instance_id   = module.openvpn_access_server_instance.id
  allocation_id = data.aws_secretsmanager_secret_version.openvpn_instance_eip_alloc_id_latest.secret_string
}
