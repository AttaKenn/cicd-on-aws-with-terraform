resource "aws_dynamodb_table" "terraform_locks" {
  name                        = var.dynamodb-name
  billing_mode                = var.dynamodb-billing-mode
  hash_key                    = var.dynamodb-hash-key
  deletion_protection_enabled = var.dynamodb-del-protection-enabled

  attribute {
    name = var.dynamodb-attr-name
    type = var.dynamodb-attr-type
  }

  tags = var.dynamodb-tags
}

