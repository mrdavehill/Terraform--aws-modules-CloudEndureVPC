## Route Table :: Private
#########################################################################################
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = var.cloud_endure_1
    gateway_id = aws_internet_gateway.igw.id
  }
  route {
    cidr_block = var.cloud_endure_2
    gateway_id = aws_internet_gateway.igw.id
  }
  route {
    cidr_block = var.on_prem_net
    gateway_id = aws_vpn_gateway.vgw.id
  }
}

## Route Table Assocoiation :: Private
#########################################################################################
resource "aws_route_table_association" "private_rta" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}

## Route Table :: Public
#########################################################################################
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = var.cloud_endure_1
    gateway_id = aws_internet_gateway.igw.id
  }
   route {
    cidr_block = var.cloud_endure_2
    gateway_id = aws_internet_gateway.igw.id
  }
}
## Route Table Association :: Public
#########################################################################################
resource "aws_route_table_association" "public_rta" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}