# GuardDuty
resource "aws_guardduty_detector" "main" {
  enable = var.guardduty-enable
  tags   = var.tags
}

resource "aws_guardduty_detector_feature" "eks_runtime_monitoring" {
  detector_id = aws_guardduty_detector.main.id
  name        = var.guardduty-eks-detector-name
  status      = var.guardduty-detector-enable

  additional_configuration {
    name   = var.guardduty-detector-additional-config-name
    status = var.guardduty-detector-additional-config-status
  }
}