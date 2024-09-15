# Production Application VPC
module "application_vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.application_vpc_name
  cidr = var.application_vpc_cidr

  azs                     = var.application_vpc_azs
  private_subnets         = var.application_vpc_private_subnets
  public_subnets          = var.application_vpc_public_subnets
  map_public_ip_on_launch = var.application_vpc_map_public_ip_on_launch

  enable_nat_gateway     = var.application_vpc_enable_nat_gateway
  single_nat_gateway     = var.application_vpc_single_nat_gateway
  one_nat_gateway_per_az = var.application_vpc_one_nat_gateway_per_az

  tags = var.application_vpc_tags

  public_subnet_tags = var.application_vpc_public_subnet_tags

  private_subnet_tags = var.application_vpc_private_subnet_tags
}

# Routes for Transit Gateway
# ==========================================

module "application_vpc_private_route" {
  source = "./modules/route"

  route_table_id         = module.application_vpc.private_route_table_ids[0]
  transit_gateway_id     = module.tgw.ec2_transit_gateway_id
  destination_cidr_block = module.management_vpc.vpc_cidr_block
}

# Security Groups
# =======================================

#    Private Security Groups
#    ======================

module "application_private_sg" {
  source                             = "./modules/sg-private-app"
  application_vpc_private_sg_name    = var.application_vpc_private_sg_name
  vpc_id                             = module.application_vpc.vpc_id
  sg-private-app-ingress-port-0-cidr = var.sg-private-app-ingress-port-0-cidr
  application-vpc-sg-tags            = var.application-vpc-sg-tags
}

#    Public Security Groups
#    ======================

module "application_public_sg" {
  source                  = "./modules/sg-public-app"
  name                    = var.application_vpc_public_sg_name
  vpc_id                  = module.application_vpc.vpc_id
  application-vpc-sg-tags = var.application-vpc-sg-tags
}
