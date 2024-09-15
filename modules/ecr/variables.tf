variable "name" {
  description = "ECR Repo name"
  type        = string
}

variable "tags" {
  type = object({
    Environment = string
    Terraform   = bool
  })
}

variable "ecr-force-delete" {
  type    = bool
  default = true
}