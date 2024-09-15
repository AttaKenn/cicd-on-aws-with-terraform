variable "sg-private-mgmt-name" {
  description = "Security group name"
  type        = string
}

variable "vpc_id" {
  description = "ID of VPC to associate this security group to"
  type        = string
}

variable "sg-private-mgmt-tags" {
  type = object({
    Name      = string
    Terraform = string
  })
}

variable "sg-private-mgmt-ingress-port-0-cidr" {
  type = list(string)
}
