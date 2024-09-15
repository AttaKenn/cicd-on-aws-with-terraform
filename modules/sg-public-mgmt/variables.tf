variable "sg-public-mgmt-name" {
  description = "Security group name"
  type        = string
}

variable "vpc_id" {
  description = "ID of VPC to associate this security group to"
  type        = string
}

variable "sg-public-mgmt-ingress-port-80-cidr" {
  type = list(string)
}

variable "sg-public-mgmt-ingress-port-443-cidr" {
  type = list(string)
}

variable "sg-public-mgmt-ingress-port-22-cidr" {
  type = list(string)
}

variable "sg-public-mgmt-ingress-port-943-cidr" {
  type = list(string)
}

variable "sg-public-mgmt-ingress-port-1194-cidr" {
  type = list(string)
}

variable "sg-public-mgmt-tags" {
  type = object({
    Name      = string
    Terraform = bool
  })
}