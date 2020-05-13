name = "my-dev-vpc"
cidr = "172.20.0.0/16"
private_subnets = ["172.20.10.0/24","172.20.20.0/24"]
public_subnets = ["172.20.30.0/24","172.20.40.0/24"]
availability_zones=["eu-west-1b", "eu-west-1c"]
#number of gateways - only one in the vpc
enable_nat_gateway = true
single_nat_gateway = true
one_nat_gateway_per_az = false
