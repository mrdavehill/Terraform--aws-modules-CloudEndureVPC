This module creates a single AZ CloudEndure VPC with private and public subnets, an IGW, NAT gateway and VGW, route tabls, NACLs and SGs.

Routing is nailed down to send CloudEdnure console traffic out the IGW and on-prem traffic to the VGW

The site-to-site VPN needs to be manually added to the VGW

![Diagram v1.0](CloudEndure%20AWS%20WAN%20version%201.0%20-%20Terraform%20Documentation.jpg)
