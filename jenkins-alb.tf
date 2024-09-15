module "jenkins_alb_sg" {
  source                       = "./modules/alb-sg"
  alb-sg-name                  = var.sg-public-mgmt-jenkins-alb-name
  alb-sg-description           = var.sg-public-mgmt-jenkins-alb-description
  alb-sg-port80-description    = var.sg-public-mgmt-jenkins-port80-description
  alb-sg-ingress-port-80-cidr  = var.sg-public-mgmt-jenkins-alb-ingress-port-80-cidr
  alb-sg-port443-description   = var.sg-public-mgmt-jenkins-port443-description
  alb-sg-ingress-port-443-cidr = var.sg-public-mgmt-jenkins-alb-ingress-port-443-cidr
  vpc_id                       = module.management_vpc.vpc_id
  alb-sg-tags                  = var.sg-public-mgmt-jenkins-alb-tags
}

module "jenkins_alb" {
  source                = "./modules/alb"
  alb-name              = var.jenkins_alb_name
  alb-tg-name           = var.jenkins_alb_tg_name
  vpc_id                = module.management_vpc.vpc_id
  alb-sg                = [module.jenkins_alb_sg.public_security_group_id]
  alb-subnets           = module.management_vpc.public_subnets[*]
  alb-target-id         = module.jenkins_server_instance.id
  alb-target-port       = var.jenkins-instance-target-port
  alb-health-check-path = var.jenkins-instance-health-check-path
  depends_on            = [module.jenkins_alb_sg]
}
