variable "environment" {
  description = "Evironment name"
  default = "Dev"
}
variable "name" {
  description = "Name to be used on all the resources as identifier"
  default     = ""
}

variable "cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overriden"
  default     = "0.0.0.0/0"
}

variable "public_subnets" {
  description = "number of subnets to be created"
  type = list
}

variable "private_subnets" {
  description = "number of subnets to be created"
  type = list
}

variable "availability_zones" {
  description = "Availability zones to create the subnets"
  type = list
}

variable "enable_nat_gateway" {
  description = "Enable nat gateway boolean"
  type = bool
}

variable "single_nat_gateway" {
  description = "Single nat gateway boolean"
  type = bool
}

variable "one_nat_gateway_per_az" {
  description = "Enable nat gateway per az boolean"
  type = bool
}
