# Management VPC
module "management_vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.management_vpc_name
  cidr = var.management_vpc_cidr

  azs             = var.management_vpc_azs
  private_subnets = var.management_vpc_private_subnets
  public_subnets  = var.management_vpc_public_subnets

  enable_nat_gateway     = var.management_vpc_enable_nat_gateway
  single_nat_gateway     = var.management_vpc_single_nat_gateway
  one_nat_gateway_per_az = var.management_vpc_one_nat_gateway_per_az

  tags = var.management_vpc_tags
}

# Routes for Transit Gateway
# ==========================================

# Management VPC
module "management_vpc_private_route" {
  source = "./modules/route"

  route_table_id         = module.management_vpc.private_route_table_ids[0]
  transit_gateway_id     = module.tgw.ec2_transit_gateway_id
  destination_cidr_block = module.application_vpc.vpc_cidr_block
}

# Security Groups
# =======================================

#    Private Security Groups
#    ======================

module "management_private_sg" {
  source                              = "./modules/sg-private-mgmt"
  sg-private-mgmt-name                = var.management_private_sg_name
  vpc_id                              = module.management_vpc.vpc_id
  sg-private-mgmt-ingress-port-0-cidr = var.sg-private-mgmt-ingress-port-0-cidr
  sg-private-mgmt-tags                = var.sg-private-mgmt-tags
}

#    Public Security Groups
#    ======================

module "management_public_sg" {
  source                                = "./modules/sg-public-mgmt"
  sg-public-mgmt-name                   = var.management_public_sg_name
  vpc_id                                = module.management_vpc.vpc_id
  sg-public-mgmt-ingress-port-1194-cidr = var.sg-public-mgmt-ingress-port-1194-cidr
  sg-public-mgmt-ingress-port-22-cidr   = var.sg-public-mgmt-ingress-port-22-cidr
  sg-public-mgmt-ingress-port-443-cidr  = var.sg-public-mgmt-ingress-port-443-cidr
  sg-public-mgmt-ingress-port-80-cidr   = var.sg-public-mgmt-ingress-port-80-cidr
  sg-public-mgmt-ingress-port-943-cidr  = var.sg-public-mgmt-ingress-port-943-cidr
  sg-public-mgmt-tags                   = var.sg-public-mgmt-tags
}

