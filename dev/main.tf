provider "aws" {
  region = "eu-west-1"
}

terraform {
  required_version = ">= 0.12"
  backend "s3" {
    bucket="terraform-example-ana"
    key="dev/terraform.tfstate"
    region="eu-west-1"
    dynamodb_table = "tf-example-lock"
    encrypt        = true
  }
}

data "terraform_remote_state" "management" {
  backend = "s3"
  config = {
    bucket = "terraform-example-ana"
    key    = "management/terraform.tfstate"
    region = "eu-west-1"
  }
}

module "network" {
  source = "terraform-aws-modules/vpc/aws"
  name = var.name
  cidr = var.cidr
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  azs = var.availability_zones
  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway
  one_nat_gateway_per_az = var.one_nat_gateway_per_az

  tags = {
   Terraform = "true"
   Environment = var.environment
 }
}



module "peering" {
  source = "../modules/vpc-peering"
  accepter_vpc_id = "${data.terraform_remote_state.management.outputs.vpc_id}"
  requester_vpc_id = module.network.vpc_id

  routes_primary = concat(module.network.public_route_table_ids, module.network.private_route_table_ids)
  routes_secondary = concat(data.terraform_remote_state.management.outputs.route_table_private,
  data.terraform_remote_state.management.outputs.route_table_public)
  cidr_primary = module.network.vpc_cidr_block
  cidr_secondary = "${data.terraform_remote_state.management.outputs.vpc_cidr}"

  # peering_routes =  [{
  #   route_table_id = "${data.terraform_remote_state.management.outputs.route_table_private[0]}"
  #   destination_cidr_block   = module.network.vpc_cidr
  # },{
  #   route_table_id = "${data.terraform_remote_state.management.outputs.route_table_public[0]}"
  #   destination_cidr_block   = module.network.vpc_cidr
  # },
  # {
  #   route_table_id = module.network.route_table_public[0]
  #   destination_cidr_block   = "${data.terraform_remote_state.management.outputs.vpc_cidr}"
  # },
  # {
  #   route_table_id = module.network.route_table_private[0]
  #   destination_cidr_block   = "${data.terraform_remote_state.management.outputs.vpc_cidr}"
  # }]
}
