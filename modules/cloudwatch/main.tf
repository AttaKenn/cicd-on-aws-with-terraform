# CloudWatch Event Rules
resource "aws_cloudwatch_event_rule" "guardduty_finding" {
  name        = var.cloudwatch-guardduty-finding
  description = var.cloudwatch-guardduty-finding-description

  event_pattern = jsonencode({
    source      = ["aws.guardduty"]
    detail-type = ["GuardDuty Finding"]
  })

  role_arn = aws_iam_role.cloudwatch_sns.arn

  tags = var.tags
}

resource "aws_cloudwatch_event_target" "sns" {
  rule      = aws_cloudwatch_event_rule.guardduty_finding.name
  target_id = var.cloudwatch-sns-event-target
  arn       = aws_sns_topic.security_alerts.arn
}

# SNS Topic
resource "aws_sns_topic" "security_alerts" {
  name = var.alpha-security-alerts
}

resource "aws_sns_topic_subscription" "sms_target" {
  topic_arn = aws_sns_topic.security_alerts.arn
  protocol  = var.sms-target-protocol
  endpoint  = var.sms-target
}

# IAM permissions for CloudWatch to publish to SNS
resource "aws_iam_role" "cloudwatch_sns" {
  name = var.alpha-cloudwatch-sns

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "events.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "cloudwatch_sns" {
  name = var.alpha-cloudwatch-sns
  role = aws_iam_role.cloudwatch_sns.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "sns:Publish"
        Resource = aws_sns_topic.security_alerts.arn
      }
    ]
  })
}
