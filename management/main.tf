provider "aws" {
  region = "eu-west-1"
}

terraform {
  required_version = ">= 0.12"
  backend "s3" {
    bucket="terraform-example-ana"
    key="management/terraform.tfstate"
    region="eu-west-1"
    dynamodb_table = "tf-example-lock"
    encrypt        = true
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
