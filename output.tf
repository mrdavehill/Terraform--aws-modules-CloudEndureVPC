

# VPC
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.vpc.•.id
}

/*
# CIDR blocks
output "cidr_block" {
  description = "The CIDR block of the VPC"
  value       = cidr_block
}

# Subnets
output "private_cidr" {
  description = "List of IDs of private subnets"
  value       = vpc.private_cidr
}

output "public_cidr" {
  description = "List of IDs of public subnets"
  value       = vpc.public_cidr
}

# NAT gateways
output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = pc.nat_public_ips
}

# AZs
output "az" {
  description = "A list of availability zones spefified as argument to this module"
  value       = module.vpc.az
}
*/
