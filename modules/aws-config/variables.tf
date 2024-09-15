variable "alpha-config-bucket" {
  type = string
}

variable "alpha-config-recorder" {
  type = string
}

variable "alpha-default" {
  type = string
}

variable "alpha-config-role" {
  type = string
}

variable "tags" {
  type = object({
    Environment = string
    Terraform   = bool
  })
}

variable "force-destroy-config-bucket" {
  type = bool
}

variable "config-bucket-block-public-acls" {
  type = bool
}

variable "config-bucket-block-public-policy" {
  type = bool
}

variable "config-bucket-ignore-public-acls" {
  type = bool
}

variable "config-bucket-restrict-public-buckets" {
  type = bool
}

variable "all-supported-recording-group" {
  type = bool
}

variable "enable-config-recorder-status" {
  type = bool
}