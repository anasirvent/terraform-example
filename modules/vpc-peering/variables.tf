variable "accepter_vpc_id" {
  description = "Accepter vpc id"
  type = string
}

variable "requester_vpc_id" {
  description = "Requester vpc id"
  type = string
}

# variable "peering_routes"{
#  description = "Peering routes for the vpc peering"
#  type        = list(object({
#                route_table_id: string,
#                destination_cidr_block: string
#                }))
# }

variable "routes_primary" {
  type = list(string)
}

variable "routes_secondary" {
  type = list(string)
}

variable "cidr_primary" {
}
variable "cidr_secondary" {
}
