output "transit_gateway_id" {
  value = module.tgw.ec2_transit_gateway_id
}

output "vpc_management_id" {
  value = module.management_vpc.vpc_id
}

output "vpc_production_id" {
  value = module.application_vpc.vpc_id
}

output "openvpn_instance_public_ip" {
  value = module.openvpn_access_server_instance.public_ip
}

output "certificate_arn" {
  value = module.alpha-acm.certificate_arn
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}