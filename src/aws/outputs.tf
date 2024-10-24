# src/aws/outputs.tf

# Subnet Module Outputs
output "subnet_id" {
  description = "The ID of all subnets"
  value       = [for key, s in module.subnet : s.subnet_id]
}

output "subnet_arn" {
  description = "The ARN of all subnets"
  value       = [for key, s in module.subnet : s.subnet_arn]
}

output "subnet_cidr_block" {
  description = "The CIDR block of all subnets"
  value       = [for key, s in module.subnet : s.subnet_cidr_block]
}

output "subnet_ipv6_cidr_block" {
  description = "The IPv6 CIDR block of all subnets"
  value       = [for key, s in module.subnet : s.subnet_ipv6_cidr_block]
}

output "subnet_availability_zone" {
  description = "The availability zone of all subnets"
  value       = [for key, s in module.subnet : s.subnet_availability_zone]
}

output "subnet_map_public_ip_on_launch" {
  description = "Whether to map public IPs on launch"
  value       = [for key, s in module.subnet : s.subnet_map_public_ip_on_launch]
}

output "subnet_assign_ipv6_address_on_creation" {
  description = "Whether to assign an IPv6 address on creation"
  value       = [for key, s in module.subnet : s.subnet_assign_ipv6_address_on_creation]
}

# VPC Module Outputs
output "vpc_id" {
  description = "The ID of all VPCs"
  value       = [for key, v in module.vpc : v.vpc_id]
}

output "vpc_arn" {
  description = "The ARN of all VPCs"
  value       = [for key, v in module.vpc : v.vpc_arn]
}

output "vpc_cidr_block" {
  description = "The CIDR block of all VPCs"
  value       = [for key, v in module.vpc : v.vpc_cidr_block]
}

output "vpc_ipv6_cidr_block" {
  description = "The IPv6 CIDR block of all VPCs"
  value       = [for key, v in module.vpc : v.vpc_ipv6_cidr_block]
}

output "vpc_enable_dns_support" {
  description = "Whether DNS support is enabled in all VPCs"
  value       = [for key, v in module.vpc : v.vpc_enable_dns_support]
}

output "vpc_enable_dns_hostnames" {
  description = "Whether DNS hostnames are enabled in all VPCs"
  value       = [for key, v in module.vpc : v.vpc_enable_dns_hostnames]
}

output "internet_gateway_id" {
  description = "The ID of all Internet Gateways"
  value       = [for key, v in module.vpc : v.internet_gateway_id]
}

# Security Group Module Outputs
output "security_group_id" {
  description = "The ID of all security groups"
  value       = [for key, sg in module.security_group : sg.security_group_id]
}

output "security_group_arn" {
  description = "The ARN of all security groups"
  value       = [for key, sg in module.security_group : sg.security_group_arn]
}

output "security_group_name" {
  description = "The name of all security groups"
  value       = [for key, sg in module.security_group : sg.security_group_name]
}

output "security_group_vpc_id" {
  description = "The VPC ID of all security groups"
  value       = [for key, sg in module.security_group : sg.security_group_vpc_id]
}

output "ec2_instance_id" {
  description = "The ID of all EC2 instances"
  value       = [for key, ec2 in module.ec2 : ec2.instance_id]
}

output "ec2_instance_public_ip" {
  description = "The public IP address of all EC2 instances"
  value       = [for key, ec2 in module.ec2 : try(ec2.public_ip, "N/A")]
}

output "ec2_instance_private_ip" {
  description = "The private IP address of all EC2 instances"
  value       = [for key, ec2 in module.ec2 : try(ec2.private_ip, "N/A")]
}

output "ec2_root_volume_id" {
  description = "The ID of root EBS volumes for all EC2 instances"
  value       = [for key, ec2 in module.ec2 : try(ec2.root_volume_id, "N/A")]
}

output "ec2_ebs_volumes" {
  description = "The list of EBS volumes attached to all EC2 instances"
  value       = [for key, ec2 in module.ec2 : try(ec2.ebs_volumes, [])]
}

# EKS Cluster Module Outputs
output "eks_cluster_id" {
  description = "The ID of all EKS clusters"
  value       = [for key, eks in module.eks : eks.cluster_id]
}

output "eks_cluster_endpoint" {
  description = "The endpoint of all EKS clusters"
  value       = [for key, eks in module.eks : eks.cluster_endpoint]
}

output "eks_cluster_arn" {
  description = "The ARN of all EKS clusters"
  value       = [for key, eks in module.eks : eks.cluster_arn]
}

output "eks_cluster_version" {
  description = "The version of all EKS clusters"
  value       = [for key, eks in module.eks : eks.cluster_version]
}

output "eks_cluster_certificate_authority" {
  description = "The certificate authority data for all EKS clusters"
  value       = [for key, eks in module.eks : eks.cluster_certificate_authority]
}

output "eks_cluster_oidc_issuer" {
  description = "The OIDC issuer URL for all EKS clusters"
  value       = [for key, eks in module.eks : eks.cluster_oidc_issuer]
}

# EBS Volume Module Outputs
output "ebs_volume_id" {
  description = "The ID of all EBS volumes"
  value       = [for key, ebs in module.ebs : ebs.volume_id]
}

output "ebs_volume_size" {
  description = "The size of all EBS volumes"
  value       = [for key, ebs in module.ebs : ebs.volume_size]
}

output "ebs_volume_type" {
  description = "The type of all EBS volumes"
  value       = [for key, ebs in module.ebs : ebs.volume_type]
}

output "ebs_volume_iops" {
  description = "The IOPS of all EBS volumes"
  value       = [for key, ebs in module.ebs : ebs.volume_iops]
}

# S3 Bucket Module Outputs
output "bucket_id" {
  description = "The ID of all S3 buckets"
  value       = [for key, b in module.s3 : b.bucket_id]
}

output "bucket_arn" {
  description = "The ARN of all S3 buckets"
  value       = [for key, b in module.s3 : b.bucket_arn]
}

output "bucket_website_endpoint" {
  description = "The website endpoint of all S3 buckets"
  value       = [for key, b in module.s3 : b.bucket_website_endpoint]
}

output "bucket_policy" {
  description = "The policy of all S3 buckets"
  value       = [for key, b in module.s3 : b.bucket_policy]
}
