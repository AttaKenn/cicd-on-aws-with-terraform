terraform {
  backend "s3" {
    bucket         = "alpha-tf-state-bucket-demo"
    key            = "terraform/state.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-state-locks-demo" # DynamoDB table for state locking
    encrypt        = true                    # Enable server-side encryption of the state file
  }
}
