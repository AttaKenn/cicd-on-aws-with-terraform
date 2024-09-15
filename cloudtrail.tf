module "alpha-cloudtrail" {
  source                                    = "./modules/cloudtrail"
  alpha-cloudtrail-name                = var.alpha-cloudtrail-name
  alpha-cloudtrail-bucket              = var.alpha-cloudtrail-bucket
  tags                                      = var.tags
  force-destroy-cloudtrail-bucket           = var.force-destroy-cloudtrail-bucket
  cloudtrail-bucket-block-public-acls       = var.cloudtrail-bucket-block-public-acls
  cloudtrail-bucket-block-public-policy     = var.cloudtrail-bucket-block-public-policy
  cloudtrail-bucket-ignore-public-acls      = var.cloudtrail-bucket-ignore-public-acls
  cloudtrail-bucket-restrict-public-buckets = var.cloudtrail-bucket-restrict-public-buckets
}
