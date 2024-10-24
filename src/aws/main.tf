# Provider Configuration
provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}

# VPC Module
module "vpc" {
  source = "../../modules/network/aws/vpc"

  for_each = { for idx, vpc in var.vpcs : idx => vpc if length(var.vpcs) > 0 }

  cidr_block              = each.value.cidr_block
  enable_dns_support      = each.value.enable_dns_support
  enable_dns_hostnames    = each.value.enable_dns_hostnames
  assign_ipv6_cidr_block  = each.value.assign_ipv6_cidr_block
  ipv6_cidr_block         = each.value.ipv6_cidr_block
  create_internet_gateway = each.value.create_internet_gateway
  igw_tags                = each.value.igw_tags
  create_nat_gateway      = each.value.create_nat_gateway
  nat_allocation_id       = each.value.nat_allocation_id
  nat_subnet_id           = each.value.nat_subnet_id
  nat_tags                = each.value.nat_tags
  create_vpn_gateway      = each.value.create_vpn_gateway
  vpn_tags                = each.value.vpn_tags
  vpc_tags                = each.value.vpc_tags
}

# Subnet Module
module "subnet" {
  source = "../../modules/network/aws/subnet"

  for_each = { for idx, subnet in var.subnets : idx => subnet if length(var.subnets) > 0 }

  availability_zone               = each.value.availability_zone
  cidr_block                      = each.value.cidr_block
  subnet_tags                     = each.value.subnet_tags
  vpc_id                          = each.value.vpc_id
  map_public_ip_on_launch         = each.value.map_public_ip_on_launch
  assign_ipv6_address_on_creation = each.value.assign_ipv6_address_on_creation
  ipv6_cidr_block                 = each.value.ipv6_cidr_block
}

# Security Group Module
module "security_group" {
  source = "../../modules/network/aws/security_group"

  for_each = { for idx, sg in var.security_groups : idx => sg if length(var.security_groups) > 0 }

  security_group_description = each.value.security_group_description
  security_group_name        = each.value.security_group_name
  security_group_tags        = each.value.security_group_tags
  vpc_id                     = each.value.vpc_id

  ingress_rules = each.value.ingress_rules
  egress_rules  = each.value.egress_rules
}

# EC2 Instance Module
module "ec2" {
  source = "../../modules/compute/aws/ec2"

  for_each = { for idx, instance in var.ec2_instances : idx => instance }

  ami                                  = each.value.ami_id
  instance_type                        = each.value.instance_type
  subnet_id                            = module.subnet[each.key].subnet_id
  security_group_ids                   = [module.security_group[each.key].security_group_id]
  ec2_tags                             = each.value.ec2_tags
  disable_api_termination              = each.value.disable_api_termination
  monitoring                           = each.value.monitoring
  key_name                             = each.value.key_name
  associate_public_ip_address          = each.value.associate_public_ip_address
  availability_zone                    = each.value.availability_zone
  ebs_optimized                        = each.value.ebs_optimized
  iam_instance_profile                 = each.value.iam_instance_profile
  instance_initiated_shutdown_behavior = each.value.instance_initiated_shutdown_behavior
  user_data                            = each.value.user_data
  user_data_base64                     = each.value.user_data_base64

  root_volume_type           = each.value.root_volume_type
  root_volume_size           = each.value.root_volume_size
  root_delete_on_termination = each.value.root_delete_on_termination
  root_encrypted             = each.value.root_encrypted
  root_iops                  = each.value.root_iops
  root_kms_key_id            = each.value.root_kms_key_id
  volume_tags                = each.value.volume_tags

  ebs_block_devices = each.value.ebs_block_devices

  # Pass additional volumes to be attached
  additional_volumes = each.value.additional_volumes
}

# EKS Cluster Module
module "eks" {
  source = "../../modules/compute/aws/eks"

  for_each = { for idx, cluster in var.eks_clusters : idx => cluster if length(var.eks_clusters) > 0 }

  cluster_name              = each.value.cluster_name
  iam_role_arn              = each.value.iam_role_arn
  subnet_ids                = each.value.subnet_ids
  endpoint_public_access    = each.value.endpoint_public_access
  endpoint_private_access   = each.value.endpoint_private_access
  public_access_cidrs       = each.value.public_access_cidrs
  service_ipv4_cidr         = each.value.service_ipv4_cidr
  enabled_cluster_log_types = each.value.enabled_cluster_log_types
  eks_tags                  = each.value.eks_tags
}

# EKS Node Group Module
module "eks_node_group" {
  source = "../../modules/compute/aws/eks_node_group"

  for_each = { for idx, node_group in var.eks_node_groups : idx => node_group if length(var.eks_node_groups) > 0 }

  cluster_name              = each.value.cluster_name
  node_group_name           = each.value.node_group_name
  node_role_arn             = each.value.node_role_arn
  subnet_ids                = each.value.subnet_ids
  node_group_size           = each.value.node_group_size
  node_group_max_size       = each.value.node_group_max_size
  node_group_min_size       = each.value.node_group_min_size
  node_instance_type        = each.value.node_instance_type
  node_disk_size            = each.value.node_disk_size
  key_name                  = each.value.key_name
  source_security_group_ids = each.value.source_security_group_ids
  max_unavailable           = each.value.max_unavailable
  launch_template_id        = each.value.launch_template_id
  launch_template_version   = each.value.launch_template_version
  capacity_type             = each.value.capacity_type
  ami_type                  = each.value.ami_type
  node_group_tags           = each.value.node_group_tags
}

# EBS Volume Module
module "ebs" {
  source = "../../modules/storage/aws/ebs"

  for_each = { for idx, volume in var.ebs_volumes : idx => volume if length(var.ebs_volumes) > 0 }

  availability_zone = each.value.availability_zone
  size              = each.value.size
  volume_type       = each.value.volume_type
  encrypted         = each.value.encrypted
  iops              = each.value.iops
  kms_key_id        = each.value.kms_key_id
  ebs_tags          = each.value.ebs_tags
}

# S3 Bucket Module
module "s3" {
  source = "../../modules/storage/aws/s3"

  for_each = { for idx, bucket in var.s3_buckets : idx => bucket if length(var.s3_buckets) > 0 }

  bucket_name                 = each.value.bucket_name
  versioning_status           = each.value.versioning_status
  sse_algorithm               = each.value.sse_algorithm
  kms_master_key_id           = each.value.kms_master_key_id
  create_bucket               = each.value.create_bucket
  s3_tags                     = each.value.s3_tags
  bucket_policy               = each.value.bucket_policy
  cors_allowed_headers        = each.value.cors_allowed_headers
  cors_allowed_methods        = each.value.cors_allowed_methods
  cors_allowed_origins        = each.value.cors_allowed_origins
  cors_expose_headers         = each.value.cors_expose_headers
  cors_max_age_seconds        = each.value.cors_max_age_seconds
  enable_unlimited_cors_cache = each.value.enable_unlimited_cors_cache
  lifecycle_expiration_days   = each.value.lifecycle_expiration_days
  logging_target_bucket       = each.value.logging_target_bucket
  logging_target_prefix       = each.value.logging_target_prefix
  website_index_document      = each.value.website_index_document
  website_error_document      = each.value.website_error_document
}
