# CloudTrail
resource "aws_cloudtrail" "automat_it_cloutrail" {
  name                          = var.alpha-cloudtrail-name
  s3_bucket_name                = aws_s3_bucket.automat_it_cloutrail_bucket.bucket
  include_global_service_events = false

  tags = var.tags

  depends_on = [aws_s3_bucket.automat_it_cloutrail_bucket, aws_s3_bucket_policy.cloudtrail_bucket_policy]
}

resource "aws_s3_bucket" "automat_it_cloutrail_bucket" {
  bucket        = var.alpha-cloudtrail-bucket
  force_destroy = var.force-destroy-cloudtrail-bucket

  tags = var.tags
}

resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.automat_it_cloutrail_bucket.id

  block_public_acls       = var.cloudtrail-bucket-block-public-acls
  block_public_policy     = var.cloudtrail-bucket-block-public-policy
  ignore_public_acls      = var.cloudtrail-bucket-ignore-public-acls
  restrict_public_buckets = var.cloudtrail-bucket-restrict-public-buckets
  depends_on              = [aws_s3_bucket.automat_it_cloutrail_bucket]
}

resource "aws_s3_bucket_policy" "cloudtrail_bucket_policy" {
  bucket = aws_s3_bucket.automat_it_cloutrail_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "AWSCloudTrailAclCheck20150319",
        Effect = "Allow",
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        },
        Action   = "s3:GetBucketAcl",
        Resource = aws_s3_bucket.automat_it_cloutrail_bucket.arn
      },
      {
        Sid    = "AWSCloudTrailWrite20150319",
        Effect = "Allow",
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        },
        Action   = "s3:PutObject",
        Resource = "${aws_s3_bucket.automat_it_cloutrail_bucket.arn}/AWSLogs/${data.aws_caller_identity.current.account_id}/*",
        Condition = {
          StringEquals = {
            "s3:x-amz-acl" = "bucket-owner-full-control"
          }
        }
      }
    ]
  })
}

data "aws_caller_identity" "current" {}
