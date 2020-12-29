## Public Subnet NACL
#########################################################################################
resource "aws_network_acl" "public" {
  vpc_id = aws_vpc.vpc.id
  subnet_ids = [aws_subnet.public_subnet.id]

# Inbound
# allow inbound from private_subnet on ephemeral ports
  ingress {
    protocol   = "tcp"
    rule_no    = 10
    action     = "allow"
    cidr_block = var.private_cidr
    from_port  = 1024
    to_port    = 65535
  }
  
  # allow inbound towards CloudEndure1 on 443 (from private_subnet)
  ingress {
    protocol   = "tcp"
    rule_no    = 20
    action     = "allow"
    cidr_block = var.cloud_endure_1
    from_port  = 443
    to_port    = 443
  }
  
  # allow inbound from CloudEndure1 on ephemeral ports 
  ingress {
    protocol   = "tcp"
    rule_no    = 30
    action     = "allow"
    cidr_block = var.cloud_endure_1
    from_port  = 1024
    to_port    = 65535
  }
  
 # allow inbound towards CloudEndure2 on 443 (from private_subnet)
 ingress {
   protocol   = "tcp"
   rule_no    = 40
   action     = "allow"
   cidr_block = var.cloud_endure_2
   from_port  = 443
   to_port    = 443
 }
 
 # allow inbound from CloudEndure2 on ephemeral ports 
 ingress {
   protocol   = "tcp"
   rule_no    = 50
   action     = "allow"
   cidr_block = var.cloud_endure_2
   from_port  = 1024
   to_port    = 65535
 }
  # Outbound
  # allow outbound to private_subnet on ephemeral ports 
  egress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = var.private_cidr
    from_port  = 1024
    to_port    = 65535
  }

  # allow outbound to CloudEndure1 on 443
  egress {
    protocol   = "tcp"
    rule_no    = 120
    action     = "allow"
    cidr_block = var.cloud_endure_1
    from_port  = 443
    to_port    = 443
  }
 
  # allow outbound to CloudEndure2 on 443
 egress {
   protocol   = "tcp"
   rule_no    = 130
   action     = "allow"
   cidr_block = var.cloud_endure_2
   from_port  = 443
   to_port    = 443
 }
} 

## Private Subnet NACL
#########################################################################################
resource "aws_network_acl" "private" {
  vpc_id = aws_vpc.vpc.id
  subnet_ids = [aws_subnet.private_subnet.id]

# Inbound
# allow inbound from CloudEndure1 on ephemeral ports
 ingress {
   protocol   = "tcp"
   rule_no    = 10
   action     = "allow"
   cidr_block = var.cloud_endure_1
   from_port  = 1024
   to_port    = 65535
 }

 # allow inbound from CloudEndure2 on ephemeral ports 
 ingress {
   protocol   = "tcp"
   rule_no    = 20
   action     = "allow"
   cidr_block = var.cloud_endure_2
   from_port  = 1024
   to_port    = 65535
 }

# allow inbound from on-prem server Vlan
ingress {
  protocol   = "tcp"
  rule_no    = 30
  action     = "allow"
  cidr_block = var.on_prem_net[*]
  from_port  = 1500
  to_port    = 1500
}

# Outbound
# allow outbound to CloudEndure1 on 443 
 egress {
   protocol   = "tcp"
   rule_no    = 110
   action     = "allow"
   cidr_block = var.cloud_endure_1
   from_port  = 443
   to_port    = 443
 } 
 
 # allow outbound to CloudEndure2 on 443 
 egress {
   protocol   = "tcp"
   rule_no    = 120
   action     = "allow"
   cidr_block = var.cloud_endure_2
   from_port  = 443
   to_port    = 443
 }

# allow outbound to on-prem server Vlan for replication on ephemeral ports 
egress {
  protocol   = "tcp"
  rule_no    = 130
  action     = "allow"
  cidr_block = var.on_prem_net[*]
  from_port  = 1024
  to_port    = 65535
 }
}