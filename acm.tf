module "alpha-acm" {
  source                        = "./modules/acm"
  acm-domain-name               = var.acm-domain-name
  acm-validation-method         = var.acm-validation-method
  acm-subject-alternative-names = var.acm-subject-alternative-names
  tags                          = var.tags
  acm-zone-id                   = aws_route53_zone.alpha.zone_id
  depends_on                    = [aws_route53_zone.alpha]
}
