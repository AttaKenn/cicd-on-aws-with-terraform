module "alpha-aws-config" {
  source                                = "./modules/aws-config"
  alpha-config-bucket              = var.alpha-config-bucket
  alpha-config-recorder            = var.alpha-config-recorder
  alpha-config-role                = var.alpha-config-role
  alpha-default                    = var.alpha-default
  tags                                  = var.tags
  force-destroy-config-bucket           = var.force-destroy-config-bucket
  config-bucket-block-public-acls       = var.config-bucket-block-public-acls
  config-bucket-block-public-policy     = var.config-bucket-block-public-policy
  config-bucket-ignore-public-acls      = var.config-bucket-ignore-public-acls
  config-bucket-restrict-public-buckets = var.config-bucket-restrict-public-buckets
  all-supported-recording-group         = var.all-supported-recording-group
  enable-config-recorder-status         = var.enable-config-recorder-status
}

data "aws_caller_identity" "current" {}
