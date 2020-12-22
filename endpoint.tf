## VPC Endpoint
#########################################################################################
resource "aws_vpc_endpoint" "ec2" {
  vpc_id             = aws_vpc.vpc.id  
  service_name       = var.ec2_service_name 
  vpc_endpoint_type  = "Interface"

  security_group_ids = [
      aws_security_group.vpce-sg.id,
  ]
}

## VPC Endpoint Association
#########################################################################################
resource "aws_vpc_endpoint_subnet_association" "private_ec2" {
 vpc_endpoint_id = aws_vpc_endpoint.ec2.id
 subnet_id      = aws_subnet.private_subnet.id
}
