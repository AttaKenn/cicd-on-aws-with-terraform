variable "alb-name" {
  type = string
}

variable "alb-placement" {
  type    = bool
  default = false
}

variable "alb-type" {
  type    = string
  default = "application"
}

variable "alb-sg" {
  type = list(string)
}

variable "alb-subnets" {
  type = list(string)
}

variable "enable-alb-deletion-protection" {
  type    = bool
  default = false
}

variable "alb-tg-name" {
  type = string
}

variable "alb-target-port" {
  type = number
}

variable "alb-target-protocol" {
  type    = string
  default = "HTTP"
}

variable "vpc_id" {
  type = string
}

variable "alb-health-check-path" {
  type    = string
  default = "/"
}

variable "alb-healthy-threshold" {
  type    = number
  default = 2
}

variable "alb-unhealthy-threshold" {
  type    = number
  default = 10
}

variable "alb-listener-port" {
  type    = number
  default = 80
}

variable "alb-listener-protocol" {
  type    = string
  default = "HTTP"
}

variable "alb-target-id" {
  type = string
}