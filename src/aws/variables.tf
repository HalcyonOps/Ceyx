# src/aws/variables.tf

# AWS Provider Variables
variable "aws_profile" {
  description = "The AWS CLI profile to use"
  type        = string
  validation {
    condition     = length(var.aws_profile) > 0
    error_message = "The AWS profile must not be empty."
  }
}

variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  validation {
    condition     = can(regex("^[a-z]{2}-[a-z]+-[0-9]$", var.aws_region))
    error_message = "The AWS region must be a valid region identifier (e.g., us-west-2)."
  }
}

# VPC Variables
variable "vpcs" {
  description = "List of VPC configurations"
  type = list(object({
    cidr_block              = string
    enable_dns_support      = bool
    enable_dns_hostnames    = bool
    assign_ipv6_cidr_block  = bool
    ipv6_cidr_block         = string
    create_internet_gateway = bool
    igw_tags                = map(string)
    create_nat_gateway      = bool
    nat_allocation_id       = string
    nat_subnet_id           = string
    nat_tags                = map(string)
    create_vpn_gateway      = bool
    vpn_tags                = map(string)
    vpc_tags                = map(string)
  }))
  default = []
}

# Subnet Variables
variable "subnets" {
  description = "List of subnet configurations"
  type = list(object({
    availability_zone               = string
    cidr_block                      = string
    subnet_tags                     = map(string)
    vpc_id                          = string
    map_public_ip_on_launch         = bool
    assign_ipv6_address_on_creation = bool
    ipv6_cidr_block                 = string
  }))
  default = []
}

# Security Group Variables
variable "security_groups" {
  description = "List of security group configurations"
  type = list(object({
    security_group_description = string
    security_group_name        = string
    security_group_tags        = map(string)
    vpc_id                     = string
    ingress_rules = list(object({
      from_port        = number
      to_port          = number
      protocol         = string
      cidr_blocks      = list(string)
      ipv6_cidr_blocks = list(string)
      prefix_list_ids  = list(string)
      security_groups  = list(string)
      description      = string
    }))
    egress_rules = list(object({
      from_port        = number
      to_port          = number
      protocol         = string
      cidr_blocks      = list(string)
      ipv6_cidr_blocks = list(string)
      prefix_list_ids  = list(string)
      security_groups  = list(string)
      description      = string
    }))
  }))
  default = []
}

# EC2 Instance Variables
variable "ec2_instances" {
  description = "List of EC2 instance configurations"
  type = list(object({
    ami_id                               = string
    instance_type                        = string
    disable_api_termination              = bool
    monitoring                           = bool
    key_name                             = string
    associate_public_ip_address          = bool
    availability_zone                    = string
    ebs_optimized                        = bool
    iam_instance_profile                 = string
    instance_initiated_shutdown_behavior = string
    user_data                            = string
    user_data_base64                     = string
    ec2_tags                             = map(string)
  }))
  default = []
}

# EKS Cluster Variables
variable "eks_clusters" {
  description = "List of EKS cluster configurations"
  type = list(object({
    cluster_name              = string
    iam_role_arn              = string
    subnet_ids                = list(string)
    endpoint_public_access    = bool
    endpoint_private_access   = bool
    public_access_cidrs       = list(string)
    service_ipv4_cidr         = string
    enabled_cluster_log_types = list(string)
    eks_tags                  = map(string)
  }))
  default = []
}

# EKS Node Group Variables
variable "eks_node_groups" {
  description = "List of EKS node group configurations"
  type = list(object({
    cluster_name              = string
    node_group_name           = string
    node_role_arn             = string
    subnet_ids                = list(string)
    node_group_size           = number
    node_group_max_size       = number
    node_group_min_size       = number
    node_instance_type        = string
    node_disk_size            = number
    key_name                  = string
    source_security_group_ids = list(string)
    max_unavailable           = number
    launch_template_id        = string
    launch_template_version   = string
    node_group_tags           = map(string)
    capacity_type             = optional(string, null) # Use `optional()` to set a default value or null if not provided
    ami_type                  = optional(string, null) # Use `optional()` to set a default value or null if not provided
  }))
  default = []
}

# EBS Volume Variables
variable "ebs_volumes" {
  description = "List of EBS volume configurations"
  type = list(object({
    availability_zone     = string
    size                  = number
    volume_type           = string
    encrypted             = bool
    iops                  = number
    kms_key_id            = string
    ebs_tags              = map(string)
    create_snapshot       = bool
    snapshot_tags         = map(string)
    encryption_by_default = bool
  }))
  default = []
}

# S3 Bucket Variables
variable "s3_buckets" {
  description = "List of S3 bucket configurations"
  type = list(object({
    bucket_name                 = string
    versioning_status           = string
    sse_algorithm               = string
    kms_master_key_id           = string
    create_bucket               = bool
    s3_tags                     = map(string)
    bucket_policy               = string
    cors_allowed_headers        = list(string)
    cors_allowed_methods        = list(string)
    cors_allowed_origins        = list(string)
    cors_expose_headers         = list(string)
    cors_max_age_seconds        = number
    enable_unlimited_cors_cache = bool
    lifecycle_expiration_days   = number
    logging_target_bucket       = string
    logging_target_prefix       = string
    website_index_document      = string
    website_error_document      = string
  }))
  default = []
}
