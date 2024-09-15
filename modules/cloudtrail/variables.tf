variable "alpha-cloudtrail-name" {
  type = string
}

variable "alpha-cloudtrail-bucket" {
  type = string
}

variable "tags" {
  type = object({
    Environment = string
    Terraform   = bool
  })
}

variable "force-destroy-cloudtrail-bucket" {
  type    = bool
  default = true
}

variable "cloudtrail-bucket-block-public-acls" {
  type = bool
}

variable "cloudtrail-bucket-block-public-policy" {
  type = bool
}

variable "cloudtrail-bucket-ignore-public-acls" {
  type = bool
}

variable "cloudtrail-bucket-restrict-public-buckets" {
  type = bool
}