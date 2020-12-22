## Public Subnet
#########################################################################################
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_cidr
  availability_zone       = var.az
  map_public_ip_on_launch = "false"
}

## Private Subnet
#########################################################################################
resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_cidr
  availability_zone       = var.az
  map_public_ip_on_launch = "false"
}