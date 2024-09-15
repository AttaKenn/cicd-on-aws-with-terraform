variable "route_table_id" {
  description = "Id of the route table to insert this route configuration into"
  type        = string
}

variable "destination_cidr_block" {
  description = "Destination CIDR block value"
  type        = string
}

variable "transit_gateway_id" {
  description = "Id of transit gateway"
  type        = string
}
