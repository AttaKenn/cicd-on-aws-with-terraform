# EKS Module from TF Registry
module "eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name = var.eks-cluster-name

  create_cluster_security_group         = var.create-cluster-security-group
  create_node_security_group            = var.create-node-security-group
  node_security_group_id                = module.application_private_sg.private_security_group_id
  cluster_security_group_id             = module.application_private_sg.private_security_group_id
  cluster_additional_security_group_ids = [module.application_private_sg.private_security_group_id]


  enable_cluster_creator_admin_permissions = var.enable-cluster-creator-admin-permissions
  subnet_ids                               = module.application_vpc.private_subnets[*]
  vpc_id                                   = module.application_vpc.vpc_id


  enable_irsa                     = var.eks-cluster-enable-irsa
  cluster_endpoint_public_access  = var.cluster-endpoint-public-access
  cluster_endpoint_private_access = var.cluster-endpoint-private-access

  cluster_addons = var.cluster-addons


  eks_managed_node_group_defaults = var.eks-managed-node-group-defaults

  eks_managed_node_groups = {
  alpha-eks = {}
  }
}
