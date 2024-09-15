# CloudWatch Event Rules
module "alpha-cloudwatch-event-rules" {
  source                                   = "./modules/cloudwatch"
  cloudwatch-guardduty-finding             = var.cloudwatch-guardduty-finding
  alpha-cloudwatch-sns                = var.alpha-cloudwatch-sns
  alpha-security-alerts               = var.alpha-security-alerts
  tags                                     = var.tags
  sms-target                               = data.aws_secretsmanager_secret_version.sms_contact_latest.secret_string
  cloudwatch-guardduty-finding-description = var.cloudwatch-guardduty-finding-description
  cloudwatch-sns-event-target              = var.cloudwatch-sns-event-target
  sms-target-protocol                      = var.sms-target-protocol
}
