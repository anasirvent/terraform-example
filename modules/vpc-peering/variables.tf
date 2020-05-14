variable "accepter_vpc_id" {
  description = "Accepter vpc id"
  type = string
}

variable "requester_vpc_id" {
  description = "Requester vpc id"
  type = string
}


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
