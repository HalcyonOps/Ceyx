
variable "bucket_name" {
  description = "The name of the S3 bucket."
  type        = string
}

variable "acl" {
  description = "The access control list for the bucket."
  type        = string
  default     = "private"
}

variable "versioning_status" {
  description = "The status of versioning (Enabled or Suspended)."
  type        = string
  default     = "Enabled"
}

variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
  default     = {}
}

variable "region" {
  description = "The AWS region to deploy resources."
  type        = string
}
