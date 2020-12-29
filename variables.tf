## Variables
#########################################################################################
variable "region" {
    type    = string
}

variable "ec2_service_name" {
  type    = string
  description = "EC2 API endpoint - it's regional"
}

variable "cidr_block" {
  type        = string
  description = "VPC primary CIDR block"
}

variable "public_cidr" {
    type    = string
    description = "Public subnet IP block"
}

variable "private_cidr" {
    type    = string
    description = "Private subnet IP block"
}

variable "az" {
    type    = string
    description = "The single availability zone"
}

#Any additional on prem subnets will need additional sections in the Private NACL, Private Route Table and EC2 Security Group
variable "on_prem_net" {
  type        = list
  description = "On-prem server Vlan"
}

variable "cloud_endure_1" {
  type        = string
  description = "Cloud Endure Console"
  default     = "52.72.172.158/32"
}

variable "cloud_endure_2" {
  type        = string
  description = "Cloud Endure Console"
  default     = "52.53.92.136/32"
}


