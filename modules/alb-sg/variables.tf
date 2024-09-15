variable "alb-sg-name" {
  description = "Security group name"
  type        = string
}

variable "alb-sg-description" {
  type = string
}

variable "vpc_id" {
  description = "ID of VPC to associate this security group to"
  type        = string
}

variable "alb-sg-port80-description" {
  type = string
}

variable "alb-sg-ingress-port-80-cidr" {
  type = list(string)
}

variable "alb-sg-port443-description" {
  type = string
}

variable "alb-sg-ingress-port-443-cidr" {
  type = list(string)
}

variable "alb-sg-tags" {
  type = object({
    Name        = string
    Terraform   = bool
    Environment = string
  })
}
