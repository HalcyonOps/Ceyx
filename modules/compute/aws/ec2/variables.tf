variable "ami" {
  description = "The AMI ID to use for the instance"
  type        = string
  validation {
    condition     = length(var.ami) > 0
    error_message = "The AMI ID must not be empty."
  }
}

variable "disable_api_termination" {
  description = "If true, enables EC2 Instance Termination Protection"
  type        = bool
  default     = false
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  validation {
    condition     = length(var.instance_type) > 0
    error_message = "The instance type must not be empty."
  }
}

variable "monitoring" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
  type        = bool
  default     = false
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
  validation {
    condition     = length(var.subnet_id) > 0
    error_message = "The subnet ID must not be empty."
  }
}

variable "ec2_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = []
}

variable "key_name" {
  description = "The key name to use for the instance"
  type        = string
  default     = null
}

variable "associate_public_ip_address" {
  description = "If true, the EC2 instance will have a public IP address"
  type        = bool
  default     = false
}

variable "availability_zone" {
  description = "The availability zone to launch the instance in"
  type        = string
  default     = null
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized"
  type        = bool
  default     = false
}

variable "iam_instance_profile" {
  description = "The IAM instance profile to associate with the instance"
  type        = string
  default     = null
}

variable "instance_initiated_shutdown_behavior" {
  description = "Shutdown behavior for the instance"
  type        = string
  default     = "stop"
  validation {
    condition     = contains(["stop", "terminate"], var.instance_initiated_shutdown_behavior)
    error_message = "The shutdown behavior must be either 'stop' or 'terminate'."
  }
}

variable "user_data" {
  description = "The user data to provide when launching the instance"
  type        = string
  default     = null
}

variable "user_data_base64" {
  description = "The Base64-encoded user data to provide when launching the instance"
  type        = string
  default     = null
}

variable "volume_tags" {
  description = "A map of tags to assign to the volumes"
  type        = map(string)
  default     = {}
}

variable "root_volume_type" {
  description = "The type of volume for the root block device"
  type        = string
  default     = "gp2"
  validation {
    condition     = contains(["standard", "gp2", "gp3", "io1", "io2", "sc1", "st1"], var.root_volume_type)
    error_message = "The root volume type must be one of 'standard', 'gp2', 'gp3', 'io1', 'io2', 'sc1', or 'st1'."
  }
}

variable "root_volume_size" {
  description = "The size of the root volume in gigabytes"
  type        = number
  default     = 8
  validation {
    condition     = var.root_volume_size > 0
    error_message = "The root volume size must be greater than 0."
  }
}

variable "root_delete_on_termination" {
  description = "Whether the root volume should be deleted on termination"
  type        = bool
  default     = true
}

variable "root_encrypted" {
  description = "Whether the root volume should be encrypted"
  type        = bool
  default     = false
}

variable "root_iops" {
  description = "The number of IOPS to provision for the root volume"
  type        = number
  default     = null
}

variable "root_kms_key_id" {
  description = "The ARN of the KMS key to use for encryption of the root volume"
  type        = string
  default     = null
}

variable "ebs_block_devices" {
  description = "Additional EBS block devices to attach to the instance"
  type = list(object({
    device_name           = string
    volume_type           = string
    volume_size           = number
    delete_on_termination = bool
    encrypted             = bool
    iops                  = number
    kms_key_id            = string
  }))
  default = []
}
