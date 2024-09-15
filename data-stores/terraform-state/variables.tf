# Provider
variable "region" {
  description = "AWS default Region"
  type        = string
  default     = "eu-west-1"
}

variable "profile" {
  description = "AWS profile"
  type        = string
}

variable "shared_config_files" {
  description = "AWS shared config files"
  type        = list(string)
}

variable "shared_credentials_files" {
  description = "AWS shared creds files"
  type        = list(string)
}

# Remote State Bucket
variable "tf-state-bucket" {
  type = string
}

variable "bucket-tags" {
  type = object({
    Name        = string
    Environment = string
    Terraform   = bool
  })
}

variable "block-public-acls" {
  type = bool
}

variable "block-public-policy" {
  type = bool
}

variable "ignore-public-acls" {
  type = bool
}

variable "restrict-public-buckets" {
  type = bool
}

variable "bucket-versioning-status" {
  type = string
}

# DynamoDB
variable "dynamodb-name" {
  type = string
}

variable "dynamodb-billing-mode" {
  type    = string
  default = "PAY_PER_REQUEST"
}

variable "dynamodb-hash-key" {
  type = string
}

variable "dynamodb-del-protection-enabled" {
  type = bool
}

variable "dynamodb-attr-name" {
  type = string
}

variable "dynamodb-attr-type" {
  type = string
}

variable "dynamodb-tags" {
  type = object({
    Name        = string
    Environment = string
  })
}