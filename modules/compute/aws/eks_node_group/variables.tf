variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  validation {
    condition     = length(var.cluster_name) > 0
    error_message = "The cluster name must not be empty."
  }
}

variable "node_group_name" {
  description = "The name of the EKS node group"
  type        = string
  validation {
    condition     = length(var.node_group_name) > 0
    error_message = "The node group name must not be empty."
  }
}

variable "node_role_arn" {
  description = "The IAM role ARN for the EKS node group"
  type        = string
  validation {
    condition     = length(var.node_role_arn) > 0
    error_message = "The IAM role ARN must not be empty."
  }
}

variable "subnet_ids" {
  description = "The subnet IDs for the EKS node group"
  type        = list(string)
  validation {
    condition     = length(var.subnet_ids) > 0
    error_message = "The subnet IDs list must not be empty."
  }
}

variable "node_group_size" {
  description = "The desired size of the EKS node group"
  type        = number
  validation {
    condition     = var.node_group_size > 0
    error_message = "The node group size must be greater than 0."
  }
}

variable "node_group_max_size" {
  description = "The maximum size of the EKS node group"
  type        = number
  validation {
    condition     = var.node_group_max_size >= var.node_group_size
    error_message = "The maximum size of the node group must be greater than or equal to the desired size."
  }
}

variable "node_group_min_size" {
  description = "The minimum size of the EKS node group"
  type        = number
  validation {
    condition     = var.node_group_min_size <= var.node_group_size
    error_message = "The minimum size of the node group must be less than or equal to the desired size."
  }
}

variable "node_instance_type" {
  description = "The instance type for the nodes in the EKS node group"
  type        = string
  validation {
    condition     = length(var.node_instance_type) > 0
    error_message = "The instance type must not be empty."
  }
}

variable "node_disk_size" {
  description = "The disk size for the nodes in the EKS node group"
  type        = number
  default     = 20
  validation {
    condition     = var.node_disk_size > 0
    error_message = "The disk size must be greater than 0."
  }
}

variable "key_name" {
  description = "The key name for SSH access to the nodes"
  type        = string
  default     = null
}

variable "source_security_group_ids" {
  description = "The security group IDs to allow SSH access to the nodes"
  type        = list(string)
  default     = []
}

variable "max_unavailable" {
  description = "The maximum number of nodes unavailable during update"
  type        = number
  default     = 1
  validation {
    condition     = var.max_unavailable > 0
    error_message = "The maximum number of unavailable nodes must be greater than 0."
  }
}

variable "launch_template_id" {
  description = "The ID of the launch template to use for the node group"
  type        = string
  default     = null
}

variable "launch_template_version" {
  description = "The version of the launch template to use for the node group"
  type        = string
  default     = null
}

variable "node_group_tags" {
  description = "A map of tags to assign to the EKS node group"
  type        = map(string)
  default     = {}
}

variable "capacity_type" {
  description = "The capacity type of the node group (e.g., ON_DEMAND, SPOT)"
  type        = string
}

variable "ami_type" {
  description = "The AMI type for the node group (e.g., AL2_x86_64, AL2_x86_64_GPU)"
  type        = string
}
