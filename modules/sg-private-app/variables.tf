variable "application_vpc_private_sg_name" {
  description = "Security group name"
  type        = string
}

variable "vpc_id" {
  description = "ID of VPC to associate this security group to"
  type        = string
}

variable "sg-private-app-ingress-port-0-cidr" {
  type = list(string)
}

variable "application-vpc-sg-tags" {
  type = any
}