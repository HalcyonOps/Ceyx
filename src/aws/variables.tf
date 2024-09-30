variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 instance."
  type        = string
  default     = "t2.micro"
}

variable "region" {
  description = "The AWS region to deploy the instance."
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID to deploy the instance."
  type        = string
}

variable "security_group_ids" {
  description = "A list of security group IDs to assign to the instance."
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "bucket_name" {
  description = "The name of the S3 bucket."
  type        = string
}

variable "name" {
  description = "The name of the EC2 instance."
  type        = string
}

variable "subnet_cidr_block" {
  description = "The CIDR block for the subnet."
  type        = string
}

variable "availability_zone" {
  description = "The availability zone for the subnet."
  type        = string
}

variable "cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "compute_tags" {
  description = "A map of tags to assign to the EC2 instance."
  type        = map(string)
  default     = {}
}

variable "storage_tags" {
  description = "A map of tags to assign to the S3 bucket."
  type        = map(string)
  default     = {}
}

variable "versioning_status" {
  description = "The status of versioning for the S3 bucket (Enabled or Suspended)."
  type        = string
  default     = "Enabled" # or "Suspended"
}
