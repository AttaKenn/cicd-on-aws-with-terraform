resource "aws_s3_bucket" "terraform_state" {
  bucket = var.tf-state-bucket

  tags = var.bucket-tags
}

resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.terraform_state.bucket

  block_public_acls       = var.block-public-acls
  block_public_policy     = var.block-public-policy
  ignore_public_acls      = var.ignore-public-acls
  restrict_public_buckets = var.restrict-public-buckets
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = var.bucket-versioning-status
  }
}
