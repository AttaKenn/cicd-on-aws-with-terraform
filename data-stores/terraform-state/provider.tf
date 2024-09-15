terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

# AWS Provider Configuration
provider "aws" {
  region                   = var.region
  shared_config_files      = var.shared_config_files
  shared_credentials_files = var.shared_credentials_files
  profile                  = var.profile
}
