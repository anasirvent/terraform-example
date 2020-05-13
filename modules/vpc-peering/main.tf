resource "aws_vpc_peering_connection" "vpc_peering" {
  #accepter: management
  peer_vpc_id   = var.accepter_vpc_id
  #requester: current environemnt
  vpc_id        = var.requester_vpc_id
  auto_accept = true
}


resource "aws_route" "peering_route_primary_to_secondary" {
  for_each = toset(var.routes_primary)
  route_table_id = each.key
  destination_cidr_block    =   var.cidr_secondary
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
}

resource "aws_route" "peering_route_secondary_to_primary" {
  for_each = toset(var.routes_secondary)
  route_table_id            =   each.key
  destination_cidr_block    =   var.cidr_primary
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
}
