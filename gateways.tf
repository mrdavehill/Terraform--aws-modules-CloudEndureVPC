## Internet Gateway
#########################################################################################
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
}

## NAT Gateway
#########################################################################################
resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_subnet.id

  depends_on    = [aws_internet_gateway.igw]
}

## Elastic IP
#########################################################################################
resource "aws_eip" "nat" {

  depends_on    = [aws_internet_gateway.igw]
}  

## Virtual Private Gateway
#########################################################################################
resource "aws_vpn_gateway" "vgw" {
  vpc_id = aws_vpc.vpc.id

  lifecycle {
    prevent_destroy = false
  }
}