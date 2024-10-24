variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  validation {
    condition     = can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", var.cidr_block))
    error_message = "The CIDR block must be a valid IPv4 CIDR range."
  }
}

variable "vpc_tags" {
  description = "A map of tags to assign to the VPC"
  type        = map(string)
  default     = {}
}

variable "enable_dns_support" {
  description = "A boolean flag to enable/disable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "assign_ipv6_cidr_block" {
  description = "Whether to assign an IPv6 CIDR block to the VPC"
  type        = bool
  default     = false
}

variable "ipv6_cidr_block" {
  description = "The IPv6 CIDR block for the VPC"
  type        = string
  default     = ""

  validation {
    condition     = var.assign_ipv6_cidr_block == false || can(regex("^(([0-9a-fA-F]{1,4}:){1,7}([0-9a-fA-F]{1,4})?|::|([0-9a-fA-F]{1,4}:){1,6}:|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,7}|:))/[0-9]{1,3}$", var.ipv6_cidr_block))
    error_message = "The IPv6 CIDR block must be a valid IPv6 CIDR range if assign_ipv6_cidr_block is true."
  }
}

variable "create_internet_gateway" {
  description = "Whether to create an Internet Gateway for the VPC"
  type        = bool
  default     = false
}

variable "igw_tags" {
  description = "A map of tags to assign to the Internet Gateway"
  type        = map(string)
  default     = {}
}

variable "create_nat_gateway" {
  description = "Whether to create a NAT Gateway for the VPC"
  type        = bool
  default     = false
}

variable "nat_allocation_id" {
  description = "The allocation ID of the Elastic IP address for the NAT Gateway"
  type        = string
  default     = null
}

variable "nat_subnet_id" {
  description = "The subnet ID in which to create the NAT Gateway"
  type        = string
  default     = null
}

variable "nat_tags" {
  description = "A map of tags to assign to the NAT Gateway"
  type        = map(string)
  default     = {}
}

variable "create_vpn_gateway" {
  description = "Whether to create a VPN Gateway for the VPC"
  type        = bool
  default     = false
}

variable "vpn_tags" {
  description = "A map of tags to assign to the VPN Gateway"
  type        = map(string)
  default     = {}
}
