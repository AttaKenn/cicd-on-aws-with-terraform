variable "cloudwatch-guardduty-finding" {
  type = string
}

variable "alpha-security-alerts" {
  type = string
}

variable "alpha-cloudwatch-sns" {
  type = string
}

variable "tags" {
  type = object({
    Environment = string
    Terraform   = bool
  })
}

variable "sms-target" {
  type = string
}

variable "sms-target-protocol" {
  type = string
}

variable "cloudwatch-sns-event-target" {
  type = string
}

variable "cloudwatch-guardduty-finding-description" {
  type = string
}