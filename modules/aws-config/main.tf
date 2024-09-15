# S3 bucket to store AWS Config logs
resource "aws_s3_bucket" "automat_it_config_bucket" {
  bucket        = var.alpha-config-bucket
  tags          = var.tags
  force_destroy = var.force-destroy-config-bucket
}

resource "aws_s3_bucket_public_access_block" "block_public_access_config" {
  bucket = aws_s3_bucket.automat_it_config_bucket.id

  block_public_acls       = var.config-bucket-block-public-acls
  block_public_policy     = var.config-bucket-block-public-policy
  ignore_public_acls      = var.config-bucket-ignore-public-acls
  restrict_public_buckets = var.config-bucket-restrict-public-buckets
  depends_on              = [aws_s3_bucket.automat_it_config_bucket]
}

resource "aws_s3_bucket_policy" "config_bucket_policy" {
  bucket = aws_s3_bucket.automat_it_config_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "AWSConfigAclCheck",
        Effect = "Allow",
        Principal = {
          Service = "config.amazonaws.com"
        },
        Action   = "s3:*",
        Resource = aws_s3_bucket.automat_it_config_bucket.arn
      },
      {
        Sid    = "AWSConfigWrite",
        Effect = "Allow",
        Principal = {
          Service = "config.amazonaws.com"
        },
        Action   = "s3:PutObject",
        Resource = "${aws_s3_bucket.automat_it_config_bucket.arn}/AWSLogs/${data.aws_caller_identity.current.account_id}/*",
        Condition = {
          StringEquals = {
            "s3:x-amz-acl" = "bucket-owner-full-control"
          }
        }
      }
    ]
  })
}

# AWS Config
resource "aws_config_configuration_recorder" "automat_it_aws_config" {
  name     = var.alpha-config-recorder
  role_arn = aws_iam_role.config_role.arn

  recording_group {
    all_supported = var.all-supported-recording-group
  }
}

# AWS Config Delivery Channel
resource "aws_config_delivery_channel" "config_delivery_channel" {
  name           = var.alpha-default
  s3_bucket_name = aws_s3_bucket.automat_it_config_bucket.bucket

}

# Start recording
resource "aws_config_configuration_recorder_status" "config_recorder_status" {
  name       = aws_config_configuration_recorder.automat_it_aws_config.name
  is_enabled = var.enable-config-recorder-status
  depends_on = [aws_config_configuration_recorder.automat_it_aws_config]
}

# IAM role for AWS Config
resource "aws_iam_role" "config_role" {
  name = var.alpha-config-role

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "config.amazonaws.com"
        }
      }
    ]
  })
  tags = var.tags
}

# Attach necessary policy to the role
resource "aws_iam_role_policy_attachment" "config_role_policy" {
  role       = aws_iam_role.config_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWS_ConfigRole"
}

# AWS Config Rule: Check if all resources have the required tags
resource "aws_config_config_rule" "required_tags" {
  name = "required-tags"

  source {
    owner             = "AWS"
    source_identifier = "REQUIRED_TAGS"
  }

  # Specify the required tags in the input parameters
  input_parameters = jsonencode({
    tag1Key = "Environment",
    tag2Key = "Owner"
  })

  depends_on = [
    aws_config_configuration_recorder_status.config_recorder_status
  ]
}

# AWS Config Rule: Ensure no S3 buckets have public read access
resource "aws_config_config_rule" "s3_bucket_public_read_prohibited" {
  name = "s3-bucket-public-read-prohibited"

  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_PUBLIC_READ_PROHIBITED"
  }

  depends_on = [
    aws_config_configuration_recorder_status.config_recorder_status
  ]
}

data "aws_caller_identity" "current" {}