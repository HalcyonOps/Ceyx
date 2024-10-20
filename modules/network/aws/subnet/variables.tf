variable "vpc_id" {
  description = "The VPC ID to create the subnet in"
  type        = string
  validation {
    condition     = length(var.vpc_id) > 0
    error_message = "The VPC ID must not be empty."
  }
}

variable "cidr_block" {
  description = "The CIDR block for the subnet"
  type        = string
  validation {
    condition     = can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", var.cidr_block))
    error_message = "The CIDR block must be a valid IPv4 CIDR range."
  }
}

variable "availability_zone" {
  description = "The availability zone for the subnet"
  type        = string
  validation {
    condition     = length(var.availability_zone) > 0
    error_message = "The availability zone must not be empty."
  }
}

variable "map_public_ip_on_launch" {
  description = "Whether to map public IPs on launch"
  type        = bool
  default     = false
}

variable "assign_ipv6_address_on_creation" {
  description = "Whether to assign an IPv6 address on creation"
  type        = bool
  default     = false
}

variable "ipv6_cidr_block" {
  description = "The IPv6 CIDR block for the subnet"
  type        = string
  default     = null

  validation {
    condition     = var.assign_ipv6_address_on_creation ? can(regex("^(([0-9a-fA-F]{1,4}:){1,7}([0-9a-fA-F]{1,4})?|::|([0-9a-fA-F]{1,4}:){1,6}:|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:))/[0-9]{1,3}$", var.ipv6_cidr_block)) : true
    error_message = "The IPv6 CIDR block must be a valid IPv6 CIDR range."
  }
}

variable "subnet_tags" {
  description = "A map of tags to assign to the subnet"
  type        = map(string)
  default     = {}
}
