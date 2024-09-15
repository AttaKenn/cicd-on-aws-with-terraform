variable "acm-domain-name" {
  type = string
}

variable "acm-validation-method" {
  type = string
}

variable "acm-subject-alternative-names" {
  type = list(string)
}

variable "tags" {
  type = object({
    Environment = string
    Terraform   = bool
  })
}

variable "acm-zone-id" {
  type = string
}

