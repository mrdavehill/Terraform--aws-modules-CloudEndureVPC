## Security Group :: VPC Endpoint
#########################################################################################
resource "aws_security_group" "vpce-sg" {
  description      = "VPC Endpoint - TCP 443 only"
  vpc_id = aws_vpc.vpc.id
  ingress {
      from_port    = 443
      to_port      = 443
      protocol     = "tcp"
      cidr_blocks  = [aws_subnet.private_subnet.cidr_block]
  }

  egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security Group :: Staging Area
#########################################################################################
resource "aws_security_group" "ec2-sg" {
  description      = "CloudEndure Staging Servers on 1500"
  vpc_id = aws_vpc.vpc.id
  ingress {
      from_port    = 1500
      to_port      = 1500
      protocol     = "tcp"
      cidr_blocks  = [var.on_prem_net, 
          ]
  }

  egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}



