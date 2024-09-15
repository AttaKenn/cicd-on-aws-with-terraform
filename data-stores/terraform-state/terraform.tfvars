# Provider
profile                  = "default"
shared_config_files      = ["~/.aws/config"]
shared_credentials_files = ["~/.aws/credentials"]

# Remote State Bucket
tf-state-bucket = "alpha-tf-state-bucket-demo"
bucket-tags = {
  Name        = "Terraform State Bucket"
  Environment = "dev"
  Terraform   = true
}
block-public-acls        = true
block-public-policy      = true
ignore-public-acls       = true
restrict-public-buckets  = true
bucket-versioning-status = "Enabled"

# DynamoDb for State Locking
dynamodb-name                   = "terraform-state-locks-demo"
dynamodb-billing-mode           = "PAY_PER_REQUEST"
dynamodb-hash-key               = "LockID"
dynamodb-del-protection-enabled = true
dynamodb-attr-name              = "LockID"
dynamodb-attr-type              = "S"
dynamodb-tags = {
  Name        = "Terraform State Locks"
  Environment = "dev"
}