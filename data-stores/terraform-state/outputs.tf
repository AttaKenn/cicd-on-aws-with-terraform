output "dynamodb_table" {
  value = aws_dynamodb_table.terraform_locks.id
}

output "aws_s3_bucket" {
  value = aws_s3_bucket.terraform_state.id
}