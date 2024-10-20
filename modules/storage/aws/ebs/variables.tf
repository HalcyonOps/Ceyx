variable "availability_zone" {
  description = "The availability zone in which to create the volume"
  type        = string
  validation {
    condition     = length(var.availability_zone) > 0
    error_message = "The availability zone must not be empty."
  }
}

variable "size" {
  description = "The size of the volume in gigabytes"
  type        = number
  validation {
    condition     = var.size > 0
    error_message = "The size of the volume must be greater than 0."
  }
}

variable "volume_type" {
  description = "The type of volume"
  type        = string
  default     = "gp2"
  validation {
    condition     = contains(["standard", "gp2", "gp3", "io1", "io2", "sc1", "st1"], var.volume_type)
    error_message = "The volume type must be one of 'standard', 'gp2', 'gp3', 'io1', 'io2', 'sc1', or 'st1'."
  }
}

variable "encrypted" {
  description = "Whether the volume should be encrypted"
  type        = bool
  default     = false
}

variable "iops" {
  description = "The number of IOPS to provision for the volume. This is only valid for io1, io2, and gp3 volume types."
  type        = number
  default     = null
}

variable "kms_key_id" {
  description = "The ARN of the KMS key to use for encryption"
  type        = string
  default     = null
}

variable "ebs_tags" {
  description = "A map of tags to assign to the EBS volume"
  type        = map(string)
  default     = {}
}

variable "create_snapshot" {
  description = "Whether to create a snapshot of the volume"
  type        = bool
  default     = false
}

variable "snapshot_tags" {
  description = "A map of tags to assign to the snapshot"
  type        = map(string)
  default     = {}
}

variable "encryption_by_default" {
  description = "Whether to enable EBS encryption by default"
  type        = bool
  default     = false
}
