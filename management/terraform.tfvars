name = "my-management-vpc"
cidr = "10.10.0.0/16"
private_subnets = ["10.10.10.0/24","10.10.20.0/24"]
public_subnets = ["10.10.30.0/24","10.10.40.0/24"]
availability_zones=["eu-west-1a", "eu-west-1b"]
#number of gateways - one per az
enable_nat_gateway = true
single_nat_gateway = false
one_nat_gateway_per_az = true
