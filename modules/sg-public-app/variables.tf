variable "name" {
  description = "Security group name"
  type        = string
}

variable "vpc_id" {
  description = "ID of VPC to associate this security group to"
  type        = string
}

variable "application-vpc-sg-tags" {
  type = any
}

variable "application-vpc-sg-anywhere-cidr-block" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "application-vpc-public-sg-description" {
  type    = string
  default = "Allow HTTP and HTTPS inbound traffic"
}