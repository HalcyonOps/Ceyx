variable "security_group_name" {
  description = "The name of the security group"
  type        = string
  validation {
    condition     = length(var.security_group_name) > 0
    error_message = "The security group name must not be empty."
  }
}

variable "security_group_description" {
  description = "The description of the security group"
  type        = string
  validation {
    condition     = length(var.security_group_description) > 0
    error_message = "The security group description must not be empty."
  }
}

variable "vpc_id" {
  description = "The VPC ID to create the security group in"
  type        = string
  validation {
    condition     = length(var.vpc_id) > 0
    error_message = "The VPC ID must not be empty."
  }
}

variable "ingress_rules" {
  description = "A list of ingress rules for the security group"
  type = list(object({
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = list(string)
    ipv6_cidr_blocks = list(string)
    prefix_list_ids  = list(string)
    security_groups  = list(string)
    description      = string
  }))
  default = []
}

variable "egress_rules" {
  description = "A list of egress rules for the security group"
  type = list(object({
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = list(string)
    ipv6_cidr_blocks = list(string)
    prefix_list_ids  = list(string)
    security_groups  = list(string)
    description      = string
  }))
  default = []
}

variable "security_group_tags" {
  description = "A map of tags to assign to the security group"
  type        = map(string)
  default     = {}
}
