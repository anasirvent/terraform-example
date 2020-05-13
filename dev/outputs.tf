output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.network.vpc_id
}

output "vpc_cidr" {
  description = "The ID of the VPC"
  value       = module.network.vpc_cidr_block
}

output "public_subnets" {
  description = "List of IDs of private subnets"
  value       = module.network.public_subnets
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.network.private_subnets
}

output "route_table_public" {
  description = "List of route tables of private subnets"
  value       = module.network.public_route_table_ids
}
output "route_table_private" {
  description = "List of route tables of private subnets"
  value       = module.network.private_route_table_ids
}
