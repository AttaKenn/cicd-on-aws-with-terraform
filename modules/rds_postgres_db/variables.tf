variable "identifier" {
  description = "DB identifier/RDS instance name"
  type        = string
}

variable "db_name" {
  description = "DB name in the DB instance"
  type        = string
}

variable "engine" {
  description = "DB engine"
  type        = string
}

variable "engine_version" {
  description = "DB engine version"
  type        = string
}

variable "instance_class" {
  type        = string
  description = "DB instance class"
}

variable "username" {
  type        = string
  description = "DB instance master username"
}

variable "password" {
  type        = string
  description = "Master password"
}

variable "skip_final_snapshot" {
  type = bool
}

variable "storage_encrypted" {
  type = bool
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "Security groups for DB instance"
}

variable "db_subnet_group_name" {
  type        = string
  description = "Subnet for DB instance"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Alpha Subnet groud IDs list"
}

variable "tags" {
  type = object({
    Terraform   = bool
    Environment = string
  })
}

variable "aws_db_subnet_group_tags" {
  type = object({
    Name        = string
    Terraform   = bool
    Environment = string
  })
}

variable "allocated_storage" {
  type = string
}