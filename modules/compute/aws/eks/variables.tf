variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  validation {
    condition     = length(var.cluster_name) > 0
    error_message = "The cluster name must not be empty."
  }
}

variable "iam_role_arn" {
  description = "The IAM role ARN for the EKS cluster"
  type        = string
  validation {
    condition     = length(var.iam_role_arn) > 0
    error_message = "The IAM role ARN must not be empty."
  }
}

variable "subnet_ids" {
  description = "The subnet IDs for the EKS cluster"
  type        = list(string)
  validation {
    condition     = length(var.subnet_ids) > 0
    error_message = "The subnet IDs list must not be empty."
  }
}

variable "endpoint_public_access" {
  description = "Whether the EKS cluster endpoint should be publicly accessible"
  type        = bool
  default     = true
}

variable "endpoint_private_access" {
  description = "Whether the EKS cluster endpoint should be privately accessible"
  type        = bool
  default     = false
}

variable "public_access_cidrs" {
  description = "List of CIDR blocks that can access the EKS cluster endpoint"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "service_ipv4_cidr" {
  description = "The CIDR block to assign Kubernetes service IP addresses"
  type        = string
  default     = null
}

variable "enabled_cluster_log_types" {
  description = "A list of the desired control plane logging to enable"
  type        = list(string)
  default     = []
}

variable "eks_tags" {
  description = "A map of tags to assign to the EKS cluster"
  type        = map(string)
  default     = {}
}
