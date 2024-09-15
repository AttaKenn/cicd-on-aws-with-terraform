# Transit Gateway module
module "tgw" {
  source = "terraform-aws-modules/transit-gateway/aws"

  name        = var.transit_gateway_name
  description = var.transit_gateway_description

  enable_auto_accept_shared_attachments = var.transit-gw-enable-auto-accept-share-attachments
  ram_allow_external_principals         = var.transit-gw-ram-allow-external-principals

  vpc_attachments = {
    vpc1 = {
      vpc_id       = module.management_vpc.vpc_id
      subnet_ids   = module.management_vpc.private_subnets
      dns_support  = true
      ipv6_support = false
    }
    vpc2 = {
      vpc_id       = module.application_vpc.vpc_id
      subnet_ids   = module.application_vpc.private_subnets
      dns_support  = true
      ipv6_support = false
    }
  }

  tags = var.management_vpc_tags
}
